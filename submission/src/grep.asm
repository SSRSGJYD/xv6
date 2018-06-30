
_grep：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 18             	sub    $0x18,%esp
  int n, m;
  char *p, *q;
  
  m = 0;
       6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
       d:	e9 ab 00 00 00       	jmp    bd <grep+0xbd>
    m += n;
      12:	8b 45 ec             	mov    -0x14(%ebp),%eax
      15:	01 45 f4             	add    %eax,-0xc(%ebp)
    p = buf;
      18:	c7 45 f0 60 47 00 00 	movl   $0x4760,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
      1f:	eb 4a                	jmp    6b <grep+0x6b>
      *q = 0;
      21:	8b 45 e8             	mov    -0x18(%ebp),%eax
      24:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
      27:	83 ec 08             	sub    $0x8,%esp
      2a:	ff 75 f0             	pushl  -0x10(%ebp)
      2d:	ff 75 08             	pushl  0x8(%ebp)
      30:	e8 9a 01 00 00       	call   1cf <match>
      35:	83 c4 10             	add    $0x10,%esp
      38:	85 c0                	test   %eax,%eax
      3a:	74 26                	je     62 <grep+0x62>
        *q = '\n';
      3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
      3f:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
      42:	8b 45 e8             	mov    -0x18(%ebp),%eax
      45:	83 c0 01             	add    $0x1,%eax
      48:	89 c2                	mov    %eax,%edx
      4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
      4d:	29 c2                	sub    %eax,%edx
      4f:	89 d0                	mov    %edx,%eax
      51:	83 ec 04             	sub    $0x4,%esp
      54:	50                   	push   %eax
      55:	ff 75 f0             	pushl  -0x10(%ebp)
      58:	6a 01                	push   $0x1
      5a:	e8 43 05 00 00       	call   5a2 <write>
      5f:	83 c4 10             	add    $0x10,%esp
      }
      p = q+1;
      62:	8b 45 e8             	mov    -0x18(%ebp),%eax
      65:	83 c0 01             	add    $0x1,%eax
      68:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
      6b:	83 ec 08             	sub    $0x8,%esp
      6e:	6a 0a                	push   $0xa
      70:	ff 75 f0             	pushl  -0x10(%ebp)
      73:	e8 89 03 00 00       	call   401 <strchr>
      78:	83 c4 10             	add    $0x10,%esp
      7b:	89 45 e8             	mov    %eax,-0x18(%ebp)
      7e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
      82:	75 9d                	jne    21 <grep+0x21>
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
      84:	81 7d f0 60 47 00 00 	cmpl   $0x4760,-0x10(%ebp)
      8b:	75 07                	jne    94 <grep+0x94>
      m = 0;
      8d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
      94:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      98:	7e 23                	jle    bd <grep+0xbd>
      m -= p - buf;
      9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
      9d:	ba 60 47 00 00       	mov    $0x4760,%edx
      a2:	29 d0                	sub    %edx,%eax
      a4:	29 45 f4             	sub    %eax,-0xc(%ebp)
      memmove(buf, p, m);
      a7:	83 ec 04             	sub    $0x4,%esp
      aa:	ff 75 f4             	pushl  -0xc(%ebp)
      ad:	ff 75 f0             	pushl  -0x10(%ebp)
      b0:	68 60 47 00 00       	push   $0x4760
      b5:	e8 83 04 00 00       	call   53d <memmove>
      ba:	83 c4 10             	add    $0x10,%esp
{
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
      bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c0:	ba 00 04 00 00       	mov    $0x400,%edx
      c5:	29 c2                	sub    %eax,%edx
      c7:	89 d0                	mov    %edx,%eax
      c9:	89 c2                	mov    %eax,%edx
      cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
      ce:	05 60 47 00 00       	add    $0x4760,%eax
      d3:	83 ec 04             	sub    $0x4,%esp
      d6:	52                   	push   %edx
      d7:	50                   	push   %eax
      d8:	ff 75 0c             	pushl  0xc(%ebp)
      db:	e8 ba 04 00 00       	call   59a <read>
      e0:	83 c4 10             	add    $0x10,%esp
      e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
      e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
      ea:	0f 8f 22 ff ff ff    	jg     12 <grep+0x12>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
      f0:	90                   	nop
      f1:	c9                   	leave  
      f2:	c3                   	ret    

000000f3 <main>:

int
main(int argc, char *argv[])
{
      f3:	8d 4c 24 04          	lea    0x4(%esp),%ecx
      f7:	83 e4 f0             	and    $0xfffffff0,%esp
      fa:	ff 71 fc             	pushl  -0x4(%ecx)
      fd:	55                   	push   %ebp
      fe:	89 e5                	mov    %esp,%ebp
     100:	53                   	push   %ebx
     101:	51                   	push   %ecx
     102:	83 ec 10             	sub    $0x10,%esp
     105:	89 cb                	mov    %ecx,%ebx
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
     107:	83 3b 01             	cmpl   $0x1,(%ebx)
     10a:	7f 17                	jg     123 <main+0x30>
    printf(2, "usage: grep pattern [file ...]\n");
     10c:	83 ec 08             	sub    $0x8,%esp
     10f:	68 20 39 00 00       	push   $0x3920
     114:	6a 02                	push   $0x2
     116:	e8 13 07 00 00       	call   82e <printf>
     11b:	83 c4 10             	add    $0x10,%esp
    exit();
     11e:	e8 5f 04 00 00       	call   582 <exit>
  }
  pattern = argv[1];
     123:	8b 43 04             	mov    0x4(%ebx),%eax
     126:	8b 40 04             	mov    0x4(%eax),%eax
     129:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  if(argc <= 2){
     12c:	83 3b 02             	cmpl   $0x2,(%ebx)
     12f:	7f 15                	jg     146 <main+0x53>
    grep(pattern, 0);
     131:	83 ec 08             	sub    $0x8,%esp
     134:	6a 00                	push   $0x0
     136:	ff 75 f0             	pushl  -0x10(%ebp)
     139:	e8 c2 fe ff ff       	call   0 <grep>
     13e:	83 c4 10             	add    $0x10,%esp
    exit();
     141:	e8 3c 04 00 00       	call   582 <exit>
  }

  for(i = 2; i < argc; i++){
     146:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
     14d:	eb 74                	jmp    1c3 <main+0xd0>
    if((fd = open(argv[i], 0)) < 0){
     14f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     152:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     159:	8b 43 04             	mov    0x4(%ebx),%eax
     15c:	01 d0                	add    %edx,%eax
     15e:	8b 00                	mov    (%eax),%eax
     160:	83 ec 08             	sub    $0x8,%esp
     163:	6a 00                	push   $0x0
     165:	50                   	push   %eax
     166:	e8 57 04 00 00       	call   5c2 <open>
     16b:	83 c4 10             	add    $0x10,%esp
     16e:	89 45 ec             	mov    %eax,-0x14(%ebp)
     171:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     175:	79 29                	jns    1a0 <main+0xad>
      printf(1, "grep: cannot open %s\n", argv[i]);
     177:	8b 45 f4             	mov    -0xc(%ebp),%eax
     17a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     181:	8b 43 04             	mov    0x4(%ebx),%eax
     184:	01 d0                	add    %edx,%eax
     186:	8b 00                	mov    (%eax),%eax
     188:	83 ec 04             	sub    $0x4,%esp
     18b:	50                   	push   %eax
     18c:	68 40 39 00 00       	push   $0x3940
     191:	6a 01                	push   $0x1
     193:	e8 96 06 00 00       	call   82e <printf>
     198:	83 c4 10             	add    $0x10,%esp
      exit();
     19b:	e8 e2 03 00 00       	call   582 <exit>
    }
    grep(pattern, fd);
     1a0:	83 ec 08             	sub    $0x8,%esp
     1a3:	ff 75 ec             	pushl  -0x14(%ebp)
     1a6:	ff 75 f0             	pushl  -0x10(%ebp)
     1a9:	e8 52 fe ff ff       	call   0 <grep>
     1ae:	83 c4 10             	add    $0x10,%esp
    close(fd);
     1b1:	83 ec 0c             	sub    $0xc,%esp
     1b4:	ff 75 ec             	pushl  -0x14(%ebp)
     1b7:	e8 ee 03 00 00       	call   5aa <close>
     1bc:	83 c4 10             	add    $0x10,%esp
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
     1bf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     1c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1c6:	3b 03                	cmp    (%ebx),%eax
     1c8:	7c 85                	jl     14f <main+0x5c>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
     1ca:	e8 b3 03 00 00       	call   582 <exit>

000001cf <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
     1cf:	55                   	push   %ebp
     1d0:	89 e5                	mov    %esp,%ebp
     1d2:	83 ec 08             	sub    $0x8,%esp
  if(re[0] == '^')
     1d5:	8b 45 08             	mov    0x8(%ebp),%eax
     1d8:	0f b6 00             	movzbl (%eax),%eax
     1db:	3c 5e                	cmp    $0x5e,%al
     1dd:	75 17                	jne    1f6 <match+0x27>
    return matchhere(re+1, text);
     1df:	8b 45 08             	mov    0x8(%ebp),%eax
     1e2:	83 c0 01             	add    $0x1,%eax
     1e5:	83 ec 08             	sub    $0x8,%esp
     1e8:	ff 75 0c             	pushl  0xc(%ebp)
     1eb:	50                   	push   %eax
     1ec:	e8 38 00 00 00       	call   229 <matchhere>
     1f1:	83 c4 10             	add    $0x10,%esp
     1f4:	eb 31                	jmp    227 <match+0x58>
  do{  // must look at empty string
    if(matchhere(re, text))
     1f6:	83 ec 08             	sub    $0x8,%esp
     1f9:	ff 75 0c             	pushl  0xc(%ebp)
     1fc:	ff 75 08             	pushl  0x8(%ebp)
     1ff:	e8 25 00 00 00       	call   229 <matchhere>
     204:	83 c4 10             	add    $0x10,%esp
     207:	85 c0                	test   %eax,%eax
     209:	74 07                	je     212 <match+0x43>
      return 1;
     20b:	b8 01 00 00 00       	mov    $0x1,%eax
     210:	eb 15                	jmp    227 <match+0x58>
  }while(*text++ != '\0');
     212:	8b 45 0c             	mov    0xc(%ebp),%eax
     215:	8d 50 01             	lea    0x1(%eax),%edx
     218:	89 55 0c             	mov    %edx,0xc(%ebp)
     21b:	0f b6 00             	movzbl (%eax),%eax
     21e:	84 c0                	test   %al,%al
     220:	75 d4                	jne    1f6 <match+0x27>
  return 0;
     222:	b8 00 00 00 00       	mov    $0x0,%eax
}
     227:	c9                   	leave  
     228:	c3                   	ret    

00000229 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
     229:	55                   	push   %ebp
     22a:	89 e5                	mov    %esp,%ebp
     22c:	83 ec 08             	sub    $0x8,%esp
  if(re[0] == '\0')
     22f:	8b 45 08             	mov    0x8(%ebp),%eax
     232:	0f b6 00             	movzbl (%eax),%eax
     235:	84 c0                	test   %al,%al
     237:	75 0a                	jne    243 <matchhere+0x1a>
    return 1;
     239:	b8 01 00 00 00       	mov    $0x1,%eax
     23e:	e9 99 00 00 00       	jmp    2dc <matchhere+0xb3>
  if(re[1] == '*')
     243:	8b 45 08             	mov    0x8(%ebp),%eax
     246:	83 c0 01             	add    $0x1,%eax
     249:	0f b6 00             	movzbl (%eax),%eax
     24c:	3c 2a                	cmp    $0x2a,%al
     24e:	75 21                	jne    271 <matchhere+0x48>
    return matchstar(re[0], re+2, text);
     250:	8b 45 08             	mov    0x8(%ebp),%eax
     253:	8d 50 02             	lea    0x2(%eax),%edx
     256:	8b 45 08             	mov    0x8(%ebp),%eax
     259:	0f b6 00             	movzbl (%eax),%eax
     25c:	0f be c0             	movsbl %al,%eax
     25f:	83 ec 04             	sub    $0x4,%esp
     262:	ff 75 0c             	pushl  0xc(%ebp)
     265:	52                   	push   %edx
     266:	50                   	push   %eax
     267:	e8 72 00 00 00       	call   2de <matchstar>
     26c:	83 c4 10             	add    $0x10,%esp
     26f:	eb 6b                	jmp    2dc <matchhere+0xb3>
  if(re[0] == '$' && re[1] == '\0')
     271:	8b 45 08             	mov    0x8(%ebp),%eax
     274:	0f b6 00             	movzbl (%eax),%eax
     277:	3c 24                	cmp    $0x24,%al
     279:	75 1d                	jne    298 <matchhere+0x6f>
     27b:	8b 45 08             	mov    0x8(%ebp),%eax
     27e:	83 c0 01             	add    $0x1,%eax
     281:	0f b6 00             	movzbl (%eax),%eax
     284:	84 c0                	test   %al,%al
     286:	75 10                	jne    298 <matchhere+0x6f>
    return *text == '\0';
     288:	8b 45 0c             	mov    0xc(%ebp),%eax
     28b:	0f b6 00             	movzbl (%eax),%eax
     28e:	84 c0                	test   %al,%al
     290:	0f 94 c0             	sete   %al
     293:	0f b6 c0             	movzbl %al,%eax
     296:	eb 44                	jmp    2dc <matchhere+0xb3>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
     298:	8b 45 0c             	mov    0xc(%ebp),%eax
     29b:	0f b6 00             	movzbl (%eax),%eax
     29e:	84 c0                	test   %al,%al
     2a0:	74 35                	je     2d7 <matchhere+0xae>
     2a2:	8b 45 08             	mov    0x8(%ebp),%eax
     2a5:	0f b6 00             	movzbl (%eax),%eax
     2a8:	3c 2e                	cmp    $0x2e,%al
     2aa:	74 10                	je     2bc <matchhere+0x93>
     2ac:	8b 45 08             	mov    0x8(%ebp),%eax
     2af:	0f b6 10             	movzbl (%eax),%edx
     2b2:	8b 45 0c             	mov    0xc(%ebp),%eax
     2b5:	0f b6 00             	movzbl (%eax),%eax
     2b8:	38 c2                	cmp    %al,%dl
     2ba:	75 1b                	jne    2d7 <matchhere+0xae>
    return matchhere(re+1, text+1);
     2bc:	8b 45 0c             	mov    0xc(%ebp),%eax
     2bf:	8d 50 01             	lea    0x1(%eax),%edx
     2c2:	8b 45 08             	mov    0x8(%ebp),%eax
     2c5:	83 c0 01             	add    $0x1,%eax
     2c8:	83 ec 08             	sub    $0x8,%esp
     2cb:	52                   	push   %edx
     2cc:	50                   	push   %eax
     2cd:	e8 57 ff ff ff       	call   229 <matchhere>
     2d2:	83 c4 10             	add    $0x10,%esp
     2d5:	eb 05                	jmp    2dc <matchhere+0xb3>
  return 0;
     2d7:	b8 00 00 00 00       	mov    $0x0,%eax
}
     2dc:	c9                   	leave  
     2dd:	c3                   	ret    

000002de <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
     2de:	55                   	push   %ebp
     2df:	89 e5                	mov    %esp,%ebp
     2e1:	83 ec 08             	sub    $0x8,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
     2e4:	83 ec 08             	sub    $0x8,%esp
     2e7:	ff 75 10             	pushl  0x10(%ebp)
     2ea:	ff 75 0c             	pushl  0xc(%ebp)
     2ed:	e8 37 ff ff ff       	call   229 <matchhere>
     2f2:	83 c4 10             	add    $0x10,%esp
     2f5:	85 c0                	test   %eax,%eax
     2f7:	74 07                	je     300 <matchstar+0x22>
      return 1;
     2f9:	b8 01 00 00 00       	mov    $0x1,%eax
     2fe:	eb 29                	jmp    329 <matchstar+0x4b>
  }while(*text!='\0' && (*text++==c || c=='.'));
     300:	8b 45 10             	mov    0x10(%ebp),%eax
     303:	0f b6 00             	movzbl (%eax),%eax
     306:	84 c0                	test   %al,%al
     308:	74 1a                	je     324 <matchstar+0x46>
     30a:	8b 45 10             	mov    0x10(%ebp),%eax
     30d:	8d 50 01             	lea    0x1(%eax),%edx
     310:	89 55 10             	mov    %edx,0x10(%ebp)
     313:	0f b6 00             	movzbl (%eax),%eax
     316:	0f be c0             	movsbl %al,%eax
     319:	3b 45 08             	cmp    0x8(%ebp),%eax
     31c:	74 c6                	je     2e4 <matchstar+0x6>
     31e:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
     322:	74 c0                	je     2e4 <matchstar+0x6>
  return 0;
     324:	b8 00 00 00 00       	mov    $0x0,%eax
}
     329:	c9                   	leave  
     32a:	c3                   	ret    

0000032b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     32b:	55                   	push   %ebp
     32c:	89 e5                	mov    %esp,%ebp
     32e:	57                   	push   %edi
     32f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     330:	8b 4d 08             	mov    0x8(%ebp),%ecx
     333:	8b 55 10             	mov    0x10(%ebp),%edx
     336:	8b 45 0c             	mov    0xc(%ebp),%eax
     339:	89 cb                	mov    %ecx,%ebx
     33b:	89 df                	mov    %ebx,%edi
     33d:	89 d1                	mov    %edx,%ecx
     33f:	fc                   	cld    
     340:	f3 aa                	rep stos %al,%es:(%edi)
     342:	89 ca                	mov    %ecx,%edx
     344:	89 fb                	mov    %edi,%ebx
     346:	89 5d 08             	mov    %ebx,0x8(%ebp)
     349:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     34c:	90                   	nop
     34d:	5b                   	pop    %ebx
     34e:	5f                   	pop    %edi
     34f:	5d                   	pop    %ebp
     350:	c3                   	ret    

00000351 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     351:	55                   	push   %ebp
     352:	89 e5                	mov    %esp,%ebp
     354:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     357:	8b 45 08             	mov    0x8(%ebp),%eax
     35a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     35d:	90                   	nop
     35e:	8b 45 08             	mov    0x8(%ebp),%eax
     361:	8d 50 01             	lea    0x1(%eax),%edx
     364:	89 55 08             	mov    %edx,0x8(%ebp)
     367:	8b 55 0c             	mov    0xc(%ebp),%edx
     36a:	8d 4a 01             	lea    0x1(%edx),%ecx
     36d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     370:	0f b6 12             	movzbl (%edx),%edx
     373:	88 10                	mov    %dl,(%eax)
     375:	0f b6 00             	movzbl (%eax),%eax
     378:	84 c0                	test   %al,%al
     37a:	75 e2                	jne    35e <strcpy+0xd>
    ;
  return os;
     37c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     37f:	c9                   	leave  
     380:	c3                   	ret    

00000381 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     381:	55                   	push   %ebp
     382:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     384:	eb 08                	jmp    38e <strcmp+0xd>
    p++, q++;
     386:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     38a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     38e:	8b 45 08             	mov    0x8(%ebp),%eax
     391:	0f b6 00             	movzbl (%eax),%eax
     394:	84 c0                	test   %al,%al
     396:	74 10                	je     3a8 <strcmp+0x27>
     398:	8b 45 08             	mov    0x8(%ebp),%eax
     39b:	0f b6 10             	movzbl (%eax),%edx
     39e:	8b 45 0c             	mov    0xc(%ebp),%eax
     3a1:	0f b6 00             	movzbl (%eax),%eax
     3a4:	38 c2                	cmp    %al,%dl
     3a6:	74 de                	je     386 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     3a8:	8b 45 08             	mov    0x8(%ebp),%eax
     3ab:	0f b6 00             	movzbl (%eax),%eax
     3ae:	0f b6 d0             	movzbl %al,%edx
     3b1:	8b 45 0c             	mov    0xc(%ebp),%eax
     3b4:	0f b6 00             	movzbl (%eax),%eax
     3b7:	0f b6 c0             	movzbl %al,%eax
     3ba:	29 c2                	sub    %eax,%edx
     3bc:	89 d0                	mov    %edx,%eax
}
     3be:	5d                   	pop    %ebp
     3bf:	c3                   	ret    

000003c0 <strlen>:

uint
strlen(char *s)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     3c6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     3cd:	eb 04                	jmp    3d3 <strlen+0x13>
     3cf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     3d3:	8b 55 fc             	mov    -0x4(%ebp),%edx
     3d6:	8b 45 08             	mov    0x8(%ebp),%eax
     3d9:	01 d0                	add    %edx,%eax
     3db:	0f b6 00             	movzbl (%eax),%eax
     3de:	84 c0                	test   %al,%al
     3e0:	75 ed                	jne    3cf <strlen+0xf>
    ;
  return n;
     3e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     3e5:	c9                   	leave  
     3e6:	c3                   	ret    

000003e7 <memset>:

void*
memset(void *dst, int c, uint n)
{
     3e7:	55                   	push   %ebp
     3e8:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     3ea:	8b 45 10             	mov    0x10(%ebp),%eax
     3ed:	50                   	push   %eax
     3ee:	ff 75 0c             	pushl  0xc(%ebp)
     3f1:	ff 75 08             	pushl  0x8(%ebp)
     3f4:	e8 32 ff ff ff       	call   32b <stosb>
     3f9:	83 c4 0c             	add    $0xc,%esp
  return dst;
     3fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
     3ff:	c9                   	leave  
     400:	c3                   	ret    

00000401 <strchr>:

char*
strchr(const char *s, char c)
{
     401:	55                   	push   %ebp
     402:	89 e5                	mov    %esp,%ebp
     404:	83 ec 04             	sub    $0x4,%esp
     407:	8b 45 0c             	mov    0xc(%ebp),%eax
     40a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     40d:	eb 14                	jmp    423 <strchr+0x22>
    if(*s == c)
     40f:	8b 45 08             	mov    0x8(%ebp),%eax
     412:	0f b6 00             	movzbl (%eax),%eax
     415:	3a 45 fc             	cmp    -0x4(%ebp),%al
     418:	75 05                	jne    41f <strchr+0x1e>
      return (char*)s;
     41a:	8b 45 08             	mov    0x8(%ebp),%eax
     41d:	eb 13                	jmp    432 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     41f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     423:	8b 45 08             	mov    0x8(%ebp),%eax
     426:	0f b6 00             	movzbl (%eax),%eax
     429:	84 c0                	test   %al,%al
     42b:	75 e2                	jne    40f <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     42d:	b8 00 00 00 00       	mov    $0x0,%eax
}
     432:	c9                   	leave  
     433:	c3                   	ret    

00000434 <gets>:

char*
gets(char *buf, int max)
{
     434:	55                   	push   %ebp
     435:	89 e5                	mov    %esp,%ebp
     437:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     43a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     441:	eb 42                	jmp    485 <gets+0x51>
    cc = read(0, &c, 1);
     443:	83 ec 04             	sub    $0x4,%esp
     446:	6a 01                	push   $0x1
     448:	8d 45 ef             	lea    -0x11(%ebp),%eax
     44b:	50                   	push   %eax
     44c:	6a 00                	push   $0x0
     44e:	e8 47 01 00 00       	call   59a <read>
     453:	83 c4 10             	add    $0x10,%esp
     456:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     459:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     45d:	7e 33                	jle    492 <gets+0x5e>
      break;
    buf[i++] = c;
     45f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     462:	8d 50 01             	lea    0x1(%eax),%edx
     465:	89 55 f4             	mov    %edx,-0xc(%ebp)
     468:	89 c2                	mov    %eax,%edx
     46a:	8b 45 08             	mov    0x8(%ebp),%eax
     46d:	01 c2                	add    %eax,%edx
     46f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     473:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     475:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     479:	3c 0a                	cmp    $0xa,%al
     47b:	74 16                	je     493 <gets+0x5f>
     47d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     481:	3c 0d                	cmp    $0xd,%al
     483:	74 0e                	je     493 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     485:	8b 45 f4             	mov    -0xc(%ebp),%eax
     488:	83 c0 01             	add    $0x1,%eax
     48b:	3b 45 0c             	cmp    0xc(%ebp),%eax
     48e:	7c b3                	jl     443 <gets+0xf>
     490:	eb 01                	jmp    493 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     492:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     493:	8b 55 f4             	mov    -0xc(%ebp),%edx
     496:	8b 45 08             	mov    0x8(%ebp),%eax
     499:	01 d0                	add    %edx,%eax
     49b:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     49e:	8b 45 08             	mov    0x8(%ebp),%eax
}
     4a1:	c9                   	leave  
     4a2:	c3                   	ret    

000004a3 <stat>:

int
stat(char *n, struct stat *st)
{
     4a3:	55                   	push   %ebp
     4a4:	89 e5                	mov    %esp,%ebp
     4a6:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     4a9:	83 ec 08             	sub    $0x8,%esp
     4ac:	6a 00                	push   $0x0
     4ae:	ff 75 08             	pushl  0x8(%ebp)
     4b1:	e8 0c 01 00 00       	call   5c2 <open>
     4b6:	83 c4 10             	add    $0x10,%esp
     4b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     4bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     4c0:	79 07                	jns    4c9 <stat+0x26>
    return -1;
     4c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     4c7:	eb 25                	jmp    4ee <stat+0x4b>
  r = fstat(fd, st);
     4c9:	83 ec 08             	sub    $0x8,%esp
     4cc:	ff 75 0c             	pushl  0xc(%ebp)
     4cf:	ff 75 f4             	pushl  -0xc(%ebp)
     4d2:	e8 03 01 00 00       	call   5da <fstat>
     4d7:	83 c4 10             	add    $0x10,%esp
     4da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     4dd:	83 ec 0c             	sub    $0xc,%esp
     4e0:	ff 75 f4             	pushl  -0xc(%ebp)
     4e3:	e8 c2 00 00 00       	call   5aa <close>
     4e8:	83 c4 10             	add    $0x10,%esp
  return r;
     4eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     4ee:	c9                   	leave  
     4ef:	c3                   	ret    

000004f0 <atoi>:

int
atoi(const char *s)
{
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     4f6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     4fd:	eb 25                	jmp    524 <atoi+0x34>
    n = n*10 + *s++ - '0';
     4ff:	8b 55 fc             	mov    -0x4(%ebp),%edx
     502:	89 d0                	mov    %edx,%eax
     504:	c1 e0 02             	shl    $0x2,%eax
     507:	01 d0                	add    %edx,%eax
     509:	01 c0                	add    %eax,%eax
     50b:	89 c1                	mov    %eax,%ecx
     50d:	8b 45 08             	mov    0x8(%ebp),%eax
     510:	8d 50 01             	lea    0x1(%eax),%edx
     513:	89 55 08             	mov    %edx,0x8(%ebp)
     516:	0f b6 00             	movzbl (%eax),%eax
     519:	0f be c0             	movsbl %al,%eax
     51c:	01 c8                	add    %ecx,%eax
     51e:	83 e8 30             	sub    $0x30,%eax
     521:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     524:	8b 45 08             	mov    0x8(%ebp),%eax
     527:	0f b6 00             	movzbl (%eax),%eax
     52a:	3c 2f                	cmp    $0x2f,%al
     52c:	7e 0a                	jle    538 <atoi+0x48>
     52e:	8b 45 08             	mov    0x8(%ebp),%eax
     531:	0f b6 00             	movzbl (%eax),%eax
     534:	3c 39                	cmp    $0x39,%al
     536:	7e c7                	jle    4ff <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     538:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     53b:	c9                   	leave  
     53c:	c3                   	ret    

0000053d <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     53d:	55                   	push   %ebp
     53e:	89 e5                	mov    %esp,%ebp
     540:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     543:	8b 45 08             	mov    0x8(%ebp),%eax
     546:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     549:	8b 45 0c             	mov    0xc(%ebp),%eax
     54c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     54f:	eb 17                	jmp    568 <memmove+0x2b>
    *dst++ = *src++;
     551:	8b 45 fc             	mov    -0x4(%ebp),%eax
     554:	8d 50 01             	lea    0x1(%eax),%edx
     557:	89 55 fc             	mov    %edx,-0x4(%ebp)
     55a:	8b 55 f8             	mov    -0x8(%ebp),%edx
     55d:	8d 4a 01             	lea    0x1(%edx),%ecx
     560:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     563:	0f b6 12             	movzbl (%edx),%edx
     566:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     568:	8b 45 10             	mov    0x10(%ebp),%eax
     56b:	8d 50 ff             	lea    -0x1(%eax),%edx
     56e:	89 55 10             	mov    %edx,0x10(%ebp)
     571:	85 c0                	test   %eax,%eax
     573:	7f dc                	jg     551 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     575:	8b 45 08             	mov    0x8(%ebp),%eax
}
     578:	c9                   	leave  
     579:	c3                   	ret    

0000057a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     57a:	b8 01 00 00 00       	mov    $0x1,%eax
     57f:	cd 40                	int    $0x40
     581:	c3                   	ret    

00000582 <exit>:
SYSCALL(exit)
     582:	b8 02 00 00 00       	mov    $0x2,%eax
     587:	cd 40                	int    $0x40
     589:	c3                   	ret    

0000058a <wait>:
SYSCALL(wait)
     58a:	b8 03 00 00 00       	mov    $0x3,%eax
     58f:	cd 40                	int    $0x40
     591:	c3                   	ret    

00000592 <pipe>:
SYSCALL(pipe)
     592:	b8 04 00 00 00       	mov    $0x4,%eax
     597:	cd 40                	int    $0x40
     599:	c3                   	ret    

0000059a <read>:
SYSCALL(read)
     59a:	b8 05 00 00 00       	mov    $0x5,%eax
     59f:	cd 40                	int    $0x40
     5a1:	c3                   	ret    

000005a2 <write>:
SYSCALL(write)
     5a2:	b8 10 00 00 00       	mov    $0x10,%eax
     5a7:	cd 40                	int    $0x40
     5a9:	c3                   	ret    

000005aa <close>:
SYSCALL(close)
     5aa:	b8 15 00 00 00       	mov    $0x15,%eax
     5af:	cd 40                	int    $0x40
     5b1:	c3                   	ret    

000005b2 <kill>:
SYSCALL(kill)
     5b2:	b8 06 00 00 00       	mov    $0x6,%eax
     5b7:	cd 40                	int    $0x40
     5b9:	c3                   	ret    

000005ba <exec>:
SYSCALL(exec)
     5ba:	b8 07 00 00 00       	mov    $0x7,%eax
     5bf:	cd 40                	int    $0x40
     5c1:	c3                   	ret    

000005c2 <open>:
SYSCALL(open)
     5c2:	b8 0f 00 00 00       	mov    $0xf,%eax
     5c7:	cd 40                	int    $0x40
     5c9:	c3                   	ret    

000005ca <mknod>:
SYSCALL(mknod)
     5ca:	b8 11 00 00 00       	mov    $0x11,%eax
     5cf:	cd 40                	int    $0x40
     5d1:	c3                   	ret    

000005d2 <unlink>:
SYSCALL(unlink)
     5d2:	b8 12 00 00 00       	mov    $0x12,%eax
     5d7:	cd 40                	int    $0x40
     5d9:	c3                   	ret    

000005da <fstat>:
SYSCALL(fstat)
     5da:	b8 08 00 00 00       	mov    $0x8,%eax
     5df:	cd 40                	int    $0x40
     5e1:	c3                   	ret    

000005e2 <link>:
SYSCALL(link)
     5e2:	b8 13 00 00 00       	mov    $0x13,%eax
     5e7:	cd 40                	int    $0x40
     5e9:	c3                   	ret    

000005ea <mkdir>:
SYSCALL(mkdir)
     5ea:	b8 14 00 00 00       	mov    $0x14,%eax
     5ef:	cd 40                	int    $0x40
     5f1:	c3                   	ret    

000005f2 <chdir>:
SYSCALL(chdir)
     5f2:	b8 09 00 00 00       	mov    $0x9,%eax
     5f7:	cd 40                	int    $0x40
     5f9:	c3                   	ret    

000005fa <dup>:
SYSCALL(dup)
     5fa:	b8 0a 00 00 00       	mov    $0xa,%eax
     5ff:	cd 40                	int    $0x40
     601:	c3                   	ret    

00000602 <getpid>:
SYSCALL(getpid)
     602:	b8 0b 00 00 00       	mov    $0xb,%eax
     607:	cd 40                	int    $0x40
     609:	c3                   	ret    

0000060a <sbrk>:
SYSCALL(sbrk)
     60a:	b8 0c 00 00 00       	mov    $0xc,%eax
     60f:	cd 40                	int    $0x40
     611:	c3                   	ret    

00000612 <sleep>:
SYSCALL(sleep)
     612:	b8 0d 00 00 00       	mov    $0xd,%eax
     617:	cd 40                	int    $0x40
     619:	c3                   	ret    

0000061a <uptime>:
SYSCALL(uptime)
     61a:	b8 0e 00 00 00       	mov    $0xe,%eax
     61f:	cd 40                	int    $0x40
     621:	c3                   	ret    

00000622 <colorwrite>:

//new here
SYSCALL(colorwrite)
     622:	b8 16 00 00 00       	mov    $0x16,%eax
     627:	cd 40                	int    $0x40
     629:	c3                   	ret    

0000062a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     62a:	55                   	push   %ebp
     62b:	89 e5                	mov    %esp,%ebp
     62d:	83 ec 18             	sub    $0x18,%esp
     630:	8b 45 0c             	mov    0xc(%ebp),%eax
     633:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     636:	83 ec 04             	sub    $0x4,%esp
     639:	6a 01                	push   $0x1
     63b:	8d 45 f4             	lea    -0xc(%ebp),%eax
     63e:	50                   	push   %eax
     63f:	ff 75 08             	pushl  0x8(%ebp)
     642:	e8 5b ff ff ff       	call   5a2 <write>
     647:	83 c4 10             	add    $0x10,%esp
}
     64a:	90                   	nop
     64b:	c9                   	leave  
     64c:	c3                   	ret    

0000064d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     64d:	55                   	push   %ebp
     64e:	89 e5                	mov    %esp,%ebp
     650:	53                   	push   %ebx
     651:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     654:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     65b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     65f:	74 17                	je     678 <printint+0x2b>
     661:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     665:	79 11                	jns    678 <printint+0x2b>
    neg = 1;
     667:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     66e:	8b 45 0c             	mov    0xc(%ebp),%eax
     671:	f7 d8                	neg    %eax
     673:	89 45 ec             	mov    %eax,-0x14(%ebp)
     676:	eb 06                	jmp    67e <printint+0x31>
  } else {
    x = xx;
     678:	8b 45 0c             	mov    0xc(%ebp),%eax
     67b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     67e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     685:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     688:	8d 41 01             	lea    0x1(%ecx),%eax
     68b:	89 45 f4             	mov    %eax,-0xc(%ebp)
     68e:	8b 5d 10             	mov    0x10(%ebp),%ebx
     691:	8b 45 ec             	mov    -0x14(%ebp),%eax
     694:	ba 00 00 00 00       	mov    $0x0,%edx
     699:	f7 f3                	div    %ebx
     69b:	89 d0                	mov    %edx,%eax
     69d:	0f b6 80 00 46 00 00 	movzbl 0x4600(%eax),%eax
     6a4:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     6a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
     6ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
     6ae:	ba 00 00 00 00       	mov    $0x0,%edx
     6b3:	f7 f3                	div    %ebx
     6b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
     6b8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     6bc:	75 c7                	jne    685 <printint+0x38>
  if(neg)
     6be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     6c2:	74 2d                	je     6f1 <printint+0xa4>
    buf[i++] = '-';
     6c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6c7:	8d 50 01             	lea    0x1(%eax),%edx
     6ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
     6cd:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     6d2:	eb 1d                	jmp    6f1 <printint+0xa4>
    putc(fd, buf[i]);
     6d4:	8d 55 dc             	lea    -0x24(%ebp),%edx
     6d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6da:	01 d0                	add    %edx,%eax
     6dc:	0f b6 00             	movzbl (%eax),%eax
     6df:	0f be c0             	movsbl %al,%eax
     6e2:	83 ec 08             	sub    $0x8,%esp
     6e5:	50                   	push   %eax
     6e6:	ff 75 08             	pushl  0x8(%ebp)
     6e9:	e8 3c ff ff ff       	call   62a <putc>
     6ee:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     6f1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     6f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     6f9:	79 d9                	jns    6d4 <printint+0x87>
    putc(fd, buf[i]);
}
     6fb:	90                   	nop
     6fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     6ff:	c9                   	leave  
     700:	c3                   	ret    

