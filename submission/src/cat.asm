
_cat：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 18             	sub    $0x18,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
       6:	eb 15                	jmp    1d <cat+0x1d>
    write(1, buf, n);
       8:	83 ec 04             	sub    $0x4,%esp
       b:	ff 75 f4             	pushl  -0xc(%ebp)
       e:	68 c0 44 00 00       	push   $0x44c0
      13:	6a 01                	push   $0x1
      15:	e8 6c 03 00 00       	call   386 <write>
      1a:	83 c4 10             	add    $0x10,%esp
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
      1d:	83 ec 04             	sub    $0x4,%esp
      20:	68 00 02 00 00       	push   $0x200
      25:	68 c0 44 00 00       	push   $0x44c0
      2a:	ff 75 08             	pushl  0x8(%ebp)
      2d:	e8 4c 03 00 00       	call   37e <read>
      32:	83 c4 10             	add    $0x10,%esp
      35:	89 45 f4             	mov    %eax,-0xc(%ebp)
      38:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      3c:	7f ca                	jg     8 <cat+0x8>
    write(1, buf, n);
  if(n < 0){
      3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      42:	79 17                	jns    5b <cat+0x5b>
    printf(1, "cat: read error\n");
      44:	83 ec 08             	sub    $0x8,%esp
      47:	68 08 37 00 00       	push   $0x3708
      4c:	6a 01                	push   $0x1
      4e:	e8 bf 05 00 00       	call   612 <printf>
      53:	83 c4 10             	add    $0x10,%esp
    exit();
      56:	e8 0b 03 00 00       	call   366 <exit>
  }
}
      5b:	90                   	nop
      5c:	c9                   	leave  
      5d:	c3                   	ret    

0000005e <main>:

int
main(int argc, char *argv[])
{
      5e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
      62:	83 e4 f0             	and    $0xfffffff0,%esp
      65:	ff 71 fc             	pushl  -0x4(%ecx)
      68:	55                   	push   %ebp
      69:	89 e5                	mov    %esp,%ebp
      6b:	53                   	push   %ebx
      6c:	51                   	push   %ecx
      6d:	83 ec 10             	sub    $0x10,%esp
      70:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
      72:	83 3b 01             	cmpl   $0x1,(%ebx)
      75:	7f 12                	jg     89 <main+0x2b>
    cat(0);
      77:	83 ec 0c             	sub    $0xc,%esp
      7a:	6a 00                	push   $0x0
      7c:	e8 7f ff ff ff       	call   0 <cat>
      81:	83 c4 10             	add    $0x10,%esp
    exit();
      84:	e8 dd 02 00 00       	call   366 <exit>
  }

  for(i = 1; i < argc; i++){
      89:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      90:	eb 71                	jmp    103 <main+0xa5>
    if((fd = open(argv[i], 0)) < 0){
      92:	8b 45 f4             	mov    -0xc(%ebp),%eax
      95:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
      9c:	8b 43 04             	mov    0x4(%ebx),%eax
      9f:	01 d0                	add    %edx,%eax
      a1:	8b 00                	mov    (%eax),%eax
      a3:	83 ec 08             	sub    $0x8,%esp
      a6:	6a 00                	push   $0x0
      a8:	50                   	push   %eax
      a9:	e8 f8 02 00 00       	call   3a6 <open>
      ae:	83 c4 10             	add    $0x10,%esp
      b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
      b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
      b8:	79 29                	jns    e3 <main+0x85>
      printf(1, "cat: cannot open %s\n", argv[i]);
      ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
      bd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
      c4:	8b 43 04             	mov    0x4(%ebx),%eax
      c7:	01 d0                	add    %edx,%eax
      c9:	8b 00                	mov    (%eax),%eax
      cb:	83 ec 04             	sub    $0x4,%esp
      ce:	50                   	push   %eax
      cf:	68 19 37 00 00       	push   $0x3719
      d4:	6a 01                	push   $0x1
      d6:	e8 37 05 00 00       	call   612 <printf>
      db:	83 c4 10             	add    $0x10,%esp
      exit();
      de:	e8 83 02 00 00       	call   366 <exit>
    }
    cat(fd);
      e3:	83 ec 0c             	sub    $0xc,%esp
      e6:	ff 75 f0             	pushl  -0x10(%ebp)
      e9:	e8 12 ff ff ff       	call   0 <cat>
      ee:	83 c4 10             	add    $0x10,%esp
    close(fd);
      f1:	83 ec 0c             	sub    $0xc,%esp
      f4:	ff 75 f0             	pushl  -0x10(%ebp)
      f7:	e8 92 02 00 00       	call   38e <close>
      fc:	83 c4 10             	add    $0x10,%esp
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
      ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     103:	8b 45 f4             	mov    -0xc(%ebp),%eax
     106:	3b 03                	cmp    (%ebx),%eax
     108:	7c 88                	jl     92 <main+0x34>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
     10a:	e8 57 02 00 00       	call   366 <exit>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     10f:	55                   	push   %ebp
     110:	89 e5                	mov    %esp,%ebp
     112:	57                   	push   %edi
     113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     114:	8b 4d 08             	mov    0x8(%ebp),%ecx
     117:	8b 55 10             	mov    0x10(%ebp),%edx
     11a:	8b 45 0c             	mov    0xc(%ebp),%eax
     11d:	89 cb                	mov    %ecx,%ebx
     11f:	89 df                	mov    %ebx,%edi
     121:	89 d1                	mov    %edx,%ecx
     123:	fc                   	cld    
     124:	f3 aa                	rep stos %al,%es:(%edi)
     126:	89 ca                	mov    %ecx,%edx
     128:	89 fb                	mov    %edi,%ebx
     12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
     12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     130:	90                   	nop
     131:	5b                   	pop    %ebx
     132:	5f                   	pop    %edi
     133:	5d                   	pop    %ebp
     134:	c3                   	ret    

00000135 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     135:	55                   	push   %ebp
     136:	89 e5                	mov    %esp,%ebp
     138:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     13b:	8b 45 08             	mov    0x8(%ebp),%eax
     13e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     141:	90                   	nop
     142:	8b 45 08             	mov    0x8(%ebp),%eax
     145:	8d 50 01             	lea    0x1(%eax),%edx
     148:	89 55 08             	mov    %edx,0x8(%ebp)
     14b:	8b 55 0c             	mov    0xc(%ebp),%edx
     14e:	8d 4a 01             	lea    0x1(%edx),%ecx
     151:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     154:	0f b6 12             	movzbl (%edx),%edx
     157:	88 10                	mov    %dl,(%eax)
     159:	0f b6 00             	movzbl (%eax),%eax
     15c:	84 c0                	test   %al,%al
     15e:	75 e2                	jne    142 <strcpy+0xd>
    ;
  return os;
     160:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     163:	c9                   	leave  
     164:	c3                   	ret    

00000165 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     165:	55                   	push   %ebp
     166:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     168:	eb 08                	jmp    172 <strcmp+0xd>
    p++, q++;
     16a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     16e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     172:	8b 45 08             	mov    0x8(%ebp),%eax
     175:	0f b6 00             	movzbl (%eax),%eax
     178:	84 c0                	test   %al,%al
     17a:	74 10                	je     18c <strcmp+0x27>
     17c:	8b 45 08             	mov    0x8(%ebp),%eax
     17f:	0f b6 10             	movzbl (%eax),%edx
     182:	8b 45 0c             	mov    0xc(%ebp),%eax
     185:	0f b6 00             	movzbl (%eax),%eax
     188:	38 c2                	cmp    %al,%dl
     18a:	74 de                	je     16a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     18c:	8b 45 08             	mov    0x8(%ebp),%eax
     18f:	0f b6 00             	movzbl (%eax),%eax
     192:	0f b6 d0             	movzbl %al,%edx
     195:	8b 45 0c             	mov    0xc(%ebp),%eax
     198:	0f b6 00             	movzbl (%eax),%eax
     19b:	0f b6 c0             	movzbl %al,%eax
     19e:	29 c2                	sub    %eax,%edx
     1a0:	89 d0                	mov    %edx,%eax
}
     1a2:	5d                   	pop    %ebp
     1a3:	c3                   	ret    

000001a4 <strlen>:

uint
strlen(char *s)
{
     1a4:	55                   	push   %ebp
     1a5:	89 e5                	mov    %esp,%ebp
     1a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     1aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     1b1:	eb 04                	jmp    1b7 <strlen+0x13>
     1b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     1b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
     1ba:	8b 45 08             	mov    0x8(%ebp),%eax
     1bd:	01 d0                	add    %edx,%eax
     1bf:	0f b6 00             	movzbl (%eax),%eax
     1c2:	84 c0                	test   %al,%al
     1c4:	75 ed                	jne    1b3 <strlen+0xf>
    ;
  return n;
     1c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     1c9:	c9                   	leave  
     1ca:	c3                   	ret    

000001cb <memset>:

void*
memset(void *dst, int c, uint n)
{
     1cb:	55                   	push   %ebp
     1cc:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     1ce:	8b 45 10             	mov    0x10(%ebp),%eax
     1d1:	50                   	push   %eax
     1d2:	ff 75 0c             	pushl  0xc(%ebp)
     1d5:	ff 75 08             	pushl  0x8(%ebp)
     1d8:	e8 32 ff ff ff       	call   10f <stosb>
     1dd:	83 c4 0c             	add    $0xc,%esp
  return dst;
     1e0:	8b 45 08             	mov    0x8(%ebp),%eax
}
     1e3:	c9                   	leave  
     1e4:	c3                   	ret    

000001e5 <strchr>:

char*
strchr(const char *s, char c)
{
     1e5:	55                   	push   %ebp
     1e6:	89 e5                	mov    %esp,%ebp
     1e8:	83 ec 04             	sub    $0x4,%esp
     1eb:	8b 45 0c             	mov    0xc(%ebp),%eax
     1ee:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     1f1:	eb 14                	jmp    207 <strchr+0x22>
    if(*s == c)
     1f3:	8b 45 08             	mov    0x8(%ebp),%eax
     1f6:	0f b6 00             	movzbl (%eax),%eax
     1f9:	3a 45 fc             	cmp    -0x4(%ebp),%al
     1fc:	75 05                	jne    203 <strchr+0x1e>
      return (char*)s;
     1fe:	8b 45 08             	mov    0x8(%ebp),%eax
     201:	eb 13                	jmp    216 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     203:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     207:	8b 45 08             	mov    0x8(%ebp),%eax
     20a:	0f b6 00             	movzbl (%eax),%eax
     20d:	84 c0                	test   %al,%al
     20f:	75 e2                	jne    1f3 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     211:	b8 00 00 00 00       	mov    $0x0,%eax
}
     216:	c9                   	leave  
     217:	c3                   	ret    

00000218 <gets>:

char*
gets(char *buf, int max)
{
     218:	55                   	push   %ebp
     219:	89 e5                	mov    %esp,%ebp
     21b:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     21e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     225:	eb 42                	jmp    269 <gets+0x51>
    cc = read(0, &c, 1);
     227:	83 ec 04             	sub    $0x4,%esp
     22a:	6a 01                	push   $0x1
     22c:	8d 45 ef             	lea    -0x11(%ebp),%eax
     22f:	50                   	push   %eax
     230:	6a 00                	push   $0x0
     232:	e8 47 01 00 00       	call   37e <read>
     237:	83 c4 10             	add    $0x10,%esp
     23a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     23d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     241:	7e 33                	jle    276 <gets+0x5e>
      break;
    buf[i++] = c;
     243:	8b 45 f4             	mov    -0xc(%ebp),%eax
     246:	8d 50 01             	lea    0x1(%eax),%edx
     249:	89 55 f4             	mov    %edx,-0xc(%ebp)
     24c:	89 c2                	mov    %eax,%edx
     24e:	8b 45 08             	mov    0x8(%ebp),%eax
     251:	01 c2                	add    %eax,%edx
     253:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     257:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     259:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     25d:	3c 0a                	cmp    $0xa,%al
     25f:	74 16                	je     277 <gets+0x5f>
     261:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     265:	3c 0d                	cmp    $0xd,%al
     267:	74 0e                	je     277 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     269:	8b 45 f4             	mov    -0xc(%ebp),%eax
     26c:	83 c0 01             	add    $0x1,%eax
     26f:	3b 45 0c             	cmp    0xc(%ebp),%eax
     272:	7c b3                	jl     227 <gets+0xf>
     274:	eb 01                	jmp    277 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     276:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     277:	8b 55 f4             	mov    -0xc(%ebp),%edx
     27a:	8b 45 08             	mov    0x8(%ebp),%eax
     27d:	01 d0                	add    %edx,%eax
     27f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     282:	8b 45 08             	mov    0x8(%ebp),%eax
}
     285:	c9                   	leave  
     286:	c3                   	ret    

00000287 <stat>:

int
stat(char *n, struct stat *st)
{
     287:	55                   	push   %ebp
     288:	89 e5                	mov    %esp,%ebp
     28a:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     28d:	83 ec 08             	sub    $0x8,%esp
     290:	6a 00                	push   $0x0
     292:	ff 75 08             	pushl  0x8(%ebp)
     295:	e8 0c 01 00 00       	call   3a6 <open>
     29a:	83 c4 10             	add    $0x10,%esp
     29d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     2a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     2a4:	79 07                	jns    2ad <stat+0x26>
    return -1;
     2a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     2ab:	eb 25                	jmp    2d2 <stat+0x4b>
  r = fstat(fd, st);
     2ad:	83 ec 08             	sub    $0x8,%esp
     2b0:	ff 75 0c             	pushl  0xc(%ebp)
     2b3:	ff 75 f4             	pushl  -0xc(%ebp)
     2b6:	e8 03 01 00 00       	call   3be <fstat>
     2bb:	83 c4 10             	add    $0x10,%esp
     2be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     2c1:	83 ec 0c             	sub    $0xc,%esp
     2c4:	ff 75 f4             	pushl  -0xc(%ebp)
     2c7:	e8 c2 00 00 00       	call   38e <close>
     2cc:	83 c4 10             	add    $0x10,%esp
  return r;
     2cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     2d2:	c9                   	leave  
     2d3:	c3                   	ret    

000002d4 <atoi>:

int
atoi(const char *s)
{
     2d4:	55                   	push   %ebp
     2d5:	89 e5                	mov    %esp,%ebp
     2d7:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     2da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     2e1:	eb 25                	jmp    308 <atoi+0x34>
    n = n*10 + *s++ - '0';
     2e3:	8b 55 fc             	mov    -0x4(%ebp),%edx
     2e6:	89 d0                	mov    %edx,%eax
     2e8:	c1 e0 02             	shl    $0x2,%eax
     2eb:	01 d0                	add    %edx,%eax
     2ed:	01 c0                	add    %eax,%eax
     2ef:	89 c1                	mov    %eax,%ecx
     2f1:	8b 45 08             	mov    0x8(%ebp),%eax
     2f4:	8d 50 01             	lea    0x1(%eax),%edx
     2f7:	89 55 08             	mov    %edx,0x8(%ebp)
     2fa:	0f b6 00             	movzbl (%eax),%eax
     2fd:	0f be c0             	movsbl %al,%eax
     300:	01 c8                	add    %ecx,%eax
     302:	83 e8 30             	sub    $0x30,%eax
     305:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     308:	8b 45 08             	mov    0x8(%ebp),%eax
     30b:	0f b6 00             	movzbl (%eax),%eax
     30e:	3c 2f                	cmp    $0x2f,%al
     310:	7e 0a                	jle    31c <atoi+0x48>
     312:	8b 45 08             	mov    0x8(%ebp),%eax
     315:	0f b6 00             	movzbl (%eax),%eax
     318:	3c 39                	cmp    $0x39,%al
     31a:	7e c7                	jle    2e3 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     31c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     31f:	c9                   	leave  
     320:	c3                   	ret    

00000321 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     321:	55                   	push   %ebp
     322:	89 e5                	mov    %esp,%ebp
     324:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     327:	8b 45 08             	mov    0x8(%ebp),%eax
     32a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     32d:	8b 45 0c             	mov    0xc(%ebp),%eax
     330:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     333:	eb 17                	jmp    34c <memmove+0x2b>
    *dst++ = *src++;
     335:	8b 45 fc             	mov    -0x4(%ebp),%eax
     338:	8d 50 01             	lea    0x1(%eax),%edx
     33b:	89 55 fc             	mov    %edx,-0x4(%ebp)
     33e:	8b 55 f8             	mov    -0x8(%ebp),%edx
     341:	8d 4a 01             	lea    0x1(%edx),%ecx
     344:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     347:	0f b6 12             	movzbl (%edx),%edx
     34a:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     34c:	8b 45 10             	mov    0x10(%ebp),%eax
     34f:	8d 50 ff             	lea    -0x1(%eax),%edx
     352:	89 55 10             	mov    %edx,0x10(%ebp)
     355:	85 c0                	test   %eax,%eax
     357:	7f dc                	jg     335 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     359:	8b 45 08             	mov    0x8(%ebp),%eax
}
     35c:	c9                   	leave  
     35d:	c3                   	ret    

0000035e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     35e:	b8 01 00 00 00       	mov    $0x1,%eax
     363:	cd 40                	int    $0x40
     365:	c3                   	ret    

00000366 <exit>:
SYSCALL(exit)
     366:	b8 02 00 00 00       	mov    $0x2,%eax
     36b:	cd 40                	int    $0x40
     36d:	c3                   	ret    

0000036e <wait>:
SYSCALL(wait)
     36e:	b8 03 00 00 00       	mov    $0x3,%eax
     373:	cd 40                	int    $0x40
     375:	c3                   	ret    

00000376 <pipe>:
SYSCALL(pipe)
     376:	b8 04 00 00 00       	mov    $0x4,%eax
     37b:	cd 40                	int    $0x40
     37d:	c3                   	ret    

0000037e <read>:
SYSCALL(read)
     37e:	b8 05 00 00 00       	mov    $0x5,%eax
     383:	cd 40                	int    $0x40
     385:	c3                   	ret    

00000386 <write>:
SYSCALL(write)
     386:	b8 10 00 00 00       	mov    $0x10,%eax
     38b:	cd 40                	int    $0x40
     38d:	c3                   	ret    

0000038e <close>:
SYSCALL(close)
     38e:	b8 15 00 00 00       	mov    $0x15,%eax
     393:	cd 40                	int    $0x40
     395:	c3                   	ret    

00000396 <kill>:
SYSCALL(kill)
     396:	b8 06 00 00 00       	mov    $0x6,%eax
     39b:	cd 40                	int    $0x40
     39d:	c3                   	ret    

0000039e <exec>:
SYSCALL(exec)
     39e:	b8 07 00 00 00       	mov    $0x7,%eax
     3a3:	cd 40                	int    $0x40
     3a5:	c3                   	ret    

000003a6 <open>:
SYSCALL(open)
     3a6:	b8 0f 00 00 00       	mov    $0xf,%eax
     3ab:	cd 40                	int    $0x40
     3ad:	c3                   	ret    

000003ae <mknod>:
SYSCALL(mknod)
     3ae:	b8 11 00 00 00       	mov    $0x11,%eax
     3b3:	cd 40                	int    $0x40
     3b5:	c3                   	ret    

000003b6 <unlink>:
SYSCALL(unlink)
     3b6:	b8 12 00 00 00       	mov    $0x12,%eax
     3bb:	cd 40                	int    $0x40
     3bd:	c3                   	ret    

000003be <fstat>:
SYSCALL(fstat)
     3be:	b8 08 00 00 00       	mov    $0x8,%eax
     3c3:	cd 40                	int    $0x40
     3c5:	c3                   	ret    

000003c6 <link>:
SYSCALL(link)
     3c6:	b8 13 00 00 00       	mov    $0x13,%eax
     3cb:	cd 40                	int    $0x40
     3cd:	c3                   	ret    

000003ce <mkdir>:
SYSCALL(mkdir)
     3ce:	b8 14 00 00 00       	mov    $0x14,%eax
     3d3:	cd 40                	int    $0x40
     3d5:	c3                   	ret    

000003d6 <chdir>:
SYSCALL(chdir)
     3d6:	b8 09 00 00 00       	mov    $0x9,%eax
     3db:	cd 40                	int    $0x40
     3dd:	c3                   	ret    

000003de <dup>:
SYSCALL(dup)
     3de:	b8 0a 00 00 00       	mov    $0xa,%eax
     3e3:	cd 40                	int    $0x40
     3e5:	c3                   	ret    

000003e6 <getpid>:
SYSCALL(getpid)
     3e6:	b8 0b 00 00 00       	mov    $0xb,%eax
     3eb:	cd 40                	int    $0x40
     3ed:	c3                   	ret    

000003ee <sbrk>:
SYSCALL(sbrk)
     3ee:	b8 0c 00 00 00       	mov    $0xc,%eax
     3f3:	cd 40                	int    $0x40
     3f5:	c3                   	ret    

000003f6 <sleep>:
SYSCALL(sleep)
     3f6:	b8 0d 00 00 00       	mov    $0xd,%eax
     3fb:	cd 40                	int    $0x40
     3fd:	c3                   	ret    

000003fe <uptime>:
SYSCALL(uptime)
     3fe:	b8 0e 00 00 00       	mov    $0xe,%eax
     403:	cd 40                	int    $0x40
     405:	c3                   	ret    

00000406 <colorwrite>:

//new here
SYSCALL(colorwrite)
     406:	b8 16 00 00 00       	mov    $0x16,%eax
     40b:	cd 40                	int    $0x40
     40d:	c3                   	ret    

0000040e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     40e:	55                   	push   %ebp
     40f:	89 e5                	mov    %esp,%ebp
     411:	83 ec 18             	sub    $0x18,%esp
     414:	8b 45 0c             	mov    0xc(%ebp),%eax
     417:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     41a:	83 ec 04             	sub    $0x4,%esp
     41d:	6a 01                	push   $0x1
     41f:	8d 45 f4             	lea    -0xc(%ebp),%eax
     422:	50                   	push   %eax
     423:	ff 75 08             	pushl  0x8(%ebp)
     426:	e8 5b ff ff ff       	call   386 <write>
     42b:	83 c4 10             	add    $0x10,%esp
}
     42e:	90                   	nop
     42f:	c9                   	leave  
     430:	c3                   	ret    

00000431 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     431:	55                   	push   %ebp
     432:	89 e5                	mov    %esp,%ebp
     434:	53                   	push   %ebx
     435:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     438:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     43f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     443:	74 17                	je     45c <printint+0x2b>
     445:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     449:	79 11                	jns    45c <printint+0x2b>
    neg = 1;
     44b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     452:	8b 45 0c             	mov    0xc(%ebp),%eax
     455:	f7 d8                	neg    %eax
     457:	89 45 ec             	mov    %eax,-0x14(%ebp)
     45a:	eb 06                	jmp    462 <printint+0x31>
  } else {
    x = xx;
     45c:	8b 45 0c             	mov    0xc(%ebp),%eax
     45f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     462:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     469:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     46c:	8d 41 01             	lea    0x1(%ecx),%eax
     46f:	89 45 f4             	mov    %eax,-0xc(%ebp)
     472:	8b 5d 10             	mov    0x10(%ebp),%ebx
     475:	8b 45 ec             	mov    -0x14(%ebp),%eax
     478:	ba 00 00 00 00       	mov    $0x0,%edx
     47d:	f7 f3                	div    %ebx
     47f:	89 d0                	mov    %edx,%eax
     481:	0f b6 80 60 43 00 00 	movzbl 0x4360(%eax),%eax
     488:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     48c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     48f:	8b 45 ec             	mov    -0x14(%ebp),%eax
     492:	ba 00 00 00 00       	mov    $0x0,%edx
     497:	f7 f3                	div    %ebx
     499:	89 45 ec             	mov    %eax,-0x14(%ebp)
     49c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     4a0:	75 c7                	jne    469 <printint+0x38>
  if(neg)
     4a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     4a6:	74 2d                	je     4d5 <printint+0xa4>
    buf[i++] = '-';
     4a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4ab:	8d 50 01             	lea    0x1(%eax),%edx
     4ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
     4b1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     4b6:	eb 1d                	jmp    4d5 <printint+0xa4>
    putc(fd, buf[i]);
     4b8:	8d 55 dc             	lea    -0x24(%ebp),%edx
     4bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4be:	01 d0                	add    %edx,%eax
     4c0:	0f b6 00             	movzbl (%eax),%eax
     4c3:	0f be c0             	movsbl %al,%eax
     4c6:	83 ec 08             	sub    $0x8,%esp
     4c9:	50                   	push   %eax
     4ca:	ff 75 08             	pushl  0x8(%ebp)
     4cd:	e8 3c ff ff ff       	call   40e <putc>
     4d2:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     4d5:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     4d9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     4dd:	79 d9                	jns    4b8 <printint+0x87>
    putc(fd, buf[i]);
}
     4df:	90                   	nop
     4e0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4e3:	c9                   	leave  
     4e4:	c3                   	ret    

000004e5 <getInteger>:

static int getInteger(double num)
{
     4e5:	55                   	push   %ebp
     4e6:	89 e5                	mov    %esp,%ebp
     4e8:	83 ec 18             	sub    $0x18,%esp
     4eb:	8b 45 08             	mov    0x8(%ebp),%eax
     4ee:	89 45 e8             	mov    %eax,-0x18(%ebp)
     4f1:	8b 45 0c             	mov    0xc(%ebp),%eax
     4f4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     4f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     4fe:	eb 0e                	jmp    50e <getInteger+0x29>
  {
    num -= 1;
     500:	dd 45 e8             	fldl   -0x18(%ebp)
     503:	d9 e8                	fld1   
     505:	de e9                	fsubrp %st,%st(1)
     507:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     50a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     50e:	dd 45 e8             	fldl   -0x18(%ebp)
     511:	d9 e8                	fld1   
     513:	d9 c9                	fxch   %st(1)
     515:	df e9                	fucomip %st(1),%st
     517:	dd d8                	fstp   %st(0)
     519:	77 e5                	ja     500 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     51b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     51e:	c9                   	leave  
     51f:	c3                   	ret    

00000520 <printdbl>:

void printdbl(int fd, double num)
{
     520:	55                   	push   %ebp
     521:	89 e5                	mov    %esp,%ebp
     523:	83 ec 28             	sub    $0x28,%esp
     526:	8b 45 0c             	mov    0xc(%ebp),%eax
     529:	89 45 e0             	mov    %eax,-0x20(%ebp)
     52c:	8b 45 10             	mov    0x10(%ebp),%eax
     52f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     532:	d9 ee                	fldz   
     534:	dd 45 e0             	fldl   -0x20(%ebp)
     537:	d9 c9                	fxch   %st(1)
     539:	df e9                	fucomip %st(1),%st
     53b:	dd d8                	fstp   %st(0)
     53d:	76 18                	jbe    557 <printdbl+0x37>
  {
    putc(fd,'-');
     53f:	83 ec 08             	sub    $0x8,%esp
     542:	6a 2d                	push   $0x2d
     544:	ff 75 08             	pushl  0x8(%ebp)
     547:	e8 c2 fe ff ff       	call   40e <putc>
     54c:	83 c4 10             	add    $0x10,%esp
    num = -num;
     54f:	dd 45 e0             	fldl   -0x20(%ebp)
     552:	d9 e0                	fchs   
     554:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     557:	83 ec 08             	sub    $0x8,%esp
     55a:	ff 75 e4             	pushl  -0x1c(%ebp)
     55d:	ff 75 e0             	pushl  -0x20(%ebp)
     560:	e8 80 ff ff ff       	call   4e5 <getInteger>
     565:	83 c4 10             	add    $0x10,%esp
     568:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     56b:	6a 01                	push   $0x1
     56d:	6a 0a                	push   $0xa
     56f:	ff 75 f0             	pushl  -0x10(%ebp)
     572:	ff 75 08             	pushl  0x8(%ebp)
     575:	e8 b7 fe ff ff       	call   431 <printint>
     57a:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     57d:	db 45 f0             	fildl  -0x10(%ebp)
     580:	dd 45 e0             	fldl   -0x20(%ebp)
     583:	de e1                	fsubp  %st,%st(1)
     585:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     588:	dd 45 e0             	fldl   -0x20(%ebp)
     58b:	dd 05 38 37 00 00    	fldl   0x3738
     591:	d9 c9                	fxch   %st(1)
     593:	df e9                	fucomip %st(1),%st
     595:	dd d8                	fstp   %st(0)
     597:	76 10                	jbe    5a9 <printdbl+0x89>
    putc(fd,'.');
     599:	83 ec 08             	sub    $0x8,%esp
     59c:	6a 2e                	push   $0x2e
     59e:	ff 75 08             	pushl  0x8(%ebp)
     5a1:	e8 68 fe ff ff       	call   40e <putc>
     5a6:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     5a9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     5b0:	eb 49                	jmp    5fb <printdbl+0xdb>
  {
    num = num*10;
     5b2:	dd 45 e0             	fldl   -0x20(%ebp)
     5b5:	dd 05 40 37 00 00    	fldl   0x3740
     5bb:	de c9                	fmulp  %st,%st(1)
     5bd:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     5c0:	83 ec 08             	sub    $0x8,%esp
     5c3:	ff 75 e4             	pushl  -0x1c(%ebp)
     5c6:	ff 75 e0             	pushl  -0x20(%ebp)
     5c9:	e8 17 ff ff ff       	call   4e5 <getInteger>
     5ce:	83 c4 10             	add    $0x10,%esp
     5d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     5d4:	6a 01                	push   $0x1
     5d6:	6a 0a                	push   $0xa
     5d8:	ff 75 f0             	pushl  -0x10(%ebp)
     5db:	ff 75 08             	pushl  0x8(%ebp)
     5de:	e8 4e fe ff ff       	call   431 <printint>
     5e3:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     5e6:	db 45 f0             	fildl  -0x10(%ebp)
     5e9:	dd 45 e0             	fldl   -0x20(%ebp)
     5ec:	de e1                	fsubp  %st,%st(1)
     5ee:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     5f1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     5f5:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     5f9:	7f 13                	jg     60e <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     5fb:	dd 45 e0             	fldl   -0x20(%ebp)
     5fe:	dd 05 38 37 00 00    	fldl   0x3738
     604:	d9 c9                	fxch   %st(1)
     606:	df e9                	fucomip %st(1),%st
     608:	dd d8                	fstp   %st(0)
     60a:	77 a6                	ja     5b2 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     60c:	eb 01                	jmp    60f <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     60e:	90                   	nop
    }
  }
}
     60f:	90                   	nop
     610:	c9                   	leave  
     611:	c3                   	ret    

00000612 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     612:	55                   	push   %ebp
     613:	89 e5                	mov    %esp,%ebp
     615:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     618:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     61f:	8d 45 0c             	lea    0xc(%ebp),%eax
     622:	83 c0 04             	add    $0x4,%eax
     625:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     628:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     62f:	e9 88 01 00 00       	jmp    7bc <printf+0x1aa>
    c = fmt[i] & 0xff;
     634:	8b 55 0c             	mov    0xc(%ebp),%edx
     637:	8b 45 f0             	mov    -0x10(%ebp),%eax
     63a:	01 d0                	add    %edx,%eax
     63c:	0f b6 00             	movzbl (%eax),%eax
     63f:	0f be c0             	movsbl %al,%eax
     642:	25 ff 00 00 00       	and    $0xff,%eax
     647:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     64a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     64e:	75 2c                	jne    67c <printf+0x6a>
      if(c == '%'){
     650:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     654:	75 0c                	jne    662 <printf+0x50>
        state = '%';
     656:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     65d:	e9 56 01 00 00       	jmp    7b8 <printf+0x1a6>
      } else {
        putc(fd, c);
     662:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     665:	0f be c0             	movsbl %al,%eax
     668:	83 ec 08             	sub    $0x8,%esp
     66b:	50                   	push   %eax
     66c:	ff 75 08             	pushl  0x8(%ebp)
     66f:	e8 9a fd ff ff       	call   40e <putc>
     674:	83 c4 10             	add    $0x10,%esp
     677:	e9 3c 01 00 00       	jmp    7b8 <printf+0x1a6>
      }
    } else if(state == '%'){
     67c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     680:	0f 85 32 01 00 00    	jne    7b8 <printf+0x1a6>
      if(c == 'd'){
     686:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     68a:	75 1e                	jne    6aa <printf+0x98>
        printint(fd, *ap, 10, 1);
     68c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     68f:	8b 00                	mov    (%eax),%eax
     691:	6a 01                	push   $0x1
     693:	6a 0a                	push   $0xa
     695:	50                   	push   %eax
     696:	ff 75 08             	pushl  0x8(%ebp)
     699:	e8 93 fd ff ff       	call   431 <printint>
     69e:	83 c4 10             	add    $0x10,%esp
        ap++;
     6a1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     6a5:	e9 07 01 00 00       	jmp    7b1 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     6aa:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     6ae:	74 06                	je     6b6 <printf+0xa4>
     6b0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     6b4:	75 1e                	jne    6d4 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     6b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6b9:	8b 00                	mov    (%eax),%eax
     6bb:	6a 00                	push   $0x0
     6bd:	6a 10                	push   $0x10
     6bf:	50                   	push   %eax
     6c0:	ff 75 08             	pushl  0x8(%ebp)
     6c3:	e8 69 fd ff ff       	call   431 <printint>
     6c8:	83 c4 10             	add    $0x10,%esp
        ap++;
     6cb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     6cf:	e9 dd 00 00 00       	jmp    7b1 <printf+0x19f>
      } else if(c == 's'){
     6d4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     6d8:	75 46                	jne    720 <printf+0x10e>
        s = (char*)*ap;
     6da:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6dd:	8b 00                	mov    (%eax),%eax
     6df:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     6e2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     6e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     6ea:	75 25                	jne    711 <printf+0xff>
          s = "(null)";
     6ec:	c7 45 f4 30 37 00 00 	movl   $0x3730,-0xc(%ebp)
        while(*s != 0){
     6f3:	eb 1c                	jmp    711 <printf+0xff>
          putc(fd, *s);
     6f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6f8:	0f b6 00             	movzbl (%eax),%eax
     6fb:	0f be c0             	movsbl %al,%eax
     6fe:	83 ec 08             	sub    $0x8,%esp
     701:	50                   	push   %eax
     702:	ff 75 08             	pushl  0x8(%ebp)
     705:	e8 04 fd ff ff       	call   40e <putc>
     70a:	83 c4 10             	add    $0x10,%esp
          s++;
     70d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     711:	8b 45 f4             	mov    -0xc(%ebp),%eax
     714:	0f b6 00             	movzbl (%eax),%eax
     717:	84 c0                	test   %al,%al
     719:	75 da                	jne    6f5 <printf+0xe3>
     71b:	e9 91 00 00 00       	jmp    7b1 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     720:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     724:	75 1d                	jne    743 <printf+0x131>
        putc(fd, *ap);
     726:	8b 45 e8             	mov    -0x18(%ebp),%eax
     729:	8b 00                	mov    (%eax),%eax
     72b:	0f be c0             	movsbl %al,%eax
     72e:	83 ec 08             	sub    $0x8,%esp
     731:	50                   	push   %eax
     732:	ff 75 08             	pushl  0x8(%ebp)
     735:	e8 d4 fc ff ff       	call   40e <putc>
     73a:	83 c4 10             	add    $0x10,%esp
        ap++;
     73d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     741:	eb 6e                	jmp    7b1 <printf+0x19f>
      } else if(c == '%'){
     743:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     747:	75 17                	jne    760 <printf+0x14e>
        putc(fd, c);
     749:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     74c:	0f be c0             	movsbl %al,%eax
     74f:	83 ec 08             	sub    $0x8,%esp
     752:	50                   	push   %eax
     753:	ff 75 08             	pushl  0x8(%ebp)
     756:	e8 b3 fc ff ff       	call   40e <putc>
     75b:	83 c4 10             	add    $0x10,%esp
     75e:	eb 51                	jmp    7b1 <printf+0x19f>
      } else if(c == 'f'){ //for double
     760:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     764:	75 26                	jne    78c <printf+0x17a>
        double *dap = (double*)ap;
     766:	8b 45 e8             	mov    -0x18(%ebp),%eax
     769:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     76c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     76f:	dd 00                	fldl   (%eax)
     771:	83 ec 04             	sub    $0x4,%esp
     774:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     778:	dd 1c 24             	fstpl  (%esp)
     77b:	ff 75 08             	pushl  0x8(%ebp)
     77e:	e8 9d fd ff ff       	call   520 <printdbl>
     783:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     786:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     78a:	eb 25                	jmp    7b1 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     78c:	83 ec 08             	sub    $0x8,%esp
     78f:	6a 25                	push   $0x25
     791:	ff 75 08             	pushl  0x8(%ebp)
     794:	e8 75 fc ff ff       	call   40e <putc>
     799:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     79c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     79f:	0f be c0             	movsbl %al,%eax
     7a2:	83 ec 08             	sub    $0x8,%esp
     7a5:	50                   	push   %eax
     7a6:	ff 75 08             	pushl  0x8(%ebp)
     7a9:	e8 60 fc ff ff       	call   40e <putc>
     7ae:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     7b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     7b8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     7bc:	8b 55 0c             	mov    0xc(%ebp),%edx
     7bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7c2:	01 d0                	add    %edx,%eax
     7c4:	0f b6 00             	movzbl (%eax),%eax
     7c7:	84 c0                	test   %al,%al
     7c9:	0f 85 65 fe ff ff    	jne    634 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     7cf:	90                   	nop
     7d0:	c9                   	leave  
     7d1:	c3                   	ret    

000007d2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     7d2:	55                   	push   %ebp
     7d3:	89 e5                	mov    %esp,%ebp
     7d5:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     7d8:	8b 45 08             	mov    0x8(%ebp),%eax
     7db:	83 e8 08             	sub    $0x8,%eax
     7de:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     7e1:	a1 a8 44 00 00       	mov    0x44a8,%eax
     7e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
     7e9:	eb 24                	jmp    80f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     7eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7ee:	8b 00                	mov    (%eax),%eax
     7f0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     7f3:	77 12                	ja     807 <free+0x35>
     7f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     7fb:	77 24                	ja     821 <free+0x4f>
     7fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     800:	8b 00                	mov    (%eax),%eax
     802:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     805:	77 1a                	ja     821 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     807:	8b 45 fc             	mov    -0x4(%ebp),%eax
     80a:	8b 00                	mov    (%eax),%eax
     80c:	89 45 fc             	mov    %eax,-0x4(%ebp)
     80f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     812:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     815:	76 d4                	jbe    7eb <free+0x19>
     817:	8b 45 fc             	mov    -0x4(%ebp),%eax
     81a:	8b 00                	mov    (%eax),%eax
     81c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     81f:	76 ca                	jbe    7eb <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     821:	8b 45 f8             	mov    -0x8(%ebp),%eax
     824:	8b 40 04             	mov    0x4(%eax),%eax
     827:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     82e:	8b 45 f8             	mov    -0x8(%ebp),%eax
     831:	01 c2                	add    %eax,%edx
     833:	8b 45 fc             	mov    -0x4(%ebp),%eax
     836:	8b 00                	mov    (%eax),%eax
     838:	39 c2                	cmp    %eax,%edx
     83a:	75 24                	jne    860 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     83c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     83f:	8b 50 04             	mov    0x4(%eax),%edx
     842:	8b 45 fc             	mov    -0x4(%ebp),%eax
     845:	8b 00                	mov    (%eax),%eax
     847:	8b 40 04             	mov    0x4(%eax),%eax
     84a:	01 c2                	add    %eax,%edx
     84c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     84f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     852:	8b 45 fc             	mov    -0x4(%ebp),%eax
     855:	8b 00                	mov    (%eax),%eax
     857:	8b 10                	mov    (%eax),%edx
     859:	8b 45 f8             	mov    -0x8(%ebp),%eax
     85c:	89 10                	mov    %edx,(%eax)
     85e:	eb 0a                	jmp    86a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     860:	8b 45 fc             	mov    -0x4(%ebp),%eax
     863:	8b 10                	mov    (%eax),%edx
     865:	8b 45 f8             	mov    -0x8(%ebp),%eax
     868:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     86a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     86d:	8b 40 04             	mov    0x4(%eax),%eax
     870:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     877:	8b 45 fc             	mov    -0x4(%ebp),%eax
     87a:	01 d0                	add    %edx,%eax
     87c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     87f:	75 20                	jne    8a1 <free+0xcf>
    p->s.size += bp->s.size;
     881:	8b 45 fc             	mov    -0x4(%ebp),%eax
     884:	8b 50 04             	mov    0x4(%eax),%edx
     887:	8b 45 f8             	mov    -0x8(%ebp),%eax
     88a:	8b 40 04             	mov    0x4(%eax),%eax
     88d:	01 c2                	add    %eax,%edx
     88f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     892:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     895:	8b 45 f8             	mov    -0x8(%ebp),%eax
     898:	8b 10                	mov    (%eax),%edx
     89a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     89d:	89 10                	mov    %edx,(%eax)
     89f:	eb 08                	jmp    8a9 <free+0xd7>
  } else
    p->s.ptr = bp;
     8a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8a4:	8b 55 f8             	mov    -0x8(%ebp),%edx
     8a7:	89 10                	mov    %edx,(%eax)
  freep = p;
     8a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8ac:	a3 a8 44 00 00       	mov    %eax,0x44a8
}
     8b1:	90                   	nop
     8b2:	c9                   	leave  
     8b3:	c3                   	ret    

000008b4 <morecore>:

static Header*
morecore(uint nu)
{
     8b4:	55                   	push   %ebp
     8b5:	89 e5                	mov    %esp,%ebp
     8b7:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     8ba:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     8c1:	77 07                	ja     8ca <morecore+0x16>
    nu = 4096;
     8c3:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     8ca:	8b 45 08             	mov    0x8(%ebp),%eax
     8cd:	c1 e0 03             	shl    $0x3,%eax
     8d0:	83 ec 0c             	sub    $0xc,%esp
     8d3:	50                   	push   %eax
     8d4:	e8 15 fb ff ff       	call   3ee <sbrk>
     8d9:	83 c4 10             	add    $0x10,%esp
     8dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     8df:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     8e3:	75 07                	jne    8ec <morecore+0x38>
    return 0;
     8e5:	b8 00 00 00 00       	mov    $0x0,%eax
     8ea:	eb 26                	jmp    912 <morecore+0x5e>
  hp = (Header*)p;
     8ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     8f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8f5:	8b 55 08             	mov    0x8(%ebp),%edx
     8f8:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     8fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8fe:	83 c0 08             	add    $0x8,%eax
     901:	83 ec 0c             	sub    $0xc,%esp
     904:	50                   	push   %eax
     905:	e8 c8 fe ff ff       	call   7d2 <free>
     90a:	83 c4 10             	add    $0x10,%esp
  return freep;
     90d:	a1 a8 44 00 00       	mov    0x44a8,%eax
}
     912:	c9                   	leave  
     913:	c3                   	ret    

00000914 <malloc>:

void*
malloc(uint nbytes)
{
     914:	55                   	push   %ebp
     915:	89 e5                	mov    %esp,%ebp
     917:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     91a:	8b 45 08             	mov    0x8(%ebp),%eax
     91d:	83 c0 07             	add    $0x7,%eax
     920:	c1 e8 03             	shr    $0x3,%eax
     923:	83 c0 01             	add    $0x1,%eax
     926:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     929:	a1 a8 44 00 00       	mov    0x44a8,%eax
     92e:	89 45 f0             	mov    %eax,-0x10(%ebp)
     931:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     935:	75 23                	jne    95a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     937:	c7 45 f0 a0 44 00 00 	movl   $0x44a0,-0x10(%ebp)
     93e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     941:	a3 a8 44 00 00       	mov    %eax,0x44a8
     946:	a1 a8 44 00 00       	mov    0x44a8,%eax
     94b:	a3 a0 44 00 00       	mov    %eax,0x44a0
    base.s.size = 0;
     950:	c7 05 a4 44 00 00 00 	movl   $0x0,0x44a4
     957:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     95a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     95d:	8b 00                	mov    (%eax),%eax
     95f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     962:	8b 45 f4             	mov    -0xc(%ebp),%eax
     965:	8b 40 04             	mov    0x4(%eax),%eax
     968:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     96b:	72 4d                	jb     9ba <malloc+0xa6>
      if(p->s.size == nunits)
     96d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     970:	8b 40 04             	mov    0x4(%eax),%eax
     973:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     976:	75 0c                	jne    984 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     978:	8b 45 f4             	mov    -0xc(%ebp),%eax
     97b:	8b 10                	mov    (%eax),%edx
     97d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     980:	89 10                	mov    %edx,(%eax)
     982:	eb 26                	jmp    9aa <malloc+0x96>
      else {
        p->s.size -= nunits;
     984:	8b 45 f4             	mov    -0xc(%ebp),%eax
     987:	8b 40 04             	mov    0x4(%eax),%eax
     98a:	2b 45 ec             	sub    -0x14(%ebp),%eax
     98d:	89 c2                	mov    %eax,%edx
     98f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     992:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     995:	8b 45 f4             	mov    -0xc(%ebp),%eax
     998:	8b 40 04             	mov    0x4(%eax),%eax
     99b:	c1 e0 03             	shl    $0x3,%eax
     99e:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     9a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9a4:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9a7:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     9aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9ad:	a3 a8 44 00 00       	mov    %eax,0x44a8
      return (void*)(p + 1);
     9b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9b5:	83 c0 08             	add    $0x8,%eax
     9b8:	eb 3b                	jmp    9f5 <malloc+0xe1>
    }
    if(p == freep)
     9ba:	a1 a8 44 00 00       	mov    0x44a8,%eax
     9bf:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     9c2:	75 1e                	jne    9e2 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     9c4:	83 ec 0c             	sub    $0xc,%esp
     9c7:	ff 75 ec             	pushl  -0x14(%ebp)
     9ca:	e8 e5 fe ff ff       	call   8b4 <morecore>
     9cf:	83 c4 10             	add    $0x10,%esp
     9d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
     9d5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     9d9:	75 07                	jne    9e2 <malloc+0xce>
        return 0;
     9db:	b8 00 00 00 00       	mov    $0x0,%eax
     9e0:	eb 13                	jmp    9f5 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     9e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
     9e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9eb:	8b 00                	mov    (%eax),%eax
     9ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     9f0:	e9 6d ff ff ff       	jmp    962 <malloc+0x4e>
}
     9f5:	c9                   	leave  
     9f6:	c3                   	ret    

000009f7 <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     9f7:	55                   	push   %ebp
     9f8:	89 e5                	mov    %esp,%ebp
     9fa:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     9fd:	83 ec 04             	sub    $0x4,%esp
     a00:	ff 75 08             	pushl  0x8(%ebp)
     a03:	68 48 37 00 00       	push   $0x3748
     a08:	6a 02                	push   $0x2
     a0a:	e8 03 fc ff ff       	call   612 <printf>
     a0f:	83 c4 10             	add    $0x10,%esp
  exit();
     a12:	e8 4f f9 ff ff       	call   366 <exit>

00000a17 <getInteger>:
}

static int getInteger(double num)
{
     a17:	55                   	push   %ebp
     a18:	89 e5                	mov    %esp,%ebp
     a1a:	83 ec 18             	sub    $0x18,%esp
     a1d:	8b 45 08             	mov    0x8(%ebp),%eax
     a20:	89 45 e8             	mov    %eax,-0x18(%ebp)
     a23:	8b 45 0c             	mov    0xc(%ebp),%eax
     a26:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     a29:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     a30:	eb 0e                	jmp    a40 <getInteger+0x29>
  {
    num -= 1;
     a32:	dd 45 e8             	fldl   -0x18(%ebp)
     a35:	d9 e8                	fld1   
     a37:	de e9                	fsubrp %st,%st(1)
     a39:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     a3c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     a40:	dd 45 e8             	fldl   -0x18(%ebp)
     a43:	d9 e8                	fld1   
     a45:	d9 c9                	fxch   %st(1)
     a47:	df e9                	fucomip %st(1),%st
     a49:	dd d8                	fstp   %st(0)
     a4b:	77 e5                	ja     a32 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     a4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     a50:	c9                   	leave  
     a51:	c3                   	ret    

00000a52 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     a52:	55                   	push   %ebp
     a53:	89 e5                	mov    %esp,%ebp
     a55:	53                   	push   %ebx
     a56:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     a59:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     a60:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     a64:	74 17                	je     a7d <int2str+0x2b>
     a66:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     a6a:	79 11                	jns    a7d <int2str+0x2b>
    neg = 1;
     a6c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     a73:	8b 45 0c             	mov    0xc(%ebp),%eax
     a76:	f7 d8                	neg    %eax
     a78:	89 45 f0             	mov    %eax,-0x10(%ebp)
     a7b:	eb 06                	jmp    a83 <int2str+0x31>
  } else {
    x = num;
     a7d:	8b 45 0c             	mov    0xc(%ebp),%eax
     a80:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     a83:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     a8a:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     a8d:	8d 41 01             	lea    0x1(%ecx),%eax
     a90:	89 45 f8             	mov    %eax,-0x8(%ebp)
     a93:	8b 5d 14             	mov    0x14(%ebp),%ebx
     a96:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a99:	ba 00 00 00 00       	mov    $0x0,%edx
     a9e:	f7 f3                	div    %ebx
     aa0:	89 d0                	mov    %edx,%eax
     aa2:	0f b6 80 74 43 00 00 	movzbl 0x4374(%eax),%eax
     aa9:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     aad:	8b 5d 14             	mov    0x14(%ebp),%ebx
     ab0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ab3:	ba 00 00 00 00       	mov    $0x0,%edx
     ab8:	f7 f3                	div    %ebx
     aba:	89 45 f0             	mov    %eax,-0x10(%ebp)
     abd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     ac1:	75 c7                	jne    a8a <int2str+0x38>
  if(neg)
     ac3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ac7:	74 36                	je     aff <int2str+0xad>
    buf[i++] = '-';
     ac9:	8b 45 f8             	mov    -0x8(%ebp),%eax
     acc:	8d 50 01             	lea    0x1(%eax),%edx
     acf:	89 55 f8             	mov    %edx,-0x8(%ebp)
     ad2:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     ad7:	eb 26                	jmp    aff <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     ad9:	8b 45 10             	mov    0x10(%ebp),%eax
     adc:	8b 00                	mov    (%eax),%eax
     ade:	89 c2                	mov    %eax,%edx
     ae0:	8b 45 08             	mov    0x8(%ebp),%eax
     ae3:	01 c2                	add    %eax,%edx
     ae5:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     ae8:	8b 45 f8             	mov    -0x8(%ebp),%eax
     aeb:	01 c8                	add    %ecx,%eax
     aed:	0f b6 00             	movzbl (%eax),%eax
     af0:	88 02                	mov    %al,(%edx)
    (*pos)++;
     af2:	8b 45 10             	mov    0x10(%ebp),%eax
     af5:	8b 00                	mov    (%eax),%eax
     af7:	8d 50 01             	lea    0x1(%eax),%edx
     afa:	8b 45 10             	mov    0x10(%ebp),%eax
     afd:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     aff:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     b03:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     b07:	79 d0                	jns    ad9 <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     b09:	90                   	nop
     b0a:	83 c4 20             	add    $0x20,%esp
     b0d:	5b                   	pop    %ebx
     b0e:	5d                   	pop    %ebp
     b0f:	c3                   	ret    

00000b10 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	83 ec 18             	sub    $0x18,%esp
     b16:	8b 45 0c             	mov    0xc(%ebp),%eax
     b19:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b1c:	8b 45 10             	mov    0x10(%ebp),%eax
     b1f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     b22:	d9 ee                	fldz   
     b24:	dd 45 e8             	fldl   -0x18(%ebp)
     b27:	d9 c9                	fxch   %st(1)
     b29:	df e9                	fucomip %st(1),%st
     b2b:	dd d8                	fstp   %st(0)
     b2d:	76 24                	jbe    b53 <double2str+0x43>
  {
    buf[*pos] = '-';
     b2f:	8b 45 14             	mov    0x14(%ebp),%eax
     b32:	8b 00                	mov    (%eax),%eax
     b34:	89 c2                	mov    %eax,%edx
     b36:	8b 45 08             	mov    0x8(%ebp),%eax
     b39:	01 d0                	add    %edx,%eax
     b3b:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     b3e:	8b 45 14             	mov    0x14(%ebp),%eax
     b41:	8b 00                	mov    (%eax),%eax
     b43:	8d 50 01             	lea    0x1(%eax),%edx
     b46:	8b 45 14             	mov    0x14(%ebp),%eax
     b49:	89 10                	mov    %edx,(%eax)
    num = -num;
     b4b:	dd 45 e8             	fldl   -0x18(%ebp)
     b4e:	d9 e0                	fchs   
     b50:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     b53:	ff 75 ec             	pushl  -0x14(%ebp)
     b56:	ff 75 e8             	pushl  -0x18(%ebp)
     b59:	e8 b9 fe ff ff       	call   a17 <getInteger>
     b5e:	83 c4 08             	add    $0x8,%esp
     b61:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     b64:	83 ec 04             	sub    $0x4,%esp
     b67:	6a 01                	push   $0x1
     b69:	6a 0a                	push   $0xa
     b6b:	ff 75 14             	pushl  0x14(%ebp)
     b6e:	ff 75 f8             	pushl  -0x8(%ebp)
     b71:	ff 75 08             	pushl  0x8(%ebp)
     b74:	e8 d9 fe ff ff       	call   a52 <int2str>
     b79:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     b7c:	db 45 f8             	fildl  -0x8(%ebp)
     b7f:	dd 45 e8             	fldl   -0x18(%ebp)
     b82:	de e1                	fsubp  %st,%st(1)
     b84:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     b87:	dd 45 e8             	fldl   -0x18(%ebp)
     b8a:	dd 05 50 37 00 00    	fldl   0x3750
     b90:	d9 c9                	fxch   %st(1)
     b92:	df e9                	fucomip %st(1),%st
     b94:	dd d8                	fstp   %st(0)
     b96:	76 1c                	jbe    bb4 <double2str+0xa4>
  {
    buf[*pos] = '.';
     b98:	8b 45 14             	mov    0x14(%ebp),%eax
     b9b:	8b 00                	mov    (%eax),%eax
     b9d:	89 c2                	mov    %eax,%edx
     b9f:	8b 45 08             	mov    0x8(%ebp),%eax
     ba2:	01 d0                	add    %edx,%eax
     ba4:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     ba7:	8b 45 14             	mov    0x14(%ebp),%eax
     baa:	8b 00                	mov    (%eax),%eax
     bac:	8d 50 01             	lea    0x1(%eax),%edx
     baf:	8b 45 14             	mov    0x14(%ebp),%eax
     bb2:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     bb4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     bbb:	eb 4c                	jmp    c09 <double2str+0xf9>
  {
    num = num*10;
     bbd:	dd 45 e8             	fldl   -0x18(%ebp)
     bc0:	dd 05 58 37 00 00    	fldl   0x3758
     bc6:	de c9                	fmulp  %st,%st(1)
     bc8:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     bcb:	ff 75 ec             	pushl  -0x14(%ebp)
     bce:	ff 75 e8             	pushl  -0x18(%ebp)
     bd1:	e8 41 fe ff ff       	call   a17 <getInteger>
     bd6:	83 c4 08             	add    $0x8,%esp
     bd9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     bdc:	83 ec 04             	sub    $0x4,%esp
     bdf:	6a 01                	push   $0x1
     be1:	6a 0a                	push   $0xa
     be3:	ff 75 14             	pushl  0x14(%ebp)
     be6:	ff 75 f8             	pushl  -0x8(%ebp)
     be9:	ff 75 08             	pushl  0x8(%ebp)
     bec:	e8 61 fe ff ff       	call   a52 <int2str>
     bf1:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     bf4:	db 45 f8             	fildl  -0x8(%ebp)
     bf7:	dd 45 e8             	fldl   -0x18(%ebp)
     bfa:	de e1                	fsubp  %st,%st(1)
     bfc:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     bff:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     c03:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     c07:	7f 13                	jg     c1c <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     c09:	dd 45 e8             	fldl   -0x18(%ebp)
     c0c:	dd 05 50 37 00 00    	fldl   0x3750
     c12:	d9 c9                	fxch   %st(1)
     c14:	df e9                	fucomip %st(1),%st
     c16:	dd d8                	fstp   %st(0)
     c18:	77 a3                	ja     bbd <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     c1a:	eb 01                	jmp    c1d <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     c1c:	90                   	nop
    }
  }
}
     c1d:	90                   	nop
     c1e:	c9                   	leave  
     c1f:	c3                   	ret    

00000c20 <pow>:

double pow(double opnd, int power)
{
     c20:	55                   	push   %ebp
     c21:	89 e5                	mov    %esp,%ebp
     c23:	83 ec 18             	sub    $0x18,%esp
     c26:	8b 45 08             	mov    0x8(%ebp),%eax
     c29:	89 45 e8             	mov    %eax,-0x18(%ebp)
     c2c:	8b 45 0c             	mov    0xc(%ebp),%eax
     c2f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     c32:	d9 e8                	fld1   
     c34:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     c37:	eb 0d                	jmp    c46 <pow+0x26>
  {
    result *= opnd;
     c39:	dd 45 f8             	fldl   -0x8(%ebp)
     c3c:	dc 4d e8             	fmull  -0x18(%ebp)
     c3f:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     c42:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     c46:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     c4a:	7f ed                	jg     c39 <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     c4c:	dd 45 f8             	fldl   -0x8(%ebp)
}
     c4f:	c9                   	leave  
     c50:	c3                   	ret    

00000c51 <Translation>:

double Translation(char *s, int* pos)
{
     c51:	55                   	push   %ebp
     c52:	89 e5                	mov    %esp,%ebp
     c54:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     c57:	d9 ee                	fldz   
     c59:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     c5c:	d9 ee                	fldz   
     c5e:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c61:	eb 3e                	jmp    ca1 <Translation+0x50>
    {
        integer *= 10;
     c63:	dd 45 f8             	fldl   -0x8(%ebp)
     c66:	dd 05 58 37 00 00    	fldl   0x3758
     c6c:	de c9                	fmulp  %st,%st(1)
     c6e:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     c71:	8b 45 0c             	mov    0xc(%ebp),%eax
     c74:	8b 00                	mov    (%eax),%eax
     c76:	89 c2                	mov    %eax,%edx
     c78:	8b 45 08             	mov    0x8(%ebp),%eax
     c7b:	01 d0                	add    %edx,%eax
     c7d:	0f b6 00             	movzbl (%eax),%eax
     c80:	0f be c0             	movsbl %al,%eax
     c83:	83 e8 30             	sub    $0x30,%eax
     c86:	89 45 dc             	mov    %eax,-0x24(%ebp)
     c89:	db 45 dc             	fildl  -0x24(%ebp)
     c8c:	dd 45 f8             	fldl   -0x8(%ebp)
     c8f:	de c1                	faddp  %st,%st(1)
     c91:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     c94:	8b 45 0c             	mov    0xc(%ebp),%eax
     c97:	8b 00                	mov    (%eax),%eax
     c99:	8d 50 01             	lea    0x1(%eax),%edx
     c9c:	8b 45 0c             	mov    0xc(%ebp),%eax
     c9f:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     ca1:	8b 45 0c             	mov    0xc(%ebp),%eax
     ca4:	8b 00                	mov    (%eax),%eax
     ca6:	89 c2                	mov    %eax,%edx
     ca8:	8b 45 08             	mov    0x8(%ebp),%eax
     cab:	01 d0                	add    %edx,%eax
     cad:	0f b6 00             	movzbl (%eax),%eax
     cb0:	3c 2f                	cmp    $0x2f,%al
     cb2:	7e 13                	jle    cc7 <Translation+0x76>
     cb4:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb7:	8b 00                	mov    (%eax),%eax
     cb9:	89 c2                	mov    %eax,%edx
     cbb:	8b 45 08             	mov    0x8(%ebp),%eax
     cbe:	01 d0                	add    %edx,%eax
     cc0:	0f b6 00             	movzbl (%eax),%eax
     cc3:	3c 39                	cmp    $0x39,%al
     cc5:	7e 9c                	jle    c63 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     cc7:	8b 45 0c             	mov    0xc(%ebp),%eax
     cca:	8b 00                	mov    (%eax),%eax
     ccc:	89 c2                	mov    %eax,%edx
     cce:	8b 45 08             	mov    0x8(%ebp),%eax
     cd1:	01 d0                	add    %edx,%eax
     cd3:	0f b6 00             	movzbl (%eax),%eax
     cd6:	3c 2e                	cmp    $0x2e,%al
     cd8:	0f 85 9b 00 00 00    	jne    d79 <Translation+0x128>
    {
        (*pos)++;
     cde:	8b 45 0c             	mov    0xc(%ebp),%eax
     ce1:	8b 00                	mov    (%eax),%eax
     ce3:	8d 50 01             	lea    0x1(%eax),%edx
     ce6:	8b 45 0c             	mov    0xc(%ebp),%eax
     ce9:	89 10                	mov    %edx,(%eax)
        int c = 1;
     ceb:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     cf2:	eb 5b                	jmp    d4f <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     cf4:	8b 45 0c             	mov    0xc(%ebp),%eax
     cf7:	8b 00                	mov    (%eax),%eax
     cf9:	89 c2                	mov    %eax,%edx
     cfb:	8b 45 08             	mov    0x8(%ebp),%eax
     cfe:	01 d0                	add    %edx,%eax
     d00:	0f b6 00             	movzbl (%eax),%eax
     d03:	0f be c0             	movsbl %al,%eax
     d06:	83 e8 30             	sub    $0x30,%eax
     d09:	89 45 dc             	mov    %eax,-0x24(%ebp)
     d0c:	db 45 dc             	fildl  -0x24(%ebp)
     d0f:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     d12:	83 ec 04             	sub    $0x4,%esp
     d15:	ff 75 ec             	pushl  -0x14(%ebp)
     d18:	dd 05 60 37 00 00    	fldl   0x3760
     d1e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     d22:	dd 1c 24             	fstpl  (%esp)
     d25:	e8 f6 fe ff ff       	call   c20 <pow>
     d2a:	83 c4 10             	add    $0x10,%esp
     d2d:	dd 45 e0             	fldl   -0x20(%ebp)
     d30:	de c9                	fmulp  %st,%st(1)
     d32:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     d35:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     d39:	dd 45 f0             	fldl   -0x10(%ebp)
     d3c:	dc 45 e0             	faddl  -0x20(%ebp)
     d3f:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     d42:	8b 45 0c             	mov    0xc(%ebp),%eax
     d45:	8b 00                	mov    (%eax),%eax
     d47:	8d 50 01             	lea    0x1(%eax),%edx
     d4a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d4d:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     d4f:	8b 45 0c             	mov    0xc(%ebp),%eax
     d52:	8b 00                	mov    (%eax),%eax
     d54:	89 c2                	mov    %eax,%edx
     d56:	8b 45 08             	mov    0x8(%ebp),%eax
     d59:	01 d0                	add    %edx,%eax
     d5b:	0f b6 00             	movzbl (%eax),%eax
     d5e:	3c 2f                	cmp    $0x2f,%al
     d60:	7e 17                	jle    d79 <Translation+0x128>
     d62:	8b 45 0c             	mov    0xc(%ebp),%eax
     d65:	8b 00                	mov    (%eax),%eax
     d67:	89 c2                	mov    %eax,%edx
     d69:	8b 45 08             	mov    0x8(%ebp),%eax
     d6c:	01 d0                	add    %edx,%eax
     d6e:	0f b6 00             	movzbl (%eax),%eax
     d71:	3c 39                	cmp    $0x39,%al
     d73:	0f 8e 7b ff ff ff    	jle    cf4 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     d79:	dd 45 f8             	fldl   -0x8(%ebp)
     d7c:	dc 45 f0             	faddl  -0x10(%ebp)
     d7f:	c9                   	leave  
     d80:	c3                   	ret    

00000d81 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     d81:	55                   	push   %ebp
     d82:	89 e5                	mov    %esp,%ebp
     d84:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     d87:	e8 d2 f5 ff ff       	call   35e <fork>
     d8c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     d8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d92:	c9                   	leave  
     d93:	c3                   	ret    

00000d94 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     d94:	55                   	push   %ebp
     d95:	89 e5                	mov    %esp,%ebp
     d97:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d9a:	83 ec 0c             	sub    $0xc,%esp
     d9d:	6a 54                	push   $0x54
     d9f:	e8 70 fb ff ff       	call   914 <malloc>
     da4:	83 c4 10             	add    $0x10,%esp
     da7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     daa:	83 ec 04             	sub    $0x4,%esp
     dad:	6a 54                	push   $0x54
     daf:	6a 00                	push   $0x0
     db1:	ff 75 f4             	pushl  -0xc(%ebp)
     db4:	e8 12 f4 ff ff       	call   1cb <memset>
     db9:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     dbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dbf:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     dc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     dc8:	c9                   	leave  
     dc9:	c3                   	ret    

00000dca <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     dca:	55                   	push   %ebp
     dcb:	89 e5                	mov    %esp,%ebp
     dcd:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     dd0:	83 ec 0c             	sub    $0xc,%esp
     dd3:	6a 18                	push   $0x18
     dd5:	e8 3a fb ff ff       	call   914 <malloc>
     dda:	83 c4 10             	add    $0x10,%esp
     ddd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     de0:	83 ec 04             	sub    $0x4,%esp
     de3:	6a 18                	push   $0x18
     de5:	6a 00                	push   $0x0
     de7:	ff 75 f4             	pushl  -0xc(%ebp)
     dea:	e8 dc f3 ff ff       	call   1cb <memset>
     def:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     df2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     df5:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     dfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dfe:	8b 55 08             	mov    0x8(%ebp),%edx
     e01:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     e04:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e07:	8b 55 0c             	mov    0xc(%ebp),%edx
     e0a:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     e0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e10:	8b 55 10             	mov    0x10(%ebp),%edx
     e13:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     e16:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e19:	8b 55 14             	mov    0x14(%ebp),%edx
     e1c:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     e1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e22:	8b 55 18             	mov    0x18(%ebp),%edx
     e25:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     e28:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e2b:	c9                   	leave  
     e2c:	c3                   	ret    

00000e2d <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     e2d:	55                   	push   %ebp
     e2e:	89 e5                	mov    %esp,%ebp
     e30:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e33:	83 ec 0c             	sub    $0xc,%esp
     e36:	6a 0c                	push   $0xc
     e38:	e8 d7 fa ff ff       	call   914 <malloc>
     e3d:	83 c4 10             	add    $0x10,%esp
     e40:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e43:	83 ec 04             	sub    $0x4,%esp
     e46:	6a 0c                	push   $0xc
     e48:	6a 00                	push   $0x0
     e4a:	ff 75 f4             	pushl  -0xc(%ebp)
     e4d:	e8 79 f3 ff ff       	call   1cb <memset>
     e52:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     e55:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e58:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     e5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e61:	8b 55 08             	mov    0x8(%ebp),%edx
     e64:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     e67:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e6a:	8b 55 0c             	mov    0xc(%ebp),%edx
     e6d:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     e70:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e73:	c9                   	leave  
     e74:	c3                   	ret    

00000e75 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     e75:	55                   	push   %ebp
     e76:	89 e5                	mov    %esp,%ebp
     e78:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e7b:	83 ec 0c             	sub    $0xc,%esp
     e7e:	6a 0c                	push   $0xc
     e80:	e8 8f fa ff ff       	call   914 <malloc>
     e85:	83 c4 10             	add    $0x10,%esp
     e88:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e8b:	83 ec 04             	sub    $0x4,%esp
     e8e:	6a 0c                	push   $0xc
     e90:	6a 00                	push   $0x0
     e92:	ff 75 f4             	pushl  -0xc(%ebp)
     e95:	e8 31 f3 ff ff       	call   1cb <memset>
     e9a:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     e9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ea0:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     ea6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ea9:	8b 55 08             	mov    0x8(%ebp),%edx
     eac:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     eaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eb2:	8b 55 0c             	mov    0xc(%ebp),%edx
     eb5:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     eb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ebb:	c9                   	leave  
     ebc:	c3                   	ret    

00000ebd <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     ebd:	55                   	push   %ebp
     ebe:	89 e5                	mov    %esp,%ebp
     ec0:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     ec3:	83 ec 0c             	sub    $0xc,%esp
     ec6:	6a 08                	push   $0x8
     ec8:	e8 47 fa ff ff       	call   914 <malloc>
     ecd:	83 c4 10             	add    $0x10,%esp
     ed0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     ed3:	83 ec 04             	sub    $0x4,%esp
     ed6:	6a 08                	push   $0x8
     ed8:	6a 00                	push   $0x0
     eda:	ff 75 f4             	pushl  -0xc(%ebp)
     edd:	e8 e9 f2 ff ff       	call   1cb <memset>
     ee2:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
     ee5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ee8:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     eee:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ef1:	8b 55 08             	mov    0x8(%ebp),%edx
     ef4:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     ef7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     efa:	c9                   	leave  
     efb:	c3                   	ret    

00000efc <calcmd>:

struct cmd* calcmd(char *_line)
{
     efc:	55                   	push   %ebp
     efd:	89 e5                	mov    %esp,%ebp
     eff:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     f02:	83 ec 0c             	sub    $0xc,%esp
     f05:	6a 08                	push   $0x8
     f07:	e8 08 fa ff ff       	call   914 <malloc>
     f0c:	83 c4 10             	add    $0x10,%esp
     f0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     f12:	83 ec 04             	sub    $0x4,%esp
     f15:	6a 08                	push   $0x8
     f17:	6a 00                	push   $0x0
     f19:	ff 75 f4             	pushl  -0xc(%ebp)
     f1c:	e8 aa f2 ff ff       	call   1cb <memset>
     f21:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
     f24:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f27:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
     f2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f30:	8b 55 08             	mov    0x8(%ebp),%edx
     f33:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     f36:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f39:	c9                   	leave  
     f3a:	c3                   	ret    

00000f3b <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
     f3b:	55                   	push   %ebp
     f3c:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
     f3e:	eb 0c                	jmp    f4c <mystrncmp+0x11>
    n--, p++, q++;
     f40:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     f44:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     f48:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
     f4c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     f50:	74 1a                	je     f6c <mystrncmp+0x31>
     f52:	8b 45 08             	mov    0x8(%ebp),%eax
     f55:	0f b6 00             	movzbl (%eax),%eax
     f58:	84 c0                	test   %al,%al
     f5a:	74 10                	je     f6c <mystrncmp+0x31>
     f5c:	8b 45 08             	mov    0x8(%ebp),%eax
     f5f:	0f b6 10             	movzbl (%eax),%edx
     f62:	8b 45 0c             	mov    0xc(%ebp),%eax
     f65:	0f b6 00             	movzbl (%eax),%eax
     f68:	38 c2                	cmp    %al,%dl
     f6a:	74 d4                	je     f40 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
     f6c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     f70:	75 07                	jne    f79 <mystrncmp+0x3e>
    return 0;
     f72:	b8 00 00 00 00       	mov    $0x0,%eax
     f77:	eb 16                	jmp    f8f <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
     f79:	8b 45 08             	mov    0x8(%ebp),%eax
     f7c:	0f b6 00             	movzbl (%eax),%eax
     f7f:	0f b6 d0             	movzbl %al,%edx
     f82:	8b 45 0c             	mov    0xc(%ebp),%eax
     f85:	0f b6 00             	movzbl (%eax),%eax
     f88:	0f b6 c0             	movzbl %al,%eax
     f8b:	29 c2                	sub    %eax,%edx
     f8d:	89 d0                	mov    %edx,%eax
}
     f8f:	5d                   	pop    %ebp
     f90:	c3                   	ret    

00000f91 <mystrlen>:

static int mystrlen(const char *s)
{
     f91:	55                   	push   %ebp
     f92:	89 e5                	mov    %esp,%ebp
     f94:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
     f97:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     f9e:	eb 04                	jmp    fa4 <mystrlen+0x13>
     fa0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     fa4:	8b 55 fc             	mov    -0x4(%ebp),%edx
     fa7:	8b 45 08             	mov    0x8(%ebp),%eax
     faa:	01 d0                	add    %edx,%eax
     fac:	0f b6 00             	movzbl (%eax),%eax
     faf:	84 c0                	test   %al,%al
     fb1:	75 ed                	jne    fa0 <mystrlen+0xf>
    ;
  return n;
     fb3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     fb6:	c9                   	leave  
     fb7:	c3                   	ret    

00000fb8 <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
     fb8:	55                   	push   %ebp
     fb9:	89 e5                	mov    %esp,%ebp
     fbb:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
     fbe:	8b 45 08             	mov    0x8(%ebp),%eax
     fc1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
     fc4:	90                   	nop
     fc5:	8b 45 10             	mov    0x10(%ebp),%eax
     fc8:	8d 50 ff             	lea    -0x1(%eax),%edx
     fcb:	89 55 10             	mov    %edx,0x10(%ebp)
     fce:	85 c0                	test   %eax,%eax
     fd0:	7e 2c                	jle    ffe <mystrncpy+0x46>
     fd2:	8b 45 08             	mov    0x8(%ebp),%eax
     fd5:	8d 50 01             	lea    0x1(%eax),%edx
     fd8:	89 55 08             	mov    %edx,0x8(%ebp)
     fdb:	8b 55 0c             	mov    0xc(%ebp),%edx
     fde:	8d 4a 01             	lea    0x1(%edx),%ecx
     fe1:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     fe4:	0f b6 12             	movzbl (%edx),%edx
     fe7:	88 10                	mov    %dl,(%eax)
     fe9:	0f b6 00             	movzbl (%eax),%eax
     fec:	84 c0                	test   %al,%al
     fee:	75 d5                	jne    fc5 <mystrncpy+0xd>
    ;
  while(n-- > 0)
     ff0:	eb 0c                	jmp    ffe <mystrncpy+0x46>
    *s++ = 0;
     ff2:	8b 45 08             	mov    0x8(%ebp),%eax
     ff5:	8d 50 01             	lea    0x1(%eax),%edx
     ff8:	89 55 08             	mov    %edx,0x8(%ebp)
     ffb:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
     ffe:	8b 45 10             	mov    0x10(%ebp),%eax
    1001:	8d 50 ff             	lea    -0x1(%eax),%edx
    1004:	89 55 10             	mov    %edx,0x10(%ebp)
    1007:	85 c0                	test   %eax,%eax
    1009:	7f e7                	jg     ff2 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    100b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    100e:	c9                   	leave  
    100f:	c3                   	ret    

00001010 <isEqual>:

int isEqual(double a, double b)
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	83 ec 10             	sub    $0x10,%esp
    1016:	8b 45 08             	mov    0x8(%ebp),%eax
    1019:	89 45 f8             	mov    %eax,-0x8(%ebp)
    101c:	8b 45 0c             	mov    0xc(%ebp),%eax
    101f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1022:	8b 45 10             	mov    0x10(%ebp),%eax
    1025:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1028:	8b 45 14             	mov    0x14(%ebp),%eax
    102b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    102e:	dd 45 f8             	fldl   -0x8(%ebp)
    1031:	dc 65 f0             	fsubl  -0x10(%ebp)
    1034:	dd 05 30 39 00 00    	fldl   0x3930
    103a:	df e9                	fucomip %st(1),%st
    103c:	dd d8                	fstp   %st(0)
    103e:	76 19                	jbe    1059 <isEqual+0x49>
    1040:	dd 45 f0             	fldl   -0x10(%ebp)
    1043:	dc 65 f8             	fsubl  -0x8(%ebp)
    1046:	dd 05 30 39 00 00    	fldl   0x3930
    104c:	df e9                	fucomip %st(1),%st
    104e:	dd d8                	fstp   %st(0)
    1050:	76 07                	jbe    1059 <isEqual+0x49>
    return 1;
    1052:	b8 01 00 00 00       	mov    $0x1,%eax
    1057:	eb 05                	jmp    105e <isEqual+0x4e>
  return 0;
    1059:	b8 00 00 00 00       	mov    $0x0,%eax
}
    105e:	c9                   	leave  
    105f:	c3                   	ret    

00001060 <isCmdName>:

int isCmdName(const char* str)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	53                   	push   %ebx
    1064:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    1067:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    106e:	eb 71                	jmp    10e1 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1070:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1073:	89 d0                	mov    %edx,%eax
    1075:	c1 e0 02             	shl    $0x2,%eax
    1078:	01 d0                	add    %edx,%eax
    107a:	01 c0                	add    %eax,%eax
    107c:	05 a0 43 00 00       	add    $0x43a0,%eax
    1081:	83 ec 0c             	sub    $0xc,%esp
    1084:	50                   	push   %eax
    1085:	e8 1a f1 ff ff       	call   1a4 <strlen>
    108a:	83 c4 10             	add    $0x10,%esp
    108d:	89 c3                	mov    %eax,%ebx
    108f:	83 ec 0c             	sub    $0xc,%esp
    1092:	ff 75 08             	pushl  0x8(%ebp)
    1095:	e8 f7 fe ff ff       	call   f91 <mystrlen>
    109a:	83 c4 10             	add    $0x10,%esp
    109d:	39 c3                	cmp    %eax,%ebx
    109f:	75 3c                	jne    10dd <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    10a1:	83 ec 0c             	sub    $0xc,%esp
    10a4:	ff 75 08             	pushl  0x8(%ebp)
    10a7:	e8 e5 fe ff ff       	call   f91 <mystrlen>
    10ac:	83 c4 10             	add    $0x10,%esp
    10af:	89 c1                	mov    %eax,%ecx
    10b1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    10b4:	89 d0                	mov    %edx,%eax
    10b6:	c1 e0 02             	shl    $0x2,%eax
    10b9:	01 d0                	add    %edx,%eax
    10bb:	01 c0                	add    %eax,%eax
    10bd:	05 a0 43 00 00       	add    $0x43a0,%eax
    10c2:	83 ec 04             	sub    $0x4,%esp
    10c5:	51                   	push   %ecx
    10c6:	ff 75 08             	pushl  0x8(%ebp)
    10c9:	50                   	push   %eax
    10ca:	e8 6c fe ff ff       	call   f3b <mystrncmp>
    10cf:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    10d2:	85 c0                	test   %eax,%eax
    10d4:	75 07                	jne    10dd <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    10d6:	b8 01 00 00 00       	mov    $0x1,%eax
    10db:	eb 0f                	jmp    10ec <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    10dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    10e1:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    10e5:	7e 89                	jle    1070 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    10e7:	b8 00 00 00 00       	mov    $0x0,%eax
}
    10ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10ef:	c9                   	leave  
    10f0:	c3                   	ret    

000010f1 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    10f1:	55                   	push   %ebp
    10f2:	89 e5                	mov    %esp,%ebp
    10f4:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    10fa:	83 ec 08             	sub    $0x8,%esp
    10fd:	6a 00                	push   $0x0
    10ff:	68 68 44 00 00       	push   $0x4468
    1104:	e8 9d f2 ff ff       	call   3a6 <open>
    1109:	83 c4 10             	add    $0x10,%esp
    110c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    110f:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1113:	79 0a                	jns    111f <findAlias+0x2e>
  {
      return 0; //no aliasfile
    1115:	b8 00 00 00 00       	mov    $0x0,%eax
    111a:	e9 9a 01 00 00       	jmp    12b9 <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    111f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    1126:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    112d:	e9 ee 00 00 00       	jmp    1220 <findAlias+0x12f>
  {
      int isSame = 1;
    1132:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    1139:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    1140:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    1147:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    114e:	83 ec 0c             	sub    $0xc,%esp
    1151:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1154:	50                   	push   %eax
    1155:	e8 4a f0 ff ff       	call   1a4 <strlen>
    115a:	83 c4 10             	add    $0x10,%esp
    115d:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    1160:	83 ec 0c             	sub    $0xc,%esp
    1163:	ff 75 08             	pushl  0x8(%ebp)
    1166:	e8 39 f0 ff ff       	call   1a4 <strlen>
    116b:	83 c4 10             	add    $0x10,%esp
    116e:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    1171:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1174:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1177:	01 d0                	add    %edx,%eax
    1179:	0f b6 00             	movzbl (%eax),%eax
    117c:	3c 21                	cmp    $0x21,%al
    117e:	75 38                	jne    11b8 <findAlias+0xc7>
      {
          startIndex++;
    1180:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    1184:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    118b:	eb 2b                	jmp    11b8 <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    118d:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1190:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1193:	01 d0                	add    %edx,%eax
    1195:	0f b6 10             	movzbl (%eax),%edx
    1198:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    119b:	8b 45 08             	mov    0x8(%ebp),%eax
    119e:	01 c8                	add    %ecx,%eax
    11a0:	0f b6 00             	movzbl (%eax),%eax
    11a3:	38 c2                	cmp    %al,%dl
    11a5:	74 09                	je     11b0 <findAlias+0xbf>
          {
              isSame = 0;
    11a7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    11ae:	eb 1f                	jmp    11cf <findAlias+0xde>
          }
          startIndex++;
    11b0:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    11b4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    11b8:	8d 55 9a             	lea    -0x66(%ebp),%edx
    11bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11be:	01 d0                	add    %edx,%eax
    11c0:	0f b6 00             	movzbl (%eax),%eax
    11c3:	3c 3d                	cmp    $0x3d,%al
    11c5:	74 08                	je     11cf <findAlias+0xde>
    11c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11ca:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    11cd:	7c be                	jl     118d <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    11cf:	8d 55 9a             	lea    -0x66(%ebp),%edx
    11d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11d5:	01 d0                	add    %edx,%eax
    11d7:	0f b6 00             	movzbl (%eax),%eax
    11da:	3c 3d                	cmp    $0x3d,%al
    11dc:	75 08                	jne    11e6 <findAlias+0xf5>
    11de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11e1:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    11e4:	7d 07                	jge    11ed <findAlias+0xfc>
      {
          isSame = 0;
    11e6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    11ed:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    11f1:	75 0b                	jne    11fe <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    11f3:	b8 01 00 00 00       	mov    $0x1,%eax
    11f8:	2b 45 f0             	sub    -0x10(%ebp),%eax
    11fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    11fe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1202:	75 1c                	jne    1220 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    1204:	83 ec 08             	sub    $0x8,%esp
    1207:	8d 45 9a             	lea    -0x66(%ebp),%eax
    120a:	50                   	push   %eax
    120b:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1211:	50                   	push   %eax
    1212:	e8 1e ef ff ff       	call   135 <strcpy>
    1217:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    121a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    121d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1220:	83 ec 04             	sub    $0x4,%esp
    1223:	6a 32                	push   $0x32
    1225:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1228:	50                   	push   %eax
    1229:	ff 75 dc             	pushl  -0x24(%ebp)
    122c:	e8 4d f1 ff ff       	call   37e <read>
    1231:	83 c4 10             	add    $0x10,%esp
    1234:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1237:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    123b:	0f 8f f1 fe ff ff    	jg     1132 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    1241:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1245:	75 5f                	jne    12a6 <findAlias+0x1b5>
  {
    int i = 0;
    1247:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    124e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    1252:	eb 20                	jmp    1274 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    1254:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1257:	8b 45 0c             	mov    0xc(%ebp),%eax
    125a:	01 c2                	add    %eax,%edx
    125c:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    1262:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1265:	01 c8                	add    %ecx,%eax
    1267:	0f b6 00             	movzbl (%eax),%eax
    126a:	88 02                	mov    %al,(%edx)
      i++;
    126c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    1270:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    1274:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    127a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    127d:	01 d0                	add    %edx,%eax
    127f:	0f b6 00             	movzbl (%eax),%eax
    1282:	84 c0                	test   %al,%al
    1284:	75 ce                	jne    1254 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    1286:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1289:	8b 45 0c             	mov    0xc(%ebp),%eax
    128c:	01 d0                	add    %edx,%eax
    128e:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    1291:	83 ec 0c             	sub    $0xc,%esp
    1294:	ff 75 dc             	pushl  -0x24(%ebp)
    1297:	e8 f2 f0 ff ff       	call   38e <close>
    129c:	83 c4 10             	add    $0x10,%esp
    return 1;
    129f:	b8 01 00 00 00       	mov    $0x1,%eax
    12a4:	eb 13                	jmp    12b9 <findAlias+0x1c8>
  }
  close(fd);
    12a6:	83 ec 0c             	sub    $0xc,%esp
    12a9:	ff 75 dc             	pushl  -0x24(%ebp)
    12ac:	e8 dd f0 ff ff       	call   38e <close>
    12b1:	83 c4 10             	add    $0x10,%esp
  return 0;
    12b4:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12b9:	c9                   	leave  
    12ba:	c3                   	ret    

000012bb <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    12bb:	55                   	push   %ebp
    12bc:	89 e5                	mov    %esp,%ebp
    12be:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    12c1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    12c5:	75 05                	jne    12cc <runcmd+0x11>
    exit();
    12c7:	e8 9a f0 ff ff       	call   366 <exit>
  
  switch(cmd->type){
    12cc:	8b 45 08             	mov    0x8(%ebp),%eax
    12cf:	8b 00                	mov    (%eax),%eax
    12d1:	83 f8 05             	cmp    $0x5,%eax
    12d4:	77 09                	ja     12df <runcmd+0x24>
    12d6:	8b 04 85 94 37 00 00 	mov    0x3794(,%eax,4),%eax
    12dd:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    12df:	83 ec 0c             	sub    $0xc,%esp
    12e2:	68 68 37 00 00       	push   $0x3768
    12e7:	e8 0b f7 ff ff       	call   9f7 <panic1>
    12ec:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    12ef:	8b 45 08             	mov    0x8(%ebp),%eax
    12f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    12f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12f8:	8b 40 04             	mov    0x4(%eax),%eax
    12fb:	85 c0                	test   %eax,%eax
    12fd:	75 05                	jne    1304 <runcmd+0x49>
      exit();
    12ff:	e8 62 f0 ff ff       	call   366 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    1304:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1307:	8b 40 04             	mov    0x4(%eax),%eax
    130a:	83 ec 0c             	sub    $0xc,%esp
    130d:	50                   	push   %eax
    130e:	e8 4d fd ff ff       	call   1060 <isCmdName>
    1313:	83 c4 10             	add    $0x10,%esp
    1316:	85 c0                	test   %eax,%eax
    1318:	75 37                	jne    1351 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    131a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    131d:	8b 40 04             	mov    0x4(%eax),%eax
    1320:	83 ec 08             	sub    $0x8,%esp
    1323:	8d 55 ce             	lea    -0x32(%ebp),%edx
    1326:	52                   	push   %edx
    1327:	50                   	push   %eax
    1328:	e8 c4 fd ff ff       	call   10f1 <findAlias>
    132d:	83 c4 10             	add    $0x10,%esp
    1330:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    1333:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1337:	75 31                	jne    136a <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    1339:	8b 45 f4             	mov    -0xc(%ebp),%eax
    133c:	83 c0 04             	add    $0x4,%eax
    133f:	83 ec 08             	sub    $0x8,%esp
    1342:	50                   	push   %eax
    1343:	8d 45 ce             	lea    -0x32(%ebp),%eax
    1346:	50                   	push   %eax
    1347:	e8 52 f0 ff ff       	call   39e <exec>
    134c:	83 c4 10             	add    $0x10,%esp
    134f:	eb 19                	jmp    136a <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    1351:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1354:	8d 50 04             	lea    0x4(%eax),%edx
    1357:	8b 45 f4             	mov    -0xc(%ebp),%eax
    135a:	8b 40 04             	mov    0x4(%eax),%eax
    135d:	83 ec 08             	sub    $0x8,%esp
    1360:	52                   	push   %edx
    1361:	50                   	push   %eax
    1362:	e8 37 f0 ff ff       	call   39e <exec>
    1367:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    136a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    136d:	8b 40 04             	mov    0x4(%eax),%eax
    1370:	83 ec 04             	sub    $0x4,%esp
    1373:	50                   	push   %eax
    1374:	68 6f 37 00 00       	push   $0x376f
    1379:	6a 02                	push   $0x2
    137b:	e8 92 f2 ff ff       	call   612 <printf>
    1380:	83 c4 10             	add    $0x10,%esp
    break;
    1383:	e9 c6 01 00 00       	jmp    154e <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    1388:	8b 45 08             	mov    0x8(%ebp),%eax
    138b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    138e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1391:	8b 40 14             	mov    0x14(%eax),%eax
    1394:	83 ec 0c             	sub    $0xc,%esp
    1397:	50                   	push   %eax
    1398:	e8 f1 ef ff ff       	call   38e <close>
    139d:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    13a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13a3:	8b 50 10             	mov    0x10(%eax),%edx
    13a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13a9:	8b 40 08             	mov    0x8(%eax),%eax
    13ac:	83 ec 08             	sub    $0x8,%esp
    13af:	52                   	push   %edx
    13b0:	50                   	push   %eax
    13b1:	e8 f0 ef ff ff       	call   3a6 <open>
    13b6:	83 c4 10             	add    $0x10,%esp
    13b9:	85 c0                	test   %eax,%eax
    13bb:	79 1e                	jns    13db <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    13bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13c0:	8b 40 08             	mov    0x8(%eax),%eax
    13c3:	83 ec 04             	sub    $0x4,%esp
    13c6:	50                   	push   %eax
    13c7:	68 7f 37 00 00       	push   $0x377f
    13cc:	6a 02                	push   $0x2
    13ce:	e8 3f f2 ff ff       	call   612 <printf>
    13d3:	83 c4 10             	add    $0x10,%esp
      exit();
    13d6:	e8 8b ef ff ff       	call   366 <exit>
    }
    runcmd(rcmd->cmd);
    13db:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13de:	8b 40 04             	mov    0x4(%eax),%eax
    13e1:	83 ec 0c             	sub    $0xc,%esp
    13e4:	50                   	push   %eax
    13e5:	e8 d1 fe ff ff       	call   12bb <runcmd>
    13ea:	83 c4 10             	add    $0x10,%esp
    break;
    13ed:	e9 5c 01 00 00       	jmp    154e <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    13f2:	8b 45 08             	mov    0x8(%ebp),%eax
    13f5:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    13f8:	e8 84 f9 ff ff       	call   d81 <fork1>
    13fd:	85 c0                	test   %eax,%eax
    13ff:	75 12                	jne    1413 <runcmd+0x158>
      runcmd(lcmd->left);
    1401:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1404:	8b 40 04             	mov    0x4(%eax),%eax
    1407:	83 ec 0c             	sub    $0xc,%esp
    140a:	50                   	push   %eax
    140b:	e8 ab fe ff ff       	call   12bb <runcmd>
    1410:	83 c4 10             	add    $0x10,%esp
    wait();
    1413:	e8 56 ef ff ff       	call   36e <wait>
    runcmd(lcmd->right);
    1418:	8b 45 e8             	mov    -0x18(%ebp),%eax
    141b:	8b 40 08             	mov    0x8(%eax),%eax
    141e:	83 ec 0c             	sub    $0xc,%esp
    1421:	50                   	push   %eax
    1422:	e8 94 fe ff ff       	call   12bb <runcmd>
    1427:	83 c4 10             	add    $0x10,%esp
    break;
    142a:	e9 1f 01 00 00       	jmp    154e <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    142f:	8b 45 08             	mov    0x8(%ebp),%eax
    1432:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    1435:	83 ec 0c             	sub    $0xc,%esp
    1438:	8d 45 d8             	lea    -0x28(%ebp),%eax
    143b:	50                   	push   %eax
    143c:	e8 35 ef ff ff       	call   376 <pipe>
    1441:	83 c4 10             	add    $0x10,%esp
    1444:	85 c0                	test   %eax,%eax
    1446:	79 10                	jns    1458 <runcmd+0x19d>
      panic1("pipe");
    1448:	83 ec 0c             	sub    $0xc,%esp
    144b:	68 8f 37 00 00       	push   $0x378f
    1450:	e8 a2 f5 ff ff       	call   9f7 <panic1>
    1455:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    1458:	e8 24 f9 ff ff       	call   d81 <fork1>
    145d:	85 c0                	test   %eax,%eax
    145f:	75 4c                	jne    14ad <runcmd+0x1f2>
      close(1);
    1461:	83 ec 0c             	sub    $0xc,%esp
    1464:	6a 01                	push   $0x1
    1466:	e8 23 ef ff ff       	call   38e <close>
    146b:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    146e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1471:	83 ec 0c             	sub    $0xc,%esp
    1474:	50                   	push   %eax
    1475:	e8 64 ef ff ff       	call   3de <dup>
    147a:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    147d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1480:	83 ec 0c             	sub    $0xc,%esp
    1483:	50                   	push   %eax
    1484:	e8 05 ef ff ff       	call   38e <close>
    1489:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    148c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    148f:	83 ec 0c             	sub    $0xc,%esp
    1492:	50                   	push   %eax
    1493:	e8 f6 ee ff ff       	call   38e <close>
    1498:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    149b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    149e:	8b 40 04             	mov    0x4(%eax),%eax
    14a1:	83 ec 0c             	sub    $0xc,%esp
    14a4:	50                   	push   %eax
    14a5:	e8 11 fe ff ff       	call   12bb <runcmd>
    14aa:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    14ad:	e8 cf f8 ff ff       	call   d81 <fork1>
    14b2:	85 c0                	test   %eax,%eax
    14b4:	75 4c                	jne    1502 <runcmd+0x247>
      close(0);
    14b6:	83 ec 0c             	sub    $0xc,%esp
    14b9:	6a 00                	push   $0x0
    14bb:	e8 ce ee ff ff       	call   38e <close>
    14c0:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    14c3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    14c6:	83 ec 0c             	sub    $0xc,%esp
    14c9:	50                   	push   %eax
    14ca:	e8 0f ef ff ff       	call   3de <dup>
    14cf:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    14d2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    14d5:	83 ec 0c             	sub    $0xc,%esp
    14d8:	50                   	push   %eax
    14d9:	e8 b0 ee ff ff       	call   38e <close>
    14de:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    14e1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    14e4:	83 ec 0c             	sub    $0xc,%esp
    14e7:	50                   	push   %eax
    14e8:	e8 a1 ee ff ff       	call   38e <close>
    14ed:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    14f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    14f3:	8b 40 08             	mov    0x8(%eax),%eax
    14f6:	83 ec 0c             	sub    $0xc,%esp
    14f9:	50                   	push   %eax
    14fa:	e8 bc fd ff ff       	call   12bb <runcmd>
    14ff:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    1502:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1505:	83 ec 0c             	sub    $0xc,%esp
    1508:	50                   	push   %eax
    1509:	e8 80 ee ff ff       	call   38e <close>
    150e:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    1511:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1514:	83 ec 0c             	sub    $0xc,%esp
    1517:	50                   	push   %eax
    1518:	e8 71 ee ff ff       	call   38e <close>
    151d:	83 c4 10             	add    $0x10,%esp
    wait();
    1520:	e8 49 ee ff ff       	call   36e <wait>
    wait();
    1525:	e8 44 ee ff ff       	call   36e <wait>
    break;
    152a:	eb 22                	jmp    154e <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    152c:	8b 45 08             	mov    0x8(%ebp),%eax
    152f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    1532:	e8 4a f8 ff ff       	call   d81 <fork1>
    1537:	85 c0                	test   %eax,%eax
    1539:	75 12                	jne    154d <runcmd+0x292>
      runcmd(bcmd->cmd);
    153b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    153e:	8b 40 04             	mov    0x4(%eax),%eax
    1541:	83 ec 0c             	sub    $0xc,%esp
    1544:	50                   	push   %eax
    1545:	e8 71 fd ff ff       	call   12bb <runcmd>
    154a:	83 c4 10             	add    $0x10,%esp
    break;
    154d:	90                   	nop
  }
  exit();
    154e:	e8 13 ee ff ff       	call   366 <exit>

00001553 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    1553:	55                   	push   %ebp
    1554:	89 e5                	mov    %esp,%ebp
    1556:	83 ec 04             	sub    $0x4,%esp
    1559:	8b 45 08             	mov    0x8(%ebp),%eax
    155c:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    155f:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    1563:	7e 0d                	jle    1572 <isNameChar+0x1f>
    1565:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    1569:	7f 07                	jg     1572 <isNameChar+0x1f>
    return 1;
    156b:	b8 01 00 00 00       	mov    $0x1,%eax
    1570:	eb 38                	jmp    15aa <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    1572:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    1576:	7e 0d                	jle    1585 <isNameChar+0x32>
    1578:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    157c:	7f 07                	jg     1585 <isNameChar+0x32>
    return 1;
    157e:	b8 01 00 00 00       	mov    $0x1,%eax
    1583:	eb 25                	jmp    15aa <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    1585:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    1589:	7e 0d                	jle    1598 <isNameChar+0x45>
    158b:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    158f:	7f 07                	jg     1598 <isNameChar+0x45>
    return 1;
    1591:	b8 01 00 00 00       	mov    $0x1,%eax
    1596:	eb 12                	jmp    15aa <isNameChar+0x57>
  if(ch == '_')
    1598:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    159c:	75 07                	jne    15a5 <isNameChar+0x52>
    return 1;
    159e:	b8 01 00 00 00       	mov    $0x1,%eax
    15a3:	eb 05                	jmp    15aa <isNameChar+0x57>
  return 0;
    15a5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    15aa:	c9                   	leave  
    15ab:	c3                   	ret    

000015ac <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    15ac:	55                   	push   %ebp
    15ad:	89 e5                	mov    %esp,%ebp
    15af:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    15b2:	8b 45 08             	mov    0x8(%ebp),%eax
    15b5:	8b 40 04             	mov    0x4(%eax),%eax
    15b8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    15bb:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    15c2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    15c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    15d0:	eb 1d                	jmp    15ef <runCalcmd+0x43>
  {
    if(line[i] == '=')
    15d2:	8b 55 ec             	mov    -0x14(%ebp),%edx
    15d5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15d8:	01 d0                	add    %edx,%eax
    15da:	0f b6 00             	movzbl (%eax),%eax
    15dd:	3c 3d                	cmp    $0x3d,%al
    15df:	75 0a                	jne    15eb <runCalcmd+0x3f>
    {
      hasEqu++;
    15e1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    15e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    15eb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    15ef:	8b 55 ec             	mov    -0x14(%ebp),%edx
    15f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15f5:	01 d0                	add    %edx,%eax
    15f7:	0f b6 00             	movzbl (%eax),%eax
    15fa:	84 c0                	test   %al,%al
    15fc:	75 d4                	jne    15d2 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    15fe:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1602:	7e 1d                	jle    1621 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    1604:	83 ec 0c             	sub    $0xc,%esp
    1607:	68 ac 37 00 00       	push   $0x37ac
    160c:	6a 00                	push   $0x0
    160e:	6a 00                	push   $0x0
    1610:	6a 01                	push   $0x1
    1612:	6a 04                	push   $0x4
    1614:	e8 21 17 00 00       	call   2d3a <color_printf>
    1619:	83 c4 20             	add    $0x20,%esp
    161c:	e9 78 05 00 00       	jmp    1b99 <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    1621:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1625:	0f 85 26 05 00 00    	jne    1b51 <runCalcmd+0x5a5>
  {
    int i=0;
    162b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    1632:	eb 04                	jmp    1638 <runCalcmd+0x8c>
    {
      i++;
    1634:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    1638:	8b 55 e8             	mov    -0x18(%ebp),%edx
    163b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    163e:	01 d0                	add    %edx,%eax
    1640:	0f b6 00             	movzbl (%eax),%eax
    1643:	3c 20                	cmp    $0x20,%al
    1645:	74 ed                	je     1634 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    1647:	8b 45 e8             	mov    -0x18(%ebp),%eax
    164a:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    164d:	eb 23                	jmp    1672 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    164f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1652:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1655:	01 d0                	add    %edx,%eax
    1657:	0f b6 00             	movzbl (%eax),%eax
    165a:	0f be c0             	movsbl %al,%eax
    165d:	83 ec 0c             	sub    $0xc,%esp
    1660:	50                   	push   %eax
    1661:	e8 ed fe ff ff       	call   1553 <isNameChar>
    1666:	83 c4 10             	add    $0x10,%esp
    1669:	83 f8 01             	cmp    $0x1,%eax
    166c:	75 0e                	jne    167c <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    166e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1672:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1675:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1678:	7c d5                	jl     164f <runCalcmd+0xa3>
    167a:	eb 01                	jmp    167d <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    167c:	90                   	nop
    }
    int len = i-startIndex;
    167d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1680:	2b 45 d0             	sub    -0x30(%ebp),%eax
    1683:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    1686:	eb 04                	jmp    168c <runCalcmd+0xe0>
    {
      i++;
    1688:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    168c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    168f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1692:	01 d0                	add    %edx,%eax
    1694:	0f b6 00             	movzbl (%eax),%eax
    1697:	3c 20                	cmp    $0x20,%al
    1699:	74 ed                	je     1688 <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    169b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    169e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    16a1:	0f 85 90 04 00 00    	jne    1b37 <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    16a7:	8b 55 d0             	mov    -0x30(%ebp),%edx
    16aa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16ad:	01 d0                	add    %edx,%eax
    16af:	0f b6 00             	movzbl (%eax),%eax
    16b2:	3c 2f                	cmp    $0x2f,%al
    16b4:	7e 2c                	jle    16e2 <runCalcmd+0x136>
    16b6:	8b 55 d0             	mov    -0x30(%ebp),%edx
    16b9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16bc:	01 d0                	add    %edx,%eax
    16be:	0f b6 00             	movzbl (%eax),%eax
    16c1:	3c 39                	cmp    $0x39,%al
    16c3:	7f 1d                	jg     16e2 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    16c5:	83 ec 0c             	sub    $0xc,%esp
    16c8:	68 c8 37 00 00       	push   $0x37c8
    16cd:	6a 00                	push   $0x0
    16cf:	6a 00                	push   $0x0
    16d1:	6a 01                	push   $0x1
    16d3:	6a 04                	push   $0x4
    16d5:	e8 60 16 00 00       	call   2d3a <color_printf>
    16da:	83 c4 20             	add    $0x20,%esp
    16dd:	e9 b7 04 00 00       	jmp    1b99 <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    16e2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    16e9:	eb 20                	jmp    170b <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    16eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
    16ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16f1:	01 d0                	add    %edx,%eax
    16f3:	89 c2                	mov    %eax,%edx
    16f5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16f8:	01 d0                	add    %edx,%eax
    16fa:	0f b6 00             	movzbl (%eax),%eax
    16fd:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1700:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1703:	01 ca                	add    %ecx,%edx
    1705:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1707:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    170b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    170e:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1711:	7c d8                	jl     16eb <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1713:	8d 55 94             	lea    -0x6c(%ebp),%edx
    1716:	8b 45 cc             	mov    -0x34(%ebp),%eax
    1719:	01 d0                	add    %edx,%eax
    171b:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    171e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1721:	83 c0 01             	add    $0x1,%eax
    1724:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    1727:	eb 04                	jmp    172d <runCalcmd+0x181>
        {
          i++;
    1729:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    172d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1730:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1733:	01 d0                	add    %edx,%eax
    1735:	0f b6 00             	movzbl (%eax),%eax
    1738:	3c 20                	cmp    $0x20,%al
    173a:	74 ed                	je     1729 <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    173c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    173f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1742:	01 d0                	add    %edx,%eax
    1744:	0f b6 00             	movzbl (%eax),%eax
    1747:	3c 60                	cmp    $0x60,%al
    1749:	0f 85 e6 01 00 00    	jne    1935 <runCalcmd+0x389>
        {
          i++;
    174f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    1753:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1756:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    1759:	eb 04                	jmp    175f <runCalcmd+0x1b3>
          {
            i++;
    175b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    175f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1765:	01 d0                	add    %edx,%eax
    1767:	0f b6 00             	movzbl (%eax),%eax
    176a:	3c 60                	cmp    $0x60,%al
    176c:	74 0f                	je     177d <runCalcmd+0x1d1>
    176e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1771:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1774:	01 d0                	add    %edx,%eax
    1776:	0f b6 00             	movzbl (%eax),%eax
    1779:	84 c0                	test   %al,%al
    177b:	75 de                	jne    175b <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    177d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1780:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1783:	01 d0                	add    %edx,%eax
    1785:	0f b6 00             	movzbl (%eax),%eax
    1788:	3c 60                	cmp    $0x60,%al
    178a:	0f 85 5c 01 00 00    	jne    18ec <runCalcmd+0x340>
    1790:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1793:	8d 50 01             	lea    0x1(%eax),%edx
    1796:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1799:	01 d0                	add    %edx,%eax
    179b:	0f b6 00             	movzbl (%eax),%eax
    179e:	84 c0                	test   %al,%al
    17a0:	0f 85 46 01 00 00    	jne    18ec <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    17a6:	8b 55 e0             	mov    -0x20(%ebp),%edx
    17a9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17ac:	01 d0                	add    %edx,%eax
    17ae:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    17b1:	8b 55 c8             	mov    -0x38(%ebp),%edx
    17b4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17b7:	01 d0                	add    %edx,%eax
    17b9:	83 ec 0c             	sub    $0xc,%esp
    17bc:	50                   	push   %eax
    17bd:	e8 c5 04 00 00       	call   1c87 <Compute>
    17c2:	83 c4 10             	add    $0x10,%esp
    17c5:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    17c8:	dd 05 38 39 00 00    	fldl   0x3938
    17ce:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    17d2:	dd 1c 24             	fstpl  (%esp)
    17d5:	ff 75 c4             	pushl  -0x3c(%ebp)
    17d8:	ff 75 c0             	pushl  -0x40(%ebp)
    17db:	e8 30 f8 ff ff       	call   1010 <isEqual>
    17e0:	83 c4 10             	add    $0x10,%esp
    17e3:	85 c0                	test   %eax,%eax
    17e5:	0f 85 ad 03 00 00    	jne    1b98 <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    17eb:	a1 ac 44 00 00       	mov    0x44ac,%eax
    17f0:	85 c0                	test   %eax,%eax
    17f2:	75 15                	jne    1809 <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    17f4:	83 ec 08             	sub    $0x8,%esp
    17f7:	68 ac 44 00 00       	push   $0x44ac
    17fc:	68 e0 46 00 00       	push   $0x46e0
    1801:	e8 ba 19 00 00       	call   31c0 <readVariables>
    1806:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    1809:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1810:	eb 26                	jmp    1838 <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1812:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1815:	c1 e0 05             	shl    $0x5,%eax
    1818:	05 e0 46 00 00       	add    $0x46e0,%eax
    181d:	8d 50 04             	lea    0x4(%eax),%edx
    1820:	83 ec 08             	sub    $0x8,%esp
    1823:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1826:	50                   	push   %eax
    1827:	52                   	push   %edx
    1828:	e8 38 e9 ff ff       	call   165 <strcmp>
    182d:	83 c4 10             	add    $0x10,%esp
    1830:	85 c0                	test   %eax,%eax
    1832:	74 10                	je     1844 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1834:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    1838:	a1 ac 44 00 00       	mov    0x44ac,%eax
    183d:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1840:	7c d0                	jl     1812 <runCalcmd+0x266>
    1842:	eb 01                	jmp    1845 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1844:	90                   	nop
              }
              if(index == v_num) //new variable
    1845:	a1 ac 44 00 00       	mov    0x44ac,%eax
    184a:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    184d:	75 3c                	jne    188b <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    184f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1852:	c1 e0 05             	shl    $0x5,%eax
    1855:	05 e0 46 00 00       	add    $0x46e0,%eax
    185a:	8d 50 04             	lea    0x4(%eax),%edx
    185d:	83 ec 08             	sub    $0x8,%esp
    1860:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1863:	50                   	push   %eax
    1864:	52                   	push   %edx
    1865:	e8 cb e8 ff ff       	call   135 <strcpy>
    186a:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    186d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1870:	c1 e0 05             	shl    $0x5,%eax
    1873:	05 e0 46 00 00       	add    $0x46e0,%eax
    1878:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    187e:	a1 ac 44 00 00       	mov    0x44ac,%eax
    1883:	83 c0 01             	add    $0x1,%eax
    1886:	a3 ac 44 00 00       	mov    %eax,0x44ac
              }
              variables[index].value.dvalue = result;
    188b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    188e:	c1 e0 05             	shl    $0x5,%eax
    1891:	05 f0 46 00 00       	add    $0x46f0,%eax
    1896:	dd 45 c0             	fldl   -0x40(%ebp)
    1899:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    189c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    189f:	c1 e0 05             	shl    $0x5,%eax
    18a2:	05 f0 46 00 00       	add    $0x46f0,%eax
    18a7:	dd 40 08             	fldl   0x8(%eax)
    18aa:	8b 45 dc             	mov    -0x24(%ebp),%eax
    18ad:	c1 e0 05             	shl    $0x5,%eax
    18b0:	05 e0 46 00 00       	add    $0x46e0,%eax
    18b5:	83 c0 04             	add    $0x4,%eax
    18b8:	83 ec 0c             	sub    $0xc,%esp
    18bb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    18bf:	dd 1c 24             	fstpl  (%esp)
    18c2:	50                   	push   %eax
    18c3:	68 f2 37 00 00       	push   $0x37f2
    18c8:	6a 01                	push   $0x1
    18ca:	e8 43 ed ff ff       	call   612 <printf>
    18cf:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    18d2:	83 ec 08             	sub    $0x8,%esp
    18d5:	68 ac 44 00 00       	push   $0x44ac
    18da:	68 e0 46 00 00       	push   $0x46e0
    18df:	e8 90 1b 00 00       	call   3474 <writeVariables>
    18e4:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    18e7:	e9 ac 02 00 00       	jmp    1b98 <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    18ec:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18ef:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18f2:	01 d0                	add    %edx,%eax
    18f4:	0f b6 00             	movzbl (%eax),%eax
    18f7:	84 c0                	test   %al,%al
    18f9:	75 1d                	jne    1918 <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    18fb:	83 ec 0c             	sub    $0xc,%esp
    18fe:	68 f9 37 00 00       	push   $0x37f9
    1903:	6a 00                	push   $0x0
    1905:	6a 00                	push   $0x0
    1907:	6a 01                	push   $0x1
    1909:	6a 04                	push   $0x4
    190b:	e8 2a 14 00 00       	call   2d3a <color_printf>
    1910:	83 c4 20             	add    $0x20,%esp
    1913:	e9 81 02 00 00       	jmp    1b99 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    1918:	83 ec 0c             	sub    $0xc,%esp
    191b:	68 10 38 00 00       	push   $0x3810
    1920:	6a 00                	push   $0x0
    1922:	6a 00                	push   $0x0
    1924:	6a 01                	push   $0x1
    1926:	6a 04                	push   $0x4
    1928:	e8 0d 14 00 00       	call   2d3a <color_printf>
    192d:	83 c4 20             	add    $0x20,%esp
    1930:	e9 64 02 00 00       	jmp    1b99 <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1935:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1938:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    193b:	01 d0                	add    %edx,%eax
    193d:	0f b6 00             	movzbl (%eax),%eax
    1940:	3c 22                	cmp    $0x22,%al
    1942:	0f 85 d5 01 00 00    	jne    1b1d <runCalcmd+0x571>
        {
          i++;
    1948:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    194c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    194f:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1952:	eb 04                	jmp    1958 <runCalcmd+0x3ac>
          {
            i++;
    1954:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1958:	8b 55 e0             	mov    -0x20(%ebp),%edx
    195b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    195e:	01 d0                	add    %edx,%eax
    1960:	0f b6 00             	movzbl (%eax),%eax
    1963:	3c 22                	cmp    $0x22,%al
    1965:	74 0f                	je     1976 <runCalcmd+0x3ca>
    1967:	8b 55 e0             	mov    -0x20(%ebp),%edx
    196a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    196d:	01 d0                	add    %edx,%eax
    196f:	0f b6 00             	movzbl (%eax),%eax
    1972:	84 c0                	test   %al,%al
    1974:	75 de                	jne    1954 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1976:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1979:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    197c:	01 d0                	add    %edx,%eax
    197e:	0f b6 00             	movzbl (%eax),%eax
    1981:	3c 22                	cmp    $0x22,%al
    1983:	0f 85 4e 01 00 00    	jne    1ad7 <runCalcmd+0x52b>
    1989:	8b 45 e0             	mov    -0x20(%ebp),%eax
    198c:	8d 50 01             	lea    0x1(%eax),%edx
    198f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1992:	01 d0                	add    %edx,%eax
    1994:	0f b6 00             	movzbl (%eax),%eax
    1997:	84 c0                	test   %al,%al
    1999:	0f 85 38 01 00 00    	jne    1ad7 <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    199f:	a1 ac 44 00 00       	mov    0x44ac,%eax
    19a4:	85 c0                	test   %eax,%eax
    19a6:	75 15                	jne    19bd <runCalcmd+0x411>
              readVariables(variables,&v_num);
    19a8:	83 ec 08             	sub    $0x8,%esp
    19ab:	68 ac 44 00 00       	push   $0x44ac
    19b0:	68 e0 46 00 00       	push   $0x46e0
    19b5:	e8 06 18 00 00       	call   31c0 <readVariables>
    19ba:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    19bd:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    19c4:	eb 26                	jmp    19ec <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    19c6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19c9:	c1 e0 05             	shl    $0x5,%eax
    19cc:	05 e0 46 00 00       	add    $0x46e0,%eax
    19d1:	8d 50 04             	lea    0x4(%eax),%edx
    19d4:	83 ec 08             	sub    $0x8,%esp
    19d7:	8d 45 94             	lea    -0x6c(%ebp),%eax
    19da:	50                   	push   %eax
    19db:	52                   	push   %edx
    19dc:	e8 84 e7 ff ff       	call   165 <strcmp>
    19e1:	83 c4 10             	add    $0x10,%esp
    19e4:	85 c0                	test   %eax,%eax
    19e6:	74 10                	je     19f8 <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    19e8:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    19ec:	a1 ac 44 00 00       	mov    0x44ac,%eax
    19f1:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    19f4:	7c d0                	jl     19c6 <runCalcmd+0x41a>
    19f6:	eb 01                	jmp    19f9 <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    19f8:	90                   	nop
            }
            if(index == v_num) //new variable
    19f9:	a1 ac 44 00 00       	mov    0x44ac,%eax
    19fe:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1a01:	75 2b                	jne    1a2e <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1a03:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a06:	c1 e0 05             	shl    $0x5,%eax
    1a09:	05 e0 46 00 00       	add    $0x46e0,%eax
    1a0e:	8d 50 04             	lea    0x4(%eax),%edx
    1a11:	83 ec 08             	sub    $0x8,%esp
    1a14:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1a17:	50                   	push   %eax
    1a18:	52                   	push   %edx
    1a19:	e8 17 e7 ff ff       	call   135 <strcpy>
    1a1e:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1a21:	a1 ac 44 00 00       	mov    0x44ac,%eax
    1a26:	83 c0 01             	add    $0x1,%eax
    1a29:	a3 ac 44 00 00       	mov    %eax,0x44ac
            }
            variables[index].type = V_STRING;
    1a2e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a31:	c1 e0 05             	shl    $0x5,%eax
    1a34:	05 e0 46 00 00       	add    $0x46e0,%eax
    1a39:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1a3f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1a42:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1a45:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1a48:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1a4b:	83 c0 01             	add    $0x1,%eax
    1a4e:	83 ec 0c             	sub    $0xc,%esp
    1a51:	50                   	push   %eax
    1a52:	e8 bd ee ff ff       	call   914 <malloc>
    1a57:	83 c4 10             	add    $0x10,%esp
    1a5a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1a5d:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1a60:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a63:	01 d0                	add    %edx,%eax
    1a65:	83 ec 08             	sub    $0x8,%esp
    1a68:	50                   	push   %eax
    1a69:	ff 75 b4             	pushl  -0x4c(%ebp)
    1a6c:	e8 c4 e6 ff ff       	call   135 <strcpy>
    1a71:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1a74:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1a77:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1a7a:	01 d0                	add    %edx,%eax
    1a7c:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1a7f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a82:	c1 e0 05             	shl    $0x5,%eax
    1a85:	8d 90 f8 46 00 00    	lea    0x46f8(%eax),%edx
    1a8b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1a8e:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1a90:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a93:	c1 e0 05             	shl    $0x5,%eax
    1a96:	05 f8 46 00 00       	add    $0x46f8,%eax
    1a9b:	8b 00                	mov    (%eax),%eax
    1a9d:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1aa0:	c1 e2 05             	shl    $0x5,%edx
    1aa3:	81 c2 e0 46 00 00    	add    $0x46e0,%edx
    1aa9:	83 c2 04             	add    $0x4,%edx
    1aac:	50                   	push   %eax
    1aad:	52                   	push   %edx
    1aae:	68 31 38 00 00       	push   $0x3831
    1ab3:	6a 01                	push   $0x1
    1ab5:	e8 58 eb ff ff       	call   612 <printf>
    1aba:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1abd:	83 ec 08             	sub    $0x8,%esp
    1ac0:	68 ac 44 00 00       	push   $0x44ac
    1ac5:	68 e0 46 00 00       	push   $0x46e0
    1aca:	e8 a5 19 00 00       	call   3474 <writeVariables>
    1acf:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1ad2:	e9 c2 00 00 00       	jmp    1b99 <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1ad7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1ada:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1add:	01 d0                	add    %edx,%eax
    1adf:	0f b6 00             	movzbl (%eax),%eax
    1ae2:	84 c0                	test   %al,%al
    1ae4:	75 1d                	jne    1b03 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1ae6:	83 ec 0c             	sub    $0xc,%esp
    1ae9:	68 3a 38 00 00       	push   $0x383a
    1aee:	6a 00                	push   $0x0
    1af0:	6a 00                	push   $0x0
    1af2:	6a 01                	push   $0x1
    1af4:	6a 04                	push   $0x4
    1af6:	e8 3f 12 00 00       	call   2d3a <color_printf>
    1afb:	83 c4 20             	add    $0x20,%esp
    1afe:	e9 96 00 00 00       	jmp    1b99 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1b03:	83 ec 0c             	sub    $0xc,%esp
    1b06:	68 50 38 00 00       	push   $0x3850
    1b0b:	6a 00                	push   $0x0
    1b0d:	6a 00                	push   $0x0
    1b0f:	6a 01                	push   $0x1
    1b11:	6a 04                	push   $0x4
    1b13:	e8 22 12 00 00       	call   2d3a <color_printf>
    1b18:	83 c4 20             	add    $0x20,%esp
    1b1b:	eb 7c                	jmp    1b99 <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1b1d:	83 ec 0c             	sub    $0xc,%esp
    1b20:	68 71 38 00 00       	push   $0x3871
    1b25:	6a 00                	push   $0x0
    1b27:	6a 00                	push   $0x0
    1b29:	6a 01                	push   $0x1
    1b2b:	6a 04                	push   $0x4
    1b2d:	e8 08 12 00 00       	call   2d3a <color_printf>
    1b32:	83 c4 20             	add    $0x20,%esp
    1b35:	eb 62                	jmp    1b99 <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1b37:	83 ec 0c             	sub    $0xc,%esp
    1b3a:	68 71 38 00 00       	push   $0x3871
    1b3f:	6a 00                	push   $0x0
    1b41:	6a 00                	push   $0x0
    1b43:	6a 01                	push   $0x1
    1b45:	6a 04                	push   $0x4
    1b47:	e8 ee 11 00 00       	call   2d3a <color_printf>
    1b4c:	83 c4 20             	add    $0x20,%esp
    1b4f:	eb 48                	jmp    1b99 <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1b51:	83 ec 0c             	sub    $0xc,%esp
    1b54:	ff 75 d4             	pushl  -0x2c(%ebp)
    1b57:	e8 2b 01 00 00       	call   1c87 <Compute>
    1b5c:	83 c4 10             	add    $0x10,%esp
    1b5f:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1b62:	dd 05 38 39 00 00    	fldl   0x3938
    1b68:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1b6c:	dd 1c 24             	fstpl  (%esp)
    1b6f:	ff 75 ac             	pushl  -0x54(%ebp)
    1b72:	ff 75 a8             	pushl  -0x58(%ebp)
    1b75:	e8 96 f4 ff ff       	call   1010 <isEqual>
    1b7a:	83 c4 10             	add    $0x10,%esp
    1b7d:	85 c0                	test   %eax,%eax
    1b7f:	75 18                	jne    1b99 <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1b81:	ff 75 ac             	pushl  -0x54(%ebp)
    1b84:	ff 75 a8             	pushl  -0x58(%ebp)
    1b87:	68 89 38 00 00       	push   $0x3889
    1b8c:	6a 01                	push   $0x1
    1b8e:	e8 7f ea ff ff       	call   612 <printf>
    1b93:	83 c4 10             	add    $0x10,%esp
    1b96:	eb 01                	jmp    1b99 <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1b98:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1b99:	e8 c8 e7 ff ff       	call   366 <exit>

00001b9e <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1b9e:	55                   	push   %ebp
    1b9f:	89 e5                	mov    %esp,%ebp
    1ba1:	83 ec 04             	sub    $0x4,%esp
    1ba4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba7:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1baa:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1bae:	83 e8 23             	sub    $0x23,%eax
    1bb1:	83 f8 0c             	cmp    $0xc,%eax
    1bb4:	77 25                	ja     1bdb <GetLevel+0x3d>
    1bb6:	8b 04 85 90 38 00 00 	mov    0x3890(,%eax,4),%eax
    1bbd:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1bbf:	b8 01 00 00 00       	mov    $0x1,%eax
    1bc4:	eb 1a                	jmp    1be0 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1bc6:	b8 02 00 00 00       	mov    $0x2,%eax
    1bcb:	eb 13                	jmp    1be0 <GetLevel+0x42>
    case '(':
        return 0;
    1bcd:	b8 00 00 00 00       	mov    $0x0,%eax
    1bd2:	eb 0c                	jmp    1be0 <GetLevel+0x42>
    case '#':
        return -2;
    1bd4:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1bd9:	eb 05                	jmp    1be0 <GetLevel+0x42>
    };
    return -1;
    1bdb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1be0:	c9                   	leave  
    1be1:	c3                   	ret    

00001be2 <Operate>:

double Operate(double a1, char op, double a2)
{
    1be2:	55                   	push   %ebp
    1be3:	89 e5                	mov    %esp,%ebp
    1be5:	83 ec 28             	sub    $0x28,%esp
    1be8:	8b 45 10             	mov    0x10(%ebp),%eax
    1beb:	8b 55 08             	mov    0x8(%ebp),%edx
    1bee:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1bf1:	8b 55 0c             	mov    0xc(%ebp),%edx
    1bf4:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1bf7:	88 45 ec             	mov    %al,-0x14(%ebp)
    1bfa:	8b 45 14             	mov    0x14(%ebp),%eax
    1bfd:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1c00:	8b 45 18             	mov    0x18(%ebp),%eax
    1c03:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1c06:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1c0a:	83 f8 2b             	cmp    $0x2b,%eax
    1c0d:	74 18                	je     1c27 <Operate+0x45>
    1c0f:	83 f8 2b             	cmp    $0x2b,%eax
    1c12:	7f 07                	jg     1c1b <Operate+0x39>
    1c14:	83 f8 2a             	cmp    $0x2a,%eax
    1c17:	74 1e                	je     1c37 <Operate+0x55>
    1c19:	eb 68                	jmp    1c83 <Operate+0xa1>
    1c1b:	83 f8 2d             	cmp    $0x2d,%eax
    1c1e:	74 0f                	je     1c2f <Operate+0x4d>
    1c20:	83 f8 2f             	cmp    $0x2f,%eax
    1c23:	74 1a                	je     1c3f <Operate+0x5d>
    1c25:	eb 5c                	jmp    1c83 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1c27:	dd 45 f0             	fldl   -0x10(%ebp)
    1c2a:	dc 45 e0             	faddl  -0x20(%ebp)
    1c2d:	eb 56                	jmp    1c85 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1c2f:	dd 45 f0             	fldl   -0x10(%ebp)
    1c32:	dc 65 e0             	fsubl  -0x20(%ebp)
    1c35:	eb 4e                	jmp    1c85 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1c37:	dd 45 f0             	fldl   -0x10(%ebp)
    1c3a:	dc 4d e0             	fmull  -0x20(%ebp)
    1c3d:	eb 46                	jmp    1c85 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1c3f:	d9 ee                	fldz   
    1c41:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1c45:	dd 1c 24             	fstpl  (%esp)
    1c48:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c4b:	ff 75 e0             	pushl  -0x20(%ebp)
    1c4e:	e8 bd f3 ff ff       	call   1010 <isEqual>
    1c53:	83 c4 10             	add    $0x10,%esp
    1c56:	83 f8 01             	cmp    $0x1,%eax
    1c59:	75 20                	jne    1c7b <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1c5b:	83 ec 0c             	sub    $0xc,%esp
    1c5e:	68 c4 38 00 00       	push   $0x38c4
    1c63:	6a 00                	push   $0x0
    1c65:	6a 00                	push   $0x0
    1c67:	6a 01                	push   $0x1
    1c69:	6a 04                	push   $0x4
    1c6b:	e8 ca 10 00 00       	call   2d3a <color_printf>
    1c70:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1c73:	dd 05 38 39 00 00    	fldl   0x3938
    1c79:	eb 0a                	jmp    1c85 <Operate+0xa3>
        }
        else
          return a1 / a2;
    1c7b:	dd 45 f0             	fldl   -0x10(%ebp)
    1c7e:	dc 75 e0             	fdivl  -0x20(%ebp)
    1c81:	eb 02                	jmp    1c85 <Operate+0xa3>
    };
    return 1;
    1c83:	d9 e8                	fld1   
}
    1c85:	c9                   	leave  
    1c86:	c3                   	ret    

00001c87 <Compute>:

double Compute(char *s)
{
    1c87:	55                   	push   %ebp
    1c88:	89 e5                	mov    %esp,%ebp
    1c8a:	53                   	push   %ebx
    1c8b:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1c91:	e8 44 14 00 00       	call   30da <dstack>
    1c96:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1c99:	e8 73 13 00 00       	call   3011 <cstack>
    1c9e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1ca1:	83 ec 08             	sub    $0x8,%esp
    1ca4:	6a 23                	push   $0x23
    1ca6:	ff 75 e0             	pushl  -0x20(%ebp)
    1ca9:	e8 91 13 00 00       	call   303f <pushc>
    1cae:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1cb1:	83 ec 0c             	sub    $0xc,%esp
    1cb4:	ff 75 08             	pushl  0x8(%ebp)
    1cb7:	e8 e8 e4 ff ff       	call   1a4 <strlen>
    1cbc:	83 c4 10             	add    $0x10,%esp
    1cbf:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1cc2:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1cc9:	c7 05 c0 46 00 00 00 	movl   $0x0,0x46c0
    1cd0:	00 00 00 
    1cd3:	e9 58 05 00 00       	jmp    2230 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1cd8:	a1 c0 46 00 00       	mov    0x46c0,%eax
    1cdd:	89 c2                	mov    %eax,%edx
    1cdf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce2:	01 d0                	add    %edx,%eax
    1ce4:	0f b6 00             	movzbl (%eax),%eax
    1ce7:	3c 24                	cmp    $0x24,%al
    1ce9:	0f 85 f8 01 00 00    	jne    1ee7 <Compute+0x260>
        {
          is_minus = 0;
    1cef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1cf6:	a1 c0 46 00 00       	mov    0x46c0,%eax
    1cfb:	83 c0 01             	add    $0x1,%eax
    1cfe:	a3 c0 46 00 00       	mov    %eax,0x46c0
          if(s[g_pos] != '{')
    1d03:	a1 c0 46 00 00       	mov    0x46c0,%eax
    1d08:	89 c2                	mov    %eax,%edx
    1d0a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0d:	01 d0                	add    %edx,%eax
    1d0f:	0f b6 00             	movzbl (%eax),%eax
    1d12:	3c 7b                	cmp    $0x7b,%al
    1d14:	74 23                	je     1d39 <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1d16:	83 ec 0c             	sub    $0xc,%esp
    1d19:	68 dc 38 00 00       	push   $0x38dc
    1d1e:	6a 00                	push   $0x0
    1d20:	6a 00                	push   $0x0
    1d22:	6a 01                	push   $0x1
    1d24:	6a 04                	push   $0x4
    1d26:	e8 0f 10 00 00       	call   2d3a <color_printf>
    1d2b:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1d2e:	dd 05 38 39 00 00    	fldl   0x3938
    1d34:	e9 24 06 00 00       	jmp    235d <Compute+0x6d6>
          }
          int i=g_pos+1;
    1d39:	a1 c0 46 00 00       	mov    0x46c0,%eax
    1d3e:	83 c0 01             	add    $0x1,%eax
    1d41:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1d44:	eb 13                	jmp    1d59 <Compute+0xd2>
          {
            if(s[i] == '}')
    1d46:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d49:	8b 45 08             	mov    0x8(%ebp),%eax
    1d4c:	01 d0                	add    %edx,%eax
    1d4e:	0f b6 00             	movzbl (%eax),%eax
    1d51:	3c 7d                	cmp    $0x7d,%al
    1d53:	74 0e                	je     1d63 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1d55:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d5c:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1d5f:	7c e5                	jl     1d46 <Compute+0xbf>
    1d61:	eb 01                	jmp    1d64 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1d63:	90                   	nop
          }
          if(s[i] != '}')
    1d64:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d67:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6a:	01 d0                	add    %edx,%eax
    1d6c:	0f b6 00             	movzbl (%eax),%eax
    1d6f:	3c 7d                	cmp    $0x7d,%al
    1d71:	74 23                	je     1d96 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1d73:	83 ec 0c             	sub    $0xc,%esp
    1d76:	68 ea 38 00 00       	push   $0x38ea
    1d7b:	6a 00                	push   $0x0
    1d7d:	6a 00                	push   $0x0
    1d7f:	6a 01                	push   $0x1
    1d81:	6a 04                	push   $0x4
    1d83:	e8 b2 0f 00 00       	call   2d3a <color_printf>
    1d88:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1d8b:	dd 05 38 39 00 00    	fldl   0x3938
    1d91:	e9 c7 05 00 00       	jmp    235d <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1d96:	a1 c0 46 00 00       	mov    0x46c0,%eax
    1d9b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d9e:	29 c2                	sub    %eax,%edx
    1da0:	89 d0                	mov    %edx,%eax
    1da2:	83 e8 01             	sub    $0x1,%eax
    1da5:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1da8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1daf:	eb 27                	jmp    1dd8 <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1db1:	8b 15 c0 46 00 00    	mov    0x46c0,%edx
    1db7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1dba:	01 d0                	add    %edx,%eax
    1dbc:	8d 50 01             	lea    0x1(%eax),%edx
    1dbf:	8b 45 08             	mov    0x8(%ebp),%eax
    1dc2:	01 d0                	add    %edx,%eax
    1dc4:	0f b6 00             	movzbl (%eax),%eax
    1dc7:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1dcd:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1dd0:	01 ca                	add    %ecx,%edx
    1dd2:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1dd4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1dd8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ddb:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1dde:	7c d1                	jl     1db1 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1de0:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1de6:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1de9:	01 d0                	add    %edx,%eax
    1deb:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1dee:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1df5:	a1 ac 44 00 00       	mov    0x44ac,%eax
    1dfa:	85 c0                	test   %eax,%eax
    1dfc:	75 40                	jne    1e3e <Compute+0x1b7>
            readVariables(variables,&v_num);
    1dfe:	83 ec 08             	sub    $0x8,%esp
    1e01:	68 ac 44 00 00       	push   $0x44ac
    1e06:	68 e0 46 00 00       	push   $0x46e0
    1e0b:	e8 b0 13 00 00       	call   31c0 <readVariables>
    1e10:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1e13:	eb 29                	jmp    1e3e <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1e15:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e18:	c1 e0 05             	shl    $0x5,%eax
    1e1b:	05 e0 46 00 00       	add    $0x46e0,%eax
    1e20:	8d 50 04             	lea    0x4(%eax),%edx
    1e23:	83 ec 08             	sub    $0x8,%esp
    1e26:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1e2c:	50                   	push   %eax
    1e2d:	52                   	push   %edx
    1e2e:	e8 32 e3 ff ff       	call   165 <strcmp>
    1e33:	83 c4 10             	add    $0x10,%esp
    1e36:	85 c0                	test   %eax,%eax
    1e38:	74 10                	je     1e4a <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1e3a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1e3e:	a1 ac 44 00 00       	mov    0x44ac,%eax
    1e43:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1e46:	7c cd                	jl     1e15 <Compute+0x18e>
    1e48:	eb 01                	jmp    1e4b <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1e4a:	90                   	nop
          }
          if(index == v_num) //no such variable
    1e4b:	a1 ac 44 00 00       	mov    0x44ac,%eax
    1e50:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1e53:	75 2a                	jne    1e7f <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1e55:	83 ec 08             	sub    $0x8,%esp
    1e58:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1e5e:	50                   	push   %eax
    1e5f:	68 f8 38 00 00       	push   $0x38f8
    1e64:	6a 00                	push   $0x0
    1e66:	6a 00                	push   $0x0
    1e68:	6a 01                	push   $0x1
    1e6a:	6a 04                	push   $0x4
    1e6c:	e8 c9 0e 00 00       	call   2d3a <color_printf>
    1e71:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1e74:	dd 05 38 39 00 00    	fldl   0x3938
    1e7a:	e9 de 04 00 00       	jmp    235d <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1e7f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e82:	c1 e0 05             	shl    $0x5,%eax
    1e85:	05 e0 46 00 00       	add    $0x46e0,%eax
    1e8a:	8b 00                	mov    (%eax),%eax
    1e8c:	83 f8 02             	cmp    $0x2,%eax
    1e8f:	75 23                	jne    1eb4 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1e91:	83 ec 0c             	sub    $0xc,%esp
    1e94:	68 12 39 00 00       	push   $0x3912
    1e99:	6a 00                	push   $0x0
    1e9b:	6a 00                	push   $0x0
    1e9d:	6a 01                	push   $0x1
    1e9f:	6a 04                	push   $0x4
    1ea1:	e8 94 0e 00 00       	call   2d3a <color_printf>
    1ea6:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1ea9:	dd 05 38 39 00 00    	fldl   0x3938
    1eaf:	e9 a9 04 00 00       	jmp    235d <Compute+0x6d6>
          }
          g_pos = i+1;
    1eb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1eb7:	83 c0 01             	add    $0x1,%eax
    1eba:	a3 c0 46 00 00       	mov    %eax,0x46c0
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    1ebf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ec2:	c1 e0 05             	shl    $0x5,%eax
    1ec5:	05 f0 46 00 00       	add    $0x46f0,%eax
    1eca:	dd 40 08             	fldl   0x8(%eax)
    1ecd:	83 ec 04             	sub    $0x4,%esp
    1ed0:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1ed4:	dd 1c 24             	fstpl  (%esp)
    1ed7:	ff 75 e4             	pushl  -0x1c(%ebp)
    1eda:	e8 2f 12 00 00       	call   310e <pushd>
    1edf:	83 c4 10             	add    $0x10,%esp
    1ee2:	e9 49 03 00 00       	jmp    2230 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    1ee7:	a1 c0 46 00 00       	mov    0x46c0,%eax
    1eec:	89 c2                	mov    %eax,%edx
    1eee:	8b 45 08             	mov    0x8(%ebp),%eax
    1ef1:	01 d0                	add    %edx,%eax
    1ef3:	0f b6 00             	movzbl (%eax),%eax
    1ef6:	3c 2d                	cmp    $0x2d,%al
    1ef8:	75 3f                	jne    1f39 <Compute+0x2b2>
    1efa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1efe:	74 39                	je     1f39 <Compute+0x2b2>
        {
            pushd(opnd,0);
    1f00:	83 ec 04             	sub    $0x4,%esp
    1f03:	d9 ee                	fldz   
    1f05:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1f09:	dd 1c 24             	fstpl  (%esp)
    1f0c:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f0f:	e8 fa 11 00 00       	call   310e <pushd>
    1f14:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    1f17:	83 ec 08             	sub    $0x8,%esp
    1f1a:	6a 2d                	push   $0x2d
    1f1c:	ff 75 e0             	pushl  -0x20(%ebp)
    1f1f:	e8 1b 11 00 00       	call   303f <pushc>
    1f24:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    1f27:	a1 c0 46 00 00       	mov    0x46c0,%eax
    1f2c:	83 c0 01             	add    $0x1,%eax
    1f2f:	a3 c0 46 00 00       	mov    %eax,0x46c0
    1f34:	e9 f7 02 00 00       	jmp    2230 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    1f39:	a1 c0 46 00 00       	mov    0x46c0,%eax
    1f3e:	89 c2                	mov    %eax,%edx
    1f40:	8b 45 08             	mov    0x8(%ebp),%eax
    1f43:	01 d0                	add    %edx,%eax
    1f45:	0f b6 00             	movzbl (%eax),%eax
    1f48:	3c 29                	cmp    $0x29,%al
    1f4a:	0f 85 01 01 00 00    	jne    2051 <Compute+0x3ca>
        {
            is_minus = 0;
    1f50:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    1f57:	a1 c0 46 00 00       	mov    0x46c0,%eax
    1f5c:	83 c0 01             	add    $0x1,%eax
    1f5f:	a3 c0 46 00 00       	mov    %eax,0x46c0
            while (topc(optr) != '(')
    1f64:	e9 bf 00 00 00       	jmp    2028 <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    1f69:	83 ec 0c             	sub    $0xc,%esp
    1f6c:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f6f:	e8 37 12 00 00       	call   31ab <topd>
    1f74:	83 c4 10             	add    $0x10,%esp
    1f77:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    1f7a:	83 ec 0c             	sub    $0xc,%esp
    1f7d:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f80:	e8 dd 11 00 00       	call   3162 <popd>
    1f85:	dd d8                	fstp   %st(0)
    1f87:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    1f8a:	83 ec 0c             	sub    $0xc,%esp
    1f8d:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f90:	e8 16 12 00 00       	call   31ab <topd>
    1f95:	83 c4 10             	add    $0x10,%esp
    1f98:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    1f9b:	83 ec 0c             	sub    $0xc,%esp
    1f9e:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fa1:	e8 bc 11 00 00       	call   3162 <popd>
    1fa6:	dd d8                	fstp   %st(0)
    1fa8:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    1fab:	83 ec 0c             	sub    $0xc,%esp
    1fae:	ff 75 e0             	pushl  -0x20(%ebp)
    1fb1:	e8 11 11 00 00       	call   30c7 <topc>
    1fb6:	83 c4 10             	add    $0x10,%esp
    1fb9:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    1fbc:	83 ec 0c             	sub    $0xc,%esp
    1fbf:	ff 75 e0             	pushl  -0x20(%ebp)
    1fc2:	e8 be 10 00 00       	call   3085 <popc>
    1fc7:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    1fca:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    1fce:	83 ec 0c             	sub    $0xc,%esp
    1fd1:	ff 75 d4             	pushl  -0x2c(%ebp)
    1fd4:	ff 75 d0             	pushl  -0x30(%ebp)
    1fd7:	50                   	push   %eax
    1fd8:	ff 75 cc             	pushl  -0x34(%ebp)
    1fdb:	ff 75 c8             	pushl  -0x38(%ebp)
    1fde:	e8 ff fb ff ff       	call   1be2 <Operate>
    1fe3:	83 c4 20             	add    $0x20,%esp
    1fe6:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    1fe9:	dd 05 38 39 00 00    	fldl   0x3938
    1fef:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1ff3:	dd 1c 24             	fstpl  (%esp)
    1ff6:	ff 75 bc             	pushl  -0x44(%ebp)
    1ff9:	ff 75 b8             	pushl  -0x48(%ebp)
    1ffc:	e8 0f f0 ff ff       	call   1010 <isEqual>
    2001:	83 c4 10             	add    $0x10,%esp
    2004:	83 f8 01             	cmp    $0x1,%eax
    2007:	75 0b                	jne    2014 <Compute+0x38d>
                  return WRONG_ANS;
    2009:	dd 05 38 39 00 00    	fldl   0x3938
    200f:	e9 49 03 00 00       	jmp    235d <Compute+0x6d6>
                pushd(opnd,result);
    2014:	83 ec 04             	sub    $0x4,%esp
    2017:	ff 75 bc             	pushl  -0x44(%ebp)
    201a:	ff 75 b8             	pushl  -0x48(%ebp)
    201d:	ff 75 e4             	pushl  -0x1c(%ebp)
    2020:	e8 e9 10 00 00       	call   310e <pushd>
    2025:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    2028:	83 ec 0c             	sub    $0xc,%esp
    202b:	ff 75 e0             	pushl  -0x20(%ebp)
    202e:	e8 94 10 00 00       	call   30c7 <topc>
    2033:	83 c4 10             	add    $0x10,%esp
    2036:	3c 28                	cmp    $0x28,%al
    2038:	0f 85 2b ff ff ff    	jne    1f69 <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    203e:	83 ec 0c             	sub    $0xc,%esp
    2041:	ff 75 e0             	pushl  -0x20(%ebp)
    2044:	e8 3c 10 00 00       	call   3085 <popc>
    2049:	83 c4 10             	add    $0x10,%esp
    204c:	e9 df 01 00 00       	jmp    2230 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    2051:	a1 c0 46 00 00       	mov    0x46c0,%eax
    2056:	89 c2                	mov    %eax,%edx
    2058:	8b 45 08             	mov    0x8(%ebp),%eax
    205b:	01 d0                	add    %edx,%eax
    205d:	0f b6 00             	movzbl (%eax),%eax
    2060:	3c 2f                	cmp    $0x2f,%al
    2062:	7e 49                	jle    20ad <Compute+0x426>
    2064:	a1 c0 46 00 00       	mov    0x46c0,%eax
    2069:	89 c2                	mov    %eax,%edx
    206b:	8b 45 08             	mov    0x8(%ebp),%eax
    206e:	01 d0                	add    %edx,%eax
    2070:	0f b6 00             	movzbl (%eax),%eax
    2073:	3c 39                	cmp    $0x39,%al
    2075:	7f 36                	jg     20ad <Compute+0x426>
        {
            is_minus = 0;
    2077:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    207e:	83 ec 08             	sub    $0x8,%esp
    2081:	68 c0 46 00 00       	push   $0x46c0
    2086:	ff 75 08             	pushl  0x8(%ebp)
    2089:	e8 c3 eb ff ff       	call   c51 <Translation>
    208e:	83 c4 10             	add    $0x10,%esp
    2091:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    2094:	83 ec 04             	sub    $0x4,%esp
    2097:	ff 75 b4             	pushl  -0x4c(%ebp)
    209a:	ff 75 b0             	pushl  -0x50(%ebp)
    209d:	ff 75 e4             	pushl  -0x1c(%ebp)
    20a0:	e8 69 10 00 00       	call   310e <pushd>
    20a5:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    20a8:	e9 83 01 00 00       	jmp    2230 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    20ad:	a1 c0 46 00 00       	mov    0x46c0,%eax
    20b2:	89 c2                	mov    %eax,%edx
    20b4:	8b 45 08             	mov    0x8(%ebp),%eax
    20b7:	01 d0                	add    %edx,%eax
    20b9:	0f b6 00             	movzbl (%eax),%eax
    20bc:	3c 28                	cmp    $0x28,%al
    20be:	0f 85 f9 00 00 00    	jne    21bd <Compute+0x536>
        {
            is_minus = 1;
    20c4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    20cb:	a1 c0 46 00 00       	mov    0x46c0,%eax
    20d0:	89 c2                	mov    %eax,%edx
    20d2:	8b 45 08             	mov    0x8(%ebp),%eax
    20d5:	01 d0                	add    %edx,%eax
    20d7:	0f b6 00             	movzbl (%eax),%eax
    20da:	0f be c0             	movsbl %al,%eax
    20dd:	83 ec 08             	sub    $0x8,%esp
    20e0:	50                   	push   %eax
    20e1:	ff 75 e0             	pushl  -0x20(%ebp)
    20e4:	e8 56 0f 00 00       	call   303f <pushc>
    20e9:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    20ec:	a1 c0 46 00 00       	mov    0x46c0,%eax
    20f1:	83 c0 01             	add    $0x1,%eax
    20f4:	a3 c0 46 00 00       	mov    %eax,0x46c0
    20f9:	e9 32 01 00 00       	jmp    2230 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    20fe:	83 ec 0c             	sub    $0xc,%esp
    2101:	ff 75 e4             	pushl  -0x1c(%ebp)
    2104:	e8 a2 10 00 00       	call   31ab <topd>
    2109:	83 c4 10             	add    $0x10,%esp
    210c:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    210f:	83 ec 0c             	sub    $0xc,%esp
    2112:	ff 75 e4             	pushl  -0x1c(%ebp)
    2115:	e8 48 10 00 00       	call   3162 <popd>
    211a:	dd d8                	fstp   %st(0)
    211c:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    211f:	83 ec 0c             	sub    $0xc,%esp
    2122:	ff 75 e4             	pushl  -0x1c(%ebp)
    2125:	e8 81 10 00 00       	call   31ab <topd>
    212a:	83 c4 10             	add    $0x10,%esp
    212d:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    2130:	83 ec 0c             	sub    $0xc,%esp
    2133:	ff 75 e4             	pushl  -0x1c(%ebp)
    2136:	e8 27 10 00 00       	call   3162 <popd>
    213b:	dd d8                	fstp   %st(0)
    213d:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    2140:	83 ec 0c             	sub    $0xc,%esp
    2143:	ff 75 e0             	pushl  -0x20(%ebp)
    2146:	e8 7c 0f 00 00       	call   30c7 <topc>
    214b:	83 c4 10             	add    $0x10,%esp
    214e:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    2151:	83 ec 0c             	sub    $0xc,%esp
    2154:	ff 75 e0             	pushl  -0x20(%ebp)
    2157:	e8 29 0f 00 00       	call   3085 <popc>
    215c:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    215f:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    2163:	83 ec 0c             	sub    $0xc,%esp
    2166:	ff 75 ac             	pushl  -0x54(%ebp)
    2169:	ff 75 a8             	pushl  -0x58(%ebp)
    216c:	50                   	push   %eax
    216d:	ff 75 a4             	pushl  -0x5c(%ebp)
    2170:	ff 75 a0             	pushl  -0x60(%ebp)
    2173:	e8 6a fa ff ff       	call   1be2 <Operate>
    2178:	83 c4 20             	add    $0x20,%esp
    217b:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    217e:	dd 05 38 39 00 00    	fldl   0x3938
    2184:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2188:	dd 1c 24             	fstpl  (%esp)
    218b:	ff 75 94             	pushl  -0x6c(%ebp)
    218e:	ff 75 90             	pushl  -0x70(%ebp)
    2191:	e8 7a ee ff ff       	call   1010 <isEqual>
    2196:	83 c4 10             	add    $0x10,%esp
    2199:	83 f8 01             	cmp    $0x1,%eax
    219c:	75 0b                	jne    21a9 <Compute+0x522>
                  return WRONG_ANS;
    219e:	dd 05 38 39 00 00    	fldl   0x3938
    21a4:	e9 b4 01 00 00       	jmp    235d <Compute+0x6d6>
                pushd(opnd,result);
    21a9:	83 ec 04             	sub    $0x4,%esp
    21ac:	ff 75 94             	pushl  -0x6c(%ebp)
    21af:	ff 75 90             	pushl  -0x70(%ebp)
    21b2:	ff 75 e4             	pushl  -0x1c(%ebp)
    21b5:	e8 54 0f 00 00       	call   310e <pushd>
    21ba:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    21bd:	a1 c0 46 00 00       	mov    0x46c0,%eax
    21c2:	89 c2                	mov    %eax,%edx
    21c4:	8b 45 08             	mov    0x8(%ebp),%eax
    21c7:	01 d0                	add    %edx,%eax
    21c9:	0f b6 00             	movzbl (%eax),%eax
    21cc:	0f be c0             	movsbl %al,%eax
    21cf:	83 ec 0c             	sub    $0xc,%esp
    21d2:	50                   	push   %eax
    21d3:	e8 c6 f9 ff ff       	call   1b9e <GetLevel>
    21d8:	83 c4 10             	add    $0x10,%esp
    21db:	89 c3                	mov    %eax,%ebx
    21dd:	83 ec 0c             	sub    $0xc,%esp
    21e0:	ff 75 e0             	pushl  -0x20(%ebp)
    21e3:	e8 df 0e 00 00       	call   30c7 <topc>
    21e8:	83 c4 10             	add    $0x10,%esp
    21eb:	0f be c0             	movsbl %al,%eax
    21ee:	83 ec 0c             	sub    $0xc,%esp
    21f1:	50                   	push   %eax
    21f2:	e8 a7 f9 ff ff       	call   1b9e <GetLevel>
    21f7:	83 c4 10             	add    $0x10,%esp
    21fa:	39 c3                	cmp    %eax,%ebx
    21fc:	0f 8e fc fe ff ff    	jle    20fe <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    2202:	a1 c0 46 00 00       	mov    0x46c0,%eax
    2207:	89 c2                	mov    %eax,%edx
    2209:	8b 45 08             	mov    0x8(%ebp),%eax
    220c:	01 d0                	add    %edx,%eax
    220e:	0f b6 00             	movzbl (%eax),%eax
    2211:	0f be c0             	movsbl %al,%eax
    2214:	83 ec 08             	sub    $0x8,%esp
    2217:	50                   	push   %eax
    2218:	ff 75 e0             	pushl  -0x20(%ebp)
    221b:	e8 1f 0e 00 00       	call   303f <pushc>
    2220:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2223:	a1 c0 46 00 00       	mov    0x46c0,%eax
    2228:	83 c0 01             	add    $0x1,%eax
    222b:	a3 c0 46 00 00       	mov    %eax,0x46c0
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    2230:	a1 c0 46 00 00       	mov    0x46c0,%eax
    2235:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    2238:	0f 8c 9a fa ff ff    	jl     1cd8 <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    223e:	e9 da 00 00 00       	jmp    231d <Compute+0x696>
    {
        double a2 = topd(opnd);
    2243:	83 ec 0c             	sub    $0xc,%esp
    2246:	ff 75 e4             	pushl  -0x1c(%ebp)
    2249:	e8 5d 0f 00 00       	call   31ab <topd>
    224e:	83 c4 10             	add    $0x10,%esp
    2251:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    2254:	83 ec 0c             	sub    $0xc,%esp
    2257:	ff 75 e4             	pushl  -0x1c(%ebp)
    225a:	e8 03 0f 00 00       	call   3162 <popd>
    225f:	dd d8                	fstp   %st(0)
    2261:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    2264:	83 ec 0c             	sub    $0xc,%esp
    2267:	ff 75 e4             	pushl  -0x1c(%ebp)
    226a:	e8 3c 0f 00 00       	call   31ab <topd>
    226f:	83 c4 10             	add    $0x10,%esp
    2272:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    2278:	83 ec 0c             	sub    $0xc,%esp
    227b:	ff 75 e4             	pushl  -0x1c(%ebp)
    227e:	e8 df 0e 00 00       	call   3162 <popd>
    2283:	dd d8                	fstp   %st(0)
    2285:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    2288:	83 ec 0c             	sub    $0xc,%esp
    228b:	ff 75 e0             	pushl  -0x20(%ebp)
    228e:	e8 34 0e 00 00       	call   30c7 <topc>
    2293:	83 c4 10             	add    $0x10,%esp
    2296:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    229c:	83 ec 0c             	sub    $0xc,%esp
    229f:	ff 75 e0             	pushl  -0x20(%ebp)
    22a2:	e8 de 0d 00 00       	call   3085 <popc>
    22a7:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    22aa:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    22b1:	83 ec 0c             	sub    $0xc,%esp
    22b4:	ff 75 84             	pushl  -0x7c(%ebp)
    22b7:	ff 75 80             	pushl  -0x80(%ebp)
    22ba:	50                   	push   %eax
    22bb:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    22c1:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    22c7:	e8 16 f9 ff ff       	call   1be2 <Operate>
    22cc:	83 c4 20             	add    $0x20,%esp
    22cf:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    22d5:	dd 05 38 39 00 00    	fldl   0x3938
    22db:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    22df:	dd 1c 24             	fstpl  (%esp)
    22e2:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    22e8:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    22ee:	e8 1d ed ff ff       	call   1010 <isEqual>
    22f3:	83 c4 10             	add    $0x10,%esp
    22f6:	83 f8 01             	cmp    $0x1,%eax
    22f9:	75 08                	jne    2303 <Compute+0x67c>
          return WRONG_ANS;
    22fb:	dd 05 38 39 00 00    	fldl   0x3938
    2301:	eb 5a                	jmp    235d <Compute+0x6d6>
        pushd(opnd,result);
    2303:	83 ec 04             	sub    $0x4,%esp
    2306:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    230c:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2312:	ff 75 e4             	pushl  -0x1c(%ebp)
    2315:	e8 f4 0d 00 00       	call   310e <pushd>
    231a:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    231d:	83 ec 0c             	sub    $0xc,%esp
    2320:	ff 75 e0             	pushl  -0x20(%ebp)
    2323:	e8 9f 0d 00 00       	call   30c7 <topc>
    2328:	83 c4 10             	add    $0x10,%esp
    232b:	3c 23                	cmp    $0x23,%al
    232d:	0f 85 10 ff ff ff    	jne    2243 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    2333:	83 ec 0c             	sub    $0xc,%esp
    2336:	ff 75 e4             	pushl  -0x1c(%ebp)
    2339:	e8 94 e4 ff ff       	call   7d2 <free>
    233e:	83 c4 10             	add    $0x10,%esp
    free(optr);
    2341:	83 ec 0c             	sub    $0xc,%esp
    2344:	ff 75 e0             	pushl  -0x20(%ebp)
    2347:	e8 86 e4 ff ff       	call   7d2 <free>
    234c:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    234f:	83 ec 0c             	sub    $0xc,%esp
    2352:	ff 75 e4             	pushl  -0x1c(%ebp)
    2355:	e8 51 0e 00 00       	call   31ab <topd>
    235a:	83 c4 10             	add    $0x10,%esp
}
    235d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2360:	c9                   	leave  
    2361:	c3                   	ret    

00002362 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    2362:	55                   	push   %ebp
    2363:	89 e5                	mov    %esp,%ebp
    2365:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    2368:	8b 45 08             	mov    0x8(%ebp),%eax
    236b:	8b 00                	mov    (%eax),%eax
    236d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2370:	eb 04                	jmp    2376 <gettoken+0x14>
    s++;
    2372:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2376:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2379:	3b 45 0c             	cmp    0xc(%ebp),%eax
    237c:	73 1e                	jae    239c <gettoken+0x3a>
    237e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2381:	0f b6 00             	movzbl (%eax),%eax
    2384:	0f be c0             	movsbl %al,%eax
    2387:	83 ec 08             	sub    $0x8,%esp
    238a:	50                   	push   %eax
    238b:	68 74 44 00 00       	push   $0x4474
    2390:	e8 50 de ff ff       	call   1e5 <strchr>
    2395:	83 c4 10             	add    $0x10,%esp
    2398:	85 c0                	test   %eax,%eax
    239a:	75 d6                	jne    2372 <gettoken+0x10>
    s++;
  if(q)
    239c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    23a0:	74 08                	je     23aa <gettoken+0x48>
    *q = s;
    23a2:	8b 45 10             	mov    0x10(%ebp),%eax
    23a5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    23a8:	89 10                	mov    %edx,(%eax)
  ret = *s;
    23aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23ad:	0f b6 00             	movzbl (%eax),%eax
    23b0:	0f be c0             	movsbl %al,%eax
    23b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    23b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23b9:	0f b6 00             	movzbl (%eax),%eax
    23bc:	0f be c0             	movsbl %al,%eax
    23bf:	83 f8 29             	cmp    $0x29,%eax
    23c2:	7f 14                	jg     23d8 <gettoken+0x76>
    23c4:	83 f8 28             	cmp    $0x28,%eax
    23c7:	7d 28                	jge    23f1 <gettoken+0x8f>
    23c9:	85 c0                	test   %eax,%eax
    23cb:	0f 84 94 00 00 00    	je     2465 <gettoken+0x103>
    23d1:	83 f8 26             	cmp    $0x26,%eax
    23d4:	74 1b                	je     23f1 <gettoken+0x8f>
    23d6:	eb 3a                	jmp    2412 <gettoken+0xb0>
    23d8:	83 f8 3e             	cmp    $0x3e,%eax
    23db:	74 1a                	je     23f7 <gettoken+0x95>
    23dd:	83 f8 3e             	cmp    $0x3e,%eax
    23e0:	7f 0a                	jg     23ec <gettoken+0x8a>
    23e2:	83 e8 3b             	sub    $0x3b,%eax
    23e5:	83 f8 01             	cmp    $0x1,%eax
    23e8:	77 28                	ja     2412 <gettoken+0xb0>
    23ea:	eb 05                	jmp    23f1 <gettoken+0x8f>
    23ec:	83 f8 7c             	cmp    $0x7c,%eax
    23ef:	75 21                	jne    2412 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    23f1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    23f5:	eb 75                	jmp    246c <gettoken+0x10a>
  case '>':
    s++;
    23f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    23fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23fe:	0f b6 00             	movzbl (%eax),%eax
    2401:	3c 3e                	cmp    $0x3e,%al
    2403:	75 63                	jne    2468 <gettoken+0x106>
      ret = '+';
    2405:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    240c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    2410:	eb 56                	jmp    2468 <gettoken+0x106>
  default:
    ret = 'a';
    2412:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2419:	eb 04                	jmp    241f <gettoken+0xbd>
      s++;
    241b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    241f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2422:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2425:	73 44                	jae    246b <gettoken+0x109>
    2427:	8b 45 f4             	mov    -0xc(%ebp),%eax
    242a:	0f b6 00             	movzbl (%eax),%eax
    242d:	0f be c0             	movsbl %al,%eax
    2430:	83 ec 08             	sub    $0x8,%esp
    2433:	50                   	push   %eax
    2434:	68 74 44 00 00       	push   $0x4474
    2439:	e8 a7 dd ff ff       	call   1e5 <strchr>
    243e:	83 c4 10             	add    $0x10,%esp
    2441:	85 c0                	test   %eax,%eax
    2443:	75 26                	jne    246b <gettoken+0x109>
    2445:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2448:	0f b6 00             	movzbl (%eax),%eax
    244b:	0f be c0             	movsbl %al,%eax
    244e:	83 ec 08             	sub    $0x8,%esp
    2451:	50                   	push   %eax
    2452:	68 7c 44 00 00       	push   $0x447c
    2457:	e8 89 dd ff ff       	call   1e5 <strchr>
    245c:	83 c4 10             	add    $0x10,%esp
    245f:	85 c0                	test   %eax,%eax
    2461:	74 b8                	je     241b <gettoken+0xb9>
      s++;
    break;
    2463:	eb 06                	jmp    246b <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    2465:	90                   	nop
    2466:	eb 04                	jmp    246c <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    2468:	90                   	nop
    2469:	eb 01                	jmp    246c <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    246b:	90                   	nop
  }
  if(eq)
    246c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2470:	74 0e                	je     2480 <gettoken+0x11e>
    *eq = s;
    2472:	8b 45 14             	mov    0x14(%ebp),%eax
    2475:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2478:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    247a:	eb 04                	jmp    2480 <gettoken+0x11e>
    s++;
    247c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    2480:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2483:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2486:	73 1e                	jae    24a6 <gettoken+0x144>
    2488:	8b 45 f4             	mov    -0xc(%ebp),%eax
    248b:	0f b6 00             	movzbl (%eax),%eax
    248e:	0f be c0             	movsbl %al,%eax
    2491:	83 ec 08             	sub    $0x8,%esp
    2494:	50                   	push   %eax
    2495:	68 74 44 00 00       	push   $0x4474
    249a:	e8 46 dd ff ff       	call   1e5 <strchr>
    249f:	83 c4 10             	add    $0x10,%esp
    24a2:	85 c0                	test   %eax,%eax
    24a4:	75 d6                	jne    247c <gettoken+0x11a>
    s++;
  *ps = s;
    24a6:	8b 45 08             	mov    0x8(%ebp),%eax
    24a9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    24ac:	89 10                	mov    %edx,(%eax)
  return ret;
    24ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    24b1:	c9                   	leave  
    24b2:	c3                   	ret    

000024b3 <peek>:

int peek(char **ps, char *es, char *toks)
{
    24b3:	55                   	push   %ebp
    24b4:	89 e5                	mov    %esp,%ebp
    24b6:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    24b9:	8b 45 08             	mov    0x8(%ebp),%eax
    24bc:	8b 00                	mov    (%eax),%eax
    24be:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    24c1:	eb 04                	jmp    24c7 <peek+0x14>
    s++;
    24c3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    24c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24ca:	3b 45 0c             	cmp    0xc(%ebp),%eax
    24cd:	73 1e                	jae    24ed <peek+0x3a>
    24cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24d2:	0f b6 00             	movzbl (%eax),%eax
    24d5:	0f be c0             	movsbl %al,%eax
    24d8:	83 ec 08             	sub    $0x8,%esp
    24db:	50                   	push   %eax
    24dc:	68 74 44 00 00       	push   $0x4474
    24e1:	e8 ff dc ff ff       	call   1e5 <strchr>
    24e6:	83 c4 10             	add    $0x10,%esp
    24e9:	85 c0                	test   %eax,%eax
    24eb:	75 d6                	jne    24c3 <peek+0x10>
    s++;
  *ps = s;
    24ed:	8b 45 08             	mov    0x8(%ebp),%eax
    24f0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    24f3:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    24f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24f8:	0f b6 00             	movzbl (%eax),%eax
    24fb:	84 c0                	test   %al,%al
    24fd:	74 23                	je     2522 <peek+0x6f>
    24ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2502:	0f b6 00             	movzbl (%eax),%eax
    2505:	0f be c0             	movsbl %al,%eax
    2508:	83 ec 08             	sub    $0x8,%esp
    250b:	50                   	push   %eax
    250c:	ff 75 10             	pushl  0x10(%ebp)
    250f:	e8 d1 dc ff ff       	call   1e5 <strchr>
    2514:	83 c4 10             	add    $0x10,%esp
    2517:	85 c0                	test   %eax,%eax
    2519:	74 07                	je     2522 <peek+0x6f>
    251b:	b8 01 00 00 00       	mov    $0x1,%eax
    2520:	eb 05                	jmp    2527 <peek+0x74>
    2522:	b8 00 00 00 00       	mov    $0x0,%eax
}
    2527:	c9                   	leave  
    2528:	c3                   	ret    

00002529 <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    2529:	55                   	push   %ebp
    252a:	89 e5                	mov    %esp,%ebp
    252c:	53                   	push   %ebx
    252d:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    2530:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2533:	8b 45 08             	mov    0x8(%ebp),%eax
    2536:	83 ec 0c             	sub    $0xc,%esp
    2539:	50                   	push   %eax
    253a:	e8 65 dc ff ff       	call   1a4 <strlen>
    253f:	83 c4 10             	add    $0x10,%esp
    2542:	01 d8                	add    %ebx,%eax
    2544:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    2547:	8b 45 08             	mov    0x8(%ebp),%eax
    254a:	0f b6 00             	movzbl (%eax),%eax
    254d:	3c 25                	cmp    $0x25,%al
    254f:	75 5d                	jne    25ae <parsecmd+0x85>
  {
    int len = strlen(s);
    2551:	8b 45 08             	mov    0x8(%ebp),%eax
    2554:	83 ec 0c             	sub    $0xc,%esp
    2557:	50                   	push   %eax
    2558:	e8 47 dc ff ff       	call   1a4 <strlen>
    255d:	83 c4 10             	add    $0x10,%esp
    2560:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    2563:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2566:	83 ec 0c             	sub    $0xc,%esp
    2569:	50                   	push   %eax
    256a:	e8 a5 e3 ff ff       	call   914 <malloc>
    256f:	83 c4 10             	add    $0x10,%esp
    2572:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    2575:	8b 45 08             	mov    0x8(%ebp),%eax
    2578:	83 c0 01             	add    $0x1,%eax
    257b:	83 ec 08             	sub    $0x8,%esp
    257e:	50                   	push   %eax
    257f:	ff 75 ec             	pushl  -0x14(%ebp)
    2582:	e8 ae db ff ff       	call   135 <strcpy>
    2587:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    258a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    258d:	8d 50 fe             	lea    -0x2(%eax),%edx
    2590:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2593:	01 d0                	add    %edx,%eax
    2595:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    2598:	83 ec 0c             	sub    $0xc,%esp
    259b:	ff 75 ec             	pushl  -0x14(%ebp)
    259e:	e8 59 e9 ff ff       	call   efc <calcmd>
    25a3:	83 c4 10             	add    $0x10,%esp
    25a6:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    25a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    25ac:	eb 6b                	jmp    2619 <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    25ae:	83 ec 08             	sub    $0x8,%esp
    25b1:	ff 75 f4             	pushl  -0xc(%ebp)
    25b4:	8d 45 08             	lea    0x8(%ebp),%eax
    25b7:	50                   	push   %eax
    25b8:	e8 61 00 00 00       	call   261e <parseline>
    25bd:	83 c4 10             	add    $0x10,%esp
    25c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    25c3:	83 ec 04             	sub    $0x4,%esp
    25c6:	68 40 39 00 00       	push   $0x3940
    25cb:	ff 75 f4             	pushl  -0xc(%ebp)
    25ce:	8d 45 08             	lea    0x8(%ebp),%eax
    25d1:	50                   	push   %eax
    25d2:	e8 dc fe ff ff       	call   24b3 <peek>
    25d7:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    25da:	8b 45 08             	mov    0x8(%ebp),%eax
    25dd:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    25e0:	74 26                	je     2608 <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    25e2:	8b 45 08             	mov    0x8(%ebp),%eax
    25e5:	83 ec 04             	sub    $0x4,%esp
    25e8:	50                   	push   %eax
    25e9:	68 41 39 00 00       	push   $0x3941
    25ee:	6a 02                	push   $0x2
    25f0:	e8 1d e0 ff ff       	call   612 <printf>
    25f5:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    25f8:	83 ec 0c             	sub    $0xc,%esp
    25fb:	68 50 39 00 00       	push   $0x3950
    2600:	e8 f2 e3 ff ff       	call   9f7 <panic1>
    2605:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    2608:	83 ec 0c             	sub    $0xc,%esp
    260b:	ff 75 e4             	pushl  -0x1c(%ebp)
    260e:	e8 eb 03 00 00       	call   29fe <nulterminate>
    2613:	83 c4 10             	add    $0x10,%esp
  return cmd;
    2616:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    2619:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    261c:	c9                   	leave  
    261d:	c3                   	ret    

0000261e <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    261e:	55                   	push   %ebp
    261f:	89 e5                	mov    %esp,%ebp
    2621:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    2624:	83 ec 08             	sub    $0x8,%esp
    2627:	ff 75 0c             	pushl  0xc(%ebp)
    262a:	ff 75 08             	pushl  0x8(%ebp)
    262d:	e8 99 00 00 00       	call   26cb <parsepipe>
    2632:	83 c4 10             	add    $0x10,%esp
    2635:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    2638:	eb 23                	jmp    265d <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    263a:	6a 00                	push   $0x0
    263c:	6a 00                	push   $0x0
    263e:	ff 75 0c             	pushl  0xc(%ebp)
    2641:	ff 75 08             	pushl  0x8(%ebp)
    2644:	e8 19 fd ff ff       	call   2362 <gettoken>
    2649:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    264c:	83 ec 0c             	sub    $0xc,%esp
    264f:	ff 75 f4             	pushl  -0xc(%ebp)
    2652:	e8 66 e8 ff ff       	call   ebd <backcmd>
    2657:	83 c4 10             	add    $0x10,%esp
    265a:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    265d:	83 ec 04             	sub    $0x4,%esp
    2660:	68 57 39 00 00       	push   $0x3957
    2665:	ff 75 0c             	pushl  0xc(%ebp)
    2668:	ff 75 08             	pushl  0x8(%ebp)
    266b:	e8 43 fe ff ff       	call   24b3 <peek>
    2670:	83 c4 10             	add    $0x10,%esp
    2673:	85 c0                	test   %eax,%eax
    2675:	75 c3                	jne    263a <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    2677:	83 ec 04             	sub    $0x4,%esp
    267a:	68 59 39 00 00       	push   $0x3959
    267f:	ff 75 0c             	pushl  0xc(%ebp)
    2682:	ff 75 08             	pushl  0x8(%ebp)
    2685:	e8 29 fe ff ff       	call   24b3 <peek>
    268a:	83 c4 10             	add    $0x10,%esp
    268d:	85 c0                	test   %eax,%eax
    268f:	74 35                	je     26c6 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    2691:	6a 00                	push   $0x0
    2693:	6a 00                	push   $0x0
    2695:	ff 75 0c             	pushl  0xc(%ebp)
    2698:	ff 75 08             	pushl  0x8(%ebp)
    269b:	e8 c2 fc ff ff       	call   2362 <gettoken>
    26a0:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    26a3:	83 ec 08             	sub    $0x8,%esp
    26a6:	ff 75 0c             	pushl  0xc(%ebp)
    26a9:	ff 75 08             	pushl  0x8(%ebp)
    26ac:	e8 6d ff ff ff       	call   261e <parseline>
    26b1:	83 c4 10             	add    $0x10,%esp
    26b4:	83 ec 08             	sub    $0x8,%esp
    26b7:	50                   	push   %eax
    26b8:	ff 75 f4             	pushl  -0xc(%ebp)
    26bb:	e8 b5 e7 ff ff       	call   e75 <listcmd>
    26c0:	83 c4 10             	add    $0x10,%esp
    26c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    26c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    26c9:	c9                   	leave  
    26ca:	c3                   	ret    

000026cb <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    26cb:	55                   	push   %ebp
    26cc:	89 e5                	mov    %esp,%ebp
    26ce:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    26d1:	83 ec 08             	sub    $0x8,%esp
    26d4:	ff 75 0c             	pushl  0xc(%ebp)
    26d7:	ff 75 08             	pushl  0x8(%ebp)
    26da:	e8 ec 01 00 00       	call   28cb <parseexec>
    26df:	83 c4 10             	add    $0x10,%esp
    26e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    26e5:	83 ec 04             	sub    $0x4,%esp
    26e8:	68 5b 39 00 00       	push   $0x395b
    26ed:	ff 75 0c             	pushl  0xc(%ebp)
    26f0:	ff 75 08             	pushl  0x8(%ebp)
    26f3:	e8 bb fd ff ff       	call   24b3 <peek>
    26f8:	83 c4 10             	add    $0x10,%esp
    26fb:	85 c0                	test   %eax,%eax
    26fd:	74 35                	je     2734 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    26ff:	6a 00                	push   $0x0
    2701:	6a 00                	push   $0x0
    2703:	ff 75 0c             	pushl  0xc(%ebp)
    2706:	ff 75 08             	pushl  0x8(%ebp)
    2709:	e8 54 fc ff ff       	call   2362 <gettoken>
    270e:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2711:	83 ec 08             	sub    $0x8,%esp
    2714:	ff 75 0c             	pushl  0xc(%ebp)
    2717:	ff 75 08             	pushl  0x8(%ebp)
    271a:	e8 ac ff ff ff       	call   26cb <parsepipe>
    271f:	83 c4 10             	add    $0x10,%esp
    2722:	83 ec 08             	sub    $0x8,%esp
    2725:	50                   	push   %eax
    2726:	ff 75 f4             	pushl  -0xc(%ebp)
    2729:	e8 ff e6 ff ff       	call   e2d <pipecmd>
    272e:	83 c4 10             	add    $0x10,%esp
    2731:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2734:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2737:	c9                   	leave  
    2738:	c3                   	ret    

00002739 <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    2739:	55                   	push   %ebp
    273a:	89 e5                	mov    %esp,%ebp
    273c:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    273f:	e9 b6 00 00 00       	jmp    27fa <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    2744:	6a 00                	push   $0x0
    2746:	6a 00                	push   $0x0
    2748:	ff 75 10             	pushl  0x10(%ebp)
    274b:	ff 75 0c             	pushl  0xc(%ebp)
    274e:	e8 0f fc ff ff       	call   2362 <gettoken>
    2753:	83 c4 10             	add    $0x10,%esp
    2756:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    2759:	8d 45 ec             	lea    -0x14(%ebp),%eax
    275c:	50                   	push   %eax
    275d:	8d 45 f0             	lea    -0x10(%ebp),%eax
    2760:	50                   	push   %eax
    2761:	ff 75 10             	pushl  0x10(%ebp)
    2764:	ff 75 0c             	pushl  0xc(%ebp)
    2767:	e8 f6 fb ff ff       	call   2362 <gettoken>
    276c:	83 c4 10             	add    $0x10,%esp
    276f:	83 f8 61             	cmp    $0x61,%eax
    2772:	74 10                	je     2784 <parseredirs+0x4b>
      panic1("missing file for redirection");
    2774:	83 ec 0c             	sub    $0xc,%esp
    2777:	68 5d 39 00 00       	push   $0x395d
    277c:	e8 76 e2 ff ff       	call   9f7 <panic1>
    2781:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    2784:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2787:	83 f8 3c             	cmp    $0x3c,%eax
    278a:	74 0c                	je     2798 <parseredirs+0x5f>
    278c:	83 f8 3e             	cmp    $0x3e,%eax
    278f:	74 26                	je     27b7 <parseredirs+0x7e>
    2791:	83 f8 2b             	cmp    $0x2b,%eax
    2794:	74 43                	je     27d9 <parseredirs+0xa0>
    2796:	eb 62                	jmp    27fa <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    2798:	8b 55 ec             	mov    -0x14(%ebp),%edx
    279b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    279e:	83 ec 0c             	sub    $0xc,%esp
    27a1:	6a 00                	push   $0x0
    27a3:	6a 00                	push   $0x0
    27a5:	52                   	push   %edx
    27a6:	50                   	push   %eax
    27a7:	ff 75 08             	pushl  0x8(%ebp)
    27aa:	e8 1b e6 ff ff       	call   dca <redircmd>
    27af:	83 c4 20             	add    $0x20,%esp
    27b2:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    27b5:	eb 43                	jmp    27fa <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    27b7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    27ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27bd:	83 ec 0c             	sub    $0xc,%esp
    27c0:	6a 01                	push   $0x1
    27c2:	68 01 02 00 00       	push   $0x201
    27c7:	52                   	push   %edx
    27c8:	50                   	push   %eax
    27c9:	ff 75 08             	pushl  0x8(%ebp)
    27cc:	e8 f9 e5 ff ff       	call   dca <redircmd>
    27d1:	83 c4 20             	add    $0x20,%esp
    27d4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    27d7:	eb 21                	jmp    27fa <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    27d9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    27dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27df:	83 ec 0c             	sub    $0xc,%esp
    27e2:	6a 01                	push   $0x1
    27e4:	68 01 02 00 00       	push   $0x201
    27e9:	52                   	push   %edx
    27ea:	50                   	push   %eax
    27eb:	ff 75 08             	pushl  0x8(%ebp)
    27ee:	e8 d7 e5 ff ff       	call   dca <redircmd>
    27f3:	83 c4 20             	add    $0x20,%esp
    27f6:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    27f9:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    27fa:	83 ec 04             	sub    $0x4,%esp
    27fd:	68 7a 39 00 00       	push   $0x397a
    2802:	ff 75 10             	pushl  0x10(%ebp)
    2805:	ff 75 0c             	pushl  0xc(%ebp)
    2808:	e8 a6 fc ff ff       	call   24b3 <peek>
    280d:	83 c4 10             	add    $0x10,%esp
    2810:	85 c0                	test   %eax,%eax
    2812:	0f 85 2c ff ff ff    	jne    2744 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    2818:	8b 45 08             	mov    0x8(%ebp),%eax
}
    281b:	c9                   	leave  
    281c:	c3                   	ret    

0000281d <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    281d:	55                   	push   %ebp
    281e:	89 e5                	mov    %esp,%ebp
    2820:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2823:	83 ec 04             	sub    $0x4,%esp
    2826:	68 7d 39 00 00       	push   $0x397d
    282b:	ff 75 0c             	pushl  0xc(%ebp)
    282e:	ff 75 08             	pushl  0x8(%ebp)
    2831:	e8 7d fc ff ff       	call   24b3 <peek>
    2836:	83 c4 10             	add    $0x10,%esp
    2839:	85 c0                	test   %eax,%eax
    283b:	75 10                	jne    284d <parseblock+0x30>
    panic1("parseblock");
    283d:	83 ec 0c             	sub    $0xc,%esp
    2840:	68 7f 39 00 00       	push   $0x397f
    2845:	e8 ad e1 ff ff       	call   9f7 <panic1>
    284a:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    284d:	6a 00                	push   $0x0
    284f:	6a 00                	push   $0x0
    2851:	ff 75 0c             	pushl  0xc(%ebp)
    2854:	ff 75 08             	pushl  0x8(%ebp)
    2857:	e8 06 fb ff ff       	call   2362 <gettoken>
    285c:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    285f:	83 ec 08             	sub    $0x8,%esp
    2862:	ff 75 0c             	pushl  0xc(%ebp)
    2865:	ff 75 08             	pushl  0x8(%ebp)
    2868:	e8 b1 fd ff ff       	call   261e <parseline>
    286d:	83 c4 10             	add    $0x10,%esp
    2870:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    2873:	83 ec 04             	sub    $0x4,%esp
    2876:	68 8a 39 00 00       	push   $0x398a
    287b:	ff 75 0c             	pushl  0xc(%ebp)
    287e:	ff 75 08             	pushl  0x8(%ebp)
    2881:	e8 2d fc ff ff       	call   24b3 <peek>
    2886:	83 c4 10             	add    $0x10,%esp
    2889:	85 c0                	test   %eax,%eax
    288b:	75 10                	jne    289d <parseblock+0x80>
    panic1("syntax - missing )");
    288d:	83 ec 0c             	sub    $0xc,%esp
    2890:	68 8c 39 00 00       	push   $0x398c
    2895:	e8 5d e1 ff ff       	call   9f7 <panic1>
    289a:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    289d:	6a 00                	push   $0x0
    289f:	6a 00                	push   $0x0
    28a1:	ff 75 0c             	pushl  0xc(%ebp)
    28a4:	ff 75 08             	pushl  0x8(%ebp)
    28a7:	e8 b6 fa ff ff       	call   2362 <gettoken>
    28ac:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    28af:	83 ec 04             	sub    $0x4,%esp
    28b2:	ff 75 0c             	pushl  0xc(%ebp)
    28b5:	ff 75 08             	pushl  0x8(%ebp)
    28b8:	ff 75 f4             	pushl  -0xc(%ebp)
    28bb:	e8 79 fe ff ff       	call   2739 <parseredirs>
    28c0:	83 c4 10             	add    $0x10,%esp
    28c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    28c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    28c9:	c9                   	leave  
    28ca:	c3                   	ret    

000028cb <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    28cb:	55                   	push   %ebp
    28cc:	89 e5                	mov    %esp,%ebp
    28ce:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    28d1:	83 ec 04             	sub    $0x4,%esp
    28d4:	68 7d 39 00 00       	push   $0x397d
    28d9:	ff 75 0c             	pushl  0xc(%ebp)
    28dc:	ff 75 08             	pushl  0x8(%ebp)
    28df:	e8 cf fb ff ff       	call   24b3 <peek>
    28e4:	83 c4 10             	add    $0x10,%esp
    28e7:	85 c0                	test   %eax,%eax
    28e9:	74 16                	je     2901 <parseexec+0x36>
    return parseblock(ps, es);
    28eb:	83 ec 08             	sub    $0x8,%esp
    28ee:	ff 75 0c             	pushl  0xc(%ebp)
    28f1:	ff 75 08             	pushl  0x8(%ebp)
    28f4:	e8 24 ff ff ff       	call   281d <parseblock>
    28f9:	83 c4 10             	add    $0x10,%esp
    28fc:	e9 fb 00 00 00       	jmp    29fc <parseexec+0x131>

  ret = execcmd();
    2901:	e8 8e e4 ff ff       	call   d94 <execcmd>
    2906:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    2909:	8b 45 f0             	mov    -0x10(%ebp),%eax
    290c:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    290f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2916:	83 ec 04             	sub    $0x4,%esp
    2919:	ff 75 0c             	pushl  0xc(%ebp)
    291c:	ff 75 08             	pushl  0x8(%ebp)
    291f:	ff 75 f0             	pushl  -0x10(%ebp)
    2922:	e8 12 fe ff ff       	call   2739 <parseredirs>
    2927:	83 c4 10             	add    $0x10,%esp
    292a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    292d:	e9 87 00 00 00       	jmp    29b9 <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2932:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2935:	50                   	push   %eax
    2936:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2939:	50                   	push   %eax
    293a:	ff 75 0c             	pushl  0xc(%ebp)
    293d:	ff 75 08             	pushl  0x8(%ebp)
    2940:	e8 1d fa ff ff       	call   2362 <gettoken>
    2945:	83 c4 10             	add    $0x10,%esp
    2948:	89 45 e8             	mov    %eax,-0x18(%ebp)
    294b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    294f:	0f 84 84 00 00 00    	je     29d9 <parseexec+0x10e>
      break;
    if(tok != 'a')
    2955:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    2959:	74 10                	je     296b <parseexec+0xa0>
      panic1("syntax");
    295b:	83 ec 0c             	sub    $0xc,%esp
    295e:	68 50 39 00 00       	push   $0x3950
    2963:	e8 8f e0 ff ff       	call   9f7 <panic1>
    2968:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    296b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    296e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2971:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2974:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    2978:	8b 55 e0             	mov    -0x20(%ebp),%edx
    297b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    297e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2981:	83 c1 08             	add    $0x8,%ecx
    2984:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    2988:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    298c:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2990:	7e 10                	jle    29a2 <parseexec+0xd7>
      panic1("too many args");
    2992:	83 ec 0c             	sub    $0xc,%esp
    2995:	68 9f 39 00 00       	push   $0x399f
    299a:	e8 58 e0 ff ff       	call   9f7 <panic1>
    299f:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    29a2:	83 ec 04             	sub    $0x4,%esp
    29a5:	ff 75 0c             	pushl  0xc(%ebp)
    29a8:	ff 75 08             	pushl  0x8(%ebp)
    29ab:	ff 75 f0             	pushl  -0x10(%ebp)
    29ae:	e8 86 fd ff ff       	call   2739 <parseredirs>
    29b3:	83 c4 10             	add    $0x10,%esp
    29b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    29b9:	83 ec 04             	sub    $0x4,%esp
    29bc:	68 ad 39 00 00       	push   $0x39ad
    29c1:	ff 75 0c             	pushl  0xc(%ebp)
    29c4:	ff 75 08             	pushl  0x8(%ebp)
    29c7:	e8 e7 fa ff ff       	call   24b3 <peek>
    29cc:	83 c4 10             	add    $0x10,%esp
    29cf:	85 c0                	test   %eax,%eax
    29d1:	0f 84 5b ff ff ff    	je     2932 <parseexec+0x67>
    29d7:	eb 01                	jmp    29da <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    29d9:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    29da:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29dd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29e0:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    29e7:	00 
  cmd->eargv[argc] = 0;
    29e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29eb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29ee:	83 c2 08             	add    $0x8,%edx
    29f1:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    29f8:	00 
  return ret;
    29f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    29fc:	c9                   	leave  
    29fd:	c3                   	ret    

000029fe <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    29fe:	55                   	push   %ebp
    29ff:	89 e5                	mov    %esp,%ebp
    2a01:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2a04:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2a08:	75 0a                	jne    2a14 <nulterminate+0x16>
    return 0;
    2a0a:	b8 00 00 00 00       	mov    $0x0,%eax
    2a0f:	e9 e4 00 00 00       	jmp    2af8 <nulterminate+0xfa>
  
  switch(cmd->type){
    2a14:	8b 45 08             	mov    0x8(%ebp),%eax
    2a17:	8b 00                	mov    (%eax),%eax
    2a19:	83 f8 05             	cmp    $0x5,%eax
    2a1c:	0f 87 d3 00 00 00    	ja     2af5 <nulterminate+0xf7>
    2a22:	8b 04 85 b4 39 00 00 	mov    0x39b4(,%eax,4),%eax
    2a29:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2a2b:	8b 45 08             	mov    0x8(%ebp),%eax
    2a2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2a31:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a38:	eb 14                	jmp    2a4e <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2a3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a3d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a40:	83 c2 08             	add    $0x8,%edx
    2a43:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2a47:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2a4a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2a4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a51:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a54:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2a58:	85 c0                	test   %eax,%eax
    2a5a:	75 de                	jne    2a3a <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2a5c:	e9 94 00 00 00       	jmp    2af5 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2a61:	8b 45 08             	mov    0x8(%ebp),%eax
    2a64:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2a67:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a6a:	8b 40 04             	mov    0x4(%eax),%eax
    2a6d:	83 ec 0c             	sub    $0xc,%esp
    2a70:	50                   	push   %eax
    2a71:	e8 88 ff ff ff       	call   29fe <nulterminate>
    2a76:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2a79:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a7c:	8b 40 0c             	mov    0xc(%eax),%eax
    2a7f:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2a82:	eb 71                	jmp    2af5 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2a84:	8b 45 08             	mov    0x8(%ebp),%eax
    2a87:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2a8a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a8d:	8b 40 04             	mov    0x4(%eax),%eax
    2a90:	83 ec 0c             	sub    $0xc,%esp
    2a93:	50                   	push   %eax
    2a94:	e8 65 ff ff ff       	call   29fe <nulterminate>
    2a99:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2a9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a9f:	8b 40 08             	mov    0x8(%eax),%eax
    2aa2:	83 ec 0c             	sub    $0xc,%esp
    2aa5:	50                   	push   %eax
    2aa6:	e8 53 ff ff ff       	call   29fe <nulterminate>
    2aab:	83 c4 10             	add    $0x10,%esp
    break;
    2aae:	eb 45                	jmp    2af5 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2ab0:	8b 45 08             	mov    0x8(%ebp),%eax
    2ab3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2ab6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ab9:	8b 40 04             	mov    0x4(%eax),%eax
    2abc:	83 ec 0c             	sub    $0xc,%esp
    2abf:	50                   	push   %eax
    2ac0:	e8 39 ff ff ff       	call   29fe <nulterminate>
    2ac5:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2ac8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2acb:	8b 40 08             	mov    0x8(%eax),%eax
    2ace:	83 ec 0c             	sub    $0xc,%esp
    2ad1:	50                   	push   %eax
    2ad2:	e8 27 ff ff ff       	call   29fe <nulterminate>
    2ad7:	83 c4 10             	add    $0x10,%esp
    break;
    2ada:	eb 19                	jmp    2af5 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2adc:	8b 45 08             	mov    0x8(%ebp),%eax
    2adf:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2ae2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2ae5:	8b 40 04             	mov    0x4(%eax),%eax
    2ae8:	83 ec 0c             	sub    $0xc,%esp
    2aeb:	50                   	push   %eax
    2aec:	e8 0d ff ff ff       	call   29fe <nulterminate>
    2af1:	83 c4 10             	add    $0x10,%esp
    break;
    2af4:	90                   	nop
  }
  return cmd;
    2af5:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2af8:	c9                   	leave  
    2af9:	c3                   	ret    

00002afa <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2afa:	55                   	push   %ebp
    2afb:	89 e5                	mov    %esp,%ebp
    2afd:	83 ec 18             	sub    $0x18,%esp
    2b00:	8b 45 08             	mov    0x8(%ebp),%eax
    2b03:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2b06:	83 ec 08             	sub    $0x8,%esp
    2b09:	ff 75 18             	pushl  0x18(%ebp)
    2b0c:	ff 75 14             	pushl  0x14(%ebp)
    2b0f:	ff 75 10             	pushl  0x10(%ebp)
    2b12:	ff 75 0c             	pushl  0xc(%ebp)
    2b15:	6a 01                	push   $0x1
    2b17:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2b1a:	50                   	push   %eax
    2b1b:	e8 e6 d8 ff ff       	call   406 <colorwrite>
    2b20:	83 c4 20             	add    $0x20,%esp
}
    2b23:	90                   	nop
    2b24:	c9                   	leave  
    2b25:	c3                   	ret    

00002b26 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2b26:	55                   	push   %ebp
    2b27:	89 e5                	mov    %esp,%ebp
    2b29:	53                   	push   %ebx
    2b2a:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2b2d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2b34:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2b38:	74 17                	je     2b51 <color_printint+0x2b>
    2b3a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2b3e:	79 11                	jns    2b51 <color_printint+0x2b>
    neg = 1;
    2b40:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2b47:	8b 45 08             	mov    0x8(%ebp),%eax
    2b4a:	f7 d8                	neg    %eax
    2b4c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b4f:	eb 06                	jmp    2b57 <color_printint+0x31>
  } else {
    x = xx;
    2b51:	8b 45 08             	mov    0x8(%ebp),%eax
    2b54:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2b57:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2b5e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2b61:	8d 41 01             	lea    0x1(%ecx),%eax
    2b64:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b67:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2b6a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b6d:	ba 00 00 00 00       	mov    $0x0,%edx
    2b72:	f7 f3                	div    %ebx
    2b74:	89 d0                	mov    %edx,%eax
    2b76:	0f b6 80 84 44 00 00 	movzbl 0x4484(%eax),%eax
    2b7d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2b81:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2b84:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b87:	ba 00 00 00 00       	mov    $0x0,%edx
    2b8c:	f7 f3                	div    %ebx
    2b8e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b91:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2b95:	75 c7                	jne    2b5e <color_printint+0x38>
  if(neg)
    2b97:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2b9b:	74 36                	je     2bd3 <color_printint+0xad>
    buf[i++] = '-';
    2b9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ba0:	8d 50 01             	lea    0x1(%eax),%edx
    2ba3:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2ba6:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2bab:	eb 26                	jmp    2bd3 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2bad:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2bb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bb3:	01 d0                	add    %edx,%eax
    2bb5:	0f b6 00             	movzbl (%eax),%eax
    2bb8:	0f be c0             	movsbl %al,%eax
    2bbb:	83 ec 0c             	sub    $0xc,%esp
    2bbe:	ff 75 20             	pushl  0x20(%ebp)
    2bc1:	ff 75 1c             	pushl  0x1c(%ebp)
    2bc4:	ff 75 18             	pushl  0x18(%ebp)
    2bc7:	ff 75 14             	pushl  0x14(%ebp)
    2bca:	50                   	push   %eax
    2bcb:	e8 2a ff ff ff       	call   2afa <color_putc>
    2bd0:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2bd3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2bd7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2bdb:	79 d0                	jns    2bad <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2bdd:	90                   	nop
    2bde:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2be1:	c9                   	leave  
    2be2:	c3                   	ret    

00002be3 <getInteger>:

static int getInteger(double num)
{
    2be3:	55                   	push   %ebp
    2be4:	89 e5                	mov    %esp,%ebp
    2be6:	83 ec 18             	sub    $0x18,%esp
    2be9:	8b 45 08             	mov    0x8(%ebp),%eax
    2bec:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2bef:	8b 45 0c             	mov    0xc(%ebp),%eax
    2bf2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2bf5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2bfc:	eb 0e                	jmp    2c0c <getInteger+0x29>
  {
    num -= 1;
    2bfe:	dd 45 e8             	fldl   -0x18(%ebp)
    2c01:	d9 e8                	fld1   
    2c03:	de e9                	fsubrp %st,%st(1)
    2c05:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2c08:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2c0c:	dd 45 e8             	fldl   -0x18(%ebp)
    2c0f:	d9 e8                	fld1   
    2c11:	d9 c9                	fxch   %st(1)
    2c13:	df e9                	fucomip %st(1),%st
    2c15:	dd d8                	fstp   %st(0)
    2c17:	77 e5                	ja     2bfe <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2c19:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2c1c:	c9                   	leave  
    2c1d:	c3                   	ret    

00002c1e <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2c1e:	55                   	push   %ebp
    2c1f:	89 e5                	mov    %esp,%ebp
    2c21:	83 ec 28             	sub    $0x28,%esp
    2c24:	8b 45 08             	mov    0x8(%ebp),%eax
    2c27:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2c2a:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c2d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2c30:	d9 ee                	fldz   
    2c32:	dd 45 e0             	fldl   -0x20(%ebp)
    2c35:	d9 c9                	fxch   %st(1)
    2c37:	df e9                	fucomip %st(1),%st
    2c39:	dd d8                	fstp   %st(0)
    2c3b:	76 21                	jbe    2c5e <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2c3d:	83 ec 0c             	sub    $0xc,%esp
    2c40:	ff 75 1c             	pushl  0x1c(%ebp)
    2c43:	ff 75 18             	pushl  0x18(%ebp)
    2c46:	ff 75 14             	pushl  0x14(%ebp)
    2c49:	ff 75 10             	pushl  0x10(%ebp)
    2c4c:	6a 2d                	push   $0x2d
    2c4e:	e8 a7 fe ff ff       	call   2afa <color_putc>
    2c53:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2c56:	dd 45 e0             	fldl   -0x20(%ebp)
    2c59:	d9 e0                	fchs   
    2c5b:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2c5e:	83 ec 08             	sub    $0x8,%esp
    2c61:	ff 75 e4             	pushl  -0x1c(%ebp)
    2c64:	ff 75 e0             	pushl  -0x20(%ebp)
    2c67:	e8 77 ff ff ff       	call   2be3 <getInteger>
    2c6c:	83 c4 10             	add    $0x10,%esp
    2c6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2c72:	83 ec 04             	sub    $0x4,%esp
    2c75:	ff 75 1c             	pushl  0x1c(%ebp)
    2c78:	ff 75 18             	pushl  0x18(%ebp)
    2c7b:	ff 75 14             	pushl  0x14(%ebp)
    2c7e:	ff 75 10             	pushl  0x10(%ebp)
    2c81:	6a 01                	push   $0x1
    2c83:	6a 0a                	push   $0xa
    2c85:	ff 75 f0             	pushl  -0x10(%ebp)
    2c88:	e8 99 fe ff ff       	call   2b26 <color_printint>
    2c8d:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2c90:	db 45 f0             	fildl  -0x10(%ebp)
    2c93:	dd 45 e0             	fldl   -0x20(%ebp)
    2c96:	de e1                	fsubp  %st,%st(1)
    2c98:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2c9b:	dd 45 e0             	fldl   -0x20(%ebp)
    2c9e:	dd 05 d8 39 00 00    	fldl   0x39d8
    2ca4:	d9 c9                	fxch   %st(1)
    2ca6:	df e9                	fucomip %st(1),%st
    2ca8:	dd d8                	fstp   %st(0)
    2caa:	76 19                	jbe    2cc5 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2cac:	83 ec 0c             	sub    $0xc,%esp
    2caf:	ff 75 1c             	pushl  0x1c(%ebp)
    2cb2:	ff 75 18             	pushl  0x18(%ebp)
    2cb5:	ff 75 14             	pushl  0x14(%ebp)
    2cb8:	ff 75 10             	pushl  0x10(%ebp)
    2cbb:	6a 2e                	push   $0x2e
    2cbd:	e8 38 fe ff ff       	call   2afa <color_putc>
    2cc2:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2cc5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2ccc:	eb 55                	jmp    2d23 <color_printdbl+0x105>
  {
    num = num*10;
    2cce:	dd 45 e0             	fldl   -0x20(%ebp)
    2cd1:	dd 05 e0 39 00 00    	fldl   0x39e0
    2cd7:	de c9                	fmulp  %st,%st(1)
    2cd9:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2cdc:	83 ec 08             	sub    $0x8,%esp
    2cdf:	ff 75 e4             	pushl  -0x1c(%ebp)
    2ce2:	ff 75 e0             	pushl  -0x20(%ebp)
    2ce5:	e8 f9 fe ff ff       	call   2be3 <getInteger>
    2cea:	83 c4 10             	add    $0x10,%esp
    2ced:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2cf0:	83 ec 04             	sub    $0x4,%esp
    2cf3:	ff 75 1c             	pushl  0x1c(%ebp)
    2cf6:	ff 75 18             	pushl  0x18(%ebp)
    2cf9:	ff 75 14             	pushl  0x14(%ebp)
    2cfc:	ff 75 10             	pushl  0x10(%ebp)
    2cff:	6a 01                	push   $0x1
    2d01:	6a 0a                	push   $0xa
    2d03:	ff 75 f0             	pushl  -0x10(%ebp)
    2d06:	e8 1b fe ff ff       	call   2b26 <color_printint>
    2d0b:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2d0e:	db 45 f0             	fildl  -0x10(%ebp)
    2d11:	dd 45 e0             	fldl   -0x20(%ebp)
    2d14:	de e1                	fsubp  %st,%st(1)
    2d16:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2d19:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2d1d:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2d21:	7f 13                	jg     2d36 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2d23:	dd 45 e0             	fldl   -0x20(%ebp)
    2d26:	dd 05 d8 39 00 00    	fldl   0x39d8
    2d2c:	d9 c9                	fxch   %st(1)
    2d2e:	df e9                	fucomip %st(1),%st
    2d30:	dd d8                	fstp   %st(0)
    2d32:	77 9a                	ja     2cce <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2d34:	eb 01                	jmp    2d37 <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2d36:	90                   	nop
    }
  }
}
    2d37:	90                   	nop
    2d38:	c9                   	leave  
    2d39:	c3                   	ret    

00002d3a <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2d3a:	55                   	push   %ebp
    2d3b:	89 e5                	mov    %esp,%ebp
    2d3d:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2d40:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2d47:	8d 45 18             	lea    0x18(%ebp),%eax
    2d4a:	83 c0 04             	add    $0x4,%eax
    2d4d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2d50:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2d57:	e9 e2 01 00 00       	jmp    2f3e <color_printf+0x204>
    c = fmt[i] & 0xff;
    2d5c:	8b 55 18             	mov    0x18(%ebp),%edx
    2d5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d62:	01 d0                	add    %edx,%eax
    2d64:	0f b6 00             	movzbl (%eax),%eax
    2d67:	0f be c0             	movsbl %al,%eax
    2d6a:	25 ff 00 00 00       	and    $0xff,%eax
    2d6f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2d72:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2d76:	75 35                	jne    2dad <color_printf+0x73>
      if(c == '%'){
    2d78:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2d7c:	75 0c                	jne    2d8a <color_printf+0x50>
        state = '%';
    2d7e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2d85:	e9 b0 01 00 00       	jmp    2f3a <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2d8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d8d:	0f be c0             	movsbl %al,%eax
    2d90:	83 ec 0c             	sub    $0xc,%esp
    2d93:	ff 75 14             	pushl  0x14(%ebp)
    2d96:	ff 75 10             	pushl  0x10(%ebp)
    2d99:	ff 75 0c             	pushl  0xc(%ebp)
    2d9c:	ff 75 08             	pushl  0x8(%ebp)
    2d9f:	50                   	push   %eax
    2da0:	e8 55 fd ff ff       	call   2afa <color_putc>
    2da5:	83 c4 20             	add    $0x20,%esp
    2da8:	e9 8d 01 00 00       	jmp    2f3a <color_printf+0x200>
      }
    } else if(state == '%'){
    2dad:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2db1:	0f 85 83 01 00 00    	jne    2f3a <color_printf+0x200>
      if(c == 'd'){
    2db7:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2dbb:	75 2a                	jne    2de7 <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2dbd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2dc0:	8b 00                	mov    (%eax),%eax
    2dc2:	83 ec 04             	sub    $0x4,%esp
    2dc5:	ff 75 14             	pushl  0x14(%ebp)
    2dc8:	ff 75 10             	pushl  0x10(%ebp)
    2dcb:	ff 75 0c             	pushl  0xc(%ebp)
    2dce:	ff 75 08             	pushl  0x8(%ebp)
    2dd1:	6a 01                	push   $0x1
    2dd3:	6a 0a                	push   $0xa
    2dd5:	50                   	push   %eax
    2dd6:	e8 4b fd ff ff       	call   2b26 <color_printint>
    2ddb:	83 c4 20             	add    $0x20,%esp
        ap++;
    2dde:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2de2:	e9 4c 01 00 00       	jmp    2f33 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2de7:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2deb:	74 06                	je     2df3 <color_printf+0xb9>
    2ded:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2df1:	75 2a                	jne    2e1d <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2df3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2df6:	8b 00                	mov    (%eax),%eax
    2df8:	83 ec 04             	sub    $0x4,%esp
    2dfb:	ff 75 14             	pushl  0x14(%ebp)
    2dfe:	ff 75 10             	pushl  0x10(%ebp)
    2e01:	ff 75 0c             	pushl  0xc(%ebp)
    2e04:	ff 75 08             	pushl  0x8(%ebp)
    2e07:	6a 00                	push   $0x0
    2e09:	6a 10                	push   $0x10
    2e0b:	50                   	push   %eax
    2e0c:	e8 15 fd ff ff       	call   2b26 <color_printint>
    2e11:	83 c4 20             	add    $0x20,%esp
        ap++;
    2e14:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2e18:	e9 16 01 00 00       	jmp    2f33 <color_printf+0x1f9>
      } else if(c == 's'){
    2e1d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2e21:	75 4f                	jne    2e72 <color_printf+0x138>
        s = (char*)*ap;
    2e23:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e26:	8b 00                	mov    (%eax),%eax
    2e28:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2e2b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2e2f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e33:	75 2e                	jne    2e63 <color_printf+0x129>
          s = "(null)";
    2e35:	c7 45 f4 d0 39 00 00 	movl   $0x39d0,-0xc(%ebp)
        while(*s != 0){
    2e3c:	eb 25                	jmp    2e63 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2e3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e41:	0f b6 00             	movzbl (%eax),%eax
    2e44:	0f be c0             	movsbl %al,%eax
    2e47:	83 ec 0c             	sub    $0xc,%esp
    2e4a:	ff 75 14             	pushl  0x14(%ebp)
    2e4d:	ff 75 10             	pushl  0x10(%ebp)
    2e50:	ff 75 0c             	pushl  0xc(%ebp)
    2e53:	ff 75 08             	pushl  0x8(%ebp)
    2e56:	50                   	push   %eax
    2e57:	e8 9e fc ff ff       	call   2afa <color_putc>
    2e5c:	83 c4 20             	add    $0x20,%esp
          s++;
    2e5f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2e63:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e66:	0f b6 00             	movzbl (%eax),%eax
    2e69:	84 c0                	test   %al,%al
    2e6b:	75 d1                	jne    2e3e <color_printf+0x104>
    2e6d:	e9 c1 00 00 00       	jmp    2f33 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2e72:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2e76:	75 29                	jne    2ea1 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2e78:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e7b:	8b 00                	mov    (%eax),%eax
    2e7d:	0f be c0             	movsbl %al,%eax
    2e80:	83 ec 0c             	sub    $0xc,%esp
    2e83:	ff 75 14             	pushl  0x14(%ebp)
    2e86:	ff 75 10             	pushl  0x10(%ebp)
    2e89:	ff 75 0c             	pushl  0xc(%ebp)
    2e8c:	ff 75 08             	pushl  0x8(%ebp)
    2e8f:	50                   	push   %eax
    2e90:	e8 65 fc ff ff       	call   2afa <color_putc>
    2e95:	83 c4 20             	add    $0x20,%esp
        ap++;
    2e98:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2e9c:	e9 92 00 00 00       	jmp    2f33 <color_printf+0x1f9>
      } else if(c == '%'){
    2ea1:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2ea5:	75 20                	jne    2ec7 <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2ea7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2eaa:	0f be c0             	movsbl %al,%eax
    2ead:	83 ec 0c             	sub    $0xc,%esp
    2eb0:	ff 75 14             	pushl  0x14(%ebp)
    2eb3:	ff 75 10             	pushl  0x10(%ebp)
    2eb6:	ff 75 0c             	pushl  0xc(%ebp)
    2eb9:	ff 75 08             	pushl  0x8(%ebp)
    2ebc:	50                   	push   %eax
    2ebd:	e8 38 fc ff ff       	call   2afa <color_putc>
    2ec2:	83 c4 20             	add    $0x20,%esp
    2ec5:	eb 6c                	jmp    2f33 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    2ec7:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    2ecb:	75 2f                	jne    2efc <color_printf+0x1c2>
        double *dap = (double*)ap;
    2ecd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ed0:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    2ed3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2ed6:	dd 00                	fldl   (%eax)
    2ed8:	83 ec 08             	sub    $0x8,%esp
    2edb:	ff 75 14             	pushl  0x14(%ebp)
    2ede:	ff 75 10             	pushl  0x10(%ebp)
    2ee1:	ff 75 0c             	pushl  0xc(%ebp)
    2ee4:	ff 75 08             	pushl  0x8(%ebp)
    2ee7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2eeb:	dd 1c 24             	fstpl  (%esp)
    2eee:	e8 2b fd ff ff       	call   2c1e <color_printdbl>
    2ef3:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    2ef6:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    2efa:	eb 37                	jmp    2f33 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    2efc:	83 ec 0c             	sub    $0xc,%esp
    2eff:	ff 75 14             	pushl  0x14(%ebp)
    2f02:	ff 75 10             	pushl  0x10(%ebp)
    2f05:	ff 75 0c             	pushl  0xc(%ebp)
    2f08:	ff 75 08             	pushl  0x8(%ebp)
    2f0b:	6a 25                	push   $0x25
    2f0d:	e8 e8 fb ff ff       	call   2afa <color_putc>
    2f12:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    2f15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2f18:	0f be c0             	movsbl %al,%eax
    2f1b:	83 ec 0c             	sub    $0xc,%esp
    2f1e:	ff 75 14             	pushl  0x14(%ebp)
    2f21:	ff 75 10             	pushl  0x10(%ebp)
    2f24:	ff 75 0c             	pushl  0xc(%ebp)
    2f27:	ff 75 08             	pushl  0x8(%ebp)
    2f2a:	50                   	push   %eax
    2f2b:	e8 ca fb ff ff       	call   2afa <color_putc>
    2f30:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    2f33:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2f3a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2f3e:	8b 55 18             	mov    0x18(%ebp),%edx
    2f41:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f44:	01 d0                	add    %edx,%eax
    2f46:	0f b6 00             	movzbl (%eax),%eax
    2f49:	84 c0                	test   %al,%al
    2f4b:	0f 85 0b fe ff ff    	jne    2d5c <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    2f51:	90                   	nop
    2f52:	c9                   	leave  
    2f53:	c3                   	ret    

00002f54 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    2f54:	55                   	push   %ebp
    2f55:	89 e5                	mov    %esp,%ebp
    2f57:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    2f5a:	83 ec 0c             	sub    $0xc,%esp
    2f5d:	6a 58                	push   $0x58
    2f5f:	e8 b0 d9 ff ff       	call   914 <malloc>
    2f64:	83 c4 10             	add    $0x10,%esp
    2f67:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2f6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f6d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2f73:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f76:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    2f7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2f80:	c9                   	leave  
    2f81:	c3                   	ret    

00002f82 <pushi>:

void pushi(struct istack *s, int val)
{
    2f82:	55                   	push   %ebp
    2f83:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    2f85:	8b 45 08             	mov    0x8(%ebp),%eax
    2f88:	8b 00                	mov    (%eax),%eax
    2f8a:	83 f8 13             	cmp    $0x13,%eax
    2f8d:	7f 2c                	jg     2fbb <pushi+0x39>
    {
        s->size++;
    2f8f:	8b 45 08             	mov    0x8(%ebp),%eax
    2f92:	8b 00                	mov    (%eax),%eax
    2f94:	8d 50 01             	lea    0x1(%eax),%edx
    2f97:	8b 45 08             	mov    0x8(%ebp),%eax
    2f9a:	89 10                	mov    %edx,(%eax)
        s->top++;
    2f9c:	8b 45 08             	mov    0x8(%ebp),%eax
    2f9f:	8b 40 54             	mov    0x54(%eax),%eax
    2fa2:	8d 50 01             	lea    0x1(%eax),%edx
    2fa5:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa8:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    2fab:	8b 45 08             	mov    0x8(%ebp),%eax
    2fae:	8b 50 54             	mov    0x54(%eax),%edx
    2fb1:	8b 45 08             	mov    0x8(%ebp),%eax
    2fb4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2fb7:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    2fbb:	90                   	nop
    2fbc:	5d                   	pop    %ebp
    2fbd:	c3                   	ret    

00002fbe <popi>:

int popi(struct istack *s)
{
    2fbe:	55                   	push   %ebp
    2fbf:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2fc1:	8b 45 08             	mov    0x8(%ebp),%eax
    2fc4:	8b 00                	mov    (%eax),%eax
    2fc6:	85 c0                	test   %eax,%eax
    2fc8:	75 07                	jne    2fd1 <popi+0x13>
    {
        return -1;
    2fca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2fcf:	eb 2c                	jmp    2ffd <popi+0x3f>
    }
    s->size--;
    2fd1:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd4:	8b 00                	mov    (%eax),%eax
    2fd6:	8d 50 ff             	lea    -0x1(%eax),%edx
    2fd9:	8b 45 08             	mov    0x8(%ebp),%eax
    2fdc:	89 10                	mov    %edx,(%eax)
    s->top--;
    2fde:	8b 45 08             	mov    0x8(%ebp),%eax
    2fe1:	8b 40 54             	mov    0x54(%eax),%eax
    2fe4:	8d 50 ff             	lea    -0x1(%eax),%edx
    2fe7:	8b 45 08             	mov    0x8(%ebp),%eax
    2fea:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    2fed:	8b 45 08             	mov    0x8(%ebp),%eax
    2ff0:	8b 40 54             	mov    0x54(%eax),%eax
    2ff3:	8d 50 01             	lea    0x1(%eax),%edx
    2ff6:	8b 45 08             	mov    0x8(%ebp),%eax
    2ff9:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2ffd:	5d                   	pop    %ebp
    2ffe:	c3                   	ret    

00002fff <topi>:

int topi(struct istack* s)
{
    2fff:	55                   	push   %ebp
    3000:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3002:	8b 45 08             	mov    0x8(%ebp),%eax
    3005:	8b 50 54             	mov    0x54(%eax),%edx
    3008:	8b 45 08             	mov    0x8(%ebp),%eax
    300b:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    300f:	5d                   	pop    %ebp
    3010:	c3                   	ret    

00003011 <cstack>:

//constructor
struct cstack* cstack()
{
    3011:	55                   	push   %ebp
    3012:	89 e5                	mov    %esp,%ebp
    3014:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    3017:	83 ec 0c             	sub    $0xc,%esp
    301a:	6a 1c                	push   $0x1c
    301c:	e8 f3 d8 ff ff       	call   914 <malloc>
    3021:	83 c4 10             	add    $0x10,%esp
    3024:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3027:	8b 45 f4             	mov    -0xc(%ebp),%eax
    302a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3030:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3033:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    303a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    303d:	c9                   	leave  
    303e:	c3                   	ret    

0000303f <pushc>:

void pushc(struct cstack *s, char val)
{
    303f:	55                   	push   %ebp
    3040:	89 e5                	mov    %esp,%ebp
    3042:	83 ec 04             	sub    $0x4,%esp
    3045:	8b 45 0c             	mov    0xc(%ebp),%eax
    3048:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    304b:	8b 45 08             	mov    0x8(%ebp),%eax
    304e:	8b 00                	mov    (%eax),%eax
    3050:	83 f8 13             	cmp    $0x13,%eax
    3053:	7f 2d                	jg     3082 <pushc+0x43>
    {
        s->size++;
    3055:	8b 45 08             	mov    0x8(%ebp),%eax
    3058:	8b 00                	mov    (%eax),%eax
    305a:	8d 50 01             	lea    0x1(%eax),%edx
    305d:	8b 45 08             	mov    0x8(%ebp),%eax
    3060:	89 10                	mov    %edx,(%eax)
        s->top++;
    3062:	8b 45 08             	mov    0x8(%ebp),%eax
    3065:	8b 40 18             	mov    0x18(%eax),%eax
    3068:	8d 50 01             	lea    0x1(%eax),%edx
    306b:	8b 45 08             	mov    0x8(%ebp),%eax
    306e:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    3071:	8b 45 08             	mov    0x8(%ebp),%eax
    3074:	8b 40 18             	mov    0x18(%eax),%eax
    3077:	8b 55 08             	mov    0x8(%ebp),%edx
    307a:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    307e:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    3082:	90                   	nop
    3083:	c9                   	leave  
    3084:	c3                   	ret    

00003085 <popc>:

char popc(struct cstack *s)
{
    3085:	55                   	push   %ebp
    3086:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3088:	8b 45 08             	mov    0x8(%ebp),%eax
    308b:	8b 00                	mov    (%eax),%eax
    308d:	85 c0                	test   %eax,%eax
    308f:	75 07                	jne    3098 <popc+0x13>
    {
        return -1;
    3091:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3096:	eb 2d                	jmp    30c5 <popc+0x40>
    }
    s->size--;
    3098:	8b 45 08             	mov    0x8(%ebp),%eax
    309b:	8b 00                	mov    (%eax),%eax
    309d:	8d 50 ff             	lea    -0x1(%eax),%edx
    30a0:	8b 45 08             	mov    0x8(%ebp),%eax
    30a3:	89 10                	mov    %edx,(%eax)
    s->top--;
    30a5:	8b 45 08             	mov    0x8(%ebp),%eax
    30a8:	8b 40 18             	mov    0x18(%eax),%eax
    30ab:	8d 50 ff             	lea    -0x1(%eax),%edx
    30ae:	8b 45 08             	mov    0x8(%ebp),%eax
    30b1:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    30b4:	8b 45 08             	mov    0x8(%ebp),%eax
    30b7:	8b 40 18             	mov    0x18(%eax),%eax
    30ba:	8d 50 01             	lea    0x1(%eax),%edx
    30bd:	8b 45 08             	mov    0x8(%ebp),%eax
    30c0:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    30c5:	5d                   	pop    %ebp
    30c6:	c3                   	ret    

000030c7 <topc>:

char topc(struct cstack* s)
{
    30c7:	55                   	push   %ebp
    30c8:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    30ca:	8b 45 08             	mov    0x8(%ebp),%eax
    30cd:	8b 40 18             	mov    0x18(%eax),%eax
    30d0:	8b 55 08             	mov    0x8(%ebp),%edx
    30d3:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    30d8:	5d                   	pop    %ebp
    30d9:	c3                   	ret    

000030da <dstack>:

//constructor
struct dstack* dstack()
{
    30da:	55                   	push   %ebp
    30db:	89 e5                	mov    %esp,%ebp
    30dd:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    30e0:	83 ec 0c             	sub    $0xc,%esp
    30e3:	68 a8 00 00 00       	push   $0xa8
    30e8:	e8 27 d8 ff ff       	call   914 <malloc>
    30ed:	83 c4 10             	add    $0x10,%esp
    30f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    30f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30f6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    30fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30ff:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    3106:	ff ff ff 
    return stack;
    3109:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    310c:	c9                   	leave  
    310d:	c3                   	ret    

0000310e <pushd>:

void pushd(struct dstack *s, double val)
{
    310e:	55                   	push   %ebp
    310f:	89 e5                	mov    %esp,%ebp
    3111:	83 ec 08             	sub    $0x8,%esp
    3114:	8b 45 0c             	mov    0xc(%ebp),%eax
    3117:	89 45 f8             	mov    %eax,-0x8(%ebp)
    311a:	8b 45 10             	mov    0x10(%ebp),%eax
    311d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3120:	8b 45 08             	mov    0x8(%ebp),%eax
    3123:	8b 00                	mov    (%eax),%eax
    3125:	83 f8 13             	cmp    $0x13,%eax
    3128:	7f 35                	jg     315f <pushd+0x51>
    {
        s->size++;
    312a:	8b 45 08             	mov    0x8(%ebp),%eax
    312d:	8b 00                	mov    (%eax),%eax
    312f:	8d 50 01             	lea    0x1(%eax),%edx
    3132:	8b 45 08             	mov    0x8(%ebp),%eax
    3135:	89 10                	mov    %edx,(%eax)
        s->top++;
    3137:	8b 45 08             	mov    0x8(%ebp),%eax
    313a:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3140:	8d 50 01             	lea    0x1(%eax),%edx
    3143:	8b 45 08             	mov    0x8(%ebp),%eax
    3146:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    314c:	8b 45 08             	mov    0x8(%ebp),%eax
    314f:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3155:	8b 45 08             	mov    0x8(%ebp),%eax
    3158:	dd 45 f8             	fldl   -0x8(%ebp)
    315b:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    315f:	90                   	nop
    3160:	c9                   	leave  
    3161:	c3                   	ret    

00003162 <popd>:

double popd(struct dstack *s)
{
    3162:	55                   	push   %ebp
    3163:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3165:	8b 45 08             	mov    0x8(%ebp),%eax
    3168:	8b 00                	mov    (%eax),%eax
    316a:	85 c0                	test   %eax,%eax
    316c:	75 06                	jne    3174 <popd+0x12>
    {
        return -1;
    316e:	d9 e8                	fld1   
    3170:	d9 e0                	fchs   
    3172:	eb 35                	jmp    31a9 <popd+0x47>
    }
    s->size--;
    3174:	8b 45 08             	mov    0x8(%ebp),%eax
    3177:	8b 00                	mov    (%eax),%eax
    3179:	8d 50 ff             	lea    -0x1(%eax),%edx
    317c:	8b 45 08             	mov    0x8(%ebp),%eax
    317f:	89 10                	mov    %edx,(%eax)
    s->top--;
    3181:	8b 45 08             	mov    0x8(%ebp),%eax
    3184:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    318a:	8d 50 ff             	lea    -0x1(%eax),%edx
    318d:	8b 45 08             	mov    0x8(%ebp),%eax
    3190:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    3196:	8b 45 08             	mov    0x8(%ebp),%eax
    3199:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    319f:	8d 50 01             	lea    0x1(%eax),%edx
    31a2:	8b 45 08             	mov    0x8(%ebp),%eax
    31a5:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    31a9:	5d                   	pop    %ebp
    31aa:	c3                   	ret    

000031ab <topd>:

double topd(struct dstack* s)
{
    31ab:	55                   	push   %ebp
    31ac:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    31ae:	8b 45 08             	mov    0x8(%ebp),%eax
    31b1:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    31b7:	8b 45 08             	mov    0x8(%ebp),%eax
    31ba:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    31be:	5d                   	pop    %ebp
    31bf:	c3                   	ret    

000031c0 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    31c0:	55                   	push   %ebp
    31c1:	89 e5                	mov    %esp,%ebp
    31c3:	53                   	push   %ebx
    31c4:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    31ca:	83 ec 08             	sub    $0x8,%esp
    31cd:	6a 00                	push   $0x0
    31cf:	68 e8 39 00 00       	push   $0x39e8
    31d4:	e8 cd d1 ff ff       	call   3a6 <open>
    31d9:	83 c4 10             	add    $0x10,%esp
    31dc:	89 45 e8             	mov    %eax,-0x18(%ebp)
    31df:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    31e3:	79 1d                	jns    3202 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    31e5:	83 ec 0c             	sub    $0xc,%esp
    31e8:	68 f2 39 00 00       	push   $0x39f2
    31ed:	6a 00                	push   $0x0
    31ef:	6a 00                	push   $0x0
    31f1:	6a 01                	push   $0x1
    31f3:	6a 03                	push   $0x3
    31f5:	e8 40 fb ff ff       	call   2d3a <color_printf>
    31fa:	83 c4 20             	add    $0x20,%esp
    31fd:	e9 6d 02 00 00       	jmp    346f <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    3202:	8b 45 0c             	mov    0xc(%ebp),%eax
    3205:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    320b:	e9 2a 02 00 00       	jmp    343a <readVariables+0x27a>
  {
    int pos = 0;
    3210:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    3217:	00 00 00 
    while(pos <= n-1)
    321a:	e9 07 02 00 00       	jmp    3426 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    321f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    3226:	eb 24                	jmp    324c <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    3228:	8b 45 f4             	mov    -0xc(%ebp),%eax
    322b:	8d 50 ff             	lea    -0x1(%eax),%edx
    322e:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    3234:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3237:	01 c8                	add    %ecx,%eax
    3239:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3240:	ff 
    3241:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    3248:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    324c:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3252:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3255:	01 d0                	add    %edx,%eax
    3257:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    325e:	ff 
    325f:	3c 3d                	cmp    $0x3d,%al
    3261:	75 c5                	jne    3228 <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    3263:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3266:	83 e8 01             	sub    $0x1,%eax
    3269:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    3270:	00 
      if(buf[pos] == 'd') //double value
    3271:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3277:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    327e:	ff 
    327f:	3c 64                	cmp    $0x64,%al
    3281:	0f 85 a0 00 00 00    	jne    3327 <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    3287:	8b 45 0c             	mov    0xc(%ebp),%eax
    328a:	8b 00                	mov    (%eax),%eax
    328c:	c1 e0 05             	shl    $0x5,%eax
    328f:	89 c2                	mov    %eax,%edx
    3291:	8b 45 08             	mov    0x8(%ebp),%eax
    3294:	01 d0                	add    %edx,%eax
    3296:	8d 50 04             	lea    0x4(%eax),%edx
    3299:	83 ec 08             	sub    $0x8,%esp
    329c:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    32a2:	50                   	push   %eax
    32a3:	52                   	push   %edx
    32a4:	e8 8c ce ff ff       	call   135 <strcpy>
    32a9:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    32ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32af:	8d 50 01             	lea    0x1(%eax),%edx
    32b2:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32b8:	01 d0                	add    %edx,%eax
    32ba:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    32c0:	83 ec 08             	sub    $0x8,%esp
    32c3:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    32c9:	50                   	push   %eax
    32ca:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    32d0:	50                   	push   %eax
    32d1:	e8 7b d9 ff ff       	call   c51 <Translation>
    32d6:	83 c4 10             	add    $0x10,%esp
    32d9:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    32dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    32df:	8b 00                	mov    (%eax),%eax
    32e1:	c1 e0 05             	shl    $0x5,%eax
    32e4:	89 c2                	mov    %eax,%edx
    32e6:	8b 45 08             	mov    0x8(%ebp),%eax
    32e9:	01 d0                	add    %edx,%eax
    32eb:	dd 45 d8             	fldl   -0x28(%ebp)
    32ee:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    32f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    32f4:	8b 00                	mov    (%eax),%eax
    32f6:	c1 e0 05             	shl    $0x5,%eax
    32f9:	89 c2                	mov    %eax,%edx
    32fb:	8b 45 08             	mov    0x8(%ebp),%eax
    32fe:	01 d0                	add    %edx,%eax
    3300:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    3306:	8b 45 0c             	mov    0xc(%ebp),%eax
    3309:	8b 00                	mov    (%eax),%eax
    330b:	8d 50 01             	lea    0x1(%eax),%edx
    330e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3311:	89 10                	mov    %edx,(%eax)
        pos++;
    3313:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3319:	83 c0 01             	add    $0x1,%eax
    331c:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    3322:	e9 ff 00 00 00       	jmp    3426 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    3327:	8b 45 0c             	mov    0xc(%ebp),%eax
    332a:	8b 00                	mov    (%eax),%eax
    332c:	c1 e0 05             	shl    $0x5,%eax
    332f:	89 c2                	mov    %eax,%edx
    3331:	8b 45 08             	mov    0x8(%ebp),%eax
    3334:	01 d0                	add    %edx,%eax
    3336:	8d 50 04             	lea    0x4(%eax),%edx
    3339:	83 ec 08             	sub    $0x8,%esp
    333c:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3342:	50                   	push   %eax
    3343:	52                   	push   %edx
    3344:	e8 ec cd ff ff       	call   135 <strcpy>
    3349:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    334c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    334f:	8d 50 01             	lea    0x1(%eax),%edx
    3352:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3358:	01 d0                	add    %edx,%eax
    335a:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    3360:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3366:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    3369:	eb 04                	jmp    336f <readVariables+0x1af>
        {
          strend++;
    336b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    336f:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    3375:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3378:	01 d0                	add    %edx,%eax
    337a:	0f b6 00             	movzbl (%eax),%eax
    337d:	84 c0                	test   %al,%al
    337f:	75 ea                	jne    336b <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    3381:	8b 45 0c             	mov    0xc(%ebp),%eax
    3384:	8b 00                	mov    (%eax),%eax
    3386:	c1 e0 05             	shl    $0x5,%eax
    3389:	89 c2                	mov    %eax,%edx
    338b:	8b 45 08             	mov    0x8(%ebp),%eax
    338e:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    3391:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3397:	8b 55 f0             	mov    -0x10(%ebp),%edx
    339a:	29 c2                	sub    %eax,%edx
    339c:	89 d0                	mov    %edx,%eax
    339e:	83 c0 01             	add    $0x1,%eax
    33a1:	83 ec 0c             	sub    $0xc,%esp
    33a4:	50                   	push   %eax
    33a5:	e8 6a d5 ff ff       	call   914 <malloc>
    33aa:	83 c4 10             	add    $0x10,%esp
    33ad:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    33b0:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    33b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    33b9:	eb 35                	jmp    33f0 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    33bb:	8b 45 0c             	mov    0xc(%ebp),%eax
    33be:	8b 00                	mov    (%eax),%eax
    33c0:	c1 e0 05             	shl    $0x5,%eax
    33c3:	89 c2                	mov    %eax,%edx
    33c5:	8b 45 08             	mov    0x8(%ebp),%eax
    33c8:	01 d0                	add    %edx,%eax
    33ca:	8b 40 18             	mov    0x18(%eax),%eax
    33cd:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    33d3:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    33d6:	29 d1                	sub    %edx,%ecx
    33d8:	89 ca                	mov    %ecx,%edx
    33da:	01 c2                	add    %eax,%edx
    33dc:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    33e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33e5:	01 c8                	add    %ecx,%eax
    33e7:	0f b6 00             	movzbl (%eax),%eax
    33ea:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    33ec:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    33f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33f3:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    33f6:	7e c3                	jle    33bb <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    33f8:	8b 45 0c             	mov    0xc(%ebp),%eax
    33fb:	8b 00                	mov    (%eax),%eax
    33fd:	c1 e0 05             	shl    $0x5,%eax
    3400:	89 c2                	mov    %eax,%edx
    3402:	8b 45 08             	mov    0x8(%ebp),%eax
    3405:	01 d0                	add    %edx,%eax
    3407:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    340d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3410:	8b 00                	mov    (%eax),%eax
    3412:	8d 50 01             	lea    0x1(%eax),%edx
    3415:	8b 45 0c             	mov    0xc(%ebp),%eax
    3418:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    341a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    341d:	83 c0 01             	add    $0x1,%eax
    3420:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    3426:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3429:	8d 50 ff             	lea    -0x1(%eax),%edx
    342c:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3432:	39 c2                	cmp    %eax,%edx
    3434:	0f 8d e5 fd ff ff    	jge    321f <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    343a:	83 ec 04             	sub    $0x4,%esp
    343d:	68 e8 03 00 00       	push   $0x3e8
    3442:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3448:	50                   	push   %eax
    3449:	ff 75 e8             	pushl  -0x18(%ebp)
    344c:	e8 2d cf ff ff       	call   37e <read>
    3451:	83 c4 10             	add    $0x10,%esp
    3454:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3457:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    345b:	0f 8f af fd ff ff    	jg     3210 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    3461:	83 ec 0c             	sub    $0xc,%esp
    3464:	ff 75 e8             	pushl  -0x18(%ebp)
    3467:	e8 22 cf ff ff       	call   38e <close>
    346c:	83 c4 10             	add    $0x10,%esp
}
    346f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3472:	c9                   	leave  
    3473:	c3                   	ret    

00003474 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3474:	55                   	push   %ebp
    3475:	89 e5                	mov    %esp,%ebp
    3477:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    347d:	83 ec 08             	sub    $0x8,%esp
    3480:	6a 02                	push   $0x2
    3482:	68 e8 39 00 00       	push   $0x39e8
    3487:	e8 1a cf ff ff       	call   3a6 <open>
    348c:	83 c4 10             	add    $0x10,%esp
    348f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3492:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3496:	78 1e                	js     34b6 <writeVariables+0x42>
  {
    close(fd);
    3498:	83 ec 0c             	sub    $0xc,%esp
    349b:	ff 75 e4             	pushl  -0x1c(%ebp)
    349e:	e8 eb ce ff ff       	call   38e <close>
    34a3:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    34a6:	83 ec 0c             	sub    $0xc,%esp
    34a9:	68 e8 39 00 00       	push   $0x39e8
    34ae:	e8 03 cf ff ff       	call   3b6 <unlink>
    34b3:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    34b6:	83 ec 08             	sub    $0x8,%esp
    34b9:	68 02 02 00 00       	push   $0x202
    34be:	68 e8 39 00 00       	push   $0x39e8
    34c3:	e8 de ce ff ff       	call   3a6 <open>
    34c8:	83 c4 10             	add    $0x10,%esp
    34cb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    34ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    34d5:	e9 ff 01 00 00       	jmp    36d9 <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    34da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34dd:	c1 e0 05             	shl    $0x5,%eax
    34e0:	89 c2                	mov    %eax,%edx
    34e2:	8b 45 08             	mov    0x8(%ebp),%eax
    34e5:	01 d0                	add    %edx,%eax
    34e7:	8b 00                	mov    (%eax),%eax
    34e9:	83 f8 01             	cmp    $0x1,%eax
    34ec:	0f 85 d3 00 00 00    	jne    35c5 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    34f2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    34f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34fc:	8d 50 01             	lea    0x1(%eax),%edx
    34ff:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3502:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    3509:	64 
      int k=0;
    350a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    3511:	eb 2c                	jmp    353f <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    3513:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3516:	8d 50 01             	lea    0x1(%eax),%edx
    3519:	89 55 e0             	mov    %edx,-0x20(%ebp)
    351c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    351f:	89 d1                	mov    %edx,%ecx
    3521:	c1 e1 05             	shl    $0x5,%ecx
    3524:	8b 55 08             	mov    0x8(%ebp),%edx
    3527:	01 d1                	add    %edx,%ecx
    3529:	8b 55 f0             	mov    -0x10(%ebp),%edx
    352c:	01 ca                	add    %ecx,%edx
    352e:	83 c2 04             	add    $0x4,%edx
    3531:	0f b6 12             	movzbl (%edx),%edx
    3534:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    353b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    353f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3542:	c1 e0 05             	shl    $0x5,%eax
    3545:	89 c2                	mov    %eax,%edx
    3547:	8b 45 08             	mov    0x8(%ebp),%eax
    354a:	01 c2                	add    %eax,%edx
    354c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    354f:	01 d0                	add    %edx,%eax
    3551:	83 c0 04             	add    $0x4,%eax
    3554:	0f b6 00             	movzbl (%eax),%eax
    3557:	84 c0                	test   %al,%al
    3559:	75 b8                	jne    3513 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    355b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    355e:	8d 50 01             	lea    0x1(%eax),%edx
    3561:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3564:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    356b:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    356c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    356f:	c1 e0 05             	shl    $0x5,%eax
    3572:	89 c2                	mov    %eax,%edx
    3574:	8b 45 08             	mov    0x8(%ebp),%eax
    3577:	01 d0                	add    %edx,%eax
    3579:	dd 40 18             	fldl   0x18(%eax)
    357c:	8d 45 e0             	lea    -0x20(%ebp),%eax
    357f:	50                   	push   %eax
    3580:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3584:	dd 1c 24             	fstpl  (%esp)
    3587:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    358d:	50                   	push   %eax
    358e:	e8 7d d5 ff ff       	call   b10 <double2str>
    3593:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    3596:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3599:	8d 50 01             	lea    0x1(%eax),%edx
    359c:	89 55 e0             	mov    %edx,-0x20(%ebp)
    359f:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    35a6:	00 
      write(fd,buf,pos);
    35a7:	8b 45 e0             	mov    -0x20(%ebp),%eax
    35aa:	83 ec 04             	sub    $0x4,%esp
    35ad:	50                   	push   %eax
    35ae:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    35b4:	50                   	push   %eax
    35b5:	ff 75 e4             	pushl  -0x1c(%ebp)
    35b8:	e8 c9 cd ff ff       	call   386 <write>
    35bd:	83 c4 10             	add    $0x10,%esp
    35c0:	e9 10 01 00 00       	jmp    36d5 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    35c5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    35cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35cf:	8d 50 01             	lea    0x1(%eax),%edx
    35d2:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35d5:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    35dc:	73 
      int k=0;
    35dd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    35e4:	eb 2c                	jmp    3612 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    35e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35e9:	8d 50 01             	lea    0x1(%eax),%edx
    35ec:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
    35f2:	89 d1                	mov    %edx,%ecx
    35f4:	c1 e1 05             	shl    $0x5,%ecx
    35f7:	8b 55 08             	mov    0x8(%ebp),%edx
    35fa:	01 d1                	add    %edx,%ecx
    35fc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    35ff:	01 ca                	add    %ecx,%edx
    3601:	83 c2 04             	add    $0x4,%edx
    3604:	0f b6 12             	movzbl (%edx),%edx
    3607:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    360e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    3612:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3615:	c1 e0 05             	shl    $0x5,%eax
    3618:	89 c2                	mov    %eax,%edx
    361a:	8b 45 08             	mov    0x8(%ebp),%eax
    361d:	01 c2                	add    %eax,%edx
    361f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3622:	01 d0                	add    %edx,%eax
    3624:	83 c0 04             	add    $0x4,%eax
    3627:	0f b6 00             	movzbl (%eax),%eax
    362a:	84 c0                	test   %al,%al
    362c:	75 b8                	jne    35e6 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    362e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3631:	8d 50 01             	lea    0x1(%eax),%edx
    3634:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3637:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    363e:	3d 
      k=0;
    363f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    3646:	eb 2c                	jmp    3674 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    3648:	8b 45 ec             	mov    -0x14(%ebp),%eax
    364b:	8d 50 01             	lea    0x1(%eax),%edx
    364e:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3651:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3654:	89 d1                	mov    %edx,%ecx
    3656:	c1 e1 05             	shl    $0x5,%ecx
    3659:	8b 55 08             	mov    0x8(%ebp),%edx
    365c:	01 ca                	add    %ecx,%edx
    365e:	8b 4a 18             	mov    0x18(%edx),%ecx
    3661:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3664:	01 ca                	add    %ecx,%edx
    3666:	0f b6 12             	movzbl (%edx),%edx
    3669:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3670:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    3674:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3677:	c1 e0 05             	shl    $0x5,%eax
    367a:	89 c2                	mov    %eax,%edx
    367c:	8b 45 08             	mov    0x8(%ebp),%eax
    367f:	01 d0                	add    %edx,%eax
    3681:	8b 50 18             	mov    0x18(%eax),%edx
    3684:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3687:	01 d0                	add    %edx,%eax
    3689:	0f b6 00             	movzbl (%eax),%eax
    368c:	84 c0                	test   %al,%al
    368e:	75 b8                	jne    3648 <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    3690:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3693:	8d 50 01             	lea    0x1(%eax),%edx
    3696:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3699:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    36a0:	00 
      write(fd,buf,pos);
    36a1:	83 ec 04             	sub    $0x4,%esp
    36a4:	ff 75 ec             	pushl  -0x14(%ebp)
    36a7:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    36ad:	50                   	push   %eax
    36ae:	ff 75 e4             	pushl  -0x1c(%ebp)
    36b1:	e8 d0 cc ff ff       	call   386 <write>
    36b6:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    36b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36bc:	c1 e0 05             	shl    $0x5,%eax
    36bf:	89 c2                	mov    %eax,%edx
    36c1:	8b 45 08             	mov    0x8(%ebp),%eax
    36c4:	01 d0                	add    %edx,%eax
    36c6:	8b 40 18             	mov    0x18(%eax),%eax
    36c9:	83 ec 0c             	sub    $0xc,%esp
    36cc:	50                   	push   %eax
    36cd:	e8 00 d1 ff ff       	call   7d2 <free>
    36d2:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    36d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    36d9:	8b 45 0c             	mov    0xc(%ebp),%eax
    36dc:	8b 00                	mov    (%eax),%eax
    36de:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    36e1:	0f 8f f3 fd ff ff    	jg     34da <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    36e7:	8b 45 0c             	mov    0xc(%ebp),%eax
    36ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    36f0:	83 ec 0c             	sub    $0xc,%esp
    36f3:	ff 75 e4             	pushl  -0x1c(%ebp)
    36f6:	e8 93 cc ff ff       	call   38e <close>
    36fb:	83 c4 10             	add    $0x10,%esp
  return;
    36fe:	90                   	nop
    36ff:	c9                   	leave  
    3700:	c3                   	ret    
