
_init：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "xvsh", 0 };

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 14             	sub    $0x14,%esp
  int pid, wpid;

  if(open("xv_console", O_RDWR) < 0){
      11:	83 ec 08             	sub    $0x8,%esp
      14:	6a 02                	push   $0x2
      16:	68 fd 36 00 00       	push   $0x36fd
      1b:	e8 78 03 00 00       	call   398 <open>
      20:	83 c4 10             	add    $0x10,%esp
      23:	85 c0                	test   %eax,%eax
      25:	79 26                	jns    4d <main+0x4d>
    mknod("xv_console", 1, 1);
      27:	83 ec 04             	sub    $0x4,%esp
      2a:	6a 01                	push   $0x1
      2c:	6a 01                	push   $0x1
      2e:	68 fd 36 00 00       	push   $0x36fd
      33:	e8 68 03 00 00       	call   3a0 <mknod>
      38:	83 c4 10             	add    $0x10,%esp
    open("xv_console", O_RDWR);
      3b:	83 ec 08             	sub    $0x8,%esp
      3e:	6a 02                	push   $0x2
      40:	68 fd 36 00 00       	push   $0x36fd
      45:	e8 4e 03 00 00       	call   398 <open>
      4a:	83 c4 10             	add    $0x10,%esp
  }
  dup(0);  // stdout
      4d:	83 ec 0c             	sub    $0xc,%esp
      50:	6a 00                	push   $0x0
      52:	e8 79 03 00 00       	call   3d0 <dup>
      57:	83 c4 10             	add    $0x10,%esp
  dup(0);  // stderr
      5a:	83 ec 0c             	sub    $0xc,%esp
      5d:	6a 00                	push   $0x0
      5f:	e8 6c 03 00 00       	call   3d0 <dup>
      64:	83 c4 10             	add    $0x10,%esp

  for(;;){
    printf(1, "init: starting xvsh\n");
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 08 37 00 00       	push   $0x3708
      6f:	6a 01                	push   $0x1
      71:	e8 8e 05 00 00       	call   604 <printf>
      76:	83 c4 10             	add    $0x10,%esp
    pid = fork();
      79:	e8 d2 02 00 00       	call   350 <fork>
      7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(pid < 0){
      81:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      85:	79 17                	jns    9e <main+0x9e>
      printf(1, "init: fork failed\n");
      87:	83 ec 08             	sub    $0x8,%esp
      8a:	68 1d 37 00 00       	push   $0x371d
      8f:	6a 01                	push   $0x1
      91:	e8 6e 05 00 00       	call   604 <printf>
      96:	83 c4 10             	add    $0x10,%esp
      exit();
      99:	e8 ba 02 00 00       	call   358 <exit>
    }
    if(pid == 0){
      9e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      a2:	75 3e                	jne    e2 <main+0xe2>
      exec("xvsh", argv);
      a4:	83 ec 08             	sub    $0x8,%esp
      a7:	68 60 43 00 00       	push   $0x4360
      ac:	68 f8 36 00 00       	push   $0x36f8
      b1:	e8 da 02 00 00       	call   390 <exec>
      b6:	83 c4 10             	add    $0x10,%esp
      printf(1, "init: exec sh failed\n");
      b9:	83 ec 08             	sub    $0x8,%esp
      bc:	68 30 37 00 00       	push   $0x3730
      c1:	6a 01                	push   $0x1
      c3:	e8 3c 05 00 00       	call   604 <printf>
      c8:	83 c4 10             	add    $0x10,%esp
      exit();
      cb:	e8 88 02 00 00       	call   358 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
      d0:	83 ec 08             	sub    $0x8,%esp
      d3:	68 46 37 00 00       	push   $0x3746
      d8:	6a 01                	push   $0x1
      da:	e8 25 05 00 00       	call   604 <printf>
      df:	83 c4 10             	add    $0x10,%esp
    if(pid == 0){
      exec("xvsh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      e2:	e8 79 02 00 00       	call   360 <wait>
      e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
      ea:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
      ee:	0f 88 73 ff ff ff    	js     67 <main+0x67>
      f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
      f7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
      fa:	75 d4                	jne    d0 <main+0xd0>
      printf(1, "zombie!\n");
  }
      fc:	e9 66 ff ff ff       	jmp    67 <main+0x67>

00000101 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     101:	55                   	push   %ebp
     102:	89 e5                	mov    %esp,%ebp
     104:	57                   	push   %edi
     105:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     106:	8b 4d 08             	mov    0x8(%ebp),%ecx
     109:	8b 55 10             	mov    0x10(%ebp),%edx
     10c:	8b 45 0c             	mov    0xc(%ebp),%eax
     10f:	89 cb                	mov    %ecx,%ebx
     111:	89 df                	mov    %ebx,%edi
     113:	89 d1                	mov    %edx,%ecx
     115:	fc                   	cld    
     116:	f3 aa                	rep stos %al,%es:(%edi)
     118:	89 ca                	mov    %ecx,%edx
     11a:	89 fb                	mov    %edi,%ebx
     11c:	89 5d 08             	mov    %ebx,0x8(%ebp)
     11f:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     122:	90                   	nop
     123:	5b                   	pop    %ebx
     124:	5f                   	pop    %edi
     125:	5d                   	pop    %ebp
     126:	c3                   	ret    

00000127 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     127:	55                   	push   %ebp
     128:	89 e5                	mov    %esp,%ebp
     12a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     12d:	8b 45 08             	mov    0x8(%ebp),%eax
     130:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     133:	90                   	nop
     134:	8b 45 08             	mov    0x8(%ebp),%eax
     137:	8d 50 01             	lea    0x1(%eax),%edx
     13a:	89 55 08             	mov    %edx,0x8(%ebp)
     13d:	8b 55 0c             	mov    0xc(%ebp),%edx
     140:	8d 4a 01             	lea    0x1(%edx),%ecx
     143:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     146:	0f b6 12             	movzbl (%edx),%edx
     149:	88 10                	mov    %dl,(%eax)
     14b:	0f b6 00             	movzbl (%eax),%eax
     14e:	84 c0                	test   %al,%al
     150:	75 e2                	jne    134 <strcpy+0xd>
    ;
  return os;
     152:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     155:	c9                   	leave  
     156:	c3                   	ret    

00000157 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     157:	55                   	push   %ebp
     158:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     15a:	eb 08                	jmp    164 <strcmp+0xd>
    p++, q++;
     15c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     160:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     164:	8b 45 08             	mov    0x8(%ebp),%eax
     167:	0f b6 00             	movzbl (%eax),%eax
     16a:	84 c0                	test   %al,%al
     16c:	74 10                	je     17e <strcmp+0x27>
     16e:	8b 45 08             	mov    0x8(%ebp),%eax
     171:	0f b6 10             	movzbl (%eax),%edx
     174:	8b 45 0c             	mov    0xc(%ebp),%eax
     177:	0f b6 00             	movzbl (%eax),%eax
     17a:	38 c2                	cmp    %al,%dl
     17c:	74 de                	je     15c <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     17e:	8b 45 08             	mov    0x8(%ebp),%eax
     181:	0f b6 00             	movzbl (%eax),%eax
     184:	0f b6 d0             	movzbl %al,%edx
     187:	8b 45 0c             	mov    0xc(%ebp),%eax
     18a:	0f b6 00             	movzbl (%eax),%eax
     18d:	0f b6 c0             	movzbl %al,%eax
     190:	29 c2                	sub    %eax,%edx
     192:	89 d0                	mov    %edx,%eax
}
     194:	5d                   	pop    %ebp
     195:	c3                   	ret    

00000196 <strlen>:

uint
strlen(char *s)
{
     196:	55                   	push   %ebp
     197:	89 e5                	mov    %esp,%ebp
     199:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     19c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     1a3:	eb 04                	jmp    1a9 <strlen+0x13>
     1a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     1a9:	8b 55 fc             	mov    -0x4(%ebp),%edx
     1ac:	8b 45 08             	mov    0x8(%ebp),%eax
     1af:	01 d0                	add    %edx,%eax
     1b1:	0f b6 00             	movzbl (%eax),%eax
     1b4:	84 c0                	test   %al,%al
     1b6:	75 ed                	jne    1a5 <strlen+0xf>
    ;
  return n;
     1b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     1bb:	c9                   	leave  
     1bc:	c3                   	ret    

000001bd <memset>:

void*
memset(void *dst, int c, uint n)
{
     1bd:	55                   	push   %ebp
     1be:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     1c0:	8b 45 10             	mov    0x10(%ebp),%eax
     1c3:	50                   	push   %eax
     1c4:	ff 75 0c             	pushl  0xc(%ebp)
     1c7:	ff 75 08             	pushl  0x8(%ebp)
     1ca:	e8 32 ff ff ff       	call   101 <stosb>
     1cf:	83 c4 0c             	add    $0xc,%esp
  return dst;
     1d2:	8b 45 08             	mov    0x8(%ebp),%eax
}
     1d5:	c9                   	leave  
     1d6:	c3                   	ret    

000001d7 <strchr>:

char*
strchr(const char *s, char c)
{
     1d7:	55                   	push   %ebp
     1d8:	89 e5                	mov    %esp,%ebp
     1da:	83 ec 04             	sub    $0x4,%esp
     1dd:	8b 45 0c             	mov    0xc(%ebp),%eax
     1e0:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     1e3:	eb 14                	jmp    1f9 <strchr+0x22>
    if(*s == c)
     1e5:	8b 45 08             	mov    0x8(%ebp),%eax
     1e8:	0f b6 00             	movzbl (%eax),%eax
     1eb:	3a 45 fc             	cmp    -0x4(%ebp),%al
     1ee:	75 05                	jne    1f5 <strchr+0x1e>
      return (char*)s;
     1f0:	8b 45 08             	mov    0x8(%ebp),%eax
     1f3:	eb 13                	jmp    208 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     1f5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     1f9:	8b 45 08             	mov    0x8(%ebp),%eax
     1fc:	0f b6 00             	movzbl (%eax),%eax
     1ff:	84 c0                	test   %al,%al
     201:	75 e2                	jne    1e5 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     203:	b8 00 00 00 00       	mov    $0x0,%eax
}
     208:	c9                   	leave  
     209:	c3                   	ret    

0000020a <gets>:

char*
gets(char *buf, int max)
{
     20a:	55                   	push   %ebp
     20b:	89 e5                	mov    %esp,%ebp
     20d:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     210:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     217:	eb 42                	jmp    25b <gets+0x51>
    cc = read(0, &c, 1);
     219:	83 ec 04             	sub    $0x4,%esp
     21c:	6a 01                	push   $0x1
     21e:	8d 45 ef             	lea    -0x11(%ebp),%eax
     221:	50                   	push   %eax
     222:	6a 00                	push   $0x0
     224:	e8 47 01 00 00       	call   370 <read>
     229:	83 c4 10             	add    $0x10,%esp
     22c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     22f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     233:	7e 33                	jle    268 <gets+0x5e>
      break;
    buf[i++] = c;
     235:	8b 45 f4             	mov    -0xc(%ebp),%eax
     238:	8d 50 01             	lea    0x1(%eax),%edx
     23b:	89 55 f4             	mov    %edx,-0xc(%ebp)
     23e:	89 c2                	mov    %eax,%edx
     240:	8b 45 08             	mov    0x8(%ebp),%eax
     243:	01 c2                	add    %eax,%edx
     245:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     249:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     24b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     24f:	3c 0a                	cmp    $0xa,%al
     251:	74 16                	je     269 <gets+0x5f>
     253:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     257:	3c 0d                	cmp    $0xd,%al
     259:	74 0e                	je     269 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     25b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     25e:	83 c0 01             	add    $0x1,%eax
     261:	3b 45 0c             	cmp    0xc(%ebp),%eax
     264:	7c b3                	jl     219 <gets+0xf>
     266:	eb 01                	jmp    269 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     268:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     269:	8b 55 f4             	mov    -0xc(%ebp),%edx
     26c:	8b 45 08             	mov    0x8(%ebp),%eax
     26f:	01 d0                	add    %edx,%eax
     271:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     274:	8b 45 08             	mov    0x8(%ebp),%eax
}
     277:	c9                   	leave  
     278:	c3                   	ret    

00000279 <stat>:

int
stat(char *n, struct stat *st)
{
     279:	55                   	push   %ebp
     27a:	89 e5                	mov    %esp,%ebp
     27c:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     27f:	83 ec 08             	sub    $0x8,%esp
     282:	6a 00                	push   $0x0
     284:	ff 75 08             	pushl  0x8(%ebp)
     287:	e8 0c 01 00 00       	call   398 <open>
     28c:	83 c4 10             	add    $0x10,%esp
     28f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     292:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     296:	79 07                	jns    29f <stat+0x26>
    return -1;
     298:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     29d:	eb 25                	jmp    2c4 <stat+0x4b>
  r = fstat(fd, st);
     29f:	83 ec 08             	sub    $0x8,%esp
     2a2:	ff 75 0c             	pushl  0xc(%ebp)
     2a5:	ff 75 f4             	pushl  -0xc(%ebp)
     2a8:	e8 03 01 00 00       	call   3b0 <fstat>
     2ad:	83 c4 10             	add    $0x10,%esp
     2b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     2b3:	83 ec 0c             	sub    $0xc,%esp
     2b6:	ff 75 f4             	pushl  -0xc(%ebp)
     2b9:	e8 c2 00 00 00       	call   380 <close>
     2be:	83 c4 10             	add    $0x10,%esp
  return r;
     2c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     2c4:	c9                   	leave  
     2c5:	c3                   	ret    

000002c6 <atoi>:

int
atoi(const char *s)
{
     2c6:	55                   	push   %ebp
     2c7:	89 e5                	mov    %esp,%ebp
     2c9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     2cc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     2d3:	eb 25                	jmp    2fa <atoi+0x34>
    n = n*10 + *s++ - '0';
     2d5:	8b 55 fc             	mov    -0x4(%ebp),%edx
     2d8:	89 d0                	mov    %edx,%eax
     2da:	c1 e0 02             	shl    $0x2,%eax
     2dd:	01 d0                	add    %edx,%eax
     2df:	01 c0                	add    %eax,%eax
     2e1:	89 c1                	mov    %eax,%ecx
     2e3:	8b 45 08             	mov    0x8(%ebp),%eax
     2e6:	8d 50 01             	lea    0x1(%eax),%edx
     2e9:	89 55 08             	mov    %edx,0x8(%ebp)
     2ec:	0f b6 00             	movzbl (%eax),%eax
     2ef:	0f be c0             	movsbl %al,%eax
     2f2:	01 c8                	add    %ecx,%eax
     2f4:	83 e8 30             	sub    $0x30,%eax
     2f7:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     2fa:	8b 45 08             	mov    0x8(%ebp),%eax
     2fd:	0f b6 00             	movzbl (%eax),%eax
     300:	3c 2f                	cmp    $0x2f,%al
     302:	7e 0a                	jle    30e <atoi+0x48>
     304:	8b 45 08             	mov    0x8(%ebp),%eax
     307:	0f b6 00             	movzbl (%eax),%eax
     30a:	3c 39                	cmp    $0x39,%al
     30c:	7e c7                	jle    2d5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     30e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     311:	c9                   	leave  
     312:	c3                   	ret    

00000313 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     313:	55                   	push   %ebp
     314:	89 e5                	mov    %esp,%ebp
     316:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     319:	8b 45 08             	mov    0x8(%ebp),%eax
     31c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     31f:	8b 45 0c             	mov    0xc(%ebp),%eax
     322:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     325:	eb 17                	jmp    33e <memmove+0x2b>
    *dst++ = *src++;
     327:	8b 45 fc             	mov    -0x4(%ebp),%eax
     32a:	8d 50 01             	lea    0x1(%eax),%edx
     32d:	89 55 fc             	mov    %edx,-0x4(%ebp)
     330:	8b 55 f8             	mov    -0x8(%ebp),%edx
     333:	8d 4a 01             	lea    0x1(%edx),%ecx
     336:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     339:	0f b6 12             	movzbl (%edx),%edx
     33c:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     33e:	8b 45 10             	mov    0x10(%ebp),%eax
     341:	8d 50 ff             	lea    -0x1(%eax),%edx
     344:	89 55 10             	mov    %edx,0x10(%ebp)
     347:	85 c0                	test   %eax,%eax
     349:	7f dc                	jg     327 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     34b:	8b 45 08             	mov    0x8(%ebp),%eax
}
     34e:	c9                   	leave  
     34f:	c3                   	ret    

00000350 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     350:	b8 01 00 00 00       	mov    $0x1,%eax
     355:	cd 40                	int    $0x40
     357:	c3                   	ret    

00000358 <exit>:
SYSCALL(exit)
     358:	b8 02 00 00 00       	mov    $0x2,%eax
     35d:	cd 40                	int    $0x40
     35f:	c3                   	ret    

00000360 <wait>:
SYSCALL(wait)
     360:	b8 03 00 00 00       	mov    $0x3,%eax
     365:	cd 40                	int    $0x40
     367:	c3                   	ret    

00000368 <pipe>:
SYSCALL(pipe)
     368:	b8 04 00 00 00       	mov    $0x4,%eax
     36d:	cd 40                	int    $0x40
     36f:	c3                   	ret    

00000370 <read>:
SYSCALL(read)
     370:	b8 05 00 00 00       	mov    $0x5,%eax
     375:	cd 40                	int    $0x40
     377:	c3                   	ret    

00000378 <write>:
SYSCALL(write)
     378:	b8 10 00 00 00       	mov    $0x10,%eax
     37d:	cd 40                	int    $0x40
     37f:	c3                   	ret    

00000380 <close>:
SYSCALL(close)
     380:	b8 15 00 00 00       	mov    $0x15,%eax
     385:	cd 40                	int    $0x40
     387:	c3                   	ret    

00000388 <kill>:
SYSCALL(kill)
     388:	b8 06 00 00 00       	mov    $0x6,%eax
     38d:	cd 40                	int    $0x40
     38f:	c3                   	ret    

00000390 <exec>:
SYSCALL(exec)
     390:	b8 07 00 00 00       	mov    $0x7,%eax
     395:	cd 40                	int    $0x40
     397:	c3                   	ret    

00000398 <open>:
SYSCALL(open)
     398:	b8 0f 00 00 00       	mov    $0xf,%eax
     39d:	cd 40                	int    $0x40
     39f:	c3                   	ret    

000003a0 <mknod>:
SYSCALL(mknod)
     3a0:	b8 11 00 00 00       	mov    $0x11,%eax
     3a5:	cd 40                	int    $0x40
     3a7:	c3                   	ret    

000003a8 <unlink>:
SYSCALL(unlink)
     3a8:	b8 12 00 00 00       	mov    $0x12,%eax
     3ad:	cd 40                	int    $0x40
     3af:	c3                   	ret    

000003b0 <fstat>:
SYSCALL(fstat)
     3b0:	b8 08 00 00 00       	mov    $0x8,%eax
     3b5:	cd 40                	int    $0x40
     3b7:	c3                   	ret    

000003b8 <link>:
SYSCALL(link)
     3b8:	b8 13 00 00 00       	mov    $0x13,%eax
     3bd:	cd 40                	int    $0x40
     3bf:	c3                   	ret    

000003c0 <mkdir>:
SYSCALL(mkdir)
     3c0:	b8 14 00 00 00       	mov    $0x14,%eax
     3c5:	cd 40                	int    $0x40
     3c7:	c3                   	ret    

000003c8 <chdir>:
SYSCALL(chdir)
     3c8:	b8 09 00 00 00       	mov    $0x9,%eax
     3cd:	cd 40                	int    $0x40
     3cf:	c3                   	ret    

000003d0 <dup>:
SYSCALL(dup)
     3d0:	b8 0a 00 00 00       	mov    $0xa,%eax
     3d5:	cd 40                	int    $0x40
     3d7:	c3                   	ret    

000003d8 <getpid>:
SYSCALL(getpid)
     3d8:	b8 0b 00 00 00       	mov    $0xb,%eax
     3dd:	cd 40                	int    $0x40
     3df:	c3                   	ret    

000003e0 <sbrk>:
SYSCALL(sbrk)
     3e0:	b8 0c 00 00 00       	mov    $0xc,%eax
     3e5:	cd 40                	int    $0x40
     3e7:	c3                   	ret    

000003e8 <sleep>:
SYSCALL(sleep)
     3e8:	b8 0d 00 00 00       	mov    $0xd,%eax
     3ed:	cd 40                	int    $0x40
     3ef:	c3                   	ret    

000003f0 <uptime>:
SYSCALL(uptime)
     3f0:	b8 0e 00 00 00       	mov    $0xe,%eax
     3f5:	cd 40                	int    $0x40
     3f7:	c3                   	ret    

000003f8 <colorwrite>:

//new here
SYSCALL(colorwrite)
     3f8:	b8 16 00 00 00       	mov    $0x16,%eax
     3fd:	cd 40                	int    $0x40
     3ff:	c3                   	ret    

00000400 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	83 ec 18             	sub    $0x18,%esp
     406:	8b 45 0c             	mov    0xc(%ebp),%eax
     409:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     40c:	83 ec 04             	sub    $0x4,%esp
     40f:	6a 01                	push   $0x1
     411:	8d 45 f4             	lea    -0xc(%ebp),%eax
     414:	50                   	push   %eax
     415:	ff 75 08             	pushl  0x8(%ebp)
     418:	e8 5b ff ff ff       	call   378 <write>
     41d:	83 c4 10             	add    $0x10,%esp
}
     420:	90                   	nop
     421:	c9                   	leave  
     422:	c3                   	ret    

00000423 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     423:	55                   	push   %ebp
     424:	89 e5                	mov    %esp,%ebp
     426:	53                   	push   %ebx
     427:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     42a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     431:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     435:	74 17                	je     44e <printint+0x2b>
     437:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     43b:	79 11                	jns    44e <printint+0x2b>
    neg = 1;
     43d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     444:	8b 45 0c             	mov    0xc(%ebp),%eax
     447:	f7 d8                	neg    %eax
     449:	89 45 ec             	mov    %eax,-0x14(%ebp)
     44c:	eb 06                	jmp    454 <printint+0x31>
  } else {
    x = xx;
     44e:	8b 45 0c             	mov    0xc(%ebp),%eax
     451:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     454:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     45b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     45e:	8d 41 01             	lea    0x1(%ecx),%eax
     461:	89 45 f4             	mov    %eax,-0xc(%ebp)
     464:	8b 5d 10             	mov    0x10(%ebp),%ebx
     467:	8b 45 ec             	mov    -0x14(%ebp),%eax
     46a:	ba 00 00 00 00       	mov    $0x0,%edx
     46f:	f7 f3                	div    %ebx
     471:	89 d0                	mov    %edx,%eax
     473:	0f b6 80 68 43 00 00 	movzbl 0x4368(%eax),%eax
     47a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     47e:	8b 5d 10             	mov    0x10(%ebp),%ebx
     481:	8b 45 ec             	mov    -0x14(%ebp),%eax
     484:	ba 00 00 00 00       	mov    $0x0,%edx
     489:	f7 f3                	div    %ebx
     48b:	89 45 ec             	mov    %eax,-0x14(%ebp)
     48e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     492:	75 c7                	jne    45b <printint+0x38>
  if(neg)
     494:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     498:	74 2d                	je     4c7 <printint+0xa4>
    buf[i++] = '-';
     49a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     49d:	8d 50 01             	lea    0x1(%eax),%edx
     4a0:	89 55 f4             	mov    %edx,-0xc(%ebp)
     4a3:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     4a8:	eb 1d                	jmp    4c7 <printint+0xa4>
    putc(fd, buf[i]);
     4aa:	8d 55 dc             	lea    -0x24(%ebp),%edx
     4ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4b0:	01 d0                	add    %edx,%eax
     4b2:	0f b6 00             	movzbl (%eax),%eax
     4b5:	0f be c0             	movsbl %al,%eax
     4b8:	83 ec 08             	sub    $0x8,%esp
     4bb:	50                   	push   %eax
     4bc:	ff 75 08             	pushl  0x8(%ebp)
     4bf:	e8 3c ff ff ff       	call   400 <putc>
     4c4:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     4c7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     4cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     4cf:	79 d9                	jns    4aa <printint+0x87>
    putc(fd, buf[i]);
}
     4d1:	90                   	nop
     4d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4d5:	c9                   	leave  
     4d6:	c3                   	ret    

000004d7 <getInteger>:

static int getInteger(double num)
{
     4d7:	55                   	push   %ebp
     4d8:	89 e5                	mov    %esp,%ebp
     4da:	83 ec 18             	sub    $0x18,%esp
     4dd:	8b 45 08             	mov    0x8(%ebp),%eax
     4e0:	89 45 e8             	mov    %eax,-0x18(%ebp)
     4e3:	8b 45 0c             	mov    0xc(%ebp),%eax
     4e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     4e9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     4f0:	eb 0e                	jmp    500 <getInteger+0x29>
  {
    num -= 1;
     4f2:	dd 45 e8             	fldl   -0x18(%ebp)
     4f5:	d9 e8                	fld1   
     4f7:	de e9                	fsubrp %st,%st(1)
     4f9:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     4fc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     500:	dd 45 e8             	fldl   -0x18(%ebp)
     503:	d9 e8                	fld1   
     505:	d9 c9                	fxch   %st(1)
     507:	df e9                	fucomip %st(1),%st
     509:	dd d8                	fstp   %st(0)
     50b:	77 e5                	ja     4f2 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     50d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     510:	c9                   	leave  
     511:	c3                   	ret    

00000512 <printdbl>:

void printdbl(int fd, double num)
{
     512:	55                   	push   %ebp
     513:	89 e5                	mov    %esp,%ebp
     515:	83 ec 28             	sub    $0x28,%esp
     518:	8b 45 0c             	mov    0xc(%ebp),%eax
     51b:	89 45 e0             	mov    %eax,-0x20(%ebp)
     51e:	8b 45 10             	mov    0x10(%ebp),%eax
     521:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     524:	d9 ee                	fldz   
     526:	dd 45 e0             	fldl   -0x20(%ebp)
     529:	d9 c9                	fxch   %st(1)
     52b:	df e9                	fucomip %st(1),%st
     52d:	dd d8                	fstp   %st(0)
     52f:	76 18                	jbe    549 <printdbl+0x37>
  {
    putc(fd,'-');
     531:	83 ec 08             	sub    $0x8,%esp
     534:	6a 2d                	push   $0x2d
     536:	ff 75 08             	pushl  0x8(%ebp)
     539:	e8 c2 fe ff ff       	call   400 <putc>
     53e:	83 c4 10             	add    $0x10,%esp
    num = -num;
     541:	dd 45 e0             	fldl   -0x20(%ebp)
     544:	d9 e0                	fchs   
     546:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     549:	83 ec 08             	sub    $0x8,%esp
     54c:	ff 75 e4             	pushl  -0x1c(%ebp)
     54f:	ff 75 e0             	pushl  -0x20(%ebp)
     552:	e8 80 ff ff ff       	call   4d7 <getInteger>
     557:	83 c4 10             	add    $0x10,%esp
     55a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     55d:	6a 01                	push   $0x1
     55f:	6a 0a                	push   $0xa
     561:	ff 75 f0             	pushl  -0x10(%ebp)
     564:	ff 75 08             	pushl  0x8(%ebp)
     567:	e8 b7 fe ff ff       	call   423 <printint>
     56c:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     56f:	db 45 f0             	fildl  -0x10(%ebp)
     572:	dd 45 e0             	fldl   -0x20(%ebp)
     575:	de e1                	fsubp  %st,%st(1)
     577:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     57a:	dd 45 e0             	fldl   -0x20(%ebp)
     57d:	dd 05 58 37 00 00    	fldl   0x3758
     583:	d9 c9                	fxch   %st(1)
     585:	df e9                	fucomip %st(1),%st
     587:	dd d8                	fstp   %st(0)
     589:	76 10                	jbe    59b <printdbl+0x89>
    putc(fd,'.');
     58b:	83 ec 08             	sub    $0x8,%esp
     58e:	6a 2e                	push   $0x2e
     590:	ff 75 08             	pushl  0x8(%ebp)
     593:	e8 68 fe ff ff       	call   400 <putc>
     598:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     59b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     5a2:	eb 49                	jmp    5ed <printdbl+0xdb>
  {
    num = num*10;
     5a4:	dd 45 e0             	fldl   -0x20(%ebp)
     5a7:	dd 05 60 37 00 00    	fldl   0x3760
     5ad:	de c9                	fmulp  %st,%st(1)
     5af:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     5b2:	83 ec 08             	sub    $0x8,%esp
     5b5:	ff 75 e4             	pushl  -0x1c(%ebp)
     5b8:	ff 75 e0             	pushl  -0x20(%ebp)
     5bb:	e8 17 ff ff ff       	call   4d7 <getInteger>
     5c0:	83 c4 10             	add    $0x10,%esp
     5c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     5c6:	6a 01                	push   $0x1
     5c8:	6a 0a                	push   $0xa
     5ca:	ff 75 f0             	pushl  -0x10(%ebp)
     5cd:	ff 75 08             	pushl  0x8(%ebp)
     5d0:	e8 4e fe ff ff       	call   423 <printint>
     5d5:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     5d8:	db 45 f0             	fildl  -0x10(%ebp)
     5db:	dd 45 e0             	fldl   -0x20(%ebp)
     5de:	de e1                	fsubp  %st,%st(1)
     5e0:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     5e3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     5e7:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     5eb:	7f 13                	jg     600 <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     5ed:	dd 45 e0             	fldl   -0x20(%ebp)
     5f0:	dd 05 58 37 00 00    	fldl   0x3758
     5f6:	d9 c9                	fxch   %st(1)
     5f8:	df e9                	fucomip %st(1),%st
     5fa:	dd d8                	fstp   %st(0)
     5fc:	77 a6                	ja     5a4 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     5fe:	eb 01                	jmp    601 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     600:	90                   	nop
    }
  }
}
     601:	90                   	nop
     602:	c9                   	leave  
     603:	c3                   	ret    

00000604 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     604:	55                   	push   %ebp
     605:	89 e5                	mov    %esp,%ebp
     607:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     60a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     611:	8d 45 0c             	lea    0xc(%ebp),%eax
     614:	83 c0 04             	add    $0x4,%eax
     617:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     61a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     621:	e9 88 01 00 00       	jmp    7ae <printf+0x1aa>
    c = fmt[i] & 0xff;
     626:	8b 55 0c             	mov    0xc(%ebp),%edx
     629:	8b 45 f0             	mov    -0x10(%ebp),%eax
     62c:	01 d0                	add    %edx,%eax
     62e:	0f b6 00             	movzbl (%eax),%eax
     631:	0f be c0             	movsbl %al,%eax
     634:	25 ff 00 00 00       	and    $0xff,%eax
     639:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     63c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     640:	75 2c                	jne    66e <printf+0x6a>
      if(c == '%'){
     642:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     646:	75 0c                	jne    654 <printf+0x50>
        state = '%';
     648:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     64f:	e9 56 01 00 00       	jmp    7aa <printf+0x1a6>
      } else {
        putc(fd, c);
     654:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     657:	0f be c0             	movsbl %al,%eax
     65a:	83 ec 08             	sub    $0x8,%esp
     65d:	50                   	push   %eax
     65e:	ff 75 08             	pushl  0x8(%ebp)
     661:	e8 9a fd ff ff       	call   400 <putc>
     666:	83 c4 10             	add    $0x10,%esp
     669:	e9 3c 01 00 00       	jmp    7aa <printf+0x1a6>
      }
    } else if(state == '%'){
     66e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     672:	0f 85 32 01 00 00    	jne    7aa <printf+0x1a6>
      if(c == 'd'){
     678:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     67c:	75 1e                	jne    69c <printf+0x98>
        printint(fd, *ap, 10, 1);
     67e:	8b 45 e8             	mov    -0x18(%ebp),%eax
     681:	8b 00                	mov    (%eax),%eax
     683:	6a 01                	push   $0x1
     685:	6a 0a                	push   $0xa
     687:	50                   	push   %eax
     688:	ff 75 08             	pushl  0x8(%ebp)
     68b:	e8 93 fd ff ff       	call   423 <printint>
     690:	83 c4 10             	add    $0x10,%esp
        ap++;
     693:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     697:	e9 07 01 00 00       	jmp    7a3 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     69c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     6a0:	74 06                	je     6a8 <printf+0xa4>
     6a2:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     6a6:	75 1e                	jne    6c6 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     6a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6ab:	8b 00                	mov    (%eax),%eax
     6ad:	6a 00                	push   $0x0
     6af:	6a 10                	push   $0x10
     6b1:	50                   	push   %eax
     6b2:	ff 75 08             	pushl  0x8(%ebp)
     6b5:	e8 69 fd ff ff       	call   423 <printint>
     6ba:	83 c4 10             	add    $0x10,%esp
        ap++;
     6bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     6c1:	e9 dd 00 00 00       	jmp    7a3 <printf+0x19f>
      } else if(c == 's'){
     6c6:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     6ca:	75 46                	jne    712 <printf+0x10e>
        s = (char*)*ap;
     6cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6cf:	8b 00                	mov    (%eax),%eax
     6d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     6d4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     6d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     6dc:	75 25                	jne    703 <printf+0xff>
          s = "(null)";
     6de:	c7 45 f4 50 37 00 00 	movl   $0x3750,-0xc(%ebp)
        while(*s != 0){
     6e5:	eb 1c                	jmp    703 <printf+0xff>
          putc(fd, *s);
     6e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6ea:	0f b6 00             	movzbl (%eax),%eax
     6ed:	0f be c0             	movsbl %al,%eax
     6f0:	83 ec 08             	sub    $0x8,%esp
     6f3:	50                   	push   %eax
     6f4:	ff 75 08             	pushl  0x8(%ebp)
     6f7:	e8 04 fd ff ff       	call   400 <putc>
     6fc:	83 c4 10             	add    $0x10,%esp
          s++;
     6ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     703:	8b 45 f4             	mov    -0xc(%ebp),%eax
     706:	0f b6 00             	movzbl (%eax),%eax
     709:	84 c0                	test   %al,%al
     70b:	75 da                	jne    6e7 <printf+0xe3>
     70d:	e9 91 00 00 00       	jmp    7a3 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     712:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     716:	75 1d                	jne    735 <printf+0x131>
        putc(fd, *ap);
     718:	8b 45 e8             	mov    -0x18(%ebp),%eax
     71b:	8b 00                	mov    (%eax),%eax
     71d:	0f be c0             	movsbl %al,%eax
     720:	83 ec 08             	sub    $0x8,%esp
     723:	50                   	push   %eax
     724:	ff 75 08             	pushl  0x8(%ebp)
     727:	e8 d4 fc ff ff       	call   400 <putc>
     72c:	83 c4 10             	add    $0x10,%esp
        ap++;
     72f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     733:	eb 6e                	jmp    7a3 <printf+0x19f>
      } else if(c == '%'){
     735:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     739:	75 17                	jne    752 <printf+0x14e>
        putc(fd, c);
     73b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     73e:	0f be c0             	movsbl %al,%eax
     741:	83 ec 08             	sub    $0x8,%esp
     744:	50                   	push   %eax
     745:	ff 75 08             	pushl  0x8(%ebp)
     748:	e8 b3 fc ff ff       	call   400 <putc>
     74d:	83 c4 10             	add    $0x10,%esp
     750:	eb 51                	jmp    7a3 <printf+0x19f>
      } else if(c == 'f'){ //for double
     752:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     756:	75 26                	jne    77e <printf+0x17a>
        double *dap = (double*)ap;
     758:	8b 45 e8             	mov    -0x18(%ebp),%eax
     75b:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     75e:	8b 45 e0             	mov    -0x20(%ebp),%eax
     761:	dd 00                	fldl   (%eax)
     763:	83 ec 04             	sub    $0x4,%esp
     766:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     76a:	dd 1c 24             	fstpl  (%esp)
     76d:	ff 75 08             	pushl  0x8(%ebp)
     770:	e8 9d fd ff ff       	call   512 <printdbl>
     775:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     778:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     77c:	eb 25                	jmp    7a3 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     77e:	83 ec 08             	sub    $0x8,%esp
     781:	6a 25                	push   $0x25
     783:	ff 75 08             	pushl  0x8(%ebp)
     786:	e8 75 fc ff ff       	call   400 <putc>
     78b:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     78e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     791:	0f be c0             	movsbl %al,%eax
     794:	83 ec 08             	sub    $0x8,%esp
     797:	50                   	push   %eax
     798:	ff 75 08             	pushl  0x8(%ebp)
     79b:	e8 60 fc ff ff       	call   400 <putc>
     7a0:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     7a3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     7aa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     7ae:	8b 55 0c             	mov    0xc(%ebp),%edx
     7b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7b4:	01 d0                	add    %edx,%eax
     7b6:	0f b6 00             	movzbl (%eax),%eax
     7b9:	84 c0                	test   %al,%al
     7bb:	0f 85 65 fe ff ff    	jne    626 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     7c1:	90                   	nop
     7c2:	c9                   	leave  
     7c3:	c3                   	ret    

000007c4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     7c4:	55                   	push   %ebp
     7c5:	89 e5                	mov    %esp,%ebp
     7c7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     7ca:	8b 45 08             	mov    0x8(%ebp),%eax
     7cd:	83 e8 08             	sub    $0x8,%eax
     7d0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     7d3:	a1 a8 44 00 00       	mov    0x44a8,%eax
     7d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
     7db:	eb 24                	jmp    801 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     7dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7e0:	8b 00                	mov    (%eax),%eax
     7e2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     7e5:	77 12                	ja     7f9 <free+0x35>
     7e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7ea:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     7ed:	77 24                	ja     813 <free+0x4f>
     7ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7f2:	8b 00                	mov    (%eax),%eax
     7f4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     7f7:	77 1a                	ja     813 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     7f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7fc:	8b 00                	mov    (%eax),%eax
     7fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
     801:	8b 45 f8             	mov    -0x8(%ebp),%eax
     804:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     807:	76 d4                	jbe    7dd <free+0x19>
     809:	8b 45 fc             	mov    -0x4(%ebp),%eax
     80c:	8b 00                	mov    (%eax),%eax
     80e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     811:	76 ca                	jbe    7dd <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     813:	8b 45 f8             	mov    -0x8(%ebp),%eax
     816:	8b 40 04             	mov    0x4(%eax),%eax
     819:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     820:	8b 45 f8             	mov    -0x8(%ebp),%eax
     823:	01 c2                	add    %eax,%edx
     825:	8b 45 fc             	mov    -0x4(%ebp),%eax
     828:	8b 00                	mov    (%eax),%eax
     82a:	39 c2                	cmp    %eax,%edx
     82c:	75 24                	jne    852 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     82e:	8b 45 f8             	mov    -0x8(%ebp),%eax
     831:	8b 50 04             	mov    0x4(%eax),%edx
     834:	8b 45 fc             	mov    -0x4(%ebp),%eax
     837:	8b 00                	mov    (%eax),%eax
     839:	8b 40 04             	mov    0x4(%eax),%eax
     83c:	01 c2                	add    %eax,%edx
     83e:	8b 45 f8             	mov    -0x8(%ebp),%eax
     841:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     844:	8b 45 fc             	mov    -0x4(%ebp),%eax
     847:	8b 00                	mov    (%eax),%eax
     849:	8b 10                	mov    (%eax),%edx
     84b:	8b 45 f8             	mov    -0x8(%ebp),%eax
     84e:	89 10                	mov    %edx,(%eax)
     850:	eb 0a                	jmp    85c <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     852:	8b 45 fc             	mov    -0x4(%ebp),%eax
     855:	8b 10                	mov    (%eax),%edx
     857:	8b 45 f8             	mov    -0x8(%ebp),%eax
     85a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     85c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     85f:	8b 40 04             	mov    0x4(%eax),%eax
     862:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     869:	8b 45 fc             	mov    -0x4(%ebp),%eax
     86c:	01 d0                	add    %edx,%eax
     86e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     871:	75 20                	jne    893 <free+0xcf>
    p->s.size += bp->s.size;
     873:	8b 45 fc             	mov    -0x4(%ebp),%eax
     876:	8b 50 04             	mov    0x4(%eax),%edx
     879:	8b 45 f8             	mov    -0x8(%ebp),%eax
     87c:	8b 40 04             	mov    0x4(%eax),%eax
     87f:	01 c2                	add    %eax,%edx
     881:	8b 45 fc             	mov    -0x4(%ebp),%eax
     884:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     887:	8b 45 f8             	mov    -0x8(%ebp),%eax
     88a:	8b 10                	mov    (%eax),%edx
     88c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     88f:	89 10                	mov    %edx,(%eax)
     891:	eb 08                	jmp    89b <free+0xd7>
  } else
    p->s.ptr = bp;
     893:	8b 45 fc             	mov    -0x4(%ebp),%eax
     896:	8b 55 f8             	mov    -0x8(%ebp),%edx
     899:	89 10                	mov    %edx,(%eax)
  freep = p;
     89b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     89e:	a3 a8 44 00 00       	mov    %eax,0x44a8
}
     8a3:	90                   	nop
     8a4:	c9                   	leave  
     8a5:	c3                   	ret    

000008a6 <morecore>:

static Header*
morecore(uint nu)
{
     8a6:	55                   	push   %ebp
     8a7:	89 e5                	mov    %esp,%ebp
     8a9:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     8ac:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     8b3:	77 07                	ja     8bc <morecore+0x16>
    nu = 4096;
     8b5:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     8bc:	8b 45 08             	mov    0x8(%ebp),%eax
     8bf:	c1 e0 03             	shl    $0x3,%eax
     8c2:	83 ec 0c             	sub    $0xc,%esp
     8c5:	50                   	push   %eax
     8c6:	e8 15 fb ff ff       	call   3e0 <sbrk>
     8cb:	83 c4 10             	add    $0x10,%esp
     8ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     8d1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     8d5:	75 07                	jne    8de <morecore+0x38>
    return 0;
     8d7:	b8 00 00 00 00       	mov    $0x0,%eax
     8dc:	eb 26                	jmp    904 <morecore+0x5e>
  hp = (Header*)p;
     8de:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     8e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8e7:	8b 55 08             	mov    0x8(%ebp),%edx
     8ea:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     8ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8f0:	83 c0 08             	add    $0x8,%eax
     8f3:	83 ec 0c             	sub    $0xc,%esp
     8f6:	50                   	push   %eax
     8f7:	e8 c8 fe ff ff       	call   7c4 <free>
     8fc:	83 c4 10             	add    $0x10,%esp
  return freep;
     8ff:	a1 a8 44 00 00       	mov    0x44a8,%eax
}
     904:	c9                   	leave  
     905:	c3                   	ret    

00000906 <malloc>:

void*
malloc(uint nbytes)
{
     906:	55                   	push   %ebp
     907:	89 e5                	mov    %esp,%ebp
     909:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     90c:	8b 45 08             	mov    0x8(%ebp),%eax
     90f:	83 c0 07             	add    $0x7,%eax
     912:	c1 e8 03             	shr    $0x3,%eax
     915:	83 c0 01             	add    $0x1,%eax
     918:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     91b:	a1 a8 44 00 00       	mov    0x44a8,%eax
     920:	89 45 f0             	mov    %eax,-0x10(%ebp)
     923:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     927:	75 23                	jne    94c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     929:	c7 45 f0 a0 44 00 00 	movl   $0x44a0,-0x10(%ebp)
     930:	8b 45 f0             	mov    -0x10(%ebp),%eax
     933:	a3 a8 44 00 00       	mov    %eax,0x44a8
     938:	a1 a8 44 00 00       	mov    0x44a8,%eax
     93d:	a3 a0 44 00 00       	mov    %eax,0x44a0
    base.s.size = 0;
     942:	c7 05 a4 44 00 00 00 	movl   $0x0,0x44a4
     949:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     94c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     94f:	8b 00                	mov    (%eax),%eax
     951:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     954:	8b 45 f4             	mov    -0xc(%ebp),%eax
     957:	8b 40 04             	mov    0x4(%eax),%eax
     95a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     95d:	72 4d                	jb     9ac <malloc+0xa6>
      if(p->s.size == nunits)
     95f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     962:	8b 40 04             	mov    0x4(%eax),%eax
     965:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     968:	75 0c                	jne    976 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     96a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     96d:	8b 10                	mov    (%eax),%edx
     96f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     972:	89 10                	mov    %edx,(%eax)
     974:	eb 26                	jmp    99c <malloc+0x96>
      else {
        p->s.size -= nunits;
     976:	8b 45 f4             	mov    -0xc(%ebp),%eax
     979:	8b 40 04             	mov    0x4(%eax),%eax
     97c:	2b 45 ec             	sub    -0x14(%ebp),%eax
     97f:	89 c2                	mov    %eax,%edx
     981:	8b 45 f4             	mov    -0xc(%ebp),%eax
     984:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     987:	8b 45 f4             	mov    -0xc(%ebp),%eax
     98a:	8b 40 04             	mov    0x4(%eax),%eax
     98d:	c1 e0 03             	shl    $0x3,%eax
     990:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     993:	8b 45 f4             	mov    -0xc(%ebp),%eax
     996:	8b 55 ec             	mov    -0x14(%ebp),%edx
     999:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     99c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     99f:	a3 a8 44 00 00       	mov    %eax,0x44a8
      return (void*)(p + 1);
     9a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9a7:	83 c0 08             	add    $0x8,%eax
     9aa:	eb 3b                	jmp    9e7 <malloc+0xe1>
    }
    if(p == freep)
     9ac:	a1 a8 44 00 00       	mov    0x44a8,%eax
     9b1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     9b4:	75 1e                	jne    9d4 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     9b6:	83 ec 0c             	sub    $0xc,%esp
     9b9:	ff 75 ec             	pushl  -0x14(%ebp)
     9bc:	e8 e5 fe ff ff       	call   8a6 <morecore>
     9c1:	83 c4 10             	add    $0x10,%esp
     9c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
     9c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     9cb:	75 07                	jne    9d4 <malloc+0xce>
        return 0;
     9cd:	b8 00 00 00 00       	mov    $0x0,%eax
     9d2:	eb 13                	jmp    9e7 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     9d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
     9da:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9dd:	8b 00                	mov    (%eax),%eax
     9df:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     9e2:	e9 6d ff ff ff       	jmp    954 <malloc+0x4e>
}
     9e7:	c9                   	leave  
     9e8:	c3                   	ret    

000009e9 <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     9e9:	55                   	push   %ebp
     9ea:	89 e5                	mov    %esp,%ebp
     9ec:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     9ef:	83 ec 04             	sub    $0x4,%esp
     9f2:	ff 75 08             	pushl  0x8(%ebp)
     9f5:	68 68 37 00 00       	push   $0x3768
     9fa:	6a 02                	push   $0x2
     9fc:	e8 03 fc ff ff       	call   604 <printf>
     a01:	83 c4 10             	add    $0x10,%esp
  exit();
     a04:	e8 4f f9 ff ff       	call   358 <exit>

00000a09 <getInteger>:
}

static int getInteger(double num)
{
     a09:	55                   	push   %ebp
     a0a:	89 e5                	mov    %esp,%ebp
     a0c:	83 ec 18             	sub    $0x18,%esp
     a0f:	8b 45 08             	mov    0x8(%ebp),%eax
     a12:	89 45 e8             	mov    %eax,-0x18(%ebp)
     a15:	8b 45 0c             	mov    0xc(%ebp),%eax
     a18:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     a1b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     a22:	eb 0e                	jmp    a32 <getInteger+0x29>
  {
    num -= 1;
     a24:	dd 45 e8             	fldl   -0x18(%ebp)
     a27:	d9 e8                	fld1   
     a29:	de e9                	fsubrp %st,%st(1)
     a2b:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     a2e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     a32:	dd 45 e8             	fldl   -0x18(%ebp)
     a35:	d9 e8                	fld1   
     a37:	d9 c9                	fxch   %st(1)
     a39:	df e9                	fucomip %st(1),%st
     a3b:	dd d8                	fstp   %st(0)
     a3d:	77 e5                	ja     a24 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     a3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     a42:	c9                   	leave  
     a43:	c3                   	ret    

00000a44 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     a44:	55                   	push   %ebp
     a45:	89 e5                	mov    %esp,%ebp
     a47:	53                   	push   %ebx
     a48:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     a4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     a52:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     a56:	74 17                	je     a6f <int2str+0x2b>
     a58:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     a5c:	79 11                	jns    a6f <int2str+0x2b>
    neg = 1;
     a5e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     a65:	8b 45 0c             	mov    0xc(%ebp),%eax
     a68:	f7 d8                	neg    %eax
     a6a:	89 45 f0             	mov    %eax,-0x10(%ebp)
     a6d:	eb 06                	jmp    a75 <int2str+0x31>
  } else {
    x = num;
     a6f:	8b 45 0c             	mov    0xc(%ebp),%eax
     a72:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     a75:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     a7c:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     a7f:	8d 41 01             	lea    0x1(%ecx),%eax
     a82:	89 45 f8             	mov    %eax,-0x8(%ebp)
     a85:	8b 5d 14             	mov    0x14(%ebp),%ebx
     a88:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a8b:	ba 00 00 00 00       	mov    $0x0,%edx
     a90:	f7 f3                	div    %ebx
     a92:	89 d0                	mov    %edx,%eax
     a94:	0f b6 80 7c 43 00 00 	movzbl 0x437c(%eax),%eax
     a9b:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     a9f:	8b 5d 14             	mov    0x14(%ebp),%ebx
     aa2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     aa5:	ba 00 00 00 00       	mov    $0x0,%edx
     aaa:	f7 f3                	div    %ebx
     aac:	89 45 f0             	mov    %eax,-0x10(%ebp)
     aaf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     ab3:	75 c7                	jne    a7c <int2str+0x38>
  if(neg)
     ab5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ab9:	74 36                	je     af1 <int2str+0xad>
    buf[i++] = '-';
     abb:	8b 45 f8             	mov    -0x8(%ebp),%eax
     abe:	8d 50 01             	lea    0x1(%eax),%edx
     ac1:	89 55 f8             	mov    %edx,-0x8(%ebp)
     ac4:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     ac9:	eb 26                	jmp    af1 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     acb:	8b 45 10             	mov    0x10(%ebp),%eax
     ace:	8b 00                	mov    (%eax),%eax
     ad0:	89 c2                	mov    %eax,%edx
     ad2:	8b 45 08             	mov    0x8(%ebp),%eax
     ad5:	01 c2                	add    %eax,%edx
     ad7:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     ada:	8b 45 f8             	mov    -0x8(%ebp),%eax
     add:	01 c8                	add    %ecx,%eax
     adf:	0f b6 00             	movzbl (%eax),%eax
     ae2:	88 02                	mov    %al,(%edx)
    (*pos)++;
     ae4:	8b 45 10             	mov    0x10(%ebp),%eax
     ae7:	8b 00                	mov    (%eax),%eax
     ae9:	8d 50 01             	lea    0x1(%eax),%edx
     aec:	8b 45 10             	mov    0x10(%ebp),%eax
     aef:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     af1:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     af5:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     af9:	79 d0                	jns    acb <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     afb:	90                   	nop
     afc:	83 c4 20             	add    $0x20,%esp
     aff:	5b                   	pop    %ebx
     b00:	5d                   	pop    %ebp
     b01:	c3                   	ret    

00000b02 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     b02:	55                   	push   %ebp
     b03:	89 e5                	mov    %esp,%ebp
     b05:	83 ec 18             	sub    $0x18,%esp
     b08:	8b 45 0c             	mov    0xc(%ebp),%eax
     b0b:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b0e:	8b 45 10             	mov    0x10(%ebp),%eax
     b11:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     b14:	d9 ee                	fldz   
     b16:	dd 45 e8             	fldl   -0x18(%ebp)
     b19:	d9 c9                	fxch   %st(1)
     b1b:	df e9                	fucomip %st(1),%st
     b1d:	dd d8                	fstp   %st(0)
     b1f:	76 24                	jbe    b45 <double2str+0x43>
  {
    buf[*pos] = '-';
     b21:	8b 45 14             	mov    0x14(%ebp),%eax
     b24:	8b 00                	mov    (%eax),%eax
     b26:	89 c2                	mov    %eax,%edx
     b28:	8b 45 08             	mov    0x8(%ebp),%eax
     b2b:	01 d0                	add    %edx,%eax
     b2d:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     b30:	8b 45 14             	mov    0x14(%ebp),%eax
     b33:	8b 00                	mov    (%eax),%eax
     b35:	8d 50 01             	lea    0x1(%eax),%edx
     b38:	8b 45 14             	mov    0x14(%ebp),%eax
     b3b:	89 10                	mov    %edx,(%eax)
    num = -num;
     b3d:	dd 45 e8             	fldl   -0x18(%ebp)
     b40:	d9 e0                	fchs   
     b42:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     b45:	ff 75 ec             	pushl  -0x14(%ebp)
     b48:	ff 75 e8             	pushl  -0x18(%ebp)
     b4b:	e8 b9 fe ff ff       	call   a09 <getInteger>
     b50:	83 c4 08             	add    $0x8,%esp
     b53:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     b56:	83 ec 04             	sub    $0x4,%esp
     b59:	6a 01                	push   $0x1
     b5b:	6a 0a                	push   $0xa
     b5d:	ff 75 14             	pushl  0x14(%ebp)
     b60:	ff 75 f8             	pushl  -0x8(%ebp)
     b63:	ff 75 08             	pushl  0x8(%ebp)
     b66:	e8 d9 fe ff ff       	call   a44 <int2str>
     b6b:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     b6e:	db 45 f8             	fildl  -0x8(%ebp)
     b71:	dd 45 e8             	fldl   -0x18(%ebp)
     b74:	de e1                	fsubp  %st,%st(1)
     b76:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     b79:	dd 45 e8             	fldl   -0x18(%ebp)
     b7c:	dd 05 70 37 00 00    	fldl   0x3770
     b82:	d9 c9                	fxch   %st(1)
     b84:	df e9                	fucomip %st(1),%st
     b86:	dd d8                	fstp   %st(0)
     b88:	76 1c                	jbe    ba6 <double2str+0xa4>
  {
    buf[*pos] = '.';
     b8a:	8b 45 14             	mov    0x14(%ebp),%eax
     b8d:	8b 00                	mov    (%eax),%eax
     b8f:	89 c2                	mov    %eax,%edx
     b91:	8b 45 08             	mov    0x8(%ebp),%eax
     b94:	01 d0                	add    %edx,%eax
     b96:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     b99:	8b 45 14             	mov    0x14(%ebp),%eax
     b9c:	8b 00                	mov    (%eax),%eax
     b9e:	8d 50 01             	lea    0x1(%eax),%edx
     ba1:	8b 45 14             	mov    0x14(%ebp),%eax
     ba4:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     ba6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     bad:	eb 4c                	jmp    bfb <double2str+0xf9>
  {
    num = num*10;
     baf:	dd 45 e8             	fldl   -0x18(%ebp)
     bb2:	dd 05 78 37 00 00    	fldl   0x3778
     bb8:	de c9                	fmulp  %st,%st(1)
     bba:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     bbd:	ff 75 ec             	pushl  -0x14(%ebp)
     bc0:	ff 75 e8             	pushl  -0x18(%ebp)
     bc3:	e8 41 fe ff ff       	call   a09 <getInteger>
     bc8:	83 c4 08             	add    $0x8,%esp
     bcb:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     bce:	83 ec 04             	sub    $0x4,%esp
     bd1:	6a 01                	push   $0x1
     bd3:	6a 0a                	push   $0xa
     bd5:	ff 75 14             	pushl  0x14(%ebp)
     bd8:	ff 75 f8             	pushl  -0x8(%ebp)
     bdb:	ff 75 08             	pushl  0x8(%ebp)
     bde:	e8 61 fe ff ff       	call   a44 <int2str>
     be3:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     be6:	db 45 f8             	fildl  -0x8(%ebp)
     be9:	dd 45 e8             	fldl   -0x18(%ebp)
     bec:	de e1                	fsubp  %st,%st(1)
     bee:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     bf1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     bf5:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     bf9:	7f 13                	jg     c0e <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     bfb:	dd 45 e8             	fldl   -0x18(%ebp)
     bfe:	dd 05 70 37 00 00    	fldl   0x3770
     c04:	d9 c9                	fxch   %st(1)
     c06:	df e9                	fucomip %st(1),%st
     c08:	dd d8                	fstp   %st(0)
     c0a:	77 a3                	ja     baf <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     c0c:	eb 01                	jmp    c0f <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     c0e:	90                   	nop
    }
  }
}
     c0f:	90                   	nop
     c10:	c9                   	leave  
     c11:	c3                   	ret    

00000c12 <pow>:

double pow(double opnd, int power)
{
     c12:	55                   	push   %ebp
     c13:	89 e5                	mov    %esp,%ebp
     c15:	83 ec 18             	sub    $0x18,%esp
     c18:	8b 45 08             	mov    0x8(%ebp),%eax
     c1b:	89 45 e8             	mov    %eax,-0x18(%ebp)
     c1e:	8b 45 0c             	mov    0xc(%ebp),%eax
     c21:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     c24:	d9 e8                	fld1   
     c26:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     c29:	eb 0d                	jmp    c38 <pow+0x26>
  {
    result *= opnd;
     c2b:	dd 45 f8             	fldl   -0x8(%ebp)
     c2e:	dc 4d e8             	fmull  -0x18(%ebp)
     c31:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     c34:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     c38:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     c3c:	7f ed                	jg     c2b <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     c3e:	dd 45 f8             	fldl   -0x8(%ebp)
}
     c41:	c9                   	leave  
     c42:	c3                   	ret    

00000c43 <Translation>:

double Translation(char *s, int* pos)
{
     c43:	55                   	push   %ebp
     c44:	89 e5                	mov    %esp,%ebp
     c46:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     c49:	d9 ee                	fldz   
     c4b:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     c4e:	d9 ee                	fldz   
     c50:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c53:	eb 3e                	jmp    c93 <Translation+0x50>
    {
        integer *= 10;
     c55:	dd 45 f8             	fldl   -0x8(%ebp)
     c58:	dd 05 78 37 00 00    	fldl   0x3778
     c5e:	de c9                	fmulp  %st,%st(1)
     c60:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     c63:	8b 45 0c             	mov    0xc(%ebp),%eax
     c66:	8b 00                	mov    (%eax),%eax
     c68:	89 c2                	mov    %eax,%edx
     c6a:	8b 45 08             	mov    0x8(%ebp),%eax
     c6d:	01 d0                	add    %edx,%eax
     c6f:	0f b6 00             	movzbl (%eax),%eax
     c72:	0f be c0             	movsbl %al,%eax
     c75:	83 e8 30             	sub    $0x30,%eax
     c78:	89 45 dc             	mov    %eax,-0x24(%ebp)
     c7b:	db 45 dc             	fildl  -0x24(%ebp)
     c7e:	dd 45 f8             	fldl   -0x8(%ebp)
     c81:	de c1                	faddp  %st,%st(1)
     c83:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     c86:	8b 45 0c             	mov    0xc(%ebp),%eax
     c89:	8b 00                	mov    (%eax),%eax
     c8b:	8d 50 01             	lea    0x1(%eax),%edx
     c8e:	8b 45 0c             	mov    0xc(%ebp),%eax
     c91:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c93:	8b 45 0c             	mov    0xc(%ebp),%eax
     c96:	8b 00                	mov    (%eax),%eax
     c98:	89 c2                	mov    %eax,%edx
     c9a:	8b 45 08             	mov    0x8(%ebp),%eax
     c9d:	01 d0                	add    %edx,%eax
     c9f:	0f b6 00             	movzbl (%eax),%eax
     ca2:	3c 2f                	cmp    $0x2f,%al
     ca4:	7e 13                	jle    cb9 <Translation+0x76>
     ca6:	8b 45 0c             	mov    0xc(%ebp),%eax
     ca9:	8b 00                	mov    (%eax),%eax
     cab:	89 c2                	mov    %eax,%edx
     cad:	8b 45 08             	mov    0x8(%ebp),%eax
     cb0:	01 d0                	add    %edx,%eax
     cb2:	0f b6 00             	movzbl (%eax),%eax
     cb5:	3c 39                	cmp    $0x39,%al
     cb7:	7e 9c                	jle    c55 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     cb9:	8b 45 0c             	mov    0xc(%ebp),%eax
     cbc:	8b 00                	mov    (%eax),%eax
     cbe:	89 c2                	mov    %eax,%edx
     cc0:	8b 45 08             	mov    0x8(%ebp),%eax
     cc3:	01 d0                	add    %edx,%eax
     cc5:	0f b6 00             	movzbl (%eax),%eax
     cc8:	3c 2e                	cmp    $0x2e,%al
     cca:	0f 85 9b 00 00 00    	jne    d6b <Translation+0x128>
    {
        (*pos)++;
     cd0:	8b 45 0c             	mov    0xc(%ebp),%eax
     cd3:	8b 00                	mov    (%eax),%eax
     cd5:	8d 50 01             	lea    0x1(%eax),%edx
     cd8:	8b 45 0c             	mov    0xc(%ebp),%eax
     cdb:	89 10                	mov    %edx,(%eax)
        int c = 1;
     cdd:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     ce4:	eb 5b                	jmp    d41 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     ce6:	8b 45 0c             	mov    0xc(%ebp),%eax
     ce9:	8b 00                	mov    (%eax),%eax
     ceb:	89 c2                	mov    %eax,%edx
     ced:	8b 45 08             	mov    0x8(%ebp),%eax
     cf0:	01 d0                	add    %edx,%eax
     cf2:	0f b6 00             	movzbl (%eax),%eax
     cf5:	0f be c0             	movsbl %al,%eax
     cf8:	83 e8 30             	sub    $0x30,%eax
     cfb:	89 45 dc             	mov    %eax,-0x24(%ebp)
     cfe:	db 45 dc             	fildl  -0x24(%ebp)
     d01:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     d04:	83 ec 04             	sub    $0x4,%esp
     d07:	ff 75 ec             	pushl  -0x14(%ebp)
     d0a:	dd 05 80 37 00 00    	fldl   0x3780
     d10:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     d14:	dd 1c 24             	fstpl  (%esp)
     d17:	e8 f6 fe ff ff       	call   c12 <pow>
     d1c:	83 c4 10             	add    $0x10,%esp
     d1f:	dd 45 e0             	fldl   -0x20(%ebp)
     d22:	de c9                	fmulp  %st,%st(1)
     d24:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     d27:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     d2b:	dd 45 f0             	fldl   -0x10(%ebp)
     d2e:	dc 45 e0             	faddl  -0x20(%ebp)
     d31:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     d34:	8b 45 0c             	mov    0xc(%ebp),%eax
     d37:	8b 00                	mov    (%eax),%eax
     d39:	8d 50 01             	lea    0x1(%eax),%edx
     d3c:	8b 45 0c             	mov    0xc(%ebp),%eax
     d3f:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     d41:	8b 45 0c             	mov    0xc(%ebp),%eax
     d44:	8b 00                	mov    (%eax),%eax
     d46:	89 c2                	mov    %eax,%edx
     d48:	8b 45 08             	mov    0x8(%ebp),%eax
     d4b:	01 d0                	add    %edx,%eax
     d4d:	0f b6 00             	movzbl (%eax),%eax
     d50:	3c 2f                	cmp    $0x2f,%al
     d52:	7e 17                	jle    d6b <Translation+0x128>
     d54:	8b 45 0c             	mov    0xc(%ebp),%eax
     d57:	8b 00                	mov    (%eax),%eax
     d59:	89 c2                	mov    %eax,%edx
     d5b:	8b 45 08             	mov    0x8(%ebp),%eax
     d5e:	01 d0                	add    %edx,%eax
     d60:	0f b6 00             	movzbl (%eax),%eax
     d63:	3c 39                	cmp    $0x39,%al
     d65:	0f 8e 7b ff ff ff    	jle    ce6 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     d6b:	dd 45 f8             	fldl   -0x8(%ebp)
     d6e:	dc 45 f0             	faddl  -0x10(%ebp)
     d71:	c9                   	leave  
     d72:	c3                   	ret    

00000d73 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     d73:	55                   	push   %ebp
     d74:	89 e5                	mov    %esp,%ebp
     d76:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     d79:	e8 d2 f5 ff ff       	call   350 <fork>
     d7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     d81:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d84:	c9                   	leave  
     d85:	c3                   	ret    

00000d86 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     d86:	55                   	push   %ebp
     d87:	89 e5                	mov    %esp,%ebp
     d89:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d8c:	83 ec 0c             	sub    $0xc,%esp
     d8f:	6a 54                	push   $0x54
     d91:	e8 70 fb ff ff       	call   906 <malloc>
     d96:	83 c4 10             	add    $0x10,%esp
     d99:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     d9c:	83 ec 04             	sub    $0x4,%esp
     d9f:	6a 54                	push   $0x54
     da1:	6a 00                	push   $0x0
     da3:	ff 75 f4             	pushl  -0xc(%ebp)
     da6:	e8 12 f4 ff ff       	call   1bd <memset>
     dab:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     dae:	8b 45 f4             	mov    -0xc(%ebp),%eax
     db1:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     db7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     dba:	c9                   	leave  
     dbb:	c3                   	ret    

00000dbc <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     dbc:	55                   	push   %ebp
     dbd:	89 e5                	mov    %esp,%ebp
     dbf:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     dc2:	83 ec 0c             	sub    $0xc,%esp
     dc5:	6a 18                	push   $0x18
     dc7:	e8 3a fb ff ff       	call   906 <malloc>
     dcc:	83 c4 10             	add    $0x10,%esp
     dcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     dd2:	83 ec 04             	sub    $0x4,%esp
     dd5:	6a 18                	push   $0x18
     dd7:	6a 00                	push   $0x0
     dd9:	ff 75 f4             	pushl  -0xc(%ebp)
     ddc:	e8 dc f3 ff ff       	call   1bd <memset>
     de1:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     de4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     de7:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     ded:	8b 45 f4             	mov    -0xc(%ebp),%eax
     df0:	8b 55 08             	mov    0x8(%ebp),%edx
     df3:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     df6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     df9:	8b 55 0c             	mov    0xc(%ebp),%edx
     dfc:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     dff:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e02:	8b 55 10             	mov    0x10(%ebp),%edx
     e05:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     e08:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e0b:	8b 55 14             	mov    0x14(%ebp),%edx
     e0e:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     e11:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e14:	8b 55 18             	mov    0x18(%ebp),%edx
     e17:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     e1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e1d:	c9                   	leave  
     e1e:	c3                   	ret    

00000e1f <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     e1f:	55                   	push   %ebp
     e20:	89 e5                	mov    %esp,%ebp
     e22:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e25:	83 ec 0c             	sub    $0xc,%esp
     e28:	6a 0c                	push   $0xc
     e2a:	e8 d7 fa ff ff       	call   906 <malloc>
     e2f:	83 c4 10             	add    $0x10,%esp
     e32:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e35:	83 ec 04             	sub    $0x4,%esp
     e38:	6a 0c                	push   $0xc
     e3a:	6a 00                	push   $0x0
     e3c:	ff 75 f4             	pushl  -0xc(%ebp)
     e3f:	e8 79 f3 ff ff       	call   1bd <memset>
     e44:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     e47:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e4a:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     e50:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e53:	8b 55 08             	mov    0x8(%ebp),%edx
     e56:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     e59:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e5c:	8b 55 0c             	mov    0xc(%ebp),%edx
     e5f:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     e62:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e65:	c9                   	leave  
     e66:	c3                   	ret    

00000e67 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     e67:	55                   	push   %ebp
     e68:	89 e5                	mov    %esp,%ebp
     e6a:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e6d:	83 ec 0c             	sub    $0xc,%esp
     e70:	6a 0c                	push   $0xc
     e72:	e8 8f fa ff ff       	call   906 <malloc>
     e77:	83 c4 10             	add    $0x10,%esp
     e7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e7d:	83 ec 04             	sub    $0x4,%esp
     e80:	6a 0c                	push   $0xc
     e82:	6a 00                	push   $0x0
     e84:	ff 75 f4             	pushl  -0xc(%ebp)
     e87:	e8 31 f3 ff ff       	call   1bd <memset>
     e8c:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     e8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e92:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     e98:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e9b:	8b 55 08             	mov    0x8(%ebp),%edx
     e9e:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     ea1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ea4:	8b 55 0c             	mov    0xc(%ebp),%edx
     ea7:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     eaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ead:	c9                   	leave  
     eae:	c3                   	ret    

00000eaf <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     eaf:	55                   	push   %ebp
     eb0:	89 e5                	mov    %esp,%ebp
     eb2:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     eb5:	83 ec 0c             	sub    $0xc,%esp
     eb8:	6a 08                	push   $0x8
     eba:	e8 47 fa ff ff       	call   906 <malloc>
     ebf:	83 c4 10             	add    $0x10,%esp
     ec2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     ec5:	83 ec 04             	sub    $0x4,%esp
     ec8:	6a 08                	push   $0x8
     eca:	6a 00                	push   $0x0
     ecc:	ff 75 f4             	pushl  -0xc(%ebp)
     ecf:	e8 e9 f2 ff ff       	call   1bd <memset>
     ed4:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
     ed7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eda:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     ee0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ee3:	8b 55 08             	mov    0x8(%ebp),%edx
     ee6:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     ee9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     eec:	c9                   	leave  
     eed:	c3                   	ret    

00000eee <calcmd>:

struct cmd* calcmd(char *_line)
{
     eee:	55                   	push   %ebp
     eef:	89 e5                	mov    %esp,%ebp
     ef1:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     ef4:	83 ec 0c             	sub    $0xc,%esp
     ef7:	6a 08                	push   $0x8
     ef9:	e8 08 fa ff ff       	call   906 <malloc>
     efe:	83 c4 10             	add    $0x10,%esp
     f01:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     f04:	83 ec 04             	sub    $0x4,%esp
     f07:	6a 08                	push   $0x8
     f09:	6a 00                	push   $0x0
     f0b:	ff 75 f4             	pushl  -0xc(%ebp)
     f0e:	e8 aa f2 ff ff       	call   1bd <memset>
     f13:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
     f16:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f19:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
     f1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f22:	8b 55 08             	mov    0x8(%ebp),%edx
     f25:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     f28:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f2b:	c9                   	leave  
     f2c:	c3                   	ret    

00000f2d <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
     f2d:	55                   	push   %ebp
     f2e:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
     f30:	eb 0c                	jmp    f3e <mystrncmp+0x11>
    n--, p++, q++;
     f32:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     f36:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     f3a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
     f3e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     f42:	74 1a                	je     f5e <mystrncmp+0x31>
     f44:	8b 45 08             	mov    0x8(%ebp),%eax
     f47:	0f b6 00             	movzbl (%eax),%eax
     f4a:	84 c0                	test   %al,%al
     f4c:	74 10                	je     f5e <mystrncmp+0x31>
     f4e:	8b 45 08             	mov    0x8(%ebp),%eax
     f51:	0f b6 10             	movzbl (%eax),%edx
     f54:	8b 45 0c             	mov    0xc(%ebp),%eax
     f57:	0f b6 00             	movzbl (%eax),%eax
     f5a:	38 c2                	cmp    %al,%dl
     f5c:	74 d4                	je     f32 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
     f5e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     f62:	75 07                	jne    f6b <mystrncmp+0x3e>
    return 0;
     f64:	b8 00 00 00 00       	mov    $0x0,%eax
     f69:	eb 16                	jmp    f81 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
     f6b:	8b 45 08             	mov    0x8(%ebp),%eax
     f6e:	0f b6 00             	movzbl (%eax),%eax
     f71:	0f b6 d0             	movzbl %al,%edx
     f74:	8b 45 0c             	mov    0xc(%ebp),%eax
     f77:	0f b6 00             	movzbl (%eax),%eax
     f7a:	0f b6 c0             	movzbl %al,%eax
     f7d:	29 c2                	sub    %eax,%edx
     f7f:	89 d0                	mov    %edx,%eax
}
     f81:	5d                   	pop    %ebp
     f82:	c3                   	ret    

00000f83 <mystrlen>:

static int mystrlen(const char *s)
{
     f83:	55                   	push   %ebp
     f84:	89 e5                	mov    %esp,%ebp
     f86:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
     f89:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     f90:	eb 04                	jmp    f96 <mystrlen+0x13>
     f92:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     f96:	8b 55 fc             	mov    -0x4(%ebp),%edx
     f99:	8b 45 08             	mov    0x8(%ebp),%eax
     f9c:	01 d0                	add    %edx,%eax
     f9e:	0f b6 00             	movzbl (%eax),%eax
     fa1:	84 c0                	test   %al,%al
     fa3:	75 ed                	jne    f92 <mystrlen+0xf>
    ;
  return n;
     fa5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     fa8:	c9                   	leave  
     fa9:	c3                   	ret    

00000faa <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
     faa:	55                   	push   %ebp
     fab:	89 e5                	mov    %esp,%ebp
     fad:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
     fb0:	8b 45 08             	mov    0x8(%ebp),%eax
     fb3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
     fb6:	90                   	nop
     fb7:	8b 45 10             	mov    0x10(%ebp),%eax
     fba:	8d 50 ff             	lea    -0x1(%eax),%edx
     fbd:	89 55 10             	mov    %edx,0x10(%ebp)
     fc0:	85 c0                	test   %eax,%eax
     fc2:	7e 2c                	jle    ff0 <mystrncpy+0x46>
     fc4:	8b 45 08             	mov    0x8(%ebp),%eax
     fc7:	8d 50 01             	lea    0x1(%eax),%edx
     fca:	89 55 08             	mov    %edx,0x8(%ebp)
     fcd:	8b 55 0c             	mov    0xc(%ebp),%edx
     fd0:	8d 4a 01             	lea    0x1(%edx),%ecx
     fd3:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     fd6:	0f b6 12             	movzbl (%edx),%edx
     fd9:	88 10                	mov    %dl,(%eax)
     fdb:	0f b6 00             	movzbl (%eax),%eax
     fde:	84 c0                	test   %al,%al
     fe0:	75 d5                	jne    fb7 <mystrncpy+0xd>
    ;
  while(n-- > 0)
     fe2:	eb 0c                	jmp    ff0 <mystrncpy+0x46>
    *s++ = 0;
     fe4:	8b 45 08             	mov    0x8(%ebp),%eax
     fe7:	8d 50 01             	lea    0x1(%eax),%edx
     fea:	89 55 08             	mov    %edx,0x8(%ebp)
     fed:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
     ff0:	8b 45 10             	mov    0x10(%ebp),%eax
     ff3:	8d 50 ff             	lea    -0x1(%eax),%edx
     ff6:	89 55 10             	mov    %edx,0x10(%ebp)
     ff9:	85 c0                	test   %eax,%eax
     ffb:	7f e7                	jg     fe4 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
     ffd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1000:	c9                   	leave  
    1001:	c3                   	ret    

00001002 <isEqual>:

int isEqual(double a, double b)
{
    1002:	55                   	push   %ebp
    1003:	89 e5                	mov    %esp,%ebp
    1005:	83 ec 10             	sub    $0x10,%esp
    1008:	8b 45 08             	mov    0x8(%ebp),%eax
    100b:	89 45 f8             	mov    %eax,-0x8(%ebp)
    100e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1011:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1014:	8b 45 10             	mov    0x10(%ebp),%eax
    1017:	89 45 f0             	mov    %eax,-0x10(%ebp)
    101a:	8b 45 14             	mov    0x14(%ebp),%eax
    101d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    1020:	dd 45 f8             	fldl   -0x8(%ebp)
    1023:	dc 65 f0             	fsubl  -0x10(%ebp)
    1026:	dd 05 50 39 00 00    	fldl   0x3950
    102c:	df e9                	fucomip %st(1),%st
    102e:	dd d8                	fstp   %st(0)
    1030:	76 19                	jbe    104b <isEqual+0x49>
    1032:	dd 45 f0             	fldl   -0x10(%ebp)
    1035:	dc 65 f8             	fsubl  -0x8(%ebp)
    1038:	dd 05 50 39 00 00    	fldl   0x3950
    103e:	df e9                	fucomip %st(1),%st
    1040:	dd d8                	fstp   %st(0)
    1042:	76 07                	jbe    104b <isEqual+0x49>
    return 1;
    1044:	b8 01 00 00 00       	mov    $0x1,%eax
    1049:	eb 05                	jmp    1050 <isEqual+0x4e>
  return 0;
    104b:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1050:	c9                   	leave  
    1051:	c3                   	ret    

00001052 <isCmdName>:

int isCmdName(const char* str)
{
    1052:	55                   	push   %ebp
    1053:	89 e5                	mov    %esp,%ebp
    1055:	53                   	push   %ebx
    1056:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    1059:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1060:	eb 71                	jmp    10d3 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1062:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1065:	89 d0                	mov    %edx,%eax
    1067:	c1 e0 02             	shl    $0x2,%eax
    106a:	01 d0                	add    %edx,%eax
    106c:	01 c0                	add    %eax,%eax
    106e:	05 a0 43 00 00       	add    $0x43a0,%eax
    1073:	83 ec 0c             	sub    $0xc,%esp
    1076:	50                   	push   %eax
    1077:	e8 1a f1 ff ff       	call   196 <strlen>
    107c:	83 c4 10             	add    $0x10,%esp
    107f:	89 c3                	mov    %eax,%ebx
    1081:	83 ec 0c             	sub    $0xc,%esp
    1084:	ff 75 08             	pushl  0x8(%ebp)
    1087:	e8 f7 fe ff ff       	call   f83 <mystrlen>
    108c:	83 c4 10             	add    $0x10,%esp
    108f:	39 c3                	cmp    %eax,%ebx
    1091:	75 3c                	jne    10cf <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    1093:	83 ec 0c             	sub    $0xc,%esp
    1096:	ff 75 08             	pushl  0x8(%ebp)
    1099:	e8 e5 fe ff ff       	call   f83 <mystrlen>
    109e:	83 c4 10             	add    $0x10,%esp
    10a1:	89 c1                	mov    %eax,%ecx
    10a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    10a6:	89 d0                	mov    %edx,%eax
    10a8:	c1 e0 02             	shl    $0x2,%eax
    10ab:	01 d0                	add    %edx,%eax
    10ad:	01 c0                	add    %eax,%eax
    10af:	05 a0 43 00 00       	add    $0x43a0,%eax
    10b4:	83 ec 04             	sub    $0x4,%esp
    10b7:	51                   	push   %ecx
    10b8:	ff 75 08             	pushl  0x8(%ebp)
    10bb:	50                   	push   %eax
    10bc:	e8 6c fe ff ff       	call   f2d <mystrncmp>
    10c1:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    10c4:	85 c0                	test   %eax,%eax
    10c6:	75 07                	jne    10cf <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    10c8:	b8 01 00 00 00       	mov    $0x1,%eax
    10cd:	eb 0f                	jmp    10de <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    10cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    10d3:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    10d7:	7e 89                	jle    1062 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    10d9:	b8 00 00 00 00       	mov    $0x0,%eax
}
    10de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10e1:	c9                   	leave  
    10e2:	c3                   	ret    

000010e3 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    10e3:	55                   	push   %ebp
    10e4:	89 e5                	mov    %esp,%ebp
    10e6:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    10ec:	83 ec 08             	sub    $0x8,%esp
    10ef:	6a 00                	push   $0x0
    10f1:	68 68 44 00 00       	push   $0x4468
    10f6:	e8 9d f2 ff ff       	call   398 <open>
    10fb:	83 c4 10             	add    $0x10,%esp
    10fe:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1101:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1105:	79 0a                	jns    1111 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    1107:	b8 00 00 00 00       	mov    $0x0,%eax
    110c:	e9 9a 01 00 00       	jmp    12ab <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    1111:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    1118:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    111f:	e9 ee 00 00 00       	jmp    1212 <findAlias+0x12f>
  {
      int isSame = 1;
    1124:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    112b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    1132:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    1139:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    1140:	83 ec 0c             	sub    $0xc,%esp
    1143:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1146:	50                   	push   %eax
    1147:	e8 4a f0 ff ff       	call   196 <strlen>
    114c:	83 c4 10             	add    $0x10,%esp
    114f:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    1152:	83 ec 0c             	sub    $0xc,%esp
    1155:	ff 75 08             	pushl  0x8(%ebp)
    1158:	e8 39 f0 ff ff       	call   196 <strlen>
    115d:	83 c4 10             	add    $0x10,%esp
    1160:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    1163:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1166:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1169:	01 d0                	add    %edx,%eax
    116b:	0f b6 00             	movzbl (%eax),%eax
    116e:	3c 21                	cmp    $0x21,%al
    1170:	75 38                	jne    11aa <findAlias+0xc7>
      {
          startIndex++;
    1172:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    1176:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    117d:	eb 2b                	jmp    11aa <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    117f:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1182:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1185:	01 d0                	add    %edx,%eax
    1187:	0f b6 10             	movzbl (%eax),%edx
    118a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    118d:	8b 45 08             	mov    0x8(%ebp),%eax
    1190:	01 c8                	add    %ecx,%eax
    1192:	0f b6 00             	movzbl (%eax),%eax
    1195:	38 c2                	cmp    %al,%dl
    1197:	74 09                	je     11a2 <findAlias+0xbf>
          {
              isSame = 0;
    1199:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    11a0:	eb 1f                	jmp    11c1 <findAlias+0xde>
          }
          startIndex++;
    11a2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    11a6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    11aa:	8d 55 9a             	lea    -0x66(%ebp),%edx
    11ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11b0:	01 d0                	add    %edx,%eax
    11b2:	0f b6 00             	movzbl (%eax),%eax
    11b5:	3c 3d                	cmp    $0x3d,%al
    11b7:	74 08                	je     11c1 <findAlias+0xde>
    11b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11bc:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    11bf:	7c be                	jl     117f <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    11c1:	8d 55 9a             	lea    -0x66(%ebp),%edx
    11c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11c7:	01 d0                	add    %edx,%eax
    11c9:	0f b6 00             	movzbl (%eax),%eax
    11cc:	3c 3d                	cmp    $0x3d,%al
    11ce:	75 08                	jne    11d8 <findAlias+0xf5>
    11d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11d3:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    11d6:	7d 07                	jge    11df <findAlias+0xfc>
      {
          isSame = 0;
    11d8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    11df:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    11e3:	75 0b                	jne    11f0 <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    11e5:	b8 01 00 00 00       	mov    $0x1,%eax
    11ea:	2b 45 f0             	sub    -0x10(%ebp),%eax
    11ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    11f0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11f4:	75 1c                	jne    1212 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    11f6:	83 ec 08             	sub    $0x8,%esp
    11f9:	8d 45 9a             	lea    -0x66(%ebp),%eax
    11fc:	50                   	push   %eax
    11fd:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1203:	50                   	push   %eax
    1204:	e8 1e ef ff ff       	call   127 <strcpy>
    1209:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    120c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    120f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1212:	83 ec 04             	sub    $0x4,%esp
    1215:	6a 32                	push   $0x32
    1217:	8d 45 9a             	lea    -0x66(%ebp),%eax
    121a:	50                   	push   %eax
    121b:	ff 75 dc             	pushl  -0x24(%ebp)
    121e:	e8 4d f1 ff ff       	call   370 <read>
    1223:	83 c4 10             	add    $0x10,%esp
    1226:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1229:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    122d:	0f 8f f1 fe ff ff    	jg     1124 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    1233:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1237:	75 5f                	jne    1298 <findAlias+0x1b5>
  {
    int i = 0;
    1239:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    1240:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    1244:	eb 20                	jmp    1266 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    1246:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1249:	8b 45 0c             	mov    0xc(%ebp),%eax
    124c:	01 c2                	add    %eax,%edx
    124e:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    1254:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1257:	01 c8                	add    %ecx,%eax
    1259:	0f b6 00             	movzbl (%eax),%eax
    125c:	88 02                	mov    %al,(%edx)
      i++;
    125e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    1262:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    1266:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    126c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    126f:	01 d0                	add    %edx,%eax
    1271:	0f b6 00             	movzbl (%eax),%eax
    1274:	84 c0                	test   %al,%al
    1276:	75 ce                	jne    1246 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    1278:	8b 55 e0             	mov    -0x20(%ebp),%edx
    127b:	8b 45 0c             	mov    0xc(%ebp),%eax
    127e:	01 d0                	add    %edx,%eax
    1280:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    1283:	83 ec 0c             	sub    $0xc,%esp
    1286:	ff 75 dc             	pushl  -0x24(%ebp)
    1289:	e8 f2 f0 ff ff       	call   380 <close>
    128e:	83 c4 10             	add    $0x10,%esp
    return 1;
    1291:	b8 01 00 00 00       	mov    $0x1,%eax
    1296:	eb 13                	jmp    12ab <findAlias+0x1c8>
  }
  close(fd);
    1298:	83 ec 0c             	sub    $0xc,%esp
    129b:	ff 75 dc             	pushl  -0x24(%ebp)
    129e:	e8 dd f0 ff ff       	call   380 <close>
    12a3:	83 c4 10             	add    $0x10,%esp
  return 0;
    12a6:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12ab:	c9                   	leave  
    12ac:	c3                   	ret    

000012ad <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    12ad:	55                   	push   %ebp
    12ae:	89 e5                	mov    %esp,%ebp
    12b0:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    12b3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    12b7:	75 05                	jne    12be <runcmd+0x11>
    exit();
    12b9:	e8 9a f0 ff ff       	call   358 <exit>
  
  switch(cmd->type){
    12be:	8b 45 08             	mov    0x8(%ebp),%eax
    12c1:	8b 00                	mov    (%eax),%eax
    12c3:	83 f8 05             	cmp    $0x5,%eax
    12c6:	77 09                	ja     12d1 <runcmd+0x24>
    12c8:	8b 04 85 b4 37 00 00 	mov    0x37b4(,%eax,4),%eax
    12cf:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    12d1:	83 ec 0c             	sub    $0xc,%esp
    12d4:	68 88 37 00 00       	push   $0x3788
    12d9:	e8 0b f7 ff ff       	call   9e9 <panic1>
    12de:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    12e1:	8b 45 08             	mov    0x8(%ebp),%eax
    12e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    12e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12ea:	8b 40 04             	mov    0x4(%eax),%eax
    12ed:	85 c0                	test   %eax,%eax
    12ef:	75 05                	jne    12f6 <runcmd+0x49>
      exit();
    12f1:	e8 62 f0 ff ff       	call   358 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    12f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12f9:	8b 40 04             	mov    0x4(%eax),%eax
    12fc:	83 ec 0c             	sub    $0xc,%esp
    12ff:	50                   	push   %eax
    1300:	e8 4d fd ff ff       	call   1052 <isCmdName>
    1305:	83 c4 10             	add    $0x10,%esp
    1308:	85 c0                	test   %eax,%eax
    130a:	75 37                	jne    1343 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    130c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    130f:	8b 40 04             	mov    0x4(%eax),%eax
    1312:	83 ec 08             	sub    $0x8,%esp
    1315:	8d 55 ce             	lea    -0x32(%ebp),%edx
    1318:	52                   	push   %edx
    1319:	50                   	push   %eax
    131a:	e8 c4 fd ff ff       	call   10e3 <findAlias>
    131f:	83 c4 10             	add    $0x10,%esp
    1322:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    1325:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1329:	75 31                	jne    135c <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    132b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    132e:	83 c0 04             	add    $0x4,%eax
    1331:	83 ec 08             	sub    $0x8,%esp
    1334:	50                   	push   %eax
    1335:	8d 45 ce             	lea    -0x32(%ebp),%eax
    1338:	50                   	push   %eax
    1339:	e8 52 f0 ff ff       	call   390 <exec>
    133e:	83 c4 10             	add    $0x10,%esp
    1341:	eb 19                	jmp    135c <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    1343:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1346:	8d 50 04             	lea    0x4(%eax),%edx
    1349:	8b 45 f4             	mov    -0xc(%ebp),%eax
    134c:	8b 40 04             	mov    0x4(%eax),%eax
    134f:	83 ec 08             	sub    $0x8,%esp
    1352:	52                   	push   %edx
    1353:	50                   	push   %eax
    1354:	e8 37 f0 ff ff       	call   390 <exec>
    1359:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    135c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    135f:	8b 40 04             	mov    0x4(%eax),%eax
    1362:	83 ec 04             	sub    $0x4,%esp
    1365:	50                   	push   %eax
    1366:	68 8f 37 00 00       	push   $0x378f
    136b:	6a 02                	push   $0x2
    136d:	e8 92 f2 ff ff       	call   604 <printf>
    1372:	83 c4 10             	add    $0x10,%esp
    break;
    1375:	e9 c6 01 00 00       	jmp    1540 <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    137a:	8b 45 08             	mov    0x8(%ebp),%eax
    137d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    1380:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1383:	8b 40 14             	mov    0x14(%eax),%eax
    1386:	83 ec 0c             	sub    $0xc,%esp
    1389:	50                   	push   %eax
    138a:	e8 f1 ef ff ff       	call   380 <close>
    138f:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    1392:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1395:	8b 50 10             	mov    0x10(%eax),%edx
    1398:	8b 45 ec             	mov    -0x14(%ebp),%eax
    139b:	8b 40 08             	mov    0x8(%eax),%eax
    139e:	83 ec 08             	sub    $0x8,%esp
    13a1:	52                   	push   %edx
    13a2:	50                   	push   %eax
    13a3:	e8 f0 ef ff ff       	call   398 <open>
    13a8:	83 c4 10             	add    $0x10,%esp
    13ab:	85 c0                	test   %eax,%eax
    13ad:	79 1e                	jns    13cd <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    13af:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13b2:	8b 40 08             	mov    0x8(%eax),%eax
    13b5:	83 ec 04             	sub    $0x4,%esp
    13b8:	50                   	push   %eax
    13b9:	68 9f 37 00 00       	push   $0x379f
    13be:	6a 02                	push   $0x2
    13c0:	e8 3f f2 ff ff       	call   604 <printf>
    13c5:	83 c4 10             	add    $0x10,%esp
      exit();
    13c8:	e8 8b ef ff ff       	call   358 <exit>
    }
    runcmd(rcmd->cmd);
    13cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13d0:	8b 40 04             	mov    0x4(%eax),%eax
    13d3:	83 ec 0c             	sub    $0xc,%esp
    13d6:	50                   	push   %eax
    13d7:	e8 d1 fe ff ff       	call   12ad <runcmd>
    13dc:	83 c4 10             	add    $0x10,%esp
    break;
    13df:	e9 5c 01 00 00       	jmp    1540 <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    13e4:	8b 45 08             	mov    0x8(%ebp),%eax
    13e7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    13ea:	e8 84 f9 ff ff       	call   d73 <fork1>
    13ef:	85 c0                	test   %eax,%eax
    13f1:	75 12                	jne    1405 <runcmd+0x158>
      runcmd(lcmd->left);
    13f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13f6:	8b 40 04             	mov    0x4(%eax),%eax
    13f9:	83 ec 0c             	sub    $0xc,%esp
    13fc:	50                   	push   %eax
    13fd:	e8 ab fe ff ff       	call   12ad <runcmd>
    1402:	83 c4 10             	add    $0x10,%esp
    wait();
    1405:	e8 56 ef ff ff       	call   360 <wait>
    runcmd(lcmd->right);
    140a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    140d:	8b 40 08             	mov    0x8(%eax),%eax
    1410:	83 ec 0c             	sub    $0xc,%esp
    1413:	50                   	push   %eax
    1414:	e8 94 fe ff ff       	call   12ad <runcmd>
    1419:	83 c4 10             	add    $0x10,%esp
    break;
    141c:	e9 1f 01 00 00       	jmp    1540 <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    1421:	8b 45 08             	mov    0x8(%ebp),%eax
    1424:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    1427:	83 ec 0c             	sub    $0xc,%esp
    142a:	8d 45 d8             	lea    -0x28(%ebp),%eax
    142d:	50                   	push   %eax
    142e:	e8 35 ef ff ff       	call   368 <pipe>
    1433:	83 c4 10             	add    $0x10,%esp
    1436:	85 c0                	test   %eax,%eax
    1438:	79 10                	jns    144a <runcmd+0x19d>
      panic1("pipe");
    143a:	83 ec 0c             	sub    $0xc,%esp
    143d:	68 af 37 00 00       	push   $0x37af
    1442:	e8 a2 f5 ff ff       	call   9e9 <panic1>
    1447:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    144a:	e8 24 f9 ff ff       	call   d73 <fork1>
    144f:	85 c0                	test   %eax,%eax
    1451:	75 4c                	jne    149f <runcmd+0x1f2>
      close(1);
    1453:	83 ec 0c             	sub    $0xc,%esp
    1456:	6a 01                	push   $0x1
    1458:	e8 23 ef ff ff       	call   380 <close>
    145d:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    1460:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1463:	83 ec 0c             	sub    $0xc,%esp
    1466:	50                   	push   %eax
    1467:	e8 64 ef ff ff       	call   3d0 <dup>
    146c:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    146f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1472:	83 ec 0c             	sub    $0xc,%esp
    1475:	50                   	push   %eax
    1476:	e8 05 ef ff ff       	call   380 <close>
    147b:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    147e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1481:	83 ec 0c             	sub    $0xc,%esp
    1484:	50                   	push   %eax
    1485:	e8 f6 ee ff ff       	call   380 <close>
    148a:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    148d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1490:	8b 40 04             	mov    0x4(%eax),%eax
    1493:	83 ec 0c             	sub    $0xc,%esp
    1496:	50                   	push   %eax
    1497:	e8 11 fe ff ff       	call   12ad <runcmd>
    149c:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    149f:	e8 cf f8 ff ff       	call   d73 <fork1>
    14a4:	85 c0                	test   %eax,%eax
    14a6:	75 4c                	jne    14f4 <runcmd+0x247>
      close(0);
    14a8:	83 ec 0c             	sub    $0xc,%esp
    14ab:	6a 00                	push   $0x0
    14ad:	e8 ce ee ff ff       	call   380 <close>
    14b2:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    14b5:	8b 45 d8             	mov    -0x28(%ebp),%eax
    14b8:	83 ec 0c             	sub    $0xc,%esp
    14bb:	50                   	push   %eax
    14bc:	e8 0f ef ff ff       	call   3d0 <dup>
    14c1:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    14c4:	8b 45 d8             	mov    -0x28(%ebp),%eax
    14c7:	83 ec 0c             	sub    $0xc,%esp
    14ca:	50                   	push   %eax
    14cb:	e8 b0 ee ff ff       	call   380 <close>
    14d0:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    14d3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    14d6:	83 ec 0c             	sub    $0xc,%esp
    14d9:	50                   	push   %eax
    14da:	e8 a1 ee ff ff       	call   380 <close>
    14df:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    14e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    14e5:	8b 40 08             	mov    0x8(%eax),%eax
    14e8:	83 ec 0c             	sub    $0xc,%esp
    14eb:	50                   	push   %eax
    14ec:	e8 bc fd ff ff       	call   12ad <runcmd>
    14f1:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    14f4:	8b 45 d8             	mov    -0x28(%ebp),%eax
    14f7:	83 ec 0c             	sub    $0xc,%esp
    14fa:	50                   	push   %eax
    14fb:	e8 80 ee ff ff       	call   380 <close>
    1500:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    1503:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1506:	83 ec 0c             	sub    $0xc,%esp
    1509:	50                   	push   %eax
    150a:	e8 71 ee ff ff       	call   380 <close>
    150f:	83 c4 10             	add    $0x10,%esp
    wait();
    1512:	e8 49 ee ff ff       	call   360 <wait>
    wait();
    1517:	e8 44 ee ff ff       	call   360 <wait>
    break;
    151c:	eb 22                	jmp    1540 <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    151e:	8b 45 08             	mov    0x8(%ebp),%eax
    1521:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    1524:	e8 4a f8 ff ff       	call   d73 <fork1>
    1529:	85 c0                	test   %eax,%eax
    152b:	75 12                	jne    153f <runcmd+0x292>
      runcmd(bcmd->cmd);
    152d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1530:	8b 40 04             	mov    0x4(%eax),%eax
    1533:	83 ec 0c             	sub    $0xc,%esp
    1536:	50                   	push   %eax
    1537:	e8 71 fd ff ff       	call   12ad <runcmd>
    153c:	83 c4 10             	add    $0x10,%esp
    break;
    153f:	90                   	nop
  }
  exit();
    1540:	e8 13 ee ff ff       	call   358 <exit>

00001545 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    1545:	55                   	push   %ebp
    1546:	89 e5                	mov    %esp,%ebp
    1548:	83 ec 04             	sub    $0x4,%esp
    154b:	8b 45 08             	mov    0x8(%ebp),%eax
    154e:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    1551:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    1555:	7e 0d                	jle    1564 <isNameChar+0x1f>
    1557:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    155b:	7f 07                	jg     1564 <isNameChar+0x1f>
    return 1;
    155d:	b8 01 00 00 00       	mov    $0x1,%eax
    1562:	eb 38                	jmp    159c <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    1564:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    1568:	7e 0d                	jle    1577 <isNameChar+0x32>
    156a:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    156e:	7f 07                	jg     1577 <isNameChar+0x32>
    return 1;
    1570:	b8 01 00 00 00       	mov    $0x1,%eax
    1575:	eb 25                	jmp    159c <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    1577:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    157b:	7e 0d                	jle    158a <isNameChar+0x45>
    157d:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    1581:	7f 07                	jg     158a <isNameChar+0x45>
    return 1;
    1583:	b8 01 00 00 00       	mov    $0x1,%eax
    1588:	eb 12                	jmp    159c <isNameChar+0x57>
  if(ch == '_')
    158a:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    158e:	75 07                	jne    1597 <isNameChar+0x52>
    return 1;
    1590:	b8 01 00 00 00       	mov    $0x1,%eax
    1595:	eb 05                	jmp    159c <isNameChar+0x57>
  return 0;
    1597:	b8 00 00 00 00       	mov    $0x0,%eax
}
    159c:	c9                   	leave  
    159d:	c3                   	ret    

0000159e <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    159e:	55                   	push   %ebp
    159f:	89 e5                	mov    %esp,%ebp
    15a1:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    15a4:	8b 45 08             	mov    0x8(%ebp),%eax
    15a7:	8b 40 04             	mov    0x4(%eax),%eax
    15aa:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    15ad:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    15b4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    15bb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    15c2:	eb 1d                	jmp    15e1 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    15c4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    15c7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15ca:	01 d0                	add    %edx,%eax
    15cc:	0f b6 00             	movzbl (%eax),%eax
    15cf:	3c 3d                	cmp    $0x3d,%al
    15d1:	75 0a                	jne    15dd <runCalcmd+0x3f>
    {
      hasEqu++;
    15d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    15d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15da:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    15dd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    15e1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    15e4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15e7:	01 d0                	add    %edx,%eax
    15e9:	0f b6 00             	movzbl (%eax),%eax
    15ec:	84 c0                	test   %al,%al
    15ee:	75 d4                	jne    15c4 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    15f0:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    15f4:	7e 1d                	jle    1613 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    15f6:	83 ec 0c             	sub    $0xc,%esp
    15f9:	68 cc 37 00 00       	push   $0x37cc
    15fe:	6a 00                	push   $0x0
    1600:	6a 00                	push   $0x0
    1602:	6a 01                	push   $0x1
    1604:	6a 04                	push   $0x4
    1606:	e8 21 17 00 00       	call   2d2c <color_printf>
    160b:	83 c4 20             	add    $0x20,%esp
    160e:	e9 78 05 00 00       	jmp    1b8b <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    1613:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1617:	0f 85 26 05 00 00    	jne    1b43 <runCalcmd+0x5a5>
  {
    int i=0;
    161d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    1624:	eb 04                	jmp    162a <runCalcmd+0x8c>
    {
      i++;
    1626:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    162a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    162d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1630:	01 d0                	add    %edx,%eax
    1632:	0f b6 00             	movzbl (%eax),%eax
    1635:	3c 20                	cmp    $0x20,%al
    1637:	74 ed                	je     1626 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    1639:	8b 45 e8             	mov    -0x18(%ebp),%eax
    163c:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    163f:	eb 23                	jmp    1664 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    1641:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1644:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1647:	01 d0                	add    %edx,%eax
    1649:	0f b6 00             	movzbl (%eax),%eax
    164c:	0f be c0             	movsbl %al,%eax
    164f:	83 ec 0c             	sub    $0xc,%esp
    1652:	50                   	push   %eax
    1653:	e8 ed fe ff ff       	call   1545 <isNameChar>
    1658:	83 c4 10             	add    $0x10,%esp
    165b:	83 f8 01             	cmp    $0x1,%eax
    165e:	75 0e                	jne    166e <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    1660:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1664:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1667:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    166a:	7c d5                	jl     1641 <runCalcmd+0xa3>
    166c:	eb 01                	jmp    166f <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    166e:	90                   	nop
    }
    int len = i-startIndex;
    166f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1672:	2b 45 d0             	sub    -0x30(%ebp),%eax
    1675:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    1678:	eb 04                	jmp    167e <runCalcmd+0xe0>
    {
      i++;
    167a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    167e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1681:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1684:	01 d0                	add    %edx,%eax
    1686:	0f b6 00             	movzbl (%eax),%eax
    1689:	3c 20                	cmp    $0x20,%al
    168b:	74 ed                	je     167a <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    168d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1690:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1693:	0f 85 90 04 00 00    	jne    1b29 <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    1699:	8b 55 d0             	mov    -0x30(%ebp),%edx
    169c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    169f:	01 d0                	add    %edx,%eax
    16a1:	0f b6 00             	movzbl (%eax),%eax
    16a4:	3c 2f                	cmp    $0x2f,%al
    16a6:	7e 2c                	jle    16d4 <runCalcmd+0x136>
    16a8:	8b 55 d0             	mov    -0x30(%ebp),%edx
    16ab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16ae:	01 d0                	add    %edx,%eax
    16b0:	0f b6 00             	movzbl (%eax),%eax
    16b3:	3c 39                	cmp    $0x39,%al
    16b5:	7f 1d                	jg     16d4 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    16b7:	83 ec 0c             	sub    $0xc,%esp
    16ba:	68 e8 37 00 00       	push   $0x37e8
    16bf:	6a 00                	push   $0x0
    16c1:	6a 00                	push   $0x0
    16c3:	6a 01                	push   $0x1
    16c5:	6a 04                	push   $0x4
    16c7:	e8 60 16 00 00       	call   2d2c <color_printf>
    16cc:	83 c4 20             	add    $0x20,%esp
    16cf:	e9 b7 04 00 00       	jmp    1b8b <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    16d4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    16db:	eb 20                	jmp    16fd <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    16dd:	8b 55 d0             	mov    -0x30(%ebp),%edx
    16e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16e3:	01 d0                	add    %edx,%eax
    16e5:	89 c2                	mov    %eax,%edx
    16e7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16ea:	01 d0                	add    %edx,%eax
    16ec:	0f b6 00             	movzbl (%eax),%eax
    16ef:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    16f2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    16f5:	01 ca                	add    %ecx,%edx
    16f7:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    16f9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    16fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1700:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1703:	7c d8                	jl     16dd <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1705:	8d 55 94             	lea    -0x6c(%ebp),%edx
    1708:	8b 45 cc             	mov    -0x34(%ebp),%eax
    170b:	01 d0                	add    %edx,%eax
    170d:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    1710:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1713:	83 c0 01             	add    $0x1,%eax
    1716:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    1719:	eb 04                	jmp    171f <runCalcmd+0x181>
        {
          i++;
    171b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    171f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1722:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1725:	01 d0                	add    %edx,%eax
    1727:	0f b6 00             	movzbl (%eax),%eax
    172a:	3c 20                	cmp    $0x20,%al
    172c:	74 ed                	je     171b <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    172e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1731:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1734:	01 d0                	add    %edx,%eax
    1736:	0f b6 00             	movzbl (%eax),%eax
    1739:	3c 60                	cmp    $0x60,%al
    173b:	0f 85 e6 01 00 00    	jne    1927 <runCalcmd+0x389>
        {
          i++;
    1741:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    1745:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1748:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    174b:	eb 04                	jmp    1751 <runCalcmd+0x1b3>
          {
            i++;
    174d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    1751:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1754:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1757:	01 d0                	add    %edx,%eax
    1759:	0f b6 00             	movzbl (%eax),%eax
    175c:	3c 60                	cmp    $0x60,%al
    175e:	74 0f                	je     176f <runCalcmd+0x1d1>
    1760:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1763:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1766:	01 d0                	add    %edx,%eax
    1768:	0f b6 00             	movzbl (%eax),%eax
    176b:	84 c0                	test   %al,%al
    176d:	75 de                	jne    174d <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    176f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1772:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1775:	01 d0                	add    %edx,%eax
    1777:	0f b6 00             	movzbl (%eax),%eax
    177a:	3c 60                	cmp    $0x60,%al
    177c:	0f 85 5c 01 00 00    	jne    18de <runCalcmd+0x340>
    1782:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1785:	8d 50 01             	lea    0x1(%eax),%edx
    1788:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    178b:	01 d0                	add    %edx,%eax
    178d:	0f b6 00             	movzbl (%eax),%eax
    1790:	84 c0                	test   %al,%al
    1792:	0f 85 46 01 00 00    	jne    18de <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    1798:	8b 55 e0             	mov    -0x20(%ebp),%edx
    179b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    179e:	01 d0                	add    %edx,%eax
    17a0:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    17a3:	8b 55 c8             	mov    -0x38(%ebp),%edx
    17a6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17a9:	01 d0                	add    %edx,%eax
    17ab:	83 ec 0c             	sub    $0xc,%esp
    17ae:	50                   	push   %eax
    17af:	e8 c5 04 00 00       	call   1c79 <Compute>
    17b4:	83 c4 10             	add    $0x10,%esp
    17b7:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    17ba:	dd 05 58 39 00 00    	fldl   0x3958
    17c0:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    17c4:	dd 1c 24             	fstpl  (%esp)
    17c7:	ff 75 c4             	pushl  -0x3c(%ebp)
    17ca:	ff 75 c0             	pushl  -0x40(%ebp)
    17cd:	e8 30 f8 ff ff       	call   1002 <isEqual>
    17d2:	83 c4 10             	add    $0x10,%esp
    17d5:	85 c0                	test   %eax,%eax
    17d7:	0f 85 ad 03 00 00    	jne    1b8a <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    17dd:	a1 ac 44 00 00       	mov    0x44ac,%eax
    17e2:	85 c0                	test   %eax,%eax
    17e4:	75 15                	jne    17fb <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    17e6:	83 ec 08             	sub    $0x8,%esp
    17e9:	68 ac 44 00 00       	push   $0x44ac
    17ee:	68 e0 44 00 00       	push   $0x44e0
    17f3:	e8 ba 19 00 00       	call   31b2 <readVariables>
    17f8:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    17fb:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1802:	eb 26                	jmp    182a <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1804:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1807:	c1 e0 05             	shl    $0x5,%eax
    180a:	05 e0 44 00 00       	add    $0x44e0,%eax
    180f:	8d 50 04             	lea    0x4(%eax),%edx
    1812:	83 ec 08             	sub    $0x8,%esp
    1815:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1818:	50                   	push   %eax
    1819:	52                   	push   %edx
    181a:	e8 38 e9 ff ff       	call   157 <strcmp>
    181f:	83 c4 10             	add    $0x10,%esp
    1822:	85 c0                	test   %eax,%eax
    1824:	74 10                	je     1836 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1826:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    182a:	a1 ac 44 00 00       	mov    0x44ac,%eax
    182f:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1832:	7c d0                	jl     1804 <runCalcmd+0x266>
    1834:	eb 01                	jmp    1837 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1836:	90                   	nop
              }
              if(index == v_num) //new variable
    1837:	a1 ac 44 00 00       	mov    0x44ac,%eax
    183c:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    183f:	75 3c                	jne    187d <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    1841:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1844:	c1 e0 05             	shl    $0x5,%eax
    1847:	05 e0 44 00 00       	add    $0x44e0,%eax
    184c:	8d 50 04             	lea    0x4(%eax),%edx
    184f:	83 ec 08             	sub    $0x8,%esp
    1852:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1855:	50                   	push   %eax
    1856:	52                   	push   %edx
    1857:	e8 cb e8 ff ff       	call   127 <strcpy>
    185c:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    185f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1862:	c1 e0 05             	shl    $0x5,%eax
    1865:	05 e0 44 00 00       	add    $0x44e0,%eax
    186a:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    1870:	a1 ac 44 00 00       	mov    0x44ac,%eax
    1875:	83 c0 01             	add    $0x1,%eax
    1878:	a3 ac 44 00 00       	mov    %eax,0x44ac
              }
              variables[index].value.dvalue = result;
    187d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1880:	c1 e0 05             	shl    $0x5,%eax
    1883:	05 f0 44 00 00       	add    $0x44f0,%eax
    1888:	dd 45 c0             	fldl   -0x40(%ebp)
    188b:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    188e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1891:	c1 e0 05             	shl    $0x5,%eax
    1894:	05 f0 44 00 00       	add    $0x44f0,%eax
    1899:	dd 40 08             	fldl   0x8(%eax)
    189c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    189f:	c1 e0 05             	shl    $0x5,%eax
    18a2:	05 e0 44 00 00       	add    $0x44e0,%eax
    18a7:	83 c0 04             	add    $0x4,%eax
    18aa:	83 ec 0c             	sub    $0xc,%esp
    18ad:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    18b1:	dd 1c 24             	fstpl  (%esp)
    18b4:	50                   	push   %eax
    18b5:	68 12 38 00 00       	push   $0x3812
    18ba:	6a 01                	push   $0x1
    18bc:	e8 43 ed ff ff       	call   604 <printf>
    18c1:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    18c4:	83 ec 08             	sub    $0x8,%esp
    18c7:	68 ac 44 00 00       	push   $0x44ac
    18cc:	68 e0 44 00 00       	push   $0x44e0
    18d1:	e8 90 1b 00 00       	call   3466 <writeVariables>
    18d6:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    18d9:	e9 ac 02 00 00       	jmp    1b8a <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    18de:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18e1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18e4:	01 d0                	add    %edx,%eax
    18e6:	0f b6 00             	movzbl (%eax),%eax
    18e9:	84 c0                	test   %al,%al
    18eb:	75 1d                	jne    190a <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    18ed:	83 ec 0c             	sub    $0xc,%esp
    18f0:	68 19 38 00 00       	push   $0x3819
    18f5:	6a 00                	push   $0x0
    18f7:	6a 00                	push   $0x0
    18f9:	6a 01                	push   $0x1
    18fb:	6a 04                	push   $0x4
    18fd:	e8 2a 14 00 00       	call   2d2c <color_printf>
    1902:	83 c4 20             	add    $0x20,%esp
    1905:	e9 81 02 00 00       	jmp    1b8b <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    190a:	83 ec 0c             	sub    $0xc,%esp
    190d:	68 30 38 00 00       	push   $0x3830
    1912:	6a 00                	push   $0x0
    1914:	6a 00                	push   $0x0
    1916:	6a 01                	push   $0x1
    1918:	6a 04                	push   $0x4
    191a:	e8 0d 14 00 00       	call   2d2c <color_printf>
    191f:	83 c4 20             	add    $0x20,%esp
    1922:	e9 64 02 00 00       	jmp    1b8b <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1927:	8b 55 e0             	mov    -0x20(%ebp),%edx
    192a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    192d:	01 d0                	add    %edx,%eax
    192f:	0f b6 00             	movzbl (%eax),%eax
    1932:	3c 22                	cmp    $0x22,%al
    1934:	0f 85 d5 01 00 00    	jne    1b0f <runCalcmd+0x571>
        {
          i++;
    193a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    193e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1941:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1944:	eb 04                	jmp    194a <runCalcmd+0x3ac>
          {
            i++;
    1946:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    194a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    194d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1950:	01 d0                	add    %edx,%eax
    1952:	0f b6 00             	movzbl (%eax),%eax
    1955:	3c 22                	cmp    $0x22,%al
    1957:	74 0f                	je     1968 <runCalcmd+0x3ca>
    1959:	8b 55 e0             	mov    -0x20(%ebp),%edx
    195c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    195f:	01 d0                	add    %edx,%eax
    1961:	0f b6 00             	movzbl (%eax),%eax
    1964:	84 c0                	test   %al,%al
    1966:	75 de                	jne    1946 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1968:	8b 55 e0             	mov    -0x20(%ebp),%edx
    196b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    196e:	01 d0                	add    %edx,%eax
    1970:	0f b6 00             	movzbl (%eax),%eax
    1973:	3c 22                	cmp    $0x22,%al
    1975:	0f 85 4e 01 00 00    	jne    1ac9 <runCalcmd+0x52b>
    197b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    197e:	8d 50 01             	lea    0x1(%eax),%edx
    1981:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1984:	01 d0                	add    %edx,%eax
    1986:	0f b6 00             	movzbl (%eax),%eax
    1989:	84 c0                	test   %al,%al
    198b:	0f 85 38 01 00 00    	jne    1ac9 <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1991:	a1 ac 44 00 00       	mov    0x44ac,%eax
    1996:	85 c0                	test   %eax,%eax
    1998:	75 15                	jne    19af <runCalcmd+0x411>
              readVariables(variables,&v_num);
    199a:	83 ec 08             	sub    $0x8,%esp
    199d:	68 ac 44 00 00       	push   $0x44ac
    19a2:	68 e0 44 00 00       	push   $0x44e0
    19a7:	e8 06 18 00 00       	call   31b2 <readVariables>
    19ac:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    19af:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    19b6:	eb 26                	jmp    19de <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    19b8:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19bb:	c1 e0 05             	shl    $0x5,%eax
    19be:	05 e0 44 00 00       	add    $0x44e0,%eax
    19c3:	8d 50 04             	lea    0x4(%eax),%edx
    19c6:	83 ec 08             	sub    $0x8,%esp
    19c9:	8d 45 94             	lea    -0x6c(%ebp),%eax
    19cc:	50                   	push   %eax
    19cd:	52                   	push   %edx
    19ce:	e8 84 e7 ff ff       	call   157 <strcmp>
    19d3:	83 c4 10             	add    $0x10,%esp
    19d6:	85 c0                	test   %eax,%eax
    19d8:	74 10                	je     19ea <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    19da:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    19de:	a1 ac 44 00 00       	mov    0x44ac,%eax
    19e3:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    19e6:	7c d0                	jl     19b8 <runCalcmd+0x41a>
    19e8:	eb 01                	jmp    19eb <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    19ea:	90                   	nop
            }
            if(index == v_num) //new variable
    19eb:	a1 ac 44 00 00       	mov    0x44ac,%eax
    19f0:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    19f3:	75 2b                	jne    1a20 <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    19f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19f8:	c1 e0 05             	shl    $0x5,%eax
    19fb:	05 e0 44 00 00       	add    $0x44e0,%eax
    1a00:	8d 50 04             	lea    0x4(%eax),%edx
    1a03:	83 ec 08             	sub    $0x8,%esp
    1a06:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1a09:	50                   	push   %eax
    1a0a:	52                   	push   %edx
    1a0b:	e8 17 e7 ff ff       	call   127 <strcpy>
    1a10:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1a13:	a1 ac 44 00 00       	mov    0x44ac,%eax
    1a18:	83 c0 01             	add    $0x1,%eax
    1a1b:	a3 ac 44 00 00       	mov    %eax,0x44ac
            }
            variables[index].type = V_STRING;
    1a20:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a23:	c1 e0 05             	shl    $0x5,%eax
    1a26:	05 e0 44 00 00       	add    $0x44e0,%eax
    1a2b:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1a31:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1a34:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1a37:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1a3a:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1a3d:	83 c0 01             	add    $0x1,%eax
    1a40:	83 ec 0c             	sub    $0xc,%esp
    1a43:	50                   	push   %eax
    1a44:	e8 bd ee ff ff       	call   906 <malloc>
    1a49:	83 c4 10             	add    $0x10,%esp
    1a4c:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1a4f:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1a52:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a55:	01 d0                	add    %edx,%eax
    1a57:	83 ec 08             	sub    $0x8,%esp
    1a5a:	50                   	push   %eax
    1a5b:	ff 75 b4             	pushl  -0x4c(%ebp)
    1a5e:	e8 c4 e6 ff ff       	call   127 <strcpy>
    1a63:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1a66:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1a69:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1a6c:	01 d0                	add    %edx,%eax
    1a6e:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1a71:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a74:	c1 e0 05             	shl    $0x5,%eax
    1a77:	8d 90 f8 44 00 00    	lea    0x44f8(%eax),%edx
    1a7d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1a80:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1a82:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a85:	c1 e0 05             	shl    $0x5,%eax
    1a88:	05 f8 44 00 00       	add    $0x44f8,%eax
    1a8d:	8b 00                	mov    (%eax),%eax
    1a8f:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1a92:	c1 e2 05             	shl    $0x5,%edx
    1a95:	81 c2 e0 44 00 00    	add    $0x44e0,%edx
    1a9b:	83 c2 04             	add    $0x4,%edx
    1a9e:	50                   	push   %eax
    1a9f:	52                   	push   %edx
    1aa0:	68 51 38 00 00       	push   $0x3851
    1aa5:	6a 01                	push   $0x1
    1aa7:	e8 58 eb ff ff       	call   604 <printf>
    1aac:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1aaf:	83 ec 08             	sub    $0x8,%esp
    1ab2:	68 ac 44 00 00       	push   $0x44ac
    1ab7:	68 e0 44 00 00       	push   $0x44e0
    1abc:	e8 a5 19 00 00       	call   3466 <writeVariables>
    1ac1:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1ac4:	e9 c2 00 00 00       	jmp    1b8b <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1ac9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1acc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1acf:	01 d0                	add    %edx,%eax
    1ad1:	0f b6 00             	movzbl (%eax),%eax
    1ad4:	84 c0                	test   %al,%al
    1ad6:	75 1d                	jne    1af5 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1ad8:	83 ec 0c             	sub    $0xc,%esp
    1adb:	68 5a 38 00 00       	push   $0x385a
    1ae0:	6a 00                	push   $0x0
    1ae2:	6a 00                	push   $0x0
    1ae4:	6a 01                	push   $0x1
    1ae6:	6a 04                	push   $0x4
    1ae8:	e8 3f 12 00 00       	call   2d2c <color_printf>
    1aed:	83 c4 20             	add    $0x20,%esp
    1af0:	e9 96 00 00 00       	jmp    1b8b <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1af5:	83 ec 0c             	sub    $0xc,%esp
    1af8:	68 70 38 00 00       	push   $0x3870
    1afd:	6a 00                	push   $0x0
    1aff:	6a 00                	push   $0x0
    1b01:	6a 01                	push   $0x1
    1b03:	6a 04                	push   $0x4
    1b05:	e8 22 12 00 00       	call   2d2c <color_printf>
    1b0a:	83 c4 20             	add    $0x20,%esp
    1b0d:	eb 7c                	jmp    1b8b <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1b0f:	83 ec 0c             	sub    $0xc,%esp
    1b12:	68 91 38 00 00       	push   $0x3891
    1b17:	6a 00                	push   $0x0
    1b19:	6a 00                	push   $0x0
    1b1b:	6a 01                	push   $0x1
    1b1d:	6a 04                	push   $0x4
    1b1f:	e8 08 12 00 00       	call   2d2c <color_printf>
    1b24:	83 c4 20             	add    $0x20,%esp
    1b27:	eb 62                	jmp    1b8b <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1b29:	83 ec 0c             	sub    $0xc,%esp
    1b2c:	68 91 38 00 00       	push   $0x3891
    1b31:	6a 00                	push   $0x0
    1b33:	6a 00                	push   $0x0
    1b35:	6a 01                	push   $0x1
    1b37:	6a 04                	push   $0x4
    1b39:	e8 ee 11 00 00       	call   2d2c <color_printf>
    1b3e:	83 c4 20             	add    $0x20,%esp
    1b41:	eb 48                	jmp    1b8b <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1b43:	83 ec 0c             	sub    $0xc,%esp
    1b46:	ff 75 d4             	pushl  -0x2c(%ebp)
    1b49:	e8 2b 01 00 00       	call   1c79 <Compute>
    1b4e:	83 c4 10             	add    $0x10,%esp
    1b51:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1b54:	dd 05 58 39 00 00    	fldl   0x3958
    1b5a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1b5e:	dd 1c 24             	fstpl  (%esp)
    1b61:	ff 75 ac             	pushl  -0x54(%ebp)
    1b64:	ff 75 a8             	pushl  -0x58(%ebp)
    1b67:	e8 96 f4 ff ff       	call   1002 <isEqual>
    1b6c:	83 c4 10             	add    $0x10,%esp
    1b6f:	85 c0                	test   %eax,%eax
    1b71:	75 18                	jne    1b8b <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1b73:	ff 75 ac             	pushl  -0x54(%ebp)
    1b76:	ff 75 a8             	pushl  -0x58(%ebp)
    1b79:	68 a9 38 00 00       	push   $0x38a9
    1b7e:	6a 01                	push   $0x1
    1b80:	e8 7f ea ff ff       	call   604 <printf>
    1b85:	83 c4 10             	add    $0x10,%esp
    1b88:	eb 01                	jmp    1b8b <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1b8a:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1b8b:	e8 c8 e7 ff ff       	call   358 <exit>

00001b90 <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1b90:	55                   	push   %ebp
    1b91:	89 e5                	mov    %esp,%ebp
    1b93:	83 ec 04             	sub    $0x4,%esp
    1b96:	8b 45 08             	mov    0x8(%ebp),%eax
    1b99:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1b9c:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1ba0:	83 e8 23             	sub    $0x23,%eax
    1ba3:	83 f8 0c             	cmp    $0xc,%eax
    1ba6:	77 25                	ja     1bcd <GetLevel+0x3d>
    1ba8:	8b 04 85 b0 38 00 00 	mov    0x38b0(,%eax,4),%eax
    1baf:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1bb1:	b8 01 00 00 00       	mov    $0x1,%eax
    1bb6:	eb 1a                	jmp    1bd2 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1bb8:	b8 02 00 00 00       	mov    $0x2,%eax
    1bbd:	eb 13                	jmp    1bd2 <GetLevel+0x42>
    case '(':
        return 0;
    1bbf:	b8 00 00 00 00       	mov    $0x0,%eax
    1bc4:	eb 0c                	jmp    1bd2 <GetLevel+0x42>
    case '#':
        return -2;
    1bc6:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1bcb:	eb 05                	jmp    1bd2 <GetLevel+0x42>
    };
    return -1;
    1bcd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1bd2:	c9                   	leave  
    1bd3:	c3                   	ret    

00001bd4 <Operate>:

double Operate(double a1, char op, double a2)
{
    1bd4:	55                   	push   %ebp
    1bd5:	89 e5                	mov    %esp,%ebp
    1bd7:	83 ec 28             	sub    $0x28,%esp
    1bda:	8b 45 10             	mov    0x10(%ebp),%eax
    1bdd:	8b 55 08             	mov    0x8(%ebp),%edx
    1be0:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1be3:	8b 55 0c             	mov    0xc(%ebp),%edx
    1be6:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1be9:	88 45 ec             	mov    %al,-0x14(%ebp)
    1bec:	8b 45 14             	mov    0x14(%ebp),%eax
    1bef:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1bf2:	8b 45 18             	mov    0x18(%ebp),%eax
    1bf5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1bf8:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1bfc:	83 f8 2b             	cmp    $0x2b,%eax
    1bff:	74 18                	je     1c19 <Operate+0x45>
    1c01:	83 f8 2b             	cmp    $0x2b,%eax
    1c04:	7f 07                	jg     1c0d <Operate+0x39>
    1c06:	83 f8 2a             	cmp    $0x2a,%eax
    1c09:	74 1e                	je     1c29 <Operate+0x55>
    1c0b:	eb 68                	jmp    1c75 <Operate+0xa1>
    1c0d:	83 f8 2d             	cmp    $0x2d,%eax
    1c10:	74 0f                	je     1c21 <Operate+0x4d>
    1c12:	83 f8 2f             	cmp    $0x2f,%eax
    1c15:	74 1a                	je     1c31 <Operate+0x5d>
    1c17:	eb 5c                	jmp    1c75 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1c19:	dd 45 f0             	fldl   -0x10(%ebp)
    1c1c:	dc 45 e0             	faddl  -0x20(%ebp)
    1c1f:	eb 56                	jmp    1c77 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1c21:	dd 45 f0             	fldl   -0x10(%ebp)
    1c24:	dc 65 e0             	fsubl  -0x20(%ebp)
    1c27:	eb 4e                	jmp    1c77 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1c29:	dd 45 f0             	fldl   -0x10(%ebp)
    1c2c:	dc 4d e0             	fmull  -0x20(%ebp)
    1c2f:	eb 46                	jmp    1c77 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1c31:	d9 ee                	fldz   
    1c33:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1c37:	dd 1c 24             	fstpl  (%esp)
    1c3a:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c3d:	ff 75 e0             	pushl  -0x20(%ebp)
    1c40:	e8 bd f3 ff ff       	call   1002 <isEqual>
    1c45:	83 c4 10             	add    $0x10,%esp
    1c48:	83 f8 01             	cmp    $0x1,%eax
    1c4b:	75 20                	jne    1c6d <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1c4d:	83 ec 0c             	sub    $0xc,%esp
    1c50:	68 e4 38 00 00       	push   $0x38e4
    1c55:	6a 00                	push   $0x0
    1c57:	6a 00                	push   $0x0
    1c59:	6a 01                	push   $0x1
    1c5b:	6a 04                	push   $0x4
    1c5d:	e8 ca 10 00 00       	call   2d2c <color_printf>
    1c62:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1c65:	dd 05 58 39 00 00    	fldl   0x3958
    1c6b:	eb 0a                	jmp    1c77 <Operate+0xa3>
        }
        else
          return a1 / a2;
    1c6d:	dd 45 f0             	fldl   -0x10(%ebp)
    1c70:	dc 75 e0             	fdivl  -0x20(%ebp)
    1c73:	eb 02                	jmp    1c77 <Operate+0xa3>
    };
    return 1;
    1c75:	d9 e8                	fld1   
}
    1c77:	c9                   	leave  
    1c78:	c3                   	ret    

00001c79 <Compute>:

double Compute(char *s)
{
    1c79:	55                   	push   %ebp
    1c7a:	89 e5                	mov    %esp,%ebp
    1c7c:	53                   	push   %ebx
    1c7d:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1c83:	e8 44 14 00 00       	call   30cc <dstack>
    1c88:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1c8b:	e8 73 13 00 00       	call   3003 <cstack>
    1c90:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1c93:	83 ec 08             	sub    $0x8,%esp
    1c96:	6a 23                	push   $0x23
    1c98:	ff 75 e0             	pushl  -0x20(%ebp)
    1c9b:	e8 91 13 00 00       	call   3031 <pushc>
    1ca0:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1ca3:	83 ec 0c             	sub    $0xc,%esp
    1ca6:	ff 75 08             	pushl  0x8(%ebp)
    1ca9:	e8 e8 e4 ff ff       	call   196 <strlen>
    1cae:	83 c4 10             	add    $0x10,%esp
    1cb1:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1cb4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1cbb:	c7 05 c0 44 00 00 00 	movl   $0x0,0x44c0
    1cc2:	00 00 00 
    1cc5:	e9 58 05 00 00       	jmp    2222 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1cca:	a1 c0 44 00 00       	mov    0x44c0,%eax
    1ccf:	89 c2                	mov    %eax,%edx
    1cd1:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd4:	01 d0                	add    %edx,%eax
    1cd6:	0f b6 00             	movzbl (%eax),%eax
    1cd9:	3c 24                	cmp    $0x24,%al
    1cdb:	0f 85 f8 01 00 00    	jne    1ed9 <Compute+0x260>
        {
          is_minus = 0;
    1ce1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1ce8:	a1 c0 44 00 00       	mov    0x44c0,%eax
    1ced:	83 c0 01             	add    $0x1,%eax
    1cf0:	a3 c0 44 00 00       	mov    %eax,0x44c0
          if(s[g_pos] != '{')
    1cf5:	a1 c0 44 00 00       	mov    0x44c0,%eax
    1cfa:	89 c2                	mov    %eax,%edx
    1cfc:	8b 45 08             	mov    0x8(%ebp),%eax
    1cff:	01 d0                	add    %edx,%eax
    1d01:	0f b6 00             	movzbl (%eax),%eax
    1d04:	3c 7b                	cmp    $0x7b,%al
    1d06:	74 23                	je     1d2b <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1d08:	83 ec 0c             	sub    $0xc,%esp
    1d0b:	68 fc 38 00 00       	push   $0x38fc
    1d10:	6a 00                	push   $0x0
    1d12:	6a 00                	push   $0x0
    1d14:	6a 01                	push   $0x1
    1d16:	6a 04                	push   $0x4
    1d18:	e8 0f 10 00 00       	call   2d2c <color_printf>
    1d1d:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1d20:	dd 05 58 39 00 00    	fldl   0x3958
    1d26:	e9 24 06 00 00       	jmp    234f <Compute+0x6d6>
          }
          int i=g_pos+1;
    1d2b:	a1 c0 44 00 00       	mov    0x44c0,%eax
    1d30:	83 c0 01             	add    $0x1,%eax
    1d33:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1d36:	eb 13                	jmp    1d4b <Compute+0xd2>
          {
            if(s[i] == '}')
    1d38:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1d3e:	01 d0                	add    %edx,%eax
    1d40:	0f b6 00             	movzbl (%eax),%eax
    1d43:	3c 7d                	cmp    $0x7d,%al
    1d45:	74 0e                	je     1d55 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1d47:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1d4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d4e:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1d51:	7c e5                	jl     1d38 <Compute+0xbf>
    1d53:	eb 01                	jmp    1d56 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1d55:	90                   	nop
          }
          if(s[i] != '}')
    1d56:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d59:	8b 45 08             	mov    0x8(%ebp),%eax
    1d5c:	01 d0                	add    %edx,%eax
    1d5e:	0f b6 00             	movzbl (%eax),%eax
    1d61:	3c 7d                	cmp    $0x7d,%al
    1d63:	74 23                	je     1d88 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1d65:	83 ec 0c             	sub    $0xc,%esp
    1d68:	68 0a 39 00 00       	push   $0x390a
    1d6d:	6a 00                	push   $0x0
    1d6f:	6a 00                	push   $0x0
    1d71:	6a 01                	push   $0x1
    1d73:	6a 04                	push   $0x4
    1d75:	e8 b2 0f 00 00       	call   2d2c <color_printf>
    1d7a:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1d7d:	dd 05 58 39 00 00    	fldl   0x3958
    1d83:	e9 c7 05 00 00       	jmp    234f <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1d88:	a1 c0 44 00 00       	mov    0x44c0,%eax
    1d8d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d90:	29 c2                	sub    %eax,%edx
    1d92:	89 d0                	mov    %edx,%eax
    1d94:	83 e8 01             	sub    $0x1,%eax
    1d97:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1d9a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1da1:	eb 27                	jmp    1dca <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1da3:	8b 15 c0 44 00 00    	mov    0x44c0,%edx
    1da9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1dac:	01 d0                	add    %edx,%eax
    1dae:	8d 50 01             	lea    0x1(%eax),%edx
    1db1:	8b 45 08             	mov    0x8(%ebp),%eax
    1db4:	01 d0                	add    %edx,%eax
    1db6:	0f b6 00             	movzbl (%eax),%eax
    1db9:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1dbf:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1dc2:	01 ca                	add    %ecx,%edx
    1dc4:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1dc6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1dca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1dcd:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1dd0:	7c d1                	jl     1da3 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1dd2:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1dd8:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1ddb:	01 d0                	add    %edx,%eax
    1ddd:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1de0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1de7:	a1 ac 44 00 00       	mov    0x44ac,%eax
    1dec:	85 c0                	test   %eax,%eax
    1dee:	75 40                	jne    1e30 <Compute+0x1b7>
            readVariables(variables,&v_num);
    1df0:	83 ec 08             	sub    $0x8,%esp
    1df3:	68 ac 44 00 00       	push   $0x44ac
    1df8:	68 e0 44 00 00       	push   $0x44e0
    1dfd:	e8 b0 13 00 00       	call   31b2 <readVariables>
    1e02:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1e05:	eb 29                	jmp    1e30 <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1e07:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e0a:	c1 e0 05             	shl    $0x5,%eax
    1e0d:	05 e0 44 00 00       	add    $0x44e0,%eax
    1e12:	8d 50 04             	lea    0x4(%eax),%edx
    1e15:	83 ec 08             	sub    $0x8,%esp
    1e18:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1e1e:	50                   	push   %eax
    1e1f:	52                   	push   %edx
    1e20:	e8 32 e3 ff ff       	call   157 <strcmp>
    1e25:	83 c4 10             	add    $0x10,%esp
    1e28:	85 c0                	test   %eax,%eax
    1e2a:	74 10                	je     1e3c <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1e2c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1e30:	a1 ac 44 00 00       	mov    0x44ac,%eax
    1e35:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1e38:	7c cd                	jl     1e07 <Compute+0x18e>
    1e3a:	eb 01                	jmp    1e3d <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1e3c:	90                   	nop
          }
          if(index == v_num) //no such variable
    1e3d:	a1 ac 44 00 00       	mov    0x44ac,%eax
    1e42:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1e45:	75 2a                	jne    1e71 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1e47:	83 ec 08             	sub    $0x8,%esp
    1e4a:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1e50:	50                   	push   %eax
    1e51:	68 18 39 00 00       	push   $0x3918
    1e56:	6a 00                	push   $0x0
    1e58:	6a 00                	push   $0x0
    1e5a:	6a 01                	push   $0x1
    1e5c:	6a 04                	push   $0x4
    1e5e:	e8 c9 0e 00 00       	call   2d2c <color_printf>
    1e63:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1e66:	dd 05 58 39 00 00    	fldl   0x3958
    1e6c:	e9 de 04 00 00       	jmp    234f <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1e71:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e74:	c1 e0 05             	shl    $0x5,%eax
    1e77:	05 e0 44 00 00       	add    $0x44e0,%eax
    1e7c:	8b 00                	mov    (%eax),%eax
    1e7e:	83 f8 02             	cmp    $0x2,%eax
    1e81:	75 23                	jne    1ea6 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1e83:	83 ec 0c             	sub    $0xc,%esp
    1e86:	68 32 39 00 00       	push   $0x3932
    1e8b:	6a 00                	push   $0x0
    1e8d:	6a 00                	push   $0x0
    1e8f:	6a 01                	push   $0x1
    1e91:	6a 04                	push   $0x4
    1e93:	e8 94 0e 00 00       	call   2d2c <color_printf>
    1e98:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1e9b:	dd 05 58 39 00 00    	fldl   0x3958
    1ea1:	e9 a9 04 00 00       	jmp    234f <Compute+0x6d6>
          }
          g_pos = i+1;
    1ea6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ea9:	83 c0 01             	add    $0x1,%eax
    1eac:	a3 c0 44 00 00       	mov    %eax,0x44c0
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    1eb1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1eb4:	c1 e0 05             	shl    $0x5,%eax
    1eb7:	05 f0 44 00 00       	add    $0x44f0,%eax
    1ebc:	dd 40 08             	fldl   0x8(%eax)
    1ebf:	83 ec 04             	sub    $0x4,%esp
    1ec2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1ec6:	dd 1c 24             	fstpl  (%esp)
    1ec9:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ecc:	e8 2f 12 00 00       	call   3100 <pushd>
    1ed1:	83 c4 10             	add    $0x10,%esp
    1ed4:	e9 49 03 00 00       	jmp    2222 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    1ed9:	a1 c0 44 00 00       	mov    0x44c0,%eax
    1ede:	89 c2                	mov    %eax,%edx
    1ee0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ee3:	01 d0                	add    %edx,%eax
    1ee5:	0f b6 00             	movzbl (%eax),%eax
    1ee8:	3c 2d                	cmp    $0x2d,%al
    1eea:	75 3f                	jne    1f2b <Compute+0x2b2>
    1eec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ef0:	74 39                	je     1f2b <Compute+0x2b2>
        {
            pushd(opnd,0);
    1ef2:	83 ec 04             	sub    $0x4,%esp
    1ef5:	d9 ee                	fldz   
    1ef7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1efb:	dd 1c 24             	fstpl  (%esp)
    1efe:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f01:	e8 fa 11 00 00       	call   3100 <pushd>
    1f06:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    1f09:	83 ec 08             	sub    $0x8,%esp
    1f0c:	6a 2d                	push   $0x2d
    1f0e:	ff 75 e0             	pushl  -0x20(%ebp)
    1f11:	e8 1b 11 00 00       	call   3031 <pushc>
    1f16:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    1f19:	a1 c0 44 00 00       	mov    0x44c0,%eax
    1f1e:	83 c0 01             	add    $0x1,%eax
    1f21:	a3 c0 44 00 00       	mov    %eax,0x44c0
    1f26:	e9 f7 02 00 00       	jmp    2222 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    1f2b:	a1 c0 44 00 00       	mov    0x44c0,%eax
    1f30:	89 c2                	mov    %eax,%edx
    1f32:	8b 45 08             	mov    0x8(%ebp),%eax
    1f35:	01 d0                	add    %edx,%eax
    1f37:	0f b6 00             	movzbl (%eax),%eax
    1f3a:	3c 29                	cmp    $0x29,%al
    1f3c:	0f 85 01 01 00 00    	jne    2043 <Compute+0x3ca>
        {
            is_minus = 0;
    1f42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    1f49:	a1 c0 44 00 00       	mov    0x44c0,%eax
    1f4e:	83 c0 01             	add    $0x1,%eax
    1f51:	a3 c0 44 00 00       	mov    %eax,0x44c0
            while (topc(optr) != '(')
    1f56:	e9 bf 00 00 00       	jmp    201a <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    1f5b:	83 ec 0c             	sub    $0xc,%esp
    1f5e:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f61:	e8 37 12 00 00       	call   319d <topd>
    1f66:	83 c4 10             	add    $0x10,%esp
    1f69:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    1f6c:	83 ec 0c             	sub    $0xc,%esp
    1f6f:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f72:	e8 dd 11 00 00       	call   3154 <popd>
    1f77:	dd d8                	fstp   %st(0)
    1f79:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    1f7c:	83 ec 0c             	sub    $0xc,%esp
    1f7f:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f82:	e8 16 12 00 00       	call   319d <topd>
    1f87:	83 c4 10             	add    $0x10,%esp
    1f8a:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    1f8d:	83 ec 0c             	sub    $0xc,%esp
    1f90:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f93:	e8 bc 11 00 00       	call   3154 <popd>
    1f98:	dd d8                	fstp   %st(0)
    1f9a:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    1f9d:	83 ec 0c             	sub    $0xc,%esp
    1fa0:	ff 75 e0             	pushl  -0x20(%ebp)
    1fa3:	e8 11 11 00 00       	call   30b9 <topc>
    1fa8:	83 c4 10             	add    $0x10,%esp
    1fab:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    1fae:	83 ec 0c             	sub    $0xc,%esp
    1fb1:	ff 75 e0             	pushl  -0x20(%ebp)
    1fb4:	e8 be 10 00 00       	call   3077 <popc>
    1fb9:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    1fbc:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    1fc0:	83 ec 0c             	sub    $0xc,%esp
    1fc3:	ff 75 d4             	pushl  -0x2c(%ebp)
    1fc6:	ff 75 d0             	pushl  -0x30(%ebp)
    1fc9:	50                   	push   %eax
    1fca:	ff 75 cc             	pushl  -0x34(%ebp)
    1fcd:	ff 75 c8             	pushl  -0x38(%ebp)
    1fd0:	e8 ff fb ff ff       	call   1bd4 <Operate>
    1fd5:	83 c4 20             	add    $0x20,%esp
    1fd8:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    1fdb:	dd 05 58 39 00 00    	fldl   0x3958
    1fe1:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1fe5:	dd 1c 24             	fstpl  (%esp)
    1fe8:	ff 75 bc             	pushl  -0x44(%ebp)
    1feb:	ff 75 b8             	pushl  -0x48(%ebp)
    1fee:	e8 0f f0 ff ff       	call   1002 <isEqual>
    1ff3:	83 c4 10             	add    $0x10,%esp
    1ff6:	83 f8 01             	cmp    $0x1,%eax
    1ff9:	75 0b                	jne    2006 <Compute+0x38d>
                  return WRONG_ANS;
    1ffb:	dd 05 58 39 00 00    	fldl   0x3958
    2001:	e9 49 03 00 00       	jmp    234f <Compute+0x6d6>
                pushd(opnd,result);
    2006:	83 ec 04             	sub    $0x4,%esp
    2009:	ff 75 bc             	pushl  -0x44(%ebp)
    200c:	ff 75 b8             	pushl  -0x48(%ebp)
    200f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2012:	e8 e9 10 00 00       	call   3100 <pushd>
    2017:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    201a:	83 ec 0c             	sub    $0xc,%esp
    201d:	ff 75 e0             	pushl  -0x20(%ebp)
    2020:	e8 94 10 00 00       	call   30b9 <topc>
    2025:	83 c4 10             	add    $0x10,%esp
    2028:	3c 28                	cmp    $0x28,%al
    202a:	0f 85 2b ff ff ff    	jne    1f5b <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    2030:	83 ec 0c             	sub    $0xc,%esp
    2033:	ff 75 e0             	pushl  -0x20(%ebp)
    2036:	e8 3c 10 00 00       	call   3077 <popc>
    203b:	83 c4 10             	add    $0x10,%esp
    203e:	e9 df 01 00 00       	jmp    2222 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    2043:	a1 c0 44 00 00       	mov    0x44c0,%eax
    2048:	89 c2                	mov    %eax,%edx
    204a:	8b 45 08             	mov    0x8(%ebp),%eax
    204d:	01 d0                	add    %edx,%eax
    204f:	0f b6 00             	movzbl (%eax),%eax
    2052:	3c 2f                	cmp    $0x2f,%al
    2054:	7e 49                	jle    209f <Compute+0x426>
    2056:	a1 c0 44 00 00       	mov    0x44c0,%eax
    205b:	89 c2                	mov    %eax,%edx
    205d:	8b 45 08             	mov    0x8(%ebp),%eax
    2060:	01 d0                	add    %edx,%eax
    2062:	0f b6 00             	movzbl (%eax),%eax
    2065:	3c 39                	cmp    $0x39,%al
    2067:	7f 36                	jg     209f <Compute+0x426>
        {
            is_minus = 0;
    2069:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    2070:	83 ec 08             	sub    $0x8,%esp
    2073:	68 c0 44 00 00       	push   $0x44c0
    2078:	ff 75 08             	pushl  0x8(%ebp)
    207b:	e8 c3 eb ff ff       	call   c43 <Translation>
    2080:	83 c4 10             	add    $0x10,%esp
    2083:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    2086:	83 ec 04             	sub    $0x4,%esp
    2089:	ff 75 b4             	pushl  -0x4c(%ebp)
    208c:	ff 75 b0             	pushl  -0x50(%ebp)
    208f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2092:	e8 69 10 00 00       	call   3100 <pushd>
    2097:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    209a:	e9 83 01 00 00       	jmp    2222 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    209f:	a1 c0 44 00 00       	mov    0x44c0,%eax
    20a4:	89 c2                	mov    %eax,%edx
    20a6:	8b 45 08             	mov    0x8(%ebp),%eax
    20a9:	01 d0                	add    %edx,%eax
    20ab:	0f b6 00             	movzbl (%eax),%eax
    20ae:	3c 28                	cmp    $0x28,%al
    20b0:	0f 85 f9 00 00 00    	jne    21af <Compute+0x536>
        {
            is_minus = 1;
    20b6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    20bd:	a1 c0 44 00 00       	mov    0x44c0,%eax
    20c2:	89 c2                	mov    %eax,%edx
    20c4:	8b 45 08             	mov    0x8(%ebp),%eax
    20c7:	01 d0                	add    %edx,%eax
    20c9:	0f b6 00             	movzbl (%eax),%eax
    20cc:	0f be c0             	movsbl %al,%eax
    20cf:	83 ec 08             	sub    $0x8,%esp
    20d2:	50                   	push   %eax
    20d3:	ff 75 e0             	pushl  -0x20(%ebp)
    20d6:	e8 56 0f 00 00       	call   3031 <pushc>
    20db:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    20de:	a1 c0 44 00 00       	mov    0x44c0,%eax
    20e3:	83 c0 01             	add    $0x1,%eax
    20e6:	a3 c0 44 00 00       	mov    %eax,0x44c0
    20eb:	e9 32 01 00 00       	jmp    2222 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    20f0:	83 ec 0c             	sub    $0xc,%esp
    20f3:	ff 75 e4             	pushl  -0x1c(%ebp)
    20f6:	e8 a2 10 00 00       	call   319d <topd>
    20fb:	83 c4 10             	add    $0x10,%esp
    20fe:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    2101:	83 ec 0c             	sub    $0xc,%esp
    2104:	ff 75 e4             	pushl  -0x1c(%ebp)
    2107:	e8 48 10 00 00       	call   3154 <popd>
    210c:	dd d8                	fstp   %st(0)
    210e:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2111:	83 ec 0c             	sub    $0xc,%esp
    2114:	ff 75 e4             	pushl  -0x1c(%ebp)
    2117:	e8 81 10 00 00       	call   319d <topd>
    211c:	83 c4 10             	add    $0x10,%esp
    211f:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    2122:	83 ec 0c             	sub    $0xc,%esp
    2125:	ff 75 e4             	pushl  -0x1c(%ebp)
    2128:	e8 27 10 00 00       	call   3154 <popd>
    212d:	dd d8                	fstp   %st(0)
    212f:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    2132:	83 ec 0c             	sub    $0xc,%esp
    2135:	ff 75 e0             	pushl  -0x20(%ebp)
    2138:	e8 7c 0f 00 00       	call   30b9 <topc>
    213d:	83 c4 10             	add    $0x10,%esp
    2140:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    2143:	83 ec 0c             	sub    $0xc,%esp
    2146:	ff 75 e0             	pushl  -0x20(%ebp)
    2149:	e8 29 0f 00 00       	call   3077 <popc>
    214e:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    2151:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    2155:	83 ec 0c             	sub    $0xc,%esp
    2158:	ff 75 ac             	pushl  -0x54(%ebp)
    215b:	ff 75 a8             	pushl  -0x58(%ebp)
    215e:	50                   	push   %eax
    215f:	ff 75 a4             	pushl  -0x5c(%ebp)
    2162:	ff 75 a0             	pushl  -0x60(%ebp)
    2165:	e8 6a fa ff ff       	call   1bd4 <Operate>
    216a:	83 c4 20             	add    $0x20,%esp
    216d:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    2170:	dd 05 58 39 00 00    	fldl   0x3958
    2176:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    217a:	dd 1c 24             	fstpl  (%esp)
    217d:	ff 75 94             	pushl  -0x6c(%ebp)
    2180:	ff 75 90             	pushl  -0x70(%ebp)
    2183:	e8 7a ee ff ff       	call   1002 <isEqual>
    2188:	83 c4 10             	add    $0x10,%esp
    218b:	83 f8 01             	cmp    $0x1,%eax
    218e:	75 0b                	jne    219b <Compute+0x522>
                  return WRONG_ANS;
    2190:	dd 05 58 39 00 00    	fldl   0x3958
    2196:	e9 b4 01 00 00       	jmp    234f <Compute+0x6d6>
                pushd(opnd,result);
    219b:	83 ec 04             	sub    $0x4,%esp
    219e:	ff 75 94             	pushl  -0x6c(%ebp)
    21a1:	ff 75 90             	pushl  -0x70(%ebp)
    21a4:	ff 75 e4             	pushl  -0x1c(%ebp)
    21a7:	e8 54 0f 00 00       	call   3100 <pushd>
    21ac:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    21af:	a1 c0 44 00 00       	mov    0x44c0,%eax
    21b4:	89 c2                	mov    %eax,%edx
    21b6:	8b 45 08             	mov    0x8(%ebp),%eax
    21b9:	01 d0                	add    %edx,%eax
    21bb:	0f b6 00             	movzbl (%eax),%eax
    21be:	0f be c0             	movsbl %al,%eax
    21c1:	83 ec 0c             	sub    $0xc,%esp
    21c4:	50                   	push   %eax
    21c5:	e8 c6 f9 ff ff       	call   1b90 <GetLevel>
    21ca:	83 c4 10             	add    $0x10,%esp
    21cd:	89 c3                	mov    %eax,%ebx
    21cf:	83 ec 0c             	sub    $0xc,%esp
    21d2:	ff 75 e0             	pushl  -0x20(%ebp)
    21d5:	e8 df 0e 00 00       	call   30b9 <topc>
    21da:	83 c4 10             	add    $0x10,%esp
    21dd:	0f be c0             	movsbl %al,%eax
    21e0:	83 ec 0c             	sub    $0xc,%esp
    21e3:	50                   	push   %eax
    21e4:	e8 a7 f9 ff ff       	call   1b90 <GetLevel>
    21e9:	83 c4 10             	add    $0x10,%esp
    21ec:	39 c3                	cmp    %eax,%ebx
    21ee:	0f 8e fc fe ff ff    	jle    20f0 <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    21f4:	a1 c0 44 00 00       	mov    0x44c0,%eax
    21f9:	89 c2                	mov    %eax,%edx
    21fb:	8b 45 08             	mov    0x8(%ebp),%eax
    21fe:	01 d0                	add    %edx,%eax
    2200:	0f b6 00             	movzbl (%eax),%eax
    2203:	0f be c0             	movsbl %al,%eax
    2206:	83 ec 08             	sub    $0x8,%esp
    2209:	50                   	push   %eax
    220a:	ff 75 e0             	pushl  -0x20(%ebp)
    220d:	e8 1f 0e 00 00       	call   3031 <pushc>
    2212:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2215:	a1 c0 44 00 00       	mov    0x44c0,%eax
    221a:	83 c0 01             	add    $0x1,%eax
    221d:	a3 c0 44 00 00       	mov    %eax,0x44c0
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    2222:	a1 c0 44 00 00       	mov    0x44c0,%eax
    2227:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    222a:	0f 8c 9a fa ff ff    	jl     1cca <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2230:	e9 da 00 00 00       	jmp    230f <Compute+0x696>
    {
        double a2 = topd(opnd);
    2235:	83 ec 0c             	sub    $0xc,%esp
    2238:	ff 75 e4             	pushl  -0x1c(%ebp)
    223b:	e8 5d 0f 00 00       	call   319d <topd>
    2240:	83 c4 10             	add    $0x10,%esp
    2243:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    2246:	83 ec 0c             	sub    $0xc,%esp
    2249:	ff 75 e4             	pushl  -0x1c(%ebp)
    224c:	e8 03 0f 00 00       	call   3154 <popd>
    2251:	dd d8                	fstp   %st(0)
    2253:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    2256:	83 ec 0c             	sub    $0xc,%esp
    2259:	ff 75 e4             	pushl  -0x1c(%ebp)
    225c:	e8 3c 0f 00 00       	call   319d <topd>
    2261:	83 c4 10             	add    $0x10,%esp
    2264:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    226a:	83 ec 0c             	sub    $0xc,%esp
    226d:	ff 75 e4             	pushl  -0x1c(%ebp)
    2270:	e8 df 0e 00 00       	call   3154 <popd>
    2275:	dd d8                	fstp   %st(0)
    2277:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    227a:	83 ec 0c             	sub    $0xc,%esp
    227d:	ff 75 e0             	pushl  -0x20(%ebp)
    2280:	e8 34 0e 00 00       	call   30b9 <topc>
    2285:	83 c4 10             	add    $0x10,%esp
    2288:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    228e:	83 ec 0c             	sub    $0xc,%esp
    2291:	ff 75 e0             	pushl  -0x20(%ebp)
    2294:	e8 de 0d 00 00       	call   3077 <popc>
    2299:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    229c:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    22a3:	83 ec 0c             	sub    $0xc,%esp
    22a6:	ff 75 84             	pushl  -0x7c(%ebp)
    22a9:	ff 75 80             	pushl  -0x80(%ebp)
    22ac:	50                   	push   %eax
    22ad:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    22b3:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    22b9:	e8 16 f9 ff ff       	call   1bd4 <Operate>
    22be:	83 c4 20             	add    $0x20,%esp
    22c1:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    22c7:	dd 05 58 39 00 00    	fldl   0x3958
    22cd:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    22d1:	dd 1c 24             	fstpl  (%esp)
    22d4:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    22da:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    22e0:	e8 1d ed ff ff       	call   1002 <isEqual>
    22e5:	83 c4 10             	add    $0x10,%esp
    22e8:	83 f8 01             	cmp    $0x1,%eax
    22eb:	75 08                	jne    22f5 <Compute+0x67c>
          return WRONG_ANS;
    22ed:	dd 05 58 39 00 00    	fldl   0x3958
    22f3:	eb 5a                	jmp    234f <Compute+0x6d6>
        pushd(opnd,result);
    22f5:	83 ec 04             	sub    $0x4,%esp
    22f8:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    22fe:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2304:	ff 75 e4             	pushl  -0x1c(%ebp)
    2307:	e8 f4 0d 00 00       	call   3100 <pushd>
    230c:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    230f:	83 ec 0c             	sub    $0xc,%esp
    2312:	ff 75 e0             	pushl  -0x20(%ebp)
    2315:	e8 9f 0d 00 00       	call   30b9 <topc>
    231a:	83 c4 10             	add    $0x10,%esp
    231d:	3c 23                	cmp    $0x23,%al
    231f:	0f 85 10 ff ff ff    	jne    2235 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    2325:	83 ec 0c             	sub    $0xc,%esp
    2328:	ff 75 e4             	pushl  -0x1c(%ebp)
    232b:	e8 94 e4 ff ff       	call   7c4 <free>
    2330:	83 c4 10             	add    $0x10,%esp
    free(optr);
    2333:	83 ec 0c             	sub    $0xc,%esp
    2336:	ff 75 e0             	pushl  -0x20(%ebp)
    2339:	e8 86 e4 ff ff       	call   7c4 <free>
    233e:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    2341:	83 ec 0c             	sub    $0xc,%esp
    2344:	ff 75 e4             	pushl  -0x1c(%ebp)
    2347:	e8 51 0e 00 00       	call   319d <topd>
    234c:	83 c4 10             	add    $0x10,%esp
}
    234f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2352:	c9                   	leave  
    2353:	c3                   	ret    

00002354 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    2354:	55                   	push   %ebp
    2355:	89 e5                	mov    %esp,%ebp
    2357:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    235a:	8b 45 08             	mov    0x8(%ebp),%eax
    235d:	8b 00                	mov    (%eax),%eax
    235f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2362:	eb 04                	jmp    2368 <gettoken+0x14>
    s++;
    2364:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2368:	8b 45 f4             	mov    -0xc(%ebp),%eax
    236b:	3b 45 0c             	cmp    0xc(%ebp),%eax
    236e:	73 1e                	jae    238e <gettoken+0x3a>
    2370:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2373:	0f b6 00             	movzbl (%eax),%eax
    2376:	0f be c0             	movsbl %al,%eax
    2379:	83 ec 08             	sub    $0x8,%esp
    237c:	50                   	push   %eax
    237d:	68 74 44 00 00       	push   $0x4474
    2382:	e8 50 de ff ff       	call   1d7 <strchr>
    2387:	83 c4 10             	add    $0x10,%esp
    238a:	85 c0                	test   %eax,%eax
    238c:	75 d6                	jne    2364 <gettoken+0x10>
    s++;
  if(q)
    238e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2392:	74 08                	je     239c <gettoken+0x48>
    *q = s;
    2394:	8b 45 10             	mov    0x10(%ebp),%eax
    2397:	8b 55 f4             	mov    -0xc(%ebp),%edx
    239a:	89 10                	mov    %edx,(%eax)
  ret = *s;
    239c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    239f:	0f b6 00             	movzbl (%eax),%eax
    23a2:	0f be c0             	movsbl %al,%eax
    23a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    23a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23ab:	0f b6 00             	movzbl (%eax),%eax
    23ae:	0f be c0             	movsbl %al,%eax
    23b1:	83 f8 29             	cmp    $0x29,%eax
    23b4:	7f 14                	jg     23ca <gettoken+0x76>
    23b6:	83 f8 28             	cmp    $0x28,%eax
    23b9:	7d 28                	jge    23e3 <gettoken+0x8f>
    23bb:	85 c0                	test   %eax,%eax
    23bd:	0f 84 94 00 00 00    	je     2457 <gettoken+0x103>
    23c3:	83 f8 26             	cmp    $0x26,%eax
    23c6:	74 1b                	je     23e3 <gettoken+0x8f>
    23c8:	eb 3a                	jmp    2404 <gettoken+0xb0>
    23ca:	83 f8 3e             	cmp    $0x3e,%eax
    23cd:	74 1a                	je     23e9 <gettoken+0x95>
    23cf:	83 f8 3e             	cmp    $0x3e,%eax
    23d2:	7f 0a                	jg     23de <gettoken+0x8a>
    23d4:	83 e8 3b             	sub    $0x3b,%eax
    23d7:	83 f8 01             	cmp    $0x1,%eax
    23da:	77 28                	ja     2404 <gettoken+0xb0>
    23dc:	eb 05                	jmp    23e3 <gettoken+0x8f>
    23de:	83 f8 7c             	cmp    $0x7c,%eax
    23e1:	75 21                	jne    2404 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    23e3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    23e7:	eb 75                	jmp    245e <gettoken+0x10a>
  case '>':
    s++;
    23e9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    23ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23f0:	0f b6 00             	movzbl (%eax),%eax
    23f3:	3c 3e                	cmp    $0x3e,%al
    23f5:	75 63                	jne    245a <gettoken+0x106>
      ret = '+';
    23f7:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    23fe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    2402:	eb 56                	jmp    245a <gettoken+0x106>
  default:
    ret = 'a';
    2404:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    240b:	eb 04                	jmp    2411 <gettoken+0xbd>
      s++;
    240d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2411:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2414:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2417:	73 44                	jae    245d <gettoken+0x109>
    2419:	8b 45 f4             	mov    -0xc(%ebp),%eax
    241c:	0f b6 00             	movzbl (%eax),%eax
    241f:	0f be c0             	movsbl %al,%eax
    2422:	83 ec 08             	sub    $0x8,%esp
    2425:	50                   	push   %eax
    2426:	68 74 44 00 00       	push   $0x4474
    242b:	e8 a7 dd ff ff       	call   1d7 <strchr>
    2430:	83 c4 10             	add    $0x10,%esp
    2433:	85 c0                	test   %eax,%eax
    2435:	75 26                	jne    245d <gettoken+0x109>
    2437:	8b 45 f4             	mov    -0xc(%ebp),%eax
    243a:	0f b6 00             	movzbl (%eax),%eax
    243d:	0f be c0             	movsbl %al,%eax
    2440:	83 ec 08             	sub    $0x8,%esp
    2443:	50                   	push   %eax
    2444:	68 7c 44 00 00       	push   $0x447c
    2449:	e8 89 dd ff ff       	call   1d7 <strchr>
    244e:	83 c4 10             	add    $0x10,%esp
    2451:	85 c0                	test   %eax,%eax
    2453:	74 b8                	je     240d <gettoken+0xb9>
      s++;
    break;
    2455:	eb 06                	jmp    245d <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    2457:	90                   	nop
    2458:	eb 04                	jmp    245e <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    245a:	90                   	nop
    245b:	eb 01                	jmp    245e <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    245d:	90                   	nop
  }
  if(eq)
    245e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2462:	74 0e                	je     2472 <gettoken+0x11e>
    *eq = s;
    2464:	8b 45 14             	mov    0x14(%ebp),%eax
    2467:	8b 55 f4             	mov    -0xc(%ebp),%edx
    246a:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    246c:	eb 04                	jmp    2472 <gettoken+0x11e>
    s++;
    246e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    2472:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2475:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2478:	73 1e                	jae    2498 <gettoken+0x144>
    247a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    247d:	0f b6 00             	movzbl (%eax),%eax
    2480:	0f be c0             	movsbl %al,%eax
    2483:	83 ec 08             	sub    $0x8,%esp
    2486:	50                   	push   %eax
    2487:	68 74 44 00 00       	push   $0x4474
    248c:	e8 46 dd ff ff       	call   1d7 <strchr>
    2491:	83 c4 10             	add    $0x10,%esp
    2494:	85 c0                	test   %eax,%eax
    2496:	75 d6                	jne    246e <gettoken+0x11a>
    s++;
  *ps = s;
    2498:	8b 45 08             	mov    0x8(%ebp),%eax
    249b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    249e:	89 10                	mov    %edx,(%eax)
  return ret;
    24a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    24a3:	c9                   	leave  
    24a4:	c3                   	ret    

000024a5 <peek>:

int peek(char **ps, char *es, char *toks)
{
    24a5:	55                   	push   %ebp
    24a6:	89 e5                	mov    %esp,%ebp
    24a8:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    24ab:	8b 45 08             	mov    0x8(%ebp),%eax
    24ae:	8b 00                	mov    (%eax),%eax
    24b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    24b3:	eb 04                	jmp    24b9 <peek+0x14>
    s++;
    24b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    24b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24bc:	3b 45 0c             	cmp    0xc(%ebp),%eax
    24bf:	73 1e                	jae    24df <peek+0x3a>
    24c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24c4:	0f b6 00             	movzbl (%eax),%eax
    24c7:	0f be c0             	movsbl %al,%eax
    24ca:	83 ec 08             	sub    $0x8,%esp
    24cd:	50                   	push   %eax
    24ce:	68 74 44 00 00       	push   $0x4474
    24d3:	e8 ff dc ff ff       	call   1d7 <strchr>
    24d8:	83 c4 10             	add    $0x10,%esp
    24db:	85 c0                	test   %eax,%eax
    24dd:	75 d6                	jne    24b5 <peek+0x10>
    s++;
  *ps = s;
    24df:	8b 45 08             	mov    0x8(%ebp),%eax
    24e2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    24e5:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    24e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24ea:	0f b6 00             	movzbl (%eax),%eax
    24ed:	84 c0                	test   %al,%al
    24ef:	74 23                	je     2514 <peek+0x6f>
    24f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24f4:	0f b6 00             	movzbl (%eax),%eax
    24f7:	0f be c0             	movsbl %al,%eax
    24fa:	83 ec 08             	sub    $0x8,%esp
    24fd:	50                   	push   %eax
    24fe:	ff 75 10             	pushl  0x10(%ebp)
    2501:	e8 d1 dc ff ff       	call   1d7 <strchr>
    2506:	83 c4 10             	add    $0x10,%esp
    2509:	85 c0                	test   %eax,%eax
    250b:	74 07                	je     2514 <peek+0x6f>
    250d:	b8 01 00 00 00       	mov    $0x1,%eax
    2512:	eb 05                	jmp    2519 <peek+0x74>
    2514:	b8 00 00 00 00       	mov    $0x0,%eax
}
    2519:	c9                   	leave  
    251a:	c3                   	ret    

0000251b <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    251b:	55                   	push   %ebp
    251c:	89 e5                	mov    %esp,%ebp
    251e:	53                   	push   %ebx
    251f:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    2522:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2525:	8b 45 08             	mov    0x8(%ebp),%eax
    2528:	83 ec 0c             	sub    $0xc,%esp
    252b:	50                   	push   %eax
    252c:	e8 65 dc ff ff       	call   196 <strlen>
    2531:	83 c4 10             	add    $0x10,%esp
    2534:	01 d8                	add    %ebx,%eax
    2536:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    2539:	8b 45 08             	mov    0x8(%ebp),%eax
    253c:	0f b6 00             	movzbl (%eax),%eax
    253f:	3c 25                	cmp    $0x25,%al
    2541:	75 5d                	jne    25a0 <parsecmd+0x85>
  {
    int len = strlen(s);
    2543:	8b 45 08             	mov    0x8(%ebp),%eax
    2546:	83 ec 0c             	sub    $0xc,%esp
    2549:	50                   	push   %eax
    254a:	e8 47 dc ff ff       	call   196 <strlen>
    254f:	83 c4 10             	add    $0x10,%esp
    2552:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    2555:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2558:	83 ec 0c             	sub    $0xc,%esp
    255b:	50                   	push   %eax
    255c:	e8 a5 e3 ff ff       	call   906 <malloc>
    2561:	83 c4 10             	add    $0x10,%esp
    2564:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    2567:	8b 45 08             	mov    0x8(%ebp),%eax
    256a:	83 c0 01             	add    $0x1,%eax
    256d:	83 ec 08             	sub    $0x8,%esp
    2570:	50                   	push   %eax
    2571:	ff 75 ec             	pushl  -0x14(%ebp)
    2574:	e8 ae db ff ff       	call   127 <strcpy>
    2579:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    257c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    257f:	8d 50 fe             	lea    -0x2(%eax),%edx
    2582:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2585:	01 d0                	add    %edx,%eax
    2587:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    258a:	83 ec 0c             	sub    $0xc,%esp
    258d:	ff 75 ec             	pushl  -0x14(%ebp)
    2590:	e8 59 e9 ff ff       	call   eee <calcmd>
    2595:	83 c4 10             	add    $0x10,%esp
    2598:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    259b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    259e:	eb 6b                	jmp    260b <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    25a0:	83 ec 08             	sub    $0x8,%esp
    25a3:	ff 75 f4             	pushl  -0xc(%ebp)
    25a6:	8d 45 08             	lea    0x8(%ebp),%eax
    25a9:	50                   	push   %eax
    25aa:	e8 61 00 00 00       	call   2610 <parseline>
    25af:	83 c4 10             	add    $0x10,%esp
    25b2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    25b5:	83 ec 04             	sub    $0x4,%esp
    25b8:	68 60 39 00 00       	push   $0x3960
    25bd:	ff 75 f4             	pushl  -0xc(%ebp)
    25c0:	8d 45 08             	lea    0x8(%ebp),%eax
    25c3:	50                   	push   %eax
    25c4:	e8 dc fe ff ff       	call   24a5 <peek>
    25c9:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    25cc:	8b 45 08             	mov    0x8(%ebp),%eax
    25cf:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    25d2:	74 26                	je     25fa <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    25d4:	8b 45 08             	mov    0x8(%ebp),%eax
    25d7:	83 ec 04             	sub    $0x4,%esp
    25da:	50                   	push   %eax
    25db:	68 61 39 00 00       	push   $0x3961
    25e0:	6a 02                	push   $0x2
    25e2:	e8 1d e0 ff ff       	call   604 <printf>
    25e7:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    25ea:	83 ec 0c             	sub    $0xc,%esp
    25ed:	68 70 39 00 00       	push   $0x3970
    25f2:	e8 f2 e3 ff ff       	call   9e9 <panic1>
    25f7:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    25fa:	83 ec 0c             	sub    $0xc,%esp
    25fd:	ff 75 e4             	pushl  -0x1c(%ebp)
    2600:	e8 eb 03 00 00       	call   29f0 <nulterminate>
    2605:	83 c4 10             	add    $0x10,%esp
  return cmd;
    2608:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    260b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    260e:	c9                   	leave  
    260f:	c3                   	ret    

00002610 <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    2610:	55                   	push   %ebp
    2611:	89 e5                	mov    %esp,%ebp
    2613:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    2616:	83 ec 08             	sub    $0x8,%esp
    2619:	ff 75 0c             	pushl  0xc(%ebp)
    261c:	ff 75 08             	pushl  0x8(%ebp)
    261f:	e8 99 00 00 00       	call   26bd <parsepipe>
    2624:	83 c4 10             	add    $0x10,%esp
    2627:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    262a:	eb 23                	jmp    264f <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    262c:	6a 00                	push   $0x0
    262e:	6a 00                	push   $0x0
    2630:	ff 75 0c             	pushl  0xc(%ebp)
    2633:	ff 75 08             	pushl  0x8(%ebp)
    2636:	e8 19 fd ff ff       	call   2354 <gettoken>
    263b:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    263e:	83 ec 0c             	sub    $0xc,%esp
    2641:	ff 75 f4             	pushl  -0xc(%ebp)
    2644:	e8 66 e8 ff ff       	call   eaf <backcmd>
    2649:	83 c4 10             	add    $0x10,%esp
    264c:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    264f:	83 ec 04             	sub    $0x4,%esp
    2652:	68 77 39 00 00       	push   $0x3977
    2657:	ff 75 0c             	pushl  0xc(%ebp)
    265a:	ff 75 08             	pushl  0x8(%ebp)
    265d:	e8 43 fe ff ff       	call   24a5 <peek>
    2662:	83 c4 10             	add    $0x10,%esp
    2665:	85 c0                	test   %eax,%eax
    2667:	75 c3                	jne    262c <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    2669:	83 ec 04             	sub    $0x4,%esp
    266c:	68 79 39 00 00       	push   $0x3979
    2671:	ff 75 0c             	pushl  0xc(%ebp)
    2674:	ff 75 08             	pushl  0x8(%ebp)
    2677:	e8 29 fe ff ff       	call   24a5 <peek>
    267c:	83 c4 10             	add    $0x10,%esp
    267f:	85 c0                	test   %eax,%eax
    2681:	74 35                	je     26b8 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    2683:	6a 00                	push   $0x0
    2685:	6a 00                	push   $0x0
    2687:	ff 75 0c             	pushl  0xc(%ebp)
    268a:	ff 75 08             	pushl  0x8(%ebp)
    268d:	e8 c2 fc ff ff       	call   2354 <gettoken>
    2692:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    2695:	83 ec 08             	sub    $0x8,%esp
    2698:	ff 75 0c             	pushl  0xc(%ebp)
    269b:	ff 75 08             	pushl  0x8(%ebp)
    269e:	e8 6d ff ff ff       	call   2610 <parseline>
    26a3:	83 c4 10             	add    $0x10,%esp
    26a6:	83 ec 08             	sub    $0x8,%esp
    26a9:	50                   	push   %eax
    26aa:	ff 75 f4             	pushl  -0xc(%ebp)
    26ad:	e8 b5 e7 ff ff       	call   e67 <listcmd>
    26b2:	83 c4 10             	add    $0x10,%esp
    26b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    26b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    26bb:	c9                   	leave  
    26bc:	c3                   	ret    

000026bd <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    26bd:	55                   	push   %ebp
    26be:	89 e5                	mov    %esp,%ebp
    26c0:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    26c3:	83 ec 08             	sub    $0x8,%esp
    26c6:	ff 75 0c             	pushl  0xc(%ebp)
    26c9:	ff 75 08             	pushl  0x8(%ebp)
    26cc:	e8 ec 01 00 00       	call   28bd <parseexec>
    26d1:	83 c4 10             	add    $0x10,%esp
    26d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    26d7:	83 ec 04             	sub    $0x4,%esp
    26da:	68 7b 39 00 00       	push   $0x397b
    26df:	ff 75 0c             	pushl  0xc(%ebp)
    26e2:	ff 75 08             	pushl  0x8(%ebp)
    26e5:	e8 bb fd ff ff       	call   24a5 <peek>
    26ea:	83 c4 10             	add    $0x10,%esp
    26ed:	85 c0                	test   %eax,%eax
    26ef:	74 35                	je     2726 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    26f1:	6a 00                	push   $0x0
    26f3:	6a 00                	push   $0x0
    26f5:	ff 75 0c             	pushl  0xc(%ebp)
    26f8:	ff 75 08             	pushl  0x8(%ebp)
    26fb:	e8 54 fc ff ff       	call   2354 <gettoken>
    2700:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2703:	83 ec 08             	sub    $0x8,%esp
    2706:	ff 75 0c             	pushl  0xc(%ebp)
    2709:	ff 75 08             	pushl  0x8(%ebp)
    270c:	e8 ac ff ff ff       	call   26bd <parsepipe>
    2711:	83 c4 10             	add    $0x10,%esp
    2714:	83 ec 08             	sub    $0x8,%esp
    2717:	50                   	push   %eax
    2718:	ff 75 f4             	pushl  -0xc(%ebp)
    271b:	e8 ff e6 ff ff       	call   e1f <pipecmd>
    2720:	83 c4 10             	add    $0x10,%esp
    2723:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2726:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2729:	c9                   	leave  
    272a:	c3                   	ret    

0000272b <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    272b:	55                   	push   %ebp
    272c:	89 e5                	mov    %esp,%ebp
    272e:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2731:	e9 b6 00 00 00       	jmp    27ec <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    2736:	6a 00                	push   $0x0
    2738:	6a 00                	push   $0x0
    273a:	ff 75 10             	pushl  0x10(%ebp)
    273d:	ff 75 0c             	pushl  0xc(%ebp)
    2740:	e8 0f fc ff ff       	call   2354 <gettoken>
    2745:	83 c4 10             	add    $0x10,%esp
    2748:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    274b:	8d 45 ec             	lea    -0x14(%ebp),%eax
    274e:	50                   	push   %eax
    274f:	8d 45 f0             	lea    -0x10(%ebp),%eax
    2752:	50                   	push   %eax
    2753:	ff 75 10             	pushl  0x10(%ebp)
    2756:	ff 75 0c             	pushl  0xc(%ebp)
    2759:	e8 f6 fb ff ff       	call   2354 <gettoken>
    275e:	83 c4 10             	add    $0x10,%esp
    2761:	83 f8 61             	cmp    $0x61,%eax
    2764:	74 10                	je     2776 <parseredirs+0x4b>
      panic1("missing file for redirection");
    2766:	83 ec 0c             	sub    $0xc,%esp
    2769:	68 7d 39 00 00       	push   $0x397d
    276e:	e8 76 e2 ff ff       	call   9e9 <panic1>
    2773:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    2776:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2779:	83 f8 3c             	cmp    $0x3c,%eax
    277c:	74 0c                	je     278a <parseredirs+0x5f>
    277e:	83 f8 3e             	cmp    $0x3e,%eax
    2781:	74 26                	je     27a9 <parseredirs+0x7e>
    2783:	83 f8 2b             	cmp    $0x2b,%eax
    2786:	74 43                	je     27cb <parseredirs+0xa0>
    2788:	eb 62                	jmp    27ec <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    278a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    278d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2790:	83 ec 0c             	sub    $0xc,%esp
    2793:	6a 00                	push   $0x0
    2795:	6a 00                	push   $0x0
    2797:	52                   	push   %edx
    2798:	50                   	push   %eax
    2799:	ff 75 08             	pushl  0x8(%ebp)
    279c:	e8 1b e6 ff ff       	call   dbc <redircmd>
    27a1:	83 c4 20             	add    $0x20,%esp
    27a4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    27a7:	eb 43                	jmp    27ec <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    27a9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    27ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27af:	83 ec 0c             	sub    $0xc,%esp
    27b2:	6a 01                	push   $0x1
    27b4:	68 01 02 00 00       	push   $0x201
    27b9:	52                   	push   %edx
    27ba:	50                   	push   %eax
    27bb:	ff 75 08             	pushl  0x8(%ebp)
    27be:	e8 f9 e5 ff ff       	call   dbc <redircmd>
    27c3:	83 c4 20             	add    $0x20,%esp
    27c6:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    27c9:	eb 21                	jmp    27ec <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    27cb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    27ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27d1:	83 ec 0c             	sub    $0xc,%esp
    27d4:	6a 01                	push   $0x1
    27d6:	68 01 02 00 00       	push   $0x201
    27db:	52                   	push   %edx
    27dc:	50                   	push   %eax
    27dd:	ff 75 08             	pushl  0x8(%ebp)
    27e0:	e8 d7 e5 ff ff       	call   dbc <redircmd>
    27e5:	83 c4 20             	add    $0x20,%esp
    27e8:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    27eb:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    27ec:	83 ec 04             	sub    $0x4,%esp
    27ef:	68 9a 39 00 00       	push   $0x399a
    27f4:	ff 75 10             	pushl  0x10(%ebp)
    27f7:	ff 75 0c             	pushl  0xc(%ebp)
    27fa:	e8 a6 fc ff ff       	call   24a5 <peek>
    27ff:	83 c4 10             	add    $0x10,%esp
    2802:	85 c0                	test   %eax,%eax
    2804:	0f 85 2c ff ff ff    	jne    2736 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    280a:	8b 45 08             	mov    0x8(%ebp),%eax
}
    280d:	c9                   	leave  
    280e:	c3                   	ret    

0000280f <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    280f:	55                   	push   %ebp
    2810:	89 e5                	mov    %esp,%ebp
    2812:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2815:	83 ec 04             	sub    $0x4,%esp
    2818:	68 9d 39 00 00       	push   $0x399d
    281d:	ff 75 0c             	pushl  0xc(%ebp)
    2820:	ff 75 08             	pushl  0x8(%ebp)
    2823:	e8 7d fc ff ff       	call   24a5 <peek>
    2828:	83 c4 10             	add    $0x10,%esp
    282b:	85 c0                	test   %eax,%eax
    282d:	75 10                	jne    283f <parseblock+0x30>
    panic1("parseblock");
    282f:	83 ec 0c             	sub    $0xc,%esp
    2832:	68 9f 39 00 00       	push   $0x399f
    2837:	e8 ad e1 ff ff       	call   9e9 <panic1>
    283c:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    283f:	6a 00                	push   $0x0
    2841:	6a 00                	push   $0x0
    2843:	ff 75 0c             	pushl  0xc(%ebp)
    2846:	ff 75 08             	pushl  0x8(%ebp)
    2849:	e8 06 fb ff ff       	call   2354 <gettoken>
    284e:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    2851:	83 ec 08             	sub    $0x8,%esp
    2854:	ff 75 0c             	pushl  0xc(%ebp)
    2857:	ff 75 08             	pushl  0x8(%ebp)
    285a:	e8 b1 fd ff ff       	call   2610 <parseline>
    285f:	83 c4 10             	add    $0x10,%esp
    2862:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    2865:	83 ec 04             	sub    $0x4,%esp
    2868:	68 aa 39 00 00       	push   $0x39aa
    286d:	ff 75 0c             	pushl  0xc(%ebp)
    2870:	ff 75 08             	pushl  0x8(%ebp)
    2873:	e8 2d fc ff ff       	call   24a5 <peek>
    2878:	83 c4 10             	add    $0x10,%esp
    287b:	85 c0                	test   %eax,%eax
    287d:	75 10                	jne    288f <parseblock+0x80>
    panic1("syntax - missing )");
    287f:	83 ec 0c             	sub    $0xc,%esp
    2882:	68 ac 39 00 00       	push   $0x39ac
    2887:	e8 5d e1 ff ff       	call   9e9 <panic1>
    288c:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    288f:	6a 00                	push   $0x0
    2891:	6a 00                	push   $0x0
    2893:	ff 75 0c             	pushl  0xc(%ebp)
    2896:	ff 75 08             	pushl  0x8(%ebp)
    2899:	e8 b6 fa ff ff       	call   2354 <gettoken>
    289e:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    28a1:	83 ec 04             	sub    $0x4,%esp
    28a4:	ff 75 0c             	pushl  0xc(%ebp)
    28a7:	ff 75 08             	pushl  0x8(%ebp)
    28aa:	ff 75 f4             	pushl  -0xc(%ebp)
    28ad:	e8 79 fe ff ff       	call   272b <parseredirs>
    28b2:	83 c4 10             	add    $0x10,%esp
    28b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    28b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    28bb:	c9                   	leave  
    28bc:	c3                   	ret    

000028bd <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    28bd:	55                   	push   %ebp
    28be:	89 e5                	mov    %esp,%ebp
    28c0:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    28c3:	83 ec 04             	sub    $0x4,%esp
    28c6:	68 9d 39 00 00       	push   $0x399d
    28cb:	ff 75 0c             	pushl  0xc(%ebp)
    28ce:	ff 75 08             	pushl  0x8(%ebp)
    28d1:	e8 cf fb ff ff       	call   24a5 <peek>
    28d6:	83 c4 10             	add    $0x10,%esp
    28d9:	85 c0                	test   %eax,%eax
    28db:	74 16                	je     28f3 <parseexec+0x36>
    return parseblock(ps, es);
    28dd:	83 ec 08             	sub    $0x8,%esp
    28e0:	ff 75 0c             	pushl  0xc(%ebp)
    28e3:	ff 75 08             	pushl  0x8(%ebp)
    28e6:	e8 24 ff ff ff       	call   280f <parseblock>
    28eb:	83 c4 10             	add    $0x10,%esp
    28ee:	e9 fb 00 00 00       	jmp    29ee <parseexec+0x131>

  ret = execcmd();
    28f3:	e8 8e e4 ff ff       	call   d86 <execcmd>
    28f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    28fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    28fe:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2901:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2908:	83 ec 04             	sub    $0x4,%esp
    290b:	ff 75 0c             	pushl  0xc(%ebp)
    290e:	ff 75 08             	pushl  0x8(%ebp)
    2911:	ff 75 f0             	pushl  -0x10(%ebp)
    2914:	e8 12 fe ff ff       	call   272b <parseredirs>
    2919:	83 c4 10             	add    $0x10,%esp
    291c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    291f:	e9 87 00 00 00       	jmp    29ab <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2924:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2927:	50                   	push   %eax
    2928:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    292b:	50                   	push   %eax
    292c:	ff 75 0c             	pushl  0xc(%ebp)
    292f:	ff 75 08             	pushl  0x8(%ebp)
    2932:	e8 1d fa ff ff       	call   2354 <gettoken>
    2937:	83 c4 10             	add    $0x10,%esp
    293a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    293d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2941:	0f 84 84 00 00 00    	je     29cb <parseexec+0x10e>
      break;
    if(tok != 'a')
    2947:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    294b:	74 10                	je     295d <parseexec+0xa0>
      panic1("syntax");
    294d:	83 ec 0c             	sub    $0xc,%esp
    2950:	68 70 39 00 00       	push   $0x3970
    2955:	e8 8f e0 ff ff       	call   9e9 <panic1>
    295a:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    295d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    2960:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2963:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2966:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    296a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    296d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2970:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2973:	83 c1 08             	add    $0x8,%ecx
    2976:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    297a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    297e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2982:	7e 10                	jle    2994 <parseexec+0xd7>
      panic1("too many args");
    2984:	83 ec 0c             	sub    $0xc,%esp
    2987:	68 bf 39 00 00       	push   $0x39bf
    298c:	e8 58 e0 ff ff       	call   9e9 <panic1>
    2991:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2994:	83 ec 04             	sub    $0x4,%esp
    2997:	ff 75 0c             	pushl  0xc(%ebp)
    299a:	ff 75 08             	pushl  0x8(%ebp)
    299d:	ff 75 f0             	pushl  -0x10(%ebp)
    29a0:	e8 86 fd ff ff       	call   272b <parseredirs>
    29a5:	83 c4 10             	add    $0x10,%esp
    29a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    29ab:	83 ec 04             	sub    $0x4,%esp
    29ae:	68 cd 39 00 00       	push   $0x39cd
    29b3:	ff 75 0c             	pushl  0xc(%ebp)
    29b6:	ff 75 08             	pushl  0x8(%ebp)
    29b9:	e8 e7 fa ff ff       	call   24a5 <peek>
    29be:	83 c4 10             	add    $0x10,%esp
    29c1:	85 c0                	test   %eax,%eax
    29c3:	0f 84 5b ff ff ff    	je     2924 <parseexec+0x67>
    29c9:	eb 01                	jmp    29cc <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    29cb:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    29cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29d2:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    29d9:	00 
  cmd->eargv[argc] = 0;
    29da:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29dd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29e0:	83 c2 08             	add    $0x8,%edx
    29e3:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    29ea:	00 
  return ret;
    29eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    29ee:	c9                   	leave  
    29ef:	c3                   	ret    

000029f0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    29f0:	55                   	push   %ebp
    29f1:	89 e5                	mov    %esp,%ebp
    29f3:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    29f6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    29fa:	75 0a                	jne    2a06 <nulterminate+0x16>
    return 0;
    29fc:	b8 00 00 00 00       	mov    $0x0,%eax
    2a01:	e9 e4 00 00 00       	jmp    2aea <nulterminate+0xfa>
  
  switch(cmd->type){
    2a06:	8b 45 08             	mov    0x8(%ebp),%eax
    2a09:	8b 00                	mov    (%eax),%eax
    2a0b:	83 f8 05             	cmp    $0x5,%eax
    2a0e:	0f 87 d3 00 00 00    	ja     2ae7 <nulterminate+0xf7>
    2a14:	8b 04 85 d4 39 00 00 	mov    0x39d4(,%eax,4),%eax
    2a1b:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2a1d:	8b 45 08             	mov    0x8(%ebp),%eax
    2a20:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2a23:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a2a:	eb 14                	jmp    2a40 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2a2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a2f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a32:	83 c2 08             	add    $0x8,%edx
    2a35:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2a39:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2a3c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2a40:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a43:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a46:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2a4a:	85 c0                	test   %eax,%eax
    2a4c:	75 de                	jne    2a2c <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2a4e:	e9 94 00 00 00       	jmp    2ae7 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2a53:	8b 45 08             	mov    0x8(%ebp),%eax
    2a56:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2a59:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a5c:	8b 40 04             	mov    0x4(%eax),%eax
    2a5f:	83 ec 0c             	sub    $0xc,%esp
    2a62:	50                   	push   %eax
    2a63:	e8 88 ff ff ff       	call   29f0 <nulterminate>
    2a68:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2a6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a6e:	8b 40 0c             	mov    0xc(%eax),%eax
    2a71:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2a74:	eb 71                	jmp    2ae7 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2a76:	8b 45 08             	mov    0x8(%ebp),%eax
    2a79:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2a7c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a7f:	8b 40 04             	mov    0x4(%eax),%eax
    2a82:	83 ec 0c             	sub    $0xc,%esp
    2a85:	50                   	push   %eax
    2a86:	e8 65 ff ff ff       	call   29f0 <nulterminate>
    2a8b:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2a8e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a91:	8b 40 08             	mov    0x8(%eax),%eax
    2a94:	83 ec 0c             	sub    $0xc,%esp
    2a97:	50                   	push   %eax
    2a98:	e8 53 ff ff ff       	call   29f0 <nulterminate>
    2a9d:	83 c4 10             	add    $0x10,%esp
    break;
    2aa0:	eb 45                	jmp    2ae7 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2aa2:	8b 45 08             	mov    0x8(%ebp),%eax
    2aa5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2aa8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2aab:	8b 40 04             	mov    0x4(%eax),%eax
    2aae:	83 ec 0c             	sub    $0xc,%esp
    2ab1:	50                   	push   %eax
    2ab2:	e8 39 ff ff ff       	call   29f0 <nulterminate>
    2ab7:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2aba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2abd:	8b 40 08             	mov    0x8(%eax),%eax
    2ac0:	83 ec 0c             	sub    $0xc,%esp
    2ac3:	50                   	push   %eax
    2ac4:	e8 27 ff ff ff       	call   29f0 <nulterminate>
    2ac9:	83 c4 10             	add    $0x10,%esp
    break;
    2acc:	eb 19                	jmp    2ae7 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2ace:	8b 45 08             	mov    0x8(%ebp),%eax
    2ad1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2ad4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2ad7:	8b 40 04             	mov    0x4(%eax),%eax
    2ada:	83 ec 0c             	sub    $0xc,%esp
    2add:	50                   	push   %eax
    2ade:	e8 0d ff ff ff       	call   29f0 <nulterminate>
    2ae3:	83 c4 10             	add    $0x10,%esp
    break;
    2ae6:	90                   	nop
  }
  return cmd;
    2ae7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2aea:	c9                   	leave  
    2aeb:	c3                   	ret    

00002aec <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2aec:	55                   	push   %ebp
    2aed:	89 e5                	mov    %esp,%ebp
    2aef:	83 ec 18             	sub    $0x18,%esp
    2af2:	8b 45 08             	mov    0x8(%ebp),%eax
    2af5:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2af8:	83 ec 08             	sub    $0x8,%esp
    2afb:	ff 75 18             	pushl  0x18(%ebp)
    2afe:	ff 75 14             	pushl  0x14(%ebp)
    2b01:	ff 75 10             	pushl  0x10(%ebp)
    2b04:	ff 75 0c             	pushl  0xc(%ebp)
    2b07:	6a 01                	push   $0x1
    2b09:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2b0c:	50                   	push   %eax
    2b0d:	e8 e6 d8 ff ff       	call   3f8 <colorwrite>
    2b12:	83 c4 20             	add    $0x20,%esp
}
    2b15:	90                   	nop
    2b16:	c9                   	leave  
    2b17:	c3                   	ret    

00002b18 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2b18:	55                   	push   %ebp
    2b19:	89 e5                	mov    %esp,%ebp
    2b1b:	53                   	push   %ebx
    2b1c:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2b1f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2b26:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2b2a:	74 17                	je     2b43 <color_printint+0x2b>
    2b2c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2b30:	79 11                	jns    2b43 <color_printint+0x2b>
    neg = 1;
    2b32:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2b39:	8b 45 08             	mov    0x8(%ebp),%eax
    2b3c:	f7 d8                	neg    %eax
    2b3e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b41:	eb 06                	jmp    2b49 <color_printint+0x31>
  } else {
    x = xx;
    2b43:	8b 45 08             	mov    0x8(%ebp),%eax
    2b46:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2b49:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2b50:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2b53:	8d 41 01             	lea    0x1(%ecx),%eax
    2b56:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2b5c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b5f:	ba 00 00 00 00       	mov    $0x0,%edx
    2b64:	f7 f3                	div    %ebx
    2b66:	89 d0                	mov    %edx,%eax
    2b68:	0f b6 80 84 44 00 00 	movzbl 0x4484(%eax),%eax
    2b6f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2b73:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2b76:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b79:	ba 00 00 00 00       	mov    $0x0,%edx
    2b7e:	f7 f3                	div    %ebx
    2b80:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b83:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2b87:	75 c7                	jne    2b50 <color_printint+0x38>
  if(neg)
    2b89:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2b8d:	74 36                	je     2bc5 <color_printint+0xad>
    buf[i++] = '-';
    2b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b92:	8d 50 01             	lea    0x1(%eax),%edx
    2b95:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2b98:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2b9d:	eb 26                	jmp    2bc5 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2b9f:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2ba2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ba5:	01 d0                	add    %edx,%eax
    2ba7:	0f b6 00             	movzbl (%eax),%eax
    2baa:	0f be c0             	movsbl %al,%eax
    2bad:	83 ec 0c             	sub    $0xc,%esp
    2bb0:	ff 75 20             	pushl  0x20(%ebp)
    2bb3:	ff 75 1c             	pushl  0x1c(%ebp)
    2bb6:	ff 75 18             	pushl  0x18(%ebp)
    2bb9:	ff 75 14             	pushl  0x14(%ebp)
    2bbc:	50                   	push   %eax
    2bbd:	e8 2a ff ff ff       	call   2aec <color_putc>
    2bc2:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2bc5:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2bc9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2bcd:	79 d0                	jns    2b9f <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2bcf:	90                   	nop
    2bd0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2bd3:	c9                   	leave  
    2bd4:	c3                   	ret    

00002bd5 <getInteger>:

static int getInteger(double num)
{
    2bd5:	55                   	push   %ebp
    2bd6:	89 e5                	mov    %esp,%ebp
    2bd8:	83 ec 18             	sub    $0x18,%esp
    2bdb:	8b 45 08             	mov    0x8(%ebp),%eax
    2bde:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2be1:	8b 45 0c             	mov    0xc(%ebp),%eax
    2be4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2be7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2bee:	eb 0e                	jmp    2bfe <getInteger+0x29>
  {
    num -= 1;
    2bf0:	dd 45 e8             	fldl   -0x18(%ebp)
    2bf3:	d9 e8                	fld1   
    2bf5:	de e9                	fsubrp %st,%st(1)
    2bf7:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2bfa:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2bfe:	dd 45 e8             	fldl   -0x18(%ebp)
    2c01:	d9 e8                	fld1   
    2c03:	d9 c9                	fxch   %st(1)
    2c05:	df e9                	fucomip %st(1),%st
    2c07:	dd d8                	fstp   %st(0)
    2c09:	77 e5                	ja     2bf0 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2c0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2c0e:	c9                   	leave  
    2c0f:	c3                   	ret    

00002c10 <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2c10:	55                   	push   %ebp
    2c11:	89 e5                	mov    %esp,%ebp
    2c13:	83 ec 28             	sub    $0x28,%esp
    2c16:	8b 45 08             	mov    0x8(%ebp),%eax
    2c19:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2c1c:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2c22:	d9 ee                	fldz   
    2c24:	dd 45 e0             	fldl   -0x20(%ebp)
    2c27:	d9 c9                	fxch   %st(1)
    2c29:	df e9                	fucomip %st(1),%st
    2c2b:	dd d8                	fstp   %st(0)
    2c2d:	76 21                	jbe    2c50 <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2c2f:	83 ec 0c             	sub    $0xc,%esp
    2c32:	ff 75 1c             	pushl  0x1c(%ebp)
    2c35:	ff 75 18             	pushl  0x18(%ebp)
    2c38:	ff 75 14             	pushl  0x14(%ebp)
    2c3b:	ff 75 10             	pushl  0x10(%ebp)
    2c3e:	6a 2d                	push   $0x2d
    2c40:	e8 a7 fe ff ff       	call   2aec <color_putc>
    2c45:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2c48:	dd 45 e0             	fldl   -0x20(%ebp)
    2c4b:	d9 e0                	fchs   
    2c4d:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2c50:	83 ec 08             	sub    $0x8,%esp
    2c53:	ff 75 e4             	pushl  -0x1c(%ebp)
    2c56:	ff 75 e0             	pushl  -0x20(%ebp)
    2c59:	e8 77 ff ff ff       	call   2bd5 <getInteger>
    2c5e:	83 c4 10             	add    $0x10,%esp
    2c61:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2c64:	83 ec 04             	sub    $0x4,%esp
    2c67:	ff 75 1c             	pushl  0x1c(%ebp)
    2c6a:	ff 75 18             	pushl  0x18(%ebp)
    2c6d:	ff 75 14             	pushl  0x14(%ebp)
    2c70:	ff 75 10             	pushl  0x10(%ebp)
    2c73:	6a 01                	push   $0x1
    2c75:	6a 0a                	push   $0xa
    2c77:	ff 75 f0             	pushl  -0x10(%ebp)
    2c7a:	e8 99 fe ff ff       	call   2b18 <color_printint>
    2c7f:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2c82:	db 45 f0             	fildl  -0x10(%ebp)
    2c85:	dd 45 e0             	fldl   -0x20(%ebp)
    2c88:	de e1                	fsubp  %st,%st(1)
    2c8a:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2c8d:	dd 45 e0             	fldl   -0x20(%ebp)
    2c90:	dd 05 f8 39 00 00    	fldl   0x39f8
    2c96:	d9 c9                	fxch   %st(1)
    2c98:	df e9                	fucomip %st(1),%st
    2c9a:	dd d8                	fstp   %st(0)
    2c9c:	76 19                	jbe    2cb7 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2c9e:	83 ec 0c             	sub    $0xc,%esp
    2ca1:	ff 75 1c             	pushl  0x1c(%ebp)
    2ca4:	ff 75 18             	pushl  0x18(%ebp)
    2ca7:	ff 75 14             	pushl  0x14(%ebp)
    2caa:	ff 75 10             	pushl  0x10(%ebp)
    2cad:	6a 2e                	push   $0x2e
    2caf:	e8 38 fe ff ff       	call   2aec <color_putc>
    2cb4:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2cb7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2cbe:	eb 55                	jmp    2d15 <color_printdbl+0x105>
  {
    num = num*10;
    2cc0:	dd 45 e0             	fldl   -0x20(%ebp)
    2cc3:	dd 05 00 3a 00 00    	fldl   0x3a00
    2cc9:	de c9                	fmulp  %st,%st(1)
    2ccb:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2cce:	83 ec 08             	sub    $0x8,%esp
    2cd1:	ff 75 e4             	pushl  -0x1c(%ebp)
    2cd4:	ff 75 e0             	pushl  -0x20(%ebp)
    2cd7:	e8 f9 fe ff ff       	call   2bd5 <getInteger>
    2cdc:	83 c4 10             	add    $0x10,%esp
    2cdf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2ce2:	83 ec 04             	sub    $0x4,%esp
    2ce5:	ff 75 1c             	pushl  0x1c(%ebp)
    2ce8:	ff 75 18             	pushl  0x18(%ebp)
    2ceb:	ff 75 14             	pushl  0x14(%ebp)
    2cee:	ff 75 10             	pushl  0x10(%ebp)
    2cf1:	6a 01                	push   $0x1
    2cf3:	6a 0a                	push   $0xa
    2cf5:	ff 75 f0             	pushl  -0x10(%ebp)
    2cf8:	e8 1b fe ff ff       	call   2b18 <color_printint>
    2cfd:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2d00:	db 45 f0             	fildl  -0x10(%ebp)
    2d03:	dd 45 e0             	fldl   -0x20(%ebp)
    2d06:	de e1                	fsubp  %st,%st(1)
    2d08:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2d0b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2d0f:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2d13:	7f 13                	jg     2d28 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2d15:	dd 45 e0             	fldl   -0x20(%ebp)
    2d18:	dd 05 f8 39 00 00    	fldl   0x39f8
    2d1e:	d9 c9                	fxch   %st(1)
    2d20:	df e9                	fucomip %st(1),%st
    2d22:	dd d8                	fstp   %st(0)
    2d24:	77 9a                	ja     2cc0 <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2d26:	eb 01                	jmp    2d29 <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2d28:	90                   	nop
    }
  }
}
    2d29:	90                   	nop
    2d2a:	c9                   	leave  
    2d2b:	c3                   	ret    

00002d2c <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2d2c:	55                   	push   %ebp
    2d2d:	89 e5                	mov    %esp,%ebp
    2d2f:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2d32:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2d39:	8d 45 18             	lea    0x18(%ebp),%eax
    2d3c:	83 c0 04             	add    $0x4,%eax
    2d3f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2d42:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2d49:	e9 e2 01 00 00       	jmp    2f30 <color_printf+0x204>
    c = fmt[i] & 0xff;
    2d4e:	8b 55 18             	mov    0x18(%ebp),%edx
    2d51:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d54:	01 d0                	add    %edx,%eax
    2d56:	0f b6 00             	movzbl (%eax),%eax
    2d59:	0f be c0             	movsbl %al,%eax
    2d5c:	25 ff 00 00 00       	and    $0xff,%eax
    2d61:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2d64:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2d68:	75 35                	jne    2d9f <color_printf+0x73>
      if(c == '%'){
    2d6a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2d6e:	75 0c                	jne    2d7c <color_printf+0x50>
        state = '%';
    2d70:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2d77:	e9 b0 01 00 00       	jmp    2f2c <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2d7c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d7f:	0f be c0             	movsbl %al,%eax
    2d82:	83 ec 0c             	sub    $0xc,%esp
    2d85:	ff 75 14             	pushl  0x14(%ebp)
    2d88:	ff 75 10             	pushl  0x10(%ebp)
    2d8b:	ff 75 0c             	pushl  0xc(%ebp)
    2d8e:	ff 75 08             	pushl  0x8(%ebp)
    2d91:	50                   	push   %eax
    2d92:	e8 55 fd ff ff       	call   2aec <color_putc>
    2d97:	83 c4 20             	add    $0x20,%esp
    2d9a:	e9 8d 01 00 00       	jmp    2f2c <color_printf+0x200>
      }
    } else if(state == '%'){
    2d9f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2da3:	0f 85 83 01 00 00    	jne    2f2c <color_printf+0x200>
      if(c == 'd'){
    2da9:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2dad:	75 2a                	jne    2dd9 <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2daf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2db2:	8b 00                	mov    (%eax),%eax
    2db4:	83 ec 04             	sub    $0x4,%esp
    2db7:	ff 75 14             	pushl  0x14(%ebp)
    2dba:	ff 75 10             	pushl  0x10(%ebp)
    2dbd:	ff 75 0c             	pushl  0xc(%ebp)
    2dc0:	ff 75 08             	pushl  0x8(%ebp)
    2dc3:	6a 01                	push   $0x1
    2dc5:	6a 0a                	push   $0xa
    2dc7:	50                   	push   %eax
    2dc8:	e8 4b fd ff ff       	call   2b18 <color_printint>
    2dcd:	83 c4 20             	add    $0x20,%esp
        ap++;
    2dd0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2dd4:	e9 4c 01 00 00       	jmp    2f25 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2dd9:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2ddd:	74 06                	je     2de5 <color_printf+0xb9>
    2ddf:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2de3:	75 2a                	jne    2e0f <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2de5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2de8:	8b 00                	mov    (%eax),%eax
    2dea:	83 ec 04             	sub    $0x4,%esp
    2ded:	ff 75 14             	pushl  0x14(%ebp)
    2df0:	ff 75 10             	pushl  0x10(%ebp)
    2df3:	ff 75 0c             	pushl  0xc(%ebp)
    2df6:	ff 75 08             	pushl  0x8(%ebp)
    2df9:	6a 00                	push   $0x0
    2dfb:	6a 10                	push   $0x10
    2dfd:	50                   	push   %eax
    2dfe:	e8 15 fd ff ff       	call   2b18 <color_printint>
    2e03:	83 c4 20             	add    $0x20,%esp
        ap++;
    2e06:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2e0a:	e9 16 01 00 00       	jmp    2f25 <color_printf+0x1f9>
      } else if(c == 's'){
    2e0f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2e13:	75 4f                	jne    2e64 <color_printf+0x138>
        s = (char*)*ap;
    2e15:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e18:	8b 00                	mov    (%eax),%eax
    2e1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2e1d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2e21:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e25:	75 2e                	jne    2e55 <color_printf+0x129>
          s = "(null)";
    2e27:	c7 45 f4 f0 39 00 00 	movl   $0x39f0,-0xc(%ebp)
        while(*s != 0){
    2e2e:	eb 25                	jmp    2e55 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e33:	0f b6 00             	movzbl (%eax),%eax
    2e36:	0f be c0             	movsbl %al,%eax
    2e39:	83 ec 0c             	sub    $0xc,%esp
    2e3c:	ff 75 14             	pushl  0x14(%ebp)
    2e3f:	ff 75 10             	pushl  0x10(%ebp)
    2e42:	ff 75 0c             	pushl  0xc(%ebp)
    2e45:	ff 75 08             	pushl  0x8(%ebp)
    2e48:	50                   	push   %eax
    2e49:	e8 9e fc ff ff       	call   2aec <color_putc>
    2e4e:	83 c4 20             	add    $0x20,%esp
          s++;
    2e51:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2e55:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e58:	0f b6 00             	movzbl (%eax),%eax
    2e5b:	84 c0                	test   %al,%al
    2e5d:	75 d1                	jne    2e30 <color_printf+0x104>
    2e5f:	e9 c1 00 00 00       	jmp    2f25 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2e64:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2e68:	75 29                	jne    2e93 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2e6a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e6d:	8b 00                	mov    (%eax),%eax
    2e6f:	0f be c0             	movsbl %al,%eax
    2e72:	83 ec 0c             	sub    $0xc,%esp
    2e75:	ff 75 14             	pushl  0x14(%ebp)
    2e78:	ff 75 10             	pushl  0x10(%ebp)
    2e7b:	ff 75 0c             	pushl  0xc(%ebp)
    2e7e:	ff 75 08             	pushl  0x8(%ebp)
    2e81:	50                   	push   %eax
    2e82:	e8 65 fc ff ff       	call   2aec <color_putc>
    2e87:	83 c4 20             	add    $0x20,%esp
        ap++;
    2e8a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2e8e:	e9 92 00 00 00       	jmp    2f25 <color_printf+0x1f9>
      } else if(c == '%'){
    2e93:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2e97:	75 20                	jne    2eb9 <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2e99:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e9c:	0f be c0             	movsbl %al,%eax
    2e9f:	83 ec 0c             	sub    $0xc,%esp
    2ea2:	ff 75 14             	pushl  0x14(%ebp)
    2ea5:	ff 75 10             	pushl  0x10(%ebp)
    2ea8:	ff 75 0c             	pushl  0xc(%ebp)
    2eab:	ff 75 08             	pushl  0x8(%ebp)
    2eae:	50                   	push   %eax
    2eaf:	e8 38 fc ff ff       	call   2aec <color_putc>
    2eb4:	83 c4 20             	add    $0x20,%esp
    2eb7:	eb 6c                	jmp    2f25 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    2eb9:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    2ebd:	75 2f                	jne    2eee <color_printf+0x1c2>
        double *dap = (double*)ap;
    2ebf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ec2:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    2ec5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2ec8:	dd 00                	fldl   (%eax)
    2eca:	83 ec 08             	sub    $0x8,%esp
    2ecd:	ff 75 14             	pushl  0x14(%ebp)
    2ed0:	ff 75 10             	pushl  0x10(%ebp)
    2ed3:	ff 75 0c             	pushl  0xc(%ebp)
    2ed6:	ff 75 08             	pushl  0x8(%ebp)
    2ed9:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2edd:	dd 1c 24             	fstpl  (%esp)
    2ee0:	e8 2b fd ff ff       	call   2c10 <color_printdbl>
    2ee5:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    2ee8:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    2eec:	eb 37                	jmp    2f25 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    2eee:	83 ec 0c             	sub    $0xc,%esp
    2ef1:	ff 75 14             	pushl  0x14(%ebp)
    2ef4:	ff 75 10             	pushl  0x10(%ebp)
    2ef7:	ff 75 0c             	pushl  0xc(%ebp)
    2efa:	ff 75 08             	pushl  0x8(%ebp)
    2efd:	6a 25                	push   $0x25
    2eff:	e8 e8 fb ff ff       	call   2aec <color_putc>
    2f04:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    2f07:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2f0a:	0f be c0             	movsbl %al,%eax
    2f0d:	83 ec 0c             	sub    $0xc,%esp
    2f10:	ff 75 14             	pushl  0x14(%ebp)
    2f13:	ff 75 10             	pushl  0x10(%ebp)
    2f16:	ff 75 0c             	pushl  0xc(%ebp)
    2f19:	ff 75 08             	pushl  0x8(%ebp)
    2f1c:	50                   	push   %eax
    2f1d:	e8 ca fb ff ff       	call   2aec <color_putc>
    2f22:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    2f25:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2f2c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2f30:	8b 55 18             	mov    0x18(%ebp),%edx
    2f33:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f36:	01 d0                	add    %edx,%eax
    2f38:	0f b6 00             	movzbl (%eax),%eax
    2f3b:	84 c0                	test   %al,%al
    2f3d:	0f 85 0b fe ff ff    	jne    2d4e <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    2f43:	90                   	nop
    2f44:	c9                   	leave  
    2f45:	c3                   	ret    

00002f46 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    2f46:	55                   	push   %ebp
    2f47:	89 e5                	mov    %esp,%ebp
    2f49:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    2f4c:	83 ec 0c             	sub    $0xc,%esp
    2f4f:	6a 58                	push   $0x58
    2f51:	e8 b0 d9 ff ff       	call   906 <malloc>
    2f56:	83 c4 10             	add    $0x10,%esp
    2f59:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2f5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f5f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2f65:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f68:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    2f6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2f72:	c9                   	leave  
    2f73:	c3                   	ret    

00002f74 <pushi>:

void pushi(struct istack *s, int val)
{
    2f74:	55                   	push   %ebp
    2f75:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    2f77:	8b 45 08             	mov    0x8(%ebp),%eax
    2f7a:	8b 00                	mov    (%eax),%eax
    2f7c:	83 f8 13             	cmp    $0x13,%eax
    2f7f:	7f 2c                	jg     2fad <pushi+0x39>
    {
        s->size++;
    2f81:	8b 45 08             	mov    0x8(%ebp),%eax
    2f84:	8b 00                	mov    (%eax),%eax
    2f86:	8d 50 01             	lea    0x1(%eax),%edx
    2f89:	8b 45 08             	mov    0x8(%ebp),%eax
    2f8c:	89 10                	mov    %edx,(%eax)
        s->top++;
    2f8e:	8b 45 08             	mov    0x8(%ebp),%eax
    2f91:	8b 40 54             	mov    0x54(%eax),%eax
    2f94:	8d 50 01             	lea    0x1(%eax),%edx
    2f97:	8b 45 08             	mov    0x8(%ebp),%eax
    2f9a:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    2f9d:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa0:	8b 50 54             	mov    0x54(%eax),%edx
    2fa3:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2fa9:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    2fad:	90                   	nop
    2fae:	5d                   	pop    %ebp
    2faf:	c3                   	ret    

00002fb0 <popi>:

int popi(struct istack *s)
{
    2fb0:	55                   	push   %ebp
    2fb1:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2fb3:	8b 45 08             	mov    0x8(%ebp),%eax
    2fb6:	8b 00                	mov    (%eax),%eax
    2fb8:	85 c0                	test   %eax,%eax
    2fba:	75 07                	jne    2fc3 <popi+0x13>
    {
        return -1;
    2fbc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2fc1:	eb 2c                	jmp    2fef <popi+0x3f>
    }
    s->size--;
    2fc3:	8b 45 08             	mov    0x8(%ebp),%eax
    2fc6:	8b 00                	mov    (%eax),%eax
    2fc8:	8d 50 ff             	lea    -0x1(%eax),%edx
    2fcb:	8b 45 08             	mov    0x8(%ebp),%eax
    2fce:	89 10                	mov    %edx,(%eax)
    s->top--;
    2fd0:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd3:	8b 40 54             	mov    0x54(%eax),%eax
    2fd6:	8d 50 ff             	lea    -0x1(%eax),%edx
    2fd9:	8b 45 08             	mov    0x8(%ebp),%eax
    2fdc:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    2fdf:	8b 45 08             	mov    0x8(%ebp),%eax
    2fe2:	8b 40 54             	mov    0x54(%eax),%eax
    2fe5:	8d 50 01             	lea    0x1(%eax),%edx
    2fe8:	8b 45 08             	mov    0x8(%ebp),%eax
    2feb:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2fef:	5d                   	pop    %ebp
    2ff0:	c3                   	ret    

00002ff1 <topi>:

int topi(struct istack* s)
{
    2ff1:	55                   	push   %ebp
    2ff2:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    2ff4:	8b 45 08             	mov    0x8(%ebp),%eax
    2ff7:	8b 50 54             	mov    0x54(%eax),%edx
    2ffa:	8b 45 08             	mov    0x8(%ebp),%eax
    2ffd:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3001:	5d                   	pop    %ebp
    3002:	c3                   	ret    

00003003 <cstack>:

//constructor
struct cstack* cstack()
{
    3003:	55                   	push   %ebp
    3004:	89 e5                	mov    %esp,%ebp
    3006:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    3009:	83 ec 0c             	sub    $0xc,%esp
    300c:	6a 1c                	push   $0x1c
    300e:	e8 f3 d8 ff ff       	call   906 <malloc>
    3013:	83 c4 10             	add    $0x10,%esp
    3016:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3019:	8b 45 f4             	mov    -0xc(%ebp),%eax
    301c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3022:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3025:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    302c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    302f:	c9                   	leave  
    3030:	c3                   	ret    

00003031 <pushc>:

void pushc(struct cstack *s, char val)
{
    3031:	55                   	push   %ebp
    3032:	89 e5                	mov    %esp,%ebp
    3034:	83 ec 04             	sub    $0x4,%esp
    3037:	8b 45 0c             	mov    0xc(%ebp),%eax
    303a:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    303d:	8b 45 08             	mov    0x8(%ebp),%eax
    3040:	8b 00                	mov    (%eax),%eax
    3042:	83 f8 13             	cmp    $0x13,%eax
    3045:	7f 2d                	jg     3074 <pushc+0x43>
    {
        s->size++;
    3047:	8b 45 08             	mov    0x8(%ebp),%eax
    304a:	8b 00                	mov    (%eax),%eax
    304c:	8d 50 01             	lea    0x1(%eax),%edx
    304f:	8b 45 08             	mov    0x8(%ebp),%eax
    3052:	89 10                	mov    %edx,(%eax)
        s->top++;
    3054:	8b 45 08             	mov    0x8(%ebp),%eax
    3057:	8b 40 18             	mov    0x18(%eax),%eax
    305a:	8d 50 01             	lea    0x1(%eax),%edx
    305d:	8b 45 08             	mov    0x8(%ebp),%eax
    3060:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    3063:	8b 45 08             	mov    0x8(%ebp),%eax
    3066:	8b 40 18             	mov    0x18(%eax),%eax
    3069:	8b 55 08             	mov    0x8(%ebp),%edx
    306c:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    3070:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    3074:	90                   	nop
    3075:	c9                   	leave  
    3076:	c3                   	ret    

00003077 <popc>:

char popc(struct cstack *s)
{
    3077:	55                   	push   %ebp
    3078:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    307a:	8b 45 08             	mov    0x8(%ebp),%eax
    307d:	8b 00                	mov    (%eax),%eax
    307f:	85 c0                	test   %eax,%eax
    3081:	75 07                	jne    308a <popc+0x13>
    {
        return -1;
    3083:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3088:	eb 2d                	jmp    30b7 <popc+0x40>
    }
    s->size--;
    308a:	8b 45 08             	mov    0x8(%ebp),%eax
    308d:	8b 00                	mov    (%eax),%eax
    308f:	8d 50 ff             	lea    -0x1(%eax),%edx
    3092:	8b 45 08             	mov    0x8(%ebp),%eax
    3095:	89 10                	mov    %edx,(%eax)
    s->top--;
    3097:	8b 45 08             	mov    0x8(%ebp),%eax
    309a:	8b 40 18             	mov    0x18(%eax),%eax
    309d:	8d 50 ff             	lea    -0x1(%eax),%edx
    30a0:	8b 45 08             	mov    0x8(%ebp),%eax
    30a3:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    30a6:	8b 45 08             	mov    0x8(%ebp),%eax
    30a9:	8b 40 18             	mov    0x18(%eax),%eax
    30ac:	8d 50 01             	lea    0x1(%eax),%edx
    30af:	8b 45 08             	mov    0x8(%ebp),%eax
    30b2:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    30b7:	5d                   	pop    %ebp
    30b8:	c3                   	ret    

000030b9 <topc>:

char topc(struct cstack* s)
{
    30b9:	55                   	push   %ebp
    30ba:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    30bc:	8b 45 08             	mov    0x8(%ebp),%eax
    30bf:	8b 40 18             	mov    0x18(%eax),%eax
    30c2:	8b 55 08             	mov    0x8(%ebp),%edx
    30c5:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    30ca:	5d                   	pop    %ebp
    30cb:	c3                   	ret    

000030cc <dstack>:

//constructor
struct dstack* dstack()
{
    30cc:	55                   	push   %ebp
    30cd:	89 e5                	mov    %esp,%ebp
    30cf:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    30d2:	83 ec 0c             	sub    $0xc,%esp
    30d5:	68 a8 00 00 00       	push   $0xa8
    30da:	e8 27 d8 ff ff       	call   906 <malloc>
    30df:	83 c4 10             	add    $0x10,%esp
    30e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    30e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30e8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    30ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30f1:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    30f8:	ff ff ff 
    return stack;
    30fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    30fe:	c9                   	leave  
    30ff:	c3                   	ret    

00003100 <pushd>:

void pushd(struct dstack *s, double val)
{
    3100:	55                   	push   %ebp
    3101:	89 e5                	mov    %esp,%ebp
    3103:	83 ec 08             	sub    $0x8,%esp
    3106:	8b 45 0c             	mov    0xc(%ebp),%eax
    3109:	89 45 f8             	mov    %eax,-0x8(%ebp)
    310c:	8b 45 10             	mov    0x10(%ebp),%eax
    310f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3112:	8b 45 08             	mov    0x8(%ebp),%eax
    3115:	8b 00                	mov    (%eax),%eax
    3117:	83 f8 13             	cmp    $0x13,%eax
    311a:	7f 35                	jg     3151 <pushd+0x51>
    {
        s->size++;
    311c:	8b 45 08             	mov    0x8(%ebp),%eax
    311f:	8b 00                	mov    (%eax),%eax
    3121:	8d 50 01             	lea    0x1(%eax),%edx
    3124:	8b 45 08             	mov    0x8(%ebp),%eax
    3127:	89 10                	mov    %edx,(%eax)
        s->top++;
    3129:	8b 45 08             	mov    0x8(%ebp),%eax
    312c:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3132:	8d 50 01             	lea    0x1(%eax),%edx
    3135:	8b 45 08             	mov    0x8(%ebp),%eax
    3138:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    313e:	8b 45 08             	mov    0x8(%ebp),%eax
    3141:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3147:	8b 45 08             	mov    0x8(%ebp),%eax
    314a:	dd 45 f8             	fldl   -0x8(%ebp)
    314d:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    3151:	90                   	nop
    3152:	c9                   	leave  
    3153:	c3                   	ret    

00003154 <popd>:

double popd(struct dstack *s)
{
    3154:	55                   	push   %ebp
    3155:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3157:	8b 45 08             	mov    0x8(%ebp),%eax
    315a:	8b 00                	mov    (%eax),%eax
    315c:	85 c0                	test   %eax,%eax
    315e:	75 06                	jne    3166 <popd+0x12>
    {
        return -1;
    3160:	d9 e8                	fld1   
    3162:	d9 e0                	fchs   
    3164:	eb 35                	jmp    319b <popd+0x47>
    }
    s->size--;
    3166:	8b 45 08             	mov    0x8(%ebp),%eax
    3169:	8b 00                	mov    (%eax),%eax
    316b:	8d 50 ff             	lea    -0x1(%eax),%edx
    316e:	8b 45 08             	mov    0x8(%ebp),%eax
    3171:	89 10                	mov    %edx,(%eax)
    s->top--;
    3173:	8b 45 08             	mov    0x8(%ebp),%eax
    3176:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    317c:	8d 50 ff             	lea    -0x1(%eax),%edx
    317f:	8b 45 08             	mov    0x8(%ebp),%eax
    3182:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    3188:	8b 45 08             	mov    0x8(%ebp),%eax
    318b:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3191:	8d 50 01             	lea    0x1(%eax),%edx
    3194:	8b 45 08             	mov    0x8(%ebp),%eax
    3197:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    319b:	5d                   	pop    %ebp
    319c:	c3                   	ret    

0000319d <topd>:

double topd(struct dstack* s)
{
    319d:	55                   	push   %ebp
    319e:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    31a0:	8b 45 08             	mov    0x8(%ebp),%eax
    31a3:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    31a9:	8b 45 08             	mov    0x8(%ebp),%eax
    31ac:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    31b0:	5d                   	pop    %ebp
    31b1:	c3                   	ret    

000031b2 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    31b2:	55                   	push   %ebp
    31b3:	89 e5                	mov    %esp,%ebp
    31b5:	53                   	push   %ebx
    31b6:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    31bc:	83 ec 08             	sub    $0x8,%esp
    31bf:	6a 00                	push   $0x0
    31c1:	68 08 3a 00 00       	push   $0x3a08
    31c6:	e8 cd d1 ff ff       	call   398 <open>
    31cb:	83 c4 10             	add    $0x10,%esp
    31ce:	89 45 e8             	mov    %eax,-0x18(%ebp)
    31d1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    31d5:	79 1d                	jns    31f4 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    31d7:	83 ec 0c             	sub    $0xc,%esp
    31da:	68 12 3a 00 00       	push   $0x3a12
    31df:	6a 00                	push   $0x0
    31e1:	6a 00                	push   $0x0
    31e3:	6a 01                	push   $0x1
    31e5:	6a 03                	push   $0x3
    31e7:	e8 40 fb ff ff       	call   2d2c <color_printf>
    31ec:	83 c4 20             	add    $0x20,%esp
    31ef:	e9 6d 02 00 00       	jmp    3461 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    31f4:	8b 45 0c             	mov    0xc(%ebp),%eax
    31f7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    31fd:	e9 2a 02 00 00       	jmp    342c <readVariables+0x27a>
  {
    int pos = 0;
    3202:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    3209:	00 00 00 
    while(pos <= n-1)
    320c:	e9 07 02 00 00       	jmp    3418 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    3211:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    3218:	eb 24                	jmp    323e <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    321a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    321d:	8d 50 ff             	lea    -0x1(%eax),%edx
    3220:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    3226:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3229:	01 c8                	add    %ecx,%eax
    322b:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3232:	ff 
    3233:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    323a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    323e:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3244:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3247:	01 d0                	add    %edx,%eax
    3249:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3250:	ff 
    3251:	3c 3d                	cmp    $0x3d,%al
    3253:	75 c5                	jne    321a <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    3255:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3258:	83 e8 01             	sub    $0x1,%eax
    325b:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    3262:	00 
      if(buf[pos] == 'd') //double value
    3263:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3269:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3270:	ff 
    3271:	3c 64                	cmp    $0x64,%al
    3273:	0f 85 a0 00 00 00    	jne    3319 <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    3279:	8b 45 0c             	mov    0xc(%ebp),%eax
    327c:	8b 00                	mov    (%eax),%eax
    327e:	c1 e0 05             	shl    $0x5,%eax
    3281:	89 c2                	mov    %eax,%edx
    3283:	8b 45 08             	mov    0x8(%ebp),%eax
    3286:	01 d0                	add    %edx,%eax
    3288:	8d 50 04             	lea    0x4(%eax),%edx
    328b:	83 ec 08             	sub    $0x8,%esp
    328e:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3294:	50                   	push   %eax
    3295:	52                   	push   %edx
    3296:	e8 8c ce ff ff       	call   127 <strcpy>
    329b:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    329e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32a1:	8d 50 01             	lea    0x1(%eax),%edx
    32a4:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32aa:	01 d0                	add    %edx,%eax
    32ac:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    32b2:	83 ec 08             	sub    $0x8,%esp
    32b5:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    32bb:	50                   	push   %eax
    32bc:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    32c2:	50                   	push   %eax
    32c3:	e8 7b d9 ff ff       	call   c43 <Translation>
    32c8:	83 c4 10             	add    $0x10,%esp
    32cb:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    32ce:	8b 45 0c             	mov    0xc(%ebp),%eax
    32d1:	8b 00                	mov    (%eax),%eax
    32d3:	c1 e0 05             	shl    $0x5,%eax
    32d6:	89 c2                	mov    %eax,%edx
    32d8:	8b 45 08             	mov    0x8(%ebp),%eax
    32db:	01 d0                	add    %edx,%eax
    32dd:	dd 45 d8             	fldl   -0x28(%ebp)
    32e0:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    32e3:	8b 45 0c             	mov    0xc(%ebp),%eax
    32e6:	8b 00                	mov    (%eax),%eax
    32e8:	c1 e0 05             	shl    $0x5,%eax
    32eb:	89 c2                	mov    %eax,%edx
    32ed:	8b 45 08             	mov    0x8(%ebp),%eax
    32f0:	01 d0                	add    %edx,%eax
    32f2:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    32f8:	8b 45 0c             	mov    0xc(%ebp),%eax
    32fb:	8b 00                	mov    (%eax),%eax
    32fd:	8d 50 01             	lea    0x1(%eax),%edx
    3300:	8b 45 0c             	mov    0xc(%ebp),%eax
    3303:	89 10                	mov    %edx,(%eax)
        pos++;
    3305:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    330b:	83 c0 01             	add    $0x1,%eax
    330e:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    3314:	e9 ff 00 00 00       	jmp    3418 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    3319:	8b 45 0c             	mov    0xc(%ebp),%eax
    331c:	8b 00                	mov    (%eax),%eax
    331e:	c1 e0 05             	shl    $0x5,%eax
    3321:	89 c2                	mov    %eax,%edx
    3323:	8b 45 08             	mov    0x8(%ebp),%eax
    3326:	01 d0                	add    %edx,%eax
    3328:	8d 50 04             	lea    0x4(%eax),%edx
    332b:	83 ec 08             	sub    $0x8,%esp
    332e:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3334:	50                   	push   %eax
    3335:	52                   	push   %edx
    3336:	e8 ec cd ff ff       	call   127 <strcpy>
    333b:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    333e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3341:	8d 50 01             	lea    0x1(%eax),%edx
    3344:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    334a:	01 d0                	add    %edx,%eax
    334c:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    3352:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3358:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    335b:	eb 04                	jmp    3361 <readVariables+0x1af>
        {
          strend++;
    335d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    3361:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    3367:	8b 45 f0             	mov    -0x10(%ebp),%eax
    336a:	01 d0                	add    %edx,%eax
    336c:	0f b6 00             	movzbl (%eax),%eax
    336f:	84 c0                	test   %al,%al
    3371:	75 ea                	jne    335d <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    3373:	8b 45 0c             	mov    0xc(%ebp),%eax
    3376:	8b 00                	mov    (%eax),%eax
    3378:	c1 e0 05             	shl    $0x5,%eax
    337b:	89 c2                	mov    %eax,%edx
    337d:	8b 45 08             	mov    0x8(%ebp),%eax
    3380:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    3383:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3389:	8b 55 f0             	mov    -0x10(%ebp),%edx
    338c:	29 c2                	sub    %eax,%edx
    338e:	89 d0                	mov    %edx,%eax
    3390:	83 c0 01             	add    $0x1,%eax
    3393:	83 ec 0c             	sub    $0xc,%esp
    3396:	50                   	push   %eax
    3397:	e8 6a d5 ff ff       	call   906 <malloc>
    339c:	83 c4 10             	add    $0x10,%esp
    339f:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    33a2:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    33a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    33ab:	eb 35                	jmp    33e2 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    33ad:	8b 45 0c             	mov    0xc(%ebp),%eax
    33b0:	8b 00                	mov    (%eax),%eax
    33b2:	c1 e0 05             	shl    $0x5,%eax
    33b5:	89 c2                	mov    %eax,%edx
    33b7:	8b 45 08             	mov    0x8(%ebp),%eax
    33ba:	01 d0                	add    %edx,%eax
    33bc:	8b 40 18             	mov    0x18(%eax),%eax
    33bf:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    33c5:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    33c8:	29 d1                	sub    %edx,%ecx
    33ca:	89 ca                	mov    %ecx,%edx
    33cc:	01 c2                	add    %eax,%edx
    33ce:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    33d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33d7:	01 c8                	add    %ecx,%eax
    33d9:	0f b6 00             	movzbl (%eax),%eax
    33dc:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    33de:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    33e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33e5:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    33e8:	7e c3                	jle    33ad <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    33ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    33ed:	8b 00                	mov    (%eax),%eax
    33ef:	c1 e0 05             	shl    $0x5,%eax
    33f2:	89 c2                	mov    %eax,%edx
    33f4:	8b 45 08             	mov    0x8(%ebp),%eax
    33f7:	01 d0                	add    %edx,%eax
    33f9:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    33ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    3402:	8b 00                	mov    (%eax),%eax
    3404:	8d 50 01             	lea    0x1(%eax),%edx
    3407:	8b 45 0c             	mov    0xc(%ebp),%eax
    340a:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    340c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    340f:	83 c0 01             	add    $0x1,%eax
    3412:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    3418:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    341b:	8d 50 ff             	lea    -0x1(%eax),%edx
    341e:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3424:	39 c2                	cmp    %eax,%edx
    3426:	0f 8d e5 fd ff ff    	jge    3211 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    342c:	83 ec 04             	sub    $0x4,%esp
    342f:	68 e8 03 00 00       	push   $0x3e8
    3434:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    343a:	50                   	push   %eax
    343b:	ff 75 e8             	pushl  -0x18(%ebp)
    343e:	e8 2d cf ff ff       	call   370 <read>
    3443:	83 c4 10             	add    $0x10,%esp
    3446:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3449:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    344d:	0f 8f af fd ff ff    	jg     3202 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    3453:	83 ec 0c             	sub    $0xc,%esp
    3456:	ff 75 e8             	pushl  -0x18(%ebp)
    3459:	e8 22 cf ff ff       	call   380 <close>
    345e:	83 c4 10             	add    $0x10,%esp
}
    3461:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3464:	c9                   	leave  
    3465:	c3                   	ret    

00003466 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3466:	55                   	push   %ebp
    3467:	89 e5                	mov    %esp,%ebp
    3469:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    346f:	83 ec 08             	sub    $0x8,%esp
    3472:	6a 02                	push   $0x2
    3474:	68 08 3a 00 00       	push   $0x3a08
    3479:	e8 1a cf ff ff       	call   398 <open>
    347e:	83 c4 10             	add    $0x10,%esp
    3481:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3484:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3488:	78 1e                	js     34a8 <writeVariables+0x42>
  {
    close(fd);
    348a:	83 ec 0c             	sub    $0xc,%esp
    348d:	ff 75 e4             	pushl  -0x1c(%ebp)
    3490:	e8 eb ce ff ff       	call   380 <close>
    3495:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    3498:	83 ec 0c             	sub    $0xc,%esp
    349b:	68 08 3a 00 00       	push   $0x3a08
    34a0:	e8 03 cf ff ff       	call   3a8 <unlink>
    34a5:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    34a8:	83 ec 08             	sub    $0x8,%esp
    34ab:	68 02 02 00 00       	push   $0x202
    34b0:	68 08 3a 00 00       	push   $0x3a08
    34b5:	e8 de ce ff ff       	call   398 <open>
    34ba:	83 c4 10             	add    $0x10,%esp
    34bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    34c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    34c7:	e9 ff 01 00 00       	jmp    36cb <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    34cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34cf:	c1 e0 05             	shl    $0x5,%eax
    34d2:	89 c2                	mov    %eax,%edx
    34d4:	8b 45 08             	mov    0x8(%ebp),%eax
    34d7:	01 d0                	add    %edx,%eax
    34d9:	8b 00                	mov    (%eax),%eax
    34db:	83 f8 01             	cmp    $0x1,%eax
    34de:	0f 85 d3 00 00 00    	jne    35b7 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    34e4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    34eb:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34ee:	8d 50 01             	lea    0x1(%eax),%edx
    34f1:	89 55 e0             	mov    %edx,-0x20(%ebp)
    34f4:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    34fb:	64 
      int k=0;
    34fc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    3503:	eb 2c                	jmp    3531 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    3505:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3508:	8d 50 01             	lea    0x1(%eax),%edx
    350b:	89 55 e0             	mov    %edx,-0x20(%ebp)
    350e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3511:	89 d1                	mov    %edx,%ecx
    3513:	c1 e1 05             	shl    $0x5,%ecx
    3516:	8b 55 08             	mov    0x8(%ebp),%edx
    3519:	01 d1                	add    %edx,%ecx
    351b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    351e:	01 ca                	add    %ecx,%edx
    3520:	83 c2 04             	add    $0x4,%edx
    3523:	0f b6 12             	movzbl (%edx),%edx
    3526:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    352d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    3531:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3534:	c1 e0 05             	shl    $0x5,%eax
    3537:	89 c2                	mov    %eax,%edx
    3539:	8b 45 08             	mov    0x8(%ebp),%eax
    353c:	01 c2                	add    %eax,%edx
    353e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3541:	01 d0                	add    %edx,%eax
    3543:	83 c0 04             	add    $0x4,%eax
    3546:	0f b6 00             	movzbl (%eax),%eax
    3549:	84 c0                	test   %al,%al
    354b:	75 b8                	jne    3505 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    354d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3550:	8d 50 01             	lea    0x1(%eax),%edx
    3553:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3556:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    355d:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    355e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3561:	c1 e0 05             	shl    $0x5,%eax
    3564:	89 c2                	mov    %eax,%edx
    3566:	8b 45 08             	mov    0x8(%ebp),%eax
    3569:	01 d0                	add    %edx,%eax
    356b:	dd 40 18             	fldl   0x18(%eax)
    356e:	8d 45 e0             	lea    -0x20(%ebp),%eax
    3571:	50                   	push   %eax
    3572:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3576:	dd 1c 24             	fstpl  (%esp)
    3579:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    357f:	50                   	push   %eax
    3580:	e8 7d d5 ff ff       	call   b02 <double2str>
    3585:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    3588:	8b 45 e0             	mov    -0x20(%ebp),%eax
    358b:	8d 50 01             	lea    0x1(%eax),%edx
    358e:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3591:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    3598:	00 
      write(fd,buf,pos);
    3599:	8b 45 e0             	mov    -0x20(%ebp),%eax
    359c:	83 ec 04             	sub    $0x4,%esp
    359f:	50                   	push   %eax
    35a0:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    35a6:	50                   	push   %eax
    35a7:	ff 75 e4             	pushl  -0x1c(%ebp)
    35aa:	e8 c9 cd ff ff       	call   378 <write>
    35af:	83 c4 10             	add    $0x10,%esp
    35b2:	e9 10 01 00 00       	jmp    36c7 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    35b7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    35be:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35c1:	8d 50 01             	lea    0x1(%eax),%edx
    35c4:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35c7:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    35ce:	73 
      int k=0;
    35cf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    35d6:	eb 2c                	jmp    3604 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    35d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35db:	8d 50 01             	lea    0x1(%eax),%edx
    35de:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    35e4:	89 d1                	mov    %edx,%ecx
    35e6:	c1 e1 05             	shl    $0x5,%ecx
    35e9:	8b 55 08             	mov    0x8(%ebp),%edx
    35ec:	01 d1                	add    %edx,%ecx
    35ee:	8b 55 e8             	mov    -0x18(%ebp),%edx
    35f1:	01 ca                	add    %ecx,%edx
    35f3:	83 c2 04             	add    $0x4,%edx
    35f6:	0f b6 12             	movzbl (%edx),%edx
    35f9:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3600:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    3604:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3607:	c1 e0 05             	shl    $0x5,%eax
    360a:	89 c2                	mov    %eax,%edx
    360c:	8b 45 08             	mov    0x8(%ebp),%eax
    360f:	01 c2                	add    %eax,%edx
    3611:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3614:	01 d0                	add    %edx,%eax
    3616:	83 c0 04             	add    $0x4,%eax
    3619:	0f b6 00             	movzbl (%eax),%eax
    361c:	84 c0                	test   %al,%al
    361e:	75 b8                	jne    35d8 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3620:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3623:	8d 50 01             	lea    0x1(%eax),%edx
    3626:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3629:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    3630:	3d 
      k=0;
    3631:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    3638:	eb 2c                	jmp    3666 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    363a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    363d:	8d 50 01             	lea    0x1(%eax),%edx
    3640:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3643:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3646:	89 d1                	mov    %edx,%ecx
    3648:	c1 e1 05             	shl    $0x5,%ecx
    364b:	8b 55 08             	mov    0x8(%ebp),%edx
    364e:	01 ca                	add    %ecx,%edx
    3650:	8b 4a 18             	mov    0x18(%edx),%ecx
    3653:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3656:	01 ca                	add    %ecx,%edx
    3658:	0f b6 12             	movzbl (%edx),%edx
    365b:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3662:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    3666:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3669:	c1 e0 05             	shl    $0x5,%eax
    366c:	89 c2                	mov    %eax,%edx
    366e:	8b 45 08             	mov    0x8(%ebp),%eax
    3671:	01 d0                	add    %edx,%eax
    3673:	8b 50 18             	mov    0x18(%eax),%edx
    3676:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3679:	01 d0                	add    %edx,%eax
    367b:	0f b6 00             	movzbl (%eax),%eax
    367e:	84 c0                	test   %al,%al
    3680:	75 b8                	jne    363a <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    3682:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3685:	8d 50 01             	lea    0x1(%eax),%edx
    3688:	89 55 ec             	mov    %edx,-0x14(%ebp)
    368b:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    3692:	00 
      write(fd,buf,pos);
    3693:	83 ec 04             	sub    $0x4,%esp
    3696:	ff 75 ec             	pushl  -0x14(%ebp)
    3699:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    369f:	50                   	push   %eax
    36a0:	ff 75 e4             	pushl  -0x1c(%ebp)
    36a3:	e8 d0 cc ff ff       	call   378 <write>
    36a8:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    36ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36ae:	c1 e0 05             	shl    $0x5,%eax
    36b1:	89 c2                	mov    %eax,%edx
    36b3:	8b 45 08             	mov    0x8(%ebp),%eax
    36b6:	01 d0                	add    %edx,%eax
    36b8:	8b 40 18             	mov    0x18(%eax),%eax
    36bb:	83 ec 0c             	sub    $0xc,%esp
    36be:	50                   	push   %eax
    36bf:	e8 00 d1 ff ff       	call   7c4 <free>
    36c4:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    36c7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    36cb:	8b 45 0c             	mov    0xc(%ebp),%eax
    36ce:	8b 00                	mov    (%eax),%eax
    36d0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    36d3:	0f 8f f3 fd ff ff    	jg     34cc <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    36d9:	8b 45 0c             	mov    0xc(%ebp),%eax
    36dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    36e2:	83 ec 0c             	sub    $0xc,%esp
    36e5:	ff 75 e4             	pushl  -0x1c(%ebp)
    36e8:	e8 93 cc ff ff       	call   380 <close>
    36ed:	83 c4 10             	add    $0x10,%esp
  return;
    36f0:	90                   	nop
    36f1:	c9                   	leave  
    36f2:	c3                   	ret    