00000701 <getInteger>:

static int getInteger(double num)
{
     701:	55                   	push   %ebp
     702:	89 e5                	mov    %esp,%ebp
     704:	83 ec 18             	sub    $0x18,%esp
     707:	8b 45 08             	mov    0x8(%ebp),%eax
     70a:	89 45 e8             	mov    %eax,-0x18(%ebp)
     70d:	8b 45 0c             	mov    0xc(%ebp),%eax
     710:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     713:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     71a:	eb 0e                	jmp    72a <getInteger+0x29>
  {
    num -= 1;
     71c:	dd 45 e8             	fldl   -0x18(%ebp)
     71f:	d9 e8                	fld1   
     721:	de e9                	fsubrp %st,%st(1)
     723:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     726:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     72a:	dd 45 e8             	fldl   -0x18(%ebp)
     72d:	d9 e8                	fld1   
     72f:	d9 c9                	fxch   %st(1)
     731:	df e9                	fucomip %st(1),%st
     733:	dd d8                	fstp   %st(0)
     735:	77 e5                	ja     71c <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     737:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     73a:	c9                   	leave  
     73b:	c3                   	ret    

0000073c <printdbl>:

void printdbl(int fd, double num)
{
     73c:	55                   	push   %ebp
     73d:	89 e5                	mov    %esp,%ebp
     73f:	83 ec 28             	sub    $0x28,%esp
     742:	8b 45 0c             	mov    0xc(%ebp),%eax
     745:	89 45 e0             	mov    %eax,-0x20(%ebp)
     748:	8b 45 10             	mov    0x10(%ebp),%eax
     74b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     74e:	d9 ee                	fldz   
     750:	dd 45 e0             	fldl   -0x20(%ebp)
     753:	d9 c9                	fxch   %st(1)
     755:	df e9                	fucomip %st(1),%st
     757:	dd d8                	fstp   %st(0)
     759:	76 18                	jbe    773 <printdbl+0x37>
  {
    putc(fd,'-');
     75b:	83 ec 08             	sub    $0x8,%esp
     75e:	6a 2d                	push   $0x2d
     760:	ff 75 08             	pushl  0x8(%ebp)
     763:	e8 c2 fe ff ff       	call   62a <putc>
     768:	83 c4 10             	add    $0x10,%esp
    num = -num;
     76b:	dd 45 e0             	fldl   -0x20(%ebp)
     76e:	d9 e0                	fchs   
     770:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     773:	83 ec 08             	sub    $0x8,%esp
     776:	ff 75 e4             	pushl  -0x1c(%ebp)
     779:	ff 75 e0             	pushl  -0x20(%ebp)
     77c:	e8 80 ff ff ff       	call   701 <getInteger>
     781:	83 c4 10             	add    $0x10,%esp
     784:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     787:	6a 01                	push   $0x1
     789:	6a 0a                	push   $0xa
     78b:	ff 75 f0             	pushl  -0x10(%ebp)
     78e:	ff 75 08             	pushl  0x8(%ebp)
     791:	e8 b7 fe ff ff       	call   64d <printint>
     796:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     799:	db 45 f0             	fildl  -0x10(%ebp)
     79c:	dd 45 e0             	fldl   -0x20(%ebp)
     79f:	de e1                	fsubp  %st,%st(1)
     7a1:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     7a4:	dd 45 e0             	fldl   -0x20(%ebp)
     7a7:	dd 05 60 39 00 00    	fldl   0x3960
     7ad:	d9 c9                	fxch   %st(1)
     7af:	df e9                	fucomip %st(1),%st
     7b1:	dd d8                	fstp   %st(0)
     7b3:	76 10                	jbe    7c5 <printdbl+0x89>
    putc(fd,'.');
     7b5:	83 ec 08             	sub    $0x8,%esp
     7b8:	6a 2e                	push   $0x2e
     7ba:	ff 75 08             	pushl  0x8(%ebp)
     7bd:	e8 68 fe ff ff       	call   62a <putc>
     7c2:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     7c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     7cc:	eb 49                	jmp    817 <printdbl+0xdb>
  {
    num = num*10;
     7ce:	dd 45 e0             	fldl   -0x20(%ebp)
     7d1:	dd 05 68 39 00 00    	fldl   0x3968
     7d7:	de c9                	fmulp  %st,%st(1)
     7d9:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     7dc:	83 ec 08             	sub    $0x8,%esp
     7df:	ff 75 e4             	pushl  -0x1c(%ebp)
     7e2:	ff 75 e0             	pushl  -0x20(%ebp)
     7e5:	e8 17 ff ff ff       	call   701 <getInteger>
     7ea:	83 c4 10             	add    $0x10,%esp
     7ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     7f0:	6a 01                	push   $0x1
     7f2:	6a 0a                	push   $0xa
     7f4:	ff 75 f0             	pushl  -0x10(%ebp)
     7f7:	ff 75 08             	pushl  0x8(%ebp)
     7fa:	e8 4e fe ff ff       	call   64d <printint>
     7ff:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     802:	db 45 f0             	fildl  -0x10(%ebp)
     805:	dd 45 e0             	fldl   -0x20(%ebp)
     808:	de e1                	fsubp  %st,%st(1)
     80a:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     80d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     811:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     815:	7f 13                	jg     82a <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     817:	dd 45 e0             	fldl   -0x20(%ebp)
     81a:	dd 05 60 39 00 00    	fldl   0x3960
     820:	d9 c9                	fxch   %st(1)
     822:	df e9                	fucomip %st(1),%st
     824:	dd d8                	fstp   %st(0)
     826:	77 a6                	ja     7ce <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     828:	eb 01                	jmp    82b <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     82a:	90                   	nop
    }
  }
}
     82b:	90                   	nop
     82c:	c9                   	leave  
     82d:	c3                   	ret    

0000082e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     82e:	55                   	push   %ebp
     82f:	89 e5                	mov    %esp,%ebp
     831:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     834:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     83b:	8d 45 0c             	lea    0xc(%ebp),%eax
     83e:	83 c0 04             	add    $0x4,%eax
     841:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     844:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     84b:	e9 88 01 00 00       	jmp    9d8 <printf+0x1aa>
    c = fmt[i] & 0xff;
     850:	8b 55 0c             	mov    0xc(%ebp),%edx
     853:	8b 45 f0             	mov    -0x10(%ebp),%eax
     856:	01 d0                	add    %edx,%eax
     858:	0f b6 00             	movzbl (%eax),%eax
     85b:	0f be c0             	movsbl %al,%eax
     85e:	25 ff 00 00 00       	and    $0xff,%eax
     863:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     866:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     86a:	75 2c                	jne    898 <printf+0x6a>
      if(c == '%'){
     86c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     870:	75 0c                	jne    87e <printf+0x50>
        state = '%';
     872:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     879:	e9 56 01 00 00       	jmp    9d4 <printf+0x1a6>
      } else {
        putc(fd, c);
     87e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     881:	0f be c0             	movsbl %al,%eax
     884:	83 ec 08             	sub    $0x8,%esp
     887:	50                   	push   %eax
     888:	ff 75 08             	pushl  0x8(%ebp)
     88b:	e8 9a fd ff ff       	call   62a <putc>
     890:	83 c4 10             	add    $0x10,%esp
     893:	e9 3c 01 00 00       	jmp    9d4 <printf+0x1a6>
      }
    } else if(state == '%'){
     898:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     89c:	0f 85 32 01 00 00    	jne    9d4 <printf+0x1a6>
      if(c == 'd'){
     8a2:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     8a6:	75 1e                	jne    8c6 <printf+0x98>
        printint(fd, *ap, 10, 1);
     8a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
     8ab:	8b 00                	mov    (%eax),%eax
     8ad:	6a 01                	push   $0x1
     8af:	6a 0a                	push   $0xa
     8b1:	50                   	push   %eax
     8b2:	ff 75 08             	pushl  0x8(%ebp)
     8b5:	e8 93 fd ff ff       	call   64d <printint>
     8ba:	83 c4 10             	add    $0x10,%esp
        ap++;
     8bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     8c1:	e9 07 01 00 00       	jmp    9cd <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     8c6:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     8ca:	74 06                	je     8d2 <printf+0xa4>
     8cc:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     8d0:	75 1e                	jne    8f0 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     8d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
     8d5:	8b 00                	mov    (%eax),%eax
     8d7:	6a 00                	push   $0x0
     8d9:	6a 10                	push   $0x10
     8db:	50                   	push   %eax
     8dc:	ff 75 08             	pushl  0x8(%ebp)
     8df:	e8 69 fd ff ff       	call   64d <printint>
     8e4:	83 c4 10             	add    $0x10,%esp
        ap++;
     8e7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     8eb:	e9 dd 00 00 00       	jmp    9cd <printf+0x19f>
      } else if(c == 's'){
     8f0:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     8f4:	75 46                	jne    93c <printf+0x10e>
        s = (char*)*ap;
     8f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     8f9:	8b 00                	mov    (%eax),%eax
     8fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     8fe:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     902:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     906:	75 25                	jne    92d <printf+0xff>
          s = "(null)";
     908:	c7 45 f4 58 39 00 00 	movl   $0x3958,-0xc(%ebp)
        while(*s != 0){
     90f:	eb 1c                	jmp    92d <printf+0xff>
          putc(fd, *s);
     911:	8b 45 f4             	mov    -0xc(%ebp),%eax
     914:	0f b6 00             	movzbl (%eax),%eax
     917:	0f be c0             	movsbl %al,%eax
     91a:	83 ec 08             	sub    $0x8,%esp
     91d:	50                   	push   %eax
     91e:	ff 75 08             	pushl  0x8(%ebp)
     921:	e8 04 fd ff ff       	call   62a <putc>
     926:	83 c4 10             	add    $0x10,%esp
          s++;
     929:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     92d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     930:	0f b6 00             	movzbl (%eax),%eax
     933:	84 c0                	test   %al,%al
     935:	75 da                	jne    911 <printf+0xe3>
     937:	e9 91 00 00 00       	jmp    9cd <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     93c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     940:	75 1d                	jne    95f <printf+0x131>
        putc(fd, *ap);
     942:	8b 45 e8             	mov    -0x18(%ebp),%eax
     945:	8b 00                	mov    (%eax),%eax
     947:	0f be c0             	movsbl %al,%eax
     94a:	83 ec 08             	sub    $0x8,%esp
     94d:	50                   	push   %eax
     94e:	ff 75 08             	pushl  0x8(%ebp)
     951:	e8 d4 fc ff ff       	call   62a <putc>
     956:	83 c4 10             	add    $0x10,%esp
        ap++;
     959:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     95d:	eb 6e                	jmp    9cd <printf+0x19f>
      } else if(c == '%'){
     95f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     963:	75 17                	jne    97c <printf+0x14e>
        putc(fd, c);
     965:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     968:	0f be c0             	movsbl %al,%eax
     96b:	83 ec 08             	sub    $0x8,%esp
     96e:	50                   	push   %eax
     96f:	ff 75 08             	pushl  0x8(%ebp)
     972:	e8 b3 fc ff ff       	call   62a <putc>
     977:	83 c4 10             	add    $0x10,%esp
     97a:	eb 51                	jmp    9cd <printf+0x19f>
      } else if(c == 'f'){ //for double
     97c:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     980:	75 26                	jne    9a8 <printf+0x17a>
        double *dap = (double*)ap;
     982:	8b 45 e8             	mov    -0x18(%ebp),%eax
     985:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     988:	8b 45 e0             	mov    -0x20(%ebp),%eax
     98b:	dd 00                	fldl   (%eax)
     98d:	83 ec 04             	sub    $0x4,%esp
     990:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     994:	dd 1c 24             	fstpl  (%esp)
     997:	ff 75 08             	pushl  0x8(%ebp)
     99a:	e8 9d fd ff ff       	call   73c <printdbl>
     99f:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     9a2:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     9a6:	eb 25                	jmp    9cd <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9a8:	83 ec 08             	sub    $0x8,%esp
     9ab:	6a 25                	push   $0x25
     9ad:	ff 75 08             	pushl  0x8(%ebp)
     9b0:	e8 75 fc ff ff       	call   62a <putc>
     9b5:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     9b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9bb:	0f be c0             	movsbl %al,%eax
     9be:	83 ec 08             	sub    $0x8,%esp
     9c1:	50                   	push   %eax
     9c2:	ff 75 08             	pushl  0x8(%ebp)
     9c5:	e8 60 fc ff ff       	call   62a <putc>
     9ca:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     9cd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     9d4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     9d8:	8b 55 0c             	mov    0xc(%ebp),%edx
     9db:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9de:	01 d0                	add    %edx,%eax
     9e0:	0f b6 00             	movzbl (%eax),%eax
     9e3:	84 c0                	test   %al,%al
     9e5:	0f 85 65 fe ff ff    	jne    850 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     9eb:	90                   	nop
     9ec:	c9                   	leave  
     9ed:	c3                   	ret    

000009ee <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     9ee:	55                   	push   %ebp
     9ef:	89 e5                	mov    %esp,%ebp
     9f1:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     9f4:	8b 45 08             	mov    0x8(%ebp),%eax
     9f7:	83 e8 08             	sub    $0x8,%eax
     9fa:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     9fd:	a1 48 47 00 00       	mov    0x4748,%eax
     a02:	89 45 fc             	mov    %eax,-0x4(%ebp)
     a05:	eb 24                	jmp    a2b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     a07:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a0a:	8b 00                	mov    (%eax),%eax
     a0c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     a0f:	77 12                	ja     a23 <free+0x35>
     a11:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a14:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     a17:	77 24                	ja     a3d <free+0x4f>
     a19:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a1c:	8b 00                	mov    (%eax),%eax
     a1e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     a21:	77 1a                	ja     a3d <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     a23:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a26:	8b 00                	mov    (%eax),%eax
     a28:	89 45 fc             	mov    %eax,-0x4(%ebp)
     a2b:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a2e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     a31:	76 d4                	jbe    a07 <free+0x19>
     a33:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a36:	8b 00                	mov    (%eax),%eax
     a38:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     a3b:	76 ca                	jbe    a07 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     a3d:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a40:	8b 40 04             	mov    0x4(%eax),%eax
     a43:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     a4a:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a4d:	01 c2                	add    %eax,%edx
     a4f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a52:	8b 00                	mov    (%eax),%eax
     a54:	39 c2                	cmp    %eax,%edx
     a56:	75 24                	jne    a7c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     a58:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a5b:	8b 50 04             	mov    0x4(%eax),%edx
     a5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a61:	8b 00                	mov    (%eax),%eax
     a63:	8b 40 04             	mov    0x4(%eax),%eax
     a66:	01 c2                	add    %eax,%edx
     a68:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a6b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     a6e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a71:	8b 00                	mov    (%eax),%eax
     a73:	8b 10                	mov    (%eax),%edx
     a75:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a78:	89 10                	mov    %edx,(%eax)
     a7a:	eb 0a                	jmp    a86 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     a7c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a7f:	8b 10                	mov    (%eax),%edx
     a81:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a84:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     a86:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a89:	8b 40 04             	mov    0x4(%eax),%eax
     a8c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     a93:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a96:	01 d0                	add    %edx,%eax
     a98:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     a9b:	75 20                	jne    abd <free+0xcf>
    p->s.size += bp->s.size;
     a9d:	8b 45 fc             	mov    -0x4(%ebp),%eax
     aa0:	8b 50 04             	mov    0x4(%eax),%edx
     aa3:	8b 45 f8             	mov    -0x8(%ebp),%eax
     aa6:	8b 40 04             	mov    0x4(%eax),%eax
     aa9:	01 c2                	add    %eax,%edx
     aab:	8b 45 fc             	mov    -0x4(%ebp),%eax
     aae:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     ab1:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ab4:	8b 10                	mov    (%eax),%edx
     ab6:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ab9:	89 10                	mov    %edx,(%eax)
     abb:	eb 08                	jmp    ac5 <free+0xd7>
  } else
    p->s.ptr = bp;
     abd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ac0:	8b 55 f8             	mov    -0x8(%ebp),%edx
     ac3:	89 10                	mov    %edx,(%eax)
  freep = p;
     ac5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ac8:	a3 48 47 00 00       	mov    %eax,0x4748
}
     acd:	90                   	nop
     ace:	c9                   	leave  
     acf:	c3                   	ret    

00000ad0 <morecore>:

static Header*
morecore(uint nu)
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     ad6:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     add:	77 07                	ja     ae6 <morecore+0x16>
    nu = 4096;
     adf:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     ae6:	8b 45 08             	mov    0x8(%ebp),%eax
     ae9:	c1 e0 03             	shl    $0x3,%eax
     aec:	83 ec 0c             	sub    $0xc,%esp
     aef:	50                   	push   %eax
     af0:	e8 15 fb ff ff       	call   60a <sbrk>
     af5:	83 c4 10             	add    $0x10,%esp
     af8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     afb:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     aff:	75 07                	jne    b08 <morecore+0x38>
    return 0;
     b01:	b8 00 00 00 00       	mov    $0x0,%eax
     b06:	eb 26                	jmp    b2e <morecore+0x5e>
  hp = (Header*)p;
     b08:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     b0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b11:	8b 55 08             	mov    0x8(%ebp),%edx
     b14:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     b17:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b1a:	83 c0 08             	add    $0x8,%eax
     b1d:	83 ec 0c             	sub    $0xc,%esp
     b20:	50                   	push   %eax
     b21:	e8 c8 fe ff ff       	call   9ee <free>
     b26:	83 c4 10             	add    $0x10,%esp
  return freep;
     b29:	a1 48 47 00 00       	mov    0x4748,%eax
}
     b2e:	c9                   	leave  
     b2f:	c3                   	ret    

00000b30 <malloc>:

void*
malloc(uint nbytes)
{
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     b36:	8b 45 08             	mov    0x8(%ebp),%eax
     b39:	83 c0 07             	add    $0x7,%eax
     b3c:	c1 e8 03             	shr    $0x3,%eax
     b3f:	83 c0 01             	add    $0x1,%eax
     b42:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     b45:	a1 48 47 00 00       	mov    0x4748,%eax
     b4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
     b4d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     b51:	75 23                	jne    b76 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     b53:	c7 45 f0 40 47 00 00 	movl   $0x4740,-0x10(%ebp)
     b5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b5d:	a3 48 47 00 00       	mov    %eax,0x4748
     b62:	a1 48 47 00 00       	mov    0x4748,%eax
     b67:	a3 40 47 00 00       	mov    %eax,0x4740
    base.s.size = 0;
     b6c:	c7 05 44 47 00 00 00 	movl   $0x0,0x4744
     b73:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     b76:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b79:	8b 00                	mov    (%eax),%eax
     b7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     b7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b81:	8b 40 04             	mov    0x4(%eax),%eax
     b84:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     b87:	72 4d                	jb     bd6 <malloc+0xa6>
      if(p->s.size == nunits)
     b89:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b8c:	8b 40 04             	mov    0x4(%eax),%eax
     b8f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     b92:	75 0c                	jne    ba0 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     b94:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b97:	8b 10                	mov    (%eax),%edx
     b99:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b9c:	89 10                	mov    %edx,(%eax)
     b9e:	eb 26                	jmp    bc6 <malloc+0x96>
      else {
        p->s.size -= nunits;
     ba0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ba3:	8b 40 04             	mov    0x4(%eax),%eax
     ba6:	2b 45 ec             	sub    -0x14(%ebp),%eax
     ba9:	89 c2                	mov    %eax,%edx
     bab:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bae:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bb4:	8b 40 04             	mov    0x4(%eax),%eax
     bb7:	c1 e0 03             	shl    $0x3,%eax
     bba:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     bbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bc0:	8b 55 ec             	mov    -0x14(%ebp),%edx
     bc3:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     bc6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bc9:	a3 48 47 00 00       	mov    %eax,0x4748
      return (void*)(p + 1);
     bce:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bd1:	83 c0 08             	add    $0x8,%eax
     bd4:	eb 3b                	jmp    c11 <malloc+0xe1>
    }
    if(p == freep)
     bd6:	a1 48 47 00 00       	mov    0x4748,%eax
     bdb:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     bde:	75 1e                	jne    bfe <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     be0:	83 ec 0c             	sub    $0xc,%esp
     be3:	ff 75 ec             	pushl  -0x14(%ebp)
     be6:	e8 e5 fe ff ff       	call   ad0 <morecore>
     beb:	83 c4 10             	add    $0x10,%esp
     bee:	89 45 f4             	mov    %eax,-0xc(%ebp)
     bf1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     bf5:	75 07                	jne    bfe <malloc+0xce>
        return 0;
     bf7:	b8 00 00 00 00       	mov    $0x0,%eax
     bfc:	eb 13                	jmp    c11 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     bfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c01:	89 45 f0             	mov    %eax,-0x10(%ebp)
     c04:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c07:	8b 00                	mov    (%eax),%eax
     c09:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     c0c:	e9 6d ff ff ff       	jmp    b7e <malloc+0x4e>
}
     c11:	c9                   	leave  
     c12:	c3                   	ret    

00000c13 <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     c13:	55                   	push   %ebp
     c14:	89 e5                	mov    %esp,%ebp
     c16:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     c19:	83 ec 04             	sub    $0x4,%esp
     c1c:	ff 75 08             	pushl  0x8(%ebp)
     c1f:	68 70 39 00 00       	push   $0x3970
     c24:	6a 02                	push   $0x2
     c26:	e8 03 fc ff ff       	call   82e <printf>
     c2b:	83 c4 10             	add    $0x10,%esp
  exit();
     c2e:	e8 4f f9 ff ff       	call   582 <exit>

00000c33 <getInteger>:
}

