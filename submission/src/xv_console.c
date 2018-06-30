// Console input and output.
// Input is from the keyboard or serial port.
// Output is written to the screen and serial port.

#include "types.h"
#include "defs.h"
#include "param.h"
#include "traps.h"
#include "spinlock.h"
#include "fs.h"
#include "file.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"

#include "xv_color.h"
#include "xv_defs.h"
#include "xv_vi_globals.h"

// static void consputc(int);
// static void color_consputc(int);

static int panicked = 0;
inVi = 0;
ctrlFlag = 0;
editStat = 0;
ctrlStat = 0;
readStat = 0;
lastpos = 0;
currentpos = 0;
Exchsize = 0;
swap_pos = 0;

static struct {
    struct spinlock lock;
    int locking;
} xv_cons;

//edit distance defines
#define COPY 0
#define REPLACE 1
#define DELETE 2
#define INSERT 3
#define TWIDDLE 4
#define KILL 5

//direction keys
#define KEY_UP 0xE2
#define KEY_DOWN 0xE3
#define KEY_LEFT 0xE4
#define KEY_RIGHT 0xE5

#define CUR_BACKGROUND 0x9000
#define CUR_MASK 0x6fff

//auto complete
int cost[6] = {1, 1, 1, 1, 1, 1}; //cost of each type of edit
#define MAX_COST 0x7fffffff
#define TOLERANCE 3 //tolerance of difference

#define XV_CMD_NUM 21
#define XV_KEYWORD_MAXNUM 20
#define XV_KEYWORD_LENGTH 10

//all command here
char cmdtable[XV_CMD_NUM][XV_KEYWORD_LENGTH] = {
        "cat", "echo", "exec", "grep", "init",
        "kill", "ln", "ls", "mkdir", "rm",
        "stressfs", "usertests", "wc", "zombie", "console",
        "sh", "xvecho", "alias", "unalias", "vi","listvar"};

struct Highlight {
    int start;
    int end;
};

struct Highlight highlightlist[100]; //highlight information
int tohighlight = 0;                 //next highlight information index

int isKeyWord(const char *str) {
    for (int i = 0; i < XV_CMD_NUM; i++) {
        if (strlen(cmdtable[i]) == strlen(str) &&
            strncmp(cmdtable[i], str, strlen(str)) == 0)
            return 1;
    }
    return 0;
}

float difference(char *x, char *z);

int autocomplete(char *input) {
    if (input[0] == '\0') //no input
        return -1;
    int index = 0;
    int minIndex = -1;
    float minDiff = MAX_COST;
    for (; index < XV_CMD_NUM; ++index) {
        if (input[0] != cmdtable[index][0]) //different first letter!
            continue;
        float d = difference(input, cmdtable[index]);
        if (d < minDiff) {
            minDiff = d;
            minIndex = index;
        }
    }
    if (minDiff > TOLERANCE)
        return -1;
    strncpy(input, cmdtable[minIndex], 20);
    return minIndex;
}

float difference(char *x, char *z) {
    //init
    int dp[2 * XV_KEYWORD_LENGTH][XV_KEYWORD_LENGTH] = {0};
    int m = strlen(x);
    int n = strlen(z);
    dp[0][0] = 0;
    for (int i = 1; i <= m; i++) {
        dp[i][0] = i * cost[DELETE];
    }
    for (int j = 1; j <= n; j++) {
        dp[0][j] = j * cost[INSERT];
    }

    //bottom up dp
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            dp[i + 1][j + 1] = MAX_COST;
            int temp;
            //copy
            if (x[i] == z[j]) {
                temp = dp[i][j] + cost[COPY];
                if (temp < dp[i + 1][j + 1]) {
                    dp[i + 1][j + 1] = temp;
                }
            }
            //replace
            if (x[i] != z[j]) {
                temp = dp[i][j] + cost[REPLACE];
                if (temp < dp[i + 1][j + 1]) {
                    dp[i + 1][j + 1] = temp;
                }
            }
            //delete
            temp = dp[i][j + 1] + cost[DELETE];
            if (temp < dp[i + 1][j + 1]) {
                dp[i + 1][j + 1] = temp;
            }
            //insert
            temp = dp[i + 1][j] + cost[INSERT];
            if (temp < dp[i + 1][j + 1]) {
                dp[i + 1][j + 1] = temp;
            }
            //twidle
            if (i != 0 && j != 0 && x[i] == z[j - 1] && x[i - 1] == z[j]) {
                temp = dp[i - 1][j - 1] + cost[TWIDDLE];
                if (temp < dp[i + 1][j + 1]) {
                    dp[i + 1][j + 1] = temp;
                }
            }
        }
    }
    //kill
    for (int i = 1; i < m; i++) {
        if (dp[i][n] + cost[KILL] < dp[m][n]) {
            dp[m][n] = dp[i][n] + cost[KILL];
        }
    }
    return 1.0 * dp[m][n] / n;
}

