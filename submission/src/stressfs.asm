
_stressfs：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
      14:	c7 45 e6 73 74 72 65 	movl   $0x65727473,-0x1a(%ebp)
      1b:	c7 45 ea 73 73 66 73 	movl   $0x73667373,-0x16(%ebp)
      22:	66 c7 45 ee 30 00    	movw   $0x30,-0x12(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
      28:	83 ec 08             	sub    $0x8,%esp
      2b:	68 48 37 00 00       	push   $0x3748
      30:	6a 01                	push   $0x1
      32:	e8 1e 06 00 00       	call   655 <printf>
      37:	83 c4 10             	add    $0x10,%esp
  memset(data, 'a', sizeof(data));
      3a:	83 ec 04             	sub    $0x4,%esp
      3d:	68 00 02 00 00       	push   $0x200
      42:	6a 61                	push   $0x61
      44:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
      4a:	50                   	push   %eax
      4b:	e8 be 01 00 00       	call   20e <memset>
      50:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
      53:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      5a:	eb 0d                	jmp    69 <main+0x69>
    if(fork() > 0)
      5c:	e8 40 03 00 00       	call   3a1 <fork>
      61:	85 c0                	test   %eax,%eax
      63:	7f 0c                	jg     71 <main+0x71>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
      65:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      69:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
      6d:	7e ed                	jle    5c <main+0x5c>
      6f:	eb 01                	jmp    72 <main+0x72>
    if(fork() > 0)
      break;
      71:	90                   	nop

  printf(1, "write %d\n", i);
      72:	83 ec 04             	sub    $0x4,%esp
      75:	ff 75 f4             	pushl  -0xc(%ebp)
      78:	68 5b 37 00 00       	push   $0x375b
      7d:	6a 01                	push   $0x1
      7f:	e8 d1 05 00 00       	call   655 <printf>
      84:	83 c4 10             	add    $0x10,%esp

  path[8] += i;
      87:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
      8b:	89 c2                	mov    %eax,%edx
      8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      90:	01 d0                	add    %edx,%eax
      92:	88 45 ee             	mov    %al,-0x12(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
      95:	83 ec 08             	sub    $0x8,%esp
      98:	68 02 02 00 00       	push   $0x202
      9d:	8d 45 e6             	lea    -0x1a(%ebp),%eax
      a0:	50                   	push   %eax
      a1:	e8 43 03 00 00       	call   3e9 <open>
      a6:	83 c4 10             	add    $0x10,%esp
      a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 20; i++)
      ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      b3:	eb 1e                	jmp    d3 <main+0xd3>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
      b5:	83 ec 04             	sub    $0x4,%esp
      b8:	68 00 02 00 00       	push   $0x200
      bd:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
      c3:	50                   	push   %eax
      c4:	ff 75 f0             	pushl  -0x10(%ebp)
      c7:	e8 fd 02 00 00       	call   3c9 <write>
      cc:	83 c4 10             	add    $0x10,%esp

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
      cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      d3:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
      d7:	7e dc                	jle    b5 <main+0xb5>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
      d9:	83 ec 0c             	sub    $0xc,%esp
      dc:	ff 75 f0             	pushl  -0x10(%ebp)
      df:	e8 ed 02 00 00       	call   3d1 <close>
      e4:	83 c4 10             	add    $0x10,%esp

  printf(1, "read\n");
      e7:	83 ec 08             	sub    $0x8,%esp
      ea:	68 65 37 00 00       	push   $0x3765
      ef:	6a 01                	push   $0x1
      f1:	e8 5f 05 00 00       	call   655 <printf>
      f6:	83 c4 10             	add    $0x10,%esp

  fd = open(path, O_RDONLY);
      f9:	83 ec 08             	sub    $0x8,%esp
      fc:	6a 00                	push   $0x0
      fe:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     101:	50                   	push   %eax
     102:	e8 e2 02 00 00       	call   3e9 <open>
     107:	83 c4 10             	add    $0x10,%esp
     10a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for (i = 0; i < 20; i++)
     10d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     114:	eb 1e                	jmp    134 <main+0x134>
    read(fd, data, sizeof(data));
     116:	83 ec 04             	sub    $0x4,%esp
     119:	68 00 02 00 00       	push   $0x200
     11e:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
     124:	50                   	push   %eax
     125:	ff 75 f0             	pushl  -0x10(%ebp)
     128:	e8 94 02 00 00       	call   3c1 <read>
     12d:	83 c4 10             	add    $0x10,%esp
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
     130:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     134:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
     138:	7e dc                	jle    116 <main+0x116>
    read(fd, data, sizeof(data));
  close(fd);
     13a:	83 ec 0c             	sub    $0xc,%esp
     13d:	ff 75 f0             	pushl  -0x10(%ebp)
     140:	e8 8c 02 00 00       	call   3d1 <close>
     145:	83 c4 10             	add    $0x10,%esp

  wait();
     148:	e8 64 02 00 00       	call   3b1 <wait>
  
  exit();
     14d:	e8 57 02 00 00       	call   3a9 <exit>

00000152 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     152:	55                   	push   %ebp
     153:	89 e5                	mov    %esp,%ebp
     155:	57                   	push   %edi
     156:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     157:	8b 4d 08             	mov    0x8(%ebp),%ecx
     15a:	8b 55 10             	mov    0x10(%ebp),%edx
     15d:	8b 45 0c             	mov    0xc(%ebp),%eax
     160:	89 cb                	mov    %ecx,%ebx
     162:	89 df                	mov    %ebx,%edi
     164:	89 d1                	mov    %edx,%ecx
     166:	fc                   	cld    
     167:	f3 aa                	rep stos %al,%es:(%edi)
     169:	89 ca                	mov    %ecx,%edx
     16b:	89 fb                	mov    %edi,%ebx
     16d:	89 5d 08             	mov    %ebx,0x8(%ebp)
     170:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     173:	90                   	nop
     174:	5b                   	pop    %ebx
     175:	5f                   	pop    %edi
     176:	5d                   	pop    %ebp
     177:	c3                   	ret    

00000178 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     178:	55                   	push   %ebp
     179:	89 e5                	mov    %esp,%ebp
     17b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     17e:	8b 45 08             	mov    0x8(%ebp),%eax
     181:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     184:	90                   	nop
     185:	8b 45 08             	mov    0x8(%ebp),%eax
     188:	8d 50 01             	lea    0x1(%eax),%edx
     18b:	89 55 08             	mov    %edx,0x8(%ebp)
     18e:	8b 55 0c             	mov    0xc(%ebp),%edx
     191:	8d 4a 01             	lea    0x1(%edx),%ecx
     194:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     197:	0f b6 12             	movzbl (%edx),%edx
     19a:	88 10                	mov    %dl,(%eax)
     19c:	0f b6 00             	movzbl (%eax),%eax
     19f:	84 c0                	test   %al,%al
     1a1:	75 e2                	jne    185 <strcpy+0xd>
    ;
  return os;
     1a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     1a6:	c9                   	leave  
     1a7:	c3                   	ret    

000001a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     1a8:	55                   	push   %ebp
     1a9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     1ab:	eb 08                	jmp    1b5 <strcmp+0xd>
    p++, q++;
     1ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     1b1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     1b5:	8b 45 08             	mov    0x8(%ebp),%eax
     1b8:	0f b6 00             	movzbl (%eax),%eax
     1bb:	84 c0                	test   %al,%al
     1bd:	74 10                	je     1cf <strcmp+0x27>
     1bf:	8b 45 08             	mov    0x8(%ebp),%eax
     1c2:	0f b6 10             	movzbl (%eax),%edx
     1c5:	8b 45 0c             	mov    0xc(%ebp),%eax
     1c8:	0f b6 00             	movzbl (%eax),%eax
     1cb:	38 c2                	cmp    %al,%dl
     1cd:	74 de                	je     1ad <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     1cf:	8b 45 08             	mov    0x8(%ebp),%eax
     1d2:	0f b6 00             	movzbl (%eax),%eax
     1d5:	0f b6 d0             	movzbl %al,%edx
     1d8:	8b 45 0c             	mov    0xc(%ebp),%eax
     1db:	0f b6 00             	movzbl (%eax),%eax
     1de:	0f b6 c0             	movzbl %al,%eax
     1e1:	29 c2                	sub    %eax,%edx
     1e3:	89 d0                	mov    %edx,%eax
}
     1e5:	5d                   	pop    %ebp
     1e6:	c3                   	ret    

000001e7 <strlen>:

uint
strlen(char *s)
{
     1e7:	55                   	push   %ebp
     1e8:	89 e5                	mov    %esp,%ebp
     1ea:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     1ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     1f4:	eb 04                	jmp    1fa <strlen+0x13>
     1f6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     1fa:	8b 55 fc             	mov    -0x4(%ebp),%edx
     1fd:	8b 45 08             	mov    0x8(%ebp),%eax
     200:	01 d0                	add    %edx,%eax
     202:	0f b6 00             	movzbl (%eax),%eax
     205:	84 c0                	test   %al,%al
     207:	75 ed                	jne    1f6 <strlen+0xf>
    ;
  return n;
     209:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     20c:	c9                   	leave  
     20d:	c3                   	ret    

0000020e <memset>:

void*
memset(void *dst, int c, uint n)
{
     20e:	55                   	push   %ebp
     20f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     211:	8b 45 10             	mov    0x10(%ebp),%eax
     214:	50                   	push   %eax
     215:	ff 75 0c             	pushl  0xc(%ebp)
     218:	ff 75 08             	pushl  0x8(%ebp)
     21b:	e8 32 ff ff ff       	call   152 <stosb>
     220:	83 c4 0c             	add    $0xc,%esp
  return dst;
     223:	8b 45 08             	mov    0x8(%ebp),%eax
}
     226:	c9                   	leave  
     227:	c3                   	ret    

00000228 <strchr>:

char*
strchr(const char *s, char c)
{
     228:	55                   	push   %ebp
     229:	89 e5                	mov    %esp,%ebp
     22b:	83 ec 04             	sub    $0x4,%esp
     22e:	8b 45 0c             	mov    0xc(%ebp),%eax
     231:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     234:	eb 14                	jmp    24a <strchr+0x22>
    if(*s == c)
     236:	8b 45 08             	mov    0x8(%ebp),%eax
     239:	0f b6 00             	movzbl (%eax),%eax
     23c:	3a 45 fc             	cmp    -0x4(%ebp),%al
     23f:	75 05                	jne    246 <strchr+0x1e>
      return (char*)s;
     241:	8b 45 08             	mov    0x8(%ebp),%eax
     244:	eb 13                	jmp    259 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     246:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     24a:	8b 45 08             	mov    0x8(%ebp),%eax
     24d:	0f b6 00             	movzbl (%eax),%eax
     250:	84 c0                	test   %al,%al
     252:	75 e2                	jne    236 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     254:	b8 00 00 00 00       	mov    $0x0,%eax
}
     259:	c9                   	leave  
     25a:	c3                   	ret    

0000025b <gets>:

char*
gets(char *buf, int max)
{
     25b:	55                   	push   %ebp
     25c:	89 e5                	mov    %esp,%ebp
     25e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     261:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     268:	eb 42                	jmp    2ac <gets+0x51>
    cc = read(0, &c, 1);
     26a:	83 ec 04             	sub    $0x4,%esp
     26d:	6a 01                	push   $0x1
     26f:	8d 45 ef             	lea    -0x11(%ebp),%eax
     272:	50                   	push   %eax
     273:	6a 00                	push   $0x0
     275:	e8 47 01 00 00       	call   3c1 <read>
     27a:	83 c4 10             	add    $0x10,%esp
     27d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     280:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     284:	7e 33                	jle    2b9 <gets+0x5e>
      break;
    buf[i++] = c;
     286:	8b 45 f4             	mov    -0xc(%ebp),%eax
     289:	8d 50 01             	lea    0x1(%eax),%edx
     28c:	89 55 f4             	mov    %edx,-0xc(%ebp)
     28f:	89 c2                	mov    %eax,%edx
     291:	8b 45 08             	mov    0x8(%ebp),%eax
     294:	01 c2                	add    %eax,%edx
     296:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     29a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     29c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     2a0:	3c 0a                	cmp    $0xa,%al
     2a2:	74 16                	je     2ba <gets+0x5f>
     2a4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     2a8:	3c 0d                	cmp    $0xd,%al
     2aa:	74 0e                	je     2ba <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
     2af:	83 c0 01             	add    $0x1,%eax
     2b2:	3b 45 0c             	cmp    0xc(%ebp),%eax
     2b5:	7c b3                	jl     26a <gets+0xf>
     2b7:	eb 01                	jmp    2ba <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     2b9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     2ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
     2bd:	8b 45 08             	mov    0x8(%ebp),%eax
     2c0:	01 d0                	add    %edx,%eax
     2c2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     2c5:	8b 45 08             	mov    0x8(%ebp),%eax
}
     2c8:	c9                   	leave  
     2c9:	c3                   	ret    

000002ca <stat>:

int
stat(char *n, struct stat *st)
{
     2ca:	55                   	push   %ebp
     2cb:	89 e5                	mov    %esp,%ebp
     2cd:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2d0:	83 ec 08             	sub    $0x8,%esp
     2d3:	6a 00                	push   $0x0
     2d5:	ff 75 08             	pushl  0x8(%ebp)
     2d8:	e8 0c 01 00 00       	call   3e9 <open>
     2dd:	83 c4 10             	add    $0x10,%esp
     2e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     2e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     2e7:	79 07                	jns    2f0 <stat+0x26>
    return -1;
     2e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     2ee:	eb 25                	jmp    315 <stat+0x4b>
  r = fstat(fd, st);
     2f0:	83 ec 08             	sub    $0x8,%esp
     2f3:	ff 75 0c             	pushl  0xc(%ebp)
     2f6:	ff 75 f4             	pushl  -0xc(%ebp)
     2f9:	e8 03 01 00 00       	call   401 <fstat>
     2fe:	83 c4 10             	add    $0x10,%esp
     301:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     304:	83 ec 0c             	sub    $0xc,%esp
     307:	ff 75 f4             	pushl  -0xc(%ebp)
     30a:	e8 c2 00 00 00       	call   3d1 <close>
     30f:	83 c4 10             	add    $0x10,%esp
  return r;
     312:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     315:	c9                   	leave  
     316:	c3                   	ret    

00000317 <atoi>:

int
atoi(const char *s)
{
     317:	55                   	push   %ebp
     318:	89 e5                	mov    %esp,%ebp
     31a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     31d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     324:	eb 25                	jmp    34b <atoi+0x34>
    n = n*10 + *s++ - '0';
     326:	8b 55 fc             	mov    -0x4(%ebp),%edx
     329:	89 d0                	mov    %edx,%eax
     32b:	c1 e0 02             	shl    $0x2,%eax
     32e:	01 d0                	add    %edx,%eax
     330:	01 c0                	add    %eax,%eax
     332:	89 c1                	mov    %eax,%ecx
     334:	8b 45 08             	mov    0x8(%ebp),%eax
     337:	8d 50 01             	lea    0x1(%eax),%edx
     33a:	89 55 08             	mov    %edx,0x8(%ebp)
     33d:	0f b6 00             	movzbl (%eax),%eax
     340:	0f be c0             	movsbl %al,%eax
     343:	01 c8                	add    %ecx,%eax
     345:	83 e8 30             	sub    $0x30,%eax
     348:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     34b:	8b 45 08             	mov    0x8(%ebp),%eax
     34e:	0f b6 00             	movzbl (%eax),%eax
     351:	3c 2f                	cmp    $0x2f,%al
     353:	7e 0a                	jle    35f <atoi+0x48>
     355:	8b 45 08             	mov    0x8(%ebp),%eax
     358:	0f b6 00             	movzbl (%eax),%eax
     35b:	3c 39                	cmp    $0x39,%al
     35d:	7e c7                	jle    326 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     35f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     362:	c9                   	leave  
     363:	c3                   	ret    

00000364 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     364:	55                   	push   %ebp
     365:	89 e5                	mov    %esp,%ebp
     367:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     36a:	8b 45 08             	mov    0x8(%ebp),%eax
     36d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     370:	8b 45 0c             	mov    0xc(%ebp),%eax
     373:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     376:	eb 17                	jmp    38f <memmove+0x2b>
    *dst++ = *src++;
     378:	8b 45 fc             	mov    -0x4(%ebp),%eax
     37b:	8d 50 01             	lea    0x1(%eax),%edx
     37e:	89 55 fc             	mov    %edx,-0x4(%ebp)
     381:	8b 55 f8             	mov    -0x8(%ebp),%edx
     384:	8d 4a 01             	lea    0x1(%edx),%ecx
     387:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     38a:	0f b6 12             	movzbl (%edx),%edx
     38d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     38f:	8b 45 10             	mov    0x10(%ebp),%eax
     392:	8d 50 ff             	lea    -0x1(%eax),%edx
     395:	89 55 10             	mov    %edx,0x10(%ebp)
     398:	85 c0                	test   %eax,%eax
     39a:	7f dc                	jg     378 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     39c:	8b 45 08             	mov    0x8(%ebp),%eax
}
     39f:	c9                   	leave  
     3a0:	c3                   	ret    

000003a1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     3a1:	b8 01 00 00 00       	mov    $0x1,%eax
     3a6:	cd 40                	int    $0x40
     3a8:	c3                   	ret    

000003a9 <exit>:
SYSCALL(exit)
     3a9:	b8 02 00 00 00       	mov    $0x2,%eax
     3ae:	cd 40                	int    $0x40
     3b0:	c3                   	ret    

000003b1 <wait>:
SYSCALL(wait)
     3b1:	b8 03 00 00 00       	mov    $0x3,%eax
     3b6:	cd 40                	int    $0x40
     3b8:	c3                   	ret    

000003b9 <pipe>:
SYSCALL(pipe)
     3b9:	b8 04 00 00 00       	mov    $0x4,%eax
     3be:	cd 40                	int    $0x40
     3c0:	c3                   	ret    

000003c1 <read>:
SYSCALL(read)
     3c1:	b8 05 00 00 00       	mov    $0x5,%eax
     3c6:	cd 40                	int    $0x40
     3c8:	c3                   	ret    

000003c9 <write>:
SYSCALL(write)
     3c9:	b8 10 00 00 00       	mov    $0x10,%eax
     3ce:	cd 40                	int    $0x40
     3d0:	c3                   	ret    

000003d1 <close>:
SYSCALL(close)
     3d1:	b8 15 00 00 00       	mov    $0x15,%eax
     3d6:	cd 40                	int    $0x40
     3d8:	c3                   	ret    

000003d9 <kill>:
SYSCALL(kill)
     3d9:	b8 06 00 00 00       	mov    $0x6,%eax
     3de:	cd 40                	int    $0x40
     3e0:	c3                   	ret    

000003e1 <exec>:
SYSCALL(exec)
     3e1:	b8 07 00 00 00       	mov    $0x7,%eax
     3e6:	cd 40                	int    $0x40
     3e8:	c3                   	ret    

000003e9 <open>:
SYSCALL(open)
     3e9:	b8 0f 00 00 00       	mov    $0xf,%eax
     3ee:	cd 40                	int    $0x40
     3f0:	c3                   	ret    

000003f1 <mknod>:
SYSCALL(mknod)
     3f1:	b8 11 00 00 00       	mov    $0x11,%eax
     3f6:	cd 40                	int    $0x40
     3f8:	c3                   	ret    

000003f9 <unlink>:
SYSCALL(unlink)
     3f9:	b8 12 00 00 00       	mov    $0x12,%eax
     3fe:	cd 40                	int    $0x40
     400:	c3                   	ret    

00000401 <fstat>:
SYSCALL(fstat)
     401:	b8 08 00 00 00       	mov    $0x8,%eax
     406:	cd 40                	int    $0x40
     408:	c3                   	ret    

00000409 <link>:
SYSCALL(link)
     409:	b8 13 00 00 00       	mov    $0x13,%eax
     40e:	cd 40                	int    $0x40
     410:	c3                   	ret    

00000411 <mkdir>:
SYSCALL(mkdir)
     411:	b8 14 00 00 00       	mov    $0x14,%eax
     416:	cd 40                	int    $0x40
     418:	c3                   	ret    

00000419 <chdir>:
SYSCALL(chdir)
     419:	b8 09 00 00 00       	mov    $0x9,%eax
     41e:	cd 40                	int    $0x40
     420:	c3                   	ret    

00000421 <dup>:
SYSCALL(dup)
     421:	b8 0a 00 00 00       	mov    $0xa,%eax
     426:	cd 40                	int    $0x40
     428:	c3                   	ret    

00000429 <getpid>:
SYSCALL(getpid)
     429:	b8 0b 00 00 00       	mov    $0xb,%eax
     42e:	cd 40                	int    $0x40
     430:	c3                   	ret    

00000431 <sbrk>:
SYSCALL(sbrk)
     431:	b8 0c 00 00 00       	mov    $0xc,%eax
     436:	cd 40                	int    $0x40
     438:	c3                   	ret    

00000439 <sleep>:
SYSCALL(sleep)
     439:	b8 0d 00 00 00       	mov    $0xd,%eax
     43e:	cd 40                	int    $0x40
     440:	c3                   	ret    

00000441 <uptime>:
SYSCALL(uptime)
     441:	b8 0e 00 00 00       	mov    $0xe,%eax
     446:	cd 40                	int    $0x40
     448:	c3                   	ret    

00000449 <colorwrite>:

//new here
SYSCALL(colorwrite)
     449:	b8 16 00 00 00       	mov    $0x16,%eax
     44e:	cd 40                	int    $0x40
     450:	c3                   	ret    

00000451 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     451:	55                   	push   %ebp
     452:	89 e5                	mov    %esp,%ebp
     454:	83 ec 18             	sub    $0x18,%esp
     457:	8b 45 0c             	mov    0xc(%ebp),%eax
     45a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     45d:	83 ec 04             	sub    $0x4,%esp
     460:	6a 01                	push   $0x1
     462:	8d 45 f4             	lea    -0xc(%ebp),%eax
     465:	50                   	push   %eax
     466:	ff 75 08             	pushl  0x8(%ebp)
     469:	e8 5b ff ff ff       	call   3c9 <write>
     46e:	83 c4 10             	add    $0x10,%esp
}
     471:	90                   	nop
     472:	c9                   	leave  
     473:	c3                   	ret    

00000474 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     474:	55                   	push   %ebp
     475:	89 e5                	mov    %esp,%ebp
     477:	53                   	push   %ebx
     478:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     47b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     482:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     486:	74 17                	je     49f <printint+0x2b>
     488:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     48c:	79 11                	jns    49f <printint+0x2b>
    neg = 1;
     48e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     495:	8b 45 0c             	mov    0xc(%ebp),%eax
     498:	f7 d8                	neg    %eax
     49a:	89 45 ec             	mov    %eax,-0x14(%ebp)
     49d:	eb 06                	jmp    4a5 <printint+0x31>
  } else {
    x = xx;
     49f:	8b 45 0c             	mov    0xc(%ebp),%eax
     4a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     4a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     4ac:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     4af:	8d 41 01             	lea    0x1(%ecx),%eax
     4b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
     4b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     4b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
     4bb:	ba 00 00 00 00       	mov    $0x0,%edx
     4c0:	f7 f3                	div    %ebx
     4c2:	89 d0                	mov    %edx,%eax
     4c4:	0f b6 80 80 43 00 00 	movzbl 0x4380(%eax),%eax
     4cb:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     4cf:	8b 5d 10             	mov    0x10(%ebp),%ebx
     4d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     4d5:	ba 00 00 00 00       	mov    $0x0,%edx
     4da:	f7 f3                	div    %ebx
     4dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
     4df:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     4e3:	75 c7                	jne    4ac <printint+0x38>
  if(neg)
     4e5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     4e9:	74 2d                	je     518 <printint+0xa4>
    buf[i++] = '-';
     4eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4ee:	8d 50 01             	lea    0x1(%eax),%edx
     4f1:	89 55 f4             	mov    %edx,-0xc(%ebp)
     4f4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     4f9:	eb 1d                	jmp    518 <printint+0xa4>
    putc(fd, buf[i]);
     4fb:	8d 55 dc             	lea    -0x24(%ebp),%edx
     4fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
     501:	01 d0                	add    %edx,%eax
     503:	0f b6 00             	movzbl (%eax),%eax
     506:	0f be c0             	movsbl %al,%eax
     509:	83 ec 08             	sub    $0x8,%esp
     50c:	50                   	push   %eax
     50d:	ff 75 08             	pushl  0x8(%ebp)
     510:	e8 3c ff ff ff       	call   451 <putc>
     515:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     518:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     51c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     520:	79 d9                	jns    4fb <printint+0x87>
    putc(fd, buf[i]);
}
     522:	90                   	nop
     523:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     526:	c9                   	leave  
     527:	c3                   	ret    

00000528 <getInteger>:

static int getInteger(double num)
{
     528:	55                   	push   %ebp
     529:	89 e5                	mov    %esp,%ebp
     52b:	83 ec 18             	sub    $0x18,%esp
     52e:	8b 45 08             	mov    0x8(%ebp),%eax
     531:	89 45 e8             	mov    %eax,-0x18(%ebp)
     534:	8b 45 0c             	mov    0xc(%ebp),%eax
     537:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     53a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     541:	eb 0e                	jmp    551 <getInteger+0x29>
  {
    num -= 1;
     543:	dd 45 e8             	fldl   -0x18(%ebp)
     546:	d9 e8                	fld1   
     548:	de e9                	fsubrp %st,%st(1)
     54a:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     54d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     551:	dd 45 e8             	fldl   -0x18(%ebp)
     554:	d9 e8                	fld1   
     556:	d9 c9                	fxch   %st(1)
     558:	df e9                	fucomip %st(1),%st
     55a:	dd d8                	fstp   %st(0)
     55c:	77 e5                	ja     543 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     55e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     561:	c9                   	leave  
     562:	c3                   	ret    

00000563 <printdbl>:

void printdbl(int fd, double num)
{
     563:	55                   	push   %ebp
     564:	89 e5                	mov    %esp,%ebp
     566:	83 ec 28             	sub    $0x28,%esp
     569:	8b 45 0c             	mov    0xc(%ebp),%eax
     56c:	89 45 e0             	mov    %eax,-0x20(%ebp)
     56f:	8b 45 10             	mov    0x10(%ebp),%eax
     572:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     575:	d9 ee                	fldz   
     577:	dd 45 e0             	fldl   -0x20(%ebp)
     57a:	d9 c9                	fxch   %st(1)
     57c:	df e9                	fucomip %st(1),%st
     57e:	dd d8                	fstp   %st(0)
     580:	76 18                	jbe    59a <printdbl+0x37>
  {
    putc(fd,'-');
     582:	83 ec 08             	sub    $0x8,%esp
     585:	6a 2d                	push   $0x2d
     587:	ff 75 08             	pushl  0x8(%ebp)
     58a:	e8 c2 fe ff ff       	call   451 <putc>
     58f:	83 c4 10             	add    $0x10,%esp
    num = -num;
     592:	dd 45 e0             	fldl   -0x20(%ebp)
     595:	d9 e0                	fchs   
     597:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     59a:	83 ec 08             	sub    $0x8,%esp
     59d:	ff 75 e4             	pushl  -0x1c(%ebp)
     5a0:	ff 75 e0             	pushl  -0x20(%ebp)
     5a3:	e8 80 ff ff ff       	call   528 <getInteger>
     5a8:	83 c4 10             	add    $0x10,%esp
     5ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     5ae:	6a 01                	push   $0x1
     5b0:	6a 0a                	push   $0xa
     5b2:	ff 75 f0             	pushl  -0x10(%ebp)
     5b5:	ff 75 08             	pushl  0x8(%ebp)
     5b8:	e8 b7 fe ff ff       	call   474 <printint>
     5bd:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     5c0:	db 45 f0             	fildl  -0x10(%ebp)
     5c3:	dd 45 e0             	fldl   -0x20(%ebp)
     5c6:	de e1                	fsubp  %st,%st(1)
     5c8:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     5cb:	dd 45 e0             	fldl   -0x20(%ebp)
     5ce:	dd 05 78 37 00 00    	fldl   0x3778
     5d4:	d9 c9                	fxch   %st(1)
     5d6:	df e9                	fucomip %st(1),%st
     5d8:	dd d8                	fstp   %st(0)
     5da:	76 10                	jbe    5ec <printdbl+0x89>
    putc(fd,'.');
     5dc:	83 ec 08             	sub    $0x8,%esp
     5df:	6a 2e                	push   $0x2e
     5e1:	ff 75 08             	pushl  0x8(%ebp)
     5e4:	e8 68 fe ff ff       	call   451 <putc>
     5e9:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     5ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     5f3:	eb 49                	jmp    63e <printdbl+0xdb>
  {
    num = num*10;
     5f5:	dd 45 e0             	fldl   -0x20(%ebp)
     5f8:	dd 05 80 37 00 00    	fldl   0x3780
     5fe:	de c9                	fmulp  %st,%st(1)
     600:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     603:	83 ec 08             	sub    $0x8,%esp
     606:	ff 75 e4             	pushl  -0x1c(%ebp)
     609:	ff 75 e0             	pushl  -0x20(%ebp)
     60c:	e8 17 ff ff ff       	call   528 <getInteger>
     611:	83 c4 10             	add    $0x10,%esp
     614:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     617:	6a 01                	push   $0x1
     619:	6a 0a                	push   $0xa
     61b:	ff 75 f0             	pushl  -0x10(%ebp)
     61e:	ff 75 08             	pushl  0x8(%ebp)
     621:	e8 4e fe ff ff       	call   474 <printint>
     626:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     629:	db 45 f0             	fildl  -0x10(%ebp)
     62c:	dd 45 e0             	fldl   -0x20(%ebp)
     62f:	de e1                	fsubp  %st,%st(1)
     631:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     634:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     638:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     63c:	7f 13                	jg     651 <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     63e:	dd 45 e0             	fldl   -0x20(%ebp)
     641:	dd 05 78 37 00 00    	fldl   0x3778
     647:	d9 c9                	fxch   %st(1)
     649:	df e9                	fucomip %st(1),%st
     64b:	dd d8                	fstp   %st(0)
     64d:	77 a6                	ja     5f5 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     64f:	eb 01                	jmp    652 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     651:	90                   	nop
    }
  }
}
     652:	90                   	nop
     653:	c9                   	leave  
     654:	c3                   	ret    

00000655 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     655:	55                   	push   %ebp
     656:	89 e5                	mov    %esp,%ebp
     658:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     65b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     662:	8d 45 0c             	lea    0xc(%ebp),%eax
     665:	83 c0 04             	add    $0x4,%eax
     668:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     66b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     672:	e9 88 01 00 00       	jmp    7ff <printf+0x1aa>
    c = fmt[i] & 0xff;
     677:	8b 55 0c             	mov    0xc(%ebp),%edx
     67a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     67d:	01 d0                	add    %edx,%eax
     67f:	0f b6 00             	movzbl (%eax),%eax
     682:	0f be c0             	movsbl %al,%eax
     685:	25 ff 00 00 00       	and    $0xff,%eax
     68a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     68d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     691:	75 2c                	jne    6bf <printf+0x6a>
      if(c == '%'){
     693:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     697:	75 0c                	jne    6a5 <printf+0x50>
        state = '%';
     699:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     6a0:	e9 56 01 00 00       	jmp    7fb <printf+0x1a6>
      } else {
        putc(fd, c);
     6a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6a8:	0f be c0             	movsbl %al,%eax
     6ab:	83 ec 08             	sub    $0x8,%esp
     6ae:	50                   	push   %eax
     6af:	ff 75 08             	pushl  0x8(%ebp)
     6b2:	e8 9a fd ff ff       	call   451 <putc>
     6b7:	83 c4 10             	add    $0x10,%esp
     6ba:	e9 3c 01 00 00       	jmp    7fb <printf+0x1a6>
      }
    } else if(state == '%'){
     6bf:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     6c3:	0f 85 32 01 00 00    	jne    7fb <printf+0x1a6>
      if(c == 'd'){
     6c9:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     6cd:	75 1e                	jne    6ed <printf+0x98>
        printint(fd, *ap, 10, 1);
     6cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6d2:	8b 00                	mov    (%eax),%eax
     6d4:	6a 01                	push   $0x1
     6d6:	6a 0a                	push   $0xa
     6d8:	50                   	push   %eax
     6d9:	ff 75 08             	pushl  0x8(%ebp)
     6dc:	e8 93 fd ff ff       	call   474 <printint>
     6e1:	83 c4 10             	add    $0x10,%esp
        ap++;
     6e4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     6e8:	e9 07 01 00 00       	jmp    7f4 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     6ed:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     6f1:	74 06                	je     6f9 <printf+0xa4>
     6f3:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     6f7:	75 1e                	jne    717 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     6f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6fc:	8b 00                	mov    (%eax),%eax
     6fe:	6a 00                	push   $0x0
     700:	6a 10                	push   $0x10
     702:	50                   	push   %eax
     703:	ff 75 08             	pushl  0x8(%ebp)
     706:	e8 69 fd ff ff       	call   474 <printint>
     70b:	83 c4 10             	add    $0x10,%esp
        ap++;
     70e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     712:	e9 dd 00 00 00       	jmp    7f4 <printf+0x19f>
      } else if(c == 's'){
     717:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     71b:	75 46                	jne    763 <printf+0x10e>
        s = (char*)*ap;
     71d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     720:	8b 00                	mov    (%eax),%eax
     722:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     725:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     729:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     72d:	75 25                	jne    754 <printf+0xff>
          s = "(null)";
     72f:	c7 45 f4 70 37 00 00 	movl   $0x3770,-0xc(%ebp)
        while(*s != 0){
     736:	eb 1c                	jmp    754 <printf+0xff>
          putc(fd, *s);
     738:	8b 45 f4             	mov    -0xc(%ebp),%eax
     73b:	0f b6 00             	movzbl (%eax),%eax
     73e:	0f be c0             	movsbl %al,%eax
     741:	83 ec 08             	sub    $0x8,%esp
     744:	50                   	push   %eax
     745:	ff 75 08             	pushl  0x8(%ebp)
     748:	e8 04 fd ff ff       	call   451 <putc>
     74d:	83 c4 10             	add    $0x10,%esp
          s++;
     750:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     754:	8b 45 f4             	mov    -0xc(%ebp),%eax
     757:	0f b6 00             	movzbl (%eax),%eax
     75a:	84 c0                	test   %al,%al
     75c:	75 da                	jne    738 <printf+0xe3>
     75e:	e9 91 00 00 00       	jmp    7f4 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     763:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     767:	75 1d                	jne    786 <printf+0x131>
        putc(fd, *ap);
     769:	8b 45 e8             	mov    -0x18(%ebp),%eax
     76c:	8b 00                	mov    (%eax),%eax
     76e:	0f be c0             	movsbl %al,%eax
     771:	83 ec 08             	sub    $0x8,%esp
     774:	50                   	push   %eax
     775:	ff 75 08             	pushl  0x8(%ebp)
     778:	e8 d4 fc ff ff       	call   451 <putc>
     77d:	83 c4 10             	add    $0x10,%esp
        ap++;
     780:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     784:	eb 6e                	jmp    7f4 <printf+0x19f>
      } else if(c == '%'){
     786:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     78a:	75 17                	jne    7a3 <printf+0x14e>
        putc(fd, c);
     78c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     78f:	0f be c0             	movsbl %al,%eax
     792:	83 ec 08             	sub    $0x8,%esp
     795:	50                   	push   %eax
     796:	ff 75 08             	pushl  0x8(%ebp)
     799:	e8 b3 fc ff ff       	call   451 <putc>
     79e:	83 c4 10             	add    $0x10,%esp
     7a1:	eb 51                	jmp    7f4 <printf+0x19f>
      } else if(c == 'f'){ //for double
     7a3:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     7a7:	75 26                	jne    7cf <printf+0x17a>
        double *dap = (double*)ap;
     7a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     7ac:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     7af:	8b 45 e0             	mov    -0x20(%ebp),%eax
     7b2:	dd 00                	fldl   (%eax)
     7b4:	83 ec 04             	sub    $0x4,%esp
     7b7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     7bb:	dd 1c 24             	fstpl  (%esp)
     7be:	ff 75 08             	pushl  0x8(%ebp)
     7c1:	e8 9d fd ff ff       	call   563 <printdbl>
     7c6:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     7c9:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     7cd:	eb 25                	jmp    7f4 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     7cf:	83 ec 08             	sub    $0x8,%esp
     7d2:	6a 25                	push   $0x25
     7d4:	ff 75 08             	pushl  0x8(%ebp)
     7d7:	e8 75 fc ff ff       	call   451 <putc>
     7dc:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     7df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7e2:	0f be c0             	movsbl %al,%eax
     7e5:	83 ec 08             	sub    $0x8,%esp
     7e8:	50                   	push   %eax
     7e9:	ff 75 08             	pushl  0x8(%ebp)
     7ec:	e8 60 fc ff ff       	call   451 <putc>
     7f1:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     7f4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     7fb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     7ff:	8b 55 0c             	mov    0xc(%ebp),%edx
     802:	8b 45 f0             	mov    -0x10(%ebp),%eax
     805:	01 d0                	add    %edx,%eax
     807:	0f b6 00             	movzbl (%eax),%eax
     80a:	84 c0                	test   %al,%al
     80c:	0f 85 65 fe ff ff    	jne    677 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     812:	90                   	nop
     813:	c9                   	leave  
     814:	c3                   	ret    

00000815 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     815:	55                   	push   %ebp
     816:	89 e5                	mov    %esp,%ebp
     818:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     81b:	8b 45 08             	mov    0x8(%ebp),%eax
     81e:	83 e8 08             	sub    $0x8,%eax
     821:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     824:	a1 c8 44 00 00       	mov    0x44c8,%eax
     829:	89 45 fc             	mov    %eax,-0x4(%ebp)
     82c:	eb 24                	jmp    852 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     82e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     831:	8b 00                	mov    (%eax),%eax
     833:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     836:	77 12                	ja     84a <free+0x35>
     838:	8b 45 f8             	mov    -0x8(%ebp),%eax
     83b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     83e:	77 24                	ja     864 <free+0x4f>
     840:	8b 45 fc             	mov    -0x4(%ebp),%eax
     843:	8b 00                	mov    (%eax),%eax
     845:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     848:	77 1a                	ja     864 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     84a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     84d:	8b 00                	mov    (%eax),%eax
     84f:	89 45 fc             	mov    %eax,-0x4(%ebp)
     852:	8b 45 f8             	mov    -0x8(%ebp),%eax
     855:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     858:	76 d4                	jbe    82e <free+0x19>
     85a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     85d:	8b 00                	mov    (%eax),%eax
     85f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     862:	76 ca                	jbe    82e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     864:	8b 45 f8             	mov    -0x8(%ebp),%eax
     867:	8b 40 04             	mov    0x4(%eax),%eax
     86a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     871:	8b 45 f8             	mov    -0x8(%ebp),%eax
     874:	01 c2                	add    %eax,%edx
     876:	8b 45 fc             	mov    -0x4(%ebp),%eax
     879:	8b 00                	mov    (%eax),%eax
     87b:	39 c2                	cmp    %eax,%edx
     87d:	75 24                	jne    8a3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     87f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     882:	8b 50 04             	mov    0x4(%eax),%edx
     885:	8b 45 fc             	mov    -0x4(%ebp),%eax
     888:	8b 00                	mov    (%eax),%eax
     88a:	8b 40 04             	mov    0x4(%eax),%eax
     88d:	01 c2                	add    %eax,%edx
     88f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     892:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     895:	8b 45 fc             	mov    -0x4(%ebp),%eax
     898:	8b 00                	mov    (%eax),%eax
     89a:	8b 10                	mov    (%eax),%edx
     89c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     89f:	89 10                	mov    %edx,(%eax)
     8a1:	eb 0a                	jmp    8ad <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     8a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8a6:	8b 10                	mov    (%eax),%edx
     8a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
     8ab:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     8ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8b0:	8b 40 04             	mov    0x4(%eax),%eax
     8b3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     8ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8bd:	01 d0                	add    %edx,%eax
     8bf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     8c2:	75 20                	jne    8e4 <free+0xcf>
    p->s.size += bp->s.size;
     8c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8c7:	8b 50 04             	mov    0x4(%eax),%edx
     8ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
     8cd:	8b 40 04             	mov    0x4(%eax),%eax
     8d0:	01 c2                	add    %eax,%edx
     8d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8d5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     8d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
     8db:	8b 10                	mov    (%eax),%edx
     8dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8e0:	89 10                	mov    %edx,(%eax)
     8e2:	eb 08                	jmp    8ec <free+0xd7>
  } else
    p->s.ptr = bp;
     8e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8e7:	8b 55 f8             	mov    -0x8(%ebp),%edx
     8ea:	89 10                	mov    %edx,(%eax)
  freep = p;
     8ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8ef:	a3 c8 44 00 00       	mov    %eax,0x44c8
}
     8f4:	90                   	nop
     8f5:	c9                   	leave  
     8f6:	c3                   	ret    

000008f7 <morecore>:

static Header*
morecore(uint nu)
{
     8f7:	55                   	push   %ebp
     8f8:	89 e5                	mov    %esp,%ebp
     8fa:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     8fd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     904:	77 07                	ja     90d <morecore+0x16>
    nu = 4096;
     906:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     90d:	8b 45 08             	mov    0x8(%ebp),%eax
     910:	c1 e0 03             	shl    $0x3,%eax
     913:	83 ec 0c             	sub    $0xc,%esp
     916:	50                   	push   %eax
     917:	e8 15 fb ff ff       	call   431 <sbrk>
     91c:	83 c4 10             	add    $0x10,%esp
     91f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     922:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     926:	75 07                	jne    92f <morecore+0x38>
    return 0;
     928:	b8 00 00 00 00       	mov    $0x0,%eax
     92d:	eb 26                	jmp    955 <morecore+0x5e>
  hp = (Header*)p;
     92f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     932:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     935:	8b 45 f0             	mov    -0x10(%ebp),%eax
     938:	8b 55 08             	mov    0x8(%ebp),%edx
     93b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     93e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     941:	83 c0 08             	add    $0x8,%eax
     944:	83 ec 0c             	sub    $0xc,%esp
     947:	50                   	push   %eax
     948:	e8 c8 fe ff ff       	call   815 <free>
     94d:	83 c4 10             	add    $0x10,%esp
  return freep;
     950:	a1 c8 44 00 00       	mov    0x44c8,%eax
}
     955:	c9                   	leave  
     956:	c3                   	ret    

00000957 <malloc>:

void*
malloc(uint nbytes)
{
     957:	55                   	push   %ebp
     958:	89 e5                	mov    %esp,%ebp
     95a:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     95d:	8b 45 08             	mov    0x8(%ebp),%eax
     960:	83 c0 07             	add    $0x7,%eax
     963:	c1 e8 03             	shr    $0x3,%eax
     966:	83 c0 01             	add    $0x1,%eax
     969:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     96c:	a1 c8 44 00 00       	mov    0x44c8,%eax
     971:	89 45 f0             	mov    %eax,-0x10(%ebp)
     974:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     978:	75 23                	jne    99d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     97a:	c7 45 f0 c0 44 00 00 	movl   $0x44c0,-0x10(%ebp)
     981:	8b 45 f0             	mov    -0x10(%ebp),%eax
     984:	a3 c8 44 00 00       	mov    %eax,0x44c8
     989:	a1 c8 44 00 00       	mov    0x44c8,%eax
     98e:	a3 c0 44 00 00       	mov    %eax,0x44c0
    base.s.size = 0;
     993:	c7 05 c4 44 00 00 00 	movl   $0x0,0x44c4
     99a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     99d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9a0:	8b 00                	mov    (%eax),%eax
     9a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     9a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9a8:	8b 40 04             	mov    0x4(%eax),%eax
     9ab:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     9ae:	72 4d                	jb     9fd <malloc+0xa6>
      if(p->s.size == nunits)
     9b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9b3:	8b 40 04             	mov    0x4(%eax),%eax
     9b6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     9b9:	75 0c                	jne    9c7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     9bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9be:	8b 10                	mov    (%eax),%edx
     9c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9c3:	89 10                	mov    %edx,(%eax)
     9c5:	eb 26                	jmp    9ed <malloc+0x96>
      else {
        p->s.size -= nunits;
     9c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9ca:	8b 40 04             	mov    0x4(%eax),%eax
     9cd:	2b 45 ec             	sub    -0x14(%ebp),%eax
     9d0:	89 c2                	mov    %eax,%edx
     9d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9d5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     9d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9db:	8b 40 04             	mov    0x4(%eax),%eax
     9de:	c1 e0 03             	shl    $0x3,%eax
     9e1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     9e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9e7:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9ea:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     9ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9f0:	a3 c8 44 00 00       	mov    %eax,0x44c8
      return (void*)(p + 1);
     9f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9f8:	83 c0 08             	add    $0x8,%eax
     9fb:	eb 3b                	jmp    a38 <malloc+0xe1>
    }
    if(p == freep)
     9fd:	a1 c8 44 00 00       	mov    0x44c8,%eax
     a02:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     a05:	75 1e                	jne    a25 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     a07:	83 ec 0c             	sub    $0xc,%esp
     a0a:	ff 75 ec             	pushl  -0x14(%ebp)
     a0d:	e8 e5 fe ff ff       	call   8f7 <morecore>
     a12:	83 c4 10             	add    $0x10,%esp
     a15:	89 45 f4             	mov    %eax,-0xc(%ebp)
     a18:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     a1c:	75 07                	jne    a25 <malloc+0xce>
        return 0;
     a1e:	b8 00 00 00 00       	mov    $0x0,%eax
     a23:	eb 13                	jmp    a38 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     a25:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a28:	89 45 f0             	mov    %eax,-0x10(%ebp)
     a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a2e:	8b 00                	mov    (%eax),%eax
     a30:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     a33:	e9 6d ff ff ff       	jmp    9a5 <malloc+0x4e>
}
     a38:	c9                   	leave  
     a39:	c3                   	ret    

00000a3a <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     a3a:	55                   	push   %ebp
     a3b:	89 e5                	mov    %esp,%ebp
     a3d:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     a40:	83 ec 04             	sub    $0x4,%esp
     a43:	ff 75 08             	pushl  0x8(%ebp)
     a46:	68 88 37 00 00       	push   $0x3788
     a4b:	6a 02                	push   $0x2
     a4d:	e8 03 fc ff ff       	call   655 <printf>
     a52:	83 c4 10             	add    $0x10,%esp
  exit();
     a55:	e8 4f f9 ff ff       	call   3a9 <exit>

00000a5a <getInteger>:
}

static int getInteger(double num)
{
     a5a:	55                   	push   %ebp
     a5b:	89 e5                	mov    %esp,%ebp
     a5d:	83 ec 18             	sub    $0x18,%esp
     a60:	8b 45 08             	mov    0x8(%ebp),%eax
     a63:	89 45 e8             	mov    %eax,-0x18(%ebp)
     a66:	8b 45 0c             	mov    0xc(%ebp),%eax
     a69:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     a6c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     a73:	eb 0e                	jmp    a83 <getInteger+0x29>
  {
    num -= 1;
     a75:	dd 45 e8             	fldl   -0x18(%ebp)
     a78:	d9 e8                	fld1   
     a7a:	de e9                	fsubrp %st,%st(1)
     a7c:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     a7f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     a83:	dd 45 e8             	fldl   -0x18(%ebp)
     a86:	d9 e8                	fld1   
     a88:	d9 c9                	fxch   %st(1)
     a8a:	df e9                	fucomip %st(1),%st
     a8c:	dd d8                	fstp   %st(0)
     a8e:	77 e5                	ja     a75 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     a90:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     a93:	c9                   	leave  
     a94:	c3                   	ret    

00000a95 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     a95:	55                   	push   %ebp
     a96:	89 e5                	mov    %esp,%ebp
     a98:	53                   	push   %ebx
     a99:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     a9c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     aa3:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     aa7:	74 17                	je     ac0 <int2str+0x2b>
     aa9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     aad:	79 11                	jns    ac0 <int2str+0x2b>
    neg = 1;
     aaf:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     ab6:	8b 45 0c             	mov    0xc(%ebp),%eax
     ab9:	f7 d8                	neg    %eax
     abb:	89 45 f0             	mov    %eax,-0x10(%ebp)
     abe:	eb 06                	jmp    ac6 <int2str+0x31>
  } else {
    x = num;
     ac0:	8b 45 0c             	mov    0xc(%ebp),%eax
     ac3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     ac6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     acd:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     ad0:	8d 41 01             	lea    0x1(%ecx),%eax
     ad3:	89 45 f8             	mov    %eax,-0x8(%ebp)
     ad6:	8b 5d 14             	mov    0x14(%ebp),%ebx
     ad9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     adc:	ba 00 00 00 00       	mov    $0x0,%edx
     ae1:	f7 f3                	div    %ebx
     ae3:	89 d0                	mov    %edx,%eax
     ae5:	0f b6 80 94 43 00 00 	movzbl 0x4394(%eax),%eax
     aec:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     af0:	8b 5d 14             	mov    0x14(%ebp),%ebx
     af3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     af6:	ba 00 00 00 00       	mov    $0x0,%edx
     afb:	f7 f3                	div    %ebx
     afd:	89 45 f0             	mov    %eax,-0x10(%ebp)
     b00:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     b04:	75 c7                	jne    acd <int2str+0x38>
  if(neg)
     b06:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b0a:	74 36                	je     b42 <int2str+0xad>
    buf[i++] = '-';
     b0c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b0f:	8d 50 01             	lea    0x1(%eax),%edx
     b12:	89 55 f8             	mov    %edx,-0x8(%ebp)
     b15:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     b1a:	eb 26                	jmp    b42 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     b1c:	8b 45 10             	mov    0x10(%ebp),%eax
     b1f:	8b 00                	mov    (%eax),%eax
     b21:	89 c2                	mov    %eax,%edx
     b23:	8b 45 08             	mov    0x8(%ebp),%eax
     b26:	01 c2                	add    %eax,%edx
     b28:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     b2b:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b2e:	01 c8                	add    %ecx,%eax
     b30:	0f b6 00             	movzbl (%eax),%eax
     b33:	88 02                	mov    %al,(%edx)
    (*pos)++;
     b35:	8b 45 10             	mov    0x10(%ebp),%eax
     b38:	8b 00                	mov    (%eax),%eax
     b3a:	8d 50 01             	lea    0x1(%eax),%edx
     b3d:	8b 45 10             	mov    0x10(%ebp),%eax
     b40:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     b42:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     b46:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     b4a:	79 d0                	jns    b1c <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     b4c:	90                   	nop
     b4d:	83 c4 20             	add    $0x20,%esp
     b50:	5b                   	pop    %ebx
     b51:	5d                   	pop    %ebp
     b52:	c3                   	ret    

00000b53 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     b53:	55                   	push   %ebp
     b54:	89 e5                	mov    %esp,%ebp
     b56:	83 ec 18             	sub    $0x18,%esp
     b59:	8b 45 0c             	mov    0xc(%ebp),%eax
     b5c:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b5f:	8b 45 10             	mov    0x10(%ebp),%eax
     b62:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     b65:	d9 ee                	fldz   
     b67:	dd 45 e8             	fldl   -0x18(%ebp)
     b6a:	d9 c9                	fxch   %st(1)
     b6c:	df e9                	fucomip %st(1),%st
     b6e:	dd d8                	fstp   %st(0)
     b70:	76 24                	jbe    b96 <double2str+0x43>
  {
    buf[*pos] = '-';
     b72:	8b 45 14             	mov    0x14(%ebp),%eax
     b75:	8b 00                	mov    (%eax),%eax
     b77:	89 c2                	mov    %eax,%edx
     b79:	8b 45 08             	mov    0x8(%ebp),%eax
     b7c:	01 d0                	add    %edx,%eax
     b7e:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     b81:	8b 45 14             	mov    0x14(%ebp),%eax
     b84:	8b 00                	mov    (%eax),%eax
     b86:	8d 50 01             	lea    0x1(%eax),%edx
     b89:	8b 45 14             	mov    0x14(%ebp),%eax
     b8c:	89 10                	mov    %edx,(%eax)
    num = -num;
     b8e:	dd 45 e8             	fldl   -0x18(%ebp)
     b91:	d9 e0                	fchs   
     b93:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     b96:	ff 75 ec             	pushl  -0x14(%ebp)
     b99:	ff 75 e8             	pushl  -0x18(%ebp)
     b9c:	e8 b9 fe ff ff       	call   a5a <getInteger>
     ba1:	83 c4 08             	add    $0x8,%esp
     ba4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     ba7:	83 ec 04             	sub    $0x4,%esp
     baa:	6a 01                	push   $0x1
     bac:	6a 0a                	push   $0xa
     bae:	ff 75 14             	pushl  0x14(%ebp)
     bb1:	ff 75 f8             	pushl  -0x8(%ebp)
     bb4:	ff 75 08             	pushl  0x8(%ebp)
     bb7:	e8 d9 fe ff ff       	call   a95 <int2str>
     bbc:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     bbf:	db 45 f8             	fildl  -0x8(%ebp)
     bc2:	dd 45 e8             	fldl   -0x18(%ebp)
     bc5:	de e1                	fsubp  %st,%st(1)
     bc7:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     bca:	dd 45 e8             	fldl   -0x18(%ebp)
     bcd:	dd 05 90 37 00 00    	fldl   0x3790
     bd3:	d9 c9                	fxch   %st(1)
     bd5:	df e9                	fucomip %st(1),%st
     bd7:	dd d8                	fstp   %st(0)
     bd9:	76 1c                	jbe    bf7 <double2str+0xa4>
  {
    buf[*pos] = '.';
     bdb:	8b 45 14             	mov    0x14(%ebp),%eax
     bde:	8b 00                	mov    (%eax),%eax
     be0:	89 c2                	mov    %eax,%edx
     be2:	8b 45 08             	mov    0x8(%ebp),%eax
     be5:	01 d0                	add    %edx,%eax
     be7:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     bea:	8b 45 14             	mov    0x14(%ebp),%eax
     bed:	8b 00                	mov    (%eax),%eax
     bef:	8d 50 01             	lea    0x1(%eax),%edx
     bf2:	8b 45 14             	mov    0x14(%ebp),%eax
     bf5:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     bf7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     bfe:	eb 4c                	jmp    c4c <double2str+0xf9>
  {
    num = num*10;
     c00:	dd 45 e8             	fldl   -0x18(%ebp)
     c03:	dd 05 98 37 00 00    	fldl   0x3798
     c09:	de c9                	fmulp  %st,%st(1)
     c0b:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     c0e:	ff 75 ec             	pushl  -0x14(%ebp)
     c11:	ff 75 e8             	pushl  -0x18(%ebp)
     c14:	e8 41 fe ff ff       	call   a5a <getInteger>
     c19:	83 c4 08             	add    $0x8,%esp
     c1c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     c1f:	83 ec 04             	sub    $0x4,%esp
     c22:	6a 01                	push   $0x1
     c24:	6a 0a                	push   $0xa
     c26:	ff 75 14             	pushl  0x14(%ebp)
     c29:	ff 75 f8             	pushl  -0x8(%ebp)
     c2c:	ff 75 08             	pushl  0x8(%ebp)
     c2f:	e8 61 fe ff ff       	call   a95 <int2str>
     c34:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     c37:	db 45 f8             	fildl  -0x8(%ebp)
     c3a:	dd 45 e8             	fldl   -0x18(%ebp)
     c3d:	de e1                	fsubp  %st,%st(1)
     c3f:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     c42:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     c46:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     c4a:	7f 13                	jg     c5f <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     c4c:	dd 45 e8             	fldl   -0x18(%ebp)
     c4f:	dd 05 90 37 00 00    	fldl   0x3790
     c55:	d9 c9                	fxch   %st(1)
     c57:	df e9                	fucomip %st(1),%st
     c59:	dd d8                	fstp   %st(0)
     c5b:	77 a3                	ja     c00 <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     c5d:	eb 01                	jmp    c60 <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     c5f:	90                   	nop
    }
  }
}
     c60:	90                   	nop
     c61:	c9                   	leave  
     c62:	c3                   	ret    

00000c63 <pow>:

double pow(double opnd, int power)
{
     c63:	55                   	push   %ebp
     c64:	89 e5                	mov    %esp,%ebp
     c66:	83 ec 18             	sub    $0x18,%esp
     c69:	8b 45 08             	mov    0x8(%ebp),%eax
     c6c:	89 45 e8             	mov    %eax,-0x18(%ebp)
     c6f:	8b 45 0c             	mov    0xc(%ebp),%eax
     c72:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     c75:	d9 e8                	fld1   
     c77:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     c7a:	eb 0d                	jmp    c89 <pow+0x26>
  {
    result *= opnd;
     c7c:	dd 45 f8             	fldl   -0x8(%ebp)
     c7f:	dc 4d e8             	fmull  -0x18(%ebp)
     c82:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     c85:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     c89:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     c8d:	7f ed                	jg     c7c <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     c8f:	dd 45 f8             	fldl   -0x8(%ebp)
}
     c92:	c9                   	leave  
     c93:	c3                   	ret    

00000c94 <Translation>:

double Translation(char *s, int* pos)
{
     c94:	55                   	push   %ebp
     c95:	89 e5                	mov    %esp,%ebp
     c97:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     c9a:	d9 ee                	fldz   
     c9c:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     c9f:	d9 ee                	fldz   
     ca1:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     ca4:	eb 3e                	jmp    ce4 <Translation+0x50>
    {
        integer *= 10;
     ca6:	dd 45 f8             	fldl   -0x8(%ebp)
     ca9:	dd 05 98 37 00 00    	fldl   0x3798
     caf:	de c9                	fmulp  %st,%st(1)
     cb1:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     cb4:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb7:	8b 00                	mov    (%eax),%eax
     cb9:	89 c2                	mov    %eax,%edx
     cbb:	8b 45 08             	mov    0x8(%ebp),%eax
     cbe:	01 d0                	add    %edx,%eax
     cc0:	0f b6 00             	movzbl (%eax),%eax
     cc3:	0f be c0             	movsbl %al,%eax
     cc6:	83 e8 30             	sub    $0x30,%eax
     cc9:	89 45 dc             	mov    %eax,-0x24(%ebp)
     ccc:	db 45 dc             	fildl  -0x24(%ebp)
     ccf:	dd 45 f8             	fldl   -0x8(%ebp)
     cd2:	de c1                	faddp  %st,%st(1)
     cd4:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     cd7:	8b 45 0c             	mov    0xc(%ebp),%eax
     cda:	8b 00                	mov    (%eax),%eax
     cdc:	8d 50 01             	lea    0x1(%eax),%edx
     cdf:	8b 45 0c             	mov    0xc(%ebp),%eax
     ce2:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     ce4:	8b 45 0c             	mov    0xc(%ebp),%eax
     ce7:	8b 00                	mov    (%eax),%eax
     ce9:	89 c2                	mov    %eax,%edx
     ceb:	8b 45 08             	mov    0x8(%ebp),%eax
     cee:	01 d0                	add    %edx,%eax
     cf0:	0f b6 00             	movzbl (%eax),%eax
     cf3:	3c 2f                	cmp    $0x2f,%al
     cf5:	7e 13                	jle    d0a <Translation+0x76>
     cf7:	8b 45 0c             	mov    0xc(%ebp),%eax
     cfa:	8b 00                	mov    (%eax),%eax
     cfc:	89 c2                	mov    %eax,%edx
     cfe:	8b 45 08             	mov    0x8(%ebp),%eax
     d01:	01 d0                	add    %edx,%eax
     d03:	0f b6 00             	movzbl (%eax),%eax
     d06:	3c 39                	cmp    $0x39,%al
     d08:	7e 9c                	jle    ca6 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     d0a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d0d:	8b 00                	mov    (%eax),%eax
     d0f:	89 c2                	mov    %eax,%edx
     d11:	8b 45 08             	mov    0x8(%ebp),%eax
     d14:	01 d0                	add    %edx,%eax
     d16:	0f b6 00             	movzbl (%eax),%eax
     d19:	3c 2e                	cmp    $0x2e,%al
     d1b:	0f 85 9b 00 00 00    	jne    dbc <Translation+0x128>
    {
        (*pos)++;
     d21:	8b 45 0c             	mov    0xc(%ebp),%eax
     d24:	8b 00                	mov    (%eax),%eax
     d26:	8d 50 01             	lea    0x1(%eax),%edx
     d29:	8b 45 0c             	mov    0xc(%ebp),%eax
     d2c:	89 10                	mov    %edx,(%eax)
        int c = 1;
     d2e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     d35:	eb 5b                	jmp    d92 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     d37:	8b 45 0c             	mov    0xc(%ebp),%eax
     d3a:	8b 00                	mov    (%eax),%eax
     d3c:	89 c2                	mov    %eax,%edx
     d3e:	8b 45 08             	mov    0x8(%ebp),%eax
     d41:	01 d0                	add    %edx,%eax
     d43:	0f b6 00             	movzbl (%eax),%eax
     d46:	0f be c0             	movsbl %al,%eax
     d49:	83 e8 30             	sub    $0x30,%eax
     d4c:	89 45 dc             	mov    %eax,-0x24(%ebp)
     d4f:	db 45 dc             	fildl  -0x24(%ebp)
     d52:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     d55:	83 ec 04             	sub    $0x4,%esp
     d58:	ff 75 ec             	pushl  -0x14(%ebp)
     d5b:	dd 05 a0 37 00 00    	fldl   0x37a0
     d61:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     d65:	dd 1c 24             	fstpl  (%esp)
     d68:	e8 f6 fe ff ff       	call   c63 <pow>
     d6d:	83 c4 10             	add    $0x10,%esp
     d70:	dd 45 e0             	fldl   -0x20(%ebp)
     d73:	de c9                	fmulp  %st,%st(1)
     d75:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     d78:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     d7c:	dd 45 f0             	fldl   -0x10(%ebp)
     d7f:	dc 45 e0             	faddl  -0x20(%ebp)
     d82:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     d85:	8b 45 0c             	mov    0xc(%ebp),%eax
     d88:	8b 00                	mov    (%eax),%eax
     d8a:	8d 50 01             	lea    0x1(%eax),%edx
     d8d:	8b 45 0c             	mov    0xc(%ebp),%eax
     d90:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     d92:	8b 45 0c             	mov    0xc(%ebp),%eax
     d95:	8b 00                	mov    (%eax),%eax
     d97:	89 c2                	mov    %eax,%edx
     d99:	8b 45 08             	mov    0x8(%ebp),%eax
     d9c:	01 d0                	add    %edx,%eax
     d9e:	0f b6 00             	movzbl (%eax),%eax
     da1:	3c 2f                	cmp    $0x2f,%al
     da3:	7e 17                	jle    dbc <Translation+0x128>
     da5:	8b 45 0c             	mov    0xc(%ebp),%eax
     da8:	8b 00                	mov    (%eax),%eax
     daa:	89 c2                	mov    %eax,%edx
     dac:	8b 45 08             	mov    0x8(%ebp),%eax
     daf:	01 d0                	add    %edx,%eax
     db1:	0f b6 00             	movzbl (%eax),%eax
     db4:	3c 39                	cmp    $0x39,%al
     db6:	0f 8e 7b ff ff ff    	jle    d37 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     dbc:	dd 45 f8             	fldl   -0x8(%ebp)
     dbf:	dc 45 f0             	faddl  -0x10(%ebp)
     dc2:	c9                   	leave  
     dc3:	c3                   	ret    

00000dc4 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     dc4:	55                   	push   %ebp
     dc5:	89 e5                	mov    %esp,%ebp
     dc7:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     dca:	e8 d2 f5 ff ff       	call   3a1 <fork>
     dcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     dd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     dd5:	c9                   	leave  
     dd6:	c3                   	ret    

00000dd7 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     dd7:	55                   	push   %ebp
     dd8:	89 e5                	mov    %esp,%ebp
     dda:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     ddd:	83 ec 0c             	sub    $0xc,%esp
     de0:	6a 54                	push   $0x54
     de2:	e8 70 fb ff ff       	call   957 <malloc>
     de7:	83 c4 10             	add    $0x10,%esp
     dea:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     ded:	83 ec 04             	sub    $0x4,%esp
     df0:	6a 54                	push   $0x54
     df2:	6a 00                	push   $0x0
     df4:	ff 75 f4             	pushl  -0xc(%ebp)
     df7:	e8 12 f4 ff ff       	call   20e <memset>
     dfc:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     dff:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e02:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     e08:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e0b:	c9                   	leave  
     e0c:	c3                   	ret    

00000e0d <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     e0d:	55                   	push   %ebp
     e0e:	89 e5                	mov    %esp,%ebp
     e10:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e13:	83 ec 0c             	sub    $0xc,%esp
     e16:	6a 18                	push   $0x18
     e18:	e8 3a fb ff ff       	call   957 <malloc>
     e1d:	83 c4 10             	add    $0x10,%esp
     e20:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e23:	83 ec 04             	sub    $0x4,%esp
     e26:	6a 18                	push   $0x18
     e28:	6a 00                	push   $0x0
     e2a:	ff 75 f4             	pushl  -0xc(%ebp)
     e2d:	e8 dc f3 ff ff       	call   20e <memset>
     e32:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     e35:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e38:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     e3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e41:	8b 55 08             	mov    0x8(%ebp),%edx
     e44:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     e47:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e4a:	8b 55 0c             	mov    0xc(%ebp),%edx
     e4d:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     e50:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e53:	8b 55 10             	mov    0x10(%ebp),%edx
     e56:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     e59:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e5c:	8b 55 14             	mov    0x14(%ebp),%edx
     e5f:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     e62:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e65:	8b 55 18             	mov    0x18(%ebp),%edx
     e68:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     e6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e6e:	c9                   	leave  
     e6f:	c3                   	ret    

00000e70 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e76:	83 ec 0c             	sub    $0xc,%esp
     e79:	6a 0c                	push   $0xc
     e7b:	e8 d7 fa ff ff       	call   957 <malloc>
     e80:	83 c4 10             	add    $0x10,%esp
     e83:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e86:	83 ec 04             	sub    $0x4,%esp
     e89:	6a 0c                	push   $0xc
     e8b:	6a 00                	push   $0x0
     e8d:	ff 75 f4             	pushl  -0xc(%ebp)
     e90:	e8 79 f3 ff ff       	call   20e <memset>
     e95:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     e98:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e9b:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     ea1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ea4:	8b 55 08             	mov    0x8(%ebp),%edx
     ea7:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     eaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ead:	8b 55 0c             	mov    0xc(%ebp),%edx
     eb0:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     eb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     eb6:	c9                   	leave  
     eb7:	c3                   	ret    

00000eb8 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     eb8:	55                   	push   %ebp
     eb9:	89 e5                	mov    %esp,%ebp
     ebb:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     ebe:	83 ec 0c             	sub    $0xc,%esp
     ec1:	6a 0c                	push   $0xc
     ec3:	e8 8f fa ff ff       	call   957 <malloc>
     ec8:	83 c4 10             	add    $0x10,%esp
     ecb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     ece:	83 ec 04             	sub    $0x4,%esp
     ed1:	6a 0c                	push   $0xc
     ed3:	6a 00                	push   $0x0
     ed5:	ff 75 f4             	pushl  -0xc(%ebp)
     ed8:	e8 31 f3 ff ff       	call   20e <memset>
     edd:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     ee0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ee3:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     ee9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eec:	8b 55 08             	mov    0x8(%ebp),%edx
     eef:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     ef2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ef5:	8b 55 0c             	mov    0xc(%ebp),%edx
     ef8:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     efb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     efe:	c9                   	leave  
     eff:	c3                   	ret    

00000f00 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     f00:	55                   	push   %ebp
     f01:	89 e5                	mov    %esp,%ebp
     f03:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     f06:	83 ec 0c             	sub    $0xc,%esp
     f09:	6a 08                	push   $0x8
     f0b:	e8 47 fa ff ff       	call   957 <malloc>
     f10:	83 c4 10             	add    $0x10,%esp
     f13:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     f16:	83 ec 04             	sub    $0x4,%esp
     f19:	6a 08                	push   $0x8
     f1b:	6a 00                	push   $0x0
     f1d:	ff 75 f4             	pushl  -0xc(%ebp)
     f20:	e8 e9 f2 ff ff       	call   20e <memset>
     f25:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
     f28:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f2b:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     f31:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f34:	8b 55 08             	mov    0x8(%ebp),%edx
     f37:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     f3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f3d:	c9                   	leave  
     f3e:	c3                   	ret    

00000f3f <calcmd>:

struct cmd* calcmd(char *_line)
{
     f3f:	55                   	push   %ebp
     f40:	89 e5                	mov    %esp,%ebp
     f42:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     f45:	83 ec 0c             	sub    $0xc,%esp
     f48:	6a 08                	push   $0x8
     f4a:	e8 08 fa ff ff       	call   957 <malloc>
     f4f:	83 c4 10             	add    $0x10,%esp
     f52:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     f55:	83 ec 04             	sub    $0x4,%esp
     f58:	6a 08                	push   $0x8
     f5a:	6a 00                	push   $0x0
     f5c:	ff 75 f4             	pushl  -0xc(%ebp)
     f5f:	e8 aa f2 ff ff       	call   20e <memset>
     f64:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
     f67:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f6a:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
     f70:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f73:	8b 55 08             	mov    0x8(%ebp),%edx
     f76:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     f79:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f7c:	c9                   	leave  
     f7d:	c3                   	ret    

00000f7e <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
     f7e:	55                   	push   %ebp
     f7f:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
     f81:	eb 0c                	jmp    f8f <mystrncmp+0x11>
    n--, p++, q++;
     f83:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     f87:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     f8b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
     f8f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     f93:	74 1a                	je     faf <mystrncmp+0x31>
     f95:	8b 45 08             	mov    0x8(%ebp),%eax
     f98:	0f b6 00             	movzbl (%eax),%eax
     f9b:	84 c0                	test   %al,%al
     f9d:	74 10                	je     faf <mystrncmp+0x31>
     f9f:	8b 45 08             	mov    0x8(%ebp),%eax
     fa2:	0f b6 10             	movzbl (%eax),%edx
     fa5:	8b 45 0c             	mov    0xc(%ebp),%eax
     fa8:	0f b6 00             	movzbl (%eax),%eax
     fab:	38 c2                	cmp    %al,%dl
     fad:	74 d4                	je     f83 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
     faf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     fb3:	75 07                	jne    fbc <mystrncmp+0x3e>
    return 0;
     fb5:	b8 00 00 00 00       	mov    $0x0,%eax
     fba:	eb 16                	jmp    fd2 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
     fbc:	8b 45 08             	mov    0x8(%ebp),%eax
     fbf:	0f b6 00             	movzbl (%eax),%eax
     fc2:	0f b6 d0             	movzbl %al,%edx
     fc5:	8b 45 0c             	mov    0xc(%ebp),%eax
     fc8:	0f b6 00             	movzbl (%eax),%eax
     fcb:	0f b6 c0             	movzbl %al,%eax
     fce:	29 c2                	sub    %eax,%edx
     fd0:	89 d0                	mov    %edx,%eax
}
     fd2:	5d                   	pop    %ebp
     fd3:	c3                   	ret    

00000fd4 <mystrlen>:

static int mystrlen(const char *s)
{
     fd4:	55                   	push   %ebp
     fd5:	89 e5                	mov    %esp,%ebp
     fd7:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
     fda:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     fe1:	eb 04                	jmp    fe7 <mystrlen+0x13>
     fe3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     fe7:	8b 55 fc             	mov    -0x4(%ebp),%edx
     fea:	8b 45 08             	mov    0x8(%ebp),%eax
     fed:	01 d0                	add    %edx,%eax
     fef:	0f b6 00             	movzbl (%eax),%eax
     ff2:	84 c0                	test   %al,%al
     ff4:	75 ed                	jne    fe3 <mystrlen+0xf>
    ;
  return n;
     ff6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     ff9:	c9                   	leave  
     ffa:	c3                   	ret    

00000ffb <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
     ffb:	55                   	push   %ebp
     ffc:	89 e5                	mov    %esp,%ebp
     ffe:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
    1001:	8b 45 08             	mov    0x8(%ebp),%eax
    1004:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
    1007:	90                   	nop
    1008:	8b 45 10             	mov    0x10(%ebp),%eax
    100b:	8d 50 ff             	lea    -0x1(%eax),%edx
    100e:	89 55 10             	mov    %edx,0x10(%ebp)
    1011:	85 c0                	test   %eax,%eax
    1013:	7e 2c                	jle    1041 <mystrncpy+0x46>
    1015:	8b 45 08             	mov    0x8(%ebp),%eax
    1018:	8d 50 01             	lea    0x1(%eax),%edx
    101b:	89 55 08             	mov    %edx,0x8(%ebp)
    101e:	8b 55 0c             	mov    0xc(%ebp),%edx
    1021:	8d 4a 01             	lea    0x1(%edx),%ecx
    1024:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1027:	0f b6 12             	movzbl (%edx),%edx
    102a:	88 10                	mov    %dl,(%eax)
    102c:	0f b6 00             	movzbl (%eax),%eax
    102f:	84 c0                	test   %al,%al
    1031:	75 d5                	jne    1008 <mystrncpy+0xd>
    ;
  while(n-- > 0)
    1033:	eb 0c                	jmp    1041 <mystrncpy+0x46>
    *s++ = 0;
    1035:	8b 45 08             	mov    0x8(%ebp),%eax
    1038:	8d 50 01             	lea    0x1(%eax),%edx
    103b:	89 55 08             	mov    %edx,0x8(%ebp)
    103e:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    1041:	8b 45 10             	mov    0x10(%ebp),%eax
    1044:	8d 50 ff             	lea    -0x1(%eax),%edx
    1047:	89 55 10             	mov    %edx,0x10(%ebp)
    104a:	85 c0                	test   %eax,%eax
    104c:	7f e7                	jg     1035 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    104e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1051:	c9                   	leave  
    1052:	c3                   	ret    

00001053 <isEqual>:

int isEqual(double a, double b)
{
    1053:	55                   	push   %ebp
    1054:	89 e5                	mov    %esp,%ebp
    1056:	83 ec 10             	sub    $0x10,%esp
    1059:	8b 45 08             	mov    0x8(%ebp),%eax
    105c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    105f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1062:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1065:	8b 45 10             	mov    0x10(%ebp),%eax
    1068:	89 45 f0             	mov    %eax,-0x10(%ebp)
    106b:	8b 45 14             	mov    0x14(%ebp),%eax
    106e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    1071:	dd 45 f8             	fldl   -0x8(%ebp)
    1074:	dc 65 f0             	fsubl  -0x10(%ebp)
    1077:	dd 05 70 39 00 00    	fldl   0x3970
    107d:	df e9                	fucomip %st(1),%st
    107f:	dd d8                	fstp   %st(0)
    1081:	76 19                	jbe    109c <isEqual+0x49>
    1083:	dd 45 f0             	fldl   -0x10(%ebp)
    1086:	dc 65 f8             	fsubl  -0x8(%ebp)
    1089:	dd 05 70 39 00 00    	fldl   0x3970
    108f:	df e9                	fucomip %st(1),%st
    1091:	dd d8                	fstp   %st(0)
    1093:	76 07                	jbe    109c <isEqual+0x49>
    return 1;
    1095:	b8 01 00 00 00       	mov    $0x1,%eax
    109a:	eb 05                	jmp    10a1 <isEqual+0x4e>
  return 0;
    109c:	b8 00 00 00 00       	mov    $0x0,%eax
}
    10a1:	c9                   	leave  
    10a2:	c3                   	ret    

000010a3 <isCmdName>:

int isCmdName(const char* str)
{
    10a3:	55                   	push   %ebp
    10a4:	89 e5                	mov    %esp,%ebp
    10a6:	53                   	push   %ebx
    10a7:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    10aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    10b1:	eb 71                	jmp    1124 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    10b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    10b6:	89 d0                	mov    %edx,%eax
    10b8:	c1 e0 02             	shl    $0x2,%eax
    10bb:	01 d0                	add    %edx,%eax
    10bd:	01 c0                	add    %eax,%eax
    10bf:	05 c0 43 00 00       	add    $0x43c0,%eax
    10c4:	83 ec 0c             	sub    $0xc,%esp
    10c7:	50                   	push   %eax
    10c8:	e8 1a f1 ff ff       	call   1e7 <strlen>
    10cd:	83 c4 10             	add    $0x10,%esp
    10d0:	89 c3                	mov    %eax,%ebx
    10d2:	83 ec 0c             	sub    $0xc,%esp
    10d5:	ff 75 08             	pushl  0x8(%ebp)
    10d8:	e8 f7 fe ff ff       	call   fd4 <mystrlen>
    10dd:	83 c4 10             	add    $0x10,%esp
    10e0:	39 c3                	cmp    %eax,%ebx
    10e2:	75 3c                	jne    1120 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    10e4:	83 ec 0c             	sub    $0xc,%esp
    10e7:	ff 75 08             	pushl  0x8(%ebp)
    10ea:	e8 e5 fe ff ff       	call   fd4 <mystrlen>
    10ef:	83 c4 10             	add    $0x10,%esp
    10f2:	89 c1                	mov    %eax,%ecx
    10f4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    10f7:	89 d0                	mov    %edx,%eax
    10f9:	c1 e0 02             	shl    $0x2,%eax
    10fc:	01 d0                	add    %edx,%eax
    10fe:	01 c0                	add    %eax,%eax
    1100:	05 c0 43 00 00       	add    $0x43c0,%eax
    1105:	83 ec 04             	sub    $0x4,%esp
    1108:	51                   	push   %ecx
    1109:	ff 75 08             	pushl  0x8(%ebp)
    110c:	50                   	push   %eax
    110d:	e8 6c fe ff ff       	call   f7e <mystrncmp>
    1112:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1115:	85 c0                	test   %eax,%eax
    1117:	75 07                	jne    1120 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    1119:	b8 01 00 00 00       	mov    $0x1,%eax
    111e:	eb 0f                	jmp    112f <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    1120:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1124:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1128:	7e 89                	jle    10b3 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    112a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    112f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1132:	c9                   	leave  
    1133:	c3                   	ret    

00001134 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    1134:	55                   	push   %ebp
    1135:	89 e5                	mov    %esp,%ebp
    1137:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    113d:	83 ec 08             	sub    $0x8,%esp
    1140:	6a 00                	push   $0x0
    1142:	68 88 44 00 00       	push   $0x4488
    1147:	e8 9d f2 ff ff       	call   3e9 <open>
    114c:	83 c4 10             	add    $0x10,%esp
    114f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1152:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1156:	79 0a                	jns    1162 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    1158:	b8 00 00 00 00       	mov    $0x0,%eax
    115d:	e9 9a 01 00 00       	jmp    12fc <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    1162:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    1169:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1170:	e9 ee 00 00 00       	jmp    1263 <findAlias+0x12f>
  {
      int isSame = 1;
    1175:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    117c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    1183:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    118a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    1191:	83 ec 0c             	sub    $0xc,%esp
    1194:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1197:	50                   	push   %eax
    1198:	e8 4a f0 ff ff       	call   1e7 <strlen>
    119d:	83 c4 10             	add    $0x10,%esp
    11a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    11a3:	83 ec 0c             	sub    $0xc,%esp
    11a6:	ff 75 08             	pushl  0x8(%ebp)
    11a9:	e8 39 f0 ff ff       	call   1e7 <strlen>
    11ae:	83 c4 10             	add    $0x10,%esp
    11b1:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    11b4:	8d 55 9a             	lea    -0x66(%ebp),%edx
    11b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11ba:	01 d0                	add    %edx,%eax
    11bc:	0f b6 00             	movzbl (%eax),%eax
    11bf:	3c 21                	cmp    $0x21,%al
    11c1:	75 38                	jne    11fb <findAlias+0xc7>
      {
          startIndex++;
    11c3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    11c7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    11ce:	eb 2b                	jmp    11fb <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    11d0:	8d 55 9a             	lea    -0x66(%ebp),%edx
    11d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11d6:	01 d0                	add    %edx,%eax
    11d8:	0f b6 10             	movzbl (%eax),%edx
    11db:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    11de:	8b 45 08             	mov    0x8(%ebp),%eax
    11e1:	01 c8                	add    %ecx,%eax
    11e3:	0f b6 00             	movzbl (%eax),%eax
    11e6:	38 c2                	cmp    %al,%dl
    11e8:	74 09                	je     11f3 <findAlias+0xbf>
          {
              isSame = 0;
    11ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    11f1:	eb 1f                	jmp    1212 <findAlias+0xde>
          }
          startIndex++;
    11f3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    11f7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    11fb:	8d 55 9a             	lea    -0x66(%ebp),%edx
    11fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1201:	01 d0                	add    %edx,%eax
    1203:	0f b6 00             	movzbl (%eax),%eax
    1206:	3c 3d                	cmp    $0x3d,%al
    1208:	74 08                	je     1212 <findAlias+0xde>
    120a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    120d:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1210:	7c be                	jl     11d0 <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    1212:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1215:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1218:	01 d0                	add    %edx,%eax
    121a:	0f b6 00             	movzbl (%eax),%eax
    121d:	3c 3d                	cmp    $0x3d,%al
    121f:	75 08                	jne    1229 <findAlias+0xf5>
    1221:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1224:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1227:	7d 07                	jge    1230 <findAlias+0xfc>
      {
          isSame = 0;
    1229:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    1230:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    1234:	75 0b                	jne    1241 <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    1236:	b8 01 00 00 00       	mov    $0x1,%eax
    123b:	2b 45 f0             	sub    -0x10(%ebp),%eax
    123e:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    1241:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1245:	75 1c                	jne    1263 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    1247:	83 ec 08             	sub    $0x8,%esp
    124a:	8d 45 9a             	lea    -0x66(%ebp),%eax
    124d:	50                   	push   %eax
    124e:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1254:	50                   	push   %eax
    1255:	e8 1e ef ff ff       	call   178 <strcpy>
    125a:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    125d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1260:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1263:	83 ec 04             	sub    $0x4,%esp
    1266:	6a 32                	push   $0x32
    1268:	8d 45 9a             	lea    -0x66(%ebp),%eax
    126b:	50                   	push   %eax
    126c:	ff 75 dc             	pushl  -0x24(%ebp)
    126f:	e8 4d f1 ff ff       	call   3c1 <read>
    1274:	83 c4 10             	add    $0x10,%esp
    1277:	89 45 d8             	mov    %eax,-0x28(%ebp)
    127a:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    127e:	0f 8f f1 fe ff ff    	jg     1175 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    1284:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1288:	75 5f                	jne    12e9 <findAlias+0x1b5>
  {
    int i = 0;
    128a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    1291:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    1295:	eb 20                	jmp    12b7 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    1297:	8b 55 e0             	mov    -0x20(%ebp),%edx
    129a:	8b 45 0c             	mov    0xc(%ebp),%eax
    129d:	01 c2                	add    %eax,%edx
    129f:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    12a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12a8:	01 c8                	add    %ecx,%eax
    12aa:	0f b6 00             	movzbl (%eax),%eax
    12ad:	88 02                	mov    %al,(%edx)
      i++;
    12af:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    12b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    12b7:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    12bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12c0:	01 d0                	add    %edx,%eax
    12c2:	0f b6 00             	movzbl (%eax),%eax
    12c5:	84 c0                	test   %al,%al
    12c7:	75 ce                	jne    1297 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    12c9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    12cc:	8b 45 0c             	mov    0xc(%ebp),%eax
    12cf:	01 d0                	add    %edx,%eax
    12d1:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    12d4:	83 ec 0c             	sub    $0xc,%esp
    12d7:	ff 75 dc             	pushl  -0x24(%ebp)
    12da:	e8 f2 f0 ff ff       	call   3d1 <close>
    12df:	83 c4 10             	add    $0x10,%esp
    return 1;
    12e2:	b8 01 00 00 00       	mov    $0x1,%eax
    12e7:	eb 13                	jmp    12fc <findAlias+0x1c8>
  }
  close(fd);
    12e9:	83 ec 0c             	sub    $0xc,%esp
    12ec:	ff 75 dc             	pushl  -0x24(%ebp)
    12ef:	e8 dd f0 ff ff       	call   3d1 <close>
    12f4:	83 c4 10             	add    $0x10,%esp
  return 0;
    12f7:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12fc:	c9                   	leave  
    12fd:	c3                   	ret    

000012fe <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    12fe:	55                   	push   %ebp
    12ff:	89 e5                	mov    %esp,%ebp
    1301:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1304:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1308:	75 05                	jne    130f <runcmd+0x11>
    exit();
    130a:	e8 9a f0 ff ff       	call   3a9 <exit>
  
  switch(cmd->type){
    130f:	8b 45 08             	mov    0x8(%ebp),%eax
    1312:	8b 00                	mov    (%eax),%eax
    1314:	83 f8 05             	cmp    $0x5,%eax
    1317:	77 09                	ja     1322 <runcmd+0x24>
    1319:	8b 04 85 d4 37 00 00 	mov    0x37d4(,%eax,4),%eax
    1320:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    1322:	83 ec 0c             	sub    $0xc,%esp
    1325:	68 a8 37 00 00       	push   $0x37a8
    132a:	e8 0b f7 ff ff       	call   a3a <panic1>
    132f:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    1332:	8b 45 08             	mov    0x8(%ebp),%eax
    1335:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    1338:	8b 45 f4             	mov    -0xc(%ebp),%eax
    133b:	8b 40 04             	mov    0x4(%eax),%eax
    133e:	85 c0                	test   %eax,%eax
    1340:	75 05                	jne    1347 <runcmd+0x49>
      exit();
    1342:	e8 62 f0 ff ff       	call   3a9 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    1347:	8b 45 f4             	mov    -0xc(%ebp),%eax
    134a:	8b 40 04             	mov    0x4(%eax),%eax
    134d:	83 ec 0c             	sub    $0xc,%esp
    1350:	50                   	push   %eax
    1351:	e8 4d fd ff ff       	call   10a3 <isCmdName>
    1356:	83 c4 10             	add    $0x10,%esp
    1359:	85 c0                	test   %eax,%eax
    135b:	75 37                	jne    1394 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    135d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1360:	8b 40 04             	mov    0x4(%eax),%eax
    1363:	83 ec 08             	sub    $0x8,%esp
    1366:	8d 55 ce             	lea    -0x32(%ebp),%edx
    1369:	52                   	push   %edx
    136a:	50                   	push   %eax
    136b:	e8 c4 fd ff ff       	call   1134 <findAlias>
    1370:	83 c4 10             	add    $0x10,%esp
    1373:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    1376:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    137a:	75 31                	jne    13ad <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    137c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    137f:	83 c0 04             	add    $0x4,%eax
    1382:	83 ec 08             	sub    $0x8,%esp
    1385:	50                   	push   %eax
    1386:	8d 45 ce             	lea    -0x32(%ebp),%eax
    1389:	50                   	push   %eax
    138a:	e8 52 f0 ff ff       	call   3e1 <exec>
    138f:	83 c4 10             	add    $0x10,%esp
    1392:	eb 19                	jmp    13ad <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    1394:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1397:	8d 50 04             	lea    0x4(%eax),%edx
    139a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    139d:	8b 40 04             	mov    0x4(%eax),%eax
    13a0:	83 ec 08             	sub    $0x8,%esp
    13a3:	52                   	push   %edx
    13a4:	50                   	push   %eax
    13a5:	e8 37 f0 ff ff       	call   3e1 <exec>
    13aa:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    13ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13b0:	8b 40 04             	mov    0x4(%eax),%eax
    13b3:	83 ec 04             	sub    $0x4,%esp
    13b6:	50                   	push   %eax
    13b7:	68 af 37 00 00       	push   $0x37af
    13bc:	6a 02                	push   $0x2
    13be:	e8 92 f2 ff ff       	call   655 <printf>
    13c3:	83 c4 10             	add    $0x10,%esp
    break;
    13c6:	e9 c6 01 00 00       	jmp    1591 <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    13cb:	8b 45 08             	mov    0x8(%ebp),%eax
    13ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    13d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13d4:	8b 40 14             	mov    0x14(%eax),%eax
    13d7:	83 ec 0c             	sub    $0xc,%esp
    13da:	50                   	push   %eax
    13db:	e8 f1 ef ff ff       	call   3d1 <close>
    13e0:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    13e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13e6:	8b 50 10             	mov    0x10(%eax),%edx
    13e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13ec:	8b 40 08             	mov    0x8(%eax),%eax
    13ef:	83 ec 08             	sub    $0x8,%esp
    13f2:	52                   	push   %edx
    13f3:	50                   	push   %eax
    13f4:	e8 f0 ef ff ff       	call   3e9 <open>
    13f9:	83 c4 10             	add    $0x10,%esp
    13fc:	85 c0                	test   %eax,%eax
    13fe:	79 1e                	jns    141e <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    1400:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1403:	8b 40 08             	mov    0x8(%eax),%eax
    1406:	83 ec 04             	sub    $0x4,%esp
    1409:	50                   	push   %eax
    140a:	68 bf 37 00 00       	push   $0x37bf
    140f:	6a 02                	push   $0x2
    1411:	e8 3f f2 ff ff       	call   655 <printf>
    1416:	83 c4 10             	add    $0x10,%esp
      exit();
    1419:	e8 8b ef ff ff       	call   3a9 <exit>
    }
    runcmd(rcmd->cmd);
    141e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1421:	8b 40 04             	mov    0x4(%eax),%eax
    1424:	83 ec 0c             	sub    $0xc,%esp
    1427:	50                   	push   %eax
    1428:	e8 d1 fe ff ff       	call   12fe <runcmd>
    142d:	83 c4 10             	add    $0x10,%esp
    break;
    1430:	e9 5c 01 00 00       	jmp    1591 <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    1435:	8b 45 08             	mov    0x8(%ebp),%eax
    1438:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    143b:	e8 84 f9 ff ff       	call   dc4 <fork1>
    1440:	85 c0                	test   %eax,%eax
    1442:	75 12                	jne    1456 <runcmd+0x158>
      runcmd(lcmd->left);
    1444:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1447:	8b 40 04             	mov    0x4(%eax),%eax
    144a:	83 ec 0c             	sub    $0xc,%esp
    144d:	50                   	push   %eax
    144e:	e8 ab fe ff ff       	call   12fe <runcmd>
    1453:	83 c4 10             	add    $0x10,%esp
    wait();
    1456:	e8 56 ef ff ff       	call   3b1 <wait>
    runcmd(lcmd->right);
    145b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    145e:	8b 40 08             	mov    0x8(%eax),%eax
    1461:	83 ec 0c             	sub    $0xc,%esp
    1464:	50                   	push   %eax
    1465:	e8 94 fe ff ff       	call   12fe <runcmd>
    146a:	83 c4 10             	add    $0x10,%esp
    break;
    146d:	e9 1f 01 00 00       	jmp    1591 <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    1472:	8b 45 08             	mov    0x8(%ebp),%eax
    1475:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    1478:	83 ec 0c             	sub    $0xc,%esp
    147b:	8d 45 d8             	lea    -0x28(%ebp),%eax
    147e:	50                   	push   %eax
    147f:	e8 35 ef ff ff       	call   3b9 <pipe>
    1484:	83 c4 10             	add    $0x10,%esp
    1487:	85 c0                	test   %eax,%eax
    1489:	79 10                	jns    149b <runcmd+0x19d>
      panic1("pipe");
    148b:	83 ec 0c             	sub    $0xc,%esp
    148e:	68 cf 37 00 00       	push   $0x37cf
    1493:	e8 a2 f5 ff ff       	call   a3a <panic1>
    1498:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    149b:	e8 24 f9 ff ff       	call   dc4 <fork1>
    14a0:	85 c0                	test   %eax,%eax
    14a2:	75 4c                	jne    14f0 <runcmd+0x1f2>
      close(1);
    14a4:	83 ec 0c             	sub    $0xc,%esp
    14a7:	6a 01                	push   $0x1
    14a9:	e8 23 ef ff ff       	call   3d1 <close>
    14ae:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    14b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    14b4:	83 ec 0c             	sub    $0xc,%esp
    14b7:	50                   	push   %eax
    14b8:	e8 64 ef ff ff       	call   421 <dup>
    14bd:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    14c0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    14c3:	83 ec 0c             	sub    $0xc,%esp
    14c6:	50                   	push   %eax
    14c7:	e8 05 ef ff ff       	call   3d1 <close>
    14cc:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    14cf:	8b 45 dc             	mov    -0x24(%ebp),%eax
    14d2:	83 ec 0c             	sub    $0xc,%esp
    14d5:	50                   	push   %eax
    14d6:	e8 f6 ee ff ff       	call   3d1 <close>
    14db:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    14de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    14e1:	8b 40 04             	mov    0x4(%eax),%eax
    14e4:	83 ec 0c             	sub    $0xc,%esp
    14e7:	50                   	push   %eax
    14e8:	e8 11 fe ff ff       	call   12fe <runcmd>
    14ed:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    14f0:	e8 cf f8 ff ff       	call   dc4 <fork1>
    14f5:	85 c0                	test   %eax,%eax
    14f7:	75 4c                	jne    1545 <runcmd+0x247>
      close(0);
    14f9:	83 ec 0c             	sub    $0xc,%esp
    14fc:	6a 00                	push   $0x0
    14fe:	e8 ce ee ff ff       	call   3d1 <close>
    1503:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    1506:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1509:	83 ec 0c             	sub    $0xc,%esp
    150c:	50                   	push   %eax
    150d:	e8 0f ef ff ff       	call   421 <dup>
    1512:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1515:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1518:	83 ec 0c             	sub    $0xc,%esp
    151b:	50                   	push   %eax
    151c:	e8 b0 ee ff ff       	call   3d1 <close>
    1521:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    1524:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1527:	83 ec 0c             	sub    $0xc,%esp
    152a:	50                   	push   %eax
    152b:	e8 a1 ee ff ff       	call   3d1 <close>
    1530:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    1533:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1536:	8b 40 08             	mov    0x8(%eax),%eax
    1539:	83 ec 0c             	sub    $0xc,%esp
    153c:	50                   	push   %eax
    153d:	e8 bc fd ff ff       	call   12fe <runcmd>
    1542:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    1545:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1548:	83 ec 0c             	sub    $0xc,%esp
    154b:	50                   	push   %eax
    154c:	e8 80 ee ff ff       	call   3d1 <close>
    1551:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    1554:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1557:	83 ec 0c             	sub    $0xc,%esp
    155a:	50                   	push   %eax
    155b:	e8 71 ee ff ff       	call   3d1 <close>
    1560:	83 c4 10             	add    $0x10,%esp
    wait();
    1563:	e8 49 ee ff ff       	call   3b1 <wait>
    wait();
    1568:	e8 44 ee ff ff       	call   3b1 <wait>
    break;
    156d:	eb 22                	jmp    1591 <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    156f:	8b 45 08             	mov    0x8(%ebp),%eax
    1572:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    1575:	e8 4a f8 ff ff       	call   dc4 <fork1>
    157a:	85 c0                	test   %eax,%eax
    157c:	75 12                	jne    1590 <runcmd+0x292>
      runcmd(bcmd->cmd);
    157e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1581:	8b 40 04             	mov    0x4(%eax),%eax
    1584:	83 ec 0c             	sub    $0xc,%esp
    1587:	50                   	push   %eax
    1588:	e8 71 fd ff ff       	call   12fe <runcmd>
    158d:	83 c4 10             	add    $0x10,%esp
    break;
    1590:	90                   	nop
  }
  exit();
    1591:	e8 13 ee ff ff       	call   3a9 <exit>

00001596 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    1596:	55                   	push   %ebp
    1597:	89 e5                	mov    %esp,%ebp
    1599:	83 ec 04             	sub    $0x4,%esp
    159c:	8b 45 08             	mov    0x8(%ebp),%eax
    159f:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    15a2:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    15a6:	7e 0d                	jle    15b5 <isNameChar+0x1f>
    15a8:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    15ac:	7f 07                	jg     15b5 <isNameChar+0x1f>
    return 1;
    15ae:	b8 01 00 00 00       	mov    $0x1,%eax
    15b3:	eb 38                	jmp    15ed <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    15b5:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    15b9:	7e 0d                	jle    15c8 <isNameChar+0x32>
    15bb:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    15bf:	7f 07                	jg     15c8 <isNameChar+0x32>
    return 1;
    15c1:	b8 01 00 00 00       	mov    $0x1,%eax
    15c6:	eb 25                	jmp    15ed <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    15c8:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    15cc:	7e 0d                	jle    15db <isNameChar+0x45>
    15ce:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    15d2:	7f 07                	jg     15db <isNameChar+0x45>
    return 1;
    15d4:	b8 01 00 00 00       	mov    $0x1,%eax
    15d9:	eb 12                	jmp    15ed <isNameChar+0x57>
  if(ch == '_')
    15db:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    15df:	75 07                	jne    15e8 <isNameChar+0x52>
    return 1;
    15e1:	b8 01 00 00 00       	mov    $0x1,%eax
    15e6:	eb 05                	jmp    15ed <isNameChar+0x57>
  return 0;
    15e8:	b8 00 00 00 00       	mov    $0x0,%eax
}
    15ed:	c9                   	leave  
    15ee:	c3                   	ret    

000015ef <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    15ef:	55                   	push   %ebp
    15f0:	89 e5                	mov    %esp,%ebp
    15f2:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    15f5:	8b 45 08             	mov    0x8(%ebp),%eax
    15f8:	8b 40 04             	mov    0x4(%eax),%eax
    15fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    15fe:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    1605:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    160c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1613:	eb 1d                	jmp    1632 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    1615:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1618:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    161b:	01 d0                	add    %edx,%eax
    161d:	0f b6 00             	movzbl (%eax),%eax
    1620:	3c 3d                	cmp    $0x3d,%al
    1622:	75 0a                	jne    162e <runCalcmd+0x3f>
    {
      hasEqu++;
    1624:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    1628:	8b 45 ec             	mov    -0x14(%ebp),%eax
    162b:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    162e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1632:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1635:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1638:	01 d0                	add    %edx,%eax
    163a:	0f b6 00             	movzbl (%eax),%eax
    163d:	84 c0                	test   %al,%al
    163f:	75 d4                	jne    1615 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    1641:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1645:	7e 1d                	jle    1664 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    1647:	83 ec 0c             	sub    $0xc,%esp
    164a:	68 ec 37 00 00       	push   $0x37ec
    164f:	6a 00                	push   $0x0
    1651:	6a 00                	push   $0x0
    1653:	6a 01                	push   $0x1
    1655:	6a 04                	push   $0x4
    1657:	e8 21 17 00 00       	call   2d7d <color_printf>
    165c:	83 c4 20             	add    $0x20,%esp
    165f:	e9 78 05 00 00       	jmp    1bdc <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    1664:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1668:	0f 85 26 05 00 00    	jne    1b94 <runCalcmd+0x5a5>
  {
    int i=0;
    166e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    1675:	eb 04                	jmp    167b <runCalcmd+0x8c>
    {
      i++;
    1677:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    167b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    167e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1681:	01 d0                	add    %edx,%eax
    1683:	0f b6 00             	movzbl (%eax),%eax
    1686:	3c 20                	cmp    $0x20,%al
    1688:	74 ed                	je     1677 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    168a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    168d:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    1690:	eb 23                	jmp    16b5 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    1692:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1695:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1698:	01 d0                	add    %edx,%eax
    169a:	0f b6 00             	movzbl (%eax),%eax
    169d:	0f be c0             	movsbl %al,%eax
    16a0:	83 ec 0c             	sub    $0xc,%esp
    16a3:	50                   	push   %eax
    16a4:	e8 ed fe ff ff       	call   1596 <isNameChar>
    16a9:	83 c4 10             	add    $0x10,%esp
    16ac:	83 f8 01             	cmp    $0x1,%eax
    16af:	75 0e                	jne    16bf <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    16b1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    16b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16b8:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    16bb:	7c d5                	jl     1692 <runCalcmd+0xa3>
    16bd:	eb 01                	jmp    16c0 <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    16bf:	90                   	nop
    }
    int len = i-startIndex;
    16c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16c3:	2b 45 d0             	sub    -0x30(%ebp),%eax
    16c6:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    16c9:	eb 04                	jmp    16cf <runCalcmd+0xe0>
    {
      i++;
    16cb:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    16cf:	8b 55 e8             	mov    -0x18(%ebp),%edx
    16d2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16d5:	01 d0                	add    %edx,%eax
    16d7:	0f b6 00             	movzbl (%eax),%eax
    16da:	3c 20                	cmp    $0x20,%al
    16dc:	74 ed                	je     16cb <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    16de:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16e1:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    16e4:	0f 85 90 04 00 00    	jne    1b7a <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    16ea:	8b 55 d0             	mov    -0x30(%ebp),%edx
    16ed:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16f0:	01 d0                	add    %edx,%eax
    16f2:	0f b6 00             	movzbl (%eax),%eax
    16f5:	3c 2f                	cmp    $0x2f,%al
    16f7:	7e 2c                	jle    1725 <runCalcmd+0x136>
    16f9:	8b 55 d0             	mov    -0x30(%ebp),%edx
    16fc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16ff:	01 d0                	add    %edx,%eax
    1701:	0f b6 00             	movzbl (%eax),%eax
    1704:	3c 39                	cmp    $0x39,%al
    1706:	7f 1d                	jg     1725 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    1708:	83 ec 0c             	sub    $0xc,%esp
    170b:	68 08 38 00 00       	push   $0x3808
    1710:	6a 00                	push   $0x0
    1712:	6a 00                	push   $0x0
    1714:	6a 01                	push   $0x1
    1716:	6a 04                	push   $0x4
    1718:	e8 60 16 00 00       	call   2d7d <color_printf>
    171d:	83 c4 20             	add    $0x20,%esp
    1720:	e9 b7 04 00 00       	jmp    1bdc <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1725:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    172c:	eb 20                	jmp    174e <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    172e:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1731:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1734:	01 d0                	add    %edx,%eax
    1736:	89 c2                	mov    %eax,%edx
    1738:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    173b:	01 d0                	add    %edx,%eax
    173d:	0f b6 00             	movzbl (%eax),%eax
    1740:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1743:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1746:	01 ca                	add    %ecx,%edx
    1748:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    174a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    174e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1751:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1754:	7c d8                	jl     172e <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1756:	8d 55 94             	lea    -0x6c(%ebp),%edx
    1759:	8b 45 cc             	mov    -0x34(%ebp),%eax
    175c:	01 d0                	add    %edx,%eax
    175e:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    1761:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1764:	83 c0 01             	add    $0x1,%eax
    1767:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    176a:	eb 04                	jmp    1770 <runCalcmd+0x181>
        {
          i++;
    176c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    1770:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1773:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1776:	01 d0                	add    %edx,%eax
    1778:	0f b6 00             	movzbl (%eax),%eax
    177b:	3c 20                	cmp    $0x20,%al
    177d:	74 ed                	je     176c <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    177f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1782:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1785:	01 d0                	add    %edx,%eax
    1787:	0f b6 00             	movzbl (%eax),%eax
    178a:	3c 60                	cmp    $0x60,%al
    178c:	0f 85 e6 01 00 00    	jne    1978 <runCalcmd+0x389>
        {
          i++;
    1792:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    1796:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1799:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    179c:	eb 04                	jmp    17a2 <runCalcmd+0x1b3>
          {
            i++;
    179e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    17a2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    17a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17a8:	01 d0                	add    %edx,%eax
    17aa:	0f b6 00             	movzbl (%eax),%eax
    17ad:	3c 60                	cmp    $0x60,%al
    17af:	74 0f                	je     17c0 <runCalcmd+0x1d1>
    17b1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    17b4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17b7:	01 d0                	add    %edx,%eax
    17b9:	0f b6 00             	movzbl (%eax),%eax
    17bc:	84 c0                	test   %al,%al
    17be:	75 de                	jne    179e <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    17c0:	8b 55 e0             	mov    -0x20(%ebp),%edx
    17c3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17c6:	01 d0                	add    %edx,%eax
    17c8:	0f b6 00             	movzbl (%eax),%eax
    17cb:	3c 60                	cmp    $0x60,%al
    17cd:	0f 85 5c 01 00 00    	jne    192f <runCalcmd+0x340>
    17d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    17d6:	8d 50 01             	lea    0x1(%eax),%edx
    17d9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17dc:	01 d0                	add    %edx,%eax
    17de:	0f b6 00             	movzbl (%eax),%eax
    17e1:	84 c0                	test   %al,%al
    17e3:	0f 85 46 01 00 00    	jne    192f <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    17e9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    17ec:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17ef:	01 d0                	add    %edx,%eax
    17f1:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    17f4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    17f7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17fa:	01 d0                	add    %edx,%eax
    17fc:	83 ec 0c             	sub    $0xc,%esp
    17ff:	50                   	push   %eax
    1800:	e8 c5 04 00 00       	call   1cca <Compute>
    1805:	83 c4 10             	add    $0x10,%esp
    1808:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    180b:	dd 05 78 39 00 00    	fldl   0x3978
    1811:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1815:	dd 1c 24             	fstpl  (%esp)
    1818:	ff 75 c4             	pushl  -0x3c(%ebp)
    181b:	ff 75 c0             	pushl  -0x40(%ebp)
    181e:	e8 30 f8 ff ff       	call   1053 <isEqual>
    1823:	83 c4 10             	add    $0x10,%esp
    1826:	85 c0                	test   %eax,%eax
    1828:	0f 85 ad 03 00 00    	jne    1bdb <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    182e:	a1 cc 44 00 00       	mov    0x44cc,%eax
    1833:	85 c0                	test   %eax,%eax
    1835:	75 15                	jne    184c <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1837:	83 ec 08             	sub    $0x8,%esp
    183a:	68 cc 44 00 00       	push   $0x44cc
    183f:	68 00 45 00 00       	push   $0x4500
    1844:	e8 ba 19 00 00       	call   3203 <readVariables>
    1849:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    184c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1853:	eb 26                	jmp    187b <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1855:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1858:	c1 e0 05             	shl    $0x5,%eax
    185b:	05 00 45 00 00       	add    $0x4500,%eax
    1860:	8d 50 04             	lea    0x4(%eax),%edx
    1863:	83 ec 08             	sub    $0x8,%esp
    1866:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1869:	50                   	push   %eax
    186a:	52                   	push   %edx
    186b:	e8 38 e9 ff ff       	call   1a8 <strcmp>
    1870:	83 c4 10             	add    $0x10,%esp
    1873:	85 c0                	test   %eax,%eax
    1875:	74 10                	je     1887 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1877:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    187b:	a1 cc 44 00 00       	mov    0x44cc,%eax
    1880:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1883:	7c d0                	jl     1855 <runCalcmd+0x266>
    1885:	eb 01                	jmp    1888 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1887:	90                   	nop
              }
              if(index == v_num) //new variable
    1888:	a1 cc 44 00 00       	mov    0x44cc,%eax
    188d:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1890:	75 3c                	jne    18ce <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    1892:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1895:	c1 e0 05             	shl    $0x5,%eax
    1898:	05 00 45 00 00       	add    $0x4500,%eax
    189d:	8d 50 04             	lea    0x4(%eax),%edx
    18a0:	83 ec 08             	sub    $0x8,%esp
    18a3:	8d 45 94             	lea    -0x6c(%ebp),%eax
    18a6:	50                   	push   %eax
    18a7:	52                   	push   %edx
    18a8:	e8 cb e8 ff ff       	call   178 <strcpy>
    18ad:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    18b0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    18b3:	c1 e0 05             	shl    $0x5,%eax
    18b6:	05 00 45 00 00       	add    $0x4500,%eax
    18bb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    18c1:	a1 cc 44 00 00       	mov    0x44cc,%eax
    18c6:	83 c0 01             	add    $0x1,%eax
    18c9:	a3 cc 44 00 00       	mov    %eax,0x44cc
              }
              variables[index].value.dvalue = result;
    18ce:	8b 45 dc             	mov    -0x24(%ebp),%eax
    18d1:	c1 e0 05             	shl    $0x5,%eax
    18d4:	05 10 45 00 00       	add    $0x4510,%eax
    18d9:	dd 45 c0             	fldl   -0x40(%ebp)
    18dc:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    18df:	8b 45 dc             	mov    -0x24(%ebp),%eax
    18e2:	c1 e0 05             	shl    $0x5,%eax
    18e5:	05 10 45 00 00       	add    $0x4510,%eax
    18ea:	dd 40 08             	fldl   0x8(%eax)
    18ed:	8b 45 dc             	mov    -0x24(%ebp),%eax
    18f0:	c1 e0 05             	shl    $0x5,%eax
    18f3:	05 00 45 00 00       	add    $0x4500,%eax
    18f8:	83 c0 04             	add    $0x4,%eax
    18fb:	83 ec 0c             	sub    $0xc,%esp
    18fe:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1902:	dd 1c 24             	fstpl  (%esp)
    1905:	50                   	push   %eax
    1906:	68 32 38 00 00       	push   $0x3832
    190b:	6a 01                	push   $0x1
    190d:	e8 43 ed ff ff       	call   655 <printf>
    1912:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1915:	83 ec 08             	sub    $0x8,%esp
    1918:	68 cc 44 00 00       	push   $0x44cc
    191d:	68 00 45 00 00       	push   $0x4500
    1922:	e8 90 1b 00 00       	call   34b7 <writeVariables>
    1927:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    192a:	e9 ac 02 00 00       	jmp    1bdb <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    192f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1932:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1935:	01 d0                	add    %edx,%eax
    1937:	0f b6 00             	movzbl (%eax),%eax
    193a:	84 c0                	test   %al,%al
    193c:	75 1d                	jne    195b <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    193e:	83 ec 0c             	sub    $0xc,%esp
    1941:	68 39 38 00 00       	push   $0x3839
    1946:	6a 00                	push   $0x0
    1948:	6a 00                	push   $0x0
    194a:	6a 01                	push   $0x1
    194c:	6a 04                	push   $0x4
    194e:	e8 2a 14 00 00       	call   2d7d <color_printf>
    1953:	83 c4 20             	add    $0x20,%esp
    1956:	e9 81 02 00 00       	jmp    1bdc <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    195b:	83 ec 0c             	sub    $0xc,%esp
    195e:	68 50 38 00 00       	push   $0x3850
    1963:	6a 00                	push   $0x0
    1965:	6a 00                	push   $0x0
    1967:	6a 01                	push   $0x1
    1969:	6a 04                	push   $0x4
    196b:	e8 0d 14 00 00       	call   2d7d <color_printf>
    1970:	83 c4 20             	add    $0x20,%esp
    1973:	e9 64 02 00 00       	jmp    1bdc <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1978:	8b 55 e0             	mov    -0x20(%ebp),%edx
    197b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    197e:	01 d0                	add    %edx,%eax
    1980:	0f b6 00             	movzbl (%eax),%eax
    1983:	3c 22                	cmp    $0x22,%al
    1985:	0f 85 d5 01 00 00    	jne    1b60 <runCalcmd+0x571>
        {
          i++;
    198b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    198f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1992:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1995:	eb 04                	jmp    199b <runCalcmd+0x3ac>
          {
            i++;
    1997:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    199b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    199e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19a1:	01 d0                	add    %edx,%eax
    19a3:	0f b6 00             	movzbl (%eax),%eax
    19a6:	3c 22                	cmp    $0x22,%al
    19a8:	74 0f                	je     19b9 <runCalcmd+0x3ca>
    19aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19ad:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19b0:	01 d0                	add    %edx,%eax
    19b2:	0f b6 00             	movzbl (%eax),%eax
    19b5:	84 c0                	test   %al,%al
    19b7:	75 de                	jne    1997 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    19b9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19bc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19bf:	01 d0                	add    %edx,%eax
    19c1:	0f b6 00             	movzbl (%eax),%eax
    19c4:	3c 22                	cmp    $0x22,%al
    19c6:	0f 85 4e 01 00 00    	jne    1b1a <runCalcmd+0x52b>
    19cc:	8b 45 e0             	mov    -0x20(%ebp),%eax
    19cf:	8d 50 01             	lea    0x1(%eax),%edx
    19d2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19d5:	01 d0                	add    %edx,%eax
    19d7:	0f b6 00             	movzbl (%eax),%eax
    19da:	84 c0                	test   %al,%al
    19dc:	0f 85 38 01 00 00    	jne    1b1a <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    19e2:	a1 cc 44 00 00       	mov    0x44cc,%eax
    19e7:	85 c0                	test   %eax,%eax
    19e9:	75 15                	jne    1a00 <runCalcmd+0x411>
              readVariables(variables,&v_num);
    19eb:	83 ec 08             	sub    $0x8,%esp
    19ee:	68 cc 44 00 00       	push   $0x44cc
    19f3:	68 00 45 00 00       	push   $0x4500
    19f8:	e8 06 18 00 00       	call   3203 <readVariables>
    19fd:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1a00:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1a07:	eb 26                	jmp    1a2f <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    1a09:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a0c:	c1 e0 05             	shl    $0x5,%eax
    1a0f:	05 00 45 00 00       	add    $0x4500,%eax
    1a14:	8d 50 04             	lea    0x4(%eax),%edx
    1a17:	83 ec 08             	sub    $0x8,%esp
    1a1a:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1a1d:	50                   	push   %eax
    1a1e:	52                   	push   %edx
    1a1f:	e8 84 e7 ff ff       	call   1a8 <strcmp>
    1a24:	83 c4 10             	add    $0x10,%esp
    1a27:	85 c0                	test   %eax,%eax
    1a29:	74 10                	je     1a3b <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    1a2b:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1a2f:	a1 cc 44 00 00       	mov    0x44cc,%eax
    1a34:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1a37:	7c d0                	jl     1a09 <runCalcmd+0x41a>
    1a39:	eb 01                	jmp    1a3c <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    1a3b:	90                   	nop
            }
            if(index == v_num) //new variable
    1a3c:	a1 cc 44 00 00       	mov    0x44cc,%eax
    1a41:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1a44:	75 2b                	jne    1a71 <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1a46:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a49:	c1 e0 05             	shl    $0x5,%eax
    1a4c:	05 00 45 00 00       	add    $0x4500,%eax
    1a51:	8d 50 04             	lea    0x4(%eax),%edx
    1a54:	83 ec 08             	sub    $0x8,%esp
    1a57:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1a5a:	50                   	push   %eax
    1a5b:	52                   	push   %edx
    1a5c:	e8 17 e7 ff ff       	call   178 <strcpy>
    1a61:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1a64:	a1 cc 44 00 00       	mov    0x44cc,%eax
    1a69:	83 c0 01             	add    $0x1,%eax
    1a6c:	a3 cc 44 00 00       	mov    %eax,0x44cc
            }
            variables[index].type = V_STRING;
    1a71:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a74:	c1 e0 05             	shl    $0x5,%eax
    1a77:	05 00 45 00 00       	add    $0x4500,%eax
    1a7c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1a82:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1a85:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1a88:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1a8b:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1a8e:	83 c0 01             	add    $0x1,%eax
    1a91:	83 ec 0c             	sub    $0xc,%esp
    1a94:	50                   	push   %eax
    1a95:	e8 bd ee ff ff       	call   957 <malloc>
    1a9a:	83 c4 10             	add    $0x10,%esp
    1a9d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1aa0:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1aa3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1aa6:	01 d0                	add    %edx,%eax
    1aa8:	83 ec 08             	sub    $0x8,%esp
    1aab:	50                   	push   %eax
    1aac:	ff 75 b4             	pushl  -0x4c(%ebp)
    1aaf:	e8 c4 e6 ff ff       	call   178 <strcpy>
    1ab4:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1ab7:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1aba:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1abd:	01 d0                	add    %edx,%eax
    1abf:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1ac2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1ac5:	c1 e0 05             	shl    $0x5,%eax
    1ac8:	8d 90 18 45 00 00    	lea    0x4518(%eax),%edx
    1ace:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1ad1:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1ad3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1ad6:	c1 e0 05             	shl    $0x5,%eax
    1ad9:	05 18 45 00 00       	add    $0x4518,%eax
    1ade:	8b 00                	mov    (%eax),%eax
    1ae0:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1ae3:	c1 e2 05             	shl    $0x5,%edx
    1ae6:	81 c2 00 45 00 00    	add    $0x4500,%edx
    1aec:	83 c2 04             	add    $0x4,%edx
    1aef:	50                   	push   %eax
    1af0:	52                   	push   %edx
    1af1:	68 71 38 00 00       	push   $0x3871
    1af6:	6a 01                	push   $0x1
    1af8:	e8 58 eb ff ff       	call   655 <printf>
    1afd:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1b00:	83 ec 08             	sub    $0x8,%esp
    1b03:	68 cc 44 00 00       	push   $0x44cc
    1b08:	68 00 45 00 00       	push   $0x4500
    1b0d:	e8 a5 19 00 00       	call   34b7 <writeVariables>
    1b12:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1b15:	e9 c2 00 00 00       	jmp    1bdc <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1b1a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b1d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b20:	01 d0                	add    %edx,%eax
    1b22:	0f b6 00             	movzbl (%eax),%eax
    1b25:	84 c0                	test   %al,%al
    1b27:	75 1d                	jne    1b46 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1b29:	83 ec 0c             	sub    $0xc,%esp
    1b2c:	68 7a 38 00 00       	push   $0x387a
    1b31:	6a 00                	push   $0x0
    1b33:	6a 00                	push   $0x0
    1b35:	6a 01                	push   $0x1
    1b37:	6a 04                	push   $0x4
    1b39:	e8 3f 12 00 00       	call   2d7d <color_printf>
    1b3e:	83 c4 20             	add    $0x20,%esp
    1b41:	e9 96 00 00 00       	jmp    1bdc <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1b46:	83 ec 0c             	sub    $0xc,%esp
    1b49:	68 90 38 00 00       	push   $0x3890
    1b4e:	6a 00                	push   $0x0
    1b50:	6a 00                	push   $0x0
    1b52:	6a 01                	push   $0x1
    1b54:	6a 04                	push   $0x4
    1b56:	e8 22 12 00 00       	call   2d7d <color_printf>
    1b5b:	83 c4 20             	add    $0x20,%esp
    1b5e:	eb 7c                	jmp    1bdc <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1b60:	83 ec 0c             	sub    $0xc,%esp
    1b63:	68 b1 38 00 00       	push   $0x38b1
    1b68:	6a 00                	push   $0x0
    1b6a:	6a 00                	push   $0x0
    1b6c:	6a 01                	push   $0x1
    1b6e:	6a 04                	push   $0x4
    1b70:	e8 08 12 00 00       	call   2d7d <color_printf>
    1b75:	83 c4 20             	add    $0x20,%esp
    1b78:	eb 62                	jmp    1bdc <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1b7a:	83 ec 0c             	sub    $0xc,%esp
    1b7d:	68 b1 38 00 00       	push   $0x38b1
    1b82:	6a 00                	push   $0x0
    1b84:	6a 00                	push   $0x0
    1b86:	6a 01                	push   $0x1
    1b88:	6a 04                	push   $0x4
    1b8a:	e8 ee 11 00 00       	call   2d7d <color_printf>
    1b8f:	83 c4 20             	add    $0x20,%esp
    1b92:	eb 48                	jmp    1bdc <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1b94:	83 ec 0c             	sub    $0xc,%esp
    1b97:	ff 75 d4             	pushl  -0x2c(%ebp)
    1b9a:	e8 2b 01 00 00       	call   1cca <Compute>
    1b9f:	83 c4 10             	add    $0x10,%esp
    1ba2:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1ba5:	dd 05 78 39 00 00    	fldl   0x3978
    1bab:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1baf:	dd 1c 24             	fstpl  (%esp)
    1bb2:	ff 75 ac             	pushl  -0x54(%ebp)
    1bb5:	ff 75 a8             	pushl  -0x58(%ebp)
    1bb8:	e8 96 f4 ff ff       	call   1053 <isEqual>
    1bbd:	83 c4 10             	add    $0x10,%esp
    1bc0:	85 c0                	test   %eax,%eax
    1bc2:	75 18                	jne    1bdc <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1bc4:	ff 75 ac             	pushl  -0x54(%ebp)
    1bc7:	ff 75 a8             	pushl  -0x58(%ebp)
    1bca:	68 c9 38 00 00       	push   $0x38c9
    1bcf:	6a 01                	push   $0x1
    1bd1:	e8 7f ea ff ff       	call   655 <printf>
    1bd6:	83 c4 10             	add    $0x10,%esp
    1bd9:	eb 01                	jmp    1bdc <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1bdb:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1bdc:	e8 c8 e7 ff ff       	call   3a9 <exit>

00001be1 <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1be1:	55                   	push   %ebp
    1be2:	89 e5                	mov    %esp,%ebp
    1be4:	83 ec 04             	sub    $0x4,%esp
    1be7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bea:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1bed:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1bf1:	83 e8 23             	sub    $0x23,%eax
    1bf4:	83 f8 0c             	cmp    $0xc,%eax
    1bf7:	77 25                	ja     1c1e <GetLevel+0x3d>
    1bf9:	8b 04 85 d0 38 00 00 	mov    0x38d0(,%eax,4),%eax
    1c00:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1c02:	b8 01 00 00 00       	mov    $0x1,%eax
    1c07:	eb 1a                	jmp    1c23 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1c09:	b8 02 00 00 00       	mov    $0x2,%eax
    1c0e:	eb 13                	jmp    1c23 <GetLevel+0x42>
    case '(':
        return 0;
    1c10:	b8 00 00 00 00       	mov    $0x0,%eax
    1c15:	eb 0c                	jmp    1c23 <GetLevel+0x42>
    case '#':
        return -2;
    1c17:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1c1c:	eb 05                	jmp    1c23 <GetLevel+0x42>
    };
    return -1;
    1c1e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1c23:	c9                   	leave  
    1c24:	c3                   	ret    

00001c25 <Operate>:

double Operate(double a1, char op, double a2)
{
    1c25:	55                   	push   %ebp
    1c26:	89 e5                	mov    %esp,%ebp
    1c28:	83 ec 28             	sub    $0x28,%esp
    1c2b:	8b 45 10             	mov    0x10(%ebp),%eax
    1c2e:	8b 55 08             	mov    0x8(%ebp),%edx
    1c31:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1c34:	8b 55 0c             	mov    0xc(%ebp),%edx
    1c37:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1c3a:	88 45 ec             	mov    %al,-0x14(%ebp)
    1c3d:	8b 45 14             	mov    0x14(%ebp),%eax
    1c40:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1c43:	8b 45 18             	mov    0x18(%ebp),%eax
    1c46:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1c49:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1c4d:	83 f8 2b             	cmp    $0x2b,%eax
    1c50:	74 18                	je     1c6a <Operate+0x45>
    1c52:	83 f8 2b             	cmp    $0x2b,%eax
    1c55:	7f 07                	jg     1c5e <Operate+0x39>
    1c57:	83 f8 2a             	cmp    $0x2a,%eax
    1c5a:	74 1e                	je     1c7a <Operate+0x55>
    1c5c:	eb 68                	jmp    1cc6 <Operate+0xa1>
    1c5e:	83 f8 2d             	cmp    $0x2d,%eax
    1c61:	74 0f                	je     1c72 <Operate+0x4d>
    1c63:	83 f8 2f             	cmp    $0x2f,%eax
    1c66:	74 1a                	je     1c82 <Operate+0x5d>
    1c68:	eb 5c                	jmp    1cc6 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1c6a:	dd 45 f0             	fldl   -0x10(%ebp)
    1c6d:	dc 45 e0             	faddl  -0x20(%ebp)
    1c70:	eb 56                	jmp    1cc8 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1c72:	dd 45 f0             	fldl   -0x10(%ebp)
    1c75:	dc 65 e0             	fsubl  -0x20(%ebp)
    1c78:	eb 4e                	jmp    1cc8 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1c7a:	dd 45 f0             	fldl   -0x10(%ebp)
    1c7d:	dc 4d e0             	fmull  -0x20(%ebp)
    1c80:	eb 46                	jmp    1cc8 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1c82:	d9 ee                	fldz   
    1c84:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1c88:	dd 1c 24             	fstpl  (%esp)
    1c8b:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c8e:	ff 75 e0             	pushl  -0x20(%ebp)
    1c91:	e8 bd f3 ff ff       	call   1053 <isEqual>
    1c96:	83 c4 10             	add    $0x10,%esp
    1c99:	83 f8 01             	cmp    $0x1,%eax
    1c9c:	75 20                	jne    1cbe <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1c9e:	83 ec 0c             	sub    $0xc,%esp
    1ca1:	68 04 39 00 00       	push   $0x3904
    1ca6:	6a 00                	push   $0x0
    1ca8:	6a 00                	push   $0x0
    1caa:	6a 01                	push   $0x1
    1cac:	6a 04                	push   $0x4
    1cae:	e8 ca 10 00 00       	call   2d7d <color_printf>
    1cb3:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1cb6:	dd 05 78 39 00 00    	fldl   0x3978
    1cbc:	eb 0a                	jmp    1cc8 <Operate+0xa3>
        }
        else
          return a1 / a2;
    1cbe:	dd 45 f0             	fldl   -0x10(%ebp)
    1cc1:	dc 75 e0             	fdivl  -0x20(%ebp)
    1cc4:	eb 02                	jmp    1cc8 <Operate+0xa3>
    };
    return 1;
    1cc6:	d9 e8                	fld1   
}
    1cc8:	c9                   	leave  
    1cc9:	c3                   	ret    

00001cca <Compute>:

double Compute(char *s)
{
    1cca:	55                   	push   %ebp
    1ccb:	89 e5                	mov    %esp,%ebp
    1ccd:	53                   	push   %ebx
    1cce:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1cd4:	e8 44 14 00 00       	call   311d <dstack>
    1cd9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1cdc:	e8 73 13 00 00       	call   3054 <cstack>
    1ce1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1ce4:	83 ec 08             	sub    $0x8,%esp
    1ce7:	6a 23                	push   $0x23
    1ce9:	ff 75 e0             	pushl  -0x20(%ebp)
    1cec:	e8 91 13 00 00       	call   3082 <pushc>
    1cf1:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1cf4:	83 ec 0c             	sub    $0xc,%esp
    1cf7:	ff 75 08             	pushl  0x8(%ebp)
    1cfa:	e8 e8 e4 ff ff       	call   1e7 <strlen>
    1cff:	83 c4 10             	add    $0x10,%esp
    1d02:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1d05:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1d0c:	c7 05 e0 44 00 00 00 	movl   $0x0,0x44e0
    1d13:	00 00 00 
    1d16:	e9 58 05 00 00       	jmp    2273 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1d1b:	a1 e0 44 00 00       	mov    0x44e0,%eax
    1d20:	89 c2                	mov    %eax,%edx
    1d22:	8b 45 08             	mov    0x8(%ebp),%eax
    1d25:	01 d0                	add    %edx,%eax
    1d27:	0f b6 00             	movzbl (%eax),%eax
    1d2a:	3c 24                	cmp    $0x24,%al
    1d2c:	0f 85 f8 01 00 00    	jne    1f2a <Compute+0x260>
        {
          is_minus = 0;
    1d32:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1d39:	a1 e0 44 00 00       	mov    0x44e0,%eax
    1d3e:	83 c0 01             	add    $0x1,%eax
    1d41:	a3 e0 44 00 00       	mov    %eax,0x44e0
          if(s[g_pos] != '{')
    1d46:	a1 e0 44 00 00       	mov    0x44e0,%eax
    1d4b:	89 c2                	mov    %eax,%edx
    1d4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d50:	01 d0                	add    %edx,%eax
    1d52:	0f b6 00             	movzbl (%eax),%eax
    1d55:	3c 7b                	cmp    $0x7b,%al
    1d57:	74 23                	je     1d7c <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1d59:	83 ec 0c             	sub    $0xc,%esp
    1d5c:	68 1c 39 00 00       	push   $0x391c
    1d61:	6a 00                	push   $0x0
    1d63:	6a 00                	push   $0x0
    1d65:	6a 01                	push   $0x1
    1d67:	6a 04                	push   $0x4
    1d69:	e8 0f 10 00 00       	call   2d7d <color_printf>
    1d6e:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1d71:	dd 05 78 39 00 00    	fldl   0x3978
    1d77:	e9 24 06 00 00       	jmp    23a0 <Compute+0x6d6>
          }
          int i=g_pos+1;
    1d7c:	a1 e0 44 00 00       	mov    0x44e0,%eax
    1d81:	83 c0 01             	add    $0x1,%eax
    1d84:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1d87:	eb 13                	jmp    1d9c <Compute+0xd2>
          {
            if(s[i] == '}')
    1d89:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d8c:	8b 45 08             	mov    0x8(%ebp),%eax
    1d8f:	01 d0                	add    %edx,%eax
    1d91:	0f b6 00             	movzbl (%eax),%eax
    1d94:	3c 7d                	cmp    $0x7d,%al
    1d96:	74 0e                	je     1da6 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1d98:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1d9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d9f:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1da2:	7c e5                	jl     1d89 <Compute+0xbf>
    1da4:	eb 01                	jmp    1da7 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1da6:	90                   	nop
          }
          if(s[i] != '}')
    1da7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1daa:	8b 45 08             	mov    0x8(%ebp),%eax
    1dad:	01 d0                	add    %edx,%eax
    1daf:	0f b6 00             	movzbl (%eax),%eax
    1db2:	3c 7d                	cmp    $0x7d,%al
    1db4:	74 23                	je     1dd9 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1db6:	83 ec 0c             	sub    $0xc,%esp
    1db9:	68 2a 39 00 00       	push   $0x392a
    1dbe:	6a 00                	push   $0x0
    1dc0:	6a 00                	push   $0x0
    1dc2:	6a 01                	push   $0x1
    1dc4:	6a 04                	push   $0x4
    1dc6:	e8 b2 0f 00 00       	call   2d7d <color_printf>
    1dcb:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1dce:	dd 05 78 39 00 00    	fldl   0x3978
    1dd4:	e9 c7 05 00 00       	jmp    23a0 <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1dd9:	a1 e0 44 00 00       	mov    0x44e0,%eax
    1dde:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1de1:	29 c2                	sub    %eax,%edx
    1de3:	89 d0                	mov    %edx,%eax
    1de5:	83 e8 01             	sub    $0x1,%eax
    1de8:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1deb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1df2:	eb 27                	jmp    1e1b <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1df4:	8b 15 e0 44 00 00    	mov    0x44e0,%edx
    1dfa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1dfd:	01 d0                	add    %edx,%eax
    1dff:	8d 50 01             	lea    0x1(%eax),%edx
    1e02:	8b 45 08             	mov    0x8(%ebp),%eax
    1e05:	01 d0                	add    %edx,%eax
    1e07:	0f b6 00             	movzbl (%eax),%eax
    1e0a:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1e10:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1e13:	01 ca                	add    %ecx,%edx
    1e15:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1e17:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1e1b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1e1e:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1e21:	7c d1                	jl     1df4 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1e23:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1e29:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1e2c:	01 d0                	add    %edx,%eax
    1e2e:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1e31:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1e38:	a1 cc 44 00 00       	mov    0x44cc,%eax
    1e3d:	85 c0                	test   %eax,%eax
    1e3f:	75 40                	jne    1e81 <Compute+0x1b7>
            readVariables(variables,&v_num);
    1e41:	83 ec 08             	sub    $0x8,%esp
    1e44:	68 cc 44 00 00       	push   $0x44cc
    1e49:	68 00 45 00 00       	push   $0x4500
    1e4e:	e8 b0 13 00 00       	call   3203 <readVariables>
    1e53:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1e56:	eb 29                	jmp    1e81 <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1e58:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e5b:	c1 e0 05             	shl    $0x5,%eax
    1e5e:	05 00 45 00 00       	add    $0x4500,%eax
    1e63:	8d 50 04             	lea    0x4(%eax),%edx
    1e66:	83 ec 08             	sub    $0x8,%esp
    1e69:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1e6f:	50                   	push   %eax
    1e70:	52                   	push   %edx
    1e71:	e8 32 e3 ff ff       	call   1a8 <strcmp>
    1e76:	83 c4 10             	add    $0x10,%esp
    1e79:	85 c0                	test   %eax,%eax
    1e7b:	74 10                	je     1e8d <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1e7d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1e81:	a1 cc 44 00 00       	mov    0x44cc,%eax
    1e86:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1e89:	7c cd                	jl     1e58 <Compute+0x18e>
    1e8b:	eb 01                	jmp    1e8e <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1e8d:	90                   	nop
          }
          if(index == v_num) //no such variable
    1e8e:	a1 cc 44 00 00       	mov    0x44cc,%eax
    1e93:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1e96:	75 2a                	jne    1ec2 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1e98:	83 ec 08             	sub    $0x8,%esp
    1e9b:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1ea1:	50                   	push   %eax
    1ea2:	68 38 39 00 00       	push   $0x3938
    1ea7:	6a 00                	push   $0x0
    1ea9:	6a 00                	push   $0x0
    1eab:	6a 01                	push   $0x1
    1ead:	6a 04                	push   $0x4
    1eaf:	e8 c9 0e 00 00       	call   2d7d <color_printf>
    1eb4:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1eb7:	dd 05 78 39 00 00    	fldl   0x3978
    1ebd:	e9 de 04 00 00       	jmp    23a0 <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1ec2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ec5:	c1 e0 05             	shl    $0x5,%eax
    1ec8:	05 00 45 00 00       	add    $0x4500,%eax
    1ecd:	8b 00                	mov    (%eax),%eax
    1ecf:	83 f8 02             	cmp    $0x2,%eax
    1ed2:	75 23                	jne    1ef7 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1ed4:	83 ec 0c             	sub    $0xc,%esp
    1ed7:	68 52 39 00 00       	push   $0x3952
    1edc:	6a 00                	push   $0x0
    1ede:	6a 00                	push   $0x0
    1ee0:	6a 01                	push   $0x1
    1ee2:	6a 04                	push   $0x4
    1ee4:	e8 94 0e 00 00       	call   2d7d <color_printf>
    1ee9:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1eec:	dd 05 78 39 00 00    	fldl   0x3978
    1ef2:	e9 a9 04 00 00       	jmp    23a0 <Compute+0x6d6>
          }
          g_pos = i+1;
    1ef7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1efa:	83 c0 01             	add    $0x1,%eax
    1efd:	a3 e0 44 00 00       	mov    %eax,0x44e0
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    1f02:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f05:	c1 e0 05             	shl    $0x5,%eax
    1f08:	05 10 45 00 00       	add    $0x4510,%eax
    1f0d:	dd 40 08             	fldl   0x8(%eax)
    1f10:	83 ec 04             	sub    $0x4,%esp
    1f13:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1f17:	dd 1c 24             	fstpl  (%esp)
    1f1a:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f1d:	e8 2f 12 00 00       	call   3151 <pushd>
    1f22:	83 c4 10             	add    $0x10,%esp
    1f25:	e9 49 03 00 00       	jmp    2273 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    1f2a:	a1 e0 44 00 00       	mov    0x44e0,%eax
    1f2f:	89 c2                	mov    %eax,%edx
    1f31:	8b 45 08             	mov    0x8(%ebp),%eax
    1f34:	01 d0                	add    %edx,%eax
    1f36:	0f b6 00             	movzbl (%eax),%eax
    1f39:	3c 2d                	cmp    $0x2d,%al
    1f3b:	75 3f                	jne    1f7c <Compute+0x2b2>
    1f3d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1f41:	74 39                	je     1f7c <Compute+0x2b2>
        {
            pushd(opnd,0);
    1f43:	83 ec 04             	sub    $0x4,%esp
    1f46:	d9 ee                	fldz   
    1f48:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1f4c:	dd 1c 24             	fstpl  (%esp)
    1f4f:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f52:	e8 fa 11 00 00       	call   3151 <pushd>
    1f57:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    1f5a:	83 ec 08             	sub    $0x8,%esp
    1f5d:	6a 2d                	push   $0x2d
    1f5f:	ff 75 e0             	pushl  -0x20(%ebp)
    1f62:	e8 1b 11 00 00       	call   3082 <pushc>
    1f67:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    1f6a:	a1 e0 44 00 00       	mov    0x44e0,%eax
    1f6f:	83 c0 01             	add    $0x1,%eax
    1f72:	a3 e0 44 00 00       	mov    %eax,0x44e0
    1f77:	e9 f7 02 00 00       	jmp    2273 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    1f7c:	a1 e0 44 00 00       	mov    0x44e0,%eax
    1f81:	89 c2                	mov    %eax,%edx
    1f83:	8b 45 08             	mov    0x8(%ebp),%eax
    1f86:	01 d0                	add    %edx,%eax
    1f88:	0f b6 00             	movzbl (%eax),%eax
    1f8b:	3c 29                	cmp    $0x29,%al
    1f8d:	0f 85 01 01 00 00    	jne    2094 <Compute+0x3ca>
        {
            is_minus = 0;
    1f93:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    1f9a:	a1 e0 44 00 00       	mov    0x44e0,%eax
    1f9f:	83 c0 01             	add    $0x1,%eax
    1fa2:	a3 e0 44 00 00       	mov    %eax,0x44e0
            while (topc(optr) != '(')
    1fa7:	e9 bf 00 00 00       	jmp    206b <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    1fac:	83 ec 0c             	sub    $0xc,%esp
    1faf:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fb2:	e8 37 12 00 00       	call   31ee <topd>
    1fb7:	83 c4 10             	add    $0x10,%esp
    1fba:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    1fbd:	83 ec 0c             	sub    $0xc,%esp
    1fc0:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fc3:	e8 dd 11 00 00       	call   31a5 <popd>
    1fc8:	dd d8                	fstp   %st(0)
    1fca:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    1fcd:	83 ec 0c             	sub    $0xc,%esp
    1fd0:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fd3:	e8 16 12 00 00       	call   31ee <topd>
    1fd8:	83 c4 10             	add    $0x10,%esp
    1fdb:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    1fde:	83 ec 0c             	sub    $0xc,%esp
    1fe1:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fe4:	e8 bc 11 00 00       	call   31a5 <popd>
    1fe9:	dd d8                	fstp   %st(0)
    1feb:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    1fee:	83 ec 0c             	sub    $0xc,%esp
    1ff1:	ff 75 e0             	pushl  -0x20(%ebp)
    1ff4:	e8 11 11 00 00       	call   310a <topc>
    1ff9:	83 c4 10             	add    $0x10,%esp
    1ffc:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    1fff:	83 ec 0c             	sub    $0xc,%esp
    2002:	ff 75 e0             	pushl  -0x20(%ebp)
    2005:	e8 be 10 00 00       	call   30c8 <popc>
    200a:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    200d:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    2011:	83 ec 0c             	sub    $0xc,%esp
    2014:	ff 75 d4             	pushl  -0x2c(%ebp)
    2017:	ff 75 d0             	pushl  -0x30(%ebp)
    201a:	50                   	push   %eax
    201b:	ff 75 cc             	pushl  -0x34(%ebp)
    201e:	ff 75 c8             	pushl  -0x38(%ebp)
    2021:	e8 ff fb ff ff       	call   1c25 <Operate>
    2026:	83 c4 20             	add    $0x20,%esp
    2029:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    202c:	dd 05 78 39 00 00    	fldl   0x3978
    2032:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2036:	dd 1c 24             	fstpl  (%esp)
    2039:	ff 75 bc             	pushl  -0x44(%ebp)
    203c:	ff 75 b8             	pushl  -0x48(%ebp)
    203f:	e8 0f f0 ff ff       	call   1053 <isEqual>
    2044:	83 c4 10             	add    $0x10,%esp
    2047:	83 f8 01             	cmp    $0x1,%eax
    204a:	75 0b                	jne    2057 <Compute+0x38d>
                  return WRONG_ANS;
    204c:	dd 05 78 39 00 00    	fldl   0x3978
    2052:	e9 49 03 00 00       	jmp    23a0 <Compute+0x6d6>
                pushd(opnd,result);
    2057:	83 ec 04             	sub    $0x4,%esp
    205a:	ff 75 bc             	pushl  -0x44(%ebp)
    205d:	ff 75 b8             	pushl  -0x48(%ebp)
    2060:	ff 75 e4             	pushl  -0x1c(%ebp)
    2063:	e8 e9 10 00 00       	call   3151 <pushd>
    2068:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    206b:	83 ec 0c             	sub    $0xc,%esp
    206e:	ff 75 e0             	pushl  -0x20(%ebp)
    2071:	e8 94 10 00 00       	call   310a <topc>
    2076:	83 c4 10             	add    $0x10,%esp
    2079:	3c 28                	cmp    $0x28,%al
    207b:	0f 85 2b ff ff ff    	jne    1fac <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    2081:	83 ec 0c             	sub    $0xc,%esp
    2084:	ff 75 e0             	pushl  -0x20(%ebp)
    2087:	e8 3c 10 00 00       	call   30c8 <popc>
    208c:	83 c4 10             	add    $0x10,%esp
    208f:	e9 df 01 00 00       	jmp    2273 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    2094:	a1 e0 44 00 00       	mov    0x44e0,%eax
    2099:	89 c2                	mov    %eax,%edx
    209b:	8b 45 08             	mov    0x8(%ebp),%eax
    209e:	01 d0                	add    %edx,%eax
    20a0:	0f b6 00             	movzbl (%eax),%eax
    20a3:	3c 2f                	cmp    $0x2f,%al
    20a5:	7e 49                	jle    20f0 <Compute+0x426>
    20a7:	a1 e0 44 00 00       	mov    0x44e0,%eax
    20ac:	89 c2                	mov    %eax,%edx
    20ae:	8b 45 08             	mov    0x8(%ebp),%eax
    20b1:	01 d0                	add    %edx,%eax
    20b3:	0f b6 00             	movzbl (%eax),%eax
    20b6:	3c 39                	cmp    $0x39,%al
    20b8:	7f 36                	jg     20f0 <Compute+0x426>
        {
            is_minus = 0;
    20ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    20c1:	83 ec 08             	sub    $0x8,%esp
    20c4:	68 e0 44 00 00       	push   $0x44e0
    20c9:	ff 75 08             	pushl  0x8(%ebp)
    20cc:	e8 c3 eb ff ff       	call   c94 <Translation>
    20d1:	83 c4 10             	add    $0x10,%esp
    20d4:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    20d7:	83 ec 04             	sub    $0x4,%esp
    20da:	ff 75 b4             	pushl  -0x4c(%ebp)
    20dd:	ff 75 b0             	pushl  -0x50(%ebp)
    20e0:	ff 75 e4             	pushl  -0x1c(%ebp)
    20e3:	e8 69 10 00 00       	call   3151 <pushd>
    20e8:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    20eb:	e9 83 01 00 00       	jmp    2273 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    20f0:	a1 e0 44 00 00       	mov    0x44e0,%eax
    20f5:	89 c2                	mov    %eax,%edx
    20f7:	8b 45 08             	mov    0x8(%ebp),%eax
    20fa:	01 d0                	add    %edx,%eax
    20fc:	0f b6 00             	movzbl (%eax),%eax
    20ff:	3c 28                	cmp    $0x28,%al
    2101:	0f 85 f9 00 00 00    	jne    2200 <Compute+0x536>
        {
            is_minus = 1;
    2107:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    210e:	a1 e0 44 00 00       	mov    0x44e0,%eax
    2113:	89 c2                	mov    %eax,%edx
    2115:	8b 45 08             	mov    0x8(%ebp),%eax
    2118:	01 d0                	add    %edx,%eax
    211a:	0f b6 00             	movzbl (%eax),%eax
    211d:	0f be c0             	movsbl %al,%eax
    2120:	83 ec 08             	sub    $0x8,%esp
    2123:	50                   	push   %eax
    2124:	ff 75 e0             	pushl  -0x20(%ebp)
    2127:	e8 56 0f 00 00       	call   3082 <pushc>
    212c:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    212f:	a1 e0 44 00 00       	mov    0x44e0,%eax
    2134:	83 c0 01             	add    $0x1,%eax
    2137:	a3 e0 44 00 00       	mov    %eax,0x44e0
    213c:	e9 32 01 00 00       	jmp    2273 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    2141:	83 ec 0c             	sub    $0xc,%esp
    2144:	ff 75 e4             	pushl  -0x1c(%ebp)
    2147:	e8 a2 10 00 00       	call   31ee <topd>
    214c:	83 c4 10             	add    $0x10,%esp
    214f:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    2152:	83 ec 0c             	sub    $0xc,%esp
    2155:	ff 75 e4             	pushl  -0x1c(%ebp)
    2158:	e8 48 10 00 00       	call   31a5 <popd>
    215d:	dd d8                	fstp   %st(0)
    215f:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2162:	83 ec 0c             	sub    $0xc,%esp
    2165:	ff 75 e4             	pushl  -0x1c(%ebp)
    2168:	e8 81 10 00 00       	call   31ee <topd>
    216d:	83 c4 10             	add    $0x10,%esp
    2170:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    2173:	83 ec 0c             	sub    $0xc,%esp
    2176:	ff 75 e4             	pushl  -0x1c(%ebp)
    2179:	e8 27 10 00 00       	call   31a5 <popd>
    217e:	dd d8                	fstp   %st(0)
    2180:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    2183:	83 ec 0c             	sub    $0xc,%esp
    2186:	ff 75 e0             	pushl  -0x20(%ebp)
    2189:	e8 7c 0f 00 00       	call   310a <topc>
    218e:	83 c4 10             	add    $0x10,%esp
    2191:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    2194:	83 ec 0c             	sub    $0xc,%esp
    2197:	ff 75 e0             	pushl  -0x20(%ebp)
    219a:	e8 29 0f 00 00       	call   30c8 <popc>
    219f:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    21a2:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    21a6:	83 ec 0c             	sub    $0xc,%esp
    21a9:	ff 75 ac             	pushl  -0x54(%ebp)
    21ac:	ff 75 a8             	pushl  -0x58(%ebp)
    21af:	50                   	push   %eax
    21b0:	ff 75 a4             	pushl  -0x5c(%ebp)
    21b3:	ff 75 a0             	pushl  -0x60(%ebp)
    21b6:	e8 6a fa ff ff       	call   1c25 <Operate>
    21bb:	83 c4 20             	add    $0x20,%esp
    21be:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    21c1:	dd 05 78 39 00 00    	fldl   0x3978
    21c7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    21cb:	dd 1c 24             	fstpl  (%esp)
    21ce:	ff 75 94             	pushl  -0x6c(%ebp)
    21d1:	ff 75 90             	pushl  -0x70(%ebp)
    21d4:	e8 7a ee ff ff       	call   1053 <isEqual>
    21d9:	83 c4 10             	add    $0x10,%esp
    21dc:	83 f8 01             	cmp    $0x1,%eax
    21df:	75 0b                	jne    21ec <Compute+0x522>
                  return WRONG_ANS;
    21e1:	dd 05 78 39 00 00    	fldl   0x3978
    21e7:	e9 b4 01 00 00       	jmp    23a0 <Compute+0x6d6>
                pushd(opnd,result);
    21ec:	83 ec 04             	sub    $0x4,%esp
    21ef:	ff 75 94             	pushl  -0x6c(%ebp)
    21f2:	ff 75 90             	pushl  -0x70(%ebp)
    21f5:	ff 75 e4             	pushl  -0x1c(%ebp)
    21f8:	e8 54 0f 00 00       	call   3151 <pushd>
    21fd:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    2200:	a1 e0 44 00 00       	mov    0x44e0,%eax
    2205:	89 c2                	mov    %eax,%edx
    2207:	8b 45 08             	mov    0x8(%ebp),%eax
    220a:	01 d0                	add    %edx,%eax
    220c:	0f b6 00             	movzbl (%eax),%eax
    220f:	0f be c0             	movsbl %al,%eax
    2212:	83 ec 0c             	sub    $0xc,%esp
    2215:	50                   	push   %eax
    2216:	e8 c6 f9 ff ff       	call   1be1 <GetLevel>
    221b:	83 c4 10             	add    $0x10,%esp
    221e:	89 c3                	mov    %eax,%ebx
    2220:	83 ec 0c             	sub    $0xc,%esp
    2223:	ff 75 e0             	pushl  -0x20(%ebp)
    2226:	e8 df 0e 00 00       	call   310a <topc>
    222b:	83 c4 10             	add    $0x10,%esp
    222e:	0f be c0             	movsbl %al,%eax
    2231:	83 ec 0c             	sub    $0xc,%esp
    2234:	50                   	push   %eax
    2235:	e8 a7 f9 ff ff       	call   1be1 <GetLevel>
    223a:	83 c4 10             	add    $0x10,%esp
    223d:	39 c3                	cmp    %eax,%ebx
    223f:	0f 8e fc fe ff ff    	jle    2141 <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    2245:	a1 e0 44 00 00       	mov    0x44e0,%eax
    224a:	89 c2                	mov    %eax,%edx
    224c:	8b 45 08             	mov    0x8(%ebp),%eax
    224f:	01 d0                	add    %edx,%eax
    2251:	0f b6 00             	movzbl (%eax),%eax
    2254:	0f be c0             	movsbl %al,%eax
    2257:	83 ec 08             	sub    $0x8,%esp
    225a:	50                   	push   %eax
    225b:	ff 75 e0             	pushl  -0x20(%ebp)
    225e:	e8 1f 0e 00 00       	call   3082 <pushc>
    2263:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2266:	a1 e0 44 00 00       	mov    0x44e0,%eax
    226b:	83 c0 01             	add    $0x1,%eax
    226e:	a3 e0 44 00 00       	mov    %eax,0x44e0
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    2273:	a1 e0 44 00 00       	mov    0x44e0,%eax
    2278:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    227b:	0f 8c 9a fa ff ff    	jl     1d1b <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2281:	e9 da 00 00 00       	jmp    2360 <Compute+0x696>
    {
        double a2 = topd(opnd);
    2286:	83 ec 0c             	sub    $0xc,%esp
    2289:	ff 75 e4             	pushl  -0x1c(%ebp)
    228c:	e8 5d 0f 00 00       	call   31ee <topd>
    2291:	83 c4 10             	add    $0x10,%esp
    2294:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    2297:	83 ec 0c             	sub    $0xc,%esp
    229a:	ff 75 e4             	pushl  -0x1c(%ebp)
    229d:	e8 03 0f 00 00       	call   31a5 <popd>
    22a2:	dd d8                	fstp   %st(0)
    22a4:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    22a7:	83 ec 0c             	sub    $0xc,%esp
    22aa:	ff 75 e4             	pushl  -0x1c(%ebp)
    22ad:	e8 3c 0f 00 00       	call   31ee <topd>
    22b2:	83 c4 10             	add    $0x10,%esp
    22b5:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    22bb:	83 ec 0c             	sub    $0xc,%esp
    22be:	ff 75 e4             	pushl  -0x1c(%ebp)
    22c1:	e8 df 0e 00 00       	call   31a5 <popd>
    22c6:	dd d8                	fstp   %st(0)
    22c8:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    22cb:	83 ec 0c             	sub    $0xc,%esp
    22ce:	ff 75 e0             	pushl  -0x20(%ebp)
    22d1:	e8 34 0e 00 00       	call   310a <topc>
    22d6:	83 c4 10             	add    $0x10,%esp
    22d9:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    22df:	83 ec 0c             	sub    $0xc,%esp
    22e2:	ff 75 e0             	pushl  -0x20(%ebp)
    22e5:	e8 de 0d 00 00       	call   30c8 <popc>
    22ea:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    22ed:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    22f4:	83 ec 0c             	sub    $0xc,%esp
    22f7:	ff 75 84             	pushl  -0x7c(%ebp)
    22fa:	ff 75 80             	pushl  -0x80(%ebp)
    22fd:	50                   	push   %eax
    22fe:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    2304:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    230a:	e8 16 f9 ff ff       	call   1c25 <Operate>
    230f:	83 c4 20             	add    $0x20,%esp
    2312:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    2318:	dd 05 78 39 00 00    	fldl   0x3978
    231e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2322:	dd 1c 24             	fstpl  (%esp)
    2325:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    232b:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2331:	e8 1d ed ff ff       	call   1053 <isEqual>
    2336:	83 c4 10             	add    $0x10,%esp
    2339:	83 f8 01             	cmp    $0x1,%eax
    233c:	75 08                	jne    2346 <Compute+0x67c>
          return WRONG_ANS;
    233e:	dd 05 78 39 00 00    	fldl   0x3978
    2344:	eb 5a                	jmp    23a0 <Compute+0x6d6>
        pushd(opnd,result);
    2346:	83 ec 04             	sub    $0x4,%esp
    2349:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    234f:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2355:	ff 75 e4             	pushl  -0x1c(%ebp)
    2358:	e8 f4 0d 00 00       	call   3151 <pushd>
    235d:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2360:	83 ec 0c             	sub    $0xc,%esp
    2363:	ff 75 e0             	pushl  -0x20(%ebp)
    2366:	e8 9f 0d 00 00       	call   310a <topc>
    236b:	83 c4 10             	add    $0x10,%esp
    236e:	3c 23                	cmp    $0x23,%al
    2370:	0f 85 10 ff ff ff    	jne    2286 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    2376:	83 ec 0c             	sub    $0xc,%esp
    2379:	ff 75 e4             	pushl  -0x1c(%ebp)
    237c:	e8 94 e4 ff ff       	call   815 <free>
    2381:	83 c4 10             	add    $0x10,%esp
    free(optr);
    2384:	83 ec 0c             	sub    $0xc,%esp
    2387:	ff 75 e0             	pushl  -0x20(%ebp)
    238a:	e8 86 e4 ff ff       	call   815 <free>
    238f:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    2392:	83 ec 0c             	sub    $0xc,%esp
    2395:	ff 75 e4             	pushl  -0x1c(%ebp)
    2398:	e8 51 0e 00 00       	call   31ee <topd>
    239d:	83 c4 10             	add    $0x10,%esp
}
    23a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    23a3:	c9                   	leave  
    23a4:	c3                   	ret    

000023a5 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    23a5:	55                   	push   %ebp
    23a6:	89 e5                	mov    %esp,%ebp
    23a8:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    23ab:	8b 45 08             	mov    0x8(%ebp),%eax
    23ae:	8b 00                	mov    (%eax),%eax
    23b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    23b3:	eb 04                	jmp    23b9 <gettoken+0x14>
    s++;
    23b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    23b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23bc:	3b 45 0c             	cmp    0xc(%ebp),%eax
    23bf:	73 1e                	jae    23df <gettoken+0x3a>
    23c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23c4:	0f b6 00             	movzbl (%eax),%eax
    23c7:	0f be c0             	movsbl %al,%eax
    23ca:	83 ec 08             	sub    $0x8,%esp
    23cd:	50                   	push   %eax
    23ce:	68 94 44 00 00       	push   $0x4494
    23d3:	e8 50 de ff ff       	call   228 <strchr>
    23d8:	83 c4 10             	add    $0x10,%esp
    23db:	85 c0                	test   %eax,%eax
    23dd:	75 d6                	jne    23b5 <gettoken+0x10>
    s++;
  if(q)
    23df:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    23e3:	74 08                	je     23ed <gettoken+0x48>
    *q = s;
    23e5:	8b 45 10             	mov    0x10(%ebp),%eax
    23e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    23eb:	89 10                	mov    %edx,(%eax)
  ret = *s;
    23ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23f0:	0f b6 00             	movzbl (%eax),%eax
    23f3:	0f be c0             	movsbl %al,%eax
    23f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    23f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23fc:	0f b6 00             	movzbl (%eax),%eax
    23ff:	0f be c0             	movsbl %al,%eax
    2402:	83 f8 29             	cmp    $0x29,%eax
    2405:	7f 14                	jg     241b <gettoken+0x76>
    2407:	83 f8 28             	cmp    $0x28,%eax
    240a:	7d 28                	jge    2434 <gettoken+0x8f>
    240c:	85 c0                	test   %eax,%eax
    240e:	0f 84 94 00 00 00    	je     24a8 <gettoken+0x103>
    2414:	83 f8 26             	cmp    $0x26,%eax
    2417:	74 1b                	je     2434 <gettoken+0x8f>
    2419:	eb 3a                	jmp    2455 <gettoken+0xb0>
    241b:	83 f8 3e             	cmp    $0x3e,%eax
    241e:	74 1a                	je     243a <gettoken+0x95>
    2420:	83 f8 3e             	cmp    $0x3e,%eax
    2423:	7f 0a                	jg     242f <gettoken+0x8a>
    2425:	83 e8 3b             	sub    $0x3b,%eax
    2428:	83 f8 01             	cmp    $0x1,%eax
    242b:	77 28                	ja     2455 <gettoken+0xb0>
    242d:	eb 05                	jmp    2434 <gettoken+0x8f>
    242f:	83 f8 7c             	cmp    $0x7c,%eax
    2432:	75 21                	jne    2455 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    2434:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    2438:	eb 75                	jmp    24af <gettoken+0x10a>
  case '>':
    s++;
    243a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    243e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2441:	0f b6 00             	movzbl (%eax),%eax
    2444:	3c 3e                	cmp    $0x3e,%al
    2446:	75 63                	jne    24ab <gettoken+0x106>
      ret = '+';
    2448:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    244f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    2453:	eb 56                	jmp    24ab <gettoken+0x106>
  default:
    ret = 'a';
    2455:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    245c:	eb 04                	jmp    2462 <gettoken+0xbd>
      s++;
    245e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2462:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2465:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2468:	73 44                	jae    24ae <gettoken+0x109>
    246a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    246d:	0f b6 00             	movzbl (%eax),%eax
    2470:	0f be c0             	movsbl %al,%eax
    2473:	83 ec 08             	sub    $0x8,%esp
    2476:	50                   	push   %eax
    2477:	68 94 44 00 00       	push   $0x4494
    247c:	e8 a7 dd ff ff       	call   228 <strchr>
    2481:	83 c4 10             	add    $0x10,%esp
    2484:	85 c0                	test   %eax,%eax
    2486:	75 26                	jne    24ae <gettoken+0x109>
    2488:	8b 45 f4             	mov    -0xc(%ebp),%eax
    248b:	0f b6 00             	movzbl (%eax),%eax
    248e:	0f be c0             	movsbl %al,%eax
    2491:	83 ec 08             	sub    $0x8,%esp
    2494:	50                   	push   %eax
    2495:	68 9c 44 00 00       	push   $0x449c
    249a:	e8 89 dd ff ff       	call   228 <strchr>
    249f:	83 c4 10             	add    $0x10,%esp
    24a2:	85 c0                	test   %eax,%eax
    24a4:	74 b8                	je     245e <gettoken+0xb9>
      s++;
    break;
    24a6:	eb 06                	jmp    24ae <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    24a8:	90                   	nop
    24a9:	eb 04                	jmp    24af <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    24ab:	90                   	nop
    24ac:	eb 01                	jmp    24af <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    24ae:	90                   	nop
  }
  if(eq)
    24af:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    24b3:	74 0e                	je     24c3 <gettoken+0x11e>
    *eq = s;
    24b5:	8b 45 14             	mov    0x14(%ebp),%eax
    24b8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    24bb:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    24bd:	eb 04                	jmp    24c3 <gettoken+0x11e>
    s++;
    24bf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    24c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24c6:	3b 45 0c             	cmp    0xc(%ebp),%eax
    24c9:	73 1e                	jae    24e9 <gettoken+0x144>
    24cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24ce:	0f b6 00             	movzbl (%eax),%eax
    24d1:	0f be c0             	movsbl %al,%eax
    24d4:	83 ec 08             	sub    $0x8,%esp
    24d7:	50                   	push   %eax
    24d8:	68 94 44 00 00       	push   $0x4494
    24dd:	e8 46 dd ff ff       	call   228 <strchr>
    24e2:	83 c4 10             	add    $0x10,%esp
    24e5:	85 c0                	test   %eax,%eax
    24e7:	75 d6                	jne    24bf <gettoken+0x11a>
    s++;
  *ps = s;
    24e9:	8b 45 08             	mov    0x8(%ebp),%eax
    24ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
    24ef:	89 10                	mov    %edx,(%eax)
  return ret;
    24f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    24f4:	c9                   	leave  
    24f5:	c3                   	ret    

000024f6 <peek>:

int peek(char **ps, char *es, char *toks)
{
    24f6:	55                   	push   %ebp
    24f7:	89 e5                	mov    %esp,%ebp
    24f9:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    24fc:	8b 45 08             	mov    0x8(%ebp),%eax
    24ff:	8b 00                	mov    (%eax),%eax
    2501:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2504:	eb 04                	jmp    250a <peek+0x14>
    s++;
    2506:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    250a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    250d:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2510:	73 1e                	jae    2530 <peek+0x3a>
    2512:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2515:	0f b6 00             	movzbl (%eax),%eax
    2518:	0f be c0             	movsbl %al,%eax
    251b:	83 ec 08             	sub    $0x8,%esp
    251e:	50                   	push   %eax
    251f:	68 94 44 00 00       	push   $0x4494
    2524:	e8 ff dc ff ff       	call   228 <strchr>
    2529:	83 c4 10             	add    $0x10,%esp
    252c:	85 c0                	test   %eax,%eax
    252e:	75 d6                	jne    2506 <peek+0x10>
    s++;
  *ps = s;
    2530:	8b 45 08             	mov    0x8(%ebp),%eax
    2533:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2536:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    2538:	8b 45 f4             	mov    -0xc(%ebp),%eax
    253b:	0f b6 00             	movzbl (%eax),%eax
    253e:	84 c0                	test   %al,%al
    2540:	74 23                	je     2565 <peek+0x6f>
    2542:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2545:	0f b6 00             	movzbl (%eax),%eax
    2548:	0f be c0             	movsbl %al,%eax
    254b:	83 ec 08             	sub    $0x8,%esp
    254e:	50                   	push   %eax
    254f:	ff 75 10             	pushl  0x10(%ebp)
    2552:	e8 d1 dc ff ff       	call   228 <strchr>
    2557:	83 c4 10             	add    $0x10,%esp
    255a:	85 c0                	test   %eax,%eax
    255c:	74 07                	je     2565 <peek+0x6f>
    255e:	b8 01 00 00 00       	mov    $0x1,%eax
    2563:	eb 05                	jmp    256a <peek+0x74>
    2565:	b8 00 00 00 00       	mov    $0x0,%eax
}
    256a:	c9                   	leave  
    256b:	c3                   	ret    

0000256c <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    256c:	55                   	push   %ebp
    256d:	89 e5                	mov    %esp,%ebp
    256f:	53                   	push   %ebx
    2570:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    2573:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2576:	8b 45 08             	mov    0x8(%ebp),%eax
    2579:	83 ec 0c             	sub    $0xc,%esp
    257c:	50                   	push   %eax
    257d:	e8 65 dc ff ff       	call   1e7 <strlen>
    2582:	83 c4 10             	add    $0x10,%esp
    2585:	01 d8                	add    %ebx,%eax
    2587:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    258a:	8b 45 08             	mov    0x8(%ebp),%eax
    258d:	0f b6 00             	movzbl (%eax),%eax
    2590:	3c 25                	cmp    $0x25,%al
    2592:	75 5d                	jne    25f1 <parsecmd+0x85>
  {
    int len = strlen(s);
    2594:	8b 45 08             	mov    0x8(%ebp),%eax
    2597:	83 ec 0c             	sub    $0xc,%esp
    259a:	50                   	push   %eax
    259b:	e8 47 dc ff ff       	call   1e7 <strlen>
    25a0:	83 c4 10             	add    $0x10,%esp
    25a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    25a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    25a9:	83 ec 0c             	sub    $0xc,%esp
    25ac:	50                   	push   %eax
    25ad:	e8 a5 e3 ff ff       	call   957 <malloc>
    25b2:	83 c4 10             	add    $0x10,%esp
    25b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    25b8:	8b 45 08             	mov    0x8(%ebp),%eax
    25bb:	83 c0 01             	add    $0x1,%eax
    25be:	83 ec 08             	sub    $0x8,%esp
    25c1:	50                   	push   %eax
    25c2:	ff 75 ec             	pushl  -0x14(%ebp)
    25c5:	e8 ae db ff ff       	call   178 <strcpy>
    25ca:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    25cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    25d0:	8d 50 fe             	lea    -0x2(%eax),%edx
    25d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    25d6:	01 d0                	add    %edx,%eax
    25d8:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    25db:	83 ec 0c             	sub    $0xc,%esp
    25de:	ff 75 ec             	pushl  -0x14(%ebp)
    25e1:	e8 59 e9 ff ff       	call   f3f <calcmd>
    25e6:	83 c4 10             	add    $0x10,%esp
    25e9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    25ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
    25ef:	eb 6b                	jmp    265c <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    25f1:	83 ec 08             	sub    $0x8,%esp
    25f4:	ff 75 f4             	pushl  -0xc(%ebp)
    25f7:	8d 45 08             	lea    0x8(%ebp),%eax
    25fa:	50                   	push   %eax
    25fb:	e8 61 00 00 00       	call   2661 <parseline>
    2600:	83 c4 10             	add    $0x10,%esp
    2603:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    2606:	83 ec 04             	sub    $0x4,%esp
    2609:	68 80 39 00 00       	push   $0x3980
    260e:	ff 75 f4             	pushl  -0xc(%ebp)
    2611:	8d 45 08             	lea    0x8(%ebp),%eax
    2614:	50                   	push   %eax
    2615:	e8 dc fe ff ff       	call   24f6 <peek>
    261a:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    261d:	8b 45 08             	mov    0x8(%ebp),%eax
    2620:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2623:	74 26                	je     264b <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    2625:	8b 45 08             	mov    0x8(%ebp),%eax
    2628:	83 ec 04             	sub    $0x4,%esp
    262b:	50                   	push   %eax
    262c:	68 81 39 00 00       	push   $0x3981
    2631:	6a 02                	push   $0x2
    2633:	e8 1d e0 ff ff       	call   655 <printf>
    2638:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    263b:	83 ec 0c             	sub    $0xc,%esp
    263e:	68 90 39 00 00       	push   $0x3990
    2643:	e8 f2 e3 ff ff       	call   a3a <panic1>
    2648:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    264b:	83 ec 0c             	sub    $0xc,%esp
    264e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2651:	e8 eb 03 00 00       	call   2a41 <nulterminate>
    2656:	83 c4 10             	add    $0x10,%esp
  return cmd;
    2659:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    265c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    265f:	c9                   	leave  
    2660:	c3                   	ret    

00002661 <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    2661:	55                   	push   %ebp
    2662:	89 e5                	mov    %esp,%ebp
    2664:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    2667:	83 ec 08             	sub    $0x8,%esp
    266a:	ff 75 0c             	pushl  0xc(%ebp)
    266d:	ff 75 08             	pushl  0x8(%ebp)
    2670:	e8 99 00 00 00       	call   270e <parsepipe>
    2675:	83 c4 10             	add    $0x10,%esp
    2678:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    267b:	eb 23                	jmp    26a0 <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    267d:	6a 00                	push   $0x0
    267f:	6a 00                	push   $0x0
    2681:	ff 75 0c             	pushl  0xc(%ebp)
    2684:	ff 75 08             	pushl  0x8(%ebp)
    2687:	e8 19 fd ff ff       	call   23a5 <gettoken>
    268c:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    268f:	83 ec 0c             	sub    $0xc,%esp
    2692:	ff 75 f4             	pushl  -0xc(%ebp)
    2695:	e8 66 e8 ff ff       	call   f00 <backcmd>
    269a:	83 c4 10             	add    $0x10,%esp
    269d:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    26a0:	83 ec 04             	sub    $0x4,%esp
    26a3:	68 97 39 00 00       	push   $0x3997
    26a8:	ff 75 0c             	pushl  0xc(%ebp)
    26ab:	ff 75 08             	pushl  0x8(%ebp)
    26ae:	e8 43 fe ff ff       	call   24f6 <peek>
    26b3:	83 c4 10             	add    $0x10,%esp
    26b6:	85 c0                	test   %eax,%eax
    26b8:	75 c3                	jne    267d <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    26ba:	83 ec 04             	sub    $0x4,%esp
    26bd:	68 99 39 00 00       	push   $0x3999
    26c2:	ff 75 0c             	pushl  0xc(%ebp)
    26c5:	ff 75 08             	pushl  0x8(%ebp)
    26c8:	e8 29 fe ff ff       	call   24f6 <peek>
    26cd:	83 c4 10             	add    $0x10,%esp
    26d0:	85 c0                	test   %eax,%eax
    26d2:	74 35                	je     2709 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    26d4:	6a 00                	push   $0x0
    26d6:	6a 00                	push   $0x0
    26d8:	ff 75 0c             	pushl  0xc(%ebp)
    26db:	ff 75 08             	pushl  0x8(%ebp)
    26de:	e8 c2 fc ff ff       	call   23a5 <gettoken>
    26e3:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    26e6:	83 ec 08             	sub    $0x8,%esp
    26e9:	ff 75 0c             	pushl  0xc(%ebp)
    26ec:	ff 75 08             	pushl  0x8(%ebp)
    26ef:	e8 6d ff ff ff       	call   2661 <parseline>
    26f4:	83 c4 10             	add    $0x10,%esp
    26f7:	83 ec 08             	sub    $0x8,%esp
    26fa:	50                   	push   %eax
    26fb:	ff 75 f4             	pushl  -0xc(%ebp)
    26fe:	e8 b5 e7 ff ff       	call   eb8 <listcmd>
    2703:	83 c4 10             	add    $0x10,%esp
    2706:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2709:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    270c:	c9                   	leave  
    270d:	c3                   	ret    

0000270e <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    270e:	55                   	push   %ebp
    270f:	89 e5                	mov    %esp,%ebp
    2711:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    2714:	83 ec 08             	sub    $0x8,%esp
    2717:	ff 75 0c             	pushl  0xc(%ebp)
    271a:	ff 75 08             	pushl  0x8(%ebp)
    271d:	e8 ec 01 00 00       	call   290e <parseexec>
    2722:	83 c4 10             	add    $0x10,%esp
    2725:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    2728:	83 ec 04             	sub    $0x4,%esp
    272b:	68 9b 39 00 00       	push   $0x399b
    2730:	ff 75 0c             	pushl  0xc(%ebp)
    2733:	ff 75 08             	pushl  0x8(%ebp)
    2736:	e8 bb fd ff ff       	call   24f6 <peek>
    273b:	83 c4 10             	add    $0x10,%esp
    273e:	85 c0                	test   %eax,%eax
    2740:	74 35                	je     2777 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2742:	6a 00                	push   $0x0
    2744:	6a 00                	push   $0x0
    2746:	ff 75 0c             	pushl  0xc(%ebp)
    2749:	ff 75 08             	pushl  0x8(%ebp)
    274c:	e8 54 fc ff ff       	call   23a5 <gettoken>
    2751:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2754:	83 ec 08             	sub    $0x8,%esp
    2757:	ff 75 0c             	pushl  0xc(%ebp)
    275a:	ff 75 08             	pushl  0x8(%ebp)
    275d:	e8 ac ff ff ff       	call   270e <parsepipe>
    2762:	83 c4 10             	add    $0x10,%esp
    2765:	83 ec 08             	sub    $0x8,%esp
    2768:	50                   	push   %eax
    2769:	ff 75 f4             	pushl  -0xc(%ebp)
    276c:	e8 ff e6 ff ff       	call   e70 <pipecmd>
    2771:	83 c4 10             	add    $0x10,%esp
    2774:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2777:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    277a:	c9                   	leave  
    277b:	c3                   	ret    

0000277c <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    277c:	55                   	push   %ebp
    277d:	89 e5                	mov    %esp,%ebp
    277f:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2782:	e9 b6 00 00 00       	jmp    283d <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    2787:	6a 00                	push   $0x0
    2789:	6a 00                	push   $0x0
    278b:	ff 75 10             	pushl  0x10(%ebp)
    278e:	ff 75 0c             	pushl  0xc(%ebp)
    2791:	e8 0f fc ff ff       	call   23a5 <gettoken>
    2796:	83 c4 10             	add    $0x10,%esp
    2799:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    279c:	8d 45 ec             	lea    -0x14(%ebp),%eax
    279f:	50                   	push   %eax
    27a0:	8d 45 f0             	lea    -0x10(%ebp),%eax
    27a3:	50                   	push   %eax
    27a4:	ff 75 10             	pushl  0x10(%ebp)
    27a7:	ff 75 0c             	pushl  0xc(%ebp)
    27aa:	e8 f6 fb ff ff       	call   23a5 <gettoken>
    27af:	83 c4 10             	add    $0x10,%esp
    27b2:	83 f8 61             	cmp    $0x61,%eax
    27b5:	74 10                	je     27c7 <parseredirs+0x4b>
      panic1("missing file for redirection");
    27b7:	83 ec 0c             	sub    $0xc,%esp
    27ba:	68 9d 39 00 00       	push   $0x399d
    27bf:	e8 76 e2 ff ff       	call   a3a <panic1>
    27c4:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    27c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27ca:	83 f8 3c             	cmp    $0x3c,%eax
    27cd:	74 0c                	je     27db <parseredirs+0x5f>
    27cf:	83 f8 3e             	cmp    $0x3e,%eax
    27d2:	74 26                	je     27fa <parseredirs+0x7e>
    27d4:	83 f8 2b             	cmp    $0x2b,%eax
    27d7:	74 43                	je     281c <parseredirs+0xa0>
    27d9:	eb 62                	jmp    283d <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    27db:	8b 55 ec             	mov    -0x14(%ebp),%edx
    27de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27e1:	83 ec 0c             	sub    $0xc,%esp
    27e4:	6a 00                	push   $0x0
    27e6:	6a 00                	push   $0x0
    27e8:	52                   	push   %edx
    27e9:	50                   	push   %eax
    27ea:	ff 75 08             	pushl  0x8(%ebp)
    27ed:	e8 1b e6 ff ff       	call   e0d <redircmd>
    27f2:	83 c4 20             	add    $0x20,%esp
    27f5:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    27f8:	eb 43                	jmp    283d <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    27fa:	8b 55 ec             	mov    -0x14(%ebp),%edx
    27fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2800:	83 ec 0c             	sub    $0xc,%esp
    2803:	6a 01                	push   $0x1
    2805:	68 01 02 00 00       	push   $0x201
    280a:	52                   	push   %edx
    280b:	50                   	push   %eax
    280c:	ff 75 08             	pushl  0x8(%ebp)
    280f:	e8 f9 e5 ff ff       	call   e0d <redircmd>
    2814:	83 c4 20             	add    $0x20,%esp
    2817:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    281a:	eb 21                	jmp    283d <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    281c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    281f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2822:	83 ec 0c             	sub    $0xc,%esp
    2825:	6a 01                	push   $0x1
    2827:	68 01 02 00 00       	push   $0x201
    282c:	52                   	push   %edx
    282d:	50                   	push   %eax
    282e:	ff 75 08             	pushl  0x8(%ebp)
    2831:	e8 d7 e5 ff ff       	call   e0d <redircmd>
    2836:	83 c4 20             	add    $0x20,%esp
    2839:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    283c:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    283d:	83 ec 04             	sub    $0x4,%esp
    2840:	68 ba 39 00 00       	push   $0x39ba
    2845:	ff 75 10             	pushl  0x10(%ebp)
    2848:	ff 75 0c             	pushl  0xc(%ebp)
    284b:	e8 a6 fc ff ff       	call   24f6 <peek>
    2850:	83 c4 10             	add    $0x10,%esp
    2853:	85 c0                	test   %eax,%eax
    2855:	0f 85 2c ff ff ff    	jne    2787 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    285b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    285e:	c9                   	leave  
    285f:	c3                   	ret    

00002860 <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    2860:	55                   	push   %ebp
    2861:	89 e5                	mov    %esp,%ebp
    2863:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2866:	83 ec 04             	sub    $0x4,%esp
    2869:	68 bd 39 00 00       	push   $0x39bd
    286e:	ff 75 0c             	pushl  0xc(%ebp)
    2871:	ff 75 08             	pushl  0x8(%ebp)
    2874:	e8 7d fc ff ff       	call   24f6 <peek>
    2879:	83 c4 10             	add    $0x10,%esp
    287c:	85 c0                	test   %eax,%eax
    287e:	75 10                	jne    2890 <parseblock+0x30>
    panic1("parseblock");
    2880:	83 ec 0c             	sub    $0xc,%esp
    2883:	68 bf 39 00 00       	push   $0x39bf
    2888:	e8 ad e1 ff ff       	call   a3a <panic1>
    288d:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2890:	6a 00                	push   $0x0
    2892:	6a 00                	push   $0x0
    2894:	ff 75 0c             	pushl  0xc(%ebp)
    2897:	ff 75 08             	pushl  0x8(%ebp)
    289a:	e8 06 fb ff ff       	call   23a5 <gettoken>
    289f:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    28a2:	83 ec 08             	sub    $0x8,%esp
    28a5:	ff 75 0c             	pushl  0xc(%ebp)
    28a8:	ff 75 08             	pushl  0x8(%ebp)
    28ab:	e8 b1 fd ff ff       	call   2661 <parseline>
    28b0:	83 c4 10             	add    $0x10,%esp
    28b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    28b6:	83 ec 04             	sub    $0x4,%esp
    28b9:	68 ca 39 00 00       	push   $0x39ca
    28be:	ff 75 0c             	pushl  0xc(%ebp)
    28c1:	ff 75 08             	pushl  0x8(%ebp)
    28c4:	e8 2d fc ff ff       	call   24f6 <peek>
    28c9:	83 c4 10             	add    $0x10,%esp
    28cc:	85 c0                	test   %eax,%eax
    28ce:	75 10                	jne    28e0 <parseblock+0x80>
    panic1("syntax - missing )");
    28d0:	83 ec 0c             	sub    $0xc,%esp
    28d3:	68 cc 39 00 00       	push   $0x39cc
    28d8:	e8 5d e1 ff ff       	call   a3a <panic1>
    28dd:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    28e0:	6a 00                	push   $0x0
    28e2:	6a 00                	push   $0x0
    28e4:	ff 75 0c             	pushl  0xc(%ebp)
    28e7:	ff 75 08             	pushl  0x8(%ebp)
    28ea:	e8 b6 fa ff ff       	call   23a5 <gettoken>
    28ef:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    28f2:	83 ec 04             	sub    $0x4,%esp
    28f5:	ff 75 0c             	pushl  0xc(%ebp)
    28f8:	ff 75 08             	pushl  0x8(%ebp)
    28fb:	ff 75 f4             	pushl  -0xc(%ebp)
    28fe:	e8 79 fe ff ff       	call   277c <parseredirs>
    2903:	83 c4 10             	add    $0x10,%esp
    2906:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    2909:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    290c:	c9                   	leave  
    290d:	c3                   	ret    

0000290e <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    290e:	55                   	push   %ebp
    290f:	89 e5                	mov    %esp,%ebp
    2911:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    2914:	83 ec 04             	sub    $0x4,%esp
    2917:	68 bd 39 00 00       	push   $0x39bd
    291c:	ff 75 0c             	pushl  0xc(%ebp)
    291f:	ff 75 08             	pushl  0x8(%ebp)
    2922:	e8 cf fb ff ff       	call   24f6 <peek>
    2927:	83 c4 10             	add    $0x10,%esp
    292a:	85 c0                	test   %eax,%eax
    292c:	74 16                	je     2944 <parseexec+0x36>
    return parseblock(ps, es);
    292e:	83 ec 08             	sub    $0x8,%esp
    2931:	ff 75 0c             	pushl  0xc(%ebp)
    2934:	ff 75 08             	pushl  0x8(%ebp)
    2937:	e8 24 ff ff ff       	call   2860 <parseblock>
    293c:	83 c4 10             	add    $0x10,%esp
    293f:	e9 fb 00 00 00       	jmp    2a3f <parseexec+0x131>

  ret = execcmd();
    2944:	e8 8e e4 ff ff       	call   dd7 <execcmd>
    2949:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    294c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    294f:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2952:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2959:	83 ec 04             	sub    $0x4,%esp
    295c:	ff 75 0c             	pushl  0xc(%ebp)
    295f:	ff 75 08             	pushl  0x8(%ebp)
    2962:	ff 75 f0             	pushl  -0x10(%ebp)
    2965:	e8 12 fe ff ff       	call   277c <parseredirs>
    296a:	83 c4 10             	add    $0x10,%esp
    296d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    2970:	e9 87 00 00 00       	jmp    29fc <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2975:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2978:	50                   	push   %eax
    2979:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    297c:	50                   	push   %eax
    297d:	ff 75 0c             	pushl  0xc(%ebp)
    2980:	ff 75 08             	pushl  0x8(%ebp)
    2983:	e8 1d fa ff ff       	call   23a5 <gettoken>
    2988:	83 c4 10             	add    $0x10,%esp
    298b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    298e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2992:	0f 84 84 00 00 00    	je     2a1c <parseexec+0x10e>
      break;
    if(tok != 'a')
    2998:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    299c:	74 10                	je     29ae <parseexec+0xa0>
      panic1("syntax");
    299e:	83 ec 0c             	sub    $0xc,%esp
    29a1:	68 90 39 00 00       	push   $0x3990
    29a6:	e8 8f e0 ff ff       	call   a3a <panic1>
    29ab:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    29ae:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    29b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29b4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29b7:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    29bb:	8b 55 e0             	mov    -0x20(%ebp),%edx
    29be:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29c1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    29c4:	83 c1 08             	add    $0x8,%ecx
    29c7:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    29cb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    29cf:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    29d3:	7e 10                	jle    29e5 <parseexec+0xd7>
      panic1("too many args");
    29d5:	83 ec 0c             	sub    $0xc,%esp
    29d8:	68 df 39 00 00       	push   $0x39df
    29dd:	e8 58 e0 ff ff       	call   a3a <panic1>
    29e2:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    29e5:	83 ec 04             	sub    $0x4,%esp
    29e8:	ff 75 0c             	pushl  0xc(%ebp)
    29eb:	ff 75 08             	pushl  0x8(%ebp)
    29ee:	ff 75 f0             	pushl  -0x10(%ebp)
    29f1:	e8 86 fd ff ff       	call   277c <parseredirs>
    29f6:	83 c4 10             	add    $0x10,%esp
    29f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    29fc:	83 ec 04             	sub    $0x4,%esp
    29ff:	68 ed 39 00 00       	push   $0x39ed
    2a04:	ff 75 0c             	pushl  0xc(%ebp)
    2a07:	ff 75 08             	pushl  0x8(%ebp)
    2a0a:	e8 e7 fa ff ff       	call   24f6 <peek>
    2a0f:	83 c4 10             	add    $0x10,%esp
    2a12:	85 c0                	test   %eax,%eax
    2a14:	0f 84 5b ff ff ff    	je     2975 <parseexec+0x67>
    2a1a:	eb 01                	jmp    2a1d <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    2a1c:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    2a1d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a20:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a23:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    2a2a:	00 
  cmd->eargv[argc] = 0;
    2a2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a2e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a31:	83 c2 08             	add    $0x8,%edx
    2a34:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    2a3b:	00 
  return ret;
    2a3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2a3f:	c9                   	leave  
    2a40:	c3                   	ret    

00002a41 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2a41:	55                   	push   %ebp
    2a42:	89 e5                	mov    %esp,%ebp
    2a44:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2a47:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2a4b:	75 0a                	jne    2a57 <nulterminate+0x16>
    return 0;
    2a4d:	b8 00 00 00 00       	mov    $0x0,%eax
    2a52:	e9 e4 00 00 00       	jmp    2b3b <nulterminate+0xfa>
  
  switch(cmd->type){
    2a57:	8b 45 08             	mov    0x8(%ebp),%eax
    2a5a:	8b 00                	mov    (%eax),%eax
    2a5c:	83 f8 05             	cmp    $0x5,%eax
    2a5f:	0f 87 d3 00 00 00    	ja     2b38 <nulterminate+0xf7>
    2a65:	8b 04 85 f4 39 00 00 	mov    0x39f4(,%eax,4),%eax
    2a6c:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2a6e:	8b 45 08             	mov    0x8(%ebp),%eax
    2a71:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2a74:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a7b:	eb 14                	jmp    2a91 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2a7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a80:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a83:	83 c2 08             	add    $0x8,%edx
    2a86:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2a8a:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2a8d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2a91:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a94:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a97:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2a9b:	85 c0                	test   %eax,%eax
    2a9d:	75 de                	jne    2a7d <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2a9f:	e9 94 00 00 00       	jmp    2b38 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2aa4:	8b 45 08             	mov    0x8(%ebp),%eax
    2aa7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2aaa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2aad:	8b 40 04             	mov    0x4(%eax),%eax
    2ab0:	83 ec 0c             	sub    $0xc,%esp
    2ab3:	50                   	push   %eax
    2ab4:	e8 88 ff ff ff       	call   2a41 <nulterminate>
    2ab9:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2abc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2abf:	8b 40 0c             	mov    0xc(%eax),%eax
    2ac2:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2ac5:	eb 71                	jmp    2b38 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2ac7:	8b 45 08             	mov    0x8(%ebp),%eax
    2aca:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2acd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ad0:	8b 40 04             	mov    0x4(%eax),%eax
    2ad3:	83 ec 0c             	sub    $0xc,%esp
    2ad6:	50                   	push   %eax
    2ad7:	e8 65 ff ff ff       	call   2a41 <nulterminate>
    2adc:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2adf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ae2:	8b 40 08             	mov    0x8(%eax),%eax
    2ae5:	83 ec 0c             	sub    $0xc,%esp
    2ae8:	50                   	push   %eax
    2ae9:	e8 53 ff ff ff       	call   2a41 <nulterminate>
    2aee:	83 c4 10             	add    $0x10,%esp
    break;
    2af1:	eb 45                	jmp    2b38 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2af3:	8b 45 08             	mov    0x8(%ebp),%eax
    2af6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2af9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2afc:	8b 40 04             	mov    0x4(%eax),%eax
    2aff:	83 ec 0c             	sub    $0xc,%esp
    2b02:	50                   	push   %eax
    2b03:	e8 39 ff ff ff       	call   2a41 <nulterminate>
    2b08:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2b0b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b0e:	8b 40 08             	mov    0x8(%eax),%eax
    2b11:	83 ec 0c             	sub    $0xc,%esp
    2b14:	50                   	push   %eax
    2b15:	e8 27 ff ff ff       	call   2a41 <nulterminate>
    2b1a:	83 c4 10             	add    $0x10,%esp
    break;
    2b1d:	eb 19                	jmp    2b38 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2b1f:	8b 45 08             	mov    0x8(%ebp),%eax
    2b22:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2b25:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2b28:	8b 40 04             	mov    0x4(%eax),%eax
    2b2b:	83 ec 0c             	sub    $0xc,%esp
    2b2e:	50                   	push   %eax
    2b2f:	e8 0d ff ff ff       	call   2a41 <nulterminate>
    2b34:	83 c4 10             	add    $0x10,%esp
    break;
    2b37:	90                   	nop
  }
  return cmd;
    2b38:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2b3b:	c9                   	leave  
    2b3c:	c3                   	ret    

00002b3d <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2b3d:	55                   	push   %ebp
    2b3e:	89 e5                	mov    %esp,%ebp
    2b40:	83 ec 18             	sub    $0x18,%esp
    2b43:	8b 45 08             	mov    0x8(%ebp),%eax
    2b46:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2b49:	83 ec 08             	sub    $0x8,%esp
    2b4c:	ff 75 18             	pushl  0x18(%ebp)
    2b4f:	ff 75 14             	pushl  0x14(%ebp)
    2b52:	ff 75 10             	pushl  0x10(%ebp)
    2b55:	ff 75 0c             	pushl  0xc(%ebp)
    2b58:	6a 01                	push   $0x1
    2b5a:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2b5d:	50                   	push   %eax
    2b5e:	e8 e6 d8 ff ff       	call   449 <colorwrite>
    2b63:	83 c4 20             	add    $0x20,%esp
}
    2b66:	90                   	nop
    2b67:	c9                   	leave  
    2b68:	c3                   	ret    

00002b69 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2b69:	55                   	push   %ebp
    2b6a:	89 e5                	mov    %esp,%ebp
    2b6c:	53                   	push   %ebx
    2b6d:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2b70:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2b77:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2b7b:	74 17                	je     2b94 <color_printint+0x2b>
    2b7d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2b81:	79 11                	jns    2b94 <color_printint+0x2b>
    neg = 1;
    2b83:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2b8a:	8b 45 08             	mov    0x8(%ebp),%eax
    2b8d:	f7 d8                	neg    %eax
    2b8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b92:	eb 06                	jmp    2b9a <color_printint+0x31>
  } else {
    x = xx;
    2b94:	8b 45 08             	mov    0x8(%ebp),%eax
    2b97:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2b9a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2ba1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2ba4:	8d 41 01             	lea    0x1(%ecx),%eax
    2ba7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2baa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2bad:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2bb0:	ba 00 00 00 00       	mov    $0x0,%edx
    2bb5:	f7 f3                	div    %ebx
    2bb7:	89 d0                	mov    %edx,%eax
    2bb9:	0f b6 80 a4 44 00 00 	movzbl 0x44a4(%eax),%eax
    2bc0:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2bc4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2bc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2bca:	ba 00 00 00 00       	mov    $0x0,%edx
    2bcf:	f7 f3                	div    %ebx
    2bd1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2bd4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2bd8:	75 c7                	jne    2ba1 <color_printint+0x38>
  if(neg)
    2bda:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2bde:	74 36                	je     2c16 <color_printint+0xad>
    buf[i++] = '-';
    2be0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2be3:	8d 50 01             	lea    0x1(%eax),%edx
    2be6:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2be9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2bee:	eb 26                	jmp    2c16 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2bf0:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2bf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bf6:	01 d0                	add    %edx,%eax
    2bf8:	0f b6 00             	movzbl (%eax),%eax
    2bfb:	0f be c0             	movsbl %al,%eax
    2bfe:	83 ec 0c             	sub    $0xc,%esp
    2c01:	ff 75 20             	pushl  0x20(%ebp)
    2c04:	ff 75 1c             	pushl  0x1c(%ebp)
    2c07:	ff 75 18             	pushl  0x18(%ebp)
    2c0a:	ff 75 14             	pushl  0x14(%ebp)
    2c0d:	50                   	push   %eax
    2c0e:	e8 2a ff ff ff       	call   2b3d <color_putc>
    2c13:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2c16:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2c1a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2c1e:	79 d0                	jns    2bf0 <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2c20:	90                   	nop
    2c21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c24:	c9                   	leave  
    2c25:	c3                   	ret    

00002c26 <getInteger>:

static int getInteger(double num)
{
    2c26:	55                   	push   %ebp
    2c27:	89 e5                	mov    %esp,%ebp
    2c29:	83 ec 18             	sub    $0x18,%esp
    2c2c:	8b 45 08             	mov    0x8(%ebp),%eax
    2c2f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2c32:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c35:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2c38:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2c3f:	eb 0e                	jmp    2c4f <getInteger+0x29>
  {
    num -= 1;
    2c41:	dd 45 e8             	fldl   -0x18(%ebp)
    2c44:	d9 e8                	fld1   
    2c46:	de e9                	fsubrp %st,%st(1)
    2c48:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2c4b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2c4f:	dd 45 e8             	fldl   -0x18(%ebp)
    2c52:	d9 e8                	fld1   
    2c54:	d9 c9                	fxch   %st(1)
    2c56:	df e9                	fucomip %st(1),%st
    2c58:	dd d8                	fstp   %st(0)
    2c5a:	77 e5                	ja     2c41 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2c5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2c5f:	c9                   	leave  
    2c60:	c3                   	ret    

00002c61 <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2c61:	55                   	push   %ebp
    2c62:	89 e5                	mov    %esp,%ebp
    2c64:	83 ec 28             	sub    $0x28,%esp
    2c67:	8b 45 08             	mov    0x8(%ebp),%eax
    2c6a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2c6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c70:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2c73:	d9 ee                	fldz   
    2c75:	dd 45 e0             	fldl   -0x20(%ebp)
    2c78:	d9 c9                	fxch   %st(1)
    2c7a:	df e9                	fucomip %st(1),%st
    2c7c:	dd d8                	fstp   %st(0)
    2c7e:	76 21                	jbe    2ca1 <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2c80:	83 ec 0c             	sub    $0xc,%esp
    2c83:	ff 75 1c             	pushl  0x1c(%ebp)
    2c86:	ff 75 18             	pushl  0x18(%ebp)
    2c89:	ff 75 14             	pushl  0x14(%ebp)
    2c8c:	ff 75 10             	pushl  0x10(%ebp)
    2c8f:	6a 2d                	push   $0x2d
    2c91:	e8 a7 fe ff ff       	call   2b3d <color_putc>
    2c96:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2c99:	dd 45 e0             	fldl   -0x20(%ebp)
    2c9c:	d9 e0                	fchs   
    2c9e:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2ca1:	83 ec 08             	sub    $0x8,%esp
    2ca4:	ff 75 e4             	pushl  -0x1c(%ebp)
    2ca7:	ff 75 e0             	pushl  -0x20(%ebp)
    2caa:	e8 77 ff ff ff       	call   2c26 <getInteger>
    2caf:	83 c4 10             	add    $0x10,%esp
    2cb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2cb5:	83 ec 04             	sub    $0x4,%esp
    2cb8:	ff 75 1c             	pushl  0x1c(%ebp)
    2cbb:	ff 75 18             	pushl  0x18(%ebp)
    2cbe:	ff 75 14             	pushl  0x14(%ebp)
    2cc1:	ff 75 10             	pushl  0x10(%ebp)
    2cc4:	6a 01                	push   $0x1
    2cc6:	6a 0a                	push   $0xa
    2cc8:	ff 75 f0             	pushl  -0x10(%ebp)
    2ccb:	e8 99 fe ff ff       	call   2b69 <color_printint>
    2cd0:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2cd3:	db 45 f0             	fildl  -0x10(%ebp)
    2cd6:	dd 45 e0             	fldl   -0x20(%ebp)
    2cd9:	de e1                	fsubp  %st,%st(1)
    2cdb:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2cde:	dd 45 e0             	fldl   -0x20(%ebp)
    2ce1:	dd 05 18 3a 00 00    	fldl   0x3a18
    2ce7:	d9 c9                	fxch   %st(1)
    2ce9:	df e9                	fucomip %st(1),%st
    2ceb:	dd d8                	fstp   %st(0)
    2ced:	76 19                	jbe    2d08 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2cef:	83 ec 0c             	sub    $0xc,%esp
    2cf2:	ff 75 1c             	pushl  0x1c(%ebp)
    2cf5:	ff 75 18             	pushl  0x18(%ebp)
    2cf8:	ff 75 14             	pushl  0x14(%ebp)
    2cfb:	ff 75 10             	pushl  0x10(%ebp)
    2cfe:	6a 2e                	push   $0x2e
    2d00:	e8 38 fe ff ff       	call   2b3d <color_putc>
    2d05:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2d08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2d0f:	eb 55                	jmp    2d66 <color_printdbl+0x105>
  {
    num = num*10;
    2d11:	dd 45 e0             	fldl   -0x20(%ebp)
    2d14:	dd 05 20 3a 00 00    	fldl   0x3a20
    2d1a:	de c9                	fmulp  %st,%st(1)
    2d1c:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2d1f:	83 ec 08             	sub    $0x8,%esp
    2d22:	ff 75 e4             	pushl  -0x1c(%ebp)
    2d25:	ff 75 e0             	pushl  -0x20(%ebp)
    2d28:	e8 f9 fe ff ff       	call   2c26 <getInteger>
    2d2d:	83 c4 10             	add    $0x10,%esp
    2d30:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2d33:	83 ec 04             	sub    $0x4,%esp
    2d36:	ff 75 1c             	pushl  0x1c(%ebp)
    2d39:	ff 75 18             	pushl  0x18(%ebp)
    2d3c:	ff 75 14             	pushl  0x14(%ebp)
    2d3f:	ff 75 10             	pushl  0x10(%ebp)
    2d42:	6a 01                	push   $0x1
    2d44:	6a 0a                	push   $0xa
    2d46:	ff 75 f0             	pushl  -0x10(%ebp)
    2d49:	e8 1b fe ff ff       	call   2b69 <color_printint>
    2d4e:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2d51:	db 45 f0             	fildl  -0x10(%ebp)
    2d54:	dd 45 e0             	fldl   -0x20(%ebp)
    2d57:	de e1                	fsubp  %st,%st(1)
    2d59:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2d5c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2d60:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2d64:	7f 13                	jg     2d79 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2d66:	dd 45 e0             	fldl   -0x20(%ebp)
    2d69:	dd 05 18 3a 00 00    	fldl   0x3a18
    2d6f:	d9 c9                	fxch   %st(1)
    2d71:	df e9                	fucomip %st(1),%st
    2d73:	dd d8                	fstp   %st(0)
    2d75:	77 9a                	ja     2d11 <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2d77:	eb 01                	jmp    2d7a <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2d79:	90                   	nop
    }
  }
}
    2d7a:	90                   	nop
    2d7b:	c9                   	leave  
    2d7c:	c3                   	ret    

00002d7d <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2d7d:	55                   	push   %ebp
    2d7e:	89 e5                	mov    %esp,%ebp
    2d80:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2d83:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2d8a:	8d 45 18             	lea    0x18(%ebp),%eax
    2d8d:	83 c0 04             	add    $0x4,%eax
    2d90:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2d93:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2d9a:	e9 e2 01 00 00       	jmp    2f81 <color_printf+0x204>
    c = fmt[i] & 0xff;
    2d9f:	8b 55 18             	mov    0x18(%ebp),%edx
    2da2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2da5:	01 d0                	add    %edx,%eax
    2da7:	0f b6 00             	movzbl (%eax),%eax
    2daa:	0f be c0             	movsbl %al,%eax
    2dad:	25 ff 00 00 00       	and    $0xff,%eax
    2db2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2db5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2db9:	75 35                	jne    2df0 <color_printf+0x73>
      if(c == '%'){
    2dbb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2dbf:	75 0c                	jne    2dcd <color_printf+0x50>
        state = '%';
    2dc1:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2dc8:	e9 b0 01 00 00       	jmp    2f7d <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2dcd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2dd0:	0f be c0             	movsbl %al,%eax
    2dd3:	83 ec 0c             	sub    $0xc,%esp
    2dd6:	ff 75 14             	pushl  0x14(%ebp)
    2dd9:	ff 75 10             	pushl  0x10(%ebp)
    2ddc:	ff 75 0c             	pushl  0xc(%ebp)
    2ddf:	ff 75 08             	pushl  0x8(%ebp)
    2de2:	50                   	push   %eax
    2de3:	e8 55 fd ff ff       	call   2b3d <color_putc>
    2de8:	83 c4 20             	add    $0x20,%esp
    2deb:	e9 8d 01 00 00       	jmp    2f7d <color_printf+0x200>
      }
    } else if(state == '%'){
    2df0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2df4:	0f 85 83 01 00 00    	jne    2f7d <color_printf+0x200>
      if(c == 'd'){
    2dfa:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2dfe:	75 2a                	jne    2e2a <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2e00:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e03:	8b 00                	mov    (%eax),%eax
    2e05:	83 ec 04             	sub    $0x4,%esp
    2e08:	ff 75 14             	pushl  0x14(%ebp)
    2e0b:	ff 75 10             	pushl  0x10(%ebp)
    2e0e:	ff 75 0c             	pushl  0xc(%ebp)
    2e11:	ff 75 08             	pushl  0x8(%ebp)
    2e14:	6a 01                	push   $0x1
    2e16:	6a 0a                	push   $0xa
    2e18:	50                   	push   %eax
    2e19:	e8 4b fd ff ff       	call   2b69 <color_printint>
    2e1e:	83 c4 20             	add    $0x20,%esp
        ap++;
    2e21:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2e25:	e9 4c 01 00 00       	jmp    2f76 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2e2a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2e2e:	74 06                	je     2e36 <color_printf+0xb9>
    2e30:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2e34:	75 2a                	jne    2e60 <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2e36:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e39:	8b 00                	mov    (%eax),%eax
    2e3b:	83 ec 04             	sub    $0x4,%esp
    2e3e:	ff 75 14             	pushl  0x14(%ebp)
    2e41:	ff 75 10             	pushl  0x10(%ebp)
    2e44:	ff 75 0c             	pushl  0xc(%ebp)
    2e47:	ff 75 08             	pushl  0x8(%ebp)
    2e4a:	6a 00                	push   $0x0
    2e4c:	6a 10                	push   $0x10
    2e4e:	50                   	push   %eax
    2e4f:	e8 15 fd ff ff       	call   2b69 <color_printint>
    2e54:	83 c4 20             	add    $0x20,%esp
        ap++;
    2e57:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2e5b:	e9 16 01 00 00       	jmp    2f76 <color_printf+0x1f9>
      } else if(c == 's'){
    2e60:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2e64:	75 4f                	jne    2eb5 <color_printf+0x138>
        s = (char*)*ap;
    2e66:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e69:	8b 00                	mov    (%eax),%eax
    2e6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2e6e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2e72:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e76:	75 2e                	jne    2ea6 <color_printf+0x129>
          s = "(null)";
    2e78:	c7 45 f4 10 3a 00 00 	movl   $0x3a10,-0xc(%ebp)
        while(*s != 0){
    2e7f:	eb 25                	jmp    2ea6 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2e81:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e84:	0f b6 00             	movzbl (%eax),%eax
    2e87:	0f be c0             	movsbl %al,%eax
    2e8a:	83 ec 0c             	sub    $0xc,%esp
    2e8d:	ff 75 14             	pushl  0x14(%ebp)
    2e90:	ff 75 10             	pushl  0x10(%ebp)
    2e93:	ff 75 0c             	pushl  0xc(%ebp)
    2e96:	ff 75 08             	pushl  0x8(%ebp)
    2e99:	50                   	push   %eax
    2e9a:	e8 9e fc ff ff       	call   2b3d <color_putc>
    2e9f:	83 c4 20             	add    $0x20,%esp
          s++;
    2ea2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2ea6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ea9:	0f b6 00             	movzbl (%eax),%eax
    2eac:	84 c0                	test   %al,%al
    2eae:	75 d1                	jne    2e81 <color_printf+0x104>
    2eb0:	e9 c1 00 00 00       	jmp    2f76 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2eb5:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2eb9:	75 29                	jne    2ee4 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2ebb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ebe:	8b 00                	mov    (%eax),%eax
    2ec0:	0f be c0             	movsbl %al,%eax
    2ec3:	83 ec 0c             	sub    $0xc,%esp
    2ec6:	ff 75 14             	pushl  0x14(%ebp)
    2ec9:	ff 75 10             	pushl  0x10(%ebp)
    2ecc:	ff 75 0c             	pushl  0xc(%ebp)
    2ecf:	ff 75 08             	pushl  0x8(%ebp)
    2ed2:	50                   	push   %eax
    2ed3:	e8 65 fc ff ff       	call   2b3d <color_putc>
    2ed8:	83 c4 20             	add    $0x20,%esp
        ap++;
    2edb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2edf:	e9 92 00 00 00       	jmp    2f76 <color_printf+0x1f9>
      } else if(c == '%'){
    2ee4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2ee8:	75 20                	jne    2f0a <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2eea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2eed:	0f be c0             	movsbl %al,%eax
    2ef0:	83 ec 0c             	sub    $0xc,%esp
    2ef3:	ff 75 14             	pushl  0x14(%ebp)
    2ef6:	ff 75 10             	pushl  0x10(%ebp)
    2ef9:	ff 75 0c             	pushl  0xc(%ebp)
    2efc:	ff 75 08             	pushl  0x8(%ebp)
    2eff:	50                   	push   %eax
    2f00:	e8 38 fc ff ff       	call   2b3d <color_putc>
    2f05:	83 c4 20             	add    $0x20,%esp
    2f08:	eb 6c                	jmp    2f76 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    2f0a:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    2f0e:	75 2f                	jne    2f3f <color_printf+0x1c2>
        double *dap = (double*)ap;
    2f10:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f13:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    2f16:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2f19:	dd 00                	fldl   (%eax)
    2f1b:	83 ec 08             	sub    $0x8,%esp
    2f1e:	ff 75 14             	pushl  0x14(%ebp)
    2f21:	ff 75 10             	pushl  0x10(%ebp)
    2f24:	ff 75 0c             	pushl  0xc(%ebp)
    2f27:	ff 75 08             	pushl  0x8(%ebp)
    2f2a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2f2e:	dd 1c 24             	fstpl  (%esp)
    2f31:	e8 2b fd ff ff       	call   2c61 <color_printdbl>
    2f36:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    2f39:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    2f3d:	eb 37                	jmp    2f76 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    2f3f:	83 ec 0c             	sub    $0xc,%esp
    2f42:	ff 75 14             	pushl  0x14(%ebp)
    2f45:	ff 75 10             	pushl  0x10(%ebp)
    2f48:	ff 75 0c             	pushl  0xc(%ebp)
    2f4b:	ff 75 08             	pushl  0x8(%ebp)
    2f4e:	6a 25                	push   $0x25
    2f50:	e8 e8 fb ff ff       	call   2b3d <color_putc>
    2f55:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    2f58:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2f5b:	0f be c0             	movsbl %al,%eax
    2f5e:	83 ec 0c             	sub    $0xc,%esp
    2f61:	ff 75 14             	pushl  0x14(%ebp)
    2f64:	ff 75 10             	pushl  0x10(%ebp)
    2f67:	ff 75 0c             	pushl  0xc(%ebp)
    2f6a:	ff 75 08             	pushl  0x8(%ebp)
    2f6d:	50                   	push   %eax
    2f6e:	e8 ca fb ff ff       	call   2b3d <color_putc>
    2f73:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    2f76:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2f7d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2f81:	8b 55 18             	mov    0x18(%ebp),%edx
    2f84:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f87:	01 d0                	add    %edx,%eax
    2f89:	0f b6 00             	movzbl (%eax),%eax
    2f8c:	84 c0                	test   %al,%al
    2f8e:	0f 85 0b fe ff ff    	jne    2d9f <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    2f94:	90                   	nop
    2f95:	c9                   	leave  
    2f96:	c3                   	ret    

00002f97 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    2f97:	55                   	push   %ebp
    2f98:	89 e5                	mov    %esp,%ebp
    2f9a:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    2f9d:	83 ec 0c             	sub    $0xc,%esp
    2fa0:	6a 58                	push   $0x58
    2fa2:	e8 b0 d9 ff ff       	call   957 <malloc>
    2fa7:	83 c4 10             	add    $0x10,%esp
    2faa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2fad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fb0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2fb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fb9:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    2fc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2fc3:	c9                   	leave  
    2fc4:	c3                   	ret    

00002fc5 <pushi>:

void pushi(struct istack *s, int val)
{
    2fc5:	55                   	push   %ebp
    2fc6:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    2fc8:	8b 45 08             	mov    0x8(%ebp),%eax
    2fcb:	8b 00                	mov    (%eax),%eax
    2fcd:	83 f8 13             	cmp    $0x13,%eax
    2fd0:	7f 2c                	jg     2ffe <pushi+0x39>
    {
        s->size++;
    2fd2:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd5:	8b 00                	mov    (%eax),%eax
    2fd7:	8d 50 01             	lea    0x1(%eax),%edx
    2fda:	8b 45 08             	mov    0x8(%ebp),%eax
    2fdd:	89 10                	mov    %edx,(%eax)
        s->top++;
    2fdf:	8b 45 08             	mov    0x8(%ebp),%eax
    2fe2:	8b 40 54             	mov    0x54(%eax),%eax
    2fe5:	8d 50 01             	lea    0x1(%eax),%edx
    2fe8:	8b 45 08             	mov    0x8(%ebp),%eax
    2feb:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    2fee:	8b 45 08             	mov    0x8(%ebp),%eax
    2ff1:	8b 50 54             	mov    0x54(%eax),%edx
    2ff4:	8b 45 08             	mov    0x8(%ebp),%eax
    2ff7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2ffa:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    2ffe:	90                   	nop
    2fff:	5d                   	pop    %ebp
    3000:	c3                   	ret    

00003001 <popi>:

int popi(struct istack *s)
{
    3001:	55                   	push   %ebp
    3002:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3004:	8b 45 08             	mov    0x8(%ebp),%eax
    3007:	8b 00                	mov    (%eax),%eax
    3009:	85 c0                	test   %eax,%eax
    300b:	75 07                	jne    3014 <popi+0x13>
    {
        return -1;
    300d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3012:	eb 2c                	jmp    3040 <popi+0x3f>
    }
    s->size--;
    3014:	8b 45 08             	mov    0x8(%ebp),%eax
    3017:	8b 00                	mov    (%eax),%eax
    3019:	8d 50 ff             	lea    -0x1(%eax),%edx
    301c:	8b 45 08             	mov    0x8(%ebp),%eax
    301f:	89 10                	mov    %edx,(%eax)
    s->top--;
    3021:	8b 45 08             	mov    0x8(%ebp),%eax
    3024:	8b 40 54             	mov    0x54(%eax),%eax
    3027:	8d 50 ff             	lea    -0x1(%eax),%edx
    302a:	8b 45 08             	mov    0x8(%ebp),%eax
    302d:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    3030:	8b 45 08             	mov    0x8(%ebp),%eax
    3033:	8b 40 54             	mov    0x54(%eax),%eax
    3036:	8d 50 01             	lea    0x1(%eax),%edx
    3039:	8b 45 08             	mov    0x8(%ebp),%eax
    303c:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3040:	5d                   	pop    %ebp
    3041:	c3                   	ret    

00003042 <topi>:

int topi(struct istack* s)
{
    3042:	55                   	push   %ebp
    3043:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3045:	8b 45 08             	mov    0x8(%ebp),%eax
    3048:	8b 50 54             	mov    0x54(%eax),%edx
    304b:	8b 45 08             	mov    0x8(%ebp),%eax
    304e:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3052:	5d                   	pop    %ebp
    3053:	c3                   	ret    

00003054 <cstack>:

//constructor
struct cstack* cstack()
{
    3054:	55                   	push   %ebp
    3055:	89 e5                	mov    %esp,%ebp
    3057:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    305a:	83 ec 0c             	sub    $0xc,%esp
    305d:	6a 1c                	push   $0x1c
    305f:	e8 f3 d8 ff ff       	call   957 <malloc>
    3064:	83 c4 10             	add    $0x10,%esp
    3067:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    306a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    306d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3073:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3076:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    307d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3080:	c9                   	leave  
    3081:	c3                   	ret    

00003082 <pushc>:

void pushc(struct cstack *s, char val)
{
    3082:	55                   	push   %ebp
    3083:	89 e5                	mov    %esp,%ebp
    3085:	83 ec 04             	sub    $0x4,%esp
    3088:	8b 45 0c             	mov    0xc(%ebp),%eax
    308b:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    308e:	8b 45 08             	mov    0x8(%ebp),%eax
    3091:	8b 00                	mov    (%eax),%eax
    3093:	83 f8 13             	cmp    $0x13,%eax
    3096:	7f 2d                	jg     30c5 <pushc+0x43>
    {
        s->size++;
    3098:	8b 45 08             	mov    0x8(%ebp),%eax
    309b:	8b 00                	mov    (%eax),%eax
    309d:	8d 50 01             	lea    0x1(%eax),%edx
    30a0:	8b 45 08             	mov    0x8(%ebp),%eax
    30a3:	89 10                	mov    %edx,(%eax)
        s->top++;
    30a5:	8b 45 08             	mov    0x8(%ebp),%eax
    30a8:	8b 40 18             	mov    0x18(%eax),%eax
    30ab:	8d 50 01             	lea    0x1(%eax),%edx
    30ae:	8b 45 08             	mov    0x8(%ebp),%eax
    30b1:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    30b4:	8b 45 08             	mov    0x8(%ebp),%eax
    30b7:	8b 40 18             	mov    0x18(%eax),%eax
    30ba:	8b 55 08             	mov    0x8(%ebp),%edx
    30bd:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    30c1:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    30c5:	90                   	nop
    30c6:	c9                   	leave  
    30c7:	c3                   	ret    

000030c8 <popc>:

char popc(struct cstack *s)
{
    30c8:	55                   	push   %ebp
    30c9:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    30cb:	8b 45 08             	mov    0x8(%ebp),%eax
    30ce:	8b 00                	mov    (%eax),%eax
    30d0:	85 c0                	test   %eax,%eax
    30d2:	75 07                	jne    30db <popc+0x13>
    {
        return -1;
    30d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    30d9:	eb 2d                	jmp    3108 <popc+0x40>
    }
    s->size--;
    30db:	8b 45 08             	mov    0x8(%ebp),%eax
    30de:	8b 00                	mov    (%eax),%eax
    30e0:	8d 50 ff             	lea    -0x1(%eax),%edx
    30e3:	8b 45 08             	mov    0x8(%ebp),%eax
    30e6:	89 10                	mov    %edx,(%eax)
    s->top--;
    30e8:	8b 45 08             	mov    0x8(%ebp),%eax
    30eb:	8b 40 18             	mov    0x18(%eax),%eax
    30ee:	8d 50 ff             	lea    -0x1(%eax),%edx
    30f1:	8b 45 08             	mov    0x8(%ebp),%eax
    30f4:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    30f7:	8b 45 08             	mov    0x8(%ebp),%eax
    30fa:	8b 40 18             	mov    0x18(%eax),%eax
    30fd:	8d 50 01             	lea    0x1(%eax),%edx
    3100:	8b 45 08             	mov    0x8(%ebp),%eax
    3103:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    3108:	5d                   	pop    %ebp
    3109:	c3                   	ret    

0000310a <topc>:

char topc(struct cstack* s)
{
    310a:	55                   	push   %ebp
    310b:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    310d:	8b 45 08             	mov    0x8(%ebp),%eax
    3110:	8b 40 18             	mov    0x18(%eax),%eax
    3113:	8b 55 08             	mov    0x8(%ebp),%edx
    3116:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    311b:	5d                   	pop    %ebp
    311c:	c3                   	ret    

0000311d <dstack>:

//constructor
struct dstack* dstack()
{
    311d:	55                   	push   %ebp
    311e:	89 e5                	mov    %esp,%ebp
    3120:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    3123:	83 ec 0c             	sub    $0xc,%esp
    3126:	68 a8 00 00 00       	push   $0xa8
    312b:	e8 27 d8 ff ff       	call   957 <malloc>
    3130:	83 c4 10             	add    $0x10,%esp
    3133:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3136:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3139:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    313f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3142:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    3149:	ff ff ff 
    return stack;
    314c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    314f:	c9                   	leave  
    3150:	c3                   	ret    

00003151 <pushd>:

void pushd(struct dstack *s, double val)
{
    3151:	55                   	push   %ebp
    3152:	89 e5                	mov    %esp,%ebp
    3154:	83 ec 08             	sub    $0x8,%esp
    3157:	8b 45 0c             	mov    0xc(%ebp),%eax
    315a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    315d:	8b 45 10             	mov    0x10(%ebp),%eax
    3160:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3163:	8b 45 08             	mov    0x8(%ebp),%eax
    3166:	8b 00                	mov    (%eax),%eax
    3168:	83 f8 13             	cmp    $0x13,%eax
    316b:	7f 35                	jg     31a2 <pushd+0x51>
    {
        s->size++;
    316d:	8b 45 08             	mov    0x8(%ebp),%eax
    3170:	8b 00                	mov    (%eax),%eax
    3172:	8d 50 01             	lea    0x1(%eax),%edx
    3175:	8b 45 08             	mov    0x8(%ebp),%eax
    3178:	89 10                	mov    %edx,(%eax)
        s->top++;
    317a:	8b 45 08             	mov    0x8(%ebp),%eax
    317d:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3183:	8d 50 01             	lea    0x1(%eax),%edx
    3186:	8b 45 08             	mov    0x8(%ebp),%eax
    3189:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    318f:	8b 45 08             	mov    0x8(%ebp),%eax
    3192:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3198:	8b 45 08             	mov    0x8(%ebp),%eax
    319b:	dd 45 f8             	fldl   -0x8(%ebp)
    319e:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    31a2:	90                   	nop
    31a3:	c9                   	leave  
    31a4:	c3                   	ret    

000031a5 <popd>:

double popd(struct dstack *s)
{
    31a5:	55                   	push   %ebp
    31a6:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    31a8:	8b 45 08             	mov    0x8(%ebp),%eax
    31ab:	8b 00                	mov    (%eax),%eax
    31ad:	85 c0                	test   %eax,%eax
    31af:	75 06                	jne    31b7 <popd+0x12>
    {
        return -1;
    31b1:	d9 e8                	fld1   
    31b3:	d9 e0                	fchs   
    31b5:	eb 35                	jmp    31ec <popd+0x47>
    }
    s->size--;
    31b7:	8b 45 08             	mov    0x8(%ebp),%eax
    31ba:	8b 00                	mov    (%eax),%eax
    31bc:	8d 50 ff             	lea    -0x1(%eax),%edx
    31bf:	8b 45 08             	mov    0x8(%ebp),%eax
    31c2:	89 10                	mov    %edx,(%eax)
    s->top--;
    31c4:	8b 45 08             	mov    0x8(%ebp),%eax
    31c7:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    31cd:	8d 50 ff             	lea    -0x1(%eax),%edx
    31d0:	8b 45 08             	mov    0x8(%ebp),%eax
    31d3:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    31d9:	8b 45 08             	mov    0x8(%ebp),%eax
    31dc:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    31e2:	8d 50 01             	lea    0x1(%eax),%edx
    31e5:	8b 45 08             	mov    0x8(%ebp),%eax
    31e8:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    31ec:	5d                   	pop    %ebp
    31ed:	c3                   	ret    

000031ee <topd>:

double topd(struct dstack* s)
{
    31ee:	55                   	push   %ebp
    31ef:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    31f1:	8b 45 08             	mov    0x8(%ebp),%eax
    31f4:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    31fa:	8b 45 08             	mov    0x8(%ebp),%eax
    31fd:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    3201:	5d                   	pop    %ebp
    3202:	c3                   	ret    

00003203 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3203:	55                   	push   %ebp
    3204:	89 e5                	mov    %esp,%ebp
    3206:	53                   	push   %ebx
    3207:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    320d:	83 ec 08             	sub    $0x8,%esp
    3210:	6a 00                	push   $0x0
    3212:	68 28 3a 00 00       	push   $0x3a28
    3217:	e8 cd d1 ff ff       	call   3e9 <open>
    321c:	83 c4 10             	add    $0x10,%esp
    321f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3222:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3226:	79 1d                	jns    3245 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    3228:	83 ec 0c             	sub    $0xc,%esp
    322b:	68 32 3a 00 00       	push   $0x3a32
    3230:	6a 00                	push   $0x0
    3232:	6a 00                	push   $0x0
    3234:	6a 01                	push   $0x1
    3236:	6a 03                	push   $0x3
    3238:	e8 40 fb ff ff       	call   2d7d <color_printf>
    323d:	83 c4 20             	add    $0x20,%esp
    3240:	e9 6d 02 00 00       	jmp    34b2 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    3245:	8b 45 0c             	mov    0xc(%ebp),%eax
    3248:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    324e:	e9 2a 02 00 00       	jmp    347d <readVariables+0x27a>
  {
    int pos = 0;
    3253:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    325a:	00 00 00 
    while(pos <= n-1)
    325d:	e9 07 02 00 00       	jmp    3469 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    3262:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    3269:	eb 24                	jmp    328f <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    326b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    326e:	8d 50 ff             	lea    -0x1(%eax),%edx
    3271:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    3277:	8b 45 f4             	mov    -0xc(%ebp),%eax
    327a:	01 c8                	add    %ecx,%eax
    327c:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3283:	ff 
    3284:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    328b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    328f:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3295:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3298:	01 d0                	add    %edx,%eax
    329a:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    32a1:	ff 
    32a2:	3c 3d                	cmp    $0x3d,%al
    32a4:	75 c5                	jne    326b <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    32a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32a9:	83 e8 01             	sub    $0x1,%eax
    32ac:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    32b3:	00 
      if(buf[pos] == 'd') //double value
    32b4:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32ba:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    32c1:	ff 
    32c2:	3c 64                	cmp    $0x64,%al
    32c4:	0f 85 a0 00 00 00    	jne    336a <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    32ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    32cd:	8b 00                	mov    (%eax),%eax
    32cf:	c1 e0 05             	shl    $0x5,%eax
    32d2:	89 c2                	mov    %eax,%edx
    32d4:	8b 45 08             	mov    0x8(%ebp),%eax
    32d7:	01 d0                	add    %edx,%eax
    32d9:	8d 50 04             	lea    0x4(%eax),%edx
    32dc:	83 ec 08             	sub    $0x8,%esp
    32df:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    32e5:	50                   	push   %eax
    32e6:	52                   	push   %edx
    32e7:	e8 8c ce ff ff       	call   178 <strcpy>
    32ec:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    32ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32f2:	8d 50 01             	lea    0x1(%eax),%edx
    32f5:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32fb:	01 d0                	add    %edx,%eax
    32fd:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    3303:	83 ec 08             	sub    $0x8,%esp
    3306:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    330c:	50                   	push   %eax
    330d:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3313:	50                   	push   %eax
    3314:	e8 7b d9 ff ff       	call   c94 <Translation>
    3319:	83 c4 10             	add    $0x10,%esp
    331c:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    331f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3322:	8b 00                	mov    (%eax),%eax
    3324:	c1 e0 05             	shl    $0x5,%eax
    3327:	89 c2                	mov    %eax,%edx
    3329:	8b 45 08             	mov    0x8(%ebp),%eax
    332c:	01 d0                	add    %edx,%eax
    332e:	dd 45 d8             	fldl   -0x28(%ebp)
    3331:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    3334:	8b 45 0c             	mov    0xc(%ebp),%eax
    3337:	8b 00                	mov    (%eax),%eax
    3339:	c1 e0 05             	shl    $0x5,%eax
    333c:	89 c2                	mov    %eax,%edx
    333e:	8b 45 08             	mov    0x8(%ebp),%eax
    3341:	01 d0                	add    %edx,%eax
    3343:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    3349:	8b 45 0c             	mov    0xc(%ebp),%eax
    334c:	8b 00                	mov    (%eax),%eax
    334e:	8d 50 01             	lea    0x1(%eax),%edx
    3351:	8b 45 0c             	mov    0xc(%ebp),%eax
    3354:	89 10                	mov    %edx,(%eax)
        pos++;
    3356:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    335c:	83 c0 01             	add    $0x1,%eax
    335f:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    3365:	e9 ff 00 00 00       	jmp    3469 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    336a:	8b 45 0c             	mov    0xc(%ebp),%eax
    336d:	8b 00                	mov    (%eax),%eax
    336f:	c1 e0 05             	shl    $0x5,%eax
    3372:	89 c2                	mov    %eax,%edx
    3374:	8b 45 08             	mov    0x8(%ebp),%eax
    3377:	01 d0                	add    %edx,%eax
    3379:	8d 50 04             	lea    0x4(%eax),%edx
    337c:	83 ec 08             	sub    $0x8,%esp
    337f:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3385:	50                   	push   %eax
    3386:	52                   	push   %edx
    3387:	e8 ec cd ff ff       	call   178 <strcpy>
    338c:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    338f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3392:	8d 50 01             	lea    0x1(%eax),%edx
    3395:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    339b:	01 d0                	add    %edx,%eax
    339d:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    33a3:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    33a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    33ac:	eb 04                	jmp    33b2 <readVariables+0x1af>
        {
          strend++;
    33ae:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    33b2:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    33b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    33bb:	01 d0                	add    %edx,%eax
    33bd:	0f b6 00             	movzbl (%eax),%eax
    33c0:	84 c0                	test   %al,%al
    33c2:	75 ea                	jne    33ae <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    33c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    33c7:	8b 00                	mov    (%eax),%eax
    33c9:	c1 e0 05             	shl    $0x5,%eax
    33cc:	89 c2                	mov    %eax,%edx
    33ce:	8b 45 08             	mov    0x8(%ebp),%eax
    33d1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    33d4:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    33da:	8b 55 f0             	mov    -0x10(%ebp),%edx
    33dd:	29 c2                	sub    %eax,%edx
    33df:	89 d0                	mov    %edx,%eax
    33e1:	83 c0 01             	add    $0x1,%eax
    33e4:	83 ec 0c             	sub    $0xc,%esp
    33e7:	50                   	push   %eax
    33e8:	e8 6a d5 ff ff       	call   957 <malloc>
    33ed:	83 c4 10             	add    $0x10,%esp
    33f0:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    33f3:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    33f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    33fc:	eb 35                	jmp    3433 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    33fe:	8b 45 0c             	mov    0xc(%ebp),%eax
    3401:	8b 00                	mov    (%eax),%eax
    3403:	c1 e0 05             	shl    $0x5,%eax
    3406:	89 c2                	mov    %eax,%edx
    3408:	8b 45 08             	mov    0x8(%ebp),%eax
    340b:	01 d0                	add    %edx,%eax
    340d:	8b 40 18             	mov    0x18(%eax),%eax
    3410:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3416:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3419:	29 d1                	sub    %edx,%ecx
    341b:	89 ca                	mov    %ecx,%edx
    341d:	01 c2                	add    %eax,%edx
    341f:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    3425:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3428:	01 c8                	add    %ecx,%eax
    342a:	0f b6 00             	movzbl (%eax),%eax
    342d:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    342f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    3433:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3436:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3439:	7e c3                	jle    33fe <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    343b:	8b 45 0c             	mov    0xc(%ebp),%eax
    343e:	8b 00                	mov    (%eax),%eax
    3440:	c1 e0 05             	shl    $0x5,%eax
    3443:	89 c2                	mov    %eax,%edx
    3445:	8b 45 08             	mov    0x8(%ebp),%eax
    3448:	01 d0                	add    %edx,%eax
    344a:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    3450:	8b 45 0c             	mov    0xc(%ebp),%eax
    3453:	8b 00                	mov    (%eax),%eax
    3455:	8d 50 01             	lea    0x1(%eax),%edx
    3458:	8b 45 0c             	mov    0xc(%ebp),%eax
    345b:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    345d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3460:	83 c0 01             	add    $0x1,%eax
    3463:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    3469:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    346c:	8d 50 ff             	lea    -0x1(%eax),%edx
    346f:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3475:	39 c2                	cmp    %eax,%edx
    3477:	0f 8d e5 fd ff ff    	jge    3262 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    347d:	83 ec 04             	sub    $0x4,%esp
    3480:	68 e8 03 00 00       	push   $0x3e8
    3485:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    348b:	50                   	push   %eax
    348c:	ff 75 e8             	pushl  -0x18(%ebp)
    348f:	e8 2d cf ff ff       	call   3c1 <read>
    3494:	83 c4 10             	add    $0x10,%esp
    3497:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    349a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    349e:	0f 8f af fd ff ff    	jg     3253 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    34a4:	83 ec 0c             	sub    $0xc,%esp
    34a7:	ff 75 e8             	pushl  -0x18(%ebp)
    34aa:	e8 22 cf ff ff       	call   3d1 <close>
    34af:	83 c4 10             	add    $0x10,%esp
}
    34b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    34b5:	c9                   	leave  
    34b6:	c3                   	ret    

000034b7 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    34b7:	55                   	push   %ebp
    34b8:	89 e5                	mov    %esp,%ebp
    34ba:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    34c0:	83 ec 08             	sub    $0x8,%esp
    34c3:	6a 02                	push   $0x2
    34c5:	68 28 3a 00 00       	push   $0x3a28
    34ca:	e8 1a cf ff ff       	call   3e9 <open>
    34cf:	83 c4 10             	add    $0x10,%esp
    34d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    34d5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    34d9:	78 1e                	js     34f9 <writeVariables+0x42>
  {
    close(fd);
    34db:	83 ec 0c             	sub    $0xc,%esp
    34de:	ff 75 e4             	pushl  -0x1c(%ebp)
    34e1:	e8 eb ce ff ff       	call   3d1 <close>
    34e6:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    34e9:	83 ec 0c             	sub    $0xc,%esp
    34ec:	68 28 3a 00 00       	push   $0x3a28
    34f1:	e8 03 cf ff ff       	call   3f9 <unlink>
    34f6:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    34f9:	83 ec 08             	sub    $0x8,%esp
    34fc:	68 02 02 00 00       	push   $0x202
    3501:	68 28 3a 00 00       	push   $0x3a28
    3506:	e8 de ce ff ff       	call   3e9 <open>
    350b:	83 c4 10             	add    $0x10,%esp
    350e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    3511:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3518:	e9 ff 01 00 00       	jmp    371c <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    351d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3520:	c1 e0 05             	shl    $0x5,%eax
    3523:	89 c2                	mov    %eax,%edx
    3525:	8b 45 08             	mov    0x8(%ebp),%eax
    3528:	01 d0                	add    %edx,%eax
    352a:	8b 00                	mov    (%eax),%eax
    352c:	83 f8 01             	cmp    $0x1,%eax
    352f:	0f 85 d3 00 00 00    	jne    3608 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    3535:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    353c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    353f:	8d 50 01             	lea    0x1(%eax),%edx
    3542:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3545:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    354c:	64 
      int k=0;
    354d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    3554:	eb 2c                	jmp    3582 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    3556:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3559:	8d 50 01             	lea    0x1(%eax),%edx
    355c:	89 55 e0             	mov    %edx,-0x20(%ebp)
    355f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3562:	89 d1                	mov    %edx,%ecx
    3564:	c1 e1 05             	shl    $0x5,%ecx
    3567:	8b 55 08             	mov    0x8(%ebp),%edx
    356a:	01 d1                	add    %edx,%ecx
    356c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    356f:	01 ca                	add    %ecx,%edx
    3571:	83 c2 04             	add    $0x4,%edx
    3574:	0f b6 12             	movzbl (%edx),%edx
    3577:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    357e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    3582:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3585:	c1 e0 05             	shl    $0x5,%eax
    3588:	89 c2                	mov    %eax,%edx
    358a:	8b 45 08             	mov    0x8(%ebp),%eax
    358d:	01 c2                	add    %eax,%edx
    358f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3592:	01 d0                	add    %edx,%eax
    3594:	83 c0 04             	add    $0x4,%eax
    3597:	0f b6 00             	movzbl (%eax),%eax
    359a:	84 c0                	test   %al,%al
    359c:	75 b8                	jne    3556 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    359e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    35a1:	8d 50 01             	lea    0x1(%eax),%edx
    35a4:	89 55 e0             	mov    %edx,-0x20(%ebp)
    35a7:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    35ae:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    35af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35b2:	c1 e0 05             	shl    $0x5,%eax
    35b5:	89 c2                	mov    %eax,%edx
    35b7:	8b 45 08             	mov    0x8(%ebp),%eax
    35ba:	01 d0                	add    %edx,%eax
    35bc:	dd 40 18             	fldl   0x18(%eax)
    35bf:	8d 45 e0             	lea    -0x20(%ebp),%eax
    35c2:	50                   	push   %eax
    35c3:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    35c7:	dd 1c 24             	fstpl  (%esp)
    35ca:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    35d0:	50                   	push   %eax
    35d1:	e8 7d d5 ff ff       	call   b53 <double2str>
    35d6:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    35d9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    35dc:	8d 50 01             	lea    0x1(%eax),%edx
    35df:	89 55 e0             	mov    %edx,-0x20(%ebp)
    35e2:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    35e9:	00 
      write(fd,buf,pos);
    35ea:	8b 45 e0             	mov    -0x20(%ebp),%eax
    35ed:	83 ec 04             	sub    $0x4,%esp
    35f0:	50                   	push   %eax
    35f1:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    35f7:	50                   	push   %eax
    35f8:	ff 75 e4             	pushl  -0x1c(%ebp)
    35fb:	e8 c9 cd ff ff       	call   3c9 <write>
    3600:	83 c4 10             	add    $0x10,%esp
    3603:	e9 10 01 00 00       	jmp    3718 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    3608:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    360f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3612:	8d 50 01             	lea    0x1(%eax),%edx
    3615:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3618:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    361f:	73 
      int k=0;
    3620:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    3627:	eb 2c                	jmp    3655 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    3629:	8b 45 ec             	mov    -0x14(%ebp),%eax
    362c:	8d 50 01             	lea    0x1(%eax),%edx
    362f:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3632:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3635:	89 d1                	mov    %edx,%ecx
    3637:	c1 e1 05             	shl    $0x5,%ecx
    363a:	8b 55 08             	mov    0x8(%ebp),%edx
    363d:	01 d1                	add    %edx,%ecx
    363f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3642:	01 ca                	add    %ecx,%edx
    3644:	83 c2 04             	add    $0x4,%edx
    3647:	0f b6 12             	movzbl (%edx),%edx
    364a:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3651:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    3655:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3658:	c1 e0 05             	shl    $0x5,%eax
    365b:	89 c2                	mov    %eax,%edx
    365d:	8b 45 08             	mov    0x8(%ebp),%eax
    3660:	01 c2                	add    %eax,%edx
    3662:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3665:	01 d0                	add    %edx,%eax
    3667:	83 c0 04             	add    $0x4,%eax
    366a:	0f b6 00             	movzbl (%eax),%eax
    366d:	84 c0                	test   %al,%al
    366f:	75 b8                	jne    3629 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3671:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3674:	8d 50 01             	lea    0x1(%eax),%edx
    3677:	89 55 ec             	mov    %edx,-0x14(%ebp)
    367a:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    3681:	3d 
      k=0;
    3682:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    3689:	eb 2c                	jmp    36b7 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    368b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    368e:	8d 50 01             	lea    0x1(%eax),%edx
    3691:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3694:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3697:	89 d1                	mov    %edx,%ecx
    3699:	c1 e1 05             	shl    $0x5,%ecx
    369c:	8b 55 08             	mov    0x8(%ebp),%edx
    369f:	01 ca                	add    %ecx,%edx
    36a1:	8b 4a 18             	mov    0x18(%edx),%ecx
    36a4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    36a7:	01 ca                	add    %ecx,%edx
    36a9:	0f b6 12             	movzbl (%edx),%edx
    36ac:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    36b3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    36b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36ba:	c1 e0 05             	shl    $0x5,%eax
    36bd:	89 c2                	mov    %eax,%edx
    36bf:	8b 45 08             	mov    0x8(%ebp),%eax
    36c2:	01 d0                	add    %edx,%eax
    36c4:	8b 50 18             	mov    0x18(%eax),%edx
    36c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    36ca:	01 d0                	add    %edx,%eax
    36cc:	0f b6 00             	movzbl (%eax),%eax
    36cf:	84 c0                	test   %al,%al
    36d1:	75 b8                	jne    368b <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    36d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    36d6:	8d 50 01             	lea    0x1(%eax),%edx
    36d9:	89 55 ec             	mov    %edx,-0x14(%ebp)
    36dc:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    36e3:	00 
      write(fd,buf,pos);
    36e4:	83 ec 04             	sub    $0x4,%esp
    36e7:	ff 75 ec             	pushl  -0x14(%ebp)
    36ea:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    36f0:	50                   	push   %eax
    36f1:	ff 75 e4             	pushl  -0x1c(%ebp)
    36f4:	e8 d0 cc ff ff       	call   3c9 <write>
    36f9:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    36fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36ff:	c1 e0 05             	shl    $0x5,%eax
    3702:	89 c2                	mov    %eax,%edx
    3704:	8b 45 08             	mov    0x8(%ebp),%eax
    3707:	01 d0                	add    %edx,%eax
    3709:	8b 40 18             	mov    0x18(%eax),%eax
    370c:	83 ec 0c             	sub    $0xc,%esp
    370f:	50                   	push   %eax
    3710:	e8 00 d1 ff ff       	call   815 <free>
    3715:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    3718:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    371c:	8b 45 0c             	mov    0xc(%ebp),%eax
    371f:	8b 00                	mov    (%eax),%eax
    3721:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3724:	0f 8f f3 fd ff ff    	jg     351d <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    372a:	8b 45 0c             	mov    0xc(%ebp),%eax
    372d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    3733:	83 ec 0c             	sub    $0xc,%esp
    3736:	ff 75 e4             	pushl  -0x1c(%ebp)
    3739:	e8 93 cc ff ff       	call   3d1 <close>
    373e:	83 c4 10             	add    $0x10,%esp
  return;
    3741:	90                   	nop
    3742:	c9                   	leave  
    3743:	c3                   	ret    
