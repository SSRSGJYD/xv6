
_xvsh：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <init_shell>:
#include "xv_parse_command.h"
#include "xv_exec_command.h"
#include "xv_fork.h"

void init_shell(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 18             	sub    $0x18,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
       6:	83 ec 08             	sub    $0x8,%esp
       9:	6a 02                	push   $0x2
       b:	68 18 38 00 00       	push   $0x3818
      10:	e8 a4 04 00 00       	call   4b9 <open>
      15:	83 c4 10             	add    $0x10,%esp
      18:	89 45 f4             	mov    %eax,-0xc(%ebp)
      1b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      1f:	78 10                	js     31 <init_shell+0x31>
  {
    unlink("variables");
      21:	83 ec 0c             	sub    $0xc,%esp
      24:	68 18 38 00 00       	push   $0x3818
      29:	e8 9b 04 00 00       	call   4c9 <unlink>
      2e:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
      31:	83 ec 08             	sub    $0x8,%esp
      34:	68 02 02 00 00       	push   $0x202
      39:	68 18 38 00 00       	push   $0x3818
      3e:	e8 76 04 00 00       	call   4b9 <open>
      43:	83 c4 10             	add    $0x10,%esp
      46:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
      49:	83 ec 0c             	sub    $0xc,%esp
      4c:	ff 75 f4             	pushl  -0xc(%ebp)
      4f:	e8 4d 04 00 00       	call   4a1 <close>
      54:	83 c4 10             	add    $0x10,%esp
}
      57:	90                   	nop
      58:	c9                   	leave  
      59:	c3                   	ret    

0000005a <exit_shell>:

void reader_loop(void);

void exit_shell(void)
{
      5a:	55                   	push   %ebp
      5b:	89 e5                	mov    %esp,%ebp
      5d:	83 ec 08             	sub    $0x8,%esp
  exit();
      60:	e8 14 04 00 00       	call   479 <exit>

00000065 <main>:
}

int main()
{
      65:	8d 4c 24 04          	lea    0x4(%esp),%ecx
      69:	83 e4 f0             	and    $0xfffffff0,%esp
      6c:	ff 71 fc             	pushl  -0x4(%ecx)
      6f:	55                   	push   %ebp
      70:	89 e5                	mov    %esp,%ebp
      72:	51                   	push   %ecx
      73:	83 ec 04             	sub    $0x4,%esp
  //init shell
  init_shell();
      76:	e8 85 ff ff ff       	call   0 <init_shell>

  // Read and run input commands.
  reader_loop();
      7b:	e8 13 00 00 00       	call   93 <reader_loop>
  
  //exit shell
  exit_shell();
      80:	e8 d5 ff ff ff       	call   5a <exit_shell>
      85:	b8 00 00 00 00       	mov    $0x0,%eax
}
      8a:	83 c4 04             	add    $0x4,%esp
      8d:	59                   	pop    %ecx
      8e:	5d                   	pop    %ebp
      8f:	8d 61 fc             	lea    -0x4(%ecx),%esp
      92:	c3                   	ret    

00000093 <reader_loop>:

int getcmd(char *buf, int nbuf);

//read in input and process
void reader_loop()
{
      93:	55                   	push   %ebp
      94:	89 e5                	mov    %esp,%ebp
      96:	83 ec 18             	sub    $0x18,%esp
    static char buf[100];
    int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("xv_console", O_RDWR)) >= 0){
      99:	eb 16                	jmp    b1 <reader_loop+0x1e>
    if(fd >= 3){
      9b:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
      9f:	7e 10                	jle    b1 <reader_loop+0x1e>
      close(fd);
      a1:	83 ec 0c             	sub    $0xc,%esp
      a4:	ff 75 f4             	pushl  -0xc(%ebp)
      a7:	e8 f5 03 00 00       	call   4a1 <close>
      ac:	83 c4 10             	add    $0x10,%esp
      break;
      af:	eb 1b                	jmp    cc <reader_loop+0x39>
{
    static char buf[100];
    int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("xv_console", O_RDWR)) >= 0){
      b1:	83 ec 08             	sub    $0x8,%esp
      b4:	6a 02                	push   $0x2
      b6:	68 22 38 00 00       	push   $0x3822
      bb:	e8 f9 03 00 00       	call   4b9 <open>
      c0:	83 c4 10             	add    $0x10,%esp
      c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
      c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      ca:	79 cf                	jns    9b <reader_loop+0x8>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      cc:	e9 c7 00 00 00       	jmp    198 <reader_loop+0x105>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      d1:	0f b6 05 20 46 00 00 	movzbl 0x4620,%eax
      d8:	3c 63                	cmp    $0x63,%al
      da:	75 5f                	jne    13b <reader_loop+0xa8>
      dc:	0f b6 05 21 46 00 00 	movzbl 0x4621,%eax
      e3:	3c 64                	cmp    $0x64,%al
      e5:	75 54                	jne    13b <reader_loop+0xa8>
      e7:	0f b6 05 22 46 00 00 	movzbl 0x4622,%eax
      ee:	3c 20                	cmp    $0x20,%al
      f0:	75 49                	jne    13b <reader_loop+0xa8>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      f2:	83 ec 0c             	sub    $0xc,%esp
      f5:	68 20 46 00 00       	push   $0x4620
      fa:	e8 b8 01 00 00       	call   2b7 <strlen>
      ff:	83 c4 10             	add    $0x10,%esp
     102:	83 e8 01             	sub    $0x1,%eax
     105:	c6 80 20 46 00 00 00 	movb   $0x0,0x4620(%eax)
      if(chdir(buf+3) < 0)
     10c:	b8 23 46 00 00       	mov    $0x4623,%eax
     111:	83 ec 0c             	sub    $0xc,%esp
     114:	50                   	push   %eax
     115:	e8 cf 03 00 00       	call   4e9 <chdir>
     11a:	83 c4 10             	add    $0x10,%esp
     11d:	85 c0                	test   %eax,%eax
     11f:	79 77                	jns    198 <reader_loop+0x105>
        printf(2, "cannot cd %s\n", buf+3);
     121:	b8 23 46 00 00       	mov    $0x4623,%eax
     126:	83 ec 04             	sub    $0x4,%esp
     129:	50                   	push   %eax
     12a:	68 2d 38 00 00       	push   $0x382d
     12f:	6a 02                	push   $0x2
     131:	e8 ef 05 00 00       	call   725 <printf>
     136:	83 c4 10             	add    $0x10,%esp
      continue;
     139:	eb 5d                	jmp    198 <reader_loop+0x105>
    }
    struct cmd* cmd = parsecmd(buf);
     13b:	83 ec 0c             	sub    $0xc,%esp
     13e:	68 20 46 00 00       	push   $0x4620
     143:	e8 f4 24 00 00       	call   263c <parsecmd>
     148:	83 c4 10             	add    $0x10,%esp
     14b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cmd->type == CMD_CAL)
     14e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     151:	8b 00                	mov    (%eax),%eax
     153:	83 f8 06             	cmp    $0x6,%eax
     156:	75 24                	jne    17c <reader_loop+0xe9>
    {
      struct calcmd *calcmd = (struct calcmd*)cmd;
     158:	8b 45 f0             	mov    -0x10(%ebp),%eax
     15b:	89 45 ec             	mov    %eax,-0x14(%ebp)
      if(fork1() == 0)
     15e:	e8 31 0d 00 00       	call   e94 <fork1>
     163:	85 c0                	test   %eax,%eax
     165:	75 0e                	jne    175 <reader_loop+0xe2>
        runCalcmd(calcmd);
     167:	83 ec 0c             	sub    $0xc,%esp
     16a:	ff 75 ec             	pushl  -0x14(%ebp)
     16d:	e8 4d 15 00 00       	call   16bf <runCalcmd>
     172:	83 c4 10             	add    $0x10,%esp
      wait();
     175:	e8 07 03 00 00       	call   481 <wait>
     17a:	eb 1c                	jmp    198 <reader_loop+0x105>
    }
    else
    {
      if(fork1() == 0)
     17c:	e8 13 0d 00 00       	call   e94 <fork1>
     181:	85 c0                	test   %eax,%eax
     183:	75 0e                	jne    193 <reader_loop+0x100>
        runcmd(cmd);
     185:	83 ec 0c             	sub    $0xc,%esp
     188:	ff 75 f0             	pushl  -0x10(%ebp)
     18b:	e8 3e 12 00 00       	call   13ce <runcmd>
     190:	83 c4 10             	add    $0x10,%esp
      wait();
     193:	e8 e9 02 00 00       	call   481 <wait>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     198:	83 ec 08             	sub    $0x8,%esp
     19b:	6a 64                	push   $0x64
     19d:	68 20 46 00 00       	push   $0x4620
     1a2:	e8 0e 00 00 00       	call   1b5 <getcmd>
     1a7:	83 c4 10             	add    $0x10,%esp
     1aa:	85 c0                	test   %eax,%eax
     1ac:	0f 89 1f ff ff ff    	jns    d1 <reader_loop+0x3e>
      if(fork1() == 0)
        runcmd(cmd);
      wait();
    }
  }
}
     1b2:	90                   	nop
     1b3:	c9                   	leave  
     1b4:	c3                   	ret    

000001b5 <getcmd>:

int getcmd(char *buf, int nbuf)
{
     1b5:	55                   	push   %ebp
     1b6:	89 e5                	mov    %esp,%ebp
     1b8:	83 ec 08             	sub    $0x8,%esp
  color_printf(XV_YELLOW,1,XV_BLACK,0,"$");
     1bb:	83 ec 0c             	sub    $0xc,%esp
     1be:	68 3b 38 00 00       	push   $0x383b
     1c3:	6a 00                	push   $0x0
     1c5:	6a 00                	push   $0x0
     1c7:	6a 01                	push   $0x1
     1c9:	6a 06                	push   $0x6
     1cb:	e8 7d 2c 00 00       	call   2e4d <color_printf>
     1d0:	83 c4 20             	add    $0x20,%esp
  printf(2," ");
     1d3:	83 ec 08             	sub    $0x8,%esp
     1d6:	68 3d 38 00 00       	push   $0x383d
     1db:	6a 02                	push   $0x2
     1dd:	e8 43 05 00 00       	call   725 <printf>
     1e2:	83 c4 10             	add    $0x10,%esp
  memset(buf, 0, nbuf);
     1e5:	8b 45 0c             	mov    0xc(%ebp),%eax
     1e8:	83 ec 04             	sub    $0x4,%esp
     1eb:	50                   	push   %eax
     1ec:	6a 00                	push   $0x0
     1ee:	ff 75 08             	pushl  0x8(%ebp)
     1f1:	e8 e8 00 00 00       	call   2de <memset>
     1f6:	83 c4 10             	add    $0x10,%esp
  gets(buf, nbuf);
     1f9:	83 ec 08             	sub    $0x8,%esp
     1fc:	ff 75 0c             	pushl  0xc(%ebp)
     1ff:	ff 75 08             	pushl  0x8(%ebp)
     202:	e8 24 01 00 00       	call   32b <gets>
     207:	83 c4 10             	add    $0x10,%esp
  if(buf[0] == 0) // EOF
     20a:	8b 45 08             	mov    0x8(%ebp),%eax
     20d:	0f b6 00             	movzbl (%eax),%eax
     210:	84 c0                	test   %al,%al
     212:	75 07                	jne    21b <getcmd+0x66>
    return -1;
     214:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     219:	eb 05                	jmp    220 <getcmd+0x6b>
  return 0;
     21b:	b8 00 00 00 00       	mov    $0x0,%eax
}
     220:	c9                   	leave  
     221:	c3                   	ret    

00000222 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     222:	55                   	push   %ebp
     223:	89 e5                	mov    %esp,%ebp
     225:	57                   	push   %edi
     226:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     227:	8b 4d 08             	mov    0x8(%ebp),%ecx
     22a:	8b 55 10             	mov    0x10(%ebp),%edx
     22d:	8b 45 0c             	mov    0xc(%ebp),%eax
     230:	89 cb                	mov    %ecx,%ebx
     232:	89 df                	mov    %ebx,%edi
     234:	89 d1                	mov    %edx,%ecx
     236:	fc                   	cld    
     237:	f3 aa                	rep stos %al,%es:(%edi)
     239:	89 ca                	mov    %ecx,%edx
     23b:	89 fb                	mov    %edi,%ebx
     23d:	89 5d 08             	mov    %ebx,0x8(%ebp)
     240:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     243:	90                   	nop
     244:	5b                   	pop    %ebx
     245:	5f                   	pop    %edi
     246:	5d                   	pop    %ebp
     247:	c3                   	ret    

00000248 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     248:	55                   	push   %ebp
     249:	89 e5                	mov    %esp,%ebp
     24b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     24e:	8b 45 08             	mov    0x8(%ebp),%eax
     251:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     254:	90                   	nop
     255:	8b 45 08             	mov    0x8(%ebp),%eax
     258:	8d 50 01             	lea    0x1(%eax),%edx
     25b:	89 55 08             	mov    %edx,0x8(%ebp)
     25e:	8b 55 0c             	mov    0xc(%ebp),%edx
     261:	8d 4a 01             	lea    0x1(%edx),%ecx
     264:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     267:	0f b6 12             	movzbl (%edx),%edx
     26a:	88 10                	mov    %dl,(%eax)
     26c:	0f b6 00             	movzbl (%eax),%eax
     26f:	84 c0                	test   %al,%al
     271:	75 e2                	jne    255 <strcpy+0xd>
    ;
  return os;
     273:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     276:	c9                   	leave  
     277:	c3                   	ret    

00000278 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     278:	55                   	push   %ebp
     279:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     27b:	eb 08                	jmp    285 <strcmp+0xd>
    p++, q++;
     27d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     281:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     285:	8b 45 08             	mov    0x8(%ebp),%eax
     288:	0f b6 00             	movzbl (%eax),%eax
     28b:	84 c0                	test   %al,%al
     28d:	74 10                	je     29f <strcmp+0x27>
     28f:	8b 45 08             	mov    0x8(%ebp),%eax
     292:	0f b6 10             	movzbl (%eax),%edx
     295:	8b 45 0c             	mov    0xc(%ebp),%eax
     298:	0f b6 00             	movzbl (%eax),%eax
     29b:	38 c2                	cmp    %al,%dl
     29d:	74 de                	je     27d <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     29f:	8b 45 08             	mov    0x8(%ebp),%eax
     2a2:	0f b6 00             	movzbl (%eax),%eax
     2a5:	0f b6 d0             	movzbl %al,%edx
     2a8:	8b 45 0c             	mov    0xc(%ebp),%eax
     2ab:	0f b6 00             	movzbl (%eax),%eax
     2ae:	0f b6 c0             	movzbl %al,%eax
     2b1:	29 c2                	sub    %eax,%edx
     2b3:	89 d0                	mov    %edx,%eax
}
     2b5:	5d                   	pop    %ebp
     2b6:	c3                   	ret    

000002b7 <strlen>:

uint
strlen(char *s)
{
     2b7:	55                   	push   %ebp
     2b8:	89 e5                	mov    %esp,%ebp
     2ba:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     2bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     2c4:	eb 04                	jmp    2ca <strlen+0x13>
     2c6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     2ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
     2cd:	8b 45 08             	mov    0x8(%ebp),%eax
     2d0:	01 d0                	add    %edx,%eax
     2d2:	0f b6 00             	movzbl (%eax),%eax
     2d5:	84 c0                	test   %al,%al
     2d7:	75 ed                	jne    2c6 <strlen+0xf>
    ;
  return n;
     2d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     2dc:	c9                   	leave  
     2dd:	c3                   	ret    

000002de <memset>:

void*
memset(void *dst, int c, uint n)
{
     2de:	55                   	push   %ebp
     2df:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     2e1:	8b 45 10             	mov    0x10(%ebp),%eax
     2e4:	50                   	push   %eax
     2e5:	ff 75 0c             	pushl  0xc(%ebp)
     2e8:	ff 75 08             	pushl  0x8(%ebp)
     2eb:	e8 32 ff ff ff       	call   222 <stosb>
     2f0:	83 c4 0c             	add    $0xc,%esp
  return dst;
     2f3:	8b 45 08             	mov    0x8(%ebp),%eax
}
     2f6:	c9                   	leave  
     2f7:	c3                   	ret    

000002f8 <strchr>:

char*
strchr(const char *s, char c)
{
     2f8:	55                   	push   %ebp
     2f9:	89 e5                	mov    %esp,%ebp
     2fb:	83 ec 04             	sub    $0x4,%esp
     2fe:	8b 45 0c             	mov    0xc(%ebp),%eax
     301:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     304:	eb 14                	jmp    31a <strchr+0x22>
    if(*s == c)
     306:	8b 45 08             	mov    0x8(%ebp),%eax
     309:	0f b6 00             	movzbl (%eax),%eax
     30c:	3a 45 fc             	cmp    -0x4(%ebp),%al
     30f:	75 05                	jne    316 <strchr+0x1e>
      return (char*)s;
     311:	8b 45 08             	mov    0x8(%ebp),%eax
     314:	eb 13                	jmp    329 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     316:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     31a:	8b 45 08             	mov    0x8(%ebp),%eax
     31d:	0f b6 00             	movzbl (%eax),%eax
     320:	84 c0                	test   %al,%al
     322:	75 e2                	jne    306 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     324:	b8 00 00 00 00       	mov    $0x0,%eax
}
     329:	c9                   	leave  
     32a:	c3                   	ret    

0000032b <gets>:

char*
gets(char *buf, int max)
{
     32b:	55                   	push   %ebp
     32c:	89 e5                	mov    %esp,%ebp
     32e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     331:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     338:	eb 42                	jmp    37c <gets+0x51>
    cc = read(0, &c, 1);
     33a:	83 ec 04             	sub    $0x4,%esp
     33d:	6a 01                	push   $0x1
     33f:	8d 45 ef             	lea    -0x11(%ebp),%eax
     342:	50                   	push   %eax
     343:	6a 00                	push   $0x0
     345:	e8 47 01 00 00       	call   491 <read>
     34a:	83 c4 10             	add    $0x10,%esp
     34d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     350:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     354:	7e 33                	jle    389 <gets+0x5e>
      break;
    buf[i++] = c;
     356:	8b 45 f4             	mov    -0xc(%ebp),%eax
     359:	8d 50 01             	lea    0x1(%eax),%edx
     35c:	89 55 f4             	mov    %edx,-0xc(%ebp)
     35f:	89 c2                	mov    %eax,%edx
     361:	8b 45 08             	mov    0x8(%ebp),%eax
     364:	01 c2                	add    %eax,%edx
     366:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     36a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     36c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     370:	3c 0a                	cmp    $0xa,%al
     372:	74 16                	je     38a <gets+0x5f>
     374:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     378:	3c 0d                	cmp    $0xd,%al
     37a:	74 0e                	je     38a <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     37c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     37f:	83 c0 01             	add    $0x1,%eax
     382:	3b 45 0c             	cmp    0xc(%ebp),%eax
     385:	7c b3                	jl     33a <gets+0xf>
     387:	eb 01                	jmp    38a <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     389:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     38a:	8b 55 f4             	mov    -0xc(%ebp),%edx
     38d:	8b 45 08             	mov    0x8(%ebp),%eax
     390:	01 d0                	add    %edx,%eax
     392:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     395:	8b 45 08             	mov    0x8(%ebp),%eax
}
     398:	c9                   	leave  
     399:	c3                   	ret    

0000039a <stat>:

int
stat(char *n, struct stat *st)
{
     39a:	55                   	push   %ebp
     39b:	89 e5                	mov    %esp,%ebp
     39d:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     3a0:	83 ec 08             	sub    $0x8,%esp
     3a3:	6a 00                	push   $0x0
     3a5:	ff 75 08             	pushl  0x8(%ebp)
     3a8:	e8 0c 01 00 00       	call   4b9 <open>
     3ad:	83 c4 10             	add    $0x10,%esp
     3b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     3b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     3b7:	79 07                	jns    3c0 <stat+0x26>
    return -1;
     3b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     3be:	eb 25                	jmp    3e5 <stat+0x4b>
  r = fstat(fd, st);
     3c0:	83 ec 08             	sub    $0x8,%esp
     3c3:	ff 75 0c             	pushl  0xc(%ebp)
     3c6:	ff 75 f4             	pushl  -0xc(%ebp)
     3c9:	e8 03 01 00 00       	call   4d1 <fstat>
     3ce:	83 c4 10             	add    $0x10,%esp
     3d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     3d4:	83 ec 0c             	sub    $0xc,%esp
     3d7:	ff 75 f4             	pushl  -0xc(%ebp)
     3da:	e8 c2 00 00 00       	call   4a1 <close>
     3df:	83 c4 10             	add    $0x10,%esp
  return r;
     3e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     3e5:	c9                   	leave  
     3e6:	c3                   	ret    

000003e7 <atoi>:

int
atoi(const char *s)
{
     3e7:	55                   	push   %ebp
     3e8:	89 e5                	mov    %esp,%ebp
     3ea:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     3ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     3f4:	eb 25                	jmp    41b <atoi+0x34>
    n = n*10 + *s++ - '0';
     3f6:	8b 55 fc             	mov    -0x4(%ebp),%edx
     3f9:	89 d0                	mov    %edx,%eax
     3fb:	c1 e0 02             	shl    $0x2,%eax
     3fe:	01 d0                	add    %edx,%eax
     400:	01 c0                	add    %eax,%eax
     402:	89 c1                	mov    %eax,%ecx
     404:	8b 45 08             	mov    0x8(%ebp),%eax
     407:	8d 50 01             	lea    0x1(%eax),%edx
     40a:	89 55 08             	mov    %edx,0x8(%ebp)
     40d:	0f b6 00             	movzbl (%eax),%eax
     410:	0f be c0             	movsbl %al,%eax
     413:	01 c8                	add    %ecx,%eax
     415:	83 e8 30             	sub    $0x30,%eax
     418:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     41b:	8b 45 08             	mov    0x8(%ebp),%eax
     41e:	0f b6 00             	movzbl (%eax),%eax
     421:	3c 2f                	cmp    $0x2f,%al
     423:	7e 0a                	jle    42f <atoi+0x48>
     425:	8b 45 08             	mov    0x8(%ebp),%eax
     428:	0f b6 00             	movzbl (%eax),%eax
     42b:	3c 39                	cmp    $0x39,%al
     42d:	7e c7                	jle    3f6 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     42f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     432:	c9                   	leave  
     433:	c3                   	ret    

00000434 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     434:	55                   	push   %ebp
     435:	89 e5                	mov    %esp,%ebp
     437:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     43a:	8b 45 08             	mov    0x8(%ebp),%eax
     43d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     440:	8b 45 0c             	mov    0xc(%ebp),%eax
     443:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     446:	eb 17                	jmp    45f <memmove+0x2b>
    *dst++ = *src++;
     448:	8b 45 fc             	mov    -0x4(%ebp),%eax
     44b:	8d 50 01             	lea    0x1(%eax),%edx
     44e:	89 55 fc             	mov    %edx,-0x4(%ebp)
     451:	8b 55 f8             	mov    -0x8(%ebp),%edx
     454:	8d 4a 01             	lea    0x1(%edx),%ecx
     457:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     45a:	0f b6 12             	movzbl (%edx),%edx
     45d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     45f:	8b 45 10             	mov    0x10(%ebp),%eax
     462:	8d 50 ff             	lea    -0x1(%eax),%edx
     465:	89 55 10             	mov    %edx,0x10(%ebp)
     468:	85 c0                	test   %eax,%eax
     46a:	7f dc                	jg     448 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     46c:	8b 45 08             	mov    0x8(%ebp),%eax
}
     46f:	c9                   	leave  
     470:	c3                   	ret    

00000471 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     471:	b8 01 00 00 00       	mov    $0x1,%eax
     476:	cd 40                	int    $0x40
     478:	c3                   	ret    

00000479 <exit>:
SYSCALL(exit)
     479:	b8 02 00 00 00       	mov    $0x2,%eax
     47e:	cd 40                	int    $0x40
     480:	c3                   	ret    

00000481 <wait>:
SYSCALL(wait)
     481:	b8 03 00 00 00       	mov    $0x3,%eax
     486:	cd 40                	int    $0x40
     488:	c3                   	ret    

00000489 <pipe>:
SYSCALL(pipe)
     489:	b8 04 00 00 00       	mov    $0x4,%eax
     48e:	cd 40                	int    $0x40
     490:	c3                   	ret    

00000491 <read>:
SYSCALL(read)
     491:	b8 05 00 00 00       	mov    $0x5,%eax
     496:	cd 40                	int    $0x40
     498:	c3                   	ret    

00000499 <write>:
SYSCALL(write)
     499:	b8 10 00 00 00       	mov    $0x10,%eax
     49e:	cd 40                	int    $0x40
     4a0:	c3                   	ret    

000004a1 <close>:
SYSCALL(close)
     4a1:	b8 15 00 00 00       	mov    $0x15,%eax
     4a6:	cd 40                	int    $0x40
     4a8:	c3                   	ret    

000004a9 <kill>:
SYSCALL(kill)
     4a9:	b8 06 00 00 00       	mov    $0x6,%eax
     4ae:	cd 40                	int    $0x40
     4b0:	c3                   	ret    

000004b1 <exec>:
SYSCALL(exec)
     4b1:	b8 07 00 00 00       	mov    $0x7,%eax
     4b6:	cd 40                	int    $0x40
     4b8:	c3                   	ret    

000004b9 <open>:
SYSCALL(open)
     4b9:	b8 0f 00 00 00       	mov    $0xf,%eax
     4be:	cd 40                	int    $0x40
     4c0:	c3                   	ret    

000004c1 <mknod>:
SYSCALL(mknod)
     4c1:	b8 11 00 00 00       	mov    $0x11,%eax
     4c6:	cd 40                	int    $0x40
     4c8:	c3                   	ret    

000004c9 <unlink>:
SYSCALL(unlink)
     4c9:	b8 12 00 00 00       	mov    $0x12,%eax
     4ce:	cd 40                	int    $0x40
     4d0:	c3                   	ret    

000004d1 <fstat>:
SYSCALL(fstat)
     4d1:	b8 08 00 00 00       	mov    $0x8,%eax
     4d6:	cd 40                	int    $0x40
     4d8:	c3                   	ret    

000004d9 <link>:
SYSCALL(link)
     4d9:	b8 13 00 00 00       	mov    $0x13,%eax
     4de:	cd 40                	int    $0x40
     4e0:	c3                   	ret    

000004e1 <mkdir>:
SYSCALL(mkdir)
     4e1:	b8 14 00 00 00       	mov    $0x14,%eax
     4e6:	cd 40                	int    $0x40
     4e8:	c3                   	ret    

000004e9 <chdir>:
SYSCALL(chdir)
     4e9:	b8 09 00 00 00       	mov    $0x9,%eax
     4ee:	cd 40                	int    $0x40
     4f0:	c3                   	ret    

000004f1 <dup>:
SYSCALL(dup)
     4f1:	b8 0a 00 00 00       	mov    $0xa,%eax
     4f6:	cd 40                	int    $0x40
     4f8:	c3                   	ret    

000004f9 <getpid>:
SYSCALL(getpid)
     4f9:	b8 0b 00 00 00       	mov    $0xb,%eax
     4fe:	cd 40                	int    $0x40
     500:	c3                   	ret    

00000501 <sbrk>:
SYSCALL(sbrk)
     501:	b8 0c 00 00 00       	mov    $0xc,%eax
     506:	cd 40                	int    $0x40
     508:	c3                   	ret    

00000509 <sleep>:
SYSCALL(sleep)
     509:	b8 0d 00 00 00       	mov    $0xd,%eax
     50e:	cd 40                	int    $0x40
     510:	c3                   	ret    

00000511 <uptime>:
SYSCALL(uptime)
     511:	b8 0e 00 00 00       	mov    $0xe,%eax
     516:	cd 40                	int    $0x40
     518:	c3                   	ret    

00000519 <colorwrite>:

//new here
SYSCALL(colorwrite)
     519:	b8 16 00 00 00       	mov    $0x16,%eax
     51e:	cd 40                	int    $0x40
     520:	c3                   	ret    

00000521 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     521:	55                   	push   %ebp
     522:	89 e5                	mov    %esp,%ebp
     524:	83 ec 18             	sub    $0x18,%esp
     527:	8b 45 0c             	mov    0xc(%ebp),%eax
     52a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     52d:	83 ec 04             	sub    $0x4,%esp
     530:	6a 01                	push   $0x1
     532:	8d 45 f4             	lea    -0xc(%ebp),%eax
     535:	50                   	push   %eax
     536:	ff 75 08             	pushl  0x8(%ebp)
     539:	e8 5b ff ff ff       	call   499 <write>
     53e:	83 c4 10             	add    $0x10,%esp
}
     541:	90                   	nop
     542:	c9                   	leave  
     543:	c3                   	ret    

00000544 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     544:	55                   	push   %ebp
     545:	89 e5                	mov    %esp,%ebp
     547:	53                   	push   %ebx
     548:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     54b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     552:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     556:	74 17                	je     56f <printint+0x2b>
     558:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     55c:	79 11                	jns    56f <printint+0x2b>
    neg = 1;
     55e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     565:	8b 45 0c             	mov    0xc(%ebp),%eax
     568:	f7 d8                	neg    %eax
     56a:	89 45 ec             	mov    %eax,-0x14(%ebp)
     56d:	eb 06                	jmp    575 <printint+0x31>
  } else {
    x = xx;
     56f:	8b 45 0c             	mov    0xc(%ebp),%eax
     572:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     575:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     57c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     57f:	8d 41 01             	lea    0x1(%ecx),%eax
     582:	89 45 f4             	mov    %eax,-0xc(%ebp)
     585:	8b 5d 10             	mov    0x10(%ebp),%ebx
     588:	8b 45 ec             	mov    -0x14(%ebp),%eax
     58b:	ba 00 00 00 00       	mov    $0x0,%edx
     590:	f7 f3                	div    %ebx
     592:	89 d0                	mov    %edx,%eax
     594:	0f b6 80 e0 44 00 00 	movzbl 0x44e0(%eax),%eax
     59b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     59f:	8b 5d 10             	mov    0x10(%ebp),%ebx
     5a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     5a5:	ba 00 00 00 00       	mov    $0x0,%edx
     5aa:	f7 f3                	div    %ebx
     5ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
     5af:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     5b3:	75 c7                	jne    57c <printint+0x38>
  if(neg)
     5b5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     5b9:	74 2d                	je     5e8 <printint+0xa4>
    buf[i++] = '-';
     5bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5be:	8d 50 01             	lea    0x1(%eax),%edx
     5c1:	89 55 f4             	mov    %edx,-0xc(%ebp)
     5c4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     5c9:	eb 1d                	jmp    5e8 <printint+0xa4>
    putc(fd, buf[i]);
     5cb:	8d 55 dc             	lea    -0x24(%ebp),%edx
     5ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5d1:	01 d0                	add    %edx,%eax
     5d3:	0f b6 00             	movzbl (%eax),%eax
     5d6:	0f be c0             	movsbl %al,%eax
     5d9:	83 ec 08             	sub    $0x8,%esp
     5dc:	50                   	push   %eax
     5dd:	ff 75 08             	pushl  0x8(%ebp)
     5e0:	e8 3c ff ff ff       	call   521 <putc>
     5e5:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     5e8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     5ec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     5f0:	79 d9                	jns    5cb <printint+0x87>
    putc(fd, buf[i]);
}
     5f2:	90                   	nop
     5f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     5f6:	c9                   	leave  
     5f7:	c3                   	ret    

