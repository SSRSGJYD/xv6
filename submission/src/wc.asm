
_wc：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 28             	sub    $0x28,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
       6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
       d:	8b 45 e8             	mov    -0x18(%ebp),%eax
      10:	89 45 ec             	mov    %eax,-0x14(%ebp)
      13:	8b 45 ec             	mov    -0x14(%ebp),%eax
      16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
      19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
      20:	eb 69                	jmp    8b <wc+0x8b>
    for(i=0; i<n; i++){
      22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      29:	eb 58                	jmp    83 <wc+0x83>
      c++;
      2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
      2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
      32:	05 80 45 00 00       	add    $0x4580,%eax
      37:	0f b6 00             	movzbl (%eax),%eax
      3a:	3c 0a                	cmp    $0xa,%al
      3c:	75 04                	jne    42 <wc+0x42>
        l++;
      3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
      42:	8b 45 f4             	mov    -0xc(%ebp),%eax
      45:	05 80 45 00 00       	add    $0x4580,%eax
      4a:	0f b6 00             	movzbl (%eax),%eax
      4d:	0f be c0             	movsbl %al,%eax
      50:	83 ec 08             	sub    $0x8,%esp
      53:	50                   	push   %eax
      54:	68 b0 37 00 00       	push   $0x37b0
      59:	e8 35 02 00 00       	call   293 <strchr>
      5e:	83 c4 10             	add    $0x10,%esp
      61:	85 c0                	test   %eax,%eax
      63:	74 09                	je     6e <wc+0x6e>
        inword = 0;
      65:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      6c:	eb 11                	jmp    7f <wc+0x7f>
      else if(!inword){
      6e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
      72:	75 0b                	jne    7f <wc+0x7f>
        w++;
      74:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
      78:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      7f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      83:	8b 45 f4             	mov    -0xc(%ebp),%eax
      86:	3b 45 e0             	cmp    -0x20(%ebp),%eax
      89:	7c a0                	jl     2b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
      8b:	83 ec 04             	sub    $0x4,%esp
      8e:	68 00 02 00 00       	push   $0x200
      93:	68 80 45 00 00       	push   $0x4580
      98:	ff 75 08             	pushl  0x8(%ebp)
      9b:	e8 8c 03 00 00       	call   42c <read>
      a0:	83 c4 10             	add    $0x10,%esp
      a3:	89 45 e0             	mov    %eax,-0x20(%ebp)
      a6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
      aa:	0f 8f 72 ff ff ff    	jg     22 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
      b0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
      b4:	79 17                	jns    cd <wc+0xcd>
    printf(1, "wc: read error\n");
      b6:	83 ec 08             	sub    $0x8,%esp
      b9:	68 b6 37 00 00       	push   $0x37b6
      be:	6a 01                	push   $0x1
      c0:	e8 fb 05 00 00       	call   6c0 <printf>
      c5:	83 c4 10             	add    $0x10,%esp
    exit();
      c8:	e8 47 03 00 00       	call   414 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
      cd:	83 ec 08             	sub    $0x8,%esp
      d0:	ff 75 0c             	pushl  0xc(%ebp)
      d3:	ff 75 e8             	pushl  -0x18(%ebp)
      d6:	ff 75 ec             	pushl  -0x14(%ebp)
      d9:	ff 75 f0             	pushl  -0x10(%ebp)
      dc:	68 c6 37 00 00       	push   $0x37c6
      e1:	6a 01                	push   $0x1
      e3:	e8 d8 05 00 00       	call   6c0 <printf>
      e8:	83 c4 20             	add    $0x20,%esp
}
      eb:	90                   	nop
      ec:	c9                   	leave  
      ed:	c3                   	ret    

000000ee <main>:

int
main(int argc, char *argv[])
{
      ee:	8d 4c 24 04          	lea    0x4(%esp),%ecx
      f2:	83 e4 f0             	and    $0xfffffff0,%esp
      f5:	ff 71 fc             	pushl  -0x4(%ecx)
      f8:	55                   	push   %ebp
      f9:	89 e5                	mov    %esp,%ebp
      fb:	53                   	push   %ebx
      fc:	51                   	push   %ecx
      fd:	83 ec 10             	sub    $0x10,%esp
     100:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
     102:	83 3b 01             	cmpl   $0x1,(%ebx)
     105:	7f 17                	jg     11e <main+0x30>
    wc(0, "");
     107:	83 ec 08             	sub    $0x8,%esp
     10a:	68 d3 37 00 00       	push   $0x37d3
     10f:	6a 00                	push   $0x0
     111:	e8 ea fe ff ff       	call   0 <wc>
     116:	83 c4 10             	add    $0x10,%esp
    exit();
     119:	e8 f6 02 00 00       	call   414 <exit>
  }

  for(i = 1; i < argc; i++){
     11e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
     125:	e9 83 00 00 00       	jmp    1ad <main+0xbf>
    if((fd = open(argv[i], 0)) < 0){
     12a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     12d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     134:	8b 43 04             	mov    0x4(%ebx),%eax
     137:	01 d0                	add    %edx,%eax
     139:	8b 00                	mov    (%eax),%eax
     13b:	83 ec 08             	sub    $0x8,%esp
     13e:	6a 00                	push   $0x0
     140:	50                   	push   %eax
     141:	e8 0e 03 00 00       	call   454 <open>
     146:	83 c4 10             	add    $0x10,%esp
     149:	89 45 f0             	mov    %eax,-0x10(%ebp)
     14c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     150:	79 29                	jns    17b <main+0x8d>
      printf(1, "wc: cannot open %s\n", argv[i]);
     152:	8b 45 f4             	mov    -0xc(%ebp),%eax
     155:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     15c:	8b 43 04             	mov    0x4(%ebx),%eax
     15f:	01 d0                	add    %edx,%eax
     161:	8b 00                	mov    (%eax),%eax
     163:	83 ec 04             	sub    $0x4,%esp
     166:	50                   	push   %eax
     167:	68 d4 37 00 00       	push   $0x37d4
     16c:	6a 01                	push   $0x1
     16e:	e8 4d 05 00 00       	call   6c0 <printf>
     173:	83 c4 10             	add    $0x10,%esp
      exit();
     176:	e8 99 02 00 00       	call   414 <exit>
    }
    wc(fd, argv[i]);
     17b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     17e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     185:	8b 43 04             	mov    0x4(%ebx),%eax
     188:	01 d0                	add    %edx,%eax
     18a:	8b 00                	mov    (%eax),%eax
     18c:	83 ec 08             	sub    $0x8,%esp
     18f:	50                   	push   %eax
     190:	ff 75 f0             	pushl  -0x10(%ebp)
     193:	e8 68 fe ff ff       	call   0 <wc>
     198:	83 c4 10             	add    $0x10,%esp
    close(fd);
     19b:	83 ec 0c             	sub    $0xc,%esp
     19e:	ff 75 f0             	pushl  -0x10(%ebp)
     1a1:	e8 96 02 00 00       	call   43c <close>
     1a6:	83 c4 10             	add    $0x10,%esp
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
     1a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     1ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1b0:	3b 03                	cmp    (%ebx),%eax
     1b2:	0f 8c 72 ff ff ff    	jl     12a <main+0x3c>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
     1b8:	e8 57 02 00 00       	call   414 <exit>

000001bd <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     1bd:	55                   	push   %ebp
     1be:	89 e5                	mov    %esp,%ebp
     1c0:	57                   	push   %edi
     1c1:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     1c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
     1c5:	8b 55 10             	mov    0x10(%ebp),%edx
     1c8:	8b 45 0c             	mov    0xc(%ebp),%eax
     1cb:	89 cb                	mov    %ecx,%ebx
     1cd:	89 df                	mov    %ebx,%edi
     1cf:	89 d1                	mov    %edx,%ecx
     1d1:	fc                   	cld    
     1d2:	f3 aa                	rep stos %al,%es:(%edi)
     1d4:	89 ca                	mov    %ecx,%edx
     1d6:	89 fb                	mov    %edi,%ebx
     1d8:	89 5d 08             	mov    %ebx,0x8(%ebp)
     1db:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     1de:	90                   	nop
     1df:	5b                   	pop    %ebx
     1e0:	5f                   	pop    %edi
     1e1:	5d                   	pop    %ebp
     1e2:	c3                   	ret    

000001e3 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     1e3:	55                   	push   %ebp
     1e4:	89 e5                	mov    %esp,%ebp
     1e6:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     1e9:	8b 45 08             	mov    0x8(%ebp),%eax
     1ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     1ef:	90                   	nop
     1f0:	8b 45 08             	mov    0x8(%ebp),%eax
     1f3:	8d 50 01             	lea    0x1(%eax),%edx
     1f6:	89 55 08             	mov    %edx,0x8(%ebp)
     1f9:	8b 55 0c             	mov    0xc(%ebp),%edx
     1fc:	8d 4a 01             	lea    0x1(%edx),%ecx
     1ff:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     202:	0f b6 12             	movzbl (%edx),%edx
     205:	88 10                	mov    %dl,(%eax)
     207:	0f b6 00             	movzbl (%eax),%eax
     20a:	84 c0                	test   %al,%al
     20c:	75 e2                	jne    1f0 <strcpy+0xd>
    ;
  return os;
     20e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     211:	c9                   	leave  
     212:	c3                   	ret    

00000213 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     213:	55                   	push   %ebp
     214:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     216:	eb 08                	jmp    220 <strcmp+0xd>
    p++, q++;
     218:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     21c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     220:	8b 45 08             	mov    0x8(%ebp),%eax
     223:	0f b6 00             	movzbl (%eax),%eax
     226:	84 c0                	test   %al,%al
     228:	74 10                	je     23a <strcmp+0x27>
     22a:	8b 45 08             	mov    0x8(%ebp),%eax
     22d:	0f b6 10             	movzbl (%eax),%edx
     230:	8b 45 0c             	mov    0xc(%ebp),%eax
     233:	0f b6 00             	movzbl (%eax),%eax
     236:	38 c2                	cmp    %al,%dl
     238:	74 de                	je     218 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     23a:	8b 45 08             	mov    0x8(%ebp),%eax
     23d:	0f b6 00             	movzbl (%eax),%eax
     240:	0f b6 d0             	movzbl %al,%edx
     243:	8b 45 0c             	mov    0xc(%ebp),%eax
     246:	0f b6 00             	movzbl (%eax),%eax
     249:	0f b6 c0             	movzbl %al,%eax
     24c:	29 c2                	sub    %eax,%edx
     24e:	89 d0                	mov    %edx,%eax
}
     250:	5d                   	pop    %ebp
     251:	c3                   	ret    

00000252 <strlen>:

uint
strlen(char *s)
{
     252:	55                   	push   %ebp
     253:	89 e5                	mov    %esp,%ebp
     255:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     258:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     25f:	eb 04                	jmp    265 <strlen+0x13>
     261:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     265:	8b 55 fc             	mov    -0x4(%ebp),%edx
     268:	8b 45 08             	mov    0x8(%ebp),%eax
     26b:	01 d0                	add    %edx,%eax
     26d:	0f b6 00             	movzbl (%eax),%eax
     270:	84 c0                	test   %al,%al
     272:	75 ed                	jne    261 <strlen+0xf>
    ;
  return n;
     274:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     277:	c9                   	leave  
     278:	c3                   	ret    

00000279 <memset>:

void*
memset(void *dst, int c, uint n)
{
     279:	55                   	push   %ebp
     27a:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     27c:	8b 45 10             	mov    0x10(%ebp),%eax
     27f:	50                   	push   %eax
     280:	ff 75 0c             	pushl  0xc(%ebp)
     283:	ff 75 08             	pushl  0x8(%ebp)
     286:	e8 32 ff ff ff       	call   1bd <stosb>
     28b:	83 c4 0c             	add    $0xc,%esp
  return dst;
     28e:	8b 45 08             	mov    0x8(%ebp),%eax
}
     291:	c9                   	leave  
     292:	c3                   	ret    

00000293 <strchr>:

char*
strchr(const char *s, char c)
{
     293:	55                   	push   %ebp
     294:	89 e5                	mov    %esp,%ebp
     296:	83 ec 04             	sub    $0x4,%esp
     299:	8b 45 0c             	mov    0xc(%ebp),%eax
     29c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     29f:	eb 14                	jmp    2b5 <strchr+0x22>
    if(*s == c)
     2a1:	8b 45 08             	mov    0x8(%ebp),%eax
     2a4:	0f b6 00             	movzbl (%eax),%eax
     2a7:	3a 45 fc             	cmp    -0x4(%ebp),%al
     2aa:	75 05                	jne    2b1 <strchr+0x1e>
      return (char*)s;
     2ac:	8b 45 08             	mov    0x8(%ebp),%eax
     2af:	eb 13                	jmp    2c4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     2b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     2b5:	8b 45 08             	mov    0x8(%ebp),%eax
     2b8:	0f b6 00             	movzbl (%eax),%eax
     2bb:	84 c0                	test   %al,%al
     2bd:	75 e2                	jne    2a1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     2bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
     2c4:	c9                   	leave  
     2c5:	c3                   	ret    

000002c6 <gets>:

char*
gets(char *buf, int max)
{
     2c6:	55                   	push   %ebp
     2c7:	89 e5                	mov    %esp,%ebp
     2c9:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     2d3:	eb 42                	jmp    317 <gets+0x51>
    cc = read(0, &c, 1);
     2d5:	83 ec 04             	sub    $0x4,%esp
     2d8:	6a 01                	push   $0x1
     2da:	8d 45 ef             	lea    -0x11(%ebp),%eax
     2dd:	50                   	push   %eax
     2de:	6a 00                	push   $0x0
     2e0:	e8 47 01 00 00       	call   42c <read>
     2e5:	83 c4 10             	add    $0x10,%esp
     2e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     2eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     2ef:	7e 33                	jle    324 <gets+0x5e>
      break;
    buf[i++] = c;
     2f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     2f4:	8d 50 01             	lea    0x1(%eax),%edx
     2f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
     2fa:	89 c2                	mov    %eax,%edx
     2fc:	8b 45 08             	mov    0x8(%ebp),%eax
     2ff:	01 c2                	add    %eax,%edx
     301:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     305:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     307:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     30b:	3c 0a                	cmp    $0xa,%al
     30d:	74 16                	je     325 <gets+0x5f>
     30f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     313:	3c 0d                	cmp    $0xd,%al
     315:	74 0e                	je     325 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     317:	8b 45 f4             	mov    -0xc(%ebp),%eax
     31a:	83 c0 01             	add    $0x1,%eax
     31d:	3b 45 0c             	cmp    0xc(%ebp),%eax
     320:	7c b3                	jl     2d5 <gets+0xf>
     322:	eb 01                	jmp    325 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     324:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     325:	8b 55 f4             	mov    -0xc(%ebp),%edx
     328:	8b 45 08             	mov    0x8(%ebp),%eax
     32b:	01 d0                	add    %edx,%eax
     32d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     330:	8b 45 08             	mov    0x8(%ebp),%eax
}
     333:	c9                   	leave  
     334:	c3                   	ret    

00000335 <stat>:

int
stat(char *n, struct stat *st)
{
     335:	55                   	push   %ebp
     336:	89 e5                	mov    %esp,%ebp
     338:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     33b:	83 ec 08             	sub    $0x8,%esp
     33e:	6a 00                	push   $0x0
     340:	ff 75 08             	pushl  0x8(%ebp)
     343:	e8 0c 01 00 00       	call   454 <open>
     348:	83 c4 10             	add    $0x10,%esp
     34b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     34e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     352:	79 07                	jns    35b <stat+0x26>
    return -1;
     354:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     359:	eb 25                	jmp    380 <stat+0x4b>
  r = fstat(fd, st);
     35b:	83 ec 08             	sub    $0x8,%esp
     35e:	ff 75 0c             	pushl  0xc(%ebp)
     361:	ff 75 f4             	pushl  -0xc(%ebp)
     364:	e8 03 01 00 00       	call   46c <fstat>
     369:	83 c4 10             	add    $0x10,%esp
     36c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     36f:	83 ec 0c             	sub    $0xc,%esp
     372:	ff 75 f4             	pushl  -0xc(%ebp)
     375:	e8 c2 00 00 00       	call   43c <close>
     37a:	83 c4 10             	add    $0x10,%esp
  return r;
     37d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     380:	c9                   	leave  
     381:	c3                   	ret    

00000382 <atoi>:

int
atoi(const char *s)
{
     382:	55                   	push   %ebp
     383:	89 e5                	mov    %esp,%ebp
     385:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     388:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     38f:	eb 25                	jmp    3b6 <atoi+0x34>
    n = n*10 + *s++ - '0';
     391:	8b 55 fc             	mov    -0x4(%ebp),%edx
     394:	89 d0                	mov    %edx,%eax
     396:	c1 e0 02             	shl    $0x2,%eax
     399:	01 d0                	add    %edx,%eax
     39b:	01 c0                	add    %eax,%eax
     39d:	89 c1                	mov    %eax,%ecx
     39f:	8b 45 08             	mov    0x8(%ebp),%eax
     3a2:	8d 50 01             	lea    0x1(%eax),%edx
     3a5:	89 55 08             	mov    %edx,0x8(%ebp)
     3a8:	0f b6 00             	movzbl (%eax),%eax
     3ab:	0f be c0             	movsbl %al,%eax
     3ae:	01 c8                	add    %ecx,%eax
     3b0:	83 e8 30             	sub    $0x30,%eax
     3b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     3b6:	8b 45 08             	mov    0x8(%ebp),%eax
     3b9:	0f b6 00             	movzbl (%eax),%eax
     3bc:	3c 2f                	cmp    $0x2f,%al
     3be:	7e 0a                	jle    3ca <atoi+0x48>
     3c0:	8b 45 08             	mov    0x8(%ebp),%eax
     3c3:	0f b6 00             	movzbl (%eax),%eax
     3c6:	3c 39                	cmp    $0x39,%al
     3c8:	7e c7                	jle    391 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     3ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     3cd:	c9                   	leave  
     3ce:	c3                   	ret    

000003cf <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     3cf:	55                   	push   %ebp
     3d0:	89 e5                	mov    %esp,%ebp
     3d2:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     3d5:	8b 45 08             	mov    0x8(%ebp),%eax
     3d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     3db:	8b 45 0c             	mov    0xc(%ebp),%eax
     3de:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     3e1:	eb 17                	jmp    3fa <memmove+0x2b>
    *dst++ = *src++;
     3e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
     3e6:	8d 50 01             	lea    0x1(%eax),%edx
     3e9:	89 55 fc             	mov    %edx,-0x4(%ebp)
     3ec:	8b 55 f8             	mov    -0x8(%ebp),%edx
     3ef:	8d 4a 01             	lea    0x1(%edx),%ecx
     3f2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     3f5:	0f b6 12             	movzbl (%edx),%edx
     3f8:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     3fa:	8b 45 10             	mov    0x10(%ebp),%eax
     3fd:	8d 50 ff             	lea    -0x1(%eax),%edx
     400:	89 55 10             	mov    %edx,0x10(%ebp)
     403:	85 c0                	test   %eax,%eax
     405:	7f dc                	jg     3e3 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     407:	8b 45 08             	mov    0x8(%ebp),%eax
}
     40a:	c9                   	leave  
     40b:	c3                   	ret    

0000040c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     40c:	b8 01 00 00 00       	mov    $0x1,%eax
     411:	cd 40                	int    $0x40
     413:	c3                   	ret    

00000414 <exit>:
SYSCALL(exit)
     414:	b8 02 00 00 00       	mov    $0x2,%eax
     419:	cd 40                	int    $0x40
     41b:	c3                   	ret    

0000041c <wait>:
SYSCALL(wait)
     41c:	b8 03 00 00 00       	mov    $0x3,%eax
     421:	cd 40                	int    $0x40
     423:	c3                   	ret    

00000424 <pipe>:
SYSCALL(pipe)
     424:	b8 04 00 00 00       	mov    $0x4,%eax
     429:	cd 40                	int    $0x40
     42b:	c3                   	ret    

0000042c <read>:
SYSCALL(read)
     42c:	b8 05 00 00 00       	mov    $0x5,%eax
     431:	cd 40                	int    $0x40
     433:	c3                   	ret    

00000434 <write>:
SYSCALL(write)
     434:	b8 10 00 00 00       	mov    $0x10,%eax
     439:	cd 40                	int    $0x40
     43b:	c3                   	ret    

0000043c <close>:
SYSCALL(close)
     43c:	b8 15 00 00 00       	mov    $0x15,%eax
     441:	cd 40                	int    $0x40
     443:	c3                   	ret    

00000444 <kill>:
SYSCALL(kill)
     444:	b8 06 00 00 00       	mov    $0x6,%eax
     449:	cd 40                	int    $0x40
     44b:	c3                   	ret    

0000044c <exec>:
SYSCALL(exec)
     44c:	b8 07 00 00 00       	mov    $0x7,%eax
     451:	cd 40                	int    $0x40
     453:	c3                   	ret    

00000454 <open>:
SYSCALL(open)
     454:	b8 0f 00 00 00       	mov    $0xf,%eax
     459:	cd 40                	int    $0x40
     45b:	c3                   	ret    

0000045c <mknod>:
SYSCALL(mknod)
     45c:	b8 11 00 00 00       	mov    $0x11,%eax
     461:	cd 40                	int    $0x40
     463:	c3                   	ret    

00000464 <unlink>:
SYSCALL(unlink)
     464:	b8 12 00 00 00       	mov    $0x12,%eax
     469:	cd 40                	int    $0x40
     46b:	c3                   	ret    

0000046c <fstat>:
SYSCALL(fstat)
     46c:	b8 08 00 00 00       	mov    $0x8,%eax
     471:	cd 40                	int    $0x40
     473:	c3                   	ret    

00000474 <link>:
SYSCALL(link)
     474:	b8 13 00 00 00       	mov    $0x13,%eax
     479:	cd 40                	int    $0x40
     47b:	c3                   	ret    

0000047c <mkdir>:
SYSCALL(mkdir)
     47c:	b8 14 00 00 00       	mov    $0x14,%eax
     481:	cd 40                	int    $0x40
     483:	c3                   	ret    

00000484 <chdir>:
SYSCALL(chdir)
     484:	b8 09 00 00 00       	mov    $0x9,%eax
     489:	cd 40                	int    $0x40
     48b:	c3                   	ret    

0000048c <dup>:
SYSCALL(dup)
     48c:	b8 0a 00 00 00       	mov    $0xa,%eax
     491:	cd 40                	int    $0x40
     493:	c3                   	ret    

00000494 <getpid>:
SYSCALL(getpid)
     494:	b8 0b 00 00 00       	mov    $0xb,%eax
     499:	cd 40                	int    $0x40
     49b:	c3                   	ret    

0000049c <sbrk>:
SYSCALL(sbrk)
     49c:	b8 0c 00 00 00       	mov    $0xc,%eax
     4a1:	cd 40                	int    $0x40
     4a3:	c3                   	ret    

000004a4 <sleep>:
SYSCALL(sleep)
     4a4:	b8 0d 00 00 00       	mov    $0xd,%eax
     4a9:	cd 40                	int    $0x40
     4ab:	c3                   	ret    

000004ac <uptime>:
SYSCALL(uptime)
     4ac:	b8 0e 00 00 00       	mov    $0xe,%eax
     4b1:	cd 40                	int    $0x40
     4b3:	c3                   	ret    

000004b4 <colorwrite>:

//new here
SYSCALL(colorwrite)
     4b4:	b8 16 00 00 00       	mov    $0x16,%eax
     4b9:	cd 40                	int    $0x40
     4bb:	c3                   	ret    

000004bc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     4bc:	55                   	push   %ebp
     4bd:	89 e5                	mov    %esp,%ebp
     4bf:	83 ec 18             	sub    $0x18,%esp
     4c2:	8b 45 0c             	mov    0xc(%ebp),%eax
     4c5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     4c8:	83 ec 04             	sub    $0x4,%esp
     4cb:	6a 01                	push   $0x1
     4cd:	8d 45 f4             	lea    -0xc(%ebp),%eax
     4d0:	50                   	push   %eax
     4d1:	ff 75 08             	pushl  0x8(%ebp)
     4d4:	e8 5b ff ff ff       	call   434 <write>
     4d9:	83 c4 10             	add    $0x10,%esp
}
     4dc:	90                   	nop
     4dd:	c9                   	leave  
     4de:	c3                   	ret    

000004df <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     4df:	55                   	push   %ebp
     4e0:	89 e5                	mov    %esp,%ebp
     4e2:	53                   	push   %ebx
     4e3:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     4e6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     4ed:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     4f1:	74 17                	je     50a <printint+0x2b>
     4f3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     4f7:	79 11                	jns    50a <printint+0x2b>
    neg = 1;
     4f9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     500:	8b 45 0c             	mov    0xc(%ebp),%eax
     503:	f7 d8                	neg    %eax
     505:	89 45 ec             	mov    %eax,-0x14(%ebp)
     508:	eb 06                	jmp    510 <printint+0x31>
  } else {
    x = xx;
     50a:	8b 45 0c             	mov    0xc(%ebp),%eax
     50d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     510:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     517:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     51a:	8d 41 01             	lea    0x1(%ecx),%eax
     51d:	89 45 f4             	mov    %eax,-0xc(%ebp)
     520:	8b 5d 10             	mov    0x10(%ebp),%ebx
     523:	8b 45 ec             	mov    -0x14(%ebp),%eax
     526:	ba 00 00 00 00       	mov    $0x0,%edx
     52b:	f7 f3                	div    %ebx
     52d:	89 d0                	mov    %edx,%eax
     52f:	0f b6 80 20 44 00 00 	movzbl 0x4420(%eax),%eax
     536:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     53a:	8b 5d 10             	mov    0x10(%ebp),%ebx
     53d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     540:	ba 00 00 00 00       	mov    $0x0,%edx
     545:	f7 f3                	div    %ebx
     547:	89 45 ec             	mov    %eax,-0x14(%ebp)
     54a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     54e:	75 c7                	jne    517 <printint+0x38>
  if(neg)
     550:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     554:	74 2d                	je     583 <printint+0xa4>
    buf[i++] = '-';
     556:	8b 45 f4             	mov    -0xc(%ebp),%eax
     559:	8d 50 01             	lea    0x1(%eax),%edx
     55c:	89 55 f4             	mov    %edx,-0xc(%ebp)
     55f:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     564:	eb 1d                	jmp    583 <printint+0xa4>
    putc(fd, buf[i]);
     566:	8d 55 dc             	lea    -0x24(%ebp),%edx
     569:	8b 45 f4             	mov    -0xc(%ebp),%eax
     56c:	01 d0                	add    %edx,%eax
     56e:	0f b6 00             	movzbl (%eax),%eax
     571:	0f be c0             	movsbl %al,%eax
     574:	83 ec 08             	sub    $0x8,%esp
     577:	50                   	push   %eax
     578:	ff 75 08             	pushl  0x8(%ebp)
     57b:	e8 3c ff ff ff       	call   4bc <putc>
     580:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     583:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     587:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     58b:	79 d9                	jns    566 <printint+0x87>
    putc(fd, buf[i]);
}
     58d:	90                   	nop
     58e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     591:	c9                   	leave  
     592:	c3                   	ret    

00000593 <getInteger>:

static int getInteger(double num)
{
     593:	55                   	push   %ebp
     594:	89 e5                	mov    %esp,%ebp
     596:	83 ec 18             	sub    $0x18,%esp
     599:	8b 45 08             	mov    0x8(%ebp),%eax
     59c:	89 45 e8             	mov    %eax,-0x18(%ebp)
     59f:	8b 45 0c             	mov    0xc(%ebp),%eax
     5a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     5a5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     5ac:	eb 0e                	jmp    5bc <getInteger+0x29>
  {
    num -= 1;
     5ae:	dd 45 e8             	fldl   -0x18(%ebp)
     5b1:	d9 e8                	fld1   
     5b3:	de e9                	fsubrp %st,%st(1)
     5b5:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     5b8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     5bc:	dd 45 e8             	fldl   -0x18(%ebp)
     5bf:	d9 e8                	fld1   
     5c1:	d9 c9                	fxch   %st(1)
     5c3:	df e9                	fucomip %st(1),%st
     5c5:	dd d8                	fstp   %st(0)
     5c7:	77 e5                	ja     5ae <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     5c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     5cc:	c9                   	leave  
     5cd:	c3                   	ret    

000005ce <printdbl>:

void printdbl(int fd, double num)
{
     5ce:	55                   	push   %ebp
     5cf:	89 e5                	mov    %esp,%ebp
     5d1:	83 ec 28             	sub    $0x28,%esp
     5d4:	8b 45 0c             	mov    0xc(%ebp),%eax
     5d7:	89 45 e0             	mov    %eax,-0x20(%ebp)
     5da:	8b 45 10             	mov    0x10(%ebp),%eax
     5dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     5e0:	d9 ee                	fldz   
     5e2:	dd 45 e0             	fldl   -0x20(%ebp)
     5e5:	d9 c9                	fxch   %st(1)
     5e7:	df e9                	fucomip %st(1),%st
     5e9:	dd d8                	fstp   %st(0)
     5eb:	76 18                	jbe    605 <printdbl+0x37>
  {
    putc(fd,'-');
     5ed:	83 ec 08             	sub    $0x8,%esp
     5f0:	6a 2d                	push   $0x2d
     5f2:	ff 75 08             	pushl  0x8(%ebp)
     5f5:	e8 c2 fe ff ff       	call   4bc <putc>
     5fa:	83 c4 10             	add    $0x10,%esp
    num = -num;
     5fd:	dd 45 e0             	fldl   -0x20(%ebp)
     600:	d9 e0                	fchs   
     602:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     605:	83 ec 08             	sub    $0x8,%esp
     608:	ff 75 e4             	pushl  -0x1c(%ebp)
     60b:	ff 75 e0             	pushl  -0x20(%ebp)
     60e:	e8 80 ff ff ff       	call   593 <getInteger>
     613:	83 c4 10             	add    $0x10,%esp
     616:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     619:	6a 01                	push   $0x1
     61b:	6a 0a                	push   $0xa
     61d:	ff 75 f0             	pushl  -0x10(%ebp)
     620:	ff 75 08             	pushl  0x8(%ebp)
     623:	e8 b7 fe ff ff       	call   4df <printint>
     628:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     62b:	db 45 f0             	fildl  -0x10(%ebp)
     62e:	dd 45 e0             	fldl   -0x20(%ebp)
     631:	de e1                	fsubp  %st,%st(1)
     633:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     636:	dd 45 e0             	fldl   -0x20(%ebp)
     639:	dd 05 f0 37 00 00    	fldl   0x37f0
     63f:	d9 c9                	fxch   %st(1)
     641:	df e9                	fucomip %st(1),%st
     643:	dd d8                	fstp   %st(0)
     645:	76 10                	jbe    657 <printdbl+0x89>
    putc(fd,'.');
     647:	83 ec 08             	sub    $0x8,%esp
     64a:	6a 2e                	push   $0x2e
     64c:	ff 75 08             	pushl  0x8(%ebp)
     64f:	e8 68 fe ff ff       	call   4bc <putc>
     654:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     657:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     65e:	eb 49                	jmp    6a9 <printdbl+0xdb>
  {
    num = num*10;
     660:	dd 45 e0             	fldl   -0x20(%ebp)
     663:	dd 05 f8 37 00 00    	fldl   0x37f8
     669:	de c9                	fmulp  %st,%st(1)
     66b:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     66e:	83 ec 08             	sub    $0x8,%esp
     671:	ff 75 e4             	pushl  -0x1c(%ebp)
     674:	ff 75 e0             	pushl  -0x20(%ebp)
     677:	e8 17 ff ff ff       	call   593 <getInteger>
     67c:	83 c4 10             	add    $0x10,%esp
     67f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     682:	6a 01                	push   $0x1
     684:	6a 0a                	push   $0xa
     686:	ff 75 f0             	pushl  -0x10(%ebp)
     689:	ff 75 08             	pushl  0x8(%ebp)
     68c:	e8 4e fe ff ff       	call   4df <printint>
     691:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     694:	db 45 f0             	fildl  -0x10(%ebp)
     697:	dd 45 e0             	fldl   -0x20(%ebp)
     69a:	de e1                	fsubp  %st,%st(1)
     69c:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     69f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     6a3:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     6a7:	7f 13                	jg     6bc <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     6a9:	dd 45 e0             	fldl   -0x20(%ebp)
     6ac:	dd 05 f0 37 00 00    	fldl   0x37f0
     6b2:	d9 c9                	fxch   %st(1)
     6b4:	df e9                	fucomip %st(1),%st
     6b6:	dd d8                	fstp   %st(0)
     6b8:	77 a6                	ja     660 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     6ba:	eb 01                	jmp    6bd <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     6bc:	90                   	nop
    }
  }
}
     6bd:	90                   	nop
     6be:	c9                   	leave  
     6bf:	c3                   	ret    

000006c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     6c0:	55                   	push   %ebp
     6c1:	89 e5                	mov    %esp,%ebp
     6c3:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     6c6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     6cd:	8d 45 0c             	lea    0xc(%ebp),%eax
     6d0:	83 c0 04             	add    $0x4,%eax
     6d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     6d6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     6dd:	e9 88 01 00 00       	jmp    86a <printf+0x1aa>
    c = fmt[i] & 0xff;
     6e2:	8b 55 0c             	mov    0xc(%ebp),%edx
     6e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     6e8:	01 d0                	add    %edx,%eax
     6ea:	0f b6 00             	movzbl (%eax),%eax
     6ed:	0f be c0             	movsbl %al,%eax
     6f0:	25 ff 00 00 00       	and    $0xff,%eax
     6f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     6f8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     6fc:	75 2c                	jne    72a <printf+0x6a>
      if(c == '%'){
     6fe:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     702:	75 0c                	jne    710 <printf+0x50>
        state = '%';
     704:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     70b:	e9 56 01 00 00       	jmp    866 <printf+0x1a6>
      } else {
        putc(fd, c);
     710:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     713:	0f be c0             	movsbl %al,%eax
     716:	83 ec 08             	sub    $0x8,%esp
     719:	50                   	push   %eax
     71a:	ff 75 08             	pushl  0x8(%ebp)
     71d:	e8 9a fd ff ff       	call   4bc <putc>
     722:	83 c4 10             	add    $0x10,%esp
     725:	e9 3c 01 00 00       	jmp    866 <printf+0x1a6>
      }
    } else if(state == '%'){
     72a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     72e:	0f 85 32 01 00 00    	jne    866 <printf+0x1a6>
      if(c == 'd'){
     734:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     738:	75 1e                	jne    758 <printf+0x98>
        printint(fd, *ap, 10, 1);
     73a:	8b 45 e8             	mov    -0x18(%ebp),%eax
     73d:	8b 00                	mov    (%eax),%eax
     73f:	6a 01                	push   $0x1
     741:	6a 0a                	push   $0xa
     743:	50                   	push   %eax
     744:	ff 75 08             	pushl  0x8(%ebp)
     747:	e8 93 fd ff ff       	call   4df <printint>
     74c:	83 c4 10             	add    $0x10,%esp
        ap++;
     74f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     753:	e9 07 01 00 00       	jmp    85f <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     758:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     75c:	74 06                	je     764 <printf+0xa4>
     75e:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     762:	75 1e                	jne    782 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     764:	8b 45 e8             	mov    -0x18(%ebp),%eax
     767:	8b 00                	mov    (%eax),%eax
     769:	6a 00                	push   $0x0
     76b:	6a 10                	push   $0x10
     76d:	50                   	push   %eax
     76e:	ff 75 08             	pushl  0x8(%ebp)
     771:	e8 69 fd ff ff       	call   4df <printint>
     776:	83 c4 10             	add    $0x10,%esp
        ap++;
     779:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     77d:	e9 dd 00 00 00       	jmp    85f <printf+0x19f>
      } else if(c == 's'){
     782:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     786:	75 46                	jne    7ce <printf+0x10e>
        s = (char*)*ap;
     788:	8b 45 e8             	mov    -0x18(%ebp),%eax
     78b:	8b 00                	mov    (%eax),%eax
     78d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     790:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     794:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     798:	75 25                	jne    7bf <printf+0xff>
          s = "(null)";
     79a:	c7 45 f4 e8 37 00 00 	movl   $0x37e8,-0xc(%ebp)
        while(*s != 0){
     7a1:	eb 1c                	jmp    7bf <printf+0xff>
          putc(fd, *s);
     7a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7a6:	0f b6 00             	movzbl (%eax),%eax
     7a9:	0f be c0             	movsbl %al,%eax
     7ac:	83 ec 08             	sub    $0x8,%esp
     7af:	50                   	push   %eax
     7b0:	ff 75 08             	pushl  0x8(%ebp)
     7b3:	e8 04 fd ff ff       	call   4bc <putc>
     7b8:	83 c4 10             	add    $0x10,%esp
          s++;
     7bb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     7bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7c2:	0f b6 00             	movzbl (%eax),%eax
     7c5:	84 c0                	test   %al,%al
     7c7:	75 da                	jne    7a3 <printf+0xe3>
     7c9:	e9 91 00 00 00       	jmp    85f <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     7ce:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     7d2:	75 1d                	jne    7f1 <printf+0x131>
        putc(fd, *ap);
     7d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
     7d7:	8b 00                	mov    (%eax),%eax
     7d9:	0f be c0             	movsbl %al,%eax
     7dc:	83 ec 08             	sub    $0x8,%esp
     7df:	50                   	push   %eax
     7e0:	ff 75 08             	pushl  0x8(%ebp)
     7e3:	e8 d4 fc ff ff       	call   4bc <putc>
     7e8:	83 c4 10             	add    $0x10,%esp
        ap++;
     7eb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     7ef:	eb 6e                	jmp    85f <printf+0x19f>
      } else if(c == '%'){
     7f1:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     7f5:	75 17                	jne    80e <printf+0x14e>
        putc(fd, c);
     7f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7fa:	0f be c0             	movsbl %al,%eax
     7fd:	83 ec 08             	sub    $0x8,%esp
     800:	50                   	push   %eax
     801:	ff 75 08             	pushl  0x8(%ebp)
     804:	e8 b3 fc ff ff       	call   4bc <putc>
     809:	83 c4 10             	add    $0x10,%esp
     80c:	eb 51                	jmp    85f <printf+0x19f>
      } else if(c == 'f'){ //for double
     80e:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     812:	75 26                	jne    83a <printf+0x17a>
        double *dap = (double*)ap;
     814:	8b 45 e8             	mov    -0x18(%ebp),%eax
     817:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     81a:	8b 45 e0             	mov    -0x20(%ebp),%eax
     81d:	dd 00                	fldl   (%eax)
     81f:	83 ec 04             	sub    $0x4,%esp
     822:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     826:	dd 1c 24             	fstpl  (%esp)
     829:	ff 75 08             	pushl  0x8(%ebp)
     82c:	e8 9d fd ff ff       	call   5ce <printdbl>
     831:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     834:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     838:	eb 25                	jmp    85f <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     83a:	83 ec 08             	sub    $0x8,%esp
     83d:	6a 25                	push   $0x25
     83f:	ff 75 08             	pushl  0x8(%ebp)
     842:	e8 75 fc ff ff       	call   4bc <putc>
     847:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     84a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     84d:	0f be c0             	movsbl %al,%eax
     850:	83 ec 08             	sub    $0x8,%esp
     853:	50                   	push   %eax
     854:	ff 75 08             	pushl  0x8(%ebp)
     857:	e8 60 fc ff ff       	call   4bc <putc>
     85c:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     85f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     866:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     86a:	8b 55 0c             	mov    0xc(%ebp),%edx
     86d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     870:	01 d0                	add    %edx,%eax
     872:	0f b6 00             	movzbl (%eax),%eax
     875:	84 c0                	test   %al,%al
     877:	0f 85 65 fe ff ff    	jne    6e2 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     87d:	90                   	nop
     87e:	c9                   	leave  
     87f:	c3                   	ret    

00000880 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     880:	55                   	push   %ebp
     881:	89 e5                	mov    %esp,%ebp
     883:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     886:	8b 45 08             	mov    0x8(%ebp),%eax
     889:	83 e8 08             	sub    $0x8,%eax
     88c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     88f:	a1 68 45 00 00       	mov    0x4568,%eax
     894:	89 45 fc             	mov    %eax,-0x4(%ebp)
     897:	eb 24                	jmp    8bd <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     899:	8b 45 fc             	mov    -0x4(%ebp),%eax
     89c:	8b 00                	mov    (%eax),%eax
     89e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     8a1:	77 12                	ja     8b5 <free+0x35>
     8a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
     8a6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     8a9:	77 24                	ja     8cf <free+0x4f>
     8ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8ae:	8b 00                	mov    (%eax),%eax
     8b0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     8b3:	77 1a                	ja     8cf <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     8b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8b8:	8b 00                	mov    (%eax),%eax
     8ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
     8bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
     8c0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     8c3:	76 d4                	jbe    899 <free+0x19>
     8c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8c8:	8b 00                	mov    (%eax),%eax
     8ca:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     8cd:	76 ca                	jbe    899 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     8cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
     8d2:	8b 40 04             	mov    0x4(%eax),%eax
     8d5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     8dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
     8df:	01 c2                	add    %eax,%edx
     8e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8e4:	8b 00                	mov    (%eax),%eax
     8e6:	39 c2                	cmp    %eax,%edx
     8e8:	75 24                	jne    90e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     8ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
     8ed:	8b 50 04             	mov    0x4(%eax),%edx
     8f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8f3:	8b 00                	mov    (%eax),%eax
     8f5:	8b 40 04             	mov    0x4(%eax),%eax
     8f8:	01 c2                	add    %eax,%edx
     8fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
     8fd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     900:	8b 45 fc             	mov    -0x4(%ebp),%eax
     903:	8b 00                	mov    (%eax),%eax
     905:	8b 10                	mov    (%eax),%edx
     907:	8b 45 f8             	mov    -0x8(%ebp),%eax
     90a:	89 10                	mov    %edx,(%eax)
     90c:	eb 0a                	jmp    918 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     90e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     911:	8b 10                	mov    (%eax),%edx
     913:	8b 45 f8             	mov    -0x8(%ebp),%eax
     916:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     918:	8b 45 fc             	mov    -0x4(%ebp),%eax
     91b:	8b 40 04             	mov    0x4(%eax),%eax
     91e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     925:	8b 45 fc             	mov    -0x4(%ebp),%eax
     928:	01 d0                	add    %edx,%eax
     92a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     92d:	75 20                	jne    94f <free+0xcf>
    p->s.size += bp->s.size;
     92f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     932:	8b 50 04             	mov    0x4(%eax),%edx
     935:	8b 45 f8             	mov    -0x8(%ebp),%eax
     938:	8b 40 04             	mov    0x4(%eax),%eax
     93b:	01 c2                	add    %eax,%edx
     93d:	8b 45 fc             	mov    -0x4(%ebp),%eax
     940:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     943:	8b 45 f8             	mov    -0x8(%ebp),%eax
     946:	8b 10                	mov    (%eax),%edx
     948:	8b 45 fc             	mov    -0x4(%ebp),%eax
     94b:	89 10                	mov    %edx,(%eax)
     94d:	eb 08                	jmp    957 <free+0xd7>
  } else
    p->s.ptr = bp;
     94f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     952:	8b 55 f8             	mov    -0x8(%ebp),%edx
     955:	89 10                	mov    %edx,(%eax)
  freep = p;
     957:	8b 45 fc             	mov    -0x4(%ebp),%eax
     95a:	a3 68 45 00 00       	mov    %eax,0x4568
}
     95f:	90                   	nop
     960:	c9                   	leave  
     961:	c3                   	ret    

00000962 <morecore>:

static Header*
morecore(uint nu)
{
     962:	55                   	push   %ebp
     963:	89 e5                	mov    %esp,%ebp
     965:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     968:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     96f:	77 07                	ja     978 <morecore+0x16>
    nu = 4096;
     971:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     978:	8b 45 08             	mov    0x8(%ebp),%eax
     97b:	c1 e0 03             	shl    $0x3,%eax
     97e:	83 ec 0c             	sub    $0xc,%esp
     981:	50                   	push   %eax
     982:	e8 15 fb ff ff       	call   49c <sbrk>
     987:	83 c4 10             	add    $0x10,%esp
     98a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     98d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     991:	75 07                	jne    99a <morecore+0x38>
    return 0;
     993:	b8 00 00 00 00       	mov    $0x0,%eax
     998:	eb 26                	jmp    9c0 <morecore+0x5e>
  hp = (Header*)p;
     99a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     99d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     9a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9a3:	8b 55 08             	mov    0x8(%ebp),%edx
     9a6:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     9a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9ac:	83 c0 08             	add    $0x8,%eax
     9af:	83 ec 0c             	sub    $0xc,%esp
     9b2:	50                   	push   %eax
     9b3:	e8 c8 fe ff ff       	call   880 <free>
     9b8:	83 c4 10             	add    $0x10,%esp
  return freep;
     9bb:	a1 68 45 00 00       	mov    0x4568,%eax
}
     9c0:	c9                   	leave  
     9c1:	c3                   	ret    

000009c2 <malloc>:

void*
malloc(uint nbytes)
{
     9c2:	55                   	push   %ebp
     9c3:	89 e5                	mov    %esp,%ebp
     9c5:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     9c8:	8b 45 08             	mov    0x8(%ebp),%eax
     9cb:	83 c0 07             	add    $0x7,%eax
     9ce:	c1 e8 03             	shr    $0x3,%eax
     9d1:	83 c0 01             	add    $0x1,%eax
     9d4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     9d7:	a1 68 45 00 00       	mov    0x4568,%eax
     9dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
     9df:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     9e3:	75 23                	jne    a08 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     9e5:	c7 45 f0 60 45 00 00 	movl   $0x4560,-0x10(%ebp)
     9ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9ef:	a3 68 45 00 00       	mov    %eax,0x4568
     9f4:	a1 68 45 00 00       	mov    0x4568,%eax
     9f9:	a3 60 45 00 00       	mov    %eax,0x4560
    base.s.size = 0;
     9fe:	c7 05 64 45 00 00 00 	movl   $0x0,0x4564
     a05:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     a08:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a0b:	8b 00                	mov    (%eax),%eax
     a0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     a10:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a13:	8b 40 04             	mov    0x4(%eax),%eax
     a16:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     a19:	72 4d                	jb     a68 <malloc+0xa6>
      if(p->s.size == nunits)
     a1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a1e:	8b 40 04             	mov    0x4(%eax),%eax
     a21:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     a24:	75 0c                	jne    a32 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     a26:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a29:	8b 10                	mov    (%eax),%edx
     a2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a2e:	89 10                	mov    %edx,(%eax)
     a30:	eb 26                	jmp    a58 <malloc+0x96>
      else {
        p->s.size -= nunits;
     a32:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a35:	8b 40 04             	mov    0x4(%eax),%eax
     a38:	2b 45 ec             	sub    -0x14(%ebp),%eax
     a3b:	89 c2                	mov    %eax,%edx
     a3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a40:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     a43:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a46:	8b 40 04             	mov    0x4(%eax),%eax
     a49:	c1 e0 03             	shl    $0x3,%eax
     a4c:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     a4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a52:	8b 55 ec             	mov    -0x14(%ebp),%edx
     a55:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     a58:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a5b:	a3 68 45 00 00       	mov    %eax,0x4568
      return (void*)(p + 1);
     a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a63:	83 c0 08             	add    $0x8,%eax
     a66:	eb 3b                	jmp    aa3 <malloc+0xe1>
    }
    if(p == freep)
     a68:	a1 68 45 00 00       	mov    0x4568,%eax
     a6d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     a70:	75 1e                	jne    a90 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     a72:	83 ec 0c             	sub    $0xc,%esp
     a75:	ff 75 ec             	pushl  -0x14(%ebp)
     a78:	e8 e5 fe ff ff       	call   962 <morecore>
     a7d:	83 c4 10             	add    $0x10,%esp
     a80:	89 45 f4             	mov    %eax,-0xc(%ebp)
     a83:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     a87:	75 07                	jne    a90 <malloc+0xce>
        return 0;
     a89:	b8 00 00 00 00       	mov    $0x0,%eax
     a8e:	eb 13                	jmp    aa3 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     a90:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a93:	89 45 f0             	mov    %eax,-0x10(%ebp)
     a96:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a99:	8b 00                	mov    (%eax),%eax
     a9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     a9e:	e9 6d ff ff ff       	jmp    a10 <malloc+0x4e>
}
     aa3:	c9                   	leave  
     aa4:	c3                   	ret    

00000aa5 <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     aa5:	55                   	push   %ebp
     aa6:	89 e5                	mov    %esp,%ebp
     aa8:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     aab:	83 ec 04             	sub    $0x4,%esp
     aae:	ff 75 08             	pushl  0x8(%ebp)
     ab1:	68 00 38 00 00       	push   $0x3800
     ab6:	6a 02                	push   $0x2
     ab8:	e8 03 fc ff ff       	call   6c0 <printf>
     abd:	83 c4 10             	add    $0x10,%esp
  exit();
     ac0:	e8 4f f9 ff ff       	call   414 <exit>

00000ac5 <getInteger>:
}

static int getInteger(double num)
{
     ac5:	55                   	push   %ebp
     ac6:	89 e5                	mov    %esp,%ebp
     ac8:	83 ec 18             	sub    $0x18,%esp
     acb:	8b 45 08             	mov    0x8(%ebp),%eax
     ace:	89 45 e8             	mov    %eax,-0x18(%ebp)
     ad1:	8b 45 0c             	mov    0xc(%ebp),%eax
     ad4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     ad7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     ade:	eb 0e                	jmp    aee <getInteger+0x29>
  {
    num -= 1;
     ae0:	dd 45 e8             	fldl   -0x18(%ebp)
     ae3:	d9 e8                	fld1   
     ae5:	de e9                	fsubrp %st,%st(1)
     ae7:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     aea:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     aee:	dd 45 e8             	fldl   -0x18(%ebp)
     af1:	d9 e8                	fld1   
     af3:	d9 c9                	fxch   %st(1)
     af5:	df e9                	fucomip %st(1),%st
     af7:	dd d8                	fstp   %st(0)
     af9:	77 e5                	ja     ae0 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     afb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     afe:	c9                   	leave  
     aff:	c3                   	ret    

00000b00 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     b00:	55                   	push   %ebp
     b01:	89 e5                	mov    %esp,%ebp
     b03:	53                   	push   %ebx
     b04:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     b07:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     b0e:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     b12:	74 17                	je     b2b <int2str+0x2b>
     b14:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     b18:	79 11                	jns    b2b <int2str+0x2b>
    neg = 1;
     b1a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     b21:	8b 45 0c             	mov    0xc(%ebp),%eax
     b24:	f7 d8                	neg    %eax
     b26:	89 45 f0             	mov    %eax,-0x10(%ebp)
     b29:	eb 06                	jmp    b31 <int2str+0x31>
  } else {
    x = num;
     b2b:	8b 45 0c             	mov    0xc(%ebp),%eax
     b2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     b31:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     b38:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     b3b:	8d 41 01             	lea    0x1(%ecx),%eax
     b3e:	89 45 f8             	mov    %eax,-0x8(%ebp)
     b41:	8b 5d 14             	mov    0x14(%ebp),%ebx
     b44:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b47:	ba 00 00 00 00       	mov    $0x0,%edx
     b4c:	f7 f3                	div    %ebx
     b4e:	89 d0                	mov    %edx,%eax
     b50:	0f b6 80 34 44 00 00 	movzbl 0x4434(%eax),%eax
     b57:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     b5b:	8b 5d 14             	mov    0x14(%ebp),%ebx
     b5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b61:	ba 00 00 00 00       	mov    $0x0,%edx
     b66:	f7 f3                	div    %ebx
     b68:	89 45 f0             	mov    %eax,-0x10(%ebp)
     b6b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     b6f:	75 c7                	jne    b38 <int2str+0x38>
  if(neg)
     b71:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b75:	74 36                	je     bad <int2str+0xad>
    buf[i++] = '-';
     b77:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b7a:	8d 50 01             	lea    0x1(%eax),%edx
     b7d:	89 55 f8             	mov    %edx,-0x8(%ebp)
     b80:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     b85:	eb 26                	jmp    bad <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     b87:	8b 45 10             	mov    0x10(%ebp),%eax
     b8a:	8b 00                	mov    (%eax),%eax
     b8c:	89 c2                	mov    %eax,%edx
     b8e:	8b 45 08             	mov    0x8(%ebp),%eax
     b91:	01 c2                	add    %eax,%edx
     b93:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     b96:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b99:	01 c8                	add    %ecx,%eax
     b9b:	0f b6 00             	movzbl (%eax),%eax
     b9e:	88 02                	mov    %al,(%edx)
    (*pos)++;
     ba0:	8b 45 10             	mov    0x10(%ebp),%eax
     ba3:	8b 00                	mov    (%eax),%eax
     ba5:	8d 50 01             	lea    0x1(%eax),%edx
     ba8:	8b 45 10             	mov    0x10(%ebp),%eax
     bab:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     bad:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     bb1:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     bb5:	79 d0                	jns    b87 <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     bb7:	90                   	nop
     bb8:	83 c4 20             	add    $0x20,%esp
     bbb:	5b                   	pop    %ebx
     bbc:	5d                   	pop    %ebp
     bbd:	c3                   	ret    

00000bbe <double2str>:

void double2str(char *buf, double num, int *pos)
{
     bbe:	55                   	push   %ebp
     bbf:	89 e5                	mov    %esp,%ebp
     bc1:	83 ec 18             	sub    $0x18,%esp
     bc4:	8b 45 0c             	mov    0xc(%ebp),%eax
     bc7:	89 45 e8             	mov    %eax,-0x18(%ebp)
     bca:	8b 45 10             	mov    0x10(%ebp),%eax
     bcd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     bd0:	d9 ee                	fldz   
     bd2:	dd 45 e8             	fldl   -0x18(%ebp)
     bd5:	d9 c9                	fxch   %st(1)
     bd7:	df e9                	fucomip %st(1),%st
     bd9:	dd d8                	fstp   %st(0)
     bdb:	76 24                	jbe    c01 <double2str+0x43>
  {
    buf[*pos] = '-';
     bdd:	8b 45 14             	mov    0x14(%ebp),%eax
     be0:	8b 00                	mov    (%eax),%eax
     be2:	89 c2                	mov    %eax,%edx
     be4:	8b 45 08             	mov    0x8(%ebp),%eax
     be7:	01 d0                	add    %edx,%eax
     be9:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     bec:	8b 45 14             	mov    0x14(%ebp),%eax
     bef:	8b 00                	mov    (%eax),%eax
     bf1:	8d 50 01             	lea    0x1(%eax),%edx
     bf4:	8b 45 14             	mov    0x14(%ebp),%eax
     bf7:	89 10                	mov    %edx,(%eax)
    num = -num;
     bf9:	dd 45 e8             	fldl   -0x18(%ebp)
     bfc:	d9 e0                	fchs   
     bfe:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     c01:	ff 75 ec             	pushl  -0x14(%ebp)
     c04:	ff 75 e8             	pushl  -0x18(%ebp)
     c07:	e8 b9 fe ff ff       	call   ac5 <getInteger>
     c0c:	83 c4 08             	add    $0x8,%esp
     c0f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     c12:	83 ec 04             	sub    $0x4,%esp
     c15:	6a 01                	push   $0x1
     c17:	6a 0a                	push   $0xa
     c19:	ff 75 14             	pushl  0x14(%ebp)
     c1c:	ff 75 f8             	pushl  -0x8(%ebp)
     c1f:	ff 75 08             	pushl  0x8(%ebp)
     c22:	e8 d9 fe ff ff       	call   b00 <int2str>
     c27:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     c2a:	db 45 f8             	fildl  -0x8(%ebp)
     c2d:	dd 45 e8             	fldl   -0x18(%ebp)
     c30:	de e1                	fsubp  %st,%st(1)
     c32:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     c35:	dd 45 e8             	fldl   -0x18(%ebp)
     c38:	dd 05 08 38 00 00    	fldl   0x3808
     c3e:	d9 c9                	fxch   %st(1)
     c40:	df e9                	fucomip %st(1),%st
     c42:	dd d8                	fstp   %st(0)
     c44:	76 1c                	jbe    c62 <double2str+0xa4>
  {
    buf[*pos] = '.';
     c46:	8b 45 14             	mov    0x14(%ebp),%eax
     c49:	8b 00                	mov    (%eax),%eax
     c4b:	89 c2                	mov    %eax,%edx
     c4d:	8b 45 08             	mov    0x8(%ebp),%eax
     c50:	01 d0                	add    %edx,%eax
     c52:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     c55:	8b 45 14             	mov    0x14(%ebp),%eax
     c58:	8b 00                	mov    (%eax),%eax
     c5a:	8d 50 01             	lea    0x1(%eax),%edx
     c5d:	8b 45 14             	mov    0x14(%ebp),%eax
     c60:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     c62:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     c69:	eb 4c                	jmp    cb7 <double2str+0xf9>
  {
    num = num*10;
     c6b:	dd 45 e8             	fldl   -0x18(%ebp)
     c6e:	dd 05 10 38 00 00    	fldl   0x3810
     c74:	de c9                	fmulp  %st,%st(1)
     c76:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     c79:	ff 75 ec             	pushl  -0x14(%ebp)
     c7c:	ff 75 e8             	pushl  -0x18(%ebp)
     c7f:	e8 41 fe ff ff       	call   ac5 <getInteger>
     c84:	83 c4 08             	add    $0x8,%esp
     c87:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     c8a:	83 ec 04             	sub    $0x4,%esp
     c8d:	6a 01                	push   $0x1
     c8f:	6a 0a                	push   $0xa
     c91:	ff 75 14             	pushl  0x14(%ebp)
     c94:	ff 75 f8             	pushl  -0x8(%ebp)
     c97:	ff 75 08             	pushl  0x8(%ebp)
     c9a:	e8 61 fe ff ff       	call   b00 <int2str>
     c9f:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     ca2:	db 45 f8             	fildl  -0x8(%ebp)
     ca5:	dd 45 e8             	fldl   -0x18(%ebp)
     ca8:	de e1                	fsubp  %st,%st(1)
     caa:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     cad:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     cb1:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     cb5:	7f 13                	jg     cca <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     cb7:	dd 45 e8             	fldl   -0x18(%ebp)
     cba:	dd 05 08 38 00 00    	fldl   0x3808
     cc0:	d9 c9                	fxch   %st(1)
     cc2:	df e9                	fucomip %st(1),%st
     cc4:	dd d8                	fstp   %st(0)
     cc6:	77 a3                	ja     c6b <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     cc8:	eb 01                	jmp    ccb <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     cca:	90                   	nop
    }
  }
}
     ccb:	90                   	nop
     ccc:	c9                   	leave  
     ccd:	c3                   	ret    

00000cce <pow>:

double pow(double opnd, int power)
{
     cce:	55                   	push   %ebp
     ccf:	89 e5                	mov    %esp,%ebp
     cd1:	83 ec 18             	sub    $0x18,%esp
     cd4:	8b 45 08             	mov    0x8(%ebp),%eax
     cd7:	89 45 e8             	mov    %eax,-0x18(%ebp)
     cda:	8b 45 0c             	mov    0xc(%ebp),%eax
     cdd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     ce0:	d9 e8                	fld1   
     ce2:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     ce5:	eb 0d                	jmp    cf4 <pow+0x26>
  {
    result *= opnd;
     ce7:	dd 45 f8             	fldl   -0x8(%ebp)
     cea:	dc 4d e8             	fmull  -0x18(%ebp)
     ced:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     cf0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     cf4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     cf8:	7f ed                	jg     ce7 <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     cfa:	dd 45 f8             	fldl   -0x8(%ebp)
}
     cfd:	c9                   	leave  
     cfe:	c3                   	ret    

00000cff <Translation>:

double Translation(char *s, int* pos)
{
     cff:	55                   	push   %ebp
     d00:	89 e5                	mov    %esp,%ebp
     d02:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     d05:	d9 ee                	fldz   
     d07:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     d0a:	d9 ee                	fldz   
     d0c:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     d0f:	eb 3e                	jmp    d4f <Translation+0x50>
    {
        integer *= 10;
     d11:	dd 45 f8             	fldl   -0x8(%ebp)
     d14:	dd 05 10 38 00 00    	fldl   0x3810
     d1a:	de c9                	fmulp  %st,%st(1)
     d1c:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     d1f:	8b 45 0c             	mov    0xc(%ebp),%eax
     d22:	8b 00                	mov    (%eax),%eax
     d24:	89 c2                	mov    %eax,%edx
     d26:	8b 45 08             	mov    0x8(%ebp),%eax
     d29:	01 d0                	add    %edx,%eax
     d2b:	0f b6 00             	movzbl (%eax),%eax
     d2e:	0f be c0             	movsbl %al,%eax
     d31:	83 e8 30             	sub    $0x30,%eax
     d34:	89 45 dc             	mov    %eax,-0x24(%ebp)
     d37:	db 45 dc             	fildl  -0x24(%ebp)
     d3a:	dd 45 f8             	fldl   -0x8(%ebp)
     d3d:	de c1                	faddp  %st,%st(1)
     d3f:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     d42:	8b 45 0c             	mov    0xc(%ebp),%eax
     d45:	8b 00                	mov    (%eax),%eax
     d47:	8d 50 01             	lea    0x1(%eax),%edx
     d4a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d4d:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     d4f:	8b 45 0c             	mov    0xc(%ebp),%eax
     d52:	8b 00                	mov    (%eax),%eax
     d54:	89 c2                	mov    %eax,%edx
     d56:	8b 45 08             	mov    0x8(%ebp),%eax
     d59:	01 d0                	add    %edx,%eax
     d5b:	0f b6 00             	movzbl (%eax),%eax
     d5e:	3c 2f                	cmp    $0x2f,%al
     d60:	7e 13                	jle    d75 <Translation+0x76>
     d62:	8b 45 0c             	mov    0xc(%ebp),%eax
     d65:	8b 00                	mov    (%eax),%eax
     d67:	89 c2                	mov    %eax,%edx
     d69:	8b 45 08             	mov    0x8(%ebp),%eax
     d6c:	01 d0                	add    %edx,%eax
     d6e:	0f b6 00             	movzbl (%eax),%eax
     d71:	3c 39                	cmp    $0x39,%al
     d73:	7e 9c                	jle    d11 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     d75:	8b 45 0c             	mov    0xc(%ebp),%eax
     d78:	8b 00                	mov    (%eax),%eax
     d7a:	89 c2                	mov    %eax,%edx
     d7c:	8b 45 08             	mov    0x8(%ebp),%eax
     d7f:	01 d0                	add    %edx,%eax
     d81:	0f b6 00             	movzbl (%eax),%eax
     d84:	3c 2e                	cmp    $0x2e,%al
     d86:	0f 85 9b 00 00 00    	jne    e27 <Translation+0x128>
    {
        (*pos)++;
     d8c:	8b 45 0c             	mov    0xc(%ebp),%eax
     d8f:	8b 00                	mov    (%eax),%eax
     d91:	8d 50 01             	lea    0x1(%eax),%edx
     d94:	8b 45 0c             	mov    0xc(%ebp),%eax
     d97:	89 10                	mov    %edx,(%eax)
        int c = 1;
     d99:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     da0:	eb 5b                	jmp    dfd <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     da2:	8b 45 0c             	mov    0xc(%ebp),%eax
     da5:	8b 00                	mov    (%eax),%eax
     da7:	89 c2                	mov    %eax,%edx
     da9:	8b 45 08             	mov    0x8(%ebp),%eax
     dac:	01 d0                	add    %edx,%eax
     dae:	0f b6 00             	movzbl (%eax),%eax
     db1:	0f be c0             	movsbl %al,%eax
     db4:	83 e8 30             	sub    $0x30,%eax
     db7:	89 45 dc             	mov    %eax,-0x24(%ebp)
     dba:	db 45 dc             	fildl  -0x24(%ebp)
     dbd:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     dc0:	83 ec 04             	sub    $0x4,%esp
     dc3:	ff 75 ec             	pushl  -0x14(%ebp)
     dc6:	dd 05 18 38 00 00    	fldl   0x3818
     dcc:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     dd0:	dd 1c 24             	fstpl  (%esp)
     dd3:	e8 f6 fe ff ff       	call   cce <pow>
     dd8:	83 c4 10             	add    $0x10,%esp
     ddb:	dd 45 e0             	fldl   -0x20(%ebp)
     dde:	de c9                	fmulp  %st,%st(1)
     de0:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     de3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     de7:	dd 45 f0             	fldl   -0x10(%ebp)
     dea:	dc 45 e0             	faddl  -0x20(%ebp)
     ded:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     df0:	8b 45 0c             	mov    0xc(%ebp),%eax
     df3:	8b 00                	mov    (%eax),%eax
     df5:	8d 50 01             	lea    0x1(%eax),%edx
     df8:	8b 45 0c             	mov    0xc(%ebp),%eax
     dfb:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     dfd:	8b 45 0c             	mov    0xc(%ebp),%eax
     e00:	8b 00                	mov    (%eax),%eax
     e02:	89 c2                	mov    %eax,%edx
     e04:	8b 45 08             	mov    0x8(%ebp),%eax
     e07:	01 d0                	add    %edx,%eax
     e09:	0f b6 00             	movzbl (%eax),%eax
     e0c:	3c 2f                	cmp    $0x2f,%al
     e0e:	7e 17                	jle    e27 <Translation+0x128>
     e10:	8b 45 0c             	mov    0xc(%ebp),%eax
     e13:	8b 00                	mov    (%eax),%eax
     e15:	89 c2                	mov    %eax,%edx
     e17:	8b 45 08             	mov    0x8(%ebp),%eax
     e1a:	01 d0                	add    %edx,%eax
     e1c:	0f b6 00             	movzbl (%eax),%eax
     e1f:	3c 39                	cmp    $0x39,%al
     e21:	0f 8e 7b ff ff ff    	jle    da2 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     e27:	dd 45 f8             	fldl   -0x8(%ebp)
     e2a:	dc 45 f0             	faddl  -0x10(%ebp)
     e2d:	c9                   	leave  
     e2e:	c3                   	ret    

00000e2f <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     e2f:	55                   	push   %ebp
     e30:	89 e5                	mov    %esp,%ebp
     e32:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     e35:	e8 d2 f5 ff ff       	call   40c <fork>
     e3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     e3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e40:	c9                   	leave  
     e41:	c3                   	ret    

00000e42 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     e42:	55                   	push   %ebp
     e43:	89 e5                	mov    %esp,%ebp
     e45:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e48:	83 ec 0c             	sub    $0xc,%esp
     e4b:	6a 54                	push   $0x54
     e4d:	e8 70 fb ff ff       	call   9c2 <malloc>
     e52:	83 c4 10             	add    $0x10,%esp
     e55:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e58:	83 ec 04             	sub    $0x4,%esp
     e5b:	6a 54                	push   $0x54
     e5d:	6a 00                	push   $0x0
     e5f:	ff 75 f4             	pushl  -0xc(%ebp)
     e62:	e8 12 f4 ff ff       	call   279 <memset>
     e67:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     e6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e6d:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     e73:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e76:	c9                   	leave  
     e77:	c3                   	ret    

00000e78 <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     e78:	55                   	push   %ebp
     e79:	89 e5                	mov    %esp,%ebp
     e7b:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e7e:	83 ec 0c             	sub    $0xc,%esp
     e81:	6a 18                	push   $0x18
     e83:	e8 3a fb ff ff       	call   9c2 <malloc>
     e88:	83 c4 10             	add    $0x10,%esp
     e8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e8e:	83 ec 04             	sub    $0x4,%esp
     e91:	6a 18                	push   $0x18
     e93:	6a 00                	push   $0x0
     e95:	ff 75 f4             	pushl  -0xc(%ebp)
     e98:	e8 dc f3 ff ff       	call   279 <memset>
     e9d:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     ea0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ea3:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     ea9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eac:	8b 55 08             	mov    0x8(%ebp),%edx
     eaf:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     eb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eb5:	8b 55 0c             	mov    0xc(%ebp),%edx
     eb8:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     ebb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ebe:	8b 55 10             	mov    0x10(%ebp),%edx
     ec1:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     ec4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ec7:	8b 55 14             	mov    0x14(%ebp),%edx
     eca:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     ecd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ed0:	8b 55 18             	mov    0x18(%ebp),%edx
     ed3:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     ed6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ed9:	c9                   	leave  
     eda:	c3                   	ret    

00000edb <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     edb:	55                   	push   %ebp
     edc:	89 e5                	mov    %esp,%ebp
     ede:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     ee1:	83 ec 0c             	sub    $0xc,%esp
     ee4:	6a 0c                	push   $0xc
     ee6:	e8 d7 fa ff ff       	call   9c2 <malloc>
     eeb:	83 c4 10             	add    $0x10,%esp
     eee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     ef1:	83 ec 04             	sub    $0x4,%esp
     ef4:	6a 0c                	push   $0xc
     ef6:	6a 00                	push   $0x0
     ef8:	ff 75 f4             	pushl  -0xc(%ebp)
     efb:	e8 79 f3 ff ff       	call   279 <memset>
     f00:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     f03:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f06:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     f0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f0f:	8b 55 08             	mov    0x8(%ebp),%edx
     f12:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     f15:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f18:	8b 55 0c             	mov    0xc(%ebp),%edx
     f1b:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     f1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f21:	c9                   	leave  
     f22:	c3                   	ret    

00000f23 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     f23:	55                   	push   %ebp
     f24:	89 e5                	mov    %esp,%ebp
     f26:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     f29:	83 ec 0c             	sub    $0xc,%esp
     f2c:	6a 0c                	push   $0xc
     f2e:	e8 8f fa ff ff       	call   9c2 <malloc>
     f33:	83 c4 10             	add    $0x10,%esp
     f36:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     f39:	83 ec 04             	sub    $0x4,%esp
     f3c:	6a 0c                	push   $0xc
     f3e:	6a 00                	push   $0x0
     f40:	ff 75 f4             	pushl  -0xc(%ebp)
     f43:	e8 31 f3 ff ff       	call   279 <memset>
     f48:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     f4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f4e:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     f54:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f57:	8b 55 08             	mov    0x8(%ebp),%edx
     f5a:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     f5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f60:	8b 55 0c             	mov    0xc(%ebp),%edx
     f63:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     f66:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f69:	c9                   	leave  
     f6a:	c3                   	ret    

00000f6b <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     f6b:	55                   	push   %ebp
     f6c:	89 e5                	mov    %esp,%ebp
     f6e:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     f71:	83 ec 0c             	sub    $0xc,%esp
     f74:	6a 08                	push   $0x8
     f76:	e8 47 fa ff ff       	call   9c2 <malloc>
     f7b:	83 c4 10             	add    $0x10,%esp
     f7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     f81:	83 ec 04             	sub    $0x4,%esp
     f84:	6a 08                	push   $0x8
     f86:	6a 00                	push   $0x0
     f88:	ff 75 f4             	pushl  -0xc(%ebp)
     f8b:	e8 e9 f2 ff ff       	call   279 <memset>
     f90:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
     f93:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f96:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     f9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f9f:	8b 55 08             	mov    0x8(%ebp),%edx
     fa2:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     fa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     fa8:	c9                   	leave  
     fa9:	c3                   	ret    

00000faa <calcmd>:

struct cmd* calcmd(char *_line)
{
     faa:	55                   	push   %ebp
     fab:	89 e5                	mov    %esp,%ebp
     fad:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     fb0:	83 ec 0c             	sub    $0xc,%esp
     fb3:	6a 08                	push   $0x8
     fb5:	e8 08 fa ff ff       	call   9c2 <malloc>
     fba:	83 c4 10             	add    $0x10,%esp
     fbd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     fc0:	83 ec 04             	sub    $0x4,%esp
     fc3:	6a 08                	push   $0x8
     fc5:	6a 00                	push   $0x0
     fc7:	ff 75 f4             	pushl  -0xc(%ebp)
     fca:	e8 aa f2 ff ff       	call   279 <memset>
     fcf:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
     fd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fd5:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
     fdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fde:	8b 55 08             	mov    0x8(%ebp),%edx
     fe1:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     fe4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     fe7:	c9                   	leave  
     fe8:	c3                   	ret    

00000fe9 <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
     fe9:	55                   	push   %ebp
     fea:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
     fec:	eb 0c                	jmp    ffa <mystrncmp+0x11>
    n--, p++, q++;
     fee:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     ff2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     ff6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
     ffa:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     ffe:	74 1a                	je     101a <mystrncmp+0x31>
    1000:	8b 45 08             	mov    0x8(%ebp),%eax
    1003:	0f b6 00             	movzbl (%eax),%eax
    1006:	84 c0                	test   %al,%al
    1008:	74 10                	je     101a <mystrncmp+0x31>
    100a:	8b 45 08             	mov    0x8(%ebp),%eax
    100d:	0f b6 10             	movzbl (%eax),%edx
    1010:	8b 45 0c             	mov    0xc(%ebp),%eax
    1013:	0f b6 00             	movzbl (%eax),%eax
    1016:	38 c2                	cmp    %al,%dl
    1018:	74 d4                	je     fee <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
    101a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    101e:	75 07                	jne    1027 <mystrncmp+0x3e>
    return 0;
    1020:	b8 00 00 00 00       	mov    $0x0,%eax
    1025:	eb 16                	jmp    103d <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
    1027:	8b 45 08             	mov    0x8(%ebp),%eax
    102a:	0f b6 00             	movzbl (%eax),%eax
    102d:	0f b6 d0             	movzbl %al,%edx
    1030:	8b 45 0c             	mov    0xc(%ebp),%eax
    1033:	0f b6 00             	movzbl (%eax),%eax
    1036:	0f b6 c0             	movzbl %al,%eax
    1039:	29 c2                	sub    %eax,%edx
    103b:	89 d0                	mov    %edx,%eax
}
    103d:	5d                   	pop    %ebp
    103e:	c3                   	ret    

0000103f <mystrlen>:

static int mystrlen(const char *s)
{
    103f:	55                   	push   %ebp
    1040:	89 e5                	mov    %esp,%ebp
    1042:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
    1045:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    104c:	eb 04                	jmp    1052 <mystrlen+0x13>
    104e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1052:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1055:	8b 45 08             	mov    0x8(%ebp),%eax
    1058:	01 d0                	add    %edx,%eax
    105a:	0f b6 00             	movzbl (%eax),%eax
    105d:	84 c0                	test   %al,%al
    105f:	75 ed                	jne    104e <mystrlen+0xf>
    ;
  return n;
    1061:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1064:	c9                   	leave  
    1065:	c3                   	ret    

00001066 <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
    1066:	55                   	push   %ebp
    1067:	89 e5                	mov    %esp,%ebp
    1069:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
    106c:	8b 45 08             	mov    0x8(%ebp),%eax
    106f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
    1072:	90                   	nop
    1073:	8b 45 10             	mov    0x10(%ebp),%eax
    1076:	8d 50 ff             	lea    -0x1(%eax),%edx
    1079:	89 55 10             	mov    %edx,0x10(%ebp)
    107c:	85 c0                	test   %eax,%eax
    107e:	7e 2c                	jle    10ac <mystrncpy+0x46>
    1080:	8b 45 08             	mov    0x8(%ebp),%eax
    1083:	8d 50 01             	lea    0x1(%eax),%edx
    1086:	89 55 08             	mov    %edx,0x8(%ebp)
    1089:	8b 55 0c             	mov    0xc(%ebp),%edx
    108c:	8d 4a 01             	lea    0x1(%edx),%ecx
    108f:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1092:	0f b6 12             	movzbl (%edx),%edx
    1095:	88 10                	mov    %dl,(%eax)
    1097:	0f b6 00             	movzbl (%eax),%eax
    109a:	84 c0                	test   %al,%al
    109c:	75 d5                	jne    1073 <mystrncpy+0xd>
    ;
  while(n-- > 0)
    109e:	eb 0c                	jmp    10ac <mystrncpy+0x46>
    *s++ = 0;
    10a0:	8b 45 08             	mov    0x8(%ebp),%eax
    10a3:	8d 50 01             	lea    0x1(%eax),%edx
    10a6:	89 55 08             	mov    %edx,0x8(%ebp)
    10a9:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    10ac:	8b 45 10             	mov    0x10(%ebp),%eax
    10af:	8d 50 ff             	lea    -0x1(%eax),%edx
    10b2:	89 55 10             	mov    %edx,0x10(%ebp)
    10b5:	85 c0                	test   %eax,%eax
    10b7:	7f e7                	jg     10a0 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    10b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10bc:	c9                   	leave  
    10bd:	c3                   	ret    

000010be <isEqual>:

int isEqual(double a, double b)
{
    10be:	55                   	push   %ebp
    10bf:	89 e5                	mov    %esp,%ebp
    10c1:	83 ec 10             	sub    $0x10,%esp
    10c4:	8b 45 08             	mov    0x8(%ebp),%eax
    10c7:	89 45 f8             	mov    %eax,-0x8(%ebp)
    10ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    10cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
    10d0:	8b 45 10             	mov    0x10(%ebp),%eax
    10d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    10d6:	8b 45 14             	mov    0x14(%ebp),%eax
    10d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    10dc:	dd 45 f8             	fldl   -0x8(%ebp)
    10df:	dc 65 f0             	fsubl  -0x10(%ebp)
    10e2:	dd 05 e8 39 00 00    	fldl   0x39e8
    10e8:	df e9                	fucomip %st(1),%st
    10ea:	dd d8                	fstp   %st(0)
    10ec:	76 19                	jbe    1107 <isEqual+0x49>
    10ee:	dd 45 f0             	fldl   -0x10(%ebp)
    10f1:	dc 65 f8             	fsubl  -0x8(%ebp)
    10f4:	dd 05 e8 39 00 00    	fldl   0x39e8
    10fa:	df e9                	fucomip %st(1),%st
    10fc:	dd d8                	fstp   %st(0)
    10fe:	76 07                	jbe    1107 <isEqual+0x49>
    return 1;
    1100:	b8 01 00 00 00       	mov    $0x1,%eax
    1105:	eb 05                	jmp    110c <isEqual+0x4e>
  return 0;
    1107:	b8 00 00 00 00       	mov    $0x0,%eax
}
    110c:	c9                   	leave  
    110d:	c3                   	ret    

0000110e <isCmdName>:

int isCmdName(const char* str)
{
    110e:	55                   	push   %ebp
    110f:	89 e5                	mov    %esp,%ebp
    1111:	53                   	push   %ebx
    1112:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    1115:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    111c:	eb 71                	jmp    118f <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    111e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1121:	89 d0                	mov    %edx,%eax
    1123:	c1 e0 02             	shl    $0x2,%eax
    1126:	01 d0                	add    %edx,%eax
    1128:	01 c0                	add    %eax,%eax
    112a:	05 60 44 00 00       	add    $0x4460,%eax
    112f:	83 ec 0c             	sub    $0xc,%esp
    1132:	50                   	push   %eax
    1133:	e8 1a f1 ff ff       	call   252 <strlen>
    1138:	83 c4 10             	add    $0x10,%esp
    113b:	89 c3                	mov    %eax,%ebx
    113d:	83 ec 0c             	sub    $0xc,%esp
    1140:	ff 75 08             	pushl  0x8(%ebp)
    1143:	e8 f7 fe ff ff       	call   103f <mystrlen>
    1148:	83 c4 10             	add    $0x10,%esp
    114b:	39 c3                	cmp    %eax,%ebx
    114d:	75 3c                	jne    118b <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    114f:	83 ec 0c             	sub    $0xc,%esp
    1152:	ff 75 08             	pushl  0x8(%ebp)
    1155:	e8 e5 fe ff ff       	call   103f <mystrlen>
    115a:	83 c4 10             	add    $0x10,%esp
    115d:	89 c1                	mov    %eax,%ecx
    115f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1162:	89 d0                	mov    %edx,%eax
    1164:	c1 e0 02             	shl    $0x2,%eax
    1167:	01 d0                	add    %edx,%eax
    1169:	01 c0                	add    %eax,%eax
    116b:	05 60 44 00 00       	add    $0x4460,%eax
    1170:	83 ec 04             	sub    $0x4,%esp
    1173:	51                   	push   %ecx
    1174:	ff 75 08             	pushl  0x8(%ebp)
    1177:	50                   	push   %eax
    1178:	e8 6c fe ff ff       	call   fe9 <mystrncmp>
    117d:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1180:	85 c0                	test   %eax,%eax
    1182:	75 07                	jne    118b <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    1184:	b8 01 00 00 00       	mov    $0x1,%eax
    1189:	eb 0f                	jmp    119a <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    118b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    118f:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1193:	7e 89                	jle    111e <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    1195:	b8 00 00 00 00       	mov    $0x0,%eax
}
    119a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    119d:	c9                   	leave  
    119e:	c3                   	ret    

0000119f <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    119f:	55                   	push   %ebp
    11a0:	89 e5                	mov    %esp,%ebp
    11a2:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    11a8:	83 ec 08             	sub    $0x8,%esp
    11ab:	6a 00                	push   $0x0
    11ad:	68 28 45 00 00       	push   $0x4528
    11b2:	e8 9d f2 ff ff       	call   454 <open>
    11b7:	83 c4 10             	add    $0x10,%esp
    11ba:	89 45 dc             	mov    %eax,-0x24(%ebp)
    11bd:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    11c1:	79 0a                	jns    11cd <findAlias+0x2e>
  {
      return 0; //no aliasfile
    11c3:	b8 00 00 00 00       	mov    $0x0,%eax
    11c8:	e9 9a 01 00 00       	jmp    1367 <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    11cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    11d4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    11db:	e9 ee 00 00 00       	jmp    12ce <findAlias+0x12f>
  {
      int isSame = 1;
    11e0:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    11e7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    11ee:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    11f5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    11fc:	83 ec 0c             	sub    $0xc,%esp
    11ff:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1202:	50                   	push   %eax
    1203:	e8 4a f0 ff ff       	call   252 <strlen>
    1208:	83 c4 10             	add    $0x10,%esp
    120b:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    120e:	83 ec 0c             	sub    $0xc,%esp
    1211:	ff 75 08             	pushl  0x8(%ebp)
    1214:	e8 39 f0 ff ff       	call   252 <strlen>
    1219:	83 c4 10             	add    $0x10,%esp
    121c:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    121f:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1222:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1225:	01 d0                	add    %edx,%eax
    1227:	0f b6 00             	movzbl (%eax),%eax
    122a:	3c 21                	cmp    $0x21,%al
    122c:	75 38                	jne    1266 <findAlias+0xc7>
      {
          startIndex++;
    122e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    1232:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    1239:	eb 2b                	jmp    1266 <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    123b:	8d 55 9a             	lea    -0x66(%ebp),%edx
    123e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1241:	01 d0                	add    %edx,%eax
    1243:	0f b6 10             	movzbl (%eax),%edx
    1246:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    1249:	8b 45 08             	mov    0x8(%ebp),%eax
    124c:	01 c8                	add    %ecx,%eax
    124e:	0f b6 00             	movzbl (%eax),%eax
    1251:	38 c2                	cmp    %al,%dl
    1253:	74 09                	je     125e <findAlias+0xbf>
          {
              isSame = 0;
    1255:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    125c:	eb 1f                	jmp    127d <findAlias+0xde>
          }
          startIndex++;
    125e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    1262:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    1266:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1269:	8b 45 e8             	mov    -0x18(%ebp),%eax
    126c:	01 d0                	add    %edx,%eax
    126e:	0f b6 00             	movzbl (%eax),%eax
    1271:	3c 3d                	cmp    $0x3d,%al
    1273:	74 08                	je     127d <findAlias+0xde>
    1275:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1278:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    127b:	7c be                	jl     123b <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    127d:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1280:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1283:	01 d0                	add    %edx,%eax
    1285:	0f b6 00             	movzbl (%eax),%eax
    1288:	3c 3d                	cmp    $0x3d,%al
    128a:	75 08                	jne    1294 <findAlias+0xf5>
    128c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    128f:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1292:	7d 07                	jge    129b <findAlias+0xfc>
      {
          isSame = 0;
    1294:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    129b:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    129f:	75 0b                	jne    12ac <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    12a1:	b8 01 00 00 00       	mov    $0x1,%eax
    12a6:	2b 45 f0             	sub    -0x10(%ebp),%eax
    12a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    12ac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    12b0:	75 1c                	jne    12ce <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    12b2:	83 ec 08             	sub    $0x8,%esp
    12b5:	8d 45 9a             	lea    -0x66(%ebp),%eax
    12b8:	50                   	push   %eax
    12b9:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    12bf:	50                   	push   %eax
    12c0:	e8 1e ef ff ff       	call   1e3 <strcpy>
    12c5:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    12c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    12ce:	83 ec 04             	sub    $0x4,%esp
    12d1:	6a 32                	push   $0x32
    12d3:	8d 45 9a             	lea    -0x66(%ebp),%eax
    12d6:	50                   	push   %eax
    12d7:	ff 75 dc             	pushl  -0x24(%ebp)
    12da:	e8 4d f1 ff ff       	call   42c <read>
    12df:	83 c4 10             	add    $0x10,%esp
    12e2:	89 45 d8             	mov    %eax,-0x28(%ebp)
    12e5:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    12e9:	0f 8f f1 fe ff ff    	jg     11e0 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    12ef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    12f3:	75 5f                	jne    1354 <findAlias+0x1b5>
  {
    int i = 0;
    12f5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    12fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    1300:	eb 20                	jmp    1322 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    1302:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1305:	8b 45 0c             	mov    0xc(%ebp),%eax
    1308:	01 c2                	add    %eax,%edx
    130a:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    1310:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1313:	01 c8                	add    %ecx,%eax
    1315:	0f b6 00             	movzbl (%eax),%eax
    1318:	88 02                	mov    %al,(%edx)
      i++;
    131a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    131e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    1322:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    1328:	8b 45 f4             	mov    -0xc(%ebp),%eax
    132b:	01 d0                	add    %edx,%eax
    132d:	0f b6 00             	movzbl (%eax),%eax
    1330:	84 c0                	test   %al,%al
    1332:	75 ce                	jne    1302 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    1334:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1337:	8b 45 0c             	mov    0xc(%ebp),%eax
    133a:	01 d0                	add    %edx,%eax
    133c:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    133f:	83 ec 0c             	sub    $0xc,%esp
    1342:	ff 75 dc             	pushl  -0x24(%ebp)
    1345:	e8 f2 f0 ff ff       	call   43c <close>
    134a:	83 c4 10             	add    $0x10,%esp
    return 1;
    134d:	b8 01 00 00 00       	mov    $0x1,%eax
    1352:	eb 13                	jmp    1367 <findAlias+0x1c8>
  }
  close(fd);
    1354:	83 ec 0c             	sub    $0xc,%esp
    1357:	ff 75 dc             	pushl  -0x24(%ebp)
    135a:	e8 dd f0 ff ff       	call   43c <close>
    135f:	83 c4 10             	add    $0x10,%esp
  return 0;
    1362:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1367:	c9                   	leave  
    1368:	c3                   	ret    

00001369 <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    1369:	55                   	push   %ebp
    136a:	89 e5                	mov    %esp,%ebp
    136c:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    136f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1373:	75 05                	jne    137a <runcmd+0x11>
    exit();
    1375:	e8 9a f0 ff ff       	call   414 <exit>
  
  switch(cmd->type){
    137a:	8b 45 08             	mov    0x8(%ebp),%eax
    137d:	8b 00                	mov    (%eax),%eax
    137f:	83 f8 05             	cmp    $0x5,%eax
    1382:	77 09                	ja     138d <runcmd+0x24>
    1384:	8b 04 85 4c 38 00 00 	mov    0x384c(,%eax,4),%eax
    138b:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    138d:	83 ec 0c             	sub    $0xc,%esp
    1390:	68 20 38 00 00       	push   $0x3820
    1395:	e8 0b f7 ff ff       	call   aa5 <panic1>
    139a:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    139d:	8b 45 08             	mov    0x8(%ebp),%eax
    13a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    13a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13a6:	8b 40 04             	mov    0x4(%eax),%eax
    13a9:	85 c0                	test   %eax,%eax
    13ab:	75 05                	jne    13b2 <runcmd+0x49>
      exit();
    13ad:	e8 62 f0 ff ff       	call   414 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    13b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13b5:	8b 40 04             	mov    0x4(%eax),%eax
    13b8:	83 ec 0c             	sub    $0xc,%esp
    13bb:	50                   	push   %eax
    13bc:	e8 4d fd ff ff       	call   110e <isCmdName>
    13c1:	83 c4 10             	add    $0x10,%esp
    13c4:	85 c0                	test   %eax,%eax
    13c6:	75 37                	jne    13ff <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    13c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13cb:	8b 40 04             	mov    0x4(%eax),%eax
    13ce:	83 ec 08             	sub    $0x8,%esp
    13d1:	8d 55 ce             	lea    -0x32(%ebp),%edx
    13d4:	52                   	push   %edx
    13d5:	50                   	push   %eax
    13d6:	e8 c4 fd ff ff       	call   119f <findAlias>
    13db:	83 c4 10             	add    $0x10,%esp
    13de:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    13e1:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    13e5:	75 31                	jne    1418 <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    13e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13ea:	83 c0 04             	add    $0x4,%eax
    13ed:	83 ec 08             	sub    $0x8,%esp
    13f0:	50                   	push   %eax
    13f1:	8d 45 ce             	lea    -0x32(%ebp),%eax
    13f4:	50                   	push   %eax
    13f5:	e8 52 f0 ff ff       	call   44c <exec>
    13fa:	83 c4 10             	add    $0x10,%esp
    13fd:	eb 19                	jmp    1418 <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    13ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1402:	8d 50 04             	lea    0x4(%eax),%edx
    1405:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1408:	8b 40 04             	mov    0x4(%eax),%eax
    140b:	83 ec 08             	sub    $0x8,%esp
    140e:	52                   	push   %edx
    140f:	50                   	push   %eax
    1410:	e8 37 f0 ff ff       	call   44c <exec>
    1415:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    1418:	8b 45 f4             	mov    -0xc(%ebp),%eax
    141b:	8b 40 04             	mov    0x4(%eax),%eax
    141e:	83 ec 04             	sub    $0x4,%esp
    1421:	50                   	push   %eax
    1422:	68 27 38 00 00       	push   $0x3827
    1427:	6a 02                	push   $0x2
    1429:	e8 92 f2 ff ff       	call   6c0 <printf>
    142e:	83 c4 10             	add    $0x10,%esp
    break;
    1431:	e9 c6 01 00 00       	jmp    15fc <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    1436:	8b 45 08             	mov    0x8(%ebp),%eax
    1439:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    143c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    143f:	8b 40 14             	mov    0x14(%eax),%eax
    1442:	83 ec 0c             	sub    $0xc,%esp
    1445:	50                   	push   %eax
    1446:	e8 f1 ef ff ff       	call   43c <close>
    144b:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    144e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1451:	8b 50 10             	mov    0x10(%eax),%edx
    1454:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1457:	8b 40 08             	mov    0x8(%eax),%eax
    145a:	83 ec 08             	sub    $0x8,%esp
    145d:	52                   	push   %edx
    145e:	50                   	push   %eax
    145f:	e8 f0 ef ff ff       	call   454 <open>
    1464:	83 c4 10             	add    $0x10,%esp
    1467:	85 c0                	test   %eax,%eax
    1469:	79 1e                	jns    1489 <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    146b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    146e:	8b 40 08             	mov    0x8(%eax),%eax
    1471:	83 ec 04             	sub    $0x4,%esp
    1474:	50                   	push   %eax
    1475:	68 37 38 00 00       	push   $0x3837
    147a:	6a 02                	push   $0x2
    147c:	e8 3f f2 ff ff       	call   6c0 <printf>
    1481:	83 c4 10             	add    $0x10,%esp
      exit();
    1484:	e8 8b ef ff ff       	call   414 <exit>
    }
    runcmd(rcmd->cmd);
    1489:	8b 45 ec             	mov    -0x14(%ebp),%eax
    148c:	8b 40 04             	mov    0x4(%eax),%eax
    148f:	83 ec 0c             	sub    $0xc,%esp
    1492:	50                   	push   %eax
    1493:	e8 d1 fe ff ff       	call   1369 <runcmd>
    1498:	83 c4 10             	add    $0x10,%esp
    break;
    149b:	e9 5c 01 00 00       	jmp    15fc <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    14a0:	8b 45 08             	mov    0x8(%ebp),%eax
    14a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    14a6:	e8 84 f9 ff ff       	call   e2f <fork1>
    14ab:	85 c0                	test   %eax,%eax
    14ad:	75 12                	jne    14c1 <runcmd+0x158>
      runcmd(lcmd->left);
    14af:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14b2:	8b 40 04             	mov    0x4(%eax),%eax
    14b5:	83 ec 0c             	sub    $0xc,%esp
    14b8:	50                   	push   %eax
    14b9:	e8 ab fe ff ff       	call   1369 <runcmd>
    14be:	83 c4 10             	add    $0x10,%esp
    wait();
    14c1:	e8 56 ef ff ff       	call   41c <wait>
    runcmd(lcmd->right);
    14c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14c9:	8b 40 08             	mov    0x8(%eax),%eax
    14cc:	83 ec 0c             	sub    $0xc,%esp
    14cf:	50                   	push   %eax
    14d0:	e8 94 fe ff ff       	call   1369 <runcmd>
    14d5:	83 c4 10             	add    $0x10,%esp
    break;
    14d8:	e9 1f 01 00 00       	jmp    15fc <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    14dd:	8b 45 08             	mov    0x8(%ebp),%eax
    14e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    14e3:	83 ec 0c             	sub    $0xc,%esp
    14e6:	8d 45 d8             	lea    -0x28(%ebp),%eax
    14e9:	50                   	push   %eax
    14ea:	e8 35 ef ff ff       	call   424 <pipe>
    14ef:	83 c4 10             	add    $0x10,%esp
    14f2:	85 c0                	test   %eax,%eax
    14f4:	79 10                	jns    1506 <runcmd+0x19d>
      panic1("pipe");
    14f6:	83 ec 0c             	sub    $0xc,%esp
    14f9:	68 47 38 00 00       	push   $0x3847
    14fe:	e8 a2 f5 ff ff       	call   aa5 <panic1>
    1503:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    1506:	e8 24 f9 ff ff       	call   e2f <fork1>
    150b:	85 c0                	test   %eax,%eax
    150d:	75 4c                	jne    155b <runcmd+0x1f2>
      close(1);
    150f:	83 ec 0c             	sub    $0xc,%esp
    1512:	6a 01                	push   $0x1
    1514:	e8 23 ef ff ff       	call   43c <close>
    1519:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    151c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    151f:	83 ec 0c             	sub    $0xc,%esp
    1522:	50                   	push   %eax
    1523:	e8 64 ef ff ff       	call   48c <dup>
    1528:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    152b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    152e:	83 ec 0c             	sub    $0xc,%esp
    1531:	50                   	push   %eax
    1532:	e8 05 ef ff ff       	call   43c <close>
    1537:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    153a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    153d:	83 ec 0c             	sub    $0xc,%esp
    1540:	50                   	push   %eax
    1541:	e8 f6 ee ff ff       	call   43c <close>
    1546:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    1549:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    154c:	8b 40 04             	mov    0x4(%eax),%eax
    154f:	83 ec 0c             	sub    $0xc,%esp
    1552:	50                   	push   %eax
    1553:	e8 11 fe ff ff       	call   1369 <runcmd>
    1558:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    155b:	e8 cf f8 ff ff       	call   e2f <fork1>
    1560:	85 c0                	test   %eax,%eax
    1562:	75 4c                	jne    15b0 <runcmd+0x247>
      close(0);
    1564:	83 ec 0c             	sub    $0xc,%esp
    1567:	6a 00                	push   $0x0
    1569:	e8 ce ee ff ff       	call   43c <close>
    156e:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    1571:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1574:	83 ec 0c             	sub    $0xc,%esp
    1577:	50                   	push   %eax
    1578:	e8 0f ef ff ff       	call   48c <dup>
    157d:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1580:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1583:	83 ec 0c             	sub    $0xc,%esp
    1586:	50                   	push   %eax
    1587:	e8 b0 ee ff ff       	call   43c <close>
    158c:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    158f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1592:	83 ec 0c             	sub    $0xc,%esp
    1595:	50                   	push   %eax
    1596:	e8 a1 ee ff ff       	call   43c <close>
    159b:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    159e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15a1:	8b 40 08             	mov    0x8(%eax),%eax
    15a4:	83 ec 0c             	sub    $0xc,%esp
    15a7:	50                   	push   %eax
    15a8:	e8 bc fd ff ff       	call   1369 <runcmd>
    15ad:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    15b0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    15b3:	83 ec 0c             	sub    $0xc,%esp
    15b6:	50                   	push   %eax
    15b7:	e8 80 ee ff ff       	call   43c <close>
    15bc:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    15bf:	8b 45 dc             	mov    -0x24(%ebp),%eax
    15c2:	83 ec 0c             	sub    $0xc,%esp
    15c5:	50                   	push   %eax
    15c6:	e8 71 ee ff ff       	call   43c <close>
    15cb:	83 c4 10             	add    $0x10,%esp
    wait();
    15ce:	e8 49 ee ff ff       	call   41c <wait>
    wait();
    15d3:	e8 44 ee ff ff       	call   41c <wait>
    break;
    15d8:	eb 22                	jmp    15fc <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    15da:	8b 45 08             	mov    0x8(%ebp),%eax
    15dd:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    15e0:	e8 4a f8 ff ff       	call   e2f <fork1>
    15e5:	85 c0                	test   %eax,%eax
    15e7:	75 12                	jne    15fb <runcmd+0x292>
      runcmd(bcmd->cmd);
    15e9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    15ec:	8b 40 04             	mov    0x4(%eax),%eax
    15ef:	83 ec 0c             	sub    $0xc,%esp
    15f2:	50                   	push   %eax
    15f3:	e8 71 fd ff ff       	call   1369 <runcmd>
    15f8:	83 c4 10             	add    $0x10,%esp
    break;
    15fb:	90                   	nop
  }
  exit();
    15fc:	e8 13 ee ff ff       	call   414 <exit>

00001601 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    1601:	55                   	push   %ebp
    1602:	89 e5                	mov    %esp,%ebp
    1604:	83 ec 04             	sub    $0x4,%esp
    1607:	8b 45 08             	mov    0x8(%ebp),%eax
    160a:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    160d:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    1611:	7e 0d                	jle    1620 <isNameChar+0x1f>
    1613:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    1617:	7f 07                	jg     1620 <isNameChar+0x1f>
    return 1;
    1619:	b8 01 00 00 00       	mov    $0x1,%eax
    161e:	eb 38                	jmp    1658 <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    1620:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    1624:	7e 0d                	jle    1633 <isNameChar+0x32>
    1626:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    162a:	7f 07                	jg     1633 <isNameChar+0x32>
    return 1;
    162c:	b8 01 00 00 00       	mov    $0x1,%eax
    1631:	eb 25                	jmp    1658 <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    1633:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    1637:	7e 0d                	jle    1646 <isNameChar+0x45>
    1639:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    163d:	7f 07                	jg     1646 <isNameChar+0x45>
    return 1;
    163f:	b8 01 00 00 00       	mov    $0x1,%eax
    1644:	eb 12                	jmp    1658 <isNameChar+0x57>
  if(ch == '_')
    1646:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    164a:	75 07                	jne    1653 <isNameChar+0x52>
    return 1;
    164c:	b8 01 00 00 00       	mov    $0x1,%eax
    1651:	eb 05                	jmp    1658 <isNameChar+0x57>
  return 0;
    1653:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1658:	c9                   	leave  
    1659:	c3                   	ret    

0000165a <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    165a:	55                   	push   %ebp
    165b:	89 e5                	mov    %esp,%ebp
    165d:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    1660:	8b 45 08             	mov    0x8(%ebp),%eax
    1663:	8b 40 04             	mov    0x4(%eax),%eax
    1666:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    1669:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    1670:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    1677:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    167e:	eb 1d                	jmp    169d <runCalcmd+0x43>
  {
    if(line[i] == '=')
    1680:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1683:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1686:	01 d0                	add    %edx,%eax
    1688:	0f b6 00             	movzbl (%eax),%eax
    168b:	3c 3d                	cmp    $0x3d,%al
    168d:	75 0a                	jne    1699 <runCalcmd+0x3f>
    {
      hasEqu++;
    168f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    1693:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1696:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    1699:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    169d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    16a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16a3:	01 d0                	add    %edx,%eax
    16a5:	0f b6 00             	movzbl (%eax),%eax
    16a8:	84 c0                	test   %al,%al
    16aa:	75 d4                	jne    1680 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    16ac:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    16b0:	7e 1d                	jle    16cf <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    16b2:	83 ec 0c             	sub    $0xc,%esp
    16b5:	68 64 38 00 00       	push   $0x3864
    16ba:	6a 00                	push   $0x0
    16bc:	6a 00                	push   $0x0
    16be:	6a 01                	push   $0x1
    16c0:	6a 04                	push   $0x4
    16c2:	e8 21 17 00 00       	call   2de8 <color_printf>
    16c7:	83 c4 20             	add    $0x20,%esp
    16ca:	e9 78 05 00 00       	jmp    1c47 <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    16cf:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    16d3:	0f 85 26 05 00 00    	jne    1bff <runCalcmd+0x5a5>
  {
    int i=0;
    16d9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    16e0:	eb 04                	jmp    16e6 <runCalcmd+0x8c>
    {
      i++;
    16e2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    16e6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    16e9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16ec:	01 d0                	add    %edx,%eax
    16ee:	0f b6 00             	movzbl (%eax),%eax
    16f1:	3c 20                	cmp    $0x20,%al
    16f3:	74 ed                	je     16e2 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    16f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    16fb:	eb 23                	jmp    1720 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    16fd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1700:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1703:	01 d0                	add    %edx,%eax
    1705:	0f b6 00             	movzbl (%eax),%eax
    1708:	0f be c0             	movsbl %al,%eax
    170b:	83 ec 0c             	sub    $0xc,%esp
    170e:	50                   	push   %eax
    170f:	e8 ed fe ff ff       	call   1601 <isNameChar>
    1714:	83 c4 10             	add    $0x10,%esp
    1717:	83 f8 01             	cmp    $0x1,%eax
    171a:	75 0e                	jne    172a <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    171c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1720:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1723:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1726:	7c d5                	jl     16fd <runCalcmd+0xa3>
    1728:	eb 01                	jmp    172b <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    172a:	90                   	nop
    }
    int len = i-startIndex;
    172b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    172e:	2b 45 d0             	sub    -0x30(%ebp),%eax
    1731:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    1734:	eb 04                	jmp    173a <runCalcmd+0xe0>
    {
      i++;
    1736:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    173a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    173d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1740:	01 d0                	add    %edx,%eax
    1742:	0f b6 00             	movzbl (%eax),%eax
    1745:	3c 20                	cmp    $0x20,%al
    1747:	74 ed                	je     1736 <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    1749:	8b 45 e8             	mov    -0x18(%ebp),%eax
    174c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    174f:	0f 85 90 04 00 00    	jne    1be5 <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    1755:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1758:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    175b:	01 d0                	add    %edx,%eax
    175d:	0f b6 00             	movzbl (%eax),%eax
    1760:	3c 2f                	cmp    $0x2f,%al
    1762:	7e 2c                	jle    1790 <runCalcmd+0x136>
    1764:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1767:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    176a:	01 d0                	add    %edx,%eax
    176c:	0f b6 00             	movzbl (%eax),%eax
    176f:	3c 39                	cmp    $0x39,%al
    1771:	7f 1d                	jg     1790 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    1773:	83 ec 0c             	sub    $0xc,%esp
    1776:	68 80 38 00 00       	push   $0x3880
    177b:	6a 00                	push   $0x0
    177d:	6a 00                	push   $0x0
    177f:	6a 01                	push   $0x1
    1781:	6a 04                	push   $0x4
    1783:	e8 60 16 00 00       	call   2de8 <color_printf>
    1788:	83 c4 20             	add    $0x20,%esp
    178b:	e9 b7 04 00 00       	jmp    1c47 <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1790:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1797:	eb 20                	jmp    17b9 <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    1799:	8b 55 d0             	mov    -0x30(%ebp),%edx
    179c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    179f:	01 d0                	add    %edx,%eax
    17a1:	89 c2                	mov    %eax,%edx
    17a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17a6:	01 d0                	add    %edx,%eax
    17a8:	0f b6 00             	movzbl (%eax),%eax
    17ab:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    17ae:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    17b1:	01 ca                	add    %ecx,%edx
    17b3:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    17b5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    17b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    17bc:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    17bf:	7c d8                	jl     1799 <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    17c1:	8d 55 94             	lea    -0x6c(%ebp),%edx
    17c4:	8b 45 cc             	mov    -0x34(%ebp),%eax
    17c7:	01 d0                	add    %edx,%eax
    17c9:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    17cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17cf:	83 c0 01             	add    $0x1,%eax
    17d2:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    17d5:	eb 04                	jmp    17db <runCalcmd+0x181>
        {
          i++;
    17d7:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    17db:	8b 55 e0             	mov    -0x20(%ebp),%edx
    17de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17e1:	01 d0                	add    %edx,%eax
    17e3:	0f b6 00             	movzbl (%eax),%eax
    17e6:	3c 20                	cmp    $0x20,%al
    17e8:	74 ed                	je     17d7 <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    17ea:	8b 55 e0             	mov    -0x20(%ebp),%edx
    17ed:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17f0:	01 d0                	add    %edx,%eax
    17f2:	0f b6 00             	movzbl (%eax),%eax
    17f5:	3c 60                	cmp    $0x60,%al
    17f7:	0f 85 e6 01 00 00    	jne    19e3 <runCalcmd+0x389>
        {
          i++;
    17fd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    1801:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1804:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    1807:	eb 04                	jmp    180d <runCalcmd+0x1b3>
          {
            i++;
    1809:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    180d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1810:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1813:	01 d0                	add    %edx,%eax
    1815:	0f b6 00             	movzbl (%eax),%eax
    1818:	3c 60                	cmp    $0x60,%al
    181a:	74 0f                	je     182b <runCalcmd+0x1d1>
    181c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    181f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1822:	01 d0                	add    %edx,%eax
    1824:	0f b6 00             	movzbl (%eax),%eax
    1827:	84 c0                	test   %al,%al
    1829:	75 de                	jne    1809 <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    182b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    182e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1831:	01 d0                	add    %edx,%eax
    1833:	0f b6 00             	movzbl (%eax),%eax
    1836:	3c 60                	cmp    $0x60,%al
    1838:	0f 85 5c 01 00 00    	jne    199a <runCalcmd+0x340>
    183e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1841:	8d 50 01             	lea    0x1(%eax),%edx
    1844:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1847:	01 d0                	add    %edx,%eax
    1849:	0f b6 00             	movzbl (%eax),%eax
    184c:	84 c0                	test   %al,%al
    184e:	0f 85 46 01 00 00    	jne    199a <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    1854:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1857:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    185a:	01 d0                	add    %edx,%eax
    185c:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    185f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    1862:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1865:	01 d0                	add    %edx,%eax
    1867:	83 ec 0c             	sub    $0xc,%esp
    186a:	50                   	push   %eax
    186b:	e8 c5 04 00 00       	call   1d35 <Compute>
    1870:	83 c4 10             	add    $0x10,%esp
    1873:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    1876:	dd 05 f0 39 00 00    	fldl   0x39f0
    187c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1880:	dd 1c 24             	fstpl  (%esp)
    1883:	ff 75 c4             	pushl  -0x3c(%ebp)
    1886:	ff 75 c0             	pushl  -0x40(%ebp)
    1889:	e8 30 f8 ff ff       	call   10be <isEqual>
    188e:	83 c4 10             	add    $0x10,%esp
    1891:	85 c0                	test   %eax,%eax
    1893:	0f 85 ad 03 00 00    	jne    1c46 <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    1899:	a1 6c 45 00 00       	mov    0x456c,%eax
    189e:	85 c0                	test   %eax,%eax
    18a0:	75 15                	jne    18b7 <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    18a2:	83 ec 08             	sub    $0x8,%esp
    18a5:	68 6c 45 00 00       	push   $0x456c
    18aa:	68 a0 47 00 00       	push   $0x47a0
    18af:	e8 ba 19 00 00       	call   326e <readVariables>
    18b4:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    18b7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    18be:	eb 26                	jmp    18e6 <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    18c0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    18c3:	c1 e0 05             	shl    $0x5,%eax
    18c6:	05 a0 47 00 00       	add    $0x47a0,%eax
    18cb:	8d 50 04             	lea    0x4(%eax),%edx
    18ce:	83 ec 08             	sub    $0x8,%esp
    18d1:	8d 45 94             	lea    -0x6c(%ebp),%eax
    18d4:	50                   	push   %eax
    18d5:	52                   	push   %edx
    18d6:	e8 38 e9 ff ff       	call   213 <strcmp>
    18db:	83 c4 10             	add    $0x10,%esp
    18de:	85 c0                	test   %eax,%eax
    18e0:	74 10                	je     18f2 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    18e2:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    18e6:	a1 6c 45 00 00       	mov    0x456c,%eax
    18eb:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    18ee:	7c d0                	jl     18c0 <runCalcmd+0x266>
    18f0:	eb 01                	jmp    18f3 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    18f2:	90                   	nop
              }
              if(index == v_num) //new variable
    18f3:	a1 6c 45 00 00       	mov    0x456c,%eax
    18f8:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    18fb:	75 3c                	jne    1939 <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    18fd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1900:	c1 e0 05             	shl    $0x5,%eax
    1903:	05 a0 47 00 00       	add    $0x47a0,%eax
    1908:	8d 50 04             	lea    0x4(%eax),%edx
    190b:	83 ec 08             	sub    $0x8,%esp
    190e:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1911:	50                   	push   %eax
    1912:	52                   	push   %edx
    1913:	e8 cb e8 ff ff       	call   1e3 <strcpy>
    1918:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    191b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    191e:	c1 e0 05             	shl    $0x5,%eax
    1921:	05 a0 47 00 00       	add    $0x47a0,%eax
    1926:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    192c:	a1 6c 45 00 00       	mov    0x456c,%eax
    1931:	83 c0 01             	add    $0x1,%eax
    1934:	a3 6c 45 00 00       	mov    %eax,0x456c
              }
              variables[index].value.dvalue = result;
    1939:	8b 45 dc             	mov    -0x24(%ebp),%eax
    193c:	c1 e0 05             	shl    $0x5,%eax
    193f:	05 b0 47 00 00       	add    $0x47b0,%eax
    1944:	dd 45 c0             	fldl   -0x40(%ebp)
    1947:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    194a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    194d:	c1 e0 05             	shl    $0x5,%eax
    1950:	05 b0 47 00 00       	add    $0x47b0,%eax
    1955:	dd 40 08             	fldl   0x8(%eax)
    1958:	8b 45 dc             	mov    -0x24(%ebp),%eax
    195b:	c1 e0 05             	shl    $0x5,%eax
    195e:	05 a0 47 00 00       	add    $0x47a0,%eax
    1963:	83 c0 04             	add    $0x4,%eax
    1966:	83 ec 0c             	sub    $0xc,%esp
    1969:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    196d:	dd 1c 24             	fstpl  (%esp)
    1970:	50                   	push   %eax
    1971:	68 aa 38 00 00       	push   $0x38aa
    1976:	6a 01                	push   $0x1
    1978:	e8 43 ed ff ff       	call   6c0 <printf>
    197d:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1980:	83 ec 08             	sub    $0x8,%esp
    1983:	68 6c 45 00 00       	push   $0x456c
    1988:	68 a0 47 00 00       	push   $0x47a0
    198d:	e8 90 1b 00 00       	call   3522 <writeVariables>
    1992:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1995:	e9 ac 02 00 00       	jmp    1c46 <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    199a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    199d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19a0:	01 d0                	add    %edx,%eax
    19a2:	0f b6 00             	movzbl (%eax),%eax
    19a5:	84 c0                	test   %al,%al
    19a7:	75 1d                	jne    19c6 <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    19a9:	83 ec 0c             	sub    $0xc,%esp
    19ac:	68 b1 38 00 00       	push   $0x38b1
    19b1:	6a 00                	push   $0x0
    19b3:	6a 00                	push   $0x0
    19b5:	6a 01                	push   $0x1
    19b7:	6a 04                	push   $0x4
    19b9:	e8 2a 14 00 00       	call   2de8 <color_printf>
    19be:	83 c4 20             	add    $0x20,%esp
    19c1:	e9 81 02 00 00       	jmp    1c47 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    19c6:	83 ec 0c             	sub    $0xc,%esp
    19c9:	68 c8 38 00 00       	push   $0x38c8
    19ce:	6a 00                	push   $0x0
    19d0:	6a 00                	push   $0x0
    19d2:	6a 01                	push   $0x1
    19d4:	6a 04                	push   $0x4
    19d6:	e8 0d 14 00 00       	call   2de8 <color_printf>
    19db:	83 c4 20             	add    $0x20,%esp
    19de:	e9 64 02 00 00       	jmp    1c47 <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    19e3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19e6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19e9:	01 d0                	add    %edx,%eax
    19eb:	0f b6 00             	movzbl (%eax),%eax
    19ee:	3c 22                	cmp    $0x22,%al
    19f0:	0f 85 d5 01 00 00    	jne    1bcb <runCalcmd+0x571>
        {
          i++;
    19f6:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    19fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
    19fd:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1a00:	eb 04                	jmp    1a06 <runCalcmd+0x3ac>
          {
            i++;
    1a02:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1a06:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a09:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a0c:	01 d0                	add    %edx,%eax
    1a0e:	0f b6 00             	movzbl (%eax),%eax
    1a11:	3c 22                	cmp    $0x22,%al
    1a13:	74 0f                	je     1a24 <runCalcmd+0x3ca>
    1a15:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a18:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a1b:	01 d0                	add    %edx,%eax
    1a1d:	0f b6 00             	movzbl (%eax),%eax
    1a20:	84 c0                	test   %al,%al
    1a22:	75 de                	jne    1a02 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1a24:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a27:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a2a:	01 d0                	add    %edx,%eax
    1a2c:	0f b6 00             	movzbl (%eax),%eax
    1a2f:	3c 22                	cmp    $0x22,%al
    1a31:	0f 85 4e 01 00 00    	jne    1b85 <runCalcmd+0x52b>
    1a37:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1a3a:	8d 50 01             	lea    0x1(%eax),%edx
    1a3d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a40:	01 d0                	add    %edx,%eax
    1a42:	0f b6 00             	movzbl (%eax),%eax
    1a45:	84 c0                	test   %al,%al
    1a47:	0f 85 38 01 00 00    	jne    1b85 <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1a4d:	a1 6c 45 00 00       	mov    0x456c,%eax
    1a52:	85 c0                	test   %eax,%eax
    1a54:	75 15                	jne    1a6b <runCalcmd+0x411>
              readVariables(variables,&v_num);
    1a56:	83 ec 08             	sub    $0x8,%esp
    1a59:	68 6c 45 00 00       	push   $0x456c
    1a5e:	68 a0 47 00 00       	push   $0x47a0
    1a63:	e8 06 18 00 00       	call   326e <readVariables>
    1a68:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1a6b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1a72:	eb 26                	jmp    1a9a <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    1a74:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a77:	c1 e0 05             	shl    $0x5,%eax
    1a7a:	05 a0 47 00 00       	add    $0x47a0,%eax
    1a7f:	8d 50 04             	lea    0x4(%eax),%edx
    1a82:	83 ec 08             	sub    $0x8,%esp
    1a85:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1a88:	50                   	push   %eax
    1a89:	52                   	push   %edx
    1a8a:	e8 84 e7 ff ff       	call   213 <strcmp>
    1a8f:	83 c4 10             	add    $0x10,%esp
    1a92:	85 c0                	test   %eax,%eax
    1a94:	74 10                	je     1aa6 <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    1a96:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1a9a:	a1 6c 45 00 00       	mov    0x456c,%eax
    1a9f:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1aa2:	7c d0                	jl     1a74 <runCalcmd+0x41a>
    1aa4:	eb 01                	jmp    1aa7 <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    1aa6:	90                   	nop
            }
            if(index == v_num) //new variable
    1aa7:	a1 6c 45 00 00       	mov    0x456c,%eax
    1aac:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1aaf:	75 2b                	jne    1adc <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1ab1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1ab4:	c1 e0 05             	shl    $0x5,%eax
    1ab7:	05 a0 47 00 00       	add    $0x47a0,%eax
    1abc:	8d 50 04             	lea    0x4(%eax),%edx
    1abf:	83 ec 08             	sub    $0x8,%esp
    1ac2:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1ac5:	50                   	push   %eax
    1ac6:	52                   	push   %edx
    1ac7:	e8 17 e7 ff ff       	call   1e3 <strcpy>
    1acc:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1acf:	a1 6c 45 00 00       	mov    0x456c,%eax
    1ad4:	83 c0 01             	add    $0x1,%eax
    1ad7:	a3 6c 45 00 00       	mov    %eax,0x456c
            }
            variables[index].type = V_STRING;
    1adc:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1adf:	c1 e0 05             	shl    $0x5,%eax
    1ae2:	05 a0 47 00 00       	add    $0x47a0,%eax
    1ae7:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1aed:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1af0:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1af3:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1af6:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1af9:	83 c0 01             	add    $0x1,%eax
    1afc:	83 ec 0c             	sub    $0xc,%esp
    1aff:	50                   	push   %eax
    1b00:	e8 bd ee ff ff       	call   9c2 <malloc>
    1b05:	83 c4 10             	add    $0x10,%esp
    1b08:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1b0b:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1b0e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b11:	01 d0                	add    %edx,%eax
    1b13:	83 ec 08             	sub    $0x8,%esp
    1b16:	50                   	push   %eax
    1b17:	ff 75 b4             	pushl  -0x4c(%ebp)
    1b1a:	e8 c4 e6 ff ff       	call   1e3 <strcpy>
    1b1f:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1b22:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1b25:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1b28:	01 d0                	add    %edx,%eax
    1b2a:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1b2d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1b30:	c1 e0 05             	shl    $0x5,%eax
    1b33:	8d 90 b8 47 00 00    	lea    0x47b8(%eax),%edx
    1b39:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1b3c:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1b3e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1b41:	c1 e0 05             	shl    $0x5,%eax
    1b44:	05 b8 47 00 00       	add    $0x47b8,%eax
    1b49:	8b 00                	mov    (%eax),%eax
    1b4b:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1b4e:	c1 e2 05             	shl    $0x5,%edx
    1b51:	81 c2 a0 47 00 00    	add    $0x47a0,%edx
    1b57:	83 c2 04             	add    $0x4,%edx
    1b5a:	50                   	push   %eax
    1b5b:	52                   	push   %edx
    1b5c:	68 e9 38 00 00       	push   $0x38e9
    1b61:	6a 01                	push   $0x1
    1b63:	e8 58 eb ff ff       	call   6c0 <printf>
    1b68:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1b6b:	83 ec 08             	sub    $0x8,%esp
    1b6e:	68 6c 45 00 00       	push   $0x456c
    1b73:	68 a0 47 00 00       	push   $0x47a0
    1b78:	e8 a5 19 00 00       	call   3522 <writeVariables>
    1b7d:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1b80:	e9 c2 00 00 00       	jmp    1c47 <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1b85:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b88:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b8b:	01 d0                	add    %edx,%eax
    1b8d:	0f b6 00             	movzbl (%eax),%eax
    1b90:	84 c0                	test   %al,%al
    1b92:	75 1d                	jne    1bb1 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1b94:	83 ec 0c             	sub    $0xc,%esp
    1b97:	68 f2 38 00 00       	push   $0x38f2
    1b9c:	6a 00                	push   $0x0
    1b9e:	6a 00                	push   $0x0
    1ba0:	6a 01                	push   $0x1
    1ba2:	6a 04                	push   $0x4
    1ba4:	e8 3f 12 00 00       	call   2de8 <color_printf>
    1ba9:	83 c4 20             	add    $0x20,%esp
    1bac:	e9 96 00 00 00       	jmp    1c47 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1bb1:	83 ec 0c             	sub    $0xc,%esp
    1bb4:	68 08 39 00 00       	push   $0x3908
    1bb9:	6a 00                	push   $0x0
    1bbb:	6a 00                	push   $0x0
    1bbd:	6a 01                	push   $0x1
    1bbf:	6a 04                	push   $0x4
    1bc1:	e8 22 12 00 00       	call   2de8 <color_printf>
    1bc6:	83 c4 20             	add    $0x20,%esp
    1bc9:	eb 7c                	jmp    1c47 <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1bcb:	83 ec 0c             	sub    $0xc,%esp
    1bce:	68 29 39 00 00       	push   $0x3929
    1bd3:	6a 00                	push   $0x0
    1bd5:	6a 00                	push   $0x0
    1bd7:	6a 01                	push   $0x1
    1bd9:	6a 04                	push   $0x4
    1bdb:	e8 08 12 00 00       	call   2de8 <color_printf>
    1be0:	83 c4 20             	add    $0x20,%esp
    1be3:	eb 62                	jmp    1c47 <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1be5:	83 ec 0c             	sub    $0xc,%esp
    1be8:	68 29 39 00 00       	push   $0x3929
    1bed:	6a 00                	push   $0x0
    1bef:	6a 00                	push   $0x0
    1bf1:	6a 01                	push   $0x1
    1bf3:	6a 04                	push   $0x4
    1bf5:	e8 ee 11 00 00       	call   2de8 <color_printf>
    1bfa:	83 c4 20             	add    $0x20,%esp
    1bfd:	eb 48                	jmp    1c47 <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1bff:	83 ec 0c             	sub    $0xc,%esp
    1c02:	ff 75 d4             	pushl  -0x2c(%ebp)
    1c05:	e8 2b 01 00 00       	call   1d35 <Compute>
    1c0a:	83 c4 10             	add    $0x10,%esp
    1c0d:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1c10:	dd 05 f0 39 00 00    	fldl   0x39f0
    1c16:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1c1a:	dd 1c 24             	fstpl  (%esp)
    1c1d:	ff 75 ac             	pushl  -0x54(%ebp)
    1c20:	ff 75 a8             	pushl  -0x58(%ebp)
    1c23:	e8 96 f4 ff ff       	call   10be <isEqual>
    1c28:	83 c4 10             	add    $0x10,%esp
    1c2b:	85 c0                	test   %eax,%eax
    1c2d:	75 18                	jne    1c47 <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1c2f:	ff 75 ac             	pushl  -0x54(%ebp)
    1c32:	ff 75 a8             	pushl  -0x58(%ebp)
    1c35:	68 41 39 00 00       	push   $0x3941
    1c3a:	6a 01                	push   $0x1
    1c3c:	e8 7f ea ff ff       	call   6c0 <printf>
    1c41:	83 c4 10             	add    $0x10,%esp
    1c44:	eb 01                	jmp    1c47 <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1c46:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1c47:	e8 c8 e7 ff ff       	call   414 <exit>

00001c4c <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1c4c:	55                   	push   %ebp
    1c4d:	89 e5                	mov    %esp,%ebp
    1c4f:	83 ec 04             	sub    $0x4,%esp
    1c52:	8b 45 08             	mov    0x8(%ebp),%eax
    1c55:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1c58:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1c5c:	83 e8 23             	sub    $0x23,%eax
    1c5f:	83 f8 0c             	cmp    $0xc,%eax
    1c62:	77 25                	ja     1c89 <GetLevel+0x3d>
    1c64:	8b 04 85 48 39 00 00 	mov    0x3948(,%eax,4),%eax
    1c6b:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1c6d:	b8 01 00 00 00       	mov    $0x1,%eax
    1c72:	eb 1a                	jmp    1c8e <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1c74:	b8 02 00 00 00       	mov    $0x2,%eax
    1c79:	eb 13                	jmp    1c8e <GetLevel+0x42>
    case '(':
        return 0;
    1c7b:	b8 00 00 00 00       	mov    $0x0,%eax
    1c80:	eb 0c                	jmp    1c8e <GetLevel+0x42>
    case '#':
        return -2;
    1c82:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1c87:	eb 05                	jmp    1c8e <GetLevel+0x42>
    };
    return -1;
    1c89:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1c8e:	c9                   	leave  
    1c8f:	c3                   	ret    

00001c90 <Operate>:

double Operate(double a1, char op, double a2)
{
    1c90:	55                   	push   %ebp
    1c91:	89 e5                	mov    %esp,%ebp
    1c93:	83 ec 28             	sub    $0x28,%esp
    1c96:	8b 45 10             	mov    0x10(%ebp),%eax
    1c99:	8b 55 08             	mov    0x8(%ebp),%edx
    1c9c:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1c9f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1ca2:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1ca5:	88 45 ec             	mov    %al,-0x14(%ebp)
    1ca8:	8b 45 14             	mov    0x14(%ebp),%eax
    1cab:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1cae:	8b 45 18             	mov    0x18(%ebp),%eax
    1cb1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1cb4:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1cb8:	83 f8 2b             	cmp    $0x2b,%eax
    1cbb:	74 18                	je     1cd5 <Operate+0x45>
    1cbd:	83 f8 2b             	cmp    $0x2b,%eax
    1cc0:	7f 07                	jg     1cc9 <Operate+0x39>
    1cc2:	83 f8 2a             	cmp    $0x2a,%eax
    1cc5:	74 1e                	je     1ce5 <Operate+0x55>
    1cc7:	eb 68                	jmp    1d31 <Operate+0xa1>
    1cc9:	83 f8 2d             	cmp    $0x2d,%eax
    1ccc:	74 0f                	je     1cdd <Operate+0x4d>
    1cce:	83 f8 2f             	cmp    $0x2f,%eax
    1cd1:	74 1a                	je     1ced <Operate+0x5d>
    1cd3:	eb 5c                	jmp    1d31 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1cd5:	dd 45 f0             	fldl   -0x10(%ebp)
    1cd8:	dc 45 e0             	faddl  -0x20(%ebp)
    1cdb:	eb 56                	jmp    1d33 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1cdd:	dd 45 f0             	fldl   -0x10(%ebp)
    1ce0:	dc 65 e0             	fsubl  -0x20(%ebp)
    1ce3:	eb 4e                	jmp    1d33 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1ce5:	dd 45 f0             	fldl   -0x10(%ebp)
    1ce8:	dc 4d e0             	fmull  -0x20(%ebp)
    1ceb:	eb 46                	jmp    1d33 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1ced:	d9 ee                	fldz   
    1cef:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1cf3:	dd 1c 24             	fstpl  (%esp)
    1cf6:	ff 75 e4             	pushl  -0x1c(%ebp)
    1cf9:	ff 75 e0             	pushl  -0x20(%ebp)
    1cfc:	e8 bd f3 ff ff       	call   10be <isEqual>
    1d01:	83 c4 10             	add    $0x10,%esp
    1d04:	83 f8 01             	cmp    $0x1,%eax
    1d07:	75 20                	jne    1d29 <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1d09:	83 ec 0c             	sub    $0xc,%esp
    1d0c:	68 7c 39 00 00       	push   $0x397c
    1d11:	6a 00                	push   $0x0
    1d13:	6a 00                	push   $0x0
    1d15:	6a 01                	push   $0x1
    1d17:	6a 04                	push   $0x4
    1d19:	e8 ca 10 00 00       	call   2de8 <color_printf>
    1d1e:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1d21:	dd 05 f0 39 00 00    	fldl   0x39f0
    1d27:	eb 0a                	jmp    1d33 <Operate+0xa3>
        }
        else
          return a1 / a2;
    1d29:	dd 45 f0             	fldl   -0x10(%ebp)
    1d2c:	dc 75 e0             	fdivl  -0x20(%ebp)
    1d2f:	eb 02                	jmp    1d33 <Operate+0xa3>
    };
    return 1;
    1d31:	d9 e8                	fld1   
}
    1d33:	c9                   	leave  
    1d34:	c3                   	ret    

00001d35 <Compute>:

double Compute(char *s)
{
    1d35:	55                   	push   %ebp
    1d36:	89 e5                	mov    %esp,%ebp
    1d38:	53                   	push   %ebx
    1d39:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1d3f:	e8 44 14 00 00       	call   3188 <dstack>
    1d44:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1d47:	e8 73 13 00 00       	call   30bf <cstack>
    1d4c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1d4f:	83 ec 08             	sub    $0x8,%esp
    1d52:	6a 23                	push   $0x23
    1d54:	ff 75 e0             	pushl  -0x20(%ebp)
    1d57:	e8 91 13 00 00       	call   30ed <pushc>
    1d5c:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1d5f:	83 ec 0c             	sub    $0xc,%esp
    1d62:	ff 75 08             	pushl  0x8(%ebp)
    1d65:	e8 e8 e4 ff ff       	call   252 <strlen>
    1d6a:	83 c4 10             	add    $0x10,%esp
    1d6d:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1d70:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1d77:	c7 05 80 47 00 00 00 	movl   $0x0,0x4780
    1d7e:	00 00 00 
    1d81:	e9 58 05 00 00       	jmp    22de <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1d86:	a1 80 47 00 00       	mov    0x4780,%eax
    1d8b:	89 c2                	mov    %eax,%edx
    1d8d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d90:	01 d0                	add    %edx,%eax
    1d92:	0f b6 00             	movzbl (%eax),%eax
    1d95:	3c 24                	cmp    $0x24,%al
    1d97:	0f 85 f8 01 00 00    	jne    1f95 <Compute+0x260>
        {
          is_minus = 0;
    1d9d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1da4:	a1 80 47 00 00       	mov    0x4780,%eax
    1da9:	83 c0 01             	add    $0x1,%eax
    1dac:	a3 80 47 00 00       	mov    %eax,0x4780
          if(s[g_pos] != '{')
    1db1:	a1 80 47 00 00       	mov    0x4780,%eax
    1db6:	89 c2                	mov    %eax,%edx
    1db8:	8b 45 08             	mov    0x8(%ebp),%eax
    1dbb:	01 d0                	add    %edx,%eax
    1dbd:	0f b6 00             	movzbl (%eax),%eax
    1dc0:	3c 7b                	cmp    $0x7b,%al
    1dc2:	74 23                	je     1de7 <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1dc4:	83 ec 0c             	sub    $0xc,%esp
    1dc7:	68 94 39 00 00       	push   $0x3994
    1dcc:	6a 00                	push   $0x0
    1dce:	6a 00                	push   $0x0
    1dd0:	6a 01                	push   $0x1
    1dd2:	6a 04                	push   $0x4
    1dd4:	e8 0f 10 00 00       	call   2de8 <color_printf>
    1dd9:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1ddc:	dd 05 f0 39 00 00    	fldl   0x39f0
    1de2:	e9 24 06 00 00       	jmp    240b <Compute+0x6d6>
          }
          int i=g_pos+1;
    1de7:	a1 80 47 00 00       	mov    0x4780,%eax
    1dec:	83 c0 01             	add    $0x1,%eax
    1def:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1df2:	eb 13                	jmp    1e07 <Compute+0xd2>
          {
            if(s[i] == '}')
    1df4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1df7:	8b 45 08             	mov    0x8(%ebp),%eax
    1dfa:	01 d0                	add    %edx,%eax
    1dfc:	0f b6 00             	movzbl (%eax),%eax
    1dff:	3c 7d                	cmp    $0x7d,%al
    1e01:	74 0e                	je     1e11 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1e03:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1e07:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e0a:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1e0d:	7c e5                	jl     1df4 <Compute+0xbf>
    1e0f:	eb 01                	jmp    1e12 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1e11:	90                   	nop
          }
          if(s[i] != '}')
    1e12:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1e15:	8b 45 08             	mov    0x8(%ebp),%eax
    1e18:	01 d0                	add    %edx,%eax
    1e1a:	0f b6 00             	movzbl (%eax),%eax
    1e1d:	3c 7d                	cmp    $0x7d,%al
    1e1f:	74 23                	je     1e44 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1e21:	83 ec 0c             	sub    $0xc,%esp
    1e24:	68 a2 39 00 00       	push   $0x39a2
    1e29:	6a 00                	push   $0x0
    1e2b:	6a 00                	push   $0x0
    1e2d:	6a 01                	push   $0x1
    1e2f:	6a 04                	push   $0x4
    1e31:	e8 b2 0f 00 00       	call   2de8 <color_printf>
    1e36:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1e39:	dd 05 f0 39 00 00    	fldl   0x39f0
    1e3f:	e9 c7 05 00 00       	jmp    240b <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1e44:	a1 80 47 00 00       	mov    0x4780,%eax
    1e49:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1e4c:	29 c2                	sub    %eax,%edx
    1e4e:	89 d0                	mov    %edx,%eax
    1e50:	83 e8 01             	sub    $0x1,%eax
    1e53:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1e56:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1e5d:	eb 27                	jmp    1e86 <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1e5f:	8b 15 80 47 00 00    	mov    0x4780,%edx
    1e65:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1e68:	01 d0                	add    %edx,%eax
    1e6a:	8d 50 01             	lea    0x1(%eax),%edx
    1e6d:	8b 45 08             	mov    0x8(%ebp),%eax
    1e70:	01 d0                	add    %edx,%eax
    1e72:	0f b6 00             	movzbl (%eax),%eax
    1e75:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1e7b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1e7e:	01 ca                	add    %ecx,%edx
    1e80:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1e82:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1e86:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1e89:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1e8c:	7c d1                	jl     1e5f <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1e8e:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1e94:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1e97:	01 d0                	add    %edx,%eax
    1e99:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1e9c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1ea3:	a1 6c 45 00 00       	mov    0x456c,%eax
    1ea8:	85 c0                	test   %eax,%eax
    1eaa:	75 40                	jne    1eec <Compute+0x1b7>
            readVariables(variables,&v_num);
    1eac:	83 ec 08             	sub    $0x8,%esp
    1eaf:	68 6c 45 00 00       	push   $0x456c
    1eb4:	68 a0 47 00 00       	push   $0x47a0
    1eb9:	e8 b0 13 00 00       	call   326e <readVariables>
    1ebe:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1ec1:	eb 29                	jmp    1eec <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1ec3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ec6:	c1 e0 05             	shl    $0x5,%eax
    1ec9:	05 a0 47 00 00       	add    $0x47a0,%eax
    1ece:	8d 50 04             	lea    0x4(%eax),%edx
    1ed1:	83 ec 08             	sub    $0x8,%esp
    1ed4:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1eda:	50                   	push   %eax
    1edb:	52                   	push   %edx
    1edc:	e8 32 e3 ff ff       	call   213 <strcmp>
    1ee1:	83 c4 10             	add    $0x10,%esp
    1ee4:	85 c0                	test   %eax,%eax
    1ee6:	74 10                	je     1ef8 <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1ee8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1eec:	a1 6c 45 00 00       	mov    0x456c,%eax
    1ef1:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1ef4:	7c cd                	jl     1ec3 <Compute+0x18e>
    1ef6:	eb 01                	jmp    1ef9 <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1ef8:	90                   	nop
          }
          if(index == v_num) //no such variable
    1ef9:	a1 6c 45 00 00       	mov    0x456c,%eax
    1efe:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1f01:	75 2a                	jne    1f2d <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1f03:	83 ec 08             	sub    $0x8,%esp
    1f06:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1f0c:	50                   	push   %eax
    1f0d:	68 b0 39 00 00       	push   $0x39b0
    1f12:	6a 00                	push   $0x0
    1f14:	6a 00                	push   $0x0
    1f16:	6a 01                	push   $0x1
    1f18:	6a 04                	push   $0x4
    1f1a:	e8 c9 0e 00 00       	call   2de8 <color_printf>
    1f1f:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1f22:	dd 05 f0 39 00 00    	fldl   0x39f0
    1f28:	e9 de 04 00 00       	jmp    240b <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1f2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f30:	c1 e0 05             	shl    $0x5,%eax
    1f33:	05 a0 47 00 00       	add    $0x47a0,%eax
    1f38:	8b 00                	mov    (%eax),%eax
    1f3a:	83 f8 02             	cmp    $0x2,%eax
    1f3d:	75 23                	jne    1f62 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1f3f:	83 ec 0c             	sub    $0xc,%esp
    1f42:	68 ca 39 00 00       	push   $0x39ca
    1f47:	6a 00                	push   $0x0
    1f49:	6a 00                	push   $0x0
    1f4b:	6a 01                	push   $0x1
    1f4d:	6a 04                	push   $0x4
    1f4f:	e8 94 0e 00 00       	call   2de8 <color_printf>
    1f54:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1f57:	dd 05 f0 39 00 00    	fldl   0x39f0
    1f5d:	e9 a9 04 00 00       	jmp    240b <Compute+0x6d6>
          }
          g_pos = i+1;
    1f62:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f65:	83 c0 01             	add    $0x1,%eax
    1f68:	a3 80 47 00 00       	mov    %eax,0x4780
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    1f6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f70:	c1 e0 05             	shl    $0x5,%eax
    1f73:	05 b0 47 00 00       	add    $0x47b0,%eax
    1f78:	dd 40 08             	fldl   0x8(%eax)
    1f7b:	83 ec 04             	sub    $0x4,%esp
    1f7e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1f82:	dd 1c 24             	fstpl  (%esp)
    1f85:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f88:	e8 2f 12 00 00       	call   31bc <pushd>
    1f8d:	83 c4 10             	add    $0x10,%esp
    1f90:	e9 49 03 00 00       	jmp    22de <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    1f95:	a1 80 47 00 00       	mov    0x4780,%eax
    1f9a:	89 c2                	mov    %eax,%edx
    1f9c:	8b 45 08             	mov    0x8(%ebp),%eax
    1f9f:	01 d0                	add    %edx,%eax
    1fa1:	0f b6 00             	movzbl (%eax),%eax
    1fa4:	3c 2d                	cmp    $0x2d,%al
    1fa6:	75 3f                	jne    1fe7 <Compute+0x2b2>
    1fa8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1fac:	74 39                	je     1fe7 <Compute+0x2b2>
        {
            pushd(opnd,0);
    1fae:	83 ec 04             	sub    $0x4,%esp
    1fb1:	d9 ee                	fldz   
    1fb3:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1fb7:	dd 1c 24             	fstpl  (%esp)
    1fba:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fbd:	e8 fa 11 00 00       	call   31bc <pushd>
    1fc2:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    1fc5:	83 ec 08             	sub    $0x8,%esp
    1fc8:	6a 2d                	push   $0x2d
    1fca:	ff 75 e0             	pushl  -0x20(%ebp)
    1fcd:	e8 1b 11 00 00       	call   30ed <pushc>
    1fd2:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    1fd5:	a1 80 47 00 00       	mov    0x4780,%eax
    1fda:	83 c0 01             	add    $0x1,%eax
    1fdd:	a3 80 47 00 00       	mov    %eax,0x4780
    1fe2:	e9 f7 02 00 00       	jmp    22de <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    1fe7:	a1 80 47 00 00       	mov    0x4780,%eax
    1fec:	89 c2                	mov    %eax,%edx
    1fee:	8b 45 08             	mov    0x8(%ebp),%eax
    1ff1:	01 d0                	add    %edx,%eax
    1ff3:	0f b6 00             	movzbl (%eax),%eax
    1ff6:	3c 29                	cmp    $0x29,%al
    1ff8:	0f 85 01 01 00 00    	jne    20ff <Compute+0x3ca>
        {
            is_minus = 0;
    1ffe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    2005:	a1 80 47 00 00       	mov    0x4780,%eax
    200a:	83 c0 01             	add    $0x1,%eax
    200d:	a3 80 47 00 00       	mov    %eax,0x4780
            while (topc(optr) != '(')
    2012:	e9 bf 00 00 00       	jmp    20d6 <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    2017:	83 ec 0c             	sub    $0xc,%esp
    201a:	ff 75 e4             	pushl  -0x1c(%ebp)
    201d:	e8 37 12 00 00       	call   3259 <topd>
    2022:	83 c4 10             	add    $0x10,%esp
    2025:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    2028:	83 ec 0c             	sub    $0xc,%esp
    202b:	ff 75 e4             	pushl  -0x1c(%ebp)
    202e:	e8 dd 11 00 00       	call   3210 <popd>
    2033:	dd d8                	fstp   %st(0)
    2035:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2038:	83 ec 0c             	sub    $0xc,%esp
    203b:	ff 75 e4             	pushl  -0x1c(%ebp)
    203e:	e8 16 12 00 00       	call   3259 <topd>
    2043:	83 c4 10             	add    $0x10,%esp
    2046:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    2049:	83 ec 0c             	sub    $0xc,%esp
    204c:	ff 75 e4             	pushl  -0x1c(%ebp)
    204f:	e8 bc 11 00 00       	call   3210 <popd>
    2054:	dd d8                	fstp   %st(0)
    2056:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    2059:	83 ec 0c             	sub    $0xc,%esp
    205c:	ff 75 e0             	pushl  -0x20(%ebp)
    205f:	e8 11 11 00 00       	call   3175 <topc>
    2064:	83 c4 10             	add    $0x10,%esp
    2067:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    206a:	83 ec 0c             	sub    $0xc,%esp
    206d:	ff 75 e0             	pushl  -0x20(%ebp)
    2070:	e8 be 10 00 00       	call   3133 <popc>
    2075:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    2078:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    207c:	83 ec 0c             	sub    $0xc,%esp
    207f:	ff 75 d4             	pushl  -0x2c(%ebp)
    2082:	ff 75 d0             	pushl  -0x30(%ebp)
    2085:	50                   	push   %eax
    2086:	ff 75 cc             	pushl  -0x34(%ebp)
    2089:	ff 75 c8             	pushl  -0x38(%ebp)
    208c:	e8 ff fb ff ff       	call   1c90 <Operate>
    2091:	83 c4 20             	add    $0x20,%esp
    2094:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    2097:	dd 05 f0 39 00 00    	fldl   0x39f0
    209d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    20a1:	dd 1c 24             	fstpl  (%esp)
    20a4:	ff 75 bc             	pushl  -0x44(%ebp)
    20a7:	ff 75 b8             	pushl  -0x48(%ebp)
    20aa:	e8 0f f0 ff ff       	call   10be <isEqual>
    20af:	83 c4 10             	add    $0x10,%esp
    20b2:	83 f8 01             	cmp    $0x1,%eax
    20b5:	75 0b                	jne    20c2 <Compute+0x38d>
                  return WRONG_ANS;
    20b7:	dd 05 f0 39 00 00    	fldl   0x39f0
    20bd:	e9 49 03 00 00       	jmp    240b <Compute+0x6d6>
                pushd(opnd,result);
    20c2:	83 ec 04             	sub    $0x4,%esp
    20c5:	ff 75 bc             	pushl  -0x44(%ebp)
    20c8:	ff 75 b8             	pushl  -0x48(%ebp)
    20cb:	ff 75 e4             	pushl  -0x1c(%ebp)
    20ce:	e8 e9 10 00 00       	call   31bc <pushd>
    20d3:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    20d6:	83 ec 0c             	sub    $0xc,%esp
    20d9:	ff 75 e0             	pushl  -0x20(%ebp)
    20dc:	e8 94 10 00 00       	call   3175 <topc>
    20e1:	83 c4 10             	add    $0x10,%esp
    20e4:	3c 28                	cmp    $0x28,%al
    20e6:	0f 85 2b ff ff ff    	jne    2017 <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    20ec:	83 ec 0c             	sub    $0xc,%esp
    20ef:	ff 75 e0             	pushl  -0x20(%ebp)
    20f2:	e8 3c 10 00 00       	call   3133 <popc>
    20f7:	83 c4 10             	add    $0x10,%esp
    20fa:	e9 df 01 00 00       	jmp    22de <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    20ff:	a1 80 47 00 00       	mov    0x4780,%eax
    2104:	89 c2                	mov    %eax,%edx
    2106:	8b 45 08             	mov    0x8(%ebp),%eax
    2109:	01 d0                	add    %edx,%eax
    210b:	0f b6 00             	movzbl (%eax),%eax
    210e:	3c 2f                	cmp    $0x2f,%al
    2110:	7e 49                	jle    215b <Compute+0x426>
    2112:	a1 80 47 00 00       	mov    0x4780,%eax
    2117:	89 c2                	mov    %eax,%edx
    2119:	8b 45 08             	mov    0x8(%ebp),%eax
    211c:	01 d0                	add    %edx,%eax
    211e:	0f b6 00             	movzbl (%eax),%eax
    2121:	3c 39                	cmp    $0x39,%al
    2123:	7f 36                	jg     215b <Compute+0x426>
        {
            is_minus = 0;
    2125:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    212c:	83 ec 08             	sub    $0x8,%esp
    212f:	68 80 47 00 00       	push   $0x4780
    2134:	ff 75 08             	pushl  0x8(%ebp)
    2137:	e8 c3 eb ff ff       	call   cff <Translation>
    213c:	83 c4 10             	add    $0x10,%esp
    213f:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    2142:	83 ec 04             	sub    $0x4,%esp
    2145:	ff 75 b4             	pushl  -0x4c(%ebp)
    2148:	ff 75 b0             	pushl  -0x50(%ebp)
    214b:	ff 75 e4             	pushl  -0x1c(%ebp)
    214e:	e8 69 10 00 00       	call   31bc <pushd>
    2153:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    2156:	e9 83 01 00 00       	jmp    22de <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    215b:	a1 80 47 00 00       	mov    0x4780,%eax
    2160:	89 c2                	mov    %eax,%edx
    2162:	8b 45 08             	mov    0x8(%ebp),%eax
    2165:	01 d0                	add    %edx,%eax
    2167:	0f b6 00             	movzbl (%eax),%eax
    216a:	3c 28                	cmp    $0x28,%al
    216c:	0f 85 f9 00 00 00    	jne    226b <Compute+0x536>
        {
            is_minus = 1;
    2172:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    2179:	a1 80 47 00 00       	mov    0x4780,%eax
    217e:	89 c2                	mov    %eax,%edx
    2180:	8b 45 08             	mov    0x8(%ebp),%eax
    2183:	01 d0                	add    %edx,%eax
    2185:	0f b6 00             	movzbl (%eax),%eax
    2188:	0f be c0             	movsbl %al,%eax
    218b:	83 ec 08             	sub    $0x8,%esp
    218e:	50                   	push   %eax
    218f:	ff 75 e0             	pushl  -0x20(%ebp)
    2192:	e8 56 0f 00 00       	call   30ed <pushc>
    2197:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    219a:	a1 80 47 00 00       	mov    0x4780,%eax
    219f:	83 c0 01             	add    $0x1,%eax
    21a2:	a3 80 47 00 00       	mov    %eax,0x4780
    21a7:	e9 32 01 00 00       	jmp    22de <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    21ac:	83 ec 0c             	sub    $0xc,%esp
    21af:	ff 75 e4             	pushl  -0x1c(%ebp)
    21b2:	e8 a2 10 00 00       	call   3259 <topd>
    21b7:	83 c4 10             	add    $0x10,%esp
    21ba:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    21bd:	83 ec 0c             	sub    $0xc,%esp
    21c0:	ff 75 e4             	pushl  -0x1c(%ebp)
    21c3:	e8 48 10 00 00       	call   3210 <popd>
    21c8:	dd d8                	fstp   %st(0)
    21ca:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    21cd:	83 ec 0c             	sub    $0xc,%esp
    21d0:	ff 75 e4             	pushl  -0x1c(%ebp)
    21d3:	e8 81 10 00 00       	call   3259 <topd>
    21d8:	83 c4 10             	add    $0x10,%esp
    21db:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    21de:	83 ec 0c             	sub    $0xc,%esp
    21e1:	ff 75 e4             	pushl  -0x1c(%ebp)
    21e4:	e8 27 10 00 00       	call   3210 <popd>
    21e9:	dd d8                	fstp   %st(0)
    21eb:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    21ee:	83 ec 0c             	sub    $0xc,%esp
    21f1:	ff 75 e0             	pushl  -0x20(%ebp)
    21f4:	e8 7c 0f 00 00       	call   3175 <topc>
    21f9:	83 c4 10             	add    $0x10,%esp
    21fc:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    21ff:	83 ec 0c             	sub    $0xc,%esp
    2202:	ff 75 e0             	pushl  -0x20(%ebp)
    2205:	e8 29 0f 00 00       	call   3133 <popc>
    220a:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    220d:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    2211:	83 ec 0c             	sub    $0xc,%esp
    2214:	ff 75 ac             	pushl  -0x54(%ebp)
    2217:	ff 75 a8             	pushl  -0x58(%ebp)
    221a:	50                   	push   %eax
    221b:	ff 75 a4             	pushl  -0x5c(%ebp)
    221e:	ff 75 a0             	pushl  -0x60(%ebp)
    2221:	e8 6a fa ff ff       	call   1c90 <Operate>
    2226:	83 c4 20             	add    $0x20,%esp
    2229:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    222c:	dd 05 f0 39 00 00    	fldl   0x39f0
    2232:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2236:	dd 1c 24             	fstpl  (%esp)
    2239:	ff 75 94             	pushl  -0x6c(%ebp)
    223c:	ff 75 90             	pushl  -0x70(%ebp)
    223f:	e8 7a ee ff ff       	call   10be <isEqual>
    2244:	83 c4 10             	add    $0x10,%esp
    2247:	83 f8 01             	cmp    $0x1,%eax
    224a:	75 0b                	jne    2257 <Compute+0x522>
                  return WRONG_ANS;
    224c:	dd 05 f0 39 00 00    	fldl   0x39f0
    2252:	e9 b4 01 00 00       	jmp    240b <Compute+0x6d6>
                pushd(opnd,result);
    2257:	83 ec 04             	sub    $0x4,%esp
    225a:	ff 75 94             	pushl  -0x6c(%ebp)
    225d:	ff 75 90             	pushl  -0x70(%ebp)
    2260:	ff 75 e4             	pushl  -0x1c(%ebp)
    2263:	e8 54 0f 00 00       	call   31bc <pushd>
    2268:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    226b:	a1 80 47 00 00       	mov    0x4780,%eax
    2270:	89 c2                	mov    %eax,%edx
    2272:	8b 45 08             	mov    0x8(%ebp),%eax
    2275:	01 d0                	add    %edx,%eax
    2277:	0f b6 00             	movzbl (%eax),%eax
    227a:	0f be c0             	movsbl %al,%eax
    227d:	83 ec 0c             	sub    $0xc,%esp
    2280:	50                   	push   %eax
    2281:	e8 c6 f9 ff ff       	call   1c4c <GetLevel>
    2286:	83 c4 10             	add    $0x10,%esp
    2289:	89 c3                	mov    %eax,%ebx
    228b:	83 ec 0c             	sub    $0xc,%esp
    228e:	ff 75 e0             	pushl  -0x20(%ebp)
    2291:	e8 df 0e 00 00       	call   3175 <topc>
    2296:	83 c4 10             	add    $0x10,%esp
    2299:	0f be c0             	movsbl %al,%eax
    229c:	83 ec 0c             	sub    $0xc,%esp
    229f:	50                   	push   %eax
    22a0:	e8 a7 f9 ff ff       	call   1c4c <GetLevel>
    22a5:	83 c4 10             	add    $0x10,%esp
    22a8:	39 c3                	cmp    %eax,%ebx
    22aa:	0f 8e fc fe ff ff    	jle    21ac <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    22b0:	a1 80 47 00 00       	mov    0x4780,%eax
    22b5:	89 c2                	mov    %eax,%edx
    22b7:	8b 45 08             	mov    0x8(%ebp),%eax
    22ba:	01 d0                	add    %edx,%eax
    22bc:	0f b6 00             	movzbl (%eax),%eax
    22bf:	0f be c0             	movsbl %al,%eax
    22c2:	83 ec 08             	sub    $0x8,%esp
    22c5:	50                   	push   %eax
    22c6:	ff 75 e0             	pushl  -0x20(%ebp)
    22c9:	e8 1f 0e 00 00       	call   30ed <pushc>
    22ce:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    22d1:	a1 80 47 00 00       	mov    0x4780,%eax
    22d6:	83 c0 01             	add    $0x1,%eax
    22d9:	a3 80 47 00 00       	mov    %eax,0x4780
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    22de:	a1 80 47 00 00       	mov    0x4780,%eax
    22e3:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    22e6:	0f 8c 9a fa ff ff    	jl     1d86 <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    22ec:	e9 da 00 00 00       	jmp    23cb <Compute+0x696>
    {
        double a2 = topd(opnd);
    22f1:	83 ec 0c             	sub    $0xc,%esp
    22f4:	ff 75 e4             	pushl  -0x1c(%ebp)
    22f7:	e8 5d 0f 00 00       	call   3259 <topd>
    22fc:	83 c4 10             	add    $0x10,%esp
    22ff:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    2302:	83 ec 0c             	sub    $0xc,%esp
    2305:	ff 75 e4             	pushl  -0x1c(%ebp)
    2308:	e8 03 0f 00 00       	call   3210 <popd>
    230d:	dd d8                	fstp   %st(0)
    230f:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    2312:	83 ec 0c             	sub    $0xc,%esp
    2315:	ff 75 e4             	pushl  -0x1c(%ebp)
    2318:	e8 3c 0f 00 00       	call   3259 <topd>
    231d:	83 c4 10             	add    $0x10,%esp
    2320:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    2326:	83 ec 0c             	sub    $0xc,%esp
    2329:	ff 75 e4             	pushl  -0x1c(%ebp)
    232c:	e8 df 0e 00 00       	call   3210 <popd>
    2331:	dd d8                	fstp   %st(0)
    2333:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    2336:	83 ec 0c             	sub    $0xc,%esp
    2339:	ff 75 e0             	pushl  -0x20(%ebp)
    233c:	e8 34 0e 00 00       	call   3175 <topc>
    2341:	83 c4 10             	add    $0x10,%esp
    2344:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    234a:	83 ec 0c             	sub    $0xc,%esp
    234d:	ff 75 e0             	pushl  -0x20(%ebp)
    2350:	e8 de 0d 00 00       	call   3133 <popc>
    2355:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    2358:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    235f:	83 ec 0c             	sub    $0xc,%esp
    2362:	ff 75 84             	pushl  -0x7c(%ebp)
    2365:	ff 75 80             	pushl  -0x80(%ebp)
    2368:	50                   	push   %eax
    2369:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    236f:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    2375:	e8 16 f9 ff ff       	call   1c90 <Operate>
    237a:	83 c4 20             	add    $0x20,%esp
    237d:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    2383:	dd 05 f0 39 00 00    	fldl   0x39f0
    2389:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    238d:	dd 1c 24             	fstpl  (%esp)
    2390:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2396:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    239c:	e8 1d ed ff ff       	call   10be <isEqual>
    23a1:	83 c4 10             	add    $0x10,%esp
    23a4:	83 f8 01             	cmp    $0x1,%eax
    23a7:	75 08                	jne    23b1 <Compute+0x67c>
          return WRONG_ANS;
    23a9:	dd 05 f0 39 00 00    	fldl   0x39f0
    23af:	eb 5a                	jmp    240b <Compute+0x6d6>
        pushd(opnd,result);
    23b1:	83 ec 04             	sub    $0x4,%esp
    23b4:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    23ba:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    23c0:	ff 75 e4             	pushl  -0x1c(%ebp)
    23c3:	e8 f4 0d 00 00       	call   31bc <pushd>
    23c8:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    23cb:	83 ec 0c             	sub    $0xc,%esp
    23ce:	ff 75 e0             	pushl  -0x20(%ebp)
    23d1:	e8 9f 0d 00 00       	call   3175 <topc>
    23d6:	83 c4 10             	add    $0x10,%esp
    23d9:	3c 23                	cmp    $0x23,%al
    23db:	0f 85 10 ff ff ff    	jne    22f1 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    23e1:	83 ec 0c             	sub    $0xc,%esp
    23e4:	ff 75 e4             	pushl  -0x1c(%ebp)
    23e7:	e8 94 e4 ff ff       	call   880 <free>
    23ec:	83 c4 10             	add    $0x10,%esp
    free(optr);
    23ef:	83 ec 0c             	sub    $0xc,%esp
    23f2:	ff 75 e0             	pushl  -0x20(%ebp)
    23f5:	e8 86 e4 ff ff       	call   880 <free>
    23fa:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    23fd:	83 ec 0c             	sub    $0xc,%esp
    2400:	ff 75 e4             	pushl  -0x1c(%ebp)
    2403:	e8 51 0e 00 00       	call   3259 <topd>
    2408:	83 c4 10             	add    $0x10,%esp
}
    240b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    240e:	c9                   	leave  
    240f:	c3                   	ret    

00002410 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    2410:	55                   	push   %ebp
    2411:	89 e5                	mov    %esp,%ebp
    2413:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    2416:	8b 45 08             	mov    0x8(%ebp),%eax
    2419:	8b 00                	mov    (%eax),%eax
    241b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    241e:	eb 04                	jmp    2424 <gettoken+0x14>
    s++;
    2420:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2424:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2427:	3b 45 0c             	cmp    0xc(%ebp),%eax
    242a:	73 1e                	jae    244a <gettoken+0x3a>
    242c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    242f:	0f b6 00             	movzbl (%eax),%eax
    2432:	0f be c0             	movsbl %al,%eax
    2435:	83 ec 08             	sub    $0x8,%esp
    2438:	50                   	push   %eax
    2439:	68 34 45 00 00       	push   $0x4534
    243e:	e8 50 de ff ff       	call   293 <strchr>
    2443:	83 c4 10             	add    $0x10,%esp
    2446:	85 c0                	test   %eax,%eax
    2448:	75 d6                	jne    2420 <gettoken+0x10>
    s++;
  if(q)
    244a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    244e:	74 08                	je     2458 <gettoken+0x48>
    *q = s;
    2450:	8b 45 10             	mov    0x10(%ebp),%eax
    2453:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2456:	89 10                	mov    %edx,(%eax)
  ret = *s;
    2458:	8b 45 f4             	mov    -0xc(%ebp),%eax
    245b:	0f b6 00             	movzbl (%eax),%eax
    245e:	0f be c0             	movsbl %al,%eax
    2461:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    2464:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2467:	0f b6 00             	movzbl (%eax),%eax
    246a:	0f be c0             	movsbl %al,%eax
    246d:	83 f8 29             	cmp    $0x29,%eax
    2470:	7f 14                	jg     2486 <gettoken+0x76>
    2472:	83 f8 28             	cmp    $0x28,%eax
    2475:	7d 28                	jge    249f <gettoken+0x8f>
    2477:	85 c0                	test   %eax,%eax
    2479:	0f 84 94 00 00 00    	je     2513 <gettoken+0x103>
    247f:	83 f8 26             	cmp    $0x26,%eax
    2482:	74 1b                	je     249f <gettoken+0x8f>
    2484:	eb 3a                	jmp    24c0 <gettoken+0xb0>
    2486:	83 f8 3e             	cmp    $0x3e,%eax
    2489:	74 1a                	je     24a5 <gettoken+0x95>
    248b:	83 f8 3e             	cmp    $0x3e,%eax
    248e:	7f 0a                	jg     249a <gettoken+0x8a>
    2490:	83 e8 3b             	sub    $0x3b,%eax
    2493:	83 f8 01             	cmp    $0x1,%eax
    2496:	77 28                	ja     24c0 <gettoken+0xb0>
    2498:	eb 05                	jmp    249f <gettoken+0x8f>
    249a:	83 f8 7c             	cmp    $0x7c,%eax
    249d:	75 21                	jne    24c0 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    249f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    24a3:	eb 75                	jmp    251a <gettoken+0x10a>
  case '>':
    s++;
    24a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    24a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24ac:	0f b6 00             	movzbl (%eax),%eax
    24af:	3c 3e                	cmp    $0x3e,%al
    24b1:	75 63                	jne    2516 <gettoken+0x106>
      ret = '+';
    24b3:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    24ba:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    24be:	eb 56                	jmp    2516 <gettoken+0x106>
  default:
    ret = 'a';
    24c0:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    24c7:	eb 04                	jmp    24cd <gettoken+0xbd>
      s++;
    24c9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    24cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24d0:	3b 45 0c             	cmp    0xc(%ebp),%eax
    24d3:	73 44                	jae    2519 <gettoken+0x109>
    24d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24d8:	0f b6 00             	movzbl (%eax),%eax
    24db:	0f be c0             	movsbl %al,%eax
    24de:	83 ec 08             	sub    $0x8,%esp
    24e1:	50                   	push   %eax
    24e2:	68 34 45 00 00       	push   $0x4534
    24e7:	e8 a7 dd ff ff       	call   293 <strchr>
    24ec:	83 c4 10             	add    $0x10,%esp
    24ef:	85 c0                	test   %eax,%eax
    24f1:	75 26                	jne    2519 <gettoken+0x109>
    24f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24f6:	0f b6 00             	movzbl (%eax),%eax
    24f9:	0f be c0             	movsbl %al,%eax
    24fc:	83 ec 08             	sub    $0x8,%esp
    24ff:	50                   	push   %eax
    2500:	68 3c 45 00 00       	push   $0x453c
    2505:	e8 89 dd ff ff       	call   293 <strchr>
    250a:	83 c4 10             	add    $0x10,%esp
    250d:	85 c0                	test   %eax,%eax
    250f:	74 b8                	je     24c9 <gettoken+0xb9>
      s++;
    break;
    2511:	eb 06                	jmp    2519 <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    2513:	90                   	nop
    2514:	eb 04                	jmp    251a <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    2516:	90                   	nop
    2517:	eb 01                	jmp    251a <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    2519:	90                   	nop
  }
  if(eq)
    251a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    251e:	74 0e                	je     252e <gettoken+0x11e>
    *eq = s;
    2520:	8b 45 14             	mov    0x14(%ebp),%eax
    2523:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2526:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    2528:	eb 04                	jmp    252e <gettoken+0x11e>
    s++;
    252a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    252e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2531:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2534:	73 1e                	jae    2554 <gettoken+0x144>
    2536:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2539:	0f b6 00             	movzbl (%eax),%eax
    253c:	0f be c0             	movsbl %al,%eax
    253f:	83 ec 08             	sub    $0x8,%esp
    2542:	50                   	push   %eax
    2543:	68 34 45 00 00       	push   $0x4534
    2548:	e8 46 dd ff ff       	call   293 <strchr>
    254d:	83 c4 10             	add    $0x10,%esp
    2550:	85 c0                	test   %eax,%eax
    2552:	75 d6                	jne    252a <gettoken+0x11a>
    s++;
  *ps = s;
    2554:	8b 45 08             	mov    0x8(%ebp),%eax
    2557:	8b 55 f4             	mov    -0xc(%ebp),%edx
    255a:	89 10                	mov    %edx,(%eax)
  return ret;
    255c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    255f:	c9                   	leave  
    2560:	c3                   	ret    

00002561 <peek>:

int peek(char **ps, char *es, char *toks)
{
    2561:	55                   	push   %ebp
    2562:	89 e5                	mov    %esp,%ebp
    2564:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    2567:	8b 45 08             	mov    0x8(%ebp),%eax
    256a:	8b 00                	mov    (%eax),%eax
    256c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    256f:	eb 04                	jmp    2575 <peek+0x14>
    s++;
    2571:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2575:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2578:	3b 45 0c             	cmp    0xc(%ebp),%eax
    257b:	73 1e                	jae    259b <peek+0x3a>
    257d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2580:	0f b6 00             	movzbl (%eax),%eax
    2583:	0f be c0             	movsbl %al,%eax
    2586:	83 ec 08             	sub    $0x8,%esp
    2589:	50                   	push   %eax
    258a:	68 34 45 00 00       	push   $0x4534
    258f:	e8 ff dc ff ff       	call   293 <strchr>
    2594:	83 c4 10             	add    $0x10,%esp
    2597:	85 c0                	test   %eax,%eax
    2599:	75 d6                	jne    2571 <peek+0x10>
    s++;
  *ps = s;
    259b:	8b 45 08             	mov    0x8(%ebp),%eax
    259e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    25a1:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    25a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25a6:	0f b6 00             	movzbl (%eax),%eax
    25a9:	84 c0                	test   %al,%al
    25ab:	74 23                	je     25d0 <peek+0x6f>
    25ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25b0:	0f b6 00             	movzbl (%eax),%eax
    25b3:	0f be c0             	movsbl %al,%eax
    25b6:	83 ec 08             	sub    $0x8,%esp
    25b9:	50                   	push   %eax
    25ba:	ff 75 10             	pushl  0x10(%ebp)
    25bd:	e8 d1 dc ff ff       	call   293 <strchr>
    25c2:	83 c4 10             	add    $0x10,%esp
    25c5:	85 c0                	test   %eax,%eax
    25c7:	74 07                	je     25d0 <peek+0x6f>
    25c9:	b8 01 00 00 00       	mov    $0x1,%eax
    25ce:	eb 05                	jmp    25d5 <peek+0x74>
    25d0:	b8 00 00 00 00       	mov    $0x0,%eax
}
    25d5:	c9                   	leave  
    25d6:	c3                   	ret    

000025d7 <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    25d7:	55                   	push   %ebp
    25d8:	89 e5                	mov    %esp,%ebp
    25da:	53                   	push   %ebx
    25db:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    25de:	8b 5d 08             	mov    0x8(%ebp),%ebx
    25e1:	8b 45 08             	mov    0x8(%ebp),%eax
    25e4:	83 ec 0c             	sub    $0xc,%esp
    25e7:	50                   	push   %eax
    25e8:	e8 65 dc ff ff       	call   252 <strlen>
    25ed:	83 c4 10             	add    $0x10,%esp
    25f0:	01 d8                	add    %ebx,%eax
    25f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    25f5:	8b 45 08             	mov    0x8(%ebp),%eax
    25f8:	0f b6 00             	movzbl (%eax),%eax
    25fb:	3c 25                	cmp    $0x25,%al
    25fd:	75 5d                	jne    265c <parsecmd+0x85>
  {
    int len = strlen(s);
    25ff:	8b 45 08             	mov    0x8(%ebp),%eax
    2602:	83 ec 0c             	sub    $0xc,%esp
    2605:	50                   	push   %eax
    2606:	e8 47 dc ff ff       	call   252 <strlen>
    260b:	83 c4 10             	add    $0x10,%esp
    260e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    2611:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2614:	83 ec 0c             	sub    $0xc,%esp
    2617:	50                   	push   %eax
    2618:	e8 a5 e3 ff ff       	call   9c2 <malloc>
    261d:	83 c4 10             	add    $0x10,%esp
    2620:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    2623:	8b 45 08             	mov    0x8(%ebp),%eax
    2626:	83 c0 01             	add    $0x1,%eax
    2629:	83 ec 08             	sub    $0x8,%esp
    262c:	50                   	push   %eax
    262d:	ff 75 ec             	pushl  -0x14(%ebp)
    2630:	e8 ae db ff ff       	call   1e3 <strcpy>
    2635:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    2638:	8b 45 f0             	mov    -0x10(%ebp),%eax
    263b:	8d 50 fe             	lea    -0x2(%eax),%edx
    263e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2641:	01 d0                	add    %edx,%eax
    2643:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    2646:	83 ec 0c             	sub    $0xc,%esp
    2649:	ff 75 ec             	pushl  -0x14(%ebp)
    264c:	e8 59 e9 ff ff       	call   faa <calcmd>
    2651:	83 c4 10             	add    $0x10,%esp
    2654:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    2657:	8b 45 e8             	mov    -0x18(%ebp),%eax
    265a:	eb 6b                	jmp    26c7 <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    265c:	83 ec 08             	sub    $0x8,%esp
    265f:	ff 75 f4             	pushl  -0xc(%ebp)
    2662:	8d 45 08             	lea    0x8(%ebp),%eax
    2665:	50                   	push   %eax
    2666:	e8 61 00 00 00       	call   26cc <parseline>
    266b:	83 c4 10             	add    $0x10,%esp
    266e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    2671:	83 ec 04             	sub    $0x4,%esp
    2674:	68 f8 39 00 00       	push   $0x39f8
    2679:	ff 75 f4             	pushl  -0xc(%ebp)
    267c:	8d 45 08             	lea    0x8(%ebp),%eax
    267f:	50                   	push   %eax
    2680:	e8 dc fe ff ff       	call   2561 <peek>
    2685:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    2688:	8b 45 08             	mov    0x8(%ebp),%eax
    268b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    268e:	74 26                	je     26b6 <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    2690:	8b 45 08             	mov    0x8(%ebp),%eax
    2693:	83 ec 04             	sub    $0x4,%esp
    2696:	50                   	push   %eax
    2697:	68 f9 39 00 00       	push   $0x39f9
    269c:	6a 02                	push   $0x2
    269e:	e8 1d e0 ff ff       	call   6c0 <printf>
    26a3:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    26a6:	83 ec 0c             	sub    $0xc,%esp
    26a9:	68 08 3a 00 00       	push   $0x3a08
    26ae:	e8 f2 e3 ff ff       	call   aa5 <panic1>
    26b3:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    26b6:	83 ec 0c             	sub    $0xc,%esp
    26b9:	ff 75 e4             	pushl  -0x1c(%ebp)
    26bc:	e8 eb 03 00 00       	call   2aac <nulterminate>
    26c1:	83 c4 10             	add    $0x10,%esp
  return cmd;
    26c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    26c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    26ca:	c9                   	leave  
    26cb:	c3                   	ret    

000026cc <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    26cc:	55                   	push   %ebp
    26cd:	89 e5                	mov    %esp,%ebp
    26cf:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    26d2:	83 ec 08             	sub    $0x8,%esp
    26d5:	ff 75 0c             	pushl  0xc(%ebp)
    26d8:	ff 75 08             	pushl  0x8(%ebp)
    26db:	e8 99 00 00 00       	call   2779 <parsepipe>
    26e0:	83 c4 10             	add    $0x10,%esp
    26e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    26e6:	eb 23                	jmp    270b <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    26e8:	6a 00                	push   $0x0
    26ea:	6a 00                	push   $0x0
    26ec:	ff 75 0c             	pushl  0xc(%ebp)
    26ef:	ff 75 08             	pushl  0x8(%ebp)
    26f2:	e8 19 fd ff ff       	call   2410 <gettoken>
    26f7:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    26fa:	83 ec 0c             	sub    $0xc,%esp
    26fd:	ff 75 f4             	pushl  -0xc(%ebp)
    2700:	e8 66 e8 ff ff       	call   f6b <backcmd>
    2705:	83 c4 10             	add    $0x10,%esp
    2708:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    270b:	83 ec 04             	sub    $0x4,%esp
    270e:	68 0f 3a 00 00       	push   $0x3a0f
    2713:	ff 75 0c             	pushl  0xc(%ebp)
    2716:	ff 75 08             	pushl  0x8(%ebp)
    2719:	e8 43 fe ff ff       	call   2561 <peek>
    271e:	83 c4 10             	add    $0x10,%esp
    2721:	85 c0                	test   %eax,%eax
    2723:	75 c3                	jne    26e8 <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    2725:	83 ec 04             	sub    $0x4,%esp
    2728:	68 11 3a 00 00       	push   $0x3a11
    272d:	ff 75 0c             	pushl  0xc(%ebp)
    2730:	ff 75 08             	pushl  0x8(%ebp)
    2733:	e8 29 fe ff ff       	call   2561 <peek>
    2738:	83 c4 10             	add    $0x10,%esp
    273b:	85 c0                	test   %eax,%eax
    273d:	74 35                	je     2774 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    273f:	6a 00                	push   $0x0
    2741:	6a 00                	push   $0x0
    2743:	ff 75 0c             	pushl  0xc(%ebp)
    2746:	ff 75 08             	pushl  0x8(%ebp)
    2749:	e8 c2 fc ff ff       	call   2410 <gettoken>
    274e:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    2751:	83 ec 08             	sub    $0x8,%esp
    2754:	ff 75 0c             	pushl  0xc(%ebp)
    2757:	ff 75 08             	pushl  0x8(%ebp)
    275a:	e8 6d ff ff ff       	call   26cc <parseline>
    275f:	83 c4 10             	add    $0x10,%esp
    2762:	83 ec 08             	sub    $0x8,%esp
    2765:	50                   	push   %eax
    2766:	ff 75 f4             	pushl  -0xc(%ebp)
    2769:	e8 b5 e7 ff ff       	call   f23 <listcmd>
    276e:	83 c4 10             	add    $0x10,%esp
    2771:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2774:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2777:	c9                   	leave  
    2778:	c3                   	ret    

00002779 <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    2779:	55                   	push   %ebp
    277a:	89 e5                	mov    %esp,%ebp
    277c:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    277f:	83 ec 08             	sub    $0x8,%esp
    2782:	ff 75 0c             	pushl  0xc(%ebp)
    2785:	ff 75 08             	pushl  0x8(%ebp)
    2788:	e8 ec 01 00 00       	call   2979 <parseexec>
    278d:	83 c4 10             	add    $0x10,%esp
    2790:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    2793:	83 ec 04             	sub    $0x4,%esp
    2796:	68 13 3a 00 00       	push   $0x3a13
    279b:	ff 75 0c             	pushl  0xc(%ebp)
    279e:	ff 75 08             	pushl  0x8(%ebp)
    27a1:	e8 bb fd ff ff       	call   2561 <peek>
    27a6:	83 c4 10             	add    $0x10,%esp
    27a9:	85 c0                	test   %eax,%eax
    27ab:	74 35                	je     27e2 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    27ad:	6a 00                	push   $0x0
    27af:	6a 00                	push   $0x0
    27b1:	ff 75 0c             	pushl  0xc(%ebp)
    27b4:	ff 75 08             	pushl  0x8(%ebp)
    27b7:	e8 54 fc ff ff       	call   2410 <gettoken>
    27bc:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    27bf:	83 ec 08             	sub    $0x8,%esp
    27c2:	ff 75 0c             	pushl  0xc(%ebp)
    27c5:	ff 75 08             	pushl  0x8(%ebp)
    27c8:	e8 ac ff ff ff       	call   2779 <parsepipe>
    27cd:	83 c4 10             	add    $0x10,%esp
    27d0:	83 ec 08             	sub    $0x8,%esp
    27d3:	50                   	push   %eax
    27d4:	ff 75 f4             	pushl  -0xc(%ebp)
    27d7:	e8 ff e6 ff ff       	call   edb <pipecmd>
    27dc:	83 c4 10             	add    $0x10,%esp
    27df:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    27e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    27e5:	c9                   	leave  
    27e6:	c3                   	ret    

000027e7 <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    27e7:	55                   	push   %ebp
    27e8:	89 e5                	mov    %esp,%ebp
    27ea:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    27ed:	e9 b6 00 00 00       	jmp    28a8 <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    27f2:	6a 00                	push   $0x0
    27f4:	6a 00                	push   $0x0
    27f6:	ff 75 10             	pushl  0x10(%ebp)
    27f9:	ff 75 0c             	pushl  0xc(%ebp)
    27fc:	e8 0f fc ff ff       	call   2410 <gettoken>
    2801:	83 c4 10             	add    $0x10,%esp
    2804:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    2807:	8d 45 ec             	lea    -0x14(%ebp),%eax
    280a:	50                   	push   %eax
    280b:	8d 45 f0             	lea    -0x10(%ebp),%eax
    280e:	50                   	push   %eax
    280f:	ff 75 10             	pushl  0x10(%ebp)
    2812:	ff 75 0c             	pushl  0xc(%ebp)
    2815:	e8 f6 fb ff ff       	call   2410 <gettoken>
    281a:	83 c4 10             	add    $0x10,%esp
    281d:	83 f8 61             	cmp    $0x61,%eax
    2820:	74 10                	je     2832 <parseredirs+0x4b>
      panic1("missing file for redirection");
    2822:	83 ec 0c             	sub    $0xc,%esp
    2825:	68 15 3a 00 00       	push   $0x3a15
    282a:	e8 76 e2 ff ff       	call   aa5 <panic1>
    282f:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    2832:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2835:	83 f8 3c             	cmp    $0x3c,%eax
    2838:	74 0c                	je     2846 <parseredirs+0x5f>
    283a:	83 f8 3e             	cmp    $0x3e,%eax
    283d:	74 26                	je     2865 <parseredirs+0x7e>
    283f:	83 f8 2b             	cmp    $0x2b,%eax
    2842:	74 43                	je     2887 <parseredirs+0xa0>
    2844:	eb 62                	jmp    28a8 <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    2846:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2849:	8b 45 f0             	mov    -0x10(%ebp),%eax
    284c:	83 ec 0c             	sub    $0xc,%esp
    284f:	6a 00                	push   $0x0
    2851:	6a 00                	push   $0x0
    2853:	52                   	push   %edx
    2854:	50                   	push   %eax
    2855:	ff 75 08             	pushl  0x8(%ebp)
    2858:	e8 1b e6 ff ff       	call   e78 <redircmd>
    285d:	83 c4 20             	add    $0x20,%esp
    2860:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2863:	eb 43                	jmp    28a8 <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    2865:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2868:	8b 45 f0             	mov    -0x10(%ebp),%eax
    286b:	83 ec 0c             	sub    $0xc,%esp
    286e:	6a 01                	push   $0x1
    2870:	68 01 02 00 00       	push   $0x201
    2875:	52                   	push   %edx
    2876:	50                   	push   %eax
    2877:	ff 75 08             	pushl  0x8(%ebp)
    287a:	e8 f9 e5 ff ff       	call   e78 <redircmd>
    287f:	83 c4 20             	add    $0x20,%esp
    2882:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2885:	eb 21                	jmp    28a8 <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    2887:	8b 55 ec             	mov    -0x14(%ebp),%edx
    288a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    288d:	83 ec 0c             	sub    $0xc,%esp
    2890:	6a 01                	push   $0x1
    2892:	68 01 02 00 00       	push   $0x201
    2897:	52                   	push   %edx
    2898:	50                   	push   %eax
    2899:	ff 75 08             	pushl  0x8(%ebp)
    289c:	e8 d7 e5 ff ff       	call   e78 <redircmd>
    28a1:	83 c4 20             	add    $0x20,%esp
    28a4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    28a7:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    28a8:	83 ec 04             	sub    $0x4,%esp
    28ab:	68 32 3a 00 00       	push   $0x3a32
    28b0:	ff 75 10             	pushl  0x10(%ebp)
    28b3:	ff 75 0c             	pushl  0xc(%ebp)
    28b6:	e8 a6 fc ff ff       	call   2561 <peek>
    28bb:	83 c4 10             	add    $0x10,%esp
    28be:	85 c0                	test   %eax,%eax
    28c0:	0f 85 2c ff ff ff    	jne    27f2 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    28c6:	8b 45 08             	mov    0x8(%ebp),%eax
}
    28c9:	c9                   	leave  
    28ca:	c3                   	ret    

000028cb <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    28cb:	55                   	push   %ebp
    28cc:	89 e5                	mov    %esp,%ebp
    28ce:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    28d1:	83 ec 04             	sub    $0x4,%esp
    28d4:	68 35 3a 00 00       	push   $0x3a35
    28d9:	ff 75 0c             	pushl  0xc(%ebp)
    28dc:	ff 75 08             	pushl  0x8(%ebp)
    28df:	e8 7d fc ff ff       	call   2561 <peek>
    28e4:	83 c4 10             	add    $0x10,%esp
    28e7:	85 c0                	test   %eax,%eax
    28e9:	75 10                	jne    28fb <parseblock+0x30>
    panic1("parseblock");
    28eb:	83 ec 0c             	sub    $0xc,%esp
    28ee:	68 37 3a 00 00       	push   $0x3a37
    28f3:	e8 ad e1 ff ff       	call   aa5 <panic1>
    28f8:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    28fb:	6a 00                	push   $0x0
    28fd:	6a 00                	push   $0x0
    28ff:	ff 75 0c             	pushl  0xc(%ebp)
    2902:	ff 75 08             	pushl  0x8(%ebp)
    2905:	e8 06 fb ff ff       	call   2410 <gettoken>
    290a:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    290d:	83 ec 08             	sub    $0x8,%esp
    2910:	ff 75 0c             	pushl  0xc(%ebp)
    2913:	ff 75 08             	pushl  0x8(%ebp)
    2916:	e8 b1 fd ff ff       	call   26cc <parseline>
    291b:	83 c4 10             	add    $0x10,%esp
    291e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    2921:	83 ec 04             	sub    $0x4,%esp
    2924:	68 42 3a 00 00       	push   $0x3a42
    2929:	ff 75 0c             	pushl  0xc(%ebp)
    292c:	ff 75 08             	pushl  0x8(%ebp)
    292f:	e8 2d fc ff ff       	call   2561 <peek>
    2934:	83 c4 10             	add    $0x10,%esp
    2937:	85 c0                	test   %eax,%eax
    2939:	75 10                	jne    294b <parseblock+0x80>
    panic1("syntax - missing )");
    293b:	83 ec 0c             	sub    $0xc,%esp
    293e:	68 44 3a 00 00       	push   $0x3a44
    2943:	e8 5d e1 ff ff       	call   aa5 <panic1>
    2948:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    294b:	6a 00                	push   $0x0
    294d:	6a 00                	push   $0x0
    294f:	ff 75 0c             	pushl  0xc(%ebp)
    2952:	ff 75 08             	pushl  0x8(%ebp)
    2955:	e8 b6 fa ff ff       	call   2410 <gettoken>
    295a:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    295d:	83 ec 04             	sub    $0x4,%esp
    2960:	ff 75 0c             	pushl  0xc(%ebp)
    2963:	ff 75 08             	pushl  0x8(%ebp)
    2966:	ff 75 f4             	pushl  -0xc(%ebp)
    2969:	e8 79 fe ff ff       	call   27e7 <parseredirs>
    296e:	83 c4 10             	add    $0x10,%esp
    2971:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    2974:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2977:	c9                   	leave  
    2978:	c3                   	ret    

00002979 <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    2979:	55                   	push   %ebp
    297a:	89 e5                	mov    %esp,%ebp
    297c:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    297f:	83 ec 04             	sub    $0x4,%esp
    2982:	68 35 3a 00 00       	push   $0x3a35
    2987:	ff 75 0c             	pushl  0xc(%ebp)
    298a:	ff 75 08             	pushl  0x8(%ebp)
    298d:	e8 cf fb ff ff       	call   2561 <peek>
    2992:	83 c4 10             	add    $0x10,%esp
    2995:	85 c0                	test   %eax,%eax
    2997:	74 16                	je     29af <parseexec+0x36>
    return parseblock(ps, es);
    2999:	83 ec 08             	sub    $0x8,%esp
    299c:	ff 75 0c             	pushl  0xc(%ebp)
    299f:	ff 75 08             	pushl  0x8(%ebp)
    29a2:	e8 24 ff ff ff       	call   28cb <parseblock>
    29a7:	83 c4 10             	add    $0x10,%esp
    29aa:	e9 fb 00 00 00       	jmp    2aaa <parseexec+0x131>

  ret = execcmd();
    29af:	e8 8e e4 ff ff       	call   e42 <execcmd>
    29b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    29b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29ba:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    29bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    29c4:	83 ec 04             	sub    $0x4,%esp
    29c7:	ff 75 0c             	pushl  0xc(%ebp)
    29ca:	ff 75 08             	pushl  0x8(%ebp)
    29cd:	ff 75 f0             	pushl  -0x10(%ebp)
    29d0:	e8 12 fe ff ff       	call   27e7 <parseredirs>
    29d5:	83 c4 10             	add    $0x10,%esp
    29d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    29db:	e9 87 00 00 00       	jmp    2a67 <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    29e0:	8d 45 e0             	lea    -0x20(%ebp),%eax
    29e3:	50                   	push   %eax
    29e4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    29e7:	50                   	push   %eax
    29e8:	ff 75 0c             	pushl  0xc(%ebp)
    29eb:	ff 75 08             	pushl  0x8(%ebp)
    29ee:	e8 1d fa ff ff       	call   2410 <gettoken>
    29f3:	83 c4 10             	add    $0x10,%esp
    29f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
    29f9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    29fd:	0f 84 84 00 00 00    	je     2a87 <parseexec+0x10e>
      break;
    if(tok != 'a')
    2a03:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    2a07:	74 10                	je     2a19 <parseexec+0xa0>
      panic1("syntax");
    2a09:	83 ec 0c             	sub    $0xc,%esp
    2a0c:	68 08 3a 00 00       	push   $0x3a08
    2a11:	e8 8f e0 ff ff       	call   aa5 <panic1>
    2a16:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    2a19:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    2a1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a1f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a22:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    2a26:	8b 55 e0             	mov    -0x20(%ebp),%edx
    2a29:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a2c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2a2f:	83 c1 08             	add    $0x8,%ecx
    2a32:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    2a36:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    2a3a:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2a3e:	7e 10                	jle    2a50 <parseexec+0xd7>
      panic1("too many args");
    2a40:	83 ec 0c             	sub    $0xc,%esp
    2a43:	68 57 3a 00 00       	push   $0x3a57
    2a48:	e8 58 e0 ff ff       	call   aa5 <panic1>
    2a4d:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2a50:	83 ec 04             	sub    $0x4,%esp
    2a53:	ff 75 0c             	pushl  0xc(%ebp)
    2a56:	ff 75 08             	pushl  0x8(%ebp)
    2a59:	ff 75 f0             	pushl  -0x10(%ebp)
    2a5c:	e8 86 fd ff ff       	call   27e7 <parseredirs>
    2a61:	83 c4 10             	add    $0x10,%esp
    2a64:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    2a67:	83 ec 04             	sub    $0x4,%esp
    2a6a:	68 65 3a 00 00       	push   $0x3a65
    2a6f:	ff 75 0c             	pushl  0xc(%ebp)
    2a72:	ff 75 08             	pushl  0x8(%ebp)
    2a75:	e8 e7 fa ff ff       	call   2561 <peek>
    2a7a:	83 c4 10             	add    $0x10,%esp
    2a7d:	85 c0                	test   %eax,%eax
    2a7f:	0f 84 5b ff ff ff    	je     29e0 <parseexec+0x67>
    2a85:	eb 01                	jmp    2a88 <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    2a87:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    2a88:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a8b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a8e:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    2a95:	00 
  cmd->eargv[argc] = 0;
    2a96:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a99:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a9c:	83 c2 08             	add    $0x8,%edx
    2a9f:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    2aa6:	00 
  return ret;
    2aa7:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2aaa:	c9                   	leave  
    2aab:	c3                   	ret    

00002aac <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2aac:	55                   	push   %ebp
    2aad:	89 e5                	mov    %esp,%ebp
    2aaf:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2ab2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2ab6:	75 0a                	jne    2ac2 <nulterminate+0x16>
    return 0;
    2ab8:	b8 00 00 00 00       	mov    $0x0,%eax
    2abd:	e9 e4 00 00 00       	jmp    2ba6 <nulterminate+0xfa>
  
  switch(cmd->type){
    2ac2:	8b 45 08             	mov    0x8(%ebp),%eax
    2ac5:	8b 00                	mov    (%eax),%eax
    2ac7:	83 f8 05             	cmp    $0x5,%eax
    2aca:	0f 87 d3 00 00 00    	ja     2ba3 <nulterminate+0xf7>
    2ad0:	8b 04 85 6c 3a 00 00 	mov    0x3a6c(,%eax,4),%eax
    2ad7:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2ad9:	8b 45 08             	mov    0x8(%ebp),%eax
    2adc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2adf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2ae6:	eb 14                	jmp    2afc <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2ae8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2aeb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2aee:	83 c2 08             	add    $0x8,%edx
    2af1:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2af5:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2af8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2afc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2aff:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2b02:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2b06:	85 c0                	test   %eax,%eax
    2b08:	75 de                	jne    2ae8 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2b0a:	e9 94 00 00 00       	jmp    2ba3 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2b0f:	8b 45 08             	mov    0x8(%ebp),%eax
    2b12:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2b15:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b18:	8b 40 04             	mov    0x4(%eax),%eax
    2b1b:	83 ec 0c             	sub    $0xc,%esp
    2b1e:	50                   	push   %eax
    2b1f:	e8 88 ff ff ff       	call   2aac <nulterminate>
    2b24:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2b27:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b2a:	8b 40 0c             	mov    0xc(%eax),%eax
    2b2d:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2b30:	eb 71                	jmp    2ba3 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2b32:	8b 45 08             	mov    0x8(%ebp),%eax
    2b35:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2b38:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2b3b:	8b 40 04             	mov    0x4(%eax),%eax
    2b3e:	83 ec 0c             	sub    $0xc,%esp
    2b41:	50                   	push   %eax
    2b42:	e8 65 ff ff ff       	call   2aac <nulterminate>
    2b47:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2b4a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2b4d:	8b 40 08             	mov    0x8(%eax),%eax
    2b50:	83 ec 0c             	sub    $0xc,%esp
    2b53:	50                   	push   %eax
    2b54:	e8 53 ff ff ff       	call   2aac <nulterminate>
    2b59:	83 c4 10             	add    $0x10,%esp
    break;
    2b5c:	eb 45                	jmp    2ba3 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2b5e:	8b 45 08             	mov    0x8(%ebp),%eax
    2b61:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2b64:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b67:	8b 40 04             	mov    0x4(%eax),%eax
    2b6a:	83 ec 0c             	sub    $0xc,%esp
    2b6d:	50                   	push   %eax
    2b6e:	e8 39 ff ff ff       	call   2aac <nulterminate>
    2b73:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2b76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b79:	8b 40 08             	mov    0x8(%eax),%eax
    2b7c:	83 ec 0c             	sub    $0xc,%esp
    2b7f:	50                   	push   %eax
    2b80:	e8 27 ff ff ff       	call   2aac <nulterminate>
    2b85:	83 c4 10             	add    $0x10,%esp
    break;
    2b88:	eb 19                	jmp    2ba3 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2b8a:	8b 45 08             	mov    0x8(%ebp),%eax
    2b8d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2b90:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2b93:	8b 40 04             	mov    0x4(%eax),%eax
    2b96:	83 ec 0c             	sub    $0xc,%esp
    2b99:	50                   	push   %eax
    2b9a:	e8 0d ff ff ff       	call   2aac <nulterminate>
    2b9f:	83 c4 10             	add    $0x10,%esp
    break;
    2ba2:	90                   	nop
  }
  return cmd;
    2ba3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2ba6:	c9                   	leave  
    2ba7:	c3                   	ret    

00002ba8 <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2ba8:	55                   	push   %ebp
    2ba9:	89 e5                	mov    %esp,%ebp
    2bab:	83 ec 18             	sub    $0x18,%esp
    2bae:	8b 45 08             	mov    0x8(%ebp),%eax
    2bb1:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2bb4:	83 ec 08             	sub    $0x8,%esp
    2bb7:	ff 75 18             	pushl  0x18(%ebp)
    2bba:	ff 75 14             	pushl  0x14(%ebp)
    2bbd:	ff 75 10             	pushl  0x10(%ebp)
    2bc0:	ff 75 0c             	pushl  0xc(%ebp)
    2bc3:	6a 01                	push   $0x1
    2bc5:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2bc8:	50                   	push   %eax
    2bc9:	e8 e6 d8 ff ff       	call   4b4 <colorwrite>
    2bce:	83 c4 20             	add    $0x20,%esp
}
    2bd1:	90                   	nop
    2bd2:	c9                   	leave  
    2bd3:	c3                   	ret    

00002bd4 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2bd4:	55                   	push   %ebp
    2bd5:	89 e5                	mov    %esp,%ebp
    2bd7:	53                   	push   %ebx
    2bd8:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2bdb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2be2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2be6:	74 17                	je     2bff <color_printint+0x2b>
    2be8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2bec:	79 11                	jns    2bff <color_printint+0x2b>
    neg = 1;
    2bee:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2bf5:	8b 45 08             	mov    0x8(%ebp),%eax
    2bf8:	f7 d8                	neg    %eax
    2bfa:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2bfd:	eb 06                	jmp    2c05 <color_printint+0x31>
  } else {
    x = xx;
    2bff:	8b 45 08             	mov    0x8(%ebp),%eax
    2c02:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2c05:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2c0c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2c0f:	8d 41 01             	lea    0x1(%ecx),%eax
    2c12:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c15:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2c18:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c1b:	ba 00 00 00 00       	mov    $0x0,%edx
    2c20:	f7 f3                	div    %ebx
    2c22:	89 d0                	mov    %edx,%eax
    2c24:	0f b6 80 44 45 00 00 	movzbl 0x4544(%eax),%eax
    2c2b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2c2f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2c32:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c35:	ba 00 00 00 00       	mov    $0x0,%edx
    2c3a:	f7 f3                	div    %ebx
    2c3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2c3f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2c43:	75 c7                	jne    2c0c <color_printint+0x38>
  if(neg)
    2c45:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2c49:	74 36                	je     2c81 <color_printint+0xad>
    buf[i++] = '-';
    2c4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c4e:	8d 50 01             	lea    0x1(%eax),%edx
    2c51:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2c54:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2c59:	eb 26                	jmp    2c81 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2c5b:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2c5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c61:	01 d0                	add    %edx,%eax
    2c63:	0f b6 00             	movzbl (%eax),%eax
    2c66:	0f be c0             	movsbl %al,%eax
    2c69:	83 ec 0c             	sub    $0xc,%esp
    2c6c:	ff 75 20             	pushl  0x20(%ebp)
    2c6f:	ff 75 1c             	pushl  0x1c(%ebp)
    2c72:	ff 75 18             	pushl  0x18(%ebp)
    2c75:	ff 75 14             	pushl  0x14(%ebp)
    2c78:	50                   	push   %eax
    2c79:	e8 2a ff ff ff       	call   2ba8 <color_putc>
    2c7e:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2c81:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2c85:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2c89:	79 d0                	jns    2c5b <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2c8b:	90                   	nop
    2c8c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c8f:	c9                   	leave  
    2c90:	c3                   	ret    

00002c91 <getInteger>:

static int getInteger(double num)
{
    2c91:	55                   	push   %ebp
    2c92:	89 e5                	mov    %esp,%ebp
    2c94:	83 ec 18             	sub    $0x18,%esp
    2c97:	8b 45 08             	mov    0x8(%ebp),%eax
    2c9a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2c9d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ca0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2ca3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2caa:	eb 0e                	jmp    2cba <getInteger+0x29>
  {
    num -= 1;
    2cac:	dd 45 e8             	fldl   -0x18(%ebp)
    2caf:	d9 e8                	fld1   
    2cb1:	de e9                	fsubrp %st,%st(1)
    2cb3:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2cb6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2cba:	dd 45 e8             	fldl   -0x18(%ebp)
    2cbd:	d9 e8                	fld1   
    2cbf:	d9 c9                	fxch   %st(1)
    2cc1:	df e9                	fucomip %st(1),%st
    2cc3:	dd d8                	fstp   %st(0)
    2cc5:	77 e5                	ja     2cac <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2cc7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2cca:	c9                   	leave  
    2ccb:	c3                   	ret    

00002ccc <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2ccc:	55                   	push   %ebp
    2ccd:	89 e5                	mov    %esp,%ebp
    2ccf:	83 ec 28             	sub    $0x28,%esp
    2cd2:	8b 45 08             	mov    0x8(%ebp),%eax
    2cd5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2cd8:	8b 45 0c             	mov    0xc(%ebp),%eax
    2cdb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2cde:	d9 ee                	fldz   
    2ce0:	dd 45 e0             	fldl   -0x20(%ebp)
    2ce3:	d9 c9                	fxch   %st(1)
    2ce5:	df e9                	fucomip %st(1),%st
    2ce7:	dd d8                	fstp   %st(0)
    2ce9:	76 21                	jbe    2d0c <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2ceb:	83 ec 0c             	sub    $0xc,%esp
    2cee:	ff 75 1c             	pushl  0x1c(%ebp)
    2cf1:	ff 75 18             	pushl  0x18(%ebp)
    2cf4:	ff 75 14             	pushl  0x14(%ebp)
    2cf7:	ff 75 10             	pushl  0x10(%ebp)
    2cfa:	6a 2d                	push   $0x2d
    2cfc:	e8 a7 fe ff ff       	call   2ba8 <color_putc>
    2d01:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2d04:	dd 45 e0             	fldl   -0x20(%ebp)
    2d07:	d9 e0                	fchs   
    2d09:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2d0c:	83 ec 08             	sub    $0x8,%esp
    2d0f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2d12:	ff 75 e0             	pushl  -0x20(%ebp)
    2d15:	e8 77 ff ff ff       	call   2c91 <getInteger>
    2d1a:	83 c4 10             	add    $0x10,%esp
    2d1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2d20:	83 ec 04             	sub    $0x4,%esp
    2d23:	ff 75 1c             	pushl  0x1c(%ebp)
    2d26:	ff 75 18             	pushl  0x18(%ebp)
    2d29:	ff 75 14             	pushl  0x14(%ebp)
    2d2c:	ff 75 10             	pushl  0x10(%ebp)
    2d2f:	6a 01                	push   $0x1
    2d31:	6a 0a                	push   $0xa
    2d33:	ff 75 f0             	pushl  -0x10(%ebp)
    2d36:	e8 99 fe ff ff       	call   2bd4 <color_printint>
    2d3b:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2d3e:	db 45 f0             	fildl  -0x10(%ebp)
    2d41:	dd 45 e0             	fldl   -0x20(%ebp)
    2d44:	de e1                	fsubp  %st,%st(1)
    2d46:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2d49:	dd 45 e0             	fldl   -0x20(%ebp)
    2d4c:	dd 05 90 3a 00 00    	fldl   0x3a90
    2d52:	d9 c9                	fxch   %st(1)
    2d54:	df e9                	fucomip %st(1),%st
    2d56:	dd d8                	fstp   %st(0)
    2d58:	76 19                	jbe    2d73 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2d5a:	83 ec 0c             	sub    $0xc,%esp
    2d5d:	ff 75 1c             	pushl  0x1c(%ebp)
    2d60:	ff 75 18             	pushl  0x18(%ebp)
    2d63:	ff 75 14             	pushl  0x14(%ebp)
    2d66:	ff 75 10             	pushl  0x10(%ebp)
    2d69:	6a 2e                	push   $0x2e
    2d6b:	e8 38 fe ff ff       	call   2ba8 <color_putc>
    2d70:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2d73:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2d7a:	eb 55                	jmp    2dd1 <color_printdbl+0x105>
  {
    num = num*10;
    2d7c:	dd 45 e0             	fldl   -0x20(%ebp)
    2d7f:	dd 05 98 3a 00 00    	fldl   0x3a98
    2d85:	de c9                	fmulp  %st,%st(1)
    2d87:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2d8a:	83 ec 08             	sub    $0x8,%esp
    2d8d:	ff 75 e4             	pushl  -0x1c(%ebp)
    2d90:	ff 75 e0             	pushl  -0x20(%ebp)
    2d93:	e8 f9 fe ff ff       	call   2c91 <getInteger>
    2d98:	83 c4 10             	add    $0x10,%esp
    2d9b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2d9e:	83 ec 04             	sub    $0x4,%esp
    2da1:	ff 75 1c             	pushl  0x1c(%ebp)
    2da4:	ff 75 18             	pushl  0x18(%ebp)
    2da7:	ff 75 14             	pushl  0x14(%ebp)
    2daa:	ff 75 10             	pushl  0x10(%ebp)
    2dad:	6a 01                	push   $0x1
    2daf:	6a 0a                	push   $0xa
    2db1:	ff 75 f0             	pushl  -0x10(%ebp)
    2db4:	e8 1b fe ff ff       	call   2bd4 <color_printint>
    2db9:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2dbc:	db 45 f0             	fildl  -0x10(%ebp)
    2dbf:	dd 45 e0             	fldl   -0x20(%ebp)
    2dc2:	de e1                	fsubp  %st,%st(1)
    2dc4:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2dc7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2dcb:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2dcf:	7f 13                	jg     2de4 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2dd1:	dd 45 e0             	fldl   -0x20(%ebp)
    2dd4:	dd 05 90 3a 00 00    	fldl   0x3a90
    2dda:	d9 c9                	fxch   %st(1)
    2ddc:	df e9                	fucomip %st(1),%st
    2dde:	dd d8                	fstp   %st(0)
    2de0:	77 9a                	ja     2d7c <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2de2:	eb 01                	jmp    2de5 <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2de4:	90                   	nop
    }
  }
}
    2de5:	90                   	nop
    2de6:	c9                   	leave  
    2de7:	c3                   	ret    

00002de8 <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2de8:	55                   	push   %ebp
    2de9:	89 e5                	mov    %esp,%ebp
    2deb:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2dee:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2df5:	8d 45 18             	lea    0x18(%ebp),%eax
    2df8:	83 c0 04             	add    $0x4,%eax
    2dfb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2dfe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2e05:	e9 e2 01 00 00       	jmp    2fec <color_printf+0x204>
    c = fmt[i] & 0xff;
    2e0a:	8b 55 18             	mov    0x18(%ebp),%edx
    2e0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e10:	01 d0                	add    %edx,%eax
    2e12:	0f b6 00             	movzbl (%eax),%eax
    2e15:	0f be c0             	movsbl %al,%eax
    2e18:	25 ff 00 00 00       	and    $0xff,%eax
    2e1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2e20:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2e24:	75 35                	jne    2e5b <color_printf+0x73>
      if(c == '%'){
    2e26:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2e2a:	75 0c                	jne    2e38 <color_printf+0x50>
        state = '%';
    2e2c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2e33:	e9 b0 01 00 00       	jmp    2fe8 <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2e38:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e3b:	0f be c0             	movsbl %al,%eax
    2e3e:	83 ec 0c             	sub    $0xc,%esp
    2e41:	ff 75 14             	pushl  0x14(%ebp)
    2e44:	ff 75 10             	pushl  0x10(%ebp)
    2e47:	ff 75 0c             	pushl  0xc(%ebp)
    2e4a:	ff 75 08             	pushl  0x8(%ebp)
    2e4d:	50                   	push   %eax
    2e4e:	e8 55 fd ff ff       	call   2ba8 <color_putc>
    2e53:	83 c4 20             	add    $0x20,%esp
    2e56:	e9 8d 01 00 00       	jmp    2fe8 <color_printf+0x200>
      }
    } else if(state == '%'){
    2e5b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2e5f:	0f 85 83 01 00 00    	jne    2fe8 <color_printf+0x200>
      if(c == 'd'){
    2e65:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2e69:	75 2a                	jne    2e95 <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2e6b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e6e:	8b 00                	mov    (%eax),%eax
    2e70:	83 ec 04             	sub    $0x4,%esp
    2e73:	ff 75 14             	pushl  0x14(%ebp)
    2e76:	ff 75 10             	pushl  0x10(%ebp)
    2e79:	ff 75 0c             	pushl  0xc(%ebp)
    2e7c:	ff 75 08             	pushl  0x8(%ebp)
    2e7f:	6a 01                	push   $0x1
    2e81:	6a 0a                	push   $0xa
    2e83:	50                   	push   %eax
    2e84:	e8 4b fd ff ff       	call   2bd4 <color_printint>
    2e89:	83 c4 20             	add    $0x20,%esp
        ap++;
    2e8c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2e90:	e9 4c 01 00 00       	jmp    2fe1 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2e95:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2e99:	74 06                	je     2ea1 <color_printf+0xb9>
    2e9b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2e9f:	75 2a                	jne    2ecb <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2ea1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ea4:	8b 00                	mov    (%eax),%eax
    2ea6:	83 ec 04             	sub    $0x4,%esp
    2ea9:	ff 75 14             	pushl  0x14(%ebp)
    2eac:	ff 75 10             	pushl  0x10(%ebp)
    2eaf:	ff 75 0c             	pushl  0xc(%ebp)
    2eb2:	ff 75 08             	pushl  0x8(%ebp)
    2eb5:	6a 00                	push   $0x0
    2eb7:	6a 10                	push   $0x10
    2eb9:	50                   	push   %eax
    2eba:	e8 15 fd ff ff       	call   2bd4 <color_printint>
    2ebf:	83 c4 20             	add    $0x20,%esp
        ap++;
    2ec2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2ec6:	e9 16 01 00 00       	jmp    2fe1 <color_printf+0x1f9>
      } else if(c == 's'){
    2ecb:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2ecf:	75 4f                	jne    2f20 <color_printf+0x138>
        s = (char*)*ap;
    2ed1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ed4:	8b 00                	mov    (%eax),%eax
    2ed6:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2ed9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2edd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2ee1:	75 2e                	jne    2f11 <color_printf+0x129>
          s = "(null)";
    2ee3:	c7 45 f4 88 3a 00 00 	movl   $0x3a88,-0xc(%ebp)
        while(*s != 0){
    2eea:	eb 25                	jmp    2f11 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2eec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2eef:	0f b6 00             	movzbl (%eax),%eax
    2ef2:	0f be c0             	movsbl %al,%eax
    2ef5:	83 ec 0c             	sub    $0xc,%esp
    2ef8:	ff 75 14             	pushl  0x14(%ebp)
    2efb:	ff 75 10             	pushl  0x10(%ebp)
    2efe:	ff 75 0c             	pushl  0xc(%ebp)
    2f01:	ff 75 08             	pushl  0x8(%ebp)
    2f04:	50                   	push   %eax
    2f05:	e8 9e fc ff ff       	call   2ba8 <color_putc>
    2f0a:	83 c4 20             	add    $0x20,%esp
          s++;
    2f0d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2f11:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f14:	0f b6 00             	movzbl (%eax),%eax
    2f17:	84 c0                	test   %al,%al
    2f19:	75 d1                	jne    2eec <color_printf+0x104>
    2f1b:	e9 c1 00 00 00       	jmp    2fe1 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2f20:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2f24:	75 29                	jne    2f4f <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2f26:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f29:	8b 00                	mov    (%eax),%eax
    2f2b:	0f be c0             	movsbl %al,%eax
    2f2e:	83 ec 0c             	sub    $0xc,%esp
    2f31:	ff 75 14             	pushl  0x14(%ebp)
    2f34:	ff 75 10             	pushl  0x10(%ebp)
    2f37:	ff 75 0c             	pushl  0xc(%ebp)
    2f3a:	ff 75 08             	pushl  0x8(%ebp)
    2f3d:	50                   	push   %eax
    2f3e:	e8 65 fc ff ff       	call   2ba8 <color_putc>
    2f43:	83 c4 20             	add    $0x20,%esp
        ap++;
    2f46:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2f4a:	e9 92 00 00 00       	jmp    2fe1 <color_printf+0x1f9>
      } else if(c == '%'){
    2f4f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2f53:	75 20                	jne    2f75 <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2f55:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2f58:	0f be c0             	movsbl %al,%eax
    2f5b:	83 ec 0c             	sub    $0xc,%esp
    2f5e:	ff 75 14             	pushl  0x14(%ebp)
    2f61:	ff 75 10             	pushl  0x10(%ebp)
    2f64:	ff 75 0c             	pushl  0xc(%ebp)
    2f67:	ff 75 08             	pushl  0x8(%ebp)
    2f6a:	50                   	push   %eax
    2f6b:	e8 38 fc ff ff       	call   2ba8 <color_putc>
    2f70:	83 c4 20             	add    $0x20,%esp
    2f73:	eb 6c                	jmp    2fe1 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    2f75:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    2f79:	75 2f                	jne    2faa <color_printf+0x1c2>
        double *dap = (double*)ap;
    2f7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f7e:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    2f81:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2f84:	dd 00                	fldl   (%eax)
    2f86:	83 ec 08             	sub    $0x8,%esp
    2f89:	ff 75 14             	pushl  0x14(%ebp)
    2f8c:	ff 75 10             	pushl  0x10(%ebp)
    2f8f:	ff 75 0c             	pushl  0xc(%ebp)
    2f92:	ff 75 08             	pushl  0x8(%ebp)
    2f95:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2f99:	dd 1c 24             	fstpl  (%esp)
    2f9c:	e8 2b fd ff ff       	call   2ccc <color_printdbl>
    2fa1:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    2fa4:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    2fa8:	eb 37                	jmp    2fe1 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    2faa:	83 ec 0c             	sub    $0xc,%esp
    2fad:	ff 75 14             	pushl  0x14(%ebp)
    2fb0:	ff 75 10             	pushl  0x10(%ebp)
    2fb3:	ff 75 0c             	pushl  0xc(%ebp)
    2fb6:	ff 75 08             	pushl  0x8(%ebp)
    2fb9:	6a 25                	push   $0x25
    2fbb:	e8 e8 fb ff ff       	call   2ba8 <color_putc>
    2fc0:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    2fc3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2fc6:	0f be c0             	movsbl %al,%eax
    2fc9:	83 ec 0c             	sub    $0xc,%esp
    2fcc:	ff 75 14             	pushl  0x14(%ebp)
    2fcf:	ff 75 10             	pushl  0x10(%ebp)
    2fd2:	ff 75 0c             	pushl  0xc(%ebp)
    2fd5:	ff 75 08             	pushl  0x8(%ebp)
    2fd8:	50                   	push   %eax
    2fd9:	e8 ca fb ff ff       	call   2ba8 <color_putc>
    2fde:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    2fe1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2fe8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2fec:	8b 55 18             	mov    0x18(%ebp),%edx
    2fef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ff2:	01 d0                	add    %edx,%eax
    2ff4:	0f b6 00             	movzbl (%eax),%eax
    2ff7:	84 c0                	test   %al,%al
    2ff9:	0f 85 0b fe ff ff    	jne    2e0a <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    2fff:	90                   	nop
    3000:	c9                   	leave  
    3001:	c3                   	ret    

00003002 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    3002:	55                   	push   %ebp
    3003:	89 e5                	mov    %esp,%ebp
    3005:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    3008:	83 ec 0c             	sub    $0xc,%esp
    300b:	6a 58                	push   $0x58
    300d:	e8 b0 d9 ff ff       	call   9c2 <malloc>
    3012:	83 c4 10             	add    $0x10,%esp
    3015:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3018:	8b 45 f4             	mov    -0xc(%ebp),%eax
    301b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3021:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3024:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    302b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    302e:	c9                   	leave  
    302f:	c3                   	ret    

00003030 <pushi>:

void pushi(struct istack *s, int val)
{
    3030:	55                   	push   %ebp
    3031:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    3033:	8b 45 08             	mov    0x8(%ebp),%eax
    3036:	8b 00                	mov    (%eax),%eax
    3038:	83 f8 13             	cmp    $0x13,%eax
    303b:	7f 2c                	jg     3069 <pushi+0x39>
    {
        s->size++;
    303d:	8b 45 08             	mov    0x8(%ebp),%eax
    3040:	8b 00                	mov    (%eax),%eax
    3042:	8d 50 01             	lea    0x1(%eax),%edx
    3045:	8b 45 08             	mov    0x8(%ebp),%eax
    3048:	89 10                	mov    %edx,(%eax)
        s->top++;
    304a:	8b 45 08             	mov    0x8(%ebp),%eax
    304d:	8b 40 54             	mov    0x54(%eax),%eax
    3050:	8d 50 01             	lea    0x1(%eax),%edx
    3053:	8b 45 08             	mov    0x8(%ebp),%eax
    3056:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    3059:	8b 45 08             	mov    0x8(%ebp),%eax
    305c:	8b 50 54             	mov    0x54(%eax),%edx
    305f:	8b 45 08             	mov    0x8(%ebp),%eax
    3062:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    3065:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    3069:	90                   	nop
    306a:	5d                   	pop    %ebp
    306b:	c3                   	ret    

0000306c <popi>:

int popi(struct istack *s)
{
    306c:	55                   	push   %ebp
    306d:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    306f:	8b 45 08             	mov    0x8(%ebp),%eax
    3072:	8b 00                	mov    (%eax),%eax
    3074:	85 c0                	test   %eax,%eax
    3076:	75 07                	jne    307f <popi+0x13>
    {
        return -1;
    3078:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    307d:	eb 2c                	jmp    30ab <popi+0x3f>
    }
    s->size--;
    307f:	8b 45 08             	mov    0x8(%ebp),%eax
    3082:	8b 00                	mov    (%eax),%eax
    3084:	8d 50 ff             	lea    -0x1(%eax),%edx
    3087:	8b 45 08             	mov    0x8(%ebp),%eax
    308a:	89 10                	mov    %edx,(%eax)
    s->top--;
    308c:	8b 45 08             	mov    0x8(%ebp),%eax
    308f:	8b 40 54             	mov    0x54(%eax),%eax
    3092:	8d 50 ff             	lea    -0x1(%eax),%edx
    3095:	8b 45 08             	mov    0x8(%ebp),%eax
    3098:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    309b:	8b 45 08             	mov    0x8(%ebp),%eax
    309e:	8b 40 54             	mov    0x54(%eax),%eax
    30a1:	8d 50 01             	lea    0x1(%eax),%edx
    30a4:	8b 45 08             	mov    0x8(%ebp),%eax
    30a7:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    30ab:	5d                   	pop    %ebp
    30ac:	c3                   	ret    

000030ad <topi>:

int topi(struct istack* s)
{
    30ad:	55                   	push   %ebp
    30ae:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    30b0:	8b 45 08             	mov    0x8(%ebp),%eax
    30b3:	8b 50 54             	mov    0x54(%eax),%edx
    30b6:	8b 45 08             	mov    0x8(%ebp),%eax
    30b9:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    30bd:	5d                   	pop    %ebp
    30be:	c3                   	ret    

000030bf <cstack>:

//constructor
struct cstack* cstack()
{
    30bf:	55                   	push   %ebp
    30c0:	89 e5                	mov    %esp,%ebp
    30c2:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    30c5:	83 ec 0c             	sub    $0xc,%esp
    30c8:	6a 1c                	push   $0x1c
    30ca:	e8 f3 d8 ff ff       	call   9c2 <malloc>
    30cf:	83 c4 10             	add    $0x10,%esp
    30d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    30d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30d8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    30de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30e1:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    30e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    30eb:	c9                   	leave  
    30ec:	c3                   	ret    

000030ed <pushc>:

void pushc(struct cstack *s, char val)
{
    30ed:	55                   	push   %ebp
    30ee:	89 e5                	mov    %esp,%ebp
    30f0:	83 ec 04             	sub    $0x4,%esp
    30f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    30f6:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    30f9:	8b 45 08             	mov    0x8(%ebp),%eax
    30fc:	8b 00                	mov    (%eax),%eax
    30fe:	83 f8 13             	cmp    $0x13,%eax
    3101:	7f 2d                	jg     3130 <pushc+0x43>
    {
        s->size++;
    3103:	8b 45 08             	mov    0x8(%ebp),%eax
    3106:	8b 00                	mov    (%eax),%eax
    3108:	8d 50 01             	lea    0x1(%eax),%edx
    310b:	8b 45 08             	mov    0x8(%ebp),%eax
    310e:	89 10                	mov    %edx,(%eax)
        s->top++;
    3110:	8b 45 08             	mov    0x8(%ebp),%eax
    3113:	8b 40 18             	mov    0x18(%eax),%eax
    3116:	8d 50 01             	lea    0x1(%eax),%edx
    3119:	8b 45 08             	mov    0x8(%ebp),%eax
    311c:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    311f:	8b 45 08             	mov    0x8(%ebp),%eax
    3122:	8b 40 18             	mov    0x18(%eax),%eax
    3125:	8b 55 08             	mov    0x8(%ebp),%edx
    3128:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    312c:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    3130:	90                   	nop
    3131:	c9                   	leave  
    3132:	c3                   	ret    

00003133 <popc>:

char popc(struct cstack *s)
{
    3133:	55                   	push   %ebp
    3134:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3136:	8b 45 08             	mov    0x8(%ebp),%eax
    3139:	8b 00                	mov    (%eax),%eax
    313b:	85 c0                	test   %eax,%eax
    313d:	75 07                	jne    3146 <popc+0x13>
    {
        return -1;
    313f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3144:	eb 2d                	jmp    3173 <popc+0x40>
    }
    s->size--;
    3146:	8b 45 08             	mov    0x8(%ebp),%eax
    3149:	8b 00                	mov    (%eax),%eax
    314b:	8d 50 ff             	lea    -0x1(%eax),%edx
    314e:	8b 45 08             	mov    0x8(%ebp),%eax
    3151:	89 10                	mov    %edx,(%eax)
    s->top--;
    3153:	8b 45 08             	mov    0x8(%ebp),%eax
    3156:	8b 40 18             	mov    0x18(%eax),%eax
    3159:	8d 50 ff             	lea    -0x1(%eax),%edx
    315c:	8b 45 08             	mov    0x8(%ebp),%eax
    315f:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    3162:	8b 45 08             	mov    0x8(%ebp),%eax
    3165:	8b 40 18             	mov    0x18(%eax),%eax
    3168:	8d 50 01             	lea    0x1(%eax),%edx
    316b:	8b 45 08             	mov    0x8(%ebp),%eax
    316e:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    3173:	5d                   	pop    %ebp
    3174:	c3                   	ret    

00003175 <topc>:

char topc(struct cstack* s)
{
    3175:	55                   	push   %ebp
    3176:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3178:	8b 45 08             	mov    0x8(%ebp),%eax
    317b:	8b 40 18             	mov    0x18(%eax),%eax
    317e:	8b 55 08             	mov    0x8(%ebp),%edx
    3181:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    3186:	5d                   	pop    %ebp
    3187:	c3                   	ret    

00003188 <dstack>:

//constructor
struct dstack* dstack()
{
    3188:	55                   	push   %ebp
    3189:	89 e5                	mov    %esp,%ebp
    318b:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    318e:	83 ec 0c             	sub    $0xc,%esp
    3191:	68 a8 00 00 00       	push   $0xa8
    3196:	e8 27 d8 ff ff       	call   9c2 <malloc>
    319b:	83 c4 10             	add    $0x10,%esp
    319e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    31a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31a4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    31aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31ad:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    31b4:	ff ff ff 
    return stack;
    31b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    31ba:	c9                   	leave  
    31bb:	c3                   	ret    

000031bc <pushd>:

void pushd(struct dstack *s, double val)
{
    31bc:	55                   	push   %ebp
    31bd:	89 e5                	mov    %esp,%ebp
    31bf:	83 ec 08             	sub    $0x8,%esp
    31c2:	8b 45 0c             	mov    0xc(%ebp),%eax
    31c5:	89 45 f8             	mov    %eax,-0x8(%ebp)
    31c8:	8b 45 10             	mov    0x10(%ebp),%eax
    31cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    31ce:	8b 45 08             	mov    0x8(%ebp),%eax
    31d1:	8b 00                	mov    (%eax),%eax
    31d3:	83 f8 13             	cmp    $0x13,%eax
    31d6:	7f 35                	jg     320d <pushd+0x51>
    {
        s->size++;
    31d8:	8b 45 08             	mov    0x8(%ebp),%eax
    31db:	8b 00                	mov    (%eax),%eax
    31dd:	8d 50 01             	lea    0x1(%eax),%edx
    31e0:	8b 45 08             	mov    0x8(%ebp),%eax
    31e3:	89 10                	mov    %edx,(%eax)
        s->top++;
    31e5:	8b 45 08             	mov    0x8(%ebp),%eax
    31e8:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    31ee:	8d 50 01             	lea    0x1(%eax),%edx
    31f1:	8b 45 08             	mov    0x8(%ebp),%eax
    31f4:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    31fa:	8b 45 08             	mov    0x8(%ebp),%eax
    31fd:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3203:	8b 45 08             	mov    0x8(%ebp),%eax
    3206:	dd 45 f8             	fldl   -0x8(%ebp)
    3209:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    320d:	90                   	nop
    320e:	c9                   	leave  
    320f:	c3                   	ret    

00003210 <popd>:

double popd(struct dstack *s)
{
    3210:	55                   	push   %ebp
    3211:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3213:	8b 45 08             	mov    0x8(%ebp),%eax
    3216:	8b 00                	mov    (%eax),%eax
    3218:	85 c0                	test   %eax,%eax
    321a:	75 06                	jne    3222 <popd+0x12>
    {
        return -1;
    321c:	d9 e8                	fld1   
    321e:	d9 e0                	fchs   
    3220:	eb 35                	jmp    3257 <popd+0x47>
    }
    s->size--;
    3222:	8b 45 08             	mov    0x8(%ebp),%eax
    3225:	8b 00                	mov    (%eax),%eax
    3227:	8d 50 ff             	lea    -0x1(%eax),%edx
    322a:	8b 45 08             	mov    0x8(%ebp),%eax
    322d:	89 10                	mov    %edx,(%eax)
    s->top--;
    322f:	8b 45 08             	mov    0x8(%ebp),%eax
    3232:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3238:	8d 50 ff             	lea    -0x1(%eax),%edx
    323b:	8b 45 08             	mov    0x8(%ebp),%eax
    323e:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    3244:	8b 45 08             	mov    0x8(%ebp),%eax
    3247:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    324d:	8d 50 01             	lea    0x1(%eax),%edx
    3250:	8b 45 08             	mov    0x8(%ebp),%eax
    3253:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    3257:	5d                   	pop    %ebp
    3258:	c3                   	ret    

00003259 <topd>:

double topd(struct dstack* s)
{
    3259:	55                   	push   %ebp
    325a:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    325c:	8b 45 08             	mov    0x8(%ebp),%eax
    325f:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3265:	8b 45 08             	mov    0x8(%ebp),%eax
    3268:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    326c:	5d                   	pop    %ebp
    326d:	c3                   	ret    

0000326e <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    326e:	55                   	push   %ebp
    326f:	89 e5                	mov    %esp,%ebp
    3271:	53                   	push   %ebx
    3272:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    3278:	83 ec 08             	sub    $0x8,%esp
    327b:	6a 00                	push   $0x0
    327d:	68 a0 3a 00 00       	push   $0x3aa0
    3282:	e8 cd d1 ff ff       	call   454 <open>
    3287:	83 c4 10             	add    $0x10,%esp
    328a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    328d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3291:	79 1d                	jns    32b0 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    3293:	83 ec 0c             	sub    $0xc,%esp
    3296:	68 aa 3a 00 00       	push   $0x3aaa
    329b:	6a 00                	push   $0x0
    329d:	6a 00                	push   $0x0
    329f:	6a 01                	push   $0x1
    32a1:	6a 03                	push   $0x3
    32a3:	e8 40 fb ff ff       	call   2de8 <color_printf>
    32a8:	83 c4 20             	add    $0x20,%esp
    32ab:	e9 6d 02 00 00       	jmp    351d <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    32b0:	8b 45 0c             	mov    0xc(%ebp),%eax
    32b3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    32b9:	e9 2a 02 00 00       	jmp    34e8 <readVariables+0x27a>
  {
    int pos = 0;
    32be:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    32c5:	00 00 00 
    while(pos <= n-1)
    32c8:	e9 07 02 00 00       	jmp    34d4 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    32cd:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    32d4:	eb 24                	jmp    32fa <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    32d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32d9:	8d 50 ff             	lea    -0x1(%eax),%edx
    32dc:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    32e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32e5:	01 c8                	add    %ecx,%eax
    32e7:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    32ee:	ff 
    32ef:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    32f6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    32fa:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3300:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3303:	01 d0                	add    %edx,%eax
    3305:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    330c:	ff 
    330d:	3c 3d                	cmp    $0x3d,%al
    330f:	75 c5                	jne    32d6 <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    3311:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3314:	83 e8 01             	sub    $0x1,%eax
    3317:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    331e:	00 
      if(buf[pos] == 'd') //double value
    331f:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3325:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    332c:	ff 
    332d:	3c 64                	cmp    $0x64,%al
    332f:	0f 85 a0 00 00 00    	jne    33d5 <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    3335:	8b 45 0c             	mov    0xc(%ebp),%eax
    3338:	8b 00                	mov    (%eax),%eax
    333a:	c1 e0 05             	shl    $0x5,%eax
    333d:	89 c2                	mov    %eax,%edx
    333f:	8b 45 08             	mov    0x8(%ebp),%eax
    3342:	01 d0                	add    %edx,%eax
    3344:	8d 50 04             	lea    0x4(%eax),%edx
    3347:	83 ec 08             	sub    $0x8,%esp
    334a:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3350:	50                   	push   %eax
    3351:	52                   	push   %edx
    3352:	e8 8c ce ff ff       	call   1e3 <strcpy>
    3357:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    335a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    335d:	8d 50 01             	lea    0x1(%eax),%edx
    3360:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3366:	01 d0                	add    %edx,%eax
    3368:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    336e:	83 ec 08             	sub    $0x8,%esp
    3371:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    3377:	50                   	push   %eax
    3378:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    337e:	50                   	push   %eax
    337f:	e8 7b d9 ff ff       	call   cff <Translation>
    3384:	83 c4 10             	add    $0x10,%esp
    3387:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    338a:	8b 45 0c             	mov    0xc(%ebp),%eax
    338d:	8b 00                	mov    (%eax),%eax
    338f:	c1 e0 05             	shl    $0x5,%eax
    3392:	89 c2                	mov    %eax,%edx
    3394:	8b 45 08             	mov    0x8(%ebp),%eax
    3397:	01 d0                	add    %edx,%eax
    3399:	dd 45 d8             	fldl   -0x28(%ebp)
    339c:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    339f:	8b 45 0c             	mov    0xc(%ebp),%eax
    33a2:	8b 00                	mov    (%eax),%eax
    33a4:	c1 e0 05             	shl    $0x5,%eax
    33a7:	89 c2                	mov    %eax,%edx
    33a9:	8b 45 08             	mov    0x8(%ebp),%eax
    33ac:	01 d0                	add    %edx,%eax
    33ae:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    33b4:	8b 45 0c             	mov    0xc(%ebp),%eax
    33b7:	8b 00                	mov    (%eax),%eax
    33b9:	8d 50 01             	lea    0x1(%eax),%edx
    33bc:	8b 45 0c             	mov    0xc(%ebp),%eax
    33bf:	89 10                	mov    %edx,(%eax)
        pos++;
    33c1:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    33c7:	83 c0 01             	add    $0x1,%eax
    33ca:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    33d0:	e9 ff 00 00 00       	jmp    34d4 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    33d5:	8b 45 0c             	mov    0xc(%ebp),%eax
    33d8:	8b 00                	mov    (%eax),%eax
    33da:	c1 e0 05             	shl    $0x5,%eax
    33dd:	89 c2                	mov    %eax,%edx
    33df:	8b 45 08             	mov    0x8(%ebp),%eax
    33e2:	01 d0                	add    %edx,%eax
    33e4:	8d 50 04             	lea    0x4(%eax),%edx
    33e7:	83 ec 08             	sub    $0x8,%esp
    33ea:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    33f0:	50                   	push   %eax
    33f1:	52                   	push   %edx
    33f2:	e8 ec cd ff ff       	call   1e3 <strcpy>
    33f7:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    33fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33fd:	8d 50 01             	lea    0x1(%eax),%edx
    3400:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3406:	01 d0                	add    %edx,%eax
    3408:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    340e:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3414:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    3417:	eb 04                	jmp    341d <readVariables+0x1af>
        {
          strend++;
    3419:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    341d:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    3423:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3426:	01 d0                	add    %edx,%eax
    3428:	0f b6 00             	movzbl (%eax),%eax
    342b:	84 c0                	test   %al,%al
    342d:	75 ea                	jne    3419 <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    342f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3432:	8b 00                	mov    (%eax),%eax
    3434:	c1 e0 05             	shl    $0x5,%eax
    3437:	89 c2                	mov    %eax,%edx
    3439:	8b 45 08             	mov    0x8(%ebp),%eax
    343c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    343f:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3445:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3448:	29 c2                	sub    %eax,%edx
    344a:	89 d0                	mov    %edx,%eax
    344c:	83 c0 01             	add    $0x1,%eax
    344f:	83 ec 0c             	sub    $0xc,%esp
    3452:	50                   	push   %eax
    3453:	e8 6a d5 ff ff       	call   9c2 <malloc>
    3458:	83 c4 10             	add    $0x10,%esp
    345b:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    345e:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3464:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3467:	eb 35                	jmp    349e <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    3469:	8b 45 0c             	mov    0xc(%ebp),%eax
    346c:	8b 00                	mov    (%eax),%eax
    346e:	c1 e0 05             	shl    $0x5,%eax
    3471:	89 c2                	mov    %eax,%edx
    3473:	8b 45 08             	mov    0x8(%ebp),%eax
    3476:	01 d0                	add    %edx,%eax
    3478:	8b 40 18             	mov    0x18(%eax),%eax
    347b:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3481:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3484:	29 d1                	sub    %edx,%ecx
    3486:	89 ca                	mov    %ecx,%edx
    3488:	01 c2                	add    %eax,%edx
    348a:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    3490:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3493:	01 c8                	add    %ecx,%eax
    3495:	0f b6 00             	movzbl (%eax),%eax
    3498:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    349a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    349e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    34a1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    34a4:	7e c3                	jle    3469 <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    34a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    34a9:	8b 00                	mov    (%eax),%eax
    34ab:	c1 e0 05             	shl    $0x5,%eax
    34ae:	89 c2                	mov    %eax,%edx
    34b0:	8b 45 08             	mov    0x8(%ebp),%eax
    34b3:	01 d0                	add    %edx,%eax
    34b5:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    34bb:	8b 45 0c             	mov    0xc(%ebp),%eax
    34be:	8b 00                	mov    (%eax),%eax
    34c0:	8d 50 01             	lea    0x1(%eax),%edx
    34c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    34c6:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    34c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34cb:	83 c0 01             	add    $0x1,%eax
    34ce:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    34d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    34d7:	8d 50 ff             	lea    -0x1(%eax),%edx
    34da:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    34e0:	39 c2                	cmp    %eax,%edx
    34e2:	0f 8d e5 fd ff ff    	jge    32cd <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    34e8:	83 ec 04             	sub    $0x4,%esp
    34eb:	68 e8 03 00 00       	push   $0x3e8
    34f0:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    34f6:	50                   	push   %eax
    34f7:	ff 75 e8             	pushl  -0x18(%ebp)
    34fa:	e8 2d cf ff ff       	call   42c <read>
    34ff:	83 c4 10             	add    $0x10,%esp
    3502:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3505:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3509:	0f 8f af fd ff ff    	jg     32be <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    350f:	83 ec 0c             	sub    $0xc,%esp
    3512:	ff 75 e8             	pushl  -0x18(%ebp)
    3515:	e8 22 cf ff ff       	call   43c <close>
    351a:	83 c4 10             	add    $0x10,%esp
}
    351d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3520:	c9                   	leave  
    3521:	c3                   	ret    

00003522 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3522:	55                   	push   %ebp
    3523:	89 e5                	mov    %esp,%ebp
    3525:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    352b:	83 ec 08             	sub    $0x8,%esp
    352e:	6a 02                	push   $0x2
    3530:	68 a0 3a 00 00       	push   $0x3aa0
    3535:	e8 1a cf ff ff       	call   454 <open>
    353a:	83 c4 10             	add    $0x10,%esp
    353d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3540:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3544:	78 1e                	js     3564 <writeVariables+0x42>
  {
    close(fd);
    3546:	83 ec 0c             	sub    $0xc,%esp
    3549:	ff 75 e4             	pushl  -0x1c(%ebp)
    354c:	e8 eb ce ff ff       	call   43c <close>
    3551:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    3554:	83 ec 0c             	sub    $0xc,%esp
    3557:	68 a0 3a 00 00       	push   $0x3aa0
    355c:	e8 03 cf ff ff       	call   464 <unlink>
    3561:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    3564:	83 ec 08             	sub    $0x8,%esp
    3567:	68 02 02 00 00       	push   $0x202
    356c:	68 a0 3a 00 00       	push   $0x3aa0
    3571:	e8 de ce ff ff       	call   454 <open>
    3576:	83 c4 10             	add    $0x10,%esp
    3579:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    357c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3583:	e9 ff 01 00 00       	jmp    3787 <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    3588:	8b 45 f4             	mov    -0xc(%ebp),%eax
    358b:	c1 e0 05             	shl    $0x5,%eax
    358e:	89 c2                	mov    %eax,%edx
    3590:	8b 45 08             	mov    0x8(%ebp),%eax
    3593:	01 d0                	add    %edx,%eax
    3595:	8b 00                	mov    (%eax),%eax
    3597:	83 f8 01             	cmp    $0x1,%eax
    359a:	0f 85 d3 00 00 00    	jne    3673 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    35a0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    35a7:	8b 45 e0             	mov    -0x20(%ebp),%eax
    35aa:	8d 50 01             	lea    0x1(%eax),%edx
    35ad:	89 55 e0             	mov    %edx,-0x20(%ebp)
    35b0:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    35b7:	64 
      int k=0;
    35b8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    35bf:	eb 2c                	jmp    35ed <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    35c1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    35c4:	8d 50 01             	lea    0x1(%eax),%edx
    35c7:	89 55 e0             	mov    %edx,-0x20(%ebp)
    35ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
    35cd:	89 d1                	mov    %edx,%ecx
    35cf:	c1 e1 05             	shl    $0x5,%ecx
    35d2:	8b 55 08             	mov    0x8(%ebp),%edx
    35d5:	01 d1                	add    %edx,%ecx
    35d7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    35da:	01 ca                	add    %ecx,%edx
    35dc:	83 c2 04             	add    $0x4,%edx
    35df:	0f b6 12             	movzbl (%edx),%edx
    35e2:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    35e9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    35ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35f0:	c1 e0 05             	shl    $0x5,%eax
    35f3:	89 c2                	mov    %eax,%edx
    35f5:	8b 45 08             	mov    0x8(%ebp),%eax
    35f8:	01 c2                	add    %eax,%edx
    35fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35fd:	01 d0                	add    %edx,%eax
    35ff:	83 c0 04             	add    $0x4,%eax
    3602:	0f b6 00             	movzbl (%eax),%eax
    3605:	84 c0                	test   %al,%al
    3607:	75 b8                	jne    35c1 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3609:	8b 45 e0             	mov    -0x20(%ebp),%eax
    360c:	8d 50 01             	lea    0x1(%eax),%edx
    360f:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3612:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    3619:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    361a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    361d:	c1 e0 05             	shl    $0x5,%eax
    3620:	89 c2                	mov    %eax,%edx
    3622:	8b 45 08             	mov    0x8(%ebp),%eax
    3625:	01 d0                	add    %edx,%eax
    3627:	dd 40 18             	fldl   0x18(%eax)
    362a:	8d 45 e0             	lea    -0x20(%ebp),%eax
    362d:	50                   	push   %eax
    362e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3632:	dd 1c 24             	fstpl  (%esp)
    3635:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    363b:	50                   	push   %eax
    363c:	e8 7d d5 ff ff       	call   bbe <double2str>
    3641:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    3644:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3647:	8d 50 01             	lea    0x1(%eax),%edx
    364a:	89 55 e0             	mov    %edx,-0x20(%ebp)
    364d:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    3654:	00 
      write(fd,buf,pos);
    3655:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3658:	83 ec 04             	sub    $0x4,%esp
    365b:	50                   	push   %eax
    365c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3662:	50                   	push   %eax
    3663:	ff 75 e4             	pushl  -0x1c(%ebp)
    3666:	e8 c9 cd ff ff       	call   434 <write>
    366b:	83 c4 10             	add    $0x10,%esp
    366e:	e9 10 01 00 00       	jmp    3783 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    3673:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    367a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    367d:	8d 50 01             	lea    0x1(%eax),%edx
    3680:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3683:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    368a:	73 
      int k=0;
    368b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    3692:	eb 2c                	jmp    36c0 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    3694:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3697:	8d 50 01             	lea    0x1(%eax),%edx
    369a:	89 55 ec             	mov    %edx,-0x14(%ebp)
    369d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    36a0:	89 d1                	mov    %edx,%ecx
    36a2:	c1 e1 05             	shl    $0x5,%ecx
    36a5:	8b 55 08             	mov    0x8(%ebp),%edx
    36a8:	01 d1                	add    %edx,%ecx
    36aa:	8b 55 e8             	mov    -0x18(%ebp),%edx
    36ad:	01 ca                	add    %ecx,%edx
    36af:	83 c2 04             	add    $0x4,%edx
    36b2:	0f b6 12             	movzbl (%edx),%edx
    36b5:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    36bc:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    36c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36c3:	c1 e0 05             	shl    $0x5,%eax
    36c6:	89 c2                	mov    %eax,%edx
    36c8:	8b 45 08             	mov    0x8(%ebp),%eax
    36cb:	01 c2                	add    %eax,%edx
    36cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    36d0:	01 d0                	add    %edx,%eax
    36d2:	83 c0 04             	add    $0x4,%eax
    36d5:	0f b6 00             	movzbl (%eax),%eax
    36d8:	84 c0                	test   %al,%al
    36da:	75 b8                	jne    3694 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    36dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    36df:	8d 50 01             	lea    0x1(%eax),%edx
    36e2:	89 55 ec             	mov    %edx,-0x14(%ebp)
    36e5:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    36ec:	3d 
      k=0;
    36ed:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    36f4:	eb 2c                	jmp    3722 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    36f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    36f9:	8d 50 01             	lea    0x1(%eax),%edx
    36fc:	89 55 ec             	mov    %edx,-0x14(%ebp)
    36ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3702:	89 d1                	mov    %edx,%ecx
    3704:	c1 e1 05             	shl    $0x5,%ecx
    3707:	8b 55 08             	mov    0x8(%ebp),%edx
    370a:	01 ca                	add    %ecx,%edx
    370c:	8b 4a 18             	mov    0x18(%edx),%ecx
    370f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3712:	01 ca                	add    %ecx,%edx
    3714:	0f b6 12             	movzbl (%edx),%edx
    3717:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    371e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    3722:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3725:	c1 e0 05             	shl    $0x5,%eax
    3728:	89 c2                	mov    %eax,%edx
    372a:	8b 45 08             	mov    0x8(%ebp),%eax
    372d:	01 d0                	add    %edx,%eax
    372f:	8b 50 18             	mov    0x18(%eax),%edx
    3732:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3735:	01 d0                	add    %edx,%eax
    3737:	0f b6 00             	movzbl (%eax),%eax
    373a:	84 c0                	test   %al,%al
    373c:	75 b8                	jne    36f6 <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    373e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3741:	8d 50 01             	lea    0x1(%eax),%edx
    3744:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3747:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    374e:	00 
      write(fd,buf,pos);
    374f:	83 ec 04             	sub    $0x4,%esp
    3752:	ff 75 ec             	pushl  -0x14(%ebp)
    3755:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    375b:	50                   	push   %eax
    375c:	ff 75 e4             	pushl  -0x1c(%ebp)
    375f:	e8 d0 cc ff ff       	call   434 <write>
    3764:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    3767:	8b 45 f4             	mov    -0xc(%ebp),%eax
    376a:	c1 e0 05             	shl    $0x5,%eax
    376d:	89 c2                	mov    %eax,%edx
    376f:	8b 45 08             	mov    0x8(%ebp),%eax
    3772:	01 d0                	add    %edx,%eax
    3774:	8b 40 18             	mov    0x18(%eax),%eax
    3777:	83 ec 0c             	sub    $0xc,%esp
    377a:	50                   	push   %eax
    377b:	e8 00 d1 ff ff       	call   880 <free>
    3780:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    3783:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3787:	8b 45 0c             	mov    0xc(%ebp),%eax
    378a:	8b 00                	mov    (%eax),%eax
    378c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    378f:	0f 8f f3 fd ff ff    	jg     3588 <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    3795:	8b 45 0c             	mov    0xc(%ebp),%eax
    3798:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    379e:	83 ec 0c             	sub    $0xc,%esp
    37a1:	ff 75 e4             	pushl  -0x1c(%ebp)
    37a4:	e8 93 cc ff ff       	call   43c <close>
    37a9:	83 c4 10             	add    $0x10,%esp
  return;
    37ac:	90                   	nop
    37ad:	c9                   	leave  
    37ae:	c3                   	ret    