static void
printint(int xx, int base, int sign) {
    static char digits[] = "0123456789abcdef";
    char buf[16];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
        x = -xx;
    else
        x = xx;

    i = 0;
    do {
        buf[i++] = digits[x % base];
    } while ((x /= base) != 0);

    if (sign)
        buf[i++] = '-';

    while (--i >= 0)
        consputc(buf[i]);
}
//PAGEBREAK: 50

static void
color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh) {
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (sgn && xx < 0) {
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    }

    i = 0;
    do {
        buf[i++] = digits[x % base];
    } while ((x /= base) != 0);
    if (neg)
        buf[i++] = '-';

    while (--i >= 0)
        color_consputc(parseFont(buf[i], forec, foreh, backc, backh));
}

// Print to the console. only understands %d, %x, %p, %s.
void cprintf(char *fmt, ...) {
    int i, c, locking;
    uint *argp;
    char *s;

    locking = xv_cons.locking;
    if (locking)
        acquire(&xv_cons.lock);

    if (fmt == 0)
        panic("null fmt");

    argp = (uint *) (void *) (&fmt + 1);
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
        if (c != '%') {
            consputc(c);
            continue;
        }
        c = fmt[++i] & 0xff;
        if (c == 0)
            break;
        switch (c) {
            case 'd':
                printint(*argp++, 10, 1);
                break;
            case 'x':
            case 'p':
                printint(*argp++, 16, 0);
                break;
            case 's':
                if ((s = (char *) *argp++) == 0)
                    s = "(null)";
                for (; *s; s++)
                    consputc(*s);
                break;
            case '%':
                consputc('%');
                break;
            default:
                // Print unknown % sequence to draw attention.
                consputc('%');
                consputc(c);
                break;
        }
    }

    if (locking)
        release(&xv_cons.lock);
}

// Print to the console. only understands %d, %x, %p, %s.
void color_cprintf(int forec, int foreh, int backc, int backh, char *fmt, ...) {
    int i, c, locking;
    uint *argp;
    char *s;

    locking = xv_cons.locking;
    if (locking)
        acquire(&xv_cons.lock);

    if (fmt == 0)
        panic("null fmt");

    argp = (uint *) (void *) (&fmt + 1);
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
        if (c != '%') {
            color_consputc(parseFont(c, forec, foreh, backc, backh));
            continue;
        }
        c = fmt[++i] & 0xff;
        if (c == 0)
            break;
        switch (c) {
            case 'd':
                color_printint(*argp++, 10, 1, forec, foreh, backc, backh);
                break;
            case 'x':
            case 'p':
                color_printint(*argp++, 16, 0, forec, foreh, backc, backh);
                break;
            case 's':
                if ((s = (char *) *argp++) == 0)
                    s = "(null)";
                for (; *s; s++)
                    color_consputc(parseFont(*s, forec, foreh, backc, backh));
                break;
            case '%':
                color_consputc(parseFont('%', forec, foreh, backc, backh));
                break;
            default:
                // Print unknown % sequence to draw attention.
                consputc('%');
                consputc(c);
                break;
        }
    }

    if (locking)
        release(&xv_cons.lock);
}