000005f8 <getInteger>:

static int getInteger(double num)
{
     5f8:	55                   	push   %ebp
     5f9:	89 e5                	mov    %esp,%ebp
     5fb:	83 ec 18             	sub    $0x18,%esp
     5fe:	8b 45 08             	mov    0x8(%ebp),%eax
     601:	89 45 e8             	mov    %eax,-0x18(%ebp)
     604:	8b 45 0c             	mov    0xc(%ebp),%eax
     607:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     60a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     611:	eb 0e                	jmp    621 <getInteger+0x29>
  {
    num -= 1;
     613:	dd 45 e8             	fldl   -0x18(%ebp)
     616:	d9 e8                	fld1   
     618:	de e9                	fsubrp %st,%st(1)
     61a:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     61d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     621:	dd 45 e8             	fldl   -0x18(%ebp)
     624:	d9 e8                	fld1   
     626:	d9 c9                	fxch   %st(1)
     628:	df e9                	fucomip %st(1),%st
     62a:	dd d8                	fstp   %st(0)
     62c:	77 e5                	ja     613 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     62e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     631:	c9                   	leave  
     632:	c3                   	ret    

00000633 <printdbl>:

void printdbl(int fd, double num)
{
     633:	55                   	push   %ebp
     634:	89 e5                	mov    %esp,%ebp
     636:	83 ec 28             	sub    $0x28,%esp
     639:	8b 45 0c             	mov    0xc(%ebp),%eax
     63c:	89 45 e0             	mov    %eax,-0x20(%ebp)
     63f:	8b 45 10             	mov    0x10(%ebp),%eax
     642:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     645:	d9 ee                	fldz   
     647:	dd 45 e0             	fldl   -0x20(%ebp)
     64a:	d9 c9                	fxch   %st(1)
     64c:	df e9                	fucomip %st(1),%st
     64e:	dd d8                	fstp   %st(0)
     650:	76 18                	jbe    66a <printdbl+0x37>
  {
    putc(fd,'-');
     652:	83 ec 08             	sub    $0x8,%esp
     655:	6a 2d                	push   $0x2d
     657:	ff 75 08             	pushl  0x8(%ebp)
     65a:	e8 c2 fe ff ff       	call   521 <putc>
     65f:	83 c4 10             	add    $0x10,%esp
    num = -num;
     662:	dd 45 e0             	fldl   -0x20(%ebp)
     665:	d9 e0                	fchs   
     667:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     66a:	83 ec 08             	sub    $0x8,%esp
     66d:	ff 75 e4             	pushl  -0x1c(%ebp)
     670:	ff 75 e0             	pushl  -0x20(%ebp)
     673:	e8 80 ff ff ff       	call   5f8 <getInteger>
     678:	83 c4 10             	add    $0x10,%esp
     67b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     67e:	6a 01                	push   $0x1
     680:	6a 0a                	push   $0xa
     682:	ff 75 f0             	pushl  -0x10(%ebp)
     685:	ff 75 08             	pushl  0x8(%ebp)
     688:	e8 b7 fe ff ff       	call   544 <printint>
     68d:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     690:	db 45 f0             	fildl  -0x10(%ebp)
     693:	dd 45 e0             	fldl   -0x20(%ebp)
     696:	de e1                	fsubp  %st,%st(1)
     698:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     69b:	dd 45 e0             	fldl   -0x20(%ebp)
     69e:	dd 05 48 38 00 00    	fldl   0x3848
     6a4:	d9 c9                	fxch   %st(1)
     6a6:	df e9                	fucomip %st(1),%st
     6a8:	dd d8                	fstp   %st(0)
     6aa:	76 10                	jbe    6bc <printdbl+0x89>
    putc(fd,'.');
     6ac:	83 ec 08             	sub    $0x8,%esp
     6af:	6a 2e                	push   $0x2e
     6b1:	ff 75 08             	pushl  0x8(%ebp)
     6b4:	e8 68 fe ff ff       	call   521 <putc>
     6b9:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     6bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     6c3:	eb 49                	jmp    70e <printdbl+0xdb>
  {
    num = num*10;
     6c5:	dd 45 e0             	fldl   -0x20(%ebp)
     6c8:	dd 05 50 38 00 00    	fldl   0x3850
     6ce:	de c9                	fmulp  %st,%st(1)
     6d0:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     6d3:	83 ec 08             	sub    $0x8,%esp
     6d6:	ff 75 e4             	pushl  -0x1c(%ebp)
     6d9:	ff 75 e0             	pushl  -0x20(%ebp)
     6dc:	e8 17 ff ff ff       	call   5f8 <getInteger>
     6e1:	83 c4 10             	add    $0x10,%esp
     6e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     6e7:	6a 01                	push   $0x1
     6e9:	6a 0a                	push   $0xa
     6eb:	ff 75 f0             	pushl  -0x10(%ebp)
     6ee:	ff 75 08             	pushl  0x8(%ebp)
     6f1:	e8 4e fe ff ff       	call   544 <printint>
     6f6:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     6f9:	db 45 f0             	fildl  -0x10(%ebp)
     6fc:	dd 45 e0             	fldl   -0x20(%ebp)
     6ff:	de e1                	fsubp  %st,%st(1)
     701:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     704:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     708:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     70c:	7f 13                	jg     721 <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     70e:	dd 45 e0             	fldl   -0x20(%ebp)
     711:	dd 05 48 38 00 00    	fldl   0x3848
     717:	d9 c9                	fxch   %st(1)
     719:	df e9                	fucomip %st(1),%st
     71b:	dd d8                	fstp   %st(0)
     71d:	77 a6                	ja     6c5 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     71f:	eb 01                	jmp    722 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     721:	90                   	nop
    }
  }
}
     722:	90                   	nop
     723:	c9                   	leave  
     724:	c3                   	ret    

00000725 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     725:	55                   	push   %ebp
     726:	89 e5                	mov    %esp,%ebp
     728:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     72b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     732:	8d 45 0c             	lea    0xc(%ebp),%eax
     735:	83 c0 04             	add    $0x4,%eax
     738:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     73b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     742:	e9 88 01 00 00       	jmp    8cf <printf+0x1aa>
    c = fmt[i] & 0xff;
     747:	8b 55 0c             	mov    0xc(%ebp),%edx
     74a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     74d:	01 d0                	add    %edx,%eax
     74f:	0f b6 00             	movzbl (%eax),%eax
     752:	0f be c0             	movsbl %al,%eax
     755:	25 ff 00 00 00       	and    $0xff,%eax
     75a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     75d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     761:	75 2c                	jne    78f <printf+0x6a>
      if(c == '%'){
     763:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     767:	75 0c                	jne    775 <printf+0x50>
        state = '%';
     769:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     770:	e9 56 01 00 00       	jmp    8cb <printf+0x1a6>
      } else {
        putc(fd, c);
     775:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     778:	0f be c0             	movsbl %al,%eax
     77b:	83 ec 08             	sub    $0x8,%esp
     77e:	50                   	push   %eax
     77f:	ff 75 08             	pushl  0x8(%ebp)
     782:	e8 9a fd ff ff       	call   521 <putc>
     787:	83 c4 10             	add    $0x10,%esp
     78a:	e9 3c 01 00 00       	jmp    8cb <printf+0x1a6>
      }
    } else if(state == '%'){
     78f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     793:	0f 85 32 01 00 00    	jne    8cb <printf+0x1a6>
      if(c == 'd'){
     799:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     79d:	75 1e                	jne    7bd <printf+0x98>
        printint(fd, *ap, 10, 1);
     79f:	8b 45 e8             	mov    -0x18(%ebp),%eax
     7a2:	8b 00                	mov    (%eax),%eax
     7a4:	6a 01                	push   $0x1
     7a6:	6a 0a                	push   $0xa
     7a8:	50                   	push   %eax
     7a9:	ff 75 08             	pushl  0x8(%ebp)
     7ac:	e8 93 fd ff ff       	call   544 <printint>
     7b1:	83 c4 10             	add    $0x10,%esp
        ap++;
     7b4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     7b8:	e9 07 01 00 00       	jmp    8c4 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     7bd:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     7c1:	74 06                	je     7c9 <printf+0xa4>
     7c3:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     7c7:	75 1e                	jne    7e7 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     7c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     7cc:	8b 00                	mov    (%eax),%eax
     7ce:	6a 00                	push   $0x0
     7d0:	6a 10                	push   $0x10
     7d2:	50                   	push   %eax
     7d3:	ff 75 08             	pushl  0x8(%ebp)
     7d6:	e8 69 fd ff ff       	call   544 <printint>
     7db:	83 c4 10             	add    $0x10,%esp
        ap++;
     7de:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     7e2:	e9 dd 00 00 00       	jmp    8c4 <printf+0x19f>
      } else if(c == 's'){
     7e7:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     7eb:	75 46                	jne    833 <printf+0x10e>
        s = (char*)*ap;
     7ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
     7f0:	8b 00                	mov    (%eax),%eax
     7f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     7f5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     7f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     7fd:	75 25                	jne    824 <printf+0xff>
          s = "(null)";
     7ff:	c7 45 f4 40 38 00 00 	movl   $0x3840,-0xc(%ebp)
        while(*s != 0){
     806:	eb 1c                	jmp    824 <printf+0xff>
          putc(fd, *s);
     808:	8b 45 f4             	mov    -0xc(%ebp),%eax
     80b:	0f b6 00             	movzbl (%eax),%eax
     80e:	0f be c0             	movsbl %al,%eax
     811:	83 ec 08             	sub    $0x8,%esp
     814:	50                   	push   %eax
     815:	ff 75 08             	pushl  0x8(%ebp)
     818:	e8 04 fd ff ff       	call   521 <putc>
     81d:	83 c4 10             	add    $0x10,%esp
          s++;
     820:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     824:	8b 45 f4             	mov    -0xc(%ebp),%eax
     827:	0f b6 00             	movzbl (%eax),%eax
     82a:	84 c0                	test   %al,%al
     82c:	75 da                	jne    808 <printf+0xe3>
     82e:	e9 91 00 00 00       	jmp    8c4 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     833:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     837:	75 1d                	jne    856 <printf+0x131>
        putc(fd, *ap);
     839:	8b 45 e8             	mov    -0x18(%ebp),%eax
     83c:	8b 00                	mov    (%eax),%eax
     83e:	0f be c0             	movsbl %al,%eax
     841:	83 ec 08             	sub    $0x8,%esp
     844:	50                   	push   %eax
     845:	ff 75 08             	pushl  0x8(%ebp)
     848:	e8 d4 fc ff ff       	call   521 <putc>
     84d:	83 c4 10             	add    $0x10,%esp
        ap++;
     850:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     854:	eb 6e                	jmp    8c4 <printf+0x19f>
      } else if(c == '%'){
     856:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     85a:	75 17                	jne    873 <printf+0x14e>
        putc(fd, c);
     85c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     85f:	0f be c0             	movsbl %al,%eax
     862:	83 ec 08             	sub    $0x8,%esp
     865:	50                   	push   %eax
     866:	ff 75 08             	pushl  0x8(%ebp)
     869:	e8 b3 fc ff ff       	call   521 <putc>
     86e:	83 c4 10             	add    $0x10,%esp
     871:	eb 51                	jmp    8c4 <printf+0x19f>
      } else if(c == 'f'){ //for double
     873:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     877:	75 26                	jne    89f <printf+0x17a>
        double *dap = (double*)ap;
     879:	8b 45 e8             	mov    -0x18(%ebp),%eax
     87c:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     87f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     882:	dd 00                	fldl   (%eax)
     884:	83 ec 04             	sub    $0x4,%esp
     887:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     88b:	dd 1c 24             	fstpl  (%esp)
     88e:	ff 75 08             	pushl  0x8(%ebp)
     891:	e8 9d fd ff ff       	call   633 <printdbl>
     896:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     899:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     89d:	eb 25                	jmp    8c4 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     89f:	83 ec 08             	sub    $0x8,%esp
     8a2:	6a 25                	push   $0x25
     8a4:	ff 75 08             	pushl  0x8(%ebp)
     8a7:	e8 75 fc ff ff       	call   521 <putc>
     8ac:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     8af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8b2:	0f be c0             	movsbl %al,%eax
     8b5:	83 ec 08             	sub    $0x8,%esp
     8b8:	50                   	push   %eax
     8b9:	ff 75 08             	pushl  0x8(%ebp)
     8bc:	e8 60 fc ff ff       	call   521 <putc>
     8c1:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     8c4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     8cb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     8cf:	8b 55 0c             	mov    0xc(%ebp),%edx
     8d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8d5:	01 d0                	add    %edx,%eax
     8d7:	0f b6 00             	movzbl (%eax),%eax
     8da:	84 c0                	test   %al,%al
     8dc:	0f 85 65 fe ff ff    	jne    747 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     8e2:	90                   	nop
     8e3:	c9                   	leave  
     8e4:	c3                   	ret    

000008e5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     8e5:	55                   	push   %ebp
     8e6:	89 e5                	mov    %esp,%ebp
     8e8:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     8eb:	8b 45 08             	mov    0x8(%ebp),%eax
     8ee:	83 e8 08             	sub    $0x8,%eax
     8f1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     8f4:	a1 8c 46 00 00       	mov    0x468c,%eax
     8f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
     8fc:	eb 24                	jmp    922 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     8fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
     901:	8b 00                	mov    (%eax),%eax
     903:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     906:	77 12                	ja     91a <free+0x35>
     908:	8b 45 f8             	mov    -0x8(%ebp),%eax
     90b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     90e:	77 24                	ja     934 <free+0x4f>
     910:	8b 45 fc             	mov    -0x4(%ebp),%eax
     913:	8b 00                	mov    (%eax),%eax
     915:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     918:	77 1a                	ja     934 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     91a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     91d:	8b 00                	mov    (%eax),%eax
     91f:	89 45 fc             	mov    %eax,-0x4(%ebp)
     922:	8b 45 f8             	mov    -0x8(%ebp),%eax
     925:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     928:	76 d4                	jbe    8fe <free+0x19>
     92a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     92d:	8b 00                	mov    (%eax),%eax
     92f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     932:	76 ca                	jbe    8fe <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     934:	8b 45 f8             	mov    -0x8(%ebp),%eax
     937:	8b 40 04             	mov    0x4(%eax),%eax
     93a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     941:	8b 45 f8             	mov    -0x8(%ebp),%eax
     944:	01 c2                	add    %eax,%edx
     946:	8b 45 fc             	mov    -0x4(%ebp),%eax
     949:	8b 00                	mov    (%eax),%eax
     94b:	39 c2                	cmp    %eax,%edx
     94d:	75 24                	jne    973 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     94f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     952:	8b 50 04             	mov    0x4(%eax),%edx
     955:	8b 45 fc             	mov    -0x4(%ebp),%eax
     958:	8b 00                	mov    (%eax),%eax
     95a:	8b 40 04             	mov    0x4(%eax),%eax
     95d:	01 c2                	add    %eax,%edx
     95f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     962:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     965:	8b 45 fc             	mov    -0x4(%ebp),%eax
     968:	8b 00                	mov    (%eax),%eax
     96a:	8b 10                	mov    (%eax),%edx
     96c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     96f:	89 10                	mov    %edx,(%eax)
     971:	eb 0a                	jmp    97d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     973:	8b 45 fc             	mov    -0x4(%ebp),%eax
     976:	8b 10                	mov    (%eax),%edx
     978:	8b 45 f8             	mov    -0x8(%ebp),%eax
     97b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     97d:	8b 45 fc             	mov    -0x4(%ebp),%eax
     980:	8b 40 04             	mov    0x4(%eax),%eax
     983:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     98a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     98d:	01 d0                	add    %edx,%eax
     98f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     992:	75 20                	jne    9b4 <free+0xcf>
    p->s.size += bp->s.size;
     994:	8b 45 fc             	mov    -0x4(%ebp),%eax
     997:	8b 50 04             	mov    0x4(%eax),%edx
     99a:	8b 45 f8             	mov    -0x8(%ebp),%eax
     99d:	8b 40 04             	mov    0x4(%eax),%eax
     9a0:	01 c2                	add    %eax,%edx
     9a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9a5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     9a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
     9ab:	8b 10                	mov    (%eax),%edx
     9ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9b0:	89 10                	mov    %edx,(%eax)
     9b2:	eb 08                	jmp    9bc <free+0xd7>
  } else
    p->s.ptr = bp;
     9b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9b7:	8b 55 f8             	mov    -0x8(%ebp),%edx
     9ba:	89 10                	mov    %edx,(%eax)
  freep = p;
     9bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9bf:	a3 8c 46 00 00       	mov    %eax,0x468c
}
     9c4:	90                   	nop
     9c5:	c9                   	leave  
     9c6:	c3                   	ret    

000009c7 <morecore>:

static Header*
morecore(uint nu)
{
     9c7:	55                   	push   %ebp
     9c8:	89 e5                	mov    %esp,%ebp
     9ca:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     9cd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     9d4:	77 07                	ja     9dd <morecore+0x16>
    nu = 4096;
     9d6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     9dd:	8b 45 08             	mov    0x8(%ebp),%eax
     9e0:	c1 e0 03             	shl    $0x3,%eax
     9e3:	83 ec 0c             	sub    $0xc,%esp
     9e6:	50                   	push   %eax
     9e7:	e8 15 fb ff ff       	call   501 <sbrk>
     9ec:	83 c4 10             	add    $0x10,%esp
     9ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     9f2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     9f6:	75 07                	jne    9ff <morecore+0x38>
    return 0;
     9f8:	b8 00 00 00 00       	mov    $0x0,%eax
     9fd:	eb 26                	jmp    a25 <morecore+0x5e>
  hp = (Header*)p;
     9ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a02:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     a05:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a08:	8b 55 08             	mov    0x8(%ebp),%edx
     a0b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     a0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a11:	83 c0 08             	add    $0x8,%eax
     a14:	83 ec 0c             	sub    $0xc,%esp
     a17:	50                   	push   %eax
     a18:	e8 c8 fe ff ff       	call   8e5 <free>
     a1d:	83 c4 10             	add    $0x10,%esp
  return freep;
     a20:	a1 8c 46 00 00       	mov    0x468c,%eax
}
     a25:	c9                   	leave  
     a26:	c3                   	ret    

00000a27 <malloc>:

void*
malloc(uint nbytes)
{
     a27:	55                   	push   %ebp
     a28:	89 e5                	mov    %esp,%ebp
     a2a:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     a2d:	8b 45 08             	mov    0x8(%ebp),%eax
     a30:	83 c0 07             	add    $0x7,%eax
     a33:	c1 e8 03             	shr    $0x3,%eax
     a36:	83 c0 01             	add    $0x1,%eax
     a39:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     a3c:	a1 8c 46 00 00       	mov    0x468c,%eax
     a41:	89 45 f0             	mov    %eax,-0x10(%ebp)
     a44:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a48:	75 23                	jne    a6d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     a4a:	c7 45 f0 84 46 00 00 	movl   $0x4684,-0x10(%ebp)
     a51:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a54:	a3 8c 46 00 00       	mov    %eax,0x468c
     a59:	a1 8c 46 00 00       	mov    0x468c,%eax
     a5e:	a3 84 46 00 00       	mov    %eax,0x4684
    base.s.size = 0;
     a63:	c7 05 88 46 00 00 00 	movl   $0x0,0x4688
     a6a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     a6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a70:	8b 00                	mov    (%eax),%eax
     a72:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     a75:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a78:	8b 40 04             	mov    0x4(%eax),%eax
     a7b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     a7e:	72 4d                	jb     acd <malloc+0xa6>
      if(p->s.size == nunits)
     a80:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a83:	8b 40 04             	mov    0x4(%eax),%eax
     a86:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     a89:	75 0c                	jne    a97 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a8e:	8b 10                	mov    (%eax),%edx
     a90:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a93:	89 10                	mov    %edx,(%eax)
     a95:	eb 26                	jmp    abd <malloc+0x96>
      else {
        p->s.size -= nunits;
     a97:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a9a:	8b 40 04             	mov    0x4(%eax),%eax
     a9d:	2b 45 ec             	sub    -0x14(%ebp),%eax
     aa0:	89 c2                	mov    %eax,%edx
     aa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aa5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     aa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aab:	8b 40 04             	mov    0x4(%eax),%eax
     aae:	c1 e0 03             	shl    $0x3,%eax
     ab1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     ab4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ab7:	8b 55 ec             	mov    -0x14(%ebp),%edx
     aba:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     abd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ac0:	a3 8c 46 00 00       	mov    %eax,0x468c
      return (void*)(p + 1);
     ac5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ac8:	83 c0 08             	add    $0x8,%eax
     acb:	eb 3b                	jmp    b08 <malloc+0xe1>
    }
    if(p == freep)
     acd:	a1 8c 46 00 00       	mov    0x468c,%eax
     ad2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     ad5:	75 1e                	jne    af5 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     ad7:	83 ec 0c             	sub    $0xc,%esp
     ada:	ff 75 ec             	pushl  -0x14(%ebp)
     add:	e8 e5 fe ff ff       	call   9c7 <morecore>
     ae2:	83 c4 10             	add    $0x10,%esp
     ae5:	89 45 f4             	mov    %eax,-0xc(%ebp)
     ae8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     aec:	75 07                	jne    af5 <malloc+0xce>
        return 0;
     aee:	b8 00 00 00 00       	mov    $0x0,%eax
     af3:	eb 13                	jmp    b08 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     af5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     af8:	89 45 f0             	mov    %eax,-0x10(%ebp)
     afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     afe:	8b 00                	mov    (%eax),%eax
     b00:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     b03:	e9 6d ff ff ff       	jmp    a75 <malloc+0x4e>
}
     b08:	c9                   	leave  
     b09:	c3                   	ret    

00000b0a <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     b0a:	55                   	push   %ebp
     b0b:	89 e5                	mov    %esp,%ebp
     b0d:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     b10:	83 ec 04             	sub    $0x4,%esp
     b13:	ff 75 08             	pushl  0x8(%ebp)
     b16:	68 58 38 00 00       	push   $0x3858
     b1b:	6a 02                	push   $0x2
     b1d:	e8 03 fc ff ff       	call   725 <printf>
     b22:	83 c4 10             	add    $0x10,%esp
  exit();
     b25:	e8 4f f9 ff ff       	call   479 <exit>

00000b2a <getInteger>:
}

static int getInteger(double num)
{
     b2a:	55                   	push   %ebp
     b2b:	89 e5                	mov    %esp,%ebp
     b2d:	83 ec 18             	sub    $0x18,%esp
     b30:	8b 45 08             	mov    0x8(%ebp),%eax
     b33:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b36:	8b 45 0c             	mov    0xc(%ebp),%eax
     b39:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     b3c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     b43:	eb 0e                	jmp    b53 <getInteger+0x29>
  {
    num -= 1;
     b45:	dd 45 e8             	fldl   -0x18(%ebp)
     b48:	d9 e8                	fld1   
     b4a:	de e9                	fsubrp %st,%st(1)
     b4c:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     b4f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     b53:	dd 45 e8             	fldl   -0x18(%ebp)
     b56:	d9 e8                	fld1   
     b58:	d9 c9                	fxch   %st(1)
     b5a:	df e9                	fucomip %st(1),%st
     b5c:	dd d8                	fstp   %st(0)
     b5e:	77 e5                	ja     b45 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     b60:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     b63:	c9                   	leave  
     b64:	c3                   	ret    

00000b65 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     b65:	55                   	push   %ebp
     b66:	89 e5                	mov    %esp,%ebp
     b68:	53                   	push   %ebx
     b69:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     b6c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     b73:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     b77:	74 17                	je     b90 <int2str+0x2b>
     b79:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     b7d:	79 11                	jns    b90 <int2str+0x2b>
    neg = 1;
     b7f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     b86:	8b 45 0c             	mov    0xc(%ebp),%eax
     b89:	f7 d8                	neg    %eax
     b8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
     b8e:	eb 06                	jmp    b96 <int2str+0x31>
  } else {
    x = num;
     b90:	8b 45 0c             	mov    0xc(%ebp),%eax
     b93:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     b96:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     b9d:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     ba0:	8d 41 01             	lea    0x1(%ecx),%eax
     ba3:	89 45 f8             	mov    %eax,-0x8(%ebp)
     ba6:	8b 5d 14             	mov    0x14(%ebp),%ebx
     ba9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bac:	ba 00 00 00 00       	mov    $0x0,%edx
     bb1:	f7 f3                	div    %ebx
     bb3:	89 d0                	mov    %edx,%eax
     bb5:	0f b6 80 f4 44 00 00 	movzbl 0x44f4(%eax),%eax
     bbc:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     bc0:	8b 5d 14             	mov    0x14(%ebp),%ebx
     bc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bc6:	ba 00 00 00 00       	mov    $0x0,%edx
     bcb:	f7 f3                	div    %ebx
     bcd:	89 45 f0             	mov    %eax,-0x10(%ebp)
     bd0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     bd4:	75 c7                	jne    b9d <int2str+0x38>
  if(neg)
     bd6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     bda:	74 36                	je     c12 <int2str+0xad>
    buf[i++] = '-';
     bdc:	8b 45 f8             	mov    -0x8(%ebp),%eax
     bdf:	8d 50 01             	lea    0x1(%eax),%edx
     be2:	89 55 f8             	mov    %edx,-0x8(%ebp)
     be5:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     bea:	eb 26                	jmp    c12 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     bec:	8b 45 10             	mov    0x10(%ebp),%eax
     bef:	8b 00                	mov    (%eax),%eax
     bf1:	89 c2                	mov    %eax,%edx
     bf3:	8b 45 08             	mov    0x8(%ebp),%eax
     bf6:	01 c2                	add    %eax,%edx
     bf8:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     bfb:	8b 45 f8             	mov    -0x8(%ebp),%eax
     bfe:	01 c8                	add    %ecx,%eax
     c00:	0f b6 00             	movzbl (%eax),%eax
     c03:	88 02                	mov    %al,(%edx)
    (*pos)++;
     c05:	8b 45 10             	mov    0x10(%ebp),%eax
     c08:	8b 00                	mov    (%eax),%eax
     c0a:	8d 50 01             	lea    0x1(%eax),%edx
     c0d:	8b 45 10             	mov    0x10(%ebp),%eax
     c10:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     c12:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     c16:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     c1a:	79 d0                	jns    bec <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     c1c:	90                   	nop
     c1d:	83 c4 20             	add    $0x20,%esp
     c20:	5b                   	pop    %ebx
     c21:	5d                   	pop    %ebp
     c22:	c3                   	ret    

00000c23 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     c23:	55                   	push   %ebp
     c24:	89 e5                	mov    %esp,%ebp
     c26:	83 ec 18             	sub    $0x18,%esp
     c29:	8b 45 0c             	mov    0xc(%ebp),%eax
     c2c:	89 45 e8             	mov    %eax,-0x18(%ebp)
     c2f:	8b 45 10             	mov    0x10(%ebp),%eax
     c32:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     c35:	d9 ee                	fldz   
     c37:	dd 45 e8             	fldl   -0x18(%ebp)
     c3a:	d9 c9                	fxch   %st(1)
     c3c:	df e9                	fucomip %st(1),%st
     c3e:	dd d8                	fstp   %st(0)
     c40:	76 24                	jbe    c66 <double2str+0x43>
  {
    buf[*pos] = '-';
     c42:	8b 45 14             	mov    0x14(%ebp),%eax
     c45:	8b 00                	mov    (%eax),%eax
     c47:	89 c2                	mov    %eax,%edx
     c49:	8b 45 08             	mov    0x8(%ebp),%eax
     c4c:	01 d0                	add    %edx,%eax
     c4e:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     c51:	8b 45 14             	mov    0x14(%ebp),%eax
     c54:	8b 00                	mov    (%eax),%eax
     c56:	8d 50 01             	lea    0x1(%eax),%edx
     c59:	8b 45 14             	mov    0x14(%ebp),%eax
     c5c:	89 10                	mov    %edx,(%eax)
    num = -num;
     c5e:	dd 45 e8             	fldl   -0x18(%ebp)
     c61:	d9 e0                	fchs   
     c63:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     c66:	ff 75 ec             	pushl  -0x14(%ebp)
     c69:	ff 75 e8             	pushl  -0x18(%ebp)
     c6c:	e8 b9 fe ff ff       	call   b2a <getInteger>
     c71:	83 c4 08             	add    $0x8,%esp
     c74:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     c77:	83 ec 04             	sub    $0x4,%esp
     c7a:	6a 01                	push   $0x1
     c7c:	6a 0a                	push   $0xa
     c7e:	ff 75 14             	pushl  0x14(%ebp)
     c81:	ff 75 f8             	pushl  -0x8(%ebp)
     c84:	ff 75 08             	pushl  0x8(%ebp)
     c87:	e8 d9 fe ff ff       	call   b65 <int2str>
     c8c:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     c8f:	db 45 f8             	fildl  -0x8(%ebp)
     c92:	dd 45 e8             	fldl   -0x18(%ebp)
     c95:	de e1                	fsubp  %st,%st(1)
     c97:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     c9a:	dd 45 e8             	fldl   -0x18(%ebp)
     c9d:	dd 05 60 38 00 00    	fldl   0x3860
     ca3:	d9 c9                	fxch   %st(1)
     ca5:	df e9                	fucomip %st(1),%st
     ca7:	dd d8                	fstp   %st(0)
     ca9:	76 1c                	jbe    cc7 <double2str+0xa4>
  {
    buf[*pos] = '.';
     cab:	8b 45 14             	mov    0x14(%ebp),%eax
     cae:	8b 00                	mov    (%eax),%eax
     cb0:	89 c2                	mov    %eax,%edx
     cb2:	8b 45 08             	mov    0x8(%ebp),%eax
     cb5:	01 d0                	add    %edx,%eax
     cb7:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     cba:	8b 45 14             	mov    0x14(%ebp),%eax
     cbd:	8b 00                	mov    (%eax),%eax
     cbf:	8d 50 01             	lea    0x1(%eax),%edx
     cc2:	8b 45 14             	mov    0x14(%ebp),%eax
     cc5:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     cc7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     cce:	eb 4c                	jmp    d1c <double2str+0xf9>
  {
    num = num*10;
     cd0:	dd 45 e8             	fldl   -0x18(%ebp)
     cd3:	dd 05 68 38 00 00    	fldl   0x3868
     cd9:	de c9                	fmulp  %st,%st(1)
     cdb:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     cde:	ff 75 ec             	pushl  -0x14(%ebp)
     ce1:	ff 75 e8             	pushl  -0x18(%ebp)
     ce4:	e8 41 fe ff ff       	call   b2a <getInteger>
     ce9:	83 c4 08             	add    $0x8,%esp
     cec:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     cef:	83 ec 04             	sub    $0x4,%esp
     cf2:	6a 01                	push   $0x1
     cf4:	6a 0a                	push   $0xa
     cf6:	ff 75 14             	pushl  0x14(%ebp)
     cf9:	ff 75 f8             	pushl  -0x8(%ebp)
     cfc:	ff 75 08             	pushl  0x8(%ebp)
     cff:	e8 61 fe ff ff       	call   b65 <int2str>
     d04:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     d07:	db 45 f8             	fildl  -0x8(%ebp)
     d0a:	dd 45 e8             	fldl   -0x18(%ebp)
     d0d:	de e1                	fsubp  %st,%st(1)
     d0f:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     d12:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     d16:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     d1a:	7f 13                	jg     d2f <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     d1c:	dd 45 e8             	fldl   -0x18(%ebp)
     d1f:	dd 05 60 38 00 00    	fldl   0x3860
     d25:	d9 c9                	fxch   %st(1)
     d27:	df e9                	fucomip %st(1),%st
     d29:	dd d8                	fstp   %st(0)
     d2b:	77 a3                	ja     cd0 <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     d2d:	eb 01                	jmp    d30 <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     d2f:	90                   	nop
    }
  }
}
     d30:	90                   	nop
     d31:	c9                   	leave  
     d32:	c3                   	ret    

00000d33 <pow>:

double pow(double opnd, int power)
{
     d33:	55                   	push   %ebp
     d34:	89 e5                	mov    %esp,%ebp
     d36:	83 ec 18             	sub    $0x18,%esp
     d39:	8b 45 08             	mov    0x8(%ebp),%eax
     d3c:	89 45 e8             	mov    %eax,-0x18(%ebp)
     d3f:	8b 45 0c             	mov    0xc(%ebp),%eax
     d42:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     d45:	d9 e8                	fld1   
     d47:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     d4a:	eb 0d                	jmp    d59 <pow+0x26>
  {
    result *= opnd;
     d4c:	dd 45 f8             	fldl   -0x8(%ebp)
     d4f:	dc 4d e8             	fmull  -0x18(%ebp)
     d52:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     d55:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     d59:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     d5d:	7f ed                	jg     d4c <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     d5f:	dd 45 f8             	fldl   -0x8(%ebp)
}
     d62:	c9                   	leave  
     d63:	c3                   	ret    

00000d64 <Translation>:

double Translation(char *s, int* pos)
{
     d64:	55                   	push   %ebp
     d65:	89 e5                	mov    %esp,%ebp
     d67:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     d6a:	d9 ee                	fldz   
     d6c:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     d6f:	d9 ee                	fldz   
     d71:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     d74:	eb 3e                	jmp    db4 <Translation+0x50>
    {
        integer *= 10;
     d76:	dd 45 f8             	fldl   -0x8(%ebp)
     d79:	dd 05 68 38 00 00    	fldl   0x3868
     d7f:	de c9                	fmulp  %st,%st(1)
     d81:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     d84:	8b 45 0c             	mov    0xc(%ebp),%eax
     d87:	8b 00                	mov    (%eax),%eax
     d89:	89 c2                	mov    %eax,%edx
     d8b:	8b 45 08             	mov    0x8(%ebp),%eax
     d8e:	01 d0                	add    %edx,%eax
     d90:	0f b6 00             	movzbl (%eax),%eax
     d93:	0f be c0             	movsbl %al,%eax
     d96:	83 e8 30             	sub    $0x30,%eax
     d99:	89 45 dc             	mov    %eax,-0x24(%ebp)
     d9c:	db 45 dc             	fildl  -0x24(%ebp)
     d9f:	dd 45 f8             	fldl   -0x8(%ebp)
     da2:	de c1                	faddp  %st,%st(1)
     da4:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     da7:	8b 45 0c             	mov    0xc(%ebp),%eax
     daa:	8b 00                	mov    (%eax),%eax
     dac:	8d 50 01             	lea    0x1(%eax),%edx
     daf:	8b 45 0c             	mov    0xc(%ebp),%eax
     db2:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     db4:	8b 45 0c             	mov    0xc(%ebp),%eax
     db7:	8b 00                	mov    (%eax),%eax
     db9:	89 c2                	mov    %eax,%edx
     dbb:	8b 45 08             	mov    0x8(%ebp),%eax
     dbe:	01 d0                	add    %edx,%eax
     dc0:	0f b6 00             	movzbl (%eax),%eax
     dc3:	3c 2f                	cmp    $0x2f,%al
     dc5:	7e 13                	jle    dda <Translation+0x76>
     dc7:	8b 45 0c             	mov    0xc(%ebp),%eax
     dca:	8b 00                	mov    (%eax),%eax
     dcc:	89 c2                	mov    %eax,%edx
     dce:	8b 45 08             	mov    0x8(%ebp),%eax
     dd1:	01 d0                	add    %edx,%eax
     dd3:	0f b6 00             	movzbl (%eax),%eax
     dd6:	3c 39                	cmp    $0x39,%al
     dd8:	7e 9c                	jle    d76 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     dda:	8b 45 0c             	mov    0xc(%ebp),%eax
     ddd:	8b 00                	mov    (%eax),%eax
     ddf:	89 c2                	mov    %eax,%edx
     de1:	8b 45 08             	mov    0x8(%ebp),%eax
     de4:	01 d0                	add    %edx,%eax
     de6:	0f b6 00             	movzbl (%eax),%eax
     de9:	3c 2e                	cmp    $0x2e,%al
     deb:	0f 85 9b 00 00 00    	jne    e8c <Translation+0x128>
    {
        (*pos)++;
     df1:	8b 45 0c             	mov    0xc(%ebp),%eax
     df4:	8b 00                	mov    (%eax),%eax
     df6:	8d 50 01             	lea    0x1(%eax),%edx
     df9:	8b 45 0c             	mov    0xc(%ebp),%eax
     dfc:	89 10                	mov    %edx,(%eax)
        int c = 1;
     dfe:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     e05:	eb 5b                	jmp    e62 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     e07:	8b 45 0c             	mov    0xc(%ebp),%eax
     e0a:	8b 00                	mov    (%eax),%eax
     e0c:	89 c2                	mov    %eax,%edx
     e0e:	8b 45 08             	mov    0x8(%ebp),%eax
     e11:	01 d0                	add    %edx,%eax
     e13:	0f b6 00             	movzbl (%eax),%eax
     e16:	0f be c0             	movsbl %al,%eax
     e19:	83 e8 30             	sub    $0x30,%eax
     e1c:	89 45 dc             	mov    %eax,-0x24(%ebp)
     e1f:	db 45 dc             	fildl  -0x24(%ebp)
     e22:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     e25:	83 ec 04             	sub    $0x4,%esp
     e28:	ff 75 ec             	pushl  -0x14(%ebp)
     e2b:	dd 05 70 38 00 00    	fldl   0x3870
     e31:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     e35:	dd 1c 24             	fstpl  (%esp)
     e38:	e8 f6 fe ff ff       	call   d33 <pow>
     e3d:	83 c4 10             	add    $0x10,%esp
     e40:	dd 45 e0             	fldl   -0x20(%ebp)
     e43:	de c9                	fmulp  %st,%st(1)
     e45:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     e48:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     e4c:	dd 45 f0             	fldl   -0x10(%ebp)
     e4f:	dc 45 e0             	faddl  -0x20(%ebp)
     e52:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     e55:	8b 45 0c             	mov    0xc(%ebp),%eax
     e58:	8b 00                	mov    (%eax),%eax
     e5a:	8d 50 01             	lea    0x1(%eax),%edx
     e5d:	8b 45 0c             	mov    0xc(%ebp),%eax
     e60:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     e62:	8b 45 0c             	mov    0xc(%ebp),%eax
     e65:	8b 00                	mov    (%eax),%eax
     e67:	89 c2                	mov    %eax,%edx
     e69:	8b 45 08             	mov    0x8(%ebp),%eax
     e6c:	01 d0                	add    %edx,%eax
     e6e:	0f b6 00             	movzbl (%eax),%eax
     e71:	3c 2f                	cmp    $0x2f,%al
     e73:	7e 17                	jle    e8c <Translation+0x128>
     e75:	8b 45 0c             	mov    0xc(%ebp),%eax
     e78:	8b 00                	mov    (%eax),%eax
     e7a:	89 c2                	mov    %eax,%edx
     e7c:	8b 45 08             	mov    0x8(%ebp),%eax
     e7f:	01 d0                	add    %edx,%eax
     e81:	0f b6 00             	movzbl (%eax),%eax
     e84:	3c 39                	cmp    $0x39,%al
     e86:	0f 8e 7b ff ff ff    	jle    e07 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     e8c:	dd 45 f8             	fldl   -0x8(%ebp)
     e8f:	dc 45 f0             	faddl  -0x10(%ebp)
     e92:	c9                   	leave  
     e93:	c3                   	ret    

00000e94 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     e94:	55                   	push   %ebp
     e95:	89 e5                	mov    %esp,%ebp
     e97:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     e9a:	e8 d2 f5 ff ff       	call   471 <fork>
     e9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     ea2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ea5:	c9                   	leave  
     ea6:	c3                   	ret    

00000ea7 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     ea7:	55                   	push   %ebp
     ea8:	89 e5                	mov    %esp,%ebp
     eaa:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     ead:	83 ec 0c             	sub    $0xc,%esp
     eb0:	6a 54                	push   $0x54
     eb2:	e8 70 fb ff ff       	call   a27 <malloc>
     eb7:	83 c4 10             	add    $0x10,%esp
     eba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     ebd:	83 ec 04             	sub    $0x4,%esp
     ec0:	6a 54                	push   $0x54
     ec2:	6a 00                	push   $0x0
     ec4:	ff 75 f4             	pushl  -0xc(%ebp)
     ec7:	e8 12 f4 ff ff       	call   2de <memset>
     ecc:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     ecf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ed2:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     ed8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     edb:	c9                   	leave  
     edc:	c3                   	ret    

00000edd <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     edd:	55                   	push   %ebp
     ede:	89 e5                	mov    %esp,%ebp
     ee0:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     ee3:	83 ec 0c             	sub    $0xc,%esp
     ee6:	6a 18                	push   $0x18
     ee8:	e8 3a fb ff ff       	call   a27 <malloc>
     eed:	83 c4 10             	add    $0x10,%esp
     ef0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     ef3:	83 ec 04             	sub    $0x4,%esp
     ef6:	6a 18                	push   $0x18
     ef8:	6a 00                	push   $0x0
     efa:	ff 75 f4             	pushl  -0xc(%ebp)
     efd:	e8 dc f3 ff ff       	call   2de <memset>
     f02:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     f05:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f08:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     f0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f11:	8b 55 08             	mov    0x8(%ebp),%edx
     f14:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     f17:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f1a:	8b 55 0c             	mov    0xc(%ebp),%edx
     f1d:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     f20:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f23:	8b 55 10             	mov    0x10(%ebp),%edx
     f26:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     f29:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f2c:	8b 55 14             	mov    0x14(%ebp),%edx
     f2f:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     f32:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f35:	8b 55 18             	mov    0x18(%ebp),%edx
     f38:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     f3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f3e:	c9                   	leave  
     f3f:	c3                   	ret    

00000f40 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     f40:	55                   	push   %ebp
     f41:	89 e5                	mov    %esp,%ebp
     f43:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     f46:	83 ec 0c             	sub    $0xc,%esp
     f49:	6a 0c                	push   $0xc
     f4b:	e8 d7 fa ff ff       	call   a27 <malloc>
     f50:	83 c4 10             	add    $0x10,%esp
     f53:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     f56:	83 ec 04             	sub    $0x4,%esp
     f59:	6a 0c                	push   $0xc
     f5b:	6a 00                	push   $0x0
     f5d:	ff 75 f4             	pushl  -0xc(%ebp)
     f60:	e8 79 f3 ff ff       	call   2de <memset>
     f65:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     f68:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f6b:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     f71:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f74:	8b 55 08             	mov    0x8(%ebp),%edx
     f77:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     f7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f7d:	8b 55 0c             	mov    0xc(%ebp),%edx
     f80:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     f83:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f86:	c9                   	leave  
     f87:	c3                   	ret    

00000f88 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     f88:	55                   	push   %ebp
     f89:	89 e5                	mov    %esp,%ebp
     f8b:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     f8e:	83 ec 0c             	sub    $0xc,%esp
     f91:	6a 0c                	push   $0xc
     f93:	e8 8f fa ff ff       	call   a27 <malloc>
     f98:	83 c4 10             	add    $0x10,%esp
     f9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     f9e:	83 ec 04             	sub    $0x4,%esp
     fa1:	6a 0c                	push   $0xc
     fa3:	6a 00                	push   $0x0
     fa5:	ff 75 f4             	pushl  -0xc(%ebp)
     fa8:	e8 31 f3 ff ff       	call   2de <memset>
     fad:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     fb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb3:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     fb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fbc:	8b 55 08             	mov    0x8(%ebp),%edx
     fbf:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     fc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fc5:	8b 55 0c             	mov    0xc(%ebp),%edx
     fc8:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     fcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     fce:	c9                   	leave  
     fcf:	c3                   	ret    

00000fd0 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     fd0:	55                   	push   %ebp
     fd1:	89 e5                	mov    %esp,%ebp
     fd3:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     fd6:	83 ec 0c             	sub    $0xc,%esp
     fd9:	6a 08                	push   $0x8
     fdb:	e8 47 fa ff ff       	call   a27 <malloc>
     fe0:	83 c4 10             	add    $0x10,%esp
     fe3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     fe6:	83 ec 04             	sub    $0x4,%esp
     fe9:	6a 08                	push   $0x8
     feb:	6a 00                	push   $0x0
     fed:	ff 75 f4             	pushl  -0xc(%ebp)
     ff0:	e8 e9 f2 ff ff       	call   2de <memset>
     ff5:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
     ff8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ffb:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
    1001:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1004:	8b 55 08             	mov    0x8(%ebp),%edx
    1007:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    100a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    100d:	c9                   	leave  
    100e:	c3                   	ret    

0000100f <calcmd>:

struct cmd* calcmd(char *_line)
{
    100f:	55                   	push   %ebp
    1010:	89 e5                	mov    %esp,%ebp
    1012:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1015:	83 ec 0c             	sub    $0xc,%esp
    1018:	6a 08                	push   $0x8
    101a:	e8 08 fa ff ff       	call   a27 <malloc>
    101f:	83 c4 10             	add    $0x10,%esp
    1022:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1025:	83 ec 04             	sub    $0x4,%esp
    1028:	6a 08                	push   $0x8
    102a:	6a 00                	push   $0x0
    102c:	ff 75 f4             	pushl  -0xc(%ebp)
    102f:	e8 aa f2 ff ff       	call   2de <memset>
    1034:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
    1037:	8b 45 f4             	mov    -0xc(%ebp),%eax
    103a:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
    1040:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1043:	8b 55 08             	mov    0x8(%ebp),%edx
    1046:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    1049:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    104c:	c9                   	leave  
    104d:	c3                   	ret    

0000104e <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
    104e:	55                   	push   %ebp
    104f:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
    1051:	eb 0c                	jmp    105f <mystrncmp+0x11>
    n--, p++, q++;
    1053:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1057:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    105b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    105f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1063:	74 1a                	je     107f <mystrncmp+0x31>
    1065:	8b 45 08             	mov    0x8(%ebp),%eax
    1068:	0f b6 00             	movzbl (%eax),%eax
    106b:	84 c0                	test   %al,%al
    106d:	74 10                	je     107f <mystrncmp+0x31>
    106f:	8b 45 08             	mov    0x8(%ebp),%eax
    1072:	0f b6 10             	movzbl (%eax),%edx
    1075:	8b 45 0c             	mov    0xc(%ebp),%eax
    1078:	0f b6 00             	movzbl (%eax),%eax
    107b:	38 c2                	cmp    %al,%dl
    107d:	74 d4                	je     1053 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
    107f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1083:	75 07                	jne    108c <mystrncmp+0x3e>
    return 0;
    1085:	b8 00 00 00 00       	mov    $0x0,%eax
    108a:	eb 16                	jmp    10a2 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
    108c:	8b 45 08             	mov    0x8(%ebp),%eax
    108f:	0f b6 00             	movzbl (%eax),%eax
    1092:	0f b6 d0             	movzbl %al,%edx
    1095:	8b 45 0c             	mov    0xc(%ebp),%eax
    1098:	0f b6 00             	movzbl (%eax),%eax
    109b:	0f b6 c0             	movzbl %al,%eax
    109e:	29 c2                	sub    %eax,%edx
    10a0:	89 d0                	mov    %edx,%eax
}
    10a2:	5d                   	pop    %ebp
    10a3:	c3                   	ret    

000010a4 <mystrlen>:

static int mystrlen(const char *s)
{
    10a4:	55                   	push   %ebp
    10a5:	89 e5                	mov    %esp,%ebp
    10a7:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
    10aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    10b1:	eb 04                	jmp    10b7 <mystrlen+0x13>
    10b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    10b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
    10ba:	8b 45 08             	mov    0x8(%ebp),%eax
    10bd:	01 d0                	add    %edx,%eax
    10bf:	0f b6 00             	movzbl (%eax),%eax
    10c2:	84 c0                	test   %al,%al
    10c4:	75 ed                	jne    10b3 <mystrlen+0xf>
    ;
  return n;
    10c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10c9:	c9                   	leave  
    10ca:	c3                   	ret    

000010cb <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
    10cb:	55                   	push   %ebp
    10cc:	89 e5                	mov    %esp,%ebp
    10ce:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
    10d1:	8b 45 08             	mov    0x8(%ebp),%eax
    10d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
    10d7:	90                   	nop
    10d8:	8b 45 10             	mov    0x10(%ebp),%eax
    10db:	8d 50 ff             	lea    -0x1(%eax),%edx
    10de:	89 55 10             	mov    %edx,0x10(%ebp)
    10e1:	85 c0                	test   %eax,%eax
    10e3:	7e 2c                	jle    1111 <mystrncpy+0x46>
    10e5:	8b 45 08             	mov    0x8(%ebp),%eax
    10e8:	8d 50 01             	lea    0x1(%eax),%edx
    10eb:	89 55 08             	mov    %edx,0x8(%ebp)
    10ee:	8b 55 0c             	mov    0xc(%ebp),%edx
    10f1:	8d 4a 01             	lea    0x1(%edx),%ecx
    10f4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    10f7:	0f b6 12             	movzbl (%edx),%edx
    10fa:	88 10                	mov    %dl,(%eax)
    10fc:	0f b6 00             	movzbl (%eax),%eax
    10ff:	84 c0                	test   %al,%al
    1101:	75 d5                	jne    10d8 <mystrncpy+0xd>
    ;
  while(n-- > 0)
    1103:	eb 0c                	jmp    1111 <mystrncpy+0x46>
    *s++ = 0;
    1105:	8b 45 08             	mov    0x8(%ebp),%eax
    1108:	8d 50 01             	lea    0x1(%eax),%edx
    110b:	89 55 08             	mov    %edx,0x8(%ebp)
    110e:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    1111:	8b 45 10             	mov    0x10(%ebp),%eax
    1114:	8d 50 ff             	lea    -0x1(%eax),%edx
    1117:	89 55 10             	mov    %edx,0x10(%ebp)
    111a:	85 c0                	test   %eax,%eax
    111c:	7f e7                	jg     1105 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    111e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1121:	c9                   	leave  
    1122:	c3                   	ret    

00001123 <isEqual>:

int isEqual(double a, double b)
{
    1123:	55                   	push   %ebp
    1124:	89 e5                	mov    %esp,%ebp
    1126:	83 ec 10             	sub    $0x10,%esp
    1129:	8b 45 08             	mov    0x8(%ebp),%eax
    112c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    112f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1132:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1135:	8b 45 10             	mov    0x10(%ebp),%eax
    1138:	89 45 f0             	mov    %eax,-0x10(%ebp)
    113b:	8b 45 14             	mov    0x14(%ebp),%eax
    113e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    1141:	dd 45 f8             	fldl   -0x8(%ebp)
    1144:	dc 65 f0             	fsubl  -0x10(%ebp)
    1147:	dd 05 40 3a 00 00    	fldl   0x3a40
    114d:	df e9                	fucomip %st(1),%st
    114f:	dd d8                	fstp   %st(0)
    1151:	76 19                	jbe    116c <isEqual+0x49>
    1153:	dd 45 f0             	fldl   -0x10(%ebp)
    1156:	dc 65 f8             	fsubl  -0x8(%ebp)
    1159:	dd 05 40 3a 00 00    	fldl   0x3a40
    115f:	df e9                	fucomip %st(1),%st
    1161:	dd d8                	fstp   %st(0)
    1163:	76 07                	jbe    116c <isEqual+0x49>
    return 1;
    1165:	b8 01 00 00 00       	mov    $0x1,%eax
    116a:	eb 05                	jmp    1171 <isEqual+0x4e>
  return 0;
    116c:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1171:	c9                   	leave  
    1172:	c3                   	ret    

00001173 <isCmdName>:

int isCmdName(const char* str)
{
    1173:	55                   	push   %ebp
    1174:	89 e5                	mov    %esp,%ebp
    1176:	53                   	push   %ebx
    1177:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    117a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1181:	eb 71                	jmp    11f4 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1183:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1186:	89 d0                	mov    %edx,%eax
    1188:	c1 e0 02             	shl    $0x2,%eax
    118b:	01 d0                	add    %edx,%eax
    118d:	01 c0                	add    %eax,%eax
    118f:	05 20 45 00 00       	add    $0x4520,%eax
    1194:	83 ec 0c             	sub    $0xc,%esp
    1197:	50                   	push   %eax
    1198:	e8 1a f1 ff ff       	call   2b7 <strlen>
    119d:	83 c4 10             	add    $0x10,%esp
    11a0:	89 c3                	mov    %eax,%ebx
    11a2:	83 ec 0c             	sub    $0xc,%esp
    11a5:	ff 75 08             	pushl  0x8(%ebp)
    11a8:	e8 f7 fe ff ff       	call   10a4 <mystrlen>
    11ad:	83 c4 10             	add    $0x10,%esp
    11b0:	39 c3                	cmp    %eax,%ebx
    11b2:	75 3c                	jne    11f0 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    11b4:	83 ec 0c             	sub    $0xc,%esp
    11b7:	ff 75 08             	pushl  0x8(%ebp)
    11ba:	e8 e5 fe ff ff       	call   10a4 <mystrlen>
    11bf:	83 c4 10             	add    $0x10,%esp
    11c2:	89 c1                	mov    %eax,%ecx
    11c4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    11c7:	89 d0                	mov    %edx,%eax
    11c9:	c1 e0 02             	shl    $0x2,%eax
    11cc:	01 d0                	add    %edx,%eax
    11ce:	01 c0                	add    %eax,%eax
    11d0:	05 20 45 00 00       	add    $0x4520,%eax
    11d5:	83 ec 04             	sub    $0x4,%esp
    11d8:	51                   	push   %ecx
    11d9:	ff 75 08             	pushl  0x8(%ebp)
    11dc:	50                   	push   %eax
    11dd:	e8 6c fe ff ff       	call   104e <mystrncmp>
    11e2:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    11e5:	85 c0                	test   %eax,%eax
    11e7:	75 07                	jne    11f0 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    11e9:	b8 01 00 00 00       	mov    $0x1,%eax
    11ee:	eb 0f                	jmp    11ff <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    11f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    11f4:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    11f8:	7e 89                	jle    1183 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    11fa:	b8 00 00 00 00       	mov    $0x0,%eax
}
    11ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1202:	c9                   	leave  
    1203:	c3                   	ret    

00001204 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    1204:	55                   	push   %ebp
    1205:	89 e5                	mov    %esp,%ebp
    1207:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    120d:	83 ec 08             	sub    $0x8,%esp
    1210:	6a 00                	push   $0x0
    1212:	68 e8 45 00 00       	push   $0x45e8
    1217:	e8 9d f2 ff ff       	call   4b9 <open>
    121c:	83 c4 10             	add    $0x10,%esp
    121f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1222:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1226:	79 0a                	jns    1232 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    1228:	b8 00 00 00 00       	mov    $0x0,%eax
    122d:	e9 9a 01 00 00       	jmp    13cc <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    1232:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    1239:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1240:	e9 ee 00 00 00       	jmp    1333 <findAlias+0x12f>
  {
      int isSame = 1;
    1245:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    124c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    1253:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    125a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    1261:	83 ec 0c             	sub    $0xc,%esp
    1264:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1267:	50                   	push   %eax
    1268:	e8 4a f0 ff ff       	call   2b7 <strlen>
    126d:	83 c4 10             	add    $0x10,%esp
    1270:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    1273:	83 ec 0c             	sub    $0xc,%esp
    1276:	ff 75 08             	pushl  0x8(%ebp)
    1279:	e8 39 f0 ff ff       	call   2b7 <strlen>
    127e:	83 c4 10             	add    $0x10,%esp
    1281:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    1284:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1287:	8b 45 e8             	mov    -0x18(%ebp),%eax
    128a:	01 d0                	add    %edx,%eax
    128c:	0f b6 00             	movzbl (%eax),%eax
    128f:	3c 21                	cmp    $0x21,%al
    1291:	75 38                	jne    12cb <findAlias+0xc7>
      {
          startIndex++;
    1293:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    1297:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    129e:	eb 2b                	jmp    12cb <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    12a0:	8d 55 9a             	lea    -0x66(%ebp),%edx
    12a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12a6:	01 d0                	add    %edx,%eax
    12a8:	0f b6 10             	movzbl (%eax),%edx
    12ab:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    12ae:	8b 45 08             	mov    0x8(%ebp),%eax
    12b1:	01 c8                	add    %ecx,%eax
    12b3:	0f b6 00             	movzbl (%eax),%eax
    12b6:	38 c2                	cmp    %al,%dl
    12b8:	74 09                	je     12c3 <findAlias+0xbf>
          {
              isSame = 0;
    12ba:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    12c1:	eb 1f                	jmp    12e2 <findAlias+0xde>
          }
          startIndex++;
    12c3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    12c7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    12cb:	8d 55 9a             	lea    -0x66(%ebp),%edx
    12ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12d1:	01 d0                	add    %edx,%eax
    12d3:	0f b6 00             	movzbl (%eax),%eax
    12d6:	3c 3d                	cmp    $0x3d,%al
    12d8:	74 08                	je     12e2 <findAlias+0xde>
    12da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12dd:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    12e0:	7c be                	jl     12a0 <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    12e2:	8d 55 9a             	lea    -0x66(%ebp),%edx
    12e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12e8:	01 d0                	add    %edx,%eax
    12ea:	0f b6 00             	movzbl (%eax),%eax
    12ed:	3c 3d                	cmp    $0x3d,%al
    12ef:	75 08                	jne    12f9 <findAlias+0xf5>
    12f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12f4:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    12f7:	7d 07                	jge    1300 <findAlias+0xfc>
      {
          isSame = 0;
    12f9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    1300:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    1304:	75 0b                	jne    1311 <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    1306:	b8 01 00 00 00       	mov    $0x1,%eax
    130b:	2b 45 f0             	sub    -0x10(%ebp),%eax
    130e:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    1311:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1315:	75 1c                	jne    1333 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    1317:	83 ec 08             	sub    $0x8,%esp
    131a:	8d 45 9a             	lea    -0x66(%ebp),%eax
    131d:	50                   	push   %eax
    131e:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1324:	50                   	push   %eax
    1325:	e8 1e ef ff ff       	call   248 <strcpy>
    132a:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    132d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1330:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1333:	83 ec 04             	sub    $0x4,%esp
    1336:	6a 32                	push   $0x32
    1338:	8d 45 9a             	lea    -0x66(%ebp),%eax
    133b:	50                   	push   %eax
    133c:	ff 75 dc             	pushl  -0x24(%ebp)
    133f:	e8 4d f1 ff ff       	call   491 <read>
    1344:	83 c4 10             	add    $0x10,%esp
    1347:	89 45 d8             	mov    %eax,-0x28(%ebp)
    134a:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    134e:	0f 8f f1 fe ff ff    	jg     1245 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    1354:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1358:	75 5f                	jne    13b9 <findAlias+0x1b5>
  {
    int i = 0;
    135a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    1361:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    1365:	eb 20                	jmp    1387 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    1367:	8b 55 e0             	mov    -0x20(%ebp),%edx
    136a:	8b 45 0c             	mov    0xc(%ebp),%eax
    136d:	01 c2                	add    %eax,%edx
    136f:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    1375:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1378:	01 c8                	add    %ecx,%eax
    137a:	0f b6 00             	movzbl (%eax),%eax
    137d:	88 02                	mov    %al,(%edx)
      i++;
    137f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    1383:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    1387:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    138d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1390:	01 d0                	add    %edx,%eax
    1392:	0f b6 00             	movzbl (%eax),%eax
    1395:	84 c0                	test   %al,%al
    1397:	75 ce                	jne    1367 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    1399:	8b 55 e0             	mov    -0x20(%ebp),%edx
    139c:	8b 45 0c             	mov    0xc(%ebp),%eax
    139f:	01 d0                	add    %edx,%eax
    13a1:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    13a4:	83 ec 0c             	sub    $0xc,%esp
    13a7:	ff 75 dc             	pushl  -0x24(%ebp)
    13aa:	e8 f2 f0 ff ff       	call   4a1 <close>
    13af:	83 c4 10             	add    $0x10,%esp
    return 1;
    13b2:	b8 01 00 00 00       	mov    $0x1,%eax
    13b7:	eb 13                	jmp    13cc <findAlias+0x1c8>
  }
  close(fd);
    13b9:	83 ec 0c             	sub    $0xc,%esp
    13bc:	ff 75 dc             	pushl  -0x24(%ebp)
    13bf:	e8 dd f0 ff ff       	call   4a1 <close>
    13c4:	83 c4 10             	add    $0x10,%esp
  return 0;
    13c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
    13cc:	c9                   	leave  
    13cd:	c3                   	ret    

000013ce <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    13ce:	55                   	push   %ebp
    13cf:	89 e5                	mov    %esp,%ebp
    13d1:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    13d4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    13d8:	75 05                	jne    13df <runcmd+0x11>
    exit();
    13da:	e8 9a f0 ff ff       	call   479 <exit>
  
  switch(cmd->type){
    13df:	8b 45 08             	mov    0x8(%ebp),%eax
    13e2:	8b 00                	mov    (%eax),%eax
    13e4:	83 f8 05             	cmp    $0x5,%eax
    13e7:	77 09                	ja     13f2 <runcmd+0x24>
    13e9:	8b 04 85 a4 38 00 00 	mov    0x38a4(,%eax,4),%eax
    13f0:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    13f2:	83 ec 0c             	sub    $0xc,%esp
    13f5:	68 78 38 00 00       	push   $0x3878
    13fa:	e8 0b f7 ff ff       	call   b0a <panic1>
    13ff:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    1402:	8b 45 08             	mov    0x8(%ebp),%eax
    1405:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    1408:	8b 45 f4             	mov    -0xc(%ebp),%eax
    140b:	8b 40 04             	mov    0x4(%eax),%eax
    140e:	85 c0                	test   %eax,%eax
    1410:	75 05                	jne    1417 <runcmd+0x49>
      exit();
    1412:	e8 62 f0 ff ff       	call   479 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    1417:	8b 45 f4             	mov    -0xc(%ebp),%eax
    141a:	8b 40 04             	mov    0x4(%eax),%eax
    141d:	83 ec 0c             	sub    $0xc,%esp
    1420:	50                   	push   %eax
    1421:	e8 4d fd ff ff       	call   1173 <isCmdName>
    1426:	83 c4 10             	add    $0x10,%esp
    1429:	85 c0                	test   %eax,%eax
    142b:	75 37                	jne    1464 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    142d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1430:	8b 40 04             	mov    0x4(%eax),%eax
    1433:	83 ec 08             	sub    $0x8,%esp
    1436:	8d 55 ce             	lea    -0x32(%ebp),%edx
    1439:	52                   	push   %edx
    143a:	50                   	push   %eax
    143b:	e8 c4 fd ff ff       	call   1204 <findAlias>
    1440:	83 c4 10             	add    $0x10,%esp
    1443:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    1446:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    144a:	75 31                	jne    147d <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    144c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    144f:	83 c0 04             	add    $0x4,%eax
    1452:	83 ec 08             	sub    $0x8,%esp
    1455:	50                   	push   %eax
    1456:	8d 45 ce             	lea    -0x32(%ebp),%eax
    1459:	50                   	push   %eax
    145a:	e8 52 f0 ff ff       	call   4b1 <exec>
    145f:	83 c4 10             	add    $0x10,%esp
    1462:	eb 19                	jmp    147d <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    1464:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1467:	8d 50 04             	lea    0x4(%eax),%edx
    146a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    146d:	8b 40 04             	mov    0x4(%eax),%eax
    1470:	83 ec 08             	sub    $0x8,%esp
    1473:	52                   	push   %edx
    1474:	50                   	push   %eax
    1475:	e8 37 f0 ff ff       	call   4b1 <exec>
    147a:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    147d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1480:	8b 40 04             	mov    0x4(%eax),%eax
    1483:	83 ec 04             	sub    $0x4,%esp
    1486:	50                   	push   %eax
    1487:	68 7f 38 00 00       	push   $0x387f
    148c:	6a 02                	push   $0x2
    148e:	e8 92 f2 ff ff       	call   725 <printf>
    1493:	83 c4 10             	add    $0x10,%esp
    break;
    1496:	e9 c6 01 00 00       	jmp    1661 <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    149b:	8b 45 08             	mov    0x8(%ebp),%eax
    149e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    14a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14a4:	8b 40 14             	mov    0x14(%eax),%eax
    14a7:	83 ec 0c             	sub    $0xc,%esp
    14aa:	50                   	push   %eax
    14ab:	e8 f1 ef ff ff       	call   4a1 <close>
    14b0:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    14b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14b6:	8b 50 10             	mov    0x10(%eax),%edx
    14b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14bc:	8b 40 08             	mov    0x8(%eax),%eax
    14bf:	83 ec 08             	sub    $0x8,%esp
    14c2:	52                   	push   %edx
    14c3:	50                   	push   %eax
    14c4:	e8 f0 ef ff ff       	call   4b9 <open>
    14c9:	83 c4 10             	add    $0x10,%esp
    14cc:	85 c0                	test   %eax,%eax
    14ce:	79 1e                	jns    14ee <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    14d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14d3:	8b 40 08             	mov    0x8(%eax),%eax
    14d6:	83 ec 04             	sub    $0x4,%esp
    14d9:	50                   	push   %eax
    14da:	68 8f 38 00 00       	push   $0x388f
    14df:	6a 02                	push   $0x2
    14e1:	e8 3f f2 ff ff       	call   725 <printf>
    14e6:	83 c4 10             	add    $0x10,%esp
      exit();
    14e9:	e8 8b ef ff ff       	call   479 <exit>
    }
    runcmd(rcmd->cmd);
    14ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14f1:	8b 40 04             	mov    0x4(%eax),%eax
    14f4:	83 ec 0c             	sub    $0xc,%esp
    14f7:	50                   	push   %eax
    14f8:	e8 d1 fe ff ff       	call   13ce <runcmd>
    14fd:	83 c4 10             	add    $0x10,%esp
    break;
    1500:	e9 5c 01 00 00       	jmp    1661 <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    1505:	8b 45 08             	mov    0x8(%ebp),%eax
    1508:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    150b:	e8 84 f9 ff ff       	call   e94 <fork1>
    1510:	85 c0                	test   %eax,%eax
    1512:	75 12                	jne    1526 <runcmd+0x158>
      runcmd(lcmd->left);
    1514:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1517:	8b 40 04             	mov    0x4(%eax),%eax
    151a:	83 ec 0c             	sub    $0xc,%esp
    151d:	50                   	push   %eax
    151e:	e8 ab fe ff ff       	call   13ce <runcmd>
    1523:	83 c4 10             	add    $0x10,%esp
    wait();
    1526:	e8 56 ef ff ff       	call   481 <wait>
    runcmd(lcmd->right);
    152b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    152e:	8b 40 08             	mov    0x8(%eax),%eax
    1531:	83 ec 0c             	sub    $0xc,%esp
    1534:	50                   	push   %eax
    1535:	e8 94 fe ff ff       	call   13ce <runcmd>
    153a:	83 c4 10             	add    $0x10,%esp
    break;
    153d:	e9 1f 01 00 00       	jmp    1661 <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    1542:	8b 45 08             	mov    0x8(%ebp),%eax
    1545:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    1548:	83 ec 0c             	sub    $0xc,%esp
    154b:	8d 45 d8             	lea    -0x28(%ebp),%eax
    154e:	50                   	push   %eax
    154f:	e8 35 ef ff ff       	call   489 <pipe>
    1554:	83 c4 10             	add    $0x10,%esp
    1557:	85 c0                	test   %eax,%eax
    1559:	79 10                	jns    156b <runcmd+0x19d>
      panic1("pipe");
    155b:	83 ec 0c             	sub    $0xc,%esp
    155e:	68 9f 38 00 00       	push   $0x389f
    1563:	e8 a2 f5 ff ff       	call   b0a <panic1>
    1568:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    156b:	e8 24 f9 ff ff       	call   e94 <fork1>
    1570:	85 c0                	test   %eax,%eax
    1572:	75 4c                	jne    15c0 <runcmd+0x1f2>
      close(1);
    1574:	83 ec 0c             	sub    $0xc,%esp
    1577:	6a 01                	push   $0x1
    1579:	e8 23 ef ff ff       	call   4a1 <close>
    157e:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    1581:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1584:	83 ec 0c             	sub    $0xc,%esp
    1587:	50                   	push   %eax
    1588:	e8 64 ef ff ff       	call   4f1 <dup>
    158d:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1590:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1593:	83 ec 0c             	sub    $0xc,%esp
    1596:	50                   	push   %eax
    1597:	e8 05 ef ff ff       	call   4a1 <close>
    159c:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    159f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    15a2:	83 ec 0c             	sub    $0xc,%esp
    15a5:	50                   	push   %eax
    15a6:	e8 f6 ee ff ff       	call   4a1 <close>
    15ab:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    15ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15b1:	8b 40 04             	mov    0x4(%eax),%eax
    15b4:	83 ec 0c             	sub    $0xc,%esp
    15b7:	50                   	push   %eax
    15b8:	e8 11 fe ff ff       	call   13ce <runcmd>
    15bd:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    15c0:	e8 cf f8 ff ff       	call   e94 <fork1>
    15c5:	85 c0                	test   %eax,%eax
    15c7:	75 4c                	jne    1615 <runcmd+0x247>
      close(0);
    15c9:	83 ec 0c             	sub    $0xc,%esp
    15cc:	6a 00                	push   $0x0
    15ce:	e8 ce ee ff ff       	call   4a1 <close>
    15d3:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    15d6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    15d9:	83 ec 0c             	sub    $0xc,%esp
    15dc:	50                   	push   %eax
    15dd:	e8 0f ef ff ff       	call   4f1 <dup>
    15e2:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    15e5:	8b 45 d8             	mov    -0x28(%ebp),%eax
    15e8:	83 ec 0c             	sub    $0xc,%esp
    15eb:	50                   	push   %eax
    15ec:	e8 b0 ee ff ff       	call   4a1 <close>
    15f1:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    15f4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    15f7:	83 ec 0c             	sub    $0xc,%esp
    15fa:	50                   	push   %eax
    15fb:	e8 a1 ee ff ff       	call   4a1 <close>
    1600:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    1603:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1606:	8b 40 08             	mov    0x8(%eax),%eax
    1609:	83 ec 0c             	sub    $0xc,%esp
    160c:	50                   	push   %eax
    160d:	e8 bc fd ff ff       	call   13ce <runcmd>
    1612:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    1615:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1618:	83 ec 0c             	sub    $0xc,%esp
    161b:	50                   	push   %eax
    161c:	e8 80 ee ff ff       	call   4a1 <close>
    1621:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    1624:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1627:	83 ec 0c             	sub    $0xc,%esp
    162a:	50                   	push   %eax
    162b:	e8 71 ee ff ff       	call   4a1 <close>
    1630:	83 c4 10             	add    $0x10,%esp
    wait();
    1633:	e8 49 ee ff ff       	call   481 <wait>
    wait();
    1638:	e8 44 ee ff ff       	call   481 <wait>
    break;
    163d:	eb 22                	jmp    1661 <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    163f:	8b 45 08             	mov    0x8(%ebp),%eax
    1642:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    1645:	e8 4a f8 ff ff       	call   e94 <fork1>
    164a:	85 c0                	test   %eax,%eax
    164c:	75 12                	jne    1660 <runcmd+0x292>
      runcmd(bcmd->cmd);
    164e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1651:	8b 40 04             	mov    0x4(%eax),%eax
    1654:	83 ec 0c             	sub    $0xc,%esp
    1657:	50                   	push   %eax
    1658:	e8 71 fd ff ff       	call   13ce <runcmd>
    165d:	83 c4 10             	add    $0x10,%esp
    break;
    1660:	90                   	nop
  }
  exit();
    1661:	e8 13 ee ff ff       	call   479 <exit>

00001666 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    1666:	55                   	push   %ebp
    1667:	89 e5                	mov    %esp,%ebp
    1669:	83 ec 04             	sub    $0x4,%esp
    166c:	8b 45 08             	mov    0x8(%ebp),%eax
    166f:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    1672:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    1676:	7e 0d                	jle    1685 <isNameChar+0x1f>
    1678:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    167c:	7f 07                	jg     1685 <isNameChar+0x1f>
    return 1;
    167e:	b8 01 00 00 00       	mov    $0x1,%eax
    1683:	eb 38                	jmp    16bd <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    1685:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    1689:	7e 0d                	jle    1698 <isNameChar+0x32>
    168b:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    168f:	7f 07                	jg     1698 <isNameChar+0x32>
    return 1;
    1691:	b8 01 00 00 00       	mov    $0x1,%eax
    1696:	eb 25                	jmp    16bd <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    1698:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    169c:	7e 0d                	jle    16ab <isNameChar+0x45>
    169e:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    16a2:	7f 07                	jg     16ab <isNameChar+0x45>
    return 1;
    16a4:	b8 01 00 00 00       	mov    $0x1,%eax
    16a9:	eb 12                	jmp    16bd <isNameChar+0x57>
  if(ch == '_')
    16ab:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    16af:	75 07                	jne    16b8 <isNameChar+0x52>
    return 1;
    16b1:	b8 01 00 00 00       	mov    $0x1,%eax
    16b6:	eb 05                	jmp    16bd <isNameChar+0x57>
  return 0;
    16b8:	b8 00 00 00 00       	mov    $0x0,%eax
}
    16bd:	c9                   	leave  
    16be:	c3                   	ret    

000016bf <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    16bf:	55                   	push   %ebp
    16c0:	89 e5                	mov    %esp,%ebp
    16c2:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    16c5:	8b 45 08             	mov    0x8(%ebp),%eax
    16c8:	8b 40 04             	mov    0x4(%eax),%eax
    16cb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    16ce:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    16d5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    16dc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    16e3:	eb 1d                	jmp    1702 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    16e5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    16e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16eb:	01 d0                	add    %edx,%eax
    16ed:	0f b6 00             	movzbl (%eax),%eax
    16f0:	3c 3d                	cmp    $0x3d,%al
    16f2:	75 0a                	jne    16fe <runCalcmd+0x3f>
    {
      hasEqu++;
    16f4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    16f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    16fe:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1702:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1705:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1708:	01 d0                	add    %edx,%eax
    170a:	0f b6 00             	movzbl (%eax),%eax
    170d:	84 c0                	test   %al,%al
    170f:	75 d4                	jne    16e5 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    1711:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1715:	7e 1d                	jle    1734 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    1717:	83 ec 0c             	sub    $0xc,%esp
    171a:	68 bc 38 00 00       	push   $0x38bc
    171f:	6a 00                	push   $0x0
    1721:	6a 00                	push   $0x0
    1723:	6a 01                	push   $0x1
    1725:	6a 04                	push   $0x4
    1727:	e8 21 17 00 00       	call   2e4d <color_printf>
    172c:	83 c4 20             	add    $0x20,%esp
    172f:	e9 78 05 00 00       	jmp    1cac <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    1734:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1738:	0f 85 26 05 00 00    	jne    1c64 <runCalcmd+0x5a5>
  {
    int i=0;
    173e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    1745:	eb 04                	jmp    174b <runCalcmd+0x8c>
    {
      i++;
    1747:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    174b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    174e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1751:	01 d0                	add    %edx,%eax
    1753:	0f b6 00             	movzbl (%eax),%eax
    1756:	3c 20                	cmp    $0x20,%al
    1758:	74 ed                	je     1747 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    175a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    175d:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    1760:	eb 23                	jmp    1785 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    1762:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1765:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1768:	01 d0                	add    %edx,%eax
    176a:	0f b6 00             	movzbl (%eax),%eax
    176d:	0f be c0             	movsbl %al,%eax
    1770:	83 ec 0c             	sub    $0xc,%esp
    1773:	50                   	push   %eax
    1774:	e8 ed fe ff ff       	call   1666 <isNameChar>
    1779:	83 c4 10             	add    $0x10,%esp
    177c:	83 f8 01             	cmp    $0x1,%eax
    177f:	75 0e                	jne    178f <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    1781:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1785:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1788:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    178b:	7c d5                	jl     1762 <runCalcmd+0xa3>
    178d:	eb 01                	jmp    1790 <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    178f:	90                   	nop
    }
    int len = i-startIndex;
    1790:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1793:	2b 45 d0             	sub    -0x30(%ebp),%eax
    1796:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    1799:	eb 04                	jmp    179f <runCalcmd+0xe0>
    {
      i++;
    179b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    179f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    17a2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17a5:	01 d0                	add    %edx,%eax
    17a7:	0f b6 00             	movzbl (%eax),%eax
    17aa:	3c 20                	cmp    $0x20,%al
    17ac:	74 ed                	je     179b <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    17ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17b1:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    17b4:	0f 85 90 04 00 00    	jne    1c4a <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    17ba:	8b 55 d0             	mov    -0x30(%ebp),%edx
    17bd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17c0:	01 d0                	add    %edx,%eax
    17c2:	0f b6 00             	movzbl (%eax),%eax
    17c5:	3c 2f                	cmp    $0x2f,%al
    17c7:	7e 2c                	jle    17f5 <runCalcmd+0x136>
    17c9:	8b 55 d0             	mov    -0x30(%ebp),%edx
    17cc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17cf:	01 d0                	add    %edx,%eax
    17d1:	0f b6 00             	movzbl (%eax),%eax
    17d4:	3c 39                	cmp    $0x39,%al
    17d6:	7f 1d                	jg     17f5 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    17d8:	83 ec 0c             	sub    $0xc,%esp
    17db:	68 d8 38 00 00       	push   $0x38d8
    17e0:	6a 00                	push   $0x0
    17e2:	6a 00                	push   $0x0
    17e4:	6a 01                	push   $0x1
    17e6:	6a 04                	push   $0x4
    17e8:	e8 60 16 00 00       	call   2e4d <color_printf>
    17ed:	83 c4 20             	add    $0x20,%esp
    17f0:	e9 b7 04 00 00       	jmp    1cac <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    17f5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    17fc:	eb 20                	jmp    181e <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    17fe:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1801:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1804:	01 d0                	add    %edx,%eax
    1806:	89 c2                	mov    %eax,%edx
    1808:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    180b:	01 d0                	add    %edx,%eax
    180d:	0f b6 00             	movzbl (%eax),%eax
    1810:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1813:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1816:	01 ca                	add    %ecx,%edx
    1818:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    181a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    181e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1821:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1824:	7c d8                	jl     17fe <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1826:	8d 55 94             	lea    -0x6c(%ebp),%edx
    1829:	8b 45 cc             	mov    -0x34(%ebp),%eax
    182c:	01 d0                	add    %edx,%eax
    182e:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    1831:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1834:	83 c0 01             	add    $0x1,%eax
    1837:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    183a:	eb 04                	jmp    1840 <runCalcmd+0x181>
        {
          i++;
    183c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    1840:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1843:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1846:	01 d0                	add    %edx,%eax
    1848:	0f b6 00             	movzbl (%eax),%eax
    184b:	3c 20                	cmp    $0x20,%al
    184d:	74 ed                	je     183c <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    184f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1852:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1855:	01 d0                	add    %edx,%eax
    1857:	0f b6 00             	movzbl (%eax),%eax
    185a:	3c 60                	cmp    $0x60,%al
    185c:	0f 85 e6 01 00 00    	jne    1a48 <runCalcmd+0x389>
        {
          i++;
    1862:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    1866:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1869:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    186c:	eb 04                	jmp    1872 <runCalcmd+0x1b3>
          {
            i++;
    186e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    1872:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1875:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1878:	01 d0                	add    %edx,%eax
    187a:	0f b6 00             	movzbl (%eax),%eax
    187d:	3c 60                	cmp    $0x60,%al
    187f:	74 0f                	je     1890 <runCalcmd+0x1d1>
    1881:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1884:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1887:	01 d0                	add    %edx,%eax
    1889:	0f b6 00             	movzbl (%eax),%eax
    188c:	84 c0                	test   %al,%al
    188e:	75 de                	jne    186e <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    1890:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1893:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1896:	01 d0                	add    %edx,%eax
    1898:	0f b6 00             	movzbl (%eax),%eax
    189b:	3c 60                	cmp    $0x60,%al
    189d:	0f 85 5c 01 00 00    	jne    19ff <runCalcmd+0x340>
    18a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18a6:	8d 50 01             	lea    0x1(%eax),%edx
    18a9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18ac:	01 d0                	add    %edx,%eax
    18ae:	0f b6 00             	movzbl (%eax),%eax
    18b1:	84 c0                	test   %al,%al
    18b3:	0f 85 46 01 00 00    	jne    19ff <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    18b9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18bc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18bf:	01 d0                	add    %edx,%eax
    18c1:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    18c4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    18c7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18ca:	01 d0                	add    %edx,%eax
    18cc:	83 ec 0c             	sub    $0xc,%esp
    18cf:	50                   	push   %eax
    18d0:	e8 c5 04 00 00       	call   1d9a <Compute>
    18d5:	83 c4 10             	add    $0x10,%esp
    18d8:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    18db:	dd 05 48 3a 00 00    	fldl   0x3a48
    18e1:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    18e5:	dd 1c 24             	fstpl  (%esp)
    18e8:	ff 75 c4             	pushl  -0x3c(%ebp)
    18eb:	ff 75 c0             	pushl  -0x40(%ebp)
    18ee:	e8 30 f8 ff ff       	call   1123 <isEqual>
    18f3:	83 c4 10             	add    $0x10,%esp
    18f6:	85 c0                	test   %eax,%eax
    18f8:	0f 85 ad 03 00 00    	jne    1cab <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    18fe:	a1 90 46 00 00       	mov    0x4690,%eax
    1903:	85 c0                	test   %eax,%eax
    1905:	75 15                	jne    191c <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1907:	83 ec 08             	sub    $0x8,%esp
    190a:	68 90 46 00 00       	push   $0x4690
    190f:	68 c0 46 00 00       	push   $0x46c0
    1914:	e8 ba 19 00 00       	call   32d3 <readVariables>
    1919:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    191c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1923:	eb 26                	jmp    194b <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1925:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1928:	c1 e0 05             	shl    $0x5,%eax
    192b:	05 c0 46 00 00       	add    $0x46c0,%eax
    1930:	8d 50 04             	lea    0x4(%eax),%edx
    1933:	83 ec 08             	sub    $0x8,%esp
    1936:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1939:	50                   	push   %eax
    193a:	52                   	push   %edx
    193b:	e8 38 e9 ff ff       	call   278 <strcmp>
    1940:	83 c4 10             	add    $0x10,%esp
    1943:	85 c0                	test   %eax,%eax
    1945:	74 10                	je     1957 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1947:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    194b:	a1 90 46 00 00       	mov    0x4690,%eax
    1950:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1953:	7c d0                	jl     1925 <runCalcmd+0x266>
    1955:	eb 01                	jmp    1958 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1957:	90                   	nop
              }
              if(index == v_num) //new variable
    1958:	a1 90 46 00 00       	mov    0x4690,%eax
    195d:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1960:	75 3c                	jne    199e <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    1962:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1965:	c1 e0 05             	shl    $0x5,%eax
    1968:	05 c0 46 00 00       	add    $0x46c0,%eax
    196d:	8d 50 04             	lea    0x4(%eax),%edx
    1970:	83 ec 08             	sub    $0x8,%esp
    1973:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1976:	50                   	push   %eax
    1977:	52                   	push   %edx
    1978:	e8 cb e8 ff ff       	call   248 <strcpy>
    197d:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    1980:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1983:	c1 e0 05             	shl    $0x5,%eax
    1986:	05 c0 46 00 00       	add    $0x46c0,%eax
    198b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    1991:	a1 90 46 00 00       	mov    0x4690,%eax
    1996:	83 c0 01             	add    $0x1,%eax
    1999:	a3 90 46 00 00       	mov    %eax,0x4690
              }
              variables[index].value.dvalue = result;
    199e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    19a1:	c1 e0 05             	shl    $0x5,%eax
    19a4:	05 d0 46 00 00       	add    $0x46d0,%eax
    19a9:	dd 45 c0             	fldl   -0x40(%ebp)
    19ac:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    19af:	8b 45 dc             	mov    -0x24(%ebp),%eax
    19b2:	c1 e0 05             	shl    $0x5,%eax
    19b5:	05 d0 46 00 00       	add    $0x46d0,%eax
    19ba:	dd 40 08             	fldl   0x8(%eax)
    19bd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    19c0:	c1 e0 05             	shl    $0x5,%eax
    19c3:	05 c0 46 00 00       	add    $0x46c0,%eax
    19c8:	83 c0 04             	add    $0x4,%eax
    19cb:	83 ec 0c             	sub    $0xc,%esp
    19ce:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    19d2:	dd 1c 24             	fstpl  (%esp)
    19d5:	50                   	push   %eax
    19d6:	68 02 39 00 00       	push   $0x3902
    19db:	6a 01                	push   $0x1
    19dd:	e8 43 ed ff ff       	call   725 <printf>
    19e2:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    19e5:	83 ec 08             	sub    $0x8,%esp
    19e8:	68 90 46 00 00       	push   $0x4690
    19ed:	68 c0 46 00 00       	push   $0x46c0
    19f2:	e8 90 1b 00 00       	call   3587 <writeVariables>
    19f7:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    19fa:	e9 ac 02 00 00       	jmp    1cab <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    19ff:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a02:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a05:	01 d0                	add    %edx,%eax
    1a07:	0f b6 00             	movzbl (%eax),%eax
    1a0a:	84 c0                	test   %al,%al
    1a0c:	75 1d                	jne    1a2b <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    1a0e:	83 ec 0c             	sub    $0xc,%esp
    1a11:	68 09 39 00 00       	push   $0x3909
    1a16:	6a 00                	push   $0x0
    1a18:	6a 00                	push   $0x0
    1a1a:	6a 01                	push   $0x1
    1a1c:	6a 04                	push   $0x4
    1a1e:	e8 2a 14 00 00       	call   2e4d <color_printf>
    1a23:	83 c4 20             	add    $0x20,%esp
    1a26:	e9 81 02 00 00       	jmp    1cac <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    1a2b:	83 ec 0c             	sub    $0xc,%esp
    1a2e:	68 20 39 00 00       	push   $0x3920
    1a33:	6a 00                	push   $0x0
    1a35:	6a 00                	push   $0x0
    1a37:	6a 01                	push   $0x1
    1a39:	6a 04                	push   $0x4
    1a3b:	e8 0d 14 00 00       	call   2e4d <color_printf>
    1a40:	83 c4 20             	add    $0x20,%esp
    1a43:	e9 64 02 00 00       	jmp    1cac <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1a48:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a4b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a4e:	01 d0                	add    %edx,%eax
    1a50:	0f b6 00             	movzbl (%eax),%eax
    1a53:	3c 22                	cmp    $0x22,%al
    1a55:	0f 85 d5 01 00 00    	jne    1c30 <runCalcmd+0x571>
        {
          i++;
    1a5b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    1a5f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1a62:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1a65:	eb 04                	jmp    1a6b <runCalcmd+0x3ac>
          {
            i++;
    1a67:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1a6b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a6e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a71:	01 d0                	add    %edx,%eax
    1a73:	0f b6 00             	movzbl (%eax),%eax
    1a76:	3c 22                	cmp    $0x22,%al
    1a78:	74 0f                	je     1a89 <runCalcmd+0x3ca>
    1a7a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a7d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a80:	01 d0                	add    %edx,%eax
    1a82:	0f b6 00             	movzbl (%eax),%eax
    1a85:	84 c0                	test   %al,%al
    1a87:	75 de                	jne    1a67 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1a89:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a8c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a8f:	01 d0                	add    %edx,%eax
    1a91:	0f b6 00             	movzbl (%eax),%eax
    1a94:	3c 22                	cmp    $0x22,%al
    1a96:	0f 85 4e 01 00 00    	jne    1bea <runCalcmd+0x52b>
    1a9c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1a9f:	8d 50 01             	lea    0x1(%eax),%edx
    1aa2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1aa5:	01 d0                	add    %edx,%eax
    1aa7:	0f b6 00             	movzbl (%eax),%eax
    1aaa:	84 c0                	test   %al,%al
    1aac:	0f 85 38 01 00 00    	jne    1bea <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1ab2:	a1 90 46 00 00       	mov    0x4690,%eax
    1ab7:	85 c0                	test   %eax,%eax
    1ab9:	75 15                	jne    1ad0 <runCalcmd+0x411>
              readVariables(variables,&v_num);
    1abb:	83 ec 08             	sub    $0x8,%esp
    1abe:	68 90 46 00 00       	push   $0x4690
    1ac3:	68 c0 46 00 00       	push   $0x46c0
    1ac8:	e8 06 18 00 00       	call   32d3 <readVariables>
    1acd:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1ad0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1ad7:	eb 26                	jmp    1aff <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    1ad9:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1adc:	c1 e0 05             	shl    $0x5,%eax
    1adf:	05 c0 46 00 00       	add    $0x46c0,%eax
    1ae4:	8d 50 04             	lea    0x4(%eax),%edx
    1ae7:	83 ec 08             	sub    $0x8,%esp
    1aea:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1aed:	50                   	push   %eax
    1aee:	52                   	push   %edx
    1aef:	e8 84 e7 ff ff       	call   278 <strcmp>
    1af4:	83 c4 10             	add    $0x10,%esp
    1af7:	85 c0                	test   %eax,%eax
    1af9:	74 10                	je     1b0b <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    1afb:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1aff:	a1 90 46 00 00       	mov    0x4690,%eax
    1b04:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1b07:	7c d0                	jl     1ad9 <runCalcmd+0x41a>
    1b09:	eb 01                	jmp    1b0c <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    1b0b:	90                   	nop
            }
            if(index == v_num) //new variable
    1b0c:	a1 90 46 00 00       	mov    0x4690,%eax
    1b11:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1b14:	75 2b                	jne    1b41 <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1b16:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1b19:	c1 e0 05             	shl    $0x5,%eax
    1b1c:	05 c0 46 00 00       	add    $0x46c0,%eax
    1b21:	8d 50 04             	lea    0x4(%eax),%edx
    1b24:	83 ec 08             	sub    $0x8,%esp
    1b27:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1b2a:	50                   	push   %eax
    1b2b:	52                   	push   %edx
    1b2c:	e8 17 e7 ff ff       	call   248 <strcpy>
    1b31:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1b34:	a1 90 46 00 00       	mov    0x4690,%eax
    1b39:	83 c0 01             	add    $0x1,%eax
    1b3c:	a3 90 46 00 00       	mov    %eax,0x4690
            }
            variables[index].type = V_STRING;
    1b41:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1b44:	c1 e0 05             	shl    $0x5,%eax
    1b47:	05 c0 46 00 00       	add    $0x46c0,%eax
    1b4c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1b52:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1b55:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1b58:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1b5b:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1b5e:	83 c0 01             	add    $0x1,%eax
    1b61:	83 ec 0c             	sub    $0xc,%esp
    1b64:	50                   	push   %eax
    1b65:	e8 bd ee ff ff       	call   a27 <malloc>
    1b6a:	83 c4 10             	add    $0x10,%esp
    1b6d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1b70:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1b73:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b76:	01 d0                	add    %edx,%eax
    1b78:	83 ec 08             	sub    $0x8,%esp
    1b7b:	50                   	push   %eax
    1b7c:	ff 75 b4             	pushl  -0x4c(%ebp)
    1b7f:	e8 c4 e6 ff ff       	call   248 <strcpy>
    1b84:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1b87:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1b8a:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1b8d:	01 d0                	add    %edx,%eax
    1b8f:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1b92:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1b95:	c1 e0 05             	shl    $0x5,%eax
    1b98:	8d 90 d8 46 00 00    	lea    0x46d8(%eax),%edx
    1b9e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1ba1:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1ba3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1ba6:	c1 e0 05             	shl    $0x5,%eax
    1ba9:	05 d8 46 00 00       	add    $0x46d8,%eax
    1bae:	8b 00                	mov    (%eax),%eax
    1bb0:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1bb3:	c1 e2 05             	shl    $0x5,%edx
    1bb6:	81 c2 c0 46 00 00    	add    $0x46c0,%edx
    1bbc:	83 c2 04             	add    $0x4,%edx
    1bbf:	50                   	push   %eax
    1bc0:	52                   	push   %edx
    1bc1:	68 41 39 00 00       	push   $0x3941
    1bc6:	6a 01                	push   $0x1
    1bc8:	e8 58 eb ff ff       	call   725 <printf>
    1bcd:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1bd0:	83 ec 08             	sub    $0x8,%esp
    1bd3:	68 90 46 00 00       	push   $0x4690
    1bd8:	68 c0 46 00 00       	push   $0x46c0
    1bdd:	e8 a5 19 00 00       	call   3587 <writeVariables>
    1be2:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1be5:	e9 c2 00 00 00       	jmp    1cac <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1bea:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1bed:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1bf0:	01 d0                	add    %edx,%eax
    1bf2:	0f b6 00             	movzbl (%eax),%eax
    1bf5:	84 c0                	test   %al,%al
    1bf7:	75 1d                	jne    1c16 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1bf9:	83 ec 0c             	sub    $0xc,%esp
    1bfc:	68 4a 39 00 00       	push   $0x394a
    1c01:	6a 00                	push   $0x0
    1c03:	6a 00                	push   $0x0
    1c05:	6a 01                	push   $0x1
    1c07:	6a 04                	push   $0x4
    1c09:	e8 3f 12 00 00       	call   2e4d <color_printf>
    1c0e:	83 c4 20             	add    $0x20,%esp
    1c11:	e9 96 00 00 00       	jmp    1cac <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1c16:	83 ec 0c             	sub    $0xc,%esp
    1c19:	68 60 39 00 00       	push   $0x3960
    1c1e:	6a 00                	push   $0x0
    1c20:	6a 00                	push   $0x0
    1c22:	6a 01                	push   $0x1
    1c24:	6a 04                	push   $0x4
    1c26:	e8 22 12 00 00       	call   2e4d <color_printf>
    1c2b:	83 c4 20             	add    $0x20,%esp
    1c2e:	eb 7c                	jmp    1cac <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1c30:	83 ec 0c             	sub    $0xc,%esp
    1c33:	68 81 39 00 00       	push   $0x3981
    1c38:	6a 00                	push   $0x0
    1c3a:	6a 00                	push   $0x0
    1c3c:	6a 01                	push   $0x1
    1c3e:	6a 04                	push   $0x4
    1c40:	e8 08 12 00 00       	call   2e4d <color_printf>
    1c45:	83 c4 20             	add    $0x20,%esp
    1c48:	eb 62                	jmp    1cac <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1c4a:	83 ec 0c             	sub    $0xc,%esp
    1c4d:	68 81 39 00 00       	push   $0x3981
    1c52:	6a 00                	push   $0x0
    1c54:	6a 00                	push   $0x0
    1c56:	6a 01                	push   $0x1
    1c58:	6a 04                	push   $0x4
    1c5a:	e8 ee 11 00 00       	call   2e4d <color_printf>
    1c5f:	83 c4 20             	add    $0x20,%esp
    1c62:	eb 48                	jmp    1cac <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1c64:	83 ec 0c             	sub    $0xc,%esp
    1c67:	ff 75 d4             	pushl  -0x2c(%ebp)
    1c6a:	e8 2b 01 00 00       	call   1d9a <Compute>
    1c6f:	83 c4 10             	add    $0x10,%esp
    1c72:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1c75:	dd 05 48 3a 00 00    	fldl   0x3a48
    1c7b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1c7f:	dd 1c 24             	fstpl  (%esp)
    1c82:	ff 75 ac             	pushl  -0x54(%ebp)
    1c85:	ff 75 a8             	pushl  -0x58(%ebp)
    1c88:	e8 96 f4 ff ff       	call   1123 <isEqual>
    1c8d:	83 c4 10             	add    $0x10,%esp
    1c90:	85 c0                	test   %eax,%eax
    1c92:	75 18                	jne    1cac <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1c94:	ff 75 ac             	pushl  -0x54(%ebp)
    1c97:	ff 75 a8             	pushl  -0x58(%ebp)
    1c9a:	68 99 39 00 00       	push   $0x3999
    1c9f:	6a 01                	push   $0x1
    1ca1:	e8 7f ea ff ff       	call   725 <printf>
    1ca6:	83 c4 10             	add    $0x10,%esp
    1ca9:	eb 01                	jmp    1cac <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1cab:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1cac:	e8 c8 e7 ff ff       	call   479 <exit>

00001cb1 <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1cb1:	55                   	push   %ebp
    1cb2:	89 e5                	mov    %esp,%ebp
    1cb4:	83 ec 04             	sub    $0x4,%esp
    1cb7:	8b 45 08             	mov    0x8(%ebp),%eax
    1cba:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1cbd:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1cc1:	83 e8 23             	sub    $0x23,%eax
    1cc4:	83 f8 0c             	cmp    $0xc,%eax
    1cc7:	77 25                	ja     1cee <GetLevel+0x3d>
    1cc9:	8b 04 85 a0 39 00 00 	mov    0x39a0(,%eax,4),%eax
    1cd0:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1cd2:	b8 01 00 00 00       	mov    $0x1,%eax
    1cd7:	eb 1a                	jmp    1cf3 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1cd9:	b8 02 00 00 00       	mov    $0x2,%eax
    1cde:	eb 13                	jmp    1cf3 <GetLevel+0x42>
    case '(':
        return 0;
    1ce0:	b8 00 00 00 00       	mov    $0x0,%eax
    1ce5:	eb 0c                	jmp    1cf3 <GetLevel+0x42>
    case '#':
        return -2;
    1ce7:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1cec:	eb 05                	jmp    1cf3 <GetLevel+0x42>
    };
    return -1;
    1cee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1cf3:	c9                   	leave  
    1cf4:	c3                   	ret    

00001cf5 <Operate>:

double Operate(double a1, char op, double a2)
{
    1cf5:	55                   	push   %ebp
    1cf6:	89 e5                	mov    %esp,%ebp
    1cf8:	83 ec 28             	sub    $0x28,%esp
    1cfb:	8b 45 10             	mov    0x10(%ebp),%eax
    1cfe:	8b 55 08             	mov    0x8(%ebp),%edx
    1d01:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1d04:	8b 55 0c             	mov    0xc(%ebp),%edx
    1d07:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1d0a:	88 45 ec             	mov    %al,-0x14(%ebp)
    1d0d:	8b 45 14             	mov    0x14(%ebp),%eax
    1d10:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1d13:	8b 45 18             	mov    0x18(%ebp),%eax
    1d16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1d19:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1d1d:	83 f8 2b             	cmp    $0x2b,%eax
    1d20:	74 18                	je     1d3a <Operate+0x45>
    1d22:	83 f8 2b             	cmp    $0x2b,%eax
    1d25:	7f 07                	jg     1d2e <Operate+0x39>
    1d27:	83 f8 2a             	cmp    $0x2a,%eax
    1d2a:	74 1e                	je     1d4a <Operate+0x55>
    1d2c:	eb 68                	jmp    1d96 <Operate+0xa1>
    1d2e:	83 f8 2d             	cmp    $0x2d,%eax
    1d31:	74 0f                	je     1d42 <Operate+0x4d>
    1d33:	83 f8 2f             	cmp    $0x2f,%eax
    1d36:	74 1a                	je     1d52 <Operate+0x5d>
    1d38:	eb 5c                	jmp    1d96 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1d3a:	dd 45 f0             	fldl   -0x10(%ebp)
    1d3d:	dc 45 e0             	faddl  -0x20(%ebp)
    1d40:	eb 56                	jmp    1d98 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1d42:	dd 45 f0             	fldl   -0x10(%ebp)
    1d45:	dc 65 e0             	fsubl  -0x20(%ebp)
    1d48:	eb 4e                	jmp    1d98 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1d4a:	dd 45 f0             	fldl   -0x10(%ebp)
    1d4d:	dc 4d e0             	fmull  -0x20(%ebp)
    1d50:	eb 46                	jmp    1d98 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1d52:	d9 ee                	fldz   
    1d54:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1d58:	dd 1c 24             	fstpl  (%esp)
    1d5b:	ff 75 e4             	pushl  -0x1c(%ebp)
    1d5e:	ff 75 e0             	pushl  -0x20(%ebp)
    1d61:	e8 bd f3 ff ff       	call   1123 <isEqual>
    1d66:	83 c4 10             	add    $0x10,%esp
    1d69:	83 f8 01             	cmp    $0x1,%eax
    1d6c:	75 20                	jne    1d8e <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1d6e:	83 ec 0c             	sub    $0xc,%esp
    1d71:	68 d4 39 00 00       	push   $0x39d4
    1d76:	6a 00                	push   $0x0
    1d78:	6a 00                	push   $0x0
    1d7a:	6a 01                	push   $0x1
    1d7c:	6a 04                	push   $0x4
    1d7e:	e8 ca 10 00 00       	call   2e4d <color_printf>
    1d83:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1d86:	dd 05 48 3a 00 00    	fldl   0x3a48
    1d8c:	eb 0a                	jmp    1d98 <Operate+0xa3>
        }
        else
          return a1 / a2;
    1d8e:	dd 45 f0             	fldl   -0x10(%ebp)
    1d91:	dc 75 e0             	fdivl  -0x20(%ebp)
    1d94:	eb 02                	jmp    1d98 <Operate+0xa3>
    };
    return 1;
    1d96:	d9 e8                	fld1   
}
    1d98:	c9                   	leave  
    1d99:	c3                   	ret    

00001d9a <Compute>:

double Compute(char *s)
{
    1d9a:	55                   	push   %ebp
    1d9b:	89 e5                	mov    %esp,%ebp
    1d9d:	53                   	push   %ebx
    1d9e:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1da4:	e8 44 14 00 00       	call   31ed <dstack>
    1da9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1dac:	e8 73 13 00 00       	call   3124 <cstack>
    1db1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1db4:	83 ec 08             	sub    $0x8,%esp
    1db7:	6a 23                	push   $0x23
    1db9:	ff 75 e0             	pushl  -0x20(%ebp)
    1dbc:	e8 91 13 00 00       	call   3152 <pushc>
    1dc1:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1dc4:	83 ec 0c             	sub    $0xc,%esp
    1dc7:	ff 75 08             	pushl  0x8(%ebp)
    1dca:	e8 e8 e4 ff ff       	call   2b7 <strlen>
    1dcf:	83 c4 10             	add    $0x10,%esp
    1dd2:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1dd5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1ddc:	c7 05 a0 46 00 00 00 	movl   $0x0,0x46a0
    1de3:	00 00 00 
    1de6:	e9 58 05 00 00       	jmp    2343 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1deb:	a1 a0 46 00 00       	mov    0x46a0,%eax
    1df0:	89 c2                	mov    %eax,%edx
    1df2:	8b 45 08             	mov    0x8(%ebp),%eax
    1df5:	01 d0                	add    %edx,%eax
    1df7:	0f b6 00             	movzbl (%eax),%eax
    1dfa:	3c 24                	cmp    $0x24,%al
    1dfc:	0f 85 f8 01 00 00    	jne    1ffa <Compute+0x260>
        {
          is_minus = 0;
    1e02:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1e09:	a1 a0 46 00 00       	mov    0x46a0,%eax
    1e0e:	83 c0 01             	add    $0x1,%eax
    1e11:	a3 a0 46 00 00       	mov    %eax,0x46a0
          if(s[g_pos] != '{')
    1e16:	a1 a0 46 00 00       	mov    0x46a0,%eax
    1e1b:	89 c2                	mov    %eax,%edx
    1e1d:	8b 45 08             	mov    0x8(%ebp),%eax
    1e20:	01 d0                	add    %edx,%eax
    1e22:	0f b6 00             	movzbl (%eax),%eax
    1e25:	3c 7b                	cmp    $0x7b,%al
    1e27:	74 23                	je     1e4c <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1e29:	83 ec 0c             	sub    $0xc,%esp
    1e2c:	68 ec 39 00 00       	push   $0x39ec
    1e31:	6a 00                	push   $0x0
    1e33:	6a 00                	push   $0x0
    1e35:	6a 01                	push   $0x1
    1e37:	6a 04                	push   $0x4
    1e39:	e8 0f 10 00 00       	call   2e4d <color_printf>
    1e3e:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1e41:	dd 05 48 3a 00 00    	fldl   0x3a48
    1e47:	e9 24 06 00 00       	jmp    2470 <Compute+0x6d6>
          }
          int i=g_pos+1;
    1e4c:	a1 a0 46 00 00       	mov    0x46a0,%eax
    1e51:	83 c0 01             	add    $0x1,%eax
    1e54:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1e57:	eb 13                	jmp    1e6c <Compute+0xd2>
          {
            if(s[i] == '}')
    1e59:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1e5c:	8b 45 08             	mov    0x8(%ebp),%eax
    1e5f:	01 d0                	add    %edx,%eax
    1e61:	0f b6 00             	movzbl (%eax),%eax
    1e64:	3c 7d                	cmp    $0x7d,%al
    1e66:	74 0e                	je     1e76 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1e68:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1e6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e6f:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1e72:	7c e5                	jl     1e59 <Compute+0xbf>
    1e74:	eb 01                	jmp    1e77 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1e76:	90                   	nop
          }
          if(s[i] != '}')
    1e77:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1e7a:	8b 45 08             	mov    0x8(%ebp),%eax
    1e7d:	01 d0                	add    %edx,%eax
    1e7f:	0f b6 00             	movzbl (%eax),%eax
    1e82:	3c 7d                	cmp    $0x7d,%al
    1e84:	74 23                	je     1ea9 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1e86:	83 ec 0c             	sub    $0xc,%esp
    1e89:	68 fa 39 00 00       	push   $0x39fa
    1e8e:	6a 00                	push   $0x0
    1e90:	6a 00                	push   $0x0
    1e92:	6a 01                	push   $0x1
    1e94:	6a 04                	push   $0x4
    1e96:	e8 b2 0f 00 00       	call   2e4d <color_printf>
    1e9b:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1e9e:	dd 05 48 3a 00 00    	fldl   0x3a48
    1ea4:	e9 c7 05 00 00       	jmp    2470 <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1ea9:	a1 a0 46 00 00       	mov    0x46a0,%eax
    1eae:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1eb1:	29 c2                	sub    %eax,%edx
    1eb3:	89 d0                	mov    %edx,%eax
    1eb5:	83 e8 01             	sub    $0x1,%eax
    1eb8:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1ebb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1ec2:	eb 27                	jmp    1eeb <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1ec4:	8b 15 a0 46 00 00    	mov    0x46a0,%edx
    1eca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ecd:	01 d0                	add    %edx,%eax
    1ecf:	8d 50 01             	lea    0x1(%eax),%edx
    1ed2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ed5:	01 d0                	add    %edx,%eax
    1ed7:	0f b6 00             	movzbl (%eax),%eax
    1eda:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1ee0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1ee3:	01 ca                	add    %ecx,%edx
    1ee5:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1ee7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1eeb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1eee:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1ef1:	7c d1                	jl     1ec4 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1ef3:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1ef9:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1efc:	01 d0                	add    %edx,%eax
    1efe:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1f01:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1f08:	a1 90 46 00 00       	mov    0x4690,%eax
    1f0d:	85 c0                	test   %eax,%eax
    1f0f:	75 40                	jne    1f51 <Compute+0x1b7>
            readVariables(variables,&v_num);
    1f11:	83 ec 08             	sub    $0x8,%esp
    1f14:	68 90 46 00 00       	push   $0x4690
    1f19:	68 c0 46 00 00       	push   $0x46c0
    1f1e:	e8 b0 13 00 00       	call   32d3 <readVariables>
    1f23:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1f26:	eb 29                	jmp    1f51 <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1f28:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f2b:	c1 e0 05             	shl    $0x5,%eax
    1f2e:	05 c0 46 00 00       	add    $0x46c0,%eax
    1f33:	8d 50 04             	lea    0x4(%eax),%edx
    1f36:	83 ec 08             	sub    $0x8,%esp
    1f39:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1f3f:	50                   	push   %eax
    1f40:	52                   	push   %edx
    1f41:	e8 32 e3 ff ff       	call   278 <strcmp>
    1f46:	83 c4 10             	add    $0x10,%esp
    1f49:	85 c0                	test   %eax,%eax
    1f4b:	74 10                	je     1f5d <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1f4d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1f51:	a1 90 46 00 00       	mov    0x4690,%eax
    1f56:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1f59:	7c cd                	jl     1f28 <Compute+0x18e>
    1f5b:	eb 01                	jmp    1f5e <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1f5d:	90                   	nop
          }
          if(index == v_num) //no such variable
    1f5e:	a1 90 46 00 00       	mov    0x4690,%eax
    1f63:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1f66:	75 2a                	jne    1f92 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1f68:	83 ec 08             	sub    $0x8,%esp
    1f6b:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1f71:	50                   	push   %eax
    1f72:	68 08 3a 00 00       	push   $0x3a08
    1f77:	6a 00                	push   $0x0
    1f79:	6a 00                	push   $0x0
    1f7b:	6a 01                	push   $0x1
    1f7d:	6a 04                	push   $0x4
    1f7f:	e8 c9 0e 00 00       	call   2e4d <color_printf>
    1f84:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1f87:	dd 05 48 3a 00 00    	fldl   0x3a48
    1f8d:	e9 de 04 00 00       	jmp    2470 <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1f92:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f95:	c1 e0 05             	shl    $0x5,%eax
    1f98:	05 c0 46 00 00       	add    $0x46c0,%eax
    1f9d:	8b 00                	mov    (%eax),%eax
    1f9f:	83 f8 02             	cmp    $0x2,%eax
    1fa2:	75 23                	jne    1fc7 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1fa4:	83 ec 0c             	sub    $0xc,%esp
    1fa7:	68 22 3a 00 00       	push   $0x3a22
    1fac:	6a 00                	push   $0x0
    1fae:	6a 00                	push   $0x0
    1fb0:	6a 01                	push   $0x1
    1fb2:	6a 04                	push   $0x4
    1fb4:	e8 94 0e 00 00       	call   2e4d <color_printf>
    1fb9:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1fbc:	dd 05 48 3a 00 00    	fldl   0x3a48
    1fc2:	e9 a9 04 00 00       	jmp    2470 <Compute+0x6d6>
          }
          g_pos = i+1;
    1fc7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1fca:	83 c0 01             	add    $0x1,%eax
    1fcd:	a3 a0 46 00 00       	mov    %eax,0x46a0
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    1fd2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1fd5:	c1 e0 05             	shl    $0x5,%eax
    1fd8:	05 d0 46 00 00       	add    $0x46d0,%eax
    1fdd:	dd 40 08             	fldl   0x8(%eax)
    1fe0:	83 ec 04             	sub    $0x4,%esp
    1fe3:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1fe7:	dd 1c 24             	fstpl  (%esp)
    1fea:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fed:	e8 2f 12 00 00       	call   3221 <pushd>
    1ff2:	83 c4 10             	add    $0x10,%esp
    1ff5:	e9 49 03 00 00       	jmp    2343 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    1ffa:	a1 a0 46 00 00       	mov    0x46a0,%eax
    1fff:	89 c2                	mov    %eax,%edx
    2001:	8b 45 08             	mov    0x8(%ebp),%eax
    2004:	01 d0                	add    %edx,%eax
    2006:	0f b6 00             	movzbl (%eax),%eax
    2009:	3c 2d                	cmp    $0x2d,%al
    200b:	75 3f                	jne    204c <Compute+0x2b2>
    200d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2011:	74 39                	je     204c <Compute+0x2b2>
        {
            pushd(opnd,0);
    2013:	83 ec 04             	sub    $0x4,%esp
    2016:	d9 ee                	fldz   
    2018:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    201c:	dd 1c 24             	fstpl  (%esp)
    201f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2022:	e8 fa 11 00 00       	call   3221 <pushd>
    2027:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    202a:	83 ec 08             	sub    $0x8,%esp
    202d:	6a 2d                	push   $0x2d
    202f:	ff 75 e0             	pushl  -0x20(%ebp)
    2032:	e8 1b 11 00 00       	call   3152 <pushc>
    2037:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    203a:	a1 a0 46 00 00       	mov    0x46a0,%eax
    203f:	83 c0 01             	add    $0x1,%eax
    2042:	a3 a0 46 00 00       	mov    %eax,0x46a0
    2047:	e9 f7 02 00 00       	jmp    2343 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    204c:	a1 a0 46 00 00       	mov    0x46a0,%eax
    2051:	89 c2                	mov    %eax,%edx
    2053:	8b 45 08             	mov    0x8(%ebp),%eax
    2056:	01 d0                	add    %edx,%eax
    2058:	0f b6 00             	movzbl (%eax),%eax
    205b:	3c 29                	cmp    $0x29,%al
    205d:	0f 85 01 01 00 00    	jne    2164 <Compute+0x3ca>
        {
            is_minus = 0;
    2063:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    206a:	a1 a0 46 00 00       	mov    0x46a0,%eax
    206f:	83 c0 01             	add    $0x1,%eax
    2072:	a3 a0 46 00 00       	mov    %eax,0x46a0
            while (topc(optr) != '(')
    2077:	e9 bf 00 00 00       	jmp    213b <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    207c:	83 ec 0c             	sub    $0xc,%esp
    207f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2082:	e8 37 12 00 00       	call   32be <topd>
    2087:	83 c4 10             	add    $0x10,%esp
    208a:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    208d:	83 ec 0c             	sub    $0xc,%esp
    2090:	ff 75 e4             	pushl  -0x1c(%ebp)
    2093:	e8 dd 11 00 00       	call   3275 <popd>
    2098:	dd d8                	fstp   %st(0)
    209a:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    209d:	83 ec 0c             	sub    $0xc,%esp
    20a0:	ff 75 e4             	pushl  -0x1c(%ebp)
    20a3:	e8 16 12 00 00       	call   32be <topd>
    20a8:	83 c4 10             	add    $0x10,%esp
    20ab:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    20ae:	83 ec 0c             	sub    $0xc,%esp
    20b1:	ff 75 e4             	pushl  -0x1c(%ebp)
    20b4:	e8 bc 11 00 00       	call   3275 <popd>
    20b9:	dd d8                	fstp   %st(0)
    20bb:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    20be:	83 ec 0c             	sub    $0xc,%esp
    20c1:	ff 75 e0             	pushl  -0x20(%ebp)
    20c4:	e8 11 11 00 00       	call   31da <topc>
    20c9:	83 c4 10             	add    $0x10,%esp
    20cc:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    20cf:	83 ec 0c             	sub    $0xc,%esp
    20d2:	ff 75 e0             	pushl  -0x20(%ebp)
    20d5:	e8 be 10 00 00       	call   3198 <popc>
    20da:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    20dd:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    20e1:	83 ec 0c             	sub    $0xc,%esp
    20e4:	ff 75 d4             	pushl  -0x2c(%ebp)
    20e7:	ff 75 d0             	pushl  -0x30(%ebp)
    20ea:	50                   	push   %eax
    20eb:	ff 75 cc             	pushl  -0x34(%ebp)
    20ee:	ff 75 c8             	pushl  -0x38(%ebp)
    20f1:	e8 ff fb ff ff       	call   1cf5 <Operate>
    20f6:	83 c4 20             	add    $0x20,%esp
    20f9:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    20fc:	dd 05 48 3a 00 00    	fldl   0x3a48
    2102:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2106:	dd 1c 24             	fstpl  (%esp)
    2109:	ff 75 bc             	pushl  -0x44(%ebp)
    210c:	ff 75 b8             	pushl  -0x48(%ebp)
    210f:	e8 0f f0 ff ff       	call   1123 <isEqual>
    2114:	83 c4 10             	add    $0x10,%esp
    2117:	83 f8 01             	cmp    $0x1,%eax
    211a:	75 0b                	jne    2127 <Compute+0x38d>
                  return WRONG_ANS;
    211c:	dd 05 48 3a 00 00    	fldl   0x3a48
    2122:	e9 49 03 00 00       	jmp    2470 <Compute+0x6d6>
                pushd(opnd,result);
    2127:	83 ec 04             	sub    $0x4,%esp
    212a:	ff 75 bc             	pushl  -0x44(%ebp)
    212d:	ff 75 b8             	pushl  -0x48(%ebp)
    2130:	ff 75 e4             	pushl  -0x1c(%ebp)
    2133:	e8 e9 10 00 00       	call   3221 <pushd>
    2138:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    213b:	83 ec 0c             	sub    $0xc,%esp
    213e:	ff 75 e0             	pushl  -0x20(%ebp)
    2141:	e8 94 10 00 00       	call   31da <topc>
    2146:	83 c4 10             	add    $0x10,%esp
    2149:	3c 28                	cmp    $0x28,%al
    214b:	0f 85 2b ff ff ff    	jne    207c <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    2151:	83 ec 0c             	sub    $0xc,%esp
    2154:	ff 75 e0             	pushl  -0x20(%ebp)
    2157:	e8 3c 10 00 00       	call   3198 <popc>
    215c:	83 c4 10             	add    $0x10,%esp
    215f:	e9 df 01 00 00       	jmp    2343 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    2164:	a1 a0 46 00 00       	mov    0x46a0,%eax
    2169:	89 c2                	mov    %eax,%edx
    216b:	8b 45 08             	mov    0x8(%ebp),%eax
    216e:	01 d0                	add    %edx,%eax
    2170:	0f b6 00             	movzbl (%eax),%eax
    2173:	3c 2f                	cmp    $0x2f,%al
    2175:	7e 49                	jle    21c0 <Compute+0x426>
    2177:	a1 a0 46 00 00       	mov    0x46a0,%eax
    217c:	89 c2                	mov    %eax,%edx
    217e:	8b 45 08             	mov    0x8(%ebp),%eax
    2181:	01 d0                	add    %edx,%eax
    2183:	0f b6 00             	movzbl (%eax),%eax
    2186:	3c 39                	cmp    $0x39,%al
    2188:	7f 36                	jg     21c0 <Compute+0x426>
        {
            is_minus = 0;
    218a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    2191:	83 ec 08             	sub    $0x8,%esp
    2194:	68 a0 46 00 00       	push   $0x46a0
    2199:	ff 75 08             	pushl  0x8(%ebp)
    219c:	e8 c3 eb ff ff       	call   d64 <Translation>
    21a1:	83 c4 10             	add    $0x10,%esp
    21a4:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    21a7:	83 ec 04             	sub    $0x4,%esp
    21aa:	ff 75 b4             	pushl  -0x4c(%ebp)
    21ad:	ff 75 b0             	pushl  -0x50(%ebp)
    21b0:	ff 75 e4             	pushl  -0x1c(%ebp)
    21b3:	e8 69 10 00 00       	call   3221 <pushd>
    21b8:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    21bb:	e9 83 01 00 00       	jmp    2343 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    21c0:	a1 a0 46 00 00       	mov    0x46a0,%eax
    21c5:	89 c2                	mov    %eax,%edx
    21c7:	8b 45 08             	mov    0x8(%ebp),%eax
    21ca:	01 d0                	add    %edx,%eax
    21cc:	0f b6 00             	movzbl (%eax),%eax
    21cf:	3c 28                	cmp    $0x28,%al
    21d1:	0f 85 f9 00 00 00    	jne    22d0 <Compute+0x536>
        {
            is_minus = 1;
    21d7:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    21de:	a1 a0 46 00 00       	mov    0x46a0,%eax
    21e3:	89 c2                	mov    %eax,%edx
    21e5:	8b 45 08             	mov    0x8(%ebp),%eax
    21e8:	01 d0                	add    %edx,%eax
    21ea:	0f b6 00             	movzbl (%eax),%eax
    21ed:	0f be c0             	movsbl %al,%eax
    21f0:	83 ec 08             	sub    $0x8,%esp
    21f3:	50                   	push   %eax
    21f4:	ff 75 e0             	pushl  -0x20(%ebp)
    21f7:	e8 56 0f 00 00       	call   3152 <pushc>
    21fc:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    21ff:	a1 a0 46 00 00       	mov    0x46a0,%eax
    2204:	83 c0 01             	add    $0x1,%eax
    2207:	a3 a0 46 00 00       	mov    %eax,0x46a0
    220c:	e9 32 01 00 00       	jmp    2343 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    2211:	83 ec 0c             	sub    $0xc,%esp
    2214:	ff 75 e4             	pushl  -0x1c(%ebp)
    2217:	e8 a2 10 00 00       	call   32be <topd>
    221c:	83 c4 10             	add    $0x10,%esp
    221f:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    2222:	83 ec 0c             	sub    $0xc,%esp
    2225:	ff 75 e4             	pushl  -0x1c(%ebp)
    2228:	e8 48 10 00 00       	call   3275 <popd>
    222d:	dd d8                	fstp   %st(0)
    222f:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2232:	83 ec 0c             	sub    $0xc,%esp
    2235:	ff 75 e4             	pushl  -0x1c(%ebp)
    2238:	e8 81 10 00 00       	call   32be <topd>
    223d:	83 c4 10             	add    $0x10,%esp
    2240:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    2243:	83 ec 0c             	sub    $0xc,%esp
    2246:	ff 75 e4             	pushl  -0x1c(%ebp)
    2249:	e8 27 10 00 00       	call   3275 <popd>
    224e:	dd d8                	fstp   %st(0)
    2250:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    2253:	83 ec 0c             	sub    $0xc,%esp
    2256:	ff 75 e0             	pushl  -0x20(%ebp)
    2259:	e8 7c 0f 00 00       	call   31da <topc>
    225e:	83 c4 10             	add    $0x10,%esp
    2261:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    2264:	83 ec 0c             	sub    $0xc,%esp
    2267:	ff 75 e0             	pushl  -0x20(%ebp)
    226a:	e8 29 0f 00 00       	call   3198 <popc>
    226f:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    2272:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    2276:	83 ec 0c             	sub    $0xc,%esp
    2279:	ff 75 ac             	pushl  -0x54(%ebp)
    227c:	ff 75 a8             	pushl  -0x58(%ebp)
    227f:	50                   	push   %eax
    2280:	ff 75 a4             	pushl  -0x5c(%ebp)
    2283:	ff 75 a0             	pushl  -0x60(%ebp)
    2286:	e8 6a fa ff ff       	call   1cf5 <Operate>
    228b:	83 c4 20             	add    $0x20,%esp
    228e:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    2291:	dd 05 48 3a 00 00    	fldl   0x3a48
    2297:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    229b:	dd 1c 24             	fstpl  (%esp)
    229e:	ff 75 94             	pushl  -0x6c(%ebp)
    22a1:	ff 75 90             	pushl  -0x70(%ebp)
    22a4:	e8 7a ee ff ff       	call   1123 <isEqual>
    22a9:	83 c4 10             	add    $0x10,%esp
    22ac:	83 f8 01             	cmp    $0x1,%eax
    22af:	75 0b                	jne    22bc <Compute+0x522>
                  return WRONG_ANS;
    22b1:	dd 05 48 3a 00 00    	fldl   0x3a48
    22b7:	e9 b4 01 00 00       	jmp    2470 <Compute+0x6d6>
                pushd(opnd,result);
    22bc:	83 ec 04             	sub    $0x4,%esp
    22bf:	ff 75 94             	pushl  -0x6c(%ebp)
    22c2:	ff 75 90             	pushl  -0x70(%ebp)
    22c5:	ff 75 e4             	pushl  -0x1c(%ebp)
    22c8:	e8 54 0f 00 00       	call   3221 <pushd>
    22cd:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    22d0:	a1 a0 46 00 00       	mov    0x46a0,%eax
    22d5:	89 c2                	mov    %eax,%edx
    22d7:	8b 45 08             	mov    0x8(%ebp),%eax
    22da:	01 d0                	add    %edx,%eax
    22dc:	0f b6 00             	movzbl (%eax),%eax
    22df:	0f be c0             	movsbl %al,%eax
    22e2:	83 ec 0c             	sub    $0xc,%esp
    22e5:	50                   	push   %eax
    22e6:	e8 c6 f9 ff ff       	call   1cb1 <GetLevel>
    22eb:	83 c4 10             	add    $0x10,%esp
    22ee:	89 c3                	mov    %eax,%ebx
    22f0:	83 ec 0c             	sub    $0xc,%esp
    22f3:	ff 75 e0             	pushl  -0x20(%ebp)
    22f6:	e8 df 0e 00 00       	call   31da <topc>
    22fb:	83 c4 10             	add    $0x10,%esp
    22fe:	0f be c0             	movsbl %al,%eax
    2301:	83 ec 0c             	sub    $0xc,%esp
    2304:	50                   	push   %eax
    2305:	e8 a7 f9 ff ff       	call   1cb1 <GetLevel>
    230a:	83 c4 10             	add    $0x10,%esp
    230d:	39 c3                	cmp    %eax,%ebx
    230f:	0f 8e fc fe ff ff    	jle    2211 <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    2315:	a1 a0 46 00 00       	mov    0x46a0,%eax
    231a:	89 c2                	mov    %eax,%edx
    231c:	8b 45 08             	mov    0x8(%ebp),%eax
    231f:	01 d0                	add    %edx,%eax
    2321:	0f b6 00             	movzbl (%eax),%eax
    2324:	0f be c0             	movsbl %al,%eax
    2327:	83 ec 08             	sub    $0x8,%esp
    232a:	50                   	push   %eax
    232b:	ff 75 e0             	pushl  -0x20(%ebp)
    232e:	e8 1f 0e 00 00       	call   3152 <pushc>
    2333:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2336:	a1 a0 46 00 00       	mov    0x46a0,%eax
    233b:	83 c0 01             	add    $0x1,%eax
    233e:	a3 a0 46 00 00       	mov    %eax,0x46a0
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    2343:	a1 a0 46 00 00       	mov    0x46a0,%eax
    2348:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    234b:	0f 8c 9a fa ff ff    	jl     1deb <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2351:	e9 da 00 00 00       	jmp    2430 <Compute+0x696>
    {
        double a2 = topd(opnd);
    2356:	83 ec 0c             	sub    $0xc,%esp
    2359:	ff 75 e4             	pushl  -0x1c(%ebp)
    235c:	e8 5d 0f 00 00       	call   32be <topd>
    2361:	83 c4 10             	add    $0x10,%esp
    2364:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    2367:	83 ec 0c             	sub    $0xc,%esp
    236a:	ff 75 e4             	pushl  -0x1c(%ebp)
    236d:	e8 03 0f 00 00       	call   3275 <popd>
    2372:	dd d8                	fstp   %st(0)
    2374:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    2377:	83 ec 0c             	sub    $0xc,%esp
    237a:	ff 75 e4             	pushl  -0x1c(%ebp)
    237d:	e8 3c 0f 00 00       	call   32be <topd>
    2382:	83 c4 10             	add    $0x10,%esp
    2385:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    238b:	83 ec 0c             	sub    $0xc,%esp
    238e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2391:	e8 df 0e 00 00       	call   3275 <popd>
    2396:	dd d8                	fstp   %st(0)
    2398:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    239b:	83 ec 0c             	sub    $0xc,%esp
    239e:	ff 75 e0             	pushl  -0x20(%ebp)
    23a1:	e8 34 0e 00 00       	call   31da <topc>
    23a6:	83 c4 10             	add    $0x10,%esp
    23a9:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    23af:	83 ec 0c             	sub    $0xc,%esp
    23b2:	ff 75 e0             	pushl  -0x20(%ebp)
    23b5:	e8 de 0d 00 00       	call   3198 <popc>
    23ba:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    23bd:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    23c4:	83 ec 0c             	sub    $0xc,%esp
    23c7:	ff 75 84             	pushl  -0x7c(%ebp)
    23ca:	ff 75 80             	pushl  -0x80(%ebp)
    23cd:	50                   	push   %eax
    23ce:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    23d4:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    23da:	e8 16 f9 ff ff       	call   1cf5 <Operate>
    23df:	83 c4 20             	add    $0x20,%esp
    23e2:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    23e8:	dd 05 48 3a 00 00    	fldl   0x3a48
    23ee:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    23f2:	dd 1c 24             	fstpl  (%esp)
    23f5:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    23fb:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2401:	e8 1d ed ff ff       	call   1123 <isEqual>
    2406:	83 c4 10             	add    $0x10,%esp
    2409:	83 f8 01             	cmp    $0x1,%eax
    240c:	75 08                	jne    2416 <Compute+0x67c>
          return WRONG_ANS;
    240e:	dd 05 48 3a 00 00    	fldl   0x3a48
    2414:	eb 5a                	jmp    2470 <Compute+0x6d6>
        pushd(opnd,result);
    2416:	83 ec 04             	sub    $0x4,%esp
    2419:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    241f:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2425:	ff 75 e4             	pushl  -0x1c(%ebp)
    2428:	e8 f4 0d 00 00       	call   3221 <pushd>
    242d:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2430:	83 ec 0c             	sub    $0xc,%esp
    2433:	ff 75 e0             	pushl  -0x20(%ebp)
    2436:	e8 9f 0d 00 00       	call   31da <topc>
    243b:	83 c4 10             	add    $0x10,%esp
    243e:	3c 23                	cmp    $0x23,%al
    2440:	0f 85 10 ff ff ff    	jne    2356 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    2446:	83 ec 0c             	sub    $0xc,%esp
    2449:	ff 75 e4             	pushl  -0x1c(%ebp)
    244c:	e8 94 e4 ff ff       	call   8e5 <free>
    2451:	83 c4 10             	add    $0x10,%esp
    free(optr);
    2454:	83 ec 0c             	sub    $0xc,%esp
    2457:	ff 75 e0             	pushl  -0x20(%ebp)
    245a:	e8 86 e4 ff ff       	call   8e5 <free>
    245f:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    2462:	83 ec 0c             	sub    $0xc,%esp
    2465:	ff 75 e4             	pushl  -0x1c(%ebp)
    2468:	e8 51 0e 00 00       	call   32be <topd>
    246d:	83 c4 10             	add    $0x10,%esp
}
    2470:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2473:	c9                   	leave  
    2474:	c3                   	ret    

00002475 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    2475:	55                   	push   %ebp
    2476:	89 e5                	mov    %esp,%ebp
    2478:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    247b:	8b 45 08             	mov    0x8(%ebp),%eax
    247e:	8b 00                	mov    (%eax),%eax
    2480:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2483:	eb 04                	jmp    2489 <gettoken+0x14>
    s++;
    2485:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2489:	8b 45 f4             	mov    -0xc(%ebp),%eax
    248c:	3b 45 0c             	cmp    0xc(%ebp),%eax
    248f:	73 1e                	jae    24af <gettoken+0x3a>
    2491:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2494:	0f b6 00             	movzbl (%eax),%eax
    2497:	0f be c0             	movsbl %al,%eax
    249a:	83 ec 08             	sub    $0x8,%esp
    249d:	50                   	push   %eax
    249e:	68 f4 45 00 00       	push   $0x45f4
    24a3:	e8 50 de ff ff       	call   2f8 <strchr>
    24a8:	83 c4 10             	add    $0x10,%esp
    24ab:	85 c0                	test   %eax,%eax
    24ad:	75 d6                	jne    2485 <gettoken+0x10>
    s++;
  if(q)
    24af:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    24b3:	74 08                	je     24bd <gettoken+0x48>
    *q = s;
    24b5:	8b 45 10             	mov    0x10(%ebp),%eax
    24b8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    24bb:	89 10                	mov    %edx,(%eax)
  ret = *s;
    24bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24c0:	0f b6 00             	movzbl (%eax),%eax
    24c3:	0f be c0             	movsbl %al,%eax
    24c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    24c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24cc:	0f b6 00             	movzbl (%eax),%eax
    24cf:	0f be c0             	movsbl %al,%eax
    24d2:	83 f8 29             	cmp    $0x29,%eax
    24d5:	7f 14                	jg     24eb <gettoken+0x76>
    24d7:	83 f8 28             	cmp    $0x28,%eax
    24da:	7d 28                	jge    2504 <gettoken+0x8f>
    24dc:	85 c0                	test   %eax,%eax
    24de:	0f 84 94 00 00 00    	je     2578 <gettoken+0x103>
    24e4:	83 f8 26             	cmp    $0x26,%eax
    24e7:	74 1b                	je     2504 <gettoken+0x8f>
    24e9:	eb 3a                	jmp    2525 <gettoken+0xb0>
    24eb:	83 f8 3e             	cmp    $0x3e,%eax
    24ee:	74 1a                	je     250a <gettoken+0x95>
    24f0:	83 f8 3e             	cmp    $0x3e,%eax
    24f3:	7f 0a                	jg     24ff <gettoken+0x8a>
    24f5:	83 e8 3b             	sub    $0x3b,%eax
    24f8:	83 f8 01             	cmp    $0x1,%eax
    24fb:	77 28                	ja     2525 <gettoken+0xb0>
    24fd:	eb 05                	jmp    2504 <gettoken+0x8f>
    24ff:	83 f8 7c             	cmp    $0x7c,%eax
    2502:	75 21                	jne    2525 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    2504:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    2508:	eb 75                	jmp    257f <gettoken+0x10a>
  case '>':
    s++;
    250a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    250e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2511:	0f b6 00             	movzbl (%eax),%eax
    2514:	3c 3e                	cmp    $0x3e,%al
    2516:	75 63                	jne    257b <gettoken+0x106>
      ret = '+';
    2518:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    251f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    2523:	eb 56                	jmp    257b <gettoken+0x106>
  default:
    ret = 'a';
    2525:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    252c:	eb 04                	jmp    2532 <gettoken+0xbd>
      s++;
    252e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2532:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2535:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2538:	73 44                	jae    257e <gettoken+0x109>
    253a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    253d:	0f b6 00             	movzbl (%eax),%eax
    2540:	0f be c0             	movsbl %al,%eax
    2543:	83 ec 08             	sub    $0x8,%esp
    2546:	50                   	push   %eax
    2547:	68 f4 45 00 00       	push   $0x45f4
    254c:	e8 a7 dd ff ff       	call   2f8 <strchr>
    2551:	83 c4 10             	add    $0x10,%esp
    2554:	85 c0                	test   %eax,%eax
    2556:	75 26                	jne    257e <gettoken+0x109>
    2558:	8b 45 f4             	mov    -0xc(%ebp),%eax
    255b:	0f b6 00             	movzbl (%eax),%eax
    255e:	0f be c0             	movsbl %al,%eax
    2561:	83 ec 08             	sub    $0x8,%esp
    2564:	50                   	push   %eax
    2565:	68 fc 45 00 00       	push   $0x45fc
    256a:	e8 89 dd ff ff       	call   2f8 <strchr>
    256f:	83 c4 10             	add    $0x10,%esp
    2572:	85 c0                	test   %eax,%eax
    2574:	74 b8                	je     252e <gettoken+0xb9>
      s++;
    break;
    2576:	eb 06                	jmp    257e <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    2578:	90                   	nop
    2579:	eb 04                	jmp    257f <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    257b:	90                   	nop
    257c:	eb 01                	jmp    257f <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    257e:	90                   	nop
  }
  if(eq)
    257f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2583:	74 0e                	je     2593 <gettoken+0x11e>
    *eq = s;
    2585:	8b 45 14             	mov    0x14(%ebp),%eax
    2588:	8b 55 f4             	mov    -0xc(%ebp),%edx
    258b:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    258d:	eb 04                	jmp    2593 <gettoken+0x11e>
    s++;
    258f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    2593:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2596:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2599:	73 1e                	jae    25b9 <gettoken+0x144>
    259b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    259e:	0f b6 00             	movzbl (%eax),%eax
    25a1:	0f be c0             	movsbl %al,%eax
    25a4:	83 ec 08             	sub    $0x8,%esp
    25a7:	50                   	push   %eax
    25a8:	68 f4 45 00 00       	push   $0x45f4
    25ad:	e8 46 dd ff ff       	call   2f8 <strchr>
    25b2:	83 c4 10             	add    $0x10,%esp
    25b5:	85 c0                	test   %eax,%eax
    25b7:	75 d6                	jne    258f <gettoken+0x11a>
    s++;
  *ps = s;
    25b9:	8b 45 08             	mov    0x8(%ebp),%eax
    25bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    25bf:	89 10                	mov    %edx,(%eax)
  return ret;
    25c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    25c4:	c9                   	leave  
    25c5:	c3                   	ret    

000025c6 <peek>:

int peek(char **ps, char *es, char *toks)
{
    25c6:	55                   	push   %ebp
    25c7:	89 e5                	mov    %esp,%ebp
    25c9:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    25cc:	8b 45 08             	mov    0x8(%ebp),%eax
    25cf:	8b 00                	mov    (%eax),%eax
    25d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    25d4:	eb 04                	jmp    25da <peek+0x14>
    s++;
    25d6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    25da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25dd:	3b 45 0c             	cmp    0xc(%ebp),%eax
    25e0:	73 1e                	jae    2600 <peek+0x3a>
    25e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25e5:	0f b6 00             	movzbl (%eax),%eax
    25e8:	0f be c0             	movsbl %al,%eax
    25eb:	83 ec 08             	sub    $0x8,%esp
    25ee:	50                   	push   %eax
    25ef:	68 f4 45 00 00       	push   $0x45f4
    25f4:	e8 ff dc ff ff       	call   2f8 <strchr>
    25f9:	83 c4 10             	add    $0x10,%esp
    25fc:	85 c0                	test   %eax,%eax
    25fe:	75 d6                	jne    25d6 <peek+0x10>
    s++;
  *ps = s;
    2600:	8b 45 08             	mov    0x8(%ebp),%eax
    2603:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2606:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    2608:	8b 45 f4             	mov    -0xc(%ebp),%eax
    260b:	0f b6 00             	movzbl (%eax),%eax
    260e:	84 c0                	test   %al,%al
    2610:	74 23                	je     2635 <peek+0x6f>
    2612:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2615:	0f b6 00             	movzbl (%eax),%eax
    2618:	0f be c0             	movsbl %al,%eax
    261b:	83 ec 08             	sub    $0x8,%esp
    261e:	50                   	push   %eax
    261f:	ff 75 10             	pushl  0x10(%ebp)
    2622:	e8 d1 dc ff ff       	call   2f8 <strchr>
    2627:	83 c4 10             	add    $0x10,%esp
    262a:	85 c0                	test   %eax,%eax
    262c:	74 07                	je     2635 <peek+0x6f>
    262e:	b8 01 00 00 00       	mov    $0x1,%eax
    2633:	eb 05                	jmp    263a <peek+0x74>
    2635:	b8 00 00 00 00       	mov    $0x0,%eax
}
    263a:	c9                   	leave  
    263b:	c3                   	ret    

0000263c <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    263c:	55                   	push   %ebp
    263d:	89 e5                	mov    %esp,%ebp
    263f:	53                   	push   %ebx
    2640:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    2643:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2646:	8b 45 08             	mov    0x8(%ebp),%eax
    2649:	83 ec 0c             	sub    $0xc,%esp
    264c:	50                   	push   %eax
    264d:	e8 65 dc ff ff       	call   2b7 <strlen>
    2652:	83 c4 10             	add    $0x10,%esp
    2655:	01 d8                	add    %ebx,%eax
    2657:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    265a:	8b 45 08             	mov    0x8(%ebp),%eax
    265d:	0f b6 00             	movzbl (%eax),%eax
    2660:	3c 25                	cmp    $0x25,%al
    2662:	75 5d                	jne    26c1 <parsecmd+0x85>
  {
    int len = strlen(s);
    2664:	8b 45 08             	mov    0x8(%ebp),%eax
    2667:	83 ec 0c             	sub    $0xc,%esp
    266a:	50                   	push   %eax
    266b:	e8 47 dc ff ff       	call   2b7 <strlen>
    2670:	83 c4 10             	add    $0x10,%esp
    2673:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    2676:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2679:	83 ec 0c             	sub    $0xc,%esp
    267c:	50                   	push   %eax
    267d:	e8 a5 e3 ff ff       	call   a27 <malloc>
    2682:	83 c4 10             	add    $0x10,%esp
    2685:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    2688:	8b 45 08             	mov    0x8(%ebp),%eax
    268b:	83 c0 01             	add    $0x1,%eax
    268e:	83 ec 08             	sub    $0x8,%esp
    2691:	50                   	push   %eax
    2692:	ff 75 ec             	pushl  -0x14(%ebp)
    2695:	e8 ae db ff ff       	call   248 <strcpy>
    269a:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    269d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    26a0:	8d 50 fe             	lea    -0x2(%eax),%edx
    26a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    26a6:	01 d0                	add    %edx,%eax
    26a8:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    26ab:	83 ec 0c             	sub    $0xc,%esp
    26ae:	ff 75 ec             	pushl  -0x14(%ebp)
    26b1:	e8 59 e9 ff ff       	call   100f <calcmd>
    26b6:	83 c4 10             	add    $0x10,%esp
    26b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    26bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    26bf:	eb 6b                	jmp    272c <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    26c1:	83 ec 08             	sub    $0x8,%esp
    26c4:	ff 75 f4             	pushl  -0xc(%ebp)
    26c7:	8d 45 08             	lea    0x8(%ebp),%eax
    26ca:	50                   	push   %eax
    26cb:	e8 61 00 00 00       	call   2731 <parseline>
    26d0:	83 c4 10             	add    $0x10,%esp
    26d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    26d6:	83 ec 04             	sub    $0x4,%esp
    26d9:	68 50 3a 00 00       	push   $0x3a50
    26de:	ff 75 f4             	pushl  -0xc(%ebp)
    26e1:	8d 45 08             	lea    0x8(%ebp),%eax
    26e4:	50                   	push   %eax
    26e5:	e8 dc fe ff ff       	call   25c6 <peek>
    26ea:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    26ed:	8b 45 08             	mov    0x8(%ebp),%eax
    26f0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    26f3:	74 26                	je     271b <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    26f5:	8b 45 08             	mov    0x8(%ebp),%eax
    26f8:	83 ec 04             	sub    $0x4,%esp
    26fb:	50                   	push   %eax
    26fc:	68 51 3a 00 00       	push   $0x3a51
    2701:	6a 02                	push   $0x2
    2703:	e8 1d e0 ff ff       	call   725 <printf>
    2708:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    270b:	83 ec 0c             	sub    $0xc,%esp
    270e:	68 60 3a 00 00       	push   $0x3a60
    2713:	e8 f2 e3 ff ff       	call   b0a <panic1>
    2718:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    271b:	83 ec 0c             	sub    $0xc,%esp
    271e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2721:	e8 eb 03 00 00       	call   2b11 <nulterminate>
    2726:	83 c4 10             	add    $0x10,%esp
  return cmd;
    2729:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    272c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    272f:	c9                   	leave  
    2730:	c3                   	ret    

00002731 <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    2731:	55                   	push   %ebp
    2732:	89 e5                	mov    %esp,%ebp
    2734:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    2737:	83 ec 08             	sub    $0x8,%esp
    273a:	ff 75 0c             	pushl  0xc(%ebp)
    273d:	ff 75 08             	pushl  0x8(%ebp)
    2740:	e8 99 00 00 00       	call   27de <parsepipe>
    2745:	83 c4 10             	add    $0x10,%esp
    2748:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    274b:	eb 23                	jmp    2770 <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    274d:	6a 00                	push   $0x0
    274f:	6a 00                	push   $0x0
    2751:	ff 75 0c             	pushl  0xc(%ebp)
    2754:	ff 75 08             	pushl  0x8(%ebp)
    2757:	e8 19 fd ff ff       	call   2475 <gettoken>
    275c:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    275f:	83 ec 0c             	sub    $0xc,%esp
    2762:	ff 75 f4             	pushl  -0xc(%ebp)
    2765:	e8 66 e8 ff ff       	call   fd0 <backcmd>
    276a:	83 c4 10             	add    $0x10,%esp
    276d:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    2770:	83 ec 04             	sub    $0x4,%esp
    2773:	68 67 3a 00 00       	push   $0x3a67
    2778:	ff 75 0c             	pushl  0xc(%ebp)
    277b:	ff 75 08             	pushl  0x8(%ebp)
    277e:	e8 43 fe ff ff       	call   25c6 <peek>
    2783:	83 c4 10             	add    $0x10,%esp
    2786:	85 c0                	test   %eax,%eax
    2788:	75 c3                	jne    274d <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    278a:	83 ec 04             	sub    $0x4,%esp
    278d:	68 69 3a 00 00       	push   $0x3a69
    2792:	ff 75 0c             	pushl  0xc(%ebp)
    2795:	ff 75 08             	pushl  0x8(%ebp)
    2798:	e8 29 fe ff ff       	call   25c6 <peek>
    279d:	83 c4 10             	add    $0x10,%esp
    27a0:	85 c0                	test   %eax,%eax
    27a2:	74 35                	je     27d9 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    27a4:	6a 00                	push   $0x0
    27a6:	6a 00                	push   $0x0
    27a8:	ff 75 0c             	pushl  0xc(%ebp)
    27ab:	ff 75 08             	pushl  0x8(%ebp)
    27ae:	e8 c2 fc ff ff       	call   2475 <gettoken>
    27b3:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    27b6:	83 ec 08             	sub    $0x8,%esp
    27b9:	ff 75 0c             	pushl  0xc(%ebp)
    27bc:	ff 75 08             	pushl  0x8(%ebp)
    27bf:	e8 6d ff ff ff       	call   2731 <parseline>
    27c4:	83 c4 10             	add    $0x10,%esp
    27c7:	83 ec 08             	sub    $0x8,%esp
    27ca:	50                   	push   %eax
    27cb:	ff 75 f4             	pushl  -0xc(%ebp)
    27ce:	e8 b5 e7 ff ff       	call   f88 <listcmd>
    27d3:	83 c4 10             	add    $0x10,%esp
    27d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    27d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    27dc:	c9                   	leave  
    27dd:	c3                   	ret    

000027de <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    27de:	55                   	push   %ebp
    27df:	89 e5                	mov    %esp,%ebp
    27e1:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    27e4:	83 ec 08             	sub    $0x8,%esp
    27e7:	ff 75 0c             	pushl  0xc(%ebp)
    27ea:	ff 75 08             	pushl  0x8(%ebp)
    27ed:	e8 ec 01 00 00       	call   29de <parseexec>
    27f2:	83 c4 10             	add    $0x10,%esp
    27f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    27f8:	83 ec 04             	sub    $0x4,%esp
    27fb:	68 6b 3a 00 00       	push   $0x3a6b
    2800:	ff 75 0c             	pushl  0xc(%ebp)
    2803:	ff 75 08             	pushl  0x8(%ebp)
    2806:	e8 bb fd ff ff       	call   25c6 <peek>
    280b:	83 c4 10             	add    $0x10,%esp
    280e:	85 c0                	test   %eax,%eax
    2810:	74 35                	je     2847 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2812:	6a 00                	push   $0x0
    2814:	6a 00                	push   $0x0
    2816:	ff 75 0c             	pushl  0xc(%ebp)
    2819:	ff 75 08             	pushl  0x8(%ebp)
    281c:	e8 54 fc ff ff       	call   2475 <gettoken>
    2821:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2824:	83 ec 08             	sub    $0x8,%esp
    2827:	ff 75 0c             	pushl  0xc(%ebp)
    282a:	ff 75 08             	pushl  0x8(%ebp)
    282d:	e8 ac ff ff ff       	call   27de <parsepipe>
    2832:	83 c4 10             	add    $0x10,%esp
    2835:	83 ec 08             	sub    $0x8,%esp
    2838:	50                   	push   %eax
    2839:	ff 75 f4             	pushl  -0xc(%ebp)
    283c:	e8 ff e6 ff ff       	call   f40 <pipecmd>
    2841:	83 c4 10             	add    $0x10,%esp
    2844:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2847:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    284a:	c9                   	leave  
    284b:	c3                   	ret    

0000284c <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    284c:	55                   	push   %ebp
    284d:	89 e5                	mov    %esp,%ebp
    284f:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2852:	e9 b6 00 00 00       	jmp    290d <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    2857:	6a 00                	push   $0x0
    2859:	6a 00                	push   $0x0
    285b:	ff 75 10             	pushl  0x10(%ebp)
    285e:	ff 75 0c             	pushl  0xc(%ebp)
    2861:	e8 0f fc ff ff       	call   2475 <gettoken>
    2866:	83 c4 10             	add    $0x10,%esp
    2869:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    286c:	8d 45 ec             	lea    -0x14(%ebp),%eax
    286f:	50                   	push   %eax
    2870:	8d 45 f0             	lea    -0x10(%ebp),%eax
    2873:	50                   	push   %eax
    2874:	ff 75 10             	pushl  0x10(%ebp)
    2877:	ff 75 0c             	pushl  0xc(%ebp)
    287a:	e8 f6 fb ff ff       	call   2475 <gettoken>
    287f:	83 c4 10             	add    $0x10,%esp
    2882:	83 f8 61             	cmp    $0x61,%eax
    2885:	74 10                	je     2897 <parseredirs+0x4b>
      panic1("missing file for redirection");
    2887:	83 ec 0c             	sub    $0xc,%esp
    288a:	68 6d 3a 00 00       	push   $0x3a6d
    288f:	e8 76 e2 ff ff       	call   b0a <panic1>
    2894:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    2897:	8b 45 f4             	mov    -0xc(%ebp),%eax
    289a:	83 f8 3c             	cmp    $0x3c,%eax
    289d:	74 0c                	je     28ab <parseredirs+0x5f>
    289f:	83 f8 3e             	cmp    $0x3e,%eax
    28a2:	74 26                	je     28ca <parseredirs+0x7e>
    28a4:	83 f8 2b             	cmp    $0x2b,%eax
    28a7:	74 43                	je     28ec <parseredirs+0xa0>
    28a9:	eb 62                	jmp    290d <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    28ab:	8b 55 ec             	mov    -0x14(%ebp),%edx
    28ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    28b1:	83 ec 0c             	sub    $0xc,%esp
    28b4:	6a 00                	push   $0x0
    28b6:	6a 00                	push   $0x0
    28b8:	52                   	push   %edx
    28b9:	50                   	push   %eax
    28ba:	ff 75 08             	pushl  0x8(%ebp)
    28bd:	e8 1b e6 ff ff       	call   edd <redircmd>
    28c2:	83 c4 20             	add    $0x20,%esp
    28c5:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    28c8:	eb 43                	jmp    290d <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    28ca:	8b 55 ec             	mov    -0x14(%ebp),%edx
    28cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    28d0:	83 ec 0c             	sub    $0xc,%esp
    28d3:	6a 01                	push   $0x1
    28d5:	68 01 02 00 00       	push   $0x201
    28da:	52                   	push   %edx
    28db:	50                   	push   %eax
    28dc:	ff 75 08             	pushl  0x8(%ebp)
    28df:	e8 f9 e5 ff ff       	call   edd <redircmd>
    28e4:	83 c4 20             	add    $0x20,%esp
    28e7:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    28ea:	eb 21                	jmp    290d <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    28ec:	8b 55 ec             	mov    -0x14(%ebp),%edx
    28ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    28f2:	83 ec 0c             	sub    $0xc,%esp
    28f5:	6a 01                	push   $0x1
    28f7:	68 01 02 00 00       	push   $0x201
    28fc:	52                   	push   %edx
    28fd:	50                   	push   %eax
    28fe:	ff 75 08             	pushl  0x8(%ebp)
    2901:	e8 d7 e5 ff ff       	call   edd <redircmd>
    2906:	83 c4 20             	add    $0x20,%esp
    2909:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    290c:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    290d:	83 ec 04             	sub    $0x4,%esp
    2910:	68 8a 3a 00 00       	push   $0x3a8a
    2915:	ff 75 10             	pushl  0x10(%ebp)
    2918:	ff 75 0c             	pushl  0xc(%ebp)
    291b:	e8 a6 fc ff ff       	call   25c6 <peek>
    2920:	83 c4 10             	add    $0x10,%esp
    2923:	85 c0                	test   %eax,%eax
    2925:	0f 85 2c ff ff ff    	jne    2857 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    292b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    292e:	c9                   	leave  
    292f:	c3                   	ret    

00002930 <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    2930:	55                   	push   %ebp
    2931:	89 e5                	mov    %esp,%ebp
    2933:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2936:	83 ec 04             	sub    $0x4,%esp
    2939:	68 8d 3a 00 00       	push   $0x3a8d
    293e:	ff 75 0c             	pushl  0xc(%ebp)
    2941:	ff 75 08             	pushl  0x8(%ebp)
    2944:	e8 7d fc ff ff       	call   25c6 <peek>
    2949:	83 c4 10             	add    $0x10,%esp
    294c:	85 c0                	test   %eax,%eax
    294e:	75 10                	jne    2960 <parseblock+0x30>
    panic1("parseblock");
    2950:	83 ec 0c             	sub    $0xc,%esp
    2953:	68 8f 3a 00 00       	push   $0x3a8f
    2958:	e8 ad e1 ff ff       	call   b0a <panic1>
    295d:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2960:	6a 00                	push   $0x0
    2962:	6a 00                	push   $0x0
    2964:	ff 75 0c             	pushl  0xc(%ebp)
    2967:	ff 75 08             	pushl  0x8(%ebp)
    296a:	e8 06 fb ff ff       	call   2475 <gettoken>
    296f:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    2972:	83 ec 08             	sub    $0x8,%esp
    2975:	ff 75 0c             	pushl  0xc(%ebp)
    2978:	ff 75 08             	pushl  0x8(%ebp)
    297b:	e8 b1 fd ff ff       	call   2731 <parseline>
    2980:	83 c4 10             	add    $0x10,%esp
    2983:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    2986:	83 ec 04             	sub    $0x4,%esp
    2989:	68 9a 3a 00 00       	push   $0x3a9a
    298e:	ff 75 0c             	pushl  0xc(%ebp)
    2991:	ff 75 08             	pushl  0x8(%ebp)
    2994:	e8 2d fc ff ff       	call   25c6 <peek>
    2999:	83 c4 10             	add    $0x10,%esp
    299c:	85 c0                	test   %eax,%eax
    299e:	75 10                	jne    29b0 <parseblock+0x80>
    panic1("syntax - missing )");
    29a0:	83 ec 0c             	sub    $0xc,%esp
    29a3:	68 9c 3a 00 00       	push   $0x3a9c
    29a8:	e8 5d e1 ff ff       	call   b0a <panic1>
    29ad:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    29b0:	6a 00                	push   $0x0
    29b2:	6a 00                	push   $0x0
    29b4:	ff 75 0c             	pushl  0xc(%ebp)
    29b7:	ff 75 08             	pushl  0x8(%ebp)
    29ba:	e8 b6 fa ff ff       	call   2475 <gettoken>
    29bf:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    29c2:	83 ec 04             	sub    $0x4,%esp
    29c5:	ff 75 0c             	pushl  0xc(%ebp)
    29c8:	ff 75 08             	pushl  0x8(%ebp)
    29cb:	ff 75 f4             	pushl  -0xc(%ebp)
    29ce:	e8 79 fe ff ff       	call   284c <parseredirs>
    29d3:	83 c4 10             	add    $0x10,%esp
    29d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    29d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    29dc:	c9                   	leave  
    29dd:	c3                   	ret    

000029de <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    29de:	55                   	push   %ebp
    29df:	89 e5                	mov    %esp,%ebp
    29e1:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    29e4:	83 ec 04             	sub    $0x4,%esp
    29e7:	68 8d 3a 00 00       	push   $0x3a8d
    29ec:	ff 75 0c             	pushl  0xc(%ebp)
    29ef:	ff 75 08             	pushl  0x8(%ebp)
    29f2:	e8 cf fb ff ff       	call   25c6 <peek>
    29f7:	83 c4 10             	add    $0x10,%esp
    29fa:	85 c0                	test   %eax,%eax
    29fc:	74 16                	je     2a14 <parseexec+0x36>
    return parseblock(ps, es);
    29fe:	83 ec 08             	sub    $0x8,%esp
    2a01:	ff 75 0c             	pushl  0xc(%ebp)
    2a04:	ff 75 08             	pushl  0x8(%ebp)
    2a07:	e8 24 ff ff ff       	call   2930 <parseblock>
    2a0c:	83 c4 10             	add    $0x10,%esp
    2a0f:	e9 fb 00 00 00       	jmp    2b0f <parseexec+0x131>

  ret = execcmd();
    2a14:	e8 8e e4 ff ff       	call   ea7 <execcmd>
    2a19:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    2a1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a1f:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2a22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2a29:	83 ec 04             	sub    $0x4,%esp
    2a2c:	ff 75 0c             	pushl  0xc(%ebp)
    2a2f:	ff 75 08             	pushl  0x8(%ebp)
    2a32:	ff 75 f0             	pushl  -0x10(%ebp)
    2a35:	e8 12 fe ff ff       	call   284c <parseredirs>
    2a3a:	83 c4 10             	add    $0x10,%esp
    2a3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    2a40:	e9 87 00 00 00       	jmp    2acc <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2a45:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2a48:	50                   	push   %eax
    2a49:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2a4c:	50                   	push   %eax
    2a4d:	ff 75 0c             	pushl  0xc(%ebp)
    2a50:	ff 75 08             	pushl  0x8(%ebp)
    2a53:	e8 1d fa ff ff       	call   2475 <gettoken>
    2a58:	83 c4 10             	add    $0x10,%esp
    2a5b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2a5e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2a62:	0f 84 84 00 00 00    	je     2aec <parseexec+0x10e>
      break;
    if(tok != 'a')
    2a68:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    2a6c:	74 10                	je     2a7e <parseexec+0xa0>
      panic1("syntax");
    2a6e:	83 ec 0c             	sub    $0xc,%esp
    2a71:	68 60 3a 00 00       	push   $0x3a60
    2a76:	e8 8f e0 ff ff       	call   b0a <panic1>
    2a7b:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    2a7e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    2a81:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a84:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a87:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    2a8b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    2a8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a91:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2a94:	83 c1 08             	add    $0x8,%ecx
    2a97:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    2a9b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    2a9f:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2aa3:	7e 10                	jle    2ab5 <parseexec+0xd7>
      panic1("too many args");
    2aa5:	83 ec 0c             	sub    $0xc,%esp
    2aa8:	68 af 3a 00 00       	push   $0x3aaf
    2aad:	e8 58 e0 ff ff       	call   b0a <panic1>
    2ab2:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2ab5:	83 ec 04             	sub    $0x4,%esp
    2ab8:	ff 75 0c             	pushl  0xc(%ebp)
    2abb:	ff 75 08             	pushl  0x8(%ebp)
    2abe:	ff 75 f0             	pushl  -0x10(%ebp)
    2ac1:	e8 86 fd ff ff       	call   284c <parseredirs>
    2ac6:	83 c4 10             	add    $0x10,%esp
    2ac9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    2acc:	83 ec 04             	sub    $0x4,%esp
    2acf:	68 bd 3a 00 00       	push   $0x3abd
    2ad4:	ff 75 0c             	pushl  0xc(%ebp)
    2ad7:	ff 75 08             	pushl  0x8(%ebp)
    2ada:	e8 e7 fa ff ff       	call   25c6 <peek>
    2adf:	83 c4 10             	add    $0x10,%esp
    2ae2:	85 c0                	test   %eax,%eax
    2ae4:	0f 84 5b ff ff ff    	je     2a45 <parseexec+0x67>
    2aea:	eb 01                	jmp    2aed <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    2aec:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    2aed:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2af0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2af3:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    2afa:	00 
  cmd->eargv[argc] = 0;
    2afb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2afe:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2b01:	83 c2 08             	add    $0x8,%edx
    2b04:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    2b0b:	00 
  return ret;
    2b0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2b0f:	c9                   	leave  
    2b10:	c3                   	ret    

00002b11 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2b11:	55                   	push   %ebp
    2b12:	89 e5                	mov    %esp,%ebp
    2b14:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2b17:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2b1b:	75 0a                	jne    2b27 <nulterminate+0x16>
    return 0;
    2b1d:	b8 00 00 00 00       	mov    $0x0,%eax
    2b22:	e9 e4 00 00 00       	jmp    2c0b <nulterminate+0xfa>
  
  switch(cmd->type){
    2b27:	8b 45 08             	mov    0x8(%ebp),%eax
    2b2a:	8b 00                	mov    (%eax),%eax
    2b2c:	83 f8 05             	cmp    $0x5,%eax
    2b2f:	0f 87 d3 00 00 00    	ja     2c08 <nulterminate+0xf7>
    2b35:	8b 04 85 c4 3a 00 00 	mov    0x3ac4(,%eax,4),%eax
    2b3c:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2b3e:	8b 45 08             	mov    0x8(%ebp),%eax
    2b41:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2b44:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2b4b:	eb 14                	jmp    2b61 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2b4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b50:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2b53:	83 c2 08             	add    $0x8,%edx
    2b56:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2b5a:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2b5d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2b61:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b64:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2b67:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2b6b:	85 c0                	test   %eax,%eax
    2b6d:	75 de                	jne    2b4d <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2b6f:	e9 94 00 00 00       	jmp    2c08 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2b74:	8b 45 08             	mov    0x8(%ebp),%eax
    2b77:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2b7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b7d:	8b 40 04             	mov    0x4(%eax),%eax
    2b80:	83 ec 0c             	sub    $0xc,%esp
    2b83:	50                   	push   %eax
    2b84:	e8 88 ff ff ff       	call   2b11 <nulterminate>
    2b89:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2b8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b8f:	8b 40 0c             	mov    0xc(%eax),%eax
    2b92:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2b95:	eb 71                	jmp    2c08 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2b97:	8b 45 08             	mov    0x8(%ebp),%eax
    2b9a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2b9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ba0:	8b 40 04             	mov    0x4(%eax),%eax
    2ba3:	83 ec 0c             	sub    $0xc,%esp
    2ba6:	50                   	push   %eax
    2ba7:	e8 65 ff ff ff       	call   2b11 <nulterminate>
    2bac:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2baf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2bb2:	8b 40 08             	mov    0x8(%eax),%eax
    2bb5:	83 ec 0c             	sub    $0xc,%esp
    2bb8:	50                   	push   %eax
    2bb9:	e8 53 ff ff ff       	call   2b11 <nulterminate>
    2bbe:	83 c4 10             	add    $0x10,%esp
    break;
    2bc1:	eb 45                	jmp    2c08 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2bc3:	8b 45 08             	mov    0x8(%ebp),%eax
    2bc6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2bc9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bcc:	8b 40 04             	mov    0x4(%eax),%eax
    2bcf:	83 ec 0c             	sub    $0xc,%esp
    2bd2:	50                   	push   %eax
    2bd3:	e8 39 ff ff ff       	call   2b11 <nulterminate>
    2bd8:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2bdb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bde:	8b 40 08             	mov    0x8(%eax),%eax
    2be1:	83 ec 0c             	sub    $0xc,%esp
    2be4:	50                   	push   %eax
    2be5:	e8 27 ff ff ff       	call   2b11 <nulterminate>
    2bea:	83 c4 10             	add    $0x10,%esp
    break;
    2bed:	eb 19                	jmp    2c08 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2bef:	8b 45 08             	mov    0x8(%ebp),%eax
    2bf2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2bf5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2bf8:	8b 40 04             	mov    0x4(%eax),%eax
    2bfb:	83 ec 0c             	sub    $0xc,%esp
    2bfe:	50                   	push   %eax
    2bff:	e8 0d ff ff ff       	call   2b11 <nulterminate>
    2c04:	83 c4 10             	add    $0x10,%esp
    break;
    2c07:	90                   	nop
  }
  return cmd;
    2c08:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2c0b:	c9                   	leave  
    2c0c:	c3                   	ret    

00002c0d <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2c0d:	55                   	push   %ebp
    2c0e:	89 e5                	mov    %esp,%ebp
    2c10:	83 ec 18             	sub    $0x18,%esp
    2c13:	8b 45 08             	mov    0x8(%ebp),%eax
    2c16:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2c19:	83 ec 08             	sub    $0x8,%esp
    2c1c:	ff 75 18             	pushl  0x18(%ebp)
    2c1f:	ff 75 14             	pushl  0x14(%ebp)
    2c22:	ff 75 10             	pushl  0x10(%ebp)
    2c25:	ff 75 0c             	pushl  0xc(%ebp)
    2c28:	6a 01                	push   $0x1
    2c2a:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2c2d:	50                   	push   %eax
    2c2e:	e8 e6 d8 ff ff       	call   519 <colorwrite>
    2c33:	83 c4 20             	add    $0x20,%esp
}
    2c36:	90                   	nop
    2c37:	c9                   	leave  
    2c38:	c3                   	ret    

00002c39 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2c39:	55                   	push   %ebp
    2c3a:	89 e5                	mov    %esp,%ebp
    2c3c:	53                   	push   %ebx
    2c3d:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2c40:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2c47:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2c4b:	74 17                	je     2c64 <color_printint+0x2b>
    2c4d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2c51:	79 11                	jns    2c64 <color_printint+0x2b>
    neg = 1;
    2c53:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2c5a:	8b 45 08             	mov    0x8(%ebp),%eax
    2c5d:	f7 d8                	neg    %eax
    2c5f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2c62:	eb 06                	jmp    2c6a <color_printint+0x31>
  } else {
    x = xx;
    2c64:	8b 45 08             	mov    0x8(%ebp),%eax
    2c67:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2c6a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2c71:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2c74:	8d 41 01             	lea    0x1(%ecx),%eax
    2c77:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c7a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2c7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c80:	ba 00 00 00 00       	mov    $0x0,%edx
    2c85:	f7 f3                	div    %ebx
    2c87:	89 d0                	mov    %edx,%eax
    2c89:	0f b6 80 04 46 00 00 	movzbl 0x4604(%eax),%eax
    2c90:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2c94:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2c97:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c9a:	ba 00 00 00 00       	mov    $0x0,%edx
    2c9f:	f7 f3                	div    %ebx
    2ca1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2ca4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2ca8:	75 c7                	jne    2c71 <color_printint+0x38>
  if(neg)
    2caa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2cae:	74 36                	je     2ce6 <color_printint+0xad>
    buf[i++] = '-';
    2cb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2cb3:	8d 50 01             	lea    0x1(%eax),%edx
    2cb6:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2cb9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2cbe:	eb 26                	jmp    2ce6 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2cc0:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2cc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2cc6:	01 d0                	add    %edx,%eax
    2cc8:	0f b6 00             	movzbl (%eax),%eax
    2ccb:	0f be c0             	movsbl %al,%eax
    2cce:	83 ec 0c             	sub    $0xc,%esp
    2cd1:	ff 75 20             	pushl  0x20(%ebp)
    2cd4:	ff 75 1c             	pushl  0x1c(%ebp)
    2cd7:	ff 75 18             	pushl  0x18(%ebp)
    2cda:	ff 75 14             	pushl  0x14(%ebp)
    2cdd:	50                   	push   %eax
    2cde:	e8 2a ff ff ff       	call   2c0d <color_putc>
    2ce3:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2ce6:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2cea:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2cee:	79 d0                	jns    2cc0 <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2cf0:	90                   	nop
    2cf1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cf4:	c9                   	leave  
    2cf5:	c3                   	ret    

00002cf6 <getInteger>:

static int getInteger(double num)
{
    2cf6:	55                   	push   %ebp
    2cf7:	89 e5                	mov    %esp,%ebp
    2cf9:	83 ec 18             	sub    $0x18,%esp
    2cfc:	8b 45 08             	mov    0x8(%ebp),%eax
    2cff:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2d02:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d05:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2d08:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2d0f:	eb 0e                	jmp    2d1f <getInteger+0x29>
  {
    num -= 1;
    2d11:	dd 45 e8             	fldl   -0x18(%ebp)
    2d14:	d9 e8                	fld1   
    2d16:	de e9                	fsubrp %st,%st(1)
    2d18:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2d1b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2d1f:	dd 45 e8             	fldl   -0x18(%ebp)
    2d22:	d9 e8                	fld1   
    2d24:	d9 c9                	fxch   %st(1)
    2d26:	df e9                	fucomip %st(1),%st
    2d28:	dd d8                	fstp   %st(0)
    2d2a:	77 e5                	ja     2d11 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2d2c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2d2f:	c9                   	leave  
    2d30:	c3                   	ret    

00002d31 <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2d31:	55                   	push   %ebp
    2d32:	89 e5                	mov    %esp,%ebp
    2d34:	83 ec 28             	sub    $0x28,%esp
    2d37:	8b 45 08             	mov    0x8(%ebp),%eax
    2d3a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2d3d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d40:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2d43:	d9 ee                	fldz   
    2d45:	dd 45 e0             	fldl   -0x20(%ebp)
    2d48:	d9 c9                	fxch   %st(1)
    2d4a:	df e9                	fucomip %st(1),%st
    2d4c:	dd d8                	fstp   %st(0)
    2d4e:	76 21                	jbe    2d71 <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2d50:	83 ec 0c             	sub    $0xc,%esp
    2d53:	ff 75 1c             	pushl  0x1c(%ebp)
    2d56:	ff 75 18             	pushl  0x18(%ebp)
    2d59:	ff 75 14             	pushl  0x14(%ebp)
    2d5c:	ff 75 10             	pushl  0x10(%ebp)
    2d5f:	6a 2d                	push   $0x2d
    2d61:	e8 a7 fe ff ff       	call   2c0d <color_putc>
    2d66:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2d69:	dd 45 e0             	fldl   -0x20(%ebp)
    2d6c:	d9 e0                	fchs   
    2d6e:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2d71:	83 ec 08             	sub    $0x8,%esp
    2d74:	ff 75 e4             	pushl  -0x1c(%ebp)
    2d77:	ff 75 e0             	pushl  -0x20(%ebp)
    2d7a:	e8 77 ff ff ff       	call   2cf6 <getInteger>
    2d7f:	83 c4 10             	add    $0x10,%esp
    2d82:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2d85:	83 ec 04             	sub    $0x4,%esp
    2d88:	ff 75 1c             	pushl  0x1c(%ebp)
    2d8b:	ff 75 18             	pushl  0x18(%ebp)
    2d8e:	ff 75 14             	pushl  0x14(%ebp)
    2d91:	ff 75 10             	pushl  0x10(%ebp)
    2d94:	6a 01                	push   $0x1
    2d96:	6a 0a                	push   $0xa
    2d98:	ff 75 f0             	pushl  -0x10(%ebp)
    2d9b:	e8 99 fe ff ff       	call   2c39 <color_printint>
    2da0:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2da3:	db 45 f0             	fildl  -0x10(%ebp)
    2da6:	dd 45 e0             	fldl   -0x20(%ebp)
    2da9:	de e1                	fsubp  %st,%st(1)
    2dab:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2dae:	dd 45 e0             	fldl   -0x20(%ebp)
    2db1:	dd 05 e8 3a 00 00    	fldl   0x3ae8
    2db7:	d9 c9                	fxch   %st(1)
    2db9:	df e9                	fucomip %st(1),%st
    2dbb:	dd d8                	fstp   %st(0)
    2dbd:	76 19                	jbe    2dd8 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2dbf:	83 ec 0c             	sub    $0xc,%esp
    2dc2:	ff 75 1c             	pushl  0x1c(%ebp)
    2dc5:	ff 75 18             	pushl  0x18(%ebp)
    2dc8:	ff 75 14             	pushl  0x14(%ebp)
    2dcb:	ff 75 10             	pushl  0x10(%ebp)
    2dce:	6a 2e                	push   $0x2e
    2dd0:	e8 38 fe ff ff       	call   2c0d <color_putc>
    2dd5:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2dd8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2ddf:	eb 55                	jmp    2e36 <color_printdbl+0x105>
  {
    num = num*10;
    2de1:	dd 45 e0             	fldl   -0x20(%ebp)
    2de4:	dd 05 f0 3a 00 00    	fldl   0x3af0
    2dea:	de c9                	fmulp  %st,%st(1)
    2dec:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2def:	83 ec 08             	sub    $0x8,%esp
    2df2:	ff 75 e4             	pushl  -0x1c(%ebp)
    2df5:	ff 75 e0             	pushl  -0x20(%ebp)
    2df8:	e8 f9 fe ff ff       	call   2cf6 <getInteger>
    2dfd:	83 c4 10             	add    $0x10,%esp
    2e00:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2e03:	83 ec 04             	sub    $0x4,%esp
    2e06:	ff 75 1c             	pushl  0x1c(%ebp)
    2e09:	ff 75 18             	pushl  0x18(%ebp)
    2e0c:	ff 75 14             	pushl  0x14(%ebp)
    2e0f:	ff 75 10             	pushl  0x10(%ebp)
    2e12:	6a 01                	push   $0x1
    2e14:	6a 0a                	push   $0xa
    2e16:	ff 75 f0             	pushl  -0x10(%ebp)
    2e19:	e8 1b fe ff ff       	call   2c39 <color_printint>
    2e1e:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2e21:	db 45 f0             	fildl  -0x10(%ebp)
    2e24:	dd 45 e0             	fldl   -0x20(%ebp)
    2e27:	de e1                	fsubp  %st,%st(1)
    2e29:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2e2c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2e30:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2e34:	7f 13                	jg     2e49 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2e36:	dd 45 e0             	fldl   -0x20(%ebp)
    2e39:	dd 05 e8 3a 00 00    	fldl   0x3ae8
    2e3f:	d9 c9                	fxch   %st(1)
    2e41:	df e9                	fucomip %st(1),%st
    2e43:	dd d8                	fstp   %st(0)
    2e45:	77 9a                	ja     2de1 <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2e47:	eb 01                	jmp    2e4a <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2e49:	90                   	nop
    }
  }
}
    2e4a:	90                   	nop
    2e4b:	c9                   	leave  
    2e4c:	c3                   	ret    

00002e4d <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2e4d:	55                   	push   %ebp
    2e4e:	89 e5                	mov    %esp,%ebp
    2e50:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2e53:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2e5a:	8d 45 18             	lea    0x18(%ebp),%eax
    2e5d:	83 c0 04             	add    $0x4,%eax
    2e60:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2e63:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2e6a:	e9 e2 01 00 00       	jmp    3051 <color_printf+0x204>
    c = fmt[i] & 0xff;
    2e6f:	8b 55 18             	mov    0x18(%ebp),%edx
    2e72:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e75:	01 d0                	add    %edx,%eax
    2e77:	0f b6 00             	movzbl (%eax),%eax
    2e7a:	0f be c0             	movsbl %al,%eax
    2e7d:	25 ff 00 00 00       	and    $0xff,%eax
    2e82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2e85:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2e89:	75 35                	jne    2ec0 <color_printf+0x73>
      if(c == '%'){
    2e8b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2e8f:	75 0c                	jne    2e9d <color_printf+0x50>
        state = '%';
    2e91:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2e98:	e9 b0 01 00 00       	jmp    304d <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2e9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ea0:	0f be c0             	movsbl %al,%eax
    2ea3:	83 ec 0c             	sub    $0xc,%esp
    2ea6:	ff 75 14             	pushl  0x14(%ebp)
    2ea9:	ff 75 10             	pushl  0x10(%ebp)
    2eac:	ff 75 0c             	pushl  0xc(%ebp)
    2eaf:	ff 75 08             	pushl  0x8(%ebp)
    2eb2:	50                   	push   %eax
    2eb3:	e8 55 fd ff ff       	call   2c0d <color_putc>
    2eb8:	83 c4 20             	add    $0x20,%esp
    2ebb:	e9 8d 01 00 00       	jmp    304d <color_printf+0x200>
      }
    } else if(state == '%'){
    2ec0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2ec4:	0f 85 83 01 00 00    	jne    304d <color_printf+0x200>
      if(c == 'd'){
    2eca:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2ece:	75 2a                	jne    2efa <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2ed0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ed3:	8b 00                	mov    (%eax),%eax
    2ed5:	83 ec 04             	sub    $0x4,%esp
    2ed8:	ff 75 14             	pushl  0x14(%ebp)
    2edb:	ff 75 10             	pushl  0x10(%ebp)
    2ede:	ff 75 0c             	pushl  0xc(%ebp)
    2ee1:	ff 75 08             	pushl  0x8(%ebp)
    2ee4:	6a 01                	push   $0x1
    2ee6:	6a 0a                	push   $0xa
    2ee8:	50                   	push   %eax
    2ee9:	e8 4b fd ff ff       	call   2c39 <color_printint>
    2eee:	83 c4 20             	add    $0x20,%esp
        ap++;
    2ef1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2ef5:	e9 4c 01 00 00       	jmp    3046 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2efa:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2efe:	74 06                	je     2f06 <color_printf+0xb9>
    2f00:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2f04:	75 2a                	jne    2f30 <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2f06:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f09:	8b 00                	mov    (%eax),%eax
    2f0b:	83 ec 04             	sub    $0x4,%esp
    2f0e:	ff 75 14             	pushl  0x14(%ebp)
    2f11:	ff 75 10             	pushl  0x10(%ebp)
    2f14:	ff 75 0c             	pushl  0xc(%ebp)
    2f17:	ff 75 08             	pushl  0x8(%ebp)
    2f1a:	6a 00                	push   $0x0
    2f1c:	6a 10                	push   $0x10
    2f1e:	50                   	push   %eax
    2f1f:	e8 15 fd ff ff       	call   2c39 <color_printint>
    2f24:	83 c4 20             	add    $0x20,%esp
        ap++;
    2f27:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2f2b:	e9 16 01 00 00       	jmp    3046 <color_printf+0x1f9>
      } else if(c == 's'){
    2f30:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2f34:	75 4f                	jne    2f85 <color_printf+0x138>
        s = (char*)*ap;
    2f36:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f39:	8b 00                	mov    (%eax),%eax
    2f3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2f3e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2f42:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2f46:	75 2e                	jne    2f76 <color_printf+0x129>
          s = "(null)";
    2f48:	c7 45 f4 e0 3a 00 00 	movl   $0x3ae0,-0xc(%ebp)
        while(*s != 0){
    2f4f:	eb 25                	jmp    2f76 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2f51:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f54:	0f b6 00             	movzbl (%eax),%eax
    2f57:	0f be c0             	movsbl %al,%eax
    2f5a:	83 ec 0c             	sub    $0xc,%esp
    2f5d:	ff 75 14             	pushl  0x14(%ebp)
    2f60:	ff 75 10             	pushl  0x10(%ebp)
    2f63:	ff 75 0c             	pushl  0xc(%ebp)
    2f66:	ff 75 08             	pushl  0x8(%ebp)
    2f69:	50                   	push   %eax
    2f6a:	e8 9e fc ff ff       	call   2c0d <color_putc>
    2f6f:	83 c4 20             	add    $0x20,%esp
          s++;
    2f72:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2f76:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f79:	0f b6 00             	movzbl (%eax),%eax
    2f7c:	84 c0                	test   %al,%al
    2f7e:	75 d1                	jne    2f51 <color_printf+0x104>
    2f80:	e9 c1 00 00 00       	jmp    3046 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2f85:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2f89:	75 29                	jne    2fb4 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2f8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f8e:	8b 00                	mov    (%eax),%eax
    2f90:	0f be c0             	movsbl %al,%eax
    2f93:	83 ec 0c             	sub    $0xc,%esp
    2f96:	ff 75 14             	pushl  0x14(%ebp)
    2f99:	ff 75 10             	pushl  0x10(%ebp)
    2f9c:	ff 75 0c             	pushl  0xc(%ebp)
    2f9f:	ff 75 08             	pushl  0x8(%ebp)
    2fa2:	50                   	push   %eax
    2fa3:	e8 65 fc ff ff       	call   2c0d <color_putc>
    2fa8:	83 c4 20             	add    $0x20,%esp
        ap++;
    2fab:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2faf:	e9 92 00 00 00       	jmp    3046 <color_printf+0x1f9>
      } else if(c == '%'){
    2fb4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2fb8:	75 20                	jne    2fda <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2fba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2fbd:	0f be c0             	movsbl %al,%eax
    2fc0:	83 ec 0c             	sub    $0xc,%esp
    2fc3:	ff 75 14             	pushl  0x14(%ebp)
    2fc6:	ff 75 10             	pushl  0x10(%ebp)
    2fc9:	ff 75 0c             	pushl  0xc(%ebp)
    2fcc:	ff 75 08             	pushl  0x8(%ebp)
    2fcf:	50                   	push   %eax
    2fd0:	e8 38 fc ff ff       	call   2c0d <color_putc>
    2fd5:	83 c4 20             	add    $0x20,%esp
    2fd8:	eb 6c                	jmp    3046 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    2fda:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    2fde:	75 2f                	jne    300f <color_printf+0x1c2>
        double *dap = (double*)ap;
    2fe0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2fe3:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    2fe6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2fe9:	dd 00                	fldl   (%eax)
    2feb:	83 ec 08             	sub    $0x8,%esp
    2fee:	ff 75 14             	pushl  0x14(%ebp)
    2ff1:	ff 75 10             	pushl  0x10(%ebp)
    2ff4:	ff 75 0c             	pushl  0xc(%ebp)
    2ff7:	ff 75 08             	pushl  0x8(%ebp)
    2ffa:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2ffe:	dd 1c 24             	fstpl  (%esp)
    3001:	e8 2b fd ff ff       	call   2d31 <color_printdbl>
    3006:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    3009:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    300d:	eb 37                	jmp    3046 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    300f:	83 ec 0c             	sub    $0xc,%esp
    3012:	ff 75 14             	pushl  0x14(%ebp)
    3015:	ff 75 10             	pushl  0x10(%ebp)
    3018:	ff 75 0c             	pushl  0xc(%ebp)
    301b:	ff 75 08             	pushl  0x8(%ebp)
    301e:	6a 25                	push   $0x25
    3020:	e8 e8 fb ff ff       	call   2c0d <color_putc>
    3025:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    3028:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    302b:	0f be c0             	movsbl %al,%eax
    302e:	83 ec 0c             	sub    $0xc,%esp
    3031:	ff 75 14             	pushl  0x14(%ebp)
    3034:	ff 75 10             	pushl  0x10(%ebp)
    3037:	ff 75 0c             	pushl  0xc(%ebp)
    303a:	ff 75 08             	pushl  0x8(%ebp)
    303d:	50                   	push   %eax
    303e:	e8 ca fb ff ff       	call   2c0d <color_putc>
    3043:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    3046:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    304d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3051:	8b 55 18             	mov    0x18(%ebp),%edx
    3054:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3057:	01 d0                	add    %edx,%eax
    3059:	0f b6 00             	movzbl (%eax),%eax
    305c:	84 c0                	test   %al,%al
    305e:	0f 85 0b fe ff ff    	jne    2e6f <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    3064:	90                   	nop
    3065:	c9                   	leave  
    3066:	c3                   	ret    

00003067 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    3067:	55                   	push   %ebp
    3068:	89 e5                	mov    %esp,%ebp
    306a:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    306d:	83 ec 0c             	sub    $0xc,%esp
    3070:	6a 58                	push   $0x58
    3072:	e8 b0 d9 ff ff       	call   a27 <malloc>
    3077:	83 c4 10             	add    $0x10,%esp
    307a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    307d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3080:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3086:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3089:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    3090:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3093:	c9                   	leave  
    3094:	c3                   	ret    

00003095 <pushi>:

void pushi(struct istack *s, int val)
{
    3095:	55                   	push   %ebp
    3096:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    3098:	8b 45 08             	mov    0x8(%ebp),%eax
    309b:	8b 00                	mov    (%eax),%eax
    309d:	83 f8 13             	cmp    $0x13,%eax
    30a0:	7f 2c                	jg     30ce <pushi+0x39>
    {
        s->size++;
    30a2:	8b 45 08             	mov    0x8(%ebp),%eax
    30a5:	8b 00                	mov    (%eax),%eax
    30a7:	8d 50 01             	lea    0x1(%eax),%edx
    30aa:	8b 45 08             	mov    0x8(%ebp),%eax
    30ad:	89 10                	mov    %edx,(%eax)
        s->top++;
    30af:	8b 45 08             	mov    0x8(%ebp),%eax
    30b2:	8b 40 54             	mov    0x54(%eax),%eax
    30b5:	8d 50 01             	lea    0x1(%eax),%edx
    30b8:	8b 45 08             	mov    0x8(%ebp),%eax
    30bb:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    30be:	8b 45 08             	mov    0x8(%ebp),%eax
    30c1:	8b 50 54             	mov    0x54(%eax),%edx
    30c4:	8b 45 08             	mov    0x8(%ebp),%eax
    30c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    30ca:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    30ce:	90                   	nop
    30cf:	5d                   	pop    %ebp
    30d0:	c3                   	ret    

000030d1 <popi>:

int popi(struct istack *s)
{
    30d1:	55                   	push   %ebp
    30d2:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    30d4:	8b 45 08             	mov    0x8(%ebp),%eax
    30d7:	8b 00                	mov    (%eax),%eax
    30d9:	85 c0                	test   %eax,%eax
    30db:	75 07                	jne    30e4 <popi+0x13>
    {
        return -1;
    30dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    30e2:	eb 2c                	jmp    3110 <popi+0x3f>
    }
    s->size--;
    30e4:	8b 45 08             	mov    0x8(%ebp),%eax
    30e7:	8b 00                	mov    (%eax),%eax
    30e9:	8d 50 ff             	lea    -0x1(%eax),%edx
    30ec:	8b 45 08             	mov    0x8(%ebp),%eax
    30ef:	89 10                	mov    %edx,(%eax)
    s->top--;
    30f1:	8b 45 08             	mov    0x8(%ebp),%eax
    30f4:	8b 40 54             	mov    0x54(%eax),%eax
    30f7:	8d 50 ff             	lea    -0x1(%eax),%edx
    30fa:	8b 45 08             	mov    0x8(%ebp),%eax
    30fd:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    3100:	8b 45 08             	mov    0x8(%ebp),%eax
    3103:	8b 40 54             	mov    0x54(%eax),%eax
    3106:	8d 50 01             	lea    0x1(%eax),%edx
    3109:	8b 45 08             	mov    0x8(%ebp),%eax
    310c:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3110:	5d                   	pop    %ebp
    3111:	c3                   	ret    

00003112 <topi>:

int topi(struct istack* s)
{
    3112:	55                   	push   %ebp
    3113:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3115:	8b 45 08             	mov    0x8(%ebp),%eax
    3118:	8b 50 54             	mov    0x54(%eax),%edx
    311b:	8b 45 08             	mov    0x8(%ebp),%eax
    311e:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3122:	5d                   	pop    %ebp
    3123:	c3                   	ret    

00003124 <cstack>:

//constructor
struct cstack* cstack()
{
    3124:	55                   	push   %ebp
    3125:	89 e5                	mov    %esp,%ebp
    3127:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    312a:	83 ec 0c             	sub    $0xc,%esp
    312d:	6a 1c                	push   $0x1c
    312f:	e8 f3 d8 ff ff       	call   a27 <malloc>
    3134:	83 c4 10             	add    $0x10,%esp
    3137:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    313a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    313d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3143:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3146:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    314d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3150:	c9                   	leave  
    3151:	c3                   	ret    

00003152 <pushc>:

void pushc(struct cstack *s, char val)
{
    3152:	55                   	push   %ebp
    3153:	89 e5                	mov    %esp,%ebp
    3155:	83 ec 04             	sub    $0x4,%esp
    3158:	8b 45 0c             	mov    0xc(%ebp),%eax
    315b:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    315e:	8b 45 08             	mov    0x8(%ebp),%eax
    3161:	8b 00                	mov    (%eax),%eax
    3163:	83 f8 13             	cmp    $0x13,%eax
    3166:	7f 2d                	jg     3195 <pushc+0x43>
    {
        s->size++;
    3168:	8b 45 08             	mov    0x8(%ebp),%eax
    316b:	8b 00                	mov    (%eax),%eax
    316d:	8d 50 01             	lea    0x1(%eax),%edx
    3170:	8b 45 08             	mov    0x8(%ebp),%eax
    3173:	89 10                	mov    %edx,(%eax)
        s->top++;
    3175:	8b 45 08             	mov    0x8(%ebp),%eax
    3178:	8b 40 18             	mov    0x18(%eax),%eax
    317b:	8d 50 01             	lea    0x1(%eax),%edx
    317e:	8b 45 08             	mov    0x8(%ebp),%eax
    3181:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    3184:	8b 45 08             	mov    0x8(%ebp),%eax
    3187:	8b 40 18             	mov    0x18(%eax),%eax
    318a:	8b 55 08             	mov    0x8(%ebp),%edx
    318d:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    3191:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    3195:	90                   	nop
    3196:	c9                   	leave  
    3197:	c3                   	ret    

00003198 <popc>:

char popc(struct cstack *s)
{
    3198:	55                   	push   %ebp
    3199:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    319b:	8b 45 08             	mov    0x8(%ebp),%eax
    319e:	8b 00                	mov    (%eax),%eax
    31a0:	85 c0                	test   %eax,%eax
    31a2:	75 07                	jne    31ab <popc+0x13>
    {
        return -1;
    31a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    31a9:	eb 2d                	jmp    31d8 <popc+0x40>
    }
    s->size--;
    31ab:	8b 45 08             	mov    0x8(%ebp),%eax
    31ae:	8b 00                	mov    (%eax),%eax
    31b0:	8d 50 ff             	lea    -0x1(%eax),%edx
    31b3:	8b 45 08             	mov    0x8(%ebp),%eax
    31b6:	89 10                	mov    %edx,(%eax)
    s->top--;
    31b8:	8b 45 08             	mov    0x8(%ebp),%eax
    31bb:	8b 40 18             	mov    0x18(%eax),%eax
    31be:	8d 50 ff             	lea    -0x1(%eax),%edx
    31c1:	8b 45 08             	mov    0x8(%ebp),%eax
    31c4:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    31c7:	8b 45 08             	mov    0x8(%ebp),%eax
    31ca:	8b 40 18             	mov    0x18(%eax),%eax
    31cd:	8d 50 01             	lea    0x1(%eax),%edx
    31d0:	8b 45 08             	mov    0x8(%ebp),%eax
    31d3:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    31d8:	5d                   	pop    %ebp
    31d9:	c3                   	ret    

000031da <topc>:

char topc(struct cstack* s)
{
    31da:	55                   	push   %ebp
    31db:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    31dd:	8b 45 08             	mov    0x8(%ebp),%eax
    31e0:	8b 40 18             	mov    0x18(%eax),%eax
    31e3:	8b 55 08             	mov    0x8(%ebp),%edx
    31e6:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    31eb:	5d                   	pop    %ebp
    31ec:	c3                   	ret    

000031ed <dstack>:

//constructor
struct dstack* dstack()
{
    31ed:	55                   	push   %ebp
    31ee:	89 e5                	mov    %esp,%ebp
    31f0:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    31f3:	83 ec 0c             	sub    $0xc,%esp
    31f6:	68 a8 00 00 00       	push   $0xa8
    31fb:	e8 27 d8 ff ff       	call   a27 <malloc>
    3200:	83 c4 10             	add    $0x10,%esp
    3203:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3206:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3209:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    320f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3212:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    3219:	ff ff ff 
    return stack;
    321c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    321f:	c9                   	leave  
    3220:	c3                   	ret    

00003221 <pushd>:

void pushd(struct dstack *s, double val)
{
    3221:	55                   	push   %ebp
    3222:	89 e5                	mov    %esp,%ebp
    3224:	83 ec 08             	sub    $0x8,%esp
    3227:	8b 45 0c             	mov    0xc(%ebp),%eax
    322a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    322d:	8b 45 10             	mov    0x10(%ebp),%eax
    3230:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3233:	8b 45 08             	mov    0x8(%ebp),%eax
    3236:	8b 00                	mov    (%eax),%eax
    3238:	83 f8 13             	cmp    $0x13,%eax
    323b:	7f 35                	jg     3272 <pushd+0x51>
    {
        s->size++;
    323d:	8b 45 08             	mov    0x8(%ebp),%eax
    3240:	8b 00                	mov    (%eax),%eax
    3242:	8d 50 01             	lea    0x1(%eax),%edx
    3245:	8b 45 08             	mov    0x8(%ebp),%eax
    3248:	89 10                	mov    %edx,(%eax)
        s->top++;
    324a:	8b 45 08             	mov    0x8(%ebp),%eax
    324d:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3253:	8d 50 01             	lea    0x1(%eax),%edx
    3256:	8b 45 08             	mov    0x8(%ebp),%eax
    3259:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    325f:	8b 45 08             	mov    0x8(%ebp),%eax
    3262:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3268:	8b 45 08             	mov    0x8(%ebp),%eax
    326b:	dd 45 f8             	fldl   -0x8(%ebp)
    326e:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    3272:	90                   	nop
    3273:	c9                   	leave  
    3274:	c3                   	ret    

00003275 <popd>:

double popd(struct dstack *s)
{
    3275:	55                   	push   %ebp
    3276:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3278:	8b 45 08             	mov    0x8(%ebp),%eax
    327b:	8b 00                	mov    (%eax),%eax
    327d:	85 c0                	test   %eax,%eax
    327f:	75 06                	jne    3287 <popd+0x12>
    {
        return -1;
    3281:	d9 e8                	fld1   
    3283:	d9 e0                	fchs   
    3285:	eb 35                	jmp    32bc <popd+0x47>
    }
    s->size--;
    3287:	8b 45 08             	mov    0x8(%ebp),%eax
    328a:	8b 00                	mov    (%eax),%eax
    328c:	8d 50 ff             	lea    -0x1(%eax),%edx
    328f:	8b 45 08             	mov    0x8(%ebp),%eax
    3292:	89 10                	mov    %edx,(%eax)
    s->top--;
    3294:	8b 45 08             	mov    0x8(%ebp),%eax
    3297:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    329d:	8d 50 ff             	lea    -0x1(%eax),%edx
    32a0:	8b 45 08             	mov    0x8(%ebp),%eax
    32a3:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    32a9:	8b 45 08             	mov    0x8(%ebp),%eax
    32ac:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    32b2:	8d 50 01             	lea    0x1(%eax),%edx
    32b5:	8b 45 08             	mov    0x8(%ebp),%eax
    32b8:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    32bc:	5d                   	pop    %ebp
    32bd:	c3                   	ret    

000032be <topd>:

double topd(struct dstack* s)
{
    32be:	55                   	push   %ebp
    32bf:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    32c1:	8b 45 08             	mov    0x8(%ebp),%eax
    32c4:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    32ca:	8b 45 08             	mov    0x8(%ebp),%eax
    32cd:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    32d1:	5d                   	pop    %ebp
    32d2:	c3                   	ret    

000032d3 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    32d3:	55                   	push   %ebp
    32d4:	89 e5                	mov    %esp,%ebp
    32d6:	53                   	push   %ebx
    32d7:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    32dd:	83 ec 08             	sub    $0x8,%esp
    32e0:	6a 00                	push   $0x0
    32e2:	68 f8 3a 00 00       	push   $0x3af8
    32e7:	e8 cd d1 ff ff       	call   4b9 <open>
    32ec:	83 c4 10             	add    $0x10,%esp
    32ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
    32f2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    32f6:	79 1d                	jns    3315 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    32f8:	83 ec 0c             	sub    $0xc,%esp
    32fb:	68 02 3b 00 00       	push   $0x3b02
    3300:	6a 00                	push   $0x0
    3302:	6a 00                	push   $0x0
    3304:	6a 01                	push   $0x1
    3306:	6a 03                	push   $0x3
    3308:	e8 40 fb ff ff       	call   2e4d <color_printf>
    330d:	83 c4 20             	add    $0x20,%esp
    3310:	e9 6d 02 00 00       	jmp    3582 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    3315:	8b 45 0c             	mov    0xc(%ebp),%eax
    3318:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    331e:	e9 2a 02 00 00       	jmp    354d <readVariables+0x27a>
  {
    int pos = 0;
    3323:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    332a:	00 00 00 
    while(pos <= n-1)
    332d:	e9 07 02 00 00       	jmp    3539 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    3332:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    3339:	eb 24                	jmp    335f <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    333b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    333e:	8d 50 ff             	lea    -0x1(%eax),%edx
    3341:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    3347:	8b 45 f4             	mov    -0xc(%ebp),%eax
    334a:	01 c8                	add    %ecx,%eax
    334c:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3353:	ff 
    3354:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    335b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    335f:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3365:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3368:	01 d0                	add    %edx,%eax
    336a:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3371:	ff 
    3372:	3c 3d                	cmp    $0x3d,%al
    3374:	75 c5                	jne    333b <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    3376:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3379:	83 e8 01             	sub    $0x1,%eax
    337c:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    3383:	00 
      if(buf[pos] == 'd') //double value
    3384:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    338a:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3391:	ff 
    3392:	3c 64                	cmp    $0x64,%al
    3394:	0f 85 a0 00 00 00    	jne    343a <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    339a:	8b 45 0c             	mov    0xc(%ebp),%eax
    339d:	8b 00                	mov    (%eax),%eax
    339f:	c1 e0 05             	shl    $0x5,%eax
    33a2:	89 c2                	mov    %eax,%edx
    33a4:	8b 45 08             	mov    0x8(%ebp),%eax
    33a7:	01 d0                	add    %edx,%eax
    33a9:	8d 50 04             	lea    0x4(%eax),%edx
    33ac:	83 ec 08             	sub    $0x8,%esp
    33af:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    33b5:	50                   	push   %eax
    33b6:	52                   	push   %edx
    33b7:	e8 8c ce ff ff       	call   248 <strcpy>
    33bc:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    33bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33c2:	8d 50 01             	lea    0x1(%eax),%edx
    33c5:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    33cb:	01 d0                	add    %edx,%eax
    33cd:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    33d3:	83 ec 08             	sub    $0x8,%esp
    33d6:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    33dc:	50                   	push   %eax
    33dd:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    33e3:	50                   	push   %eax
    33e4:	e8 7b d9 ff ff       	call   d64 <Translation>
    33e9:	83 c4 10             	add    $0x10,%esp
    33ec:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    33ef:	8b 45 0c             	mov    0xc(%ebp),%eax
    33f2:	8b 00                	mov    (%eax),%eax
    33f4:	c1 e0 05             	shl    $0x5,%eax
    33f7:	89 c2                	mov    %eax,%edx
    33f9:	8b 45 08             	mov    0x8(%ebp),%eax
    33fc:	01 d0                	add    %edx,%eax
    33fe:	dd 45 d8             	fldl   -0x28(%ebp)
    3401:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    3404:	8b 45 0c             	mov    0xc(%ebp),%eax
    3407:	8b 00                	mov    (%eax),%eax
    3409:	c1 e0 05             	shl    $0x5,%eax
    340c:	89 c2                	mov    %eax,%edx
    340e:	8b 45 08             	mov    0x8(%ebp),%eax
    3411:	01 d0                	add    %edx,%eax
    3413:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    3419:	8b 45 0c             	mov    0xc(%ebp),%eax
    341c:	8b 00                	mov    (%eax),%eax
    341e:	8d 50 01             	lea    0x1(%eax),%edx
    3421:	8b 45 0c             	mov    0xc(%ebp),%eax
    3424:	89 10                	mov    %edx,(%eax)
        pos++;
    3426:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    342c:	83 c0 01             	add    $0x1,%eax
    342f:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    3435:	e9 ff 00 00 00       	jmp    3539 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    343a:	8b 45 0c             	mov    0xc(%ebp),%eax
    343d:	8b 00                	mov    (%eax),%eax
    343f:	c1 e0 05             	shl    $0x5,%eax
    3442:	89 c2                	mov    %eax,%edx
    3444:	8b 45 08             	mov    0x8(%ebp),%eax
    3447:	01 d0                	add    %edx,%eax
    3449:	8d 50 04             	lea    0x4(%eax),%edx
    344c:	83 ec 08             	sub    $0x8,%esp
    344f:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3455:	50                   	push   %eax
    3456:	52                   	push   %edx
    3457:	e8 ec cd ff ff       	call   248 <strcpy>
    345c:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    345f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3462:	8d 50 01             	lea    0x1(%eax),%edx
    3465:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    346b:	01 d0                	add    %edx,%eax
    346d:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    3473:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3479:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    347c:	eb 04                	jmp    3482 <readVariables+0x1af>
        {
          strend++;
    347e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    3482:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    3488:	8b 45 f0             	mov    -0x10(%ebp),%eax
    348b:	01 d0                	add    %edx,%eax
    348d:	0f b6 00             	movzbl (%eax),%eax
    3490:	84 c0                	test   %al,%al
    3492:	75 ea                	jne    347e <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    3494:	8b 45 0c             	mov    0xc(%ebp),%eax
    3497:	8b 00                	mov    (%eax),%eax
    3499:	c1 e0 05             	shl    $0x5,%eax
    349c:	89 c2                	mov    %eax,%edx
    349e:	8b 45 08             	mov    0x8(%ebp),%eax
    34a1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    34a4:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    34aa:	8b 55 f0             	mov    -0x10(%ebp),%edx
    34ad:	29 c2                	sub    %eax,%edx
    34af:	89 d0                	mov    %edx,%eax
    34b1:	83 c0 01             	add    $0x1,%eax
    34b4:	83 ec 0c             	sub    $0xc,%esp
    34b7:	50                   	push   %eax
    34b8:	e8 6a d5 ff ff       	call   a27 <malloc>
    34bd:	83 c4 10             	add    $0x10,%esp
    34c0:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    34c3:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    34c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    34cc:	eb 35                	jmp    3503 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    34ce:	8b 45 0c             	mov    0xc(%ebp),%eax
    34d1:	8b 00                	mov    (%eax),%eax
    34d3:	c1 e0 05             	shl    $0x5,%eax
    34d6:	89 c2                	mov    %eax,%edx
    34d8:	8b 45 08             	mov    0x8(%ebp),%eax
    34db:	01 d0                	add    %edx,%eax
    34dd:	8b 40 18             	mov    0x18(%eax),%eax
    34e0:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    34e6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    34e9:	29 d1                	sub    %edx,%ecx
    34eb:	89 ca                	mov    %ecx,%edx
    34ed:	01 c2                	add    %eax,%edx
    34ef:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    34f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    34f8:	01 c8                	add    %ecx,%eax
    34fa:	0f b6 00             	movzbl (%eax),%eax
    34fd:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    34ff:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    3503:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3506:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3509:	7e c3                	jle    34ce <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    350b:	8b 45 0c             	mov    0xc(%ebp),%eax
    350e:	8b 00                	mov    (%eax),%eax
    3510:	c1 e0 05             	shl    $0x5,%eax
    3513:	89 c2                	mov    %eax,%edx
    3515:	8b 45 08             	mov    0x8(%ebp),%eax
    3518:	01 d0                	add    %edx,%eax
    351a:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    3520:	8b 45 0c             	mov    0xc(%ebp),%eax
    3523:	8b 00                	mov    (%eax),%eax
    3525:	8d 50 01             	lea    0x1(%eax),%edx
    3528:	8b 45 0c             	mov    0xc(%ebp),%eax
    352b:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    352d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3530:	83 c0 01             	add    $0x1,%eax
    3533:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    3539:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    353c:	8d 50 ff             	lea    -0x1(%eax),%edx
    353f:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3545:	39 c2                	cmp    %eax,%edx
    3547:	0f 8d e5 fd ff ff    	jge    3332 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    354d:	83 ec 04             	sub    $0x4,%esp
    3550:	68 e8 03 00 00       	push   $0x3e8
    3555:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    355b:	50                   	push   %eax
    355c:	ff 75 e8             	pushl  -0x18(%ebp)
    355f:	e8 2d cf ff ff       	call   491 <read>
    3564:	83 c4 10             	add    $0x10,%esp
    3567:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    356a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    356e:	0f 8f af fd ff ff    	jg     3323 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    3574:	83 ec 0c             	sub    $0xc,%esp
    3577:	ff 75 e8             	pushl  -0x18(%ebp)
    357a:	e8 22 cf ff ff       	call   4a1 <close>
    357f:	83 c4 10             	add    $0x10,%esp
}
    3582:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3585:	c9                   	leave  
    3586:	c3                   	ret    

00003587 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3587:	55                   	push   %ebp
    3588:	89 e5                	mov    %esp,%ebp
    358a:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    3590:	83 ec 08             	sub    $0x8,%esp
    3593:	6a 02                	push   $0x2
    3595:	68 f8 3a 00 00       	push   $0x3af8
    359a:	e8 1a cf ff ff       	call   4b9 <open>
    359f:	83 c4 10             	add    $0x10,%esp
    35a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    35a5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    35a9:	78 1e                	js     35c9 <writeVariables+0x42>
  {
    close(fd);
    35ab:	83 ec 0c             	sub    $0xc,%esp
    35ae:	ff 75 e4             	pushl  -0x1c(%ebp)
    35b1:	e8 eb ce ff ff       	call   4a1 <close>
    35b6:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    35b9:	83 ec 0c             	sub    $0xc,%esp
    35bc:	68 f8 3a 00 00       	push   $0x3af8
    35c1:	e8 03 cf ff ff       	call   4c9 <unlink>
    35c6:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    35c9:	83 ec 08             	sub    $0x8,%esp
    35cc:	68 02 02 00 00       	push   $0x202
    35d1:	68 f8 3a 00 00       	push   $0x3af8
    35d6:	e8 de ce ff ff       	call   4b9 <open>
    35db:	83 c4 10             	add    $0x10,%esp
    35de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    35e1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    35e8:	e9 ff 01 00 00       	jmp    37ec <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    35ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35f0:	c1 e0 05             	shl    $0x5,%eax
    35f3:	89 c2                	mov    %eax,%edx
    35f5:	8b 45 08             	mov    0x8(%ebp),%eax
    35f8:	01 d0                	add    %edx,%eax
    35fa:	8b 00                	mov    (%eax),%eax
    35fc:	83 f8 01             	cmp    $0x1,%eax
    35ff:	0f 85 d3 00 00 00    	jne    36d8 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    3605:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    360c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    360f:	8d 50 01             	lea    0x1(%eax),%edx
    3612:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3615:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    361c:	64 
      int k=0;
    361d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    3624:	eb 2c                	jmp    3652 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    3626:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3629:	8d 50 01             	lea    0x1(%eax),%edx
    362c:	89 55 e0             	mov    %edx,-0x20(%ebp)
    362f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3632:	89 d1                	mov    %edx,%ecx
    3634:	c1 e1 05             	shl    $0x5,%ecx
    3637:	8b 55 08             	mov    0x8(%ebp),%edx
    363a:	01 d1                	add    %edx,%ecx
    363c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    363f:	01 ca                	add    %ecx,%edx
    3641:	83 c2 04             	add    $0x4,%edx
    3644:	0f b6 12             	movzbl (%edx),%edx
    3647:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    364e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    3652:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3655:	c1 e0 05             	shl    $0x5,%eax
    3658:	89 c2                	mov    %eax,%edx
    365a:	8b 45 08             	mov    0x8(%ebp),%eax
    365d:	01 c2                	add    %eax,%edx
    365f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3662:	01 d0                	add    %edx,%eax
    3664:	83 c0 04             	add    $0x4,%eax
    3667:	0f b6 00             	movzbl (%eax),%eax
    366a:	84 c0                	test   %al,%al
    366c:	75 b8                	jne    3626 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    366e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3671:	8d 50 01             	lea    0x1(%eax),%edx
    3674:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3677:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    367e:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    367f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3682:	c1 e0 05             	shl    $0x5,%eax
    3685:	89 c2                	mov    %eax,%edx
    3687:	8b 45 08             	mov    0x8(%ebp),%eax
    368a:	01 d0                	add    %edx,%eax
    368c:	dd 40 18             	fldl   0x18(%eax)
    368f:	8d 45 e0             	lea    -0x20(%ebp),%eax
    3692:	50                   	push   %eax
    3693:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3697:	dd 1c 24             	fstpl  (%esp)
    369a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    36a0:	50                   	push   %eax
    36a1:	e8 7d d5 ff ff       	call   c23 <double2str>
    36a6:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    36a9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    36ac:	8d 50 01             	lea    0x1(%eax),%edx
    36af:	89 55 e0             	mov    %edx,-0x20(%ebp)
    36b2:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    36b9:	00 
      write(fd,buf,pos);
    36ba:	8b 45 e0             	mov    -0x20(%ebp),%eax
    36bd:	83 ec 04             	sub    $0x4,%esp
    36c0:	50                   	push   %eax
    36c1:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    36c7:	50                   	push   %eax
    36c8:	ff 75 e4             	pushl  -0x1c(%ebp)
    36cb:	e8 c9 cd ff ff       	call   499 <write>
    36d0:	83 c4 10             	add    $0x10,%esp
    36d3:	e9 10 01 00 00       	jmp    37e8 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    36d8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    36df:	8b 45 ec             	mov    -0x14(%ebp),%eax
    36e2:	8d 50 01             	lea    0x1(%eax),%edx
    36e5:	89 55 ec             	mov    %edx,-0x14(%ebp)
    36e8:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    36ef:	73 
      int k=0;
    36f0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    36f7:	eb 2c                	jmp    3725 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    36f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    36fc:	8d 50 01             	lea    0x1(%eax),%edx
    36ff:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3702:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3705:	89 d1                	mov    %edx,%ecx
    3707:	c1 e1 05             	shl    $0x5,%ecx
    370a:	8b 55 08             	mov    0x8(%ebp),%edx
    370d:	01 d1                	add    %edx,%ecx
    370f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3712:	01 ca                	add    %ecx,%edx
    3714:	83 c2 04             	add    $0x4,%edx
    3717:	0f b6 12             	movzbl (%edx),%edx
    371a:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3721:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    3725:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3728:	c1 e0 05             	shl    $0x5,%eax
    372b:	89 c2                	mov    %eax,%edx
    372d:	8b 45 08             	mov    0x8(%ebp),%eax
    3730:	01 c2                	add    %eax,%edx
    3732:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3735:	01 d0                	add    %edx,%eax
    3737:	83 c0 04             	add    $0x4,%eax
    373a:	0f b6 00             	movzbl (%eax),%eax
    373d:	84 c0                	test   %al,%al
    373f:	75 b8                	jne    36f9 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3741:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3744:	8d 50 01             	lea    0x1(%eax),%edx
    3747:	89 55 ec             	mov    %edx,-0x14(%ebp)
    374a:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    3751:	3d 
      k=0;
    3752:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    3759:	eb 2c                	jmp    3787 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    375b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    375e:	8d 50 01             	lea    0x1(%eax),%edx
    3761:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3764:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3767:	89 d1                	mov    %edx,%ecx
    3769:	c1 e1 05             	shl    $0x5,%ecx
    376c:	8b 55 08             	mov    0x8(%ebp),%edx
    376f:	01 ca                	add    %ecx,%edx
    3771:	8b 4a 18             	mov    0x18(%edx),%ecx
    3774:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3777:	01 ca                	add    %ecx,%edx
    3779:	0f b6 12             	movzbl (%edx),%edx
    377c:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3783:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    3787:	8b 45 f4             	mov    -0xc(%ebp),%eax
    378a:	c1 e0 05             	shl    $0x5,%eax
    378d:	89 c2                	mov    %eax,%edx
    378f:	8b 45 08             	mov    0x8(%ebp),%eax
    3792:	01 d0                	add    %edx,%eax
    3794:	8b 50 18             	mov    0x18(%eax),%edx
    3797:	8b 45 e8             	mov    -0x18(%ebp),%eax
    379a:	01 d0                	add    %edx,%eax
    379c:	0f b6 00             	movzbl (%eax),%eax
    379f:	84 c0                	test   %al,%al
    37a1:	75 b8                	jne    375b <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    37a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    37a6:	8d 50 01             	lea    0x1(%eax),%edx
    37a9:	89 55 ec             	mov    %edx,-0x14(%ebp)
    37ac:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    37b3:	00 
      write(fd,buf,pos);
    37b4:	83 ec 04             	sub    $0x4,%esp
    37b7:	ff 75 ec             	pushl  -0x14(%ebp)
    37ba:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    37c0:	50                   	push   %eax
    37c1:	ff 75 e4             	pushl  -0x1c(%ebp)
    37c4:	e8 d0 cc ff ff       	call   499 <write>
    37c9:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    37cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37cf:	c1 e0 05             	shl    $0x5,%eax
    37d2:	89 c2                	mov    %eax,%edx
    37d4:	8b 45 08             	mov    0x8(%ebp),%eax
    37d7:	01 d0                	add    %edx,%eax
    37d9:	8b 40 18             	mov    0x18(%eax),%eax
    37dc:	83 ec 0c             	sub    $0xc,%esp
    37df:	50                   	push   %eax
    37e0:	e8 00 d1 ff ff       	call   8e5 <free>
    37e5:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    37e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    37ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    37ef:	8b 00                	mov    (%eax),%eax
    37f1:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    37f4:	0f 8f f3 fd ff ff    	jg     35ed <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    37fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    37fd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    3803:	83 ec 0c             	sub    $0xc,%esp
    3806:	ff 75 e4             	pushl  -0x1c(%ebp)
    3809:	e8 93 cc ff ff       	call   4a1 <close>
    380e:	83 c4 10             	add    $0x10,%esp
  return;
    3811:	90                   	nop
    3812:	c9                   	leave  
    3813:	c3                   	ret    
