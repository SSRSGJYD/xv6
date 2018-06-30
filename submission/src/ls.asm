
_ls：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	53                   	push   %ebx
       4:	83 ec 14             	sub    $0x14,%esp
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
       7:	83 ec 0c             	sub    $0xc,%esp
       a:	ff 75 08             	pushl  0x8(%ebp)
       d:	e8 c9 03 00 00       	call   3db <strlen>
      12:	83 c4 10             	add    $0x10,%esp
      15:	89 c2                	mov    %eax,%edx
      17:	8b 45 08             	mov    0x8(%ebp),%eax
      1a:	01 d0                	add    %edx,%eax
      1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
      1f:	eb 04                	jmp    25 <fmtname+0x25>
      21:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
      25:	8b 45 f4             	mov    -0xc(%ebp),%eax
      28:	3b 45 08             	cmp    0x8(%ebp),%eax
      2b:	72 0a                	jb     37 <fmtname+0x37>
      2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      30:	0f b6 00             	movzbl (%eax),%eax
      33:	3c 2f                	cmp    $0x2f,%al
      35:	75 ea                	jne    21 <fmtname+0x21>
    ;
  p++;
      37:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
      3b:	83 ec 0c             	sub    $0xc,%esp
      3e:	ff 75 f4             	pushl  -0xc(%ebp)
      41:	e8 95 03 00 00       	call   3db <strlen>
      46:	83 c4 10             	add    $0x10,%esp
      49:	83 f8 0d             	cmp    $0xd,%eax
      4c:	76 05                	jbe    53 <fmtname+0x53>
    return p;
      4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
      51:	eb 60                	jmp    b3 <fmtname+0xb3>
  memmove(buf, p, strlen(p));
      53:	83 ec 0c             	sub    $0xc,%esp
      56:	ff 75 f4             	pushl  -0xc(%ebp)
      59:	e8 7d 03 00 00       	call   3db <strlen>
      5e:	83 c4 10             	add    $0x10,%esp
      61:	83 ec 04             	sub    $0x4,%esp
      64:	50                   	push   %eax
      65:	ff 75 f4             	pushl  -0xc(%ebp)
      68:	68 40 47 00 00       	push   $0x4740
      6d:	e8 e6 04 00 00       	call   558 <memmove>
      72:	83 c4 10             	add    $0x10,%esp
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
      75:	83 ec 0c             	sub    $0xc,%esp
      78:	ff 75 f4             	pushl  -0xc(%ebp)
      7b:	e8 5b 03 00 00       	call   3db <strlen>
      80:	83 c4 10             	add    $0x10,%esp
      83:	ba 0e 00 00 00       	mov    $0xe,%edx
      88:	89 d3                	mov    %edx,%ebx
      8a:	29 c3                	sub    %eax,%ebx
      8c:	83 ec 0c             	sub    $0xc,%esp
      8f:	ff 75 f4             	pushl  -0xc(%ebp)
      92:	e8 44 03 00 00       	call   3db <strlen>
      97:	83 c4 10             	add    $0x10,%esp
      9a:	05 40 47 00 00       	add    $0x4740,%eax
      9f:	83 ec 04             	sub    $0x4,%esp
      a2:	53                   	push   %ebx
      a3:	6a 20                	push   $0x20
      a5:	50                   	push   %eax
      a6:	e8 57 03 00 00       	call   402 <memset>
      ab:	83 c4 10             	add    $0x10,%esp
  return buf;
      ae:	b8 40 47 00 00       	mov    $0x4740,%eax
}
      b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      b6:	c9                   	leave  
      b7:	c3                   	ret    

000000b8 <ls>:

void
ls(char *path)
{
      b8:	55                   	push   %ebp
      b9:	89 e5                	mov    %esp,%ebp
      bb:	57                   	push   %edi
      bc:	56                   	push   %esi
      bd:	53                   	push   %ebx
      be:	81 ec 3c 02 00 00    	sub    $0x23c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
      c4:	83 ec 08             	sub    $0x8,%esp
      c7:	6a 00                	push   $0x0
      c9:	ff 75 08             	pushl  0x8(%ebp)
      cc:	e8 0c 05 00 00       	call   5dd <open>
      d1:	83 c4 10             	add    $0x10,%esp
      d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      d7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
      db:	79 1a                	jns    f7 <ls+0x3f>
    printf(2, "ls: cannot open %s\n", path);
      dd:	83 ec 04             	sub    $0x4,%esp
      e0:	ff 75 08             	pushl  0x8(%ebp)
      e3:	68 38 39 00 00       	push   $0x3938
      e8:	6a 02                	push   $0x2
      ea:	e8 5a 07 00 00       	call   849 <printf>
      ef:	83 c4 10             	add    $0x10,%esp
    return;
      f2:	e9 e3 01 00 00       	jmp    2da <ls+0x222>
  }
  
  if(fstat(fd, &st) < 0){
      f7:	83 ec 08             	sub    $0x8,%esp
      fa:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
     100:	50                   	push   %eax
     101:	ff 75 e4             	pushl  -0x1c(%ebp)
     104:	e8 ec 04 00 00       	call   5f5 <fstat>
     109:	83 c4 10             	add    $0x10,%esp
     10c:	85 c0                	test   %eax,%eax
     10e:	79 28                	jns    138 <ls+0x80>
    printf(2, "ls: cannot stat %s\n", path);
     110:	83 ec 04             	sub    $0x4,%esp
     113:	ff 75 08             	pushl  0x8(%ebp)
     116:	68 4c 39 00 00       	push   $0x394c
     11b:	6a 02                	push   $0x2
     11d:	e8 27 07 00 00       	call   849 <printf>
     122:	83 c4 10             	add    $0x10,%esp
    close(fd);
     125:	83 ec 0c             	sub    $0xc,%esp
     128:	ff 75 e4             	pushl  -0x1c(%ebp)
     12b:	e8 95 04 00 00       	call   5c5 <close>
     130:	83 c4 10             	add    $0x10,%esp
    return;
     133:	e9 a2 01 00 00       	jmp    2da <ls+0x222>
  }
  
  switch(st.type){
     138:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
     13f:	98                   	cwtl   
     140:	83 f8 01             	cmp    $0x1,%eax
     143:	74 48                	je     18d <ls+0xd5>
     145:	83 f8 02             	cmp    $0x2,%eax
     148:	0f 85 7e 01 00 00    	jne    2cc <ls+0x214>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     14e:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
     154:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
     15a:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
     161:	0f bf d8             	movswl %ax,%ebx
     164:	83 ec 0c             	sub    $0xc,%esp
     167:	ff 75 08             	pushl  0x8(%ebp)
     16a:	e8 91 fe ff ff       	call   0 <fmtname>
     16f:	83 c4 10             	add    $0x10,%esp
     172:	83 ec 08             	sub    $0x8,%esp
     175:	57                   	push   %edi
     176:	56                   	push   %esi
     177:	53                   	push   %ebx
     178:	50                   	push   %eax
     179:	68 60 39 00 00       	push   $0x3960
     17e:	6a 01                	push   $0x1
     180:	e8 c4 06 00 00       	call   849 <printf>
     185:	83 c4 20             	add    $0x20,%esp
    break;
     188:	e9 3f 01 00 00       	jmp    2cc <ls+0x214>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     18d:	83 ec 0c             	sub    $0xc,%esp
     190:	ff 75 08             	pushl  0x8(%ebp)
     193:	e8 43 02 00 00       	call   3db <strlen>
     198:	83 c4 10             	add    $0x10,%esp
     19b:	83 c0 10             	add    $0x10,%eax
     19e:	3d 00 02 00 00       	cmp    $0x200,%eax
     1a3:	76 17                	jbe    1bc <ls+0x104>
      printf(1, "ls: path too long\n");
     1a5:	83 ec 08             	sub    $0x8,%esp
     1a8:	68 6d 39 00 00       	push   $0x396d
     1ad:	6a 01                	push   $0x1
     1af:	e8 95 06 00 00       	call   849 <printf>
     1b4:	83 c4 10             	add    $0x10,%esp
      break;
     1b7:	e9 10 01 00 00       	jmp    2cc <ls+0x214>
    }
    strcpy(buf, path);
     1bc:	83 ec 08             	sub    $0x8,%esp
     1bf:	ff 75 08             	pushl  0x8(%ebp)
     1c2:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     1c8:	50                   	push   %eax
     1c9:	e8 9e 01 00 00       	call   36c <strcpy>
     1ce:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
     1d1:	83 ec 0c             	sub    $0xc,%esp
     1d4:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     1da:	50                   	push   %eax
     1db:	e8 fb 01 00 00       	call   3db <strlen>
     1e0:	83 c4 10             	add    $0x10,%esp
     1e3:	89 c2                	mov    %eax,%edx
     1e5:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     1eb:	01 d0                	add    %edx,%eax
     1ed:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
     1f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1f3:	8d 50 01             	lea    0x1(%eax),%edx
     1f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
     1f9:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     1fc:	e9 aa 00 00 00       	jmp    2ab <ls+0x1f3>
      if(de.inum == 0)
     201:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
     208:	66 85 c0             	test   %ax,%ax
     20b:	75 05                	jne    212 <ls+0x15a>
        continue;
     20d:	e9 99 00 00 00       	jmp    2ab <ls+0x1f3>
      memmove(p, de.name, DIRSIZ);
     212:	83 ec 04             	sub    $0x4,%esp
     215:	6a 0e                	push   $0xe
     217:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     21d:	83 c0 02             	add    $0x2,%eax
     220:	50                   	push   %eax
     221:	ff 75 e0             	pushl  -0x20(%ebp)
     224:	e8 2f 03 00 00       	call   558 <memmove>
     229:	83 c4 10             	add    $0x10,%esp
      p[DIRSIZ] = 0;
     22c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     22f:	83 c0 0e             	add    $0xe,%eax
     232:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
     235:	83 ec 08             	sub    $0x8,%esp
     238:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
     23e:	50                   	push   %eax
     23f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     245:	50                   	push   %eax
     246:	e8 73 02 00 00       	call   4be <stat>
     24b:	83 c4 10             	add    $0x10,%esp
     24e:	85 c0                	test   %eax,%eax
     250:	79 1b                	jns    26d <ls+0x1b5>
        printf(1, "ls: cannot stat %s\n", buf);
     252:	83 ec 04             	sub    $0x4,%esp
     255:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     25b:	50                   	push   %eax
     25c:	68 4c 39 00 00       	push   $0x394c
     261:	6a 01                	push   $0x1
     263:	e8 e1 05 00 00       	call   849 <printf>
     268:	83 c4 10             	add    $0x10,%esp
        continue;
     26b:	eb 3e                	jmp    2ab <ls+0x1f3>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
     26d:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
     273:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
     279:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
     280:	0f bf d8             	movswl %ax,%ebx
     283:	83 ec 0c             	sub    $0xc,%esp
     286:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     28c:	50                   	push   %eax
     28d:	e8 6e fd ff ff       	call   0 <fmtname>
     292:	83 c4 10             	add    $0x10,%esp
     295:	83 ec 08             	sub    $0x8,%esp
     298:	57                   	push   %edi
     299:	56                   	push   %esi
     29a:	53                   	push   %ebx
     29b:	50                   	push   %eax
     29c:	68 60 39 00 00       	push   $0x3960
     2a1:	6a 01                	push   $0x1
     2a3:	e8 a1 05 00 00       	call   849 <printf>
     2a8:	83 c4 20             	add    $0x20,%esp
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     2ab:	83 ec 04             	sub    $0x4,%esp
     2ae:	6a 10                	push   $0x10
     2b0:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2b6:	50                   	push   %eax
     2b7:	ff 75 e4             	pushl  -0x1c(%ebp)
     2ba:	e8 f6 02 00 00       	call   5b5 <read>
     2bf:	83 c4 10             	add    $0x10,%esp
     2c2:	83 f8 10             	cmp    $0x10,%eax
     2c5:	0f 84 36 ff ff ff    	je     201 <ls+0x149>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
     2cb:	90                   	nop
  }
  close(fd);
     2cc:	83 ec 0c             	sub    $0xc,%esp
     2cf:	ff 75 e4             	pushl  -0x1c(%ebp)
     2d2:	e8 ee 02 00 00       	call   5c5 <close>
     2d7:	83 c4 10             	add    $0x10,%esp
}
     2da:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2dd:	5b                   	pop    %ebx
     2de:	5e                   	pop    %esi
     2df:	5f                   	pop    %edi
     2e0:	5d                   	pop    %ebp
     2e1:	c3                   	ret    

000002e2 <main>:

int
main(int argc, char *argv[])
{
     2e2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     2e6:	83 e4 f0             	and    $0xfffffff0,%esp
     2e9:	ff 71 fc             	pushl  -0x4(%ecx)
     2ec:	55                   	push   %ebp
     2ed:	89 e5                	mov    %esp,%ebp
     2ef:	53                   	push   %ebx
     2f0:	51                   	push   %ecx
     2f1:	83 ec 10             	sub    $0x10,%esp
     2f4:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
     2f6:	83 3b 01             	cmpl   $0x1,(%ebx)
     2f9:	7f 15                	jg     310 <main+0x2e>
    ls(".");
     2fb:	83 ec 0c             	sub    $0xc,%esp
     2fe:	68 80 39 00 00       	push   $0x3980
     303:	e8 b0 fd ff ff       	call   b8 <ls>
     308:	83 c4 10             	add    $0x10,%esp
    exit();
     30b:	e8 8d 02 00 00       	call   59d <exit>
  }
  for(i=1; i<argc; i++)
     310:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
     317:	eb 21                	jmp    33a <main+0x58>
    ls(argv[i]);
     319:	8b 45 f4             	mov    -0xc(%ebp),%eax
     31c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     323:	8b 43 04             	mov    0x4(%ebx),%eax
     326:	01 d0                	add    %edx,%eax
     328:	8b 00                	mov    (%eax),%eax
     32a:	83 ec 0c             	sub    $0xc,%esp
     32d:	50                   	push   %eax
     32e:	e8 85 fd ff ff       	call   b8 <ls>
     333:	83 c4 10             	add    $0x10,%esp

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
     336:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     33a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     33d:	3b 03                	cmp    (%ebx),%eax
     33f:	7c d8                	jl     319 <main+0x37>
    ls(argv[i]);
  exit();
     341:	e8 57 02 00 00       	call   59d <exit>

00000346 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     346:	55                   	push   %ebp
     347:	89 e5                	mov    %esp,%ebp
     349:	57                   	push   %edi
     34a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     34b:	8b 4d 08             	mov    0x8(%ebp),%ecx
     34e:	8b 55 10             	mov    0x10(%ebp),%edx
     351:	8b 45 0c             	mov    0xc(%ebp),%eax
     354:	89 cb                	mov    %ecx,%ebx
     356:	89 df                	mov    %ebx,%edi
     358:	89 d1                	mov    %edx,%ecx
     35a:	fc                   	cld    
     35b:	f3 aa                	rep stos %al,%es:(%edi)
     35d:	89 ca                	mov    %ecx,%edx
     35f:	89 fb                	mov    %edi,%ebx
     361:	89 5d 08             	mov    %ebx,0x8(%ebp)
     364:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     367:	90                   	nop
     368:	5b                   	pop    %ebx
     369:	5f                   	pop    %edi
     36a:	5d                   	pop    %ebp
     36b:	c3                   	ret    

0000036c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     36c:	55                   	push   %ebp
     36d:	89 e5                	mov    %esp,%ebp
     36f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     372:	8b 45 08             	mov    0x8(%ebp),%eax
     375:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     378:	90                   	nop
     379:	8b 45 08             	mov    0x8(%ebp),%eax
     37c:	8d 50 01             	lea    0x1(%eax),%edx
     37f:	89 55 08             	mov    %edx,0x8(%ebp)
     382:	8b 55 0c             	mov    0xc(%ebp),%edx
     385:	8d 4a 01             	lea    0x1(%edx),%ecx
     388:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     38b:	0f b6 12             	movzbl (%edx),%edx
     38e:	88 10                	mov    %dl,(%eax)
     390:	0f b6 00             	movzbl (%eax),%eax
     393:	84 c0                	test   %al,%al
     395:	75 e2                	jne    379 <strcpy+0xd>
    ;
  return os;
     397:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     39a:	c9                   	leave  
     39b:	c3                   	ret    

0000039c <strcmp>:

int
strcmp(const char *p, const char *q)
{
     39c:	55                   	push   %ebp
     39d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     39f:	eb 08                	jmp    3a9 <strcmp+0xd>
    p++, q++;
     3a1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     3a5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     3a9:	8b 45 08             	mov    0x8(%ebp),%eax
     3ac:	0f b6 00             	movzbl (%eax),%eax
     3af:	84 c0                	test   %al,%al
     3b1:	74 10                	je     3c3 <strcmp+0x27>
     3b3:	8b 45 08             	mov    0x8(%ebp),%eax
     3b6:	0f b6 10             	movzbl (%eax),%edx
     3b9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3bc:	0f b6 00             	movzbl (%eax),%eax
     3bf:	38 c2                	cmp    %al,%dl
     3c1:	74 de                	je     3a1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     3c3:	8b 45 08             	mov    0x8(%ebp),%eax
     3c6:	0f b6 00             	movzbl (%eax),%eax
     3c9:	0f b6 d0             	movzbl %al,%edx
     3cc:	8b 45 0c             	mov    0xc(%ebp),%eax
     3cf:	0f b6 00             	movzbl (%eax),%eax
     3d2:	0f b6 c0             	movzbl %al,%eax
     3d5:	29 c2                	sub    %eax,%edx
     3d7:	89 d0                	mov    %edx,%eax
}
     3d9:	5d                   	pop    %ebp
     3da:	c3                   	ret    

000003db <strlen>:

uint
strlen(char *s)
{
     3db:	55                   	push   %ebp
     3dc:	89 e5                	mov    %esp,%ebp
     3de:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     3e1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     3e8:	eb 04                	jmp    3ee <strlen+0x13>
     3ea:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     3ee:	8b 55 fc             	mov    -0x4(%ebp),%edx
     3f1:	8b 45 08             	mov    0x8(%ebp),%eax
     3f4:	01 d0                	add    %edx,%eax
     3f6:	0f b6 00             	movzbl (%eax),%eax
     3f9:	84 c0                	test   %al,%al
     3fb:	75 ed                	jne    3ea <strlen+0xf>
    ;
  return n;
     3fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     400:	c9                   	leave  
     401:	c3                   	ret    

00000402 <memset>:

void*
memset(void *dst, int c, uint n)
{
     402:	55                   	push   %ebp
     403:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     405:	8b 45 10             	mov    0x10(%ebp),%eax
     408:	50                   	push   %eax
     409:	ff 75 0c             	pushl  0xc(%ebp)
     40c:	ff 75 08             	pushl  0x8(%ebp)
     40f:	e8 32 ff ff ff       	call   346 <stosb>
     414:	83 c4 0c             	add    $0xc,%esp
  return dst;
     417:	8b 45 08             	mov    0x8(%ebp),%eax
}
     41a:	c9                   	leave  
     41b:	c3                   	ret    

0000041c <strchr>:

char*
strchr(const char *s, char c)
{
     41c:	55                   	push   %ebp
     41d:	89 e5                	mov    %esp,%ebp
     41f:	83 ec 04             	sub    $0x4,%esp
     422:	8b 45 0c             	mov    0xc(%ebp),%eax
     425:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     428:	eb 14                	jmp    43e <strchr+0x22>
    if(*s == c)
     42a:	8b 45 08             	mov    0x8(%ebp),%eax
     42d:	0f b6 00             	movzbl (%eax),%eax
     430:	3a 45 fc             	cmp    -0x4(%ebp),%al
     433:	75 05                	jne    43a <strchr+0x1e>
      return (char*)s;
     435:	8b 45 08             	mov    0x8(%ebp),%eax
     438:	eb 13                	jmp    44d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     43a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     43e:	8b 45 08             	mov    0x8(%ebp),%eax
     441:	0f b6 00             	movzbl (%eax),%eax
     444:	84 c0                	test   %al,%al
     446:	75 e2                	jne    42a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     448:	b8 00 00 00 00       	mov    $0x0,%eax
}
     44d:	c9                   	leave  
     44e:	c3                   	ret    

0000044f <gets>:

char*
gets(char *buf, int max)
{
     44f:	55                   	push   %ebp
     450:	89 e5                	mov    %esp,%ebp
     452:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     455:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     45c:	eb 42                	jmp    4a0 <gets+0x51>
    cc = read(0, &c, 1);
     45e:	83 ec 04             	sub    $0x4,%esp
     461:	6a 01                	push   $0x1
     463:	8d 45 ef             	lea    -0x11(%ebp),%eax
     466:	50                   	push   %eax
     467:	6a 00                	push   $0x0
     469:	e8 47 01 00 00       	call   5b5 <read>
     46e:	83 c4 10             	add    $0x10,%esp
     471:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     474:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     478:	7e 33                	jle    4ad <gets+0x5e>
      break;
    buf[i++] = c;
     47a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     47d:	8d 50 01             	lea    0x1(%eax),%edx
     480:	89 55 f4             	mov    %edx,-0xc(%ebp)
     483:	89 c2                	mov    %eax,%edx
     485:	8b 45 08             	mov    0x8(%ebp),%eax
     488:	01 c2                	add    %eax,%edx
     48a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     48e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     490:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     494:	3c 0a                	cmp    $0xa,%al
     496:	74 16                	je     4ae <gets+0x5f>
     498:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     49c:	3c 0d                	cmp    $0xd,%al
     49e:	74 0e                	je     4ae <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     4a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4a3:	83 c0 01             	add    $0x1,%eax
     4a6:	3b 45 0c             	cmp    0xc(%ebp),%eax
     4a9:	7c b3                	jl     45e <gets+0xf>
     4ab:	eb 01                	jmp    4ae <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     4ad:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     4ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
     4b1:	8b 45 08             	mov    0x8(%ebp),%eax
     4b4:	01 d0                	add    %edx,%eax
     4b6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     4b9:	8b 45 08             	mov    0x8(%ebp),%eax
}
     4bc:	c9                   	leave  
     4bd:	c3                   	ret    

000004be <stat>:

int
stat(char *n, struct stat *st)
{
     4be:	55                   	push   %ebp
     4bf:	89 e5                	mov    %esp,%ebp
     4c1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     4c4:	83 ec 08             	sub    $0x8,%esp
     4c7:	6a 00                	push   $0x0
     4c9:	ff 75 08             	pushl  0x8(%ebp)
     4cc:	e8 0c 01 00 00       	call   5dd <open>
     4d1:	83 c4 10             	add    $0x10,%esp
     4d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     4d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     4db:	79 07                	jns    4e4 <stat+0x26>
    return -1;
     4dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     4e2:	eb 25                	jmp    509 <stat+0x4b>
  r = fstat(fd, st);
     4e4:	83 ec 08             	sub    $0x8,%esp
     4e7:	ff 75 0c             	pushl  0xc(%ebp)
     4ea:	ff 75 f4             	pushl  -0xc(%ebp)
     4ed:	e8 03 01 00 00       	call   5f5 <fstat>
     4f2:	83 c4 10             	add    $0x10,%esp
     4f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     4f8:	83 ec 0c             	sub    $0xc,%esp
     4fb:	ff 75 f4             	pushl  -0xc(%ebp)
     4fe:	e8 c2 00 00 00       	call   5c5 <close>
     503:	83 c4 10             	add    $0x10,%esp
  return r;
     506:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     509:	c9                   	leave  
     50a:	c3                   	ret    

0000050b <atoi>:

int
atoi(const char *s)
{
     50b:	55                   	push   %ebp
     50c:	89 e5                	mov    %esp,%ebp
     50e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     511:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     518:	eb 25                	jmp    53f <atoi+0x34>
    n = n*10 + *s++ - '0';
     51a:	8b 55 fc             	mov    -0x4(%ebp),%edx
     51d:	89 d0                	mov    %edx,%eax
     51f:	c1 e0 02             	shl    $0x2,%eax
     522:	01 d0                	add    %edx,%eax
     524:	01 c0                	add    %eax,%eax
     526:	89 c1                	mov    %eax,%ecx
     528:	8b 45 08             	mov    0x8(%ebp),%eax
     52b:	8d 50 01             	lea    0x1(%eax),%edx
     52e:	89 55 08             	mov    %edx,0x8(%ebp)
     531:	0f b6 00             	movzbl (%eax),%eax
     534:	0f be c0             	movsbl %al,%eax
     537:	01 c8                	add    %ecx,%eax
     539:	83 e8 30             	sub    $0x30,%eax
     53c:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     53f:	8b 45 08             	mov    0x8(%ebp),%eax
     542:	0f b6 00             	movzbl (%eax),%eax
     545:	3c 2f                	cmp    $0x2f,%al
     547:	7e 0a                	jle    553 <atoi+0x48>
     549:	8b 45 08             	mov    0x8(%ebp),%eax
     54c:	0f b6 00             	movzbl (%eax),%eax
     54f:	3c 39                	cmp    $0x39,%al
     551:	7e c7                	jle    51a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     553:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     556:	c9                   	leave  
     557:	c3                   	ret    

00000558 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     558:	55                   	push   %ebp
     559:	89 e5                	mov    %esp,%ebp
     55b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     55e:	8b 45 08             	mov    0x8(%ebp),%eax
     561:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     564:	8b 45 0c             	mov    0xc(%ebp),%eax
     567:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     56a:	eb 17                	jmp    583 <memmove+0x2b>
    *dst++ = *src++;
     56c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     56f:	8d 50 01             	lea    0x1(%eax),%edx
     572:	89 55 fc             	mov    %edx,-0x4(%ebp)
     575:	8b 55 f8             	mov    -0x8(%ebp),%edx
     578:	8d 4a 01             	lea    0x1(%edx),%ecx
     57b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     57e:	0f b6 12             	movzbl (%edx),%edx
     581:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     583:	8b 45 10             	mov    0x10(%ebp),%eax
     586:	8d 50 ff             	lea    -0x1(%eax),%edx
     589:	89 55 10             	mov    %edx,0x10(%ebp)
     58c:	85 c0                	test   %eax,%eax
     58e:	7f dc                	jg     56c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     590:	8b 45 08             	mov    0x8(%ebp),%eax
}
     593:	c9                   	leave  
     594:	c3                   	ret    

00000595 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     595:	b8 01 00 00 00       	mov    $0x1,%eax
     59a:	cd 40                	int    $0x40
     59c:	c3                   	ret    

0000059d <exit>:
SYSCALL(exit)
     59d:	b8 02 00 00 00       	mov    $0x2,%eax
     5a2:	cd 40                	int    $0x40
     5a4:	c3                   	ret    

000005a5 <wait>:
SYSCALL(wait)
     5a5:	b8 03 00 00 00       	mov    $0x3,%eax
     5aa:	cd 40                	int    $0x40
     5ac:	c3                   	ret    

000005ad <pipe>:
SYSCALL(pipe)
     5ad:	b8 04 00 00 00       	mov    $0x4,%eax
     5b2:	cd 40                	int    $0x40
     5b4:	c3                   	ret    

000005b5 <read>:
SYSCALL(read)
     5b5:	b8 05 00 00 00       	mov    $0x5,%eax
     5ba:	cd 40                	int    $0x40
     5bc:	c3                   	ret    

000005bd <write>:
SYSCALL(write)
     5bd:	b8 10 00 00 00       	mov    $0x10,%eax
     5c2:	cd 40                	int    $0x40
     5c4:	c3                   	ret    

000005c5 <close>:
SYSCALL(close)
     5c5:	b8 15 00 00 00       	mov    $0x15,%eax
     5ca:	cd 40                	int    $0x40
     5cc:	c3                   	ret    

000005cd <kill>:
SYSCALL(kill)
     5cd:	b8 06 00 00 00       	mov    $0x6,%eax
     5d2:	cd 40                	int    $0x40
     5d4:	c3                   	ret    

000005d5 <exec>:
SYSCALL(exec)
     5d5:	b8 07 00 00 00       	mov    $0x7,%eax
     5da:	cd 40                	int    $0x40
     5dc:	c3                   	ret    

000005dd <open>:
SYSCALL(open)
     5dd:	b8 0f 00 00 00       	mov    $0xf,%eax
     5e2:	cd 40                	int    $0x40
     5e4:	c3                   	ret    

000005e5 <mknod>:
SYSCALL(mknod)
     5e5:	b8 11 00 00 00       	mov    $0x11,%eax
     5ea:	cd 40                	int    $0x40
     5ec:	c3                   	ret    

000005ed <unlink>:
SYSCALL(unlink)
     5ed:	b8 12 00 00 00       	mov    $0x12,%eax
     5f2:	cd 40                	int    $0x40
     5f4:	c3                   	ret    

000005f5 <fstat>:
SYSCALL(fstat)
     5f5:	b8 08 00 00 00       	mov    $0x8,%eax
     5fa:	cd 40                	int    $0x40
     5fc:	c3                   	ret    

000005fd <link>:
SYSCALL(link)
     5fd:	b8 13 00 00 00       	mov    $0x13,%eax
     602:	cd 40                	int    $0x40
     604:	c3                   	ret    

00000605 <mkdir>:
SYSCALL(mkdir)
     605:	b8 14 00 00 00       	mov    $0x14,%eax
     60a:	cd 40                	int    $0x40
     60c:	c3                   	ret    

0000060d <chdir>:
SYSCALL(chdir)
     60d:	b8 09 00 00 00       	mov    $0x9,%eax
     612:	cd 40                	int    $0x40
     614:	c3                   	ret    

00000615 <dup>:
SYSCALL(dup)
     615:	b8 0a 00 00 00       	mov    $0xa,%eax
     61a:	cd 40                	int    $0x40
     61c:	c3                   	ret    

0000061d <getpid>:
SYSCALL(getpid)
     61d:	b8 0b 00 00 00       	mov    $0xb,%eax
     622:	cd 40                	int    $0x40
     624:	c3                   	ret    

00000625 <sbrk>:
SYSCALL(sbrk)
     625:	b8 0c 00 00 00       	mov    $0xc,%eax
     62a:	cd 40                	int    $0x40
     62c:	c3                   	ret    

0000062d <sleep>:
SYSCALL(sleep)
     62d:	b8 0d 00 00 00       	mov    $0xd,%eax
     632:	cd 40                	int    $0x40
     634:	c3                   	ret    

00000635 <uptime>:
SYSCALL(uptime)
     635:	b8 0e 00 00 00       	mov    $0xe,%eax
     63a:	cd 40                	int    $0x40
     63c:	c3                   	ret    

0000063d <colorwrite>:

//new here
SYSCALL(colorwrite)
     63d:	b8 16 00 00 00       	mov    $0x16,%eax
     642:	cd 40                	int    $0x40
     644:	c3                   	ret    

00000645 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     645:	55                   	push   %ebp
     646:	89 e5                	mov    %esp,%ebp
     648:	83 ec 18             	sub    $0x18,%esp
     64b:	8b 45 0c             	mov    0xc(%ebp),%eax
     64e:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     651:	83 ec 04             	sub    $0x4,%esp
     654:	6a 01                	push   $0x1
     656:	8d 45 f4             	lea    -0xc(%ebp),%eax
     659:	50                   	push   %eax
     65a:	ff 75 08             	pushl  0x8(%ebp)
     65d:	e8 5b ff ff ff       	call   5bd <write>
     662:	83 c4 10             	add    $0x10,%esp
}
     665:	90                   	nop
     666:	c9                   	leave  
     667:	c3                   	ret    

00000668 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     668:	55                   	push   %ebp
     669:	89 e5                	mov    %esp,%ebp
     66b:	53                   	push   %ebx
     66c:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     66f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     676:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     67a:	74 17                	je     693 <printint+0x2b>
     67c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     680:	79 11                	jns    693 <printint+0x2b>
    neg = 1;
     682:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     689:	8b 45 0c             	mov    0xc(%ebp),%eax
     68c:	f7 d8                	neg    %eax
     68e:	89 45 ec             	mov    %eax,-0x14(%ebp)
     691:	eb 06                	jmp    699 <printint+0x31>
  } else {
    x = xx;
     693:	8b 45 0c             	mov    0xc(%ebp),%eax
     696:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     699:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     6a0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     6a3:	8d 41 01             	lea    0x1(%ecx),%eax
     6a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
     6a9:	8b 5d 10             	mov    0x10(%ebp),%ebx
     6ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
     6af:	ba 00 00 00 00       	mov    $0x0,%edx
     6b4:	f7 f3                	div    %ebx
     6b6:	89 d0                	mov    %edx,%eax
     6b8:	0f b6 80 00 46 00 00 	movzbl 0x4600(%eax),%eax
     6bf:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     6c3:	8b 5d 10             	mov    0x10(%ebp),%ebx
     6c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
     6c9:	ba 00 00 00 00       	mov    $0x0,%edx
     6ce:	f7 f3                	div    %ebx
     6d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
     6d3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     6d7:	75 c7                	jne    6a0 <printint+0x38>
  if(neg)
     6d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     6dd:	74 2d                	je     70c <printint+0xa4>
    buf[i++] = '-';
     6df:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6e2:	8d 50 01             	lea    0x1(%eax),%edx
     6e5:	89 55 f4             	mov    %edx,-0xc(%ebp)
     6e8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     6ed:	eb 1d                	jmp    70c <printint+0xa4>
    putc(fd, buf[i]);
     6ef:	8d 55 dc             	lea    -0x24(%ebp),%edx
     6f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6f5:	01 d0                	add    %edx,%eax
     6f7:	0f b6 00             	movzbl (%eax),%eax
     6fa:	0f be c0             	movsbl %al,%eax
     6fd:	83 ec 08             	sub    $0x8,%esp
     700:	50                   	push   %eax
     701:	ff 75 08             	pushl  0x8(%ebp)
     704:	e8 3c ff ff ff       	call   645 <putc>
     709:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     70c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     710:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     714:	79 d9                	jns    6ef <printint+0x87>
    putc(fd, buf[i]);
}
     716:	90                   	nop
     717:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     71a:	c9                   	leave  
     71b:	c3                   	ret    

