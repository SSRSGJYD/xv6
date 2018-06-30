
_unalias：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "xv_user.h"
#include "xv_color.h"

//stereotype: unalias ***
int main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	81 ec 84 00 00 00    	sub    $0x84,%esp
      14:	89 c8                	mov    %ecx,%eax
    if(argc != 2)
      16:	83 38 02             	cmpl   $0x2,(%eax)
      19:	74 2f                	je     4a <main+0x4a>
    {
        color_printf(XV_RED,1,XV_BLACK,0,"Incorrect format!");
      1b:	83 ec 0c             	sub    $0xc,%esp
      1e:	68 58 38 00 00       	push   $0x3858
      23:	6a 00                	push   $0x0
      25:	6a 00                	push   $0x0
      27:	6a 01                	push   $0x1
      29:	6a 04                	push   $0x4
      2b:	e8 5d 2e 00 00       	call   2e8d <color_printf>
      30:	83 c4 20             	add    $0x20,%esp
		printf(1,"\n");
      33:	83 ec 08             	sub    $0x8,%esp
      36:	68 6a 38 00 00       	push   $0x386a
      3b:	6a 01                	push   $0x1
      3d:	e8 23 07 00 00       	call   765 <printf>
      42:	83 c4 10             	add    $0x10,%esp
      45:	e9 13 02 00 00       	jmp    25d <main+0x25d>
    }
    else
    {
        char *aliasname = argv[1];
      4a:	8b 40 04             	mov    0x4(%eax),%eax
      4d:	8b 40 04             	mov    0x4(%eax),%eax
      50:	89 45 e0             	mov    %eax,-0x20(%ebp)
        int n;
        char buf[50];
        int fd;
        if((fd = open("aliasfile", O_RDWR)) < 0)
      53:	83 ec 08             	sub    $0x8,%esp
      56:	6a 02                	push   $0x2
      58:	68 6c 38 00 00       	push   $0x386c
      5d:	e8 97 04 00 00       	call   4f9 <open>
      62:	83 c4 10             	add    $0x10,%esp
      65:	89 45 dc             	mov    %eax,-0x24(%ebp)
      68:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
      6c:	79 2f                	jns    9d <main+0x9d>
        {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot unalias an unused word!");
      6e:	83 ec 0c             	sub    $0xc,%esp
      71:	68 78 38 00 00       	push   $0x3878
      76:	6a 00                	push   $0x0
      78:	6a 00                	push   $0x0
      7a:	6a 01                	push   $0x1
      7c:	6a 04                	push   $0x4
      7e:	e8 0a 2e 00 00       	call   2e8d <color_printf>
      83:	83 c4 20             	add    $0x20,%esp
		    printf(1,"\n");
      86:	83 ec 08             	sub    $0x8,%esp
      89:	68 6a 38 00 00       	push   $0x386a
      8e:	6a 01                	push   $0x1
      90:	e8 d0 06 00 00       	call   765 <printf>
      95:	83 c4 10             	add    $0x10,%esp
      98:	e9 c0 01 00 00       	jmp    25d <main+0x25d>
        }
        else
        {
            int notUsed = 1;
      9d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            //check if there is already the alias name
            while((n = read(fd,&buf,sizeof(buf))) > 0)
      a4:	e9 cc 00 00 00       	jmp    175 <main+0x175>
            {
                int isSame = 1;
      a9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
                int isUnalias = 0;
      b0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
                int startIndex = 0;
      b7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
                int otherIndex = 0;
      be:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
                int len1 = strlen(buf);
      c5:	83 ec 0c             	sub    $0xc,%esp
      c8:	8d 45 86             	lea    -0x7a(%ebp),%eax
      cb:	50                   	push   %eax
      cc:	e8 26 02 00 00       	call   2f7 <strlen>
      d1:	83 c4 10             	add    $0x10,%esp
      d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
                int len2 = strlen(aliasname);
      d7:	83 ec 0c             	sub    $0xc,%esp
      da:	ff 75 e0             	pushl  -0x20(%ebp)
      dd:	e8 15 02 00 00       	call   2f7 <strlen>
      e2:	83 c4 10             	add    $0x10,%esp
      e5:	89 45 cc             	mov    %eax,-0x34(%ebp)
                if(buf[startIndex] == '!') //unalias
      e8:	8d 55 86             	lea    -0x7a(%ebp),%edx
      eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
      ee:	01 d0                	add    %edx,%eax
      f0:	0f b6 00             	movzbl (%eax),%eax
      f3:	3c 21                	cmp    $0x21,%al
      f5:	75 38                	jne    12f <main+0x12f>
                {
                    startIndex++;
      f7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
                    isUnalias = 1;
      fb:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
                }
                while(buf[startIndex] != '=' && otherIndex < len2)
     102:	eb 2b                	jmp    12f <main+0x12f>
                {
                    if(buf[startIndex] != aliasname[otherIndex])
     104:	8d 55 86             	lea    -0x7a(%ebp),%edx
     107:	8b 45 ec             	mov    -0x14(%ebp),%eax
     10a:	01 d0                	add    %edx,%eax
     10c:	0f b6 10             	movzbl (%eax),%edx
     10f:	8b 4d e8             	mov    -0x18(%ebp),%ecx
     112:	8b 45 e0             	mov    -0x20(%ebp),%eax
     115:	01 c8                	add    %ecx,%eax
     117:	0f b6 00             	movzbl (%eax),%eax
     11a:	38 c2                	cmp    %al,%dl
     11c:	74 09                	je     127 <main+0x127>
                    {
                        isSame = 0;
     11e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                        break;
     125:	eb 1f                	jmp    146 <main+0x146>
                    }
                    startIndex++;
     127:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
                    otherIndex++;
     12b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
                if(buf[startIndex] == '!') //unalias
                {
                    startIndex++;
                    isUnalias = 1;
                }
                while(buf[startIndex] != '=' && otherIndex < len2)
     12f:	8d 55 86             	lea    -0x7a(%ebp),%edx
     132:	8b 45 ec             	mov    -0x14(%ebp),%eax
     135:	01 d0                	add    %edx,%eax
     137:	0f b6 00             	movzbl (%eax),%eax
     13a:	3c 3d                	cmp    $0x3d,%al
     13c:	74 08                	je     146 <main+0x146>
     13e:	8b 45 e8             	mov    -0x18(%ebp),%eax
     141:	3b 45 cc             	cmp    -0x34(%ebp),%eax
     144:	7c be                	jl     104 <main+0x104>
                        break;
                    }
                    startIndex++;
                    otherIndex++;
                }
                if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
     146:	8d 55 86             	lea    -0x7a(%ebp),%edx
     149:	8b 45 ec             	mov    -0x14(%ebp),%eax
     14c:	01 d0                	add    %edx,%eax
     14e:	0f b6 00             	movzbl (%eax),%eax
     151:	3c 3d                	cmp    $0x3d,%al
     153:	75 08                	jne    15d <main+0x15d>
     155:	8b 45 e8             	mov    -0x18(%ebp),%eax
     158:	3b 45 cc             	cmp    -0x34(%ebp),%eax
     15b:	7d 07                	jge    164 <main+0x164>
                {
                    isSame = 0;
     15d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                }
                if(isSame == 1)
     164:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
     168:	75 0b                	jne    175 <main+0x175>
                {
                    notUsed = 1-notUsed;
     16a:	b8 01 00 00 00       	mov    $0x1,%eax
     16f:	2b 45 f4             	sub    -0xc(%ebp),%eax
     172:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else
        {
            int notUsed = 1;
            //check if there is already the alias name
            while((n = read(fd,&buf,sizeof(buf))) > 0)
     175:	83 ec 04             	sub    $0x4,%esp
     178:	6a 32                	push   $0x32
     17a:	8d 45 86             	lea    -0x7a(%ebp),%eax
     17d:	50                   	push   %eax
     17e:	ff 75 dc             	pushl  -0x24(%ebp)
     181:	e8 4b 03 00 00       	call   4d1 <read>
     186:	83 c4 10             	add    $0x10,%esp
     189:	89 45 d8             	mov    %eax,-0x28(%ebp)
     18c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
     190:	0f 8f 13 ff ff ff    	jg     a9 <main+0xa9>
                if(isSame == 1)
                {
                    notUsed = 1-notUsed;
                }
            }
            if(notUsed == 1)
     196:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
     19a:	75 2f                	jne    1cb <main+0x1cb>
            {
                color_printf(XV_RED,1,XV_BLACK,0,"Cannot unalias an unused word!");
     19c:	83 ec 0c             	sub    $0xc,%esp
     19f:	68 78 38 00 00       	push   $0x3878
     1a4:	6a 00                	push   $0x0
     1a6:	6a 00                	push   $0x0
     1a8:	6a 01                	push   $0x1
     1aa:	6a 04                	push   $0x4
     1ac:	e8 dc 2c 00 00       	call   2e8d <color_printf>
     1b1:	83 c4 20             	add    $0x20,%esp
                printf(1,"\n");
     1b4:	83 ec 08             	sub    $0x8,%esp
     1b7:	68 6a 38 00 00       	push   $0x386a
     1bc:	6a 01                	push   $0x1
     1be:	e8 a2 05 00 00       	call   765 <printf>
     1c3:	83 c4 10             	add    $0x10,%esp
     1c6:	e9 84 00 00 00       	jmp    24f <main+0x24f>
            }
            else
            {
                char buf[20];
                buf[0] = '!';
     1cb:	c6 45 b8 21          	movb   $0x21,-0x48(%ebp)
                int i = 0;
     1cf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                while(aliasname[i] != '\0')
     1d6:	eb 19                	jmp    1f1 <main+0x1f1>
                {
                    buf[i+1] = aliasname[i];
     1d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     1db:	8d 50 01             	lea    0x1(%eax),%edx
     1de:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     1e1:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1e4:	01 c8                	add    %ecx,%eax
     1e6:	0f b6 00             	movzbl (%eax),%eax
     1e9:	88 44 15 b8          	mov    %al,-0x48(%ebp,%edx,1)
                    i++;
     1ed:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
            else
            {
                char buf[20];
                buf[0] = '!';
                int i = 0;
                while(aliasname[i] != '\0')
     1f1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     1f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1f7:	01 d0                	add    %edx,%eax
     1f9:	0f b6 00             	movzbl (%eax),%eax
     1fc:	84 c0                	test   %al,%al
     1fe:	75 d8                	jne    1d8 <main+0x1d8>
                {
                    buf[i+1] = aliasname[i];
                    i++;
                }
                buf[i++] = '\0';
     200:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     203:	8d 50 01             	lea    0x1(%eax),%edx
     206:	89 55 e4             	mov    %edx,-0x1c(%ebp)
     209:	c6 44 05 b8 00       	movb   $0x0,-0x48(%ebp,%eax,1)
                write(fd,buf,sizeof(buf));
     20e:	83 ec 04             	sub    $0x4,%esp
     211:	6a 14                	push   $0x14
     213:	8d 45 b8             	lea    -0x48(%ebp),%eax
     216:	50                   	push   %eax
     217:	ff 75 dc             	pushl  -0x24(%ebp)
     21a:	e8 ba 02 00 00       	call   4d9 <write>
     21f:	83 c4 10             	add    $0x10,%esp
                color_printf(XV_CYAN,1,XV_BLACK,0,"Unalias %s",aliasname);
     222:	83 ec 08             	sub    $0x8,%esp
     225:	ff 75 e0             	pushl  -0x20(%ebp)
     228:	68 97 38 00 00       	push   $0x3897
     22d:	6a 00                	push   $0x0
     22f:	6a 00                	push   $0x0
     231:	6a 01                	push   $0x1
     233:	6a 03                	push   $0x3
     235:	e8 53 2c 00 00       	call   2e8d <color_printf>
     23a:	83 c4 20             	add    $0x20,%esp
                printf(1,"\n");
     23d:	83 ec 08             	sub    $0x8,%esp
     240:	68 6a 38 00 00       	push   $0x386a
     245:	6a 01                	push   $0x1
     247:	e8 19 05 00 00       	call   765 <printf>
     24c:	83 c4 10             	add    $0x10,%esp
            }
            close(fd);
     24f:	83 ec 0c             	sub    $0xc,%esp
     252:	ff 75 dc             	pushl  -0x24(%ebp)
     255:	e8 87 02 00 00       	call   4e1 <close>
     25a:	83 c4 10             	add    $0x10,%esp
        }
    }
    exit();
     25d:	e8 57 02 00 00       	call   4b9 <exit>

00000262 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     262:	55                   	push   %ebp
     263:	89 e5                	mov    %esp,%ebp
     265:	57                   	push   %edi
     266:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     267:	8b 4d 08             	mov    0x8(%ebp),%ecx
     26a:	8b 55 10             	mov    0x10(%ebp),%edx
     26d:	8b 45 0c             	mov    0xc(%ebp),%eax
     270:	89 cb                	mov    %ecx,%ebx
     272:	89 df                	mov    %ebx,%edi
     274:	89 d1                	mov    %edx,%ecx
     276:	fc                   	cld    
     277:	f3 aa                	rep stos %al,%es:(%edi)
     279:	89 ca                	mov    %ecx,%edx
     27b:	89 fb                	mov    %edi,%ebx
     27d:	89 5d 08             	mov    %ebx,0x8(%ebp)
     280:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     283:	90                   	nop
     284:	5b                   	pop    %ebx
     285:	5f                   	pop    %edi
     286:	5d                   	pop    %ebp
     287:	c3                   	ret    

00000288 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     288:	55                   	push   %ebp
     289:	89 e5                	mov    %esp,%ebp
     28b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     28e:	8b 45 08             	mov    0x8(%ebp),%eax
     291:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     294:	90                   	nop
     295:	8b 45 08             	mov    0x8(%ebp),%eax
     298:	8d 50 01             	lea    0x1(%eax),%edx
     29b:	89 55 08             	mov    %edx,0x8(%ebp)
     29e:	8b 55 0c             	mov    0xc(%ebp),%edx
     2a1:	8d 4a 01             	lea    0x1(%edx),%ecx
     2a4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     2a7:	0f b6 12             	movzbl (%edx),%edx
     2aa:	88 10                	mov    %dl,(%eax)
     2ac:	0f b6 00             	movzbl (%eax),%eax
     2af:	84 c0                	test   %al,%al
     2b1:	75 e2                	jne    295 <strcpy+0xd>
    ;
  return os;
     2b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     2b6:	c9                   	leave  
     2b7:	c3                   	ret    

000002b8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     2b8:	55                   	push   %ebp
     2b9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     2bb:	eb 08                	jmp    2c5 <strcmp+0xd>
    p++, q++;
     2bd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     2c1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     2c5:	8b 45 08             	mov    0x8(%ebp),%eax
     2c8:	0f b6 00             	movzbl (%eax),%eax
     2cb:	84 c0                	test   %al,%al
     2cd:	74 10                	je     2df <strcmp+0x27>
     2cf:	8b 45 08             	mov    0x8(%ebp),%eax
     2d2:	0f b6 10             	movzbl (%eax),%edx
     2d5:	8b 45 0c             	mov    0xc(%ebp),%eax
     2d8:	0f b6 00             	movzbl (%eax),%eax
     2db:	38 c2                	cmp    %al,%dl
     2dd:	74 de                	je     2bd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     2df:	8b 45 08             	mov    0x8(%ebp),%eax
     2e2:	0f b6 00             	movzbl (%eax),%eax
     2e5:	0f b6 d0             	movzbl %al,%edx
     2e8:	8b 45 0c             	mov    0xc(%ebp),%eax
     2eb:	0f b6 00             	movzbl (%eax),%eax
     2ee:	0f b6 c0             	movzbl %al,%eax
     2f1:	29 c2                	sub    %eax,%edx
     2f3:	89 d0                	mov    %edx,%eax
}
     2f5:	5d                   	pop    %ebp
     2f6:	c3                   	ret    

000002f7 <strlen>:

uint
strlen(char *s)
{
     2f7:	55                   	push   %ebp
     2f8:	89 e5                	mov    %esp,%ebp
     2fa:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     2fd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     304:	eb 04                	jmp    30a <strlen+0x13>
     306:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     30a:	8b 55 fc             	mov    -0x4(%ebp),%edx
     30d:	8b 45 08             	mov    0x8(%ebp),%eax
     310:	01 d0                	add    %edx,%eax
     312:	0f b6 00             	movzbl (%eax),%eax
     315:	84 c0                	test   %al,%al
     317:	75 ed                	jne    306 <strlen+0xf>
    ;
  return n;
     319:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     31c:	c9                   	leave  
     31d:	c3                   	ret    

0000031e <memset>:

void*
memset(void *dst, int c, uint n)
{
     31e:	55                   	push   %ebp
     31f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     321:	8b 45 10             	mov    0x10(%ebp),%eax
     324:	50                   	push   %eax
     325:	ff 75 0c             	pushl  0xc(%ebp)
     328:	ff 75 08             	pushl  0x8(%ebp)
     32b:	e8 32 ff ff ff       	call   262 <stosb>
     330:	83 c4 0c             	add    $0xc,%esp
  return dst;
     333:	8b 45 08             	mov    0x8(%ebp),%eax
}
     336:	c9                   	leave  
     337:	c3                   	ret    

00000338 <strchr>:

char*
strchr(const char *s, char c)
{
     338:	55                   	push   %ebp
     339:	89 e5                	mov    %esp,%ebp
     33b:	83 ec 04             	sub    $0x4,%esp
     33e:	8b 45 0c             	mov    0xc(%ebp),%eax
     341:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     344:	eb 14                	jmp    35a <strchr+0x22>
    if(*s == c)
     346:	8b 45 08             	mov    0x8(%ebp),%eax
     349:	0f b6 00             	movzbl (%eax),%eax
     34c:	3a 45 fc             	cmp    -0x4(%ebp),%al
     34f:	75 05                	jne    356 <strchr+0x1e>
      return (char*)s;
     351:	8b 45 08             	mov    0x8(%ebp),%eax
     354:	eb 13                	jmp    369 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     356:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     35a:	8b 45 08             	mov    0x8(%ebp),%eax
     35d:	0f b6 00             	movzbl (%eax),%eax
     360:	84 c0                	test   %al,%al
     362:	75 e2                	jne    346 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     364:	b8 00 00 00 00       	mov    $0x0,%eax
}
     369:	c9                   	leave  
     36a:	c3                   	ret    

0000036b <gets>:

char*
gets(char *buf, int max)
{
     36b:	55                   	push   %ebp
     36c:	89 e5                	mov    %esp,%ebp
     36e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     371:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     378:	eb 42                	jmp    3bc <gets+0x51>
    cc = read(0, &c, 1);
     37a:	83 ec 04             	sub    $0x4,%esp
     37d:	6a 01                	push   $0x1
     37f:	8d 45 ef             	lea    -0x11(%ebp),%eax
     382:	50                   	push   %eax
     383:	6a 00                	push   $0x0
     385:	e8 47 01 00 00       	call   4d1 <read>
     38a:	83 c4 10             	add    $0x10,%esp
     38d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     390:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     394:	7e 33                	jle    3c9 <gets+0x5e>
      break;
    buf[i++] = c;
     396:	8b 45 f4             	mov    -0xc(%ebp),%eax
     399:	8d 50 01             	lea    0x1(%eax),%edx
     39c:	89 55 f4             	mov    %edx,-0xc(%ebp)
     39f:	89 c2                	mov    %eax,%edx
     3a1:	8b 45 08             	mov    0x8(%ebp),%eax
     3a4:	01 c2                	add    %eax,%edx
     3a6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     3aa:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     3ac:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     3b0:	3c 0a                	cmp    $0xa,%al
     3b2:	74 16                	je     3ca <gets+0x5f>
     3b4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     3b8:	3c 0d                	cmp    $0xd,%al
     3ba:	74 0e                	je     3ca <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     3bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3bf:	83 c0 01             	add    $0x1,%eax
     3c2:	3b 45 0c             	cmp    0xc(%ebp),%eax
     3c5:	7c b3                	jl     37a <gets+0xf>
     3c7:	eb 01                	jmp    3ca <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     3c9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     3ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
     3cd:	8b 45 08             	mov    0x8(%ebp),%eax
     3d0:	01 d0                	add    %edx,%eax
     3d2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     3d5:	8b 45 08             	mov    0x8(%ebp),%eax
}
     3d8:	c9                   	leave  
     3d9:	c3                   	ret    

000003da <stat>:

int
stat(char *n, struct stat *st)
{
     3da:	55                   	push   %ebp
     3db:	89 e5                	mov    %esp,%ebp
     3dd:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     3e0:	83 ec 08             	sub    $0x8,%esp
     3e3:	6a 00                	push   $0x0
     3e5:	ff 75 08             	pushl  0x8(%ebp)
     3e8:	e8 0c 01 00 00       	call   4f9 <open>
     3ed:	83 c4 10             	add    $0x10,%esp
     3f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     3f3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     3f7:	79 07                	jns    400 <stat+0x26>
    return -1;
     3f9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     3fe:	eb 25                	jmp    425 <stat+0x4b>
  r = fstat(fd, st);
     400:	83 ec 08             	sub    $0x8,%esp
     403:	ff 75 0c             	pushl  0xc(%ebp)
     406:	ff 75 f4             	pushl  -0xc(%ebp)
     409:	e8 03 01 00 00       	call   511 <fstat>
     40e:	83 c4 10             	add    $0x10,%esp
     411:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     414:	83 ec 0c             	sub    $0xc,%esp
     417:	ff 75 f4             	pushl  -0xc(%ebp)
     41a:	e8 c2 00 00 00       	call   4e1 <close>
     41f:	83 c4 10             	add    $0x10,%esp
  return r;
     422:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     425:	c9                   	leave  
     426:	c3                   	ret    

00000427 <atoi>:

int
atoi(const char *s)
{
     427:	55                   	push   %ebp
     428:	89 e5                	mov    %esp,%ebp
     42a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     42d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     434:	eb 25                	jmp    45b <atoi+0x34>
    n = n*10 + *s++ - '0';
     436:	8b 55 fc             	mov    -0x4(%ebp),%edx
     439:	89 d0                	mov    %edx,%eax
     43b:	c1 e0 02             	shl    $0x2,%eax
     43e:	01 d0                	add    %edx,%eax
     440:	01 c0                	add    %eax,%eax
     442:	89 c1                	mov    %eax,%ecx
     444:	8b 45 08             	mov    0x8(%ebp),%eax
     447:	8d 50 01             	lea    0x1(%eax),%edx
     44a:	89 55 08             	mov    %edx,0x8(%ebp)
     44d:	0f b6 00             	movzbl (%eax),%eax
     450:	0f be c0             	movsbl %al,%eax
     453:	01 c8                	add    %ecx,%eax
     455:	83 e8 30             	sub    $0x30,%eax
     458:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     45b:	8b 45 08             	mov    0x8(%ebp),%eax
     45e:	0f b6 00             	movzbl (%eax),%eax
     461:	3c 2f                	cmp    $0x2f,%al
     463:	7e 0a                	jle    46f <atoi+0x48>
     465:	8b 45 08             	mov    0x8(%ebp),%eax
     468:	0f b6 00             	movzbl (%eax),%eax
     46b:	3c 39                	cmp    $0x39,%al
     46d:	7e c7                	jle    436 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     46f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     472:	c9                   	leave  
     473:	c3                   	ret    

00000474 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     474:	55                   	push   %ebp
     475:	89 e5                	mov    %esp,%ebp
     477:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     47a:	8b 45 08             	mov    0x8(%ebp),%eax
     47d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     480:	8b 45 0c             	mov    0xc(%ebp),%eax
     483:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     486:	eb 17                	jmp    49f <memmove+0x2b>
    *dst++ = *src++;
     488:	8b 45 fc             	mov    -0x4(%ebp),%eax
     48b:	8d 50 01             	lea    0x1(%eax),%edx
     48e:	89 55 fc             	mov    %edx,-0x4(%ebp)
     491:	8b 55 f8             	mov    -0x8(%ebp),%edx
     494:	8d 4a 01             	lea    0x1(%edx),%ecx
     497:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     49a:	0f b6 12             	movzbl (%edx),%edx
     49d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     49f:	8b 45 10             	mov    0x10(%ebp),%eax
     4a2:	8d 50 ff             	lea    -0x1(%eax),%edx
     4a5:	89 55 10             	mov    %edx,0x10(%ebp)
     4a8:	85 c0                	test   %eax,%eax
     4aa:	7f dc                	jg     488 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     4ac:	8b 45 08             	mov    0x8(%ebp),%eax
}
     4af:	c9                   	leave  
     4b0:	c3                   	ret    

000004b1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     4b1:	b8 01 00 00 00       	mov    $0x1,%eax
     4b6:	cd 40                	int    $0x40
     4b8:	c3                   	ret    

000004b9 <exit>:
SYSCALL(exit)
     4b9:	b8 02 00 00 00       	mov    $0x2,%eax
     4be:	cd 40                	int    $0x40
     4c0:	c3                   	ret    

000004c1 <wait>:
SYSCALL(wait)
     4c1:	b8 03 00 00 00       	mov    $0x3,%eax
     4c6:	cd 40                	int    $0x40
     4c8:	c3                   	ret    

000004c9 <pipe>:
SYSCALL(pipe)
     4c9:	b8 04 00 00 00       	mov    $0x4,%eax
     4ce:	cd 40                	int    $0x40
     4d0:	c3                   	ret    

000004d1 <read>:
SYSCALL(read)
     4d1:	b8 05 00 00 00       	mov    $0x5,%eax
     4d6:	cd 40                	int    $0x40
     4d8:	c3                   	ret    

000004d9 <write>:
SYSCALL(write)
     4d9:	b8 10 00 00 00       	mov    $0x10,%eax
     4de:	cd 40                	int    $0x40
     4e0:	c3                   	ret    

000004e1 <close>:
SYSCALL(close)
     4e1:	b8 15 00 00 00       	mov    $0x15,%eax
     4e6:	cd 40                	int    $0x40
     4e8:	c3                   	ret    

000004e9 <kill>:
SYSCALL(kill)
     4e9:	b8 06 00 00 00       	mov    $0x6,%eax
     4ee:	cd 40                	int    $0x40
     4f0:	c3                   	ret    

000004f1 <exec>:
SYSCALL(exec)
     4f1:	b8 07 00 00 00       	mov    $0x7,%eax
     4f6:	cd 40                	int    $0x40
     4f8:	c3                   	ret    

000004f9 <open>:
SYSCALL(open)
     4f9:	b8 0f 00 00 00       	mov    $0xf,%eax
     4fe:	cd 40                	int    $0x40
     500:	c3                   	ret    

00000501 <mknod>:
SYSCALL(mknod)
     501:	b8 11 00 00 00       	mov    $0x11,%eax
     506:	cd 40                	int    $0x40
     508:	c3                   	ret    

00000509 <unlink>:
SYSCALL(unlink)
     509:	b8 12 00 00 00       	mov    $0x12,%eax
     50e:	cd 40                	int    $0x40
     510:	c3                   	ret    

00000511 <fstat>:
SYSCALL(fstat)
     511:	b8 08 00 00 00       	mov    $0x8,%eax
     516:	cd 40                	int    $0x40
     518:	c3                   	ret    

00000519 <link>:
SYSCALL(link)
     519:	b8 13 00 00 00       	mov    $0x13,%eax
     51e:	cd 40                	int    $0x40
     520:	c3                   	ret    

00000521 <mkdir>:
SYSCALL(mkdir)
     521:	b8 14 00 00 00       	mov    $0x14,%eax
     526:	cd 40                	int    $0x40
     528:	c3                   	ret    

00000529 <chdir>:
SYSCALL(chdir)
     529:	b8 09 00 00 00       	mov    $0x9,%eax
     52e:	cd 40                	int    $0x40
     530:	c3                   	ret    

00000531 <dup>:
SYSCALL(dup)
     531:	b8 0a 00 00 00       	mov    $0xa,%eax
     536:	cd 40                	int    $0x40
     538:	c3                   	ret    

00000539 <getpid>:
SYSCALL(getpid)
     539:	b8 0b 00 00 00       	mov    $0xb,%eax
     53e:	cd 40                	int    $0x40
     540:	c3                   	ret    

00000541 <sbrk>:
SYSCALL(sbrk)
     541:	b8 0c 00 00 00       	mov    $0xc,%eax
     546:	cd 40                	int    $0x40
     548:	c3                   	ret    

00000549 <sleep>:
SYSCALL(sleep)
     549:	b8 0d 00 00 00       	mov    $0xd,%eax
     54e:	cd 40                	int    $0x40
     550:	c3                   	ret    

00000551 <uptime>:
SYSCALL(uptime)
     551:	b8 0e 00 00 00       	mov    $0xe,%eax
     556:	cd 40                	int    $0x40
     558:	c3                   	ret    

00000559 <colorwrite>:

//new here
SYSCALL(colorwrite)
     559:	b8 16 00 00 00       	mov    $0x16,%eax
     55e:	cd 40                	int    $0x40
     560:	c3                   	ret    

00000561 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     561:	55                   	push   %ebp
     562:	89 e5                	mov    %esp,%ebp
     564:	83 ec 18             	sub    $0x18,%esp
     567:	8b 45 0c             	mov    0xc(%ebp),%eax
     56a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     56d:	83 ec 04             	sub    $0x4,%esp
     570:	6a 01                	push   $0x1
     572:	8d 45 f4             	lea    -0xc(%ebp),%eax
     575:	50                   	push   %eax
     576:	ff 75 08             	pushl  0x8(%ebp)
     579:	e8 5b ff ff ff       	call   4d9 <write>
     57e:	83 c4 10             	add    $0x10,%esp
}
     581:	90                   	nop
     582:	c9                   	leave  
     583:	c3                   	ret    

00000584 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     584:	55                   	push   %ebp
     585:	89 e5                	mov    %esp,%ebp
     587:	53                   	push   %ebx
     588:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     58b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     592:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     596:	74 17                	je     5af <printint+0x2b>
     598:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     59c:	79 11                	jns    5af <printint+0x2b>
    neg = 1;
     59e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     5a5:	8b 45 0c             	mov    0xc(%ebp),%eax
     5a8:	f7 d8                	neg    %eax
     5aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
     5ad:	eb 06                	jmp    5b5 <printint+0x31>
  } else {
    x = xx;
     5af:	8b 45 0c             	mov    0xc(%ebp),%eax
     5b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     5b5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     5bc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     5bf:	8d 41 01             	lea    0x1(%ecx),%eax
     5c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
     5c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     5c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
     5cb:	ba 00 00 00 00       	mov    $0x0,%edx
     5d0:	f7 f3                	div    %ebx
     5d2:	89 d0                	mov    %edx,%eax
     5d4:	0f b6 80 c0 44 00 00 	movzbl 0x44c0(%eax),%eax
     5db:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     5df:	8b 5d 10             	mov    0x10(%ebp),%ebx
     5e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     5e5:	ba 00 00 00 00       	mov    $0x0,%edx
     5ea:	f7 f3                	div    %ebx
     5ec:	89 45 ec             	mov    %eax,-0x14(%ebp)
     5ef:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     5f3:	75 c7                	jne    5bc <printint+0x38>
  if(neg)
     5f5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     5f9:	74 2d                	je     628 <printint+0xa4>
    buf[i++] = '-';
     5fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5fe:	8d 50 01             	lea    0x1(%eax),%edx
     601:	89 55 f4             	mov    %edx,-0xc(%ebp)
     604:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     609:	eb 1d                	jmp    628 <printint+0xa4>
    putc(fd, buf[i]);
     60b:	8d 55 dc             	lea    -0x24(%ebp),%edx
     60e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     611:	01 d0                	add    %edx,%eax
     613:	0f b6 00             	movzbl (%eax),%eax
     616:	0f be c0             	movsbl %al,%eax
     619:	83 ec 08             	sub    $0x8,%esp
     61c:	50                   	push   %eax
     61d:	ff 75 08             	pushl  0x8(%ebp)
     620:	e8 3c ff ff ff       	call   561 <putc>
     625:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     628:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     62c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     630:	79 d9                	jns    60b <printint+0x87>
    putc(fd, buf[i]);
}
     632:	90                   	nop
     633:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     636:	c9                   	leave  
     637:	c3                   	ret    

00000638 <getInteger>:

static int getInteger(double num)
{
     638:	55                   	push   %ebp
     639:	89 e5                	mov    %esp,%ebp
     63b:	83 ec 18             	sub    $0x18,%esp
     63e:	8b 45 08             	mov    0x8(%ebp),%eax
     641:	89 45 e8             	mov    %eax,-0x18(%ebp)
     644:	8b 45 0c             	mov    0xc(%ebp),%eax
     647:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     64a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     651:	eb 0e                	jmp    661 <getInteger+0x29>
  {
    num -= 1;
     653:	dd 45 e8             	fldl   -0x18(%ebp)
     656:	d9 e8                	fld1   
     658:	de e9                	fsubrp %st,%st(1)
     65a:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     65d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     661:	dd 45 e8             	fldl   -0x18(%ebp)
     664:	d9 e8                	fld1   
     666:	d9 c9                	fxch   %st(1)
     668:	df e9                	fucomip %st(1),%st
     66a:	dd d8                	fstp   %st(0)
     66c:	77 e5                	ja     653 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     66e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     671:	c9                   	leave  
     672:	c3                   	ret    

00000673 <printdbl>:

void printdbl(int fd, double num)
{
     673:	55                   	push   %ebp
     674:	89 e5                	mov    %esp,%ebp
     676:	83 ec 28             	sub    $0x28,%esp
     679:	8b 45 0c             	mov    0xc(%ebp),%eax
     67c:	89 45 e0             	mov    %eax,-0x20(%ebp)
     67f:	8b 45 10             	mov    0x10(%ebp),%eax
     682:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     685:	d9 ee                	fldz   
     687:	dd 45 e0             	fldl   -0x20(%ebp)
     68a:	d9 c9                	fxch   %st(1)
     68c:	df e9                	fucomip %st(1),%st
     68e:	dd d8                	fstp   %st(0)
     690:	76 18                	jbe    6aa <printdbl+0x37>
  {
    putc(fd,'-');
     692:	83 ec 08             	sub    $0x8,%esp
     695:	6a 2d                	push   $0x2d
     697:	ff 75 08             	pushl  0x8(%ebp)
     69a:	e8 c2 fe ff ff       	call   561 <putc>
     69f:	83 c4 10             	add    $0x10,%esp
    num = -num;
     6a2:	dd 45 e0             	fldl   -0x20(%ebp)
     6a5:	d9 e0                	fchs   
     6a7:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     6aa:	83 ec 08             	sub    $0x8,%esp
     6ad:	ff 75 e4             	pushl  -0x1c(%ebp)
     6b0:	ff 75 e0             	pushl  -0x20(%ebp)
     6b3:	e8 80 ff ff ff       	call   638 <getInteger>
     6b8:	83 c4 10             	add    $0x10,%esp
     6bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     6be:	6a 01                	push   $0x1
     6c0:	6a 0a                	push   $0xa
     6c2:	ff 75 f0             	pushl  -0x10(%ebp)
     6c5:	ff 75 08             	pushl  0x8(%ebp)
     6c8:	e8 b7 fe ff ff       	call   584 <printint>
     6cd:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     6d0:	db 45 f0             	fildl  -0x10(%ebp)
     6d3:	dd 45 e0             	fldl   -0x20(%ebp)
     6d6:	de e1                	fsubp  %st,%st(1)
     6d8:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     6db:	dd 45 e0             	fldl   -0x20(%ebp)
     6de:	dd 05 b0 38 00 00    	fldl   0x38b0
     6e4:	d9 c9                	fxch   %st(1)
     6e6:	df e9                	fucomip %st(1),%st
     6e8:	dd d8                	fstp   %st(0)
     6ea:	76 10                	jbe    6fc <printdbl+0x89>
    putc(fd,'.');
     6ec:	83 ec 08             	sub    $0x8,%esp
     6ef:	6a 2e                	push   $0x2e
     6f1:	ff 75 08             	pushl  0x8(%ebp)
     6f4:	e8 68 fe ff ff       	call   561 <putc>
     6f9:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     6fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     703:	eb 49                	jmp    74e <printdbl+0xdb>
  {
    num = num*10;
     705:	dd 45 e0             	fldl   -0x20(%ebp)
     708:	dd 05 b8 38 00 00    	fldl   0x38b8
     70e:	de c9                	fmulp  %st,%st(1)
     710:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     713:	83 ec 08             	sub    $0x8,%esp
     716:	ff 75 e4             	pushl  -0x1c(%ebp)
     719:	ff 75 e0             	pushl  -0x20(%ebp)
     71c:	e8 17 ff ff ff       	call   638 <getInteger>
     721:	83 c4 10             	add    $0x10,%esp
     724:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     727:	6a 01                	push   $0x1
     729:	6a 0a                	push   $0xa
     72b:	ff 75 f0             	pushl  -0x10(%ebp)
     72e:	ff 75 08             	pushl  0x8(%ebp)
     731:	e8 4e fe ff ff       	call   584 <printint>
     736:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     739:	db 45 f0             	fildl  -0x10(%ebp)
     73c:	dd 45 e0             	fldl   -0x20(%ebp)
     73f:	de e1                	fsubp  %st,%st(1)
     741:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     744:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     748:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     74c:	7f 13                	jg     761 <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     74e:	dd 45 e0             	fldl   -0x20(%ebp)
     751:	dd 05 b0 38 00 00    	fldl   0x38b0
     757:	d9 c9                	fxch   %st(1)
     759:	df e9                	fucomip %st(1),%st
     75b:	dd d8                	fstp   %st(0)
     75d:	77 a6                	ja     705 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     75f:	eb 01                	jmp    762 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     761:	90                   	nop
    }
  }
}
     762:	90                   	nop
     763:	c9                   	leave  
     764:	c3                   	ret    

00000765 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     765:	55                   	push   %ebp
     766:	89 e5                	mov    %esp,%ebp
     768:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     76b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     772:	8d 45 0c             	lea    0xc(%ebp),%eax
     775:	83 c0 04             	add    $0x4,%eax
     778:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     77b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     782:	e9 88 01 00 00       	jmp    90f <printf+0x1aa>
    c = fmt[i] & 0xff;
     787:	8b 55 0c             	mov    0xc(%ebp),%edx
     78a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     78d:	01 d0                	add    %edx,%eax
     78f:	0f b6 00             	movzbl (%eax),%eax
     792:	0f be c0             	movsbl %al,%eax
     795:	25 ff 00 00 00       	and    $0xff,%eax
     79a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     79d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     7a1:	75 2c                	jne    7cf <printf+0x6a>
      if(c == '%'){
     7a3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     7a7:	75 0c                	jne    7b5 <printf+0x50>
        state = '%';
     7a9:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     7b0:	e9 56 01 00 00       	jmp    90b <printf+0x1a6>
      } else {
        putc(fd, c);
     7b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7b8:	0f be c0             	movsbl %al,%eax
     7bb:	83 ec 08             	sub    $0x8,%esp
     7be:	50                   	push   %eax
     7bf:	ff 75 08             	pushl  0x8(%ebp)
     7c2:	e8 9a fd ff ff       	call   561 <putc>
     7c7:	83 c4 10             	add    $0x10,%esp
     7ca:	e9 3c 01 00 00       	jmp    90b <printf+0x1a6>
      }
    } else if(state == '%'){
     7cf:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     7d3:	0f 85 32 01 00 00    	jne    90b <printf+0x1a6>
      if(c == 'd'){
     7d9:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     7dd:	75 1e                	jne    7fd <printf+0x98>
        printint(fd, *ap, 10, 1);
     7df:	8b 45 e8             	mov    -0x18(%ebp),%eax
     7e2:	8b 00                	mov    (%eax),%eax
     7e4:	6a 01                	push   $0x1
     7e6:	6a 0a                	push   $0xa
     7e8:	50                   	push   %eax
     7e9:	ff 75 08             	pushl  0x8(%ebp)
     7ec:	e8 93 fd ff ff       	call   584 <printint>
     7f1:	83 c4 10             	add    $0x10,%esp
        ap++;
     7f4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     7f8:	e9 07 01 00 00       	jmp    904 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     7fd:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     801:	74 06                	je     809 <printf+0xa4>
     803:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     807:	75 1e                	jne    827 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     809:	8b 45 e8             	mov    -0x18(%ebp),%eax
     80c:	8b 00                	mov    (%eax),%eax
     80e:	6a 00                	push   $0x0
     810:	6a 10                	push   $0x10
     812:	50                   	push   %eax
     813:	ff 75 08             	pushl  0x8(%ebp)
     816:	e8 69 fd ff ff       	call   584 <printint>
     81b:	83 c4 10             	add    $0x10,%esp
        ap++;
     81e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     822:	e9 dd 00 00 00       	jmp    904 <printf+0x19f>
      } else if(c == 's'){
     827:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     82b:	75 46                	jne    873 <printf+0x10e>
        s = (char*)*ap;
     82d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     830:	8b 00                	mov    (%eax),%eax
     832:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     835:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     839:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     83d:	75 25                	jne    864 <printf+0xff>
          s = "(null)";
     83f:	c7 45 f4 a8 38 00 00 	movl   $0x38a8,-0xc(%ebp)
        while(*s != 0){
     846:	eb 1c                	jmp    864 <printf+0xff>
          putc(fd, *s);
     848:	8b 45 f4             	mov    -0xc(%ebp),%eax
     84b:	0f b6 00             	movzbl (%eax),%eax
     84e:	0f be c0             	movsbl %al,%eax
     851:	83 ec 08             	sub    $0x8,%esp
     854:	50                   	push   %eax
     855:	ff 75 08             	pushl  0x8(%ebp)
     858:	e8 04 fd ff ff       	call   561 <putc>
     85d:	83 c4 10             	add    $0x10,%esp
          s++;
     860:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     864:	8b 45 f4             	mov    -0xc(%ebp),%eax
     867:	0f b6 00             	movzbl (%eax),%eax
     86a:	84 c0                	test   %al,%al
     86c:	75 da                	jne    848 <printf+0xe3>
     86e:	e9 91 00 00 00       	jmp    904 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     873:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     877:	75 1d                	jne    896 <printf+0x131>
        putc(fd, *ap);
     879:	8b 45 e8             	mov    -0x18(%ebp),%eax
     87c:	8b 00                	mov    (%eax),%eax
     87e:	0f be c0             	movsbl %al,%eax
     881:	83 ec 08             	sub    $0x8,%esp
     884:	50                   	push   %eax
     885:	ff 75 08             	pushl  0x8(%ebp)
     888:	e8 d4 fc ff ff       	call   561 <putc>
     88d:	83 c4 10             	add    $0x10,%esp
        ap++;
     890:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     894:	eb 6e                	jmp    904 <printf+0x19f>
      } else if(c == '%'){
     896:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     89a:	75 17                	jne    8b3 <printf+0x14e>
        putc(fd, c);
     89c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     89f:	0f be c0             	movsbl %al,%eax
     8a2:	83 ec 08             	sub    $0x8,%esp
     8a5:	50                   	push   %eax
     8a6:	ff 75 08             	pushl  0x8(%ebp)
     8a9:	e8 b3 fc ff ff       	call   561 <putc>
     8ae:	83 c4 10             	add    $0x10,%esp
     8b1:	eb 51                	jmp    904 <printf+0x19f>
      } else if(c == 'f'){ //for double
     8b3:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     8b7:	75 26                	jne    8df <printf+0x17a>
        double *dap = (double*)ap;
     8b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     8bc:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     8bf:	8b 45 e0             	mov    -0x20(%ebp),%eax
     8c2:	dd 00                	fldl   (%eax)
     8c4:	83 ec 04             	sub    $0x4,%esp
     8c7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     8cb:	dd 1c 24             	fstpl  (%esp)
     8ce:	ff 75 08             	pushl  0x8(%ebp)
     8d1:	e8 9d fd ff ff       	call   673 <printdbl>
     8d6:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     8d9:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     8dd:	eb 25                	jmp    904 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     8df:	83 ec 08             	sub    $0x8,%esp
     8e2:	6a 25                	push   $0x25
     8e4:	ff 75 08             	pushl  0x8(%ebp)
     8e7:	e8 75 fc ff ff       	call   561 <putc>
     8ec:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     8ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8f2:	0f be c0             	movsbl %al,%eax
     8f5:	83 ec 08             	sub    $0x8,%esp
     8f8:	50                   	push   %eax
     8f9:	ff 75 08             	pushl  0x8(%ebp)
     8fc:	e8 60 fc ff ff       	call   561 <putc>
     901:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     904:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     90b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     90f:	8b 55 0c             	mov    0xc(%ebp),%edx
     912:	8b 45 f0             	mov    -0x10(%ebp),%eax
     915:	01 d0                	add    %edx,%eax
     917:	0f b6 00             	movzbl (%eax),%eax
     91a:	84 c0                	test   %al,%al
     91c:	0f 85 65 fe ff ff    	jne    787 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     922:	90                   	nop
     923:	c9                   	leave  
     924:	c3                   	ret    

00000925 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     925:	55                   	push   %ebp
     926:	89 e5                	mov    %esp,%ebp
     928:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     92b:	8b 45 08             	mov    0x8(%ebp),%eax
     92e:	83 e8 08             	sub    $0x8,%eax
     931:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     934:	a1 08 46 00 00       	mov    0x4608,%eax
     939:	89 45 fc             	mov    %eax,-0x4(%ebp)
     93c:	eb 24                	jmp    962 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     93e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     941:	8b 00                	mov    (%eax),%eax
     943:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     946:	77 12                	ja     95a <free+0x35>
     948:	8b 45 f8             	mov    -0x8(%ebp),%eax
     94b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     94e:	77 24                	ja     974 <free+0x4f>
     950:	8b 45 fc             	mov    -0x4(%ebp),%eax
     953:	8b 00                	mov    (%eax),%eax
     955:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     958:	77 1a                	ja     974 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     95a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     95d:	8b 00                	mov    (%eax),%eax
     95f:	89 45 fc             	mov    %eax,-0x4(%ebp)
     962:	8b 45 f8             	mov    -0x8(%ebp),%eax
     965:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     968:	76 d4                	jbe    93e <free+0x19>
     96a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     96d:	8b 00                	mov    (%eax),%eax
     96f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     972:	76 ca                	jbe    93e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     974:	8b 45 f8             	mov    -0x8(%ebp),%eax
     977:	8b 40 04             	mov    0x4(%eax),%eax
     97a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     981:	8b 45 f8             	mov    -0x8(%ebp),%eax
     984:	01 c2                	add    %eax,%edx
     986:	8b 45 fc             	mov    -0x4(%ebp),%eax
     989:	8b 00                	mov    (%eax),%eax
     98b:	39 c2                	cmp    %eax,%edx
     98d:	75 24                	jne    9b3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     98f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     992:	8b 50 04             	mov    0x4(%eax),%edx
     995:	8b 45 fc             	mov    -0x4(%ebp),%eax
     998:	8b 00                	mov    (%eax),%eax
     99a:	8b 40 04             	mov    0x4(%eax),%eax
     99d:	01 c2                	add    %eax,%edx
     99f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     9a2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     9a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9a8:	8b 00                	mov    (%eax),%eax
     9aa:	8b 10                	mov    (%eax),%edx
     9ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
     9af:	89 10                	mov    %edx,(%eax)
     9b1:	eb 0a                	jmp    9bd <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     9b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9b6:	8b 10                	mov    (%eax),%edx
     9b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
     9bb:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     9bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9c0:	8b 40 04             	mov    0x4(%eax),%eax
     9c3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     9ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9cd:	01 d0                	add    %edx,%eax
     9cf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     9d2:	75 20                	jne    9f4 <free+0xcf>
    p->s.size += bp->s.size;
     9d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9d7:	8b 50 04             	mov    0x4(%eax),%edx
     9da:	8b 45 f8             	mov    -0x8(%ebp),%eax
     9dd:	8b 40 04             	mov    0x4(%eax),%eax
     9e0:	01 c2                	add    %eax,%edx
     9e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9e5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     9e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
     9eb:	8b 10                	mov    (%eax),%edx
     9ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9f0:	89 10                	mov    %edx,(%eax)
     9f2:	eb 08                	jmp    9fc <free+0xd7>
  } else
    p->s.ptr = bp;
     9f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9f7:	8b 55 f8             	mov    -0x8(%ebp),%edx
     9fa:	89 10                	mov    %edx,(%eax)
  freep = p;
     9fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
     9ff:	a3 08 46 00 00       	mov    %eax,0x4608
}
     a04:	90                   	nop
     a05:	c9                   	leave  
     a06:	c3                   	ret    

00000a07 <morecore>:

static Header*
morecore(uint nu)
{
     a07:	55                   	push   %ebp
     a08:	89 e5                	mov    %esp,%ebp
     a0a:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     a0d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     a14:	77 07                	ja     a1d <morecore+0x16>
    nu = 4096;
     a16:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     a1d:	8b 45 08             	mov    0x8(%ebp),%eax
     a20:	c1 e0 03             	shl    $0x3,%eax
     a23:	83 ec 0c             	sub    $0xc,%esp
     a26:	50                   	push   %eax
     a27:	e8 15 fb ff ff       	call   541 <sbrk>
     a2c:	83 c4 10             	add    $0x10,%esp
     a2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     a32:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     a36:	75 07                	jne    a3f <morecore+0x38>
    return 0;
     a38:	b8 00 00 00 00       	mov    $0x0,%eax
     a3d:	eb 26                	jmp    a65 <morecore+0x5e>
  hp = (Header*)p;
     a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a42:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     a45:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a48:	8b 55 08             	mov    0x8(%ebp),%edx
     a4b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     a4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a51:	83 c0 08             	add    $0x8,%eax
     a54:	83 ec 0c             	sub    $0xc,%esp
     a57:	50                   	push   %eax
     a58:	e8 c8 fe ff ff       	call   925 <free>
     a5d:	83 c4 10             	add    $0x10,%esp
  return freep;
     a60:	a1 08 46 00 00       	mov    0x4608,%eax
}
     a65:	c9                   	leave  
     a66:	c3                   	ret    

00000a67 <malloc>:

void*
malloc(uint nbytes)
{
     a67:	55                   	push   %ebp
     a68:	89 e5                	mov    %esp,%ebp
     a6a:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     a6d:	8b 45 08             	mov    0x8(%ebp),%eax
     a70:	83 c0 07             	add    $0x7,%eax
     a73:	c1 e8 03             	shr    $0x3,%eax
     a76:	83 c0 01             	add    $0x1,%eax
     a79:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     a7c:	a1 08 46 00 00       	mov    0x4608,%eax
     a81:	89 45 f0             	mov    %eax,-0x10(%ebp)
     a84:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a88:	75 23                	jne    aad <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     a8a:	c7 45 f0 00 46 00 00 	movl   $0x4600,-0x10(%ebp)
     a91:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a94:	a3 08 46 00 00       	mov    %eax,0x4608
     a99:	a1 08 46 00 00       	mov    0x4608,%eax
     a9e:	a3 00 46 00 00       	mov    %eax,0x4600
    base.s.size = 0;
     aa3:	c7 05 04 46 00 00 00 	movl   $0x0,0x4604
     aaa:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     aad:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ab0:	8b 00                	mov    (%eax),%eax
     ab2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     ab5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ab8:	8b 40 04             	mov    0x4(%eax),%eax
     abb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     abe:	72 4d                	jb     b0d <malloc+0xa6>
      if(p->s.size == nunits)
     ac0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ac3:	8b 40 04             	mov    0x4(%eax),%eax
     ac6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     ac9:	75 0c                	jne    ad7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     acb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ace:	8b 10                	mov    (%eax),%edx
     ad0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ad3:	89 10                	mov    %edx,(%eax)
     ad5:	eb 26                	jmp    afd <malloc+0x96>
      else {
        p->s.size -= nunits;
     ad7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ada:	8b 40 04             	mov    0x4(%eax),%eax
     add:	2b 45 ec             	sub    -0x14(%ebp),%eax
     ae0:	89 c2                	mov    %eax,%edx
     ae2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ae5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aeb:	8b 40 04             	mov    0x4(%eax),%eax
     aee:	c1 e0 03             	shl    $0x3,%eax
     af1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     af4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     af7:	8b 55 ec             	mov    -0x14(%ebp),%edx
     afa:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     afd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b00:	a3 08 46 00 00       	mov    %eax,0x4608
      return (void*)(p + 1);
     b05:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b08:	83 c0 08             	add    $0x8,%eax
     b0b:	eb 3b                	jmp    b48 <malloc+0xe1>
    }
    if(p == freep)
     b0d:	a1 08 46 00 00       	mov    0x4608,%eax
     b12:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     b15:	75 1e                	jne    b35 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     b17:	83 ec 0c             	sub    $0xc,%esp
     b1a:	ff 75 ec             	pushl  -0x14(%ebp)
     b1d:	e8 e5 fe ff ff       	call   a07 <morecore>
     b22:	83 c4 10             	add    $0x10,%esp
     b25:	89 45 f4             	mov    %eax,-0xc(%ebp)
     b28:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b2c:	75 07                	jne    b35 <malloc+0xce>
        return 0;
     b2e:	b8 00 00 00 00       	mov    $0x0,%eax
     b33:	eb 13                	jmp    b48 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     b35:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b38:	89 45 f0             	mov    %eax,-0x10(%ebp)
     b3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b3e:	8b 00                	mov    (%eax),%eax
     b40:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     b43:	e9 6d ff ff ff       	jmp    ab5 <malloc+0x4e>
}
     b48:	c9                   	leave  
     b49:	c3                   	ret    

00000b4a <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     b4a:	55                   	push   %ebp
     b4b:	89 e5                	mov    %esp,%ebp
     b4d:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     b50:	83 ec 04             	sub    $0x4,%esp
     b53:	ff 75 08             	pushl  0x8(%ebp)
     b56:	68 c0 38 00 00       	push   $0x38c0
     b5b:	6a 02                	push   $0x2
     b5d:	e8 03 fc ff ff       	call   765 <printf>
     b62:	83 c4 10             	add    $0x10,%esp
  exit();
     b65:	e8 4f f9 ff ff       	call   4b9 <exit>

00000b6a <getInteger>:
}

static int getInteger(double num)
{
     b6a:	55                   	push   %ebp
     b6b:	89 e5                	mov    %esp,%ebp
     b6d:	83 ec 18             	sub    $0x18,%esp
     b70:	8b 45 08             	mov    0x8(%ebp),%eax
     b73:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b76:	8b 45 0c             	mov    0xc(%ebp),%eax
     b79:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     b7c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     b83:	eb 0e                	jmp    b93 <getInteger+0x29>
  {
    num -= 1;
     b85:	dd 45 e8             	fldl   -0x18(%ebp)
     b88:	d9 e8                	fld1   
     b8a:	de e9                	fsubrp %st,%st(1)
     b8c:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     b8f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     b93:	dd 45 e8             	fldl   -0x18(%ebp)
     b96:	d9 e8                	fld1   
     b98:	d9 c9                	fxch   %st(1)
     b9a:	df e9                	fucomip %st(1),%st
     b9c:	dd d8                	fstp   %st(0)
     b9e:	77 e5                	ja     b85 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     ba0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     ba3:	c9                   	leave  
     ba4:	c3                   	ret    

00000ba5 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     ba5:	55                   	push   %ebp
     ba6:	89 e5                	mov    %esp,%ebp
     ba8:	53                   	push   %ebx
     ba9:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     bac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     bb3:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     bb7:	74 17                	je     bd0 <int2str+0x2b>
     bb9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     bbd:	79 11                	jns    bd0 <int2str+0x2b>
    neg = 1;
     bbf:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     bc6:	8b 45 0c             	mov    0xc(%ebp),%eax
     bc9:	f7 d8                	neg    %eax
     bcb:	89 45 f0             	mov    %eax,-0x10(%ebp)
     bce:	eb 06                	jmp    bd6 <int2str+0x31>
  } else {
    x = num;
     bd0:	8b 45 0c             	mov    0xc(%ebp),%eax
     bd3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     bd6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     bdd:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     be0:	8d 41 01             	lea    0x1(%ecx),%eax
     be3:	89 45 f8             	mov    %eax,-0x8(%ebp)
     be6:	8b 5d 14             	mov    0x14(%ebp),%ebx
     be9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bec:	ba 00 00 00 00       	mov    $0x0,%edx
     bf1:	f7 f3                	div    %ebx
     bf3:	89 d0                	mov    %edx,%eax
     bf5:	0f b6 80 d4 44 00 00 	movzbl 0x44d4(%eax),%eax
     bfc:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     c00:	8b 5d 14             	mov    0x14(%ebp),%ebx
     c03:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c06:	ba 00 00 00 00       	mov    $0x0,%edx
     c0b:	f7 f3                	div    %ebx
     c0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
     c10:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     c14:	75 c7                	jne    bdd <int2str+0x38>
  if(neg)
     c16:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     c1a:	74 36                	je     c52 <int2str+0xad>
    buf[i++] = '-';
     c1c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     c1f:	8d 50 01             	lea    0x1(%eax),%edx
     c22:	89 55 f8             	mov    %edx,-0x8(%ebp)
     c25:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     c2a:	eb 26                	jmp    c52 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     c2c:	8b 45 10             	mov    0x10(%ebp),%eax
     c2f:	8b 00                	mov    (%eax),%eax
     c31:	89 c2                	mov    %eax,%edx
     c33:	8b 45 08             	mov    0x8(%ebp),%eax
     c36:	01 c2                	add    %eax,%edx
     c38:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     c3b:	8b 45 f8             	mov    -0x8(%ebp),%eax
     c3e:	01 c8                	add    %ecx,%eax
     c40:	0f b6 00             	movzbl (%eax),%eax
     c43:	88 02                	mov    %al,(%edx)
    (*pos)++;
     c45:	8b 45 10             	mov    0x10(%ebp),%eax
     c48:	8b 00                	mov    (%eax),%eax
     c4a:	8d 50 01             	lea    0x1(%eax),%edx
     c4d:	8b 45 10             	mov    0x10(%ebp),%eax
     c50:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     c52:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     c56:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     c5a:	79 d0                	jns    c2c <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     c5c:	90                   	nop
     c5d:	83 c4 20             	add    $0x20,%esp
     c60:	5b                   	pop    %ebx
     c61:	5d                   	pop    %ebp
     c62:	c3                   	ret    

00000c63 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     c63:	55                   	push   %ebp
     c64:	89 e5                	mov    %esp,%ebp
     c66:	83 ec 18             	sub    $0x18,%esp
     c69:	8b 45 0c             	mov    0xc(%ebp),%eax
     c6c:	89 45 e8             	mov    %eax,-0x18(%ebp)
     c6f:	8b 45 10             	mov    0x10(%ebp),%eax
     c72:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     c75:	d9 ee                	fldz   
     c77:	dd 45 e8             	fldl   -0x18(%ebp)
     c7a:	d9 c9                	fxch   %st(1)
     c7c:	df e9                	fucomip %st(1),%st
     c7e:	dd d8                	fstp   %st(0)
     c80:	76 24                	jbe    ca6 <double2str+0x43>
  {
    buf[*pos] = '-';
     c82:	8b 45 14             	mov    0x14(%ebp),%eax
     c85:	8b 00                	mov    (%eax),%eax
     c87:	89 c2                	mov    %eax,%edx
     c89:	8b 45 08             	mov    0x8(%ebp),%eax
     c8c:	01 d0                	add    %edx,%eax
     c8e:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     c91:	8b 45 14             	mov    0x14(%ebp),%eax
     c94:	8b 00                	mov    (%eax),%eax
     c96:	8d 50 01             	lea    0x1(%eax),%edx
     c99:	8b 45 14             	mov    0x14(%ebp),%eax
     c9c:	89 10                	mov    %edx,(%eax)
    num = -num;
     c9e:	dd 45 e8             	fldl   -0x18(%ebp)
     ca1:	d9 e0                	fchs   
     ca3:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     ca6:	ff 75 ec             	pushl  -0x14(%ebp)
     ca9:	ff 75 e8             	pushl  -0x18(%ebp)
     cac:	e8 b9 fe ff ff       	call   b6a <getInteger>
     cb1:	83 c4 08             	add    $0x8,%esp
     cb4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     cb7:	83 ec 04             	sub    $0x4,%esp
     cba:	6a 01                	push   $0x1
     cbc:	6a 0a                	push   $0xa
     cbe:	ff 75 14             	pushl  0x14(%ebp)
     cc1:	ff 75 f8             	pushl  -0x8(%ebp)
     cc4:	ff 75 08             	pushl  0x8(%ebp)
     cc7:	e8 d9 fe ff ff       	call   ba5 <int2str>
     ccc:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     ccf:	db 45 f8             	fildl  -0x8(%ebp)
     cd2:	dd 45 e8             	fldl   -0x18(%ebp)
     cd5:	de e1                	fsubp  %st,%st(1)
     cd7:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     cda:	dd 45 e8             	fldl   -0x18(%ebp)
     cdd:	dd 05 c8 38 00 00    	fldl   0x38c8
     ce3:	d9 c9                	fxch   %st(1)
     ce5:	df e9                	fucomip %st(1),%st
     ce7:	dd d8                	fstp   %st(0)
     ce9:	76 1c                	jbe    d07 <double2str+0xa4>
  {
    buf[*pos] = '.';
     ceb:	8b 45 14             	mov    0x14(%ebp),%eax
     cee:	8b 00                	mov    (%eax),%eax
     cf0:	89 c2                	mov    %eax,%edx
     cf2:	8b 45 08             	mov    0x8(%ebp),%eax
     cf5:	01 d0                	add    %edx,%eax
     cf7:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     cfa:	8b 45 14             	mov    0x14(%ebp),%eax
     cfd:	8b 00                	mov    (%eax),%eax
     cff:	8d 50 01             	lea    0x1(%eax),%edx
     d02:	8b 45 14             	mov    0x14(%ebp),%eax
     d05:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     d07:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     d0e:	eb 4c                	jmp    d5c <double2str+0xf9>
  {
    num = num*10;
     d10:	dd 45 e8             	fldl   -0x18(%ebp)
     d13:	dd 05 d0 38 00 00    	fldl   0x38d0
     d19:	de c9                	fmulp  %st,%st(1)
     d1b:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     d1e:	ff 75 ec             	pushl  -0x14(%ebp)
     d21:	ff 75 e8             	pushl  -0x18(%ebp)
     d24:	e8 41 fe ff ff       	call   b6a <getInteger>
     d29:	83 c4 08             	add    $0x8,%esp
     d2c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     d2f:	83 ec 04             	sub    $0x4,%esp
     d32:	6a 01                	push   $0x1
     d34:	6a 0a                	push   $0xa
     d36:	ff 75 14             	pushl  0x14(%ebp)
     d39:	ff 75 f8             	pushl  -0x8(%ebp)
     d3c:	ff 75 08             	pushl  0x8(%ebp)
     d3f:	e8 61 fe ff ff       	call   ba5 <int2str>
     d44:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     d47:	db 45 f8             	fildl  -0x8(%ebp)
     d4a:	dd 45 e8             	fldl   -0x18(%ebp)
     d4d:	de e1                	fsubp  %st,%st(1)
     d4f:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     d52:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     d56:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     d5a:	7f 13                	jg     d6f <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     d5c:	dd 45 e8             	fldl   -0x18(%ebp)
     d5f:	dd 05 c8 38 00 00    	fldl   0x38c8
     d65:	d9 c9                	fxch   %st(1)
     d67:	df e9                	fucomip %st(1),%st
     d69:	dd d8                	fstp   %st(0)
     d6b:	77 a3                	ja     d10 <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     d6d:	eb 01                	jmp    d70 <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     d6f:	90                   	nop
    }
  }
}
     d70:	90                   	nop
     d71:	c9                   	leave  
     d72:	c3                   	ret    

00000d73 <pow>:

double pow(double opnd, int power)
{
     d73:	55                   	push   %ebp
     d74:	89 e5                	mov    %esp,%ebp
     d76:	83 ec 18             	sub    $0x18,%esp
     d79:	8b 45 08             	mov    0x8(%ebp),%eax
     d7c:	89 45 e8             	mov    %eax,-0x18(%ebp)
     d7f:	8b 45 0c             	mov    0xc(%ebp),%eax
     d82:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     d85:	d9 e8                	fld1   
     d87:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     d8a:	eb 0d                	jmp    d99 <pow+0x26>
  {
    result *= opnd;
     d8c:	dd 45 f8             	fldl   -0x8(%ebp)
     d8f:	dc 4d e8             	fmull  -0x18(%ebp)
     d92:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     d95:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     d99:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     d9d:	7f ed                	jg     d8c <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     d9f:	dd 45 f8             	fldl   -0x8(%ebp)
}
     da2:	c9                   	leave  
     da3:	c3                   	ret    

00000da4 <Translation>:

double Translation(char *s, int* pos)
{
     da4:	55                   	push   %ebp
     da5:	89 e5                	mov    %esp,%ebp
     da7:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     daa:	d9 ee                	fldz   
     dac:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     daf:	d9 ee                	fldz   
     db1:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     db4:	eb 3e                	jmp    df4 <Translation+0x50>
    {
        integer *= 10;
     db6:	dd 45 f8             	fldl   -0x8(%ebp)
     db9:	dd 05 d0 38 00 00    	fldl   0x38d0
     dbf:	de c9                	fmulp  %st,%st(1)
     dc1:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     dc4:	8b 45 0c             	mov    0xc(%ebp),%eax
     dc7:	8b 00                	mov    (%eax),%eax
     dc9:	89 c2                	mov    %eax,%edx
     dcb:	8b 45 08             	mov    0x8(%ebp),%eax
     dce:	01 d0                	add    %edx,%eax
     dd0:	0f b6 00             	movzbl (%eax),%eax
     dd3:	0f be c0             	movsbl %al,%eax
     dd6:	83 e8 30             	sub    $0x30,%eax
     dd9:	89 45 dc             	mov    %eax,-0x24(%ebp)
     ddc:	db 45 dc             	fildl  -0x24(%ebp)
     ddf:	dd 45 f8             	fldl   -0x8(%ebp)
     de2:	de c1                	faddp  %st,%st(1)
     de4:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     de7:	8b 45 0c             	mov    0xc(%ebp),%eax
     dea:	8b 00                	mov    (%eax),%eax
     dec:	8d 50 01             	lea    0x1(%eax),%edx
     def:	8b 45 0c             	mov    0xc(%ebp),%eax
     df2:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     df4:	8b 45 0c             	mov    0xc(%ebp),%eax
     df7:	8b 00                	mov    (%eax),%eax
     df9:	89 c2                	mov    %eax,%edx
     dfb:	8b 45 08             	mov    0x8(%ebp),%eax
     dfe:	01 d0                	add    %edx,%eax
     e00:	0f b6 00             	movzbl (%eax),%eax
     e03:	3c 2f                	cmp    $0x2f,%al
     e05:	7e 13                	jle    e1a <Translation+0x76>
     e07:	8b 45 0c             	mov    0xc(%ebp),%eax
     e0a:	8b 00                	mov    (%eax),%eax
     e0c:	89 c2                	mov    %eax,%edx
     e0e:	8b 45 08             	mov    0x8(%ebp),%eax
     e11:	01 d0                	add    %edx,%eax
     e13:	0f b6 00             	movzbl (%eax),%eax
     e16:	3c 39                	cmp    $0x39,%al
     e18:	7e 9c                	jle    db6 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     e1a:	8b 45 0c             	mov    0xc(%ebp),%eax
     e1d:	8b 00                	mov    (%eax),%eax
     e1f:	89 c2                	mov    %eax,%edx
     e21:	8b 45 08             	mov    0x8(%ebp),%eax
     e24:	01 d0                	add    %edx,%eax
     e26:	0f b6 00             	movzbl (%eax),%eax
     e29:	3c 2e                	cmp    $0x2e,%al
     e2b:	0f 85 9b 00 00 00    	jne    ecc <Translation+0x128>
    {
        (*pos)++;
     e31:	8b 45 0c             	mov    0xc(%ebp),%eax
     e34:	8b 00                	mov    (%eax),%eax
     e36:	8d 50 01             	lea    0x1(%eax),%edx
     e39:	8b 45 0c             	mov    0xc(%ebp),%eax
     e3c:	89 10                	mov    %edx,(%eax)
        int c = 1;
     e3e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     e45:	eb 5b                	jmp    ea2 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     e47:	8b 45 0c             	mov    0xc(%ebp),%eax
     e4a:	8b 00                	mov    (%eax),%eax
     e4c:	89 c2                	mov    %eax,%edx
     e4e:	8b 45 08             	mov    0x8(%ebp),%eax
     e51:	01 d0                	add    %edx,%eax
     e53:	0f b6 00             	movzbl (%eax),%eax
     e56:	0f be c0             	movsbl %al,%eax
     e59:	83 e8 30             	sub    $0x30,%eax
     e5c:	89 45 dc             	mov    %eax,-0x24(%ebp)
     e5f:	db 45 dc             	fildl  -0x24(%ebp)
     e62:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     e65:	83 ec 04             	sub    $0x4,%esp
     e68:	ff 75 ec             	pushl  -0x14(%ebp)
     e6b:	dd 05 d8 38 00 00    	fldl   0x38d8
     e71:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     e75:	dd 1c 24             	fstpl  (%esp)
     e78:	e8 f6 fe ff ff       	call   d73 <pow>
     e7d:	83 c4 10             	add    $0x10,%esp
     e80:	dd 45 e0             	fldl   -0x20(%ebp)
     e83:	de c9                	fmulp  %st,%st(1)
     e85:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     e88:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     e8c:	dd 45 f0             	fldl   -0x10(%ebp)
     e8f:	dc 45 e0             	faddl  -0x20(%ebp)
     e92:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     e95:	8b 45 0c             	mov    0xc(%ebp),%eax
     e98:	8b 00                	mov    (%eax),%eax
     e9a:	8d 50 01             	lea    0x1(%eax),%edx
     e9d:	8b 45 0c             	mov    0xc(%ebp),%eax
     ea0:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     ea2:	8b 45 0c             	mov    0xc(%ebp),%eax
     ea5:	8b 00                	mov    (%eax),%eax
     ea7:	89 c2                	mov    %eax,%edx
     ea9:	8b 45 08             	mov    0x8(%ebp),%eax
     eac:	01 d0                	add    %edx,%eax
     eae:	0f b6 00             	movzbl (%eax),%eax
     eb1:	3c 2f                	cmp    $0x2f,%al
     eb3:	7e 17                	jle    ecc <Translation+0x128>
     eb5:	8b 45 0c             	mov    0xc(%ebp),%eax
     eb8:	8b 00                	mov    (%eax),%eax
     eba:	89 c2                	mov    %eax,%edx
     ebc:	8b 45 08             	mov    0x8(%ebp),%eax
     ebf:	01 d0                	add    %edx,%eax
     ec1:	0f b6 00             	movzbl (%eax),%eax
     ec4:	3c 39                	cmp    $0x39,%al
     ec6:	0f 8e 7b ff ff ff    	jle    e47 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     ecc:	dd 45 f8             	fldl   -0x8(%ebp)
     ecf:	dc 45 f0             	faddl  -0x10(%ebp)
     ed2:	c9                   	leave  
     ed3:	c3                   	ret    

00000ed4 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     ed4:	55                   	push   %ebp
     ed5:	89 e5                	mov    %esp,%ebp
     ed7:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     eda:	e8 d2 f5 ff ff       	call   4b1 <fork>
     edf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     ee2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ee5:	c9                   	leave  
     ee6:	c3                   	ret    

00000ee7 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     ee7:	55                   	push   %ebp
     ee8:	89 e5                	mov    %esp,%ebp
     eea:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     eed:	83 ec 0c             	sub    $0xc,%esp
     ef0:	6a 54                	push   $0x54
     ef2:	e8 70 fb ff ff       	call   a67 <malloc>
     ef7:	83 c4 10             	add    $0x10,%esp
     efa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     efd:	83 ec 04             	sub    $0x4,%esp
     f00:	6a 54                	push   $0x54
     f02:	6a 00                	push   $0x0
     f04:	ff 75 f4             	pushl  -0xc(%ebp)
     f07:	e8 12 f4 ff ff       	call   31e <memset>
     f0c:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     f0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f12:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     f18:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f1b:	c9                   	leave  
     f1c:	c3                   	ret    

00000f1d <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     f1d:	55                   	push   %ebp
     f1e:	89 e5                	mov    %esp,%ebp
     f20:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     f23:	83 ec 0c             	sub    $0xc,%esp
     f26:	6a 18                	push   $0x18
     f28:	e8 3a fb ff ff       	call   a67 <malloc>
     f2d:	83 c4 10             	add    $0x10,%esp
     f30:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     f33:	83 ec 04             	sub    $0x4,%esp
     f36:	6a 18                	push   $0x18
     f38:	6a 00                	push   $0x0
     f3a:	ff 75 f4             	pushl  -0xc(%ebp)
     f3d:	e8 dc f3 ff ff       	call   31e <memset>
     f42:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
     f45:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f48:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     f4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f51:	8b 55 08             	mov    0x8(%ebp),%edx
     f54:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     f57:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f5a:	8b 55 0c             	mov    0xc(%ebp),%edx
     f5d:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     f60:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f63:	8b 55 10             	mov    0x10(%ebp),%edx
     f66:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     f69:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f6c:	8b 55 14             	mov    0x14(%ebp),%edx
     f6f:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     f72:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f75:	8b 55 18             	mov    0x18(%ebp),%edx
     f78:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     f7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f7e:	c9                   	leave  
     f7f:	c3                   	ret    

00000f80 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     f80:	55                   	push   %ebp
     f81:	89 e5                	mov    %esp,%ebp
     f83:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     f86:	83 ec 0c             	sub    $0xc,%esp
     f89:	6a 0c                	push   $0xc
     f8b:	e8 d7 fa ff ff       	call   a67 <malloc>
     f90:	83 c4 10             	add    $0x10,%esp
     f93:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     f96:	83 ec 04             	sub    $0x4,%esp
     f99:	6a 0c                	push   $0xc
     f9b:	6a 00                	push   $0x0
     f9d:	ff 75 f4             	pushl  -0xc(%ebp)
     fa0:	e8 79 f3 ff ff       	call   31e <memset>
     fa5:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
     fa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fab:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     fb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb4:	8b 55 08             	mov    0x8(%ebp),%edx
     fb7:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     fba:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fbd:	8b 55 0c             	mov    0xc(%ebp),%edx
     fc0:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     fc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     fc6:	c9                   	leave  
     fc7:	c3                   	ret    

00000fc8 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     fc8:	55                   	push   %ebp
     fc9:	89 e5                	mov    %esp,%ebp
     fcb:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     fce:	83 ec 0c             	sub    $0xc,%esp
     fd1:	6a 0c                	push   $0xc
     fd3:	e8 8f fa ff ff       	call   a67 <malloc>
     fd8:	83 c4 10             	add    $0x10,%esp
     fdb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     fde:	83 ec 04             	sub    $0x4,%esp
     fe1:	6a 0c                	push   $0xc
     fe3:	6a 00                	push   $0x0
     fe5:	ff 75 f4             	pushl  -0xc(%ebp)
     fe8:	e8 31 f3 ff ff       	call   31e <memset>
     fed:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
     ff0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ff3:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     ff9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ffc:	8b 55 08             	mov    0x8(%ebp),%edx
     fff:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    1002:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1005:	8b 55 0c             	mov    0xc(%ebp),%edx
    1008:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    100b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    100e:	c9                   	leave  
    100f:	c3                   	ret    

00001010 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1016:	83 ec 0c             	sub    $0xc,%esp
    1019:	6a 08                	push   $0x8
    101b:	e8 47 fa ff ff       	call   a67 <malloc>
    1020:	83 c4 10             	add    $0x10,%esp
    1023:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1026:	83 ec 04             	sub    $0x4,%esp
    1029:	6a 08                	push   $0x8
    102b:	6a 00                	push   $0x0
    102d:	ff 75 f4             	pushl  -0xc(%ebp)
    1030:	e8 e9 f2 ff ff       	call   31e <memset>
    1035:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
    1038:	8b 45 f4             	mov    -0xc(%ebp),%eax
    103b:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
    1041:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1044:	8b 55 08             	mov    0x8(%ebp),%edx
    1047:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    104a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    104d:	c9                   	leave  
    104e:	c3                   	ret    

0000104f <calcmd>:

struct cmd* calcmd(char *_line)
{
    104f:	55                   	push   %ebp
    1050:	89 e5                	mov    %esp,%ebp
    1052:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1055:	83 ec 0c             	sub    $0xc,%esp
    1058:	6a 08                	push   $0x8
    105a:	e8 08 fa ff ff       	call   a67 <malloc>
    105f:	83 c4 10             	add    $0x10,%esp
    1062:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1065:	83 ec 04             	sub    $0x4,%esp
    1068:	6a 08                	push   $0x8
    106a:	6a 00                	push   $0x0
    106c:	ff 75 f4             	pushl  -0xc(%ebp)
    106f:	e8 aa f2 ff ff       	call   31e <memset>
    1074:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
    1077:	8b 45 f4             	mov    -0xc(%ebp),%eax
    107a:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
    1080:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1083:	8b 55 08             	mov    0x8(%ebp),%edx
    1086:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    1089:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    108c:	c9                   	leave  
    108d:	c3                   	ret    

0000108e <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
    108e:	55                   	push   %ebp
    108f:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
    1091:	eb 0c                	jmp    109f <mystrncmp+0x11>
    n--, p++, q++;
    1093:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1097:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    109b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    109f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    10a3:	74 1a                	je     10bf <mystrncmp+0x31>
    10a5:	8b 45 08             	mov    0x8(%ebp),%eax
    10a8:	0f b6 00             	movzbl (%eax),%eax
    10ab:	84 c0                	test   %al,%al
    10ad:	74 10                	je     10bf <mystrncmp+0x31>
    10af:	8b 45 08             	mov    0x8(%ebp),%eax
    10b2:	0f b6 10             	movzbl (%eax),%edx
    10b5:	8b 45 0c             	mov    0xc(%ebp),%eax
    10b8:	0f b6 00             	movzbl (%eax),%eax
    10bb:	38 c2                	cmp    %al,%dl
    10bd:	74 d4                	je     1093 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
    10bf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    10c3:	75 07                	jne    10cc <mystrncmp+0x3e>
    return 0;
    10c5:	b8 00 00 00 00       	mov    $0x0,%eax
    10ca:	eb 16                	jmp    10e2 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
    10cc:	8b 45 08             	mov    0x8(%ebp),%eax
    10cf:	0f b6 00             	movzbl (%eax),%eax
    10d2:	0f b6 d0             	movzbl %al,%edx
    10d5:	8b 45 0c             	mov    0xc(%ebp),%eax
    10d8:	0f b6 00             	movzbl (%eax),%eax
    10db:	0f b6 c0             	movzbl %al,%eax
    10de:	29 c2                	sub    %eax,%edx
    10e0:	89 d0                	mov    %edx,%eax
}
    10e2:	5d                   	pop    %ebp
    10e3:	c3                   	ret    

000010e4 <mystrlen>:

static int mystrlen(const char *s)
{
    10e4:	55                   	push   %ebp
    10e5:	89 e5                	mov    %esp,%ebp
    10e7:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
    10ea:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    10f1:	eb 04                	jmp    10f7 <mystrlen+0x13>
    10f3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    10f7:	8b 55 fc             	mov    -0x4(%ebp),%edx
    10fa:	8b 45 08             	mov    0x8(%ebp),%eax
    10fd:	01 d0                	add    %edx,%eax
    10ff:	0f b6 00             	movzbl (%eax),%eax
    1102:	84 c0                	test   %al,%al
    1104:	75 ed                	jne    10f3 <mystrlen+0xf>
    ;
  return n;
    1106:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1109:	c9                   	leave  
    110a:	c3                   	ret    

0000110b <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
    110b:	55                   	push   %ebp
    110c:	89 e5                	mov    %esp,%ebp
    110e:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
    1111:	8b 45 08             	mov    0x8(%ebp),%eax
    1114:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
    1117:	90                   	nop
    1118:	8b 45 10             	mov    0x10(%ebp),%eax
    111b:	8d 50 ff             	lea    -0x1(%eax),%edx
    111e:	89 55 10             	mov    %edx,0x10(%ebp)
    1121:	85 c0                	test   %eax,%eax
    1123:	7e 2c                	jle    1151 <mystrncpy+0x46>
    1125:	8b 45 08             	mov    0x8(%ebp),%eax
    1128:	8d 50 01             	lea    0x1(%eax),%edx
    112b:	89 55 08             	mov    %edx,0x8(%ebp)
    112e:	8b 55 0c             	mov    0xc(%ebp),%edx
    1131:	8d 4a 01             	lea    0x1(%edx),%ecx
    1134:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1137:	0f b6 12             	movzbl (%edx),%edx
    113a:	88 10                	mov    %dl,(%eax)
    113c:	0f b6 00             	movzbl (%eax),%eax
    113f:	84 c0                	test   %al,%al
    1141:	75 d5                	jne    1118 <mystrncpy+0xd>
    ;
  while(n-- > 0)
    1143:	eb 0c                	jmp    1151 <mystrncpy+0x46>
    *s++ = 0;
    1145:	8b 45 08             	mov    0x8(%ebp),%eax
    1148:	8d 50 01             	lea    0x1(%eax),%edx
    114b:	89 55 08             	mov    %edx,0x8(%ebp)
    114e:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    1151:	8b 45 10             	mov    0x10(%ebp),%eax
    1154:	8d 50 ff             	lea    -0x1(%eax),%edx
    1157:	89 55 10             	mov    %edx,0x10(%ebp)
    115a:	85 c0                	test   %eax,%eax
    115c:	7f e7                	jg     1145 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    115e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1161:	c9                   	leave  
    1162:	c3                   	ret    

00001163 <isEqual>:

int isEqual(double a, double b)
{
    1163:	55                   	push   %ebp
    1164:	89 e5                	mov    %esp,%ebp
    1166:	83 ec 10             	sub    $0x10,%esp
    1169:	8b 45 08             	mov    0x8(%ebp),%eax
    116c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    116f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1172:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1175:	8b 45 10             	mov    0x10(%ebp),%eax
    1178:	89 45 f0             	mov    %eax,-0x10(%ebp)
    117b:	8b 45 14             	mov    0x14(%ebp),%eax
    117e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    1181:	dd 45 f8             	fldl   -0x8(%ebp)
    1184:	dc 65 f0             	fsubl  -0x10(%ebp)
    1187:	dd 05 a8 3a 00 00    	fldl   0x3aa8
    118d:	df e9                	fucomip %st(1),%st
    118f:	dd d8                	fstp   %st(0)
    1191:	76 19                	jbe    11ac <isEqual+0x49>
    1193:	dd 45 f0             	fldl   -0x10(%ebp)
    1196:	dc 65 f8             	fsubl  -0x8(%ebp)
    1199:	dd 05 a8 3a 00 00    	fldl   0x3aa8
    119f:	df e9                	fucomip %st(1),%st
    11a1:	dd d8                	fstp   %st(0)
    11a3:	76 07                	jbe    11ac <isEqual+0x49>
    return 1;
    11a5:	b8 01 00 00 00       	mov    $0x1,%eax
    11aa:	eb 05                	jmp    11b1 <isEqual+0x4e>
  return 0;
    11ac:	b8 00 00 00 00       	mov    $0x0,%eax
}
    11b1:	c9                   	leave  
    11b2:	c3                   	ret    

000011b3 <isCmdName>:

int isCmdName(const char* str)
{
    11b3:	55                   	push   %ebp
    11b4:	89 e5                	mov    %esp,%ebp
    11b6:	53                   	push   %ebx
    11b7:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    11ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    11c1:	eb 71                	jmp    1234 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    11c3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    11c6:	89 d0                	mov    %edx,%eax
    11c8:	c1 e0 02             	shl    $0x2,%eax
    11cb:	01 d0                	add    %edx,%eax
    11cd:	01 c0                	add    %eax,%eax
    11cf:	05 00 45 00 00       	add    $0x4500,%eax
    11d4:	83 ec 0c             	sub    $0xc,%esp
    11d7:	50                   	push   %eax
    11d8:	e8 1a f1 ff ff       	call   2f7 <strlen>
    11dd:	83 c4 10             	add    $0x10,%esp
    11e0:	89 c3                	mov    %eax,%ebx
    11e2:	83 ec 0c             	sub    $0xc,%esp
    11e5:	ff 75 08             	pushl  0x8(%ebp)
    11e8:	e8 f7 fe ff ff       	call   10e4 <mystrlen>
    11ed:	83 c4 10             	add    $0x10,%esp
    11f0:	39 c3                	cmp    %eax,%ebx
    11f2:	75 3c                	jne    1230 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    11f4:	83 ec 0c             	sub    $0xc,%esp
    11f7:	ff 75 08             	pushl  0x8(%ebp)
    11fa:	e8 e5 fe ff ff       	call   10e4 <mystrlen>
    11ff:	83 c4 10             	add    $0x10,%esp
    1202:	89 c1                	mov    %eax,%ecx
    1204:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1207:	89 d0                	mov    %edx,%eax
    1209:	c1 e0 02             	shl    $0x2,%eax
    120c:	01 d0                	add    %edx,%eax
    120e:	01 c0                	add    %eax,%eax
    1210:	05 00 45 00 00       	add    $0x4500,%eax
    1215:	83 ec 04             	sub    $0x4,%esp
    1218:	51                   	push   %ecx
    1219:	ff 75 08             	pushl  0x8(%ebp)
    121c:	50                   	push   %eax
    121d:	e8 6c fe ff ff       	call   108e <mystrncmp>
    1222:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1225:	85 c0                	test   %eax,%eax
    1227:	75 07                	jne    1230 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    1229:	b8 01 00 00 00       	mov    $0x1,%eax
    122e:	eb 0f                	jmp    123f <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    1230:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1234:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1238:	7e 89                	jle    11c3 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    123a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    123f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1242:	c9                   	leave  
    1243:	c3                   	ret    

00001244 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    1244:	55                   	push   %ebp
    1245:	89 e5                	mov    %esp,%ebp
    1247:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    124d:	83 ec 08             	sub    $0x8,%esp
    1250:	6a 00                	push   $0x0
    1252:	68 c8 45 00 00       	push   $0x45c8
    1257:	e8 9d f2 ff ff       	call   4f9 <open>
    125c:	83 c4 10             	add    $0x10,%esp
    125f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1262:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1266:	79 0a                	jns    1272 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    1268:	b8 00 00 00 00       	mov    $0x0,%eax
    126d:	e9 9a 01 00 00       	jmp    140c <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    1272:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    1279:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1280:	e9 ee 00 00 00       	jmp    1373 <findAlias+0x12f>
  {
      int isSame = 1;
    1285:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    128c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    1293:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    129a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    12a1:	83 ec 0c             	sub    $0xc,%esp
    12a4:	8d 45 9a             	lea    -0x66(%ebp),%eax
    12a7:	50                   	push   %eax
    12a8:	e8 4a f0 ff ff       	call   2f7 <strlen>
    12ad:	83 c4 10             	add    $0x10,%esp
    12b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    12b3:	83 ec 0c             	sub    $0xc,%esp
    12b6:	ff 75 08             	pushl  0x8(%ebp)
    12b9:	e8 39 f0 ff ff       	call   2f7 <strlen>
    12be:	83 c4 10             	add    $0x10,%esp
    12c1:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    12c4:	8d 55 9a             	lea    -0x66(%ebp),%edx
    12c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12ca:	01 d0                	add    %edx,%eax
    12cc:	0f b6 00             	movzbl (%eax),%eax
    12cf:	3c 21                	cmp    $0x21,%al
    12d1:	75 38                	jne    130b <findAlias+0xc7>
      {
          startIndex++;
    12d3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    12d7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    12de:	eb 2b                	jmp    130b <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    12e0:	8d 55 9a             	lea    -0x66(%ebp),%edx
    12e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12e6:	01 d0                	add    %edx,%eax
    12e8:	0f b6 10             	movzbl (%eax),%edx
    12eb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    12ee:	8b 45 08             	mov    0x8(%ebp),%eax
    12f1:	01 c8                	add    %ecx,%eax
    12f3:	0f b6 00             	movzbl (%eax),%eax
    12f6:	38 c2                	cmp    %al,%dl
    12f8:	74 09                	je     1303 <findAlias+0xbf>
          {
              isSame = 0;
    12fa:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    1301:	eb 1f                	jmp    1322 <findAlias+0xde>
          }
          startIndex++;
    1303:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    1307:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    130b:	8d 55 9a             	lea    -0x66(%ebp),%edx
    130e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1311:	01 d0                	add    %edx,%eax
    1313:	0f b6 00             	movzbl (%eax),%eax
    1316:	3c 3d                	cmp    $0x3d,%al
    1318:	74 08                	je     1322 <findAlias+0xde>
    131a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    131d:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1320:	7c be                	jl     12e0 <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    1322:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1325:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1328:	01 d0                	add    %edx,%eax
    132a:	0f b6 00             	movzbl (%eax),%eax
    132d:	3c 3d                	cmp    $0x3d,%al
    132f:	75 08                	jne    1339 <findAlias+0xf5>
    1331:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1334:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1337:	7d 07                	jge    1340 <findAlias+0xfc>
      {
          isSame = 0;
    1339:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    1340:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    1344:	75 0b                	jne    1351 <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    1346:	b8 01 00 00 00       	mov    $0x1,%eax
    134b:	2b 45 f0             	sub    -0x10(%ebp),%eax
    134e:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    1351:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1355:	75 1c                	jne    1373 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    1357:	83 ec 08             	sub    $0x8,%esp
    135a:	8d 45 9a             	lea    -0x66(%ebp),%eax
    135d:	50                   	push   %eax
    135e:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1364:	50                   	push   %eax
    1365:	e8 1e ef ff ff       	call   288 <strcpy>
    136a:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    136d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1370:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1373:	83 ec 04             	sub    $0x4,%esp
    1376:	6a 32                	push   $0x32
    1378:	8d 45 9a             	lea    -0x66(%ebp),%eax
    137b:	50                   	push   %eax
    137c:	ff 75 dc             	pushl  -0x24(%ebp)
    137f:	e8 4d f1 ff ff       	call   4d1 <read>
    1384:	83 c4 10             	add    $0x10,%esp
    1387:	89 45 d8             	mov    %eax,-0x28(%ebp)
    138a:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    138e:	0f 8f f1 fe ff ff    	jg     1285 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    1394:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1398:	75 5f                	jne    13f9 <findAlias+0x1b5>
  {
    int i = 0;
    139a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    13a1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    13a5:	eb 20                	jmp    13c7 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    13a7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    13aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    13ad:	01 c2                	add    %eax,%edx
    13af:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    13b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13b8:	01 c8                	add    %ecx,%eax
    13ba:	0f b6 00             	movzbl (%eax),%eax
    13bd:	88 02                	mov    %al,(%edx)
      i++;
    13bf:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    13c3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    13c7:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    13cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13d0:	01 d0                	add    %edx,%eax
    13d2:	0f b6 00             	movzbl (%eax),%eax
    13d5:	84 c0                	test   %al,%al
    13d7:	75 ce                	jne    13a7 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    13d9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    13dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    13df:	01 d0                	add    %edx,%eax
    13e1:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    13e4:	83 ec 0c             	sub    $0xc,%esp
    13e7:	ff 75 dc             	pushl  -0x24(%ebp)
    13ea:	e8 f2 f0 ff ff       	call   4e1 <close>
    13ef:	83 c4 10             	add    $0x10,%esp
    return 1;
    13f2:	b8 01 00 00 00       	mov    $0x1,%eax
    13f7:	eb 13                	jmp    140c <findAlias+0x1c8>
  }
  close(fd);
    13f9:	83 ec 0c             	sub    $0xc,%esp
    13fc:	ff 75 dc             	pushl  -0x24(%ebp)
    13ff:	e8 dd f0 ff ff       	call   4e1 <close>
    1404:	83 c4 10             	add    $0x10,%esp
  return 0;
    1407:	b8 00 00 00 00       	mov    $0x0,%eax
}
    140c:	c9                   	leave  
    140d:	c3                   	ret    

0000140e <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    140e:	55                   	push   %ebp
    140f:	89 e5                	mov    %esp,%ebp
    1411:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1414:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1418:	75 05                	jne    141f <runcmd+0x11>
    exit();
    141a:	e8 9a f0 ff ff       	call   4b9 <exit>
  
  switch(cmd->type){
    141f:	8b 45 08             	mov    0x8(%ebp),%eax
    1422:	8b 00                	mov    (%eax),%eax
    1424:	83 f8 05             	cmp    $0x5,%eax
    1427:	77 09                	ja     1432 <runcmd+0x24>
    1429:	8b 04 85 0c 39 00 00 	mov    0x390c(,%eax,4),%eax
    1430:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    1432:	83 ec 0c             	sub    $0xc,%esp
    1435:	68 e0 38 00 00       	push   $0x38e0
    143a:	e8 0b f7 ff ff       	call   b4a <panic1>
    143f:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    1442:	8b 45 08             	mov    0x8(%ebp),%eax
    1445:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    1448:	8b 45 f4             	mov    -0xc(%ebp),%eax
    144b:	8b 40 04             	mov    0x4(%eax),%eax
    144e:	85 c0                	test   %eax,%eax
    1450:	75 05                	jne    1457 <runcmd+0x49>
      exit();
    1452:	e8 62 f0 ff ff       	call   4b9 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    1457:	8b 45 f4             	mov    -0xc(%ebp),%eax
    145a:	8b 40 04             	mov    0x4(%eax),%eax
    145d:	83 ec 0c             	sub    $0xc,%esp
    1460:	50                   	push   %eax
    1461:	e8 4d fd ff ff       	call   11b3 <isCmdName>
    1466:	83 c4 10             	add    $0x10,%esp
    1469:	85 c0                	test   %eax,%eax
    146b:	75 37                	jne    14a4 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    146d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1470:	8b 40 04             	mov    0x4(%eax),%eax
    1473:	83 ec 08             	sub    $0x8,%esp
    1476:	8d 55 ce             	lea    -0x32(%ebp),%edx
    1479:	52                   	push   %edx
    147a:	50                   	push   %eax
    147b:	e8 c4 fd ff ff       	call   1244 <findAlias>
    1480:	83 c4 10             	add    $0x10,%esp
    1483:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    1486:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    148a:	75 31                	jne    14bd <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    148c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    148f:	83 c0 04             	add    $0x4,%eax
    1492:	83 ec 08             	sub    $0x8,%esp
    1495:	50                   	push   %eax
    1496:	8d 45 ce             	lea    -0x32(%ebp),%eax
    1499:	50                   	push   %eax
    149a:	e8 52 f0 ff ff       	call   4f1 <exec>
    149f:	83 c4 10             	add    $0x10,%esp
    14a2:	eb 19                	jmp    14bd <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    14a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14a7:	8d 50 04             	lea    0x4(%eax),%edx
    14aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14ad:	8b 40 04             	mov    0x4(%eax),%eax
    14b0:	83 ec 08             	sub    $0x8,%esp
    14b3:	52                   	push   %edx
    14b4:	50                   	push   %eax
    14b5:	e8 37 f0 ff ff       	call   4f1 <exec>
    14ba:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    14bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14c0:	8b 40 04             	mov    0x4(%eax),%eax
    14c3:	83 ec 04             	sub    $0x4,%esp
    14c6:	50                   	push   %eax
    14c7:	68 e7 38 00 00       	push   $0x38e7
    14cc:	6a 02                	push   $0x2
    14ce:	e8 92 f2 ff ff       	call   765 <printf>
    14d3:	83 c4 10             	add    $0x10,%esp
    break;
    14d6:	e9 c6 01 00 00       	jmp    16a1 <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    14db:	8b 45 08             	mov    0x8(%ebp),%eax
    14de:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    14e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14e4:	8b 40 14             	mov    0x14(%eax),%eax
    14e7:	83 ec 0c             	sub    $0xc,%esp
    14ea:	50                   	push   %eax
    14eb:	e8 f1 ef ff ff       	call   4e1 <close>
    14f0:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    14f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14f6:	8b 50 10             	mov    0x10(%eax),%edx
    14f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14fc:	8b 40 08             	mov    0x8(%eax),%eax
    14ff:	83 ec 08             	sub    $0x8,%esp
    1502:	52                   	push   %edx
    1503:	50                   	push   %eax
    1504:	e8 f0 ef ff ff       	call   4f9 <open>
    1509:	83 c4 10             	add    $0x10,%esp
    150c:	85 c0                	test   %eax,%eax
    150e:	79 1e                	jns    152e <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    1510:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1513:	8b 40 08             	mov    0x8(%eax),%eax
    1516:	83 ec 04             	sub    $0x4,%esp
    1519:	50                   	push   %eax
    151a:	68 f7 38 00 00       	push   $0x38f7
    151f:	6a 02                	push   $0x2
    1521:	e8 3f f2 ff ff       	call   765 <printf>
    1526:	83 c4 10             	add    $0x10,%esp
      exit();
    1529:	e8 8b ef ff ff       	call   4b9 <exit>
    }
    runcmd(rcmd->cmd);
    152e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1531:	8b 40 04             	mov    0x4(%eax),%eax
    1534:	83 ec 0c             	sub    $0xc,%esp
    1537:	50                   	push   %eax
    1538:	e8 d1 fe ff ff       	call   140e <runcmd>
    153d:	83 c4 10             	add    $0x10,%esp
    break;
    1540:	e9 5c 01 00 00       	jmp    16a1 <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    1545:	8b 45 08             	mov    0x8(%ebp),%eax
    1548:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    154b:	e8 84 f9 ff ff       	call   ed4 <fork1>
    1550:	85 c0                	test   %eax,%eax
    1552:	75 12                	jne    1566 <runcmd+0x158>
      runcmd(lcmd->left);
    1554:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1557:	8b 40 04             	mov    0x4(%eax),%eax
    155a:	83 ec 0c             	sub    $0xc,%esp
    155d:	50                   	push   %eax
    155e:	e8 ab fe ff ff       	call   140e <runcmd>
    1563:	83 c4 10             	add    $0x10,%esp
    wait();
    1566:	e8 56 ef ff ff       	call   4c1 <wait>
    runcmd(lcmd->right);
    156b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    156e:	8b 40 08             	mov    0x8(%eax),%eax
    1571:	83 ec 0c             	sub    $0xc,%esp
    1574:	50                   	push   %eax
    1575:	e8 94 fe ff ff       	call   140e <runcmd>
    157a:	83 c4 10             	add    $0x10,%esp
    break;
    157d:	e9 1f 01 00 00       	jmp    16a1 <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    1582:	8b 45 08             	mov    0x8(%ebp),%eax
    1585:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    1588:	83 ec 0c             	sub    $0xc,%esp
    158b:	8d 45 d8             	lea    -0x28(%ebp),%eax
    158e:	50                   	push   %eax
    158f:	e8 35 ef ff ff       	call   4c9 <pipe>
    1594:	83 c4 10             	add    $0x10,%esp
    1597:	85 c0                	test   %eax,%eax
    1599:	79 10                	jns    15ab <runcmd+0x19d>
      panic1("pipe");
    159b:	83 ec 0c             	sub    $0xc,%esp
    159e:	68 07 39 00 00       	push   $0x3907
    15a3:	e8 a2 f5 ff ff       	call   b4a <panic1>
    15a8:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    15ab:	e8 24 f9 ff ff       	call   ed4 <fork1>
    15b0:	85 c0                	test   %eax,%eax
    15b2:	75 4c                	jne    1600 <runcmd+0x1f2>
      close(1);
    15b4:	83 ec 0c             	sub    $0xc,%esp
    15b7:	6a 01                	push   $0x1
    15b9:	e8 23 ef ff ff       	call   4e1 <close>
    15be:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    15c1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    15c4:	83 ec 0c             	sub    $0xc,%esp
    15c7:	50                   	push   %eax
    15c8:	e8 64 ef ff ff       	call   531 <dup>
    15cd:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    15d0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    15d3:	83 ec 0c             	sub    $0xc,%esp
    15d6:	50                   	push   %eax
    15d7:	e8 05 ef ff ff       	call   4e1 <close>
    15dc:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    15df:	8b 45 dc             	mov    -0x24(%ebp),%eax
    15e2:	83 ec 0c             	sub    $0xc,%esp
    15e5:	50                   	push   %eax
    15e6:	e8 f6 ee ff ff       	call   4e1 <close>
    15eb:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    15ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15f1:	8b 40 04             	mov    0x4(%eax),%eax
    15f4:	83 ec 0c             	sub    $0xc,%esp
    15f7:	50                   	push   %eax
    15f8:	e8 11 fe ff ff       	call   140e <runcmd>
    15fd:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    1600:	e8 cf f8 ff ff       	call   ed4 <fork1>
    1605:	85 c0                	test   %eax,%eax
    1607:	75 4c                	jne    1655 <runcmd+0x247>
      close(0);
    1609:	83 ec 0c             	sub    $0xc,%esp
    160c:	6a 00                	push   $0x0
    160e:	e8 ce ee ff ff       	call   4e1 <close>
    1613:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    1616:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1619:	83 ec 0c             	sub    $0xc,%esp
    161c:	50                   	push   %eax
    161d:	e8 0f ef ff ff       	call   531 <dup>
    1622:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1625:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1628:	83 ec 0c             	sub    $0xc,%esp
    162b:	50                   	push   %eax
    162c:	e8 b0 ee ff ff       	call   4e1 <close>
    1631:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    1634:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1637:	83 ec 0c             	sub    $0xc,%esp
    163a:	50                   	push   %eax
    163b:	e8 a1 ee ff ff       	call   4e1 <close>
    1640:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    1643:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1646:	8b 40 08             	mov    0x8(%eax),%eax
    1649:	83 ec 0c             	sub    $0xc,%esp
    164c:	50                   	push   %eax
    164d:	e8 bc fd ff ff       	call   140e <runcmd>
    1652:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    1655:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1658:	83 ec 0c             	sub    $0xc,%esp
    165b:	50                   	push   %eax
    165c:	e8 80 ee ff ff       	call   4e1 <close>
    1661:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    1664:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1667:	83 ec 0c             	sub    $0xc,%esp
    166a:	50                   	push   %eax
    166b:	e8 71 ee ff ff       	call   4e1 <close>
    1670:	83 c4 10             	add    $0x10,%esp
    wait();
    1673:	e8 49 ee ff ff       	call   4c1 <wait>
    wait();
    1678:	e8 44 ee ff ff       	call   4c1 <wait>
    break;
    167d:	eb 22                	jmp    16a1 <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    167f:	8b 45 08             	mov    0x8(%ebp),%eax
    1682:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    1685:	e8 4a f8 ff ff       	call   ed4 <fork1>
    168a:	85 c0                	test   %eax,%eax
    168c:	75 12                	jne    16a0 <runcmd+0x292>
      runcmd(bcmd->cmd);
    168e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1691:	8b 40 04             	mov    0x4(%eax),%eax
    1694:	83 ec 0c             	sub    $0xc,%esp
    1697:	50                   	push   %eax
    1698:	e8 71 fd ff ff       	call   140e <runcmd>
    169d:	83 c4 10             	add    $0x10,%esp
    break;
    16a0:	90                   	nop
  }
  exit();
    16a1:	e8 13 ee ff ff       	call   4b9 <exit>

000016a6 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    16a6:	55                   	push   %ebp
    16a7:	89 e5                	mov    %esp,%ebp
    16a9:	83 ec 04             	sub    $0x4,%esp
    16ac:	8b 45 08             	mov    0x8(%ebp),%eax
    16af:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    16b2:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    16b6:	7e 0d                	jle    16c5 <isNameChar+0x1f>
    16b8:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    16bc:	7f 07                	jg     16c5 <isNameChar+0x1f>
    return 1;
    16be:	b8 01 00 00 00       	mov    $0x1,%eax
    16c3:	eb 38                	jmp    16fd <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    16c5:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    16c9:	7e 0d                	jle    16d8 <isNameChar+0x32>
    16cb:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    16cf:	7f 07                	jg     16d8 <isNameChar+0x32>
    return 1;
    16d1:	b8 01 00 00 00       	mov    $0x1,%eax
    16d6:	eb 25                	jmp    16fd <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    16d8:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    16dc:	7e 0d                	jle    16eb <isNameChar+0x45>
    16de:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    16e2:	7f 07                	jg     16eb <isNameChar+0x45>
    return 1;
    16e4:	b8 01 00 00 00       	mov    $0x1,%eax
    16e9:	eb 12                	jmp    16fd <isNameChar+0x57>
  if(ch == '_')
    16eb:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    16ef:	75 07                	jne    16f8 <isNameChar+0x52>
    return 1;
    16f1:	b8 01 00 00 00       	mov    $0x1,%eax
    16f6:	eb 05                	jmp    16fd <isNameChar+0x57>
  return 0;
    16f8:	b8 00 00 00 00       	mov    $0x0,%eax
}
    16fd:	c9                   	leave  
    16fe:	c3                   	ret    

000016ff <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    16ff:	55                   	push   %ebp
    1700:	89 e5                	mov    %esp,%ebp
    1702:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    1705:	8b 45 08             	mov    0x8(%ebp),%eax
    1708:	8b 40 04             	mov    0x4(%eax),%eax
    170b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    170e:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    1715:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    171c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1723:	eb 1d                	jmp    1742 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    1725:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1728:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    172b:	01 d0                	add    %edx,%eax
    172d:	0f b6 00             	movzbl (%eax),%eax
    1730:	3c 3d                	cmp    $0x3d,%al
    1732:	75 0a                	jne    173e <runCalcmd+0x3f>
    {
      hasEqu++;
    1734:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    1738:	8b 45 ec             	mov    -0x14(%ebp),%eax
    173b:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    173e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1742:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1745:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1748:	01 d0                	add    %edx,%eax
    174a:	0f b6 00             	movzbl (%eax),%eax
    174d:	84 c0                	test   %al,%al
    174f:	75 d4                	jne    1725 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    1751:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1755:	7e 1d                	jle    1774 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    1757:	83 ec 0c             	sub    $0xc,%esp
    175a:	68 24 39 00 00       	push   $0x3924
    175f:	6a 00                	push   $0x0
    1761:	6a 00                	push   $0x0
    1763:	6a 01                	push   $0x1
    1765:	6a 04                	push   $0x4
    1767:	e8 21 17 00 00       	call   2e8d <color_printf>
    176c:	83 c4 20             	add    $0x20,%esp
    176f:	e9 78 05 00 00       	jmp    1cec <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    1774:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1778:	0f 85 26 05 00 00    	jne    1ca4 <runCalcmd+0x5a5>
  {
    int i=0;
    177e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    1785:	eb 04                	jmp    178b <runCalcmd+0x8c>
    {
      i++;
    1787:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    178b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    178e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1791:	01 d0                	add    %edx,%eax
    1793:	0f b6 00             	movzbl (%eax),%eax
    1796:	3c 20                	cmp    $0x20,%al
    1798:	74 ed                	je     1787 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    179a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    179d:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    17a0:	eb 23                	jmp    17c5 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    17a2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    17a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17a8:	01 d0                	add    %edx,%eax
    17aa:	0f b6 00             	movzbl (%eax),%eax
    17ad:	0f be c0             	movsbl %al,%eax
    17b0:	83 ec 0c             	sub    $0xc,%esp
    17b3:	50                   	push   %eax
    17b4:	e8 ed fe ff ff       	call   16a6 <isNameChar>
    17b9:	83 c4 10             	add    $0x10,%esp
    17bc:	83 f8 01             	cmp    $0x1,%eax
    17bf:	75 0e                	jne    17cf <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    17c1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    17c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17c8:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    17cb:	7c d5                	jl     17a2 <runCalcmd+0xa3>
    17cd:	eb 01                	jmp    17d0 <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    17cf:	90                   	nop
    }
    int len = i-startIndex;
    17d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17d3:	2b 45 d0             	sub    -0x30(%ebp),%eax
    17d6:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    17d9:	eb 04                	jmp    17df <runCalcmd+0xe0>
    {
      i++;
    17db:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    17df:	8b 55 e8             	mov    -0x18(%ebp),%edx
    17e2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17e5:	01 d0                	add    %edx,%eax
    17e7:	0f b6 00             	movzbl (%eax),%eax
    17ea:	3c 20                	cmp    $0x20,%al
    17ec:	74 ed                	je     17db <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    17ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17f1:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    17f4:	0f 85 90 04 00 00    	jne    1c8a <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    17fa:	8b 55 d0             	mov    -0x30(%ebp),%edx
    17fd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1800:	01 d0                	add    %edx,%eax
    1802:	0f b6 00             	movzbl (%eax),%eax
    1805:	3c 2f                	cmp    $0x2f,%al
    1807:	7e 2c                	jle    1835 <runCalcmd+0x136>
    1809:	8b 55 d0             	mov    -0x30(%ebp),%edx
    180c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    180f:	01 d0                	add    %edx,%eax
    1811:	0f b6 00             	movzbl (%eax),%eax
    1814:	3c 39                	cmp    $0x39,%al
    1816:	7f 1d                	jg     1835 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    1818:	83 ec 0c             	sub    $0xc,%esp
    181b:	68 40 39 00 00       	push   $0x3940
    1820:	6a 00                	push   $0x0
    1822:	6a 00                	push   $0x0
    1824:	6a 01                	push   $0x1
    1826:	6a 04                	push   $0x4
    1828:	e8 60 16 00 00       	call   2e8d <color_printf>
    182d:	83 c4 20             	add    $0x20,%esp
    1830:	e9 b7 04 00 00       	jmp    1cec <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1835:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    183c:	eb 20                	jmp    185e <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    183e:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1841:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1844:	01 d0                	add    %edx,%eax
    1846:	89 c2                	mov    %eax,%edx
    1848:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    184b:	01 d0                	add    %edx,%eax
    184d:	0f b6 00             	movzbl (%eax),%eax
    1850:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1853:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1856:	01 ca                	add    %ecx,%edx
    1858:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    185a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    185e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1861:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1864:	7c d8                	jl     183e <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1866:	8d 55 94             	lea    -0x6c(%ebp),%edx
    1869:	8b 45 cc             	mov    -0x34(%ebp),%eax
    186c:	01 d0                	add    %edx,%eax
    186e:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    1871:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1874:	83 c0 01             	add    $0x1,%eax
    1877:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    187a:	eb 04                	jmp    1880 <runCalcmd+0x181>
        {
          i++;
    187c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    1880:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1883:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1886:	01 d0                	add    %edx,%eax
    1888:	0f b6 00             	movzbl (%eax),%eax
    188b:	3c 20                	cmp    $0x20,%al
    188d:	74 ed                	je     187c <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    188f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1892:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1895:	01 d0                	add    %edx,%eax
    1897:	0f b6 00             	movzbl (%eax),%eax
    189a:	3c 60                	cmp    $0x60,%al
    189c:	0f 85 e6 01 00 00    	jne    1a88 <runCalcmd+0x389>
        {
          i++;
    18a2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    18a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18a9:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    18ac:	eb 04                	jmp    18b2 <runCalcmd+0x1b3>
          {
            i++;
    18ae:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    18b2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18b5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18b8:	01 d0                	add    %edx,%eax
    18ba:	0f b6 00             	movzbl (%eax),%eax
    18bd:	3c 60                	cmp    $0x60,%al
    18bf:	74 0f                	je     18d0 <runCalcmd+0x1d1>
    18c1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18c4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18c7:	01 d0                	add    %edx,%eax
    18c9:	0f b6 00             	movzbl (%eax),%eax
    18cc:	84 c0                	test   %al,%al
    18ce:	75 de                	jne    18ae <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    18d0:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18d3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18d6:	01 d0                	add    %edx,%eax
    18d8:	0f b6 00             	movzbl (%eax),%eax
    18db:	3c 60                	cmp    $0x60,%al
    18dd:	0f 85 5c 01 00 00    	jne    1a3f <runCalcmd+0x340>
    18e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18e6:	8d 50 01             	lea    0x1(%eax),%edx
    18e9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18ec:	01 d0                	add    %edx,%eax
    18ee:	0f b6 00             	movzbl (%eax),%eax
    18f1:	84 c0                	test   %al,%al
    18f3:	0f 85 46 01 00 00    	jne    1a3f <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    18f9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    18fc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18ff:	01 d0                	add    %edx,%eax
    1901:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    1904:	8b 55 c8             	mov    -0x38(%ebp),%edx
    1907:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    190a:	01 d0                	add    %edx,%eax
    190c:	83 ec 0c             	sub    $0xc,%esp
    190f:	50                   	push   %eax
    1910:	e8 c5 04 00 00       	call   1dda <Compute>
    1915:	83 c4 10             	add    $0x10,%esp
    1918:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    191b:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    1921:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1925:	dd 1c 24             	fstpl  (%esp)
    1928:	ff 75 c4             	pushl  -0x3c(%ebp)
    192b:	ff 75 c0             	pushl  -0x40(%ebp)
    192e:	e8 30 f8 ff ff       	call   1163 <isEqual>
    1933:	83 c4 10             	add    $0x10,%esp
    1936:	85 c0                	test   %eax,%eax
    1938:	0f 85 ad 03 00 00    	jne    1ceb <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    193e:	a1 0c 46 00 00       	mov    0x460c,%eax
    1943:	85 c0                	test   %eax,%eax
    1945:	75 15                	jne    195c <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1947:	83 ec 08             	sub    $0x8,%esp
    194a:	68 0c 46 00 00       	push   $0x460c
    194f:	68 40 46 00 00       	push   $0x4640
    1954:	e8 ba 19 00 00       	call   3313 <readVariables>
    1959:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    195c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1963:	eb 26                	jmp    198b <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1965:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1968:	c1 e0 05             	shl    $0x5,%eax
    196b:	05 40 46 00 00       	add    $0x4640,%eax
    1970:	8d 50 04             	lea    0x4(%eax),%edx
    1973:	83 ec 08             	sub    $0x8,%esp
    1976:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1979:	50                   	push   %eax
    197a:	52                   	push   %edx
    197b:	e8 38 e9 ff ff       	call   2b8 <strcmp>
    1980:	83 c4 10             	add    $0x10,%esp
    1983:	85 c0                	test   %eax,%eax
    1985:	74 10                	je     1997 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1987:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    198b:	a1 0c 46 00 00       	mov    0x460c,%eax
    1990:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1993:	7c d0                	jl     1965 <runCalcmd+0x266>
    1995:	eb 01                	jmp    1998 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1997:	90                   	nop
              }
              if(index == v_num) //new variable
    1998:	a1 0c 46 00 00       	mov    0x460c,%eax
    199d:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    19a0:	75 3c                	jne    19de <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    19a2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    19a5:	c1 e0 05             	shl    $0x5,%eax
    19a8:	05 40 46 00 00       	add    $0x4640,%eax
    19ad:	8d 50 04             	lea    0x4(%eax),%edx
    19b0:	83 ec 08             	sub    $0x8,%esp
    19b3:	8d 45 94             	lea    -0x6c(%ebp),%eax
    19b6:	50                   	push   %eax
    19b7:	52                   	push   %edx
    19b8:	e8 cb e8 ff ff       	call   288 <strcpy>
    19bd:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    19c0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    19c3:	c1 e0 05             	shl    $0x5,%eax
    19c6:	05 40 46 00 00       	add    $0x4640,%eax
    19cb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    19d1:	a1 0c 46 00 00       	mov    0x460c,%eax
    19d6:	83 c0 01             	add    $0x1,%eax
    19d9:	a3 0c 46 00 00       	mov    %eax,0x460c
              }
              variables[index].value.dvalue = result;
    19de:	8b 45 dc             	mov    -0x24(%ebp),%eax
    19e1:	c1 e0 05             	shl    $0x5,%eax
    19e4:	05 50 46 00 00       	add    $0x4650,%eax
    19e9:	dd 45 c0             	fldl   -0x40(%ebp)
    19ec:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    19ef:	8b 45 dc             	mov    -0x24(%ebp),%eax
    19f2:	c1 e0 05             	shl    $0x5,%eax
    19f5:	05 50 46 00 00       	add    $0x4650,%eax
    19fa:	dd 40 08             	fldl   0x8(%eax)
    19fd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1a00:	c1 e0 05             	shl    $0x5,%eax
    1a03:	05 40 46 00 00       	add    $0x4640,%eax
    1a08:	83 c0 04             	add    $0x4,%eax
    1a0b:	83 ec 0c             	sub    $0xc,%esp
    1a0e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1a12:	dd 1c 24             	fstpl  (%esp)
    1a15:	50                   	push   %eax
    1a16:	68 6a 39 00 00       	push   $0x396a
    1a1b:	6a 01                	push   $0x1
    1a1d:	e8 43 ed ff ff       	call   765 <printf>
    1a22:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1a25:	83 ec 08             	sub    $0x8,%esp
    1a28:	68 0c 46 00 00       	push   $0x460c
    1a2d:	68 40 46 00 00       	push   $0x4640
    1a32:	e8 90 1b 00 00       	call   35c7 <writeVariables>
    1a37:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1a3a:	e9 ac 02 00 00       	jmp    1ceb <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    1a3f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a42:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a45:	01 d0                	add    %edx,%eax
    1a47:	0f b6 00             	movzbl (%eax),%eax
    1a4a:	84 c0                	test   %al,%al
    1a4c:	75 1d                	jne    1a6b <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    1a4e:	83 ec 0c             	sub    $0xc,%esp
    1a51:	68 71 39 00 00       	push   $0x3971
    1a56:	6a 00                	push   $0x0
    1a58:	6a 00                	push   $0x0
    1a5a:	6a 01                	push   $0x1
    1a5c:	6a 04                	push   $0x4
    1a5e:	e8 2a 14 00 00       	call   2e8d <color_printf>
    1a63:	83 c4 20             	add    $0x20,%esp
    1a66:	e9 81 02 00 00       	jmp    1cec <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    1a6b:	83 ec 0c             	sub    $0xc,%esp
    1a6e:	68 88 39 00 00       	push   $0x3988
    1a73:	6a 00                	push   $0x0
    1a75:	6a 00                	push   $0x0
    1a77:	6a 01                	push   $0x1
    1a79:	6a 04                	push   $0x4
    1a7b:	e8 0d 14 00 00       	call   2e8d <color_printf>
    1a80:	83 c4 20             	add    $0x20,%esp
    1a83:	e9 64 02 00 00       	jmp    1cec <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1a88:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a8b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a8e:	01 d0                	add    %edx,%eax
    1a90:	0f b6 00             	movzbl (%eax),%eax
    1a93:	3c 22                	cmp    $0x22,%al
    1a95:	0f 85 d5 01 00 00    	jne    1c70 <runCalcmd+0x571>
        {
          i++;
    1a9b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    1a9f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1aa2:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1aa5:	eb 04                	jmp    1aab <runCalcmd+0x3ac>
          {
            i++;
    1aa7:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1aab:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1aae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1ab1:	01 d0                	add    %edx,%eax
    1ab3:	0f b6 00             	movzbl (%eax),%eax
    1ab6:	3c 22                	cmp    $0x22,%al
    1ab8:	74 0f                	je     1ac9 <runCalcmd+0x3ca>
    1aba:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1abd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1ac0:	01 d0                	add    %edx,%eax
    1ac2:	0f b6 00             	movzbl (%eax),%eax
    1ac5:	84 c0                	test   %al,%al
    1ac7:	75 de                	jne    1aa7 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1ac9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1acc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1acf:	01 d0                	add    %edx,%eax
    1ad1:	0f b6 00             	movzbl (%eax),%eax
    1ad4:	3c 22                	cmp    $0x22,%al
    1ad6:	0f 85 4e 01 00 00    	jne    1c2a <runCalcmd+0x52b>
    1adc:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1adf:	8d 50 01             	lea    0x1(%eax),%edx
    1ae2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1ae5:	01 d0                	add    %edx,%eax
    1ae7:	0f b6 00             	movzbl (%eax),%eax
    1aea:	84 c0                	test   %al,%al
    1aec:	0f 85 38 01 00 00    	jne    1c2a <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1af2:	a1 0c 46 00 00       	mov    0x460c,%eax
    1af7:	85 c0                	test   %eax,%eax
    1af9:	75 15                	jne    1b10 <runCalcmd+0x411>
              readVariables(variables,&v_num);
    1afb:	83 ec 08             	sub    $0x8,%esp
    1afe:	68 0c 46 00 00       	push   $0x460c
    1b03:	68 40 46 00 00       	push   $0x4640
    1b08:	e8 06 18 00 00       	call   3313 <readVariables>
    1b0d:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1b10:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1b17:	eb 26                	jmp    1b3f <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    1b19:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1b1c:	c1 e0 05             	shl    $0x5,%eax
    1b1f:	05 40 46 00 00       	add    $0x4640,%eax
    1b24:	8d 50 04             	lea    0x4(%eax),%edx
    1b27:	83 ec 08             	sub    $0x8,%esp
    1b2a:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1b2d:	50                   	push   %eax
    1b2e:	52                   	push   %edx
    1b2f:	e8 84 e7 ff ff       	call   2b8 <strcmp>
    1b34:	83 c4 10             	add    $0x10,%esp
    1b37:	85 c0                	test   %eax,%eax
    1b39:	74 10                	je     1b4b <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    1b3b:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1b3f:	a1 0c 46 00 00       	mov    0x460c,%eax
    1b44:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1b47:	7c d0                	jl     1b19 <runCalcmd+0x41a>
    1b49:	eb 01                	jmp    1b4c <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    1b4b:	90                   	nop
            }
            if(index == v_num) //new variable
    1b4c:	a1 0c 46 00 00       	mov    0x460c,%eax
    1b51:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1b54:	75 2b                	jne    1b81 <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1b56:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1b59:	c1 e0 05             	shl    $0x5,%eax
    1b5c:	05 40 46 00 00       	add    $0x4640,%eax
    1b61:	8d 50 04             	lea    0x4(%eax),%edx
    1b64:	83 ec 08             	sub    $0x8,%esp
    1b67:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1b6a:	50                   	push   %eax
    1b6b:	52                   	push   %edx
    1b6c:	e8 17 e7 ff ff       	call   288 <strcpy>
    1b71:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1b74:	a1 0c 46 00 00       	mov    0x460c,%eax
    1b79:	83 c0 01             	add    $0x1,%eax
    1b7c:	a3 0c 46 00 00       	mov    %eax,0x460c
            }
            variables[index].type = V_STRING;
    1b81:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1b84:	c1 e0 05             	shl    $0x5,%eax
    1b87:	05 40 46 00 00       	add    $0x4640,%eax
    1b8c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1b92:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1b95:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1b98:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1b9b:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1b9e:	83 c0 01             	add    $0x1,%eax
    1ba1:	83 ec 0c             	sub    $0xc,%esp
    1ba4:	50                   	push   %eax
    1ba5:	e8 bd ee ff ff       	call   a67 <malloc>
    1baa:	83 c4 10             	add    $0x10,%esp
    1bad:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1bb0:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1bb3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1bb6:	01 d0                	add    %edx,%eax
    1bb8:	83 ec 08             	sub    $0x8,%esp
    1bbb:	50                   	push   %eax
    1bbc:	ff 75 b4             	pushl  -0x4c(%ebp)
    1bbf:	e8 c4 e6 ff ff       	call   288 <strcpy>
    1bc4:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1bc7:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1bca:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1bcd:	01 d0                	add    %edx,%eax
    1bcf:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1bd2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1bd5:	c1 e0 05             	shl    $0x5,%eax
    1bd8:	8d 90 58 46 00 00    	lea    0x4658(%eax),%edx
    1bde:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1be1:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1be3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1be6:	c1 e0 05             	shl    $0x5,%eax
    1be9:	05 58 46 00 00       	add    $0x4658,%eax
    1bee:	8b 00                	mov    (%eax),%eax
    1bf0:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1bf3:	c1 e2 05             	shl    $0x5,%edx
    1bf6:	81 c2 40 46 00 00    	add    $0x4640,%edx
    1bfc:	83 c2 04             	add    $0x4,%edx
    1bff:	50                   	push   %eax
    1c00:	52                   	push   %edx
    1c01:	68 a9 39 00 00       	push   $0x39a9
    1c06:	6a 01                	push   $0x1
    1c08:	e8 58 eb ff ff       	call   765 <printf>
    1c0d:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1c10:	83 ec 08             	sub    $0x8,%esp
    1c13:	68 0c 46 00 00       	push   $0x460c
    1c18:	68 40 46 00 00       	push   $0x4640
    1c1d:	e8 a5 19 00 00       	call   35c7 <writeVariables>
    1c22:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1c25:	e9 c2 00 00 00       	jmp    1cec <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1c2a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1c2d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1c30:	01 d0                	add    %edx,%eax
    1c32:	0f b6 00             	movzbl (%eax),%eax
    1c35:	84 c0                	test   %al,%al
    1c37:	75 1d                	jne    1c56 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1c39:	83 ec 0c             	sub    $0xc,%esp
    1c3c:	68 b2 39 00 00       	push   $0x39b2
    1c41:	6a 00                	push   $0x0
    1c43:	6a 00                	push   $0x0
    1c45:	6a 01                	push   $0x1
    1c47:	6a 04                	push   $0x4
    1c49:	e8 3f 12 00 00       	call   2e8d <color_printf>
    1c4e:	83 c4 20             	add    $0x20,%esp
    1c51:	e9 96 00 00 00       	jmp    1cec <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1c56:	83 ec 0c             	sub    $0xc,%esp
    1c59:	68 c8 39 00 00       	push   $0x39c8
    1c5e:	6a 00                	push   $0x0
    1c60:	6a 00                	push   $0x0
    1c62:	6a 01                	push   $0x1
    1c64:	6a 04                	push   $0x4
    1c66:	e8 22 12 00 00       	call   2e8d <color_printf>
    1c6b:	83 c4 20             	add    $0x20,%esp
    1c6e:	eb 7c                	jmp    1cec <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1c70:	83 ec 0c             	sub    $0xc,%esp
    1c73:	68 e9 39 00 00       	push   $0x39e9
    1c78:	6a 00                	push   $0x0
    1c7a:	6a 00                	push   $0x0
    1c7c:	6a 01                	push   $0x1
    1c7e:	6a 04                	push   $0x4
    1c80:	e8 08 12 00 00       	call   2e8d <color_printf>
    1c85:	83 c4 20             	add    $0x20,%esp
    1c88:	eb 62                	jmp    1cec <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1c8a:	83 ec 0c             	sub    $0xc,%esp
    1c8d:	68 e9 39 00 00       	push   $0x39e9
    1c92:	6a 00                	push   $0x0
    1c94:	6a 00                	push   $0x0
    1c96:	6a 01                	push   $0x1
    1c98:	6a 04                	push   $0x4
    1c9a:	e8 ee 11 00 00       	call   2e8d <color_printf>
    1c9f:	83 c4 20             	add    $0x20,%esp
    1ca2:	eb 48                	jmp    1cec <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1ca4:	83 ec 0c             	sub    $0xc,%esp
    1ca7:	ff 75 d4             	pushl  -0x2c(%ebp)
    1caa:	e8 2b 01 00 00       	call   1dda <Compute>
    1caf:	83 c4 10             	add    $0x10,%esp
    1cb2:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1cb5:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    1cbb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1cbf:	dd 1c 24             	fstpl  (%esp)
    1cc2:	ff 75 ac             	pushl  -0x54(%ebp)
    1cc5:	ff 75 a8             	pushl  -0x58(%ebp)
    1cc8:	e8 96 f4 ff ff       	call   1163 <isEqual>
    1ccd:	83 c4 10             	add    $0x10,%esp
    1cd0:	85 c0                	test   %eax,%eax
    1cd2:	75 18                	jne    1cec <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1cd4:	ff 75 ac             	pushl  -0x54(%ebp)
    1cd7:	ff 75 a8             	pushl  -0x58(%ebp)
    1cda:	68 01 3a 00 00       	push   $0x3a01
    1cdf:	6a 01                	push   $0x1
    1ce1:	e8 7f ea ff ff       	call   765 <printf>
    1ce6:	83 c4 10             	add    $0x10,%esp
    1ce9:	eb 01                	jmp    1cec <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1ceb:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1cec:	e8 c8 e7 ff ff       	call   4b9 <exit>

00001cf1 <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1cf1:	55                   	push   %ebp
    1cf2:	89 e5                	mov    %esp,%ebp
    1cf4:	83 ec 04             	sub    $0x4,%esp
    1cf7:	8b 45 08             	mov    0x8(%ebp),%eax
    1cfa:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1cfd:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1d01:	83 e8 23             	sub    $0x23,%eax
    1d04:	83 f8 0c             	cmp    $0xc,%eax
    1d07:	77 25                	ja     1d2e <GetLevel+0x3d>
    1d09:	8b 04 85 08 3a 00 00 	mov    0x3a08(,%eax,4),%eax
    1d10:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1d12:	b8 01 00 00 00       	mov    $0x1,%eax
    1d17:	eb 1a                	jmp    1d33 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1d19:	b8 02 00 00 00       	mov    $0x2,%eax
    1d1e:	eb 13                	jmp    1d33 <GetLevel+0x42>
    case '(':
        return 0;
    1d20:	b8 00 00 00 00       	mov    $0x0,%eax
    1d25:	eb 0c                	jmp    1d33 <GetLevel+0x42>
    case '#':
        return -2;
    1d27:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1d2c:	eb 05                	jmp    1d33 <GetLevel+0x42>
    };
    return -1;
    1d2e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1d33:	c9                   	leave  
    1d34:	c3                   	ret    

00001d35 <Operate>:

double Operate(double a1, char op, double a2)
{
    1d35:	55                   	push   %ebp
    1d36:	89 e5                	mov    %esp,%ebp
    1d38:	83 ec 28             	sub    $0x28,%esp
    1d3b:	8b 45 10             	mov    0x10(%ebp),%eax
    1d3e:	8b 55 08             	mov    0x8(%ebp),%edx
    1d41:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1d44:	8b 55 0c             	mov    0xc(%ebp),%edx
    1d47:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1d4a:	88 45 ec             	mov    %al,-0x14(%ebp)
    1d4d:	8b 45 14             	mov    0x14(%ebp),%eax
    1d50:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1d53:	8b 45 18             	mov    0x18(%ebp),%eax
    1d56:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1d59:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1d5d:	83 f8 2b             	cmp    $0x2b,%eax
    1d60:	74 18                	je     1d7a <Operate+0x45>
    1d62:	83 f8 2b             	cmp    $0x2b,%eax
    1d65:	7f 07                	jg     1d6e <Operate+0x39>
    1d67:	83 f8 2a             	cmp    $0x2a,%eax
    1d6a:	74 1e                	je     1d8a <Operate+0x55>
    1d6c:	eb 68                	jmp    1dd6 <Operate+0xa1>
    1d6e:	83 f8 2d             	cmp    $0x2d,%eax
    1d71:	74 0f                	je     1d82 <Operate+0x4d>
    1d73:	83 f8 2f             	cmp    $0x2f,%eax
    1d76:	74 1a                	je     1d92 <Operate+0x5d>
    1d78:	eb 5c                	jmp    1dd6 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1d7a:	dd 45 f0             	fldl   -0x10(%ebp)
    1d7d:	dc 45 e0             	faddl  -0x20(%ebp)
    1d80:	eb 56                	jmp    1dd8 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1d82:	dd 45 f0             	fldl   -0x10(%ebp)
    1d85:	dc 65 e0             	fsubl  -0x20(%ebp)
    1d88:	eb 4e                	jmp    1dd8 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1d8a:	dd 45 f0             	fldl   -0x10(%ebp)
    1d8d:	dc 4d e0             	fmull  -0x20(%ebp)
    1d90:	eb 46                	jmp    1dd8 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1d92:	d9 ee                	fldz   
    1d94:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1d98:	dd 1c 24             	fstpl  (%esp)
    1d9b:	ff 75 e4             	pushl  -0x1c(%ebp)
    1d9e:	ff 75 e0             	pushl  -0x20(%ebp)
    1da1:	e8 bd f3 ff ff       	call   1163 <isEqual>
    1da6:	83 c4 10             	add    $0x10,%esp
    1da9:	83 f8 01             	cmp    $0x1,%eax
    1dac:	75 20                	jne    1dce <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1dae:	83 ec 0c             	sub    $0xc,%esp
    1db1:	68 3c 3a 00 00       	push   $0x3a3c
    1db6:	6a 00                	push   $0x0
    1db8:	6a 00                	push   $0x0
    1dba:	6a 01                	push   $0x1
    1dbc:	6a 04                	push   $0x4
    1dbe:	e8 ca 10 00 00       	call   2e8d <color_printf>
    1dc3:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1dc6:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    1dcc:	eb 0a                	jmp    1dd8 <Operate+0xa3>
        }
        else
          return a1 / a2;
    1dce:	dd 45 f0             	fldl   -0x10(%ebp)
    1dd1:	dc 75 e0             	fdivl  -0x20(%ebp)
    1dd4:	eb 02                	jmp    1dd8 <Operate+0xa3>
    };
    return 1;
    1dd6:	d9 e8                	fld1   
}
    1dd8:	c9                   	leave  
    1dd9:	c3                   	ret    

00001dda <Compute>:

double Compute(char *s)
{
    1dda:	55                   	push   %ebp
    1ddb:	89 e5                	mov    %esp,%ebp
    1ddd:	53                   	push   %ebx
    1dde:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1de4:	e8 44 14 00 00       	call   322d <dstack>
    1de9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1dec:	e8 73 13 00 00       	call   3164 <cstack>
    1df1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1df4:	83 ec 08             	sub    $0x8,%esp
    1df7:	6a 23                	push   $0x23
    1df9:	ff 75 e0             	pushl  -0x20(%ebp)
    1dfc:	e8 91 13 00 00       	call   3192 <pushc>
    1e01:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1e04:	83 ec 0c             	sub    $0xc,%esp
    1e07:	ff 75 08             	pushl  0x8(%ebp)
    1e0a:	e8 e8 e4 ff ff       	call   2f7 <strlen>
    1e0f:	83 c4 10             	add    $0x10,%esp
    1e12:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1e15:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1e1c:	c7 05 20 46 00 00 00 	movl   $0x0,0x4620
    1e23:	00 00 00 
    1e26:	e9 58 05 00 00       	jmp    2383 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1e2b:	a1 20 46 00 00       	mov    0x4620,%eax
    1e30:	89 c2                	mov    %eax,%edx
    1e32:	8b 45 08             	mov    0x8(%ebp),%eax
    1e35:	01 d0                	add    %edx,%eax
    1e37:	0f b6 00             	movzbl (%eax),%eax
    1e3a:	3c 24                	cmp    $0x24,%al
    1e3c:	0f 85 f8 01 00 00    	jne    203a <Compute+0x260>
        {
          is_minus = 0;
    1e42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1e49:	a1 20 46 00 00       	mov    0x4620,%eax
    1e4e:	83 c0 01             	add    $0x1,%eax
    1e51:	a3 20 46 00 00       	mov    %eax,0x4620
          if(s[g_pos] != '{')
    1e56:	a1 20 46 00 00       	mov    0x4620,%eax
    1e5b:	89 c2                	mov    %eax,%edx
    1e5d:	8b 45 08             	mov    0x8(%ebp),%eax
    1e60:	01 d0                	add    %edx,%eax
    1e62:	0f b6 00             	movzbl (%eax),%eax
    1e65:	3c 7b                	cmp    $0x7b,%al
    1e67:	74 23                	je     1e8c <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1e69:	83 ec 0c             	sub    $0xc,%esp
    1e6c:	68 54 3a 00 00       	push   $0x3a54
    1e71:	6a 00                	push   $0x0
    1e73:	6a 00                	push   $0x0
    1e75:	6a 01                	push   $0x1
    1e77:	6a 04                	push   $0x4
    1e79:	e8 0f 10 00 00       	call   2e8d <color_printf>
    1e7e:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1e81:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    1e87:	e9 24 06 00 00       	jmp    24b0 <Compute+0x6d6>
          }
          int i=g_pos+1;
    1e8c:	a1 20 46 00 00       	mov    0x4620,%eax
    1e91:	83 c0 01             	add    $0x1,%eax
    1e94:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1e97:	eb 13                	jmp    1eac <Compute+0xd2>
          {
            if(s[i] == '}')
    1e99:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1e9c:	8b 45 08             	mov    0x8(%ebp),%eax
    1e9f:	01 d0                	add    %edx,%eax
    1ea1:	0f b6 00             	movzbl (%eax),%eax
    1ea4:	3c 7d                	cmp    $0x7d,%al
    1ea6:	74 0e                	je     1eb6 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1ea8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1eac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1eaf:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1eb2:	7c e5                	jl     1e99 <Compute+0xbf>
    1eb4:	eb 01                	jmp    1eb7 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1eb6:	90                   	nop
          }
          if(s[i] != '}')
    1eb7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1eba:	8b 45 08             	mov    0x8(%ebp),%eax
    1ebd:	01 d0                	add    %edx,%eax
    1ebf:	0f b6 00             	movzbl (%eax),%eax
    1ec2:	3c 7d                	cmp    $0x7d,%al
    1ec4:	74 23                	je     1ee9 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1ec6:	83 ec 0c             	sub    $0xc,%esp
    1ec9:	68 62 3a 00 00       	push   $0x3a62
    1ece:	6a 00                	push   $0x0
    1ed0:	6a 00                	push   $0x0
    1ed2:	6a 01                	push   $0x1
    1ed4:	6a 04                	push   $0x4
    1ed6:	e8 b2 0f 00 00       	call   2e8d <color_printf>
    1edb:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1ede:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    1ee4:	e9 c7 05 00 00       	jmp    24b0 <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1ee9:	a1 20 46 00 00       	mov    0x4620,%eax
    1eee:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1ef1:	29 c2                	sub    %eax,%edx
    1ef3:	89 d0                	mov    %edx,%eax
    1ef5:	83 e8 01             	sub    $0x1,%eax
    1ef8:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1efb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1f02:	eb 27                	jmp    1f2b <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1f04:	8b 15 20 46 00 00    	mov    0x4620,%edx
    1f0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1f0d:	01 d0                	add    %edx,%eax
    1f0f:	8d 50 01             	lea    0x1(%eax),%edx
    1f12:	8b 45 08             	mov    0x8(%ebp),%eax
    1f15:	01 d0                	add    %edx,%eax
    1f17:	0f b6 00             	movzbl (%eax),%eax
    1f1a:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    1f20:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1f23:	01 ca                	add    %ecx,%edx
    1f25:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    1f27:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1f2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1f2e:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    1f31:	7c d1                	jl     1f04 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    1f33:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    1f39:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1f3c:	01 d0                	add    %edx,%eax
    1f3e:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    1f41:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    1f48:	a1 0c 46 00 00       	mov    0x460c,%eax
    1f4d:	85 c0                	test   %eax,%eax
    1f4f:	75 40                	jne    1f91 <Compute+0x1b7>
            readVariables(variables,&v_num);
    1f51:	83 ec 08             	sub    $0x8,%esp
    1f54:	68 0c 46 00 00       	push   $0x460c
    1f59:	68 40 46 00 00       	push   $0x4640
    1f5e:	e8 b0 13 00 00       	call   3313 <readVariables>
    1f63:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    1f66:	eb 29                	jmp    1f91 <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    1f68:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f6b:	c1 e0 05             	shl    $0x5,%eax
    1f6e:	05 40 46 00 00       	add    $0x4640,%eax
    1f73:	8d 50 04             	lea    0x4(%eax),%edx
    1f76:	83 ec 08             	sub    $0x8,%esp
    1f79:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1f7f:	50                   	push   %eax
    1f80:	52                   	push   %edx
    1f81:	e8 32 e3 ff ff       	call   2b8 <strcmp>
    1f86:	83 c4 10             	add    $0x10,%esp
    1f89:	85 c0                	test   %eax,%eax
    1f8b:	74 10                	je     1f9d <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    1f8d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1f91:	a1 0c 46 00 00       	mov    0x460c,%eax
    1f96:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1f99:	7c cd                	jl     1f68 <Compute+0x18e>
    1f9b:	eb 01                	jmp    1f9e <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    1f9d:	90                   	nop
          }
          if(index == v_num) //no such variable
    1f9e:	a1 0c 46 00 00       	mov    0x460c,%eax
    1fa3:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    1fa6:	75 2a                	jne    1fd2 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    1fa8:	83 ec 08             	sub    $0x8,%esp
    1fab:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    1fb1:	50                   	push   %eax
    1fb2:	68 70 3a 00 00       	push   $0x3a70
    1fb7:	6a 00                	push   $0x0
    1fb9:	6a 00                	push   $0x0
    1fbb:	6a 01                	push   $0x1
    1fbd:	6a 04                	push   $0x4
    1fbf:	e8 c9 0e 00 00       	call   2e8d <color_printf>
    1fc4:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1fc7:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    1fcd:	e9 de 04 00 00       	jmp    24b0 <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    1fd2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1fd5:	c1 e0 05             	shl    $0x5,%eax
    1fd8:	05 40 46 00 00       	add    $0x4640,%eax
    1fdd:	8b 00                	mov    (%eax),%eax
    1fdf:	83 f8 02             	cmp    $0x2,%eax
    1fe2:	75 23                	jne    2007 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    1fe4:	83 ec 0c             	sub    $0xc,%esp
    1fe7:	68 8a 3a 00 00       	push   $0x3a8a
    1fec:	6a 00                	push   $0x0
    1fee:	6a 00                	push   $0x0
    1ff0:	6a 01                	push   $0x1
    1ff2:	6a 04                	push   $0x4
    1ff4:	e8 94 0e 00 00       	call   2e8d <color_printf>
    1ff9:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1ffc:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    2002:	e9 a9 04 00 00       	jmp    24b0 <Compute+0x6d6>
          }
          g_pos = i+1;
    2007:	8b 45 f0             	mov    -0x10(%ebp),%eax
    200a:	83 c0 01             	add    $0x1,%eax
    200d:	a3 20 46 00 00       	mov    %eax,0x4620
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    2012:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2015:	c1 e0 05             	shl    $0x5,%eax
    2018:	05 50 46 00 00       	add    $0x4650,%eax
    201d:	dd 40 08             	fldl   0x8(%eax)
    2020:	83 ec 04             	sub    $0x4,%esp
    2023:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2027:	dd 1c 24             	fstpl  (%esp)
    202a:	ff 75 e4             	pushl  -0x1c(%ebp)
    202d:	e8 2f 12 00 00       	call   3261 <pushd>
    2032:	83 c4 10             	add    $0x10,%esp
    2035:	e9 49 03 00 00       	jmp    2383 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    203a:	a1 20 46 00 00       	mov    0x4620,%eax
    203f:	89 c2                	mov    %eax,%edx
    2041:	8b 45 08             	mov    0x8(%ebp),%eax
    2044:	01 d0                	add    %edx,%eax
    2046:	0f b6 00             	movzbl (%eax),%eax
    2049:	3c 2d                	cmp    $0x2d,%al
    204b:	75 3f                	jne    208c <Compute+0x2b2>
    204d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2051:	74 39                	je     208c <Compute+0x2b2>
        {
            pushd(opnd,0);
    2053:	83 ec 04             	sub    $0x4,%esp
    2056:	d9 ee                	fldz   
    2058:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    205c:	dd 1c 24             	fstpl  (%esp)
    205f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2062:	e8 fa 11 00 00       	call   3261 <pushd>
    2067:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    206a:	83 ec 08             	sub    $0x8,%esp
    206d:	6a 2d                	push   $0x2d
    206f:	ff 75 e0             	pushl  -0x20(%ebp)
    2072:	e8 1b 11 00 00       	call   3192 <pushc>
    2077:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    207a:	a1 20 46 00 00       	mov    0x4620,%eax
    207f:	83 c0 01             	add    $0x1,%eax
    2082:	a3 20 46 00 00       	mov    %eax,0x4620
    2087:	e9 f7 02 00 00       	jmp    2383 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    208c:	a1 20 46 00 00       	mov    0x4620,%eax
    2091:	89 c2                	mov    %eax,%edx
    2093:	8b 45 08             	mov    0x8(%ebp),%eax
    2096:	01 d0                	add    %edx,%eax
    2098:	0f b6 00             	movzbl (%eax),%eax
    209b:	3c 29                	cmp    $0x29,%al
    209d:	0f 85 01 01 00 00    	jne    21a4 <Compute+0x3ca>
        {
            is_minus = 0;
    20a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    20aa:	a1 20 46 00 00       	mov    0x4620,%eax
    20af:	83 c0 01             	add    $0x1,%eax
    20b2:	a3 20 46 00 00       	mov    %eax,0x4620
            while (topc(optr) != '(')
    20b7:	e9 bf 00 00 00       	jmp    217b <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    20bc:	83 ec 0c             	sub    $0xc,%esp
    20bf:	ff 75 e4             	pushl  -0x1c(%ebp)
    20c2:	e8 37 12 00 00       	call   32fe <topd>
    20c7:	83 c4 10             	add    $0x10,%esp
    20ca:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    20cd:	83 ec 0c             	sub    $0xc,%esp
    20d0:	ff 75 e4             	pushl  -0x1c(%ebp)
    20d3:	e8 dd 11 00 00       	call   32b5 <popd>
    20d8:	dd d8                	fstp   %st(0)
    20da:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    20dd:	83 ec 0c             	sub    $0xc,%esp
    20e0:	ff 75 e4             	pushl  -0x1c(%ebp)
    20e3:	e8 16 12 00 00       	call   32fe <topd>
    20e8:	83 c4 10             	add    $0x10,%esp
    20eb:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    20ee:	83 ec 0c             	sub    $0xc,%esp
    20f1:	ff 75 e4             	pushl  -0x1c(%ebp)
    20f4:	e8 bc 11 00 00       	call   32b5 <popd>
    20f9:	dd d8                	fstp   %st(0)
    20fb:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    20fe:	83 ec 0c             	sub    $0xc,%esp
    2101:	ff 75 e0             	pushl  -0x20(%ebp)
    2104:	e8 11 11 00 00       	call   321a <topc>
    2109:	83 c4 10             	add    $0x10,%esp
    210c:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    210f:	83 ec 0c             	sub    $0xc,%esp
    2112:	ff 75 e0             	pushl  -0x20(%ebp)
    2115:	e8 be 10 00 00       	call   31d8 <popc>
    211a:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    211d:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    2121:	83 ec 0c             	sub    $0xc,%esp
    2124:	ff 75 d4             	pushl  -0x2c(%ebp)
    2127:	ff 75 d0             	pushl  -0x30(%ebp)
    212a:	50                   	push   %eax
    212b:	ff 75 cc             	pushl  -0x34(%ebp)
    212e:	ff 75 c8             	pushl  -0x38(%ebp)
    2131:	e8 ff fb ff ff       	call   1d35 <Operate>
    2136:	83 c4 20             	add    $0x20,%esp
    2139:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    213c:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    2142:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2146:	dd 1c 24             	fstpl  (%esp)
    2149:	ff 75 bc             	pushl  -0x44(%ebp)
    214c:	ff 75 b8             	pushl  -0x48(%ebp)
    214f:	e8 0f f0 ff ff       	call   1163 <isEqual>
    2154:	83 c4 10             	add    $0x10,%esp
    2157:	83 f8 01             	cmp    $0x1,%eax
    215a:	75 0b                	jne    2167 <Compute+0x38d>
                  return WRONG_ANS;
    215c:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    2162:	e9 49 03 00 00       	jmp    24b0 <Compute+0x6d6>
                pushd(opnd,result);
    2167:	83 ec 04             	sub    $0x4,%esp
    216a:	ff 75 bc             	pushl  -0x44(%ebp)
    216d:	ff 75 b8             	pushl  -0x48(%ebp)
    2170:	ff 75 e4             	pushl  -0x1c(%ebp)
    2173:	e8 e9 10 00 00       	call   3261 <pushd>
    2178:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    217b:	83 ec 0c             	sub    $0xc,%esp
    217e:	ff 75 e0             	pushl  -0x20(%ebp)
    2181:	e8 94 10 00 00       	call   321a <topc>
    2186:	83 c4 10             	add    $0x10,%esp
    2189:	3c 28                	cmp    $0x28,%al
    218b:	0f 85 2b ff ff ff    	jne    20bc <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    2191:	83 ec 0c             	sub    $0xc,%esp
    2194:	ff 75 e0             	pushl  -0x20(%ebp)
    2197:	e8 3c 10 00 00       	call   31d8 <popc>
    219c:	83 c4 10             	add    $0x10,%esp
    219f:	e9 df 01 00 00       	jmp    2383 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    21a4:	a1 20 46 00 00       	mov    0x4620,%eax
    21a9:	89 c2                	mov    %eax,%edx
    21ab:	8b 45 08             	mov    0x8(%ebp),%eax
    21ae:	01 d0                	add    %edx,%eax
    21b0:	0f b6 00             	movzbl (%eax),%eax
    21b3:	3c 2f                	cmp    $0x2f,%al
    21b5:	7e 49                	jle    2200 <Compute+0x426>
    21b7:	a1 20 46 00 00       	mov    0x4620,%eax
    21bc:	89 c2                	mov    %eax,%edx
    21be:	8b 45 08             	mov    0x8(%ebp),%eax
    21c1:	01 d0                	add    %edx,%eax
    21c3:	0f b6 00             	movzbl (%eax),%eax
    21c6:	3c 39                	cmp    $0x39,%al
    21c8:	7f 36                	jg     2200 <Compute+0x426>
        {
            is_minus = 0;
    21ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    21d1:	83 ec 08             	sub    $0x8,%esp
    21d4:	68 20 46 00 00       	push   $0x4620
    21d9:	ff 75 08             	pushl  0x8(%ebp)
    21dc:	e8 c3 eb ff ff       	call   da4 <Translation>
    21e1:	83 c4 10             	add    $0x10,%esp
    21e4:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    21e7:	83 ec 04             	sub    $0x4,%esp
    21ea:	ff 75 b4             	pushl  -0x4c(%ebp)
    21ed:	ff 75 b0             	pushl  -0x50(%ebp)
    21f0:	ff 75 e4             	pushl  -0x1c(%ebp)
    21f3:	e8 69 10 00 00       	call   3261 <pushd>
    21f8:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    21fb:	e9 83 01 00 00       	jmp    2383 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    2200:	a1 20 46 00 00       	mov    0x4620,%eax
    2205:	89 c2                	mov    %eax,%edx
    2207:	8b 45 08             	mov    0x8(%ebp),%eax
    220a:	01 d0                	add    %edx,%eax
    220c:	0f b6 00             	movzbl (%eax),%eax
    220f:	3c 28                	cmp    $0x28,%al
    2211:	0f 85 f9 00 00 00    	jne    2310 <Compute+0x536>
        {
            is_minus = 1;
    2217:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    221e:	a1 20 46 00 00       	mov    0x4620,%eax
    2223:	89 c2                	mov    %eax,%edx
    2225:	8b 45 08             	mov    0x8(%ebp),%eax
    2228:	01 d0                	add    %edx,%eax
    222a:	0f b6 00             	movzbl (%eax),%eax
    222d:	0f be c0             	movsbl %al,%eax
    2230:	83 ec 08             	sub    $0x8,%esp
    2233:	50                   	push   %eax
    2234:	ff 75 e0             	pushl  -0x20(%ebp)
    2237:	e8 56 0f 00 00       	call   3192 <pushc>
    223c:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    223f:	a1 20 46 00 00       	mov    0x4620,%eax
    2244:	83 c0 01             	add    $0x1,%eax
    2247:	a3 20 46 00 00       	mov    %eax,0x4620
    224c:	e9 32 01 00 00       	jmp    2383 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    2251:	83 ec 0c             	sub    $0xc,%esp
    2254:	ff 75 e4             	pushl  -0x1c(%ebp)
    2257:	e8 a2 10 00 00       	call   32fe <topd>
    225c:	83 c4 10             	add    $0x10,%esp
    225f:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    2262:	83 ec 0c             	sub    $0xc,%esp
    2265:	ff 75 e4             	pushl  -0x1c(%ebp)
    2268:	e8 48 10 00 00       	call   32b5 <popd>
    226d:	dd d8                	fstp   %st(0)
    226f:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2272:	83 ec 0c             	sub    $0xc,%esp
    2275:	ff 75 e4             	pushl  -0x1c(%ebp)
    2278:	e8 81 10 00 00       	call   32fe <topd>
    227d:	83 c4 10             	add    $0x10,%esp
    2280:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    2283:	83 ec 0c             	sub    $0xc,%esp
    2286:	ff 75 e4             	pushl  -0x1c(%ebp)
    2289:	e8 27 10 00 00       	call   32b5 <popd>
    228e:	dd d8                	fstp   %st(0)
    2290:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    2293:	83 ec 0c             	sub    $0xc,%esp
    2296:	ff 75 e0             	pushl  -0x20(%ebp)
    2299:	e8 7c 0f 00 00       	call   321a <topc>
    229e:	83 c4 10             	add    $0x10,%esp
    22a1:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    22a4:	83 ec 0c             	sub    $0xc,%esp
    22a7:	ff 75 e0             	pushl  -0x20(%ebp)
    22aa:	e8 29 0f 00 00       	call   31d8 <popc>
    22af:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    22b2:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    22b6:	83 ec 0c             	sub    $0xc,%esp
    22b9:	ff 75 ac             	pushl  -0x54(%ebp)
    22bc:	ff 75 a8             	pushl  -0x58(%ebp)
    22bf:	50                   	push   %eax
    22c0:	ff 75 a4             	pushl  -0x5c(%ebp)
    22c3:	ff 75 a0             	pushl  -0x60(%ebp)
    22c6:	e8 6a fa ff ff       	call   1d35 <Operate>
    22cb:	83 c4 20             	add    $0x20,%esp
    22ce:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    22d1:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    22d7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    22db:	dd 1c 24             	fstpl  (%esp)
    22de:	ff 75 94             	pushl  -0x6c(%ebp)
    22e1:	ff 75 90             	pushl  -0x70(%ebp)
    22e4:	e8 7a ee ff ff       	call   1163 <isEqual>
    22e9:	83 c4 10             	add    $0x10,%esp
    22ec:	83 f8 01             	cmp    $0x1,%eax
    22ef:	75 0b                	jne    22fc <Compute+0x522>
                  return WRONG_ANS;
    22f1:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    22f7:	e9 b4 01 00 00       	jmp    24b0 <Compute+0x6d6>
                pushd(opnd,result);
    22fc:	83 ec 04             	sub    $0x4,%esp
    22ff:	ff 75 94             	pushl  -0x6c(%ebp)
    2302:	ff 75 90             	pushl  -0x70(%ebp)
    2305:	ff 75 e4             	pushl  -0x1c(%ebp)
    2308:	e8 54 0f 00 00       	call   3261 <pushd>
    230d:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    2310:	a1 20 46 00 00       	mov    0x4620,%eax
    2315:	89 c2                	mov    %eax,%edx
    2317:	8b 45 08             	mov    0x8(%ebp),%eax
    231a:	01 d0                	add    %edx,%eax
    231c:	0f b6 00             	movzbl (%eax),%eax
    231f:	0f be c0             	movsbl %al,%eax
    2322:	83 ec 0c             	sub    $0xc,%esp
    2325:	50                   	push   %eax
    2326:	e8 c6 f9 ff ff       	call   1cf1 <GetLevel>
    232b:	83 c4 10             	add    $0x10,%esp
    232e:	89 c3                	mov    %eax,%ebx
    2330:	83 ec 0c             	sub    $0xc,%esp
    2333:	ff 75 e0             	pushl  -0x20(%ebp)
    2336:	e8 df 0e 00 00       	call   321a <topc>
    233b:	83 c4 10             	add    $0x10,%esp
    233e:	0f be c0             	movsbl %al,%eax
    2341:	83 ec 0c             	sub    $0xc,%esp
    2344:	50                   	push   %eax
    2345:	e8 a7 f9 ff ff       	call   1cf1 <GetLevel>
    234a:	83 c4 10             	add    $0x10,%esp
    234d:	39 c3                	cmp    %eax,%ebx
    234f:	0f 8e fc fe ff ff    	jle    2251 <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    2355:	a1 20 46 00 00       	mov    0x4620,%eax
    235a:	89 c2                	mov    %eax,%edx
    235c:	8b 45 08             	mov    0x8(%ebp),%eax
    235f:	01 d0                	add    %edx,%eax
    2361:	0f b6 00             	movzbl (%eax),%eax
    2364:	0f be c0             	movsbl %al,%eax
    2367:	83 ec 08             	sub    $0x8,%esp
    236a:	50                   	push   %eax
    236b:	ff 75 e0             	pushl  -0x20(%ebp)
    236e:	e8 1f 0e 00 00       	call   3192 <pushc>
    2373:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2376:	a1 20 46 00 00       	mov    0x4620,%eax
    237b:	83 c0 01             	add    $0x1,%eax
    237e:	a3 20 46 00 00       	mov    %eax,0x4620
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    2383:	a1 20 46 00 00       	mov    0x4620,%eax
    2388:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    238b:	0f 8c 9a fa ff ff    	jl     1e2b <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2391:	e9 da 00 00 00       	jmp    2470 <Compute+0x696>
    {
        double a2 = topd(opnd);
    2396:	83 ec 0c             	sub    $0xc,%esp
    2399:	ff 75 e4             	pushl  -0x1c(%ebp)
    239c:	e8 5d 0f 00 00       	call   32fe <topd>
    23a1:	83 c4 10             	add    $0x10,%esp
    23a4:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    23a7:	83 ec 0c             	sub    $0xc,%esp
    23aa:	ff 75 e4             	pushl  -0x1c(%ebp)
    23ad:	e8 03 0f 00 00       	call   32b5 <popd>
    23b2:	dd d8                	fstp   %st(0)
    23b4:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    23b7:	83 ec 0c             	sub    $0xc,%esp
    23ba:	ff 75 e4             	pushl  -0x1c(%ebp)
    23bd:	e8 3c 0f 00 00       	call   32fe <topd>
    23c2:	83 c4 10             	add    $0x10,%esp
    23c5:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    23cb:	83 ec 0c             	sub    $0xc,%esp
    23ce:	ff 75 e4             	pushl  -0x1c(%ebp)
    23d1:	e8 df 0e 00 00       	call   32b5 <popd>
    23d6:	dd d8                	fstp   %st(0)
    23d8:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    23db:	83 ec 0c             	sub    $0xc,%esp
    23de:	ff 75 e0             	pushl  -0x20(%ebp)
    23e1:	e8 34 0e 00 00       	call   321a <topc>
    23e6:	83 c4 10             	add    $0x10,%esp
    23e9:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    23ef:	83 ec 0c             	sub    $0xc,%esp
    23f2:	ff 75 e0             	pushl  -0x20(%ebp)
    23f5:	e8 de 0d 00 00       	call   31d8 <popc>
    23fa:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    23fd:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    2404:	83 ec 0c             	sub    $0xc,%esp
    2407:	ff 75 84             	pushl  -0x7c(%ebp)
    240a:	ff 75 80             	pushl  -0x80(%ebp)
    240d:	50                   	push   %eax
    240e:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    2414:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    241a:	e8 16 f9 ff ff       	call   1d35 <Operate>
    241f:	83 c4 20             	add    $0x20,%esp
    2422:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    2428:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    242e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2432:	dd 1c 24             	fstpl  (%esp)
    2435:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    243b:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2441:	e8 1d ed ff ff       	call   1163 <isEqual>
    2446:	83 c4 10             	add    $0x10,%esp
    2449:	83 f8 01             	cmp    $0x1,%eax
    244c:	75 08                	jne    2456 <Compute+0x67c>
          return WRONG_ANS;
    244e:	dd 05 b0 3a 00 00    	fldl   0x3ab0
    2454:	eb 5a                	jmp    24b0 <Compute+0x6d6>
        pushd(opnd,result);
    2456:	83 ec 04             	sub    $0x4,%esp
    2459:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    245f:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2465:	ff 75 e4             	pushl  -0x1c(%ebp)
    2468:	e8 f4 0d 00 00       	call   3261 <pushd>
    246d:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2470:	83 ec 0c             	sub    $0xc,%esp
    2473:	ff 75 e0             	pushl  -0x20(%ebp)
    2476:	e8 9f 0d 00 00       	call   321a <topc>
    247b:	83 c4 10             	add    $0x10,%esp
    247e:	3c 23                	cmp    $0x23,%al
    2480:	0f 85 10 ff ff ff    	jne    2396 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    2486:	83 ec 0c             	sub    $0xc,%esp
    2489:	ff 75 e4             	pushl  -0x1c(%ebp)
    248c:	e8 94 e4 ff ff       	call   925 <free>
    2491:	83 c4 10             	add    $0x10,%esp
    free(optr);
    2494:	83 ec 0c             	sub    $0xc,%esp
    2497:	ff 75 e0             	pushl  -0x20(%ebp)
    249a:	e8 86 e4 ff ff       	call   925 <free>
    249f:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    24a2:	83 ec 0c             	sub    $0xc,%esp
    24a5:	ff 75 e4             	pushl  -0x1c(%ebp)
    24a8:	e8 51 0e 00 00       	call   32fe <topd>
    24ad:	83 c4 10             	add    $0x10,%esp
}
    24b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    24b3:	c9                   	leave  
    24b4:	c3                   	ret    

000024b5 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    24b5:	55                   	push   %ebp
    24b6:	89 e5                	mov    %esp,%ebp
    24b8:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    24bb:	8b 45 08             	mov    0x8(%ebp),%eax
    24be:	8b 00                	mov    (%eax),%eax
    24c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    24c3:	eb 04                	jmp    24c9 <gettoken+0x14>
    s++;
    24c5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    24c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24cc:	3b 45 0c             	cmp    0xc(%ebp),%eax
    24cf:	73 1e                	jae    24ef <gettoken+0x3a>
    24d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24d4:	0f b6 00             	movzbl (%eax),%eax
    24d7:	0f be c0             	movsbl %al,%eax
    24da:	83 ec 08             	sub    $0x8,%esp
    24dd:	50                   	push   %eax
    24de:	68 d4 45 00 00       	push   $0x45d4
    24e3:	e8 50 de ff ff       	call   338 <strchr>
    24e8:	83 c4 10             	add    $0x10,%esp
    24eb:	85 c0                	test   %eax,%eax
    24ed:	75 d6                	jne    24c5 <gettoken+0x10>
    s++;
  if(q)
    24ef:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    24f3:	74 08                	je     24fd <gettoken+0x48>
    *q = s;
    24f5:	8b 45 10             	mov    0x10(%ebp),%eax
    24f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    24fb:	89 10                	mov    %edx,(%eax)
  ret = *s;
    24fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2500:	0f b6 00             	movzbl (%eax),%eax
    2503:	0f be c0             	movsbl %al,%eax
    2506:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    2509:	8b 45 f4             	mov    -0xc(%ebp),%eax
    250c:	0f b6 00             	movzbl (%eax),%eax
    250f:	0f be c0             	movsbl %al,%eax
    2512:	83 f8 29             	cmp    $0x29,%eax
    2515:	7f 14                	jg     252b <gettoken+0x76>
    2517:	83 f8 28             	cmp    $0x28,%eax
    251a:	7d 28                	jge    2544 <gettoken+0x8f>
    251c:	85 c0                	test   %eax,%eax
    251e:	0f 84 94 00 00 00    	je     25b8 <gettoken+0x103>
    2524:	83 f8 26             	cmp    $0x26,%eax
    2527:	74 1b                	je     2544 <gettoken+0x8f>
    2529:	eb 3a                	jmp    2565 <gettoken+0xb0>
    252b:	83 f8 3e             	cmp    $0x3e,%eax
    252e:	74 1a                	je     254a <gettoken+0x95>
    2530:	83 f8 3e             	cmp    $0x3e,%eax
    2533:	7f 0a                	jg     253f <gettoken+0x8a>
    2535:	83 e8 3b             	sub    $0x3b,%eax
    2538:	83 f8 01             	cmp    $0x1,%eax
    253b:	77 28                	ja     2565 <gettoken+0xb0>
    253d:	eb 05                	jmp    2544 <gettoken+0x8f>
    253f:	83 f8 7c             	cmp    $0x7c,%eax
    2542:	75 21                	jne    2565 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    2544:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    2548:	eb 75                	jmp    25bf <gettoken+0x10a>
  case '>':
    s++;
    254a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    254e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2551:	0f b6 00             	movzbl (%eax),%eax
    2554:	3c 3e                	cmp    $0x3e,%al
    2556:	75 63                	jne    25bb <gettoken+0x106>
      ret = '+';
    2558:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    255f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    2563:	eb 56                	jmp    25bb <gettoken+0x106>
  default:
    ret = 'a';
    2565:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    256c:	eb 04                	jmp    2572 <gettoken+0xbd>
      s++;
    256e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2572:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2575:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2578:	73 44                	jae    25be <gettoken+0x109>
    257a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    257d:	0f b6 00             	movzbl (%eax),%eax
    2580:	0f be c0             	movsbl %al,%eax
    2583:	83 ec 08             	sub    $0x8,%esp
    2586:	50                   	push   %eax
    2587:	68 d4 45 00 00       	push   $0x45d4
    258c:	e8 a7 dd ff ff       	call   338 <strchr>
    2591:	83 c4 10             	add    $0x10,%esp
    2594:	85 c0                	test   %eax,%eax
    2596:	75 26                	jne    25be <gettoken+0x109>
    2598:	8b 45 f4             	mov    -0xc(%ebp),%eax
    259b:	0f b6 00             	movzbl (%eax),%eax
    259e:	0f be c0             	movsbl %al,%eax
    25a1:	83 ec 08             	sub    $0x8,%esp
    25a4:	50                   	push   %eax
    25a5:	68 dc 45 00 00       	push   $0x45dc
    25aa:	e8 89 dd ff ff       	call   338 <strchr>
    25af:	83 c4 10             	add    $0x10,%esp
    25b2:	85 c0                	test   %eax,%eax
    25b4:	74 b8                	je     256e <gettoken+0xb9>
      s++;
    break;
    25b6:	eb 06                	jmp    25be <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    25b8:	90                   	nop
    25b9:	eb 04                	jmp    25bf <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    25bb:	90                   	nop
    25bc:	eb 01                	jmp    25bf <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    25be:	90                   	nop
  }
  if(eq)
    25bf:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    25c3:	74 0e                	je     25d3 <gettoken+0x11e>
    *eq = s;
    25c5:	8b 45 14             	mov    0x14(%ebp),%eax
    25c8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    25cb:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    25cd:	eb 04                	jmp    25d3 <gettoken+0x11e>
    s++;
    25cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    25d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
    25d9:	73 1e                	jae    25f9 <gettoken+0x144>
    25db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25de:	0f b6 00             	movzbl (%eax),%eax
    25e1:	0f be c0             	movsbl %al,%eax
    25e4:	83 ec 08             	sub    $0x8,%esp
    25e7:	50                   	push   %eax
    25e8:	68 d4 45 00 00       	push   $0x45d4
    25ed:	e8 46 dd ff ff       	call   338 <strchr>
    25f2:	83 c4 10             	add    $0x10,%esp
    25f5:	85 c0                	test   %eax,%eax
    25f7:	75 d6                	jne    25cf <gettoken+0x11a>
    s++;
  *ps = s;
    25f9:	8b 45 08             	mov    0x8(%ebp),%eax
    25fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    25ff:	89 10                	mov    %edx,(%eax)
  return ret;
    2601:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2604:	c9                   	leave  
    2605:	c3                   	ret    

00002606 <peek>:

int peek(char **ps, char *es, char *toks)
{
    2606:	55                   	push   %ebp
    2607:	89 e5                	mov    %esp,%ebp
    2609:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    260c:	8b 45 08             	mov    0x8(%ebp),%eax
    260f:	8b 00                	mov    (%eax),%eax
    2611:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2614:	eb 04                	jmp    261a <peek+0x14>
    s++;
    2616:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    261a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    261d:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2620:	73 1e                	jae    2640 <peek+0x3a>
    2622:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2625:	0f b6 00             	movzbl (%eax),%eax
    2628:	0f be c0             	movsbl %al,%eax
    262b:	83 ec 08             	sub    $0x8,%esp
    262e:	50                   	push   %eax
    262f:	68 d4 45 00 00       	push   $0x45d4
    2634:	e8 ff dc ff ff       	call   338 <strchr>
    2639:	83 c4 10             	add    $0x10,%esp
    263c:	85 c0                	test   %eax,%eax
    263e:	75 d6                	jne    2616 <peek+0x10>
    s++;
  *ps = s;
    2640:	8b 45 08             	mov    0x8(%ebp),%eax
    2643:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2646:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    2648:	8b 45 f4             	mov    -0xc(%ebp),%eax
    264b:	0f b6 00             	movzbl (%eax),%eax
    264e:	84 c0                	test   %al,%al
    2650:	74 23                	je     2675 <peek+0x6f>
    2652:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2655:	0f b6 00             	movzbl (%eax),%eax
    2658:	0f be c0             	movsbl %al,%eax
    265b:	83 ec 08             	sub    $0x8,%esp
    265e:	50                   	push   %eax
    265f:	ff 75 10             	pushl  0x10(%ebp)
    2662:	e8 d1 dc ff ff       	call   338 <strchr>
    2667:	83 c4 10             	add    $0x10,%esp
    266a:	85 c0                	test   %eax,%eax
    266c:	74 07                	je     2675 <peek+0x6f>
    266e:	b8 01 00 00 00       	mov    $0x1,%eax
    2673:	eb 05                	jmp    267a <peek+0x74>
    2675:	b8 00 00 00 00       	mov    $0x0,%eax
}
    267a:	c9                   	leave  
    267b:	c3                   	ret    

0000267c <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    267c:	55                   	push   %ebp
    267d:	89 e5                	mov    %esp,%ebp
    267f:	53                   	push   %ebx
    2680:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    2683:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2686:	8b 45 08             	mov    0x8(%ebp),%eax
    2689:	83 ec 0c             	sub    $0xc,%esp
    268c:	50                   	push   %eax
    268d:	e8 65 dc ff ff       	call   2f7 <strlen>
    2692:	83 c4 10             	add    $0x10,%esp
    2695:	01 d8                	add    %ebx,%eax
    2697:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    269a:	8b 45 08             	mov    0x8(%ebp),%eax
    269d:	0f b6 00             	movzbl (%eax),%eax
    26a0:	3c 25                	cmp    $0x25,%al
    26a2:	75 5d                	jne    2701 <parsecmd+0x85>
  {
    int len = strlen(s);
    26a4:	8b 45 08             	mov    0x8(%ebp),%eax
    26a7:	83 ec 0c             	sub    $0xc,%esp
    26aa:	50                   	push   %eax
    26ab:	e8 47 dc ff ff       	call   2f7 <strlen>
    26b0:	83 c4 10             	add    $0x10,%esp
    26b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    26b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    26b9:	83 ec 0c             	sub    $0xc,%esp
    26bc:	50                   	push   %eax
    26bd:	e8 a5 e3 ff ff       	call   a67 <malloc>
    26c2:	83 c4 10             	add    $0x10,%esp
    26c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    26c8:	8b 45 08             	mov    0x8(%ebp),%eax
    26cb:	83 c0 01             	add    $0x1,%eax
    26ce:	83 ec 08             	sub    $0x8,%esp
    26d1:	50                   	push   %eax
    26d2:	ff 75 ec             	pushl  -0x14(%ebp)
    26d5:	e8 ae db ff ff       	call   288 <strcpy>
    26da:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    26dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    26e0:	8d 50 fe             	lea    -0x2(%eax),%edx
    26e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    26e6:	01 d0                	add    %edx,%eax
    26e8:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    26eb:	83 ec 0c             	sub    $0xc,%esp
    26ee:	ff 75 ec             	pushl  -0x14(%ebp)
    26f1:	e8 59 e9 ff ff       	call   104f <calcmd>
    26f6:	83 c4 10             	add    $0x10,%esp
    26f9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    26fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    26ff:	eb 6b                	jmp    276c <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    2701:	83 ec 08             	sub    $0x8,%esp
    2704:	ff 75 f4             	pushl  -0xc(%ebp)
    2707:	8d 45 08             	lea    0x8(%ebp),%eax
    270a:	50                   	push   %eax
    270b:	e8 61 00 00 00       	call   2771 <parseline>
    2710:	83 c4 10             	add    $0x10,%esp
    2713:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    2716:	83 ec 04             	sub    $0x4,%esp
    2719:	68 b8 3a 00 00       	push   $0x3ab8
    271e:	ff 75 f4             	pushl  -0xc(%ebp)
    2721:	8d 45 08             	lea    0x8(%ebp),%eax
    2724:	50                   	push   %eax
    2725:	e8 dc fe ff ff       	call   2606 <peek>
    272a:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    272d:	8b 45 08             	mov    0x8(%ebp),%eax
    2730:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2733:	74 26                	je     275b <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    2735:	8b 45 08             	mov    0x8(%ebp),%eax
    2738:	83 ec 04             	sub    $0x4,%esp
    273b:	50                   	push   %eax
    273c:	68 b9 3a 00 00       	push   $0x3ab9
    2741:	6a 02                	push   $0x2
    2743:	e8 1d e0 ff ff       	call   765 <printf>
    2748:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    274b:	83 ec 0c             	sub    $0xc,%esp
    274e:	68 c8 3a 00 00       	push   $0x3ac8
    2753:	e8 f2 e3 ff ff       	call   b4a <panic1>
    2758:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    275b:	83 ec 0c             	sub    $0xc,%esp
    275e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2761:	e8 eb 03 00 00       	call   2b51 <nulterminate>
    2766:	83 c4 10             	add    $0x10,%esp
  return cmd;
    2769:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    276c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    276f:	c9                   	leave  
    2770:	c3                   	ret    

00002771 <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    2771:	55                   	push   %ebp
    2772:	89 e5                	mov    %esp,%ebp
    2774:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    2777:	83 ec 08             	sub    $0x8,%esp
    277a:	ff 75 0c             	pushl  0xc(%ebp)
    277d:	ff 75 08             	pushl  0x8(%ebp)
    2780:	e8 99 00 00 00       	call   281e <parsepipe>
    2785:	83 c4 10             	add    $0x10,%esp
    2788:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    278b:	eb 23                	jmp    27b0 <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    278d:	6a 00                	push   $0x0
    278f:	6a 00                	push   $0x0
    2791:	ff 75 0c             	pushl  0xc(%ebp)
    2794:	ff 75 08             	pushl  0x8(%ebp)
    2797:	e8 19 fd ff ff       	call   24b5 <gettoken>
    279c:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    279f:	83 ec 0c             	sub    $0xc,%esp
    27a2:	ff 75 f4             	pushl  -0xc(%ebp)
    27a5:	e8 66 e8 ff ff       	call   1010 <backcmd>
    27aa:	83 c4 10             	add    $0x10,%esp
    27ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    27b0:	83 ec 04             	sub    $0x4,%esp
    27b3:	68 cf 3a 00 00       	push   $0x3acf
    27b8:	ff 75 0c             	pushl  0xc(%ebp)
    27bb:	ff 75 08             	pushl  0x8(%ebp)
    27be:	e8 43 fe ff ff       	call   2606 <peek>
    27c3:	83 c4 10             	add    $0x10,%esp
    27c6:	85 c0                	test   %eax,%eax
    27c8:	75 c3                	jne    278d <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    27ca:	83 ec 04             	sub    $0x4,%esp
    27cd:	68 d1 3a 00 00       	push   $0x3ad1
    27d2:	ff 75 0c             	pushl  0xc(%ebp)
    27d5:	ff 75 08             	pushl  0x8(%ebp)
    27d8:	e8 29 fe ff ff       	call   2606 <peek>
    27dd:	83 c4 10             	add    $0x10,%esp
    27e0:	85 c0                	test   %eax,%eax
    27e2:	74 35                	je     2819 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    27e4:	6a 00                	push   $0x0
    27e6:	6a 00                	push   $0x0
    27e8:	ff 75 0c             	pushl  0xc(%ebp)
    27eb:	ff 75 08             	pushl  0x8(%ebp)
    27ee:	e8 c2 fc ff ff       	call   24b5 <gettoken>
    27f3:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    27f6:	83 ec 08             	sub    $0x8,%esp
    27f9:	ff 75 0c             	pushl  0xc(%ebp)
    27fc:	ff 75 08             	pushl  0x8(%ebp)
    27ff:	e8 6d ff ff ff       	call   2771 <parseline>
    2804:	83 c4 10             	add    $0x10,%esp
    2807:	83 ec 08             	sub    $0x8,%esp
    280a:	50                   	push   %eax
    280b:	ff 75 f4             	pushl  -0xc(%ebp)
    280e:	e8 b5 e7 ff ff       	call   fc8 <listcmd>
    2813:	83 c4 10             	add    $0x10,%esp
    2816:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2819:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    281c:	c9                   	leave  
    281d:	c3                   	ret    

0000281e <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    281e:	55                   	push   %ebp
    281f:	89 e5                	mov    %esp,%ebp
    2821:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    2824:	83 ec 08             	sub    $0x8,%esp
    2827:	ff 75 0c             	pushl  0xc(%ebp)
    282a:	ff 75 08             	pushl  0x8(%ebp)
    282d:	e8 ec 01 00 00       	call   2a1e <parseexec>
    2832:	83 c4 10             	add    $0x10,%esp
    2835:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    2838:	83 ec 04             	sub    $0x4,%esp
    283b:	68 d3 3a 00 00       	push   $0x3ad3
    2840:	ff 75 0c             	pushl  0xc(%ebp)
    2843:	ff 75 08             	pushl  0x8(%ebp)
    2846:	e8 bb fd ff ff       	call   2606 <peek>
    284b:	83 c4 10             	add    $0x10,%esp
    284e:	85 c0                	test   %eax,%eax
    2850:	74 35                	je     2887 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2852:	6a 00                	push   $0x0
    2854:	6a 00                	push   $0x0
    2856:	ff 75 0c             	pushl  0xc(%ebp)
    2859:	ff 75 08             	pushl  0x8(%ebp)
    285c:	e8 54 fc ff ff       	call   24b5 <gettoken>
    2861:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2864:	83 ec 08             	sub    $0x8,%esp
    2867:	ff 75 0c             	pushl  0xc(%ebp)
    286a:	ff 75 08             	pushl  0x8(%ebp)
    286d:	e8 ac ff ff ff       	call   281e <parsepipe>
    2872:	83 c4 10             	add    $0x10,%esp
    2875:	83 ec 08             	sub    $0x8,%esp
    2878:	50                   	push   %eax
    2879:	ff 75 f4             	pushl  -0xc(%ebp)
    287c:	e8 ff e6 ff ff       	call   f80 <pipecmd>
    2881:	83 c4 10             	add    $0x10,%esp
    2884:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2887:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    288a:	c9                   	leave  
    288b:	c3                   	ret    

0000288c <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    288c:	55                   	push   %ebp
    288d:	89 e5                	mov    %esp,%ebp
    288f:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2892:	e9 b6 00 00 00       	jmp    294d <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    2897:	6a 00                	push   $0x0
    2899:	6a 00                	push   $0x0
    289b:	ff 75 10             	pushl  0x10(%ebp)
    289e:	ff 75 0c             	pushl  0xc(%ebp)
    28a1:	e8 0f fc ff ff       	call   24b5 <gettoken>
    28a6:	83 c4 10             	add    $0x10,%esp
    28a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    28ac:	8d 45 ec             	lea    -0x14(%ebp),%eax
    28af:	50                   	push   %eax
    28b0:	8d 45 f0             	lea    -0x10(%ebp),%eax
    28b3:	50                   	push   %eax
    28b4:	ff 75 10             	pushl  0x10(%ebp)
    28b7:	ff 75 0c             	pushl  0xc(%ebp)
    28ba:	e8 f6 fb ff ff       	call   24b5 <gettoken>
    28bf:	83 c4 10             	add    $0x10,%esp
    28c2:	83 f8 61             	cmp    $0x61,%eax
    28c5:	74 10                	je     28d7 <parseredirs+0x4b>
      panic1("missing file for redirection");
    28c7:	83 ec 0c             	sub    $0xc,%esp
    28ca:	68 d5 3a 00 00       	push   $0x3ad5
    28cf:	e8 76 e2 ff ff       	call   b4a <panic1>
    28d4:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    28d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28da:	83 f8 3c             	cmp    $0x3c,%eax
    28dd:	74 0c                	je     28eb <parseredirs+0x5f>
    28df:	83 f8 3e             	cmp    $0x3e,%eax
    28e2:	74 26                	je     290a <parseredirs+0x7e>
    28e4:	83 f8 2b             	cmp    $0x2b,%eax
    28e7:	74 43                	je     292c <parseredirs+0xa0>
    28e9:	eb 62                	jmp    294d <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    28eb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    28ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    28f1:	83 ec 0c             	sub    $0xc,%esp
    28f4:	6a 00                	push   $0x0
    28f6:	6a 00                	push   $0x0
    28f8:	52                   	push   %edx
    28f9:	50                   	push   %eax
    28fa:	ff 75 08             	pushl  0x8(%ebp)
    28fd:	e8 1b e6 ff ff       	call   f1d <redircmd>
    2902:	83 c4 20             	add    $0x20,%esp
    2905:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2908:	eb 43                	jmp    294d <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    290a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    290d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2910:	83 ec 0c             	sub    $0xc,%esp
    2913:	6a 01                	push   $0x1
    2915:	68 01 02 00 00       	push   $0x201
    291a:	52                   	push   %edx
    291b:	50                   	push   %eax
    291c:	ff 75 08             	pushl  0x8(%ebp)
    291f:	e8 f9 e5 ff ff       	call   f1d <redircmd>
    2924:	83 c4 20             	add    $0x20,%esp
    2927:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    292a:	eb 21                	jmp    294d <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    292c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    292f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2932:	83 ec 0c             	sub    $0xc,%esp
    2935:	6a 01                	push   $0x1
    2937:	68 01 02 00 00       	push   $0x201
    293c:	52                   	push   %edx
    293d:	50                   	push   %eax
    293e:	ff 75 08             	pushl  0x8(%ebp)
    2941:	e8 d7 e5 ff ff       	call   f1d <redircmd>
    2946:	83 c4 20             	add    $0x20,%esp
    2949:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    294c:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    294d:	83 ec 04             	sub    $0x4,%esp
    2950:	68 f2 3a 00 00       	push   $0x3af2
    2955:	ff 75 10             	pushl  0x10(%ebp)
    2958:	ff 75 0c             	pushl  0xc(%ebp)
    295b:	e8 a6 fc ff ff       	call   2606 <peek>
    2960:	83 c4 10             	add    $0x10,%esp
    2963:	85 c0                	test   %eax,%eax
    2965:	0f 85 2c ff ff ff    	jne    2897 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    296b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    296e:	c9                   	leave  
    296f:	c3                   	ret    

00002970 <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    2970:	55                   	push   %ebp
    2971:	89 e5                	mov    %esp,%ebp
    2973:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2976:	83 ec 04             	sub    $0x4,%esp
    2979:	68 f5 3a 00 00       	push   $0x3af5
    297e:	ff 75 0c             	pushl  0xc(%ebp)
    2981:	ff 75 08             	pushl  0x8(%ebp)
    2984:	e8 7d fc ff ff       	call   2606 <peek>
    2989:	83 c4 10             	add    $0x10,%esp
    298c:	85 c0                	test   %eax,%eax
    298e:	75 10                	jne    29a0 <parseblock+0x30>
    panic1("parseblock");
    2990:	83 ec 0c             	sub    $0xc,%esp
    2993:	68 f7 3a 00 00       	push   $0x3af7
    2998:	e8 ad e1 ff ff       	call   b4a <panic1>
    299d:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    29a0:	6a 00                	push   $0x0
    29a2:	6a 00                	push   $0x0
    29a4:	ff 75 0c             	pushl  0xc(%ebp)
    29a7:	ff 75 08             	pushl  0x8(%ebp)
    29aa:	e8 06 fb ff ff       	call   24b5 <gettoken>
    29af:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    29b2:	83 ec 08             	sub    $0x8,%esp
    29b5:	ff 75 0c             	pushl  0xc(%ebp)
    29b8:	ff 75 08             	pushl  0x8(%ebp)
    29bb:	e8 b1 fd ff ff       	call   2771 <parseline>
    29c0:	83 c4 10             	add    $0x10,%esp
    29c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    29c6:	83 ec 04             	sub    $0x4,%esp
    29c9:	68 02 3b 00 00       	push   $0x3b02
    29ce:	ff 75 0c             	pushl  0xc(%ebp)
    29d1:	ff 75 08             	pushl  0x8(%ebp)
    29d4:	e8 2d fc ff ff       	call   2606 <peek>
    29d9:	83 c4 10             	add    $0x10,%esp
    29dc:	85 c0                	test   %eax,%eax
    29de:	75 10                	jne    29f0 <parseblock+0x80>
    panic1("syntax - missing )");
    29e0:	83 ec 0c             	sub    $0xc,%esp
    29e3:	68 04 3b 00 00       	push   $0x3b04
    29e8:	e8 5d e1 ff ff       	call   b4a <panic1>
    29ed:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    29f0:	6a 00                	push   $0x0
    29f2:	6a 00                	push   $0x0
    29f4:	ff 75 0c             	pushl  0xc(%ebp)
    29f7:	ff 75 08             	pushl  0x8(%ebp)
    29fa:	e8 b6 fa ff ff       	call   24b5 <gettoken>
    29ff:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    2a02:	83 ec 04             	sub    $0x4,%esp
    2a05:	ff 75 0c             	pushl  0xc(%ebp)
    2a08:	ff 75 08             	pushl  0x8(%ebp)
    2a0b:	ff 75 f4             	pushl  -0xc(%ebp)
    2a0e:	e8 79 fe ff ff       	call   288c <parseredirs>
    2a13:	83 c4 10             	add    $0x10,%esp
    2a16:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    2a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2a1c:	c9                   	leave  
    2a1d:	c3                   	ret    

00002a1e <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    2a1e:	55                   	push   %ebp
    2a1f:	89 e5                	mov    %esp,%ebp
    2a21:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    2a24:	83 ec 04             	sub    $0x4,%esp
    2a27:	68 f5 3a 00 00       	push   $0x3af5
    2a2c:	ff 75 0c             	pushl  0xc(%ebp)
    2a2f:	ff 75 08             	pushl  0x8(%ebp)
    2a32:	e8 cf fb ff ff       	call   2606 <peek>
    2a37:	83 c4 10             	add    $0x10,%esp
    2a3a:	85 c0                	test   %eax,%eax
    2a3c:	74 16                	je     2a54 <parseexec+0x36>
    return parseblock(ps, es);
    2a3e:	83 ec 08             	sub    $0x8,%esp
    2a41:	ff 75 0c             	pushl  0xc(%ebp)
    2a44:	ff 75 08             	pushl  0x8(%ebp)
    2a47:	e8 24 ff ff ff       	call   2970 <parseblock>
    2a4c:	83 c4 10             	add    $0x10,%esp
    2a4f:	e9 fb 00 00 00       	jmp    2b4f <parseexec+0x131>

  ret = execcmd();
    2a54:	e8 8e e4 ff ff       	call   ee7 <execcmd>
    2a59:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    2a5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a5f:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2a62:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2a69:	83 ec 04             	sub    $0x4,%esp
    2a6c:	ff 75 0c             	pushl  0xc(%ebp)
    2a6f:	ff 75 08             	pushl  0x8(%ebp)
    2a72:	ff 75 f0             	pushl  -0x10(%ebp)
    2a75:	e8 12 fe ff ff       	call   288c <parseredirs>
    2a7a:	83 c4 10             	add    $0x10,%esp
    2a7d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    2a80:	e9 87 00 00 00       	jmp    2b0c <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2a85:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2a88:	50                   	push   %eax
    2a89:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2a8c:	50                   	push   %eax
    2a8d:	ff 75 0c             	pushl  0xc(%ebp)
    2a90:	ff 75 08             	pushl  0x8(%ebp)
    2a93:	e8 1d fa ff ff       	call   24b5 <gettoken>
    2a98:	83 c4 10             	add    $0x10,%esp
    2a9b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2a9e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2aa2:	0f 84 84 00 00 00    	je     2b2c <parseexec+0x10e>
      break;
    if(tok != 'a')
    2aa8:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    2aac:	74 10                	je     2abe <parseexec+0xa0>
      panic1("syntax");
    2aae:	83 ec 0c             	sub    $0xc,%esp
    2ab1:	68 c8 3a 00 00       	push   $0x3ac8
    2ab6:	e8 8f e0 ff ff       	call   b4a <panic1>
    2abb:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    2abe:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    2ac1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ac4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2ac7:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    2acb:	8b 55 e0             	mov    -0x20(%ebp),%edx
    2ace:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ad1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2ad4:	83 c1 08             	add    $0x8,%ecx
    2ad7:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    2adb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    2adf:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2ae3:	7e 10                	jle    2af5 <parseexec+0xd7>
      panic1("too many args");
    2ae5:	83 ec 0c             	sub    $0xc,%esp
    2ae8:	68 17 3b 00 00       	push   $0x3b17
    2aed:	e8 58 e0 ff ff       	call   b4a <panic1>
    2af2:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2af5:	83 ec 04             	sub    $0x4,%esp
    2af8:	ff 75 0c             	pushl  0xc(%ebp)
    2afb:	ff 75 08             	pushl  0x8(%ebp)
    2afe:	ff 75 f0             	pushl  -0x10(%ebp)
    2b01:	e8 86 fd ff ff       	call   288c <parseredirs>
    2b06:	83 c4 10             	add    $0x10,%esp
    2b09:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    2b0c:	83 ec 04             	sub    $0x4,%esp
    2b0f:	68 25 3b 00 00       	push   $0x3b25
    2b14:	ff 75 0c             	pushl  0xc(%ebp)
    2b17:	ff 75 08             	pushl  0x8(%ebp)
    2b1a:	e8 e7 fa ff ff       	call   2606 <peek>
    2b1f:	83 c4 10             	add    $0x10,%esp
    2b22:	85 c0                	test   %eax,%eax
    2b24:	0f 84 5b ff ff ff    	je     2a85 <parseexec+0x67>
    2b2a:	eb 01                	jmp    2b2d <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    2b2c:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    2b2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b30:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2b33:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    2b3a:	00 
  cmd->eargv[argc] = 0;
    2b3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b3e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2b41:	83 c2 08             	add    $0x8,%edx
    2b44:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    2b4b:	00 
  return ret;
    2b4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2b4f:	c9                   	leave  
    2b50:	c3                   	ret    

00002b51 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2b51:	55                   	push   %ebp
    2b52:	89 e5                	mov    %esp,%ebp
    2b54:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2b57:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2b5b:	75 0a                	jne    2b67 <nulterminate+0x16>
    return 0;
    2b5d:	b8 00 00 00 00       	mov    $0x0,%eax
    2b62:	e9 e4 00 00 00       	jmp    2c4b <nulterminate+0xfa>
  
  switch(cmd->type){
    2b67:	8b 45 08             	mov    0x8(%ebp),%eax
    2b6a:	8b 00                	mov    (%eax),%eax
    2b6c:	83 f8 05             	cmp    $0x5,%eax
    2b6f:	0f 87 d3 00 00 00    	ja     2c48 <nulterminate+0xf7>
    2b75:	8b 04 85 2c 3b 00 00 	mov    0x3b2c(,%eax,4),%eax
    2b7c:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2b7e:	8b 45 08             	mov    0x8(%ebp),%eax
    2b81:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2b84:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2b8b:	eb 14                	jmp    2ba1 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2b8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b90:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2b93:	83 c2 08             	add    $0x8,%edx
    2b96:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2b9a:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2b9d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2ba1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ba4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2ba7:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2bab:	85 c0                	test   %eax,%eax
    2bad:	75 de                	jne    2b8d <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2baf:	e9 94 00 00 00       	jmp    2c48 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2bb4:	8b 45 08             	mov    0x8(%ebp),%eax
    2bb7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2bba:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2bbd:	8b 40 04             	mov    0x4(%eax),%eax
    2bc0:	83 ec 0c             	sub    $0xc,%esp
    2bc3:	50                   	push   %eax
    2bc4:	e8 88 ff ff ff       	call   2b51 <nulterminate>
    2bc9:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2bcc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2bcf:	8b 40 0c             	mov    0xc(%eax),%eax
    2bd2:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2bd5:	eb 71                	jmp    2c48 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2bd7:	8b 45 08             	mov    0x8(%ebp),%eax
    2bda:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2bdd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2be0:	8b 40 04             	mov    0x4(%eax),%eax
    2be3:	83 ec 0c             	sub    $0xc,%esp
    2be6:	50                   	push   %eax
    2be7:	e8 65 ff ff ff       	call   2b51 <nulterminate>
    2bec:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2bef:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2bf2:	8b 40 08             	mov    0x8(%eax),%eax
    2bf5:	83 ec 0c             	sub    $0xc,%esp
    2bf8:	50                   	push   %eax
    2bf9:	e8 53 ff ff ff       	call   2b51 <nulterminate>
    2bfe:	83 c4 10             	add    $0x10,%esp
    break;
    2c01:	eb 45                	jmp    2c48 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2c03:	8b 45 08             	mov    0x8(%ebp),%eax
    2c06:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2c09:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2c0c:	8b 40 04             	mov    0x4(%eax),%eax
    2c0f:	83 ec 0c             	sub    $0xc,%esp
    2c12:	50                   	push   %eax
    2c13:	e8 39 ff ff ff       	call   2b51 <nulterminate>
    2c18:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2c1b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2c1e:	8b 40 08             	mov    0x8(%eax),%eax
    2c21:	83 ec 0c             	sub    $0xc,%esp
    2c24:	50                   	push   %eax
    2c25:	e8 27 ff ff ff       	call   2b51 <nulterminate>
    2c2a:	83 c4 10             	add    $0x10,%esp
    break;
    2c2d:	eb 19                	jmp    2c48 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2c2f:	8b 45 08             	mov    0x8(%ebp),%eax
    2c32:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2c35:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2c38:	8b 40 04             	mov    0x4(%eax),%eax
    2c3b:	83 ec 0c             	sub    $0xc,%esp
    2c3e:	50                   	push   %eax
    2c3f:	e8 0d ff ff ff       	call   2b51 <nulterminate>
    2c44:	83 c4 10             	add    $0x10,%esp
    break;
    2c47:	90                   	nop
  }
  return cmd;
    2c48:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2c4b:	c9                   	leave  
    2c4c:	c3                   	ret    

00002c4d <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2c4d:	55                   	push   %ebp
    2c4e:	89 e5                	mov    %esp,%ebp
    2c50:	83 ec 18             	sub    $0x18,%esp
    2c53:	8b 45 08             	mov    0x8(%ebp),%eax
    2c56:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2c59:	83 ec 08             	sub    $0x8,%esp
    2c5c:	ff 75 18             	pushl  0x18(%ebp)
    2c5f:	ff 75 14             	pushl  0x14(%ebp)
    2c62:	ff 75 10             	pushl  0x10(%ebp)
    2c65:	ff 75 0c             	pushl  0xc(%ebp)
    2c68:	6a 01                	push   $0x1
    2c6a:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2c6d:	50                   	push   %eax
    2c6e:	e8 e6 d8 ff ff       	call   559 <colorwrite>
    2c73:	83 c4 20             	add    $0x20,%esp
}
    2c76:	90                   	nop
    2c77:	c9                   	leave  
    2c78:	c3                   	ret    

00002c79 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2c79:	55                   	push   %ebp
    2c7a:	89 e5                	mov    %esp,%ebp
    2c7c:	53                   	push   %ebx
    2c7d:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2c80:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2c87:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2c8b:	74 17                	je     2ca4 <color_printint+0x2b>
    2c8d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2c91:	79 11                	jns    2ca4 <color_printint+0x2b>
    neg = 1;
    2c93:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2c9a:	8b 45 08             	mov    0x8(%ebp),%eax
    2c9d:	f7 d8                	neg    %eax
    2c9f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2ca2:	eb 06                	jmp    2caa <color_printint+0x31>
  } else {
    x = xx;
    2ca4:	8b 45 08             	mov    0x8(%ebp),%eax
    2ca7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2caa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2cb1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2cb4:	8d 41 01             	lea    0x1(%ecx),%eax
    2cb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2cba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2cbd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2cc0:	ba 00 00 00 00       	mov    $0x0,%edx
    2cc5:	f7 f3                	div    %ebx
    2cc7:	89 d0                	mov    %edx,%eax
    2cc9:	0f b6 80 e4 45 00 00 	movzbl 0x45e4(%eax),%eax
    2cd0:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2cd4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2cd7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2cda:	ba 00 00 00 00       	mov    $0x0,%edx
    2cdf:	f7 f3                	div    %ebx
    2ce1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2ce4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2ce8:	75 c7                	jne    2cb1 <color_printint+0x38>
  if(neg)
    2cea:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2cee:	74 36                	je     2d26 <color_printint+0xad>
    buf[i++] = '-';
    2cf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2cf3:	8d 50 01             	lea    0x1(%eax),%edx
    2cf6:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2cf9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2cfe:	eb 26                	jmp    2d26 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2d00:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2d03:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d06:	01 d0                	add    %edx,%eax
    2d08:	0f b6 00             	movzbl (%eax),%eax
    2d0b:	0f be c0             	movsbl %al,%eax
    2d0e:	83 ec 0c             	sub    $0xc,%esp
    2d11:	ff 75 20             	pushl  0x20(%ebp)
    2d14:	ff 75 1c             	pushl  0x1c(%ebp)
    2d17:	ff 75 18             	pushl  0x18(%ebp)
    2d1a:	ff 75 14             	pushl  0x14(%ebp)
    2d1d:	50                   	push   %eax
    2d1e:	e8 2a ff ff ff       	call   2c4d <color_putc>
    2d23:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2d26:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2d2a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2d2e:	79 d0                	jns    2d00 <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2d30:	90                   	nop
    2d31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2d34:	c9                   	leave  
    2d35:	c3                   	ret    

00002d36 <getInteger>:

static int getInteger(double num)
{
    2d36:	55                   	push   %ebp
    2d37:	89 e5                	mov    %esp,%ebp
    2d39:	83 ec 18             	sub    $0x18,%esp
    2d3c:	8b 45 08             	mov    0x8(%ebp),%eax
    2d3f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2d42:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d45:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2d48:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2d4f:	eb 0e                	jmp    2d5f <getInteger+0x29>
  {
    num -= 1;
    2d51:	dd 45 e8             	fldl   -0x18(%ebp)
    2d54:	d9 e8                	fld1   
    2d56:	de e9                	fsubrp %st,%st(1)
    2d58:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2d5b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2d5f:	dd 45 e8             	fldl   -0x18(%ebp)
    2d62:	d9 e8                	fld1   
    2d64:	d9 c9                	fxch   %st(1)
    2d66:	df e9                	fucomip %st(1),%st
    2d68:	dd d8                	fstp   %st(0)
    2d6a:	77 e5                	ja     2d51 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2d6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2d6f:	c9                   	leave  
    2d70:	c3                   	ret    

00002d71 <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2d71:	55                   	push   %ebp
    2d72:	89 e5                	mov    %esp,%ebp
    2d74:	83 ec 28             	sub    $0x28,%esp
    2d77:	8b 45 08             	mov    0x8(%ebp),%eax
    2d7a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2d7d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d80:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2d83:	d9 ee                	fldz   
    2d85:	dd 45 e0             	fldl   -0x20(%ebp)
    2d88:	d9 c9                	fxch   %st(1)
    2d8a:	df e9                	fucomip %st(1),%st
    2d8c:	dd d8                	fstp   %st(0)
    2d8e:	76 21                	jbe    2db1 <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2d90:	83 ec 0c             	sub    $0xc,%esp
    2d93:	ff 75 1c             	pushl  0x1c(%ebp)
    2d96:	ff 75 18             	pushl  0x18(%ebp)
    2d99:	ff 75 14             	pushl  0x14(%ebp)
    2d9c:	ff 75 10             	pushl  0x10(%ebp)
    2d9f:	6a 2d                	push   $0x2d
    2da1:	e8 a7 fe ff ff       	call   2c4d <color_putc>
    2da6:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2da9:	dd 45 e0             	fldl   -0x20(%ebp)
    2dac:	d9 e0                	fchs   
    2dae:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2db1:	83 ec 08             	sub    $0x8,%esp
    2db4:	ff 75 e4             	pushl  -0x1c(%ebp)
    2db7:	ff 75 e0             	pushl  -0x20(%ebp)
    2dba:	e8 77 ff ff ff       	call   2d36 <getInteger>
    2dbf:	83 c4 10             	add    $0x10,%esp
    2dc2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2dc5:	83 ec 04             	sub    $0x4,%esp
    2dc8:	ff 75 1c             	pushl  0x1c(%ebp)
    2dcb:	ff 75 18             	pushl  0x18(%ebp)
    2dce:	ff 75 14             	pushl  0x14(%ebp)
    2dd1:	ff 75 10             	pushl  0x10(%ebp)
    2dd4:	6a 01                	push   $0x1
    2dd6:	6a 0a                	push   $0xa
    2dd8:	ff 75 f0             	pushl  -0x10(%ebp)
    2ddb:	e8 99 fe ff ff       	call   2c79 <color_printint>
    2de0:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2de3:	db 45 f0             	fildl  -0x10(%ebp)
    2de6:	dd 45 e0             	fldl   -0x20(%ebp)
    2de9:	de e1                	fsubp  %st,%st(1)
    2deb:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2dee:	dd 45 e0             	fldl   -0x20(%ebp)
    2df1:	dd 05 50 3b 00 00    	fldl   0x3b50
    2df7:	d9 c9                	fxch   %st(1)
    2df9:	df e9                	fucomip %st(1),%st
    2dfb:	dd d8                	fstp   %st(0)
    2dfd:	76 19                	jbe    2e18 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2dff:	83 ec 0c             	sub    $0xc,%esp
    2e02:	ff 75 1c             	pushl  0x1c(%ebp)
    2e05:	ff 75 18             	pushl  0x18(%ebp)
    2e08:	ff 75 14             	pushl  0x14(%ebp)
    2e0b:	ff 75 10             	pushl  0x10(%ebp)
    2e0e:	6a 2e                	push   $0x2e
    2e10:	e8 38 fe ff ff       	call   2c4d <color_putc>
    2e15:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2e18:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2e1f:	eb 55                	jmp    2e76 <color_printdbl+0x105>
  {
    num = num*10;
    2e21:	dd 45 e0             	fldl   -0x20(%ebp)
    2e24:	dd 05 58 3b 00 00    	fldl   0x3b58
    2e2a:	de c9                	fmulp  %st,%st(1)
    2e2c:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2e2f:	83 ec 08             	sub    $0x8,%esp
    2e32:	ff 75 e4             	pushl  -0x1c(%ebp)
    2e35:	ff 75 e0             	pushl  -0x20(%ebp)
    2e38:	e8 f9 fe ff ff       	call   2d36 <getInteger>
    2e3d:	83 c4 10             	add    $0x10,%esp
    2e40:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2e43:	83 ec 04             	sub    $0x4,%esp
    2e46:	ff 75 1c             	pushl  0x1c(%ebp)
    2e49:	ff 75 18             	pushl  0x18(%ebp)
    2e4c:	ff 75 14             	pushl  0x14(%ebp)
    2e4f:	ff 75 10             	pushl  0x10(%ebp)
    2e52:	6a 01                	push   $0x1
    2e54:	6a 0a                	push   $0xa
    2e56:	ff 75 f0             	pushl  -0x10(%ebp)
    2e59:	e8 1b fe ff ff       	call   2c79 <color_printint>
    2e5e:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2e61:	db 45 f0             	fildl  -0x10(%ebp)
    2e64:	dd 45 e0             	fldl   -0x20(%ebp)
    2e67:	de e1                	fsubp  %st,%st(1)
    2e69:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2e6c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2e70:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2e74:	7f 13                	jg     2e89 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2e76:	dd 45 e0             	fldl   -0x20(%ebp)
    2e79:	dd 05 50 3b 00 00    	fldl   0x3b50
    2e7f:	d9 c9                	fxch   %st(1)
    2e81:	df e9                	fucomip %st(1),%st
    2e83:	dd d8                	fstp   %st(0)
    2e85:	77 9a                	ja     2e21 <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2e87:	eb 01                	jmp    2e8a <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2e89:	90                   	nop
    }
  }
}
    2e8a:	90                   	nop
    2e8b:	c9                   	leave  
    2e8c:	c3                   	ret    

00002e8d <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2e8d:	55                   	push   %ebp
    2e8e:	89 e5                	mov    %esp,%ebp
    2e90:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2e93:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2e9a:	8d 45 18             	lea    0x18(%ebp),%eax
    2e9d:	83 c0 04             	add    $0x4,%eax
    2ea0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2ea3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2eaa:	e9 e2 01 00 00       	jmp    3091 <color_printf+0x204>
    c = fmt[i] & 0xff;
    2eaf:	8b 55 18             	mov    0x18(%ebp),%edx
    2eb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2eb5:	01 d0                	add    %edx,%eax
    2eb7:	0f b6 00             	movzbl (%eax),%eax
    2eba:	0f be c0             	movsbl %al,%eax
    2ebd:	25 ff 00 00 00       	and    $0xff,%eax
    2ec2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2ec5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2ec9:	75 35                	jne    2f00 <color_printf+0x73>
      if(c == '%'){
    2ecb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2ecf:	75 0c                	jne    2edd <color_printf+0x50>
        state = '%';
    2ed1:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2ed8:	e9 b0 01 00 00       	jmp    308d <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2edd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ee0:	0f be c0             	movsbl %al,%eax
    2ee3:	83 ec 0c             	sub    $0xc,%esp
    2ee6:	ff 75 14             	pushl  0x14(%ebp)
    2ee9:	ff 75 10             	pushl  0x10(%ebp)
    2eec:	ff 75 0c             	pushl  0xc(%ebp)
    2eef:	ff 75 08             	pushl  0x8(%ebp)
    2ef2:	50                   	push   %eax
    2ef3:	e8 55 fd ff ff       	call   2c4d <color_putc>
    2ef8:	83 c4 20             	add    $0x20,%esp
    2efb:	e9 8d 01 00 00       	jmp    308d <color_printf+0x200>
      }
    } else if(state == '%'){
    2f00:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2f04:	0f 85 83 01 00 00    	jne    308d <color_printf+0x200>
      if(c == 'd'){
    2f0a:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2f0e:	75 2a                	jne    2f3a <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2f10:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f13:	8b 00                	mov    (%eax),%eax
    2f15:	83 ec 04             	sub    $0x4,%esp
    2f18:	ff 75 14             	pushl  0x14(%ebp)
    2f1b:	ff 75 10             	pushl  0x10(%ebp)
    2f1e:	ff 75 0c             	pushl  0xc(%ebp)
    2f21:	ff 75 08             	pushl  0x8(%ebp)
    2f24:	6a 01                	push   $0x1
    2f26:	6a 0a                	push   $0xa
    2f28:	50                   	push   %eax
    2f29:	e8 4b fd ff ff       	call   2c79 <color_printint>
    2f2e:	83 c4 20             	add    $0x20,%esp
        ap++;
    2f31:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2f35:	e9 4c 01 00 00       	jmp    3086 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    2f3a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2f3e:	74 06                	je     2f46 <color_printf+0xb9>
    2f40:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2f44:	75 2a                	jne    2f70 <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    2f46:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f49:	8b 00                	mov    (%eax),%eax
    2f4b:	83 ec 04             	sub    $0x4,%esp
    2f4e:	ff 75 14             	pushl  0x14(%ebp)
    2f51:	ff 75 10             	pushl  0x10(%ebp)
    2f54:	ff 75 0c             	pushl  0xc(%ebp)
    2f57:	ff 75 08             	pushl  0x8(%ebp)
    2f5a:	6a 00                	push   $0x0
    2f5c:	6a 10                	push   $0x10
    2f5e:	50                   	push   %eax
    2f5f:	e8 15 fd ff ff       	call   2c79 <color_printint>
    2f64:	83 c4 20             	add    $0x20,%esp
        ap++;
    2f67:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2f6b:	e9 16 01 00 00       	jmp    3086 <color_printf+0x1f9>
      } else if(c == 's'){
    2f70:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2f74:	75 4f                	jne    2fc5 <color_printf+0x138>
        s = (char*)*ap;
    2f76:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f79:	8b 00                	mov    (%eax),%eax
    2f7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2f7e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2f82:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2f86:	75 2e                	jne    2fb6 <color_printf+0x129>
          s = "(null)";
    2f88:	c7 45 f4 48 3b 00 00 	movl   $0x3b48,-0xc(%ebp)
        while(*s != 0){
    2f8f:	eb 25                	jmp    2fb6 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    2f91:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f94:	0f b6 00             	movzbl (%eax),%eax
    2f97:	0f be c0             	movsbl %al,%eax
    2f9a:	83 ec 0c             	sub    $0xc,%esp
    2f9d:	ff 75 14             	pushl  0x14(%ebp)
    2fa0:	ff 75 10             	pushl  0x10(%ebp)
    2fa3:	ff 75 0c             	pushl  0xc(%ebp)
    2fa6:	ff 75 08             	pushl  0x8(%ebp)
    2fa9:	50                   	push   %eax
    2faa:	e8 9e fc ff ff       	call   2c4d <color_putc>
    2faf:	83 c4 20             	add    $0x20,%esp
          s++;
    2fb2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2fb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fb9:	0f b6 00             	movzbl (%eax),%eax
    2fbc:	84 c0                	test   %al,%al
    2fbe:	75 d1                	jne    2f91 <color_printf+0x104>
    2fc0:	e9 c1 00 00 00       	jmp    3086 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    2fc5:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2fc9:	75 29                	jne    2ff4 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    2fcb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2fce:	8b 00                	mov    (%eax),%eax
    2fd0:	0f be c0             	movsbl %al,%eax
    2fd3:	83 ec 0c             	sub    $0xc,%esp
    2fd6:	ff 75 14             	pushl  0x14(%ebp)
    2fd9:	ff 75 10             	pushl  0x10(%ebp)
    2fdc:	ff 75 0c             	pushl  0xc(%ebp)
    2fdf:	ff 75 08             	pushl  0x8(%ebp)
    2fe2:	50                   	push   %eax
    2fe3:	e8 65 fc ff ff       	call   2c4d <color_putc>
    2fe8:	83 c4 20             	add    $0x20,%esp
        ap++;
    2feb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2fef:	e9 92 00 00 00       	jmp    3086 <color_printf+0x1f9>
      } else if(c == '%'){
    2ff4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2ff8:	75 20                	jne    301a <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    2ffa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ffd:	0f be c0             	movsbl %al,%eax
    3000:	83 ec 0c             	sub    $0xc,%esp
    3003:	ff 75 14             	pushl  0x14(%ebp)
    3006:	ff 75 10             	pushl  0x10(%ebp)
    3009:	ff 75 0c             	pushl  0xc(%ebp)
    300c:	ff 75 08             	pushl  0x8(%ebp)
    300f:	50                   	push   %eax
    3010:	e8 38 fc ff ff       	call   2c4d <color_putc>
    3015:	83 c4 20             	add    $0x20,%esp
    3018:	eb 6c                	jmp    3086 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    301a:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    301e:	75 2f                	jne    304f <color_printf+0x1c2>
        double *dap = (double*)ap;
    3020:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3023:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    3026:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3029:	dd 00                	fldl   (%eax)
    302b:	83 ec 08             	sub    $0x8,%esp
    302e:	ff 75 14             	pushl  0x14(%ebp)
    3031:	ff 75 10             	pushl  0x10(%ebp)
    3034:	ff 75 0c             	pushl  0xc(%ebp)
    3037:	ff 75 08             	pushl  0x8(%ebp)
    303a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    303e:	dd 1c 24             	fstpl  (%esp)
    3041:	e8 2b fd ff ff       	call   2d71 <color_printdbl>
    3046:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    3049:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    304d:	eb 37                	jmp    3086 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    304f:	83 ec 0c             	sub    $0xc,%esp
    3052:	ff 75 14             	pushl  0x14(%ebp)
    3055:	ff 75 10             	pushl  0x10(%ebp)
    3058:	ff 75 0c             	pushl  0xc(%ebp)
    305b:	ff 75 08             	pushl  0x8(%ebp)
    305e:	6a 25                	push   $0x25
    3060:	e8 e8 fb ff ff       	call   2c4d <color_putc>
    3065:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    3068:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    306b:	0f be c0             	movsbl %al,%eax
    306e:	83 ec 0c             	sub    $0xc,%esp
    3071:	ff 75 14             	pushl  0x14(%ebp)
    3074:	ff 75 10             	pushl  0x10(%ebp)
    3077:	ff 75 0c             	pushl  0xc(%ebp)
    307a:	ff 75 08             	pushl  0x8(%ebp)
    307d:	50                   	push   %eax
    307e:	e8 ca fb ff ff       	call   2c4d <color_putc>
    3083:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    3086:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    308d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3091:	8b 55 18             	mov    0x18(%ebp),%edx
    3094:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3097:	01 d0                	add    %edx,%eax
    3099:	0f b6 00             	movzbl (%eax),%eax
    309c:	84 c0                	test   %al,%al
    309e:	0f 85 0b fe ff ff    	jne    2eaf <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    30a4:	90                   	nop
    30a5:	c9                   	leave  
    30a6:	c3                   	ret    

000030a7 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    30a7:	55                   	push   %ebp
    30a8:	89 e5                	mov    %esp,%ebp
    30aa:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    30ad:	83 ec 0c             	sub    $0xc,%esp
    30b0:	6a 58                	push   $0x58
    30b2:	e8 b0 d9 ff ff       	call   a67 <malloc>
    30b7:	83 c4 10             	add    $0x10,%esp
    30ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    30bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30c0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    30c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30c9:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    30d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    30d3:	c9                   	leave  
    30d4:	c3                   	ret    

000030d5 <pushi>:

void pushi(struct istack *s, int val)
{
    30d5:	55                   	push   %ebp
    30d6:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    30d8:	8b 45 08             	mov    0x8(%ebp),%eax
    30db:	8b 00                	mov    (%eax),%eax
    30dd:	83 f8 13             	cmp    $0x13,%eax
    30e0:	7f 2c                	jg     310e <pushi+0x39>
    {
        s->size++;
    30e2:	8b 45 08             	mov    0x8(%ebp),%eax
    30e5:	8b 00                	mov    (%eax),%eax
    30e7:	8d 50 01             	lea    0x1(%eax),%edx
    30ea:	8b 45 08             	mov    0x8(%ebp),%eax
    30ed:	89 10                	mov    %edx,(%eax)
        s->top++;
    30ef:	8b 45 08             	mov    0x8(%ebp),%eax
    30f2:	8b 40 54             	mov    0x54(%eax),%eax
    30f5:	8d 50 01             	lea    0x1(%eax),%edx
    30f8:	8b 45 08             	mov    0x8(%ebp),%eax
    30fb:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    30fe:	8b 45 08             	mov    0x8(%ebp),%eax
    3101:	8b 50 54             	mov    0x54(%eax),%edx
    3104:	8b 45 08             	mov    0x8(%ebp),%eax
    3107:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    310a:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    310e:	90                   	nop
    310f:	5d                   	pop    %ebp
    3110:	c3                   	ret    

00003111 <popi>:

int popi(struct istack *s)
{
    3111:	55                   	push   %ebp
    3112:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3114:	8b 45 08             	mov    0x8(%ebp),%eax
    3117:	8b 00                	mov    (%eax),%eax
    3119:	85 c0                	test   %eax,%eax
    311b:	75 07                	jne    3124 <popi+0x13>
    {
        return -1;
    311d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3122:	eb 2c                	jmp    3150 <popi+0x3f>
    }
    s->size--;
    3124:	8b 45 08             	mov    0x8(%ebp),%eax
    3127:	8b 00                	mov    (%eax),%eax
    3129:	8d 50 ff             	lea    -0x1(%eax),%edx
    312c:	8b 45 08             	mov    0x8(%ebp),%eax
    312f:	89 10                	mov    %edx,(%eax)
    s->top--;
    3131:	8b 45 08             	mov    0x8(%ebp),%eax
    3134:	8b 40 54             	mov    0x54(%eax),%eax
    3137:	8d 50 ff             	lea    -0x1(%eax),%edx
    313a:	8b 45 08             	mov    0x8(%ebp),%eax
    313d:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    3140:	8b 45 08             	mov    0x8(%ebp),%eax
    3143:	8b 40 54             	mov    0x54(%eax),%eax
    3146:	8d 50 01             	lea    0x1(%eax),%edx
    3149:	8b 45 08             	mov    0x8(%ebp),%eax
    314c:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3150:	5d                   	pop    %ebp
    3151:	c3                   	ret    

00003152 <topi>:

int topi(struct istack* s)
{
    3152:	55                   	push   %ebp
    3153:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3155:	8b 45 08             	mov    0x8(%ebp),%eax
    3158:	8b 50 54             	mov    0x54(%eax),%edx
    315b:	8b 45 08             	mov    0x8(%ebp),%eax
    315e:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3162:	5d                   	pop    %ebp
    3163:	c3                   	ret    

00003164 <cstack>:

//constructor
struct cstack* cstack()
{
    3164:	55                   	push   %ebp
    3165:	89 e5                	mov    %esp,%ebp
    3167:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    316a:	83 ec 0c             	sub    $0xc,%esp
    316d:	6a 1c                	push   $0x1c
    316f:	e8 f3 d8 ff ff       	call   a67 <malloc>
    3174:	83 c4 10             	add    $0x10,%esp
    3177:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    317a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    317d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3183:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3186:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    318d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3190:	c9                   	leave  
    3191:	c3                   	ret    

00003192 <pushc>:

void pushc(struct cstack *s, char val)
{
    3192:	55                   	push   %ebp
    3193:	89 e5                	mov    %esp,%ebp
    3195:	83 ec 04             	sub    $0x4,%esp
    3198:	8b 45 0c             	mov    0xc(%ebp),%eax
    319b:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    319e:	8b 45 08             	mov    0x8(%ebp),%eax
    31a1:	8b 00                	mov    (%eax),%eax
    31a3:	83 f8 13             	cmp    $0x13,%eax
    31a6:	7f 2d                	jg     31d5 <pushc+0x43>
    {
        s->size++;
    31a8:	8b 45 08             	mov    0x8(%ebp),%eax
    31ab:	8b 00                	mov    (%eax),%eax
    31ad:	8d 50 01             	lea    0x1(%eax),%edx
    31b0:	8b 45 08             	mov    0x8(%ebp),%eax
    31b3:	89 10                	mov    %edx,(%eax)
        s->top++;
    31b5:	8b 45 08             	mov    0x8(%ebp),%eax
    31b8:	8b 40 18             	mov    0x18(%eax),%eax
    31bb:	8d 50 01             	lea    0x1(%eax),%edx
    31be:	8b 45 08             	mov    0x8(%ebp),%eax
    31c1:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    31c4:	8b 45 08             	mov    0x8(%ebp),%eax
    31c7:	8b 40 18             	mov    0x18(%eax),%eax
    31ca:	8b 55 08             	mov    0x8(%ebp),%edx
    31cd:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    31d1:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    31d5:	90                   	nop
    31d6:	c9                   	leave  
    31d7:	c3                   	ret    

000031d8 <popc>:

char popc(struct cstack *s)
{
    31d8:	55                   	push   %ebp
    31d9:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    31db:	8b 45 08             	mov    0x8(%ebp),%eax
    31de:	8b 00                	mov    (%eax),%eax
    31e0:	85 c0                	test   %eax,%eax
    31e2:	75 07                	jne    31eb <popc+0x13>
    {
        return -1;
    31e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    31e9:	eb 2d                	jmp    3218 <popc+0x40>
    }
    s->size--;
    31eb:	8b 45 08             	mov    0x8(%ebp),%eax
    31ee:	8b 00                	mov    (%eax),%eax
    31f0:	8d 50 ff             	lea    -0x1(%eax),%edx
    31f3:	8b 45 08             	mov    0x8(%ebp),%eax
    31f6:	89 10                	mov    %edx,(%eax)
    s->top--;
    31f8:	8b 45 08             	mov    0x8(%ebp),%eax
    31fb:	8b 40 18             	mov    0x18(%eax),%eax
    31fe:	8d 50 ff             	lea    -0x1(%eax),%edx
    3201:	8b 45 08             	mov    0x8(%ebp),%eax
    3204:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    3207:	8b 45 08             	mov    0x8(%ebp),%eax
    320a:	8b 40 18             	mov    0x18(%eax),%eax
    320d:	8d 50 01             	lea    0x1(%eax),%edx
    3210:	8b 45 08             	mov    0x8(%ebp),%eax
    3213:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    3218:	5d                   	pop    %ebp
    3219:	c3                   	ret    

0000321a <topc>:

char topc(struct cstack* s)
{
    321a:	55                   	push   %ebp
    321b:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    321d:	8b 45 08             	mov    0x8(%ebp),%eax
    3220:	8b 40 18             	mov    0x18(%eax),%eax
    3223:	8b 55 08             	mov    0x8(%ebp),%edx
    3226:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    322b:	5d                   	pop    %ebp
    322c:	c3                   	ret    

0000322d <dstack>:

//constructor
struct dstack* dstack()
{
    322d:	55                   	push   %ebp
    322e:	89 e5                	mov    %esp,%ebp
    3230:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    3233:	83 ec 0c             	sub    $0xc,%esp
    3236:	68 a8 00 00 00       	push   $0xa8
    323b:	e8 27 d8 ff ff       	call   a67 <malloc>
    3240:	83 c4 10             	add    $0x10,%esp
    3243:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3246:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3249:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    324f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3252:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    3259:	ff ff ff 
    return stack;
    325c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    325f:	c9                   	leave  
    3260:	c3                   	ret    

00003261 <pushd>:

void pushd(struct dstack *s, double val)
{
    3261:	55                   	push   %ebp
    3262:	89 e5                	mov    %esp,%ebp
    3264:	83 ec 08             	sub    $0x8,%esp
    3267:	8b 45 0c             	mov    0xc(%ebp),%eax
    326a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    326d:	8b 45 10             	mov    0x10(%ebp),%eax
    3270:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3273:	8b 45 08             	mov    0x8(%ebp),%eax
    3276:	8b 00                	mov    (%eax),%eax
    3278:	83 f8 13             	cmp    $0x13,%eax
    327b:	7f 35                	jg     32b2 <pushd+0x51>
    {
        s->size++;
    327d:	8b 45 08             	mov    0x8(%ebp),%eax
    3280:	8b 00                	mov    (%eax),%eax
    3282:	8d 50 01             	lea    0x1(%eax),%edx
    3285:	8b 45 08             	mov    0x8(%ebp),%eax
    3288:	89 10                	mov    %edx,(%eax)
        s->top++;
    328a:	8b 45 08             	mov    0x8(%ebp),%eax
    328d:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3293:	8d 50 01             	lea    0x1(%eax),%edx
    3296:	8b 45 08             	mov    0x8(%ebp),%eax
    3299:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    329f:	8b 45 08             	mov    0x8(%ebp),%eax
    32a2:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    32a8:	8b 45 08             	mov    0x8(%ebp),%eax
    32ab:	dd 45 f8             	fldl   -0x8(%ebp)
    32ae:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    32b2:	90                   	nop
    32b3:	c9                   	leave  
    32b4:	c3                   	ret    

000032b5 <popd>:

double popd(struct dstack *s)
{
    32b5:	55                   	push   %ebp
    32b6:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    32b8:	8b 45 08             	mov    0x8(%ebp),%eax
    32bb:	8b 00                	mov    (%eax),%eax
    32bd:	85 c0                	test   %eax,%eax
    32bf:	75 06                	jne    32c7 <popd+0x12>
    {
        return -1;
    32c1:	d9 e8                	fld1   
    32c3:	d9 e0                	fchs   
    32c5:	eb 35                	jmp    32fc <popd+0x47>
    }
    s->size--;
    32c7:	8b 45 08             	mov    0x8(%ebp),%eax
    32ca:	8b 00                	mov    (%eax),%eax
    32cc:	8d 50 ff             	lea    -0x1(%eax),%edx
    32cf:	8b 45 08             	mov    0x8(%ebp),%eax
    32d2:	89 10                	mov    %edx,(%eax)
    s->top--;
    32d4:	8b 45 08             	mov    0x8(%ebp),%eax
    32d7:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    32dd:	8d 50 ff             	lea    -0x1(%eax),%edx
    32e0:	8b 45 08             	mov    0x8(%ebp),%eax
    32e3:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    32e9:	8b 45 08             	mov    0x8(%ebp),%eax
    32ec:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    32f2:	8d 50 01             	lea    0x1(%eax),%edx
    32f5:	8b 45 08             	mov    0x8(%ebp),%eax
    32f8:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    32fc:	5d                   	pop    %ebp
    32fd:	c3                   	ret    

000032fe <topd>:

double topd(struct dstack* s)
{
    32fe:	55                   	push   %ebp
    32ff:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3301:	8b 45 08             	mov    0x8(%ebp),%eax
    3304:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    330a:	8b 45 08             	mov    0x8(%ebp),%eax
    330d:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    3311:	5d                   	pop    %ebp
    3312:	c3                   	ret    

00003313 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3313:	55                   	push   %ebp
    3314:	89 e5                	mov    %esp,%ebp
    3316:	53                   	push   %ebx
    3317:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    331d:	83 ec 08             	sub    $0x8,%esp
    3320:	6a 00                	push   $0x0
    3322:	68 60 3b 00 00       	push   $0x3b60
    3327:	e8 cd d1 ff ff       	call   4f9 <open>
    332c:	83 c4 10             	add    $0x10,%esp
    332f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3332:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3336:	79 1d                	jns    3355 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    3338:	83 ec 0c             	sub    $0xc,%esp
    333b:	68 6a 3b 00 00       	push   $0x3b6a
    3340:	6a 00                	push   $0x0
    3342:	6a 00                	push   $0x0
    3344:	6a 01                	push   $0x1
    3346:	6a 03                	push   $0x3
    3348:	e8 40 fb ff ff       	call   2e8d <color_printf>
    334d:	83 c4 20             	add    $0x20,%esp
    3350:	e9 6d 02 00 00       	jmp    35c2 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    3355:	8b 45 0c             	mov    0xc(%ebp),%eax
    3358:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    335e:	e9 2a 02 00 00       	jmp    358d <readVariables+0x27a>
  {
    int pos = 0;
    3363:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    336a:	00 00 00 
    while(pos <= n-1)
    336d:	e9 07 02 00 00       	jmp    3579 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    3372:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    3379:	eb 24                	jmp    339f <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    337b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    337e:	8d 50 ff             	lea    -0x1(%eax),%edx
    3381:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    3387:	8b 45 f4             	mov    -0xc(%ebp),%eax
    338a:	01 c8                	add    %ecx,%eax
    338c:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3393:	ff 
    3394:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    339b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    339f:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    33a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33a8:	01 d0                	add    %edx,%eax
    33aa:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    33b1:	ff 
    33b2:	3c 3d                	cmp    $0x3d,%al
    33b4:	75 c5                	jne    337b <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    33b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33b9:	83 e8 01             	sub    $0x1,%eax
    33bc:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    33c3:	00 
      if(buf[pos] == 'd') //double value
    33c4:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    33ca:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    33d1:	ff 
    33d2:	3c 64                	cmp    $0x64,%al
    33d4:	0f 85 a0 00 00 00    	jne    347a <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    33da:	8b 45 0c             	mov    0xc(%ebp),%eax
    33dd:	8b 00                	mov    (%eax),%eax
    33df:	c1 e0 05             	shl    $0x5,%eax
    33e2:	89 c2                	mov    %eax,%edx
    33e4:	8b 45 08             	mov    0x8(%ebp),%eax
    33e7:	01 d0                	add    %edx,%eax
    33e9:	8d 50 04             	lea    0x4(%eax),%edx
    33ec:	83 ec 08             	sub    $0x8,%esp
    33ef:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    33f5:	50                   	push   %eax
    33f6:	52                   	push   %edx
    33f7:	e8 8c ce ff ff       	call   288 <strcpy>
    33fc:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    33ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3402:	8d 50 01             	lea    0x1(%eax),%edx
    3405:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    340b:	01 d0                	add    %edx,%eax
    340d:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    3413:	83 ec 08             	sub    $0x8,%esp
    3416:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    341c:	50                   	push   %eax
    341d:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3423:	50                   	push   %eax
    3424:	e8 7b d9 ff ff       	call   da4 <Translation>
    3429:	83 c4 10             	add    $0x10,%esp
    342c:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    342f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3432:	8b 00                	mov    (%eax),%eax
    3434:	c1 e0 05             	shl    $0x5,%eax
    3437:	89 c2                	mov    %eax,%edx
    3439:	8b 45 08             	mov    0x8(%ebp),%eax
    343c:	01 d0                	add    %edx,%eax
    343e:	dd 45 d8             	fldl   -0x28(%ebp)
    3441:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    3444:	8b 45 0c             	mov    0xc(%ebp),%eax
    3447:	8b 00                	mov    (%eax),%eax
    3449:	c1 e0 05             	shl    $0x5,%eax
    344c:	89 c2                	mov    %eax,%edx
    344e:	8b 45 08             	mov    0x8(%ebp),%eax
    3451:	01 d0                	add    %edx,%eax
    3453:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    3459:	8b 45 0c             	mov    0xc(%ebp),%eax
    345c:	8b 00                	mov    (%eax),%eax
    345e:	8d 50 01             	lea    0x1(%eax),%edx
    3461:	8b 45 0c             	mov    0xc(%ebp),%eax
    3464:	89 10                	mov    %edx,(%eax)
        pos++;
    3466:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    346c:	83 c0 01             	add    $0x1,%eax
    346f:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    3475:	e9 ff 00 00 00       	jmp    3579 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    347a:	8b 45 0c             	mov    0xc(%ebp),%eax
    347d:	8b 00                	mov    (%eax),%eax
    347f:	c1 e0 05             	shl    $0x5,%eax
    3482:	89 c2                	mov    %eax,%edx
    3484:	8b 45 08             	mov    0x8(%ebp),%eax
    3487:	01 d0                	add    %edx,%eax
    3489:	8d 50 04             	lea    0x4(%eax),%edx
    348c:	83 ec 08             	sub    $0x8,%esp
    348f:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3495:	50                   	push   %eax
    3496:	52                   	push   %edx
    3497:	e8 ec cd ff ff       	call   288 <strcpy>
    349c:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    349f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34a2:	8d 50 01             	lea    0x1(%eax),%edx
    34a5:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    34ab:	01 d0                	add    %edx,%eax
    34ad:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    34b3:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    34b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    34bc:	eb 04                	jmp    34c2 <readVariables+0x1af>
        {
          strend++;
    34be:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    34c2:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    34c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34cb:	01 d0                	add    %edx,%eax
    34cd:	0f b6 00             	movzbl (%eax),%eax
    34d0:	84 c0                	test   %al,%al
    34d2:	75 ea                	jne    34be <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    34d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    34d7:	8b 00                	mov    (%eax),%eax
    34d9:	c1 e0 05             	shl    $0x5,%eax
    34dc:	89 c2                	mov    %eax,%edx
    34de:	8b 45 08             	mov    0x8(%ebp),%eax
    34e1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    34e4:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    34ea:	8b 55 f0             	mov    -0x10(%ebp),%edx
    34ed:	29 c2                	sub    %eax,%edx
    34ef:	89 d0                	mov    %edx,%eax
    34f1:	83 c0 01             	add    $0x1,%eax
    34f4:	83 ec 0c             	sub    $0xc,%esp
    34f7:	50                   	push   %eax
    34f8:	e8 6a d5 ff ff       	call   a67 <malloc>
    34fd:	83 c4 10             	add    $0x10,%esp
    3500:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    3503:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3509:	89 45 ec             	mov    %eax,-0x14(%ebp)
    350c:	eb 35                	jmp    3543 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    350e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3511:	8b 00                	mov    (%eax),%eax
    3513:	c1 e0 05             	shl    $0x5,%eax
    3516:	89 c2                	mov    %eax,%edx
    3518:	8b 45 08             	mov    0x8(%ebp),%eax
    351b:	01 d0                	add    %edx,%eax
    351d:	8b 40 18             	mov    0x18(%eax),%eax
    3520:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3526:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3529:	29 d1                	sub    %edx,%ecx
    352b:	89 ca                	mov    %ecx,%edx
    352d:	01 c2                	add    %eax,%edx
    352f:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    3535:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3538:	01 c8                	add    %ecx,%eax
    353a:	0f b6 00             	movzbl (%eax),%eax
    353d:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    353f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    3543:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3546:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3549:	7e c3                	jle    350e <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    354b:	8b 45 0c             	mov    0xc(%ebp),%eax
    354e:	8b 00                	mov    (%eax),%eax
    3550:	c1 e0 05             	shl    $0x5,%eax
    3553:	89 c2                	mov    %eax,%edx
    3555:	8b 45 08             	mov    0x8(%ebp),%eax
    3558:	01 d0                	add    %edx,%eax
    355a:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    3560:	8b 45 0c             	mov    0xc(%ebp),%eax
    3563:	8b 00                	mov    (%eax),%eax
    3565:	8d 50 01             	lea    0x1(%eax),%edx
    3568:	8b 45 0c             	mov    0xc(%ebp),%eax
    356b:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    356d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3570:	83 c0 01             	add    $0x1,%eax
    3573:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    3579:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    357c:	8d 50 ff             	lea    -0x1(%eax),%edx
    357f:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3585:	39 c2                	cmp    %eax,%edx
    3587:	0f 8d e5 fd ff ff    	jge    3372 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    358d:	83 ec 04             	sub    $0x4,%esp
    3590:	68 e8 03 00 00       	push   $0x3e8
    3595:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    359b:	50                   	push   %eax
    359c:	ff 75 e8             	pushl  -0x18(%ebp)
    359f:	e8 2d cf ff ff       	call   4d1 <read>
    35a4:	83 c4 10             	add    $0x10,%esp
    35a7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    35aa:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    35ae:	0f 8f af fd ff ff    	jg     3363 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    35b4:	83 ec 0c             	sub    $0xc,%esp
    35b7:	ff 75 e8             	pushl  -0x18(%ebp)
    35ba:	e8 22 cf ff ff       	call   4e1 <close>
    35bf:	83 c4 10             	add    $0x10,%esp
}
    35c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    35c5:	c9                   	leave  
    35c6:	c3                   	ret    

000035c7 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    35c7:	55                   	push   %ebp
    35c8:	89 e5                	mov    %esp,%ebp
    35ca:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    35d0:	83 ec 08             	sub    $0x8,%esp
    35d3:	6a 02                	push   $0x2
    35d5:	68 60 3b 00 00       	push   $0x3b60
    35da:	e8 1a cf ff ff       	call   4f9 <open>
    35df:	83 c4 10             	add    $0x10,%esp
    35e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    35e5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    35e9:	78 1e                	js     3609 <writeVariables+0x42>
  {
    close(fd);
    35eb:	83 ec 0c             	sub    $0xc,%esp
    35ee:	ff 75 e4             	pushl  -0x1c(%ebp)
    35f1:	e8 eb ce ff ff       	call   4e1 <close>
    35f6:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    35f9:	83 ec 0c             	sub    $0xc,%esp
    35fc:	68 60 3b 00 00       	push   $0x3b60
    3601:	e8 03 cf ff ff       	call   509 <unlink>
    3606:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    3609:	83 ec 08             	sub    $0x8,%esp
    360c:	68 02 02 00 00       	push   $0x202
    3611:	68 60 3b 00 00       	push   $0x3b60
    3616:	e8 de ce ff ff       	call   4f9 <open>
    361b:	83 c4 10             	add    $0x10,%esp
    361e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    3621:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3628:	e9 ff 01 00 00       	jmp    382c <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    362d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3630:	c1 e0 05             	shl    $0x5,%eax
    3633:	89 c2                	mov    %eax,%edx
    3635:	8b 45 08             	mov    0x8(%ebp),%eax
    3638:	01 d0                	add    %edx,%eax
    363a:	8b 00                	mov    (%eax),%eax
    363c:	83 f8 01             	cmp    $0x1,%eax
    363f:	0f 85 d3 00 00 00    	jne    3718 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    3645:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    364c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    364f:	8d 50 01             	lea    0x1(%eax),%edx
    3652:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3655:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    365c:	64 
      int k=0;
    365d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    3664:	eb 2c                	jmp    3692 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    3666:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3669:	8d 50 01             	lea    0x1(%eax),%edx
    366c:	89 55 e0             	mov    %edx,-0x20(%ebp)
    366f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3672:	89 d1                	mov    %edx,%ecx
    3674:	c1 e1 05             	shl    $0x5,%ecx
    3677:	8b 55 08             	mov    0x8(%ebp),%edx
    367a:	01 d1                	add    %edx,%ecx
    367c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    367f:	01 ca                	add    %ecx,%edx
    3681:	83 c2 04             	add    $0x4,%edx
    3684:	0f b6 12             	movzbl (%edx),%edx
    3687:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    368e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    3692:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3695:	c1 e0 05             	shl    $0x5,%eax
    3698:	89 c2                	mov    %eax,%edx
    369a:	8b 45 08             	mov    0x8(%ebp),%eax
    369d:	01 c2                	add    %eax,%edx
    369f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    36a2:	01 d0                	add    %edx,%eax
    36a4:	83 c0 04             	add    $0x4,%eax
    36a7:	0f b6 00             	movzbl (%eax),%eax
    36aa:	84 c0                	test   %al,%al
    36ac:	75 b8                	jne    3666 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    36ae:	8b 45 e0             	mov    -0x20(%ebp),%eax
    36b1:	8d 50 01             	lea    0x1(%eax),%edx
    36b4:	89 55 e0             	mov    %edx,-0x20(%ebp)
    36b7:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    36be:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    36bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36c2:	c1 e0 05             	shl    $0x5,%eax
    36c5:	89 c2                	mov    %eax,%edx
    36c7:	8b 45 08             	mov    0x8(%ebp),%eax
    36ca:	01 d0                	add    %edx,%eax
    36cc:	dd 40 18             	fldl   0x18(%eax)
    36cf:	8d 45 e0             	lea    -0x20(%ebp),%eax
    36d2:	50                   	push   %eax
    36d3:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    36d7:	dd 1c 24             	fstpl  (%esp)
    36da:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    36e0:	50                   	push   %eax
    36e1:	e8 7d d5 ff ff       	call   c63 <double2str>
    36e6:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    36e9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    36ec:	8d 50 01             	lea    0x1(%eax),%edx
    36ef:	89 55 e0             	mov    %edx,-0x20(%ebp)
    36f2:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    36f9:	00 
      write(fd,buf,pos);
    36fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
    36fd:	83 ec 04             	sub    $0x4,%esp
    3700:	50                   	push   %eax
    3701:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3707:	50                   	push   %eax
    3708:	ff 75 e4             	pushl  -0x1c(%ebp)
    370b:	e8 c9 cd ff ff       	call   4d9 <write>
    3710:	83 c4 10             	add    $0x10,%esp
    3713:	e9 10 01 00 00       	jmp    3828 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    3718:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    371f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3722:	8d 50 01             	lea    0x1(%eax),%edx
    3725:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3728:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    372f:	73 
      int k=0;
    3730:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    3737:	eb 2c                	jmp    3765 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    3739:	8b 45 ec             	mov    -0x14(%ebp),%eax
    373c:	8d 50 01             	lea    0x1(%eax),%edx
    373f:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3742:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3745:	89 d1                	mov    %edx,%ecx
    3747:	c1 e1 05             	shl    $0x5,%ecx
    374a:	8b 55 08             	mov    0x8(%ebp),%edx
    374d:	01 d1                	add    %edx,%ecx
    374f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3752:	01 ca                	add    %ecx,%edx
    3754:	83 c2 04             	add    $0x4,%edx
    3757:	0f b6 12             	movzbl (%edx),%edx
    375a:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3761:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    3765:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3768:	c1 e0 05             	shl    $0x5,%eax
    376b:	89 c2                	mov    %eax,%edx
    376d:	8b 45 08             	mov    0x8(%ebp),%eax
    3770:	01 c2                	add    %eax,%edx
    3772:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3775:	01 d0                	add    %edx,%eax
    3777:	83 c0 04             	add    $0x4,%eax
    377a:	0f b6 00             	movzbl (%eax),%eax
    377d:	84 c0                	test   %al,%al
    377f:	75 b8                	jne    3739 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3781:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3784:	8d 50 01             	lea    0x1(%eax),%edx
    3787:	89 55 ec             	mov    %edx,-0x14(%ebp)
    378a:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    3791:	3d 
      k=0;
    3792:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    3799:	eb 2c                	jmp    37c7 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    379b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    379e:	8d 50 01             	lea    0x1(%eax),%edx
    37a1:	89 55 ec             	mov    %edx,-0x14(%ebp)
    37a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    37a7:	89 d1                	mov    %edx,%ecx
    37a9:	c1 e1 05             	shl    $0x5,%ecx
    37ac:	8b 55 08             	mov    0x8(%ebp),%edx
    37af:	01 ca                	add    %ecx,%edx
    37b1:	8b 4a 18             	mov    0x18(%edx),%ecx
    37b4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    37b7:	01 ca                	add    %ecx,%edx
    37b9:	0f b6 12             	movzbl (%edx),%edx
    37bc:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    37c3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    37c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37ca:	c1 e0 05             	shl    $0x5,%eax
    37cd:	89 c2                	mov    %eax,%edx
    37cf:	8b 45 08             	mov    0x8(%ebp),%eax
    37d2:	01 d0                	add    %edx,%eax
    37d4:	8b 50 18             	mov    0x18(%eax),%edx
    37d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    37da:	01 d0                	add    %edx,%eax
    37dc:	0f b6 00             	movzbl (%eax),%eax
    37df:	84 c0                	test   %al,%al
    37e1:	75 b8                	jne    379b <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    37e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    37e6:	8d 50 01             	lea    0x1(%eax),%edx
    37e9:	89 55 ec             	mov    %edx,-0x14(%ebp)
    37ec:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    37f3:	00 
      write(fd,buf,pos);
    37f4:	83 ec 04             	sub    $0x4,%esp
    37f7:	ff 75 ec             	pushl  -0x14(%ebp)
    37fa:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3800:	50                   	push   %eax
    3801:	ff 75 e4             	pushl  -0x1c(%ebp)
    3804:	e8 d0 cc ff ff       	call   4d9 <write>
    3809:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    380c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    380f:	c1 e0 05             	shl    $0x5,%eax
    3812:	89 c2                	mov    %eax,%edx
    3814:	8b 45 08             	mov    0x8(%ebp),%eax
    3817:	01 d0                	add    %edx,%eax
    3819:	8b 40 18             	mov    0x18(%eax),%eax
    381c:	83 ec 0c             	sub    $0xc,%esp
    381f:	50                   	push   %eax
    3820:	e8 00 d1 ff ff       	call   925 <free>
    3825:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    3828:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    382c:	8b 45 0c             	mov    0xc(%ebp),%eax
    382f:	8b 00                	mov    (%eax),%eax
    3831:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3834:	0f 8f f3 fd ff ff    	jg     362d <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    383a:	8b 45 0c             	mov    0xc(%ebp),%eax
    383d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    3843:	83 ec 0c             	sub    $0xc,%esp
    3846:	ff 75 e4             	pushl  -0x1c(%ebp)
    3849:	e8 93 cc ff ff       	call   4e1 <close>
    384e:	83 c4 10             	add    $0x10,%esp
  return;
    3851:	90                   	nop
    3852:	c9                   	leave  
    3853:	c3                   	ret    
