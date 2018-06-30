
_kill：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	53                   	push   %ebx
       e:	51                   	push   %ecx
       f:	83 ec 10             	sub    $0x10,%esp
      12:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 1){
      14:	83 3b 00             	cmpl   $0x0,(%ebx)
      17:	7f 17                	jg     30 <main+0x30>
    printf(2, "usage: kill pid...\n");
      19:	83 ec 08             	sub    $0x8,%esp
      1c:	68 68 36 00 00       	push   $0x3668
      21:	6a 02                	push   $0x2
      23:	e8 4d 05 00 00       	call   575 <printf>
      28:	83 c4 10             	add    $0x10,%esp
    exit();
      2b:	e8 99 02 00 00       	call   2c9 <exit>
  }
  for(i=1; i<argc; i++)
      30:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      37:	eb 2d                	jmp    66 <main+0x66>
    kill(atoi(argv[i]));
      39:	8b 45 f4             	mov    -0xc(%ebp),%eax
      3c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
      43:	8b 43 04             	mov    0x4(%ebx),%eax
      46:	01 d0                	add    %edx,%eax
      48:	8b 00                	mov    (%eax),%eax
      4a:	83 ec 0c             	sub    $0xc,%esp
      4d:	50                   	push   %eax
      4e:	e8 e4 01 00 00       	call   237 <atoi>
      53:	83 c4 10             	add    $0x10,%esp
      56:	83 ec 0c             	sub    $0xc,%esp
      59:	50                   	push   %eax
      5a:	e8 9a 02 00 00       	call   2f9 <kill>
      5f:	83 c4 10             	add    $0x10,%esp

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
      62:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      66:	8b 45 f4             	mov    -0xc(%ebp),%eax
      69:	3b 03                	cmp    (%ebx),%eax
      6b:	7c cc                	jl     39 <main+0x39>
    kill(atoi(argv[i]));
  exit();
      6d:	e8 57 02 00 00       	call   2c9 <exit>

00000072 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
      72:	55                   	push   %ebp
      73:	89 e5                	mov    %esp,%ebp
      75:	57                   	push   %edi
      76:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
      77:	8b 4d 08             	mov    0x8(%ebp),%ecx
      7a:	8b 55 10             	mov    0x10(%ebp),%edx
      7d:	8b 45 0c             	mov    0xc(%ebp),%eax
      80:	89 cb                	mov    %ecx,%ebx
      82:	89 df                	mov    %ebx,%edi
      84:	89 d1                	mov    %edx,%ecx
      86:	fc                   	cld    
      87:	f3 aa                	rep stos %al,%es:(%edi)
      89:	89 ca                	mov    %ecx,%edx
      8b:	89 fb                	mov    %edi,%ebx
      8d:	89 5d 08             	mov    %ebx,0x8(%ebp)
      90:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
      93:	90                   	nop
      94:	5b                   	pop    %ebx
      95:	5f                   	pop    %edi
      96:	5d                   	pop    %ebp
      97:	c3                   	ret    

00000098 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
      98:	55                   	push   %ebp
      99:	89 e5                	mov    %esp,%ebp
      9b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
      9e:	8b 45 08             	mov    0x8(%ebp),%eax
      a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
      a4:	90                   	nop
      a5:	8b 45 08             	mov    0x8(%ebp),%eax
      a8:	8d 50 01             	lea    0x1(%eax),%edx
      ab:	89 55 08             	mov    %edx,0x8(%ebp)
      ae:	8b 55 0c             	mov    0xc(%ebp),%edx
      b1:	8d 4a 01             	lea    0x1(%edx),%ecx
      b4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
      b7:	0f b6 12             	movzbl (%edx),%edx
      ba:	88 10                	mov    %dl,(%eax)
      bc:	0f b6 00             	movzbl (%eax),%eax
      bf:	84 c0                	test   %al,%al
      c1:	75 e2                	jne    a5 <strcpy+0xd>
    ;
  return os;
      c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
      c6:	c9                   	leave  
      c7:	c3                   	ret    

000000c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      c8:	55                   	push   %ebp
      c9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
      cb:	eb 08                	jmp    d5 <strcmp+0xd>
    p++, q++;
      cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
      d1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      d5:	8b 45 08             	mov    0x8(%ebp),%eax
      d8:	0f b6 00             	movzbl (%eax),%eax
      db:	84 c0                	test   %al,%al
      dd:	74 10                	je     ef <strcmp+0x27>
      df:	8b 45 08             	mov    0x8(%ebp),%eax
      e2:	0f b6 10             	movzbl (%eax),%edx
      e5:	8b 45 0c             	mov    0xc(%ebp),%eax
      e8:	0f b6 00             	movzbl (%eax),%eax
      eb:	38 c2                	cmp    %al,%dl
      ed:	74 de                	je     cd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
      ef:	8b 45 08             	mov    0x8(%ebp),%eax
      f2:	0f b6 00             	movzbl (%eax),%eax
      f5:	0f b6 d0             	movzbl %al,%edx
      f8:	8b 45 0c             	mov    0xc(%ebp),%eax
      fb:	0f b6 00             	movzbl (%eax),%eax
      fe:	0f b6 c0             	movzbl %al,%eax
     101:	29 c2                	sub    %eax,%edx
     103:	89 d0                	mov    %edx,%eax
}
     105:	5d                   	pop    %ebp
     106:	c3                   	ret    

00000107 <strlen>:

uint
strlen(char *s)
{
     107:	55                   	push   %ebp
     108:	89 e5                	mov    %esp,%ebp
     10a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     10d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     114:	eb 04                	jmp    11a <strlen+0x13>
     116:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     11a:	8b 55 fc             	mov    -0x4(%ebp),%edx
     11d:	8b 45 08             	mov    0x8(%ebp),%eax
     120:	01 d0                	add    %edx,%eax
     122:	0f b6 00             	movzbl (%eax),%eax
     125:	84 c0                	test   %al,%al
     127:	75 ed                	jne    116 <strlen+0xf>
    ;
  return n;
     129:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     12c:	c9                   	leave  
     12d:	c3                   	ret    

0000012e <memset>:

void*
memset(void *dst, int c, uint n)
{
     12e:	55                   	push   %ebp
     12f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     131:	8b 45 10             	mov    0x10(%ebp),%eax
     134:	50                   	push   %eax
     135:	ff 75 0c             	pushl  0xc(%ebp)
     138:	ff 75 08             	pushl  0x8(%ebp)
     13b:	e8 32 ff ff ff       	call   72 <stosb>
     140:	83 c4 0c             	add    $0xc,%esp
  return dst;
     143:	8b 45 08             	mov    0x8(%ebp),%eax
}
     146:	c9                   	leave  
     147:	c3                   	ret    

00000148 <strchr>:

char*
strchr(const char *s, char c)
{
     148:	55                   	push   %ebp
     149:	89 e5                	mov    %esp,%ebp
     14b:	83 ec 04             	sub    $0x4,%esp
     14e:	8b 45 0c             	mov    0xc(%ebp),%eax
     151:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     154:	eb 14                	jmp    16a <strchr+0x22>
    if(*s == c)
     156:	8b 45 08             	mov    0x8(%ebp),%eax
     159:	0f b6 00             	movzbl (%eax),%eax
     15c:	3a 45 fc             	cmp    -0x4(%ebp),%al
     15f:	75 05                	jne    166 <strchr+0x1e>
      return (char*)s;
     161:	8b 45 08             	mov    0x8(%ebp),%eax
     164:	eb 13                	jmp    179 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     166:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     16a:	8b 45 08             	mov    0x8(%ebp),%eax
     16d:	0f b6 00             	movzbl (%eax),%eax
     170:	84 c0                	test   %al,%al
     172:	75 e2                	jne    156 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     174:	b8 00 00 00 00       	mov    $0x0,%eax
}
     179:	c9                   	leave  
     17a:	c3                   	ret    

0000017b <gets>:

char*
gets(char *buf, int max)
{
     17b:	55                   	push   %ebp
     17c:	89 e5                	mov    %esp,%ebp
     17e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     181:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     188:	eb 42                	jmp    1cc <gets+0x51>
    cc = read(0, &c, 1);
     18a:	83 ec 04             	sub    $0x4,%esp
     18d:	6a 01                	push   $0x1
     18f:	8d 45 ef             	lea    -0x11(%ebp),%eax
     192:	50                   	push   %eax
     193:	6a 00                	push   $0x0
     195:	e8 47 01 00 00       	call   2e1 <read>
     19a:	83 c4 10             	add    $0x10,%esp
     19d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     1a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     1a4:	7e 33                	jle    1d9 <gets+0x5e>
      break;
    buf[i++] = c;
     1a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1a9:	8d 50 01             	lea    0x1(%eax),%edx
     1ac:	89 55 f4             	mov    %edx,-0xc(%ebp)
     1af:	89 c2                	mov    %eax,%edx
     1b1:	8b 45 08             	mov    0x8(%ebp),%eax
     1b4:	01 c2                	add    %eax,%edx
     1b6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1ba:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     1bc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1c0:	3c 0a                	cmp    $0xa,%al
     1c2:	74 16                	je     1da <gets+0x5f>
     1c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1c8:	3c 0d                	cmp    $0xd,%al
     1ca:	74 0e                	je     1da <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     1cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1cf:	83 c0 01             	add    $0x1,%eax
     1d2:	3b 45 0c             	cmp    0xc(%ebp),%eax
     1d5:	7c b3                	jl     18a <gets+0xf>
     1d7:	eb 01                	jmp    1da <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     1d9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1da:	8b 55 f4             	mov    -0xc(%ebp),%edx
     1dd:	8b 45 08             	mov    0x8(%ebp),%eax
     1e0:	01 d0                	add    %edx,%eax
     1e2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     1e5:	8b 45 08             	mov    0x8(%ebp),%eax
}
     1e8:	c9                   	leave  
     1e9:	c3                   	ret    

000001ea <stat>:

int
stat(char *n, struct stat *st)
{
     1ea:	55                   	push   %ebp
     1eb:	89 e5                	mov    %esp,%ebp
     1ed:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     1f0:	83 ec 08             	sub    $0x8,%esp
     1f3:	6a 00                	push   $0x0
     1f5:	ff 75 08             	pushl  0x8(%ebp)
     1f8:	e8 0c 01 00 00       	call   309 <open>
     1fd:	83 c4 10             	add    $0x10,%esp
     200:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     203:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     207:	79 07                	jns    210 <stat+0x26>
    return -1;
     209:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     20e:	eb 25                	jmp    235 <stat+0x4b>
  r = fstat(fd, st);
     210:	83 ec 08             	sub    $0x8,%esp
     213:	ff 75 0c             	pushl  0xc(%ebp)
     216:	ff 75 f4             	pushl  -0xc(%ebp)
     219:	e8 03 01 00 00       	call   321 <fstat>
     21e:	83 c4 10             	add    $0x10,%esp
     221:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     224:	83 ec 0c             	sub    $0xc,%esp
     227:	ff 75 f4             	pushl  -0xc(%ebp)
     22a:	e8 c2 00 00 00       	call   2f1 <close>
     22f:	83 c4 10             	add    $0x10,%esp
  return r;
     232:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     235:	c9                   	leave  
     236:	c3                   	ret    

00000237 <atoi>:

int
atoi(const char *s)
{
     237:	55                   	push   %ebp
     238:	89 e5                	mov    %esp,%ebp
     23a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     23d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     244:	eb 25                	jmp    26b <atoi+0x34>
    n = n*10 + *s++ - '0';
     246:	8b 55 fc             	mov    -0x4(%ebp),%edx
     249:	89 d0                	mov    %edx,%eax
     24b:	c1 e0 02             	shl    $0x2,%eax
     24e:	01 d0                	add    %edx,%eax
     250:	01 c0                	add    %eax,%eax
     252:	89 c1                	mov    %eax,%ecx
     254:	8b 45 08             	mov    0x8(%ebp),%eax
     257:	8d 50 01             	lea    0x1(%eax),%edx
     25a:	89 55 08             	mov    %edx,0x8(%ebp)
     25d:	0f b6 00             	movzbl (%eax),%eax
     260:	0f be c0             	movsbl %al,%eax
     263:	01 c8                	add    %ecx,%eax
     265:	83 e8 30             	sub    $0x30,%eax
     268:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     26b:	8b 45 08             	mov    0x8(%ebp),%eax
     26e:	0f b6 00             	movzbl (%eax),%eax
     271:	3c 2f                	cmp    $0x2f,%al
     273:	7e 0a                	jle    27f <atoi+0x48>
     275:	8b 45 08             	mov    0x8(%ebp),%eax
     278:	0f b6 00             	movzbl (%eax),%eax
     27b:	3c 39                	cmp    $0x39,%al
     27d:	7e c7                	jle    246 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     27f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     282:	c9                   	leave  
     283:	c3                   	ret    

00000284 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     284:	55                   	push   %ebp
     285:	89 e5                	mov    %esp,%ebp
     287:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     28a:	8b 45 08             	mov    0x8(%ebp),%eax
     28d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     290:	8b 45 0c             	mov    0xc(%ebp),%eax
     293:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     296:	eb 17                	jmp    2af <memmove+0x2b>
    *dst++ = *src++;
     298:	8b 45 fc             	mov    -0x4(%ebp),%eax
     29b:	8d 50 01             	lea    0x1(%eax),%edx
     29e:	89 55 fc             	mov    %edx,-0x4(%ebp)
     2a1:	8b 55 f8             	mov    -0x8(%ebp),%edx
     2a4:	8d 4a 01             	lea    0x1(%edx),%ecx
     2a7:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     2aa:	0f b6 12             	movzbl (%edx),%edx
     2ad:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     2af:	8b 45 10             	mov    0x10(%ebp),%eax
     2b2:	8d 50 ff             	lea    -0x1(%eax),%edx
     2b5:	89 55 10             	mov    %edx,0x10(%ebp)
     2b8:	85 c0                	test   %eax,%eax
     2ba:	7f dc                	jg     298 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     2bc:	8b 45 08             	mov    0x8(%ebp),%eax
}
     2bf:	c9                   	leave  
     2c0:	c3                   	ret    

000002c1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     2c1:	b8 01 00 00 00       	mov    $0x1,%eax
     2c6:	cd 40                	int    $0x40
     2c8:	c3                   	ret    

000002c9 <exit>:
SYSCALL(exit)
     2c9:	b8 02 00 00 00       	mov    $0x2,%eax
     2ce:	cd 40                	int    $0x40
     2d0:	c3                   	ret    

000002d1 <wait>:
SYSCALL(wait)
     2d1:	b8 03 00 00 00       	mov    $0x3,%eax
     2d6:	cd 40                	int    $0x40
     2d8:	c3                   	ret    

000002d9 <pipe>:
SYSCALL(pipe)
     2d9:	b8 04 00 00 00       	mov    $0x4,%eax
     2de:	cd 40                	int    $0x40
     2e0:	c3                   	ret    

000002e1 <read>:
SYSCALL(read)
     2e1:	b8 05 00 00 00       	mov    $0x5,%eax
     2e6:	cd 40                	int    $0x40
     2e8:	c3                   	ret    

000002e9 <write>:
SYSCALL(write)
     2e9:	b8 10 00 00 00       	mov    $0x10,%eax
     2ee:	cd 40                	int    $0x40
     2f0:	c3                   	ret    

000002f1 <close>:
SYSCALL(close)
     2f1:	b8 15 00 00 00       	mov    $0x15,%eax
     2f6:	cd 40                	int    $0x40
     2f8:	c3                   	ret    

000002f9 <kill>:
SYSCALL(kill)
     2f9:	b8 06 00 00 00       	mov    $0x6,%eax
     2fe:	cd 40                	int    $0x40
     300:	c3                   	ret    

00000301 <exec>:
SYSCALL(exec)
     301:	b8 07 00 00 00       	mov    $0x7,%eax
     306:	cd 40                	int    $0x40
     308:	c3                   	ret    

00000309 <open>:
SYSCALL(open)
     309:	b8 0f 00 00 00       	mov    $0xf,%eax
     30e:	cd 40                	int    $0x40
     310:	c3                   	ret    

00000311 <mknod>:
SYSCALL(mknod)
     311:	b8 11 00 00 00       	mov    $0x11,%eax
     316:	cd 40                	int    $0x40
     318:	c3                   	ret    

00000319 <unlink>:
SYSCALL(unlink)
     319:	b8 12 00 00 00       	mov    $0x12,%eax
     31e:	cd 40                	int    $0x40
     320:	c3                   	ret    

00000321 <fstat>:
SYSCALL(fstat)
     321:	b8 08 00 00 00       	mov    $0x8,%eax
     326:	cd 40                	int    $0x40
     328:	c3                   	ret    

00000329 <link>:
SYSCALL(link)
     329:	b8 13 00 00 00       	mov    $0x13,%eax
     32e:	cd 40                	int    $0x40
     330:	c3                   	ret    

00000331 <mkdir>:
SYSCALL(mkdir)
     331:	b8 14 00 00 00       	mov    $0x14,%eax
     336:	cd 40                	int    $0x40
     338:	c3                   	ret    

00000339 <chdir>:
SYSCALL(chdir)
     339:	b8 09 00 00 00       	mov    $0x9,%eax
     33e:	cd 40                	int    $0x40
     340:	c3                   	ret    

00000341 <dup>:
SYSCALL(dup)
     341:	b8 0a 00 00 00       	mov    $0xa,%eax
     346:	cd 40                	int    $0x40
     348:	c3                   	ret    

00000349 <getpid>:
SYSCALL(getpid)
     349:	b8 0b 00 00 00       	mov    $0xb,%eax
     34e:	cd 40                	int    $0x40
     350:	c3                   	ret    

00000351 <sbrk>:
SYSCALL(sbrk)
     351:	b8 0c 00 00 00       	mov    $0xc,%eax
     356:	cd 40                	int    $0x40
     358:	c3                   	ret    

00000359 <sleep>:
SYSCALL(sleep)
     359:	b8 0d 00 00 00       	mov    $0xd,%eax
     35e:	cd 40                	int    $0x40
     360:	c3                   	ret    

00000361 <uptime>:
SYSCALL(uptime)
     361:	b8 0e 00 00 00       	mov    $0xe,%eax
     366:	cd 40                	int    $0x40
     368:	c3                   	ret    

00000369 <colorwrite>:

//new here
SYSCALL(colorwrite)
     369:	b8 16 00 00 00       	mov    $0x16,%eax
     36e:	cd 40                	int    $0x40
     370:	c3                   	ret    

00000371 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     371:	55                   	push   %ebp
     372:	89 e5                	mov    %esp,%ebp
     374:	83 ec 18             	sub    $0x18,%esp
     377:	8b 45 0c             	mov    0xc(%ebp),%eax
     37a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     37d:	83 ec 04             	sub    $0x4,%esp
     380:	6a 01                	push   $0x1
     382:	8d 45 f4             	lea    -0xc(%ebp),%eax
     385:	50                   	push   %eax
     386:	ff 75 08             	pushl  0x8(%ebp)
     389:	e8 5b ff ff ff       	call   2e9 <write>
     38e:	83 c4 10             	add    $0x10,%esp
}
     391:	90                   	nop
     392:	c9                   	leave  
     393:	c3                   	ret    

00000394 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     394:	55                   	push   %ebp
     395:	89 e5                	mov    %esp,%ebp
     397:	53                   	push   %ebx
     398:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     39b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     3a2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     3a6:	74 17                	je     3bf <printint+0x2b>
     3a8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     3ac:	79 11                	jns    3bf <printint+0x2b>
    neg = 1;
     3ae:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     3b5:	8b 45 0c             	mov    0xc(%ebp),%eax
     3b8:	f7 d8                	neg    %eax
     3ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
     3bd:	eb 06                	jmp    3c5 <printint+0x31>
  } else {
    x = xx;
     3bf:	8b 45 0c             	mov    0xc(%ebp),%eax
     3c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     3c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     3cc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     3cf:	8d 41 01             	lea    0x1(%ecx),%eax
     3d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
     3d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     3d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3db:	ba 00 00 00 00       	mov    $0x0,%edx
     3e0:	f7 f3                	div    %ebx
     3e2:	89 d0                	mov    %edx,%eax
     3e4:	0f b6 80 a0 42 00 00 	movzbl 0x42a0(%eax),%eax
     3eb:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     3ef:	8b 5d 10             	mov    0x10(%ebp),%ebx
     3f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3f5:	ba 00 00 00 00       	mov    $0x0,%edx
     3fa:	f7 f3                	div    %ebx
     3fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
     3ff:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     403:	75 c7                	jne    3cc <printint+0x38>
  if(neg)
     405:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     409:	74 2d                	je     438 <printint+0xa4>
    buf[i++] = '-';
     40b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     40e:	8d 50 01             	lea    0x1(%eax),%edx
     411:	89 55 f4             	mov    %edx,-0xc(%ebp)
     414:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     419:	eb 1d                	jmp    438 <printint+0xa4>
    putc(fd, buf[i]);
     41b:	8d 55 dc             	lea    -0x24(%ebp),%edx
     41e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     421:	01 d0                	add    %edx,%eax
     423:	0f b6 00             	movzbl (%eax),%eax
     426:	0f be c0             	movsbl %al,%eax
     429:	83 ec 08             	sub    $0x8,%esp
     42c:	50                   	push   %eax
     42d:	ff 75 08             	pushl  0x8(%ebp)
     430:	e8 3c ff ff ff       	call   371 <putc>
     435:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     438:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     43c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     440:	79 d9                	jns    41b <printint+0x87>
    putc(fd, buf[i]);
}
     442:	90                   	nop
     443:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     446:	c9                   	leave  
     447:	c3                   	ret    

00000448 <getInteger>:

static int getInteger(double num)
{
     448:	55                   	push   %ebp
     449:	89 e5                	mov    %esp,%ebp
     44b:	83 ec 18             	sub    $0x18,%esp
     44e:	8b 45 08             	mov    0x8(%ebp),%eax
     451:	89 45 e8             	mov    %eax,-0x18(%ebp)
     454:	8b 45 0c             	mov    0xc(%ebp),%eax
     457:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     45a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     461:	eb 0e                	jmp    471 <getInteger+0x29>
  {
    num -= 1;
     463:	dd 45 e8             	fldl   -0x18(%ebp)
     466:	d9 e8                	fld1   
     468:	de e9                	fsubrp %st,%st(1)
     46a:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     46d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     471:	dd 45 e8             	fldl   -0x18(%ebp)
     474:	d9 e8                	fld1   
     476:	d9 c9                	fxch   %st(1)
     478:	df e9                	fucomip %st(1),%st
     47a:	dd d8                	fstp   %st(0)
     47c:	77 e5                	ja     463 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     47e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     481:	c9                   	leave  
     482:	c3                   	ret    

00000483 <printdbl>:

void printdbl(int fd, double num)
{
     483:	55                   	push   %ebp
     484:	89 e5                	mov    %esp,%ebp
     486:	83 ec 28             	sub    $0x28,%esp
     489:	8b 45 0c             	mov    0xc(%ebp),%eax
     48c:	89 45 e0             	mov    %eax,-0x20(%ebp)
     48f:	8b 45 10             	mov    0x10(%ebp),%eax
     492:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     495:	d9 ee                	fldz   
     497:	dd 45 e0             	fldl   -0x20(%ebp)
     49a:	d9 c9                	fxch   %st(1)
     49c:	df e9                	fucomip %st(1),%st
     49e:	dd d8                	fstp   %st(0)
     4a0:	76 18                	jbe    4ba <printdbl+0x37>
  {
    putc(fd,'-');
     4a2:	83 ec 08             	sub    $0x8,%esp
     4a5:	6a 2d                	push   $0x2d
     4a7:	ff 75 08             	pushl  0x8(%ebp)
     4aa:	e8 c2 fe ff ff       	call   371 <putc>
     4af:	83 c4 10             	add    $0x10,%esp
    num = -num;
     4b2:	dd 45 e0             	fldl   -0x20(%ebp)
     4b5:	d9 e0                	fchs   
     4b7:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     4ba:	83 ec 08             	sub    $0x8,%esp
     4bd:	ff 75 e4             	pushl  -0x1c(%ebp)
     4c0:	ff 75 e0             	pushl  -0x20(%ebp)
     4c3:	e8 80 ff ff ff       	call   448 <getInteger>
     4c8:	83 c4 10             	add    $0x10,%esp
     4cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     4ce:	6a 01                	push   $0x1
     4d0:	6a 0a                	push   $0xa
     4d2:	ff 75 f0             	pushl  -0x10(%ebp)
     4d5:	ff 75 08             	pushl  0x8(%ebp)
     4d8:	e8 b7 fe ff ff       	call   394 <printint>
     4dd:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     4e0:	db 45 f0             	fildl  -0x10(%ebp)
     4e3:	dd 45 e0             	fldl   -0x20(%ebp)
     4e6:	de e1                	fsubp  %st,%st(1)
     4e8:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     4eb:	dd 45 e0             	fldl   -0x20(%ebp)
     4ee:	dd 05 88 36 00 00    	fldl   0x3688
     4f4:	d9 c9                	fxch   %st(1)
     4f6:	df e9                	fucomip %st(1),%st
     4f8:	dd d8                	fstp   %st(0)
     4fa:	76 10                	jbe    50c <printdbl+0x89>
    putc(fd,'.');
     4fc:	83 ec 08             	sub    $0x8,%esp
     4ff:	6a 2e                	push   $0x2e
     501:	ff 75 08             	pushl  0x8(%ebp)
     504:	e8 68 fe ff ff       	call   371 <putc>
     509:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     50c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     513:	eb 49                	jmp    55e <printdbl+0xdb>
  {
    num = num*10;
     515:	dd 45 e0             	fldl   -0x20(%ebp)
     518:	dd 05 90 36 00 00    	fldl   0x3690
     51e:	de c9                	fmulp  %st,%st(1)
     520:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     523:	83 ec 08             	sub    $0x8,%esp
     526:	ff 75 e4             	pushl  -0x1c(%ebp)
     529:	ff 75 e0             	pushl  -0x20(%ebp)
     52c:	e8 17 ff ff ff       	call   448 <getInteger>
     531:	83 c4 10             	add    $0x10,%esp
     534:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     537:	6a 01                	push   $0x1
     539:	6a 0a                	push   $0xa
     53b:	ff 75 f0             	pushl  -0x10(%ebp)
     53e:	ff 75 08             	pushl  0x8(%ebp)
     541:	e8 4e fe ff ff       	call   394 <printint>
     546:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     549:	db 45 f0             	fildl  -0x10(%ebp)
     54c:	dd 45 e0             	fldl   -0x20(%ebp)
     54f:	de e1                	fsubp  %st,%st(1)
     551:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     554:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     558:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     55c:	7f 13                	jg     571 <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     55e:	dd 45 e0             	fldl   -0x20(%ebp)
     561:	dd 05 88 36 00 00    	fldl   0x3688
     567:	d9 c9                	fxch   %st(1)
     569:	df e9                	fucomip %st(1),%st
     56b:	dd d8                	fstp   %st(0)
     56d:	77 a6                	ja     515 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     56f:	eb 01                	jmp    572 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     571:	90                   	nop
    }
  }
}
     572:	90                   	nop
     573:	c9                   	leave  
     574:	c3                   	ret    

00000575 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     575:	55                   	push   %ebp
     576:	89 e5                	mov    %esp,%ebp
     578:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     57b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     582:	8d 45 0c             	lea    0xc(%ebp),%eax
     585:	83 c0 04             	add    $0x4,%eax
     588:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     58b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     592:	e9 88 01 00 00       	jmp    71f <printf+0x1aa>
    c = fmt[i] & 0xff;
     597:	8b 55 0c             	mov    0xc(%ebp),%edx
     59a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     59d:	01 d0                	add    %edx,%eax
     59f:	0f b6 00             	movzbl (%eax),%eax
     5a2:	0f be c0             	movsbl %al,%eax
     5a5:	25 ff 00 00 00       	and    $0xff,%eax
     5aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     5ad:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     5b1:	75 2c                	jne    5df <printf+0x6a>
      if(c == '%'){
     5b3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     5b7:	75 0c                	jne    5c5 <printf+0x50>
        state = '%';
     5b9:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     5c0:	e9 56 01 00 00       	jmp    71b <printf+0x1a6>
      } else {
        putc(fd, c);
     5c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     5c8:	0f be c0             	movsbl %al,%eax
     5cb:	83 ec 08             	sub    $0x8,%esp
     5ce:	50                   	push   %eax
     5cf:	ff 75 08             	pushl  0x8(%ebp)
     5d2:	e8 9a fd ff ff       	call   371 <putc>
     5d7:	83 c4 10             	add    $0x10,%esp
     5da:	e9 3c 01 00 00       	jmp    71b <printf+0x1a6>
      }
    } else if(state == '%'){
     5df:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     5e3:	0f 85 32 01 00 00    	jne    71b <printf+0x1a6>
      if(c == 'd'){
     5e9:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     5ed:	75 1e                	jne    60d <printf+0x98>
        printint(fd, *ap, 10, 1);
     5ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
     5f2:	8b 00                	mov    (%eax),%eax
     5f4:	6a 01                	push   $0x1
     5f6:	6a 0a                	push   $0xa
     5f8:	50                   	push   %eax
     5f9:	ff 75 08             	pushl  0x8(%ebp)
     5fc:	e8 93 fd ff ff       	call   394 <printint>
     601:	83 c4 10             	add    $0x10,%esp
        ap++;
     604:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     608:	e9 07 01 00 00       	jmp    714 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     60d:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     611:	74 06                	je     619 <printf+0xa4>
     613:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     617:	75 1e                	jne    637 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     619:	8b 45 e8             	mov    -0x18(%ebp),%eax
     61c:	8b 00                	mov    (%eax),%eax
     61e:	6a 00                	push   $0x0
     620:	6a 10                	push   $0x10
     622:	50                   	push   %eax
     623:	ff 75 08             	pushl  0x8(%ebp)
     626:	e8 69 fd ff ff       	call   394 <printint>
     62b:	83 c4 10             	add    $0x10,%esp
        ap++;
     62e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     632:	e9 dd 00 00 00       	jmp    714 <printf+0x19f>
      } else if(c == 's'){
     637:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     63b:	75 46                	jne    683 <printf+0x10e>
        s = (char*)*ap;
     63d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     640:	8b 00                	mov    (%eax),%eax
     642:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     645:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     649:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     64d:	75 25                	jne    674 <printf+0xff>
          s = "(null)";
     64f:	c7 45 f4 80 36 00 00 	movl   $0x3680,-0xc(%ebp)
        while(*s != 0){
     656:	eb 1c                	jmp    674 <printf+0xff>
          putc(fd, *s);
     658:	8b 45 f4             	mov    -0xc(%ebp),%eax
     65b:	0f b6 00             	movzbl (%eax),%eax
     65e:	0f be c0             	movsbl %al,%eax
     661:	83 ec 08             	sub    $0x8,%esp
     664:	50                   	push   %eax
     665:	ff 75 08             	pushl  0x8(%ebp)
     668:	e8 04 fd ff ff       	call   371 <putc>
     66d:	83 c4 10             	add    $0x10,%esp
          s++;
     670:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     674:	8b 45 f4             	mov    -0xc(%ebp),%eax
     677:	0f b6 00             	movzbl (%eax),%eax
     67a:	84 c0                	test   %al,%al
     67c:	75 da                	jne    658 <printf+0xe3>
     67e:	e9 91 00 00 00       	jmp    714 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     683:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     687:	75 1d                	jne    6a6 <printf+0x131>
        putc(fd, *ap);
     689:	8b 45 e8             	mov    -0x18(%ebp),%eax
     68c:	8b 00                	mov    (%eax),%eax
     68e:	0f be c0             	movsbl %al,%eax
     691:	83 ec 08             	sub    $0x8,%esp
     694:	50                   	push   %eax
     695:	ff 75 08             	pushl  0x8(%ebp)
     698:	e8 d4 fc ff ff       	call   371 <putc>
     69d:	83 c4 10             	add    $0x10,%esp
        ap++;
     6a0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     6a4:	eb 6e                	jmp    714 <printf+0x19f>
      } else if(c == '%'){
     6a6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     6aa:	75 17                	jne    6c3 <printf+0x14e>
        putc(fd, c);
     6ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6af:	0f be c0             	movsbl %al,%eax
     6b2:	83 ec 08             	sub    $0x8,%esp
     6b5:	50                   	push   %eax
     6b6:	ff 75 08             	pushl  0x8(%ebp)
     6b9:	e8 b3 fc ff ff       	call   371 <putc>
     6be:	83 c4 10             	add    $0x10,%esp
     6c1:	eb 51                	jmp    714 <printf+0x19f>
      } else if(c == 'f'){ //for double
     6c3:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     6c7:	75 26                	jne    6ef <printf+0x17a>
        double *dap = (double*)ap;
     6c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6cc:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     6cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
     6d2:	dd 00                	fldl   (%eax)
     6d4:	83 ec 04             	sub    $0x4,%esp
     6d7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     6db:	dd 1c 24             	fstpl  (%esp)
     6de:	ff 75 08             	pushl  0x8(%ebp)
     6e1:	e8 9d fd ff ff       	call   483 <printdbl>
     6e6:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     6e9:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     6ed:	eb 25                	jmp    714 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     6ef:	83 ec 08             	sub    $0x8,%esp
     6f2:	6a 25                	push   $0x25
     6f4:	ff 75 08             	pushl  0x8(%ebp)
     6f7:	e8 75 fc ff ff       	call   371 <putc>
     6fc:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     6ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     702:	0f be c0             	movsbl %al,%eax
     705:	83 ec 08             	sub    $0x8,%esp
     708:	50                   	push   %eax
     709:	ff 75 08             	pushl  0x8(%ebp)
     70c:	e8 60 fc ff ff       	call   371 <putc>
     711:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     714:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     71b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     71f:	8b 55 0c             	mov    0xc(%ebp),%edx
     722:	8b 45 f0             	mov    -0x10(%ebp),%eax
     725:	01 d0                	add    %edx,%eax
     727:	0f b6 00             	movzbl (%eax),%eax
     72a:	84 c0                	test   %al,%al
     72c:	0f 85 65 fe ff ff    	jne    597 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     732:	90                   	nop
     733:	c9                   	leave  
     734:	c3                   	ret    

00000735 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     735:	55                   	push   %ebp
     736:	89 e5                	mov    %esp,%ebp
     738:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     73b:	8b 45 08             	mov    0x8(%ebp),%eax
     73e:	83 e8 08             	sub    $0x8,%eax
     741:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     744:	a1 e8 43 00 00       	mov    0x43e8,%eax
     749:	89 45 fc             	mov    %eax,-0x4(%ebp)
     74c:	eb 24                	jmp    772 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     74e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     751:	8b 00                	mov    (%eax),%eax
     753:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     756:	77 12                	ja     76a <free+0x35>
     758:	8b 45 f8             	mov    -0x8(%ebp),%eax
     75b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     75e:	77 24                	ja     784 <free+0x4f>
     760:	8b 45 fc             	mov    -0x4(%ebp),%eax
     763:	8b 00                	mov    (%eax),%eax
     765:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     768:	77 1a                	ja     784 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     76a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     76d:	8b 00                	mov    (%eax),%eax
     76f:	89 45 fc             	mov    %eax,-0x4(%ebp)
     772:	8b 45 f8             	mov    -0x8(%ebp),%eax
     775:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     778:	76 d4                	jbe    74e <free+0x19>
     77a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     77d:	8b 00                	mov    (%eax),%eax
     77f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     782:	76 ca                	jbe    74e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     784:	8b 45 f8             	mov    -0x8(%ebp),%eax
     787:	8b 40 04             	mov    0x4(%eax),%eax
     78a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     791:	8b 45 f8             	mov    -0x8(%ebp),%eax
     794:	01 c2                	add    %eax,%edx
     796:	8b 45 fc             	mov    -0x4(%ebp),%eax
     799:	8b 00                	mov    (%eax),%eax
     79b:	39 c2                	cmp    %eax,%edx
     79d:	75 24                	jne    7c3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     79f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7a2:	8b 50 04             	mov    0x4(%eax),%edx
     7a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7a8:	8b 00                	mov    (%eax),%eax
     7aa:	8b 40 04             	mov    0x4(%eax),%eax
     7ad:	01 c2                	add    %eax,%edx
     7af:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7b2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     7b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7b8:	8b 00                	mov    (%eax),%eax
     7ba:	8b 10                	mov    (%eax),%edx
     7bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7bf:	89 10                	mov    %edx,(%eax)
     7c1:	eb 0a                	jmp    7cd <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     7c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7c6:	8b 10                	mov    (%eax),%edx
     7c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7cb:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     7cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7d0:	8b 40 04             	mov    0x4(%eax),%eax
     7d3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     7da:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7dd:	01 d0                	add    %edx,%eax
     7df:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     7e2:	75 20                	jne    804 <free+0xcf>
    p->s.size += bp->s.size;
     7e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7e7:	8b 50 04             	mov    0x4(%eax),%edx
     7ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7ed:	8b 40 04             	mov    0x4(%eax),%eax
     7f0:	01 c2                	add    %eax,%edx
     7f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7f5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     7f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7fb:	8b 10                	mov    (%eax),%edx
     7fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     800:	89 10                	mov    %edx,(%eax)
     802:	eb 08                	jmp    80c <free+0xd7>
  } else
    p->s.ptr = bp;
     804:	8b 45 fc             	mov    -0x4(%ebp),%eax
     807:	8b 55 f8             	mov    -0x8(%ebp),%edx
     80a:	89 10                	mov    %edx,(%eax)
  freep = p;
     80c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     80f:	a3 e8 43 00 00       	mov    %eax,0x43e8
}
     814:	90                   	nop
     815:	c9                   	leave  
     816:	c3                   	ret    

00000817 <morecore>:

static Header*
morecore(uint nu)
{
     817:	55                   	push   %ebp
     818:	89 e5                	mov    %esp,%ebp
     81a:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     81d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     824:	77 07                	ja     82d <morecore+0x16>
    nu = 4096;
     826:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     82d:	8b 45 08             	mov    0x8(%ebp),%eax
     830:	c1 e0 03             	shl    $0x3,%eax
     833:	83 ec 0c             	sub    $0xc,%esp
     836:	50                   	push   %eax
     837:	e8 15 fb ff ff       	call   351 <sbrk>
     83c:	83 c4 10             	add    $0x10,%esp
     83f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     842:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     846:	75 07                	jne    84f <morecore+0x38>
    return 0;
     848:	b8 00 00 00 00       	mov    $0x0,%eax
     84d:	eb 26                	jmp    875 <morecore+0x5e>
  hp = (Header*)p;
     84f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     852:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     855:	8b 45 f0             	mov    -0x10(%ebp),%eax
     858:	8b 55 08             	mov    0x8(%ebp),%edx
     85b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     85e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     861:	83 c0 08             	add    $0x8,%eax
     864:	83 ec 0c             	sub    $0xc,%esp
     867:	50                   	push   %eax
     868:	e8 c8 fe ff ff       	call   735 <free>
     86d:	83 c4 10             	add    $0x10,%esp
  return freep;
     870:	a1 e8 43 00 00       	mov    0x43e8,%eax
}
     875:	c9                   	leave  
     876:	c3                   	ret    

00000877 <malloc>:

void*
malloc(uint nbytes)
{
     877:	55                   	push   %ebp
     878:	89 e5                	mov    %esp,%ebp
     87a:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     87d:	8b 45 08             	mov    0x8(%ebp),%eax
     880:	83 c0 07             	add    $0x7,%eax
     883:	c1 e8 03             	shr    $0x3,%eax
     886:	83 c0 01             	add    $0x1,%eax
     889:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     88c:	a1 e8 43 00 00       	mov    0x43e8,%eax
     891:	89 45 f0             	mov    %eax,-0x10(%ebp)
     894:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     898:	75 23                	jne    8bd <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     89a:	c7 45 f0 e0 43 00 00 	movl   $0x43e0,-0x10(%ebp)
     8a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8a4:	a3 e8 43 00 00       	mov    %eax,0x43e8
     8a9:	a1 e8 43 00 00       	mov    0x43e8,%eax
     8ae:	a3 e0 43 00 00       	mov    %eax,0x43e0
    base.s.size = 0;
     8b3:	c7 05 e4 43 00 00 00 	movl   $0x0,0x43e4
     8ba:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     8bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8c0:	8b 00                	mov    (%eax),%eax
     8c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     8c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8c8:	8b 40 04             	mov    0x4(%eax),%eax
     8cb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     8ce:	72 4d                	jb     91d <malloc+0xa6>
      if(p->s.size == nunits)
     8d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8d3:	8b 40 04             	mov    0x4(%eax),%eax
     8d6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     8d9:	75 0c                	jne    8e7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     8db:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8de:	8b 10                	mov    (%eax),%edx
     8e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8e3:	89 10                	mov    %edx,(%eax)
     8e5:	eb 26                	jmp    90d <malloc+0x96>
      else {
        p->s.size -= nunits;
     8e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8ea:	8b 40 04             	mov    0x4(%eax),%eax
     8ed:	2b 45 ec             	sub    -0x14(%ebp),%eax
     8f0:	89 c2                	mov    %eax,%edx
     8f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8f5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     8f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8fb:	8b 40 04             	mov    0x4(%eax),%eax
     8fe:	c1 e0 03             	shl    $0x3,%eax
     901:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     904:	8b 45 f4             	mov    -0xc(%ebp),%eax
     907:	8b 55 ec             	mov    -0x14(%ebp),%edx
     90a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     90d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     910:	a3 e8 43 00 00       	mov    %eax,0x43e8
      return (void*)(p + 1);
     915:	8b 45 f4             	mov    -0xc(%ebp),%eax
     918:	83 c0 08             	add    $0x8,%eax
     91b:	eb 3b                	jmp    958 <malloc+0xe1>
    }
    if(p == freep)
     91d:	a1 e8 43 00 00       	mov    0x43e8,%eax
     922:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     925:	75 1e                	jne    945 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     927:	83 ec 0c             	sub    $0xc,%esp
     92a:	ff 75 ec             	pushl  -0x14(%ebp)
     92d:	e8 e5 fe ff ff       	call   817 <morecore>
     932:	83 c4 10             	add    $0x10,%esp
     935:	89 45 f4             	mov    %eax,-0xc(%ebp)
     938:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     93c:	75 07                	jne    945 <malloc+0xce>
        return 0;
     93e:	b8 00 00 00 00       	mov    $0x0,%eax
     943:	eb 13                	jmp    958 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     945:	8b 45 f4             	mov    -0xc(%ebp),%eax
     948:	89 45 f0             	mov    %eax,-0x10(%ebp)
     94b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     94e:	8b 00                	mov    (%eax),%eax
     950:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     953:	e9 6d ff ff ff       	jmp    8c5 <malloc+0x4e>
}
     958:	c9                   	leave  
     959:	c3                   	ret    

0000095a <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     95a:	55                   	push   %ebp
     95b:	89 e5                	mov    %esp,%ebp
     95d:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     960:	83 ec 04             	sub    $0x4,%esp
     963:	ff 75 08             	pushl  0x8(%ebp)
     966:	68 98 36 00 00       	push   $0x3698
     96b:	6a 02                	push   $0x2
     96d:	e8 03 fc ff ff       	call   575 <printf>
     972:	83 c4 10             	add    $0x10,%esp
  exit();
     975:	e8 4f f9 ff ff       	call   2c9 <exit>

0000097a <getInteger>:
}

static int getInteger(double num)
{
     97a:	55                   	push   %ebp
     97b:	89 e5                	mov    %esp,%ebp
     97d:	83 ec 18             	sub    $0x18,%esp
     980:	8b 45 08             	mov    0x8(%ebp),%eax
     983:	89 45 e8             	mov    %eax,-0x18(%ebp)
     986:	8b 45 0c             	mov    0xc(%ebp),%eax
     989:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     98c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     993:	eb 0e                	jmp    9a3 <getInteger+0x29>
  {
    num -= 1;
     995:	dd 45 e8             	fldl   -0x18(%ebp)
     998:	d9 e8                	fld1   
     99a:	de e9                	fsubrp %st,%st(1)
     99c:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     99f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     9a3:	dd 45 e8             	fldl   -0x18(%ebp)
     9a6:	d9 e8                	fld1   
     9a8:	d9 c9                	fxch   %st(1)
     9aa:	df e9                	fucomip %st(1),%st
     9ac:	dd d8                	fstp   %st(0)
     9ae:	77 e5                	ja     995 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     9b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     9b3:	c9                   	leave  
     9b4:	c3                   	ret    

000009b5 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     9b5:	55                   	push   %ebp
     9b6:	89 e5                	mov    %esp,%ebp
     9b8:	53                   	push   %ebx
     9b9:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     9bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     9c3:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     9c7:	74 17                	je     9e0 <int2str+0x2b>
     9c9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     9cd:	79 11                	jns    9e0 <int2str+0x2b>
    neg = 1;
     9cf:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     9d6:	8b 45 0c             	mov    0xc(%ebp),%eax
     9d9:	f7 d8                	neg    %eax
     9db:	89 45 f0             	mov    %eax,-0x10(%ebp)
     9de:	eb 06                	jmp    9e6 <int2str+0x31>
  } else {
    x = num;
     9e0:	8b 45 0c             	mov    0xc(%ebp),%eax
     9e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     9e6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     9ed:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     9f0:	8d 41 01             	lea    0x1(%ecx),%eax
     9f3:	89 45 f8             	mov    %eax,-0x8(%ebp)
     9f6:	8b 5d 14             	mov    0x14(%ebp),%ebx
     9f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9fc:	ba 00 00 00 00       	mov    $0x0,%edx
     a01:	f7 f3                	div    %ebx
     a03:	89 d0                	mov    %edx,%eax
     a05:	0f b6 80 b4 42 00 00 	movzbl 0x42b4(%eax),%eax
     a0c:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     a10:	8b 5d 14             	mov    0x14(%ebp),%ebx
     a13:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a16:	ba 00 00 00 00       	mov    $0x0,%edx
     a1b:	f7 f3                	div    %ebx
     a1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
     a20:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a24:	75 c7                	jne    9ed <int2str+0x38>
  if(neg)
     a26:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     a2a:	74 36                	je     a62 <int2str+0xad>
    buf[i++] = '-';
     a2c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a2f:	8d 50 01             	lea    0x1(%eax),%edx
     a32:	89 55 f8             	mov    %edx,-0x8(%ebp)
     a35:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     a3a:	eb 26                	jmp    a62 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     a3c:	8b 45 10             	mov    0x10(%ebp),%eax
     a3f:	8b 00                	mov    (%eax),%eax
     a41:	89 c2                	mov    %eax,%edx
     a43:	8b 45 08             	mov    0x8(%ebp),%eax
     a46:	01 c2                	add    %eax,%edx
     a48:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     a4b:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a4e:	01 c8                	add    %ecx,%eax
     a50:	0f b6 00             	movzbl (%eax),%eax
     a53:	88 02                	mov    %al,(%edx)
    (*pos)++;
     a55:	8b 45 10             	mov    0x10(%ebp),%eax
     a58:	8b 00                	mov    (%eax),%eax
     a5a:	8d 50 01             	lea    0x1(%eax),%edx
     a5d:	8b 45 10             	mov    0x10(%ebp),%eax
     a60:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     a62:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     a66:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     a6a:	79 d0                	jns    a3c <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     a6c:	90                   	nop
     a6d:	83 c4 20             	add    $0x20,%esp
     a70:	5b                   	pop    %ebx
     a71:	5d                   	pop    %ebp
     a72:	c3                   	ret    

00000a73 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     a73:	55                   	push   %ebp
     a74:	89 e5                	mov    %esp,%ebp
     a76:	83 ec 18             	sub    $0x18,%esp
     a79:	8b 45 0c             	mov    0xc(%ebp),%eax
     a7c:	89 45 e8             	mov    %eax,-0x18(%ebp)
     a7f:	8b 45 10             	mov    0x10(%ebp),%eax
     a82:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     a85:	d9 ee                	fldz   
     a87:	dd 45 e8             	fldl   -0x18(%ebp)
     a8a:	d9 c9                	fxch   %st(1)
     a8c:	df e9                	fucomip %st(1),%st
     a8e:	dd d8                	fstp   %st(0)
     a90:	76 24                	jbe    ab6 <double2str+0x43>
  {
    buf[*pos] = '-';
     a92:	8b 45 14             	mov    0x14(%ebp),%eax
     a95:	8b 00                	mov    (%eax),%eax
     a97:	89 c2                	mov    %eax,%edx
     a99:	8b 45 08             	mov    0x8(%ebp),%eax
     a9c:	01 d0                	add    %edx,%eax
     a9e:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     aa1:	8b 45 14             	mov    0x14(%ebp),%eax
     aa4:	8b 00                	mov    (%eax),%eax
     aa6:	8d 50 01             	lea    0x1(%eax),%edx
     aa9:	8b 45 14             	mov    0x14(%ebp),%eax
     aac:	89 10                	mov    %edx,(%eax)
    num = -num;
     aae:	dd 45 e8             	fldl   -0x18(%ebp)
     ab1:	d9 e0                	fchs   
     ab3:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     ab6:	ff 75 ec             	pushl  -0x14(%ebp)
     ab9:	ff 75 e8             	pushl  -0x18(%ebp)
     abc:	e8 b9 fe ff ff       	call   97a <getInteger>
     ac1:	83 c4 08             	add    $0x8,%esp
     ac4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     ac7:	83 ec 04             	sub    $0x4,%esp
     aca:	6a 01                	push   $0x1
     acc:	6a 0a                	push   $0xa
     ace:	ff 75 14             	pushl  0x14(%ebp)
     ad1:	ff 75 f8             	pushl  -0x8(%ebp)
     ad4:	ff 75 08             	pushl  0x8(%ebp)
     ad7:	e8 d9 fe ff ff       	call   9b5 <int2str>
     adc:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     adf:	db 45 f8             	fildl  -0x8(%ebp)
     ae2:	dd 45 e8             	fldl   -0x18(%ebp)
     ae5:	de e1                	fsubp  %st,%st(1)
     ae7:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     aea:	dd 45 e8             	fldl   -0x18(%ebp)
     aed:	dd 05 a0 36 00 00    	fldl   0x36a0
     af3:	d9 c9                	fxch   %st(1)
     af5:	df e9                	fucomip %st(1),%st
     af7:	dd d8                	fstp   %st(0)
     af9:	76 1c                	jbe    b17 <double2str+0xa4>
  {
    buf[*pos] = '.';
     afb:	8b 45 14             	mov    0x14(%ebp),%eax
     afe:	8b 00                	mov    (%eax),%eax
     b00:	89 c2                	mov    %eax,%edx
     b02:	8b 45 08             	mov    0x8(%ebp),%eax
     b05:	01 d0                	add    %edx,%eax
     b07:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     b0a:	8b 45 14             	mov    0x14(%ebp),%eax
     b0d:	8b 00                	mov    (%eax),%eax
     b0f:	8d 50 01             	lea    0x1(%eax),%edx
     b12:	8b 45 14             	mov    0x14(%ebp),%eax
     b15:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     b17:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     b1e:	eb 4c                	jmp    b6c <double2str+0xf9>
  {
    num = num*10;
     b20:	dd 45 e8             	fldl   -0x18(%ebp)
     b23:	dd 05 a8 36 00 00    	fldl   0x36a8
     b29:	de c9                	fmulp  %st,%st(1)
     b2b:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     b2e:	ff 75 ec             	pushl  -0x14(%ebp)
     b31:	ff 75 e8             	pushl  -0x18(%ebp)
     b34:	e8 41 fe ff ff       	call   97a <getInteger>
     b39:	83 c4 08             	add    $0x8,%esp
     b3c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     b3f:	83 ec 04             	sub    $0x4,%esp
     b42:	6a 01                	push   $0x1
     b44:	6a 0a                	push   $0xa
     b46:	ff 75 14             	pushl  0x14(%ebp)
     b49:	ff 75 f8             	pushl  -0x8(%ebp)
     b4c:	ff 75 08             	pushl  0x8(%ebp)
     b4f:	e8 61 fe ff ff       	call   9b5 <int2str>
     b54:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     b57:	db 45 f8             	fildl  -0x8(%ebp)
     b5a:	dd 45 e8             	fldl   -0x18(%ebp)
     b5d:	de e1                	fsubp  %st,%st(1)
     b5f:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     b62:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     b66:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     b6a:	7f 13                	jg     b7f <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     b6c:	dd 45 e8             	fldl   -0x18(%ebp)
     b6f:	dd 05 a0 36 00 00    	fldl   0x36a0
     b75:	d9 c9                	fxch   %st(1)
     b77:	df e9                	fucomip %st(1),%st
     b79:	dd d8                	fstp   %st(0)
     b7b:	77 a3                	ja     b20 <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     b7d:	eb 01                	jmp    b80 <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     b7f:	90                   	nop
    }
  }
}
     b80:	90                   	nop
     b81:	c9                   	leave  
     b82:	c3                   	ret    

00000b83 <pow>:

double pow(double opnd, int power)
{
     b83:	55                   	push   %ebp
     b84:	89 e5                	mov    %esp,%ebp
     b86:	83 ec 18             	sub    $0x18,%esp
     b89:	8b 45 08             	mov    0x8(%ebp),%eax
     b8c:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b8f:	8b 45 0c             	mov    0xc(%ebp),%eax
     b92:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     b95:	d9 e8                	fld1   
     b97:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     b9a:	eb 0d                	jmp    ba9 <pow+0x26>
  {
    result *= opnd;
     b9c:	dd 45 f8             	fldl   -0x8(%ebp)
     b9f:	dc 4d e8             	fmull  -0x18(%ebp)
     ba2:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     ba5:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     ba9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     bad:	7f ed                	jg     b9c <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     baf:	dd 45 f8             	fldl   -0x8(%ebp)
}
     bb2:	c9                   	leave  
     bb3:	c3                   	ret    

00000bb4 <Translation>:

double Translation(char *s, int* pos)
{
     bb4:	55                   	push   %ebp
     bb5:	89 e5                	mov    %esp,%ebp
     bb7:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     bba:	d9 ee                	fldz   
     bbc:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     bbf:	d9 ee                	fldz   
     bc1:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     bc4:	eb 3e                	jmp    c04 <Translation+0x50>
    {
        integer *= 10;
     bc6:	dd 45 f8             	fldl   -0x8(%ebp)
     bc9:	dd 05 a8 36 00 00    	fldl   0x36a8
     bcf:	de c9                	fmulp  %st,%st(1)
     bd1:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     bd4:	8b 45 0c             	mov    0xc(%ebp),%eax
     bd7:	8b 00                	mov    (%eax),%eax
     bd9:	89 c2                	mov    %eax,%edx
     bdb:	8b 45 08             	mov    0x8(%ebp),%eax
     bde:	01 d0                	add    %edx,%eax
     be0:	0f b6 00             	movzbl (%eax),%eax
     be3:	0f be c0             	movsbl %al,%eax
     be6:	83 e8 30             	sub    $0x30,%eax
     be9:	89 45 dc             	mov    %eax,-0x24(%ebp)
     bec:	db 45 dc             	fildl  -0x24(%ebp)
     bef:	dd 45 f8             	fldl   -0x8(%ebp)
     bf2:	de c1                	faddp  %st,%st(1)
     bf4:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     bf7:	8b 45 0c             	mov    0xc(%ebp),%eax
     bfa:	8b 00                	mov    (%eax),%eax
     bfc:	8d 50 01             	lea    0x1(%eax),%edx
     bff:	8b 45 0c             	mov    0xc(%ebp),%eax
     c02:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c04:	8b 45 0c             	mov    0xc(%ebp),%eax
     c07:	8b 00                	mov    (%eax),%eax
     c09:	89 c2                	mov    %eax,%edx
     c0b:	8b 45 08             	mov    0x8(%ebp),%eax
     c0e:	01 d0                	add    %edx,%eax
     c10:	0f b6 00             	movzbl (%eax),%eax
     c13:	3c 2f                	cmp    $0x2f,%al
     c15:	7e 13                	jle    c2a <Translation+0x76>
     c17:	8b 45 0c             	mov    0xc(%ebp),%eax
     c1a:	8b 00                	mov    (%eax),%eax
     c1c:	89 c2                	mov    %eax,%edx
     c1e:	8b 45 08             	mov    0x8(%ebp),%eax
     c21:	01 d0                	add    %edx,%eax
     c23:	0f b6 00             	movzbl (%eax),%eax
     c26:	3c 39                	cmp    $0x39,%al
     c28:	7e 9c                	jle    bc6 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     c2a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c2d:	8b 00                	mov    (%eax),%eax
     c2f:	89 c2                	mov    %eax,%edx
     c31:	8b 45 08             	mov    0x8(%ebp),%eax
     c34:	01 d0                	add    %edx,%eax
     c36:	0f b6 00             	movzbl (%eax),%eax
     c39:	3c 2e                	cmp    $0x2e,%al
     c3b:	0f 85 9b 00 00 00    	jne    cdc <Translation+0x128>
    {
        (*pos)++;
     c41:	8b 45 0c             	mov    0xc(%ebp),%eax
     c44:	8b 00                	mov    (%eax),%eax
     c46:	8d 50 01             	lea    0x1(%eax),%edx
     c49:	8b 45 0c             	mov    0xc(%ebp),%eax
     c4c:	89 10                	mov    %edx,(%eax)
        int c = 1;
     c4e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c55:	eb 5b                	jmp    cb2 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     c57:	8b 45 0c             	mov    0xc(%ebp),%eax
     c5a:	8b 00                	mov    (%eax),%eax
     c5c:	89 c2                	mov    %eax,%edx
     c5e:	8b 45 08             	mov    0x8(%ebp),%eax
     c61:	01 d0                	add    %edx,%eax
     c63:	0f b6 00             	movzbl (%eax),%eax
     c66:	0f be c0             	movsbl %al,%eax
     c69:	83 e8 30             	sub    $0x30,%eax
     c6c:	89 45 dc             	mov    %eax,-0x24(%ebp)
     c6f:	db 45 dc             	fildl  -0x24(%ebp)
     c72:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     c75:	83 ec 04             	sub    $0x4,%esp
     c78:	ff 75 ec             	pushl  -0x14(%ebp)
     c7b:	dd 05 b0 36 00 00    	fldl   0x36b0
     c81:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     c85:	dd 1c 24             	fstpl  (%esp)
     c88:	e8 f6 fe ff ff       	call   b83 <pow>
     c8d:	83 c4 10             	add    $0x10,%esp
     c90:	dd 45 e0             	fldl   -0x20(%ebp)
     c93:	de c9                	fmulp  %st,%st(1)
     c95:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     c98:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     c9c:	dd 45 f0             	fldl   -0x10(%ebp)
     c9f:	dc 45 e0             	faddl  -0x20(%ebp)
     ca2:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     ca5:	8b 45 0c             	mov    0xc(%ebp),%eax
     ca8:	8b 00                	mov    (%eax),%eax
     caa:	8d 50 01             	lea    0x1(%eax),%edx
     cad:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb0:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     cb2:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb5:	8b 00                	mov    (%eax),%eax
     cb7:	89 c2                	mov    %eax,%edx
     cb9:	8b 45 08             	mov    0x8(%ebp),%eax
     cbc:	01 d0                	add    %edx,%eax
     cbe:	0f b6 00             	movzbl (%eax),%eax
     cc1:	3c 2f                	cmp    $0x2f,%al
     cc3:	7e 17                	jle    cdc <Translation+0x128>
     cc5:	8b 45 0c             	mov    0xc(%ebp),%eax
     cc8:	8b 00                	mov    (%eax),%eax
     cca:	89 c2                	mov    %eax,%edx
     ccc:	8b 45 08             	mov    0x8(%ebp),%eax
     ccf:	01 d0                	add    %edx,%eax
     cd1:	0f b6 00             	movzbl (%eax),%eax
     cd4:	3c 39                	cmp    $0x39,%al
     cd6:	0f 8e 7b ff ff ff    	jle    c57 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     cdc:	dd 45 f8             	fldl   -0x8(%ebp)
     cdf:	dc 45 f0             	faddl  -0x10(%ebp)
     ce2:	c9                   	leave  
     ce3:	c3                   	ret    

00000ce4 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     ce4:	55                   	push   %ebp
     ce5:	89 e5                	mov    %esp,%ebp
     ce7:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     cea:	e8 d2 f5 ff ff       	call   2c1 <fork>
     cef:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     cf5:	c9                   	leave  
     cf6:	c3                   	ret    

00000cf7 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     cf7:	55                   	push   %ebp
     cf8:	89 e5                	mov    %esp,%ebp
     cfa:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     cfd:	83 ec 0c             	sub    $0xc,%esp
     d00:	6a 54                	push   $0x54
     d02:	e8 70 fb ff ff       	call   877 <malloc>
     d07:	83 c4 10             	add    $0x10,%esp
     d0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     d0d:	83 ec 04             	sub    $0x4,%esp
     d10:	6a 54                	push   $0x54
     d12:	6a 00                	push   $0x0
     d14:	ff 75 f4             	pushl  -0xc(%ebp)
     d17:	e8 12 f4 ff ff       	call   12e <memset>
     d1c:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     d1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d22:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     d28:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d2b:	c9                   	leave  
     d2c:	c3                   	ret    

00000d2d <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     d2d:	55                   	push   %ebp
     d2e:	89 e5                	mov    %esp,%ebp
     d30:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d33:	83 ec 0c             	sub    $0xc,%esp
     d36:	6a 18                	push   $0x18
     d38:	e8 3a fb ff ff       	call   877 <malloc>
     d3d:	83 c4 10             	add    $0x10,%esp
     d40:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     d43:	83 ec 04             	sub    $0x4,%esp
     d46:	6a 18                	push   $0x18
     d48:	6a 00                	push   $0x0
     d4a:	ff 75 f4             	pushl  -0xc(%ebp)
     d4d:	e8 dc f3 ff ff       	call   12e <memset>
     d52:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     d55:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d58:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     d5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d61:	8b 55 08             	mov    0x8(%ebp),%edx
     d64:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     d67:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d6a:	8b 55 0c             	mov    0xc(%ebp),%edx
     d6d:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     d70:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d73:	8b 55 10             	mov    0x10(%ebp),%edx
     d76:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     d79:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d7c:	8b 55 14             	mov    0x14(%ebp),%edx
     d7f:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     d82:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d85:	8b 55 18             	mov    0x18(%ebp),%edx
     d88:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     d8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d8e:	c9                   	leave  
     d8f:	c3                   	ret    

00000d90 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d96:	83 ec 0c             	sub    $0xc,%esp
     d99:	6a 0c                	push   $0xc
     d9b:	e8 d7 fa ff ff       	call   877 <malloc>
     da0:	83 c4 10             	add    $0x10,%esp
     da3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     da6:	83 ec 04             	sub    $0x4,%esp
     da9:	6a 0c                	push   $0xc
     dab:	6a 00                	push   $0x0
     dad:	ff 75 f4             	pushl  -0xc(%ebp)
     db0:	e8 79 f3 ff ff       	call   12e <memset>
     db5:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     db8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dbb:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     dc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dc4:	8b 55 08             	mov    0x8(%ebp),%edx
     dc7:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     dca:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dcd:	8b 55 0c             	mov    0xc(%ebp),%edx
     dd0:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     dd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     dd6:	c9                   	leave  
     dd7:	c3                   	ret    

00000dd8 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     dd8:	55                   	push   %ebp
     dd9:	89 e5                	mov    %esp,%ebp
     ddb:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     dde:	83 ec 0c             	sub    $0xc,%esp
     de1:	6a 0c                	push   $0xc
     de3:	e8 8f fa ff ff       	call   877 <malloc>
     de8:	83 c4 10             	add    $0x10,%esp
     deb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     dee:	83 ec 04             	sub    $0x4,%esp
     df1:	6a 0c                	push   $0xc
     df3:	6a 00                	push   $0x0
     df5:	ff 75 f4             	pushl  -0xc(%ebp)
     df8:	e8 31 f3 ff ff       	call   12e <memset>
     dfd:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     e00:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e03:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     e09:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e0c:	8b 55 08             	mov    0x8(%ebp),%edx
     e0f:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     e12:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e15:	8b 55 0c             	mov    0xc(%ebp),%edx
     e18:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     e1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e1e:	c9                   	leave  
     e1f:	c3                   	ret    

00000e20 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     e20:	55                   	push   %ebp
     e21:	89 e5                	mov    %esp,%ebp
     e23:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e26:	83 ec 0c             	sub    $0xc,%esp
     e29:	6a 08                	push   $0x8
     e2b:	e8 47 fa ff ff       	call   877 <malloc>
     e30:	83 c4 10             	add    $0x10,%esp
     e33:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e36:	83 ec 04             	sub    $0x4,%esp
     e39:	6a 08                	push   $0x8
     e3b:	6a 00                	push   $0x0
     e3d:	ff 75 f4             	pushl  -0xc(%ebp)
     e40:	e8 e9 f2 ff ff       	call   12e <memset>
     e45:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
     e48:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e4b:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     e51:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e54:	8b 55 08             	mov    0x8(%ebp),%edx
     e57:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     e5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e5d:	c9                   	leave  
     e5e:	c3                   	ret    

00000e5f <calcmd>:

struct cmd* calcmd(char *_line)
{
     e5f:	55                   	push   %ebp
     e60:	89 e5                	mov    %esp,%ebp
     e62:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e65:	83 ec 0c             	sub    $0xc,%esp
     e68:	6a 08                	push   $0x8
     e6a:	e8 08 fa ff ff       	call   877 <malloc>
     e6f:	83 c4 10             	add    $0x10,%esp
     e72:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e75:	83 ec 04             	sub    $0x4,%esp
     e78:	6a 08                	push   $0x8
     e7a:	6a 00                	push   $0x0
     e7c:	ff 75 f4             	pushl  -0xc(%ebp)
     e7f:	e8 aa f2 ff ff       	call   12e <memset>
     e84:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
     e87:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e8a:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
     e90:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e93:	8b 55 08             	mov    0x8(%ebp),%edx
     e96:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     e99:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e9c:	c9                   	leave  
     e9d:	c3                   	ret    

00000e9e <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
     e9e:	55                   	push   %ebp
     e9f:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
     ea1:	eb 0c                	jmp    eaf <mystrncmp+0x11>
    n--, p++, q++;
     ea3:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     ea7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     eab:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
     eaf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     eb3:	74 1a                	je     ecf <mystrncmp+0x31>
     eb5:	8b 45 08             	mov    0x8(%ebp),%eax
     eb8:	0f b6 00             	movzbl (%eax),%eax
     ebb:	84 c0                	test   %al,%al
     ebd:	74 10                	je     ecf <mystrncmp+0x31>
     ebf:	8b 45 08             	mov    0x8(%ebp),%eax
     ec2:	0f b6 10             	movzbl (%eax),%edx
     ec5:	8b 45 0c             	mov    0xc(%ebp),%eax
     ec8:	0f b6 00             	movzbl (%eax),%eax
     ecb:	38 c2                	cmp    %al,%dl
     ecd:	74 d4                	je     ea3 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
     ecf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     ed3:	75 07                	jne    edc <mystrncmp+0x3e>
    return 0;
     ed5:	b8 00 00 00 00       	mov    $0x0,%eax
     eda:	eb 16                	jmp    ef2 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
     edc:	8b 45 08             	mov    0x8(%ebp),%eax
     edf:	0f b6 00             	movzbl (%eax),%eax
     ee2:	0f b6 d0             	movzbl %al,%edx
     ee5:	8b 45 0c             	mov    0xc(%ebp),%eax
     ee8:	0f b6 00             	movzbl (%eax),%eax
     eeb:	0f b6 c0             	movzbl %al,%eax
     eee:	29 c2                	sub    %eax,%edx
     ef0:	89 d0                	mov    %edx,%eax
}
     ef2:	5d                   	pop    %ebp
     ef3:	c3                   	ret    

00000ef4 <mystrlen>:

static int mystrlen(const char *s)
{
     ef4:	55                   	push   %ebp
     ef5:	89 e5                	mov    %esp,%ebp
     ef7:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
     efa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     f01:	eb 04                	jmp    f07 <mystrlen+0x13>
     f03:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     f07:	8b 55 fc             	mov    -0x4(%ebp),%edx
     f0a:	8b 45 08             	mov    0x8(%ebp),%eax
     f0d:	01 d0                	add    %edx,%eax
     f0f:	0f b6 00             	movzbl (%eax),%eax
     f12:	84 c0                	test   %al,%al
     f14:	75 ed                	jne    f03 <mystrlen+0xf>
    ;
  return n;
     f16:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f19:	c9                   	leave  
     f1a:	c3                   	ret    

00000f1b <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
     f1b:	55                   	push   %ebp
     f1c:	89 e5                	mov    %esp,%ebp
     f1e:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
     f21:	8b 45 08             	mov    0x8(%ebp),%eax
     f24:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
     f27:	90                   	nop
     f28:	8b 45 10             	mov    0x10(%ebp),%eax
     f2b:	8d 50 ff             	lea    -0x1(%eax),%edx
     f2e:	89 55 10             	mov    %edx,0x10(%ebp)
     f31:	85 c0                	test   %eax,%eax
     f33:	7e 2c                	jle    f61 <mystrncpy+0x46>
     f35:	8b 45 08             	mov    0x8(%ebp),%eax
     f38:	8d 50 01             	lea    0x1(%eax),%edx
     f3b:	89 55 08             	mov    %edx,0x8(%ebp)
     f3e:	8b 55 0c             	mov    0xc(%ebp),%edx
     f41:	8d 4a 01             	lea    0x1(%edx),%ecx
     f44:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     f47:	0f b6 12             	movzbl (%edx),%edx
     f4a:	88 10                	mov    %dl,(%eax)
     f4c:	0f b6 00             	movzbl (%eax),%eax
     f4f:	84 c0                	test   %al,%al
     f51:	75 d5                	jne    f28 <mystrncpy+0xd>
    ;
  while(n-- > 0)
     f53:	eb 0c                	jmp    f61 <mystrncpy+0x46>
    *s++ = 0;
     f55:	8b 45 08             	mov    0x8(%ebp),%eax
     f58:	8d 50 01             	lea    0x1(%eax),%edx
     f5b:	89 55 08             	mov    %edx,0x8(%ebp)
     f5e:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
     f61:	8b 45 10             	mov    0x10(%ebp),%eax
     f64:	8d 50 ff             	lea    -0x1(%eax),%edx
     f67:	89 55 10             	mov    %edx,0x10(%ebp)
     f6a:	85 c0                	test   %eax,%eax
     f6c:	7f e7                	jg     f55 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
     f6e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f71:	c9                   	leave  
     f72:	c3                   	ret    

00000f73 <isEqual>:

int isEqual(double a, double b)
{
     f73:	55                   	push   %ebp
     f74:	89 e5                	mov    %esp,%ebp
     f76:	83 ec 10             	sub    $0x10,%esp
     f79:	8b 45 08             	mov    0x8(%ebp),%eax
     f7c:	89 45 f8             	mov    %eax,-0x8(%ebp)
     f7f:	8b 45 0c             	mov    0xc(%ebp),%eax
     f82:	89 45 fc             	mov    %eax,-0x4(%ebp)
     f85:	8b 45 10             	mov    0x10(%ebp),%eax
     f88:	89 45 f0             	mov    %eax,-0x10(%ebp)
     f8b:	8b 45 14             	mov    0x14(%ebp),%eax
     f8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
     f91:	dd 45 f8             	fldl   -0x8(%ebp)
     f94:	dc 65 f0             	fsubl  -0x10(%ebp)
     f97:	dd 05 80 38 00 00    	fldl   0x3880
     f9d:	df e9                	fucomip %st(1),%st
     f9f:	dd d8                	fstp   %st(0)
     fa1:	76 19                	jbe    fbc <isEqual+0x49>
     fa3:	dd 45 f0             	fldl   -0x10(%ebp)
     fa6:	dc 65 f8             	fsubl  -0x8(%ebp)
     fa9:	dd 05 80 38 00 00    	fldl   0x3880
     faf:	df e9                	fucomip %st(1),%st
     fb1:	dd d8                	fstp   %st(0)
     fb3:	76 07                	jbe    fbc <isEqual+0x49>
    return 1;
     fb5:	b8 01 00 00 00       	mov    $0x1,%eax
     fba:	eb 05                	jmp    fc1 <isEqual+0x4e>
  return 0;
     fbc:	b8 00 00 00 00       	mov    $0x0,%eax
}
     fc1:	c9                   	leave  
     fc2:	c3                   	ret    

00000fc3 <isCmdName>:

int isCmdName(const char* str)
{
     fc3:	55                   	push   %ebp
     fc4:	89 e5                	mov    %esp,%ebp
     fc6:	53                   	push   %ebx
     fc7:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
     fca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     fd1:	eb 71                	jmp    1044 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
     fd3:	8b 55 f4             	mov    -0xc(%ebp),%edx
     fd6:	89 d0                	mov    %edx,%eax
     fd8:	c1 e0 02             	shl    $0x2,%eax
     fdb:	01 d0                	add    %edx,%eax
     fdd:	01 c0                	add    %eax,%eax
     fdf:	05 e0 42 00 00       	add    $0x42e0,%eax
     fe4:	83 ec 0c             	sub    $0xc,%esp
     fe7:	50                   	push   %eax
     fe8:	e8 1a f1 ff ff       	call   107 <strlen>
     fed:	83 c4 10             	add    $0x10,%esp
     ff0:	89 c3                	mov    %eax,%ebx
     ff2:	83 ec 0c             	sub    $0xc,%esp
     ff5:	ff 75 08             	pushl  0x8(%ebp)
     ff8:	e8 f7 fe ff ff       	call   ef4 <mystrlen>
     ffd:	83 c4 10             	add    $0x10,%esp
    1000:	39 c3                	cmp    %eax,%ebx
    1002:	75 3c                	jne    1040 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    1004:	83 ec 0c             	sub    $0xc,%esp
    1007:	ff 75 08             	pushl  0x8(%ebp)
    100a:	e8 e5 fe ff ff       	call   ef4 <mystrlen>
    100f:	83 c4 10             	add    $0x10,%esp
    1012:	89 c1                	mov    %eax,%ecx
    1014:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1017:	89 d0                	mov    %edx,%eax
    1019:	c1 e0 02             	shl    $0x2,%eax
    101c:	01 d0                	add    %edx,%eax
    101e:	01 c0                	add    %eax,%eax
    1020:	05 e0 42 00 00       	add    $0x42e0,%eax
    1025:	83 ec 04             	sub    $0x4,%esp
    1028:	51                   	push   %ecx
    1029:	ff 75 08             	pushl  0x8(%ebp)
    102c:	50                   	push   %eax
    102d:	e8 6c fe ff ff       	call   e9e <mystrncmp>
    1032:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1035:	85 c0                	test   %eax,%eax
    1037:	75 07                	jne    1040 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    1039:	b8 01 00 00 00       	mov    $0x1,%eax
    103e:	eb 0f                	jmp    104f <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    1040:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1044:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1048:	7e 89                	jle    fd3 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    104a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    104f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1052:	c9                   	leave  
    1053:	c3                   	ret    

00001054 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    1054:	55                   	push   %ebp
    1055:	89 e5                	mov    %esp,%ebp
    1057:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    105d:	83 ec 08             	sub    $0x8,%esp
    1060:	6a 00                	push   $0x0
    1062:	68 a8 43 00 00       	push   $0x43a8
    1067:	e8 9d f2 ff ff       	call   309 <open>
    106c:	83 c4 10             	add    $0x10,%esp
    106f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1072:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1076:	79 0a                	jns    1082 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    1078:	b8 00 00 00 00       	mov    $0x0,%eax
    107d:	e9 9a 01 00 00       	jmp    121c <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    1082:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    1089:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1090:	e9 ee 00 00 00       	jmp    1183 <findAlias+0x12f>
  {
      int isSame = 1;
    1095:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    109c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    10a3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    10aa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    10b1:	83 ec 0c             	sub    $0xc,%esp
    10b4:	8d 45 9a             	lea    -0x66(%ebp),%eax
    10b7:	50                   	push   %eax
    10b8:	e8 4a f0 ff ff       	call   107 <strlen>
    10bd:	83 c4 10             	add    $0x10,%esp
    10c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    10c3:	83 ec 0c             	sub    $0xc,%esp
    10c6:	ff 75 08             	pushl  0x8(%ebp)
    10c9:	e8 39 f0 ff ff       	call   107 <strlen>
    10ce:	83 c4 10             	add    $0x10,%esp
    10d1:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    10d4:	8d 55 9a             	lea    -0x66(%ebp),%edx
    10d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10da:	01 d0                	add    %edx,%eax
    10dc:	0f b6 00             	movzbl (%eax),%eax
    10df:	3c 21                	cmp    $0x21,%al
    10e1:	75 38                	jne    111b <findAlias+0xc7>
      {
          startIndex++;
    10e3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    10e7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    10ee:	eb 2b                	jmp    111b <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    10f0:	8d 55 9a             	lea    -0x66(%ebp),%edx
    10f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10f6:	01 d0                	add    %edx,%eax
    10f8:	0f b6 10             	movzbl (%eax),%edx
    10fb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    10fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1101:	01 c8                	add    %ecx,%eax
    1103:	0f b6 00             	movzbl (%eax),%eax
    1106:	38 c2                	cmp    %al,%dl
    1108:	74 09                	je     1113 <findAlias+0xbf>
          {
              isSame = 0;
    110a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    1111:	eb 1f                	jmp    1132 <findAlias+0xde>
          }
          startIndex++;
    1113:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    1117:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    111b:	8d 55 9a             	lea    -0x66(%ebp),%edx
    111e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1121:	01 d0                	add    %edx,%eax
    1123:	0f b6 00             	movzbl (%eax),%eax
    1126:	3c 3d                	cmp    $0x3d,%al
    1128:	74 08                	je     1132 <findAlias+0xde>
    112a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    112d:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1130:	7c be                	jl     10f0 <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    1132:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1135:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1138:	01 d0                	add    %edx,%eax
    113a:	0f b6 00             	movzbl (%eax),%eax
    113d:	3c 3d                	cmp    $0x3d,%al
    113f:	75 08                	jne    1149 <findAlias+0xf5>
    1141:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1144:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1147:	7d 07                	jge    1150 <findAlias+0xfc>
      {
          isSame = 0;
    1149:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    1150:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    1154:	75 0b                	jne    1161 <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    1156:	b8 01 00 00 00       	mov    $0x1,%eax
    115b:	2b 45 f0             	sub    -0x10(%ebp),%eax
    115e:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    1161:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1165:	75 1c                	jne    1183 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    1167:	83 ec 08             	sub    $0x8,%esp
    116a:	8d 45 9a             	lea    -0x66(%ebp),%eax
    116d:	50                   	push   %eax
    116e:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1174:	50                   	push   %eax
    1175:	e8 1e ef ff ff       	call   98 <strcpy>
    117a:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    117d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1180:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1183:	83 ec 04             	sub    $0x4,%esp
    1186:	6a 32                	push   $0x32
    1188:	8d 45 9a             	lea    -0x66(%ebp),%eax
    118b:	50                   	push   %eax
    118c:	ff 75 dc             	pushl  -0x24(%ebp)
    118f:	e8 4d f1 ff ff       	call   2e1 <read>
    1194:	83 c4 10             	add    $0x10,%esp
    1197:	89 45 d8             	mov    %eax,-0x28(%ebp)
    119a:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    119e:	0f 8f f1 fe ff ff    	jg     1095 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    11a4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11a8:	75 5f                	jne    1209 <findAlias+0x1b5>
  {
    int i = 0;
    11aa:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    11b1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    11b5:	eb 20                	jmp    11d7 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    11b7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    11ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    11bd:	01 c2                	add    %eax,%edx
    11bf:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    11c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11c8:	01 c8                	add    %ecx,%eax
    11ca:	0f b6 00             	movzbl (%eax),%eax
    11cd:	88 02                	mov    %al,(%edx)
      i++;
    11cf:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    11d3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    11d7:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    11dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11e0:	01 d0                	add    %edx,%eax
    11e2:	0f b6 00             	movzbl (%eax),%eax
    11e5:	84 c0                	test   %al,%al
    11e7:	75 ce                	jne    11b7 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    11e9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    11ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ef:	01 d0                	add    %edx,%eax
    11f1:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    11f4:	83 ec 0c             	sub    $0xc,%esp
    11f7:	ff 75 dc             	pushl  -0x24(%ebp)
    11fa:	e8 f2 f0 ff ff       	call   2f1 <close>
    11ff:	83 c4 10             	add    $0x10,%esp
    return 1;
    1202:	b8 01 00 00 00       	mov    $0x1,%eax
    1207:	eb 13                	jmp    121c <findAlias+0x1c8>
  }
  close(fd);
    1209:	83 ec 0c             	sub    $0xc,%esp
    120c:	ff 75 dc             	pushl  -0x24(%ebp)
    120f:	e8 dd f0 ff ff       	call   2f1 <close>
    1214:	83 c4 10             	add    $0x10,%esp
  return 0;
    1217:	b8 00 00 00 00       	mov    $0x0,%eax
}
    121c:	c9                   	leave  
    121d:	c3                   	ret    

0000121e <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    121e:	55                   	push   %ebp
    121f:	89 e5                	mov    %esp,%ebp
    1221:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1224:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1228:	75 05                	jne    122f <runcmd+0x11>
    exit();
    122a:	e8 9a f0 ff ff       	call   2c9 <exit>
  
  switch(cmd->type){
    122f:	8b 45 08             	mov    0x8(%ebp),%eax
    1232:	8b 00                	mov    (%eax),%eax
    1234:	83 f8 05             	cmp    $0x5,%eax
    1237:	77 09                	ja     1242 <runcmd+0x24>
    1239:	8b 04 85 e4 36 00 00 	mov    0x36e4(,%eax,4),%eax
    1240:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    1242:	83 ec 0c             	sub    $0xc,%esp
    1245:	68 b8 36 00 00       	push   $0x36b8
    124a:	e8 0b f7 ff ff       	call   95a <panic1>
    124f:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    1252:	8b 45 08             	mov    0x8(%ebp),%eax
    1255:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    1258:	8b 45 f4             	mov    -0xc(%ebp),%eax
    125b:	8b 40 04             	mov    0x4(%eax),%eax
    125e:	85 c0                	test   %eax,%eax
    1260:	75 05                	jne    1267 <runcmd+0x49>
      exit();
    1262:	e8 62 f0 ff ff       	call   2c9 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    1267:	8b 45 f4             	mov    -0xc(%ebp),%eax
    126a:	8b 40 04             	mov    0x4(%eax),%eax
    126d:	83 ec 0c             	sub    $0xc,%esp
    1270:	50                   	push   %eax
    1271:	e8 4d fd ff ff       	call   fc3 <isCmdName>
    1276:	83 c4 10             	add    $0x10,%esp
    1279:	85 c0                	test   %eax,%eax
    127b:	75 37                	jne    12b4 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    127d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1280:	8b 40 04             	mov    0x4(%eax),%eax
    1283:	83 ec 08             	sub    $0x8,%esp
    1286:	8d 55 ce             	lea    -0x32(%ebp),%edx
    1289:	52                   	push   %edx
    128a:	50                   	push   %eax
    128b:	e8 c4 fd ff ff       	call   1054 <findAlias>
    1290:	83 c4 10             	add    $0x10,%esp
    1293:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    1296:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    129a:	75 31                	jne    12cd <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    129c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    129f:	83 c0 04             	add    $0x4,%eax
    12a2:	83 ec 08             	sub    $0x8,%esp
    12a5:	50                   	push   %eax
    12a6:	8d 45 ce             	lea    -0x32(%ebp),%eax
    12a9:	50                   	push   %eax
    12aa:	e8 52 f0 ff ff       	call   301 <exec>
    12af:	83 c4 10             	add    $0x10,%esp
    12b2:	eb 19                	jmp    12cd <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    12b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12b7:	8d 50 04             	lea    0x4(%eax),%edx
    12ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12bd:	8b 40 04             	mov    0x4(%eax),%eax
    12c0:	83 ec 08             	sub    $0x8,%esp
    12c3:	52                   	push   %edx
    12c4:	50                   	push   %eax
    12c5:	e8 37 f0 ff ff       	call   301 <exec>
    12ca:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    12cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12d0:	8b 40 04             	mov    0x4(%eax),%eax
    12d3:	83 ec 04             	sub    $0x4,%esp
    12d6:	50                   	push   %eax
    12d7:	68 bf 36 00 00       	push   $0x36bf
    12dc:	6a 02                	push   $0x2
    12de:	e8 92 f2 ff ff       	call   575 <printf>
    12e3:	83 c4 10             	add    $0x10,%esp
    break;
    12e6:	e9 c6 01 00 00       	jmp    14b1 <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    12eb:	8b 45 08             	mov    0x8(%ebp),%eax
    12ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    12f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12f4:	8b 40 14             	mov    0x14(%eax),%eax
    12f7:	83 ec 0c             	sub    $0xc,%esp
    12fa:	50                   	push   %eax
    12fb:	e8 f1 ef ff ff       	call   2f1 <close>
    1300:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    1303:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1306:	8b 50 10             	mov    0x10(%eax),%edx
    1309:	8b 45 ec             	mov    -0x14(%ebp),%eax
    130c:	8b 40 08             	mov    0x8(%eax),%eax
    130f:	83 ec 08             	sub    $0x8,%esp
    1312:	52                   	push   %edx
    1313:	50                   	push   %eax
    1314:	e8 f0 ef ff ff       	call   309 <open>
    1319:	83 c4 10             	add    $0x10,%esp
    131c:	85 c0                	test   %eax,%eax
    131e:	79 1e                	jns    133e <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    1320:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1323:	8b 40 08             	mov    0x8(%eax),%eax
    1326:	83 ec 04             	sub    $0x4,%esp
    1329:	50                   	push   %eax
    132a:	68 cf 36 00 00       	push   $0x36cf
    132f:	6a 02                	push   $0x2
    1331:	e8 3f f2 ff ff       	call   575 <printf>
    1336:	83 c4 10             	add    $0x10,%esp
      exit();
    1339:	e8 8b ef ff ff       	call   2c9 <exit>
    }
    runcmd(rcmd->cmd);
    133e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1341:	8b 40 04             	mov    0x4(%eax),%eax
    1344:	83 ec 0c             	sub    $0xc,%esp
    1347:	50                   	push   %eax
    1348:	e8 d1 fe ff ff       	call   121e <runcmd>
    134d:	83 c4 10             	add    $0x10,%esp
    break;
    1350:	e9 5c 01 00 00       	jmp    14b1 <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    1355:	8b 45 08             	mov    0x8(%ebp),%eax
    1358:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    135b:	e8 84 f9 ff ff       	call   ce4 <fork1>
    1360:	85 c0                	test   %eax,%eax
    1362:	75 12                	jne    1376 <runcmd+0x158>
      runcmd(lcmd->left);
    1364:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1367:	8b 40 04             	mov    0x4(%eax),%eax
    136a:	83 ec 0c             	sub    $0xc,%esp
    136d:	50                   	push   %eax
    136e:	e8 ab fe ff ff       	call   121e <runcmd>
    1373:	83 c4 10             	add    $0x10,%esp
    wait();
    1376:	e8 56 ef ff ff       	call   2d1 <wait>
    runcmd(lcmd->right);
    137b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    137e:	8b 40 08             	mov    0x8(%eax),%eax
    1381:	83 ec 0c             	sub    $0xc,%esp
    1384:	50                   	push   %eax
    1385:	e8 94 fe ff ff       	call   121e <runcmd>
    138a:	83 c4 10             	add    $0x10,%esp
    break;
    138d:	e9 1f 01 00 00       	jmp    14b1 <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    1392:	8b 45 08             	mov    0x8(%ebp),%eax
    1395:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    1398:	83 ec 0c             	sub    $0xc,%esp
    139b:	8d 45 d8             	lea    -0x28(%ebp),%eax
    139e:	50                   	push   %eax
    139f:	e8 35 ef ff ff       	call   2d9 <pipe>
    13a4:	83 c4 10             	add    $0x10,%esp
    13a7:	85 c0                	test   %eax,%eax
    13a9:	79 10                	jns    13bb <runcmd+0x19d>
      panic1("pipe");
    13ab:	83 ec 0c             	sub    $0xc,%esp
    13ae:	68 df 36 00 00       	push   $0x36df
    13b3:	e8 a2 f5 ff ff       	call   95a <panic1>
    13b8:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    13bb:	e8 24 f9 ff ff       	call   ce4 <fork1>
    13c0:	85 c0                	test   %eax,%eax
    13c2:	75 4c                	jne    1410 <runcmd+0x1f2>
      close(1);
    13c4:	83 ec 0c             	sub    $0xc,%esp
    13c7:	6a 01                	push   $0x1
    13c9:	e8 23 ef ff ff       	call   2f1 <close>
    13ce:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    13d1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    13d4:	83 ec 0c             	sub    $0xc,%esp
    13d7:	50                   	push   %eax
    13d8:	e8 64 ef ff ff       	call   341 <dup>
    13dd:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    13e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    13e3:	83 ec 0c             	sub    $0xc,%esp
    13e6:	50                   	push   %eax
    13e7:	e8 05 ef ff ff       	call   2f1 <close>
    13ec:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    13ef:	8b 45 dc             	mov    -0x24(%ebp),%eax
    13f2:	83 ec 0c             	sub    $0xc,%esp
    13f5:	50                   	push   %eax
    13f6:	e8 f6 ee ff ff       	call   2f1 <close>
    13fb:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    13fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1401:	8b 40 04             	mov    0x4(%eax),%eax
    1404:	83 ec 0c             	sub    $0xc,%esp
    1407:	50                   	push   %eax
    1408:	e8 11 fe ff ff       	call   121e <runcmd>
    140d:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    1410:	e8 cf f8 ff ff       	call   ce4 <fork1>
    1415:	85 c0                	test   %eax,%eax
    1417:	75 4c                	jne    1465 <runcmd+0x247>
      close(0);
    1419:	83 ec 0c             	sub    $0xc,%esp
    141c:	6a 00                	push   $0x0
    141e:	e8 ce ee ff ff       	call   2f1 <close>
    1423:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    1426:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1429:	83 ec 0c             	sub    $0xc,%esp
    142c:	50                   	push   %eax
    142d:	e8 0f ef ff ff       	call   341 <dup>
    1432:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1435:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1438:	83 ec 0c             	sub    $0xc,%esp
    143b:	50                   	push   %eax
    143c:	e8 b0 ee ff ff       	call   2f1 <close>
    1441:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    1444:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1447:	83 ec 0c             	sub    $0xc,%esp
    144a:	50                   	push   %eax
    144b:	e8 a1 ee ff ff       	call   2f1 <close>
    1450:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    1453:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1456:	8b 40 08             	mov    0x8(%eax),%eax
    1459:	83 ec 0c             	sub    $0xc,%esp
    145c:	50                   	push   %eax
    145d:	e8 bc fd ff ff       	call   121e <runcmd>
    1462:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    1465:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1468:	83 ec 0c             	sub    $0xc,%esp
    146b:	50                   	push   %eax
    146c:	e8 80 ee ff ff       	call   2f1 <close>
    1471:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    1474:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1477:	83 ec 0c             	sub    $0xc,%esp
    147a:	50                   	push   %eax
    147b:	e8 71 ee ff ff       	call   2f1 <close>
    1480:	83 c4 10             	add    $0x10,%esp
    wait();
    1483:	e8 49 ee ff ff       	call   2d1 <wait>
    wait();
    1488:	e8 44 ee ff ff       	call   2d1 <wait>
    break;
    148d:	eb 22                	jmp    14b1 <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    148f:	8b 45 08             	mov    0x8(%ebp),%eax
    1492:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    1495:	e8 4a f8 ff ff       	call   ce4 <fork1>
    149a:	85 c0                	test   %eax,%eax
    149c:	75 12                	jne    14b0 <runcmd+0x292>
      runcmd(bcmd->cmd);
    149e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    14a1:	8b 40 04             	mov    0x4(%eax),%eax
    14a4:	83 ec 0c             	sub    $0xc,%esp
    14a7:	50                   	push   %eax
    14a8:	e8 71 fd ff ff       	call   121e <runcmd>
    14ad:	83 c4 10             	add    $0x10,%esp
    break;
    14b0:	90                   	nop
  }
  exit();
    14b1:	e8 13 ee ff ff       	call   2c9 <exit>

000014b6 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    14b6:	55                   	push   %ebp
    14b7:	89 e5                	mov    %esp,%ebp
    14b9:	83 ec 04             	sub    $0x4,%esp
    14bc:	8b 45 08             	mov    0x8(%ebp),%eax
    14bf:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    14c2:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    14c6:	7e 0d                	jle    14d5 <isNameChar+0x1f>
    14c8:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    14cc:	7f 07                	jg     14d5 <isNameChar+0x1f>
    return 1;
    14ce:	b8 01 00 00 00       	mov    $0x1,%eax
    14d3:	eb 38                	jmp    150d <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    14d5:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    14d9:	7e 0d                	jle    14e8 <isNameChar+0x32>
    14db:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    14df:	7f 07                	jg     14e8 <isNameChar+0x32>
    return 1;
    14e1:	b8 01 00 00 00       	mov    $0x1,%eax
    14e6:	eb 25                	jmp    150d <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    14e8:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    14ec:	7e 0d                	jle    14fb <isNameChar+0x45>
    14ee:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    14f2:	7f 07                	jg     14fb <isNameChar+0x45>
    return 1;
    14f4:	b8 01 00 00 00       	mov    $0x1,%eax
    14f9:	eb 12                	jmp    150d <isNameChar+0x57>
  if(ch == '_')
    14fb:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    14ff:	75 07                	jne    1508 <isNameChar+0x52>
    return 1;
    1501:	b8 01 00 00 00       	mov    $0x1,%eax
    1506:	eb 05                	jmp    150d <isNameChar+0x57>
  return 0;
    1508:	b8 00 00 00 00       	mov    $0x0,%eax
}
    150d:	c9                   	leave  
    150e:	c3                   	ret    

0000150f <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    150f:	55                   	push   %ebp
    1510:	89 e5                	mov    %esp,%ebp
    1512:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    1515:	8b 45 08             	mov    0x8(%ebp),%eax
    1518:	8b 40 04             	mov    0x4(%eax),%eax
    151b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    151e:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    1525:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    152c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1533:	eb 1d                	jmp    1552 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    1535:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1538:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    153b:	01 d0                	add    %edx,%eax
    153d:	0f b6 00             	movzbl (%eax),%eax
    1540:	3c 3d                	cmp    $0x3d,%al
    1542:	75 0a                	jne    154e <runCalcmd+0x3f>
    {
      hasEqu++;
    1544:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    1548:	8b 45 ec             	mov    -0x14(%ebp),%eax
    154b:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    154e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1552:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1555:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1558:	01 d0                	add    %edx,%eax
    155a:	0f b6 00             	movzbl (%eax),%eax
    155d:	84 c0                	test   %al,%al
    155f:	75 d4                	jne    1535 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    1561:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1565:	7e 1d                	jle    1584 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    1567:	83 ec 0c             	sub    $0xc,%esp
    156a:	68 fc 36 00 00       	push   $0x36fc
    156f:	6a 00                	push   $0x0
    1571:	6a 00                	push   $0x0
    1573:	6a 01                	push   $0x1
    1575:	6a 04                	push   $0x4
    1577:	e8 21 17 00 00       	call   2c9d <color_printf>
    157c:	83 c4 20             	add    $0x20,%esp
    157f:	e9 78 05 00 00       	jmp    1afc <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    1584:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1588:	0f 85 26 05 00 00    	jne    1ab4 <runCalcmd+0x5a5>
  {
    int i=0;
    158e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    1595:	eb 04                	jmp    159b <runCalcmd+0x8c>
    {
      i++;
    1597:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    159b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    159e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15a1:	01 d0                	add    %edx,%eax
    15a3:	0f b6 00             	movzbl (%eax),%eax
    15a6:	3c 20                	cmp    $0x20,%al
    15a8:	74 ed                	je     1597 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    15aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15ad:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    15b0:	eb 23                	jmp    15d5 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    15b2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    15b5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15b8:	01 d0                	add    %edx,%eax
    15ba:	0f b6 00             	movzbl (%eax),%eax
    15bd:	0f be c0             	movsbl %al,%eax
    15c0:	83 ec 0c             	sub    $0xc,%esp
    15c3:	50                   	push   %eax
    15c4:	e8 ed fe ff ff       	call   14b6 <isNameChar>
    15c9:	83 c4 10             	add    $0x10,%esp
    15cc:	83 f8 01             	cmp    $0x1,%eax
    15cf:	75 0e                	jne    15df <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    15d1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    15d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15d8:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    15db:	7c d5                	jl     15b2 <runCalcmd+0xa3>
    15dd:	eb 01                	jmp    15e0 <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    15df:	90                   	nop
    }
    int len = i-startIndex;
    15e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15e3:	2b 45 d0             	sub    -0x30(%ebp),%eax
    15e6:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    15e9:	eb 04                	jmp    15ef <runCalcmd+0xe0>
    {
      i++;
    15eb:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    15ef:	8b 55 e8             	mov    -0x18(%ebp),%edx
    15f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15f5:	01 d0                	add    %edx,%eax
    15f7:	0f b6 00             	movzbl (%eax),%eax
    15fa:	3c 20                	cmp    $0x20,%al
    15fc:	74 ed                	je     15eb <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    15fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1601:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1604:	0f 85 90 04 00 00    	jne    1a9a <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    160a:	8b 55 d0             	mov    -0x30(%ebp),%edx
    160d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1610:	01 d0                	add    %edx,%eax
    1612:	0f b6 00             	movzbl (%eax),%eax
    1615:	3c 2f                	cmp    $0x2f,%al
    1617:	7e 2c                	jle    1645 <runCalcmd+0x136>
    1619:	8b 55 d0             	mov    -0x30(%ebp),%edx
    161c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    161f:	01 d0                	add    %edx,%eax
    1621:	0f b6 00             	movzbl (%eax),%eax
    1624:	3c 39                	cmp    $0x39,%al
    1626:	7f 1d                	jg     1645 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    1628:	83 ec 0c             	sub    $0xc,%esp
    162b:	68 18 37 00 00       	push   $0x3718
    1630:	6a 00                	push   $0x0
    1632:	6a 00                	push   $0x0
    1634:	6a 01                	push   $0x1
    1636:	6a 04                	push   $0x4
    1638:	e8 60 16 00 00       	call   2c9d <color_printf>
    163d:	83 c4 20             	add    $0x20,%esp
    1640:	e9 b7 04 00 00       	jmp    1afc <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1645:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    164c:	eb 20                	jmp    166e <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    164e:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1651:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1654:	01 d0                	add    %edx,%eax
    1656:	89 c2                	mov    %eax,%edx
    1658:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    165b:	01 d0                	add    %edx,%eax
    165d:	0f b6 00             	movzbl (%eax),%eax
    1660:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1663:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1666:	01 ca                	add    %ecx,%edx
    1668:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    166a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    166e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1671:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1674:	7c d8                	jl     164e <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1676:	8d 55 94             	lea    -0x6c(%ebp),%edx
    1679:	8b 45 cc             	mov    -0x34(%ebp),%eax
    167c:	01 d0                	add    %edx,%eax
    167e:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    1681:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1684:	83 c0 01             	add    $0x1,%eax
    1687:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    168a:	eb 04                	jmp    1690 <runCalcmd+0x181>
        {
          i++;
    168c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    1690:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1693:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1696:	01 d0                	add    %edx,%eax
    1698:	0f b6 00             	movzbl (%eax),%eax
    169b:	3c 20                	cmp    $0x20,%al
    169d:	74 ed                	je     168c <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    169f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16a2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16a5:	01 d0                	add    %edx,%eax
    16a7:	0f b6 00             	movzbl (%eax),%eax
    16aa:	3c 60                	cmp    $0x60,%al
    16ac:	0f 85 e6 01 00 00    	jne    1898 <runCalcmd+0x389>
        {
          i++;
    16b2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    16b6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    16b9:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    16bc:	eb 04                	jmp    16c2 <runCalcmd+0x1b3>
          {
            i++;
    16be:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    16c2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16c5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16c8:	01 d0                	add    %edx,%eax
    16ca:	0f b6 00             	movzbl (%eax),%eax
    16cd:	3c 60                	cmp    $0x60,%al
    16cf:	74 0f                	je     16e0 <runCalcmd+0x1d1>
    16d1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16d7:	01 d0                	add    %edx,%eax
    16d9:	0f b6 00             	movzbl (%eax),%eax
    16dc:	84 c0                	test   %al,%al
    16de:	75 de                	jne    16be <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    16e0:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16e6:	01 d0                	add    %edx,%eax
    16e8:	0f b6 00             	movzbl (%eax),%eax
    16eb:	3c 60                	cmp    $0x60,%al
    16ed:	0f 85 5c 01 00 00    	jne    184f <runCalcmd+0x340>
    16f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    16f6:	8d 50 01             	lea    0x1(%eax),%edx
    16f9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16fc:	01 d0                	add    %edx,%eax
    16fe:	0f b6 00             	movzbl (%eax),%eax
    1701:	84 c0                	test   %al,%al
    1703:	0f 85 46 01 00 00    	jne    184f <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    1709:	8b 55 e0             	mov    -0x20(%ebp),%edx
    170c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    170f:	01 d0                	add    %edx,%eax
    1711:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    1714:	8b 55 c8             	mov    -0x38(%ebp),%edx
    1717:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    171a:	01 d0                	add    %edx,%eax
    171c:	83 ec 0c             	sub    $0xc,%esp
    171f:	50                   	push   %eax
    1720:	e8 c5 04 00 00       	call   1bea <Compute>
    1725:	83 c4 10             	add    $0x10,%esp
    1728:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    172b:	dd 05 88 38 00 00    	fldl   0x3888
    1731:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1735:	dd 1c 24             	fstpl  (%esp)
    1738:	ff 75 c4             	pushl  -0x3c(%ebp)
    173b:	ff 75 c0             	pushl  -0x40(%ebp)
    173e:	e8 30 f8 ff ff       	call   f73 <isEqual>
    1743:	83 c4 10             	add    $0x10,%esp
    1746:	85 c0                	test   %eax,%eax
    1748:	0f 85 ad 03 00 00    	jne    1afb <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    174e:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1753:	85 c0                	test   %eax,%eax
    1755:	75 15                	jne    176c <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1757:	83 ec 08             	sub    $0x8,%esp
    175a:	68 ec 43 00 00       	push   $0x43ec
    175f:	68 20 44 00 00       	push   $0x4420
    1764:	e8 ba 19 00 00       	call   3123 <readVariables>
    1769:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    176c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1773:	eb 26                	jmp    179b <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1775:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1778:	c1 e0 05             	shl    $0x5,%eax
    177b:	05 20 44 00 00       	add    $0x4420,%eax
    1780:	8d 50 04             	lea    0x4(%eax),%edx
    1783:	83 ec 08             	sub    $0x8,%esp
    1786:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1789:	50                   	push   %eax
    178a:	52                   	push   %edx
    178b:	e8 38 e9 ff ff       	call   c8 <strcmp>
    1790:	83 c4 10             	add    $0x10,%esp
    1793:	85 c0                	test   %eax,%eax
    1795:	74 10                	je     17a7 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1797:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    179b:	a1 ec 43 00 00       	mov    0x43ec,%eax
    17a0:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    17a3:	7c d0                	jl     1775 <runCalcmd+0x266>
    17a5:	eb 01                	jmp    17a8 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    17a7:	90                   	nop
              }
              if(index == v_num) //new variable
    17a8:	a1 ec 43 00 00       	mov    0x43ec,%eax
    17ad:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    17b0:	75 3c                	jne    17ee <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    17b2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17b5:	c1 e0 05             	shl    $0x5,%eax
    17b8:	05 20 44 00 00       	add    $0x4420,%eax
    17bd:	8d 50 04             	lea    0x4(%eax),%edx
    17c0:	83 ec 08             	sub    $0x8,%esp
    17c3:	8d 45 94             	lea    -0x6c(%ebp),%eax
    17c6:	50                   	push   %eax
    17c7:	52                   	push   %edx
    17c8:	e8 cb e8 ff ff       	call   98 <strcpy>
    17cd:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    17d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17d3:	c1 e0 05             	shl    $0x5,%eax
    17d6:	05 20 44 00 00       	add    $0x4420,%eax
    17db:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    17e1:	a1 ec 43 00 00       	mov    0x43ec,%eax
    17e6:	83 c0 01             	add    $0x1,%eax
    17e9:	a3 ec 43 00 00       	mov    %eax,0x43ec
              }
              variables[index].value.dvalue = result;
    17ee:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17f1:	c1 e0 05             	shl    $0x5,%eax
    17f4:	05 30 44 00 00       	add    $0x4430,%eax
    17f9:	dd 45 c0             	fldl   -0x40(%ebp)
    17fc:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    17ff:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1802:	c1 e0 05             	shl    $0x5,%eax
    1805:	05 30 44 00 00       	add    $0x4430,%eax
    180a:	dd 40 08             	fldl   0x8(%eax)
    180d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1810:	c1 e0 05             	shl    $0x5,%eax
    1813:	05 20 44 00 00       	add    $0x4420,%eax
    1818:	83 c0 04             	add    $0x4,%eax
    181b:	83 ec 0c             	sub    $0xc,%esp
    181e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1822:	dd 1c 24             	fstpl  (%esp)
    1825:	50                   	push   %eax
    1826:	68 42 37 00 00       	push   $0x3742
    182b:	6a 01                	push   $0x1
    182d:	e8 43 ed ff ff       	call   575 <printf>
    1832:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1835:	83 ec 08             	sub    $0x8,%esp
    1838:	68 ec 43 00 00       	push   $0x43ec
    183d:	68 20 44 00 00       	push   $0x4420
    1842:	e8 90 1b 00 00       	call   33d7 <writeVariables>
    1847:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    184a:	e9 ac 02 00 00       	jmp    1afb <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    184f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1852:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1855:	01 d0                	add    %edx,%eax
    1857:	0f b6 00             	movzbl (%eax),%eax
    185a:	84 c0                	test   %al,%al
    185c:	75 1d                	jne    187b <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    185e:	83 ec 0c             	sub    $0xc,%esp
    1861:	68 49 37 00 00       	push   $0x3749
    1866:	6a 00                	push   $0x0
    1868:	6a 00                	push   $0x0
    186a:	6a 01                	push   $0x1
    186c:	6a 04                	push   $0x4
    186e:	e8 2a 14 00 00       	call   2c9d <color_printf>
    1873:	83 c4 20             	add    $0x20,%esp
    1876:	e9 81 02 00 00       	jmp    1afc <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    187b:	83 ec 0c             	sub    $0xc,%esp
    187e:	68 60 37 00 00       	push   $0x3760
    1883:	6a 00                	push   $0x0
    1885:	6a 00                	push   $0x0
    1887:	6a 01                	push   $0x1
    1889:	6a 04                	push   $0x4
    188b:	e8 0d 14 00 00       	call   2c9d <color_printf>
    1890:	83 c4 20             	add    $0x20,%esp
    1893:	e9 64 02 00 00       	jmp    1afc <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1898:	8b 55 e0             	mov    -0x20(%ebp),%edx
    189b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    189e:	01 d0                	add    %edx,%eax
    18a0:	0f b6 00             	movzbl (%eax),%eax
    18a3:	3c 22                	cmp    $0x22,%al
    18a5:	0f 85 d5 01 00 00    	jne    1a80 <runCalcmd+0x571>
        {
          i++;
    18ab:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    18af:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18b2:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    18b5:	eb 04                	jmp    18bb <runCalcmd+0x3ac>
          {
            i++;
    18b7:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    18bb:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18c1:	01 d0                	add    %edx,%eax
    18c3:	0f b6 00             	movzbl (%eax),%eax
    18c6:	3c 22                	cmp    $0x22,%al
    18c8:	74 0f                	je     18d9 <runCalcmd+0x3ca>
    18ca:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18cd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18d0:	01 d0                	add    %edx,%eax
    18d2:	0f b6 00             	movzbl (%eax),%eax
    18d5:	84 c0                	test   %al,%al
    18d7:	75 de                	jne    18b7 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    18d9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18dc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18df:	01 d0                	add    %edx,%eax
    18e1:	0f b6 00             	movzbl (%eax),%eax
    18e4:	3c 22                	cmp    $0x22,%al
    18e6:	0f 85 4e 01 00 00    	jne    1a3a <runCalcmd+0x52b>
    18ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18ef:	8d 50 01             	lea    0x1(%eax),%edx
    18f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18f5:	01 d0                	add    %edx,%eax
    18f7:	0f b6 00             	movzbl (%eax),%eax
    18fa:	84 c0                	test   %al,%al
    18fc:	0f 85 38 01 00 00    	jne    1a3a <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1902:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1907:	85 c0                	test   %eax,%eax
    1909:	75 15                	jne    1920 <runCalcmd+0x411>
              readVariables(variables,&v_num);
    190b:	83 ec 08             	sub    $0x8,%esp
    190e:	68 ec 43 00 00       	push   $0x43ec
    1913:	68 20 44 00 00       	push   $0x4420
    1918:	e8 06 18 00 00       	call   3123 <readVariables>
    191d:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1920:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1927:	eb 26                	jmp    194f <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    1929:	8b 45 d8             	mov    -0x28(%ebp),%eax
    192c:	c1 e0 05             	shl    $0x5,%eax
    192f:	05 20 44 00 00       	add    $0x4420,%eax
    1934:	8d 50 04             	lea    0x4(%eax),%edx
    1937:	83 ec 08             	sub    $0x8,%esp
    193a:	8d 45 94             	lea    -0x6c(%ebp),%eax
    193d:	50                   	push   %eax
    193e:	52                   	push   %edx
    193f:	e8 84 e7 ff ff       	call   c8 <strcmp>
    1944:	83 c4 10             	add    $0x10,%esp
    1947:	85 c0                	test   %eax,%eax
    1949:	74 10                	je     195b <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    194b:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    194f:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1954:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1957:	7c d0                	jl     1929 <runCalcmd+0x41a>
    1959:	eb 01                	jmp    195c <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    195b:	90                   	nop
            }
            if(index == v_num) //new variable
    195c:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1961:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1964:	75 2b                	jne    1991 <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1966:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1969:	c1 e0 05             	shl    $0x5,%eax
    196c:	05 20 44 00 00       	add    $0x4420,%eax
    1971:	8d 50 04             	lea    0x4(%eax),%edx
    1974:	83 ec 08             	sub    $0x8,%esp
    1977:	8d 45 94             	lea    -0x6c(%ebp),%eax
    197a:	50                   	push   %eax
    197b:	52                   	push   %edx
    197c:	e8 17 e7 ff ff       	call   98 <strcpy>
    1981:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1984:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1989:	83 c0 01             	add    $0x1,%eax
    198c:	a3 ec 43 00 00       	mov    %eax,0x43ec
            }
            variables[index].type = V_STRING;
    1991:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1994:	c1 e0 05             	shl    $0x5,%eax
    1997:	05 20 44 00 00       	add    $0x4420,%eax
    199c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    19a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    19a5:	2b 45 bc             	sub    -0x44(%ebp),%eax
    19a8:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    19ab:	8b 45 b8             	mov    -0x48(%ebp),%eax
    19ae:	83 c0 01             	add    $0x1,%eax
    19b1:	83 ec 0c             	sub    $0xc,%esp
    19b4:	50                   	push   %eax
    19b5:	e8 bd ee ff ff       	call   877 <malloc>
    19ba:	83 c4 10             	add    $0x10,%esp
    19bd:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    19c0:	8b 55 bc             	mov    -0x44(%ebp),%edx
    19c3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19c6:	01 d0                	add    %edx,%eax
    19c8:	83 ec 08             	sub    $0x8,%esp
    19cb:	50                   	push   %eax
    19cc:	ff 75 b4             	pushl  -0x4c(%ebp)
    19cf:	e8 c4 e6 ff ff       	call   98 <strcpy>
    19d4:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    19d7:	8b 55 b8             	mov    -0x48(%ebp),%edx
    19da:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    19dd:	01 d0                	add    %edx,%eax
    19df:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    19e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19e5:	c1 e0 05             	shl    $0x5,%eax
    19e8:	8d 90 38 44 00 00    	lea    0x4438(%eax),%edx
    19ee:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    19f1:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    19f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19f6:	c1 e0 05             	shl    $0x5,%eax
    19f9:	05 38 44 00 00       	add    $0x4438,%eax
    19fe:	8b 00                	mov    (%eax),%eax
    1a00:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1a03:	c1 e2 05             	shl    $0x5,%edx
    1a06:	81 c2 20 44 00 00    	add    $0x4420,%edx
    1a0c:	83 c2 04             	add    $0x4,%edx
    1a0f:	50                   	push   %eax
    1a10:	52                   	push   %edx
    1a11:	68 81 37 00 00       	push   $0x3781
    1a16:	6a 01                	push   $0x1
    1a18:	e8 58 eb ff ff       	call   575 <printf>
    1a1d:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1a20:	83 ec 08             	sub    $0x8,%esp
    1a23:	68 ec 43 00 00       	push   $0x43ec
    1a28:	68 20 44 00 00       	push   $0x4420
    1a2d:	e8 a5 19 00 00       	call   33d7 <writeVariables>
    1a32:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1a35:	e9 c2 00 00 00       	jmp    1afc <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1a3a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a3d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a40:	01 d0                	add    %edx,%eax
    1a42:	0f b6 00             	movzbl (%eax),%eax
    1a45:	84 c0                	test   %al,%al
    1a47:	75 1d                	jne    1a66 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1a49:	83 ec 0c             	sub    $0xc,%esp
    1a4c:	68 8a 37 00 00       	push   $0x378a
    1a51:	6a 00                	push   $0x0
    1a53:	6a 00                	push   $0x0
    1a55:	6a 01                	push   $0x1
    1a57:	6a 04                	push   $0x4
    1a59:	e8 3f 12 00 00       	call   2c9d <color_printf>
    1a5e:	83 c4 20             	add    $0x20,%esp
    1a61:	e9 96 00 00 00       	jmp    1afc <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1a66:	83 ec 0c             	sub    $0xc,%esp
    1a69:	68 a0 37 00 00       	push   $0x37a0
    1a6e:	6a 00                	push   $0x0
    1a70:	6a 00                	push   $0x0
    1a72:	6a 01                	push   $0x1
    1a74:	6a 04                	push   $0x4
    1a76:	e8 22 12 00 00       	call   2c9d <color_printf>
    1a7b:	83 c4 20             	add    $0x20,%esp
    1a7e:	eb 7c                	jmp    1afc <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1a80:	83 ec 0c             	sub    $0xc,%esp
    1a83:	68 c1 37 00 00       	push   $0x37c1
    1a88:	6a 00                	push   $0x0
    1a8a:	6a 00                	push   $0x0
    1a8c:	6a 01                	push   $0x1
    1a8e:	6a 04                	push   $0x4
    1a90:	e8 08 12 00 00       	call   2c9d <color_printf>
    1a95:	83 c4 20             	add    $0x20,%esp
    1a98:	eb 62                	jmp    1afc <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1a9a:	83 ec 0c             	sub    $0xc,%esp
    1a9d:	68 c1 37 00 00       	push   $0x37c1
    1aa2:	6a 00                	push   $0x0
    1aa4:	6a 00                	push   $0x0
    1aa6:	6a 01                	push   $0x1
    1aa8:	6a 04                	push   $0x4
    1aaa:	e8 ee 11 00 00       	call   2c9d <color_printf>
    1aaf:	83 c4 20             	add    $0x20,%esp
    1ab2:	eb 48                	jmp    1afc <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1ab4:	83 ec 0c             	sub    $0xc,%esp
    1ab7:	ff 75 d4             	pushl  -0x2c(%ebp)
    1aba:	e8 2b 01 00 00       	call   1bea <Compute>
    1abf:	83 c4 10             	add    $0x10,%esp
    1ac2:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1ac5:	dd 05 88 38 00 00    	fldl   0x3888
    1acb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1acf:	dd 1c 24             	fstpl  (%esp)
    1ad2:	ff 75 ac             	pushl  -0x54(%ebp)
    1ad5:	ff 75 a8             	pushl  -0x58(%ebp)
    1ad8:	e8 96 f4 ff ff       	call   f73 <isEqual>
    1add:	83 c4 10             	add    $0x10,%esp
    1ae0:	85 c0                	test   %eax,%eax
    1ae2:	75 18                	jne    1afc <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1ae4:	ff 75 ac             	pushl  -0x54(%ebp)
    1ae7:	ff 75 a8             	pushl  -0x58(%ebp)
    1aea:	68 d9 37 00 00       	push   $0x37d9
    1aef:	6a 01                	push   $0x1
    1af1:	e8 7f ea ff ff       	call   575 <printf>
    1af6:	83 c4 10             	add    $0x10,%esp
    1af9:	eb 01                	jmp    1afc <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1afb:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1afc:	e8 c8 e7 ff ff       	call   2c9 <exit>

00001b01 <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1b01:	55                   	push   %ebp
    1b02:	89 e5                	mov    %esp,%ebp
    1b04:	83 ec 04             	sub    $0x4,%esp
    1b07:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0a:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1b0d:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1b11:	83 e8 23             	sub    $0x23,%eax
    1b14:	83 f8 0c             	cmp    $0xc,%eax
    1b17:	77 25                	ja     1b3e <GetLevel+0x3d>
    1b19:	8b 04 85 e0 37 00 00 	mov    0x37e0(,%eax,4),%eax
    1b20:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1b22:	b8 01 00 00 00       	mov    $0x1,%eax
    1b27:	eb 1a                	jmp    1b43 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1b29:	b8 02 00 00 00       	mov    $0x2,%eax
    1b2e:	eb 13                	jmp    1b43 <GetLevel+0x42>
    case '(':
        return 0;
    1b30:	b8 00 00 00 00       	mov    $0x0,%eax
    1b35:	eb 0c                	jmp    1b43 <GetLevel+0x42>
    case '#':
        return -2;
    1b37:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1b3c:	eb 05                	jmp    1b43 <GetLevel+0x42>
    };
    return -1;
    1b3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1b43:	c9                   	leave  
    1b44:	c3                   	ret    

00001b45 <Operate>:

double Operate(double a1, char op, double a2)
{
    1b45:	55                   	push   %ebp
    1b46:	89 e5                	mov    %esp,%ebp
    1b48:	83 ec 28             	sub    $0x28,%esp
    1b4b:	8b 45 10             	mov    0x10(%ebp),%eax
    1b4e:	8b 55 08             	mov    0x8(%ebp),%edx
    1b51:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1b54:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b57:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1b5a:	88 45 ec             	mov    %al,-0x14(%ebp)
    1b5d:	8b 45 14             	mov    0x14(%ebp),%eax
    1b60:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1b63:	8b 45 18             	mov    0x18(%ebp),%eax
    1b66:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1b69:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1b6d:	83 f8 2b             	cmp    $0x2b,%eax
    1b70:	74 18                	je     1b8a <Operate+0x45>
    1b72:	83 f8 2b             	cmp    $0x2b,%eax
    1b75:	7f 07                	jg     1b7e <Operate+0x39>
    1b77:	83 f8 2a             	cmp    $0x2a,%eax
    1b7a:	74 1e                	je     1b9a <Operate+0x55>
    1b7c:	eb 68                	jmp    1be6 <Operate+0xa1>
    1b7e:	83 f8 2d             	cmp    $0x2d,%eax
    1b81:	74 0f                	je     1b92 <Operate+0x4d>
    1b83:	83 f8 2f             	cmp    $0x2f,%eax
    1b86:	74 1a                	je     1ba2 <Operate+0x5d>
    1b88:	eb 5c                	jmp    1be6 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1b8a:	dd 45 f0             	fldl   -0x10(%ebp)
    1b8d:	dc 45 e0             	faddl  -0x20(%ebp)
    1b90:	eb 56                	jmp    1be8 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1b92:	dd 45 f0             	fldl   -0x10(%ebp)
    1b95:	dc 65 e0             	fsubl  -0x20(%ebp)
    1b98:	eb 4e                	jmp    1be8 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1b9a:	dd 45 f0             	fldl   -0x10(%ebp)
    1b9d:	dc 4d e0             	fmull  -0x20(%ebp)
    1ba0:	eb 46                	jmp    1be8 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1ba2:	d9 ee                	fldz   
    1ba4:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1ba8:	dd 1c 24             	fstpl  (%esp)
    1bab:	ff 75 e4             	pushl  -0x1c(%ebp)
    1bae:	ff 75 e0             	pushl  -0x20(%ebp)
    1bb1:	e8 bd f3 ff ff       	call   f73 <isEqual>
    1bb6:	83 c4 10             	add    $0x10,%esp
    1bb9:	83 f8 01             	cmp    $0x1,%eax
    1bbc:	75 20                	jne    1bde <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1bbe:	83 ec 0c             	sub    $0xc,%esp
    1bc1:	68 14 38 00 00       	push   $0x3814
    1bc6:	6a 00                	push   $0x0
    1bc8:	6a 00                	push   $0x0
    1bca:	6a 01                	push   $0x1
    1bcc:	6a 04                	push   $0x4
    1bce:	e8 ca 10 00 00       	call   2c9d <color_printf>
    1bd3:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1bd6:	dd 05 88 38 00 00    	fldl   0x3888
    1bdc:	eb 0a                	jmp    1be8 <Operate+0xa3>
        }
        else
          return a1 / a2;
    1bde:	dd 45 f0             	fldl   -0x10(%ebp)
    1be1:	dc 75 e0             	fdivl  -0x20(%ebp)
    1be4:	eb 02                	jmp    1be8 <Operate+0xa3>
    };
    return 1;
    1be6:	d9 e8                	fld1   
}
    1be8:	c9                   	leave  
    1be9:	c3                   	ret    

00001bea <Compute>:

double Compute(char *s)
{
    1bea:	55                   	push   %ebp
    1beb:	89 e5                	mov    %esp,%ebp
    1bed:	53                   	push   %ebx
    1bee:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1bf4:	e8 44 14 00 00       	call   303d <dstack>
    1bf9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1bfc:	e8 73 13 00 00       	call   2f74 <cstack>
    1c01:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1c04:	83 ec 08             	sub    $0x8,%esp
    1c07:	6a 23                	push   $0x23
    1c09:	ff 75 e0             	pushl  -0x20(%ebp)
    1c0c:	e8 91 13 00 00       	call   2fa2 <pushc>
    1c11:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1c14:	83 ec 0c             	sub    $0xc,%esp
    1c17:	ff 75 08             	pushl  0x8(%ebp)
    1c1a:	e8 e8 e4 ff ff       	call   107 <strlen>
    1c1f:	83 c4 10             	add    $0x10,%esp
    1c22:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1c25:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1c2c:	c7 05 00 44 00 00 00 	movl   $0x0,0x4400
    1c33:	00 00 00 
    1c36:	e9 58 05 00 00       	jmp    2193 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1c3b:	a1 00 44 00 00       	mov    0x4400,%eax
    1c40:	89 c2                	mov    %eax,%edx
    1c42:	8b 45 08             	mov    0x8(%ebp),%eax
    1c45:	01 d0                	add    %edx,%eax
    1c47:	0f b6 00             	movzbl (%eax),%eax
    1c4a:	3c 24                	cmp    $0x24,%al
    1c4c:	0f 85 f8 01 00 00    	jne    1e4a <Compute+0x260>
        {
          is_minus = 0;
    1c52:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1c59:	a1 00 44 00 00       	mov    0x4400,%eax
    1c5e:	83 c0 01             	add    $0x1,%eax
    1c61:	a3 00 44 00 00       	mov    %eax,0x4400
          if(s[g_pos] != '{')
    1c66:	a1 00 44 00 00       	mov    0x4400,%eax
    1c6b:	89 c2                	mov    %eax,%edx
    1c6d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c70:	01 d0                	add    %edx,%eax
    1c72:	0f b6 00             	movzbl (%eax),%eax
    1c75:	3c 7b                	cmp    $0x7b,%al
    1c77:	74 23                	je     1c9c <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1c79:	83 ec 0c             	sub    $0xc,%esp
    1c7c:	68 2c 38 00 00       	push   $0x382c
    1c81:	6a 00                	push   $0x0
    1c83:	6a 00                	push   $0x0
    1c85:	6a 01                	push   $0x1
    1c87:	6a 04                	push   $0x4
    1c89:	e8 0f 10 00 00       	call   2c9d <color_printf>
    1c8e:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1c91:	dd 05 88 38 00 00    	fldl   0x3888
    1c97:	e9 24 06 00 00       	jmp    22c0 <Compute+0x6d6>
          }
          int i=g_pos+1;
    1c9c:	a1 00 44 00 00       	mov    0x4400,%eax
    1ca1:	83 c0 01             	add    $0x1,%eax
    1ca4:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1ca7:	eb 13                	jmp    1cbc <Compute+0xd2>
          {
            if(s[i] == '}')
    1ca9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1cac:	8b 45 08             	mov    0x8(%ebp),%eax
    1caf:	01 d0                	add    %edx,%eax
    1cb1:	0f b6 00             	movzbl (%eax),%eax
    1cb4:	3c 7d                	cmp    $0x7d,%al
    1cb6:	74 0e                	je     1cc6 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1cb8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1cbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cbf:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1cc2:	7c e5                	jl     1ca9 <Compute+0xbf>
    1cc4:	eb 01                	jmp    1cc7 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1cc6:	90                   	nop
          }
          if(s[i] != '}')
    1cc7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1cca:	8b 45 08             	mov    0x8(%ebp),%eax
    1ccd:	01 d0                	add    %edx,%eax
    1ccf:	0f b6 00             	movzbl (%eax),%eax
    1cd2:	3c 7d                	cmp    $0x7d,%al
    1cd4:	74 23                	je     1cf9 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1cd6:	83 ec 0c             	sub    $0xc,%esp
    1cd9:	68 3a 38 00 00       	push   $0x383a
    1cde:	6a 00                	push   $0x0
    1ce0:	6a 00                	push   $0x0
    1ce2:	6a 01                	push   $0x1
    1ce4:	6a 04                	push   $0x4
    1ce6:	e8 b2 0f 00 00       	call   2c9d <color_printf>
    1ceb:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1cee:	dd 05 88 38 00 00    	fldl   0x3888
    1cf4:	e9 c7 05 00 00       	jmp    22c0 <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1cf9:	a1 00 44 00 00       	mov    0x4400,%eax
    1cfe:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d01:	29 c2                	sub    %eax,%edx
    1d03:	89 d0                	mov    %edx,%eax
    1d05:	83 e8 01             	sub    $0x1,%eax
    1d08:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1d0b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1d12:	eb 27                	jmp    1d3b <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1d14:	8b 15 00 44 00 00    	mov    0x4400,%edx
    1d1a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1d1d:	01 d0                	add    %edx,%eax
    1d1f:	8d 50 01             	lea    0x1(%eax),%edx
    1d22:	8b 45 08             	mov    0x8(%ebp),%eax
    1d25:	01 d0                	add    %edx,%eax
    1d27:	0f b6 00             	movzbl (%eax),%eax
    1d2a:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1d30:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1d33:	01 ca                	add    %ecx,%edx
    1d35:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1d37:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1d3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1d3e:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1d41:	7c d1                	jl     1d14 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1d43:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1d49:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1d4c:	01 d0                	add    %edx,%eax
    1d4e:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1d51:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1d58:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1d5d:	85 c0                	test   %eax,%eax
    1d5f:	75 40                	jne    1da1 <Compute+0x1b7>
            readVariables(variables,&v_num);
    1d61:	83 ec 08             	sub    $0x8,%esp
    1d64:	68 ec 43 00 00       	push   $0x43ec
    1d69:	68 20 44 00 00       	push   $0x4420
    1d6e:	e8 b0 13 00 00       	call   3123 <readVariables>
    1d73:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1d76:	eb 29                	jmp    1da1 <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1d78:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1d7b:	c1 e0 05             	shl    $0x5,%eax
    1d7e:	05 20 44 00 00       	add    $0x4420,%eax
    1d83:	8d 50 04             	lea    0x4(%eax),%edx
    1d86:	83 ec 08             	sub    $0x8,%esp
    1d89:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1d8f:	50                   	push   %eax
    1d90:	52                   	push   %edx
    1d91:	e8 32 e3 ff ff       	call   c8 <strcmp>
    1d96:	83 c4 10             	add    $0x10,%esp
    1d99:	85 c0                	test   %eax,%eax
    1d9b:	74 10                	je     1dad <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1d9d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1da1:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1da6:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1da9:	7c cd                	jl     1d78 <Compute+0x18e>
    1dab:	eb 01                	jmp    1dae <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1dad:	90                   	nop
          }
          if(index == v_num) //no such variable
    1dae:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1db3:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1db6:	75 2a                	jne    1de2 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1db8:	83 ec 08             	sub    $0x8,%esp
    1dbb:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1dc1:	50                   	push   %eax
    1dc2:	68 48 38 00 00       	push   $0x3848
    1dc7:	6a 00                	push   $0x0
    1dc9:	6a 00                	push   $0x0
    1dcb:	6a 01                	push   $0x1
    1dcd:	6a 04                	push   $0x4
    1dcf:	e8 c9 0e 00 00       	call   2c9d <color_printf>
    1dd4:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1dd7:	dd 05 88 38 00 00    	fldl   0x3888
    1ddd:	e9 de 04 00 00       	jmp    22c0 <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1de2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1de5:	c1 e0 05             	shl    $0x5,%eax
    1de8:	05 20 44 00 00       	add    $0x4420,%eax
    1ded:	8b 00                	mov    (%eax),%eax
    1def:	83 f8 02             	cmp    $0x2,%eax
    1df2:	75 23                	jne    1e17 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1df4:	83 ec 0c             	sub    $0xc,%esp
    1df7:	68 62 38 00 00       	push   $0x3862
    1dfc:	6a 00                	push   $0x0
    1dfe:	6a 00                	push   $0x0
    1e00:	6a 01                	push   $0x1
    1e02:	6a 04                	push   $0x4
    1e04:	e8 94 0e 00 00       	call   2c9d <color_printf>
    1e09:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1e0c:	dd 05 88 38 00 00    	fldl   0x3888
    1e12:	e9 a9 04 00 00       	jmp    22c0 <Compute+0x6d6>
          }
          g_pos = i+1;
    1e17:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e1a:	83 c0 01             	add    $0x1,%eax
    1e1d:	a3 00 44 00 00       	mov    %eax,0x4400
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    1e22:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e25:	c1 e0 05             	shl    $0x5,%eax
    1e28:	05 30 44 00 00       	add    $0x4430,%eax
    1e2d:	dd 40 08             	fldl   0x8(%eax)
    1e30:	83 ec 04             	sub    $0x4,%esp
    1e33:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e37:	dd 1c 24             	fstpl  (%esp)
    1e3a:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e3d:	e8 2f 12 00 00       	call   3071 <pushd>
    1e42:	83 c4 10             	add    $0x10,%esp
    1e45:	e9 49 03 00 00       	jmp    2193 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    1e4a:	a1 00 44 00 00       	mov    0x4400,%eax
    1e4f:	89 c2                	mov    %eax,%edx
    1e51:	8b 45 08             	mov    0x8(%ebp),%eax
    1e54:	01 d0                	add    %edx,%eax
    1e56:	0f b6 00             	movzbl (%eax),%eax
    1e59:	3c 2d                	cmp    $0x2d,%al
    1e5b:	75 3f                	jne    1e9c <Compute+0x2b2>
    1e5d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e61:	74 39                	je     1e9c <Compute+0x2b2>
        {
            pushd(opnd,0);
    1e63:	83 ec 04             	sub    $0x4,%esp
    1e66:	d9 ee                	fldz   
    1e68:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e6c:	dd 1c 24             	fstpl  (%esp)
    1e6f:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e72:	e8 fa 11 00 00       	call   3071 <pushd>
    1e77:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    1e7a:	83 ec 08             	sub    $0x8,%esp
    1e7d:	6a 2d                	push   $0x2d
    1e7f:	ff 75 e0             	pushl  -0x20(%ebp)
    1e82:	e8 1b 11 00 00       	call   2fa2 <pushc>
    1e87:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    1e8a:	a1 00 44 00 00       	mov    0x4400,%eax
    1e8f:	83 c0 01             	add    $0x1,%eax
    1e92:	a3 00 44 00 00       	mov    %eax,0x4400
    1e97:	e9 f7 02 00 00       	jmp    2193 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    1e9c:	a1 00 44 00 00       	mov    0x4400,%eax
    1ea1:	89 c2                	mov    %eax,%edx
    1ea3:	8b 45 08             	mov    0x8(%ebp),%eax
    1ea6:	01 d0                	add    %edx,%eax
    1ea8:	0f b6 00             	movzbl (%eax),%eax
    1eab:	3c 29                	cmp    $0x29,%al
    1ead:	0f 85 01 01 00 00    	jne    1fb4 <Compute+0x3ca>
        {
            is_minus = 0;
    1eb3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    1eba:	a1 00 44 00 00       	mov    0x4400,%eax
    1ebf:	83 c0 01             	add    $0x1,%eax
    1ec2:	a3 00 44 00 00       	mov    %eax,0x4400
            while (topc(optr) != '(')
    1ec7:	e9 bf 00 00 00       	jmp    1f8b <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    1ecc:	83 ec 0c             	sub    $0xc,%esp
    1ecf:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ed2:	e8 37 12 00 00       	call   310e <topd>
    1ed7:	83 c4 10             	add    $0x10,%esp
    1eda:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    1edd:	83 ec 0c             	sub    $0xc,%esp
    1ee0:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ee3:	e8 dd 11 00 00       	call   30c5 <popd>
    1ee8:	dd d8                	fstp   %st(0)
    1eea:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    1eed:	83 ec 0c             	sub    $0xc,%esp
    1ef0:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ef3:	e8 16 12 00 00       	call   310e <topd>
    1ef8:	83 c4 10             	add    $0x10,%esp
    1efb:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    1efe:	83 ec 0c             	sub    $0xc,%esp
    1f01:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f04:	e8 bc 11 00 00       	call   30c5 <popd>
    1f09:	dd d8                	fstp   %st(0)
    1f0b:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    1f0e:	83 ec 0c             	sub    $0xc,%esp
    1f11:	ff 75 e0             	pushl  -0x20(%ebp)
    1f14:	e8 11 11 00 00       	call   302a <topc>
    1f19:	83 c4 10             	add    $0x10,%esp
    1f1c:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    1f1f:	83 ec 0c             	sub    $0xc,%esp
    1f22:	ff 75 e0             	pushl  -0x20(%ebp)
    1f25:	e8 be 10 00 00       	call   2fe8 <popc>
    1f2a:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    1f2d:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    1f31:	83 ec 0c             	sub    $0xc,%esp
    1f34:	ff 75 d4             	pushl  -0x2c(%ebp)
    1f37:	ff 75 d0             	pushl  -0x30(%ebp)
    1f3a:	50                   	push   %eax
    1f3b:	ff 75 cc             	pushl  -0x34(%ebp)
    1f3e:	ff 75 c8             	pushl  -0x38(%ebp)
    1f41:	e8 ff fb ff ff       	call   1b45 <Operate>
    1f46:	83 c4 20             	add    $0x20,%esp
    1f49:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    1f4c:	dd 05 88 38 00 00    	fldl   0x3888
    1f52:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1f56:	dd 1c 24             	fstpl  (%esp)
    1f59:	ff 75 bc             	pushl  -0x44(%ebp)
    1f5c:	ff 75 b8             	pushl  -0x48(%ebp)
    1f5f:	e8 0f f0 ff ff       	call   f73 <isEqual>
    1f64:	83 c4 10             	add    $0x10,%esp
    1f67:	83 f8 01             	cmp    $0x1,%eax
    1f6a:	75 0b                	jne    1f77 <Compute+0x38d>
                  return WRONG_ANS;
    1f6c:	dd 05 88 38 00 00    	fldl   0x3888
    1f72:	e9 49 03 00 00       	jmp    22c0 <Compute+0x6d6>
                pushd(opnd,result);
    1f77:	83 ec 04             	sub    $0x4,%esp
    1f7a:	ff 75 bc             	pushl  -0x44(%ebp)
    1f7d:	ff 75 b8             	pushl  -0x48(%ebp)
    1f80:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f83:	e8 e9 10 00 00       	call   3071 <pushd>
    1f88:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    1f8b:	83 ec 0c             	sub    $0xc,%esp
    1f8e:	ff 75 e0             	pushl  -0x20(%ebp)
    1f91:	e8 94 10 00 00       	call   302a <topc>
    1f96:	83 c4 10             	add    $0x10,%esp
    1f99:	3c 28                	cmp    $0x28,%al
    1f9b:	0f 85 2b ff ff ff    	jne    1ecc <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    1fa1:	83 ec 0c             	sub    $0xc,%esp
    1fa4:	ff 75 e0             	pushl  -0x20(%ebp)
    1fa7:	e8 3c 10 00 00       	call   2fe8 <popc>
    1fac:	83 c4 10             	add    $0x10,%esp
    1faf:	e9 df 01 00 00       	jmp    2193 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    1fb4:	a1 00 44 00 00       	mov    0x4400,%eax
    1fb9:	89 c2                	mov    %eax,%edx
    1fbb:	8b 45 08             	mov    0x8(%ebp),%eax
    1fbe:	01 d0                	add    %edx,%eax
    1fc0:	0f b6 00             	movzbl (%eax),%eax
    1fc3:	3c 2f                	cmp    $0x2f,%al
    1fc5:	7e 49                	jle    2010 <Compute+0x426>
    1fc7:	a1 00 44 00 00       	mov    0x4400,%eax
    1fcc:	89 c2                	mov    %eax,%edx
    1fce:	8b 45 08             	mov    0x8(%ebp),%eax
    1fd1:	01 d0                	add    %edx,%eax
    1fd3:	0f b6 00             	movzbl (%eax),%eax
    1fd6:	3c 39                	cmp    $0x39,%al
    1fd8:	7f 36                	jg     2010 <Compute+0x426>
        {
            is_minus = 0;
    1fda:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    1fe1:	83 ec 08             	sub    $0x8,%esp
    1fe4:	68 00 44 00 00       	push   $0x4400
    1fe9:	ff 75 08             	pushl  0x8(%ebp)
    1fec:	e8 c3 eb ff ff       	call   bb4 <Translation>
    1ff1:	83 c4 10             	add    $0x10,%esp
    1ff4:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    1ff7:	83 ec 04             	sub    $0x4,%esp
    1ffa:	ff 75 b4             	pushl  -0x4c(%ebp)
    1ffd:	ff 75 b0             	pushl  -0x50(%ebp)
    2000:	ff 75 e4             	pushl  -0x1c(%ebp)
    2003:	e8 69 10 00 00       	call   3071 <pushd>
    2008:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    200b:	e9 83 01 00 00       	jmp    2193 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    2010:	a1 00 44 00 00       	mov    0x4400,%eax
    2015:	89 c2                	mov    %eax,%edx
    2017:	8b 45 08             	mov    0x8(%ebp),%eax
    201a:	01 d0                	add    %edx,%eax
    201c:	0f b6 00             	movzbl (%eax),%eax
    201f:	3c 28                	cmp    $0x28,%al
    2021:	0f 85 f9 00 00 00    	jne    2120 <Compute+0x536>
        {
            is_minus = 1;
    2027:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    202e:	a1 00 44 00 00       	mov    0x4400,%eax
    2033:	89 c2                	mov    %eax,%edx
    2035:	8b 45 08             	mov    0x8(%ebp),%eax
    2038:	01 d0                	add    %edx,%eax
    203a:	0f b6 00             	movzbl (%eax),%eax
    203d:	0f be c0             	movsbl %al,%eax
    2040:	83 ec 08             	sub    $0x8,%esp
    2043:	50                   	push   %eax
    2044:	ff 75 e0             	pushl  -0x20(%ebp)
    2047:	e8 56 0f 00 00       	call   2fa2 <pushc>
    204c:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    204f:	a1 00 44 00 00       	mov    0x4400,%eax
    2054:	83 c0 01             	add    $0x1,%eax
    2057:	a3 00 44 00 00       	mov    %eax,0x4400
    205c:	e9 32 01 00 00       	jmp    2193 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    2061:	83 ec 0c             	sub    $0xc,%esp
    2064:	ff 75 e4             	pushl  -0x1c(%ebp)
    2067:	e8 a2 10 00 00       	call   310e <topd>
    206c:	83 c4 10             	add    $0x10,%esp
    206f:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    2072:	83 ec 0c             	sub    $0xc,%esp
    2075:	ff 75 e4             	pushl  -0x1c(%ebp)
    2078:	e8 48 10 00 00       	call   30c5 <popd>
    207d:	dd d8                	fstp   %st(0)
    207f:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2082:	83 ec 0c             	sub    $0xc,%esp
    2085:	ff 75 e4             	pushl  -0x1c(%ebp)
    2088:	e8 81 10 00 00       	call   310e <topd>
    208d:	83 c4 10             	add    $0x10,%esp
    2090:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    2093:	83 ec 0c             	sub    $0xc,%esp
    2096:	ff 75 e4             	pushl  -0x1c(%ebp)
    2099:	e8 27 10 00 00       	call   30c5 <popd>
    209e:	dd d8                	fstp   %st(0)
    20a0:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    20a3:	83 ec 0c             	sub    $0xc,%esp
    20a6:	ff 75 e0             	pushl  -0x20(%ebp)
    20a9:	e8 7c 0f 00 00       	call   302a <topc>
    20ae:	83 c4 10             	add    $0x10,%esp
    20b1:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    20b4:	83 ec 0c             	sub    $0xc,%esp
    20b7:	ff 75 e0             	pushl  -0x20(%ebp)
    20ba:	e8 29 0f 00 00       	call   2fe8 <popc>
    20bf:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    20c2:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    20c6:	83 ec 0c             	sub    $0xc,%esp
    20c9:	ff 75 ac             	pushl  -0x54(%ebp)
    20cc:	ff 75 a8             	pushl  -0x58(%ebp)
    20cf:	50                   	push   %eax
    20d0:	ff 75 a4             	pushl  -0x5c(%ebp)
    20d3:	ff 75 a0             	pushl  -0x60(%ebp)
    20d6:	e8 6a fa ff ff       	call   1b45 <Operate>
    20db:	83 c4 20             	add    $0x20,%esp
    20de:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    20e1:	dd 05 88 38 00 00    	fldl   0x3888
    20e7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    20eb:	dd 1c 24             	fstpl  (%esp)
    20ee:	ff 75 94             	pushl  -0x6c(%ebp)
    20f1:	ff 75 90             	pushl  -0x70(%ebp)
    20f4:	e8 7a ee ff ff       	call   f73 <isEqual>
    20f9:	83 c4 10             	add    $0x10,%esp
    20fc:	83 f8 01             	cmp    $0x1,%eax
    20ff:	75 0b                	jne    210c <Compute+0x522>
                  return WRONG_ANS;
    2101:	dd 05 88 38 00 00    	fldl   0x3888
    2107:	e9 b4 01 00 00       	jmp    22c0 <Compute+0x6d6>
                pushd(opnd,result);
    210c:	83 ec 04             	sub    $0x4,%esp
    210f:	ff 75 94             	pushl  -0x6c(%ebp)
    2112:	ff 75 90             	pushl  -0x70(%ebp)
    2115:	ff 75 e4             	pushl  -0x1c(%ebp)
    2118:	e8 54 0f 00 00       	call   3071 <pushd>
    211d:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    2120:	a1 00 44 00 00       	mov    0x4400,%eax
    2125:	89 c2                	mov    %eax,%edx
    2127:	8b 45 08             	mov    0x8(%ebp),%eax
    212a:	01 d0                	add    %edx,%eax
    212c:	0f b6 00             	movzbl (%eax),%eax
    212f:	0f be c0             	movsbl %al,%eax
    2132:	83 ec 0c             	sub    $0xc,%esp
    2135:	50                   	push   %eax
    2136:	e8 c6 f9 ff ff       	call   1b01 <GetLevel>
    213b:	83 c4 10             	add    $0x10,%esp
    213e:	89 c3                	mov    %eax,%ebx
    2140:	83 ec 0c             	sub    $0xc,%esp
    2143:	ff 75 e0             	pushl  -0x20(%ebp)
    2146:	e8 df 0e 00 00       	call   302a <topc>
    214b:	83 c4 10             	add    $0x10,%esp
    214e:	0f be c0             	movsbl %al,%eax
    2151:	83 ec 0c             	sub    $0xc,%esp
    2154:	50                   	push   %eax
    2155:	e8 a7 f9 ff ff       	call   1b01 <GetLevel>
    215a:	83 c4 10             	add    $0x10,%esp
    215d:	39 c3                	cmp    %eax,%ebx
    215f:	0f 8e fc fe ff ff    	jle    2061 <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    2165:	a1 00 44 00 00       	mov    0x4400,%eax
    216a:	89 c2                	mov    %eax,%edx
    216c:	8b 45 08             	mov    0x8(%ebp),%eax
    216f:	01 d0                	add    %edx,%eax
    2171:	0f b6 00             	movzbl (%eax),%eax
    2174:	0f be c0             	movsbl %al,%eax
    2177:	83 ec 08             	sub    $0x8,%esp
    217a:	50                   	push   %eax
    217b:	ff 75 e0             	pushl  -0x20(%ebp)
    217e:	e8 1f 0e 00 00       	call   2fa2 <pushc>
    2183:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2186:	a1 00 44 00 00       	mov    0x4400,%eax
    218b:	83 c0 01             	add    $0x1,%eax
    218e:	a3 00 44 00 00       	mov    %eax,0x4400
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    2193:	a1 00 44 00 00       	mov    0x4400,%eax
    2198:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    219b:	0f 8c 9a fa ff ff    	jl     1c3b <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    21a1:	e9 da 00 00 00       	jmp    2280 <Compute+0x696>
    {
        double a2 = topd(opnd);
    21a6:	83 ec 0c             	sub    $0xc,%esp
    21a9:	ff 75 e4             	pushl  -0x1c(%ebp)
    21ac:	e8 5d 0f 00 00       	call   310e <topd>
    21b1:	83 c4 10             	add    $0x10,%esp
    21b4:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    21b7:	83 ec 0c             	sub    $0xc,%esp
    21ba:	ff 75 e4             	pushl  -0x1c(%ebp)
    21bd:	e8 03 0f 00 00       	call   30c5 <popd>
    21c2:	dd d8                	fstp   %st(0)
    21c4:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    21c7:	83 ec 0c             	sub    $0xc,%esp
    21ca:	ff 75 e4             	pushl  -0x1c(%ebp)
    21cd:	e8 3c 0f 00 00       	call   310e <topd>
    21d2:	83 c4 10             	add    $0x10,%esp
    21d5:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    21db:	83 ec 0c             	sub    $0xc,%esp
    21de:	ff 75 e4             	pushl  -0x1c(%ebp)
    21e1:	e8 df 0e 00 00       	call   30c5 <popd>
    21e6:	dd d8                	fstp   %st(0)
    21e8:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    21eb:	83 ec 0c             	sub    $0xc,%esp
    21ee:	ff 75 e0             	pushl  -0x20(%ebp)
    21f1:	e8 34 0e 00 00       	call   302a <topc>
    21f6:	83 c4 10             	add    $0x10,%esp
    21f9:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    21ff:	83 ec 0c             	sub    $0xc,%esp
    2202:	ff 75 e0             	pushl  -0x20(%ebp)
    2205:	e8 de 0d 00 00       	call   2fe8 <popc>
    220a:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    220d:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    2214:	83 ec 0c             	sub    $0xc,%esp
    2217:	ff 75 84             	pushl  -0x7c(%ebp)
    221a:	ff 75 80             	pushl  -0x80(%ebp)
    221d:	50                   	push   %eax
    221e:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    2224:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    222a:	e8 16 f9 ff ff       	call   1b45 <Operate>
    222f:	83 c4 20             	add    $0x20,%esp
    2232:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    2238:	dd 05 88 38 00 00    	fldl   0x3888
    223e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2242:	dd 1c 24             	fstpl  (%esp)
    2245:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    224b:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2251:	e8 1d ed ff ff       	call   f73 <isEqual>
    2256:	83 c4 10             	add    $0x10,%esp
    2259:	83 f8 01             	cmp    $0x1,%eax
    225c:	75 08                	jne    2266 <Compute+0x67c>
          return WRONG_ANS;
    225e:	dd 05 88 38 00 00    	fldl   0x3888
    2264:	eb 5a                	jmp    22c0 <Compute+0x6d6>
        pushd(opnd,result);
    2266:	83 ec 04             	sub    $0x4,%esp
    2269:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    226f:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2275:	ff 75 e4             	pushl  -0x1c(%ebp)
    2278:	e8 f4 0d 00 00       	call   3071 <pushd>
    227d:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2280:	83 ec 0c             	sub    $0xc,%esp
    2283:	ff 75 e0             	pushl  -0x20(%ebp)
    2286:	e8 9f 0d 00 00       	call   302a <topc>
    228b:	83 c4 10             	add    $0x10,%esp
    228e:	3c 23                	cmp    $0x23,%al
    2290:	0f 85 10 ff ff ff    	jne    21a6 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    2296:	83 ec 0c             	sub    $0xc,%esp
    2299:	ff 75 e4             	pushl  -0x1c(%ebp)
    229c:	e8 94 e4 ff ff       	call   735 <free>
    22a1:	83 c4 10             	add    $0x10,%esp
    free(optr);
    22a4:	83 ec 0c             	sub    $0xc,%esp
    22a7:	ff 75 e0             	pushl  -0x20(%ebp)
    22aa:	e8 86 e4 ff ff       	call   735 <free>
    22af:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    22b2:	83 ec 0c             	sub    $0xc,%esp
    22b5:	ff 75 e4             	pushl  -0x1c(%ebp)
    22b8:	e8 51 0e 00 00       	call   310e <topd>
    22bd:	83 c4 10             	add    $0x10,%esp
}
    22c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    22c3:	c9                   	leave  
    22c4:	c3                   	ret    

000022c5 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    22c5:	55                   	push   %ebp
    22c6:	89 e5                	mov    %esp,%ebp
    22c8:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    22cb:	8b 45 08             	mov    0x8(%ebp),%eax
    22ce:	8b 00                	mov    (%eax),%eax
    22d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    22d3:	eb 04                	jmp    22d9 <gettoken+0x14>
    s++;
    22d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    22d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22dc:	3b 45 0c             	cmp    0xc(%ebp),%eax
    22df:	73 1e                	jae    22ff <gettoken+0x3a>
    22e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22e4:	0f b6 00             	movzbl (%eax),%eax
    22e7:	0f be c0             	movsbl %al,%eax
    22ea:	83 ec 08             	sub    $0x8,%esp
    22ed:	50                   	push   %eax
    22ee:	68 b4 43 00 00       	push   $0x43b4
    22f3:	e8 50 de ff ff       	call   148 <strchr>
    22f8:	83 c4 10             	add    $0x10,%esp
    22fb:	85 c0                	test   %eax,%eax
    22fd:	75 d6                	jne    22d5 <gettoken+0x10>
    s++;
  if(q)
    22ff:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2303:	74 08                	je     230d <gettoken+0x48>
    *q = s;
    2305:	8b 45 10             	mov    0x10(%ebp),%eax
    2308:	8b 55 f4             	mov    -0xc(%ebp),%edx
    230b:	89 10                	mov    %edx,(%eax)
  ret = *s;
    230d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2310:	0f b6 00             	movzbl (%eax),%eax
    2313:	0f be c0             	movsbl %al,%eax
    2316:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    2319:	8b 45 f4             	mov    -0xc(%ebp),%eax
    231c:	0f b6 00             	movzbl (%eax),%eax
    231f:	0f be c0             	movsbl %al,%eax
    2322:	83 f8 29             	cmp    $0x29,%eax
    2325:	7f 14                	jg     233b <gettoken+0x76>
    2327:	83 f8 28             	cmp    $0x28,%eax
    232a:	7d 28                	jge    2354 <gettoken+0x8f>
    232c:	85 c0                	test   %eax,%eax
    232e:	0f 84 94 00 00 00    	je     23c8 <gettoken+0x103>
    2334:	83 f8 26             	cmp    $0x26,%eax
    2337:	74 1b                	je     2354 <gettoken+0x8f>
    2339:	eb 3a                	jmp    2375 <gettoken+0xb0>
    233b:	83 f8 3e             	cmp    $0x3e,%eax
    233e:	74 1a                	je     235a <gettoken+0x95>
    2340:	83 f8 3e             	cmp    $0x3e,%eax
    2343:	7f 0a                	jg     234f <gettoken+0x8a>
    2345:	83 e8 3b             	sub    $0x3b,%eax
    2348:	83 f8 01             	cmp    $0x1,%eax
    234b:	77 28                	ja     2375 <gettoken+0xb0>
    234d:	eb 05                	jmp    2354 <gettoken+0x8f>
    234f:	83 f8 7c             	cmp    $0x7c,%eax
    2352:	75 21                	jne    2375 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    2354:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    2358:	eb 75                	jmp    23cf <gettoken+0x10a>
  case '>':
    s++;
    235a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    235e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2361:	0f b6 00             	movzbl (%eax),%eax
    2364:	3c 3e                	cmp    $0x3e,%al
    2366:	75 63                	jne    23cb <gettoken+0x106>
      ret = '+';
    2368:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    236f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    2373:	eb 56                	jmp    23cb <gettoken+0x106>
  default:
    ret = 'a';
    2375:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    237c:	eb 04                	jmp    2382 <gettoken+0xbd>
      s++;
    237e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2382:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2385:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2388:	73 44                	jae    23ce <gettoken+0x109>
    238a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    238d:	0f b6 00             	movzbl (%eax),%eax
    2390:	0f be c0             	movsbl %al,%eax
    2393:	83 ec 08             	sub    $0x8,%esp
    2396:	50                   	push   %eax
    2397:	68 b4 43 00 00       	push   $0x43b4
    239c:	e8 a7 dd ff ff       	call   148 <strchr>
    23a1:	83 c4 10             	add    $0x10,%esp
    23a4:	85 c0                	test   %eax,%eax
    23a6:	75 26                	jne    23ce <gettoken+0x109>
    23a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23ab:	0f b6 00             	movzbl (%eax),%eax
    23ae:	0f be c0             	movsbl %al,%eax
    23b1:	83 ec 08             	sub    $0x8,%esp
    23b4:	50                   	push   %eax
    23b5:	68 bc 43 00 00       	push   $0x43bc
    23ba:	e8 89 dd ff ff       	call   148 <strchr>
    23bf:	83 c4 10             	add    $0x10,%esp
    23c2:	85 c0                	test   %eax,%eax
    23c4:	74 b8                	je     237e <gettoken+0xb9>
      s++;
    break;
    23c6:	eb 06                	jmp    23ce <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    23c8:	90                   	nop
    23c9:	eb 04                	jmp    23cf <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    23cb:	90                   	nop
    23cc:	eb 01                	jmp    23cf <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    23ce:	90                   	nop
  }
  if(eq)
    23cf:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    23d3:	74 0e                	je     23e3 <gettoken+0x11e>
    *eq = s;
    23d5:	8b 45 14             	mov    0x14(%ebp),%eax
    23d8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    23db:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    23dd:	eb 04                	jmp    23e3 <gettoken+0x11e>
    s++;
    23df:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    23e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23e6:	3b 45 0c             	cmp    0xc(%ebp),%eax
    23e9:	73 1e                	jae    2409 <gettoken+0x144>
    23eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23ee:	0f b6 00             	movzbl (%eax),%eax
    23f1:	0f be c0             	movsbl %al,%eax
    23f4:	83 ec 08             	sub    $0x8,%esp
    23f7:	50                   	push   %eax
    23f8:	68 b4 43 00 00       	push   $0x43b4
    23fd:	e8 46 dd ff ff       	call   148 <strchr>
    2402:	83 c4 10             	add    $0x10,%esp
    2405:	85 c0                	test   %eax,%eax
    2407:	75 d6                	jne    23df <gettoken+0x11a>
    s++;
  *ps = s;
    2409:	8b 45 08             	mov    0x8(%ebp),%eax
    240c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    240f:	89 10                	mov    %edx,(%eax)
  return ret;
    2411:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2414:	c9                   	leave  
    2415:	c3                   	ret    

00002416 <peek>:

int peek(char **ps, char *es, char *toks)
{
    2416:	55                   	push   %ebp
    2417:	89 e5                	mov    %esp,%ebp
    2419:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    241c:	8b 45 08             	mov    0x8(%ebp),%eax
    241f:	8b 00                	mov    (%eax),%eax
    2421:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2424:	eb 04                	jmp    242a <peek+0x14>
    s++;
    2426:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    242a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    242d:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2430:	73 1e                	jae    2450 <peek+0x3a>
    2432:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2435:	0f b6 00             	movzbl (%eax),%eax
    2438:	0f be c0             	movsbl %al,%eax
    243b:	83 ec 08             	sub    $0x8,%esp
    243e:	50                   	push   %eax
    243f:	68 b4 43 00 00       	push   $0x43b4
    2444:	e8 ff dc ff ff       	call   148 <strchr>
    2449:	83 c4 10             	add    $0x10,%esp
    244c:	85 c0                	test   %eax,%eax
    244e:	75 d6                	jne    2426 <peek+0x10>
    s++;
  *ps = s;
    2450:	8b 45 08             	mov    0x8(%ebp),%eax
    2453:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2456:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    2458:	8b 45 f4             	mov    -0xc(%ebp),%eax
    245b:	0f b6 00             	movzbl (%eax),%eax
    245e:	84 c0                	test   %al,%al
    2460:	74 23                	je     2485 <peek+0x6f>
    2462:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2465:	0f b6 00             	movzbl (%eax),%eax
    2468:	0f be c0             	movsbl %al,%eax
    246b:	83 ec 08             	sub    $0x8,%esp
    246e:	50                   	push   %eax
    246f:	ff 75 10             	pushl  0x10(%ebp)
    2472:	e8 d1 dc ff ff       	call   148 <strchr>
    2477:	83 c4 10             	add    $0x10,%esp
    247a:	85 c0                	test   %eax,%eax
    247c:	74 07                	je     2485 <peek+0x6f>
    247e:	b8 01 00 00 00       	mov    $0x1,%eax
    2483:	eb 05                	jmp    248a <peek+0x74>
    2485:	b8 00 00 00 00       	mov    $0x0,%eax
}
    248a:	c9                   	leave  
    248b:	c3                   	ret    

0000248c <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    248c:	55                   	push   %ebp
    248d:	89 e5                	mov    %esp,%ebp
    248f:	53                   	push   %ebx
    2490:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    2493:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2496:	8b 45 08             	mov    0x8(%ebp),%eax
    2499:	83 ec 0c             	sub    $0xc,%esp
    249c:	50                   	push   %eax
    249d:	e8 65 dc ff ff       	call   107 <strlen>
    24a2:	83 c4 10             	add    $0x10,%esp
    24a5:	01 d8                	add    %ebx,%eax
    24a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    24aa:	8b 45 08             	mov    0x8(%ebp),%eax
    24ad:	0f b6 00             	movzbl (%eax),%eax
    24b0:	3c 25                	cmp    $0x25,%al
    24b2:	75 5d                	jne    2511 <parsecmd+0x85>
  {
    int len = strlen(s);
    24b4:	8b 45 08             	mov    0x8(%ebp),%eax
    24b7:	83 ec 0c             	sub    $0xc,%esp
    24ba:	50                   	push   %eax
    24bb:	e8 47 dc ff ff       	call   107 <strlen>
    24c0:	83 c4 10             	add    $0x10,%esp
    24c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    24c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24c9:	83 ec 0c             	sub    $0xc,%esp
    24cc:	50                   	push   %eax
    24cd:	e8 a5 e3 ff ff       	call   877 <malloc>
    24d2:	83 c4 10             	add    $0x10,%esp
    24d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    24d8:	8b 45 08             	mov    0x8(%ebp),%eax
    24db:	83 c0 01             	add    $0x1,%eax
    24de:	83 ec 08             	sub    $0x8,%esp
    24e1:	50                   	push   %eax
    24e2:	ff 75 ec             	pushl  -0x14(%ebp)
    24e5:	e8 ae db ff ff       	call   98 <strcpy>
    24ea:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    24ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24f0:	8d 50 fe             	lea    -0x2(%eax),%edx
    24f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24f6:	01 d0                	add    %edx,%eax
    24f8:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    24fb:	83 ec 0c             	sub    $0xc,%esp
    24fe:	ff 75 ec             	pushl  -0x14(%ebp)
    2501:	e8 59 e9 ff ff       	call   e5f <calcmd>
    2506:	83 c4 10             	add    $0x10,%esp
    2509:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    250c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    250f:	eb 6b                	jmp    257c <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    2511:	83 ec 08             	sub    $0x8,%esp
    2514:	ff 75 f4             	pushl  -0xc(%ebp)
    2517:	8d 45 08             	lea    0x8(%ebp),%eax
    251a:	50                   	push   %eax
    251b:	e8 61 00 00 00       	call   2581 <parseline>
    2520:	83 c4 10             	add    $0x10,%esp
    2523:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    2526:	83 ec 04             	sub    $0x4,%esp
    2529:	68 90 38 00 00       	push   $0x3890
    252e:	ff 75 f4             	pushl  -0xc(%ebp)
    2531:	8d 45 08             	lea    0x8(%ebp),%eax
    2534:	50                   	push   %eax
    2535:	e8 dc fe ff ff       	call   2416 <peek>
    253a:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    253d:	8b 45 08             	mov    0x8(%ebp),%eax
    2540:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2543:	74 26                	je     256b <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    2545:	8b 45 08             	mov    0x8(%ebp),%eax
    2548:	83 ec 04             	sub    $0x4,%esp
    254b:	50                   	push   %eax
    254c:	68 91 38 00 00       	push   $0x3891
    2551:	6a 02                	push   $0x2
    2553:	e8 1d e0 ff ff       	call   575 <printf>
    2558:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    255b:	83 ec 0c             	sub    $0xc,%esp
    255e:	68 a0 38 00 00       	push   $0x38a0
    2563:	e8 f2 e3 ff ff       	call   95a <panic1>
    2568:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    256b:	83 ec 0c             	sub    $0xc,%esp
    256e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2571:	e8 eb 03 00 00       	call   2961 <nulterminate>
    2576:	83 c4 10             	add    $0x10,%esp
  return cmd;
    2579:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    257c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    257f:	c9                   	leave  
    2580:	c3                   	ret    

00002581 <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    2581:	55                   	push   %ebp
    2582:	89 e5                	mov    %esp,%ebp
    2584:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    2587:	83 ec 08             	sub    $0x8,%esp
    258a:	ff 75 0c             	pushl  0xc(%ebp)
    258d:	ff 75 08             	pushl  0x8(%ebp)
    2590:	e8 99 00 00 00       	call   262e <parsepipe>
    2595:	83 c4 10             	add    $0x10,%esp
    2598:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    259b:	eb 23                	jmp    25c0 <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    259d:	6a 00                	push   $0x0
    259f:	6a 00                	push   $0x0
    25a1:	ff 75 0c             	pushl  0xc(%ebp)
    25a4:	ff 75 08             	pushl  0x8(%ebp)
    25a7:	e8 19 fd ff ff       	call   22c5 <gettoken>
    25ac:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    25af:	83 ec 0c             	sub    $0xc,%esp
    25b2:	ff 75 f4             	pushl  -0xc(%ebp)
    25b5:	e8 66 e8 ff ff       	call   e20 <backcmd>
    25ba:	83 c4 10             	add    $0x10,%esp
    25bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    25c0:	83 ec 04             	sub    $0x4,%esp
    25c3:	68 a7 38 00 00       	push   $0x38a7
    25c8:	ff 75 0c             	pushl  0xc(%ebp)
    25cb:	ff 75 08             	pushl  0x8(%ebp)
    25ce:	e8 43 fe ff ff       	call   2416 <peek>
    25d3:	83 c4 10             	add    $0x10,%esp
    25d6:	85 c0                	test   %eax,%eax
    25d8:	75 c3                	jne    259d <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    25da:	83 ec 04             	sub    $0x4,%esp
    25dd:	68 a9 38 00 00       	push   $0x38a9
    25e2:	ff 75 0c             	pushl  0xc(%ebp)
    25e5:	ff 75 08             	pushl  0x8(%ebp)
    25e8:	e8 29 fe ff ff       	call   2416 <peek>
    25ed:	83 c4 10             	add    $0x10,%esp
    25f0:	85 c0                	test   %eax,%eax
    25f2:	74 35                	je     2629 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    25f4:	6a 00                	push   $0x0
    25f6:	6a 00                	push   $0x0
    25f8:	ff 75 0c             	pushl  0xc(%ebp)
    25fb:	ff 75 08             	pushl  0x8(%ebp)
    25fe:	e8 c2 fc ff ff       	call   22c5 <gettoken>
    2603:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    2606:	83 ec 08             	sub    $0x8,%esp
    2609:	ff 75 0c             	pushl  0xc(%ebp)
    260c:	ff 75 08             	pushl  0x8(%ebp)
    260f:	e8 6d ff ff ff       	call   2581 <parseline>
    2614:	83 c4 10             	add    $0x10,%esp
    2617:	83 ec 08             	sub    $0x8,%esp
    261a:	50                   	push   %eax
    261b:	ff 75 f4             	pushl  -0xc(%ebp)
    261e:	e8 b5 e7 ff ff       	call   dd8 <listcmd>
    2623:	83 c4 10             	add    $0x10,%esp
    2626:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2629:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    262c:	c9                   	leave  
    262d:	c3                   	ret    

0000262e <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    262e:	55                   	push   %ebp
    262f:	89 e5                	mov    %esp,%ebp
    2631:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    2634:	83 ec 08             	sub    $0x8,%esp
    2637:	ff 75 0c             	pushl  0xc(%ebp)
    263a:	ff 75 08             	pushl  0x8(%ebp)
    263d:	e8 ec 01 00 00       	call   282e <parseexec>
    2642:	83 c4 10             	add    $0x10,%esp
    2645:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    2648:	83 ec 04             	sub    $0x4,%esp
    264b:	68 ab 38 00 00       	push   $0x38ab
    2650:	ff 75 0c             	pushl  0xc(%ebp)
    2653:	ff 75 08             	pushl  0x8(%ebp)
    2656:	e8 bb fd ff ff       	call   2416 <peek>
    265b:	83 c4 10             	add    $0x10,%esp
    265e:	85 c0                	test   %eax,%eax
    2660:	74 35                	je     2697 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2662:	6a 00                	push   $0x0
    2664:	6a 00                	push   $0x0
    2666:	ff 75 0c             	pushl  0xc(%ebp)
    2669:	ff 75 08             	pushl  0x8(%ebp)
    266c:	e8 54 fc ff ff       	call   22c5 <gettoken>
    2671:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2674:	83 ec 08             	sub    $0x8,%esp
    2677:	ff 75 0c             	pushl  0xc(%ebp)
    267a:	ff 75 08             	pushl  0x8(%ebp)
    267d:	e8 ac ff ff ff       	call   262e <parsepipe>
    2682:	83 c4 10             	add    $0x10,%esp
    2685:	83 ec 08             	sub    $0x8,%esp
    2688:	50                   	push   %eax
    2689:	ff 75 f4             	pushl  -0xc(%ebp)
    268c:	e8 ff e6 ff ff       	call   d90 <pipecmd>
    2691:	83 c4 10             	add    $0x10,%esp
    2694:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2697:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    269a:	c9                   	leave  
    269b:	c3                   	ret    

0000269c <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    269c:	55                   	push   %ebp
    269d:	89 e5                	mov    %esp,%ebp
    269f:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    26a2:	e9 b6 00 00 00       	jmp    275d <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    26a7:	6a 00                	push   $0x0
    26a9:	6a 00                	push   $0x0
    26ab:	ff 75 10             	pushl  0x10(%ebp)
    26ae:	ff 75 0c             	pushl  0xc(%ebp)
    26b1:	e8 0f fc ff ff       	call   22c5 <gettoken>
    26b6:	83 c4 10             	add    $0x10,%esp
    26b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    26bc:	8d 45 ec             	lea    -0x14(%ebp),%eax
    26bf:	50                   	push   %eax
    26c0:	8d 45 f0             	lea    -0x10(%ebp),%eax
    26c3:	50                   	push   %eax
    26c4:	ff 75 10             	pushl  0x10(%ebp)
    26c7:	ff 75 0c             	pushl  0xc(%ebp)
    26ca:	e8 f6 fb ff ff       	call   22c5 <gettoken>
    26cf:	83 c4 10             	add    $0x10,%esp
    26d2:	83 f8 61             	cmp    $0x61,%eax
    26d5:	74 10                	je     26e7 <parseredirs+0x4b>
      panic1("missing file for redirection");
    26d7:	83 ec 0c             	sub    $0xc,%esp
    26da:	68 ad 38 00 00       	push   $0x38ad
    26df:	e8 76 e2 ff ff       	call   95a <panic1>
    26e4:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    26e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26ea:	83 f8 3c             	cmp    $0x3c,%eax
    26ed:	74 0c                	je     26fb <parseredirs+0x5f>
    26ef:	83 f8 3e             	cmp    $0x3e,%eax
    26f2:	74 26                	je     271a <parseredirs+0x7e>
    26f4:	83 f8 2b             	cmp    $0x2b,%eax
    26f7:	74 43                	je     273c <parseredirs+0xa0>
    26f9:	eb 62                	jmp    275d <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    26fb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    26fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2701:	83 ec 0c             	sub    $0xc,%esp
    2704:	6a 00                	push   $0x0
    2706:	6a 00                	push   $0x0
    2708:	52                   	push   %edx
    2709:	50                   	push   %eax
    270a:	ff 75 08             	pushl  0x8(%ebp)
    270d:	e8 1b e6 ff ff       	call   d2d <redircmd>
    2712:	83 c4 20             	add    $0x20,%esp
    2715:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2718:	eb 43                	jmp    275d <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    271a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    271d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2720:	83 ec 0c             	sub    $0xc,%esp
    2723:	6a 01                	push   $0x1
    2725:	68 01 02 00 00       	push   $0x201
    272a:	52                   	push   %edx
    272b:	50                   	push   %eax
    272c:	ff 75 08             	pushl  0x8(%ebp)
    272f:	e8 f9 e5 ff ff       	call   d2d <redircmd>
    2734:	83 c4 20             	add    $0x20,%esp
    2737:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    273a:	eb 21                	jmp    275d <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    273c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    273f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2742:	83 ec 0c             	sub    $0xc,%esp
    2745:	6a 01                	push   $0x1
    2747:	68 01 02 00 00       	push   $0x201
    274c:	52                   	push   %edx
    274d:	50                   	push   %eax
    274e:	ff 75 08             	pushl  0x8(%ebp)
    2751:	e8 d7 e5 ff ff       	call   d2d <redircmd>
    2756:	83 c4 20             	add    $0x20,%esp
    2759:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    275c:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    275d:	83 ec 04             	sub    $0x4,%esp
    2760:	68 ca 38 00 00       	push   $0x38ca
    2765:	ff 75 10             	pushl  0x10(%ebp)
    2768:	ff 75 0c             	pushl  0xc(%ebp)
    276b:	e8 a6 fc ff ff       	call   2416 <peek>
    2770:	83 c4 10             	add    $0x10,%esp
    2773:	85 c0                	test   %eax,%eax
    2775:	0f 85 2c ff ff ff    	jne    26a7 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    277b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    277e:	c9                   	leave  
    277f:	c3                   	ret    

00002780 <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    2780:	55                   	push   %ebp
    2781:	89 e5                	mov    %esp,%ebp
    2783:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2786:	83 ec 04             	sub    $0x4,%esp
    2789:	68 cd 38 00 00       	push   $0x38cd
    278e:	ff 75 0c             	pushl  0xc(%ebp)
    2791:	ff 75 08             	pushl  0x8(%ebp)
    2794:	e8 7d fc ff ff       	call   2416 <peek>
    2799:	83 c4 10             	add    $0x10,%esp
    279c:	85 c0                	test   %eax,%eax
    279e:	75 10                	jne    27b0 <parseblock+0x30>
    panic1("parseblock");
    27a0:	83 ec 0c             	sub    $0xc,%esp
    27a3:	68 cf 38 00 00       	push   $0x38cf
    27a8:	e8 ad e1 ff ff       	call   95a <panic1>
    27ad:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    27b0:	6a 00                	push   $0x0
    27b2:	6a 00                	push   $0x0
    27b4:	ff 75 0c             	pushl  0xc(%ebp)
    27b7:	ff 75 08             	pushl  0x8(%ebp)
    27ba:	e8 06 fb ff ff       	call   22c5 <gettoken>
    27bf:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    27c2:	83 ec 08             	sub    $0x8,%esp
    27c5:	ff 75 0c             	pushl  0xc(%ebp)
    27c8:	ff 75 08             	pushl  0x8(%ebp)
    27cb:	e8 b1 fd ff ff       	call   2581 <parseline>
    27d0:	83 c4 10             	add    $0x10,%esp
    27d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    27d6:	83 ec 04             	sub    $0x4,%esp
    27d9:	68 da 38 00 00       	push   $0x38da
    27de:	ff 75 0c             	pushl  0xc(%ebp)
    27e1:	ff 75 08             	pushl  0x8(%ebp)
    27e4:	e8 2d fc ff ff       	call   2416 <peek>
    27e9:	83 c4 10             	add    $0x10,%esp
    27ec:	85 c0                	test   %eax,%eax
    27ee:	75 10                	jne    2800 <parseblock+0x80>
    panic1("syntax - missing )");
    27f0:	83 ec 0c             	sub    $0xc,%esp
    27f3:	68 dc 38 00 00       	push   $0x38dc
    27f8:	e8 5d e1 ff ff       	call   95a <panic1>
    27fd:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2800:	6a 00                	push   $0x0
    2802:	6a 00                	push   $0x0
    2804:	ff 75 0c             	pushl  0xc(%ebp)
    2807:	ff 75 08             	pushl  0x8(%ebp)
    280a:	e8 b6 fa ff ff       	call   22c5 <gettoken>
    280f:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    2812:	83 ec 04             	sub    $0x4,%esp
    2815:	ff 75 0c             	pushl  0xc(%ebp)
    2818:	ff 75 08             	pushl  0x8(%ebp)
    281b:	ff 75 f4             	pushl  -0xc(%ebp)
    281e:	e8 79 fe ff ff       	call   269c <parseredirs>
    2823:	83 c4 10             	add    $0x10,%esp
    2826:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    2829:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    282c:	c9                   	leave  
    282d:	c3                   	ret    

0000282e <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    282e:	55                   	push   %ebp
    282f:	89 e5                	mov    %esp,%ebp
    2831:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    2834:	83 ec 04             	sub    $0x4,%esp
    2837:	68 cd 38 00 00       	push   $0x38cd
    283c:	ff 75 0c             	pushl  0xc(%ebp)
    283f:	ff 75 08             	pushl  0x8(%ebp)
    2842:	e8 cf fb ff ff       	call   2416 <peek>
    2847:	83 c4 10             	add    $0x10,%esp
    284a:	85 c0                	test   %eax,%eax
    284c:	74 16                	je     2864 <parseexec+0x36>
    return parseblock(ps, es);
    284e:	83 ec 08             	sub    $0x8,%esp
    2851:	ff 75 0c             	pushl  0xc(%ebp)
    2854:	ff 75 08             	pushl  0x8(%ebp)
    2857:	e8 24 ff ff ff       	call   2780 <parseblock>
    285c:	83 c4 10             	add    $0x10,%esp
    285f:	e9 fb 00 00 00       	jmp    295f <parseexec+0x131>

  ret = execcmd();
    2864:	e8 8e e4 ff ff       	call   cf7 <execcmd>
    2869:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    286c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    286f:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2872:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2879:	83 ec 04             	sub    $0x4,%esp
    287c:	ff 75 0c             	pushl  0xc(%ebp)
    287f:	ff 75 08             	pushl  0x8(%ebp)
    2882:	ff 75 f0             	pushl  -0x10(%ebp)
    2885:	e8 12 fe ff ff       	call   269c <parseredirs>
    288a:	83 c4 10             	add    $0x10,%esp
    288d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    2890:	e9 87 00 00 00       	jmp    291c <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2895:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2898:	50                   	push   %eax
    2899:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    289c:	50                   	push   %eax
    289d:	ff 75 0c             	pushl  0xc(%ebp)
    28a0:	ff 75 08             	pushl  0x8(%ebp)
    28a3:	e8 1d fa ff ff       	call   22c5 <gettoken>
    28a8:	83 c4 10             	add    $0x10,%esp
    28ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
    28ae:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    28b2:	0f 84 84 00 00 00    	je     293c <parseexec+0x10e>
      break;
    if(tok != 'a')
    28b8:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    28bc:	74 10                	je     28ce <parseexec+0xa0>
      panic1("syntax");
    28be:	83 ec 0c             	sub    $0xc,%esp
    28c1:	68 a0 38 00 00       	push   $0x38a0
    28c6:	e8 8f e0 ff ff       	call   95a <panic1>
    28cb:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    28ce:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    28d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    28d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    28d7:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    28db:	8b 55 e0             	mov    -0x20(%ebp),%edx
    28de:	8b 45 ec             	mov    -0x14(%ebp),%eax
    28e1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    28e4:	83 c1 08             	add    $0x8,%ecx
    28e7:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    28eb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    28ef:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    28f3:	7e 10                	jle    2905 <parseexec+0xd7>
      panic1("too many args");
    28f5:	83 ec 0c             	sub    $0xc,%esp
    28f8:	68 ef 38 00 00       	push   $0x38ef
    28fd:	e8 58 e0 ff ff       	call   95a <panic1>
    2902:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2905:	83 ec 04             	sub    $0x4,%esp
    2908:	ff 75 0c             	pushl  0xc(%ebp)
    290b:	ff 75 08             	pushl  0x8(%ebp)
    290e:	ff 75 f0             	pushl  -0x10(%ebp)
    2911:	e8 86 fd ff ff       	call   269c <parseredirs>
    2916:	83 c4 10             	add    $0x10,%esp
    2919:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    291c:	83 ec 04             	sub    $0x4,%esp
    291f:	68 fd 38 00 00       	push   $0x38fd
    2924:	ff 75 0c             	pushl  0xc(%ebp)
    2927:	ff 75 08             	pushl  0x8(%ebp)
    292a:	e8 e7 fa ff ff       	call   2416 <peek>
    292f:	83 c4 10             	add    $0x10,%esp
    2932:	85 c0                	test   %eax,%eax
    2934:	0f 84 5b ff ff ff    	je     2895 <parseexec+0x67>
    293a:	eb 01                	jmp    293d <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    293c:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    293d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2940:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2943:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    294a:	00 
  cmd->eargv[argc] = 0;
    294b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    294e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2951:	83 c2 08             	add    $0x8,%edx
    2954:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    295b:	00 
  return ret;
    295c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    295f:	c9                   	leave  
    2960:	c3                   	ret    

00002961 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2961:	55                   	push   %ebp
    2962:	89 e5                	mov    %esp,%ebp
    2964:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2967:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    296b:	75 0a                	jne    2977 <nulterminate+0x16>
    return 0;
    296d:	b8 00 00 00 00       	mov    $0x0,%eax
    2972:	e9 e4 00 00 00       	jmp    2a5b <nulterminate+0xfa>
  
  switch(cmd->type){
    2977:	8b 45 08             	mov    0x8(%ebp),%eax
    297a:	8b 00                	mov    (%eax),%eax
    297c:	83 f8 05             	cmp    $0x5,%eax
    297f:	0f 87 d3 00 00 00    	ja     2a58 <nulterminate+0xf7>
    2985:	8b 04 85 04 39 00 00 	mov    0x3904(,%eax,4),%eax
    298c:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    298e:	8b 45 08             	mov    0x8(%ebp),%eax
    2991:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2994:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    299b:	eb 14                	jmp    29b1 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    299d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29a3:	83 c2 08             	add    $0x8,%edx
    29a6:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    29aa:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    29ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    29b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29b4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29b7:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    29bb:	85 c0                	test   %eax,%eax
    29bd:	75 de                	jne    299d <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    29bf:	e9 94 00 00 00       	jmp    2a58 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    29c4:	8b 45 08             	mov    0x8(%ebp),%eax
    29c7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    29ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29cd:	8b 40 04             	mov    0x4(%eax),%eax
    29d0:	83 ec 0c             	sub    $0xc,%esp
    29d3:	50                   	push   %eax
    29d4:	e8 88 ff ff ff       	call   2961 <nulterminate>
    29d9:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    29dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29df:	8b 40 0c             	mov    0xc(%eax),%eax
    29e2:	c6 00 00             	movb   $0x0,(%eax)
    break;
    29e5:	eb 71                	jmp    2a58 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    29e7:	8b 45 08             	mov    0x8(%ebp),%eax
    29ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    29ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
    29f0:	8b 40 04             	mov    0x4(%eax),%eax
    29f3:	83 ec 0c             	sub    $0xc,%esp
    29f6:	50                   	push   %eax
    29f7:	e8 65 ff ff ff       	call   2961 <nulterminate>
    29fc:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    29ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a02:	8b 40 08             	mov    0x8(%eax),%eax
    2a05:	83 ec 0c             	sub    $0xc,%esp
    2a08:	50                   	push   %eax
    2a09:	e8 53 ff ff ff       	call   2961 <nulterminate>
    2a0e:	83 c4 10             	add    $0x10,%esp
    break;
    2a11:	eb 45                	jmp    2a58 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2a13:	8b 45 08             	mov    0x8(%ebp),%eax
    2a16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2a19:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2a1c:	8b 40 04             	mov    0x4(%eax),%eax
    2a1f:	83 ec 0c             	sub    $0xc,%esp
    2a22:	50                   	push   %eax
    2a23:	e8 39 ff ff ff       	call   2961 <nulterminate>
    2a28:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2a2b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2a2e:	8b 40 08             	mov    0x8(%eax),%eax
    2a31:	83 ec 0c             	sub    $0xc,%esp
    2a34:	50                   	push   %eax
    2a35:	e8 27 ff ff ff       	call   2961 <nulterminate>
    2a3a:	83 c4 10             	add    $0x10,%esp
    break;
    2a3d:	eb 19                	jmp    2a58 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2a3f:	8b 45 08             	mov    0x8(%ebp),%eax
    2a42:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2a45:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2a48:	8b 40 04             	mov    0x4(%eax),%eax
    2a4b:	83 ec 0c             	sub    $0xc,%esp
    2a4e:	50                   	push   %eax
    2a4f:	e8 0d ff ff ff       	call   2961 <nulterminate>
    2a54:	83 c4 10             	add    $0x10,%esp
    break;
    2a57:	90                   	nop
  }
  return cmd;
    2a58:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2a5b:	c9                   	leave  
    2a5c:	c3                   	ret    

00002a5d <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2a5d:	55                   	push   %ebp
    2a5e:	89 e5                	mov    %esp,%ebp
    2a60:	83 ec 18             	sub    $0x18,%esp
    2a63:	8b 45 08             	mov    0x8(%ebp),%eax
    2a66:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2a69:	83 ec 08             	sub    $0x8,%esp
    2a6c:	ff 75 18             	pushl  0x18(%ebp)
    2a6f:	ff 75 14             	pushl  0x14(%ebp)
    2a72:	ff 75 10             	pushl  0x10(%ebp)
    2a75:	ff 75 0c             	pushl  0xc(%ebp)
    2a78:	6a 01                	push   $0x1
    2a7a:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2a7d:	50                   	push   %eax
    2a7e:	e8 e6 d8 ff ff       	call   369 <colorwrite>
    2a83:	83 c4 20             	add    $0x20,%esp
}
    2a86:	90                   	nop
    2a87:	c9                   	leave  
    2a88:	c3                   	ret    

00002a89 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2a89:	55                   	push   %ebp
    2a8a:	89 e5                	mov    %esp,%ebp
    2a8c:	53                   	push   %ebx
    2a8d:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2a90:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2a97:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2a9b:	74 17                	je     2ab4 <color_printint+0x2b>
    2a9d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2aa1:	79 11                	jns    2ab4 <color_printint+0x2b>
    neg = 1;
    2aa3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2aaa:	8b 45 08             	mov    0x8(%ebp),%eax
    2aad:	f7 d8                	neg    %eax
    2aaf:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2ab2:	eb 06                	jmp    2aba <color_printint+0x31>
  } else {
    x = xx;
    2ab4:	8b 45 08             	mov    0x8(%ebp),%eax
    2ab7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2aba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2ac1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2ac4:	8d 41 01             	lea    0x1(%ecx),%eax
    2ac7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2aca:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2acd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ad0:	ba 00 00 00 00       	mov    $0x0,%edx
    2ad5:	f7 f3                	div    %ebx
    2ad7:	89 d0                	mov    %edx,%eax
    2ad9:	0f b6 80 c4 43 00 00 	movzbl 0x43c4(%eax),%eax
    2ae0:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2ae4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2ae7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2aea:	ba 00 00 00 00       	mov    $0x0,%edx
    2aef:	f7 f3                	div    %ebx
    2af1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2af4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2af8:	75 c7                	jne    2ac1 <color_printint+0x38>
  if(neg)
    2afa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2afe:	74 36                	je     2b36 <color_printint+0xad>
    buf[i++] = '-';
    2b00:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b03:	8d 50 01             	lea    0x1(%eax),%edx
    2b06:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2b09:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2b0e:	eb 26                	jmp    2b36 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2b10:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b16:	01 d0                	add    %edx,%eax
    2b18:	0f b6 00             	movzbl (%eax),%eax
    2b1b:	0f be c0             	movsbl %al,%eax
    2b1e:	83 ec 0c             	sub    $0xc,%esp
    2b21:	ff 75 20             	pushl  0x20(%ebp)
    2b24:	ff 75 1c             	pushl  0x1c(%ebp)
    2b27:	ff 75 18             	pushl  0x18(%ebp)
    2b2a:	ff 75 14             	pushl  0x14(%ebp)
    2b2d:	50                   	push   %eax
    2b2e:	e8 2a ff ff ff       	call   2a5d <color_putc>
    2b33:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2b36:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2b3a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b3e:	79 d0                	jns    2b10 <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2b40:	90                   	nop
    2b41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b44:	c9                   	leave  
    2b45:	c3                   	ret    

00002b46 <getInteger>:

static int getInteger(double num)
{
    2b46:	55                   	push   %ebp
    2b47:	89 e5                	mov    %esp,%ebp
    2b49:	83 ec 18             	sub    $0x18,%esp
    2b4c:	8b 45 08             	mov    0x8(%ebp),%eax
    2b4f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2b52:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b55:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2b58:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2b5f:	eb 0e                	jmp    2b6f <getInteger+0x29>
  {
    num -= 1;
    2b61:	dd 45 e8             	fldl   -0x18(%ebp)
    2b64:	d9 e8                	fld1   
    2b66:	de e9                	fsubrp %st,%st(1)
    2b68:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2b6b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2b6f:	dd 45 e8             	fldl   -0x18(%ebp)
    2b72:	d9 e8                	fld1   
    2b74:	d9 c9                	fxch   %st(1)
    2b76:	df e9                	fucomip %st(1),%st
    2b78:	dd d8                	fstp   %st(0)
    2b7a:	77 e5                	ja     2b61 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2b7c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2b7f:	c9                   	leave  
    2b80:	c3                   	ret    

00002b81 <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2b81:	55                   	push   %ebp
    2b82:	89 e5                	mov    %esp,%ebp
    2b84:	83 ec 28             	sub    $0x28,%esp
    2b87:	8b 45 08             	mov    0x8(%ebp),%eax
    2b8a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2b8d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b90:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2b93:	d9 ee                	fldz   
    2b95:	dd 45 e0             	fldl   -0x20(%ebp)
    2b98:	d9 c9                	fxch   %st(1)
    2b9a:	df e9                	fucomip %st(1),%st
    2b9c:	dd d8                	fstp   %st(0)
    2b9e:	76 21                	jbe    2bc1 <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2ba0:	83 ec 0c             	sub    $0xc,%esp
    2ba3:	ff 75 1c             	pushl  0x1c(%ebp)
    2ba6:	ff 75 18             	pushl  0x18(%ebp)
    2ba9:	ff 75 14             	pushl  0x14(%ebp)
    2bac:	ff 75 10             	pushl  0x10(%ebp)
    2baf:	6a 2d                	push   $0x2d
    2bb1:	e8 a7 fe ff ff       	call   2a5d <color_putc>
    2bb6:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2bb9:	dd 45 e0             	fldl   -0x20(%ebp)
    2bbc:	d9 e0                	fchs   
    2bbe:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2bc1:	83 ec 08             	sub    $0x8,%esp
    2bc4:	ff 75 e4             	pushl  -0x1c(%ebp)
    2bc7:	ff 75 e0             	pushl  -0x20(%ebp)
    2bca:	e8 77 ff ff ff       	call   2b46 <getInteger>
    2bcf:	83 c4 10             	add    $0x10,%esp
    2bd2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2bd5:	83 ec 04             	sub    $0x4,%esp
    2bd8:	ff 75 1c             	pushl  0x1c(%ebp)
    2bdb:	ff 75 18             	pushl  0x18(%ebp)
    2bde:	ff 75 14             	pushl  0x14(%ebp)
    2be1:	ff 75 10             	pushl  0x10(%ebp)
    2be4:	6a 01                	push   $0x1
    2be6:	6a 0a                	push   $0xa
    2be8:	ff 75 f0             	pushl  -0x10(%ebp)
    2beb:	e8 99 fe ff ff       	call   2a89 <color_printint>
    2bf0:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2bf3:	db 45 f0             	fildl  -0x10(%ebp)
    2bf6:	dd 45 e0             	fldl   -0x20(%ebp)
    2bf9:	de e1                	fsubp  %st,%st(1)
    2bfb:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2bfe:	dd 45 e0             	fldl   -0x20(%ebp)
    2c01:	dd 05 28 39 00 00    	fldl   0x3928
    2c07:	d9 c9                	fxch   %st(1)
    2c09:	df e9                	fucomip %st(1),%st
    2c0b:	dd d8                	fstp   %st(0)
    2c0d:	76 19                	jbe    2c28 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2c0f:	83 ec 0c             	sub    $0xc,%esp
    2c12:	ff 75 1c             	pushl  0x1c(%ebp)
    2c15:	ff 75 18             	pushl  0x18(%ebp)
    2c18:	ff 75 14             	pushl  0x14(%ebp)
    2c1b:	ff 75 10             	pushl  0x10(%ebp)
    2c1e:	6a 2e                	push   $0x2e
    2c20:	e8 38 fe ff ff       	call   2a5d <color_putc>
    2c25:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2c28:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2c2f:	eb 55                	jmp    2c86 <color_printdbl+0x105>
  {
    num = num*10;
    2c31:	dd 45 e0             	fldl   -0x20(%ebp)
    2c34:	dd 05 30 39 00 00    	fldl   0x3930
    2c3a:	de c9                	fmulp  %st,%st(1)
    2c3c:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2c3f:	83 ec 08             	sub    $0x8,%esp
    2c42:	ff 75 e4             	pushl  -0x1c(%ebp)
    2c45:	ff 75 e0             	pushl  -0x20(%ebp)
    2c48:	e8 f9 fe ff ff       	call   2b46 <getInteger>
    2c4d:	83 c4 10             	add    $0x10,%esp
    2c50:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2c53:	83 ec 04             	sub    $0x4,%esp
    2c56:	ff 75 1c             	pushl  0x1c(%ebp)
    2c59:	ff 75 18             	pushl  0x18(%ebp)
    2c5c:	ff 75 14             	pushl  0x14(%ebp)
    2c5f:	ff 75 10             	pushl  0x10(%ebp)
    2c62:	6a 01                	push   $0x1
    2c64:	6a 0a                	push   $0xa
    2c66:	ff 75 f0             	pushl  -0x10(%ebp)
    2c69:	e8 1b fe ff ff       	call   2a89 <color_printint>
    2c6e:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2c71:	db 45 f0             	fildl  -0x10(%ebp)
    2c74:	dd 45 e0             	fldl   -0x20(%ebp)
    2c77:	de e1                	fsubp  %st,%st(1)
    2c79:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2c7c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2c80:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2c84:	7f 13                	jg     2c99 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2c86:	dd 45 e0             	fldl   -0x20(%ebp)
    2c89:	dd 05 28 39 00 00    	fldl   0x3928
    2c8f:	d9 c9                	fxch   %st(1)
    2c91:	df e9                	fucomip %st(1),%st
    2c93:	dd d8                	fstp   %st(0)
    2c95:	77 9a                	ja     2c31 <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2c97:	eb 01                	jmp    2c9a <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2c99:	90                   	nop
    }
  }
}
    2c9a:	90                   	nop
    2c9b:	c9                   	leave  
    2c9c:	c3                   	ret    

00002c9d <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2c9d:	55                   	push   %ebp
    2c9e:	89 e5                	mov    %esp,%ebp
    2ca0:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2ca3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2caa:	8d 45 18             	lea    0x18(%ebp),%eax
    2cad:	83 c0 04             	add    $0x4,%eax
    2cb0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2cb3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2cba:	e9 e2 01 00 00       	jmp    2ea1 <color_printf+0x204>
    c = fmt[i] & 0xff;
    2cbf:	8b 55 18             	mov    0x18(%ebp),%edx
    2cc2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2cc5:	01 d0                	add    %edx,%eax
    2cc7:	0f b6 00             	movzbl (%eax),%eax
    2cca:	0f be c0             	movsbl %al,%eax
    2ccd:	25 ff 00 00 00       	and    $0xff,%eax
    2cd2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2cd5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2cd9:	75 35                	jne    2d10 <color_printf+0x73>
      if(c == '%'){
    2cdb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2cdf:	75 0c                	jne    2ced <color_printf+0x50>
        state = '%';
    2ce1:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2ce8:	e9 b0 01 00 00       	jmp    2e9d <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2ced:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2cf0:	0f be c0             	movsbl %al,%eax
    2cf3:	83 ec 0c             	sub    $0xc,%esp
    2cf6:	ff 75 14             	pushl  0x14(%ebp)
    2cf9:	ff 75 10             	pushl  0x10(%ebp)
    2cfc:	ff 75 0c             	pushl  0xc(%ebp)
    2cff:	ff 75 08             	pushl  0x8(%ebp)
    2d02:	50                   	push   %eax
    2d03:	e8 55 fd ff ff       	call   2a5d <color_putc>
    2d08:	83 c4 20             	add    $0x20,%esp
    2d0b:	e9 8d 01 00 00       	jmp    2e9d <color_printf+0x200>
      }
    } else if(state == '%'){
    2d10:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2d14:	0f 85 83 01 00 00    	jne    2e9d <color_printf+0x200>
      if(c == 'd'){
    2d1a:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2d1e:	75 2a                	jne    2d4a <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2d20:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d23:	8b 00                	mov    (%eax),%eax
    2d25:	83 ec 04             	sub    $0x4,%esp
    2d28:	ff 75 14             	pushl  0x14(%ebp)
    2d2b:	ff 75 10             	pushl  0x10(%ebp)
    2d2e:	ff 75 0c             	pushl  0xc(%ebp)
    2d31:	ff 75 08             	pushl  0x8(%ebp)
    2d34:	6a 01                	push   $0x1
    2d36:	6a 0a                	push   $0xa
    2d38:	50                   	push   %eax
    2d39:	e8 4b fd ff ff       	call   2a89 <color_printint>
    2d3e:	83 c4 20             	add    $0x20,%esp
        ap++;
    2d41:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2d45:	e9 4c 01 00 00       	jmp    2e96 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2d4a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2d4e:	74 06                	je     2d56 <color_printf+0xb9>
    2d50:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2d54:	75 2a                	jne    2d80 <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2d56:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d59:	8b 00                	mov    (%eax),%eax
    2d5b:	83 ec 04             	sub    $0x4,%esp
    2d5e:	ff 75 14             	pushl  0x14(%ebp)
    2d61:	ff 75 10             	pushl  0x10(%ebp)
    2d64:	ff 75 0c             	pushl  0xc(%ebp)
    2d67:	ff 75 08             	pushl  0x8(%ebp)
    2d6a:	6a 00                	push   $0x0
    2d6c:	6a 10                	push   $0x10
    2d6e:	50                   	push   %eax
    2d6f:	e8 15 fd ff ff       	call   2a89 <color_printint>
    2d74:	83 c4 20             	add    $0x20,%esp
        ap++;
    2d77:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2d7b:	e9 16 01 00 00       	jmp    2e96 <color_printf+0x1f9>
      } else if(c == 's'){
    2d80:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2d84:	75 4f                	jne    2dd5 <color_printf+0x138>
        s = (char*)*ap;
    2d86:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d89:	8b 00                	mov    (%eax),%eax
    2d8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2d8e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2d92:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2d96:	75 2e                	jne    2dc6 <color_printf+0x129>
          s = "(null)";
    2d98:	c7 45 f4 20 39 00 00 	movl   $0x3920,-0xc(%ebp)
        while(*s != 0){
    2d9f:	eb 25                	jmp    2dc6 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2da1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2da4:	0f b6 00             	movzbl (%eax),%eax
    2da7:	0f be c0             	movsbl %al,%eax
    2daa:	83 ec 0c             	sub    $0xc,%esp
    2dad:	ff 75 14             	pushl  0x14(%ebp)
    2db0:	ff 75 10             	pushl  0x10(%ebp)
    2db3:	ff 75 0c             	pushl  0xc(%ebp)
    2db6:	ff 75 08             	pushl  0x8(%ebp)
    2db9:	50                   	push   %eax
    2dba:	e8 9e fc ff ff       	call   2a5d <color_putc>
    2dbf:	83 c4 20             	add    $0x20,%esp
          s++;
    2dc2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2dc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dc9:	0f b6 00             	movzbl (%eax),%eax
    2dcc:	84 c0                	test   %al,%al
    2dce:	75 d1                	jne    2da1 <color_printf+0x104>
    2dd0:	e9 c1 00 00 00       	jmp    2e96 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2dd5:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2dd9:	75 29                	jne    2e04 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2ddb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2dde:	8b 00                	mov    (%eax),%eax
    2de0:	0f be c0             	movsbl %al,%eax
    2de3:	83 ec 0c             	sub    $0xc,%esp
    2de6:	ff 75 14             	pushl  0x14(%ebp)
    2de9:	ff 75 10             	pushl  0x10(%ebp)
    2dec:	ff 75 0c             	pushl  0xc(%ebp)
    2def:	ff 75 08             	pushl  0x8(%ebp)
    2df2:	50                   	push   %eax
    2df3:	e8 65 fc ff ff       	call   2a5d <color_putc>
    2df8:	83 c4 20             	add    $0x20,%esp
        ap++;
    2dfb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2dff:	e9 92 00 00 00       	jmp    2e96 <color_printf+0x1f9>
      } else if(c == '%'){
    2e04:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2e08:	75 20                	jne    2e2a <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2e0a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e0d:	0f be c0             	movsbl %al,%eax
    2e10:	83 ec 0c             	sub    $0xc,%esp
    2e13:	ff 75 14             	pushl  0x14(%ebp)
    2e16:	ff 75 10             	pushl  0x10(%ebp)
    2e19:	ff 75 0c             	pushl  0xc(%ebp)
    2e1c:	ff 75 08             	pushl  0x8(%ebp)
    2e1f:	50                   	push   %eax
    2e20:	e8 38 fc ff ff       	call   2a5d <color_putc>
    2e25:	83 c4 20             	add    $0x20,%esp
    2e28:	eb 6c                	jmp    2e96 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    2e2a:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    2e2e:	75 2f                	jne    2e5f <color_printf+0x1c2>
        double *dap = (double*)ap;
    2e30:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e33:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    2e36:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2e39:	dd 00                	fldl   (%eax)
    2e3b:	83 ec 08             	sub    $0x8,%esp
    2e3e:	ff 75 14             	pushl  0x14(%ebp)
    2e41:	ff 75 10             	pushl  0x10(%ebp)
    2e44:	ff 75 0c             	pushl  0xc(%ebp)
    2e47:	ff 75 08             	pushl  0x8(%ebp)
    2e4a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2e4e:	dd 1c 24             	fstpl  (%esp)
    2e51:	e8 2b fd ff ff       	call   2b81 <color_printdbl>
    2e56:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    2e59:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    2e5d:	eb 37                	jmp    2e96 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    2e5f:	83 ec 0c             	sub    $0xc,%esp
    2e62:	ff 75 14             	pushl  0x14(%ebp)
    2e65:	ff 75 10             	pushl  0x10(%ebp)
    2e68:	ff 75 0c             	pushl  0xc(%ebp)
    2e6b:	ff 75 08             	pushl  0x8(%ebp)
    2e6e:	6a 25                	push   $0x25
    2e70:	e8 e8 fb ff ff       	call   2a5d <color_putc>
    2e75:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    2e78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e7b:	0f be c0             	movsbl %al,%eax
    2e7e:	83 ec 0c             	sub    $0xc,%esp
    2e81:	ff 75 14             	pushl  0x14(%ebp)
    2e84:	ff 75 10             	pushl  0x10(%ebp)
    2e87:	ff 75 0c             	pushl  0xc(%ebp)
    2e8a:	ff 75 08             	pushl  0x8(%ebp)
    2e8d:	50                   	push   %eax
    2e8e:	e8 ca fb ff ff       	call   2a5d <color_putc>
    2e93:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    2e96:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2e9d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2ea1:	8b 55 18             	mov    0x18(%ebp),%edx
    2ea4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ea7:	01 d0                	add    %edx,%eax
    2ea9:	0f b6 00             	movzbl (%eax),%eax
    2eac:	84 c0                	test   %al,%al
    2eae:	0f 85 0b fe ff ff    	jne    2cbf <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    2eb4:	90                   	nop
    2eb5:	c9                   	leave  
    2eb6:	c3                   	ret    

00002eb7 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    2eb7:	55                   	push   %ebp
    2eb8:	89 e5                	mov    %esp,%ebp
    2eba:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    2ebd:	83 ec 0c             	sub    $0xc,%esp
    2ec0:	6a 58                	push   $0x58
    2ec2:	e8 b0 d9 ff ff       	call   877 <malloc>
    2ec7:	83 c4 10             	add    $0x10,%esp
    2eca:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2ecd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ed0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2ed6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ed9:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    2ee0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2ee3:	c9                   	leave  
    2ee4:	c3                   	ret    

00002ee5 <pushi>:

void pushi(struct istack *s, int val)
{
    2ee5:	55                   	push   %ebp
    2ee6:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    2ee8:	8b 45 08             	mov    0x8(%ebp),%eax
    2eeb:	8b 00                	mov    (%eax),%eax
    2eed:	83 f8 13             	cmp    $0x13,%eax
    2ef0:	7f 2c                	jg     2f1e <pushi+0x39>
    {
        s->size++;
    2ef2:	8b 45 08             	mov    0x8(%ebp),%eax
    2ef5:	8b 00                	mov    (%eax),%eax
    2ef7:	8d 50 01             	lea    0x1(%eax),%edx
    2efa:	8b 45 08             	mov    0x8(%ebp),%eax
    2efd:	89 10                	mov    %edx,(%eax)
        s->top++;
    2eff:	8b 45 08             	mov    0x8(%ebp),%eax
    2f02:	8b 40 54             	mov    0x54(%eax),%eax
    2f05:	8d 50 01             	lea    0x1(%eax),%edx
    2f08:	8b 45 08             	mov    0x8(%ebp),%eax
    2f0b:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    2f0e:	8b 45 08             	mov    0x8(%ebp),%eax
    2f11:	8b 50 54             	mov    0x54(%eax),%edx
    2f14:	8b 45 08             	mov    0x8(%ebp),%eax
    2f17:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2f1a:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    2f1e:	90                   	nop
    2f1f:	5d                   	pop    %ebp
    2f20:	c3                   	ret    

00002f21 <popi>:

int popi(struct istack *s)
{
    2f21:	55                   	push   %ebp
    2f22:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2f24:	8b 45 08             	mov    0x8(%ebp),%eax
    2f27:	8b 00                	mov    (%eax),%eax
    2f29:	85 c0                	test   %eax,%eax
    2f2b:	75 07                	jne    2f34 <popi+0x13>
    {
        return -1;
    2f2d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2f32:	eb 2c                	jmp    2f60 <popi+0x3f>
    }
    s->size--;
    2f34:	8b 45 08             	mov    0x8(%ebp),%eax
    2f37:	8b 00                	mov    (%eax),%eax
    2f39:	8d 50 ff             	lea    -0x1(%eax),%edx
    2f3c:	8b 45 08             	mov    0x8(%ebp),%eax
    2f3f:	89 10                	mov    %edx,(%eax)
    s->top--;
    2f41:	8b 45 08             	mov    0x8(%ebp),%eax
    2f44:	8b 40 54             	mov    0x54(%eax),%eax
    2f47:	8d 50 ff             	lea    -0x1(%eax),%edx
    2f4a:	8b 45 08             	mov    0x8(%ebp),%eax
    2f4d:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    2f50:	8b 45 08             	mov    0x8(%ebp),%eax
    2f53:	8b 40 54             	mov    0x54(%eax),%eax
    2f56:	8d 50 01             	lea    0x1(%eax),%edx
    2f59:	8b 45 08             	mov    0x8(%ebp),%eax
    2f5c:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2f60:	5d                   	pop    %ebp
    2f61:	c3                   	ret    

00002f62 <topi>:

int topi(struct istack* s)
{
    2f62:	55                   	push   %ebp
    2f63:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    2f65:	8b 45 08             	mov    0x8(%ebp),%eax
    2f68:	8b 50 54             	mov    0x54(%eax),%edx
    2f6b:	8b 45 08             	mov    0x8(%ebp),%eax
    2f6e:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2f72:	5d                   	pop    %ebp
    2f73:	c3                   	ret    

00002f74 <cstack>:

//constructor
struct cstack* cstack()
{
    2f74:	55                   	push   %ebp
    2f75:	89 e5                	mov    %esp,%ebp
    2f77:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    2f7a:	83 ec 0c             	sub    $0xc,%esp
    2f7d:	6a 1c                	push   $0x1c
    2f7f:	e8 f3 d8 ff ff       	call   877 <malloc>
    2f84:	83 c4 10             	add    $0x10,%esp
    2f87:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2f8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f8d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2f93:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f96:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    2f9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2fa0:	c9                   	leave  
    2fa1:	c3                   	ret    

00002fa2 <pushc>:

void pushc(struct cstack *s, char val)
{
    2fa2:	55                   	push   %ebp
    2fa3:	89 e5                	mov    %esp,%ebp
    2fa5:	83 ec 04             	sub    $0x4,%esp
    2fa8:	8b 45 0c             	mov    0xc(%ebp),%eax
    2fab:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    2fae:	8b 45 08             	mov    0x8(%ebp),%eax
    2fb1:	8b 00                	mov    (%eax),%eax
    2fb3:	83 f8 13             	cmp    $0x13,%eax
    2fb6:	7f 2d                	jg     2fe5 <pushc+0x43>
    {
        s->size++;
    2fb8:	8b 45 08             	mov    0x8(%ebp),%eax
    2fbb:	8b 00                	mov    (%eax),%eax
    2fbd:	8d 50 01             	lea    0x1(%eax),%edx
    2fc0:	8b 45 08             	mov    0x8(%ebp),%eax
    2fc3:	89 10                	mov    %edx,(%eax)
        s->top++;
    2fc5:	8b 45 08             	mov    0x8(%ebp),%eax
    2fc8:	8b 40 18             	mov    0x18(%eax),%eax
    2fcb:	8d 50 01             	lea    0x1(%eax),%edx
    2fce:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd1:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    2fd4:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd7:	8b 40 18             	mov    0x18(%eax),%eax
    2fda:	8b 55 08             	mov    0x8(%ebp),%edx
    2fdd:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    2fe1:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    2fe5:	90                   	nop
    2fe6:	c9                   	leave  
    2fe7:	c3                   	ret    

00002fe8 <popc>:

char popc(struct cstack *s)
{
    2fe8:	55                   	push   %ebp
    2fe9:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2feb:	8b 45 08             	mov    0x8(%ebp),%eax
    2fee:	8b 00                	mov    (%eax),%eax
    2ff0:	85 c0                	test   %eax,%eax
    2ff2:	75 07                	jne    2ffb <popc+0x13>
    {
        return -1;
    2ff4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2ff9:	eb 2d                	jmp    3028 <popc+0x40>
    }
    s->size--;
    2ffb:	8b 45 08             	mov    0x8(%ebp),%eax
    2ffe:	8b 00                	mov    (%eax),%eax
    3000:	8d 50 ff             	lea    -0x1(%eax),%edx
    3003:	8b 45 08             	mov    0x8(%ebp),%eax
    3006:	89 10                	mov    %edx,(%eax)
    s->top--;
    3008:	8b 45 08             	mov    0x8(%ebp),%eax
    300b:	8b 40 18             	mov    0x18(%eax),%eax
    300e:	8d 50 ff             	lea    -0x1(%eax),%edx
    3011:	8b 45 08             	mov    0x8(%ebp),%eax
    3014:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    3017:	8b 45 08             	mov    0x8(%ebp),%eax
    301a:	8b 40 18             	mov    0x18(%eax),%eax
    301d:	8d 50 01             	lea    0x1(%eax),%edx
    3020:	8b 45 08             	mov    0x8(%ebp),%eax
    3023:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    3028:	5d                   	pop    %ebp
    3029:	c3                   	ret    

0000302a <topc>:

char topc(struct cstack* s)
{
    302a:	55                   	push   %ebp
    302b:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    302d:	8b 45 08             	mov    0x8(%ebp),%eax
    3030:	8b 40 18             	mov    0x18(%eax),%eax
    3033:	8b 55 08             	mov    0x8(%ebp),%edx
    3036:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    303b:	5d                   	pop    %ebp
    303c:	c3                   	ret    

0000303d <dstack>:

//constructor
struct dstack* dstack()
{
    303d:	55                   	push   %ebp
    303e:	89 e5                	mov    %esp,%ebp
    3040:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    3043:	83 ec 0c             	sub    $0xc,%esp
    3046:	68 a8 00 00 00       	push   $0xa8
    304b:	e8 27 d8 ff ff       	call   877 <malloc>
    3050:	83 c4 10             	add    $0x10,%esp
    3053:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3056:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3059:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    305f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3062:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    3069:	ff ff ff 
    return stack;
    306c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    306f:	c9                   	leave  
    3070:	c3                   	ret    

00003071 <pushd>:

void pushd(struct dstack *s, double val)
{
    3071:	55                   	push   %ebp
    3072:	89 e5                	mov    %esp,%ebp
    3074:	83 ec 08             	sub    $0x8,%esp
    3077:	8b 45 0c             	mov    0xc(%ebp),%eax
    307a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    307d:	8b 45 10             	mov    0x10(%ebp),%eax
    3080:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3083:	8b 45 08             	mov    0x8(%ebp),%eax
    3086:	8b 00                	mov    (%eax),%eax
    3088:	83 f8 13             	cmp    $0x13,%eax
    308b:	7f 35                	jg     30c2 <pushd+0x51>
    {
        s->size++;
    308d:	8b 45 08             	mov    0x8(%ebp),%eax
    3090:	8b 00                	mov    (%eax),%eax
    3092:	8d 50 01             	lea    0x1(%eax),%edx
    3095:	8b 45 08             	mov    0x8(%ebp),%eax
    3098:	89 10                	mov    %edx,(%eax)
        s->top++;
    309a:	8b 45 08             	mov    0x8(%ebp),%eax
    309d:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    30a3:	8d 50 01             	lea    0x1(%eax),%edx
    30a6:	8b 45 08             	mov    0x8(%ebp),%eax
    30a9:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    30af:	8b 45 08             	mov    0x8(%ebp),%eax
    30b2:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    30b8:	8b 45 08             	mov    0x8(%ebp),%eax
    30bb:	dd 45 f8             	fldl   -0x8(%ebp)
    30be:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    30c2:	90                   	nop
    30c3:	c9                   	leave  
    30c4:	c3                   	ret    

000030c5 <popd>:

double popd(struct dstack *s)
{
    30c5:	55                   	push   %ebp
    30c6:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    30c8:	8b 45 08             	mov    0x8(%ebp),%eax
    30cb:	8b 00                	mov    (%eax),%eax
    30cd:	85 c0                	test   %eax,%eax
    30cf:	75 06                	jne    30d7 <popd+0x12>
    {
        return -1;
    30d1:	d9 e8                	fld1   
    30d3:	d9 e0                	fchs   
    30d5:	eb 35                	jmp    310c <popd+0x47>
    }
    s->size--;
    30d7:	8b 45 08             	mov    0x8(%ebp),%eax
    30da:	8b 00                	mov    (%eax),%eax
    30dc:	8d 50 ff             	lea    -0x1(%eax),%edx
    30df:	8b 45 08             	mov    0x8(%ebp),%eax
    30e2:	89 10                	mov    %edx,(%eax)
    s->top--;
    30e4:	8b 45 08             	mov    0x8(%ebp),%eax
    30e7:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    30ed:	8d 50 ff             	lea    -0x1(%eax),%edx
    30f0:	8b 45 08             	mov    0x8(%ebp),%eax
    30f3:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    30f9:	8b 45 08             	mov    0x8(%ebp),%eax
    30fc:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3102:	8d 50 01             	lea    0x1(%eax),%edx
    3105:	8b 45 08             	mov    0x8(%ebp),%eax
    3108:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    310c:	5d                   	pop    %ebp
    310d:	c3                   	ret    

0000310e <topd>:

double topd(struct dstack* s)
{
    310e:	55                   	push   %ebp
    310f:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3111:	8b 45 08             	mov    0x8(%ebp),%eax
    3114:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    311a:	8b 45 08             	mov    0x8(%ebp),%eax
    311d:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    3121:	5d                   	pop    %ebp
    3122:	c3                   	ret    

00003123 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3123:	55                   	push   %ebp
    3124:	89 e5                	mov    %esp,%ebp
    3126:	53                   	push   %ebx
    3127:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    312d:	83 ec 08             	sub    $0x8,%esp
    3130:	6a 00                	push   $0x0
    3132:	68 38 39 00 00       	push   $0x3938
    3137:	e8 cd d1 ff ff       	call   309 <open>
    313c:	83 c4 10             	add    $0x10,%esp
    313f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3142:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3146:	79 1d                	jns    3165 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    3148:	83 ec 0c             	sub    $0xc,%esp
    314b:	68 42 39 00 00       	push   $0x3942
    3150:	6a 00                	push   $0x0
    3152:	6a 00                	push   $0x0
    3154:	6a 01                	push   $0x1
    3156:	6a 03                	push   $0x3
    3158:	e8 40 fb ff ff       	call   2c9d <color_printf>
    315d:	83 c4 20             	add    $0x20,%esp
    3160:	e9 6d 02 00 00       	jmp    33d2 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    3165:	8b 45 0c             	mov    0xc(%ebp),%eax
    3168:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    316e:	e9 2a 02 00 00       	jmp    339d <readVariables+0x27a>
  {
    int pos = 0;
    3173:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    317a:	00 00 00 
    while(pos <= n-1)
    317d:	e9 07 02 00 00       	jmp    3389 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    3182:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    3189:	eb 24                	jmp    31af <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    318b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    318e:	8d 50 ff             	lea    -0x1(%eax),%edx
    3191:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    3197:	8b 45 f4             	mov    -0xc(%ebp),%eax
    319a:	01 c8                	add    %ecx,%eax
    319c:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    31a3:	ff 
    31a4:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    31ab:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    31af:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    31b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31b8:	01 d0                	add    %edx,%eax
    31ba:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    31c1:	ff 
    31c2:	3c 3d                	cmp    $0x3d,%al
    31c4:	75 c5                	jne    318b <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    31c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31c9:	83 e8 01             	sub    $0x1,%eax
    31cc:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    31d3:	00 
      if(buf[pos] == 'd') //double value
    31d4:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    31da:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    31e1:	ff 
    31e2:	3c 64                	cmp    $0x64,%al
    31e4:	0f 85 a0 00 00 00    	jne    328a <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    31ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    31ed:	8b 00                	mov    (%eax),%eax
    31ef:	c1 e0 05             	shl    $0x5,%eax
    31f2:	89 c2                	mov    %eax,%edx
    31f4:	8b 45 08             	mov    0x8(%ebp),%eax
    31f7:	01 d0                	add    %edx,%eax
    31f9:	8d 50 04             	lea    0x4(%eax),%edx
    31fc:	83 ec 08             	sub    $0x8,%esp
    31ff:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3205:	50                   	push   %eax
    3206:	52                   	push   %edx
    3207:	e8 8c ce ff ff       	call   98 <strcpy>
    320c:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    320f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3212:	8d 50 01             	lea    0x1(%eax),%edx
    3215:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    321b:	01 d0                	add    %edx,%eax
    321d:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    3223:	83 ec 08             	sub    $0x8,%esp
    3226:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    322c:	50                   	push   %eax
    322d:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3233:	50                   	push   %eax
    3234:	e8 7b d9 ff ff       	call   bb4 <Translation>
    3239:	83 c4 10             	add    $0x10,%esp
    323c:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    323f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3242:	8b 00                	mov    (%eax),%eax
    3244:	c1 e0 05             	shl    $0x5,%eax
    3247:	89 c2                	mov    %eax,%edx
    3249:	8b 45 08             	mov    0x8(%ebp),%eax
    324c:	01 d0                	add    %edx,%eax
    324e:	dd 45 d8             	fldl   -0x28(%ebp)
    3251:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    3254:	8b 45 0c             	mov    0xc(%ebp),%eax
    3257:	8b 00                	mov    (%eax),%eax
    3259:	c1 e0 05             	shl    $0x5,%eax
    325c:	89 c2                	mov    %eax,%edx
    325e:	8b 45 08             	mov    0x8(%ebp),%eax
    3261:	01 d0                	add    %edx,%eax
    3263:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    3269:	8b 45 0c             	mov    0xc(%ebp),%eax
    326c:	8b 00                	mov    (%eax),%eax
    326e:	8d 50 01             	lea    0x1(%eax),%edx
    3271:	8b 45 0c             	mov    0xc(%ebp),%eax
    3274:	89 10                	mov    %edx,(%eax)
        pos++;
    3276:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    327c:	83 c0 01             	add    $0x1,%eax
    327f:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    3285:	e9 ff 00 00 00       	jmp    3389 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    328a:	8b 45 0c             	mov    0xc(%ebp),%eax
    328d:	8b 00                	mov    (%eax),%eax
    328f:	c1 e0 05             	shl    $0x5,%eax
    3292:	89 c2                	mov    %eax,%edx
    3294:	8b 45 08             	mov    0x8(%ebp),%eax
    3297:	01 d0                	add    %edx,%eax
    3299:	8d 50 04             	lea    0x4(%eax),%edx
    329c:	83 ec 08             	sub    $0x8,%esp
    329f:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    32a5:	50                   	push   %eax
    32a6:	52                   	push   %edx
    32a7:	e8 ec cd ff ff       	call   98 <strcpy>
    32ac:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    32af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32b2:	8d 50 01             	lea    0x1(%eax),%edx
    32b5:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32bb:	01 d0                	add    %edx,%eax
    32bd:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    32c3:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    32cc:	eb 04                	jmp    32d2 <readVariables+0x1af>
        {
          strend++;
    32ce:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    32d2:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    32d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32db:	01 d0                	add    %edx,%eax
    32dd:	0f b6 00             	movzbl (%eax),%eax
    32e0:	84 c0                	test   %al,%al
    32e2:	75 ea                	jne    32ce <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    32e4:	8b 45 0c             	mov    0xc(%ebp),%eax
    32e7:	8b 00                	mov    (%eax),%eax
    32e9:	c1 e0 05             	shl    $0x5,%eax
    32ec:	89 c2                	mov    %eax,%edx
    32ee:	8b 45 08             	mov    0x8(%ebp),%eax
    32f1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    32f4:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32fa:	8b 55 f0             	mov    -0x10(%ebp),%edx
    32fd:	29 c2                	sub    %eax,%edx
    32ff:	89 d0                	mov    %edx,%eax
    3301:	83 c0 01             	add    $0x1,%eax
    3304:	83 ec 0c             	sub    $0xc,%esp
    3307:	50                   	push   %eax
    3308:	e8 6a d5 ff ff       	call   877 <malloc>
    330d:	83 c4 10             	add    $0x10,%esp
    3310:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    3313:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3319:	89 45 ec             	mov    %eax,-0x14(%ebp)
    331c:	eb 35                	jmp    3353 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    331e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3321:	8b 00                	mov    (%eax),%eax
    3323:	c1 e0 05             	shl    $0x5,%eax
    3326:	89 c2                	mov    %eax,%edx
    3328:	8b 45 08             	mov    0x8(%ebp),%eax
    332b:	01 d0                	add    %edx,%eax
    332d:	8b 40 18             	mov    0x18(%eax),%eax
    3330:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3336:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3339:	29 d1                	sub    %edx,%ecx
    333b:	89 ca                	mov    %ecx,%edx
    333d:	01 c2                	add    %eax,%edx
    333f:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    3345:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3348:	01 c8                	add    %ecx,%eax
    334a:	0f b6 00             	movzbl (%eax),%eax
    334d:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    334f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    3353:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3356:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3359:	7e c3                	jle    331e <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    335b:	8b 45 0c             	mov    0xc(%ebp),%eax
    335e:	8b 00                	mov    (%eax),%eax
    3360:	c1 e0 05             	shl    $0x5,%eax
    3363:	89 c2                	mov    %eax,%edx
    3365:	8b 45 08             	mov    0x8(%ebp),%eax
    3368:	01 d0                	add    %edx,%eax
    336a:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    3370:	8b 45 0c             	mov    0xc(%ebp),%eax
    3373:	8b 00                	mov    (%eax),%eax
    3375:	8d 50 01             	lea    0x1(%eax),%edx
    3378:	8b 45 0c             	mov    0xc(%ebp),%eax
    337b:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    337d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3380:	83 c0 01             	add    $0x1,%eax
    3383:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    3389:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    338c:	8d 50 ff             	lea    -0x1(%eax),%edx
    338f:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3395:	39 c2                	cmp    %eax,%edx
    3397:	0f 8d e5 fd ff ff    	jge    3182 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    339d:	83 ec 04             	sub    $0x4,%esp
    33a0:	68 e8 03 00 00       	push   $0x3e8
    33a5:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    33ab:	50                   	push   %eax
    33ac:	ff 75 e8             	pushl  -0x18(%ebp)
    33af:	e8 2d cf ff ff       	call   2e1 <read>
    33b4:	83 c4 10             	add    $0x10,%esp
    33b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    33ba:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    33be:	0f 8f af fd ff ff    	jg     3173 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    33c4:	83 ec 0c             	sub    $0xc,%esp
    33c7:	ff 75 e8             	pushl  -0x18(%ebp)
    33ca:	e8 22 cf ff ff       	call   2f1 <close>
    33cf:	83 c4 10             	add    $0x10,%esp
}
    33d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    33d5:	c9                   	leave  
    33d6:	c3                   	ret    

000033d7 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    33d7:	55                   	push   %ebp
    33d8:	89 e5                	mov    %esp,%ebp
    33da:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    33e0:	83 ec 08             	sub    $0x8,%esp
    33e3:	6a 02                	push   $0x2
    33e5:	68 38 39 00 00       	push   $0x3938
    33ea:	e8 1a cf ff ff       	call   309 <open>
    33ef:	83 c4 10             	add    $0x10,%esp
    33f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    33f5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    33f9:	78 1e                	js     3419 <writeVariables+0x42>
  {
    close(fd);
    33fb:	83 ec 0c             	sub    $0xc,%esp
    33fe:	ff 75 e4             	pushl  -0x1c(%ebp)
    3401:	e8 eb ce ff ff       	call   2f1 <close>
    3406:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    3409:	83 ec 0c             	sub    $0xc,%esp
    340c:	68 38 39 00 00       	push   $0x3938
    3411:	e8 03 cf ff ff       	call   319 <unlink>
    3416:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    3419:	83 ec 08             	sub    $0x8,%esp
    341c:	68 02 02 00 00       	push   $0x202
    3421:	68 38 39 00 00       	push   $0x3938
    3426:	e8 de ce ff ff       	call   309 <open>
    342b:	83 c4 10             	add    $0x10,%esp
    342e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    3431:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3438:	e9 ff 01 00 00       	jmp    363c <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    343d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3440:	c1 e0 05             	shl    $0x5,%eax
    3443:	89 c2                	mov    %eax,%edx
    3445:	8b 45 08             	mov    0x8(%ebp),%eax
    3448:	01 d0                	add    %edx,%eax
    344a:	8b 00                	mov    (%eax),%eax
    344c:	83 f8 01             	cmp    $0x1,%eax
    344f:	0f 85 d3 00 00 00    	jne    3528 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    3455:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    345c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    345f:	8d 50 01             	lea    0x1(%eax),%edx
    3462:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3465:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    346c:	64 
      int k=0;
    346d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    3474:	eb 2c                	jmp    34a2 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    3476:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3479:	8d 50 01             	lea    0x1(%eax),%edx
    347c:	89 55 e0             	mov    %edx,-0x20(%ebp)
    347f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3482:	89 d1                	mov    %edx,%ecx
    3484:	c1 e1 05             	shl    $0x5,%ecx
    3487:	8b 55 08             	mov    0x8(%ebp),%edx
    348a:	01 d1                	add    %edx,%ecx
    348c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    348f:	01 ca                	add    %ecx,%edx
    3491:	83 c2 04             	add    $0x4,%edx
    3494:	0f b6 12             	movzbl (%edx),%edx
    3497:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    349e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    34a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34a5:	c1 e0 05             	shl    $0x5,%eax
    34a8:	89 c2                	mov    %eax,%edx
    34aa:	8b 45 08             	mov    0x8(%ebp),%eax
    34ad:	01 c2                	add    %eax,%edx
    34af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34b2:	01 d0                	add    %edx,%eax
    34b4:	83 c0 04             	add    $0x4,%eax
    34b7:	0f b6 00             	movzbl (%eax),%eax
    34ba:	84 c0                	test   %al,%al
    34bc:	75 b8                	jne    3476 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    34be:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34c1:	8d 50 01             	lea    0x1(%eax),%edx
    34c4:	89 55 e0             	mov    %edx,-0x20(%ebp)
    34c7:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    34ce:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    34cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34d2:	c1 e0 05             	shl    $0x5,%eax
    34d5:	89 c2                	mov    %eax,%edx
    34d7:	8b 45 08             	mov    0x8(%ebp),%eax
    34da:	01 d0                	add    %edx,%eax
    34dc:	dd 40 18             	fldl   0x18(%eax)
    34df:	8d 45 e0             	lea    -0x20(%ebp),%eax
    34e2:	50                   	push   %eax
    34e3:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    34e7:	dd 1c 24             	fstpl  (%esp)
    34ea:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    34f0:	50                   	push   %eax
    34f1:	e8 7d d5 ff ff       	call   a73 <double2str>
    34f6:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    34f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34fc:	8d 50 01             	lea    0x1(%eax),%edx
    34ff:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3502:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    3509:	00 
      write(fd,buf,pos);
    350a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    350d:	83 ec 04             	sub    $0x4,%esp
    3510:	50                   	push   %eax
    3511:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3517:	50                   	push   %eax
    3518:	ff 75 e4             	pushl  -0x1c(%ebp)
    351b:	e8 c9 cd ff ff       	call   2e9 <write>
    3520:	83 c4 10             	add    $0x10,%esp
    3523:	e9 10 01 00 00       	jmp    3638 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    3528:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    352f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3532:	8d 50 01             	lea    0x1(%eax),%edx
    3535:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3538:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    353f:	73 
      int k=0;
    3540:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    3547:	eb 2c                	jmp    3575 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    3549:	8b 45 ec             	mov    -0x14(%ebp),%eax
    354c:	8d 50 01             	lea    0x1(%eax),%edx
    354f:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3552:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3555:	89 d1                	mov    %edx,%ecx
    3557:	c1 e1 05             	shl    $0x5,%ecx
    355a:	8b 55 08             	mov    0x8(%ebp),%edx
    355d:	01 d1                	add    %edx,%ecx
    355f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3562:	01 ca                	add    %ecx,%edx
    3564:	83 c2 04             	add    $0x4,%edx
    3567:	0f b6 12             	movzbl (%edx),%edx
    356a:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3571:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    3575:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3578:	c1 e0 05             	shl    $0x5,%eax
    357b:	89 c2                	mov    %eax,%edx
    357d:	8b 45 08             	mov    0x8(%ebp),%eax
    3580:	01 c2                	add    %eax,%edx
    3582:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3585:	01 d0                	add    %edx,%eax
    3587:	83 c0 04             	add    $0x4,%eax
    358a:	0f b6 00             	movzbl (%eax),%eax
    358d:	84 c0                	test   %al,%al
    358f:	75 b8                	jne    3549 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3591:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3594:	8d 50 01             	lea    0x1(%eax),%edx
    3597:	89 55 ec             	mov    %edx,-0x14(%ebp)
    359a:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    35a1:	3d 
      k=0;
    35a2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    35a9:	eb 2c                	jmp    35d7 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    35ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35ae:	8d 50 01             	lea    0x1(%eax),%edx
    35b1:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35b4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    35b7:	89 d1                	mov    %edx,%ecx
    35b9:	c1 e1 05             	shl    $0x5,%ecx
    35bc:	8b 55 08             	mov    0x8(%ebp),%edx
    35bf:	01 ca                	add    %ecx,%edx
    35c1:	8b 4a 18             	mov    0x18(%edx),%ecx
    35c4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    35c7:	01 ca                	add    %ecx,%edx
    35c9:	0f b6 12             	movzbl (%edx),%edx
    35cc:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    35d3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    35d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35da:	c1 e0 05             	shl    $0x5,%eax
    35dd:	89 c2                	mov    %eax,%edx
    35df:	8b 45 08             	mov    0x8(%ebp),%eax
    35e2:	01 d0                	add    %edx,%eax
    35e4:	8b 50 18             	mov    0x18(%eax),%edx
    35e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    35ea:	01 d0                	add    %edx,%eax
    35ec:	0f b6 00             	movzbl (%eax),%eax
    35ef:	84 c0                	test   %al,%al
    35f1:	75 b8                	jne    35ab <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    35f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35f6:	8d 50 01             	lea    0x1(%eax),%edx
    35f9:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35fc:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    3603:	00 
      write(fd,buf,pos);
    3604:	83 ec 04             	sub    $0x4,%esp
    3607:	ff 75 ec             	pushl  -0x14(%ebp)
    360a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3610:	50                   	push   %eax
    3611:	ff 75 e4             	pushl  -0x1c(%ebp)
    3614:	e8 d0 cc ff ff       	call   2e9 <write>
    3619:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    361c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    361f:	c1 e0 05             	shl    $0x5,%eax
    3622:	89 c2                	mov    %eax,%edx
    3624:	8b 45 08             	mov    0x8(%ebp),%eax
    3627:	01 d0                	add    %edx,%eax
    3629:	8b 40 18             	mov    0x18(%eax),%eax
    362c:	83 ec 0c             	sub    $0xc,%esp
    362f:	50                   	push   %eax
    3630:	e8 00 d1 ff ff       	call   735 <free>
    3635:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    3638:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    363c:	8b 45 0c             	mov    0xc(%ebp),%eax
    363f:	8b 00                	mov    (%eax),%eax
    3641:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3644:	0f 8f f3 fd ff ff    	jg     343d <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    364a:	8b 45 0c             	mov    0xc(%ebp),%eax
    364d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    3653:	83 ec 0c             	sub    $0xc,%esp
    3656:	ff 75 e4             	pushl  -0x1c(%ebp)
    3659:	e8 93 cc ff ff       	call   2f1 <close>
    365e:	83 c4 10             	add    $0x10,%esp
  return;
    3661:	90                   	nop
    3662:	c9                   	leave  
    3663:	c3                   	ret    