void panic(char *s) {
    int i;
    uint pcs[10];

    cli();
    xv_cons.locking = 0;
    cprintf("cpu%d: panic: ", cpu->id);
    cprintf(s);
    cprintf("\n");
    getcallerpcs(&s, pcs);
    for (i = 0; i < 10; i++)
        cprintf(" %p", pcs[i]);
    panicked = 1; // freeze other CPU
    for (;;);
}

void color_panic(char *s, int forec, int foreh, int backc, int backh) {
    int i;
    uint pcs[10];

    cli();
    xv_cons.locking = 0;
    cprintf("cpu%d: panic: ", cpu->id);
    color_cprintf(forec, foreh, backc, backh, s);
    cprintf("\n");
    getcallerpcs(&s, pcs);
    for (i = 0; i < 10; i++)
        cprintf(" %p", pcs[i]);
    panicked = 1; // freeze other CPU
    for (;;);
}

//PAGEBREAK: 50
#define BACKSPACE 0x100
#define CRTPORT 0x3d4
static ushort *crt = (ushort *) P2V(0xb8000); // CGA memory

void cgaputc(int c) {
    int pos;

    // Cursor position: col + 80*row.
    outb(CRTPORT, 14);
    pos = inb(CRTPORT + 1) << 8;
    outb(CRTPORT, 15);
    pos |= inb(CRTPORT + 1);

    if (c == '\n') {
        crt[pos] = ' ' | 0x0700;
        pos += 80 - pos % 80;
    } else if (c == BACKSPACE) {
        if (pos > 0) {
            crt[pos] = ' ' | 0x0700;
            --pos;
        }
    } else if (c == KEY_UP) {
        if (pos >= 80) {
            crt[pos] &= CUR_MASK;
            pos -= 80;
        }
    } else if (c == KEY_DOWN) {
        crt[pos] &= CUR_MASK;
        pos += 80;
    } else if (c == KEY_LEFT) {
        if (pos > 0) {
            crt[pos] &= CUR_MASK;
            pos--;
        }
    } else if (c == KEY_RIGHT) {
        if (pos < 24 * 80) {
            crt[pos] &= CUR_MASK;
            pos++;
        }
    } else
        crt[pos++] = c | 0x0700;

    if ((pos / 80) >= 24) { // Scroll up.
        memmove(crt, crt + 80, sizeof(crt[0]) * 23 * 80);
        pos -= 80;
        memset(crt + pos, 0, sizeof(crt[0]) * (24 * 80 - pos));
    }

    outb(CRTPORT, 14);
    outb(CRTPORT + 1, pos >> 8);
    outb(CRTPORT, 15);
    outb(CRTPORT + 1, pos);
    crt[pos] |= CUR_BACKGROUND;
}

static void
color_cgaputc(int c) {
    int pos;

    // Cursor position: col + 80*row.
    outb(CRTPORT, 14);
    pos = inb(CRTPORT + 1) << 8;
    outb(CRTPORT, 15);
    pos |= inb(CRTPORT + 1);

    if (c == '\n') {
        crt[pos] = ' ' | 0x0700;
        pos += 80 - pos % 80;
    } else if (c == BACKSPACE) {
        if (pos > 0) {
            crt[pos] = ' ' | 0x0700;
            --pos;
        }
    } else if (c == KEY_UP) {
        if (pos >= 80) {
            crt[pos] &= CUR_MASK;
            pos -= 80;
        }
    } else if (c == KEY_DOWN) {
        crt[pos] &= CUR_MASK;
        pos += 80;
    } else if (c == KEY_LEFT) {
        if (pos > 0) {
            crt[pos] &= CUR_MASK;
            pos--;
        }
    } else if (c == KEY_RIGHT) {
        if (pos < 24 * 80) {
            crt[pos] &= CUR_MASK;
            pos++;
        }
    } else
        crt[pos++] = c; //output font with color

    if ((pos / 80) >= 24) { // Scroll up.
        memmove(crt, crt + 80, sizeof(crt[0]) * 23 * 80);
        pos -= 80;
        memset(crt + pos, 0, sizeof(crt[0]) * (24 * 80 - pos));
    }

    outb(CRTPORT, 14);
    outb(CRTPORT + 1, pos >> 8);
    outb(CRTPORT, 15);
    outb(CRTPORT + 1, pos);
    crt[pos] |= CUR_BACKGROUND;
}

