
_ln：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	53                   	push   %ebx
       e:	51                   	push   %ecx
       f:	89 cb                	mov    %ecx,%ebx
  if(argc != 3){
      11:	83 3b 03             	cmpl   $0x3,(%ebx)
      14:	74 17                	je     2d <main+0x2d>
    printf(2, "Usage: ln old new\n");
      16:	83 ec 08             	sub    $0x8,%esp
      19:	68 68 36 00 00       	push   $0x3668
      1e:	6a 02                	push   $0x2
      20:	e8 52 05 00 00       	call   577 <printf>
      25:	83 c4 10             	add    $0x10,%esp
    exit();
      28:	e8 9e 02 00 00       	call   2cb <exit>
  }
  if(link(argv[1], argv[2]) < 0)
      2d:	8b 43 04             	mov    0x4(%ebx),%eax
      30:	83 c0 08             	add    $0x8,%eax
      33:	8b 10                	mov    (%eax),%edx
      35:	8b 43 04             	mov    0x4(%ebx),%eax
      38:	83 c0 04             	add    $0x4,%eax
      3b:	8b 00                	mov    (%eax),%eax
      3d:	83 ec 08             	sub    $0x8,%esp
      40:	52                   	push   %edx
      41:	50                   	push   %eax
      42:	e8 e4 02 00 00       	call   32b <link>
      47:	83 c4 10             	add    $0x10,%esp
      4a:	85 c0                	test   %eax,%eax
      4c:	79 21                	jns    6f <main+0x6f>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
      4e:	8b 43 04             	mov    0x4(%ebx),%eax
      51:	83 c0 08             	add    $0x8,%eax
      54:	8b 10                	mov    (%eax),%edx
      56:	8b 43 04             	mov    0x4(%ebx),%eax
      59:	83 c0 04             	add    $0x4,%eax
      5c:	8b 00                	mov    (%eax),%eax
      5e:	52                   	push   %edx
      5f:	50                   	push   %eax
      60:	68 7b 36 00 00       	push   $0x367b
      65:	6a 02                	push   $0x2
      67:	e8 0b 05 00 00       	call   577 <printf>
      6c:	83 c4 10             	add    $0x10,%esp
  exit();
      6f:	e8 57 02 00 00       	call   2cb <exit>

00000074 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
      74:	55                   	push   %ebp
      75:	89 e5                	mov    %esp,%ebp
      77:	57                   	push   %edi
      78:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
      79:	8b 4d 08             	mov    0x8(%ebp),%ecx
      7c:	8b 55 10             	mov    0x10(%ebp),%edx
      7f:	8b 45 0c             	mov    0xc(%ebp),%eax
      82:	89 cb                	mov    %ecx,%ebx
      84:	89 df                	mov    %ebx,%edi
      86:	89 d1                	mov    %edx,%ecx
      88:	fc                   	cld    
      89:	f3 aa                	rep stos %al,%es:(%edi)
      8b:	89 ca                	mov    %ecx,%edx
      8d:	89 fb                	mov    %edi,%ebx
      8f:	89 5d 08             	mov    %ebx,0x8(%ebp)
      92:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
      95:	90                   	nop
      96:	5b                   	pop    %ebx
      97:	5f                   	pop    %edi
      98:	5d                   	pop    %ebp
      99:	c3                   	ret    

0000009a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
      9a:	55                   	push   %ebp
      9b:	89 e5                	mov    %esp,%ebp
      9d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
      a0:	8b 45 08             	mov    0x8(%ebp),%eax
      a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
      a6:	90                   	nop
      a7:	8b 45 08             	mov    0x8(%ebp),%eax
      aa:	8d 50 01             	lea    0x1(%eax),%edx
      ad:	89 55 08             	mov    %edx,0x8(%ebp)
      b0:	8b 55 0c             	mov    0xc(%ebp),%edx
      b3:	8d 4a 01             	lea    0x1(%edx),%ecx
      b6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
      b9:	0f b6 12             	movzbl (%edx),%edx
      bc:	88 10                	mov    %dl,(%eax)
      be:	0f b6 00             	movzbl (%eax),%eax
      c1:	84 c0                	test   %al,%al
      c3:	75 e2                	jne    a7 <strcpy+0xd>
    ;
  return os;
      c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
      c8:	c9                   	leave  
      c9:	c3                   	ret    

000000ca <strcmp>:

int
strcmp(const char *p, const char *q)
{
      ca:	55                   	push   %ebp
      cb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
      cd:	eb 08                	jmp    d7 <strcmp+0xd>
    p++, q++;
      cf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
      d3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      d7:	8b 45 08             	mov    0x8(%ebp),%eax
      da:	0f b6 00             	movzbl (%eax),%eax
      dd:	84 c0                	test   %al,%al
      df:	74 10                	je     f1 <strcmp+0x27>
      e1:	8b 45 08             	mov    0x8(%ebp),%eax
      e4:	0f b6 10             	movzbl (%eax),%edx
      e7:	8b 45 0c             	mov    0xc(%ebp),%eax
      ea:	0f b6 00             	movzbl (%eax),%eax
      ed:	38 c2                	cmp    %al,%dl
      ef:	74 de                	je     cf <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
      f1:	8b 45 08             	mov    0x8(%ebp),%eax
      f4:	0f b6 00             	movzbl (%eax),%eax
      f7:	0f b6 d0             	movzbl %al,%edx
      fa:	8b 45 0c             	mov    0xc(%ebp),%eax
      fd:	0f b6 00             	movzbl (%eax),%eax
     100:	0f b6 c0             	movzbl %al,%eax
     103:	29 c2                	sub    %eax,%edx
     105:	89 d0                	mov    %edx,%eax
}
     107:	5d                   	pop    %ebp
     108:	c3                   	ret    

00000109 <strlen>:

uint
strlen(char *s)
{
     109:	55                   	push   %ebp
     10a:	89 e5                	mov    %esp,%ebp
     10c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     10f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     116:	eb 04                	jmp    11c <strlen+0x13>
     118:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     11c:	8b 55 fc             	mov    -0x4(%ebp),%edx
     11f:	8b 45 08             	mov    0x8(%ebp),%eax
     122:	01 d0                	add    %edx,%eax
     124:	0f b6 00             	movzbl (%eax),%eax
     127:	84 c0                	test   %al,%al
     129:	75 ed                	jne    118 <strlen+0xf>
    ;
  return n;
     12b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     12e:	c9                   	leave  
     12f:	c3                   	ret    

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     133:	8b 45 10             	mov    0x10(%ebp),%eax
     136:	50                   	push   %eax
     137:	ff 75 0c             	pushl  0xc(%ebp)
     13a:	ff 75 08             	pushl  0x8(%ebp)
     13d:	e8 32 ff ff ff       	call   74 <stosb>
     142:	83 c4 0c             	add    $0xc,%esp
  return dst;
     145:	8b 45 08             	mov    0x8(%ebp),%eax
}
     148:	c9                   	leave  
     149:	c3                   	ret    

0000014a <strchr>:

char*
strchr(const char *s, char c)
{
     14a:	55                   	push   %ebp
     14b:	89 e5                	mov    %esp,%ebp
     14d:	83 ec 04             	sub    $0x4,%esp
     150:	8b 45 0c             	mov    0xc(%ebp),%eax
     153:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     156:	eb 14                	jmp    16c <strchr+0x22>
    if(*s == c)
     158:	8b 45 08             	mov    0x8(%ebp),%eax
     15b:	0f b6 00             	movzbl (%eax),%eax
     15e:	3a 45 fc             	cmp    -0x4(%ebp),%al
     161:	75 05                	jne    168 <strchr+0x1e>
      return (char*)s;
     163:	8b 45 08             	mov    0x8(%ebp),%eax
     166:	eb 13                	jmp    17b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     168:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     16c:	8b 45 08             	mov    0x8(%ebp),%eax
     16f:	0f b6 00             	movzbl (%eax),%eax
     172:	84 c0                	test   %al,%al
     174:	75 e2                	jne    158 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     176:	b8 00 00 00 00       	mov    $0x0,%eax
}
     17b:	c9                   	leave  
     17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
     17d:	55                   	push   %ebp
     17e:	89 e5                	mov    %esp,%ebp
     180:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     183:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     18a:	eb 42                	jmp    1ce <gets+0x51>
    cc = read(0, &c, 1);
     18c:	83 ec 04             	sub    $0x4,%esp
     18f:	6a 01                	push   $0x1
     191:	8d 45 ef             	lea    -0x11(%ebp),%eax
     194:	50                   	push   %eax
     195:	6a 00                	push   $0x0
     197:	e8 47 01 00 00       	call   2e3 <read>
     19c:	83 c4 10             	add    $0x10,%esp
     19f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     1a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     1a6:	7e 33                	jle    1db <gets+0x5e>
      break;
    buf[i++] = c;
     1a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1ab:	8d 50 01             	lea    0x1(%eax),%edx
     1ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
     1b1:	89 c2                	mov    %eax,%edx
     1b3:	8b 45 08             	mov    0x8(%ebp),%eax
     1b6:	01 c2                	add    %eax,%edx
     1b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1bc:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1c2:	3c 0a                	cmp    $0xa,%al
     1c4:	74 16                	je     1dc <gets+0x5f>
     1c6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1ca:	3c 0d                	cmp    $0xd,%al
     1cc:	74 0e                	je     1dc <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     1ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1d1:	83 c0 01             	add    $0x1,%eax
     1d4:	3b 45 0c             	cmp    0xc(%ebp),%eax
     1d7:	7c b3                	jl     18c <gets+0xf>
     1d9:	eb 01                	jmp    1dc <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     1db:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
     1df:	8b 45 08             	mov    0x8(%ebp),%eax
     1e2:	01 d0                	add    %edx,%eax
     1e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     1e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
     1ea:	c9                   	leave  
     1eb:	c3                   	ret    

000001ec <stat>:

int
stat(char *n, struct stat *st)
{
     1ec:	55                   	push   %ebp
     1ed:	89 e5                	mov    %esp,%ebp
     1ef:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     1f2:	83 ec 08             	sub    $0x8,%esp
     1f5:	6a 00                	push   $0x0
     1f7:	ff 75 08             	pushl  0x8(%ebp)
     1fa:	e8 0c 01 00 00       	call   30b <open>
     1ff:	83 c4 10             	add    $0x10,%esp
     202:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     205:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     209:	79 07                	jns    212 <stat+0x26>
    return -1;
     20b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     210:	eb 25                	jmp    237 <stat+0x4b>
  r = fstat(fd, st);
     212:	83 ec 08             	sub    $0x8,%esp
     215:	ff 75 0c             	pushl  0xc(%ebp)
     218:	ff 75 f4             	pushl  -0xc(%ebp)
     21b:	e8 03 01 00 00       	call   323 <fstat>
     220:	83 c4 10             	add    $0x10,%esp
     223:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     226:	83 ec 0c             	sub    $0xc,%esp
     229:	ff 75 f4             	pushl  -0xc(%ebp)
     22c:	e8 c2 00 00 00       	call   2f3 <close>
     231:	83 c4 10             	add    $0x10,%esp
  return r;
     234:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     237:	c9                   	leave  
     238:	c3                   	ret    

00000239 <atoi>:

int
atoi(const char *s)
{
     239:	55                   	push   %ebp
     23a:	89 e5                	mov    %esp,%ebp
     23c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     23f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     246:	eb 25                	jmp    26d <atoi+0x34>
    n = n*10 + *s++ - '0';
     248:	8b 55 fc             	mov    -0x4(%ebp),%edx
     24b:	89 d0                	mov    %edx,%eax
     24d:	c1 e0 02             	shl    $0x2,%eax
     250:	01 d0                	add    %edx,%eax
     252:	01 c0                	add    %eax,%eax
     254:	89 c1                	mov    %eax,%ecx
     256:	8b 45 08             	mov    0x8(%ebp),%eax
     259:	8d 50 01             	lea    0x1(%eax),%edx
     25c:	89 55 08             	mov    %edx,0x8(%ebp)
     25f:	0f b6 00             	movzbl (%eax),%eax
     262:	0f be c0             	movsbl %al,%eax
     265:	01 c8                	add    %ecx,%eax
     267:	83 e8 30             	sub    $0x30,%eax
     26a:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     26d:	8b 45 08             	mov    0x8(%ebp),%eax
     270:	0f b6 00             	movzbl (%eax),%eax
     273:	3c 2f                	cmp    $0x2f,%al
     275:	7e 0a                	jle    281 <atoi+0x48>
     277:	8b 45 08             	mov    0x8(%ebp),%eax
     27a:	0f b6 00             	movzbl (%eax),%eax
     27d:	3c 39                	cmp    $0x39,%al
     27f:	7e c7                	jle    248 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     281:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     284:	c9                   	leave  
     285:	c3                   	ret    

00000286 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     286:	55                   	push   %ebp
     287:	89 e5                	mov    %esp,%ebp
     289:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     28c:	8b 45 08             	mov    0x8(%ebp),%eax
     28f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     292:	8b 45 0c             	mov    0xc(%ebp),%eax
     295:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     298:	eb 17                	jmp    2b1 <memmove+0x2b>
    *dst++ = *src++;
     29a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     29d:	8d 50 01             	lea    0x1(%eax),%edx
     2a0:	89 55 fc             	mov    %edx,-0x4(%ebp)
     2a3:	8b 55 f8             	mov    -0x8(%ebp),%edx
     2a6:	8d 4a 01             	lea    0x1(%edx),%ecx
     2a9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     2ac:	0f b6 12             	movzbl (%edx),%edx
     2af:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     2b1:	8b 45 10             	mov    0x10(%ebp),%eax
     2b4:	8d 50 ff             	lea    -0x1(%eax),%edx
     2b7:	89 55 10             	mov    %edx,0x10(%ebp)
     2ba:	85 c0                	test   %eax,%eax
     2bc:	7f dc                	jg     29a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
     2c1:	c9                   	leave  
     2c2:	c3                   	ret    

000002c3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     2c3:	b8 01 00 00 00       	mov    $0x1,%eax
     2c8:	cd 40                	int    $0x40
     2ca:	c3                   	ret    

000002cb <exit>:
SYSCALL(exit)
     2cb:	b8 02 00 00 00       	mov    $0x2,%eax
     2d0:	cd 40                	int    $0x40
     2d2:	c3                   	ret    

000002d3 <wait>:
SYSCALL(wait)
     2d3:	b8 03 00 00 00       	mov    $0x3,%eax
     2d8:	cd 40                	int    $0x40
     2da:	c3                   	ret    

000002db <pipe>:
SYSCALL(pipe)
     2db:	b8 04 00 00 00       	mov    $0x4,%eax
     2e0:	cd 40                	int    $0x40
     2e2:	c3                   	ret    

000002e3 <read>:
SYSCALL(read)
     2e3:	b8 05 00 00 00       	mov    $0x5,%eax
     2e8:	cd 40                	int    $0x40
     2ea:	c3                   	ret    

000002eb <write>:
SYSCALL(write)
     2eb:	b8 10 00 00 00       	mov    $0x10,%eax
     2f0:	cd 40                	int    $0x40
     2f2:	c3                   	ret    

000002f3 <close>:
SYSCALL(close)
     2f3:	b8 15 00 00 00       	mov    $0x15,%eax
     2f8:	cd 40                	int    $0x40
     2fa:	c3                   	ret    

000002fb <kill>:
SYSCALL(kill)
     2fb:	b8 06 00 00 00       	mov    $0x6,%eax
     300:	cd 40                	int    $0x40
     302:	c3                   	ret    

00000303 <exec>:
SYSCALL(exec)
     303:	b8 07 00 00 00       	mov    $0x7,%eax
     308:	cd 40                	int    $0x40
     30a:	c3                   	ret    

0000030b <open>:
SYSCALL(open)
     30b:	b8 0f 00 00 00       	mov    $0xf,%eax
     310:	cd 40                	int    $0x40
     312:	c3                   	ret    

00000313 <mknod>:
SYSCALL(mknod)
     313:	b8 11 00 00 00       	mov    $0x11,%eax
     318:	cd 40                	int    $0x40
     31a:	c3                   	ret    

0000031b <unlink>:
SYSCALL(unlink)
     31b:	b8 12 00 00 00       	mov    $0x12,%eax
     320:	cd 40                	int    $0x40
     322:	c3                   	ret    

00000323 <fstat>:
SYSCALL(fstat)
     323:	b8 08 00 00 00       	mov    $0x8,%eax
     328:	cd 40                	int    $0x40
     32a:	c3                   	ret    

0000032b <link>:
SYSCALL(link)
     32b:	b8 13 00 00 00       	mov    $0x13,%eax
     330:	cd 40                	int    $0x40
     332:	c3                   	ret    

00000333 <mkdir>:
SYSCALL(mkdir)
     333:	b8 14 00 00 00       	mov    $0x14,%eax
     338:	cd 40                	int    $0x40
     33a:	c3                   	ret    

0000033b <chdir>:
SYSCALL(chdir)
     33b:	b8 09 00 00 00       	mov    $0x9,%eax
     340:	cd 40                	int    $0x40
     342:	c3                   	ret    

00000343 <dup>:
SYSCALL(dup)
     343:	b8 0a 00 00 00       	mov    $0xa,%eax
     348:	cd 40                	int    $0x40
     34a:	c3                   	ret    

0000034b <getpid>:
SYSCALL(getpid)
     34b:	b8 0b 00 00 00       	mov    $0xb,%eax
     350:	cd 40                	int    $0x40
     352:	c3                   	ret    

00000353 <sbrk>:
SYSCALL(sbrk)
     353:	b8 0c 00 00 00       	mov    $0xc,%eax
     358:	cd 40                	int    $0x40
     35a:	c3                   	ret    

0000035b <sleep>:
SYSCALL(sleep)
     35b:	b8 0d 00 00 00       	mov    $0xd,%eax
     360:	cd 40                	int    $0x40
     362:	c3                   	ret    

00000363 <uptime>:
SYSCALL(uptime)
     363:	b8 0e 00 00 00       	mov    $0xe,%eax
     368:	cd 40                	int    $0x40
     36a:	c3                   	ret    

0000036b <colorwrite>:

//new here
SYSCALL(colorwrite)
     36b:	b8 16 00 00 00       	mov    $0x16,%eax
     370:	cd 40                	int    $0x40
     372:	c3                   	ret    

00000373 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     373:	55                   	push   %ebp
     374:	89 e5                	mov    %esp,%ebp
     376:	83 ec 18             	sub    $0x18,%esp
     379:	8b 45 0c             	mov    0xc(%ebp),%eax
     37c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     37f:	83 ec 04             	sub    $0x4,%esp
     382:	6a 01                	push   $0x1
     384:	8d 45 f4             	lea    -0xc(%ebp),%eax
     387:	50                   	push   %eax
     388:	ff 75 08             	pushl  0x8(%ebp)
     38b:	e8 5b ff ff ff       	call   2eb <write>
     390:	83 c4 10             	add    $0x10,%esp
}
     393:	90                   	nop
     394:	c9                   	leave  
     395:	c3                   	ret    

00000396 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     396:	55                   	push   %ebp
     397:	89 e5                	mov    %esp,%ebp
     399:	53                   	push   %ebx
     39a:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     39d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     3a4:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     3a8:	74 17                	je     3c1 <printint+0x2b>
     3aa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     3ae:	79 11                	jns    3c1 <printint+0x2b>
    neg = 1;
     3b0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     3b7:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ba:	f7 d8                	neg    %eax
     3bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
     3bf:	eb 06                	jmp    3c7 <printint+0x31>
  } else {
    x = xx;
     3c1:	8b 45 0c             	mov    0xc(%ebp),%eax
     3c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     3c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     3ce:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     3d1:	8d 41 01             	lea    0x1(%ecx),%eax
     3d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
     3d7:	8b 5d 10             	mov    0x10(%ebp),%ebx
     3da:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3dd:	ba 00 00 00 00       	mov    $0x0,%edx
     3e2:	f7 f3                	div    %ebx
     3e4:	89 d0                	mov    %edx,%eax
     3e6:	0f b6 80 a0 42 00 00 	movzbl 0x42a0(%eax),%eax
     3ed:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     3f1:	8b 5d 10             	mov    0x10(%ebp),%ebx
     3f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3f7:	ba 00 00 00 00       	mov    $0x0,%edx
     3fc:	f7 f3                	div    %ebx
     3fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
     401:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     405:	75 c7                	jne    3ce <printint+0x38>
  if(neg)
     407:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     40b:	74 2d                	je     43a <printint+0xa4>
    buf[i++] = '-';
     40d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     410:	8d 50 01             	lea    0x1(%eax),%edx
     413:	89 55 f4             	mov    %edx,-0xc(%ebp)
     416:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     41b:	eb 1d                	jmp    43a <printint+0xa4>
    putc(fd, buf[i]);
     41d:	8d 55 dc             	lea    -0x24(%ebp),%edx
     420:	8b 45 f4             	mov    -0xc(%ebp),%eax
     423:	01 d0                	add    %edx,%eax
     425:	0f b6 00             	movzbl (%eax),%eax
     428:	0f be c0             	movsbl %al,%eax
     42b:	83 ec 08             	sub    $0x8,%esp
     42e:	50                   	push   %eax
     42f:	ff 75 08             	pushl  0x8(%ebp)
     432:	e8 3c ff ff ff       	call   373 <putc>
     437:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     43a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     43e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     442:	79 d9                	jns    41d <printint+0x87>
    putc(fd, buf[i]);
}
     444:	90                   	nop
     445:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     448:	c9                   	leave  
     449:	c3                   	ret    

0000044a <getInteger>:

