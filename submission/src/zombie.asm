
_zombie：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
      11:	e8 65 02 00 00       	call   27b <fork>
      16:	85 c0                	test   %eax,%eax
      18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
      1a:	83 ec 0c             	sub    $0xc,%esp
      1d:	6a 05                	push   $0x5
      1f:	e8 ef 02 00 00       	call   313 <sleep>
      24:	83 c4 10             	add    $0x10,%esp
  exit();
      27:	e8 57 02 00 00       	call   283 <exit>

0000002c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
      2c:	55                   	push   %ebp
      2d:	89 e5                	mov    %esp,%ebp
      2f:	57                   	push   %edi
      30:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
      31:	8b 4d 08             	mov    0x8(%ebp),%ecx
      34:	8b 55 10             	mov    0x10(%ebp),%edx
      37:	8b 45 0c             	mov    0xc(%ebp),%eax
      3a:	89 cb                	mov    %ecx,%ebx
      3c:	89 df                	mov    %ebx,%edi
      3e:	89 d1                	mov    %edx,%ecx
      40:	fc                   	cld    
      41:	f3 aa                	rep stos %al,%es:(%edi)
      43:	89 ca                	mov    %ecx,%edx
      45:	89 fb                	mov    %edi,%ebx
      47:	89 5d 08             	mov    %ebx,0x8(%ebp)
      4a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
      4d:	90                   	nop
      4e:	5b                   	pop    %ebx
      4f:	5f                   	pop    %edi
      50:	5d                   	pop    %ebp
      51:	c3                   	ret    

00000052 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
      52:	55                   	push   %ebp
      53:	89 e5                	mov    %esp,%ebp
      55:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
      58:	8b 45 08             	mov    0x8(%ebp),%eax
      5b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
      5e:	90                   	nop
      5f:	8b 45 08             	mov    0x8(%ebp),%eax
      62:	8d 50 01             	lea    0x1(%eax),%edx
      65:	89 55 08             	mov    %edx,0x8(%ebp)
      68:	8b 55 0c             	mov    0xc(%ebp),%edx
      6b:	8d 4a 01             	lea    0x1(%edx),%ecx
      6e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
      71:	0f b6 12             	movzbl (%edx),%edx
      74:	88 10                	mov    %dl,(%eax)
      76:	0f b6 00             	movzbl (%eax),%eax
      79:	84 c0                	test   %al,%al
      7b:	75 e2                	jne    5f <strcpy+0xd>
    ;
  return os;
      7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
      80:	c9                   	leave  
      81:	c3                   	ret    

00000082 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      82:	55                   	push   %ebp
      83:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
      85:	eb 08                	jmp    8f <strcmp+0xd>
    p++, q++;
      87:	83 45 08 01          	addl   $0x1,0x8(%ebp)
      8b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      8f:	8b 45 08             	mov    0x8(%ebp),%eax
      92:	0f b6 00             	movzbl (%eax),%eax
      95:	84 c0                	test   %al,%al
      97:	74 10                	je     a9 <strcmp+0x27>
      99:	8b 45 08             	mov    0x8(%ebp),%eax
      9c:	0f b6 10             	movzbl (%eax),%edx
      9f:	8b 45 0c             	mov    0xc(%ebp),%eax
      a2:	0f b6 00             	movzbl (%eax),%eax
      a5:	38 c2                	cmp    %al,%dl
      a7:	74 de                	je     87 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
      a9:	8b 45 08             	mov    0x8(%ebp),%eax
      ac:	0f b6 00             	movzbl (%eax),%eax
      af:	0f b6 d0             	movzbl %al,%edx
      b2:	8b 45 0c             	mov    0xc(%ebp),%eax
      b5:	0f b6 00             	movzbl (%eax),%eax
      b8:	0f b6 c0             	movzbl %al,%eax
      bb:	29 c2                	sub    %eax,%edx
      bd:	89 d0                	mov    %edx,%eax
}
      bf:	5d                   	pop    %ebp
      c0:	c3                   	ret    

000000c1 <strlen>:

uint
strlen(char *s)
{
      c1:	55                   	push   %ebp
      c2:	89 e5                	mov    %esp,%ebp
      c4:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
      c7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
      ce:	eb 04                	jmp    d4 <strlen+0x13>
      d0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
      d4:	8b 55 fc             	mov    -0x4(%ebp),%edx
      d7:	8b 45 08             	mov    0x8(%ebp),%eax
      da:	01 d0                	add    %edx,%eax
      dc:	0f b6 00             	movzbl (%eax),%eax
      df:	84 c0                	test   %al,%al
      e1:	75 ed                	jne    d0 <strlen+0xf>
    ;
  return n;
      e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
      e6:	c9                   	leave  
      e7:	c3                   	ret    

000000e8 <memset>:

void*
memset(void *dst, int c, uint n)
{
      e8:	55                   	push   %ebp
      e9:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
      eb:	8b 45 10             	mov    0x10(%ebp),%eax
      ee:	50                   	push   %eax
      ef:	ff 75 0c             	pushl  0xc(%ebp)
      f2:	ff 75 08             	pushl  0x8(%ebp)
      f5:	e8 32 ff ff ff       	call   2c <stosb>
      fa:	83 c4 0c             	add    $0xc,%esp
  return dst;
      fd:	8b 45 08             	mov    0x8(%ebp),%eax
}
     100:	c9                   	leave  
     101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
     102:	55                   	push   %ebp
     103:	89 e5                	mov    %esp,%ebp
     105:	83 ec 04             	sub    $0x4,%esp
     108:	8b 45 0c             	mov    0xc(%ebp),%eax
     10b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     10e:	eb 14                	jmp    124 <strchr+0x22>
    if(*s == c)
     110:	8b 45 08             	mov    0x8(%ebp),%eax
     113:	0f b6 00             	movzbl (%eax),%eax
     116:	3a 45 fc             	cmp    -0x4(%ebp),%al
     119:	75 05                	jne    120 <strchr+0x1e>
      return (char*)s;
     11b:	8b 45 08             	mov    0x8(%ebp),%eax
     11e:	eb 13                	jmp    133 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     120:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     124:	8b 45 08             	mov    0x8(%ebp),%eax
     127:	0f b6 00             	movzbl (%eax),%eax
     12a:	84 c0                	test   %al,%al
     12c:	75 e2                	jne    110 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     12e:	b8 00 00 00 00       	mov    $0x0,%eax
}
     133:	c9                   	leave  
     134:	c3                   	ret    

00000135 <gets>:

char*
gets(char *buf, int max)
{
     135:	55                   	push   %ebp
     136:	89 e5                	mov    %esp,%ebp
     138:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     13b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     142:	eb 42                	jmp    186 <gets+0x51>
    cc = read(0, &c, 1);
     144:	83 ec 04             	sub    $0x4,%esp
     147:	6a 01                	push   $0x1
     149:	8d 45 ef             	lea    -0x11(%ebp),%eax
     14c:	50                   	push   %eax
     14d:	6a 00                	push   $0x0
     14f:	e8 47 01 00 00       	call   29b <read>
     154:	83 c4 10             	add    $0x10,%esp
     157:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     15a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     15e:	7e 33                	jle    193 <gets+0x5e>
      break;
    buf[i++] = c;
     160:	8b 45 f4             	mov    -0xc(%ebp),%eax
     163:	8d 50 01             	lea    0x1(%eax),%edx
     166:	89 55 f4             	mov    %edx,-0xc(%ebp)
     169:	89 c2                	mov    %eax,%edx
     16b:	8b 45 08             	mov    0x8(%ebp),%eax
     16e:	01 c2                	add    %eax,%edx
     170:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     174:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     176:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     17a:	3c 0a                	cmp    $0xa,%al
     17c:	74 16                	je     194 <gets+0x5f>
     17e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     182:	3c 0d                	cmp    $0xd,%al
     184:	74 0e                	je     194 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     186:	8b 45 f4             	mov    -0xc(%ebp),%eax
     189:	83 c0 01             	add    $0x1,%eax
     18c:	3b 45 0c             	cmp    0xc(%ebp),%eax
     18f:	7c b3                	jl     144 <gets+0xf>
     191:	eb 01                	jmp    194 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     193:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     194:	8b 55 f4             	mov    -0xc(%ebp),%edx
     197:	8b 45 08             	mov    0x8(%ebp),%eax
     19a:	01 d0                	add    %edx,%eax
     19c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     19f:	8b 45 08             	mov    0x8(%ebp),%eax
}
     1a2:	c9                   	leave  
     1a3:	c3                   	ret    

000001a4 <stat>:

int
stat(char *n, struct stat *st)
{
     1a4:	55                   	push   %ebp
     1a5:	89 e5                	mov    %esp,%ebp
     1a7:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     1aa:	83 ec 08             	sub    $0x8,%esp
     1ad:	6a 00                	push   $0x0
     1af:	ff 75 08             	pushl  0x8(%ebp)
     1b2:	e8 0c 01 00 00       	call   2c3 <open>
     1b7:	83 c4 10             	add    $0x10,%esp
     1ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     1bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     1c1:	79 07                	jns    1ca <stat+0x26>
    return -1;
     1c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     1c8:	eb 25                	jmp    1ef <stat+0x4b>
  r = fstat(fd, st);
     1ca:	83 ec 08             	sub    $0x8,%esp
     1cd:	ff 75 0c             	pushl  0xc(%ebp)
     1d0:	ff 75 f4             	pushl  -0xc(%ebp)
     1d3:	e8 03 01 00 00       	call   2db <fstat>
     1d8:	83 c4 10             	add    $0x10,%esp
     1db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     1de:	83 ec 0c             	sub    $0xc,%esp
     1e1:	ff 75 f4             	pushl  -0xc(%ebp)
     1e4:	e8 c2 00 00 00       	call   2ab <close>
     1e9:	83 c4 10             	add    $0x10,%esp
  return r;
     1ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     1ef:	c9                   	leave  
     1f0:	c3                   	ret    

000001f1 <atoi>:

int
atoi(const char *s)
{
     1f1:	55                   	push   %ebp
     1f2:	89 e5                	mov    %esp,%ebp
     1f4:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     1f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     1fe:	eb 25                	jmp    225 <atoi+0x34>
    n = n*10 + *s++ - '0';
     200:	8b 55 fc             	mov    -0x4(%ebp),%edx
     203:	89 d0                	mov    %edx,%eax
     205:	c1 e0 02             	shl    $0x2,%eax
     208:	01 d0                	add    %edx,%eax
     20a:	01 c0                	add    %eax,%eax
     20c:	89 c1                	mov    %eax,%ecx
     20e:	8b 45 08             	mov    0x8(%ebp),%eax
     211:	8d 50 01             	lea    0x1(%eax),%edx
     214:	89 55 08             	mov    %edx,0x8(%ebp)
     217:	0f b6 00             	movzbl (%eax),%eax
     21a:	0f be c0             	movsbl %al,%eax
     21d:	01 c8                	add    %ecx,%eax
     21f:	83 e8 30             	sub    $0x30,%eax
     222:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     225:	8b 45 08             	mov    0x8(%ebp),%eax
     228:	0f b6 00             	movzbl (%eax),%eax
     22b:	3c 2f                	cmp    $0x2f,%al
     22d:	7e 0a                	jle    239 <atoi+0x48>
     22f:	8b 45 08             	mov    0x8(%ebp),%eax
     232:	0f b6 00             	movzbl (%eax),%eax
     235:	3c 39                	cmp    $0x39,%al
     237:	7e c7                	jle    200 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     239:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     23c:	c9                   	leave  
     23d:	c3                   	ret    

0000023e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     23e:	55                   	push   %ebp
     23f:	89 e5                	mov    %esp,%ebp
     241:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     244:	8b 45 08             	mov    0x8(%ebp),%eax
     247:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     24a:	8b 45 0c             	mov    0xc(%ebp),%eax
     24d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     250:	eb 17                	jmp    269 <memmove+0x2b>
    *dst++ = *src++;
     252:	8b 45 fc             	mov    -0x4(%ebp),%eax
     255:	8d 50 01             	lea    0x1(%eax),%edx
     258:	89 55 fc             	mov    %edx,-0x4(%ebp)
     25b:	8b 55 f8             	mov    -0x8(%ebp),%edx
     25e:	8d 4a 01             	lea    0x1(%edx),%ecx
     261:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     264:	0f b6 12             	movzbl (%edx),%edx
     267:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     269:	8b 45 10             	mov    0x10(%ebp),%eax
     26c:	8d 50 ff             	lea    -0x1(%eax),%edx
     26f:	89 55 10             	mov    %edx,0x10(%ebp)
     272:	85 c0                	test   %eax,%eax
     274:	7f dc                	jg     252 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     276:	8b 45 08             	mov    0x8(%ebp),%eax
}
     279:	c9                   	leave  
     27a:	c3                   	ret    

0000027b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     27b:	b8 01 00 00 00       	mov    $0x1,%eax
     280:	cd 40                	int    $0x40
     282:	c3                   	ret    

00000283 <exit>:
SYSCALL(exit)
     283:	b8 02 00 00 00       	mov    $0x2,%eax
     288:	cd 40                	int    $0x40
     28a:	c3                   	ret    

0000028b <wait>:
SYSCALL(wait)
     28b:	b8 03 00 00 00       	mov    $0x3,%eax
     290:	cd 40                	int    $0x40
     292:	c3                   	ret    

00000293 <pipe>:
SYSCALL(pipe)
     293:	b8 04 00 00 00       	mov    $0x4,%eax
     298:	cd 40                	int    $0x40
     29a:	c3                   	ret    

0000029b <read>:
SYSCALL(read)
     29b:	b8 05 00 00 00       	mov    $0x5,%eax
     2a0:	cd 40                	int    $0x40
     2a2:	c3                   	ret    

000002a3 <write>:
SYSCALL(write)
     2a3:	b8 10 00 00 00       	mov    $0x10,%eax
     2a8:	cd 40                	int    $0x40
     2aa:	c3                   	ret    

000002ab <close>:
SYSCALL(close)
     2ab:	b8 15 00 00 00       	mov    $0x15,%eax
     2b0:	cd 40                	int    $0x40
     2b2:	c3                   	ret    

000002b3 <kill>:
SYSCALL(kill)
     2b3:	b8 06 00 00 00       	mov    $0x6,%eax
     2b8:	cd 40                	int    $0x40
     2ba:	c3                   	ret    

000002bb <exec>:
SYSCALL(exec)
     2bb:	b8 07 00 00 00       	mov    $0x7,%eax
     2c0:	cd 40                	int    $0x40
     2c2:	c3                   	ret    

000002c3 <open>:
SYSCALL(open)
     2c3:	b8 0f 00 00 00       	mov    $0xf,%eax
     2c8:	cd 40                	int    $0x40
     2ca:	c3                   	ret    

000002cb <mknod>:
SYSCALL(mknod)
     2cb:	b8 11 00 00 00       	mov    $0x11,%eax
     2d0:	cd 40                	int    $0x40
     2d2:	c3                   	ret    

000002d3 <unlink>:
SYSCALL(unlink)
     2d3:	b8 12 00 00 00       	mov    $0x12,%eax
     2d8:	cd 40                	int    $0x40
     2da:	c3                   	ret    

000002db <fstat>:
SYSCALL(fstat)
     2db:	b8 08 00 00 00       	mov    $0x8,%eax
     2e0:	cd 40                	int    $0x40
     2e2:	c3                   	ret    

000002e3 <link>:
SYSCALL(link)
     2e3:	b8 13 00 00 00       	mov    $0x13,%eax
     2e8:	cd 40                	int    $0x40
     2ea:	c3                   	ret    

000002eb <mkdir>:
SYSCALL(mkdir)
     2eb:	b8 14 00 00 00       	mov    $0x14,%eax
     2f0:	cd 40                	int    $0x40
     2f2:	c3                   	ret    

000002f3 <chdir>:
SYSCALL(chdir)
     2f3:	b8 09 00 00 00       	mov    $0x9,%eax
     2f8:	cd 40                	int    $0x40
     2fa:	c3                   	ret    

000002fb <dup>:
SYSCALL(dup)
     2fb:	b8 0a 00 00 00       	mov    $0xa,%eax
     300:	cd 40                	int    $0x40
     302:	c3                   	ret    

00000303 <getpid>:
SYSCALL(getpid)
     303:	b8 0b 00 00 00       	mov    $0xb,%eax
     308:	cd 40                	int    $0x40
     30a:	c3                   	ret    

0000030b <sbrk>:
SYSCALL(sbrk)
     30b:	b8 0c 00 00 00       	mov    $0xc,%eax
     310:	cd 40                	int    $0x40
     312:	c3                   	ret    

00000313 <sleep>:
SYSCALL(sleep)
     313:	b8 0d 00 00 00       	mov    $0xd,%eax
     318:	cd 40                	int    $0x40
     31a:	c3                   	ret    

0000031b <uptime>:
SYSCALL(uptime)
     31b:	b8 0e 00 00 00       	mov    $0xe,%eax
     320:	cd 40                	int    $0x40
     322:	c3                   	ret    

00000323 <colorwrite>:

//new here
SYSCALL(colorwrite)
     323:	b8 16 00 00 00       	mov    $0x16,%eax
     328:	cd 40                	int    $0x40
     32a:	c3                   	ret    

0000032b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     32b:	55                   	push   %ebp
     32c:	89 e5                	mov    %esp,%ebp
     32e:	83 ec 18             	sub    $0x18,%esp
     331:	8b 45 0c             	mov    0xc(%ebp),%eax
     334:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     337:	83 ec 04             	sub    $0x4,%esp
     33a:	6a 01                	push   $0x1
     33c:	8d 45 f4             	lea    -0xc(%ebp),%eax
     33f:	50                   	push   %eax
     340:	ff 75 08             	pushl  0x8(%ebp)
     343:	e8 5b ff ff ff       	call   2a3 <write>
     348:	83 c4 10             	add    $0x10,%esp
}
     34b:	90                   	nop
     34c:	c9                   	leave  
     34d:	c3                   	ret    

0000034e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     34e:	55                   	push   %ebp
     34f:	89 e5                	mov    %esp,%ebp
     351:	53                   	push   %ebx
     352:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     355:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     35c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     360:	74 17                	je     379 <printint+0x2b>
     362:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     366:	79 11                	jns    379 <printint+0x2b>
    neg = 1;
     368:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     36f:	8b 45 0c             	mov    0xc(%ebp),%eax
     372:	f7 d8                	neg    %eax
     374:	89 45 ec             	mov    %eax,-0x14(%ebp)
     377:	eb 06                	jmp    37f <printint+0x31>
  } else {
    x = xx;
     379:	8b 45 0c             	mov    0xc(%ebp),%eax
     37c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     37f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     386:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     389:	8d 41 01             	lea    0x1(%ecx),%eax
     38c:	89 45 f4             	mov    %eax,-0xc(%ebp)
     38f:	8b 5d 10             	mov    0x10(%ebp),%ebx
     392:	8b 45 ec             	mov    -0x14(%ebp),%eax
     395:	ba 00 00 00 00       	mov    $0x0,%edx
     39a:	f7 f3                	div    %ebx
     39c:	89 d0                	mov    %edx,%eax
     39e:	0f b6 80 40 42 00 00 	movzbl 0x4240(%eax),%eax
     3a5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     3a9:	8b 5d 10             	mov    0x10(%ebp),%ebx
     3ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3af:	ba 00 00 00 00       	mov    $0x0,%edx
     3b4:	f7 f3                	div    %ebx
     3b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
     3b9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     3bd:	75 c7                	jne    386 <printint+0x38>
  if(neg)
     3bf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     3c3:	74 2d                	je     3f2 <printint+0xa4>
    buf[i++] = '-';
     3c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3c8:	8d 50 01             	lea    0x1(%eax),%edx
     3cb:	89 55 f4             	mov    %edx,-0xc(%ebp)
     3ce:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     3d3:	eb 1d                	jmp    3f2 <printint+0xa4>
    putc(fd, buf[i]);
     3d5:	8d 55 dc             	lea    -0x24(%ebp),%edx
     3d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3db:	01 d0                	add    %edx,%eax
     3dd:	0f b6 00             	movzbl (%eax),%eax
     3e0:	0f be c0             	movsbl %al,%eax
     3e3:	83 ec 08             	sub    $0x8,%esp
     3e6:	50                   	push   %eax
     3e7:	ff 75 08             	pushl  0x8(%ebp)
     3ea:	e8 3c ff ff ff       	call   32b <putc>
     3ef:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     3f2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     3f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     3fa:	79 d9                	jns    3d5 <printint+0x87>
    putc(fd, buf[i]);
}
     3fc:	90                   	nop
     3fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     400:	c9                   	leave  
     401:	c3                   	ret    

00000402 <getInteger>:

static int getInteger(double num)
{
     402:	55                   	push   %ebp
     403:	89 e5                	mov    %esp,%ebp
     405:	83 ec 18             	sub    $0x18,%esp
     408:	8b 45 08             	mov    0x8(%ebp),%eax
     40b:	89 45 e8             	mov    %eax,-0x18(%ebp)
     40e:	8b 45 0c             	mov    0xc(%ebp),%eax
     411:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     414:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     41b:	eb 0e                	jmp    42b <getInteger+0x29>
  {
    num -= 1;
     41d:	dd 45 e8             	fldl   -0x18(%ebp)
     420:	d9 e8                	fld1   
     422:	de e9                	fsubrp %st,%st(1)
     424:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     427:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     42b:	dd 45 e8             	fldl   -0x18(%ebp)
     42e:	d9 e8                	fld1   
     430:	d9 c9                	fxch   %st(1)
     432:	df e9                	fucomip %st(1),%st
     434:	dd d8                	fstp   %st(0)
     436:	77 e5                	ja     41d <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     438:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     43b:	c9                   	leave  
     43c:	c3                   	ret    

0000043d <printdbl>:

void printdbl(int fd, double num)
{
     43d:	55                   	push   %ebp
     43e:	89 e5                	mov    %esp,%ebp
     440:	83 ec 28             	sub    $0x28,%esp
     443:	8b 45 0c             	mov    0xc(%ebp),%eax
     446:	89 45 e0             	mov    %eax,-0x20(%ebp)
     449:	8b 45 10             	mov    0x10(%ebp),%eax
     44c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     44f:	d9 ee                	fldz   
     451:	dd 45 e0             	fldl   -0x20(%ebp)
     454:	d9 c9                	fxch   %st(1)
     456:	df e9                	fucomip %st(1),%st
     458:	dd d8                	fstp   %st(0)
     45a:	76 18                	jbe    474 <printdbl+0x37>
  {
    putc(fd,'-');
     45c:	83 ec 08             	sub    $0x8,%esp
     45f:	6a 2d                	push   $0x2d
     461:	ff 75 08             	pushl  0x8(%ebp)
     464:	e8 c2 fe ff ff       	call   32b <putc>
     469:	83 c4 10             	add    $0x10,%esp
    num = -num;
     46c:	dd 45 e0             	fldl   -0x20(%ebp)
     46f:	d9 e0                	fchs   
     471:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     474:	83 ec 08             	sub    $0x8,%esp
     477:	ff 75 e4             	pushl  -0x1c(%ebp)
     47a:	ff 75 e0             	pushl  -0x20(%ebp)
     47d:	e8 80 ff ff ff       	call   402 <getInteger>
     482:	83 c4 10             	add    $0x10,%esp
     485:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     488:	6a 01                	push   $0x1
     48a:	6a 0a                	push   $0xa
     48c:	ff 75 f0             	pushl  -0x10(%ebp)
     48f:	ff 75 08             	pushl  0x8(%ebp)
     492:	e8 b7 fe ff ff       	call   34e <printint>
     497:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     49a:	db 45 f0             	fildl  -0x10(%ebp)
     49d:	dd 45 e0             	fldl   -0x20(%ebp)
     4a0:	de e1                	fsubp  %st,%st(1)
     4a2:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     4a5:	dd 45 e0             	fldl   -0x20(%ebp)
     4a8:	dd 05 28 36 00 00    	fldl   0x3628
     4ae:	d9 c9                	fxch   %st(1)
     4b0:	df e9                	fucomip %st(1),%st
     4b2:	dd d8                	fstp   %st(0)
     4b4:	76 10                	jbe    4c6 <printdbl+0x89>
    putc(fd,'.');
     4b6:	83 ec 08             	sub    $0x8,%esp
     4b9:	6a 2e                	push   $0x2e
     4bb:	ff 75 08             	pushl  0x8(%ebp)
     4be:	e8 68 fe ff ff       	call   32b <putc>
     4c3:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     4c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     4cd:	eb 49                	jmp    518 <printdbl+0xdb>
  {
    num = num*10;
     4cf:	dd 45 e0             	fldl   -0x20(%ebp)
     4d2:	dd 05 30 36 00 00    	fldl   0x3630
     4d8:	de c9                	fmulp  %st,%st(1)
     4da:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     4dd:	83 ec 08             	sub    $0x8,%esp
     4e0:	ff 75 e4             	pushl  -0x1c(%ebp)
     4e3:	ff 75 e0             	pushl  -0x20(%ebp)
     4e6:	e8 17 ff ff ff       	call   402 <getInteger>
     4eb:	83 c4 10             	add    $0x10,%esp
     4ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     4f1:	6a 01                	push   $0x1
     4f3:	6a 0a                	push   $0xa
     4f5:	ff 75 f0             	pushl  -0x10(%ebp)
     4f8:	ff 75 08             	pushl  0x8(%ebp)
     4fb:	e8 4e fe ff ff       	call   34e <printint>
     500:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     503:	db 45 f0             	fildl  -0x10(%ebp)
     506:	dd 45 e0             	fldl   -0x20(%ebp)
     509:	de e1                	fsubp  %st,%st(1)
     50b:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     50e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     512:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     516:	7f 13                	jg     52b <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     518:	dd 45 e0             	fldl   -0x20(%ebp)
     51b:	dd 05 28 36 00 00    	fldl   0x3628
     521:	d9 c9                	fxch   %st(1)
     523:	df e9                	fucomip %st(1),%st
     525:	dd d8                	fstp   %st(0)
     527:	77 a6                	ja     4cf <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     529:	eb 01                	jmp    52c <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     52b:	90                   	nop
    }
  }
}
     52c:	90                   	nop
     52d:	c9                   	leave  
     52e:	c3                   	ret    

0000052f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     52f:	55                   	push   %ebp
     530:	89 e5                	mov    %esp,%ebp
     532:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     535:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     53c:	8d 45 0c             	lea    0xc(%ebp),%eax
     53f:	83 c0 04             	add    $0x4,%eax
     542:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     545:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     54c:	e9 88 01 00 00       	jmp    6d9 <printf+0x1aa>
    c = fmt[i] & 0xff;
     551:	8b 55 0c             	mov    0xc(%ebp),%edx
     554:	8b 45 f0             	mov    -0x10(%ebp),%eax
     557:	01 d0                	add    %edx,%eax
     559:	0f b6 00             	movzbl (%eax),%eax
     55c:	0f be c0             	movsbl %al,%eax
     55f:	25 ff 00 00 00       	and    $0xff,%eax
     564:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     567:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     56b:	75 2c                	jne    599 <printf+0x6a>
      if(c == '%'){
     56d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     571:	75 0c                	jne    57f <printf+0x50>
        state = '%';
     573:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     57a:	e9 56 01 00 00       	jmp    6d5 <printf+0x1a6>
      } else {
        putc(fd, c);
     57f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     582:	0f be c0             	movsbl %al,%eax
     585:	83 ec 08             	sub    $0x8,%esp
     588:	50                   	push   %eax
     589:	ff 75 08             	pushl  0x8(%ebp)
     58c:	e8 9a fd ff ff       	call   32b <putc>
     591:	83 c4 10             	add    $0x10,%esp
     594:	e9 3c 01 00 00       	jmp    6d5 <printf+0x1a6>
      }
    } else if(state == '%'){
     599:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     59d:	0f 85 32 01 00 00    	jne    6d5 <printf+0x1a6>
      if(c == 'd'){
     5a3:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     5a7:	75 1e                	jne    5c7 <printf+0x98>
        printint(fd, *ap, 10, 1);
     5a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     5ac:	8b 00                	mov    (%eax),%eax
     5ae:	6a 01                	push   $0x1
     5b0:	6a 0a                	push   $0xa
     5b2:	50                   	push   %eax
     5b3:	ff 75 08             	pushl  0x8(%ebp)
     5b6:	e8 93 fd ff ff       	call   34e <printint>
     5bb:	83 c4 10             	add    $0x10,%esp
        ap++;
     5be:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     5c2:	e9 07 01 00 00       	jmp    6ce <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     5c7:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     5cb:	74 06                	je     5d3 <printf+0xa4>
     5cd:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     5d1:	75 1e                	jne    5f1 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     5d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
     5d6:	8b 00                	mov    (%eax),%eax
     5d8:	6a 00                	push   $0x0
     5da:	6a 10                	push   $0x10
     5dc:	50                   	push   %eax
     5dd:	ff 75 08             	pushl  0x8(%ebp)
     5e0:	e8 69 fd ff ff       	call   34e <printint>
     5e5:	83 c4 10             	add    $0x10,%esp
        ap++;
     5e8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     5ec:	e9 dd 00 00 00       	jmp    6ce <printf+0x19f>
      } else if(c == 's'){
     5f1:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     5f5:	75 46                	jne    63d <printf+0x10e>
        s = (char*)*ap;
     5f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
     5fa:	8b 00                	mov    (%eax),%eax
     5fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     5ff:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     603:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     607:	75 25                	jne    62e <printf+0xff>
          s = "(null)";
     609:	c7 45 f4 20 36 00 00 	movl   $0x3620,-0xc(%ebp)
        while(*s != 0){
     610:	eb 1c                	jmp    62e <printf+0xff>
          putc(fd, *s);
     612:	8b 45 f4             	mov    -0xc(%ebp),%eax
     615:	0f b6 00             	movzbl (%eax),%eax
     618:	0f be c0             	movsbl %al,%eax
     61b:	83 ec 08             	sub    $0x8,%esp
     61e:	50                   	push   %eax
     61f:	ff 75 08             	pushl  0x8(%ebp)
     622:	e8 04 fd ff ff       	call   32b <putc>
     627:	83 c4 10             	add    $0x10,%esp
          s++;
     62a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     62e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     631:	0f b6 00             	movzbl (%eax),%eax
     634:	84 c0                	test   %al,%al
     636:	75 da                	jne    612 <printf+0xe3>
     638:	e9 91 00 00 00       	jmp    6ce <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     63d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     641:	75 1d                	jne    660 <printf+0x131>
        putc(fd, *ap);
     643:	8b 45 e8             	mov    -0x18(%ebp),%eax
     646:	8b 00                	mov    (%eax),%eax
     648:	0f be c0             	movsbl %al,%eax
     64b:	83 ec 08             	sub    $0x8,%esp
     64e:	50                   	push   %eax
     64f:	ff 75 08             	pushl  0x8(%ebp)
     652:	e8 d4 fc ff ff       	call   32b <putc>
     657:	83 c4 10             	add    $0x10,%esp
        ap++;
     65a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     65e:	eb 6e                	jmp    6ce <printf+0x19f>
      } else if(c == '%'){
     660:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     664:	75 17                	jne    67d <printf+0x14e>
        putc(fd, c);
     666:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     669:	0f be c0             	movsbl %al,%eax
     66c:	83 ec 08             	sub    $0x8,%esp
     66f:	50                   	push   %eax
     670:	ff 75 08             	pushl  0x8(%ebp)
     673:	e8 b3 fc ff ff       	call   32b <putc>
     678:	83 c4 10             	add    $0x10,%esp
     67b:	eb 51                	jmp    6ce <printf+0x19f>
      } else if(c == 'f'){ //for double
     67d:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     681:	75 26                	jne    6a9 <printf+0x17a>
        double *dap = (double*)ap;
     683:	8b 45 e8             	mov    -0x18(%ebp),%eax
     686:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     689:	8b 45 e0             	mov    -0x20(%ebp),%eax
     68c:	dd 00                	fldl   (%eax)
     68e:	83 ec 04             	sub    $0x4,%esp
     691:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     695:	dd 1c 24             	fstpl  (%esp)
     698:	ff 75 08             	pushl  0x8(%ebp)
     69b:	e8 9d fd ff ff       	call   43d <printdbl>
     6a0:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     6a3:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     6a7:	eb 25                	jmp    6ce <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     6a9:	83 ec 08             	sub    $0x8,%esp
     6ac:	6a 25                	push   $0x25
     6ae:	ff 75 08             	pushl  0x8(%ebp)
     6b1:	e8 75 fc ff ff       	call   32b <putc>
     6b6:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     6b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6bc:	0f be c0             	movsbl %al,%eax
     6bf:	83 ec 08             	sub    $0x8,%esp
     6c2:	50                   	push   %eax
     6c3:	ff 75 08             	pushl  0x8(%ebp)
     6c6:	e8 60 fc ff ff       	call   32b <putc>
     6cb:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     6ce:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     6d5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     6d9:	8b 55 0c             	mov    0xc(%ebp),%edx
     6dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
     6df:	01 d0                	add    %edx,%eax
     6e1:	0f b6 00             	movzbl (%eax),%eax
     6e4:	84 c0                	test   %al,%al
     6e6:	0f 85 65 fe ff ff    	jne    551 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     6ec:	90                   	nop
     6ed:	c9                   	leave  
     6ee:	c3                   	ret    

000006ef <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     6ef:	55                   	push   %ebp
     6f0:	89 e5                	mov    %esp,%ebp
     6f2:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     6f5:	8b 45 08             	mov    0x8(%ebp),%eax
     6f8:	83 e8 08             	sub    $0x8,%eax
     6fb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6fe:	a1 88 43 00 00       	mov    0x4388,%eax
     703:	89 45 fc             	mov    %eax,-0x4(%ebp)
     706:	eb 24                	jmp    72c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     708:	8b 45 fc             	mov    -0x4(%ebp),%eax
     70b:	8b 00                	mov    (%eax),%eax
     70d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     710:	77 12                	ja     724 <free+0x35>
     712:	8b 45 f8             	mov    -0x8(%ebp),%eax
     715:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     718:	77 24                	ja     73e <free+0x4f>
     71a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     71d:	8b 00                	mov    (%eax),%eax
     71f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     722:	77 1a                	ja     73e <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     724:	8b 45 fc             	mov    -0x4(%ebp),%eax
     727:	8b 00                	mov    (%eax),%eax
     729:	89 45 fc             	mov    %eax,-0x4(%ebp)
     72c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     72f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     732:	76 d4                	jbe    708 <free+0x19>
     734:	8b 45 fc             	mov    -0x4(%ebp),%eax
     737:	8b 00                	mov    (%eax),%eax
     739:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     73c:	76 ca                	jbe    708 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     73e:	8b 45 f8             	mov    -0x8(%ebp),%eax
     741:	8b 40 04             	mov    0x4(%eax),%eax
     744:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     74b:	8b 45 f8             	mov    -0x8(%ebp),%eax
     74e:	01 c2                	add    %eax,%edx
     750:	8b 45 fc             	mov    -0x4(%ebp),%eax
     753:	8b 00                	mov    (%eax),%eax
     755:	39 c2                	cmp    %eax,%edx
     757:	75 24                	jne    77d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     759:	8b 45 f8             	mov    -0x8(%ebp),%eax
     75c:	8b 50 04             	mov    0x4(%eax),%edx
     75f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     762:	8b 00                	mov    (%eax),%eax
     764:	8b 40 04             	mov    0x4(%eax),%eax
     767:	01 c2                	add    %eax,%edx
     769:	8b 45 f8             	mov    -0x8(%ebp),%eax
     76c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     76f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     772:	8b 00                	mov    (%eax),%eax
     774:	8b 10                	mov    (%eax),%edx
     776:	8b 45 f8             	mov    -0x8(%ebp),%eax
     779:	89 10                	mov    %edx,(%eax)
     77b:	eb 0a                	jmp    787 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     77d:	8b 45 fc             	mov    -0x4(%ebp),%eax
     780:	8b 10                	mov    (%eax),%edx
     782:	8b 45 f8             	mov    -0x8(%ebp),%eax
     785:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     787:	8b 45 fc             	mov    -0x4(%ebp),%eax
     78a:	8b 40 04             	mov    0x4(%eax),%eax
     78d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     794:	8b 45 fc             	mov    -0x4(%ebp),%eax
     797:	01 d0                	add    %edx,%eax
     799:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     79c:	75 20                	jne    7be <free+0xcf>
    p->s.size += bp->s.size;
     79e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7a1:	8b 50 04             	mov    0x4(%eax),%edx
     7a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7a7:	8b 40 04             	mov    0x4(%eax),%eax
     7aa:	01 c2                	add    %eax,%edx
     7ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7af:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     7b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7b5:	8b 10                	mov    (%eax),%edx
     7b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7ba:	89 10                	mov    %edx,(%eax)
     7bc:	eb 08                	jmp    7c6 <free+0xd7>
  } else
    p->s.ptr = bp;
     7be:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7c1:	8b 55 f8             	mov    -0x8(%ebp),%edx
     7c4:	89 10                	mov    %edx,(%eax)
  freep = p;
     7c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7c9:	a3 88 43 00 00       	mov    %eax,0x4388
}
     7ce:	90                   	nop
     7cf:	c9                   	leave  
     7d0:	c3                   	ret    

000007d1 <morecore>:

static Header*
morecore(uint nu)
{
     7d1:	55                   	push   %ebp
     7d2:	89 e5                	mov    %esp,%ebp
     7d4:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     7d7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     7de:	77 07                	ja     7e7 <morecore+0x16>
    nu = 4096;
     7e0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     7e7:	8b 45 08             	mov    0x8(%ebp),%eax
     7ea:	c1 e0 03             	shl    $0x3,%eax
     7ed:	83 ec 0c             	sub    $0xc,%esp
     7f0:	50                   	push   %eax
     7f1:	e8 15 fb ff ff       	call   30b <sbrk>
     7f6:	83 c4 10             	add    $0x10,%esp
     7f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     7fc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     800:	75 07                	jne    809 <morecore+0x38>
    return 0;
     802:	b8 00 00 00 00       	mov    $0x0,%eax
     807:	eb 26                	jmp    82f <morecore+0x5e>
  hp = (Header*)p;
     809:	8b 45 f4             	mov    -0xc(%ebp),%eax
     80c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     80f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     812:	8b 55 08             	mov    0x8(%ebp),%edx
     815:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     818:	8b 45 f0             	mov    -0x10(%ebp),%eax
     81b:	83 c0 08             	add    $0x8,%eax
     81e:	83 ec 0c             	sub    $0xc,%esp
     821:	50                   	push   %eax
     822:	e8 c8 fe ff ff       	call   6ef <free>
     827:	83 c4 10             	add    $0x10,%esp
  return freep;
     82a:	a1 88 43 00 00       	mov    0x4388,%eax
}
     82f:	c9                   	leave  
     830:	c3                   	ret    

00000831 <malloc>:

void*
malloc(uint nbytes)
{
     831:	55                   	push   %ebp
     832:	89 e5                	mov    %esp,%ebp
     834:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     837:	8b 45 08             	mov    0x8(%ebp),%eax
     83a:	83 c0 07             	add    $0x7,%eax
     83d:	c1 e8 03             	shr    $0x3,%eax
     840:	83 c0 01             	add    $0x1,%eax
     843:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     846:	a1 88 43 00 00       	mov    0x4388,%eax
     84b:	89 45 f0             	mov    %eax,-0x10(%ebp)
     84e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     852:	75 23                	jne    877 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     854:	c7 45 f0 80 43 00 00 	movl   $0x4380,-0x10(%ebp)
     85b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     85e:	a3 88 43 00 00       	mov    %eax,0x4388
     863:	a1 88 43 00 00       	mov    0x4388,%eax
     868:	a3 80 43 00 00       	mov    %eax,0x4380
    base.s.size = 0;
     86d:	c7 05 84 43 00 00 00 	movl   $0x0,0x4384
     874:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     877:	8b 45 f0             	mov    -0x10(%ebp),%eax
     87a:	8b 00                	mov    (%eax),%eax
     87c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     87f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     882:	8b 40 04             	mov    0x4(%eax),%eax
     885:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     888:	72 4d                	jb     8d7 <malloc+0xa6>
      if(p->s.size == nunits)
     88a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     88d:	8b 40 04             	mov    0x4(%eax),%eax
     890:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     893:	75 0c                	jne    8a1 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     895:	8b 45 f4             	mov    -0xc(%ebp),%eax
     898:	8b 10                	mov    (%eax),%edx
     89a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     89d:	89 10                	mov    %edx,(%eax)
     89f:	eb 26                	jmp    8c7 <malloc+0x96>
      else {
        p->s.size -= nunits;
     8a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8a4:	8b 40 04             	mov    0x4(%eax),%eax
     8a7:	2b 45 ec             	sub    -0x14(%ebp),%eax
     8aa:	89 c2                	mov    %eax,%edx
     8ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8af:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     8b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8b5:	8b 40 04             	mov    0x4(%eax),%eax
     8b8:	c1 e0 03             	shl    $0x3,%eax
     8bb:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     8be:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8c1:	8b 55 ec             	mov    -0x14(%ebp),%edx
     8c4:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     8c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8ca:	a3 88 43 00 00       	mov    %eax,0x4388
      return (void*)(p + 1);
     8cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8d2:	83 c0 08             	add    $0x8,%eax
     8d5:	eb 3b                	jmp    912 <malloc+0xe1>
    }
    if(p == freep)
     8d7:	a1 88 43 00 00       	mov    0x4388,%eax
     8dc:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     8df:	75 1e                	jne    8ff <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     8e1:	83 ec 0c             	sub    $0xc,%esp
     8e4:	ff 75 ec             	pushl  -0x14(%ebp)
     8e7:	e8 e5 fe ff ff       	call   7d1 <morecore>
     8ec:	83 c4 10             	add    $0x10,%esp
     8ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
     8f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     8f6:	75 07                	jne    8ff <malloc+0xce>
        return 0;
     8f8:	b8 00 00 00 00       	mov    $0x0,%eax
     8fd:	eb 13                	jmp    912 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     8ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
     902:	89 45 f0             	mov    %eax,-0x10(%ebp)
     905:	8b 45 f4             	mov    -0xc(%ebp),%eax
     908:	8b 00                	mov    (%eax),%eax
     90a:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     90d:	e9 6d ff ff ff       	jmp    87f <malloc+0x4e>
}
     912:	c9                   	leave  
     913:	c3                   	ret    

00000914 <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     914:	55                   	push   %ebp
     915:	89 e5                	mov    %esp,%ebp
     917:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     91a:	83 ec 04             	sub    $0x4,%esp
     91d:	ff 75 08             	pushl  0x8(%ebp)
     920:	68 38 36 00 00       	push   $0x3638
     925:	6a 02                	push   $0x2
     927:	e8 03 fc ff ff       	call   52f <printf>
     92c:	83 c4 10             	add    $0x10,%esp
  exit();
     92f:	e8 4f f9 ff ff       	call   283 <exit>

00000934 <getInteger>:
}

static int getInteger(double num)
{
     934:	55                   	push   %ebp
     935:	89 e5                	mov    %esp,%ebp
     937:	83 ec 18             	sub    $0x18,%esp
     93a:	8b 45 08             	mov    0x8(%ebp),%eax
     93d:	89 45 e8             	mov    %eax,-0x18(%ebp)
     940:	8b 45 0c             	mov    0xc(%ebp),%eax
     943:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     946:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     94d:	eb 0e                	jmp    95d <getInteger+0x29>
  {
    num -= 1;
     94f:	dd 45 e8             	fldl   -0x18(%ebp)
     952:	d9 e8                	fld1   
     954:	de e9                	fsubrp %st,%st(1)
     956:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     959:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     95d:	dd 45 e8             	fldl   -0x18(%ebp)
     960:	d9 e8                	fld1   
     962:	d9 c9                	fxch   %st(1)
     964:	df e9                	fucomip %st(1),%st
     966:	dd d8                	fstp   %st(0)
     968:	77 e5                	ja     94f <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     96a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     96d:	c9                   	leave  
     96e:	c3                   	ret    

0000096f <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     96f:	55                   	push   %ebp
     970:	89 e5                	mov    %esp,%ebp
     972:	53                   	push   %ebx
     973:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     976:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     97d:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     981:	74 17                	je     99a <int2str+0x2b>
     983:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     987:	79 11                	jns    99a <int2str+0x2b>
    neg = 1;
     989:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     990:	8b 45 0c             	mov    0xc(%ebp),%eax
     993:	f7 d8                	neg    %eax
     995:	89 45 f0             	mov    %eax,-0x10(%ebp)
     998:	eb 06                	jmp    9a0 <int2str+0x31>
  } else {
    x = num;
     99a:	8b 45 0c             	mov    0xc(%ebp),%eax
     99d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     9a0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     9a7:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     9aa:	8d 41 01             	lea    0x1(%ecx),%eax
     9ad:	89 45 f8             	mov    %eax,-0x8(%ebp)
     9b0:	8b 5d 14             	mov    0x14(%ebp),%ebx
     9b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9b6:	ba 00 00 00 00       	mov    $0x0,%edx
     9bb:	f7 f3                	div    %ebx
     9bd:	89 d0                	mov    %edx,%eax
     9bf:	0f b6 80 54 42 00 00 	movzbl 0x4254(%eax),%eax
     9c6:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     9ca:	8b 5d 14             	mov    0x14(%ebp),%ebx
     9cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9d0:	ba 00 00 00 00       	mov    $0x0,%edx
     9d5:	f7 f3                	div    %ebx
     9d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
     9da:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     9de:	75 c7                	jne    9a7 <int2str+0x38>
  if(neg)
     9e0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     9e4:	74 36                	je     a1c <int2str+0xad>
    buf[i++] = '-';
     9e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
     9e9:	8d 50 01             	lea    0x1(%eax),%edx
     9ec:	89 55 f8             	mov    %edx,-0x8(%ebp)
     9ef:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     9f4:	eb 26                	jmp    a1c <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     9f6:	8b 45 10             	mov    0x10(%ebp),%eax
     9f9:	8b 00                	mov    (%eax),%eax
     9fb:	89 c2                	mov    %eax,%edx
     9fd:	8b 45 08             	mov    0x8(%ebp),%eax
     a00:	01 c2                	add    %eax,%edx
     a02:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     a05:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a08:	01 c8                	add    %ecx,%eax
     a0a:	0f b6 00             	movzbl (%eax),%eax
     a0d:	88 02                	mov    %al,(%edx)
    (*pos)++;
     a0f:	8b 45 10             	mov    0x10(%ebp),%eax
     a12:	8b 00                	mov    (%eax),%eax
     a14:	8d 50 01             	lea    0x1(%eax),%edx
     a17:	8b 45 10             	mov    0x10(%ebp),%eax
     a1a:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     a1c:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     a20:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     a24:	79 d0                	jns    9f6 <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     a26:	90                   	nop
     a27:	83 c4 20             	add    $0x20,%esp
     a2a:	5b                   	pop    %ebx
     a2b:	5d                   	pop    %ebp
     a2c:	c3                   	ret    

00000a2d <double2str>:

void double2str(char *buf, double num, int *pos)
{
     a2d:	55                   	push   %ebp
     a2e:	89 e5                	mov    %esp,%ebp
     a30:	83 ec 18             	sub    $0x18,%esp
     a33:	8b 45 0c             	mov    0xc(%ebp),%eax
     a36:	89 45 e8             	mov    %eax,-0x18(%ebp)
     a39:	8b 45 10             	mov    0x10(%ebp),%eax
     a3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     a3f:	d9 ee                	fldz   
     a41:	dd 45 e8             	fldl   -0x18(%ebp)
     a44:	d9 c9                	fxch   %st(1)
     a46:	df e9                	fucomip %st(1),%st
     a48:	dd d8                	fstp   %st(0)
     a4a:	76 24                	jbe    a70 <double2str+0x43>
  {
    buf[*pos] = '-';
     a4c:	8b 45 14             	mov    0x14(%ebp),%eax
     a4f:	8b 00                	mov    (%eax),%eax
     a51:	89 c2                	mov    %eax,%edx
     a53:	8b 45 08             	mov    0x8(%ebp),%eax
     a56:	01 d0                	add    %edx,%eax
     a58:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     a5b:	8b 45 14             	mov    0x14(%ebp),%eax
     a5e:	8b 00                	mov    (%eax),%eax
     a60:	8d 50 01             	lea    0x1(%eax),%edx
     a63:	8b 45 14             	mov    0x14(%ebp),%eax
     a66:	89 10                	mov    %edx,(%eax)
    num = -num;
     a68:	dd 45 e8             	fldl   -0x18(%ebp)
     a6b:	d9 e0                	fchs   
     a6d:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     a70:	ff 75 ec             	pushl  -0x14(%ebp)
     a73:	ff 75 e8             	pushl  -0x18(%ebp)
     a76:	e8 b9 fe ff ff       	call   934 <getInteger>
     a7b:	83 c4 08             	add    $0x8,%esp
     a7e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     a81:	83 ec 04             	sub    $0x4,%esp
     a84:	6a 01                	push   $0x1
     a86:	6a 0a                	push   $0xa
     a88:	ff 75 14             	pushl  0x14(%ebp)
     a8b:	ff 75 f8             	pushl  -0x8(%ebp)
     a8e:	ff 75 08             	pushl  0x8(%ebp)
     a91:	e8 d9 fe ff ff       	call   96f <int2str>
     a96:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     a99:	db 45 f8             	fildl  -0x8(%ebp)
     a9c:	dd 45 e8             	fldl   -0x18(%ebp)
     a9f:	de e1                	fsubp  %st,%st(1)
     aa1:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     aa4:	dd 45 e8             	fldl   -0x18(%ebp)
     aa7:	dd 05 40 36 00 00    	fldl   0x3640
     aad:	d9 c9                	fxch   %st(1)
     aaf:	df e9                	fucomip %st(1),%st
     ab1:	dd d8                	fstp   %st(0)
     ab3:	76 1c                	jbe    ad1 <double2str+0xa4>
  {
    buf[*pos] = '.';
     ab5:	8b 45 14             	mov    0x14(%ebp),%eax
     ab8:	8b 00                	mov    (%eax),%eax
     aba:	89 c2                	mov    %eax,%edx
     abc:	8b 45 08             	mov    0x8(%ebp),%eax
     abf:	01 d0                	add    %edx,%eax
     ac1:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     ac4:	8b 45 14             	mov    0x14(%ebp),%eax
     ac7:	8b 00                	mov    (%eax),%eax
     ac9:	8d 50 01             	lea    0x1(%eax),%edx
     acc:	8b 45 14             	mov    0x14(%ebp),%eax
     acf:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     ad1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     ad8:	eb 4c                	jmp    b26 <double2str+0xf9>
  {
    num = num*10;
     ada:	dd 45 e8             	fldl   -0x18(%ebp)
     add:	dd 05 48 36 00 00    	fldl   0x3648
     ae3:	de c9                	fmulp  %st,%st(1)
     ae5:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     ae8:	ff 75 ec             	pushl  -0x14(%ebp)
     aeb:	ff 75 e8             	pushl  -0x18(%ebp)
     aee:	e8 41 fe ff ff       	call   934 <getInteger>
     af3:	83 c4 08             	add    $0x8,%esp
     af6:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     af9:	83 ec 04             	sub    $0x4,%esp
     afc:	6a 01                	push   $0x1
     afe:	6a 0a                	push   $0xa
     b00:	ff 75 14             	pushl  0x14(%ebp)
     b03:	ff 75 f8             	pushl  -0x8(%ebp)
     b06:	ff 75 08             	pushl  0x8(%ebp)
     b09:	e8 61 fe ff ff       	call   96f <int2str>
     b0e:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     b11:	db 45 f8             	fildl  -0x8(%ebp)
     b14:	dd 45 e8             	fldl   -0x18(%ebp)
     b17:	de e1                	fsubp  %st,%st(1)
     b19:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     b1c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     b20:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     b24:	7f 13                	jg     b39 <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     b26:	dd 45 e8             	fldl   -0x18(%ebp)
     b29:	dd 05 40 36 00 00    	fldl   0x3640
     b2f:	d9 c9                	fxch   %st(1)
     b31:	df e9                	fucomip %st(1),%st
     b33:	dd d8                	fstp   %st(0)
     b35:	77 a3                	ja     ada <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     b37:	eb 01                	jmp    b3a <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     b39:	90                   	nop
    }
  }
}
     b3a:	90                   	nop
     b3b:	c9                   	leave  
     b3c:	c3                   	ret    

00000b3d <pow>:

double pow(double opnd, int power)
{
     b3d:	55                   	push   %ebp
     b3e:	89 e5                	mov    %esp,%ebp
     b40:	83 ec 18             	sub    $0x18,%esp
     b43:	8b 45 08             	mov    0x8(%ebp),%eax
     b46:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b49:	8b 45 0c             	mov    0xc(%ebp),%eax
     b4c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     b4f:	d9 e8                	fld1   
     b51:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     b54:	eb 0d                	jmp    b63 <pow+0x26>
  {
    result *= opnd;
     b56:	dd 45 f8             	fldl   -0x8(%ebp)
     b59:	dc 4d e8             	fmull  -0x18(%ebp)
     b5c:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     b5f:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     b63:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     b67:	7f ed                	jg     b56 <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     b69:	dd 45 f8             	fldl   -0x8(%ebp)
}
     b6c:	c9                   	leave  
     b6d:	c3                   	ret    

00000b6e <Translation>:

double Translation(char *s, int* pos)
{
     b6e:	55                   	push   %ebp
     b6f:	89 e5                	mov    %esp,%ebp
     b71:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     b74:	d9 ee                	fldz   
     b76:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     b79:	d9 ee                	fldz   
     b7b:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     b7e:	eb 3e                	jmp    bbe <Translation+0x50>
    {
        integer *= 10;
     b80:	dd 45 f8             	fldl   -0x8(%ebp)
     b83:	dd 05 48 36 00 00    	fldl   0x3648
     b89:	de c9                	fmulp  %st,%st(1)
     b8b:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     b8e:	8b 45 0c             	mov    0xc(%ebp),%eax
     b91:	8b 00                	mov    (%eax),%eax
     b93:	89 c2                	mov    %eax,%edx
     b95:	8b 45 08             	mov    0x8(%ebp),%eax
     b98:	01 d0                	add    %edx,%eax
     b9a:	0f b6 00             	movzbl (%eax),%eax
     b9d:	0f be c0             	movsbl %al,%eax
     ba0:	83 e8 30             	sub    $0x30,%eax
     ba3:	89 45 dc             	mov    %eax,-0x24(%ebp)
     ba6:	db 45 dc             	fildl  -0x24(%ebp)
     ba9:	dd 45 f8             	fldl   -0x8(%ebp)
     bac:	de c1                	faddp  %st,%st(1)
     bae:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     bb1:	8b 45 0c             	mov    0xc(%ebp),%eax
     bb4:	8b 00                	mov    (%eax),%eax
     bb6:	8d 50 01             	lea    0x1(%eax),%edx
     bb9:	8b 45 0c             	mov    0xc(%ebp),%eax
     bbc:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     bbe:	8b 45 0c             	mov    0xc(%ebp),%eax
     bc1:	8b 00                	mov    (%eax),%eax
     bc3:	89 c2                	mov    %eax,%edx
     bc5:	8b 45 08             	mov    0x8(%ebp),%eax
     bc8:	01 d0                	add    %edx,%eax
     bca:	0f b6 00             	movzbl (%eax),%eax
     bcd:	3c 2f                	cmp    $0x2f,%al
     bcf:	7e 13                	jle    be4 <Translation+0x76>
     bd1:	8b 45 0c             	mov    0xc(%ebp),%eax
     bd4:	8b 00                	mov    (%eax),%eax
     bd6:	89 c2                	mov    %eax,%edx
     bd8:	8b 45 08             	mov    0x8(%ebp),%eax
     bdb:	01 d0                	add    %edx,%eax
     bdd:	0f b6 00             	movzbl (%eax),%eax
     be0:	3c 39                	cmp    $0x39,%al
     be2:	7e 9c                	jle    b80 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     be4:	8b 45 0c             	mov    0xc(%ebp),%eax
     be7:	8b 00                	mov    (%eax),%eax
     be9:	89 c2                	mov    %eax,%edx
     beb:	8b 45 08             	mov    0x8(%ebp),%eax
     bee:	01 d0                	add    %edx,%eax
     bf0:	0f b6 00             	movzbl (%eax),%eax
     bf3:	3c 2e                	cmp    $0x2e,%al
     bf5:	0f 85 9b 00 00 00    	jne    c96 <Translation+0x128>
    {
        (*pos)++;
     bfb:	8b 45 0c             	mov    0xc(%ebp),%eax
     bfe:	8b 00                	mov    (%eax),%eax
     c00:	8d 50 01             	lea    0x1(%eax),%edx
     c03:	8b 45 0c             	mov    0xc(%ebp),%eax
     c06:	89 10                	mov    %edx,(%eax)
        int c = 1;
     c08:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c0f:	eb 5b                	jmp    c6c <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     c11:	8b 45 0c             	mov    0xc(%ebp),%eax
     c14:	8b 00                	mov    (%eax),%eax
     c16:	89 c2                	mov    %eax,%edx
     c18:	8b 45 08             	mov    0x8(%ebp),%eax
     c1b:	01 d0                	add    %edx,%eax
     c1d:	0f b6 00             	movzbl (%eax),%eax
     c20:	0f be c0             	movsbl %al,%eax
     c23:	83 e8 30             	sub    $0x30,%eax
     c26:	89 45 dc             	mov    %eax,-0x24(%ebp)
     c29:	db 45 dc             	fildl  -0x24(%ebp)
     c2c:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     c2f:	83 ec 04             	sub    $0x4,%esp
     c32:	ff 75 ec             	pushl  -0x14(%ebp)
     c35:	dd 05 50 36 00 00    	fldl   0x3650
     c3b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     c3f:	dd 1c 24             	fstpl  (%esp)
     c42:	e8 f6 fe ff ff       	call   b3d <pow>
     c47:	83 c4 10             	add    $0x10,%esp
     c4a:	dd 45 e0             	fldl   -0x20(%ebp)
     c4d:	de c9                	fmulp  %st,%st(1)
     c4f:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     c52:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     c56:	dd 45 f0             	fldl   -0x10(%ebp)
     c59:	dc 45 e0             	faddl  -0x20(%ebp)
     c5c:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     c5f:	8b 45 0c             	mov    0xc(%ebp),%eax
     c62:	8b 00                	mov    (%eax),%eax
     c64:	8d 50 01             	lea    0x1(%eax),%edx
     c67:	8b 45 0c             	mov    0xc(%ebp),%eax
     c6a:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c6c:	8b 45 0c             	mov    0xc(%ebp),%eax
     c6f:	8b 00                	mov    (%eax),%eax
     c71:	89 c2                	mov    %eax,%edx
     c73:	8b 45 08             	mov    0x8(%ebp),%eax
     c76:	01 d0                	add    %edx,%eax
     c78:	0f b6 00             	movzbl (%eax),%eax
     c7b:	3c 2f                	cmp    $0x2f,%al
     c7d:	7e 17                	jle    c96 <Translation+0x128>
     c7f:	8b 45 0c             	mov    0xc(%ebp),%eax
     c82:	8b 00                	mov    (%eax),%eax
     c84:	89 c2                	mov    %eax,%edx
     c86:	8b 45 08             	mov    0x8(%ebp),%eax
     c89:	01 d0                	add    %edx,%eax
     c8b:	0f b6 00             	movzbl (%eax),%eax
     c8e:	3c 39                	cmp    $0x39,%al
     c90:	0f 8e 7b ff ff ff    	jle    c11 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     c96:	dd 45 f8             	fldl   -0x8(%ebp)
     c99:	dc 45 f0             	faddl  -0x10(%ebp)
     c9c:	c9                   	leave  
     c9d:	c3                   	ret    

00000c9e <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     c9e:	55                   	push   %ebp
     c9f:	89 e5                	mov    %esp,%ebp
     ca1:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     ca4:	e8 d2 f5 ff ff       	call   27b <fork>
     ca9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     cac:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     caf:	c9                   	leave  
     cb0:	c3                   	ret    

00000cb1 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     cb1:	55                   	push   %ebp
     cb2:	89 e5                	mov    %esp,%ebp
     cb4:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     cb7:	83 ec 0c             	sub    $0xc,%esp
     cba:	6a 54                	push   $0x54
     cbc:	e8 70 fb ff ff       	call   831 <malloc>
     cc1:	83 c4 10             	add    $0x10,%esp
     cc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     cc7:	83 ec 04             	sub    $0x4,%esp
     cca:	6a 54                	push   $0x54
     ccc:	6a 00                	push   $0x0
     cce:	ff 75 f4             	pushl  -0xc(%ebp)
     cd1:	e8 12 f4 ff ff       	call   e8 <memset>
     cd6:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     cd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cdc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     ce2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ce5:	c9                   	leave  
     ce6:	c3                   	ret    

00000ce7 <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     ce7:	55                   	push   %ebp
     ce8:	89 e5                	mov    %esp,%ebp
     cea:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     ced:	83 ec 0c             	sub    $0xc,%esp
     cf0:	6a 18                	push   $0x18
     cf2:	e8 3a fb ff ff       	call   831 <malloc>
     cf7:	83 c4 10             	add    $0x10,%esp
     cfa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     cfd:	83 ec 04             	sub    $0x4,%esp
     d00:	6a 18                	push   $0x18
     d02:	6a 00                	push   $0x0
     d04:	ff 75 f4             	pushl  -0xc(%ebp)
     d07:	e8 dc f3 ff ff       	call   e8 <memset>
     d0c:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     d0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d12:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     d18:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d1b:	8b 55 08             	mov    0x8(%ebp),%edx
     d1e:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     d21:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d24:	8b 55 0c             	mov    0xc(%ebp),%edx
     d27:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     d2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d2d:	8b 55 10             	mov    0x10(%ebp),%edx
     d30:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     d33:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d36:	8b 55 14             	mov    0x14(%ebp),%edx
     d39:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     d3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d3f:	8b 55 18             	mov    0x18(%ebp),%edx
     d42:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     d45:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d48:	c9                   	leave  
     d49:	c3                   	ret    

00000d4a <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     d4a:	55                   	push   %ebp
     d4b:	89 e5                	mov    %esp,%ebp
     d4d:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d50:	83 ec 0c             	sub    $0xc,%esp
     d53:	6a 0c                	push   $0xc
     d55:	e8 d7 fa ff ff       	call   831 <malloc>
     d5a:	83 c4 10             	add    $0x10,%esp
     d5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     d60:	83 ec 04             	sub    $0x4,%esp
     d63:	6a 0c                	push   $0xc
     d65:	6a 00                	push   $0x0
     d67:	ff 75 f4             	pushl  -0xc(%ebp)
     d6a:	e8 79 f3 ff ff       	call   e8 <memset>
     d6f:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     d72:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d75:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     d7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d7e:	8b 55 08             	mov    0x8(%ebp),%edx
     d81:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     d84:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d87:	8b 55 0c             	mov    0xc(%ebp),%edx
     d8a:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     d8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d90:	c9                   	leave  
     d91:	c3                   	ret    

00000d92 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     d92:	55                   	push   %ebp
     d93:	89 e5                	mov    %esp,%ebp
     d95:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d98:	83 ec 0c             	sub    $0xc,%esp
     d9b:	6a 0c                	push   $0xc
     d9d:	e8 8f fa ff ff       	call   831 <malloc>
     da2:	83 c4 10             	add    $0x10,%esp
     da5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     da8:	83 ec 04             	sub    $0x4,%esp
     dab:	6a 0c                	push   $0xc
     dad:	6a 00                	push   $0x0
     daf:	ff 75 f4             	pushl  -0xc(%ebp)
     db2:	e8 31 f3 ff ff       	call   e8 <memset>
     db7:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     dba:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dbd:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
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

00000dda <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     dda:	55                   	push   %ebp
     ddb:	89 e5                	mov    %esp,%ebp
     ddd:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     de0:	83 ec 0c             	sub    $0xc,%esp
     de3:	6a 08                	push   $0x8
     de5:	e8 47 fa ff ff       	call   831 <malloc>
     dea:	83 c4 10             	add    $0x10,%esp
     ded:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     df0:	83 ec 04             	sub    $0x4,%esp
     df3:	6a 08                	push   $0x8
     df5:	6a 00                	push   $0x0
     df7:	ff 75 f4             	pushl  -0xc(%ebp)
     dfa:	e8 e9 f2 ff ff       	call   e8 <memset>
     dff:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
     e02:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e05:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     e0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e0e:	8b 55 08             	mov    0x8(%ebp),%edx
     e11:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     e14:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e17:	c9                   	leave  
     e18:	c3                   	ret    

00000e19 <calcmd>:

struct cmd* calcmd(char *_line)
{
     e19:	55                   	push   %ebp
     e1a:	89 e5                	mov    %esp,%ebp
     e1c:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e1f:	83 ec 0c             	sub    $0xc,%esp
     e22:	6a 08                	push   $0x8
     e24:	e8 08 fa ff ff       	call   831 <malloc>
     e29:	83 c4 10             	add    $0x10,%esp
     e2c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e2f:	83 ec 04             	sub    $0x4,%esp
     e32:	6a 08                	push   $0x8
     e34:	6a 00                	push   $0x0
     e36:	ff 75 f4             	pushl  -0xc(%ebp)
     e39:	e8 aa f2 ff ff       	call   e8 <memset>
     e3e:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
     e41:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e44:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
     e4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e4d:	8b 55 08             	mov    0x8(%ebp),%edx
     e50:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     e53:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e56:	c9                   	leave  
     e57:	c3                   	ret    

00000e58 <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
     e58:	55                   	push   %ebp
     e59:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
     e5b:	eb 0c                	jmp    e69 <mystrncmp+0x11>
    n--, p++, q++;
     e5d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     e61:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     e65:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
     e69:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     e6d:	74 1a                	je     e89 <mystrncmp+0x31>
     e6f:	8b 45 08             	mov    0x8(%ebp),%eax
     e72:	0f b6 00             	movzbl (%eax),%eax
     e75:	84 c0                	test   %al,%al
     e77:	74 10                	je     e89 <mystrncmp+0x31>
     e79:	8b 45 08             	mov    0x8(%ebp),%eax
     e7c:	0f b6 10             	movzbl (%eax),%edx
     e7f:	8b 45 0c             	mov    0xc(%ebp),%eax
     e82:	0f b6 00             	movzbl (%eax),%eax
     e85:	38 c2                	cmp    %al,%dl
     e87:	74 d4                	je     e5d <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
     e89:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     e8d:	75 07                	jne    e96 <mystrncmp+0x3e>
    return 0;
     e8f:	b8 00 00 00 00       	mov    $0x0,%eax
     e94:	eb 16                	jmp    eac <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
     e96:	8b 45 08             	mov    0x8(%ebp),%eax
     e99:	0f b6 00             	movzbl (%eax),%eax
     e9c:	0f b6 d0             	movzbl %al,%edx
     e9f:	8b 45 0c             	mov    0xc(%ebp),%eax
     ea2:	0f b6 00             	movzbl (%eax),%eax
     ea5:	0f b6 c0             	movzbl %al,%eax
     ea8:	29 c2                	sub    %eax,%edx
     eaa:	89 d0                	mov    %edx,%eax
}
     eac:	5d                   	pop    %ebp
     ead:	c3                   	ret    

00000eae <mystrlen>:

static int mystrlen(const char *s)
{
     eae:	55                   	push   %ebp
     eaf:	89 e5                	mov    %esp,%ebp
     eb1:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
     eb4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     ebb:	eb 04                	jmp    ec1 <mystrlen+0x13>
     ebd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     ec1:	8b 55 fc             	mov    -0x4(%ebp),%edx
     ec4:	8b 45 08             	mov    0x8(%ebp),%eax
     ec7:	01 d0                	add    %edx,%eax
     ec9:	0f b6 00             	movzbl (%eax),%eax
     ecc:	84 c0                	test   %al,%al
     ece:	75 ed                	jne    ebd <mystrlen+0xf>
    ;
  return n;
     ed0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     ed3:	c9                   	leave  
     ed4:	c3                   	ret    

00000ed5 <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
     ed5:	55                   	push   %ebp
     ed6:	89 e5                	mov    %esp,%ebp
     ed8:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
     edb:	8b 45 08             	mov    0x8(%ebp),%eax
     ede:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
     ee1:	90                   	nop
     ee2:	8b 45 10             	mov    0x10(%ebp),%eax
     ee5:	8d 50 ff             	lea    -0x1(%eax),%edx
     ee8:	89 55 10             	mov    %edx,0x10(%ebp)
     eeb:	85 c0                	test   %eax,%eax
     eed:	7e 2c                	jle    f1b <mystrncpy+0x46>
     eef:	8b 45 08             	mov    0x8(%ebp),%eax
     ef2:	8d 50 01             	lea    0x1(%eax),%edx
     ef5:	89 55 08             	mov    %edx,0x8(%ebp)
     ef8:	8b 55 0c             	mov    0xc(%ebp),%edx
     efb:	8d 4a 01             	lea    0x1(%edx),%ecx
     efe:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     f01:	0f b6 12             	movzbl (%edx),%edx
     f04:	88 10                	mov    %dl,(%eax)
     f06:	0f b6 00             	movzbl (%eax),%eax
     f09:	84 c0                	test   %al,%al
     f0b:	75 d5                	jne    ee2 <mystrncpy+0xd>
    ;
  while(n-- > 0)
     f0d:	eb 0c                	jmp    f1b <mystrncpy+0x46>
    *s++ = 0;
     f0f:	8b 45 08             	mov    0x8(%ebp),%eax
     f12:	8d 50 01             	lea    0x1(%eax),%edx
     f15:	89 55 08             	mov    %edx,0x8(%ebp)
     f18:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
     f1b:	8b 45 10             	mov    0x10(%ebp),%eax
     f1e:	8d 50 ff             	lea    -0x1(%eax),%edx
     f21:	89 55 10             	mov    %edx,0x10(%ebp)
     f24:	85 c0                	test   %eax,%eax
     f26:	7f e7                	jg     f0f <mystrncpy+0x3a>
    *s++ = 0;
  return os;
     f28:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f2b:	c9                   	leave  
     f2c:	c3                   	ret    

00000f2d <isEqual>:

int isEqual(double a, double b)
{
     f2d:	55                   	push   %ebp
     f2e:	89 e5                	mov    %esp,%ebp
     f30:	83 ec 10             	sub    $0x10,%esp
     f33:	8b 45 08             	mov    0x8(%ebp),%eax
     f36:	89 45 f8             	mov    %eax,-0x8(%ebp)
     f39:	8b 45 0c             	mov    0xc(%ebp),%eax
     f3c:	89 45 fc             	mov    %eax,-0x4(%ebp)
     f3f:	8b 45 10             	mov    0x10(%ebp),%eax
     f42:	89 45 f0             	mov    %eax,-0x10(%ebp)
     f45:	8b 45 14             	mov    0x14(%ebp),%eax
     f48:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
     f4b:	dd 45 f8             	fldl   -0x8(%ebp)
     f4e:	dc 65 f0             	fsubl  -0x10(%ebp)
     f51:	dd 05 20 38 00 00    	fldl   0x3820
     f57:	df e9                	fucomip %st(1),%st
     f59:	dd d8                	fstp   %st(0)
     f5b:	76 19                	jbe    f76 <isEqual+0x49>
     f5d:	dd 45 f0             	fldl   -0x10(%ebp)
     f60:	dc 65 f8             	fsubl  -0x8(%ebp)
     f63:	dd 05 20 38 00 00    	fldl   0x3820
     f69:	df e9                	fucomip %st(1),%st
     f6b:	dd d8                	fstp   %st(0)
     f6d:	76 07                	jbe    f76 <isEqual+0x49>
    return 1;
     f6f:	b8 01 00 00 00       	mov    $0x1,%eax
     f74:	eb 05                	jmp    f7b <isEqual+0x4e>
  return 0;
     f76:	b8 00 00 00 00       	mov    $0x0,%eax
}
     f7b:	c9                   	leave  
     f7c:	c3                   	ret    

00000f7d <isCmdName>:

int isCmdName(const char* str)
{
     f7d:	55                   	push   %ebp
     f7e:	89 e5                	mov    %esp,%ebp
     f80:	53                   	push   %ebx
     f81:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
     f84:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     f8b:	eb 71                	jmp    ffe <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
     f8d:	8b 55 f4             	mov    -0xc(%ebp),%edx
     f90:	89 d0                	mov    %edx,%eax
     f92:	c1 e0 02             	shl    $0x2,%eax
     f95:	01 d0                	add    %edx,%eax
     f97:	01 c0                	add    %eax,%eax
     f99:	05 80 42 00 00       	add    $0x4280,%eax
     f9e:	83 ec 0c             	sub    $0xc,%esp
     fa1:	50                   	push   %eax
     fa2:	e8 1a f1 ff ff       	call   c1 <strlen>
     fa7:	83 c4 10             	add    $0x10,%esp
     faa:	89 c3                	mov    %eax,%ebx
     fac:	83 ec 0c             	sub    $0xc,%esp
     faf:	ff 75 08             	pushl  0x8(%ebp)
     fb2:	e8 f7 fe ff ff       	call   eae <mystrlen>
     fb7:	83 c4 10             	add    $0x10,%esp
     fba:	39 c3                	cmp    %eax,%ebx
     fbc:	75 3c                	jne    ffa <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
     fbe:	83 ec 0c             	sub    $0xc,%esp
     fc1:	ff 75 08             	pushl  0x8(%ebp)
     fc4:	e8 e5 fe ff ff       	call   eae <mystrlen>
     fc9:	83 c4 10             	add    $0x10,%esp
     fcc:	89 c1                	mov    %eax,%ecx
     fce:	8b 55 f4             	mov    -0xc(%ebp),%edx
     fd1:	89 d0                	mov    %edx,%eax
     fd3:	c1 e0 02             	shl    $0x2,%eax
     fd6:	01 d0                	add    %edx,%eax
     fd8:	01 c0                	add    %eax,%eax
     fda:	05 80 42 00 00       	add    $0x4280,%eax
     fdf:	83 ec 04             	sub    $0x4,%esp
     fe2:	51                   	push   %ecx
     fe3:	ff 75 08             	pushl  0x8(%ebp)
     fe6:	50                   	push   %eax
     fe7:	e8 6c fe ff ff       	call   e58 <mystrncmp>
     fec:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
     fef:	85 c0                	test   %eax,%eax
     ff1:	75 07                	jne    ffa <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
     ff3:	b8 01 00 00 00       	mov    $0x1,%eax
     ff8:	eb 0f                	jmp    1009 <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
     ffa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     ffe:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1002:	7e 89                	jle    f8d <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    1004:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1009:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    100c:	c9                   	leave  
    100d:	c3                   	ret    

0000100e <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    100e:	55                   	push   %ebp
    100f:	89 e5                	mov    %esp,%ebp
    1011:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    1017:	83 ec 08             	sub    $0x8,%esp
    101a:	6a 00                	push   $0x0
    101c:	68 48 43 00 00       	push   $0x4348
    1021:	e8 9d f2 ff ff       	call   2c3 <open>
    1026:	83 c4 10             	add    $0x10,%esp
    1029:	89 45 dc             	mov    %eax,-0x24(%ebp)
    102c:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1030:	79 0a                	jns    103c <findAlias+0x2e>
  {
      return 0; //no aliasfile
    1032:	b8 00 00 00 00       	mov    $0x0,%eax
    1037:	e9 9a 01 00 00       	jmp    11d6 <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    103c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    1043:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    104a:	e9 ee 00 00 00       	jmp    113d <findAlias+0x12f>
  {
      int isSame = 1;
    104f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    1056:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    105d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    1064:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    106b:	83 ec 0c             	sub    $0xc,%esp
    106e:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1071:	50                   	push   %eax
    1072:	e8 4a f0 ff ff       	call   c1 <strlen>
    1077:	83 c4 10             	add    $0x10,%esp
    107a:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    107d:	83 ec 0c             	sub    $0xc,%esp
    1080:	ff 75 08             	pushl  0x8(%ebp)
    1083:	e8 39 f0 ff ff       	call   c1 <strlen>
    1088:	83 c4 10             	add    $0x10,%esp
    108b:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    108e:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1091:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1094:	01 d0                	add    %edx,%eax
    1096:	0f b6 00             	movzbl (%eax),%eax
    1099:	3c 21                	cmp    $0x21,%al
    109b:	75 38                	jne    10d5 <findAlias+0xc7>
      {
          startIndex++;
    109d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    10a1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    10a8:	eb 2b                	jmp    10d5 <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    10aa:	8d 55 9a             	lea    -0x66(%ebp),%edx
    10ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10b0:	01 d0                	add    %edx,%eax
    10b2:	0f b6 10             	movzbl (%eax),%edx
    10b5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    10b8:	8b 45 08             	mov    0x8(%ebp),%eax
    10bb:	01 c8                	add    %ecx,%eax
    10bd:	0f b6 00             	movzbl (%eax),%eax
    10c0:	38 c2                	cmp    %al,%dl
    10c2:	74 09                	je     10cd <findAlias+0xbf>
          {
              isSame = 0;
    10c4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    10cb:	eb 1f                	jmp    10ec <findAlias+0xde>
          }
          startIndex++;
    10cd:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    10d1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    10d5:	8d 55 9a             	lea    -0x66(%ebp),%edx
    10d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10db:	01 d0                	add    %edx,%eax
    10dd:	0f b6 00             	movzbl (%eax),%eax
    10e0:	3c 3d                	cmp    $0x3d,%al
    10e2:	74 08                	je     10ec <findAlias+0xde>
    10e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10e7:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    10ea:	7c be                	jl     10aa <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    10ec:	8d 55 9a             	lea    -0x66(%ebp),%edx
    10ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10f2:	01 d0                	add    %edx,%eax
    10f4:	0f b6 00             	movzbl (%eax),%eax
    10f7:	3c 3d                	cmp    $0x3d,%al
    10f9:	75 08                	jne    1103 <findAlias+0xf5>
    10fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10fe:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1101:	7d 07                	jge    110a <findAlias+0xfc>
      {
          isSame = 0;
    1103:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    110a:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    110e:	75 0b                	jne    111b <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    1110:	b8 01 00 00 00       	mov    $0x1,%eax
    1115:	2b 45 f0             	sub    -0x10(%ebp),%eax
    1118:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    111b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    111f:	75 1c                	jne    113d <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    1121:	83 ec 08             	sub    $0x8,%esp
    1124:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1127:	50                   	push   %eax
    1128:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    112e:	50                   	push   %eax
    112f:	e8 1e ef ff ff       	call   52 <strcpy>
    1134:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    1137:	8b 45 e8             	mov    -0x18(%ebp),%eax
    113a:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    113d:	83 ec 04             	sub    $0x4,%esp
    1140:	6a 32                	push   $0x32
    1142:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1145:	50                   	push   %eax
    1146:	ff 75 dc             	pushl  -0x24(%ebp)
    1149:	e8 4d f1 ff ff       	call   29b <read>
    114e:	83 c4 10             	add    $0x10,%esp
    1151:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1154:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    1158:	0f 8f f1 fe ff ff    	jg     104f <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    115e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1162:	75 5f                	jne    11c3 <findAlias+0x1b5>
  {
    int i = 0;
    1164:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    116b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    116f:	eb 20                	jmp    1191 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    1171:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1174:	8b 45 0c             	mov    0xc(%ebp),%eax
    1177:	01 c2                	add    %eax,%edx
    1179:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    117f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1182:	01 c8                	add    %ecx,%eax
    1184:	0f b6 00             	movzbl (%eax),%eax
    1187:	88 02                	mov    %al,(%edx)
      i++;
    1189:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    118d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    1191:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    1197:	8b 45 f4             	mov    -0xc(%ebp),%eax
    119a:	01 d0                	add    %edx,%eax
    119c:	0f b6 00             	movzbl (%eax),%eax
    119f:	84 c0                	test   %al,%al
    11a1:	75 ce                	jne    1171 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    11a3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    11a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    11a9:	01 d0                	add    %edx,%eax
    11ab:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    11ae:	83 ec 0c             	sub    $0xc,%esp
    11b1:	ff 75 dc             	pushl  -0x24(%ebp)
    11b4:	e8 f2 f0 ff ff       	call   2ab <close>
    11b9:	83 c4 10             	add    $0x10,%esp
    return 1;
    11bc:	b8 01 00 00 00       	mov    $0x1,%eax
    11c1:	eb 13                	jmp    11d6 <findAlias+0x1c8>
  }
  close(fd);
    11c3:	83 ec 0c             	sub    $0xc,%esp
    11c6:	ff 75 dc             	pushl  -0x24(%ebp)
    11c9:	e8 dd f0 ff ff       	call   2ab <close>
    11ce:	83 c4 10             	add    $0x10,%esp
  return 0;
    11d1:	b8 00 00 00 00       	mov    $0x0,%eax
}
    11d6:	c9                   	leave  
    11d7:	c3                   	ret    

000011d8 <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    11d8:	55                   	push   %ebp
    11d9:	89 e5                	mov    %esp,%ebp
    11db:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    11de:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    11e2:	75 05                	jne    11e9 <runcmd+0x11>
    exit();
    11e4:	e8 9a f0 ff ff       	call   283 <exit>
  
  switch(cmd->type){
    11e9:	8b 45 08             	mov    0x8(%ebp),%eax
    11ec:	8b 00                	mov    (%eax),%eax
    11ee:	83 f8 05             	cmp    $0x5,%eax
    11f1:	77 09                	ja     11fc <runcmd+0x24>
    11f3:	8b 04 85 84 36 00 00 	mov    0x3684(,%eax,4),%eax
    11fa:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    11fc:	83 ec 0c             	sub    $0xc,%esp
    11ff:	68 58 36 00 00       	push   $0x3658
    1204:	e8 0b f7 ff ff       	call   914 <panic1>
    1209:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    120c:	8b 45 08             	mov    0x8(%ebp),%eax
    120f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    1212:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1215:	8b 40 04             	mov    0x4(%eax),%eax
    1218:	85 c0                	test   %eax,%eax
    121a:	75 05                	jne    1221 <runcmd+0x49>
      exit();
    121c:	e8 62 f0 ff ff       	call   283 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    1221:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1224:	8b 40 04             	mov    0x4(%eax),%eax
    1227:	83 ec 0c             	sub    $0xc,%esp
    122a:	50                   	push   %eax
    122b:	e8 4d fd ff ff       	call   f7d <isCmdName>
    1230:	83 c4 10             	add    $0x10,%esp
    1233:	85 c0                	test   %eax,%eax
    1235:	75 37                	jne    126e <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    1237:	8b 45 f4             	mov    -0xc(%ebp),%eax
    123a:	8b 40 04             	mov    0x4(%eax),%eax
    123d:	83 ec 08             	sub    $0x8,%esp
    1240:	8d 55 ce             	lea    -0x32(%ebp),%edx
    1243:	52                   	push   %edx
    1244:	50                   	push   %eax
    1245:	e8 c4 fd ff ff       	call   100e <findAlias>
    124a:	83 c4 10             	add    $0x10,%esp
    124d:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    1250:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1254:	75 31                	jne    1287 <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    1256:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1259:	83 c0 04             	add    $0x4,%eax
    125c:	83 ec 08             	sub    $0x8,%esp
    125f:	50                   	push   %eax
    1260:	8d 45 ce             	lea    -0x32(%ebp),%eax
    1263:	50                   	push   %eax
    1264:	e8 52 f0 ff ff       	call   2bb <exec>
    1269:	83 c4 10             	add    $0x10,%esp
    126c:	eb 19                	jmp    1287 <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    126e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1271:	8d 50 04             	lea    0x4(%eax),%edx
    1274:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1277:	8b 40 04             	mov    0x4(%eax),%eax
    127a:	83 ec 08             	sub    $0x8,%esp
    127d:	52                   	push   %edx
    127e:	50                   	push   %eax
    127f:	e8 37 f0 ff ff       	call   2bb <exec>
    1284:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    1287:	8b 45 f4             	mov    -0xc(%ebp),%eax
    128a:	8b 40 04             	mov    0x4(%eax),%eax
    128d:	83 ec 04             	sub    $0x4,%esp
    1290:	50                   	push   %eax
    1291:	68 5f 36 00 00       	push   $0x365f
    1296:	6a 02                	push   $0x2
    1298:	e8 92 f2 ff ff       	call   52f <printf>
    129d:	83 c4 10             	add    $0x10,%esp
    break;
    12a0:	e9 c6 01 00 00       	jmp    146b <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    12a5:	8b 45 08             	mov    0x8(%ebp),%eax
    12a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    12ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12ae:	8b 40 14             	mov    0x14(%eax),%eax
    12b1:	83 ec 0c             	sub    $0xc,%esp
    12b4:	50                   	push   %eax
    12b5:	e8 f1 ef ff ff       	call   2ab <close>
    12ba:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    12bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12c0:	8b 50 10             	mov    0x10(%eax),%edx
    12c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12c6:	8b 40 08             	mov    0x8(%eax),%eax
    12c9:	83 ec 08             	sub    $0x8,%esp
    12cc:	52                   	push   %edx
    12cd:	50                   	push   %eax
    12ce:	e8 f0 ef ff ff       	call   2c3 <open>
    12d3:	83 c4 10             	add    $0x10,%esp
    12d6:	85 c0                	test   %eax,%eax
    12d8:	79 1e                	jns    12f8 <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    12da:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12dd:	8b 40 08             	mov    0x8(%eax),%eax
    12e0:	83 ec 04             	sub    $0x4,%esp
    12e3:	50                   	push   %eax
    12e4:	68 6f 36 00 00       	push   $0x366f
    12e9:	6a 02                	push   $0x2
    12eb:	e8 3f f2 ff ff       	call   52f <printf>
    12f0:	83 c4 10             	add    $0x10,%esp
      exit();
    12f3:	e8 8b ef ff ff       	call   283 <exit>
    }
    runcmd(rcmd->cmd);
    12f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12fb:	8b 40 04             	mov    0x4(%eax),%eax
    12fe:	83 ec 0c             	sub    $0xc,%esp
    1301:	50                   	push   %eax
    1302:	e8 d1 fe ff ff       	call   11d8 <runcmd>
    1307:	83 c4 10             	add    $0x10,%esp
    break;
    130a:	e9 5c 01 00 00       	jmp    146b <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    130f:	8b 45 08             	mov    0x8(%ebp),%eax
    1312:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    1315:	e8 84 f9 ff ff       	call   c9e <fork1>
    131a:	85 c0                	test   %eax,%eax
    131c:	75 12                	jne    1330 <runcmd+0x158>
      runcmd(lcmd->left);
    131e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1321:	8b 40 04             	mov    0x4(%eax),%eax
    1324:	83 ec 0c             	sub    $0xc,%esp
    1327:	50                   	push   %eax
    1328:	e8 ab fe ff ff       	call   11d8 <runcmd>
    132d:	83 c4 10             	add    $0x10,%esp
    wait();
    1330:	e8 56 ef ff ff       	call   28b <wait>
    runcmd(lcmd->right);
    1335:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1338:	8b 40 08             	mov    0x8(%eax),%eax
    133b:	83 ec 0c             	sub    $0xc,%esp
    133e:	50                   	push   %eax
    133f:	e8 94 fe ff ff       	call   11d8 <runcmd>
    1344:	83 c4 10             	add    $0x10,%esp
    break;
    1347:	e9 1f 01 00 00       	jmp    146b <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    134c:	8b 45 08             	mov    0x8(%ebp),%eax
    134f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    1352:	83 ec 0c             	sub    $0xc,%esp
    1355:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1358:	50                   	push   %eax
    1359:	e8 35 ef ff ff       	call   293 <pipe>
    135e:	83 c4 10             	add    $0x10,%esp
    1361:	85 c0                	test   %eax,%eax
    1363:	79 10                	jns    1375 <runcmd+0x19d>
      panic1("pipe");
    1365:	83 ec 0c             	sub    $0xc,%esp
    1368:	68 7f 36 00 00       	push   $0x367f
    136d:	e8 a2 f5 ff ff       	call   914 <panic1>
    1372:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    1375:	e8 24 f9 ff ff       	call   c9e <fork1>
    137a:	85 c0                	test   %eax,%eax
    137c:	75 4c                	jne    13ca <runcmd+0x1f2>
      close(1);
    137e:	83 ec 0c             	sub    $0xc,%esp
    1381:	6a 01                	push   $0x1
    1383:	e8 23 ef ff ff       	call   2ab <close>
    1388:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    138b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    138e:	83 ec 0c             	sub    $0xc,%esp
    1391:	50                   	push   %eax
    1392:	e8 64 ef ff ff       	call   2fb <dup>
    1397:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    139a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    139d:	83 ec 0c             	sub    $0xc,%esp
    13a0:	50                   	push   %eax
    13a1:	e8 05 ef ff ff       	call   2ab <close>
    13a6:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    13a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    13ac:	83 ec 0c             	sub    $0xc,%esp
    13af:	50                   	push   %eax
    13b0:	e8 f6 ee ff ff       	call   2ab <close>
    13b5:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    13b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    13bb:	8b 40 04             	mov    0x4(%eax),%eax
    13be:	83 ec 0c             	sub    $0xc,%esp
    13c1:	50                   	push   %eax
    13c2:	e8 11 fe ff ff       	call   11d8 <runcmd>
    13c7:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    13ca:	e8 cf f8 ff ff       	call   c9e <fork1>
    13cf:	85 c0                	test   %eax,%eax
    13d1:	75 4c                	jne    141f <runcmd+0x247>
      close(0);
    13d3:	83 ec 0c             	sub    $0xc,%esp
    13d6:	6a 00                	push   $0x0
    13d8:	e8 ce ee ff ff       	call   2ab <close>
    13dd:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    13e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    13e3:	83 ec 0c             	sub    $0xc,%esp
    13e6:	50                   	push   %eax
    13e7:	e8 0f ef ff ff       	call   2fb <dup>
    13ec:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    13ef:	8b 45 d8             	mov    -0x28(%ebp),%eax
    13f2:	83 ec 0c             	sub    $0xc,%esp
    13f5:	50                   	push   %eax
    13f6:	e8 b0 ee ff ff       	call   2ab <close>
    13fb:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    13fe:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1401:	83 ec 0c             	sub    $0xc,%esp
    1404:	50                   	push   %eax
    1405:	e8 a1 ee ff ff       	call   2ab <close>
    140a:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    140d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1410:	8b 40 08             	mov    0x8(%eax),%eax
    1413:	83 ec 0c             	sub    $0xc,%esp
    1416:	50                   	push   %eax
    1417:	e8 bc fd ff ff       	call   11d8 <runcmd>
    141c:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    141f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1422:	83 ec 0c             	sub    $0xc,%esp
    1425:	50                   	push   %eax
    1426:	e8 80 ee ff ff       	call   2ab <close>
    142b:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    142e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1431:	83 ec 0c             	sub    $0xc,%esp
    1434:	50                   	push   %eax
    1435:	e8 71 ee ff ff       	call   2ab <close>
    143a:	83 c4 10             	add    $0x10,%esp
    wait();
    143d:	e8 49 ee ff ff       	call   28b <wait>
    wait();
    1442:	e8 44 ee ff ff       	call   28b <wait>
    break;
    1447:	eb 22                	jmp    146b <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    1449:	8b 45 08             	mov    0x8(%ebp),%eax
    144c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    144f:	e8 4a f8 ff ff       	call   c9e <fork1>
    1454:	85 c0                	test   %eax,%eax
    1456:	75 12                	jne    146a <runcmd+0x292>
      runcmd(bcmd->cmd);
    1458:	8b 45 e0             	mov    -0x20(%ebp),%eax
    145b:	8b 40 04             	mov    0x4(%eax),%eax
    145e:	83 ec 0c             	sub    $0xc,%esp
    1461:	50                   	push   %eax
    1462:	e8 71 fd ff ff       	call   11d8 <runcmd>
    1467:	83 c4 10             	add    $0x10,%esp
    break;
    146a:	90                   	nop
  }
  exit();
    146b:	e8 13 ee ff ff       	call   283 <exit>

00001470 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	83 ec 04             	sub    $0x4,%esp
    1476:	8b 45 08             	mov    0x8(%ebp),%eax
    1479:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    147c:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    1480:	7e 0d                	jle    148f <isNameChar+0x1f>
    1482:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    1486:	7f 07                	jg     148f <isNameChar+0x1f>
    return 1;
    1488:	b8 01 00 00 00       	mov    $0x1,%eax
    148d:	eb 38                	jmp    14c7 <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    148f:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    1493:	7e 0d                	jle    14a2 <isNameChar+0x32>
    1495:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    1499:	7f 07                	jg     14a2 <isNameChar+0x32>
    return 1;
    149b:	b8 01 00 00 00       	mov    $0x1,%eax
    14a0:	eb 25                	jmp    14c7 <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    14a2:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    14a6:	7e 0d                	jle    14b5 <isNameChar+0x45>
    14a8:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    14ac:	7f 07                	jg     14b5 <isNameChar+0x45>
    return 1;
    14ae:	b8 01 00 00 00       	mov    $0x1,%eax
    14b3:	eb 12                	jmp    14c7 <isNameChar+0x57>
  if(ch == '_')
    14b5:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    14b9:	75 07                	jne    14c2 <isNameChar+0x52>
    return 1;
    14bb:	b8 01 00 00 00       	mov    $0x1,%eax
    14c0:	eb 05                	jmp    14c7 <isNameChar+0x57>
  return 0;
    14c2:	b8 00 00 00 00       	mov    $0x0,%eax
}
    14c7:	c9                   	leave  
    14c8:	c3                   	ret    

000014c9 <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    14c9:	55                   	push   %ebp
    14ca:	89 e5                	mov    %esp,%ebp
    14cc:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    14cf:	8b 45 08             	mov    0x8(%ebp),%eax
    14d2:	8b 40 04             	mov    0x4(%eax),%eax
    14d5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    14d8:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    14df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    14e6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    14ed:	eb 1d                	jmp    150c <runCalcmd+0x43>
  {
    if(line[i] == '=')
    14ef:	8b 55 ec             	mov    -0x14(%ebp),%edx
    14f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    14f5:	01 d0                	add    %edx,%eax
    14f7:	0f b6 00             	movzbl (%eax),%eax
    14fa:	3c 3d                	cmp    $0x3d,%al
    14fc:	75 0a                	jne    1508 <runCalcmd+0x3f>
    {
      hasEqu++;
    14fe:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    1502:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1505:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    1508:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    150c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    150f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1512:	01 d0                	add    %edx,%eax
    1514:	0f b6 00             	movzbl (%eax),%eax
    1517:	84 c0                	test   %al,%al
    1519:	75 d4                	jne    14ef <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    151b:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    151f:	7e 1d                	jle    153e <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    1521:	83 ec 0c             	sub    $0xc,%esp
    1524:	68 9c 36 00 00       	push   $0x369c
    1529:	6a 00                	push   $0x0
    152b:	6a 00                	push   $0x0
    152d:	6a 01                	push   $0x1
    152f:	6a 04                	push   $0x4
    1531:	e8 21 17 00 00       	call   2c57 <color_printf>
    1536:	83 c4 20             	add    $0x20,%esp
    1539:	e9 78 05 00 00       	jmp    1ab6 <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    153e:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1542:	0f 85 26 05 00 00    	jne    1a6e <runCalcmd+0x5a5>
  {
    int i=0;
    1548:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    154f:	eb 04                	jmp    1555 <runCalcmd+0x8c>
    {
      i++;
    1551:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    1555:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1558:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    155b:	01 d0                	add    %edx,%eax
    155d:	0f b6 00             	movzbl (%eax),%eax
    1560:	3c 20                	cmp    $0x20,%al
    1562:	74 ed                	je     1551 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    1564:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1567:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    156a:	eb 23                	jmp    158f <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    156c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    156f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1572:	01 d0                	add    %edx,%eax
    1574:	0f b6 00             	movzbl (%eax),%eax
    1577:	0f be c0             	movsbl %al,%eax
    157a:	83 ec 0c             	sub    $0xc,%esp
    157d:	50                   	push   %eax
    157e:	e8 ed fe ff ff       	call   1470 <isNameChar>
    1583:	83 c4 10             	add    $0x10,%esp
    1586:	83 f8 01             	cmp    $0x1,%eax
    1589:	75 0e                	jne    1599 <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    158b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    158f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1592:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1595:	7c d5                	jl     156c <runCalcmd+0xa3>
    1597:	eb 01                	jmp    159a <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    1599:	90                   	nop
    }
    int len = i-startIndex;
    159a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    159d:	2b 45 d0             	sub    -0x30(%ebp),%eax
    15a0:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    15a3:	eb 04                	jmp    15a9 <runCalcmd+0xe0>
    {
      i++;
    15a5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    15a9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    15ac:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15af:	01 d0                	add    %edx,%eax
    15b1:	0f b6 00             	movzbl (%eax),%eax
    15b4:	3c 20                	cmp    $0x20,%al
    15b6:	74 ed                	je     15a5 <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    15b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15bb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    15be:	0f 85 90 04 00 00    	jne    1a54 <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    15c4:	8b 55 d0             	mov    -0x30(%ebp),%edx
    15c7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15ca:	01 d0                	add    %edx,%eax
    15cc:	0f b6 00             	movzbl (%eax),%eax
    15cf:	3c 2f                	cmp    $0x2f,%al
    15d1:	7e 2c                	jle    15ff <runCalcmd+0x136>
    15d3:	8b 55 d0             	mov    -0x30(%ebp),%edx
    15d6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15d9:	01 d0                	add    %edx,%eax
    15db:	0f b6 00             	movzbl (%eax),%eax
    15de:	3c 39                	cmp    $0x39,%al
    15e0:	7f 1d                	jg     15ff <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    15e2:	83 ec 0c             	sub    $0xc,%esp
    15e5:	68 b8 36 00 00       	push   $0x36b8
    15ea:	6a 00                	push   $0x0
    15ec:	6a 00                	push   $0x0
    15ee:	6a 01                	push   $0x1
    15f0:	6a 04                	push   $0x4
    15f2:	e8 60 16 00 00       	call   2c57 <color_printf>
    15f7:	83 c4 20             	add    $0x20,%esp
    15fa:	e9 b7 04 00 00       	jmp    1ab6 <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    15ff:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1606:	eb 20                	jmp    1628 <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    1608:	8b 55 d0             	mov    -0x30(%ebp),%edx
    160b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    160e:	01 d0                	add    %edx,%eax
    1610:	89 c2                	mov    %eax,%edx
    1612:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1615:	01 d0                	add    %edx,%eax
    1617:	0f b6 00             	movzbl (%eax),%eax
    161a:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    161d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1620:	01 ca                	add    %ecx,%edx
    1622:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1624:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1628:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    162b:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    162e:	7c d8                	jl     1608 <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1630:	8d 55 94             	lea    -0x6c(%ebp),%edx
    1633:	8b 45 cc             	mov    -0x34(%ebp),%eax
    1636:	01 d0                	add    %edx,%eax
    1638:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    163b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    163e:	83 c0 01             	add    $0x1,%eax
    1641:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    1644:	eb 04                	jmp    164a <runCalcmd+0x181>
        {
          i++;
    1646:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    164a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    164d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1650:	01 d0                	add    %edx,%eax
    1652:	0f b6 00             	movzbl (%eax),%eax
    1655:	3c 20                	cmp    $0x20,%al
    1657:	74 ed                	je     1646 <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    1659:	8b 55 e0             	mov    -0x20(%ebp),%edx
    165c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    165f:	01 d0                	add    %edx,%eax
    1661:	0f b6 00             	movzbl (%eax),%eax
    1664:	3c 60                	cmp    $0x60,%al
    1666:	0f 85 e6 01 00 00    	jne    1852 <runCalcmd+0x389>
        {
          i++;
    166c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    1670:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1673:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    1676:	eb 04                	jmp    167c <runCalcmd+0x1b3>
          {
            i++;
    1678:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    167c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    167f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1682:	01 d0                	add    %edx,%eax
    1684:	0f b6 00             	movzbl (%eax),%eax
    1687:	3c 60                	cmp    $0x60,%al
    1689:	74 0f                	je     169a <runCalcmd+0x1d1>
    168b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    168e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1691:	01 d0                	add    %edx,%eax
    1693:	0f b6 00             	movzbl (%eax),%eax
    1696:	84 c0                	test   %al,%al
    1698:	75 de                	jne    1678 <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    169a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    169d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16a0:	01 d0                	add    %edx,%eax
    16a2:	0f b6 00             	movzbl (%eax),%eax
    16a5:	3c 60                	cmp    $0x60,%al
    16a7:	0f 85 5c 01 00 00    	jne    1809 <runCalcmd+0x340>
    16ad:	8b 45 e0             	mov    -0x20(%ebp),%eax
    16b0:	8d 50 01             	lea    0x1(%eax),%edx
    16b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16b6:	01 d0                	add    %edx,%eax
    16b8:	0f b6 00             	movzbl (%eax),%eax
    16bb:	84 c0                	test   %al,%al
    16bd:	0f 85 46 01 00 00    	jne    1809 <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    16c3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16c9:	01 d0                	add    %edx,%eax
    16cb:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    16ce:	8b 55 c8             	mov    -0x38(%ebp),%edx
    16d1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16d4:	01 d0                	add    %edx,%eax
    16d6:	83 ec 0c             	sub    $0xc,%esp
    16d9:	50                   	push   %eax
    16da:	e8 c5 04 00 00       	call   1ba4 <Compute>
    16df:	83 c4 10             	add    $0x10,%esp
    16e2:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    16e5:	dd 05 28 38 00 00    	fldl   0x3828
    16eb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    16ef:	dd 1c 24             	fstpl  (%esp)
    16f2:	ff 75 c4             	pushl  -0x3c(%ebp)
    16f5:	ff 75 c0             	pushl  -0x40(%ebp)
    16f8:	e8 30 f8 ff ff       	call   f2d <isEqual>
    16fd:	83 c4 10             	add    $0x10,%esp
    1700:	85 c0                	test   %eax,%eax
    1702:	0f 85 ad 03 00 00    	jne    1ab5 <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    1708:	a1 8c 43 00 00       	mov    0x438c,%eax
    170d:	85 c0                	test   %eax,%eax
    170f:	75 15                	jne    1726 <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1711:	83 ec 08             	sub    $0x8,%esp
    1714:	68 8c 43 00 00       	push   $0x438c
    1719:	68 c0 43 00 00       	push   $0x43c0
    171e:	e8 ba 19 00 00       	call   30dd <readVariables>
    1723:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    1726:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    172d:	eb 26                	jmp    1755 <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    172f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1732:	c1 e0 05             	shl    $0x5,%eax
    1735:	05 c0 43 00 00       	add    $0x43c0,%eax
    173a:	8d 50 04             	lea    0x4(%eax),%edx
    173d:	83 ec 08             	sub    $0x8,%esp
    1740:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1743:	50                   	push   %eax
    1744:	52                   	push   %edx
    1745:	e8 38 e9 ff ff       	call   82 <strcmp>
    174a:	83 c4 10             	add    $0x10,%esp
    174d:	85 c0                	test   %eax,%eax
    174f:	74 10                	je     1761 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1751:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    1755:	a1 8c 43 00 00       	mov    0x438c,%eax
    175a:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    175d:	7c d0                	jl     172f <runCalcmd+0x266>
    175f:	eb 01                	jmp    1762 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1761:	90                   	nop
              }
              if(index == v_num) //new variable
    1762:	a1 8c 43 00 00       	mov    0x438c,%eax
    1767:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    176a:	75 3c                	jne    17a8 <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    176c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    176f:	c1 e0 05             	shl    $0x5,%eax
    1772:	05 c0 43 00 00       	add    $0x43c0,%eax
    1777:	8d 50 04             	lea    0x4(%eax),%edx
    177a:	83 ec 08             	sub    $0x8,%esp
    177d:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1780:	50                   	push   %eax
    1781:	52                   	push   %edx
    1782:	e8 cb e8 ff ff       	call   52 <strcpy>
    1787:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    178a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    178d:	c1 e0 05             	shl    $0x5,%eax
    1790:	05 c0 43 00 00       	add    $0x43c0,%eax
    1795:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    179b:	a1 8c 43 00 00       	mov    0x438c,%eax
    17a0:	83 c0 01             	add    $0x1,%eax
    17a3:	a3 8c 43 00 00       	mov    %eax,0x438c
              }
              variables[index].value.dvalue = result;
    17a8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17ab:	c1 e0 05             	shl    $0x5,%eax
    17ae:	05 d0 43 00 00       	add    $0x43d0,%eax
    17b3:	dd 45 c0             	fldl   -0x40(%ebp)
    17b6:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    17b9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17bc:	c1 e0 05             	shl    $0x5,%eax
    17bf:	05 d0 43 00 00       	add    $0x43d0,%eax
    17c4:	dd 40 08             	fldl   0x8(%eax)
    17c7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17ca:	c1 e0 05             	shl    $0x5,%eax
    17cd:	05 c0 43 00 00       	add    $0x43c0,%eax
    17d2:	83 c0 04             	add    $0x4,%eax
    17d5:	83 ec 0c             	sub    $0xc,%esp
    17d8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    17dc:	dd 1c 24             	fstpl  (%esp)
    17df:	50                   	push   %eax
    17e0:	68 e2 36 00 00       	push   $0x36e2
    17e5:	6a 01                	push   $0x1
    17e7:	e8 43 ed ff ff       	call   52f <printf>
    17ec:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    17ef:	83 ec 08             	sub    $0x8,%esp
    17f2:	68 8c 43 00 00       	push   $0x438c
    17f7:	68 c0 43 00 00       	push   $0x43c0
    17fc:	e8 90 1b 00 00       	call   3391 <writeVariables>
    1801:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1804:	e9 ac 02 00 00       	jmp    1ab5 <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    1809:	8b 55 e0             	mov    -0x20(%ebp),%edx
    180c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    180f:	01 d0                	add    %edx,%eax
    1811:	0f b6 00             	movzbl (%eax),%eax
    1814:	84 c0                	test   %al,%al
    1816:	75 1d                	jne    1835 <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    1818:	83 ec 0c             	sub    $0xc,%esp
    181b:	68 e9 36 00 00       	push   $0x36e9
    1820:	6a 00                	push   $0x0
    1822:	6a 00                	push   $0x0
    1824:	6a 01                	push   $0x1
    1826:	6a 04                	push   $0x4
    1828:	e8 2a 14 00 00       	call   2c57 <color_printf>
    182d:	83 c4 20             	add    $0x20,%esp
    1830:	e9 81 02 00 00       	jmp    1ab6 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    1835:	83 ec 0c             	sub    $0xc,%esp
    1838:	68 00 37 00 00       	push   $0x3700
    183d:	6a 00                	push   $0x0
    183f:	6a 00                	push   $0x0
    1841:	6a 01                	push   $0x1
    1843:	6a 04                	push   $0x4
    1845:	e8 0d 14 00 00       	call   2c57 <color_printf>
    184a:	83 c4 20             	add    $0x20,%esp
    184d:	e9 64 02 00 00       	jmp    1ab6 <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1852:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1855:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1858:	01 d0                	add    %edx,%eax
    185a:	0f b6 00             	movzbl (%eax),%eax
    185d:	3c 22                	cmp    $0x22,%al
    185f:	0f 85 d5 01 00 00    	jne    1a3a <runCalcmd+0x571>
        {
          i++;
    1865:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    1869:	8b 45 e0             	mov    -0x20(%ebp),%eax
    186c:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    186f:	eb 04                	jmp    1875 <runCalcmd+0x3ac>
          {
            i++;
    1871:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1875:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1878:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    187b:	01 d0                	add    %edx,%eax
    187d:	0f b6 00             	movzbl (%eax),%eax
    1880:	3c 22                	cmp    $0x22,%al
    1882:	74 0f                	je     1893 <runCalcmd+0x3ca>
    1884:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1887:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    188a:	01 d0                	add    %edx,%eax
    188c:	0f b6 00             	movzbl (%eax),%eax
    188f:	84 c0                	test   %al,%al
    1891:	75 de                	jne    1871 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1893:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1896:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1899:	01 d0                	add    %edx,%eax
    189b:	0f b6 00             	movzbl (%eax),%eax
    189e:	3c 22                	cmp    $0x22,%al
    18a0:	0f 85 4e 01 00 00    	jne    19f4 <runCalcmd+0x52b>
    18a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18a9:	8d 50 01             	lea    0x1(%eax),%edx
    18ac:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18af:	01 d0                	add    %edx,%eax
    18b1:	0f b6 00             	movzbl (%eax),%eax
    18b4:	84 c0                	test   %al,%al
    18b6:	0f 85 38 01 00 00    	jne    19f4 <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    18bc:	a1 8c 43 00 00       	mov    0x438c,%eax
    18c1:	85 c0                	test   %eax,%eax
    18c3:	75 15                	jne    18da <runCalcmd+0x411>
              readVariables(variables,&v_num);
    18c5:	83 ec 08             	sub    $0x8,%esp
    18c8:	68 8c 43 00 00       	push   $0x438c
    18cd:	68 c0 43 00 00       	push   $0x43c0
    18d2:	e8 06 18 00 00       	call   30dd <readVariables>
    18d7:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    18da:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    18e1:	eb 26                	jmp    1909 <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    18e3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    18e6:	c1 e0 05             	shl    $0x5,%eax
    18e9:	05 c0 43 00 00       	add    $0x43c0,%eax
    18ee:	8d 50 04             	lea    0x4(%eax),%edx
    18f1:	83 ec 08             	sub    $0x8,%esp
    18f4:	8d 45 94             	lea    -0x6c(%ebp),%eax
    18f7:	50                   	push   %eax
    18f8:	52                   	push   %edx
    18f9:	e8 84 e7 ff ff       	call   82 <strcmp>
    18fe:	83 c4 10             	add    $0x10,%esp
    1901:	85 c0                	test   %eax,%eax
    1903:	74 10                	je     1915 <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    1905:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1909:	a1 8c 43 00 00       	mov    0x438c,%eax
    190e:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1911:	7c d0                	jl     18e3 <runCalcmd+0x41a>
    1913:	eb 01                	jmp    1916 <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    1915:	90                   	nop
            }
            if(index == v_num) //new variable
    1916:	a1 8c 43 00 00       	mov    0x438c,%eax
    191b:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    191e:	75 2b                	jne    194b <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1920:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1923:	c1 e0 05             	shl    $0x5,%eax
    1926:	05 c0 43 00 00       	add    $0x43c0,%eax
    192b:	8d 50 04             	lea    0x4(%eax),%edx
    192e:	83 ec 08             	sub    $0x8,%esp
    1931:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1934:	50                   	push   %eax
    1935:	52                   	push   %edx
    1936:	e8 17 e7 ff ff       	call   52 <strcpy>
    193b:	83 c4 10             	add    $0x10,%esp
              v_num++;
    193e:	a1 8c 43 00 00       	mov    0x438c,%eax
    1943:	83 c0 01             	add    $0x1,%eax
    1946:	a3 8c 43 00 00       	mov    %eax,0x438c
            }
            variables[index].type = V_STRING;
    194b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    194e:	c1 e0 05             	shl    $0x5,%eax
    1951:	05 c0 43 00 00       	add    $0x43c0,%eax
    1956:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    195c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    195f:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1962:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1965:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1968:	83 c0 01             	add    $0x1,%eax
    196b:	83 ec 0c             	sub    $0xc,%esp
    196e:	50                   	push   %eax
    196f:	e8 bd ee ff ff       	call   831 <malloc>
    1974:	83 c4 10             	add    $0x10,%esp
    1977:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    197a:	8b 55 bc             	mov    -0x44(%ebp),%edx
    197d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1980:	01 d0                	add    %edx,%eax
    1982:	83 ec 08             	sub    $0x8,%esp
    1985:	50                   	push   %eax
    1986:	ff 75 b4             	pushl  -0x4c(%ebp)
    1989:	e8 c4 e6 ff ff       	call   52 <strcpy>
    198e:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1991:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1994:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1997:	01 d0                	add    %edx,%eax
    1999:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    199c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    199f:	c1 e0 05             	shl    $0x5,%eax
    19a2:	8d 90 d8 43 00 00    	lea    0x43d8(%eax),%edx
    19a8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    19ab:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    19ad:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19b0:	c1 e0 05             	shl    $0x5,%eax
    19b3:	05 d8 43 00 00       	add    $0x43d8,%eax
    19b8:	8b 00                	mov    (%eax),%eax
    19ba:	8b 55 d8             	mov    -0x28(%ebp),%edx
    19bd:	c1 e2 05             	shl    $0x5,%edx
    19c0:	81 c2 c0 43 00 00    	add    $0x43c0,%edx
    19c6:	83 c2 04             	add    $0x4,%edx
    19c9:	50                   	push   %eax
    19ca:	52                   	push   %edx
    19cb:	68 21 37 00 00       	push   $0x3721
    19d0:	6a 01                	push   $0x1
    19d2:	e8 58 eb ff ff       	call   52f <printf>
    19d7:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    19da:	83 ec 08             	sub    $0x8,%esp
    19dd:	68 8c 43 00 00       	push   $0x438c
    19e2:	68 c0 43 00 00       	push   $0x43c0
    19e7:	e8 a5 19 00 00       	call   3391 <writeVariables>
    19ec:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    19ef:	e9 c2 00 00 00       	jmp    1ab6 <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    19f4:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19f7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19fa:	01 d0                	add    %edx,%eax
    19fc:	0f b6 00             	movzbl (%eax),%eax
    19ff:	84 c0                	test   %al,%al
    1a01:	75 1d                	jne    1a20 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1a03:	83 ec 0c             	sub    $0xc,%esp
    1a06:	68 2a 37 00 00       	push   $0x372a
    1a0b:	6a 00                	push   $0x0
    1a0d:	6a 00                	push   $0x0
    1a0f:	6a 01                	push   $0x1
    1a11:	6a 04                	push   $0x4
    1a13:	e8 3f 12 00 00       	call   2c57 <color_printf>
    1a18:	83 c4 20             	add    $0x20,%esp
    1a1b:	e9 96 00 00 00       	jmp    1ab6 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1a20:	83 ec 0c             	sub    $0xc,%esp
    1a23:	68 40 37 00 00       	push   $0x3740
    1a28:	6a 00                	push   $0x0
    1a2a:	6a 00                	push   $0x0
    1a2c:	6a 01                	push   $0x1
    1a2e:	6a 04                	push   $0x4
    1a30:	e8 22 12 00 00       	call   2c57 <color_printf>
    1a35:	83 c4 20             	add    $0x20,%esp
    1a38:	eb 7c                	jmp    1ab6 <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1a3a:	83 ec 0c             	sub    $0xc,%esp
    1a3d:	68 61 37 00 00       	push   $0x3761
    1a42:	6a 00                	push   $0x0
    1a44:	6a 00                	push   $0x0
    1a46:	6a 01                	push   $0x1
    1a48:	6a 04                	push   $0x4
    1a4a:	e8 08 12 00 00       	call   2c57 <color_printf>
    1a4f:	83 c4 20             	add    $0x20,%esp
    1a52:	eb 62                	jmp    1ab6 <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1a54:	83 ec 0c             	sub    $0xc,%esp
    1a57:	68 61 37 00 00       	push   $0x3761
    1a5c:	6a 00                	push   $0x0
    1a5e:	6a 00                	push   $0x0
    1a60:	6a 01                	push   $0x1
    1a62:	6a 04                	push   $0x4
    1a64:	e8 ee 11 00 00       	call   2c57 <color_printf>
    1a69:	83 c4 20             	add    $0x20,%esp
    1a6c:	eb 48                	jmp    1ab6 <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1a6e:	83 ec 0c             	sub    $0xc,%esp
    1a71:	ff 75 d4             	pushl  -0x2c(%ebp)
    1a74:	e8 2b 01 00 00       	call   1ba4 <Compute>
    1a79:	83 c4 10             	add    $0x10,%esp
    1a7c:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1a7f:	dd 05 28 38 00 00    	fldl   0x3828
    1a85:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1a89:	dd 1c 24             	fstpl  (%esp)
    1a8c:	ff 75 ac             	pushl  -0x54(%ebp)
    1a8f:	ff 75 a8             	pushl  -0x58(%ebp)
    1a92:	e8 96 f4 ff ff       	call   f2d <isEqual>
    1a97:	83 c4 10             	add    $0x10,%esp
    1a9a:	85 c0                	test   %eax,%eax
    1a9c:	75 18                	jne    1ab6 <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1a9e:	ff 75 ac             	pushl  -0x54(%ebp)
    1aa1:	ff 75 a8             	pushl  -0x58(%ebp)
    1aa4:	68 79 37 00 00       	push   $0x3779
    1aa9:	6a 01                	push   $0x1
    1aab:	e8 7f ea ff ff       	call   52f <printf>
    1ab0:	83 c4 10             	add    $0x10,%esp
    1ab3:	eb 01                	jmp    1ab6 <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1ab5:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1ab6:	e8 c8 e7 ff ff       	call   283 <exit>

00001abb <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1abb:	55                   	push   %ebp
    1abc:	89 e5                	mov    %esp,%ebp
    1abe:	83 ec 04             	sub    $0x4,%esp
    1ac1:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac4:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1ac7:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1acb:	83 e8 23             	sub    $0x23,%eax
    1ace:	83 f8 0c             	cmp    $0xc,%eax
    1ad1:	77 25                	ja     1af8 <GetLevel+0x3d>
    1ad3:	8b 04 85 80 37 00 00 	mov    0x3780(,%eax,4),%eax
    1ada:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1adc:	b8 01 00 00 00       	mov    $0x1,%eax
    1ae1:	eb 1a                	jmp    1afd <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1ae3:	b8 02 00 00 00       	mov    $0x2,%eax
    1ae8:	eb 13                	jmp    1afd <GetLevel+0x42>
    case '(':
        return 0;
    1aea:	b8 00 00 00 00       	mov    $0x0,%eax
    1aef:	eb 0c                	jmp    1afd <GetLevel+0x42>
    case '#':
        return -2;
    1af1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1af6:	eb 05                	jmp    1afd <GetLevel+0x42>
    };
    return -1;
    1af8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1afd:	c9                   	leave  
    1afe:	c3                   	ret    

00001aff <Operate>:

double Operate(double a1, char op, double a2)
{
    1aff:	55                   	push   %ebp
    1b00:	89 e5                	mov    %esp,%ebp
    1b02:	83 ec 28             	sub    $0x28,%esp
    1b05:	8b 45 10             	mov    0x10(%ebp),%eax
    1b08:	8b 55 08             	mov    0x8(%ebp),%edx
    1b0b:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1b0e:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b11:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1b14:	88 45 ec             	mov    %al,-0x14(%ebp)
    1b17:	8b 45 14             	mov    0x14(%ebp),%eax
    1b1a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1b1d:	8b 45 18             	mov    0x18(%ebp),%eax
    1b20:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1b23:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1b27:	83 f8 2b             	cmp    $0x2b,%eax
    1b2a:	74 18                	je     1b44 <Operate+0x45>
    1b2c:	83 f8 2b             	cmp    $0x2b,%eax
    1b2f:	7f 07                	jg     1b38 <Operate+0x39>
    1b31:	83 f8 2a             	cmp    $0x2a,%eax
    1b34:	74 1e                	je     1b54 <Operate+0x55>
    1b36:	eb 68                	jmp    1ba0 <Operate+0xa1>
    1b38:	83 f8 2d             	cmp    $0x2d,%eax
    1b3b:	74 0f                	je     1b4c <Operate+0x4d>
    1b3d:	83 f8 2f             	cmp    $0x2f,%eax
    1b40:	74 1a                	je     1b5c <Operate+0x5d>
    1b42:	eb 5c                	jmp    1ba0 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1b44:	dd 45 f0             	fldl   -0x10(%ebp)
    1b47:	dc 45 e0             	faddl  -0x20(%ebp)
    1b4a:	eb 56                	jmp    1ba2 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1b4c:	dd 45 f0             	fldl   -0x10(%ebp)
    1b4f:	dc 65 e0             	fsubl  -0x20(%ebp)
    1b52:	eb 4e                	jmp    1ba2 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1b54:	dd 45 f0             	fldl   -0x10(%ebp)
    1b57:	dc 4d e0             	fmull  -0x20(%ebp)
    1b5a:	eb 46                	jmp    1ba2 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1b5c:	d9 ee                	fldz   
    1b5e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1b62:	dd 1c 24             	fstpl  (%esp)
    1b65:	ff 75 e4             	pushl  -0x1c(%ebp)
    1b68:	ff 75 e0             	pushl  -0x20(%ebp)
    1b6b:	e8 bd f3 ff ff       	call   f2d <isEqual>
    1b70:	83 c4 10             	add    $0x10,%esp
    1b73:	83 f8 01             	cmp    $0x1,%eax
    1b76:	75 20                	jne    1b98 <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1b78:	83 ec 0c             	sub    $0xc,%esp
    1b7b:	68 b4 37 00 00       	push   $0x37b4
    1b80:	6a 00                	push   $0x0
    1b82:	6a 00                	push   $0x0
    1b84:	6a 01                	push   $0x1
    1b86:	6a 04                	push   $0x4
    1b88:	e8 ca 10 00 00       	call   2c57 <color_printf>
    1b8d:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1b90:	dd 05 28 38 00 00    	fldl   0x3828
    1b96:	eb 0a                	jmp    1ba2 <Operate+0xa3>
        }
        else
          return a1 / a2;
    1b98:	dd 45 f0             	fldl   -0x10(%ebp)
    1b9b:	dc 75 e0             	fdivl  -0x20(%ebp)
    1b9e:	eb 02                	jmp    1ba2 <Operate+0xa3>
    };
    return 1;
    1ba0:	d9 e8                	fld1   
}
    1ba2:	c9                   	leave  
    1ba3:	c3                   	ret    

00001ba4 <Compute>:

double Compute(char *s)
{
    1ba4:	55                   	push   %ebp
    1ba5:	89 e5                	mov    %esp,%ebp
    1ba7:	53                   	push   %ebx
    1ba8:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1bae:	e8 44 14 00 00       	call   2ff7 <dstack>
    1bb3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1bb6:	e8 73 13 00 00       	call   2f2e <cstack>
    1bbb:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1bbe:	83 ec 08             	sub    $0x8,%esp
    1bc1:	6a 23                	push   $0x23
    1bc3:	ff 75 e0             	pushl  -0x20(%ebp)
    1bc6:	e8 91 13 00 00       	call   2f5c <pushc>
    1bcb:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1bce:	83 ec 0c             	sub    $0xc,%esp
    1bd1:	ff 75 08             	pushl  0x8(%ebp)
    1bd4:	e8 e8 e4 ff ff       	call   c1 <strlen>
    1bd9:	83 c4 10             	add    $0x10,%esp
    1bdc:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1bdf:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1be6:	c7 05 a0 43 00 00 00 	movl   $0x0,0x43a0
    1bed:	00 00 00 
    1bf0:	e9 58 05 00 00       	jmp    214d <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1bf5:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1bfa:	89 c2                	mov    %eax,%edx
    1bfc:	8b 45 08             	mov    0x8(%ebp),%eax
    1bff:	01 d0                	add    %edx,%eax
    1c01:	0f b6 00             	movzbl (%eax),%eax
    1c04:	3c 24                	cmp    $0x24,%al
    1c06:	0f 85 f8 01 00 00    	jne    1e04 <Compute+0x260>
        {
          is_minus = 0;
    1c0c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1c13:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1c18:	83 c0 01             	add    $0x1,%eax
    1c1b:	a3 a0 43 00 00       	mov    %eax,0x43a0
          if(s[g_pos] != '{')
    1c20:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1c25:	89 c2                	mov    %eax,%edx
    1c27:	8b 45 08             	mov    0x8(%ebp),%eax
    1c2a:	01 d0                	add    %edx,%eax
    1c2c:	0f b6 00             	movzbl (%eax),%eax
    1c2f:	3c 7b                	cmp    $0x7b,%al
    1c31:	74 23                	je     1c56 <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1c33:	83 ec 0c             	sub    $0xc,%esp
    1c36:	68 cc 37 00 00       	push   $0x37cc
    1c3b:	6a 00                	push   $0x0
    1c3d:	6a 00                	push   $0x0
    1c3f:	6a 01                	push   $0x1
    1c41:	6a 04                	push   $0x4
    1c43:	e8 0f 10 00 00       	call   2c57 <color_printf>
    1c48:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1c4b:	dd 05 28 38 00 00    	fldl   0x3828
    1c51:	e9 24 06 00 00       	jmp    227a <Compute+0x6d6>
          }
          int i=g_pos+1;
    1c56:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1c5b:	83 c0 01             	add    $0x1,%eax
    1c5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1c61:	eb 13                	jmp    1c76 <Compute+0xd2>
          {
            if(s[i] == '}')
    1c63:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1c66:	8b 45 08             	mov    0x8(%ebp),%eax
    1c69:	01 d0                	add    %edx,%eax
    1c6b:	0f b6 00             	movzbl (%eax),%eax
    1c6e:	3c 7d                	cmp    $0x7d,%al
    1c70:	74 0e                	je     1c80 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1c72:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1c76:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c79:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1c7c:	7c e5                	jl     1c63 <Compute+0xbf>
    1c7e:	eb 01                	jmp    1c81 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1c80:	90                   	nop
          }
          if(s[i] != '}')
    1c81:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1c84:	8b 45 08             	mov    0x8(%ebp),%eax
    1c87:	01 d0                	add    %edx,%eax
    1c89:	0f b6 00             	movzbl (%eax),%eax
    1c8c:	3c 7d                	cmp    $0x7d,%al
    1c8e:	74 23                	je     1cb3 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1c90:	83 ec 0c             	sub    $0xc,%esp
    1c93:	68 da 37 00 00       	push   $0x37da
    1c98:	6a 00                	push   $0x0
    1c9a:	6a 00                	push   $0x0
    1c9c:	6a 01                	push   $0x1
    1c9e:	6a 04                	push   $0x4
    1ca0:	e8 b2 0f 00 00       	call   2c57 <color_printf>
    1ca5:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1ca8:	dd 05 28 38 00 00    	fldl   0x3828
    1cae:	e9 c7 05 00 00       	jmp    227a <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1cb3:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1cb8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1cbb:	29 c2                	sub    %eax,%edx
    1cbd:	89 d0                	mov    %edx,%eax
    1cbf:	83 e8 01             	sub    $0x1,%eax
    1cc2:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1cc5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1ccc:	eb 27                	jmp    1cf5 <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1cce:	8b 15 a0 43 00 00    	mov    0x43a0,%edx
    1cd4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1cd7:	01 d0                	add    %edx,%eax
    1cd9:	8d 50 01             	lea    0x1(%eax),%edx
    1cdc:	8b 45 08             	mov    0x8(%ebp),%eax
    1cdf:	01 d0                	add    %edx,%eax
    1ce1:	0f b6 00             	movzbl (%eax),%eax
    1ce4:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1cea:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1ced:	01 ca                	add    %ecx,%edx
    1cef:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1cf1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1cf5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1cf8:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1cfb:	7c d1                	jl     1cce <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1cfd:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1d03:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1d06:	01 d0                	add    %edx,%eax
    1d08:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1d0b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1d12:	a1 8c 43 00 00       	mov    0x438c,%eax
    1d17:	85 c0                	test   %eax,%eax
    1d19:	75 40                	jne    1d5b <Compute+0x1b7>
            readVariables(variables,&v_num);
    1d1b:	83 ec 08             	sub    $0x8,%esp
    1d1e:	68 8c 43 00 00       	push   $0x438c
    1d23:	68 c0 43 00 00       	push   $0x43c0
    1d28:	e8 b0 13 00 00       	call   30dd <readVariables>
    1d2d:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1d30:	eb 29                	jmp    1d5b <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1d32:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1d35:	c1 e0 05             	shl    $0x5,%eax
    1d38:	05 c0 43 00 00       	add    $0x43c0,%eax
    1d3d:	8d 50 04             	lea    0x4(%eax),%edx
    1d40:	83 ec 08             	sub    $0x8,%esp
    1d43:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1d49:	50                   	push   %eax
    1d4a:	52                   	push   %edx
    1d4b:	e8 32 e3 ff ff       	call   82 <strcmp>
    1d50:	83 c4 10             	add    $0x10,%esp
    1d53:	85 c0                	test   %eax,%eax
    1d55:	74 10                	je     1d67 <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1d57:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1d5b:	a1 8c 43 00 00       	mov    0x438c,%eax
    1d60:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1d63:	7c cd                	jl     1d32 <Compute+0x18e>
    1d65:	eb 01                	jmp    1d68 <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1d67:	90                   	nop
          }
          if(index == v_num) //no such variable
    1d68:	a1 8c 43 00 00       	mov    0x438c,%eax
    1d6d:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1d70:	75 2a                	jne    1d9c <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1d72:	83 ec 08             	sub    $0x8,%esp
    1d75:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1d7b:	50                   	push   %eax
    1d7c:	68 e8 37 00 00       	push   $0x37e8
    1d81:	6a 00                	push   $0x0
    1d83:	6a 00                	push   $0x0
    1d85:	6a 01                	push   $0x1
    1d87:	6a 04                	push   $0x4
    1d89:	e8 c9 0e 00 00       	call   2c57 <color_printf>
    1d8e:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1d91:	dd 05 28 38 00 00    	fldl   0x3828
    1d97:	e9 de 04 00 00       	jmp    227a <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1d9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1d9f:	c1 e0 05             	shl    $0x5,%eax
    1da2:	05 c0 43 00 00       	add    $0x43c0,%eax
    1da7:	8b 00                	mov    (%eax),%eax
    1da9:	83 f8 02             	cmp    $0x2,%eax
    1dac:	75 23                	jne    1dd1 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1dae:	83 ec 0c             	sub    $0xc,%esp
    1db1:	68 02 38 00 00       	push   $0x3802
    1db6:	6a 00                	push   $0x0
    1db8:	6a 00                	push   $0x0
    1dba:	6a 01                	push   $0x1
    1dbc:	6a 04                	push   $0x4
    1dbe:	e8 94 0e 00 00       	call   2c57 <color_printf>
    1dc3:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1dc6:	dd 05 28 38 00 00    	fldl   0x3828
    1dcc:	e9 a9 04 00 00       	jmp    227a <Compute+0x6d6>
          }
          g_pos = i+1;
    1dd1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1dd4:	83 c0 01             	add    $0x1,%eax
    1dd7:	a3 a0 43 00 00       	mov    %eax,0x43a0
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    1ddc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ddf:	c1 e0 05             	shl    $0x5,%eax
    1de2:	05 d0 43 00 00       	add    $0x43d0,%eax
    1de7:	dd 40 08             	fldl   0x8(%eax)
    1dea:	83 ec 04             	sub    $0x4,%esp
    1ded:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1df1:	dd 1c 24             	fstpl  (%esp)
    1df4:	ff 75 e4             	pushl  -0x1c(%ebp)
    1df7:	e8 2f 12 00 00       	call   302b <pushd>
    1dfc:	83 c4 10             	add    $0x10,%esp
    1dff:	e9 49 03 00 00       	jmp    214d <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    1e04:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1e09:	89 c2                	mov    %eax,%edx
    1e0b:	8b 45 08             	mov    0x8(%ebp),%eax
    1e0e:	01 d0                	add    %edx,%eax
    1e10:	0f b6 00             	movzbl (%eax),%eax
    1e13:	3c 2d                	cmp    $0x2d,%al
    1e15:	75 3f                	jne    1e56 <Compute+0x2b2>
    1e17:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e1b:	74 39                	je     1e56 <Compute+0x2b2>
        {
            pushd(opnd,0);
    1e1d:	83 ec 04             	sub    $0x4,%esp
    1e20:	d9 ee                	fldz   
    1e22:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e26:	dd 1c 24             	fstpl  (%esp)
    1e29:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e2c:	e8 fa 11 00 00       	call   302b <pushd>
    1e31:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    1e34:	83 ec 08             	sub    $0x8,%esp
    1e37:	6a 2d                	push   $0x2d
    1e39:	ff 75 e0             	pushl  -0x20(%ebp)
    1e3c:	e8 1b 11 00 00       	call   2f5c <pushc>
    1e41:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    1e44:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1e49:	83 c0 01             	add    $0x1,%eax
    1e4c:	a3 a0 43 00 00       	mov    %eax,0x43a0
    1e51:	e9 f7 02 00 00       	jmp    214d <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    1e56:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1e5b:	89 c2                	mov    %eax,%edx
    1e5d:	8b 45 08             	mov    0x8(%ebp),%eax
    1e60:	01 d0                	add    %edx,%eax
    1e62:	0f b6 00             	movzbl (%eax),%eax
    1e65:	3c 29                	cmp    $0x29,%al
    1e67:	0f 85 01 01 00 00    	jne    1f6e <Compute+0x3ca>
        {
            is_minus = 0;
    1e6d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    1e74:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1e79:	83 c0 01             	add    $0x1,%eax
    1e7c:	a3 a0 43 00 00       	mov    %eax,0x43a0
            while (topc(optr) != '(')
    1e81:	e9 bf 00 00 00       	jmp    1f45 <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    1e86:	83 ec 0c             	sub    $0xc,%esp
    1e89:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e8c:	e8 37 12 00 00       	call   30c8 <topd>
    1e91:	83 c4 10             	add    $0x10,%esp
    1e94:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    1e97:	83 ec 0c             	sub    $0xc,%esp
    1e9a:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e9d:	e8 dd 11 00 00       	call   307f <popd>
    1ea2:	dd d8                	fstp   %st(0)
    1ea4:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    1ea7:	83 ec 0c             	sub    $0xc,%esp
    1eaa:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ead:	e8 16 12 00 00       	call   30c8 <topd>
    1eb2:	83 c4 10             	add    $0x10,%esp
    1eb5:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    1eb8:	83 ec 0c             	sub    $0xc,%esp
    1ebb:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ebe:	e8 bc 11 00 00       	call   307f <popd>
    1ec3:	dd d8                	fstp   %st(0)
    1ec5:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    1ec8:	83 ec 0c             	sub    $0xc,%esp
    1ecb:	ff 75 e0             	pushl  -0x20(%ebp)
    1ece:	e8 11 11 00 00       	call   2fe4 <topc>
    1ed3:	83 c4 10             	add    $0x10,%esp
    1ed6:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    1ed9:	83 ec 0c             	sub    $0xc,%esp
    1edc:	ff 75 e0             	pushl  -0x20(%ebp)
    1edf:	e8 be 10 00 00       	call   2fa2 <popc>
    1ee4:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    1ee7:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    1eeb:	83 ec 0c             	sub    $0xc,%esp
    1eee:	ff 75 d4             	pushl  -0x2c(%ebp)
    1ef1:	ff 75 d0             	pushl  -0x30(%ebp)
    1ef4:	50                   	push   %eax
    1ef5:	ff 75 cc             	pushl  -0x34(%ebp)
    1ef8:	ff 75 c8             	pushl  -0x38(%ebp)
    1efb:	e8 ff fb ff ff       	call   1aff <Operate>
    1f00:	83 c4 20             	add    $0x20,%esp
    1f03:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    1f06:	dd 05 28 38 00 00    	fldl   0x3828
    1f0c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1f10:	dd 1c 24             	fstpl  (%esp)
    1f13:	ff 75 bc             	pushl  -0x44(%ebp)
    1f16:	ff 75 b8             	pushl  -0x48(%ebp)
    1f19:	e8 0f f0 ff ff       	call   f2d <isEqual>
    1f1e:	83 c4 10             	add    $0x10,%esp
    1f21:	83 f8 01             	cmp    $0x1,%eax
    1f24:	75 0b                	jne    1f31 <Compute+0x38d>
                  return WRONG_ANS;
    1f26:	dd 05 28 38 00 00    	fldl   0x3828
    1f2c:	e9 49 03 00 00       	jmp    227a <Compute+0x6d6>
                pushd(opnd,result);
    1f31:	83 ec 04             	sub    $0x4,%esp
    1f34:	ff 75 bc             	pushl  -0x44(%ebp)
    1f37:	ff 75 b8             	pushl  -0x48(%ebp)
    1f3a:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f3d:	e8 e9 10 00 00       	call   302b <pushd>
    1f42:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    1f45:	83 ec 0c             	sub    $0xc,%esp
    1f48:	ff 75 e0             	pushl  -0x20(%ebp)
    1f4b:	e8 94 10 00 00       	call   2fe4 <topc>
    1f50:	83 c4 10             	add    $0x10,%esp
    1f53:	3c 28                	cmp    $0x28,%al
    1f55:	0f 85 2b ff ff ff    	jne    1e86 <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    1f5b:	83 ec 0c             	sub    $0xc,%esp
    1f5e:	ff 75 e0             	pushl  -0x20(%ebp)
    1f61:	e8 3c 10 00 00       	call   2fa2 <popc>
    1f66:	83 c4 10             	add    $0x10,%esp
    1f69:	e9 df 01 00 00       	jmp    214d <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    1f6e:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1f73:	89 c2                	mov    %eax,%edx
    1f75:	8b 45 08             	mov    0x8(%ebp),%eax
    1f78:	01 d0                	add    %edx,%eax
    1f7a:	0f b6 00             	movzbl (%eax),%eax
    1f7d:	3c 2f                	cmp    $0x2f,%al
    1f7f:	7e 49                	jle    1fca <Compute+0x426>
    1f81:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1f86:	89 c2                	mov    %eax,%edx
    1f88:	8b 45 08             	mov    0x8(%ebp),%eax
    1f8b:	01 d0                	add    %edx,%eax
    1f8d:	0f b6 00             	movzbl (%eax),%eax
    1f90:	3c 39                	cmp    $0x39,%al
    1f92:	7f 36                	jg     1fca <Compute+0x426>
        {
            is_minus = 0;
    1f94:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    1f9b:	83 ec 08             	sub    $0x8,%esp
    1f9e:	68 a0 43 00 00       	push   $0x43a0
    1fa3:	ff 75 08             	pushl  0x8(%ebp)
    1fa6:	e8 c3 eb ff ff       	call   b6e <Translation>
    1fab:	83 c4 10             	add    $0x10,%esp
    1fae:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    1fb1:	83 ec 04             	sub    $0x4,%esp
    1fb4:	ff 75 b4             	pushl  -0x4c(%ebp)
    1fb7:	ff 75 b0             	pushl  -0x50(%ebp)
    1fba:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fbd:	e8 69 10 00 00       	call   302b <pushd>
    1fc2:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    1fc5:	e9 83 01 00 00       	jmp    214d <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    1fca:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1fcf:	89 c2                	mov    %eax,%edx
    1fd1:	8b 45 08             	mov    0x8(%ebp),%eax
    1fd4:	01 d0                	add    %edx,%eax
    1fd6:	0f b6 00             	movzbl (%eax),%eax
    1fd9:	3c 28                	cmp    $0x28,%al
    1fdb:	0f 85 f9 00 00 00    	jne    20da <Compute+0x536>
        {
            is_minus = 1;
    1fe1:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    1fe8:	a1 a0 43 00 00       	mov    0x43a0,%eax
    1fed:	89 c2                	mov    %eax,%edx
    1fef:	8b 45 08             	mov    0x8(%ebp),%eax
    1ff2:	01 d0                	add    %edx,%eax
    1ff4:	0f b6 00             	movzbl (%eax),%eax
    1ff7:	0f be c0             	movsbl %al,%eax
    1ffa:	83 ec 08             	sub    $0x8,%esp
    1ffd:	50                   	push   %eax
    1ffe:	ff 75 e0             	pushl  -0x20(%ebp)
    2001:	e8 56 0f 00 00       	call   2f5c <pushc>
    2006:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2009:	a1 a0 43 00 00       	mov    0x43a0,%eax
    200e:	83 c0 01             	add    $0x1,%eax
    2011:	a3 a0 43 00 00       	mov    %eax,0x43a0
    2016:	e9 32 01 00 00       	jmp    214d <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    201b:	83 ec 0c             	sub    $0xc,%esp
    201e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2021:	e8 a2 10 00 00       	call   30c8 <topd>
    2026:	83 c4 10             	add    $0x10,%esp
    2029:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    202c:	83 ec 0c             	sub    $0xc,%esp
    202f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2032:	e8 48 10 00 00       	call   307f <popd>
    2037:	dd d8                	fstp   %st(0)
    2039:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    203c:	83 ec 0c             	sub    $0xc,%esp
    203f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2042:	e8 81 10 00 00       	call   30c8 <topd>
    2047:	83 c4 10             	add    $0x10,%esp
    204a:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    204d:	83 ec 0c             	sub    $0xc,%esp
    2050:	ff 75 e4             	pushl  -0x1c(%ebp)
    2053:	e8 27 10 00 00       	call   307f <popd>
    2058:	dd d8                	fstp   %st(0)
    205a:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    205d:	83 ec 0c             	sub    $0xc,%esp
    2060:	ff 75 e0             	pushl  -0x20(%ebp)
    2063:	e8 7c 0f 00 00       	call   2fe4 <topc>
    2068:	83 c4 10             	add    $0x10,%esp
    206b:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    206e:	83 ec 0c             	sub    $0xc,%esp
    2071:	ff 75 e0             	pushl  -0x20(%ebp)
    2074:	e8 29 0f 00 00       	call   2fa2 <popc>
    2079:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    207c:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    2080:	83 ec 0c             	sub    $0xc,%esp
    2083:	ff 75 ac             	pushl  -0x54(%ebp)
    2086:	ff 75 a8             	pushl  -0x58(%ebp)
    2089:	50                   	push   %eax
    208a:	ff 75 a4             	pushl  -0x5c(%ebp)
    208d:	ff 75 a0             	pushl  -0x60(%ebp)
    2090:	e8 6a fa ff ff       	call   1aff <Operate>
    2095:	83 c4 20             	add    $0x20,%esp
    2098:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    209b:	dd 05 28 38 00 00    	fldl   0x3828
    20a1:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    20a5:	dd 1c 24             	fstpl  (%esp)
    20a8:	ff 75 94             	pushl  -0x6c(%ebp)
    20ab:	ff 75 90             	pushl  -0x70(%ebp)
    20ae:	e8 7a ee ff ff       	call   f2d <isEqual>
    20b3:	83 c4 10             	add    $0x10,%esp
    20b6:	83 f8 01             	cmp    $0x1,%eax
    20b9:	75 0b                	jne    20c6 <Compute+0x522>
                  return WRONG_ANS;
    20bb:	dd 05 28 38 00 00    	fldl   0x3828
    20c1:	e9 b4 01 00 00       	jmp    227a <Compute+0x6d6>
                pushd(opnd,result);
    20c6:	83 ec 04             	sub    $0x4,%esp
    20c9:	ff 75 94             	pushl  -0x6c(%ebp)
    20cc:	ff 75 90             	pushl  -0x70(%ebp)
    20cf:	ff 75 e4             	pushl  -0x1c(%ebp)
    20d2:	e8 54 0f 00 00       	call   302b <pushd>
    20d7:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    20da:	a1 a0 43 00 00       	mov    0x43a0,%eax
    20df:	89 c2                	mov    %eax,%edx
    20e1:	8b 45 08             	mov    0x8(%ebp),%eax
    20e4:	01 d0                	add    %edx,%eax
    20e6:	0f b6 00             	movzbl (%eax),%eax
    20e9:	0f be c0             	movsbl %al,%eax
    20ec:	83 ec 0c             	sub    $0xc,%esp
    20ef:	50                   	push   %eax
    20f0:	e8 c6 f9 ff ff       	call   1abb <GetLevel>
    20f5:	83 c4 10             	add    $0x10,%esp
    20f8:	89 c3                	mov    %eax,%ebx
    20fa:	83 ec 0c             	sub    $0xc,%esp
    20fd:	ff 75 e0             	pushl  -0x20(%ebp)
    2100:	e8 df 0e 00 00       	call   2fe4 <topc>
    2105:	83 c4 10             	add    $0x10,%esp
    2108:	0f be c0             	movsbl %al,%eax
    210b:	83 ec 0c             	sub    $0xc,%esp
    210e:	50                   	push   %eax
    210f:	e8 a7 f9 ff ff       	call   1abb <GetLevel>
    2114:	83 c4 10             	add    $0x10,%esp
    2117:	39 c3                	cmp    %eax,%ebx
    2119:	0f 8e fc fe ff ff    	jle    201b <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    211f:	a1 a0 43 00 00       	mov    0x43a0,%eax
    2124:	89 c2                	mov    %eax,%edx
    2126:	8b 45 08             	mov    0x8(%ebp),%eax
    2129:	01 d0                	add    %edx,%eax
    212b:	0f b6 00             	movzbl (%eax),%eax
    212e:	0f be c0             	movsbl %al,%eax
    2131:	83 ec 08             	sub    $0x8,%esp
    2134:	50                   	push   %eax
    2135:	ff 75 e0             	pushl  -0x20(%ebp)
    2138:	e8 1f 0e 00 00       	call   2f5c <pushc>
    213d:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2140:	a1 a0 43 00 00       	mov    0x43a0,%eax
    2145:	83 c0 01             	add    $0x1,%eax
    2148:	a3 a0 43 00 00       	mov    %eax,0x43a0
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    214d:	a1 a0 43 00 00       	mov    0x43a0,%eax
    2152:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    2155:	0f 8c 9a fa ff ff    	jl     1bf5 <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    215b:	e9 da 00 00 00       	jmp    223a <Compute+0x696>
    {
        double a2 = topd(opnd);
    2160:	83 ec 0c             	sub    $0xc,%esp
    2163:	ff 75 e4             	pushl  -0x1c(%ebp)
    2166:	e8 5d 0f 00 00       	call   30c8 <topd>
    216b:	83 c4 10             	add    $0x10,%esp
    216e:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    2171:	83 ec 0c             	sub    $0xc,%esp
    2174:	ff 75 e4             	pushl  -0x1c(%ebp)
    2177:	e8 03 0f 00 00       	call   307f <popd>
    217c:	dd d8                	fstp   %st(0)
    217e:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    2181:	83 ec 0c             	sub    $0xc,%esp
    2184:	ff 75 e4             	pushl  -0x1c(%ebp)
    2187:	e8 3c 0f 00 00       	call   30c8 <topd>
    218c:	83 c4 10             	add    $0x10,%esp
    218f:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    2195:	83 ec 0c             	sub    $0xc,%esp
    2198:	ff 75 e4             	pushl  -0x1c(%ebp)
    219b:	e8 df 0e 00 00       	call   307f <popd>
    21a0:	dd d8                	fstp   %st(0)
    21a2:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    21a5:	83 ec 0c             	sub    $0xc,%esp
    21a8:	ff 75 e0             	pushl  -0x20(%ebp)
    21ab:	e8 34 0e 00 00       	call   2fe4 <topc>
    21b0:	83 c4 10             	add    $0x10,%esp
    21b3:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    21b9:	83 ec 0c             	sub    $0xc,%esp
    21bc:	ff 75 e0             	pushl  -0x20(%ebp)
    21bf:	e8 de 0d 00 00       	call   2fa2 <popc>
    21c4:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    21c7:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    21ce:	83 ec 0c             	sub    $0xc,%esp
    21d1:	ff 75 84             	pushl  -0x7c(%ebp)
    21d4:	ff 75 80             	pushl  -0x80(%ebp)
    21d7:	50                   	push   %eax
    21d8:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    21de:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    21e4:	e8 16 f9 ff ff       	call   1aff <Operate>
    21e9:	83 c4 20             	add    $0x20,%esp
    21ec:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    21f2:	dd 05 28 38 00 00    	fldl   0x3828
    21f8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    21fc:	dd 1c 24             	fstpl  (%esp)
    21ff:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2205:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    220b:	e8 1d ed ff ff       	call   f2d <isEqual>
    2210:	83 c4 10             	add    $0x10,%esp
    2213:	83 f8 01             	cmp    $0x1,%eax
    2216:	75 08                	jne    2220 <Compute+0x67c>
          return WRONG_ANS;
    2218:	dd 05 28 38 00 00    	fldl   0x3828
    221e:	eb 5a                	jmp    227a <Compute+0x6d6>
        pushd(opnd,result);
    2220:	83 ec 04             	sub    $0x4,%esp
    2223:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2229:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    222f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2232:	e8 f4 0d 00 00       	call   302b <pushd>
    2237:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    223a:	83 ec 0c             	sub    $0xc,%esp
    223d:	ff 75 e0             	pushl  -0x20(%ebp)
    2240:	e8 9f 0d 00 00       	call   2fe4 <topc>
    2245:	83 c4 10             	add    $0x10,%esp
    2248:	3c 23                	cmp    $0x23,%al
    224a:	0f 85 10 ff ff ff    	jne    2160 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    2250:	83 ec 0c             	sub    $0xc,%esp
    2253:	ff 75 e4             	pushl  -0x1c(%ebp)
    2256:	e8 94 e4 ff ff       	call   6ef <free>
    225b:	83 c4 10             	add    $0x10,%esp
    free(optr);
    225e:	83 ec 0c             	sub    $0xc,%esp
    2261:	ff 75 e0             	pushl  -0x20(%ebp)
    2264:	e8 86 e4 ff ff       	call   6ef <free>
    2269:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    226c:	83 ec 0c             	sub    $0xc,%esp
    226f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2272:	e8 51 0e 00 00       	call   30c8 <topd>
    2277:	83 c4 10             	add    $0x10,%esp
}
    227a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    227d:	c9                   	leave  
    227e:	c3                   	ret    

0000227f <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    227f:	55                   	push   %ebp
    2280:	89 e5                	mov    %esp,%ebp
    2282:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    2285:	8b 45 08             	mov    0x8(%ebp),%eax
    2288:	8b 00                	mov    (%eax),%eax
    228a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    228d:	eb 04                	jmp    2293 <gettoken+0x14>
    s++;
    228f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2293:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2296:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2299:	73 1e                	jae    22b9 <gettoken+0x3a>
    229b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    229e:	0f b6 00             	movzbl (%eax),%eax
    22a1:	0f be c0             	movsbl %al,%eax
    22a4:	83 ec 08             	sub    $0x8,%esp
    22a7:	50                   	push   %eax
    22a8:	68 54 43 00 00       	push   $0x4354
    22ad:	e8 50 de ff ff       	call   102 <strchr>
    22b2:	83 c4 10             	add    $0x10,%esp
    22b5:	85 c0                	test   %eax,%eax
    22b7:	75 d6                	jne    228f <gettoken+0x10>
    s++;
  if(q)
    22b9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    22bd:	74 08                	je     22c7 <gettoken+0x48>
    *q = s;
    22bf:	8b 45 10             	mov    0x10(%ebp),%eax
    22c2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    22c5:	89 10                	mov    %edx,(%eax)
  ret = *s;
    22c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22ca:	0f b6 00             	movzbl (%eax),%eax
    22cd:	0f be c0             	movsbl %al,%eax
    22d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    22d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22d6:	0f b6 00             	movzbl (%eax),%eax
    22d9:	0f be c0             	movsbl %al,%eax
    22dc:	83 f8 29             	cmp    $0x29,%eax
    22df:	7f 14                	jg     22f5 <gettoken+0x76>
    22e1:	83 f8 28             	cmp    $0x28,%eax
    22e4:	7d 28                	jge    230e <gettoken+0x8f>
    22e6:	85 c0                	test   %eax,%eax
    22e8:	0f 84 94 00 00 00    	je     2382 <gettoken+0x103>
    22ee:	83 f8 26             	cmp    $0x26,%eax
    22f1:	74 1b                	je     230e <gettoken+0x8f>
    22f3:	eb 3a                	jmp    232f <gettoken+0xb0>
    22f5:	83 f8 3e             	cmp    $0x3e,%eax
    22f8:	74 1a                	je     2314 <gettoken+0x95>
    22fa:	83 f8 3e             	cmp    $0x3e,%eax
    22fd:	7f 0a                	jg     2309 <gettoken+0x8a>
    22ff:	83 e8 3b             	sub    $0x3b,%eax
    2302:	83 f8 01             	cmp    $0x1,%eax
    2305:	77 28                	ja     232f <gettoken+0xb0>
    2307:	eb 05                	jmp    230e <gettoken+0x8f>
    2309:	83 f8 7c             	cmp    $0x7c,%eax
    230c:	75 21                	jne    232f <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    230e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    2312:	eb 75                	jmp    2389 <gettoken+0x10a>
  case '>':
    s++;
    2314:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    2318:	8b 45 f4             	mov    -0xc(%ebp),%eax
    231b:	0f b6 00             	movzbl (%eax),%eax
    231e:	3c 3e                	cmp    $0x3e,%al
    2320:	75 63                	jne    2385 <gettoken+0x106>
      ret = '+';
    2322:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    2329:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    232d:	eb 56                	jmp    2385 <gettoken+0x106>
  default:
    ret = 'a';
    232f:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2336:	eb 04                	jmp    233c <gettoken+0xbd>
      s++;
    2338:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    233c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    233f:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2342:	73 44                	jae    2388 <gettoken+0x109>
    2344:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2347:	0f b6 00             	movzbl (%eax),%eax
    234a:	0f be c0             	movsbl %al,%eax
    234d:	83 ec 08             	sub    $0x8,%esp
    2350:	50                   	push   %eax
    2351:	68 54 43 00 00       	push   $0x4354
    2356:	e8 a7 dd ff ff       	call   102 <strchr>
    235b:	83 c4 10             	add    $0x10,%esp
    235e:	85 c0                	test   %eax,%eax
    2360:	75 26                	jne    2388 <gettoken+0x109>
    2362:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2365:	0f b6 00             	movzbl (%eax),%eax
    2368:	0f be c0             	movsbl %al,%eax
    236b:	83 ec 08             	sub    $0x8,%esp
    236e:	50                   	push   %eax
    236f:	68 5c 43 00 00       	push   $0x435c
    2374:	e8 89 dd ff ff       	call   102 <strchr>
    2379:	83 c4 10             	add    $0x10,%esp
    237c:	85 c0                	test   %eax,%eax
    237e:	74 b8                	je     2338 <gettoken+0xb9>
      s++;
    break;
    2380:	eb 06                	jmp    2388 <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    2382:	90                   	nop
    2383:	eb 04                	jmp    2389 <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    2385:	90                   	nop
    2386:	eb 01                	jmp    2389 <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    2388:	90                   	nop
  }
  if(eq)
    2389:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    238d:	74 0e                	je     239d <gettoken+0x11e>
    *eq = s;
    238f:	8b 45 14             	mov    0x14(%ebp),%eax
    2392:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2395:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    2397:	eb 04                	jmp    239d <gettoken+0x11e>
    s++;
    2399:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    239d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23a0:	3b 45 0c             	cmp    0xc(%ebp),%eax
    23a3:	73 1e                	jae    23c3 <gettoken+0x144>
    23a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23a8:	0f b6 00             	movzbl (%eax),%eax
    23ab:	0f be c0             	movsbl %al,%eax
    23ae:	83 ec 08             	sub    $0x8,%esp
    23b1:	50                   	push   %eax
    23b2:	68 54 43 00 00       	push   $0x4354
    23b7:	e8 46 dd ff ff       	call   102 <strchr>
    23bc:	83 c4 10             	add    $0x10,%esp
    23bf:	85 c0                	test   %eax,%eax
    23c1:	75 d6                	jne    2399 <gettoken+0x11a>
    s++;
  *ps = s;
    23c3:	8b 45 08             	mov    0x8(%ebp),%eax
    23c6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    23c9:	89 10                	mov    %edx,(%eax)
  return ret;
    23cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    23ce:	c9                   	leave  
    23cf:	c3                   	ret    

000023d0 <peek>:

int peek(char **ps, char *es, char *toks)
{
    23d0:	55                   	push   %ebp
    23d1:	89 e5                	mov    %esp,%ebp
    23d3:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    23d6:	8b 45 08             	mov    0x8(%ebp),%eax
    23d9:	8b 00                	mov    (%eax),%eax
    23db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    23de:	eb 04                	jmp    23e4 <peek+0x14>
    s++;
    23e0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    23e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23e7:	3b 45 0c             	cmp    0xc(%ebp),%eax
    23ea:	73 1e                	jae    240a <peek+0x3a>
    23ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23ef:	0f b6 00             	movzbl (%eax),%eax
    23f2:	0f be c0             	movsbl %al,%eax
    23f5:	83 ec 08             	sub    $0x8,%esp
    23f8:	50                   	push   %eax
    23f9:	68 54 43 00 00       	push   $0x4354
    23fe:	e8 ff dc ff ff       	call   102 <strchr>
    2403:	83 c4 10             	add    $0x10,%esp
    2406:	85 c0                	test   %eax,%eax
    2408:	75 d6                	jne    23e0 <peek+0x10>
    s++;
  *ps = s;
    240a:	8b 45 08             	mov    0x8(%ebp),%eax
    240d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2410:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    2412:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2415:	0f b6 00             	movzbl (%eax),%eax
    2418:	84 c0                	test   %al,%al
    241a:	74 23                	je     243f <peek+0x6f>
    241c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    241f:	0f b6 00             	movzbl (%eax),%eax
    2422:	0f be c0             	movsbl %al,%eax
    2425:	83 ec 08             	sub    $0x8,%esp
    2428:	50                   	push   %eax
    2429:	ff 75 10             	pushl  0x10(%ebp)
    242c:	e8 d1 dc ff ff       	call   102 <strchr>
    2431:	83 c4 10             	add    $0x10,%esp
    2434:	85 c0                	test   %eax,%eax
    2436:	74 07                	je     243f <peek+0x6f>
    2438:	b8 01 00 00 00       	mov    $0x1,%eax
    243d:	eb 05                	jmp    2444 <peek+0x74>
    243f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    2444:	c9                   	leave  
    2445:	c3                   	ret    

00002446 <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    2446:	55                   	push   %ebp
    2447:	89 e5                	mov    %esp,%ebp
    2449:	53                   	push   %ebx
    244a:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    244d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2450:	8b 45 08             	mov    0x8(%ebp),%eax
    2453:	83 ec 0c             	sub    $0xc,%esp
    2456:	50                   	push   %eax
    2457:	e8 65 dc ff ff       	call   c1 <strlen>
    245c:	83 c4 10             	add    $0x10,%esp
    245f:	01 d8                	add    %ebx,%eax
    2461:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    2464:	8b 45 08             	mov    0x8(%ebp),%eax
    2467:	0f b6 00             	movzbl (%eax),%eax
    246a:	3c 25                	cmp    $0x25,%al
    246c:	75 5d                	jne    24cb <parsecmd+0x85>
  {
    int len = strlen(s);
    246e:	8b 45 08             	mov    0x8(%ebp),%eax
    2471:	83 ec 0c             	sub    $0xc,%esp
    2474:	50                   	push   %eax
    2475:	e8 47 dc ff ff       	call   c1 <strlen>
    247a:	83 c4 10             	add    $0x10,%esp
    247d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    2480:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2483:	83 ec 0c             	sub    $0xc,%esp
    2486:	50                   	push   %eax
    2487:	e8 a5 e3 ff ff       	call   831 <malloc>
    248c:	83 c4 10             	add    $0x10,%esp
    248f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    2492:	8b 45 08             	mov    0x8(%ebp),%eax
    2495:	83 c0 01             	add    $0x1,%eax
    2498:	83 ec 08             	sub    $0x8,%esp
    249b:	50                   	push   %eax
    249c:	ff 75 ec             	pushl  -0x14(%ebp)
    249f:	e8 ae db ff ff       	call   52 <strcpy>
    24a4:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    24a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24aa:	8d 50 fe             	lea    -0x2(%eax),%edx
    24ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24b0:	01 d0                	add    %edx,%eax
    24b2:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    24b5:	83 ec 0c             	sub    $0xc,%esp
    24b8:	ff 75 ec             	pushl  -0x14(%ebp)
    24bb:	e8 59 e9 ff ff       	call   e19 <calcmd>
    24c0:	83 c4 10             	add    $0x10,%esp
    24c3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    24c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    24c9:	eb 6b                	jmp    2536 <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    24cb:	83 ec 08             	sub    $0x8,%esp
    24ce:	ff 75 f4             	pushl  -0xc(%ebp)
    24d1:	8d 45 08             	lea    0x8(%ebp),%eax
    24d4:	50                   	push   %eax
    24d5:	e8 61 00 00 00       	call   253b <parseline>
    24da:	83 c4 10             	add    $0x10,%esp
    24dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    24e0:	83 ec 04             	sub    $0x4,%esp
    24e3:	68 30 38 00 00       	push   $0x3830
    24e8:	ff 75 f4             	pushl  -0xc(%ebp)
    24eb:	8d 45 08             	lea    0x8(%ebp),%eax
    24ee:	50                   	push   %eax
    24ef:	e8 dc fe ff ff       	call   23d0 <peek>
    24f4:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    24f7:	8b 45 08             	mov    0x8(%ebp),%eax
    24fa:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    24fd:	74 26                	je     2525 <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    24ff:	8b 45 08             	mov    0x8(%ebp),%eax
    2502:	83 ec 04             	sub    $0x4,%esp
    2505:	50                   	push   %eax
    2506:	68 31 38 00 00       	push   $0x3831
    250b:	6a 02                	push   $0x2
    250d:	e8 1d e0 ff ff       	call   52f <printf>
    2512:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    2515:	83 ec 0c             	sub    $0xc,%esp
    2518:	68 40 38 00 00       	push   $0x3840
    251d:	e8 f2 e3 ff ff       	call   914 <panic1>
    2522:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    2525:	83 ec 0c             	sub    $0xc,%esp
    2528:	ff 75 e4             	pushl  -0x1c(%ebp)
    252b:	e8 eb 03 00 00       	call   291b <nulterminate>
    2530:	83 c4 10             	add    $0x10,%esp
  return cmd;
    2533:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    2536:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2539:	c9                   	leave  
    253a:	c3                   	ret    

0000253b <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    253b:	55                   	push   %ebp
    253c:	89 e5                	mov    %esp,%ebp
    253e:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    2541:	83 ec 08             	sub    $0x8,%esp
    2544:	ff 75 0c             	pushl  0xc(%ebp)
    2547:	ff 75 08             	pushl  0x8(%ebp)
    254a:	e8 99 00 00 00       	call   25e8 <parsepipe>
    254f:	83 c4 10             	add    $0x10,%esp
    2552:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    2555:	eb 23                	jmp    257a <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    2557:	6a 00                	push   $0x0
    2559:	6a 00                	push   $0x0
    255b:	ff 75 0c             	pushl  0xc(%ebp)
    255e:	ff 75 08             	pushl  0x8(%ebp)
    2561:	e8 19 fd ff ff       	call   227f <gettoken>
    2566:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    2569:	83 ec 0c             	sub    $0xc,%esp
    256c:	ff 75 f4             	pushl  -0xc(%ebp)
    256f:	e8 66 e8 ff ff       	call   dda <backcmd>
    2574:	83 c4 10             	add    $0x10,%esp
    2577:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    257a:	83 ec 04             	sub    $0x4,%esp
    257d:	68 47 38 00 00       	push   $0x3847
    2582:	ff 75 0c             	pushl  0xc(%ebp)
    2585:	ff 75 08             	pushl  0x8(%ebp)
    2588:	e8 43 fe ff ff       	call   23d0 <peek>
    258d:	83 c4 10             	add    $0x10,%esp
    2590:	85 c0                	test   %eax,%eax
    2592:	75 c3                	jne    2557 <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    2594:	83 ec 04             	sub    $0x4,%esp
    2597:	68 49 38 00 00       	push   $0x3849
    259c:	ff 75 0c             	pushl  0xc(%ebp)
    259f:	ff 75 08             	pushl  0x8(%ebp)
    25a2:	e8 29 fe ff ff       	call   23d0 <peek>
    25a7:	83 c4 10             	add    $0x10,%esp
    25aa:	85 c0                	test   %eax,%eax
    25ac:	74 35                	je     25e3 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    25ae:	6a 00                	push   $0x0
    25b0:	6a 00                	push   $0x0
    25b2:	ff 75 0c             	pushl  0xc(%ebp)
    25b5:	ff 75 08             	pushl  0x8(%ebp)
    25b8:	e8 c2 fc ff ff       	call   227f <gettoken>
    25bd:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    25c0:	83 ec 08             	sub    $0x8,%esp
    25c3:	ff 75 0c             	pushl  0xc(%ebp)
    25c6:	ff 75 08             	pushl  0x8(%ebp)
    25c9:	e8 6d ff ff ff       	call   253b <parseline>
    25ce:	83 c4 10             	add    $0x10,%esp
    25d1:	83 ec 08             	sub    $0x8,%esp
    25d4:	50                   	push   %eax
    25d5:	ff 75 f4             	pushl  -0xc(%ebp)
    25d8:	e8 b5 e7 ff ff       	call   d92 <listcmd>
    25dd:	83 c4 10             	add    $0x10,%esp
    25e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    25e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    25e6:	c9                   	leave  
    25e7:	c3                   	ret    

000025e8 <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    25e8:	55                   	push   %ebp
    25e9:	89 e5                	mov    %esp,%ebp
    25eb:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    25ee:	83 ec 08             	sub    $0x8,%esp
    25f1:	ff 75 0c             	pushl  0xc(%ebp)
    25f4:	ff 75 08             	pushl  0x8(%ebp)
    25f7:	e8 ec 01 00 00       	call   27e8 <parseexec>
    25fc:	83 c4 10             	add    $0x10,%esp
    25ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    2602:	83 ec 04             	sub    $0x4,%esp
    2605:	68 4b 38 00 00       	push   $0x384b
    260a:	ff 75 0c             	pushl  0xc(%ebp)
    260d:	ff 75 08             	pushl  0x8(%ebp)
    2610:	e8 bb fd ff ff       	call   23d0 <peek>
    2615:	83 c4 10             	add    $0x10,%esp
    2618:	85 c0                	test   %eax,%eax
    261a:	74 35                	je     2651 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    261c:	6a 00                	push   $0x0
    261e:	6a 00                	push   $0x0
    2620:	ff 75 0c             	pushl  0xc(%ebp)
    2623:	ff 75 08             	pushl  0x8(%ebp)
    2626:	e8 54 fc ff ff       	call   227f <gettoken>
    262b:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    262e:	83 ec 08             	sub    $0x8,%esp
    2631:	ff 75 0c             	pushl  0xc(%ebp)
    2634:	ff 75 08             	pushl  0x8(%ebp)
    2637:	e8 ac ff ff ff       	call   25e8 <parsepipe>
    263c:	83 c4 10             	add    $0x10,%esp
    263f:	83 ec 08             	sub    $0x8,%esp
    2642:	50                   	push   %eax
    2643:	ff 75 f4             	pushl  -0xc(%ebp)
    2646:	e8 ff e6 ff ff       	call   d4a <pipecmd>
    264b:	83 c4 10             	add    $0x10,%esp
    264e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2651:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2654:	c9                   	leave  
    2655:	c3                   	ret    

00002656 <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    2656:	55                   	push   %ebp
    2657:	89 e5                	mov    %esp,%ebp
    2659:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    265c:	e9 b6 00 00 00       	jmp    2717 <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    2661:	6a 00                	push   $0x0
    2663:	6a 00                	push   $0x0
    2665:	ff 75 10             	pushl  0x10(%ebp)
    2668:	ff 75 0c             	pushl  0xc(%ebp)
    266b:	e8 0f fc ff ff       	call   227f <gettoken>
    2670:	83 c4 10             	add    $0x10,%esp
    2673:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    2676:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2679:	50                   	push   %eax
    267a:	8d 45 f0             	lea    -0x10(%ebp),%eax
    267d:	50                   	push   %eax
    267e:	ff 75 10             	pushl  0x10(%ebp)
    2681:	ff 75 0c             	pushl  0xc(%ebp)
    2684:	e8 f6 fb ff ff       	call   227f <gettoken>
    2689:	83 c4 10             	add    $0x10,%esp
    268c:	83 f8 61             	cmp    $0x61,%eax
    268f:	74 10                	je     26a1 <parseredirs+0x4b>
      panic1("missing file for redirection");
    2691:	83 ec 0c             	sub    $0xc,%esp
    2694:	68 4d 38 00 00       	push   $0x384d
    2699:	e8 76 e2 ff ff       	call   914 <panic1>
    269e:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    26a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26a4:	83 f8 3c             	cmp    $0x3c,%eax
    26a7:	74 0c                	je     26b5 <parseredirs+0x5f>
    26a9:	83 f8 3e             	cmp    $0x3e,%eax
    26ac:	74 26                	je     26d4 <parseredirs+0x7e>
    26ae:	83 f8 2b             	cmp    $0x2b,%eax
    26b1:	74 43                	je     26f6 <parseredirs+0xa0>
    26b3:	eb 62                	jmp    2717 <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    26b5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    26b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    26bb:	83 ec 0c             	sub    $0xc,%esp
    26be:	6a 00                	push   $0x0
    26c0:	6a 00                	push   $0x0
    26c2:	52                   	push   %edx
    26c3:	50                   	push   %eax
    26c4:	ff 75 08             	pushl  0x8(%ebp)
    26c7:	e8 1b e6 ff ff       	call   ce7 <redircmd>
    26cc:	83 c4 20             	add    $0x20,%esp
    26cf:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    26d2:	eb 43                	jmp    2717 <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    26d4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    26d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    26da:	83 ec 0c             	sub    $0xc,%esp
    26dd:	6a 01                	push   $0x1
    26df:	68 01 02 00 00       	push   $0x201
    26e4:	52                   	push   %edx
    26e5:	50                   	push   %eax
    26e6:	ff 75 08             	pushl  0x8(%ebp)
    26e9:	e8 f9 e5 ff ff       	call   ce7 <redircmd>
    26ee:	83 c4 20             	add    $0x20,%esp
    26f1:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    26f4:	eb 21                	jmp    2717 <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    26f6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    26f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    26fc:	83 ec 0c             	sub    $0xc,%esp
    26ff:	6a 01                	push   $0x1
    2701:	68 01 02 00 00       	push   $0x201
    2706:	52                   	push   %edx
    2707:	50                   	push   %eax
    2708:	ff 75 08             	pushl  0x8(%ebp)
    270b:	e8 d7 e5 ff ff       	call   ce7 <redircmd>
    2710:	83 c4 20             	add    $0x20,%esp
    2713:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2716:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2717:	83 ec 04             	sub    $0x4,%esp
    271a:	68 6a 38 00 00       	push   $0x386a
    271f:	ff 75 10             	pushl  0x10(%ebp)
    2722:	ff 75 0c             	pushl  0xc(%ebp)
    2725:	e8 a6 fc ff ff       	call   23d0 <peek>
    272a:	83 c4 10             	add    $0x10,%esp
    272d:	85 c0                	test   %eax,%eax
    272f:	0f 85 2c ff ff ff    	jne    2661 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    2735:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2738:	c9                   	leave  
    2739:	c3                   	ret    

0000273a <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    273a:	55                   	push   %ebp
    273b:	89 e5                	mov    %esp,%ebp
    273d:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2740:	83 ec 04             	sub    $0x4,%esp
    2743:	68 6d 38 00 00       	push   $0x386d
    2748:	ff 75 0c             	pushl  0xc(%ebp)
    274b:	ff 75 08             	pushl  0x8(%ebp)
    274e:	e8 7d fc ff ff       	call   23d0 <peek>
    2753:	83 c4 10             	add    $0x10,%esp
    2756:	85 c0                	test   %eax,%eax
    2758:	75 10                	jne    276a <parseblock+0x30>
    panic1("parseblock");
    275a:	83 ec 0c             	sub    $0xc,%esp
    275d:	68 6f 38 00 00       	push   $0x386f
    2762:	e8 ad e1 ff ff       	call   914 <panic1>
    2767:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    276a:	6a 00                	push   $0x0
    276c:	6a 00                	push   $0x0
    276e:	ff 75 0c             	pushl  0xc(%ebp)
    2771:	ff 75 08             	pushl  0x8(%ebp)
    2774:	e8 06 fb ff ff       	call   227f <gettoken>
    2779:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    277c:	83 ec 08             	sub    $0x8,%esp
    277f:	ff 75 0c             	pushl  0xc(%ebp)
    2782:	ff 75 08             	pushl  0x8(%ebp)
    2785:	e8 b1 fd ff ff       	call   253b <parseline>
    278a:	83 c4 10             	add    $0x10,%esp
    278d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    2790:	83 ec 04             	sub    $0x4,%esp
    2793:	68 7a 38 00 00       	push   $0x387a
    2798:	ff 75 0c             	pushl  0xc(%ebp)
    279b:	ff 75 08             	pushl  0x8(%ebp)
    279e:	e8 2d fc ff ff       	call   23d0 <peek>
    27a3:	83 c4 10             	add    $0x10,%esp
    27a6:	85 c0                	test   %eax,%eax
    27a8:	75 10                	jne    27ba <parseblock+0x80>
    panic1("syntax - missing )");
    27aa:	83 ec 0c             	sub    $0xc,%esp
    27ad:	68 7c 38 00 00       	push   $0x387c
    27b2:	e8 5d e1 ff ff       	call   914 <panic1>
    27b7:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    27ba:	6a 00                	push   $0x0
    27bc:	6a 00                	push   $0x0
    27be:	ff 75 0c             	pushl  0xc(%ebp)
    27c1:	ff 75 08             	pushl  0x8(%ebp)
    27c4:	e8 b6 fa ff ff       	call   227f <gettoken>
    27c9:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    27cc:	83 ec 04             	sub    $0x4,%esp
    27cf:	ff 75 0c             	pushl  0xc(%ebp)
    27d2:	ff 75 08             	pushl  0x8(%ebp)
    27d5:	ff 75 f4             	pushl  -0xc(%ebp)
    27d8:	e8 79 fe ff ff       	call   2656 <parseredirs>
    27dd:	83 c4 10             	add    $0x10,%esp
    27e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    27e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    27e6:	c9                   	leave  
    27e7:	c3                   	ret    

000027e8 <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    27e8:	55                   	push   %ebp
    27e9:	89 e5                	mov    %esp,%ebp
    27eb:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    27ee:	83 ec 04             	sub    $0x4,%esp
    27f1:	68 6d 38 00 00       	push   $0x386d
    27f6:	ff 75 0c             	pushl  0xc(%ebp)
    27f9:	ff 75 08             	pushl  0x8(%ebp)
    27fc:	e8 cf fb ff ff       	call   23d0 <peek>
    2801:	83 c4 10             	add    $0x10,%esp
    2804:	85 c0                	test   %eax,%eax
    2806:	74 16                	je     281e <parseexec+0x36>
    return parseblock(ps, es);
    2808:	83 ec 08             	sub    $0x8,%esp
    280b:	ff 75 0c             	pushl  0xc(%ebp)
    280e:	ff 75 08             	pushl  0x8(%ebp)
    2811:	e8 24 ff ff ff       	call   273a <parseblock>
    2816:	83 c4 10             	add    $0x10,%esp
    2819:	e9 fb 00 00 00       	jmp    2919 <parseexec+0x131>

  ret = execcmd();
    281e:	e8 8e e4 ff ff       	call   cb1 <execcmd>
    2823:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    2826:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2829:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    282c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2833:	83 ec 04             	sub    $0x4,%esp
    2836:	ff 75 0c             	pushl  0xc(%ebp)
    2839:	ff 75 08             	pushl  0x8(%ebp)
    283c:	ff 75 f0             	pushl  -0x10(%ebp)
    283f:	e8 12 fe ff ff       	call   2656 <parseredirs>
    2844:	83 c4 10             	add    $0x10,%esp
    2847:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    284a:	e9 87 00 00 00       	jmp    28d6 <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    284f:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2852:	50                   	push   %eax
    2853:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2856:	50                   	push   %eax
    2857:	ff 75 0c             	pushl  0xc(%ebp)
    285a:	ff 75 08             	pushl  0x8(%ebp)
    285d:	e8 1d fa ff ff       	call   227f <gettoken>
    2862:	83 c4 10             	add    $0x10,%esp
    2865:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2868:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    286c:	0f 84 84 00 00 00    	je     28f6 <parseexec+0x10e>
      break;
    if(tok != 'a')
    2872:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    2876:	74 10                	je     2888 <parseexec+0xa0>
      panic1("syntax");
    2878:	83 ec 0c             	sub    $0xc,%esp
    287b:	68 40 38 00 00       	push   $0x3840
    2880:	e8 8f e0 ff ff       	call   914 <panic1>
    2885:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    2888:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    288b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    288e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2891:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    2895:	8b 55 e0             	mov    -0x20(%ebp),%edx
    2898:	8b 45 ec             	mov    -0x14(%ebp),%eax
    289b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    289e:	83 c1 08             	add    $0x8,%ecx
    28a1:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    28a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    28a9:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    28ad:	7e 10                	jle    28bf <parseexec+0xd7>
      panic1("too many args");
    28af:	83 ec 0c             	sub    $0xc,%esp
    28b2:	68 8f 38 00 00       	push   $0x388f
    28b7:	e8 58 e0 ff ff       	call   914 <panic1>
    28bc:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    28bf:	83 ec 04             	sub    $0x4,%esp
    28c2:	ff 75 0c             	pushl  0xc(%ebp)
    28c5:	ff 75 08             	pushl  0x8(%ebp)
    28c8:	ff 75 f0             	pushl  -0x10(%ebp)
    28cb:	e8 86 fd ff ff       	call   2656 <parseredirs>
    28d0:	83 c4 10             	add    $0x10,%esp
    28d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    28d6:	83 ec 04             	sub    $0x4,%esp
    28d9:	68 9d 38 00 00       	push   $0x389d
    28de:	ff 75 0c             	pushl  0xc(%ebp)
    28e1:	ff 75 08             	pushl  0x8(%ebp)
    28e4:	e8 e7 fa ff ff       	call   23d0 <peek>
    28e9:	83 c4 10             	add    $0x10,%esp
    28ec:	85 c0                	test   %eax,%eax
    28ee:	0f 84 5b ff ff ff    	je     284f <parseexec+0x67>
    28f4:	eb 01                	jmp    28f7 <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    28f6:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    28f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    28fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
    28fd:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    2904:	00 
  cmd->eargv[argc] = 0;
    2905:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2908:	8b 55 f4             	mov    -0xc(%ebp),%edx
    290b:	83 c2 08             	add    $0x8,%edx
    290e:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    2915:	00 
  return ret;
    2916:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2919:	c9                   	leave  
    291a:	c3                   	ret    

0000291b <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    291b:	55                   	push   %ebp
    291c:	89 e5                	mov    %esp,%ebp
    291e:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2921:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2925:	75 0a                	jne    2931 <nulterminate+0x16>
    return 0;
    2927:	b8 00 00 00 00       	mov    $0x0,%eax
    292c:	e9 e4 00 00 00       	jmp    2a15 <nulterminate+0xfa>
  
  switch(cmd->type){
    2931:	8b 45 08             	mov    0x8(%ebp),%eax
    2934:	8b 00                	mov    (%eax),%eax
    2936:	83 f8 05             	cmp    $0x5,%eax
    2939:	0f 87 d3 00 00 00    	ja     2a12 <nulterminate+0xf7>
    293f:	8b 04 85 a4 38 00 00 	mov    0x38a4(,%eax,4),%eax
    2946:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2948:	8b 45 08             	mov    0x8(%ebp),%eax
    294b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    294e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2955:	eb 14                	jmp    296b <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2957:	8b 45 f0             	mov    -0x10(%ebp),%eax
    295a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    295d:	83 c2 08             	add    $0x8,%edx
    2960:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2964:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2967:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    296b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    296e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2971:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2975:	85 c0                	test   %eax,%eax
    2977:	75 de                	jne    2957 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2979:	e9 94 00 00 00       	jmp    2a12 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    297e:	8b 45 08             	mov    0x8(%ebp),%eax
    2981:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2984:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2987:	8b 40 04             	mov    0x4(%eax),%eax
    298a:	83 ec 0c             	sub    $0xc,%esp
    298d:	50                   	push   %eax
    298e:	e8 88 ff ff ff       	call   291b <nulterminate>
    2993:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2996:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2999:	8b 40 0c             	mov    0xc(%eax),%eax
    299c:	c6 00 00             	movb   $0x0,(%eax)
    break;
    299f:	eb 71                	jmp    2a12 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    29a1:	8b 45 08             	mov    0x8(%ebp),%eax
    29a4:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    29a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    29aa:	8b 40 04             	mov    0x4(%eax),%eax
    29ad:	83 ec 0c             	sub    $0xc,%esp
    29b0:	50                   	push   %eax
    29b1:	e8 65 ff ff ff       	call   291b <nulterminate>
    29b6:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    29b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    29bc:	8b 40 08             	mov    0x8(%eax),%eax
    29bf:	83 ec 0c             	sub    $0xc,%esp
    29c2:	50                   	push   %eax
    29c3:	e8 53 ff ff ff       	call   291b <nulterminate>
    29c8:	83 c4 10             	add    $0x10,%esp
    break;
    29cb:	eb 45                	jmp    2a12 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    29cd:	8b 45 08             	mov    0x8(%ebp),%eax
    29d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    29d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    29d6:	8b 40 04             	mov    0x4(%eax),%eax
    29d9:	83 ec 0c             	sub    $0xc,%esp
    29dc:	50                   	push   %eax
    29dd:	e8 39 ff ff ff       	call   291b <nulterminate>
    29e2:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    29e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    29e8:	8b 40 08             	mov    0x8(%eax),%eax
    29eb:	83 ec 0c             	sub    $0xc,%esp
    29ee:	50                   	push   %eax
    29ef:	e8 27 ff ff ff       	call   291b <nulterminate>
    29f4:	83 c4 10             	add    $0x10,%esp
    break;
    29f7:	eb 19                	jmp    2a12 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    29f9:	8b 45 08             	mov    0x8(%ebp),%eax
    29fc:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    29ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2a02:	8b 40 04             	mov    0x4(%eax),%eax
    2a05:	83 ec 0c             	sub    $0xc,%esp
    2a08:	50                   	push   %eax
    2a09:	e8 0d ff ff ff       	call   291b <nulterminate>
    2a0e:	83 c4 10             	add    $0x10,%esp
    break;
    2a11:	90                   	nop
  }
  return cmd;
    2a12:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2a15:	c9                   	leave  
    2a16:	c3                   	ret    

00002a17 <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2a17:	55                   	push   %ebp
    2a18:	89 e5                	mov    %esp,%ebp
    2a1a:	83 ec 18             	sub    $0x18,%esp
    2a1d:	8b 45 08             	mov    0x8(%ebp),%eax
    2a20:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2a23:	83 ec 08             	sub    $0x8,%esp
    2a26:	ff 75 18             	pushl  0x18(%ebp)
    2a29:	ff 75 14             	pushl  0x14(%ebp)
    2a2c:	ff 75 10             	pushl  0x10(%ebp)
    2a2f:	ff 75 0c             	pushl  0xc(%ebp)
    2a32:	6a 01                	push   $0x1
    2a34:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2a37:	50                   	push   %eax
    2a38:	e8 e6 d8 ff ff       	call   323 <colorwrite>
    2a3d:	83 c4 20             	add    $0x20,%esp
}
    2a40:	90                   	nop
    2a41:	c9                   	leave  
    2a42:	c3                   	ret    

00002a43 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2a43:	55                   	push   %ebp
    2a44:	89 e5                	mov    %esp,%ebp
    2a46:	53                   	push   %ebx
    2a47:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2a4a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2a51:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2a55:	74 17                	je     2a6e <color_printint+0x2b>
    2a57:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2a5b:	79 11                	jns    2a6e <color_printint+0x2b>
    neg = 1;
    2a5d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2a64:	8b 45 08             	mov    0x8(%ebp),%eax
    2a67:	f7 d8                	neg    %eax
    2a69:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2a6c:	eb 06                	jmp    2a74 <color_printint+0x31>
  } else {
    x = xx;
    2a6e:	8b 45 08             	mov    0x8(%ebp),%eax
    2a71:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2a74:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2a7b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2a7e:	8d 41 01             	lea    0x1(%ecx),%eax
    2a81:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2a84:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2a87:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a8a:	ba 00 00 00 00       	mov    $0x0,%edx
    2a8f:	f7 f3                	div    %ebx
    2a91:	89 d0                	mov    %edx,%eax
    2a93:	0f b6 80 64 43 00 00 	movzbl 0x4364(%eax),%eax
    2a9a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2a9e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2aa1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2aa4:	ba 00 00 00 00       	mov    $0x0,%edx
    2aa9:	f7 f3                	div    %ebx
    2aab:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2aae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2ab2:	75 c7                	jne    2a7b <color_printint+0x38>
  if(neg)
    2ab4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2ab8:	74 36                	je     2af0 <color_printint+0xad>
    buf[i++] = '-';
    2aba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2abd:	8d 50 01             	lea    0x1(%eax),%edx
    2ac0:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2ac3:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2ac8:	eb 26                	jmp    2af0 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2aca:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2acd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ad0:	01 d0                	add    %edx,%eax
    2ad2:	0f b6 00             	movzbl (%eax),%eax
    2ad5:	0f be c0             	movsbl %al,%eax
    2ad8:	83 ec 0c             	sub    $0xc,%esp
    2adb:	ff 75 20             	pushl  0x20(%ebp)
    2ade:	ff 75 1c             	pushl  0x1c(%ebp)
    2ae1:	ff 75 18             	pushl  0x18(%ebp)
    2ae4:	ff 75 14             	pushl  0x14(%ebp)
    2ae7:	50                   	push   %eax
    2ae8:	e8 2a ff ff ff       	call   2a17 <color_putc>
    2aed:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2af0:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2af4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2af8:	79 d0                	jns    2aca <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2afa:	90                   	nop
    2afb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2afe:	c9                   	leave  
    2aff:	c3                   	ret    

00002b00 <getInteger>:

static int getInteger(double num)
{
    2b00:	55                   	push   %ebp
    2b01:	89 e5                	mov    %esp,%ebp
    2b03:	83 ec 18             	sub    $0x18,%esp
    2b06:	8b 45 08             	mov    0x8(%ebp),%eax
    2b09:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2b0c:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b0f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2b12:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2b19:	eb 0e                	jmp    2b29 <getInteger+0x29>
  {
    num -= 1;
    2b1b:	dd 45 e8             	fldl   -0x18(%ebp)
    2b1e:	d9 e8                	fld1   
    2b20:	de e9                	fsubrp %st,%st(1)
    2b22:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2b25:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2b29:	dd 45 e8             	fldl   -0x18(%ebp)
    2b2c:	d9 e8                	fld1   
    2b2e:	d9 c9                	fxch   %st(1)
    2b30:	df e9                	fucomip %st(1),%st
    2b32:	dd d8                	fstp   %st(0)
    2b34:	77 e5                	ja     2b1b <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2b36:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2b39:	c9                   	leave  
    2b3a:	c3                   	ret    

00002b3b <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2b3b:	55                   	push   %ebp
    2b3c:	89 e5                	mov    %esp,%ebp
    2b3e:	83 ec 28             	sub    $0x28,%esp
    2b41:	8b 45 08             	mov    0x8(%ebp),%eax
    2b44:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2b47:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b4a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2b4d:	d9 ee                	fldz   
    2b4f:	dd 45 e0             	fldl   -0x20(%ebp)
    2b52:	d9 c9                	fxch   %st(1)
    2b54:	df e9                	fucomip %st(1),%st
    2b56:	dd d8                	fstp   %st(0)
    2b58:	76 21                	jbe    2b7b <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2b5a:	83 ec 0c             	sub    $0xc,%esp
    2b5d:	ff 75 1c             	pushl  0x1c(%ebp)
    2b60:	ff 75 18             	pushl  0x18(%ebp)
    2b63:	ff 75 14             	pushl  0x14(%ebp)
    2b66:	ff 75 10             	pushl  0x10(%ebp)
    2b69:	6a 2d                	push   $0x2d
    2b6b:	e8 a7 fe ff ff       	call   2a17 <color_putc>
    2b70:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2b73:	dd 45 e0             	fldl   -0x20(%ebp)
    2b76:	d9 e0                	fchs   
    2b78:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2b7b:	83 ec 08             	sub    $0x8,%esp
    2b7e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2b81:	ff 75 e0             	pushl  -0x20(%ebp)
    2b84:	e8 77 ff ff ff       	call   2b00 <getInteger>
    2b89:	83 c4 10             	add    $0x10,%esp
    2b8c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2b8f:	83 ec 04             	sub    $0x4,%esp
    2b92:	ff 75 1c             	pushl  0x1c(%ebp)
    2b95:	ff 75 18             	pushl  0x18(%ebp)
    2b98:	ff 75 14             	pushl  0x14(%ebp)
    2b9b:	ff 75 10             	pushl  0x10(%ebp)
    2b9e:	6a 01                	push   $0x1
    2ba0:	6a 0a                	push   $0xa
    2ba2:	ff 75 f0             	pushl  -0x10(%ebp)
    2ba5:	e8 99 fe ff ff       	call   2a43 <color_printint>
    2baa:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2bad:	db 45 f0             	fildl  -0x10(%ebp)
    2bb0:	dd 45 e0             	fldl   -0x20(%ebp)
    2bb3:	de e1                	fsubp  %st,%st(1)
    2bb5:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2bb8:	dd 45 e0             	fldl   -0x20(%ebp)
    2bbb:	dd 05 c8 38 00 00    	fldl   0x38c8
    2bc1:	d9 c9                	fxch   %st(1)
    2bc3:	df e9                	fucomip %st(1),%st
    2bc5:	dd d8                	fstp   %st(0)
    2bc7:	76 19                	jbe    2be2 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2bc9:	83 ec 0c             	sub    $0xc,%esp
    2bcc:	ff 75 1c             	pushl  0x1c(%ebp)
    2bcf:	ff 75 18             	pushl  0x18(%ebp)
    2bd2:	ff 75 14             	pushl  0x14(%ebp)
    2bd5:	ff 75 10             	pushl  0x10(%ebp)
    2bd8:	6a 2e                	push   $0x2e
    2bda:	e8 38 fe ff ff       	call   2a17 <color_putc>
    2bdf:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2be2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2be9:	eb 55                	jmp    2c40 <color_printdbl+0x105>
  {
    num = num*10;
    2beb:	dd 45 e0             	fldl   -0x20(%ebp)
    2bee:	dd 05 d0 38 00 00    	fldl   0x38d0
    2bf4:	de c9                	fmulp  %st,%st(1)
    2bf6:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2bf9:	83 ec 08             	sub    $0x8,%esp
    2bfc:	ff 75 e4             	pushl  -0x1c(%ebp)
    2bff:	ff 75 e0             	pushl  -0x20(%ebp)
    2c02:	e8 f9 fe ff ff       	call   2b00 <getInteger>
    2c07:	83 c4 10             	add    $0x10,%esp
    2c0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2c0d:	83 ec 04             	sub    $0x4,%esp
    2c10:	ff 75 1c             	pushl  0x1c(%ebp)
    2c13:	ff 75 18             	pushl  0x18(%ebp)
    2c16:	ff 75 14             	pushl  0x14(%ebp)
    2c19:	ff 75 10             	pushl  0x10(%ebp)
    2c1c:	6a 01                	push   $0x1
    2c1e:	6a 0a                	push   $0xa
    2c20:	ff 75 f0             	pushl  -0x10(%ebp)
    2c23:	e8 1b fe ff ff       	call   2a43 <color_printint>
    2c28:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2c2b:	db 45 f0             	fildl  -0x10(%ebp)
    2c2e:	dd 45 e0             	fldl   -0x20(%ebp)
    2c31:	de e1                	fsubp  %st,%st(1)
    2c33:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2c36:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2c3a:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2c3e:	7f 13                	jg     2c53 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2c40:	dd 45 e0             	fldl   -0x20(%ebp)
    2c43:	dd 05 c8 38 00 00    	fldl   0x38c8
    2c49:	d9 c9                	fxch   %st(1)
    2c4b:	df e9                	fucomip %st(1),%st
    2c4d:	dd d8                	fstp   %st(0)
    2c4f:	77 9a                	ja     2beb <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2c51:	eb 01                	jmp    2c54 <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2c53:	90                   	nop
    }
  }
}
    2c54:	90                   	nop
    2c55:	c9                   	leave  
    2c56:	c3                   	ret    

00002c57 <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2c57:	55                   	push   %ebp
    2c58:	89 e5                	mov    %esp,%ebp
    2c5a:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2c5d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2c64:	8d 45 18             	lea    0x18(%ebp),%eax
    2c67:	83 c0 04             	add    $0x4,%eax
    2c6a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2c6d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2c74:	e9 e2 01 00 00       	jmp    2e5b <color_printf+0x204>
    c = fmt[i] & 0xff;
    2c79:	8b 55 18             	mov    0x18(%ebp),%edx
    2c7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c7f:	01 d0                	add    %edx,%eax
    2c81:	0f b6 00             	movzbl (%eax),%eax
    2c84:	0f be c0             	movsbl %al,%eax
    2c87:	25 ff 00 00 00       	and    $0xff,%eax
    2c8c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2c8f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2c93:	75 35                	jne    2cca <color_printf+0x73>
      if(c == '%'){
    2c95:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2c99:	75 0c                	jne    2ca7 <color_printf+0x50>
        state = '%';
    2c9b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2ca2:	e9 b0 01 00 00       	jmp    2e57 <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2ca7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2caa:	0f be c0             	movsbl %al,%eax
    2cad:	83 ec 0c             	sub    $0xc,%esp
    2cb0:	ff 75 14             	pushl  0x14(%ebp)
    2cb3:	ff 75 10             	pushl  0x10(%ebp)
    2cb6:	ff 75 0c             	pushl  0xc(%ebp)
    2cb9:	ff 75 08             	pushl  0x8(%ebp)
    2cbc:	50                   	push   %eax
    2cbd:	e8 55 fd ff ff       	call   2a17 <color_putc>
    2cc2:	83 c4 20             	add    $0x20,%esp
    2cc5:	e9 8d 01 00 00       	jmp    2e57 <color_printf+0x200>
      }
    } else if(state == '%'){
    2cca:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2cce:	0f 85 83 01 00 00    	jne    2e57 <color_printf+0x200>
      if(c == 'd'){
    2cd4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2cd8:	75 2a                	jne    2d04 <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2cda:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2cdd:	8b 00                	mov    (%eax),%eax
    2cdf:	83 ec 04             	sub    $0x4,%esp
    2ce2:	ff 75 14             	pushl  0x14(%ebp)
    2ce5:	ff 75 10             	pushl  0x10(%ebp)
    2ce8:	ff 75 0c             	pushl  0xc(%ebp)
    2ceb:	ff 75 08             	pushl  0x8(%ebp)
    2cee:	6a 01                	push   $0x1
    2cf0:	6a 0a                	push   $0xa
    2cf2:	50                   	push   %eax
    2cf3:	e8 4b fd ff ff       	call   2a43 <color_printint>
    2cf8:	83 c4 20             	add    $0x20,%esp
        ap++;
    2cfb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2cff:	e9 4c 01 00 00       	jmp    2e50 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2d04:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2d08:	74 06                	je     2d10 <color_printf+0xb9>
    2d0a:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2d0e:	75 2a                	jne    2d3a <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2d10:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d13:	8b 00                	mov    (%eax),%eax
    2d15:	83 ec 04             	sub    $0x4,%esp
    2d18:	ff 75 14             	pushl  0x14(%ebp)
    2d1b:	ff 75 10             	pushl  0x10(%ebp)
    2d1e:	ff 75 0c             	pushl  0xc(%ebp)
    2d21:	ff 75 08             	pushl  0x8(%ebp)
    2d24:	6a 00                	push   $0x0
    2d26:	6a 10                	push   $0x10
    2d28:	50                   	push   %eax
    2d29:	e8 15 fd ff ff       	call   2a43 <color_printint>
    2d2e:	83 c4 20             	add    $0x20,%esp
        ap++;
    2d31:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2d35:	e9 16 01 00 00       	jmp    2e50 <color_printf+0x1f9>
      } else if(c == 's'){
    2d3a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2d3e:	75 4f                	jne    2d8f <color_printf+0x138>
        s = (char*)*ap;
    2d40:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d43:	8b 00                	mov    (%eax),%eax
    2d45:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2d48:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2d4c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2d50:	75 2e                	jne    2d80 <color_printf+0x129>
          s = "(null)";
    2d52:	c7 45 f4 c0 38 00 00 	movl   $0x38c0,-0xc(%ebp)
        while(*s != 0){
    2d59:	eb 25                	jmp    2d80 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2d5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d5e:	0f b6 00             	movzbl (%eax),%eax
    2d61:	0f be c0             	movsbl %al,%eax
    2d64:	83 ec 0c             	sub    $0xc,%esp
    2d67:	ff 75 14             	pushl  0x14(%ebp)
    2d6a:	ff 75 10             	pushl  0x10(%ebp)
    2d6d:	ff 75 0c             	pushl  0xc(%ebp)
    2d70:	ff 75 08             	pushl  0x8(%ebp)
    2d73:	50                   	push   %eax
    2d74:	e8 9e fc ff ff       	call   2a17 <color_putc>
    2d79:	83 c4 20             	add    $0x20,%esp
          s++;
    2d7c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2d80:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d83:	0f b6 00             	movzbl (%eax),%eax
    2d86:	84 c0                	test   %al,%al
    2d88:	75 d1                	jne    2d5b <color_printf+0x104>
    2d8a:	e9 c1 00 00 00       	jmp    2e50 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2d8f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2d93:	75 29                	jne    2dbe <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2d95:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d98:	8b 00                	mov    (%eax),%eax
    2d9a:	0f be c0             	movsbl %al,%eax
    2d9d:	83 ec 0c             	sub    $0xc,%esp
    2da0:	ff 75 14             	pushl  0x14(%ebp)
    2da3:	ff 75 10             	pushl  0x10(%ebp)
    2da6:	ff 75 0c             	pushl  0xc(%ebp)
    2da9:	ff 75 08             	pushl  0x8(%ebp)
    2dac:	50                   	push   %eax
    2dad:	e8 65 fc ff ff       	call   2a17 <color_putc>
    2db2:	83 c4 20             	add    $0x20,%esp
        ap++;
    2db5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2db9:	e9 92 00 00 00       	jmp    2e50 <color_printf+0x1f9>
      } else if(c == '%'){
    2dbe:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2dc2:	75 20                	jne    2de4 <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2dc4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2dc7:	0f be c0             	movsbl %al,%eax
    2dca:	83 ec 0c             	sub    $0xc,%esp
    2dcd:	ff 75 14             	pushl  0x14(%ebp)
    2dd0:	ff 75 10             	pushl  0x10(%ebp)
    2dd3:	ff 75 0c             	pushl  0xc(%ebp)
    2dd6:	ff 75 08             	pushl  0x8(%ebp)
    2dd9:	50                   	push   %eax
    2dda:	e8 38 fc ff ff       	call   2a17 <color_putc>
    2ddf:	83 c4 20             	add    $0x20,%esp
    2de2:	eb 6c                	jmp    2e50 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    2de4:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    2de8:	75 2f                	jne    2e19 <color_printf+0x1c2>
        double *dap = (double*)ap;
    2dea:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ded:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    2df0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2df3:	dd 00                	fldl   (%eax)
    2df5:	83 ec 08             	sub    $0x8,%esp
    2df8:	ff 75 14             	pushl  0x14(%ebp)
    2dfb:	ff 75 10             	pushl  0x10(%ebp)
    2dfe:	ff 75 0c             	pushl  0xc(%ebp)
    2e01:	ff 75 08             	pushl  0x8(%ebp)
    2e04:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2e08:	dd 1c 24             	fstpl  (%esp)
    2e0b:	e8 2b fd ff ff       	call   2b3b <color_printdbl>
    2e10:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    2e13:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    2e17:	eb 37                	jmp    2e50 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    2e19:	83 ec 0c             	sub    $0xc,%esp
    2e1c:	ff 75 14             	pushl  0x14(%ebp)
    2e1f:	ff 75 10             	pushl  0x10(%ebp)
    2e22:	ff 75 0c             	pushl  0xc(%ebp)
    2e25:	ff 75 08             	pushl  0x8(%ebp)
    2e28:	6a 25                	push   $0x25
    2e2a:	e8 e8 fb ff ff       	call   2a17 <color_putc>
    2e2f:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    2e32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e35:	0f be c0             	movsbl %al,%eax
    2e38:	83 ec 0c             	sub    $0xc,%esp
    2e3b:	ff 75 14             	pushl  0x14(%ebp)
    2e3e:	ff 75 10             	pushl  0x10(%ebp)
    2e41:	ff 75 0c             	pushl  0xc(%ebp)
    2e44:	ff 75 08             	pushl  0x8(%ebp)
    2e47:	50                   	push   %eax
    2e48:	e8 ca fb ff ff       	call   2a17 <color_putc>
    2e4d:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    2e50:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2e57:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2e5b:	8b 55 18             	mov    0x18(%ebp),%edx
    2e5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e61:	01 d0                	add    %edx,%eax
    2e63:	0f b6 00             	movzbl (%eax),%eax
    2e66:	84 c0                	test   %al,%al
    2e68:	0f 85 0b fe ff ff    	jne    2c79 <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    2e6e:	90                   	nop
    2e6f:	c9                   	leave  
    2e70:	c3                   	ret    

00002e71 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    2e71:	55                   	push   %ebp
    2e72:	89 e5                	mov    %esp,%ebp
    2e74:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    2e77:	83 ec 0c             	sub    $0xc,%esp
    2e7a:	6a 58                	push   $0x58
    2e7c:	e8 b0 d9 ff ff       	call   831 <malloc>
    2e81:	83 c4 10             	add    $0x10,%esp
    2e84:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2e87:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e8a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2e90:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e93:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    2e9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2e9d:	c9                   	leave  
    2e9e:	c3                   	ret    

00002e9f <pushi>:

void pushi(struct istack *s, int val)
{
    2e9f:	55                   	push   %ebp
    2ea0:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    2ea2:	8b 45 08             	mov    0x8(%ebp),%eax
    2ea5:	8b 00                	mov    (%eax),%eax
    2ea7:	83 f8 13             	cmp    $0x13,%eax
    2eaa:	7f 2c                	jg     2ed8 <pushi+0x39>
    {
        s->size++;
    2eac:	8b 45 08             	mov    0x8(%ebp),%eax
    2eaf:	8b 00                	mov    (%eax),%eax
    2eb1:	8d 50 01             	lea    0x1(%eax),%edx
    2eb4:	8b 45 08             	mov    0x8(%ebp),%eax
    2eb7:	89 10                	mov    %edx,(%eax)
        s->top++;
    2eb9:	8b 45 08             	mov    0x8(%ebp),%eax
    2ebc:	8b 40 54             	mov    0x54(%eax),%eax
    2ebf:	8d 50 01             	lea    0x1(%eax),%edx
    2ec2:	8b 45 08             	mov    0x8(%ebp),%eax
    2ec5:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    2ec8:	8b 45 08             	mov    0x8(%ebp),%eax
    2ecb:	8b 50 54             	mov    0x54(%eax),%edx
    2ece:	8b 45 08             	mov    0x8(%ebp),%eax
    2ed1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2ed4:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    2ed8:	90                   	nop
    2ed9:	5d                   	pop    %ebp
    2eda:	c3                   	ret    

00002edb <popi>:

int popi(struct istack *s)
{
    2edb:	55                   	push   %ebp
    2edc:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2ede:	8b 45 08             	mov    0x8(%ebp),%eax
    2ee1:	8b 00                	mov    (%eax),%eax
    2ee3:	85 c0                	test   %eax,%eax
    2ee5:	75 07                	jne    2eee <popi+0x13>
    {
        return -1;
    2ee7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2eec:	eb 2c                	jmp    2f1a <popi+0x3f>
    }
    s->size--;
    2eee:	8b 45 08             	mov    0x8(%ebp),%eax
    2ef1:	8b 00                	mov    (%eax),%eax
    2ef3:	8d 50 ff             	lea    -0x1(%eax),%edx
    2ef6:	8b 45 08             	mov    0x8(%ebp),%eax
    2ef9:	89 10                	mov    %edx,(%eax)
    s->top--;
    2efb:	8b 45 08             	mov    0x8(%ebp),%eax
    2efe:	8b 40 54             	mov    0x54(%eax),%eax
    2f01:	8d 50 ff             	lea    -0x1(%eax),%edx
    2f04:	8b 45 08             	mov    0x8(%ebp),%eax
    2f07:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    2f0a:	8b 45 08             	mov    0x8(%ebp),%eax
    2f0d:	8b 40 54             	mov    0x54(%eax),%eax
    2f10:	8d 50 01             	lea    0x1(%eax),%edx
    2f13:	8b 45 08             	mov    0x8(%ebp),%eax
    2f16:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2f1a:	5d                   	pop    %ebp
    2f1b:	c3                   	ret    

00002f1c <topi>:

int topi(struct istack* s)
{
    2f1c:	55                   	push   %ebp
    2f1d:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    2f1f:	8b 45 08             	mov    0x8(%ebp),%eax
    2f22:	8b 50 54             	mov    0x54(%eax),%edx
    2f25:	8b 45 08             	mov    0x8(%ebp),%eax
    2f28:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2f2c:	5d                   	pop    %ebp
    2f2d:	c3                   	ret    

00002f2e <cstack>:

//constructor
struct cstack* cstack()
{
    2f2e:	55                   	push   %ebp
    2f2f:	89 e5                	mov    %esp,%ebp
    2f31:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    2f34:	83 ec 0c             	sub    $0xc,%esp
    2f37:	6a 1c                	push   $0x1c
    2f39:	e8 f3 d8 ff ff       	call   831 <malloc>
    2f3e:	83 c4 10             	add    $0x10,%esp
    2f41:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2f44:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f47:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2f4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f50:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    2f57:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2f5a:	c9                   	leave  
    2f5b:	c3                   	ret    

00002f5c <pushc>:

void pushc(struct cstack *s, char val)
{
    2f5c:	55                   	push   %ebp
    2f5d:	89 e5                	mov    %esp,%ebp
    2f5f:	83 ec 04             	sub    $0x4,%esp
    2f62:	8b 45 0c             	mov    0xc(%ebp),%eax
    2f65:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    2f68:	8b 45 08             	mov    0x8(%ebp),%eax
    2f6b:	8b 00                	mov    (%eax),%eax
    2f6d:	83 f8 13             	cmp    $0x13,%eax
    2f70:	7f 2d                	jg     2f9f <pushc+0x43>
    {
        s->size++;
    2f72:	8b 45 08             	mov    0x8(%ebp),%eax
    2f75:	8b 00                	mov    (%eax),%eax
    2f77:	8d 50 01             	lea    0x1(%eax),%edx
    2f7a:	8b 45 08             	mov    0x8(%ebp),%eax
    2f7d:	89 10                	mov    %edx,(%eax)
        s->top++;
    2f7f:	8b 45 08             	mov    0x8(%ebp),%eax
    2f82:	8b 40 18             	mov    0x18(%eax),%eax
    2f85:	8d 50 01             	lea    0x1(%eax),%edx
    2f88:	8b 45 08             	mov    0x8(%ebp),%eax
    2f8b:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    2f8e:	8b 45 08             	mov    0x8(%ebp),%eax
    2f91:	8b 40 18             	mov    0x18(%eax),%eax
    2f94:	8b 55 08             	mov    0x8(%ebp),%edx
    2f97:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    2f9b:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    2f9f:	90                   	nop
    2fa0:	c9                   	leave  
    2fa1:	c3                   	ret    

00002fa2 <popc>:

char popc(struct cstack *s)
{
    2fa2:	55                   	push   %ebp
    2fa3:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2fa5:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa8:	8b 00                	mov    (%eax),%eax
    2faa:	85 c0                	test   %eax,%eax
    2fac:	75 07                	jne    2fb5 <popc+0x13>
    {
        return -1;
    2fae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2fb3:	eb 2d                	jmp    2fe2 <popc+0x40>
    }
    s->size--;
    2fb5:	8b 45 08             	mov    0x8(%ebp),%eax
    2fb8:	8b 00                	mov    (%eax),%eax
    2fba:	8d 50 ff             	lea    -0x1(%eax),%edx
    2fbd:	8b 45 08             	mov    0x8(%ebp),%eax
    2fc0:	89 10                	mov    %edx,(%eax)
    s->top--;
    2fc2:	8b 45 08             	mov    0x8(%ebp),%eax
    2fc5:	8b 40 18             	mov    0x18(%eax),%eax
    2fc8:	8d 50 ff             	lea    -0x1(%eax),%edx
    2fcb:	8b 45 08             	mov    0x8(%ebp),%eax
    2fce:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    2fd1:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd4:	8b 40 18             	mov    0x18(%eax),%eax
    2fd7:	8d 50 01             	lea    0x1(%eax),%edx
    2fda:	8b 45 08             	mov    0x8(%ebp),%eax
    2fdd:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    2fe2:	5d                   	pop    %ebp
    2fe3:	c3                   	ret    

00002fe4 <topc>:

char topc(struct cstack* s)
{
    2fe4:	55                   	push   %ebp
    2fe5:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    2fe7:	8b 45 08             	mov    0x8(%ebp),%eax
    2fea:	8b 40 18             	mov    0x18(%eax),%eax
    2fed:	8b 55 08             	mov    0x8(%ebp),%edx
    2ff0:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    2ff5:	5d                   	pop    %ebp
    2ff6:	c3                   	ret    

00002ff7 <dstack>:

//constructor
struct dstack* dstack()
{
    2ff7:	55                   	push   %ebp
    2ff8:	89 e5                	mov    %esp,%ebp
    2ffa:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    2ffd:	83 ec 0c             	sub    $0xc,%esp
    3000:	68 a8 00 00 00       	push   $0xa8
    3005:	e8 27 d8 ff ff       	call   831 <malloc>
    300a:	83 c4 10             	add    $0x10,%esp
    300d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3010:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3013:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3019:	8b 45 f4             	mov    -0xc(%ebp),%eax
    301c:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    3023:	ff ff ff 
    return stack;
    3026:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3029:	c9                   	leave  
    302a:	c3                   	ret    

0000302b <pushd>:

void pushd(struct dstack *s, double val)
{
    302b:	55                   	push   %ebp
    302c:	89 e5                	mov    %esp,%ebp
    302e:	83 ec 08             	sub    $0x8,%esp
    3031:	8b 45 0c             	mov    0xc(%ebp),%eax
    3034:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3037:	8b 45 10             	mov    0x10(%ebp),%eax
    303a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    303d:	8b 45 08             	mov    0x8(%ebp),%eax
    3040:	8b 00                	mov    (%eax),%eax
    3042:	83 f8 13             	cmp    $0x13,%eax
    3045:	7f 35                	jg     307c <pushd+0x51>
    {
        s->size++;
    3047:	8b 45 08             	mov    0x8(%ebp),%eax
    304a:	8b 00                	mov    (%eax),%eax
    304c:	8d 50 01             	lea    0x1(%eax),%edx
    304f:	8b 45 08             	mov    0x8(%ebp),%eax
    3052:	89 10                	mov    %edx,(%eax)
        s->top++;
    3054:	8b 45 08             	mov    0x8(%ebp),%eax
    3057:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    305d:	8d 50 01             	lea    0x1(%eax),%edx
    3060:	8b 45 08             	mov    0x8(%ebp),%eax
    3063:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    3069:	8b 45 08             	mov    0x8(%ebp),%eax
    306c:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3072:	8b 45 08             	mov    0x8(%ebp),%eax
    3075:	dd 45 f8             	fldl   -0x8(%ebp)
    3078:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    307c:	90                   	nop
    307d:	c9                   	leave  
    307e:	c3                   	ret    

0000307f <popd>:

double popd(struct dstack *s)
{
    307f:	55                   	push   %ebp
    3080:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3082:	8b 45 08             	mov    0x8(%ebp),%eax
    3085:	8b 00                	mov    (%eax),%eax
    3087:	85 c0                	test   %eax,%eax
    3089:	75 06                	jne    3091 <popd+0x12>
    {
        return -1;
    308b:	d9 e8                	fld1   
    308d:	d9 e0                	fchs   
    308f:	eb 35                	jmp    30c6 <popd+0x47>
    }
    s->size--;
    3091:	8b 45 08             	mov    0x8(%ebp),%eax
    3094:	8b 00                	mov    (%eax),%eax
    3096:	8d 50 ff             	lea    -0x1(%eax),%edx
    3099:	8b 45 08             	mov    0x8(%ebp),%eax
    309c:	89 10                	mov    %edx,(%eax)
    s->top--;
    309e:	8b 45 08             	mov    0x8(%ebp),%eax
    30a1:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    30a7:	8d 50 ff             	lea    -0x1(%eax),%edx
    30aa:	8b 45 08             	mov    0x8(%ebp),%eax
    30ad:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    30b3:	8b 45 08             	mov    0x8(%ebp),%eax
    30b6:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    30bc:	8d 50 01             	lea    0x1(%eax),%edx
    30bf:	8b 45 08             	mov    0x8(%ebp),%eax
    30c2:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    30c6:	5d                   	pop    %ebp
    30c7:	c3                   	ret    

000030c8 <topd>:

double topd(struct dstack* s)
{
    30c8:	55                   	push   %ebp
    30c9:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    30cb:	8b 45 08             	mov    0x8(%ebp),%eax
    30ce:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    30d4:	8b 45 08             	mov    0x8(%ebp),%eax
    30d7:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    30db:	5d                   	pop    %ebp
    30dc:	c3                   	ret    

000030dd <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    30dd:	55                   	push   %ebp
    30de:	89 e5                	mov    %esp,%ebp
    30e0:	53                   	push   %ebx
    30e1:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    30e7:	83 ec 08             	sub    $0x8,%esp
    30ea:	6a 00                	push   $0x0
    30ec:	68 d8 38 00 00       	push   $0x38d8
    30f1:	e8 cd d1 ff ff       	call   2c3 <open>
    30f6:	83 c4 10             	add    $0x10,%esp
    30f9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    30fc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3100:	79 1d                	jns    311f <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    3102:	83 ec 0c             	sub    $0xc,%esp
    3105:	68 e2 38 00 00       	push   $0x38e2
    310a:	6a 00                	push   $0x0
    310c:	6a 00                	push   $0x0
    310e:	6a 01                	push   $0x1
    3110:	6a 03                	push   $0x3
    3112:	e8 40 fb ff ff       	call   2c57 <color_printf>
    3117:	83 c4 20             	add    $0x20,%esp
    311a:	e9 6d 02 00 00       	jmp    338c <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    311f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3122:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    3128:	e9 2a 02 00 00       	jmp    3357 <readVariables+0x27a>
  {
    int pos = 0;
    312d:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    3134:	00 00 00 
    while(pos <= n-1)
    3137:	e9 07 02 00 00       	jmp    3343 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    313c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    3143:	eb 24                	jmp    3169 <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    3145:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3148:	8d 50 ff             	lea    -0x1(%eax),%edx
    314b:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    3151:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3154:	01 c8                	add    %ecx,%eax
    3156:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    315d:	ff 
    315e:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    3165:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    3169:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    316f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3172:	01 d0                	add    %edx,%eax
    3174:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    317b:	ff 
    317c:	3c 3d                	cmp    $0x3d,%al
    317e:	75 c5                	jne    3145 <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    3180:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3183:	83 e8 01             	sub    $0x1,%eax
    3186:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    318d:	00 
      if(buf[pos] == 'd') //double value
    318e:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3194:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    319b:	ff 
    319c:	3c 64                	cmp    $0x64,%al
    319e:	0f 85 a0 00 00 00    	jne    3244 <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    31a4:	8b 45 0c             	mov    0xc(%ebp),%eax
    31a7:	8b 00                	mov    (%eax),%eax
    31a9:	c1 e0 05             	shl    $0x5,%eax
    31ac:	89 c2                	mov    %eax,%edx
    31ae:	8b 45 08             	mov    0x8(%ebp),%eax
    31b1:	01 d0                	add    %edx,%eax
    31b3:	8d 50 04             	lea    0x4(%eax),%edx
    31b6:	83 ec 08             	sub    $0x8,%esp
    31b9:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    31bf:	50                   	push   %eax
    31c0:	52                   	push   %edx
    31c1:	e8 8c ce ff ff       	call   52 <strcpy>
    31c6:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    31c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31cc:	8d 50 01             	lea    0x1(%eax),%edx
    31cf:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    31d5:	01 d0                	add    %edx,%eax
    31d7:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    31dd:	83 ec 08             	sub    $0x8,%esp
    31e0:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    31e6:	50                   	push   %eax
    31e7:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    31ed:	50                   	push   %eax
    31ee:	e8 7b d9 ff ff       	call   b6e <Translation>
    31f3:	83 c4 10             	add    $0x10,%esp
    31f6:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    31f9:	8b 45 0c             	mov    0xc(%ebp),%eax
    31fc:	8b 00                	mov    (%eax),%eax
    31fe:	c1 e0 05             	shl    $0x5,%eax
    3201:	89 c2                	mov    %eax,%edx
    3203:	8b 45 08             	mov    0x8(%ebp),%eax
    3206:	01 d0                	add    %edx,%eax
    3208:	dd 45 d8             	fldl   -0x28(%ebp)
    320b:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    320e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3211:	8b 00                	mov    (%eax),%eax
    3213:	c1 e0 05             	shl    $0x5,%eax
    3216:	89 c2                	mov    %eax,%edx
    3218:	8b 45 08             	mov    0x8(%ebp),%eax
    321b:	01 d0                	add    %edx,%eax
    321d:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    3223:	8b 45 0c             	mov    0xc(%ebp),%eax
    3226:	8b 00                	mov    (%eax),%eax
    3228:	8d 50 01             	lea    0x1(%eax),%edx
    322b:	8b 45 0c             	mov    0xc(%ebp),%eax
    322e:	89 10                	mov    %edx,(%eax)
        pos++;
    3230:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3236:	83 c0 01             	add    $0x1,%eax
    3239:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    323f:	e9 ff 00 00 00       	jmp    3343 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    3244:	8b 45 0c             	mov    0xc(%ebp),%eax
    3247:	8b 00                	mov    (%eax),%eax
    3249:	c1 e0 05             	shl    $0x5,%eax
    324c:	89 c2                	mov    %eax,%edx
    324e:	8b 45 08             	mov    0x8(%ebp),%eax
    3251:	01 d0                	add    %edx,%eax
    3253:	8d 50 04             	lea    0x4(%eax),%edx
    3256:	83 ec 08             	sub    $0x8,%esp
    3259:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    325f:	50                   	push   %eax
    3260:	52                   	push   %edx
    3261:	e8 ec cd ff ff       	call   52 <strcpy>
    3266:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    3269:	8b 45 f4             	mov    -0xc(%ebp),%eax
    326c:	8d 50 01             	lea    0x1(%eax),%edx
    326f:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3275:	01 d0                	add    %edx,%eax
    3277:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    327d:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3283:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    3286:	eb 04                	jmp    328c <readVariables+0x1af>
        {
          strend++;
    3288:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    328c:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    3292:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3295:	01 d0                	add    %edx,%eax
    3297:	0f b6 00             	movzbl (%eax),%eax
    329a:	84 c0                	test   %al,%al
    329c:	75 ea                	jne    3288 <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    329e:	8b 45 0c             	mov    0xc(%ebp),%eax
    32a1:	8b 00                	mov    (%eax),%eax
    32a3:	c1 e0 05             	shl    $0x5,%eax
    32a6:	89 c2                	mov    %eax,%edx
    32a8:	8b 45 08             	mov    0x8(%ebp),%eax
    32ab:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    32ae:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32b4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    32b7:	29 c2                	sub    %eax,%edx
    32b9:	89 d0                	mov    %edx,%eax
    32bb:	83 c0 01             	add    $0x1,%eax
    32be:	83 ec 0c             	sub    $0xc,%esp
    32c1:	50                   	push   %eax
    32c2:	e8 6a d5 ff ff       	call   831 <malloc>
    32c7:	83 c4 10             	add    $0x10,%esp
    32ca:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    32cd:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    32d6:	eb 35                	jmp    330d <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    32d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    32db:	8b 00                	mov    (%eax),%eax
    32dd:	c1 e0 05             	shl    $0x5,%eax
    32e0:	89 c2                	mov    %eax,%edx
    32e2:	8b 45 08             	mov    0x8(%ebp),%eax
    32e5:	01 d0                	add    %edx,%eax
    32e7:	8b 40 18             	mov    0x18(%eax),%eax
    32ea:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    32f0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    32f3:	29 d1                	sub    %edx,%ecx
    32f5:	89 ca                	mov    %ecx,%edx
    32f7:	01 c2                	add    %eax,%edx
    32f9:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    32ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3302:	01 c8                	add    %ecx,%eax
    3304:	0f b6 00             	movzbl (%eax),%eax
    3307:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    3309:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    330d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3310:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3313:	7e c3                	jle    32d8 <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    3315:	8b 45 0c             	mov    0xc(%ebp),%eax
    3318:	8b 00                	mov    (%eax),%eax
    331a:	c1 e0 05             	shl    $0x5,%eax
    331d:	89 c2                	mov    %eax,%edx
    331f:	8b 45 08             	mov    0x8(%ebp),%eax
    3322:	01 d0                	add    %edx,%eax
    3324:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    332a:	8b 45 0c             	mov    0xc(%ebp),%eax
    332d:	8b 00                	mov    (%eax),%eax
    332f:	8d 50 01             	lea    0x1(%eax),%edx
    3332:	8b 45 0c             	mov    0xc(%ebp),%eax
    3335:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    3337:	8b 45 f0             	mov    -0x10(%ebp),%eax
    333a:	83 c0 01             	add    $0x1,%eax
    333d:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    3343:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3346:	8d 50 ff             	lea    -0x1(%eax),%edx
    3349:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    334f:	39 c2                	cmp    %eax,%edx
    3351:	0f 8d e5 fd ff ff    	jge    313c <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    3357:	83 ec 04             	sub    $0x4,%esp
    335a:	68 e8 03 00 00       	push   $0x3e8
    335f:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3365:	50                   	push   %eax
    3366:	ff 75 e8             	pushl  -0x18(%ebp)
    3369:	e8 2d cf ff ff       	call   29b <read>
    336e:	83 c4 10             	add    $0x10,%esp
    3371:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3374:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3378:	0f 8f af fd ff ff    	jg     312d <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    337e:	83 ec 0c             	sub    $0xc,%esp
    3381:	ff 75 e8             	pushl  -0x18(%ebp)
    3384:	e8 22 cf ff ff       	call   2ab <close>
    3389:	83 c4 10             	add    $0x10,%esp
}
    338c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    338f:	c9                   	leave  
    3390:	c3                   	ret    

00003391 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3391:	55                   	push   %ebp
    3392:	89 e5                	mov    %esp,%ebp
    3394:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    339a:	83 ec 08             	sub    $0x8,%esp
    339d:	6a 02                	push   $0x2
    339f:	68 d8 38 00 00       	push   $0x38d8
    33a4:	e8 1a cf ff ff       	call   2c3 <open>
    33a9:	83 c4 10             	add    $0x10,%esp
    33ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    33af:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    33b3:	78 1e                	js     33d3 <writeVariables+0x42>
  {
    close(fd);
    33b5:	83 ec 0c             	sub    $0xc,%esp
    33b8:	ff 75 e4             	pushl  -0x1c(%ebp)
    33bb:	e8 eb ce ff ff       	call   2ab <close>
    33c0:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    33c3:	83 ec 0c             	sub    $0xc,%esp
    33c6:	68 d8 38 00 00       	push   $0x38d8
    33cb:	e8 03 cf ff ff       	call   2d3 <unlink>
    33d0:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    33d3:	83 ec 08             	sub    $0x8,%esp
    33d6:	68 02 02 00 00       	push   $0x202
    33db:	68 d8 38 00 00       	push   $0x38d8
    33e0:	e8 de ce ff ff       	call   2c3 <open>
    33e5:	83 c4 10             	add    $0x10,%esp
    33e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    33eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    33f2:	e9 ff 01 00 00       	jmp    35f6 <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    33f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33fa:	c1 e0 05             	shl    $0x5,%eax
    33fd:	89 c2                	mov    %eax,%edx
    33ff:	8b 45 08             	mov    0x8(%ebp),%eax
    3402:	01 d0                	add    %edx,%eax
    3404:	8b 00                	mov    (%eax),%eax
    3406:	83 f8 01             	cmp    $0x1,%eax
    3409:	0f 85 d3 00 00 00    	jne    34e2 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    340f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    3416:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3419:	8d 50 01             	lea    0x1(%eax),%edx
    341c:	89 55 e0             	mov    %edx,-0x20(%ebp)
    341f:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    3426:	64 
      int k=0;
    3427:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    342e:	eb 2c                	jmp    345c <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    3430:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3433:	8d 50 01             	lea    0x1(%eax),%edx
    3436:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3439:	8b 55 f4             	mov    -0xc(%ebp),%edx
    343c:	89 d1                	mov    %edx,%ecx
    343e:	c1 e1 05             	shl    $0x5,%ecx
    3441:	8b 55 08             	mov    0x8(%ebp),%edx
    3444:	01 d1                	add    %edx,%ecx
    3446:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3449:	01 ca                	add    %ecx,%edx
    344b:	83 c2 04             	add    $0x4,%edx
    344e:	0f b6 12             	movzbl (%edx),%edx
    3451:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3458:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    345c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    345f:	c1 e0 05             	shl    $0x5,%eax
    3462:	89 c2                	mov    %eax,%edx
    3464:	8b 45 08             	mov    0x8(%ebp),%eax
    3467:	01 c2                	add    %eax,%edx
    3469:	8b 45 f0             	mov    -0x10(%ebp),%eax
    346c:	01 d0                	add    %edx,%eax
    346e:	83 c0 04             	add    $0x4,%eax
    3471:	0f b6 00             	movzbl (%eax),%eax
    3474:	84 c0                	test   %al,%al
    3476:	75 b8                	jne    3430 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3478:	8b 45 e0             	mov    -0x20(%ebp),%eax
    347b:	8d 50 01             	lea    0x1(%eax),%edx
    347e:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3481:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    3488:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    3489:	8b 45 f4             	mov    -0xc(%ebp),%eax
    348c:	c1 e0 05             	shl    $0x5,%eax
    348f:	89 c2                	mov    %eax,%edx
    3491:	8b 45 08             	mov    0x8(%ebp),%eax
    3494:	01 d0                	add    %edx,%eax
    3496:	dd 40 18             	fldl   0x18(%eax)
    3499:	8d 45 e0             	lea    -0x20(%ebp),%eax
    349c:	50                   	push   %eax
    349d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    34a1:	dd 1c 24             	fstpl  (%esp)
    34a4:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    34aa:	50                   	push   %eax
    34ab:	e8 7d d5 ff ff       	call   a2d <double2str>
    34b0:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    34b3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34b6:	8d 50 01             	lea    0x1(%eax),%edx
    34b9:	89 55 e0             	mov    %edx,-0x20(%ebp)
    34bc:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    34c3:	00 
      write(fd,buf,pos);
    34c4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34c7:	83 ec 04             	sub    $0x4,%esp
    34ca:	50                   	push   %eax
    34cb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    34d1:	50                   	push   %eax
    34d2:	ff 75 e4             	pushl  -0x1c(%ebp)
    34d5:	e8 c9 cd ff ff       	call   2a3 <write>
    34da:	83 c4 10             	add    $0x10,%esp
    34dd:	e9 10 01 00 00       	jmp    35f2 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    34e2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    34e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    34ec:	8d 50 01             	lea    0x1(%eax),%edx
    34ef:	89 55 ec             	mov    %edx,-0x14(%ebp)
    34f2:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    34f9:	73 
      int k=0;
    34fa:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    3501:	eb 2c                	jmp    352f <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    3503:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3506:	8d 50 01             	lea    0x1(%eax),%edx
    3509:	89 55 ec             	mov    %edx,-0x14(%ebp)
    350c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    350f:	89 d1                	mov    %edx,%ecx
    3511:	c1 e1 05             	shl    $0x5,%ecx
    3514:	8b 55 08             	mov    0x8(%ebp),%edx
    3517:	01 d1                	add    %edx,%ecx
    3519:	8b 55 e8             	mov    -0x18(%ebp),%edx
    351c:	01 ca                	add    %ecx,%edx
    351e:	83 c2 04             	add    $0x4,%edx
    3521:	0f b6 12             	movzbl (%edx),%edx
    3524:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    352b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    352f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3532:	c1 e0 05             	shl    $0x5,%eax
    3535:	89 c2                	mov    %eax,%edx
    3537:	8b 45 08             	mov    0x8(%ebp),%eax
    353a:	01 c2                	add    %eax,%edx
    353c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    353f:	01 d0                	add    %edx,%eax
    3541:	83 c0 04             	add    $0x4,%eax
    3544:	0f b6 00             	movzbl (%eax),%eax
    3547:	84 c0                	test   %al,%al
    3549:	75 b8                	jne    3503 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    354b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    354e:	8d 50 01             	lea    0x1(%eax),%edx
    3551:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3554:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    355b:	3d 
      k=0;
    355c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    3563:	eb 2c                	jmp    3591 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    3565:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3568:	8d 50 01             	lea    0x1(%eax),%edx
    356b:	89 55 ec             	mov    %edx,-0x14(%ebp)
    356e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3571:	89 d1                	mov    %edx,%ecx
    3573:	c1 e1 05             	shl    $0x5,%ecx
    3576:	8b 55 08             	mov    0x8(%ebp),%edx
    3579:	01 ca                	add    %ecx,%edx
    357b:	8b 4a 18             	mov    0x18(%edx),%ecx
    357e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3581:	01 ca                	add    %ecx,%edx
    3583:	0f b6 12             	movzbl (%edx),%edx
    3586:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    358d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    3591:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3594:	c1 e0 05             	shl    $0x5,%eax
    3597:	89 c2                	mov    %eax,%edx
    3599:	8b 45 08             	mov    0x8(%ebp),%eax
    359c:	01 d0                	add    %edx,%eax
    359e:	8b 50 18             	mov    0x18(%eax),%edx
    35a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    35a4:	01 d0                	add    %edx,%eax
    35a6:	0f b6 00             	movzbl (%eax),%eax
    35a9:	84 c0                	test   %al,%al
    35ab:	75 b8                	jne    3565 <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    35ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35b0:	8d 50 01             	lea    0x1(%eax),%edx
    35b3:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35b6:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    35bd:	00 
      write(fd,buf,pos);
    35be:	83 ec 04             	sub    $0x4,%esp
    35c1:	ff 75 ec             	pushl  -0x14(%ebp)
    35c4:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    35ca:	50                   	push   %eax
    35cb:	ff 75 e4             	pushl  -0x1c(%ebp)
    35ce:	e8 d0 cc ff ff       	call   2a3 <write>
    35d3:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    35d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35d9:	c1 e0 05             	shl    $0x5,%eax
    35dc:	89 c2                	mov    %eax,%edx
    35de:	8b 45 08             	mov    0x8(%ebp),%eax
    35e1:	01 d0                	add    %edx,%eax
    35e3:	8b 40 18             	mov    0x18(%eax),%eax
    35e6:	83 ec 0c             	sub    $0xc,%esp
    35e9:	50                   	push   %eax
    35ea:	e8 00 d1 ff ff       	call   6ef <free>
    35ef:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    35f2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    35f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    35f9:	8b 00                	mov    (%eax),%eax
    35fb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    35fe:	0f 8f f3 fd ff ff    	jg     33f7 <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    3604:	8b 45 0c             	mov    0xc(%ebp),%eax
    3607:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    360d:	83 ec 0c             	sub    $0xc,%esp
    3610:	ff 75 e4             	pushl  -0x1c(%ebp)
    3613:	e8 93 cc ff ff       	call   2ab <close>
    3618:	83 c4 10             	add    $0x10,%esp
  return;
    361b:	90                   	nop
    361c:	c9                   	leave  
    361d:	c3                   	ret    
