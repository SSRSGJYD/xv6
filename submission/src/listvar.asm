
_listvar：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "xv_user.h"
#include "xv_color.h"
#include "xv_variable.h"

int main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	81 ec 94 02 00 00    	sub    $0x294,%esp
    struct variable variables[V_MAX];
    int v_num = 0;
      14:	c7 85 70 fd ff ff 00 	movl   $0x0,-0x290(%ebp)
      1b:	00 00 00 
    readVariables(variables,&v_num);
      1e:	83 ec 08             	sub    $0x8,%esp
      21:	8d 85 70 fd ff ff    	lea    -0x290(%ebp),%eax
      27:	50                   	push   %eax
      28:	8d 85 74 fd ff ff    	lea    -0x28c(%ebp),%eax
      2e:	50                   	push   %eax
      2f:	e8 8d 31 00 00       	call   31c1 <readVariables>
      34:	83 c4 10             	add    $0x10,%esp
    for(int i=0; i<v_num; i++)
      37:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      3e:	e9 b9 00 00 00       	jmp    fc <main+0xfc>
    {
        if(variables[i].type == V_DOUBLE)
      43:	8b 45 f4             	mov    -0xc(%ebp),%eax
      46:	c1 e0 05             	shl    $0x5,%eax
      49:	8d 4d f8             	lea    -0x8(%ebp),%ecx
      4c:	01 c8                	add    %ecx,%eax
      4e:	2d 84 02 00 00       	sub    $0x284,%eax
      53:	8b 00                	mov    (%eax),%eax
      55:	83 f8 01             	cmp    $0x1,%eax
      58:	75 43                	jne    9d <main+0x9d>
        {
            color_printf(XV_CYAN,1,XV_BLACK,0,"%s=%f\n",variables[i].name,
      5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
      5d:	c1 e0 05             	shl    $0x5,%eax
      60:	8d 4d f8             	lea    -0x8(%ebp),%ecx
      63:	01 c8                	add    %ecx,%eax
      65:	2d 74 02 00 00       	sub    $0x274,%eax
      6a:	dd 40 08             	fldl   0x8(%eax)
      6d:	8d 85 74 fd ff ff    	lea    -0x28c(%ebp),%eax
      73:	8b 55 f4             	mov    -0xc(%ebp),%edx
      76:	c1 e2 05             	shl    $0x5,%edx
      79:	01 d0                	add    %edx,%eax
      7b:	83 c0 04             	add    $0x4,%eax
      7e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
      82:	dd 1c 24             	fstpl  (%esp)
      85:	50                   	push   %eax
      86:	68 08 37 00 00       	push   $0x3708
      8b:	6a 00                	push   $0x0
      8d:	6a 00                	push   $0x0
      8f:	6a 01                	push   $0x1
      91:	6a 03                	push   $0x3
      93:	e8 a3 2c 00 00       	call   2d3b <color_printf>
      98:	83 c4 20             	add    $0x20,%esp
      9b:	eb 5b                	jmp    f8 <main+0xf8>
                variables[i].value.dvalue);
        }
        else
        {
            color_printf(XV_CYAN,1,XV_BLACK,0,"%s=\"%s\"\n",variables[i].name,
      9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      a0:	c1 e0 05             	shl    $0x5,%eax
      a3:	8d 4d f8             	lea    -0x8(%ebp),%ecx
      a6:	01 c8                	add    %ecx,%eax
      a8:	2d 6c 02 00 00       	sub    $0x26c,%eax
      ad:	8b 00                	mov    (%eax),%eax
      af:	8d 95 74 fd ff ff    	lea    -0x28c(%ebp),%edx
      b5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
      b8:	c1 e1 05             	shl    $0x5,%ecx
      bb:	01 ca                	add    %ecx,%edx
      bd:	83 c2 04             	add    $0x4,%edx
      c0:	83 ec 04             	sub    $0x4,%esp
      c3:	50                   	push   %eax
      c4:	52                   	push   %edx
      c5:	68 0f 37 00 00       	push   $0x370f
      ca:	6a 00                	push   $0x0
      cc:	6a 00                	push   $0x0
      ce:	6a 01                	push   $0x1
      d0:	6a 03                	push   $0x3
      d2:	e8 64 2c 00 00       	call   2d3b <color_printf>
      d7:	83 c4 20             	add    $0x20,%esp
                variables[i].value.str);
            free(variables[i].value.str);
      da:	8b 45 f4             	mov    -0xc(%ebp),%eax
      dd:	c1 e0 05             	shl    $0x5,%eax
      e0:	8d 55 f8             	lea    -0x8(%ebp),%edx
      e3:	01 d0                	add    %edx,%eax
      e5:	2d 6c 02 00 00       	sub    $0x26c,%eax
      ea:	8b 00                	mov    (%eax),%eax
      ec:	83 ec 0c             	sub    $0xc,%esp
      ef:	50                   	push   %eax
      f0:	e8 de 06 00 00       	call   7d3 <free>
      f5:	83 c4 10             	add    $0x10,%esp
int main(void)
{
    struct variable variables[V_MAX];
    int v_num = 0;
    readVariables(variables,&v_num);
    for(int i=0; i<v_num; i++)
      f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      fc:	8b 85 70 fd ff ff    	mov    -0x290(%ebp),%eax
     102:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     105:	0f 8c 38 ff ff ff    	jl     43 <main+0x43>
            color_printf(XV_CYAN,1,XV_BLACK,0,"%s=\"%s\"\n",variables[i].name,
                variables[i].value.str);
            free(variables[i].value.str);
        }
    }
    exit();
     10b:	e8 57 02 00 00       	call   367 <exit>

00000110 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	57                   	push   %edi
     114:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     115:	8b 4d 08             	mov    0x8(%ebp),%ecx
     118:	8b 55 10             	mov    0x10(%ebp),%edx
     11b:	8b 45 0c             	mov    0xc(%ebp),%eax
     11e:	89 cb                	mov    %ecx,%ebx
     120:	89 df                	mov    %ebx,%edi
     122:	89 d1                	mov    %edx,%ecx
     124:	fc                   	cld    
     125:	f3 aa                	rep stos %al,%es:(%edi)
     127:	89 ca                	mov    %ecx,%edx
     129:	89 fb                	mov    %edi,%ebx
     12b:	89 5d 08             	mov    %ebx,0x8(%ebp)
     12e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     131:	90                   	nop
     132:	5b                   	pop    %ebx
     133:	5f                   	pop    %edi
     134:	5d                   	pop    %ebp
     135:	c3                   	ret    

00000136 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     136:	55                   	push   %ebp
     137:	89 e5                	mov    %esp,%ebp
     139:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     13c:	8b 45 08             	mov    0x8(%ebp),%eax
     13f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     142:	90                   	nop
     143:	8b 45 08             	mov    0x8(%ebp),%eax
     146:	8d 50 01             	lea    0x1(%eax),%edx
     149:	89 55 08             	mov    %edx,0x8(%ebp)
     14c:	8b 55 0c             	mov    0xc(%ebp),%edx
     14f:	8d 4a 01             	lea    0x1(%edx),%ecx
     152:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     155:	0f b6 12             	movzbl (%edx),%edx
     158:	88 10                	mov    %dl,(%eax)
     15a:	0f b6 00             	movzbl (%eax),%eax
     15d:	84 c0                	test   %al,%al
     15f:	75 e2                	jne    143 <strcpy+0xd>
    ;
  return os;
     161:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     164:	c9                   	leave  
     165:	c3                   	ret    

00000166 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     166:	55                   	push   %ebp
     167:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     169:	eb 08                	jmp    173 <strcmp+0xd>
    p++, q++;
     16b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     16f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     173:	8b 45 08             	mov    0x8(%ebp),%eax
     176:	0f b6 00             	movzbl (%eax),%eax
     179:	84 c0                	test   %al,%al
     17b:	74 10                	je     18d <strcmp+0x27>
     17d:	8b 45 08             	mov    0x8(%ebp),%eax
     180:	0f b6 10             	movzbl (%eax),%edx
     183:	8b 45 0c             	mov    0xc(%ebp),%eax
     186:	0f b6 00             	movzbl (%eax),%eax
     189:	38 c2                	cmp    %al,%dl
     18b:	74 de                	je     16b <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     18d:	8b 45 08             	mov    0x8(%ebp),%eax
     190:	0f b6 00             	movzbl (%eax),%eax
     193:	0f b6 d0             	movzbl %al,%edx
     196:	8b 45 0c             	mov    0xc(%ebp),%eax
     199:	0f b6 00             	movzbl (%eax),%eax
     19c:	0f b6 c0             	movzbl %al,%eax
     19f:	29 c2                	sub    %eax,%edx
     1a1:	89 d0                	mov    %edx,%eax
}
     1a3:	5d                   	pop    %ebp
     1a4:	c3                   	ret    

000001a5 <strlen>:

uint
strlen(char *s)
{
     1a5:	55                   	push   %ebp
     1a6:	89 e5                	mov    %esp,%ebp
     1a8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     1ab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     1b2:	eb 04                	jmp    1b8 <strlen+0x13>
     1b4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     1b8:	8b 55 fc             	mov    -0x4(%ebp),%edx
     1bb:	8b 45 08             	mov    0x8(%ebp),%eax
     1be:	01 d0                	add    %edx,%eax
     1c0:	0f b6 00             	movzbl (%eax),%eax
     1c3:	84 c0                	test   %al,%al
     1c5:	75 ed                	jne    1b4 <strlen+0xf>
    ;
  return n;
     1c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     1ca:	c9                   	leave  
     1cb:	c3                   	ret    

000001cc <memset>:

void*
memset(void *dst, int c, uint n)
{
     1cc:	55                   	push   %ebp
     1cd:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     1cf:	8b 45 10             	mov    0x10(%ebp),%eax
     1d2:	50                   	push   %eax
     1d3:	ff 75 0c             	pushl  0xc(%ebp)
     1d6:	ff 75 08             	pushl  0x8(%ebp)
     1d9:	e8 32 ff ff ff       	call   110 <stosb>
     1de:	83 c4 0c             	add    $0xc,%esp
  return dst;
     1e1:	8b 45 08             	mov    0x8(%ebp),%eax
}
     1e4:	c9                   	leave  
     1e5:	c3                   	ret    

000001e6 <strchr>:

char*
strchr(const char *s, char c)
{
     1e6:	55                   	push   %ebp
     1e7:	89 e5                	mov    %esp,%ebp
     1e9:	83 ec 04             	sub    $0x4,%esp
     1ec:	8b 45 0c             	mov    0xc(%ebp),%eax
     1ef:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     1f2:	eb 14                	jmp    208 <strchr+0x22>
    if(*s == c)
     1f4:	8b 45 08             	mov    0x8(%ebp),%eax
     1f7:	0f b6 00             	movzbl (%eax),%eax
     1fa:	3a 45 fc             	cmp    -0x4(%ebp),%al
     1fd:	75 05                	jne    204 <strchr+0x1e>
      return (char*)s;
     1ff:	8b 45 08             	mov    0x8(%ebp),%eax
     202:	eb 13                	jmp    217 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     204:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     208:	8b 45 08             	mov    0x8(%ebp),%eax
     20b:	0f b6 00             	movzbl (%eax),%eax
     20e:	84 c0                	test   %al,%al
     210:	75 e2                	jne    1f4 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     212:	b8 00 00 00 00       	mov    $0x0,%eax
}
     217:	c9                   	leave  
     218:	c3                   	ret    

00000219 <gets>:

char*
gets(char *buf, int max)
{
     219:	55                   	push   %ebp
     21a:	89 e5                	mov    %esp,%ebp
     21c:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     21f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     226:	eb 42                	jmp    26a <gets+0x51>
    cc = read(0, &c, 1);
     228:	83 ec 04             	sub    $0x4,%esp
     22b:	6a 01                	push   $0x1
     22d:	8d 45 ef             	lea    -0x11(%ebp),%eax
     230:	50                   	push   %eax
     231:	6a 00                	push   $0x0
     233:	e8 47 01 00 00       	call   37f <read>
     238:	83 c4 10             	add    $0x10,%esp
     23b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     23e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     242:	7e 33                	jle    277 <gets+0x5e>
      break;
    buf[i++] = c;
     244:	8b 45 f4             	mov    -0xc(%ebp),%eax
     247:	8d 50 01             	lea    0x1(%eax),%edx
     24a:	89 55 f4             	mov    %edx,-0xc(%ebp)
     24d:	89 c2                	mov    %eax,%edx
     24f:	8b 45 08             	mov    0x8(%ebp),%eax
     252:	01 c2                	add    %eax,%edx
     254:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     258:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     25a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     25e:	3c 0a                	cmp    $0xa,%al
     260:	74 16                	je     278 <gets+0x5f>
     262:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     266:	3c 0d                	cmp    $0xd,%al
     268:	74 0e                	je     278 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     26a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     26d:	83 c0 01             	add    $0x1,%eax
     270:	3b 45 0c             	cmp    0xc(%ebp),%eax
     273:	7c b3                	jl     228 <gets+0xf>
     275:	eb 01                	jmp    278 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     277:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     278:	8b 55 f4             	mov    -0xc(%ebp),%edx
     27b:	8b 45 08             	mov    0x8(%ebp),%eax
     27e:	01 d0                	add    %edx,%eax
     280:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     283:	8b 45 08             	mov    0x8(%ebp),%eax
}
     286:	c9                   	leave  
     287:	c3                   	ret    

00000288 <stat>:

int
stat(char *n, struct stat *st)
{
     288:	55                   	push   %ebp
     289:	89 e5                	mov    %esp,%ebp
     28b:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     28e:	83 ec 08             	sub    $0x8,%esp
     291:	6a 00                	push   $0x0
     293:	ff 75 08             	pushl  0x8(%ebp)
     296:	e8 0c 01 00 00       	call   3a7 <open>
     29b:	83 c4 10             	add    $0x10,%esp
     29e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     2a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     2a5:	79 07                	jns    2ae <stat+0x26>
    return -1;
     2a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     2ac:	eb 25                	jmp    2d3 <stat+0x4b>
  r = fstat(fd, st);
     2ae:	83 ec 08             	sub    $0x8,%esp
     2b1:	ff 75 0c             	pushl  0xc(%ebp)
     2b4:	ff 75 f4             	pushl  -0xc(%ebp)
     2b7:	e8 03 01 00 00       	call   3bf <fstat>
     2bc:	83 c4 10             	add    $0x10,%esp
     2bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     2c2:	83 ec 0c             	sub    $0xc,%esp
     2c5:	ff 75 f4             	pushl  -0xc(%ebp)
     2c8:	e8 c2 00 00 00       	call   38f <close>
     2cd:	83 c4 10             	add    $0x10,%esp
  return r;
     2d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     2d3:	c9                   	leave  
     2d4:	c3                   	ret    

000002d5 <atoi>:

int
atoi(const char *s)
{
     2d5:	55                   	push   %ebp
     2d6:	89 e5                	mov    %esp,%ebp
     2d8:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     2db:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     2e2:	eb 25                	jmp    309 <atoi+0x34>
    n = n*10 + *s++ - '0';
     2e4:	8b 55 fc             	mov    -0x4(%ebp),%edx
     2e7:	89 d0                	mov    %edx,%eax
     2e9:	c1 e0 02             	shl    $0x2,%eax
     2ec:	01 d0                	add    %edx,%eax
     2ee:	01 c0                	add    %eax,%eax
     2f0:	89 c1                	mov    %eax,%ecx
     2f2:	8b 45 08             	mov    0x8(%ebp),%eax
     2f5:	8d 50 01             	lea    0x1(%eax),%edx
     2f8:	89 55 08             	mov    %edx,0x8(%ebp)
     2fb:	0f b6 00             	movzbl (%eax),%eax
     2fe:	0f be c0             	movsbl %al,%eax
     301:	01 c8                	add    %ecx,%eax
     303:	83 e8 30             	sub    $0x30,%eax
     306:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     309:	8b 45 08             	mov    0x8(%ebp),%eax
     30c:	0f b6 00             	movzbl (%eax),%eax
     30f:	3c 2f                	cmp    $0x2f,%al
     311:	7e 0a                	jle    31d <atoi+0x48>
     313:	8b 45 08             	mov    0x8(%ebp),%eax
     316:	0f b6 00             	movzbl (%eax),%eax
     319:	3c 39                	cmp    $0x39,%al
     31b:	7e c7                	jle    2e4 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     31d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     320:	c9                   	leave  
     321:	c3                   	ret    

00000322 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     322:	55                   	push   %ebp
     323:	89 e5                	mov    %esp,%ebp
     325:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     328:	8b 45 08             	mov    0x8(%ebp),%eax
     32b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     32e:	8b 45 0c             	mov    0xc(%ebp),%eax
     331:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     334:	eb 17                	jmp    34d <memmove+0x2b>
    *dst++ = *src++;
     336:	8b 45 fc             	mov    -0x4(%ebp),%eax
     339:	8d 50 01             	lea    0x1(%eax),%edx
     33c:	89 55 fc             	mov    %edx,-0x4(%ebp)
     33f:	8b 55 f8             	mov    -0x8(%ebp),%edx
     342:	8d 4a 01             	lea    0x1(%edx),%ecx
     345:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     348:	0f b6 12             	movzbl (%edx),%edx
     34b:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     34d:	8b 45 10             	mov    0x10(%ebp),%eax
     350:	8d 50 ff             	lea    -0x1(%eax),%edx
     353:	89 55 10             	mov    %edx,0x10(%ebp)
     356:	85 c0                	test   %eax,%eax
     358:	7f dc                	jg     336 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     35a:	8b 45 08             	mov    0x8(%ebp),%eax
}
     35d:	c9                   	leave  
     35e:	c3                   	ret    

0000035f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     35f:	b8 01 00 00 00       	mov    $0x1,%eax
     364:	cd 40                	int    $0x40
     366:	c3                   	ret    

00000367 <exit>:
SYSCALL(exit)
     367:	b8 02 00 00 00       	mov    $0x2,%eax
     36c:	cd 40                	int    $0x40
     36e:	c3                   	ret    

0000036f <wait>:
SYSCALL(wait)
     36f:	b8 03 00 00 00       	mov    $0x3,%eax
     374:	cd 40                	int    $0x40
     376:	c3                   	ret    

00000377 <pipe>:
SYSCALL(pipe)
     377:	b8 04 00 00 00       	mov    $0x4,%eax
     37c:	cd 40                	int    $0x40
     37e:	c3                   	ret    

0000037f <read>:
SYSCALL(read)
     37f:	b8 05 00 00 00       	mov    $0x5,%eax
     384:	cd 40                	int    $0x40
     386:	c3                   	ret    

00000387 <write>:
SYSCALL(write)
     387:	b8 10 00 00 00       	mov    $0x10,%eax
     38c:	cd 40                	int    $0x40
     38e:	c3                   	ret    

0000038f <close>:
SYSCALL(close)
     38f:	b8 15 00 00 00       	mov    $0x15,%eax
     394:	cd 40                	int    $0x40
     396:	c3                   	ret    

00000397 <kill>:
SYSCALL(kill)
     397:	b8 06 00 00 00       	mov    $0x6,%eax
     39c:	cd 40                	int    $0x40
     39e:	c3                   	ret    

0000039f <exec>:
SYSCALL(exec)
     39f:	b8 07 00 00 00       	mov    $0x7,%eax
     3a4:	cd 40                	int    $0x40
     3a6:	c3                   	ret    

000003a7 <open>:
SYSCALL(open)
     3a7:	b8 0f 00 00 00       	mov    $0xf,%eax
     3ac:	cd 40                	int    $0x40
     3ae:	c3                   	ret    

000003af <mknod>:
SYSCALL(mknod)
     3af:	b8 11 00 00 00       	mov    $0x11,%eax
     3b4:	cd 40                	int    $0x40
     3b6:	c3                   	ret    

000003b7 <unlink>:
SYSCALL(unlink)
     3b7:	b8 12 00 00 00       	mov    $0x12,%eax
     3bc:	cd 40                	int    $0x40
     3be:	c3                   	ret    

000003bf <fstat>:
SYSCALL(fstat)
     3bf:	b8 08 00 00 00       	mov    $0x8,%eax
     3c4:	cd 40                	int    $0x40
     3c6:	c3                   	ret    

000003c7 <link>:
SYSCALL(link)
     3c7:	b8 13 00 00 00       	mov    $0x13,%eax
     3cc:	cd 40                	int    $0x40
     3ce:	c3                   	ret    

000003cf <mkdir>:
SYSCALL(mkdir)
     3cf:	b8 14 00 00 00       	mov    $0x14,%eax
     3d4:	cd 40                	int    $0x40
     3d6:	c3                   	ret    

000003d7 <chdir>:
SYSCALL(chdir)
     3d7:	b8 09 00 00 00       	mov    $0x9,%eax
     3dc:	cd 40                	int    $0x40
     3de:	c3                   	ret    

000003df <dup>:
SYSCALL(dup)
     3df:	b8 0a 00 00 00       	mov    $0xa,%eax
     3e4:	cd 40                	int    $0x40
     3e6:	c3                   	ret    

000003e7 <getpid>:
SYSCALL(getpid)
     3e7:	b8 0b 00 00 00       	mov    $0xb,%eax
     3ec:	cd 40                	int    $0x40
     3ee:	c3                   	ret    

000003ef <sbrk>:
SYSCALL(sbrk)
     3ef:	b8 0c 00 00 00       	mov    $0xc,%eax
     3f4:	cd 40                	int    $0x40
     3f6:	c3                   	ret    

000003f7 <sleep>:
SYSCALL(sleep)
     3f7:	b8 0d 00 00 00       	mov    $0xd,%eax
     3fc:	cd 40                	int    $0x40
     3fe:	c3                   	ret    

000003ff <uptime>:
SYSCALL(uptime)
     3ff:	b8 0e 00 00 00       	mov    $0xe,%eax
     404:	cd 40                	int    $0x40
     406:	c3                   	ret    

00000407 <colorwrite>:

//new here
SYSCALL(colorwrite)
     407:	b8 16 00 00 00       	mov    $0x16,%eax
     40c:	cd 40                	int    $0x40
     40e:	c3                   	ret    

0000040f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     40f:	55                   	push   %ebp
     410:	89 e5                	mov    %esp,%ebp
     412:	83 ec 18             	sub    $0x18,%esp
     415:	8b 45 0c             	mov    0xc(%ebp),%eax
     418:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     41b:	83 ec 04             	sub    $0x4,%esp
     41e:	6a 01                	push   $0x1
     420:	8d 45 f4             	lea    -0xc(%ebp),%eax
     423:	50                   	push   %eax
     424:	ff 75 08             	pushl  0x8(%ebp)
     427:	e8 5b ff ff ff       	call   387 <write>
     42c:	83 c4 10             	add    $0x10,%esp
}
     42f:	90                   	nop
     430:	c9                   	leave  
     431:	c3                   	ret    

00000432 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     432:	55                   	push   %ebp
     433:	89 e5                	mov    %esp,%ebp
     435:	53                   	push   %ebx
     436:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     439:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     440:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     444:	74 17                	je     45d <printint+0x2b>
     446:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     44a:	79 11                	jns    45d <printint+0x2b>
    neg = 1;
     44c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     453:	8b 45 0c             	mov    0xc(%ebp),%eax
     456:	f7 d8                	neg    %eax
     458:	89 45 ec             	mov    %eax,-0x14(%ebp)
     45b:	eb 06                	jmp    463 <printint+0x31>
  } else {
    x = xx;
     45d:	8b 45 0c             	mov    0xc(%ebp),%eax
     460:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     463:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     46a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     46d:	8d 41 01             	lea    0x1(%ecx),%eax
     470:	89 45 f4             	mov    %eax,-0xc(%ebp)
     473:	8b 5d 10             	mov    0x10(%ebp),%ebx
     476:	8b 45 ec             	mov    -0x14(%ebp),%eax
     479:	ba 00 00 00 00       	mov    $0x0,%edx
     47e:	f7 f3                	div    %ebx
     480:	89 d0                	mov    %edx,%eax
     482:	0f b6 80 20 43 00 00 	movzbl 0x4320(%eax),%eax
     489:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     48d:	8b 5d 10             	mov    0x10(%ebp),%ebx
     490:	8b 45 ec             	mov    -0x14(%ebp),%eax
     493:	ba 00 00 00 00       	mov    $0x0,%edx
     498:	f7 f3                	div    %ebx
     49a:	89 45 ec             	mov    %eax,-0x14(%ebp)
     49d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     4a1:	75 c7                	jne    46a <printint+0x38>
  if(neg)
     4a3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     4a7:	74 2d                	je     4d6 <printint+0xa4>
    buf[i++] = '-';
     4a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4ac:	8d 50 01             	lea    0x1(%eax),%edx
     4af:	89 55 f4             	mov    %edx,-0xc(%ebp)
     4b2:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     4b7:	eb 1d                	jmp    4d6 <printint+0xa4>
    putc(fd, buf[i]);
     4b9:	8d 55 dc             	lea    -0x24(%ebp),%edx
     4bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4bf:	01 d0                	add    %edx,%eax
     4c1:	0f b6 00             	movzbl (%eax),%eax
     4c4:	0f be c0             	movsbl %al,%eax
     4c7:	83 ec 08             	sub    $0x8,%esp
     4ca:	50                   	push   %eax
     4cb:	ff 75 08             	pushl  0x8(%ebp)
     4ce:	e8 3c ff ff ff       	call   40f <putc>
     4d3:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     4d6:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     4da:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     4de:	79 d9                	jns    4b9 <printint+0x87>
    putc(fd, buf[i]);
}
     4e0:	90                   	nop
     4e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4e4:	c9                   	leave  
     4e5:	c3                   	ret    

000004e6 <getInteger>:

static int getInteger(double num)
{
     4e6:	55                   	push   %ebp
     4e7:	89 e5                	mov    %esp,%ebp
     4e9:	83 ec 18             	sub    $0x18,%esp
     4ec:	8b 45 08             	mov    0x8(%ebp),%eax
     4ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
     4f2:	8b 45 0c             	mov    0xc(%ebp),%eax
     4f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     4f8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     4ff:	eb 0e                	jmp    50f <getInteger+0x29>
  {
    num -= 1;
     501:	dd 45 e8             	fldl   -0x18(%ebp)
     504:	d9 e8                	fld1   
     506:	de e9                	fsubrp %st,%st(1)
     508:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     50b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     50f:	dd 45 e8             	fldl   -0x18(%ebp)
     512:	d9 e8                	fld1   
     514:	d9 c9                	fxch   %st(1)
     516:	df e9                	fucomip %st(1),%st
     518:	dd d8                	fstp   %st(0)
     51a:	77 e5                	ja     501 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     51c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     51f:	c9                   	leave  
     520:	c3                   	ret    

00000521 <printdbl>:

void printdbl(int fd, double num)
{
     521:	55                   	push   %ebp
     522:	89 e5                	mov    %esp,%ebp
     524:	83 ec 28             	sub    $0x28,%esp
     527:	8b 45 0c             	mov    0xc(%ebp),%eax
     52a:	89 45 e0             	mov    %eax,-0x20(%ebp)
     52d:	8b 45 10             	mov    0x10(%ebp),%eax
     530:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     533:	d9 ee                	fldz   
     535:	dd 45 e0             	fldl   -0x20(%ebp)
     538:	d9 c9                	fxch   %st(1)
     53a:	df e9                	fucomip %st(1),%st
     53c:	dd d8                	fstp   %st(0)
     53e:	76 18                	jbe    558 <printdbl+0x37>
  {
    putc(fd,'-');
     540:	83 ec 08             	sub    $0x8,%esp
     543:	6a 2d                	push   $0x2d
     545:	ff 75 08             	pushl  0x8(%ebp)
     548:	e8 c2 fe ff ff       	call   40f <putc>
     54d:	83 c4 10             	add    $0x10,%esp
    num = -num;
     550:	dd 45 e0             	fldl   -0x20(%ebp)
     553:	d9 e0                	fchs   
     555:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     558:	83 ec 08             	sub    $0x8,%esp
     55b:	ff 75 e4             	pushl  -0x1c(%ebp)
     55e:	ff 75 e0             	pushl  -0x20(%ebp)
     561:	e8 80 ff ff ff       	call   4e6 <getInteger>
     566:	83 c4 10             	add    $0x10,%esp
     569:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     56c:	6a 01                	push   $0x1
     56e:	6a 0a                	push   $0xa
     570:	ff 75 f0             	pushl  -0x10(%ebp)
     573:	ff 75 08             	pushl  0x8(%ebp)
     576:	e8 b7 fe ff ff       	call   432 <printint>
     57b:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     57e:	db 45 f0             	fildl  -0x10(%ebp)
     581:	dd 45 e0             	fldl   -0x20(%ebp)
     584:	de e1                	fsubp  %st,%st(1)
     586:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     589:	dd 45 e0             	fldl   -0x20(%ebp)
     58c:	dd 05 20 37 00 00    	fldl   0x3720
     592:	d9 c9                	fxch   %st(1)
     594:	df e9                	fucomip %st(1),%st
     596:	dd d8                	fstp   %st(0)
     598:	76 10                	jbe    5aa <printdbl+0x89>
    putc(fd,'.');
     59a:	83 ec 08             	sub    $0x8,%esp
     59d:	6a 2e                	push   $0x2e
     59f:	ff 75 08             	pushl  0x8(%ebp)
     5a2:	e8 68 fe ff ff       	call   40f <putc>
     5a7:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     5aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     5b1:	eb 49                	jmp    5fc <printdbl+0xdb>
  {
    num = num*10;
     5b3:	dd 45 e0             	fldl   -0x20(%ebp)
     5b6:	dd 05 28 37 00 00    	fldl   0x3728
     5bc:	de c9                	fmulp  %st,%st(1)
     5be:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     5c1:	83 ec 08             	sub    $0x8,%esp
     5c4:	ff 75 e4             	pushl  -0x1c(%ebp)
     5c7:	ff 75 e0             	pushl  -0x20(%ebp)
     5ca:	e8 17 ff ff ff       	call   4e6 <getInteger>
     5cf:	83 c4 10             	add    $0x10,%esp
     5d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     5d5:	6a 01                	push   $0x1
     5d7:	6a 0a                	push   $0xa
     5d9:	ff 75 f0             	pushl  -0x10(%ebp)
     5dc:	ff 75 08             	pushl  0x8(%ebp)
     5df:	e8 4e fe ff ff       	call   432 <printint>
     5e4:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     5e7:	db 45 f0             	fildl  -0x10(%ebp)
     5ea:	dd 45 e0             	fldl   -0x20(%ebp)
     5ed:	de e1                	fsubp  %st,%st(1)
     5ef:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     5f2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     5f6:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     5fa:	7f 13                	jg     60f <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     5fc:	dd 45 e0             	fldl   -0x20(%ebp)
     5ff:	dd 05 20 37 00 00    	fldl   0x3720
     605:	d9 c9                	fxch   %st(1)
     607:	df e9                	fucomip %st(1),%st
     609:	dd d8                	fstp   %st(0)
     60b:	77 a6                	ja     5b3 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     60d:	eb 01                	jmp    610 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     60f:	90                   	nop
    }
  }
}
     610:	90                   	nop
     611:	c9                   	leave  
     612:	c3                   	ret    

00000613 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     613:	55                   	push   %ebp
     614:	89 e5                	mov    %esp,%ebp
     616:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     619:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     620:	8d 45 0c             	lea    0xc(%ebp),%eax
     623:	83 c0 04             	add    $0x4,%eax
     626:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     629:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     630:	e9 88 01 00 00       	jmp    7bd <printf+0x1aa>
    c = fmt[i] & 0xff;
     635:	8b 55 0c             	mov    0xc(%ebp),%edx
     638:	8b 45 f0             	mov    -0x10(%ebp),%eax
     63b:	01 d0                	add    %edx,%eax
     63d:	0f b6 00             	movzbl (%eax),%eax
     640:	0f be c0             	movsbl %al,%eax
     643:	25 ff 00 00 00       	and    $0xff,%eax
     648:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     64b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     64f:	75 2c                	jne    67d <printf+0x6a>
      if(c == '%'){
     651:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     655:	75 0c                	jne    663 <printf+0x50>
        state = '%';
     657:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     65e:	e9 56 01 00 00       	jmp    7b9 <printf+0x1a6>
      } else {
        putc(fd, c);
     663:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     666:	0f be c0             	movsbl %al,%eax
     669:	83 ec 08             	sub    $0x8,%esp
     66c:	50                   	push   %eax
     66d:	ff 75 08             	pushl  0x8(%ebp)
     670:	e8 9a fd ff ff       	call   40f <putc>
     675:	83 c4 10             	add    $0x10,%esp
     678:	e9 3c 01 00 00       	jmp    7b9 <printf+0x1a6>
      }
    } else if(state == '%'){
     67d:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     681:	0f 85 32 01 00 00    	jne    7b9 <printf+0x1a6>
      if(c == 'd'){
     687:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     68b:	75 1e                	jne    6ab <printf+0x98>
        printint(fd, *ap, 10, 1);
     68d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     690:	8b 00                	mov    (%eax),%eax
     692:	6a 01                	push   $0x1
     694:	6a 0a                	push   $0xa
     696:	50                   	push   %eax
     697:	ff 75 08             	pushl  0x8(%ebp)
     69a:	e8 93 fd ff ff       	call   432 <printint>
     69f:	83 c4 10             	add    $0x10,%esp
        ap++;
     6a2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     6a6:	e9 07 01 00 00       	jmp    7b2 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     6ab:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     6af:	74 06                	je     6b7 <printf+0xa4>
     6b1:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     6b5:	75 1e                	jne    6d5 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     6b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6ba:	8b 00                	mov    (%eax),%eax
     6bc:	6a 00                	push   $0x0
     6be:	6a 10                	push   $0x10
     6c0:	50                   	push   %eax
     6c1:	ff 75 08             	pushl  0x8(%ebp)
     6c4:	e8 69 fd ff ff       	call   432 <printint>
     6c9:	83 c4 10             	add    $0x10,%esp
        ap++;
     6cc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     6d0:	e9 dd 00 00 00       	jmp    7b2 <printf+0x19f>
      } else if(c == 's'){
     6d5:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     6d9:	75 46                	jne    721 <printf+0x10e>
        s = (char*)*ap;
     6db:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6de:	8b 00                	mov    (%eax),%eax
     6e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     6e3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     6e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     6eb:	75 25                	jne    712 <printf+0xff>
          s = "(null)";
     6ed:	c7 45 f4 18 37 00 00 	movl   $0x3718,-0xc(%ebp)
        while(*s != 0){
     6f4:	eb 1c                	jmp    712 <printf+0xff>
          putc(fd, *s);
     6f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6f9:	0f b6 00             	movzbl (%eax),%eax
     6fc:	0f be c0             	movsbl %al,%eax
     6ff:	83 ec 08             	sub    $0x8,%esp
     702:	50                   	push   %eax
     703:	ff 75 08             	pushl  0x8(%ebp)
     706:	e8 04 fd ff ff       	call   40f <putc>
     70b:	83 c4 10             	add    $0x10,%esp
          s++;
     70e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     712:	8b 45 f4             	mov    -0xc(%ebp),%eax
     715:	0f b6 00             	movzbl (%eax),%eax
     718:	84 c0                	test   %al,%al
     71a:	75 da                	jne    6f6 <printf+0xe3>
     71c:	e9 91 00 00 00       	jmp    7b2 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     721:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     725:	75 1d                	jne    744 <printf+0x131>
        putc(fd, *ap);
     727:	8b 45 e8             	mov    -0x18(%ebp),%eax
     72a:	8b 00                	mov    (%eax),%eax
     72c:	0f be c0             	movsbl %al,%eax
     72f:	83 ec 08             	sub    $0x8,%esp
     732:	50                   	push   %eax
     733:	ff 75 08             	pushl  0x8(%ebp)
     736:	e8 d4 fc ff ff       	call   40f <putc>
     73b:	83 c4 10             	add    $0x10,%esp
        ap++;
     73e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     742:	eb 6e                	jmp    7b2 <printf+0x19f>
      } else if(c == '%'){
     744:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     748:	75 17                	jne    761 <printf+0x14e>
        putc(fd, c);
     74a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     74d:	0f be c0             	movsbl %al,%eax
     750:	83 ec 08             	sub    $0x8,%esp
     753:	50                   	push   %eax
     754:	ff 75 08             	pushl  0x8(%ebp)
     757:	e8 b3 fc ff ff       	call   40f <putc>
     75c:	83 c4 10             	add    $0x10,%esp
     75f:	eb 51                	jmp    7b2 <printf+0x19f>
      } else if(c == 'f'){ //for double
     761:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     765:	75 26                	jne    78d <printf+0x17a>
        double *dap = (double*)ap;
     767:	8b 45 e8             	mov    -0x18(%ebp),%eax
     76a:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     76d:	8b 45 e0             	mov    -0x20(%ebp),%eax
     770:	dd 00                	fldl   (%eax)
     772:	83 ec 04             	sub    $0x4,%esp
     775:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     779:	dd 1c 24             	fstpl  (%esp)
     77c:	ff 75 08             	pushl  0x8(%ebp)
     77f:	e8 9d fd ff ff       	call   521 <printdbl>
     784:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     787:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     78b:	eb 25                	jmp    7b2 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     78d:	83 ec 08             	sub    $0x8,%esp
     790:	6a 25                	push   $0x25
     792:	ff 75 08             	pushl  0x8(%ebp)
     795:	e8 75 fc ff ff       	call   40f <putc>
     79a:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     79d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7a0:	0f be c0             	movsbl %al,%eax
     7a3:	83 ec 08             	sub    $0x8,%esp
     7a6:	50                   	push   %eax
     7a7:	ff 75 08             	pushl  0x8(%ebp)
     7aa:	e8 60 fc ff ff       	call   40f <putc>
     7af:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     7b2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     7b9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     7bd:	8b 55 0c             	mov    0xc(%ebp),%edx
     7c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7c3:	01 d0                	add    %edx,%eax
     7c5:	0f b6 00             	movzbl (%eax),%eax
     7c8:	84 c0                	test   %al,%al
     7ca:	0f 85 65 fe ff ff    	jne    635 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     7d0:	90                   	nop
     7d1:	c9                   	leave  
     7d2:	c3                   	ret    

000007d3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     7d3:	55                   	push   %ebp
     7d4:	89 e5                	mov    %esp,%ebp
     7d6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     7d9:	8b 45 08             	mov    0x8(%ebp),%eax
     7dc:	83 e8 08             	sub    $0x8,%eax
     7df:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     7e2:	a1 68 44 00 00       	mov    0x4468,%eax
     7e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
     7ea:	eb 24                	jmp    810 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     7ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
     7ef:	8b 00                	mov    (%eax),%eax
     7f1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     7f4:	77 12                	ja     808 <free+0x35>
     7f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
     7f9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     7fc:	77 24                	ja     822 <free+0x4f>
     7fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
     801:	8b 00                	mov    (%eax),%eax
     803:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     806:	77 1a                	ja     822 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     808:	8b 45 fc             	mov    -0x4(%ebp),%eax
     80b:	8b 00                	mov    (%eax),%eax
     80d:	89 45 fc             	mov    %eax,-0x4(%ebp)
     810:	8b 45 f8             	mov    -0x8(%ebp),%eax
     813:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     816:	76 d4                	jbe    7ec <free+0x19>
     818:	8b 45 fc             	mov    -0x4(%ebp),%eax
     81b:	8b 00                	mov    (%eax),%eax
     81d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     820:	76 ca                	jbe    7ec <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     822:	8b 45 f8             	mov    -0x8(%ebp),%eax
     825:	8b 40 04             	mov    0x4(%eax),%eax
     828:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     82f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     832:	01 c2                	add    %eax,%edx
     834:	8b 45 fc             	mov    -0x4(%ebp),%eax
     837:	8b 00                	mov    (%eax),%eax
     839:	39 c2                	cmp    %eax,%edx
     83b:	75 24                	jne    861 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     83d:	8b 45 f8             	mov    -0x8(%ebp),%eax
     840:	8b 50 04             	mov    0x4(%eax),%edx
     843:	8b 45 fc             	mov    -0x4(%ebp),%eax
     846:	8b 00                	mov    (%eax),%eax
     848:	8b 40 04             	mov    0x4(%eax),%eax
     84b:	01 c2                	add    %eax,%edx
     84d:	8b 45 f8             	mov    -0x8(%ebp),%eax
     850:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     853:	8b 45 fc             	mov    -0x4(%ebp),%eax
     856:	8b 00                	mov    (%eax),%eax
     858:	8b 10                	mov    (%eax),%edx
     85a:	8b 45 f8             	mov    -0x8(%ebp),%eax
     85d:	89 10                	mov    %edx,(%eax)
     85f:	eb 0a                	jmp    86b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     861:	8b 45 fc             	mov    -0x4(%ebp),%eax
     864:	8b 10                	mov    (%eax),%edx
     866:	8b 45 f8             	mov    -0x8(%ebp),%eax
     869:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     86b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     86e:	8b 40 04             	mov    0x4(%eax),%eax
     871:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     878:	8b 45 fc             	mov    -0x4(%ebp),%eax
     87b:	01 d0                	add    %edx,%eax
     87d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     880:	75 20                	jne    8a2 <free+0xcf>
    p->s.size += bp->s.size;
     882:	8b 45 fc             	mov    -0x4(%ebp),%eax
     885:	8b 50 04             	mov    0x4(%eax),%edx
     888:	8b 45 f8             	mov    -0x8(%ebp),%eax
     88b:	8b 40 04             	mov    0x4(%eax),%eax
     88e:	01 c2                	add    %eax,%edx
     890:	8b 45 fc             	mov    -0x4(%ebp),%eax
     893:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     896:	8b 45 f8             	mov    -0x8(%ebp),%eax
     899:	8b 10                	mov    (%eax),%edx
     89b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     89e:	89 10                	mov    %edx,(%eax)
     8a0:	eb 08                	jmp    8aa <free+0xd7>
  } else
    p->s.ptr = bp;
     8a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8a5:	8b 55 f8             	mov    -0x8(%ebp),%edx
     8a8:	89 10                	mov    %edx,(%eax)
  freep = p;
     8aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8ad:	a3 68 44 00 00       	mov    %eax,0x4468
}
     8b2:	90                   	nop
     8b3:	c9                   	leave  
     8b4:	c3                   	ret    

000008b5 <morecore>:

static Header*
morecore(uint nu)
{
     8b5:	55                   	push   %ebp
     8b6:	89 e5                	mov    %esp,%ebp
     8b8:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     8bb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     8c2:	77 07                	ja     8cb <morecore+0x16>
    nu = 4096;
     8c4:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     8cb:	8b 45 08             	mov    0x8(%ebp),%eax
     8ce:	c1 e0 03             	shl    $0x3,%eax
     8d1:	83 ec 0c             	sub    $0xc,%esp
     8d4:	50                   	push   %eax
     8d5:	e8 15 fb ff ff       	call   3ef <sbrk>
     8da:	83 c4 10             	add    $0x10,%esp
     8dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     8e0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     8e4:	75 07                	jne    8ed <morecore+0x38>
    return 0;
     8e6:	b8 00 00 00 00       	mov    $0x0,%eax
     8eb:	eb 26                	jmp    913 <morecore+0x5e>
  hp = (Header*)p;
     8ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     8f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8f6:	8b 55 08             	mov    0x8(%ebp),%edx
     8f9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     8fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8ff:	83 c0 08             	add    $0x8,%eax
     902:	83 ec 0c             	sub    $0xc,%esp
     905:	50                   	push   %eax
     906:	e8 c8 fe ff ff       	call   7d3 <free>
     90b:	83 c4 10             	add    $0x10,%esp
  return freep;
     90e:	a1 68 44 00 00       	mov    0x4468,%eax
}
     913:	c9                   	leave  
     914:	c3                   	ret    

00000915 <malloc>:

void*
malloc(uint nbytes)
{
     915:	55                   	push   %ebp
     916:	89 e5                	mov    %esp,%ebp
     918:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     91b:	8b 45 08             	mov    0x8(%ebp),%eax
     91e:	83 c0 07             	add    $0x7,%eax
     921:	c1 e8 03             	shr    $0x3,%eax
     924:	83 c0 01             	add    $0x1,%eax
     927:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     92a:	a1 68 44 00 00       	mov    0x4468,%eax
     92f:	89 45 f0             	mov    %eax,-0x10(%ebp)
     932:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     936:	75 23                	jne    95b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     938:	c7 45 f0 60 44 00 00 	movl   $0x4460,-0x10(%ebp)
     93f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     942:	a3 68 44 00 00       	mov    %eax,0x4468
     947:	a1 68 44 00 00       	mov    0x4468,%eax
     94c:	a3 60 44 00 00       	mov    %eax,0x4460
    base.s.size = 0;
     951:	c7 05 64 44 00 00 00 	movl   $0x0,0x4464
     958:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     95b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     95e:	8b 00                	mov    (%eax),%eax
     960:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     963:	8b 45 f4             	mov    -0xc(%ebp),%eax
     966:	8b 40 04             	mov    0x4(%eax),%eax
     969:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     96c:	72 4d                	jb     9bb <malloc+0xa6>
      if(p->s.size == nunits)
     96e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     971:	8b 40 04             	mov    0x4(%eax),%eax
     974:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     977:	75 0c                	jne    985 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     979:	8b 45 f4             	mov    -0xc(%ebp),%eax
     97c:	8b 10                	mov    (%eax),%edx
     97e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     981:	89 10                	mov    %edx,(%eax)
     983:	eb 26                	jmp    9ab <malloc+0x96>
      else {
        p->s.size -= nunits;
     985:	8b 45 f4             	mov    -0xc(%ebp),%eax
     988:	8b 40 04             	mov    0x4(%eax),%eax
     98b:	2b 45 ec             	sub    -0x14(%ebp),%eax
     98e:	89 c2                	mov    %eax,%edx
     990:	8b 45 f4             	mov    -0xc(%ebp),%eax
     993:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     996:	8b 45 f4             	mov    -0xc(%ebp),%eax
     999:	8b 40 04             	mov    0x4(%eax),%eax
     99c:	c1 e0 03             	shl    $0x3,%eax
     99f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     9a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9a5:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9a8:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     9ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9ae:	a3 68 44 00 00       	mov    %eax,0x4468
      return (void*)(p + 1);
     9b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9b6:	83 c0 08             	add    $0x8,%eax
     9b9:	eb 3b                	jmp    9f6 <malloc+0xe1>
    }
    if(p == freep)
     9bb:	a1 68 44 00 00       	mov    0x4468,%eax
     9c0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     9c3:	75 1e                	jne    9e3 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     9c5:	83 ec 0c             	sub    $0xc,%esp
     9c8:	ff 75 ec             	pushl  -0x14(%ebp)
     9cb:	e8 e5 fe ff ff       	call   8b5 <morecore>
     9d0:	83 c4 10             	add    $0x10,%esp
     9d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
     9d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     9da:	75 07                	jne    9e3 <malloc+0xce>
        return 0;
     9dc:	b8 00 00 00 00       	mov    $0x0,%eax
     9e1:	eb 13                	jmp    9f6 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     9e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
     9e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9ec:	8b 00                	mov    (%eax),%eax
     9ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     9f1:	e9 6d ff ff ff       	jmp    963 <malloc+0x4e>
}
     9f6:	c9                   	leave  
     9f7:	c3                   	ret    

000009f8 <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     9f8:	55                   	push   %ebp
     9f9:	89 e5                	mov    %esp,%ebp
     9fb:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     9fe:	83 ec 04             	sub    $0x4,%esp
     a01:	ff 75 08             	pushl  0x8(%ebp)
     a04:	68 30 37 00 00       	push   $0x3730
     a09:	6a 02                	push   $0x2
     a0b:	e8 03 fc ff ff       	call   613 <printf>
     a10:	83 c4 10             	add    $0x10,%esp
  exit();
     a13:	e8 4f f9 ff ff       	call   367 <exit>

00000a18 <getInteger>:
}

static int getInteger(double num)
{
     a18:	55                   	push   %ebp
     a19:	89 e5                	mov    %esp,%ebp
     a1b:	83 ec 18             	sub    $0x18,%esp
     a1e:	8b 45 08             	mov    0x8(%ebp),%eax
     a21:	89 45 e8             	mov    %eax,-0x18(%ebp)
     a24:	8b 45 0c             	mov    0xc(%ebp),%eax
     a27:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     a2a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     a31:	eb 0e                	jmp    a41 <getInteger+0x29>
  {
    num -= 1;
     a33:	dd 45 e8             	fldl   -0x18(%ebp)
     a36:	d9 e8                	fld1   
     a38:	de e9                	fsubrp %st,%st(1)
     a3a:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     a3d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     a41:	dd 45 e8             	fldl   -0x18(%ebp)
     a44:	d9 e8                	fld1   
     a46:	d9 c9                	fxch   %st(1)
     a48:	df e9                	fucomip %st(1),%st
     a4a:	dd d8                	fstp   %st(0)
     a4c:	77 e5                	ja     a33 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     a4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     a51:	c9                   	leave  
     a52:	c3                   	ret    

00000a53 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     a53:	55                   	push   %ebp
     a54:	89 e5                	mov    %esp,%ebp
     a56:	53                   	push   %ebx
     a57:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     a5a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     a61:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     a65:	74 17                	je     a7e <int2str+0x2b>
     a67:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     a6b:	79 11                	jns    a7e <int2str+0x2b>
    neg = 1;
     a6d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     a74:	8b 45 0c             	mov    0xc(%ebp),%eax
     a77:	f7 d8                	neg    %eax
     a79:	89 45 f0             	mov    %eax,-0x10(%ebp)
     a7c:	eb 06                	jmp    a84 <int2str+0x31>
  } else {
    x = num;
     a7e:	8b 45 0c             	mov    0xc(%ebp),%eax
     a81:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     a84:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     a8b:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     a8e:	8d 41 01             	lea    0x1(%ecx),%eax
     a91:	89 45 f8             	mov    %eax,-0x8(%ebp)
     a94:	8b 5d 14             	mov    0x14(%ebp),%ebx
     a97:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a9a:	ba 00 00 00 00       	mov    $0x0,%edx
     a9f:	f7 f3                	div    %ebx
     aa1:	89 d0                	mov    %edx,%eax
     aa3:	0f b6 80 34 43 00 00 	movzbl 0x4334(%eax),%eax
     aaa:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     aae:	8b 5d 14             	mov    0x14(%ebp),%ebx
     ab1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ab4:	ba 00 00 00 00       	mov    $0x0,%edx
     ab9:	f7 f3                	div    %ebx
     abb:	89 45 f0             	mov    %eax,-0x10(%ebp)
     abe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     ac2:	75 c7                	jne    a8b <int2str+0x38>
  if(neg)
     ac4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ac8:	74 36                	je     b00 <int2str+0xad>
    buf[i++] = '-';
     aca:	8b 45 f8             	mov    -0x8(%ebp),%eax
     acd:	8d 50 01             	lea    0x1(%eax),%edx
     ad0:	89 55 f8             	mov    %edx,-0x8(%ebp)
     ad3:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     ad8:	eb 26                	jmp    b00 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     ada:	8b 45 10             	mov    0x10(%ebp),%eax
     add:	8b 00                	mov    (%eax),%eax
     adf:	89 c2                	mov    %eax,%edx
     ae1:	8b 45 08             	mov    0x8(%ebp),%eax
     ae4:	01 c2                	add    %eax,%edx
     ae6:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     ae9:	8b 45 f8             	mov    -0x8(%ebp),%eax
     aec:	01 c8                	add    %ecx,%eax
     aee:	0f b6 00             	movzbl (%eax),%eax
     af1:	88 02                	mov    %al,(%edx)
    (*pos)++;
     af3:	8b 45 10             	mov    0x10(%ebp),%eax
     af6:	8b 00                	mov    (%eax),%eax
     af8:	8d 50 01             	lea    0x1(%eax),%edx
     afb:	8b 45 10             	mov    0x10(%ebp),%eax
     afe:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     b00:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     b04:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     b08:	79 d0                	jns    ada <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     b0a:	90                   	nop
     b0b:	83 c4 20             	add    $0x20,%esp
     b0e:	5b                   	pop    %ebx
     b0f:	5d                   	pop    %ebp
     b10:	c3                   	ret    

00000b11 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     b11:	55                   	push   %ebp
     b12:	89 e5                	mov    %esp,%ebp
     b14:	83 ec 18             	sub    $0x18,%esp
     b17:	8b 45 0c             	mov    0xc(%ebp),%eax
     b1a:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b1d:	8b 45 10             	mov    0x10(%ebp),%eax
     b20:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     b23:	d9 ee                	fldz   
     b25:	dd 45 e8             	fldl   -0x18(%ebp)
     b28:	d9 c9                	fxch   %st(1)
     b2a:	df e9                	fucomip %st(1),%st
     b2c:	dd d8                	fstp   %st(0)
     b2e:	76 24                	jbe    b54 <double2str+0x43>
  {
    buf[*pos] = '-';
     b30:	8b 45 14             	mov    0x14(%ebp),%eax
     b33:	8b 00                	mov    (%eax),%eax
     b35:	89 c2                	mov    %eax,%edx
     b37:	8b 45 08             	mov    0x8(%ebp),%eax
     b3a:	01 d0                	add    %edx,%eax
     b3c:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     b3f:	8b 45 14             	mov    0x14(%ebp),%eax
     b42:	8b 00                	mov    (%eax),%eax
     b44:	8d 50 01             	lea    0x1(%eax),%edx
     b47:	8b 45 14             	mov    0x14(%ebp),%eax
     b4a:	89 10                	mov    %edx,(%eax)
    num = -num;
     b4c:	dd 45 e8             	fldl   -0x18(%ebp)
     b4f:	d9 e0                	fchs   
     b51:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     b54:	ff 75 ec             	pushl  -0x14(%ebp)
     b57:	ff 75 e8             	pushl  -0x18(%ebp)
     b5a:	e8 b9 fe ff ff       	call   a18 <getInteger>
     b5f:	83 c4 08             	add    $0x8,%esp
     b62:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     b65:	83 ec 04             	sub    $0x4,%esp
     b68:	6a 01                	push   $0x1
     b6a:	6a 0a                	push   $0xa
     b6c:	ff 75 14             	pushl  0x14(%ebp)
     b6f:	ff 75 f8             	pushl  -0x8(%ebp)
     b72:	ff 75 08             	pushl  0x8(%ebp)
     b75:	e8 d9 fe ff ff       	call   a53 <int2str>
     b7a:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     b7d:	db 45 f8             	fildl  -0x8(%ebp)
     b80:	dd 45 e8             	fldl   -0x18(%ebp)
     b83:	de e1                	fsubp  %st,%st(1)
     b85:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     b88:	dd 45 e8             	fldl   -0x18(%ebp)
     b8b:	dd 05 38 37 00 00    	fldl   0x3738
     b91:	d9 c9                	fxch   %st(1)
     b93:	df e9                	fucomip %st(1),%st
     b95:	dd d8                	fstp   %st(0)
     b97:	76 1c                	jbe    bb5 <double2str+0xa4>
  {
    buf[*pos] = '.';
     b99:	8b 45 14             	mov    0x14(%ebp),%eax
     b9c:	8b 00                	mov    (%eax),%eax
     b9e:	89 c2                	mov    %eax,%edx
     ba0:	8b 45 08             	mov    0x8(%ebp),%eax
     ba3:	01 d0                	add    %edx,%eax
     ba5:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     ba8:	8b 45 14             	mov    0x14(%ebp),%eax
     bab:	8b 00                	mov    (%eax),%eax
     bad:	8d 50 01             	lea    0x1(%eax),%edx
     bb0:	8b 45 14             	mov    0x14(%ebp),%eax
     bb3:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     bb5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     bbc:	eb 4c                	jmp    c0a <double2str+0xf9>
  {
    num = num*10;
     bbe:	dd 45 e8             	fldl   -0x18(%ebp)
     bc1:	dd 05 40 37 00 00    	fldl   0x3740
     bc7:	de c9                	fmulp  %st,%st(1)
     bc9:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     bcc:	ff 75 ec             	pushl  -0x14(%ebp)
     bcf:	ff 75 e8             	pushl  -0x18(%ebp)
     bd2:	e8 41 fe ff ff       	call   a18 <getInteger>
     bd7:	83 c4 08             	add    $0x8,%esp
     bda:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     bdd:	83 ec 04             	sub    $0x4,%esp
     be0:	6a 01                	push   $0x1
     be2:	6a 0a                	push   $0xa
     be4:	ff 75 14             	pushl  0x14(%ebp)
     be7:	ff 75 f8             	pushl  -0x8(%ebp)
     bea:	ff 75 08             	pushl  0x8(%ebp)
     bed:	e8 61 fe ff ff       	call   a53 <int2str>
     bf2:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     bf5:	db 45 f8             	fildl  -0x8(%ebp)
     bf8:	dd 45 e8             	fldl   -0x18(%ebp)
     bfb:	de e1                	fsubp  %st,%st(1)
     bfd:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     c00:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     c04:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     c08:	7f 13                	jg     c1d <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     c0a:	dd 45 e8             	fldl   -0x18(%ebp)
     c0d:	dd 05 38 37 00 00    	fldl   0x3738
     c13:	d9 c9                	fxch   %st(1)
     c15:	df e9                	fucomip %st(1),%st
     c17:	dd d8                	fstp   %st(0)
     c19:	77 a3                	ja     bbe <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     c1b:	eb 01                	jmp    c1e <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     c1d:	90                   	nop
    }
  }
}
     c1e:	90                   	nop
     c1f:	c9                   	leave  
     c20:	c3                   	ret    

00000c21 <pow>:

double pow(double opnd, int power)
{
     c21:	55                   	push   %ebp
     c22:	89 e5                	mov    %esp,%ebp
     c24:	83 ec 18             	sub    $0x18,%esp
     c27:	8b 45 08             	mov    0x8(%ebp),%eax
     c2a:	89 45 e8             	mov    %eax,-0x18(%ebp)
     c2d:	8b 45 0c             	mov    0xc(%ebp),%eax
     c30:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     c33:	d9 e8                	fld1   
     c35:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     c38:	eb 0d                	jmp    c47 <pow+0x26>
  {
    result *= opnd;
     c3a:	dd 45 f8             	fldl   -0x8(%ebp)
     c3d:	dc 4d e8             	fmull  -0x18(%ebp)
     c40:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     c43:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     c47:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     c4b:	7f ed                	jg     c3a <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     c4d:	dd 45 f8             	fldl   -0x8(%ebp)
}
     c50:	c9                   	leave  
     c51:	c3                   	ret    

00000c52 <Translation>:

double Translation(char *s, int* pos)
{
     c52:	55                   	push   %ebp
     c53:	89 e5                	mov    %esp,%ebp
     c55:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     c58:	d9 ee                	fldz   
     c5a:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     c5d:	d9 ee                	fldz   
     c5f:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     c62:	eb 3e                	jmp    ca2 <Translation+0x50>
    {
        integer *= 10;
     c64:	dd 45 f8             	fldl   -0x8(%ebp)
     c67:	dd 05 40 37 00 00    	fldl   0x3740
     c6d:	de c9                	fmulp  %st,%st(1)
     c6f:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     c72:	8b 45 0c             	mov    0xc(%ebp),%eax
     c75:	8b 00                	mov    (%eax),%eax
     c77:	89 c2                	mov    %eax,%edx
     c79:	8b 45 08             	mov    0x8(%ebp),%eax
     c7c:	01 d0                	add    %edx,%eax
     c7e:	0f b6 00             	movzbl (%eax),%eax
     c81:	0f be c0             	movsbl %al,%eax
     c84:	83 e8 30             	sub    $0x30,%eax
     c87:	89 45 dc             	mov    %eax,-0x24(%ebp)
     c8a:	db 45 dc             	fildl  -0x24(%ebp)
     c8d:	dd 45 f8             	fldl   -0x8(%ebp)
     c90:	de c1                	faddp  %st,%st(1)
     c92:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     c95:	8b 45 0c             	mov    0xc(%ebp),%eax
     c98:	8b 00                	mov    (%eax),%eax
     c9a:	8d 50 01             	lea    0x1(%eax),%edx
     c9d:	8b 45 0c             	mov    0xc(%ebp),%eax
     ca0:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     ca2:	8b 45 0c             	mov    0xc(%ebp),%eax
     ca5:	8b 00                	mov    (%eax),%eax
     ca7:	89 c2                	mov    %eax,%edx
     ca9:	8b 45 08             	mov    0x8(%ebp),%eax
     cac:	01 d0                	add    %edx,%eax
     cae:	0f b6 00             	movzbl (%eax),%eax
     cb1:	3c 2f                	cmp    $0x2f,%al
     cb3:	7e 13                	jle    cc8 <Translation+0x76>
     cb5:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb8:	8b 00                	mov    (%eax),%eax
     cba:	89 c2                	mov    %eax,%edx
     cbc:	8b 45 08             	mov    0x8(%ebp),%eax
     cbf:	01 d0                	add    %edx,%eax
     cc1:	0f b6 00             	movzbl (%eax),%eax
     cc4:	3c 39                	cmp    $0x39,%al
     cc6:	7e 9c                	jle    c64 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     cc8:	8b 45 0c             	mov    0xc(%ebp),%eax
     ccb:	8b 00                	mov    (%eax),%eax
     ccd:	89 c2                	mov    %eax,%edx
     ccf:	8b 45 08             	mov    0x8(%ebp),%eax
     cd2:	01 d0                	add    %edx,%eax
     cd4:	0f b6 00             	movzbl (%eax),%eax
     cd7:	3c 2e                	cmp    $0x2e,%al
     cd9:	0f 85 9b 00 00 00    	jne    d7a <Translation+0x128>
    {
        (*pos)++;
     cdf:	8b 45 0c             	mov    0xc(%ebp),%eax
     ce2:	8b 00                	mov    (%eax),%eax
     ce4:	8d 50 01             	lea    0x1(%eax),%edx
     ce7:	8b 45 0c             	mov    0xc(%ebp),%eax
     cea:	89 10                	mov    %edx,(%eax)
        int c = 1;
     cec:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     cf3:	eb 5b                	jmp    d50 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     cf5:	8b 45 0c             	mov    0xc(%ebp),%eax
     cf8:	8b 00                	mov    (%eax),%eax
     cfa:	89 c2                	mov    %eax,%edx
     cfc:	8b 45 08             	mov    0x8(%ebp),%eax
     cff:	01 d0                	add    %edx,%eax
     d01:	0f b6 00             	movzbl (%eax),%eax
     d04:	0f be c0             	movsbl %al,%eax
     d07:	83 e8 30             	sub    $0x30,%eax
     d0a:	89 45 dc             	mov    %eax,-0x24(%ebp)
     d0d:	db 45 dc             	fildl  -0x24(%ebp)
     d10:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     d13:	83 ec 04             	sub    $0x4,%esp
     d16:	ff 75 ec             	pushl  -0x14(%ebp)
     d19:	dd 05 48 37 00 00    	fldl   0x3748
     d1f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     d23:	dd 1c 24             	fstpl  (%esp)
     d26:	e8 f6 fe ff ff       	call   c21 <pow>
     d2b:	83 c4 10             	add    $0x10,%esp
     d2e:	dd 45 e0             	fldl   -0x20(%ebp)
     d31:	de c9                	fmulp  %st,%st(1)
     d33:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     d36:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     d3a:	dd 45 f0             	fldl   -0x10(%ebp)
     d3d:	dc 45 e0             	faddl  -0x20(%ebp)
     d40:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     d43:	8b 45 0c             	mov    0xc(%ebp),%eax
     d46:	8b 00                	mov    (%eax),%eax
     d48:	8d 50 01             	lea    0x1(%eax),%edx
     d4b:	8b 45 0c             	mov    0xc(%ebp),%eax
     d4e:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     d50:	8b 45 0c             	mov    0xc(%ebp),%eax
     d53:	8b 00                	mov    (%eax),%eax
     d55:	89 c2                	mov    %eax,%edx
     d57:	8b 45 08             	mov    0x8(%ebp),%eax
     d5a:	01 d0                	add    %edx,%eax
     d5c:	0f b6 00             	movzbl (%eax),%eax
     d5f:	3c 2f                	cmp    $0x2f,%al
     d61:	7e 17                	jle    d7a <Translation+0x128>
     d63:	8b 45 0c             	mov    0xc(%ebp),%eax
     d66:	8b 00                	mov    (%eax),%eax
     d68:	89 c2                	mov    %eax,%edx
     d6a:	8b 45 08             	mov    0x8(%ebp),%eax
     d6d:	01 d0                	add    %edx,%eax
     d6f:	0f b6 00             	movzbl (%eax),%eax
     d72:	3c 39                	cmp    $0x39,%al
     d74:	0f 8e 7b ff ff ff    	jle    cf5 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     d7a:	dd 45 f8             	fldl   -0x8(%ebp)
     d7d:	dc 45 f0             	faddl  -0x10(%ebp)
     d80:	c9                   	leave  
     d81:	c3                   	ret    

00000d82 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     d82:	55                   	push   %ebp
     d83:	89 e5                	mov    %esp,%ebp
     d85:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     d88:	e8 d2 f5 ff ff       	call   35f <fork>
     d8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     d90:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     d93:	c9                   	leave  
     d94:	c3                   	ret    

00000d95 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     d95:	55                   	push   %ebp
     d96:	89 e5                	mov    %esp,%ebp
     d98:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     d9b:	83 ec 0c             	sub    $0xc,%esp
     d9e:	6a 54                	push   $0x54
     da0:	e8 70 fb ff ff       	call   915 <malloc>
     da5:	83 c4 10             	add    $0x10,%esp
     da8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     dab:	83 ec 04             	sub    $0x4,%esp
     dae:	6a 54                	push   $0x54
     db0:	6a 00                	push   $0x0
     db2:	ff 75 f4             	pushl  -0xc(%ebp)
     db5:	e8 12 f4 ff ff       	call   1cc <memset>
     dba:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     dbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dc0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     dc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     dc9:	c9                   	leave  
     dca:	c3                   	ret    

00000dcb <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     dcb:	55                   	push   %ebp
     dcc:	89 e5                	mov    %esp,%ebp
     dce:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     dd1:	83 ec 0c             	sub    $0xc,%esp
     dd4:	6a 18                	push   $0x18
     dd6:	e8 3a fb ff ff       	call   915 <malloc>
     ddb:	83 c4 10             	add    $0x10,%esp
     dde:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     de1:	83 ec 04             	sub    $0x4,%esp
     de4:	6a 18                	push   $0x18
     de6:	6a 00                	push   $0x0
     de8:	ff 75 f4             	pushl  -0xc(%ebp)
     deb:	e8 dc f3 ff ff       	call   1cc <memset>
     df0:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     df3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     df6:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dff:	8b 55 08             	mov    0x8(%ebp),%edx
     e02:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     e05:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e08:	8b 55 0c             	mov    0xc(%ebp),%edx
     e0b:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     e0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e11:	8b 55 10             	mov    0x10(%ebp),%edx
     e14:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     e17:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e1a:	8b 55 14             	mov    0x14(%ebp),%edx
     e1d:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     e20:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e23:	8b 55 18             	mov    0x18(%ebp),%edx
     e26:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     e29:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e2c:	c9                   	leave  
     e2d:	c3                   	ret    

00000e2e <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     e2e:	55                   	push   %ebp
     e2f:	89 e5                	mov    %esp,%ebp
     e31:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e34:	83 ec 0c             	sub    $0xc,%esp
     e37:	6a 0c                	push   $0xc
     e39:	e8 d7 fa ff ff       	call   915 <malloc>
     e3e:	83 c4 10             	add    $0x10,%esp
     e41:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e44:	83 ec 04             	sub    $0x4,%esp
     e47:	6a 0c                	push   $0xc
     e49:	6a 00                	push   $0x0
     e4b:	ff 75 f4             	pushl  -0xc(%ebp)
     e4e:	e8 79 f3 ff ff       	call   1cc <memset>
     e53:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     e56:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e59:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     e5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e62:	8b 55 08             	mov    0x8(%ebp),%edx
     e65:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     e68:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e6b:	8b 55 0c             	mov    0xc(%ebp),%edx
     e6e:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     e71:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     e74:	c9                   	leave  
     e75:	c3                   	ret    

00000e76 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     e76:	55                   	push   %ebp
     e77:	89 e5                	mov    %esp,%ebp
     e79:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     e7c:	83 ec 0c             	sub    $0xc,%esp
     e7f:	6a 0c                	push   $0xc
     e81:	e8 8f fa ff ff       	call   915 <malloc>
     e86:	83 c4 10             	add    $0x10,%esp
     e89:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     e8c:	83 ec 04             	sub    $0x4,%esp
     e8f:	6a 0c                	push   $0xc
     e91:	6a 00                	push   $0x0
     e93:	ff 75 f4             	pushl  -0xc(%ebp)
     e96:	e8 31 f3 ff ff       	call   1cc <memset>
     e9b:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     e9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ea1:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     ea7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eaa:	8b 55 08             	mov    0x8(%ebp),%edx
     ead:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     eb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eb3:	8b 55 0c             	mov    0xc(%ebp),%edx
     eb6:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     eb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ebc:	c9                   	leave  
     ebd:	c3                   	ret    

00000ebe <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     ebe:	55                   	push   %ebp
     ebf:	89 e5                	mov    %esp,%ebp
     ec1:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     ec4:	83 ec 0c             	sub    $0xc,%esp
     ec7:	6a 08                	push   $0x8
     ec9:	e8 47 fa ff ff       	call   915 <malloc>
     ece:	83 c4 10             	add    $0x10,%esp
     ed1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     ed4:	83 ec 04             	sub    $0x4,%esp
     ed7:	6a 08                	push   $0x8
     ed9:	6a 00                	push   $0x0
     edb:	ff 75 f4             	pushl  -0xc(%ebp)
     ede:	e8 e9 f2 ff ff       	call   1cc <memset>
     ee3:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
     ee6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ee9:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     eef:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ef2:	8b 55 08             	mov    0x8(%ebp),%edx
     ef5:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     ef8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     efb:	c9                   	leave  
     efc:	c3                   	ret    

00000efd <calcmd>:

struct cmd* calcmd(char *_line)
{
     efd:	55                   	push   %ebp
     efe:	89 e5                	mov    %esp,%ebp
     f00:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     f03:	83 ec 0c             	sub    $0xc,%esp
     f06:	6a 08                	push   $0x8
     f08:	e8 08 fa ff ff       	call   915 <malloc>
     f0d:	83 c4 10             	add    $0x10,%esp
     f10:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     f13:	83 ec 04             	sub    $0x4,%esp
     f16:	6a 08                	push   $0x8
     f18:	6a 00                	push   $0x0
     f1a:	ff 75 f4             	pushl  -0xc(%ebp)
     f1d:	e8 aa f2 ff ff       	call   1cc <memset>
     f22:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
     f25:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f28:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
     f2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f31:	8b 55 08             	mov    0x8(%ebp),%edx
     f34:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     f37:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f3a:	c9                   	leave  
     f3b:	c3                   	ret    

00000f3c <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
     f3c:	55                   	push   %ebp
     f3d:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
     f3f:	eb 0c                	jmp    f4d <mystrncmp+0x11>
    n--, p++, q++;
     f41:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     f45:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     f49:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
     f4d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     f51:	74 1a                	je     f6d <mystrncmp+0x31>
     f53:	8b 45 08             	mov    0x8(%ebp),%eax
     f56:	0f b6 00             	movzbl (%eax),%eax
     f59:	84 c0                	test   %al,%al
     f5b:	74 10                	je     f6d <mystrncmp+0x31>
     f5d:	8b 45 08             	mov    0x8(%ebp),%eax
     f60:	0f b6 10             	movzbl (%eax),%edx
     f63:	8b 45 0c             	mov    0xc(%ebp),%eax
     f66:	0f b6 00             	movzbl (%eax),%eax
     f69:	38 c2                	cmp    %al,%dl
     f6b:	74 d4                	je     f41 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
     f6d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     f71:	75 07                	jne    f7a <mystrncmp+0x3e>
    return 0;
     f73:	b8 00 00 00 00       	mov    $0x0,%eax
     f78:	eb 16                	jmp    f90 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
     f7a:	8b 45 08             	mov    0x8(%ebp),%eax
     f7d:	0f b6 00             	movzbl (%eax),%eax
     f80:	0f b6 d0             	movzbl %al,%edx
     f83:	8b 45 0c             	mov    0xc(%ebp),%eax
     f86:	0f b6 00             	movzbl (%eax),%eax
     f89:	0f b6 c0             	movzbl %al,%eax
     f8c:	29 c2                	sub    %eax,%edx
     f8e:	89 d0                	mov    %edx,%eax
}
     f90:	5d                   	pop    %ebp
     f91:	c3                   	ret    

00000f92 <mystrlen>:

static int mystrlen(const char *s)
{
     f92:	55                   	push   %ebp
     f93:	89 e5                	mov    %esp,%ebp
     f95:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
     f98:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     f9f:	eb 04                	jmp    fa5 <mystrlen+0x13>
     fa1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     fa5:	8b 55 fc             	mov    -0x4(%ebp),%edx
     fa8:	8b 45 08             	mov    0x8(%ebp),%eax
     fab:	01 d0                	add    %edx,%eax
     fad:	0f b6 00             	movzbl (%eax),%eax
     fb0:	84 c0                	test   %al,%al
     fb2:	75 ed                	jne    fa1 <mystrlen+0xf>
    ;
  return n;
     fb4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     fb7:	c9                   	leave  
     fb8:	c3                   	ret    

00000fb9 <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
     fb9:	55                   	push   %ebp
     fba:	89 e5                	mov    %esp,%ebp
     fbc:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
     fbf:	8b 45 08             	mov    0x8(%ebp),%eax
     fc2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
     fc5:	90                   	nop
     fc6:	8b 45 10             	mov    0x10(%ebp),%eax
     fc9:	8d 50 ff             	lea    -0x1(%eax),%edx
     fcc:	89 55 10             	mov    %edx,0x10(%ebp)
     fcf:	85 c0                	test   %eax,%eax
     fd1:	7e 2c                	jle    fff <mystrncpy+0x46>
     fd3:	8b 45 08             	mov    0x8(%ebp),%eax
     fd6:	8d 50 01             	lea    0x1(%eax),%edx
     fd9:	89 55 08             	mov    %edx,0x8(%ebp)
     fdc:	8b 55 0c             	mov    0xc(%ebp),%edx
     fdf:	8d 4a 01             	lea    0x1(%edx),%ecx
     fe2:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     fe5:	0f b6 12             	movzbl (%edx),%edx
     fe8:	88 10                	mov    %dl,(%eax)
     fea:	0f b6 00             	movzbl (%eax),%eax
     fed:	84 c0                	test   %al,%al
     fef:	75 d5                	jne    fc6 <mystrncpy+0xd>
    ;
  while(n-- > 0)
     ff1:	eb 0c                	jmp    fff <mystrncpy+0x46>
    *s++ = 0;
     ff3:	8b 45 08             	mov    0x8(%ebp),%eax
     ff6:	8d 50 01             	lea    0x1(%eax),%edx
     ff9:	89 55 08             	mov    %edx,0x8(%ebp)
     ffc:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
     fff:	8b 45 10             	mov    0x10(%ebp),%eax
    1002:	8d 50 ff             	lea    -0x1(%eax),%edx
    1005:	89 55 10             	mov    %edx,0x10(%ebp)
    1008:	85 c0                	test   %eax,%eax
    100a:	7f e7                	jg     ff3 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    100c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    100f:	c9                   	leave  
    1010:	c3                   	ret    

00001011 <isEqual>:

int isEqual(double a, double b)
{
    1011:	55                   	push   %ebp
    1012:	89 e5                	mov    %esp,%ebp
    1014:	83 ec 10             	sub    $0x10,%esp
    1017:	8b 45 08             	mov    0x8(%ebp),%eax
    101a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    101d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1020:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1023:	8b 45 10             	mov    0x10(%ebp),%eax
    1026:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1029:	8b 45 14             	mov    0x14(%ebp),%eax
    102c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    102f:	dd 45 f8             	fldl   -0x8(%ebp)
    1032:	dc 65 f0             	fsubl  -0x10(%ebp)
    1035:	dd 05 18 39 00 00    	fldl   0x3918
    103b:	df e9                	fucomip %st(1),%st
    103d:	dd d8                	fstp   %st(0)
    103f:	76 19                	jbe    105a <isEqual+0x49>
    1041:	dd 45 f0             	fldl   -0x10(%ebp)
    1044:	dc 65 f8             	fsubl  -0x8(%ebp)
    1047:	dd 05 18 39 00 00    	fldl   0x3918
    104d:	df e9                	fucomip %st(1),%st
    104f:	dd d8                	fstp   %st(0)
    1051:	76 07                	jbe    105a <isEqual+0x49>
    return 1;
    1053:	b8 01 00 00 00       	mov    $0x1,%eax
    1058:	eb 05                	jmp    105f <isEqual+0x4e>
  return 0;
    105a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    105f:	c9                   	leave  
    1060:	c3                   	ret    

00001061 <isCmdName>:

int isCmdName(const char* str)
{
    1061:	55                   	push   %ebp
    1062:	89 e5                	mov    %esp,%ebp
    1064:	53                   	push   %ebx
    1065:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    1068:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    106f:	eb 71                	jmp    10e2 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1071:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1074:	89 d0                	mov    %edx,%eax
    1076:	c1 e0 02             	shl    $0x2,%eax
    1079:	01 d0                	add    %edx,%eax
    107b:	01 c0                	add    %eax,%eax
    107d:	05 60 43 00 00       	add    $0x4360,%eax
    1082:	83 ec 0c             	sub    $0xc,%esp
    1085:	50                   	push   %eax
    1086:	e8 1a f1 ff ff       	call   1a5 <strlen>
    108b:	83 c4 10             	add    $0x10,%esp
    108e:	89 c3                	mov    %eax,%ebx
    1090:	83 ec 0c             	sub    $0xc,%esp
    1093:	ff 75 08             	pushl  0x8(%ebp)
    1096:	e8 f7 fe ff ff       	call   f92 <mystrlen>
    109b:	83 c4 10             	add    $0x10,%esp
    109e:	39 c3                	cmp    %eax,%ebx
    10a0:	75 3c                	jne    10de <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    10a2:	83 ec 0c             	sub    $0xc,%esp
    10a5:	ff 75 08             	pushl  0x8(%ebp)
    10a8:	e8 e5 fe ff ff       	call   f92 <mystrlen>
    10ad:	83 c4 10             	add    $0x10,%esp
    10b0:	89 c1                	mov    %eax,%ecx
    10b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    10b5:	89 d0                	mov    %edx,%eax
    10b7:	c1 e0 02             	shl    $0x2,%eax
    10ba:	01 d0                	add    %edx,%eax
    10bc:	01 c0                	add    %eax,%eax
    10be:	05 60 43 00 00       	add    $0x4360,%eax
    10c3:	83 ec 04             	sub    $0x4,%esp
    10c6:	51                   	push   %ecx
    10c7:	ff 75 08             	pushl  0x8(%ebp)
    10ca:	50                   	push   %eax
    10cb:	e8 6c fe ff ff       	call   f3c <mystrncmp>
    10d0:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    10d3:	85 c0                	test   %eax,%eax
    10d5:	75 07                	jne    10de <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    10d7:	b8 01 00 00 00       	mov    $0x1,%eax
    10dc:	eb 0f                	jmp    10ed <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    10de:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    10e2:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    10e6:	7e 89                	jle    1071 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    10e8:	b8 00 00 00 00       	mov    $0x0,%eax
}
    10ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10f0:	c9                   	leave  
    10f1:	c3                   	ret    

000010f2 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    10f2:	55                   	push   %ebp
    10f3:	89 e5                	mov    %esp,%ebp
    10f5:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    10fb:	83 ec 08             	sub    $0x8,%esp
    10fe:	6a 00                	push   $0x0
    1100:	68 28 44 00 00       	push   $0x4428
    1105:	e8 9d f2 ff ff       	call   3a7 <open>
    110a:	83 c4 10             	add    $0x10,%esp
    110d:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1110:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1114:	79 0a                	jns    1120 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    1116:	b8 00 00 00 00       	mov    $0x0,%eax
    111b:	e9 9a 01 00 00       	jmp    12ba <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    1120:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    1127:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    112e:	e9 ee 00 00 00       	jmp    1221 <findAlias+0x12f>
  {
      int isSame = 1;
    1133:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    113a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    1141:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    1148:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    114f:	83 ec 0c             	sub    $0xc,%esp
    1152:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1155:	50                   	push   %eax
    1156:	e8 4a f0 ff ff       	call   1a5 <strlen>
    115b:	83 c4 10             	add    $0x10,%esp
    115e:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    1161:	83 ec 0c             	sub    $0xc,%esp
    1164:	ff 75 08             	pushl  0x8(%ebp)
    1167:	e8 39 f0 ff ff       	call   1a5 <strlen>
    116c:	83 c4 10             	add    $0x10,%esp
    116f:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    1172:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1175:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1178:	01 d0                	add    %edx,%eax
    117a:	0f b6 00             	movzbl (%eax),%eax
    117d:	3c 21                	cmp    $0x21,%al
    117f:	75 38                	jne    11b9 <findAlias+0xc7>
      {
          startIndex++;
    1181:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    1185:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    118c:	eb 2b                	jmp    11b9 <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    118e:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1191:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1194:	01 d0                	add    %edx,%eax
    1196:	0f b6 10             	movzbl (%eax),%edx
    1199:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    119c:	8b 45 08             	mov    0x8(%ebp),%eax
    119f:	01 c8                	add    %ecx,%eax
    11a1:	0f b6 00             	movzbl (%eax),%eax
    11a4:	38 c2                	cmp    %al,%dl
    11a6:	74 09                	je     11b1 <findAlias+0xbf>
          {
              isSame = 0;
    11a8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    11af:	eb 1f                	jmp    11d0 <findAlias+0xde>
          }
          startIndex++;
    11b1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    11b5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    11b9:	8d 55 9a             	lea    -0x66(%ebp),%edx
    11bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11bf:	01 d0                	add    %edx,%eax
    11c1:	0f b6 00             	movzbl (%eax),%eax
    11c4:	3c 3d                	cmp    $0x3d,%al
    11c6:	74 08                	je     11d0 <findAlias+0xde>
    11c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11cb:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    11ce:	7c be                	jl     118e <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    11d0:	8d 55 9a             	lea    -0x66(%ebp),%edx
    11d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11d6:	01 d0                	add    %edx,%eax
    11d8:	0f b6 00             	movzbl (%eax),%eax
    11db:	3c 3d                	cmp    $0x3d,%al
    11dd:	75 08                	jne    11e7 <findAlias+0xf5>
    11df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11e2:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    11e5:	7d 07                	jge    11ee <findAlias+0xfc>
      {
          isSame = 0;
    11e7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    11ee:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    11f2:	75 0b                	jne    11ff <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    11f4:	b8 01 00 00 00       	mov    $0x1,%eax
    11f9:	2b 45 f0             	sub    -0x10(%ebp),%eax
    11fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    11ff:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1203:	75 1c                	jne    1221 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    1205:	83 ec 08             	sub    $0x8,%esp
    1208:	8d 45 9a             	lea    -0x66(%ebp),%eax
    120b:	50                   	push   %eax
    120c:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1212:	50                   	push   %eax
    1213:	e8 1e ef ff ff       	call   136 <strcpy>
    1218:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    121b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    121e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1221:	83 ec 04             	sub    $0x4,%esp
    1224:	6a 32                	push   $0x32
    1226:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1229:	50                   	push   %eax
    122a:	ff 75 dc             	pushl  -0x24(%ebp)
    122d:	e8 4d f1 ff ff       	call   37f <read>
    1232:	83 c4 10             	add    $0x10,%esp
    1235:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1238:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    123c:	0f 8f f1 fe ff ff    	jg     1133 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    1242:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1246:	75 5f                	jne    12a7 <findAlias+0x1b5>
  {
    int i = 0;
    1248:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    124f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    1253:	eb 20                	jmp    1275 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    1255:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1258:	8b 45 0c             	mov    0xc(%ebp),%eax
    125b:	01 c2                	add    %eax,%edx
    125d:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    1263:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1266:	01 c8                	add    %ecx,%eax
    1268:	0f b6 00             	movzbl (%eax),%eax
    126b:	88 02                	mov    %al,(%edx)
      i++;
    126d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    1271:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    1275:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    127b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    127e:	01 d0                	add    %edx,%eax
    1280:	0f b6 00             	movzbl (%eax),%eax
    1283:	84 c0                	test   %al,%al
    1285:	75 ce                	jne    1255 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    1287:	8b 55 e0             	mov    -0x20(%ebp),%edx
    128a:	8b 45 0c             	mov    0xc(%ebp),%eax
    128d:	01 d0                	add    %edx,%eax
    128f:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    1292:	83 ec 0c             	sub    $0xc,%esp
    1295:	ff 75 dc             	pushl  -0x24(%ebp)
    1298:	e8 f2 f0 ff ff       	call   38f <close>
    129d:	83 c4 10             	add    $0x10,%esp
    return 1;
    12a0:	b8 01 00 00 00       	mov    $0x1,%eax
    12a5:	eb 13                	jmp    12ba <findAlias+0x1c8>
  }
  close(fd);
    12a7:	83 ec 0c             	sub    $0xc,%esp
    12aa:	ff 75 dc             	pushl  -0x24(%ebp)
    12ad:	e8 dd f0 ff ff       	call   38f <close>
    12b2:	83 c4 10             	add    $0x10,%esp
  return 0;
    12b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12ba:	c9                   	leave  
    12bb:	c3                   	ret    

000012bc <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    12bc:	55                   	push   %ebp
    12bd:	89 e5                	mov    %esp,%ebp
    12bf:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    12c2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    12c6:	75 05                	jne    12cd <runcmd+0x11>
    exit();
    12c8:	e8 9a f0 ff ff       	call   367 <exit>
  
  switch(cmd->type){
    12cd:	8b 45 08             	mov    0x8(%ebp),%eax
    12d0:	8b 00                	mov    (%eax),%eax
    12d2:	83 f8 05             	cmp    $0x5,%eax
    12d5:	77 09                	ja     12e0 <runcmd+0x24>
    12d7:	8b 04 85 7c 37 00 00 	mov    0x377c(,%eax,4),%eax
    12de:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    12e0:	83 ec 0c             	sub    $0xc,%esp
    12e3:	68 50 37 00 00       	push   $0x3750
    12e8:	e8 0b f7 ff ff       	call   9f8 <panic1>
    12ed:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    12f0:	8b 45 08             	mov    0x8(%ebp),%eax
    12f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    12f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12f9:	8b 40 04             	mov    0x4(%eax),%eax
    12fc:	85 c0                	test   %eax,%eax
    12fe:	75 05                	jne    1305 <runcmd+0x49>
      exit();
    1300:	e8 62 f0 ff ff       	call   367 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    1305:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1308:	8b 40 04             	mov    0x4(%eax),%eax
    130b:	83 ec 0c             	sub    $0xc,%esp
    130e:	50                   	push   %eax
    130f:	e8 4d fd ff ff       	call   1061 <isCmdName>
    1314:	83 c4 10             	add    $0x10,%esp
    1317:	85 c0                	test   %eax,%eax
    1319:	75 37                	jne    1352 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    131b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    131e:	8b 40 04             	mov    0x4(%eax),%eax
    1321:	83 ec 08             	sub    $0x8,%esp
    1324:	8d 55 ce             	lea    -0x32(%ebp),%edx
    1327:	52                   	push   %edx
    1328:	50                   	push   %eax
    1329:	e8 c4 fd ff ff       	call   10f2 <findAlias>
    132e:	83 c4 10             	add    $0x10,%esp
    1331:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    1334:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1338:	75 31                	jne    136b <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    133a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    133d:	83 c0 04             	add    $0x4,%eax
    1340:	83 ec 08             	sub    $0x8,%esp
    1343:	50                   	push   %eax
    1344:	8d 45 ce             	lea    -0x32(%ebp),%eax
    1347:	50                   	push   %eax
    1348:	e8 52 f0 ff ff       	call   39f <exec>
    134d:	83 c4 10             	add    $0x10,%esp
    1350:	eb 19                	jmp    136b <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    1352:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1355:	8d 50 04             	lea    0x4(%eax),%edx
    1358:	8b 45 f4             	mov    -0xc(%ebp),%eax
    135b:	8b 40 04             	mov    0x4(%eax),%eax
    135e:	83 ec 08             	sub    $0x8,%esp
    1361:	52                   	push   %edx
    1362:	50                   	push   %eax
    1363:	e8 37 f0 ff ff       	call   39f <exec>
    1368:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    136b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    136e:	8b 40 04             	mov    0x4(%eax),%eax
    1371:	83 ec 04             	sub    $0x4,%esp
    1374:	50                   	push   %eax
    1375:	68 57 37 00 00       	push   $0x3757
    137a:	6a 02                	push   $0x2
    137c:	e8 92 f2 ff ff       	call   613 <printf>
    1381:	83 c4 10             	add    $0x10,%esp
    break;
    1384:	e9 c6 01 00 00       	jmp    154f <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    1389:	8b 45 08             	mov    0x8(%ebp),%eax
    138c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    138f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1392:	8b 40 14             	mov    0x14(%eax),%eax
    1395:	83 ec 0c             	sub    $0xc,%esp
    1398:	50                   	push   %eax
    1399:	e8 f1 ef ff ff       	call   38f <close>
    139e:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    13a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13a4:	8b 50 10             	mov    0x10(%eax),%edx
    13a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13aa:	8b 40 08             	mov    0x8(%eax),%eax
    13ad:	83 ec 08             	sub    $0x8,%esp
    13b0:	52                   	push   %edx
    13b1:	50                   	push   %eax
    13b2:	e8 f0 ef ff ff       	call   3a7 <open>
    13b7:	83 c4 10             	add    $0x10,%esp
    13ba:	85 c0                	test   %eax,%eax
    13bc:	79 1e                	jns    13dc <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    13be:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13c1:	8b 40 08             	mov    0x8(%eax),%eax
    13c4:	83 ec 04             	sub    $0x4,%esp
    13c7:	50                   	push   %eax
    13c8:	68 67 37 00 00       	push   $0x3767
    13cd:	6a 02                	push   $0x2
    13cf:	e8 3f f2 ff ff       	call   613 <printf>
    13d4:	83 c4 10             	add    $0x10,%esp
      exit();
    13d7:	e8 8b ef ff ff       	call   367 <exit>
    }
    runcmd(rcmd->cmd);
    13dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13df:	8b 40 04             	mov    0x4(%eax),%eax
    13e2:	83 ec 0c             	sub    $0xc,%esp
    13e5:	50                   	push   %eax
    13e6:	e8 d1 fe ff ff       	call   12bc <runcmd>
    13eb:	83 c4 10             	add    $0x10,%esp
    break;
    13ee:	e9 5c 01 00 00       	jmp    154f <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    13f3:	8b 45 08             	mov    0x8(%ebp),%eax
    13f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    13f9:	e8 84 f9 ff ff       	call   d82 <fork1>
    13fe:	85 c0                	test   %eax,%eax
    1400:	75 12                	jne    1414 <runcmd+0x158>
      runcmd(lcmd->left);
    1402:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1405:	8b 40 04             	mov    0x4(%eax),%eax
    1408:	83 ec 0c             	sub    $0xc,%esp
    140b:	50                   	push   %eax
    140c:	e8 ab fe ff ff       	call   12bc <runcmd>
    1411:	83 c4 10             	add    $0x10,%esp
    wait();
    1414:	e8 56 ef ff ff       	call   36f <wait>
    runcmd(lcmd->right);
    1419:	8b 45 e8             	mov    -0x18(%ebp),%eax
    141c:	8b 40 08             	mov    0x8(%eax),%eax
    141f:	83 ec 0c             	sub    $0xc,%esp
    1422:	50                   	push   %eax
    1423:	e8 94 fe ff ff       	call   12bc <runcmd>
    1428:	83 c4 10             	add    $0x10,%esp
    break;
    142b:	e9 1f 01 00 00       	jmp    154f <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    1430:	8b 45 08             	mov    0x8(%ebp),%eax
    1433:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    1436:	83 ec 0c             	sub    $0xc,%esp
    1439:	8d 45 d8             	lea    -0x28(%ebp),%eax
    143c:	50                   	push   %eax
    143d:	e8 35 ef ff ff       	call   377 <pipe>
    1442:	83 c4 10             	add    $0x10,%esp
    1445:	85 c0                	test   %eax,%eax
    1447:	79 10                	jns    1459 <runcmd+0x19d>
      panic1("pipe");
    1449:	83 ec 0c             	sub    $0xc,%esp
    144c:	68 77 37 00 00       	push   $0x3777
    1451:	e8 a2 f5 ff ff       	call   9f8 <panic1>
    1456:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    1459:	e8 24 f9 ff ff       	call   d82 <fork1>
    145e:	85 c0                	test   %eax,%eax
    1460:	75 4c                	jne    14ae <runcmd+0x1f2>
      close(1);
    1462:	83 ec 0c             	sub    $0xc,%esp
    1465:	6a 01                	push   $0x1
    1467:	e8 23 ef ff ff       	call   38f <close>
    146c:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    146f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1472:	83 ec 0c             	sub    $0xc,%esp
    1475:	50                   	push   %eax
    1476:	e8 64 ef ff ff       	call   3df <dup>
    147b:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    147e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1481:	83 ec 0c             	sub    $0xc,%esp
    1484:	50                   	push   %eax
    1485:	e8 05 ef ff ff       	call   38f <close>
    148a:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    148d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1490:	83 ec 0c             	sub    $0xc,%esp
    1493:	50                   	push   %eax
    1494:	e8 f6 ee ff ff       	call   38f <close>
    1499:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    149c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    149f:	8b 40 04             	mov    0x4(%eax),%eax
    14a2:	83 ec 0c             	sub    $0xc,%esp
    14a5:	50                   	push   %eax
    14a6:	e8 11 fe ff ff       	call   12bc <runcmd>
    14ab:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    14ae:	e8 cf f8 ff ff       	call   d82 <fork1>
    14b3:	85 c0                	test   %eax,%eax
    14b5:	75 4c                	jne    1503 <runcmd+0x247>
      close(0);
    14b7:	83 ec 0c             	sub    $0xc,%esp
    14ba:	6a 00                	push   $0x0
    14bc:	e8 ce ee ff ff       	call   38f <close>
    14c1:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    14c4:	8b 45 d8             	mov    -0x28(%ebp),%eax
    14c7:	83 ec 0c             	sub    $0xc,%esp
    14ca:	50                   	push   %eax
    14cb:	e8 0f ef ff ff       	call   3df <dup>
    14d0:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    14d3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    14d6:	83 ec 0c             	sub    $0xc,%esp
    14d9:	50                   	push   %eax
    14da:	e8 b0 ee ff ff       	call   38f <close>
    14df:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    14e2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    14e5:	83 ec 0c             	sub    $0xc,%esp
    14e8:	50                   	push   %eax
    14e9:	e8 a1 ee ff ff       	call   38f <close>
    14ee:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    14f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    14f4:	8b 40 08             	mov    0x8(%eax),%eax
    14f7:	83 ec 0c             	sub    $0xc,%esp
    14fa:	50                   	push   %eax
    14fb:	e8 bc fd ff ff       	call   12bc <runcmd>
    1500:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    1503:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1506:	83 ec 0c             	sub    $0xc,%esp
    1509:	50                   	push   %eax
    150a:	e8 80 ee ff ff       	call   38f <close>
    150f:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    1512:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1515:	83 ec 0c             	sub    $0xc,%esp
    1518:	50                   	push   %eax
    1519:	e8 71 ee ff ff       	call   38f <close>
    151e:	83 c4 10             	add    $0x10,%esp
    wait();
    1521:	e8 49 ee ff ff       	call   36f <wait>
    wait();
    1526:	e8 44 ee ff ff       	call   36f <wait>
    break;
    152b:	eb 22                	jmp    154f <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    152d:	8b 45 08             	mov    0x8(%ebp),%eax
    1530:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    1533:	e8 4a f8 ff ff       	call   d82 <fork1>
    1538:	85 c0                	test   %eax,%eax
    153a:	75 12                	jne    154e <runcmd+0x292>
      runcmd(bcmd->cmd);
    153c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    153f:	8b 40 04             	mov    0x4(%eax),%eax
    1542:	83 ec 0c             	sub    $0xc,%esp
    1545:	50                   	push   %eax
    1546:	e8 71 fd ff ff       	call   12bc <runcmd>
    154b:	83 c4 10             	add    $0x10,%esp
    break;
    154e:	90                   	nop
  }
  exit();
    154f:	e8 13 ee ff ff       	call   367 <exit>

00001554 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    1554:	55                   	push   %ebp
    1555:	89 e5                	mov    %esp,%ebp
    1557:	83 ec 04             	sub    $0x4,%esp
    155a:	8b 45 08             	mov    0x8(%ebp),%eax
    155d:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    1560:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    1564:	7e 0d                	jle    1573 <isNameChar+0x1f>
    1566:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    156a:	7f 07                	jg     1573 <isNameChar+0x1f>
    return 1;
    156c:	b8 01 00 00 00       	mov    $0x1,%eax
    1571:	eb 38                	jmp    15ab <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    1573:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    1577:	7e 0d                	jle    1586 <isNameChar+0x32>
    1579:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    157d:	7f 07                	jg     1586 <isNameChar+0x32>
    return 1;
    157f:	b8 01 00 00 00       	mov    $0x1,%eax
    1584:	eb 25                	jmp    15ab <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    1586:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    158a:	7e 0d                	jle    1599 <isNameChar+0x45>
    158c:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    1590:	7f 07                	jg     1599 <isNameChar+0x45>
    return 1;
    1592:	b8 01 00 00 00       	mov    $0x1,%eax
    1597:	eb 12                	jmp    15ab <isNameChar+0x57>
  if(ch == '_')
    1599:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    159d:	75 07                	jne    15a6 <isNameChar+0x52>
    return 1;
    159f:	b8 01 00 00 00       	mov    $0x1,%eax
    15a4:	eb 05                	jmp    15ab <isNameChar+0x57>
  return 0;
    15a6:	b8 00 00 00 00       	mov    $0x0,%eax
}
    15ab:	c9                   	leave  
    15ac:	c3                   	ret    

000015ad <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    15ad:	55                   	push   %ebp
    15ae:	89 e5                	mov    %esp,%ebp
    15b0:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    15b3:	8b 45 08             	mov    0x8(%ebp),%eax
    15b6:	8b 40 04             	mov    0x4(%eax),%eax
    15b9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    15bc:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    15c3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    15ca:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    15d1:	eb 1d                	jmp    15f0 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    15d3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    15d6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15d9:	01 d0                	add    %edx,%eax
    15db:	0f b6 00             	movzbl (%eax),%eax
    15de:	3c 3d                	cmp    $0x3d,%al
    15e0:	75 0a                	jne    15ec <runCalcmd+0x3f>
    {
      hasEqu++;
    15e2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    15e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    15ec:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    15f0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    15f3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15f6:	01 d0                	add    %edx,%eax
    15f8:	0f b6 00             	movzbl (%eax),%eax
    15fb:	84 c0                	test   %al,%al
    15fd:	75 d4                	jne    15d3 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    15ff:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1603:	7e 1d                	jle    1622 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    1605:	83 ec 0c             	sub    $0xc,%esp
    1608:	68 94 37 00 00       	push   $0x3794
    160d:	6a 00                	push   $0x0
    160f:	6a 00                	push   $0x0
    1611:	6a 01                	push   $0x1
    1613:	6a 04                	push   $0x4
    1615:	e8 21 17 00 00       	call   2d3b <color_printf>
    161a:	83 c4 20             	add    $0x20,%esp
    161d:	e9 78 05 00 00       	jmp    1b9a <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    1622:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1626:	0f 85 26 05 00 00    	jne    1b52 <runCalcmd+0x5a5>
  {
    int i=0;
    162c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    1633:	eb 04                	jmp    1639 <runCalcmd+0x8c>
    {
      i++;
    1635:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    1639:	8b 55 e8             	mov    -0x18(%ebp),%edx
    163c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    163f:	01 d0                	add    %edx,%eax
    1641:	0f b6 00             	movzbl (%eax),%eax
    1644:	3c 20                	cmp    $0x20,%al
    1646:	74 ed                	je     1635 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    1648:	8b 45 e8             	mov    -0x18(%ebp),%eax
    164b:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    164e:	eb 23                	jmp    1673 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    1650:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1653:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1656:	01 d0                	add    %edx,%eax
    1658:	0f b6 00             	movzbl (%eax),%eax
    165b:	0f be c0             	movsbl %al,%eax
    165e:	83 ec 0c             	sub    $0xc,%esp
    1661:	50                   	push   %eax
    1662:	e8 ed fe ff ff       	call   1554 <isNameChar>
    1667:	83 c4 10             	add    $0x10,%esp
    166a:	83 f8 01             	cmp    $0x1,%eax
    166d:	75 0e                	jne    167d <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    166f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1673:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1676:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1679:	7c d5                	jl     1650 <runCalcmd+0xa3>
    167b:	eb 01                	jmp    167e <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    167d:	90                   	nop
    }
    int len = i-startIndex;
    167e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1681:	2b 45 d0             	sub    -0x30(%ebp),%eax
    1684:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    1687:	eb 04                	jmp    168d <runCalcmd+0xe0>
    {
      i++;
    1689:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    168d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1690:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1693:	01 d0                	add    %edx,%eax
    1695:	0f b6 00             	movzbl (%eax),%eax
    1698:	3c 20                	cmp    $0x20,%al
    169a:	74 ed                	je     1689 <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    169c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    169f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    16a2:	0f 85 90 04 00 00    	jne    1b38 <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    16a8:	8b 55 d0             	mov    -0x30(%ebp),%edx
    16ab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16ae:	01 d0                	add    %edx,%eax
    16b0:	0f b6 00             	movzbl (%eax),%eax
    16b3:	3c 2f                	cmp    $0x2f,%al
    16b5:	7e 2c                	jle    16e3 <runCalcmd+0x136>
    16b7:	8b 55 d0             	mov    -0x30(%ebp),%edx
    16ba:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16bd:	01 d0                	add    %edx,%eax
    16bf:	0f b6 00             	movzbl (%eax),%eax
    16c2:	3c 39                	cmp    $0x39,%al
    16c4:	7f 1d                	jg     16e3 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    16c6:	83 ec 0c             	sub    $0xc,%esp
    16c9:	68 b0 37 00 00       	push   $0x37b0
    16ce:	6a 00                	push   $0x0
    16d0:	6a 00                	push   $0x0
    16d2:	6a 01                	push   $0x1
    16d4:	6a 04                	push   $0x4
    16d6:	e8 60 16 00 00       	call   2d3b <color_printf>
    16db:	83 c4 20             	add    $0x20,%esp
    16de:	e9 b7 04 00 00       	jmp    1b9a <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    16e3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    16ea:	eb 20                	jmp    170c <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    16ec:	8b 55 d0             	mov    -0x30(%ebp),%edx
    16ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16f2:	01 d0                	add    %edx,%eax
    16f4:	89 c2                	mov    %eax,%edx
    16f6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16f9:	01 d0                	add    %edx,%eax
    16fb:	0f b6 00             	movzbl (%eax),%eax
    16fe:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1701:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1704:	01 ca                	add    %ecx,%edx
    1706:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1708:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    170c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    170f:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1712:	7c d8                	jl     16ec <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1714:	8d 55 94             	lea    -0x6c(%ebp),%edx
    1717:	8b 45 cc             	mov    -0x34(%ebp),%eax
    171a:	01 d0                	add    %edx,%eax
    171c:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    171f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1722:	83 c0 01             	add    $0x1,%eax
    1725:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    1728:	eb 04                	jmp    172e <runCalcmd+0x181>
        {
          i++;
    172a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    172e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1731:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1734:	01 d0                	add    %edx,%eax
    1736:	0f b6 00             	movzbl (%eax),%eax
    1739:	3c 20                	cmp    $0x20,%al
    173b:	74 ed                	je     172a <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    173d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1740:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1743:	01 d0                	add    %edx,%eax
    1745:	0f b6 00             	movzbl (%eax),%eax
    1748:	3c 60                	cmp    $0x60,%al
    174a:	0f 85 e6 01 00 00    	jne    1936 <runCalcmd+0x389>
        {
          i++;
    1750:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    1754:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1757:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    175a:	eb 04                	jmp    1760 <runCalcmd+0x1b3>
          {
            i++;
    175c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    1760:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1763:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1766:	01 d0                	add    %edx,%eax
    1768:	0f b6 00             	movzbl (%eax),%eax
    176b:	3c 60                	cmp    $0x60,%al
    176d:	74 0f                	je     177e <runCalcmd+0x1d1>
    176f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1772:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1775:	01 d0                	add    %edx,%eax
    1777:	0f b6 00             	movzbl (%eax),%eax
    177a:	84 c0                	test   %al,%al
    177c:	75 de                	jne    175c <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    177e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1781:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1784:	01 d0                	add    %edx,%eax
    1786:	0f b6 00             	movzbl (%eax),%eax
    1789:	3c 60                	cmp    $0x60,%al
    178b:	0f 85 5c 01 00 00    	jne    18ed <runCalcmd+0x340>
    1791:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1794:	8d 50 01             	lea    0x1(%eax),%edx
    1797:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    179a:	01 d0                	add    %edx,%eax
    179c:	0f b6 00             	movzbl (%eax),%eax
    179f:	84 c0                	test   %al,%al
    17a1:	0f 85 46 01 00 00    	jne    18ed <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    17a7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    17aa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17ad:	01 d0                	add    %edx,%eax
    17af:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    17b2:	8b 55 c8             	mov    -0x38(%ebp),%edx
    17b5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17b8:	01 d0                	add    %edx,%eax
    17ba:	83 ec 0c             	sub    $0xc,%esp
    17bd:	50                   	push   %eax
    17be:	e8 c5 04 00 00       	call   1c88 <Compute>
    17c3:	83 c4 10             	add    $0x10,%esp
    17c6:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    17c9:	dd 05 20 39 00 00    	fldl   0x3920
    17cf:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    17d3:	dd 1c 24             	fstpl  (%esp)
    17d6:	ff 75 c4             	pushl  -0x3c(%ebp)
    17d9:	ff 75 c0             	pushl  -0x40(%ebp)
    17dc:	e8 30 f8 ff ff       	call   1011 <isEqual>
    17e1:	83 c4 10             	add    $0x10,%esp
    17e4:	85 c0                	test   %eax,%eax
    17e6:	0f 85 ad 03 00 00    	jne    1b99 <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    17ec:	a1 6c 44 00 00       	mov    0x446c,%eax
    17f1:	85 c0                	test   %eax,%eax
    17f3:	75 15                	jne    180a <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    17f5:	83 ec 08             	sub    $0x8,%esp
    17f8:	68 6c 44 00 00       	push   $0x446c
    17fd:	68 a0 44 00 00       	push   $0x44a0
    1802:	e8 ba 19 00 00       	call   31c1 <readVariables>
    1807:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    180a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1811:	eb 26                	jmp    1839 <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1813:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1816:	c1 e0 05             	shl    $0x5,%eax
    1819:	05 a0 44 00 00       	add    $0x44a0,%eax
    181e:	8d 50 04             	lea    0x4(%eax),%edx
    1821:	83 ec 08             	sub    $0x8,%esp
    1824:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1827:	50                   	push   %eax
    1828:	52                   	push   %edx
    1829:	e8 38 e9 ff ff       	call   166 <strcmp>
    182e:	83 c4 10             	add    $0x10,%esp
    1831:	85 c0                	test   %eax,%eax
    1833:	74 10                	je     1845 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1835:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    1839:	a1 6c 44 00 00       	mov    0x446c,%eax
    183e:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1841:	7c d0                	jl     1813 <runCalcmd+0x266>
    1843:	eb 01                	jmp    1846 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1845:	90                   	nop
              }
              if(index == v_num) //new variable
    1846:	a1 6c 44 00 00       	mov    0x446c,%eax
    184b:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    184e:	75 3c                	jne    188c <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    1850:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1853:	c1 e0 05             	shl    $0x5,%eax
    1856:	05 a0 44 00 00       	add    $0x44a0,%eax
    185b:	8d 50 04             	lea    0x4(%eax),%edx
    185e:	83 ec 08             	sub    $0x8,%esp
    1861:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1864:	50                   	push   %eax
    1865:	52                   	push   %edx
    1866:	e8 cb e8 ff ff       	call   136 <strcpy>
    186b:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    186e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1871:	c1 e0 05             	shl    $0x5,%eax
    1874:	05 a0 44 00 00       	add    $0x44a0,%eax
    1879:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    187f:	a1 6c 44 00 00       	mov    0x446c,%eax
    1884:	83 c0 01             	add    $0x1,%eax
    1887:	a3 6c 44 00 00       	mov    %eax,0x446c
              }
              variables[index].value.dvalue = result;
    188c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    188f:	c1 e0 05             	shl    $0x5,%eax
    1892:	05 b0 44 00 00       	add    $0x44b0,%eax
    1897:	dd 45 c0             	fldl   -0x40(%ebp)
    189a:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    189d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    18a0:	c1 e0 05             	shl    $0x5,%eax
    18a3:	05 b0 44 00 00       	add    $0x44b0,%eax
    18a8:	dd 40 08             	fldl   0x8(%eax)
    18ab:	8b 45 dc             	mov    -0x24(%ebp),%eax
    18ae:	c1 e0 05             	shl    $0x5,%eax
    18b1:	05 a0 44 00 00       	add    $0x44a0,%eax
    18b6:	83 c0 04             	add    $0x4,%eax
    18b9:	83 ec 0c             	sub    $0xc,%esp
    18bc:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    18c0:	dd 1c 24             	fstpl  (%esp)
    18c3:	50                   	push   %eax
    18c4:	68 da 37 00 00       	push   $0x37da
    18c9:	6a 01                	push   $0x1
    18cb:	e8 43 ed ff ff       	call   613 <printf>
    18d0:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    18d3:	83 ec 08             	sub    $0x8,%esp
    18d6:	68 6c 44 00 00       	push   $0x446c
    18db:	68 a0 44 00 00       	push   $0x44a0
    18e0:	e8 90 1b 00 00       	call   3475 <writeVariables>
    18e5:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    18e8:	e9 ac 02 00 00       	jmp    1b99 <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    18ed:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18f3:	01 d0                	add    %edx,%eax
    18f5:	0f b6 00             	movzbl (%eax),%eax
    18f8:	84 c0                	test   %al,%al
    18fa:	75 1d                	jne    1919 <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    18fc:	83 ec 0c             	sub    $0xc,%esp
    18ff:	68 e1 37 00 00       	push   $0x37e1
    1904:	6a 00                	push   $0x0
    1906:	6a 00                	push   $0x0
    1908:	6a 01                	push   $0x1
    190a:	6a 04                	push   $0x4
    190c:	e8 2a 14 00 00       	call   2d3b <color_printf>
    1911:	83 c4 20             	add    $0x20,%esp
    1914:	e9 81 02 00 00       	jmp    1b9a <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    1919:	83 ec 0c             	sub    $0xc,%esp
    191c:	68 f8 37 00 00       	push   $0x37f8
    1921:	6a 00                	push   $0x0
    1923:	6a 00                	push   $0x0
    1925:	6a 01                	push   $0x1
    1927:	6a 04                	push   $0x4
    1929:	e8 0d 14 00 00       	call   2d3b <color_printf>
    192e:	83 c4 20             	add    $0x20,%esp
    1931:	e9 64 02 00 00       	jmp    1b9a <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1936:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1939:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    193c:	01 d0                	add    %edx,%eax
    193e:	0f b6 00             	movzbl (%eax),%eax
    1941:	3c 22                	cmp    $0x22,%al
    1943:	0f 85 d5 01 00 00    	jne    1b1e <runCalcmd+0x571>
        {
          i++;
    1949:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    194d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1950:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1953:	eb 04                	jmp    1959 <runCalcmd+0x3ac>
          {
            i++;
    1955:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1959:	8b 55 e0             	mov    -0x20(%ebp),%edx
    195c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    195f:	01 d0                	add    %edx,%eax
    1961:	0f b6 00             	movzbl (%eax),%eax
    1964:	3c 22                	cmp    $0x22,%al
    1966:	74 0f                	je     1977 <runCalcmd+0x3ca>
    1968:	8b 55 e0             	mov    -0x20(%ebp),%edx
    196b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    196e:	01 d0                	add    %edx,%eax
    1970:	0f b6 00             	movzbl (%eax),%eax
    1973:	84 c0                	test   %al,%al
    1975:	75 de                	jne    1955 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1977:	8b 55 e0             	mov    -0x20(%ebp),%edx
    197a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    197d:	01 d0                	add    %edx,%eax
    197f:	0f b6 00             	movzbl (%eax),%eax
    1982:	3c 22                	cmp    $0x22,%al
    1984:	0f 85 4e 01 00 00    	jne    1ad8 <runCalcmd+0x52b>
    198a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    198d:	8d 50 01             	lea    0x1(%eax),%edx
    1990:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1993:	01 d0                	add    %edx,%eax
    1995:	0f b6 00             	movzbl (%eax),%eax
    1998:	84 c0                	test   %al,%al
    199a:	0f 85 38 01 00 00    	jne    1ad8 <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    19a0:	a1 6c 44 00 00       	mov    0x446c,%eax
    19a5:	85 c0                	test   %eax,%eax
    19a7:	75 15                	jne    19be <runCalcmd+0x411>
              readVariables(variables,&v_num);
    19a9:	83 ec 08             	sub    $0x8,%esp
    19ac:	68 6c 44 00 00       	push   $0x446c
    19b1:	68 a0 44 00 00       	push   $0x44a0
    19b6:	e8 06 18 00 00       	call   31c1 <readVariables>
    19bb:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    19be:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    19c5:	eb 26                	jmp    19ed <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    19c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    19ca:	c1 e0 05             	shl    $0x5,%eax
    19cd:	05 a0 44 00 00       	add    $0x44a0,%eax
    19d2:	8d 50 04             	lea    0x4(%eax),%edx
    19d5:	83 ec 08             	sub    $0x8,%esp
    19d8:	8d 45 94             	lea    -0x6c(%ebp),%eax
    19db:	50                   	push   %eax
    19dc:	52                   	push   %edx
    19dd:	e8 84 e7 ff ff       	call   166 <strcmp>
    19e2:	83 c4 10             	add    $0x10,%esp
    19e5:	85 c0                	test   %eax,%eax
    19e7:	74 10                	je     19f9 <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    19e9:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    19ed:	a1 6c 44 00 00       	mov    0x446c,%eax
    19f2:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    19f5:	7c d0                	jl     19c7 <runCalcmd+0x41a>
    19f7:	eb 01                	jmp    19fa <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    19f9:	90                   	nop
            }
            if(index == v_num) //new variable
    19fa:	a1 6c 44 00 00       	mov    0x446c,%eax
    19ff:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1a02:	75 2b                	jne    1a2f <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1a04:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a07:	c1 e0 05             	shl    $0x5,%eax
    1a0a:	05 a0 44 00 00       	add    $0x44a0,%eax
    1a0f:	8d 50 04             	lea    0x4(%eax),%edx
    1a12:	83 ec 08             	sub    $0x8,%esp
    1a15:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1a18:	50                   	push   %eax
    1a19:	52                   	push   %edx
    1a1a:	e8 17 e7 ff ff       	call   136 <strcpy>
    1a1f:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1a22:	a1 6c 44 00 00       	mov    0x446c,%eax
    1a27:	83 c0 01             	add    $0x1,%eax
    1a2a:	a3 6c 44 00 00       	mov    %eax,0x446c
            }
            variables[index].type = V_STRING;
    1a2f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a32:	c1 e0 05             	shl    $0x5,%eax
    1a35:	05 a0 44 00 00       	add    $0x44a0,%eax
    1a3a:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1a40:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1a43:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1a46:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1a49:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1a4c:	83 c0 01             	add    $0x1,%eax
    1a4f:	83 ec 0c             	sub    $0xc,%esp
    1a52:	50                   	push   %eax
    1a53:	e8 bd ee ff ff       	call   915 <malloc>
    1a58:	83 c4 10             	add    $0x10,%esp
    1a5b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1a5e:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1a61:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a64:	01 d0                	add    %edx,%eax
    1a66:	83 ec 08             	sub    $0x8,%esp
    1a69:	50                   	push   %eax
    1a6a:	ff 75 b4             	pushl  -0x4c(%ebp)
    1a6d:	e8 c4 e6 ff ff       	call   136 <strcpy>
    1a72:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1a75:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1a78:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1a7b:	01 d0                	add    %edx,%eax
    1a7d:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1a80:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a83:	c1 e0 05             	shl    $0x5,%eax
    1a86:	8d 90 b8 44 00 00    	lea    0x44b8(%eax),%edx
    1a8c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1a8f:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1a91:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1a94:	c1 e0 05             	shl    $0x5,%eax
    1a97:	05 b8 44 00 00       	add    $0x44b8,%eax
    1a9c:	8b 00                	mov    (%eax),%eax
    1a9e:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1aa1:	c1 e2 05             	shl    $0x5,%edx
    1aa4:	81 c2 a0 44 00 00    	add    $0x44a0,%edx
    1aaa:	83 c2 04             	add    $0x4,%edx
    1aad:	50                   	push   %eax
    1aae:	52                   	push   %edx
    1aaf:	68 19 38 00 00       	push   $0x3819
    1ab4:	6a 01                	push   $0x1
    1ab6:	e8 58 eb ff ff       	call   613 <printf>
    1abb:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1abe:	83 ec 08             	sub    $0x8,%esp
    1ac1:	68 6c 44 00 00       	push   $0x446c
    1ac6:	68 a0 44 00 00       	push   $0x44a0
    1acb:	e8 a5 19 00 00       	call   3475 <writeVariables>
    1ad0:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1ad3:	e9 c2 00 00 00       	jmp    1b9a <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1ad8:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1adb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1ade:	01 d0                	add    %edx,%eax
    1ae0:	0f b6 00             	movzbl (%eax),%eax
    1ae3:	84 c0                	test   %al,%al
    1ae5:	75 1d                	jne    1b04 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1ae7:	83 ec 0c             	sub    $0xc,%esp
    1aea:	68 22 38 00 00       	push   $0x3822
    1aef:	6a 00                	push   $0x0
    1af1:	6a 00                	push   $0x0
    1af3:	6a 01                	push   $0x1
    1af5:	6a 04                	push   $0x4
    1af7:	e8 3f 12 00 00       	call   2d3b <color_printf>
    1afc:	83 c4 20             	add    $0x20,%esp
    1aff:	e9 96 00 00 00       	jmp    1b9a <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1b04:	83 ec 0c             	sub    $0xc,%esp
    1b07:	68 38 38 00 00       	push   $0x3838
    1b0c:	6a 00                	push   $0x0
    1b0e:	6a 00                	push   $0x0
    1b10:	6a 01                	push   $0x1
    1b12:	6a 04                	push   $0x4
    1b14:	e8 22 12 00 00       	call   2d3b <color_printf>
    1b19:	83 c4 20             	add    $0x20,%esp
    1b1c:	eb 7c                	jmp    1b9a <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1b1e:	83 ec 0c             	sub    $0xc,%esp
    1b21:	68 59 38 00 00       	push   $0x3859
    1b26:	6a 00                	push   $0x0
    1b28:	6a 00                	push   $0x0
    1b2a:	6a 01                	push   $0x1
    1b2c:	6a 04                	push   $0x4
    1b2e:	e8 08 12 00 00       	call   2d3b <color_printf>
    1b33:	83 c4 20             	add    $0x20,%esp
    1b36:	eb 62                	jmp    1b9a <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1b38:	83 ec 0c             	sub    $0xc,%esp
    1b3b:	68 59 38 00 00       	push   $0x3859
    1b40:	6a 00                	push   $0x0
    1b42:	6a 00                	push   $0x0
    1b44:	6a 01                	push   $0x1
    1b46:	6a 04                	push   $0x4
    1b48:	e8 ee 11 00 00       	call   2d3b <color_printf>
    1b4d:	83 c4 20             	add    $0x20,%esp
    1b50:	eb 48                	jmp    1b9a <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1b52:	83 ec 0c             	sub    $0xc,%esp
    1b55:	ff 75 d4             	pushl  -0x2c(%ebp)
    1b58:	e8 2b 01 00 00       	call   1c88 <Compute>
    1b5d:	83 c4 10             	add    $0x10,%esp
    1b60:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1b63:	dd 05 20 39 00 00    	fldl   0x3920
    1b69:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1b6d:	dd 1c 24             	fstpl  (%esp)
    1b70:	ff 75 ac             	pushl  -0x54(%ebp)
    1b73:	ff 75 a8             	pushl  -0x58(%ebp)
    1b76:	e8 96 f4 ff ff       	call   1011 <isEqual>
    1b7b:	83 c4 10             	add    $0x10,%esp
    1b7e:	85 c0                	test   %eax,%eax
    1b80:	75 18                	jne    1b9a <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1b82:	ff 75 ac             	pushl  -0x54(%ebp)
    1b85:	ff 75 a8             	pushl  -0x58(%ebp)
    1b88:	68 71 38 00 00       	push   $0x3871
    1b8d:	6a 01                	push   $0x1
    1b8f:	e8 7f ea ff ff       	call   613 <printf>
    1b94:	83 c4 10             	add    $0x10,%esp
    1b97:	eb 01                	jmp    1b9a <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1b99:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1b9a:	e8 c8 e7 ff ff       	call   367 <exit>

00001b9f <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1b9f:	55                   	push   %ebp
    1ba0:	89 e5                	mov    %esp,%ebp
    1ba2:	83 ec 04             	sub    $0x4,%esp
    1ba5:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba8:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1bab:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1baf:	83 e8 23             	sub    $0x23,%eax
    1bb2:	83 f8 0c             	cmp    $0xc,%eax
    1bb5:	77 25                	ja     1bdc <GetLevel+0x3d>
    1bb7:	8b 04 85 78 38 00 00 	mov    0x3878(,%eax,4),%eax
    1bbe:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1bc0:	b8 01 00 00 00       	mov    $0x1,%eax
    1bc5:	eb 1a                	jmp    1be1 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1bc7:	b8 02 00 00 00       	mov    $0x2,%eax
    1bcc:	eb 13                	jmp    1be1 <GetLevel+0x42>
    case '(':
        return 0;
    1bce:	b8 00 00 00 00       	mov    $0x0,%eax
    1bd3:	eb 0c                	jmp    1be1 <GetLevel+0x42>
    case '#':
        return -2;
    1bd5:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1bda:	eb 05                	jmp    1be1 <GetLevel+0x42>
    };
    return -1;
    1bdc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1be1:	c9                   	leave  
    1be2:	c3                   	ret    

00001be3 <Operate>:

double Operate(double a1, char op, double a2)
{
    1be3:	55                   	push   %ebp
    1be4:	89 e5                	mov    %esp,%ebp
    1be6:	83 ec 28             	sub    $0x28,%esp
    1be9:	8b 45 10             	mov    0x10(%ebp),%eax
    1bec:	8b 55 08             	mov    0x8(%ebp),%edx
    1bef:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1bf2:	8b 55 0c             	mov    0xc(%ebp),%edx
    1bf5:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1bf8:	88 45 ec             	mov    %al,-0x14(%ebp)
    1bfb:	8b 45 14             	mov    0x14(%ebp),%eax
    1bfe:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1c01:	8b 45 18             	mov    0x18(%ebp),%eax
    1c04:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1c07:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1c0b:	83 f8 2b             	cmp    $0x2b,%eax
    1c0e:	74 18                	je     1c28 <Operate+0x45>
    1c10:	83 f8 2b             	cmp    $0x2b,%eax
    1c13:	7f 07                	jg     1c1c <Operate+0x39>
    1c15:	83 f8 2a             	cmp    $0x2a,%eax
    1c18:	74 1e                	je     1c38 <Operate+0x55>
    1c1a:	eb 68                	jmp    1c84 <Operate+0xa1>
    1c1c:	83 f8 2d             	cmp    $0x2d,%eax
    1c1f:	74 0f                	je     1c30 <Operate+0x4d>
    1c21:	83 f8 2f             	cmp    $0x2f,%eax
    1c24:	74 1a                	je     1c40 <Operate+0x5d>
    1c26:	eb 5c                	jmp    1c84 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1c28:	dd 45 f0             	fldl   -0x10(%ebp)
    1c2b:	dc 45 e0             	faddl  -0x20(%ebp)
    1c2e:	eb 56                	jmp    1c86 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1c30:	dd 45 f0             	fldl   -0x10(%ebp)
    1c33:	dc 65 e0             	fsubl  -0x20(%ebp)
    1c36:	eb 4e                	jmp    1c86 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1c38:	dd 45 f0             	fldl   -0x10(%ebp)
    1c3b:	dc 4d e0             	fmull  -0x20(%ebp)
    1c3e:	eb 46                	jmp    1c86 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1c40:	d9 ee                	fldz   
    1c42:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1c46:	dd 1c 24             	fstpl  (%esp)
    1c49:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c4c:	ff 75 e0             	pushl  -0x20(%ebp)
    1c4f:	e8 bd f3 ff ff       	call   1011 <isEqual>
    1c54:	83 c4 10             	add    $0x10,%esp
    1c57:	83 f8 01             	cmp    $0x1,%eax
    1c5a:	75 20                	jne    1c7c <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1c5c:	83 ec 0c             	sub    $0xc,%esp
    1c5f:	68 ac 38 00 00       	push   $0x38ac
    1c64:	6a 00                	push   $0x0
    1c66:	6a 00                	push   $0x0
    1c68:	6a 01                	push   $0x1
    1c6a:	6a 04                	push   $0x4
    1c6c:	e8 ca 10 00 00       	call   2d3b <color_printf>
    1c71:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1c74:	dd 05 20 39 00 00    	fldl   0x3920
    1c7a:	eb 0a                	jmp    1c86 <Operate+0xa3>
        }
        else
          return a1 / a2;
    1c7c:	dd 45 f0             	fldl   -0x10(%ebp)
    1c7f:	dc 75 e0             	fdivl  -0x20(%ebp)
    1c82:	eb 02                	jmp    1c86 <Operate+0xa3>
    };
    return 1;
    1c84:	d9 e8                	fld1   
}
    1c86:	c9                   	leave  
    1c87:	c3                   	ret    

00001c88 <Compute>:

double Compute(char *s)
{
    1c88:	55                   	push   %ebp
    1c89:	89 e5                	mov    %esp,%ebp
    1c8b:	53                   	push   %ebx
    1c8c:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1c92:	e8 44 14 00 00       	call   30db <dstack>
    1c97:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1c9a:	e8 73 13 00 00       	call   3012 <cstack>
    1c9f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1ca2:	83 ec 08             	sub    $0x8,%esp
    1ca5:	6a 23                	push   $0x23
    1ca7:	ff 75 e0             	pushl  -0x20(%ebp)
    1caa:	e8 91 13 00 00       	call   3040 <pushc>
    1caf:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1cb2:	83 ec 0c             	sub    $0xc,%esp
    1cb5:	ff 75 08             	pushl  0x8(%ebp)
    1cb8:	e8 e8 e4 ff ff       	call   1a5 <strlen>
    1cbd:	83 c4 10             	add    $0x10,%esp
    1cc0:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1cc3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1cca:	c7 05 80 44 00 00 00 	movl   $0x0,0x4480
    1cd1:	00 00 00 
    1cd4:	e9 58 05 00 00       	jmp    2231 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1cd9:	a1 80 44 00 00       	mov    0x4480,%eax
    1cde:	89 c2                	mov    %eax,%edx
    1ce0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce3:	01 d0                	add    %edx,%eax
    1ce5:	0f b6 00             	movzbl (%eax),%eax
    1ce8:	3c 24                	cmp    $0x24,%al
    1cea:	0f 85 f8 01 00 00    	jne    1ee8 <Compute+0x260>
        {
          is_minus = 0;
    1cf0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1cf7:	a1 80 44 00 00       	mov    0x4480,%eax
    1cfc:	83 c0 01             	add    $0x1,%eax
    1cff:	a3 80 44 00 00       	mov    %eax,0x4480
          if(s[g_pos] != '{')
    1d04:	a1 80 44 00 00       	mov    0x4480,%eax
    1d09:	89 c2                	mov    %eax,%edx
    1d0b:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0e:	01 d0                	add    %edx,%eax
    1d10:	0f b6 00             	movzbl (%eax),%eax
    1d13:	3c 7b                	cmp    $0x7b,%al
    1d15:	74 23                	je     1d3a <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1d17:	83 ec 0c             	sub    $0xc,%esp
    1d1a:	68 c4 38 00 00       	push   $0x38c4
    1d1f:	6a 00                	push   $0x0
    1d21:	6a 00                	push   $0x0
    1d23:	6a 01                	push   $0x1
    1d25:	6a 04                	push   $0x4
    1d27:	e8 0f 10 00 00       	call   2d3b <color_printf>
    1d2c:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1d2f:	dd 05 20 39 00 00    	fldl   0x3920
    1d35:	e9 24 06 00 00       	jmp    235e <Compute+0x6d6>
          }
          int i=g_pos+1;
    1d3a:	a1 80 44 00 00       	mov    0x4480,%eax
    1d3f:	83 c0 01             	add    $0x1,%eax
    1d42:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1d45:	eb 13                	jmp    1d5a <Compute+0xd2>
          {
            if(s[i] == '}')
    1d47:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d4a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d4d:	01 d0                	add    %edx,%eax
    1d4f:	0f b6 00             	movzbl (%eax),%eax
    1d52:	3c 7d                	cmp    $0x7d,%al
    1d54:	74 0e                	je     1d64 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1d56:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1d5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d5d:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1d60:	7c e5                	jl     1d47 <Compute+0xbf>
    1d62:	eb 01                	jmp    1d65 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1d64:	90                   	nop
          }
          if(s[i] != '}')
    1d65:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d68:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6b:	01 d0                	add    %edx,%eax
    1d6d:	0f b6 00             	movzbl (%eax),%eax
    1d70:	3c 7d                	cmp    $0x7d,%al
    1d72:	74 23                	je     1d97 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1d74:	83 ec 0c             	sub    $0xc,%esp
    1d77:	68 d2 38 00 00       	push   $0x38d2
    1d7c:	6a 00                	push   $0x0
    1d7e:	6a 00                	push   $0x0
    1d80:	6a 01                	push   $0x1
    1d82:	6a 04                	push   $0x4
    1d84:	e8 b2 0f 00 00       	call   2d3b <color_printf>
    1d89:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1d8c:	dd 05 20 39 00 00    	fldl   0x3920
    1d92:	e9 c7 05 00 00       	jmp    235e <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1d97:	a1 80 44 00 00       	mov    0x4480,%eax
    1d9c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d9f:	29 c2                	sub    %eax,%edx
    1da1:	89 d0                	mov    %edx,%eax
    1da3:	83 e8 01             	sub    $0x1,%eax
    1da6:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1da9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1db0:	eb 27                	jmp    1dd9 <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1db2:	8b 15 80 44 00 00    	mov    0x4480,%edx
    1db8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1dbb:	01 d0                	add    %edx,%eax
    1dbd:	8d 50 01             	lea    0x1(%eax),%edx
    1dc0:	8b 45 08             	mov    0x8(%ebp),%eax
    1dc3:	01 d0                	add    %edx,%eax
    1dc5:	0f b6 00             	movzbl (%eax),%eax
    1dc8:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1dce:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1dd1:	01 ca                	add    %ecx,%edx
    1dd3:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1dd5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1dd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ddc:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1ddf:	7c d1                	jl     1db2 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1de1:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1de7:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1dea:	01 d0                	add    %edx,%eax
    1dec:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1def:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1df6:	a1 6c 44 00 00       	mov    0x446c,%eax
    1dfb:	85 c0                	test   %eax,%eax
    1dfd:	75 40                	jne    1e3f <Compute+0x1b7>
            readVariables(variables,&v_num);
    1dff:	83 ec 08             	sub    $0x8,%esp
    1e02:	68 6c 44 00 00       	push   $0x446c
    1e07:	68 a0 44 00 00       	push   $0x44a0
    1e0c:	e8 b0 13 00 00       	call   31c1 <readVariables>
    1e11:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1e14:	eb 29                	jmp    1e3f <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1e16:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e19:	c1 e0 05             	shl    $0x5,%eax
    1e1c:	05 a0 44 00 00       	add    $0x44a0,%eax
    1e21:	8d 50 04             	lea    0x4(%eax),%edx
    1e24:	83 ec 08             	sub    $0x8,%esp
    1e27:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1e2d:	50                   	push   %eax
    1e2e:	52                   	push   %edx
    1e2f:	e8 32 e3 ff ff       	call   166 <strcmp>
    1e34:	83 c4 10             	add    $0x10,%esp
    1e37:	85 c0                	test   %eax,%eax
    1e39:	74 10                	je     1e4b <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1e3b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1e3f:	a1 6c 44 00 00       	mov    0x446c,%eax
    1e44:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1e47:	7c cd                	jl     1e16 <Compute+0x18e>
    1e49:	eb 01                	jmp    1e4c <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1e4b:	90                   	nop
          }
          if(index == v_num) //no such variable
    1e4c:	a1 6c 44 00 00       	mov    0x446c,%eax
    1e51:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1e54:	75 2a                	jne    1e80 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1e56:	83 ec 08             	sub    $0x8,%esp
    1e59:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1e5f:	50                   	push   %eax
    1e60:	68 e0 38 00 00       	push   $0x38e0
    1e65:	6a 00                	push   $0x0
    1e67:	6a 00                	push   $0x0
    1e69:	6a 01                	push   $0x1
    1e6b:	6a 04                	push   $0x4
    1e6d:	e8 c9 0e 00 00       	call   2d3b <color_printf>
    1e72:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1e75:	dd 05 20 39 00 00    	fldl   0x3920
    1e7b:	e9 de 04 00 00       	jmp    235e <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1e80:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e83:	c1 e0 05             	shl    $0x5,%eax
    1e86:	05 a0 44 00 00       	add    $0x44a0,%eax
    1e8b:	8b 00                	mov    (%eax),%eax
    1e8d:	83 f8 02             	cmp    $0x2,%eax
    1e90:	75 23                	jne    1eb5 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1e92:	83 ec 0c             	sub    $0xc,%esp
    1e95:	68 fa 38 00 00       	push   $0x38fa
    1e9a:	6a 00                	push   $0x0
    1e9c:	6a 00                	push   $0x0
    1e9e:	6a 01                	push   $0x1
    1ea0:	6a 04                	push   $0x4
    1ea2:	e8 94 0e 00 00       	call   2d3b <color_printf>
    1ea7:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1eaa:	dd 05 20 39 00 00    	fldl   0x3920
    1eb0:	e9 a9 04 00 00       	jmp    235e <Compute+0x6d6>
          }
          g_pos = i+1;
    1eb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1eb8:	83 c0 01             	add    $0x1,%eax
    1ebb:	a3 80 44 00 00       	mov    %eax,0x4480
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    1ec0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ec3:	c1 e0 05             	shl    $0x5,%eax
    1ec6:	05 b0 44 00 00       	add    $0x44b0,%eax
    1ecb:	dd 40 08             	fldl   0x8(%eax)
    1ece:	83 ec 04             	sub    $0x4,%esp
    1ed1:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1ed5:	dd 1c 24             	fstpl  (%esp)
    1ed8:	ff 75 e4             	pushl  -0x1c(%ebp)
    1edb:	e8 2f 12 00 00       	call   310f <pushd>
    1ee0:	83 c4 10             	add    $0x10,%esp
    1ee3:	e9 49 03 00 00       	jmp    2231 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    1ee8:	a1 80 44 00 00       	mov    0x4480,%eax
    1eed:	89 c2                	mov    %eax,%edx
    1eef:	8b 45 08             	mov    0x8(%ebp),%eax
    1ef2:	01 d0                	add    %edx,%eax
    1ef4:	0f b6 00             	movzbl (%eax),%eax
    1ef7:	3c 2d                	cmp    $0x2d,%al
    1ef9:	75 3f                	jne    1f3a <Compute+0x2b2>
    1efb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1eff:	74 39                	je     1f3a <Compute+0x2b2>
        {
            pushd(opnd,0);
    1f01:	83 ec 04             	sub    $0x4,%esp
    1f04:	d9 ee                	fldz   
    1f06:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1f0a:	dd 1c 24             	fstpl  (%esp)
    1f0d:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f10:	e8 fa 11 00 00       	call   310f <pushd>
    1f15:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    1f18:	83 ec 08             	sub    $0x8,%esp
    1f1b:	6a 2d                	push   $0x2d
    1f1d:	ff 75 e0             	pushl  -0x20(%ebp)
    1f20:	e8 1b 11 00 00       	call   3040 <pushc>
    1f25:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    1f28:	a1 80 44 00 00       	mov    0x4480,%eax
    1f2d:	83 c0 01             	add    $0x1,%eax
    1f30:	a3 80 44 00 00       	mov    %eax,0x4480
    1f35:	e9 f7 02 00 00       	jmp    2231 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    1f3a:	a1 80 44 00 00       	mov    0x4480,%eax
    1f3f:	89 c2                	mov    %eax,%edx
    1f41:	8b 45 08             	mov    0x8(%ebp),%eax
    1f44:	01 d0                	add    %edx,%eax
    1f46:	0f b6 00             	movzbl (%eax),%eax
    1f49:	3c 29                	cmp    $0x29,%al
    1f4b:	0f 85 01 01 00 00    	jne    2052 <Compute+0x3ca>
        {
            is_minus = 0;
    1f51:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    1f58:	a1 80 44 00 00       	mov    0x4480,%eax
    1f5d:	83 c0 01             	add    $0x1,%eax
    1f60:	a3 80 44 00 00       	mov    %eax,0x4480
            while (topc(optr) != '(')
    1f65:	e9 bf 00 00 00       	jmp    2029 <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    1f6a:	83 ec 0c             	sub    $0xc,%esp
    1f6d:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f70:	e8 37 12 00 00       	call   31ac <topd>
    1f75:	83 c4 10             	add    $0x10,%esp
    1f78:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    1f7b:	83 ec 0c             	sub    $0xc,%esp
    1f7e:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f81:	e8 dd 11 00 00       	call   3163 <popd>
    1f86:	dd d8                	fstp   %st(0)
    1f88:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    1f8b:	83 ec 0c             	sub    $0xc,%esp
    1f8e:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f91:	e8 16 12 00 00       	call   31ac <topd>
    1f96:	83 c4 10             	add    $0x10,%esp
    1f99:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    1f9c:	83 ec 0c             	sub    $0xc,%esp
    1f9f:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fa2:	e8 bc 11 00 00       	call   3163 <popd>
    1fa7:	dd d8                	fstp   %st(0)
    1fa9:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    1fac:	83 ec 0c             	sub    $0xc,%esp
    1faf:	ff 75 e0             	pushl  -0x20(%ebp)
    1fb2:	e8 11 11 00 00       	call   30c8 <topc>
    1fb7:	83 c4 10             	add    $0x10,%esp
    1fba:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    1fbd:	83 ec 0c             	sub    $0xc,%esp
    1fc0:	ff 75 e0             	pushl  -0x20(%ebp)
    1fc3:	e8 be 10 00 00       	call   3086 <popc>
    1fc8:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    1fcb:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    1fcf:	83 ec 0c             	sub    $0xc,%esp
    1fd2:	ff 75 d4             	pushl  -0x2c(%ebp)
    1fd5:	ff 75 d0             	pushl  -0x30(%ebp)
    1fd8:	50                   	push   %eax
    1fd9:	ff 75 cc             	pushl  -0x34(%ebp)
    1fdc:	ff 75 c8             	pushl  -0x38(%ebp)
    1fdf:	e8 ff fb ff ff       	call   1be3 <Operate>
    1fe4:	83 c4 20             	add    $0x20,%esp
    1fe7:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    1fea:	dd 05 20 39 00 00    	fldl   0x3920
    1ff0:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1ff4:	dd 1c 24             	fstpl  (%esp)
    1ff7:	ff 75 bc             	pushl  -0x44(%ebp)
    1ffa:	ff 75 b8             	pushl  -0x48(%ebp)
    1ffd:	e8 0f f0 ff ff       	call   1011 <isEqual>
    2002:	83 c4 10             	add    $0x10,%esp
    2005:	83 f8 01             	cmp    $0x1,%eax
    2008:	75 0b                	jne    2015 <Compute+0x38d>
                  return WRONG_ANS;
    200a:	dd 05 20 39 00 00    	fldl   0x3920
    2010:	e9 49 03 00 00       	jmp    235e <Compute+0x6d6>
                pushd(opnd,result);
    2015:	83 ec 04             	sub    $0x4,%esp
    2018:	ff 75 bc             	pushl  -0x44(%ebp)
    201b:	ff 75 b8             	pushl  -0x48(%ebp)
    201e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2021:	e8 e9 10 00 00       	call   310f <pushd>
    2026:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    2029:	83 ec 0c             	sub    $0xc,%esp
    202c:	ff 75 e0             	pushl  -0x20(%ebp)
    202f:	e8 94 10 00 00       	call   30c8 <topc>
    2034:	83 c4 10             	add    $0x10,%esp
    2037:	3c 28                	cmp    $0x28,%al
    2039:	0f 85 2b ff ff ff    	jne    1f6a <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    203f:	83 ec 0c             	sub    $0xc,%esp
    2042:	ff 75 e0             	pushl  -0x20(%ebp)
    2045:	e8 3c 10 00 00       	call   3086 <popc>
    204a:	83 c4 10             	add    $0x10,%esp
    204d:	e9 df 01 00 00       	jmp    2231 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    2052:	a1 80 44 00 00       	mov    0x4480,%eax
    2057:	89 c2                	mov    %eax,%edx
    2059:	8b 45 08             	mov    0x8(%ebp),%eax
    205c:	01 d0                	add    %edx,%eax
    205e:	0f b6 00             	movzbl (%eax),%eax
    2061:	3c 2f                	cmp    $0x2f,%al
    2063:	7e 49                	jle    20ae <Compute+0x426>
    2065:	a1 80 44 00 00       	mov    0x4480,%eax
    206a:	89 c2                	mov    %eax,%edx
    206c:	8b 45 08             	mov    0x8(%ebp),%eax
    206f:	01 d0                	add    %edx,%eax
    2071:	0f b6 00             	movzbl (%eax),%eax
    2074:	3c 39                	cmp    $0x39,%al
    2076:	7f 36                	jg     20ae <Compute+0x426>
        {
            is_minus = 0;
    2078:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    207f:	83 ec 08             	sub    $0x8,%esp
    2082:	68 80 44 00 00       	push   $0x4480
    2087:	ff 75 08             	pushl  0x8(%ebp)
    208a:	e8 c3 eb ff ff       	call   c52 <Translation>
    208f:	83 c4 10             	add    $0x10,%esp
    2092:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    2095:	83 ec 04             	sub    $0x4,%esp
    2098:	ff 75 b4             	pushl  -0x4c(%ebp)
    209b:	ff 75 b0             	pushl  -0x50(%ebp)
    209e:	ff 75 e4             	pushl  -0x1c(%ebp)
    20a1:	e8 69 10 00 00       	call   310f <pushd>
    20a6:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    20a9:	e9 83 01 00 00       	jmp    2231 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    20ae:	a1 80 44 00 00       	mov    0x4480,%eax
    20b3:	89 c2                	mov    %eax,%edx
    20b5:	8b 45 08             	mov    0x8(%ebp),%eax
    20b8:	01 d0                	add    %edx,%eax
    20ba:	0f b6 00             	movzbl (%eax),%eax
    20bd:	3c 28                	cmp    $0x28,%al
    20bf:	0f 85 f9 00 00 00    	jne    21be <Compute+0x536>
        {
            is_minus = 1;
    20c5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    20cc:	a1 80 44 00 00       	mov    0x4480,%eax
    20d1:	89 c2                	mov    %eax,%edx
    20d3:	8b 45 08             	mov    0x8(%ebp),%eax
    20d6:	01 d0                	add    %edx,%eax
    20d8:	0f b6 00             	movzbl (%eax),%eax
    20db:	0f be c0             	movsbl %al,%eax
    20de:	83 ec 08             	sub    $0x8,%esp
    20e1:	50                   	push   %eax
    20e2:	ff 75 e0             	pushl  -0x20(%ebp)
    20e5:	e8 56 0f 00 00       	call   3040 <pushc>
    20ea:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    20ed:	a1 80 44 00 00       	mov    0x4480,%eax
    20f2:	83 c0 01             	add    $0x1,%eax
    20f5:	a3 80 44 00 00       	mov    %eax,0x4480
    20fa:	e9 32 01 00 00       	jmp    2231 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    20ff:	83 ec 0c             	sub    $0xc,%esp
    2102:	ff 75 e4             	pushl  -0x1c(%ebp)
    2105:	e8 a2 10 00 00       	call   31ac <topd>
    210a:	83 c4 10             	add    $0x10,%esp
    210d:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    2110:	83 ec 0c             	sub    $0xc,%esp
    2113:	ff 75 e4             	pushl  -0x1c(%ebp)
    2116:	e8 48 10 00 00       	call   3163 <popd>
    211b:	dd d8                	fstp   %st(0)
    211d:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2120:	83 ec 0c             	sub    $0xc,%esp
    2123:	ff 75 e4             	pushl  -0x1c(%ebp)
    2126:	e8 81 10 00 00       	call   31ac <topd>
    212b:	83 c4 10             	add    $0x10,%esp
    212e:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    2131:	83 ec 0c             	sub    $0xc,%esp
    2134:	ff 75 e4             	pushl  -0x1c(%ebp)
    2137:	e8 27 10 00 00       	call   3163 <popd>
    213c:	dd d8                	fstp   %st(0)
    213e:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    2141:	83 ec 0c             	sub    $0xc,%esp
    2144:	ff 75 e0             	pushl  -0x20(%ebp)
    2147:	e8 7c 0f 00 00       	call   30c8 <topc>
    214c:	83 c4 10             	add    $0x10,%esp
    214f:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    2152:	83 ec 0c             	sub    $0xc,%esp
    2155:	ff 75 e0             	pushl  -0x20(%ebp)
    2158:	e8 29 0f 00 00       	call   3086 <popc>
    215d:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    2160:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    2164:	83 ec 0c             	sub    $0xc,%esp
    2167:	ff 75 ac             	pushl  -0x54(%ebp)
    216a:	ff 75 a8             	pushl  -0x58(%ebp)
    216d:	50                   	push   %eax
    216e:	ff 75 a4             	pushl  -0x5c(%ebp)
    2171:	ff 75 a0             	pushl  -0x60(%ebp)
    2174:	e8 6a fa ff ff       	call   1be3 <Operate>
    2179:	83 c4 20             	add    $0x20,%esp
    217c:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    217f:	dd 05 20 39 00 00    	fldl   0x3920
    2185:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2189:	dd 1c 24             	fstpl  (%esp)
    218c:	ff 75 94             	pushl  -0x6c(%ebp)
    218f:	ff 75 90             	pushl  -0x70(%ebp)
    2192:	e8 7a ee ff ff       	call   1011 <isEqual>
    2197:	83 c4 10             	add    $0x10,%esp
    219a:	83 f8 01             	cmp    $0x1,%eax
    219d:	75 0b                	jne    21aa <Compute+0x522>
                  return WRONG_ANS;
    219f:	dd 05 20 39 00 00    	fldl   0x3920
    21a5:	e9 b4 01 00 00       	jmp    235e <Compute+0x6d6>
                pushd(opnd,result);
    21aa:	83 ec 04             	sub    $0x4,%esp
    21ad:	ff 75 94             	pushl  -0x6c(%ebp)
    21b0:	ff 75 90             	pushl  -0x70(%ebp)
    21b3:	ff 75 e4             	pushl  -0x1c(%ebp)
    21b6:	e8 54 0f 00 00       	call   310f <pushd>
    21bb:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    21be:	a1 80 44 00 00       	mov    0x4480,%eax
    21c3:	89 c2                	mov    %eax,%edx
    21c5:	8b 45 08             	mov    0x8(%ebp),%eax
    21c8:	01 d0                	add    %edx,%eax
    21ca:	0f b6 00             	movzbl (%eax),%eax
    21cd:	0f be c0             	movsbl %al,%eax
    21d0:	83 ec 0c             	sub    $0xc,%esp
    21d3:	50                   	push   %eax
    21d4:	e8 c6 f9 ff ff       	call   1b9f <GetLevel>
    21d9:	83 c4 10             	add    $0x10,%esp
    21dc:	89 c3                	mov    %eax,%ebx
    21de:	83 ec 0c             	sub    $0xc,%esp
    21e1:	ff 75 e0             	pushl  -0x20(%ebp)
    21e4:	e8 df 0e 00 00       	call   30c8 <topc>
    21e9:	83 c4 10             	add    $0x10,%esp
    21ec:	0f be c0             	movsbl %al,%eax
    21ef:	83 ec 0c             	sub    $0xc,%esp
    21f2:	50                   	push   %eax
    21f3:	e8 a7 f9 ff ff       	call   1b9f <GetLevel>
    21f8:	83 c4 10             	add    $0x10,%esp
    21fb:	39 c3                	cmp    %eax,%ebx
    21fd:	0f 8e fc fe ff ff    	jle    20ff <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    2203:	a1 80 44 00 00       	mov    0x4480,%eax
    2208:	89 c2                	mov    %eax,%edx
    220a:	8b 45 08             	mov    0x8(%ebp),%eax
    220d:	01 d0                	add    %edx,%eax
    220f:	0f b6 00             	movzbl (%eax),%eax
    2212:	0f be c0             	movsbl %al,%eax
    2215:	83 ec 08             	sub    $0x8,%esp
    2218:	50                   	push   %eax
    2219:	ff 75 e0             	pushl  -0x20(%ebp)
    221c:	e8 1f 0e 00 00       	call   3040 <pushc>
    2221:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2224:	a1 80 44 00 00       	mov    0x4480,%eax
    2229:	83 c0 01             	add    $0x1,%eax
    222c:	a3 80 44 00 00       	mov    %eax,0x4480
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    2231:	a1 80 44 00 00       	mov    0x4480,%eax
    2236:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    2239:	0f 8c 9a fa ff ff    	jl     1cd9 <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    223f:	e9 da 00 00 00       	jmp    231e <Compute+0x696>
    {
        double a2 = topd(opnd);
    2244:	83 ec 0c             	sub    $0xc,%esp
    2247:	ff 75 e4             	pushl  -0x1c(%ebp)
    224a:	e8 5d 0f 00 00       	call   31ac <topd>
    224f:	83 c4 10             	add    $0x10,%esp
    2252:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    2255:	83 ec 0c             	sub    $0xc,%esp
    2258:	ff 75 e4             	pushl  -0x1c(%ebp)
    225b:	e8 03 0f 00 00       	call   3163 <popd>
    2260:	dd d8                	fstp   %st(0)
    2262:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    2265:	83 ec 0c             	sub    $0xc,%esp
    2268:	ff 75 e4             	pushl  -0x1c(%ebp)
    226b:	e8 3c 0f 00 00       	call   31ac <topd>
    2270:	83 c4 10             	add    $0x10,%esp
    2273:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    2279:	83 ec 0c             	sub    $0xc,%esp
    227c:	ff 75 e4             	pushl  -0x1c(%ebp)
    227f:	e8 df 0e 00 00       	call   3163 <popd>
    2284:	dd d8                	fstp   %st(0)
    2286:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    2289:	83 ec 0c             	sub    $0xc,%esp
    228c:	ff 75 e0             	pushl  -0x20(%ebp)
    228f:	e8 34 0e 00 00       	call   30c8 <topc>
    2294:	83 c4 10             	add    $0x10,%esp
    2297:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    229d:	83 ec 0c             	sub    $0xc,%esp
    22a0:	ff 75 e0             	pushl  -0x20(%ebp)
    22a3:	e8 de 0d 00 00       	call   3086 <popc>
    22a8:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    22ab:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    22b2:	83 ec 0c             	sub    $0xc,%esp
    22b5:	ff 75 84             	pushl  -0x7c(%ebp)
    22b8:	ff 75 80             	pushl  -0x80(%ebp)
    22bb:	50                   	push   %eax
    22bc:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    22c2:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    22c8:	e8 16 f9 ff ff       	call   1be3 <Operate>
    22cd:	83 c4 20             	add    $0x20,%esp
    22d0:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    22d6:	dd 05 20 39 00 00    	fldl   0x3920
    22dc:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    22e0:	dd 1c 24             	fstpl  (%esp)
    22e3:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    22e9:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    22ef:	e8 1d ed ff ff       	call   1011 <isEqual>
    22f4:	83 c4 10             	add    $0x10,%esp
    22f7:	83 f8 01             	cmp    $0x1,%eax
    22fa:	75 08                	jne    2304 <Compute+0x67c>
          return WRONG_ANS;
    22fc:	dd 05 20 39 00 00    	fldl   0x3920
    2302:	eb 5a                	jmp    235e <Compute+0x6d6>
        pushd(opnd,result);
    2304:	83 ec 04             	sub    $0x4,%esp
    2307:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    230d:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2313:	ff 75 e4             	pushl  -0x1c(%ebp)
    2316:	e8 f4 0d 00 00       	call   310f <pushd>
    231b:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    231e:	83 ec 0c             	sub    $0xc,%esp
    2321:	ff 75 e0             	pushl  -0x20(%ebp)
    2324:	e8 9f 0d 00 00       	call   30c8 <topc>
    2329:	83 c4 10             	add    $0x10,%esp
    232c:	3c 23                	cmp    $0x23,%al
    232e:	0f 85 10 ff ff ff    	jne    2244 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    2334:	83 ec 0c             	sub    $0xc,%esp
    2337:	ff 75 e4             	pushl  -0x1c(%ebp)
    233a:	e8 94 e4 ff ff       	call   7d3 <free>
    233f:	83 c4 10             	add    $0x10,%esp
    free(optr);
    2342:	83 ec 0c             	sub    $0xc,%esp
    2345:	ff 75 e0             	pushl  -0x20(%ebp)
    2348:	e8 86 e4 ff ff       	call   7d3 <free>
    234d:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    2350:	83 ec 0c             	sub    $0xc,%esp
    2353:	ff 75 e4             	pushl  -0x1c(%ebp)
    2356:	e8 51 0e 00 00       	call   31ac <topd>
    235b:	83 c4 10             	add    $0x10,%esp
}
    235e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2361:	c9                   	leave  
    2362:	c3                   	ret    

00002363 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    2363:	55                   	push   %ebp
    2364:	89 e5                	mov    %esp,%ebp
    2366:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    2369:	8b 45 08             	mov    0x8(%ebp),%eax
    236c:	8b 00                	mov    (%eax),%eax
    236e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2371:	eb 04                	jmp    2377 <gettoken+0x14>
    s++;
    2373:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2377:	8b 45 f4             	mov    -0xc(%ebp),%eax
    237a:	3b 45 0c             	cmp    0xc(%ebp),%eax
    237d:	73 1e                	jae    239d <gettoken+0x3a>
    237f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2382:	0f b6 00             	movzbl (%eax),%eax
    2385:	0f be c0             	movsbl %al,%eax
    2388:	83 ec 08             	sub    $0x8,%esp
    238b:	50                   	push   %eax
    238c:	68 34 44 00 00       	push   $0x4434
    2391:	e8 50 de ff ff       	call   1e6 <strchr>
    2396:	83 c4 10             	add    $0x10,%esp
    2399:	85 c0                	test   %eax,%eax
    239b:	75 d6                	jne    2373 <gettoken+0x10>
    s++;
  if(q)
    239d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    23a1:	74 08                	je     23ab <gettoken+0x48>
    *q = s;
    23a3:	8b 45 10             	mov    0x10(%ebp),%eax
    23a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    23a9:	89 10                	mov    %edx,(%eax)
  ret = *s;
    23ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23ae:	0f b6 00             	movzbl (%eax),%eax
    23b1:	0f be c0             	movsbl %al,%eax
    23b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    23b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23ba:	0f b6 00             	movzbl (%eax),%eax
    23bd:	0f be c0             	movsbl %al,%eax
    23c0:	83 f8 29             	cmp    $0x29,%eax
    23c3:	7f 14                	jg     23d9 <gettoken+0x76>
    23c5:	83 f8 28             	cmp    $0x28,%eax
    23c8:	7d 28                	jge    23f2 <gettoken+0x8f>
    23ca:	85 c0                	test   %eax,%eax
    23cc:	0f 84 94 00 00 00    	je     2466 <gettoken+0x103>
    23d2:	83 f8 26             	cmp    $0x26,%eax
    23d5:	74 1b                	je     23f2 <gettoken+0x8f>
    23d7:	eb 3a                	jmp    2413 <gettoken+0xb0>
    23d9:	83 f8 3e             	cmp    $0x3e,%eax
    23dc:	74 1a                	je     23f8 <gettoken+0x95>
    23de:	83 f8 3e             	cmp    $0x3e,%eax
    23e1:	7f 0a                	jg     23ed <gettoken+0x8a>
    23e3:	83 e8 3b             	sub    $0x3b,%eax
    23e6:	83 f8 01             	cmp    $0x1,%eax
    23e9:	77 28                	ja     2413 <gettoken+0xb0>
    23eb:	eb 05                	jmp    23f2 <gettoken+0x8f>
    23ed:	83 f8 7c             	cmp    $0x7c,%eax
    23f0:	75 21                	jne    2413 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    23f2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    23f6:	eb 75                	jmp    246d <gettoken+0x10a>
  case '>':
    s++;
    23f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    23fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23ff:	0f b6 00             	movzbl (%eax),%eax
    2402:	3c 3e                	cmp    $0x3e,%al
    2404:	75 63                	jne    2469 <gettoken+0x106>
      ret = '+';
    2406:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    240d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    2411:	eb 56                	jmp    2469 <gettoken+0x106>
  default:
    ret = 'a';
    2413:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    241a:	eb 04                	jmp    2420 <gettoken+0xbd>
      s++;
    241c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2420:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2423:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2426:	73 44                	jae    246c <gettoken+0x109>
    2428:	8b 45 f4             	mov    -0xc(%ebp),%eax
    242b:	0f b6 00             	movzbl (%eax),%eax
    242e:	0f be c0             	movsbl %al,%eax
    2431:	83 ec 08             	sub    $0x8,%esp
    2434:	50                   	push   %eax
    2435:	68 34 44 00 00       	push   $0x4434
    243a:	e8 a7 dd ff ff       	call   1e6 <strchr>
    243f:	83 c4 10             	add    $0x10,%esp
    2442:	85 c0                	test   %eax,%eax
    2444:	75 26                	jne    246c <gettoken+0x109>
    2446:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2449:	0f b6 00             	movzbl (%eax),%eax
    244c:	0f be c0             	movsbl %al,%eax
    244f:	83 ec 08             	sub    $0x8,%esp
    2452:	50                   	push   %eax
    2453:	68 3c 44 00 00       	push   $0x443c
    2458:	e8 89 dd ff ff       	call   1e6 <strchr>
    245d:	83 c4 10             	add    $0x10,%esp
    2460:	85 c0                	test   %eax,%eax
    2462:	74 b8                	je     241c <gettoken+0xb9>
      s++;
    break;
    2464:	eb 06                	jmp    246c <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    2466:	90                   	nop
    2467:	eb 04                	jmp    246d <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    2469:	90                   	nop
    246a:	eb 01                	jmp    246d <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    246c:	90                   	nop
  }
  if(eq)
    246d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2471:	74 0e                	je     2481 <gettoken+0x11e>
    *eq = s;
    2473:	8b 45 14             	mov    0x14(%ebp),%eax
    2476:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2479:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    247b:	eb 04                	jmp    2481 <gettoken+0x11e>
    s++;
    247d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    2481:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2484:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2487:	73 1e                	jae    24a7 <gettoken+0x144>
    2489:	8b 45 f4             	mov    -0xc(%ebp),%eax
    248c:	0f b6 00             	movzbl (%eax),%eax
    248f:	0f be c0             	movsbl %al,%eax
    2492:	83 ec 08             	sub    $0x8,%esp
    2495:	50                   	push   %eax
    2496:	68 34 44 00 00       	push   $0x4434
    249b:	e8 46 dd ff ff       	call   1e6 <strchr>
    24a0:	83 c4 10             	add    $0x10,%esp
    24a3:	85 c0                	test   %eax,%eax
    24a5:	75 d6                	jne    247d <gettoken+0x11a>
    s++;
  *ps = s;
    24a7:	8b 45 08             	mov    0x8(%ebp),%eax
    24aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
    24ad:	89 10                	mov    %edx,(%eax)
  return ret;
    24af:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    24b2:	c9                   	leave  
    24b3:	c3                   	ret    

000024b4 <peek>:

int peek(char **ps, char *es, char *toks)
{
    24b4:	55                   	push   %ebp
    24b5:	89 e5                	mov    %esp,%ebp
    24b7:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    24ba:	8b 45 08             	mov    0x8(%ebp),%eax
    24bd:	8b 00                	mov    (%eax),%eax
    24bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    24c2:	eb 04                	jmp    24c8 <peek+0x14>
    s++;
    24c4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    24c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24cb:	3b 45 0c             	cmp    0xc(%ebp),%eax
    24ce:	73 1e                	jae    24ee <peek+0x3a>
    24d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24d3:	0f b6 00             	movzbl (%eax),%eax
    24d6:	0f be c0             	movsbl %al,%eax
    24d9:	83 ec 08             	sub    $0x8,%esp
    24dc:	50                   	push   %eax
    24dd:	68 34 44 00 00       	push   $0x4434
    24e2:	e8 ff dc ff ff       	call   1e6 <strchr>
    24e7:	83 c4 10             	add    $0x10,%esp
    24ea:	85 c0                	test   %eax,%eax
    24ec:	75 d6                	jne    24c4 <peek+0x10>
    s++;
  *ps = s;
    24ee:	8b 45 08             	mov    0x8(%ebp),%eax
    24f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    24f4:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    24f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24f9:	0f b6 00             	movzbl (%eax),%eax
    24fc:	84 c0                	test   %al,%al
    24fe:	74 23                	je     2523 <peek+0x6f>
    2500:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2503:	0f b6 00             	movzbl (%eax),%eax
    2506:	0f be c0             	movsbl %al,%eax
    2509:	83 ec 08             	sub    $0x8,%esp
    250c:	50                   	push   %eax
    250d:	ff 75 10             	pushl  0x10(%ebp)
    2510:	e8 d1 dc ff ff       	call   1e6 <strchr>
    2515:	83 c4 10             	add    $0x10,%esp
    2518:	85 c0                	test   %eax,%eax
    251a:	74 07                	je     2523 <peek+0x6f>
    251c:	b8 01 00 00 00       	mov    $0x1,%eax
    2521:	eb 05                	jmp    2528 <peek+0x74>
    2523:	b8 00 00 00 00       	mov    $0x0,%eax
}
    2528:	c9                   	leave  
    2529:	c3                   	ret    

0000252a <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    252a:	55                   	push   %ebp
    252b:	89 e5                	mov    %esp,%ebp
    252d:	53                   	push   %ebx
    252e:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    2531:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2534:	8b 45 08             	mov    0x8(%ebp),%eax
    2537:	83 ec 0c             	sub    $0xc,%esp
    253a:	50                   	push   %eax
    253b:	e8 65 dc ff ff       	call   1a5 <strlen>
    2540:	83 c4 10             	add    $0x10,%esp
    2543:	01 d8                	add    %ebx,%eax
    2545:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    2548:	8b 45 08             	mov    0x8(%ebp),%eax
    254b:	0f b6 00             	movzbl (%eax),%eax
    254e:	3c 25                	cmp    $0x25,%al
    2550:	75 5d                	jne    25af <parsecmd+0x85>
  {
    int len = strlen(s);
    2552:	8b 45 08             	mov    0x8(%ebp),%eax
    2555:	83 ec 0c             	sub    $0xc,%esp
    2558:	50                   	push   %eax
    2559:	e8 47 dc ff ff       	call   1a5 <strlen>
    255e:	83 c4 10             	add    $0x10,%esp
    2561:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    2564:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2567:	83 ec 0c             	sub    $0xc,%esp
    256a:	50                   	push   %eax
    256b:	e8 a5 e3 ff ff       	call   915 <malloc>
    2570:	83 c4 10             	add    $0x10,%esp
    2573:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    2576:	8b 45 08             	mov    0x8(%ebp),%eax
    2579:	83 c0 01             	add    $0x1,%eax
    257c:	83 ec 08             	sub    $0x8,%esp
    257f:	50                   	push   %eax
    2580:	ff 75 ec             	pushl  -0x14(%ebp)
    2583:	e8 ae db ff ff       	call   136 <strcpy>
    2588:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    258b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    258e:	8d 50 fe             	lea    -0x2(%eax),%edx
    2591:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2594:	01 d0                	add    %edx,%eax
    2596:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    2599:	83 ec 0c             	sub    $0xc,%esp
    259c:	ff 75 ec             	pushl  -0x14(%ebp)
    259f:	e8 59 e9 ff ff       	call   efd <calcmd>
    25a4:	83 c4 10             	add    $0x10,%esp
    25a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    25aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    25ad:	eb 6b                	jmp    261a <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    25af:	83 ec 08             	sub    $0x8,%esp
    25b2:	ff 75 f4             	pushl  -0xc(%ebp)
    25b5:	8d 45 08             	lea    0x8(%ebp),%eax
    25b8:	50                   	push   %eax
    25b9:	e8 61 00 00 00       	call   261f <parseline>
    25be:	83 c4 10             	add    $0x10,%esp
    25c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    25c4:	83 ec 04             	sub    $0x4,%esp
    25c7:	68 28 39 00 00       	push   $0x3928
    25cc:	ff 75 f4             	pushl  -0xc(%ebp)
    25cf:	8d 45 08             	lea    0x8(%ebp),%eax
    25d2:	50                   	push   %eax
    25d3:	e8 dc fe ff ff       	call   24b4 <peek>
    25d8:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    25db:	8b 45 08             	mov    0x8(%ebp),%eax
    25de:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    25e1:	74 26                	je     2609 <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    25e3:	8b 45 08             	mov    0x8(%ebp),%eax
    25e6:	83 ec 04             	sub    $0x4,%esp
    25e9:	50                   	push   %eax
    25ea:	68 29 39 00 00       	push   $0x3929
    25ef:	6a 02                	push   $0x2
    25f1:	e8 1d e0 ff ff       	call   613 <printf>
    25f6:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    25f9:	83 ec 0c             	sub    $0xc,%esp
    25fc:	68 38 39 00 00       	push   $0x3938
    2601:	e8 f2 e3 ff ff       	call   9f8 <panic1>
    2606:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    2609:	83 ec 0c             	sub    $0xc,%esp
    260c:	ff 75 e4             	pushl  -0x1c(%ebp)
    260f:	e8 eb 03 00 00       	call   29ff <nulterminate>
    2614:	83 c4 10             	add    $0x10,%esp
  return cmd;
    2617:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    261a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    261d:	c9                   	leave  
    261e:	c3                   	ret    

0000261f <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    261f:	55                   	push   %ebp
    2620:	89 e5                	mov    %esp,%ebp
    2622:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    2625:	83 ec 08             	sub    $0x8,%esp
    2628:	ff 75 0c             	pushl  0xc(%ebp)
    262b:	ff 75 08             	pushl  0x8(%ebp)
    262e:	e8 99 00 00 00       	call   26cc <parsepipe>
    2633:	83 c4 10             	add    $0x10,%esp
    2636:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    2639:	eb 23                	jmp    265e <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    263b:	6a 00                	push   $0x0
    263d:	6a 00                	push   $0x0
    263f:	ff 75 0c             	pushl  0xc(%ebp)
    2642:	ff 75 08             	pushl  0x8(%ebp)
    2645:	e8 19 fd ff ff       	call   2363 <gettoken>
    264a:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    264d:	83 ec 0c             	sub    $0xc,%esp
    2650:	ff 75 f4             	pushl  -0xc(%ebp)
    2653:	e8 66 e8 ff ff       	call   ebe <backcmd>
    2658:	83 c4 10             	add    $0x10,%esp
    265b:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    265e:	83 ec 04             	sub    $0x4,%esp
    2661:	68 3f 39 00 00       	push   $0x393f
    2666:	ff 75 0c             	pushl  0xc(%ebp)
    2669:	ff 75 08             	pushl  0x8(%ebp)
    266c:	e8 43 fe ff ff       	call   24b4 <peek>
    2671:	83 c4 10             	add    $0x10,%esp
    2674:	85 c0                	test   %eax,%eax
    2676:	75 c3                	jne    263b <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    2678:	83 ec 04             	sub    $0x4,%esp
    267b:	68 41 39 00 00       	push   $0x3941
    2680:	ff 75 0c             	pushl  0xc(%ebp)
    2683:	ff 75 08             	pushl  0x8(%ebp)
    2686:	e8 29 fe ff ff       	call   24b4 <peek>
    268b:	83 c4 10             	add    $0x10,%esp
    268e:	85 c0                	test   %eax,%eax
    2690:	74 35                	je     26c7 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    2692:	6a 00                	push   $0x0
    2694:	6a 00                	push   $0x0
    2696:	ff 75 0c             	pushl  0xc(%ebp)
    2699:	ff 75 08             	pushl  0x8(%ebp)
    269c:	e8 c2 fc ff ff       	call   2363 <gettoken>
    26a1:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    26a4:	83 ec 08             	sub    $0x8,%esp
    26a7:	ff 75 0c             	pushl  0xc(%ebp)
    26aa:	ff 75 08             	pushl  0x8(%ebp)
    26ad:	e8 6d ff ff ff       	call   261f <parseline>
    26b2:	83 c4 10             	add    $0x10,%esp
    26b5:	83 ec 08             	sub    $0x8,%esp
    26b8:	50                   	push   %eax
    26b9:	ff 75 f4             	pushl  -0xc(%ebp)
    26bc:	e8 b5 e7 ff ff       	call   e76 <listcmd>
    26c1:	83 c4 10             	add    $0x10,%esp
    26c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    26c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    26ca:	c9                   	leave  
    26cb:	c3                   	ret    

000026cc <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    26cc:	55                   	push   %ebp
    26cd:	89 e5                	mov    %esp,%ebp
    26cf:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    26d2:	83 ec 08             	sub    $0x8,%esp
    26d5:	ff 75 0c             	pushl  0xc(%ebp)
    26d8:	ff 75 08             	pushl  0x8(%ebp)
    26db:	e8 ec 01 00 00       	call   28cc <parseexec>
    26e0:	83 c4 10             	add    $0x10,%esp
    26e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    26e6:	83 ec 04             	sub    $0x4,%esp
    26e9:	68 43 39 00 00       	push   $0x3943
    26ee:	ff 75 0c             	pushl  0xc(%ebp)
    26f1:	ff 75 08             	pushl  0x8(%ebp)
    26f4:	e8 bb fd ff ff       	call   24b4 <peek>
    26f9:	83 c4 10             	add    $0x10,%esp
    26fc:	85 c0                	test   %eax,%eax
    26fe:	74 35                	je     2735 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2700:	6a 00                	push   $0x0
    2702:	6a 00                	push   $0x0
    2704:	ff 75 0c             	pushl  0xc(%ebp)
    2707:	ff 75 08             	pushl  0x8(%ebp)
    270a:	e8 54 fc ff ff       	call   2363 <gettoken>
    270f:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2712:	83 ec 08             	sub    $0x8,%esp
    2715:	ff 75 0c             	pushl  0xc(%ebp)
    2718:	ff 75 08             	pushl  0x8(%ebp)
    271b:	e8 ac ff ff ff       	call   26cc <parsepipe>
    2720:	83 c4 10             	add    $0x10,%esp
    2723:	83 ec 08             	sub    $0x8,%esp
    2726:	50                   	push   %eax
    2727:	ff 75 f4             	pushl  -0xc(%ebp)
    272a:	e8 ff e6 ff ff       	call   e2e <pipecmd>
    272f:	83 c4 10             	add    $0x10,%esp
    2732:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2735:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2738:	c9                   	leave  
    2739:	c3                   	ret    

0000273a <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    273a:	55                   	push   %ebp
    273b:	89 e5                	mov    %esp,%ebp
    273d:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2740:	e9 b6 00 00 00       	jmp    27fb <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    2745:	6a 00                	push   $0x0
    2747:	6a 00                	push   $0x0
    2749:	ff 75 10             	pushl  0x10(%ebp)
    274c:	ff 75 0c             	pushl  0xc(%ebp)
    274f:	e8 0f fc ff ff       	call   2363 <gettoken>
    2754:	83 c4 10             	add    $0x10,%esp
    2757:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    275a:	8d 45 ec             	lea    -0x14(%ebp),%eax
    275d:	50                   	push   %eax
    275e:	8d 45 f0             	lea    -0x10(%ebp),%eax
    2761:	50                   	push   %eax
    2762:	ff 75 10             	pushl  0x10(%ebp)
    2765:	ff 75 0c             	pushl  0xc(%ebp)
    2768:	e8 f6 fb ff ff       	call   2363 <gettoken>
    276d:	83 c4 10             	add    $0x10,%esp
    2770:	83 f8 61             	cmp    $0x61,%eax
    2773:	74 10                	je     2785 <parseredirs+0x4b>
      panic1("missing file for redirection");
    2775:	83 ec 0c             	sub    $0xc,%esp
    2778:	68 45 39 00 00       	push   $0x3945
    277d:	e8 76 e2 ff ff       	call   9f8 <panic1>
    2782:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    2785:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2788:	83 f8 3c             	cmp    $0x3c,%eax
    278b:	74 0c                	je     2799 <parseredirs+0x5f>
    278d:	83 f8 3e             	cmp    $0x3e,%eax
    2790:	74 26                	je     27b8 <parseredirs+0x7e>
    2792:	83 f8 2b             	cmp    $0x2b,%eax
    2795:	74 43                	je     27da <parseredirs+0xa0>
    2797:	eb 62                	jmp    27fb <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    2799:	8b 55 ec             	mov    -0x14(%ebp),%edx
    279c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    279f:	83 ec 0c             	sub    $0xc,%esp
    27a2:	6a 00                	push   $0x0
    27a4:	6a 00                	push   $0x0
    27a6:	52                   	push   %edx
    27a7:	50                   	push   %eax
    27a8:	ff 75 08             	pushl  0x8(%ebp)
    27ab:	e8 1b e6 ff ff       	call   dcb <redircmd>
    27b0:	83 c4 20             	add    $0x20,%esp
    27b3:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    27b6:	eb 43                	jmp    27fb <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    27b8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    27bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27be:	83 ec 0c             	sub    $0xc,%esp
    27c1:	6a 01                	push   $0x1
    27c3:	68 01 02 00 00       	push   $0x201
    27c8:	52                   	push   %edx
    27c9:	50                   	push   %eax
    27ca:	ff 75 08             	pushl  0x8(%ebp)
    27cd:	e8 f9 e5 ff ff       	call   dcb <redircmd>
    27d2:	83 c4 20             	add    $0x20,%esp
    27d5:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    27d8:	eb 21                	jmp    27fb <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    27da:	8b 55 ec             	mov    -0x14(%ebp),%edx
    27dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27e0:	83 ec 0c             	sub    $0xc,%esp
    27e3:	6a 01                	push   $0x1
    27e5:	68 01 02 00 00       	push   $0x201
    27ea:	52                   	push   %edx
    27eb:	50                   	push   %eax
    27ec:	ff 75 08             	pushl  0x8(%ebp)
    27ef:	e8 d7 e5 ff ff       	call   dcb <redircmd>
    27f4:	83 c4 20             	add    $0x20,%esp
    27f7:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    27fa:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    27fb:	83 ec 04             	sub    $0x4,%esp
    27fe:	68 62 39 00 00       	push   $0x3962
    2803:	ff 75 10             	pushl  0x10(%ebp)
    2806:	ff 75 0c             	pushl  0xc(%ebp)
    2809:	e8 a6 fc ff ff       	call   24b4 <peek>
    280e:	83 c4 10             	add    $0x10,%esp
    2811:	85 c0                	test   %eax,%eax
    2813:	0f 85 2c ff ff ff    	jne    2745 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    2819:	8b 45 08             	mov    0x8(%ebp),%eax
}
    281c:	c9                   	leave  
    281d:	c3                   	ret    

0000281e <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    281e:	55                   	push   %ebp
    281f:	89 e5                	mov    %esp,%ebp
    2821:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2824:	83 ec 04             	sub    $0x4,%esp
    2827:	68 65 39 00 00       	push   $0x3965
    282c:	ff 75 0c             	pushl  0xc(%ebp)
    282f:	ff 75 08             	pushl  0x8(%ebp)
    2832:	e8 7d fc ff ff       	call   24b4 <peek>
    2837:	83 c4 10             	add    $0x10,%esp
    283a:	85 c0                	test   %eax,%eax
    283c:	75 10                	jne    284e <parseblock+0x30>
    panic1("parseblock");
    283e:	83 ec 0c             	sub    $0xc,%esp
    2841:	68 67 39 00 00       	push   $0x3967
    2846:	e8 ad e1 ff ff       	call   9f8 <panic1>
    284b:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    284e:	6a 00                	push   $0x0
    2850:	6a 00                	push   $0x0
    2852:	ff 75 0c             	pushl  0xc(%ebp)
    2855:	ff 75 08             	pushl  0x8(%ebp)
    2858:	e8 06 fb ff ff       	call   2363 <gettoken>
    285d:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    2860:	83 ec 08             	sub    $0x8,%esp
    2863:	ff 75 0c             	pushl  0xc(%ebp)
    2866:	ff 75 08             	pushl  0x8(%ebp)
    2869:	e8 b1 fd ff ff       	call   261f <parseline>
    286e:	83 c4 10             	add    $0x10,%esp
    2871:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    2874:	83 ec 04             	sub    $0x4,%esp
    2877:	68 72 39 00 00       	push   $0x3972
    287c:	ff 75 0c             	pushl  0xc(%ebp)
    287f:	ff 75 08             	pushl  0x8(%ebp)
    2882:	e8 2d fc ff ff       	call   24b4 <peek>
    2887:	83 c4 10             	add    $0x10,%esp
    288a:	85 c0                	test   %eax,%eax
    288c:	75 10                	jne    289e <parseblock+0x80>
    panic1("syntax - missing )");
    288e:	83 ec 0c             	sub    $0xc,%esp
    2891:	68 74 39 00 00       	push   $0x3974
    2896:	e8 5d e1 ff ff       	call   9f8 <panic1>
    289b:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    289e:	6a 00                	push   $0x0
    28a0:	6a 00                	push   $0x0
    28a2:	ff 75 0c             	pushl  0xc(%ebp)
    28a5:	ff 75 08             	pushl  0x8(%ebp)
    28a8:	e8 b6 fa ff ff       	call   2363 <gettoken>
    28ad:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    28b0:	83 ec 04             	sub    $0x4,%esp
    28b3:	ff 75 0c             	pushl  0xc(%ebp)
    28b6:	ff 75 08             	pushl  0x8(%ebp)
    28b9:	ff 75 f4             	pushl  -0xc(%ebp)
    28bc:	e8 79 fe ff ff       	call   273a <parseredirs>
    28c1:	83 c4 10             	add    $0x10,%esp
    28c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    28c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    28ca:	c9                   	leave  
    28cb:	c3                   	ret    

000028cc <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    28cc:	55                   	push   %ebp
    28cd:	89 e5                	mov    %esp,%ebp
    28cf:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    28d2:	83 ec 04             	sub    $0x4,%esp
    28d5:	68 65 39 00 00       	push   $0x3965
    28da:	ff 75 0c             	pushl  0xc(%ebp)
    28dd:	ff 75 08             	pushl  0x8(%ebp)
    28e0:	e8 cf fb ff ff       	call   24b4 <peek>
    28e5:	83 c4 10             	add    $0x10,%esp
    28e8:	85 c0                	test   %eax,%eax
    28ea:	74 16                	je     2902 <parseexec+0x36>
    return parseblock(ps, es);
    28ec:	83 ec 08             	sub    $0x8,%esp
    28ef:	ff 75 0c             	pushl  0xc(%ebp)
    28f2:	ff 75 08             	pushl  0x8(%ebp)
    28f5:	e8 24 ff ff ff       	call   281e <parseblock>
    28fa:	83 c4 10             	add    $0x10,%esp
    28fd:	e9 fb 00 00 00       	jmp    29fd <parseexec+0x131>

  ret = execcmd();
    2902:	e8 8e e4 ff ff       	call   d95 <execcmd>
    2907:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    290a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    290d:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2917:	83 ec 04             	sub    $0x4,%esp
    291a:	ff 75 0c             	pushl  0xc(%ebp)
    291d:	ff 75 08             	pushl  0x8(%ebp)
    2920:	ff 75 f0             	pushl  -0x10(%ebp)
    2923:	e8 12 fe ff ff       	call   273a <parseredirs>
    2928:	83 c4 10             	add    $0x10,%esp
    292b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    292e:	e9 87 00 00 00       	jmp    29ba <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2933:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2936:	50                   	push   %eax
    2937:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    293a:	50                   	push   %eax
    293b:	ff 75 0c             	pushl  0xc(%ebp)
    293e:	ff 75 08             	pushl  0x8(%ebp)
    2941:	e8 1d fa ff ff       	call   2363 <gettoken>
    2946:	83 c4 10             	add    $0x10,%esp
    2949:	89 45 e8             	mov    %eax,-0x18(%ebp)
    294c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2950:	0f 84 84 00 00 00    	je     29da <parseexec+0x10e>
      break;
    if(tok != 'a')
    2956:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    295a:	74 10                	je     296c <parseexec+0xa0>
      panic1("syntax");
    295c:	83 ec 0c             	sub    $0xc,%esp
    295f:	68 38 39 00 00       	push   $0x3938
    2964:	e8 8f e0 ff ff       	call   9f8 <panic1>
    2969:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    296c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    296f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2972:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2975:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    2979:	8b 55 e0             	mov    -0x20(%ebp),%edx
    297c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    297f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2982:	83 c1 08             	add    $0x8,%ecx
    2985:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    2989:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    298d:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2991:	7e 10                	jle    29a3 <parseexec+0xd7>
      panic1("too many args");
    2993:	83 ec 0c             	sub    $0xc,%esp
    2996:	68 87 39 00 00       	push   $0x3987
    299b:	e8 58 e0 ff ff       	call   9f8 <panic1>
    29a0:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    29a3:	83 ec 04             	sub    $0x4,%esp
    29a6:	ff 75 0c             	pushl  0xc(%ebp)
    29a9:	ff 75 08             	pushl  0x8(%ebp)
    29ac:	ff 75 f0             	pushl  -0x10(%ebp)
    29af:	e8 86 fd ff ff       	call   273a <parseredirs>
    29b4:	83 c4 10             	add    $0x10,%esp
    29b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    29ba:	83 ec 04             	sub    $0x4,%esp
    29bd:	68 95 39 00 00       	push   $0x3995
    29c2:	ff 75 0c             	pushl  0xc(%ebp)
    29c5:	ff 75 08             	pushl  0x8(%ebp)
    29c8:	e8 e7 fa ff ff       	call   24b4 <peek>
    29cd:	83 c4 10             	add    $0x10,%esp
    29d0:	85 c0                	test   %eax,%eax
    29d2:	0f 84 5b ff ff ff    	je     2933 <parseexec+0x67>
    29d8:	eb 01                	jmp    29db <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    29da:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    29db:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29de:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29e1:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    29e8:	00 
  cmd->eargv[argc] = 0;
    29e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
    29ef:	83 c2 08             	add    $0x8,%edx
    29f2:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    29f9:	00 
  return ret;
    29fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    29fd:	c9                   	leave  
    29fe:	c3                   	ret    

000029ff <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    29ff:	55                   	push   %ebp
    2a00:	89 e5                	mov    %esp,%ebp
    2a02:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2a05:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2a09:	75 0a                	jne    2a15 <nulterminate+0x16>
    return 0;
    2a0b:	b8 00 00 00 00       	mov    $0x0,%eax
    2a10:	e9 e4 00 00 00       	jmp    2af9 <nulterminate+0xfa>
  
  switch(cmd->type){
    2a15:	8b 45 08             	mov    0x8(%ebp),%eax
    2a18:	8b 00                	mov    (%eax),%eax
    2a1a:	83 f8 05             	cmp    $0x5,%eax
    2a1d:	0f 87 d3 00 00 00    	ja     2af6 <nulterminate+0xf7>
    2a23:	8b 04 85 9c 39 00 00 	mov    0x399c(,%eax,4),%eax
    2a2a:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2a2c:	8b 45 08             	mov    0x8(%ebp),%eax
    2a2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2a32:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a39:	eb 14                	jmp    2a4f <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2a3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a3e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a41:	83 c2 08             	add    $0x8,%edx
    2a44:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2a48:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2a4b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2a4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a52:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a55:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2a59:	85 c0                	test   %eax,%eax
    2a5b:	75 de                	jne    2a3b <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2a5d:	e9 94 00 00 00       	jmp    2af6 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2a62:	8b 45 08             	mov    0x8(%ebp),%eax
    2a65:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2a68:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a6b:	8b 40 04             	mov    0x4(%eax),%eax
    2a6e:	83 ec 0c             	sub    $0xc,%esp
    2a71:	50                   	push   %eax
    2a72:	e8 88 ff ff ff       	call   29ff <nulterminate>
    2a77:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2a7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a7d:	8b 40 0c             	mov    0xc(%eax),%eax
    2a80:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2a83:	eb 71                	jmp    2af6 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2a85:	8b 45 08             	mov    0x8(%ebp),%eax
    2a88:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2a8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a8e:	8b 40 04             	mov    0x4(%eax),%eax
    2a91:	83 ec 0c             	sub    $0xc,%esp
    2a94:	50                   	push   %eax
    2a95:	e8 65 ff ff ff       	call   29ff <nulterminate>
    2a9a:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2a9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2aa0:	8b 40 08             	mov    0x8(%eax),%eax
    2aa3:	83 ec 0c             	sub    $0xc,%esp
    2aa6:	50                   	push   %eax
    2aa7:	e8 53 ff ff ff       	call   29ff <nulterminate>
    2aac:	83 c4 10             	add    $0x10,%esp
    break;
    2aaf:	eb 45                	jmp    2af6 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2ab1:	8b 45 08             	mov    0x8(%ebp),%eax
    2ab4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2ab7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2aba:	8b 40 04             	mov    0x4(%eax),%eax
    2abd:	83 ec 0c             	sub    $0xc,%esp
    2ac0:	50                   	push   %eax
    2ac1:	e8 39 ff ff ff       	call   29ff <nulterminate>
    2ac6:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2ac9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2acc:	8b 40 08             	mov    0x8(%eax),%eax
    2acf:	83 ec 0c             	sub    $0xc,%esp
    2ad2:	50                   	push   %eax
    2ad3:	e8 27 ff ff ff       	call   29ff <nulterminate>
    2ad8:	83 c4 10             	add    $0x10,%esp
    break;
    2adb:	eb 19                	jmp    2af6 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2add:	8b 45 08             	mov    0x8(%ebp),%eax
    2ae0:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2ae3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2ae6:	8b 40 04             	mov    0x4(%eax),%eax
    2ae9:	83 ec 0c             	sub    $0xc,%esp
    2aec:	50                   	push   %eax
    2aed:	e8 0d ff ff ff       	call   29ff <nulterminate>
    2af2:	83 c4 10             	add    $0x10,%esp
    break;
    2af5:	90                   	nop
  }
  return cmd;
    2af6:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2af9:	c9                   	leave  
    2afa:	c3                   	ret    

00002afb <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2afb:	55                   	push   %ebp
    2afc:	89 e5                	mov    %esp,%ebp
    2afe:	83 ec 18             	sub    $0x18,%esp
    2b01:	8b 45 08             	mov    0x8(%ebp),%eax
    2b04:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2b07:	83 ec 08             	sub    $0x8,%esp
    2b0a:	ff 75 18             	pushl  0x18(%ebp)
    2b0d:	ff 75 14             	pushl  0x14(%ebp)
    2b10:	ff 75 10             	pushl  0x10(%ebp)
    2b13:	ff 75 0c             	pushl  0xc(%ebp)
    2b16:	6a 01                	push   $0x1
    2b18:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2b1b:	50                   	push   %eax
    2b1c:	e8 e6 d8 ff ff       	call   407 <colorwrite>
    2b21:	83 c4 20             	add    $0x20,%esp
}
    2b24:	90                   	nop
    2b25:	c9                   	leave  
    2b26:	c3                   	ret    

00002b27 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2b27:	55                   	push   %ebp
    2b28:	89 e5                	mov    %esp,%ebp
    2b2a:	53                   	push   %ebx
    2b2b:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2b2e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2b35:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2b39:	74 17                	je     2b52 <color_printint+0x2b>
    2b3b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2b3f:	79 11                	jns    2b52 <color_printint+0x2b>
    neg = 1;
    2b41:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2b48:	8b 45 08             	mov    0x8(%ebp),%eax
    2b4b:	f7 d8                	neg    %eax
    2b4d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b50:	eb 06                	jmp    2b58 <color_printint+0x31>
  } else {
    x = xx;
    2b52:	8b 45 08             	mov    0x8(%ebp),%eax
    2b55:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2b58:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2b5f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2b62:	8d 41 01             	lea    0x1(%ecx),%eax
    2b65:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b68:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2b6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b6e:	ba 00 00 00 00       	mov    $0x0,%edx
    2b73:	f7 f3                	div    %ebx
    2b75:	89 d0                	mov    %edx,%eax
    2b77:	0f b6 80 44 44 00 00 	movzbl 0x4444(%eax),%eax
    2b7e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2b82:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2b85:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b88:	ba 00 00 00 00       	mov    $0x0,%edx
    2b8d:	f7 f3                	div    %ebx
    2b8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b92:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2b96:	75 c7                	jne    2b5f <color_printint+0x38>
  if(neg)
    2b98:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2b9c:	74 36                	je     2bd4 <color_printint+0xad>
    buf[i++] = '-';
    2b9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ba1:	8d 50 01             	lea    0x1(%eax),%edx
    2ba4:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2ba7:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2bac:	eb 26                	jmp    2bd4 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2bae:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bb4:	01 d0                	add    %edx,%eax
    2bb6:	0f b6 00             	movzbl (%eax),%eax
    2bb9:	0f be c0             	movsbl %al,%eax
    2bbc:	83 ec 0c             	sub    $0xc,%esp
    2bbf:	ff 75 20             	pushl  0x20(%ebp)
    2bc2:	ff 75 1c             	pushl  0x1c(%ebp)
    2bc5:	ff 75 18             	pushl  0x18(%ebp)
    2bc8:	ff 75 14             	pushl  0x14(%ebp)
    2bcb:	50                   	push   %eax
    2bcc:	e8 2a ff ff ff       	call   2afb <color_putc>
    2bd1:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2bd4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2bd8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2bdc:	79 d0                	jns    2bae <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2bde:	90                   	nop
    2bdf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2be2:	c9                   	leave  
    2be3:	c3                   	ret    

00002be4 <getInteger>:

static int getInteger(double num)
{
    2be4:	55                   	push   %ebp
    2be5:	89 e5                	mov    %esp,%ebp
    2be7:	83 ec 18             	sub    $0x18,%esp
    2bea:	8b 45 08             	mov    0x8(%ebp),%eax
    2bed:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2bf0:	8b 45 0c             	mov    0xc(%ebp),%eax
    2bf3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2bf6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2bfd:	eb 0e                	jmp    2c0d <getInteger+0x29>
  {
    num -= 1;
    2bff:	dd 45 e8             	fldl   -0x18(%ebp)
    2c02:	d9 e8                	fld1   
    2c04:	de e9                	fsubrp %st,%st(1)
    2c06:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2c09:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2c0d:	dd 45 e8             	fldl   -0x18(%ebp)
    2c10:	d9 e8                	fld1   
    2c12:	d9 c9                	fxch   %st(1)
    2c14:	df e9                	fucomip %st(1),%st
    2c16:	dd d8                	fstp   %st(0)
    2c18:	77 e5                	ja     2bff <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2c1a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2c1d:	c9                   	leave  
    2c1e:	c3                   	ret    

00002c1f <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2c1f:	55                   	push   %ebp
    2c20:	89 e5                	mov    %esp,%ebp
    2c22:	83 ec 28             	sub    $0x28,%esp
    2c25:	8b 45 08             	mov    0x8(%ebp),%eax
    2c28:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2c2b:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c2e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2c31:	d9 ee                	fldz   
    2c33:	dd 45 e0             	fldl   -0x20(%ebp)
    2c36:	d9 c9                	fxch   %st(1)
    2c38:	df e9                	fucomip %st(1),%st
    2c3a:	dd d8                	fstp   %st(0)
    2c3c:	76 21                	jbe    2c5f <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2c3e:	83 ec 0c             	sub    $0xc,%esp
    2c41:	ff 75 1c             	pushl  0x1c(%ebp)
    2c44:	ff 75 18             	pushl  0x18(%ebp)
    2c47:	ff 75 14             	pushl  0x14(%ebp)
    2c4a:	ff 75 10             	pushl  0x10(%ebp)
    2c4d:	6a 2d                	push   $0x2d
    2c4f:	e8 a7 fe ff ff       	call   2afb <color_putc>
    2c54:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2c57:	dd 45 e0             	fldl   -0x20(%ebp)
    2c5a:	d9 e0                	fchs   
    2c5c:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2c5f:	83 ec 08             	sub    $0x8,%esp
    2c62:	ff 75 e4             	pushl  -0x1c(%ebp)
    2c65:	ff 75 e0             	pushl  -0x20(%ebp)
    2c68:	e8 77 ff ff ff       	call   2be4 <getInteger>
    2c6d:	83 c4 10             	add    $0x10,%esp
    2c70:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2c73:	83 ec 04             	sub    $0x4,%esp
    2c76:	ff 75 1c             	pushl  0x1c(%ebp)
    2c79:	ff 75 18             	pushl  0x18(%ebp)
    2c7c:	ff 75 14             	pushl  0x14(%ebp)
    2c7f:	ff 75 10             	pushl  0x10(%ebp)
    2c82:	6a 01                	push   $0x1
    2c84:	6a 0a                	push   $0xa
    2c86:	ff 75 f0             	pushl  -0x10(%ebp)
    2c89:	e8 99 fe ff ff       	call   2b27 <color_printint>
    2c8e:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2c91:	db 45 f0             	fildl  -0x10(%ebp)
    2c94:	dd 45 e0             	fldl   -0x20(%ebp)
    2c97:	de e1                	fsubp  %st,%st(1)
    2c99:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2c9c:	dd 45 e0             	fldl   -0x20(%ebp)
    2c9f:	dd 05 c0 39 00 00    	fldl   0x39c0
    2ca5:	d9 c9                	fxch   %st(1)
    2ca7:	df e9                	fucomip %st(1),%st
    2ca9:	dd d8                	fstp   %st(0)
    2cab:	76 19                	jbe    2cc6 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2cad:	83 ec 0c             	sub    $0xc,%esp
    2cb0:	ff 75 1c             	pushl  0x1c(%ebp)
    2cb3:	ff 75 18             	pushl  0x18(%ebp)
    2cb6:	ff 75 14             	pushl  0x14(%ebp)
    2cb9:	ff 75 10             	pushl  0x10(%ebp)
    2cbc:	6a 2e                	push   $0x2e
    2cbe:	e8 38 fe ff ff       	call   2afb <color_putc>
    2cc3:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2cc6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2ccd:	eb 55                	jmp    2d24 <color_printdbl+0x105>
  {
    num = num*10;
    2ccf:	dd 45 e0             	fldl   -0x20(%ebp)
    2cd2:	dd 05 c8 39 00 00    	fldl   0x39c8
    2cd8:	de c9                	fmulp  %st,%st(1)
    2cda:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2cdd:	83 ec 08             	sub    $0x8,%esp
    2ce0:	ff 75 e4             	pushl  -0x1c(%ebp)
    2ce3:	ff 75 e0             	pushl  -0x20(%ebp)
    2ce6:	e8 f9 fe ff ff       	call   2be4 <getInteger>
    2ceb:	83 c4 10             	add    $0x10,%esp
    2cee:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2cf1:	83 ec 04             	sub    $0x4,%esp
    2cf4:	ff 75 1c             	pushl  0x1c(%ebp)
    2cf7:	ff 75 18             	pushl  0x18(%ebp)
    2cfa:	ff 75 14             	pushl  0x14(%ebp)
    2cfd:	ff 75 10             	pushl  0x10(%ebp)
    2d00:	6a 01                	push   $0x1
    2d02:	6a 0a                	push   $0xa
    2d04:	ff 75 f0             	pushl  -0x10(%ebp)
    2d07:	e8 1b fe ff ff       	call   2b27 <color_printint>
    2d0c:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2d0f:	db 45 f0             	fildl  -0x10(%ebp)
    2d12:	dd 45 e0             	fldl   -0x20(%ebp)
    2d15:	de e1                	fsubp  %st,%st(1)
    2d17:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2d1a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2d1e:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2d22:	7f 13                	jg     2d37 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2d24:	dd 45 e0             	fldl   -0x20(%ebp)
    2d27:	dd 05 c0 39 00 00    	fldl   0x39c0
    2d2d:	d9 c9                	fxch   %st(1)
    2d2f:	df e9                	fucomip %st(1),%st
    2d31:	dd d8                	fstp   %st(0)
    2d33:	77 9a                	ja     2ccf <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2d35:	eb 01                	jmp    2d38 <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2d37:	90                   	nop
    }
  }
}
    2d38:	90                   	nop
    2d39:	c9                   	leave  
    2d3a:	c3                   	ret    

00002d3b <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2d3b:	55                   	push   %ebp
    2d3c:	89 e5                	mov    %esp,%ebp
    2d3e:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2d41:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2d48:	8d 45 18             	lea    0x18(%ebp),%eax
    2d4b:	83 c0 04             	add    $0x4,%eax
    2d4e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2d51:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2d58:	e9 e2 01 00 00       	jmp    2f3f <color_printf+0x204>
    c = fmt[i] & 0xff;
    2d5d:	8b 55 18             	mov    0x18(%ebp),%edx
    2d60:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d63:	01 d0                	add    %edx,%eax
    2d65:	0f b6 00             	movzbl (%eax),%eax
    2d68:	0f be c0             	movsbl %al,%eax
    2d6b:	25 ff 00 00 00       	and    $0xff,%eax
    2d70:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2d73:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2d77:	75 35                	jne    2dae <color_printf+0x73>
      if(c == '%'){
    2d79:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2d7d:	75 0c                	jne    2d8b <color_printf+0x50>
        state = '%';
    2d7f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2d86:	e9 b0 01 00 00       	jmp    2f3b <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2d8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d8e:	0f be c0             	movsbl %al,%eax
    2d91:	83 ec 0c             	sub    $0xc,%esp
    2d94:	ff 75 14             	pushl  0x14(%ebp)
    2d97:	ff 75 10             	pushl  0x10(%ebp)
    2d9a:	ff 75 0c             	pushl  0xc(%ebp)
    2d9d:	ff 75 08             	pushl  0x8(%ebp)
    2da0:	50                   	push   %eax
    2da1:	e8 55 fd ff ff       	call   2afb <color_putc>
    2da6:	83 c4 20             	add    $0x20,%esp
    2da9:	e9 8d 01 00 00       	jmp    2f3b <color_printf+0x200>
      }
    } else if(state == '%'){
    2dae:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2db2:	0f 85 83 01 00 00    	jne    2f3b <color_printf+0x200>
      if(c == 'd'){
    2db8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2dbc:	75 2a                	jne    2de8 <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2dbe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2dc1:	8b 00                	mov    (%eax),%eax
    2dc3:	83 ec 04             	sub    $0x4,%esp
    2dc6:	ff 75 14             	pushl  0x14(%ebp)
    2dc9:	ff 75 10             	pushl  0x10(%ebp)
    2dcc:	ff 75 0c             	pushl  0xc(%ebp)
    2dcf:	ff 75 08             	pushl  0x8(%ebp)
    2dd2:	6a 01                	push   $0x1
    2dd4:	6a 0a                	push   $0xa
    2dd6:	50                   	push   %eax
    2dd7:	e8 4b fd ff ff       	call   2b27 <color_printint>
    2ddc:	83 c4 20             	add    $0x20,%esp
        ap++;
    2ddf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2de3:	e9 4c 01 00 00       	jmp    2f34 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2de8:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2dec:	74 06                	je     2df4 <color_printf+0xb9>
    2dee:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2df2:	75 2a                	jne    2e1e <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2df4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2df7:	8b 00                	mov    (%eax),%eax
    2df9:	83 ec 04             	sub    $0x4,%esp
    2dfc:	ff 75 14             	pushl  0x14(%ebp)
    2dff:	ff 75 10             	pushl  0x10(%ebp)
    2e02:	ff 75 0c             	pushl  0xc(%ebp)
    2e05:	ff 75 08             	pushl  0x8(%ebp)
    2e08:	6a 00                	push   $0x0
    2e0a:	6a 10                	push   $0x10
    2e0c:	50                   	push   %eax
    2e0d:	e8 15 fd ff ff       	call   2b27 <color_printint>
    2e12:	83 c4 20             	add    $0x20,%esp
        ap++;
    2e15:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2e19:	e9 16 01 00 00       	jmp    2f34 <color_printf+0x1f9>
      } else if(c == 's'){
    2e1e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2e22:	75 4f                	jne    2e73 <color_printf+0x138>
        s = (char*)*ap;
    2e24:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e27:	8b 00                	mov    (%eax),%eax
    2e29:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2e2c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2e30:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e34:	75 2e                	jne    2e64 <color_printf+0x129>
          s = "(null)";
    2e36:	c7 45 f4 b8 39 00 00 	movl   $0x39b8,-0xc(%ebp)
        while(*s != 0){
    2e3d:	eb 25                	jmp    2e64 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2e3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e42:	0f b6 00             	movzbl (%eax),%eax
    2e45:	0f be c0             	movsbl %al,%eax
    2e48:	83 ec 0c             	sub    $0xc,%esp
    2e4b:	ff 75 14             	pushl  0x14(%ebp)
    2e4e:	ff 75 10             	pushl  0x10(%ebp)
    2e51:	ff 75 0c             	pushl  0xc(%ebp)
    2e54:	ff 75 08             	pushl  0x8(%ebp)
    2e57:	50                   	push   %eax
    2e58:	e8 9e fc ff ff       	call   2afb <color_putc>
    2e5d:	83 c4 20             	add    $0x20,%esp
          s++;
    2e60:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2e64:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e67:	0f b6 00             	movzbl (%eax),%eax
    2e6a:	84 c0                	test   %al,%al
    2e6c:	75 d1                	jne    2e3f <color_printf+0x104>
    2e6e:	e9 c1 00 00 00       	jmp    2f34 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2e73:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2e77:	75 29                	jne    2ea2 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2e79:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e7c:	8b 00                	mov    (%eax),%eax
    2e7e:	0f be c0             	movsbl %al,%eax
    2e81:	83 ec 0c             	sub    $0xc,%esp
    2e84:	ff 75 14             	pushl  0x14(%ebp)
    2e87:	ff 75 10             	pushl  0x10(%ebp)
    2e8a:	ff 75 0c             	pushl  0xc(%ebp)
    2e8d:	ff 75 08             	pushl  0x8(%ebp)
    2e90:	50                   	push   %eax
    2e91:	e8 65 fc ff ff       	call   2afb <color_putc>
    2e96:	83 c4 20             	add    $0x20,%esp
        ap++;
    2e99:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2e9d:	e9 92 00 00 00       	jmp    2f34 <color_printf+0x1f9>
      } else if(c == '%'){
    2ea2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2ea6:	75 20                	jne    2ec8 <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2ea8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2eab:	0f be c0             	movsbl %al,%eax
    2eae:	83 ec 0c             	sub    $0xc,%esp
    2eb1:	ff 75 14             	pushl  0x14(%ebp)
    2eb4:	ff 75 10             	pushl  0x10(%ebp)
    2eb7:	ff 75 0c             	pushl  0xc(%ebp)
    2eba:	ff 75 08             	pushl  0x8(%ebp)
    2ebd:	50                   	push   %eax
    2ebe:	e8 38 fc ff ff       	call   2afb <color_putc>
    2ec3:	83 c4 20             	add    $0x20,%esp
    2ec6:	eb 6c                	jmp    2f34 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    2ec8:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    2ecc:	75 2f                	jne    2efd <color_printf+0x1c2>
        double *dap = (double*)ap;
    2ece:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ed1:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    2ed4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2ed7:	dd 00                	fldl   (%eax)
    2ed9:	83 ec 08             	sub    $0x8,%esp
    2edc:	ff 75 14             	pushl  0x14(%ebp)
    2edf:	ff 75 10             	pushl  0x10(%ebp)
    2ee2:	ff 75 0c             	pushl  0xc(%ebp)
    2ee5:	ff 75 08             	pushl  0x8(%ebp)
    2ee8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2eec:	dd 1c 24             	fstpl  (%esp)
    2eef:	e8 2b fd ff ff       	call   2c1f <color_printdbl>
    2ef4:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    2ef7:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    2efb:	eb 37                	jmp    2f34 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    2efd:	83 ec 0c             	sub    $0xc,%esp
    2f00:	ff 75 14             	pushl  0x14(%ebp)
    2f03:	ff 75 10             	pushl  0x10(%ebp)
    2f06:	ff 75 0c             	pushl  0xc(%ebp)
    2f09:	ff 75 08             	pushl  0x8(%ebp)
    2f0c:	6a 25                	push   $0x25
    2f0e:	e8 e8 fb ff ff       	call   2afb <color_putc>
    2f13:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    2f16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2f19:	0f be c0             	movsbl %al,%eax
    2f1c:	83 ec 0c             	sub    $0xc,%esp
    2f1f:	ff 75 14             	pushl  0x14(%ebp)
    2f22:	ff 75 10             	pushl  0x10(%ebp)
    2f25:	ff 75 0c             	pushl  0xc(%ebp)
    2f28:	ff 75 08             	pushl  0x8(%ebp)
    2f2b:	50                   	push   %eax
    2f2c:	e8 ca fb ff ff       	call   2afb <color_putc>
    2f31:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    2f34:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2f3b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2f3f:	8b 55 18             	mov    0x18(%ebp),%edx
    2f42:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f45:	01 d0                	add    %edx,%eax
    2f47:	0f b6 00             	movzbl (%eax),%eax
    2f4a:	84 c0                	test   %al,%al
    2f4c:	0f 85 0b fe ff ff    	jne    2d5d <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    2f52:	90                   	nop
    2f53:	c9                   	leave  
    2f54:	c3                   	ret    

00002f55 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    2f55:	55                   	push   %ebp
    2f56:	89 e5                	mov    %esp,%ebp
    2f58:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    2f5b:	83 ec 0c             	sub    $0xc,%esp
    2f5e:	6a 58                	push   $0x58
    2f60:	e8 b0 d9 ff ff       	call   915 <malloc>
    2f65:	83 c4 10             	add    $0x10,%esp
    2f68:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    2f6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f6e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    2f74:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f77:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    2f7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2f81:	c9                   	leave  
    2f82:	c3                   	ret    

00002f83 <pushi>:

void pushi(struct istack *s, int val)
{
    2f83:	55                   	push   %ebp
    2f84:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    2f86:	8b 45 08             	mov    0x8(%ebp),%eax
    2f89:	8b 00                	mov    (%eax),%eax
    2f8b:	83 f8 13             	cmp    $0x13,%eax
    2f8e:	7f 2c                	jg     2fbc <pushi+0x39>
    {
        s->size++;
    2f90:	8b 45 08             	mov    0x8(%ebp),%eax
    2f93:	8b 00                	mov    (%eax),%eax
    2f95:	8d 50 01             	lea    0x1(%eax),%edx
    2f98:	8b 45 08             	mov    0x8(%ebp),%eax
    2f9b:	89 10                	mov    %edx,(%eax)
        s->top++;
    2f9d:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa0:	8b 40 54             	mov    0x54(%eax),%eax
    2fa3:	8d 50 01             	lea    0x1(%eax),%edx
    2fa6:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa9:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    2fac:	8b 45 08             	mov    0x8(%ebp),%eax
    2faf:	8b 50 54             	mov    0x54(%eax),%edx
    2fb2:	8b 45 08             	mov    0x8(%ebp),%eax
    2fb5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2fb8:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    2fbc:	90                   	nop
    2fbd:	5d                   	pop    %ebp
    2fbe:	c3                   	ret    

00002fbf <popi>:

int popi(struct istack *s)
{
    2fbf:	55                   	push   %ebp
    2fc0:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    2fc2:	8b 45 08             	mov    0x8(%ebp),%eax
    2fc5:	8b 00                	mov    (%eax),%eax
    2fc7:	85 c0                	test   %eax,%eax
    2fc9:	75 07                	jne    2fd2 <popi+0x13>
    {
        return -1;
    2fcb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2fd0:	eb 2c                	jmp    2ffe <popi+0x3f>
    }
    s->size--;
    2fd2:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd5:	8b 00                	mov    (%eax),%eax
    2fd7:	8d 50 ff             	lea    -0x1(%eax),%edx
    2fda:	8b 45 08             	mov    0x8(%ebp),%eax
    2fdd:	89 10                	mov    %edx,(%eax)
    s->top--;
    2fdf:	8b 45 08             	mov    0x8(%ebp),%eax
    2fe2:	8b 40 54             	mov    0x54(%eax),%eax
    2fe5:	8d 50 ff             	lea    -0x1(%eax),%edx
    2fe8:	8b 45 08             	mov    0x8(%ebp),%eax
    2feb:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    2fee:	8b 45 08             	mov    0x8(%ebp),%eax
    2ff1:	8b 40 54             	mov    0x54(%eax),%eax
    2ff4:	8d 50 01             	lea    0x1(%eax),%edx
    2ff7:	8b 45 08             	mov    0x8(%ebp),%eax
    2ffa:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    2ffe:	5d                   	pop    %ebp
    2fff:	c3                   	ret    

00003000 <topi>:

int topi(struct istack* s)
{
    3000:	55                   	push   %ebp
    3001:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3003:	8b 45 08             	mov    0x8(%ebp),%eax
    3006:	8b 50 54             	mov    0x54(%eax),%edx
    3009:	8b 45 08             	mov    0x8(%ebp),%eax
    300c:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3010:	5d                   	pop    %ebp
    3011:	c3                   	ret    

00003012 <cstack>:

//constructor
struct cstack* cstack()
{
    3012:	55                   	push   %ebp
    3013:	89 e5                	mov    %esp,%ebp
    3015:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    3018:	83 ec 0c             	sub    $0xc,%esp
    301b:	6a 1c                	push   $0x1c
    301d:	e8 f3 d8 ff ff       	call   915 <malloc>
    3022:	83 c4 10             	add    $0x10,%esp
    3025:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3028:	8b 45 f4             	mov    -0xc(%ebp),%eax
    302b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3031:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3034:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    303b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    303e:	c9                   	leave  
    303f:	c3                   	ret    

00003040 <pushc>:

void pushc(struct cstack *s, char val)
{
    3040:	55                   	push   %ebp
    3041:	89 e5                	mov    %esp,%ebp
    3043:	83 ec 04             	sub    $0x4,%esp
    3046:	8b 45 0c             	mov    0xc(%ebp),%eax
    3049:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    304c:	8b 45 08             	mov    0x8(%ebp),%eax
    304f:	8b 00                	mov    (%eax),%eax
    3051:	83 f8 13             	cmp    $0x13,%eax
    3054:	7f 2d                	jg     3083 <pushc+0x43>
    {
        s->size++;
    3056:	8b 45 08             	mov    0x8(%ebp),%eax
    3059:	8b 00                	mov    (%eax),%eax
    305b:	8d 50 01             	lea    0x1(%eax),%edx
    305e:	8b 45 08             	mov    0x8(%ebp),%eax
    3061:	89 10                	mov    %edx,(%eax)
        s->top++;
    3063:	8b 45 08             	mov    0x8(%ebp),%eax
    3066:	8b 40 18             	mov    0x18(%eax),%eax
    3069:	8d 50 01             	lea    0x1(%eax),%edx
    306c:	8b 45 08             	mov    0x8(%ebp),%eax
    306f:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    3072:	8b 45 08             	mov    0x8(%ebp),%eax
    3075:	8b 40 18             	mov    0x18(%eax),%eax
    3078:	8b 55 08             	mov    0x8(%ebp),%edx
    307b:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    307f:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    3083:	90                   	nop
    3084:	c9                   	leave  
    3085:	c3                   	ret    

00003086 <popc>:

char popc(struct cstack *s)
{
    3086:	55                   	push   %ebp
    3087:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3089:	8b 45 08             	mov    0x8(%ebp),%eax
    308c:	8b 00                	mov    (%eax),%eax
    308e:	85 c0                	test   %eax,%eax
    3090:	75 07                	jne    3099 <popc+0x13>
    {
        return -1;
    3092:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3097:	eb 2d                	jmp    30c6 <popc+0x40>
    }
    s->size--;
    3099:	8b 45 08             	mov    0x8(%ebp),%eax
    309c:	8b 00                	mov    (%eax),%eax
    309e:	8d 50 ff             	lea    -0x1(%eax),%edx
    30a1:	8b 45 08             	mov    0x8(%ebp),%eax
    30a4:	89 10                	mov    %edx,(%eax)
    s->top--;
    30a6:	8b 45 08             	mov    0x8(%ebp),%eax
    30a9:	8b 40 18             	mov    0x18(%eax),%eax
    30ac:	8d 50 ff             	lea    -0x1(%eax),%edx
    30af:	8b 45 08             	mov    0x8(%ebp),%eax
    30b2:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    30b5:	8b 45 08             	mov    0x8(%ebp),%eax
    30b8:	8b 40 18             	mov    0x18(%eax),%eax
    30bb:	8d 50 01             	lea    0x1(%eax),%edx
    30be:	8b 45 08             	mov    0x8(%ebp),%eax
    30c1:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    30c6:	5d                   	pop    %ebp
    30c7:	c3                   	ret    

000030c8 <topc>:

char topc(struct cstack* s)
{
    30c8:	55                   	push   %ebp
    30c9:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    30cb:	8b 45 08             	mov    0x8(%ebp),%eax
    30ce:	8b 40 18             	mov    0x18(%eax),%eax
    30d1:	8b 55 08             	mov    0x8(%ebp),%edx
    30d4:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    30d9:	5d                   	pop    %ebp
    30da:	c3                   	ret    

000030db <dstack>:

//constructor
struct dstack* dstack()
{
    30db:	55                   	push   %ebp
    30dc:	89 e5                	mov    %esp,%ebp
    30de:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    30e1:	83 ec 0c             	sub    $0xc,%esp
    30e4:	68 a8 00 00 00       	push   $0xa8
    30e9:	e8 27 d8 ff ff       	call   915 <malloc>
    30ee:	83 c4 10             	add    $0x10,%esp
    30f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    30f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30f7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    30fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3100:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    3107:	ff ff ff 
    return stack;
    310a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    310d:	c9                   	leave  
    310e:	c3                   	ret    

0000310f <pushd>:

void pushd(struct dstack *s, double val)
{
    310f:	55                   	push   %ebp
    3110:	89 e5                	mov    %esp,%ebp
    3112:	83 ec 08             	sub    $0x8,%esp
    3115:	8b 45 0c             	mov    0xc(%ebp),%eax
    3118:	89 45 f8             	mov    %eax,-0x8(%ebp)
    311b:	8b 45 10             	mov    0x10(%ebp),%eax
    311e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3121:	8b 45 08             	mov    0x8(%ebp),%eax
    3124:	8b 00                	mov    (%eax),%eax
    3126:	83 f8 13             	cmp    $0x13,%eax
    3129:	7f 35                	jg     3160 <pushd+0x51>
    {
        s->size++;
    312b:	8b 45 08             	mov    0x8(%ebp),%eax
    312e:	8b 00                	mov    (%eax),%eax
    3130:	8d 50 01             	lea    0x1(%eax),%edx
    3133:	8b 45 08             	mov    0x8(%ebp),%eax
    3136:	89 10                	mov    %edx,(%eax)
        s->top++;
    3138:	8b 45 08             	mov    0x8(%ebp),%eax
    313b:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3141:	8d 50 01             	lea    0x1(%eax),%edx
    3144:	8b 45 08             	mov    0x8(%ebp),%eax
    3147:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    314d:	8b 45 08             	mov    0x8(%ebp),%eax
    3150:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3156:	8b 45 08             	mov    0x8(%ebp),%eax
    3159:	dd 45 f8             	fldl   -0x8(%ebp)
    315c:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    3160:	90                   	nop
    3161:	c9                   	leave  
    3162:	c3                   	ret    

00003163 <popd>:

double popd(struct dstack *s)
{
    3163:	55                   	push   %ebp
    3164:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3166:	8b 45 08             	mov    0x8(%ebp),%eax
    3169:	8b 00                	mov    (%eax),%eax
    316b:	85 c0                	test   %eax,%eax
    316d:	75 06                	jne    3175 <popd+0x12>
    {
        return -1;
    316f:	d9 e8                	fld1   
    3171:	d9 e0                	fchs   
    3173:	eb 35                	jmp    31aa <popd+0x47>
    }
    s->size--;
    3175:	8b 45 08             	mov    0x8(%ebp),%eax
    3178:	8b 00                	mov    (%eax),%eax
    317a:	8d 50 ff             	lea    -0x1(%eax),%edx
    317d:	8b 45 08             	mov    0x8(%ebp),%eax
    3180:	89 10                	mov    %edx,(%eax)
    s->top--;
    3182:	8b 45 08             	mov    0x8(%ebp),%eax
    3185:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    318b:	8d 50 ff             	lea    -0x1(%eax),%edx
    318e:	8b 45 08             	mov    0x8(%ebp),%eax
    3191:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    3197:	8b 45 08             	mov    0x8(%ebp),%eax
    319a:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    31a0:	8d 50 01             	lea    0x1(%eax),%edx
    31a3:	8b 45 08             	mov    0x8(%ebp),%eax
    31a6:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    31aa:	5d                   	pop    %ebp
    31ab:	c3                   	ret    

000031ac <topd>:

double topd(struct dstack* s)
{
    31ac:	55                   	push   %ebp
    31ad:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    31af:	8b 45 08             	mov    0x8(%ebp),%eax
    31b2:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    31b8:	8b 45 08             	mov    0x8(%ebp),%eax
    31bb:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    31bf:	5d                   	pop    %ebp
    31c0:	c3                   	ret    

000031c1 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    31c1:	55                   	push   %ebp
    31c2:	89 e5                	mov    %esp,%ebp
    31c4:	53                   	push   %ebx
    31c5:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    31cb:	83 ec 08             	sub    $0x8,%esp
    31ce:	6a 00                	push   $0x0
    31d0:	68 d0 39 00 00       	push   $0x39d0
    31d5:	e8 cd d1 ff ff       	call   3a7 <open>
    31da:	83 c4 10             	add    $0x10,%esp
    31dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    31e0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    31e4:	79 1d                	jns    3203 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    31e6:	83 ec 0c             	sub    $0xc,%esp
    31e9:	68 da 39 00 00       	push   $0x39da
    31ee:	6a 00                	push   $0x0
    31f0:	6a 00                	push   $0x0
    31f2:	6a 01                	push   $0x1
    31f4:	6a 03                	push   $0x3
    31f6:	e8 40 fb ff ff       	call   2d3b <color_printf>
    31fb:	83 c4 20             	add    $0x20,%esp
    31fe:	e9 6d 02 00 00       	jmp    3470 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    3203:	8b 45 0c             	mov    0xc(%ebp),%eax
    3206:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    320c:	e9 2a 02 00 00       	jmp    343b <readVariables+0x27a>
  {
    int pos = 0;
    3211:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    3218:	00 00 00 
    while(pos <= n-1)
    321b:	e9 07 02 00 00       	jmp    3427 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    3220:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    3227:	eb 24                	jmp    324d <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    3229:	8b 45 f4             	mov    -0xc(%ebp),%eax
    322c:	8d 50 ff             	lea    -0x1(%eax),%edx
    322f:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    3235:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3238:	01 c8                	add    %ecx,%eax
    323a:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3241:	ff 
    3242:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    3249:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    324d:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3253:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3256:	01 d0                	add    %edx,%eax
    3258:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    325f:	ff 
    3260:	3c 3d                	cmp    $0x3d,%al
    3262:	75 c5                	jne    3229 <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    3264:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3267:	83 e8 01             	sub    $0x1,%eax
    326a:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    3271:	00 
      if(buf[pos] == 'd') //double value
    3272:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3278:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    327f:	ff 
    3280:	3c 64                	cmp    $0x64,%al
    3282:	0f 85 a0 00 00 00    	jne    3328 <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    3288:	8b 45 0c             	mov    0xc(%ebp),%eax
    328b:	8b 00                	mov    (%eax),%eax
    328d:	c1 e0 05             	shl    $0x5,%eax
    3290:	89 c2                	mov    %eax,%edx
    3292:	8b 45 08             	mov    0x8(%ebp),%eax
    3295:	01 d0                	add    %edx,%eax
    3297:	8d 50 04             	lea    0x4(%eax),%edx
    329a:	83 ec 08             	sub    $0x8,%esp
    329d:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    32a3:	50                   	push   %eax
    32a4:	52                   	push   %edx
    32a5:	e8 8c ce ff ff       	call   136 <strcpy>
    32aa:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    32ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32b0:	8d 50 01             	lea    0x1(%eax),%edx
    32b3:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    32b9:	01 d0                	add    %edx,%eax
    32bb:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    32c1:	83 ec 08             	sub    $0x8,%esp
    32c4:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    32ca:	50                   	push   %eax
    32cb:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    32d1:	50                   	push   %eax
    32d2:	e8 7b d9 ff ff       	call   c52 <Translation>
    32d7:	83 c4 10             	add    $0x10,%esp
    32da:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    32dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    32e0:	8b 00                	mov    (%eax),%eax
    32e2:	c1 e0 05             	shl    $0x5,%eax
    32e5:	89 c2                	mov    %eax,%edx
    32e7:	8b 45 08             	mov    0x8(%ebp),%eax
    32ea:	01 d0                	add    %edx,%eax
    32ec:	dd 45 d8             	fldl   -0x28(%ebp)
    32ef:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    32f2:	8b 45 0c             	mov    0xc(%ebp),%eax
    32f5:	8b 00                	mov    (%eax),%eax
    32f7:	c1 e0 05             	shl    $0x5,%eax
    32fa:	89 c2                	mov    %eax,%edx
    32fc:	8b 45 08             	mov    0x8(%ebp),%eax
    32ff:	01 d0                	add    %edx,%eax
    3301:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    3307:	8b 45 0c             	mov    0xc(%ebp),%eax
    330a:	8b 00                	mov    (%eax),%eax
    330c:	8d 50 01             	lea    0x1(%eax),%edx
    330f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3312:	89 10                	mov    %edx,(%eax)
        pos++;
    3314:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    331a:	83 c0 01             	add    $0x1,%eax
    331d:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    3323:	e9 ff 00 00 00       	jmp    3427 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    3328:	8b 45 0c             	mov    0xc(%ebp),%eax
    332b:	8b 00                	mov    (%eax),%eax
    332d:	c1 e0 05             	shl    $0x5,%eax
    3330:	89 c2                	mov    %eax,%edx
    3332:	8b 45 08             	mov    0x8(%ebp),%eax
    3335:	01 d0                	add    %edx,%eax
    3337:	8d 50 04             	lea    0x4(%eax),%edx
    333a:	83 ec 08             	sub    $0x8,%esp
    333d:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3343:	50                   	push   %eax
    3344:	52                   	push   %edx
    3345:	e8 ec cd ff ff       	call   136 <strcpy>
    334a:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    334d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3350:	8d 50 01             	lea    0x1(%eax),%edx
    3353:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3359:	01 d0                	add    %edx,%eax
    335b:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    3361:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3367:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    336a:	eb 04                	jmp    3370 <readVariables+0x1af>
        {
          strend++;
    336c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    3370:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    3376:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3379:	01 d0                	add    %edx,%eax
    337b:	0f b6 00             	movzbl (%eax),%eax
    337e:	84 c0                	test   %al,%al
    3380:	75 ea                	jne    336c <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    3382:	8b 45 0c             	mov    0xc(%ebp),%eax
    3385:	8b 00                	mov    (%eax),%eax
    3387:	c1 e0 05             	shl    $0x5,%eax
    338a:	89 c2                	mov    %eax,%edx
    338c:	8b 45 08             	mov    0x8(%ebp),%eax
    338f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    3392:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3398:	8b 55 f0             	mov    -0x10(%ebp),%edx
    339b:	29 c2                	sub    %eax,%edx
    339d:	89 d0                	mov    %edx,%eax
    339f:	83 c0 01             	add    $0x1,%eax
    33a2:	83 ec 0c             	sub    $0xc,%esp
    33a5:	50                   	push   %eax
    33a6:	e8 6a d5 ff ff       	call   915 <malloc>
    33ab:	83 c4 10             	add    $0x10,%esp
    33ae:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    33b1:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    33b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    33ba:	eb 35                	jmp    33f1 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    33bc:	8b 45 0c             	mov    0xc(%ebp),%eax
    33bf:	8b 00                	mov    (%eax),%eax
    33c1:	c1 e0 05             	shl    $0x5,%eax
    33c4:	89 c2                	mov    %eax,%edx
    33c6:	8b 45 08             	mov    0x8(%ebp),%eax
    33c9:	01 d0                	add    %edx,%eax
    33cb:	8b 40 18             	mov    0x18(%eax),%eax
    33ce:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    33d4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    33d7:	29 d1                	sub    %edx,%ecx
    33d9:	89 ca                	mov    %ecx,%edx
    33db:	01 c2                	add    %eax,%edx
    33dd:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    33e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33e6:	01 c8                	add    %ecx,%eax
    33e8:	0f b6 00             	movzbl (%eax),%eax
    33eb:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    33ed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    33f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33f4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    33f7:	7e c3                	jle    33bc <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    33f9:	8b 45 0c             	mov    0xc(%ebp),%eax
    33fc:	8b 00                	mov    (%eax),%eax
    33fe:	c1 e0 05             	shl    $0x5,%eax
    3401:	89 c2                	mov    %eax,%edx
    3403:	8b 45 08             	mov    0x8(%ebp),%eax
    3406:	01 d0                	add    %edx,%eax
    3408:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    340e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3411:	8b 00                	mov    (%eax),%eax
    3413:	8d 50 01             	lea    0x1(%eax),%edx
    3416:	8b 45 0c             	mov    0xc(%ebp),%eax
    3419:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    341b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    341e:	83 c0 01             	add    $0x1,%eax
    3421:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    3427:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    342a:	8d 50 ff             	lea    -0x1(%eax),%edx
    342d:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3433:	39 c2                	cmp    %eax,%edx
    3435:	0f 8d e5 fd ff ff    	jge    3220 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    343b:	83 ec 04             	sub    $0x4,%esp
    343e:	68 e8 03 00 00       	push   $0x3e8
    3443:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3449:	50                   	push   %eax
    344a:	ff 75 e8             	pushl  -0x18(%ebp)
    344d:	e8 2d cf ff ff       	call   37f <read>
    3452:	83 c4 10             	add    $0x10,%esp
    3455:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3458:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    345c:	0f 8f af fd ff ff    	jg     3211 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    3462:	83 ec 0c             	sub    $0xc,%esp
    3465:	ff 75 e8             	pushl  -0x18(%ebp)
    3468:	e8 22 cf ff ff       	call   38f <close>
    346d:	83 c4 10             	add    $0x10,%esp
}
    3470:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3473:	c9                   	leave  
    3474:	c3                   	ret    

00003475 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3475:	55                   	push   %ebp
    3476:	89 e5                	mov    %esp,%ebp
    3478:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    347e:	83 ec 08             	sub    $0x8,%esp
    3481:	6a 02                	push   $0x2
    3483:	68 d0 39 00 00       	push   $0x39d0
    3488:	e8 1a cf ff ff       	call   3a7 <open>
    348d:	83 c4 10             	add    $0x10,%esp
    3490:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3493:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3497:	78 1e                	js     34b7 <writeVariables+0x42>
  {
    close(fd);
    3499:	83 ec 0c             	sub    $0xc,%esp
    349c:	ff 75 e4             	pushl  -0x1c(%ebp)
    349f:	e8 eb ce ff ff       	call   38f <close>
    34a4:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    34a7:	83 ec 0c             	sub    $0xc,%esp
    34aa:	68 d0 39 00 00       	push   $0x39d0
    34af:	e8 03 cf ff ff       	call   3b7 <unlink>
    34b4:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    34b7:	83 ec 08             	sub    $0x8,%esp
    34ba:	68 02 02 00 00       	push   $0x202
    34bf:	68 d0 39 00 00       	push   $0x39d0
    34c4:	e8 de ce ff ff       	call   3a7 <open>
    34c9:	83 c4 10             	add    $0x10,%esp
    34cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    34cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    34d6:	e9 ff 01 00 00       	jmp    36da <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    34db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34de:	c1 e0 05             	shl    $0x5,%eax
    34e1:	89 c2                	mov    %eax,%edx
    34e3:	8b 45 08             	mov    0x8(%ebp),%eax
    34e6:	01 d0                	add    %edx,%eax
    34e8:	8b 00                	mov    (%eax),%eax
    34ea:	83 f8 01             	cmp    $0x1,%eax
    34ed:	0f 85 d3 00 00 00    	jne    35c6 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    34f3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    34fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
    34fd:	8d 50 01             	lea    0x1(%eax),%edx
    3500:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3503:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    350a:	64 
      int k=0;
    350b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    3512:	eb 2c                	jmp    3540 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    3514:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3517:	8d 50 01             	lea    0x1(%eax),%edx
    351a:	89 55 e0             	mov    %edx,-0x20(%ebp)
    351d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3520:	89 d1                	mov    %edx,%ecx
    3522:	c1 e1 05             	shl    $0x5,%ecx
    3525:	8b 55 08             	mov    0x8(%ebp),%edx
    3528:	01 d1                	add    %edx,%ecx
    352a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    352d:	01 ca                	add    %ecx,%edx
    352f:	83 c2 04             	add    $0x4,%edx
    3532:	0f b6 12             	movzbl (%edx),%edx
    3535:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    353c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    3540:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3543:	c1 e0 05             	shl    $0x5,%eax
    3546:	89 c2                	mov    %eax,%edx
    3548:	8b 45 08             	mov    0x8(%ebp),%eax
    354b:	01 c2                	add    %eax,%edx
    354d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3550:	01 d0                	add    %edx,%eax
    3552:	83 c0 04             	add    $0x4,%eax
    3555:	0f b6 00             	movzbl (%eax),%eax
    3558:	84 c0                	test   %al,%al
    355a:	75 b8                	jne    3514 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    355c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    355f:	8d 50 01             	lea    0x1(%eax),%edx
    3562:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3565:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    356c:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    356d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3570:	c1 e0 05             	shl    $0x5,%eax
    3573:	89 c2                	mov    %eax,%edx
    3575:	8b 45 08             	mov    0x8(%ebp),%eax
    3578:	01 d0                	add    %edx,%eax
    357a:	dd 40 18             	fldl   0x18(%eax)
    357d:	8d 45 e0             	lea    -0x20(%ebp),%eax
    3580:	50                   	push   %eax
    3581:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3585:	dd 1c 24             	fstpl  (%esp)
    3588:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    358e:	50                   	push   %eax
    358f:	e8 7d d5 ff ff       	call   b11 <double2str>
    3594:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    3597:	8b 45 e0             	mov    -0x20(%ebp),%eax
    359a:	8d 50 01             	lea    0x1(%eax),%edx
    359d:	89 55 e0             	mov    %edx,-0x20(%ebp)
    35a0:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    35a7:	00 
      write(fd,buf,pos);
    35a8:	8b 45 e0             	mov    -0x20(%ebp),%eax
    35ab:	83 ec 04             	sub    $0x4,%esp
    35ae:	50                   	push   %eax
    35af:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    35b5:	50                   	push   %eax
    35b6:	ff 75 e4             	pushl  -0x1c(%ebp)
    35b9:	e8 c9 cd ff ff       	call   387 <write>
    35be:	83 c4 10             	add    $0x10,%esp
    35c1:	e9 10 01 00 00       	jmp    36d6 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    35c6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    35cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35d0:	8d 50 01             	lea    0x1(%eax),%edx
    35d3:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35d6:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    35dd:	73 
      int k=0;
    35de:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    35e5:	eb 2c                	jmp    3613 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    35e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35ea:	8d 50 01             	lea    0x1(%eax),%edx
    35ed:	89 55 ec             	mov    %edx,-0x14(%ebp)
    35f0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    35f3:	89 d1                	mov    %edx,%ecx
    35f5:	c1 e1 05             	shl    $0x5,%ecx
    35f8:	8b 55 08             	mov    0x8(%ebp),%edx
    35fb:	01 d1                	add    %edx,%ecx
    35fd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3600:	01 ca                	add    %ecx,%edx
    3602:	83 c2 04             	add    $0x4,%edx
    3605:	0f b6 12             	movzbl (%edx),%edx
    3608:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    360f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    3613:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3616:	c1 e0 05             	shl    $0x5,%eax
    3619:	89 c2                	mov    %eax,%edx
    361b:	8b 45 08             	mov    0x8(%ebp),%eax
    361e:	01 c2                	add    %eax,%edx
    3620:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3623:	01 d0                	add    %edx,%eax
    3625:	83 c0 04             	add    $0x4,%eax
    3628:	0f b6 00             	movzbl (%eax),%eax
    362b:	84 c0                	test   %al,%al
    362d:	75 b8                	jne    35e7 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    362f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3632:	8d 50 01             	lea    0x1(%eax),%edx
    3635:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3638:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    363f:	3d 
      k=0;
    3640:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    3647:	eb 2c                	jmp    3675 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    3649:	8b 45 ec             	mov    -0x14(%ebp),%eax
    364c:	8d 50 01             	lea    0x1(%eax),%edx
    364f:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3652:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3655:	89 d1                	mov    %edx,%ecx
    3657:	c1 e1 05             	shl    $0x5,%ecx
    365a:	8b 55 08             	mov    0x8(%ebp),%edx
    365d:	01 ca                	add    %ecx,%edx
    365f:	8b 4a 18             	mov    0x18(%edx),%ecx
    3662:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3665:	01 ca                	add    %ecx,%edx
    3667:	0f b6 12             	movzbl (%edx),%edx
    366a:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3671:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    3675:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3678:	c1 e0 05             	shl    $0x5,%eax
    367b:	89 c2                	mov    %eax,%edx
    367d:	8b 45 08             	mov    0x8(%ebp),%eax
    3680:	01 d0                	add    %edx,%eax
    3682:	8b 50 18             	mov    0x18(%eax),%edx
    3685:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3688:	01 d0                	add    %edx,%eax
    368a:	0f b6 00             	movzbl (%eax),%eax
    368d:	84 c0                	test   %al,%al
    368f:	75 b8                	jne    3649 <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    3691:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3694:	8d 50 01             	lea    0x1(%eax),%edx
    3697:	89 55 ec             	mov    %edx,-0x14(%ebp)
    369a:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    36a1:	00 
      write(fd,buf,pos);
    36a2:	83 ec 04             	sub    $0x4,%esp
    36a5:	ff 75 ec             	pushl  -0x14(%ebp)
    36a8:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    36ae:	50                   	push   %eax
    36af:	ff 75 e4             	pushl  -0x1c(%ebp)
    36b2:	e8 d0 cc ff ff       	call   387 <write>
    36b7:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    36ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36bd:	c1 e0 05             	shl    $0x5,%eax
    36c0:	89 c2                	mov    %eax,%edx
    36c2:	8b 45 08             	mov    0x8(%ebp),%eax
    36c5:	01 d0                	add    %edx,%eax
    36c7:	8b 40 18             	mov    0x18(%eax),%eax
    36ca:	83 ec 0c             	sub    $0xc,%esp
    36cd:	50                   	push   %eax
    36ce:	e8 00 d1 ff ff       	call   7d3 <free>
    36d3:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    36d6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    36da:	8b 45 0c             	mov    0xc(%ebp),%eax
    36dd:	8b 00                	mov    (%eax),%eax
    36df:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    36e2:	0f 8f f3 fd ff ff    	jg     34db <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    36e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    36eb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    36f1:	83 ec 0c             	sub    $0xc,%esp
    36f4:	ff 75 e4             	pushl  -0x1c(%ebp)
    36f7:	e8 93 cc ff ff       	call   38f <close>
    36fc:	83 c4 10             	add    $0x10,%esp
  return;
    36ff:	90                   	nop
    3700:	c9                   	leave  
    3701:	c3                   	ret    