void consputc(int c) {
    if (panicked) {
        cli();
        for (;;);
    }

    if (c == BACKSPACE) {
        uartputc('\b');
        uartputc(' ');
        uartputc('\b');
    } else
        uartputc(c);
    cgaputc(c);
}

//new
void color_consputc(int c) {
    if (panicked) {
        cli();
        for (;;);
    }

    if (c == BACKSPACE) {
        uartputc('\b');
        uartputc(' ');
        uartputc('\b');
    } else
        uartputc(c & 0xff);
    color_cgaputc(c);
}

#define INPUT_BUF 128
struct {
    struct spinlock lock;
    char buf[INPUT_BUF];
    uint r; // Read index
    uint w; // Write index
    uint e; // Edit index
} input;

#define EDIT_BUF 2048
struct {
    struct spinlock lock;
    char buf[EDIT_BUF];
    char ctrlcmd[16];
    uint r;
    uint w;
    uint e;
    uint cmd_e;
} par_buf;

#define RECORD_LEN 128
#define RECORD_NUM 80
struct {
    char record[RECORD_NUM][RECORD_LEN];
    uint r_l[RECORD_NUM];	// each record length
    uint r_n;	// record number
    uint r_c;	// record current index
} records;

#define C(x) ((x) - '@') // Control-x