static int getInteger(double num)
{
     44a:	55                   	push   %ebp
     44b:	89 e5                	mov    %esp,%ebp
     44d:	83 ec 18             	sub    $0x18,%esp
     450:	8b 45 08             	mov    0x8(%ebp),%eax
     453:	89 45 e8             	mov    %eax,-0x18(%ebp)
     456:	8b 45 0c             	mov    0xc(%ebp),%eax
     459:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     45c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     463:	eb 0e                	jmp    473 <getInteger+0x29>
  {
    num -= 1;
     465:	dd 45 e8             	fldl   -0x18(%ebp)
     468:	d9 e8                	fld1   
     46a:	de e9                	fsubrp %st,%st(1)
     46c:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     46f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     473:	dd 45 e8             	fldl   -0x18(%ebp)
     476:	d9 e8                	fld1   
     478:	d9 c9                	fxch   %st(1)
     47a:	df e9                	fucomip %st(1),%st
     47c:	dd d8                	fstp   %st(0)
     47e:	77 e5                	ja     465 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     480:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     483:	c9                   	leave  
     484:	c3                   	ret    

00000485 <printdbl>:

void printdbl(int fd, double num)
{
     485:	55                   	push   %ebp
     486:	89 e5                	mov    %esp,%ebp
     488:	83 ec 28             	sub    $0x28,%esp
     48b:	8b 45 0c             	mov    0xc(%ebp),%eax
     48e:	89 45 e0             	mov    %eax,-0x20(%ebp)
     491:	8b 45 10             	mov    0x10(%ebp),%eax
     494:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     497:	d9 ee                	fldz   
     499:	dd 45 e0             	fldl   -0x20(%ebp)
     49c:	d9 c9                	fxch   %st(1)
     49e:	df e9                	fucomip %st(1),%st
     4a0:	dd d8                	fstp   %st(0)
     4a2:	76 18                	jbe    4bc <printdbl+0x37>
  {
    putc(fd,'-');
     4a4:	83 ec 08             	sub    $0x8,%esp
     4a7:	6a 2d                	push   $0x2d
     4a9:	ff 75 08             	pushl  0x8(%ebp)
     4ac:	e8 c2 fe ff ff       	call   373 <putc>
     4b1:	83 c4 10             	add    $0x10,%esp
    num = -num;
     4b4:	dd 45 e0             	fldl   -0x20(%ebp)
     4b7:	d9 e0                	fchs   
     4b9:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     4bc:	83 ec 08             	sub    $0x8,%esp
     4bf:	ff 75 e4             	pushl  -0x1c(%ebp)
     4c2:	ff 75 e0             	pushl  -0x20(%ebp)
     4c5:	e8 80 ff ff ff       	call   44a <getInteger>
     4ca:	83 c4 10             	add    $0x10,%esp
     4cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     4d0:	6a 01                	push   $0x1
     4d2:	6a 0a                	push   $0xa
     4d4:	ff 75 f0             	pushl  -0x10(%ebp)
     4d7:	ff 75 08             	pushl  0x8(%ebp)
     4da:	e8 b7 fe ff ff       	call   396 <printint>
     4df:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     4e2:	db 45 f0             	fildl  -0x10(%ebp)
     4e5:	dd 45 e0             	fldl   -0x20(%ebp)
     4e8:	de e1                	fsubp  %st,%st(1)
     4ea:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     4ed:	dd 45 e0             	fldl   -0x20(%ebp)
     4f0:	dd 05 98 36 00 00    	fldl   0x3698
     4f6:	d9 c9                	fxch   %st(1)
     4f8:	df e9                	fucomip %st(1),%st
     4fa:	dd d8                	fstp   %st(0)
     4fc:	76 10                	jbe    50e <printdbl+0x89>
    putc(fd,'.');
     4fe:	83 ec 08             	sub    $0x8,%esp
     501:	6a 2e                	push   $0x2e
     503:	ff 75 08             	pushl  0x8(%ebp)
     506:	e8 68 fe ff ff       	call   373 <putc>
     50b:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     50e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     515:	eb 49                	jmp    560 <printdbl+0xdb>
  {
    num = num*10;
     517:	dd 45 e0             	fldl   -0x20(%ebp)
     51a:	dd 05 a0 36 00 00    	fldl   0x36a0
     520:	de c9                	fmulp  %st,%st(1)
     522:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     525:	83 ec 08             	sub    $0x8,%esp
     528:	ff 75 e4             	pushl  -0x1c(%ebp)
     52b:	ff 75 e0             	pushl  -0x20(%ebp)
     52e:	e8 17 ff ff ff       	call   44a <getInteger>
     533:	83 c4 10             	add    $0x10,%esp
     536:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     539:	6a 01                	push   $0x1
     53b:	6a 0a                	push   $0xa
     53d:	ff 75 f0             	pushl  -0x10(%ebp)
     540:	ff 75 08             	pushl  0x8(%ebp)
     543:	e8 4e fe ff ff       	call   396 <printint>
     548:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     54b:	db 45 f0             	fildl  -0x10(%ebp)
     54e:	dd 45 e0             	fldl   -0x20(%ebp)
     551:	de e1                	fsubp  %st,%st(1)
     553:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     556:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     55a:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     55e:	7f 13                	jg     573 <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     560:	dd 45 e0             	fldl   -0x20(%ebp)
     563:	dd 05 98 36 00 00    	fldl   0x3698
     569:	d9 c9                	fxch   %st(1)
     56b:	df e9                	fucomip %st(1),%st
     56d:	dd d8                	fstp   %st(0)
     56f:	77 a6                	ja     517 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     571:	eb 01                	jmp    574 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     573:	90                   	nop
    }
  }
}
     574:	90                   	nop
     575:	c9                   	leave  
     576:	c3                   	ret    

00000577 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     577:	55                   	push   %ebp
     578:	89 e5                	mov    %esp,%ebp
     57a:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     57d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     584:	8d 45 0c             	lea    0xc(%ebp),%eax
     587:	83 c0 04             	add    $0x4,%eax
     58a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     58d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     594:	e9 88 01 00 00       	jmp    721 <printf+0x1aa>
    c = fmt[i] & 0xff;
     599:	8b 55 0c             	mov    0xc(%ebp),%edx
     59c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     59f:	01 d0                	add    %edx,%eax
     5a1:	0f b6 00             	movzbl (%eax),%eax
     5a4:	0f be c0             	movsbl %al,%eax
     5a7:	25 ff 00 00 00       	and    $0xff,%eax
     5ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     5af:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     5b3:	75 2c                	jne    5e1 <printf+0x6a>
      if(c == '%'){
     5b5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     5b9:	75 0c                	jne    5c7 <printf+0x50>
        state = '%';
     5bb:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     5c2:	e9 56 01 00 00       	jmp    71d <printf+0x1a6>
      } else {
        putc(fd, c);
     5c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     5ca:	0f be c0             	movsbl %al,%eax
     5cd:	83 ec 08             	sub    $0x8,%esp
     5d0:	50                   	push   %eax
     5d1:	ff 75 08             	pushl  0x8(%ebp)
     5d4:	e8 9a fd ff ff       	call   373 <putc>
     5d9:	83 c4 10             	add    $0x10,%esp
     5dc:	e9 3c 01 00 00       	jmp    71d <printf+0x1a6>
      }
    } else if(state == '%'){
     5e1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     5e5:	0f 85 32 01 00 00    	jne    71d <printf+0x1a6>
      if(c == 'd'){
     5eb:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     5ef:	75 1e                	jne    60f <printf+0x98>
        printint(fd, *ap, 10, 1);
     5f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
     5f4:	8b 00                	mov    (%eax),%eax
     5f6:	6a 01                	push   $0x1
     5f8:	6a 0a                	push   $0xa
     5fa:	50                   	push   %eax
     5fb:	ff 75 08             	pushl  0x8(%ebp)
     5fe:	e8 93 fd ff ff       	call   396 <printint>
     603:	83 c4 10             	add    $0x10,%esp
        ap++;
     606:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     60a:	e9 07 01 00 00       	jmp    716 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     60f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     613:	74 06                	je     61b <printf+0xa4>
     615:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     619:	75 1e                	jne    639 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     61b:	8b 45 e8             	mov    -0x18(%ebp),%eax
     61e:	8b 00                	mov    (%eax),%eax
     620:	6a 00                	push   $0x0
     622:	6a 10                	push   $0x10
     624:	50                   	push   %eax
     625:	ff 75 08             	pushl  0x8(%ebp)
     628:	e8 69 fd ff ff       	call   396 <printint>
     62d:	83 c4 10             	add    $0x10,%esp
        ap++;
     630:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     634:	e9 dd 00 00 00       	jmp    716 <printf+0x19f>
      } else if(c == 's'){
     639:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     63d:	75 46                	jne    685 <printf+0x10e>
        s = (char*)*ap;
     63f:	8b 45 e8             	mov    -0x18(%ebp),%eax
     642:	8b 00                	mov    (%eax),%eax
     644:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     647:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     64b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     64f:	75 25                	jne    676 <printf+0xff>
          s = "(null)";
     651:	c7 45 f4 90 36 00 00 	movl   $0x3690,-0xc(%ebp)
        while(*s != 0){
     658:	eb 1c                	jmp    676 <printf+0xff>
          putc(fd, *s);
     65a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     65d:	0f b6 00             	movzbl (%eax),%eax
     660:	0f be c0             	movsbl %al,%eax
     663:	83 ec 08             	sub    $0x8,%esp
     666:	50                   	push   %eax
     667:	ff 75 08             	pushl  0x8(%ebp)
     66a:	e8 04 fd ff ff       	call   373 <putc>
     66f:	83 c4 10             	add    $0x10,%esp
          s++;
     672:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     676:	8b 45 f4             	mov    -0xc(%ebp),%eax
     679:	0f b6 00             	movzbl (%eax),%eax
     67c:	84 c0                	test   %al,%al
     67e:	75 da                	jne    65a <printf+0xe3>
     680:	e9 91 00 00 00       	jmp    716 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     685:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     689:	75 1d                	jne    6a8 <printf+0x131>
        putc(fd, *ap);
     68b:	8b 45 e8             	mov    -0x18(%ebp),%eax
     68e:	8b 00                	mov    (%eax),%eax
     690:	0f be c0             	movsbl %al,%eax
     693:	83 ec 08             	sub    $0x8,%esp
     696:	50                   	push   %eax
     697:	ff 75 08             	pushl  0x8(%ebp)
     69a:	e8 d4 fc ff ff       	call   373 <putc>
     69f:	83 c4 10             	add    $0x10,%esp
        ap++;
     6a2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     6a6:	eb 6e                	jmp    716 <printf+0x19f>
      } else if(c == '%'){
     6a8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     6ac:	75 17                	jne    6c5 <printf+0x14e>
        putc(fd, c);
     6ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6b1:	0f be c0             	movsbl %al,%eax
     6b4:	83 ec 08             	sub    $0x8,%esp
     6b7:	50                   	push   %eax
     6b8:	ff 75 08             	pushl  0x8(%ebp)
     6bb:	e8 b3 fc ff ff       	call   373 <putc>
     6c0:	83 c4 10             	add    $0x10,%esp
     6c3:	eb 51                	jmp    716 <printf+0x19f>
      } else if(c == 'f'){ //for double
     6c5:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     6c9:	75 26                	jne    6f1 <printf+0x17a>
        double *dap = (double*)ap;
     6cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6ce:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     6d1:	8b 45 e0             	mov    -0x20(%ebp),%eax
     6d4:	dd 00                	fldl   (%eax)
     6d6:	83 ec 04             	sub    $0x4,%esp
     6d9:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     6dd:	dd 1c 24             	fstpl  (%esp)
     6e0:	ff 75 08             	pushl  0x8(%ebp)
     6e3:	e8 9d fd ff ff       	call   485 <printdbl>
     6e8:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     6eb:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     6ef:	eb 25                	jmp    716 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     6f1:	83 ec 08             	sub    $0x8,%esp
     6f4:	6a 25                	push   $0x25
     6f6:	ff 75 08             	pushl  0x8(%ebp)
     6f9:	e8 75 fc ff ff       	call   373 <putc>
     6fe:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     701:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     704:	0f be c0             	movsbl %al,%eax
     707:	83 ec 08             	sub    $0x8,%esp
     70a:	50                   	push   %eax
     70b:	ff 75 08             	pushl  0x8(%ebp)
     70e:	e8 60 fc ff ff       	call   373 <putc>
     713:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     716:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     71d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     721:	8b 55 0c             	mov    0xc(%ebp),%edx
     724:	8b 45 f0             	mov    -0x10(%ebp),%eax
     727:	01 d0                	add    %edx,%eax
     729:	0f b6 00             	movzbl (%eax),%eax
     72c:	84 c0                	test   %al,%al
     72e:	0f 85 65 fe ff ff    	jne    599 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     734:	90                   	nop
     735:	c9                   	leave  
     736:	c3                   	ret    

00000737 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     737:	55                   	push   %ebp
     738:	89 e5                	mov    %esp,%ebp
     73a:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     73d:	8b 45 08             	mov    0x8(%ebp),%eax
     740:	83 e8 08             	sub    $0x8,%eax
     743:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     746:	a1 e8 43 00 00       	mov    0x43e8,%eax
     74b:	89 45 fc             	mov    %eax,-0x4(%ebp)
     74e:	eb 24                	jmp    774 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     750:	8b 45 fc             	mov    -0x4(%ebp),%eax
     753:	8b 00                	mov    (%eax),%eax
     755:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     758:	77 12                	ja     76c <free+0x35>
     75a:	8b 45 f8             	mov    -0x8(%ebp),%eax
     75d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     760:	77 24                	ja     786 <free+0x4f>
     762:	8b 45 fc             	mov    -0x4(%ebp),%eax
     765:	8b 00                	mov    (%eax),%eax
     767:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     76a:	77 1a                	ja     786 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     76c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     76f:	8b 00                	mov    (%eax),%eax
     771:	89 45 fc             	mov    %eax,-0x4(%ebp)
     774:	8b 45 f8             	mov    -0x8(%ebp),%eax
     777:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     77a:	76 d4                	jbe    750 <free+0x19>
     77c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     77f:	8b 00                	mov    (%eax),%eax
     781:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     784:	76 ca                	jbe    750 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     786:	8b 45 f8             	mov    -0x8(%ebp),%eax
     789:	8b 40 04             	mov    0x4(%eax),%eax
     78c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     793:	8b 45 f8             	mov    -0x8(%ebp),%eax
     796:	01 c2                	add    %eax,%edx
     798:	8b 45 fc             	mov    -0x4(%ebp),%eax
     79b:	8b 00                	mov    (%eax),%eax
     79d:	39 c2                	cmp    %eax,%edx
     79f:	75 24                	jne    7c5 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     7a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7a4:	8b 50 04             	mov    0x4(%eax),%edx
     7a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7aa:	8b 00                	mov    (%eax),%eax
     7ac:	8b 40 04             	mov    0x4(%eax),%eax
     7af:	01 c2                	add    %eax,%edx
     7b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7b4:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     7b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7ba:	8b 00                	mov    (%eax),%eax
     7bc:	8b 10                	mov    (%eax),%edx
     7be:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7c1:	89 10                	mov    %edx,(%eax)
     7c3:	eb 0a                	jmp    7cf <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     7c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7c8:	8b 10                	mov    (%eax),%edx
     7ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7cd:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     7cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7d2:	8b 40 04             	mov    0x4(%eax),%eax
     7d5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     7dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7df:	01 d0                	add    %edx,%eax
     7e1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     7e4:	75 20                	jne    806 <free+0xcf>
    p->s.size += bp->s.size;
     7e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7e9:	8b 50 04             	mov    0x4(%eax),%edx
     7ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7ef:	8b 40 04             	mov    0x4(%eax),%eax
     7f2:	01 c2                	add    %eax,%edx
     7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7f7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     7fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7fd:	8b 10                	mov    (%eax),%edx
     7ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
     802:	89 10                	mov    %edx,(%eax)
     804:	eb 08                	jmp    80e <free+0xd7>
  } else
    p->s.ptr = bp;
     806:	8b 45 fc             	mov    -0x4(%ebp),%eax
     809:	8b 55 f8             	mov    -0x8(%ebp),%edx
     80c:	89 10                	mov    %edx,(%eax)
  freep = p;
     80e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     811:	a3 e8 43 00 00       	mov    %eax,0x43e8
}
     816:	90                   	nop
     817:	c9                   	leave  
     818:	c3                   	ret    

00000819 <morecore>:

static Header*
morecore(uint nu)
{
     819:	55                   	push   %ebp
     81a:	89 e5                	mov    %esp,%ebp
     81c:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     81f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     826:	77 07                	ja     82f <morecore+0x16>
    nu = 4096;
     828:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     82f:	8b 45 08             	mov    0x8(%ebp),%eax
     832:	c1 e0 03             	shl    $0x3,%eax
     835:	83 ec 0c             	sub    $0xc,%esp
     838:	50                   	push   %eax
     839:	e8 15 fb ff ff       	call   353 <sbrk>
     83e:	83 c4 10             	add    $0x10,%esp
     841:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     844:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     848:	75 07                	jne    851 <morecore+0x38>
    return 0;
     84a:	b8 00 00 00 00       	mov    $0x0,%eax
     84f:	eb 26                	jmp    877 <morecore+0x5e>
  hp = (Header*)p;
     851:	8b 45 f4             	mov    -0xc(%ebp),%eax
     854:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     857:	8b 45 f0             	mov    -0x10(%ebp),%eax
     85a:	8b 55 08             	mov    0x8(%ebp),%edx
     85d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     860:	8b 45 f0             	mov    -0x10(%ebp),%eax
     863:	83 c0 08             	add    $0x8,%eax
     866:	83 ec 0c             	sub    $0xc,%esp
     869:	50                   	push   %eax
     86a:	e8 c8 fe ff ff       	call   737 <free>
     86f:	83 c4 10             	add    $0x10,%esp
  return freep;
     872:	a1 e8 43 00 00       	mov    0x43e8,%eax
}
     877:	c9                   	leave  
     878:	c3                   	ret    

00000879 <malloc>:

void*
malloc(uint nbytes)
{
     879:	55                   	push   %ebp
     87a:	89 e5                	mov    %esp,%ebp
     87c:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     87f:	8b 45 08             	mov    0x8(%ebp),%eax
     882:	83 c0 07             	add    $0x7,%eax
     885:	c1 e8 03             	shr    $0x3,%eax
     888:	83 c0 01             	add    $0x1,%eax
     88b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     88e:	a1 e8 43 00 00       	mov    0x43e8,%eax
     893:	89 45 f0             	mov    %eax,-0x10(%ebp)
     896:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     89a:	75 23                	jne    8bf <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     89c:	c7 45 f0 e0 43 00 00 	movl   $0x43e0,-0x10(%ebp)
     8a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8a6:	a3 e8 43 00 00       	mov    %eax,0x43e8
     8ab:	a1 e8 43 00 00       	mov    0x43e8,%eax
     8b0:	a3 e0 43 00 00       	mov    %eax,0x43e0
    base.s.size = 0;
     8b5:	c7 05 e4 43 00 00 00 	movl   $0x0,0x43e4
     8bc:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     8bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8c2:	8b 00                	mov    (%eax),%eax
     8c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     8c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8ca:	8b 40 04             	mov    0x4(%eax),%eax
     8cd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     8d0:	72 4d                	jb     91f <malloc+0xa6>
      if(p->s.size == nunits)
     8d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8d5:	8b 40 04             	mov    0x4(%eax),%eax
     8d8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     8db:	75 0c                	jne    8e9 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     8dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8e0:	8b 10                	mov    (%eax),%edx
     8e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8e5:	89 10                	mov    %edx,(%eax)
     8e7:	eb 26                	jmp    90f <malloc+0x96>
      else {
        p->s.size -= nunits;
     8e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8ec:	8b 40 04             	mov    0x4(%eax),%eax
     8ef:	2b 45 ec             	sub    -0x14(%ebp),%eax
     8f2:	89 c2                	mov    %eax,%edx
     8f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8f7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     8fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8fd:	8b 40 04             	mov    0x4(%eax),%eax
     900:	c1 e0 03             	shl    $0x3,%eax
     903:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     906:	8b 45 f4             	mov    -0xc(%ebp),%eax
     909:	8b 55 ec             	mov    -0x14(%ebp),%edx
     90c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     90f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     912:	a3 e8 43 00 00       	mov    %eax,0x43e8
      return (void*)(p + 1);
     917:	8b 45 f4             	mov    -0xc(%ebp),%eax
     91a:	83 c0 08             	add    $0x8,%eax
     91d:	eb 3b                	jmp    95a <malloc+0xe1>
    }
    if(p == freep)
     91f:	a1 e8 43 00 00       	mov    0x43e8,%eax
     924:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     927:	75 1e                	jne    947 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     929:	83 ec 0c             	sub    $0xc,%esp
     92c:	ff 75 ec             	pushl  -0x14(%ebp)
     92f:	e8 e5 fe ff ff       	call   819 <morecore>
     934:	83 c4 10             	add    $0x10,%esp
     937:	89 45 f4             	mov    %eax,-0xc(%ebp)
     93a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     93e:	75 07                	jne    947 <malloc+0xce>
        return 0;
     940:	b8 00 00 00 00       	mov    $0x0,%eax
     945:	eb 13                	jmp    95a <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     947:	8b 45 f4             	mov    -0xc(%ebp),%eax
     94a:	89 45 f0             	mov    %eax,-0x10(%ebp)
     94d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     950:	8b 00                	mov    (%eax),%eax
     952:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     955:	e9 6d ff ff ff       	jmp    8c7 <malloc+0x4e>
}
     95a:	c9                   	leave  
     95b:	c3                   	ret    

0000095c <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     95c:	55                   	push   %ebp
     95d:	89 e5                	mov    %esp,%ebp
     95f:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     962:	83 ec 04             	sub    $0x4,%esp
     965:	ff 75 08             	pushl  0x8(%ebp)
     968:	68 a8 36 00 00       	push   $0x36a8
     96d:	6a 02                	push   $0x2
     96f:	e8 03 fc ff ff       	call   577 <printf>
     974:	83 c4 10             	add    $0x10,%esp
  exit();
     977:	e8 4f f9 ff ff       	call   2cb <exit>

0000097c <getInteger>:
}

static int getInteger(double num)
{
     97c:	55                   	push   %ebp
     97d:	89 e5                	mov    %esp,%ebp
     97f:	83 ec 18             	sub    $0x18,%esp
     982:	8b 45 08             	mov    0x8(%ebp),%eax
     985:	89 45 e8             	mov    %eax,-0x18(%ebp)
     988:	8b 45 0c             	mov    0xc(%ebp),%eax
     98b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     98e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     995:	eb 0e                	jmp    9a5 <getInteger+0x29>
  {
    num -= 1;
     997:	dd 45 e8             	fldl   -0x18(%ebp)
     99a:	d9 e8                	fld1   
     99c:	de e9                	fsubrp %st,%st(1)
     99e:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     9a1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     9a5:	dd 45 e8             	fldl   -0x18(%ebp)
     9a8:	d9 e8                	fld1   
     9aa:	d9 c9                	fxch   %st(1)
     9ac:	df e9                	fucomip %st(1),%st
     9ae:	dd d8                	fstp   %st(0)
     9b0:	77 e5                	ja     997 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     9b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     9b5:	c9                   	leave  
     9b6:	c3                   	ret    

000009b7 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     9b7:	55                   	push   %ebp
     9b8:	89 e5                	mov    %esp,%ebp
     9ba:	53                   	push   %ebx
     9bb:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     9be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     9c5:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     9c9:	74 17                	je     9e2 <int2str+0x2b>
     9cb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     9cf:	79 11                	jns    9e2 <int2str+0x2b>
    neg = 1;
     9d1:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     9d8:	8b 45 0c             	mov    0xc(%ebp),%eax
     9db:	f7 d8                	neg    %eax
     9dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
     9e0:	eb 06                	jmp    9e8 <int2str+0x31>
  } else {
    x = num;
     9e2:	8b 45 0c             	mov    0xc(%ebp),%eax
     9e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     9e8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     9ef:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     9f2:	8d 41 01             	lea    0x1(%ecx),%eax
     9f5:	89 45 f8             	mov    %eax,-0x8(%ebp)
     9f8:	8b 5d 14             	mov    0x14(%ebp),%ebx
     9fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9fe:	ba 00 00 00 00       	mov    $0x0,%edx
     a03:	f7 f3                	div    %ebx
     a05:	89 d0                	mov    %edx,%eax
     a07:	0f b6 80 b4 42 00 00 	movzbl 0x42b4(%eax),%eax
     a0e:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     a12:	8b 5d 14             	mov    0x14(%ebp),%ebx
     a15:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a18:	ba 00 00 00 00       	mov    $0x0,%edx
     a1d:	f7 f3                	div    %ebx
     a1f:	89 45 f0             	mov    %eax,-0x10(%ebp)
     a22:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a26:	75 c7                	jne    9ef <int2str+0x38>
  if(neg)
     a28:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     a2c:	74 36                	je     a64 <int2str+0xad>
    buf[i++] = '-';
     a2e:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a31:	8d 50 01             	lea    0x1(%eax),%edx
     a34:	89 55 f8             	mov    %edx,-0x8(%ebp)
     a37:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     a3c:	eb 26                	jmp    a64 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     a3e:	8b 45 10             	mov    0x10(%ebp),%eax
     a41:	8b 00                	mov    (%eax),%eax
     a43:	89 c2                	mov    %eax,%edx
     a45:	8b 45 08             	mov    0x8(%ebp),%eax
     a48:	01 c2                	add    %eax,%edx
     a4a:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     a4d:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a50:	01 c8                	add    %ecx,%eax
     a52:	0f b6 00             	movzbl (%eax),%eax
     a55:	88 02                	mov    %al,(%edx)
    (*pos)++;
     a57:	8b 45 10             	mov    0x10(%ebp),%eax
     a5a:	8b 00                	mov    (%eax),%eax
     a5c:	8d 50 01             	lea    0x1(%eax),%edx
     a5f:	8b 45 10             	mov    0x10(%ebp),%eax
     a62:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     a64:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     a68:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     a6c:	79 d0                	jns    a3e <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     a6e:	90                   	nop
     a6f:	83 c4 20             	add    $0x20,%esp
     a72:	5b                   	pop    %ebx
     a73:	5d                   	pop    %ebp
     a74:	c3                   	ret    

00000a75 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     a75:	55                   	push   %ebp
     a76:	89 e5                	mov    %esp,%ebp
     a78:	83 ec 18             	sub    $0x18,%esp
     a7b:	8b 45 0c             	mov    0xc(%ebp),%eax
     a7e:	89 45 e8             	mov    %eax,-0x18(%ebp)
     a81:	8b 45 10             	mov    0x10(%ebp),%eax
     a84:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     a87:	d9 ee                	fldz   
     a89:	dd 45 e8             	fldl   -0x18(%ebp)
     a8c:	d9 c9                	fxch   %st(1)
     a8e:	df e9                	fucomip %st(1),%st
     a90:	dd d8                	fstp   %st(0)
     a92:	76 24                	jbe    ab8 <double2str+0x43>
  {
    buf[*pos] = '-';
     a94:	8b 45 14             	mov    0x14(%ebp),%eax
     a97:	8b 00                	mov    (%eax),%eax
     a99:	89 c2                	mov    %eax,%edx
     a9b:	8b 45 08             	mov    0x8(%ebp),%eax
     a9e:	01 d0                	add    %edx,%eax
     aa0:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     aa3:	8b 45 14             	mov    0x14(%ebp),%eax
     aa6:	8b 00                	mov    (%eax),%eax
     aa8:	8d 50 01             	lea    0x1(%eax),%edx
     aab:	8b 45 14             	mov    0x14(%ebp),%eax
     aae:	89 10                	mov    %edx,(%eax)
    num = -num;
     ab0:	dd 45 e8             	fldl   -0x18(%ebp)
     ab3:	d9 e0                	fchs   
     ab5:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     ab8:	ff 75 ec             	pushl  -0x14(%ebp)
     abb:	ff 75 e8             	pushl  -0x18(%ebp)
     abe:	e8 b9 fe ff ff       	call   97c <getInteger>
     ac3:	83 c4 08             	add    $0x8,%esp
     ac6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     ac9:	83 ec 04             	sub    $0x4,%esp
     acc:	6a 01                	push   $0x1
     ace:	6a 0a                	push   $0xa
     ad0:	ff 75 14             	pushl  0x14(%ebp)
     ad3:	ff 75 f8             	pushl  -0x8(%ebp)
     ad6:	ff 75 08             	pushl  0x8(%ebp)
     ad9:	e8 d9 fe ff ff       	call   9b7 <int2str>
     ade:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     ae1:	db 45 f8             	fildl  -0x8(%ebp)
     ae4:	dd 45 e8             	fldl   -0x18(%ebp)
     ae7:	de e1                	fsubp  %st,%st(1)
     ae9:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     aec:	dd 45 e8             	fldl   -0x18(%ebp)
     aef:	dd 05 b0 36 00 00    	fldl   0x36b0
     af5:	d9 c9                	fxch   %st(1)
     af7:	df e9                	fucomip %st(1),%st
     af9:	dd d8                	fstp   %st(0)
     afb:	76 1c                	jbe    b19 <double2str+0xa4>
  {
    buf[*pos] = '.';
     afd:	8b 45 14             	mov    0x14(%ebp),%eax
     b00:	8b 00                	mov    (%eax),%eax
     b02:	89 c2                	mov    %eax,%edx
     b04:	8b 45 08             	mov    0x8(%ebp),%eax
     b07:	01 d0                	add    %edx,%eax
     b09:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     b0c:	8b 45 14             	mov    0x14(%ebp),%eax
     b0f:	8b 00                	mov    (%eax),%eax
     b11:	8d 50 01             	lea    0x1(%eax),%edx
     b14:	8b 45 14             	mov    0x14(%ebp),%eax
     b17:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     b19:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     b20:	eb 4c                	jmp    b6e <double2str+0xf9>
  {
    num = num*10;
     b22:	dd 45 e8             	fldl   -0x18(%ebp)
     b25:	dd 05 b8 36 00 00    	fldl   0x36b8
     b2b:	de c9                	fmulp  %st,%st(1)
     b2d:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     b30:	ff 75 ec             	pushl  -0x14(%ebp)
     b33:	ff 75 e8             	pushl  -0x18(%ebp)
     b36:	e8 41 fe ff ff       	call   97c <getInteger>
     b3b:	83 c4 08             	add    $0x8,%esp
     b3e:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     b41:	83 ec 04             	sub    $0x4,%esp
     b44:	6a 01                	push   $0x1
     b46:	6a 0a                	push   $0xa
     b48:	ff 75 14             	pushl  0x14(%ebp)
     b4b:	ff 75 f8             	pushl  -0x8(%ebp)
     b4e:	ff 75 08             	pushl  0x8(%ebp)
     b51:	e8 61 fe ff ff       	call   9b7 <int2str>
     b56:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     b59:	db 45 f8             	fildl  -0x8(%ebp)
     b5c:	dd 45 e8             	fldl   -0x18(%ebp)
     b5f:	de e1                	fsubp  %st,%st(1)
     b61:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     b64:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     b68:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     b6c:	7f 13                	jg     b81 <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     b6e:	dd 45 e8             	fldl   -0x18(%ebp)
     b71:	dd 05 b0 36 00 00    	fldl   0x36b0
     b77:	d9 c9                	fxch   %st(1)
     b79:	df e9                	fucomip %st(1),%st
     b7b:	dd d8                	fstp   %st(0)
     b7d:	77 a3                	ja     b22 <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     b7f:	eb 01                	jmp    b82 <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     b81:	90                   	nop
    }
  }
}
     b82:	90                   	nop
     b83:	c9                   	leave  
     b84:	c3                   	ret    

00000b85 <pow>:

double pow(double opnd, int power)
{
     b85:	55                   	push   %ebp
     b86:	89 e5                	mov    %esp,%ebp
     b88:	83 ec 18             	sub    $0x18,%esp
     b8b:	8b 45 08             	mov    0x8(%ebp),%eax
     b8e:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b91:	8b 45 0c             	mov    0xc(%ebp),%eax
     b94:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     b97:	d9 e8                	fld1   
     b99:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     b9c:	eb 0d                	jmp    bab <pow+0x26>
  {
    result *= opnd;
     b9e:	dd 45 f8             	fldl   -0x8(%ebp)
     ba1:	dc 4d e8             	fmull  -0x18(%ebp)
     ba4:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     ba7:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     bab:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     baf:	7f ed                	jg     b9e <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     bb1:	dd 45 f8             	fldl   -0x8(%ebp)
}
     bb4:	c9                   	leave  
     bb5:	c3                   	ret    

00000bb6 <Translation>:

double Translation(char *s, int* pos)
{
     bb6:	55                   	push   %ebp
     bb7:	89 e5                	mov    %esp,%ebp
     bb9:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     bbc:	d9 ee                	fldz   
     bbe:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     bc1:	d9 ee                	fldz   
     bc3:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     bc6:	eb 3e                	jmp    c06 <Translation+0x50>
    {
        integer *= 10;
     bc8:	dd 45 f8             	fldl   -0x8(%ebp)
     bcb:	dd 05 b8 36 00 00    	fldl   0x36b8
     bd1:	de c9                	fmulp  %st,%st(1)
     bd3:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     bd6:	8b 45 0c             	mov    0xc(%ebp),%eax
     bd9:	8b 00                	mov    (%eax),%eax
     bdb:	89 c2                	mov    %eax,%edx
     bdd:	8b 45 08             	mov    0x8(%ebp),%eax
     be0:	01 d0                	add    %edx,%eax
     be2:	0f b6 00             	movzbl (%eax),%eax
     be5:	0f be c0             	movsbl %al,%eax
     be8:	83 e8 30             	sub    $0x30,%eax
     beb:	89 45 dc             	mov    %eax,-0x24(%ebp)
     bee:	db 45 dc             	fildl  -0x24(%ebp)
     bf1:	dd 45 f8             	fldl   -0x8(%ebp)
     bf4:	de c1                	faddp  %st,%st(1)
     bf6:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     bf9:	8b 45 0c             	mov    0xc(%ebp),%eax
     bfc:	8b 00                	mov    (%eax),%eax
     bfe:	8d 50 01             	lea    0x1(%eax),%edx
     c01:	8b 45 0c             	mov    0xc(%ebp),%eax
     c04:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c06:	8b 45 0c             	mov    0xc(%ebp),%eax
     c09:	8b 00                	mov    (%eax),%eax
     c0b:	89 c2                	mov    %eax,%edx
     c0d:	8b 45 08             	mov    0x8(%ebp),%eax
     c10:	01 d0                	add    %edx,%eax
     c12:	0f b6 00             	movzbl (%eax),%eax
     c15:	3c 2f                	cmp    $0x2f,%al
     c17:	7e 13                	jle    c2c <Translation+0x76>
     c19:	8b 45 0c             	mov    0xc(%ebp),%eax
     c1c:	8b 00                	mov    (%eax),%eax
     c1e:	89 c2                	mov    %eax,%edx
     c20:	8b 45 08             	mov    0x8(%ebp),%eax
     c23:	01 d0                	add    %edx,%eax
     c25:	0f b6 00             	movzbl (%eax),%eax
     c28:	3c 39                	cmp    $0x39,%al
     c2a:	7e 9c                	jle    bc8 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     c2c:	8b 45 0c             	mov    0xc(%ebp),%eax
     c2f:	8b 00                	mov    (%eax),%eax
     c31:	89 c2                	mov    %eax,%edx
     c33:	8b 45 08             	mov    0x8(%ebp),%eax
     c36:	01 d0                	add    %edx,%eax
     c38:	0f b6 00             	movzbl (%eax),%eax
     c3b:	3c 2e                	cmp    $0x2e,%al
     c3d:	0f 85 9b 00 00 00    	jne    cde <Translation+0x128>
    {
        (*pos)++;
     c43:	8b 45 0c             	mov    0xc(%ebp),%eax
     c46:	8b 00                	mov    (%eax),%eax
     c48:	8d 50 01             	lea    0x1(%eax),%edx
     c4b:	8b 45 0c             	mov    0xc(%ebp),%eax
     c4e:	89 10                	mov    %edx,(%eax)
        int c = 1;
     c50:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c57:	eb 5b                	jmp    cb4 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     c59:	8b 45 0c             	mov    0xc(%ebp),%eax
     c5c:	8b 00                	mov    (%eax),%eax
     c5e:	89 c2                	mov    %eax,%edx
     c60:	8b 45 08             	mov    0x8(%ebp),%eax
     c63:	01 d0                	add    %edx,%eax
     c65:	0f b6 00             	movzbl (%eax),%eax
     c68:	0f be c0             	movsbl %al,%eax
     c6b:	83 e8 30             	sub    $0x30,%eax
     c6e:	89 45 dc             	mov    %eax,-0x24(%ebp)
     c71:	db 45 dc             	fildl  -0x24(%ebp)
     c74:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     c77:	83 ec 04             	sub    $0x4,%esp
     c7a:	ff 75 ec             	pushl  -0x14(%ebp)
     c7d:	dd 05 c0 36 00 00    	fldl   0x36c0
     c83:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     c87:	dd 1c 24             	fstpl  (%esp)
     c8a:	e8 f6 fe ff ff       	call   b85 <pow>
     c8f:	83 c4 10             	add    $0x10,%esp
     c92:	dd 45 e0             	fldl   -0x20(%ebp)
     c95:	de c9                	fmulp  %st,%st(1)
     c97:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     c9a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     c9e:	dd 45 f0             	fldl   -0x10(%ebp)
     ca1:	dc 45 e0             	faddl  -0x20(%ebp)
     ca4:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     ca7:	8b 45 0c             	mov    0xc(%ebp),%eax
     caa:	8b 00                	mov    (%eax),%eax
     cac:	8d 50 01             	lea    0x1(%eax),%edx
     caf:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb2:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     cb4:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb7:	8b 00                	mov    (%eax),%eax
     cb9:	89 c2                	mov    %eax,%edx
     cbb:	8b 45 08             	mov    0x8(%ebp),%eax
     cbe:	01 d0                	add    %edx,%eax
     cc0:	0f b6 00             	movzbl (%eax),%eax
     cc3:	3c 2f                	cmp    $0x2f,%al
     cc5:	7e 17                	jle    cde <Translation+0x128>
     cc7:	8b 45 0c             	mov    0xc(%ebp),%eax
     cca:	8b 00                	mov    (%eax),%eax
     ccc:	89 c2                	mov    %eax,%edx
     cce:	8b 45 08             	mov    0x8(%ebp),%eax
     cd1:	01 d0                	add    %edx,%eax
     cd3:	0f b6 00             	movzbl (%eax),%eax
     cd6:	3c 39                	cmp    $0x39,%al
     cd8:	0f 8e 7b ff ff ff    	jle    c59 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     cde:	dd 45 f8             	fldl   -0x8(%ebp)
     ce1:	dc 45 f0             	faddl  -0x10(%ebp)
     ce4:	c9                   	leave  
     ce5:	c3                   	ret    

00000ce6 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     ce6:	55                   	push   %ebp
     ce7:	89 e5                	mov    %esp,%ebp
     ce9:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     cec:	e8 d2 f5 ff ff       	call   2c3 <fork>
     cf1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     cf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     cf7:	c9                   	leave  
     cf8:	c3                   	ret    

00000cf9 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     cf9:	55                   	push   %ebp
     cfa:	89 e5                	mov    %esp,%ebp
     cfc:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     cff:	83 ec 0c             	sub    $0xc,%esp
     d02:	6a 54                	push   $0x54
     d04:	e8 70 fb ff ff       	call   879 <malloc>
     d09:	83 c4 10             	add    $0x10,%esp
     d0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     d0f:	83 ec 04             	sub    $0x4,%esp
     d12:	6a 54                	push   $0x54
     d14:	6a 00                	push   $0x0
     d16:	ff 75 f4             	pushl  -0xc(%ebp)
     d19:	e8 12 f4 ff ff       	call   130 <memset>
     d1e:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     d21:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d24:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     d2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d2d:	c9                   	leave  
     d2e:	c3                   	ret    

00000d2f <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     d2f:	55                   	push   %ebp
     d30:	89 e5                	mov    %esp,%ebp
     d32:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d35:	83 ec 0c             	sub    $0xc,%esp
     d38:	6a 18                	push   $0x18
     d3a:	e8 3a fb ff ff       	call   879 <malloc>
     d3f:	83 c4 10             	add    $0x10,%esp
     d42:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     d45:	83 ec 04             	sub    $0x4,%esp
     d48:	6a 18                	push   $0x18
     d4a:	6a 00                	push   $0x0
     d4c:	ff 75 f4             	pushl  -0xc(%ebp)
     d4f:	e8 dc f3 ff ff       	call   130 <memset>
     d54:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     d57:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d5a:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     d60:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d63:	8b 55 08             	mov    0x8(%ebp),%edx
     d66:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     d69:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d6c:	8b 55 0c             	mov    0xc(%ebp),%edx
     d6f:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     d72:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d75:	8b 55 10             	mov    0x10(%ebp),%edx
     d78:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     d7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d7e:	8b 55 14             	mov    0x14(%ebp),%edx
     d81:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     d84:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d87:	8b 55 18             	mov    0x18(%ebp),%edx
     d8a:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     d8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d90:	c9                   	leave  
     d91:	c3                   	ret    

00000d92 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     d92:	55                   	push   %ebp
     d93:	89 e5                	mov    %esp,%ebp
     d95:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d98:	83 ec 0c             	sub    $0xc,%esp
     d9b:	6a 0c                	push   $0xc
     d9d:	e8 d7 fa ff ff       	call   879 <malloc>
     da2:	83 c4 10             	add    $0x10,%esp
     da5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     da8:	83 ec 04             	sub    $0x4,%esp
     dab:	6a 0c                	push   $0xc
     dad:	6a 00                	push   $0x0
     daf:	ff 75 f4             	pushl  -0xc(%ebp)
     db2:	e8 79 f3 ff ff       	call   130 <memset>
     db7:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     dba:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dbd:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     dc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dc6:	8b 55 08             	mov    0x8(%ebp),%edx
     dc9:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     dcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dcf:	8b 55 0c             	mov    0xc(%ebp),%edx
     dd2:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     dd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     dd8:	c9                   	leave  
     dd9:	c3                   	ret    

00000dda <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     dda:	55                   	push   %ebp
     ddb:	89 e5                	mov    %esp,%ebp
     ddd:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     de0:	83 ec 0c             	sub    $0xc,%esp
     de3:	6a 0c                	push   $0xc
     de5:	e8 8f fa ff ff       	call   879 <malloc>
     dea:	83 c4 10             	add    $0x10,%esp
     ded:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     df0:	83 ec 04             	sub    $0x4,%esp
     df3:	6a 0c                	push   $0xc
     df5:	6a 00                	push   $0x0
     df7:	ff 75 f4             	pushl  -0xc(%ebp)
     dfa:	e8 31 f3 ff ff       	call   130 <memset>
     dff:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     e02:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e05:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     e0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e0e:	8b 55 08             	mov    0x8(%ebp),%edx
     e11:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     e14:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e17:	8b 55 0c             	mov    0xc(%ebp),%edx
     e1a:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     e1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e20:	c9                   	leave  
     e21:	c3                   	ret    

00000e22 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     e22:	55                   	push   %ebp
     e23:	89 e5                	mov    %esp,%ebp
     e25:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e28:	83 ec 0c             	sub    $0xc,%esp
     e2b:	6a 08                	push   $0x8
     e2d:	e8 47 fa ff ff       	call   879 <malloc>
     e32:	83 c4 10             	add    $0x10,%esp
     e35:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e38:	83 ec 04             	sub    $0x4,%esp
     e3b:	6a 08                	push   $0x8
     e3d:	6a 00                	push   $0x0
     e3f:	ff 75 f4             	pushl  -0xc(%ebp)
     e42:	e8 e9 f2 ff ff       	call   130 <memset>
     e47:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
     e4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e4d:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     e53:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e56:	8b 55 08             	mov    0x8(%ebp),%edx
     e59:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     e5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e5f:	c9                   	leave  
     e60:	c3                   	ret    

00000e61 <calcmd>:

struct cmd* calcmd(char *_line)
{
     e61:	55                   	push   %ebp
     e62:	89 e5                	mov    %esp,%ebp
     e64:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e67:	83 ec 0c             	sub    $0xc,%esp
     e6a:	6a 08                	push   $0x8
     e6c:	e8 08 fa ff ff       	call   879 <malloc>
     e71:	83 c4 10             	add    $0x10,%esp
     e74:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e77:	83 ec 04             	sub    $0x4,%esp
     e7a:	6a 08                	push   $0x8
     e7c:	6a 00                	push   $0x0
     e7e:	ff 75 f4             	pushl  -0xc(%ebp)
     e81:	e8 aa f2 ff ff       	call   130 <memset>
     e86:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
     e89:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e8c:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
     e92:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e95:	8b 55 08             	mov    0x8(%ebp),%edx
     e98:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     e9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e9e:	c9                   	leave  
     e9f:	c3                   	ret    

00000ea0 <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
     ea3:	eb 0c                	jmp    eb1 <mystrncmp+0x11>
    n--, p++, q++;
     ea5:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     ea9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     ead:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
     eb1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     eb5:	74 1a                	je     ed1 <mystrncmp+0x31>
     eb7:	8b 45 08             	mov    0x8(%ebp),%eax
     eba:	0f b6 00             	movzbl (%eax),%eax
     ebd:	84 c0                	test   %al,%al
     ebf:	74 10                	je     ed1 <mystrncmp+0x31>
     ec1:	8b 45 08             	mov    0x8(%ebp),%eax
     ec4:	0f b6 10             	movzbl (%eax),%edx
     ec7:	8b 45 0c             	mov    0xc(%ebp),%eax
     eca:	0f b6 00             	movzbl (%eax),%eax
     ecd:	38 c2                	cmp    %al,%dl
     ecf:	74 d4                	je     ea5 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
     ed1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     ed5:	75 07                	jne    ede <mystrncmp+0x3e>
    return 0;
     ed7:	b8 00 00 00 00       	mov    $0x0,%eax
     edc:	eb 16                	jmp    ef4 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
     ede:	8b 45 08             	mov    0x8(%ebp),%eax
     ee1:	0f b6 00             	movzbl (%eax),%eax
     ee4:	0f b6 d0             	movzbl %al,%edx
     ee7:	8b 45 0c             	mov    0xc(%ebp),%eax
     eea:	0f b6 00             	movzbl (%eax),%eax
     eed:	0f b6 c0             	movzbl %al,%eax
     ef0:	29 c2                	sub    %eax,%edx
     ef2:	89 d0                	mov    %edx,%eax
}
     ef4:	5d                   	pop    %ebp
     ef5:	c3                   	ret    

00000ef6 <mystrlen>:

static int mystrlen(const char *s)
{
     ef6:	55                   	push   %ebp
     ef7:	89 e5                	mov    %esp,%ebp
     ef9:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
     efc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     f03:	eb 04                	jmp    f09 <mystrlen+0x13>
     f05:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     f09:	8b 55 fc             	mov    -0x4(%ebp),%edx
     f0c:	8b 45 08             	mov    0x8(%ebp),%eax
     f0f:	01 d0                	add    %edx,%eax
     f11:	0f b6 00             	movzbl (%eax),%eax
     f14:	84 c0                	test   %al,%al
     f16:	75 ed                	jne    f05 <mystrlen+0xf>
    ;
  return n;
     f18:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f1b:	c9                   	leave  
     f1c:	c3                   	ret    

00000f1d <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
     f1d:	55                   	push   %ebp
     f1e:	89 e5                	mov    %esp,%ebp
     f20:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
     f23:	8b 45 08             	mov    0x8(%ebp),%eax
     f26:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
     f29:	90                   	nop
     f2a:	8b 45 10             	mov    0x10(%ebp),%eax
     f2d:	8d 50 ff             	lea    -0x1(%eax),%edx
     f30:	89 55 10             	mov    %edx,0x10(%ebp)
     f33:	85 c0                	test   %eax,%eax
     f35:	7e 2c                	jle    f63 <mystrncpy+0x46>
     f37:	8b 45 08             	mov    0x8(%ebp),%eax
     f3a:	8d 50 01             	lea    0x1(%eax),%edx
     f3d:	89 55 08             	mov    %edx,0x8(%ebp)
     f40:	8b 55 0c             	mov    0xc(%ebp),%edx
     f43:	8d 4a 01             	lea    0x1(%edx),%ecx
     f46:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     f49:	0f b6 12             	movzbl (%edx),%edx
     f4c:	88 10                	mov    %dl,(%eax)
     f4e:	0f b6 00             	movzbl (%eax),%eax
     f51:	84 c0                	test   %al,%al
     f53:	75 d5                	jne    f2a <mystrncpy+0xd>
    ;
  while(n-- > 0)
     f55:	eb 0c                	jmp    f63 <mystrncpy+0x46>
    *s++ = 0;
     f57:	8b 45 08             	mov    0x8(%ebp),%eax
     f5a:	8d 50 01             	lea    0x1(%eax),%edx
     f5d:	89 55 08             	mov    %edx,0x8(%ebp)
     f60:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
     f63:	8b 45 10             	mov    0x10(%ebp),%eax
     f66:	8d 50 ff             	lea    -0x1(%eax),%edx
     f69:	89 55 10             	mov    %edx,0x10(%ebp)
     f6c:	85 c0                	test   %eax,%eax
     f6e:	7f e7                	jg     f57 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
     f70:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f73:	c9                   	leave  
     f74:	c3                   	ret    

00000f75 <isEqual>:

int isEqual(double a, double b)
{
     f75:	55                   	push   %ebp
     f76:	89 e5                	mov    %esp,%ebp
     f78:	83 ec 10             	sub    $0x10,%esp
     f7b:	8b 45 08             	mov    0x8(%ebp),%eax
     f7e:	89 45 f8             	mov    %eax,-0x8(%ebp)
     f81:	8b 45 0c             	mov    0xc(%ebp),%eax
     f84:	89 45 fc             	mov    %eax,-0x4(%ebp)
     f87:	8b 45 10             	mov    0x10(%ebp),%eax
     f8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
     f8d:	8b 45 14             	mov    0x14(%ebp),%eax
     f90:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
     f93:	dd 45 f8             	fldl   -0x8(%ebp)
     f96:	dc 65 f0             	fsubl  -0x10(%ebp)
     f99:	dd 05 90 38 00 00    	fldl   0x3890
     f9f:	df e9                	fucomip %st(1),%st
     fa1:	dd d8                	fstp   %st(0)
     fa3:	76 19                	jbe    fbe <isEqual+0x49>
     fa5:	dd 45 f0             	fldl   -0x10(%ebp)
     fa8:	dc 65 f8             	fsubl  -0x8(%ebp)
     fab:	dd 05 90 38 00 00    	fldl   0x3890
     fb1:	df e9                	fucomip %st(1),%st
     fb3:	dd d8                	fstp   %st(0)
     fb5:	76 07                	jbe    fbe <isEqual+0x49>
    return 1;
     fb7:	b8 01 00 00 00       	mov    $0x1,%eax
     fbc:	eb 05                	jmp    fc3 <isEqual+0x4e>
  return 0;
     fbe:	b8 00 00 00 00       	mov    $0x0,%eax
}
     fc3:	c9                   	leave  
     fc4:	c3                   	ret    

00000fc5 <isCmdName>:

int isCmdName(const char* str)
{
     fc5:	55                   	push   %ebp
     fc6:	89 e5                	mov    %esp,%ebp
     fc8:	53                   	push   %ebx
     fc9:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
     fcc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     fd3:	eb 71                	jmp    1046 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
     fd5:	8b 55 f4             	mov    -0xc(%ebp),%edx
     fd8:	89 d0                	mov    %edx,%eax
     fda:	c1 e0 02             	shl    $0x2,%eax
     fdd:	01 d0                	add    %edx,%eax
     fdf:	01 c0                	add    %eax,%eax
     fe1:	05 e0 42 00 00       	add    $0x42e0,%eax
     fe6:	83 ec 0c             	sub    $0xc,%esp
     fe9:	50                   	push   %eax
     fea:	e8 1a f1 ff ff       	call   109 <strlen>
     fef:	83 c4 10             	add    $0x10,%esp
     ff2:	89 c3                	mov    %eax,%ebx
     ff4:	83 ec 0c             	sub    $0xc,%esp
     ff7:	ff 75 08             	pushl  0x8(%ebp)
     ffa:	e8 f7 fe ff ff       	call   ef6 <mystrlen>
     fff:	83 c4 10             	add    $0x10,%esp
    1002:	39 c3                	cmp    %eax,%ebx
    1004:	75 3c                	jne    1042 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    1006:	83 ec 0c             	sub    $0xc,%esp
    1009:	ff 75 08             	pushl  0x8(%ebp)
    100c:	e8 e5 fe ff ff       	call   ef6 <mystrlen>
    1011:	83 c4 10             	add    $0x10,%esp
    1014:	89 c1                	mov    %eax,%ecx
    1016:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1019:	89 d0                	mov    %edx,%eax
    101b:	c1 e0 02             	shl    $0x2,%eax
    101e:	01 d0                	add    %edx,%eax
    1020:	01 c0                	add    %eax,%eax
    1022:	05 e0 42 00 00       	add    $0x42e0,%eax
    1027:	83 ec 04             	sub    $0x4,%esp
    102a:	51                   	push   %ecx
    102b:	ff 75 08             	pushl  0x8(%ebp)
    102e:	50                   	push   %eax
    102f:	e8 6c fe ff ff       	call   ea0 <mystrncmp>
    1034:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1037:	85 c0                	test   %eax,%eax
    1039:	75 07                	jne    1042 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    103b:	b8 01 00 00 00       	mov    $0x1,%eax
    1040:	eb 0f                	jmp    1051 <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    1042:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1046:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    104a:	7e 89                	jle    fd5 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    104c:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1051:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1054:	c9                   	leave  
    1055:	c3                   	ret    

00001056 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    1056:	55                   	push   %ebp
    1057:	89 e5                	mov    %esp,%ebp
    1059:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    105f:	83 ec 08             	sub    $0x8,%esp
    1062:	6a 00                	push   $0x0
    1064:	68 a8 43 00 00       	push   $0x43a8
    1069:	e8 9d f2 ff ff       	call   30b <open>
    106e:	83 c4 10             	add    $0x10,%esp
    1071:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1074:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1078:	79 0a                	jns    1084 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    107a:	b8 00 00 00 00       	mov    $0x0,%eax
    107f:	e9 9a 01 00 00       	jmp    121e <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    1084:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    108b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1092:	e9 ee 00 00 00       	jmp    1185 <findAlias+0x12f>
  {
      int isSame = 1;
    1097:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    109e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    10a5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    10ac:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    10b3:	83 ec 0c             	sub    $0xc,%esp
    10b6:	8d 45 9a             	lea    -0x66(%ebp),%eax
    10b9:	50                   	push   %eax
    10ba:	e8 4a f0 ff ff       	call   109 <strlen>
    10bf:	83 c4 10             	add    $0x10,%esp
    10c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    10c5:	83 ec 0c             	sub    $0xc,%esp
    10c8:	ff 75 08             	pushl  0x8(%ebp)
    10cb:	e8 39 f0 ff ff       	call   109 <strlen>
    10d0:	83 c4 10             	add    $0x10,%esp
    10d3:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    10d6:	8d 55 9a             	lea    -0x66(%ebp),%edx
    10d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10dc:	01 d0                	add    %edx,%eax
    10de:	0f b6 00             	movzbl (%eax),%eax
    10e1:	3c 21                	cmp    $0x21,%al
    10e3:	75 38                	jne    111d <findAlias+0xc7>
      {
          startIndex++;
    10e5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    10e9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    10f0:	eb 2b                	jmp    111d <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    10f2:	8d 55 9a             	lea    -0x66(%ebp),%edx
    10f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10f8:	01 d0                	add    %edx,%eax
    10fa:	0f b6 10             	movzbl (%eax),%edx
    10fd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    1100:	8b 45 08             	mov    0x8(%ebp),%eax
    1103:	01 c8                	add    %ecx,%eax
    1105:	0f b6 00             	movzbl (%eax),%eax
    1108:	38 c2                	cmp    %al,%dl
    110a:	74 09                	je     1115 <findAlias+0xbf>
          {
              isSame = 0;
    110c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    1113:	eb 1f                	jmp    1134 <findAlias+0xde>
          }
          startIndex++;
    1115:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    1119:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    111d:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1120:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1123:	01 d0                	add    %edx,%eax
    1125:	0f b6 00             	movzbl (%eax),%eax
    1128:	3c 3d                	cmp    $0x3d,%al
    112a:	74 08                	je     1134 <findAlias+0xde>
    112c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    112f:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1132:	7c be                	jl     10f2 <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    1134:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1137:	8b 45 e8             	mov    -0x18(%ebp),%eax
    113a:	01 d0                	add    %edx,%eax
    113c:	0f b6 00             	movzbl (%eax),%eax
    113f:	3c 3d                	cmp    $0x3d,%al
    1141:	75 08                	jne    114b <findAlias+0xf5>
    1143:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1146:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1149:	7d 07                	jge    1152 <findAlias+0xfc>
      {
          isSame = 0;
    114b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    1152:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    1156:	75 0b                	jne    1163 <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    1158:	b8 01 00 00 00       	mov    $0x1,%eax
    115d:	2b 45 f0             	sub    -0x10(%ebp),%eax
    1160:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    1163:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1167:	75 1c                	jne    1185 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    1169:	83 ec 08             	sub    $0x8,%esp
    116c:	8d 45 9a             	lea    -0x66(%ebp),%eax
    116f:	50                   	push   %eax
    1170:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1176:	50                   	push   %eax
    1177:	e8 1e ef ff ff       	call   9a <strcpy>
    117c:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    117f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1182:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1185:	83 ec 04             	sub    $0x4,%esp
    1188:	6a 32                	push   $0x32
    118a:	8d 45 9a             	lea    -0x66(%ebp),%eax
    118d:	50                   	push   %eax
    118e:	ff 75 dc             	pushl  -0x24(%ebp)
    1191:	e8 4d f1 ff ff       	call   2e3 <read>
    1196:	83 c4 10             	add    $0x10,%esp
    1199:	89 45 d8             	mov    %eax,-0x28(%ebp)
    119c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    11a0:	0f 8f f1 fe ff ff    	jg     1097 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    11a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11aa:	75 5f                	jne    120b <findAlias+0x1b5>
  {
    int i = 0;
    11ac:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    11b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    11b7:	eb 20                	jmp    11d9 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    11b9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    11bc:	8b 45 0c             	mov    0xc(%ebp),%eax
    11bf:	01 c2                	add    %eax,%edx
    11c1:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    11c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11ca:	01 c8                	add    %ecx,%eax
    11cc:	0f b6 00             	movzbl (%eax),%eax
    11cf:	88 02                	mov    %al,(%edx)
      i++;
    11d1:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    11d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    11d9:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    11df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11e2:	01 d0                	add    %edx,%eax
    11e4:	0f b6 00             	movzbl (%eax),%eax
    11e7:	84 c0                	test   %al,%al
    11e9:	75 ce                	jne    11b9 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    11eb:	8b 55 e0             	mov    -0x20(%ebp),%edx
    11ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    11f1:	01 d0                	add    %edx,%eax
    11f3:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    11f6:	83 ec 0c             	sub    $0xc,%esp
    11f9:	ff 75 dc             	pushl  -0x24(%ebp)
    11fc:	e8 f2 f0 ff ff       	call   2f3 <close>
    1201:	83 c4 10             	add    $0x10,%esp
    return 1;
    1204:	b8 01 00 00 00       	mov    $0x1,%eax
    1209:	eb 13                	jmp    121e <findAlias+0x1c8>
  }
  close(fd);
    120b:	83 ec 0c             	sub    $0xc,%esp
    120e:	ff 75 dc             	pushl  -0x24(%ebp)
    1211:	e8 dd f0 ff ff       	call   2f3 <close>
    1216:	83 c4 10             	add    $0x10,%esp
  return 0;
    1219:	b8 00 00 00 00       	mov    $0x0,%eax
}
    121e:	c9                   	leave  
    121f:	c3                   	ret    

00001220 <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1226:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    122a:	75 05                	jne    1231 <runcmd+0x11>
    exit();
    122c:	e8 9a f0 ff ff       	call   2cb <exit>
  
  switch(cmd->type){
    1231:	8b 45 08             	mov    0x8(%ebp),%eax
    1234:	8b 00                	mov    (%eax),%eax
    1236:	83 f8 05             	cmp    $0x5,%eax
    1239:	77 09                	ja     1244 <runcmd+0x24>
    123b:	8b 04 85 f4 36 00 00 	mov    0x36f4(,%eax,4),%eax
    1242:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    1244:	83 ec 0c             	sub    $0xc,%esp
    1247:	68 c8 36 00 00       	push   $0x36c8
    124c:	e8 0b f7 ff ff       	call   95c <panic1>
    1251:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    1254:	8b 45 08             	mov    0x8(%ebp),%eax
    1257:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    125a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    125d:	8b 40 04             	mov    0x4(%eax),%eax
    1260:	85 c0                	test   %eax,%eax
    1262:	75 05                	jne    1269 <runcmd+0x49>
      exit();
    1264:	e8 62 f0 ff ff       	call   2cb <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    1269:	8b 45 f4             	mov    -0xc(%ebp),%eax
    126c:	8b 40 04             	mov    0x4(%eax),%eax
    126f:	83 ec 0c             	sub    $0xc,%esp
    1272:	50                   	push   %eax
    1273:	e8 4d fd ff ff       	call   fc5 <isCmdName>
    1278:	83 c4 10             	add    $0x10,%esp
    127b:	85 c0                	test   %eax,%eax
    127d:	75 37                	jne    12b6 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    127f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1282:	8b 40 04             	mov    0x4(%eax),%eax
    1285:	83 ec 08             	sub    $0x8,%esp
    1288:	8d 55 ce             	lea    -0x32(%ebp),%edx
    128b:	52                   	push   %edx
    128c:	50                   	push   %eax
    128d:	e8 c4 fd ff ff       	call   1056 <findAlias>
    1292:	83 c4 10             	add    $0x10,%esp
    1295:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    1298:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    129c:	75 31                	jne    12cf <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    129e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12a1:	83 c0 04             	add    $0x4,%eax
    12a4:	83 ec 08             	sub    $0x8,%esp
    12a7:	50                   	push   %eax
    12a8:	8d 45 ce             	lea    -0x32(%ebp),%eax
    12ab:	50                   	push   %eax
    12ac:	e8 52 f0 ff ff       	call   303 <exec>
    12b1:	83 c4 10             	add    $0x10,%esp
    12b4:	eb 19                	jmp    12cf <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    12b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12b9:	8d 50 04             	lea    0x4(%eax),%edx
    12bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12bf:	8b 40 04             	mov    0x4(%eax),%eax
    12c2:	83 ec 08             	sub    $0x8,%esp
    12c5:	52                   	push   %edx
    12c6:	50                   	push   %eax
    12c7:	e8 37 f0 ff ff       	call   303 <exec>
    12cc:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    12cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12d2:	8b 40 04             	mov    0x4(%eax),%eax
    12d5:	83 ec 04             	sub    $0x4,%esp
    12d8:	50                   	push   %eax
    12d9:	68 cf 36 00 00       	push   $0x36cf
    12de:	6a 02                	push   $0x2
    12e0:	e8 92 f2 ff ff       	call   577 <printf>
    12e5:	83 c4 10             	add    $0x10,%esp
    break;
    12e8:	e9 c6 01 00 00       	jmp    14b3 <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    12ed:	8b 45 08             	mov    0x8(%ebp),%eax
    12f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    12f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12f6:	8b 40 14             	mov    0x14(%eax),%eax
    12f9:	83 ec 0c             	sub    $0xc,%esp
    12fc:	50                   	push   %eax
    12fd:	e8 f1 ef ff ff       	call   2f3 <close>
    1302:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    1305:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1308:	8b 50 10             	mov    0x10(%eax),%edx
    130b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    130e:	8b 40 08             	mov    0x8(%eax),%eax
    1311:	83 ec 08             	sub    $0x8,%esp
    1314:	52                   	push   %edx
    1315:	50                   	push   %eax
    1316:	e8 f0 ef ff ff       	call   30b <open>
    131b:	83 c4 10             	add    $0x10,%esp
    131e:	85 c0                	test   %eax,%eax
    1320:	79 1e                	jns    1340 <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    1322:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1325:	8b 40 08             	mov    0x8(%eax),%eax
    1328:	83 ec 04             	sub    $0x4,%esp
    132b:	50                   	push   %eax
    132c:	68 df 36 00 00       	push   $0x36df
    1331:	6a 02                	push   $0x2
    1333:	e8 3f f2 ff ff       	call   577 <printf>
    1338:	83 c4 10             	add    $0x10,%esp
      exit();
    133b:	e8 8b ef ff ff       	call   2cb <exit>
    }
    runcmd(rcmd->cmd);
    1340:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1343:	8b 40 04             	mov    0x4(%eax),%eax
    1346:	83 ec 0c             	sub    $0xc,%esp
    1349:	50                   	push   %eax
    134a:	e8 d1 fe ff ff       	call   1220 <runcmd>
    134f:	83 c4 10             	add    $0x10,%esp
    break;
    1352:	e9 5c 01 00 00       	jmp    14b3 <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    1357:	8b 45 08             	mov    0x8(%ebp),%eax
    135a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    135d:	e8 84 f9 ff ff       	call   ce6 <fork1>
    1362:	85 c0                	test   %eax,%eax
    1364:	75 12                	jne    1378 <runcmd+0x158>
      runcmd(lcmd->left);
    1366:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1369:	8b 40 04             	mov    0x4(%eax),%eax
    136c:	83 ec 0c             	sub    $0xc,%esp
    136f:	50                   	push   %eax
    1370:	e8 ab fe ff ff       	call   1220 <runcmd>
    1375:	83 c4 10             	add    $0x10,%esp
    wait();
    1378:	e8 56 ef ff ff       	call   2d3 <wait>
    runcmd(lcmd->right);
    137d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1380:	8b 40 08             	mov    0x8(%eax),%eax
    1383:	83 ec 0c             	sub    $0xc,%esp
    1386:	50                   	push   %eax
    1387:	e8 94 fe ff ff       	call   1220 <runcmd>
    138c:	83 c4 10             	add    $0x10,%esp
    break;
    138f:	e9 1f 01 00 00       	jmp    14b3 <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    1394:	8b 45 08             	mov    0x8(%ebp),%eax
    1397:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    139a:	83 ec 0c             	sub    $0xc,%esp
    139d:	8d 45 d8             	lea    -0x28(%ebp),%eax
    13a0:	50                   	push   %eax
    13a1:	e8 35 ef ff ff       	call   2db <pipe>
    13a6:	83 c4 10             	add    $0x10,%esp
    13a9:	85 c0                	test   %eax,%eax
    13ab:	79 10                	jns    13bd <runcmd+0x19d>
      panic1("pipe");
    13ad:	83 ec 0c             	sub    $0xc,%esp
    13b0:	68 ef 36 00 00       	push   $0x36ef
    13b5:	e8 a2 f5 ff ff       	call   95c <panic1>
    13ba:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    13bd:	e8 24 f9 ff ff       	call   ce6 <fork1>
    13c2:	85 c0                	test   %eax,%eax
    13c4:	75 4c                	jne    1412 <runcmd+0x1f2>
      close(1);
    13c6:	83 ec 0c             	sub    $0xc,%esp
    13c9:	6a 01                	push   $0x1
    13cb:	e8 23 ef ff ff       	call   2f3 <close>
    13d0:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    13d3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    13d6:	83 ec 0c             	sub    $0xc,%esp
    13d9:	50                   	push   %eax
    13da:	e8 64 ef ff ff       	call   343 <dup>
    13df:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    13e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    13e5:	83 ec 0c             	sub    $0xc,%esp
    13e8:	50                   	push   %eax
    13e9:	e8 05 ef ff ff       	call   2f3 <close>
    13ee:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    13f1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    13f4:	83 ec 0c             	sub    $0xc,%esp
    13f7:	50                   	push   %eax
    13f8:	e8 f6 ee ff ff       	call   2f3 <close>
    13fd:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    1400:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1403:	8b 40 04             	mov    0x4(%eax),%eax
    1406:	83 ec 0c             	sub    $0xc,%esp
    1409:	50                   	push   %eax
    140a:	e8 11 fe ff ff       	call   1220 <runcmd>
    140f:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    1412:	e8 cf f8 ff ff       	call   ce6 <fork1>
    1417:	85 c0                	test   %eax,%eax
    1419:	75 4c                	jne    1467 <runcmd+0x247>
      close(0);
    141b:	83 ec 0c             	sub    $0xc,%esp
    141e:	6a 00                	push   $0x0
    1420:	e8 ce ee ff ff       	call   2f3 <close>
    1425:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    1428:	8b 45 d8             	mov    -0x28(%ebp),%eax
    142b:	83 ec 0c             	sub    $0xc,%esp
    142e:	50                   	push   %eax
    142f:	e8 0f ef ff ff       	call   343 <dup>
    1434:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1437:	8b 45 d8             	mov    -0x28(%ebp),%eax
    143a:	83 ec 0c             	sub    $0xc,%esp
    143d:	50                   	push   %eax
    143e:	e8 b0 ee ff ff       	call   2f3 <close>
    1443:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    1446:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1449:	83 ec 0c             	sub    $0xc,%esp
    144c:	50                   	push   %eax
    144d:	e8 a1 ee ff ff       	call   2f3 <close>
    1452:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    1455:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1458:	8b 40 08             	mov    0x8(%eax),%eax
    145b:	83 ec 0c             	sub    $0xc,%esp
    145e:	50                   	push   %eax
    145f:	e8 bc fd ff ff       	call   1220 <runcmd>
    1464:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    1467:	8b 45 d8             	mov    -0x28(%ebp),%eax
    146a:	83 ec 0c             	sub    $0xc,%esp
    146d:	50                   	push   %eax
    146e:	e8 80 ee ff ff       	call   2f3 <close>
    1473:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    1476:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1479:	83 ec 0c             	sub    $0xc,%esp
    147c:	50                   	push   %eax
    147d:	e8 71 ee ff ff       	call   2f3 <close>
    1482:	83 c4 10             	add    $0x10,%esp
    wait();
    1485:	e8 49 ee ff ff       	call   2d3 <wait>
    wait();
    148a:	e8 44 ee ff ff       	call   2d3 <wait>
    break;
    148f:	eb 22                	jmp    14b3 <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    1491:	8b 45 08             	mov    0x8(%ebp),%eax
    1494:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    1497:	e8 4a f8 ff ff       	call   ce6 <fork1>
    149c:	85 c0                	test   %eax,%eax
    149e:	75 12                	jne    14b2 <runcmd+0x292>
      runcmd(bcmd->cmd);
    14a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    14a3:	8b 40 04             	mov    0x4(%eax),%eax
    14a6:	83 ec 0c             	sub    $0xc,%esp
    14a9:	50                   	push   %eax
    14aa:	e8 71 fd ff ff       	call   1220 <runcmd>
    14af:	83 c4 10             	add    $0x10,%esp
    break;
    14b2:	90                   	nop
  }
  exit();
    14b3:	e8 13 ee ff ff       	call   2cb <exit>

000014b8 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    14b8:	55                   	push   %ebp
    14b9:	89 e5                	mov    %esp,%ebp
    14bb:	83 ec 04             	sub    $0x4,%esp
    14be:	8b 45 08             	mov    0x8(%ebp),%eax
    14c1:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    14c4:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    14c8:	7e 0d                	jle    14d7 <isNameChar+0x1f>
    14ca:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    14ce:	7f 07                	jg     14d7 <isNameChar+0x1f>
    return 1;
    14d0:	b8 01 00 00 00       	mov    $0x1,%eax
    14d5:	eb 38                	jmp    150f <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    14d7:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    14db:	7e 0d                	jle    14ea <isNameChar+0x32>
    14dd:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    14e1:	7f 07                	jg     14ea <isNameChar+0x32>
    return 1;
    14e3:	b8 01 00 00 00       	mov    $0x1,%eax
    14e8:	eb 25                	jmp    150f <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    14ea:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    14ee:	7e 0d                	jle    14fd <isNameChar+0x45>
    14f0:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    14f4:	7f 07                	jg     14fd <isNameChar+0x45>
    return 1;
    14f6:	b8 01 00 00 00       	mov    $0x1,%eax
    14fb:	eb 12                	jmp    150f <isNameChar+0x57>
  if(ch == '_')
    14fd:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    1501:	75 07                	jne    150a <isNameChar+0x52>
    return 1;
    1503:	b8 01 00 00 00       	mov    $0x1,%eax
    1508:	eb 05                	jmp    150f <isNameChar+0x57>
  return 0;
    150a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    150f:	c9                   	leave  
    1510:	c3                   	ret    

00001511 <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    1511:	55                   	push   %ebp
    1512:	89 e5                	mov    %esp,%ebp
    1514:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    1517:	8b 45 08             	mov    0x8(%ebp),%eax
    151a:	8b 40 04             	mov    0x4(%eax),%eax
    151d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    1520:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    1527:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    152e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1535:	eb 1d                	jmp    1554 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    1537:	8b 55 ec             	mov    -0x14(%ebp),%edx
    153a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    153d:	01 d0                	add    %edx,%eax
    153f:	0f b6 00             	movzbl (%eax),%eax
    1542:	3c 3d                	cmp    $0x3d,%al
    1544:	75 0a                	jne    1550 <runCalcmd+0x3f>
    {
      hasEqu++;
    1546:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    154a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    154d:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    1550:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1554:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1557:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    155a:	01 d0                	add    %edx,%eax
    155c:	0f b6 00             	movzbl (%eax),%eax
    155f:	84 c0                	test   %al,%al
    1561:	75 d4                	jne    1537 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    1563:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1567:	7e 1d                	jle    1586 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    1569:	83 ec 0c             	sub    $0xc,%esp
    156c:	68 0c 37 00 00       	push   $0x370c
    1571:	6a 00                	push   $0x0
    1573:	6a 00                	push   $0x0
    1575:	6a 01                	push   $0x1
    1577:	6a 04                	push   $0x4
    1579:	e8 21 17 00 00       	call   2c9f <color_printf>
    157e:	83 c4 20             	add    $0x20,%esp
    1581:	e9 78 05 00 00       	jmp    1afe <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    1586:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    158a:	0f 85 26 05 00 00    	jne    1ab6 <runCalcmd+0x5a5>
  {
    int i=0;
    1590:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    1597:	eb 04                	jmp    159d <runCalcmd+0x8c>
    {
      i++;
    1599:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    159d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    15a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15a3:	01 d0                	add    %edx,%eax
    15a5:	0f b6 00             	movzbl (%eax),%eax
    15a8:	3c 20                	cmp    $0x20,%al
    15aa:	74 ed                	je     1599 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    15ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15af:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    15b2:	eb 23                	jmp    15d7 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    15b4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    15b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15ba:	01 d0                	add    %edx,%eax
    15bc:	0f b6 00             	movzbl (%eax),%eax
    15bf:	0f be c0             	movsbl %al,%eax
    15c2:	83 ec 0c             	sub    $0xc,%esp
    15c5:	50                   	push   %eax
    15c6:	e8 ed fe ff ff       	call   14b8 <isNameChar>
    15cb:	83 c4 10             	add    $0x10,%esp
    15ce:	83 f8 01             	cmp    $0x1,%eax
    15d1:	75 0e                	jne    15e1 <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    15d3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    15d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15da:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    15dd:	7c d5                	jl     15b4 <runCalcmd+0xa3>
    15df:	eb 01                	jmp    15e2 <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    15e1:	90                   	nop
    }
    int len = i-startIndex;
    15e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15e5:	2b 45 d0             	sub    -0x30(%ebp),%eax
    15e8:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    15eb:	eb 04                	jmp    15f1 <runCalcmd+0xe0>
    {
      i++;
    15ed:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    15f1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    15f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15f7:	01 d0                	add    %edx,%eax
    15f9:	0f b6 00             	movzbl (%eax),%eax
    15fc:	3c 20                	cmp    $0x20,%al
    15fe:	74 ed                	je     15ed <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    1600:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1603:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1606:	0f 85 90 04 00 00    	jne    1a9c <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    160c:	8b 55 d0             	mov    -0x30(%ebp),%edx
    160f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1612:	01 d0                	add    %edx,%eax
    1614:	0f b6 00             	movzbl (%eax),%eax
    1617:	3c 2f                	cmp    $0x2f,%al
    1619:	7e 2c                	jle    1647 <runCalcmd+0x136>
    161b:	8b 55 d0             	mov    -0x30(%ebp),%edx
    161e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1621:	01 d0                	add    %edx,%eax
    1623:	0f b6 00             	movzbl (%eax),%eax
    1626:	3c 39                	cmp    $0x39,%al
    1628:	7f 1d                	jg     1647 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    162a:	83 ec 0c             	sub    $0xc,%esp
    162d:	68 28 37 00 00       	push   $0x3728
    1632:	6a 00                	push   $0x0
    1634:	6a 00                	push   $0x0
    1636:	6a 01                	push   $0x1
    1638:	6a 04                	push   $0x4
    163a:	e8 60 16 00 00       	call   2c9f <color_printf>
    163f:	83 c4 20             	add    $0x20,%esp
    1642:	e9 b7 04 00 00       	jmp    1afe <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1647:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    164e:	eb 20                	jmp    1670 <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    1650:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1653:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1656:	01 d0                	add    %edx,%eax
    1658:	89 c2                	mov    %eax,%edx
    165a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    165d:	01 d0                	add    %edx,%eax
    165f:	0f b6 00             	movzbl (%eax),%eax
    1662:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1665:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1668:	01 ca                	add    %ecx,%edx
    166a:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    166c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1670:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1673:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1676:	7c d8                	jl     1650 <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1678:	8d 55 94             	lea    -0x6c(%ebp),%edx
    167b:	8b 45 cc             	mov    -0x34(%ebp),%eax
    167e:	01 d0                	add    %edx,%eax
    1680:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    1683:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1686:	83 c0 01             	add    $0x1,%eax
    1689:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    168c:	eb 04                	jmp    1692 <runCalcmd+0x181>
        {
          i++;
    168e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    1692:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1695:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1698:	01 d0                	add    %edx,%eax
    169a:	0f b6 00             	movzbl (%eax),%eax
    169d:	3c 20                	cmp    $0x20,%al
    169f:	74 ed                	je     168e <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    16a1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16a4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16a7:	01 d0                	add    %edx,%eax
    16a9:	0f b6 00             	movzbl (%eax),%eax
    16ac:	3c 60                	cmp    $0x60,%al
    16ae:	0f 85 e6 01 00 00    	jne    189a <runCalcmd+0x389>
        {
          i++;
    16b4:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    16b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
    16bb:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    16be:	eb 04                	jmp    16c4 <runCalcmd+0x1b3>
          {
            i++;
    16c0:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    16c4:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16c7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16ca:	01 d0                	add    %edx,%eax
    16cc:	0f b6 00             	movzbl (%eax),%eax
    16cf:	3c 60                	cmp    $0x60,%al
    16d1:	74 0f                	je     16e2 <runCalcmd+0x1d1>
    16d3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16d6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16d9:	01 d0                	add    %edx,%eax
    16db:	0f b6 00             	movzbl (%eax),%eax
    16de:	84 c0                	test   %al,%al
    16e0:	75 de                	jne    16c0 <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    16e2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16e5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16e8:	01 d0                	add    %edx,%eax
    16ea:	0f b6 00             	movzbl (%eax),%eax
    16ed:	3c 60                	cmp    $0x60,%al
    16ef:	0f 85 5c 01 00 00    	jne    1851 <runCalcmd+0x340>
    16f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    16f8:	8d 50 01             	lea    0x1(%eax),%edx
    16fb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16fe:	01 d0                	add    %edx,%eax
    1700:	0f b6 00             	movzbl (%eax),%eax
    1703:	84 c0                	test   %al,%al
    1705:	0f 85 46 01 00 00    	jne    1851 <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    170b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    170e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1711:	01 d0                	add    %edx,%eax
    1713:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    1716:	8b 55 c8             	mov    -0x38(%ebp),%edx
    1719:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    171c:	01 d0                	add    %edx,%eax
    171e:	83 ec 0c             	sub    $0xc,%esp
    1721:	50                   	push   %eax
    1722:	e8 c5 04 00 00       	call   1bec <Compute>
    1727:	83 c4 10             	add    $0x10,%esp
    172a:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    172d:	dd 05 98 38 00 00    	fldl   0x3898
    1733:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1737:	dd 1c 24             	fstpl  (%esp)
    173a:	ff 75 c4             	pushl  -0x3c(%ebp)
    173d:	ff 75 c0             	pushl  -0x40(%ebp)
    1740:	e8 30 f8 ff ff       	call   f75 <isEqual>
    1745:	83 c4 10             	add    $0x10,%esp
    1748:	85 c0                	test   %eax,%eax
    174a:	0f 85 ad 03 00 00    	jne    1afd <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    1750:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1755:	85 c0                	test   %eax,%eax
    1757:	75 15                	jne    176e <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1759:	83 ec 08             	sub    $0x8,%esp
    175c:	68 ec 43 00 00       	push   $0x43ec
    1761:	68 20 44 00 00       	push   $0x4420
    1766:	e8 ba 19 00 00       	call   3125 <readVariables>
    176b:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    176e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1775:	eb 26                	jmp    179d <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1777:	8b 45 dc             	mov    -0x24(%ebp),%eax
    177a:	c1 e0 05             	shl    $0x5,%eax
    177d:	05 20 44 00 00       	add    $0x4420,%eax
    1782:	8d 50 04             	lea    0x4(%eax),%edx
    1785:	83 ec 08             	sub    $0x8,%esp
    1788:	8d 45 94             	lea    -0x6c(%ebp),%eax
    178b:	50                   	push   %eax
    178c:	52                   	push   %edx
    178d:	e8 38 e9 ff ff       	call   ca <strcmp>
    1792:	83 c4 10             	add    $0x10,%esp
    1795:	85 c0                	test   %eax,%eax
    1797:	74 10                	je     17a9 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1799:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    179d:	a1 ec 43 00 00       	mov    0x43ec,%eax
    17a2:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    17a5:	7c d0                	jl     1777 <runCalcmd+0x266>
    17a7:	eb 01                	jmp    17aa <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    17a9:	90                   	nop
              }
              if(index == v_num) //new variable
    17aa:	a1 ec 43 00 00       	mov    0x43ec,%eax
    17af:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    17b2:	75 3c                	jne    17f0 <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    17b4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17b7:	c1 e0 05             	shl    $0x5,%eax
    17ba:	05 20 44 00 00       	add    $0x4420,%eax
    17bf:	8d 50 04             	lea    0x4(%eax),%edx
    17c2:	83 ec 08             	sub    $0x8,%esp
    17c5:	8d 45 94             	lea    -0x6c(%ebp),%eax
    17c8:	50                   	push   %eax
    17c9:	52                   	push   %edx
    17ca:	e8 cb e8 ff ff       	call   9a <strcpy>
    17cf:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    17d2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17d5:	c1 e0 05             	shl    $0x5,%eax
    17d8:	05 20 44 00 00       	add    $0x4420,%eax
    17dd:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    17e3:	a1 ec 43 00 00       	mov    0x43ec,%eax
    17e8:	83 c0 01             	add    $0x1,%eax
    17eb:	a3 ec 43 00 00       	mov    %eax,0x43ec
              }
              variables[index].value.dvalue = result;
    17f0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17f3:	c1 e0 05             	shl    $0x5,%eax
    17f6:	05 30 44 00 00       	add    $0x4430,%eax
    17fb:	dd 45 c0             	fldl   -0x40(%ebp)
    17fe:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    1801:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1804:	c1 e0 05             	shl    $0x5,%eax
    1807:	05 30 44 00 00       	add    $0x4430,%eax
    180c:	dd 40 08             	fldl   0x8(%eax)
    180f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1812:	c1 e0 05             	shl    $0x5,%eax
    1815:	05 20 44 00 00       	add    $0x4420,%eax
    181a:	83 c0 04             	add    $0x4,%eax
    181d:	83 ec 0c             	sub    $0xc,%esp
    1820:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1824:	dd 1c 24             	fstpl  (%esp)
    1827:	50                   	push   %eax
    1828:	68 52 37 00 00       	push   $0x3752
    182d:	6a 01                	push   $0x1
    182f:	e8 43 ed ff ff       	call   577 <printf>
    1834:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1837:	83 ec 08             	sub    $0x8,%esp
    183a:	68 ec 43 00 00       	push   $0x43ec
    183f:	68 20 44 00 00       	push   $0x4420
    1844:	e8 90 1b 00 00       	call   33d9 <writeVariables>
    1849:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    184c:	e9 ac 02 00 00       	jmp    1afd <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    1851:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1854:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1857:	01 d0                	add    %edx,%eax
    1859:	0f b6 00             	movzbl (%eax),%eax
    185c:	84 c0                	test   %al,%al
    185e:	75 1d                	jne    187d <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    1860:	83 ec 0c             	sub    $0xc,%esp
    1863:	68 59 37 00 00       	push   $0x3759
    1868:	6a 00                	push   $0x0
    186a:	6a 00                	push   $0x0
    186c:	6a 01                	push   $0x1
    186e:	6a 04                	push   $0x4
    1870:	e8 2a 14 00 00       	call   2c9f <color_printf>
    1875:	83 c4 20             	add    $0x20,%esp
    1878:	e9 81 02 00 00       	jmp    1afe <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    187d:	83 ec 0c             	sub    $0xc,%esp
    1880:	68 70 37 00 00       	push   $0x3770
    1885:	6a 00                	push   $0x0
    1887:	6a 00                	push   $0x0
    1889:	6a 01                	push   $0x1
    188b:	6a 04                	push   $0x4
    188d:	e8 0d 14 00 00       	call   2c9f <color_printf>
    1892:	83 c4 20             	add    $0x20,%esp
    1895:	e9 64 02 00 00       	jmp    1afe <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    189a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    189d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18a0:	01 d0                	add    %edx,%eax
    18a2:	0f b6 00             	movzbl (%eax),%eax
    18a5:	3c 22                	cmp    $0x22,%al
    18a7:	0f 85 d5 01 00 00    	jne    1a82 <runCalcmd+0x571>
        {
          i++;
    18ad:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    18b1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18b4:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    18b7:	eb 04                	jmp    18bd <runCalcmd+0x3ac>
          {
            i++;
    18b9:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    18bd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18c3:	01 d0                	add    %edx,%eax
    18c5:	0f b6 00             	movzbl (%eax),%eax
    18c8:	3c 22                	cmp    $0x22,%al
    18ca:	74 0f                	je     18db <runCalcmd+0x3ca>
    18cc:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18d2:	01 d0                	add    %edx,%eax
    18d4:	0f b6 00             	movzbl (%eax),%eax
    18d7:	84 c0                	test   %al,%al
    18d9:	75 de                	jne    18b9 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    18db:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18e1:	01 d0                	add    %edx,%eax
    18e3:	0f b6 00             	movzbl (%eax),%eax
    18e6:	3c 22                	cmp    $0x22,%al
    18e8:	0f 85 4e 01 00 00    	jne    1a3c <runCalcmd+0x52b>
    18ee:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18f1:	8d 50 01             	lea    0x1(%eax),%edx
    18f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18f7:	01 d0                	add    %edx,%eax
    18f9:	0f b6 00             	movzbl (%eax),%eax
    18fc:	84 c0                	test   %al,%al
    18fe:	0f 85 38 01 00 00    	jne    1a3c <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1904:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1909:	85 c0                	test   %eax,%eax
    190b:	75 15                	jne    1922 <runCalcmd+0x411>
              readVariables(variables,&v_num);
    190d:	83 ec 08             	sub    $0x8,%esp
    1910:	68 ec 43 00 00       	push   $0x43ec
    1915:	68 20 44 00 00       	push   $0x4420
    191a:	e8 06 18 00 00       	call   3125 <readVariables>
    191f:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1922:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1929:	eb 26                	jmp    1951 <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    192b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    192e:	c1 e0 05             	shl    $0x5,%eax
    1931:	05 20 44 00 00       	add    $0x4420,%eax
    1936:	8d 50 04             	lea    0x4(%eax),%edx
    1939:	83 ec 08             	sub    $0x8,%esp
    193c:	8d 45 94             	lea    -0x6c(%ebp),%eax
    193f:	50                   	push   %eax
    1940:	52                   	push   %edx
    1941:	e8 84 e7 ff ff       	call   ca <strcmp>
    1946:	83 c4 10             	add    $0x10,%esp
    1949:	85 c0                	test   %eax,%eax
    194b:	74 10                	je     195d <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    194d:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1951:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1956:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1959:	7c d0                	jl     192b <runCalcmd+0x41a>
    195b:	eb 01                	jmp    195e <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    195d:	90                   	nop
            }
            if(index == v_num) //new variable
    195e:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1963:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1966:	75 2b                	jne    1993 <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1968:	8b 45 d8             	mov    -0x28(%ebp),%eax
    196b:	c1 e0 05             	shl    $0x5,%eax
    196e:	05 20 44 00 00       	add    $0x4420,%eax
    1973:	8d 50 04             	lea    0x4(%eax),%edx
    1976:	83 ec 08             	sub    $0x8,%esp
    1979:	8d 45 94             	lea    -0x6c(%ebp),%eax
    197c:	50                   	push   %eax
    197d:	52                   	push   %edx
    197e:	e8 17 e7 ff ff       	call   9a <strcpy>
    1983:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1986:	a1 ec 43 00 00       	mov    0x43ec,%eax
    198b:	83 c0 01             	add    $0x1,%eax
    198e:	a3 ec 43 00 00       	mov    %eax,0x43ec
            }
            variables[index].type = V_STRING;
    1993:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1996:	c1 e0 05             	shl    $0x5,%eax
    1999:	05 20 44 00 00       	add    $0x4420,%eax
    199e:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    19a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    19a7:	2b 45 bc             	sub    -0x44(%ebp),%eax
    19aa:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    19ad:	8b 45 b8             	mov    -0x48(%ebp),%eax
    19b0:	83 c0 01             	add    $0x1,%eax
    19b3:	83 ec 0c             	sub    $0xc,%esp
    19b6:	50                   	push   %eax
    19b7:	e8 bd ee ff ff       	call   879 <malloc>
    19bc:	83 c4 10             	add    $0x10,%esp
    19bf:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    19c2:	8b 55 bc             	mov    -0x44(%ebp),%edx
    19c5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19c8:	01 d0                	add    %edx,%eax
    19ca:	83 ec 08             	sub    $0x8,%esp
    19cd:	50                   	push   %eax
    19ce:	ff 75 b4             	pushl  -0x4c(%ebp)
    19d1:	e8 c4 e6 ff ff       	call   9a <strcpy>
    19d6:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    19d9:	8b 55 b8             	mov    -0x48(%ebp),%edx
    19dc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    19df:	01 d0                	add    %edx,%eax
    19e1:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    19e4:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19e7:	c1 e0 05             	shl    $0x5,%eax
    19ea:	8d 90 38 44 00 00    	lea    0x4438(%eax),%edx
    19f0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    19f3:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    19f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19f8:	c1 e0 05             	shl    $0x5,%eax
    19fb:	05 38 44 00 00       	add    $0x4438,%eax
    1a00:	8b 00                	mov    (%eax),%eax
    1a02:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1a05:	c1 e2 05             	shl    $0x5,%edx
    1a08:	81 c2 20 44 00 00    	add    $0x4420,%edx
    1a0e:	83 c2 04             	add    $0x4,%edx
    1a11:	50                   	push   %eax
    1a12:	52                   	push   %edx
    1a13:	68 91 37 00 00       	push   $0x3791
    1a18:	6a 01                	push   $0x1
    1a1a:	e8 58 eb ff ff       	call   577 <printf>
    1a1f:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1a22:	83 ec 08             	sub    $0x8,%esp
    1a25:	68 ec 43 00 00       	push   $0x43ec
    1a2a:	68 20 44 00 00       	push   $0x4420
    1a2f:	e8 a5 19 00 00       	call   33d9 <writeVariables>
    1a34:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1a37:	e9 c2 00 00 00       	jmp    1afe <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1a3c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a3f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a42:	01 d0                	add    %edx,%eax
    1a44:	0f b6 00             	movzbl (%eax),%eax
    1a47:	84 c0                	test   %al,%al
    1a49:	75 1d                	jne    1a68 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1a4b:	83 ec 0c             	sub    $0xc,%esp
    1a4e:	68 9a 37 00 00       	push   $0x379a
    1a53:	6a 00                	push   $0x0
    1a55:	6a 00                	push   $0x0
    1a57:	6a 01                	push   $0x1
    1a59:	6a 04                	push   $0x4
    1a5b:	e8 3f 12 00 00       	call   2c9f <color_printf>
    1a60:	83 c4 20             	add    $0x20,%esp
    1a63:	e9 96 00 00 00       	jmp    1afe <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1a68:	83 ec 0c             	sub    $0xc,%esp
    1a6b:	68 b0 37 00 00       	push   $0x37b0
    1a70:	6a 00                	push   $0x0
    1a72:	6a 00                	push   $0x0
    1a74:	6a 01                	push   $0x1
    1a76:	6a 04                	push   $0x4
    1a78:	e8 22 12 00 00       	call   2c9f <color_printf>
    1a7d:	83 c4 20             	add    $0x20,%esp
    1a80:	eb 7c                	jmp    1afe <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1a82:	83 ec 0c             	sub    $0xc,%esp
    1a85:	68 d1 37 00 00       	push   $0x37d1
    1a8a:	6a 00                	push   $0x0
    1a8c:	6a 00                	push   $0x0
    1a8e:	6a 01                	push   $0x1
    1a90:	6a 04                	push   $0x4
    1a92:	e8 08 12 00 00       	call   2c9f <color_printf>
    1a97:	83 c4 20             	add    $0x20,%esp
    1a9a:	eb 62                	jmp    1afe <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1a9c:	83 ec 0c             	sub    $0xc,%esp
    1a9f:	68 d1 37 00 00       	push   $0x37d1
    1aa4:	6a 00                	push   $0x0
    1aa6:	6a 00                	push   $0x0
    1aa8:	6a 01                	push   $0x1
    1aaa:	6a 04                	push   $0x4
    1aac:	e8 ee 11 00 00       	call   2c9f <color_printf>
    1ab1:	83 c4 20             	add    $0x20,%esp
    1ab4:	eb 48                	jmp    1afe <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1ab6:	83 ec 0c             	sub    $0xc,%esp
    1ab9:	ff 75 d4             	pushl  -0x2c(%ebp)
    1abc:	e8 2b 01 00 00       	call   1bec <Compute>
    1ac1:	83 c4 10             	add    $0x10,%esp
    1ac4:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1ac7:	dd 05 98 38 00 00    	fldl   0x3898
    1acd:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1ad1:	dd 1c 24             	fstpl  (%esp)
    1ad4:	ff 75 ac             	pushl  -0x54(%ebp)
    1ad7:	ff 75 a8             	pushl  -0x58(%ebp)
    1ada:	e8 96 f4 ff ff       	call   f75 <isEqual>
    1adf:	83 c4 10             	add    $0x10,%esp
    1ae2:	85 c0                	test   %eax,%eax
    1ae4:	75 18                	jne    1afe <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1ae6:	ff 75 ac             	pushl  -0x54(%ebp)
    1ae9:	ff 75 a8             	pushl  -0x58(%ebp)
    1aec:	68 e9 37 00 00       	push   $0x37e9
    1af1:	6a 01                	push   $0x1
    1af3:	e8 7f ea ff ff       	call   577 <printf>
    1af8:	83 c4 10             	add    $0x10,%esp
    1afb:	eb 01                	jmp    1afe <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1afd:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1afe:	e8 c8 e7 ff ff       	call   2cb <exit>

00001b03 <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1b03:	55                   	push   %ebp
    1b04:	89 e5                	mov    %esp,%ebp
    1b06:	83 ec 04             	sub    $0x4,%esp
    1b09:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0c:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1b0f:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1b13:	83 e8 23             	sub    $0x23,%eax
    1b16:	83 f8 0c             	cmp    $0xc,%eax
    1b19:	77 25                	ja     1b40 <GetLevel+0x3d>
    1b1b:	8b 04 85 f0 37 00 00 	mov    0x37f0(,%eax,4),%eax
    1b22:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1b24:	b8 01 00 00 00       	mov    $0x1,%eax
    1b29:	eb 1a                	jmp    1b45 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1b2b:	b8 02 00 00 00       	mov    $0x2,%eax
    1b30:	eb 13                	jmp    1b45 <GetLevel+0x42>
    case '(':
        return 0;
    1b32:	b8 00 00 00 00       	mov    $0x0,%eax
    1b37:	eb 0c                	jmp    1b45 <GetLevel+0x42>
    case '#':
        return -2;
    1b39:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1b3e:	eb 05                	jmp    1b45 <GetLevel+0x42>
    };
    return -1;
    1b40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1b45:	c9                   	leave  
    1b46:	c3                   	ret    

00001b47 <Operate>:

double Operate(double a1, char op, double a2)
{
    1b47:	55                   	push   %ebp
    1b48:	89 e5                	mov    %esp,%ebp
    1b4a:	83 ec 28             	sub    $0x28,%esp
    1b4d:	8b 45 10             	mov    0x10(%ebp),%eax
    1b50:	8b 55 08             	mov    0x8(%ebp),%edx
    1b53:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1b56:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b59:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1b5c:	88 45 ec             	mov    %al,-0x14(%ebp)
    1b5f:	8b 45 14             	mov    0x14(%ebp),%eax
    1b62:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1b65:	8b 45 18             	mov    0x18(%ebp),%eax
    1b68:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1b6b:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1b6f:	83 f8 2b             	cmp    $0x2b,%eax
    1b72:	74 18                	je     1b8c <Operate+0x45>
    1b74:	83 f8 2b             	cmp    $0x2b,%eax
    1b77:	7f 07                	jg     1b80 <Operate+0x39>
    1b79:	83 f8 2a             	cmp    $0x2a,%eax
    1b7c:	74 1e                	je     1b9c <Operate+0x55>
    1b7e:	eb 68                	jmp    1be8 <Operate+0xa1>
    1b80:	83 f8 2d             	cmp    $0x2d,%eax
    1b83:	74 0f                	je     1b94 <Operate+0x4d>
    1b85:	83 f8 2f             	cmp    $0x2f,%eax
    1b88:	74 1a                	je     1ba4 <Operate+0x5d>
    1b8a:	eb 5c                	jmp    1be8 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1b8c:	dd 45 f0             	fldl   -0x10(%ebp)
    1b8f:	dc 45 e0             	faddl  -0x20(%ebp)
    1b92:	eb 56                	jmp    1bea <Operate+0xa3>
    case '-':
        return a1 - a2;
    1b94:	dd 45 f0             	fldl   -0x10(%ebp)
    1b97:	dc 65 e0             	fsubl  -0x20(%ebp)
    1b9a:	eb 4e                	jmp    1bea <Operate+0xa3>
    case '*':
        return a1 * a2;
    1b9c:	dd 45 f0             	fldl   -0x10(%ebp)
    1b9f:	dc 4d e0             	fmull  -0x20(%ebp)
    1ba2:	eb 46                	jmp    1bea <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1ba4:	d9 ee                	fldz   
    1ba6:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1baa:	dd 1c 24             	fstpl  (%esp)
    1bad:	ff 75 e4             	pushl  -0x1c(%ebp)
    1bb0:	ff 75 e0             	pushl  -0x20(%ebp)
    1bb3:	e8 bd f3 ff ff       	call   f75 <isEqual>
    1bb8:	83 c4 10             	add    $0x10,%esp
    1bbb:	83 f8 01             	cmp    $0x1,%eax
    1bbe:	75 20                	jne    1be0 <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1bc0:	83 ec 0c             	sub    $0xc,%esp
    1bc3:	68 24 38 00 00       	push   $0x3824
    1bc8:	6a 00                	push   $0x0
    1bca:	6a 00                	push   $0x0
    1bcc:	6a 01                	push   $0x1
    1bce:	6a 04                	push   $0x4
    1bd0:	e8 ca 10 00 00       	call   2c9f <color_printf>
    1bd5:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1bd8:	dd 05 98 38 00 00    	fldl   0x3898
    1bde:	eb 0a                	jmp    1bea <Operate+0xa3>
        }
        else
          return a1 / a2;
    1be0:	dd 45 f0             	fldl   -0x10(%ebp)
    1be3:	dc 75 e0             	fdivl  -0x20(%ebp)
    1be6:	eb 02                	jmp    1bea <Operate+0xa3>
    };
    return 1;
    1be8:	d9 e8                	fld1   
}
    1bea:	c9                   	leave  
    1beb:	c3                   	ret    

00001bec <Compute>:

double Compute(char *s)
{
    1bec:	55                   	push   %ebp
    1bed:	89 e5                	mov    %esp,%ebp
    1bef:	53                   	push   %ebx
    1bf0:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1bf6:	e8 44 14 00 00       	call   303f <dstack>
    1bfb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1bfe:	e8 73 13 00 00       	call   2f76 <cstack>
    1c03:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1c06:	83 ec 08             	sub    $0x8,%esp
    1c09:	6a 23                	push   $0x23
    1c0b:	ff 75 e0             	pushl  -0x20(%ebp)
    1c0e:	e8 91 13 00 00       	call   2fa4 <pushc>
    1c13:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1c16:	83 ec 0c             	sub    $0xc,%esp
    1c19:	ff 75 08             	pushl  0x8(%ebp)
    1c1c:	e8 e8 e4 ff ff       	call   109 <strlen>
    1c21:	83 c4 10             	add    $0x10,%esp
    1c24:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1c27:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1c2e:	c7 05 00 44 00 00 00 	movl   $0x0,0x4400
    1c35:	00 00 00 
    1c38:	e9 58 05 00 00       	jmp    2195 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1c3d:	a1 00 44 00 00       	mov    0x4400,%eax
    1c42:	89 c2                	mov    %eax,%edx
    1c44:	8b 45 08             	mov    0x8(%ebp),%eax
    1c47:	01 d0                	add    %edx,%eax
    1c49:	0f b6 00             	movzbl (%eax),%eax
    1c4c:	3c 24                	cmp    $0x24,%al
    1c4e:	0f 85 f8 01 00 00    	jne    1e4c <Compute+0x260>
        {
          is_minus = 0;
    1c54:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1c5b:	a1 00 44 00 00       	mov    0x4400,%eax
    1c60:	83 c0 01             	add    $0x1,%eax
    1c63:	a3 00 44 00 00       	mov    %eax,0x4400
          if(s[g_pos] != '{')
    1c68:	a1 00 44 00 00       	mov    0x4400,%eax
    1c6d:	89 c2                	mov    %eax,%edx
    1c6f:	8b 45 08             	mov    0x8(%ebp),%eax
    1c72:	01 d0                	add    %edx,%eax
    1c74:	0f b6 00             	movzbl (%eax),%eax
    1c77:	3c 7b                	cmp    $0x7b,%al
    1c79:	74 23                	je     1c9e <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1c7b:	83 ec 0c             	sub    $0xc,%esp
    1c7e:	68 3c 38 00 00       	push   $0x383c
    1c83:	6a 00                	push   $0x0
    1c85:	6a 00                	push   $0x0
    1c87:	6a 01                	push   $0x1
    1c89:	6a 04                	push   $0x4
    1c8b:	e8 0f 10 00 00       	call   2c9f <color_printf>
    1c90:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1c93:	dd 05 98 38 00 00    	fldl   0x3898
    1c99:	e9 24 06 00 00       	jmp    22c2 <Compute+0x6d6>
          }
          int i=g_pos+1;
    1c9e:	a1 00 44 00 00       	mov    0x4400,%eax
    1ca3:	83 c0 01             	add    $0x1,%eax
    1ca6:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1ca9:	eb 13                	jmp    1cbe <Compute+0xd2>
          {
            if(s[i] == '}')
    1cab:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1cae:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb1:	01 d0                	add    %edx,%eax
    1cb3:	0f b6 00             	movzbl (%eax),%eax
    1cb6:	3c 7d                	cmp    $0x7d,%al
    1cb8:	74 0e                	je     1cc8 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1cba:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1cbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cc1:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1cc4:	7c e5                	jl     1cab <Compute+0xbf>
    1cc6:	eb 01                	jmp    1cc9 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1cc8:	90                   	nop
          }
          if(s[i] != '}')
    1cc9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1ccc:	8b 45 08             	mov    0x8(%ebp),%eax
    1ccf:	01 d0                	add    %edx,%eax
    1cd1:	0f b6 00             	movzbl (%eax),%eax
    1cd4:	3c 7d                	cmp    $0x7d,%al
    1cd6:	74 23                	je     1cfb <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1cd8:	83 ec 0c             	sub    $0xc,%esp
    1cdb:	68 4a 38 00 00       	push   $0x384a
    1ce0:	6a 00                	push   $0x0
    1ce2:	6a 00                	push   $0x0
    1ce4:	6a 01                	push   $0x1
    1ce6:	6a 04                	push   $0x4
    1ce8:	e8 b2 0f 00 00       	call   2c9f <color_printf>
    1ced:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1cf0:	dd 05 98 38 00 00    	fldl   0x3898
    1cf6:	e9 c7 05 00 00       	jmp    22c2 <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1cfb:	a1 00 44 00 00       	mov    0x4400,%eax
    1d00:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d03:	29 c2                	sub    %eax,%edx
    1d05:	89 d0                	mov    %edx,%eax
    1d07:	83 e8 01             	sub    $0x1,%eax
    1d0a:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1d0d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1d14:	eb 27                	jmp    1d3d <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1d16:	8b 15 00 44 00 00    	mov    0x4400,%edx
    1d1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1d1f:	01 d0                	add    %edx,%eax
    1d21:	8d 50 01             	lea    0x1(%eax),%edx
    1d24:	8b 45 08             	mov    0x8(%ebp),%eax
    1d27:	01 d0                	add    %edx,%eax
    1d29:	0f b6 00             	movzbl (%eax),%eax
    1d2c:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1d32:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1d35:	01 ca                	add    %ecx,%edx
    1d37:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1d39:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1d3d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1d40:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1d43:	7c d1                	jl     1d16 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1d45:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1d4b:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1d4e:	01 d0                	add    %edx,%eax
    1d50:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1d53:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1d5a:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1d5f:	85 c0                	test   %eax,%eax
    1d61:	75 40                	jne    1da3 <Compute+0x1b7>
            readVariables(variables,&v_num);
    1d63:	83 ec 08             	sub    $0x8,%esp
    1d66:	68 ec 43 00 00       	push   $0x43ec
    1d6b:	68 20 44 00 00       	push   $0x4420
    1d70:	e8 b0 13 00 00       	call   3125 <readVariables>
    1d75:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1d78:	eb 29                	jmp    1da3 <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1d7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1d7d:	c1 e0 05             	shl    $0x5,%eax
    1d80:	05 20 44 00 00       	add    $0x4420,%eax
    1d85:	8d 50 04             	lea    0x4(%eax),%edx
    1d88:	83 ec 08             	sub    $0x8,%esp
    1d8b:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1d91:	50                   	push   %eax
    1d92:	52                   	push   %edx
    1d93:	e8 32 e3 ff ff       	call   ca <strcmp>
    1d98:	83 c4 10             	add    $0x10,%esp
    1d9b:	85 c0                	test   %eax,%eax
    1d9d:	74 10                	je     1daf <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1d9f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1da3:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1da8:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1dab:	7c cd                	jl     1d7a <Compute+0x18e>
    1dad:	eb 01                	jmp    1db0 <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1daf:	90                   	nop
          }
          if(index == v_num) //no such variable
    1db0:	a1 ec 43 00 00       	mov    0x43ec,%eax
    1db5:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1db8:	75 2a                	jne    1de4 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1dba:	83 ec 08             	sub    $0x8,%esp
    1dbd:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1dc3:	50                   	push   %eax
    1dc4:	68 58 38 00 00       	push   $0x3858
    1dc9:	6a 00                	push   $0x0
    1dcb:	6a 00                	push   $0x0
    1dcd:	6a 01                	push   $0x1
    1dcf:	6a 04                	push   $0x4
    1dd1:	e8 c9 0e 00 00       	call   2c9f <color_printf>
    1dd6:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1dd9:	dd 05 98 38 00 00    	fldl   0x3898
    1ddf:	e9 de 04 00 00       	jmp    22c2 <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1de4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1de7:	c1 e0 05             	shl    $0x5,%eax
    1dea:	05 20 44 00 00       	add    $0x4420,%eax
    1def:	8b 00                	mov    (%eax),%eax
    1df1:	83 f8 02             	cmp    $0x2,%eax
    1df4:	75 23                	jne    1e19 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1df6:	83 ec 0c             	sub    $0xc,%esp
    1df9:	68 72 38 00 00       	push   $0x3872
    1dfe:	6a 00                	push   $0x0
    1e00:	6a 00                	push   $0x0
    1e02:	6a 01                	push   $0x1
    1e04:	6a 04                	push   $0x4
    1e06:	e8 94 0e 00 00       	call   2c9f <color_printf>
    1e0b:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1e0e:	dd 05 98 38 00 00    	fldl   0x3898
    1e14:	e9 a9 04 00 00       	jmp    22c2 <Compute+0x6d6>
          }
          g_pos = i+1;
    1e19:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e1c:	83 c0 01             	add    $0x1,%eax
    1e1f:	a3 00 44 00 00       	mov    %eax,0x4400
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    1e24:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e27:	c1 e0 05             	shl    $0x5,%eax
    1e2a:	05 30 44 00 00       	add    $0x4430,%eax
    1e2f:	dd 40 08             	fldl   0x8(%eax)
    1e32:	83 ec 04             	sub    $0x4,%esp
    1e35:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e39:	dd 1c 24             	fstpl  (%esp)
    1e3c:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e3f:	e8 2f 12 00 00       	call   3073 <pushd>
    1e44:	83 c4 10             	add    $0x10,%esp
    1e47:	e9 49 03 00 00       	jmp    2195 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    1e4c:	a1 00 44 00 00       	mov    0x4400,%eax
    1e51:	89 c2                	mov    %eax,%edx
    1e53:	8b 45 08             	mov    0x8(%ebp),%eax
    1e56:	01 d0                	add    %edx,%eax
    1e58:	0f b6 00             	movzbl (%eax),%eax
    1e5b:	3c 2d                	cmp    $0x2d,%al
    1e5d:	75 3f                	jne    1e9e <Compute+0x2b2>
    1e5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e63:	74 39                	je     1e9e <Compute+0x2b2>
        {
            pushd(opnd,0);
    1e65:	83 ec 04             	sub    $0x4,%esp
    1e68:	d9 ee                	fldz   
    1e6a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e6e:	dd 1c 24             	fstpl  (%esp)
    1e71:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e74:	e8 fa 11 00 00       	call   3073 <pushd>
    1e79:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    1e7c:	83 ec 08             	sub    $0x8,%esp
    1e7f:	6a 2d                	push   $0x2d
    1e81:	ff 75 e0             	pushl  -0x20(%ebp)
    1e84:	e8 1b 11 00 00       	call   2fa4 <pushc>
    1e89:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    1e8c:	a1 00 44 00 00       	mov    0x4400,%eax
    1e91:	83 c0 01             	add    $0x1,%eax
    1e94:	a3 00 44 00 00       	mov    %eax,0x4400
    1e99:	e9 f7 02 00 00       	jmp    2195 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    1e9e:	a1 00 44 00 00       	mov    0x4400,%eax
    1ea3:	89 c2                	mov    %eax,%edx
    1ea5:	8b 45 08             	mov    0x8(%ebp),%eax
    1ea8:	01 d0                	add    %edx,%eax
    1eaa:	0f b6 00             	movzbl (%eax),%eax
    1ead:	3c 29                	cmp    $0x29,%al
    1eaf:	0f 85 01 01 00 00    	jne    1fb6 <Compute+0x3ca>
        {
            is_minus = 0;
    1eb5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    1ebc:	a1 00 44 00 00       	mov    0x4400,%eax
    1ec1:	83 c0 01             	add    $0x1,%eax
    1ec4:	a3 00 44 00 00       	mov    %eax,0x4400
            while (topc(optr) != '(')
    1ec9:	e9 bf 00 00 00       	jmp    1f8d <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    1ece:	83 ec 0c             	sub    $0xc,%esp
    1ed1:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ed4:	e8 37 12 00 00       	call   3110 <topd>
    1ed9:	83 c4 10             	add    $0x10,%esp
    1edc:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    1edf:	83 ec 0c             	sub    $0xc,%esp
    1ee2:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ee5:	e8 dd 11 00 00       	call   30c7 <popd>
    1eea:	dd d8                	fstp   %st(0)
    1eec:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    1eef:	83 ec 0c             	sub    $0xc,%esp
    1ef2:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ef5:	e8 16 12 00 00       	call   3110 <topd>
    1efa:	83 c4 10             	add    $0x10,%esp
    1efd:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    1f00:	83 ec 0c             	sub    $0xc,%esp
    1f03:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f06:	e8 bc 11 00 00       	call   30c7 <popd>
    1f0b:	dd d8                	fstp   %st(0)
    1f0d:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    1f10:	83 ec 0c             	sub    $0xc,%esp
    1f13:	ff 75 e0             	pushl  -0x20(%ebp)
    1f16:	e8 11 11 00 00       	call   302c <topc>
    1f1b:	83 c4 10             	add    $0x10,%esp
    1f1e:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    1f21:	83 ec 0c             	sub    $0xc,%esp
    1f24:	ff 75 e0             	pushl  -0x20(%ebp)
    1f27:	e8 be 10 00 00       	call   2fea <popc>
    1f2c:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    1f2f:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    1f33:	83 ec 0c             	sub    $0xc,%esp
    1f36:	ff 75 d4             	pushl  -0x2c(%ebp)
    1f39:	ff 75 d0             	pushl  -0x30(%ebp)
    1f3c:	50                   	push   %eax
    1f3d:	ff 75 cc             	pushl  -0x34(%ebp)
    1f40:	ff 75 c8             	pushl  -0x38(%ebp)
    1f43:	e8 ff fb ff ff       	call   1b47 <Operate>
    1f48:	83 c4 20             	add    $0x20,%esp
    1f4b:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    1f4e:	dd 05 98 38 00 00    	fldl   0x3898
    1f54:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1f58:	dd 1c 24             	fstpl  (%esp)
    1f5b:	ff 75 bc             	pushl  -0x44(%ebp)
    1f5e:	ff 75 b8             	pushl  -0x48(%ebp)
    1f61:	e8 0f f0 ff ff       	call   f75 <isEqual>
    1f66:	83 c4 10             	add    $0x10,%esp
    1f69:	83 f8 01             	cmp    $0x1,%eax
    1f6c:	75 0b                	jne    1f79 <Compute+0x38d>
                  return WRONG_ANS;
    1f6e:	dd 05 98 38 00 00    	fldl   0x3898
    1f74:	e9 49 03 00 00       	jmp    22c2 <Compute+0x6d6>
                pushd(opnd,result);
    1f79:	83 ec 04             	sub    $0x4,%esp
    1f7c:	ff 75 bc             	pushl  -0x44(%ebp)
    1f7f:	ff 75 b8             	pushl  -0x48(%ebp)
    1f82:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f85:	e8 e9 10 00 00       	call   3073 <pushd>
    1f8a:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    1f8d:	83 ec 0c             	sub    $0xc,%esp
    1f90:	ff 75 e0             	pushl  -0x20(%ebp)
    1f93:	e8 94 10 00 00       	call   302c <topc>
    1f98:	83 c4 10             	add    $0x10,%esp
    1f9b:	3c 28                	cmp    $0x28,%al
    1f9d:	0f 85 2b ff ff ff    	jne    1ece <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    1fa3:	83 ec 0c             	sub    $0xc,%esp
    1fa6:	ff 75 e0             	pushl  -0x20(%ebp)
    1fa9:	e8 3c 10 00 00       	call   2fea <popc>
    1fae:	83 c4 10             	add    $0x10,%esp
    1fb1:	e9 df 01 00 00       	jmp    2195 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    1fb6:	a1 00 44 00 00       	mov    0x4400,%eax
    1fbb:	89 c2                	mov    %eax,%edx
    1fbd:	8b 45 08             	mov    0x8(%ebp),%eax
    1fc0:	01 d0                	add    %edx,%eax
    1fc2:	0f b6 00             	movzbl (%eax),%eax
    1fc5:	3c 2f                	cmp    $0x2f,%al
    1fc7:	7e 49                	jle    2012 <Compute+0x426>
    1fc9:	a1 00 44 00 00       	mov    0x4400,%eax
    1fce:	89 c2                	mov    %eax,%edx
    1fd0:	8b 45 08             	mov    0x8(%ebp),%eax
    1fd3:	01 d0                	add    %edx,%eax
    1fd5:	0f b6 00             	movzbl (%eax),%eax
    1fd8:	3c 39                	cmp    $0x39,%al
    1fda:	7f 36                	jg     2012 <Compute+0x426>
        {
            is_minus = 0;
    1fdc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    1fe3:	83 ec 08             	sub    $0x8,%esp
    1fe6:	68 00 44 00 00       	push   $0x4400
    1feb:	ff 75 08             	pushl  0x8(%ebp)
    1fee:	e8 c3 eb ff ff       	call   bb6 <Translation>
    1ff3:	83 c4 10             	add    $0x10,%esp
    1ff6:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    1ff9:	83 ec 04             	sub    $0x4,%esp
    1ffc:	ff 75 b4             	pushl  -0x4c(%ebp)
    1fff:	ff 75 b0             	pushl  -0x50(%ebp)
    2002:	ff 75 e4             	pushl  -0x1c(%ebp)
    2005:	e8 69 10 00 00       	call   3073 <pushd>
    200a:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    200d:	e9 83 01 00 00       	jmp    2195 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    2012:	a1 00 44 00 00       	mov    0x4400,%eax
    2017:	89 c2                	mov    %eax,%edx
    2019:	8b 45 08             	mov    0x8(%ebp),%eax
    201c:	01 d0                	add    %edx,%eax
    201e:	0f b6 00             	movzbl (%eax),%eax
    2021:	3c 28                	cmp    $0x28,%al
    2023:	0f 85 f9 00 00 00    	jne    2122 <Compute+0x536>
        {
            is_minus = 1;
    2029:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    2030:	a1 00 44 00 00       	mov    0x4400,%eax
    2035:	89 c2                	mov    %eax,%edx
    2037:	8b 45 08             	mov    0x8(%ebp),%eax
    203a:	01 d0                	add    %edx,%eax
    203c:	0f b6 00             	movzbl (%eax),%eax
    203f:	0f be c0             	movsbl %al,%eax
    2042:	83 ec 08             	sub    $0x8,%esp
    2045:	50                   	push   %eax
    2046:	ff 75 e0             	pushl  -0x20(%ebp)
    2049:	e8 56 0f 00 00       	call   2fa4 <pushc>
    204e:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2051:	a1 00 44 00 00       	mov    0x4400,%eax
    2056:	83 c0 01             	add    $0x1,%eax
    2059:	a3 00 44 00 00       	mov    %eax,0x4400
    205e:	e9 32 01 00 00       	jmp    2195 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    2063:	83 ec 0c             	sub    $0xc,%esp
    2066:	ff 75 e4             	pushl  -0x1c(%ebp)
    2069:	e8 a2 10 00 00       	call   3110 <topd>
    206e:	83 c4 10             	add    $0x10,%esp
    2071:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    2074:	83 ec 0c             	sub    $0xc,%esp
    2077:	ff 75 e4             	pushl  -0x1c(%ebp)
    207a:	e8 48 10 00 00       	call   30c7 <popd>
    207f:	dd d8                	fstp   %st(0)
    2081:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2084:	83 ec 0c             	sub    $0xc,%esp
    2087:	ff 75 e4             	pushl  -0x1c(%ebp)
    208a:	e8 81 10 00 00       	call   3110 <topd>
    208f:	83 c4 10             	add    $0x10,%esp
    2092:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    2095:	83 ec 0c             	sub    $0xc,%esp
    2098:	ff 75 e4             	pushl  -0x1c(%ebp)
    209b:	e8 27 10 00 00       	call   30c7 <popd>
    20a0:	dd d8                	fstp   %st(0)
    20a2:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    20a5:	83 ec 0c             	sub    $0xc,%esp
    20a8:	ff 75 e0             	pushl  -0x20(%ebp)
    20ab:	e8 7c 0f 00 00       	call   302c <topc>
    20b0:	83 c4 10             	add    $0x10,%esp
    20b3:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    20b6:	83 ec 0c             	sub    $0xc,%esp
    20b9:	ff 75 e0             	pushl  -0x20(%ebp)
    20bc:	e8 29 0f 00 00       	call   2fea <popc>
    20c1:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    20c4:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    20c8:	83 ec 0c             	sub    $0xc,%esp
    20cb:	ff 75 ac             	pushl  -0x54(%ebp)
    20ce:	ff 75 a8             	pushl  -0x58(%ebp)
    20d1:	50                   	push   %eax
    20d2:	ff 75 a4             	pushl  -0x5c(%ebp)
    20d5:	ff 75 a0             	pushl  -0x60(%ebp)
    20d8:	e8 6a fa ff ff       	call   1b47 <Operate>
    20dd:	83 c4 20             	add    $0x20,%esp
    20e0:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    20e3:	dd 05 98 38 00 00    	fldl   0x3898
    20e9:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    20ed:	dd 1c 24             	fstpl  (%esp)
    20f0:	ff 75 94             	pushl  -0x6c(%ebp)
    20f3:	ff 75 90             	pushl  -0x70(%ebp)
    20f6:	e8 7a ee ff ff       	call   f75 <isEqual>
    20fb:	83 c4 10             	add    $0x10,%esp
    20fe:	83 f8 01             	cmp    $0x1,%eax
    2101:	75 0b                	jne    210e <Compute+0x522>
                  return WRONG_ANS;
    2103:	dd 05 98 38 00 00    	fldl   0x3898
    2109:	e9 b4 01 00 00       	jmp    22c2 <Compute+0x6d6>
                pushd(opnd,result);
    210e:	83 ec 04             	sub    $0x4,%esp
    2111:	ff 75 94             	pushl  -0x6c(%ebp)
    2114:	ff 75 90             	pushl  -0x70(%ebp)
    2117:	ff 75 e4             	pushl  -0x1c(%ebp)
    211a:	e8 54 0f 00 00       	call   3073 <pushd>
    211f:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    2122:	a1 00 44 00 00       	mov    0x4400,%eax
    2127:	89 c2                	mov    %eax,%edx
    2129:	8b 45 08             	mov    0x8(%ebp),%eax
    212c:	01 d0                	add    %edx,%eax
    212e:	0f b6 00             	movzbl (%eax),%eax
    2131:	0f be c0             	movsbl %al,%eax
    2134:	83 ec 0c             	sub    $0xc,%esp
    2137:	50                   	push   %eax
    2138:	e8 c6 f9 ff ff       	call   1b03 <GetLevel>
    213d:	83 c4 10             	add    $0x10,%esp
    2140:	89 c3                	mov    %eax,%ebx
    2142:	83 ec 0c             	sub    $0xc,%esp
    2145:	ff 75 e0             	pushl  -0x20(%ebp)
    2148:	e8 df 0e 00 00       	call   302c <topc>
    214d:	83 c4 10             	add    $0x10,%esp
    2150:	0f be c0             	movsbl %al,%eax
    2153:	83 ec 0c             	sub    $0xc,%esp
    2156:	50                   	push   %eax
    2157:	e8 a7 f9 ff ff       	call   1b03 <GetLevel>
    215c:	83 c4 10             	add    $0x10,%esp
    215f:	39 c3                	cmp    %eax,%ebx
    2161:	0f 8e fc fe ff ff    	jle    2063 <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    2167:	a1 00 44 00 00       	mov    0x4400,%eax
    216c:	89 c2                	mov    %eax,%edx
    216e:	8b 45 08             	mov    0x8(%ebp),%eax
    2171:	01 d0                	add    %edx,%eax
    2173:	0f b6 00             	movzbl (%eax),%eax
    2176:	0f be c0             	movsbl %al,%eax
    2179:	83 ec 08             	sub    $0x8,%esp
    217c:	50                   	push   %eax
    217d:	ff 75 e0             	pushl  -0x20(%ebp)
    2180:	e8 1f 0e 00 00       	call   2fa4 <pushc>
    2185:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2188:	a1 00 44 00 00       	mov    0x4400,%eax
    218d:	83 c0 01             	add    $0x1,%eax
    2190:	a3 00 44 00 00       	mov    %eax,0x4400
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    2195:	a1 00 44 00 00       	mov    0x4400,%eax
    219a:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    219d:	0f 8c 9a fa ff ff    	jl     1c3d <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    21a3:	e9 da 00 00 00       	jmp    2282 <Compute+0x696>
    {
        double a2 = topd(opnd);
    21a8:	83 ec 0c             	sub    $0xc,%esp
    21ab:	ff 75 e4             	pushl  -0x1c(%ebp)
    21ae:	e8 5d 0f 00 00       	call   3110 <topd>
    21b3:	83 c4 10             	add    $0x10,%esp
    21b6:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    21b9:	83 ec 0c             	sub    $0xc,%esp
    21bc:	ff 75 e4             	pushl  -0x1c(%ebp)
    21bf:	e8 03 0f 00 00       	call   30c7 <popd>
    21c4:	dd d8                	fstp   %st(0)
    21c6:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    21c9:	83 ec 0c             	sub    $0xc,%esp
    21cc:	ff 75 e4             	pushl  -0x1c(%ebp)
    21cf:	e8 3c 0f 00 00       	call   3110 <topd>
    21d4:	83 c4 10             	add    $0x10,%esp
    21d7:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    21dd:	83 ec 0c             	sub    $0xc,%esp
    21e0:	ff 75 e4             	pushl  -0x1c(%ebp)
    21e3:	e8 df 0e 00 00       	call   30c7 <popd>
    21e8:	dd d8                	fstp   %st(0)
    21ea:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    21ed:	83 ec 0c             	sub    $0xc,%esp
    21f0:	ff 75 e0             	pushl  -0x20(%ebp)
    21f3:	e8 34 0e 00 00       	call   302c <topc>
    21f8:	83 c4 10             	add    $0x10,%esp
    21fb:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    2201:	83 ec 0c             	sub    $0xc,%esp
    2204:	ff 75 e0             	pushl  -0x20(%ebp)
    2207:	e8 de 0d 00 00       	call   2fea <popc>
    220c:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    220f:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    2216:	83 ec 0c             	sub    $0xc,%esp
    2219:	ff 75 84             	pushl  -0x7c(%ebp)
    221c:	ff 75 80             	pushl  -0x80(%ebp)
    221f:	50                   	push   %eax
    2220:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    2226:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    222c:	e8 16 f9 ff ff       	call   1b47 <Operate>
    2231:	83 c4 20             	add    $0x20,%esp
    2234:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    223a:	dd 05 98 38 00 00    	fldl   0x3898
    2240:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2244:	dd 1c 24             	fstpl  (%esp)
    2247:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    224d:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2253:	e8 1d ed ff ff       	call   f75 <isEqual>
    2258:	83 c4 10             	add    $0x10,%esp
    225b:	83 f8 01             	cmp    $0x1,%eax
    225e:	75 08                	jne    2268 <Compute+0x67c>
          return WRONG_ANS;
    2260:	dd 05 98 38 00 00    	fldl   0x3898
    2266:	eb 5a                	jmp    22c2 <Compute+0x6d6>
        pushd(opnd,result);
    2268:	83 ec 04             	sub    $0x4,%esp
    226b:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2271:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2277:	ff 75 e4             	pushl  -0x1c(%ebp)
    227a:	e8 f4 0d 00 00       	call   3073 <pushd>
    227f:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2282:	83 ec 0c             	sub    $0xc,%esp
    2285:	ff 75 e0             	pushl  -0x20(%ebp)
    2288:	e8 9f 0d 00 00       	call   302c <topc>
    228d:	83 c4 10             	add    $0x10,%esp
    2290:	3c 23                	cmp    $0x23,%al
    2292:	0f 85 10 ff ff ff    	jne    21a8 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    2298:	83 ec 0c             	sub    $0xc,%esp
    229b:	ff 75 e4             	pushl  -0x1c(%ebp)
    229e:	e8 94 e4 ff ff       	call   737 <free>
    22a3:	83 c4 10             	add    $0x10,%esp
    free(optr);
    22a6:	83 ec 0c             	sub    $0xc,%esp
    22a9:	ff 75 e0             	pushl  -0x20(%ebp)
    22ac:	e8 86 e4 ff ff       	call   737 <free>
    22b1:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    22b4:	83 ec 0c             	sub    $0xc,%esp
    22b7:	ff 75 e4             	pushl  -0x1c(%ebp)
    22ba:	e8 51 0e 00 00       	call   3110 <topd>
    22bf:	83 c4 10             	add    $0x10,%esp
}
    22c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    22c5:	c9                   	leave  
    22c6:	c3                   	ret    

000022c7 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    22c7:	55                   	push   %ebp
    22c8:	89 e5                	mov    %esp,%ebp
    22ca:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    22cd:	8b 45 08             	mov    0x8(%ebp),%eax
    22d0:	8b 00                	mov    (%eax),%eax
    22d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    22d5:	eb 04                	jmp    22db <gettoken+0x14>
    s++;
    22d7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    22db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22de:	3b 45 0c             	cmp    0xc(%ebp),%eax
    22e1:	73 1e                	jae    2301 <gettoken+0x3a>
    22e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22e6:	0f b6 00             	movzbl (%eax),%eax
    22e9:	0f be c0             	movsbl %al,%eax
    22ec:	83 ec 08             	sub    $0x8,%esp
    22ef:	50                   	push   %eax
    22f0:	68 b4 43 00 00       	push   $0x43b4
    22f5:	e8 50 de ff ff       	call   14a <strchr>
    22fa:	83 c4 10             	add    $0x10,%esp
    22fd:	85 c0                	test   %eax,%eax
    22ff:	75 d6                	jne    22d7 <gettoken+0x10>
    s++;
  if(q)
    2301:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2305:	74 08                	je     230f <gettoken+0x48>
    *q = s;
    2307:	8b 45 10             	mov    0x10(%ebp),%eax
    230a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    230d:	89 10                	mov    %edx,(%eax)
  ret = *s;
    230f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2312:	0f b6 00             	movzbl (%eax),%eax
    2315:	0f be c0             	movsbl %al,%eax
    2318:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    231b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    231e:	0f b6 00             	movzbl (%eax),%eax
    2321:	0f be c0             	movsbl %al,%eax
    2324:	83 f8 29             	cmp    $0x29,%eax
    2327:	7f 14                	jg     233d <gettoken+0x76>
    2329:	83 f8 28             	cmp    $0x28,%eax
    232c:	7d 28                	jge    2356 <gettoken+0x8f>
    232e:	85 c0                	test   %eax,%eax
    2330:	0f 84 94 00 00 00    	je     23ca <gettoken+0x103>
    2336:	83 f8 26             	cmp    $0x26,%eax
    2339:	74 1b                	je     2356 <gettoken+0x8f>
    233b:	eb 3a                	jmp    2377 <gettoken+0xb0>
    233d:	83 f8 3e             	cmp    $0x3e,%eax
    2340:	74 1a                	je     235c <gettoken+0x95>
    2342:	83 f8 3e             	cmp    $0x3e,%eax
    2345:	7f 0a                	jg     2351 <gettoken+0x8a>
    2347:	83 e8 3b             	sub    $0x3b,%eax
    234a:	83 f8 01             	cmp    $0x1,%eax
    234d:	77 28                	ja     2377 <gettoken+0xb0>
    234f:	eb 05                	jmp    2356 <gettoken+0x8f>
    2351:	83 f8 7c             	cmp    $0x7c,%eax
    2354:	75 21                	jne    2377 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    2356:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    235a:	eb 75                	jmp    23d1 <gettoken+0x10a>
  case '>':
    s++;
    235c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    2360:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2363:	0f b6 00             	movzbl (%eax),%eax
    2366:	3c 3e                	cmp    $0x3e,%al
    2368:	75 63                	jne    23cd <gettoken+0x106>
      ret = '+';
    236a:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    2371:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    2375:	eb 56                	jmp    23cd <gettoken+0x106>
  default:
    ret = 'a';
    2377:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    237e:	eb 04                	jmp    2384 <gettoken+0xbd>
      s++;
    2380:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2384:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2387:	3b 45 0c             	cmp    0xc(%ebp),%eax
    238a:	73 44                	jae    23d0 <gettoken+0x109>
    238c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    238f:	0f b6 00             	movzbl (%eax),%eax
    2392:	0f be c0             	movsbl %al,%eax
    2395:	83 ec 08             	sub    $0x8,%esp
    2398:	50                   	push   %eax
    2399:	68 b4 43 00 00       	push   $0x43b4
    239e:	e8 a7 dd ff ff       	call   14a <strchr>
    23a3:	83 c4 10             	add    $0x10,%esp
    23a6:	85 c0                	test   %eax,%eax
    23a8:	75 26                	jne    23d0 <gettoken+0x109>
    23aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23ad:	0f b6 00             	movzbl (%eax),%eax
    23b0:	0f be c0             	movsbl %al,%eax
    23b3:	83 ec 08             	sub    $0x8,%esp
    23b6:	50                   	push   %eax
    23b7:	68 bc 43 00 00       	push   $0x43bc
    23bc:	e8 89 dd ff ff       	call   14a <strchr>
    23c1:	83 c4 10             	add    $0x10,%esp
    23c4:	85 c0                	test   %eax,%eax
    23c6:	74 b8                	je     2380 <gettoken+0xb9>
      s++;
    break;
    23c8:	eb 06                	jmp    23d0 <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    23ca:	90                   	nop
    23cb:	eb 04                	jmp    23d1 <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    23cd:	90                   	nop
    23ce:	eb 01                	jmp    23d1 <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    23d0:	90                   	nop
  }
  if(eq)
    23d1:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    23d5:	74 0e                	je     23e5 <gettoken+0x11e>
    *eq = s;
    23d7:	8b 45 14             	mov    0x14(%ebp),%eax
    23da:	8b 55 f4             	mov    -0xc(%ebp),%edx
    23dd:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    23df:	eb 04                	jmp    23e5 <gettoken+0x11e>
    s++;
    23e1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    23e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23e8:	3b 45 0c             	cmp    0xc(%ebp),%eax
    23eb:	73 1e                	jae    240b <gettoken+0x144>
    23ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23f0:	0f b6 00             	movzbl (%eax),%eax
    23f3:	0f be c0             	movsbl %al,%eax
    23f6:	83 ec 08             	sub    $0x8,%esp
    23f9:	50                   	push   %eax
    23fa:	68 b4 43 00 00       	push   $0x43b4
    23ff:	e8 46 dd ff ff       	call   14a <strchr>
    2404:	83 c4 10             	add    $0x10,%esp
    2407:	85 c0                	test   %eax,%eax
    2409:	75 d6                	jne    23e1 <gettoken+0x11a>
    s++;
  *ps = s;
    240b:	8b 45 08             	mov    0x8(%ebp),%eax
    240e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2411:	89 10                	mov    %edx,(%eax)
  return ret;
    2413:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2416:	c9                   	leave  
    2417:	c3                   	ret    

00002418 <peek>:

int peek(char **ps, char *es, char *toks)
{
    2418:	55                   	push   %ebp
    2419:	89 e5                	mov    %esp,%ebp
    241b:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    241e:	8b 45 08             	mov    0x8(%ebp),%eax
    2421:	8b 00                	mov    (%eax),%eax
    2423:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2426:	eb 04                	jmp    242c <peek+0x14>
    s++;
    2428:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    242c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    242f:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2432:	73 1e                	jae    2452 <peek+0x3a>
    2434:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2437:	0f b6 00             	movzbl (%eax),%eax
    243a:	0f be c0             	movsbl %al,%eax
    243d:	83 ec 08             	sub    $0x8,%esp
    2440:	50                   	push   %eax
    2441:	68 b4 43 00 00       	push   $0x43b4
    2446:	e8 ff dc ff ff       	call   14a <strchr>
    244b:	83 c4 10             	add    $0x10,%esp
    244e:	85 c0                	test   %eax,%eax
    2450:	75 d6                	jne    2428 <peek+0x10>
    s++;
  *ps = s;
    2452:	8b 45 08             	mov    0x8(%ebp),%eax
    2455:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2458:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    245a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    245d:	0f b6 00             	movzbl (%eax),%eax
    2460:	84 c0                	test   %al,%al
    2462:	74 23                	je     2487 <peek+0x6f>
    2464:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2467:	0f b6 00             	movzbl (%eax),%eax
    246a:	0f be c0             	movsbl %al,%eax
    246d:	83 ec 08             	sub    $0x8,%esp
    2470:	50                   	push   %eax
    2471:	ff 75 10             	pushl  0x10(%ebp)
    2474:	e8 d1 dc ff ff       	call   14a <strchr>
    2479:	83 c4 10             	add    $0x10,%esp
    247c:	85 c0                	test   %eax,%eax
    247e:	74 07                	je     2487 <peek+0x6f>
    2480:	b8 01 00 00 00       	mov    $0x1,%eax
    2485:	eb 05                	jmp    248c <peek+0x74>
    2487:	b8 00 00 00 00       	mov    $0x0,%eax
}
    248c:	c9                   	leave  
    248d:	c3                   	ret    

0000248e <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    248e:	55                   	push   %ebp
    248f:	89 e5                	mov    %esp,%ebp
    2491:	53                   	push   %ebx
    2492:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    2495:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2498:	8b 45 08             	mov    0x8(%ebp),%eax
    249b:	83 ec 0c             	sub    $0xc,%esp
    249e:	50                   	push   %eax
    249f:	e8 65 dc ff ff       	call   109 <strlen>
    24a4:	83 c4 10             	add    $0x10,%esp
    24a7:	01 d8                	add    %ebx,%eax
    24a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    24ac:	8b 45 08             	mov    0x8(%ebp),%eax
    24af:	0f b6 00             	movzbl (%eax),%eax
    24b2:	3c 25                	cmp    $0x25,%al
    24b4:	75 5d                	jne    2513 <parsecmd+0x85>
  {
    int len = strlen(s);
    24b6:	8b 45 08             	mov    0x8(%ebp),%eax
    24b9:	83 ec 0c             	sub    $0xc,%esp
    24bc:	50                   	push   %eax
    24bd:	e8 47 dc ff ff       	call   109 <strlen>
    24c2:	83 c4 10             	add    $0x10,%esp
    24c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    24c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24cb:	83 ec 0c             	sub    $0xc,%esp
    24ce:	50                   	push   %eax
    24cf:	e8 a5 e3 ff ff       	call   879 <malloc>
    24d4:	83 c4 10             	add    $0x10,%esp
    24d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    24da:	8b 45 08             	mov    0x8(%ebp),%eax
    24dd:	83 c0 01             	add    $0x1,%eax
    24e0:	83 ec 08             	sub    $0x8,%esp
    24e3:	50                   	push   %eax
    24e4:	ff 75 ec             	pushl  -0x14(%ebp)
    24e7:	e8 ae db ff ff       	call   9a <strcpy>
    24ec:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    24ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24f2:	8d 50 fe             	lea    -0x2(%eax),%edx
    24f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24f8:	01 d0                	add    %edx,%eax
    24fa:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    24fd:	83 ec 0c             	sub    $0xc,%esp
    2500:	ff 75 ec             	pushl  -0x14(%ebp)
    2503:	e8 59 e9 ff ff       	call   e61 <calcmd>
    2508:	83 c4 10             	add    $0x10,%esp
    250b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    250e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2511:	eb 6b                	jmp    257e <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    2513:	83 ec 08             	sub    $0x8,%esp
    2516:	ff 75 f4             	pushl  -0xc(%ebp)
    2519:	8d 45 08             	lea    0x8(%ebp),%eax
    251c:	50                   	push   %eax
    251d:	e8 61 00 00 00       	call   2583 <parseline>
    2522:	83 c4 10             	add    $0x10,%esp
    2525:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    2528:	83 ec 04             	sub    $0x4,%esp
    252b:	68 a0 38 00 00       	push   $0x38a0
    2530:	ff 75 f4             	pushl  -0xc(%ebp)
    2533:	8d 45 08             	lea    0x8(%ebp),%eax
    2536:	50                   	push   %eax
    2537:	e8 dc fe ff ff       	call   2418 <peek>
    253c:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    253f:	8b 45 08             	mov    0x8(%ebp),%eax
    2542:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2545:	74 26                	je     256d <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    2547:	8b 45 08             	mov    0x8(%ebp),%eax
    254a:	83 ec 04             	sub    $0x4,%esp
    254d:	50                   	push   %eax
    254e:	68 a1 38 00 00       	push   $0x38a1
    2553:	6a 02                	push   $0x2
    2555:	e8 1d e0 ff ff       	call   577 <printf>
    255a:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    255d:	83 ec 0c             	sub    $0xc,%esp
    2560:	68 b0 38 00 00       	push   $0x38b0
    2565:	e8 f2 e3 ff ff       	call   95c <panic1>
    256a:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    256d:	83 ec 0c             	sub    $0xc,%esp
    2570:	ff 75 e4             	pushl  -0x1c(%ebp)
    2573:	e8 eb 03 00 00       	call   2963 <nulterminate>
    2578:	83 c4 10             	add    $0x10,%esp
  return cmd;
    257b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    257e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2581:	c9                   	leave  
    2582:	c3                   	ret    

00002583 <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    2583:	55                   	push   %ebp
    2584:	89 e5                	mov    %esp,%ebp
    2586:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    2589:	83 ec 08             	sub    $0x8,%esp
    258c:	ff 75 0c             	pushl  0xc(%ebp)
    258f:	ff 75 08             	pushl  0x8(%ebp)
    2592:	e8 99 00 00 00       	call   2630 <parsepipe>
    2597:	83 c4 10             	add    $0x10,%esp
    259a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    259d:	eb 23                	jmp    25c2 <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    259f:	6a 00                	push   $0x0
    25a1:	6a 00                	push   $0x0
    25a3:	ff 75 0c             	pushl  0xc(%ebp)
    25a6:	ff 75 08             	pushl  0x8(%ebp)
    25a9:	e8 19 fd ff ff       	call   22c7 <gettoken>
    25ae:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    25b1:	83 ec 0c             	sub    $0xc,%esp
    25b4:	ff 75 f4             	pushl  -0xc(%ebp)
    25b7:	e8 66 e8 ff ff       	call   e22 <backcmd>
    25bc:	83 c4 10             	add    $0x10,%esp
    25bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    25c2:	83 ec 04             	sub    $0x4,%esp
    25c5:	68 b7 38 00 00       	push   $0x38b7
    25ca:	ff 75 0c             	pushl  0xc(%ebp)
    25cd:	ff 75 08             	pushl  0x8(%ebp)
    25d0:	e8 43 fe ff ff       	call   2418 <peek>
    25d5:	83 c4 10             	add    $0x10,%esp
    25d8:	85 c0                	test   %eax,%eax
    25da:	75 c3                	jne    259f <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    25dc:	83 ec 04             	sub    $0x4,%esp
    25df:	68 b9 38 00 00       	push   $0x38b9
    25e4:	ff 75 0c             	pushl  0xc(%ebp)
    25e7:	ff 75 08             	pushl  0x8(%ebp)
    25ea:	e8 29 fe ff ff       	call   2418 <peek>
    25ef:	83 c4 10             	add    $0x10,%esp
    25f2:	85 c0                	test   %eax,%eax
    25f4:	74 35                	je     262b <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    25f6:	6a 00                	push   $0x0
    25f8:	6a 00                	push   $0x0
    25fa:	ff 75 0c             	pushl  0xc(%ebp)
    25fd:	ff 75 08             	pushl  0x8(%ebp)
    2600:	e8 c2 fc ff ff       	call   22c7 <gettoken>
    2605:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    2608:	83 ec 08             	sub    $0x8,%esp
    260b:	ff 75 0c             	pushl  0xc(%ebp)
    260e:	ff 75 08             	pushl  0x8(%ebp)
    2611:	e8 6d ff ff ff       	call   2583 <parseline>
    2616:	83 c4 10             	add    $0x10,%esp
    2619:	83 ec 08             	sub    $0x8,%esp
    261c:	50                   	push   %eax
    261d:	ff 75 f4             	pushl  -0xc(%ebp)
    2620:	e8 b5 e7 ff ff       	call   dda <listcmd>
    2625:	83 c4 10             	add    $0x10,%esp
    2628:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    262b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    262e:	c9                   	leave  
    262f:	c3                   	ret    

00002630 <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    2630:	55                   	push   %ebp
    2631:	89 e5                	mov    %esp,%ebp
    2633:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    2636:	83 ec 08             	sub    $0x8,%esp
    2639:	ff 75 0c             	pushl  0xc(%ebp)
    263c:	ff 75 08             	pushl  0x8(%ebp)
    263f:	e8 ec 01 00 00       	call   2830 <parseexec>
    2644:	83 c4 10             	add    $0x10,%esp
    2647:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    264a:	83 ec 04             	sub    $0x4,%esp
    264d:	68 bb 38 00 00       	push   $0x38bb
    2652:	ff 75 0c             	pushl  0xc(%ebp)
    2655:	ff 75 08             	pushl  0x8(%ebp)
    2658:	e8 bb fd ff ff       	call   2418 <peek>
    265d:	83 c4 10             	add    $0x10,%esp
    2660:	85 c0                	test   %eax,%eax
    2662:	74 35                	je     2699 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2664:	6a 00                	push   $0x0
    2666:	6a 00                	push   $0x0
    2668:	ff 75 0c             	pushl  0xc(%ebp)
    266b:	ff 75 08             	pushl  0x8(%ebp)
    266e:	e8 54 fc ff ff       	call   22c7 <gettoken>
    2673:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2676:	83 ec 08             	sub    $0x8,%esp
    2679:	ff 75 0c             	pushl  0xc(%ebp)
    267c:	ff 75 08             	pushl  0x8(%ebp)
    267f:	e8 ac ff ff ff       	call   2630 <parsepipe>
    2684:	83 c4 10             	add    $0x10,%esp
    2687:	83 ec 08             	sub    $0x8,%esp
    268a:	50                   	push   %eax
    268b:	ff 75 f4             	pushl  -0xc(%ebp)
    268e:	e8 ff e6 ff ff       	call   d92 <pipecmd>
    2693:	83 c4 10             	add    $0x10,%esp
    2696:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2699:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    269c:	c9                   	leave  
    269d:	c3                   	ret    

0000269e <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    269e:	55                   	push   %ebp
    269f:	89 e5                	mov    %esp,%ebp
    26a1:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    26a4:	e9 b6 00 00 00       	jmp    275f <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    26a9:	6a 00                	push   $0x0
    26ab:	6a 00                	push   $0x0
    26ad:	ff 75 10             	pushl  0x10(%ebp)
    26b0:	ff 75 0c             	pushl  0xc(%ebp)
    26b3:	e8 0f fc ff ff       	call   22c7 <gettoken>
    26b8:	83 c4 10             	add    $0x10,%esp
    26bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    26be:	8d 45 ec             	lea    -0x14(%ebp),%eax
    26c1:	50                   	push   %eax
    26c2:	8d 45 f0             	lea    -0x10(%ebp),%eax
    26c5:	50                   	push   %eax
    26c6:	ff 75 10             	pushl  0x10(%ebp)
    26c9:	ff 75 0c             	pushl  0xc(%ebp)
    26cc:	e8 f6 fb ff ff       	call   22c7 <gettoken>
    26d1:	83 c4 10             	add    $0x10,%esp
    26d4:	83 f8 61             	cmp    $0x61,%eax
    26d7:	74 10                	je     26e9 <parseredirs+0x4b>
      panic1("missing file for redirection");
    26d9:	83 ec 0c             	sub    $0xc,%esp
    26dc:	68 bd 38 00 00       	push   $0x38bd
    26e1:	e8 76 e2 ff ff       	call   95c <panic1>
    26e6:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    26e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26ec:	83 f8 3c             	cmp    $0x3c,%eax
    26ef:	74 0c                	je     26fd <parseredirs+0x5f>
    26f1:	83 f8 3e             	cmp    $0x3e,%eax
    26f4:	74 26                	je     271c <parseredirs+0x7e>
    26f6:	83 f8 2b             	cmp    $0x2b,%eax
    26f9:	74 43                	je     273e <parseredirs+0xa0>
    26fb:	eb 62                	jmp    275f <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    26fd:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2700:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2703:	83 ec 0c             	sub    $0xc,%esp
    2706:	6a 00                	push   $0x0
    2708:	6a 00                	push   $0x0
    270a:	52                   	push   %edx
    270b:	50                   	push   %eax
    270c:	ff 75 08             	pushl  0x8(%ebp)
    270f:	e8 1b e6 ff ff       	call   d2f <redircmd>
    2714:	83 c4 20             	add    $0x20,%esp
    2717:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    271a:	eb 43                	jmp    275f <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    271c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    271f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2722:	83 ec 0c             	sub    $0xc,%esp
    2725:	6a 01                	push   $0x1
    2727:	68 01 02 00 00       	push   $0x201
    272c:	52                   	push   %edx
    272d:	50                   	push   %eax
    272e:	ff 75 08             	pushl  0x8(%ebp)
    2731:	e8 f9 e5 ff ff       	call   d2f <redircmd>
    2736:	83 c4 20             	add    $0x20,%esp
    2739:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    273c:	eb 21                	jmp    275f <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    273e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2741:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2744:	83 ec 0c             	sub    $0xc,%esp
    2747:	6a 01                	push   $0x1
    2749:	68 01 02 00 00       	push   $0x201
    274e:	52                   	push   %edx
    274f:	50                   	push   %eax
    2750:	ff 75 08             	pushl  0x8(%ebp)
    2753:	e8 d7 e5 ff ff       	call   d2f <redircmd>
    2758:	83 c4 20             	add    $0x20,%esp
    275b:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    275e:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    275f:	83 ec 04             	sub    $0x4,%esp
    2762:	68 da 38 00 00       	push   $0x38da
    2767:	ff 75 10             	pushl  0x10(%ebp)
    276a:	ff 75 0c             	pushl  0xc(%ebp)
    276d:	e8 a6 fc ff ff       	call   2418 <peek>
    2772:	83 c4 10             	add    $0x10,%esp
    2775:	85 c0                	test   %eax,%eax
    2777:	0f 85 2c ff ff ff    	jne    26a9 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    277d:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2780:	c9                   	leave  
    2781:	c3                   	ret    

00002782 <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    2782:	55                   	push   %ebp
    2783:	89 e5                	mov    %esp,%ebp
    2785:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2788:	83 ec 04             	sub    $0x4,%esp
    278b:	68 dd 38 00 00       	push   $0x38dd
    2790:	ff 75 0c             	pushl  0xc(%ebp)
    2793:	ff 75 08             	pushl  0x8(%ebp)
    2796:	e8 7d fc ff ff       	call   2418 <peek>
    279b:	83 c4 10             	add    $0x10,%esp
    279e:	85 c0                	test   %eax,%eax
    27a0:	75 10                	jne    27b2 <parseblock+0x30>
    panic1("parseblock");
    27a2:	83 ec 0c             	sub    $0xc,%esp
    27a5:	68 df 38 00 00       	push   $0x38df
    27aa:	e8 ad e1 ff ff       	call   95c <panic1>
    27af:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    27b2:	6a 00                	push   $0x0
    27b4:	6a 00                	push   $0x0
    27b6:	ff 75 0c             	pushl  0xc(%ebp)
    27b9:	ff 75 08             	pushl  0x8(%ebp)
    27bc:	e8 06 fb ff ff       	call   22c7 <gettoken>
    27c1:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    27c4:	83 ec 08             	sub    $0x8,%esp
    27c7:	ff 75 0c             	pushl  0xc(%ebp)
    27ca:	ff 75 08             	pushl  0x8(%ebp)
    27cd:	e8 b1 fd ff ff       	call   2583 <parseline>
    27d2:	83 c4 10             	add    $0x10,%esp
    27d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    27d8:	83 ec 04             	sub    $0x4,%esp
    27db:	68 ea 38 00 00       	push   $0x38ea
    27e0:	ff 75 0c             	pushl  0xc(%ebp)
    27e3:	ff 75 08             	pushl  0x8(%ebp)
    27e6:	e8 2d fc ff ff       	call   2418 <peek>
    27eb:	83 c4 10             	add    $0x10,%esp
    27ee:	85 c0                	test   %eax,%eax
    27f0:	75 10                	jne    2802 <parseblock+0x80>
    panic1("syntax - missing )");
    27f2:	83 ec 0c             	sub    $0xc,%esp
    27f5:	68 ec 38 00 00       	push   $0x38ec
    27fa:	e8 5d e1 ff ff       	call   95c <panic1>
    27ff:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2802:	6a 00                	push   $0x0
    2804:	6a 00                	push   $0x0
    2806:	ff 75 0c             	pushl  0xc(%ebp)
    2809:	ff 75 08             	pushl  0x8(%ebp)
    280c:	e8 b6 fa ff ff       	call   22c7 <gettoken>
    2811:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    2814:	83 ec 04             	sub    $0x4,%esp
    2817:	ff 75 0c             	pushl  0xc(%ebp)
    281a:	ff 75 08             	pushl  0x8(%ebp)
    281d:	ff 75 f4             	pushl  -0xc(%ebp)
    2820:	e8 79 fe ff ff       	call   269e <parseredirs>
    2825:	83 c4 10             	add    $0x10,%esp
    2828:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    282b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    282e:	c9                   	leave  
    282f:	c3                   	ret    

00002830 <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    2830:	55                   	push   %ebp
    2831:	89 e5                	mov    %esp,%ebp
    2833:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    2836:	83 ec 04             	sub    $0x4,%esp
    2839:	68 dd 38 00 00       	push   $0x38dd
    283e:	ff 75 0c             	pushl  0xc(%ebp)
    2841:	ff 75 08             	pushl  0x8(%ebp)
    2844:	e8 cf fb ff ff       	call   2418 <peek>
    2849:	83 c4 10             	add    $0x10,%esp
    284c:	85 c0                	test   %eax,%eax
    284e:	74 16                	je     2866 <parseexec+0x36>
    return parseblock(ps, es);
    2850:	83 ec 08             	sub    $0x8,%esp
    2853:	ff 75 0c             	pushl  0xc(%ebp)
    2856:	ff 75 08             	pushl  0x8(%ebp)
    2859:	e8 24 ff ff ff       	call   2782 <parseblock>
    285e:	83 c4 10             	add    $0x10,%esp
    2861:	e9 fb 00 00 00       	jmp    2961 <parseexec+0x131>

  ret = execcmd();
    2866:	e8 8e e4 ff ff       	call   cf9 <execcmd>
    286b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    286e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2871:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2874:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    287b:	83 ec 04             	sub    $0x4,%esp
    287e:	ff 75 0c             	pushl  0xc(%ebp)
    2881:	ff 75 08             	pushl  0x8(%ebp)
    2884:	ff 75 f0             	pushl  -0x10(%ebp)
    2887:	e8 12 fe ff ff       	call   269e <parseredirs>
    288c:	83 c4 10             	add    $0x10,%esp
    288f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    2892:	e9 87 00 00 00       	jmp    291e <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2897:	8d 45 e0             	lea    -0x20(%ebp),%eax
    289a:	50                   	push   %eax
    289b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    289e:	50                   	push   %eax
    289f:	ff 75 0c             	pushl  0xc(%ebp)
    28a2:	ff 75 08             	pushl  0x8(%ebp)
    28a5:	e8 1d fa ff ff       	call   22c7 <gettoken>
    28aa:	83 c4 10             	add    $0x10,%esp
    28ad:	89 45 e8             	mov    %eax,-0x18(%ebp)
    28b0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    28b4:	0f 84 84 00 00 00    	je     293e <parseexec+0x10e>
      break;
    if(tok != 'a')
    28ba:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    28be:	74 10                	je     28d0 <parseexec+0xa0>
      panic1("syntax");
    28c0:	83 ec 0c             	sub    $0xc,%esp
    28c3:	68 b0 38 00 00       	push   $0x38b0
    28c8:	e8 8f e0 ff ff       	call   95c <panic1>
    28cd:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    28d0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    28d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    28d6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    28d9:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    28dd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    28e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    28e3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    28e6:	83 c1 08             	add    $0x8,%ecx
    28e9:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    28ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    28f1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    28f5:	7e 10                	jle    2907 <parseexec+0xd7>
      panic1("too many args");
    28f7:	83 ec 0c             	sub    $0xc,%esp
    28fa:	68 ff 38 00 00       	push   $0x38ff
    28ff:	e8 58 e0 ff ff       	call   95c <panic1>
    2904:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2907:	83 ec 04             	sub    $0x4,%esp
    290a:	ff 75 0c             	pushl  0xc(%ebp)
    290d:	ff 75 08             	pushl  0x8(%ebp)
    2910:	ff 75 f0             	pushl  -0x10(%ebp)
    2913:	e8 86 fd ff ff       	call   269e <parseredirs>
    2918:	83 c4 10             	add    $0x10,%esp
    291b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    291e:	83 ec 04             	sub    $0x4,%esp
    2921:	68 0d 39 00 00       	push   $0x390d
    2926:	ff 75 0c             	pushl  0xc(%ebp)
    2929:	ff 75 08             	pushl  0x8(%ebp)
    292c:	e8 e7 fa ff ff       	call   2418 <peek>
    2931:	83 c4 10             	add    $0x10,%esp
    2934:	85 c0                	test   %eax,%eax
    2936:	0f 84 5b ff ff ff    	je     2897 <parseexec+0x67>
    293c:	eb 01                	jmp    293f <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    293e:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    293f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2942:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2945:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    294c:	00 
  cmd->eargv[argc] = 0;
    294d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2950:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2953:	83 c2 08             	add    $0x8,%edx
    2956:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    295d:	00 
  return ret;
    295e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2961:	c9                   	leave  
    2962:	c3                   	ret    

00002963 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2963:	55                   	push   %ebp
    2964:	89 e5                	mov    %esp,%ebp
    2966:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2969:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    296d:	75 0a                	jne    2979 <nulterminate+0x16>
    return 0;
    296f:	b8 00 00 00 00       	mov    $0x0,%eax
    2974:	e9 e4 00 00 00       	jmp    2a5d <nulterminate+0xfa>
  
  switch(cmd->type){
    2979:	8b 45 08             	mov    0x8(%ebp),%eax
    297c:	8b 00                	mov    (%eax),%eax
    297e:	83 f8 05             	cmp    $0x5,%eax
    2981:	0f 87 d3 00 00 00    	ja     2a5a <nulterminate+0xf7>
    2987:	8b 04 85 14 39 00 00 	mov    0x3914(,%eax,4),%eax
    298e:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2990:	8b 45 08             	mov    0x8(%ebp),%eax
    2993:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2996:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    299d:	eb 14                	jmp    29b3 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    299f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29a2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29a5:	83 c2 08             	add    $0x8,%edx
    29a8:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    29ac:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    29af:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    29b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29b9:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    29bd:	85 c0                	test   %eax,%eax
    29bf:	75 de                	jne    299f <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    29c1:	e9 94 00 00 00       	jmp    2a5a <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    29c6:	8b 45 08             	mov    0x8(%ebp),%eax
    29c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    29cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29cf:	8b 40 04             	mov    0x4(%eax),%eax
    29d2:	83 ec 0c             	sub    $0xc,%esp
    29d5:	50                   	push   %eax
    29d6:	e8 88 ff ff ff       	call   2963 <nulterminate>
    29db:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    29de:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29e1:	8b 40 0c             	mov    0xc(%eax),%eax
    29e4:	c6 00 00             	movb   $0x0,(%eax)
    break;
    29e7:	eb 71                	jmp    2a5a <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    29e9:	8b 45 08             	mov    0x8(%ebp),%eax
    29ec:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    29ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
    29f2:	8b 40 04             	mov    0x4(%eax),%eax
    29f5:	83 ec 0c             	sub    $0xc,%esp
    29f8:	50                   	push   %eax
    29f9:	e8 65 ff ff ff       	call   2963 <nulterminate>
    29fe:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2a01:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a04:	8b 40 08             	mov    0x8(%eax),%eax
    2a07:	83 ec 0c             	sub    $0xc,%esp
    2a0a:	50                   	push   %eax
    2a0b:	e8 53 ff ff ff       	call   2963 <nulterminate>
    2a10:	83 c4 10             	add    $0x10,%esp
    break;
    2a13:	eb 45                	jmp    2a5a <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2a15:	8b 45 08             	mov    0x8(%ebp),%eax
    2a18:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2a1b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2a1e:	8b 40 04             	mov    0x4(%eax),%eax
    2a21:	83 ec 0c             	sub    $0xc,%esp
    2a24:	50                   	push   %eax
    2a25:	e8 39 ff ff ff       	call   2963 <nulterminate>
    2a2a:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2a2d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2a30:	8b 40 08             	mov    0x8(%eax),%eax
    2a33:	83 ec 0c             	sub    $0xc,%esp
    2a36:	50                   	push   %eax
    2a37:	e8 27 ff ff ff       	call   2963 <nulterminate>
    2a3c:	83 c4 10             	add    $0x10,%esp
    break;
    2a3f:	eb 19                	jmp    2a5a <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2a41:	8b 45 08             	mov    0x8(%ebp),%eax
    2a44:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2a47:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2a4a:	8b 40 04             	mov    0x4(%eax),%eax
    2a4d:	83 ec 0c             	sub    $0xc,%esp
    2a50:	50                   	push   %eax
    2a51:	e8 0d ff ff ff       	call   2963 <nulterminate>
    2a56:	83 c4 10             	add    $0x10,%esp
    break;
    2a59:	90                   	nop
  }
  return cmd;
    2a5a:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2a5d:	c9                   	leave  
    2a5e:	c3                   	ret    

00002a5f <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2a5f:	55                   	push   %ebp
    2a60:	89 e5                	mov    %esp,%ebp
    2a62:	83 ec 18             	sub    $0x18,%esp
    2a65:	8b 45 08             	mov    0x8(%ebp),%eax
    2a68:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2a6b:	83 ec 08             	sub    $0x8,%esp
    2a6e:	ff 75 18             	pushl  0x18(%ebp)
    2a71:	ff 75 14             	pushl  0x14(%ebp)
    2a74:	ff 75 10             	pushl  0x10(%ebp)
    2a77:	ff 75 0c             	pushl  0xc(%ebp)
    2a7a:	6a 01                	push   $0x1
    2a7c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2a7f:	50                   	push   %eax
    2a80:	e8 e6 d8 ff ff       	call   36b <colorwrite>
    2a85:	83 c4 20             	add    $0x20,%esp
}
    2a88:	90                   	nop
    2a89:	c9                   	leave  
    2a8a:	c3                   	ret    

00002a8b <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2a8b:	55                   	push   %ebp
    2a8c:	89 e5                	mov    %esp,%ebp
    2a8e:	53                   	push   %ebx
    2a8f:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2a92:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2a99:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2a9d:	74 17                	je     2ab6 <color_printint+0x2b>
    2a9f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2aa3:	79 11                	jns    2ab6 <color_printint+0x2b>
    neg = 1;
    2aa5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2aac:	8b 45 08             	mov    0x8(%ebp),%eax
    2aaf:	f7 d8                	neg    %eax
    2ab1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2ab4:	eb 06                	jmp    2abc <color_printint+0x31>
  } else {
    x = xx;
    2ab6:	8b 45 08             	mov    0x8(%ebp),%eax
    2ab9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2abc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2ac3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2ac6:	8d 41 01             	lea    0x1(%ecx),%eax
    2ac9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2acc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2acf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ad2:	ba 00 00 00 00       	mov    $0x0,%edx
    2ad7:	f7 f3                	div    %ebx
    2ad9:	89 d0                	mov    %edx,%eax
    2adb:	0f b6 80 c4 43 00 00 	movzbl 0x43c4(%eax),%eax
    2ae2:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2ae6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2ae9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2aec:	ba 00 00 00 00       	mov    $0x0,%edx
    2af1:	f7 f3                	div    %ebx
    2af3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2af6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2afa:	75 c7                	jne    2ac3 <color_printint+0x38>
  if(neg)
    2afc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2b00:	74 36                	je     2b38 <color_printint+0xad>
    buf[i++] = '-';
    2b02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b05:	8d 50 01             	lea    0x1(%eax),%edx
    2b08:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2b0b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2b10:	eb 26                	jmp    2b38 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2b12:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2b15:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b18:	01 d0                	add    %edx,%eax
    2b1a:	0f b6 00             	movzbl (%eax),%eax
    2b1d:	0f be c0             	movsbl %al,%eax
    2b20:	83 ec 0c             	sub    $0xc,%esp
    2b23:	ff 75 20             	pushl  0x20(%ebp)
    2b26:	ff 75 1c             	pushl  0x1c(%ebp)
    2b29:	ff 75 18             	pushl  0x18(%ebp)
    2b2c:	ff 75 14             	pushl  0x14(%ebp)
    2b2f:	50                   	push   %eax
    2b30:	e8 2a ff ff ff       	call   2a5f <color_putc>
    2b35:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2b38:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2b3c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b40:	79 d0                	jns    2b12 <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2b42:	90                   	nop
    2b43:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b46:	c9                   	leave  
    2b47:	c3                   	ret    

00002b48 <getInteger>:

static int getInteger(double num)
{
    2b48:	55                   	push   %ebp
    2b49:	89 e5                	mov    %esp,%ebp
    2b4b:	83 ec 18             	sub    $0x18,%esp
    2b4e:	8b 45 08             	mov    0x8(%ebp),%eax
    2b51:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2b54:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b57:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2b5a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2b61:	eb 0e                	jmp    2b71 <getInteger+0x29>
  {
    num -= 1;
    2b63:	dd 45 e8             	fldl   -0x18(%ebp)
    2b66:	d9 e8                	fld1   
    2b68:	de e9                	fsubrp %st,%st(1)
    2b6a:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2b6d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2b71:	dd 45 e8             	fldl   -0x18(%ebp)
    2b74:	d9 e8                	fld1   
    2b76:	d9 c9                	fxch   %st(1)
    2b78:	df e9                	fucomip %st(1),%st
    2b7a:	dd d8                	fstp   %st(0)
    2b7c:	77 e5                	ja     2b63 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2b7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2b81:	c9                   	leave  
    2b82:	c3                   	ret    

00002b83 <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2b83:	55                   	push   %ebp
    2b84:	89 e5                	mov    %esp,%ebp
    2b86:	83 ec 28             	sub    $0x28,%esp
    2b89:	8b 45 08             	mov    0x8(%ebp),%eax
    2b8c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2b8f:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b92:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2b95:	d9 ee                	fldz   
    2b97:	dd 45 e0             	fldl   -0x20(%ebp)
    2b9a:	d9 c9                	fxch   %st(1)
    2b9c:	df e9                	fucomip %st(1),%st
    2b9e:	dd d8                	fstp   %st(0)
    2ba0:	76 21                	jbe    2bc3 <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2ba2:	83 ec 0c             	sub    $0xc,%esp
    2ba5:	ff 75 1c             	pushl  0x1c(%ebp)
    2ba8:	ff 75 18             	pushl  0x18(%ebp)
    2bab:	ff 75 14             	pushl  0x14(%ebp)
    2bae:	ff 75 10             	pushl  0x10(%ebp)
    2bb1:	6a 2d                	push   $0x2d
    2bb3:	e8 a7 fe ff ff       	call   2a5f <color_putc>
    2bb8:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2bbb:	dd 45 e0             	fldl   -0x20(%ebp)
    2bbe:	d9 e0                	fchs   
    2bc0:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2bc3:	83 ec 08             	sub    $0x8,%esp
    2bc6:	ff 75 e4             	pushl  -0x1c(%ebp)
    2bc9:	ff 75 e0             	pushl  -0x20(%ebp)
    2bcc:	e8 77 ff ff ff       	call   2b48 <getInteger>
    2bd1:	83 c4 10             	add    $0x10,%esp
    2bd4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2bd7:	83 ec 04             	sub    $0x4,%esp
    2bda:	ff 75 1c             	pushl  0x1c(%ebp)
    2bdd:	ff 75 18             	pushl  0x18(%ebp)
    2be0:	ff 75 14             	pushl  0x14(%ebp)
    2be3:	ff 75 10             	pushl  0x10(%ebp)
    2be6:	6a 01                	push   $0x1
    2be8:	6a 0a                	push   $0xa
    2bea:	ff 75 f0             	pushl  -0x10(%ebp)
    2bed:	e8 99 fe ff ff       	call   2a8b <color_printint>
    2bf2:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2bf5:	db 45 f0             	fildl  -0x10(%ebp)
    2bf8:	dd 45 e0             	fldl   -0x20(%ebp)
    2bfb:	de e1                	fsubp  %st,%st(1)
    2bfd:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2c00:	dd 45 e0             	fldl   -0x20(%ebp)
    2c03:	dd 05 38 39 00 00    	fldl   0x3938
    2c09:	d9 c9                	fxch   %st(1)
    2c0b:	df e9                	fucomip %st(1),%st
    2c0d:	dd d8                	fstp   %st(0)
    2c0f:	76 19                	jbe    2c2a <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2c11:	83 ec 0c             	sub    $0xc,%esp
    2c14:	ff 75 1c             	pushl  0x1c(%ebp)
    2c17:	ff 75 18             	pushl  0x18(%ebp)
    2c1a:	ff 75 14             	pushl  0x14(%ebp)
    2c1d:	ff 75 10             	pushl  0x10(%ebp)
    2c20:	6a 2e                	push   $0x2e
    2c22:	e8 38 fe ff ff       	call   2a5f <color_putc>
    2c27:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2c2a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2c31:	eb 55                	jmp    2c88 <color_printdbl+0x105>
  {
    num = num*10;
    2c33:	dd 45 e0             	fldl   -0x20(%ebp)
    2c36:	dd 05 40 39 00 00    	fldl   0x3940
    2c3c:	de c9                	fmulp  %st,%st(1)
    2c3e:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2c41:	83 ec 08             	sub    $0x8,%esp
    2c44:	ff 75 e4             	pushl  -0x1c(%ebp)
    2c47:	ff 75 e0             	pushl  -0x20(%ebp)
    2c4a:	e8 f9 fe ff ff       	call   2b48 <getInteger>
    2c4f:	83 c4 10             	add    $0x10,%esp
    2c52:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2c55:	83 ec 04             	sub    $0x4,%esp
    2c58:	ff 75 1c             	pushl  0x1c(%ebp)
    2c5b:	ff 75 18             	pushl  0x18(%ebp)
    2c5e:	ff 75 14             	pushl  0x14(%ebp)
    2c61:	ff 75 10             	pushl  0x10(%ebp)
    2c64:	6a 01                	push   $0x1
    2c66:	6a 0a                	push   $0xa
    2c68:	ff 75 f0             	pushl  -0x10(%ebp)
    2c6b:	e8 1b fe ff ff       	call   2a8b <color_printint>
    2c70:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2c73:	db 45 f0             	fildl  -0x10(%ebp)
    2c76:	dd 45 e0             	fldl   -0x20(%ebp)
    2c79:	de e1                	fsubp  %st,%st(1)
    2c7b:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2c7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2c82:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2c86:	7f 13                	jg     2c9b <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2c88:	dd 45 e0             	fldl   -0x20(%ebp)
    2c8b:	dd 05 38 39 00 00    	fldl   0x3938
    2c91:	d9 c9                	fxch   %st(1)
    2c93:	df e9                	fucomip %st(1),%st
    2c95:	dd d8                	fstp   %st(0)
    2c97:	77 9a                	ja     2c33 <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2c99:	eb 01                	jmp    2c9c <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2c9b:	90                   	nop
    }
  }
}
    2c9c:	90                   	nop
    2c9d:	c9                   	leave  
    2c9e:	c3                   	ret    

00002c9f <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2c9f:	55                   	push   %ebp
    2ca0:	89 e5                	mov    %esp,%ebp
    2ca2:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2ca5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2cac:	8d 45 18             	lea    0x18(%ebp),%eax
    2caf:	83 c0 04             	add    $0x4,%eax
    2cb2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2cb5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2cbc:	e9 e2 01 00 00       	jmp    2ea3 <color_printf+0x204>
    c = fmt[i] & 0xff;
    2cc1:	8b 55 18             	mov    0x18(%ebp),%edx
    2cc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2cc7:	01 d0                	add    %edx,%eax
    2cc9:	0f b6 00             	movzbl (%eax),%eax
    2ccc:	0f be c0             	movsbl %al,%eax
    2ccf:	25 ff 00 00 00       	and    $0xff,%eax
    2cd4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2cd7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2cdb:	75 35                	jne    2d12 <color_printf+0x73>
      if(c == '%'){
    2cdd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2ce1:	75 0c                	jne    2cef <color_printf+0x50>
        state = '%';
    2ce3:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2cea:	e9 b0 01 00 00       	jmp    2e9f <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2cef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2cf2:	0f be c0             	movsbl %al,%eax
    2cf5:	83 ec 0c             	sub    $0xc,%esp
    2cf8:	ff 75 14             	pushl  0x14(%ebp)
    2cfb:	ff 75 10             	pushl  0x10(%ebp)
    2cfe:	ff 75 0c             	pushl  0xc(%ebp)
    2d01:	ff 75 08             	pushl  0x8(%ebp)
    2d04:	50                   	push   %eax
    2d05:	e8 55 fd ff ff       	call   2a5f <color_putc>
    2d0a:	83 c4 20             	add    $0x20,%esp
    2d0d:	e9 8d 01 00 00       	jmp    2e9f <color_printf+0x200>
      }
    } else if(state == '%'){
    2d12:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2d16:	0f 85 83 01 00 00    	jne    2e9f <color_printf+0x200>
      if(c == 'd'){
    2d1c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2d20:	75 2a                	jne    2d4c <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2d22:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d25:	8b 00                	mov    (%eax),%eax
    2d27:	83 ec 04             	sub    $0x4,%esp
    2d2a:	ff 75 14             	pushl  0x14(%ebp)
    2d2d:	ff 75 10             	pushl  0x10(%ebp)
    2d30:	ff 75 0c             	pushl  0xc(%ebp)
    2d33:	ff 75 08             	pushl  0x8(%ebp)
    2d36:	6a 01                	push   $0x1
    2d38:	6a 0a                	push   $0xa
    2d3a:	50                   	push   %eax
    2d3b:	e8 4b fd ff ff       	call   2a8b <color_printint>
    2d40:	83 c4 20             	add    $0x20,%esp
        ap++;
    2d43:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2d47:	e9 4c 01 00 00       	jmp    2e98 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2d4c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2d50:	74 06                	je     2d58 <color_printf+0xb9>
    2d52:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2d56:	75 2a                	jne    2d82 <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2d58:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d5b:	8b 00                	mov    (%eax),%eax
    2d5d:	83 ec 04             	sub    $0x4,%esp
    2d60:	ff 75 14             	pushl  0x14(%ebp)
    2d63:	ff 75 10             	pushl  0x10(%ebp)
    2d66:	ff 75 0c             	pushl  0xc(%ebp)
    2d69:	ff 75 08             	pushl  0x8(%ebp)
    2d6c:	6a 00                	push   $0x0
    2d6e:	6a 10                	push   $0x10
    2d70:	50                   	push   %eax
    2d71:	e8 15 fd ff ff       	call   2a8b <color_printint>
    2d76:	83 c4 20             	add    $0x20,%esp
        ap++;
    2d79:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2d7d:	e9 16 01 00 00       	jmp    2e98 <color_printf+0x1f9>
      } else if(c == 's'){
    2d82:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2d86:	75 4f                	jne    2dd7 <color_printf+0x138>
        s = (char*)*ap;
    2d88:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d8b:	8b 00                	mov    (%eax),%eax
    2d8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2d90:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2d94:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2d98:	75 2e                	jne    2dc8 <color_printf+0x129>
          s = "(null)";
    2d9a:	c7 45 f4 30 39 00 00 	movl   $0x3930,-0xc(%ebp)
        while(*s != 0){
    2da1:	eb 25                	jmp    2dc8 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2da3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2da6:	0f b6 00             	movzbl (%eax),%eax
    2da9:	0f be c0             	movsbl %al,%eax
    2dac:	83 ec 0c             	sub    $0xc,%esp
    2daf:	ff 75 14             	pushl  0x14(%ebp)
    2db2:	ff 75 10             	pushl  0x10(%ebp)
    2db5:	ff 75 0c             	pushl  0xc(%ebp)
    2db8:	ff 75 08             	pushl  0x8(%ebp)
    2dbb:	50                   	push   %eax
    2dbc:	e8 9e fc ff ff       	call   2a5f <color_putc>
    2dc1:	83 c4 20             	add    $0x20,%esp
          s++;
    2dc4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2dc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dcb:	0f b6 00             	movzbl (%eax),%eax
    2dce:	84 c0                	test   %al,%al
    2dd0:	75 d1                	jne    2da3 <color_printf+0x104>
    2dd2:	e9 c1 00 00 00       	jmp    2e98 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2dd7:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2ddb:	75 29                	jne    2e06 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2ddd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2de0:	8b 00                	mov    (%eax),%eax
    2de2:	0f be c0             	movsbl %al,%eax
    2de5:	83 ec 0c             	sub    $0xc,%esp
    2de8:	ff 75 14             	pushl  0x14(%ebp)
    2deb:	ff 75 10             	pushl  0x10(%ebp)
    2dee:	ff 75 0c             	pushl  0xc(%ebp)
    2df1:	ff 75 08             	pushl  0x8(%ebp)
    2df4:	50                   	push   %eax
    2df5:	e8 65 fc ff ff       	call   2a5f <color_putc>
    2dfa:	83 c4 20             	add    $0x20,%esp
        ap++;
    2dfd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2e01:	e9 92 00 00 00       	jmp    2e98 <color_printf+0x1f9>
      } else if(c == '%'){
    2e06:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2e0a:	75 20                	jne    2e2c <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2e0c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e0f:	0f be c0             	movsbl %al,%eax
    2e12:	83 ec 0c             	sub    $0xc,%esp
    2e15:	ff 75 14             	pushl  0x14(%ebp)
    2e18:	ff 75 10             	pushl  0x10(%ebp)
    2e1b:	ff 75 0c             	pushl  0xc(%ebp)
    2e1e:	ff 75 08             	pushl  0x8(%ebp)
    2e21:	50                   	push   %eax
    2e22:	e8 38 fc ff ff       	call   2a5f <color_putc>
    2e27:	83 c4 20             	add    $0x20,%esp
    2e2a:	eb 6c                	jmp    2e98 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    2e2c:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    2e30:	75 2f                	jne    2e61 <color_printf+0x1c2>
        double *dap = (double*)ap;
    2e32:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e35:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    2e38:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2e3b:	dd 00                	fldl   (%eax)
    2e3d:	83 ec 08             	sub    $0x8,%esp
    2e40:	ff 75 14             	pushl  0x14(%ebp)
    2e43:	ff 75 10             	pushl  0x10(%ebp)
    2e46:	ff 75 0c             	pushl  0xc(%ebp)
    2e49:	ff 75 08             	pushl  0x8(%ebp)
    2e4c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2e50:	dd 1c 24             	fstpl  (%esp)
    2e53:	e8 2b fd ff ff       	call   2b83 <color_printdbl>
    2e58:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    2e5b:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    2e5f:	eb 37                	jmp    2e98 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    2e61:	83 ec 0c             	sub    $0xc,%esp
    2e64:	ff 75 14             	pushl  0x14(%ebp)
    2e67:	ff 75 10             	pushl  0x10(%ebp)
    2e6a:	ff 75 0c             	pushl  0xc(%ebp)
    2e6d:	ff 75 08             	pushl  0x8(%ebp)
    2e70:	6a 25                	push   $0x25
    2e72:	e8 e8 fb ff ff       	call   2a5f <color_putc>
    2e77:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    2e7a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e7d:	0f be c0             	movsbl %al,%eax
    2e80:	83 ec 0c             	sub    $0xc,%esp
    2e83:	ff 75 14             	pushl  0x14(%ebp)
    2e86:	ff 75 10             	pushl  0x10(%ebp)
    2e89:	ff 75 0c             	pushl  0xc(%ebp)
    2e8c:	ff 75 08             	pushl  0x8(%ebp)
    2e8f:	50                   	push   %eax
    2e90:	e8 ca fb ff ff       	call   2a5f <color_putc>
    2e95:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    2e98:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2e9f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2ea3:	8b 55 18             	mov    0x18(%ebp),%edx
    2ea6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ea9:	01 d0                	add    %edx,%eax
    2eab:	0f b6 00             	movzbl (%eax),%eax
    2eae:	84 c0                	test   %al,%al
    2eb0:	0f 85 0b fe ff ff    	jne    2cc1 <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    2eb6:	90                   	nop
    2eb7:	c9                   	leave  
    2eb8:	c3                   	ret    

00002eb9 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    2eb9:	55                   	push   %ebp
    2eba:	89 e5                	mov    %esp,%ebp
    2ebc:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    2ebf:	83 ec 0c             	sub    $0xc,%esp
    2ec2:	6a 58                	push   $0x58
    2ec4:	e8 b0 d9 ff ff       	call   879 <malloc>
    2ec9:	83 c4 10             	add    $0x10,%esp
    2ecc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2ecf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ed2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2ed8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2edb:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    2ee2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2ee5:	c9                   	leave  
    2ee6:	c3                   	ret    

00002ee7 <pushi>:

void pushi(struct istack *s, int val)
{
    2ee7:	55                   	push   %ebp
    2ee8:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    2eea:	8b 45 08             	mov    0x8(%ebp),%eax
    2eed:	8b 00                	mov    (%eax),%eax
    2eef:	83 f8 13             	cmp    $0x13,%eax
    2ef2:	7f 2c                	jg     2f20 <pushi+0x39>
    {
        s->size++;
    2ef4:	8b 45 08             	mov    0x8(%ebp),%eax
    2ef7:	8b 00                	mov    (%eax),%eax
    2ef9:	8d 50 01             	lea    0x1(%eax),%edx
    2efc:	8b 45 08             	mov    0x8(%ebp),%eax
    2eff:	89 10                	mov    %edx,(%eax)
        s->top++;
    2f01:	8b 45 08             	mov    0x8(%ebp),%eax
    2f04:	8b 40 54             	mov    0x54(%eax),%eax
    2f07:	8d 50 01             	lea    0x1(%eax),%edx
    2f0a:	8b 45 08             	mov    0x8(%ebp),%eax
    2f0d:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    2f10:	8b 45 08             	mov    0x8(%ebp),%eax
    2f13:	8b 50 54             	mov    0x54(%eax),%edx
    2f16:	8b 45 08             	mov    0x8(%ebp),%eax
    2f19:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2f1c:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    2f20:	90                   	nop
    2f21:	5d                   	pop    %ebp
    2f22:	c3                   	ret    

00002f23 <popi>:

int popi(struct istack *s)
{
    2f23:	55                   	push   %ebp
    2f24:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2f26:	8b 45 08             	mov    0x8(%ebp),%eax
    2f29:	8b 00                	mov    (%eax),%eax
    2f2b:	85 c0                	test   %eax,%eax
    2f2d:	75 07                	jne    2f36 <popi+0x13>
    {
        return -1;
    2f2f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2f34:	eb 2c                	jmp    2f62 <popi+0x3f>
    }
    s->size--;
    2f36:	8b 45 08             	mov    0x8(%ebp),%eax
    2f39:	8b 00                	mov    (%eax),%eax
    2f3b:	8d 50 ff             	lea    -0x1(%eax),%edx
    2f3e:	8b 45 08             	mov    0x8(%ebp),%eax
    2f41:	89 10                	mov    %edx,(%eax)
    s->top--;
    2f43:	8b 45 08             	mov    0x8(%ebp),%eax
    2f46:	8b 40 54             	mov    0x54(%eax),%eax
    2f49:	8d 50 ff             	lea    -0x1(%eax),%edx
    2f4c:	8b 45 08             	mov    0x8(%ebp),%eax
    2f4f:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    2f52:	8b 45 08             	mov    0x8(%ebp),%eax
    2f55:	8b 40 54             	mov    0x54(%eax),%eax
    2f58:	8d 50 01             	lea    0x1(%eax),%edx
    2f5b:	8b 45 08             	mov    0x8(%ebp),%eax
    2f5e:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2f62:	5d                   	pop    %ebp
    2f63:	c3                   	ret    

00002f64 <topi>:

int topi(struct istack* s)
{
    2f64:	55                   	push   %ebp
    2f65:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    2f67:	8b 45 08             	mov    0x8(%ebp),%eax
    2f6a:	8b 50 54             	mov    0x54(%eax),%edx
    2f6d:	8b 45 08             	mov    0x8(%ebp),%eax
    2f70:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2f74:	5d                   	pop    %ebp
    2f75:	c3                   	ret    

00002f76 <cstack>:

//constructor
struct cstack* cstack()
{
    2f76:	55                   	push   %ebp
    2f77:	89 e5                	mov    %esp,%ebp
    2f79:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    2f7c:	83 ec 0c             	sub    $0xc,%esp
    2f7f:	6a 1c                	push   $0x1c
    2f81:	e8 f3 d8 ff ff       	call   879 <malloc>
    2f86:	83 c4 10             	add    $0x10,%esp
    2f89:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2f8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f8f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2f95:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f98:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    2f9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2fa2:	c9                   	leave  
    2fa3:	c3                   	ret    

00002fa4 <pushc>:

void pushc(struct cstack *s, char val)
{
    2fa4:	55                   	push   %ebp
    2fa5:	89 e5                	mov    %esp,%ebp
    2fa7:	83 ec 04             	sub    $0x4,%esp
    2faa:	8b 45 0c             	mov    0xc(%ebp),%eax
    2fad:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    2fb0:	8b 45 08             	mov    0x8(%ebp),%eax
    2fb3:	8b 00                	mov    (%eax),%eax
    2fb5:	83 f8 13             	cmp    $0x13,%eax
    2fb8:	7f 2d                	jg     2fe7 <pushc+0x43>
    {
        s->size++;
    2fba:	8b 45 08             	mov    0x8(%ebp),%eax
    2fbd:	8b 00                	mov    (%eax),%eax
    2fbf:	8d 50 01             	lea    0x1(%eax),%edx
    2fc2:	8b 45 08             	mov    0x8(%ebp),%eax
    2fc5:	89 10                	mov    %edx,(%eax)
        s->top++;
    2fc7:	8b 45 08             	mov    0x8(%ebp),%eax
    2fca:	8b 40 18             	mov    0x18(%eax),%eax
    2fcd:	8d 50 01             	lea    0x1(%eax),%edx
    2fd0:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd3:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    2fd6:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd9:	8b 40 18             	mov    0x18(%eax),%eax
    2fdc:	8b 55 08             	mov    0x8(%ebp),%edx
    2fdf:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    2fe3:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    2fe7:	90                   	nop
    2fe8:	c9                   	leave  
    2fe9:	c3                   	ret    

00002fea <popc>:

char popc(struct cstack *s)
{
    2fea:	55                   	push   %ebp
    2feb:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2fed:	8b 45 08             	mov    0x8(%ebp),%eax
    2ff0:	8b 00                	mov    (%eax),%eax
    2ff2:	85 c0                	test   %eax,%eax
    2ff4:	75 07                	jne    2ffd <popc+0x13>
    {
        return -1;
    2ff6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2ffb:	eb 2d                	jmp    302a <popc+0x40>
    }
    s->size--;
    2ffd:	8b 45 08             	mov    0x8(%ebp),%eax
    3000:	8b 00                	mov    (%eax),%eax
    3002:	8d 50 ff             	lea    -0x1(%eax),%edx
    3005:	8b 45 08             	mov    0x8(%ebp),%eax
    3008:	89 10                	mov    %edx,(%eax)
    s->top--;
    300a:	8b 45 08             	mov    0x8(%ebp),%eax
    300d:	8b 40 18             	mov    0x18(%eax),%eax
    3010:	8d 50 ff             	lea    -0x1(%eax),%edx
    3013:	8b 45 08             	mov    0x8(%ebp),%eax
    3016:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    3019:	8b 45 08             	mov    0x8(%ebp),%eax
    301c:	8b 40 18             	mov    0x18(%eax),%eax
    301f:	8d 50 01             	lea    0x1(%eax),%edx
    3022:	8b 45 08             	mov    0x8(%ebp),%eax
    3025:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    302a:	5d                   	pop    %ebp
    302b:	c3                   	ret    

0000302c <topc>:

char topc(struct cstack* s)
{
    302c:	55                   	push   %ebp
    302d:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    302f:	8b 45 08             	mov    0x8(%ebp),%eax
    3032:	8b 40 18             	mov    0x18(%eax),%eax
    3035:	8b 55 08             	mov    0x8(%ebp),%edx
    3038:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    303d:	5d                   	pop    %ebp
    303e:	c3                   	ret    

0000303f <dstack>:

//constructor
struct dstack* dstack()
{
    303f:	55                   	push   %ebp
    3040:	89 e5                	mov    %esp,%ebp
    3042:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    3045:	83 ec 0c             	sub    $0xc,%esp
    3048:	68 a8 00 00 00       	push   $0xa8
    304d:	e8 27 d8 ff ff       	call   879 <malloc>
    3052:	83 c4 10             	add    $0x10,%esp
    3055:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3058:	8b 45 f4             	mov    -0xc(%ebp),%eax
    305b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3061:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3064:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    306b:	ff ff ff 
    return stack;
    306e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3071:	c9                   	leave  
    3072:	c3                   	ret    

00003073 <pushd>:

void pushd(struct dstack *s, double val)
{
    3073:	55                   	push   %ebp
    3074:	89 e5                	mov    %esp,%ebp
    3076:	83 ec 08             	sub    $0x8,%esp
    3079:	8b 45 0c             	mov    0xc(%ebp),%eax
    307c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    307f:	8b 45 10             	mov    0x10(%ebp),%eax
    3082:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3085:	8b 45 08             	mov    0x8(%ebp),%eax
    3088:	8b 00                	mov    (%eax),%eax
    308a:	83 f8 13             	cmp    $0x13,%eax
    308d:	7f 35                	jg     30c4 <pushd+0x51>
    {
        s->size++;
    308f:	8b 45 08             	mov    0x8(%ebp),%eax
    3092:	8b 00                	mov    (%eax),%eax
    3094:	8d 50 01             	lea    0x1(%eax),%edx
    3097:	8b 45 08             	mov    0x8(%ebp),%eax
    309a:	89 10                	mov    %edx,(%eax)
        s->top++;
    309c:	8b 45 08             	mov    0x8(%ebp),%eax
    309f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    30a5:	8d 50 01             	lea    0x1(%eax),%edx
    30a8:	8b 45 08             	mov    0x8(%ebp),%eax
    30ab:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    30b1:	8b 45 08             	mov    0x8(%ebp),%eax
    30b4:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    30ba:	8b 45 08             	mov    0x8(%ebp),%eax
    30bd:	dd 45 f8             	fldl   -0x8(%ebp)
    30c0:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    30c4:	90                   	nop
    30c5:	c9                   	leave  
    30c6:	c3                   	ret    

000030c7 <popd>:

double popd(struct dstack *s)
{
    30c7:	55                   	push   %ebp
    30c8:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    30ca:	8b 45 08             	mov    0x8(%ebp),%eax
    30cd:	8b 00                	mov    (%eax),%eax
    30cf:	85 c0                	test   %eax,%eax
    30d1:	75 06                	jne    30d9 <popd+0x12>
    {
        return -1;
    30d3:	d9 e8                	fld1   
    30d5:	d9 e0                	fchs   
    30d7:	eb 35                	jmp    310e <popd+0x47>
    }
    s->size--;
    30d9:	8b 45 08             	mov    0x8(%ebp),%eax
    30dc:	8b 00                	mov    (%eax),%eax
    30de:	8d 50 ff             	lea    -0x1(%eax),%edx
    30e1:	8b 45 08             	mov    0x8(%ebp),%eax
    30e4:	89 10                	mov    %edx,(%eax)
    s->top--;
    30e6:	8b 45 08             	mov    0x8(%ebp),%eax
    30e9:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    30ef:	8d 50 ff             	lea    -0x1(%eax),%edx
    30f2:	8b 45 08             	mov    0x8(%ebp),%eax
    30f5:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    30fb:	8b 45 08             	mov    0x8(%ebp),%eax
    30fe:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3104:	8d 50 01             	lea    0x1(%eax),%edx
    3107:	8b 45 08             	mov    0x8(%ebp),%eax
    310a:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    310e:	5d                   	pop    %ebp
    310f:	c3                   	ret    

00003110 <topd>:

double topd(struct dstack* s)
{
    3110:	55                   	push   %ebp
    3111:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3113:	8b 45 08             	mov    0x8(%ebp),%eax
    3116:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    311c:	8b 45 08             	mov    0x8(%ebp),%eax
    311f:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    3123:	5d                   	pop    %ebp
    3124:	c3                   	ret    

00003125 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3125:	55                   	push   %ebp
    3126:	89 e5                	mov    %esp,%ebp
    3128:	53                   	push   %ebx
    3129:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    312f:	83 ec 08             	sub    $0x8,%esp
    3132:	6a 00                	push   $0x0
    3134:	68 48 39 00 00       	push   $0x3948
    3139:	e8 cd d1 ff ff       	call   30b <open>
    313e:	83 c4 10             	add    $0x10,%esp
    3141:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3144:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3148:	79 1d                	jns    3167 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    314a:	83 ec 0c             	sub    $0xc,%esp
    314d:	68 52 39 00 00       	push   $0x3952
    3152:	6a 00                	push   $0x0
    3154:	6a 00                	push   $0x0
    3156:	6a 01                	push   $0x1
    3158:	6a 03                	push   $0x3
    315a:	e8 40 fb ff ff       	call   2c9f <color_printf>
    315f:	83 c4 20             	add    $0x20,%esp
    3162:	e9 6d 02 00 00       	jmp    33d4 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    3167:	8b 45 0c             	mov    0xc(%ebp),%eax
    316a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    3170:	e9 2a 02 00 00       	jmp    339f <readVariables+0x27a>
  {
    int pos = 0;
    3175:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    317c:	00 00 00 
    while(pos <= n-1)
    317f:	e9 07 02 00 00       	jmp    338b <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    3184:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    318b:	eb 24                	jmp    31b1 <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    318d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3190:	8d 50 ff             	lea    -0x1(%eax),%edx
    3193:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    3199:	8b 45 f4             	mov    -0xc(%ebp),%eax
    319c:	01 c8                	add    %ecx,%eax
    319e:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    31a5:	ff 
    31a6:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    31ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    31b1:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    31b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31ba:	01 d0                	add    %edx,%eax
    31bc:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    31c3:	ff 
    31c4:	3c 3d                	cmp    $0x3d,%al
    31c6:	75 c5                	jne    318d <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    31c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31cb:	83 e8 01             	sub    $0x1,%eax
    31ce:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    31d5:	00 
      if(buf[pos] == 'd') //double value
    31d6:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    31dc:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    31e3:	ff 
    31e4:	3c 64                	cmp    $0x64,%al
    31e6:	0f 85 a0 00 00 00    	jne    328c <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    31ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    31ef:	8b 00                	mov    (%eax),%eax
    31f1:	c1 e0 05             	shl    $0x5,%eax
    31f4:	89 c2                	mov    %eax,%edx
    31f6:	8b 45 08             	mov    0x8(%ebp),%eax
    31f9:	01 d0                	add    %edx,%eax
    31fb:	8d 50 04             	lea    0x4(%eax),%edx
    31fe:	83 ec 08             	sub    $0x8,%esp
    3201:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3207:	50                   	push   %eax
    3208:	52                   	push   %edx
    3209:	e8 8c ce ff ff       	call   9a <strcpy>
    320e:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    3211:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3214:	8d 50 01             	lea    0x1(%eax),%edx
    3217:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    321d:	01 d0                	add    %edx,%eax
    321f:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    3225:	83 ec 08             	sub    $0x8,%esp
    3228:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    322e:	50                   	push   %eax
    322f:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3235:	50                   	push   %eax
    3236:	e8 7b d9 ff ff       	call   bb6 <Translation>
    323b:	83 c4 10             	add    $0x10,%esp
    323e:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    3241:	8b 45 0c             	mov    0xc(%ebp),%eax
    3244:	8b 00                	mov    (%eax),%eax
    3246:	c1 e0 05             	shl    $0x5,%eax
    3249:	89 c2                	mov    %eax,%edx
    324b:	8b 45 08             	mov    0x8(%ebp),%eax
    324e:	01 d0                	add    %edx,%eax
    3250:	dd 45 d8             	fldl   -0x28(%ebp)
    3253:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    3256:	8b 45 0c             	mov    0xc(%ebp),%eax
    3259:	8b 00                	mov    (%eax),%eax
    325b:	c1 e0 05             	shl    $0x5,%eax
    325e:	89 c2                	mov    %eax,%edx
    3260:	8b 45 08             	mov    0x8(%ebp),%eax
    3263:	01 d0                	add    %edx,%eax
    3265:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    326b:	8b 45 0c             	mov    0xc(%ebp),%eax
    326e:	8b 00                	mov    (%eax),%eax
    3270:	8d 50 01             	lea    0x1(%eax),%edx
    3273:	8b 45 0c             	mov    0xc(%ebp),%eax
    3276:	89 10                	mov    %edx,(%eax)
        pos++;
    3278:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    327e:	83 c0 01             	add    $0x1,%eax
    3281:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    3287:	e9 ff 00 00 00       	jmp    338b <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    328c:	8b 45 0c             	mov    0xc(%ebp),%eax
    328f:	8b 00                	mov    (%eax),%eax
    3291:	c1 e0 05             	shl    $0x5,%eax
    3294:	89 c2                	mov    %eax,%edx
    3296:	8b 45 08             	mov    0x8(%ebp),%eax
    3299:	01 d0                	add    %edx,%eax
    329b:	8d 50 04             	lea    0x4(%eax),%edx
    329e:	83 ec 08             	sub    $0x8,%esp
    32a1:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    32a7:	50                   	push   %eax
    32a8:	52                   	push   %edx
    32a9:	e8 ec cd ff ff       	call   9a <strcpy>
    32ae:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    32b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32b4:	8d 50 01             	lea    0x1(%eax),%edx
    32b7:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32bd:	01 d0                	add    %edx,%eax
    32bf:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    32c5:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    32ce:	eb 04                	jmp    32d4 <readVariables+0x1af>
        {
          strend++;
    32d0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    32d4:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    32da:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32dd:	01 d0                	add    %edx,%eax
    32df:	0f b6 00             	movzbl (%eax),%eax
    32e2:	84 c0                	test   %al,%al
    32e4:	75 ea                	jne    32d0 <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    32e6:	8b 45 0c             	mov    0xc(%ebp),%eax
    32e9:	8b 00                	mov    (%eax),%eax
    32eb:	c1 e0 05             	shl    $0x5,%eax
    32ee:	89 c2                	mov    %eax,%edx
    32f0:	8b 45 08             	mov    0x8(%ebp),%eax
    32f3:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    32f6:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32fc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    32ff:	29 c2                	sub    %eax,%edx
    3301:	89 d0                	mov    %edx,%eax
    3303:	83 c0 01             	add    $0x1,%eax
    3306:	83 ec 0c             	sub    $0xc,%esp
    3309:	50                   	push   %eax
    330a:	e8 6a d5 ff ff       	call   879 <malloc>
    330f:	83 c4 10             	add    $0x10,%esp
    3312:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    3315:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    331b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    331e:	eb 35                	jmp    3355 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    3320:	8b 45 0c             	mov    0xc(%ebp),%eax
    3323:	8b 00                	mov    (%eax),%eax
    3325:	c1 e0 05             	shl    $0x5,%eax
    3328:	89 c2                	mov    %eax,%edx
    332a:	8b 45 08             	mov    0x8(%ebp),%eax
    332d:	01 d0                	add    %edx,%eax
    332f:	8b 40 18             	mov    0x18(%eax),%eax
    3332:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3338:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    333b:	29 d1                	sub    %edx,%ecx
    333d:	89 ca                	mov    %ecx,%edx
    333f:	01 c2                	add    %eax,%edx
    3341:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    3347:	8b 45 ec             	mov    -0x14(%ebp),%eax
    334a:	01 c8                	add    %ecx,%eax
    334c:	0f b6 00             	movzbl (%eax),%eax
    334f:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    3351:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    3355:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3358:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    335b:	7e c3                	jle    3320 <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    335d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3360:	8b 00                	mov    (%eax),%eax
    3362:	c1 e0 05             	shl    $0x5,%eax
    3365:	89 c2                	mov    %eax,%edx
    3367:	8b 45 08             	mov    0x8(%ebp),%eax
    336a:	01 d0                	add    %edx,%eax
    336c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    3372:	8b 45 0c             	mov    0xc(%ebp),%eax
    3375:	8b 00                	mov    (%eax),%eax
    3377:	8d 50 01             	lea    0x1(%eax),%edx
    337a:	8b 45 0c             	mov    0xc(%ebp),%eax
    337d:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    337f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3382:	83 c0 01             	add    $0x1,%eax
    3385:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    338b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    338e:	8d 50 ff             	lea    -0x1(%eax),%edx
    3391:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3397:	39 c2                	cmp    %eax,%edx
    3399:	0f 8d e5 fd ff ff    	jge    3184 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    339f:	83 ec 04             	sub    $0x4,%esp
    33a2:	68 e8 03 00 00       	push   $0x3e8
    33a7:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    33ad:	50                   	push   %eax
    33ae:	ff 75 e8             	pushl  -0x18(%ebp)
    33b1:	e8 2d cf ff ff       	call   2e3 <read>
    33b6:	83 c4 10             	add    $0x10,%esp
    33b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    33bc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    33c0:	0f 8f af fd ff ff    	jg     3175 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    33c6:	83 ec 0c             	sub    $0xc,%esp
    33c9:	ff 75 e8             	pushl  -0x18(%ebp)
    33cc:	e8 22 cf ff ff       	call   2f3 <close>
    33d1:	83 c4 10             	add    $0x10,%esp
}
    33d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    33d7:	c9                   	leave  
    33d8:	c3                   	ret    

000033d9 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    33d9:	55                   	push   %ebp
    33da:	89 e5                	mov    %esp,%ebp
    33dc:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    33e2:	83 ec 08             	sub    $0x8,%esp
    33e5:	6a 02                	push   $0x2
    33e7:	68 48 39 00 00       	push   $0x3948
    33ec:	e8 1a cf ff ff       	call   30b <open>
    33f1:	83 c4 10             	add    $0x10,%esp
    33f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    33f7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    33fb:	78 1e                	js     341b <writeVariables+0x42>
  {
    close(fd);
    33fd:	83 ec 0c             	sub    $0xc,%esp
    3400:	ff 75 e4             	pushl  -0x1c(%ebp)
    3403:	e8 eb ce ff ff       	call   2f3 <close>
    3408:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    340b:	83 ec 0c             	sub    $0xc,%esp
    340e:	68 48 39 00 00       	push   $0x3948
    3413:	e8 03 cf ff ff       	call   31b <unlink>
    3418:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    341b:	83 ec 08             	sub    $0x8,%esp
    341e:	68 02 02 00 00       	push   $0x202
    3423:	68 48 39 00 00       	push   $0x3948
    3428:	e8 de ce ff ff       	call   30b <open>
    342d:	83 c4 10             	add    $0x10,%esp
    3430:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    3433:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    343a:	e9 ff 01 00 00       	jmp    363e <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    343f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3442:	c1 e0 05             	shl    $0x5,%eax
    3445:	89 c2                	mov    %eax,%edx
    3447:	8b 45 08             	mov    0x8(%ebp),%eax
    344a:	01 d0                	add    %edx,%eax
    344c:	8b 00                	mov    (%eax),%eax
    344e:	83 f8 01             	cmp    $0x1,%eax
    3451:	0f 85 d3 00 00 00    	jne    352a <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    3457:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    345e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3461:	8d 50 01             	lea    0x1(%eax),%edx
    3464:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3467:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    346e:	64 
      int k=0;
    346f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    3476:	eb 2c                	jmp    34a4 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    3478:	8b 45 e0             	mov    -0x20(%ebp),%eax
    347b:	8d 50 01             	lea    0x1(%eax),%edx
    347e:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3481:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3484:	89 d1                	mov    %edx,%ecx
    3486:	c1 e1 05             	shl    $0x5,%ecx
    3489:	8b 55 08             	mov    0x8(%ebp),%edx
    348c:	01 d1                	add    %edx,%ecx
    348e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3491:	01 ca                	add    %ecx,%edx
    3493:	83 c2 04             	add    $0x4,%edx
    3496:	0f b6 12             	movzbl (%edx),%edx
    3499:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    34a0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    34a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34a7:	c1 e0 05             	shl    $0x5,%eax
    34aa:	89 c2                	mov    %eax,%edx
    34ac:	8b 45 08             	mov    0x8(%ebp),%eax
    34af:	01 c2                	add    %eax,%edx
    34b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34b4:	01 d0                	add    %edx,%eax
    34b6:	83 c0 04             	add    $0x4,%eax
    34b9:	0f b6 00             	movzbl (%eax),%eax
    34bc:	84 c0                	test   %al,%al
    34be:	75 b8                	jne    3478 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    34c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34c3:	8d 50 01             	lea    0x1(%eax),%edx
    34c6:	89 55 e0             	mov    %edx,-0x20(%ebp)
    34c9:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    34d0:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    34d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34d4:	c1 e0 05             	shl    $0x5,%eax
    34d7:	89 c2                	mov    %eax,%edx
    34d9:	8b 45 08             	mov    0x8(%ebp),%eax
    34dc:	01 d0                	add    %edx,%eax
    34de:	dd 40 18             	fldl   0x18(%eax)
    34e1:	8d 45 e0             	lea    -0x20(%ebp),%eax
    34e4:	50                   	push   %eax
    34e5:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    34e9:	dd 1c 24             	fstpl  (%esp)
    34ec:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    34f2:	50                   	push   %eax
    34f3:	e8 7d d5 ff ff       	call   a75 <double2str>
    34f8:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    34fb:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34fe:	8d 50 01             	lea    0x1(%eax),%edx
    3501:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3504:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    350b:	00 
      write(fd,buf,pos);
    350c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    350f:	83 ec 04             	sub    $0x4,%esp
    3512:	50                   	push   %eax
    3513:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3519:	50                   	push   %eax
    351a:	ff 75 e4             	pushl  -0x1c(%ebp)
    351d:	e8 c9 cd ff ff       	call   2eb <write>
    3522:	83 c4 10             	add    $0x10,%esp
    3525:	e9 10 01 00 00       	jmp    363a <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    352a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    3531:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3534:	8d 50 01             	lea    0x1(%eax),%edx
    3537:	89 55 ec             	mov    %edx,-0x14(%ebp)
    353a:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    3541:	73 
      int k=0;
    3542:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    3549:	eb 2c                	jmp    3577 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    354b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    354e:	8d 50 01             	lea    0x1(%eax),%edx
    3551:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3554:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3557:	89 d1                	mov    %edx,%ecx
    3559:	c1 e1 05             	shl    $0x5,%ecx
    355c:	8b 55 08             	mov    0x8(%ebp),%edx
    355f:	01 d1                	add    %edx,%ecx
    3561:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3564:	01 ca                	add    %ecx,%edx
    3566:	83 c2 04             	add    $0x4,%edx
    3569:	0f b6 12             	movzbl (%edx),%edx
    356c:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3573:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    3577:	8b 45 f4             	mov    -0xc(%ebp),%eax
    357a:	c1 e0 05             	shl    $0x5,%eax
    357d:	89 c2                	mov    %eax,%edx
    357f:	8b 45 08             	mov    0x8(%ebp),%eax
    3582:	01 c2                	add    %eax,%edx
    3584:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3587:	01 d0                	add    %edx,%eax
    3589:	83 c0 04             	add    $0x4,%eax
    358c:	0f b6 00             	movzbl (%eax),%eax
    358f:	84 c0                	test   %al,%al
    3591:	75 b8                	jne    354b <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3593:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3596:	8d 50 01             	lea    0x1(%eax),%edx
    3599:	89 55 ec             	mov    %edx,-0x14(%ebp)
    359c:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    35a3:	3d 
      k=0;
    35a4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    35ab:	eb 2c                	jmp    35d9 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    35ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35b0:	8d 50 01             	lea    0x1(%eax),%edx
    35b3:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    35b9:	89 d1                	mov    %edx,%ecx
    35bb:	c1 e1 05             	shl    $0x5,%ecx
    35be:	8b 55 08             	mov    0x8(%ebp),%edx
    35c1:	01 ca                	add    %ecx,%edx
    35c3:	8b 4a 18             	mov    0x18(%edx),%ecx
    35c6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    35c9:	01 ca                	add    %ecx,%edx
    35cb:	0f b6 12             	movzbl (%edx),%edx
    35ce:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    35d5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    35d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35dc:	c1 e0 05             	shl    $0x5,%eax
    35df:	89 c2                	mov    %eax,%edx
    35e1:	8b 45 08             	mov    0x8(%ebp),%eax
    35e4:	01 d0                	add    %edx,%eax
    35e6:	8b 50 18             	mov    0x18(%eax),%edx
    35e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    35ec:	01 d0                	add    %edx,%eax
    35ee:	0f b6 00             	movzbl (%eax),%eax
    35f1:	84 c0                	test   %al,%al
    35f3:	75 b8                	jne    35ad <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    35f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35f8:	8d 50 01             	lea    0x1(%eax),%edx
    35fb:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35fe:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    3605:	00 
      write(fd,buf,pos);
    3606:	83 ec 04             	sub    $0x4,%esp
    3609:	ff 75 ec             	pushl  -0x14(%ebp)
    360c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3612:	50                   	push   %eax
    3613:	ff 75 e4             	pushl  -0x1c(%ebp)
    3616:	e8 d0 cc ff ff       	call   2eb <write>
    361b:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    361e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3621:	c1 e0 05             	shl    $0x5,%eax
    3624:	89 c2                	mov    %eax,%edx
    3626:	8b 45 08             	mov    0x8(%ebp),%eax
    3629:	01 d0                	add    %edx,%eax
    362b:	8b 40 18             	mov    0x18(%eax),%eax
    362e:	83 ec 0c             	sub    $0xc,%esp
    3631:	50                   	push   %eax
    3632:	e8 00 d1 ff ff       	call   737 <free>
    3637:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    363a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    363e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3641:	8b 00                	mov    (%eax),%eax
    3643:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3646:	0f 8f f3 fd ff ff    	jg     343f <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    364c:	8b 45 0c             	mov    0xc(%ebp),%eax
    364f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    3655:	83 ec 0c             	sub    $0xc,%esp
    3658:	ff 75 e4             	pushl  -0x1c(%ebp)
    365b:	e8 93 cc ff ff       	call   2f3 <close>
    3660:	83 c4 10             	add    $0x10,%esp
  return;
    3663:	90                   	nop
    3664:	c9                   	leave  
    3665:	c3                   	ret    
