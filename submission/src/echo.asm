
_echo：     文件格式 elf32-i386


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

  for(i = 1; i < argc; i++)
      14:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      1b:	eb 3c                	jmp    59 <main+0x59>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
      1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      20:	83 c0 01             	add    $0x1,%eax
      23:	3b 03                	cmp    (%ebx),%eax
      25:	7d 07                	jge    2e <main+0x2e>
      27:	ba 58 36 00 00       	mov    $0x3658,%edx
      2c:	eb 05                	jmp    33 <main+0x33>
      2e:	ba 5a 36 00 00       	mov    $0x365a,%edx
      33:	8b 45 f4             	mov    -0xc(%ebp),%eax
      36:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
      3d:	8b 43 04             	mov    0x4(%ebx),%eax
      40:	01 c8                	add    %ecx,%eax
      42:	8b 00                	mov    (%eax),%eax
      44:	52                   	push   %edx
      45:	50                   	push   %eax
      46:	68 5c 36 00 00       	push   $0x365c
      4b:	6a 01                	push   $0x1
      4d:	e8 16 05 00 00       	call   568 <printf>
      52:	83 c4 10             	add    $0x10,%esp
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
      55:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      59:	8b 45 f4             	mov    -0xc(%ebp),%eax
      5c:	3b 03                	cmp    (%ebx),%eax
      5e:	7c bd                	jl     1d <main+0x1d>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit();
      60:	e8 57 02 00 00       	call   2bc <exit>

00000065 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
      65:	55                   	push   %ebp
      66:	89 e5                	mov    %esp,%ebp
      68:	57                   	push   %edi
      69:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
      6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
      6d:	8b 55 10             	mov    0x10(%ebp),%edx
      70:	8b 45 0c             	mov    0xc(%ebp),%eax
      73:	89 cb                	mov    %ecx,%ebx
      75:	89 df                	mov    %ebx,%edi
      77:	89 d1                	mov    %edx,%ecx
      79:	fc                   	cld    
      7a:	f3 aa                	rep stos %al,%es:(%edi)
      7c:	89 ca                	mov    %ecx,%edx
      7e:	89 fb                	mov    %edi,%ebx
      80:	89 5d 08             	mov    %ebx,0x8(%ebp)
      83:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
      86:	90                   	nop
      87:	5b                   	pop    %ebx
      88:	5f                   	pop    %edi
      89:	5d                   	pop    %ebp
      8a:	c3                   	ret    

0000008b <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
      8b:	55                   	push   %ebp
      8c:	89 e5                	mov    %esp,%ebp
      8e:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
      91:	8b 45 08             	mov    0x8(%ebp),%eax
      94:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
      97:	90                   	nop
      98:	8b 45 08             	mov    0x8(%ebp),%eax
      9b:	8d 50 01             	lea    0x1(%eax),%edx
      9e:	89 55 08             	mov    %edx,0x8(%ebp)
      a1:	8b 55 0c             	mov    0xc(%ebp),%edx
      a4:	8d 4a 01             	lea    0x1(%edx),%ecx
      a7:	89 4d 0c             	mov    %ecx,0xc(%ebp)
      aa:	0f b6 12             	movzbl (%edx),%edx
      ad:	88 10                	mov    %dl,(%eax)
      af:	0f b6 00             	movzbl (%eax),%eax
      b2:	84 c0                	test   %al,%al
      b4:	75 e2                	jne    98 <strcpy+0xd>
    ;
  return os;
      b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
      b9:	c9                   	leave  
      ba:	c3                   	ret    

000000bb <strcmp>:

int
strcmp(const char *p, const char *q)
{
      bb:	55                   	push   %ebp
      bc:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
      be:	eb 08                	jmp    c8 <strcmp+0xd>
    p++, q++;
      c0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
      c4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      c8:	8b 45 08             	mov    0x8(%ebp),%eax
      cb:	0f b6 00             	movzbl (%eax),%eax
      ce:	84 c0                	test   %al,%al
      d0:	74 10                	je     e2 <strcmp+0x27>
      d2:	8b 45 08             	mov    0x8(%ebp),%eax
      d5:	0f b6 10             	movzbl (%eax),%edx
      d8:	8b 45 0c             	mov    0xc(%ebp),%eax
      db:	0f b6 00             	movzbl (%eax),%eax
      de:	38 c2                	cmp    %al,%dl
      e0:	74 de                	je     c0 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
      e2:	8b 45 08             	mov    0x8(%ebp),%eax
      e5:	0f b6 00             	movzbl (%eax),%eax
      e8:	0f b6 d0             	movzbl %al,%edx
      eb:	8b 45 0c             	mov    0xc(%ebp),%eax
      ee:	0f b6 00             	movzbl (%eax),%eax
      f1:	0f b6 c0             	movzbl %al,%eax
      f4:	29 c2                	sub    %eax,%edx
      f6:	89 d0                	mov    %edx,%eax
}
      f8:	5d                   	pop    %ebp
      f9:	c3                   	ret    

000000fa <strlen>:

uint
strlen(char *s)
{
      fa:	55                   	push   %ebp
      fb:	89 e5                	mov    %esp,%ebp
      fd:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     100:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     107:	eb 04                	jmp    10d <strlen+0x13>
     109:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     10d:	8b 55 fc             	mov    -0x4(%ebp),%edx
     110:	8b 45 08             	mov    0x8(%ebp),%eax
     113:	01 d0                	add    %edx,%eax
     115:	0f b6 00             	movzbl (%eax),%eax
     118:	84 c0                	test   %al,%al
     11a:	75 ed                	jne    109 <strlen+0xf>
    ;
  return n;
     11c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     11f:	c9                   	leave  
     120:	c3                   	ret    

00000121 <memset>:

void*
memset(void *dst, int c, uint n)
{
     121:	55                   	push   %ebp
     122:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     124:	8b 45 10             	mov    0x10(%ebp),%eax
     127:	50                   	push   %eax
     128:	ff 75 0c             	pushl  0xc(%ebp)
     12b:	ff 75 08             	pushl  0x8(%ebp)
     12e:	e8 32 ff ff ff       	call   65 <stosb>
     133:	83 c4 0c             	add    $0xc,%esp
  return dst;
     136:	8b 45 08             	mov    0x8(%ebp),%eax
}
     139:	c9                   	leave  
     13a:	c3                   	ret    

0000013b <strchr>:

char*
strchr(const char *s, char c)
{
     13b:	55                   	push   %ebp
     13c:	89 e5                	mov    %esp,%ebp
     13e:	83 ec 04             	sub    $0x4,%esp
     141:	8b 45 0c             	mov    0xc(%ebp),%eax
     144:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     147:	eb 14                	jmp    15d <strchr+0x22>
    if(*s == c)
     149:	8b 45 08             	mov    0x8(%ebp),%eax
     14c:	0f b6 00             	movzbl (%eax),%eax
     14f:	3a 45 fc             	cmp    -0x4(%ebp),%al
     152:	75 05                	jne    159 <strchr+0x1e>
      return (char*)s;
     154:	8b 45 08             	mov    0x8(%ebp),%eax
     157:	eb 13                	jmp    16c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     159:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     15d:	8b 45 08             	mov    0x8(%ebp),%eax
     160:	0f b6 00             	movzbl (%eax),%eax
     163:	84 c0                	test   %al,%al
     165:	75 e2                	jne    149 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     167:	b8 00 00 00 00       	mov    $0x0,%eax
}
     16c:	c9                   	leave  
     16d:	c3                   	ret    

0000016e <gets>:

char*
gets(char *buf, int max)
{
     16e:	55                   	push   %ebp
     16f:	89 e5                	mov    %esp,%ebp
     171:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     174:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     17b:	eb 42                	jmp    1bf <gets+0x51>
    cc = read(0, &c, 1);
     17d:	83 ec 04             	sub    $0x4,%esp
     180:	6a 01                	push   $0x1
     182:	8d 45 ef             	lea    -0x11(%ebp),%eax
     185:	50                   	push   %eax
     186:	6a 00                	push   $0x0
     188:	e8 47 01 00 00       	call   2d4 <read>
     18d:	83 c4 10             	add    $0x10,%esp
     190:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     193:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     197:	7e 33                	jle    1cc <gets+0x5e>
      break;
    buf[i++] = c;
     199:	8b 45 f4             	mov    -0xc(%ebp),%eax
     19c:	8d 50 01             	lea    0x1(%eax),%edx
     19f:	89 55 f4             	mov    %edx,-0xc(%ebp)
     1a2:	89 c2                	mov    %eax,%edx
     1a4:	8b 45 08             	mov    0x8(%ebp),%eax
     1a7:	01 c2                	add    %eax,%edx
     1a9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1ad:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     1af:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1b3:	3c 0a                	cmp    $0xa,%al
     1b5:	74 16                	je     1cd <gets+0x5f>
     1b7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     1bb:	3c 0d                	cmp    $0xd,%al
     1bd:	74 0e                	je     1cd <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     1bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1c2:	83 c0 01             	add    $0x1,%eax
     1c5:	3b 45 0c             	cmp    0xc(%ebp),%eax
     1c8:	7c b3                	jl     17d <gets+0xf>
     1ca:	eb 01                	jmp    1cd <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     1cc:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
     1d0:	8b 45 08             	mov    0x8(%ebp),%eax
     1d3:	01 d0                	add    %edx,%eax
     1d5:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     1d8:	8b 45 08             	mov    0x8(%ebp),%eax
}
     1db:	c9                   	leave  
     1dc:	c3                   	ret    

000001dd <stat>:

int
stat(char *n, struct stat *st)
{
     1dd:	55                   	push   %ebp
     1de:	89 e5                	mov    %esp,%ebp
     1e0:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     1e3:	83 ec 08             	sub    $0x8,%esp
     1e6:	6a 00                	push   $0x0
     1e8:	ff 75 08             	pushl  0x8(%ebp)
     1eb:	e8 0c 01 00 00       	call   2fc <open>
     1f0:	83 c4 10             	add    $0x10,%esp
     1f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     1f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     1fa:	79 07                	jns    203 <stat+0x26>
    return -1;
     1fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     201:	eb 25                	jmp    228 <stat+0x4b>
  r = fstat(fd, st);
     203:	83 ec 08             	sub    $0x8,%esp
     206:	ff 75 0c             	pushl  0xc(%ebp)
     209:	ff 75 f4             	pushl  -0xc(%ebp)
     20c:	e8 03 01 00 00       	call   314 <fstat>
     211:	83 c4 10             	add    $0x10,%esp
     214:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     217:	83 ec 0c             	sub    $0xc,%esp
     21a:	ff 75 f4             	pushl  -0xc(%ebp)
     21d:	e8 c2 00 00 00       	call   2e4 <close>
     222:	83 c4 10             	add    $0x10,%esp
  return r;
     225:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     228:	c9                   	leave  
     229:	c3                   	ret    

0000022a <atoi>:

int
atoi(const char *s)
{
     22a:	55                   	push   %ebp
     22b:	89 e5                	mov    %esp,%ebp
     22d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     230:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     237:	eb 25                	jmp    25e <atoi+0x34>
    n = n*10 + *s++ - '0';
     239:	8b 55 fc             	mov    -0x4(%ebp),%edx
     23c:	89 d0                	mov    %edx,%eax
     23e:	c1 e0 02             	shl    $0x2,%eax
     241:	01 d0                	add    %edx,%eax
     243:	01 c0                	add    %eax,%eax
     245:	89 c1                	mov    %eax,%ecx
     247:	8b 45 08             	mov    0x8(%ebp),%eax
     24a:	8d 50 01             	lea    0x1(%eax),%edx
     24d:	89 55 08             	mov    %edx,0x8(%ebp)
     250:	0f b6 00             	movzbl (%eax),%eax
     253:	0f be c0             	movsbl %al,%eax
     256:	01 c8                	add    %ecx,%eax
     258:	83 e8 30             	sub    $0x30,%eax
     25b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     25e:	8b 45 08             	mov    0x8(%ebp),%eax
     261:	0f b6 00             	movzbl (%eax),%eax
     264:	3c 2f                	cmp    $0x2f,%al
     266:	7e 0a                	jle    272 <atoi+0x48>
     268:	8b 45 08             	mov    0x8(%ebp),%eax
     26b:	0f b6 00             	movzbl (%eax),%eax
     26e:	3c 39                	cmp    $0x39,%al
     270:	7e c7                	jle    239 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     272:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     275:	c9                   	leave  
     276:	c3                   	ret    

00000277 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     277:	55                   	push   %ebp
     278:	89 e5                	mov    %esp,%ebp
     27a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     27d:	8b 45 08             	mov    0x8(%ebp),%eax
     280:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     283:	8b 45 0c             	mov    0xc(%ebp),%eax
     286:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     289:	eb 17                	jmp    2a2 <memmove+0x2b>
    *dst++ = *src++;
     28b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     28e:	8d 50 01             	lea    0x1(%eax),%edx
     291:	89 55 fc             	mov    %edx,-0x4(%ebp)
     294:	8b 55 f8             	mov    -0x8(%ebp),%edx
     297:	8d 4a 01             	lea    0x1(%edx),%ecx
     29a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     29d:	0f b6 12             	movzbl (%edx),%edx
     2a0:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     2a2:	8b 45 10             	mov    0x10(%ebp),%eax
     2a5:	8d 50 ff             	lea    -0x1(%eax),%edx
     2a8:	89 55 10             	mov    %edx,0x10(%ebp)
     2ab:	85 c0                	test   %eax,%eax
     2ad:	7f dc                	jg     28b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     2af:	8b 45 08             	mov    0x8(%ebp),%eax
}
     2b2:	c9                   	leave  
     2b3:	c3                   	ret    

000002b4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     2b4:	b8 01 00 00 00       	mov    $0x1,%eax
     2b9:	cd 40                	int    $0x40
     2bb:	c3                   	ret    

000002bc <exit>:
SYSCALL(exit)
     2bc:	b8 02 00 00 00       	mov    $0x2,%eax
     2c1:	cd 40                	int    $0x40
     2c3:	c3                   	ret    

000002c4 <wait>:
SYSCALL(wait)
     2c4:	b8 03 00 00 00       	mov    $0x3,%eax
     2c9:	cd 40                	int    $0x40
     2cb:	c3                   	ret    

000002cc <pipe>:
SYSCALL(pipe)
     2cc:	b8 04 00 00 00       	mov    $0x4,%eax
     2d1:	cd 40                	int    $0x40
     2d3:	c3                   	ret    

000002d4 <read>:
SYSCALL(read)
     2d4:	b8 05 00 00 00       	mov    $0x5,%eax
     2d9:	cd 40                	int    $0x40
     2db:	c3                   	ret    

000002dc <write>:
SYSCALL(write)
     2dc:	b8 10 00 00 00       	mov    $0x10,%eax
     2e1:	cd 40                	int    $0x40
     2e3:	c3                   	ret    

000002e4 <close>:
SYSCALL(close)
     2e4:	b8 15 00 00 00       	mov    $0x15,%eax
     2e9:	cd 40                	int    $0x40
     2eb:	c3                   	ret    

000002ec <kill>:
SYSCALL(kill)
     2ec:	b8 06 00 00 00       	mov    $0x6,%eax
     2f1:	cd 40                	int    $0x40
     2f3:	c3                   	ret    

000002f4 <exec>:
SYSCALL(exec)
     2f4:	b8 07 00 00 00       	mov    $0x7,%eax
     2f9:	cd 40                	int    $0x40
     2fb:	c3                   	ret    

000002fc <open>:
SYSCALL(open)
     2fc:	b8 0f 00 00 00       	mov    $0xf,%eax
     301:	cd 40                	int    $0x40
     303:	c3                   	ret    

00000304 <mknod>:
SYSCALL(mknod)
     304:	b8 11 00 00 00       	mov    $0x11,%eax
     309:	cd 40                	int    $0x40
     30b:	c3                   	ret    

0000030c <unlink>:
SYSCALL(unlink)
     30c:	b8 12 00 00 00       	mov    $0x12,%eax
     311:	cd 40                	int    $0x40
     313:	c3                   	ret    

00000314 <fstat>:
SYSCALL(fstat)
     314:	b8 08 00 00 00       	mov    $0x8,%eax
     319:	cd 40                	int    $0x40
     31b:	c3                   	ret    

0000031c <link>:
SYSCALL(link)
     31c:	b8 13 00 00 00       	mov    $0x13,%eax
     321:	cd 40                	int    $0x40
     323:	c3                   	ret    

00000324 <mkdir>:
SYSCALL(mkdir)
     324:	b8 14 00 00 00       	mov    $0x14,%eax
     329:	cd 40                	int    $0x40
     32b:	c3                   	ret    

0000032c <chdir>:
SYSCALL(chdir)
     32c:	b8 09 00 00 00       	mov    $0x9,%eax
     331:	cd 40                	int    $0x40
     333:	c3                   	ret    

00000334 <dup>:
SYSCALL(dup)
     334:	b8 0a 00 00 00       	mov    $0xa,%eax
     339:	cd 40                	int    $0x40
     33b:	c3                   	ret    

0000033c <getpid>:
SYSCALL(getpid)
     33c:	b8 0b 00 00 00       	mov    $0xb,%eax
     341:	cd 40                	int    $0x40
     343:	c3                   	ret    

00000344 <sbrk>:
SYSCALL(sbrk)
     344:	b8 0c 00 00 00       	mov    $0xc,%eax
     349:	cd 40                	int    $0x40
     34b:	c3                   	ret    

0000034c <sleep>:
SYSCALL(sleep)
     34c:	b8 0d 00 00 00       	mov    $0xd,%eax
     351:	cd 40                	int    $0x40
     353:	c3                   	ret    

00000354 <uptime>:
SYSCALL(uptime)
     354:	b8 0e 00 00 00       	mov    $0xe,%eax
     359:	cd 40                	int    $0x40
     35b:	c3                   	ret    

0000035c <colorwrite>:

//new here
SYSCALL(colorwrite)
     35c:	b8 16 00 00 00       	mov    $0x16,%eax
     361:	cd 40                	int    $0x40
     363:	c3                   	ret    

00000364 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     364:	55                   	push   %ebp
     365:	89 e5                	mov    %esp,%ebp
     367:	83 ec 18             	sub    $0x18,%esp
     36a:	8b 45 0c             	mov    0xc(%ebp),%eax
     36d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     370:	83 ec 04             	sub    $0x4,%esp
     373:	6a 01                	push   $0x1
     375:	8d 45 f4             	lea    -0xc(%ebp),%eax
     378:	50                   	push   %eax
     379:	ff 75 08             	pushl  0x8(%ebp)
     37c:	e8 5b ff ff ff       	call   2dc <write>
     381:	83 c4 10             	add    $0x10,%esp
}
     384:	90                   	nop
     385:	c9                   	leave  
     386:	c3                   	ret    

00000387 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     387:	55                   	push   %ebp
     388:	89 e5                	mov    %esp,%ebp
     38a:	53                   	push   %ebx
     38b:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     38e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     395:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     399:	74 17                	je     3b2 <printint+0x2b>
     39b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     39f:	79 11                	jns    3b2 <printint+0x2b>
    neg = 1;
     3a1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     3a8:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ab:	f7 d8                	neg    %eax
     3ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
     3b0:	eb 06                	jmp    3b8 <printint+0x31>
  } else {
    x = xx;
     3b2:	8b 45 0c             	mov    0xc(%ebp),%eax
     3b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     3b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     3bf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     3c2:	8d 41 01             	lea    0x1(%ecx),%eax
     3c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
     3c8:	8b 5d 10             	mov    0x10(%ebp),%ebx
     3cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3ce:	ba 00 00 00 00       	mov    $0x0,%edx
     3d3:	f7 f3                	div    %ebx
     3d5:	89 d0                	mov    %edx,%eax
     3d7:	0f b6 80 80 42 00 00 	movzbl 0x4280(%eax),%eax
     3de:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     3e2:	8b 5d 10             	mov    0x10(%ebp),%ebx
     3e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3e8:	ba 00 00 00 00       	mov    $0x0,%edx
     3ed:	f7 f3                	div    %ebx
     3ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
     3f2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     3f6:	75 c7                	jne    3bf <printint+0x38>
  if(neg)
     3f8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     3fc:	74 2d                	je     42b <printint+0xa4>
    buf[i++] = '-';
     3fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
     401:	8d 50 01             	lea    0x1(%eax),%edx
     404:	89 55 f4             	mov    %edx,-0xc(%ebp)
     407:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     40c:	eb 1d                	jmp    42b <printint+0xa4>
    putc(fd, buf[i]);
     40e:	8d 55 dc             	lea    -0x24(%ebp),%edx
     411:	8b 45 f4             	mov    -0xc(%ebp),%eax
     414:	01 d0                	add    %edx,%eax
     416:	0f b6 00             	movzbl (%eax),%eax
     419:	0f be c0             	movsbl %al,%eax
     41c:	83 ec 08             	sub    $0x8,%esp
     41f:	50                   	push   %eax
     420:	ff 75 08             	pushl  0x8(%ebp)
     423:	e8 3c ff ff ff       	call   364 <putc>
     428:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     42b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     42f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     433:	79 d9                	jns    40e <printint+0x87>
    putc(fd, buf[i]);
}
     435:	90                   	nop
     436:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     439:	c9                   	leave  
     43a:	c3                   	ret    

0000043b <getInteger>:

static int getInteger(double num)
{
     43b:	55                   	push   %ebp
     43c:	89 e5                	mov    %esp,%ebp
     43e:	83 ec 18             	sub    $0x18,%esp
     441:	8b 45 08             	mov    0x8(%ebp),%eax
     444:	89 45 e8             	mov    %eax,-0x18(%ebp)
     447:	8b 45 0c             	mov    0xc(%ebp),%eax
     44a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     44d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     454:	eb 0e                	jmp    464 <getInteger+0x29>
  {
    num -= 1;
     456:	dd 45 e8             	fldl   -0x18(%ebp)
     459:	d9 e8                	fld1   
     45b:	de e9                	fsubrp %st,%st(1)
     45d:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     460:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     464:	dd 45 e8             	fldl   -0x18(%ebp)
     467:	d9 e8                	fld1   
     469:	d9 c9                	fxch   %st(1)
     46b:	df e9                	fucomip %st(1),%st
     46d:	dd d8                	fstp   %st(0)
     46f:	77 e5                	ja     456 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     471:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     474:	c9                   	leave  
     475:	c3                   	ret    

00000476 <printdbl>:

void printdbl(int fd, double num)
{
     476:	55                   	push   %ebp
     477:	89 e5                	mov    %esp,%ebp
     479:	83 ec 28             	sub    $0x28,%esp
     47c:	8b 45 0c             	mov    0xc(%ebp),%eax
     47f:	89 45 e0             	mov    %eax,-0x20(%ebp)
     482:	8b 45 10             	mov    0x10(%ebp),%eax
     485:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     488:	d9 ee                	fldz   
     48a:	dd 45 e0             	fldl   -0x20(%ebp)
     48d:	d9 c9                	fxch   %st(1)
     48f:	df e9                	fucomip %st(1),%st
     491:	dd d8                	fstp   %st(0)
     493:	76 18                	jbe    4ad <printdbl+0x37>
  {
    putc(fd,'-');
     495:	83 ec 08             	sub    $0x8,%esp
     498:	6a 2d                	push   $0x2d
     49a:	ff 75 08             	pushl  0x8(%ebp)
     49d:	e8 c2 fe ff ff       	call   364 <putc>
     4a2:	83 c4 10             	add    $0x10,%esp
    num = -num;
     4a5:	dd 45 e0             	fldl   -0x20(%ebp)
     4a8:	d9 e0                	fchs   
     4aa:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     4ad:	83 ec 08             	sub    $0x8,%esp
     4b0:	ff 75 e4             	pushl  -0x1c(%ebp)
     4b3:	ff 75 e0             	pushl  -0x20(%ebp)
     4b6:	e8 80 ff ff ff       	call   43b <getInteger>
     4bb:	83 c4 10             	add    $0x10,%esp
     4be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     4c1:	6a 01                	push   $0x1
     4c3:	6a 0a                	push   $0xa
     4c5:	ff 75 f0             	pushl  -0x10(%ebp)
     4c8:	ff 75 08             	pushl  0x8(%ebp)
     4cb:	e8 b7 fe ff ff       	call   387 <printint>
     4d0:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     4d3:	db 45 f0             	fildl  -0x10(%ebp)
     4d6:	dd 45 e0             	fldl   -0x20(%ebp)
     4d9:	de e1                	fsubp  %st,%st(1)
     4db:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     4de:	dd 45 e0             	fldl   -0x20(%ebp)
     4e1:	dd 05 70 36 00 00    	fldl   0x3670
     4e7:	d9 c9                	fxch   %st(1)
     4e9:	df e9                	fucomip %st(1),%st
     4eb:	dd d8                	fstp   %st(0)
     4ed:	76 10                	jbe    4ff <printdbl+0x89>
    putc(fd,'.');
     4ef:	83 ec 08             	sub    $0x8,%esp
     4f2:	6a 2e                	push   $0x2e
     4f4:	ff 75 08             	pushl  0x8(%ebp)
     4f7:	e8 68 fe ff ff       	call   364 <putc>
     4fc:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     4ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     506:	eb 49                	jmp    551 <printdbl+0xdb>
  {
    num = num*10;
     508:	dd 45 e0             	fldl   -0x20(%ebp)
     50b:	dd 05 78 36 00 00    	fldl   0x3678
     511:	de c9                	fmulp  %st,%st(1)
     513:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     516:	83 ec 08             	sub    $0x8,%esp
     519:	ff 75 e4             	pushl  -0x1c(%ebp)
     51c:	ff 75 e0             	pushl  -0x20(%ebp)
     51f:	e8 17 ff ff ff       	call   43b <getInteger>
     524:	83 c4 10             	add    $0x10,%esp
     527:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     52a:	6a 01                	push   $0x1
     52c:	6a 0a                	push   $0xa
     52e:	ff 75 f0             	pushl  -0x10(%ebp)
     531:	ff 75 08             	pushl  0x8(%ebp)
     534:	e8 4e fe ff ff       	call   387 <printint>
     539:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     53c:	db 45 f0             	fildl  -0x10(%ebp)
     53f:	dd 45 e0             	fldl   -0x20(%ebp)
     542:	de e1                	fsubp  %st,%st(1)
     544:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     547:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     54b:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     54f:	7f 13                	jg     564 <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     551:	dd 45 e0             	fldl   -0x20(%ebp)
     554:	dd 05 70 36 00 00    	fldl   0x3670
     55a:	d9 c9                	fxch   %st(1)
     55c:	df e9                	fucomip %st(1),%st
     55e:	dd d8                	fstp   %st(0)
     560:	77 a6                	ja     508 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     562:	eb 01                	jmp    565 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     564:	90                   	nop
    }
  }
}
     565:	90                   	nop
     566:	c9                   	leave  
     567:	c3                   	ret    

00000568 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     568:	55                   	push   %ebp
     569:	89 e5                	mov    %esp,%ebp
     56b:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     56e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     575:	8d 45 0c             	lea    0xc(%ebp),%eax
     578:	83 c0 04             	add    $0x4,%eax
     57b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     57e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     585:	e9 88 01 00 00       	jmp    712 <printf+0x1aa>
    c = fmt[i] & 0xff;
     58a:	8b 55 0c             	mov    0xc(%ebp),%edx
     58d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     590:	01 d0                	add    %edx,%eax
     592:	0f b6 00             	movzbl (%eax),%eax
     595:	0f be c0             	movsbl %al,%eax
     598:	25 ff 00 00 00       	and    $0xff,%eax
     59d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     5a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     5a4:	75 2c                	jne    5d2 <printf+0x6a>
      if(c == '%'){
     5a6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     5aa:	75 0c                	jne    5b8 <printf+0x50>
        state = '%';
     5ac:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     5b3:	e9 56 01 00 00       	jmp    70e <printf+0x1a6>
      } else {
        putc(fd, c);
     5b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     5bb:	0f be c0             	movsbl %al,%eax
     5be:	83 ec 08             	sub    $0x8,%esp
     5c1:	50                   	push   %eax
     5c2:	ff 75 08             	pushl  0x8(%ebp)
     5c5:	e8 9a fd ff ff       	call   364 <putc>
     5ca:	83 c4 10             	add    $0x10,%esp
     5cd:	e9 3c 01 00 00       	jmp    70e <printf+0x1a6>
      }
    } else if(state == '%'){
     5d2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     5d6:	0f 85 32 01 00 00    	jne    70e <printf+0x1a6>
      if(c == 'd'){
     5dc:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     5e0:	75 1e                	jne    600 <printf+0x98>
        printint(fd, *ap, 10, 1);
     5e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
     5e5:	8b 00                	mov    (%eax),%eax
     5e7:	6a 01                	push   $0x1
     5e9:	6a 0a                	push   $0xa
     5eb:	50                   	push   %eax
     5ec:	ff 75 08             	pushl  0x8(%ebp)
     5ef:	e8 93 fd ff ff       	call   387 <printint>
     5f4:	83 c4 10             	add    $0x10,%esp
        ap++;
     5f7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     5fb:	e9 07 01 00 00       	jmp    707 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     600:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     604:	74 06                	je     60c <printf+0xa4>
     606:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     60a:	75 1e                	jne    62a <printf+0xc2>
        printint(fd, *ap, 16, 0);
     60c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     60f:	8b 00                	mov    (%eax),%eax
     611:	6a 00                	push   $0x0
     613:	6a 10                	push   $0x10
     615:	50                   	push   %eax
     616:	ff 75 08             	pushl  0x8(%ebp)
     619:	e8 69 fd ff ff       	call   387 <printint>
     61e:	83 c4 10             	add    $0x10,%esp
        ap++;
     621:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     625:	e9 dd 00 00 00       	jmp    707 <printf+0x19f>
      } else if(c == 's'){
     62a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     62e:	75 46                	jne    676 <printf+0x10e>
        s = (char*)*ap;
     630:	8b 45 e8             	mov    -0x18(%ebp),%eax
     633:	8b 00                	mov    (%eax),%eax
     635:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     638:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     63c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     640:	75 25                	jne    667 <printf+0xff>
          s = "(null)";
     642:	c7 45 f4 68 36 00 00 	movl   $0x3668,-0xc(%ebp)
        while(*s != 0){
     649:	eb 1c                	jmp    667 <printf+0xff>
          putc(fd, *s);
     64b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     64e:	0f b6 00             	movzbl (%eax),%eax
     651:	0f be c0             	movsbl %al,%eax
     654:	83 ec 08             	sub    $0x8,%esp
     657:	50                   	push   %eax
     658:	ff 75 08             	pushl  0x8(%ebp)
     65b:	e8 04 fd ff ff       	call   364 <putc>
     660:	83 c4 10             	add    $0x10,%esp
          s++;
     663:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     667:	8b 45 f4             	mov    -0xc(%ebp),%eax
     66a:	0f b6 00             	movzbl (%eax),%eax
     66d:	84 c0                	test   %al,%al
     66f:	75 da                	jne    64b <printf+0xe3>
     671:	e9 91 00 00 00       	jmp    707 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     676:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     67a:	75 1d                	jne    699 <printf+0x131>
        putc(fd, *ap);
     67c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     67f:	8b 00                	mov    (%eax),%eax
     681:	0f be c0             	movsbl %al,%eax
     684:	83 ec 08             	sub    $0x8,%esp
     687:	50                   	push   %eax
     688:	ff 75 08             	pushl  0x8(%ebp)
     68b:	e8 d4 fc ff ff       	call   364 <putc>
     690:	83 c4 10             	add    $0x10,%esp
        ap++;
     693:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     697:	eb 6e                	jmp    707 <printf+0x19f>
      } else if(c == '%'){
     699:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     69d:	75 17                	jne    6b6 <printf+0x14e>
        putc(fd, c);
     69f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6a2:	0f be c0             	movsbl %al,%eax
     6a5:	83 ec 08             	sub    $0x8,%esp
     6a8:	50                   	push   %eax
     6a9:	ff 75 08             	pushl  0x8(%ebp)
     6ac:	e8 b3 fc ff ff       	call   364 <putc>
     6b1:	83 c4 10             	add    $0x10,%esp
     6b4:	eb 51                	jmp    707 <printf+0x19f>
      } else if(c == 'f'){ //for double
     6b6:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     6ba:	75 26                	jne    6e2 <printf+0x17a>
        double *dap = (double*)ap;
     6bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6bf:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     6c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
     6c5:	dd 00                	fldl   (%eax)
     6c7:	83 ec 04             	sub    $0x4,%esp
     6ca:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     6ce:	dd 1c 24             	fstpl  (%esp)
     6d1:	ff 75 08             	pushl  0x8(%ebp)
     6d4:	e8 9d fd ff ff       	call   476 <printdbl>
     6d9:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     6dc:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     6e0:	eb 25                	jmp    707 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     6e2:	83 ec 08             	sub    $0x8,%esp
     6e5:	6a 25                	push   $0x25
     6e7:	ff 75 08             	pushl  0x8(%ebp)
     6ea:	e8 75 fc ff ff       	call   364 <putc>
     6ef:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     6f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6f5:	0f be c0             	movsbl %al,%eax
     6f8:	83 ec 08             	sub    $0x8,%esp
     6fb:	50                   	push   %eax
     6fc:	ff 75 08             	pushl  0x8(%ebp)
     6ff:	e8 60 fc ff ff       	call   364 <putc>
     704:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     707:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     70e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     712:	8b 55 0c             	mov    0xc(%ebp),%edx
     715:	8b 45 f0             	mov    -0x10(%ebp),%eax
     718:	01 d0                	add    %edx,%eax
     71a:	0f b6 00             	movzbl (%eax),%eax
     71d:	84 c0                	test   %al,%al
     71f:	0f 85 65 fe ff ff    	jne    58a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     725:	90                   	nop
     726:	c9                   	leave  
     727:	c3                   	ret    

00000728 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     728:	55                   	push   %ebp
     729:	89 e5                	mov    %esp,%ebp
     72b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     72e:	8b 45 08             	mov    0x8(%ebp),%eax
     731:	83 e8 08             	sub    $0x8,%eax
     734:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     737:	a1 c8 43 00 00       	mov    0x43c8,%eax
     73c:	89 45 fc             	mov    %eax,-0x4(%ebp)
     73f:	eb 24                	jmp    765 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     741:	8b 45 fc             	mov    -0x4(%ebp),%eax
     744:	8b 00                	mov    (%eax),%eax
     746:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     749:	77 12                	ja     75d <free+0x35>
     74b:	8b 45 f8             	mov    -0x8(%ebp),%eax
     74e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     751:	77 24                	ja     777 <free+0x4f>
     753:	8b 45 fc             	mov    -0x4(%ebp),%eax
     756:	8b 00                	mov    (%eax),%eax
     758:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     75b:	77 1a                	ja     777 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     75d:	8b 45 fc             	mov    -0x4(%ebp),%eax
     760:	8b 00                	mov    (%eax),%eax
     762:	89 45 fc             	mov    %eax,-0x4(%ebp)
     765:	8b 45 f8             	mov    -0x8(%ebp),%eax
     768:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     76b:	76 d4                	jbe    741 <free+0x19>
     76d:	8b 45 fc             	mov    -0x4(%ebp),%eax
     770:	8b 00                	mov    (%eax),%eax
     772:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     775:	76 ca                	jbe    741 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     777:	8b 45 f8             	mov    -0x8(%ebp),%eax
     77a:	8b 40 04             	mov    0x4(%eax),%eax
     77d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     784:	8b 45 f8             	mov    -0x8(%ebp),%eax
     787:	01 c2                	add    %eax,%edx
     789:	8b 45 fc             	mov    -0x4(%ebp),%eax
     78c:	8b 00                	mov    (%eax),%eax
     78e:	39 c2                	cmp    %eax,%edx
     790:	75 24                	jne    7b6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     792:	8b 45 f8             	mov    -0x8(%ebp),%eax
     795:	8b 50 04             	mov    0x4(%eax),%edx
     798:	8b 45 fc             	mov    -0x4(%ebp),%eax
     79b:	8b 00                	mov    (%eax),%eax
     79d:	8b 40 04             	mov    0x4(%eax),%eax
     7a0:	01 c2                	add    %eax,%edx
     7a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7a5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     7a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7ab:	8b 00                	mov    (%eax),%eax
     7ad:	8b 10                	mov    (%eax),%edx
     7af:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7b2:	89 10                	mov    %edx,(%eax)
     7b4:	eb 0a                	jmp    7c0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     7b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7b9:	8b 10                	mov    (%eax),%edx
     7bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7be:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     7c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7c3:	8b 40 04             	mov    0x4(%eax),%eax
     7c6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     7cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7d0:	01 d0                	add    %edx,%eax
     7d2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     7d5:	75 20                	jne    7f7 <free+0xcf>
    p->s.size += bp->s.size;
     7d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7da:	8b 50 04             	mov    0x4(%eax),%edx
     7dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7e0:	8b 40 04             	mov    0x4(%eax),%eax
     7e3:	01 c2                	add    %eax,%edx
     7e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7e8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     7eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7ee:	8b 10                	mov    (%eax),%edx
     7f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7f3:	89 10                	mov    %edx,(%eax)
     7f5:	eb 08                	jmp    7ff <free+0xd7>
  } else
    p->s.ptr = bp;
     7f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7fa:	8b 55 f8             	mov    -0x8(%ebp),%edx
     7fd:	89 10                	mov    %edx,(%eax)
  freep = p;
     7ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
     802:	a3 c8 43 00 00       	mov    %eax,0x43c8
}
     807:	90                   	nop
     808:	c9                   	leave  
     809:	c3                   	ret    

0000080a <morecore>:

static Header*
morecore(uint nu)
{
     80a:	55                   	push   %ebp
     80b:	89 e5                	mov    %esp,%ebp
     80d:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     810:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     817:	77 07                	ja     820 <morecore+0x16>
    nu = 4096;
     819:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     820:	8b 45 08             	mov    0x8(%ebp),%eax
     823:	c1 e0 03             	shl    $0x3,%eax
     826:	83 ec 0c             	sub    $0xc,%esp
     829:	50                   	push   %eax
     82a:	e8 15 fb ff ff       	call   344 <sbrk>
     82f:	83 c4 10             	add    $0x10,%esp
     832:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     835:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     839:	75 07                	jne    842 <morecore+0x38>
    return 0;
     83b:	b8 00 00 00 00       	mov    $0x0,%eax
     840:	eb 26                	jmp    868 <morecore+0x5e>
  hp = (Header*)p;
     842:	8b 45 f4             	mov    -0xc(%ebp),%eax
     845:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     848:	8b 45 f0             	mov    -0x10(%ebp),%eax
     84b:	8b 55 08             	mov    0x8(%ebp),%edx
     84e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     851:	8b 45 f0             	mov    -0x10(%ebp),%eax
     854:	83 c0 08             	add    $0x8,%eax
     857:	83 ec 0c             	sub    $0xc,%esp
     85a:	50                   	push   %eax
     85b:	e8 c8 fe ff ff       	call   728 <free>
     860:	83 c4 10             	add    $0x10,%esp
  return freep;
     863:	a1 c8 43 00 00       	mov    0x43c8,%eax
}
     868:	c9                   	leave  
     869:	c3                   	ret    

0000086a <malloc>:

void*
malloc(uint nbytes)
{
     86a:	55                   	push   %ebp
     86b:	89 e5                	mov    %esp,%ebp
     86d:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     870:	8b 45 08             	mov    0x8(%ebp),%eax
     873:	83 c0 07             	add    $0x7,%eax
     876:	c1 e8 03             	shr    $0x3,%eax
     879:	83 c0 01             	add    $0x1,%eax
     87c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     87f:	a1 c8 43 00 00       	mov    0x43c8,%eax
     884:	89 45 f0             	mov    %eax,-0x10(%ebp)
     887:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     88b:	75 23                	jne    8b0 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     88d:	c7 45 f0 c0 43 00 00 	movl   $0x43c0,-0x10(%ebp)
     894:	8b 45 f0             	mov    -0x10(%ebp),%eax
     897:	a3 c8 43 00 00       	mov    %eax,0x43c8
     89c:	a1 c8 43 00 00       	mov    0x43c8,%eax
     8a1:	a3 c0 43 00 00       	mov    %eax,0x43c0
    base.s.size = 0;
     8a6:	c7 05 c4 43 00 00 00 	movl   $0x0,0x43c4
     8ad:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     8b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8b3:	8b 00                	mov    (%eax),%eax
     8b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     8b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8bb:	8b 40 04             	mov    0x4(%eax),%eax
     8be:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     8c1:	72 4d                	jb     910 <malloc+0xa6>
      if(p->s.size == nunits)
     8c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8c6:	8b 40 04             	mov    0x4(%eax),%eax
     8c9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     8cc:	75 0c                	jne    8da <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     8ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8d1:	8b 10                	mov    (%eax),%edx
     8d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8d6:	89 10                	mov    %edx,(%eax)
     8d8:	eb 26                	jmp    900 <malloc+0x96>
      else {
        p->s.size -= nunits;
     8da:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8dd:	8b 40 04             	mov    0x4(%eax),%eax
     8e0:	2b 45 ec             	sub    -0x14(%ebp),%eax
     8e3:	89 c2                	mov    %eax,%edx
     8e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8e8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     8eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8ee:	8b 40 04             	mov    0x4(%eax),%eax
     8f1:	c1 e0 03             	shl    $0x3,%eax
     8f4:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     8f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8fa:	8b 55 ec             	mov    -0x14(%ebp),%edx
     8fd:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     900:	8b 45 f0             	mov    -0x10(%ebp),%eax
     903:	a3 c8 43 00 00       	mov    %eax,0x43c8
      return (void*)(p + 1);
     908:	8b 45 f4             	mov    -0xc(%ebp),%eax
     90b:	83 c0 08             	add    $0x8,%eax
     90e:	eb 3b                	jmp    94b <malloc+0xe1>
    }
    if(p == freep)
     910:	a1 c8 43 00 00       	mov    0x43c8,%eax
     915:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     918:	75 1e                	jne    938 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     91a:	83 ec 0c             	sub    $0xc,%esp
     91d:	ff 75 ec             	pushl  -0x14(%ebp)
     920:	e8 e5 fe ff ff       	call   80a <morecore>
     925:	83 c4 10             	add    $0x10,%esp
     928:	89 45 f4             	mov    %eax,-0xc(%ebp)
     92b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     92f:	75 07                	jne    938 <malloc+0xce>
        return 0;
     931:	b8 00 00 00 00       	mov    $0x0,%eax
     936:	eb 13                	jmp    94b <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     938:	8b 45 f4             	mov    -0xc(%ebp),%eax
     93b:	89 45 f0             	mov    %eax,-0x10(%ebp)
     93e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     941:	8b 00                	mov    (%eax),%eax
     943:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     946:	e9 6d ff ff ff       	jmp    8b8 <malloc+0x4e>
}
     94b:	c9                   	leave  
     94c:	c3                   	ret    

0000094d <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     94d:	55                   	push   %ebp
     94e:	89 e5                	mov    %esp,%ebp
     950:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     953:	83 ec 04             	sub    $0x4,%esp
     956:	ff 75 08             	pushl  0x8(%ebp)
     959:	68 80 36 00 00       	push   $0x3680
     95e:	6a 02                	push   $0x2
     960:	e8 03 fc ff ff       	call   568 <printf>
     965:	83 c4 10             	add    $0x10,%esp
  exit();
     968:	e8 4f f9 ff ff       	call   2bc <exit>

0000096d <getInteger>:
}

static int getInteger(double num)
{
     96d:	55                   	push   %ebp
     96e:	89 e5                	mov    %esp,%ebp
     970:	83 ec 18             	sub    $0x18,%esp
     973:	8b 45 08             	mov    0x8(%ebp),%eax
     976:	89 45 e8             	mov    %eax,-0x18(%ebp)
     979:	8b 45 0c             	mov    0xc(%ebp),%eax
     97c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     97f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     986:	eb 0e                	jmp    996 <getInteger+0x29>
  {
    num -= 1;
     988:	dd 45 e8             	fldl   -0x18(%ebp)
     98b:	d9 e8                	fld1   
     98d:	de e9                	fsubrp %st,%st(1)
     98f:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     992:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     996:	dd 45 e8             	fldl   -0x18(%ebp)
     999:	d9 e8                	fld1   
     99b:	d9 c9                	fxch   %st(1)
     99d:	df e9                	fucomip %st(1),%st
     99f:	dd d8                	fstp   %st(0)
     9a1:	77 e5                	ja     988 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     9a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     9a6:	c9                   	leave  
     9a7:	c3                   	ret    

000009a8 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     9a8:	55                   	push   %ebp
     9a9:	89 e5                	mov    %esp,%ebp
     9ab:	53                   	push   %ebx
     9ac:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     9af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     9b6:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     9ba:	74 17                	je     9d3 <int2str+0x2b>
     9bc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     9c0:	79 11                	jns    9d3 <int2str+0x2b>
    neg = 1;
     9c2:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     9c9:	8b 45 0c             	mov    0xc(%ebp),%eax
     9cc:	f7 d8                	neg    %eax
     9ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
     9d1:	eb 06                	jmp    9d9 <int2str+0x31>
  } else {
    x = num;
     9d3:	8b 45 0c             	mov    0xc(%ebp),%eax
     9d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     9d9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     9e0:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     9e3:	8d 41 01             	lea    0x1(%ecx),%eax
     9e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
     9e9:	8b 5d 14             	mov    0x14(%ebp),%ebx
     9ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9ef:	ba 00 00 00 00       	mov    $0x0,%edx
     9f4:	f7 f3                	div    %ebx
     9f6:	89 d0                	mov    %edx,%eax
     9f8:	0f b6 80 94 42 00 00 	movzbl 0x4294(%eax),%eax
     9ff:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     a03:	8b 5d 14             	mov    0x14(%ebp),%ebx
     a06:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a09:	ba 00 00 00 00       	mov    $0x0,%edx
     a0e:	f7 f3                	div    %ebx
     a10:	89 45 f0             	mov    %eax,-0x10(%ebp)
     a13:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a17:	75 c7                	jne    9e0 <int2str+0x38>
  if(neg)
     a19:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     a1d:	74 36                	je     a55 <int2str+0xad>
    buf[i++] = '-';
     a1f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a22:	8d 50 01             	lea    0x1(%eax),%edx
     a25:	89 55 f8             	mov    %edx,-0x8(%ebp)
     a28:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     a2d:	eb 26                	jmp    a55 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     a2f:	8b 45 10             	mov    0x10(%ebp),%eax
     a32:	8b 00                	mov    (%eax),%eax
     a34:	89 c2                	mov    %eax,%edx
     a36:	8b 45 08             	mov    0x8(%ebp),%eax
     a39:	01 c2                	add    %eax,%edx
     a3b:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     a3e:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a41:	01 c8                	add    %ecx,%eax
     a43:	0f b6 00             	movzbl (%eax),%eax
     a46:	88 02                	mov    %al,(%edx)
    (*pos)++;
     a48:	8b 45 10             	mov    0x10(%ebp),%eax
     a4b:	8b 00                	mov    (%eax),%eax
     a4d:	8d 50 01             	lea    0x1(%eax),%edx
     a50:	8b 45 10             	mov    0x10(%ebp),%eax
     a53:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     a55:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     a59:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     a5d:	79 d0                	jns    a2f <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     a5f:	90                   	nop
     a60:	83 c4 20             	add    $0x20,%esp
     a63:	5b                   	pop    %ebx
     a64:	5d                   	pop    %ebp
     a65:	c3                   	ret    

00000a66 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     a66:	55                   	push   %ebp
     a67:	89 e5                	mov    %esp,%ebp
     a69:	83 ec 18             	sub    $0x18,%esp
     a6c:	8b 45 0c             	mov    0xc(%ebp),%eax
     a6f:	89 45 e8             	mov    %eax,-0x18(%ebp)
     a72:	8b 45 10             	mov    0x10(%ebp),%eax
     a75:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     a78:	d9 ee                	fldz   
     a7a:	dd 45 e8             	fldl   -0x18(%ebp)
     a7d:	d9 c9                	fxch   %st(1)
     a7f:	df e9                	fucomip %st(1),%st
     a81:	dd d8                	fstp   %st(0)
     a83:	76 24                	jbe    aa9 <double2str+0x43>
  {
    buf[*pos] = '-';
     a85:	8b 45 14             	mov    0x14(%ebp),%eax
     a88:	8b 00                	mov    (%eax),%eax
     a8a:	89 c2                	mov    %eax,%edx
     a8c:	8b 45 08             	mov    0x8(%ebp),%eax
     a8f:	01 d0                	add    %edx,%eax
     a91:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     a94:	8b 45 14             	mov    0x14(%ebp),%eax
     a97:	8b 00                	mov    (%eax),%eax
     a99:	8d 50 01             	lea    0x1(%eax),%edx
     a9c:	8b 45 14             	mov    0x14(%ebp),%eax
     a9f:	89 10                	mov    %edx,(%eax)
    num = -num;
     aa1:	dd 45 e8             	fldl   -0x18(%ebp)
     aa4:	d9 e0                	fchs   
     aa6:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     aa9:	ff 75 ec             	pushl  -0x14(%ebp)
     aac:	ff 75 e8             	pushl  -0x18(%ebp)
     aaf:	e8 b9 fe ff ff       	call   96d <getInteger>
     ab4:	83 c4 08             	add    $0x8,%esp
     ab7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     aba:	83 ec 04             	sub    $0x4,%esp
     abd:	6a 01                	push   $0x1
     abf:	6a 0a                	push   $0xa
     ac1:	ff 75 14             	pushl  0x14(%ebp)
     ac4:	ff 75 f8             	pushl  -0x8(%ebp)
     ac7:	ff 75 08             	pushl  0x8(%ebp)
     aca:	e8 d9 fe ff ff       	call   9a8 <int2str>
     acf:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     ad2:	db 45 f8             	fildl  -0x8(%ebp)
     ad5:	dd 45 e8             	fldl   -0x18(%ebp)
     ad8:	de e1                	fsubp  %st,%st(1)
     ada:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     add:	dd 45 e8             	fldl   -0x18(%ebp)
     ae0:	dd 05 88 36 00 00    	fldl   0x3688
     ae6:	d9 c9                	fxch   %st(1)
     ae8:	df e9                	fucomip %st(1),%st
     aea:	dd d8                	fstp   %st(0)
     aec:	76 1c                	jbe    b0a <double2str+0xa4>
  {
    buf[*pos] = '.';
     aee:	8b 45 14             	mov    0x14(%ebp),%eax
     af1:	8b 00                	mov    (%eax),%eax
     af3:	89 c2                	mov    %eax,%edx
     af5:	8b 45 08             	mov    0x8(%ebp),%eax
     af8:	01 d0                	add    %edx,%eax
     afa:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     afd:	8b 45 14             	mov    0x14(%ebp),%eax
     b00:	8b 00                	mov    (%eax),%eax
     b02:	8d 50 01             	lea    0x1(%eax),%edx
     b05:	8b 45 14             	mov    0x14(%ebp),%eax
     b08:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     b0a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     b11:	eb 4c                	jmp    b5f <double2str+0xf9>
  {
    num = num*10;
     b13:	dd 45 e8             	fldl   -0x18(%ebp)
     b16:	dd 05 90 36 00 00    	fldl   0x3690
     b1c:	de c9                	fmulp  %st,%st(1)
     b1e:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     b21:	ff 75 ec             	pushl  -0x14(%ebp)
     b24:	ff 75 e8             	pushl  -0x18(%ebp)
     b27:	e8 41 fe ff ff       	call   96d <getInteger>
     b2c:	83 c4 08             	add    $0x8,%esp
     b2f:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     b32:	83 ec 04             	sub    $0x4,%esp
     b35:	6a 01                	push   $0x1
     b37:	6a 0a                	push   $0xa
     b39:	ff 75 14             	pushl  0x14(%ebp)
     b3c:	ff 75 f8             	pushl  -0x8(%ebp)
     b3f:	ff 75 08             	pushl  0x8(%ebp)
     b42:	e8 61 fe ff ff       	call   9a8 <int2str>
     b47:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     b4a:	db 45 f8             	fildl  -0x8(%ebp)
     b4d:	dd 45 e8             	fldl   -0x18(%ebp)
     b50:	de e1                	fsubp  %st,%st(1)
     b52:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     b55:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     b59:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     b5d:	7f 13                	jg     b72 <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     b5f:	dd 45 e8             	fldl   -0x18(%ebp)
     b62:	dd 05 88 36 00 00    	fldl   0x3688
     b68:	d9 c9                	fxch   %st(1)
     b6a:	df e9                	fucomip %st(1),%st
     b6c:	dd d8                	fstp   %st(0)
     b6e:	77 a3                	ja     b13 <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     b70:	eb 01                	jmp    b73 <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     b72:	90                   	nop
    }
  }
}
     b73:	90                   	nop
     b74:	c9                   	leave  
     b75:	c3                   	ret    

00000b76 <pow>:

double pow(double opnd, int power)
{
     b76:	55                   	push   %ebp
     b77:	89 e5                	mov    %esp,%ebp
     b79:	83 ec 18             	sub    $0x18,%esp
     b7c:	8b 45 08             	mov    0x8(%ebp),%eax
     b7f:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b82:	8b 45 0c             	mov    0xc(%ebp),%eax
     b85:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     b88:	d9 e8                	fld1   
     b8a:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     b8d:	eb 0d                	jmp    b9c <pow+0x26>
  {
    result *= opnd;
     b8f:	dd 45 f8             	fldl   -0x8(%ebp)
     b92:	dc 4d e8             	fmull  -0x18(%ebp)
     b95:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     b98:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     b9c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     ba0:	7f ed                	jg     b8f <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     ba2:	dd 45 f8             	fldl   -0x8(%ebp)
}
     ba5:	c9                   	leave  
     ba6:	c3                   	ret    

00000ba7 <Translation>:

double Translation(char *s, int* pos)
{
     ba7:	55                   	push   %ebp
     ba8:	89 e5                	mov    %esp,%ebp
     baa:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     bad:	d9 ee                	fldz   
     baf:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     bb2:	d9 ee                	fldz   
     bb4:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     bb7:	eb 3e                	jmp    bf7 <Translation+0x50>
    {
        integer *= 10;
     bb9:	dd 45 f8             	fldl   -0x8(%ebp)
     bbc:	dd 05 90 36 00 00    	fldl   0x3690
     bc2:	de c9                	fmulp  %st,%st(1)
     bc4:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     bc7:	8b 45 0c             	mov    0xc(%ebp),%eax
     bca:	8b 00                	mov    (%eax),%eax
     bcc:	89 c2                	mov    %eax,%edx
     bce:	8b 45 08             	mov    0x8(%ebp),%eax
     bd1:	01 d0                	add    %edx,%eax
     bd3:	0f b6 00             	movzbl (%eax),%eax
     bd6:	0f be c0             	movsbl %al,%eax
     bd9:	83 e8 30             	sub    $0x30,%eax
     bdc:	89 45 dc             	mov    %eax,-0x24(%ebp)
     bdf:	db 45 dc             	fildl  -0x24(%ebp)
     be2:	dd 45 f8             	fldl   -0x8(%ebp)
     be5:	de c1                	faddp  %st,%st(1)
     be7:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     bea:	8b 45 0c             	mov    0xc(%ebp),%eax
     bed:	8b 00                	mov    (%eax),%eax
     bef:	8d 50 01             	lea    0x1(%eax),%edx
     bf2:	8b 45 0c             	mov    0xc(%ebp),%eax
     bf5:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     bf7:	8b 45 0c             	mov    0xc(%ebp),%eax
     bfa:	8b 00                	mov    (%eax),%eax
     bfc:	89 c2                	mov    %eax,%edx
     bfe:	8b 45 08             	mov    0x8(%ebp),%eax
     c01:	01 d0                	add    %edx,%eax
     c03:	0f b6 00             	movzbl (%eax),%eax
     c06:	3c 2f                	cmp    $0x2f,%al
     c08:	7e 13                	jle    c1d <Translation+0x76>
     c0a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c0d:	8b 00                	mov    (%eax),%eax
     c0f:	89 c2                	mov    %eax,%edx
     c11:	8b 45 08             	mov    0x8(%ebp),%eax
     c14:	01 d0                	add    %edx,%eax
     c16:	0f b6 00             	movzbl (%eax),%eax
     c19:	3c 39                	cmp    $0x39,%al
     c1b:	7e 9c                	jle    bb9 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
     c20:	8b 00                	mov    (%eax),%eax
     c22:	89 c2                	mov    %eax,%edx
     c24:	8b 45 08             	mov    0x8(%ebp),%eax
     c27:	01 d0                	add    %edx,%eax
     c29:	0f b6 00             	movzbl (%eax),%eax
     c2c:	3c 2e                	cmp    $0x2e,%al
     c2e:	0f 85 9b 00 00 00    	jne    ccf <Translation+0x128>
    {
        (*pos)++;
     c34:	8b 45 0c             	mov    0xc(%ebp),%eax
     c37:	8b 00                	mov    (%eax),%eax
     c39:	8d 50 01             	lea    0x1(%eax),%edx
     c3c:	8b 45 0c             	mov    0xc(%ebp),%eax
     c3f:	89 10                	mov    %edx,(%eax)
        int c = 1;
     c41:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c48:	eb 5b                	jmp    ca5 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     c4a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c4d:	8b 00                	mov    (%eax),%eax
     c4f:	89 c2                	mov    %eax,%edx
     c51:	8b 45 08             	mov    0x8(%ebp),%eax
     c54:	01 d0                	add    %edx,%eax
     c56:	0f b6 00             	movzbl (%eax),%eax
     c59:	0f be c0             	movsbl %al,%eax
     c5c:	83 e8 30             	sub    $0x30,%eax
     c5f:	89 45 dc             	mov    %eax,-0x24(%ebp)
     c62:	db 45 dc             	fildl  -0x24(%ebp)
     c65:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     c68:	83 ec 04             	sub    $0x4,%esp
     c6b:	ff 75 ec             	pushl  -0x14(%ebp)
     c6e:	dd 05 98 36 00 00    	fldl   0x3698
     c74:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     c78:	dd 1c 24             	fstpl  (%esp)
     c7b:	e8 f6 fe ff ff       	call   b76 <pow>
     c80:	83 c4 10             	add    $0x10,%esp
     c83:	dd 45 e0             	fldl   -0x20(%ebp)
     c86:	de c9                	fmulp  %st,%st(1)
     c88:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     c8b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     c8f:	dd 45 f0             	fldl   -0x10(%ebp)
     c92:	dc 45 e0             	faddl  -0x20(%ebp)
     c95:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     c98:	8b 45 0c             	mov    0xc(%ebp),%eax
     c9b:	8b 00                	mov    (%eax),%eax
     c9d:	8d 50 01             	lea    0x1(%eax),%edx
     ca0:	8b 45 0c             	mov    0xc(%ebp),%eax
     ca3:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     ca5:	8b 45 0c             	mov    0xc(%ebp),%eax
     ca8:	8b 00                	mov    (%eax),%eax
     caa:	89 c2                	mov    %eax,%edx
     cac:	8b 45 08             	mov    0x8(%ebp),%eax
     caf:	01 d0                	add    %edx,%eax
     cb1:	0f b6 00             	movzbl (%eax),%eax
     cb4:	3c 2f                	cmp    $0x2f,%al
     cb6:	7e 17                	jle    ccf <Translation+0x128>
     cb8:	8b 45 0c             	mov    0xc(%ebp),%eax
     cbb:	8b 00                	mov    (%eax),%eax
     cbd:	89 c2                	mov    %eax,%edx
     cbf:	8b 45 08             	mov    0x8(%ebp),%eax
     cc2:	01 d0                	add    %edx,%eax
     cc4:	0f b6 00             	movzbl (%eax),%eax
     cc7:	3c 39                	cmp    $0x39,%al
     cc9:	0f 8e 7b ff ff ff    	jle    c4a <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     ccf:	dd 45 f8             	fldl   -0x8(%ebp)
     cd2:	dc 45 f0             	faddl  -0x10(%ebp)
     cd5:	c9                   	leave  
     cd6:	c3                   	ret    

00000cd7 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     cd7:	55                   	push   %ebp
     cd8:	89 e5                	mov    %esp,%ebp
     cda:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     cdd:	e8 d2 f5 ff ff       	call   2b4 <fork>
     ce2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     ce5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ce8:	c9                   	leave  
     ce9:	c3                   	ret    

00000cea <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     cea:	55                   	push   %ebp
     ceb:	89 e5                	mov    %esp,%ebp
     ced:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     cf0:	83 ec 0c             	sub    $0xc,%esp
     cf3:	6a 54                	push   $0x54
     cf5:	e8 70 fb ff ff       	call   86a <malloc>
     cfa:	83 c4 10             	add    $0x10,%esp
     cfd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     d00:	83 ec 04             	sub    $0x4,%esp
     d03:	6a 54                	push   $0x54
     d05:	6a 00                	push   $0x0
     d07:	ff 75 f4             	pushl  -0xc(%ebp)
     d0a:	e8 12 f4 ff ff       	call   121 <memset>
     d0f:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     d12:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d15:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     d1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d1e:	c9                   	leave  
     d1f:	c3                   	ret    

00000d20 <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     d20:	55                   	push   %ebp
     d21:	89 e5                	mov    %esp,%ebp
     d23:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d26:	83 ec 0c             	sub    $0xc,%esp
     d29:	6a 18                	push   $0x18
     d2b:	e8 3a fb ff ff       	call   86a <malloc>
     d30:	83 c4 10             	add    $0x10,%esp
     d33:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     d36:	83 ec 04             	sub    $0x4,%esp
     d39:	6a 18                	push   $0x18
     d3b:	6a 00                	push   $0x0
     d3d:	ff 75 f4             	pushl  -0xc(%ebp)
     d40:	e8 dc f3 ff ff       	call   121 <memset>
     d45:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     d48:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d4b:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     d51:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d54:	8b 55 08             	mov    0x8(%ebp),%edx
     d57:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     d5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d5d:	8b 55 0c             	mov    0xc(%ebp),%edx
     d60:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     d63:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d66:	8b 55 10             	mov    0x10(%ebp),%edx
     d69:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     d6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d6f:	8b 55 14             	mov    0x14(%ebp),%edx
     d72:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     d75:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d78:	8b 55 18             	mov    0x18(%ebp),%edx
     d7b:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     d7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d81:	c9                   	leave  
     d82:	c3                   	ret    

00000d83 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     d83:	55                   	push   %ebp
     d84:	89 e5                	mov    %esp,%ebp
     d86:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d89:	83 ec 0c             	sub    $0xc,%esp
     d8c:	6a 0c                	push   $0xc
     d8e:	e8 d7 fa ff ff       	call   86a <malloc>
     d93:	83 c4 10             	add    $0x10,%esp
     d96:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     d99:	83 ec 04             	sub    $0x4,%esp
     d9c:	6a 0c                	push   $0xc
     d9e:	6a 00                	push   $0x0
     da0:	ff 75 f4             	pushl  -0xc(%ebp)
     da3:	e8 79 f3 ff ff       	call   121 <memset>
     da8:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     dab:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dae:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     db4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     db7:	8b 55 08             	mov    0x8(%ebp),%edx
     dba:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     dbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dc0:	8b 55 0c             	mov    0xc(%ebp),%edx
     dc3:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     dc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     dc9:	c9                   	leave  
     dca:	c3                   	ret    

00000dcb <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     dcb:	55                   	push   %ebp
     dcc:	89 e5                	mov    %esp,%ebp
     dce:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     dd1:	83 ec 0c             	sub    $0xc,%esp
     dd4:	6a 0c                	push   $0xc
     dd6:	e8 8f fa ff ff       	call   86a <malloc>
     ddb:	83 c4 10             	add    $0x10,%esp
     dde:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     de1:	83 ec 04             	sub    $0x4,%esp
     de4:	6a 0c                	push   $0xc
     de6:	6a 00                	push   $0x0
     de8:	ff 75 f4             	pushl  -0xc(%ebp)
     deb:	e8 31 f3 ff ff       	call   121 <memset>
     df0:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     df3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     df6:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dff:	8b 55 08             	mov    0x8(%ebp),%edx
     e02:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     e05:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e08:	8b 55 0c             	mov    0xc(%ebp),%edx
     e0b:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     e0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e11:	c9                   	leave  
     e12:	c3                   	ret    

00000e13 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     e13:	55                   	push   %ebp
     e14:	89 e5                	mov    %esp,%ebp
     e16:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e19:	83 ec 0c             	sub    $0xc,%esp
     e1c:	6a 08                	push   $0x8
     e1e:	e8 47 fa ff ff       	call   86a <malloc>
     e23:	83 c4 10             	add    $0x10,%esp
     e26:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e29:	83 ec 04             	sub    $0x4,%esp
     e2c:	6a 08                	push   $0x8
     e2e:	6a 00                	push   $0x0
     e30:	ff 75 f4             	pushl  -0xc(%ebp)
     e33:	e8 e9 f2 ff ff       	call   121 <memset>
     e38:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
     e3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e3e:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     e44:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e47:	8b 55 08             	mov    0x8(%ebp),%edx
     e4a:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     e4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e50:	c9                   	leave  
     e51:	c3                   	ret    

00000e52 <calcmd>:

struct cmd* calcmd(char *_line)
{
     e52:	55                   	push   %ebp
     e53:	89 e5                	mov    %esp,%ebp
     e55:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e58:	83 ec 0c             	sub    $0xc,%esp
     e5b:	6a 08                	push   $0x8
     e5d:	e8 08 fa ff ff       	call   86a <malloc>
     e62:	83 c4 10             	add    $0x10,%esp
     e65:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e68:	83 ec 04             	sub    $0x4,%esp
     e6b:	6a 08                	push   $0x8
     e6d:	6a 00                	push   $0x0
     e6f:	ff 75 f4             	pushl  -0xc(%ebp)
     e72:	e8 aa f2 ff ff       	call   121 <memset>
     e77:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
     e7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e7d:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
     e83:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e86:	8b 55 08             	mov    0x8(%ebp),%edx
     e89:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     e8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e8f:	c9                   	leave  
     e90:	c3                   	ret    

00000e91 <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
     e91:	55                   	push   %ebp
     e92:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
     e94:	eb 0c                	jmp    ea2 <mystrncmp+0x11>
    n--, p++, q++;
     e96:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     e9a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     e9e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
     ea2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     ea6:	74 1a                	je     ec2 <mystrncmp+0x31>
     ea8:	8b 45 08             	mov    0x8(%ebp),%eax
     eab:	0f b6 00             	movzbl (%eax),%eax
     eae:	84 c0                	test   %al,%al
     eb0:	74 10                	je     ec2 <mystrncmp+0x31>
     eb2:	8b 45 08             	mov    0x8(%ebp),%eax
     eb5:	0f b6 10             	movzbl (%eax),%edx
     eb8:	8b 45 0c             	mov    0xc(%ebp),%eax
     ebb:	0f b6 00             	movzbl (%eax),%eax
     ebe:	38 c2                	cmp    %al,%dl
     ec0:	74 d4                	je     e96 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
     ec2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     ec6:	75 07                	jne    ecf <mystrncmp+0x3e>
    return 0;
     ec8:	b8 00 00 00 00       	mov    $0x0,%eax
     ecd:	eb 16                	jmp    ee5 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
     ecf:	8b 45 08             	mov    0x8(%ebp),%eax
     ed2:	0f b6 00             	movzbl (%eax),%eax
     ed5:	0f b6 d0             	movzbl %al,%edx
     ed8:	8b 45 0c             	mov    0xc(%ebp),%eax
     edb:	0f b6 00             	movzbl (%eax),%eax
     ede:	0f b6 c0             	movzbl %al,%eax
     ee1:	29 c2                	sub    %eax,%edx
     ee3:	89 d0                	mov    %edx,%eax
}
     ee5:	5d                   	pop    %ebp
     ee6:	c3                   	ret    

00000ee7 <mystrlen>:

static int mystrlen(const char *s)
{
     ee7:	55                   	push   %ebp
     ee8:	89 e5                	mov    %esp,%ebp
     eea:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
     eed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     ef4:	eb 04                	jmp    efa <mystrlen+0x13>
     ef6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     efa:	8b 55 fc             	mov    -0x4(%ebp),%edx
     efd:	8b 45 08             	mov    0x8(%ebp),%eax
     f00:	01 d0                	add    %edx,%eax
     f02:	0f b6 00             	movzbl (%eax),%eax
     f05:	84 c0                	test   %al,%al
     f07:	75 ed                	jne    ef6 <mystrlen+0xf>
    ;
  return n;
     f09:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f0c:	c9                   	leave  
     f0d:	c3                   	ret    

00000f0e <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
     f0e:	55                   	push   %ebp
     f0f:	89 e5                	mov    %esp,%ebp
     f11:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
     f14:	8b 45 08             	mov    0x8(%ebp),%eax
     f17:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
     f1a:	90                   	nop
     f1b:	8b 45 10             	mov    0x10(%ebp),%eax
     f1e:	8d 50 ff             	lea    -0x1(%eax),%edx
     f21:	89 55 10             	mov    %edx,0x10(%ebp)
     f24:	85 c0                	test   %eax,%eax
     f26:	7e 2c                	jle    f54 <mystrncpy+0x46>
     f28:	8b 45 08             	mov    0x8(%ebp),%eax
     f2b:	8d 50 01             	lea    0x1(%eax),%edx
     f2e:	89 55 08             	mov    %edx,0x8(%ebp)
     f31:	8b 55 0c             	mov    0xc(%ebp),%edx
     f34:	8d 4a 01             	lea    0x1(%edx),%ecx
     f37:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     f3a:	0f b6 12             	movzbl (%edx),%edx
     f3d:	88 10                	mov    %dl,(%eax)
     f3f:	0f b6 00             	movzbl (%eax),%eax
     f42:	84 c0                	test   %al,%al
     f44:	75 d5                	jne    f1b <mystrncpy+0xd>
    ;
  while(n-- > 0)
     f46:	eb 0c                	jmp    f54 <mystrncpy+0x46>
    *s++ = 0;
     f48:	8b 45 08             	mov    0x8(%ebp),%eax
     f4b:	8d 50 01             	lea    0x1(%eax),%edx
     f4e:	89 55 08             	mov    %edx,0x8(%ebp)
     f51:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
     f54:	8b 45 10             	mov    0x10(%ebp),%eax
     f57:	8d 50 ff             	lea    -0x1(%eax),%edx
     f5a:	89 55 10             	mov    %edx,0x10(%ebp)
     f5d:	85 c0                	test   %eax,%eax
     f5f:	7f e7                	jg     f48 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
     f61:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f64:	c9                   	leave  
     f65:	c3                   	ret    

00000f66 <isEqual>:

int isEqual(double a, double b)
{
     f66:	55                   	push   %ebp
     f67:	89 e5                	mov    %esp,%ebp
     f69:	83 ec 10             	sub    $0x10,%esp
     f6c:	8b 45 08             	mov    0x8(%ebp),%eax
     f6f:	89 45 f8             	mov    %eax,-0x8(%ebp)
     f72:	8b 45 0c             	mov    0xc(%ebp),%eax
     f75:	89 45 fc             	mov    %eax,-0x4(%ebp)
     f78:	8b 45 10             	mov    0x10(%ebp),%eax
     f7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
     f7e:	8b 45 14             	mov    0x14(%ebp),%eax
     f81:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
     f84:	dd 45 f8             	fldl   -0x8(%ebp)
     f87:	dc 65 f0             	fsubl  -0x10(%ebp)
     f8a:	dd 05 68 38 00 00    	fldl   0x3868
     f90:	df e9                	fucomip %st(1),%st
     f92:	dd d8                	fstp   %st(0)
     f94:	76 19                	jbe    faf <isEqual+0x49>
     f96:	dd 45 f0             	fldl   -0x10(%ebp)
     f99:	dc 65 f8             	fsubl  -0x8(%ebp)
     f9c:	dd 05 68 38 00 00    	fldl   0x3868
     fa2:	df e9                	fucomip %st(1),%st
     fa4:	dd d8                	fstp   %st(0)
     fa6:	76 07                	jbe    faf <isEqual+0x49>
    return 1;
     fa8:	b8 01 00 00 00       	mov    $0x1,%eax
     fad:	eb 05                	jmp    fb4 <isEqual+0x4e>
  return 0;
     faf:	b8 00 00 00 00       	mov    $0x0,%eax
}
     fb4:	c9                   	leave  
     fb5:	c3                   	ret    

00000fb6 <isCmdName>:

int isCmdName(const char* str)
{
     fb6:	55                   	push   %ebp
     fb7:	89 e5                	mov    %esp,%ebp
     fb9:	53                   	push   %ebx
     fba:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
     fbd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     fc4:	eb 71                	jmp    1037 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
     fc6:	8b 55 f4             	mov    -0xc(%ebp),%edx
     fc9:	89 d0                	mov    %edx,%eax
     fcb:	c1 e0 02             	shl    $0x2,%eax
     fce:	01 d0                	add    %edx,%eax
     fd0:	01 c0                	add    %eax,%eax
     fd2:	05 c0 42 00 00       	add    $0x42c0,%eax
     fd7:	83 ec 0c             	sub    $0xc,%esp
     fda:	50                   	push   %eax
     fdb:	e8 1a f1 ff ff       	call   fa <strlen>
     fe0:	83 c4 10             	add    $0x10,%esp
     fe3:	89 c3                	mov    %eax,%ebx
     fe5:	83 ec 0c             	sub    $0xc,%esp
     fe8:	ff 75 08             	pushl  0x8(%ebp)
     feb:	e8 f7 fe ff ff       	call   ee7 <mystrlen>
     ff0:	83 c4 10             	add    $0x10,%esp
     ff3:	39 c3                	cmp    %eax,%ebx
     ff5:	75 3c                	jne    1033 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
     ff7:	83 ec 0c             	sub    $0xc,%esp
     ffa:	ff 75 08             	pushl  0x8(%ebp)
     ffd:	e8 e5 fe ff ff       	call   ee7 <mystrlen>
    1002:	83 c4 10             	add    $0x10,%esp
    1005:	89 c1                	mov    %eax,%ecx
    1007:	8b 55 f4             	mov    -0xc(%ebp),%edx
    100a:	89 d0                	mov    %edx,%eax
    100c:	c1 e0 02             	shl    $0x2,%eax
    100f:	01 d0                	add    %edx,%eax
    1011:	01 c0                	add    %eax,%eax
    1013:	05 c0 42 00 00       	add    $0x42c0,%eax
    1018:	83 ec 04             	sub    $0x4,%esp
    101b:	51                   	push   %ecx
    101c:	ff 75 08             	pushl  0x8(%ebp)
    101f:	50                   	push   %eax
    1020:	e8 6c fe ff ff       	call   e91 <mystrncmp>
    1025:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1028:	85 c0                	test   %eax,%eax
    102a:	75 07                	jne    1033 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    102c:	b8 01 00 00 00       	mov    $0x1,%eax
    1031:	eb 0f                	jmp    1042 <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    1033:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1037:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    103b:	7e 89                	jle    fc6 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    103d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1042:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1045:	c9                   	leave  
    1046:	c3                   	ret    

00001047 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    1047:	55                   	push   %ebp
    1048:	89 e5                	mov    %esp,%ebp
    104a:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    1050:	83 ec 08             	sub    $0x8,%esp
    1053:	6a 00                	push   $0x0
    1055:	68 88 43 00 00       	push   $0x4388
    105a:	e8 9d f2 ff ff       	call   2fc <open>
    105f:	83 c4 10             	add    $0x10,%esp
    1062:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1065:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1069:	79 0a                	jns    1075 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    106b:	b8 00 00 00 00       	mov    $0x0,%eax
    1070:	e9 9a 01 00 00       	jmp    120f <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    1075:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    107c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1083:	e9 ee 00 00 00       	jmp    1176 <findAlias+0x12f>
  {
      int isSame = 1;
    1088:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    108f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    1096:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    109d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    10a4:	83 ec 0c             	sub    $0xc,%esp
    10a7:	8d 45 9a             	lea    -0x66(%ebp),%eax
    10aa:	50                   	push   %eax
    10ab:	e8 4a f0 ff ff       	call   fa <strlen>
    10b0:	83 c4 10             	add    $0x10,%esp
    10b3:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    10b6:	83 ec 0c             	sub    $0xc,%esp
    10b9:	ff 75 08             	pushl  0x8(%ebp)
    10bc:	e8 39 f0 ff ff       	call   fa <strlen>
    10c1:	83 c4 10             	add    $0x10,%esp
    10c4:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    10c7:	8d 55 9a             	lea    -0x66(%ebp),%edx
    10ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10cd:	01 d0                	add    %edx,%eax
    10cf:	0f b6 00             	movzbl (%eax),%eax
    10d2:	3c 21                	cmp    $0x21,%al
    10d4:	75 38                	jne    110e <findAlias+0xc7>
      {
          startIndex++;
    10d6:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    10da:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    10e1:	eb 2b                	jmp    110e <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    10e3:	8d 55 9a             	lea    -0x66(%ebp),%edx
    10e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10e9:	01 d0                	add    %edx,%eax
    10eb:	0f b6 10             	movzbl (%eax),%edx
    10ee:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    10f1:	8b 45 08             	mov    0x8(%ebp),%eax
    10f4:	01 c8                	add    %ecx,%eax
    10f6:	0f b6 00             	movzbl (%eax),%eax
    10f9:	38 c2                	cmp    %al,%dl
    10fb:	74 09                	je     1106 <findAlias+0xbf>
          {
              isSame = 0;
    10fd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    1104:	eb 1f                	jmp    1125 <findAlias+0xde>
          }
          startIndex++;
    1106:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    110a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    110e:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1111:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1114:	01 d0                	add    %edx,%eax
    1116:	0f b6 00             	movzbl (%eax),%eax
    1119:	3c 3d                	cmp    $0x3d,%al
    111b:	74 08                	je     1125 <findAlias+0xde>
    111d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1120:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1123:	7c be                	jl     10e3 <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    1125:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1128:	8b 45 e8             	mov    -0x18(%ebp),%eax
    112b:	01 d0                	add    %edx,%eax
    112d:	0f b6 00             	movzbl (%eax),%eax
    1130:	3c 3d                	cmp    $0x3d,%al
    1132:	75 08                	jne    113c <findAlias+0xf5>
    1134:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1137:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    113a:	7d 07                	jge    1143 <findAlias+0xfc>
      {
          isSame = 0;
    113c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    1143:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    1147:	75 0b                	jne    1154 <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    1149:	b8 01 00 00 00       	mov    $0x1,%eax
    114e:	2b 45 f0             	sub    -0x10(%ebp),%eax
    1151:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    1154:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1158:	75 1c                	jne    1176 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    115a:	83 ec 08             	sub    $0x8,%esp
    115d:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1160:	50                   	push   %eax
    1161:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1167:	50                   	push   %eax
    1168:	e8 1e ef ff ff       	call   8b <strcpy>
    116d:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    1170:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1173:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1176:	83 ec 04             	sub    $0x4,%esp
    1179:	6a 32                	push   $0x32
    117b:	8d 45 9a             	lea    -0x66(%ebp),%eax
    117e:	50                   	push   %eax
    117f:	ff 75 dc             	pushl  -0x24(%ebp)
    1182:	e8 4d f1 ff ff       	call   2d4 <read>
    1187:	83 c4 10             	add    $0x10,%esp
    118a:	89 45 d8             	mov    %eax,-0x28(%ebp)
    118d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    1191:	0f 8f f1 fe ff ff    	jg     1088 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    1197:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    119b:	75 5f                	jne    11fc <findAlias+0x1b5>
  {
    int i = 0;
    119d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    11a4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    11a8:	eb 20                	jmp    11ca <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    11aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
    11ad:	8b 45 0c             	mov    0xc(%ebp),%eax
    11b0:	01 c2                	add    %eax,%edx
    11b2:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    11b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11bb:	01 c8                	add    %ecx,%eax
    11bd:	0f b6 00             	movzbl (%eax),%eax
    11c0:	88 02                	mov    %al,(%edx)
      i++;
    11c2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    11c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    11ca:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    11d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11d3:	01 d0                	add    %edx,%eax
    11d5:	0f b6 00             	movzbl (%eax),%eax
    11d8:	84 c0                	test   %al,%al
    11da:	75 ce                	jne    11aa <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    11dc:	8b 55 e0             	mov    -0x20(%ebp),%edx
    11df:	8b 45 0c             	mov    0xc(%ebp),%eax
    11e2:	01 d0                	add    %edx,%eax
    11e4:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    11e7:	83 ec 0c             	sub    $0xc,%esp
    11ea:	ff 75 dc             	pushl  -0x24(%ebp)
    11ed:	e8 f2 f0 ff ff       	call   2e4 <close>
    11f2:	83 c4 10             	add    $0x10,%esp
    return 1;
    11f5:	b8 01 00 00 00       	mov    $0x1,%eax
    11fa:	eb 13                	jmp    120f <findAlias+0x1c8>
  }
  close(fd);
    11fc:	83 ec 0c             	sub    $0xc,%esp
    11ff:	ff 75 dc             	pushl  -0x24(%ebp)
    1202:	e8 dd f0 ff ff       	call   2e4 <close>
    1207:	83 c4 10             	add    $0x10,%esp
  return 0;
    120a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    120f:	c9                   	leave  
    1210:	c3                   	ret    

00001211 <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    1211:	55                   	push   %ebp
    1212:	89 e5                	mov    %esp,%ebp
    1214:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1217:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    121b:	75 05                	jne    1222 <runcmd+0x11>
    exit();
    121d:	e8 9a f0 ff ff       	call   2bc <exit>
  
  switch(cmd->type){
    1222:	8b 45 08             	mov    0x8(%ebp),%eax
    1225:	8b 00                	mov    (%eax),%eax
    1227:	83 f8 05             	cmp    $0x5,%eax
    122a:	77 09                	ja     1235 <runcmd+0x24>
    122c:	8b 04 85 cc 36 00 00 	mov    0x36cc(,%eax,4),%eax
    1233:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    1235:	83 ec 0c             	sub    $0xc,%esp
    1238:	68 a0 36 00 00       	push   $0x36a0
    123d:	e8 0b f7 ff ff       	call   94d <panic1>
    1242:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    1245:	8b 45 08             	mov    0x8(%ebp),%eax
    1248:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    124b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    124e:	8b 40 04             	mov    0x4(%eax),%eax
    1251:	85 c0                	test   %eax,%eax
    1253:	75 05                	jne    125a <runcmd+0x49>
      exit();
    1255:	e8 62 f0 ff ff       	call   2bc <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    125a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    125d:	8b 40 04             	mov    0x4(%eax),%eax
    1260:	83 ec 0c             	sub    $0xc,%esp
    1263:	50                   	push   %eax
    1264:	e8 4d fd ff ff       	call   fb6 <isCmdName>
    1269:	83 c4 10             	add    $0x10,%esp
    126c:	85 c0                	test   %eax,%eax
    126e:	75 37                	jne    12a7 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    1270:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1273:	8b 40 04             	mov    0x4(%eax),%eax
    1276:	83 ec 08             	sub    $0x8,%esp
    1279:	8d 55 ce             	lea    -0x32(%ebp),%edx
    127c:	52                   	push   %edx
    127d:	50                   	push   %eax
    127e:	e8 c4 fd ff ff       	call   1047 <findAlias>
    1283:	83 c4 10             	add    $0x10,%esp
    1286:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    1289:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    128d:	75 31                	jne    12c0 <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    128f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1292:	83 c0 04             	add    $0x4,%eax
    1295:	83 ec 08             	sub    $0x8,%esp
    1298:	50                   	push   %eax
    1299:	8d 45 ce             	lea    -0x32(%ebp),%eax
    129c:	50                   	push   %eax
    129d:	e8 52 f0 ff ff       	call   2f4 <exec>
    12a2:	83 c4 10             	add    $0x10,%esp
    12a5:	eb 19                	jmp    12c0 <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    12a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12aa:	8d 50 04             	lea    0x4(%eax),%edx
    12ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12b0:	8b 40 04             	mov    0x4(%eax),%eax
    12b3:	83 ec 08             	sub    $0x8,%esp
    12b6:	52                   	push   %edx
    12b7:	50                   	push   %eax
    12b8:	e8 37 f0 ff ff       	call   2f4 <exec>
    12bd:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    12c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12c3:	8b 40 04             	mov    0x4(%eax),%eax
    12c6:	83 ec 04             	sub    $0x4,%esp
    12c9:	50                   	push   %eax
    12ca:	68 a7 36 00 00       	push   $0x36a7
    12cf:	6a 02                	push   $0x2
    12d1:	e8 92 f2 ff ff       	call   568 <printf>
    12d6:	83 c4 10             	add    $0x10,%esp
    break;
    12d9:	e9 c6 01 00 00       	jmp    14a4 <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    12de:	8b 45 08             	mov    0x8(%ebp),%eax
    12e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    12e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12e7:	8b 40 14             	mov    0x14(%eax),%eax
    12ea:	83 ec 0c             	sub    $0xc,%esp
    12ed:	50                   	push   %eax
    12ee:	e8 f1 ef ff ff       	call   2e4 <close>
    12f3:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    12f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12f9:	8b 50 10             	mov    0x10(%eax),%edx
    12fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12ff:	8b 40 08             	mov    0x8(%eax),%eax
    1302:	83 ec 08             	sub    $0x8,%esp
    1305:	52                   	push   %edx
    1306:	50                   	push   %eax
    1307:	e8 f0 ef ff ff       	call   2fc <open>
    130c:	83 c4 10             	add    $0x10,%esp
    130f:	85 c0                	test   %eax,%eax
    1311:	79 1e                	jns    1331 <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    1313:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1316:	8b 40 08             	mov    0x8(%eax),%eax
    1319:	83 ec 04             	sub    $0x4,%esp
    131c:	50                   	push   %eax
    131d:	68 b7 36 00 00       	push   $0x36b7
    1322:	6a 02                	push   $0x2
    1324:	e8 3f f2 ff ff       	call   568 <printf>
    1329:	83 c4 10             	add    $0x10,%esp
      exit();
    132c:	e8 8b ef ff ff       	call   2bc <exit>
    }
    runcmd(rcmd->cmd);
    1331:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1334:	8b 40 04             	mov    0x4(%eax),%eax
    1337:	83 ec 0c             	sub    $0xc,%esp
    133a:	50                   	push   %eax
    133b:	e8 d1 fe ff ff       	call   1211 <runcmd>
    1340:	83 c4 10             	add    $0x10,%esp
    break;
    1343:	e9 5c 01 00 00       	jmp    14a4 <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    1348:	8b 45 08             	mov    0x8(%ebp),%eax
    134b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    134e:	e8 84 f9 ff ff       	call   cd7 <fork1>
    1353:	85 c0                	test   %eax,%eax
    1355:	75 12                	jne    1369 <runcmd+0x158>
      runcmd(lcmd->left);
    1357:	8b 45 e8             	mov    -0x18(%ebp),%eax
    135a:	8b 40 04             	mov    0x4(%eax),%eax
    135d:	83 ec 0c             	sub    $0xc,%esp
    1360:	50                   	push   %eax
    1361:	e8 ab fe ff ff       	call   1211 <runcmd>
    1366:	83 c4 10             	add    $0x10,%esp
    wait();
    1369:	e8 56 ef ff ff       	call   2c4 <wait>
    runcmd(lcmd->right);
    136e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1371:	8b 40 08             	mov    0x8(%eax),%eax
    1374:	83 ec 0c             	sub    $0xc,%esp
    1377:	50                   	push   %eax
    1378:	e8 94 fe ff ff       	call   1211 <runcmd>
    137d:	83 c4 10             	add    $0x10,%esp
    break;
    1380:	e9 1f 01 00 00       	jmp    14a4 <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    1385:	8b 45 08             	mov    0x8(%ebp),%eax
    1388:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    138b:	83 ec 0c             	sub    $0xc,%esp
    138e:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1391:	50                   	push   %eax
    1392:	e8 35 ef ff ff       	call   2cc <pipe>
    1397:	83 c4 10             	add    $0x10,%esp
    139a:	85 c0                	test   %eax,%eax
    139c:	79 10                	jns    13ae <runcmd+0x19d>
      panic1("pipe");
    139e:	83 ec 0c             	sub    $0xc,%esp
    13a1:	68 c7 36 00 00       	push   $0x36c7
    13a6:	e8 a2 f5 ff ff       	call   94d <panic1>
    13ab:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    13ae:	e8 24 f9 ff ff       	call   cd7 <fork1>
    13b3:	85 c0                	test   %eax,%eax
    13b5:	75 4c                	jne    1403 <runcmd+0x1f2>
      close(1);
    13b7:	83 ec 0c             	sub    $0xc,%esp
    13ba:	6a 01                	push   $0x1
    13bc:	e8 23 ef ff ff       	call   2e4 <close>
    13c1:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    13c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    13c7:	83 ec 0c             	sub    $0xc,%esp
    13ca:	50                   	push   %eax
    13cb:	e8 64 ef ff ff       	call   334 <dup>
    13d0:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    13d3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    13d6:	83 ec 0c             	sub    $0xc,%esp
    13d9:	50                   	push   %eax
    13da:	e8 05 ef ff ff       	call   2e4 <close>
    13df:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    13e2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    13e5:	83 ec 0c             	sub    $0xc,%esp
    13e8:	50                   	push   %eax
    13e9:	e8 f6 ee ff ff       	call   2e4 <close>
    13ee:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    13f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    13f4:	8b 40 04             	mov    0x4(%eax),%eax
    13f7:	83 ec 0c             	sub    $0xc,%esp
    13fa:	50                   	push   %eax
    13fb:	e8 11 fe ff ff       	call   1211 <runcmd>
    1400:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    1403:	e8 cf f8 ff ff       	call   cd7 <fork1>
    1408:	85 c0                	test   %eax,%eax
    140a:	75 4c                	jne    1458 <runcmd+0x247>
      close(0);
    140c:	83 ec 0c             	sub    $0xc,%esp
    140f:	6a 00                	push   $0x0
    1411:	e8 ce ee ff ff       	call   2e4 <close>
    1416:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    1419:	8b 45 d8             	mov    -0x28(%ebp),%eax
    141c:	83 ec 0c             	sub    $0xc,%esp
    141f:	50                   	push   %eax
    1420:	e8 0f ef ff ff       	call   334 <dup>
    1425:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1428:	8b 45 d8             	mov    -0x28(%ebp),%eax
    142b:	83 ec 0c             	sub    $0xc,%esp
    142e:	50                   	push   %eax
    142f:	e8 b0 ee ff ff       	call   2e4 <close>
    1434:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    1437:	8b 45 dc             	mov    -0x24(%ebp),%eax
    143a:	83 ec 0c             	sub    $0xc,%esp
    143d:	50                   	push   %eax
    143e:	e8 a1 ee ff ff       	call   2e4 <close>
    1443:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    1446:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1449:	8b 40 08             	mov    0x8(%eax),%eax
    144c:	83 ec 0c             	sub    $0xc,%esp
    144f:	50                   	push   %eax
    1450:	e8 bc fd ff ff       	call   1211 <runcmd>
    1455:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    1458:	8b 45 d8             	mov    -0x28(%ebp),%eax
    145b:	83 ec 0c             	sub    $0xc,%esp
    145e:	50                   	push   %eax
    145f:	e8 80 ee ff ff       	call   2e4 <close>
    1464:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    1467:	8b 45 dc             	mov    -0x24(%ebp),%eax
    146a:	83 ec 0c             	sub    $0xc,%esp
    146d:	50                   	push   %eax
    146e:	e8 71 ee ff ff       	call   2e4 <close>
    1473:	83 c4 10             	add    $0x10,%esp
    wait();
    1476:	e8 49 ee ff ff       	call   2c4 <wait>
    wait();
    147b:	e8 44 ee ff ff       	call   2c4 <wait>
    break;
    1480:	eb 22                	jmp    14a4 <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    1482:	8b 45 08             	mov    0x8(%ebp),%eax
    1485:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    1488:	e8 4a f8 ff ff       	call   cd7 <fork1>
    148d:	85 c0                	test   %eax,%eax
    148f:	75 12                	jne    14a3 <runcmd+0x292>
      runcmd(bcmd->cmd);
    1491:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1494:	8b 40 04             	mov    0x4(%eax),%eax
    1497:	83 ec 0c             	sub    $0xc,%esp
    149a:	50                   	push   %eax
    149b:	e8 71 fd ff ff       	call   1211 <runcmd>
    14a0:	83 c4 10             	add    $0x10,%esp
    break;
    14a3:	90                   	nop
  }
  exit();
    14a4:	e8 13 ee ff ff       	call   2bc <exit>

000014a9 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    14a9:	55                   	push   %ebp
    14aa:	89 e5                	mov    %esp,%ebp
    14ac:	83 ec 04             	sub    $0x4,%esp
    14af:	8b 45 08             	mov    0x8(%ebp),%eax
    14b2:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    14b5:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    14b9:	7e 0d                	jle    14c8 <isNameChar+0x1f>
    14bb:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    14bf:	7f 07                	jg     14c8 <isNameChar+0x1f>
    return 1;
    14c1:	b8 01 00 00 00       	mov    $0x1,%eax
    14c6:	eb 38                	jmp    1500 <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    14c8:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    14cc:	7e 0d                	jle    14db <isNameChar+0x32>
    14ce:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    14d2:	7f 07                	jg     14db <isNameChar+0x32>
    return 1;
    14d4:	b8 01 00 00 00       	mov    $0x1,%eax
    14d9:	eb 25                	jmp    1500 <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    14db:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    14df:	7e 0d                	jle    14ee <isNameChar+0x45>
    14e1:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    14e5:	7f 07                	jg     14ee <isNameChar+0x45>
    return 1;
    14e7:	b8 01 00 00 00       	mov    $0x1,%eax
    14ec:	eb 12                	jmp    1500 <isNameChar+0x57>
  if(ch == '_')
    14ee:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    14f2:	75 07                	jne    14fb <isNameChar+0x52>
    return 1;
    14f4:	b8 01 00 00 00       	mov    $0x1,%eax
    14f9:	eb 05                	jmp    1500 <isNameChar+0x57>
  return 0;
    14fb:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1500:	c9                   	leave  
    1501:	c3                   	ret    

00001502 <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    1502:	55                   	push   %ebp
    1503:	89 e5                	mov    %esp,%ebp
    1505:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    1508:	8b 45 08             	mov    0x8(%ebp),%eax
    150b:	8b 40 04             	mov    0x4(%eax),%eax
    150e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    1511:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    1518:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    151f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1526:	eb 1d                	jmp    1545 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    1528:	8b 55 ec             	mov    -0x14(%ebp),%edx
    152b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    152e:	01 d0                	add    %edx,%eax
    1530:	0f b6 00             	movzbl (%eax),%eax
    1533:	3c 3d                	cmp    $0x3d,%al
    1535:	75 0a                	jne    1541 <runCalcmd+0x3f>
    {
      hasEqu++;
    1537:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    153b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    153e:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    1541:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1545:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1548:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    154b:	01 d0                	add    %edx,%eax
    154d:	0f b6 00             	movzbl (%eax),%eax
    1550:	84 c0                	test   %al,%al
    1552:	75 d4                	jne    1528 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    1554:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1558:	7e 1d                	jle    1577 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    155a:	83 ec 0c             	sub    $0xc,%esp
    155d:	68 e4 36 00 00       	push   $0x36e4
    1562:	6a 00                	push   $0x0
    1564:	6a 00                	push   $0x0
    1566:	6a 01                	push   $0x1
    1568:	6a 04                	push   $0x4
    156a:	e8 21 17 00 00       	call   2c90 <color_printf>
    156f:	83 c4 20             	add    $0x20,%esp
    1572:	e9 78 05 00 00       	jmp    1aef <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    1577:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    157b:	0f 85 26 05 00 00    	jne    1aa7 <runCalcmd+0x5a5>
  {
    int i=0;
    1581:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    1588:	eb 04                	jmp    158e <runCalcmd+0x8c>
    {
      i++;
    158a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    158e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1591:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1594:	01 d0                	add    %edx,%eax
    1596:	0f b6 00             	movzbl (%eax),%eax
    1599:	3c 20                	cmp    $0x20,%al
    159b:	74 ed                	je     158a <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    159d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    15a3:	eb 23                	jmp    15c8 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    15a5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    15a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15ab:	01 d0                	add    %edx,%eax
    15ad:	0f b6 00             	movzbl (%eax),%eax
    15b0:	0f be c0             	movsbl %al,%eax
    15b3:	83 ec 0c             	sub    $0xc,%esp
    15b6:	50                   	push   %eax
    15b7:	e8 ed fe ff ff       	call   14a9 <isNameChar>
    15bc:	83 c4 10             	add    $0x10,%esp
    15bf:	83 f8 01             	cmp    $0x1,%eax
    15c2:	75 0e                	jne    15d2 <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    15c4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    15c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15cb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    15ce:	7c d5                	jl     15a5 <runCalcmd+0xa3>
    15d0:	eb 01                	jmp    15d3 <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    15d2:	90                   	nop
    }
    int len = i-startIndex;
    15d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15d6:	2b 45 d0             	sub    -0x30(%ebp),%eax
    15d9:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    15dc:	eb 04                	jmp    15e2 <runCalcmd+0xe0>
    {
      i++;
    15de:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    15e2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    15e5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15e8:	01 d0                	add    %edx,%eax
    15ea:	0f b6 00             	movzbl (%eax),%eax
    15ed:	3c 20                	cmp    $0x20,%al
    15ef:	74 ed                	je     15de <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    15f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15f4:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    15f7:	0f 85 90 04 00 00    	jne    1a8d <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    15fd:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1600:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1603:	01 d0                	add    %edx,%eax
    1605:	0f b6 00             	movzbl (%eax),%eax
    1608:	3c 2f                	cmp    $0x2f,%al
    160a:	7e 2c                	jle    1638 <runCalcmd+0x136>
    160c:	8b 55 d0             	mov    -0x30(%ebp),%edx
    160f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1612:	01 d0                	add    %edx,%eax
    1614:	0f b6 00             	movzbl (%eax),%eax
    1617:	3c 39                	cmp    $0x39,%al
    1619:	7f 1d                	jg     1638 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    161b:	83 ec 0c             	sub    $0xc,%esp
    161e:	68 00 37 00 00       	push   $0x3700
    1623:	6a 00                	push   $0x0
    1625:	6a 00                	push   $0x0
    1627:	6a 01                	push   $0x1
    1629:	6a 04                	push   $0x4
    162b:	e8 60 16 00 00       	call   2c90 <color_printf>
    1630:	83 c4 20             	add    $0x20,%esp
    1633:	e9 b7 04 00 00       	jmp    1aef <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1638:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    163f:	eb 20                	jmp    1661 <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    1641:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1644:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1647:	01 d0                	add    %edx,%eax
    1649:	89 c2                	mov    %eax,%edx
    164b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    164e:	01 d0                	add    %edx,%eax
    1650:	0f b6 00             	movzbl (%eax),%eax
    1653:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1656:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1659:	01 ca                	add    %ecx,%edx
    165b:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    165d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1661:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1664:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1667:	7c d8                	jl     1641 <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1669:	8d 55 94             	lea    -0x6c(%ebp),%edx
    166c:	8b 45 cc             	mov    -0x34(%ebp),%eax
    166f:	01 d0                	add    %edx,%eax
    1671:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    1674:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1677:	83 c0 01             	add    $0x1,%eax
    167a:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    167d:	eb 04                	jmp    1683 <runCalcmd+0x181>
        {
          i++;
    167f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    1683:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1686:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1689:	01 d0                	add    %edx,%eax
    168b:	0f b6 00             	movzbl (%eax),%eax
    168e:	3c 20                	cmp    $0x20,%al
    1690:	74 ed                	je     167f <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    1692:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1695:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1698:	01 d0                	add    %edx,%eax
    169a:	0f b6 00             	movzbl (%eax),%eax
    169d:	3c 60                	cmp    $0x60,%al
    169f:	0f 85 e6 01 00 00    	jne    188b <runCalcmd+0x389>
        {
          i++;
    16a5:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    16a9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    16ac:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    16af:	eb 04                	jmp    16b5 <runCalcmd+0x1b3>
          {
            i++;
    16b1:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    16b5:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16bb:	01 d0                	add    %edx,%eax
    16bd:	0f b6 00             	movzbl (%eax),%eax
    16c0:	3c 60                	cmp    $0x60,%al
    16c2:	74 0f                	je     16d3 <runCalcmd+0x1d1>
    16c4:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16c7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16ca:	01 d0                	add    %edx,%eax
    16cc:	0f b6 00             	movzbl (%eax),%eax
    16cf:	84 c0                	test   %al,%al
    16d1:	75 de                	jne    16b1 <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    16d3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16d6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16d9:	01 d0                	add    %edx,%eax
    16db:	0f b6 00             	movzbl (%eax),%eax
    16de:	3c 60                	cmp    $0x60,%al
    16e0:	0f 85 5c 01 00 00    	jne    1842 <runCalcmd+0x340>
    16e6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    16e9:	8d 50 01             	lea    0x1(%eax),%edx
    16ec:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16ef:	01 d0                	add    %edx,%eax
    16f1:	0f b6 00             	movzbl (%eax),%eax
    16f4:	84 c0                	test   %al,%al
    16f6:	0f 85 46 01 00 00    	jne    1842 <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    16fc:	8b 55 e0             	mov    -0x20(%ebp),%edx
    16ff:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1702:	01 d0                	add    %edx,%eax
    1704:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    1707:	8b 55 c8             	mov    -0x38(%ebp),%edx
    170a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    170d:	01 d0                	add    %edx,%eax
    170f:	83 ec 0c             	sub    $0xc,%esp
    1712:	50                   	push   %eax
    1713:	e8 c5 04 00 00       	call   1bdd <Compute>
    1718:	83 c4 10             	add    $0x10,%esp
    171b:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    171e:	dd 05 70 38 00 00    	fldl   0x3870
    1724:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1728:	dd 1c 24             	fstpl  (%esp)
    172b:	ff 75 c4             	pushl  -0x3c(%ebp)
    172e:	ff 75 c0             	pushl  -0x40(%ebp)
    1731:	e8 30 f8 ff ff       	call   f66 <isEqual>
    1736:	83 c4 10             	add    $0x10,%esp
    1739:	85 c0                	test   %eax,%eax
    173b:	0f 85 ad 03 00 00    	jne    1aee <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    1741:	a1 cc 43 00 00       	mov    0x43cc,%eax
    1746:	85 c0                	test   %eax,%eax
    1748:	75 15                	jne    175f <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    174a:	83 ec 08             	sub    $0x8,%esp
    174d:	68 cc 43 00 00       	push   $0x43cc
    1752:	68 00 44 00 00       	push   $0x4400
    1757:	e8 ba 19 00 00       	call   3116 <readVariables>
    175c:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    175f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1766:	eb 26                	jmp    178e <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1768:	8b 45 dc             	mov    -0x24(%ebp),%eax
    176b:	c1 e0 05             	shl    $0x5,%eax
    176e:	05 00 44 00 00       	add    $0x4400,%eax
    1773:	8d 50 04             	lea    0x4(%eax),%edx
    1776:	83 ec 08             	sub    $0x8,%esp
    1779:	8d 45 94             	lea    -0x6c(%ebp),%eax
    177c:	50                   	push   %eax
    177d:	52                   	push   %edx
    177e:	e8 38 e9 ff ff       	call   bb <strcmp>
    1783:	83 c4 10             	add    $0x10,%esp
    1786:	85 c0                	test   %eax,%eax
    1788:	74 10                	je     179a <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    178a:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    178e:	a1 cc 43 00 00       	mov    0x43cc,%eax
    1793:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1796:	7c d0                	jl     1768 <runCalcmd+0x266>
    1798:	eb 01                	jmp    179b <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    179a:	90                   	nop
              }
              if(index == v_num) //new variable
    179b:	a1 cc 43 00 00       	mov    0x43cc,%eax
    17a0:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    17a3:	75 3c                	jne    17e1 <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    17a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17a8:	c1 e0 05             	shl    $0x5,%eax
    17ab:	05 00 44 00 00       	add    $0x4400,%eax
    17b0:	8d 50 04             	lea    0x4(%eax),%edx
    17b3:	83 ec 08             	sub    $0x8,%esp
    17b6:	8d 45 94             	lea    -0x6c(%ebp),%eax
    17b9:	50                   	push   %eax
    17ba:	52                   	push   %edx
    17bb:	e8 cb e8 ff ff       	call   8b <strcpy>
    17c0:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    17c3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17c6:	c1 e0 05             	shl    $0x5,%eax
    17c9:	05 00 44 00 00       	add    $0x4400,%eax
    17ce:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    17d4:	a1 cc 43 00 00       	mov    0x43cc,%eax
    17d9:	83 c0 01             	add    $0x1,%eax
    17dc:	a3 cc 43 00 00       	mov    %eax,0x43cc
              }
              variables[index].value.dvalue = result;
    17e1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17e4:	c1 e0 05             	shl    $0x5,%eax
    17e7:	05 10 44 00 00       	add    $0x4410,%eax
    17ec:	dd 45 c0             	fldl   -0x40(%ebp)
    17ef:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    17f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17f5:	c1 e0 05             	shl    $0x5,%eax
    17f8:	05 10 44 00 00       	add    $0x4410,%eax
    17fd:	dd 40 08             	fldl   0x8(%eax)
    1800:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1803:	c1 e0 05             	shl    $0x5,%eax
    1806:	05 00 44 00 00       	add    $0x4400,%eax
    180b:	83 c0 04             	add    $0x4,%eax
    180e:	83 ec 0c             	sub    $0xc,%esp
    1811:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1815:	dd 1c 24             	fstpl  (%esp)
    1818:	50                   	push   %eax
    1819:	68 2a 37 00 00       	push   $0x372a
    181e:	6a 01                	push   $0x1
    1820:	e8 43 ed ff ff       	call   568 <printf>
    1825:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1828:	83 ec 08             	sub    $0x8,%esp
    182b:	68 cc 43 00 00       	push   $0x43cc
    1830:	68 00 44 00 00       	push   $0x4400
    1835:	e8 90 1b 00 00       	call   33ca <writeVariables>
    183a:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    183d:	e9 ac 02 00 00       	jmp    1aee <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    1842:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1845:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1848:	01 d0                	add    %edx,%eax
    184a:	0f b6 00             	movzbl (%eax),%eax
    184d:	84 c0                	test   %al,%al
    184f:	75 1d                	jne    186e <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    1851:	83 ec 0c             	sub    $0xc,%esp
    1854:	68 31 37 00 00       	push   $0x3731
    1859:	6a 00                	push   $0x0
    185b:	6a 00                	push   $0x0
    185d:	6a 01                	push   $0x1
    185f:	6a 04                	push   $0x4
    1861:	e8 2a 14 00 00       	call   2c90 <color_printf>
    1866:	83 c4 20             	add    $0x20,%esp
    1869:	e9 81 02 00 00       	jmp    1aef <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    186e:	83 ec 0c             	sub    $0xc,%esp
    1871:	68 48 37 00 00       	push   $0x3748
    1876:	6a 00                	push   $0x0
    1878:	6a 00                	push   $0x0
    187a:	6a 01                	push   $0x1
    187c:	6a 04                	push   $0x4
    187e:	e8 0d 14 00 00       	call   2c90 <color_printf>
    1883:	83 c4 20             	add    $0x20,%esp
    1886:	e9 64 02 00 00       	jmp    1aef <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    188b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    188e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1891:	01 d0                	add    %edx,%eax
    1893:	0f b6 00             	movzbl (%eax),%eax
    1896:	3c 22                	cmp    $0x22,%al
    1898:	0f 85 d5 01 00 00    	jne    1a73 <runCalcmd+0x571>
        {
          i++;
    189e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    18a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18a5:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    18a8:	eb 04                	jmp    18ae <runCalcmd+0x3ac>
          {
            i++;
    18aa:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    18ae:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18b1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18b4:	01 d0                	add    %edx,%eax
    18b6:	0f b6 00             	movzbl (%eax),%eax
    18b9:	3c 22                	cmp    $0x22,%al
    18bb:	74 0f                	je     18cc <runCalcmd+0x3ca>
    18bd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18c3:	01 d0                	add    %edx,%eax
    18c5:	0f b6 00             	movzbl (%eax),%eax
    18c8:	84 c0                	test   %al,%al
    18ca:	75 de                	jne    18aa <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    18cc:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18d2:	01 d0                	add    %edx,%eax
    18d4:	0f b6 00             	movzbl (%eax),%eax
    18d7:	3c 22                	cmp    $0x22,%al
    18d9:	0f 85 4e 01 00 00    	jne    1a2d <runCalcmd+0x52b>
    18df:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18e2:	8d 50 01             	lea    0x1(%eax),%edx
    18e5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18e8:	01 d0                	add    %edx,%eax
    18ea:	0f b6 00             	movzbl (%eax),%eax
    18ed:	84 c0                	test   %al,%al
    18ef:	0f 85 38 01 00 00    	jne    1a2d <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    18f5:	a1 cc 43 00 00       	mov    0x43cc,%eax
    18fa:	85 c0                	test   %eax,%eax
    18fc:	75 15                	jne    1913 <runCalcmd+0x411>
              readVariables(variables,&v_num);
    18fe:	83 ec 08             	sub    $0x8,%esp
    1901:	68 cc 43 00 00       	push   $0x43cc
    1906:	68 00 44 00 00       	push   $0x4400
    190b:	e8 06 18 00 00       	call   3116 <readVariables>
    1910:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1913:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    191a:	eb 26                	jmp    1942 <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    191c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    191f:	c1 e0 05             	shl    $0x5,%eax
    1922:	05 00 44 00 00       	add    $0x4400,%eax
    1927:	8d 50 04             	lea    0x4(%eax),%edx
    192a:	83 ec 08             	sub    $0x8,%esp
    192d:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1930:	50                   	push   %eax
    1931:	52                   	push   %edx
    1932:	e8 84 e7 ff ff       	call   bb <strcmp>
    1937:	83 c4 10             	add    $0x10,%esp
    193a:	85 c0                	test   %eax,%eax
    193c:	74 10                	je     194e <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    193e:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1942:	a1 cc 43 00 00       	mov    0x43cc,%eax
    1947:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    194a:	7c d0                	jl     191c <runCalcmd+0x41a>
    194c:	eb 01                	jmp    194f <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    194e:	90                   	nop
            }
            if(index == v_num) //new variable
    194f:	a1 cc 43 00 00       	mov    0x43cc,%eax
    1954:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1957:	75 2b                	jne    1984 <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1959:	8b 45 d8             	mov    -0x28(%ebp),%eax
    195c:	c1 e0 05             	shl    $0x5,%eax
    195f:	05 00 44 00 00       	add    $0x4400,%eax
    1964:	8d 50 04             	lea    0x4(%eax),%edx
    1967:	83 ec 08             	sub    $0x8,%esp
    196a:	8d 45 94             	lea    -0x6c(%ebp),%eax
    196d:	50                   	push   %eax
    196e:	52                   	push   %edx
    196f:	e8 17 e7 ff ff       	call   8b <strcpy>
    1974:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1977:	a1 cc 43 00 00       	mov    0x43cc,%eax
    197c:	83 c0 01             	add    $0x1,%eax
    197f:	a3 cc 43 00 00       	mov    %eax,0x43cc
            }
            variables[index].type = V_STRING;
    1984:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1987:	c1 e0 05             	shl    $0x5,%eax
    198a:	05 00 44 00 00       	add    $0x4400,%eax
    198f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1995:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1998:	2b 45 bc             	sub    -0x44(%ebp),%eax
    199b:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    199e:	8b 45 b8             	mov    -0x48(%ebp),%eax
    19a1:	83 c0 01             	add    $0x1,%eax
    19a4:	83 ec 0c             	sub    $0xc,%esp
    19a7:	50                   	push   %eax
    19a8:	e8 bd ee ff ff       	call   86a <malloc>
    19ad:	83 c4 10             	add    $0x10,%esp
    19b0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    19b3:	8b 55 bc             	mov    -0x44(%ebp),%edx
    19b6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19b9:	01 d0                	add    %edx,%eax
    19bb:	83 ec 08             	sub    $0x8,%esp
    19be:	50                   	push   %eax
    19bf:	ff 75 b4             	pushl  -0x4c(%ebp)
    19c2:	e8 c4 e6 ff ff       	call   8b <strcpy>
    19c7:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    19ca:	8b 55 b8             	mov    -0x48(%ebp),%edx
    19cd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    19d0:	01 d0                	add    %edx,%eax
    19d2:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    19d5:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19d8:	c1 e0 05             	shl    $0x5,%eax
    19db:	8d 90 18 44 00 00    	lea    0x4418(%eax),%edx
    19e1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    19e4:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    19e6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19e9:	c1 e0 05             	shl    $0x5,%eax
    19ec:	05 18 44 00 00       	add    $0x4418,%eax
    19f1:	8b 00                	mov    (%eax),%eax
    19f3:	8b 55 d8             	mov    -0x28(%ebp),%edx
    19f6:	c1 e2 05             	shl    $0x5,%edx
    19f9:	81 c2 00 44 00 00    	add    $0x4400,%edx
    19ff:	83 c2 04             	add    $0x4,%edx
    1a02:	50                   	push   %eax
    1a03:	52                   	push   %edx
    1a04:	68 69 37 00 00       	push   $0x3769
    1a09:	6a 01                	push   $0x1
    1a0b:	e8 58 eb ff ff       	call   568 <printf>
    1a10:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1a13:	83 ec 08             	sub    $0x8,%esp
    1a16:	68 cc 43 00 00       	push   $0x43cc
    1a1b:	68 00 44 00 00       	push   $0x4400
    1a20:	e8 a5 19 00 00       	call   33ca <writeVariables>
    1a25:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1a28:	e9 c2 00 00 00       	jmp    1aef <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1a2d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a30:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a33:	01 d0                	add    %edx,%eax
    1a35:	0f b6 00             	movzbl (%eax),%eax
    1a38:	84 c0                	test   %al,%al
    1a3a:	75 1d                	jne    1a59 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1a3c:	83 ec 0c             	sub    $0xc,%esp
    1a3f:	68 72 37 00 00       	push   $0x3772
    1a44:	6a 00                	push   $0x0
    1a46:	6a 00                	push   $0x0
    1a48:	6a 01                	push   $0x1
    1a4a:	6a 04                	push   $0x4
    1a4c:	e8 3f 12 00 00       	call   2c90 <color_printf>
    1a51:	83 c4 20             	add    $0x20,%esp
    1a54:	e9 96 00 00 00       	jmp    1aef <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1a59:	83 ec 0c             	sub    $0xc,%esp
    1a5c:	68 88 37 00 00       	push   $0x3788
    1a61:	6a 00                	push   $0x0
    1a63:	6a 00                	push   $0x0
    1a65:	6a 01                	push   $0x1
    1a67:	6a 04                	push   $0x4
    1a69:	e8 22 12 00 00       	call   2c90 <color_printf>
    1a6e:	83 c4 20             	add    $0x20,%esp
    1a71:	eb 7c                	jmp    1aef <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1a73:	83 ec 0c             	sub    $0xc,%esp
    1a76:	68 a9 37 00 00       	push   $0x37a9
    1a7b:	6a 00                	push   $0x0
    1a7d:	6a 00                	push   $0x0
    1a7f:	6a 01                	push   $0x1
    1a81:	6a 04                	push   $0x4
    1a83:	e8 08 12 00 00       	call   2c90 <color_printf>
    1a88:	83 c4 20             	add    $0x20,%esp
    1a8b:	eb 62                	jmp    1aef <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1a8d:	83 ec 0c             	sub    $0xc,%esp
    1a90:	68 a9 37 00 00       	push   $0x37a9
    1a95:	6a 00                	push   $0x0
    1a97:	6a 00                	push   $0x0
    1a99:	6a 01                	push   $0x1
    1a9b:	6a 04                	push   $0x4
    1a9d:	e8 ee 11 00 00       	call   2c90 <color_printf>
    1aa2:	83 c4 20             	add    $0x20,%esp
    1aa5:	eb 48                	jmp    1aef <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1aa7:	83 ec 0c             	sub    $0xc,%esp
    1aaa:	ff 75 d4             	pushl  -0x2c(%ebp)
    1aad:	e8 2b 01 00 00       	call   1bdd <Compute>
    1ab2:	83 c4 10             	add    $0x10,%esp
    1ab5:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1ab8:	dd 05 70 38 00 00    	fldl   0x3870
    1abe:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1ac2:	dd 1c 24             	fstpl  (%esp)
    1ac5:	ff 75 ac             	pushl  -0x54(%ebp)
    1ac8:	ff 75 a8             	pushl  -0x58(%ebp)
    1acb:	e8 96 f4 ff ff       	call   f66 <isEqual>
    1ad0:	83 c4 10             	add    $0x10,%esp
    1ad3:	85 c0                	test   %eax,%eax
    1ad5:	75 18                	jne    1aef <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1ad7:	ff 75 ac             	pushl  -0x54(%ebp)
    1ada:	ff 75 a8             	pushl  -0x58(%ebp)
    1add:	68 c1 37 00 00       	push   $0x37c1
    1ae2:	6a 01                	push   $0x1
    1ae4:	e8 7f ea ff ff       	call   568 <printf>
    1ae9:	83 c4 10             	add    $0x10,%esp
    1aec:	eb 01                	jmp    1aef <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1aee:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1aef:	e8 c8 e7 ff ff       	call   2bc <exit>

00001af4 <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1af4:	55                   	push   %ebp
    1af5:	89 e5                	mov    %esp,%ebp
    1af7:	83 ec 04             	sub    $0x4,%esp
    1afa:	8b 45 08             	mov    0x8(%ebp),%eax
    1afd:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1b00:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1b04:	83 e8 23             	sub    $0x23,%eax
    1b07:	83 f8 0c             	cmp    $0xc,%eax
    1b0a:	77 25                	ja     1b31 <GetLevel+0x3d>
    1b0c:	8b 04 85 c8 37 00 00 	mov    0x37c8(,%eax,4),%eax
    1b13:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1b15:	b8 01 00 00 00       	mov    $0x1,%eax
    1b1a:	eb 1a                	jmp    1b36 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1b1c:	b8 02 00 00 00       	mov    $0x2,%eax
    1b21:	eb 13                	jmp    1b36 <GetLevel+0x42>
    case '(':
        return 0;
    1b23:	b8 00 00 00 00       	mov    $0x0,%eax
    1b28:	eb 0c                	jmp    1b36 <GetLevel+0x42>
    case '#':
        return -2;
    1b2a:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1b2f:	eb 05                	jmp    1b36 <GetLevel+0x42>
    };
    return -1;
    1b31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1b36:	c9                   	leave  
    1b37:	c3                   	ret    

00001b38 <Operate>:

double Operate(double a1, char op, double a2)
{
    1b38:	55                   	push   %ebp
    1b39:	89 e5                	mov    %esp,%ebp
    1b3b:	83 ec 28             	sub    $0x28,%esp
    1b3e:	8b 45 10             	mov    0x10(%ebp),%eax
    1b41:	8b 55 08             	mov    0x8(%ebp),%edx
    1b44:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1b47:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b4a:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1b4d:	88 45 ec             	mov    %al,-0x14(%ebp)
    1b50:	8b 45 14             	mov    0x14(%ebp),%eax
    1b53:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1b56:	8b 45 18             	mov    0x18(%ebp),%eax
    1b59:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1b5c:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1b60:	83 f8 2b             	cmp    $0x2b,%eax
    1b63:	74 18                	je     1b7d <Operate+0x45>
    1b65:	83 f8 2b             	cmp    $0x2b,%eax
    1b68:	7f 07                	jg     1b71 <Operate+0x39>
    1b6a:	83 f8 2a             	cmp    $0x2a,%eax
    1b6d:	74 1e                	je     1b8d <Operate+0x55>
    1b6f:	eb 68                	jmp    1bd9 <Operate+0xa1>
    1b71:	83 f8 2d             	cmp    $0x2d,%eax
    1b74:	74 0f                	je     1b85 <Operate+0x4d>
    1b76:	83 f8 2f             	cmp    $0x2f,%eax
    1b79:	74 1a                	je     1b95 <Operate+0x5d>
    1b7b:	eb 5c                	jmp    1bd9 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1b7d:	dd 45 f0             	fldl   -0x10(%ebp)
    1b80:	dc 45 e0             	faddl  -0x20(%ebp)
    1b83:	eb 56                	jmp    1bdb <Operate+0xa3>
    case '-':
        return a1 - a2;
    1b85:	dd 45 f0             	fldl   -0x10(%ebp)
    1b88:	dc 65 e0             	fsubl  -0x20(%ebp)
    1b8b:	eb 4e                	jmp    1bdb <Operate+0xa3>
    case '*':
        return a1 * a2;
    1b8d:	dd 45 f0             	fldl   -0x10(%ebp)
    1b90:	dc 4d e0             	fmull  -0x20(%ebp)
    1b93:	eb 46                	jmp    1bdb <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1b95:	d9 ee                	fldz   
    1b97:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1b9b:	dd 1c 24             	fstpl  (%esp)
    1b9e:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ba1:	ff 75 e0             	pushl  -0x20(%ebp)
    1ba4:	e8 bd f3 ff ff       	call   f66 <isEqual>
    1ba9:	83 c4 10             	add    $0x10,%esp
    1bac:	83 f8 01             	cmp    $0x1,%eax
    1baf:	75 20                	jne    1bd1 <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1bb1:	83 ec 0c             	sub    $0xc,%esp
    1bb4:	68 fc 37 00 00       	push   $0x37fc
    1bb9:	6a 00                	push   $0x0
    1bbb:	6a 00                	push   $0x0
    1bbd:	6a 01                	push   $0x1
    1bbf:	6a 04                	push   $0x4
    1bc1:	e8 ca 10 00 00       	call   2c90 <color_printf>
    1bc6:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1bc9:	dd 05 70 38 00 00    	fldl   0x3870
    1bcf:	eb 0a                	jmp    1bdb <Operate+0xa3>
        }
        else
          return a1 / a2;
    1bd1:	dd 45 f0             	fldl   -0x10(%ebp)
    1bd4:	dc 75 e0             	fdivl  -0x20(%ebp)
    1bd7:	eb 02                	jmp    1bdb <Operate+0xa3>
    };
    return 1;
    1bd9:	d9 e8                	fld1   
}
    1bdb:	c9                   	leave  
    1bdc:	c3                   	ret    

00001bdd <Compute>:

double Compute(char *s)
{
    1bdd:	55                   	push   %ebp
    1bde:	89 e5                	mov    %esp,%ebp
    1be0:	53                   	push   %ebx
    1be1:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1be7:	e8 44 14 00 00       	call   3030 <dstack>
    1bec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1bef:	e8 73 13 00 00       	call   2f67 <cstack>
    1bf4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1bf7:	83 ec 08             	sub    $0x8,%esp
    1bfa:	6a 23                	push   $0x23
    1bfc:	ff 75 e0             	pushl  -0x20(%ebp)
    1bff:	e8 91 13 00 00       	call   2f95 <pushc>
    1c04:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1c07:	83 ec 0c             	sub    $0xc,%esp
    1c0a:	ff 75 08             	pushl  0x8(%ebp)
    1c0d:	e8 e8 e4 ff ff       	call   fa <strlen>
    1c12:	83 c4 10             	add    $0x10,%esp
    1c15:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1c18:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1c1f:	c7 05 e0 43 00 00 00 	movl   $0x0,0x43e0
    1c26:	00 00 00 
    1c29:	e9 58 05 00 00       	jmp    2186 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1c2e:	a1 e0 43 00 00       	mov    0x43e0,%eax
    1c33:	89 c2                	mov    %eax,%edx
    1c35:	8b 45 08             	mov    0x8(%ebp),%eax
    1c38:	01 d0                	add    %edx,%eax
    1c3a:	0f b6 00             	movzbl (%eax),%eax
    1c3d:	3c 24                	cmp    $0x24,%al
    1c3f:	0f 85 f8 01 00 00    	jne    1e3d <Compute+0x260>
        {
          is_minus = 0;
    1c45:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1c4c:	a1 e0 43 00 00       	mov    0x43e0,%eax
    1c51:	83 c0 01             	add    $0x1,%eax
    1c54:	a3 e0 43 00 00       	mov    %eax,0x43e0
          if(s[g_pos] != '{')
    1c59:	a1 e0 43 00 00       	mov    0x43e0,%eax
    1c5e:	89 c2                	mov    %eax,%edx
    1c60:	8b 45 08             	mov    0x8(%ebp),%eax
    1c63:	01 d0                	add    %edx,%eax
    1c65:	0f b6 00             	movzbl (%eax),%eax
    1c68:	3c 7b                	cmp    $0x7b,%al
    1c6a:	74 23                	je     1c8f <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1c6c:	83 ec 0c             	sub    $0xc,%esp
    1c6f:	68 14 38 00 00       	push   $0x3814
    1c74:	6a 00                	push   $0x0
    1c76:	6a 00                	push   $0x0
    1c78:	6a 01                	push   $0x1
    1c7a:	6a 04                	push   $0x4
    1c7c:	e8 0f 10 00 00       	call   2c90 <color_printf>
    1c81:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1c84:	dd 05 70 38 00 00    	fldl   0x3870
    1c8a:	e9 24 06 00 00       	jmp    22b3 <Compute+0x6d6>
          }
          int i=g_pos+1;
    1c8f:	a1 e0 43 00 00       	mov    0x43e0,%eax
    1c94:	83 c0 01             	add    $0x1,%eax
    1c97:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1c9a:	eb 13                	jmp    1caf <Compute+0xd2>
          {
            if(s[i] == '}')
    1c9c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1c9f:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca2:	01 d0                	add    %edx,%eax
    1ca4:	0f b6 00             	movzbl (%eax),%eax
    1ca7:	3c 7d                	cmp    $0x7d,%al
    1ca9:	74 0e                	je     1cb9 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1cab:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1caf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cb2:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1cb5:	7c e5                	jl     1c9c <Compute+0xbf>
    1cb7:	eb 01                	jmp    1cba <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1cb9:	90                   	nop
          }
          if(s[i] != '}')
    1cba:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1cbd:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc0:	01 d0                	add    %edx,%eax
    1cc2:	0f b6 00             	movzbl (%eax),%eax
    1cc5:	3c 7d                	cmp    $0x7d,%al
    1cc7:	74 23                	je     1cec <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1cc9:	83 ec 0c             	sub    $0xc,%esp
    1ccc:	68 22 38 00 00       	push   $0x3822
    1cd1:	6a 00                	push   $0x0
    1cd3:	6a 00                	push   $0x0
    1cd5:	6a 01                	push   $0x1
    1cd7:	6a 04                	push   $0x4
    1cd9:	e8 b2 0f 00 00       	call   2c90 <color_printf>
    1cde:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1ce1:	dd 05 70 38 00 00    	fldl   0x3870
    1ce7:	e9 c7 05 00 00       	jmp    22b3 <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1cec:	a1 e0 43 00 00       	mov    0x43e0,%eax
    1cf1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1cf4:	29 c2                	sub    %eax,%edx
    1cf6:	89 d0                	mov    %edx,%eax
    1cf8:	83 e8 01             	sub    $0x1,%eax
    1cfb:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1cfe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1d05:	eb 27                	jmp    1d2e <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1d07:	8b 15 e0 43 00 00    	mov    0x43e0,%edx
    1d0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1d10:	01 d0                	add    %edx,%eax
    1d12:	8d 50 01             	lea    0x1(%eax),%edx
    1d15:	8b 45 08             	mov    0x8(%ebp),%eax
    1d18:	01 d0                	add    %edx,%eax
    1d1a:	0f b6 00             	movzbl (%eax),%eax
    1d1d:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1d23:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1d26:	01 ca                	add    %ecx,%edx
    1d28:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1d2a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1d2e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1d31:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1d34:	7c d1                	jl     1d07 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1d36:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1d3c:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1d3f:	01 d0                	add    %edx,%eax
    1d41:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1d44:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1d4b:	a1 cc 43 00 00       	mov    0x43cc,%eax
    1d50:	85 c0                	test   %eax,%eax
    1d52:	75 40                	jne    1d94 <Compute+0x1b7>
            readVariables(variables,&v_num);
    1d54:	83 ec 08             	sub    $0x8,%esp
    1d57:	68 cc 43 00 00       	push   $0x43cc
    1d5c:	68 00 44 00 00       	push   $0x4400
    1d61:	e8 b0 13 00 00       	call   3116 <readVariables>
    1d66:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1d69:	eb 29                	jmp    1d94 <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1d6b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1d6e:	c1 e0 05             	shl    $0x5,%eax
    1d71:	05 00 44 00 00       	add    $0x4400,%eax
    1d76:	8d 50 04             	lea    0x4(%eax),%edx
    1d79:	83 ec 08             	sub    $0x8,%esp
    1d7c:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1d82:	50                   	push   %eax
    1d83:	52                   	push   %edx
    1d84:	e8 32 e3 ff ff       	call   bb <strcmp>
    1d89:	83 c4 10             	add    $0x10,%esp
    1d8c:	85 c0                	test   %eax,%eax
    1d8e:	74 10                	je     1da0 <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1d90:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1d94:	a1 cc 43 00 00       	mov    0x43cc,%eax
    1d99:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1d9c:	7c cd                	jl     1d6b <Compute+0x18e>
    1d9e:	eb 01                	jmp    1da1 <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1da0:	90                   	nop
          }
          if(index == v_num) //no such variable
    1da1:	a1 cc 43 00 00       	mov    0x43cc,%eax
    1da6:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1da9:	75 2a                	jne    1dd5 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1dab:	83 ec 08             	sub    $0x8,%esp
    1dae:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1db4:	50                   	push   %eax
    1db5:	68 30 38 00 00       	push   $0x3830
    1dba:	6a 00                	push   $0x0
    1dbc:	6a 00                	push   $0x0
    1dbe:	6a 01                	push   $0x1
    1dc0:	6a 04                	push   $0x4
    1dc2:	e8 c9 0e 00 00       	call   2c90 <color_printf>
    1dc7:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1dca:	dd 05 70 38 00 00    	fldl   0x3870
    1dd0:	e9 de 04 00 00       	jmp    22b3 <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1dd5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1dd8:	c1 e0 05             	shl    $0x5,%eax
    1ddb:	05 00 44 00 00       	add    $0x4400,%eax
    1de0:	8b 00                	mov    (%eax),%eax
    1de2:	83 f8 02             	cmp    $0x2,%eax
    1de5:	75 23                	jne    1e0a <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1de7:	83 ec 0c             	sub    $0xc,%esp
    1dea:	68 4a 38 00 00       	push   $0x384a
    1def:	6a 00                	push   $0x0
    1df1:	6a 00                	push   $0x0
    1df3:	6a 01                	push   $0x1
    1df5:	6a 04                	push   $0x4
    1df7:	e8 94 0e 00 00       	call   2c90 <color_printf>
    1dfc:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1dff:	dd 05 70 38 00 00    	fldl   0x3870
    1e05:	e9 a9 04 00 00       	jmp    22b3 <Compute+0x6d6>
          }
          g_pos = i+1;
    1e0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e0d:	83 c0 01             	add    $0x1,%eax
    1e10:	a3 e0 43 00 00       	mov    %eax,0x43e0
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    1e15:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e18:	c1 e0 05             	shl    $0x5,%eax
    1e1b:	05 10 44 00 00       	add    $0x4410,%eax
    1e20:	dd 40 08             	fldl   0x8(%eax)
    1e23:	83 ec 04             	sub    $0x4,%esp
    1e26:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e2a:	dd 1c 24             	fstpl  (%esp)
    1e2d:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e30:	e8 2f 12 00 00       	call   3064 <pushd>
    1e35:	83 c4 10             	add    $0x10,%esp
    1e38:	e9 49 03 00 00       	jmp    2186 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    1e3d:	a1 e0 43 00 00       	mov    0x43e0,%eax
    1e42:	89 c2                	mov    %eax,%edx
    1e44:	8b 45 08             	mov    0x8(%ebp),%eax
    1e47:	01 d0                	add    %edx,%eax
    1e49:	0f b6 00             	movzbl (%eax),%eax
    1e4c:	3c 2d                	cmp    $0x2d,%al
    1e4e:	75 3f                	jne    1e8f <Compute+0x2b2>
    1e50:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e54:	74 39                	je     1e8f <Compute+0x2b2>
        {
            pushd(opnd,0);
    1e56:	83 ec 04             	sub    $0x4,%esp
    1e59:	d9 ee                	fldz   
    1e5b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e5f:	dd 1c 24             	fstpl  (%esp)
    1e62:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e65:	e8 fa 11 00 00       	call   3064 <pushd>
    1e6a:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    1e6d:	83 ec 08             	sub    $0x8,%esp
    1e70:	6a 2d                	push   $0x2d
    1e72:	ff 75 e0             	pushl  -0x20(%ebp)
    1e75:	e8 1b 11 00 00       	call   2f95 <pushc>
    1e7a:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    1e7d:	a1 e0 43 00 00       	mov    0x43e0,%eax
    1e82:	83 c0 01             	add    $0x1,%eax
    1e85:	a3 e0 43 00 00       	mov    %eax,0x43e0
    1e8a:	e9 f7 02 00 00       	jmp    2186 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    1e8f:	a1 e0 43 00 00       	mov    0x43e0,%eax
    1e94:	89 c2                	mov    %eax,%edx
    1e96:	8b 45 08             	mov    0x8(%ebp),%eax
    1e99:	01 d0                	add    %edx,%eax
    1e9b:	0f b6 00             	movzbl (%eax),%eax
    1e9e:	3c 29                	cmp    $0x29,%al
    1ea0:	0f 85 01 01 00 00    	jne    1fa7 <Compute+0x3ca>
        {
            is_minus = 0;
    1ea6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    1ead:	a1 e0 43 00 00       	mov    0x43e0,%eax
    1eb2:	83 c0 01             	add    $0x1,%eax
    1eb5:	a3 e0 43 00 00       	mov    %eax,0x43e0
            while (topc(optr) != '(')
    1eba:	e9 bf 00 00 00       	jmp    1f7e <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    1ebf:	83 ec 0c             	sub    $0xc,%esp
    1ec2:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ec5:	e8 37 12 00 00       	call   3101 <topd>
    1eca:	83 c4 10             	add    $0x10,%esp
    1ecd:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    1ed0:	83 ec 0c             	sub    $0xc,%esp
    1ed3:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ed6:	e8 dd 11 00 00       	call   30b8 <popd>
    1edb:	dd d8                	fstp   %st(0)
    1edd:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    1ee0:	83 ec 0c             	sub    $0xc,%esp
    1ee3:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ee6:	e8 16 12 00 00       	call   3101 <topd>
    1eeb:	83 c4 10             	add    $0x10,%esp
    1eee:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    1ef1:	83 ec 0c             	sub    $0xc,%esp
    1ef4:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ef7:	e8 bc 11 00 00       	call   30b8 <popd>
    1efc:	dd d8                	fstp   %st(0)
    1efe:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    1f01:	83 ec 0c             	sub    $0xc,%esp
    1f04:	ff 75 e0             	pushl  -0x20(%ebp)
    1f07:	e8 11 11 00 00       	call   301d <topc>
    1f0c:	83 c4 10             	add    $0x10,%esp
    1f0f:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    1f12:	83 ec 0c             	sub    $0xc,%esp
    1f15:	ff 75 e0             	pushl  -0x20(%ebp)
    1f18:	e8 be 10 00 00       	call   2fdb <popc>
    1f1d:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    1f20:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    1f24:	83 ec 0c             	sub    $0xc,%esp
    1f27:	ff 75 d4             	pushl  -0x2c(%ebp)
    1f2a:	ff 75 d0             	pushl  -0x30(%ebp)
    1f2d:	50                   	push   %eax
    1f2e:	ff 75 cc             	pushl  -0x34(%ebp)
    1f31:	ff 75 c8             	pushl  -0x38(%ebp)
    1f34:	e8 ff fb ff ff       	call   1b38 <Operate>
    1f39:	83 c4 20             	add    $0x20,%esp
    1f3c:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    1f3f:	dd 05 70 38 00 00    	fldl   0x3870
    1f45:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1f49:	dd 1c 24             	fstpl  (%esp)
    1f4c:	ff 75 bc             	pushl  -0x44(%ebp)
    1f4f:	ff 75 b8             	pushl  -0x48(%ebp)
    1f52:	e8 0f f0 ff ff       	call   f66 <isEqual>
    1f57:	83 c4 10             	add    $0x10,%esp
    1f5a:	83 f8 01             	cmp    $0x1,%eax
    1f5d:	75 0b                	jne    1f6a <Compute+0x38d>
                  return WRONG_ANS;
    1f5f:	dd 05 70 38 00 00    	fldl   0x3870
    1f65:	e9 49 03 00 00       	jmp    22b3 <Compute+0x6d6>
                pushd(opnd,result);
    1f6a:	83 ec 04             	sub    $0x4,%esp
    1f6d:	ff 75 bc             	pushl  -0x44(%ebp)
    1f70:	ff 75 b8             	pushl  -0x48(%ebp)
    1f73:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f76:	e8 e9 10 00 00       	call   3064 <pushd>
    1f7b:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    1f7e:	83 ec 0c             	sub    $0xc,%esp
    1f81:	ff 75 e0             	pushl  -0x20(%ebp)
    1f84:	e8 94 10 00 00       	call   301d <topc>
    1f89:	83 c4 10             	add    $0x10,%esp
    1f8c:	3c 28                	cmp    $0x28,%al
    1f8e:	0f 85 2b ff ff ff    	jne    1ebf <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    1f94:	83 ec 0c             	sub    $0xc,%esp
    1f97:	ff 75 e0             	pushl  -0x20(%ebp)
    1f9a:	e8 3c 10 00 00       	call   2fdb <popc>
    1f9f:	83 c4 10             	add    $0x10,%esp
    1fa2:	e9 df 01 00 00       	jmp    2186 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    1fa7:	a1 e0 43 00 00       	mov    0x43e0,%eax
    1fac:	89 c2                	mov    %eax,%edx
    1fae:	8b 45 08             	mov    0x8(%ebp),%eax
    1fb1:	01 d0                	add    %edx,%eax
    1fb3:	0f b6 00             	movzbl (%eax),%eax
    1fb6:	3c 2f                	cmp    $0x2f,%al
    1fb8:	7e 49                	jle    2003 <Compute+0x426>
    1fba:	a1 e0 43 00 00       	mov    0x43e0,%eax
    1fbf:	89 c2                	mov    %eax,%edx
    1fc1:	8b 45 08             	mov    0x8(%ebp),%eax
    1fc4:	01 d0                	add    %edx,%eax
    1fc6:	0f b6 00             	movzbl (%eax),%eax
    1fc9:	3c 39                	cmp    $0x39,%al
    1fcb:	7f 36                	jg     2003 <Compute+0x426>
        {
            is_minus = 0;
    1fcd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    1fd4:	83 ec 08             	sub    $0x8,%esp
    1fd7:	68 e0 43 00 00       	push   $0x43e0
    1fdc:	ff 75 08             	pushl  0x8(%ebp)
    1fdf:	e8 c3 eb ff ff       	call   ba7 <Translation>
    1fe4:	83 c4 10             	add    $0x10,%esp
    1fe7:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    1fea:	83 ec 04             	sub    $0x4,%esp
    1fed:	ff 75 b4             	pushl  -0x4c(%ebp)
    1ff0:	ff 75 b0             	pushl  -0x50(%ebp)
    1ff3:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ff6:	e8 69 10 00 00       	call   3064 <pushd>
    1ffb:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    1ffe:	e9 83 01 00 00       	jmp    2186 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    2003:	a1 e0 43 00 00       	mov    0x43e0,%eax
    2008:	89 c2                	mov    %eax,%edx
    200a:	8b 45 08             	mov    0x8(%ebp),%eax
    200d:	01 d0                	add    %edx,%eax
    200f:	0f b6 00             	movzbl (%eax),%eax
    2012:	3c 28                	cmp    $0x28,%al
    2014:	0f 85 f9 00 00 00    	jne    2113 <Compute+0x536>
        {
            is_minus = 1;
    201a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    2021:	a1 e0 43 00 00       	mov    0x43e0,%eax
    2026:	89 c2                	mov    %eax,%edx
    2028:	8b 45 08             	mov    0x8(%ebp),%eax
    202b:	01 d0                	add    %edx,%eax
    202d:	0f b6 00             	movzbl (%eax),%eax
    2030:	0f be c0             	movsbl %al,%eax
    2033:	83 ec 08             	sub    $0x8,%esp
    2036:	50                   	push   %eax
    2037:	ff 75 e0             	pushl  -0x20(%ebp)
    203a:	e8 56 0f 00 00       	call   2f95 <pushc>
    203f:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2042:	a1 e0 43 00 00       	mov    0x43e0,%eax
    2047:	83 c0 01             	add    $0x1,%eax
    204a:	a3 e0 43 00 00       	mov    %eax,0x43e0
    204f:	e9 32 01 00 00       	jmp    2186 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    2054:	83 ec 0c             	sub    $0xc,%esp
    2057:	ff 75 e4             	pushl  -0x1c(%ebp)
    205a:	e8 a2 10 00 00       	call   3101 <topd>
    205f:	83 c4 10             	add    $0x10,%esp
    2062:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    2065:	83 ec 0c             	sub    $0xc,%esp
    2068:	ff 75 e4             	pushl  -0x1c(%ebp)
    206b:	e8 48 10 00 00       	call   30b8 <popd>
    2070:	dd d8                	fstp   %st(0)
    2072:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2075:	83 ec 0c             	sub    $0xc,%esp
    2078:	ff 75 e4             	pushl  -0x1c(%ebp)
    207b:	e8 81 10 00 00       	call   3101 <topd>
    2080:	83 c4 10             	add    $0x10,%esp
    2083:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    2086:	83 ec 0c             	sub    $0xc,%esp
    2089:	ff 75 e4             	pushl  -0x1c(%ebp)
    208c:	e8 27 10 00 00       	call   30b8 <popd>
    2091:	dd d8                	fstp   %st(0)
    2093:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    2096:	83 ec 0c             	sub    $0xc,%esp
    2099:	ff 75 e0             	pushl  -0x20(%ebp)
    209c:	e8 7c 0f 00 00       	call   301d <topc>
    20a1:	83 c4 10             	add    $0x10,%esp
    20a4:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    20a7:	83 ec 0c             	sub    $0xc,%esp
    20aa:	ff 75 e0             	pushl  -0x20(%ebp)
    20ad:	e8 29 0f 00 00       	call   2fdb <popc>
    20b2:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    20b5:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    20b9:	83 ec 0c             	sub    $0xc,%esp
    20bc:	ff 75 ac             	pushl  -0x54(%ebp)
    20bf:	ff 75 a8             	pushl  -0x58(%ebp)
    20c2:	50                   	push   %eax
    20c3:	ff 75 a4             	pushl  -0x5c(%ebp)
    20c6:	ff 75 a0             	pushl  -0x60(%ebp)
    20c9:	e8 6a fa ff ff       	call   1b38 <Operate>
    20ce:	83 c4 20             	add    $0x20,%esp
    20d1:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    20d4:	dd 05 70 38 00 00    	fldl   0x3870
    20da:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    20de:	dd 1c 24             	fstpl  (%esp)
    20e1:	ff 75 94             	pushl  -0x6c(%ebp)
    20e4:	ff 75 90             	pushl  -0x70(%ebp)
    20e7:	e8 7a ee ff ff       	call   f66 <isEqual>
    20ec:	83 c4 10             	add    $0x10,%esp
    20ef:	83 f8 01             	cmp    $0x1,%eax
    20f2:	75 0b                	jne    20ff <Compute+0x522>
                  return WRONG_ANS;
    20f4:	dd 05 70 38 00 00    	fldl   0x3870
    20fa:	e9 b4 01 00 00       	jmp    22b3 <Compute+0x6d6>
                pushd(opnd,result);
    20ff:	83 ec 04             	sub    $0x4,%esp
    2102:	ff 75 94             	pushl  -0x6c(%ebp)
    2105:	ff 75 90             	pushl  -0x70(%ebp)
    2108:	ff 75 e4             	pushl  -0x1c(%ebp)
    210b:	e8 54 0f 00 00       	call   3064 <pushd>
    2110:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    2113:	a1 e0 43 00 00       	mov    0x43e0,%eax
    2118:	89 c2                	mov    %eax,%edx
    211a:	8b 45 08             	mov    0x8(%ebp),%eax
    211d:	01 d0                	add    %edx,%eax
    211f:	0f b6 00             	movzbl (%eax),%eax
    2122:	0f be c0             	movsbl %al,%eax
    2125:	83 ec 0c             	sub    $0xc,%esp
    2128:	50                   	push   %eax
    2129:	e8 c6 f9 ff ff       	call   1af4 <GetLevel>
    212e:	83 c4 10             	add    $0x10,%esp
    2131:	89 c3                	mov    %eax,%ebx
    2133:	83 ec 0c             	sub    $0xc,%esp
    2136:	ff 75 e0             	pushl  -0x20(%ebp)
    2139:	e8 df 0e 00 00       	call   301d <topc>
    213e:	83 c4 10             	add    $0x10,%esp
    2141:	0f be c0             	movsbl %al,%eax
    2144:	83 ec 0c             	sub    $0xc,%esp
    2147:	50                   	push   %eax
    2148:	e8 a7 f9 ff ff       	call   1af4 <GetLevel>
    214d:	83 c4 10             	add    $0x10,%esp
    2150:	39 c3                	cmp    %eax,%ebx
    2152:	0f 8e fc fe ff ff    	jle    2054 <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    2158:	a1 e0 43 00 00       	mov    0x43e0,%eax
    215d:	89 c2                	mov    %eax,%edx
    215f:	8b 45 08             	mov    0x8(%ebp),%eax
    2162:	01 d0                	add    %edx,%eax
    2164:	0f b6 00             	movzbl (%eax),%eax
    2167:	0f be c0             	movsbl %al,%eax
    216a:	83 ec 08             	sub    $0x8,%esp
    216d:	50                   	push   %eax
    216e:	ff 75 e0             	pushl  -0x20(%ebp)
    2171:	e8 1f 0e 00 00       	call   2f95 <pushc>
    2176:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2179:	a1 e0 43 00 00       	mov    0x43e0,%eax
    217e:	83 c0 01             	add    $0x1,%eax
    2181:	a3 e0 43 00 00       	mov    %eax,0x43e0
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    2186:	a1 e0 43 00 00       	mov    0x43e0,%eax
    218b:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    218e:	0f 8c 9a fa ff ff    	jl     1c2e <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2194:	e9 da 00 00 00       	jmp    2273 <Compute+0x696>
    {
        double a2 = topd(opnd);
    2199:	83 ec 0c             	sub    $0xc,%esp
    219c:	ff 75 e4             	pushl  -0x1c(%ebp)
    219f:	e8 5d 0f 00 00       	call   3101 <topd>
    21a4:	83 c4 10             	add    $0x10,%esp
    21a7:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    21aa:	83 ec 0c             	sub    $0xc,%esp
    21ad:	ff 75 e4             	pushl  -0x1c(%ebp)
    21b0:	e8 03 0f 00 00       	call   30b8 <popd>
    21b5:	dd d8                	fstp   %st(0)
    21b7:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    21ba:	83 ec 0c             	sub    $0xc,%esp
    21bd:	ff 75 e4             	pushl  -0x1c(%ebp)
    21c0:	e8 3c 0f 00 00       	call   3101 <topd>
    21c5:	83 c4 10             	add    $0x10,%esp
    21c8:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    21ce:	83 ec 0c             	sub    $0xc,%esp
    21d1:	ff 75 e4             	pushl  -0x1c(%ebp)
    21d4:	e8 df 0e 00 00       	call   30b8 <popd>
    21d9:	dd d8                	fstp   %st(0)
    21db:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    21de:	83 ec 0c             	sub    $0xc,%esp
    21e1:	ff 75 e0             	pushl  -0x20(%ebp)
    21e4:	e8 34 0e 00 00       	call   301d <topc>
    21e9:	83 c4 10             	add    $0x10,%esp
    21ec:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    21f2:	83 ec 0c             	sub    $0xc,%esp
    21f5:	ff 75 e0             	pushl  -0x20(%ebp)
    21f8:	e8 de 0d 00 00       	call   2fdb <popc>
    21fd:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    2200:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    2207:	83 ec 0c             	sub    $0xc,%esp
    220a:	ff 75 84             	pushl  -0x7c(%ebp)
    220d:	ff 75 80             	pushl  -0x80(%ebp)
    2210:	50                   	push   %eax
    2211:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    2217:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    221d:	e8 16 f9 ff ff       	call   1b38 <Operate>
    2222:	83 c4 20             	add    $0x20,%esp
    2225:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    222b:	dd 05 70 38 00 00    	fldl   0x3870
    2231:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2235:	dd 1c 24             	fstpl  (%esp)
    2238:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    223e:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2244:	e8 1d ed ff ff       	call   f66 <isEqual>
    2249:	83 c4 10             	add    $0x10,%esp
    224c:	83 f8 01             	cmp    $0x1,%eax
    224f:	75 08                	jne    2259 <Compute+0x67c>
          return WRONG_ANS;
    2251:	dd 05 70 38 00 00    	fldl   0x3870
    2257:	eb 5a                	jmp    22b3 <Compute+0x6d6>
        pushd(opnd,result);
    2259:	83 ec 04             	sub    $0x4,%esp
    225c:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2262:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2268:	ff 75 e4             	pushl  -0x1c(%ebp)
    226b:	e8 f4 0d 00 00       	call   3064 <pushd>
    2270:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2273:	83 ec 0c             	sub    $0xc,%esp
    2276:	ff 75 e0             	pushl  -0x20(%ebp)
    2279:	e8 9f 0d 00 00       	call   301d <topc>
    227e:	83 c4 10             	add    $0x10,%esp
    2281:	3c 23                	cmp    $0x23,%al
    2283:	0f 85 10 ff ff ff    	jne    2199 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    2289:	83 ec 0c             	sub    $0xc,%esp
    228c:	ff 75 e4             	pushl  -0x1c(%ebp)
    228f:	e8 94 e4 ff ff       	call   728 <free>
    2294:	83 c4 10             	add    $0x10,%esp
    free(optr);
    2297:	83 ec 0c             	sub    $0xc,%esp
    229a:	ff 75 e0             	pushl  -0x20(%ebp)
    229d:	e8 86 e4 ff ff       	call   728 <free>
    22a2:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    22a5:	83 ec 0c             	sub    $0xc,%esp
    22a8:	ff 75 e4             	pushl  -0x1c(%ebp)
    22ab:	e8 51 0e 00 00       	call   3101 <topd>
    22b0:	83 c4 10             	add    $0x10,%esp
}
    22b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    22b6:	c9                   	leave  
    22b7:	c3                   	ret    

000022b8 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    22b8:	55                   	push   %ebp
    22b9:	89 e5                	mov    %esp,%ebp
    22bb:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    22be:	8b 45 08             	mov    0x8(%ebp),%eax
    22c1:	8b 00                	mov    (%eax),%eax
    22c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    22c6:	eb 04                	jmp    22cc <gettoken+0x14>
    s++;
    22c8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    22cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22cf:	3b 45 0c             	cmp    0xc(%ebp),%eax
    22d2:	73 1e                	jae    22f2 <gettoken+0x3a>
    22d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22d7:	0f b6 00             	movzbl (%eax),%eax
    22da:	0f be c0             	movsbl %al,%eax
    22dd:	83 ec 08             	sub    $0x8,%esp
    22e0:	50                   	push   %eax
    22e1:	68 94 43 00 00       	push   $0x4394
    22e6:	e8 50 de ff ff       	call   13b <strchr>
    22eb:	83 c4 10             	add    $0x10,%esp
    22ee:	85 c0                	test   %eax,%eax
    22f0:	75 d6                	jne    22c8 <gettoken+0x10>
    s++;
  if(q)
    22f2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    22f6:	74 08                	je     2300 <gettoken+0x48>
    *q = s;
    22f8:	8b 45 10             	mov    0x10(%ebp),%eax
    22fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    22fe:	89 10                	mov    %edx,(%eax)
  ret = *s;
    2300:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2303:	0f b6 00             	movzbl (%eax),%eax
    2306:	0f be c0             	movsbl %al,%eax
    2309:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    230c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    230f:	0f b6 00             	movzbl (%eax),%eax
    2312:	0f be c0             	movsbl %al,%eax
    2315:	83 f8 29             	cmp    $0x29,%eax
    2318:	7f 14                	jg     232e <gettoken+0x76>
    231a:	83 f8 28             	cmp    $0x28,%eax
    231d:	7d 28                	jge    2347 <gettoken+0x8f>
    231f:	85 c0                	test   %eax,%eax
    2321:	0f 84 94 00 00 00    	je     23bb <gettoken+0x103>
    2327:	83 f8 26             	cmp    $0x26,%eax
    232a:	74 1b                	je     2347 <gettoken+0x8f>
    232c:	eb 3a                	jmp    2368 <gettoken+0xb0>
    232e:	83 f8 3e             	cmp    $0x3e,%eax
    2331:	74 1a                	je     234d <gettoken+0x95>
    2333:	83 f8 3e             	cmp    $0x3e,%eax
    2336:	7f 0a                	jg     2342 <gettoken+0x8a>
    2338:	83 e8 3b             	sub    $0x3b,%eax
    233b:	83 f8 01             	cmp    $0x1,%eax
    233e:	77 28                	ja     2368 <gettoken+0xb0>
    2340:	eb 05                	jmp    2347 <gettoken+0x8f>
    2342:	83 f8 7c             	cmp    $0x7c,%eax
    2345:	75 21                	jne    2368 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    2347:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    234b:	eb 75                	jmp    23c2 <gettoken+0x10a>
  case '>':
    s++;
    234d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    2351:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2354:	0f b6 00             	movzbl (%eax),%eax
    2357:	3c 3e                	cmp    $0x3e,%al
    2359:	75 63                	jne    23be <gettoken+0x106>
      ret = '+';
    235b:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    2362:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    2366:	eb 56                	jmp    23be <gettoken+0x106>
  default:
    ret = 'a';
    2368:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    236f:	eb 04                	jmp    2375 <gettoken+0xbd>
      s++;
    2371:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2375:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2378:	3b 45 0c             	cmp    0xc(%ebp),%eax
    237b:	73 44                	jae    23c1 <gettoken+0x109>
    237d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2380:	0f b6 00             	movzbl (%eax),%eax
    2383:	0f be c0             	movsbl %al,%eax
    2386:	83 ec 08             	sub    $0x8,%esp
    2389:	50                   	push   %eax
    238a:	68 94 43 00 00       	push   $0x4394
    238f:	e8 a7 dd ff ff       	call   13b <strchr>
    2394:	83 c4 10             	add    $0x10,%esp
    2397:	85 c0                	test   %eax,%eax
    2399:	75 26                	jne    23c1 <gettoken+0x109>
    239b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    239e:	0f b6 00             	movzbl (%eax),%eax
    23a1:	0f be c0             	movsbl %al,%eax
    23a4:	83 ec 08             	sub    $0x8,%esp
    23a7:	50                   	push   %eax
    23a8:	68 9c 43 00 00       	push   $0x439c
    23ad:	e8 89 dd ff ff       	call   13b <strchr>
    23b2:	83 c4 10             	add    $0x10,%esp
    23b5:	85 c0                	test   %eax,%eax
    23b7:	74 b8                	je     2371 <gettoken+0xb9>
      s++;
    break;
    23b9:	eb 06                	jmp    23c1 <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    23bb:	90                   	nop
    23bc:	eb 04                	jmp    23c2 <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    23be:	90                   	nop
    23bf:	eb 01                	jmp    23c2 <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    23c1:	90                   	nop
  }
  if(eq)
    23c2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    23c6:	74 0e                	je     23d6 <gettoken+0x11e>
    *eq = s;
    23c8:	8b 45 14             	mov    0x14(%ebp),%eax
    23cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    23ce:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    23d0:	eb 04                	jmp    23d6 <gettoken+0x11e>
    s++;
    23d2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    23d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23d9:	3b 45 0c             	cmp    0xc(%ebp),%eax
    23dc:	73 1e                	jae    23fc <gettoken+0x144>
    23de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23e1:	0f b6 00             	movzbl (%eax),%eax
    23e4:	0f be c0             	movsbl %al,%eax
    23e7:	83 ec 08             	sub    $0x8,%esp
    23ea:	50                   	push   %eax
    23eb:	68 94 43 00 00       	push   $0x4394
    23f0:	e8 46 dd ff ff       	call   13b <strchr>
    23f5:	83 c4 10             	add    $0x10,%esp
    23f8:	85 c0                	test   %eax,%eax
    23fa:	75 d6                	jne    23d2 <gettoken+0x11a>
    s++;
  *ps = s;
    23fc:	8b 45 08             	mov    0x8(%ebp),%eax
    23ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2402:	89 10                	mov    %edx,(%eax)
  return ret;
    2404:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2407:	c9                   	leave  
    2408:	c3                   	ret    

00002409 <peek>:

int peek(char **ps, char *es, char *toks)
{
    2409:	55                   	push   %ebp
    240a:	89 e5                	mov    %esp,%ebp
    240c:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    240f:	8b 45 08             	mov    0x8(%ebp),%eax
    2412:	8b 00                	mov    (%eax),%eax
    2414:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2417:	eb 04                	jmp    241d <peek+0x14>
    s++;
    2419:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    241d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2420:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2423:	73 1e                	jae    2443 <peek+0x3a>
    2425:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2428:	0f b6 00             	movzbl (%eax),%eax
    242b:	0f be c0             	movsbl %al,%eax
    242e:	83 ec 08             	sub    $0x8,%esp
    2431:	50                   	push   %eax
    2432:	68 94 43 00 00       	push   $0x4394
    2437:	e8 ff dc ff ff       	call   13b <strchr>
    243c:	83 c4 10             	add    $0x10,%esp
    243f:	85 c0                	test   %eax,%eax
    2441:	75 d6                	jne    2419 <peek+0x10>
    s++;
  *ps = s;
    2443:	8b 45 08             	mov    0x8(%ebp),%eax
    2446:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2449:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    244b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    244e:	0f b6 00             	movzbl (%eax),%eax
    2451:	84 c0                	test   %al,%al
    2453:	74 23                	je     2478 <peek+0x6f>
    2455:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2458:	0f b6 00             	movzbl (%eax),%eax
    245b:	0f be c0             	movsbl %al,%eax
    245e:	83 ec 08             	sub    $0x8,%esp
    2461:	50                   	push   %eax
    2462:	ff 75 10             	pushl  0x10(%ebp)
    2465:	e8 d1 dc ff ff       	call   13b <strchr>
    246a:	83 c4 10             	add    $0x10,%esp
    246d:	85 c0                	test   %eax,%eax
    246f:	74 07                	je     2478 <peek+0x6f>
    2471:	b8 01 00 00 00       	mov    $0x1,%eax
    2476:	eb 05                	jmp    247d <peek+0x74>
    2478:	b8 00 00 00 00       	mov    $0x0,%eax
}
    247d:	c9                   	leave  
    247e:	c3                   	ret    

0000247f <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    247f:	55                   	push   %ebp
    2480:	89 e5                	mov    %esp,%ebp
    2482:	53                   	push   %ebx
    2483:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    2486:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2489:	8b 45 08             	mov    0x8(%ebp),%eax
    248c:	83 ec 0c             	sub    $0xc,%esp
    248f:	50                   	push   %eax
    2490:	e8 65 dc ff ff       	call   fa <strlen>
    2495:	83 c4 10             	add    $0x10,%esp
    2498:	01 d8                	add    %ebx,%eax
    249a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    249d:	8b 45 08             	mov    0x8(%ebp),%eax
    24a0:	0f b6 00             	movzbl (%eax),%eax
    24a3:	3c 25                	cmp    $0x25,%al
    24a5:	75 5d                	jne    2504 <parsecmd+0x85>
  {
    int len = strlen(s);
    24a7:	8b 45 08             	mov    0x8(%ebp),%eax
    24aa:	83 ec 0c             	sub    $0xc,%esp
    24ad:	50                   	push   %eax
    24ae:	e8 47 dc ff ff       	call   fa <strlen>
    24b3:	83 c4 10             	add    $0x10,%esp
    24b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    24b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24bc:	83 ec 0c             	sub    $0xc,%esp
    24bf:	50                   	push   %eax
    24c0:	e8 a5 e3 ff ff       	call   86a <malloc>
    24c5:	83 c4 10             	add    $0x10,%esp
    24c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    24cb:	8b 45 08             	mov    0x8(%ebp),%eax
    24ce:	83 c0 01             	add    $0x1,%eax
    24d1:	83 ec 08             	sub    $0x8,%esp
    24d4:	50                   	push   %eax
    24d5:	ff 75 ec             	pushl  -0x14(%ebp)
    24d8:	e8 ae db ff ff       	call   8b <strcpy>
    24dd:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    24e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24e3:	8d 50 fe             	lea    -0x2(%eax),%edx
    24e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24e9:	01 d0                	add    %edx,%eax
    24eb:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    24ee:	83 ec 0c             	sub    $0xc,%esp
    24f1:	ff 75 ec             	pushl  -0x14(%ebp)
    24f4:	e8 59 e9 ff ff       	call   e52 <calcmd>
    24f9:	83 c4 10             	add    $0x10,%esp
    24fc:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    24ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2502:	eb 6b                	jmp    256f <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    2504:	83 ec 08             	sub    $0x8,%esp
    2507:	ff 75 f4             	pushl  -0xc(%ebp)
    250a:	8d 45 08             	lea    0x8(%ebp),%eax
    250d:	50                   	push   %eax
    250e:	e8 61 00 00 00       	call   2574 <parseline>
    2513:	83 c4 10             	add    $0x10,%esp
    2516:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    2519:	83 ec 04             	sub    $0x4,%esp
    251c:	68 78 38 00 00       	push   $0x3878
    2521:	ff 75 f4             	pushl  -0xc(%ebp)
    2524:	8d 45 08             	lea    0x8(%ebp),%eax
    2527:	50                   	push   %eax
    2528:	e8 dc fe ff ff       	call   2409 <peek>
    252d:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    2530:	8b 45 08             	mov    0x8(%ebp),%eax
    2533:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2536:	74 26                	je     255e <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    2538:	8b 45 08             	mov    0x8(%ebp),%eax
    253b:	83 ec 04             	sub    $0x4,%esp
    253e:	50                   	push   %eax
    253f:	68 79 38 00 00       	push   $0x3879
    2544:	6a 02                	push   $0x2
    2546:	e8 1d e0 ff ff       	call   568 <printf>
    254b:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    254e:	83 ec 0c             	sub    $0xc,%esp
    2551:	68 88 38 00 00       	push   $0x3888
    2556:	e8 f2 e3 ff ff       	call   94d <panic1>
    255b:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    255e:	83 ec 0c             	sub    $0xc,%esp
    2561:	ff 75 e4             	pushl  -0x1c(%ebp)
    2564:	e8 eb 03 00 00       	call   2954 <nulterminate>
    2569:	83 c4 10             	add    $0x10,%esp
  return cmd;
    256c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    256f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2572:	c9                   	leave  
    2573:	c3                   	ret    

00002574 <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    2574:	55                   	push   %ebp
    2575:	89 e5                	mov    %esp,%ebp
    2577:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    257a:	83 ec 08             	sub    $0x8,%esp
    257d:	ff 75 0c             	pushl  0xc(%ebp)
    2580:	ff 75 08             	pushl  0x8(%ebp)
    2583:	e8 99 00 00 00       	call   2621 <parsepipe>
    2588:	83 c4 10             	add    $0x10,%esp
    258b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    258e:	eb 23                	jmp    25b3 <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    2590:	6a 00                	push   $0x0
    2592:	6a 00                	push   $0x0
    2594:	ff 75 0c             	pushl  0xc(%ebp)
    2597:	ff 75 08             	pushl  0x8(%ebp)
    259a:	e8 19 fd ff ff       	call   22b8 <gettoken>
    259f:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    25a2:	83 ec 0c             	sub    $0xc,%esp
    25a5:	ff 75 f4             	pushl  -0xc(%ebp)
    25a8:	e8 66 e8 ff ff       	call   e13 <backcmd>
    25ad:	83 c4 10             	add    $0x10,%esp
    25b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    25b3:	83 ec 04             	sub    $0x4,%esp
    25b6:	68 8f 38 00 00       	push   $0x388f
    25bb:	ff 75 0c             	pushl  0xc(%ebp)
    25be:	ff 75 08             	pushl  0x8(%ebp)
    25c1:	e8 43 fe ff ff       	call   2409 <peek>
    25c6:	83 c4 10             	add    $0x10,%esp
    25c9:	85 c0                	test   %eax,%eax
    25cb:	75 c3                	jne    2590 <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    25cd:	83 ec 04             	sub    $0x4,%esp
    25d0:	68 91 38 00 00       	push   $0x3891
    25d5:	ff 75 0c             	pushl  0xc(%ebp)
    25d8:	ff 75 08             	pushl  0x8(%ebp)
    25db:	e8 29 fe ff ff       	call   2409 <peek>
    25e0:	83 c4 10             	add    $0x10,%esp
    25e3:	85 c0                	test   %eax,%eax
    25e5:	74 35                	je     261c <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    25e7:	6a 00                	push   $0x0
    25e9:	6a 00                	push   $0x0
    25eb:	ff 75 0c             	pushl  0xc(%ebp)
    25ee:	ff 75 08             	pushl  0x8(%ebp)
    25f1:	e8 c2 fc ff ff       	call   22b8 <gettoken>
    25f6:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    25f9:	83 ec 08             	sub    $0x8,%esp
    25fc:	ff 75 0c             	pushl  0xc(%ebp)
    25ff:	ff 75 08             	pushl  0x8(%ebp)
    2602:	e8 6d ff ff ff       	call   2574 <parseline>
    2607:	83 c4 10             	add    $0x10,%esp
    260a:	83 ec 08             	sub    $0x8,%esp
    260d:	50                   	push   %eax
    260e:	ff 75 f4             	pushl  -0xc(%ebp)
    2611:	e8 b5 e7 ff ff       	call   dcb <listcmd>
    2616:	83 c4 10             	add    $0x10,%esp
    2619:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    261c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    261f:	c9                   	leave  
    2620:	c3                   	ret    

00002621 <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    2621:	55                   	push   %ebp
    2622:	89 e5                	mov    %esp,%ebp
    2624:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    2627:	83 ec 08             	sub    $0x8,%esp
    262a:	ff 75 0c             	pushl  0xc(%ebp)
    262d:	ff 75 08             	pushl  0x8(%ebp)
    2630:	e8 ec 01 00 00       	call   2821 <parseexec>
    2635:	83 c4 10             	add    $0x10,%esp
    2638:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    263b:	83 ec 04             	sub    $0x4,%esp
    263e:	68 93 38 00 00       	push   $0x3893
    2643:	ff 75 0c             	pushl  0xc(%ebp)
    2646:	ff 75 08             	pushl  0x8(%ebp)
    2649:	e8 bb fd ff ff       	call   2409 <peek>
    264e:	83 c4 10             	add    $0x10,%esp
    2651:	85 c0                	test   %eax,%eax
    2653:	74 35                	je     268a <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2655:	6a 00                	push   $0x0
    2657:	6a 00                	push   $0x0
    2659:	ff 75 0c             	pushl  0xc(%ebp)
    265c:	ff 75 08             	pushl  0x8(%ebp)
    265f:	e8 54 fc ff ff       	call   22b8 <gettoken>
    2664:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2667:	83 ec 08             	sub    $0x8,%esp
    266a:	ff 75 0c             	pushl  0xc(%ebp)
    266d:	ff 75 08             	pushl  0x8(%ebp)
    2670:	e8 ac ff ff ff       	call   2621 <parsepipe>
    2675:	83 c4 10             	add    $0x10,%esp
    2678:	83 ec 08             	sub    $0x8,%esp
    267b:	50                   	push   %eax
    267c:	ff 75 f4             	pushl  -0xc(%ebp)
    267f:	e8 ff e6 ff ff       	call   d83 <pipecmd>
    2684:	83 c4 10             	add    $0x10,%esp
    2687:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    268a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    268d:	c9                   	leave  
    268e:	c3                   	ret    

0000268f <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    268f:	55                   	push   %ebp
    2690:	89 e5                	mov    %esp,%ebp
    2692:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2695:	e9 b6 00 00 00       	jmp    2750 <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    269a:	6a 00                	push   $0x0
    269c:	6a 00                	push   $0x0
    269e:	ff 75 10             	pushl  0x10(%ebp)
    26a1:	ff 75 0c             	pushl  0xc(%ebp)
    26a4:	e8 0f fc ff ff       	call   22b8 <gettoken>
    26a9:	83 c4 10             	add    $0x10,%esp
    26ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    26af:	8d 45 ec             	lea    -0x14(%ebp),%eax
    26b2:	50                   	push   %eax
    26b3:	8d 45 f0             	lea    -0x10(%ebp),%eax
    26b6:	50                   	push   %eax
    26b7:	ff 75 10             	pushl  0x10(%ebp)
    26ba:	ff 75 0c             	pushl  0xc(%ebp)
    26bd:	e8 f6 fb ff ff       	call   22b8 <gettoken>
    26c2:	83 c4 10             	add    $0x10,%esp
    26c5:	83 f8 61             	cmp    $0x61,%eax
    26c8:	74 10                	je     26da <parseredirs+0x4b>
      panic1("missing file for redirection");
    26ca:	83 ec 0c             	sub    $0xc,%esp
    26cd:	68 95 38 00 00       	push   $0x3895
    26d2:	e8 76 e2 ff ff       	call   94d <panic1>
    26d7:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    26da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26dd:	83 f8 3c             	cmp    $0x3c,%eax
    26e0:	74 0c                	je     26ee <parseredirs+0x5f>
    26e2:	83 f8 3e             	cmp    $0x3e,%eax
    26e5:	74 26                	je     270d <parseredirs+0x7e>
    26e7:	83 f8 2b             	cmp    $0x2b,%eax
    26ea:	74 43                	je     272f <parseredirs+0xa0>
    26ec:	eb 62                	jmp    2750 <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    26ee:	8b 55 ec             	mov    -0x14(%ebp),%edx
    26f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    26f4:	83 ec 0c             	sub    $0xc,%esp
    26f7:	6a 00                	push   $0x0
    26f9:	6a 00                	push   $0x0
    26fb:	52                   	push   %edx
    26fc:	50                   	push   %eax
    26fd:	ff 75 08             	pushl  0x8(%ebp)
    2700:	e8 1b e6 ff ff       	call   d20 <redircmd>
    2705:	83 c4 20             	add    $0x20,%esp
    2708:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    270b:	eb 43                	jmp    2750 <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    270d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2710:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2713:	83 ec 0c             	sub    $0xc,%esp
    2716:	6a 01                	push   $0x1
    2718:	68 01 02 00 00       	push   $0x201
    271d:	52                   	push   %edx
    271e:	50                   	push   %eax
    271f:	ff 75 08             	pushl  0x8(%ebp)
    2722:	e8 f9 e5 ff ff       	call   d20 <redircmd>
    2727:	83 c4 20             	add    $0x20,%esp
    272a:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    272d:	eb 21                	jmp    2750 <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    272f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2732:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2735:	83 ec 0c             	sub    $0xc,%esp
    2738:	6a 01                	push   $0x1
    273a:	68 01 02 00 00       	push   $0x201
    273f:	52                   	push   %edx
    2740:	50                   	push   %eax
    2741:	ff 75 08             	pushl  0x8(%ebp)
    2744:	e8 d7 e5 ff ff       	call   d20 <redircmd>
    2749:	83 c4 20             	add    $0x20,%esp
    274c:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    274f:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2750:	83 ec 04             	sub    $0x4,%esp
    2753:	68 b2 38 00 00       	push   $0x38b2
    2758:	ff 75 10             	pushl  0x10(%ebp)
    275b:	ff 75 0c             	pushl  0xc(%ebp)
    275e:	e8 a6 fc ff ff       	call   2409 <peek>
    2763:	83 c4 10             	add    $0x10,%esp
    2766:	85 c0                	test   %eax,%eax
    2768:	0f 85 2c ff ff ff    	jne    269a <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    276e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2771:	c9                   	leave  
    2772:	c3                   	ret    

00002773 <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    2773:	55                   	push   %ebp
    2774:	89 e5                	mov    %esp,%ebp
    2776:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2779:	83 ec 04             	sub    $0x4,%esp
    277c:	68 b5 38 00 00       	push   $0x38b5
    2781:	ff 75 0c             	pushl  0xc(%ebp)
    2784:	ff 75 08             	pushl  0x8(%ebp)
    2787:	e8 7d fc ff ff       	call   2409 <peek>
    278c:	83 c4 10             	add    $0x10,%esp
    278f:	85 c0                	test   %eax,%eax
    2791:	75 10                	jne    27a3 <parseblock+0x30>
    panic1("parseblock");
    2793:	83 ec 0c             	sub    $0xc,%esp
    2796:	68 b7 38 00 00       	push   $0x38b7
    279b:	e8 ad e1 ff ff       	call   94d <panic1>
    27a0:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    27a3:	6a 00                	push   $0x0
    27a5:	6a 00                	push   $0x0
    27a7:	ff 75 0c             	pushl  0xc(%ebp)
    27aa:	ff 75 08             	pushl  0x8(%ebp)
    27ad:	e8 06 fb ff ff       	call   22b8 <gettoken>
    27b2:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    27b5:	83 ec 08             	sub    $0x8,%esp
    27b8:	ff 75 0c             	pushl  0xc(%ebp)
    27bb:	ff 75 08             	pushl  0x8(%ebp)
    27be:	e8 b1 fd ff ff       	call   2574 <parseline>
    27c3:	83 c4 10             	add    $0x10,%esp
    27c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    27c9:	83 ec 04             	sub    $0x4,%esp
    27cc:	68 c2 38 00 00       	push   $0x38c2
    27d1:	ff 75 0c             	pushl  0xc(%ebp)
    27d4:	ff 75 08             	pushl  0x8(%ebp)
    27d7:	e8 2d fc ff ff       	call   2409 <peek>
    27dc:	83 c4 10             	add    $0x10,%esp
    27df:	85 c0                	test   %eax,%eax
    27e1:	75 10                	jne    27f3 <parseblock+0x80>
    panic1("syntax - missing )");
    27e3:	83 ec 0c             	sub    $0xc,%esp
    27e6:	68 c4 38 00 00       	push   $0x38c4
    27eb:	e8 5d e1 ff ff       	call   94d <panic1>
    27f0:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    27f3:	6a 00                	push   $0x0
    27f5:	6a 00                	push   $0x0
    27f7:	ff 75 0c             	pushl  0xc(%ebp)
    27fa:	ff 75 08             	pushl  0x8(%ebp)
    27fd:	e8 b6 fa ff ff       	call   22b8 <gettoken>
    2802:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    2805:	83 ec 04             	sub    $0x4,%esp
    2808:	ff 75 0c             	pushl  0xc(%ebp)
    280b:	ff 75 08             	pushl  0x8(%ebp)
    280e:	ff 75 f4             	pushl  -0xc(%ebp)
    2811:	e8 79 fe ff ff       	call   268f <parseredirs>
    2816:	83 c4 10             	add    $0x10,%esp
    2819:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    281c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    281f:	c9                   	leave  
    2820:	c3                   	ret    

00002821 <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    2821:	55                   	push   %ebp
    2822:	89 e5                	mov    %esp,%ebp
    2824:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    2827:	83 ec 04             	sub    $0x4,%esp
    282a:	68 b5 38 00 00       	push   $0x38b5
    282f:	ff 75 0c             	pushl  0xc(%ebp)
    2832:	ff 75 08             	pushl  0x8(%ebp)
    2835:	e8 cf fb ff ff       	call   2409 <peek>
    283a:	83 c4 10             	add    $0x10,%esp
    283d:	85 c0                	test   %eax,%eax
    283f:	74 16                	je     2857 <parseexec+0x36>
    return parseblock(ps, es);
    2841:	83 ec 08             	sub    $0x8,%esp
    2844:	ff 75 0c             	pushl  0xc(%ebp)
    2847:	ff 75 08             	pushl  0x8(%ebp)
    284a:	e8 24 ff ff ff       	call   2773 <parseblock>
    284f:	83 c4 10             	add    $0x10,%esp
    2852:	e9 fb 00 00 00       	jmp    2952 <parseexec+0x131>

  ret = execcmd();
    2857:	e8 8e e4 ff ff       	call   cea <execcmd>
    285c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    285f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2862:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2865:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    286c:	83 ec 04             	sub    $0x4,%esp
    286f:	ff 75 0c             	pushl  0xc(%ebp)
    2872:	ff 75 08             	pushl  0x8(%ebp)
    2875:	ff 75 f0             	pushl  -0x10(%ebp)
    2878:	e8 12 fe ff ff       	call   268f <parseredirs>
    287d:	83 c4 10             	add    $0x10,%esp
    2880:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    2883:	e9 87 00 00 00       	jmp    290f <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2888:	8d 45 e0             	lea    -0x20(%ebp),%eax
    288b:	50                   	push   %eax
    288c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    288f:	50                   	push   %eax
    2890:	ff 75 0c             	pushl  0xc(%ebp)
    2893:	ff 75 08             	pushl  0x8(%ebp)
    2896:	e8 1d fa ff ff       	call   22b8 <gettoken>
    289b:	83 c4 10             	add    $0x10,%esp
    289e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    28a1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    28a5:	0f 84 84 00 00 00    	je     292f <parseexec+0x10e>
      break;
    if(tok != 'a')
    28ab:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    28af:	74 10                	je     28c1 <parseexec+0xa0>
      panic1("syntax");
    28b1:	83 ec 0c             	sub    $0xc,%esp
    28b4:	68 88 38 00 00       	push   $0x3888
    28b9:	e8 8f e0 ff ff       	call   94d <panic1>
    28be:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    28c1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    28c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    28c7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    28ca:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    28ce:	8b 55 e0             	mov    -0x20(%ebp),%edx
    28d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    28d4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    28d7:	83 c1 08             	add    $0x8,%ecx
    28da:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    28de:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    28e2:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    28e6:	7e 10                	jle    28f8 <parseexec+0xd7>
      panic1("too many args");
    28e8:	83 ec 0c             	sub    $0xc,%esp
    28eb:	68 d7 38 00 00       	push   $0x38d7
    28f0:	e8 58 e0 ff ff       	call   94d <panic1>
    28f5:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    28f8:	83 ec 04             	sub    $0x4,%esp
    28fb:	ff 75 0c             	pushl  0xc(%ebp)
    28fe:	ff 75 08             	pushl  0x8(%ebp)
    2901:	ff 75 f0             	pushl  -0x10(%ebp)
    2904:	e8 86 fd ff ff       	call   268f <parseredirs>
    2909:	83 c4 10             	add    $0x10,%esp
    290c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    290f:	83 ec 04             	sub    $0x4,%esp
    2912:	68 e5 38 00 00       	push   $0x38e5
    2917:	ff 75 0c             	pushl  0xc(%ebp)
    291a:	ff 75 08             	pushl  0x8(%ebp)
    291d:	e8 e7 fa ff ff       	call   2409 <peek>
    2922:	83 c4 10             	add    $0x10,%esp
    2925:	85 c0                	test   %eax,%eax
    2927:	0f 84 5b ff ff ff    	je     2888 <parseexec+0x67>
    292d:	eb 01                	jmp    2930 <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    292f:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    2930:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2933:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2936:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    293d:	00 
  cmd->eargv[argc] = 0;
    293e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2941:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2944:	83 c2 08             	add    $0x8,%edx
    2947:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    294e:	00 
  return ret;
    294f:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2952:	c9                   	leave  
    2953:	c3                   	ret    

00002954 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2954:	55                   	push   %ebp
    2955:	89 e5                	mov    %esp,%ebp
    2957:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    295a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    295e:	75 0a                	jne    296a <nulterminate+0x16>
    return 0;
    2960:	b8 00 00 00 00       	mov    $0x0,%eax
    2965:	e9 e4 00 00 00       	jmp    2a4e <nulterminate+0xfa>
  
  switch(cmd->type){
    296a:	8b 45 08             	mov    0x8(%ebp),%eax
    296d:	8b 00                	mov    (%eax),%eax
    296f:	83 f8 05             	cmp    $0x5,%eax
    2972:	0f 87 d3 00 00 00    	ja     2a4b <nulterminate+0xf7>
    2978:	8b 04 85 ec 38 00 00 	mov    0x38ec(,%eax,4),%eax
    297f:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2981:	8b 45 08             	mov    0x8(%ebp),%eax
    2984:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2987:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    298e:	eb 14                	jmp    29a4 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2990:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2993:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2996:	83 c2 08             	add    $0x8,%edx
    2999:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    299d:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    29a0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    29a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29aa:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    29ae:	85 c0                	test   %eax,%eax
    29b0:	75 de                	jne    2990 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    29b2:	e9 94 00 00 00       	jmp    2a4b <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    29b7:	8b 45 08             	mov    0x8(%ebp),%eax
    29ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    29bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29c0:	8b 40 04             	mov    0x4(%eax),%eax
    29c3:	83 ec 0c             	sub    $0xc,%esp
    29c6:	50                   	push   %eax
    29c7:	e8 88 ff ff ff       	call   2954 <nulterminate>
    29cc:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    29cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29d2:	8b 40 0c             	mov    0xc(%eax),%eax
    29d5:	c6 00 00             	movb   $0x0,(%eax)
    break;
    29d8:	eb 71                	jmp    2a4b <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    29da:	8b 45 08             	mov    0x8(%ebp),%eax
    29dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    29e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    29e3:	8b 40 04             	mov    0x4(%eax),%eax
    29e6:	83 ec 0c             	sub    $0xc,%esp
    29e9:	50                   	push   %eax
    29ea:	e8 65 ff ff ff       	call   2954 <nulterminate>
    29ef:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    29f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    29f5:	8b 40 08             	mov    0x8(%eax),%eax
    29f8:	83 ec 0c             	sub    $0xc,%esp
    29fb:	50                   	push   %eax
    29fc:	e8 53 ff ff ff       	call   2954 <nulterminate>
    2a01:	83 c4 10             	add    $0x10,%esp
    break;
    2a04:	eb 45                	jmp    2a4b <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2a06:	8b 45 08             	mov    0x8(%ebp),%eax
    2a09:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2a0c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2a0f:	8b 40 04             	mov    0x4(%eax),%eax
    2a12:	83 ec 0c             	sub    $0xc,%esp
    2a15:	50                   	push   %eax
    2a16:	e8 39 ff ff ff       	call   2954 <nulterminate>
    2a1b:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2a1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2a21:	8b 40 08             	mov    0x8(%eax),%eax
    2a24:	83 ec 0c             	sub    $0xc,%esp
    2a27:	50                   	push   %eax
    2a28:	e8 27 ff ff ff       	call   2954 <nulterminate>
    2a2d:	83 c4 10             	add    $0x10,%esp
    break;
    2a30:	eb 19                	jmp    2a4b <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2a32:	8b 45 08             	mov    0x8(%ebp),%eax
    2a35:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2a38:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2a3b:	8b 40 04             	mov    0x4(%eax),%eax
    2a3e:	83 ec 0c             	sub    $0xc,%esp
    2a41:	50                   	push   %eax
    2a42:	e8 0d ff ff ff       	call   2954 <nulterminate>
    2a47:	83 c4 10             	add    $0x10,%esp
    break;
    2a4a:	90                   	nop
  }
  return cmd;
    2a4b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2a4e:	c9                   	leave  
    2a4f:	c3                   	ret    

00002a50 <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2a50:	55                   	push   %ebp
    2a51:	89 e5                	mov    %esp,%ebp
    2a53:	83 ec 18             	sub    $0x18,%esp
    2a56:	8b 45 08             	mov    0x8(%ebp),%eax
    2a59:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2a5c:	83 ec 08             	sub    $0x8,%esp
    2a5f:	ff 75 18             	pushl  0x18(%ebp)
    2a62:	ff 75 14             	pushl  0x14(%ebp)
    2a65:	ff 75 10             	pushl  0x10(%ebp)
    2a68:	ff 75 0c             	pushl  0xc(%ebp)
    2a6b:	6a 01                	push   $0x1
    2a6d:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2a70:	50                   	push   %eax
    2a71:	e8 e6 d8 ff ff       	call   35c <colorwrite>
    2a76:	83 c4 20             	add    $0x20,%esp
}
    2a79:	90                   	nop
    2a7a:	c9                   	leave  
    2a7b:	c3                   	ret    

00002a7c <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2a7c:	55                   	push   %ebp
    2a7d:	89 e5                	mov    %esp,%ebp
    2a7f:	53                   	push   %ebx
    2a80:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2a83:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2a8a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2a8e:	74 17                	je     2aa7 <color_printint+0x2b>
    2a90:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2a94:	79 11                	jns    2aa7 <color_printint+0x2b>
    neg = 1;
    2a96:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2a9d:	8b 45 08             	mov    0x8(%ebp),%eax
    2aa0:	f7 d8                	neg    %eax
    2aa2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2aa5:	eb 06                	jmp    2aad <color_printint+0x31>
  } else {
    x = xx;
    2aa7:	8b 45 08             	mov    0x8(%ebp),%eax
    2aaa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2aad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2ab4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2ab7:	8d 41 01             	lea    0x1(%ecx),%eax
    2aba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2abd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2ac0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ac3:	ba 00 00 00 00       	mov    $0x0,%edx
    2ac8:	f7 f3                	div    %ebx
    2aca:	89 d0                	mov    %edx,%eax
    2acc:	0f b6 80 a4 43 00 00 	movzbl 0x43a4(%eax),%eax
    2ad3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2ad7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2ada:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2add:	ba 00 00 00 00       	mov    $0x0,%edx
    2ae2:	f7 f3                	div    %ebx
    2ae4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2ae7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2aeb:	75 c7                	jne    2ab4 <color_printint+0x38>
  if(neg)
    2aed:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2af1:	74 36                	je     2b29 <color_printint+0xad>
    buf[i++] = '-';
    2af3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2af6:	8d 50 01             	lea    0x1(%eax),%edx
    2af9:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2afc:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2b01:	eb 26                	jmp    2b29 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2b03:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2b06:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b09:	01 d0                	add    %edx,%eax
    2b0b:	0f b6 00             	movzbl (%eax),%eax
    2b0e:	0f be c0             	movsbl %al,%eax
    2b11:	83 ec 0c             	sub    $0xc,%esp
    2b14:	ff 75 20             	pushl  0x20(%ebp)
    2b17:	ff 75 1c             	pushl  0x1c(%ebp)
    2b1a:	ff 75 18             	pushl  0x18(%ebp)
    2b1d:	ff 75 14             	pushl  0x14(%ebp)
    2b20:	50                   	push   %eax
    2b21:	e8 2a ff ff ff       	call   2a50 <color_putc>
    2b26:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2b29:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2b2d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b31:	79 d0                	jns    2b03 <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2b33:	90                   	nop
    2b34:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b37:	c9                   	leave  
    2b38:	c3                   	ret    

00002b39 <getInteger>:

static int getInteger(double num)
{
    2b39:	55                   	push   %ebp
    2b3a:	89 e5                	mov    %esp,%ebp
    2b3c:	83 ec 18             	sub    $0x18,%esp
    2b3f:	8b 45 08             	mov    0x8(%ebp),%eax
    2b42:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2b45:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b48:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2b4b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2b52:	eb 0e                	jmp    2b62 <getInteger+0x29>
  {
    num -= 1;
    2b54:	dd 45 e8             	fldl   -0x18(%ebp)
    2b57:	d9 e8                	fld1   
    2b59:	de e9                	fsubrp %st,%st(1)
    2b5b:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2b5e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2b62:	dd 45 e8             	fldl   -0x18(%ebp)
    2b65:	d9 e8                	fld1   
    2b67:	d9 c9                	fxch   %st(1)
    2b69:	df e9                	fucomip %st(1),%st
    2b6b:	dd d8                	fstp   %st(0)
    2b6d:	77 e5                	ja     2b54 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2b6f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2b72:	c9                   	leave  
    2b73:	c3                   	ret    

00002b74 <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2b74:	55                   	push   %ebp
    2b75:	89 e5                	mov    %esp,%ebp
    2b77:	83 ec 28             	sub    $0x28,%esp
    2b7a:	8b 45 08             	mov    0x8(%ebp),%eax
    2b7d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2b80:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b83:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2b86:	d9 ee                	fldz   
    2b88:	dd 45 e0             	fldl   -0x20(%ebp)
    2b8b:	d9 c9                	fxch   %st(1)
    2b8d:	df e9                	fucomip %st(1),%st
    2b8f:	dd d8                	fstp   %st(0)
    2b91:	76 21                	jbe    2bb4 <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2b93:	83 ec 0c             	sub    $0xc,%esp
    2b96:	ff 75 1c             	pushl  0x1c(%ebp)
    2b99:	ff 75 18             	pushl  0x18(%ebp)
    2b9c:	ff 75 14             	pushl  0x14(%ebp)
    2b9f:	ff 75 10             	pushl  0x10(%ebp)
    2ba2:	6a 2d                	push   $0x2d
    2ba4:	e8 a7 fe ff ff       	call   2a50 <color_putc>
    2ba9:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2bac:	dd 45 e0             	fldl   -0x20(%ebp)
    2baf:	d9 e0                	fchs   
    2bb1:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2bb4:	83 ec 08             	sub    $0x8,%esp
    2bb7:	ff 75 e4             	pushl  -0x1c(%ebp)
    2bba:	ff 75 e0             	pushl  -0x20(%ebp)
    2bbd:	e8 77 ff ff ff       	call   2b39 <getInteger>
    2bc2:	83 c4 10             	add    $0x10,%esp
    2bc5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2bc8:	83 ec 04             	sub    $0x4,%esp
    2bcb:	ff 75 1c             	pushl  0x1c(%ebp)
    2bce:	ff 75 18             	pushl  0x18(%ebp)
    2bd1:	ff 75 14             	pushl  0x14(%ebp)
    2bd4:	ff 75 10             	pushl  0x10(%ebp)
    2bd7:	6a 01                	push   $0x1
    2bd9:	6a 0a                	push   $0xa
    2bdb:	ff 75 f0             	pushl  -0x10(%ebp)
    2bde:	e8 99 fe ff ff       	call   2a7c <color_printint>
    2be3:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2be6:	db 45 f0             	fildl  -0x10(%ebp)
    2be9:	dd 45 e0             	fldl   -0x20(%ebp)
    2bec:	de e1                	fsubp  %st,%st(1)
    2bee:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2bf1:	dd 45 e0             	fldl   -0x20(%ebp)
    2bf4:	dd 05 10 39 00 00    	fldl   0x3910
    2bfa:	d9 c9                	fxch   %st(1)
    2bfc:	df e9                	fucomip %st(1),%st
    2bfe:	dd d8                	fstp   %st(0)
    2c00:	76 19                	jbe    2c1b <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2c02:	83 ec 0c             	sub    $0xc,%esp
    2c05:	ff 75 1c             	pushl  0x1c(%ebp)
    2c08:	ff 75 18             	pushl  0x18(%ebp)
    2c0b:	ff 75 14             	pushl  0x14(%ebp)
    2c0e:	ff 75 10             	pushl  0x10(%ebp)
    2c11:	6a 2e                	push   $0x2e
    2c13:	e8 38 fe ff ff       	call   2a50 <color_putc>
    2c18:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2c1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2c22:	eb 55                	jmp    2c79 <color_printdbl+0x105>
  {
    num = num*10;
    2c24:	dd 45 e0             	fldl   -0x20(%ebp)
    2c27:	dd 05 18 39 00 00    	fldl   0x3918
    2c2d:	de c9                	fmulp  %st,%st(1)
    2c2f:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2c32:	83 ec 08             	sub    $0x8,%esp
    2c35:	ff 75 e4             	pushl  -0x1c(%ebp)
    2c38:	ff 75 e0             	pushl  -0x20(%ebp)
    2c3b:	e8 f9 fe ff ff       	call   2b39 <getInteger>
    2c40:	83 c4 10             	add    $0x10,%esp
    2c43:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2c46:	83 ec 04             	sub    $0x4,%esp
    2c49:	ff 75 1c             	pushl  0x1c(%ebp)
    2c4c:	ff 75 18             	pushl  0x18(%ebp)
    2c4f:	ff 75 14             	pushl  0x14(%ebp)
    2c52:	ff 75 10             	pushl  0x10(%ebp)
    2c55:	6a 01                	push   $0x1
    2c57:	6a 0a                	push   $0xa
    2c59:	ff 75 f0             	pushl  -0x10(%ebp)
    2c5c:	e8 1b fe ff ff       	call   2a7c <color_printint>
    2c61:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2c64:	db 45 f0             	fildl  -0x10(%ebp)
    2c67:	dd 45 e0             	fldl   -0x20(%ebp)
    2c6a:	de e1                	fsubp  %st,%st(1)
    2c6c:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2c6f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2c73:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2c77:	7f 13                	jg     2c8c <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2c79:	dd 45 e0             	fldl   -0x20(%ebp)
    2c7c:	dd 05 10 39 00 00    	fldl   0x3910
    2c82:	d9 c9                	fxch   %st(1)
    2c84:	df e9                	fucomip %st(1),%st
    2c86:	dd d8                	fstp   %st(0)
    2c88:	77 9a                	ja     2c24 <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2c8a:	eb 01                	jmp    2c8d <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2c8c:	90                   	nop
    }
  }
}
    2c8d:	90                   	nop
    2c8e:	c9                   	leave  
    2c8f:	c3                   	ret    

00002c90 <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2c90:	55                   	push   %ebp
    2c91:	89 e5                	mov    %esp,%ebp
    2c93:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2c96:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2c9d:	8d 45 18             	lea    0x18(%ebp),%eax
    2ca0:	83 c0 04             	add    $0x4,%eax
    2ca3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2ca6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2cad:	e9 e2 01 00 00       	jmp    2e94 <color_printf+0x204>
    c = fmt[i] & 0xff;
    2cb2:	8b 55 18             	mov    0x18(%ebp),%edx
    2cb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2cb8:	01 d0                	add    %edx,%eax
    2cba:	0f b6 00             	movzbl (%eax),%eax
    2cbd:	0f be c0             	movsbl %al,%eax
    2cc0:	25 ff 00 00 00       	and    $0xff,%eax
    2cc5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2cc8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2ccc:	75 35                	jne    2d03 <color_printf+0x73>
      if(c == '%'){
    2cce:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2cd2:	75 0c                	jne    2ce0 <color_printf+0x50>
        state = '%';
    2cd4:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2cdb:	e9 b0 01 00 00       	jmp    2e90 <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2ce0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ce3:	0f be c0             	movsbl %al,%eax
    2ce6:	83 ec 0c             	sub    $0xc,%esp
    2ce9:	ff 75 14             	pushl  0x14(%ebp)
    2cec:	ff 75 10             	pushl  0x10(%ebp)
    2cef:	ff 75 0c             	pushl  0xc(%ebp)
    2cf2:	ff 75 08             	pushl  0x8(%ebp)
    2cf5:	50                   	push   %eax
    2cf6:	e8 55 fd ff ff       	call   2a50 <color_putc>
    2cfb:	83 c4 20             	add    $0x20,%esp
    2cfe:	e9 8d 01 00 00       	jmp    2e90 <color_printf+0x200>
      }
    } else if(state == '%'){
    2d03:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2d07:	0f 85 83 01 00 00    	jne    2e90 <color_printf+0x200>
      if(c == 'd'){
    2d0d:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2d11:	75 2a                	jne    2d3d <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2d13:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d16:	8b 00                	mov    (%eax),%eax
    2d18:	83 ec 04             	sub    $0x4,%esp
    2d1b:	ff 75 14             	pushl  0x14(%ebp)
    2d1e:	ff 75 10             	pushl  0x10(%ebp)
    2d21:	ff 75 0c             	pushl  0xc(%ebp)
    2d24:	ff 75 08             	pushl  0x8(%ebp)
    2d27:	6a 01                	push   $0x1
    2d29:	6a 0a                	push   $0xa
    2d2b:	50                   	push   %eax
    2d2c:	e8 4b fd ff ff       	call   2a7c <color_printint>
    2d31:	83 c4 20             	add    $0x20,%esp
        ap++;
    2d34:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2d38:	e9 4c 01 00 00       	jmp    2e89 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2d3d:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2d41:	74 06                	je     2d49 <color_printf+0xb9>
    2d43:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2d47:	75 2a                	jne    2d73 <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2d49:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d4c:	8b 00                	mov    (%eax),%eax
    2d4e:	83 ec 04             	sub    $0x4,%esp
    2d51:	ff 75 14             	pushl  0x14(%ebp)
    2d54:	ff 75 10             	pushl  0x10(%ebp)
    2d57:	ff 75 0c             	pushl  0xc(%ebp)
    2d5a:	ff 75 08             	pushl  0x8(%ebp)
    2d5d:	6a 00                	push   $0x0
    2d5f:	6a 10                	push   $0x10
    2d61:	50                   	push   %eax
    2d62:	e8 15 fd ff ff       	call   2a7c <color_printint>
    2d67:	83 c4 20             	add    $0x20,%esp
        ap++;
    2d6a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2d6e:	e9 16 01 00 00       	jmp    2e89 <color_printf+0x1f9>
      } else if(c == 's'){
    2d73:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2d77:	75 4f                	jne    2dc8 <color_printf+0x138>
        s = (char*)*ap;
    2d79:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d7c:	8b 00                	mov    (%eax),%eax
    2d7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2d81:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2d85:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2d89:	75 2e                	jne    2db9 <color_printf+0x129>
          s = "(null)";
    2d8b:	c7 45 f4 08 39 00 00 	movl   $0x3908,-0xc(%ebp)
        while(*s != 0){
    2d92:	eb 25                	jmp    2db9 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2d94:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d97:	0f b6 00             	movzbl (%eax),%eax
    2d9a:	0f be c0             	movsbl %al,%eax
    2d9d:	83 ec 0c             	sub    $0xc,%esp
    2da0:	ff 75 14             	pushl  0x14(%ebp)
    2da3:	ff 75 10             	pushl  0x10(%ebp)
    2da6:	ff 75 0c             	pushl  0xc(%ebp)
    2da9:	ff 75 08             	pushl  0x8(%ebp)
    2dac:	50                   	push   %eax
    2dad:	e8 9e fc ff ff       	call   2a50 <color_putc>
    2db2:	83 c4 20             	add    $0x20,%esp
          s++;
    2db5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2db9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dbc:	0f b6 00             	movzbl (%eax),%eax
    2dbf:	84 c0                	test   %al,%al
    2dc1:	75 d1                	jne    2d94 <color_printf+0x104>
    2dc3:	e9 c1 00 00 00       	jmp    2e89 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2dc8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2dcc:	75 29                	jne    2df7 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2dce:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2dd1:	8b 00                	mov    (%eax),%eax
    2dd3:	0f be c0             	movsbl %al,%eax
    2dd6:	83 ec 0c             	sub    $0xc,%esp
    2dd9:	ff 75 14             	pushl  0x14(%ebp)
    2ddc:	ff 75 10             	pushl  0x10(%ebp)
    2ddf:	ff 75 0c             	pushl  0xc(%ebp)
    2de2:	ff 75 08             	pushl  0x8(%ebp)
    2de5:	50                   	push   %eax
    2de6:	e8 65 fc ff ff       	call   2a50 <color_putc>
    2deb:	83 c4 20             	add    $0x20,%esp
        ap++;
    2dee:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2df2:	e9 92 00 00 00       	jmp    2e89 <color_printf+0x1f9>
      } else if(c == '%'){
    2df7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2dfb:	75 20                	jne    2e1d <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2dfd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e00:	0f be c0             	movsbl %al,%eax
    2e03:	83 ec 0c             	sub    $0xc,%esp
    2e06:	ff 75 14             	pushl  0x14(%ebp)
    2e09:	ff 75 10             	pushl  0x10(%ebp)
    2e0c:	ff 75 0c             	pushl  0xc(%ebp)
    2e0f:	ff 75 08             	pushl  0x8(%ebp)
    2e12:	50                   	push   %eax
    2e13:	e8 38 fc ff ff       	call   2a50 <color_putc>
    2e18:	83 c4 20             	add    $0x20,%esp
    2e1b:	eb 6c                	jmp    2e89 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    2e1d:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    2e21:	75 2f                	jne    2e52 <color_printf+0x1c2>
        double *dap = (double*)ap;
    2e23:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e26:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    2e29:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2e2c:	dd 00                	fldl   (%eax)
    2e2e:	83 ec 08             	sub    $0x8,%esp
    2e31:	ff 75 14             	pushl  0x14(%ebp)
    2e34:	ff 75 10             	pushl  0x10(%ebp)
    2e37:	ff 75 0c             	pushl  0xc(%ebp)
    2e3a:	ff 75 08             	pushl  0x8(%ebp)
    2e3d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2e41:	dd 1c 24             	fstpl  (%esp)
    2e44:	e8 2b fd ff ff       	call   2b74 <color_printdbl>
    2e49:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    2e4c:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    2e50:	eb 37                	jmp    2e89 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    2e52:	83 ec 0c             	sub    $0xc,%esp
    2e55:	ff 75 14             	pushl  0x14(%ebp)
    2e58:	ff 75 10             	pushl  0x10(%ebp)
    2e5b:	ff 75 0c             	pushl  0xc(%ebp)
    2e5e:	ff 75 08             	pushl  0x8(%ebp)
    2e61:	6a 25                	push   $0x25
    2e63:	e8 e8 fb ff ff       	call   2a50 <color_putc>
    2e68:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    2e6b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e6e:	0f be c0             	movsbl %al,%eax
    2e71:	83 ec 0c             	sub    $0xc,%esp
    2e74:	ff 75 14             	pushl  0x14(%ebp)
    2e77:	ff 75 10             	pushl  0x10(%ebp)
    2e7a:	ff 75 0c             	pushl  0xc(%ebp)
    2e7d:	ff 75 08             	pushl  0x8(%ebp)
    2e80:	50                   	push   %eax
    2e81:	e8 ca fb ff ff       	call   2a50 <color_putc>
    2e86:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    2e89:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2e90:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2e94:	8b 55 18             	mov    0x18(%ebp),%edx
    2e97:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e9a:	01 d0                	add    %edx,%eax
    2e9c:	0f b6 00             	movzbl (%eax),%eax
    2e9f:	84 c0                	test   %al,%al
    2ea1:	0f 85 0b fe ff ff    	jne    2cb2 <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    2ea7:	90                   	nop
    2ea8:	c9                   	leave  
    2ea9:	c3                   	ret    

00002eaa <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    2eaa:	55                   	push   %ebp
    2eab:	89 e5                	mov    %esp,%ebp
    2ead:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    2eb0:	83 ec 0c             	sub    $0xc,%esp
    2eb3:	6a 58                	push   $0x58
    2eb5:	e8 b0 d9 ff ff       	call   86a <malloc>
    2eba:	83 c4 10             	add    $0x10,%esp
    2ebd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2ec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ec3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2ec9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ecc:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    2ed3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2ed6:	c9                   	leave  
    2ed7:	c3                   	ret    

00002ed8 <pushi>:

void pushi(struct istack *s, int val)
{
    2ed8:	55                   	push   %ebp
    2ed9:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    2edb:	8b 45 08             	mov    0x8(%ebp),%eax
    2ede:	8b 00                	mov    (%eax),%eax
    2ee0:	83 f8 13             	cmp    $0x13,%eax
    2ee3:	7f 2c                	jg     2f11 <pushi+0x39>
    {
        s->size++;
    2ee5:	8b 45 08             	mov    0x8(%ebp),%eax
    2ee8:	8b 00                	mov    (%eax),%eax
    2eea:	8d 50 01             	lea    0x1(%eax),%edx
    2eed:	8b 45 08             	mov    0x8(%ebp),%eax
    2ef0:	89 10                	mov    %edx,(%eax)
        s->top++;
    2ef2:	8b 45 08             	mov    0x8(%ebp),%eax
    2ef5:	8b 40 54             	mov    0x54(%eax),%eax
    2ef8:	8d 50 01             	lea    0x1(%eax),%edx
    2efb:	8b 45 08             	mov    0x8(%ebp),%eax
    2efe:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    2f01:	8b 45 08             	mov    0x8(%ebp),%eax
    2f04:	8b 50 54             	mov    0x54(%eax),%edx
    2f07:	8b 45 08             	mov    0x8(%ebp),%eax
    2f0a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2f0d:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    2f11:	90                   	nop
    2f12:	5d                   	pop    %ebp
    2f13:	c3                   	ret    

00002f14 <popi>:

int popi(struct istack *s)
{
    2f14:	55                   	push   %ebp
    2f15:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2f17:	8b 45 08             	mov    0x8(%ebp),%eax
    2f1a:	8b 00                	mov    (%eax),%eax
    2f1c:	85 c0                	test   %eax,%eax
    2f1e:	75 07                	jne    2f27 <popi+0x13>
    {
        return -1;
    2f20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2f25:	eb 2c                	jmp    2f53 <popi+0x3f>
    }
    s->size--;
    2f27:	8b 45 08             	mov    0x8(%ebp),%eax
    2f2a:	8b 00                	mov    (%eax),%eax
    2f2c:	8d 50 ff             	lea    -0x1(%eax),%edx
    2f2f:	8b 45 08             	mov    0x8(%ebp),%eax
    2f32:	89 10                	mov    %edx,(%eax)
    s->top--;
    2f34:	8b 45 08             	mov    0x8(%ebp),%eax
    2f37:	8b 40 54             	mov    0x54(%eax),%eax
    2f3a:	8d 50 ff             	lea    -0x1(%eax),%edx
    2f3d:	8b 45 08             	mov    0x8(%ebp),%eax
    2f40:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    2f43:	8b 45 08             	mov    0x8(%ebp),%eax
    2f46:	8b 40 54             	mov    0x54(%eax),%eax
    2f49:	8d 50 01             	lea    0x1(%eax),%edx
    2f4c:	8b 45 08             	mov    0x8(%ebp),%eax
    2f4f:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2f53:	5d                   	pop    %ebp
    2f54:	c3                   	ret    

00002f55 <topi>:

int topi(struct istack* s)
{
    2f55:	55                   	push   %ebp
    2f56:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    2f58:	8b 45 08             	mov    0x8(%ebp),%eax
    2f5b:	8b 50 54             	mov    0x54(%eax),%edx
    2f5e:	8b 45 08             	mov    0x8(%ebp),%eax
    2f61:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2f65:	5d                   	pop    %ebp
    2f66:	c3                   	ret    

00002f67 <cstack>:

//constructor
struct cstack* cstack()
{
    2f67:	55                   	push   %ebp
    2f68:	89 e5                	mov    %esp,%ebp
    2f6a:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    2f6d:	83 ec 0c             	sub    $0xc,%esp
    2f70:	6a 1c                	push   $0x1c
    2f72:	e8 f3 d8 ff ff       	call   86a <malloc>
    2f77:	83 c4 10             	add    $0x10,%esp
    2f7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2f7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f80:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2f86:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f89:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    2f90:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2f93:	c9                   	leave  
    2f94:	c3                   	ret    

00002f95 <pushc>:

void pushc(struct cstack *s, char val)
{
    2f95:	55                   	push   %ebp
    2f96:	89 e5                	mov    %esp,%ebp
    2f98:	83 ec 04             	sub    $0x4,%esp
    2f9b:	8b 45 0c             	mov    0xc(%ebp),%eax
    2f9e:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    2fa1:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa4:	8b 00                	mov    (%eax),%eax
    2fa6:	83 f8 13             	cmp    $0x13,%eax
    2fa9:	7f 2d                	jg     2fd8 <pushc+0x43>
    {
        s->size++;
    2fab:	8b 45 08             	mov    0x8(%ebp),%eax
    2fae:	8b 00                	mov    (%eax),%eax
    2fb0:	8d 50 01             	lea    0x1(%eax),%edx
    2fb3:	8b 45 08             	mov    0x8(%ebp),%eax
    2fb6:	89 10                	mov    %edx,(%eax)
        s->top++;
    2fb8:	8b 45 08             	mov    0x8(%ebp),%eax
    2fbb:	8b 40 18             	mov    0x18(%eax),%eax
    2fbe:	8d 50 01             	lea    0x1(%eax),%edx
    2fc1:	8b 45 08             	mov    0x8(%ebp),%eax
    2fc4:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    2fc7:	8b 45 08             	mov    0x8(%ebp),%eax
    2fca:	8b 40 18             	mov    0x18(%eax),%eax
    2fcd:	8b 55 08             	mov    0x8(%ebp),%edx
    2fd0:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    2fd4:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    2fd8:	90                   	nop
    2fd9:	c9                   	leave  
    2fda:	c3                   	ret    

00002fdb <popc>:

char popc(struct cstack *s)
{
    2fdb:	55                   	push   %ebp
    2fdc:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2fde:	8b 45 08             	mov    0x8(%ebp),%eax
    2fe1:	8b 00                	mov    (%eax),%eax
    2fe3:	85 c0                	test   %eax,%eax
    2fe5:	75 07                	jne    2fee <popc+0x13>
    {
        return -1;
    2fe7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2fec:	eb 2d                	jmp    301b <popc+0x40>
    }
    s->size--;
    2fee:	8b 45 08             	mov    0x8(%ebp),%eax
    2ff1:	8b 00                	mov    (%eax),%eax
    2ff3:	8d 50 ff             	lea    -0x1(%eax),%edx
    2ff6:	8b 45 08             	mov    0x8(%ebp),%eax
    2ff9:	89 10                	mov    %edx,(%eax)
    s->top--;
    2ffb:	8b 45 08             	mov    0x8(%ebp),%eax
    2ffe:	8b 40 18             	mov    0x18(%eax),%eax
    3001:	8d 50 ff             	lea    -0x1(%eax),%edx
    3004:	8b 45 08             	mov    0x8(%ebp),%eax
    3007:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    300a:	8b 45 08             	mov    0x8(%ebp),%eax
    300d:	8b 40 18             	mov    0x18(%eax),%eax
    3010:	8d 50 01             	lea    0x1(%eax),%edx
    3013:	8b 45 08             	mov    0x8(%ebp),%eax
    3016:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    301b:	5d                   	pop    %ebp
    301c:	c3                   	ret    

0000301d <topc>:

char topc(struct cstack* s)
{
    301d:	55                   	push   %ebp
    301e:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3020:	8b 45 08             	mov    0x8(%ebp),%eax
    3023:	8b 40 18             	mov    0x18(%eax),%eax
    3026:	8b 55 08             	mov    0x8(%ebp),%edx
    3029:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    302e:	5d                   	pop    %ebp
    302f:	c3                   	ret    

00003030 <dstack>:

//constructor
struct dstack* dstack()
{
    3030:	55                   	push   %ebp
    3031:	89 e5                	mov    %esp,%ebp
    3033:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    3036:	83 ec 0c             	sub    $0xc,%esp
    3039:	68 a8 00 00 00       	push   $0xa8
    303e:	e8 27 d8 ff ff       	call   86a <malloc>
    3043:	83 c4 10             	add    $0x10,%esp
    3046:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3049:	8b 45 f4             	mov    -0xc(%ebp),%eax
    304c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3052:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3055:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    305c:	ff ff ff 
    return stack;
    305f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3062:	c9                   	leave  
    3063:	c3                   	ret    

00003064 <pushd>:

void pushd(struct dstack *s, double val)
{
    3064:	55                   	push   %ebp
    3065:	89 e5                	mov    %esp,%ebp
    3067:	83 ec 08             	sub    $0x8,%esp
    306a:	8b 45 0c             	mov    0xc(%ebp),%eax
    306d:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3070:	8b 45 10             	mov    0x10(%ebp),%eax
    3073:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3076:	8b 45 08             	mov    0x8(%ebp),%eax
    3079:	8b 00                	mov    (%eax),%eax
    307b:	83 f8 13             	cmp    $0x13,%eax
    307e:	7f 35                	jg     30b5 <pushd+0x51>
    {
        s->size++;
    3080:	8b 45 08             	mov    0x8(%ebp),%eax
    3083:	8b 00                	mov    (%eax),%eax
    3085:	8d 50 01             	lea    0x1(%eax),%edx
    3088:	8b 45 08             	mov    0x8(%ebp),%eax
    308b:	89 10                	mov    %edx,(%eax)
        s->top++;
    308d:	8b 45 08             	mov    0x8(%ebp),%eax
    3090:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3096:	8d 50 01             	lea    0x1(%eax),%edx
    3099:	8b 45 08             	mov    0x8(%ebp),%eax
    309c:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    30a2:	8b 45 08             	mov    0x8(%ebp),%eax
    30a5:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    30ab:	8b 45 08             	mov    0x8(%ebp),%eax
    30ae:	dd 45 f8             	fldl   -0x8(%ebp)
    30b1:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    30b5:	90                   	nop
    30b6:	c9                   	leave  
    30b7:	c3                   	ret    

000030b8 <popd>:

double popd(struct dstack *s)
{
    30b8:	55                   	push   %ebp
    30b9:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    30bb:	8b 45 08             	mov    0x8(%ebp),%eax
    30be:	8b 00                	mov    (%eax),%eax
    30c0:	85 c0                	test   %eax,%eax
    30c2:	75 06                	jne    30ca <popd+0x12>
    {
        return -1;
    30c4:	d9 e8                	fld1   
    30c6:	d9 e0                	fchs   
    30c8:	eb 35                	jmp    30ff <popd+0x47>
    }
    s->size--;
    30ca:	8b 45 08             	mov    0x8(%ebp),%eax
    30cd:	8b 00                	mov    (%eax),%eax
    30cf:	8d 50 ff             	lea    -0x1(%eax),%edx
    30d2:	8b 45 08             	mov    0x8(%ebp),%eax
    30d5:	89 10                	mov    %edx,(%eax)
    s->top--;
    30d7:	8b 45 08             	mov    0x8(%ebp),%eax
    30da:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    30e0:	8d 50 ff             	lea    -0x1(%eax),%edx
    30e3:	8b 45 08             	mov    0x8(%ebp),%eax
    30e6:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    30ec:	8b 45 08             	mov    0x8(%ebp),%eax
    30ef:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    30f5:	8d 50 01             	lea    0x1(%eax),%edx
    30f8:	8b 45 08             	mov    0x8(%ebp),%eax
    30fb:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    30ff:	5d                   	pop    %ebp
    3100:	c3                   	ret    

00003101 <topd>:

double topd(struct dstack* s)
{
    3101:	55                   	push   %ebp
    3102:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3104:	8b 45 08             	mov    0x8(%ebp),%eax
    3107:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    310d:	8b 45 08             	mov    0x8(%ebp),%eax
    3110:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    3114:	5d                   	pop    %ebp
    3115:	c3                   	ret    

00003116 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3116:	55                   	push   %ebp
    3117:	89 e5                	mov    %esp,%ebp
    3119:	53                   	push   %ebx
    311a:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    3120:	83 ec 08             	sub    $0x8,%esp
    3123:	6a 00                	push   $0x0
    3125:	68 20 39 00 00       	push   $0x3920
    312a:	e8 cd d1 ff ff       	call   2fc <open>
    312f:	83 c4 10             	add    $0x10,%esp
    3132:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3135:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3139:	79 1d                	jns    3158 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    313b:	83 ec 0c             	sub    $0xc,%esp
    313e:	68 2a 39 00 00       	push   $0x392a
    3143:	6a 00                	push   $0x0
    3145:	6a 00                	push   $0x0
    3147:	6a 01                	push   $0x1
    3149:	6a 03                	push   $0x3
    314b:	e8 40 fb ff ff       	call   2c90 <color_printf>
    3150:	83 c4 20             	add    $0x20,%esp
    3153:	e9 6d 02 00 00       	jmp    33c5 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    3158:	8b 45 0c             	mov    0xc(%ebp),%eax
    315b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    3161:	e9 2a 02 00 00       	jmp    3390 <readVariables+0x27a>
  {
    int pos = 0;
    3166:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    316d:	00 00 00 
    while(pos <= n-1)
    3170:	e9 07 02 00 00       	jmp    337c <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    3175:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    317c:	eb 24                	jmp    31a2 <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    317e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3181:	8d 50 ff             	lea    -0x1(%eax),%edx
    3184:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    318a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    318d:	01 c8                	add    %ecx,%eax
    318f:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3196:	ff 
    3197:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    319e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    31a2:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    31a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31ab:	01 d0                	add    %edx,%eax
    31ad:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    31b4:	ff 
    31b5:	3c 3d                	cmp    $0x3d,%al
    31b7:	75 c5                	jne    317e <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    31b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31bc:	83 e8 01             	sub    $0x1,%eax
    31bf:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    31c6:	00 
      if(buf[pos] == 'd') //double value
    31c7:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    31cd:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    31d4:	ff 
    31d5:	3c 64                	cmp    $0x64,%al
    31d7:	0f 85 a0 00 00 00    	jne    327d <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    31dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    31e0:	8b 00                	mov    (%eax),%eax
    31e2:	c1 e0 05             	shl    $0x5,%eax
    31e5:	89 c2                	mov    %eax,%edx
    31e7:	8b 45 08             	mov    0x8(%ebp),%eax
    31ea:	01 d0                	add    %edx,%eax
    31ec:	8d 50 04             	lea    0x4(%eax),%edx
    31ef:	83 ec 08             	sub    $0x8,%esp
    31f2:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    31f8:	50                   	push   %eax
    31f9:	52                   	push   %edx
    31fa:	e8 8c ce ff ff       	call   8b <strcpy>
    31ff:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    3202:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3205:	8d 50 01             	lea    0x1(%eax),%edx
    3208:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    320e:	01 d0                	add    %edx,%eax
    3210:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    3216:	83 ec 08             	sub    $0x8,%esp
    3219:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    321f:	50                   	push   %eax
    3220:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3226:	50                   	push   %eax
    3227:	e8 7b d9 ff ff       	call   ba7 <Translation>
    322c:	83 c4 10             	add    $0x10,%esp
    322f:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    3232:	8b 45 0c             	mov    0xc(%ebp),%eax
    3235:	8b 00                	mov    (%eax),%eax
    3237:	c1 e0 05             	shl    $0x5,%eax
    323a:	89 c2                	mov    %eax,%edx
    323c:	8b 45 08             	mov    0x8(%ebp),%eax
    323f:	01 d0                	add    %edx,%eax
    3241:	dd 45 d8             	fldl   -0x28(%ebp)
    3244:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    3247:	8b 45 0c             	mov    0xc(%ebp),%eax
    324a:	8b 00                	mov    (%eax),%eax
    324c:	c1 e0 05             	shl    $0x5,%eax
    324f:	89 c2                	mov    %eax,%edx
    3251:	8b 45 08             	mov    0x8(%ebp),%eax
    3254:	01 d0                	add    %edx,%eax
    3256:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    325c:	8b 45 0c             	mov    0xc(%ebp),%eax
    325f:	8b 00                	mov    (%eax),%eax
    3261:	8d 50 01             	lea    0x1(%eax),%edx
    3264:	8b 45 0c             	mov    0xc(%ebp),%eax
    3267:	89 10                	mov    %edx,(%eax)
        pos++;
    3269:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    326f:	83 c0 01             	add    $0x1,%eax
    3272:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    3278:	e9 ff 00 00 00       	jmp    337c <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    327d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3280:	8b 00                	mov    (%eax),%eax
    3282:	c1 e0 05             	shl    $0x5,%eax
    3285:	89 c2                	mov    %eax,%edx
    3287:	8b 45 08             	mov    0x8(%ebp),%eax
    328a:	01 d0                	add    %edx,%eax
    328c:	8d 50 04             	lea    0x4(%eax),%edx
    328f:	83 ec 08             	sub    $0x8,%esp
    3292:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3298:	50                   	push   %eax
    3299:	52                   	push   %edx
    329a:	e8 ec cd ff ff       	call   8b <strcpy>
    329f:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    32a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32a5:	8d 50 01             	lea    0x1(%eax),%edx
    32a8:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32ae:	01 d0                	add    %edx,%eax
    32b0:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    32b6:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    32bf:	eb 04                	jmp    32c5 <readVariables+0x1af>
        {
          strend++;
    32c1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    32c5:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    32cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32ce:	01 d0                	add    %edx,%eax
    32d0:	0f b6 00             	movzbl (%eax),%eax
    32d3:	84 c0                	test   %al,%al
    32d5:	75 ea                	jne    32c1 <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    32d7:	8b 45 0c             	mov    0xc(%ebp),%eax
    32da:	8b 00                	mov    (%eax),%eax
    32dc:	c1 e0 05             	shl    $0x5,%eax
    32df:	89 c2                	mov    %eax,%edx
    32e1:	8b 45 08             	mov    0x8(%ebp),%eax
    32e4:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    32e7:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32ed:	8b 55 f0             	mov    -0x10(%ebp),%edx
    32f0:	29 c2                	sub    %eax,%edx
    32f2:	89 d0                	mov    %edx,%eax
    32f4:	83 c0 01             	add    $0x1,%eax
    32f7:	83 ec 0c             	sub    $0xc,%esp
    32fa:	50                   	push   %eax
    32fb:	e8 6a d5 ff ff       	call   86a <malloc>
    3300:	83 c4 10             	add    $0x10,%esp
    3303:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    3306:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    330c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    330f:	eb 35                	jmp    3346 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    3311:	8b 45 0c             	mov    0xc(%ebp),%eax
    3314:	8b 00                	mov    (%eax),%eax
    3316:	c1 e0 05             	shl    $0x5,%eax
    3319:	89 c2                	mov    %eax,%edx
    331b:	8b 45 08             	mov    0x8(%ebp),%eax
    331e:	01 d0                	add    %edx,%eax
    3320:	8b 40 18             	mov    0x18(%eax),%eax
    3323:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3329:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    332c:	29 d1                	sub    %edx,%ecx
    332e:	89 ca                	mov    %ecx,%edx
    3330:	01 c2                	add    %eax,%edx
    3332:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    3338:	8b 45 ec             	mov    -0x14(%ebp),%eax
    333b:	01 c8                	add    %ecx,%eax
    333d:	0f b6 00             	movzbl (%eax),%eax
    3340:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    3342:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    3346:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3349:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    334c:	7e c3                	jle    3311 <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    334e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3351:	8b 00                	mov    (%eax),%eax
    3353:	c1 e0 05             	shl    $0x5,%eax
    3356:	89 c2                	mov    %eax,%edx
    3358:	8b 45 08             	mov    0x8(%ebp),%eax
    335b:	01 d0                	add    %edx,%eax
    335d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    3363:	8b 45 0c             	mov    0xc(%ebp),%eax
    3366:	8b 00                	mov    (%eax),%eax
    3368:	8d 50 01             	lea    0x1(%eax),%edx
    336b:	8b 45 0c             	mov    0xc(%ebp),%eax
    336e:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    3370:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3373:	83 c0 01             	add    $0x1,%eax
    3376:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    337c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    337f:	8d 50 ff             	lea    -0x1(%eax),%edx
    3382:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3388:	39 c2                	cmp    %eax,%edx
    338a:	0f 8d e5 fd ff ff    	jge    3175 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    3390:	83 ec 04             	sub    $0x4,%esp
    3393:	68 e8 03 00 00       	push   $0x3e8
    3398:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    339e:	50                   	push   %eax
    339f:	ff 75 e8             	pushl  -0x18(%ebp)
    33a2:	e8 2d cf ff ff       	call   2d4 <read>
    33a7:	83 c4 10             	add    $0x10,%esp
    33aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    33ad:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    33b1:	0f 8f af fd ff ff    	jg     3166 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    33b7:	83 ec 0c             	sub    $0xc,%esp
    33ba:	ff 75 e8             	pushl  -0x18(%ebp)
    33bd:	e8 22 cf ff ff       	call   2e4 <close>
    33c2:	83 c4 10             	add    $0x10,%esp
}
    33c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    33c8:	c9                   	leave  
    33c9:	c3                   	ret    

000033ca <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    33ca:	55                   	push   %ebp
    33cb:	89 e5                	mov    %esp,%ebp
    33cd:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    33d3:	83 ec 08             	sub    $0x8,%esp
    33d6:	6a 02                	push   $0x2
    33d8:	68 20 39 00 00       	push   $0x3920
    33dd:	e8 1a cf ff ff       	call   2fc <open>
    33e2:	83 c4 10             	add    $0x10,%esp
    33e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    33e8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    33ec:	78 1e                	js     340c <writeVariables+0x42>
  {
    close(fd);
    33ee:	83 ec 0c             	sub    $0xc,%esp
    33f1:	ff 75 e4             	pushl  -0x1c(%ebp)
    33f4:	e8 eb ce ff ff       	call   2e4 <close>
    33f9:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    33fc:	83 ec 0c             	sub    $0xc,%esp
    33ff:	68 20 39 00 00       	push   $0x3920
    3404:	e8 03 cf ff ff       	call   30c <unlink>
    3409:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    340c:	83 ec 08             	sub    $0x8,%esp
    340f:	68 02 02 00 00       	push   $0x202
    3414:	68 20 39 00 00       	push   $0x3920
    3419:	e8 de ce ff ff       	call   2fc <open>
    341e:	83 c4 10             	add    $0x10,%esp
    3421:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    3424:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    342b:	e9 ff 01 00 00       	jmp    362f <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    3430:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3433:	c1 e0 05             	shl    $0x5,%eax
    3436:	89 c2                	mov    %eax,%edx
    3438:	8b 45 08             	mov    0x8(%ebp),%eax
    343b:	01 d0                	add    %edx,%eax
    343d:	8b 00                	mov    (%eax),%eax
    343f:	83 f8 01             	cmp    $0x1,%eax
    3442:	0f 85 d3 00 00 00    	jne    351b <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    3448:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    344f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3452:	8d 50 01             	lea    0x1(%eax),%edx
    3455:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3458:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    345f:	64 
      int k=0;
    3460:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    3467:	eb 2c                	jmp    3495 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    3469:	8b 45 e0             	mov    -0x20(%ebp),%eax
    346c:	8d 50 01             	lea    0x1(%eax),%edx
    346f:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3472:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3475:	89 d1                	mov    %edx,%ecx
    3477:	c1 e1 05             	shl    $0x5,%ecx
    347a:	8b 55 08             	mov    0x8(%ebp),%edx
    347d:	01 d1                	add    %edx,%ecx
    347f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3482:	01 ca                	add    %ecx,%edx
    3484:	83 c2 04             	add    $0x4,%edx
    3487:	0f b6 12             	movzbl (%edx),%edx
    348a:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3491:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    3495:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3498:	c1 e0 05             	shl    $0x5,%eax
    349b:	89 c2                	mov    %eax,%edx
    349d:	8b 45 08             	mov    0x8(%ebp),%eax
    34a0:	01 c2                	add    %eax,%edx
    34a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34a5:	01 d0                	add    %edx,%eax
    34a7:	83 c0 04             	add    $0x4,%eax
    34aa:	0f b6 00             	movzbl (%eax),%eax
    34ad:	84 c0                	test   %al,%al
    34af:	75 b8                	jne    3469 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    34b1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34b4:	8d 50 01             	lea    0x1(%eax),%edx
    34b7:	89 55 e0             	mov    %edx,-0x20(%ebp)
    34ba:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    34c1:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    34c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34c5:	c1 e0 05             	shl    $0x5,%eax
    34c8:	89 c2                	mov    %eax,%edx
    34ca:	8b 45 08             	mov    0x8(%ebp),%eax
    34cd:	01 d0                	add    %edx,%eax
    34cf:	dd 40 18             	fldl   0x18(%eax)
    34d2:	8d 45 e0             	lea    -0x20(%ebp),%eax
    34d5:	50                   	push   %eax
    34d6:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    34da:	dd 1c 24             	fstpl  (%esp)
    34dd:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    34e3:	50                   	push   %eax
    34e4:	e8 7d d5 ff ff       	call   a66 <double2str>
    34e9:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    34ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34ef:	8d 50 01             	lea    0x1(%eax),%edx
    34f2:	89 55 e0             	mov    %edx,-0x20(%ebp)
    34f5:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    34fc:	00 
      write(fd,buf,pos);
    34fd:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3500:	83 ec 04             	sub    $0x4,%esp
    3503:	50                   	push   %eax
    3504:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    350a:	50                   	push   %eax
    350b:	ff 75 e4             	pushl  -0x1c(%ebp)
    350e:	e8 c9 cd ff ff       	call   2dc <write>
    3513:	83 c4 10             	add    $0x10,%esp
    3516:	e9 10 01 00 00       	jmp    362b <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    351b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    3522:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3525:	8d 50 01             	lea    0x1(%eax),%edx
    3528:	89 55 ec             	mov    %edx,-0x14(%ebp)
    352b:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    3532:	73 
      int k=0;
    3533:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    353a:	eb 2c                	jmp    3568 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    353c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    353f:	8d 50 01             	lea    0x1(%eax),%edx
    3542:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3545:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3548:	89 d1                	mov    %edx,%ecx
    354a:	c1 e1 05             	shl    $0x5,%ecx
    354d:	8b 55 08             	mov    0x8(%ebp),%edx
    3550:	01 d1                	add    %edx,%ecx
    3552:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3555:	01 ca                	add    %ecx,%edx
    3557:	83 c2 04             	add    $0x4,%edx
    355a:	0f b6 12             	movzbl (%edx),%edx
    355d:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3564:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    3568:	8b 45 f4             	mov    -0xc(%ebp),%eax
    356b:	c1 e0 05             	shl    $0x5,%eax
    356e:	89 c2                	mov    %eax,%edx
    3570:	8b 45 08             	mov    0x8(%ebp),%eax
    3573:	01 c2                	add    %eax,%edx
    3575:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3578:	01 d0                	add    %edx,%eax
    357a:	83 c0 04             	add    $0x4,%eax
    357d:	0f b6 00             	movzbl (%eax),%eax
    3580:	84 c0                	test   %al,%al
    3582:	75 b8                	jne    353c <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3584:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3587:	8d 50 01             	lea    0x1(%eax),%edx
    358a:	89 55 ec             	mov    %edx,-0x14(%ebp)
    358d:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    3594:	3d 
      k=0;
    3595:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    359c:	eb 2c                	jmp    35ca <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    359e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35a1:	8d 50 01             	lea    0x1(%eax),%edx
    35a4:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    35aa:	89 d1                	mov    %edx,%ecx
    35ac:	c1 e1 05             	shl    $0x5,%ecx
    35af:	8b 55 08             	mov    0x8(%ebp),%edx
    35b2:	01 ca                	add    %ecx,%edx
    35b4:	8b 4a 18             	mov    0x18(%edx),%ecx
    35b7:	8b 55 e8             	mov    -0x18(%ebp),%edx
    35ba:	01 ca                	add    %ecx,%edx
    35bc:	0f b6 12             	movzbl (%edx),%edx
    35bf:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    35c6:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    35ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35cd:	c1 e0 05             	shl    $0x5,%eax
    35d0:	89 c2                	mov    %eax,%edx
    35d2:	8b 45 08             	mov    0x8(%ebp),%eax
    35d5:	01 d0                	add    %edx,%eax
    35d7:	8b 50 18             	mov    0x18(%eax),%edx
    35da:	8b 45 e8             	mov    -0x18(%ebp),%eax
    35dd:	01 d0                	add    %edx,%eax
    35df:	0f b6 00             	movzbl (%eax),%eax
    35e2:	84 c0                	test   %al,%al
    35e4:	75 b8                	jne    359e <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    35e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35e9:	8d 50 01             	lea    0x1(%eax),%edx
    35ec:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35ef:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    35f6:	00 
      write(fd,buf,pos);
    35f7:	83 ec 04             	sub    $0x4,%esp
    35fa:	ff 75 ec             	pushl  -0x14(%ebp)
    35fd:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3603:	50                   	push   %eax
    3604:	ff 75 e4             	pushl  -0x1c(%ebp)
    3607:	e8 d0 cc ff ff       	call   2dc <write>
    360c:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    360f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3612:	c1 e0 05             	shl    $0x5,%eax
    3615:	89 c2                	mov    %eax,%edx
    3617:	8b 45 08             	mov    0x8(%ebp),%eax
    361a:	01 d0                	add    %edx,%eax
    361c:	8b 40 18             	mov    0x18(%eax),%eax
    361f:	83 ec 0c             	sub    $0xc,%esp
    3622:	50                   	push   %eax
    3623:	e8 00 d1 ff ff       	call   728 <free>
    3628:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    362b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    362f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3632:	8b 00                	mov    (%eax),%eax
    3634:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3637:	0f 8f f3 fd ff ff    	jg     3430 <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    363d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3640:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    3646:	83 ec 0c             	sub    $0xc,%esp
    3649:	ff 75 e4             	pushl  -0x1c(%ebp)
    364c:	e8 93 cc ff ff       	call   2e4 <close>
    3651:	83 c4 10             	add    $0x10,%esp
  return;
    3654:	90                   	nop
    3655:	c9                   	leave  
    3656:	c3                   	ret    
