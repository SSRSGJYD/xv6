
_mkdir：     文件格式 elf32-i386


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
       f:	83 ec 10             	sub    $0x10,%esp
      12:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
      14:	83 3b 01             	cmpl   $0x1,(%ebx)
      17:	7f 17                	jg     30 <main+0x30>
    printf(2, "Usage: mkdir files...\n");
      19:	83 ec 08             	sub    $0x8,%esp
      1c:	68 88 36 00 00       	push   $0x3688
      21:	6a 02                	push   $0x2
      23:	e8 6b 05 00 00       	call   593 <printf>
      28:	83 c4 10             	add    $0x10,%esp
    exit();
      2b:	e8 b7 02 00 00       	call   2e7 <exit>
  }

  for(i = 1; i < argc; i++){
      30:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      37:	eb 4b                	jmp    84 <main+0x84>
    if(mkdir(argv[i]) < 0){
      39:	8b 45 f4             	mov    -0xc(%ebp),%eax
      3c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
      43:	8b 43 04             	mov    0x4(%ebx),%eax
      46:	01 d0                	add    %edx,%eax
      48:	8b 00                	mov    (%eax),%eax
      4a:	83 ec 0c             	sub    $0xc,%esp
      4d:	50                   	push   %eax
      4e:	e8 fc 02 00 00       	call   34f <mkdir>
      53:	83 c4 10             	add    $0x10,%esp
      56:	85 c0                	test   %eax,%eax
      58:	79 26                	jns    80 <main+0x80>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
      5d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
      64:	8b 43 04             	mov    0x4(%ebx),%eax
      67:	01 d0                	add    %edx,%eax
      69:	8b 00                	mov    (%eax),%eax
      6b:	83 ec 04             	sub    $0x4,%esp
      6e:	50                   	push   %eax
      6f:	68 9f 36 00 00       	push   $0x369f
      74:	6a 02                	push   $0x2
      76:	e8 18 05 00 00       	call   593 <printf>
      7b:	83 c4 10             	add    $0x10,%esp
      break;
      7e:	eb 0b                	jmp    8b <main+0x8b>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
      80:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      84:	8b 45 f4             	mov    -0xc(%ebp),%eax
      87:	3b 03                	cmp    (%ebx),%eax
      89:	7c ae                	jl     39 <main+0x39>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
      8b:	e8 57 02 00 00       	call   2e7 <exit>

00000090 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
      90:	55                   	push   %ebp
      91:	89 e5                	mov    %esp,%ebp
      93:	57                   	push   %edi
      94:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
      95:	8b 4d 08             	mov    0x8(%ebp),%ecx
      98:	8b 55 10             	mov    0x10(%ebp),%edx
      9b:	8b 45 0c             	mov    0xc(%ebp),%eax
      9e:	89 cb                	mov    %ecx,%ebx
      a0:	89 df                	mov    %ebx,%edi
      a2:	89 d1                	mov    %edx,%ecx
      a4:	fc                   	cld    
      a5:	f3 aa                	rep stos %al,%es:(%edi)
      a7:	89 ca                	mov    %ecx,%edx
      a9:	89 fb                	mov    %edi,%ebx
      ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
      ae:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
      b1:	90                   	nop
      b2:	5b                   	pop    %ebx
      b3:	5f                   	pop    %edi
      b4:	5d                   	pop    %ebp
      b5:	c3                   	ret    

000000b6 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
      b6:	55                   	push   %ebp
      b7:	89 e5                	mov    %esp,%ebp
      b9:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
      bc:	8b 45 08             	mov    0x8(%ebp),%eax
      bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
      c2:	90                   	nop
      c3:	8b 45 08             	mov    0x8(%ebp),%eax
      c6:	8d 50 01             	lea    0x1(%eax),%edx
      c9:	89 55 08             	mov    %edx,0x8(%ebp)
      cc:	8b 55 0c             	mov    0xc(%ebp),%edx
      cf:	8d 4a 01             	lea    0x1(%edx),%ecx
      d2:	89 4d 0c             	mov    %ecx,0xc(%ebp)
      d5:	0f b6 12             	movzbl (%edx),%edx
      d8:	88 10                	mov    %dl,(%eax)
      da:	0f b6 00             	movzbl (%eax),%eax
      dd:	84 c0                	test   %al,%al
      df:	75 e2                	jne    c3 <strcpy+0xd>
    ;
  return os;
      e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
      e4:	c9                   	leave  
      e5:	c3                   	ret    

000000e6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      e6:	55                   	push   %ebp
      e7:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
      e9:	eb 08                	jmp    f3 <strcmp+0xd>
    p++, q++;
      eb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
      ef:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      f3:	8b 45 08             	mov    0x8(%ebp),%eax
      f6:	0f b6 00             	movzbl (%eax),%eax
      f9:	84 c0                	test   %al,%al
      fb:	74 10                	je     10d <strcmp+0x27>
      fd:	8b 45 08             	mov    0x8(%ebp),%eax
     100:	0f b6 10             	movzbl (%eax),%edx
     103:	8b 45 0c             	mov    0xc(%ebp),%eax
     106:	0f b6 00             	movzbl (%eax),%eax
     109:	38 c2                	cmp    %al,%dl
     10b:	74 de                	je     eb <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     10d:	8b 45 08             	mov    0x8(%ebp),%eax
     110:	0f b6 00             	movzbl (%eax),%eax
     113:	0f b6 d0             	movzbl %al,%edx
     116:	8b 45 0c             	mov    0xc(%ebp),%eax
     119:	0f b6 00             	movzbl (%eax),%eax
     11c:	0f b6 c0             	movzbl %al,%eax
     11f:	29 c2                	sub    %eax,%edx
     121:	89 d0                	mov    %edx,%eax
}
     123:	5d                   	pop    %ebp
     124:	c3                   	ret    

00000125 <strlen>:

uint
strlen(char *s)
{
     125:	55                   	push   %ebp
     126:	89 e5                	mov    %esp,%ebp
     128:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     12b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     132:	eb 04                	jmp    138 <strlen+0x13>
     134:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     138:	8b 55 fc             	mov    -0x4(%ebp),%edx
     13b:	8b 45 08             	mov    0x8(%ebp),%eax
     13e:	01 d0                	add    %edx,%eax
     140:	0f b6 00             	movzbl (%eax),%eax
     143:	84 c0                	test   %al,%al
     145:	75 ed                	jne    134 <strlen+0xf>
    ;
  return n;
     147:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     14a:	c9                   	leave  
     14b:	c3                   	ret    

0000014c <memset>:

void*
memset(void *dst, int c, uint n)
{
     14c:	55                   	push   %ebp
     14d:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     14f:	8b 45 10             	mov    0x10(%ebp),%eax
     152:	50                   	push   %eax
     153:	ff 75 0c             	pushl  0xc(%ebp)
     156:	ff 75 08             	pushl  0x8(%ebp)
     159:	e8 32 ff ff ff       	call   90 <stosb>
     15e:	83 c4 0c             	add    $0xc,%esp
  return dst;
     161:	8b 45 08             	mov    0x8(%ebp),%eax
}
     164:	c9                   	leave  
     165:	c3                   	ret    

00000166 <strchr>:

char*
strchr(const char *s, char c)
{
     166:	55                   	push   %ebp
     167:	89 e5                	mov    %esp,%ebp
     169:	83 ec 04             	sub    $0x4,%esp
     16c:	8b 45 0c             	mov    0xc(%ebp),%eax
     16f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     172:	eb 14                	jmp    188 <strchr+0x22>
    if(*s == c)
     174:	8b 45 08             	mov    0x8(%ebp),%eax
     177:	0f b6 00             	movzbl (%eax),%eax
     17a:	3a 45 fc             	cmp    -0x4(%ebp),%al
     17d:	75 05                	jne    184 <strchr+0x1e>
      return (char*)s;
     17f:	8b 45 08             	mov    0x8(%ebp),%eax
     182:	eb 13                	jmp    197 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     184:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     188:	8b 45 08             	mov    0x8(%ebp),%eax
     18b:	0f b6 00             	movzbl (%eax),%eax
     18e:	84 c0                	test   %al,%al
     190:	75 e2                	jne    174 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     192:	b8 00 00 00 00       	mov    $0x0,%eax
}
     197:	c9                   	leave  
     198:	c3                   	ret    

00000199 <gets>:

char*
gets(char *buf, int max)
{
     199:	55                   	push   %ebp
     19a:	89 e5                	mov    %esp,%ebp
     19c:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     19f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     1a6:	eb 42                	jmp    1ea <gets+0x51>
    cc = read(0, &c, 1);
     1a8:	83 ec 04             	sub    $0x4,%esp
     1ab:	6a 01                	push   $0x1
     1ad:	8d 45 ef             	lea    -0x11(%ebp),%eax
     1b0:	50                   	push   %eax
     1b1:	6a 00                	push   $0x0
     1b3:	e8 47 01 00 00       	call   2ff <read>
     1b8:	83 c4 10             	add    $0x10,%esp
     1bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     1be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     1c2:	7e 33                	jle    1f7 <gets+0x5e>
      break;
    buf[i++] = c;
     1c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1c7:	8d 50 01             	lea    0x1(%eax),%edx
     1ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
     1cd:	89 c2                	mov    %eax,%edx
     1cf:	8b 45 08             	mov    0x8(%ebp),%eax
     1d2:	01 c2                	add    %eax,%edx
     1d4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1d8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     1da:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1de:	3c 0a                	cmp    $0xa,%al
     1e0:	74 16                	je     1f8 <gets+0x5f>
     1e2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1e6:	3c 0d                	cmp    $0xd,%al
     1e8:	74 0e                	je     1f8 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     1ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1ed:	83 c0 01             	add    $0x1,%eax
     1f0:	3b 45 0c             	cmp    0xc(%ebp),%eax
     1f3:	7c b3                	jl     1a8 <gets+0xf>
     1f5:	eb 01                	jmp    1f8 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     1f7:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
     1fb:	8b 45 08             	mov    0x8(%ebp),%eax
     1fe:	01 d0                	add    %edx,%eax
     200:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     203:	8b 45 08             	mov    0x8(%ebp),%eax
}
     206:	c9                   	leave  
     207:	c3                   	ret    

00000208 <stat>:

int
stat(char *n, struct stat *st)
{
     208:	55                   	push   %ebp
     209:	89 e5                	mov    %esp,%ebp
     20b:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     20e:	83 ec 08             	sub    $0x8,%esp
     211:	6a 00                	push   $0x0
     213:	ff 75 08             	pushl  0x8(%ebp)
     216:	e8 0c 01 00 00       	call   327 <open>
     21b:	83 c4 10             	add    $0x10,%esp
     21e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     221:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     225:	79 07                	jns    22e <stat+0x26>
    return -1;
     227:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     22c:	eb 25                	jmp    253 <stat+0x4b>
  r = fstat(fd, st);
     22e:	83 ec 08             	sub    $0x8,%esp
     231:	ff 75 0c             	pushl  0xc(%ebp)
     234:	ff 75 f4             	pushl  -0xc(%ebp)
     237:	e8 03 01 00 00       	call   33f <fstat>
     23c:	83 c4 10             	add    $0x10,%esp
     23f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     242:	83 ec 0c             	sub    $0xc,%esp
     245:	ff 75 f4             	pushl  -0xc(%ebp)
     248:	e8 c2 00 00 00       	call   30f <close>
     24d:	83 c4 10             	add    $0x10,%esp
  return r;
     250:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     253:	c9                   	leave  
     254:	c3                   	ret    

00000255 <atoi>:

int
atoi(const char *s)
{
     255:	55                   	push   %ebp
     256:	89 e5                	mov    %esp,%ebp
     258:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     25b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     262:	eb 25                	jmp    289 <atoi+0x34>
    n = n*10 + *s++ - '0';
     264:	8b 55 fc             	mov    -0x4(%ebp),%edx
     267:	89 d0                	mov    %edx,%eax
     269:	c1 e0 02             	shl    $0x2,%eax
     26c:	01 d0                	add    %edx,%eax
     26e:	01 c0                	add    %eax,%eax
     270:	89 c1                	mov    %eax,%ecx
     272:	8b 45 08             	mov    0x8(%ebp),%eax
     275:	8d 50 01             	lea    0x1(%eax),%edx
     278:	89 55 08             	mov    %edx,0x8(%ebp)
     27b:	0f b6 00             	movzbl (%eax),%eax
     27e:	0f be c0             	movsbl %al,%eax
     281:	01 c8                	add    %ecx,%eax
     283:	83 e8 30             	sub    $0x30,%eax
     286:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     289:	8b 45 08             	mov    0x8(%ebp),%eax
     28c:	0f b6 00             	movzbl (%eax),%eax
     28f:	3c 2f                	cmp    $0x2f,%al
     291:	7e 0a                	jle    29d <atoi+0x48>
     293:	8b 45 08             	mov    0x8(%ebp),%eax
     296:	0f b6 00             	movzbl (%eax),%eax
     299:	3c 39                	cmp    $0x39,%al
     29b:	7e c7                	jle    264 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     29d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     2a0:	c9                   	leave  
     2a1:	c3                   	ret    

000002a2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     2a2:	55                   	push   %ebp
     2a3:	89 e5                	mov    %esp,%ebp
     2a5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     2a8:	8b 45 08             	mov    0x8(%ebp),%eax
     2ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     2ae:	8b 45 0c             	mov    0xc(%ebp),%eax
     2b1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     2b4:	eb 17                	jmp    2cd <memmove+0x2b>
    *dst++ = *src++;
     2b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
     2b9:	8d 50 01             	lea    0x1(%eax),%edx
     2bc:	89 55 fc             	mov    %edx,-0x4(%ebp)
     2bf:	8b 55 f8             	mov    -0x8(%ebp),%edx
     2c2:	8d 4a 01             	lea    0x1(%edx),%ecx
     2c5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     2c8:	0f b6 12             	movzbl (%edx),%edx
     2cb:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     2cd:	8b 45 10             	mov    0x10(%ebp),%eax
     2d0:	8d 50 ff             	lea    -0x1(%eax),%edx
     2d3:	89 55 10             	mov    %edx,0x10(%ebp)
     2d6:	85 c0                	test   %eax,%eax
     2d8:	7f dc                	jg     2b6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     2da:	8b 45 08             	mov    0x8(%ebp),%eax
}
     2dd:	c9                   	leave  
     2de:	c3                   	ret    

000002df <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     2df:	b8 01 00 00 00       	mov    $0x1,%eax
     2e4:	cd 40                	int    $0x40
     2e6:	c3                   	ret    

000002e7 <exit>:
SYSCALL(exit)
     2e7:	b8 02 00 00 00       	mov    $0x2,%eax
     2ec:	cd 40                	int    $0x40
     2ee:	c3                   	ret    

000002ef <wait>:
SYSCALL(wait)
     2ef:	b8 03 00 00 00       	mov    $0x3,%eax
     2f4:	cd 40                	int    $0x40
     2f6:	c3                   	ret    

000002f7 <pipe>:
SYSCALL(pipe)
     2f7:	b8 04 00 00 00       	mov    $0x4,%eax
     2fc:	cd 40                	int    $0x40
     2fe:	c3                   	ret    

000002ff <read>:
SYSCALL(read)
     2ff:	b8 05 00 00 00       	mov    $0x5,%eax
     304:	cd 40                	int    $0x40
     306:	c3                   	ret    

00000307 <write>:
SYSCALL(write)
     307:	b8 10 00 00 00       	mov    $0x10,%eax
     30c:	cd 40                	int    $0x40
     30e:	c3                   	ret    

0000030f <close>:
SYSCALL(close)
     30f:	b8 15 00 00 00       	mov    $0x15,%eax
     314:	cd 40                	int    $0x40
     316:	c3                   	ret    

00000317 <kill>:
SYSCALL(kill)
     317:	b8 06 00 00 00       	mov    $0x6,%eax
     31c:	cd 40                	int    $0x40
     31e:	c3                   	ret    

0000031f <exec>:
SYSCALL(exec)
     31f:	b8 07 00 00 00       	mov    $0x7,%eax
     324:	cd 40                	int    $0x40
     326:	c3                   	ret    

00000327 <open>:
SYSCALL(open)
     327:	b8 0f 00 00 00       	mov    $0xf,%eax
     32c:	cd 40                	int    $0x40
     32e:	c3                   	ret    

0000032f <mknod>:
SYSCALL(mknod)
     32f:	b8 11 00 00 00       	mov    $0x11,%eax
     334:	cd 40                	int    $0x40
     336:	c3                   	ret    

00000337 <unlink>:
SYSCALL(unlink)
     337:	b8 12 00 00 00       	mov    $0x12,%eax
     33c:	cd 40                	int    $0x40
     33e:	c3                   	ret    

0000033f <fstat>:
SYSCALL(fstat)
     33f:	b8 08 00 00 00       	mov    $0x8,%eax
     344:	cd 40                	int    $0x40
     346:	c3                   	ret    

00000347 <link>:
SYSCALL(link)
     347:	b8 13 00 00 00       	mov    $0x13,%eax
     34c:	cd 40                	int    $0x40
     34e:	c3                   	ret    

0000034f <mkdir>:
SYSCALL(mkdir)
     34f:	b8 14 00 00 00       	mov    $0x14,%eax
     354:	cd 40                	int    $0x40
     356:	c3                   	ret    

00000357 <chdir>:
SYSCALL(chdir)
     357:	b8 09 00 00 00       	mov    $0x9,%eax
     35c:	cd 40                	int    $0x40
     35e:	c3                   	ret    

0000035f <dup>:
SYSCALL(dup)
     35f:	b8 0a 00 00 00       	mov    $0xa,%eax
     364:	cd 40                	int    $0x40
     366:	c3                   	ret    

00000367 <getpid>:
SYSCALL(getpid)
     367:	b8 0b 00 00 00       	mov    $0xb,%eax
     36c:	cd 40                	int    $0x40
     36e:	c3                   	ret    

0000036f <sbrk>:
SYSCALL(sbrk)
     36f:	b8 0c 00 00 00       	mov    $0xc,%eax
     374:	cd 40                	int    $0x40
     376:	c3                   	ret    

00000377 <sleep>:
SYSCALL(sleep)
     377:	b8 0d 00 00 00       	mov    $0xd,%eax
     37c:	cd 40                	int    $0x40
     37e:	c3                   	ret    

0000037f <uptime>:
SYSCALL(uptime)
     37f:	b8 0e 00 00 00       	mov    $0xe,%eax
     384:	cd 40                	int    $0x40
     386:	c3                   	ret    

00000387 <colorwrite>:

//new here
SYSCALL(colorwrite)
     387:	b8 16 00 00 00       	mov    $0x16,%eax
     38c:	cd 40                	int    $0x40
     38e:	c3                   	ret    

0000038f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     38f:	55                   	push   %ebp
     390:	89 e5                	mov    %esp,%ebp
     392:	83 ec 18             	sub    $0x18,%esp
     395:	8b 45 0c             	mov    0xc(%ebp),%eax
     398:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     39b:	83 ec 04             	sub    $0x4,%esp
     39e:	6a 01                	push   $0x1
     3a0:	8d 45 f4             	lea    -0xc(%ebp),%eax
     3a3:	50                   	push   %eax
     3a4:	ff 75 08             	pushl  0x8(%ebp)
     3a7:	e8 5b ff ff ff       	call   307 <write>
     3ac:	83 c4 10             	add    $0x10,%esp
}
     3af:	90                   	nop
     3b0:	c9                   	leave  
     3b1:	c3                   	ret    

000003b2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     3b2:	55                   	push   %ebp
     3b3:	89 e5                	mov    %esp,%ebp
     3b5:	53                   	push   %ebx
     3b6:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     3b9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     3c0:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     3c4:	74 17                	je     3dd <printint+0x2b>
     3c6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     3ca:	79 11                	jns    3dd <printint+0x2b>
    neg = 1;
     3cc:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     3d3:	8b 45 0c             	mov    0xc(%ebp),%eax
     3d6:	f7 d8                	neg    %eax
     3d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
     3db:	eb 06                	jmp    3e3 <printint+0x31>
  } else {
    x = xx;
     3dd:	8b 45 0c             	mov    0xc(%ebp),%eax
     3e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     3e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     3ea:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     3ed:	8d 41 01             	lea    0x1(%ecx),%eax
     3f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
     3f3:	8b 5d 10             	mov    0x10(%ebp),%ebx
     3f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3f9:	ba 00 00 00 00       	mov    $0x0,%edx
     3fe:	f7 f3                	div    %ebx
     400:	89 d0                	mov    %edx,%eax
     402:	0f b6 80 e0 42 00 00 	movzbl 0x42e0(%eax),%eax
     409:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     40d:	8b 5d 10             	mov    0x10(%ebp),%ebx
     410:	8b 45 ec             	mov    -0x14(%ebp),%eax
     413:	ba 00 00 00 00       	mov    $0x0,%edx
     418:	f7 f3                	div    %ebx
     41a:	89 45 ec             	mov    %eax,-0x14(%ebp)
     41d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     421:	75 c7                	jne    3ea <printint+0x38>
  if(neg)
     423:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     427:	74 2d                	je     456 <printint+0xa4>
    buf[i++] = '-';
     429:	8b 45 f4             	mov    -0xc(%ebp),%eax
     42c:	8d 50 01             	lea    0x1(%eax),%edx
     42f:	89 55 f4             	mov    %edx,-0xc(%ebp)
     432:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     437:	eb 1d                	jmp    456 <printint+0xa4>
    putc(fd, buf[i]);
     439:	8d 55 dc             	lea    -0x24(%ebp),%edx
     43c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     43f:	01 d0                	add    %edx,%eax
     441:	0f b6 00             	movzbl (%eax),%eax
     444:	0f be c0             	movsbl %al,%eax
     447:	83 ec 08             	sub    $0x8,%esp
     44a:	50                   	push   %eax
     44b:	ff 75 08             	pushl  0x8(%ebp)
     44e:	e8 3c ff ff ff       	call   38f <putc>
     453:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     456:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     45a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     45e:	79 d9                	jns    439 <printint+0x87>
    putc(fd, buf[i]);
}
     460:	90                   	nop
     461:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     464:	c9                   	leave  
     465:	c3                   	ret    

00000466 <getInteger>:

static int getInteger(double num)
{
     466:	55                   	push   %ebp
     467:	89 e5                	mov    %esp,%ebp
     469:	83 ec 18             	sub    $0x18,%esp
     46c:	8b 45 08             	mov    0x8(%ebp),%eax
     46f:	89 45 e8             	mov    %eax,-0x18(%ebp)
     472:	8b 45 0c             	mov    0xc(%ebp),%eax
     475:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     478:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     47f:	eb 0e                	jmp    48f <getInteger+0x29>
  {
    num -= 1;
     481:	dd 45 e8             	fldl   -0x18(%ebp)
     484:	d9 e8                	fld1   
     486:	de e9                	fsubrp %st,%st(1)
     488:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     48b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     48f:	dd 45 e8             	fldl   -0x18(%ebp)
     492:	d9 e8                	fld1   
     494:	d9 c9                	fxch   %st(1)
     496:	df e9                	fucomip %st(1),%st
     498:	dd d8                	fstp   %st(0)
     49a:	77 e5                	ja     481 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     49c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     49f:	c9                   	leave  
     4a0:	c3                   	ret    

000004a1 <printdbl>:

void printdbl(int fd, double num)
{
     4a1:	55                   	push   %ebp
     4a2:	89 e5                	mov    %esp,%ebp
     4a4:	83 ec 28             	sub    $0x28,%esp
     4a7:	8b 45 0c             	mov    0xc(%ebp),%eax
     4aa:	89 45 e0             	mov    %eax,-0x20(%ebp)
     4ad:	8b 45 10             	mov    0x10(%ebp),%eax
     4b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     4b3:	d9 ee                	fldz   
     4b5:	dd 45 e0             	fldl   -0x20(%ebp)
     4b8:	d9 c9                	fxch   %st(1)
     4ba:	df e9                	fucomip %st(1),%st
     4bc:	dd d8                	fstp   %st(0)
     4be:	76 18                	jbe    4d8 <printdbl+0x37>
  {
    putc(fd,'-');
     4c0:	83 ec 08             	sub    $0x8,%esp
     4c3:	6a 2d                	push   $0x2d
     4c5:	ff 75 08             	pushl  0x8(%ebp)
     4c8:	e8 c2 fe ff ff       	call   38f <putc>
     4cd:	83 c4 10             	add    $0x10,%esp
    num = -num;
     4d0:	dd 45 e0             	fldl   -0x20(%ebp)
     4d3:	d9 e0                	fchs   
     4d5:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     4d8:	83 ec 08             	sub    $0x8,%esp
     4db:	ff 75 e4             	pushl  -0x1c(%ebp)
     4de:	ff 75 e0             	pushl  -0x20(%ebp)
     4e1:	e8 80 ff ff ff       	call   466 <getInteger>
     4e6:	83 c4 10             	add    $0x10,%esp
     4e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     4ec:	6a 01                	push   $0x1
     4ee:	6a 0a                	push   $0xa
     4f0:	ff 75 f0             	pushl  -0x10(%ebp)
     4f3:	ff 75 08             	pushl  0x8(%ebp)
     4f6:	e8 b7 fe ff ff       	call   3b2 <printint>
     4fb:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     4fe:	db 45 f0             	fildl  -0x10(%ebp)
     501:	dd 45 e0             	fldl   -0x20(%ebp)
     504:	de e1                	fsubp  %st,%st(1)
     506:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     509:	dd 45 e0             	fldl   -0x20(%ebp)
     50c:	dd 05 c8 36 00 00    	fldl   0x36c8
     512:	d9 c9                	fxch   %st(1)
     514:	df e9                	fucomip %st(1),%st
     516:	dd d8                	fstp   %st(0)
     518:	76 10                	jbe    52a <printdbl+0x89>
    putc(fd,'.');
     51a:	83 ec 08             	sub    $0x8,%esp
     51d:	6a 2e                	push   $0x2e
     51f:	ff 75 08             	pushl  0x8(%ebp)
     522:	e8 68 fe ff ff       	call   38f <putc>
     527:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     52a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     531:	eb 49                	jmp    57c <printdbl+0xdb>
  {
    num = num*10;
     533:	dd 45 e0             	fldl   -0x20(%ebp)
     536:	dd 05 d0 36 00 00    	fldl   0x36d0
     53c:	de c9                	fmulp  %st,%st(1)
     53e:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     541:	83 ec 08             	sub    $0x8,%esp
     544:	ff 75 e4             	pushl  -0x1c(%ebp)
     547:	ff 75 e0             	pushl  -0x20(%ebp)
     54a:	e8 17 ff ff ff       	call   466 <getInteger>
     54f:	83 c4 10             	add    $0x10,%esp
     552:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     555:	6a 01                	push   $0x1
     557:	6a 0a                	push   $0xa
     559:	ff 75 f0             	pushl  -0x10(%ebp)
     55c:	ff 75 08             	pushl  0x8(%ebp)
     55f:	e8 4e fe ff ff       	call   3b2 <printint>
     564:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     567:	db 45 f0             	fildl  -0x10(%ebp)
     56a:	dd 45 e0             	fldl   -0x20(%ebp)
     56d:	de e1                	fsubp  %st,%st(1)
     56f:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     572:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     576:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     57a:	7f 13                	jg     58f <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     57c:	dd 45 e0             	fldl   -0x20(%ebp)
     57f:	dd 05 c8 36 00 00    	fldl   0x36c8
     585:	d9 c9                	fxch   %st(1)
     587:	df e9                	fucomip %st(1),%st
     589:	dd d8                	fstp   %st(0)
     58b:	77 a6                	ja     533 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     58d:	eb 01                	jmp    590 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     58f:	90                   	nop
    }
  }
}
     590:	90                   	nop
     591:	c9                   	leave  
     592:	c3                   	ret    

00000593 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     593:	55                   	push   %ebp
     594:	89 e5                	mov    %esp,%ebp
     596:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     599:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     5a0:	8d 45 0c             	lea    0xc(%ebp),%eax
     5a3:	83 c0 04             	add    $0x4,%eax
     5a6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     5a9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     5b0:	e9 88 01 00 00       	jmp    73d <printf+0x1aa>
    c = fmt[i] & 0xff;
     5b5:	8b 55 0c             	mov    0xc(%ebp),%edx
     5b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5bb:	01 d0                	add    %edx,%eax
     5bd:	0f b6 00             	movzbl (%eax),%eax
     5c0:	0f be c0             	movsbl %al,%eax
     5c3:	25 ff 00 00 00       	and    $0xff,%eax
     5c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     5cb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     5cf:	75 2c                	jne    5fd <printf+0x6a>
      if(c == '%'){
     5d1:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     5d5:	75 0c                	jne    5e3 <printf+0x50>
        state = '%';
     5d7:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     5de:	e9 56 01 00 00       	jmp    739 <printf+0x1a6>
      } else {
        putc(fd, c);
     5e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     5e6:	0f be c0             	movsbl %al,%eax
     5e9:	83 ec 08             	sub    $0x8,%esp
     5ec:	50                   	push   %eax
     5ed:	ff 75 08             	pushl  0x8(%ebp)
     5f0:	e8 9a fd ff ff       	call   38f <putc>
     5f5:	83 c4 10             	add    $0x10,%esp
     5f8:	e9 3c 01 00 00       	jmp    739 <printf+0x1a6>
      }
    } else if(state == '%'){
     5fd:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     601:	0f 85 32 01 00 00    	jne    739 <printf+0x1a6>
      if(c == 'd'){
     607:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     60b:	75 1e                	jne    62b <printf+0x98>
        printint(fd, *ap, 10, 1);
     60d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     610:	8b 00                	mov    (%eax),%eax
     612:	6a 01                	push   $0x1
     614:	6a 0a                	push   $0xa
     616:	50                   	push   %eax
     617:	ff 75 08             	pushl  0x8(%ebp)
     61a:	e8 93 fd ff ff       	call   3b2 <printint>
     61f:	83 c4 10             	add    $0x10,%esp
        ap++;
     622:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     626:	e9 07 01 00 00       	jmp    732 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     62b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     62f:	74 06                	je     637 <printf+0xa4>
     631:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     635:	75 1e                	jne    655 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     637:	8b 45 e8             	mov    -0x18(%ebp),%eax
     63a:	8b 00                	mov    (%eax),%eax
     63c:	6a 00                	push   $0x0
     63e:	6a 10                	push   $0x10
     640:	50                   	push   %eax
     641:	ff 75 08             	pushl  0x8(%ebp)
     644:	e8 69 fd ff ff       	call   3b2 <printint>
     649:	83 c4 10             	add    $0x10,%esp
        ap++;
     64c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     650:	e9 dd 00 00 00       	jmp    732 <printf+0x19f>
      } else if(c == 's'){
     655:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     659:	75 46                	jne    6a1 <printf+0x10e>
        s = (char*)*ap;
     65b:	8b 45 e8             	mov    -0x18(%ebp),%eax
     65e:	8b 00                	mov    (%eax),%eax
     660:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     663:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     667:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     66b:	75 25                	jne    692 <printf+0xff>
          s = "(null)";
     66d:	c7 45 f4 c0 36 00 00 	movl   $0x36c0,-0xc(%ebp)
        while(*s != 0){
     674:	eb 1c                	jmp    692 <printf+0xff>
          putc(fd, *s);
     676:	8b 45 f4             	mov    -0xc(%ebp),%eax
     679:	0f b6 00             	movzbl (%eax),%eax
     67c:	0f be c0             	movsbl %al,%eax
     67f:	83 ec 08             	sub    $0x8,%esp
     682:	50                   	push   %eax
     683:	ff 75 08             	pushl  0x8(%ebp)
     686:	e8 04 fd ff ff       	call   38f <putc>
     68b:	83 c4 10             	add    $0x10,%esp
          s++;
     68e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     692:	8b 45 f4             	mov    -0xc(%ebp),%eax
     695:	0f b6 00             	movzbl (%eax),%eax
     698:	84 c0                	test   %al,%al
     69a:	75 da                	jne    676 <printf+0xe3>
     69c:	e9 91 00 00 00       	jmp    732 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     6a1:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     6a5:	75 1d                	jne    6c4 <printf+0x131>
        putc(fd, *ap);
     6a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6aa:	8b 00                	mov    (%eax),%eax
     6ac:	0f be c0             	movsbl %al,%eax
     6af:	83 ec 08             	sub    $0x8,%esp
     6b2:	50                   	push   %eax
     6b3:	ff 75 08             	pushl  0x8(%ebp)
     6b6:	e8 d4 fc ff ff       	call   38f <putc>
     6bb:	83 c4 10             	add    $0x10,%esp
        ap++;
     6be:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     6c2:	eb 6e                	jmp    732 <printf+0x19f>
      } else if(c == '%'){
     6c4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     6c8:	75 17                	jne    6e1 <printf+0x14e>
        putc(fd, c);
     6ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6cd:	0f be c0             	movsbl %al,%eax
     6d0:	83 ec 08             	sub    $0x8,%esp
     6d3:	50                   	push   %eax
     6d4:	ff 75 08             	pushl  0x8(%ebp)
     6d7:	e8 b3 fc ff ff       	call   38f <putc>
     6dc:	83 c4 10             	add    $0x10,%esp
     6df:	eb 51                	jmp    732 <printf+0x19f>
      } else if(c == 'f'){ //for double
     6e1:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     6e5:	75 26                	jne    70d <printf+0x17a>
        double *dap = (double*)ap;
     6e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6ea:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     6ed:	8b 45 e0             	mov    -0x20(%ebp),%eax
     6f0:	dd 00                	fldl   (%eax)
     6f2:	83 ec 04             	sub    $0x4,%esp
     6f5:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     6f9:	dd 1c 24             	fstpl  (%esp)
     6fc:	ff 75 08             	pushl  0x8(%ebp)
     6ff:	e8 9d fd ff ff       	call   4a1 <printdbl>
     704:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     707:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     70b:	eb 25                	jmp    732 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     70d:	83 ec 08             	sub    $0x8,%esp
     710:	6a 25                	push   $0x25
     712:	ff 75 08             	pushl  0x8(%ebp)
     715:	e8 75 fc ff ff       	call   38f <putc>
     71a:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     71d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     720:	0f be c0             	movsbl %al,%eax
     723:	83 ec 08             	sub    $0x8,%esp
     726:	50                   	push   %eax
     727:	ff 75 08             	pushl  0x8(%ebp)
     72a:	e8 60 fc ff ff       	call   38f <putc>
     72f:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     732:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     739:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     73d:	8b 55 0c             	mov    0xc(%ebp),%edx
     740:	8b 45 f0             	mov    -0x10(%ebp),%eax
     743:	01 d0                	add    %edx,%eax
     745:	0f b6 00             	movzbl (%eax),%eax
     748:	84 c0                	test   %al,%al
     74a:	0f 85 65 fe ff ff    	jne    5b5 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     750:	90                   	nop
     751:	c9                   	leave  
     752:	c3                   	ret    

00000753 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     753:	55                   	push   %ebp
     754:	89 e5                	mov    %esp,%ebp
     756:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     759:	8b 45 08             	mov    0x8(%ebp),%eax
     75c:	83 e8 08             	sub    $0x8,%eax
     75f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     762:	a1 28 44 00 00       	mov    0x4428,%eax
     767:	89 45 fc             	mov    %eax,-0x4(%ebp)
     76a:	eb 24                	jmp    790 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     76c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     76f:	8b 00                	mov    (%eax),%eax
     771:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     774:	77 12                	ja     788 <free+0x35>
     776:	8b 45 f8             	mov    -0x8(%ebp),%eax
     779:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     77c:	77 24                	ja     7a2 <free+0x4f>
     77e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     781:	8b 00                	mov    (%eax),%eax
     783:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     786:	77 1a                	ja     7a2 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     788:	8b 45 fc             	mov    -0x4(%ebp),%eax
     78b:	8b 00                	mov    (%eax),%eax
     78d:	89 45 fc             	mov    %eax,-0x4(%ebp)
     790:	8b 45 f8             	mov    -0x8(%ebp),%eax
     793:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     796:	76 d4                	jbe    76c <free+0x19>
     798:	8b 45 fc             	mov    -0x4(%ebp),%eax
     79b:	8b 00                	mov    (%eax),%eax
     79d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     7a0:	76 ca                	jbe    76c <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     7a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7a5:	8b 40 04             	mov    0x4(%eax),%eax
     7a8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     7af:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7b2:	01 c2                	add    %eax,%edx
     7b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7b7:	8b 00                	mov    (%eax),%eax
     7b9:	39 c2                	cmp    %eax,%edx
     7bb:	75 24                	jne    7e1 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     7bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7c0:	8b 50 04             	mov    0x4(%eax),%edx
     7c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7c6:	8b 00                	mov    (%eax),%eax
     7c8:	8b 40 04             	mov    0x4(%eax),%eax
     7cb:	01 c2                	add    %eax,%edx
     7cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7d0:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     7d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7d6:	8b 00                	mov    (%eax),%eax
     7d8:	8b 10                	mov    (%eax),%edx
     7da:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7dd:	89 10                	mov    %edx,(%eax)
     7df:	eb 0a                	jmp    7eb <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     7e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7e4:	8b 10                	mov    (%eax),%edx
     7e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7e9:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     7eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7ee:	8b 40 04             	mov    0x4(%eax),%eax
     7f1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     7f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7fb:	01 d0                	add    %edx,%eax
     7fd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     800:	75 20                	jne    822 <free+0xcf>
    p->s.size += bp->s.size;
     802:	8b 45 fc             	mov    -0x4(%ebp),%eax
     805:	8b 50 04             	mov    0x4(%eax),%edx
     808:	8b 45 f8             	mov    -0x8(%ebp),%eax
     80b:	8b 40 04             	mov    0x4(%eax),%eax
     80e:	01 c2                	add    %eax,%edx
     810:	8b 45 fc             	mov    -0x4(%ebp),%eax
     813:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     816:	8b 45 f8             	mov    -0x8(%ebp),%eax
     819:	8b 10                	mov    (%eax),%edx
     81b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     81e:	89 10                	mov    %edx,(%eax)
     820:	eb 08                	jmp    82a <free+0xd7>
  } else
    p->s.ptr = bp;
     822:	8b 45 fc             	mov    -0x4(%ebp),%eax
     825:	8b 55 f8             	mov    -0x8(%ebp),%edx
     828:	89 10                	mov    %edx,(%eax)
  freep = p;
     82a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     82d:	a3 28 44 00 00       	mov    %eax,0x4428
}
     832:	90                   	nop
     833:	c9                   	leave  
     834:	c3                   	ret    

00000835 <morecore>:

static Header*
morecore(uint nu)
{
     835:	55                   	push   %ebp
     836:	89 e5                	mov    %esp,%ebp
     838:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     83b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     842:	77 07                	ja     84b <morecore+0x16>
    nu = 4096;
     844:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     84b:	8b 45 08             	mov    0x8(%ebp),%eax
     84e:	c1 e0 03             	shl    $0x3,%eax
     851:	83 ec 0c             	sub    $0xc,%esp
     854:	50                   	push   %eax
     855:	e8 15 fb ff ff       	call   36f <sbrk>
     85a:	83 c4 10             	add    $0x10,%esp
     85d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     860:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     864:	75 07                	jne    86d <morecore+0x38>
    return 0;
     866:	b8 00 00 00 00       	mov    $0x0,%eax
     86b:	eb 26                	jmp    893 <morecore+0x5e>
  hp = (Header*)p;
     86d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     870:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     873:	8b 45 f0             	mov    -0x10(%ebp),%eax
     876:	8b 55 08             	mov    0x8(%ebp),%edx
     879:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     87c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     87f:	83 c0 08             	add    $0x8,%eax
     882:	83 ec 0c             	sub    $0xc,%esp
     885:	50                   	push   %eax
     886:	e8 c8 fe ff ff       	call   753 <free>
     88b:	83 c4 10             	add    $0x10,%esp
  return freep;
     88e:	a1 28 44 00 00       	mov    0x4428,%eax
}
     893:	c9                   	leave  
     894:	c3                   	ret    

00000895 <malloc>:

void*
malloc(uint nbytes)
{
     895:	55                   	push   %ebp
     896:	89 e5                	mov    %esp,%ebp
     898:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     89b:	8b 45 08             	mov    0x8(%ebp),%eax
     89e:	83 c0 07             	add    $0x7,%eax
     8a1:	c1 e8 03             	shr    $0x3,%eax
     8a4:	83 c0 01             	add    $0x1,%eax
     8a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     8aa:	a1 28 44 00 00       	mov    0x4428,%eax
     8af:	89 45 f0             	mov    %eax,-0x10(%ebp)
     8b2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     8b6:	75 23                	jne    8db <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     8b8:	c7 45 f0 20 44 00 00 	movl   $0x4420,-0x10(%ebp)
     8bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8c2:	a3 28 44 00 00       	mov    %eax,0x4428
     8c7:	a1 28 44 00 00       	mov    0x4428,%eax
     8cc:	a3 20 44 00 00       	mov    %eax,0x4420
    base.s.size = 0;
     8d1:	c7 05 24 44 00 00 00 	movl   $0x0,0x4424
     8d8:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     8db:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8de:	8b 00                	mov    (%eax),%eax
     8e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     8e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8e6:	8b 40 04             	mov    0x4(%eax),%eax
     8e9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     8ec:	72 4d                	jb     93b <malloc+0xa6>
      if(p->s.size == nunits)
     8ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8f1:	8b 40 04             	mov    0x4(%eax),%eax
     8f4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     8f7:	75 0c                	jne    905 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     8f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8fc:	8b 10                	mov    (%eax),%edx
     8fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     901:	89 10                	mov    %edx,(%eax)
     903:	eb 26                	jmp    92b <malloc+0x96>
      else {
        p->s.size -= nunits;
     905:	8b 45 f4             	mov    -0xc(%ebp),%eax
     908:	8b 40 04             	mov    0x4(%eax),%eax
     90b:	2b 45 ec             	sub    -0x14(%ebp),%eax
     90e:	89 c2                	mov    %eax,%edx
     910:	8b 45 f4             	mov    -0xc(%ebp),%eax
     913:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     916:	8b 45 f4             	mov    -0xc(%ebp),%eax
     919:	8b 40 04             	mov    0x4(%eax),%eax
     91c:	c1 e0 03             	shl    $0x3,%eax
     91f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     922:	8b 45 f4             	mov    -0xc(%ebp),%eax
     925:	8b 55 ec             	mov    -0x14(%ebp),%edx
     928:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     92b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     92e:	a3 28 44 00 00       	mov    %eax,0x4428
      return (void*)(p + 1);
     933:	8b 45 f4             	mov    -0xc(%ebp),%eax
     936:	83 c0 08             	add    $0x8,%eax
     939:	eb 3b                	jmp    976 <malloc+0xe1>
    }
    if(p == freep)
     93b:	a1 28 44 00 00       	mov    0x4428,%eax
     940:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     943:	75 1e                	jne    963 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     945:	83 ec 0c             	sub    $0xc,%esp
     948:	ff 75 ec             	pushl  -0x14(%ebp)
     94b:	e8 e5 fe ff ff       	call   835 <morecore>
     950:	83 c4 10             	add    $0x10,%esp
     953:	89 45 f4             	mov    %eax,-0xc(%ebp)
     956:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     95a:	75 07                	jne    963 <malloc+0xce>
        return 0;
     95c:	b8 00 00 00 00       	mov    $0x0,%eax
     961:	eb 13                	jmp    976 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     963:	8b 45 f4             	mov    -0xc(%ebp),%eax
     966:	89 45 f0             	mov    %eax,-0x10(%ebp)
     969:	8b 45 f4             	mov    -0xc(%ebp),%eax
     96c:	8b 00                	mov    (%eax),%eax
     96e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     971:	e9 6d ff ff ff       	jmp    8e3 <malloc+0x4e>
}
     976:	c9                   	leave  
     977:	c3                   	ret    

00000978 <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     978:	55                   	push   %ebp
     979:	89 e5                	mov    %esp,%ebp
     97b:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     97e:	83 ec 04             	sub    $0x4,%esp
     981:	ff 75 08             	pushl  0x8(%ebp)
     984:	68 d8 36 00 00       	push   $0x36d8
     989:	6a 02                	push   $0x2
     98b:	e8 03 fc ff ff       	call   593 <printf>
     990:	83 c4 10             	add    $0x10,%esp
  exit();
     993:	e8 4f f9 ff ff       	call   2e7 <exit>

00000998 <getInteger>:
}

static int getInteger(double num)
{
     998:	55                   	push   %ebp
     999:	89 e5                	mov    %esp,%ebp
     99b:	83 ec 18             	sub    $0x18,%esp
     99e:	8b 45 08             	mov    0x8(%ebp),%eax
     9a1:	89 45 e8             	mov    %eax,-0x18(%ebp)
     9a4:	8b 45 0c             	mov    0xc(%ebp),%eax
     9a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     9aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     9b1:	eb 0e                	jmp    9c1 <getInteger+0x29>
  {
    num -= 1;
     9b3:	dd 45 e8             	fldl   -0x18(%ebp)
     9b6:	d9 e8                	fld1   
     9b8:	de e9                	fsubrp %st,%st(1)
     9ba:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     9bd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     9c1:	dd 45 e8             	fldl   -0x18(%ebp)
     9c4:	d9 e8                	fld1   
     9c6:	d9 c9                	fxch   %st(1)
     9c8:	df e9                	fucomip %st(1),%st
     9ca:	dd d8                	fstp   %st(0)
     9cc:	77 e5                	ja     9b3 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     9ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     9d1:	c9                   	leave  
     9d2:	c3                   	ret    

000009d3 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     9d3:	55                   	push   %ebp
     9d4:	89 e5                	mov    %esp,%ebp
     9d6:	53                   	push   %ebx
     9d7:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     9da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     9e1:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     9e5:	74 17                	je     9fe <int2str+0x2b>
     9e7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     9eb:	79 11                	jns    9fe <int2str+0x2b>
    neg = 1;
     9ed:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     9f4:	8b 45 0c             	mov    0xc(%ebp),%eax
     9f7:	f7 d8                	neg    %eax
     9f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
     9fc:	eb 06                	jmp    a04 <int2str+0x31>
  } else {
    x = num;
     9fe:	8b 45 0c             	mov    0xc(%ebp),%eax
     a01:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     a04:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     a0b:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     a0e:	8d 41 01             	lea    0x1(%ecx),%eax
     a11:	89 45 f8             	mov    %eax,-0x8(%ebp)
     a14:	8b 5d 14             	mov    0x14(%ebp),%ebx
     a17:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a1a:	ba 00 00 00 00       	mov    $0x0,%edx
     a1f:	f7 f3                	div    %ebx
     a21:	89 d0                	mov    %edx,%eax
     a23:	0f b6 80 f4 42 00 00 	movzbl 0x42f4(%eax),%eax
     a2a:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     a2e:	8b 5d 14             	mov    0x14(%ebp),%ebx
     a31:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a34:	ba 00 00 00 00       	mov    $0x0,%edx
     a39:	f7 f3                	div    %ebx
     a3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
     a3e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a42:	75 c7                	jne    a0b <int2str+0x38>
  if(neg)
     a44:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     a48:	74 36                	je     a80 <int2str+0xad>
    buf[i++] = '-';
     a4a:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a4d:	8d 50 01             	lea    0x1(%eax),%edx
     a50:	89 55 f8             	mov    %edx,-0x8(%ebp)
     a53:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     a58:	eb 26                	jmp    a80 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     a5a:	8b 45 10             	mov    0x10(%ebp),%eax
     a5d:	8b 00                	mov    (%eax),%eax
     a5f:	89 c2                	mov    %eax,%edx
     a61:	8b 45 08             	mov    0x8(%ebp),%eax
     a64:	01 c2                	add    %eax,%edx
     a66:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     a69:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a6c:	01 c8                	add    %ecx,%eax
     a6e:	0f b6 00             	movzbl (%eax),%eax
     a71:	88 02                	mov    %al,(%edx)
    (*pos)++;
     a73:	8b 45 10             	mov    0x10(%ebp),%eax
     a76:	8b 00                	mov    (%eax),%eax
     a78:	8d 50 01             	lea    0x1(%eax),%edx
     a7b:	8b 45 10             	mov    0x10(%ebp),%eax
     a7e:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     a80:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     a84:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     a88:	79 d0                	jns    a5a <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     a8a:	90                   	nop
     a8b:	83 c4 20             	add    $0x20,%esp
     a8e:	5b                   	pop    %ebx
     a8f:	5d                   	pop    %ebp
     a90:	c3                   	ret    

00000a91 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     a91:	55                   	push   %ebp
     a92:	89 e5                	mov    %esp,%ebp
     a94:	83 ec 18             	sub    $0x18,%esp
     a97:	8b 45 0c             	mov    0xc(%ebp),%eax
     a9a:	89 45 e8             	mov    %eax,-0x18(%ebp)
     a9d:	8b 45 10             	mov    0x10(%ebp),%eax
     aa0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     aa3:	d9 ee                	fldz   
     aa5:	dd 45 e8             	fldl   -0x18(%ebp)
     aa8:	d9 c9                	fxch   %st(1)
     aaa:	df e9                	fucomip %st(1),%st
     aac:	dd d8                	fstp   %st(0)
     aae:	76 24                	jbe    ad4 <double2str+0x43>
  {
    buf[*pos] = '-';
     ab0:	8b 45 14             	mov    0x14(%ebp),%eax
     ab3:	8b 00                	mov    (%eax),%eax
     ab5:	89 c2                	mov    %eax,%edx
     ab7:	8b 45 08             	mov    0x8(%ebp),%eax
     aba:	01 d0                	add    %edx,%eax
     abc:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     abf:	8b 45 14             	mov    0x14(%ebp),%eax
     ac2:	8b 00                	mov    (%eax),%eax
     ac4:	8d 50 01             	lea    0x1(%eax),%edx
     ac7:	8b 45 14             	mov    0x14(%ebp),%eax
     aca:	89 10                	mov    %edx,(%eax)
    num = -num;
     acc:	dd 45 e8             	fldl   -0x18(%ebp)
     acf:	d9 e0                	fchs   
     ad1:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     ad4:	ff 75 ec             	pushl  -0x14(%ebp)
     ad7:	ff 75 e8             	pushl  -0x18(%ebp)
     ada:	e8 b9 fe ff ff       	call   998 <getInteger>
     adf:	83 c4 08             	add    $0x8,%esp
     ae2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     ae5:	83 ec 04             	sub    $0x4,%esp
     ae8:	6a 01                	push   $0x1
     aea:	6a 0a                	push   $0xa
     aec:	ff 75 14             	pushl  0x14(%ebp)
     aef:	ff 75 f8             	pushl  -0x8(%ebp)
     af2:	ff 75 08             	pushl  0x8(%ebp)
     af5:	e8 d9 fe ff ff       	call   9d3 <int2str>
     afa:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     afd:	db 45 f8             	fildl  -0x8(%ebp)
     b00:	dd 45 e8             	fldl   -0x18(%ebp)
     b03:	de e1                	fsubp  %st,%st(1)
     b05:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     b08:	dd 45 e8             	fldl   -0x18(%ebp)
     b0b:	dd 05 e0 36 00 00    	fldl   0x36e0
     b11:	d9 c9                	fxch   %st(1)
     b13:	df e9                	fucomip %st(1),%st
     b15:	dd d8                	fstp   %st(0)
     b17:	76 1c                	jbe    b35 <double2str+0xa4>
  {
    buf[*pos] = '.';
     b19:	8b 45 14             	mov    0x14(%ebp),%eax
     b1c:	8b 00                	mov    (%eax),%eax
     b1e:	89 c2                	mov    %eax,%edx
     b20:	8b 45 08             	mov    0x8(%ebp),%eax
     b23:	01 d0                	add    %edx,%eax
     b25:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     b28:	8b 45 14             	mov    0x14(%ebp),%eax
     b2b:	8b 00                	mov    (%eax),%eax
     b2d:	8d 50 01             	lea    0x1(%eax),%edx
     b30:	8b 45 14             	mov    0x14(%ebp),%eax
     b33:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     b35:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     b3c:	eb 4c                	jmp    b8a <double2str+0xf9>
  {
    num = num*10;
     b3e:	dd 45 e8             	fldl   -0x18(%ebp)
     b41:	dd 05 e8 36 00 00    	fldl   0x36e8
     b47:	de c9                	fmulp  %st,%st(1)
     b49:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     b4c:	ff 75 ec             	pushl  -0x14(%ebp)
     b4f:	ff 75 e8             	pushl  -0x18(%ebp)
     b52:	e8 41 fe ff ff       	call   998 <getInteger>
     b57:	83 c4 08             	add    $0x8,%esp
     b5a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     b5d:	83 ec 04             	sub    $0x4,%esp
     b60:	6a 01                	push   $0x1
     b62:	6a 0a                	push   $0xa
     b64:	ff 75 14             	pushl  0x14(%ebp)
     b67:	ff 75 f8             	pushl  -0x8(%ebp)
     b6a:	ff 75 08             	pushl  0x8(%ebp)
     b6d:	e8 61 fe ff ff       	call   9d3 <int2str>
     b72:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     b75:	db 45 f8             	fildl  -0x8(%ebp)
     b78:	dd 45 e8             	fldl   -0x18(%ebp)
     b7b:	de e1                	fsubp  %st,%st(1)
     b7d:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     b80:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     b84:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     b88:	7f 13                	jg     b9d <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     b8a:	dd 45 e8             	fldl   -0x18(%ebp)
     b8d:	dd 05 e0 36 00 00    	fldl   0x36e0
     b93:	d9 c9                	fxch   %st(1)
     b95:	df e9                	fucomip %st(1),%st
     b97:	dd d8                	fstp   %st(0)
     b99:	77 a3                	ja     b3e <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     b9b:	eb 01                	jmp    b9e <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     b9d:	90                   	nop
    }
  }
}
     b9e:	90                   	nop
     b9f:	c9                   	leave  
     ba0:	c3                   	ret    

00000ba1 <pow>:

double pow(double opnd, int power)
{
     ba1:	55                   	push   %ebp
     ba2:	89 e5                	mov    %esp,%ebp
     ba4:	83 ec 18             	sub    $0x18,%esp
     ba7:	8b 45 08             	mov    0x8(%ebp),%eax
     baa:	89 45 e8             	mov    %eax,-0x18(%ebp)
     bad:	8b 45 0c             	mov    0xc(%ebp),%eax
     bb0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     bb3:	d9 e8                	fld1   
     bb5:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     bb8:	eb 0d                	jmp    bc7 <pow+0x26>
  {
    result *= opnd;
     bba:	dd 45 f8             	fldl   -0x8(%ebp)
     bbd:	dc 4d e8             	fmull  -0x18(%ebp)
     bc0:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     bc3:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     bc7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     bcb:	7f ed                	jg     bba <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     bcd:	dd 45 f8             	fldl   -0x8(%ebp)
}
     bd0:	c9                   	leave  
     bd1:	c3                   	ret    

00000bd2 <Translation>:

double Translation(char *s, int* pos)
{
     bd2:	55                   	push   %ebp
     bd3:	89 e5                	mov    %esp,%ebp
     bd5:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     bd8:	d9 ee                	fldz   
     bda:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     bdd:	d9 ee                	fldz   
     bdf:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     be2:	eb 3e                	jmp    c22 <Translation+0x50>
    {
        integer *= 10;
     be4:	dd 45 f8             	fldl   -0x8(%ebp)
     be7:	dd 05 e8 36 00 00    	fldl   0x36e8
     bed:	de c9                	fmulp  %st,%st(1)
     bef:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     bf2:	8b 45 0c             	mov    0xc(%ebp),%eax
     bf5:	8b 00                	mov    (%eax),%eax
     bf7:	89 c2                	mov    %eax,%edx
     bf9:	8b 45 08             	mov    0x8(%ebp),%eax
     bfc:	01 d0                	add    %edx,%eax
     bfe:	0f b6 00             	movzbl (%eax),%eax
     c01:	0f be c0             	movsbl %al,%eax
     c04:	83 e8 30             	sub    $0x30,%eax
     c07:	89 45 dc             	mov    %eax,-0x24(%ebp)
     c0a:	db 45 dc             	fildl  -0x24(%ebp)
     c0d:	dd 45 f8             	fldl   -0x8(%ebp)
     c10:	de c1                	faddp  %st,%st(1)
     c12:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     c15:	8b 45 0c             	mov    0xc(%ebp),%eax
     c18:	8b 00                	mov    (%eax),%eax
     c1a:	8d 50 01             	lea    0x1(%eax),%edx
     c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
     c20:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c22:	8b 45 0c             	mov    0xc(%ebp),%eax
     c25:	8b 00                	mov    (%eax),%eax
     c27:	89 c2                	mov    %eax,%edx
     c29:	8b 45 08             	mov    0x8(%ebp),%eax
     c2c:	01 d0                	add    %edx,%eax
     c2e:	0f b6 00             	movzbl (%eax),%eax
     c31:	3c 2f                	cmp    $0x2f,%al
     c33:	7e 13                	jle    c48 <Translation+0x76>
     c35:	8b 45 0c             	mov    0xc(%ebp),%eax
     c38:	8b 00                	mov    (%eax),%eax
     c3a:	89 c2                	mov    %eax,%edx
     c3c:	8b 45 08             	mov    0x8(%ebp),%eax
     c3f:	01 d0                	add    %edx,%eax
     c41:	0f b6 00             	movzbl (%eax),%eax
     c44:	3c 39                	cmp    $0x39,%al
     c46:	7e 9c                	jle    be4 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     c48:	8b 45 0c             	mov    0xc(%ebp),%eax
     c4b:	8b 00                	mov    (%eax),%eax
     c4d:	89 c2                	mov    %eax,%edx
     c4f:	8b 45 08             	mov    0x8(%ebp),%eax
     c52:	01 d0                	add    %edx,%eax
     c54:	0f b6 00             	movzbl (%eax),%eax
     c57:	3c 2e                	cmp    $0x2e,%al
     c59:	0f 85 9b 00 00 00    	jne    cfa <Translation+0x128>
    {
        (*pos)++;
     c5f:	8b 45 0c             	mov    0xc(%ebp),%eax
     c62:	8b 00                	mov    (%eax),%eax
     c64:	8d 50 01             	lea    0x1(%eax),%edx
     c67:	8b 45 0c             	mov    0xc(%ebp),%eax
     c6a:	89 10                	mov    %edx,(%eax)
        int c = 1;
     c6c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c73:	eb 5b                	jmp    cd0 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     c75:	8b 45 0c             	mov    0xc(%ebp),%eax
     c78:	8b 00                	mov    (%eax),%eax
     c7a:	89 c2                	mov    %eax,%edx
     c7c:	8b 45 08             	mov    0x8(%ebp),%eax
     c7f:	01 d0                	add    %edx,%eax
     c81:	0f b6 00             	movzbl (%eax),%eax
     c84:	0f be c0             	movsbl %al,%eax
     c87:	83 e8 30             	sub    $0x30,%eax
     c8a:	89 45 dc             	mov    %eax,-0x24(%ebp)
     c8d:	db 45 dc             	fildl  -0x24(%ebp)
     c90:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     c93:	83 ec 04             	sub    $0x4,%esp
     c96:	ff 75 ec             	pushl  -0x14(%ebp)
     c99:	dd 05 f0 36 00 00    	fldl   0x36f0
     c9f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     ca3:	dd 1c 24             	fstpl  (%esp)
     ca6:	e8 f6 fe ff ff       	call   ba1 <pow>
     cab:	83 c4 10             	add    $0x10,%esp
     cae:	dd 45 e0             	fldl   -0x20(%ebp)
     cb1:	de c9                	fmulp  %st,%st(1)
     cb3:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     cb6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     cba:	dd 45 f0             	fldl   -0x10(%ebp)
     cbd:	dc 45 e0             	faddl  -0x20(%ebp)
     cc0:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     cc3:	8b 45 0c             	mov    0xc(%ebp),%eax
     cc6:	8b 00                	mov    (%eax),%eax
     cc8:	8d 50 01             	lea    0x1(%eax),%edx
     ccb:	8b 45 0c             	mov    0xc(%ebp),%eax
     cce:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     cd0:	8b 45 0c             	mov    0xc(%ebp),%eax
     cd3:	8b 00                	mov    (%eax),%eax
     cd5:	89 c2                	mov    %eax,%edx
     cd7:	8b 45 08             	mov    0x8(%ebp),%eax
     cda:	01 d0                	add    %edx,%eax
     cdc:	0f b6 00             	movzbl (%eax),%eax
     cdf:	3c 2f                	cmp    $0x2f,%al
     ce1:	7e 17                	jle    cfa <Translation+0x128>
     ce3:	8b 45 0c             	mov    0xc(%ebp),%eax
     ce6:	8b 00                	mov    (%eax),%eax
     ce8:	89 c2                	mov    %eax,%edx
     cea:	8b 45 08             	mov    0x8(%ebp),%eax
     ced:	01 d0                	add    %edx,%eax
     cef:	0f b6 00             	movzbl (%eax),%eax
     cf2:	3c 39                	cmp    $0x39,%al
     cf4:	0f 8e 7b ff ff ff    	jle    c75 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     cfa:	dd 45 f8             	fldl   -0x8(%ebp)
     cfd:	dc 45 f0             	faddl  -0x10(%ebp)
     d00:	c9                   	leave  
     d01:	c3                   	ret    

00000d02 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     d02:	55                   	push   %ebp
     d03:	89 e5                	mov    %esp,%ebp
     d05:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     d08:	e8 d2 f5 ff ff       	call   2df <fork>
     d0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     d10:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d13:	c9                   	leave  
     d14:	c3                   	ret    

00000d15 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     d15:	55                   	push   %ebp
     d16:	89 e5                	mov    %esp,%ebp
     d18:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d1b:	83 ec 0c             	sub    $0xc,%esp
     d1e:	6a 54                	push   $0x54
     d20:	e8 70 fb ff ff       	call   895 <malloc>
     d25:	83 c4 10             	add    $0x10,%esp
     d28:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     d2b:	83 ec 04             	sub    $0x4,%esp
     d2e:	6a 54                	push   $0x54
     d30:	6a 00                	push   $0x0
     d32:	ff 75 f4             	pushl  -0xc(%ebp)
     d35:	e8 12 f4 ff ff       	call   14c <memset>
     d3a:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     d3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d40:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     d46:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d49:	c9                   	leave  
     d4a:	c3                   	ret    

00000d4b <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     d4b:	55                   	push   %ebp
     d4c:	89 e5                	mov    %esp,%ebp
     d4e:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d51:	83 ec 0c             	sub    $0xc,%esp
     d54:	6a 18                	push   $0x18
     d56:	e8 3a fb ff ff       	call   895 <malloc>
     d5b:	83 c4 10             	add    $0x10,%esp
     d5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     d61:	83 ec 04             	sub    $0x4,%esp
     d64:	6a 18                	push   $0x18
     d66:	6a 00                	push   $0x0
     d68:	ff 75 f4             	pushl  -0xc(%ebp)
     d6b:	e8 dc f3 ff ff       	call   14c <memset>
     d70:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     d73:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d76:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     d7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d7f:	8b 55 08             	mov    0x8(%ebp),%edx
     d82:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     d85:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d88:	8b 55 0c             	mov    0xc(%ebp),%edx
     d8b:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     d8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d91:	8b 55 10             	mov    0x10(%ebp),%edx
     d94:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     d97:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d9a:	8b 55 14             	mov    0x14(%ebp),%edx
     d9d:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     da0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     da3:	8b 55 18             	mov    0x18(%ebp),%edx
     da6:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     da9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     dac:	c9                   	leave  
     dad:	c3                   	ret    

00000dae <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     dae:	55                   	push   %ebp
     daf:	89 e5                	mov    %esp,%ebp
     db1:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     db4:	83 ec 0c             	sub    $0xc,%esp
     db7:	6a 0c                	push   $0xc
     db9:	e8 d7 fa ff ff       	call   895 <malloc>
     dbe:	83 c4 10             	add    $0x10,%esp
     dc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     dc4:	83 ec 04             	sub    $0x4,%esp
     dc7:	6a 0c                	push   $0xc
     dc9:	6a 00                	push   $0x0
     dcb:	ff 75 f4             	pushl  -0xc(%ebp)
     dce:	e8 79 f3 ff ff       	call   14c <memset>
     dd3:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     dd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dd9:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     ddf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     de2:	8b 55 08             	mov    0x8(%ebp),%edx
     de5:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     de8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     deb:	8b 55 0c             	mov    0xc(%ebp),%edx
     dee:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     df1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     df4:	c9                   	leave  
     df5:	c3                   	ret    

00000df6 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     df6:	55                   	push   %ebp
     df7:	89 e5                	mov    %esp,%ebp
     df9:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     dfc:	83 ec 0c             	sub    $0xc,%esp
     dff:	6a 0c                	push   $0xc
     e01:	e8 8f fa ff ff       	call   895 <malloc>
     e06:	83 c4 10             	add    $0x10,%esp
     e09:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e0c:	83 ec 04             	sub    $0x4,%esp
     e0f:	6a 0c                	push   $0xc
     e11:	6a 00                	push   $0x0
     e13:	ff 75 f4             	pushl  -0xc(%ebp)
     e16:	e8 31 f3 ff ff       	call   14c <memset>
     e1b:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     e1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e21:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     e27:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e2a:	8b 55 08             	mov    0x8(%ebp),%edx
     e2d:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e33:	8b 55 0c             	mov    0xc(%ebp),%edx
     e36:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     e39:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e3c:	c9                   	leave  
     e3d:	c3                   	ret    

00000e3e <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     e3e:	55                   	push   %ebp
     e3f:	89 e5                	mov    %esp,%ebp
     e41:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e44:	83 ec 0c             	sub    $0xc,%esp
     e47:	6a 08                	push   $0x8
     e49:	e8 47 fa ff ff       	call   895 <malloc>
     e4e:	83 c4 10             	add    $0x10,%esp
     e51:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e54:	83 ec 04             	sub    $0x4,%esp
     e57:	6a 08                	push   $0x8
     e59:	6a 00                	push   $0x0
     e5b:	ff 75 f4             	pushl  -0xc(%ebp)
     e5e:	e8 e9 f2 ff ff       	call   14c <memset>
     e63:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
     e66:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e69:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     e6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e72:	8b 55 08             	mov    0x8(%ebp),%edx
     e75:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     e78:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e7b:	c9                   	leave  
     e7c:	c3                   	ret    

00000e7d <calcmd>:

struct cmd* calcmd(char *_line)
{
     e7d:	55                   	push   %ebp
     e7e:	89 e5                	mov    %esp,%ebp
     e80:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e83:	83 ec 0c             	sub    $0xc,%esp
     e86:	6a 08                	push   $0x8
     e88:	e8 08 fa ff ff       	call   895 <malloc>
     e8d:	83 c4 10             	add    $0x10,%esp
     e90:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e93:	83 ec 04             	sub    $0x4,%esp
     e96:	6a 08                	push   $0x8
     e98:	6a 00                	push   $0x0
     e9a:	ff 75 f4             	pushl  -0xc(%ebp)
     e9d:	e8 aa f2 ff ff       	call   14c <memset>
     ea2:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
     ea5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ea8:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
     eae:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eb1:	8b 55 08             	mov    0x8(%ebp),%edx
     eb4:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     eb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     eba:	c9                   	leave  
     ebb:	c3                   	ret    

00000ebc <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
     ebc:	55                   	push   %ebp
     ebd:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
     ebf:	eb 0c                	jmp    ecd <mystrncmp+0x11>
    n--, p++, q++;
     ec1:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     ec5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     ec9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
     ecd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     ed1:	74 1a                	je     eed <mystrncmp+0x31>
     ed3:	8b 45 08             	mov    0x8(%ebp),%eax
     ed6:	0f b6 00             	movzbl (%eax),%eax
     ed9:	84 c0                	test   %al,%al
     edb:	74 10                	je     eed <mystrncmp+0x31>
     edd:	8b 45 08             	mov    0x8(%ebp),%eax
     ee0:	0f b6 10             	movzbl (%eax),%edx
     ee3:	8b 45 0c             	mov    0xc(%ebp),%eax
     ee6:	0f b6 00             	movzbl (%eax),%eax
     ee9:	38 c2                	cmp    %al,%dl
     eeb:	74 d4                	je     ec1 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
     eed:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     ef1:	75 07                	jne    efa <mystrncmp+0x3e>
    return 0;
     ef3:	b8 00 00 00 00       	mov    $0x0,%eax
     ef8:	eb 16                	jmp    f10 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
     efa:	8b 45 08             	mov    0x8(%ebp),%eax
     efd:	0f b6 00             	movzbl (%eax),%eax
     f00:	0f b6 d0             	movzbl %al,%edx
     f03:	8b 45 0c             	mov    0xc(%ebp),%eax
     f06:	0f b6 00             	movzbl (%eax),%eax
     f09:	0f b6 c0             	movzbl %al,%eax
     f0c:	29 c2                	sub    %eax,%edx
     f0e:	89 d0                	mov    %edx,%eax
}
     f10:	5d                   	pop    %ebp
     f11:	c3                   	ret    

00000f12 <mystrlen>:

static int mystrlen(const char *s)
{
     f12:	55                   	push   %ebp
     f13:	89 e5                	mov    %esp,%ebp
     f15:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
     f18:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     f1f:	eb 04                	jmp    f25 <mystrlen+0x13>
     f21:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     f25:	8b 55 fc             	mov    -0x4(%ebp),%edx
     f28:	8b 45 08             	mov    0x8(%ebp),%eax
     f2b:	01 d0                	add    %edx,%eax
     f2d:	0f b6 00             	movzbl (%eax),%eax
     f30:	84 c0                	test   %al,%al
     f32:	75 ed                	jne    f21 <mystrlen+0xf>
    ;
  return n;
     f34:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f37:	c9                   	leave  
     f38:	c3                   	ret    

00000f39 <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
     f39:	55                   	push   %ebp
     f3a:	89 e5                	mov    %esp,%ebp
     f3c:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
     f3f:	8b 45 08             	mov    0x8(%ebp),%eax
     f42:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
     f45:	90                   	nop
     f46:	8b 45 10             	mov    0x10(%ebp),%eax
     f49:	8d 50 ff             	lea    -0x1(%eax),%edx
     f4c:	89 55 10             	mov    %edx,0x10(%ebp)
     f4f:	85 c0                	test   %eax,%eax
     f51:	7e 2c                	jle    f7f <mystrncpy+0x46>
     f53:	8b 45 08             	mov    0x8(%ebp),%eax
     f56:	8d 50 01             	lea    0x1(%eax),%edx
     f59:	89 55 08             	mov    %edx,0x8(%ebp)
     f5c:	8b 55 0c             	mov    0xc(%ebp),%edx
     f5f:	8d 4a 01             	lea    0x1(%edx),%ecx
     f62:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     f65:	0f b6 12             	movzbl (%edx),%edx
     f68:	88 10                	mov    %dl,(%eax)
     f6a:	0f b6 00             	movzbl (%eax),%eax
     f6d:	84 c0                	test   %al,%al
     f6f:	75 d5                	jne    f46 <mystrncpy+0xd>
    ;
  while(n-- > 0)
     f71:	eb 0c                	jmp    f7f <mystrncpy+0x46>
    *s++ = 0;
     f73:	8b 45 08             	mov    0x8(%ebp),%eax
     f76:	8d 50 01             	lea    0x1(%eax),%edx
     f79:	89 55 08             	mov    %edx,0x8(%ebp)
     f7c:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
     f7f:	8b 45 10             	mov    0x10(%ebp),%eax
     f82:	8d 50 ff             	lea    -0x1(%eax),%edx
     f85:	89 55 10             	mov    %edx,0x10(%ebp)
     f88:	85 c0                	test   %eax,%eax
     f8a:	7f e7                	jg     f73 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
     f8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f8f:	c9                   	leave  
     f90:	c3                   	ret    

00000f91 <isEqual>:

int isEqual(double a, double b)
{
     f91:	55                   	push   %ebp
     f92:	89 e5                	mov    %esp,%ebp
     f94:	83 ec 10             	sub    $0x10,%esp
     f97:	8b 45 08             	mov    0x8(%ebp),%eax
     f9a:	89 45 f8             	mov    %eax,-0x8(%ebp)
     f9d:	8b 45 0c             	mov    0xc(%ebp),%eax
     fa0:	89 45 fc             	mov    %eax,-0x4(%ebp)
     fa3:	8b 45 10             	mov    0x10(%ebp),%eax
     fa6:	89 45 f0             	mov    %eax,-0x10(%ebp)
     fa9:	8b 45 14             	mov    0x14(%ebp),%eax
     fac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
     faf:	dd 45 f8             	fldl   -0x8(%ebp)
     fb2:	dc 65 f0             	fsubl  -0x10(%ebp)
     fb5:	dd 05 c0 38 00 00    	fldl   0x38c0
     fbb:	df e9                	fucomip %st(1),%st
     fbd:	dd d8                	fstp   %st(0)
     fbf:	76 19                	jbe    fda <isEqual+0x49>
     fc1:	dd 45 f0             	fldl   -0x10(%ebp)
     fc4:	dc 65 f8             	fsubl  -0x8(%ebp)
     fc7:	dd 05 c0 38 00 00    	fldl   0x38c0
     fcd:	df e9                	fucomip %st(1),%st
     fcf:	dd d8                	fstp   %st(0)
     fd1:	76 07                	jbe    fda <isEqual+0x49>
    return 1;
     fd3:	b8 01 00 00 00       	mov    $0x1,%eax
     fd8:	eb 05                	jmp    fdf <isEqual+0x4e>
  return 0;
     fda:	b8 00 00 00 00       	mov    $0x0,%eax
}
     fdf:	c9                   	leave  
     fe0:	c3                   	ret    

00000fe1 <isCmdName>:

int isCmdName(const char* str)
{
     fe1:	55                   	push   %ebp
     fe2:	89 e5                	mov    %esp,%ebp
     fe4:	53                   	push   %ebx
     fe5:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
     fe8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     fef:	eb 71                	jmp    1062 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
     ff1:	8b 55 f4             	mov    -0xc(%ebp),%edx
     ff4:	89 d0                	mov    %edx,%eax
     ff6:	c1 e0 02             	shl    $0x2,%eax
     ff9:	01 d0                	add    %edx,%eax
     ffb:	01 c0                	add    %eax,%eax
     ffd:	05 20 43 00 00       	add    $0x4320,%eax
    1002:	83 ec 0c             	sub    $0xc,%esp
    1005:	50                   	push   %eax
    1006:	e8 1a f1 ff ff       	call   125 <strlen>
    100b:	83 c4 10             	add    $0x10,%esp
    100e:	89 c3                	mov    %eax,%ebx
    1010:	83 ec 0c             	sub    $0xc,%esp
    1013:	ff 75 08             	pushl  0x8(%ebp)
    1016:	e8 f7 fe ff ff       	call   f12 <mystrlen>
    101b:	83 c4 10             	add    $0x10,%esp
    101e:	39 c3                	cmp    %eax,%ebx
    1020:	75 3c                	jne    105e <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    1022:	83 ec 0c             	sub    $0xc,%esp
    1025:	ff 75 08             	pushl  0x8(%ebp)
    1028:	e8 e5 fe ff ff       	call   f12 <mystrlen>
    102d:	83 c4 10             	add    $0x10,%esp
    1030:	89 c1                	mov    %eax,%ecx
    1032:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1035:	89 d0                	mov    %edx,%eax
    1037:	c1 e0 02             	shl    $0x2,%eax
    103a:	01 d0                	add    %edx,%eax
    103c:	01 c0                	add    %eax,%eax
    103e:	05 20 43 00 00       	add    $0x4320,%eax
    1043:	83 ec 04             	sub    $0x4,%esp
    1046:	51                   	push   %ecx
    1047:	ff 75 08             	pushl  0x8(%ebp)
    104a:	50                   	push   %eax
    104b:	e8 6c fe ff ff       	call   ebc <mystrncmp>
    1050:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1053:	85 c0                	test   %eax,%eax
    1055:	75 07                	jne    105e <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    1057:	b8 01 00 00 00       	mov    $0x1,%eax
    105c:	eb 0f                	jmp    106d <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    105e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1062:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1066:	7e 89                	jle    ff1 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    1068:	b8 00 00 00 00       	mov    $0x0,%eax
}
    106d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1070:	c9                   	leave  
    1071:	c3                   	ret    

00001072 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    1072:	55                   	push   %ebp
    1073:	89 e5                	mov    %esp,%ebp
    1075:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    107b:	83 ec 08             	sub    $0x8,%esp
    107e:	6a 00                	push   $0x0
    1080:	68 e8 43 00 00       	push   $0x43e8
    1085:	e8 9d f2 ff ff       	call   327 <open>
    108a:	83 c4 10             	add    $0x10,%esp
    108d:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1090:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1094:	79 0a                	jns    10a0 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    1096:	b8 00 00 00 00       	mov    $0x0,%eax
    109b:	e9 9a 01 00 00       	jmp    123a <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    10a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    10a7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    10ae:	e9 ee 00 00 00       	jmp    11a1 <findAlias+0x12f>
  {
      int isSame = 1;
    10b3:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    10ba:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    10c1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    10c8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    10cf:	83 ec 0c             	sub    $0xc,%esp
    10d2:	8d 45 9a             	lea    -0x66(%ebp),%eax
    10d5:	50                   	push   %eax
    10d6:	e8 4a f0 ff ff       	call   125 <strlen>
    10db:	83 c4 10             	add    $0x10,%esp
    10de:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    10e1:	83 ec 0c             	sub    $0xc,%esp
    10e4:	ff 75 08             	pushl  0x8(%ebp)
    10e7:	e8 39 f0 ff ff       	call   125 <strlen>
    10ec:	83 c4 10             	add    $0x10,%esp
    10ef:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    10f2:	8d 55 9a             	lea    -0x66(%ebp),%edx
    10f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10f8:	01 d0                	add    %edx,%eax
    10fa:	0f b6 00             	movzbl (%eax),%eax
    10fd:	3c 21                	cmp    $0x21,%al
    10ff:	75 38                	jne    1139 <findAlias+0xc7>
      {
          startIndex++;
    1101:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    1105:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    110c:	eb 2b                	jmp    1139 <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    110e:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1111:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1114:	01 d0                	add    %edx,%eax
    1116:	0f b6 10             	movzbl (%eax),%edx
    1119:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    111c:	8b 45 08             	mov    0x8(%ebp),%eax
    111f:	01 c8                	add    %ecx,%eax
    1121:	0f b6 00             	movzbl (%eax),%eax
    1124:	38 c2                	cmp    %al,%dl
    1126:	74 09                	je     1131 <findAlias+0xbf>
          {
              isSame = 0;
    1128:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    112f:	eb 1f                	jmp    1150 <findAlias+0xde>
          }
          startIndex++;
    1131:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    1135:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    1139:	8d 55 9a             	lea    -0x66(%ebp),%edx
    113c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    113f:	01 d0                	add    %edx,%eax
    1141:	0f b6 00             	movzbl (%eax),%eax
    1144:	3c 3d                	cmp    $0x3d,%al
    1146:	74 08                	je     1150 <findAlias+0xde>
    1148:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    114b:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    114e:	7c be                	jl     110e <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    1150:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1153:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1156:	01 d0                	add    %edx,%eax
    1158:	0f b6 00             	movzbl (%eax),%eax
    115b:	3c 3d                	cmp    $0x3d,%al
    115d:	75 08                	jne    1167 <findAlias+0xf5>
    115f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1162:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1165:	7d 07                	jge    116e <findAlias+0xfc>
      {
          isSame = 0;
    1167:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    116e:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    1172:	75 0b                	jne    117f <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    1174:	b8 01 00 00 00       	mov    $0x1,%eax
    1179:	2b 45 f0             	sub    -0x10(%ebp),%eax
    117c:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    117f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1183:	75 1c                	jne    11a1 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    1185:	83 ec 08             	sub    $0x8,%esp
    1188:	8d 45 9a             	lea    -0x66(%ebp),%eax
    118b:	50                   	push   %eax
    118c:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1192:	50                   	push   %eax
    1193:	e8 1e ef ff ff       	call   b6 <strcpy>
    1198:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    119b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    119e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    11a1:	83 ec 04             	sub    $0x4,%esp
    11a4:	6a 32                	push   $0x32
    11a6:	8d 45 9a             	lea    -0x66(%ebp),%eax
    11a9:	50                   	push   %eax
    11aa:	ff 75 dc             	pushl  -0x24(%ebp)
    11ad:	e8 4d f1 ff ff       	call   2ff <read>
    11b2:	83 c4 10             	add    $0x10,%esp
    11b5:	89 45 d8             	mov    %eax,-0x28(%ebp)
    11b8:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    11bc:	0f 8f f1 fe ff ff    	jg     10b3 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    11c2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11c6:	75 5f                	jne    1227 <findAlias+0x1b5>
  {
    int i = 0;
    11c8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    11cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    11d3:	eb 20                	jmp    11f5 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    11d5:	8b 55 e0             	mov    -0x20(%ebp),%edx
    11d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    11db:	01 c2                	add    %eax,%edx
    11dd:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    11e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11e6:	01 c8                	add    %ecx,%eax
    11e8:	0f b6 00             	movzbl (%eax),%eax
    11eb:	88 02                	mov    %al,(%edx)
      i++;
    11ed:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    11f1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    11f5:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    11fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11fe:	01 d0                	add    %edx,%eax
    1200:	0f b6 00             	movzbl (%eax),%eax
    1203:	84 c0                	test   %al,%al
    1205:	75 ce                	jne    11d5 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    1207:	8b 55 e0             	mov    -0x20(%ebp),%edx
    120a:	8b 45 0c             	mov    0xc(%ebp),%eax
    120d:	01 d0                	add    %edx,%eax
    120f:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    1212:	83 ec 0c             	sub    $0xc,%esp
    1215:	ff 75 dc             	pushl  -0x24(%ebp)
    1218:	e8 f2 f0 ff ff       	call   30f <close>
    121d:	83 c4 10             	add    $0x10,%esp
    return 1;
    1220:	b8 01 00 00 00       	mov    $0x1,%eax
    1225:	eb 13                	jmp    123a <findAlias+0x1c8>
  }
  close(fd);
    1227:	83 ec 0c             	sub    $0xc,%esp
    122a:	ff 75 dc             	pushl  -0x24(%ebp)
    122d:	e8 dd f0 ff ff       	call   30f <close>
    1232:	83 c4 10             	add    $0x10,%esp
  return 0;
    1235:	b8 00 00 00 00       	mov    $0x0,%eax
}
    123a:	c9                   	leave  
    123b:	c3                   	ret    

0000123c <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    123c:	55                   	push   %ebp
    123d:	89 e5                	mov    %esp,%ebp
    123f:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1242:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1246:	75 05                	jne    124d <runcmd+0x11>
    exit();
    1248:	e8 9a f0 ff ff       	call   2e7 <exit>
  
  switch(cmd->type){
    124d:	8b 45 08             	mov    0x8(%ebp),%eax
    1250:	8b 00                	mov    (%eax),%eax
    1252:	83 f8 05             	cmp    $0x5,%eax
    1255:	77 09                	ja     1260 <runcmd+0x24>
    1257:	8b 04 85 24 37 00 00 	mov    0x3724(,%eax,4),%eax
    125e:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    1260:	83 ec 0c             	sub    $0xc,%esp
    1263:	68 f8 36 00 00       	push   $0x36f8
    1268:	e8 0b f7 ff ff       	call   978 <panic1>
    126d:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    1270:	8b 45 08             	mov    0x8(%ebp),%eax
    1273:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    1276:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1279:	8b 40 04             	mov    0x4(%eax),%eax
    127c:	85 c0                	test   %eax,%eax
    127e:	75 05                	jne    1285 <runcmd+0x49>
      exit();
    1280:	e8 62 f0 ff ff       	call   2e7 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    1285:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1288:	8b 40 04             	mov    0x4(%eax),%eax
    128b:	83 ec 0c             	sub    $0xc,%esp
    128e:	50                   	push   %eax
    128f:	e8 4d fd ff ff       	call   fe1 <isCmdName>
    1294:	83 c4 10             	add    $0x10,%esp
    1297:	85 c0                	test   %eax,%eax
    1299:	75 37                	jne    12d2 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    129b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    129e:	8b 40 04             	mov    0x4(%eax),%eax
    12a1:	83 ec 08             	sub    $0x8,%esp
    12a4:	8d 55 ce             	lea    -0x32(%ebp),%edx
    12a7:	52                   	push   %edx
    12a8:	50                   	push   %eax
    12a9:	e8 c4 fd ff ff       	call   1072 <findAlias>
    12ae:	83 c4 10             	add    $0x10,%esp
    12b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    12b4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    12b8:	75 31                	jne    12eb <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    12ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12bd:	83 c0 04             	add    $0x4,%eax
    12c0:	83 ec 08             	sub    $0x8,%esp
    12c3:	50                   	push   %eax
    12c4:	8d 45 ce             	lea    -0x32(%ebp),%eax
    12c7:	50                   	push   %eax
    12c8:	e8 52 f0 ff ff       	call   31f <exec>
    12cd:	83 c4 10             	add    $0x10,%esp
    12d0:	eb 19                	jmp    12eb <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    12d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12d5:	8d 50 04             	lea    0x4(%eax),%edx
    12d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12db:	8b 40 04             	mov    0x4(%eax),%eax
    12de:	83 ec 08             	sub    $0x8,%esp
    12e1:	52                   	push   %edx
    12e2:	50                   	push   %eax
    12e3:	e8 37 f0 ff ff       	call   31f <exec>
    12e8:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    12eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12ee:	8b 40 04             	mov    0x4(%eax),%eax
    12f1:	83 ec 04             	sub    $0x4,%esp
    12f4:	50                   	push   %eax
    12f5:	68 ff 36 00 00       	push   $0x36ff
    12fa:	6a 02                	push   $0x2
    12fc:	e8 92 f2 ff ff       	call   593 <printf>
    1301:	83 c4 10             	add    $0x10,%esp
    break;
    1304:	e9 c6 01 00 00       	jmp    14cf <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    1309:	8b 45 08             	mov    0x8(%ebp),%eax
    130c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    130f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1312:	8b 40 14             	mov    0x14(%eax),%eax
    1315:	83 ec 0c             	sub    $0xc,%esp
    1318:	50                   	push   %eax
    1319:	e8 f1 ef ff ff       	call   30f <close>
    131e:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    1321:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1324:	8b 50 10             	mov    0x10(%eax),%edx
    1327:	8b 45 ec             	mov    -0x14(%ebp),%eax
    132a:	8b 40 08             	mov    0x8(%eax),%eax
    132d:	83 ec 08             	sub    $0x8,%esp
    1330:	52                   	push   %edx
    1331:	50                   	push   %eax
    1332:	e8 f0 ef ff ff       	call   327 <open>
    1337:	83 c4 10             	add    $0x10,%esp
    133a:	85 c0                	test   %eax,%eax
    133c:	79 1e                	jns    135c <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    133e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1341:	8b 40 08             	mov    0x8(%eax),%eax
    1344:	83 ec 04             	sub    $0x4,%esp
    1347:	50                   	push   %eax
    1348:	68 0f 37 00 00       	push   $0x370f
    134d:	6a 02                	push   $0x2
    134f:	e8 3f f2 ff ff       	call   593 <printf>
    1354:	83 c4 10             	add    $0x10,%esp
      exit();
    1357:	e8 8b ef ff ff       	call   2e7 <exit>
    }
    runcmd(rcmd->cmd);
    135c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    135f:	8b 40 04             	mov    0x4(%eax),%eax
    1362:	83 ec 0c             	sub    $0xc,%esp
    1365:	50                   	push   %eax
    1366:	e8 d1 fe ff ff       	call   123c <runcmd>
    136b:	83 c4 10             	add    $0x10,%esp
    break;
    136e:	e9 5c 01 00 00       	jmp    14cf <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    1373:	8b 45 08             	mov    0x8(%ebp),%eax
    1376:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    1379:	e8 84 f9 ff ff       	call   d02 <fork1>
    137e:	85 c0                	test   %eax,%eax
    1380:	75 12                	jne    1394 <runcmd+0x158>
      runcmd(lcmd->left);
    1382:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1385:	8b 40 04             	mov    0x4(%eax),%eax
    1388:	83 ec 0c             	sub    $0xc,%esp
    138b:	50                   	push   %eax
    138c:	e8 ab fe ff ff       	call   123c <runcmd>
    1391:	83 c4 10             	add    $0x10,%esp
    wait();
    1394:	e8 56 ef ff ff       	call   2ef <wait>
    runcmd(lcmd->right);
    1399:	8b 45 e8             	mov    -0x18(%ebp),%eax
    139c:	8b 40 08             	mov    0x8(%eax),%eax
    139f:	83 ec 0c             	sub    $0xc,%esp
    13a2:	50                   	push   %eax
    13a3:	e8 94 fe ff ff       	call   123c <runcmd>
    13a8:	83 c4 10             	add    $0x10,%esp
    break;
    13ab:	e9 1f 01 00 00       	jmp    14cf <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    13b0:	8b 45 08             	mov    0x8(%ebp),%eax
    13b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    13b6:	83 ec 0c             	sub    $0xc,%esp
    13b9:	8d 45 d8             	lea    -0x28(%ebp),%eax
    13bc:	50                   	push   %eax
    13bd:	e8 35 ef ff ff       	call   2f7 <pipe>
    13c2:	83 c4 10             	add    $0x10,%esp
    13c5:	85 c0                	test   %eax,%eax
    13c7:	79 10                	jns    13d9 <runcmd+0x19d>
      panic1("pipe");
    13c9:	83 ec 0c             	sub    $0xc,%esp
    13cc:	68 1f 37 00 00       	push   $0x371f
    13d1:	e8 a2 f5 ff ff       	call   978 <panic1>
    13d6:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    13d9:	e8 24 f9 ff ff       	call   d02 <fork1>
    13de:	85 c0                	test   %eax,%eax
    13e0:	75 4c                	jne    142e <runcmd+0x1f2>
      close(1);
    13e2:	83 ec 0c             	sub    $0xc,%esp
    13e5:	6a 01                	push   $0x1
    13e7:	e8 23 ef ff ff       	call   30f <close>
    13ec:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    13ef:	8b 45 dc             	mov    -0x24(%ebp),%eax
    13f2:	83 ec 0c             	sub    $0xc,%esp
    13f5:	50                   	push   %eax
    13f6:	e8 64 ef ff ff       	call   35f <dup>
    13fb:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    13fe:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1401:	83 ec 0c             	sub    $0xc,%esp
    1404:	50                   	push   %eax
    1405:	e8 05 ef ff ff       	call   30f <close>
    140a:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    140d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1410:	83 ec 0c             	sub    $0xc,%esp
    1413:	50                   	push   %eax
    1414:	e8 f6 ee ff ff       	call   30f <close>
    1419:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    141c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    141f:	8b 40 04             	mov    0x4(%eax),%eax
    1422:	83 ec 0c             	sub    $0xc,%esp
    1425:	50                   	push   %eax
    1426:	e8 11 fe ff ff       	call   123c <runcmd>
    142b:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    142e:	e8 cf f8 ff ff       	call   d02 <fork1>
    1433:	85 c0                	test   %eax,%eax
    1435:	75 4c                	jne    1483 <runcmd+0x247>
      close(0);
    1437:	83 ec 0c             	sub    $0xc,%esp
    143a:	6a 00                	push   $0x0
    143c:	e8 ce ee ff ff       	call   30f <close>
    1441:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    1444:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1447:	83 ec 0c             	sub    $0xc,%esp
    144a:	50                   	push   %eax
    144b:	e8 0f ef ff ff       	call   35f <dup>
    1450:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1453:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1456:	83 ec 0c             	sub    $0xc,%esp
    1459:	50                   	push   %eax
    145a:	e8 b0 ee ff ff       	call   30f <close>
    145f:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    1462:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1465:	83 ec 0c             	sub    $0xc,%esp
    1468:	50                   	push   %eax
    1469:	e8 a1 ee ff ff       	call   30f <close>
    146e:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    1471:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1474:	8b 40 08             	mov    0x8(%eax),%eax
    1477:	83 ec 0c             	sub    $0xc,%esp
    147a:	50                   	push   %eax
    147b:	e8 bc fd ff ff       	call   123c <runcmd>
    1480:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    1483:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1486:	83 ec 0c             	sub    $0xc,%esp
    1489:	50                   	push   %eax
    148a:	e8 80 ee ff ff       	call   30f <close>
    148f:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    1492:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1495:	83 ec 0c             	sub    $0xc,%esp
    1498:	50                   	push   %eax
    1499:	e8 71 ee ff ff       	call   30f <close>
    149e:	83 c4 10             	add    $0x10,%esp
    wait();
    14a1:	e8 49 ee ff ff       	call   2ef <wait>
    wait();
    14a6:	e8 44 ee ff ff       	call   2ef <wait>
    break;
    14ab:	eb 22                	jmp    14cf <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    14ad:	8b 45 08             	mov    0x8(%ebp),%eax
    14b0:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    14b3:	e8 4a f8 ff ff       	call   d02 <fork1>
    14b8:	85 c0                	test   %eax,%eax
    14ba:	75 12                	jne    14ce <runcmd+0x292>
      runcmd(bcmd->cmd);
    14bc:	8b 45 e0             	mov    -0x20(%ebp),%eax
    14bf:	8b 40 04             	mov    0x4(%eax),%eax
    14c2:	83 ec 0c             	sub    $0xc,%esp
    14c5:	50                   	push   %eax
    14c6:	e8 71 fd ff ff       	call   123c <runcmd>
    14cb:	83 c4 10             	add    $0x10,%esp
    break;
    14ce:	90                   	nop
  }
  exit();
    14cf:	e8 13 ee ff ff       	call   2e7 <exit>

000014d4 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    14d4:	55                   	push   %ebp
    14d5:	89 e5                	mov    %esp,%ebp
    14d7:	83 ec 04             	sub    $0x4,%esp
    14da:	8b 45 08             	mov    0x8(%ebp),%eax
    14dd:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    14e0:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    14e4:	7e 0d                	jle    14f3 <isNameChar+0x1f>
    14e6:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    14ea:	7f 07                	jg     14f3 <isNameChar+0x1f>
    return 1;
    14ec:	b8 01 00 00 00       	mov    $0x1,%eax
    14f1:	eb 38                	jmp    152b <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    14f3:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    14f7:	7e 0d                	jle    1506 <isNameChar+0x32>
    14f9:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    14fd:	7f 07                	jg     1506 <isNameChar+0x32>
    return 1;
    14ff:	b8 01 00 00 00       	mov    $0x1,%eax
    1504:	eb 25                	jmp    152b <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    1506:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    150a:	7e 0d                	jle    1519 <isNameChar+0x45>
    150c:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    1510:	7f 07                	jg     1519 <isNameChar+0x45>
    return 1;
    1512:	b8 01 00 00 00       	mov    $0x1,%eax
    1517:	eb 12                	jmp    152b <isNameChar+0x57>
  if(ch == '_')
    1519:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    151d:	75 07                	jne    1526 <isNameChar+0x52>
    return 1;
    151f:	b8 01 00 00 00       	mov    $0x1,%eax
    1524:	eb 05                	jmp    152b <isNameChar+0x57>
  return 0;
    1526:	b8 00 00 00 00       	mov    $0x0,%eax
}
    152b:	c9                   	leave  
    152c:	c3                   	ret    

0000152d <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    152d:	55                   	push   %ebp
    152e:	89 e5                	mov    %esp,%ebp
    1530:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    1533:	8b 45 08             	mov    0x8(%ebp),%eax
    1536:	8b 40 04             	mov    0x4(%eax),%eax
    1539:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    153c:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    1543:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    154a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1551:	eb 1d                	jmp    1570 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    1553:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1556:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1559:	01 d0                	add    %edx,%eax
    155b:	0f b6 00             	movzbl (%eax),%eax
    155e:	3c 3d                	cmp    $0x3d,%al
    1560:	75 0a                	jne    156c <runCalcmd+0x3f>
    {
      hasEqu++;
    1562:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    1566:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1569:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    156c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1570:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1573:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1576:	01 d0                	add    %edx,%eax
    1578:	0f b6 00             	movzbl (%eax),%eax
    157b:	84 c0                	test   %al,%al
    157d:	75 d4                	jne    1553 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    157f:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1583:	7e 1d                	jle    15a2 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    1585:	83 ec 0c             	sub    $0xc,%esp
    1588:	68 3c 37 00 00       	push   $0x373c
    158d:	6a 00                	push   $0x0
    158f:	6a 00                	push   $0x0
    1591:	6a 01                	push   $0x1
    1593:	6a 04                	push   $0x4
    1595:	e8 21 17 00 00       	call   2cbb <color_printf>
    159a:	83 c4 20             	add    $0x20,%esp
    159d:	e9 78 05 00 00       	jmp    1b1a <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    15a2:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    15a6:	0f 85 26 05 00 00    	jne    1ad2 <runCalcmd+0x5a5>
  {
    int i=0;
    15ac:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    15b3:	eb 04                	jmp    15b9 <runCalcmd+0x8c>
    {
      i++;
    15b5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    15b9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    15bc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15bf:	01 d0                	add    %edx,%eax
    15c1:	0f b6 00             	movzbl (%eax),%eax
    15c4:	3c 20                	cmp    $0x20,%al
    15c6:	74 ed                	je     15b5 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    15c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15cb:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    15ce:	eb 23                	jmp    15f3 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    15d0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    15d3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15d6:	01 d0                	add    %edx,%eax
    15d8:	0f b6 00             	movzbl (%eax),%eax
    15db:	0f be c0             	movsbl %al,%eax
    15de:	83 ec 0c             	sub    $0xc,%esp
    15e1:	50                   	push   %eax
    15e2:	e8 ed fe ff ff       	call   14d4 <isNameChar>
    15e7:	83 c4 10             	add    $0x10,%esp
    15ea:	83 f8 01             	cmp    $0x1,%eax
    15ed:	75 0e                	jne    15fd <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    15ef:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    15f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15f6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    15f9:	7c d5                	jl     15d0 <runCalcmd+0xa3>
    15fb:	eb 01                	jmp    15fe <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    15fd:	90                   	nop
    }
    int len = i-startIndex;
    15fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1601:	2b 45 d0             	sub    -0x30(%ebp),%eax
    1604:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    1607:	eb 04                	jmp    160d <runCalcmd+0xe0>
    {
      i++;
    1609:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    160d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1610:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1613:	01 d0                	add    %edx,%eax
    1615:	0f b6 00             	movzbl (%eax),%eax
    1618:	3c 20                	cmp    $0x20,%al
    161a:	74 ed                	je     1609 <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    161c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    161f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1622:	0f 85 90 04 00 00    	jne    1ab8 <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    1628:	8b 55 d0             	mov    -0x30(%ebp),%edx
    162b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    162e:	01 d0                	add    %edx,%eax
    1630:	0f b6 00             	movzbl (%eax),%eax
    1633:	3c 2f                	cmp    $0x2f,%al
    1635:	7e 2c                	jle    1663 <runCalcmd+0x136>
    1637:	8b 55 d0             	mov    -0x30(%ebp),%edx
    163a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    163d:	01 d0                	add    %edx,%eax
    163f:	0f b6 00             	movzbl (%eax),%eax
    1642:	3c 39                	cmp    $0x39,%al
    1644:	7f 1d                	jg     1663 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    1646:	83 ec 0c             	sub    $0xc,%esp
    1649:	68 58 37 00 00       	push   $0x3758
    164e:	6a 00                	push   $0x0
    1650:	6a 00                	push   $0x0
    1652:	6a 01                	push   $0x1
    1654:	6a 04                	push   $0x4
    1656:	e8 60 16 00 00       	call   2cbb <color_printf>
    165b:	83 c4 20             	add    $0x20,%esp
    165e:	e9 b7 04 00 00       	jmp    1b1a <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1663:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    166a:	eb 20                	jmp    168c <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    166c:	8b 55 d0             	mov    -0x30(%ebp),%edx
    166f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1672:	01 d0                	add    %edx,%eax
    1674:	89 c2                	mov    %eax,%edx
    1676:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1679:	01 d0                	add    %edx,%eax
    167b:	0f b6 00             	movzbl (%eax),%eax
    167e:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1681:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1684:	01 ca                	add    %ecx,%edx
    1686:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1688:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    168c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    168f:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1692:	7c d8                	jl     166c <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1694:	8d 55 94             	lea    -0x6c(%ebp),%edx
    1697:	8b 45 cc             	mov    -0x34(%ebp),%eax
    169a:	01 d0                	add    %edx,%eax
    169c:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    169f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16a2:	83 c0 01             	add    $0x1,%eax
    16a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    16a8:	eb 04                	jmp    16ae <runCalcmd+0x181>
        {
          i++;
    16aa:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    16ae:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16b1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16b4:	01 d0                	add    %edx,%eax
    16b6:	0f b6 00             	movzbl (%eax),%eax
    16b9:	3c 20                	cmp    $0x20,%al
    16bb:	74 ed                	je     16aa <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    16bd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16c3:	01 d0                	add    %edx,%eax
    16c5:	0f b6 00             	movzbl (%eax),%eax
    16c8:	3c 60                	cmp    $0x60,%al
    16ca:	0f 85 e6 01 00 00    	jne    18b6 <runCalcmd+0x389>
        {
          i++;
    16d0:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    16d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    16d7:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    16da:	eb 04                	jmp    16e0 <runCalcmd+0x1b3>
          {
            i++;
    16dc:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    16e0:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16e6:	01 d0                	add    %edx,%eax
    16e8:	0f b6 00             	movzbl (%eax),%eax
    16eb:	3c 60                	cmp    $0x60,%al
    16ed:	74 0f                	je     16fe <runCalcmd+0x1d1>
    16ef:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16f5:	01 d0                	add    %edx,%eax
    16f7:	0f b6 00             	movzbl (%eax),%eax
    16fa:	84 c0                	test   %al,%al
    16fc:	75 de                	jne    16dc <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    16fe:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1701:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1704:	01 d0                	add    %edx,%eax
    1706:	0f b6 00             	movzbl (%eax),%eax
    1709:	3c 60                	cmp    $0x60,%al
    170b:	0f 85 5c 01 00 00    	jne    186d <runCalcmd+0x340>
    1711:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1714:	8d 50 01             	lea    0x1(%eax),%edx
    1717:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    171a:	01 d0                	add    %edx,%eax
    171c:	0f b6 00             	movzbl (%eax),%eax
    171f:	84 c0                	test   %al,%al
    1721:	0f 85 46 01 00 00    	jne    186d <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    1727:	8b 55 e0             	mov    -0x20(%ebp),%edx
    172a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    172d:	01 d0                	add    %edx,%eax
    172f:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    1732:	8b 55 c8             	mov    -0x38(%ebp),%edx
    1735:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1738:	01 d0                	add    %edx,%eax
    173a:	83 ec 0c             	sub    $0xc,%esp
    173d:	50                   	push   %eax
    173e:	e8 c5 04 00 00       	call   1c08 <Compute>
    1743:	83 c4 10             	add    $0x10,%esp
    1746:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    1749:	dd 05 c8 38 00 00    	fldl   0x38c8
    174f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1753:	dd 1c 24             	fstpl  (%esp)
    1756:	ff 75 c4             	pushl  -0x3c(%ebp)
    1759:	ff 75 c0             	pushl  -0x40(%ebp)
    175c:	e8 30 f8 ff ff       	call   f91 <isEqual>
    1761:	83 c4 10             	add    $0x10,%esp
    1764:	85 c0                	test   %eax,%eax
    1766:	0f 85 ad 03 00 00    	jne    1b19 <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    176c:	a1 2c 44 00 00       	mov    0x442c,%eax
    1771:	85 c0                	test   %eax,%eax
    1773:	75 15                	jne    178a <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1775:	83 ec 08             	sub    $0x8,%esp
    1778:	68 2c 44 00 00       	push   $0x442c
    177d:	68 60 44 00 00       	push   $0x4460
    1782:	e8 ba 19 00 00       	call   3141 <readVariables>
    1787:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    178a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1791:	eb 26                	jmp    17b9 <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1793:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1796:	c1 e0 05             	shl    $0x5,%eax
    1799:	05 60 44 00 00       	add    $0x4460,%eax
    179e:	8d 50 04             	lea    0x4(%eax),%edx
    17a1:	83 ec 08             	sub    $0x8,%esp
    17a4:	8d 45 94             	lea    -0x6c(%ebp),%eax
    17a7:	50                   	push   %eax
    17a8:	52                   	push   %edx
    17a9:	e8 38 e9 ff ff       	call   e6 <strcmp>
    17ae:	83 c4 10             	add    $0x10,%esp
    17b1:	85 c0                	test   %eax,%eax
    17b3:	74 10                	je     17c5 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    17b5:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    17b9:	a1 2c 44 00 00       	mov    0x442c,%eax
    17be:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    17c1:	7c d0                	jl     1793 <runCalcmd+0x266>
    17c3:	eb 01                	jmp    17c6 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    17c5:	90                   	nop
              }
              if(index == v_num) //new variable
    17c6:	a1 2c 44 00 00       	mov    0x442c,%eax
    17cb:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    17ce:	75 3c                	jne    180c <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    17d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17d3:	c1 e0 05             	shl    $0x5,%eax
    17d6:	05 60 44 00 00       	add    $0x4460,%eax
    17db:	8d 50 04             	lea    0x4(%eax),%edx
    17de:	83 ec 08             	sub    $0x8,%esp
    17e1:	8d 45 94             	lea    -0x6c(%ebp),%eax
    17e4:	50                   	push   %eax
    17e5:	52                   	push   %edx
    17e6:	e8 cb e8 ff ff       	call   b6 <strcpy>
    17eb:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    17ee:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17f1:	c1 e0 05             	shl    $0x5,%eax
    17f4:	05 60 44 00 00       	add    $0x4460,%eax
    17f9:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    17ff:	a1 2c 44 00 00       	mov    0x442c,%eax
    1804:	83 c0 01             	add    $0x1,%eax
    1807:	a3 2c 44 00 00       	mov    %eax,0x442c
              }
              variables[index].value.dvalue = result;
    180c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    180f:	c1 e0 05             	shl    $0x5,%eax
    1812:	05 70 44 00 00       	add    $0x4470,%eax
    1817:	dd 45 c0             	fldl   -0x40(%ebp)
    181a:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    181d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1820:	c1 e0 05             	shl    $0x5,%eax
    1823:	05 70 44 00 00       	add    $0x4470,%eax
    1828:	dd 40 08             	fldl   0x8(%eax)
    182b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    182e:	c1 e0 05             	shl    $0x5,%eax
    1831:	05 60 44 00 00       	add    $0x4460,%eax
    1836:	83 c0 04             	add    $0x4,%eax
    1839:	83 ec 0c             	sub    $0xc,%esp
    183c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1840:	dd 1c 24             	fstpl  (%esp)
    1843:	50                   	push   %eax
    1844:	68 82 37 00 00       	push   $0x3782
    1849:	6a 01                	push   $0x1
    184b:	e8 43 ed ff ff       	call   593 <printf>
    1850:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1853:	83 ec 08             	sub    $0x8,%esp
    1856:	68 2c 44 00 00       	push   $0x442c
    185b:	68 60 44 00 00       	push   $0x4460
    1860:	e8 90 1b 00 00       	call   33f5 <writeVariables>
    1865:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1868:	e9 ac 02 00 00       	jmp    1b19 <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    186d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1870:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1873:	01 d0                	add    %edx,%eax
    1875:	0f b6 00             	movzbl (%eax),%eax
    1878:	84 c0                	test   %al,%al
    187a:	75 1d                	jne    1899 <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    187c:	83 ec 0c             	sub    $0xc,%esp
    187f:	68 89 37 00 00       	push   $0x3789
    1884:	6a 00                	push   $0x0
    1886:	6a 00                	push   $0x0
    1888:	6a 01                	push   $0x1
    188a:	6a 04                	push   $0x4
    188c:	e8 2a 14 00 00       	call   2cbb <color_printf>
    1891:	83 c4 20             	add    $0x20,%esp
    1894:	e9 81 02 00 00       	jmp    1b1a <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    1899:	83 ec 0c             	sub    $0xc,%esp
    189c:	68 a0 37 00 00       	push   $0x37a0
    18a1:	6a 00                	push   $0x0
    18a3:	6a 00                	push   $0x0
    18a5:	6a 01                	push   $0x1
    18a7:	6a 04                	push   $0x4
    18a9:	e8 0d 14 00 00       	call   2cbb <color_printf>
    18ae:	83 c4 20             	add    $0x20,%esp
    18b1:	e9 64 02 00 00       	jmp    1b1a <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    18b6:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18b9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18bc:	01 d0                	add    %edx,%eax
    18be:	0f b6 00             	movzbl (%eax),%eax
    18c1:	3c 22                	cmp    $0x22,%al
    18c3:	0f 85 d5 01 00 00    	jne    1a9e <runCalcmd+0x571>
        {
          i++;
    18c9:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    18cd:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18d0:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    18d3:	eb 04                	jmp    18d9 <runCalcmd+0x3ac>
          {
            i++;
    18d5:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    18d9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18dc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18df:	01 d0                	add    %edx,%eax
    18e1:	0f b6 00             	movzbl (%eax),%eax
    18e4:	3c 22                	cmp    $0x22,%al
    18e6:	74 0f                	je     18f7 <runCalcmd+0x3ca>
    18e8:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18eb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18ee:	01 d0                	add    %edx,%eax
    18f0:	0f b6 00             	movzbl (%eax),%eax
    18f3:	84 c0                	test   %al,%al
    18f5:	75 de                	jne    18d5 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    18f7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18fa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18fd:	01 d0                	add    %edx,%eax
    18ff:	0f b6 00             	movzbl (%eax),%eax
    1902:	3c 22                	cmp    $0x22,%al
    1904:	0f 85 4e 01 00 00    	jne    1a58 <runCalcmd+0x52b>
    190a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    190d:	8d 50 01             	lea    0x1(%eax),%edx
    1910:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1913:	01 d0                	add    %edx,%eax
    1915:	0f b6 00             	movzbl (%eax),%eax
    1918:	84 c0                	test   %al,%al
    191a:	0f 85 38 01 00 00    	jne    1a58 <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1920:	a1 2c 44 00 00       	mov    0x442c,%eax
    1925:	85 c0                	test   %eax,%eax
    1927:	75 15                	jne    193e <runCalcmd+0x411>
              readVariables(variables,&v_num);
    1929:	83 ec 08             	sub    $0x8,%esp
    192c:	68 2c 44 00 00       	push   $0x442c
    1931:	68 60 44 00 00       	push   $0x4460
    1936:	e8 06 18 00 00       	call   3141 <readVariables>
    193b:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    193e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1945:	eb 26                	jmp    196d <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    1947:	8b 45 d8             	mov    -0x28(%ebp),%eax
    194a:	c1 e0 05             	shl    $0x5,%eax
    194d:	05 60 44 00 00       	add    $0x4460,%eax
    1952:	8d 50 04             	lea    0x4(%eax),%edx
    1955:	83 ec 08             	sub    $0x8,%esp
    1958:	8d 45 94             	lea    -0x6c(%ebp),%eax
    195b:	50                   	push   %eax
    195c:	52                   	push   %edx
    195d:	e8 84 e7 ff ff       	call   e6 <strcmp>
    1962:	83 c4 10             	add    $0x10,%esp
    1965:	85 c0                	test   %eax,%eax
    1967:	74 10                	je     1979 <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    1969:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    196d:	a1 2c 44 00 00       	mov    0x442c,%eax
    1972:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1975:	7c d0                	jl     1947 <runCalcmd+0x41a>
    1977:	eb 01                	jmp    197a <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    1979:	90                   	nop
            }
            if(index == v_num) //new variable
    197a:	a1 2c 44 00 00       	mov    0x442c,%eax
    197f:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1982:	75 2b                	jne    19af <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1984:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1987:	c1 e0 05             	shl    $0x5,%eax
    198a:	05 60 44 00 00       	add    $0x4460,%eax
    198f:	8d 50 04             	lea    0x4(%eax),%edx
    1992:	83 ec 08             	sub    $0x8,%esp
    1995:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1998:	50                   	push   %eax
    1999:	52                   	push   %edx
    199a:	e8 17 e7 ff ff       	call   b6 <strcpy>
    199f:	83 c4 10             	add    $0x10,%esp
              v_num++;
    19a2:	a1 2c 44 00 00       	mov    0x442c,%eax
    19a7:	83 c0 01             	add    $0x1,%eax
    19aa:	a3 2c 44 00 00       	mov    %eax,0x442c
            }
            variables[index].type = V_STRING;
    19af:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19b2:	c1 e0 05             	shl    $0x5,%eax
    19b5:	05 60 44 00 00       	add    $0x4460,%eax
    19ba:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    19c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    19c3:	2b 45 bc             	sub    -0x44(%ebp),%eax
    19c6:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    19c9:	8b 45 b8             	mov    -0x48(%ebp),%eax
    19cc:	83 c0 01             	add    $0x1,%eax
    19cf:	83 ec 0c             	sub    $0xc,%esp
    19d2:	50                   	push   %eax
    19d3:	e8 bd ee ff ff       	call   895 <malloc>
    19d8:	83 c4 10             	add    $0x10,%esp
    19db:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    19de:	8b 55 bc             	mov    -0x44(%ebp),%edx
    19e1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19e4:	01 d0                	add    %edx,%eax
    19e6:	83 ec 08             	sub    $0x8,%esp
    19e9:	50                   	push   %eax
    19ea:	ff 75 b4             	pushl  -0x4c(%ebp)
    19ed:	e8 c4 e6 ff ff       	call   b6 <strcpy>
    19f2:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    19f5:	8b 55 b8             	mov    -0x48(%ebp),%edx
    19f8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    19fb:	01 d0                	add    %edx,%eax
    19fd:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1a00:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a03:	c1 e0 05             	shl    $0x5,%eax
    1a06:	8d 90 78 44 00 00    	lea    0x4478(%eax),%edx
    1a0c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1a0f:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1a11:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a14:	c1 e0 05             	shl    $0x5,%eax
    1a17:	05 78 44 00 00       	add    $0x4478,%eax
    1a1c:	8b 00                	mov    (%eax),%eax
    1a1e:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1a21:	c1 e2 05             	shl    $0x5,%edx
    1a24:	81 c2 60 44 00 00    	add    $0x4460,%edx
    1a2a:	83 c2 04             	add    $0x4,%edx
    1a2d:	50                   	push   %eax
    1a2e:	52                   	push   %edx
    1a2f:	68 c1 37 00 00       	push   $0x37c1
    1a34:	6a 01                	push   $0x1
    1a36:	e8 58 eb ff ff       	call   593 <printf>
    1a3b:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1a3e:	83 ec 08             	sub    $0x8,%esp
    1a41:	68 2c 44 00 00       	push   $0x442c
    1a46:	68 60 44 00 00       	push   $0x4460
    1a4b:	e8 a5 19 00 00       	call   33f5 <writeVariables>
    1a50:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1a53:	e9 c2 00 00 00       	jmp    1b1a <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1a58:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a5b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a5e:	01 d0                	add    %edx,%eax
    1a60:	0f b6 00             	movzbl (%eax),%eax
    1a63:	84 c0                	test   %al,%al
    1a65:	75 1d                	jne    1a84 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1a67:	83 ec 0c             	sub    $0xc,%esp
    1a6a:	68 ca 37 00 00       	push   $0x37ca
    1a6f:	6a 00                	push   $0x0
    1a71:	6a 00                	push   $0x0
    1a73:	6a 01                	push   $0x1
    1a75:	6a 04                	push   $0x4
    1a77:	e8 3f 12 00 00       	call   2cbb <color_printf>
    1a7c:	83 c4 20             	add    $0x20,%esp
    1a7f:	e9 96 00 00 00       	jmp    1b1a <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1a84:	83 ec 0c             	sub    $0xc,%esp
    1a87:	68 e0 37 00 00       	push   $0x37e0
    1a8c:	6a 00                	push   $0x0
    1a8e:	6a 00                	push   $0x0
    1a90:	6a 01                	push   $0x1
    1a92:	6a 04                	push   $0x4
    1a94:	e8 22 12 00 00       	call   2cbb <color_printf>
    1a99:	83 c4 20             	add    $0x20,%esp
    1a9c:	eb 7c                	jmp    1b1a <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1a9e:	83 ec 0c             	sub    $0xc,%esp
    1aa1:	68 01 38 00 00       	push   $0x3801
    1aa6:	6a 00                	push   $0x0
    1aa8:	6a 00                	push   $0x0
    1aaa:	6a 01                	push   $0x1
    1aac:	6a 04                	push   $0x4
    1aae:	e8 08 12 00 00       	call   2cbb <color_printf>
    1ab3:	83 c4 20             	add    $0x20,%esp
    1ab6:	eb 62                	jmp    1b1a <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1ab8:	83 ec 0c             	sub    $0xc,%esp
    1abb:	68 01 38 00 00       	push   $0x3801
    1ac0:	6a 00                	push   $0x0
    1ac2:	6a 00                	push   $0x0
    1ac4:	6a 01                	push   $0x1
    1ac6:	6a 04                	push   $0x4
    1ac8:	e8 ee 11 00 00       	call   2cbb <color_printf>
    1acd:	83 c4 20             	add    $0x20,%esp
    1ad0:	eb 48                	jmp    1b1a <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1ad2:	83 ec 0c             	sub    $0xc,%esp
    1ad5:	ff 75 d4             	pushl  -0x2c(%ebp)
    1ad8:	e8 2b 01 00 00       	call   1c08 <Compute>
    1add:	83 c4 10             	add    $0x10,%esp
    1ae0:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1ae3:	dd 05 c8 38 00 00    	fldl   0x38c8
    1ae9:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1aed:	dd 1c 24             	fstpl  (%esp)
    1af0:	ff 75 ac             	pushl  -0x54(%ebp)
    1af3:	ff 75 a8             	pushl  -0x58(%ebp)
    1af6:	e8 96 f4 ff ff       	call   f91 <isEqual>
    1afb:	83 c4 10             	add    $0x10,%esp
    1afe:	85 c0                	test   %eax,%eax
    1b00:	75 18                	jne    1b1a <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1b02:	ff 75 ac             	pushl  -0x54(%ebp)
    1b05:	ff 75 a8             	pushl  -0x58(%ebp)
    1b08:	68 19 38 00 00       	push   $0x3819
    1b0d:	6a 01                	push   $0x1
    1b0f:	e8 7f ea ff ff       	call   593 <printf>
    1b14:	83 c4 10             	add    $0x10,%esp
    1b17:	eb 01                	jmp    1b1a <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1b19:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1b1a:	e8 c8 e7 ff ff       	call   2e7 <exit>

00001b1f <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1b1f:	55                   	push   %ebp
    1b20:	89 e5                	mov    %esp,%ebp
    1b22:	83 ec 04             	sub    $0x4,%esp
    1b25:	8b 45 08             	mov    0x8(%ebp),%eax
    1b28:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1b2b:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1b2f:	83 e8 23             	sub    $0x23,%eax
    1b32:	83 f8 0c             	cmp    $0xc,%eax
    1b35:	77 25                	ja     1b5c <GetLevel+0x3d>
    1b37:	8b 04 85 20 38 00 00 	mov    0x3820(,%eax,4),%eax
    1b3e:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1b40:	b8 01 00 00 00       	mov    $0x1,%eax
    1b45:	eb 1a                	jmp    1b61 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1b47:	b8 02 00 00 00       	mov    $0x2,%eax
    1b4c:	eb 13                	jmp    1b61 <GetLevel+0x42>
    case '(':
        return 0;
    1b4e:	b8 00 00 00 00       	mov    $0x0,%eax
    1b53:	eb 0c                	jmp    1b61 <GetLevel+0x42>
    case '#':
        return -2;
    1b55:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1b5a:	eb 05                	jmp    1b61 <GetLevel+0x42>
    };
    return -1;
    1b5c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1b61:	c9                   	leave  
    1b62:	c3                   	ret    

00001b63 <Operate>:

double Operate(double a1, char op, double a2)
{
    1b63:	55                   	push   %ebp
    1b64:	89 e5                	mov    %esp,%ebp
    1b66:	83 ec 28             	sub    $0x28,%esp
    1b69:	8b 45 10             	mov    0x10(%ebp),%eax
    1b6c:	8b 55 08             	mov    0x8(%ebp),%edx
    1b6f:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1b72:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b75:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1b78:	88 45 ec             	mov    %al,-0x14(%ebp)
    1b7b:	8b 45 14             	mov    0x14(%ebp),%eax
    1b7e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1b81:	8b 45 18             	mov    0x18(%ebp),%eax
    1b84:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1b87:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1b8b:	83 f8 2b             	cmp    $0x2b,%eax
    1b8e:	74 18                	je     1ba8 <Operate+0x45>
    1b90:	83 f8 2b             	cmp    $0x2b,%eax
    1b93:	7f 07                	jg     1b9c <Operate+0x39>
    1b95:	83 f8 2a             	cmp    $0x2a,%eax
    1b98:	74 1e                	je     1bb8 <Operate+0x55>
    1b9a:	eb 68                	jmp    1c04 <Operate+0xa1>
    1b9c:	83 f8 2d             	cmp    $0x2d,%eax
    1b9f:	74 0f                	je     1bb0 <Operate+0x4d>
    1ba1:	83 f8 2f             	cmp    $0x2f,%eax
    1ba4:	74 1a                	je     1bc0 <Operate+0x5d>
    1ba6:	eb 5c                	jmp    1c04 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1ba8:	dd 45 f0             	fldl   -0x10(%ebp)
    1bab:	dc 45 e0             	faddl  -0x20(%ebp)
    1bae:	eb 56                	jmp    1c06 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1bb0:	dd 45 f0             	fldl   -0x10(%ebp)
    1bb3:	dc 65 e0             	fsubl  -0x20(%ebp)
    1bb6:	eb 4e                	jmp    1c06 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1bb8:	dd 45 f0             	fldl   -0x10(%ebp)
    1bbb:	dc 4d e0             	fmull  -0x20(%ebp)
    1bbe:	eb 46                	jmp    1c06 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1bc0:	d9 ee                	fldz   
    1bc2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1bc6:	dd 1c 24             	fstpl  (%esp)
    1bc9:	ff 75 e4             	pushl  -0x1c(%ebp)
    1bcc:	ff 75 e0             	pushl  -0x20(%ebp)
    1bcf:	e8 bd f3 ff ff       	call   f91 <isEqual>
    1bd4:	83 c4 10             	add    $0x10,%esp
    1bd7:	83 f8 01             	cmp    $0x1,%eax
    1bda:	75 20                	jne    1bfc <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1bdc:	83 ec 0c             	sub    $0xc,%esp
    1bdf:	68 54 38 00 00       	push   $0x3854
    1be4:	6a 00                	push   $0x0
    1be6:	6a 00                	push   $0x0
    1be8:	6a 01                	push   $0x1
    1bea:	6a 04                	push   $0x4
    1bec:	e8 ca 10 00 00       	call   2cbb <color_printf>
    1bf1:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1bf4:	dd 05 c8 38 00 00    	fldl   0x38c8
    1bfa:	eb 0a                	jmp    1c06 <Operate+0xa3>
        }
        else
          return a1 / a2;
    1bfc:	dd 45 f0             	fldl   -0x10(%ebp)
    1bff:	dc 75 e0             	fdivl  -0x20(%ebp)
    1c02:	eb 02                	jmp    1c06 <Operate+0xa3>
    };
    return 1;
    1c04:	d9 e8                	fld1   
}
    1c06:	c9                   	leave  
    1c07:	c3                   	ret    

00001c08 <Compute>:

double Compute(char *s)
{
    1c08:	55                   	push   %ebp
    1c09:	89 e5                	mov    %esp,%ebp
    1c0b:	53                   	push   %ebx
    1c0c:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1c12:	e8 44 14 00 00       	call   305b <dstack>
    1c17:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1c1a:	e8 73 13 00 00       	call   2f92 <cstack>
    1c1f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1c22:	83 ec 08             	sub    $0x8,%esp
    1c25:	6a 23                	push   $0x23
    1c27:	ff 75 e0             	pushl  -0x20(%ebp)
    1c2a:	e8 91 13 00 00       	call   2fc0 <pushc>
    1c2f:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1c32:	83 ec 0c             	sub    $0xc,%esp
    1c35:	ff 75 08             	pushl  0x8(%ebp)
    1c38:	e8 e8 e4 ff ff       	call   125 <strlen>
    1c3d:	83 c4 10             	add    $0x10,%esp
    1c40:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1c43:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1c4a:	c7 05 40 44 00 00 00 	movl   $0x0,0x4440
    1c51:	00 00 00 
    1c54:	e9 58 05 00 00       	jmp    21b1 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1c59:	a1 40 44 00 00       	mov    0x4440,%eax
    1c5e:	89 c2                	mov    %eax,%edx
    1c60:	8b 45 08             	mov    0x8(%ebp),%eax
    1c63:	01 d0                	add    %edx,%eax
    1c65:	0f b6 00             	movzbl (%eax),%eax
    1c68:	3c 24                	cmp    $0x24,%al
    1c6a:	0f 85 f8 01 00 00    	jne    1e68 <Compute+0x260>
        {
          is_minus = 0;
    1c70:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1c77:	a1 40 44 00 00       	mov    0x4440,%eax
    1c7c:	83 c0 01             	add    $0x1,%eax
    1c7f:	a3 40 44 00 00       	mov    %eax,0x4440
          if(s[g_pos] != '{')
    1c84:	a1 40 44 00 00       	mov    0x4440,%eax
    1c89:	89 c2                	mov    %eax,%edx
    1c8b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c8e:	01 d0                	add    %edx,%eax
    1c90:	0f b6 00             	movzbl (%eax),%eax
    1c93:	3c 7b                	cmp    $0x7b,%al
    1c95:	74 23                	je     1cba <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1c97:	83 ec 0c             	sub    $0xc,%esp
    1c9a:	68 6c 38 00 00       	push   $0x386c
    1c9f:	6a 00                	push   $0x0
    1ca1:	6a 00                	push   $0x0
    1ca3:	6a 01                	push   $0x1
    1ca5:	6a 04                	push   $0x4
    1ca7:	e8 0f 10 00 00       	call   2cbb <color_printf>
    1cac:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1caf:	dd 05 c8 38 00 00    	fldl   0x38c8
    1cb5:	e9 24 06 00 00       	jmp    22de <Compute+0x6d6>
          }
          int i=g_pos+1;
    1cba:	a1 40 44 00 00       	mov    0x4440,%eax
    1cbf:	83 c0 01             	add    $0x1,%eax
    1cc2:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1cc5:	eb 13                	jmp    1cda <Compute+0xd2>
          {
            if(s[i] == '}')
    1cc7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1cca:	8b 45 08             	mov    0x8(%ebp),%eax
    1ccd:	01 d0                	add    %edx,%eax
    1ccf:	0f b6 00             	movzbl (%eax),%eax
    1cd2:	3c 7d                	cmp    $0x7d,%al
    1cd4:	74 0e                	je     1ce4 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1cd6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1cda:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cdd:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1ce0:	7c e5                	jl     1cc7 <Compute+0xbf>
    1ce2:	eb 01                	jmp    1ce5 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1ce4:	90                   	nop
          }
          if(s[i] != '}')
    1ce5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1ce8:	8b 45 08             	mov    0x8(%ebp),%eax
    1ceb:	01 d0                	add    %edx,%eax
    1ced:	0f b6 00             	movzbl (%eax),%eax
    1cf0:	3c 7d                	cmp    $0x7d,%al
    1cf2:	74 23                	je     1d17 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1cf4:	83 ec 0c             	sub    $0xc,%esp
    1cf7:	68 7a 38 00 00       	push   $0x387a
    1cfc:	6a 00                	push   $0x0
    1cfe:	6a 00                	push   $0x0
    1d00:	6a 01                	push   $0x1
    1d02:	6a 04                	push   $0x4
    1d04:	e8 b2 0f 00 00       	call   2cbb <color_printf>
    1d09:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1d0c:	dd 05 c8 38 00 00    	fldl   0x38c8
    1d12:	e9 c7 05 00 00       	jmp    22de <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1d17:	a1 40 44 00 00       	mov    0x4440,%eax
    1d1c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d1f:	29 c2                	sub    %eax,%edx
    1d21:	89 d0                	mov    %edx,%eax
    1d23:	83 e8 01             	sub    $0x1,%eax
    1d26:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1d29:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1d30:	eb 27                	jmp    1d59 <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1d32:	8b 15 40 44 00 00    	mov    0x4440,%edx
    1d38:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1d3b:	01 d0                	add    %edx,%eax
    1d3d:	8d 50 01             	lea    0x1(%eax),%edx
    1d40:	8b 45 08             	mov    0x8(%ebp),%eax
    1d43:	01 d0                	add    %edx,%eax
    1d45:	0f b6 00             	movzbl (%eax),%eax
    1d48:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1d4e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1d51:	01 ca                	add    %ecx,%edx
    1d53:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1d55:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1d59:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1d5c:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1d5f:	7c d1                	jl     1d32 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1d61:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1d67:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1d6a:	01 d0                	add    %edx,%eax
    1d6c:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1d6f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1d76:	a1 2c 44 00 00       	mov    0x442c,%eax
    1d7b:	85 c0                	test   %eax,%eax
    1d7d:	75 40                	jne    1dbf <Compute+0x1b7>
            readVariables(variables,&v_num);
    1d7f:	83 ec 08             	sub    $0x8,%esp
    1d82:	68 2c 44 00 00       	push   $0x442c
    1d87:	68 60 44 00 00       	push   $0x4460
    1d8c:	e8 b0 13 00 00       	call   3141 <readVariables>
    1d91:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1d94:	eb 29                	jmp    1dbf <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1d96:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1d99:	c1 e0 05             	shl    $0x5,%eax
    1d9c:	05 60 44 00 00       	add    $0x4460,%eax
    1da1:	8d 50 04             	lea    0x4(%eax),%edx
    1da4:	83 ec 08             	sub    $0x8,%esp
    1da7:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1dad:	50                   	push   %eax
    1dae:	52                   	push   %edx
    1daf:	e8 32 e3 ff ff       	call   e6 <strcmp>
    1db4:	83 c4 10             	add    $0x10,%esp
    1db7:	85 c0                	test   %eax,%eax
    1db9:	74 10                	je     1dcb <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1dbb:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1dbf:	a1 2c 44 00 00       	mov    0x442c,%eax
    1dc4:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1dc7:	7c cd                	jl     1d96 <Compute+0x18e>
    1dc9:	eb 01                	jmp    1dcc <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1dcb:	90                   	nop
          }
          if(index == v_num) //no such variable
    1dcc:	a1 2c 44 00 00       	mov    0x442c,%eax
    1dd1:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1dd4:	75 2a                	jne    1e00 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1dd6:	83 ec 08             	sub    $0x8,%esp
    1dd9:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1ddf:	50                   	push   %eax
    1de0:	68 88 38 00 00       	push   $0x3888
    1de5:	6a 00                	push   $0x0
    1de7:	6a 00                	push   $0x0
    1de9:	6a 01                	push   $0x1
    1deb:	6a 04                	push   $0x4
    1ded:	e8 c9 0e 00 00       	call   2cbb <color_printf>
    1df2:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1df5:	dd 05 c8 38 00 00    	fldl   0x38c8
    1dfb:	e9 de 04 00 00       	jmp    22de <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1e00:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e03:	c1 e0 05             	shl    $0x5,%eax
    1e06:	05 60 44 00 00       	add    $0x4460,%eax
    1e0b:	8b 00                	mov    (%eax),%eax
    1e0d:	83 f8 02             	cmp    $0x2,%eax
    1e10:	75 23                	jne    1e35 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1e12:	83 ec 0c             	sub    $0xc,%esp
    1e15:	68 a2 38 00 00       	push   $0x38a2
    1e1a:	6a 00                	push   $0x0
    1e1c:	6a 00                	push   $0x0
    1e1e:	6a 01                	push   $0x1
    1e20:	6a 04                	push   $0x4
    1e22:	e8 94 0e 00 00       	call   2cbb <color_printf>
    1e27:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1e2a:	dd 05 c8 38 00 00    	fldl   0x38c8
    1e30:	e9 a9 04 00 00       	jmp    22de <Compute+0x6d6>
          }
          g_pos = i+1;
    1e35:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e38:	83 c0 01             	add    $0x1,%eax
    1e3b:	a3 40 44 00 00       	mov    %eax,0x4440
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    1e40:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e43:	c1 e0 05             	shl    $0x5,%eax
    1e46:	05 70 44 00 00       	add    $0x4470,%eax
    1e4b:	dd 40 08             	fldl   0x8(%eax)
    1e4e:	83 ec 04             	sub    $0x4,%esp
    1e51:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e55:	dd 1c 24             	fstpl  (%esp)
    1e58:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e5b:	e8 2f 12 00 00       	call   308f <pushd>
    1e60:	83 c4 10             	add    $0x10,%esp
    1e63:	e9 49 03 00 00       	jmp    21b1 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    1e68:	a1 40 44 00 00       	mov    0x4440,%eax
    1e6d:	89 c2                	mov    %eax,%edx
    1e6f:	8b 45 08             	mov    0x8(%ebp),%eax
    1e72:	01 d0                	add    %edx,%eax
    1e74:	0f b6 00             	movzbl (%eax),%eax
    1e77:	3c 2d                	cmp    $0x2d,%al
    1e79:	75 3f                	jne    1eba <Compute+0x2b2>
    1e7b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e7f:	74 39                	je     1eba <Compute+0x2b2>
        {
            pushd(opnd,0);
    1e81:	83 ec 04             	sub    $0x4,%esp
    1e84:	d9 ee                	fldz   
    1e86:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e8a:	dd 1c 24             	fstpl  (%esp)
    1e8d:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e90:	e8 fa 11 00 00       	call   308f <pushd>
    1e95:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    1e98:	83 ec 08             	sub    $0x8,%esp
    1e9b:	6a 2d                	push   $0x2d
    1e9d:	ff 75 e0             	pushl  -0x20(%ebp)
    1ea0:	e8 1b 11 00 00       	call   2fc0 <pushc>
    1ea5:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    1ea8:	a1 40 44 00 00       	mov    0x4440,%eax
    1ead:	83 c0 01             	add    $0x1,%eax
    1eb0:	a3 40 44 00 00       	mov    %eax,0x4440
    1eb5:	e9 f7 02 00 00       	jmp    21b1 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    1eba:	a1 40 44 00 00       	mov    0x4440,%eax
    1ebf:	89 c2                	mov    %eax,%edx
    1ec1:	8b 45 08             	mov    0x8(%ebp),%eax
    1ec4:	01 d0                	add    %edx,%eax
    1ec6:	0f b6 00             	movzbl (%eax),%eax
    1ec9:	3c 29                	cmp    $0x29,%al
    1ecb:	0f 85 01 01 00 00    	jne    1fd2 <Compute+0x3ca>
        {
            is_minus = 0;
    1ed1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    1ed8:	a1 40 44 00 00       	mov    0x4440,%eax
    1edd:	83 c0 01             	add    $0x1,%eax
    1ee0:	a3 40 44 00 00       	mov    %eax,0x4440
            while (topc(optr) != '(')
    1ee5:	e9 bf 00 00 00       	jmp    1fa9 <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    1eea:	83 ec 0c             	sub    $0xc,%esp
    1eed:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ef0:	e8 37 12 00 00       	call   312c <topd>
    1ef5:	83 c4 10             	add    $0x10,%esp
    1ef8:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    1efb:	83 ec 0c             	sub    $0xc,%esp
    1efe:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f01:	e8 dd 11 00 00       	call   30e3 <popd>
    1f06:	dd d8                	fstp   %st(0)
    1f08:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    1f0b:	83 ec 0c             	sub    $0xc,%esp
    1f0e:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f11:	e8 16 12 00 00       	call   312c <topd>
    1f16:	83 c4 10             	add    $0x10,%esp
    1f19:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    1f1c:	83 ec 0c             	sub    $0xc,%esp
    1f1f:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f22:	e8 bc 11 00 00       	call   30e3 <popd>
    1f27:	dd d8                	fstp   %st(0)
    1f29:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    1f2c:	83 ec 0c             	sub    $0xc,%esp
    1f2f:	ff 75 e0             	pushl  -0x20(%ebp)
    1f32:	e8 11 11 00 00       	call   3048 <topc>
    1f37:	83 c4 10             	add    $0x10,%esp
    1f3a:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    1f3d:	83 ec 0c             	sub    $0xc,%esp
    1f40:	ff 75 e0             	pushl  -0x20(%ebp)
    1f43:	e8 be 10 00 00       	call   3006 <popc>
    1f48:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    1f4b:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    1f4f:	83 ec 0c             	sub    $0xc,%esp
    1f52:	ff 75 d4             	pushl  -0x2c(%ebp)
    1f55:	ff 75 d0             	pushl  -0x30(%ebp)
    1f58:	50                   	push   %eax
    1f59:	ff 75 cc             	pushl  -0x34(%ebp)
    1f5c:	ff 75 c8             	pushl  -0x38(%ebp)
    1f5f:	e8 ff fb ff ff       	call   1b63 <Operate>
    1f64:	83 c4 20             	add    $0x20,%esp
    1f67:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    1f6a:	dd 05 c8 38 00 00    	fldl   0x38c8
    1f70:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1f74:	dd 1c 24             	fstpl  (%esp)
    1f77:	ff 75 bc             	pushl  -0x44(%ebp)
    1f7a:	ff 75 b8             	pushl  -0x48(%ebp)
    1f7d:	e8 0f f0 ff ff       	call   f91 <isEqual>
    1f82:	83 c4 10             	add    $0x10,%esp
    1f85:	83 f8 01             	cmp    $0x1,%eax
    1f88:	75 0b                	jne    1f95 <Compute+0x38d>
                  return WRONG_ANS;
    1f8a:	dd 05 c8 38 00 00    	fldl   0x38c8
    1f90:	e9 49 03 00 00       	jmp    22de <Compute+0x6d6>
                pushd(opnd,result);
    1f95:	83 ec 04             	sub    $0x4,%esp
    1f98:	ff 75 bc             	pushl  -0x44(%ebp)
    1f9b:	ff 75 b8             	pushl  -0x48(%ebp)
    1f9e:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fa1:	e8 e9 10 00 00       	call   308f <pushd>
    1fa6:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    1fa9:	83 ec 0c             	sub    $0xc,%esp
    1fac:	ff 75 e0             	pushl  -0x20(%ebp)
    1faf:	e8 94 10 00 00       	call   3048 <topc>
    1fb4:	83 c4 10             	add    $0x10,%esp
    1fb7:	3c 28                	cmp    $0x28,%al
    1fb9:	0f 85 2b ff ff ff    	jne    1eea <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    1fbf:	83 ec 0c             	sub    $0xc,%esp
    1fc2:	ff 75 e0             	pushl  -0x20(%ebp)
    1fc5:	e8 3c 10 00 00       	call   3006 <popc>
    1fca:	83 c4 10             	add    $0x10,%esp
    1fcd:	e9 df 01 00 00       	jmp    21b1 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    1fd2:	a1 40 44 00 00       	mov    0x4440,%eax
    1fd7:	89 c2                	mov    %eax,%edx
    1fd9:	8b 45 08             	mov    0x8(%ebp),%eax
    1fdc:	01 d0                	add    %edx,%eax
    1fde:	0f b6 00             	movzbl (%eax),%eax
    1fe1:	3c 2f                	cmp    $0x2f,%al
    1fe3:	7e 49                	jle    202e <Compute+0x426>
    1fe5:	a1 40 44 00 00       	mov    0x4440,%eax
    1fea:	89 c2                	mov    %eax,%edx
    1fec:	8b 45 08             	mov    0x8(%ebp),%eax
    1fef:	01 d0                	add    %edx,%eax
    1ff1:	0f b6 00             	movzbl (%eax),%eax
    1ff4:	3c 39                	cmp    $0x39,%al
    1ff6:	7f 36                	jg     202e <Compute+0x426>
        {
            is_minus = 0;
    1ff8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    1fff:	83 ec 08             	sub    $0x8,%esp
    2002:	68 40 44 00 00       	push   $0x4440
    2007:	ff 75 08             	pushl  0x8(%ebp)
    200a:	e8 c3 eb ff ff       	call   bd2 <Translation>
    200f:	83 c4 10             	add    $0x10,%esp
    2012:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    2015:	83 ec 04             	sub    $0x4,%esp
    2018:	ff 75 b4             	pushl  -0x4c(%ebp)
    201b:	ff 75 b0             	pushl  -0x50(%ebp)
    201e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2021:	e8 69 10 00 00       	call   308f <pushd>
    2026:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    2029:	e9 83 01 00 00       	jmp    21b1 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    202e:	a1 40 44 00 00       	mov    0x4440,%eax
    2033:	89 c2                	mov    %eax,%edx
    2035:	8b 45 08             	mov    0x8(%ebp),%eax
    2038:	01 d0                	add    %edx,%eax
    203a:	0f b6 00             	movzbl (%eax),%eax
    203d:	3c 28                	cmp    $0x28,%al
    203f:	0f 85 f9 00 00 00    	jne    213e <Compute+0x536>
        {
            is_minus = 1;
    2045:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    204c:	a1 40 44 00 00       	mov    0x4440,%eax
    2051:	89 c2                	mov    %eax,%edx
    2053:	8b 45 08             	mov    0x8(%ebp),%eax
    2056:	01 d0                	add    %edx,%eax
    2058:	0f b6 00             	movzbl (%eax),%eax
    205b:	0f be c0             	movsbl %al,%eax
    205e:	83 ec 08             	sub    $0x8,%esp
    2061:	50                   	push   %eax
    2062:	ff 75 e0             	pushl  -0x20(%ebp)
    2065:	e8 56 0f 00 00       	call   2fc0 <pushc>
    206a:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    206d:	a1 40 44 00 00       	mov    0x4440,%eax
    2072:	83 c0 01             	add    $0x1,%eax
    2075:	a3 40 44 00 00       	mov    %eax,0x4440
    207a:	e9 32 01 00 00       	jmp    21b1 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    207f:	83 ec 0c             	sub    $0xc,%esp
    2082:	ff 75 e4             	pushl  -0x1c(%ebp)
    2085:	e8 a2 10 00 00       	call   312c <topd>
    208a:	83 c4 10             	add    $0x10,%esp
    208d:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    2090:	83 ec 0c             	sub    $0xc,%esp
    2093:	ff 75 e4             	pushl  -0x1c(%ebp)
    2096:	e8 48 10 00 00       	call   30e3 <popd>
    209b:	dd d8                	fstp   %st(0)
    209d:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    20a0:	83 ec 0c             	sub    $0xc,%esp
    20a3:	ff 75 e4             	pushl  -0x1c(%ebp)
    20a6:	e8 81 10 00 00       	call   312c <topd>
    20ab:	83 c4 10             	add    $0x10,%esp
    20ae:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    20b1:	83 ec 0c             	sub    $0xc,%esp
    20b4:	ff 75 e4             	pushl  -0x1c(%ebp)
    20b7:	e8 27 10 00 00       	call   30e3 <popd>
    20bc:	dd d8                	fstp   %st(0)
    20be:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    20c1:	83 ec 0c             	sub    $0xc,%esp
    20c4:	ff 75 e0             	pushl  -0x20(%ebp)
    20c7:	e8 7c 0f 00 00       	call   3048 <topc>
    20cc:	83 c4 10             	add    $0x10,%esp
    20cf:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    20d2:	83 ec 0c             	sub    $0xc,%esp
    20d5:	ff 75 e0             	pushl  -0x20(%ebp)
    20d8:	e8 29 0f 00 00       	call   3006 <popc>
    20dd:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    20e0:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    20e4:	83 ec 0c             	sub    $0xc,%esp
    20e7:	ff 75 ac             	pushl  -0x54(%ebp)
    20ea:	ff 75 a8             	pushl  -0x58(%ebp)
    20ed:	50                   	push   %eax
    20ee:	ff 75 a4             	pushl  -0x5c(%ebp)
    20f1:	ff 75 a0             	pushl  -0x60(%ebp)
    20f4:	e8 6a fa ff ff       	call   1b63 <Operate>
    20f9:	83 c4 20             	add    $0x20,%esp
    20fc:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    20ff:	dd 05 c8 38 00 00    	fldl   0x38c8
    2105:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2109:	dd 1c 24             	fstpl  (%esp)
    210c:	ff 75 94             	pushl  -0x6c(%ebp)
    210f:	ff 75 90             	pushl  -0x70(%ebp)
    2112:	e8 7a ee ff ff       	call   f91 <isEqual>
    2117:	83 c4 10             	add    $0x10,%esp
    211a:	83 f8 01             	cmp    $0x1,%eax
    211d:	75 0b                	jne    212a <Compute+0x522>
                  return WRONG_ANS;
    211f:	dd 05 c8 38 00 00    	fldl   0x38c8
    2125:	e9 b4 01 00 00       	jmp    22de <Compute+0x6d6>
                pushd(opnd,result);
    212a:	83 ec 04             	sub    $0x4,%esp
    212d:	ff 75 94             	pushl  -0x6c(%ebp)
    2130:	ff 75 90             	pushl  -0x70(%ebp)
    2133:	ff 75 e4             	pushl  -0x1c(%ebp)
    2136:	e8 54 0f 00 00       	call   308f <pushd>
    213b:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    213e:	a1 40 44 00 00       	mov    0x4440,%eax
    2143:	89 c2                	mov    %eax,%edx
    2145:	8b 45 08             	mov    0x8(%ebp),%eax
    2148:	01 d0                	add    %edx,%eax
    214a:	0f b6 00             	movzbl (%eax),%eax
    214d:	0f be c0             	movsbl %al,%eax
    2150:	83 ec 0c             	sub    $0xc,%esp
    2153:	50                   	push   %eax
    2154:	e8 c6 f9 ff ff       	call   1b1f <GetLevel>
    2159:	83 c4 10             	add    $0x10,%esp
    215c:	89 c3                	mov    %eax,%ebx
    215e:	83 ec 0c             	sub    $0xc,%esp
    2161:	ff 75 e0             	pushl  -0x20(%ebp)
    2164:	e8 df 0e 00 00       	call   3048 <topc>
    2169:	83 c4 10             	add    $0x10,%esp
    216c:	0f be c0             	movsbl %al,%eax
    216f:	83 ec 0c             	sub    $0xc,%esp
    2172:	50                   	push   %eax
    2173:	e8 a7 f9 ff ff       	call   1b1f <GetLevel>
    2178:	83 c4 10             	add    $0x10,%esp
    217b:	39 c3                	cmp    %eax,%ebx
    217d:	0f 8e fc fe ff ff    	jle    207f <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    2183:	a1 40 44 00 00       	mov    0x4440,%eax
    2188:	89 c2                	mov    %eax,%edx
    218a:	8b 45 08             	mov    0x8(%ebp),%eax
    218d:	01 d0                	add    %edx,%eax
    218f:	0f b6 00             	movzbl (%eax),%eax
    2192:	0f be c0             	movsbl %al,%eax
    2195:	83 ec 08             	sub    $0x8,%esp
    2198:	50                   	push   %eax
    2199:	ff 75 e0             	pushl  -0x20(%ebp)
    219c:	e8 1f 0e 00 00       	call   2fc0 <pushc>
    21a1:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    21a4:	a1 40 44 00 00       	mov    0x4440,%eax
    21a9:	83 c0 01             	add    $0x1,%eax
    21ac:	a3 40 44 00 00       	mov    %eax,0x4440
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    21b1:	a1 40 44 00 00       	mov    0x4440,%eax
    21b6:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    21b9:	0f 8c 9a fa ff ff    	jl     1c59 <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    21bf:	e9 da 00 00 00       	jmp    229e <Compute+0x696>
    {
        double a2 = topd(opnd);
    21c4:	83 ec 0c             	sub    $0xc,%esp
    21c7:	ff 75 e4             	pushl  -0x1c(%ebp)
    21ca:	e8 5d 0f 00 00       	call   312c <topd>
    21cf:	83 c4 10             	add    $0x10,%esp
    21d2:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    21d5:	83 ec 0c             	sub    $0xc,%esp
    21d8:	ff 75 e4             	pushl  -0x1c(%ebp)
    21db:	e8 03 0f 00 00       	call   30e3 <popd>
    21e0:	dd d8                	fstp   %st(0)
    21e2:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    21e5:	83 ec 0c             	sub    $0xc,%esp
    21e8:	ff 75 e4             	pushl  -0x1c(%ebp)
    21eb:	e8 3c 0f 00 00       	call   312c <topd>
    21f0:	83 c4 10             	add    $0x10,%esp
    21f3:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    21f9:	83 ec 0c             	sub    $0xc,%esp
    21fc:	ff 75 e4             	pushl  -0x1c(%ebp)
    21ff:	e8 df 0e 00 00       	call   30e3 <popd>
    2204:	dd d8                	fstp   %st(0)
    2206:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    2209:	83 ec 0c             	sub    $0xc,%esp
    220c:	ff 75 e0             	pushl  -0x20(%ebp)
    220f:	e8 34 0e 00 00       	call   3048 <topc>
    2214:	83 c4 10             	add    $0x10,%esp
    2217:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    221d:	83 ec 0c             	sub    $0xc,%esp
    2220:	ff 75 e0             	pushl  -0x20(%ebp)
    2223:	e8 de 0d 00 00       	call   3006 <popc>
    2228:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    222b:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    2232:	83 ec 0c             	sub    $0xc,%esp
    2235:	ff 75 84             	pushl  -0x7c(%ebp)
    2238:	ff 75 80             	pushl  -0x80(%ebp)
    223b:	50                   	push   %eax
    223c:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    2242:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    2248:	e8 16 f9 ff ff       	call   1b63 <Operate>
    224d:	83 c4 20             	add    $0x20,%esp
    2250:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    2256:	dd 05 c8 38 00 00    	fldl   0x38c8
    225c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2260:	dd 1c 24             	fstpl  (%esp)
    2263:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2269:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    226f:	e8 1d ed ff ff       	call   f91 <isEqual>
    2274:	83 c4 10             	add    $0x10,%esp
    2277:	83 f8 01             	cmp    $0x1,%eax
    227a:	75 08                	jne    2284 <Compute+0x67c>
          return WRONG_ANS;
    227c:	dd 05 c8 38 00 00    	fldl   0x38c8
    2282:	eb 5a                	jmp    22de <Compute+0x6d6>
        pushd(opnd,result);
    2284:	83 ec 04             	sub    $0x4,%esp
    2287:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    228d:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2293:	ff 75 e4             	pushl  -0x1c(%ebp)
    2296:	e8 f4 0d 00 00       	call   308f <pushd>
    229b:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    229e:	83 ec 0c             	sub    $0xc,%esp
    22a1:	ff 75 e0             	pushl  -0x20(%ebp)
    22a4:	e8 9f 0d 00 00       	call   3048 <topc>
    22a9:	83 c4 10             	add    $0x10,%esp
    22ac:	3c 23                	cmp    $0x23,%al
    22ae:	0f 85 10 ff ff ff    	jne    21c4 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    22b4:	83 ec 0c             	sub    $0xc,%esp
    22b7:	ff 75 e4             	pushl  -0x1c(%ebp)
    22ba:	e8 94 e4 ff ff       	call   753 <free>
    22bf:	83 c4 10             	add    $0x10,%esp
    free(optr);
    22c2:	83 ec 0c             	sub    $0xc,%esp
    22c5:	ff 75 e0             	pushl  -0x20(%ebp)
    22c8:	e8 86 e4 ff ff       	call   753 <free>
    22cd:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    22d0:	83 ec 0c             	sub    $0xc,%esp
    22d3:	ff 75 e4             	pushl  -0x1c(%ebp)
    22d6:	e8 51 0e 00 00       	call   312c <topd>
    22db:	83 c4 10             	add    $0x10,%esp
}
    22de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    22e1:	c9                   	leave  
    22e2:	c3                   	ret    

000022e3 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    22e3:	55                   	push   %ebp
    22e4:	89 e5                	mov    %esp,%ebp
    22e6:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    22e9:	8b 45 08             	mov    0x8(%ebp),%eax
    22ec:	8b 00                	mov    (%eax),%eax
    22ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    22f1:	eb 04                	jmp    22f7 <gettoken+0x14>
    s++;
    22f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    22f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22fa:	3b 45 0c             	cmp    0xc(%ebp),%eax
    22fd:	73 1e                	jae    231d <gettoken+0x3a>
    22ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2302:	0f b6 00             	movzbl (%eax),%eax
    2305:	0f be c0             	movsbl %al,%eax
    2308:	83 ec 08             	sub    $0x8,%esp
    230b:	50                   	push   %eax
    230c:	68 f4 43 00 00       	push   $0x43f4
    2311:	e8 50 de ff ff       	call   166 <strchr>
    2316:	83 c4 10             	add    $0x10,%esp
    2319:	85 c0                	test   %eax,%eax
    231b:	75 d6                	jne    22f3 <gettoken+0x10>
    s++;
  if(q)
    231d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2321:	74 08                	je     232b <gettoken+0x48>
    *q = s;
    2323:	8b 45 10             	mov    0x10(%ebp),%eax
    2326:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2329:	89 10                	mov    %edx,(%eax)
  ret = *s;
    232b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    232e:	0f b6 00             	movzbl (%eax),%eax
    2331:	0f be c0             	movsbl %al,%eax
    2334:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    2337:	8b 45 f4             	mov    -0xc(%ebp),%eax
    233a:	0f b6 00             	movzbl (%eax),%eax
    233d:	0f be c0             	movsbl %al,%eax
    2340:	83 f8 29             	cmp    $0x29,%eax
    2343:	7f 14                	jg     2359 <gettoken+0x76>
    2345:	83 f8 28             	cmp    $0x28,%eax
    2348:	7d 28                	jge    2372 <gettoken+0x8f>
    234a:	85 c0                	test   %eax,%eax
    234c:	0f 84 94 00 00 00    	je     23e6 <gettoken+0x103>
    2352:	83 f8 26             	cmp    $0x26,%eax
    2355:	74 1b                	je     2372 <gettoken+0x8f>
    2357:	eb 3a                	jmp    2393 <gettoken+0xb0>
    2359:	83 f8 3e             	cmp    $0x3e,%eax
    235c:	74 1a                	je     2378 <gettoken+0x95>
    235e:	83 f8 3e             	cmp    $0x3e,%eax
    2361:	7f 0a                	jg     236d <gettoken+0x8a>
    2363:	83 e8 3b             	sub    $0x3b,%eax
    2366:	83 f8 01             	cmp    $0x1,%eax
    2369:	77 28                	ja     2393 <gettoken+0xb0>
    236b:	eb 05                	jmp    2372 <gettoken+0x8f>
    236d:	83 f8 7c             	cmp    $0x7c,%eax
    2370:	75 21                	jne    2393 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    2372:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    2376:	eb 75                	jmp    23ed <gettoken+0x10a>
  case '>':
    s++;
    2378:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    237c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    237f:	0f b6 00             	movzbl (%eax),%eax
    2382:	3c 3e                	cmp    $0x3e,%al
    2384:	75 63                	jne    23e9 <gettoken+0x106>
      ret = '+';
    2386:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    238d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    2391:	eb 56                	jmp    23e9 <gettoken+0x106>
  default:
    ret = 'a';
    2393:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    239a:	eb 04                	jmp    23a0 <gettoken+0xbd>
      s++;
    239c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    23a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23a3:	3b 45 0c             	cmp    0xc(%ebp),%eax
    23a6:	73 44                	jae    23ec <gettoken+0x109>
    23a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23ab:	0f b6 00             	movzbl (%eax),%eax
    23ae:	0f be c0             	movsbl %al,%eax
    23b1:	83 ec 08             	sub    $0x8,%esp
    23b4:	50                   	push   %eax
    23b5:	68 f4 43 00 00       	push   $0x43f4
    23ba:	e8 a7 dd ff ff       	call   166 <strchr>
    23bf:	83 c4 10             	add    $0x10,%esp
    23c2:	85 c0                	test   %eax,%eax
    23c4:	75 26                	jne    23ec <gettoken+0x109>
    23c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23c9:	0f b6 00             	movzbl (%eax),%eax
    23cc:	0f be c0             	movsbl %al,%eax
    23cf:	83 ec 08             	sub    $0x8,%esp
    23d2:	50                   	push   %eax
    23d3:	68 fc 43 00 00       	push   $0x43fc
    23d8:	e8 89 dd ff ff       	call   166 <strchr>
    23dd:	83 c4 10             	add    $0x10,%esp
    23e0:	85 c0                	test   %eax,%eax
    23e2:	74 b8                	je     239c <gettoken+0xb9>
      s++;
    break;
    23e4:	eb 06                	jmp    23ec <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    23e6:	90                   	nop
    23e7:	eb 04                	jmp    23ed <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    23e9:	90                   	nop
    23ea:	eb 01                	jmp    23ed <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    23ec:	90                   	nop
  }
  if(eq)
    23ed:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    23f1:	74 0e                	je     2401 <gettoken+0x11e>
    *eq = s;
    23f3:	8b 45 14             	mov    0x14(%ebp),%eax
    23f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    23f9:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    23fb:	eb 04                	jmp    2401 <gettoken+0x11e>
    s++;
    23fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    2401:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2404:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2407:	73 1e                	jae    2427 <gettoken+0x144>
    2409:	8b 45 f4             	mov    -0xc(%ebp),%eax
    240c:	0f b6 00             	movzbl (%eax),%eax
    240f:	0f be c0             	movsbl %al,%eax
    2412:	83 ec 08             	sub    $0x8,%esp
    2415:	50                   	push   %eax
    2416:	68 f4 43 00 00       	push   $0x43f4
    241b:	e8 46 dd ff ff       	call   166 <strchr>
    2420:	83 c4 10             	add    $0x10,%esp
    2423:	85 c0                	test   %eax,%eax
    2425:	75 d6                	jne    23fd <gettoken+0x11a>
    s++;
  *ps = s;
    2427:	8b 45 08             	mov    0x8(%ebp),%eax
    242a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    242d:	89 10                	mov    %edx,(%eax)
  return ret;
    242f:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2432:	c9                   	leave  
    2433:	c3                   	ret    

00002434 <peek>:

int peek(char **ps, char *es, char *toks)
{
    2434:	55                   	push   %ebp
    2435:	89 e5                	mov    %esp,%ebp
    2437:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    243a:	8b 45 08             	mov    0x8(%ebp),%eax
    243d:	8b 00                	mov    (%eax),%eax
    243f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2442:	eb 04                	jmp    2448 <peek+0x14>
    s++;
    2444:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2448:	8b 45 f4             	mov    -0xc(%ebp),%eax
    244b:	3b 45 0c             	cmp    0xc(%ebp),%eax
    244e:	73 1e                	jae    246e <peek+0x3a>
    2450:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2453:	0f b6 00             	movzbl (%eax),%eax
    2456:	0f be c0             	movsbl %al,%eax
    2459:	83 ec 08             	sub    $0x8,%esp
    245c:	50                   	push   %eax
    245d:	68 f4 43 00 00       	push   $0x43f4
    2462:	e8 ff dc ff ff       	call   166 <strchr>
    2467:	83 c4 10             	add    $0x10,%esp
    246a:	85 c0                	test   %eax,%eax
    246c:	75 d6                	jne    2444 <peek+0x10>
    s++;
  *ps = s;
    246e:	8b 45 08             	mov    0x8(%ebp),%eax
    2471:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2474:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    2476:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2479:	0f b6 00             	movzbl (%eax),%eax
    247c:	84 c0                	test   %al,%al
    247e:	74 23                	je     24a3 <peek+0x6f>
    2480:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2483:	0f b6 00             	movzbl (%eax),%eax
    2486:	0f be c0             	movsbl %al,%eax
    2489:	83 ec 08             	sub    $0x8,%esp
    248c:	50                   	push   %eax
    248d:	ff 75 10             	pushl  0x10(%ebp)
    2490:	e8 d1 dc ff ff       	call   166 <strchr>
    2495:	83 c4 10             	add    $0x10,%esp
    2498:	85 c0                	test   %eax,%eax
    249a:	74 07                	je     24a3 <peek+0x6f>
    249c:	b8 01 00 00 00       	mov    $0x1,%eax
    24a1:	eb 05                	jmp    24a8 <peek+0x74>
    24a3:	b8 00 00 00 00       	mov    $0x0,%eax
}
    24a8:	c9                   	leave  
    24a9:	c3                   	ret    

000024aa <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    24aa:	55                   	push   %ebp
    24ab:	89 e5                	mov    %esp,%ebp
    24ad:	53                   	push   %ebx
    24ae:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    24b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
    24b4:	8b 45 08             	mov    0x8(%ebp),%eax
    24b7:	83 ec 0c             	sub    $0xc,%esp
    24ba:	50                   	push   %eax
    24bb:	e8 65 dc ff ff       	call   125 <strlen>
    24c0:	83 c4 10             	add    $0x10,%esp
    24c3:	01 d8                	add    %ebx,%eax
    24c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    24c8:	8b 45 08             	mov    0x8(%ebp),%eax
    24cb:	0f b6 00             	movzbl (%eax),%eax
    24ce:	3c 25                	cmp    $0x25,%al
    24d0:	75 5d                	jne    252f <parsecmd+0x85>
  {
    int len = strlen(s);
    24d2:	8b 45 08             	mov    0x8(%ebp),%eax
    24d5:	83 ec 0c             	sub    $0xc,%esp
    24d8:	50                   	push   %eax
    24d9:	e8 47 dc ff ff       	call   125 <strlen>
    24de:	83 c4 10             	add    $0x10,%esp
    24e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    24e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24e7:	83 ec 0c             	sub    $0xc,%esp
    24ea:	50                   	push   %eax
    24eb:	e8 a5 e3 ff ff       	call   895 <malloc>
    24f0:	83 c4 10             	add    $0x10,%esp
    24f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    24f6:	8b 45 08             	mov    0x8(%ebp),%eax
    24f9:	83 c0 01             	add    $0x1,%eax
    24fc:	83 ec 08             	sub    $0x8,%esp
    24ff:	50                   	push   %eax
    2500:	ff 75 ec             	pushl  -0x14(%ebp)
    2503:	e8 ae db ff ff       	call   b6 <strcpy>
    2508:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    250b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    250e:	8d 50 fe             	lea    -0x2(%eax),%edx
    2511:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2514:	01 d0                	add    %edx,%eax
    2516:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    2519:	83 ec 0c             	sub    $0xc,%esp
    251c:	ff 75 ec             	pushl  -0x14(%ebp)
    251f:	e8 59 e9 ff ff       	call   e7d <calcmd>
    2524:	83 c4 10             	add    $0x10,%esp
    2527:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    252a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    252d:	eb 6b                	jmp    259a <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    252f:	83 ec 08             	sub    $0x8,%esp
    2532:	ff 75 f4             	pushl  -0xc(%ebp)
    2535:	8d 45 08             	lea    0x8(%ebp),%eax
    2538:	50                   	push   %eax
    2539:	e8 61 00 00 00       	call   259f <parseline>
    253e:	83 c4 10             	add    $0x10,%esp
    2541:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    2544:	83 ec 04             	sub    $0x4,%esp
    2547:	68 d0 38 00 00       	push   $0x38d0
    254c:	ff 75 f4             	pushl  -0xc(%ebp)
    254f:	8d 45 08             	lea    0x8(%ebp),%eax
    2552:	50                   	push   %eax
    2553:	e8 dc fe ff ff       	call   2434 <peek>
    2558:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    255b:	8b 45 08             	mov    0x8(%ebp),%eax
    255e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2561:	74 26                	je     2589 <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    2563:	8b 45 08             	mov    0x8(%ebp),%eax
    2566:	83 ec 04             	sub    $0x4,%esp
    2569:	50                   	push   %eax
    256a:	68 d1 38 00 00       	push   $0x38d1
    256f:	6a 02                	push   $0x2
    2571:	e8 1d e0 ff ff       	call   593 <printf>
    2576:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    2579:	83 ec 0c             	sub    $0xc,%esp
    257c:	68 e0 38 00 00       	push   $0x38e0
    2581:	e8 f2 e3 ff ff       	call   978 <panic1>
    2586:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    2589:	83 ec 0c             	sub    $0xc,%esp
    258c:	ff 75 e4             	pushl  -0x1c(%ebp)
    258f:	e8 eb 03 00 00       	call   297f <nulterminate>
    2594:	83 c4 10             	add    $0x10,%esp
  return cmd;
    2597:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    259a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    259d:	c9                   	leave  
    259e:	c3                   	ret    

0000259f <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    259f:	55                   	push   %ebp
    25a0:	89 e5                	mov    %esp,%ebp
    25a2:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    25a5:	83 ec 08             	sub    $0x8,%esp
    25a8:	ff 75 0c             	pushl  0xc(%ebp)
    25ab:	ff 75 08             	pushl  0x8(%ebp)
    25ae:	e8 99 00 00 00       	call   264c <parsepipe>
    25b3:	83 c4 10             	add    $0x10,%esp
    25b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    25b9:	eb 23                	jmp    25de <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    25bb:	6a 00                	push   $0x0
    25bd:	6a 00                	push   $0x0
    25bf:	ff 75 0c             	pushl  0xc(%ebp)
    25c2:	ff 75 08             	pushl  0x8(%ebp)
    25c5:	e8 19 fd ff ff       	call   22e3 <gettoken>
    25ca:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    25cd:	83 ec 0c             	sub    $0xc,%esp
    25d0:	ff 75 f4             	pushl  -0xc(%ebp)
    25d3:	e8 66 e8 ff ff       	call   e3e <backcmd>
    25d8:	83 c4 10             	add    $0x10,%esp
    25db:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    25de:	83 ec 04             	sub    $0x4,%esp
    25e1:	68 e7 38 00 00       	push   $0x38e7
    25e6:	ff 75 0c             	pushl  0xc(%ebp)
    25e9:	ff 75 08             	pushl  0x8(%ebp)
    25ec:	e8 43 fe ff ff       	call   2434 <peek>
    25f1:	83 c4 10             	add    $0x10,%esp
    25f4:	85 c0                	test   %eax,%eax
    25f6:	75 c3                	jne    25bb <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    25f8:	83 ec 04             	sub    $0x4,%esp
    25fb:	68 e9 38 00 00       	push   $0x38e9
    2600:	ff 75 0c             	pushl  0xc(%ebp)
    2603:	ff 75 08             	pushl  0x8(%ebp)
    2606:	e8 29 fe ff ff       	call   2434 <peek>
    260b:	83 c4 10             	add    $0x10,%esp
    260e:	85 c0                	test   %eax,%eax
    2610:	74 35                	je     2647 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    2612:	6a 00                	push   $0x0
    2614:	6a 00                	push   $0x0
    2616:	ff 75 0c             	pushl  0xc(%ebp)
    2619:	ff 75 08             	pushl  0x8(%ebp)
    261c:	e8 c2 fc ff ff       	call   22e3 <gettoken>
    2621:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    2624:	83 ec 08             	sub    $0x8,%esp
    2627:	ff 75 0c             	pushl  0xc(%ebp)
    262a:	ff 75 08             	pushl  0x8(%ebp)
    262d:	e8 6d ff ff ff       	call   259f <parseline>
    2632:	83 c4 10             	add    $0x10,%esp
    2635:	83 ec 08             	sub    $0x8,%esp
    2638:	50                   	push   %eax
    2639:	ff 75 f4             	pushl  -0xc(%ebp)
    263c:	e8 b5 e7 ff ff       	call   df6 <listcmd>
    2641:	83 c4 10             	add    $0x10,%esp
    2644:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2647:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    264a:	c9                   	leave  
    264b:	c3                   	ret    

0000264c <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    264c:	55                   	push   %ebp
    264d:	89 e5                	mov    %esp,%ebp
    264f:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    2652:	83 ec 08             	sub    $0x8,%esp
    2655:	ff 75 0c             	pushl  0xc(%ebp)
    2658:	ff 75 08             	pushl  0x8(%ebp)
    265b:	e8 ec 01 00 00       	call   284c <parseexec>
    2660:	83 c4 10             	add    $0x10,%esp
    2663:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    2666:	83 ec 04             	sub    $0x4,%esp
    2669:	68 eb 38 00 00       	push   $0x38eb
    266e:	ff 75 0c             	pushl  0xc(%ebp)
    2671:	ff 75 08             	pushl  0x8(%ebp)
    2674:	e8 bb fd ff ff       	call   2434 <peek>
    2679:	83 c4 10             	add    $0x10,%esp
    267c:	85 c0                	test   %eax,%eax
    267e:	74 35                	je     26b5 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2680:	6a 00                	push   $0x0
    2682:	6a 00                	push   $0x0
    2684:	ff 75 0c             	pushl  0xc(%ebp)
    2687:	ff 75 08             	pushl  0x8(%ebp)
    268a:	e8 54 fc ff ff       	call   22e3 <gettoken>
    268f:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2692:	83 ec 08             	sub    $0x8,%esp
    2695:	ff 75 0c             	pushl  0xc(%ebp)
    2698:	ff 75 08             	pushl  0x8(%ebp)
    269b:	e8 ac ff ff ff       	call   264c <parsepipe>
    26a0:	83 c4 10             	add    $0x10,%esp
    26a3:	83 ec 08             	sub    $0x8,%esp
    26a6:	50                   	push   %eax
    26a7:	ff 75 f4             	pushl  -0xc(%ebp)
    26aa:	e8 ff e6 ff ff       	call   dae <pipecmd>
    26af:	83 c4 10             	add    $0x10,%esp
    26b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    26b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    26b8:	c9                   	leave  
    26b9:	c3                   	ret    

000026ba <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    26ba:	55                   	push   %ebp
    26bb:	89 e5                	mov    %esp,%ebp
    26bd:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    26c0:	e9 b6 00 00 00       	jmp    277b <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    26c5:	6a 00                	push   $0x0
    26c7:	6a 00                	push   $0x0
    26c9:	ff 75 10             	pushl  0x10(%ebp)
    26cc:	ff 75 0c             	pushl  0xc(%ebp)
    26cf:	e8 0f fc ff ff       	call   22e3 <gettoken>
    26d4:	83 c4 10             	add    $0x10,%esp
    26d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    26da:	8d 45 ec             	lea    -0x14(%ebp),%eax
    26dd:	50                   	push   %eax
    26de:	8d 45 f0             	lea    -0x10(%ebp),%eax
    26e1:	50                   	push   %eax
    26e2:	ff 75 10             	pushl  0x10(%ebp)
    26e5:	ff 75 0c             	pushl  0xc(%ebp)
    26e8:	e8 f6 fb ff ff       	call   22e3 <gettoken>
    26ed:	83 c4 10             	add    $0x10,%esp
    26f0:	83 f8 61             	cmp    $0x61,%eax
    26f3:	74 10                	je     2705 <parseredirs+0x4b>
      panic1("missing file for redirection");
    26f5:	83 ec 0c             	sub    $0xc,%esp
    26f8:	68 ed 38 00 00       	push   $0x38ed
    26fd:	e8 76 e2 ff ff       	call   978 <panic1>
    2702:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    2705:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2708:	83 f8 3c             	cmp    $0x3c,%eax
    270b:	74 0c                	je     2719 <parseredirs+0x5f>
    270d:	83 f8 3e             	cmp    $0x3e,%eax
    2710:	74 26                	je     2738 <parseredirs+0x7e>
    2712:	83 f8 2b             	cmp    $0x2b,%eax
    2715:	74 43                	je     275a <parseredirs+0xa0>
    2717:	eb 62                	jmp    277b <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    2719:	8b 55 ec             	mov    -0x14(%ebp),%edx
    271c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    271f:	83 ec 0c             	sub    $0xc,%esp
    2722:	6a 00                	push   $0x0
    2724:	6a 00                	push   $0x0
    2726:	52                   	push   %edx
    2727:	50                   	push   %eax
    2728:	ff 75 08             	pushl  0x8(%ebp)
    272b:	e8 1b e6 ff ff       	call   d4b <redircmd>
    2730:	83 c4 20             	add    $0x20,%esp
    2733:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2736:	eb 43                	jmp    277b <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    2738:	8b 55 ec             	mov    -0x14(%ebp),%edx
    273b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    273e:	83 ec 0c             	sub    $0xc,%esp
    2741:	6a 01                	push   $0x1
    2743:	68 01 02 00 00       	push   $0x201
    2748:	52                   	push   %edx
    2749:	50                   	push   %eax
    274a:	ff 75 08             	pushl  0x8(%ebp)
    274d:	e8 f9 e5 ff ff       	call   d4b <redircmd>
    2752:	83 c4 20             	add    $0x20,%esp
    2755:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2758:	eb 21                	jmp    277b <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    275a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    275d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2760:	83 ec 0c             	sub    $0xc,%esp
    2763:	6a 01                	push   $0x1
    2765:	68 01 02 00 00       	push   $0x201
    276a:	52                   	push   %edx
    276b:	50                   	push   %eax
    276c:	ff 75 08             	pushl  0x8(%ebp)
    276f:	e8 d7 e5 ff ff       	call   d4b <redircmd>
    2774:	83 c4 20             	add    $0x20,%esp
    2777:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    277a:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    277b:	83 ec 04             	sub    $0x4,%esp
    277e:	68 0a 39 00 00       	push   $0x390a
    2783:	ff 75 10             	pushl  0x10(%ebp)
    2786:	ff 75 0c             	pushl  0xc(%ebp)
    2789:	e8 a6 fc ff ff       	call   2434 <peek>
    278e:	83 c4 10             	add    $0x10,%esp
    2791:	85 c0                	test   %eax,%eax
    2793:	0f 85 2c ff ff ff    	jne    26c5 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    2799:	8b 45 08             	mov    0x8(%ebp),%eax
}
    279c:	c9                   	leave  
    279d:	c3                   	ret    

0000279e <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    279e:	55                   	push   %ebp
    279f:	89 e5                	mov    %esp,%ebp
    27a1:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    27a4:	83 ec 04             	sub    $0x4,%esp
    27a7:	68 0d 39 00 00       	push   $0x390d
    27ac:	ff 75 0c             	pushl  0xc(%ebp)
    27af:	ff 75 08             	pushl  0x8(%ebp)
    27b2:	e8 7d fc ff ff       	call   2434 <peek>
    27b7:	83 c4 10             	add    $0x10,%esp
    27ba:	85 c0                	test   %eax,%eax
    27bc:	75 10                	jne    27ce <parseblock+0x30>
    panic1("parseblock");
    27be:	83 ec 0c             	sub    $0xc,%esp
    27c1:	68 0f 39 00 00       	push   $0x390f
    27c6:	e8 ad e1 ff ff       	call   978 <panic1>
    27cb:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    27ce:	6a 00                	push   $0x0
    27d0:	6a 00                	push   $0x0
    27d2:	ff 75 0c             	pushl  0xc(%ebp)
    27d5:	ff 75 08             	pushl  0x8(%ebp)
    27d8:	e8 06 fb ff ff       	call   22e3 <gettoken>
    27dd:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    27e0:	83 ec 08             	sub    $0x8,%esp
    27e3:	ff 75 0c             	pushl  0xc(%ebp)
    27e6:	ff 75 08             	pushl  0x8(%ebp)
    27e9:	e8 b1 fd ff ff       	call   259f <parseline>
    27ee:	83 c4 10             	add    $0x10,%esp
    27f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    27f4:	83 ec 04             	sub    $0x4,%esp
    27f7:	68 1a 39 00 00       	push   $0x391a
    27fc:	ff 75 0c             	pushl  0xc(%ebp)
    27ff:	ff 75 08             	pushl  0x8(%ebp)
    2802:	e8 2d fc ff ff       	call   2434 <peek>
    2807:	83 c4 10             	add    $0x10,%esp
    280a:	85 c0                	test   %eax,%eax
    280c:	75 10                	jne    281e <parseblock+0x80>
    panic1("syntax - missing )");
    280e:	83 ec 0c             	sub    $0xc,%esp
    2811:	68 1c 39 00 00       	push   $0x391c
    2816:	e8 5d e1 ff ff       	call   978 <panic1>
    281b:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    281e:	6a 00                	push   $0x0
    2820:	6a 00                	push   $0x0
    2822:	ff 75 0c             	pushl  0xc(%ebp)
    2825:	ff 75 08             	pushl  0x8(%ebp)
    2828:	e8 b6 fa ff ff       	call   22e3 <gettoken>
    282d:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    2830:	83 ec 04             	sub    $0x4,%esp
    2833:	ff 75 0c             	pushl  0xc(%ebp)
    2836:	ff 75 08             	pushl  0x8(%ebp)
    2839:	ff 75 f4             	pushl  -0xc(%ebp)
    283c:	e8 79 fe ff ff       	call   26ba <parseredirs>
    2841:	83 c4 10             	add    $0x10,%esp
    2844:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    2847:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    284a:	c9                   	leave  
    284b:	c3                   	ret    

0000284c <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    284c:	55                   	push   %ebp
    284d:	89 e5                	mov    %esp,%ebp
    284f:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    2852:	83 ec 04             	sub    $0x4,%esp
    2855:	68 0d 39 00 00       	push   $0x390d
    285a:	ff 75 0c             	pushl  0xc(%ebp)
    285d:	ff 75 08             	pushl  0x8(%ebp)
    2860:	e8 cf fb ff ff       	call   2434 <peek>
    2865:	83 c4 10             	add    $0x10,%esp
    2868:	85 c0                	test   %eax,%eax
    286a:	74 16                	je     2882 <parseexec+0x36>
    return parseblock(ps, es);
    286c:	83 ec 08             	sub    $0x8,%esp
    286f:	ff 75 0c             	pushl  0xc(%ebp)
    2872:	ff 75 08             	pushl  0x8(%ebp)
    2875:	e8 24 ff ff ff       	call   279e <parseblock>
    287a:	83 c4 10             	add    $0x10,%esp
    287d:	e9 fb 00 00 00       	jmp    297d <parseexec+0x131>

  ret = execcmd();
    2882:	e8 8e e4 ff ff       	call   d15 <execcmd>
    2887:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    288a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    288d:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2890:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2897:	83 ec 04             	sub    $0x4,%esp
    289a:	ff 75 0c             	pushl  0xc(%ebp)
    289d:	ff 75 08             	pushl  0x8(%ebp)
    28a0:	ff 75 f0             	pushl  -0x10(%ebp)
    28a3:	e8 12 fe ff ff       	call   26ba <parseredirs>
    28a8:	83 c4 10             	add    $0x10,%esp
    28ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    28ae:	e9 87 00 00 00       	jmp    293a <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    28b3:	8d 45 e0             	lea    -0x20(%ebp),%eax
    28b6:	50                   	push   %eax
    28b7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    28ba:	50                   	push   %eax
    28bb:	ff 75 0c             	pushl  0xc(%ebp)
    28be:	ff 75 08             	pushl  0x8(%ebp)
    28c1:	e8 1d fa ff ff       	call   22e3 <gettoken>
    28c6:	83 c4 10             	add    $0x10,%esp
    28c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    28cc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    28d0:	0f 84 84 00 00 00    	je     295a <parseexec+0x10e>
      break;
    if(tok != 'a')
    28d6:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    28da:	74 10                	je     28ec <parseexec+0xa0>
      panic1("syntax");
    28dc:	83 ec 0c             	sub    $0xc,%esp
    28df:	68 e0 38 00 00       	push   $0x38e0
    28e4:	e8 8f e0 ff ff       	call   978 <panic1>
    28e9:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    28ec:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    28ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
    28f2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    28f5:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    28f9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    28fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    28ff:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2902:	83 c1 08             	add    $0x8,%ecx
    2905:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    2909:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    290d:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2911:	7e 10                	jle    2923 <parseexec+0xd7>
      panic1("too many args");
    2913:	83 ec 0c             	sub    $0xc,%esp
    2916:	68 2f 39 00 00       	push   $0x392f
    291b:	e8 58 e0 ff ff       	call   978 <panic1>
    2920:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2923:	83 ec 04             	sub    $0x4,%esp
    2926:	ff 75 0c             	pushl  0xc(%ebp)
    2929:	ff 75 08             	pushl  0x8(%ebp)
    292c:	ff 75 f0             	pushl  -0x10(%ebp)
    292f:	e8 86 fd ff ff       	call   26ba <parseredirs>
    2934:	83 c4 10             	add    $0x10,%esp
    2937:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    293a:	83 ec 04             	sub    $0x4,%esp
    293d:	68 3d 39 00 00       	push   $0x393d
    2942:	ff 75 0c             	pushl  0xc(%ebp)
    2945:	ff 75 08             	pushl  0x8(%ebp)
    2948:	e8 e7 fa ff ff       	call   2434 <peek>
    294d:	83 c4 10             	add    $0x10,%esp
    2950:	85 c0                	test   %eax,%eax
    2952:	0f 84 5b ff ff ff    	je     28b3 <parseexec+0x67>
    2958:	eb 01                	jmp    295b <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    295a:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    295b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    295e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2961:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    2968:	00 
  cmd->eargv[argc] = 0;
    2969:	8b 45 ec             	mov    -0x14(%ebp),%eax
    296c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    296f:	83 c2 08             	add    $0x8,%edx
    2972:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    2979:	00 
  return ret;
    297a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    297d:	c9                   	leave  
    297e:	c3                   	ret    

0000297f <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    297f:	55                   	push   %ebp
    2980:	89 e5                	mov    %esp,%ebp
    2982:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2985:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2989:	75 0a                	jne    2995 <nulterminate+0x16>
    return 0;
    298b:	b8 00 00 00 00       	mov    $0x0,%eax
    2990:	e9 e4 00 00 00       	jmp    2a79 <nulterminate+0xfa>
  
  switch(cmd->type){
    2995:	8b 45 08             	mov    0x8(%ebp),%eax
    2998:	8b 00                	mov    (%eax),%eax
    299a:	83 f8 05             	cmp    $0x5,%eax
    299d:	0f 87 d3 00 00 00    	ja     2a76 <nulterminate+0xf7>
    29a3:	8b 04 85 44 39 00 00 	mov    0x3944(,%eax,4),%eax
    29aa:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    29ac:	8b 45 08             	mov    0x8(%ebp),%eax
    29af:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    29b2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    29b9:	eb 14                	jmp    29cf <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    29bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29be:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29c1:	83 c2 08             	add    $0x8,%edx
    29c4:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    29c8:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    29cb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    29cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29d2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29d5:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    29d9:	85 c0                	test   %eax,%eax
    29db:	75 de                	jne    29bb <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    29dd:	e9 94 00 00 00       	jmp    2a76 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    29e2:	8b 45 08             	mov    0x8(%ebp),%eax
    29e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    29e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29eb:	8b 40 04             	mov    0x4(%eax),%eax
    29ee:	83 ec 0c             	sub    $0xc,%esp
    29f1:	50                   	push   %eax
    29f2:	e8 88 ff ff ff       	call   297f <nulterminate>
    29f7:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    29fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29fd:	8b 40 0c             	mov    0xc(%eax),%eax
    2a00:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2a03:	eb 71                	jmp    2a76 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2a05:	8b 45 08             	mov    0x8(%ebp),%eax
    2a08:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2a0b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a0e:	8b 40 04             	mov    0x4(%eax),%eax
    2a11:	83 ec 0c             	sub    $0xc,%esp
    2a14:	50                   	push   %eax
    2a15:	e8 65 ff ff ff       	call   297f <nulterminate>
    2a1a:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2a1d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a20:	8b 40 08             	mov    0x8(%eax),%eax
    2a23:	83 ec 0c             	sub    $0xc,%esp
    2a26:	50                   	push   %eax
    2a27:	e8 53 ff ff ff       	call   297f <nulterminate>
    2a2c:	83 c4 10             	add    $0x10,%esp
    break;
    2a2f:	eb 45                	jmp    2a76 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2a31:	8b 45 08             	mov    0x8(%ebp),%eax
    2a34:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2a37:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2a3a:	8b 40 04             	mov    0x4(%eax),%eax
    2a3d:	83 ec 0c             	sub    $0xc,%esp
    2a40:	50                   	push   %eax
    2a41:	e8 39 ff ff ff       	call   297f <nulterminate>
    2a46:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2a49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2a4c:	8b 40 08             	mov    0x8(%eax),%eax
    2a4f:	83 ec 0c             	sub    $0xc,%esp
    2a52:	50                   	push   %eax
    2a53:	e8 27 ff ff ff       	call   297f <nulterminate>
    2a58:	83 c4 10             	add    $0x10,%esp
    break;
    2a5b:	eb 19                	jmp    2a76 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2a5d:	8b 45 08             	mov    0x8(%ebp),%eax
    2a60:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2a63:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2a66:	8b 40 04             	mov    0x4(%eax),%eax
    2a69:	83 ec 0c             	sub    $0xc,%esp
    2a6c:	50                   	push   %eax
    2a6d:	e8 0d ff ff ff       	call   297f <nulterminate>
    2a72:	83 c4 10             	add    $0x10,%esp
    break;
    2a75:	90                   	nop
  }
  return cmd;
    2a76:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2a79:	c9                   	leave  
    2a7a:	c3                   	ret    

00002a7b <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2a7b:	55                   	push   %ebp
    2a7c:	89 e5                	mov    %esp,%ebp
    2a7e:	83 ec 18             	sub    $0x18,%esp
    2a81:	8b 45 08             	mov    0x8(%ebp),%eax
    2a84:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2a87:	83 ec 08             	sub    $0x8,%esp
    2a8a:	ff 75 18             	pushl  0x18(%ebp)
    2a8d:	ff 75 14             	pushl  0x14(%ebp)
    2a90:	ff 75 10             	pushl  0x10(%ebp)
    2a93:	ff 75 0c             	pushl  0xc(%ebp)
    2a96:	6a 01                	push   $0x1
    2a98:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2a9b:	50                   	push   %eax
    2a9c:	e8 e6 d8 ff ff       	call   387 <colorwrite>
    2aa1:	83 c4 20             	add    $0x20,%esp
}
    2aa4:	90                   	nop
    2aa5:	c9                   	leave  
    2aa6:	c3                   	ret    

00002aa7 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2aa7:	55                   	push   %ebp
    2aa8:	89 e5                	mov    %esp,%ebp
    2aaa:	53                   	push   %ebx
    2aab:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2aae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2ab5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2ab9:	74 17                	je     2ad2 <color_printint+0x2b>
    2abb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2abf:	79 11                	jns    2ad2 <color_printint+0x2b>
    neg = 1;
    2ac1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2ac8:	8b 45 08             	mov    0x8(%ebp),%eax
    2acb:	f7 d8                	neg    %eax
    2acd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2ad0:	eb 06                	jmp    2ad8 <color_printint+0x31>
  } else {
    x = xx;
    2ad2:	8b 45 08             	mov    0x8(%ebp),%eax
    2ad5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2ad8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2adf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2ae2:	8d 41 01             	lea    0x1(%ecx),%eax
    2ae5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2ae8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2aeb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2aee:	ba 00 00 00 00       	mov    $0x0,%edx
    2af3:	f7 f3                	div    %ebx
    2af5:	89 d0                	mov    %edx,%eax
    2af7:	0f b6 80 04 44 00 00 	movzbl 0x4404(%eax),%eax
    2afe:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2b02:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2b05:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b08:	ba 00 00 00 00       	mov    $0x0,%edx
    2b0d:	f7 f3                	div    %ebx
    2b0f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b12:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2b16:	75 c7                	jne    2adf <color_printint+0x38>
  if(neg)
    2b18:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2b1c:	74 36                	je     2b54 <color_printint+0xad>
    buf[i++] = '-';
    2b1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b21:	8d 50 01             	lea    0x1(%eax),%edx
    2b24:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2b27:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2b2c:	eb 26                	jmp    2b54 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2b2e:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2b31:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b34:	01 d0                	add    %edx,%eax
    2b36:	0f b6 00             	movzbl (%eax),%eax
    2b39:	0f be c0             	movsbl %al,%eax
    2b3c:	83 ec 0c             	sub    $0xc,%esp
    2b3f:	ff 75 20             	pushl  0x20(%ebp)
    2b42:	ff 75 1c             	pushl  0x1c(%ebp)
    2b45:	ff 75 18             	pushl  0x18(%ebp)
    2b48:	ff 75 14             	pushl  0x14(%ebp)
    2b4b:	50                   	push   %eax
    2b4c:	e8 2a ff ff ff       	call   2a7b <color_putc>
    2b51:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2b54:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2b58:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b5c:	79 d0                	jns    2b2e <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2b5e:	90                   	nop
    2b5f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b62:	c9                   	leave  
    2b63:	c3                   	ret    

00002b64 <getInteger>:

static int getInteger(double num)
{
    2b64:	55                   	push   %ebp
    2b65:	89 e5                	mov    %esp,%ebp
    2b67:	83 ec 18             	sub    $0x18,%esp
    2b6a:	8b 45 08             	mov    0x8(%ebp),%eax
    2b6d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2b70:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b73:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2b76:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2b7d:	eb 0e                	jmp    2b8d <getInteger+0x29>
  {
    num -= 1;
    2b7f:	dd 45 e8             	fldl   -0x18(%ebp)
    2b82:	d9 e8                	fld1   
    2b84:	de e9                	fsubrp %st,%st(1)
    2b86:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2b89:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2b8d:	dd 45 e8             	fldl   -0x18(%ebp)
    2b90:	d9 e8                	fld1   
    2b92:	d9 c9                	fxch   %st(1)
    2b94:	df e9                	fucomip %st(1),%st
    2b96:	dd d8                	fstp   %st(0)
    2b98:	77 e5                	ja     2b7f <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2b9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2b9d:	c9                   	leave  
    2b9e:	c3                   	ret    

00002b9f <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2b9f:	55                   	push   %ebp
    2ba0:	89 e5                	mov    %esp,%ebp
    2ba2:	83 ec 28             	sub    $0x28,%esp
    2ba5:	8b 45 08             	mov    0x8(%ebp),%eax
    2ba8:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2bab:	8b 45 0c             	mov    0xc(%ebp),%eax
    2bae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2bb1:	d9 ee                	fldz   
    2bb3:	dd 45 e0             	fldl   -0x20(%ebp)
    2bb6:	d9 c9                	fxch   %st(1)
    2bb8:	df e9                	fucomip %st(1),%st
    2bba:	dd d8                	fstp   %st(0)
    2bbc:	76 21                	jbe    2bdf <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2bbe:	83 ec 0c             	sub    $0xc,%esp
    2bc1:	ff 75 1c             	pushl  0x1c(%ebp)
    2bc4:	ff 75 18             	pushl  0x18(%ebp)
    2bc7:	ff 75 14             	pushl  0x14(%ebp)
    2bca:	ff 75 10             	pushl  0x10(%ebp)
    2bcd:	6a 2d                	push   $0x2d
    2bcf:	e8 a7 fe ff ff       	call   2a7b <color_putc>
    2bd4:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2bd7:	dd 45 e0             	fldl   -0x20(%ebp)
    2bda:	d9 e0                	fchs   
    2bdc:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2bdf:	83 ec 08             	sub    $0x8,%esp
    2be2:	ff 75 e4             	pushl  -0x1c(%ebp)
    2be5:	ff 75 e0             	pushl  -0x20(%ebp)
    2be8:	e8 77 ff ff ff       	call   2b64 <getInteger>
    2bed:	83 c4 10             	add    $0x10,%esp
    2bf0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2bf3:	83 ec 04             	sub    $0x4,%esp
    2bf6:	ff 75 1c             	pushl  0x1c(%ebp)
    2bf9:	ff 75 18             	pushl  0x18(%ebp)
    2bfc:	ff 75 14             	pushl  0x14(%ebp)
    2bff:	ff 75 10             	pushl  0x10(%ebp)
    2c02:	6a 01                	push   $0x1
    2c04:	6a 0a                	push   $0xa
    2c06:	ff 75 f0             	pushl  -0x10(%ebp)
    2c09:	e8 99 fe ff ff       	call   2aa7 <color_printint>
    2c0e:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2c11:	db 45 f0             	fildl  -0x10(%ebp)
    2c14:	dd 45 e0             	fldl   -0x20(%ebp)
    2c17:	de e1                	fsubp  %st,%st(1)
    2c19:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2c1c:	dd 45 e0             	fldl   -0x20(%ebp)
    2c1f:	dd 05 68 39 00 00    	fldl   0x3968
    2c25:	d9 c9                	fxch   %st(1)
    2c27:	df e9                	fucomip %st(1),%st
    2c29:	dd d8                	fstp   %st(0)
    2c2b:	76 19                	jbe    2c46 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2c2d:	83 ec 0c             	sub    $0xc,%esp
    2c30:	ff 75 1c             	pushl  0x1c(%ebp)
    2c33:	ff 75 18             	pushl  0x18(%ebp)
    2c36:	ff 75 14             	pushl  0x14(%ebp)
    2c39:	ff 75 10             	pushl  0x10(%ebp)
    2c3c:	6a 2e                	push   $0x2e
    2c3e:	e8 38 fe ff ff       	call   2a7b <color_putc>
    2c43:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2c46:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2c4d:	eb 55                	jmp    2ca4 <color_printdbl+0x105>
  {
    num = num*10;
    2c4f:	dd 45 e0             	fldl   -0x20(%ebp)
    2c52:	dd 05 70 39 00 00    	fldl   0x3970
    2c58:	de c9                	fmulp  %st,%st(1)
    2c5a:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2c5d:	83 ec 08             	sub    $0x8,%esp
    2c60:	ff 75 e4             	pushl  -0x1c(%ebp)
    2c63:	ff 75 e0             	pushl  -0x20(%ebp)
    2c66:	e8 f9 fe ff ff       	call   2b64 <getInteger>
    2c6b:	83 c4 10             	add    $0x10,%esp
    2c6e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2c71:	83 ec 04             	sub    $0x4,%esp
    2c74:	ff 75 1c             	pushl  0x1c(%ebp)
    2c77:	ff 75 18             	pushl  0x18(%ebp)
    2c7a:	ff 75 14             	pushl  0x14(%ebp)
    2c7d:	ff 75 10             	pushl  0x10(%ebp)
    2c80:	6a 01                	push   $0x1
    2c82:	6a 0a                	push   $0xa
    2c84:	ff 75 f0             	pushl  -0x10(%ebp)
    2c87:	e8 1b fe ff ff       	call   2aa7 <color_printint>
    2c8c:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2c8f:	db 45 f0             	fildl  -0x10(%ebp)
    2c92:	dd 45 e0             	fldl   -0x20(%ebp)
    2c95:	de e1                	fsubp  %st,%st(1)
    2c97:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2c9a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2c9e:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2ca2:	7f 13                	jg     2cb7 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2ca4:	dd 45 e0             	fldl   -0x20(%ebp)
    2ca7:	dd 05 68 39 00 00    	fldl   0x3968
    2cad:	d9 c9                	fxch   %st(1)
    2caf:	df e9                	fucomip %st(1),%st
    2cb1:	dd d8                	fstp   %st(0)
    2cb3:	77 9a                	ja     2c4f <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2cb5:	eb 01                	jmp    2cb8 <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2cb7:	90                   	nop
    }
  }
}
    2cb8:	90                   	nop
    2cb9:	c9                   	leave  
    2cba:	c3                   	ret    

00002cbb <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2cbb:	55                   	push   %ebp
    2cbc:	89 e5                	mov    %esp,%ebp
    2cbe:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2cc1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2cc8:	8d 45 18             	lea    0x18(%ebp),%eax
    2ccb:	83 c0 04             	add    $0x4,%eax
    2cce:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2cd1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2cd8:	e9 e2 01 00 00       	jmp    2ebf <color_printf+0x204>
    c = fmt[i] & 0xff;
    2cdd:	8b 55 18             	mov    0x18(%ebp),%edx
    2ce0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ce3:	01 d0                	add    %edx,%eax
    2ce5:	0f b6 00             	movzbl (%eax),%eax
    2ce8:	0f be c0             	movsbl %al,%eax
    2ceb:	25 ff 00 00 00       	and    $0xff,%eax
    2cf0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2cf3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2cf7:	75 35                	jne    2d2e <color_printf+0x73>
      if(c == '%'){
    2cf9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2cfd:	75 0c                	jne    2d0b <color_printf+0x50>
        state = '%';
    2cff:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2d06:	e9 b0 01 00 00       	jmp    2ebb <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2d0b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d0e:	0f be c0             	movsbl %al,%eax
    2d11:	83 ec 0c             	sub    $0xc,%esp
    2d14:	ff 75 14             	pushl  0x14(%ebp)
    2d17:	ff 75 10             	pushl  0x10(%ebp)
    2d1a:	ff 75 0c             	pushl  0xc(%ebp)
    2d1d:	ff 75 08             	pushl  0x8(%ebp)
    2d20:	50                   	push   %eax
    2d21:	e8 55 fd ff ff       	call   2a7b <color_putc>
    2d26:	83 c4 20             	add    $0x20,%esp
    2d29:	e9 8d 01 00 00       	jmp    2ebb <color_printf+0x200>
      }
    } else if(state == '%'){
    2d2e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2d32:	0f 85 83 01 00 00    	jne    2ebb <color_printf+0x200>
      if(c == 'd'){
    2d38:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2d3c:	75 2a                	jne    2d68 <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2d3e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d41:	8b 00                	mov    (%eax),%eax
    2d43:	83 ec 04             	sub    $0x4,%esp
    2d46:	ff 75 14             	pushl  0x14(%ebp)
    2d49:	ff 75 10             	pushl  0x10(%ebp)
    2d4c:	ff 75 0c             	pushl  0xc(%ebp)
    2d4f:	ff 75 08             	pushl  0x8(%ebp)
    2d52:	6a 01                	push   $0x1
    2d54:	6a 0a                	push   $0xa
    2d56:	50                   	push   %eax
    2d57:	e8 4b fd ff ff       	call   2aa7 <color_printint>
    2d5c:	83 c4 20             	add    $0x20,%esp
        ap++;
    2d5f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2d63:	e9 4c 01 00 00       	jmp    2eb4 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2d68:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2d6c:	74 06                	je     2d74 <color_printf+0xb9>
    2d6e:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2d72:	75 2a                	jne    2d9e <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2d74:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d77:	8b 00                	mov    (%eax),%eax
    2d79:	83 ec 04             	sub    $0x4,%esp
    2d7c:	ff 75 14             	pushl  0x14(%ebp)
    2d7f:	ff 75 10             	pushl  0x10(%ebp)
    2d82:	ff 75 0c             	pushl  0xc(%ebp)
    2d85:	ff 75 08             	pushl  0x8(%ebp)
    2d88:	6a 00                	push   $0x0
    2d8a:	6a 10                	push   $0x10
    2d8c:	50                   	push   %eax
    2d8d:	e8 15 fd ff ff       	call   2aa7 <color_printint>
    2d92:	83 c4 20             	add    $0x20,%esp
        ap++;
    2d95:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2d99:	e9 16 01 00 00       	jmp    2eb4 <color_printf+0x1f9>
      } else if(c == 's'){
    2d9e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2da2:	75 4f                	jne    2df3 <color_printf+0x138>
        s = (char*)*ap;
    2da4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2da7:	8b 00                	mov    (%eax),%eax
    2da9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2dac:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2db0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2db4:	75 2e                	jne    2de4 <color_printf+0x129>
          s = "(null)";
    2db6:	c7 45 f4 60 39 00 00 	movl   $0x3960,-0xc(%ebp)
        while(*s != 0){
    2dbd:	eb 25                	jmp    2de4 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2dbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dc2:	0f b6 00             	movzbl (%eax),%eax
    2dc5:	0f be c0             	movsbl %al,%eax
    2dc8:	83 ec 0c             	sub    $0xc,%esp
    2dcb:	ff 75 14             	pushl  0x14(%ebp)
    2dce:	ff 75 10             	pushl  0x10(%ebp)
    2dd1:	ff 75 0c             	pushl  0xc(%ebp)
    2dd4:	ff 75 08             	pushl  0x8(%ebp)
    2dd7:	50                   	push   %eax
    2dd8:	e8 9e fc ff ff       	call   2a7b <color_putc>
    2ddd:	83 c4 20             	add    $0x20,%esp
          s++;
    2de0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2de4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2de7:	0f b6 00             	movzbl (%eax),%eax
    2dea:	84 c0                	test   %al,%al
    2dec:	75 d1                	jne    2dbf <color_printf+0x104>
    2dee:	e9 c1 00 00 00       	jmp    2eb4 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2df3:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2df7:	75 29                	jne    2e22 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2df9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2dfc:	8b 00                	mov    (%eax),%eax
    2dfe:	0f be c0             	movsbl %al,%eax
    2e01:	83 ec 0c             	sub    $0xc,%esp
    2e04:	ff 75 14             	pushl  0x14(%ebp)
    2e07:	ff 75 10             	pushl  0x10(%ebp)
    2e0a:	ff 75 0c             	pushl  0xc(%ebp)
    2e0d:	ff 75 08             	pushl  0x8(%ebp)
    2e10:	50                   	push   %eax
    2e11:	e8 65 fc ff ff       	call   2a7b <color_putc>
    2e16:	83 c4 20             	add    $0x20,%esp
        ap++;
    2e19:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2e1d:	e9 92 00 00 00       	jmp    2eb4 <color_printf+0x1f9>
      } else if(c == '%'){
    2e22:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2e26:	75 20                	jne    2e48 <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2e28:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e2b:	0f be c0             	movsbl %al,%eax
    2e2e:	83 ec 0c             	sub    $0xc,%esp
    2e31:	ff 75 14             	pushl  0x14(%ebp)
    2e34:	ff 75 10             	pushl  0x10(%ebp)
    2e37:	ff 75 0c             	pushl  0xc(%ebp)
    2e3a:	ff 75 08             	pushl  0x8(%ebp)
    2e3d:	50                   	push   %eax
    2e3e:	e8 38 fc ff ff       	call   2a7b <color_putc>
    2e43:	83 c4 20             	add    $0x20,%esp
    2e46:	eb 6c                	jmp    2eb4 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    2e48:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    2e4c:	75 2f                	jne    2e7d <color_printf+0x1c2>
        double *dap = (double*)ap;
    2e4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e51:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    2e54:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2e57:	dd 00                	fldl   (%eax)
    2e59:	83 ec 08             	sub    $0x8,%esp
    2e5c:	ff 75 14             	pushl  0x14(%ebp)
    2e5f:	ff 75 10             	pushl  0x10(%ebp)
    2e62:	ff 75 0c             	pushl  0xc(%ebp)
    2e65:	ff 75 08             	pushl  0x8(%ebp)
    2e68:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2e6c:	dd 1c 24             	fstpl  (%esp)
    2e6f:	e8 2b fd ff ff       	call   2b9f <color_printdbl>
    2e74:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    2e77:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    2e7b:	eb 37                	jmp    2eb4 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    2e7d:	83 ec 0c             	sub    $0xc,%esp
    2e80:	ff 75 14             	pushl  0x14(%ebp)
    2e83:	ff 75 10             	pushl  0x10(%ebp)
    2e86:	ff 75 0c             	pushl  0xc(%ebp)
    2e89:	ff 75 08             	pushl  0x8(%ebp)
    2e8c:	6a 25                	push   $0x25
    2e8e:	e8 e8 fb ff ff       	call   2a7b <color_putc>
    2e93:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    2e96:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e99:	0f be c0             	movsbl %al,%eax
    2e9c:	83 ec 0c             	sub    $0xc,%esp
    2e9f:	ff 75 14             	pushl  0x14(%ebp)
    2ea2:	ff 75 10             	pushl  0x10(%ebp)
    2ea5:	ff 75 0c             	pushl  0xc(%ebp)
    2ea8:	ff 75 08             	pushl  0x8(%ebp)
    2eab:	50                   	push   %eax
    2eac:	e8 ca fb ff ff       	call   2a7b <color_putc>
    2eb1:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    2eb4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2ebb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2ebf:	8b 55 18             	mov    0x18(%ebp),%edx
    2ec2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ec5:	01 d0                	add    %edx,%eax
    2ec7:	0f b6 00             	movzbl (%eax),%eax
    2eca:	84 c0                	test   %al,%al
    2ecc:	0f 85 0b fe ff ff    	jne    2cdd <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    2ed2:	90                   	nop
    2ed3:	c9                   	leave  
    2ed4:	c3                   	ret    

00002ed5 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    2ed5:	55                   	push   %ebp
    2ed6:	89 e5                	mov    %esp,%ebp
    2ed8:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    2edb:	83 ec 0c             	sub    $0xc,%esp
    2ede:	6a 58                	push   $0x58
    2ee0:	e8 b0 d9 ff ff       	call   895 <malloc>
    2ee5:	83 c4 10             	add    $0x10,%esp
    2ee8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2eeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2eee:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2ef4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ef7:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    2efe:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2f01:	c9                   	leave  
    2f02:	c3                   	ret    

00002f03 <pushi>:

void pushi(struct istack *s, int val)
{
    2f03:	55                   	push   %ebp
    2f04:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    2f06:	8b 45 08             	mov    0x8(%ebp),%eax
    2f09:	8b 00                	mov    (%eax),%eax
    2f0b:	83 f8 13             	cmp    $0x13,%eax
    2f0e:	7f 2c                	jg     2f3c <pushi+0x39>
    {
        s->size++;
    2f10:	8b 45 08             	mov    0x8(%ebp),%eax
    2f13:	8b 00                	mov    (%eax),%eax
    2f15:	8d 50 01             	lea    0x1(%eax),%edx
    2f18:	8b 45 08             	mov    0x8(%ebp),%eax
    2f1b:	89 10                	mov    %edx,(%eax)
        s->top++;
    2f1d:	8b 45 08             	mov    0x8(%ebp),%eax
    2f20:	8b 40 54             	mov    0x54(%eax),%eax
    2f23:	8d 50 01             	lea    0x1(%eax),%edx
    2f26:	8b 45 08             	mov    0x8(%ebp),%eax
    2f29:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    2f2c:	8b 45 08             	mov    0x8(%ebp),%eax
    2f2f:	8b 50 54             	mov    0x54(%eax),%edx
    2f32:	8b 45 08             	mov    0x8(%ebp),%eax
    2f35:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2f38:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    2f3c:	90                   	nop
    2f3d:	5d                   	pop    %ebp
    2f3e:	c3                   	ret    

00002f3f <popi>:

int popi(struct istack *s)
{
    2f3f:	55                   	push   %ebp
    2f40:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2f42:	8b 45 08             	mov    0x8(%ebp),%eax
    2f45:	8b 00                	mov    (%eax),%eax
    2f47:	85 c0                	test   %eax,%eax
    2f49:	75 07                	jne    2f52 <popi+0x13>
    {
        return -1;
    2f4b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2f50:	eb 2c                	jmp    2f7e <popi+0x3f>
    }
    s->size--;
    2f52:	8b 45 08             	mov    0x8(%ebp),%eax
    2f55:	8b 00                	mov    (%eax),%eax
    2f57:	8d 50 ff             	lea    -0x1(%eax),%edx
    2f5a:	8b 45 08             	mov    0x8(%ebp),%eax
    2f5d:	89 10                	mov    %edx,(%eax)
    s->top--;
    2f5f:	8b 45 08             	mov    0x8(%ebp),%eax
    2f62:	8b 40 54             	mov    0x54(%eax),%eax
    2f65:	8d 50 ff             	lea    -0x1(%eax),%edx
    2f68:	8b 45 08             	mov    0x8(%ebp),%eax
    2f6b:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    2f6e:	8b 45 08             	mov    0x8(%ebp),%eax
    2f71:	8b 40 54             	mov    0x54(%eax),%eax
    2f74:	8d 50 01             	lea    0x1(%eax),%edx
    2f77:	8b 45 08             	mov    0x8(%ebp),%eax
    2f7a:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2f7e:	5d                   	pop    %ebp
    2f7f:	c3                   	ret    

00002f80 <topi>:

int topi(struct istack* s)
{
    2f80:	55                   	push   %ebp
    2f81:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    2f83:	8b 45 08             	mov    0x8(%ebp),%eax
    2f86:	8b 50 54             	mov    0x54(%eax),%edx
    2f89:	8b 45 08             	mov    0x8(%ebp),%eax
    2f8c:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2f90:	5d                   	pop    %ebp
    2f91:	c3                   	ret    

00002f92 <cstack>:

//constructor
struct cstack* cstack()
{
    2f92:	55                   	push   %ebp
    2f93:	89 e5                	mov    %esp,%ebp
    2f95:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    2f98:	83 ec 0c             	sub    $0xc,%esp
    2f9b:	6a 1c                	push   $0x1c
    2f9d:	e8 f3 d8 ff ff       	call   895 <malloc>
    2fa2:	83 c4 10             	add    $0x10,%esp
    2fa5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2fa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fab:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2fb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fb4:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    2fbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2fbe:	c9                   	leave  
    2fbf:	c3                   	ret    

00002fc0 <pushc>:

void pushc(struct cstack *s, char val)
{
    2fc0:	55                   	push   %ebp
    2fc1:	89 e5                	mov    %esp,%ebp
    2fc3:	83 ec 04             	sub    $0x4,%esp
    2fc6:	8b 45 0c             	mov    0xc(%ebp),%eax
    2fc9:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    2fcc:	8b 45 08             	mov    0x8(%ebp),%eax
    2fcf:	8b 00                	mov    (%eax),%eax
    2fd1:	83 f8 13             	cmp    $0x13,%eax
    2fd4:	7f 2d                	jg     3003 <pushc+0x43>
    {
        s->size++;
    2fd6:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd9:	8b 00                	mov    (%eax),%eax
    2fdb:	8d 50 01             	lea    0x1(%eax),%edx
    2fde:	8b 45 08             	mov    0x8(%ebp),%eax
    2fe1:	89 10                	mov    %edx,(%eax)
        s->top++;
    2fe3:	8b 45 08             	mov    0x8(%ebp),%eax
    2fe6:	8b 40 18             	mov    0x18(%eax),%eax
    2fe9:	8d 50 01             	lea    0x1(%eax),%edx
    2fec:	8b 45 08             	mov    0x8(%ebp),%eax
    2fef:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    2ff2:	8b 45 08             	mov    0x8(%ebp),%eax
    2ff5:	8b 40 18             	mov    0x18(%eax),%eax
    2ff8:	8b 55 08             	mov    0x8(%ebp),%edx
    2ffb:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    2fff:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    3003:	90                   	nop
    3004:	c9                   	leave  
    3005:	c3                   	ret    

00003006 <popc>:

char popc(struct cstack *s)
{
    3006:	55                   	push   %ebp
    3007:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3009:	8b 45 08             	mov    0x8(%ebp),%eax
    300c:	8b 00                	mov    (%eax),%eax
    300e:	85 c0                	test   %eax,%eax
    3010:	75 07                	jne    3019 <popc+0x13>
    {
        return -1;
    3012:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3017:	eb 2d                	jmp    3046 <popc+0x40>
    }
    s->size--;
    3019:	8b 45 08             	mov    0x8(%ebp),%eax
    301c:	8b 00                	mov    (%eax),%eax
    301e:	8d 50 ff             	lea    -0x1(%eax),%edx
    3021:	8b 45 08             	mov    0x8(%ebp),%eax
    3024:	89 10                	mov    %edx,(%eax)
    s->top--;
    3026:	8b 45 08             	mov    0x8(%ebp),%eax
    3029:	8b 40 18             	mov    0x18(%eax),%eax
    302c:	8d 50 ff             	lea    -0x1(%eax),%edx
    302f:	8b 45 08             	mov    0x8(%ebp),%eax
    3032:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    3035:	8b 45 08             	mov    0x8(%ebp),%eax
    3038:	8b 40 18             	mov    0x18(%eax),%eax
    303b:	8d 50 01             	lea    0x1(%eax),%edx
    303e:	8b 45 08             	mov    0x8(%ebp),%eax
    3041:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    3046:	5d                   	pop    %ebp
    3047:	c3                   	ret    

00003048 <topc>:

char topc(struct cstack* s)
{
    3048:	55                   	push   %ebp
    3049:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    304b:	8b 45 08             	mov    0x8(%ebp),%eax
    304e:	8b 40 18             	mov    0x18(%eax),%eax
    3051:	8b 55 08             	mov    0x8(%ebp),%edx
    3054:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    3059:	5d                   	pop    %ebp
    305a:	c3                   	ret    

0000305b <dstack>:

//constructor
struct dstack* dstack()
{
    305b:	55                   	push   %ebp
    305c:	89 e5                	mov    %esp,%ebp
    305e:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    3061:	83 ec 0c             	sub    $0xc,%esp
    3064:	68 a8 00 00 00       	push   $0xa8
    3069:	e8 27 d8 ff ff       	call   895 <malloc>
    306e:	83 c4 10             	add    $0x10,%esp
    3071:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3074:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3077:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    307d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3080:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    3087:	ff ff ff 
    return stack;
    308a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    308d:	c9                   	leave  
    308e:	c3                   	ret    

0000308f <pushd>:

void pushd(struct dstack *s, double val)
{
    308f:	55                   	push   %ebp
    3090:	89 e5                	mov    %esp,%ebp
    3092:	83 ec 08             	sub    $0x8,%esp
    3095:	8b 45 0c             	mov    0xc(%ebp),%eax
    3098:	89 45 f8             	mov    %eax,-0x8(%ebp)
    309b:	8b 45 10             	mov    0x10(%ebp),%eax
    309e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    30a1:	8b 45 08             	mov    0x8(%ebp),%eax
    30a4:	8b 00                	mov    (%eax),%eax
    30a6:	83 f8 13             	cmp    $0x13,%eax
    30a9:	7f 35                	jg     30e0 <pushd+0x51>
    {
        s->size++;
    30ab:	8b 45 08             	mov    0x8(%ebp),%eax
    30ae:	8b 00                	mov    (%eax),%eax
    30b0:	8d 50 01             	lea    0x1(%eax),%edx
    30b3:	8b 45 08             	mov    0x8(%ebp),%eax
    30b6:	89 10                	mov    %edx,(%eax)
        s->top++;
    30b8:	8b 45 08             	mov    0x8(%ebp),%eax
    30bb:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    30c1:	8d 50 01             	lea    0x1(%eax),%edx
    30c4:	8b 45 08             	mov    0x8(%ebp),%eax
    30c7:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    30cd:	8b 45 08             	mov    0x8(%ebp),%eax
    30d0:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    30d6:	8b 45 08             	mov    0x8(%ebp),%eax
    30d9:	dd 45 f8             	fldl   -0x8(%ebp)
    30dc:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    30e0:	90                   	nop
    30e1:	c9                   	leave  
    30e2:	c3                   	ret    

000030e3 <popd>:

double popd(struct dstack *s)
{
    30e3:	55                   	push   %ebp
    30e4:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    30e6:	8b 45 08             	mov    0x8(%ebp),%eax
    30e9:	8b 00                	mov    (%eax),%eax
    30eb:	85 c0                	test   %eax,%eax
    30ed:	75 06                	jne    30f5 <popd+0x12>
    {
        return -1;
    30ef:	d9 e8                	fld1   
    30f1:	d9 e0                	fchs   
    30f3:	eb 35                	jmp    312a <popd+0x47>
    }
    s->size--;
    30f5:	8b 45 08             	mov    0x8(%ebp),%eax
    30f8:	8b 00                	mov    (%eax),%eax
    30fa:	8d 50 ff             	lea    -0x1(%eax),%edx
    30fd:	8b 45 08             	mov    0x8(%ebp),%eax
    3100:	89 10                	mov    %edx,(%eax)
    s->top--;
    3102:	8b 45 08             	mov    0x8(%ebp),%eax
    3105:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    310b:	8d 50 ff             	lea    -0x1(%eax),%edx
    310e:	8b 45 08             	mov    0x8(%ebp),%eax
    3111:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    3117:	8b 45 08             	mov    0x8(%ebp),%eax
    311a:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3120:	8d 50 01             	lea    0x1(%eax),%edx
    3123:	8b 45 08             	mov    0x8(%ebp),%eax
    3126:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    312a:	5d                   	pop    %ebp
    312b:	c3                   	ret    

0000312c <topd>:

double topd(struct dstack* s)
{
    312c:	55                   	push   %ebp
    312d:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    312f:	8b 45 08             	mov    0x8(%ebp),%eax
    3132:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3138:	8b 45 08             	mov    0x8(%ebp),%eax
    313b:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    313f:	5d                   	pop    %ebp
    3140:	c3                   	ret    

00003141 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3141:	55                   	push   %ebp
    3142:	89 e5                	mov    %esp,%ebp
    3144:	53                   	push   %ebx
    3145:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    314b:	83 ec 08             	sub    $0x8,%esp
    314e:	6a 00                	push   $0x0
    3150:	68 78 39 00 00       	push   $0x3978
    3155:	e8 cd d1 ff ff       	call   327 <open>
    315a:	83 c4 10             	add    $0x10,%esp
    315d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3160:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3164:	79 1d                	jns    3183 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    3166:	83 ec 0c             	sub    $0xc,%esp
    3169:	68 82 39 00 00       	push   $0x3982
    316e:	6a 00                	push   $0x0
    3170:	6a 00                	push   $0x0
    3172:	6a 01                	push   $0x1
    3174:	6a 03                	push   $0x3
    3176:	e8 40 fb ff ff       	call   2cbb <color_printf>
    317b:	83 c4 20             	add    $0x20,%esp
    317e:	e9 6d 02 00 00       	jmp    33f0 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    3183:	8b 45 0c             	mov    0xc(%ebp),%eax
    3186:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    318c:	e9 2a 02 00 00       	jmp    33bb <readVariables+0x27a>
  {
    int pos = 0;
    3191:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    3198:	00 00 00 
    while(pos <= n-1)
    319b:	e9 07 02 00 00       	jmp    33a7 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    31a0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    31a7:	eb 24                	jmp    31cd <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    31a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31ac:	8d 50 ff             	lea    -0x1(%eax),%edx
    31af:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    31b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31b8:	01 c8                	add    %ecx,%eax
    31ba:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    31c1:	ff 
    31c2:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    31c9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    31cd:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    31d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31d6:	01 d0                	add    %edx,%eax
    31d8:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    31df:	ff 
    31e0:	3c 3d                	cmp    $0x3d,%al
    31e2:	75 c5                	jne    31a9 <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    31e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31e7:	83 e8 01             	sub    $0x1,%eax
    31ea:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    31f1:	00 
      if(buf[pos] == 'd') //double value
    31f2:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    31f8:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    31ff:	ff 
    3200:	3c 64                	cmp    $0x64,%al
    3202:	0f 85 a0 00 00 00    	jne    32a8 <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    3208:	8b 45 0c             	mov    0xc(%ebp),%eax
    320b:	8b 00                	mov    (%eax),%eax
    320d:	c1 e0 05             	shl    $0x5,%eax
    3210:	89 c2                	mov    %eax,%edx
    3212:	8b 45 08             	mov    0x8(%ebp),%eax
    3215:	01 d0                	add    %edx,%eax
    3217:	8d 50 04             	lea    0x4(%eax),%edx
    321a:	83 ec 08             	sub    $0x8,%esp
    321d:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3223:	50                   	push   %eax
    3224:	52                   	push   %edx
    3225:	e8 8c ce ff ff       	call   b6 <strcpy>
    322a:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    322d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3230:	8d 50 01             	lea    0x1(%eax),%edx
    3233:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3239:	01 d0                	add    %edx,%eax
    323b:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    3241:	83 ec 08             	sub    $0x8,%esp
    3244:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    324a:	50                   	push   %eax
    324b:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3251:	50                   	push   %eax
    3252:	e8 7b d9 ff ff       	call   bd2 <Translation>
    3257:	83 c4 10             	add    $0x10,%esp
    325a:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    325d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3260:	8b 00                	mov    (%eax),%eax
    3262:	c1 e0 05             	shl    $0x5,%eax
    3265:	89 c2                	mov    %eax,%edx
    3267:	8b 45 08             	mov    0x8(%ebp),%eax
    326a:	01 d0                	add    %edx,%eax
    326c:	dd 45 d8             	fldl   -0x28(%ebp)
    326f:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    3272:	8b 45 0c             	mov    0xc(%ebp),%eax
    3275:	8b 00                	mov    (%eax),%eax
    3277:	c1 e0 05             	shl    $0x5,%eax
    327a:	89 c2                	mov    %eax,%edx
    327c:	8b 45 08             	mov    0x8(%ebp),%eax
    327f:	01 d0                	add    %edx,%eax
    3281:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    3287:	8b 45 0c             	mov    0xc(%ebp),%eax
    328a:	8b 00                	mov    (%eax),%eax
    328c:	8d 50 01             	lea    0x1(%eax),%edx
    328f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3292:	89 10                	mov    %edx,(%eax)
        pos++;
    3294:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    329a:	83 c0 01             	add    $0x1,%eax
    329d:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    32a3:	e9 ff 00 00 00       	jmp    33a7 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    32a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    32ab:	8b 00                	mov    (%eax),%eax
    32ad:	c1 e0 05             	shl    $0x5,%eax
    32b0:	89 c2                	mov    %eax,%edx
    32b2:	8b 45 08             	mov    0x8(%ebp),%eax
    32b5:	01 d0                	add    %edx,%eax
    32b7:	8d 50 04             	lea    0x4(%eax),%edx
    32ba:	83 ec 08             	sub    $0x8,%esp
    32bd:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    32c3:	50                   	push   %eax
    32c4:	52                   	push   %edx
    32c5:	e8 ec cd ff ff       	call   b6 <strcpy>
    32ca:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    32cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32d0:	8d 50 01             	lea    0x1(%eax),%edx
    32d3:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32d9:	01 d0                	add    %edx,%eax
    32db:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    32e1:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    32ea:	eb 04                	jmp    32f0 <readVariables+0x1af>
        {
          strend++;
    32ec:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    32f0:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    32f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32f9:	01 d0                	add    %edx,%eax
    32fb:	0f b6 00             	movzbl (%eax),%eax
    32fe:	84 c0                	test   %al,%al
    3300:	75 ea                	jne    32ec <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    3302:	8b 45 0c             	mov    0xc(%ebp),%eax
    3305:	8b 00                	mov    (%eax),%eax
    3307:	c1 e0 05             	shl    $0x5,%eax
    330a:	89 c2                	mov    %eax,%edx
    330c:	8b 45 08             	mov    0x8(%ebp),%eax
    330f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    3312:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3318:	8b 55 f0             	mov    -0x10(%ebp),%edx
    331b:	29 c2                	sub    %eax,%edx
    331d:	89 d0                	mov    %edx,%eax
    331f:	83 c0 01             	add    $0x1,%eax
    3322:	83 ec 0c             	sub    $0xc,%esp
    3325:	50                   	push   %eax
    3326:	e8 6a d5 ff ff       	call   895 <malloc>
    332b:	83 c4 10             	add    $0x10,%esp
    332e:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    3331:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3337:	89 45 ec             	mov    %eax,-0x14(%ebp)
    333a:	eb 35                	jmp    3371 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    333c:	8b 45 0c             	mov    0xc(%ebp),%eax
    333f:	8b 00                	mov    (%eax),%eax
    3341:	c1 e0 05             	shl    $0x5,%eax
    3344:	89 c2                	mov    %eax,%edx
    3346:	8b 45 08             	mov    0x8(%ebp),%eax
    3349:	01 d0                	add    %edx,%eax
    334b:	8b 40 18             	mov    0x18(%eax),%eax
    334e:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3354:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3357:	29 d1                	sub    %edx,%ecx
    3359:	89 ca                	mov    %ecx,%edx
    335b:	01 c2                	add    %eax,%edx
    335d:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    3363:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3366:	01 c8                	add    %ecx,%eax
    3368:	0f b6 00             	movzbl (%eax),%eax
    336b:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    336d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    3371:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3374:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3377:	7e c3                	jle    333c <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    3379:	8b 45 0c             	mov    0xc(%ebp),%eax
    337c:	8b 00                	mov    (%eax),%eax
    337e:	c1 e0 05             	shl    $0x5,%eax
    3381:	89 c2                	mov    %eax,%edx
    3383:	8b 45 08             	mov    0x8(%ebp),%eax
    3386:	01 d0                	add    %edx,%eax
    3388:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    338e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3391:	8b 00                	mov    (%eax),%eax
    3393:	8d 50 01             	lea    0x1(%eax),%edx
    3396:	8b 45 0c             	mov    0xc(%ebp),%eax
    3399:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    339b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    339e:	83 c0 01             	add    $0x1,%eax
    33a1:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    33a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    33aa:	8d 50 ff             	lea    -0x1(%eax),%edx
    33ad:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    33b3:	39 c2                	cmp    %eax,%edx
    33b5:	0f 8d e5 fd ff ff    	jge    31a0 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    33bb:	83 ec 04             	sub    $0x4,%esp
    33be:	68 e8 03 00 00       	push   $0x3e8
    33c3:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    33c9:	50                   	push   %eax
    33ca:	ff 75 e8             	pushl  -0x18(%ebp)
    33cd:	e8 2d cf ff ff       	call   2ff <read>
    33d2:	83 c4 10             	add    $0x10,%esp
    33d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    33d8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    33dc:	0f 8f af fd ff ff    	jg     3191 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    33e2:	83 ec 0c             	sub    $0xc,%esp
    33e5:	ff 75 e8             	pushl  -0x18(%ebp)
    33e8:	e8 22 cf ff ff       	call   30f <close>
    33ed:	83 c4 10             	add    $0x10,%esp
}
    33f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    33f3:	c9                   	leave  
    33f4:	c3                   	ret    

000033f5 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    33f5:	55                   	push   %ebp
    33f6:	89 e5                	mov    %esp,%ebp
    33f8:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    33fe:	83 ec 08             	sub    $0x8,%esp
    3401:	6a 02                	push   $0x2
    3403:	68 78 39 00 00       	push   $0x3978
    3408:	e8 1a cf ff ff       	call   327 <open>
    340d:	83 c4 10             	add    $0x10,%esp
    3410:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3413:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3417:	78 1e                	js     3437 <writeVariables+0x42>
  {
    close(fd);
    3419:	83 ec 0c             	sub    $0xc,%esp
    341c:	ff 75 e4             	pushl  -0x1c(%ebp)
    341f:	e8 eb ce ff ff       	call   30f <close>
    3424:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    3427:	83 ec 0c             	sub    $0xc,%esp
    342a:	68 78 39 00 00       	push   $0x3978
    342f:	e8 03 cf ff ff       	call   337 <unlink>
    3434:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    3437:	83 ec 08             	sub    $0x8,%esp
    343a:	68 02 02 00 00       	push   $0x202
    343f:	68 78 39 00 00       	push   $0x3978
    3444:	e8 de ce ff ff       	call   327 <open>
    3449:	83 c4 10             	add    $0x10,%esp
    344c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    344f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3456:	e9 ff 01 00 00       	jmp    365a <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    345b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    345e:	c1 e0 05             	shl    $0x5,%eax
    3461:	89 c2                	mov    %eax,%edx
    3463:	8b 45 08             	mov    0x8(%ebp),%eax
    3466:	01 d0                	add    %edx,%eax
    3468:	8b 00                	mov    (%eax),%eax
    346a:	83 f8 01             	cmp    $0x1,%eax
    346d:	0f 85 d3 00 00 00    	jne    3546 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    3473:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    347a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    347d:	8d 50 01             	lea    0x1(%eax),%edx
    3480:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3483:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    348a:	64 
      int k=0;
    348b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    3492:	eb 2c                	jmp    34c0 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    3494:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3497:	8d 50 01             	lea    0x1(%eax),%edx
    349a:	89 55 e0             	mov    %edx,-0x20(%ebp)
    349d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    34a0:	89 d1                	mov    %edx,%ecx
    34a2:	c1 e1 05             	shl    $0x5,%ecx
    34a5:	8b 55 08             	mov    0x8(%ebp),%edx
    34a8:	01 d1                	add    %edx,%ecx
    34aa:	8b 55 f0             	mov    -0x10(%ebp),%edx
    34ad:	01 ca                	add    %ecx,%edx
    34af:	83 c2 04             	add    $0x4,%edx
    34b2:	0f b6 12             	movzbl (%edx),%edx
    34b5:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    34bc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    34c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34c3:	c1 e0 05             	shl    $0x5,%eax
    34c6:	89 c2                	mov    %eax,%edx
    34c8:	8b 45 08             	mov    0x8(%ebp),%eax
    34cb:	01 c2                	add    %eax,%edx
    34cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34d0:	01 d0                	add    %edx,%eax
    34d2:	83 c0 04             	add    $0x4,%eax
    34d5:	0f b6 00             	movzbl (%eax),%eax
    34d8:	84 c0                	test   %al,%al
    34da:	75 b8                	jne    3494 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    34dc:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34df:	8d 50 01             	lea    0x1(%eax),%edx
    34e2:	89 55 e0             	mov    %edx,-0x20(%ebp)
    34e5:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    34ec:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    34ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34f0:	c1 e0 05             	shl    $0x5,%eax
    34f3:	89 c2                	mov    %eax,%edx
    34f5:	8b 45 08             	mov    0x8(%ebp),%eax
    34f8:	01 d0                	add    %edx,%eax
    34fa:	dd 40 18             	fldl   0x18(%eax)
    34fd:	8d 45 e0             	lea    -0x20(%ebp),%eax
    3500:	50                   	push   %eax
    3501:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3505:	dd 1c 24             	fstpl  (%esp)
    3508:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    350e:	50                   	push   %eax
    350f:	e8 7d d5 ff ff       	call   a91 <double2str>
    3514:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    3517:	8b 45 e0             	mov    -0x20(%ebp),%eax
    351a:	8d 50 01             	lea    0x1(%eax),%edx
    351d:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3520:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    3527:	00 
      write(fd,buf,pos);
    3528:	8b 45 e0             	mov    -0x20(%ebp),%eax
    352b:	83 ec 04             	sub    $0x4,%esp
    352e:	50                   	push   %eax
    352f:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3535:	50                   	push   %eax
    3536:	ff 75 e4             	pushl  -0x1c(%ebp)
    3539:	e8 c9 cd ff ff       	call   307 <write>
    353e:	83 c4 10             	add    $0x10,%esp
    3541:	e9 10 01 00 00       	jmp    3656 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    3546:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    354d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3550:	8d 50 01             	lea    0x1(%eax),%edx
    3553:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3556:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    355d:	73 
      int k=0;
    355e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    3565:	eb 2c                	jmp    3593 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    3567:	8b 45 ec             	mov    -0x14(%ebp),%eax
    356a:	8d 50 01             	lea    0x1(%eax),%edx
    356d:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3570:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3573:	89 d1                	mov    %edx,%ecx
    3575:	c1 e1 05             	shl    $0x5,%ecx
    3578:	8b 55 08             	mov    0x8(%ebp),%edx
    357b:	01 d1                	add    %edx,%ecx
    357d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3580:	01 ca                	add    %ecx,%edx
    3582:	83 c2 04             	add    $0x4,%edx
    3585:	0f b6 12             	movzbl (%edx),%edx
    3588:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    358f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    3593:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3596:	c1 e0 05             	shl    $0x5,%eax
    3599:	89 c2                	mov    %eax,%edx
    359b:	8b 45 08             	mov    0x8(%ebp),%eax
    359e:	01 c2                	add    %eax,%edx
    35a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    35a3:	01 d0                	add    %edx,%eax
    35a5:	83 c0 04             	add    $0x4,%eax
    35a8:	0f b6 00             	movzbl (%eax),%eax
    35ab:	84 c0                	test   %al,%al
    35ad:	75 b8                	jne    3567 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    35af:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35b2:	8d 50 01             	lea    0x1(%eax),%edx
    35b5:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35b8:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    35bf:	3d 
      k=0;
    35c0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    35c7:	eb 2c                	jmp    35f5 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    35c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35cc:	8d 50 01             	lea    0x1(%eax),%edx
    35cf:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35d2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    35d5:	89 d1                	mov    %edx,%ecx
    35d7:	c1 e1 05             	shl    $0x5,%ecx
    35da:	8b 55 08             	mov    0x8(%ebp),%edx
    35dd:	01 ca                	add    %ecx,%edx
    35df:	8b 4a 18             	mov    0x18(%edx),%ecx
    35e2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    35e5:	01 ca                	add    %ecx,%edx
    35e7:	0f b6 12             	movzbl (%edx),%edx
    35ea:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    35f1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    35f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35f8:	c1 e0 05             	shl    $0x5,%eax
    35fb:	89 c2                	mov    %eax,%edx
    35fd:	8b 45 08             	mov    0x8(%ebp),%eax
    3600:	01 d0                	add    %edx,%eax
    3602:	8b 50 18             	mov    0x18(%eax),%edx
    3605:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3608:	01 d0                	add    %edx,%eax
    360a:	0f b6 00             	movzbl (%eax),%eax
    360d:	84 c0                	test   %al,%al
    360f:	75 b8                	jne    35c9 <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    3611:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3614:	8d 50 01             	lea    0x1(%eax),%edx
    3617:	89 55 ec             	mov    %edx,-0x14(%ebp)
    361a:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    3621:	00 
      write(fd,buf,pos);
    3622:	83 ec 04             	sub    $0x4,%esp
    3625:	ff 75 ec             	pushl  -0x14(%ebp)
    3628:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    362e:	50                   	push   %eax
    362f:	ff 75 e4             	pushl  -0x1c(%ebp)
    3632:	e8 d0 cc ff ff       	call   307 <write>
    3637:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    363a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    363d:	c1 e0 05             	shl    $0x5,%eax
    3640:	89 c2                	mov    %eax,%edx
    3642:	8b 45 08             	mov    0x8(%ebp),%eax
    3645:	01 d0                	add    %edx,%eax
    3647:	8b 40 18             	mov    0x18(%eax),%eax
    364a:	83 ec 0c             	sub    $0xc,%esp
    364d:	50                   	push   %eax
    364e:	e8 00 d1 ff ff       	call   753 <free>
    3653:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    3656:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    365a:	8b 45 0c             	mov    0xc(%ebp),%eax
    365d:	8b 00                	mov    (%eax),%eax
    365f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3662:	0f 8f f3 fd ff ff    	jg     345b <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    3668:	8b 45 0c             	mov    0xc(%ebp),%eax
    366b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    3671:	83 ec 0c             	sub    $0xc,%esp
    3674:	ff 75 e4             	pushl  -0x1c(%ebp)
    3677:	e8 93 cc ff ff       	call   30f <close>
    367c:	83 c4 10             	add    $0x10,%esp
  return;
    367f:	90                   	nop
    3680:	c9                   	leave  
    3681:	c3                   	ret    