static int getInteger(double num)
{
     c33:	55                   	push   %ebp
     c34:	89 e5                	mov    %esp,%ebp
     c36:	83 ec 18             	sub    $0x18,%esp
     c39:	8b 45 08             	mov    0x8(%ebp),%eax
     c3c:	89 45 e8             	mov    %eax,-0x18(%ebp)
     c3f:	8b 45 0c             	mov    0xc(%ebp),%eax
     c42:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     c45:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     c4c:	eb 0e                	jmp    c5c <getInteger+0x29>
  {
    num -= 1;
     c4e:	dd 45 e8             	fldl   -0x18(%ebp)
     c51:	d9 e8                	fld1   
     c53:	de e9                	fsubrp %st,%st(1)
     c55:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     c58:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     c5c:	dd 45 e8             	fldl   -0x18(%ebp)
     c5f:	d9 e8                	fld1   
     c61:	d9 c9                	fxch   %st(1)
     c63:	df e9                	fucomip %st(1),%st
     c65:	dd d8                	fstp   %st(0)
     c67:	77 e5                	ja     c4e <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     c69:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     c6c:	c9                   	leave  
     c6d:	c3                   	ret    

00000c6e <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     c6e:	55                   	push   %ebp
     c6f:	89 e5                	mov    %esp,%ebp
     c71:	53                   	push   %ebx
     c72:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     c75:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     c7c:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     c80:	74 17                	je     c99 <int2str+0x2b>
     c82:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     c86:	79 11                	jns    c99 <int2str+0x2b>
    neg = 1;
     c88:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     c8f:	8b 45 0c             	mov    0xc(%ebp),%eax
     c92:	f7 d8                	neg    %eax
     c94:	89 45 f0             	mov    %eax,-0x10(%ebp)
     c97:	eb 06                	jmp    c9f <int2str+0x31>
  } else {
    x = num;
     c99:	8b 45 0c             	mov    0xc(%ebp),%eax
     c9c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     c9f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     ca6:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     ca9:	8d 41 01             	lea    0x1(%ecx),%eax
     cac:	89 45 f8             	mov    %eax,-0x8(%ebp)
     caf:	8b 5d 14             	mov    0x14(%ebp),%ebx
     cb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cb5:	ba 00 00 00 00       	mov    $0x0,%edx
     cba:	f7 f3                	div    %ebx
     cbc:	89 d0                	mov    %edx,%eax
     cbe:	0f b6 80 14 46 00 00 	movzbl 0x4614(%eax),%eax
     cc5:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     cc9:	8b 5d 14             	mov    0x14(%ebp),%ebx
     ccc:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ccf:	ba 00 00 00 00       	mov    $0x0,%edx
     cd4:	f7 f3                	div    %ebx
     cd6:	89 45 f0             	mov    %eax,-0x10(%ebp)
     cd9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     cdd:	75 c7                	jne    ca6 <int2str+0x38>
  if(neg)
     cdf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ce3:	74 36                	je     d1b <int2str+0xad>
    buf[i++] = '-';
     ce5:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ce8:	8d 50 01             	lea    0x1(%eax),%edx
     ceb:	89 55 f8             	mov    %edx,-0x8(%ebp)
     cee:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     cf3:	eb 26                	jmp    d1b <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     cf5:	8b 45 10             	mov    0x10(%ebp),%eax
     cf8:	8b 00                	mov    (%eax),%eax
     cfa:	89 c2                	mov    %eax,%edx
     cfc:	8b 45 08             	mov    0x8(%ebp),%eax
     cff:	01 c2                	add    %eax,%edx
     d01:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     d04:	8b 45 f8             	mov    -0x8(%ebp),%eax
     d07:	01 c8                	add    %ecx,%eax
     d09:	0f b6 00             	movzbl (%eax),%eax
     d0c:	88 02                	mov    %al,(%edx)
    (*pos)++;
     d0e:	8b 45 10             	mov    0x10(%ebp),%eax
     d11:	8b 00                	mov    (%eax),%eax
     d13:	8d 50 01             	lea    0x1(%eax),%edx
     d16:	8b 45 10             	mov    0x10(%ebp),%eax
     d19:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     d1b:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     d1f:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     d23:	79 d0                	jns    cf5 <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     d25:	90                   	nop
     d26:	83 c4 20             	add    $0x20,%esp
     d29:	5b                   	pop    %ebx
     d2a:	5d                   	pop    %ebp
     d2b:	c3                   	ret    

00000d2c <double2str>:

void double2str(char *buf, double num, int *pos)
{
     d2c:	55                   	push   %ebp
     d2d:	89 e5                	mov    %esp,%ebp
     d2f:	83 ec 18             	sub    $0x18,%esp
     d32:	8b 45 0c             	mov    0xc(%ebp),%eax
     d35:	89 45 e8             	mov    %eax,-0x18(%ebp)
     d38:	8b 45 10             	mov    0x10(%ebp),%eax
     d3b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     d3e:	d9 ee                	fldz   
     d40:	dd 45 e8             	fldl   -0x18(%ebp)
     d43:	d9 c9                	fxch   %st(1)
     d45:	df e9                	fucomip %st(1),%st
     d47:	dd d8                	fstp   %st(0)
     d49:	76 24                	jbe    d6f <double2str+0x43>
  {
    buf[*pos] = '-';
     d4b:	8b 45 14             	mov    0x14(%ebp),%eax
     d4e:	8b 00                	mov    (%eax),%eax
     d50:	89 c2                	mov    %eax,%edx
     d52:	8b 45 08             	mov    0x8(%ebp),%eax
     d55:	01 d0                	add    %edx,%eax
     d57:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     d5a:	8b 45 14             	mov    0x14(%ebp),%eax
     d5d:	8b 00                	mov    (%eax),%eax
     d5f:	8d 50 01             	lea    0x1(%eax),%edx
     d62:	8b 45 14             	mov    0x14(%ebp),%eax
     d65:	89 10                	mov    %edx,(%eax)
    num = -num;
     d67:	dd 45 e8             	fldl   -0x18(%ebp)
     d6a:	d9 e0                	fchs   
     d6c:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     d6f:	ff 75 ec             	pushl  -0x14(%ebp)
     d72:	ff 75 e8             	pushl  -0x18(%ebp)
     d75:	e8 b9 fe ff ff       	call   c33 <getInteger>
     d7a:	83 c4 08             	add    $0x8,%esp
     d7d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     d80:	83 ec 04             	sub    $0x4,%esp
     d83:	6a 01                	push   $0x1
     d85:	6a 0a                	push   $0xa
     d87:	ff 75 14             	pushl  0x14(%ebp)
     d8a:	ff 75 f8             	pushl  -0x8(%ebp)
     d8d:	ff 75 08             	pushl  0x8(%ebp)
     d90:	e8 d9 fe ff ff       	call   c6e <int2str>
     d95:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     d98:	db 45 f8             	fildl  -0x8(%ebp)
     d9b:	dd 45 e8             	fldl   -0x18(%ebp)
     d9e:	de e1                	fsubp  %st,%st(1)
     da0:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     da3:	dd 45 e8             	fldl   -0x18(%ebp)
     da6:	dd 05 78 39 00 00    	fldl   0x3978
     dac:	d9 c9                	fxch   %st(1)
     dae:	df e9                	fucomip %st(1),%st
     db0:	dd d8                	fstp   %st(0)
     db2:	76 1c                	jbe    dd0 <double2str+0xa4>
  {
    buf[*pos] = '.';
     db4:	8b 45 14             	mov    0x14(%ebp),%eax
     db7:	8b 00                	mov    (%eax),%eax
     db9:	89 c2                	mov    %eax,%edx
     dbb:	8b 45 08             	mov    0x8(%ebp),%eax
     dbe:	01 d0                	add    %edx,%eax
     dc0:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     dc3:	8b 45 14             	mov    0x14(%ebp),%eax
     dc6:	8b 00                	mov    (%eax),%eax
     dc8:	8d 50 01             	lea    0x1(%eax),%edx
     dcb:	8b 45 14             	mov    0x14(%ebp),%eax
     dce:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     dd0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     dd7:	eb 4c                	jmp    e25 <double2str+0xf9>
  {
    num = num*10;
     dd9:	dd 45 e8             	fldl   -0x18(%ebp)
     ddc:	dd 05 80 39 00 00    	fldl   0x3980
     de2:	de c9                	fmulp  %st,%st(1)
     de4:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     de7:	ff 75 ec             	pushl  -0x14(%ebp)
     dea:	ff 75 e8             	pushl  -0x18(%ebp)
     ded:	e8 41 fe ff ff       	call   c33 <getInteger>
     df2:	83 c4 08             	add    $0x8,%esp
     df5:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     df8:	83 ec 04             	sub    $0x4,%esp
     dfb:	6a 01                	push   $0x1
     dfd:	6a 0a                	push   $0xa
     dff:	ff 75 14             	pushl  0x14(%ebp)
     e02:	ff 75 f8             	pushl  -0x8(%ebp)
     e05:	ff 75 08             	pushl  0x8(%ebp)
     e08:	e8 61 fe ff ff       	call   c6e <int2str>
     e0d:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     e10:	db 45 f8             	fildl  -0x8(%ebp)
     e13:	dd 45 e8             	fldl   -0x18(%ebp)
     e16:	de e1                	fsubp  %st,%st(1)
     e18:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     e1b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     e1f:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     e23:	7f 13                	jg     e38 <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     e25:	dd 45 e8             	fldl   -0x18(%ebp)
     e28:	dd 05 78 39 00 00    	fldl   0x3978
     e2e:	d9 c9                	fxch   %st(1)
     e30:	df e9                	fucomip %st(1),%st
     e32:	dd d8                	fstp   %st(0)
     e34:	77 a3                	ja     dd9 <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     e36:	eb 01                	jmp    e39 <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     e38:	90                   	nop
    }
  }
}
     e39:	90                   	nop
     e3a:	c9                   	leave  
     e3b:	c3                   	ret    

00000e3c <pow>:

double pow(double opnd, int power)
{
     e3c:	55                   	push   %ebp
     e3d:	89 e5                	mov    %esp,%ebp
     e3f:	83 ec 18             	sub    $0x18,%esp
     e42:	8b 45 08             	mov    0x8(%ebp),%eax
     e45:	89 45 e8             	mov    %eax,-0x18(%ebp)
     e48:	8b 45 0c             	mov    0xc(%ebp),%eax
     e4b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     e4e:	d9 e8                	fld1   
     e50:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     e53:	eb 0d                	jmp    e62 <pow+0x26>
  {
    result *= opnd;
     e55:	dd 45 f8             	fldl   -0x8(%ebp)
     e58:	dc 4d e8             	fmull  -0x18(%ebp)
     e5b:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     e5e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     e62:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     e66:	7f ed                	jg     e55 <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     e68:	dd 45 f8             	fldl   -0x8(%ebp)
}
     e6b:	c9                   	leave  
     e6c:	c3                   	ret    

00000e6d <Translation>:

double Translation(char *s, int* pos)
{
     e6d:	55                   	push   %ebp
     e6e:	89 e5                	mov    %esp,%ebp
     e70:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     e73:	d9 ee                	fldz   
     e75:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     e78:	d9 ee                	fldz   
     e7a:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     e7d:	eb 3e                	jmp    ebd <Translation+0x50>
    {
        integer *= 10;
     e7f:	dd 45 f8             	fldl   -0x8(%ebp)
     e82:	dd 05 80 39 00 00    	fldl   0x3980
     e88:	de c9                	fmulp  %st,%st(1)
     e8a:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     e8d:	8b 45 0c             	mov    0xc(%ebp),%eax
     e90:	8b 00                	mov    (%eax),%eax
     e92:	89 c2                	mov    %eax,%edx
     e94:	8b 45 08             	mov    0x8(%ebp),%eax
     e97:	01 d0                	add    %edx,%eax
     e99:	0f b6 00             	movzbl (%eax),%eax
     e9c:	0f be c0             	movsbl %al,%eax
     e9f:	83 e8 30             	sub    $0x30,%eax
     ea2:	89 45 dc             	mov    %eax,-0x24(%ebp)
     ea5:	db 45 dc             	fildl  -0x24(%ebp)
     ea8:	dd 45 f8             	fldl   -0x8(%ebp)
     eab:	de c1                	faddp  %st,%st(1)
     ead:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     eb0:	8b 45 0c             	mov    0xc(%ebp),%eax
     eb3:	8b 00                	mov    (%eax),%eax
     eb5:	8d 50 01             	lea    0x1(%eax),%edx
     eb8:	8b 45 0c             	mov    0xc(%ebp),%eax
     ebb:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     ebd:	8b 45 0c             	mov    0xc(%ebp),%eax
     ec0:	8b 00                	mov    (%eax),%eax
     ec2:	89 c2                	mov    %eax,%edx
     ec4:	8b 45 08             	mov    0x8(%ebp),%eax
     ec7:	01 d0                	add    %edx,%eax
     ec9:	0f b6 00             	movzbl (%eax),%eax
     ecc:	3c 2f                	cmp    $0x2f,%al
     ece:	7e 13                	jle    ee3 <Translation+0x76>
     ed0:	8b 45 0c             	mov    0xc(%ebp),%eax
     ed3:	8b 00                	mov    (%eax),%eax
     ed5:	89 c2                	mov    %eax,%edx
     ed7:	8b 45 08             	mov    0x8(%ebp),%eax
     eda:	01 d0                	add    %edx,%eax
     edc:	0f b6 00             	movzbl (%eax),%eax
     edf:	3c 39                	cmp    $0x39,%al
     ee1:	7e 9c                	jle    e7f <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     ee3:	8b 45 0c             	mov    0xc(%ebp),%eax
     ee6:	8b 00                	mov    (%eax),%eax
     ee8:	89 c2                	mov    %eax,%edx
     eea:	8b 45 08             	mov    0x8(%ebp),%eax
     eed:	01 d0                	add    %edx,%eax
     eef:	0f b6 00             	movzbl (%eax),%eax
     ef2:	3c 2e                	cmp    $0x2e,%al
     ef4:	0f 85 9b 00 00 00    	jne    f95 <Translation+0x128>
    {
        (*pos)++;
     efa:	8b 45 0c             	mov    0xc(%ebp),%eax
     efd:	8b 00                	mov    (%eax),%eax
     eff:	8d 50 01             	lea    0x1(%eax),%edx
     f02:	8b 45 0c             	mov    0xc(%ebp),%eax
     f05:	89 10                	mov    %edx,(%eax)
        int c = 1;
     f07:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     f0e:	eb 5b                	jmp    f6b <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     f10:	8b 45 0c             	mov    0xc(%ebp),%eax
     f13:	8b 00                	mov    (%eax),%eax
     f15:	89 c2                	mov    %eax,%edx
     f17:	8b 45 08             	mov    0x8(%ebp),%eax
     f1a:	01 d0                	add    %edx,%eax
     f1c:	0f b6 00             	movzbl (%eax),%eax
     f1f:	0f be c0             	movsbl %al,%eax
     f22:	83 e8 30             	sub    $0x30,%eax
     f25:	89 45 dc             	mov    %eax,-0x24(%ebp)
     f28:	db 45 dc             	fildl  -0x24(%ebp)
     f2b:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     f2e:	83 ec 04             	sub    $0x4,%esp
     f31:	ff 75 ec             	pushl  -0x14(%ebp)
     f34:	dd 05 88 39 00 00    	fldl   0x3988
     f3a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     f3e:	dd 1c 24             	fstpl  (%esp)
     f41:	e8 f6 fe ff ff       	call   e3c <pow>
     f46:	83 c4 10             	add    $0x10,%esp
     f49:	dd 45 e0             	fldl   -0x20(%ebp)
     f4c:	de c9                	fmulp  %st,%st(1)
     f4e:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     f51:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     f55:	dd 45 f0             	fldl   -0x10(%ebp)
     f58:	dc 45 e0             	faddl  -0x20(%ebp)
     f5b:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     f5e:	8b 45 0c             	mov    0xc(%ebp),%eax
     f61:	8b 00                	mov    (%eax),%eax
     f63:	8d 50 01             	lea    0x1(%eax),%edx
     f66:	8b 45 0c             	mov    0xc(%ebp),%eax
     f69:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     f6b:	8b 45 0c             	mov    0xc(%ebp),%eax
     f6e:	8b 00                	mov    (%eax),%eax
     f70:	89 c2                	mov    %eax,%edx
     f72:	8b 45 08             	mov    0x8(%ebp),%eax
     f75:	01 d0                	add    %edx,%eax
     f77:	0f b6 00             	movzbl (%eax),%eax
     f7a:	3c 2f                	cmp    $0x2f,%al
     f7c:	7e 17                	jle    f95 <Translation+0x128>
     f7e:	8b 45 0c             	mov    0xc(%ebp),%eax
     f81:	8b 00                	mov    (%eax),%eax
     f83:	89 c2                	mov    %eax,%edx
     f85:	8b 45 08             	mov    0x8(%ebp),%eax
     f88:	01 d0                	add    %edx,%eax
     f8a:	0f b6 00             	movzbl (%eax),%eax
     f8d:	3c 39                	cmp    $0x39,%al
     f8f:	0f 8e 7b ff ff ff    	jle    f10 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     f95:	dd 45 f8             	fldl   -0x8(%ebp)
     f98:	dc 45 f0             	faddl  -0x10(%ebp)
     f9b:	c9                   	leave  
     f9c:	c3                   	ret    

00000f9d <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     f9d:	55                   	push   %ebp
     f9e:	89 e5                	mov    %esp,%ebp
     fa0:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     fa3:	e8 d2 f5 ff ff       	call   57a <fork>
     fa8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     fab:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     fae:	c9                   	leave  
     faf:	c3                   	ret    

00000fb0 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     fb0:	55                   	push   %ebp
     fb1:	89 e5                	mov    %esp,%ebp
     fb3:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     fb6:	83 ec 0c             	sub    $0xc,%esp
     fb9:	6a 54                	push   $0x54
     fbb:	e8 70 fb ff ff       	call   b30 <malloc>
     fc0:	83 c4 10             	add    $0x10,%esp
     fc3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     fc6:	83 ec 04             	sub    $0x4,%esp
     fc9:	6a 54                	push   $0x54
     fcb:	6a 00                	push   $0x0
     fcd:	ff 75 f4             	pushl  -0xc(%ebp)
     fd0:	e8 12 f4 ff ff       	call   3e7 <memset>
     fd5:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     fd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fdb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     fe1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     fe4:	c9                   	leave  
     fe5:	c3                   	ret    

00000fe6 <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     fe6:	55                   	push   %ebp
     fe7:	89 e5                	mov    %esp,%ebp
     fe9:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     fec:	83 ec 0c             	sub    $0xc,%esp
     fef:	6a 18                	push   $0x18
     ff1:	e8 3a fb ff ff       	call   b30 <malloc>
     ff6:	83 c4 10             	add    $0x10,%esp
     ff9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     ffc:	83 ec 04             	sub    $0x4,%esp
     fff:	6a 18                	push   $0x18
    1001:	6a 00                	push   $0x0
    1003:	ff 75 f4             	pushl  -0xc(%ebp)
    1006:	e8 dc f3 ff ff       	call   3e7 <memset>
    100b:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
    100e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1011:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
    1017:	8b 45 f4             	mov    -0xc(%ebp),%eax
    101a:	8b 55 08             	mov    0x8(%ebp),%edx
    101d:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
    1020:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1023:	8b 55 0c             	mov    0xc(%ebp),%edx
    1026:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
    1029:	8b 45 f4             	mov    -0xc(%ebp),%eax
    102c:	8b 55 10             	mov    0x10(%ebp),%edx
    102f:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
    1032:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1035:	8b 55 14             	mov    0x14(%ebp),%edx
    1038:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
    103b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    103e:	8b 55 18             	mov    0x18(%ebp),%edx
    1041:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
    1044:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1047:	c9                   	leave  
    1048:	c3                   	ret    

00001049 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
    1049:	55                   	push   %ebp
    104a:	89 e5                	mov    %esp,%ebp
    104c:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    104f:	83 ec 0c             	sub    $0xc,%esp
    1052:	6a 0c                	push   $0xc
    1054:	e8 d7 fa ff ff       	call   b30 <malloc>
    1059:	83 c4 10             	add    $0x10,%esp
    105c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    105f:	83 ec 04             	sub    $0x4,%esp
    1062:	6a 0c                	push   $0xc
    1064:	6a 00                	push   $0x0
    1066:	ff 75 f4             	pushl  -0xc(%ebp)
    1069:	e8 79 f3 ff ff       	call   3e7 <memset>
    106e:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
    1071:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1074:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
    107a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    107d:	8b 55 08             	mov    0x8(%ebp),%edx
    1080:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    1083:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1086:	8b 55 0c             	mov    0xc(%ebp),%edx
    1089:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    108c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    108f:	c9                   	leave  
    1090:	c3                   	ret    

00001091 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
    1091:	55                   	push   %ebp
    1092:	89 e5                	mov    %esp,%ebp
    1094:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1097:	83 ec 0c             	sub    $0xc,%esp
    109a:	6a 0c                	push   $0xc
    109c:	e8 8f fa ff ff       	call   b30 <malloc>
    10a1:	83 c4 10             	add    $0x10,%esp
    10a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    10a7:	83 ec 04             	sub    $0x4,%esp
    10aa:	6a 0c                	push   $0xc
    10ac:	6a 00                	push   $0x0
    10ae:	ff 75 f4             	pushl  -0xc(%ebp)
    10b1:	e8 31 f3 ff ff       	call   3e7 <memset>
    10b6:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
    10b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10bc:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
    10c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10c5:	8b 55 08             	mov    0x8(%ebp),%edx
    10c8:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    10cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10ce:	8b 55 0c             	mov    0xc(%ebp),%edx
    10d1:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    10d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    10d7:	c9                   	leave  
    10d8:	c3                   	ret    

000010d9 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
    10d9:	55                   	push   %ebp
    10da:	89 e5                	mov    %esp,%ebp
    10dc:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    10df:	83 ec 0c             	sub    $0xc,%esp
    10e2:	6a 08                	push   $0x8
    10e4:	e8 47 fa ff ff       	call   b30 <malloc>
    10e9:	83 c4 10             	add    $0x10,%esp
    10ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    10ef:	83 ec 04             	sub    $0x4,%esp
    10f2:	6a 08                	push   $0x8
    10f4:	6a 00                	push   $0x0
    10f6:	ff 75 f4             	pushl  -0xc(%ebp)
    10f9:	e8 e9 f2 ff ff       	call   3e7 <memset>
    10fe:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
    1101:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1104:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
    110a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    110d:	8b 55 08             	mov    0x8(%ebp),%edx
    1110:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    1113:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1116:	c9                   	leave  
    1117:	c3                   	ret    

00001118 <calcmd>:

struct cmd* calcmd(char *_line)
{
    1118:	55                   	push   %ebp
    1119:	89 e5                	mov    %esp,%ebp
    111b:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    111e:	83 ec 0c             	sub    $0xc,%esp
    1121:	6a 08                	push   $0x8
    1123:	e8 08 fa ff ff       	call   b30 <malloc>
    1128:	83 c4 10             	add    $0x10,%esp
    112b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    112e:	83 ec 04             	sub    $0x4,%esp
    1131:	6a 08                	push   $0x8
    1133:	6a 00                	push   $0x0
    1135:	ff 75 f4             	pushl  -0xc(%ebp)
    1138:	e8 aa f2 ff ff       	call   3e7 <memset>
    113d:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
    1140:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1143:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
    1149:	8b 45 f4             	mov    -0xc(%ebp),%eax
    114c:	8b 55 08             	mov    0x8(%ebp),%edx
    114f:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    1152:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1155:	c9                   	leave  
    1156:	c3                   	ret    

00001157 <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
    1157:	55                   	push   %ebp
    1158:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
    115a:	eb 0c                	jmp    1168 <mystrncmp+0x11>
    n--, p++, q++;
    115c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1160:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1164:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    1168:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    116c:	74 1a                	je     1188 <mystrncmp+0x31>
    116e:	8b 45 08             	mov    0x8(%ebp),%eax
    1171:	0f b6 00             	movzbl (%eax),%eax
    1174:	84 c0                	test   %al,%al
    1176:	74 10                	je     1188 <mystrncmp+0x31>
    1178:	8b 45 08             	mov    0x8(%ebp),%eax
    117b:	0f b6 10             	movzbl (%eax),%edx
    117e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1181:	0f b6 00             	movzbl (%eax),%eax
    1184:	38 c2                	cmp    %al,%dl
    1186:	74 d4                	je     115c <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
    1188:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    118c:	75 07                	jne    1195 <mystrncmp+0x3e>
    return 0;
    118e:	b8 00 00 00 00       	mov    $0x0,%eax
    1193:	eb 16                	jmp    11ab <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
    1195:	8b 45 08             	mov    0x8(%ebp),%eax
    1198:	0f b6 00             	movzbl (%eax),%eax
    119b:	0f b6 d0             	movzbl %al,%edx
    119e:	8b 45 0c             	mov    0xc(%ebp),%eax
    11a1:	0f b6 00             	movzbl (%eax),%eax
    11a4:	0f b6 c0             	movzbl %al,%eax
    11a7:	29 c2                	sub    %eax,%edx
    11a9:	89 d0                	mov    %edx,%eax
}
    11ab:	5d                   	pop    %ebp
    11ac:	c3                   	ret    

000011ad <mystrlen>:

static int mystrlen(const char *s)
{
    11ad:	55                   	push   %ebp
    11ae:	89 e5                	mov    %esp,%ebp
    11b0:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
    11b3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    11ba:	eb 04                	jmp    11c0 <mystrlen+0x13>
    11bc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    11c0:	8b 55 fc             	mov    -0x4(%ebp),%edx
    11c3:	8b 45 08             	mov    0x8(%ebp),%eax
    11c6:	01 d0                	add    %edx,%eax
    11c8:	0f b6 00             	movzbl (%eax),%eax
    11cb:	84 c0                	test   %al,%al
    11cd:	75 ed                	jne    11bc <mystrlen+0xf>
    ;
  return n;
    11cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    11d2:	c9                   	leave  
    11d3:	c3                   	ret    

000011d4 <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
    11d4:	55                   	push   %ebp
    11d5:	89 e5                	mov    %esp,%ebp
    11d7:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
    11da:	8b 45 08             	mov    0x8(%ebp),%eax
    11dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
    11e0:	90                   	nop
    11e1:	8b 45 10             	mov    0x10(%ebp),%eax
    11e4:	8d 50 ff             	lea    -0x1(%eax),%edx
    11e7:	89 55 10             	mov    %edx,0x10(%ebp)
    11ea:	85 c0                	test   %eax,%eax
    11ec:	7e 2c                	jle    121a <mystrncpy+0x46>
    11ee:	8b 45 08             	mov    0x8(%ebp),%eax
    11f1:	8d 50 01             	lea    0x1(%eax),%edx
    11f4:	89 55 08             	mov    %edx,0x8(%ebp)
    11f7:	8b 55 0c             	mov    0xc(%ebp),%edx
    11fa:	8d 4a 01             	lea    0x1(%edx),%ecx
    11fd:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1200:	0f b6 12             	movzbl (%edx),%edx
    1203:	88 10                	mov    %dl,(%eax)
    1205:	0f b6 00             	movzbl (%eax),%eax
    1208:	84 c0                	test   %al,%al
    120a:	75 d5                	jne    11e1 <mystrncpy+0xd>
    ;
  while(n-- > 0)
    120c:	eb 0c                	jmp    121a <mystrncpy+0x46>
    *s++ = 0;
    120e:	8b 45 08             	mov    0x8(%ebp),%eax
    1211:	8d 50 01             	lea    0x1(%eax),%edx
    1214:	89 55 08             	mov    %edx,0x8(%ebp)
    1217:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    121a:	8b 45 10             	mov    0x10(%ebp),%eax
    121d:	8d 50 ff             	lea    -0x1(%eax),%edx
    1220:	89 55 10             	mov    %edx,0x10(%ebp)
    1223:	85 c0                	test   %eax,%eax
    1225:	7f e7                	jg     120e <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    1227:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    122a:	c9                   	leave  
    122b:	c3                   	ret    

0000122c <isEqual>:

int isEqual(double a, double b)
{
    122c:	55                   	push   %ebp
    122d:	89 e5                	mov    %esp,%ebp
    122f:	83 ec 10             	sub    $0x10,%esp
    1232:	8b 45 08             	mov    0x8(%ebp),%eax
    1235:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1238:	8b 45 0c             	mov    0xc(%ebp),%eax
    123b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    123e:	8b 45 10             	mov    0x10(%ebp),%eax
    1241:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1244:	8b 45 14             	mov    0x14(%ebp),%eax
    1247:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    124a:	dd 45 f8             	fldl   -0x8(%ebp)
    124d:	dc 65 f0             	fsubl  -0x10(%ebp)
    1250:	dd 05 58 3b 00 00    	fldl   0x3b58
    1256:	df e9                	fucomip %st(1),%st
    1258:	dd d8                	fstp   %st(0)
    125a:	76 19                	jbe    1275 <isEqual+0x49>
    125c:	dd 45 f0             	fldl   -0x10(%ebp)
    125f:	dc 65 f8             	fsubl  -0x8(%ebp)
    1262:	dd 05 58 3b 00 00    	fldl   0x3b58
    1268:	df e9                	fucomip %st(1),%st
    126a:	dd d8                	fstp   %st(0)
    126c:	76 07                	jbe    1275 <isEqual+0x49>
    return 1;
    126e:	b8 01 00 00 00       	mov    $0x1,%eax
    1273:	eb 05                	jmp    127a <isEqual+0x4e>
  return 0;
    1275:	b8 00 00 00 00       	mov    $0x0,%eax
}
    127a:	c9                   	leave  
    127b:	c3                   	ret    

0000127c <isCmdName>:

int isCmdName(const char* str)
{
    127c:	55                   	push   %ebp
    127d:	89 e5                	mov    %esp,%ebp
    127f:	53                   	push   %ebx
    1280:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    1283:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    128a:	eb 71                	jmp    12fd <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    128c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    128f:	89 d0                	mov    %edx,%eax
    1291:	c1 e0 02             	shl    $0x2,%eax
    1294:	01 d0                	add    %edx,%eax
    1296:	01 c0                	add    %eax,%eax
    1298:	05 40 46 00 00       	add    $0x4640,%eax
    129d:	83 ec 0c             	sub    $0xc,%esp
    12a0:	50                   	push   %eax
    12a1:	e8 1a f1 ff ff       	call   3c0 <strlen>
    12a6:	83 c4 10             	add    $0x10,%esp
    12a9:	89 c3                	mov    %eax,%ebx
    12ab:	83 ec 0c             	sub    $0xc,%esp
    12ae:	ff 75 08             	pushl  0x8(%ebp)
    12b1:	e8 f7 fe ff ff       	call   11ad <mystrlen>
    12b6:	83 c4 10             	add    $0x10,%esp
    12b9:	39 c3                	cmp    %eax,%ebx
    12bb:	75 3c                	jne    12f9 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    12bd:	83 ec 0c             	sub    $0xc,%esp
    12c0:	ff 75 08             	pushl  0x8(%ebp)
    12c3:	e8 e5 fe ff ff       	call   11ad <mystrlen>
    12c8:	83 c4 10             	add    $0x10,%esp
    12cb:	89 c1                	mov    %eax,%ecx
    12cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    12d0:	89 d0                	mov    %edx,%eax
    12d2:	c1 e0 02             	shl    $0x2,%eax
    12d5:	01 d0                	add    %edx,%eax
    12d7:	01 c0                	add    %eax,%eax
    12d9:	05 40 46 00 00       	add    $0x4640,%eax
    12de:	83 ec 04             	sub    $0x4,%esp
    12e1:	51                   	push   %ecx
    12e2:	ff 75 08             	pushl  0x8(%ebp)
    12e5:	50                   	push   %eax
    12e6:	e8 6c fe ff ff       	call   1157 <mystrncmp>
    12eb:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    12ee:	85 c0                	test   %eax,%eax
    12f0:	75 07                	jne    12f9 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    12f2:	b8 01 00 00 00       	mov    $0x1,%eax
    12f7:	eb 0f                	jmp    1308 <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    12f9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    12fd:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1301:	7e 89                	jle    128c <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    1303:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1308:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    130b:	c9                   	leave  
    130c:	c3                   	ret    

0000130d <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    130d:	55                   	push   %ebp
    130e:	89 e5                	mov    %esp,%ebp
    1310:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    1316:	83 ec 08             	sub    $0x8,%esp
    1319:	6a 00                	push   $0x0
    131b:	68 08 47 00 00       	push   $0x4708
    1320:	e8 9d f2 ff ff       	call   5c2 <open>
    1325:	83 c4 10             	add    $0x10,%esp
    1328:	89 45 dc             	mov    %eax,-0x24(%ebp)
    132b:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    132f:	79 0a                	jns    133b <findAlias+0x2e>
  {
      return 0; //no aliasfile
    1331:	b8 00 00 00 00       	mov    $0x0,%eax
    1336:	e9 9a 01 00 00       	jmp    14d5 <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    133b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    1342:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1349:	e9 ee 00 00 00       	jmp    143c <findAlias+0x12f>
  {
      int isSame = 1;
    134e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    1355:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    135c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    1363:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    136a:	83 ec 0c             	sub    $0xc,%esp
    136d:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1370:	50                   	push   %eax
    1371:	e8 4a f0 ff ff       	call   3c0 <strlen>
    1376:	83 c4 10             	add    $0x10,%esp
    1379:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    137c:	83 ec 0c             	sub    $0xc,%esp
    137f:	ff 75 08             	pushl  0x8(%ebp)
    1382:	e8 39 f0 ff ff       	call   3c0 <strlen>
    1387:	83 c4 10             	add    $0x10,%esp
    138a:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    138d:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1390:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1393:	01 d0                	add    %edx,%eax
    1395:	0f b6 00             	movzbl (%eax),%eax
    1398:	3c 21                	cmp    $0x21,%al
    139a:	75 38                	jne    13d4 <findAlias+0xc7>
      {
          startIndex++;
    139c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    13a0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    13a7:	eb 2b                	jmp    13d4 <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    13a9:	8d 55 9a             	lea    -0x66(%ebp),%edx
    13ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13af:	01 d0                	add    %edx,%eax
    13b1:	0f b6 10             	movzbl (%eax),%edx
    13b4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    13b7:	8b 45 08             	mov    0x8(%ebp),%eax
    13ba:	01 c8                	add    %ecx,%eax
    13bc:	0f b6 00             	movzbl (%eax),%eax
    13bf:	38 c2                	cmp    %al,%dl
    13c1:	74 09                	je     13cc <findAlias+0xbf>
          {
              isSame = 0;
    13c3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    13ca:	eb 1f                	jmp    13eb <findAlias+0xde>
          }
          startIndex++;
    13cc:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    13d0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    13d4:	8d 55 9a             	lea    -0x66(%ebp),%edx
    13d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13da:	01 d0                	add    %edx,%eax
    13dc:	0f b6 00             	movzbl (%eax),%eax
    13df:	3c 3d                	cmp    $0x3d,%al
    13e1:	74 08                	je     13eb <findAlias+0xde>
    13e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    13e6:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    13e9:	7c be                	jl     13a9 <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    13eb:	8d 55 9a             	lea    -0x66(%ebp),%edx
    13ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13f1:	01 d0                	add    %edx,%eax
    13f3:	0f b6 00             	movzbl (%eax),%eax
    13f6:	3c 3d                	cmp    $0x3d,%al
    13f8:	75 08                	jne    1402 <findAlias+0xf5>
    13fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    13fd:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1400:	7d 07                	jge    1409 <findAlias+0xfc>
      {
          isSame = 0;
    1402:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    1409:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    140d:	75 0b                	jne    141a <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    140f:	b8 01 00 00 00       	mov    $0x1,%eax
    1414:	2b 45 f0             	sub    -0x10(%ebp),%eax
    1417:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    141a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    141e:	75 1c                	jne    143c <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    1420:	83 ec 08             	sub    $0x8,%esp
    1423:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1426:	50                   	push   %eax
    1427:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    142d:	50                   	push   %eax
    142e:	e8 1e ef ff ff       	call   351 <strcpy>
    1433:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    1436:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1439:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    143c:	83 ec 04             	sub    $0x4,%esp
    143f:	6a 32                	push   $0x32
    1441:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1444:	50                   	push   %eax
    1445:	ff 75 dc             	pushl  -0x24(%ebp)
    1448:	e8 4d f1 ff ff       	call   59a <read>
    144d:	83 c4 10             	add    $0x10,%esp
    1450:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1453:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    1457:	0f 8f f1 fe ff ff    	jg     134e <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    145d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1461:	75 5f                	jne    14c2 <findAlias+0x1b5>
  {
    int i = 0;
    1463:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    146a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    146e:	eb 20                	jmp    1490 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    1470:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1473:	8b 45 0c             	mov    0xc(%ebp),%eax
    1476:	01 c2                	add    %eax,%edx
    1478:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    147e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1481:	01 c8                	add    %ecx,%eax
    1483:	0f b6 00             	movzbl (%eax),%eax
    1486:	88 02                	mov    %al,(%edx)
      i++;
    1488:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    148c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    1490:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    1496:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1499:	01 d0                	add    %edx,%eax
    149b:	0f b6 00             	movzbl (%eax),%eax
    149e:	84 c0                	test   %al,%al
    14a0:	75 ce                	jne    1470 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    14a2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    14a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    14a8:	01 d0                	add    %edx,%eax
    14aa:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    14ad:	83 ec 0c             	sub    $0xc,%esp
    14b0:	ff 75 dc             	pushl  -0x24(%ebp)
    14b3:	e8 f2 f0 ff ff       	call   5aa <close>
    14b8:	83 c4 10             	add    $0x10,%esp
    return 1;
    14bb:	b8 01 00 00 00       	mov    $0x1,%eax
    14c0:	eb 13                	jmp    14d5 <findAlias+0x1c8>
  }
  close(fd);
    14c2:	83 ec 0c             	sub    $0xc,%esp
    14c5:	ff 75 dc             	pushl  -0x24(%ebp)
    14c8:	e8 dd f0 ff ff       	call   5aa <close>
    14cd:	83 c4 10             	add    $0x10,%esp
  return 0;
    14d0:	b8 00 00 00 00       	mov    $0x0,%eax
}
    14d5:	c9                   	leave  
    14d6:	c3                   	ret    

000014d7 <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    14d7:	55                   	push   %ebp
    14d8:	89 e5                	mov    %esp,%ebp
    14da:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    14dd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    14e1:	75 05                	jne    14e8 <runcmd+0x11>
    exit();
    14e3:	e8 9a f0 ff ff       	call   582 <exit>
  
  switch(cmd->type){
    14e8:	8b 45 08             	mov    0x8(%ebp),%eax
    14eb:	8b 00                	mov    (%eax),%eax
    14ed:	83 f8 05             	cmp    $0x5,%eax
    14f0:	77 09                	ja     14fb <runcmd+0x24>
    14f2:	8b 04 85 bc 39 00 00 	mov    0x39bc(,%eax,4),%eax
    14f9:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    14fb:	83 ec 0c             	sub    $0xc,%esp
    14fe:	68 90 39 00 00       	push   $0x3990
    1503:	e8 0b f7 ff ff       	call   c13 <panic1>
    1508:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    150b:	8b 45 08             	mov    0x8(%ebp),%eax
    150e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    1511:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1514:	8b 40 04             	mov    0x4(%eax),%eax
    1517:	85 c0                	test   %eax,%eax
    1519:	75 05                	jne    1520 <runcmd+0x49>
      exit();
    151b:	e8 62 f0 ff ff       	call   582 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    1520:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1523:	8b 40 04             	mov    0x4(%eax),%eax
    1526:	83 ec 0c             	sub    $0xc,%esp
    1529:	50                   	push   %eax
    152a:	e8 4d fd ff ff       	call   127c <isCmdName>
    152f:	83 c4 10             	add    $0x10,%esp
    1532:	85 c0                	test   %eax,%eax
    1534:	75 37                	jne    156d <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    1536:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1539:	8b 40 04             	mov    0x4(%eax),%eax
    153c:	83 ec 08             	sub    $0x8,%esp
    153f:	8d 55 ce             	lea    -0x32(%ebp),%edx
    1542:	52                   	push   %edx
    1543:	50                   	push   %eax
    1544:	e8 c4 fd ff ff       	call   130d <findAlias>
    1549:	83 c4 10             	add    $0x10,%esp
    154c:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    154f:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1553:	75 31                	jne    1586 <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    1555:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1558:	83 c0 04             	add    $0x4,%eax
    155b:	83 ec 08             	sub    $0x8,%esp
    155e:	50                   	push   %eax
    155f:	8d 45 ce             	lea    -0x32(%ebp),%eax
    1562:	50                   	push   %eax
    1563:	e8 52 f0 ff ff       	call   5ba <exec>
    1568:	83 c4 10             	add    $0x10,%esp
    156b:	eb 19                	jmp    1586 <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    156d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1570:	8d 50 04             	lea    0x4(%eax),%edx
    1573:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1576:	8b 40 04             	mov    0x4(%eax),%eax
    1579:	83 ec 08             	sub    $0x8,%esp
    157c:	52                   	push   %edx
    157d:	50                   	push   %eax
    157e:	e8 37 f0 ff ff       	call   5ba <exec>
    1583:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    1586:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1589:	8b 40 04             	mov    0x4(%eax),%eax
    158c:	83 ec 04             	sub    $0x4,%esp
    158f:	50                   	push   %eax
    1590:	68 97 39 00 00       	push   $0x3997
    1595:	6a 02                	push   $0x2
    1597:	e8 92 f2 ff ff       	call   82e <printf>
    159c:	83 c4 10             	add    $0x10,%esp
    break;
    159f:	e9 c6 01 00 00       	jmp    176a <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    15a4:	8b 45 08             	mov    0x8(%ebp),%eax
    15a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    15aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15ad:	8b 40 14             	mov    0x14(%eax),%eax
    15b0:	83 ec 0c             	sub    $0xc,%esp
    15b3:	50                   	push   %eax
    15b4:	e8 f1 ef ff ff       	call   5aa <close>
    15b9:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    15bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15bf:	8b 50 10             	mov    0x10(%eax),%edx
    15c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15c5:	8b 40 08             	mov    0x8(%eax),%eax
    15c8:	83 ec 08             	sub    $0x8,%esp
    15cb:	52                   	push   %edx
    15cc:	50                   	push   %eax
    15cd:	e8 f0 ef ff ff       	call   5c2 <open>
    15d2:	83 c4 10             	add    $0x10,%esp
    15d5:	85 c0                	test   %eax,%eax
    15d7:	79 1e                	jns    15f7 <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    15d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15dc:	8b 40 08             	mov    0x8(%eax),%eax
    15df:	83 ec 04             	sub    $0x4,%esp
    15e2:	50                   	push   %eax
    15e3:	68 a7 39 00 00       	push   $0x39a7
    15e8:	6a 02                	push   $0x2
    15ea:	e8 3f f2 ff ff       	call   82e <printf>
    15ef:	83 c4 10             	add    $0x10,%esp
      exit();
    15f2:	e8 8b ef ff ff       	call   582 <exit>
    }
    runcmd(rcmd->cmd);
    15f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15fa:	8b 40 04             	mov    0x4(%eax),%eax
    15fd:	83 ec 0c             	sub    $0xc,%esp
    1600:	50                   	push   %eax
    1601:	e8 d1 fe ff ff       	call   14d7 <runcmd>
    1606:	83 c4 10             	add    $0x10,%esp
    break;
    1609:	e9 5c 01 00 00       	jmp    176a <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    160e:	8b 45 08             	mov    0x8(%ebp),%eax
    1611:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    1614:	e8 84 f9 ff ff       	call   f9d <fork1>
    1619:	85 c0                	test   %eax,%eax
    161b:	75 12                	jne    162f <runcmd+0x158>
      runcmd(lcmd->left);
    161d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1620:	8b 40 04             	mov    0x4(%eax),%eax
    1623:	83 ec 0c             	sub    $0xc,%esp
    1626:	50                   	push   %eax
    1627:	e8 ab fe ff ff       	call   14d7 <runcmd>
    162c:	83 c4 10             	add    $0x10,%esp
    wait();
    162f:	e8 56 ef ff ff       	call   58a <wait>
    runcmd(lcmd->right);
    1634:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1637:	8b 40 08             	mov    0x8(%eax),%eax
    163a:	83 ec 0c             	sub    $0xc,%esp
    163d:	50                   	push   %eax
    163e:	e8 94 fe ff ff       	call   14d7 <runcmd>
    1643:	83 c4 10             	add    $0x10,%esp
    break;
    1646:	e9 1f 01 00 00       	jmp    176a <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    164b:	8b 45 08             	mov    0x8(%ebp),%eax
    164e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    1651:	83 ec 0c             	sub    $0xc,%esp
    1654:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1657:	50                   	push   %eax
    1658:	e8 35 ef ff ff       	call   592 <pipe>
    165d:	83 c4 10             	add    $0x10,%esp
    1660:	85 c0                	test   %eax,%eax
    1662:	79 10                	jns    1674 <runcmd+0x19d>
      panic1("pipe");
    1664:	83 ec 0c             	sub    $0xc,%esp
    1667:	68 b7 39 00 00       	push   $0x39b7
    166c:	e8 a2 f5 ff ff       	call   c13 <panic1>
    1671:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    1674:	e8 24 f9 ff ff       	call   f9d <fork1>
    1679:	85 c0                	test   %eax,%eax
    167b:	75 4c                	jne    16c9 <runcmd+0x1f2>
      close(1);
    167d:	83 ec 0c             	sub    $0xc,%esp
    1680:	6a 01                	push   $0x1
    1682:	e8 23 ef ff ff       	call   5aa <close>
    1687:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    168a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    168d:	83 ec 0c             	sub    $0xc,%esp
    1690:	50                   	push   %eax
    1691:	e8 64 ef ff ff       	call   5fa <dup>
    1696:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1699:	8b 45 d8             	mov    -0x28(%ebp),%eax
    169c:	83 ec 0c             	sub    $0xc,%esp
    169f:	50                   	push   %eax
    16a0:	e8 05 ef ff ff       	call   5aa <close>
    16a5:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    16a8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    16ab:	83 ec 0c             	sub    $0xc,%esp
    16ae:	50                   	push   %eax
    16af:	e8 f6 ee ff ff       	call   5aa <close>
    16b4:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    16b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16ba:	8b 40 04             	mov    0x4(%eax),%eax
    16bd:	83 ec 0c             	sub    $0xc,%esp
    16c0:	50                   	push   %eax
    16c1:	e8 11 fe ff ff       	call   14d7 <runcmd>
    16c6:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    16c9:	e8 cf f8 ff ff       	call   f9d <fork1>
    16ce:	85 c0                	test   %eax,%eax
    16d0:	75 4c                	jne    171e <runcmd+0x247>
      close(0);
    16d2:	83 ec 0c             	sub    $0xc,%esp
    16d5:	6a 00                	push   $0x0
    16d7:	e8 ce ee ff ff       	call   5aa <close>
    16dc:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    16df:	8b 45 d8             	mov    -0x28(%ebp),%eax
    16e2:	83 ec 0c             	sub    $0xc,%esp
    16e5:	50                   	push   %eax
    16e6:	e8 0f ef ff ff       	call   5fa <dup>
    16eb:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    16ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
    16f1:	83 ec 0c             	sub    $0xc,%esp
    16f4:	50                   	push   %eax
    16f5:	e8 b0 ee ff ff       	call   5aa <close>
    16fa:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    16fd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1700:	83 ec 0c             	sub    $0xc,%esp
    1703:	50                   	push   %eax
    1704:	e8 a1 ee ff ff       	call   5aa <close>
    1709:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    170c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    170f:	8b 40 08             	mov    0x8(%eax),%eax
    1712:	83 ec 0c             	sub    $0xc,%esp
    1715:	50                   	push   %eax
    1716:	e8 bc fd ff ff       	call   14d7 <runcmd>
    171b:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    171e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1721:	83 ec 0c             	sub    $0xc,%esp
    1724:	50                   	push   %eax
    1725:	e8 80 ee ff ff       	call   5aa <close>
    172a:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    172d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1730:	83 ec 0c             	sub    $0xc,%esp
    1733:	50                   	push   %eax
    1734:	e8 71 ee ff ff       	call   5aa <close>
    1739:	83 c4 10             	add    $0x10,%esp
    wait();
    173c:	e8 49 ee ff ff       	call   58a <wait>
    wait();
    1741:	e8 44 ee ff ff       	call   58a <wait>
    break;
    1746:	eb 22                	jmp    176a <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    1748:	8b 45 08             	mov    0x8(%ebp),%eax
    174b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    174e:	e8 4a f8 ff ff       	call   f9d <fork1>
    1753:	85 c0                	test   %eax,%eax
    1755:	75 12                	jne    1769 <runcmd+0x292>
      runcmd(bcmd->cmd);
    1757:	8b 45 e0             	mov    -0x20(%ebp),%eax
    175a:	8b 40 04             	mov    0x4(%eax),%eax
    175d:	83 ec 0c             	sub    $0xc,%esp
    1760:	50                   	push   %eax
    1761:	e8 71 fd ff ff       	call   14d7 <runcmd>
    1766:	83 c4 10             	add    $0x10,%esp
    break;
    1769:	90                   	nop
  }
  exit();
    176a:	e8 13 ee ff ff       	call   582 <exit>

0000176f <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    176f:	55                   	push   %ebp
    1770:	89 e5                	mov    %esp,%ebp
    1772:	83 ec 04             	sub    $0x4,%esp
    1775:	8b 45 08             	mov    0x8(%ebp),%eax
    1778:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    177b:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    177f:	7e 0d                	jle    178e <isNameChar+0x1f>
    1781:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    1785:	7f 07                	jg     178e <isNameChar+0x1f>
    return 1;
    1787:	b8 01 00 00 00       	mov    $0x1,%eax
    178c:	eb 38                	jmp    17c6 <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    178e:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    1792:	7e 0d                	jle    17a1 <isNameChar+0x32>
    1794:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    1798:	7f 07                	jg     17a1 <isNameChar+0x32>
    return 1;
    179a:	b8 01 00 00 00       	mov    $0x1,%eax
    179f:	eb 25                	jmp    17c6 <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    17a1:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    17a5:	7e 0d                	jle    17b4 <isNameChar+0x45>
    17a7:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    17ab:	7f 07                	jg     17b4 <isNameChar+0x45>
    return 1;
    17ad:	b8 01 00 00 00       	mov    $0x1,%eax
    17b2:	eb 12                	jmp    17c6 <isNameChar+0x57>
  if(ch == '_')
    17b4:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    17b8:	75 07                	jne    17c1 <isNameChar+0x52>
    return 1;
    17ba:	b8 01 00 00 00       	mov    $0x1,%eax
    17bf:	eb 05                	jmp    17c6 <isNameChar+0x57>
  return 0;
    17c1:	b8 00 00 00 00       	mov    $0x0,%eax
}
    17c6:	c9                   	leave  
    17c7:	c3                   	ret    

000017c8 <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    17c8:	55                   	push   %ebp
    17c9:	89 e5                	mov    %esp,%ebp
    17cb:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    17ce:	8b 45 08             	mov    0x8(%ebp),%eax
    17d1:	8b 40 04             	mov    0x4(%eax),%eax
    17d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    17d7:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    17de:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    17e5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    17ec:	eb 1d                	jmp    180b <runCalcmd+0x43>
  {
    if(line[i] == '=')
    17ee:	8b 55 ec             	mov    -0x14(%ebp),%edx
    17f1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17f4:	01 d0                	add    %edx,%eax
    17f6:	0f b6 00             	movzbl (%eax),%eax
    17f9:	3c 3d                	cmp    $0x3d,%al
    17fb:	75 0a                	jne    1807 <runCalcmd+0x3f>
    {
      hasEqu++;
    17fd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    1801:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1804:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    1807:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    180b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    180e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1811:	01 d0                	add    %edx,%eax
    1813:	0f b6 00             	movzbl (%eax),%eax
    1816:	84 c0                	test   %al,%al
    1818:	75 d4                	jne    17ee <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    181a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    181e:	7e 1d                	jle    183d <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    1820:	83 ec 0c             	sub    $0xc,%esp
    1823:	68 d4 39 00 00       	push   $0x39d4
    1828:	6a 00                	push   $0x0
    182a:	6a 00                	push   $0x0
    182c:	6a 01                	push   $0x1
    182e:	6a 04                	push   $0x4
    1830:	e8 21 17 00 00       	call   2f56 <color_printf>
    1835:	83 c4 20             	add    $0x20,%esp
    1838:	e9 78 05 00 00       	jmp    1db5 <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    183d:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1841:	0f 85 26 05 00 00    	jne    1d6d <runCalcmd+0x5a5>
  {
    int i=0;
    1847:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    184e:	eb 04                	jmp    1854 <runCalcmd+0x8c>
    {
      i++;
    1850:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    1854:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1857:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    185a:	01 d0                	add    %edx,%eax
    185c:	0f b6 00             	movzbl (%eax),%eax
    185f:	3c 20                	cmp    $0x20,%al
    1861:	74 ed                	je     1850 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    1863:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1866:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    1869:	eb 23                	jmp    188e <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    186b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    186e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1871:	01 d0                	add    %edx,%eax
    1873:	0f b6 00             	movzbl (%eax),%eax
    1876:	0f be c0             	movsbl %al,%eax
    1879:	83 ec 0c             	sub    $0xc,%esp
    187c:	50                   	push   %eax
    187d:	e8 ed fe ff ff       	call   176f <isNameChar>
    1882:	83 c4 10             	add    $0x10,%esp
    1885:	83 f8 01             	cmp    $0x1,%eax
    1888:	75 0e                	jne    1898 <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    188a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    188e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1891:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1894:	7c d5                	jl     186b <runCalcmd+0xa3>
    1896:	eb 01                	jmp    1899 <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    1898:	90                   	nop
    }
    int len = i-startIndex;
    1899:	8b 45 e8             	mov    -0x18(%ebp),%eax
    189c:	2b 45 d0             	sub    -0x30(%ebp),%eax
    189f:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    18a2:	eb 04                	jmp    18a8 <runCalcmd+0xe0>
    {
      i++;
    18a4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    18a8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    18ab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18ae:	01 d0                	add    %edx,%eax
    18b0:	0f b6 00             	movzbl (%eax),%eax
    18b3:	3c 20                	cmp    $0x20,%al
    18b5:	74 ed                	je     18a4 <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    18b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18ba:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    18bd:	0f 85 90 04 00 00    	jne    1d53 <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    18c3:	8b 55 d0             	mov    -0x30(%ebp),%edx
    18c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18c9:	01 d0                	add    %edx,%eax
    18cb:	0f b6 00             	movzbl (%eax),%eax
    18ce:	3c 2f                	cmp    $0x2f,%al
    18d0:	7e 2c                	jle    18fe <runCalcmd+0x136>
    18d2:	8b 55 d0             	mov    -0x30(%ebp),%edx
    18d5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18d8:	01 d0                	add    %edx,%eax
    18da:	0f b6 00             	movzbl (%eax),%eax
    18dd:	3c 39                	cmp    $0x39,%al
    18df:	7f 1d                	jg     18fe <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    18e1:	83 ec 0c             	sub    $0xc,%esp
    18e4:	68 f0 39 00 00       	push   $0x39f0
    18e9:	6a 00                	push   $0x0
    18eb:	6a 00                	push   $0x0
    18ed:	6a 01                	push   $0x1
    18ef:	6a 04                	push   $0x4
    18f1:	e8 60 16 00 00       	call   2f56 <color_printf>
    18f6:	83 c4 20             	add    $0x20,%esp
    18f9:	e9 b7 04 00 00       	jmp    1db5 <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    18fe:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1905:	eb 20                	jmp    1927 <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    1907:	8b 55 d0             	mov    -0x30(%ebp),%edx
    190a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    190d:	01 d0                	add    %edx,%eax
    190f:	89 c2                	mov    %eax,%edx
    1911:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1914:	01 d0                	add    %edx,%eax
    1916:	0f b6 00             	movzbl (%eax),%eax
    1919:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    191c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    191f:	01 ca                	add    %ecx,%edx
    1921:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1923:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1927:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    192a:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    192d:	7c d8                	jl     1907 <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    192f:	8d 55 94             	lea    -0x6c(%ebp),%edx
    1932:	8b 45 cc             	mov    -0x34(%ebp),%eax
    1935:	01 d0                	add    %edx,%eax
    1937:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    193a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    193d:	83 c0 01             	add    $0x1,%eax
    1940:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    1943:	eb 04                	jmp    1949 <runCalcmd+0x181>
        {
          i++;
    1945:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    1949:	8b 55 e0             	mov    -0x20(%ebp),%edx
    194c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    194f:	01 d0                	add    %edx,%eax
    1951:	0f b6 00             	movzbl (%eax),%eax
    1954:	3c 20                	cmp    $0x20,%al
    1956:	74 ed                	je     1945 <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    1958:	8b 55 e0             	mov    -0x20(%ebp),%edx
    195b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    195e:	01 d0                	add    %edx,%eax
    1960:	0f b6 00             	movzbl (%eax),%eax
    1963:	3c 60                	cmp    $0x60,%al
    1965:	0f 85 e6 01 00 00    	jne    1b51 <runCalcmd+0x389>
        {
          i++;
    196b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    196f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1972:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    1975:	eb 04                	jmp    197b <runCalcmd+0x1b3>
          {
            i++;
    1977:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    197b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    197e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1981:	01 d0                	add    %edx,%eax
    1983:	0f b6 00             	movzbl (%eax),%eax
    1986:	3c 60                	cmp    $0x60,%al
    1988:	74 0f                	je     1999 <runCalcmd+0x1d1>
    198a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    198d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1990:	01 d0                	add    %edx,%eax
    1992:	0f b6 00             	movzbl (%eax),%eax
    1995:	84 c0                	test   %al,%al
    1997:	75 de                	jne    1977 <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    1999:	8b 55 e0             	mov    -0x20(%ebp),%edx
    199c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    199f:	01 d0                	add    %edx,%eax
    19a1:	0f b6 00             	movzbl (%eax),%eax
    19a4:	3c 60                	cmp    $0x60,%al
    19a6:	0f 85 5c 01 00 00    	jne    1b08 <runCalcmd+0x340>
    19ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
    19af:	8d 50 01             	lea    0x1(%eax),%edx
    19b2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19b5:	01 d0                	add    %edx,%eax
    19b7:	0f b6 00             	movzbl (%eax),%eax
    19ba:	84 c0                	test   %al,%al
    19bc:	0f 85 46 01 00 00    	jne    1b08 <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    19c2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19c5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19c8:	01 d0                	add    %edx,%eax
    19ca:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    19cd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    19d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19d3:	01 d0                	add    %edx,%eax
    19d5:	83 ec 0c             	sub    $0xc,%esp
    19d8:	50                   	push   %eax
    19d9:	e8 c5 04 00 00       	call   1ea3 <Compute>
    19de:	83 c4 10             	add    $0x10,%esp
    19e1:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    19e4:	dd 05 60 3b 00 00    	fldl   0x3b60
    19ea:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    19ee:	dd 1c 24             	fstpl  (%esp)
    19f1:	ff 75 c4             	pushl  -0x3c(%ebp)
    19f4:	ff 75 c0             	pushl  -0x40(%ebp)
    19f7:	e8 30 f8 ff ff       	call   122c <isEqual>
    19fc:	83 c4 10             	add    $0x10,%esp
    19ff:	85 c0                	test   %eax,%eax
    1a01:	0f 85 ad 03 00 00    	jne    1db4 <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    1a07:	a1 4c 47 00 00       	mov    0x474c,%eax
    1a0c:	85 c0                	test   %eax,%eax
    1a0e:	75 15                	jne    1a25 <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1a10:	83 ec 08             	sub    $0x8,%esp
    1a13:	68 4c 47 00 00       	push   $0x474c
    1a18:	68 80 4b 00 00       	push   $0x4b80
    1a1d:	e8 ba 19 00 00       	call   33dc <readVariables>
    1a22:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    1a25:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1a2c:	eb 26                	jmp    1a54 <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1a2e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1a31:	c1 e0 05             	shl    $0x5,%eax
    1a34:	05 80 4b 00 00       	add    $0x4b80,%eax
    1a39:	8d 50 04             	lea    0x4(%eax),%edx
    1a3c:	83 ec 08             	sub    $0x8,%esp
    1a3f:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1a42:	50                   	push   %eax
    1a43:	52                   	push   %edx
    1a44:	e8 38 e9 ff ff       	call   381 <strcmp>
    1a49:	83 c4 10             	add    $0x10,%esp
    1a4c:	85 c0                	test   %eax,%eax
    1a4e:	74 10                	je     1a60 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1a50:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    1a54:	a1 4c 47 00 00       	mov    0x474c,%eax
    1a59:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1a5c:	7c d0                	jl     1a2e <runCalcmd+0x266>
    1a5e:	eb 01                	jmp    1a61 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1a60:	90                   	nop
              }
              if(index == v_num) //new variable
    1a61:	a1 4c 47 00 00       	mov    0x474c,%eax
    1a66:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1a69:	75 3c                	jne    1aa7 <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    1a6b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1a6e:	c1 e0 05             	shl    $0x5,%eax
    1a71:	05 80 4b 00 00       	add    $0x4b80,%eax
    1a76:	8d 50 04             	lea    0x4(%eax),%edx
    1a79:	83 ec 08             	sub    $0x8,%esp
    1a7c:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1a7f:	50                   	push   %eax
    1a80:	52                   	push   %edx
    1a81:	e8 cb e8 ff ff       	call   351 <strcpy>
    1a86:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    1a89:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1a8c:	c1 e0 05             	shl    $0x5,%eax
    1a8f:	05 80 4b 00 00       	add    $0x4b80,%eax
    1a94:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    1a9a:	a1 4c 47 00 00       	mov    0x474c,%eax
    1a9f:	83 c0 01             	add    $0x1,%eax
    1aa2:	a3 4c 47 00 00       	mov    %eax,0x474c
              }
              variables[index].value.dvalue = result;
    1aa7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1aaa:	c1 e0 05             	shl    $0x5,%eax
    1aad:	05 90 4b 00 00       	add    $0x4b90,%eax
    1ab2:	dd 45 c0             	fldl   -0x40(%ebp)
    1ab5:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    1ab8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1abb:	c1 e0 05             	shl    $0x5,%eax
    1abe:	05 90 4b 00 00       	add    $0x4b90,%eax
    1ac3:	dd 40 08             	fldl   0x8(%eax)
    1ac6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ac9:	c1 e0 05             	shl    $0x5,%eax
    1acc:	05 80 4b 00 00       	add    $0x4b80,%eax
    1ad1:	83 c0 04             	add    $0x4,%eax
    1ad4:	83 ec 0c             	sub    $0xc,%esp
    1ad7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1adb:	dd 1c 24             	fstpl  (%esp)
    1ade:	50                   	push   %eax
    1adf:	68 1a 3a 00 00       	push   $0x3a1a
    1ae4:	6a 01                	push   $0x1
    1ae6:	e8 43 ed ff ff       	call   82e <printf>
    1aeb:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1aee:	83 ec 08             	sub    $0x8,%esp
    1af1:	68 4c 47 00 00       	push   $0x474c
    1af6:	68 80 4b 00 00       	push   $0x4b80
    1afb:	e8 90 1b 00 00       	call   3690 <writeVariables>
    1b00:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1b03:	e9 ac 02 00 00       	jmp    1db4 <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    1b08:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b0b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b0e:	01 d0                	add    %edx,%eax
    1b10:	0f b6 00             	movzbl (%eax),%eax
    1b13:	84 c0                	test   %al,%al
    1b15:	75 1d                	jne    1b34 <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    1b17:	83 ec 0c             	sub    $0xc,%esp
    1b1a:	68 21 3a 00 00       	push   $0x3a21
    1b1f:	6a 00                	push   $0x0
    1b21:	6a 00                	push   $0x0
    1b23:	6a 01                	push   $0x1
    1b25:	6a 04                	push   $0x4
    1b27:	e8 2a 14 00 00       	call   2f56 <color_printf>
    1b2c:	83 c4 20             	add    $0x20,%esp
    1b2f:	e9 81 02 00 00       	jmp    1db5 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    1b34:	83 ec 0c             	sub    $0xc,%esp
    1b37:	68 38 3a 00 00       	push   $0x3a38
    1b3c:	6a 00                	push   $0x0
    1b3e:	6a 00                	push   $0x0
    1b40:	6a 01                	push   $0x1
    1b42:	6a 04                	push   $0x4
    1b44:	e8 0d 14 00 00       	call   2f56 <color_printf>
    1b49:	83 c4 20             	add    $0x20,%esp
    1b4c:	e9 64 02 00 00       	jmp    1db5 <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1b51:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b54:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b57:	01 d0                	add    %edx,%eax
    1b59:	0f b6 00             	movzbl (%eax),%eax
    1b5c:	3c 22                	cmp    $0x22,%al
    1b5e:	0f 85 d5 01 00 00    	jne    1d39 <runCalcmd+0x571>
        {
          i++;
    1b64:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    1b68:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1b6b:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1b6e:	eb 04                	jmp    1b74 <runCalcmd+0x3ac>
          {
            i++;
    1b70:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1b74:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b77:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b7a:	01 d0                	add    %edx,%eax
    1b7c:	0f b6 00             	movzbl (%eax),%eax
    1b7f:	3c 22                	cmp    $0x22,%al
    1b81:	74 0f                	je     1b92 <runCalcmd+0x3ca>
    1b83:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b86:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b89:	01 d0                	add    %edx,%eax
    1b8b:	0f b6 00             	movzbl (%eax),%eax
    1b8e:	84 c0                	test   %al,%al
    1b90:	75 de                	jne    1b70 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1b92:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b95:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b98:	01 d0                	add    %edx,%eax
    1b9a:	0f b6 00             	movzbl (%eax),%eax
    1b9d:	3c 22                	cmp    $0x22,%al
    1b9f:	0f 85 4e 01 00 00    	jne    1cf3 <runCalcmd+0x52b>
    1ba5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1ba8:	8d 50 01             	lea    0x1(%eax),%edx
    1bab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1bae:	01 d0                	add    %edx,%eax
    1bb0:	0f b6 00             	movzbl (%eax),%eax
    1bb3:	84 c0                	test   %al,%al
    1bb5:	0f 85 38 01 00 00    	jne    1cf3 <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1bbb:	a1 4c 47 00 00       	mov    0x474c,%eax
    1bc0:	85 c0                	test   %eax,%eax
    1bc2:	75 15                	jne    1bd9 <runCalcmd+0x411>
              readVariables(variables,&v_num);
    1bc4:	83 ec 08             	sub    $0x8,%esp
    1bc7:	68 4c 47 00 00       	push   $0x474c
    1bcc:	68 80 4b 00 00       	push   $0x4b80
    1bd1:	e8 06 18 00 00       	call   33dc <readVariables>
    1bd6:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1bd9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1be0:	eb 26                	jmp    1c08 <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    1be2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1be5:	c1 e0 05             	shl    $0x5,%eax
    1be8:	05 80 4b 00 00       	add    $0x4b80,%eax
    1bed:	8d 50 04             	lea    0x4(%eax),%edx
    1bf0:	83 ec 08             	sub    $0x8,%esp
    1bf3:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1bf6:	50                   	push   %eax
    1bf7:	52                   	push   %edx
    1bf8:	e8 84 e7 ff ff       	call   381 <strcmp>
    1bfd:	83 c4 10             	add    $0x10,%esp
    1c00:	85 c0                	test   %eax,%eax
    1c02:	74 10                	je     1c14 <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    1c04:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1c08:	a1 4c 47 00 00       	mov    0x474c,%eax
    1c0d:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1c10:	7c d0                	jl     1be2 <runCalcmd+0x41a>
    1c12:	eb 01                	jmp    1c15 <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    1c14:	90                   	nop
            }
            if(index == v_num) //new variable
    1c15:	a1 4c 47 00 00       	mov    0x474c,%eax
    1c1a:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1c1d:	75 2b                	jne    1c4a <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1c1f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1c22:	c1 e0 05             	shl    $0x5,%eax
    1c25:	05 80 4b 00 00       	add    $0x4b80,%eax
    1c2a:	8d 50 04             	lea    0x4(%eax),%edx
    1c2d:	83 ec 08             	sub    $0x8,%esp
    1c30:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1c33:	50                   	push   %eax
    1c34:	52                   	push   %edx
    1c35:	e8 17 e7 ff ff       	call   351 <strcpy>
    1c3a:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1c3d:	a1 4c 47 00 00       	mov    0x474c,%eax
    1c42:	83 c0 01             	add    $0x1,%eax
    1c45:	a3 4c 47 00 00       	mov    %eax,0x474c
            }
            variables[index].type = V_STRING;
    1c4a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1c4d:	c1 e0 05             	shl    $0x5,%eax
    1c50:	05 80 4b 00 00       	add    $0x4b80,%eax
    1c55:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1c5b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1c5e:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1c61:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1c64:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1c67:	83 c0 01             	add    $0x1,%eax
    1c6a:	83 ec 0c             	sub    $0xc,%esp
    1c6d:	50                   	push   %eax
    1c6e:	e8 bd ee ff ff       	call   b30 <malloc>
    1c73:	83 c4 10             	add    $0x10,%esp
    1c76:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1c79:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1c7c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1c7f:	01 d0                	add    %edx,%eax
    1c81:	83 ec 08             	sub    $0x8,%esp
    1c84:	50                   	push   %eax
    1c85:	ff 75 b4             	pushl  -0x4c(%ebp)
    1c88:	e8 c4 e6 ff ff       	call   351 <strcpy>
    1c8d:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1c90:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1c93:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1c96:	01 d0                	add    %edx,%eax
    1c98:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1c9b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1c9e:	c1 e0 05             	shl    $0x5,%eax
    1ca1:	8d 90 98 4b 00 00    	lea    0x4b98(%eax),%edx
    1ca7:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1caa:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1cac:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1caf:	c1 e0 05             	shl    $0x5,%eax
    1cb2:	05 98 4b 00 00       	add    $0x4b98,%eax
    1cb7:	8b 00                	mov    (%eax),%eax
    1cb9:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1cbc:	c1 e2 05             	shl    $0x5,%edx
    1cbf:	81 c2 80 4b 00 00    	add    $0x4b80,%edx
    1cc5:	83 c2 04             	add    $0x4,%edx
    1cc8:	50                   	push   %eax
    1cc9:	52                   	push   %edx
    1cca:	68 59 3a 00 00       	push   $0x3a59
    1ccf:	6a 01                	push   $0x1
    1cd1:	e8 58 eb ff ff       	call   82e <printf>
    1cd6:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1cd9:	83 ec 08             	sub    $0x8,%esp
    1cdc:	68 4c 47 00 00       	push   $0x474c
    1ce1:	68 80 4b 00 00       	push   $0x4b80
    1ce6:	e8 a5 19 00 00       	call   3690 <writeVariables>
    1ceb:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1cee:	e9 c2 00 00 00       	jmp    1db5 <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1cf3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1cf6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1cf9:	01 d0                	add    %edx,%eax
    1cfb:	0f b6 00             	movzbl (%eax),%eax
    1cfe:	84 c0                	test   %al,%al
    1d00:	75 1d                	jne    1d1f <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1d02:	83 ec 0c             	sub    $0xc,%esp
    1d05:	68 62 3a 00 00       	push   $0x3a62
    1d0a:	6a 00                	push   $0x0
    1d0c:	6a 00                	push   $0x0
    1d0e:	6a 01                	push   $0x1
    1d10:	6a 04                	push   $0x4
    1d12:	e8 3f 12 00 00       	call   2f56 <color_printf>
    1d17:	83 c4 20             	add    $0x20,%esp
    1d1a:	e9 96 00 00 00       	jmp    1db5 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1d1f:	83 ec 0c             	sub    $0xc,%esp
    1d22:	68 78 3a 00 00       	push   $0x3a78
    1d27:	6a 00                	push   $0x0
    1d29:	6a 00                	push   $0x0
    1d2b:	6a 01                	push   $0x1
    1d2d:	6a 04                	push   $0x4
    1d2f:	e8 22 12 00 00       	call   2f56 <color_printf>
    1d34:	83 c4 20             	add    $0x20,%esp
    1d37:	eb 7c                	jmp    1db5 <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1d39:	83 ec 0c             	sub    $0xc,%esp
    1d3c:	68 99 3a 00 00       	push   $0x3a99
    1d41:	6a 00                	push   $0x0
    1d43:	6a 00                	push   $0x0
    1d45:	6a 01                	push   $0x1
    1d47:	6a 04                	push   $0x4
    1d49:	e8 08 12 00 00       	call   2f56 <color_printf>
    1d4e:	83 c4 20             	add    $0x20,%esp
    1d51:	eb 62                	jmp    1db5 <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1d53:	83 ec 0c             	sub    $0xc,%esp
    1d56:	68 99 3a 00 00       	push   $0x3a99
    1d5b:	6a 00                	push   $0x0
    1d5d:	6a 00                	push   $0x0
    1d5f:	6a 01                	push   $0x1
    1d61:	6a 04                	push   $0x4
    1d63:	e8 ee 11 00 00       	call   2f56 <color_printf>
    1d68:	83 c4 20             	add    $0x20,%esp
    1d6b:	eb 48                	jmp    1db5 <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1d6d:	83 ec 0c             	sub    $0xc,%esp
    1d70:	ff 75 d4             	pushl  -0x2c(%ebp)
    1d73:	e8 2b 01 00 00       	call   1ea3 <Compute>
    1d78:	83 c4 10             	add    $0x10,%esp
    1d7b:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1d7e:	dd 05 60 3b 00 00    	fldl   0x3b60
    1d84:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1d88:	dd 1c 24             	fstpl  (%esp)
    1d8b:	ff 75 ac             	pushl  -0x54(%ebp)
    1d8e:	ff 75 a8             	pushl  -0x58(%ebp)
    1d91:	e8 96 f4 ff ff       	call   122c <isEqual>
    1d96:	83 c4 10             	add    $0x10,%esp
    1d99:	85 c0                	test   %eax,%eax
    1d9b:	75 18                	jne    1db5 <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1d9d:	ff 75 ac             	pushl  -0x54(%ebp)
    1da0:	ff 75 a8             	pushl  -0x58(%ebp)
    1da3:	68 b1 3a 00 00       	push   $0x3ab1
    1da8:	6a 01                	push   $0x1
    1daa:	e8 7f ea ff ff       	call   82e <printf>
    1daf:	83 c4 10             	add    $0x10,%esp
    1db2:	eb 01                	jmp    1db5 <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1db4:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1db5:	e8 c8 e7 ff ff       	call   582 <exit>

00001dba <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1dba:	55                   	push   %ebp
    1dbb:	89 e5                	mov    %esp,%ebp
    1dbd:	83 ec 04             	sub    $0x4,%esp
    1dc0:	8b 45 08             	mov    0x8(%ebp),%eax
    1dc3:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1dc6:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1dca:	83 e8 23             	sub    $0x23,%eax
    1dcd:	83 f8 0c             	cmp    $0xc,%eax
    1dd0:	77 25                	ja     1df7 <GetLevel+0x3d>
    1dd2:	8b 04 85 b8 3a 00 00 	mov    0x3ab8(,%eax,4),%eax
    1dd9:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1ddb:	b8 01 00 00 00       	mov    $0x1,%eax
    1de0:	eb 1a                	jmp    1dfc <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1de2:	b8 02 00 00 00       	mov    $0x2,%eax
    1de7:	eb 13                	jmp    1dfc <GetLevel+0x42>
    case '(':
        return 0;
    1de9:	b8 00 00 00 00       	mov    $0x0,%eax
    1dee:	eb 0c                	jmp    1dfc <GetLevel+0x42>
    case '#':
        return -2;
    1df0:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1df5:	eb 05                	jmp    1dfc <GetLevel+0x42>
    };
    return -1;
    1df7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1dfc:	c9                   	leave  
    1dfd:	c3                   	ret    

00001dfe <Operate>:

double Operate(double a1, char op, double a2)
{
    1dfe:	55                   	push   %ebp
    1dff:	89 e5                	mov    %esp,%ebp
    1e01:	83 ec 28             	sub    $0x28,%esp
    1e04:	8b 45 10             	mov    0x10(%ebp),%eax
    1e07:	8b 55 08             	mov    0x8(%ebp),%edx
    1e0a:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1e0d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e10:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1e13:	88 45 ec             	mov    %al,-0x14(%ebp)
    1e16:	8b 45 14             	mov    0x14(%ebp),%eax
    1e19:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1e1c:	8b 45 18             	mov    0x18(%ebp),%eax
    1e1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1e22:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1e26:	83 f8 2b             	cmp    $0x2b,%eax
    1e29:	74 18                	je     1e43 <Operate+0x45>
    1e2b:	83 f8 2b             	cmp    $0x2b,%eax
    1e2e:	7f 07                	jg     1e37 <Operate+0x39>
    1e30:	83 f8 2a             	cmp    $0x2a,%eax
    1e33:	74 1e                	je     1e53 <Operate+0x55>
    1e35:	eb 68                	jmp    1e9f <Operate+0xa1>
    1e37:	83 f8 2d             	cmp    $0x2d,%eax
    1e3a:	74 0f                	je     1e4b <Operate+0x4d>
    1e3c:	83 f8 2f             	cmp    $0x2f,%eax
    1e3f:	74 1a                	je     1e5b <Operate+0x5d>
    1e41:	eb 5c                	jmp    1e9f <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1e43:	dd 45 f0             	fldl   -0x10(%ebp)
    1e46:	dc 45 e0             	faddl  -0x20(%ebp)
    1e49:	eb 56                	jmp    1ea1 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1e4b:	dd 45 f0             	fldl   -0x10(%ebp)
    1e4e:	dc 65 e0             	fsubl  -0x20(%ebp)
    1e51:	eb 4e                	jmp    1ea1 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1e53:	dd 45 f0             	fldl   -0x10(%ebp)
    1e56:	dc 4d e0             	fmull  -0x20(%ebp)
    1e59:	eb 46                	jmp    1ea1 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1e5b:	d9 ee                	fldz   
    1e5d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e61:	dd 1c 24             	fstpl  (%esp)
    1e64:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e67:	ff 75 e0             	pushl  -0x20(%ebp)
    1e6a:	e8 bd f3 ff ff       	call   122c <isEqual>
    1e6f:	83 c4 10             	add    $0x10,%esp
    1e72:	83 f8 01             	cmp    $0x1,%eax
    1e75:	75 20                	jne    1e97 <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1e77:	83 ec 0c             	sub    $0xc,%esp
    1e7a:	68 ec 3a 00 00       	push   $0x3aec
    1e7f:	6a 00                	push   $0x0
    1e81:	6a 00                	push   $0x0
    1e83:	6a 01                	push   $0x1
    1e85:	6a 04                	push   $0x4
    1e87:	e8 ca 10 00 00       	call   2f56 <color_printf>
    1e8c:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1e8f:	dd 05 60 3b 00 00    	fldl   0x3b60
    1e95:	eb 0a                	jmp    1ea1 <Operate+0xa3>
        }
        else
          return a1 / a2;
    1e97:	dd 45 f0             	fldl   -0x10(%ebp)
    1e9a:	dc 75 e0             	fdivl  -0x20(%ebp)
    1e9d:	eb 02                	jmp    1ea1 <Operate+0xa3>
    };
    return 1;
    1e9f:	d9 e8                	fld1   
}
    1ea1:	c9                   	leave  
    1ea2:	c3                   	ret    

00001ea3 <Compute>:

double Compute(char *s)
{
    1ea3:	55                   	push   %ebp
    1ea4:	89 e5                	mov    %esp,%ebp
    1ea6:	53                   	push   %ebx
    1ea7:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1ead:	e8 44 14 00 00       	call   32f6 <dstack>
    1eb2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1eb5:	e8 73 13 00 00       	call   322d <cstack>
    1eba:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1ebd:	83 ec 08             	sub    $0x8,%esp
    1ec0:	6a 23                	push   $0x23
    1ec2:	ff 75 e0             	pushl  -0x20(%ebp)
    1ec5:	e8 91 13 00 00       	call   325b <pushc>
    1eca:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1ecd:	83 ec 0c             	sub    $0xc,%esp
    1ed0:	ff 75 08             	pushl  0x8(%ebp)
    1ed3:	e8 e8 e4 ff ff       	call   3c0 <strlen>
    1ed8:	83 c4 10             	add    $0x10,%esp
    1edb:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1ede:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1ee5:	c7 05 60 4b 00 00 00 	movl   $0x0,0x4b60
    1eec:	00 00 00 
    1eef:	e9 58 05 00 00       	jmp    244c <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1ef4:	a1 60 4b 00 00       	mov    0x4b60,%eax
    1ef9:	89 c2                	mov    %eax,%edx
    1efb:	8b 45 08             	mov    0x8(%ebp),%eax
    1efe:	01 d0                	add    %edx,%eax
    1f00:	0f b6 00             	movzbl (%eax),%eax
    1f03:	3c 24                	cmp    $0x24,%al
    1f05:	0f 85 f8 01 00 00    	jne    2103 <Compute+0x260>
        {
          is_minus = 0;
    1f0b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1f12:	a1 60 4b 00 00       	mov    0x4b60,%eax
    1f17:	83 c0 01             	add    $0x1,%eax
    1f1a:	a3 60 4b 00 00       	mov    %eax,0x4b60
          if(s[g_pos] != '{')
    1f1f:	a1 60 4b 00 00       	mov    0x4b60,%eax
    1f24:	89 c2                	mov    %eax,%edx
    1f26:	8b 45 08             	mov    0x8(%ebp),%eax
    1f29:	01 d0                	add    %edx,%eax
    1f2b:	0f b6 00             	movzbl (%eax),%eax
    1f2e:	3c 7b                	cmp    $0x7b,%al
    1f30:	74 23                	je     1f55 <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1f32:	83 ec 0c             	sub    $0xc,%esp
    1f35:	68 04 3b 00 00       	push   $0x3b04
    1f3a:	6a 00                	push   $0x0
    1f3c:	6a 00                	push   $0x0
    1f3e:	6a 01                	push   $0x1
    1f40:	6a 04                	push   $0x4
    1f42:	e8 0f 10 00 00       	call   2f56 <color_printf>
    1f47:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1f4a:	dd 05 60 3b 00 00    	fldl   0x3b60
    1f50:	e9 24 06 00 00       	jmp    2579 <Compute+0x6d6>
          }
          int i=g_pos+1;
    1f55:	a1 60 4b 00 00       	mov    0x4b60,%eax
    1f5a:	83 c0 01             	add    $0x1,%eax
    1f5d:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1f60:	eb 13                	jmp    1f75 <Compute+0xd2>
          {
            if(s[i] == '}')
    1f62:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1f65:	8b 45 08             	mov    0x8(%ebp),%eax
    1f68:	01 d0                	add    %edx,%eax
    1f6a:	0f b6 00             	movzbl (%eax),%eax
    1f6d:	3c 7d                	cmp    $0x7d,%al
    1f6f:	74 0e                	je     1f7f <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1f71:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1f75:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f78:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1f7b:	7c e5                	jl     1f62 <Compute+0xbf>
    1f7d:	eb 01                	jmp    1f80 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1f7f:	90                   	nop
          }
          if(s[i] != '}')
    1f80:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1f83:	8b 45 08             	mov    0x8(%ebp),%eax
    1f86:	01 d0                	add    %edx,%eax
    1f88:	0f b6 00             	movzbl (%eax),%eax
    1f8b:	3c 7d                	cmp    $0x7d,%al
    1f8d:	74 23                	je     1fb2 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1f8f:	83 ec 0c             	sub    $0xc,%esp
    1f92:	68 12 3b 00 00       	push   $0x3b12
    1f97:	6a 00                	push   $0x0
    1f99:	6a 00                	push   $0x0
    1f9b:	6a 01                	push   $0x1
    1f9d:	6a 04                	push   $0x4
    1f9f:	e8 b2 0f 00 00       	call   2f56 <color_printf>
    1fa4:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1fa7:	dd 05 60 3b 00 00    	fldl   0x3b60
    1fad:	e9 c7 05 00 00       	jmp    2579 <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1fb2:	a1 60 4b 00 00       	mov    0x4b60,%eax
    1fb7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1fba:	29 c2                	sub    %eax,%edx
    1fbc:	89 d0                	mov    %edx,%eax
    1fbe:	83 e8 01             	sub    $0x1,%eax
    1fc1:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1fc4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1fcb:	eb 27                	jmp    1ff4 <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1fcd:	8b 15 60 4b 00 00    	mov    0x4b60,%edx
    1fd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1fd6:	01 d0                	add    %edx,%eax
    1fd8:	8d 50 01             	lea    0x1(%eax),%edx
    1fdb:	8b 45 08             	mov    0x8(%ebp),%eax
    1fde:	01 d0                	add    %edx,%eax
    1fe0:	0f b6 00             	movzbl (%eax),%eax
    1fe3:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1fe9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1fec:	01 ca                	add    %ecx,%edx
    1fee:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1ff0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1ff4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ff7:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1ffa:	7c d1                	jl     1fcd <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1ffc:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    2002:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2005:	01 d0                	add    %edx,%eax
    2007:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    200a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    2011:	a1 4c 47 00 00       	mov    0x474c,%eax
    2016:	85 c0                	test   %eax,%eax
    2018:	75 40                	jne    205a <Compute+0x1b7>
            readVariables(variables,&v_num);
    201a:	83 ec 08             	sub    $0x8,%esp
    201d:	68 4c 47 00 00       	push   $0x474c
    2022:	68 80 4b 00 00       	push   $0x4b80
    2027:	e8 b0 13 00 00       	call   33dc <readVariables>
    202c:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    202f:	eb 29                	jmp    205a <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    2031:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2034:	c1 e0 05             	shl    $0x5,%eax
    2037:	05 80 4b 00 00       	add    $0x4b80,%eax
    203c:	8d 50 04             	lea    0x4(%eax),%edx
    203f:	83 ec 08             	sub    $0x8,%esp
    2042:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    2048:	50                   	push   %eax
    2049:	52                   	push   %edx
    204a:	e8 32 e3 ff ff       	call   381 <strcmp>
    204f:	83 c4 10             	add    $0x10,%esp
    2052:	85 c0                	test   %eax,%eax
    2054:	74 10                	je     2066 <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    2056:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    205a:	a1 4c 47 00 00       	mov    0x474c,%eax
    205f:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    2062:	7c cd                	jl     2031 <Compute+0x18e>
    2064:	eb 01                	jmp    2067 <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    2066:	90                   	nop
          }
          if(index == v_num) //no such variable
    2067:	a1 4c 47 00 00       	mov    0x474c,%eax
    206c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    206f:	75 2a                	jne    209b <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    2071:	83 ec 08             	sub    $0x8,%esp
    2074:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    207a:	50                   	push   %eax
    207b:	68 20 3b 00 00       	push   $0x3b20
    2080:	6a 00                	push   $0x0
    2082:	6a 00                	push   $0x0
    2084:	6a 01                	push   $0x1
    2086:	6a 04                	push   $0x4
    2088:	e8 c9 0e 00 00       	call   2f56 <color_printf>
    208d:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    2090:	dd 05 60 3b 00 00    	fldl   0x3b60
    2096:	e9 de 04 00 00       	jmp    2579 <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    209b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    209e:	c1 e0 05             	shl    $0x5,%eax
    20a1:	05 80 4b 00 00       	add    $0x4b80,%eax
    20a6:	8b 00                	mov    (%eax),%eax
    20a8:	83 f8 02             	cmp    $0x2,%eax
    20ab:	75 23                	jne    20d0 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    20ad:	83 ec 0c             	sub    $0xc,%esp
    20b0:	68 3a 3b 00 00       	push   $0x3b3a
    20b5:	6a 00                	push   $0x0
    20b7:	6a 00                	push   $0x0
    20b9:	6a 01                	push   $0x1
    20bb:	6a 04                	push   $0x4
    20bd:	e8 94 0e 00 00       	call   2f56 <color_printf>
    20c2:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    20c5:	dd 05 60 3b 00 00    	fldl   0x3b60
    20cb:	e9 a9 04 00 00       	jmp    2579 <Compute+0x6d6>
          }
          g_pos = i+1;
    20d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20d3:	83 c0 01             	add    $0x1,%eax
    20d6:	a3 60 4b 00 00       	mov    %eax,0x4b60
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    20db:	8b 45 e8             	mov    -0x18(%ebp),%eax
    20de:	c1 e0 05             	shl    $0x5,%eax
    20e1:	05 90 4b 00 00       	add    $0x4b90,%eax
    20e6:	dd 40 08             	fldl   0x8(%eax)
    20e9:	83 ec 04             	sub    $0x4,%esp
    20ec:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    20f0:	dd 1c 24             	fstpl  (%esp)
    20f3:	ff 75 e4             	pushl  -0x1c(%ebp)
    20f6:	e8 2f 12 00 00       	call   332a <pushd>
    20fb:	83 c4 10             	add    $0x10,%esp
    20fe:	e9 49 03 00 00       	jmp    244c <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    2103:	a1 60 4b 00 00       	mov    0x4b60,%eax
    2108:	89 c2                	mov    %eax,%edx
    210a:	8b 45 08             	mov    0x8(%ebp),%eax
    210d:	01 d0                	add    %edx,%eax
    210f:	0f b6 00             	movzbl (%eax),%eax
    2112:	3c 2d                	cmp    $0x2d,%al
    2114:	75 3f                	jne    2155 <Compute+0x2b2>
    2116:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    211a:	74 39                	je     2155 <Compute+0x2b2>
        {
            pushd(opnd,0);
    211c:	83 ec 04             	sub    $0x4,%esp
    211f:	d9 ee                	fldz   
    2121:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2125:	dd 1c 24             	fstpl  (%esp)
    2128:	ff 75 e4             	pushl  -0x1c(%ebp)
    212b:	e8 fa 11 00 00       	call   332a <pushd>
    2130:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    2133:	83 ec 08             	sub    $0x8,%esp
    2136:	6a 2d                	push   $0x2d
    2138:	ff 75 e0             	pushl  -0x20(%ebp)
    213b:	e8 1b 11 00 00       	call   325b <pushc>
    2140:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2143:	a1 60 4b 00 00       	mov    0x4b60,%eax
    2148:	83 c0 01             	add    $0x1,%eax
    214b:	a3 60 4b 00 00       	mov    %eax,0x4b60
    2150:	e9 f7 02 00 00       	jmp    244c <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    2155:	a1 60 4b 00 00       	mov    0x4b60,%eax
    215a:	89 c2                	mov    %eax,%edx
    215c:	8b 45 08             	mov    0x8(%ebp),%eax
    215f:	01 d0                	add    %edx,%eax
    2161:	0f b6 00             	movzbl (%eax),%eax
    2164:	3c 29                	cmp    $0x29,%al
    2166:	0f 85 01 01 00 00    	jne    226d <Compute+0x3ca>
        {
            is_minus = 0;
    216c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    2173:	a1 60 4b 00 00       	mov    0x4b60,%eax
    2178:	83 c0 01             	add    $0x1,%eax
    217b:	a3 60 4b 00 00       	mov    %eax,0x4b60
            while (topc(optr) != '(')
    2180:	e9 bf 00 00 00       	jmp    2244 <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    2185:	83 ec 0c             	sub    $0xc,%esp
    2188:	ff 75 e4             	pushl  -0x1c(%ebp)
    218b:	e8 37 12 00 00       	call   33c7 <topd>
    2190:	83 c4 10             	add    $0x10,%esp
    2193:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    2196:	83 ec 0c             	sub    $0xc,%esp
    2199:	ff 75 e4             	pushl  -0x1c(%ebp)
    219c:	e8 dd 11 00 00       	call   337e <popd>
    21a1:	dd d8                	fstp   %st(0)
    21a3:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    21a6:	83 ec 0c             	sub    $0xc,%esp
    21a9:	ff 75 e4             	pushl  -0x1c(%ebp)
    21ac:	e8 16 12 00 00       	call   33c7 <topd>
    21b1:	83 c4 10             	add    $0x10,%esp
    21b4:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    21b7:	83 ec 0c             	sub    $0xc,%esp
    21ba:	ff 75 e4             	pushl  -0x1c(%ebp)
    21bd:	e8 bc 11 00 00       	call   337e <popd>
    21c2:	dd d8                	fstp   %st(0)
    21c4:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    21c7:	83 ec 0c             	sub    $0xc,%esp
    21ca:	ff 75 e0             	pushl  -0x20(%ebp)
    21cd:	e8 11 11 00 00       	call   32e3 <topc>
    21d2:	83 c4 10             	add    $0x10,%esp
    21d5:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    21d8:	83 ec 0c             	sub    $0xc,%esp
    21db:	ff 75 e0             	pushl  -0x20(%ebp)
    21de:	e8 be 10 00 00       	call   32a1 <popc>
    21e3:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    21e6:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    21ea:	83 ec 0c             	sub    $0xc,%esp
    21ed:	ff 75 d4             	pushl  -0x2c(%ebp)
    21f0:	ff 75 d0             	pushl  -0x30(%ebp)
    21f3:	50                   	push   %eax
    21f4:	ff 75 cc             	pushl  -0x34(%ebp)
    21f7:	ff 75 c8             	pushl  -0x38(%ebp)
    21fa:	e8 ff fb ff ff       	call   1dfe <Operate>
    21ff:	83 c4 20             	add    $0x20,%esp
    2202:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    2205:	dd 05 60 3b 00 00    	fldl   0x3b60
    220b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    220f:	dd 1c 24             	fstpl  (%esp)
    2212:	ff 75 bc             	pushl  -0x44(%ebp)
    2215:	ff 75 b8             	pushl  -0x48(%ebp)
    2218:	e8 0f f0 ff ff       	call   122c <isEqual>
    221d:	83 c4 10             	add    $0x10,%esp
    2220:	83 f8 01             	cmp    $0x1,%eax
    2223:	75 0b                	jne    2230 <Compute+0x38d>
                  return WRONG_ANS;
    2225:	dd 05 60 3b 00 00    	fldl   0x3b60
    222b:	e9 49 03 00 00       	jmp    2579 <Compute+0x6d6>
                pushd(opnd,result);
    2230:	83 ec 04             	sub    $0x4,%esp
    2233:	ff 75 bc             	pushl  -0x44(%ebp)
    2236:	ff 75 b8             	pushl  -0x48(%ebp)
    2239:	ff 75 e4             	pushl  -0x1c(%ebp)
    223c:	e8 e9 10 00 00       	call   332a <pushd>
    2241:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    2244:	83 ec 0c             	sub    $0xc,%esp
    2247:	ff 75 e0             	pushl  -0x20(%ebp)
    224a:	e8 94 10 00 00       	call   32e3 <topc>
    224f:	83 c4 10             	add    $0x10,%esp
    2252:	3c 28                	cmp    $0x28,%al
    2254:	0f 85 2b ff ff ff    	jne    2185 <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    225a:	83 ec 0c             	sub    $0xc,%esp
    225d:	ff 75 e0             	pushl  -0x20(%ebp)
    2260:	e8 3c 10 00 00       	call   32a1 <popc>
    2265:	83 c4 10             	add    $0x10,%esp
    2268:	e9 df 01 00 00       	jmp    244c <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    226d:	a1 60 4b 00 00       	mov    0x4b60,%eax
    2272:	89 c2                	mov    %eax,%edx
    2274:	8b 45 08             	mov    0x8(%ebp),%eax
    2277:	01 d0                	add    %edx,%eax
    2279:	0f b6 00             	movzbl (%eax),%eax
    227c:	3c 2f                	cmp    $0x2f,%al
    227e:	7e 49                	jle    22c9 <Compute+0x426>
    2280:	a1 60 4b 00 00       	mov    0x4b60,%eax
    2285:	89 c2                	mov    %eax,%edx
    2287:	8b 45 08             	mov    0x8(%ebp),%eax
    228a:	01 d0                	add    %edx,%eax
    228c:	0f b6 00             	movzbl (%eax),%eax
    228f:	3c 39                	cmp    $0x39,%al
    2291:	7f 36                	jg     22c9 <Compute+0x426>
        {
            is_minus = 0;
    2293:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    229a:	83 ec 08             	sub    $0x8,%esp
    229d:	68 60 4b 00 00       	push   $0x4b60
    22a2:	ff 75 08             	pushl  0x8(%ebp)
    22a5:	e8 c3 eb ff ff       	call   e6d <Translation>
    22aa:	83 c4 10             	add    $0x10,%esp
    22ad:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    22b0:	83 ec 04             	sub    $0x4,%esp
    22b3:	ff 75 b4             	pushl  -0x4c(%ebp)
    22b6:	ff 75 b0             	pushl  -0x50(%ebp)
    22b9:	ff 75 e4             	pushl  -0x1c(%ebp)
    22bc:	e8 69 10 00 00       	call   332a <pushd>
    22c1:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    22c4:	e9 83 01 00 00       	jmp    244c <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    22c9:	a1 60 4b 00 00       	mov    0x4b60,%eax
    22ce:	89 c2                	mov    %eax,%edx
    22d0:	8b 45 08             	mov    0x8(%ebp),%eax
    22d3:	01 d0                	add    %edx,%eax
    22d5:	0f b6 00             	movzbl (%eax),%eax
    22d8:	3c 28                	cmp    $0x28,%al
    22da:	0f 85 f9 00 00 00    	jne    23d9 <Compute+0x536>
        {
            is_minus = 1;
    22e0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    22e7:	a1 60 4b 00 00       	mov    0x4b60,%eax
    22ec:	89 c2                	mov    %eax,%edx
    22ee:	8b 45 08             	mov    0x8(%ebp),%eax
    22f1:	01 d0                	add    %edx,%eax
    22f3:	0f b6 00             	movzbl (%eax),%eax
    22f6:	0f be c0             	movsbl %al,%eax
    22f9:	83 ec 08             	sub    $0x8,%esp
    22fc:	50                   	push   %eax
    22fd:	ff 75 e0             	pushl  -0x20(%ebp)
    2300:	e8 56 0f 00 00       	call   325b <pushc>
    2305:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2308:	a1 60 4b 00 00       	mov    0x4b60,%eax
    230d:	83 c0 01             	add    $0x1,%eax
    2310:	a3 60 4b 00 00       	mov    %eax,0x4b60
    2315:	e9 32 01 00 00       	jmp    244c <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    231a:	83 ec 0c             	sub    $0xc,%esp
    231d:	ff 75 e4             	pushl  -0x1c(%ebp)
    2320:	e8 a2 10 00 00       	call   33c7 <topd>
    2325:	83 c4 10             	add    $0x10,%esp
    2328:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    232b:	83 ec 0c             	sub    $0xc,%esp
    232e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2331:	e8 48 10 00 00       	call   337e <popd>
    2336:	dd d8                	fstp   %st(0)
    2338:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    233b:	83 ec 0c             	sub    $0xc,%esp
    233e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2341:	e8 81 10 00 00       	call   33c7 <topd>
    2346:	83 c4 10             	add    $0x10,%esp
    2349:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    234c:	83 ec 0c             	sub    $0xc,%esp
    234f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2352:	e8 27 10 00 00       	call   337e <popd>
    2357:	dd d8                	fstp   %st(0)
    2359:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    235c:	83 ec 0c             	sub    $0xc,%esp
    235f:	ff 75 e0             	pushl  -0x20(%ebp)
    2362:	e8 7c 0f 00 00       	call   32e3 <topc>
    2367:	83 c4 10             	add    $0x10,%esp
    236a:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    236d:	83 ec 0c             	sub    $0xc,%esp
    2370:	ff 75 e0             	pushl  -0x20(%ebp)
    2373:	e8 29 0f 00 00       	call   32a1 <popc>
    2378:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    237b:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    237f:	83 ec 0c             	sub    $0xc,%esp
    2382:	ff 75 ac             	pushl  -0x54(%ebp)
    2385:	ff 75 a8             	pushl  -0x58(%ebp)
    2388:	50                   	push   %eax
    2389:	ff 75 a4             	pushl  -0x5c(%ebp)
    238c:	ff 75 a0             	pushl  -0x60(%ebp)
    238f:	e8 6a fa ff ff       	call   1dfe <Operate>
    2394:	83 c4 20             	add    $0x20,%esp
    2397:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    239a:	dd 05 60 3b 00 00    	fldl   0x3b60
    23a0:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    23a4:	dd 1c 24             	fstpl  (%esp)
    23a7:	ff 75 94             	pushl  -0x6c(%ebp)
    23aa:	ff 75 90             	pushl  -0x70(%ebp)
    23ad:	e8 7a ee ff ff       	call   122c <isEqual>
    23b2:	83 c4 10             	add    $0x10,%esp
    23b5:	83 f8 01             	cmp    $0x1,%eax
    23b8:	75 0b                	jne    23c5 <Compute+0x522>
                  return WRONG_ANS;
    23ba:	dd 05 60 3b 00 00    	fldl   0x3b60
    23c0:	e9 b4 01 00 00       	jmp    2579 <Compute+0x6d6>
                pushd(opnd,result);
    23c5:	83 ec 04             	sub    $0x4,%esp
    23c8:	ff 75 94             	pushl  -0x6c(%ebp)
    23cb:	ff 75 90             	pushl  -0x70(%ebp)
    23ce:	ff 75 e4             	pushl  -0x1c(%ebp)
    23d1:	e8 54 0f 00 00       	call   332a <pushd>
    23d6:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    23d9:	a1 60 4b 00 00       	mov    0x4b60,%eax
    23de:	89 c2                	mov    %eax,%edx
    23e0:	8b 45 08             	mov    0x8(%ebp),%eax
    23e3:	01 d0                	add    %edx,%eax
    23e5:	0f b6 00             	movzbl (%eax),%eax
    23e8:	0f be c0             	movsbl %al,%eax
    23eb:	83 ec 0c             	sub    $0xc,%esp
    23ee:	50                   	push   %eax
    23ef:	e8 c6 f9 ff ff       	call   1dba <GetLevel>
    23f4:	83 c4 10             	add    $0x10,%esp
    23f7:	89 c3                	mov    %eax,%ebx
    23f9:	83 ec 0c             	sub    $0xc,%esp
    23fc:	ff 75 e0             	pushl  -0x20(%ebp)
    23ff:	e8 df 0e 00 00       	call   32e3 <topc>
    2404:	83 c4 10             	add    $0x10,%esp
    2407:	0f be c0             	movsbl %al,%eax
    240a:	83 ec 0c             	sub    $0xc,%esp
    240d:	50                   	push   %eax
    240e:	e8 a7 f9 ff ff       	call   1dba <GetLevel>
    2413:	83 c4 10             	add    $0x10,%esp
    2416:	39 c3                	cmp    %eax,%ebx
    2418:	0f 8e fc fe ff ff    	jle    231a <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    241e:	a1 60 4b 00 00       	mov    0x4b60,%eax
    2423:	89 c2                	mov    %eax,%edx
    2425:	8b 45 08             	mov    0x8(%ebp),%eax
    2428:	01 d0                	add    %edx,%eax
    242a:	0f b6 00             	movzbl (%eax),%eax
    242d:	0f be c0             	movsbl %al,%eax
    2430:	83 ec 08             	sub    $0x8,%esp
    2433:	50                   	push   %eax
    2434:	ff 75 e0             	pushl  -0x20(%ebp)
    2437:	e8 1f 0e 00 00       	call   325b <pushc>
    243c:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    243f:	a1 60 4b 00 00       	mov    0x4b60,%eax
    2444:	83 c0 01             	add    $0x1,%eax
    2447:	a3 60 4b 00 00       	mov    %eax,0x4b60
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    244c:	a1 60 4b 00 00       	mov    0x4b60,%eax
    2451:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    2454:	0f 8c 9a fa ff ff    	jl     1ef4 <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    245a:	e9 da 00 00 00       	jmp    2539 <Compute+0x696>
    {
        double a2 = topd(opnd);
    245f:	83 ec 0c             	sub    $0xc,%esp
    2462:	ff 75 e4             	pushl  -0x1c(%ebp)
    2465:	e8 5d 0f 00 00       	call   33c7 <topd>
    246a:	83 c4 10             	add    $0x10,%esp
    246d:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    2470:	83 ec 0c             	sub    $0xc,%esp
    2473:	ff 75 e4             	pushl  -0x1c(%ebp)
    2476:	e8 03 0f 00 00       	call   337e <popd>
    247b:	dd d8                	fstp   %st(0)
    247d:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    2480:	83 ec 0c             	sub    $0xc,%esp
    2483:	ff 75 e4             	pushl  -0x1c(%ebp)
    2486:	e8 3c 0f 00 00       	call   33c7 <topd>
    248b:	83 c4 10             	add    $0x10,%esp
    248e:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    2494:	83 ec 0c             	sub    $0xc,%esp
    2497:	ff 75 e4             	pushl  -0x1c(%ebp)
    249a:	e8 df 0e 00 00       	call   337e <popd>
    249f:	dd d8                	fstp   %st(0)
    24a1:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    24a4:	83 ec 0c             	sub    $0xc,%esp
    24a7:	ff 75 e0             	pushl  -0x20(%ebp)
    24aa:	e8 34 0e 00 00       	call   32e3 <topc>
    24af:	83 c4 10             	add    $0x10,%esp
    24b2:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    24b8:	83 ec 0c             	sub    $0xc,%esp
    24bb:	ff 75 e0             	pushl  -0x20(%ebp)
    24be:	e8 de 0d 00 00       	call   32a1 <popc>
    24c3:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    24c6:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    24cd:	83 ec 0c             	sub    $0xc,%esp
    24d0:	ff 75 84             	pushl  -0x7c(%ebp)
    24d3:	ff 75 80             	pushl  -0x80(%ebp)
    24d6:	50                   	push   %eax
    24d7:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    24dd:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    24e3:	e8 16 f9 ff ff       	call   1dfe <Operate>
    24e8:	83 c4 20             	add    $0x20,%esp
    24eb:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    24f1:	dd 05 60 3b 00 00    	fldl   0x3b60
    24f7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    24fb:	dd 1c 24             	fstpl  (%esp)
    24fe:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2504:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    250a:	e8 1d ed ff ff       	call   122c <isEqual>
    250f:	83 c4 10             	add    $0x10,%esp
    2512:	83 f8 01             	cmp    $0x1,%eax
    2515:	75 08                	jne    251f <Compute+0x67c>
          return WRONG_ANS;
    2517:	dd 05 60 3b 00 00    	fldl   0x3b60
    251d:	eb 5a                	jmp    2579 <Compute+0x6d6>
        pushd(opnd,result);
    251f:	83 ec 04             	sub    $0x4,%esp
    2522:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2528:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    252e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2531:	e8 f4 0d 00 00       	call   332a <pushd>
    2536:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2539:	83 ec 0c             	sub    $0xc,%esp
    253c:	ff 75 e0             	pushl  -0x20(%ebp)
    253f:	e8 9f 0d 00 00       	call   32e3 <topc>
    2544:	83 c4 10             	add    $0x10,%esp
    2547:	3c 23                	cmp    $0x23,%al
    2549:	0f 85 10 ff ff ff    	jne    245f <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    254f:	83 ec 0c             	sub    $0xc,%esp
    2552:	ff 75 e4             	pushl  -0x1c(%ebp)
    2555:	e8 94 e4 ff ff       	call   9ee <free>
    255a:	83 c4 10             	add    $0x10,%esp
    free(optr);
    255d:	83 ec 0c             	sub    $0xc,%esp
    2560:	ff 75 e0             	pushl  -0x20(%ebp)
    2563:	e8 86 e4 ff ff       	call   9ee <free>
    2568:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    256b:	83 ec 0c             	sub    $0xc,%esp
    256e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2571:	e8 51 0e 00 00       	call   33c7 <topd>
    2576:	83 c4 10             	add    $0x10,%esp
}
    2579:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    257c:	c9                   	leave  
    257d:	c3                   	ret    

0000257e <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    257e:	55                   	push   %ebp
    257f:	89 e5                	mov    %esp,%ebp
    2581:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    2584:	8b 45 08             	mov    0x8(%ebp),%eax
    2587:	8b 00                	mov    (%eax),%eax
    2589:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    258c:	eb 04                	jmp    2592 <gettoken+0x14>
    s++;
    258e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2592:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2595:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2598:	73 1e                	jae    25b8 <gettoken+0x3a>
    259a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    259d:	0f b6 00             	movzbl (%eax),%eax
    25a0:	0f be c0             	movsbl %al,%eax
    25a3:	83 ec 08             	sub    $0x8,%esp
    25a6:	50                   	push   %eax
    25a7:	68 14 47 00 00       	push   $0x4714
    25ac:	e8 50 de ff ff       	call   401 <strchr>
    25b1:	83 c4 10             	add    $0x10,%esp
    25b4:	85 c0                	test   %eax,%eax
    25b6:	75 d6                	jne    258e <gettoken+0x10>
    s++;
  if(q)
    25b8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    25bc:	74 08                	je     25c6 <gettoken+0x48>
    *q = s;
    25be:	8b 45 10             	mov    0x10(%ebp),%eax
    25c1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    25c4:	89 10                	mov    %edx,(%eax)
  ret = *s;
    25c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25c9:	0f b6 00             	movzbl (%eax),%eax
    25cc:	0f be c0             	movsbl %al,%eax
    25cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    25d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25d5:	0f b6 00             	movzbl (%eax),%eax
    25d8:	0f be c0             	movsbl %al,%eax
    25db:	83 f8 29             	cmp    $0x29,%eax
    25de:	7f 14                	jg     25f4 <gettoken+0x76>
    25e0:	83 f8 28             	cmp    $0x28,%eax
    25e3:	7d 28                	jge    260d <gettoken+0x8f>
    25e5:	85 c0                	test   %eax,%eax
    25e7:	0f 84 94 00 00 00    	je     2681 <gettoken+0x103>
    25ed:	83 f8 26             	cmp    $0x26,%eax
    25f0:	74 1b                	je     260d <gettoken+0x8f>
    25f2:	eb 3a                	jmp    262e <gettoken+0xb0>
    25f4:	83 f8 3e             	cmp    $0x3e,%eax
    25f7:	74 1a                	je     2613 <gettoken+0x95>
    25f9:	83 f8 3e             	cmp    $0x3e,%eax
    25fc:	7f 0a                	jg     2608 <gettoken+0x8a>
    25fe:	83 e8 3b             	sub    $0x3b,%eax
    2601:	83 f8 01             	cmp    $0x1,%eax
    2604:	77 28                	ja     262e <gettoken+0xb0>
    2606:	eb 05                	jmp    260d <gettoken+0x8f>
    2608:	83 f8 7c             	cmp    $0x7c,%eax
    260b:	75 21                	jne    262e <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    260d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    2611:	eb 75                	jmp    2688 <gettoken+0x10a>
  case '>':
    s++;
    2613:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    2617:	8b 45 f4             	mov    -0xc(%ebp),%eax
    261a:	0f b6 00             	movzbl (%eax),%eax
    261d:	3c 3e                	cmp    $0x3e,%al
    261f:	75 63                	jne    2684 <gettoken+0x106>
      ret = '+';
    2621:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    2628:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    262c:	eb 56                	jmp    2684 <gettoken+0x106>
  default:
    ret = 'a';
    262e:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2635:	eb 04                	jmp    263b <gettoken+0xbd>
      s++;
    2637:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    263b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    263e:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2641:	73 44                	jae    2687 <gettoken+0x109>
    2643:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2646:	0f b6 00             	movzbl (%eax),%eax
    2649:	0f be c0             	movsbl %al,%eax
    264c:	83 ec 08             	sub    $0x8,%esp
    264f:	50                   	push   %eax
    2650:	68 14 47 00 00       	push   $0x4714
    2655:	e8 a7 dd ff ff       	call   401 <strchr>
    265a:	83 c4 10             	add    $0x10,%esp
    265d:	85 c0                	test   %eax,%eax
    265f:	75 26                	jne    2687 <gettoken+0x109>
    2661:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2664:	0f b6 00             	movzbl (%eax),%eax
    2667:	0f be c0             	movsbl %al,%eax
    266a:	83 ec 08             	sub    $0x8,%esp
    266d:	50                   	push   %eax
    266e:	68 1c 47 00 00       	push   $0x471c
    2673:	e8 89 dd ff ff       	call   401 <strchr>
    2678:	83 c4 10             	add    $0x10,%esp
    267b:	85 c0                	test   %eax,%eax
    267d:	74 b8                	je     2637 <gettoken+0xb9>
      s++;
    break;
    267f:	eb 06                	jmp    2687 <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    2681:	90                   	nop
    2682:	eb 04                	jmp    2688 <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    2684:	90                   	nop
    2685:	eb 01                	jmp    2688 <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    2687:	90                   	nop
  }
  if(eq)
    2688:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    268c:	74 0e                	je     269c <gettoken+0x11e>
    *eq = s;
    268e:	8b 45 14             	mov    0x14(%ebp),%eax
    2691:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2694:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    2696:	eb 04                	jmp    269c <gettoken+0x11e>
    s++;
    2698:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    269c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    269f:	3b 45 0c             	cmp    0xc(%ebp),%eax
    26a2:	73 1e                	jae    26c2 <gettoken+0x144>
    26a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26a7:	0f b6 00             	movzbl (%eax),%eax
    26aa:	0f be c0             	movsbl %al,%eax
    26ad:	83 ec 08             	sub    $0x8,%esp
    26b0:	50                   	push   %eax
    26b1:	68 14 47 00 00       	push   $0x4714
    26b6:	e8 46 dd ff ff       	call   401 <strchr>
    26bb:	83 c4 10             	add    $0x10,%esp
    26be:	85 c0                	test   %eax,%eax
    26c0:	75 d6                	jne    2698 <gettoken+0x11a>
    s++;
  *ps = s;
    26c2:	8b 45 08             	mov    0x8(%ebp),%eax
    26c5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    26c8:	89 10                	mov    %edx,(%eax)
  return ret;
    26ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    26cd:	c9                   	leave  
    26ce:	c3                   	ret    

000026cf <peek>:

int peek(char **ps, char *es, char *toks)
{
    26cf:	55                   	push   %ebp
    26d0:	89 e5                	mov    %esp,%ebp
    26d2:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    26d5:	8b 45 08             	mov    0x8(%ebp),%eax
    26d8:	8b 00                	mov    (%eax),%eax
    26da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    26dd:	eb 04                	jmp    26e3 <peek+0x14>
    s++;
    26df:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    26e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26e6:	3b 45 0c             	cmp    0xc(%ebp),%eax
    26e9:	73 1e                	jae    2709 <peek+0x3a>
    26eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26ee:	0f b6 00             	movzbl (%eax),%eax
    26f1:	0f be c0             	movsbl %al,%eax
    26f4:	83 ec 08             	sub    $0x8,%esp
    26f7:	50                   	push   %eax
    26f8:	68 14 47 00 00       	push   $0x4714
    26fd:	e8 ff dc ff ff       	call   401 <strchr>
    2702:	83 c4 10             	add    $0x10,%esp
    2705:	85 c0                	test   %eax,%eax
    2707:	75 d6                	jne    26df <peek+0x10>
    s++;
  *ps = s;
    2709:	8b 45 08             	mov    0x8(%ebp),%eax
    270c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    270f:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    2711:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2714:	0f b6 00             	movzbl (%eax),%eax
    2717:	84 c0                	test   %al,%al
    2719:	74 23                	je     273e <peek+0x6f>
    271b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    271e:	0f b6 00             	movzbl (%eax),%eax
    2721:	0f be c0             	movsbl %al,%eax
    2724:	83 ec 08             	sub    $0x8,%esp
    2727:	50                   	push   %eax
    2728:	ff 75 10             	pushl  0x10(%ebp)
    272b:	e8 d1 dc ff ff       	call   401 <strchr>
    2730:	83 c4 10             	add    $0x10,%esp
    2733:	85 c0                	test   %eax,%eax
    2735:	74 07                	je     273e <peek+0x6f>
    2737:	b8 01 00 00 00       	mov    $0x1,%eax
    273c:	eb 05                	jmp    2743 <peek+0x74>
    273e:	b8 00 00 00 00       	mov    $0x0,%eax
}
    2743:	c9                   	leave  
    2744:	c3                   	ret    

00002745 <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    2745:	55                   	push   %ebp
    2746:	89 e5                	mov    %esp,%ebp
    2748:	53                   	push   %ebx
    2749:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    274c:	8b 5d 08             	mov    0x8(%ebp),%ebx
    274f:	8b 45 08             	mov    0x8(%ebp),%eax
    2752:	83 ec 0c             	sub    $0xc,%esp
    2755:	50                   	push   %eax
    2756:	e8 65 dc ff ff       	call   3c0 <strlen>
    275b:	83 c4 10             	add    $0x10,%esp
    275e:	01 d8                	add    %ebx,%eax
    2760:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    2763:	8b 45 08             	mov    0x8(%ebp),%eax
    2766:	0f b6 00             	movzbl (%eax),%eax
    2769:	3c 25                	cmp    $0x25,%al
    276b:	75 5d                	jne    27ca <parsecmd+0x85>
  {
    int len = strlen(s);
    276d:	8b 45 08             	mov    0x8(%ebp),%eax
    2770:	83 ec 0c             	sub    $0xc,%esp
    2773:	50                   	push   %eax
    2774:	e8 47 dc ff ff       	call   3c0 <strlen>
    2779:	83 c4 10             	add    $0x10,%esp
    277c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    277f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2782:	83 ec 0c             	sub    $0xc,%esp
    2785:	50                   	push   %eax
    2786:	e8 a5 e3 ff ff       	call   b30 <malloc>
    278b:	83 c4 10             	add    $0x10,%esp
    278e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    2791:	8b 45 08             	mov    0x8(%ebp),%eax
    2794:	83 c0 01             	add    $0x1,%eax
    2797:	83 ec 08             	sub    $0x8,%esp
    279a:	50                   	push   %eax
    279b:	ff 75 ec             	pushl  -0x14(%ebp)
    279e:	e8 ae db ff ff       	call   351 <strcpy>
    27a3:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    27a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27a9:	8d 50 fe             	lea    -0x2(%eax),%edx
    27ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27af:	01 d0                	add    %edx,%eax
    27b1:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    27b4:	83 ec 0c             	sub    $0xc,%esp
    27b7:	ff 75 ec             	pushl  -0x14(%ebp)
    27ba:	e8 59 e9 ff ff       	call   1118 <calcmd>
    27bf:	83 c4 10             	add    $0x10,%esp
    27c2:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    27c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27c8:	eb 6b                	jmp    2835 <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    27ca:	83 ec 08             	sub    $0x8,%esp
    27cd:	ff 75 f4             	pushl  -0xc(%ebp)
    27d0:	8d 45 08             	lea    0x8(%ebp),%eax
    27d3:	50                   	push   %eax
    27d4:	e8 61 00 00 00       	call   283a <parseline>
    27d9:	83 c4 10             	add    $0x10,%esp
    27dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    27df:	83 ec 04             	sub    $0x4,%esp
    27e2:	68 68 3b 00 00       	push   $0x3b68
    27e7:	ff 75 f4             	pushl  -0xc(%ebp)
    27ea:	8d 45 08             	lea    0x8(%ebp),%eax
    27ed:	50                   	push   %eax
    27ee:	e8 dc fe ff ff       	call   26cf <peek>
    27f3:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    27f6:	8b 45 08             	mov    0x8(%ebp),%eax
    27f9:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    27fc:	74 26                	je     2824 <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    27fe:	8b 45 08             	mov    0x8(%ebp),%eax
    2801:	83 ec 04             	sub    $0x4,%esp
    2804:	50                   	push   %eax
    2805:	68 69 3b 00 00       	push   $0x3b69
    280a:	6a 02                	push   $0x2
    280c:	e8 1d e0 ff ff       	call   82e <printf>
    2811:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    2814:	83 ec 0c             	sub    $0xc,%esp
    2817:	68 78 3b 00 00       	push   $0x3b78
    281c:	e8 f2 e3 ff ff       	call   c13 <panic1>
    2821:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    2824:	83 ec 0c             	sub    $0xc,%esp
    2827:	ff 75 e4             	pushl  -0x1c(%ebp)
    282a:	e8 eb 03 00 00       	call   2c1a <nulterminate>
    282f:	83 c4 10             	add    $0x10,%esp
  return cmd;
    2832:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    2835:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2838:	c9                   	leave  
    2839:	c3                   	ret    

0000283a <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    283a:	55                   	push   %ebp
    283b:	89 e5                	mov    %esp,%ebp
    283d:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    2840:	83 ec 08             	sub    $0x8,%esp
    2843:	ff 75 0c             	pushl  0xc(%ebp)
    2846:	ff 75 08             	pushl  0x8(%ebp)
    2849:	e8 99 00 00 00       	call   28e7 <parsepipe>
    284e:	83 c4 10             	add    $0x10,%esp
    2851:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    2854:	eb 23                	jmp    2879 <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    2856:	6a 00                	push   $0x0
    2858:	6a 00                	push   $0x0
    285a:	ff 75 0c             	pushl  0xc(%ebp)
    285d:	ff 75 08             	pushl  0x8(%ebp)
    2860:	e8 19 fd ff ff       	call   257e <gettoken>
    2865:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    2868:	83 ec 0c             	sub    $0xc,%esp
    286b:	ff 75 f4             	pushl  -0xc(%ebp)
    286e:	e8 66 e8 ff ff       	call   10d9 <backcmd>
    2873:	83 c4 10             	add    $0x10,%esp
    2876:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    2879:	83 ec 04             	sub    $0x4,%esp
    287c:	68 7f 3b 00 00       	push   $0x3b7f
    2881:	ff 75 0c             	pushl  0xc(%ebp)
    2884:	ff 75 08             	pushl  0x8(%ebp)
    2887:	e8 43 fe ff ff       	call   26cf <peek>
    288c:	83 c4 10             	add    $0x10,%esp
    288f:	85 c0                	test   %eax,%eax
    2891:	75 c3                	jne    2856 <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    2893:	83 ec 04             	sub    $0x4,%esp
    2896:	68 81 3b 00 00       	push   $0x3b81
    289b:	ff 75 0c             	pushl  0xc(%ebp)
    289e:	ff 75 08             	pushl  0x8(%ebp)
    28a1:	e8 29 fe ff ff       	call   26cf <peek>
    28a6:	83 c4 10             	add    $0x10,%esp
    28a9:	85 c0                	test   %eax,%eax
    28ab:	74 35                	je     28e2 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    28ad:	6a 00                	push   $0x0
    28af:	6a 00                	push   $0x0
    28b1:	ff 75 0c             	pushl  0xc(%ebp)
    28b4:	ff 75 08             	pushl  0x8(%ebp)
    28b7:	e8 c2 fc ff ff       	call   257e <gettoken>
    28bc:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    28bf:	83 ec 08             	sub    $0x8,%esp
    28c2:	ff 75 0c             	pushl  0xc(%ebp)
    28c5:	ff 75 08             	pushl  0x8(%ebp)
    28c8:	e8 6d ff ff ff       	call   283a <parseline>
    28cd:	83 c4 10             	add    $0x10,%esp
    28d0:	83 ec 08             	sub    $0x8,%esp
    28d3:	50                   	push   %eax
    28d4:	ff 75 f4             	pushl  -0xc(%ebp)
    28d7:	e8 b5 e7 ff ff       	call   1091 <listcmd>
    28dc:	83 c4 10             	add    $0x10,%esp
    28df:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    28e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    28e5:	c9                   	leave  
    28e6:	c3                   	ret    

000028e7 <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    28e7:	55                   	push   %ebp
    28e8:	89 e5                	mov    %esp,%ebp
    28ea:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    28ed:	83 ec 08             	sub    $0x8,%esp
    28f0:	ff 75 0c             	pushl  0xc(%ebp)
    28f3:	ff 75 08             	pushl  0x8(%ebp)
    28f6:	e8 ec 01 00 00       	call   2ae7 <parseexec>
    28fb:	83 c4 10             	add    $0x10,%esp
    28fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    2901:	83 ec 04             	sub    $0x4,%esp
    2904:	68 83 3b 00 00       	push   $0x3b83
    2909:	ff 75 0c             	pushl  0xc(%ebp)
    290c:	ff 75 08             	pushl  0x8(%ebp)
    290f:	e8 bb fd ff ff       	call   26cf <peek>
    2914:	83 c4 10             	add    $0x10,%esp
    2917:	85 c0                	test   %eax,%eax
    2919:	74 35                	je     2950 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    291b:	6a 00                	push   $0x0
    291d:	6a 00                	push   $0x0
    291f:	ff 75 0c             	pushl  0xc(%ebp)
    2922:	ff 75 08             	pushl  0x8(%ebp)
    2925:	e8 54 fc ff ff       	call   257e <gettoken>
    292a:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    292d:	83 ec 08             	sub    $0x8,%esp
    2930:	ff 75 0c             	pushl  0xc(%ebp)
    2933:	ff 75 08             	pushl  0x8(%ebp)
    2936:	e8 ac ff ff ff       	call   28e7 <parsepipe>
    293b:	83 c4 10             	add    $0x10,%esp
    293e:	83 ec 08             	sub    $0x8,%esp
    2941:	50                   	push   %eax
    2942:	ff 75 f4             	pushl  -0xc(%ebp)
    2945:	e8 ff e6 ff ff       	call   1049 <pipecmd>
    294a:	83 c4 10             	add    $0x10,%esp
    294d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2950:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2953:	c9                   	leave  
    2954:	c3                   	ret    

00002955 <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    2955:	55                   	push   %ebp
    2956:	89 e5                	mov    %esp,%ebp
    2958:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    295b:	e9 b6 00 00 00       	jmp    2a16 <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    2960:	6a 00                	push   $0x0
    2962:	6a 00                	push   $0x0
    2964:	ff 75 10             	pushl  0x10(%ebp)
    2967:	ff 75 0c             	pushl  0xc(%ebp)
    296a:	e8 0f fc ff ff       	call   257e <gettoken>
    296f:	83 c4 10             	add    $0x10,%esp
    2972:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    2975:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2978:	50                   	push   %eax
    2979:	8d 45 f0             	lea    -0x10(%ebp),%eax
    297c:	50                   	push   %eax
    297d:	ff 75 10             	pushl  0x10(%ebp)
    2980:	ff 75 0c             	pushl  0xc(%ebp)
    2983:	e8 f6 fb ff ff       	call   257e <gettoken>
    2988:	83 c4 10             	add    $0x10,%esp
    298b:	83 f8 61             	cmp    $0x61,%eax
    298e:	74 10                	je     29a0 <parseredirs+0x4b>
      panic1("missing file for redirection");
    2990:	83 ec 0c             	sub    $0xc,%esp
    2993:	68 85 3b 00 00       	push   $0x3b85
    2998:	e8 76 e2 ff ff       	call   c13 <panic1>
    299d:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    29a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29a3:	83 f8 3c             	cmp    $0x3c,%eax
    29a6:	74 0c                	je     29b4 <parseredirs+0x5f>
    29a8:	83 f8 3e             	cmp    $0x3e,%eax
    29ab:	74 26                	je     29d3 <parseredirs+0x7e>
    29ad:	83 f8 2b             	cmp    $0x2b,%eax
    29b0:	74 43                	je     29f5 <parseredirs+0xa0>
    29b2:	eb 62                	jmp    2a16 <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    29b4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    29b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29ba:	83 ec 0c             	sub    $0xc,%esp
    29bd:	6a 00                	push   $0x0
    29bf:	6a 00                	push   $0x0
    29c1:	52                   	push   %edx
    29c2:	50                   	push   %eax
    29c3:	ff 75 08             	pushl  0x8(%ebp)
    29c6:	e8 1b e6 ff ff       	call   fe6 <redircmd>
    29cb:	83 c4 20             	add    $0x20,%esp
    29ce:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    29d1:	eb 43                	jmp    2a16 <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    29d3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    29d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29d9:	83 ec 0c             	sub    $0xc,%esp
    29dc:	6a 01                	push   $0x1
    29de:	68 01 02 00 00       	push   $0x201
    29e3:	52                   	push   %edx
    29e4:	50                   	push   %eax
    29e5:	ff 75 08             	pushl  0x8(%ebp)
    29e8:	e8 f9 e5 ff ff       	call   fe6 <redircmd>
    29ed:	83 c4 20             	add    $0x20,%esp
    29f0:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    29f3:	eb 21                	jmp    2a16 <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    29f5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    29f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29fb:	83 ec 0c             	sub    $0xc,%esp
    29fe:	6a 01                	push   $0x1
    2a00:	68 01 02 00 00       	push   $0x201
    2a05:	52                   	push   %edx
    2a06:	50                   	push   %eax
    2a07:	ff 75 08             	pushl  0x8(%ebp)
    2a0a:	e8 d7 e5 ff ff       	call   fe6 <redircmd>
    2a0f:	83 c4 20             	add    $0x20,%esp
    2a12:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2a15:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2a16:	83 ec 04             	sub    $0x4,%esp
    2a19:	68 a2 3b 00 00       	push   $0x3ba2
    2a1e:	ff 75 10             	pushl  0x10(%ebp)
    2a21:	ff 75 0c             	pushl  0xc(%ebp)
    2a24:	e8 a6 fc ff ff       	call   26cf <peek>
    2a29:	83 c4 10             	add    $0x10,%esp
    2a2c:	85 c0                	test   %eax,%eax
    2a2e:	0f 85 2c ff ff ff    	jne    2960 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    2a34:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2a37:	c9                   	leave  
    2a38:	c3                   	ret    

00002a39 <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    2a39:	55                   	push   %ebp
    2a3a:	89 e5                	mov    %esp,%ebp
    2a3c:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2a3f:	83 ec 04             	sub    $0x4,%esp
    2a42:	68 a5 3b 00 00       	push   $0x3ba5
    2a47:	ff 75 0c             	pushl  0xc(%ebp)
    2a4a:	ff 75 08             	pushl  0x8(%ebp)
    2a4d:	e8 7d fc ff ff       	call   26cf <peek>
    2a52:	83 c4 10             	add    $0x10,%esp
    2a55:	85 c0                	test   %eax,%eax
    2a57:	75 10                	jne    2a69 <parseblock+0x30>
    panic1("parseblock");
    2a59:	83 ec 0c             	sub    $0xc,%esp
    2a5c:	68 a7 3b 00 00       	push   $0x3ba7
    2a61:	e8 ad e1 ff ff       	call   c13 <panic1>
    2a66:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2a69:	6a 00                	push   $0x0
    2a6b:	6a 00                	push   $0x0
    2a6d:	ff 75 0c             	pushl  0xc(%ebp)
    2a70:	ff 75 08             	pushl  0x8(%ebp)
    2a73:	e8 06 fb ff ff       	call   257e <gettoken>
    2a78:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    2a7b:	83 ec 08             	sub    $0x8,%esp
    2a7e:	ff 75 0c             	pushl  0xc(%ebp)
    2a81:	ff 75 08             	pushl  0x8(%ebp)
    2a84:	e8 b1 fd ff ff       	call   283a <parseline>
    2a89:	83 c4 10             	add    $0x10,%esp
    2a8c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    2a8f:	83 ec 04             	sub    $0x4,%esp
    2a92:	68 b2 3b 00 00       	push   $0x3bb2
    2a97:	ff 75 0c             	pushl  0xc(%ebp)
    2a9a:	ff 75 08             	pushl  0x8(%ebp)
    2a9d:	e8 2d fc ff ff       	call   26cf <peek>
    2aa2:	83 c4 10             	add    $0x10,%esp
    2aa5:	85 c0                	test   %eax,%eax
    2aa7:	75 10                	jne    2ab9 <parseblock+0x80>
    panic1("syntax - missing )");
    2aa9:	83 ec 0c             	sub    $0xc,%esp
    2aac:	68 b4 3b 00 00       	push   $0x3bb4
    2ab1:	e8 5d e1 ff ff       	call   c13 <panic1>
    2ab6:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2ab9:	6a 00                	push   $0x0
    2abb:	6a 00                	push   $0x0
    2abd:	ff 75 0c             	pushl  0xc(%ebp)
    2ac0:	ff 75 08             	pushl  0x8(%ebp)
    2ac3:	e8 b6 fa ff ff       	call   257e <gettoken>
    2ac8:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    2acb:	83 ec 04             	sub    $0x4,%esp
    2ace:	ff 75 0c             	pushl  0xc(%ebp)
    2ad1:	ff 75 08             	pushl  0x8(%ebp)
    2ad4:	ff 75 f4             	pushl  -0xc(%ebp)
    2ad7:	e8 79 fe ff ff       	call   2955 <parseredirs>
    2adc:	83 c4 10             	add    $0x10,%esp
    2adf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    2ae2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2ae5:	c9                   	leave  
    2ae6:	c3                   	ret    

00002ae7 <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    2ae7:	55                   	push   %ebp
    2ae8:	89 e5                	mov    %esp,%ebp
    2aea:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    2aed:	83 ec 04             	sub    $0x4,%esp
    2af0:	68 a5 3b 00 00       	push   $0x3ba5
    2af5:	ff 75 0c             	pushl  0xc(%ebp)
    2af8:	ff 75 08             	pushl  0x8(%ebp)
    2afb:	e8 cf fb ff ff       	call   26cf <peek>
    2b00:	83 c4 10             	add    $0x10,%esp
    2b03:	85 c0                	test   %eax,%eax
    2b05:	74 16                	je     2b1d <parseexec+0x36>
    return parseblock(ps, es);
    2b07:	83 ec 08             	sub    $0x8,%esp
    2b0a:	ff 75 0c             	pushl  0xc(%ebp)
    2b0d:	ff 75 08             	pushl  0x8(%ebp)
    2b10:	e8 24 ff ff ff       	call   2a39 <parseblock>
    2b15:	83 c4 10             	add    $0x10,%esp
    2b18:	e9 fb 00 00 00       	jmp    2c18 <parseexec+0x131>

  ret = execcmd();
    2b1d:	e8 8e e4 ff ff       	call   fb0 <execcmd>
    2b22:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    2b25:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b28:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2b2b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2b32:	83 ec 04             	sub    $0x4,%esp
    2b35:	ff 75 0c             	pushl  0xc(%ebp)
    2b38:	ff 75 08             	pushl  0x8(%ebp)
    2b3b:	ff 75 f0             	pushl  -0x10(%ebp)
    2b3e:	e8 12 fe ff ff       	call   2955 <parseredirs>
    2b43:	83 c4 10             	add    $0x10,%esp
    2b46:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    2b49:	e9 87 00 00 00       	jmp    2bd5 <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2b4e:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2b51:	50                   	push   %eax
    2b52:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2b55:	50                   	push   %eax
    2b56:	ff 75 0c             	pushl  0xc(%ebp)
    2b59:	ff 75 08             	pushl  0x8(%ebp)
    2b5c:	e8 1d fa ff ff       	call   257e <gettoken>
    2b61:	83 c4 10             	add    $0x10,%esp
    2b64:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2b67:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2b6b:	0f 84 84 00 00 00    	je     2bf5 <parseexec+0x10e>
      break;
    if(tok != 'a')
    2b71:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    2b75:	74 10                	je     2b87 <parseexec+0xa0>
      panic1("syntax");
    2b77:	83 ec 0c             	sub    $0xc,%esp
    2b7a:	68 78 3b 00 00       	push   $0x3b78
    2b7f:	e8 8f e0 ff ff       	call   c13 <panic1>
    2b84:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    2b87:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    2b8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b8d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2b90:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    2b94:	8b 55 e0             	mov    -0x20(%ebp),%edx
    2b97:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b9a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2b9d:	83 c1 08             	add    $0x8,%ecx
    2ba0:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    2ba4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    2ba8:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2bac:	7e 10                	jle    2bbe <parseexec+0xd7>
      panic1("too many args");
    2bae:	83 ec 0c             	sub    $0xc,%esp
    2bb1:	68 c7 3b 00 00       	push   $0x3bc7
    2bb6:	e8 58 e0 ff ff       	call   c13 <panic1>
    2bbb:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2bbe:	83 ec 04             	sub    $0x4,%esp
    2bc1:	ff 75 0c             	pushl  0xc(%ebp)
    2bc4:	ff 75 08             	pushl  0x8(%ebp)
    2bc7:	ff 75 f0             	pushl  -0x10(%ebp)
    2bca:	e8 86 fd ff ff       	call   2955 <parseredirs>
    2bcf:	83 c4 10             	add    $0x10,%esp
    2bd2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    2bd5:	83 ec 04             	sub    $0x4,%esp
    2bd8:	68 d5 3b 00 00       	push   $0x3bd5
    2bdd:	ff 75 0c             	pushl  0xc(%ebp)
    2be0:	ff 75 08             	pushl  0x8(%ebp)
    2be3:	e8 e7 fa ff ff       	call   26cf <peek>
    2be8:	83 c4 10             	add    $0x10,%esp
    2beb:	85 c0                	test   %eax,%eax
    2bed:	0f 84 5b ff ff ff    	je     2b4e <parseexec+0x67>
    2bf3:	eb 01                	jmp    2bf6 <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    2bf5:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    2bf6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2bf9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2bfc:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    2c03:	00 
  cmd->eargv[argc] = 0;
    2c04:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c07:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c0a:	83 c2 08             	add    $0x8,%edx
    2c0d:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    2c14:	00 
  return ret;
    2c15:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2c18:	c9                   	leave  
    2c19:	c3                   	ret    

00002c1a <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2c1a:	55                   	push   %ebp
    2c1b:	89 e5                	mov    %esp,%ebp
    2c1d:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2c20:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2c24:	75 0a                	jne    2c30 <nulterminate+0x16>
    return 0;
    2c26:	b8 00 00 00 00       	mov    $0x0,%eax
    2c2b:	e9 e4 00 00 00       	jmp    2d14 <nulterminate+0xfa>
  
  switch(cmd->type){
    2c30:	8b 45 08             	mov    0x8(%ebp),%eax
    2c33:	8b 00                	mov    (%eax),%eax
    2c35:	83 f8 05             	cmp    $0x5,%eax
    2c38:	0f 87 d3 00 00 00    	ja     2d11 <nulterminate+0xf7>
    2c3e:	8b 04 85 dc 3b 00 00 	mov    0x3bdc(,%eax,4),%eax
    2c45:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2c47:	8b 45 08             	mov    0x8(%ebp),%eax
    2c4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2c4d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2c54:	eb 14                	jmp    2c6a <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2c56:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c59:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c5c:	83 c2 08             	add    $0x8,%edx
    2c5f:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2c63:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2c66:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2c6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c6d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c70:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2c74:	85 c0                	test   %eax,%eax
    2c76:	75 de                	jne    2c56 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2c78:	e9 94 00 00 00       	jmp    2d11 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2c7d:	8b 45 08             	mov    0x8(%ebp),%eax
    2c80:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2c83:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c86:	8b 40 04             	mov    0x4(%eax),%eax
    2c89:	83 ec 0c             	sub    $0xc,%esp
    2c8c:	50                   	push   %eax
    2c8d:	e8 88 ff ff ff       	call   2c1a <nulterminate>
    2c92:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2c95:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c98:	8b 40 0c             	mov    0xc(%eax),%eax
    2c9b:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2c9e:	eb 71                	jmp    2d11 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2ca0:	8b 45 08             	mov    0x8(%ebp),%eax
    2ca3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2ca6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ca9:	8b 40 04             	mov    0x4(%eax),%eax
    2cac:	83 ec 0c             	sub    $0xc,%esp
    2caf:	50                   	push   %eax
    2cb0:	e8 65 ff ff ff       	call   2c1a <nulterminate>
    2cb5:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2cb8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2cbb:	8b 40 08             	mov    0x8(%eax),%eax
    2cbe:	83 ec 0c             	sub    $0xc,%esp
    2cc1:	50                   	push   %eax
    2cc2:	e8 53 ff ff ff       	call   2c1a <nulterminate>
    2cc7:	83 c4 10             	add    $0x10,%esp
    break;
    2cca:	eb 45                	jmp    2d11 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2ccc:	8b 45 08             	mov    0x8(%ebp),%eax
    2ccf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2cd2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2cd5:	8b 40 04             	mov    0x4(%eax),%eax
    2cd8:	83 ec 0c             	sub    $0xc,%esp
    2cdb:	50                   	push   %eax
    2cdc:	e8 39 ff ff ff       	call   2c1a <nulterminate>
    2ce1:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2ce4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ce7:	8b 40 08             	mov    0x8(%eax),%eax
    2cea:	83 ec 0c             	sub    $0xc,%esp
    2ced:	50                   	push   %eax
    2cee:	e8 27 ff ff ff       	call   2c1a <nulterminate>
    2cf3:	83 c4 10             	add    $0x10,%esp
    break;
    2cf6:	eb 19                	jmp    2d11 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2cf8:	8b 45 08             	mov    0x8(%ebp),%eax
    2cfb:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2cfe:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2d01:	8b 40 04             	mov    0x4(%eax),%eax
    2d04:	83 ec 0c             	sub    $0xc,%esp
    2d07:	50                   	push   %eax
    2d08:	e8 0d ff ff ff       	call   2c1a <nulterminate>
    2d0d:	83 c4 10             	add    $0x10,%esp
    break;
    2d10:	90                   	nop
  }
  return cmd;
    2d11:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2d14:	c9                   	leave  
    2d15:	c3                   	ret    

00002d16 <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2d16:	55                   	push   %ebp
    2d17:	89 e5                	mov    %esp,%ebp
    2d19:	83 ec 18             	sub    $0x18,%esp
    2d1c:	8b 45 08             	mov    0x8(%ebp),%eax
    2d1f:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2d22:	83 ec 08             	sub    $0x8,%esp
    2d25:	ff 75 18             	pushl  0x18(%ebp)
    2d28:	ff 75 14             	pushl  0x14(%ebp)
    2d2b:	ff 75 10             	pushl  0x10(%ebp)
    2d2e:	ff 75 0c             	pushl  0xc(%ebp)
    2d31:	6a 01                	push   $0x1
    2d33:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2d36:	50                   	push   %eax
    2d37:	e8 e6 d8 ff ff       	call   622 <colorwrite>
    2d3c:	83 c4 20             	add    $0x20,%esp
}
    2d3f:	90                   	nop
    2d40:	c9                   	leave  
    2d41:	c3                   	ret    

00002d42 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2d42:	55                   	push   %ebp
    2d43:	89 e5                	mov    %esp,%ebp
    2d45:	53                   	push   %ebx
    2d46:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2d49:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2d50:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2d54:	74 17                	je     2d6d <color_printint+0x2b>
    2d56:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2d5a:	79 11                	jns    2d6d <color_printint+0x2b>
    neg = 1;
    2d5c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2d63:	8b 45 08             	mov    0x8(%ebp),%eax
    2d66:	f7 d8                	neg    %eax
    2d68:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2d6b:	eb 06                	jmp    2d73 <color_printint+0x31>
  } else {
    x = xx;
    2d6d:	8b 45 08             	mov    0x8(%ebp),%eax
    2d70:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2d73:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2d7a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2d7d:	8d 41 01             	lea    0x1(%ecx),%eax
    2d80:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2d83:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2d86:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d89:	ba 00 00 00 00       	mov    $0x0,%edx
    2d8e:	f7 f3                	div    %ebx
    2d90:	89 d0                	mov    %edx,%eax
    2d92:	0f b6 80 24 47 00 00 	movzbl 0x4724(%eax),%eax
    2d99:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2d9d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2da0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2da3:	ba 00 00 00 00       	mov    $0x0,%edx
    2da8:	f7 f3                	div    %ebx
    2daa:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2dad:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2db1:	75 c7                	jne    2d7a <color_printint+0x38>
  if(neg)
    2db3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2db7:	74 36                	je     2def <color_printint+0xad>
    buf[i++] = '-';
    2db9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dbc:	8d 50 01             	lea    0x1(%eax),%edx
    2dbf:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2dc2:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2dc7:	eb 26                	jmp    2def <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2dc9:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2dcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dcf:	01 d0                	add    %edx,%eax
    2dd1:	0f b6 00             	movzbl (%eax),%eax
    2dd4:	0f be c0             	movsbl %al,%eax
    2dd7:	83 ec 0c             	sub    $0xc,%esp
    2dda:	ff 75 20             	pushl  0x20(%ebp)
    2ddd:	ff 75 1c             	pushl  0x1c(%ebp)
    2de0:	ff 75 18             	pushl  0x18(%ebp)
    2de3:	ff 75 14             	pushl  0x14(%ebp)
    2de6:	50                   	push   %eax
    2de7:	e8 2a ff ff ff       	call   2d16 <color_putc>
    2dec:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2def:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2df3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2df7:	79 d0                	jns    2dc9 <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2df9:	90                   	nop
    2dfa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2dfd:	c9                   	leave  
    2dfe:	c3                   	ret    

00002dff <getInteger>:

static int getInteger(double num)
{
    2dff:	55                   	push   %ebp
    2e00:	89 e5                	mov    %esp,%ebp
    2e02:	83 ec 18             	sub    $0x18,%esp
    2e05:	8b 45 08             	mov    0x8(%ebp),%eax
    2e08:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2e0b:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e0e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2e11:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2e18:	eb 0e                	jmp    2e28 <getInteger+0x29>
  {
    num -= 1;
    2e1a:	dd 45 e8             	fldl   -0x18(%ebp)
    2e1d:	d9 e8                	fld1   
    2e1f:	de e9                	fsubrp %st,%st(1)
    2e21:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2e24:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2e28:	dd 45 e8             	fldl   -0x18(%ebp)
    2e2b:	d9 e8                	fld1   
    2e2d:	d9 c9                	fxch   %st(1)
    2e2f:	df e9                	fucomip %st(1),%st
    2e31:	dd d8                	fstp   %st(0)
    2e33:	77 e5                	ja     2e1a <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2e35:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2e38:	c9                   	leave  
    2e39:	c3                   	ret    

00002e3a <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2e3a:	55                   	push   %ebp
    2e3b:	89 e5                	mov    %esp,%ebp
    2e3d:	83 ec 28             	sub    $0x28,%esp
    2e40:	8b 45 08             	mov    0x8(%ebp),%eax
    2e43:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2e46:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e49:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2e4c:	d9 ee                	fldz   
    2e4e:	dd 45 e0             	fldl   -0x20(%ebp)
    2e51:	d9 c9                	fxch   %st(1)
    2e53:	df e9                	fucomip %st(1),%st
    2e55:	dd d8                	fstp   %st(0)
    2e57:	76 21                	jbe    2e7a <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2e59:	83 ec 0c             	sub    $0xc,%esp
    2e5c:	ff 75 1c             	pushl  0x1c(%ebp)
    2e5f:	ff 75 18             	pushl  0x18(%ebp)
    2e62:	ff 75 14             	pushl  0x14(%ebp)
    2e65:	ff 75 10             	pushl  0x10(%ebp)
    2e68:	6a 2d                	push   $0x2d
    2e6a:	e8 a7 fe ff ff       	call   2d16 <color_putc>
    2e6f:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2e72:	dd 45 e0             	fldl   -0x20(%ebp)
    2e75:	d9 e0                	fchs   
    2e77:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2e7a:	83 ec 08             	sub    $0x8,%esp
    2e7d:	ff 75 e4             	pushl  -0x1c(%ebp)
    2e80:	ff 75 e0             	pushl  -0x20(%ebp)
    2e83:	e8 77 ff ff ff       	call   2dff <getInteger>
    2e88:	83 c4 10             	add    $0x10,%esp
    2e8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2e8e:	83 ec 04             	sub    $0x4,%esp
    2e91:	ff 75 1c             	pushl  0x1c(%ebp)
    2e94:	ff 75 18             	pushl  0x18(%ebp)
    2e97:	ff 75 14             	pushl  0x14(%ebp)
    2e9a:	ff 75 10             	pushl  0x10(%ebp)
    2e9d:	6a 01                	push   $0x1
    2e9f:	6a 0a                	push   $0xa
    2ea1:	ff 75 f0             	pushl  -0x10(%ebp)
    2ea4:	e8 99 fe ff ff       	call   2d42 <color_printint>
    2ea9:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2eac:	db 45 f0             	fildl  -0x10(%ebp)
    2eaf:	dd 45 e0             	fldl   -0x20(%ebp)
    2eb2:	de e1                	fsubp  %st,%st(1)
    2eb4:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2eb7:	dd 45 e0             	fldl   -0x20(%ebp)
    2eba:	dd 05 00 3c 00 00    	fldl   0x3c00
    2ec0:	d9 c9                	fxch   %st(1)
    2ec2:	df e9                	fucomip %st(1),%st
    2ec4:	dd d8                	fstp   %st(0)
    2ec6:	76 19                	jbe    2ee1 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2ec8:	83 ec 0c             	sub    $0xc,%esp
    2ecb:	ff 75 1c             	pushl  0x1c(%ebp)
    2ece:	ff 75 18             	pushl  0x18(%ebp)
    2ed1:	ff 75 14             	pushl  0x14(%ebp)
    2ed4:	ff 75 10             	pushl  0x10(%ebp)
    2ed7:	6a 2e                	push   $0x2e
    2ed9:	e8 38 fe ff ff       	call   2d16 <color_putc>
    2ede:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2ee1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2ee8:	eb 55                	jmp    2f3f <color_printdbl+0x105>
  {
    num = num*10;
    2eea:	dd 45 e0             	fldl   -0x20(%ebp)
    2eed:	dd 05 08 3c 00 00    	fldl   0x3c08
    2ef3:	de c9                	fmulp  %st,%st(1)
    2ef5:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2ef8:	83 ec 08             	sub    $0x8,%esp
    2efb:	ff 75 e4             	pushl  -0x1c(%ebp)
    2efe:	ff 75 e0             	pushl  -0x20(%ebp)
    2f01:	e8 f9 fe ff ff       	call   2dff <getInteger>
    2f06:	83 c4 10             	add    $0x10,%esp
    2f09:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2f0c:	83 ec 04             	sub    $0x4,%esp
    2f0f:	ff 75 1c             	pushl  0x1c(%ebp)
    2f12:	ff 75 18             	pushl  0x18(%ebp)
    2f15:	ff 75 14             	pushl  0x14(%ebp)
    2f18:	ff 75 10             	pushl  0x10(%ebp)
    2f1b:	6a 01                	push   $0x1
    2f1d:	6a 0a                	push   $0xa
    2f1f:	ff 75 f0             	pushl  -0x10(%ebp)
    2f22:	e8 1b fe ff ff       	call   2d42 <color_printint>
    2f27:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2f2a:	db 45 f0             	fildl  -0x10(%ebp)
    2f2d:	dd 45 e0             	fldl   -0x20(%ebp)
    2f30:	de e1                	fsubp  %st,%st(1)
    2f32:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2f35:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2f39:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2f3d:	7f 13                	jg     2f52 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2f3f:	dd 45 e0             	fldl   -0x20(%ebp)
    2f42:	dd 05 00 3c 00 00    	fldl   0x3c00
    2f48:	d9 c9                	fxch   %st(1)
    2f4a:	df e9                	fucomip %st(1),%st
    2f4c:	dd d8                	fstp   %st(0)
    2f4e:	77 9a                	ja     2eea <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2f50:	eb 01                	jmp    2f53 <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2f52:	90                   	nop
    }
  }
}
    2f53:	90                   	nop
    2f54:	c9                   	leave  
    2f55:	c3                   	ret    

00002f56 <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2f56:	55                   	push   %ebp
    2f57:	89 e5                	mov    %esp,%ebp
    2f59:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2f5c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2f63:	8d 45 18             	lea    0x18(%ebp),%eax
    2f66:	83 c0 04             	add    $0x4,%eax
    2f69:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2f6c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2f73:	e9 e2 01 00 00       	jmp    315a <color_printf+0x204>
    c = fmt[i] & 0xff;
    2f78:	8b 55 18             	mov    0x18(%ebp),%edx
    2f7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f7e:	01 d0                	add    %edx,%eax
    2f80:	0f b6 00             	movzbl (%eax),%eax
    2f83:	0f be c0             	movsbl %al,%eax
    2f86:	25 ff 00 00 00       	and    $0xff,%eax
    2f8b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2f8e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2f92:	75 35                	jne    2fc9 <color_printf+0x73>
      if(c == '%'){
    2f94:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2f98:	75 0c                	jne    2fa6 <color_printf+0x50>
        state = '%';
    2f9a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2fa1:	e9 b0 01 00 00       	jmp    3156 <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2fa6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2fa9:	0f be c0             	movsbl %al,%eax
    2fac:	83 ec 0c             	sub    $0xc,%esp
    2faf:	ff 75 14             	pushl  0x14(%ebp)
    2fb2:	ff 75 10             	pushl  0x10(%ebp)
    2fb5:	ff 75 0c             	pushl  0xc(%ebp)
    2fb8:	ff 75 08             	pushl  0x8(%ebp)
    2fbb:	50                   	push   %eax
    2fbc:	e8 55 fd ff ff       	call   2d16 <color_putc>
    2fc1:	83 c4 20             	add    $0x20,%esp
    2fc4:	e9 8d 01 00 00       	jmp    3156 <color_printf+0x200>
      }
    } else if(state == '%'){
    2fc9:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2fcd:	0f 85 83 01 00 00    	jne    3156 <color_printf+0x200>
      if(c == 'd'){
    2fd3:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2fd7:	75 2a                	jne    3003 <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2fd9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2fdc:	8b 00                	mov    (%eax),%eax
    2fde:	83 ec 04             	sub    $0x4,%esp
    2fe1:	ff 75 14             	pushl  0x14(%ebp)
    2fe4:	ff 75 10             	pushl  0x10(%ebp)
    2fe7:	ff 75 0c             	pushl  0xc(%ebp)
    2fea:	ff 75 08             	pushl  0x8(%ebp)
    2fed:	6a 01                	push   $0x1
    2fef:	6a 0a                	push   $0xa
    2ff1:	50                   	push   %eax
    2ff2:	e8 4b fd ff ff       	call   2d42 <color_printint>
    2ff7:	83 c4 20             	add    $0x20,%esp
        ap++;
    2ffa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2ffe:	e9 4c 01 00 00       	jmp    314f <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    3003:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3007:	74 06                	je     300f <color_printf+0xb9>
    3009:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    300d:	75 2a                	jne    3039 <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    300f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3012:	8b 00                	mov    (%eax),%eax
    3014:	83 ec 04             	sub    $0x4,%esp
    3017:	ff 75 14             	pushl  0x14(%ebp)
    301a:	ff 75 10             	pushl  0x10(%ebp)
    301d:	ff 75 0c             	pushl  0xc(%ebp)
    3020:	ff 75 08             	pushl  0x8(%ebp)
    3023:	6a 00                	push   $0x0
    3025:	6a 10                	push   $0x10
    3027:	50                   	push   %eax
    3028:	e8 15 fd ff ff       	call   2d42 <color_printint>
    302d:	83 c4 20             	add    $0x20,%esp
        ap++;
    3030:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3034:	e9 16 01 00 00       	jmp    314f <color_printf+0x1f9>
      } else if(c == 's'){
    3039:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    303d:	75 4f                	jne    308e <color_printf+0x138>
        s = (char*)*ap;
    303f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3042:	8b 00                	mov    (%eax),%eax
    3044:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    3047:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    304b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    304f:	75 2e                	jne    307f <color_printf+0x129>
          s = "(null)";
    3051:	c7 45 f4 f8 3b 00 00 	movl   $0x3bf8,-0xc(%ebp)
        while(*s != 0){
    3058:	eb 25                	jmp    307f <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    305a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    305d:	0f b6 00             	movzbl (%eax),%eax
    3060:	0f be c0             	movsbl %al,%eax
    3063:	83 ec 0c             	sub    $0xc,%esp
    3066:	ff 75 14             	pushl  0x14(%ebp)
    3069:	ff 75 10             	pushl  0x10(%ebp)
    306c:	ff 75 0c             	pushl  0xc(%ebp)
    306f:	ff 75 08             	pushl  0x8(%ebp)
    3072:	50                   	push   %eax
    3073:	e8 9e fc ff ff       	call   2d16 <color_putc>
    3078:	83 c4 20             	add    $0x20,%esp
          s++;
    307b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    307f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3082:	0f b6 00             	movzbl (%eax),%eax
    3085:	84 c0                	test   %al,%al
    3087:	75 d1                	jne    305a <color_printf+0x104>
    3089:	e9 c1 00 00 00       	jmp    314f <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    308e:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    3092:	75 29                	jne    30bd <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    3094:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3097:	8b 00                	mov    (%eax),%eax
    3099:	0f be c0             	movsbl %al,%eax
    309c:	83 ec 0c             	sub    $0xc,%esp
    309f:	ff 75 14             	pushl  0x14(%ebp)
    30a2:	ff 75 10             	pushl  0x10(%ebp)
    30a5:	ff 75 0c             	pushl  0xc(%ebp)
    30a8:	ff 75 08             	pushl  0x8(%ebp)
    30ab:	50                   	push   %eax
    30ac:	e8 65 fc ff ff       	call   2d16 <color_putc>
    30b1:	83 c4 20             	add    $0x20,%esp
        ap++;
    30b4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    30b8:	e9 92 00 00 00       	jmp    314f <color_printf+0x1f9>
      } else if(c == '%'){
    30bd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    30c1:	75 20                	jne    30e3 <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    30c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    30c6:	0f be c0             	movsbl %al,%eax
    30c9:	83 ec 0c             	sub    $0xc,%esp
    30cc:	ff 75 14             	pushl  0x14(%ebp)
    30cf:	ff 75 10             	pushl  0x10(%ebp)
    30d2:	ff 75 0c             	pushl  0xc(%ebp)
    30d5:	ff 75 08             	pushl  0x8(%ebp)
    30d8:	50                   	push   %eax
    30d9:	e8 38 fc ff ff       	call   2d16 <color_putc>
    30de:	83 c4 20             	add    $0x20,%esp
    30e1:	eb 6c                	jmp    314f <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    30e3:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    30e7:	75 2f                	jne    3118 <color_printf+0x1c2>
        double *dap = (double*)ap;
    30e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    30ec:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    30ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
    30f2:	dd 00                	fldl   (%eax)
    30f4:	83 ec 08             	sub    $0x8,%esp
    30f7:	ff 75 14             	pushl  0x14(%ebp)
    30fa:	ff 75 10             	pushl  0x10(%ebp)
    30fd:	ff 75 0c             	pushl  0xc(%ebp)
    3100:	ff 75 08             	pushl  0x8(%ebp)
    3103:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3107:	dd 1c 24             	fstpl  (%esp)
    310a:	e8 2b fd ff ff       	call   2e3a <color_printdbl>
    310f:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    3112:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    3116:	eb 37                	jmp    314f <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    3118:	83 ec 0c             	sub    $0xc,%esp
    311b:	ff 75 14             	pushl  0x14(%ebp)
    311e:	ff 75 10             	pushl  0x10(%ebp)
    3121:	ff 75 0c             	pushl  0xc(%ebp)
    3124:	ff 75 08             	pushl  0x8(%ebp)
    3127:	6a 25                	push   $0x25
    3129:	e8 e8 fb ff ff       	call   2d16 <color_putc>
    312e:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    3131:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3134:	0f be c0             	movsbl %al,%eax
    3137:	83 ec 0c             	sub    $0xc,%esp
    313a:	ff 75 14             	pushl  0x14(%ebp)
    313d:	ff 75 10             	pushl  0x10(%ebp)
    3140:	ff 75 0c             	pushl  0xc(%ebp)
    3143:	ff 75 08             	pushl  0x8(%ebp)
    3146:	50                   	push   %eax
    3147:	e8 ca fb ff ff       	call   2d16 <color_putc>
    314c:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    314f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3156:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    315a:	8b 55 18             	mov    0x18(%ebp),%edx
    315d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3160:	01 d0                	add    %edx,%eax
    3162:	0f b6 00             	movzbl (%eax),%eax
    3165:	84 c0                	test   %al,%al
    3167:	0f 85 0b fe ff ff    	jne    2f78 <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    316d:	90                   	nop
    316e:	c9                   	leave  
    316f:	c3                   	ret    

00003170 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    3170:	55                   	push   %ebp
    3171:	89 e5                	mov    %esp,%ebp
    3173:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    3176:	83 ec 0c             	sub    $0xc,%esp
    3179:	6a 58                	push   $0x58
    317b:	e8 b0 d9 ff ff       	call   b30 <malloc>
    3180:	83 c4 10             	add    $0x10,%esp
    3183:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3186:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3189:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    318f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3192:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    3199:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    319c:	c9                   	leave  
    319d:	c3                   	ret    

0000319e <pushi>:

void pushi(struct istack *s, int val)
{
    319e:	55                   	push   %ebp
    319f:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    31a1:	8b 45 08             	mov    0x8(%ebp),%eax
    31a4:	8b 00                	mov    (%eax),%eax
    31a6:	83 f8 13             	cmp    $0x13,%eax
    31a9:	7f 2c                	jg     31d7 <pushi+0x39>
    {
        s->size++;
    31ab:	8b 45 08             	mov    0x8(%ebp),%eax
    31ae:	8b 00                	mov    (%eax),%eax
    31b0:	8d 50 01             	lea    0x1(%eax),%edx
    31b3:	8b 45 08             	mov    0x8(%ebp),%eax
    31b6:	89 10                	mov    %edx,(%eax)
        s->top++;
    31b8:	8b 45 08             	mov    0x8(%ebp),%eax
    31bb:	8b 40 54             	mov    0x54(%eax),%eax
    31be:	8d 50 01             	lea    0x1(%eax),%edx
    31c1:	8b 45 08             	mov    0x8(%ebp),%eax
    31c4:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    31c7:	8b 45 08             	mov    0x8(%ebp),%eax
    31ca:	8b 50 54             	mov    0x54(%eax),%edx
    31cd:	8b 45 08             	mov    0x8(%ebp),%eax
    31d0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    31d3:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    31d7:	90                   	nop
    31d8:	5d                   	pop    %ebp
    31d9:	c3                   	ret    

000031da <popi>:

int popi(struct istack *s)
{
    31da:	55                   	push   %ebp
    31db:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    31dd:	8b 45 08             	mov    0x8(%ebp),%eax
    31e0:	8b 00                	mov    (%eax),%eax
    31e2:	85 c0                	test   %eax,%eax
    31e4:	75 07                	jne    31ed <popi+0x13>
    {
        return -1;
    31e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    31eb:	eb 2c                	jmp    3219 <popi+0x3f>
    }
    s->size--;
    31ed:	8b 45 08             	mov    0x8(%ebp),%eax
    31f0:	8b 00                	mov    (%eax),%eax
    31f2:	8d 50 ff             	lea    -0x1(%eax),%edx
    31f5:	8b 45 08             	mov    0x8(%ebp),%eax
    31f8:	89 10                	mov    %edx,(%eax)
    s->top--;
    31fa:	8b 45 08             	mov    0x8(%ebp),%eax
    31fd:	8b 40 54             	mov    0x54(%eax),%eax
    3200:	8d 50 ff             	lea    -0x1(%eax),%edx
    3203:	8b 45 08             	mov    0x8(%ebp),%eax
    3206:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    3209:	8b 45 08             	mov    0x8(%ebp),%eax
    320c:	8b 40 54             	mov    0x54(%eax),%eax
    320f:	8d 50 01             	lea    0x1(%eax),%edx
    3212:	8b 45 08             	mov    0x8(%ebp),%eax
    3215:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3219:	5d                   	pop    %ebp
    321a:	c3                   	ret    

0000321b <topi>:

int topi(struct istack* s)
{
    321b:	55                   	push   %ebp
    321c:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    321e:	8b 45 08             	mov    0x8(%ebp),%eax
    3221:	8b 50 54             	mov    0x54(%eax),%edx
    3224:	8b 45 08             	mov    0x8(%ebp),%eax
    3227:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    322b:	5d                   	pop    %ebp
    322c:	c3                   	ret    

0000322d <cstack>:

//constructor
struct cstack* cstack()
{
    322d:	55                   	push   %ebp
    322e:	89 e5                	mov    %esp,%ebp
    3230:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    3233:	83 ec 0c             	sub    $0xc,%esp
    3236:	6a 1c                	push   $0x1c
    3238:	e8 f3 d8 ff ff       	call   b30 <malloc>
    323d:	83 c4 10             	add    $0x10,%esp
    3240:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3243:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3246:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    324c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    324f:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    3256:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3259:	c9                   	leave  
    325a:	c3                   	ret    

0000325b <pushc>:

void pushc(struct cstack *s, char val)
{
    325b:	55                   	push   %ebp
    325c:	89 e5                	mov    %esp,%ebp
    325e:	83 ec 04             	sub    $0x4,%esp
    3261:	8b 45 0c             	mov    0xc(%ebp),%eax
    3264:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3267:	8b 45 08             	mov    0x8(%ebp),%eax
    326a:	8b 00                	mov    (%eax),%eax
    326c:	83 f8 13             	cmp    $0x13,%eax
    326f:	7f 2d                	jg     329e <pushc+0x43>
    {
        s->size++;
    3271:	8b 45 08             	mov    0x8(%ebp),%eax
    3274:	8b 00                	mov    (%eax),%eax
    3276:	8d 50 01             	lea    0x1(%eax),%edx
    3279:	8b 45 08             	mov    0x8(%ebp),%eax
    327c:	89 10                	mov    %edx,(%eax)
        s->top++;
    327e:	8b 45 08             	mov    0x8(%ebp),%eax
    3281:	8b 40 18             	mov    0x18(%eax),%eax
    3284:	8d 50 01             	lea    0x1(%eax),%edx
    3287:	8b 45 08             	mov    0x8(%ebp),%eax
    328a:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    328d:	8b 45 08             	mov    0x8(%ebp),%eax
    3290:	8b 40 18             	mov    0x18(%eax),%eax
    3293:	8b 55 08             	mov    0x8(%ebp),%edx
    3296:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    329a:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    329e:	90                   	nop
    329f:	c9                   	leave  
    32a0:	c3                   	ret    

000032a1 <popc>:

char popc(struct cstack *s)
{
    32a1:	55                   	push   %ebp
    32a2:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    32a4:	8b 45 08             	mov    0x8(%ebp),%eax
    32a7:	8b 00                	mov    (%eax),%eax
    32a9:	85 c0                	test   %eax,%eax
    32ab:	75 07                	jne    32b4 <popc+0x13>
    {
        return -1;
    32ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    32b2:	eb 2d                	jmp    32e1 <popc+0x40>
    }
    s->size--;
    32b4:	8b 45 08             	mov    0x8(%ebp),%eax
    32b7:	8b 00                	mov    (%eax),%eax
    32b9:	8d 50 ff             	lea    -0x1(%eax),%edx
    32bc:	8b 45 08             	mov    0x8(%ebp),%eax
    32bf:	89 10                	mov    %edx,(%eax)
    s->top--;
    32c1:	8b 45 08             	mov    0x8(%ebp),%eax
    32c4:	8b 40 18             	mov    0x18(%eax),%eax
    32c7:	8d 50 ff             	lea    -0x1(%eax),%edx
    32ca:	8b 45 08             	mov    0x8(%ebp),%eax
    32cd:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    32d0:	8b 45 08             	mov    0x8(%ebp),%eax
    32d3:	8b 40 18             	mov    0x18(%eax),%eax
    32d6:	8d 50 01             	lea    0x1(%eax),%edx
    32d9:	8b 45 08             	mov    0x8(%ebp),%eax
    32dc:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    32e1:	5d                   	pop    %ebp
    32e2:	c3                   	ret    

000032e3 <topc>:

char topc(struct cstack* s)
{
    32e3:	55                   	push   %ebp
    32e4:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    32e6:	8b 45 08             	mov    0x8(%ebp),%eax
    32e9:	8b 40 18             	mov    0x18(%eax),%eax
    32ec:	8b 55 08             	mov    0x8(%ebp),%edx
    32ef:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    32f4:	5d                   	pop    %ebp
    32f5:	c3                   	ret    

000032f6 <dstack>:

//constructor
struct dstack* dstack()
{
    32f6:	55                   	push   %ebp
    32f7:	89 e5                	mov    %esp,%ebp
    32f9:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    32fc:	83 ec 0c             	sub    $0xc,%esp
    32ff:	68 a8 00 00 00       	push   $0xa8
    3304:	e8 27 d8 ff ff       	call   b30 <malloc>
    3309:	83 c4 10             	add    $0x10,%esp
    330c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    330f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3312:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3318:	8b 45 f4             	mov    -0xc(%ebp),%eax
    331b:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    3322:	ff ff ff 
    return stack;
    3325:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3328:	c9                   	leave  
    3329:	c3                   	ret    

0000332a <pushd>:

void pushd(struct dstack *s, double val)
{
    332a:	55                   	push   %ebp
    332b:	89 e5                	mov    %esp,%ebp
    332d:	83 ec 08             	sub    $0x8,%esp
    3330:	8b 45 0c             	mov    0xc(%ebp),%eax
    3333:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3336:	8b 45 10             	mov    0x10(%ebp),%eax
    3339:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    333c:	8b 45 08             	mov    0x8(%ebp),%eax
    333f:	8b 00                	mov    (%eax),%eax
    3341:	83 f8 13             	cmp    $0x13,%eax
    3344:	7f 35                	jg     337b <pushd+0x51>
    {
        s->size++;
    3346:	8b 45 08             	mov    0x8(%ebp),%eax
    3349:	8b 00                	mov    (%eax),%eax
    334b:	8d 50 01             	lea    0x1(%eax),%edx
    334e:	8b 45 08             	mov    0x8(%ebp),%eax
    3351:	89 10                	mov    %edx,(%eax)
        s->top++;
    3353:	8b 45 08             	mov    0x8(%ebp),%eax
    3356:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    335c:	8d 50 01             	lea    0x1(%eax),%edx
    335f:	8b 45 08             	mov    0x8(%ebp),%eax
    3362:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    3368:	8b 45 08             	mov    0x8(%ebp),%eax
    336b:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3371:	8b 45 08             	mov    0x8(%ebp),%eax
    3374:	dd 45 f8             	fldl   -0x8(%ebp)
    3377:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    337b:	90                   	nop
    337c:	c9                   	leave  
    337d:	c3                   	ret    

0000337e <popd>:

double popd(struct dstack *s)
{
    337e:	55                   	push   %ebp
    337f:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3381:	8b 45 08             	mov    0x8(%ebp),%eax
    3384:	8b 00                	mov    (%eax),%eax
    3386:	85 c0                	test   %eax,%eax
    3388:	75 06                	jne    3390 <popd+0x12>
    {
        return -1;
    338a:	d9 e8                	fld1   
    338c:	d9 e0                	fchs   
    338e:	eb 35                	jmp    33c5 <popd+0x47>
    }
    s->size--;
    3390:	8b 45 08             	mov    0x8(%ebp),%eax
    3393:	8b 00                	mov    (%eax),%eax
    3395:	8d 50 ff             	lea    -0x1(%eax),%edx
    3398:	8b 45 08             	mov    0x8(%ebp),%eax
    339b:	89 10                	mov    %edx,(%eax)
    s->top--;
    339d:	8b 45 08             	mov    0x8(%ebp),%eax
    33a0:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    33a6:	8d 50 ff             	lea    -0x1(%eax),%edx
    33a9:	8b 45 08             	mov    0x8(%ebp),%eax
    33ac:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    33b2:	8b 45 08             	mov    0x8(%ebp),%eax
    33b5:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    33bb:	8d 50 01             	lea    0x1(%eax),%edx
    33be:	8b 45 08             	mov    0x8(%ebp),%eax
    33c1:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    33c5:	5d                   	pop    %ebp
    33c6:	c3                   	ret    

000033c7 <topd>:

double topd(struct dstack* s)
{
    33c7:	55                   	push   %ebp
    33c8:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    33ca:	8b 45 08             	mov    0x8(%ebp),%eax
    33cd:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    33d3:	8b 45 08             	mov    0x8(%ebp),%eax
    33d6:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    33da:	5d                   	pop    %ebp
    33db:	c3                   	ret    

000033dc <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    33dc:	55                   	push   %ebp
    33dd:	89 e5                	mov    %esp,%ebp
    33df:	53                   	push   %ebx
    33e0:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    33e6:	83 ec 08             	sub    $0x8,%esp
    33e9:	6a 00                	push   $0x0
    33eb:	68 10 3c 00 00       	push   $0x3c10
    33f0:	e8 cd d1 ff ff       	call   5c2 <open>
    33f5:	83 c4 10             	add    $0x10,%esp
    33f8:	89 45 e8             	mov    %eax,-0x18(%ebp)
    33fb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    33ff:	79 1d                	jns    341e <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    3401:	83 ec 0c             	sub    $0xc,%esp
    3404:	68 1a 3c 00 00       	push   $0x3c1a
    3409:	6a 00                	push   $0x0
    340b:	6a 00                	push   $0x0
    340d:	6a 01                	push   $0x1
    340f:	6a 03                	push   $0x3
    3411:	e8 40 fb ff ff       	call   2f56 <color_printf>
    3416:	83 c4 20             	add    $0x20,%esp
    3419:	e9 6d 02 00 00       	jmp    368b <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    341e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3421:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    3427:	e9 2a 02 00 00       	jmp    3656 <readVariables+0x27a>
  {
    int pos = 0;
    342c:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    3433:	00 00 00 
    while(pos <= n-1)
    3436:	e9 07 02 00 00       	jmp    3642 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    343b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    3442:	eb 24                	jmp    3468 <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    3444:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3447:	8d 50 ff             	lea    -0x1(%eax),%edx
    344a:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    3450:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3453:	01 c8                	add    %ecx,%eax
    3455:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    345c:	ff 
    345d:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    3464:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    3468:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    346e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3471:	01 d0                	add    %edx,%eax
    3473:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    347a:	ff 
    347b:	3c 3d                	cmp    $0x3d,%al
    347d:	75 c5                	jne    3444 <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    347f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3482:	83 e8 01             	sub    $0x1,%eax
    3485:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    348c:	00 
      if(buf[pos] == 'd') //double value
    348d:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3493:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    349a:	ff 
    349b:	3c 64                	cmp    $0x64,%al
    349d:	0f 85 a0 00 00 00    	jne    3543 <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    34a3:	8b 45 0c             	mov    0xc(%ebp),%eax
    34a6:	8b 00                	mov    (%eax),%eax
    34a8:	c1 e0 05             	shl    $0x5,%eax
    34ab:	89 c2                	mov    %eax,%edx
    34ad:	8b 45 08             	mov    0x8(%ebp),%eax
    34b0:	01 d0                	add    %edx,%eax
    34b2:	8d 50 04             	lea    0x4(%eax),%edx
    34b5:	83 ec 08             	sub    $0x8,%esp
    34b8:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    34be:	50                   	push   %eax
    34bf:	52                   	push   %edx
    34c0:	e8 8c ce ff ff       	call   351 <strcpy>
    34c5:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    34c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34cb:	8d 50 01             	lea    0x1(%eax),%edx
    34ce:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    34d4:	01 d0                	add    %edx,%eax
    34d6:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    34dc:	83 ec 08             	sub    $0x8,%esp
    34df:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    34e5:	50                   	push   %eax
    34e6:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    34ec:	50                   	push   %eax
    34ed:	e8 7b d9 ff ff       	call   e6d <Translation>
    34f2:	83 c4 10             	add    $0x10,%esp
    34f5:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    34f8:	8b 45 0c             	mov    0xc(%ebp),%eax
    34fb:	8b 00                	mov    (%eax),%eax
    34fd:	c1 e0 05             	shl    $0x5,%eax
    3500:	89 c2                	mov    %eax,%edx
    3502:	8b 45 08             	mov    0x8(%ebp),%eax
    3505:	01 d0                	add    %edx,%eax
    3507:	dd 45 d8             	fldl   -0x28(%ebp)
    350a:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    350d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3510:	8b 00                	mov    (%eax),%eax
    3512:	c1 e0 05             	shl    $0x5,%eax
    3515:	89 c2                	mov    %eax,%edx
    3517:	8b 45 08             	mov    0x8(%ebp),%eax
    351a:	01 d0                	add    %edx,%eax
    351c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    3522:	8b 45 0c             	mov    0xc(%ebp),%eax
    3525:	8b 00                	mov    (%eax),%eax
    3527:	8d 50 01             	lea    0x1(%eax),%edx
    352a:	8b 45 0c             	mov    0xc(%ebp),%eax
    352d:	89 10                	mov    %edx,(%eax)
        pos++;
    352f:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3535:	83 c0 01             	add    $0x1,%eax
    3538:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    353e:	e9 ff 00 00 00       	jmp    3642 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    3543:	8b 45 0c             	mov    0xc(%ebp),%eax
    3546:	8b 00                	mov    (%eax),%eax
    3548:	c1 e0 05             	shl    $0x5,%eax
    354b:	89 c2                	mov    %eax,%edx
    354d:	8b 45 08             	mov    0x8(%ebp),%eax
    3550:	01 d0                	add    %edx,%eax
    3552:	8d 50 04             	lea    0x4(%eax),%edx
    3555:	83 ec 08             	sub    $0x8,%esp
    3558:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    355e:	50                   	push   %eax
    355f:	52                   	push   %edx
    3560:	e8 ec cd ff ff       	call   351 <strcpy>
    3565:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    3568:	8b 45 f4             	mov    -0xc(%ebp),%eax
    356b:	8d 50 01             	lea    0x1(%eax),%edx
    356e:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3574:	01 d0                	add    %edx,%eax
    3576:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    357c:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3582:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    3585:	eb 04                	jmp    358b <readVariables+0x1af>
        {
          strend++;
    3587:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    358b:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    3591:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3594:	01 d0                	add    %edx,%eax
    3596:	0f b6 00             	movzbl (%eax),%eax
    3599:	84 c0                	test   %al,%al
    359b:	75 ea                	jne    3587 <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    359d:	8b 45 0c             	mov    0xc(%ebp),%eax
    35a0:	8b 00                	mov    (%eax),%eax
    35a2:	c1 e0 05             	shl    $0x5,%eax
    35a5:	89 c2                	mov    %eax,%edx
    35a7:	8b 45 08             	mov    0x8(%ebp),%eax
    35aa:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    35ad:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    35b3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    35b6:	29 c2                	sub    %eax,%edx
    35b8:	89 d0                	mov    %edx,%eax
    35ba:	83 c0 01             	add    $0x1,%eax
    35bd:	83 ec 0c             	sub    $0xc,%esp
    35c0:	50                   	push   %eax
    35c1:	e8 6a d5 ff ff       	call   b30 <malloc>
    35c6:	83 c4 10             	add    $0x10,%esp
    35c9:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    35cc:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    35d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    35d5:	eb 35                	jmp    360c <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    35d7:	8b 45 0c             	mov    0xc(%ebp),%eax
    35da:	8b 00                	mov    (%eax),%eax
    35dc:	c1 e0 05             	shl    $0x5,%eax
    35df:	89 c2                	mov    %eax,%edx
    35e1:	8b 45 08             	mov    0x8(%ebp),%eax
    35e4:	01 d0                	add    %edx,%eax
    35e6:	8b 40 18             	mov    0x18(%eax),%eax
    35e9:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    35ef:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    35f2:	29 d1                	sub    %edx,%ecx
    35f4:	89 ca                	mov    %ecx,%edx
    35f6:	01 c2                	add    %eax,%edx
    35f8:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    35fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3601:	01 c8                	add    %ecx,%eax
    3603:	0f b6 00             	movzbl (%eax),%eax
    3606:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    3608:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    360c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    360f:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3612:	7e c3                	jle    35d7 <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    3614:	8b 45 0c             	mov    0xc(%ebp),%eax
    3617:	8b 00                	mov    (%eax),%eax
    3619:	c1 e0 05             	shl    $0x5,%eax
    361c:	89 c2                	mov    %eax,%edx
    361e:	8b 45 08             	mov    0x8(%ebp),%eax
    3621:	01 d0                	add    %edx,%eax
    3623:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    3629:	8b 45 0c             	mov    0xc(%ebp),%eax
    362c:	8b 00                	mov    (%eax),%eax
    362e:	8d 50 01             	lea    0x1(%eax),%edx
    3631:	8b 45 0c             	mov    0xc(%ebp),%eax
    3634:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    3636:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3639:	83 c0 01             	add    $0x1,%eax
    363c:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    3642:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3645:	8d 50 ff             	lea    -0x1(%eax),%edx
    3648:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    364e:	39 c2                	cmp    %eax,%edx
    3650:	0f 8d e5 fd ff ff    	jge    343b <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    3656:	83 ec 04             	sub    $0x4,%esp
    3659:	68 e8 03 00 00       	push   $0x3e8
    365e:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3664:	50                   	push   %eax
    3665:	ff 75 e8             	pushl  -0x18(%ebp)
    3668:	e8 2d cf ff ff       	call   59a <read>
    366d:	83 c4 10             	add    $0x10,%esp
    3670:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3673:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3677:	0f 8f af fd ff ff    	jg     342c <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    367d:	83 ec 0c             	sub    $0xc,%esp
    3680:	ff 75 e8             	pushl  -0x18(%ebp)
    3683:	e8 22 cf ff ff       	call   5aa <close>
    3688:	83 c4 10             	add    $0x10,%esp
}
    368b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    368e:	c9                   	leave  
    368f:	c3                   	ret    

00003690 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3690:	55                   	push   %ebp
    3691:	89 e5                	mov    %esp,%ebp
    3693:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    3699:	83 ec 08             	sub    $0x8,%esp
    369c:	6a 02                	push   $0x2
    369e:	68 10 3c 00 00       	push   $0x3c10
    36a3:	e8 1a cf ff ff       	call   5c2 <open>
    36a8:	83 c4 10             	add    $0x10,%esp
    36ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    36ae:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    36b2:	78 1e                	js     36d2 <writeVariables+0x42>
  {
    close(fd);
    36b4:	83 ec 0c             	sub    $0xc,%esp
    36b7:	ff 75 e4             	pushl  -0x1c(%ebp)
    36ba:	e8 eb ce ff ff       	call   5aa <close>
    36bf:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    36c2:	83 ec 0c             	sub    $0xc,%esp
    36c5:	68 10 3c 00 00       	push   $0x3c10
    36ca:	e8 03 cf ff ff       	call   5d2 <unlink>
    36cf:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    36d2:	83 ec 08             	sub    $0x8,%esp
    36d5:	68 02 02 00 00       	push   $0x202
    36da:	68 10 3c 00 00       	push   $0x3c10
    36df:	e8 de ce ff ff       	call   5c2 <open>
    36e4:	83 c4 10             	add    $0x10,%esp
    36e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    36ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    36f1:	e9 ff 01 00 00       	jmp    38f5 <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    36f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36f9:	c1 e0 05             	shl    $0x5,%eax
    36fc:	89 c2                	mov    %eax,%edx
    36fe:	8b 45 08             	mov    0x8(%ebp),%eax
    3701:	01 d0                	add    %edx,%eax
    3703:	8b 00                	mov    (%eax),%eax
    3705:	83 f8 01             	cmp    $0x1,%eax
    3708:	0f 85 d3 00 00 00    	jne    37e1 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    370e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    3715:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3718:	8d 50 01             	lea    0x1(%eax),%edx
    371b:	89 55 e0             	mov    %edx,-0x20(%ebp)
    371e:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    3725:	64 
      int k=0;
    3726:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    372d:	eb 2c                	jmp    375b <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    372f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3732:	8d 50 01             	lea    0x1(%eax),%edx
    3735:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3738:	8b 55 f4             	mov    -0xc(%ebp),%edx
    373b:	89 d1                	mov    %edx,%ecx
    373d:	c1 e1 05             	shl    $0x5,%ecx
    3740:	8b 55 08             	mov    0x8(%ebp),%edx
    3743:	01 d1                	add    %edx,%ecx
    3745:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3748:	01 ca                	add    %ecx,%edx
    374a:	83 c2 04             	add    $0x4,%edx
    374d:	0f b6 12             	movzbl (%edx),%edx
    3750:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3757:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    375b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    375e:	c1 e0 05             	shl    $0x5,%eax
    3761:	89 c2                	mov    %eax,%edx
    3763:	8b 45 08             	mov    0x8(%ebp),%eax
    3766:	01 c2                	add    %eax,%edx
    3768:	8b 45 f0             	mov    -0x10(%ebp),%eax
    376b:	01 d0                	add    %edx,%eax
    376d:	83 c0 04             	add    $0x4,%eax
    3770:	0f b6 00             	movzbl (%eax),%eax
    3773:	84 c0                	test   %al,%al
    3775:	75 b8                	jne    372f <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3777:	8b 45 e0             	mov    -0x20(%ebp),%eax
    377a:	8d 50 01             	lea    0x1(%eax),%edx
    377d:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3780:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    3787:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    3788:	8b 45 f4             	mov    -0xc(%ebp),%eax
    378b:	c1 e0 05             	shl    $0x5,%eax
    378e:	89 c2                	mov    %eax,%edx
    3790:	8b 45 08             	mov    0x8(%ebp),%eax
    3793:	01 d0                	add    %edx,%eax
    3795:	dd 40 18             	fldl   0x18(%eax)
    3798:	8d 45 e0             	lea    -0x20(%ebp),%eax
    379b:	50                   	push   %eax
    379c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    37a0:	dd 1c 24             	fstpl  (%esp)
    37a3:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    37a9:	50                   	push   %eax
    37aa:	e8 7d d5 ff ff       	call   d2c <double2str>
    37af:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    37b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    37b5:	8d 50 01             	lea    0x1(%eax),%edx
    37b8:	89 55 e0             	mov    %edx,-0x20(%ebp)
    37bb:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    37c2:	00 
      write(fd,buf,pos);
    37c3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    37c6:	83 ec 04             	sub    $0x4,%esp
    37c9:	50                   	push   %eax
    37ca:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    37d0:	50                   	push   %eax
    37d1:	ff 75 e4             	pushl  -0x1c(%ebp)
    37d4:	e8 c9 cd ff ff       	call   5a2 <write>
    37d9:	83 c4 10             	add    $0x10,%esp
    37dc:	e9 10 01 00 00       	jmp    38f1 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    37e1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    37e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    37eb:	8d 50 01             	lea    0x1(%eax),%edx
    37ee:	89 55 ec             	mov    %edx,-0x14(%ebp)
    37f1:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    37f8:	73 
      int k=0;
    37f9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    3800:	eb 2c                	jmp    382e <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    3802:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3805:	8d 50 01             	lea    0x1(%eax),%edx
    3808:	89 55 ec             	mov    %edx,-0x14(%ebp)
    380b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    380e:	89 d1                	mov    %edx,%ecx
    3810:	c1 e1 05             	shl    $0x5,%ecx
    3813:	8b 55 08             	mov    0x8(%ebp),%edx
    3816:	01 d1                	add    %edx,%ecx
    3818:	8b 55 e8             	mov    -0x18(%ebp),%edx
    381b:	01 ca                	add    %ecx,%edx
    381d:	83 c2 04             	add    $0x4,%edx
    3820:	0f b6 12             	movzbl (%edx),%edx
    3823:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    382a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    382e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3831:	c1 e0 05             	shl    $0x5,%eax
    3834:	89 c2                	mov    %eax,%edx
    3836:	8b 45 08             	mov    0x8(%ebp),%eax
    3839:	01 c2                	add    %eax,%edx
    383b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    383e:	01 d0                	add    %edx,%eax
    3840:	83 c0 04             	add    $0x4,%eax
    3843:	0f b6 00             	movzbl (%eax),%eax
    3846:	84 c0                	test   %al,%al
    3848:	75 b8                	jne    3802 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    384a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    384d:	8d 50 01             	lea    0x1(%eax),%edx
    3850:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3853:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    385a:	3d 
      k=0;
    385b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    3862:	eb 2c                	jmp    3890 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    3864:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3867:	8d 50 01             	lea    0x1(%eax),%edx
    386a:	89 55 ec             	mov    %edx,-0x14(%ebp)
    386d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3870:	89 d1                	mov    %edx,%ecx
    3872:	c1 e1 05             	shl    $0x5,%ecx
    3875:	8b 55 08             	mov    0x8(%ebp),%edx
    3878:	01 ca                	add    %ecx,%edx
    387a:	8b 4a 18             	mov    0x18(%edx),%ecx
    387d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3880:	01 ca                	add    %ecx,%edx
    3882:	0f b6 12             	movzbl (%edx),%edx
    3885:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    388c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    3890:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3893:	c1 e0 05             	shl    $0x5,%eax
    3896:	89 c2                	mov    %eax,%edx
    3898:	8b 45 08             	mov    0x8(%ebp),%eax
    389b:	01 d0                	add    %edx,%eax
    389d:	8b 50 18             	mov    0x18(%eax),%edx
    38a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    38a3:	01 d0                	add    %edx,%eax
    38a5:	0f b6 00             	movzbl (%eax),%eax
    38a8:	84 c0                	test   %al,%al
    38aa:	75 b8                	jne    3864 <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    38ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
    38af:	8d 50 01             	lea    0x1(%eax),%edx
    38b2:	89 55 ec             	mov    %edx,-0x14(%ebp)
    38b5:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    38bc:	00 
      write(fd,buf,pos);
    38bd:	83 ec 04             	sub    $0x4,%esp
    38c0:	ff 75 ec             	pushl  -0x14(%ebp)
    38c3:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    38c9:	50                   	push   %eax
    38ca:	ff 75 e4             	pushl  -0x1c(%ebp)
    38cd:	e8 d0 cc ff ff       	call   5a2 <write>
    38d2:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    38d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38d8:	c1 e0 05             	shl    $0x5,%eax
    38db:	89 c2                	mov    %eax,%edx
    38dd:	8b 45 08             	mov    0x8(%ebp),%eax
    38e0:	01 d0                	add    %edx,%eax
    38e2:	8b 40 18             	mov    0x18(%eax),%eax
    38e5:	83 ec 0c             	sub    $0xc,%esp
    38e8:	50                   	push   %eax
    38e9:	e8 00 d1 ff ff       	call   9ee <free>
    38ee:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    38f1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    38f5:	8b 45 0c             	mov    0xc(%ebp),%eax
    38f8:	8b 00                	mov    (%eax),%eax
    38fa:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    38fd:	0f 8f f3 fd ff ff    	jg     36f6 <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    3903:	8b 45 0c             	mov    0xc(%ebp),%eax
    3906:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    390c:	83 ec 0c             	sub    $0xc,%esp
    390f:	ff 75 e4             	pushl  -0x1c(%ebp)
    3912:	e8 93 cc ff ff       	call   5aa <close>
    3917:	83 c4 10             	add    $0x10,%esp
  return;
    391a:	90                   	nop
    391b:	c9                   	leave  
    391c:	c3                   	ret    