void consoleintr(int (*getc)(void)) {
    int c;
    int j;
    acquire(&input.lock);
    while ((c = getc()) >= 0) {
        switch (c) {
            case C('P'): // Process listing.
                procdump();
                break;
            case C('U'): // Kill line.
                while (input.e != input.w &&
                       input.buf[(input.e - 1) % INPUT_BUF] != '\n') {
                    input.e--;
                    consputc(BACKSPACE);
                }
                break;
            case C('H'):
            case '\x7f': // Backspace
                if (input.e != input.w) {
                    if (tohighlight > 0 && highlightlist[tohighlight - 1].end == input.e - 1) {
                        int startIndex = highlightlist[tohighlight - 1].start;
                        int wordlength = highlightlist[tohighlight - 1].end - startIndex + 1;
                        int word[20];
                        int j = 0;
                        for (; j < wordlength; j++) {
                            word[j] = input.buf[startIndex + j];
                        }
                        word[j] = '\0';
                        for (int k = 0; k < wordlength; k++) {
                            consputc(BACKSPACE);
                            input.e--;
                        }
                        for (j = 0; j < wordlength; j++) {
                            input.buf[startIndex + j] = word[j];
                            consputc(word[j]);
                            input.e++;
                        }
                        tohighlight--;
                    }
                    input.e--;
                    consputc(BACKSPACE);
                }
                break;
            case C('F'): //auto complete
                if (input.e == input.w)
                    break;
                int startIndex;
                for (startIndex = input.e - 1; startIndex != input.w && input.buf[startIndex] != ' ';
                     startIndex--);
                if (input.buf[startIndex] == ' ')
                    startIndex = (startIndex + 1) % INPUT_BUF;
                int wordlength = input.e - startIndex;
                char word[20];
                int j = 0;
                for (; j < wordlength; j++) {
                    word[j] = input.buf[startIndex + j];
                }
                word[j] = '\0';
                int findflag = autocomplete(word);
                if (findflag != -1) {
                    int newwordlength = strlen(word);
                    //correct, auto complete and highlight
                    for (int k = 0; k < wordlength; k++) {
                        consputc(BACKSPACE);
                        input.e--;
                    }
                    for (j = 0; j < newwordlength; j++) {
                        input.buf[startIndex + j] = word[j];
                        color_consputc(parseFont(word[j], XV_YELLOW, 1, XV_BLACK, 0));
                        input.e++;
                    }
                    highlightlist[tohighlight].start = startIndex;
                    highlightlist[tohighlight].end = input.e - 1;
                    tohighlight++;
                }
                break;
            case KEY_LEFT:
                input.e--;
                consputc(KEY_LEFT);
                break;
            case KEY_RIGHT:
                input.e++;
                consputc(KEY_RIGHT);
                break;
            case KEY_UP:
                while(input.e != input.w &&
                      input.buf[(input.e-1) % INPUT_BUF] != '\n'){
                  input.e--;
                  consputc(BACKSPACE);
                }
                if(records.r_c > 0){
                  records.r_c--;
                  int i = 0;
                  for(i = 0; i < records.r_l[records.r_c]; i++){
                    input.buf[input.e++ % INPUT_BUF] = records.record[records.r_c][i];
                    consputc(records.record[records.r_c][i]);
                      //decide if this is a key word to be highlighted
                      int startIndex;
                      for (startIndex = input.e - 1; startIndex != input.w && input.buf[startIndex] != ' ';
                           startIndex--);
                      if (input.buf[startIndex] == ' ')
                          startIndex = (startIndex + 1) % INPUT_BUF;
                      int wordlength = input.e - startIndex;
                      char word[20];
                      int j = 0;
                      for (; j < wordlength; j++) {
                          word[j] = input.buf[startIndex + j];
                      }
                      word[j] = '\0';
                      if (isKeyWord(word) == 1) {
                          int newwordlength = strlen(word);
                          //highlight
                          while (input.e > startIndex) {
                              input.e--;
                              consputc(BACKSPACE);
                          }
                          for (j = 0; j < newwordlength; j++) {
                              input.buf[startIndex + j] = word[j];
                              color_consputc(parseFont(word[j], XV_YELLOW, 1, XV_BLACK, 0));
                              input.e++;
                          }
                          highlightlist[tohighlight].start = startIndex;
                          highlightlist[tohighlight].end = input.e - 1;
                          tohighlight++;
                      }
                  }
                }
                break;
            case KEY_DOWN:
                while(input.e != input.w &&
                      input.buf[(input.e-1) % INPUT_BUF] != '\n'){
                  input.e--;
                  consputc(BACKSPACE);
                }
                if(records.r_c < records.r_n){
                  records.r_c++;
                  int i = 0;
                  for(i = 0; i < records.r_l[records.r_c]; i++){
                    input.buf[input.e++ % INPUT_BUF] = records.record[records.r_c][i];
                    consputc(records.record[records.r_c][i]);
                    //decide if this is a key word to be highlighted
                    int startIndex;
                    for (startIndex = input.e - 1; startIndex != input.w && input.buf[startIndex] != ' ';
                        startIndex--);
                    if (input.buf[startIndex] == ' ')
                        startIndex = (startIndex + 1) % INPUT_BUF;
                    int wordlength = input.e - startIndex;
                    char word[20];
                    int j = 0;
                    for (; j < wordlength; j++) {
                        word[j] = input.buf[startIndex + j];
                    }
                    word[j] = '\0';
                    if (isKeyWord(word) == 1) {
                        int newwordlength = strlen(word);
                        //highlight
                        while (input.e > startIndex) {
                            input.e--;
                            consputc(BACKSPACE);
                        }
                        for (j = 0; j < newwordlength; j++) {
                            input.buf[startIndex + j] = word[j];
                            color_consputc(parseFont(word[j], XV_YELLOW, 1, XV_BLACK, 0));
                            input.e++;
                        }
                        highlightlist[tohighlight].start = startIndex;
                        highlightlist[tohighlight].end = input.e - 1;
                        tohighlight++;
                    }
                  }
                }
                break;
            default:
                if (c != 0 && input.e - input.r < INPUT_BUF) {
                    c = (c == '\r') ? '\n' : c;
                    input.buf[input.e++ % INPUT_BUF] = c;
                    consputc(c);
                    //decide if this is a key word to be highlighted
                    int startIndex;
                    for (startIndex = input.e - 1; startIndex != input.w && input.buf[startIndex] != ' ';
                         startIndex--);
                    if (input.buf[startIndex] == ' ')
                        startIndex = (startIndex + 1) % INPUT_BUF;
                    int wordlength = input.e - startIndex;
                    char word[20];
                    int j = 0;
                    for (; j < wordlength; j++) {
                        word[j] = input.buf[startIndex + j];
                    }
                    word[j] = '\0';
                    if (isKeyWord(word) == 1) {
                        int newwordlength = strlen(word);
                        //highlight
                        while (input.e > startIndex) {
                            input.e--;
                            consputc(BACKSPACE);
                        }
                        for (j = 0; j < newwordlength; j++) {
                            input.buf[startIndex + j] = word[j];
                            color_consputc(parseFont(word[j], XV_YELLOW, 1, XV_BLACK, 0));
                            input.e++;
                        }
                        highlightlist[tohighlight].start = startIndex;
                        highlightlist[tohighlight].end = input.e - 1;
                        tohighlight++;
                    }
                    if (c == '\n' || c == C('D') || input.e == input.r + INPUT_BUF) {
                        uint temp_w = input.w;
                        uint temp_i = 0;
                        while(temp_w != input.e && input.buf[temp_w % INPUT_BUF] != '\n'){
                          records.record[records.r_n][temp_i] = input.buf[temp_w];
                          temp_i++;
                          temp_w++;
                        }
                        records.r_l[records.r_n] = temp_i;
                        records.r_n++;
                        records.r_c = records.r_n;
                        input.w = input.e;
                        wakeup(&input.r);
                    }
                }
                break;
        }
    }
    release(&input.lock);
}

