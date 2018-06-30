#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "x86.h"
#include "xv_vi_globals.h"

struct paraph {
    struct paraph *prev;
    struct paraph *next;
    char content[PARAPH_SIZE];
    int size;
};

struct paraph firstParaph;
struct paraph *headParaphPtr;
struct paraph *currentParaphPtr;
struct paraph *showParaphPtr;
char buf[128];
char *fileName;
int editPos;
int openedfd;
int bufCount;


void vStart() {
    vInit();
    openedfd = vOpen();
    vLoad();
    close(openedfd);
    vShow();
    vigetorset(VI_SET, GET_OR_SET_INVI, VI_START);  //syscall
}

void vExit() {
    vigetorset(VI_SET, GET_OR_SET_INVI, VI_OVER);
    exit();
}

void vDebug(char *sentence) {
    printf(1, "debug: %s \n", sentence);
}

int vOpen() {
    int fd;
    if ((fd = open(fileName, O_RDWR)) < 0) {
        fd = open(fileName, O_CREATE | O_RDWR);
    }
    return fd;
}

void vSave() {
    struct paraph *savedParaph;
    char isFirst = 1;
    openedfd = vOpen();
    savedParaph = headParaphPtr;
    while (1) {
        if (savedParaph == 0) break;
        if (isFirst > 0) {
            isFirst = 0;
        } else {
            write(openedfd, "\n", 1);
        }
        write(openedfd, savedParaph->content, savedParaph->size);
        savedParaph = savedParaph->next;
    }
    close(openedfd);
}

void vLoad() {
    while (1) {
        bufCount = read(openedfd, buf, 128);
        if (bufCount <= 0) break;
        --bufCount;
        for (int i = 0; i < bufCount; ++i) {
            if (buf[i] == NEW_PARAPH) {
                currentParaphPtr = vAppend(currentParaphPtr);
                editPos = 0;
            } else {
                currentParaphPtr->content[editPos++] = buf[i];
                ++(currentParaphPtr->size);
            }
        }
    }
    return;
}

void vClear() {
    for (int i = 0; i < MAX_CONSOLE_HEIGHT; ++i) {
        printf(1, "\n");
    }
    //
}

void vShow() {
    struct paraph *paraphToShow = showParaphPtr;
    int counter = 0;
    while (1) {
        if (paraphToShow == 0) break;
        if (counter != 0) {
            printf(1, "\n");
            counter += MAX_LINE_LEN;
        }
        printf(1, paraphToShow->content);
        counter += paraphToShow->size;

        paraphToShow = paraphToShow->next;
    }

    for (int i = 0; i < MAX_CONSOLE_HEIGHT - LINES_OF(counter); ++i) {
        printf(1, "\n");
    }

    printf(1, "--READ MODE--");
}

struct paraph *vAppend(struct paraph *pre) {
    struct paraph *newParaph = (struct paraph *) sbrk(sizeof(struct paraph));
    memset(newParaph->content, 0, PARAPH_SIZE);
    editPos = 0;
    newParaph->size = 0;
    newParaph->prev = pre;
    newParaph->next = pre->next;
    pre->next = newParaph;
    if (newParaph->next != 0) {
        newParaph->next->prev = newParaph;
    }
    return newParaph;
}

void vRead() {
    switch (vigetorset(VI_GET, GET_OR_SET_READSTAT, VI_GET)) {
        case READ_SHOW:
            vShow();
            break;
        case READ_CLEAR:
            vClear();
            break;
        case READ_READ:
            break;
        default:
            break;
    }
    return;
}

void vEdit() {
    switch (vigetorset(VI_GET, GET_OR_SET_EDITSTAT, VI_GET)) {
        case EDIT_EDIT:
            vSync();
            break;
        case EDIT_APP:
            currentParaphPtr = vAppend(currentParaphPtr);
            vigetorset(VI_SET, GET_OR_SET_EDITSTAT, EDIT_EDIT);
            break;
        default:
            break;
    }
    return;
}

void vCtrl() {
    if (vigetorset(VI_GET, GET_OR_SET_CTRLSTAT, VI_GET) & CTRL_EXEC) {
        switch (vigetorset(VI_GET, GET_OR_SET_CTRLSTAT, VI_GET)) {
            case CTRL_CTRL | CTRL_EXEC:
                break;
            case CTRL_EXIT | CTRL_EXEC:
                vigetorset(VI_SET, GET_OR_SET_CTRLSTAT, CTRL_CTRL);
                vExit();
                break;
            case CTRL_SAVE | CTRL_EXEC:
                vigetorset(VI_SET, GET_OR_SET_CTRLSTAT, CTRL_CTRL);
                vSave();
                break;
            case CTRL_EXIT | CTRL_SAVE | CTRL_EXEC:
                vigetorset(VI_SET, GET_OR_SET_CTRLSTAT, CTRL_CTRL);
                vSave();
                vClear();
                vExit();
                break;
            default:
                break;
        }
    }
    return;
}

void vInit() {
    firstParaph.size = 0;
    firstParaph.prev = 0;
    firstParaph.next = 0;
    openedfd = 0;
    memset(firstParaph.content, 0, PARAPH_SIZE);
    memset(buf, 0, 128);
    showParaphPtr = &firstParaph;
    currentParaphPtr = &firstParaph;
    headParaphPtr = &firstParaph;
    editPos = 0;
    bufCount = 0;
}

void vSync() {
    char c = viexch();
    if (c > 0) {
        currentParaphPtr->content[editPos++] = c;
        currentParaphPtr->size += 1;
    }
    return;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        printf(1, "vi is a user-cmd to open and edit a file!\n");
        exit();
    }
    fileName = argv[1];
    vStart();
    while (1) {
        switch (vigetorset(VI_GET, GET_OR_SET_VIMODE, VI_GET)) {
            case READ_MODE:
                vRead();
                break;
            case EDIT_MODE:
                vEdit();
                break;
            case CTRL_MODE:
                vCtrl();
                break;
            default:
                break;
        }
    }
    vExit();
}