0000071c <getInteger>:

static int getInteger(double num)
{
     71c:	55                   	push   %ebp
     71d:	89 e5                	mov    %esp,%ebp
     71f:	83 ec 18             	sub    $0x18,%esp
     722:	8b 45 08             	mov    0x8(%ebp),%eax
     725:	89 45 e8             	mov    %eax,-0x18(%ebp)
     728:	8b 45 0c             	mov    0xc(%ebp),%eax
     72b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     72e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     735:	eb 0e                	jmp    745 <getInteger+0x29>
  {
    num -= 1;
     737:	dd 45 e8             	fldl   -0x18(%ebp)
     73a:	d9 e8                	fld1   
     73c:	de e9                	fsubrp %st,%st(1)
     73e:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     741:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     745:	dd 45 e8             	fldl   -0x18(%ebp)
     748:	d9 e8                	fld1   
     74a:	d9 c9                	fxch   %st(1)
     74c:	df e9                	fucomip %st(1),%st
     74e:	dd d8                	fstp   %st(0)
     750:	77 e5                	ja     737 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     752:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     755:	c9                   	leave  
     756:	c3                   	ret    

00000757 <printdbl>:

void printdbl(int fd, double num)
{
     757:	55                   	push   %ebp
     758:	89 e5                	mov    %esp,%ebp
     75a:	83 ec 28             	sub    $0x28,%esp
     75d:	8b 45 0c             	mov    0xc(%ebp),%eax
     760:	89 45 e0             	mov    %eax,-0x20(%ebp)
     763:	8b 45 10             	mov    0x10(%ebp),%eax
     766:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     769:	d9 ee                	fldz   
     76b:	dd 45 e0             	fldl   -0x20(%ebp)
     76e:	d9 c9                	fxch   %st(1)
     770:	df e9                	fucomip %st(1),%st
     772:	dd d8                	fstp   %st(0)
     774:	76 18                	jbe    78e <printdbl+0x37>
  {
    putc(fd,'-');
     776:	83 ec 08             	sub    $0x8,%esp
     779:	6a 2d                	push   $0x2d
     77b:	ff 75 08             	pushl  0x8(%ebp)
     77e:	e8 c2 fe ff ff       	call   645 <putc>
     783:	83 c4 10             	add    $0x10,%esp
    num = -num;
     786:	dd 45 e0             	fldl   -0x20(%ebp)
     789:	d9 e0                	fchs   
     78b:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     78e:	83 ec 08             	sub    $0x8,%esp
     791:	ff 75 e4             	pushl  -0x1c(%ebp)
     794:	ff 75 e0             	pushl  -0x20(%ebp)
     797:	e8 80 ff ff ff       	call   71c <getInteger>
     79c:	83 c4 10             	add    $0x10,%esp
     79f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     7a2:	6a 01                	push   $0x1
     7a4:	6a 0a                	push   $0xa
     7a6:	ff 75 f0             	pushl  -0x10(%ebp)
     7a9:	ff 75 08             	pushl  0x8(%ebp)
     7ac:	e8 b7 fe ff ff       	call   668 <printint>
     7b1:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     7b4:	db 45 f0             	fildl  -0x10(%ebp)
     7b7:	dd 45 e0             	fldl   -0x20(%ebp)
     7ba:	de e1                	fsubp  %st,%st(1)
     7bc:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     7bf:	dd 45 e0             	fldl   -0x20(%ebp)
     7c2:	dd 05 90 39 00 00    	fldl   0x3990
     7c8:	d9 c9                	fxch   %st(1)
     7ca:	df e9                	fucomip %st(1),%st
     7cc:	dd d8                	fstp   %st(0)
     7ce:	76 10                	jbe    7e0 <printdbl+0x89>
    putc(fd,'.');
     7d0:	83 ec 08             	sub    $0x8,%esp
     7d3:	6a 2e                	push   $0x2e
     7d5:	ff 75 08             	pushl  0x8(%ebp)
     7d8:	e8 68 fe ff ff       	call   645 <putc>
     7dd:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     7e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     7e7:	eb 49                	jmp    832 <printdbl+0xdb>
  {
    num = num*10;
     7e9:	dd 45 e0             	fldl   -0x20(%ebp)
     7ec:	dd 05 98 39 00 00    	fldl   0x3998
     7f2:	de c9                	fmulp  %st,%st(1)
     7f4:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     7f7:	83 ec 08             	sub    $0x8,%esp
     7fa:	ff 75 e4             	pushl  -0x1c(%ebp)
     7fd:	ff 75 e0             	pushl  -0x20(%ebp)
     800:	e8 17 ff ff ff       	call   71c <getInteger>
     805:	83 c4 10             	add    $0x10,%esp
     808:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     80b:	6a 01                	push   $0x1
     80d:	6a 0a                	push   $0xa
     80f:	ff 75 f0             	pushl  -0x10(%ebp)
     812:	ff 75 08             	pushl  0x8(%ebp)
     815:	e8 4e fe ff ff       	call   668 <printint>
     81a:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     81d:	db 45 f0             	fildl  -0x10(%ebp)
     820:	dd 45 e0             	fldl   -0x20(%ebp)
     823:	de e1                	fsubp  %st,%st(1)
     825:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     828:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     82c:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     830:	7f 13                	jg     845 <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     832:	dd 45 e0             	fldl   -0x20(%ebp)
     835:	dd 05 90 39 00 00    	fldl   0x3990
     83b:	d9 c9                	fxch   %st(1)
     83d:	df e9                	fucomip %st(1),%st
     83f:	dd d8                	fstp   %st(0)
     841:	77 a6                	ja     7e9 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     843:	eb 01                	jmp    846 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     845:	90                   	nop
    }
  }
}
     846:	90                   	nop
     847:	c9                   	leave  
     848:	c3                   	ret    

00000849 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     849:	55                   	push   %ebp
     84a:	89 e5                	mov    %esp,%ebp
     84c:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     84f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     856:	8d 45 0c             	lea    0xc(%ebp),%eax
     859:	83 c0 04             	add    $0x4,%eax
     85c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     85f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     866:	e9 88 01 00 00       	jmp    9f3 <printf+0x1aa>
    c = fmt[i] & 0xff;
     86b:	8b 55 0c             	mov    0xc(%ebp),%edx
     86e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     871:	01 d0                	add    %edx,%eax
     873:	0f b6 00             	movzbl (%eax),%eax
     876:	0f be c0             	movsbl %al,%eax
     879:	25 ff 00 00 00       	and    $0xff,%eax
     87e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     881:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     885:	75 2c                	jne    8b3 <printf+0x6a>
      if(c == '%'){
     887:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     88b:	75 0c                	jne    899 <printf+0x50>
        state = '%';
     88d:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     894:	e9 56 01 00 00       	jmp    9ef <printf+0x1a6>
      } else {
        putc(fd, c);
     899:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     89c:	0f be c0             	movsbl %al,%eax
     89f:	83 ec 08             	sub    $0x8,%esp
     8a2:	50                   	push   %eax
     8a3:	ff 75 08             	pushl  0x8(%ebp)
     8a6:	e8 9a fd ff ff       	call   645 <putc>
     8ab:	83 c4 10             	add    $0x10,%esp
     8ae:	e9 3c 01 00 00       	jmp    9ef <printf+0x1a6>
      }
    } else if(state == '%'){
     8b3:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     8b7:	0f 85 32 01 00 00    	jne    9ef <printf+0x1a6>
      if(c == 'd'){
     8bd:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     8c1:	75 1e                	jne    8e1 <printf+0x98>
        printint(fd, *ap, 10, 1);
     8c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
     8c6:	8b 00                	mov    (%eax),%eax
     8c8:	6a 01                	push   $0x1
     8ca:	6a 0a                	push   $0xa
     8cc:	50                   	push   %eax
     8cd:	ff 75 08             	pushl  0x8(%ebp)
     8d0:	e8 93 fd ff ff       	call   668 <printint>
     8d5:	83 c4 10             	add    $0x10,%esp
        ap++;
     8d8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     8dc:	e9 07 01 00 00       	jmp    9e8 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     8e1:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     8e5:	74 06                	je     8ed <printf+0xa4>
     8e7:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     8eb:	75 1e                	jne    90b <printf+0xc2>
        printint(fd, *ap, 16, 0);
     8ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
     8f0:	8b 00                	mov    (%eax),%eax
     8f2:	6a 00                	push   $0x0
     8f4:	6a 10                	push   $0x10
     8f6:	50                   	push   %eax
     8f7:	ff 75 08             	pushl  0x8(%ebp)
     8fa:	e8 69 fd ff ff       	call   668 <printint>
     8ff:	83 c4 10             	add    $0x10,%esp
        ap++;
     902:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     906:	e9 dd 00 00 00       	jmp    9e8 <printf+0x19f>
      } else if(c == 's'){
     90b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     90f:	75 46                	jne    957 <printf+0x10e>
        s = (char*)*ap;
     911:	8b 45 e8             	mov    -0x18(%ebp),%eax
     914:	8b 00                	mov    (%eax),%eax
     916:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     919:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     91d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     921:	75 25                	jne    948 <printf+0xff>
          s = "(null)";
     923:	c7 45 f4 88 39 00 00 	movl   $0x3988,-0xc(%ebp)
        while(*s != 0){
     92a:	eb 1c                	jmp    948 <printf+0xff>
          putc(fd, *s);
     92c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     92f:	0f b6 00             	movzbl (%eax),%eax
     932:	0f be c0             	movsbl %al,%eax
     935:	83 ec 08             	sub    $0x8,%esp
     938:	50                   	push   %eax
     939:	ff 75 08             	pushl  0x8(%ebp)
     93c:	e8 04 fd ff ff       	call   645 <putc>
     941:	83 c4 10             	add    $0x10,%esp
          s++;
     944:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     948:	8b 45 f4             	mov    -0xc(%ebp),%eax
     94b:	0f b6 00             	movzbl (%eax),%eax
     94e:	84 c0                	test   %al,%al
     950:	75 da                	jne    92c <printf+0xe3>
     952:	e9 91 00 00 00       	jmp    9e8 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     957:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     95b:	75 1d                	jne    97a <printf+0x131>
        putc(fd, *ap);
     95d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     960:	8b 00                	mov    (%eax),%eax
     962:	0f be c0             	movsbl %al,%eax
     965:	83 ec 08             	sub    $0x8,%esp
     968:	50                   	push   %eax
     969:	ff 75 08             	pushl  0x8(%ebp)
     96c:	e8 d4 fc ff ff       	call   645 <putc>
     971:	83 c4 10             	add    $0x10,%esp
        ap++;
     974:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     978:	eb 6e                	jmp    9e8 <printf+0x19f>
      } else if(c == '%'){
     97a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     97e:	75 17                	jne    997 <printf+0x14e>
        putc(fd, c);
     980:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     983:	0f be c0             	movsbl %al,%eax
     986:	83 ec 08             	sub    $0x8,%esp
     989:	50                   	push   %eax
     98a:	ff 75 08             	pushl  0x8(%ebp)
     98d:	e8 b3 fc ff ff       	call   645 <putc>
     992:	83 c4 10             	add    $0x10,%esp
     995:	eb 51                	jmp    9e8 <printf+0x19f>
      } else if(c == 'f'){ //for double
     997:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     99b:	75 26                	jne    9c3 <printf+0x17a>
        double *dap = (double*)ap;
     99d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     9a0:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     9a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
     9a6:	dd 00                	fldl   (%eax)
     9a8:	83 ec 04             	sub    $0x4,%esp
     9ab:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     9af:	dd 1c 24             	fstpl  (%esp)
     9b2:	ff 75 08             	pushl  0x8(%ebp)
     9b5:	e8 9d fd ff ff       	call   757 <printdbl>
     9ba:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     9bd:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     9c1:	eb 25                	jmp    9e8 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9c3:	83 ec 08             	sub    $0x8,%esp
     9c6:	6a 25                	push   $0x25
     9c8:	ff 75 08             	pushl  0x8(%ebp)
     9cb:	e8 75 fc ff ff       	call   645 <putc>
     9d0:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     9d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9d6:	0f be c0             	movsbl %al,%eax
     9d9:	83 ec 08             	sub    $0x8,%esp
     9dc:	50                   	push   %eax
     9dd:	ff 75 08             	pushl  0x8(%ebp)
     9e0:	e8 60 fc ff ff       	call   645 <putc>
     9e5:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     9e8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     9ef:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     9f3:	8b 55 0c             	mov    0xc(%ebp),%edx
     9f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9f9:	01 d0                	add    %edx,%eax
     9fb:	0f b6 00             	movzbl (%eax),%eax
     9fe:	84 c0                	test   %al,%al
     a00:	0f 85 65 fe ff ff    	jne    86b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     a06:	90                   	nop
     a07:	c9                   	leave  
     a08:	c3                   	ret    

00000a09 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     a09:	55                   	push   %ebp
     a0a:	89 e5                	mov    %esp,%ebp
     a0c:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     a0f:	8b 45 08             	mov    0x8(%ebp),%eax
     a12:	83 e8 08             	sub    $0x8,%eax
     a15:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     a18:	a1 58 47 00 00       	mov    0x4758,%eax
     a1d:	89 45 fc             	mov    %eax,-0x4(%ebp)
     a20:	eb 24                	jmp    a46 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     a22:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a25:	8b 00                	mov    (%eax),%eax
     a27:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     a2a:	77 12                	ja     a3e <free+0x35>
     a2c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a2f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     a32:	77 24                	ja     a58 <free+0x4f>
     a34:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a37:	8b 00                	mov    (%eax),%eax
     a39:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     a3c:	77 1a                	ja     a58 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     a3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a41:	8b 00                	mov    (%eax),%eax
     a43:	89 45 fc             	mov    %eax,-0x4(%ebp)
     a46:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a49:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     a4c:	76 d4                	jbe    a22 <free+0x19>
     a4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a51:	8b 00                	mov    (%eax),%eax
     a53:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     a56:	76 ca                	jbe    a22 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     a58:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a5b:	8b 40 04             	mov    0x4(%eax),%eax
     a5e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     a65:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a68:	01 c2                	add    %eax,%edx
     a6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a6d:	8b 00                	mov    (%eax),%eax
     a6f:	39 c2                	cmp    %eax,%edx
     a71:	75 24                	jne    a97 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     a73:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a76:	8b 50 04             	mov    0x4(%eax),%edx
     a79:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a7c:	8b 00                	mov    (%eax),%eax
     a7e:	8b 40 04             	mov    0x4(%eax),%eax
     a81:	01 c2                	add    %eax,%edx
     a83:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a86:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     a89:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a8c:	8b 00                	mov    (%eax),%eax
     a8e:	8b 10                	mov    (%eax),%edx
     a90:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a93:	89 10                	mov    %edx,(%eax)
     a95:	eb 0a                	jmp    aa1 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     a97:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a9a:	8b 10                	mov    (%eax),%edx
     a9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a9f:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     aa1:	8b 45 fc             	mov    -0x4(%ebp),%eax
     aa4:	8b 40 04             	mov    0x4(%eax),%eax
     aa7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     aae:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ab1:	01 d0                	add    %edx,%eax
     ab3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     ab6:	75 20                	jne    ad8 <free+0xcf>
    p->s.size += bp->s.size;
     ab8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     abb:	8b 50 04             	mov    0x4(%eax),%edx
     abe:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ac1:	8b 40 04             	mov    0x4(%eax),%eax
     ac4:	01 c2                	add    %eax,%edx
     ac6:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ac9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     acc:	8b 45 f8             	mov    -0x8(%ebp),%eax
     acf:	8b 10                	mov    (%eax),%edx
     ad1:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ad4:	89 10                	mov    %edx,(%eax)
     ad6:	eb 08                	jmp    ae0 <free+0xd7>
  } else
    p->s.ptr = bp;
     ad8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     adb:	8b 55 f8             	mov    -0x8(%ebp),%edx
     ade:	89 10                	mov    %edx,(%eax)
  freep = p;
     ae0:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ae3:	a3 58 47 00 00       	mov    %eax,0x4758
}
     ae8:	90                   	nop
     ae9:	c9                   	leave  
     aea:	c3                   	ret    

00000aeb <morecore>:

static Header*
morecore(uint nu)
{
     aeb:	55                   	push   %ebp
     aec:	89 e5                	mov    %esp,%ebp
     aee:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     af1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     af8:	77 07                	ja     b01 <morecore+0x16>
    nu = 4096;
     afa:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     b01:	8b 45 08             	mov    0x8(%ebp),%eax
     b04:	c1 e0 03             	shl    $0x3,%eax
     b07:	83 ec 0c             	sub    $0xc,%esp
     b0a:	50                   	push   %eax
     b0b:	e8 15 fb ff ff       	call   625 <sbrk>
     b10:	83 c4 10             	add    $0x10,%esp
     b13:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     b16:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     b1a:	75 07                	jne    b23 <morecore+0x38>
    return 0;
     b1c:	b8 00 00 00 00       	mov    $0x0,%eax
     b21:	eb 26                	jmp    b49 <morecore+0x5e>
  hp = (Header*)p;
     b23:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b26:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     b29:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b2c:	8b 55 08             	mov    0x8(%ebp),%edx
     b2f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     b32:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b35:	83 c0 08             	add    $0x8,%eax
     b38:	83 ec 0c             	sub    $0xc,%esp
     b3b:	50                   	push   %eax
     b3c:	e8 c8 fe ff ff       	call   a09 <free>
     b41:	83 c4 10             	add    $0x10,%esp
  return freep;
     b44:	a1 58 47 00 00       	mov    0x4758,%eax
}
     b49:	c9                   	leave  
     b4a:	c3                   	ret    

00000b4b <malloc>:

void*
malloc(uint nbytes)
{
     b4b:	55                   	push   %ebp
     b4c:	89 e5                	mov    %esp,%ebp
     b4e:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     b51:	8b 45 08             	mov    0x8(%ebp),%eax
     b54:	83 c0 07             	add    $0x7,%eax
     b57:	c1 e8 03             	shr    $0x3,%eax
     b5a:	83 c0 01             	add    $0x1,%eax
     b5d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     b60:	a1 58 47 00 00       	mov    0x4758,%eax
     b65:	89 45 f0             	mov    %eax,-0x10(%ebp)
     b68:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     b6c:	75 23                	jne    b91 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     b6e:	c7 45 f0 50 47 00 00 	movl   $0x4750,-0x10(%ebp)
     b75:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b78:	a3 58 47 00 00       	mov    %eax,0x4758
     b7d:	a1 58 47 00 00       	mov    0x4758,%eax
     b82:	a3 50 47 00 00       	mov    %eax,0x4750
    base.s.size = 0;
     b87:	c7 05 54 47 00 00 00 	movl   $0x0,0x4754
     b8e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     b91:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b94:	8b 00                	mov    (%eax),%eax
     b96:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     b99:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b9c:	8b 40 04             	mov    0x4(%eax),%eax
     b9f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     ba2:	72 4d                	jb     bf1 <malloc+0xa6>
      if(p->s.size == nunits)
     ba4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ba7:	8b 40 04             	mov    0x4(%eax),%eax
     baa:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     bad:	75 0c                	jne    bbb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     baf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bb2:	8b 10                	mov    (%eax),%edx
     bb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bb7:	89 10                	mov    %edx,(%eax)
     bb9:	eb 26                	jmp    be1 <malloc+0x96>
      else {
        p->s.size -= nunits;
     bbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bbe:	8b 40 04             	mov    0x4(%eax),%eax
     bc1:	2b 45 ec             	sub    -0x14(%ebp),%eax
     bc4:	89 c2                	mov    %eax,%edx
     bc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bc9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     bcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bcf:	8b 40 04             	mov    0x4(%eax),%eax
     bd2:	c1 e0 03             	shl    $0x3,%eax
     bd5:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     bd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bdb:	8b 55 ec             	mov    -0x14(%ebp),%edx
     bde:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     be1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     be4:	a3 58 47 00 00       	mov    %eax,0x4758
      return (void*)(p + 1);
     be9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bec:	83 c0 08             	add    $0x8,%eax
     bef:	eb 3b                	jmp    c2c <malloc+0xe1>
    }
    if(p == freep)
     bf1:	a1 58 47 00 00       	mov    0x4758,%eax
     bf6:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     bf9:	75 1e                	jne    c19 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     bfb:	83 ec 0c             	sub    $0xc,%esp
     bfe:	ff 75 ec             	pushl  -0x14(%ebp)
     c01:	e8 e5 fe ff ff       	call   aeb <morecore>
     c06:	83 c4 10             	add    $0x10,%esp
     c09:	89 45 f4             	mov    %eax,-0xc(%ebp)
     c0c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     c10:	75 07                	jne    c19 <malloc+0xce>
        return 0;
     c12:	b8 00 00 00 00       	mov    $0x0,%eax
     c17:	eb 13                	jmp    c2c <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     c19:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c1c:	89 45 f0             	mov    %eax,-0x10(%ebp)
     c1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c22:	8b 00                	mov    (%eax),%eax
     c24:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     c27:	e9 6d ff ff ff       	jmp    b99 <malloc+0x4e>
}
     c2c:	c9                   	leave  
     c2d:	c3                   	ret    

00000c2e <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     c2e:	55                   	push   %ebp
     c2f:	89 e5                	mov    %esp,%ebp
     c31:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     c34:	83 ec 04             	sub    $0x4,%esp
     c37:	ff 75 08             	pushl  0x8(%ebp)
     c3a:	68 a0 39 00 00       	push   $0x39a0
     c3f:	6a 02                	push   $0x2
     c41:	e8 03 fc ff ff       	call   849 <printf>
     c46:	83 c4 10             	add    $0x10,%esp
  exit();
     c49:	e8 4f f9 ff ff       	call   59d <exit>

00000c4e <getInteger>:
}

static int getInteger(double num)
{
     c4e:	55                   	push   %ebp
     c4f:	89 e5                	mov    %esp,%ebp
     c51:	83 ec 18             	sub    $0x18,%esp
     c54:	8b 45 08             	mov    0x8(%ebp),%eax
     c57:	89 45 e8             	mov    %eax,-0x18(%ebp)
     c5a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c5d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     c60:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     c67:	eb 0e                	jmp    c77 <getInteger+0x29>
  {
    num -= 1;
     c69:	dd 45 e8             	fldl   -0x18(%ebp)
     c6c:	d9 e8                	fld1   
     c6e:	de e9                	fsubrp %st,%st(1)
     c70:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     c73:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     c77:	dd 45 e8             	fldl   -0x18(%ebp)
     c7a:	d9 e8                	fld1   
     c7c:	d9 c9                	fxch   %st(1)
     c7e:	df e9                	fucomip %st(1),%st
     c80:	dd d8                	fstp   %st(0)
     c82:	77 e5                	ja     c69 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     c84:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     c87:	c9                   	leave  
     c88:	c3                   	ret    

00000c89 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     c89:	55                   	push   %ebp
     c8a:	89 e5                	mov    %esp,%ebp
     c8c:	53                   	push   %ebx
     c8d:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     c90:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     c97:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     c9b:	74 17                	je     cb4 <int2str+0x2b>
     c9d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     ca1:	79 11                	jns    cb4 <int2str+0x2b>
    neg = 1;
     ca3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     caa:	8b 45 0c             	mov    0xc(%ebp),%eax
     cad:	f7 d8                	neg    %eax
     caf:	89 45 f0             	mov    %eax,-0x10(%ebp)
     cb2:	eb 06                	jmp    cba <int2str+0x31>
  } else {
    x = num;
     cb4:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     cba:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     cc1:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     cc4:	8d 41 01             	lea    0x1(%ecx),%eax
     cc7:	89 45 f8             	mov    %eax,-0x8(%ebp)
     cca:	8b 5d 14             	mov    0x14(%ebp),%ebx
     ccd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cd0:	ba 00 00 00 00       	mov    $0x0,%edx
     cd5:	f7 f3                	div    %ebx
     cd7:	89 d0                	mov    %edx,%eax
     cd9:	0f b6 80 14 46 00 00 	movzbl 0x4614(%eax),%eax
     ce0:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     ce4:	8b 5d 14             	mov    0x14(%ebp),%ebx
     ce7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cea:	ba 00 00 00 00       	mov    $0x0,%edx
     cef:	f7 f3                	div    %ebx
     cf1:	89 45 f0             	mov    %eax,-0x10(%ebp)
     cf4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     cf8:	75 c7                	jne    cc1 <int2str+0x38>
  if(neg)
     cfa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     cfe:	74 36                	je     d36 <int2str+0xad>
    buf[i++] = '-';
     d00:	8b 45 f8             	mov    -0x8(%ebp),%eax
     d03:	8d 50 01             	lea    0x1(%eax),%edx
     d06:	89 55 f8             	mov    %edx,-0x8(%ebp)
     d09:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     d0e:	eb 26                	jmp    d36 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     d10:	8b 45 10             	mov    0x10(%ebp),%eax
     d13:	8b 00                	mov    (%eax),%eax
     d15:	89 c2                	mov    %eax,%edx
     d17:	8b 45 08             	mov    0x8(%ebp),%eax
     d1a:	01 c2                	add    %eax,%edx
     d1c:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     d1f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     d22:	01 c8                	add    %ecx,%eax
     d24:	0f b6 00             	movzbl (%eax),%eax
     d27:	88 02                	mov    %al,(%edx)
    (*pos)++;
     d29:	8b 45 10             	mov    0x10(%ebp),%eax
     d2c:	8b 00                	mov    (%eax),%eax
     d2e:	8d 50 01             	lea    0x1(%eax),%edx
     d31:	8b 45 10             	mov    0x10(%ebp),%eax
     d34:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     d36:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     d3a:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     d3e:	79 d0                	jns    d10 <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     d40:	90                   	nop
     d41:	83 c4 20             	add    $0x20,%esp
     d44:	5b                   	pop    %ebx
     d45:	5d                   	pop    %ebp
     d46:	c3                   	ret    

00000d47 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     d47:	55                   	push   %ebp
     d48:	89 e5                	mov    %esp,%ebp
     d4a:	83 ec 18             	sub    $0x18,%esp
     d4d:	8b 45 0c             	mov    0xc(%ebp),%eax
     d50:	89 45 e8             	mov    %eax,-0x18(%ebp)
     d53:	8b 45 10             	mov    0x10(%ebp),%eax
     d56:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     d59:	d9 ee                	fldz   
     d5b:	dd 45 e8             	fldl   -0x18(%ebp)
     d5e:	d9 c9                	fxch   %st(1)
     d60:	df e9                	fucomip %st(1),%st
     d62:	dd d8                	fstp   %st(0)
     d64:	76 24                	jbe    d8a <double2str+0x43>
  {
    buf[*pos] = '-';
     d66:	8b 45 14             	mov    0x14(%ebp),%eax
     d69:	8b 00                	mov    (%eax),%eax
     d6b:	89 c2                	mov    %eax,%edx
     d6d:	8b 45 08             	mov    0x8(%ebp),%eax
     d70:	01 d0                	add    %edx,%eax
     d72:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     d75:	8b 45 14             	mov    0x14(%ebp),%eax
     d78:	8b 00                	mov    (%eax),%eax
     d7a:	8d 50 01             	lea    0x1(%eax),%edx
     d7d:	8b 45 14             	mov    0x14(%ebp),%eax
     d80:	89 10                	mov    %edx,(%eax)
    num = -num;
     d82:	dd 45 e8             	fldl   -0x18(%ebp)
     d85:	d9 e0                	fchs   
     d87:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     d8a:	ff 75 ec             	pushl  -0x14(%ebp)
     d8d:	ff 75 e8             	pushl  -0x18(%ebp)
     d90:	e8 b9 fe ff ff       	call   c4e <getInteger>
     d95:	83 c4 08             	add    $0x8,%esp
     d98:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     d9b:	83 ec 04             	sub    $0x4,%esp
     d9e:	6a 01                	push   $0x1
     da0:	6a 0a                	push   $0xa
     da2:	ff 75 14             	pushl  0x14(%ebp)
     da5:	ff 75 f8             	pushl  -0x8(%ebp)
     da8:	ff 75 08             	pushl  0x8(%ebp)
     dab:	e8 d9 fe ff ff       	call   c89 <int2str>
     db0:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     db3:	db 45 f8             	fildl  -0x8(%ebp)
     db6:	dd 45 e8             	fldl   -0x18(%ebp)
     db9:	de e1                	fsubp  %st,%st(1)
     dbb:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     dbe:	dd 45 e8             	fldl   -0x18(%ebp)
     dc1:	dd 05 a8 39 00 00    	fldl   0x39a8
     dc7:	d9 c9                	fxch   %st(1)
     dc9:	df e9                	fucomip %st(1),%st
     dcb:	dd d8                	fstp   %st(0)
     dcd:	76 1c                	jbe    deb <double2str+0xa4>
  {
    buf[*pos] = '.';
     dcf:	8b 45 14             	mov    0x14(%ebp),%eax
     dd2:	8b 00                	mov    (%eax),%eax
     dd4:	89 c2                	mov    %eax,%edx
     dd6:	8b 45 08             	mov    0x8(%ebp),%eax
     dd9:	01 d0                	add    %edx,%eax
     ddb:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     dde:	8b 45 14             	mov    0x14(%ebp),%eax
     de1:	8b 00                	mov    (%eax),%eax
     de3:	8d 50 01             	lea    0x1(%eax),%edx
     de6:	8b 45 14             	mov    0x14(%ebp),%eax
     de9:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     deb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     df2:	eb 4c                	jmp    e40 <double2str+0xf9>
  {
    num = num*10;
     df4:	dd 45 e8             	fldl   -0x18(%ebp)
     df7:	dd 05 b0 39 00 00    	fldl   0x39b0
     dfd:	de c9                	fmulp  %st,%st(1)
     dff:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     e02:	ff 75 ec             	pushl  -0x14(%ebp)
     e05:	ff 75 e8             	pushl  -0x18(%ebp)
     e08:	e8 41 fe ff ff       	call   c4e <getInteger>
     e0d:	83 c4 08             	add    $0x8,%esp
     e10:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     e13:	83 ec 04             	sub    $0x4,%esp
     e16:	6a 01                	push   $0x1
     e18:	6a 0a                	push   $0xa
     e1a:	ff 75 14             	pushl  0x14(%ebp)
     e1d:	ff 75 f8             	pushl  -0x8(%ebp)
     e20:	ff 75 08             	pushl  0x8(%ebp)
     e23:	e8 61 fe ff ff       	call   c89 <int2str>
     e28:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     e2b:	db 45 f8             	fildl  -0x8(%ebp)
     e2e:	dd 45 e8             	fldl   -0x18(%ebp)
     e31:	de e1                	fsubp  %st,%st(1)
     e33:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     e36:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     e3a:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     e3e:	7f 13                	jg     e53 <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     e40:	dd 45 e8             	fldl   -0x18(%ebp)
     e43:	dd 05 a8 39 00 00    	fldl   0x39a8
     e49:	d9 c9                	fxch   %st(1)
     e4b:	df e9                	fucomip %st(1),%st
     e4d:	dd d8                	fstp   %st(0)
     e4f:	77 a3                	ja     df4 <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     e51:	eb 01                	jmp    e54 <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     e53:	90                   	nop
    }
  }
}
     e54:	90                   	nop
     e55:	c9                   	leave  
     e56:	c3                   	ret    

00000e57 <pow>:

double pow(double opnd, int power)
{
     e57:	55                   	push   %ebp
     e58:	89 e5                	mov    %esp,%ebp
     e5a:	83 ec 18             	sub    $0x18,%esp
     e5d:	8b 45 08             	mov    0x8(%ebp),%eax
     e60:	89 45 e8             	mov    %eax,-0x18(%ebp)
     e63:	8b 45 0c             	mov    0xc(%ebp),%eax
     e66:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     e69:	d9 e8                	fld1   
     e6b:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     e6e:	eb 0d                	jmp    e7d <pow+0x26>
  {
    result *= opnd;
     e70:	dd 45 f8             	fldl   -0x8(%ebp)
     e73:	dc 4d e8             	fmull  -0x18(%ebp)
     e76:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     e79:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     e7d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     e81:	7f ed                	jg     e70 <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     e83:	dd 45 f8             	fldl   -0x8(%ebp)
}
     e86:	c9                   	leave  
     e87:	c3                   	ret    

00000e88 <Translation>:

double Translation(char *s, int* pos)
{
     e88:	55                   	push   %ebp
     e89:	89 e5                	mov    %esp,%ebp
     e8b:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     e8e:	d9 ee                	fldz   
     e90:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     e93:	d9 ee                	fldz   
     e95:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     e98:	eb 3e                	jmp    ed8 <Translation+0x50>
    {
        integer *= 10;
     e9a:	dd 45 f8             	fldl   -0x8(%ebp)
     e9d:	dd 05 b0 39 00 00    	fldl   0x39b0
     ea3:	de c9                	fmulp  %st,%st(1)
     ea5:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     ea8:	8b 45 0c             	mov    0xc(%ebp),%eax
     eab:	8b 00                	mov    (%eax),%eax
     ead:	89 c2                	mov    %eax,%edx
     eaf:	8b 45 08             	mov    0x8(%ebp),%eax
     eb2:	01 d0                	add    %edx,%eax
     eb4:	0f b6 00             	movzbl (%eax),%eax
     eb7:	0f be c0             	movsbl %al,%eax
     eba:	83 e8 30             	sub    $0x30,%eax
     ebd:	89 45 dc             	mov    %eax,-0x24(%ebp)
     ec0:	db 45 dc             	fildl  -0x24(%ebp)
     ec3:	dd 45 f8             	fldl   -0x8(%ebp)
     ec6:	de c1                	faddp  %st,%st(1)
     ec8:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     ecb:	8b 45 0c             	mov    0xc(%ebp),%eax
     ece:	8b 00                	mov    (%eax),%eax
     ed0:	8d 50 01             	lea    0x1(%eax),%edx
     ed3:	8b 45 0c             	mov    0xc(%ebp),%eax
     ed6:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     ed8:	8b 45 0c             	mov    0xc(%ebp),%eax
     edb:	8b 00                	mov    (%eax),%eax
     edd:	89 c2                	mov    %eax,%edx
     edf:	8b 45 08             	mov    0x8(%ebp),%eax
     ee2:	01 d0                	add    %edx,%eax
     ee4:	0f b6 00             	movzbl (%eax),%eax
     ee7:	3c 2f                	cmp    $0x2f,%al
     ee9:	7e 13                	jle    efe <Translation+0x76>
     eeb:	8b 45 0c             	mov    0xc(%ebp),%eax
     eee:	8b 00                	mov    (%eax),%eax
     ef0:	89 c2                	mov    %eax,%edx
     ef2:	8b 45 08             	mov    0x8(%ebp),%eax
     ef5:	01 d0                	add    %edx,%eax
     ef7:	0f b6 00             	movzbl (%eax),%eax
     efa:	3c 39                	cmp    $0x39,%al
     efc:	7e 9c                	jle    e9a <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     efe:	8b 45 0c             	mov    0xc(%ebp),%eax
     f01:	8b 00                	mov    (%eax),%eax
     f03:	89 c2                	mov    %eax,%edx
     f05:	8b 45 08             	mov    0x8(%ebp),%eax
     f08:	01 d0                	add    %edx,%eax
     f0a:	0f b6 00             	movzbl (%eax),%eax
     f0d:	3c 2e                	cmp    $0x2e,%al
     f0f:	0f 85 9b 00 00 00    	jne    fb0 <Translation+0x128>
    {
        (*pos)++;
     f15:	8b 45 0c             	mov    0xc(%ebp),%eax
     f18:	8b 00                	mov    (%eax),%eax
     f1a:	8d 50 01             	lea    0x1(%eax),%edx
     f1d:	8b 45 0c             	mov    0xc(%ebp),%eax
     f20:	89 10                	mov    %edx,(%eax)
        int c = 1;
     f22:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     f29:	eb 5b                	jmp    f86 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     f2b:	8b 45 0c             	mov    0xc(%ebp),%eax
     f2e:	8b 00                	mov    (%eax),%eax
     f30:	89 c2                	mov    %eax,%edx
     f32:	8b 45 08             	mov    0x8(%ebp),%eax
     f35:	01 d0                	add    %edx,%eax
     f37:	0f b6 00             	movzbl (%eax),%eax
     f3a:	0f be c0             	movsbl %al,%eax
     f3d:	83 e8 30             	sub    $0x30,%eax
     f40:	89 45 dc             	mov    %eax,-0x24(%ebp)
     f43:	db 45 dc             	fildl  -0x24(%ebp)
     f46:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     f49:	83 ec 04             	sub    $0x4,%esp
     f4c:	ff 75 ec             	pushl  -0x14(%ebp)
     f4f:	dd 05 b8 39 00 00    	fldl   0x39b8
     f55:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     f59:	dd 1c 24             	fstpl  (%esp)
     f5c:	e8 f6 fe ff ff       	call   e57 <pow>
     f61:	83 c4 10             	add    $0x10,%esp
     f64:	dd 45 e0             	fldl   -0x20(%ebp)
     f67:	de c9                	fmulp  %st,%st(1)
     f69:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     f6c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     f70:	dd 45 f0             	fldl   -0x10(%ebp)
     f73:	dc 45 e0             	faddl  -0x20(%ebp)
     f76:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     f79:	8b 45 0c             	mov    0xc(%ebp),%eax
     f7c:	8b 00                	mov    (%eax),%eax
     f7e:	8d 50 01             	lea    0x1(%eax),%edx
     f81:	8b 45 0c             	mov    0xc(%ebp),%eax
     f84:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     f86:	8b 45 0c             	mov    0xc(%ebp),%eax
     f89:	8b 00                	mov    (%eax),%eax
     f8b:	89 c2                	mov    %eax,%edx
     f8d:	8b 45 08             	mov    0x8(%ebp),%eax
     f90:	01 d0                	add    %edx,%eax
     f92:	0f b6 00             	movzbl (%eax),%eax
     f95:	3c 2f                	cmp    $0x2f,%al
     f97:	7e 17                	jle    fb0 <Translation+0x128>
     f99:	8b 45 0c             	mov    0xc(%ebp),%eax
     f9c:	8b 00                	mov    (%eax),%eax
     f9e:	89 c2                	mov    %eax,%edx
     fa0:	8b 45 08             	mov    0x8(%ebp),%eax
     fa3:	01 d0                	add    %edx,%eax
     fa5:	0f b6 00             	movzbl (%eax),%eax
     fa8:	3c 39                	cmp    $0x39,%al
     faa:	0f 8e 7b ff ff ff    	jle    f2b <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
     fb0:	dd 45 f8             	fldl   -0x8(%ebp)
     fb3:	dc 45 f0             	faddl  -0x10(%ebp)
     fb6:	c9                   	leave  
     fb7:	c3                   	ret    

00000fb8 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
     fb8:	55                   	push   %ebp
     fb9:	89 e5                	mov    %esp,%ebp
     fbb:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     fbe:	e8 d2 f5 ff ff       	call   595 <fork>
     fc3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
     fc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     fc9:	c9                   	leave  
     fca:	c3                   	ret    

00000fcb <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
     fcb:	55                   	push   %ebp
     fcc:	89 e5                	mov    %esp,%ebp
     fce:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     fd1:	83 ec 0c             	sub    $0xc,%esp
     fd4:	6a 54                	push   $0x54
     fd6:	e8 70 fb ff ff       	call   b4b <malloc>
     fdb:	83 c4 10             	add    $0x10,%esp
     fde:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     fe1:	83 ec 04             	sub    $0x4,%esp
     fe4:	6a 54                	push   $0x54
     fe6:	6a 00                	push   $0x0
     fe8:	ff 75 f4             	pushl  -0xc(%ebp)
     feb:	e8 12 f4 ff ff       	call   402 <memset>
     ff0:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
     ff3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ff6:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     ffc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     fff:	c9                   	leave  
    1000:	c3                   	ret    

00001001 <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    1001:	55                   	push   %ebp
    1002:	89 e5                	mov    %esp,%ebp
    1004:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1007:	83 ec 0c             	sub    $0xc,%esp
    100a:	6a 18                	push   $0x18
    100c:	e8 3a fb ff ff       	call   b4b <malloc>
    1011:	83 c4 10             	add    $0x10,%esp
    1014:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1017:	83 ec 04             	sub    $0x4,%esp
    101a:	6a 18                	push   $0x18
    101c:	6a 00                	push   $0x0
    101e:	ff 75 f4             	pushl  -0xc(%ebp)
    1021:	e8 dc f3 ff ff       	call   402 <memset>
    1026:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
    1029:	8b 45 f4             	mov    -0xc(%ebp),%eax
    102c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
    1032:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1035:	8b 55 08             	mov    0x8(%ebp),%edx
    1038:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
    103b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    103e:	8b 55 0c             	mov    0xc(%ebp),%edx
    1041:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
    1044:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1047:	8b 55 10             	mov    0x10(%ebp),%edx
    104a:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
    104d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1050:	8b 55 14             	mov    0x14(%ebp),%edx
    1053:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
    1056:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1059:	8b 55 18             	mov    0x18(%ebp),%edx
    105c:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
    105f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1062:	c9                   	leave  
    1063:	c3                   	ret    

00001064 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
    1064:	55                   	push   %ebp
    1065:	89 e5                	mov    %esp,%ebp
    1067:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    106a:	83 ec 0c             	sub    $0xc,%esp
    106d:	6a 0c                	push   $0xc
    106f:	e8 d7 fa ff ff       	call   b4b <malloc>
    1074:	83 c4 10             	add    $0x10,%esp
    1077:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    107a:	83 ec 04             	sub    $0x4,%esp
    107d:	6a 0c                	push   $0xc
    107f:	6a 00                	push   $0x0
    1081:	ff 75 f4             	pushl  -0xc(%ebp)
    1084:	e8 79 f3 ff ff       	call   402 <memset>
    1089:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
    108c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    108f:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
    1095:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1098:	8b 55 08             	mov    0x8(%ebp),%edx
    109b:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    109e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10a1:	8b 55 0c             	mov    0xc(%ebp),%edx
    10a4:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    10a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    10aa:	c9                   	leave  
    10ab:	c3                   	ret    

000010ac <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
    10ac:	55                   	push   %ebp
    10ad:	89 e5                	mov    %esp,%ebp
    10af:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    10b2:	83 ec 0c             	sub    $0xc,%esp
    10b5:	6a 0c                	push   $0xc
    10b7:	e8 8f fa ff ff       	call   b4b <malloc>
    10bc:	83 c4 10             	add    $0x10,%esp
    10bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    10c2:	83 ec 04             	sub    $0x4,%esp
    10c5:	6a 0c                	push   $0xc
    10c7:	6a 00                	push   $0x0
    10c9:	ff 75 f4             	pushl  -0xc(%ebp)
    10cc:	e8 31 f3 ff ff       	call   402 <memset>
    10d1:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
    10d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10d7:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
    10dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10e0:	8b 55 08             	mov    0x8(%ebp),%edx
    10e3:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    10e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10e9:	8b 55 0c             	mov    0xc(%ebp),%edx
    10ec:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    10ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    10f2:	c9                   	leave  
    10f3:	c3                   	ret    

000010f4 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
    10f4:	55                   	push   %ebp
    10f5:	89 e5                	mov    %esp,%ebp
    10f7:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    10fa:	83 ec 0c             	sub    $0xc,%esp
    10fd:	6a 08                	push   $0x8
    10ff:	e8 47 fa ff ff       	call   b4b <malloc>
    1104:	83 c4 10             	add    $0x10,%esp
    1107:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    110a:	83 ec 04             	sub    $0x4,%esp
    110d:	6a 08                	push   $0x8
    110f:	6a 00                	push   $0x0
    1111:	ff 75 f4             	pushl  -0xc(%ebp)
    1114:	e8 e9 f2 ff ff       	call   402 <memset>
    1119:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
    111c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    111f:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
    1125:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1128:	8b 55 08             	mov    0x8(%ebp),%edx
    112b:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    112e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1131:	c9                   	leave  
    1132:	c3                   	ret    

00001133 <calcmd>:

struct cmd* calcmd(char *_line)
{
    1133:	55                   	push   %ebp
    1134:	89 e5                	mov    %esp,%ebp
    1136:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1139:	83 ec 0c             	sub    $0xc,%esp
    113c:	6a 08                	push   $0x8
    113e:	e8 08 fa ff ff       	call   b4b <malloc>
    1143:	83 c4 10             	add    $0x10,%esp
    1146:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1149:	83 ec 04             	sub    $0x4,%esp
    114c:	6a 08                	push   $0x8
    114e:	6a 00                	push   $0x0
    1150:	ff 75 f4             	pushl  -0xc(%ebp)
    1153:	e8 aa f2 ff ff       	call   402 <memset>
    1158:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
    115b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    115e:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
    1164:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1167:	8b 55 08             	mov    0x8(%ebp),%edx
    116a:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    116d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1170:	c9                   	leave  
    1171:	c3                   	ret    

00001172 <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
    1172:	55                   	push   %ebp
    1173:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
    1175:	eb 0c                	jmp    1183 <mystrncmp+0x11>
    n--, p++, q++;
    1177:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    117b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    117f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    1183:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1187:	74 1a                	je     11a3 <mystrncmp+0x31>
    1189:	8b 45 08             	mov    0x8(%ebp),%eax
    118c:	0f b6 00             	movzbl (%eax),%eax
    118f:	84 c0                	test   %al,%al
    1191:	74 10                	je     11a3 <mystrncmp+0x31>
    1193:	8b 45 08             	mov    0x8(%ebp),%eax
    1196:	0f b6 10             	movzbl (%eax),%edx
    1199:	8b 45 0c             	mov    0xc(%ebp),%eax
    119c:	0f b6 00             	movzbl (%eax),%eax
    119f:	38 c2                	cmp    %al,%dl
    11a1:	74 d4                	je     1177 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
    11a3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    11a7:	75 07                	jne    11b0 <mystrncmp+0x3e>
    return 0;
    11a9:	b8 00 00 00 00       	mov    $0x0,%eax
    11ae:	eb 16                	jmp    11c6 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
    11b0:	8b 45 08             	mov    0x8(%ebp),%eax
    11b3:	0f b6 00             	movzbl (%eax),%eax
    11b6:	0f b6 d0             	movzbl %al,%edx
    11b9:	8b 45 0c             	mov    0xc(%ebp),%eax
    11bc:	0f b6 00             	movzbl (%eax),%eax
    11bf:	0f b6 c0             	movzbl %al,%eax
    11c2:	29 c2                	sub    %eax,%edx
    11c4:	89 d0                	mov    %edx,%eax
}
    11c6:	5d                   	pop    %ebp
    11c7:	c3                   	ret    

000011c8 <mystrlen>:

static int mystrlen(const char *s)
{
    11c8:	55                   	push   %ebp
    11c9:	89 e5                	mov    %esp,%ebp
    11cb:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
    11ce:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    11d5:	eb 04                	jmp    11db <mystrlen+0x13>
    11d7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    11db:	8b 55 fc             	mov    -0x4(%ebp),%edx
    11de:	8b 45 08             	mov    0x8(%ebp),%eax
    11e1:	01 d0                	add    %edx,%eax
    11e3:	0f b6 00             	movzbl (%eax),%eax
    11e6:	84 c0                	test   %al,%al
    11e8:	75 ed                	jne    11d7 <mystrlen+0xf>
    ;
  return n;
    11ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    11ed:	c9                   	leave  
    11ee:	c3                   	ret    

000011ef <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
    11ef:	55                   	push   %ebp
    11f0:	89 e5                	mov    %esp,%ebp
    11f2:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
    11f5:	8b 45 08             	mov    0x8(%ebp),%eax
    11f8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
    11fb:	90                   	nop
    11fc:	8b 45 10             	mov    0x10(%ebp),%eax
    11ff:	8d 50 ff             	lea    -0x1(%eax),%edx
    1202:	89 55 10             	mov    %edx,0x10(%ebp)
    1205:	85 c0                	test   %eax,%eax
    1207:	7e 2c                	jle    1235 <mystrncpy+0x46>
    1209:	8b 45 08             	mov    0x8(%ebp),%eax
    120c:	8d 50 01             	lea    0x1(%eax),%edx
    120f:	89 55 08             	mov    %edx,0x8(%ebp)
    1212:	8b 55 0c             	mov    0xc(%ebp),%edx
    1215:	8d 4a 01             	lea    0x1(%edx),%ecx
    1218:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    121b:	0f b6 12             	movzbl (%edx),%edx
    121e:	88 10                	mov    %dl,(%eax)
    1220:	0f b6 00             	movzbl (%eax),%eax
    1223:	84 c0                	test   %al,%al
    1225:	75 d5                	jne    11fc <mystrncpy+0xd>
    ;
  while(n-- > 0)
    1227:	eb 0c                	jmp    1235 <mystrncpy+0x46>
    *s++ = 0;
    1229:	8b 45 08             	mov    0x8(%ebp),%eax
    122c:	8d 50 01             	lea    0x1(%eax),%edx
    122f:	89 55 08             	mov    %edx,0x8(%ebp)
    1232:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    1235:	8b 45 10             	mov    0x10(%ebp),%eax
    1238:	8d 50 ff             	lea    -0x1(%eax),%edx
    123b:	89 55 10             	mov    %edx,0x10(%ebp)
    123e:	85 c0                	test   %eax,%eax
    1240:	7f e7                	jg     1229 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    1242:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1245:	c9                   	leave  
    1246:	c3                   	ret    

00001247 <isEqual>:

int isEqual(double a, double b)
{
    1247:	55                   	push   %ebp
    1248:	89 e5                	mov    %esp,%ebp
    124a:	83 ec 10             	sub    $0x10,%esp
    124d:	8b 45 08             	mov    0x8(%ebp),%eax
    1250:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1253:	8b 45 0c             	mov    0xc(%ebp),%eax
    1256:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1259:	8b 45 10             	mov    0x10(%ebp),%eax
    125c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    125f:	8b 45 14             	mov    0x14(%ebp),%eax
    1262:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    1265:	dd 45 f8             	fldl   -0x8(%ebp)
    1268:	dc 65 f0             	fsubl  -0x10(%ebp)
    126b:	dd 05 88 3b 00 00    	fldl   0x3b88
    1271:	df e9                	fucomip %st(1),%st
    1273:	dd d8                	fstp   %st(0)
    1275:	76 19                	jbe    1290 <isEqual+0x49>
    1277:	dd 45 f0             	fldl   -0x10(%ebp)
    127a:	dc 65 f8             	fsubl  -0x8(%ebp)
    127d:	dd 05 88 3b 00 00    	fldl   0x3b88
    1283:	df e9                	fucomip %st(1),%st
    1285:	dd d8                	fstp   %st(0)
    1287:	76 07                	jbe    1290 <isEqual+0x49>
    return 1;
    1289:	b8 01 00 00 00       	mov    $0x1,%eax
    128e:	eb 05                	jmp    1295 <isEqual+0x4e>
  return 0;
    1290:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1295:	c9                   	leave  
    1296:	c3                   	ret    

00001297 <isCmdName>:

int isCmdName(const char* str)
{
    1297:	55                   	push   %ebp
    1298:	89 e5                	mov    %esp,%ebp
    129a:	53                   	push   %ebx
    129b:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    129e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    12a5:	eb 71                	jmp    1318 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    12a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    12aa:	89 d0                	mov    %edx,%eax
    12ac:	c1 e0 02             	shl    $0x2,%eax
    12af:	01 d0                	add    %edx,%eax
    12b1:	01 c0                	add    %eax,%eax
    12b3:	05 40 46 00 00       	add    $0x4640,%eax
    12b8:	83 ec 0c             	sub    $0xc,%esp
    12bb:	50                   	push   %eax
    12bc:	e8 1a f1 ff ff       	call   3db <strlen>
    12c1:	83 c4 10             	add    $0x10,%esp
    12c4:	89 c3                	mov    %eax,%ebx
    12c6:	83 ec 0c             	sub    $0xc,%esp
    12c9:	ff 75 08             	pushl  0x8(%ebp)
    12cc:	e8 f7 fe ff ff       	call   11c8 <mystrlen>
    12d1:	83 c4 10             	add    $0x10,%esp
    12d4:	39 c3                	cmp    %eax,%ebx
    12d6:	75 3c                	jne    1314 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    12d8:	83 ec 0c             	sub    $0xc,%esp
    12db:	ff 75 08             	pushl  0x8(%ebp)
    12de:	e8 e5 fe ff ff       	call   11c8 <mystrlen>
    12e3:	83 c4 10             	add    $0x10,%esp
    12e6:	89 c1                	mov    %eax,%ecx
    12e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    12eb:	89 d0                	mov    %edx,%eax
    12ed:	c1 e0 02             	shl    $0x2,%eax
    12f0:	01 d0                	add    %edx,%eax
    12f2:	01 c0                	add    %eax,%eax
    12f4:	05 40 46 00 00       	add    $0x4640,%eax
    12f9:	83 ec 04             	sub    $0x4,%esp
    12fc:	51                   	push   %ecx
    12fd:	ff 75 08             	pushl  0x8(%ebp)
    1300:	50                   	push   %eax
    1301:	e8 6c fe ff ff       	call   1172 <mystrncmp>
    1306:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1309:	85 c0                	test   %eax,%eax
    130b:	75 07                	jne    1314 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    130d:	b8 01 00 00 00       	mov    $0x1,%eax
    1312:	eb 0f                	jmp    1323 <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    1314:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1318:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    131c:	7e 89                	jle    12a7 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    131e:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1323:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1326:	c9                   	leave  
    1327:	c3                   	ret    

00001328 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    1328:	55                   	push   %ebp
    1329:	89 e5                	mov    %esp,%ebp
    132b:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    1331:	83 ec 08             	sub    $0x8,%esp
    1334:	6a 00                	push   $0x0
    1336:	68 08 47 00 00       	push   $0x4708
    133b:	e8 9d f2 ff ff       	call   5dd <open>
    1340:	83 c4 10             	add    $0x10,%esp
    1343:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1346:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    134a:	79 0a                	jns    1356 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    134c:	b8 00 00 00 00       	mov    $0x0,%eax
    1351:	e9 9a 01 00 00       	jmp    14f0 <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    1356:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    135d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1364:	e9 ee 00 00 00       	jmp    1457 <findAlias+0x12f>
  {
      int isSame = 1;
    1369:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    1370:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    1377:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    137e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    1385:	83 ec 0c             	sub    $0xc,%esp
    1388:	8d 45 9a             	lea    -0x66(%ebp),%eax
    138b:	50                   	push   %eax
    138c:	e8 4a f0 ff ff       	call   3db <strlen>
    1391:	83 c4 10             	add    $0x10,%esp
    1394:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    1397:	83 ec 0c             	sub    $0xc,%esp
    139a:	ff 75 08             	pushl  0x8(%ebp)
    139d:	e8 39 f0 ff ff       	call   3db <strlen>
    13a2:	83 c4 10             	add    $0x10,%esp
    13a5:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    13a8:	8d 55 9a             	lea    -0x66(%ebp),%edx
    13ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13ae:	01 d0                	add    %edx,%eax
    13b0:	0f b6 00             	movzbl (%eax),%eax
    13b3:	3c 21                	cmp    $0x21,%al
    13b5:	75 38                	jne    13ef <findAlias+0xc7>
      {
          startIndex++;
    13b7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    13bb:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    13c2:	eb 2b                	jmp    13ef <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    13c4:	8d 55 9a             	lea    -0x66(%ebp),%edx
    13c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13ca:	01 d0                	add    %edx,%eax
    13cc:	0f b6 10             	movzbl (%eax),%edx
    13cf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    13d2:	8b 45 08             	mov    0x8(%ebp),%eax
    13d5:	01 c8                	add    %ecx,%eax
    13d7:	0f b6 00             	movzbl (%eax),%eax
    13da:	38 c2                	cmp    %al,%dl
    13dc:	74 09                	je     13e7 <findAlias+0xbf>
          {
              isSame = 0;
    13de:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    13e5:	eb 1f                	jmp    1406 <findAlias+0xde>
          }
          startIndex++;
    13e7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    13eb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    13ef:	8d 55 9a             	lea    -0x66(%ebp),%edx
    13f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13f5:	01 d0                	add    %edx,%eax
    13f7:	0f b6 00             	movzbl (%eax),%eax
    13fa:	3c 3d                	cmp    $0x3d,%al
    13fc:	74 08                	je     1406 <findAlias+0xde>
    13fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1401:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1404:	7c be                	jl     13c4 <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    1406:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1409:	8b 45 e8             	mov    -0x18(%ebp),%eax
    140c:	01 d0                	add    %edx,%eax
    140e:	0f b6 00             	movzbl (%eax),%eax
    1411:	3c 3d                	cmp    $0x3d,%al
    1413:	75 08                	jne    141d <findAlias+0xf5>
    1415:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1418:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    141b:	7d 07                	jge    1424 <findAlias+0xfc>
      {
          isSame = 0;
    141d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    1424:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    1428:	75 0b                	jne    1435 <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    142a:	b8 01 00 00 00       	mov    $0x1,%eax
    142f:	2b 45 f0             	sub    -0x10(%ebp),%eax
    1432:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    1435:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1439:	75 1c                	jne    1457 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    143b:	83 ec 08             	sub    $0x8,%esp
    143e:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1441:	50                   	push   %eax
    1442:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1448:	50                   	push   %eax
    1449:	e8 1e ef ff ff       	call   36c <strcpy>
    144e:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    1451:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1454:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    1457:	83 ec 04             	sub    $0x4,%esp
    145a:	6a 32                	push   $0x32
    145c:	8d 45 9a             	lea    -0x66(%ebp),%eax
    145f:	50                   	push   %eax
    1460:	ff 75 dc             	pushl  -0x24(%ebp)
    1463:	e8 4d f1 ff ff       	call   5b5 <read>
    1468:	83 c4 10             	add    $0x10,%esp
    146b:	89 45 d8             	mov    %eax,-0x28(%ebp)
    146e:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    1472:	0f 8f f1 fe ff ff    	jg     1369 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    1478:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    147c:	75 5f                	jne    14dd <findAlias+0x1b5>
  {
    int i = 0;
    147e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    1485:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    1489:	eb 20                	jmp    14ab <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    148b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    148e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1491:	01 c2                	add    %eax,%edx
    1493:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    1499:	8b 45 f4             	mov    -0xc(%ebp),%eax
    149c:	01 c8                	add    %ecx,%eax
    149e:	0f b6 00             	movzbl (%eax),%eax
    14a1:	88 02                	mov    %al,(%edx)
      i++;
    14a3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    14a7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    14ab:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    14b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14b4:	01 d0                	add    %edx,%eax
    14b6:	0f b6 00             	movzbl (%eax),%eax
    14b9:	84 c0                	test   %al,%al
    14bb:	75 ce                	jne    148b <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    14bd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    14c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    14c3:	01 d0                	add    %edx,%eax
    14c5:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    14c8:	83 ec 0c             	sub    $0xc,%esp
    14cb:	ff 75 dc             	pushl  -0x24(%ebp)
    14ce:	e8 f2 f0 ff ff       	call   5c5 <close>
    14d3:	83 c4 10             	add    $0x10,%esp
    return 1;
    14d6:	b8 01 00 00 00       	mov    $0x1,%eax
    14db:	eb 13                	jmp    14f0 <findAlias+0x1c8>
  }
  close(fd);
    14dd:	83 ec 0c             	sub    $0xc,%esp
    14e0:	ff 75 dc             	pushl  -0x24(%ebp)
    14e3:	e8 dd f0 ff ff       	call   5c5 <close>
    14e8:	83 c4 10             	add    $0x10,%esp
  return 0;
    14eb:	b8 00 00 00 00       	mov    $0x0,%eax
}
    14f0:	c9                   	leave  
    14f1:	c3                   	ret    

000014f2 <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    14f2:	55                   	push   %ebp
    14f3:	89 e5                	mov    %esp,%ebp
    14f5:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    14f8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    14fc:	75 05                	jne    1503 <runcmd+0x11>
    exit();
    14fe:	e8 9a f0 ff ff       	call   59d <exit>
  
  switch(cmd->type){
    1503:	8b 45 08             	mov    0x8(%ebp),%eax
    1506:	8b 00                	mov    (%eax),%eax
    1508:	83 f8 05             	cmp    $0x5,%eax
    150b:	77 09                	ja     1516 <runcmd+0x24>
    150d:	8b 04 85 ec 39 00 00 	mov    0x39ec(,%eax,4),%eax
    1514:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    1516:	83 ec 0c             	sub    $0xc,%esp
    1519:	68 c0 39 00 00       	push   $0x39c0
    151e:	e8 0b f7 ff ff       	call   c2e <panic1>
    1523:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    1526:	8b 45 08             	mov    0x8(%ebp),%eax
    1529:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    152c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    152f:	8b 40 04             	mov    0x4(%eax),%eax
    1532:	85 c0                	test   %eax,%eax
    1534:	75 05                	jne    153b <runcmd+0x49>
      exit();
    1536:	e8 62 f0 ff ff       	call   59d <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    153b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    153e:	8b 40 04             	mov    0x4(%eax),%eax
    1541:	83 ec 0c             	sub    $0xc,%esp
    1544:	50                   	push   %eax
    1545:	e8 4d fd ff ff       	call   1297 <isCmdName>
    154a:	83 c4 10             	add    $0x10,%esp
    154d:	85 c0                	test   %eax,%eax
    154f:	75 37                	jne    1588 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    1551:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1554:	8b 40 04             	mov    0x4(%eax),%eax
    1557:	83 ec 08             	sub    $0x8,%esp
    155a:	8d 55 ce             	lea    -0x32(%ebp),%edx
    155d:	52                   	push   %edx
    155e:	50                   	push   %eax
    155f:	e8 c4 fd ff ff       	call   1328 <findAlias>
    1564:	83 c4 10             	add    $0x10,%esp
    1567:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    156a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    156e:	75 31                	jne    15a1 <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    1570:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1573:	83 c0 04             	add    $0x4,%eax
    1576:	83 ec 08             	sub    $0x8,%esp
    1579:	50                   	push   %eax
    157a:	8d 45 ce             	lea    -0x32(%ebp),%eax
    157d:	50                   	push   %eax
    157e:	e8 52 f0 ff ff       	call   5d5 <exec>
    1583:	83 c4 10             	add    $0x10,%esp
    1586:	eb 19                	jmp    15a1 <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    1588:	8b 45 f4             	mov    -0xc(%ebp),%eax
    158b:	8d 50 04             	lea    0x4(%eax),%edx
    158e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1591:	8b 40 04             	mov    0x4(%eax),%eax
    1594:	83 ec 08             	sub    $0x8,%esp
    1597:	52                   	push   %edx
    1598:	50                   	push   %eax
    1599:	e8 37 f0 ff ff       	call   5d5 <exec>
    159e:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    15a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a4:	8b 40 04             	mov    0x4(%eax),%eax
    15a7:	83 ec 04             	sub    $0x4,%esp
    15aa:	50                   	push   %eax
    15ab:	68 c7 39 00 00       	push   $0x39c7
    15b0:	6a 02                	push   $0x2
    15b2:	e8 92 f2 ff ff       	call   849 <printf>
    15b7:	83 c4 10             	add    $0x10,%esp
    break;
    15ba:	e9 c6 01 00 00       	jmp    1785 <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    15bf:	8b 45 08             	mov    0x8(%ebp),%eax
    15c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    15c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15c8:	8b 40 14             	mov    0x14(%eax),%eax
    15cb:	83 ec 0c             	sub    $0xc,%esp
    15ce:	50                   	push   %eax
    15cf:	e8 f1 ef ff ff       	call   5c5 <close>
    15d4:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    15d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15da:	8b 50 10             	mov    0x10(%eax),%edx
    15dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15e0:	8b 40 08             	mov    0x8(%eax),%eax
    15e3:	83 ec 08             	sub    $0x8,%esp
    15e6:	52                   	push   %edx
    15e7:	50                   	push   %eax
    15e8:	e8 f0 ef ff ff       	call   5dd <open>
    15ed:	83 c4 10             	add    $0x10,%esp
    15f0:	85 c0                	test   %eax,%eax
    15f2:	79 1e                	jns    1612 <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    15f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15f7:	8b 40 08             	mov    0x8(%eax),%eax
    15fa:	83 ec 04             	sub    $0x4,%esp
    15fd:	50                   	push   %eax
    15fe:	68 d7 39 00 00       	push   $0x39d7
    1603:	6a 02                	push   $0x2
    1605:	e8 3f f2 ff ff       	call   849 <printf>
    160a:	83 c4 10             	add    $0x10,%esp
      exit();
    160d:	e8 8b ef ff ff       	call   59d <exit>
    }
    runcmd(rcmd->cmd);
    1612:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1615:	8b 40 04             	mov    0x4(%eax),%eax
    1618:	83 ec 0c             	sub    $0xc,%esp
    161b:	50                   	push   %eax
    161c:	e8 d1 fe ff ff       	call   14f2 <runcmd>
    1621:	83 c4 10             	add    $0x10,%esp
    break;
    1624:	e9 5c 01 00 00       	jmp    1785 <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    1629:	8b 45 08             	mov    0x8(%ebp),%eax
    162c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    162f:	e8 84 f9 ff ff       	call   fb8 <fork1>
    1634:	85 c0                	test   %eax,%eax
    1636:	75 12                	jne    164a <runcmd+0x158>
      runcmd(lcmd->left);
    1638:	8b 45 e8             	mov    -0x18(%ebp),%eax
    163b:	8b 40 04             	mov    0x4(%eax),%eax
    163e:	83 ec 0c             	sub    $0xc,%esp
    1641:	50                   	push   %eax
    1642:	e8 ab fe ff ff       	call   14f2 <runcmd>
    1647:	83 c4 10             	add    $0x10,%esp
    wait();
    164a:	e8 56 ef ff ff       	call   5a5 <wait>
    runcmd(lcmd->right);
    164f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1652:	8b 40 08             	mov    0x8(%eax),%eax
    1655:	83 ec 0c             	sub    $0xc,%esp
    1658:	50                   	push   %eax
    1659:	e8 94 fe ff ff       	call   14f2 <runcmd>
    165e:	83 c4 10             	add    $0x10,%esp
    break;
    1661:	e9 1f 01 00 00       	jmp    1785 <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    1666:	8b 45 08             	mov    0x8(%ebp),%eax
    1669:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    166c:	83 ec 0c             	sub    $0xc,%esp
    166f:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1672:	50                   	push   %eax
    1673:	e8 35 ef ff ff       	call   5ad <pipe>
    1678:	83 c4 10             	add    $0x10,%esp
    167b:	85 c0                	test   %eax,%eax
    167d:	79 10                	jns    168f <runcmd+0x19d>
      panic1("pipe");
    167f:	83 ec 0c             	sub    $0xc,%esp
    1682:	68 e7 39 00 00       	push   $0x39e7
    1687:	e8 a2 f5 ff ff       	call   c2e <panic1>
    168c:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    168f:	e8 24 f9 ff ff       	call   fb8 <fork1>
    1694:	85 c0                	test   %eax,%eax
    1696:	75 4c                	jne    16e4 <runcmd+0x1f2>
      close(1);
    1698:	83 ec 0c             	sub    $0xc,%esp
    169b:	6a 01                	push   $0x1
    169d:	e8 23 ef ff ff       	call   5c5 <close>
    16a2:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    16a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    16a8:	83 ec 0c             	sub    $0xc,%esp
    16ab:	50                   	push   %eax
    16ac:	e8 64 ef ff ff       	call   615 <dup>
    16b1:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    16b4:	8b 45 d8             	mov    -0x28(%ebp),%eax
    16b7:	83 ec 0c             	sub    $0xc,%esp
    16ba:	50                   	push   %eax
    16bb:	e8 05 ef ff ff       	call   5c5 <close>
    16c0:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    16c3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    16c6:	83 ec 0c             	sub    $0xc,%esp
    16c9:	50                   	push   %eax
    16ca:	e8 f6 ee ff ff       	call   5c5 <close>
    16cf:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    16d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16d5:	8b 40 04             	mov    0x4(%eax),%eax
    16d8:	83 ec 0c             	sub    $0xc,%esp
    16db:	50                   	push   %eax
    16dc:	e8 11 fe ff ff       	call   14f2 <runcmd>
    16e1:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    16e4:	e8 cf f8 ff ff       	call   fb8 <fork1>
    16e9:	85 c0                	test   %eax,%eax
    16eb:	75 4c                	jne    1739 <runcmd+0x247>
      close(0);
    16ed:	83 ec 0c             	sub    $0xc,%esp
    16f0:	6a 00                	push   $0x0
    16f2:	e8 ce ee ff ff       	call   5c5 <close>
    16f7:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    16fa:	8b 45 d8             	mov    -0x28(%ebp),%eax
    16fd:	83 ec 0c             	sub    $0xc,%esp
    1700:	50                   	push   %eax
    1701:	e8 0f ef ff ff       	call   615 <dup>
    1706:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1709:	8b 45 d8             	mov    -0x28(%ebp),%eax
    170c:	83 ec 0c             	sub    $0xc,%esp
    170f:	50                   	push   %eax
    1710:	e8 b0 ee ff ff       	call   5c5 <close>
    1715:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    1718:	8b 45 dc             	mov    -0x24(%ebp),%eax
    171b:	83 ec 0c             	sub    $0xc,%esp
    171e:	50                   	push   %eax
    171f:	e8 a1 ee ff ff       	call   5c5 <close>
    1724:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    1727:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    172a:	8b 40 08             	mov    0x8(%eax),%eax
    172d:	83 ec 0c             	sub    $0xc,%esp
    1730:	50                   	push   %eax
    1731:	e8 bc fd ff ff       	call   14f2 <runcmd>
    1736:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    1739:	8b 45 d8             	mov    -0x28(%ebp),%eax
    173c:	83 ec 0c             	sub    $0xc,%esp
    173f:	50                   	push   %eax
    1740:	e8 80 ee ff ff       	call   5c5 <close>
    1745:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    1748:	8b 45 dc             	mov    -0x24(%ebp),%eax
    174b:	83 ec 0c             	sub    $0xc,%esp
    174e:	50                   	push   %eax
    174f:	e8 71 ee ff ff       	call   5c5 <close>
    1754:	83 c4 10             	add    $0x10,%esp
    wait();
    1757:	e8 49 ee ff ff       	call   5a5 <wait>
    wait();
    175c:	e8 44 ee ff ff       	call   5a5 <wait>
    break;
    1761:	eb 22                	jmp    1785 <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    1763:	8b 45 08             	mov    0x8(%ebp),%eax
    1766:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    1769:	e8 4a f8 ff ff       	call   fb8 <fork1>
    176e:	85 c0                	test   %eax,%eax
    1770:	75 12                	jne    1784 <runcmd+0x292>
      runcmd(bcmd->cmd);
    1772:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1775:	8b 40 04             	mov    0x4(%eax),%eax
    1778:	83 ec 0c             	sub    $0xc,%esp
    177b:	50                   	push   %eax
    177c:	e8 71 fd ff ff       	call   14f2 <runcmd>
    1781:	83 c4 10             	add    $0x10,%esp
    break;
    1784:	90                   	nop
  }
  exit();
    1785:	e8 13 ee ff ff       	call   59d <exit>

0000178a <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    178a:	55                   	push   %ebp
    178b:	89 e5                	mov    %esp,%ebp
    178d:	83 ec 04             	sub    $0x4,%esp
    1790:	8b 45 08             	mov    0x8(%ebp),%eax
    1793:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    1796:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    179a:	7e 0d                	jle    17a9 <isNameChar+0x1f>
    179c:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    17a0:	7f 07                	jg     17a9 <isNameChar+0x1f>
    return 1;
    17a2:	b8 01 00 00 00       	mov    $0x1,%eax
    17a7:	eb 38                	jmp    17e1 <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    17a9:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    17ad:	7e 0d                	jle    17bc <isNameChar+0x32>
    17af:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    17b3:	7f 07                	jg     17bc <isNameChar+0x32>
    return 1;
    17b5:	b8 01 00 00 00       	mov    $0x1,%eax
    17ba:	eb 25                	jmp    17e1 <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    17bc:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    17c0:	7e 0d                	jle    17cf <isNameChar+0x45>
    17c2:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    17c6:	7f 07                	jg     17cf <isNameChar+0x45>
    return 1;
    17c8:	b8 01 00 00 00       	mov    $0x1,%eax
    17cd:	eb 12                	jmp    17e1 <isNameChar+0x57>
  if(ch == '_')
    17cf:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    17d3:	75 07                	jne    17dc <isNameChar+0x52>
    return 1;
    17d5:	b8 01 00 00 00       	mov    $0x1,%eax
    17da:	eb 05                	jmp    17e1 <isNameChar+0x57>
  return 0;
    17dc:	b8 00 00 00 00       	mov    $0x0,%eax
}
    17e1:	c9                   	leave  
    17e2:	c3                   	ret    

000017e3 <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    17e3:	55                   	push   %ebp
    17e4:	89 e5                	mov    %esp,%ebp
    17e6:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    17e9:	8b 45 08             	mov    0x8(%ebp),%eax
    17ec:	8b 40 04             	mov    0x4(%eax),%eax
    17ef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    17f2:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    17f9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    1800:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1807:	eb 1d                	jmp    1826 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    1809:	8b 55 ec             	mov    -0x14(%ebp),%edx
    180c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    180f:	01 d0                	add    %edx,%eax
    1811:	0f b6 00             	movzbl (%eax),%eax
    1814:	3c 3d                	cmp    $0x3d,%al
    1816:	75 0a                	jne    1822 <runCalcmd+0x3f>
    {
      hasEqu++;
    1818:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    181c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    181f:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    1822:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1826:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1829:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    182c:	01 d0                	add    %edx,%eax
    182e:	0f b6 00             	movzbl (%eax),%eax
    1831:	84 c0                	test   %al,%al
    1833:	75 d4                	jne    1809 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    1835:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1839:	7e 1d                	jle    1858 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    183b:	83 ec 0c             	sub    $0xc,%esp
    183e:	68 04 3a 00 00       	push   $0x3a04
    1843:	6a 00                	push   $0x0
    1845:	6a 00                	push   $0x0
    1847:	6a 01                	push   $0x1
    1849:	6a 04                	push   $0x4
    184b:	e8 21 17 00 00       	call   2f71 <color_printf>
    1850:	83 c4 20             	add    $0x20,%esp
    1853:	e9 78 05 00 00       	jmp    1dd0 <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    1858:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    185c:	0f 85 26 05 00 00    	jne    1d88 <runCalcmd+0x5a5>
  {
    int i=0;
    1862:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    1869:	eb 04                	jmp    186f <runCalcmd+0x8c>
    {
      i++;
    186b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    186f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1872:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1875:	01 d0                	add    %edx,%eax
    1877:	0f b6 00             	movzbl (%eax),%eax
    187a:	3c 20                	cmp    $0x20,%al
    187c:	74 ed                	je     186b <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    187e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1881:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    1884:	eb 23                	jmp    18a9 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    1886:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1889:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    188c:	01 d0                	add    %edx,%eax
    188e:	0f b6 00             	movzbl (%eax),%eax
    1891:	0f be c0             	movsbl %al,%eax
    1894:	83 ec 0c             	sub    $0xc,%esp
    1897:	50                   	push   %eax
    1898:	e8 ed fe ff ff       	call   178a <isNameChar>
    189d:	83 c4 10             	add    $0x10,%esp
    18a0:	83 f8 01             	cmp    $0x1,%eax
    18a3:	75 0e                	jne    18b3 <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    18a5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    18a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18ac:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    18af:	7c d5                	jl     1886 <runCalcmd+0xa3>
    18b1:	eb 01                	jmp    18b4 <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    18b3:	90                   	nop
    }
    int len = i-startIndex;
    18b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18b7:	2b 45 d0             	sub    -0x30(%ebp),%eax
    18ba:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    18bd:	eb 04                	jmp    18c3 <runCalcmd+0xe0>
    {
      i++;
    18bf:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    18c3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    18c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18c9:	01 d0                	add    %edx,%eax
    18cb:	0f b6 00             	movzbl (%eax),%eax
    18ce:	3c 20                	cmp    $0x20,%al
    18d0:	74 ed                	je     18bf <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    18d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18d5:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    18d8:	0f 85 90 04 00 00    	jne    1d6e <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    18de:	8b 55 d0             	mov    -0x30(%ebp),%edx
    18e1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18e4:	01 d0                	add    %edx,%eax
    18e6:	0f b6 00             	movzbl (%eax),%eax
    18e9:	3c 2f                	cmp    $0x2f,%al
    18eb:	7e 2c                	jle    1919 <runCalcmd+0x136>
    18ed:	8b 55 d0             	mov    -0x30(%ebp),%edx
    18f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18f3:	01 d0                	add    %edx,%eax
    18f5:	0f b6 00             	movzbl (%eax),%eax
    18f8:	3c 39                	cmp    $0x39,%al
    18fa:	7f 1d                	jg     1919 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    18fc:	83 ec 0c             	sub    $0xc,%esp
    18ff:	68 20 3a 00 00       	push   $0x3a20
    1904:	6a 00                	push   $0x0
    1906:	6a 00                	push   $0x0
    1908:	6a 01                	push   $0x1
    190a:	6a 04                	push   $0x4
    190c:	e8 60 16 00 00       	call   2f71 <color_printf>
    1911:	83 c4 20             	add    $0x20,%esp
    1914:	e9 b7 04 00 00       	jmp    1dd0 <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1919:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1920:	eb 20                	jmp    1942 <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    1922:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1925:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1928:	01 d0                	add    %edx,%eax
    192a:	89 c2                	mov    %eax,%edx
    192c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    192f:	01 d0                	add    %edx,%eax
    1931:	0f b6 00             	movzbl (%eax),%eax
    1934:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1937:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    193a:	01 ca                	add    %ecx,%edx
    193c:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    193e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1942:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1945:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1948:	7c d8                	jl     1922 <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    194a:	8d 55 94             	lea    -0x6c(%ebp),%edx
    194d:	8b 45 cc             	mov    -0x34(%ebp),%eax
    1950:	01 d0                	add    %edx,%eax
    1952:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    1955:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1958:	83 c0 01             	add    $0x1,%eax
    195b:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    195e:	eb 04                	jmp    1964 <runCalcmd+0x181>
        {
          i++;
    1960:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    1964:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1967:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    196a:	01 d0                	add    %edx,%eax
    196c:	0f b6 00             	movzbl (%eax),%eax
    196f:	3c 20                	cmp    $0x20,%al
    1971:	74 ed                	je     1960 <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    1973:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1976:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1979:	01 d0                	add    %edx,%eax
    197b:	0f b6 00             	movzbl (%eax),%eax
    197e:	3c 60                	cmp    $0x60,%al
    1980:	0f 85 e6 01 00 00    	jne    1b6c <runCalcmd+0x389>
        {
          i++;
    1986:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    198a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    198d:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    1990:	eb 04                	jmp    1996 <runCalcmd+0x1b3>
          {
            i++;
    1992:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    1996:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1999:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    199c:	01 d0                	add    %edx,%eax
    199e:	0f b6 00             	movzbl (%eax),%eax
    19a1:	3c 60                	cmp    $0x60,%al
    19a3:	74 0f                	je     19b4 <runCalcmd+0x1d1>
    19a5:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19ab:	01 d0                	add    %edx,%eax
    19ad:	0f b6 00             	movzbl (%eax),%eax
    19b0:	84 c0                	test   %al,%al
    19b2:	75 de                	jne    1992 <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    19b4:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19ba:	01 d0                	add    %edx,%eax
    19bc:	0f b6 00             	movzbl (%eax),%eax
    19bf:	3c 60                	cmp    $0x60,%al
    19c1:	0f 85 5c 01 00 00    	jne    1b23 <runCalcmd+0x340>
    19c7:	8b 45 e0             	mov    -0x20(%ebp),%eax
    19ca:	8d 50 01             	lea    0x1(%eax),%edx
    19cd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19d0:	01 d0                	add    %edx,%eax
    19d2:	0f b6 00             	movzbl (%eax),%eax
    19d5:	84 c0                	test   %al,%al
    19d7:	0f 85 46 01 00 00    	jne    1b23 <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    19dd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19e3:	01 d0                	add    %edx,%eax
    19e5:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    19e8:	8b 55 c8             	mov    -0x38(%ebp),%edx
    19eb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19ee:	01 d0                	add    %edx,%eax
    19f0:	83 ec 0c             	sub    $0xc,%esp
    19f3:	50                   	push   %eax
    19f4:	e8 c5 04 00 00       	call   1ebe <Compute>
    19f9:	83 c4 10             	add    $0x10,%esp
    19fc:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    19ff:	dd 05 90 3b 00 00    	fldl   0x3b90
    1a05:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1a09:	dd 1c 24             	fstpl  (%esp)
    1a0c:	ff 75 c4             	pushl  -0x3c(%ebp)
    1a0f:	ff 75 c0             	pushl  -0x40(%ebp)
    1a12:	e8 30 f8 ff ff       	call   1247 <isEqual>
    1a17:	83 c4 10             	add    $0x10,%esp
    1a1a:	85 c0                	test   %eax,%eax
    1a1c:	0f 85 ad 03 00 00    	jne    1dcf <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    1a22:	a1 5c 47 00 00       	mov    0x475c,%eax
    1a27:	85 c0                	test   %eax,%eax
    1a29:	75 15                	jne    1a40 <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1a2b:	83 ec 08             	sub    $0x8,%esp
    1a2e:	68 5c 47 00 00       	push   $0x475c
    1a33:	68 80 47 00 00       	push   $0x4780
    1a38:	e8 ba 19 00 00       	call   33f7 <readVariables>
    1a3d:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    1a40:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1a47:	eb 26                	jmp    1a6f <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1a49:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1a4c:	c1 e0 05             	shl    $0x5,%eax
    1a4f:	05 80 47 00 00       	add    $0x4780,%eax
    1a54:	8d 50 04             	lea    0x4(%eax),%edx
    1a57:	83 ec 08             	sub    $0x8,%esp
    1a5a:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1a5d:	50                   	push   %eax
    1a5e:	52                   	push   %edx
    1a5f:	e8 38 e9 ff ff       	call   39c <strcmp>
    1a64:	83 c4 10             	add    $0x10,%esp
    1a67:	85 c0                	test   %eax,%eax
    1a69:	74 10                	je     1a7b <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1a6b:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    1a6f:	a1 5c 47 00 00       	mov    0x475c,%eax
    1a74:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1a77:	7c d0                	jl     1a49 <runCalcmd+0x266>
    1a79:	eb 01                	jmp    1a7c <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1a7b:	90                   	nop
              }
              if(index == v_num) //new variable
    1a7c:	a1 5c 47 00 00       	mov    0x475c,%eax
    1a81:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1a84:	75 3c                	jne    1ac2 <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    1a86:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1a89:	c1 e0 05             	shl    $0x5,%eax
    1a8c:	05 80 47 00 00       	add    $0x4780,%eax
    1a91:	8d 50 04             	lea    0x4(%eax),%edx
    1a94:	83 ec 08             	sub    $0x8,%esp
    1a97:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1a9a:	50                   	push   %eax
    1a9b:	52                   	push   %edx
    1a9c:	e8 cb e8 ff ff       	call   36c <strcpy>
    1aa1:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    1aa4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1aa7:	c1 e0 05             	shl    $0x5,%eax
    1aaa:	05 80 47 00 00       	add    $0x4780,%eax
    1aaf:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    1ab5:	a1 5c 47 00 00       	mov    0x475c,%eax
    1aba:	83 c0 01             	add    $0x1,%eax
    1abd:	a3 5c 47 00 00       	mov    %eax,0x475c
              }
              variables[index].value.dvalue = result;
    1ac2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ac5:	c1 e0 05             	shl    $0x5,%eax
    1ac8:	05 90 47 00 00       	add    $0x4790,%eax
    1acd:	dd 45 c0             	fldl   -0x40(%ebp)
    1ad0:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    1ad3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ad6:	c1 e0 05             	shl    $0x5,%eax
    1ad9:	05 90 47 00 00       	add    $0x4790,%eax
    1ade:	dd 40 08             	fldl   0x8(%eax)
    1ae1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ae4:	c1 e0 05             	shl    $0x5,%eax
    1ae7:	05 80 47 00 00       	add    $0x4780,%eax
    1aec:	83 c0 04             	add    $0x4,%eax
    1aef:	83 ec 0c             	sub    $0xc,%esp
    1af2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1af6:	dd 1c 24             	fstpl  (%esp)
    1af9:	50                   	push   %eax
    1afa:	68 4a 3a 00 00       	push   $0x3a4a
    1aff:	6a 01                	push   $0x1
    1b01:	e8 43 ed ff ff       	call   849 <printf>
    1b06:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1b09:	83 ec 08             	sub    $0x8,%esp
    1b0c:	68 5c 47 00 00       	push   $0x475c
    1b11:	68 80 47 00 00       	push   $0x4780
    1b16:	e8 90 1b 00 00       	call   36ab <writeVariables>
    1b1b:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1b1e:	e9 ac 02 00 00       	jmp    1dcf <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    1b23:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b26:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b29:	01 d0                	add    %edx,%eax
    1b2b:	0f b6 00             	movzbl (%eax),%eax
    1b2e:	84 c0                	test   %al,%al
    1b30:	75 1d                	jne    1b4f <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    1b32:	83 ec 0c             	sub    $0xc,%esp
    1b35:	68 51 3a 00 00       	push   $0x3a51
    1b3a:	6a 00                	push   $0x0
    1b3c:	6a 00                	push   $0x0
    1b3e:	6a 01                	push   $0x1
    1b40:	6a 04                	push   $0x4
    1b42:	e8 2a 14 00 00       	call   2f71 <color_printf>
    1b47:	83 c4 20             	add    $0x20,%esp
    1b4a:	e9 81 02 00 00       	jmp    1dd0 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    1b4f:	83 ec 0c             	sub    $0xc,%esp
    1b52:	68 68 3a 00 00       	push   $0x3a68
    1b57:	6a 00                	push   $0x0
    1b59:	6a 00                	push   $0x0
    1b5b:	6a 01                	push   $0x1
    1b5d:	6a 04                	push   $0x4
    1b5f:	e8 0d 14 00 00       	call   2f71 <color_printf>
    1b64:	83 c4 20             	add    $0x20,%esp
    1b67:	e9 64 02 00 00       	jmp    1dd0 <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1b6c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b6f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b72:	01 d0                	add    %edx,%eax
    1b74:	0f b6 00             	movzbl (%eax),%eax
    1b77:	3c 22                	cmp    $0x22,%al
    1b79:	0f 85 d5 01 00 00    	jne    1d54 <runCalcmd+0x571>
        {
          i++;
    1b7f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    1b83:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1b86:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1b89:	eb 04                	jmp    1b8f <runCalcmd+0x3ac>
          {
            i++;
    1b8b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1b8f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b92:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b95:	01 d0                	add    %edx,%eax
    1b97:	0f b6 00             	movzbl (%eax),%eax
    1b9a:	3c 22                	cmp    $0x22,%al
    1b9c:	74 0f                	je     1bad <runCalcmd+0x3ca>
    1b9e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1ba1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1ba4:	01 d0                	add    %edx,%eax
    1ba6:	0f b6 00             	movzbl (%eax),%eax
    1ba9:	84 c0                	test   %al,%al
    1bab:	75 de                	jne    1b8b <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1bad:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1bb0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1bb3:	01 d0                	add    %edx,%eax
    1bb5:	0f b6 00             	movzbl (%eax),%eax
    1bb8:	3c 22                	cmp    $0x22,%al
    1bba:	0f 85 4e 01 00 00    	jne    1d0e <runCalcmd+0x52b>
    1bc0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1bc3:	8d 50 01             	lea    0x1(%eax),%edx
    1bc6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1bc9:	01 d0                	add    %edx,%eax
    1bcb:	0f b6 00             	movzbl (%eax),%eax
    1bce:	84 c0                	test   %al,%al
    1bd0:	0f 85 38 01 00 00    	jne    1d0e <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1bd6:	a1 5c 47 00 00       	mov    0x475c,%eax
    1bdb:	85 c0                	test   %eax,%eax
    1bdd:	75 15                	jne    1bf4 <runCalcmd+0x411>
              readVariables(variables,&v_num);
    1bdf:	83 ec 08             	sub    $0x8,%esp
    1be2:	68 5c 47 00 00       	push   $0x475c
    1be7:	68 80 47 00 00       	push   $0x4780
    1bec:	e8 06 18 00 00       	call   33f7 <readVariables>
    1bf1:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1bf4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1bfb:	eb 26                	jmp    1c23 <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    1bfd:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1c00:	c1 e0 05             	shl    $0x5,%eax
    1c03:	05 80 47 00 00       	add    $0x4780,%eax
    1c08:	8d 50 04             	lea    0x4(%eax),%edx
    1c0b:	83 ec 08             	sub    $0x8,%esp
    1c0e:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1c11:	50                   	push   %eax
    1c12:	52                   	push   %edx
    1c13:	e8 84 e7 ff ff       	call   39c <strcmp>
    1c18:	83 c4 10             	add    $0x10,%esp
    1c1b:	85 c0                	test   %eax,%eax
    1c1d:	74 10                	je     1c2f <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    1c1f:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1c23:	a1 5c 47 00 00       	mov    0x475c,%eax
    1c28:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1c2b:	7c d0                	jl     1bfd <runCalcmd+0x41a>
    1c2d:	eb 01                	jmp    1c30 <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    1c2f:	90                   	nop
            }
            if(index == v_num) //new variable
    1c30:	a1 5c 47 00 00       	mov    0x475c,%eax
    1c35:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1c38:	75 2b                	jne    1c65 <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1c3a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1c3d:	c1 e0 05             	shl    $0x5,%eax
    1c40:	05 80 47 00 00       	add    $0x4780,%eax
    1c45:	8d 50 04             	lea    0x4(%eax),%edx
    1c48:	83 ec 08             	sub    $0x8,%esp
    1c4b:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1c4e:	50                   	push   %eax
    1c4f:	52                   	push   %edx
    1c50:	e8 17 e7 ff ff       	call   36c <strcpy>
    1c55:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1c58:	a1 5c 47 00 00       	mov    0x475c,%eax
    1c5d:	83 c0 01             	add    $0x1,%eax
    1c60:	a3 5c 47 00 00       	mov    %eax,0x475c
            }
            variables[index].type = V_STRING;
    1c65:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1c68:	c1 e0 05             	shl    $0x5,%eax
    1c6b:	05 80 47 00 00       	add    $0x4780,%eax
    1c70:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1c76:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1c79:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1c7c:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1c7f:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1c82:	83 c0 01             	add    $0x1,%eax
    1c85:	83 ec 0c             	sub    $0xc,%esp
    1c88:	50                   	push   %eax
    1c89:	e8 bd ee ff ff       	call   b4b <malloc>
    1c8e:	83 c4 10             	add    $0x10,%esp
    1c91:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1c94:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1c97:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1c9a:	01 d0                	add    %edx,%eax
    1c9c:	83 ec 08             	sub    $0x8,%esp
    1c9f:	50                   	push   %eax
    1ca0:	ff 75 b4             	pushl  -0x4c(%ebp)
    1ca3:	e8 c4 e6 ff ff       	call   36c <strcpy>
    1ca8:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1cab:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1cae:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1cb1:	01 d0                	add    %edx,%eax
    1cb3:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1cb6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1cb9:	c1 e0 05             	shl    $0x5,%eax
    1cbc:	8d 90 98 47 00 00    	lea    0x4798(%eax),%edx
    1cc2:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1cc5:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1cc7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1cca:	c1 e0 05             	shl    $0x5,%eax
    1ccd:	05 98 47 00 00       	add    $0x4798,%eax
    1cd2:	8b 00                	mov    (%eax),%eax
    1cd4:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1cd7:	c1 e2 05             	shl    $0x5,%edx
    1cda:	81 c2 80 47 00 00    	add    $0x4780,%edx
    1ce0:	83 c2 04             	add    $0x4,%edx
    1ce3:	50                   	push   %eax
    1ce4:	52                   	push   %edx
    1ce5:	68 89 3a 00 00       	push   $0x3a89
    1cea:	6a 01                	push   $0x1
    1cec:	e8 58 eb ff ff       	call   849 <printf>
    1cf1:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1cf4:	83 ec 08             	sub    $0x8,%esp
    1cf7:	68 5c 47 00 00       	push   $0x475c
    1cfc:	68 80 47 00 00       	push   $0x4780
    1d01:	e8 a5 19 00 00       	call   36ab <writeVariables>
    1d06:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1d09:	e9 c2 00 00 00       	jmp    1dd0 <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1d0e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1d11:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1d14:	01 d0                	add    %edx,%eax
    1d16:	0f b6 00             	movzbl (%eax),%eax
    1d19:	84 c0                	test   %al,%al
    1d1b:	75 1d                	jne    1d3a <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1d1d:	83 ec 0c             	sub    $0xc,%esp
    1d20:	68 92 3a 00 00       	push   $0x3a92
    1d25:	6a 00                	push   $0x0
    1d27:	6a 00                	push   $0x0
    1d29:	6a 01                	push   $0x1
    1d2b:	6a 04                	push   $0x4
    1d2d:	e8 3f 12 00 00       	call   2f71 <color_printf>
    1d32:	83 c4 20             	add    $0x20,%esp
    1d35:	e9 96 00 00 00       	jmp    1dd0 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1d3a:	83 ec 0c             	sub    $0xc,%esp
    1d3d:	68 a8 3a 00 00       	push   $0x3aa8
    1d42:	6a 00                	push   $0x0
    1d44:	6a 00                	push   $0x0
    1d46:	6a 01                	push   $0x1
    1d48:	6a 04                	push   $0x4
    1d4a:	e8 22 12 00 00       	call   2f71 <color_printf>
    1d4f:	83 c4 20             	add    $0x20,%esp
    1d52:	eb 7c                	jmp    1dd0 <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1d54:	83 ec 0c             	sub    $0xc,%esp
    1d57:	68 c9 3a 00 00       	push   $0x3ac9
    1d5c:	6a 00                	push   $0x0
    1d5e:	6a 00                	push   $0x0
    1d60:	6a 01                	push   $0x1
    1d62:	6a 04                	push   $0x4
    1d64:	e8 08 12 00 00       	call   2f71 <color_printf>
    1d69:	83 c4 20             	add    $0x20,%esp
    1d6c:	eb 62                	jmp    1dd0 <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1d6e:	83 ec 0c             	sub    $0xc,%esp
    1d71:	68 c9 3a 00 00       	push   $0x3ac9
    1d76:	6a 00                	push   $0x0
    1d78:	6a 00                	push   $0x0
    1d7a:	6a 01                	push   $0x1
    1d7c:	6a 04                	push   $0x4
    1d7e:	e8 ee 11 00 00       	call   2f71 <color_printf>
    1d83:	83 c4 20             	add    $0x20,%esp
    1d86:	eb 48                	jmp    1dd0 <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1d88:	83 ec 0c             	sub    $0xc,%esp
    1d8b:	ff 75 d4             	pushl  -0x2c(%ebp)
    1d8e:	e8 2b 01 00 00       	call   1ebe <Compute>
    1d93:	83 c4 10             	add    $0x10,%esp
    1d96:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1d99:	dd 05 90 3b 00 00    	fldl   0x3b90
    1d9f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1da3:	dd 1c 24             	fstpl  (%esp)
    1da6:	ff 75 ac             	pushl  -0x54(%ebp)
    1da9:	ff 75 a8             	pushl  -0x58(%ebp)
    1dac:	e8 96 f4 ff ff       	call   1247 <isEqual>
    1db1:	83 c4 10             	add    $0x10,%esp
    1db4:	85 c0                	test   %eax,%eax
    1db6:	75 18                	jne    1dd0 <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1db8:	ff 75 ac             	pushl  -0x54(%ebp)
    1dbb:	ff 75 a8             	pushl  -0x58(%ebp)
    1dbe:	68 e1 3a 00 00       	push   $0x3ae1
    1dc3:	6a 01                	push   $0x1
    1dc5:	e8 7f ea ff ff       	call   849 <printf>
    1dca:	83 c4 10             	add    $0x10,%esp
    1dcd:	eb 01                	jmp    1dd0 <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1dcf:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1dd0:	e8 c8 e7 ff ff       	call   59d <exit>

00001dd5 <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1dd5:	55                   	push   %ebp
    1dd6:	89 e5                	mov    %esp,%ebp
    1dd8:	83 ec 04             	sub    $0x4,%esp
    1ddb:	8b 45 08             	mov    0x8(%ebp),%eax
    1dde:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1de1:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1de5:	83 e8 23             	sub    $0x23,%eax
    1de8:	83 f8 0c             	cmp    $0xc,%eax
    1deb:	77 25                	ja     1e12 <GetLevel+0x3d>
    1ded:	8b 04 85 e8 3a 00 00 	mov    0x3ae8(,%eax,4),%eax
    1df4:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1df6:	b8 01 00 00 00       	mov    $0x1,%eax
    1dfb:	eb 1a                	jmp    1e17 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1dfd:	b8 02 00 00 00       	mov    $0x2,%eax
    1e02:	eb 13                	jmp    1e17 <GetLevel+0x42>
    case '(':
        return 0;
    1e04:	b8 00 00 00 00       	mov    $0x0,%eax
    1e09:	eb 0c                	jmp    1e17 <GetLevel+0x42>
    case '#':
        return -2;
    1e0b:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1e10:	eb 05                	jmp    1e17 <GetLevel+0x42>
    };
    return -1;
    1e12:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1e17:	c9                   	leave  
    1e18:	c3                   	ret    

00001e19 <Operate>:

double Operate(double a1, char op, double a2)
{
    1e19:	55                   	push   %ebp
    1e1a:	89 e5                	mov    %esp,%ebp
    1e1c:	83 ec 28             	sub    $0x28,%esp
    1e1f:	8b 45 10             	mov    0x10(%ebp),%eax
    1e22:	8b 55 08             	mov    0x8(%ebp),%edx
    1e25:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1e28:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e2b:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1e2e:	88 45 ec             	mov    %al,-0x14(%ebp)
    1e31:	8b 45 14             	mov    0x14(%ebp),%eax
    1e34:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1e37:	8b 45 18             	mov    0x18(%ebp),%eax
    1e3a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1e3d:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1e41:	83 f8 2b             	cmp    $0x2b,%eax
    1e44:	74 18                	je     1e5e <Operate+0x45>
    1e46:	83 f8 2b             	cmp    $0x2b,%eax
    1e49:	7f 07                	jg     1e52 <Operate+0x39>
    1e4b:	83 f8 2a             	cmp    $0x2a,%eax
    1e4e:	74 1e                	je     1e6e <Operate+0x55>
    1e50:	eb 68                	jmp    1eba <Operate+0xa1>
    1e52:	83 f8 2d             	cmp    $0x2d,%eax
    1e55:	74 0f                	je     1e66 <Operate+0x4d>
    1e57:	83 f8 2f             	cmp    $0x2f,%eax
    1e5a:	74 1a                	je     1e76 <Operate+0x5d>
    1e5c:	eb 5c                	jmp    1eba <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1e5e:	dd 45 f0             	fldl   -0x10(%ebp)
    1e61:	dc 45 e0             	faddl  -0x20(%ebp)
    1e64:	eb 56                	jmp    1ebc <Operate+0xa3>
    case '-':
        return a1 - a2;
    1e66:	dd 45 f0             	fldl   -0x10(%ebp)
    1e69:	dc 65 e0             	fsubl  -0x20(%ebp)
    1e6c:	eb 4e                	jmp    1ebc <Operate+0xa3>
    case '*':
        return a1 * a2;
    1e6e:	dd 45 f0             	fldl   -0x10(%ebp)
    1e71:	dc 4d e0             	fmull  -0x20(%ebp)
    1e74:	eb 46                	jmp    1ebc <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1e76:	d9 ee                	fldz   
    1e78:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e7c:	dd 1c 24             	fstpl  (%esp)
    1e7f:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e82:	ff 75 e0             	pushl  -0x20(%ebp)
    1e85:	e8 bd f3 ff ff       	call   1247 <isEqual>
    1e8a:	83 c4 10             	add    $0x10,%esp
    1e8d:	83 f8 01             	cmp    $0x1,%eax
    1e90:	75 20                	jne    1eb2 <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1e92:	83 ec 0c             	sub    $0xc,%esp
    1e95:	68 1c 3b 00 00       	push   $0x3b1c
    1e9a:	6a 00                	push   $0x0
    1e9c:	6a 00                	push   $0x0
    1e9e:	6a 01                	push   $0x1
    1ea0:	6a 04                	push   $0x4
    1ea2:	e8 ca 10 00 00       	call   2f71 <color_printf>
    1ea7:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1eaa:	dd 05 90 3b 00 00    	fldl   0x3b90
    1eb0:	eb 0a                	jmp    1ebc <Operate+0xa3>
        }
        else
          return a1 / a2;
    1eb2:	dd 45 f0             	fldl   -0x10(%ebp)
    1eb5:	dc 75 e0             	fdivl  -0x20(%ebp)
    1eb8:	eb 02                	jmp    1ebc <Operate+0xa3>
    };
    return 1;
    1eba:	d9 e8                	fld1   
}
    1ebc:	c9                   	leave  
    1ebd:	c3                   	ret    

00001ebe <Compute>:

double Compute(char *s)
{
    1ebe:	55                   	push   %ebp
    1ebf:	89 e5                	mov    %esp,%ebp
    1ec1:	53                   	push   %ebx
    1ec2:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1ec8:	e8 44 14 00 00       	call   3311 <dstack>
    1ecd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1ed0:	e8 73 13 00 00       	call   3248 <cstack>
    1ed5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1ed8:	83 ec 08             	sub    $0x8,%esp
    1edb:	6a 23                	push   $0x23
    1edd:	ff 75 e0             	pushl  -0x20(%ebp)
    1ee0:	e8 91 13 00 00       	call   3276 <pushc>
    1ee5:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1ee8:	83 ec 0c             	sub    $0xc,%esp
    1eeb:	ff 75 08             	pushl  0x8(%ebp)
    1eee:	e8 e8 e4 ff ff       	call   3db <strlen>
    1ef3:	83 c4 10             	add    $0x10,%esp
    1ef6:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1ef9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1f00:	c7 05 60 47 00 00 00 	movl   $0x0,0x4760
    1f07:	00 00 00 
    1f0a:	e9 58 05 00 00       	jmp    2467 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1f0f:	a1 60 47 00 00       	mov    0x4760,%eax
    1f14:	89 c2                	mov    %eax,%edx
    1f16:	8b 45 08             	mov    0x8(%ebp),%eax
    1f19:	01 d0                	add    %edx,%eax
    1f1b:	0f b6 00             	movzbl (%eax),%eax
    1f1e:	3c 24                	cmp    $0x24,%al
    1f20:	0f 85 f8 01 00 00    	jne    211e <Compute+0x260>
        {
          is_minus = 0;
    1f26:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1f2d:	a1 60 47 00 00       	mov    0x4760,%eax
    1f32:	83 c0 01             	add    $0x1,%eax
    1f35:	a3 60 47 00 00       	mov    %eax,0x4760
          if(s[g_pos] != '{')
    1f3a:	a1 60 47 00 00       	mov    0x4760,%eax
    1f3f:	89 c2                	mov    %eax,%edx
    1f41:	8b 45 08             	mov    0x8(%ebp),%eax
    1f44:	01 d0                	add    %edx,%eax
    1f46:	0f b6 00             	movzbl (%eax),%eax
    1f49:	3c 7b                	cmp    $0x7b,%al
    1f4b:	74 23                	je     1f70 <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1f4d:	83 ec 0c             	sub    $0xc,%esp
    1f50:	68 34 3b 00 00       	push   $0x3b34
    1f55:	6a 00                	push   $0x0
    1f57:	6a 00                	push   $0x0
    1f59:	6a 01                	push   $0x1
    1f5b:	6a 04                	push   $0x4
    1f5d:	e8 0f 10 00 00       	call   2f71 <color_printf>
    1f62:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1f65:	dd 05 90 3b 00 00    	fldl   0x3b90
    1f6b:	e9 24 06 00 00       	jmp    2594 <Compute+0x6d6>
          }
          int i=g_pos+1;
    1f70:	a1 60 47 00 00       	mov    0x4760,%eax
    1f75:	83 c0 01             	add    $0x1,%eax
    1f78:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1f7b:	eb 13                	jmp    1f90 <Compute+0xd2>
          {
            if(s[i] == '}')
    1f7d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1f80:	8b 45 08             	mov    0x8(%ebp),%eax
    1f83:	01 d0                	add    %edx,%eax
    1f85:	0f b6 00             	movzbl (%eax),%eax
    1f88:	3c 7d                	cmp    $0x7d,%al
    1f8a:	74 0e                	je     1f9a <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1f8c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1f90:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f93:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1f96:	7c e5                	jl     1f7d <Compute+0xbf>
    1f98:	eb 01                	jmp    1f9b <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1f9a:	90                   	nop
          }
          if(s[i] != '}')
    1f9b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1f9e:	8b 45 08             	mov    0x8(%ebp),%eax
    1fa1:	01 d0                	add    %edx,%eax
    1fa3:	0f b6 00             	movzbl (%eax),%eax
    1fa6:	3c 7d                	cmp    $0x7d,%al
    1fa8:	74 23                	je     1fcd <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1faa:	83 ec 0c             	sub    $0xc,%esp
    1fad:	68 42 3b 00 00       	push   $0x3b42
    1fb2:	6a 00                	push   $0x0
    1fb4:	6a 00                	push   $0x0
    1fb6:	6a 01                	push   $0x1
    1fb8:	6a 04                	push   $0x4
    1fba:	e8 b2 0f 00 00       	call   2f71 <color_printf>
    1fbf:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1fc2:	dd 05 90 3b 00 00    	fldl   0x3b90
    1fc8:	e9 c7 05 00 00       	jmp    2594 <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    1fcd:	a1 60 47 00 00       	mov    0x4760,%eax
    1fd2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1fd5:	29 c2                	sub    %eax,%edx
    1fd7:	89 d0                	mov    %edx,%eax
    1fd9:	83 e8 01             	sub    $0x1,%eax
    1fdc:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    1fdf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1fe6:	eb 27                	jmp    200f <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    1fe8:	8b 15 60 47 00 00    	mov    0x4760,%edx
    1fee:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ff1:	01 d0                	add    %edx,%eax
    1ff3:	8d 50 01             	lea    0x1(%eax),%edx
    1ff6:	8b 45 08             	mov    0x8(%ebp),%eax
    1ff9:	01 d0                	add    %edx,%eax
    1ffb:	0f b6 00             	movzbl (%eax),%eax
    1ffe:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    2004:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2007:	01 ca                	add    %ecx,%edx
    2009:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    200b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    200f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2012:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    2015:	7c d1                	jl     1fe8 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    2017:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    201d:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2020:	01 d0                	add    %edx,%eax
    2022:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    2025:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    202c:	a1 5c 47 00 00       	mov    0x475c,%eax
    2031:	85 c0                	test   %eax,%eax
    2033:	75 40                	jne    2075 <Compute+0x1b7>
            readVariables(variables,&v_num);
    2035:	83 ec 08             	sub    $0x8,%esp
    2038:	68 5c 47 00 00       	push   $0x475c
    203d:	68 80 47 00 00       	push   $0x4780
    2042:	e8 b0 13 00 00       	call   33f7 <readVariables>
    2047:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    204a:	eb 29                	jmp    2075 <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    204c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    204f:	c1 e0 05             	shl    $0x5,%eax
    2052:	05 80 47 00 00       	add    $0x4780,%eax
    2057:	8d 50 04             	lea    0x4(%eax),%edx
    205a:	83 ec 08             	sub    $0x8,%esp
    205d:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    2063:	50                   	push   %eax
    2064:	52                   	push   %edx
    2065:	e8 32 e3 ff ff       	call   39c <strcmp>
    206a:	83 c4 10             	add    $0x10,%esp
    206d:	85 c0                	test   %eax,%eax
    206f:	74 10                	je     2081 <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    2071:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    2075:	a1 5c 47 00 00       	mov    0x475c,%eax
    207a:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    207d:	7c cd                	jl     204c <Compute+0x18e>
    207f:	eb 01                	jmp    2082 <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    2081:	90                   	nop
          }
          if(index == v_num) //no such variable
    2082:	a1 5c 47 00 00       	mov    0x475c,%eax
    2087:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    208a:	75 2a                	jne    20b6 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    208c:	83 ec 08             	sub    $0x8,%esp
    208f:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    2095:	50                   	push   %eax
    2096:	68 50 3b 00 00       	push   $0x3b50
    209b:	6a 00                	push   $0x0
    209d:	6a 00                	push   $0x0
    209f:	6a 01                	push   $0x1
    20a1:	6a 04                	push   $0x4
    20a3:	e8 c9 0e 00 00       	call   2f71 <color_printf>
    20a8:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    20ab:	dd 05 90 3b 00 00    	fldl   0x3b90
    20b1:	e9 de 04 00 00       	jmp    2594 <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    20b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    20b9:	c1 e0 05             	shl    $0x5,%eax
    20bc:	05 80 47 00 00       	add    $0x4780,%eax
    20c1:	8b 00                	mov    (%eax),%eax
    20c3:	83 f8 02             	cmp    $0x2,%eax
    20c6:	75 23                	jne    20eb <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    20c8:	83 ec 0c             	sub    $0xc,%esp
    20cb:	68 6a 3b 00 00       	push   $0x3b6a
    20d0:	6a 00                	push   $0x0
    20d2:	6a 00                	push   $0x0
    20d4:	6a 01                	push   $0x1
    20d6:	6a 04                	push   $0x4
    20d8:	e8 94 0e 00 00       	call   2f71 <color_printf>
    20dd:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    20e0:	dd 05 90 3b 00 00    	fldl   0x3b90
    20e6:	e9 a9 04 00 00       	jmp    2594 <Compute+0x6d6>
          }
          g_pos = i+1;
    20eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20ee:	83 c0 01             	add    $0x1,%eax
    20f1:	a3 60 47 00 00       	mov    %eax,0x4760
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    20f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    20f9:	c1 e0 05             	shl    $0x5,%eax
    20fc:	05 90 47 00 00       	add    $0x4790,%eax
    2101:	dd 40 08             	fldl   0x8(%eax)
    2104:	83 ec 04             	sub    $0x4,%esp
    2107:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    210b:	dd 1c 24             	fstpl  (%esp)
    210e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2111:	e8 2f 12 00 00       	call   3345 <pushd>
    2116:	83 c4 10             	add    $0x10,%esp
    2119:	e9 49 03 00 00       	jmp    2467 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    211e:	a1 60 47 00 00       	mov    0x4760,%eax
    2123:	89 c2                	mov    %eax,%edx
    2125:	8b 45 08             	mov    0x8(%ebp),%eax
    2128:	01 d0                	add    %edx,%eax
    212a:	0f b6 00             	movzbl (%eax),%eax
    212d:	3c 2d                	cmp    $0x2d,%al
    212f:	75 3f                	jne    2170 <Compute+0x2b2>
    2131:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2135:	74 39                	je     2170 <Compute+0x2b2>
        {
            pushd(opnd,0);
    2137:	83 ec 04             	sub    $0x4,%esp
    213a:	d9 ee                	fldz   
    213c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2140:	dd 1c 24             	fstpl  (%esp)
    2143:	ff 75 e4             	pushl  -0x1c(%ebp)
    2146:	e8 fa 11 00 00       	call   3345 <pushd>
    214b:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    214e:	83 ec 08             	sub    $0x8,%esp
    2151:	6a 2d                	push   $0x2d
    2153:	ff 75 e0             	pushl  -0x20(%ebp)
    2156:	e8 1b 11 00 00       	call   3276 <pushc>
    215b:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    215e:	a1 60 47 00 00       	mov    0x4760,%eax
    2163:	83 c0 01             	add    $0x1,%eax
    2166:	a3 60 47 00 00       	mov    %eax,0x4760
    216b:	e9 f7 02 00 00       	jmp    2467 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    2170:	a1 60 47 00 00       	mov    0x4760,%eax
    2175:	89 c2                	mov    %eax,%edx
    2177:	8b 45 08             	mov    0x8(%ebp),%eax
    217a:	01 d0                	add    %edx,%eax
    217c:	0f b6 00             	movzbl (%eax),%eax
    217f:	3c 29                	cmp    $0x29,%al
    2181:	0f 85 01 01 00 00    	jne    2288 <Compute+0x3ca>
        {
            is_minus = 0;
    2187:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    218e:	a1 60 47 00 00       	mov    0x4760,%eax
    2193:	83 c0 01             	add    $0x1,%eax
    2196:	a3 60 47 00 00       	mov    %eax,0x4760
            while (topc(optr) != '(')
    219b:	e9 bf 00 00 00       	jmp    225f <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    21a0:	83 ec 0c             	sub    $0xc,%esp
    21a3:	ff 75 e4             	pushl  -0x1c(%ebp)
    21a6:	e8 37 12 00 00       	call   33e2 <topd>
    21ab:	83 c4 10             	add    $0x10,%esp
    21ae:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    21b1:	83 ec 0c             	sub    $0xc,%esp
    21b4:	ff 75 e4             	pushl  -0x1c(%ebp)
    21b7:	e8 dd 11 00 00       	call   3399 <popd>
    21bc:	dd d8                	fstp   %st(0)
    21be:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    21c1:	83 ec 0c             	sub    $0xc,%esp
    21c4:	ff 75 e4             	pushl  -0x1c(%ebp)
    21c7:	e8 16 12 00 00       	call   33e2 <topd>
    21cc:	83 c4 10             	add    $0x10,%esp
    21cf:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    21d2:	83 ec 0c             	sub    $0xc,%esp
    21d5:	ff 75 e4             	pushl  -0x1c(%ebp)
    21d8:	e8 bc 11 00 00       	call   3399 <popd>
    21dd:	dd d8                	fstp   %st(0)
    21df:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    21e2:	83 ec 0c             	sub    $0xc,%esp
    21e5:	ff 75 e0             	pushl  -0x20(%ebp)
    21e8:	e8 11 11 00 00       	call   32fe <topc>
    21ed:	83 c4 10             	add    $0x10,%esp
    21f0:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    21f3:	83 ec 0c             	sub    $0xc,%esp
    21f6:	ff 75 e0             	pushl  -0x20(%ebp)
    21f9:	e8 be 10 00 00       	call   32bc <popc>
    21fe:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    2201:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    2205:	83 ec 0c             	sub    $0xc,%esp
    2208:	ff 75 d4             	pushl  -0x2c(%ebp)
    220b:	ff 75 d0             	pushl  -0x30(%ebp)
    220e:	50                   	push   %eax
    220f:	ff 75 cc             	pushl  -0x34(%ebp)
    2212:	ff 75 c8             	pushl  -0x38(%ebp)
    2215:	e8 ff fb ff ff       	call   1e19 <Operate>
    221a:	83 c4 20             	add    $0x20,%esp
    221d:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    2220:	dd 05 90 3b 00 00    	fldl   0x3b90
    2226:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    222a:	dd 1c 24             	fstpl  (%esp)
    222d:	ff 75 bc             	pushl  -0x44(%ebp)
    2230:	ff 75 b8             	pushl  -0x48(%ebp)
    2233:	e8 0f f0 ff ff       	call   1247 <isEqual>
    2238:	83 c4 10             	add    $0x10,%esp
    223b:	83 f8 01             	cmp    $0x1,%eax
    223e:	75 0b                	jne    224b <Compute+0x38d>
                  return WRONG_ANS;
    2240:	dd 05 90 3b 00 00    	fldl   0x3b90
    2246:	e9 49 03 00 00       	jmp    2594 <Compute+0x6d6>
                pushd(opnd,result);
    224b:	83 ec 04             	sub    $0x4,%esp
    224e:	ff 75 bc             	pushl  -0x44(%ebp)
    2251:	ff 75 b8             	pushl  -0x48(%ebp)
    2254:	ff 75 e4             	pushl  -0x1c(%ebp)
    2257:	e8 e9 10 00 00       	call   3345 <pushd>
    225c:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    225f:	83 ec 0c             	sub    $0xc,%esp
    2262:	ff 75 e0             	pushl  -0x20(%ebp)
    2265:	e8 94 10 00 00       	call   32fe <topc>
    226a:	83 c4 10             	add    $0x10,%esp
    226d:	3c 28                	cmp    $0x28,%al
    226f:	0f 85 2b ff ff ff    	jne    21a0 <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    2275:	83 ec 0c             	sub    $0xc,%esp
    2278:	ff 75 e0             	pushl  -0x20(%ebp)
    227b:	e8 3c 10 00 00       	call   32bc <popc>
    2280:	83 c4 10             	add    $0x10,%esp
    2283:	e9 df 01 00 00       	jmp    2467 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    2288:	a1 60 47 00 00       	mov    0x4760,%eax
    228d:	89 c2                	mov    %eax,%edx
    228f:	8b 45 08             	mov    0x8(%ebp),%eax
    2292:	01 d0                	add    %edx,%eax
    2294:	0f b6 00             	movzbl (%eax),%eax
    2297:	3c 2f                	cmp    $0x2f,%al
    2299:	7e 49                	jle    22e4 <Compute+0x426>
    229b:	a1 60 47 00 00       	mov    0x4760,%eax
    22a0:	89 c2                	mov    %eax,%edx
    22a2:	8b 45 08             	mov    0x8(%ebp),%eax
    22a5:	01 d0                	add    %edx,%eax
    22a7:	0f b6 00             	movzbl (%eax),%eax
    22aa:	3c 39                	cmp    $0x39,%al
    22ac:	7f 36                	jg     22e4 <Compute+0x426>
        {
            is_minus = 0;
    22ae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    22b5:	83 ec 08             	sub    $0x8,%esp
    22b8:	68 60 47 00 00       	push   $0x4760
    22bd:	ff 75 08             	pushl  0x8(%ebp)
    22c0:	e8 c3 eb ff ff       	call   e88 <Translation>
    22c5:	83 c4 10             	add    $0x10,%esp
    22c8:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    22cb:	83 ec 04             	sub    $0x4,%esp
    22ce:	ff 75 b4             	pushl  -0x4c(%ebp)
    22d1:	ff 75 b0             	pushl  -0x50(%ebp)
    22d4:	ff 75 e4             	pushl  -0x1c(%ebp)
    22d7:	e8 69 10 00 00       	call   3345 <pushd>
    22dc:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    22df:	e9 83 01 00 00       	jmp    2467 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    22e4:	a1 60 47 00 00       	mov    0x4760,%eax
    22e9:	89 c2                	mov    %eax,%edx
    22eb:	8b 45 08             	mov    0x8(%ebp),%eax
    22ee:	01 d0                	add    %edx,%eax
    22f0:	0f b6 00             	movzbl (%eax),%eax
    22f3:	3c 28                	cmp    $0x28,%al
    22f5:	0f 85 f9 00 00 00    	jne    23f4 <Compute+0x536>
        {
            is_minus = 1;
    22fb:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    2302:	a1 60 47 00 00       	mov    0x4760,%eax
    2307:	89 c2                	mov    %eax,%edx
    2309:	8b 45 08             	mov    0x8(%ebp),%eax
    230c:	01 d0                	add    %edx,%eax
    230e:	0f b6 00             	movzbl (%eax),%eax
    2311:	0f be c0             	movsbl %al,%eax
    2314:	83 ec 08             	sub    $0x8,%esp
    2317:	50                   	push   %eax
    2318:	ff 75 e0             	pushl  -0x20(%ebp)
    231b:	e8 56 0f 00 00       	call   3276 <pushc>
    2320:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2323:	a1 60 47 00 00       	mov    0x4760,%eax
    2328:	83 c0 01             	add    $0x1,%eax
    232b:	a3 60 47 00 00       	mov    %eax,0x4760
    2330:	e9 32 01 00 00       	jmp    2467 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    2335:	83 ec 0c             	sub    $0xc,%esp
    2338:	ff 75 e4             	pushl  -0x1c(%ebp)
    233b:	e8 a2 10 00 00       	call   33e2 <topd>
    2340:	83 c4 10             	add    $0x10,%esp
    2343:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    2346:	83 ec 0c             	sub    $0xc,%esp
    2349:	ff 75 e4             	pushl  -0x1c(%ebp)
    234c:	e8 48 10 00 00       	call   3399 <popd>
    2351:	dd d8                	fstp   %st(0)
    2353:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2356:	83 ec 0c             	sub    $0xc,%esp
    2359:	ff 75 e4             	pushl  -0x1c(%ebp)
    235c:	e8 81 10 00 00       	call   33e2 <topd>
    2361:	83 c4 10             	add    $0x10,%esp
    2364:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    2367:	83 ec 0c             	sub    $0xc,%esp
    236a:	ff 75 e4             	pushl  -0x1c(%ebp)
    236d:	e8 27 10 00 00       	call   3399 <popd>
    2372:	dd d8                	fstp   %st(0)
    2374:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    2377:	83 ec 0c             	sub    $0xc,%esp
    237a:	ff 75 e0             	pushl  -0x20(%ebp)
    237d:	e8 7c 0f 00 00       	call   32fe <topc>
    2382:	83 c4 10             	add    $0x10,%esp
    2385:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    2388:	83 ec 0c             	sub    $0xc,%esp
    238b:	ff 75 e0             	pushl  -0x20(%ebp)
    238e:	e8 29 0f 00 00       	call   32bc <popc>
    2393:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    2396:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    239a:	83 ec 0c             	sub    $0xc,%esp
    239d:	ff 75 ac             	pushl  -0x54(%ebp)
    23a0:	ff 75 a8             	pushl  -0x58(%ebp)
    23a3:	50                   	push   %eax
    23a4:	ff 75 a4             	pushl  -0x5c(%ebp)
    23a7:	ff 75 a0             	pushl  -0x60(%ebp)
    23aa:	e8 6a fa ff ff       	call   1e19 <Operate>
    23af:	83 c4 20             	add    $0x20,%esp
    23b2:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    23b5:	dd 05 90 3b 00 00    	fldl   0x3b90
    23bb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    23bf:	dd 1c 24             	fstpl  (%esp)
    23c2:	ff 75 94             	pushl  -0x6c(%ebp)
    23c5:	ff 75 90             	pushl  -0x70(%ebp)
    23c8:	e8 7a ee ff ff       	call   1247 <isEqual>
    23cd:	83 c4 10             	add    $0x10,%esp
    23d0:	83 f8 01             	cmp    $0x1,%eax
    23d3:	75 0b                	jne    23e0 <Compute+0x522>
                  return WRONG_ANS;
    23d5:	dd 05 90 3b 00 00    	fldl   0x3b90
    23db:	e9 b4 01 00 00       	jmp    2594 <Compute+0x6d6>
                pushd(opnd,result);
    23e0:	83 ec 04             	sub    $0x4,%esp
    23e3:	ff 75 94             	pushl  -0x6c(%ebp)
    23e6:	ff 75 90             	pushl  -0x70(%ebp)
    23e9:	ff 75 e4             	pushl  -0x1c(%ebp)
    23ec:	e8 54 0f 00 00       	call   3345 <pushd>
    23f1:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    23f4:	a1 60 47 00 00       	mov    0x4760,%eax
    23f9:	89 c2                	mov    %eax,%edx
    23fb:	8b 45 08             	mov    0x8(%ebp),%eax
    23fe:	01 d0                	add    %edx,%eax
    2400:	0f b6 00             	movzbl (%eax),%eax
    2403:	0f be c0             	movsbl %al,%eax
    2406:	83 ec 0c             	sub    $0xc,%esp
    2409:	50                   	push   %eax
    240a:	e8 c6 f9 ff ff       	call   1dd5 <GetLevel>
    240f:	83 c4 10             	add    $0x10,%esp
    2412:	89 c3                	mov    %eax,%ebx
    2414:	83 ec 0c             	sub    $0xc,%esp
    2417:	ff 75 e0             	pushl  -0x20(%ebp)
    241a:	e8 df 0e 00 00       	call   32fe <topc>
    241f:	83 c4 10             	add    $0x10,%esp
    2422:	0f be c0             	movsbl %al,%eax
    2425:	83 ec 0c             	sub    $0xc,%esp
    2428:	50                   	push   %eax
    2429:	e8 a7 f9 ff ff       	call   1dd5 <GetLevel>
    242e:	83 c4 10             	add    $0x10,%esp
    2431:	39 c3                	cmp    %eax,%ebx
    2433:	0f 8e fc fe ff ff    	jle    2335 <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    2439:	a1 60 47 00 00       	mov    0x4760,%eax
    243e:	89 c2                	mov    %eax,%edx
    2440:	8b 45 08             	mov    0x8(%ebp),%eax
    2443:	01 d0                	add    %edx,%eax
    2445:	0f b6 00             	movzbl (%eax),%eax
    2448:	0f be c0             	movsbl %al,%eax
    244b:	83 ec 08             	sub    $0x8,%esp
    244e:	50                   	push   %eax
    244f:	ff 75 e0             	pushl  -0x20(%ebp)
    2452:	e8 1f 0e 00 00       	call   3276 <pushc>
    2457:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    245a:	a1 60 47 00 00       	mov    0x4760,%eax
    245f:	83 c0 01             	add    $0x1,%eax
    2462:	a3 60 47 00 00       	mov    %eax,0x4760
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    2467:	a1 60 47 00 00       	mov    0x4760,%eax
    246c:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    246f:	0f 8c 9a fa ff ff    	jl     1f0f <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2475:	e9 da 00 00 00       	jmp    2554 <Compute+0x696>
    {
        double a2 = topd(opnd);
    247a:	83 ec 0c             	sub    $0xc,%esp
    247d:	ff 75 e4             	pushl  -0x1c(%ebp)
    2480:	e8 5d 0f 00 00       	call   33e2 <topd>
    2485:	83 c4 10             	add    $0x10,%esp
    2488:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    248b:	83 ec 0c             	sub    $0xc,%esp
    248e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2491:	e8 03 0f 00 00       	call   3399 <popd>
    2496:	dd d8                	fstp   %st(0)
    2498:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    249b:	83 ec 0c             	sub    $0xc,%esp
    249e:	ff 75 e4             	pushl  -0x1c(%ebp)
    24a1:	e8 3c 0f 00 00       	call   33e2 <topd>
    24a6:	83 c4 10             	add    $0x10,%esp
    24a9:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    24af:	83 ec 0c             	sub    $0xc,%esp
    24b2:	ff 75 e4             	pushl  -0x1c(%ebp)
    24b5:	e8 df 0e 00 00       	call   3399 <popd>
    24ba:	dd d8                	fstp   %st(0)
    24bc:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    24bf:	83 ec 0c             	sub    $0xc,%esp
    24c2:	ff 75 e0             	pushl  -0x20(%ebp)
    24c5:	e8 34 0e 00 00       	call   32fe <topc>
    24ca:	83 c4 10             	add    $0x10,%esp
    24cd:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    24d3:	83 ec 0c             	sub    $0xc,%esp
    24d6:	ff 75 e0             	pushl  -0x20(%ebp)
    24d9:	e8 de 0d 00 00       	call   32bc <popc>
    24de:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    24e1:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    24e8:	83 ec 0c             	sub    $0xc,%esp
    24eb:	ff 75 84             	pushl  -0x7c(%ebp)
    24ee:	ff 75 80             	pushl  -0x80(%ebp)
    24f1:	50                   	push   %eax
    24f2:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    24f8:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    24fe:	e8 16 f9 ff ff       	call   1e19 <Operate>
    2503:	83 c4 20             	add    $0x20,%esp
    2506:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    250c:	dd 05 90 3b 00 00    	fldl   0x3b90
    2512:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2516:	dd 1c 24             	fstpl  (%esp)
    2519:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    251f:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2525:	e8 1d ed ff ff       	call   1247 <isEqual>
    252a:	83 c4 10             	add    $0x10,%esp
    252d:	83 f8 01             	cmp    $0x1,%eax
    2530:	75 08                	jne    253a <Compute+0x67c>
          return WRONG_ANS;
    2532:	dd 05 90 3b 00 00    	fldl   0x3b90
    2538:	eb 5a                	jmp    2594 <Compute+0x6d6>
        pushd(opnd,result);
    253a:	83 ec 04             	sub    $0x4,%esp
    253d:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2543:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2549:	ff 75 e4             	pushl  -0x1c(%ebp)
    254c:	e8 f4 0d 00 00       	call   3345 <pushd>
    2551:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    2554:	83 ec 0c             	sub    $0xc,%esp
    2557:	ff 75 e0             	pushl  -0x20(%ebp)
    255a:	e8 9f 0d 00 00       	call   32fe <topc>
    255f:	83 c4 10             	add    $0x10,%esp
    2562:	3c 23                	cmp    $0x23,%al
    2564:	0f 85 10 ff ff ff    	jne    247a <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    256a:	83 ec 0c             	sub    $0xc,%esp
    256d:	ff 75 e4             	pushl  -0x1c(%ebp)
    2570:	e8 94 e4 ff ff       	call   a09 <free>
    2575:	83 c4 10             	add    $0x10,%esp
    free(optr);
    2578:	83 ec 0c             	sub    $0xc,%esp
    257b:	ff 75 e0             	pushl  -0x20(%ebp)
    257e:	e8 86 e4 ff ff       	call   a09 <free>
    2583:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    2586:	83 ec 0c             	sub    $0xc,%esp
    2589:	ff 75 e4             	pushl  -0x1c(%ebp)
    258c:	e8 51 0e 00 00       	call   33e2 <topd>
    2591:	83 c4 10             	add    $0x10,%esp
}
    2594:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2597:	c9                   	leave  
    2598:	c3                   	ret    

00002599 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    2599:	55                   	push   %ebp
    259a:	89 e5                	mov    %esp,%ebp
    259c:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    259f:	8b 45 08             	mov    0x8(%ebp),%eax
    25a2:	8b 00                	mov    (%eax),%eax
    25a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    25a7:	eb 04                	jmp    25ad <gettoken+0x14>
    s++;
    25a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    25ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25b0:	3b 45 0c             	cmp    0xc(%ebp),%eax
    25b3:	73 1e                	jae    25d3 <gettoken+0x3a>
    25b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25b8:	0f b6 00             	movzbl (%eax),%eax
    25bb:	0f be c0             	movsbl %al,%eax
    25be:	83 ec 08             	sub    $0x8,%esp
    25c1:	50                   	push   %eax
    25c2:	68 14 47 00 00       	push   $0x4714
    25c7:	e8 50 de ff ff       	call   41c <strchr>
    25cc:	83 c4 10             	add    $0x10,%esp
    25cf:	85 c0                	test   %eax,%eax
    25d1:	75 d6                	jne    25a9 <gettoken+0x10>
    s++;
  if(q)
    25d3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    25d7:	74 08                	je     25e1 <gettoken+0x48>
    *q = s;
    25d9:	8b 45 10             	mov    0x10(%ebp),%eax
    25dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    25df:	89 10                	mov    %edx,(%eax)
  ret = *s;
    25e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25e4:	0f b6 00             	movzbl (%eax),%eax
    25e7:	0f be c0             	movsbl %al,%eax
    25ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    25ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25f0:	0f b6 00             	movzbl (%eax),%eax
    25f3:	0f be c0             	movsbl %al,%eax
    25f6:	83 f8 29             	cmp    $0x29,%eax
    25f9:	7f 14                	jg     260f <gettoken+0x76>
    25fb:	83 f8 28             	cmp    $0x28,%eax
    25fe:	7d 28                	jge    2628 <gettoken+0x8f>
    2600:	85 c0                	test   %eax,%eax
    2602:	0f 84 94 00 00 00    	je     269c <gettoken+0x103>
    2608:	83 f8 26             	cmp    $0x26,%eax
    260b:	74 1b                	je     2628 <gettoken+0x8f>
    260d:	eb 3a                	jmp    2649 <gettoken+0xb0>
    260f:	83 f8 3e             	cmp    $0x3e,%eax
    2612:	74 1a                	je     262e <gettoken+0x95>
    2614:	83 f8 3e             	cmp    $0x3e,%eax
    2617:	7f 0a                	jg     2623 <gettoken+0x8a>
    2619:	83 e8 3b             	sub    $0x3b,%eax
    261c:	83 f8 01             	cmp    $0x1,%eax
    261f:	77 28                	ja     2649 <gettoken+0xb0>
    2621:	eb 05                	jmp    2628 <gettoken+0x8f>
    2623:	83 f8 7c             	cmp    $0x7c,%eax
    2626:	75 21                	jne    2649 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    2628:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    262c:	eb 75                	jmp    26a3 <gettoken+0x10a>
  case '>':
    s++;
    262e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    2632:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2635:	0f b6 00             	movzbl (%eax),%eax
    2638:	3c 3e                	cmp    $0x3e,%al
    263a:	75 63                	jne    269f <gettoken+0x106>
      ret = '+';
    263c:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    2643:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    2647:	eb 56                	jmp    269f <gettoken+0x106>
  default:
    ret = 'a';
    2649:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2650:	eb 04                	jmp    2656 <gettoken+0xbd>
      s++;
    2652:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    2656:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2659:	3b 45 0c             	cmp    0xc(%ebp),%eax
    265c:	73 44                	jae    26a2 <gettoken+0x109>
    265e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2661:	0f b6 00             	movzbl (%eax),%eax
    2664:	0f be c0             	movsbl %al,%eax
    2667:	83 ec 08             	sub    $0x8,%esp
    266a:	50                   	push   %eax
    266b:	68 14 47 00 00       	push   $0x4714
    2670:	e8 a7 dd ff ff       	call   41c <strchr>
    2675:	83 c4 10             	add    $0x10,%esp
    2678:	85 c0                	test   %eax,%eax
    267a:	75 26                	jne    26a2 <gettoken+0x109>
    267c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    267f:	0f b6 00             	movzbl (%eax),%eax
    2682:	0f be c0             	movsbl %al,%eax
    2685:	83 ec 08             	sub    $0x8,%esp
    2688:	50                   	push   %eax
    2689:	68 1c 47 00 00       	push   $0x471c
    268e:	e8 89 dd ff ff       	call   41c <strchr>
    2693:	83 c4 10             	add    $0x10,%esp
    2696:	85 c0                	test   %eax,%eax
    2698:	74 b8                	je     2652 <gettoken+0xb9>
      s++;
    break;
    269a:	eb 06                	jmp    26a2 <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    269c:	90                   	nop
    269d:	eb 04                	jmp    26a3 <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    269f:	90                   	nop
    26a0:	eb 01                	jmp    26a3 <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    26a2:	90                   	nop
  }
  if(eq)
    26a3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    26a7:	74 0e                	je     26b7 <gettoken+0x11e>
    *eq = s;
    26a9:	8b 45 14             	mov    0x14(%ebp),%eax
    26ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
    26af:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    26b1:	eb 04                	jmp    26b7 <gettoken+0x11e>
    s++;
    26b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    26b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26ba:	3b 45 0c             	cmp    0xc(%ebp),%eax
    26bd:	73 1e                	jae    26dd <gettoken+0x144>
    26bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26c2:	0f b6 00             	movzbl (%eax),%eax
    26c5:	0f be c0             	movsbl %al,%eax
    26c8:	83 ec 08             	sub    $0x8,%esp
    26cb:	50                   	push   %eax
    26cc:	68 14 47 00 00       	push   $0x4714
    26d1:	e8 46 dd ff ff       	call   41c <strchr>
    26d6:	83 c4 10             	add    $0x10,%esp
    26d9:	85 c0                	test   %eax,%eax
    26db:	75 d6                	jne    26b3 <gettoken+0x11a>
    s++;
  *ps = s;
    26dd:	8b 45 08             	mov    0x8(%ebp),%eax
    26e0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    26e3:	89 10                	mov    %edx,(%eax)
  return ret;
    26e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    26e8:	c9                   	leave  
    26e9:	c3                   	ret    

000026ea <peek>:

int peek(char **ps, char *es, char *toks)
{
    26ea:	55                   	push   %ebp
    26eb:	89 e5                	mov    %esp,%ebp
    26ed:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    26f0:	8b 45 08             	mov    0x8(%ebp),%eax
    26f3:	8b 00                	mov    (%eax),%eax
    26f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    26f8:	eb 04                	jmp    26fe <peek+0x14>
    s++;
    26fa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    26fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2701:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2704:	73 1e                	jae    2724 <peek+0x3a>
    2706:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2709:	0f b6 00             	movzbl (%eax),%eax
    270c:	0f be c0             	movsbl %al,%eax
    270f:	83 ec 08             	sub    $0x8,%esp
    2712:	50                   	push   %eax
    2713:	68 14 47 00 00       	push   $0x4714
    2718:	e8 ff dc ff ff       	call   41c <strchr>
    271d:	83 c4 10             	add    $0x10,%esp
    2720:	85 c0                	test   %eax,%eax
    2722:	75 d6                	jne    26fa <peek+0x10>
    s++;
  *ps = s;
    2724:	8b 45 08             	mov    0x8(%ebp),%eax
    2727:	8b 55 f4             	mov    -0xc(%ebp),%edx
    272a:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    272c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    272f:	0f b6 00             	movzbl (%eax),%eax
    2732:	84 c0                	test   %al,%al
    2734:	74 23                	je     2759 <peek+0x6f>
    2736:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2739:	0f b6 00             	movzbl (%eax),%eax
    273c:	0f be c0             	movsbl %al,%eax
    273f:	83 ec 08             	sub    $0x8,%esp
    2742:	50                   	push   %eax
    2743:	ff 75 10             	pushl  0x10(%ebp)
    2746:	e8 d1 dc ff ff       	call   41c <strchr>
    274b:	83 c4 10             	add    $0x10,%esp
    274e:	85 c0                	test   %eax,%eax
    2750:	74 07                	je     2759 <peek+0x6f>
    2752:	b8 01 00 00 00       	mov    $0x1,%eax
    2757:	eb 05                	jmp    275e <peek+0x74>
    2759:	b8 00 00 00 00       	mov    $0x0,%eax
}
    275e:	c9                   	leave  
    275f:	c3                   	ret    

00002760 <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    2760:	55                   	push   %ebp
    2761:	89 e5                	mov    %esp,%ebp
    2763:	53                   	push   %ebx
    2764:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    2767:	8b 5d 08             	mov    0x8(%ebp),%ebx
    276a:	8b 45 08             	mov    0x8(%ebp),%eax
    276d:	83 ec 0c             	sub    $0xc,%esp
    2770:	50                   	push   %eax
    2771:	e8 65 dc ff ff       	call   3db <strlen>
    2776:	83 c4 10             	add    $0x10,%esp
    2779:	01 d8                	add    %ebx,%eax
    277b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    277e:	8b 45 08             	mov    0x8(%ebp),%eax
    2781:	0f b6 00             	movzbl (%eax),%eax
    2784:	3c 25                	cmp    $0x25,%al
    2786:	75 5d                	jne    27e5 <parsecmd+0x85>
  {
    int len = strlen(s);
    2788:	8b 45 08             	mov    0x8(%ebp),%eax
    278b:	83 ec 0c             	sub    $0xc,%esp
    278e:	50                   	push   %eax
    278f:	e8 47 dc ff ff       	call   3db <strlen>
    2794:	83 c4 10             	add    $0x10,%esp
    2797:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    279a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    279d:	83 ec 0c             	sub    $0xc,%esp
    27a0:	50                   	push   %eax
    27a1:	e8 a5 e3 ff ff       	call   b4b <malloc>
    27a6:	83 c4 10             	add    $0x10,%esp
    27a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    27ac:	8b 45 08             	mov    0x8(%ebp),%eax
    27af:	83 c0 01             	add    $0x1,%eax
    27b2:	83 ec 08             	sub    $0x8,%esp
    27b5:	50                   	push   %eax
    27b6:	ff 75 ec             	pushl  -0x14(%ebp)
    27b9:	e8 ae db ff ff       	call   36c <strcpy>
    27be:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    27c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27c4:	8d 50 fe             	lea    -0x2(%eax),%edx
    27c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27ca:	01 d0                	add    %edx,%eax
    27cc:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    27cf:	83 ec 0c             	sub    $0xc,%esp
    27d2:	ff 75 ec             	pushl  -0x14(%ebp)
    27d5:	e8 59 e9 ff ff       	call   1133 <calcmd>
    27da:	83 c4 10             	add    $0x10,%esp
    27dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    27e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27e3:	eb 6b                	jmp    2850 <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    27e5:	83 ec 08             	sub    $0x8,%esp
    27e8:	ff 75 f4             	pushl  -0xc(%ebp)
    27eb:	8d 45 08             	lea    0x8(%ebp),%eax
    27ee:	50                   	push   %eax
    27ef:	e8 61 00 00 00       	call   2855 <parseline>
    27f4:	83 c4 10             	add    $0x10,%esp
    27f7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    27fa:	83 ec 04             	sub    $0x4,%esp
    27fd:	68 98 3b 00 00       	push   $0x3b98
    2802:	ff 75 f4             	pushl  -0xc(%ebp)
    2805:	8d 45 08             	lea    0x8(%ebp),%eax
    2808:	50                   	push   %eax
    2809:	e8 dc fe ff ff       	call   26ea <peek>
    280e:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    2811:	8b 45 08             	mov    0x8(%ebp),%eax
    2814:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2817:	74 26                	je     283f <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    2819:	8b 45 08             	mov    0x8(%ebp),%eax
    281c:	83 ec 04             	sub    $0x4,%esp
    281f:	50                   	push   %eax
    2820:	68 99 3b 00 00       	push   $0x3b99
    2825:	6a 02                	push   $0x2
    2827:	e8 1d e0 ff ff       	call   849 <printf>
    282c:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    282f:	83 ec 0c             	sub    $0xc,%esp
    2832:	68 a8 3b 00 00       	push   $0x3ba8
    2837:	e8 f2 e3 ff ff       	call   c2e <panic1>
    283c:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    283f:	83 ec 0c             	sub    $0xc,%esp
    2842:	ff 75 e4             	pushl  -0x1c(%ebp)
    2845:	e8 eb 03 00 00       	call   2c35 <nulterminate>
    284a:	83 c4 10             	add    $0x10,%esp
  return cmd;
    284d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    2850:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2853:	c9                   	leave  
    2854:	c3                   	ret    

00002855 <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    2855:	55                   	push   %ebp
    2856:	89 e5                	mov    %esp,%ebp
    2858:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    285b:	83 ec 08             	sub    $0x8,%esp
    285e:	ff 75 0c             	pushl  0xc(%ebp)
    2861:	ff 75 08             	pushl  0x8(%ebp)
    2864:	e8 99 00 00 00       	call   2902 <parsepipe>
    2869:	83 c4 10             	add    $0x10,%esp
    286c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    286f:	eb 23                	jmp    2894 <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    2871:	6a 00                	push   $0x0
    2873:	6a 00                	push   $0x0
    2875:	ff 75 0c             	pushl  0xc(%ebp)
    2878:	ff 75 08             	pushl  0x8(%ebp)
    287b:	e8 19 fd ff ff       	call   2599 <gettoken>
    2880:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    2883:	83 ec 0c             	sub    $0xc,%esp
    2886:	ff 75 f4             	pushl  -0xc(%ebp)
    2889:	e8 66 e8 ff ff       	call   10f4 <backcmd>
    288e:	83 c4 10             	add    $0x10,%esp
    2891:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    2894:	83 ec 04             	sub    $0x4,%esp
    2897:	68 af 3b 00 00       	push   $0x3baf
    289c:	ff 75 0c             	pushl  0xc(%ebp)
    289f:	ff 75 08             	pushl  0x8(%ebp)
    28a2:	e8 43 fe ff ff       	call   26ea <peek>
    28a7:	83 c4 10             	add    $0x10,%esp
    28aa:	85 c0                	test   %eax,%eax
    28ac:	75 c3                	jne    2871 <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    28ae:	83 ec 04             	sub    $0x4,%esp
    28b1:	68 b1 3b 00 00       	push   $0x3bb1
    28b6:	ff 75 0c             	pushl  0xc(%ebp)
    28b9:	ff 75 08             	pushl  0x8(%ebp)
    28bc:	e8 29 fe ff ff       	call   26ea <peek>
    28c1:	83 c4 10             	add    $0x10,%esp
    28c4:	85 c0                	test   %eax,%eax
    28c6:	74 35                	je     28fd <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    28c8:	6a 00                	push   $0x0
    28ca:	6a 00                	push   $0x0
    28cc:	ff 75 0c             	pushl  0xc(%ebp)
    28cf:	ff 75 08             	pushl  0x8(%ebp)
    28d2:	e8 c2 fc ff ff       	call   2599 <gettoken>
    28d7:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    28da:	83 ec 08             	sub    $0x8,%esp
    28dd:	ff 75 0c             	pushl  0xc(%ebp)
    28e0:	ff 75 08             	pushl  0x8(%ebp)
    28e3:	e8 6d ff ff ff       	call   2855 <parseline>
    28e8:	83 c4 10             	add    $0x10,%esp
    28eb:	83 ec 08             	sub    $0x8,%esp
    28ee:	50                   	push   %eax
    28ef:	ff 75 f4             	pushl  -0xc(%ebp)
    28f2:	e8 b5 e7 ff ff       	call   10ac <listcmd>
    28f7:	83 c4 10             	add    $0x10,%esp
    28fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    28fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2900:	c9                   	leave  
    2901:	c3                   	ret    

00002902 <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    2902:	55                   	push   %ebp
    2903:	89 e5                	mov    %esp,%ebp
    2905:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    2908:	83 ec 08             	sub    $0x8,%esp
    290b:	ff 75 0c             	pushl  0xc(%ebp)
    290e:	ff 75 08             	pushl  0x8(%ebp)
    2911:	e8 ec 01 00 00       	call   2b02 <parseexec>
    2916:	83 c4 10             	add    $0x10,%esp
    2919:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    291c:	83 ec 04             	sub    $0x4,%esp
    291f:	68 b3 3b 00 00       	push   $0x3bb3
    2924:	ff 75 0c             	pushl  0xc(%ebp)
    2927:	ff 75 08             	pushl  0x8(%ebp)
    292a:	e8 bb fd ff ff       	call   26ea <peek>
    292f:	83 c4 10             	add    $0x10,%esp
    2932:	85 c0                	test   %eax,%eax
    2934:	74 35                	je     296b <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2936:	6a 00                	push   $0x0
    2938:	6a 00                	push   $0x0
    293a:	ff 75 0c             	pushl  0xc(%ebp)
    293d:	ff 75 08             	pushl  0x8(%ebp)
    2940:	e8 54 fc ff ff       	call   2599 <gettoken>
    2945:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2948:	83 ec 08             	sub    $0x8,%esp
    294b:	ff 75 0c             	pushl  0xc(%ebp)
    294e:	ff 75 08             	pushl  0x8(%ebp)
    2951:	e8 ac ff ff ff       	call   2902 <parsepipe>
    2956:	83 c4 10             	add    $0x10,%esp
    2959:	83 ec 08             	sub    $0x8,%esp
    295c:	50                   	push   %eax
    295d:	ff 75 f4             	pushl  -0xc(%ebp)
    2960:	e8 ff e6 ff ff       	call   1064 <pipecmd>
    2965:	83 c4 10             	add    $0x10,%esp
    2968:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    296b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    296e:	c9                   	leave  
    296f:	c3                   	ret    

00002970 <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    2970:	55                   	push   %ebp
    2971:	89 e5                	mov    %esp,%ebp
    2973:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2976:	e9 b6 00 00 00       	jmp    2a31 <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    297b:	6a 00                	push   $0x0
    297d:	6a 00                	push   $0x0
    297f:	ff 75 10             	pushl  0x10(%ebp)
    2982:	ff 75 0c             	pushl  0xc(%ebp)
    2985:	e8 0f fc ff ff       	call   2599 <gettoken>
    298a:	83 c4 10             	add    $0x10,%esp
    298d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    2990:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2993:	50                   	push   %eax
    2994:	8d 45 f0             	lea    -0x10(%ebp),%eax
    2997:	50                   	push   %eax
    2998:	ff 75 10             	pushl  0x10(%ebp)
    299b:	ff 75 0c             	pushl  0xc(%ebp)
    299e:	e8 f6 fb ff ff       	call   2599 <gettoken>
    29a3:	83 c4 10             	add    $0x10,%esp
    29a6:	83 f8 61             	cmp    $0x61,%eax
    29a9:	74 10                	je     29bb <parseredirs+0x4b>
      panic1("missing file for redirection");
    29ab:	83 ec 0c             	sub    $0xc,%esp
    29ae:	68 b5 3b 00 00       	push   $0x3bb5
    29b3:	e8 76 e2 ff ff       	call   c2e <panic1>
    29b8:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    29bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29be:	83 f8 3c             	cmp    $0x3c,%eax
    29c1:	74 0c                	je     29cf <parseredirs+0x5f>
    29c3:	83 f8 3e             	cmp    $0x3e,%eax
    29c6:	74 26                	je     29ee <parseredirs+0x7e>
    29c8:	83 f8 2b             	cmp    $0x2b,%eax
    29cb:	74 43                	je     2a10 <parseredirs+0xa0>
    29cd:	eb 62                	jmp    2a31 <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    29cf:	8b 55 ec             	mov    -0x14(%ebp),%edx
    29d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29d5:	83 ec 0c             	sub    $0xc,%esp
    29d8:	6a 00                	push   $0x0
    29da:	6a 00                	push   $0x0
    29dc:	52                   	push   %edx
    29dd:	50                   	push   %eax
    29de:	ff 75 08             	pushl  0x8(%ebp)
    29e1:	e8 1b e6 ff ff       	call   1001 <redircmd>
    29e6:	83 c4 20             	add    $0x20,%esp
    29e9:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    29ec:	eb 43                	jmp    2a31 <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    29ee:	8b 55 ec             	mov    -0x14(%ebp),%edx
    29f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29f4:	83 ec 0c             	sub    $0xc,%esp
    29f7:	6a 01                	push   $0x1
    29f9:	68 01 02 00 00       	push   $0x201
    29fe:	52                   	push   %edx
    29ff:	50                   	push   %eax
    2a00:	ff 75 08             	pushl  0x8(%ebp)
    2a03:	e8 f9 e5 ff ff       	call   1001 <redircmd>
    2a08:	83 c4 20             	add    $0x20,%esp
    2a0b:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2a0e:	eb 21                	jmp    2a31 <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    2a10:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2a13:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a16:	83 ec 0c             	sub    $0xc,%esp
    2a19:	6a 01                	push   $0x1
    2a1b:	68 01 02 00 00       	push   $0x201
    2a20:	52                   	push   %edx
    2a21:	50                   	push   %eax
    2a22:	ff 75 08             	pushl  0x8(%ebp)
    2a25:	e8 d7 e5 ff ff       	call   1001 <redircmd>
    2a2a:	83 c4 20             	add    $0x20,%esp
    2a2d:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2a30:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2a31:	83 ec 04             	sub    $0x4,%esp
    2a34:	68 d2 3b 00 00       	push   $0x3bd2
    2a39:	ff 75 10             	pushl  0x10(%ebp)
    2a3c:	ff 75 0c             	pushl  0xc(%ebp)
    2a3f:	e8 a6 fc ff ff       	call   26ea <peek>
    2a44:	83 c4 10             	add    $0x10,%esp
    2a47:	85 c0                	test   %eax,%eax
    2a49:	0f 85 2c ff ff ff    	jne    297b <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    2a4f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2a52:	c9                   	leave  
    2a53:	c3                   	ret    

00002a54 <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    2a54:	55                   	push   %ebp
    2a55:	89 e5                	mov    %esp,%ebp
    2a57:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2a5a:	83 ec 04             	sub    $0x4,%esp
    2a5d:	68 d5 3b 00 00       	push   $0x3bd5
    2a62:	ff 75 0c             	pushl  0xc(%ebp)
    2a65:	ff 75 08             	pushl  0x8(%ebp)
    2a68:	e8 7d fc ff ff       	call   26ea <peek>
    2a6d:	83 c4 10             	add    $0x10,%esp
    2a70:	85 c0                	test   %eax,%eax
    2a72:	75 10                	jne    2a84 <parseblock+0x30>
    panic1("parseblock");
    2a74:	83 ec 0c             	sub    $0xc,%esp
    2a77:	68 d7 3b 00 00       	push   $0x3bd7
    2a7c:	e8 ad e1 ff ff       	call   c2e <panic1>
    2a81:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2a84:	6a 00                	push   $0x0
    2a86:	6a 00                	push   $0x0
    2a88:	ff 75 0c             	pushl  0xc(%ebp)
    2a8b:	ff 75 08             	pushl  0x8(%ebp)
    2a8e:	e8 06 fb ff ff       	call   2599 <gettoken>
    2a93:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    2a96:	83 ec 08             	sub    $0x8,%esp
    2a99:	ff 75 0c             	pushl  0xc(%ebp)
    2a9c:	ff 75 08             	pushl  0x8(%ebp)
    2a9f:	e8 b1 fd ff ff       	call   2855 <parseline>
    2aa4:	83 c4 10             	add    $0x10,%esp
    2aa7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    2aaa:	83 ec 04             	sub    $0x4,%esp
    2aad:	68 e2 3b 00 00       	push   $0x3be2
    2ab2:	ff 75 0c             	pushl  0xc(%ebp)
    2ab5:	ff 75 08             	pushl  0x8(%ebp)
    2ab8:	e8 2d fc ff ff       	call   26ea <peek>
    2abd:	83 c4 10             	add    $0x10,%esp
    2ac0:	85 c0                	test   %eax,%eax
    2ac2:	75 10                	jne    2ad4 <parseblock+0x80>
    panic1("syntax - missing )");
    2ac4:	83 ec 0c             	sub    $0xc,%esp
    2ac7:	68 e4 3b 00 00       	push   $0x3be4
    2acc:	e8 5d e1 ff ff       	call   c2e <panic1>
    2ad1:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2ad4:	6a 00                	push   $0x0
    2ad6:	6a 00                	push   $0x0
    2ad8:	ff 75 0c             	pushl  0xc(%ebp)
    2adb:	ff 75 08             	pushl  0x8(%ebp)
    2ade:	e8 b6 fa ff ff       	call   2599 <gettoken>
    2ae3:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    2ae6:	83 ec 04             	sub    $0x4,%esp
    2ae9:	ff 75 0c             	pushl  0xc(%ebp)
    2aec:	ff 75 08             	pushl  0x8(%ebp)
    2aef:	ff 75 f4             	pushl  -0xc(%ebp)
    2af2:	e8 79 fe ff ff       	call   2970 <parseredirs>
    2af7:	83 c4 10             	add    $0x10,%esp
    2afa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    2afd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2b00:	c9                   	leave  
    2b01:	c3                   	ret    

00002b02 <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    2b02:	55                   	push   %ebp
    2b03:	89 e5                	mov    %esp,%ebp
    2b05:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    2b08:	83 ec 04             	sub    $0x4,%esp
    2b0b:	68 d5 3b 00 00       	push   $0x3bd5
    2b10:	ff 75 0c             	pushl  0xc(%ebp)
    2b13:	ff 75 08             	pushl  0x8(%ebp)
    2b16:	e8 cf fb ff ff       	call   26ea <peek>
    2b1b:	83 c4 10             	add    $0x10,%esp
    2b1e:	85 c0                	test   %eax,%eax
    2b20:	74 16                	je     2b38 <parseexec+0x36>
    return parseblock(ps, es);
    2b22:	83 ec 08             	sub    $0x8,%esp
    2b25:	ff 75 0c             	pushl  0xc(%ebp)
    2b28:	ff 75 08             	pushl  0x8(%ebp)
    2b2b:	e8 24 ff ff ff       	call   2a54 <parseblock>
    2b30:	83 c4 10             	add    $0x10,%esp
    2b33:	e9 fb 00 00 00       	jmp    2c33 <parseexec+0x131>

  ret = execcmd();
    2b38:	e8 8e e4 ff ff       	call   fcb <execcmd>
    2b3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    2b40:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b43:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2b46:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2b4d:	83 ec 04             	sub    $0x4,%esp
    2b50:	ff 75 0c             	pushl  0xc(%ebp)
    2b53:	ff 75 08             	pushl  0x8(%ebp)
    2b56:	ff 75 f0             	pushl  -0x10(%ebp)
    2b59:	e8 12 fe ff ff       	call   2970 <parseredirs>
    2b5e:	83 c4 10             	add    $0x10,%esp
    2b61:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    2b64:	e9 87 00 00 00       	jmp    2bf0 <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2b69:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2b6c:	50                   	push   %eax
    2b6d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2b70:	50                   	push   %eax
    2b71:	ff 75 0c             	pushl  0xc(%ebp)
    2b74:	ff 75 08             	pushl  0x8(%ebp)
    2b77:	e8 1d fa ff ff       	call   2599 <gettoken>
    2b7c:	83 c4 10             	add    $0x10,%esp
    2b7f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2b82:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2b86:	0f 84 84 00 00 00    	je     2c10 <parseexec+0x10e>
      break;
    if(tok != 'a')
    2b8c:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    2b90:	74 10                	je     2ba2 <parseexec+0xa0>
      panic1("syntax");
    2b92:	83 ec 0c             	sub    $0xc,%esp
    2b95:	68 a8 3b 00 00       	push   $0x3ba8
    2b9a:	e8 8f e0 ff ff       	call   c2e <panic1>
    2b9f:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    2ba2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    2ba5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ba8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2bab:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    2baf:	8b 55 e0             	mov    -0x20(%ebp),%edx
    2bb2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2bb5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2bb8:	83 c1 08             	add    $0x8,%ecx
    2bbb:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    2bbf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    2bc3:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2bc7:	7e 10                	jle    2bd9 <parseexec+0xd7>
      panic1("too many args");
    2bc9:	83 ec 0c             	sub    $0xc,%esp
    2bcc:	68 f7 3b 00 00       	push   $0x3bf7
    2bd1:	e8 58 e0 ff ff       	call   c2e <panic1>
    2bd6:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2bd9:	83 ec 04             	sub    $0x4,%esp
    2bdc:	ff 75 0c             	pushl  0xc(%ebp)
    2bdf:	ff 75 08             	pushl  0x8(%ebp)
    2be2:	ff 75 f0             	pushl  -0x10(%ebp)
    2be5:	e8 86 fd ff ff       	call   2970 <parseredirs>
    2bea:	83 c4 10             	add    $0x10,%esp
    2bed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    2bf0:	83 ec 04             	sub    $0x4,%esp
    2bf3:	68 05 3c 00 00       	push   $0x3c05
    2bf8:	ff 75 0c             	pushl  0xc(%ebp)
    2bfb:	ff 75 08             	pushl  0x8(%ebp)
    2bfe:	e8 e7 fa ff ff       	call   26ea <peek>
    2c03:	83 c4 10             	add    $0x10,%esp
    2c06:	85 c0                	test   %eax,%eax
    2c08:	0f 84 5b ff ff ff    	je     2b69 <parseexec+0x67>
    2c0e:	eb 01                	jmp    2c11 <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    2c10:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    2c11:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c14:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c17:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    2c1e:	00 
  cmd->eargv[argc] = 0;
    2c1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c22:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c25:	83 c2 08             	add    $0x8,%edx
    2c28:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    2c2f:	00 
  return ret;
    2c30:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2c33:	c9                   	leave  
    2c34:	c3                   	ret    

00002c35 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2c35:	55                   	push   %ebp
    2c36:	89 e5                	mov    %esp,%ebp
    2c38:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2c3b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2c3f:	75 0a                	jne    2c4b <nulterminate+0x16>
    return 0;
    2c41:	b8 00 00 00 00       	mov    $0x0,%eax
    2c46:	e9 e4 00 00 00       	jmp    2d2f <nulterminate+0xfa>
  
  switch(cmd->type){
    2c4b:	8b 45 08             	mov    0x8(%ebp),%eax
    2c4e:	8b 00                	mov    (%eax),%eax
    2c50:	83 f8 05             	cmp    $0x5,%eax
    2c53:	0f 87 d3 00 00 00    	ja     2d2c <nulterminate+0xf7>
    2c59:	8b 04 85 0c 3c 00 00 	mov    0x3c0c(,%eax,4),%eax
    2c60:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2c62:	8b 45 08             	mov    0x8(%ebp),%eax
    2c65:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2c68:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2c6f:	eb 14                	jmp    2c85 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2c71:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c74:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c77:	83 c2 08             	add    $0x8,%edx
    2c7a:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2c7e:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2c81:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2c85:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c88:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c8b:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2c8f:	85 c0                	test   %eax,%eax
    2c91:	75 de                	jne    2c71 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2c93:	e9 94 00 00 00       	jmp    2d2c <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2c98:	8b 45 08             	mov    0x8(%ebp),%eax
    2c9b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2c9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ca1:	8b 40 04             	mov    0x4(%eax),%eax
    2ca4:	83 ec 0c             	sub    $0xc,%esp
    2ca7:	50                   	push   %eax
    2ca8:	e8 88 ff ff ff       	call   2c35 <nulterminate>
    2cad:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2cb0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2cb3:	8b 40 0c             	mov    0xc(%eax),%eax
    2cb6:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2cb9:	eb 71                	jmp    2d2c <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2cbb:	8b 45 08             	mov    0x8(%ebp),%eax
    2cbe:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2cc1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2cc4:	8b 40 04             	mov    0x4(%eax),%eax
    2cc7:	83 ec 0c             	sub    $0xc,%esp
    2cca:	50                   	push   %eax
    2ccb:	e8 65 ff ff ff       	call   2c35 <nulterminate>
    2cd0:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2cd3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2cd6:	8b 40 08             	mov    0x8(%eax),%eax
    2cd9:	83 ec 0c             	sub    $0xc,%esp
    2cdc:	50                   	push   %eax
    2cdd:	e8 53 ff ff ff       	call   2c35 <nulterminate>
    2ce2:	83 c4 10             	add    $0x10,%esp
    break;
    2ce5:	eb 45                	jmp    2d2c <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2ce7:	8b 45 08             	mov    0x8(%ebp),%eax
    2cea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2ced:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2cf0:	8b 40 04             	mov    0x4(%eax),%eax
    2cf3:	83 ec 0c             	sub    $0xc,%esp
    2cf6:	50                   	push   %eax
    2cf7:	e8 39 ff ff ff       	call   2c35 <nulterminate>
    2cfc:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2cff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d02:	8b 40 08             	mov    0x8(%eax),%eax
    2d05:	83 ec 0c             	sub    $0xc,%esp
    2d08:	50                   	push   %eax
    2d09:	e8 27 ff ff ff       	call   2c35 <nulterminate>
    2d0e:	83 c4 10             	add    $0x10,%esp
    break;
    2d11:	eb 19                	jmp    2d2c <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2d13:	8b 45 08             	mov    0x8(%ebp),%eax
    2d16:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2d19:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2d1c:	8b 40 04             	mov    0x4(%eax),%eax
    2d1f:	83 ec 0c             	sub    $0xc,%esp
    2d22:	50                   	push   %eax
    2d23:	e8 0d ff ff ff       	call   2c35 <nulterminate>
    2d28:	83 c4 10             	add    $0x10,%esp
    break;
    2d2b:	90                   	nop
  }
  return cmd;
    2d2c:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2d2f:	c9                   	leave  
    2d30:	c3                   	ret    

00002d31 <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2d31:	55                   	push   %ebp
    2d32:	89 e5                	mov    %esp,%ebp
    2d34:	83 ec 18             	sub    $0x18,%esp
    2d37:	8b 45 08             	mov    0x8(%ebp),%eax
    2d3a:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2d3d:	83 ec 08             	sub    $0x8,%esp
    2d40:	ff 75 18             	pushl  0x18(%ebp)
    2d43:	ff 75 14             	pushl  0x14(%ebp)
    2d46:	ff 75 10             	pushl  0x10(%ebp)
    2d49:	ff 75 0c             	pushl  0xc(%ebp)
    2d4c:	6a 01                	push   $0x1
    2d4e:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2d51:	50                   	push   %eax
    2d52:	e8 e6 d8 ff ff       	call   63d <colorwrite>
    2d57:	83 c4 20             	add    $0x20,%esp
}
    2d5a:	90                   	nop
    2d5b:	c9                   	leave  
    2d5c:	c3                   	ret    

00002d5d <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2d5d:	55                   	push   %ebp
    2d5e:	89 e5                	mov    %esp,%ebp
    2d60:	53                   	push   %ebx
    2d61:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2d64:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2d6b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2d6f:	74 17                	je     2d88 <color_printint+0x2b>
    2d71:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2d75:	79 11                	jns    2d88 <color_printint+0x2b>
    neg = 1;
    2d77:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2d7e:	8b 45 08             	mov    0x8(%ebp),%eax
    2d81:	f7 d8                	neg    %eax
    2d83:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2d86:	eb 06                	jmp    2d8e <color_printint+0x31>
  } else {
    x = xx;
    2d88:	8b 45 08             	mov    0x8(%ebp),%eax
    2d8b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2d8e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2d95:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2d98:	8d 41 01             	lea    0x1(%ecx),%eax
    2d9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2d9e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2da1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2da4:	ba 00 00 00 00       	mov    $0x0,%edx
    2da9:	f7 f3                	div    %ebx
    2dab:	89 d0                	mov    %edx,%eax
    2dad:	0f b6 80 24 47 00 00 	movzbl 0x4724(%eax),%eax
    2db4:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2db8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2dbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2dbe:	ba 00 00 00 00       	mov    $0x0,%edx
    2dc3:	f7 f3                	div    %ebx
    2dc5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2dc8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2dcc:	75 c7                	jne    2d95 <color_printint+0x38>
  if(neg)
    2dce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2dd2:	74 36                	je     2e0a <color_printint+0xad>
    buf[i++] = '-';
    2dd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dd7:	8d 50 01             	lea    0x1(%eax),%edx
    2dda:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2ddd:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2de2:	eb 26                	jmp    2e0a <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2de4:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2de7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dea:	01 d0                	add    %edx,%eax
    2dec:	0f b6 00             	movzbl (%eax),%eax
    2def:	0f be c0             	movsbl %al,%eax
    2df2:	83 ec 0c             	sub    $0xc,%esp
    2df5:	ff 75 20             	pushl  0x20(%ebp)
    2df8:	ff 75 1c             	pushl  0x1c(%ebp)
    2dfb:	ff 75 18             	pushl  0x18(%ebp)
    2dfe:	ff 75 14             	pushl  0x14(%ebp)
    2e01:	50                   	push   %eax
    2e02:	e8 2a ff ff ff       	call   2d31 <color_putc>
    2e07:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2e0a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2e0e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e12:	79 d0                	jns    2de4 <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2e14:	90                   	nop
    2e15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2e18:	c9                   	leave  
    2e19:	c3                   	ret    

00002e1a <getInteger>:

static int getInteger(double num)
{
    2e1a:	55                   	push   %ebp
    2e1b:	89 e5                	mov    %esp,%ebp
    2e1d:	83 ec 18             	sub    $0x18,%esp
    2e20:	8b 45 08             	mov    0x8(%ebp),%eax
    2e23:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2e26:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e29:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2e2c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2e33:	eb 0e                	jmp    2e43 <getInteger+0x29>
  {
    num -= 1;
    2e35:	dd 45 e8             	fldl   -0x18(%ebp)
    2e38:	d9 e8                	fld1   
    2e3a:	de e9                	fsubrp %st,%st(1)
    2e3c:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2e3f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2e43:	dd 45 e8             	fldl   -0x18(%ebp)
    2e46:	d9 e8                	fld1   
    2e48:	d9 c9                	fxch   %st(1)
    2e4a:	df e9                	fucomip %st(1),%st
    2e4c:	dd d8                	fstp   %st(0)
    2e4e:	77 e5                	ja     2e35 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2e50:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2e53:	c9                   	leave  
    2e54:	c3                   	ret    

00002e55 <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2e55:	55                   	push   %ebp
    2e56:	89 e5                	mov    %esp,%ebp
    2e58:	83 ec 28             	sub    $0x28,%esp
    2e5b:	8b 45 08             	mov    0x8(%ebp),%eax
    2e5e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2e61:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e64:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2e67:	d9 ee                	fldz   
    2e69:	dd 45 e0             	fldl   -0x20(%ebp)
    2e6c:	d9 c9                	fxch   %st(1)
    2e6e:	df e9                	fucomip %st(1),%st
    2e70:	dd d8                	fstp   %st(0)
    2e72:	76 21                	jbe    2e95 <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2e74:	83 ec 0c             	sub    $0xc,%esp
    2e77:	ff 75 1c             	pushl  0x1c(%ebp)
    2e7a:	ff 75 18             	pushl  0x18(%ebp)
    2e7d:	ff 75 14             	pushl  0x14(%ebp)
    2e80:	ff 75 10             	pushl  0x10(%ebp)
    2e83:	6a 2d                	push   $0x2d
    2e85:	e8 a7 fe ff ff       	call   2d31 <color_putc>
    2e8a:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2e8d:	dd 45 e0             	fldl   -0x20(%ebp)
    2e90:	d9 e0                	fchs   
    2e92:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2e95:	83 ec 08             	sub    $0x8,%esp
    2e98:	ff 75 e4             	pushl  -0x1c(%ebp)
    2e9b:	ff 75 e0             	pushl  -0x20(%ebp)
    2e9e:	e8 77 ff ff ff       	call   2e1a <getInteger>
    2ea3:	83 c4 10             	add    $0x10,%esp
    2ea6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2ea9:	83 ec 04             	sub    $0x4,%esp
    2eac:	ff 75 1c             	pushl  0x1c(%ebp)
    2eaf:	ff 75 18             	pushl  0x18(%ebp)
    2eb2:	ff 75 14             	pushl  0x14(%ebp)
    2eb5:	ff 75 10             	pushl  0x10(%ebp)
    2eb8:	6a 01                	push   $0x1
    2eba:	6a 0a                	push   $0xa
    2ebc:	ff 75 f0             	pushl  -0x10(%ebp)
    2ebf:	e8 99 fe ff ff       	call   2d5d <color_printint>
    2ec4:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2ec7:	db 45 f0             	fildl  -0x10(%ebp)
    2eca:	dd 45 e0             	fldl   -0x20(%ebp)
    2ecd:	de e1                	fsubp  %st,%st(1)
    2ecf:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2ed2:	dd 45 e0             	fldl   -0x20(%ebp)
    2ed5:	dd 05 30 3c 00 00    	fldl   0x3c30
    2edb:	d9 c9                	fxch   %st(1)
    2edd:	df e9                	fucomip %st(1),%st
    2edf:	dd d8                	fstp   %st(0)
    2ee1:	76 19                	jbe    2efc <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2ee3:	83 ec 0c             	sub    $0xc,%esp
    2ee6:	ff 75 1c             	pushl  0x1c(%ebp)
    2ee9:	ff 75 18             	pushl  0x18(%ebp)
    2eec:	ff 75 14             	pushl  0x14(%ebp)
    2eef:	ff 75 10             	pushl  0x10(%ebp)
    2ef2:	6a 2e                	push   $0x2e
    2ef4:	e8 38 fe ff ff       	call   2d31 <color_putc>
    2ef9:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2efc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2f03:	eb 55                	jmp    2f5a <color_printdbl+0x105>
  {
    num = num*10;
    2f05:	dd 45 e0             	fldl   -0x20(%ebp)
    2f08:	dd 05 38 3c 00 00    	fldl   0x3c38
    2f0e:	de c9                	fmulp  %st,%st(1)
    2f10:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2f13:	83 ec 08             	sub    $0x8,%esp
    2f16:	ff 75 e4             	pushl  -0x1c(%ebp)
    2f19:	ff 75 e0             	pushl  -0x20(%ebp)
    2f1c:	e8 f9 fe ff ff       	call   2e1a <getInteger>
    2f21:	83 c4 10             	add    $0x10,%esp
    2f24:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2f27:	83 ec 04             	sub    $0x4,%esp
    2f2a:	ff 75 1c             	pushl  0x1c(%ebp)
    2f2d:	ff 75 18             	pushl  0x18(%ebp)
    2f30:	ff 75 14             	pushl  0x14(%ebp)
    2f33:	ff 75 10             	pushl  0x10(%ebp)
    2f36:	6a 01                	push   $0x1
    2f38:	6a 0a                	push   $0xa
    2f3a:	ff 75 f0             	pushl  -0x10(%ebp)
    2f3d:	e8 1b fe ff ff       	call   2d5d <color_printint>
    2f42:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2f45:	db 45 f0             	fildl  -0x10(%ebp)
    2f48:	dd 45 e0             	fldl   -0x20(%ebp)
    2f4b:	de e1                	fsubp  %st,%st(1)
    2f4d:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2f50:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2f54:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2f58:	7f 13                	jg     2f6d <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2f5a:	dd 45 e0             	fldl   -0x20(%ebp)
    2f5d:	dd 05 30 3c 00 00    	fldl   0x3c30
    2f63:	d9 c9                	fxch   %st(1)
    2f65:	df e9                	fucomip %st(1),%st
    2f67:	dd d8                	fstp   %st(0)
    2f69:	77 9a                	ja     2f05 <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2f6b:	eb 01                	jmp    2f6e <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2f6d:	90                   	nop
    }
  }
}
    2f6e:	90                   	nop
    2f6f:	c9                   	leave  
    2f70:	c3                   	ret    

00002f71 <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2f71:	55                   	push   %ebp
    2f72:	89 e5                	mov    %esp,%ebp
    2f74:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2f77:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2f7e:	8d 45 18             	lea    0x18(%ebp),%eax
    2f81:	83 c0 04             	add    $0x4,%eax
    2f84:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2f87:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2f8e:	e9 e2 01 00 00       	jmp    3175 <color_printf+0x204>
    c = fmt[i] & 0xff;
    2f93:	8b 55 18             	mov    0x18(%ebp),%edx
    2f96:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f99:	01 d0                	add    %edx,%eax
    2f9b:	0f b6 00             	movzbl (%eax),%eax
    2f9e:	0f be c0             	movsbl %al,%eax
    2fa1:	25 ff 00 00 00       	and    $0xff,%eax
    2fa6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2fa9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2fad:	75 35                	jne    2fe4 <color_printf+0x73>
      if(c == '%'){
    2faf:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2fb3:	75 0c                	jne    2fc1 <color_printf+0x50>
        state = '%';
    2fb5:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2fbc:	e9 b0 01 00 00       	jmp    3171 <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    2fc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2fc4:	0f be c0             	movsbl %al,%eax
    2fc7:	83 ec 0c             	sub    $0xc,%esp
    2fca:	ff 75 14             	pushl  0x14(%ebp)
    2fcd:	ff 75 10             	pushl  0x10(%ebp)
    2fd0:	ff 75 0c             	pushl  0xc(%ebp)
    2fd3:	ff 75 08             	pushl  0x8(%ebp)
    2fd6:	50                   	push   %eax
    2fd7:	e8 55 fd ff ff       	call   2d31 <color_putc>
    2fdc:	83 c4 20             	add    $0x20,%esp
    2fdf:	e9 8d 01 00 00       	jmp    3171 <color_printf+0x200>
      }
    } else if(state == '%'){
    2fe4:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2fe8:	0f 85 83 01 00 00    	jne    3171 <color_printf+0x200>
      if(c == 'd'){
    2fee:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2ff2:	75 2a                	jne    301e <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    2ff4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ff7:	8b 00                	mov    (%eax),%eax
    2ff9:	83 ec 04             	sub    $0x4,%esp
    2ffc:	ff 75 14             	pushl  0x14(%ebp)
    2fff:	ff 75 10             	pushl  0x10(%ebp)
    3002:	ff 75 0c             	pushl  0xc(%ebp)
    3005:	ff 75 08             	pushl  0x8(%ebp)
    3008:	6a 01                	push   $0x1
    300a:	6a 0a                	push   $0xa
    300c:	50                   	push   %eax
    300d:	e8 4b fd ff ff       	call   2d5d <color_printint>
    3012:	83 c4 20             	add    $0x20,%esp
        ap++;
    3015:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3019:	e9 4c 01 00 00       	jmp    316a <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    301e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3022:	74 06                	je     302a <color_printf+0xb9>
    3024:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    3028:	75 2a                	jne    3054 <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    302a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    302d:	8b 00                	mov    (%eax),%eax
    302f:	83 ec 04             	sub    $0x4,%esp
    3032:	ff 75 14             	pushl  0x14(%ebp)
    3035:	ff 75 10             	pushl  0x10(%ebp)
    3038:	ff 75 0c             	pushl  0xc(%ebp)
    303b:	ff 75 08             	pushl  0x8(%ebp)
    303e:	6a 00                	push   $0x0
    3040:	6a 10                	push   $0x10
    3042:	50                   	push   %eax
    3043:	e8 15 fd ff ff       	call   2d5d <color_printint>
    3048:	83 c4 20             	add    $0x20,%esp
        ap++;
    304b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    304f:	e9 16 01 00 00       	jmp    316a <color_printf+0x1f9>
      } else if(c == 's'){
    3054:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    3058:	75 4f                	jne    30a9 <color_printf+0x138>
        s = (char*)*ap;
    305a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    305d:	8b 00                	mov    (%eax),%eax
    305f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    3062:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    3066:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    306a:	75 2e                	jne    309a <color_printf+0x129>
          s = "(null)";
    306c:	c7 45 f4 28 3c 00 00 	movl   $0x3c28,-0xc(%ebp)
        while(*s != 0){
    3073:	eb 25                	jmp    309a <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    3075:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3078:	0f b6 00             	movzbl (%eax),%eax
    307b:	0f be c0             	movsbl %al,%eax
    307e:	83 ec 0c             	sub    $0xc,%esp
    3081:	ff 75 14             	pushl  0x14(%ebp)
    3084:	ff 75 10             	pushl  0x10(%ebp)
    3087:	ff 75 0c             	pushl  0xc(%ebp)
    308a:	ff 75 08             	pushl  0x8(%ebp)
    308d:	50                   	push   %eax
    308e:	e8 9e fc ff ff       	call   2d31 <color_putc>
    3093:	83 c4 20             	add    $0x20,%esp
          s++;
    3096:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    309a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    309d:	0f b6 00             	movzbl (%eax),%eax
    30a0:	84 c0                	test   %al,%al
    30a2:	75 d1                	jne    3075 <color_printf+0x104>
    30a4:	e9 c1 00 00 00       	jmp    316a <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    30a9:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    30ad:	75 29                	jne    30d8 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    30af:	8b 45 e8             	mov    -0x18(%ebp),%eax
    30b2:	8b 00                	mov    (%eax),%eax
    30b4:	0f be c0             	movsbl %al,%eax
    30b7:	83 ec 0c             	sub    $0xc,%esp
    30ba:	ff 75 14             	pushl  0x14(%ebp)
    30bd:	ff 75 10             	pushl  0x10(%ebp)
    30c0:	ff 75 0c             	pushl  0xc(%ebp)
    30c3:	ff 75 08             	pushl  0x8(%ebp)
    30c6:	50                   	push   %eax
    30c7:	e8 65 fc ff ff       	call   2d31 <color_putc>
    30cc:	83 c4 20             	add    $0x20,%esp
        ap++;
    30cf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    30d3:	e9 92 00 00 00       	jmp    316a <color_printf+0x1f9>
      } else if(c == '%'){
    30d8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    30dc:	75 20                	jne    30fe <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    30de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    30e1:	0f be c0             	movsbl %al,%eax
    30e4:	83 ec 0c             	sub    $0xc,%esp
    30e7:	ff 75 14             	pushl  0x14(%ebp)
    30ea:	ff 75 10             	pushl  0x10(%ebp)
    30ed:	ff 75 0c             	pushl  0xc(%ebp)
    30f0:	ff 75 08             	pushl  0x8(%ebp)
    30f3:	50                   	push   %eax
    30f4:	e8 38 fc ff ff       	call   2d31 <color_putc>
    30f9:	83 c4 20             	add    $0x20,%esp
    30fc:	eb 6c                	jmp    316a <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    30fe:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    3102:	75 2f                	jne    3133 <color_printf+0x1c2>
        double *dap = (double*)ap;
    3104:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3107:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    310a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    310d:	dd 00                	fldl   (%eax)
    310f:	83 ec 08             	sub    $0x8,%esp
    3112:	ff 75 14             	pushl  0x14(%ebp)
    3115:	ff 75 10             	pushl  0x10(%ebp)
    3118:	ff 75 0c             	pushl  0xc(%ebp)
    311b:	ff 75 08             	pushl  0x8(%ebp)
    311e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3122:	dd 1c 24             	fstpl  (%esp)
    3125:	e8 2b fd ff ff       	call   2e55 <color_printdbl>
    312a:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    312d:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    3131:	eb 37                	jmp    316a <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    3133:	83 ec 0c             	sub    $0xc,%esp
    3136:	ff 75 14             	pushl  0x14(%ebp)
    3139:	ff 75 10             	pushl  0x10(%ebp)
    313c:	ff 75 0c             	pushl  0xc(%ebp)
    313f:	ff 75 08             	pushl  0x8(%ebp)
    3142:	6a 25                	push   $0x25
    3144:	e8 e8 fb ff ff       	call   2d31 <color_putc>
    3149:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    314c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    314f:	0f be c0             	movsbl %al,%eax
    3152:	83 ec 0c             	sub    $0xc,%esp
    3155:	ff 75 14             	pushl  0x14(%ebp)
    3158:	ff 75 10             	pushl  0x10(%ebp)
    315b:	ff 75 0c             	pushl  0xc(%ebp)
    315e:	ff 75 08             	pushl  0x8(%ebp)
    3161:	50                   	push   %eax
    3162:	e8 ca fb ff ff       	call   2d31 <color_putc>
    3167:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    316a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3171:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3175:	8b 55 18             	mov    0x18(%ebp),%edx
    3178:	8b 45 f0             	mov    -0x10(%ebp),%eax
    317b:	01 d0                	add    %edx,%eax
    317d:	0f b6 00             	movzbl (%eax),%eax
    3180:	84 c0                	test   %al,%al
    3182:	0f 85 0b fe ff ff    	jne    2f93 <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    3188:	90                   	nop
    3189:	c9                   	leave  
    318a:	c3                   	ret    

0000318b <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    318b:	55                   	push   %ebp
    318c:	89 e5                	mov    %esp,%ebp
    318e:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    3191:	83 ec 0c             	sub    $0xc,%esp
    3194:	6a 58                	push   $0x58
    3196:	e8 b0 d9 ff ff       	call   b4b <malloc>
    319b:	83 c4 10             	add    $0x10,%esp
    319e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    31a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31a4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    31aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31ad:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    31b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    31b7:	c9                   	leave  
    31b8:	c3                   	ret    

000031b9 <pushi>:

void pushi(struct istack *s, int val)
{
    31b9:	55                   	push   %ebp
    31ba:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    31bc:	8b 45 08             	mov    0x8(%ebp),%eax
    31bf:	8b 00                	mov    (%eax),%eax
    31c1:	83 f8 13             	cmp    $0x13,%eax
    31c4:	7f 2c                	jg     31f2 <pushi+0x39>
    {
        s->size++;
    31c6:	8b 45 08             	mov    0x8(%ebp),%eax
    31c9:	8b 00                	mov    (%eax),%eax
    31cb:	8d 50 01             	lea    0x1(%eax),%edx
    31ce:	8b 45 08             	mov    0x8(%ebp),%eax
    31d1:	89 10                	mov    %edx,(%eax)
        s->top++;
    31d3:	8b 45 08             	mov    0x8(%ebp),%eax
    31d6:	8b 40 54             	mov    0x54(%eax),%eax
    31d9:	8d 50 01             	lea    0x1(%eax),%edx
    31dc:	8b 45 08             	mov    0x8(%ebp),%eax
    31df:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    31e2:	8b 45 08             	mov    0x8(%ebp),%eax
    31e5:	8b 50 54             	mov    0x54(%eax),%edx
    31e8:	8b 45 08             	mov    0x8(%ebp),%eax
    31eb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    31ee:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    31f2:	90                   	nop
    31f3:	5d                   	pop    %ebp
    31f4:	c3                   	ret    

000031f5 <popi>:

int popi(struct istack *s)
{
    31f5:	55                   	push   %ebp
    31f6:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    31f8:	8b 45 08             	mov    0x8(%ebp),%eax
    31fb:	8b 00                	mov    (%eax),%eax
    31fd:	85 c0                	test   %eax,%eax
    31ff:	75 07                	jne    3208 <popi+0x13>
    {
        return -1;
    3201:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3206:	eb 2c                	jmp    3234 <popi+0x3f>
    }
    s->size--;
    3208:	8b 45 08             	mov    0x8(%ebp),%eax
    320b:	8b 00                	mov    (%eax),%eax
    320d:	8d 50 ff             	lea    -0x1(%eax),%edx
    3210:	8b 45 08             	mov    0x8(%ebp),%eax
    3213:	89 10                	mov    %edx,(%eax)
    s->top--;
    3215:	8b 45 08             	mov    0x8(%ebp),%eax
    3218:	8b 40 54             	mov    0x54(%eax),%eax
    321b:	8d 50 ff             	lea    -0x1(%eax),%edx
    321e:	8b 45 08             	mov    0x8(%ebp),%eax
    3221:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    3224:	8b 45 08             	mov    0x8(%ebp),%eax
    3227:	8b 40 54             	mov    0x54(%eax),%eax
    322a:	8d 50 01             	lea    0x1(%eax),%edx
    322d:	8b 45 08             	mov    0x8(%ebp),%eax
    3230:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3234:	5d                   	pop    %ebp
    3235:	c3                   	ret    

00003236 <topi>:

int topi(struct istack* s)
{
    3236:	55                   	push   %ebp
    3237:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3239:	8b 45 08             	mov    0x8(%ebp),%eax
    323c:	8b 50 54             	mov    0x54(%eax),%edx
    323f:	8b 45 08             	mov    0x8(%ebp),%eax
    3242:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3246:	5d                   	pop    %ebp
    3247:	c3                   	ret    

00003248 <cstack>:

//constructor
struct cstack* cstack()
{
    3248:	55                   	push   %ebp
    3249:	89 e5                	mov    %esp,%ebp
    324b:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    324e:	83 ec 0c             	sub    $0xc,%esp
    3251:	6a 1c                	push   $0x1c
    3253:	e8 f3 d8 ff ff       	call   b4b <malloc>
    3258:	83 c4 10             	add    $0x10,%esp
    325b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    325e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3261:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3267:	8b 45 f4             	mov    -0xc(%ebp),%eax
    326a:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    3271:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3274:	c9                   	leave  
    3275:	c3                   	ret    

00003276 <pushc>:

void pushc(struct cstack *s, char val)
{
    3276:	55                   	push   %ebp
    3277:	89 e5                	mov    %esp,%ebp
    3279:	83 ec 04             	sub    $0x4,%esp
    327c:	8b 45 0c             	mov    0xc(%ebp),%eax
    327f:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3282:	8b 45 08             	mov    0x8(%ebp),%eax
    3285:	8b 00                	mov    (%eax),%eax
    3287:	83 f8 13             	cmp    $0x13,%eax
    328a:	7f 2d                	jg     32b9 <pushc+0x43>
    {
        s->size++;
    328c:	8b 45 08             	mov    0x8(%ebp),%eax
    328f:	8b 00                	mov    (%eax),%eax
    3291:	8d 50 01             	lea    0x1(%eax),%edx
    3294:	8b 45 08             	mov    0x8(%ebp),%eax
    3297:	89 10                	mov    %edx,(%eax)
        s->top++;
    3299:	8b 45 08             	mov    0x8(%ebp),%eax
    329c:	8b 40 18             	mov    0x18(%eax),%eax
    329f:	8d 50 01             	lea    0x1(%eax),%edx
    32a2:	8b 45 08             	mov    0x8(%ebp),%eax
    32a5:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    32a8:	8b 45 08             	mov    0x8(%ebp),%eax
    32ab:	8b 40 18             	mov    0x18(%eax),%eax
    32ae:	8b 55 08             	mov    0x8(%ebp),%edx
    32b1:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    32b5:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    32b9:	90                   	nop
    32ba:	c9                   	leave  
    32bb:	c3                   	ret    

000032bc <popc>:

char popc(struct cstack *s)
{
    32bc:	55                   	push   %ebp
    32bd:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    32bf:	8b 45 08             	mov    0x8(%ebp),%eax
    32c2:	8b 00                	mov    (%eax),%eax
    32c4:	85 c0                	test   %eax,%eax
    32c6:	75 07                	jne    32cf <popc+0x13>
    {
        return -1;
    32c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    32cd:	eb 2d                	jmp    32fc <popc+0x40>
    }
    s->size--;
    32cf:	8b 45 08             	mov    0x8(%ebp),%eax
    32d2:	8b 00                	mov    (%eax),%eax
    32d4:	8d 50 ff             	lea    -0x1(%eax),%edx
    32d7:	8b 45 08             	mov    0x8(%ebp),%eax
    32da:	89 10                	mov    %edx,(%eax)
    s->top--;
    32dc:	8b 45 08             	mov    0x8(%ebp),%eax
    32df:	8b 40 18             	mov    0x18(%eax),%eax
    32e2:	8d 50 ff             	lea    -0x1(%eax),%edx
    32e5:	8b 45 08             	mov    0x8(%ebp),%eax
    32e8:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    32eb:	8b 45 08             	mov    0x8(%ebp),%eax
    32ee:	8b 40 18             	mov    0x18(%eax),%eax
    32f1:	8d 50 01             	lea    0x1(%eax),%edx
    32f4:	8b 45 08             	mov    0x8(%ebp),%eax
    32f7:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    32fc:	5d                   	pop    %ebp
    32fd:	c3                   	ret    

000032fe <topc>:

char topc(struct cstack* s)
{
    32fe:	55                   	push   %ebp
    32ff:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3301:	8b 45 08             	mov    0x8(%ebp),%eax
    3304:	8b 40 18             	mov    0x18(%eax),%eax
    3307:	8b 55 08             	mov    0x8(%ebp),%edx
    330a:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    330f:	5d                   	pop    %ebp
    3310:	c3                   	ret    

00003311 <dstack>:

//constructor
struct dstack* dstack()
{
    3311:	55                   	push   %ebp
    3312:	89 e5                	mov    %esp,%ebp
    3314:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    3317:	83 ec 0c             	sub    $0xc,%esp
    331a:	68 a8 00 00 00       	push   $0xa8
    331f:	e8 27 d8 ff ff       	call   b4b <malloc>
    3324:	83 c4 10             	add    $0x10,%esp
    3327:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    332a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    332d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3333:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3336:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    333d:	ff ff ff 
    return stack;
    3340:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3343:	c9                   	leave  
    3344:	c3                   	ret    

00003345 <pushd>:

void pushd(struct dstack *s, double val)
{
    3345:	55                   	push   %ebp
    3346:	89 e5                	mov    %esp,%ebp
    3348:	83 ec 08             	sub    $0x8,%esp
    334b:	8b 45 0c             	mov    0xc(%ebp),%eax
    334e:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3351:	8b 45 10             	mov    0x10(%ebp),%eax
    3354:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    3357:	8b 45 08             	mov    0x8(%ebp),%eax
    335a:	8b 00                	mov    (%eax),%eax
    335c:	83 f8 13             	cmp    $0x13,%eax
    335f:	7f 35                	jg     3396 <pushd+0x51>
    {
        s->size++;
    3361:	8b 45 08             	mov    0x8(%ebp),%eax
    3364:	8b 00                	mov    (%eax),%eax
    3366:	8d 50 01             	lea    0x1(%eax),%edx
    3369:	8b 45 08             	mov    0x8(%ebp),%eax
    336c:	89 10                	mov    %edx,(%eax)
        s->top++;
    336e:	8b 45 08             	mov    0x8(%ebp),%eax
    3371:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3377:	8d 50 01             	lea    0x1(%eax),%edx
    337a:	8b 45 08             	mov    0x8(%ebp),%eax
    337d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    3383:	8b 45 08             	mov    0x8(%ebp),%eax
    3386:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    338c:	8b 45 08             	mov    0x8(%ebp),%eax
    338f:	dd 45 f8             	fldl   -0x8(%ebp)
    3392:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    3396:	90                   	nop
    3397:	c9                   	leave  
    3398:	c3                   	ret    

00003399 <popd>:

double popd(struct dstack *s)
{
    3399:	55                   	push   %ebp
    339a:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    339c:	8b 45 08             	mov    0x8(%ebp),%eax
    339f:	8b 00                	mov    (%eax),%eax
    33a1:	85 c0                	test   %eax,%eax
    33a3:	75 06                	jne    33ab <popd+0x12>
    {
        return -1;
    33a5:	d9 e8                	fld1   
    33a7:	d9 e0                	fchs   
    33a9:	eb 35                	jmp    33e0 <popd+0x47>
    }
    s->size--;
    33ab:	8b 45 08             	mov    0x8(%ebp),%eax
    33ae:	8b 00                	mov    (%eax),%eax
    33b0:	8d 50 ff             	lea    -0x1(%eax),%edx
    33b3:	8b 45 08             	mov    0x8(%ebp),%eax
    33b6:	89 10                	mov    %edx,(%eax)
    s->top--;
    33b8:	8b 45 08             	mov    0x8(%ebp),%eax
    33bb:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    33c1:	8d 50 ff             	lea    -0x1(%eax),%edx
    33c4:	8b 45 08             	mov    0x8(%ebp),%eax
    33c7:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    33cd:	8b 45 08             	mov    0x8(%ebp),%eax
    33d0:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    33d6:	8d 50 01             	lea    0x1(%eax),%edx
    33d9:	8b 45 08             	mov    0x8(%ebp),%eax
    33dc:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    33e0:	5d                   	pop    %ebp
    33e1:	c3                   	ret    

000033e2 <topd>:

double topd(struct dstack* s)
{
    33e2:	55                   	push   %ebp
    33e3:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    33e5:	8b 45 08             	mov    0x8(%ebp),%eax
    33e8:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    33ee:	8b 45 08             	mov    0x8(%ebp),%eax
    33f1:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    33f5:	5d                   	pop    %ebp
    33f6:	c3                   	ret    

000033f7 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    33f7:	55                   	push   %ebp
    33f8:	89 e5                	mov    %esp,%ebp
    33fa:	53                   	push   %ebx
    33fb:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    3401:	83 ec 08             	sub    $0x8,%esp
    3404:	6a 00                	push   $0x0
    3406:	68 40 3c 00 00       	push   $0x3c40
    340b:	e8 cd d1 ff ff       	call   5dd <open>
    3410:	83 c4 10             	add    $0x10,%esp
    3413:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3416:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    341a:	79 1d                	jns    3439 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    341c:	83 ec 0c             	sub    $0xc,%esp
    341f:	68 4a 3c 00 00       	push   $0x3c4a
    3424:	6a 00                	push   $0x0
    3426:	6a 00                	push   $0x0
    3428:	6a 01                	push   $0x1
    342a:	6a 03                	push   $0x3
    342c:	e8 40 fb ff ff       	call   2f71 <color_printf>
    3431:	83 c4 20             	add    $0x20,%esp
    3434:	e9 6d 02 00 00       	jmp    36a6 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    3439:	8b 45 0c             	mov    0xc(%ebp),%eax
    343c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    3442:	e9 2a 02 00 00       	jmp    3671 <readVariables+0x27a>
  {
    int pos = 0;
    3447:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    344e:	00 00 00 
    while(pos <= n-1)
    3451:	e9 07 02 00 00       	jmp    365d <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    3456:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    345d:	eb 24                	jmp    3483 <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    345f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3462:	8d 50 ff             	lea    -0x1(%eax),%edx
    3465:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    346b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    346e:	01 c8                	add    %ecx,%eax
    3470:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3477:	ff 
    3478:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    347f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    3483:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3489:	8b 45 f4             	mov    -0xc(%ebp),%eax
    348c:	01 d0                	add    %edx,%eax
    348e:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3495:	ff 
    3496:	3c 3d                	cmp    $0x3d,%al
    3498:	75 c5                	jne    345f <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    349a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    349d:	83 e8 01             	sub    $0x1,%eax
    34a0:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    34a7:	00 
      if(buf[pos] == 'd') //double value
    34a8:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    34ae:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    34b5:	ff 
    34b6:	3c 64                	cmp    $0x64,%al
    34b8:	0f 85 a0 00 00 00    	jne    355e <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    34be:	8b 45 0c             	mov    0xc(%ebp),%eax
    34c1:	8b 00                	mov    (%eax),%eax
    34c3:	c1 e0 05             	shl    $0x5,%eax
    34c6:	89 c2                	mov    %eax,%edx
    34c8:	8b 45 08             	mov    0x8(%ebp),%eax
    34cb:	01 d0                	add    %edx,%eax
    34cd:	8d 50 04             	lea    0x4(%eax),%edx
    34d0:	83 ec 08             	sub    $0x8,%esp
    34d3:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    34d9:	50                   	push   %eax
    34da:	52                   	push   %edx
    34db:	e8 8c ce ff ff       	call   36c <strcpy>
    34e0:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    34e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34e6:	8d 50 01             	lea    0x1(%eax),%edx
    34e9:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    34ef:	01 d0                	add    %edx,%eax
    34f1:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    34f7:	83 ec 08             	sub    $0x8,%esp
    34fa:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    3500:	50                   	push   %eax
    3501:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3507:	50                   	push   %eax
    3508:	e8 7b d9 ff ff       	call   e88 <Translation>
    350d:	83 c4 10             	add    $0x10,%esp
    3510:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    3513:	8b 45 0c             	mov    0xc(%ebp),%eax
    3516:	8b 00                	mov    (%eax),%eax
    3518:	c1 e0 05             	shl    $0x5,%eax
    351b:	89 c2                	mov    %eax,%edx
    351d:	8b 45 08             	mov    0x8(%ebp),%eax
    3520:	01 d0                	add    %edx,%eax
    3522:	dd 45 d8             	fldl   -0x28(%ebp)
    3525:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    3528:	8b 45 0c             	mov    0xc(%ebp),%eax
    352b:	8b 00                	mov    (%eax),%eax
    352d:	c1 e0 05             	shl    $0x5,%eax
    3530:	89 c2                	mov    %eax,%edx
    3532:	8b 45 08             	mov    0x8(%ebp),%eax
    3535:	01 d0                	add    %edx,%eax
    3537:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    353d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3540:	8b 00                	mov    (%eax),%eax
    3542:	8d 50 01             	lea    0x1(%eax),%edx
    3545:	8b 45 0c             	mov    0xc(%ebp),%eax
    3548:	89 10                	mov    %edx,(%eax)
        pos++;
    354a:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3550:	83 c0 01             	add    $0x1,%eax
    3553:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    3559:	e9 ff 00 00 00       	jmp    365d <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    355e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3561:	8b 00                	mov    (%eax),%eax
    3563:	c1 e0 05             	shl    $0x5,%eax
    3566:	89 c2                	mov    %eax,%edx
    3568:	8b 45 08             	mov    0x8(%ebp),%eax
    356b:	01 d0                	add    %edx,%eax
    356d:	8d 50 04             	lea    0x4(%eax),%edx
    3570:	83 ec 08             	sub    $0x8,%esp
    3573:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3579:	50                   	push   %eax
    357a:	52                   	push   %edx
    357b:	e8 ec cd ff ff       	call   36c <strcpy>
    3580:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    3583:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3586:	8d 50 01             	lea    0x1(%eax),%edx
    3589:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    358f:	01 d0                	add    %edx,%eax
    3591:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    3597:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    359d:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    35a0:	eb 04                	jmp    35a6 <readVariables+0x1af>
        {
          strend++;
    35a2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    35a6:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    35ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35af:	01 d0                	add    %edx,%eax
    35b1:	0f b6 00             	movzbl (%eax),%eax
    35b4:	84 c0                	test   %al,%al
    35b6:	75 ea                	jne    35a2 <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    35b8:	8b 45 0c             	mov    0xc(%ebp),%eax
    35bb:	8b 00                	mov    (%eax),%eax
    35bd:	c1 e0 05             	shl    $0x5,%eax
    35c0:	89 c2                	mov    %eax,%edx
    35c2:	8b 45 08             	mov    0x8(%ebp),%eax
    35c5:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    35c8:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    35ce:	8b 55 f0             	mov    -0x10(%ebp),%edx
    35d1:	29 c2                	sub    %eax,%edx
    35d3:	89 d0                	mov    %edx,%eax
    35d5:	83 c0 01             	add    $0x1,%eax
    35d8:	83 ec 0c             	sub    $0xc,%esp
    35db:	50                   	push   %eax
    35dc:	e8 6a d5 ff ff       	call   b4b <malloc>
    35e1:	83 c4 10             	add    $0x10,%esp
    35e4:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    35e7:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    35ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
    35f0:	eb 35                	jmp    3627 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    35f2:	8b 45 0c             	mov    0xc(%ebp),%eax
    35f5:	8b 00                	mov    (%eax),%eax
    35f7:	c1 e0 05             	shl    $0x5,%eax
    35fa:	89 c2                	mov    %eax,%edx
    35fc:	8b 45 08             	mov    0x8(%ebp),%eax
    35ff:	01 d0                	add    %edx,%eax
    3601:	8b 40 18             	mov    0x18(%eax),%eax
    3604:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    360a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    360d:	29 d1                	sub    %edx,%ecx
    360f:	89 ca                	mov    %ecx,%edx
    3611:	01 c2                	add    %eax,%edx
    3613:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    3619:	8b 45 ec             	mov    -0x14(%ebp),%eax
    361c:	01 c8                	add    %ecx,%eax
    361e:	0f b6 00             	movzbl (%eax),%eax
    3621:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    3623:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    3627:	8b 45 ec             	mov    -0x14(%ebp),%eax
    362a:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    362d:	7e c3                	jle    35f2 <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    362f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3632:	8b 00                	mov    (%eax),%eax
    3634:	c1 e0 05             	shl    $0x5,%eax
    3637:	89 c2                	mov    %eax,%edx
    3639:	8b 45 08             	mov    0x8(%ebp),%eax
    363c:	01 d0                	add    %edx,%eax
    363e:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    3644:	8b 45 0c             	mov    0xc(%ebp),%eax
    3647:	8b 00                	mov    (%eax),%eax
    3649:	8d 50 01             	lea    0x1(%eax),%edx
    364c:	8b 45 0c             	mov    0xc(%ebp),%eax
    364f:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    3651:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3654:	83 c0 01             	add    $0x1,%eax
    3657:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    365d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3660:	8d 50 ff             	lea    -0x1(%eax),%edx
    3663:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3669:	39 c2                	cmp    %eax,%edx
    366b:	0f 8d e5 fd ff ff    	jge    3456 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    3671:	83 ec 04             	sub    $0x4,%esp
    3674:	68 e8 03 00 00       	push   $0x3e8
    3679:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    367f:	50                   	push   %eax
    3680:	ff 75 e8             	pushl  -0x18(%ebp)
    3683:	e8 2d cf ff ff       	call   5b5 <read>
    3688:	83 c4 10             	add    $0x10,%esp
    368b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    368e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3692:	0f 8f af fd ff ff    	jg     3447 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    3698:	83 ec 0c             	sub    $0xc,%esp
    369b:	ff 75 e8             	pushl  -0x18(%ebp)
    369e:	e8 22 cf ff ff       	call   5c5 <close>
    36a3:	83 c4 10             	add    $0x10,%esp
}
    36a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    36a9:	c9                   	leave  
    36aa:	c3                   	ret    

000036ab <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    36ab:	55                   	push   %ebp
    36ac:	89 e5                	mov    %esp,%ebp
    36ae:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    36b4:	83 ec 08             	sub    $0x8,%esp
    36b7:	6a 02                	push   $0x2
    36b9:	68 40 3c 00 00       	push   $0x3c40
    36be:	e8 1a cf ff ff       	call   5dd <open>
    36c3:	83 c4 10             	add    $0x10,%esp
    36c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    36c9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    36cd:	78 1e                	js     36ed <writeVariables+0x42>
  {
    close(fd);
    36cf:	83 ec 0c             	sub    $0xc,%esp
    36d2:	ff 75 e4             	pushl  -0x1c(%ebp)
    36d5:	e8 eb ce ff ff       	call   5c5 <close>
    36da:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    36dd:	83 ec 0c             	sub    $0xc,%esp
    36e0:	68 40 3c 00 00       	push   $0x3c40
    36e5:	e8 03 cf ff ff       	call   5ed <unlink>
    36ea:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    36ed:	83 ec 08             	sub    $0x8,%esp
    36f0:	68 02 02 00 00       	push   $0x202
    36f5:	68 40 3c 00 00       	push   $0x3c40
    36fa:	e8 de ce ff ff       	call   5dd <open>
    36ff:	83 c4 10             	add    $0x10,%esp
    3702:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    3705:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    370c:	e9 ff 01 00 00       	jmp    3910 <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    3711:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3714:	c1 e0 05             	shl    $0x5,%eax
    3717:	89 c2                	mov    %eax,%edx
    3719:	8b 45 08             	mov    0x8(%ebp),%eax
    371c:	01 d0                	add    %edx,%eax
    371e:	8b 00                	mov    (%eax),%eax
    3720:	83 f8 01             	cmp    $0x1,%eax
    3723:	0f 85 d3 00 00 00    	jne    37fc <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    3729:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    3730:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3733:	8d 50 01             	lea    0x1(%eax),%edx
    3736:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3739:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    3740:	64 
      int k=0;
    3741:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    3748:	eb 2c                	jmp    3776 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    374a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    374d:	8d 50 01             	lea    0x1(%eax),%edx
    3750:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3753:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3756:	89 d1                	mov    %edx,%ecx
    3758:	c1 e1 05             	shl    $0x5,%ecx
    375b:	8b 55 08             	mov    0x8(%ebp),%edx
    375e:	01 d1                	add    %edx,%ecx
    3760:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3763:	01 ca                	add    %ecx,%edx
    3765:	83 c2 04             	add    $0x4,%edx
    3768:	0f b6 12             	movzbl (%edx),%edx
    376b:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3772:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    3776:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3779:	c1 e0 05             	shl    $0x5,%eax
    377c:	89 c2                	mov    %eax,%edx
    377e:	8b 45 08             	mov    0x8(%ebp),%eax
    3781:	01 c2                	add    %eax,%edx
    3783:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3786:	01 d0                	add    %edx,%eax
    3788:	83 c0 04             	add    $0x4,%eax
    378b:	0f b6 00             	movzbl (%eax),%eax
    378e:	84 c0                	test   %al,%al
    3790:	75 b8                	jne    374a <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3792:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3795:	8d 50 01             	lea    0x1(%eax),%edx
    3798:	89 55 e0             	mov    %edx,-0x20(%ebp)
    379b:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    37a2:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    37a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37a6:	c1 e0 05             	shl    $0x5,%eax
    37a9:	89 c2                	mov    %eax,%edx
    37ab:	8b 45 08             	mov    0x8(%ebp),%eax
    37ae:	01 d0                	add    %edx,%eax
    37b0:	dd 40 18             	fldl   0x18(%eax)
    37b3:	8d 45 e0             	lea    -0x20(%ebp),%eax
    37b6:	50                   	push   %eax
    37b7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    37bb:	dd 1c 24             	fstpl  (%esp)
    37be:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    37c4:	50                   	push   %eax
    37c5:	e8 7d d5 ff ff       	call   d47 <double2str>
    37ca:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    37cd:	8b 45 e0             	mov    -0x20(%ebp),%eax
    37d0:	8d 50 01             	lea    0x1(%eax),%edx
    37d3:	89 55 e0             	mov    %edx,-0x20(%ebp)
    37d6:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    37dd:	00 
      write(fd,buf,pos);
    37de:	8b 45 e0             	mov    -0x20(%ebp),%eax
    37e1:	83 ec 04             	sub    $0x4,%esp
    37e4:	50                   	push   %eax
    37e5:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    37eb:	50                   	push   %eax
    37ec:	ff 75 e4             	pushl  -0x1c(%ebp)
    37ef:	e8 c9 cd ff ff       	call   5bd <write>
    37f4:	83 c4 10             	add    $0x10,%esp
    37f7:	e9 10 01 00 00       	jmp    390c <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    37fc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    3803:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3806:	8d 50 01             	lea    0x1(%eax),%edx
    3809:	89 55 ec             	mov    %edx,-0x14(%ebp)
    380c:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    3813:	73 
      int k=0;
    3814:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    381b:	eb 2c                	jmp    3849 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    381d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3820:	8d 50 01             	lea    0x1(%eax),%edx
    3823:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3826:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3829:	89 d1                	mov    %edx,%ecx
    382b:	c1 e1 05             	shl    $0x5,%ecx
    382e:	8b 55 08             	mov    0x8(%ebp),%edx
    3831:	01 d1                	add    %edx,%ecx
    3833:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3836:	01 ca                	add    %ecx,%edx
    3838:	83 c2 04             	add    $0x4,%edx
    383b:	0f b6 12             	movzbl (%edx),%edx
    383e:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3845:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    3849:	8b 45 f4             	mov    -0xc(%ebp),%eax
    384c:	c1 e0 05             	shl    $0x5,%eax
    384f:	89 c2                	mov    %eax,%edx
    3851:	8b 45 08             	mov    0x8(%ebp),%eax
    3854:	01 c2                	add    %eax,%edx
    3856:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3859:	01 d0                	add    %edx,%eax
    385b:	83 c0 04             	add    $0x4,%eax
    385e:	0f b6 00             	movzbl (%eax),%eax
    3861:	84 c0                	test   %al,%al
    3863:	75 b8                	jne    381d <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    3865:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3868:	8d 50 01             	lea    0x1(%eax),%edx
    386b:	89 55 ec             	mov    %edx,-0x14(%ebp)
    386e:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    3875:	3d 
      k=0;
    3876:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    387d:	eb 2c                	jmp    38ab <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    387f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3882:	8d 50 01             	lea    0x1(%eax),%edx
    3885:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3888:	8b 55 f4             	mov    -0xc(%ebp),%edx
    388b:	89 d1                	mov    %edx,%ecx
    388d:	c1 e1 05             	shl    $0x5,%ecx
    3890:	8b 55 08             	mov    0x8(%ebp),%edx
    3893:	01 ca                	add    %ecx,%edx
    3895:	8b 4a 18             	mov    0x18(%edx),%ecx
    3898:	8b 55 e8             	mov    -0x18(%ebp),%edx
    389b:	01 ca                	add    %ecx,%edx
    389d:	0f b6 12             	movzbl (%edx),%edx
    38a0:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    38a7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    38ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38ae:	c1 e0 05             	shl    $0x5,%eax
    38b1:	89 c2                	mov    %eax,%edx
    38b3:	8b 45 08             	mov    0x8(%ebp),%eax
    38b6:	01 d0                	add    %edx,%eax
    38b8:	8b 50 18             	mov    0x18(%eax),%edx
    38bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    38be:	01 d0                	add    %edx,%eax
    38c0:	0f b6 00             	movzbl (%eax),%eax
    38c3:	84 c0                	test   %al,%al
    38c5:	75 b8                	jne    387f <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    38c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    38ca:	8d 50 01             	lea    0x1(%eax),%edx
    38cd:	89 55 ec             	mov    %edx,-0x14(%ebp)
    38d0:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    38d7:	00 
      write(fd,buf,pos);
    38d8:	83 ec 04             	sub    $0x4,%esp
    38db:	ff 75 ec             	pushl  -0x14(%ebp)
    38de:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    38e4:	50                   	push   %eax
    38e5:	ff 75 e4             	pushl  -0x1c(%ebp)
    38e8:	e8 d0 cc ff ff       	call   5bd <write>
    38ed:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    38f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38f3:	c1 e0 05             	shl    $0x5,%eax
    38f6:	89 c2                	mov    %eax,%edx
    38f8:	8b 45 08             	mov    0x8(%ebp),%eax
    38fb:	01 d0                	add    %edx,%eax
    38fd:	8b 40 18             	mov    0x18(%eax),%eax
    3900:	83 ec 0c             	sub    $0xc,%esp
    3903:	50                   	push   %eax
    3904:	e8 00 d1 ff ff       	call   a09 <free>
    3909:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    390c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3910:	8b 45 0c             	mov    0xc(%ebp),%eax
    3913:	8b 00                	mov    (%eax),%eax
    3915:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3918:	0f 8f f3 fd ff ff    	jg     3711 <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    391e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3921:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    3927:	83 ec 0c             	sub    $0xc,%esp
    392a:	ff 75 e4             	pushl  -0x1c(%ebp)
    392d:	e8 93 cc ff ff       	call   5c5 <close>
    3932:	83 c4 10             	add    $0x10,%esp
  return;
    3935:	90                   	nop
    3936:	c9                   	leave  
    3937:	c3                   	ret    