int consoleread(struct inode *ip, char *dst, int n) {
    uint target;
    int c;

    iunlock(ip);
    target = n;
    acquire(&input.lock);
    while (n > 0) {
        while (input.r == input.w) {
            if (proc->killed) {
                release(&input.lock);
                ilock(ip);
                return -1;
            }
            sleep(&input.r, &input.lock);
        }
        c = input.buf[input.r++ % INPUT_BUF];
        if (c == C('D')) { // EOF
            if (n < target) {
                // Save ^D for next time, to make sure
                // caller gets a 0-byte result.
                input.r--;
            }
            break;
        }
        *dst++ = c;
        --n;
        if (c == '\n')
            break;
    }
    release(&input.lock);
    ilock(ip);

    return target - n;
}

int consolewrite(struct inode *ip, char *buf, int n) {
    int i;

    iunlock(ip);
    acquire(&xv_cons.lock);
    for (i = 0; i < n; i++)
        consputc(buf[i] & 0xff);
    release(&xv_cons.lock);
    ilock(ip);

    return n;
}

int consolecolorwrite(struct inode *ip, char *buf, int n, int forec, int foreh, int backc, int backh) {
    int i;

    iunlock(ip);
    acquire(&xv_cons.lock);
    for (i = 0; i < n; i++) {
        if (buf[i] != '\n' && buf[i] != BACKSPACE) {
            color_consputc(parseFont(buf[i], forec, foreh, backc, backh));
        } else
            consputc(buf[i] & 0xff);
    }
    release(&xv_cons.lock);
    ilock(ip);

    return n;
}

void consoleinit(void) {
    initlock(&xv_cons.lock, "xv_console");
    initlock(&input.lock, "input");
    initlock(&input.lock, "par_buf");

    devsw[CONSOLE].write = consolewrite;
    devsw[CONSOLE].read = consoleread;
    devsw[CONSOLE].colorwrite = consolecolorwrite;
    xv_cons.locking = 1;

    picenable(IRQ_KBD);
    ioapicenable(IRQ_KBD, 0);
}

void vintr(int (*getc)(void)) {
    int c;
    int j;
    acquire(&par_buf.lock);
    while ((c = getc()) >= 0) {
        if (mode == READ_MODE)      /////////////////////////////////////////////////////
        {
            switch (c) {
                case ':':
                    mode = CTRL_MODE;
                    outb(CRTPORT, 14);
                    currentpos = inb(CRTPORT + 1) << 8;
                    outb(CRTPORT, 15);
                    currentpos |= inb(CRTPORT + 1);
                    for (j = currentpos; j < CONSOLE_BOTTOM; j += 80) {
                        consputc(KEY_DOWN);
                    }
                    for (j = currentpos % 80; j > 0; --j) {
                        consputc(KEY_LEFT);
                    }
                    for (j = 0; j < 13; ++j)
                        consputc(' ');
                    for (; j > 0; --j)
                        consputc(KEY_LEFT);
                    consputc(':');
                    lastpos = currentpos;
                    break;
                case 'e':
                    mode = EDIT_MODE;
                    outb(CRTPORT, 14);
                    currentpos = inb(CRTPORT + 1) << 8;
                    outb(CRTPORT, 15);
                    currentpos |= inb(CRTPORT + 1);
                    for (j = currentpos; j < CONSOLE_BOTTOM; j += 80) {
                        consputc(KEY_DOWN);
                    }
                    for (j = currentpos % 80; j > 0; --j) {
                        consputc(KEY_LEFT);
                    }
                    char inReadStr[13] = "--EDIT MODE--";
                    for (j = 0; j < 13; ++j) {
                        consputc(inReadStr[j]);
                    }

                    lastpos = currentpos;
                    outb(CRTPORT, 14);
                    currentpos = inb(CRTPORT + 1) << 8;
                    outb(CRTPORT, 15);
                    currentpos |= inb(CRTPORT + 1);

                    for (j = currentpos / 80 - lastpos / 80; j > 0; --j) {
                        consputc(KEY_UP);
                    }
                    if (lastpos % 80 < currentpos % 80) {
                        for (j = currentpos % 80 - lastpos % 80; j > 0; --j) {
                            consputc(KEY_LEFT);
                        }
                    } else if (lastpos % 80 > currentpos % 80) {
                        for (j = lastpos % 80 - currentpos % 80; j > 0; --j) {
                            consputc(KEY_RIGHT);
                        }
                    }
                    break;
                case 'h':
                case KEY_LEFT:
                    par_buf.e--;
                    consputc(KEY_LEFT);
                    break;
                case 'l':
                case KEY_RIGHT:
                    par_buf.e++;
                    consputc(KEY_RIGHT);
                    break;
                case 'k':
                case KEY_UP:
                    par_buf.e -= 80;
                    consputc(KEY_UP);
                    break;
                case 'j':
                case KEY_DOWN:
                    par_buf.e += 80;
                    consputc(KEY_DOWN);
                    break;
                default:
                    break;
            }
        } else if (mode == EDIT_MODE)          //////////////////////////////////////////
        {
            switch (c) {
                case KEY_ESC:
                    mode = READ_MODE;
                    outb(CRTPORT, 14);
                    currentpos = inb(CRTPORT + 1) << 8;
                    outb(CRTPORT, 15);
                    currentpos |= inb(CRTPORT + 1);
                    for (j = currentpos; j < CONSOLE_BOTTOM; j += 80) {
                        consputc(KEY_DOWN);
                    }
                    for (j = currentpos % 80; j > 0; --j) {
                        consputc(KEY_LEFT);
                    }
                    char inReadStr[13] = "--READ MODE--";
                    for (j = 0; j < 13; ++j) {
                        consputc(inReadStr[j]);
                    }

                    lastpos = currentpos;
                    outb(CRTPORT, 14);
                    currentpos = inb(CRTPORT + 1) << 8;
                    outb(CRTPORT, 15);
                    currentpos |= inb(CRTPORT + 1);

                    for (j = currentpos / 80 - lastpos / 80; j > 0; --j) {
                        consputc(KEY_UP);
                    }
                    if (lastpos % 80 < currentpos % 80) {
                        for (j = currentpos % 80 - lastpos % 80; j > 0; --j) {
                            consputc(KEY_LEFT);
                        }
                    } else if (lastpos % 80 > currentpos % 80) {
                        for (j = lastpos % 80 - currentpos % 80; j > 0; --j) {
                            consputc(KEY_RIGHT);
                        }
                    }
                    break;
                case KEY_LEFT:
                    par_buf.e--;
                    consputc(KEY_LEFT);
                    break;
                case KEY_RIGHT:
                    par_buf.e++;
                    consputc(KEY_RIGHT);
                    break;
                case KEY_UP:
                    par_buf.e -= 80;
                    consputc(KEY_UP);
                    break;
                case KEY_DOWN:
                    par_buf.e += 80;
                    consputc(KEY_DOWN);
                    break;
                case '\x7f': // Backspace
                    if (par_buf.e != par_buf.w) {
                        par_buf.e--;
                        consputc(BACKSPACE);
                    }
                    break;
                default:
                    if (c == '\n' || c == '\r') {
                        editStat = EDIT_APP;
                    }
                    if (c != 0 && par_buf.e - par_buf.r < EDIT_BUF) {
                        c = (c == '\r') ? '\n' : c;
                        par_buf.buf[par_buf.e++ % EDIT_BUF] = c;
                        Exchcontent[Exchsize++ % EDIT_BUF] = c;
                        consputc(c);
                    }
                    if (c == '\n' || c == C('D') || par_buf.e == par_buf.r + EDIT_BUF) {
                        par_buf.w = par_buf.e;
                        wakeup(&par_buf.r);
                    }
                    break;
            }
        } else if (mode == CTRL_MODE)        ///////////////////////////////////////
        {
            switch (c) {
                case KEY_ESC:
                    mode = READ_MODE;
                    outb(CRTPORT, 14);
                    currentpos = inb(CRTPORT + 1) << 8;
                    outb(CRTPORT, 15);
                    currentpos |= inb(CRTPORT + 1);
                    for (j = currentpos % 80; j > 0; --j) {
                        consputc(KEY_LEFT);
                    }
                    char inReadStr[13] = "--READ MODE--";
                    for (j = 0; j < 13; ++j) {
                        consputc(inReadStr[j]);
                    }
                    outb(CRTPORT, 14);
                    currentpos = inb(CRTPORT + 1) << 8;
                    outb(CRTPORT, 15);
                    currentpos |= inb(CRTPORT + 1);
                    for (j = currentpos / 80 - lastpos / 80; j > 0; --j) {
                        consputc(KEY_UP);
                    }
                    if (lastpos % 80 < currentpos % 80) {
                        for (j = currentpos % 80 - lastpos % 80; j > 0; --j) {
                            consputc(KEY_LEFT);
                        }
                    } else if (lastpos % 80 > currentpos % 80) {
                        for (j = lastpos % 80 - currentpos % 80; j > 0; --j) {
                            consputc(KEY_RIGHT);
                        }
                    }
                    par_buf.cmd_e = 0;
                    break;
                case KEY_DOWN:
                case KEY_LEFT:
                case KEY_UP:
                case KEY_RIGHT:
                    break;
                case '\x7f': // Backspace
                    if (par_buf.e != par_buf.w) {
                        par_buf.e--;
                        consputc(BACKSPACE);
                    }
                    break;
                case '\r':
                case '\n':
                    if(par_buf.cmd_e==0) break;
                    ctrlStat |= CTRL_EXEC;
                    outb(CRTPORT, 14);
                    currentpos = inb(CRTPORT + 1) << 8;
                    outb(CRTPORT, 15);
                    currentpos |= inb(CRTPORT + 1);
                    for (j = currentpos % 80; j > 0; --j)consputc(KEY_LEFT);
                    for (; j < currentpos % 80; ++j)consputc(' ');
                    for (j = currentpos % 80; j > 0; --j)consputc(KEY_LEFT);
                    par_buf.w = par_buf.e;
                    memset(par_buf.ctrlcmd, 0, 16);
                    par_buf.cmd_e = 0;
                    wakeup(&par_buf.r);
                    break;
                default:
                    if (par_buf.cmd_e >= 16)break;
                    par_buf.ctrlcmd[par_buf.cmd_e++] = c;

                    if (c == 'w') ctrlStat |= CTRL_SAVE;
                    if (c == 'q') ctrlStat |= CTRL_EXIT;

                    if (c != 0 && par_buf.e - par_buf.r < EDIT_BUF) {
                        c = (c == '\r') ? '\n' : c;
                        par_buf.buf[par_buf.e++ % EDIT_BUF] = c;
                        consputc(c);
                    }
                    if (c == '\n' || c == C('D') || par_buf.e == par_buf.r + EDIT_BUF) {
                        par_buf.w = par_buf.e;
                        wakeup(&par_buf.r);
                    }
                    break;
            }
        }
    }
    release(&par_buf.lock);
}
