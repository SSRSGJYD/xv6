
_alias：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "xv_color.h"
#include "xv_cmdtable.h"

//stereotype: alias *** = ***,new name no longer than 20 words, no same name
int main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	53                   	push   %ebx
       e:	51                   	push   %ecx
       f:	83 c4 80             	add    $0xffffff80,%esp
      12:	89 c8                	mov    %ecx,%eax
    if(argc != 4)
      14:	83 38 04             	cmpl   $0x4,(%eax)
      17:	74 2f                	je     48 <main+0x48>
    {
        color_printf(XV_RED,1,XV_BLACK,0,"Incorrect format!");
      19:	83 ec 0c             	sub    $0xc,%esp
      1c:	68 a0 39 00 00       	push   $0x39a0
      21:	6a 00                	push   $0x0
      23:	6a 00                	push   $0x0
      25:	6a 01                	push   $0x1
      27:	6a 04                	push   $0x4
      29:	e8 a5 2f 00 00       	call   2fd3 <color_printf>
      2e:	83 c4 20             	add    $0x20,%esp
		printf(1,"\n");
      31:	83 ec 08             	sub    $0x8,%esp
      34:	68 b2 39 00 00       	push   $0x39b2
      39:	6a 01                	push   $0x1
      3b:	e8 6b 08 00 00       	call   8ab <printf>
      40:	83 c4 10             	add    $0x10,%esp
      43:	e9 5b 03 00 00       	jmp    3a3 <main+0x3a3>
    }
    else
    {
      char *cmdname = argv[1];
      48:	8b 50 04             	mov    0x4(%eax),%edx
      4b:	8b 52 04             	mov    0x4(%edx),%edx
      4e:	89 55 cc             	mov    %edx,-0x34(%ebp)
      char *ch = argv[2]; //need to be '='
      51:	8b 50 04             	mov    0x4(%eax),%edx
      54:	8b 52 08             	mov    0x8(%edx),%edx
      57:	89 55 c8             	mov    %edx,-0x38(%ebp)
      char *aliasname = argv[3];
      5a:	8b 40 04             	mov    0x4(%eax),%eax
      5d:	8b 40 0c             	mov    0xc(%eax),%eax
      60:	89 45 c4             	mov    %eax,-0x3c(%ebp)
      if(ch[0] != '=' || ch[1] != '\0')
      63:	8b 45 c8             	mov    -0x38(%ebp),%eax
      66:	0f b6 00             	movzbl (%eax),%eax
      69:	3c 3d                	cmp    $0x3d,%al
      6b:	75 0d                	jne    7a <main+0x7a>
      6d:	8b 45 c8             	mov    -0x38(%ebp),%eax
      70:	83 c0 01             	add    $0x1,%eax
      73:	0f b6 00             	movzbl (%eax),%eax
      76:	84 c0                	test   %al,%al
      78:	74 2f                	je     a9 <main+0xa9>
	    {
			color_printf(XV_RED,1,XV_BLACK,0,"Incorrect format!");
      7a:	83 ec 0c             	sub    $0xc,%esp
      7d:	68 a0 39 00 00       	push   $0x39a0
      82:	6a 00                	push   $0x0
      84:	6a 00                	push   $0x0
      86:	6a 01                	push   $0x1
      88:	6a 04                	push   $0x4
      8a:	e8 44 2f 00 00       	call   2fd3 <color_printf>
      8f:	83 c4 20             	add    $0x20,%esp
			printf(1,"\n");	    
      92:	83 ec 08             	sub    $0x8,%esp
      95:	68 b2 39 00 00       	push   $0x39b2
      9a:	6a 01                	push   $0x1
      9c:	e8 0a 08 00 00       	call   8ab <printf>
      a1:	83 c4 10             	add    $0x10,%esp
      a4:	e9 fa 02 00 00       	jmp    3a3 <main+0x3a3>
		}
	    else
	    {
			int findflag = 0;
      a9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
			for(int i=0; i<XV_CMD_NUM; i++)
      b0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      b7:	eb 62                	jmp    11b <main+0x11b>
			{
				if(strlen(cmdtable[i]) == strlen(cmdname) && 
      b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
      bc:	89 d0                	mov    %edx,%eax
      be:	c1 e0 02             	shl    $0x2,%eax
      c1:	01 d0                	add    %edx,%eax
      c3:	01 c0                	add    %eax,%eax
      c5:	05 60 46 00 00       	add    $0x4660,%eax
      ca:	83 ec 0c             	sub    $0xc,%esp
      cd:	50                   	push   %eax
      ce:	e8 6a 03 00 00       	call   43d <strlen>
      d3:	83 c4 10             	add    $0x10,%esp
      d6:	89 c3                	mov    %eax,%ebx
      d8:	83 ec 0c             	sub    $0xc,%esp
      db:	ff 75 cc             	pushl  -0x34(%ebp)
      de:	e8 5a 03 00 00       	call   43d <strlen>
      e3:	83 c4 10             	add    $0x10,%esp
      e6:	39 c3                	cmp    %eax,%ebx
      e8:	75 2d                	jne    117 <main+0x117>
					strcmp(cmdtable[i],cmdname) == 0)
      ea:	8b 55 f0             	mov    -0x10(%ebp),%edx
      ed:	89 d0                	mov    %edx,%eax
      ef:	c1 e0 02             	shl    $0x2,%eax
      f2:	01 d0                	add    %edx,%eax
      f4:	01 c0                	add    %eax,%eax
      f6:	05 60 46 00 00       	add    $0x4660,%eax
      fb:	83 ec 08             	sub    $0x8,%esp
      fe:	ff 75 cc             	pushl  -0x34(%ebp)
     101:	50                   	push   %eax
     102:	e8 f7 02 00 00       	call   3fe <strcmp>
     107:	83 c4 10             	add    $0x10,%esp
	    else
	    {
			int findflag = 0;
			for(int i=0; i<XV_CMD_NUM; i++)
			{
				if(strlen(cmdtable[i]) == strlen(cmdname) && 
     10a:	85 c0                	test   %eax,%eax
     10c:	75 09                	jne    117 <main+0x117>
					strcmp(cmdtable[i],cmdname) == 0)
				{
					findflag = 1;
     10e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
					break;
     115:	eb 0a                	jmp    121 <main+0x121>
			printf(1,"\n");	    
		}
	    else
	    {
			int findflag = 0;
			for(int i=0; i<XV_CMD_NUM; i++)
     117:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     11b:	83 7d f0 13          	cmpl   $0x13,-0x10(%ebp)
     11f:	7e 98                	jle    b9 <main+0xb9>
				{
					findflag = 1;
					break;
				}
			}
			if(findflag == 0)
     121:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     125:	75 1d                	jne    144 <main+0x144>
			{
				color_printf(XV_RED,1,XV_BLACK,0,"no such command!\n");
     127:	83 ec 0c             	sub    $0xc,%esp
     12a:	68 b4 39 00 00       	push   $0x39b4
     12f:	6a 00                	push   $0x0
     131:	6a 00                	push   $0x0
     133:	6a 01                	push   $0x1
     135:	6a 04                	push   $0x4
     137:	e8 97 2e 00 00       	call   2fd3 <color_printf>
     13c:	83 c4 20             	add    $0x20,%esp
     13f:	e9 5f 02 00 00       	jmp    3a3 <main+0x3a3>
			else
			{
				int n;
				char buf[50];
				int fd;
				if((fd = open("aliasfile", O_RDWR)) < 0)
     144:	83 ec 08             	sub    $0x8,%esp
     147:	6a 02                	push   $0x2
     149:	68 c6 39 00 00       	push   $0x39c6
     14e:	e8 ec 04 00 00       	call   63f <open>
     153:	83 c4 10             	add    $0x10,%esp
     156:	89 45 ec             	mov    %eax,-0x14(%ebp)
     159:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     15d:	79 18                	jns    177 <main+0x177>
				{
					fd = open("aliasfile",O_CREATE|O_RDWR);
     15f:	83 ec 08             	sub    $0x8,%esp
     162:	68 02 02 00 00       	push   $0x202
     167:	68 c6 39 00 00       	push   $0x39c6
     16c:	e8 ce 04 00 00       	call   63f <open>
     171:	83 c4 10             	add    $0x10,%esp
     174:	89 45 ec             	mov    %eax,-0x14(%ebp)
				}
				int notUsed = 1;
     177:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)

				//check if there is already the alias name
				while((n = read(fd,&buf,sizeof(buf))) > 0)
     17e:	e9 cc 00 00 00       	jmp    24f <main+0x24f>
				{
					int isSame = 1;
     183:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
					int isUnalias = 0;
     18a:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
					int startIndex = 0;
     191:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
					int otherIndex = 0;
     198:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
					int len1 = strlen(buf);
     19f:	83 ec 0c             	sub    $0xc,%esp
     1a2:	8d 45 82             	lea    -0x7e(%ebp),%eax
     1a5:	50                   	push   %eax
     1a6:	e8 92 02 00 00       	call   43d <strlen>
     1ab:	83 c4 10             	add    $0x10,%esp
     1ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
					int len2 = strlen(aliasname);
     1b1:	83 ec 0c             	sub    $0xc,%esp
     1b4:	ff 75 c4             	pushl  -0x3c(%ebp)
     1b7:	e8 81 02 00 00       	call   43d <strlen>
     1bc:	83 c4 10             	add    $0x10,%esp
     1bf:	89 45 b4             	mov    %eax,-0x4c(%ebp)
					if(buf[startIndex] == '!') //unalias
     1c2:	8d 55 82             	lea    -0x7e(%ebp),%edx
     1c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1c8:	01 d0                	add    %edx,%eax
     1ca:	0f b6 00             	movzbl (%eax),%eax
     1cd:	3c 21                	cmp    $0x21,%al
     1cf:	75 38                	jne    209 <main+0x209>
					{
						startIndex++;
     1d1:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
						isUnalias = 1;
     1d5:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
					}
					while(buf[startIndex] != '=' && otherIndex < len2)
     1dc:	eb 2b                	jmp    209 <main+0x209>
					{
						if(buf[startIndex] != aliasname[otherIndex])
     1de:	8d 55 82             	lea    -0x7e(%ebp),%edx
     1e1:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1e4:	01 d0                	add    %edx,%eax
     1e6:	0f b6 10             	movzbl (%eax),%edx
     1e9:	8b 4d dc             	mov    -0x24(%ebp),%ecx
     1ec:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     1ef:	01 c8                	add    %ecx,%eax
     1f1:	0f b6 00             	movzbl (%eax),%eax
     1f4:	38 c2                	cmp    %al,%dl
     1f6:	74 09                	je     201 <main+0x201>
						{
							isSame = 0;
     1f8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
							break;
     1ff:	eb 1f                	jmp    220 <main+0x220>
						}
						startIndex++;
     201:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
						otherIndex++;
     205:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
					if(buf[startIndex] == '!') //unalias
					{
						startIndex++;
						isUnalias = 1;
					}
					while(buf[startIndex] != '=' && otherIndex < len2)
     209:	8d 55 82             	lea    -0x7e(%ebp),%edx
     20c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     20f:	01 d0                	add    %edx,%eax
     211:	0f b6 00             	movzbl (%eax),%eax
     214:	3c 3d                	cmp    $0x3d,%al
     216:	74 08                	je     220 <main+0x220>
     218:	8b 45 dc             	mov    -0x24(%ebp),%eax
     21b:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
     21e:	7c be                	jl     1de <main+0x1de>
							break;
						}
						startIndex++;
						otherIndex++;
					}
					if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
     220:	8d 55 82             	lea    -0x7e(%ebp),%edx
     223:	8b 45 e0             	mov    -0x20(%ebp),%eax
     226:	01 d0                	add    %edx,%eax
     228:	0f b6 00             	movzbl (%eax),%eax
     22b:	3c 3d                	cmp    $0x3d,%al
     22d:	75 08                	jne    237 <main+0x237>
     22f:	8b 45 dc             	mov    -0x24(%ebp),%eax
     232:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
     235:	7d 07                	jge    23e <main+0x23e>
					{
						isSame = 0;
     237:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
					}
					if(isSame == 1)
     23e:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
     242:	75 0b                	jne    24f <main+0x24f>
					{
						notUsed = 1-notUsed;
     244:	b8 01 00 00 00       	mov    $0x1,%eax
     249:	2b 45 e8             	sub    -0x18(%ebp),%eax
     24c:	89 45 e8             	mov    %eax,-0x18(%ebp)
					fd = open("aliasfile",O_CREATE|O_RDWR);
				}
				int notUsed = 1;

				//check if there is already the alias name
				while((n = read(fd,&buf,sizeof(buf))) > 0)
     24f:	83 ec 04             	sub    $0x4,%esp
     252:	6a 32                	push   $0x32
     254:	8d 45 82             	lea    -0x7e(%ebp),%eax
     257:	50                   	push   %eax
     258:	ff 75 ec             	pushl  -0x14(%ebp)
     25b:	e8 b7 03 00 00       	call   617 <read>
     260:	83 c4 10             	add    $0x10,%esp
     263:	89 45 c0             	mov    %eax,-0x40(%ebp)
     266:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
     26a:	0f 8f 13 ff ff ff    	jg     183 <main+0x183>
					if(isSame == 1)
					{
						notUsed = 1-notUsed;
					}
				}
				if(notUsed == 1)
     270:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
     274:	0f 85 ff 00 00 00    	jne    379 <main+0x379>
				{
					//add alias name
					int j = 0;
     27a:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
					for(int i=0; i < strlen(aliasname); i++,j++)
     281:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     288:	eb 1d                	jmp    2a7 <main+0x2a7>
					{
						buf[j] = aliasname[i];
     28a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     28d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     290:	01 d0                	add    %edx,%eax
     292:	0f b6 00             	movzbl (%eax),%eax
     295:	8d 4d 82             	lea    -0x7e(%ebp),%ecx
     298:	8b 55 d8             	mov    -0x28(%ebp),%edx
     29b:	01 ca                	add    %ecx,%edx
     29d:	88 02                	mov    %al,(%edx)
				}
				if(notUsed == 1)
				{
					//add alias name
					int j = 0;
					for(int i=0; i < strlen(aliasname); i++,j++)
     29f:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
     2a3:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
     2a7:	83 ec 0c             	sub    $0xc,%esp
     2aa:	ff 75 c4             	pushl  -0x3c(%ebp)
     2ad:	e8 8b 01 00 00       	call   43d <strlen>
     2b2:	83 c4 10             	add    $0x10,%esp
     2b5:	89 c2                	mov    %eax,%edx
     2b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     2ba:	39 c2                	cmp    %eax,%edx
     2bc:	77 cc                	ja     28a <main+0x28a>
					{
						buf[j] = aliasname[i];

					}
					buf[j++] = '=';
     2be:	8b 45 d8             	mov    -0x28(%ebp),%eax
     2c1:	8d 50 01             	lea    0x1(%eax),%edx
     2c4:	89 55 d8             	mov    %edx,-0x28(%ebp)
     2c7:	c6 44 05 82 3d       	movb   $0x3d,-0x7e(%ebp,%eax,1)
					for(int i=0 ; i < strlen(cmdname); i++,j++)
     2cc:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
     2d3:	eb 1d                	jmp    2f2 <main+0x2f2>
					{
						buf[j] = cmdname[i];
     2d5:	8b 55 d0             	mov    -0x30(%ebp),%edx
     2d8:	8b 45 cc             	mov    -0x34(%ebp),%eax
     2db:	01 d0                	add    %edx,%eax
     2dd:	0f b6 00             	movzbl (%eax),%eax
     2e0:	8d 4d 82             	lea    -0x7e(%ebp),%ecx
     2e3:	8b 55 d8             	mov    -0x28(%ebp),%edx
     2e6:	01 ca                	add    %ecx,%edx
     2e8:	88 02                	mov    %al,(%edx)
					{
						buf[j] = aliasname[i];

					}
					buf[j++] = '=';
					for(int i=0 ; i < strlen(cmdname); i++,j++)
     2ea:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
     2ee:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
     2f2:	83 ec 0c             	sub    $0xc,%esp
     2f5:	ff 75 cc             	pushl  -0x34(%ebp)
     2f8:	e8 40 01 00 00       	call   43d <strlen>
     2fd:	83 c4 10             	add    $0x10,%esp
     300:	89 c2                	mov    %eax,%edx
     302:	8b 45 d0             	mov    -0x30(%ebp),%eax
     305:	39 c2                	cmp    %eax,%edx
     307:	77 cc                	ja     2d5 <main+0x2d5>
					{
						buf[j] = cmdname[i];
					}
					buf[j++] = '\0';
     309:	8b 45 d8             	mov    -0x28(%ebp),%eax
     30c:	8d 50 01             	lea    0x1(%eax),%edx
     30f:	89 55 d8             	mov    %edx,-0x28(%ebp)
     312:	c6 44 05 82 00       	movb   $0x0,-0x7e(%ebp,%eax,1)
					buf[j++] = '\n';
     317:	8b 45 d8             	mov    -0x28(%ebp),%eax
     31a:	8d 50 01             	lea    0x1(%eax),%edx
     31d:	89 55 d8             	mov    %edx,-0x28(%ebp)
     320:	c6 44 05 82 0a       	movb   $0xa,-0x7e(%ebp,%eax,1)
					write(fd,buf,sizeof(buf));
     325:	83 ec 04             	sub    $0x4,%esp
     328:	6a 32                	push   $0x32
     32a:	8d 45 82             	lea    -0x7e(%ebp),%eax
     32d:	50                   	push   %eax
     32e:	ff 75 ec             	pushl  -0x14(%ebp)
     331:	e8 e9 02 00 00       	call   61f <write>
     336:	83 c4 10             	add    $0x10,%esp
					close(fd);
     339:	83 ec 0c             	sub    $0xc,%esp
     33c:	ff 75 ec             	pushl  -0x14(%ebp)
     33f:	e8 e3 02 00 00       	call   627 <close>
     344:	83 c4 10             	add    $0x10,%esp
					color_printf(XV_CYAN,1,XV_BLACK,0,"%s = %s",cmdname,aliasname);
     347:	83 ec 04             	sub    $0x4,%esp
     34a:	ff 75 c4             	pushl  -0x3c(%ebp)
     34d:	ff 75 cc             	pushl  -0x34(%ebp)
     350:	68 d0 39 00 00       	push   $0x39d0
     355:	6a 00                	push   $0x0
     357:	6a 00                	push   $0x0
     359:	6a 01                	push   $0x1
     35b:	6a 03                	push   $0x3
     35d:	e8 71 2c 00 00       	call   2fd3 <color_printf>
     362:	83 c4 20             	add    $0x20,%esp
					printf(1,"\n");
     365:	83 ec 08             	sub    $0x8,%esp
     368:	68 b2 39 00 00       	push   $0x39b2
     36d:	6a 01                	push   $0x1
     36f:	e8 37 05 00 00       	call   8ab <printf>
     374:	83 c4 10             	add    $0x10,%esp
     377:	eb 2a                	jmp    3a3 <main+0x3a3>
				}
				else
				{
					color_printf(XV_RED,1,XV_BLACK,0,"Alias name has been used!");
     379:	83 ec 0c             	sub    $0xc,%esp
     37c:	68 d8 39 00 00       	push   $0x39d8
     381:	6a 00                	push   $0x0
     383:	6a 00                	push   $0x0
     385:	6a 01                	push   $0x1
     387:	6a 04                	push   $0x4
     389:	e8 45 2c 00 00       	call   2fd3 <color_printf>
     38e:	83 c4 20             	add    $0x20,%esp
                	printf(1,"\n");
     391:	83 ec 08             	sub    $0x8,%esp
     394:	68 b2 39 00 00       	push   $0x39b2
     399:	6a 01                	push   $0x1
     39b:	e8 0b 05 00 00       	call   8ab <printf>
     3a0:	83 c4 10             	add    $0x10,%esp
				}
			}
	    }
    }
    exit();
     3a3:	e8 57 02 00 00       	call   5ff <exit>

000003a8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     3a8:	55                   	push   %ebp
     3a9:	89 e5                	mov    %esp,%ebp
     3ab:	57                   	push   %edi
     3ac:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     3ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
     3b0:	8b 55 10             	mov    0x10(%ebp),%edx
     3b3:	8b 45 0c             	mov    0xc(%ebp),%eax
     3b6:	89 cb                	mov    %ecx,%ebx
     3b8:	89 df                	mov    %ebx,%edi
     3ba:	89 d1                	mov    %edx,%ecx
     3bc:	fc                   	cld    
     3bd:	f3 aa                	rep stos %al,%es:(%edi)
     3bf:	89 ca                	mov    %ecx,%edx
     3c1:	89 fb                	mov    %edi,%ebx
     3c3:	89 5d 08             	mov    %ebx,0x8(%ebp)
     3c6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     3c9:	90                   	nop
     3ca:	5b                   	pop    %ebx
     3cb:	5f                   	pop    %edi
     3cc:	5d                   	pop    %ebp
     3cd:	c3                   	ret    

000003ce <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     3ce:	55                   	push   %ebp
     3cf:	89 e5                	mov    %esp,%ebp
     3d1:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     3d4:	8b 45 08             	mov    0x8(%ebp),%eax
     3d7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     3da:	90                   	nop
     3db:	8b 45 08             	mov    0x8(%ebp),%eax
     3de:	8d 50 01             	lea    0x1(%eax),%edx
     3e1:	89 55 08             	mov    %edx,0x8(%ebp)
     3e4:	8b 55 0c             	mov    0xc(%ebp),%edx
     3e7:	8d 4a 01             	lea    0x1(%edx),%ecx
     3ea:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     3ed:	0f b6 12             	movzbl (%edx),%edx
     3f0:	88 10                	mov    %dl,(%eax)
     3f2:	0f b6 00             	movzbl (%eax),%eax
     3f5:	84 c0                	test   %al,%al
     3f7:	75 e2                	jne    3db <strcpy+0xd>
    ;
  return os;
     3f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     3fc:	c9                   	leave  
     3fd:	c3                   	ret    

000003fe <strcmp>:

int
strcmp(const char *p, const char *q)
{
     3fe:	55                   	push   %ebp
     3ff:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     401:	eb 08                	jmp    40b <strcmp+0xd>
    p++, q++;
     403:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     407:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     40b:	8b 45 08             	mov    0x8(%ebp),%eax
     40e:	0f b6 00             	movzbl (%eax),%eax
     411:	84 c0                	test   %al,%al
     413:	74 10                	je     425 <strcmp+0x27>
     415:	8b 45 08             	mov    0x8(%ebp),%eax
     418:	0f b6 10             	movzbl (%eax),%edx
     41b:	8b 45 0c             	mov    0xc(%ebp),%eax
     41e:	0f b6 00             	movzbl (%eax),%eax
     421:	38 c2                	cmp    %al,%dl
     423:	74 de                	je     403 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     425:	8b 45 08             	mov    0x8(%ebp),%eax
     428:	0f b6 00             	movzbl (%eax),%eax
     42b:	0f b6 d0             	movzbl %al,%edx
     42e:	8b 45 0c             	mov    0xc(%ebp),%eax
     431:	0f b6 00             	movzbl (%eax),%eax
     434:	0f b6 c0             	movzbl %al,%eax
     437:	29 c2                	sub    %eax,%edx
     439:	89 d0                	mov    %edx,%eax
}
     43b:	5d                   	pop    %ebp
     43c:	c3                   	ret    

0000043d <strlen>:

uint
strlen(char *s)
{
     43d:	55                   	push   %ebp
     43e:	89 e5                	mov    %esp,%ebp
     440:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     443:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     44a:	eb 04                	jmp    450 <strlen+0x13>
     44c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     450:	8b 55 fc             	mov    -0x4(%ebp),%edx
     453:	8b 45 08             	mov    0x8(%ebp),%eax
     456:	01 d0                	add    %edx,%eax
     458:	0f b6 00             	movzbl (%eax),%eax
     45b:	84 c0                	test   %al,%al
     45d:	75 ed                	jne    44c <strlen+0xf>
    ;
  return n;
     45f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     462:	c9                   	leave  
     463:	c3                   	ret    

00000464 <memset>:

void*
memset(void *dst, int c, uint n)
{
     464:	55                   	push   %ebp
     465:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     467:	8b 45 10             	mov    0x10(%ebp),%eax
     46a:	50                   	push   %eax
     46b:	ff 75 0c             	pushl  0xc(%ebp)
     46e:	ff 75 08             	pushl  0x8(%ebp)
     471:	e8 32 ff ff ff       	call   3a8 <stosb>
     476:	83 c4 0c             	add    $0xc,%esp
  return dst;
     479:	8b 45 08             	mov    0x8(%ebp),%eax
}
     47c:	c9                   	leave  
     47d:	c3                   	ret    

0000047e <strchr>:

char*
strchr(const char *s, char c)
{
     47e:	55                   	push   %ebp
     47f:	89 e5                	mov    %esp,%ebp
     481:	83 ec 04             	sub    $0x4,%esp
     484:	8b 45 0c             	mov    0xc(%ebp),%eax
     487:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     48a:	eb 14                	jmp    4a0 <strchr+0x22>
    if(*s == c)
     48c:	8b 45 08             	mov    0x8(%ebp),%eax
     48f:	0f b6 00             	movzbl (%eax),%eax
     492:	3a 45 fc             	cmp    -0x4(%ebp),%al
     495:	75 05                	jne    49c <strchr+0x1e>
      return (char*)s;
     497:	8b 45 08             	mov    0x8(%ebp),%eax
     49a:	eb 13                	jmp    4af <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     49c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     4a0:	8b 45 08             	mov    0x8(%ebp),%eax
     4a3:	0f b6 00             	movzbl (%eax),%eax
     4a6:	84 c0                	test   %al,%al
     4a8:	75 e2                	jne    48c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     4aa:	b8 00 00 00 00       	mov    $0x0,%eax
}
     4af:	c9                   	leave  
     4b0:	c3                   	ret    

000004b1 <gets>:

char*
gets(char *buf, int max)
{
     4b1:	55                   	push   %ebp
     4b2:	89 e5                	mov    %esp,%ebp
     4b4:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     4b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     4be:	eb 42                	jmp    502 <gets+0x51>
    cc = read(0, &c, 1);
     4c0:	83 ec 04             	sub    $0x4,%esp
     4c3:	6a 01                	push   $0x1
     4c5:	8d 45 ef             	lea    -0x11(%ebp),%eax
     4c8:	50                   	push   %eax
     4c9:	6a 00                	push   $0x0
     4cb:	e8 47 01 00 00       	call   617 <read>
     4d0:	83 c4 10             	add    $0x10,%esp
     4d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     4d6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     4da:	7e 33                	jle    50f <gets+0x5e>
      break;
    buf[i++] = c;
     4dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4df:	8d 50 01             	lea    0x1(%eax),%edx
     4e2:	89 55 f4             	mov    %edx,-0xc(%ebp)
     4e5:	89 c2                	mov    %eax,%edx
     4e7:	8b 45 08             	mov    0x8(%ebp),%eax
     4ea:	01 c2                	add    %eax,%edx
     4ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     4f0:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     4f2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     4f6:	3c 0a                	cmp    $0xa,%al
     4f8:	74 16                	je     510 <gets+0x5f>
     4fa:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     4fe:	3c 0d                	cmp    $0xd,%al
     500:	74 0e                	je     510 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     502:	8b 45 f4             	mov    -0xc(%ebp),%eax
     505:	83 c0 01             	add    $0x1,%eax
     508:	3b 45 0c             	cmp    0xc(%ebp),%eax
     50b:	7c b3                	jl     4c0 <gets+0xf>
     50d:	eb 01                	jmp    510 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     50f:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     510:	8b 55 f4             	mov    -0xc(%ebp),%edx
     513:	8b 45 08             	mov    0x8(%ebp),%eax
     516:	01 d0                	add    %edx,%eax
     518:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     51b:	8b 45 08             	mov    0x8(%ebp),%eax
}
     51e:	c9                   	leave  
     51f:	c3                   	ret    

00000520 <stat>:

int
stat(char *n, struct stat *st)
{
     520:	55                   	push   %ebp
     521:	89 e5                	mov    %esp,%ebp
     523:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     526:	83 ec 08             	sub    $0x8,%esp
     529:	6a 00                	push   $0x0
     52b:	ff 75 08             	pushl  0x8(%ebp)
     52e:	e8 0c 01 00 00       	call   63f <open>
     533:	83 c4 10             	add    $0x10,%esp
     536:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     539:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     53d:	79 07                	jns    546 <stat+0x26>
    return -1;
     53f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     544:	eb 25                	jmp    56b <stat+0x4b>
  r = fstat(fd, st);
     546:	83 ec 08             	sub    $0x8,%esp
     549:	ff 75 0c             	pushl  0xc(%ebp)
     54c:	ff 75 f4             	pushl  -0xc(%ebp)
     54f:	e8 03 01 00 00       	call   657 <fstat>
     554:	83 c4 10             	add    $0x10,%esp
     557:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     55a:	83 ec 0c             	sub    $0xc,%esp
     55d:	ff 75 f4             	pushl  -0xc(%ebp)
     560:	e8 c2 00 00 00       	call   627 <close>
     565:	83 c4 10             	add    $0x10,%esp
  return r;
     568:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     56b:	c9                   	leave  
     56c:	c3                   	ret    

0000056d <atoi>:

int
atoi(const char *s)
{
     56d:	55                   	push   %ebp
     56e:	89 e5                	mov    %esp,%ebp
     570:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     573:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     57a:	eb 25                	jmp    5a1 <atoi+0x34>
    n = n*10 + *s++ - '0';
     57c:	8b 55 fc             	mov    -0x4(%ebp),%edx
     57f:	89 d0                	mov    %edx,%eax
     581:	c1 e0 02             	shl    $0x2,%eax
     584:	01 d0                	add    %edx,%eax
     586:	01 c0                	add    %eax,%eax
     588:	89 c1                	mov    %eax,%ecx
     58a:	8b 45 08             	mov    0x8(%ebp),%eax
     58d:	8d 50 01             	lea    0x1(%eax),%edx
     590:	89 55 08             	mov    %edx,0x8(%ebp)
     593:	0f b6 00             	movzbl (%eax),%eax
     596:	0f be c0             	movsbl %al,%eax
     599:	01 c8                	add    %ecx,%eax
     59b:	83 e8 30             	sub    $0x30,%eax
     59e:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     5a1:	8b 45 08             	mov    0x8(%ebp),%eax
     5a4:	0f b6 00             	movzbl (%eax),%eax
     5a7:	3c 2f                	cmp    $0x2f,%al
     5a9:	7e 0a                	jle    5b5 <atoi+0x48>
     5ab:	8b 45 08             	mov    0x8(%ebp),%eax
     5ae:	0f b6 00             	movzbl (%eax),%eax
     5b1:	3c 39                	cmp    $0x39,%al
     5b3:	7e c7                	jle    57c <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     5b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     5b8:	c9                   	leave  
     5b9:	c3                   	ret    

000005ba <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     5ba:	55                   	push   %ebp
     5bb:	89 e5                	mov    %esp,%ebp
     5bd:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     5c0:	8b 45 08             	mov    0x8(%ebp),%eax
     5c3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     5c6:	8b 45 0c             	mov    0xc(%ebp),%eax
     5c9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     5cc:	eb 17                	jmp    5e5 <memmove+0x2b>
    *dst++ = *src++;
     5ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
     5d1:	8d 50 01             	lea    0x1(%eax),%edx
     5d4:	89 55 fc             	mov    %edx,-0x4(%ebp)
     5d7:	8b 55 f8             	mov    -0x8(%ebp),%edx
     5da:	8d 4a 01             	lea    0x1(%edx),%ecx
     5dd:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     5e0:	0f b6 12             	movzbl (%edx),%edx
     5e3:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     5e5:	8b 45 10             	mov    0x10(%ebp),%eax
     5e8:	8d 50 ff             	lea    -0x1(%eax),%edx
     5eb:	89 55 10             	mov    %edx,0x10(%ebp)
     5ee:	85 c0                	test   %eax,%eax
     5f0:	7f dc                	jg     5ce <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     5f2:	8b 45 08             	mov    0x8(%ebp),%eax
}
     5f5:	c9                   	leave  
     5f6:	c3                   	ret    

000005f7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     5f7:	b8 01 00 00 00       	mov    $0x1,%eax
     5fc:	cd 40                	int    $0x40
     5fe:	c3                   	ret    

000005ff <exit>:
SYSCALL(exit)
     5ff:	b8 02 00 00 00       	mov    $0x2,%eax
     604:	cd 40                	int    $0x40
     606:	c3                   	ret    

00000607 <wait>:
SYSCALL(wait)
     607:	b8 03 00 00 00       	mov    $0x3,%eax
     60c:	cd 40                	int    $0x40
     60e:	c3                   	ret    

0000060f <pipe>:
SYSCALL(pipe)
     60f:	b8 04 00 00 00       	mov    $0x4,%eax
     614:	cd 40                	int    $0x40
     616:	c3                   	ret    

00000617 <read>:
SYSCALL(read)
     617:	b8 05 00 00 00       	mov    $0x5,%eax
     61c:	cd 40                	int    $0x40
     61e:	c3                   	ret    

0000061f <write>:
SYSCALL(write)
     61f:	b8 10 00 00 00       	mov    $0x10,%eax
     624:	cd 40                	int    $0x40
     626:	c3                   	ret    

00000627 <close>:
SYSCALL(close)
     627:	b8 15 00 00 00       	mov    $0x15,%eax
     62c:	cd 40                	int    $0x40
     62e:	c3                   	ret    

0000062f <kill>:
SYSCALL(kill)
     62f:	b8 06 00 00 00       	mov    $0x6,%eax
     634:	cd 40                	int    $0x40
     636:	c3                   	ret    

00000637 <exec>:
SYSCALL(exec)
     637:	b8 07 00 00 00       	mov    $0x7,%eax
     63c:	cd 40                	int    $0x40
     63e:	c3                   	ret    

0000063f <open>:
SYSCALL(open)
     63f:	b8 0f 00 00 00       	mov    $0xf,%eax
     644:	cd 40                	int    $0x40
     646:	c3                   	ret    

00000647 <mknod>:
SYSCALL(mknod)
     647:	b8 11 00 00 00       	mov    $0x11,%eax
     64c:	cd 40                	int    $0x40
     64e:	c3                   	ret    

0000064f <unlink>:
SYSCALL(unlink)
     64f:	b8 12 00 00 00       	mov    $0x12,%eax
     654:	cd 40                	int    $0x40
     656:	c3                   	ret    

00000657 <fstat>:
SYSCALL(fstat)
     657:	b8 08 00 00 00       	mov    $0x8,%eax
     65c:	cd 40                	int    $0x40
     65e:	c3                   	ret    

0000065f <link>:
SYSCALL(link)
     65f:	b8 13 00 00 00       	mov    $0x13,%eax
     664:	cd 40                	int    $0x40
     666:	c3                   	ret    

00000667 <mkdir>:
SYSCALL(mkdir)
     667:	b8 14 00 00 00       	mov    $0x14,%eax
     66c:	cd 40                	int    $0x40
     66e:	c3                   	ret    

0000066f <chdir>:
SYSCALL(chdir)
     66f:	b8 09 00 00 00       	mov    $0x9,%eax
     674:	cd 40                	int    $0x40
     676:	c3                   	ret    

00000677 <dup>:
SYSCALL(dup)
     677:	b8 0a 00 00 00       	mov    $0xa,%eax
     67c:	cd 40                	int    $0x40
     67e:	c3                   	ret    

0000067f <getpid>:
SYSCALL(getpid)
     67f:	b8 0b 00 00 00       	mov    $0xb,%eax
     684:	cd 40                	int    $0x40
     686:	c3                   	ret    

00000687 <sbrk>:
SYSCALL(sbrk)
     687:	b8 0c 00 00 00       	mov    $0xc,%eax
     68c:	cd 40                	int    $0x40
     68e:	c3                   	ret    

0000068f <sleep>:
SYSCALL(sleep)
     68f:	b8 0d 00 00 00       	mov    $0xd,%eax
     694:	cd 40                	int    $0x40
     696:	c3                   	ret    

00000697 <uptime>:
SYSCALL(uptime)
     697:	b8 0e 00 00 00       	mov    $0xe,%eax
     69c:	cd 40                	int    $0x40
     69e:	c3                   	ret    

0000069f <colorwrite>:

//new here
SYSCALL(colorwrite)
     69f:	b8 16 00 00 00       	mov    $0x16,%eax
     6a4:	cd 40                	int    $0x40
     6a6:	c3                   	ret    

000006a7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     6a7:	55                   	push   %ebp
     6a8:	89 e5                	mov    %esp,%ebp
     6aa:	83 ec 18             	sub    $0x18,%esp
     6ad:	8b 45 0c             	mov    0xc(%ebp),%eax
     6b0:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     6b3:	83 ec 04             	sub    $0x4,%esp
     6b6:	6a 01                	push   $0x1
     6b8:	8d 45 f4             	lea    -0xc(%ebp),%eax
     6bb:	50                   	push   %eax
     6bc:	ff 75 08             	pushl  0x8(%ebp)
     6bf:	e8 5b ff ff ff       	call   61f <write>
     6c4:	83 c4 10             	add    $0x10,%esp
}
     6c7:	90                   	nop
     6c8:	c9                   	leave  
     6c9:	c3                   	ret    

000006ca <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     6ca:	55                   	push   %ebp
     6cb:	89 e5                	mov    %esp,%ebp
     6cd:	53                   	push   %ebx
     6ce:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     6d1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     6d8:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     6dc:	74 17                	je     6f5 <printint+0x2b>
     6de:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     6e2:	79 11                	jns    6f5 <printint+0x2b>
    neg = 1;
     6e4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     6eb:	8b 45 0c             	mov    0xc(%ebp),%eax
     6ee:	f7 d8                	neg    %eax
     6f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
     6f3:	eb 06                	jmp    6fb <printint+0x31>
  } else {
    x = xx;
     6f5:	8b 45 0c             	mov    0xc(%ebp),%eax
     6f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     6fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     702:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     705:	8d 41 01             	lea    0x1(%ecx),%eax
     708:	89 45 f4             	mov    %eax,-0xc(%ebp)
     70b:	8b 5d 10             	mov    0x10(%ebp),%ebx
     70e:	8b 45 ec             	mov    -0x14(%ebp),%eax
     711:	ba 00 00 00 00       	mov    $0x0,%edx
     716:	f7 f3                	div    %ebx
     718:	89 d0                	mov    %edx,%eax
     71a:	0f b6 80 20 46 00 00 	movzbl 0x4620(%eax),%eax
     721:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     725:	8b 5d 10             	mov    0x10(%ebp),%ebx
     728:	8b 45 ec             	mov    -0x14(%ebp),%eax
     72b:	ba 00 00 00 00       	mov    $0x0,%edx
     730:	f7 f3                	div    %ebx
     732:	89 45 ec             	mov    %eax,-0x14(%ebp)
     735:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     739:	75 c7                	jne    702 <printint+0x38>
  if(neg)
     73b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     73f:	74 2d                	je     76e <printint+0xa4>
    buf[i++] = '-';
     741:	8b 45 f4             	mov    -0xc(%ebp),%eax
     744:	8d 50 01             	lea    0x1(%eax),%edx
     747:	89 55 f4             	mov    %edx,-0xc(%ebp)
     74a:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     74f:	eb 1d                	jmp    76e <printint+0xa4>
    putc(fd, buf[i]);
     751:	8d 55 dc             	lea    -0x24(%ebp),%edx
     754:	8b 45 f4             	mov    -0xc(%ebp),%eax
     757:	01 d0                	add    %edx,%eax
     759:	0f b6 00             	movzbl (%eax),%eax
     75c:	0f be c0             	movsbl %al,%eax
     75f:	83 ec 08             	sub    $0x8,%esp
     762:	50                   	push   %eax
     763:	ff 75 08             	pushl  0x8(%ebp)
     766:	e8 3c ff ff ff       	call   6a7 <putc>
     76b:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     76e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     772:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     776:	79 d9                	jns    751 <printint+0x87>
    putc(fd, buf[i]);
}
     778:	90                   	nop
     779:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     77c:	c9                   	leave  
     77d:	c3                   	ret    

0000077e <getInteger>:

static int getInteger(double num)
{
     77e:	55                   	push   %ebp
     77f:	89 e5                	mov    %esp,%ebp
     781:	83 ec 18             	sub    $0x18,%esp
     784:	8b 45 08             	mov    0x8(%ebp),%eax
     787:	89 45 e8             	mov    %eax,-0x18(%ebp)
     78a:	8b 45 0c             	mov    0xc(%ebp),%eax
     78d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     790:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     797:	eb 0e                	jmp    7a7 <getInteger+0x29>
  {
    num -= 1;
     799:	dd 45 e8             	fldl   -0x18(%ebp)
     79c:	d9 e8                	fld1   
     79e:	de e9                	fsubrp %st,%st(1)
     7a0:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     7a3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     7a7:	dd 45 e8             	fldl   -0x18(%ebp)
     7aa:	d9 e8                	fld1   
     7ac:	d9 c9                	fxch   %st(1)
     7ae:	df e9                	fucomip %st(1),%st
     7b0:	dd d8                	fstp   %st(0)
     7b2:	77 e5                	ja     799 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     7b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     7b7:	c9                   	leave  
     7b8:	c3                   	ret    

000007b9 <printdbl>:

void printdbl(int fd, double num)
{
     7b9:	55                   	push   %ebp
     7ba:	89 e5                	mov    %esp,%ebp
     7bc:	83 ec 28             	sub    $0x28,%esp
     7bf:	8b 45 0c             	mov    0xc(%ebp),%eax
     7c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
     7c5:	8b 45 10             	mov    0x10(%ebp),%eax
     7c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     7cb:	d9 ee                	fldz   
     7cd:	dd 45 e0             	fldl   -0x20(%ebp)
     7d0:	d9 c9                	fxch   %st(1)
     7d2:	df e9                	fucomip %st(1),%st
     7d4:	dd d8                	fstp   %st(0)
     7d6:	76 18                	jbe    7f0 <printdbl+0x37>
  {
    putc(fd,'-');
     7d8:	83 ec 08             	sub    $0x8,%esp
     7db:	6a 2d                	push   $0x2d
     7dd:	ff 75 08             	pushl  0x8(%ebp)
     7e0:	e8 c2 fe ff ff       	call   6a7 <putc>
     7e5:	83 c4 10             	add    $0x10,%esp
    num = -num;
     7e8:	dd 45 e0             	fldl   -0x20(%ebp)
     7eb:	d9 e0                	fchs   
     7ed:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     7f0:	83 ec 08             	sub    $0x8,%esp
     7f3:	ff 75 e4             	pushl  -0x1c(%ebp)
     7f6:	ff 75 e0             	pushl  -0x20(%ebp)
     7f9:	e8 80 ff ff ff       	call   77e <getInteger>
     7fe:	83 c4 10             	add    $0x10,%esp
     801:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     804:	6a 01                	push   $0x1
     806:	6a 0a                	push   $0xa
     808:	ff 75 f0             	pushl  -0x10(%ebp)
     80b:	ff 75 08             	pushl  0x8(%ebp)
     80e:	e8 b7 fe ff ff       	call   6ca <printint>
     813:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     816:	db 45 f0             	fildl  -0x10(%ebp)
     819:	dd 45 e0             	fldl   -0x20(%ebp)
     81c:	de e1                	fsubp  %st,%st(1)
     81e:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     821:	dd 45 e0             	fldl   -0x20(%ebp)
     824:	dd 05 00 3a 00 00    	fldl   0x3a00
     82a:	d9 c9                	fxch   %st(1)
     82c:	df e9                	fucomip %st(1),%st
     82e:	dd d8                	fstp   %st(0)
     830:	76 10                	jbe    842 <printdbl+0x89>
    putc(fd,'.');
     832:	83 ec 08             	sub    $0x8,%esp
     835:	6a 2e                	push   $0x2e
     837:	ff 75 08             	pushl  0x8(%ebp)
     83a:	e8 68 fe ff ff       	call   6a7 <putc>
     83f:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     842:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     849:	eb 49                	jmp    894 <printdbl+0xdb>
  {
    num = num*10;
     84b:	dd 45 e0             	fldl   -0x20(%ebp)
     84e:	dd 05 08 3a 00 00    	fldl   0x3a08
     854:	de c9                	fmulp  %st,%st(1)
     856:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     859:	83 ec 08             	sub    $0x8,%esp
     85c:	ff 75 e4             	pushl  -0x1c(%ebp)
     85f:	ff 75 e0             	pushl  -0x20(%ebp)
     862:	e8 17 ff ff ff       	call   77e <getInteger>
     867:	83 c4 10             	add    $0x10,%esp
     86a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     86d:	6a 01                	push   $0x1
     86f:	6a 0a                	push   $0xa
     871:	ff 75 f0             	pushl  -0x10(%ebp)
     874:	ff 75 08             	pushl  0x8(%ebp)
     877:	e8 4e fe ff ff       	call   6ca <printint>
     87c:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     87f:	db 45 f0             	fildl  -0x10(%ebp)
     882:	dd 45 e0             	fldl   -0x20(%ebp)
     885:	de e1                	fsubp  %st,%st(1)
     887:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     88a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     88e:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     892:	7f 13                	jg     8a7 <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     894:	dd 45 e0             	fldl   -0x20(%ebp)
     897:	dd 05 00 3a 00 00    	fldl   0x3a00
     89d:	d9 c9                	fxch   %st(1)
     89f:	df e9                	fucomip %st(1),%st
     8a1:	dd d8                	fstp   %st(0)
     8a3:	77 a6                	ja     84b <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     8a5:	eb 01                	jmp    8a8 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     8a7:	90                   	nop
    }
  }
}
     8a8:	90                   	nop
     8a9:	c9                   	leave  
     8aa:	c3                   	ret    

000008ab <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     8ab:	55                   	push   %ebp
     8ac:	89 e5                	mov    %esp,%ebp
     8ae:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     8b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     8b8:	8d 45 0c             	lea    0xc(%ebp),%eax
     8bb:	83 c0 04             	add    $0x4,%eax
     8be:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     8c1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     8c8:	e9 88 01 00 00       	jmp    a55 <printf+0x1aa>
    c = fmt[i] & 0xff;
     8cd:	8b 55 0c             	mov    0xc(%ebp),%edx
     8d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8d3:	01 d0                	add    %edx,%eax
     8d5:	0f b6 00             	movzbl (%eax),%eax
     8d8:	0f be c0             	movsbl %al,%eax
     8db:	25 ff 00 00 00       	and    $0xff,%eax
     8e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     8e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     8e7:	75 2c                	jne    915 <printf+0x6a>
      if(c == '%'){
     8e9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     8ed:	75 0c                	jne    8fb <printf+0x50>
        state = '%';
     8ef:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     8f6:	e9 56 01 00 00       	jmp    a51 <printf+0x1a6>
      } else {
        putc(fd, c);
     8fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8fe:	0f be c0             	movsbl %al,%eax
     901:	83 ec 08             	sub    $0x8,%esp
     904:	50                   	push   %eax
     905:	ff 75 08             	pushl  0x8(%ebp)
     908:	e8 9a fd ff ff       	call   6a7 <putc>
     90d:	83 c4 10             	add    $0x10,%esp
     910:	e9 3c 01 00 00       	jmp    a51 <printf+0x1a6>
      }
    } else if(state == '%'){
     915:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     919:	0f 85 32 01 00 00    	jne    a51 <printf+0x1a6>
      if(c == 'd'){
     91f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     923:	75 1e                	jne    943 <printf+0x98>
        printint(fd, *ap, 10, 1);
     925:	8b 45 e8             	mov    -0x18(%ebp),%eax
     928:	8b 00                	mov    (%eax),%eax
     92a:	6a 01                	push   $0x1
     92c:	6a 0a                	push   $0xa
     92e:	50                   	push   %eax
     92f:	ff 75 08             	pushl  0x8(%ebp)
     932:	e8 93 fd ff ff       	call   6ca <printint>
     937:	83 c4 10             	add    $0x10,%esp
        ap++;
     93a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     93e:	e9 07 01 00 00       	jmp    a4a <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     943:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     947:	74 06                	je     94f <printf+0xa4>
     949:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     94d:	75 1e                	jne    96d <printf+0xc2>
        printint(fd, *ap, 16, 0);
     94f:	8b 45 e8             	mov    -0x18(%ebp),%eax
     952:	8b 00                	mov    (%eax),%eax
     954:	6a 00                	push   $0x0
     956:	6a 10                	push   $0x10
     958:	50                   	push   %eax
     959:	ff 75 08             	pushl  0x8(%ebp)
     95c:	e8 69 fd ff ff       	call   6ca <printint>
     961:	83 c4 10             	add    $0x10,%esp
        ap++;
     964:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     968:	e9 dd 00 00 00       	jmp    a4a <printf+0x19f>
      } else if(c == 's'){
     96d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     971:	75 46                	jne    9b9 <printf+0x10e>
        s = (char*)*ap;
     973:	8b 45 e8             	mov    -0x18(%ebp),%eax
     976:	8b 00                	mov    (%eax),%eax
     978:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     97b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     97f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     983:	75 25                	jne    9aa <printf+0xff>
          s = "(null)";
     985:	c7 45 f4 f8 39 00 00 	movl   $0x39f8,-0xc(%ebp)
        while(*s != 0){
     98c:	eb 1c                	jmp    9aa <printf+0xff>
          putc(fd, *s);
     98e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     991:	0f b6 00             	movzbl (%eax),%eax
     994:	0f be c0             	movsbl %al,%eax
     997:	83 ec 08             	sub    $0x8,%esp
     99a:	50                   	push   %eax
     99b:	ff 75 08             	pushl  0x8(%ebp)
     99e:	e8 04 fd ff ff       	call   6a7 <putc>
     9a3:	83 c4 10             	add    $0x10,%esp
          s++;
     9a6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     9aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9ad:	0f b6 00             	movzbl (%eax),%eax
     9b0:	84 c0                	test   %al,%al
     9b2:	75 da                	jne    98e <printf+0xe3>
     9b4:	e9 91 00 00 00       	jmp    a4a <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     9b9:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     9bd:	75 1d                	jne    9dc <printf+0x131>
        putc(fd, *ap);
     9bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
     9c2:	8b 00                	mov    (%eax),%eax
     9c4:	0f be c0             	movsbl %al,%eax
     9c7:	83 ec 08             	sub    $0x8,%esp
     9ca:	50                   	push   %eax
     9cb:	ff 75 08             	pushl  0x8(%ebp)
     9ce:	e8 d4 fc ff ff       	call   6a7 <putc>
     9d3:	83 c4 10             	add    $0x10,%esp
        ap++;
     9d6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     9da:	eb 6e                	jmp    a4a <printf+0x19f>
      } else if(c == '%'){
     9dc:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     9e0:	75 17                	jne    9f9 <printf+0x14e>
        putc(fd, c);
     9e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9e5:	0f be c0             	movsbl %al,%eax
     9e8:	83 ec 08             	sub    $0x8,%esp
     9eb:	50                   	push   %eax
     9ec:	ff 75 08             	pushl  0x8(%ebp)
     9ef:	e8 b3 fc ff ff       	call   6a7 <putc>
     9f4:	83 c4 10             	add    $0x10,%esp
     9f7:	eb 51                	jmp    a4a <printf+0x19f>
      } else if(c == 'f'){ //for double
     9f9:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     9fd:	75 26                	jne    a25 <printf+0x17a>
        double *dap = (double*)ap;
     9ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
     a02:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     a05:	8b 45 e0             	mov    -0x20(%ebp),%eax
     a08:	dd 00                	fldl   (%eax)
     a0a:	83 ec 04             	sub    $0x4,%esp
     a0d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     a11:	dd 1c 24             	fstpl  (%esp)
     a14:	ff 75 08             	pushl  0x8(%ebp)
     a17:	e8 9d fd ff ff       	call   7b9 <printdbl>
     a1c:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     a1f:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     a23:	eb 25                	jmp    a4a <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     a25:	83 ec 08             	sub    $0x8,%esp
     a28:	6a 25                	push   $0x25
     a2a:	ff 75 08             	pushl  0x8(%ebp)
     a2d:	e8 75 fc ff ff       	call   6a7 <putc>
     a32:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     a35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a38:	0f be c0             	movsbl %al,%eax
     a3b:	83 ec 08             	sub    $0x8,%esp
     a3e:	50                   	push   %eax
     a3f:	ff 75 08             	pushl  0x8(%ebp)
     a42:	e8 60 fc ff ff       	call   6a7 <putc>
     a47:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     a4a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     a51:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     a55:	8b 55 0c             	mov    0xc(%ebp),%edx
     a58:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a5b:	01 d0                	add    %edx,%eax
     a5d:	0f b6 00             	movzbl (%eax),%eax
     a60:	84 c0                	test   %al,%al
     a62:	0f 85 65 fe ff ff    	jne    8cd <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     a68:	90                   	nop
     a69:	c9                   	leave  
     a6a:	c3                   	ret    

00000a6b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     a6b:	55                   	push   %ebp
     a6c:	89 e5                	mov    %esp,%ebp
     a6e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     a71:	8b 45 08             	mov    0x8(%ebp),%eax
     a74:	83 e8 08             	sub    $0x8,%eax
     a77:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     a7a:	a1 68 47 00 00       	mov    0x4768,%eax
     a7f:	89 45 fc             	mov    %eax,-0x4(%ebp)
     a82:	eb 24                	jmp    aa8 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     a84:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a87:	8b 00                	mov    (%eax),%eax
     a89:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     a8c:	77 12                	ja     aa0 <free+0x35>
     a8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a91:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     a94:	77 24                	ja     aba <free+0x4f>
     a96:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a99:	8b 00                	mov    (%eax),%eax
     a9b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     a9e:	77 1a                	ja     aba <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     aa0:	8b 45 fc             	mov    -0x4(%ebp),%eax
     aa3:	8b 00                	mov    (%eax),%eax
     aa5:	89 45 fc             	mov    %eax,-0x4(%ebp)
     aa8:	8b 45 f8             	mov    -0x8(%ebp),%eax
     aab:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     aae:	76 d4                	jbe    a84 <free+0x19>
     ab0:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ab3:	8b 00                	mov    (%eax),%eax
     ab5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     ab8:	76 ca                	jbe    a84 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     aba:	8b 45 f8             	mov    -0x8(%ebp),%eax
     abd:	8b 40 04             	mov    0x4(%eax),%eax
     ac0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     ac7:	8b 45 f8             	mov    -0x8(%ebp),%eax
     aca:	01 c2                	add    %eax,%edx
     acc:	8b 45 fc             	mov    -0x4(%ebp),%eax
     acf:	8b 00                	mov    (%eax),%eax
     ad1:	39 c2                	cmp    %eax,%edx
     ad3:	75 24                	jne    af9 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     ad5:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ad8:	8b 50 04             	mov    0x4(%eax),%edx
     adb:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ade:	8b 00                	mov    (%eax),%eax
     ae0:	8b 40 04             	mov    0x4(%eax),%eax
     ae3:	01 c2                	add    %eax,%edx
     ae5:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ae8:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     aeb:	8b 45 fc             	mov    -0x4(%ebp),%eax
     aee:	8b 00                	mov    (%eax),%eax
     af0:	8b 10                	mov    (%eax),%edx
     af2:	8b 45 f8             	mov    -0x8(%ebp),%eax
     af5:	89 10                	mov    %edx,(%eax)
     af7:	eb 0a                	jmp    b03 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     af9:	8b 45 fc             	mov    -0x4(%ebp),%eax
     afc:	8b 10                	mov    (%eax),%edx
     afe:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b01:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     b03:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b06:	8b 40 04             	mov    0x4(%eax),%eax
     b09:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     b10:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b13:	01 d0                	add    %edx,%eax
     b15:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     b18:	75 20                	jne    b3a <free+0xcf>
    p->s.size += bp->s.size;
     b1a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b1d:	8b 50 04             	mov    0x4(%eax),%edx
     b20:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b23:	8b 40 04             	mov    0x4(%eax),%eax
     b26:	01 c2                	add    %eax,%edx
     b28:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b2b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     b2e:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b31:	8b 10                	mov    (%eax),%edx
     b33:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b36:	89 10                	mov    %edx,(%eax)
     b38:	eb 08                	jmp    b42 <free+0xd7>
  } else
    p->s.ptr = bp;
     b3a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b3d:	8b 55 f8             	mov    -0x8(%ebp),%edx
     b40:	89 10                	mov    %edx,(%eax)
  freep = p;
     b42:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b45:	a3 68 47 00 00       	mov    %eax,0x4768
}
     b4a:	90                   	nop
     b4b:	c9                   	leave  
     b4c:	c3                   	ret    

00000b4d <morecore>:

static Header*
morecore(uint nu)
{
     b4d:	55                   	push   %ebp
     b4e:	89 e5                	mov    %esp,%ebp
     b50:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     b53:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     b5a:	77 07                	ja     b63 <morecore+0x16>
    nu = 4096;
     b5c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     b63:	8b 45 08             	mov    0x8(%ebp),%eax
     b66:	c1 e0 03             	shl    $0x3,%eax
     b69:	83 ec 0c             	sub    $0xc,%esp
     b6c:	50                   	push   %eax
     b6d:	e8 15 fb ff ff       	call   687 <sbrk>
     b72:	83 c4 10             	add    $0x10,%esp
     b75:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     b78:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     b7c:	75 07                	jne    b85 <morecore+0x38>
    return 0;
     b7e:	b8 00 00 00 00       	mov    $0x0,%eax
     b83:	eb 26                	jmp    bab <morecore+0x5e>
  hp = (Header*)p;
     b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b88:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     b8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b8e:	8b 55 08             	mov    0x8(%ebp),%edx
     b91:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     b94:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b97:	83 c0 08             	add    $0x8,%eax
     b9a:	83 ec 0c             	sub    $0xc,%esp
     b9d:	50                   	push   %eax
     b9e:	e8 c8 fe ff ff       	call   a6b <free>
     ba3:	83 c4 10             	add    $0x10,%esp
  return freep;
     ba6:	a1 68 47 00 00       	mov    0x4768,%eax
}
     bab:	c9                   	leave  
     bac:	c3                   	ret    

00000bad <malloc>:

void*
malloc(uint nbytes)
{
     bad:	55                   	push   %ebp
     bae:	89 e5                	mov    %esp,%ebp
     bb0:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     bb3:	8b 45 08             	mov    0x8(%ebp),%eax
     bb6:	83 c0 07             	add    $0x7,%eax
     bb9:	c1 e8 03             	shr    $0x3,%eax
     bbc:	83 c0 01             	add    $0x1,%eax
     bbf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     bc2:	a1 68 47 00 00       	mov    0x4768,%eax
     bc7:	89 45 f0             	mov    %eax,-0x10(%ebp)
     bca:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     bce:	75 23                	jne    bf3 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     bd0:	c7 45 f0 60 47 00 00 	movl   $0x4760,-0x10(%ebp)
     bd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bda:	a3 68 47 00 00       	mov    %eax,0x4768
     bdf:	a1 68 47 00 00       	mov    0x4768,%eax
     be4:	a3 60 47 00 00       	mov    %eax,0x4760
    base.s.size = 0;
     be9:	c7 05 64 47 00 00 00 	movl   $0x0,0x4764
     bf0:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     bf3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bf6:	8b 00                	mov    (%eax),%eax
     bf8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     bfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bfe:	8b 40 04             	mov    0x4(%eax),%eax
     c01:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     c04:	72 4d                	jb     c53 <malloc+0xa6>
      if(p->s.size == nunits)
     c06:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c09:	8b 40 04             	mov    0x4(%eax),%eax
     c0c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     c0f:	75 0c                	jne    c1d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     c11:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c14:	8b 10                	mov    (%eax),%edx
     c16:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c19:	89 10                	mov    %edx,(%eax)
     c1b:	eb 26                	jmp    c43 <malloc+0x96>
      else {
        p->s.size -= nunits;
     c1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c20:	8b 40 04             	mov    0x4(%eax),%eax
     c23:	2b 45 ec             	sub    -0x14(%ebp),%eax
     c26:	89 c2                	mov    %eax,%edx
     c28:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c2b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     c2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c31:	8b 40 04             	mov    0x4(%eax),%eax
     c34:	c1 e0 03             	shl    $0x3,%eax
     c37:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     c3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c3d:	8b 55 ec             	mov    -0x14(%ebp),%edx
     c40:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     c43:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c46:	a3 68 47 00 00       	mov    %eax,0x4768
      return (void*)(p + 1);
     c4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c4e:	83 c0 08             	add    $0x8,%eax
     c51:	eb 3b                	jmp    c8e <malloc+0xe1>
    }
    if(p == freep)
     c53:	a1 68 47 00 00       	mov    0x4768,%eax
     c58:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     c5b:	75 1e                	jne    c7b <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     c5d:	83 ec 0c             	sub    $0xc,%esp
     c60:	ff 75 ec             	pushl  -0x14(%ebp)
     c63:	e8 e5 fe ff ff       	call   b4d <morecore>
     c68:	83 c4 10             	add    $0x10,%esp
     c6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
     c6e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     c72:	75 07                	jne    c7b <malloc+0xce>
        return 0;
     c74:	b8 00 00 00 00       	mov    $0x0,%eax
     c79:	eb 13                	jmp    c8e <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     c7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c7e:	89 45 f0             	mov    %eax,-0x10(%ebp)
     c81:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c84:	8b 00                	mov    (%eax),%eax
     c86:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     c89:	e9 6d ff ff ff       	jmp    bfb <malloc+0x4e>
}
     c8e:	c9                   	leave  
     c8f:	c3                   	ret    

00000c90 <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     c96:	83 ec 04             	sub    $0x4,%esp
     c99:	ff 75 08             	pushl  0x8(%ebp)
     c9c:	68 10 3a 00 00       	push   $0x3a10
     ca1:	6a 02                	push   $0x2
     ca3:	e8 03 fc ff ff       	call   8ab <printf>
     ca8:	83 c4 10             	add    $0x10,%esp
  exit();
     cab:	e8 4f f9 ff ff       	call   5ff <exit>

00000cb0 <getInteger>:
}

static int getInteger(double num)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	83 ec 18             	sub    $0x18,%esp
     cb6:	8b 45 08             	mov    0x8(%ebp),%eax
     cb9:	89 45 e8             	mov    %eax,-0x18(%ebp)
     cbc:	8b 45 0c             	mov    0xc(%ebp),%eax
     cbf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     cc2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     cc9:	eb 0e                	jmp    cd9 <getInteger+0x29>
  {
    num -= 1;
     ccb:	dd 45 e8             	fldl   -0x18(%ebp)
     cce:	d9 e8                	fld1   
     cd0:	de e9                	fsubrp %st,%st(1)
     cd2:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     cd5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     cd9:	dd 45 e8             	fldl   -0x18(%ebp)
     cdc:	d9 e8                	fld1   
     cde:	d9 c9                	fxch   %st(1)
     ce0:	df e9                	fucomip %st(1),%st
     ce2:	dd d8                	fstp   %st(0)
     ce4:	77 e5                	ja     ccb <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     ce6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     ce9:	c9                   	leave  
     cea:	c3                   	ret    

00000ceb <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     ceb:	55                   	push   %ebp
     cec:	89 e5                	mov    %esp,%ebp
     cee:	53                   	push   %ebx
     cef:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     cf2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     cf9:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     cfd:	74 17                	je     d16 <int2str+0x2b>
     cff:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     d03:	79 11                	jns    d16 <int2str+0x2b>
    neg = 1;
     d05:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     d0c:	8b 45 0c             	mov    0xc(%ebp),%eax
     d0f:	f7 d8                	neg    %eax
     d11:	89 45 f0             	mov    %eax,-0x10(%ebp)
     d14:	eb 06                	jmp    d1c <int2str+0x31>
  } else {
    x = num;
     d16:	8b 45 0c             	mov    0xc(%ebp),%eax
     d19:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     d1c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     d23:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     d26:	8d 41 01             	lea    0x1(%ecx),%eax
     d29:	89 45 f8             	mov    %eax,-0x8(%ebp)
     d2c:	8b 5d 14             	mov    0x14(%ebp),%ebx
     d2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d32:	ba 00 00 00 00       	mov    $0x0,%edx
     d37:	f7 f3                	div    %ebx
     d39:	89 d0                	mov    %edx,%eax
     d3b:	0f b6 80 34 46 00 00 	movzbl 0x4634(%eax),%eax
     d42:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     d46:	8b 5d 14             	mov    0x14(%ebp),%ebx
     d49:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d4c:	ba 00 00 00 00       	mov    $0x0,%edx
     d51:	f7 f3                	div    %ebx
     d53:	89 45 f0             	mov    %eax,-0x10(%ebp)
     d56:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     d5a:	75 c7                	jne    d23 <int2str+0x38>
  if(neg)
     d5c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d60:	74 36                	je     d98 <int2str+0xad>
    buf[i++] = '-';
     d62:	8b 45 f8             	mov    -0x8(%ebp),%eax
     d65:	8d 50 01             	lea    0x1(%eax),%edx
     d68:	89 55 f8             	mov    %edx,-0x8(%ebp)
     d6b:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     d70:	eb 26                	jmp    d98 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     d72:	8b 45 10             	mov    0x10(%ebp),%eax
     d75:	8b 00                	mov    (%eax),%eax
     d77:	89 c2                	mov    %eax,%edx
     d79:	8b 45 08             	mov    0x8(%ebp),%eax
     d7c:	01 c2                	add    %eax,%edx
     d7e:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     d81:	8b 45 f8             	mov    -0x8(%ebp),%eax
     d84:	01 c8                	add    %ecx,%eax
     d86:	0f b6 00             	movzbl (%eax),%eax
     d89:	88 02                	mov    %al,(%edx)
    (*pos)++;
     d8b:	8b 45 10             	mov    0x10(%ebp),%eax
     d8e:	8b 00                	mov    (%eax),%eax
     d90:	8d 50 01             	lea    0x1(%eax),%edx
     d93:	8b 45 10             	mov    0x10(%ebp),%eax
     d96:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     d98:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     d9c:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     da0:	79 d0                	jns    d72 <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     da2:	90                   	nop
     da3:	83 c4 20             	add    $0x20,%esp
     da6:	5b                   	pop    %ebx
     da7:	5d                   	pop    %ebp
     da8:	c3                   	ret    

00000da9 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     da9:	55                   	push   %ebp
     daa:	89 e5                	mov    %esp,%ebp
     dac:	83 ec 18             	sub    $0x18,%esp
     daf:	8b 45 0c             	mov    0xc(%ebp),%eax
     db2:	89 45 e8             	mov    %eax,-0x18(%ebp)
     db5:	8b 45 10             	mov    0x10(%ebp),%eax
     db8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     dbb:	d9 ee                	fldz   
     dbd:	dd 45 e8             	fldl   -0x18(%ebp)
     dc0:	d9 c9                	fxch   %st(1)
     dc2:	df e9                	fucomip %st(1),%st
     dc4:	dd d8                	fstp   %st(0)
     dc6:	76 24                	jbe    dec <double2str+0x43>
  {
    buf[*pos] = '-';
     dc8:	8b 45 14             	mov    0x14(%ebp),%eax
     dcb:	8b 00                	mov    (%eax),%eax
     dcd:	89 c2                	mov    %eax,%edx
     dcf:	8b 45 08             	mov    0x8(%ebp),%eax
     dd2:	01 d0                	add    %edx,%eax
     dd4:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     dd7:	8b 45 14             	mov    0x14(%ebp),%eax
     dda:	8b 00                	mov    (%eax),%eax
     ddc:	8d 50 01             	lea    0x1(%eax),%edx
     ddf:	8b 45 14             	mov    0x14(%ebp),%eax
     de2:	89 10                	mov    %edx,(%eax)
    num = -num;
     de4:	dd 45 e8             	fldl   -0x18(%ebp)
     de7:	d9 e0                	fchs   
     de9:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     dec:	ff 75 ec             	pushl  -0x14(%ebp)
     def:	ff 75 e8             	pushl  -0x18(%ebp)
     df2:	e8 b9 fe ff ff       	call   cb0 <getInteger>
     df7:	83 c4 08             	add    $0x8,%esp
     dfa:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     dfd:	83 ec 04             	sub    $0x4,%esp
     e00:	6a 01                	push   $0x1
     e02:	6a 0a                	push   $0xa
     e04:	ff 75 14             	pushl  0x14(%ebp)
     e07:	ff 75 f8             	pushl  -0x8(%ebp)
     e0a:	ff 75 08             	pushl  0x8(%ebp)
     e0d:	e8 d9 fe ff ff       	call   ceb <int2str>
     e12:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     e15:	db 45 f8             	fildl  -0x8(%ebp)
     e18:	dd 45 e8             	fldl   -0x18(%ebp)
     e1b:	de e1                	fsubp  %st,%st(1)
     e1d:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     e20:	dd 45 e8             	fldl   -0x18(%ebp)
     e23:	dd 05 18 3a 00 00    	fldl   0x3a18
     e29:	d9 c9                	fxch   %st(1)
     e2b:	df e9                	fucomip %st(1),%st
     e2d:	dd d8                	fstp   %st(0)
     e2f:	76 1c                	jbe    e4d <double2str+0xa4>
  {
    buf[*pos] = '.';
     e31:	8b 45 14             	mov    0x14(%ebp),%eax
     e34:	8b 00                	mov    (%eax),%eax
     e36:	89 c2                	mov    %eax,%edx
     e38:	8b 45 08             	mov    0x8(%ebp),%eax
     e3b:	01 d0                	add    %edx,%eax
     e3d:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     e40:	8b 45 14             	mov    0x14(%ebp),%eax
     e43:	8b 00                	mov    (%eax),%eax
     e45:	8d 50 01             	lea    0x1(%eax),%edx
     e48:	8b 45 14             	mov    0x14(%ebp),%eax
     e4b:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     e4d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     e54:	eb 4c                	jmp    ea2 <double2str+0xf9>
  {
    num = num*10;
     e56:	dd 45 e8             	fldl   -0x18(%ebp)
     e59:	dd 05 20 3a 00 00    	fldl   0x3a20
     e5f:	de c9                	fmulp  %st,%st(1)
     e61:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     e64:	ff 75 ec             	pushl  -0x14(%ebp)
     e67:	ff 75 e8             	pushl  -0x18(%ebp)
     e6a:	e8 41 fe ff ff       	call   cb0 <getInteger>
     e6f:	83 c4 08             	add    $0x8,%esp
     e72:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     e75:	83 ec 04             	sub    $0x4,%esp
     e78:	6a 01                	push   $0x1
     e7a:	6a 0a                	push   $0xa
     e7c:	ff 75 14             	pushl  0x14(%ebp)
     e7f:	ff 75 f8             	pushl  -0x8(%ebp)
     e82:	ff 75 08             	pushl  0x8(%ebp)
     e85:	e8 61 fe ff ff       	call   ceb <int2str>
     e8a:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     e8d:	db 45 f8             	fildl  -0x8(%ebp)
     e90:	dd 45 e8             	fldl   -0x18(%ebp)
     e93:	de e1                	fsubp  %st,%st(1)
     e95:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     e98:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     e9c:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     ea0:	7f 13                	jg     eb5 <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     ea2:	dd 45 e8             	fldl   -0x18(%ebp)
     ea5:	dd 05 18 3a 00 00    	fldl   0x3a18
     eab:	d9 c9                	fxch   %st(1)
     ead:	df e9                	fucomip %st(1),%st
     eaf:	dd d8                	fstp   %st(0)
     eb1:	77 a3                	ja     e56 <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     eb3:	eb 01                	jmp    eb6 <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     eb5:	90                   	nop
    }
  }
}
     eb6:	90                   	nop
     eb7:	c9                   	leave  
     eb8:	c3                   	ret    

00000eb9 <pow>:

double pow(double opnd, int power)
{
     eb9:	55                   	push   %ebp
     eba:	89 e5                	mov    %esp,%ebp
     ebc:	83 ec 18             	sub    $0x18,%esp
     ebf:	8b 45 08             	mov    0x8(%ebp),%eax
     ec2:	89 45 e8             	mov    %eax,-0x18(%ebp)
     ec5:	8b 45 0c             	mov    0xc(%ebp),%eax
     ec8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     ecb:	d9 e8                	fld1   
     ecd:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     ed0:	eb 0d                	jmp    edf <pow+0x26>
  {
    result *= opnd;
     ed2:	dd 45 f8             	fldl   -0x8(%ebp)
     ed5:	dc 4d e8             	fmull  -0x18(%ebp)
     ed8:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     edb:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     edf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     ee3:	7f ed                	jg     ed2 <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     ee5:	dd 45 f8             	fldl   -0x8(%ebp)
}
     ee8:	c9                   	leave  
     ee9:	c3                   	ret    

00000eea <Translation>:

double Translation(char *s, int* pos)
{
     eea:	55                   	push   %ebp
     eeb:	89 e5                	mov    %esp,%ebp
     eed:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     ef0:	d9 ee                	fldz   
     ef2:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     ef5:	d9 ee                	fldz   
     ef7:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     efa:	eb 3e                	jmp    f3a <Translation+0x50>
    {
        integer *= 10;
     efc:	dd 45 f8             	fldl   -0x8(%ebp)
     eff:	dd 05 20 3a 00 00    	fldl   0x3a20
     f05:	de c9                	fmulp  %st,%st(1)
     f07:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     f0a:	8b 45 0c             	mov    0xc(%ebp),%eax
     f0d:	8b 00                	mov    (%eax),%eax
     f0f:	89 c2                	mov    %eax,%edx
     f11:	8b 45 08             	mov    0x8(%ebp),%eax
     f14:	01 d0                	add    %edx,%eax
     f16:	0f b6 00             	movzbl (%eax),%eax
     f19:	0f be c0             	movsbl %al,%eax
     f1c:	83 e8 30             	sub    $0x30,%eax
     f1f:	89 45 dc             	mov    %eax,-0x24(%ebp)
     f22:	db 45 dc             	fildl  -0x24(%ebp)
     f25:	dd 45 f8             	fldl   -0x8(%ebp)
     f28:	de c1                	faddp  %st,%st(1)
     f2a:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     f2d:	8b 45 0c             	mov    0xc(%ebp),%eax
     f30:	8b 00                	mov    (%eax),%eax
     f32:	8d 50 01             	lea    0x1(%eax),%edx
     f35:	8b 45 0c             	mov    0xc(%ebp),%eax
     f38:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     f3a:	8b 45 0c             	mov    0xc(%ebp),%eax
     f3d:	8b 00                	mov    (%eax),%eax
     f3f:	89 c2                	mov    %eax,%edx
     f41:	8b 45 08             	mov    0x8(%ebp),%eax
     f44:	01 d0                	add    %edx,%eax
     f46:	0f b6 00             	movzbl (%eax),%eax
     f49:	3c 2f                	cmp    $0x2f,%al
     f4b:	7e 13                	jle    f60 <Translation+0x76>
     f4d:	8b 45 0c             	mov    0xc(%ebp),%eax
     f50:	8b 00                	mov    (%eax),%eax
     f52:	89 c2                	mov    %eax,%edx
     f54:	8b 45 08             	mov    0x8(%ebp),%eax
     f57:	01 d0                	add    %edx,%eax
     f59:	0f b6 00             	movzbl (%eax),%eax
     f5c:	3c 39                	cmp    $0x39,%al
     f5e:	7e 9c                	jle    efc <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     f60:	8b 45 0c             	mov    0xc(%ebp),%eax
     f63:	8b 00                	mov    (%eax),%eax
     f65:	89 c2                	mov    %eax,%edx
     f67:	8b 45 08             	mov    0x8(%ebp),%eax
     f6a:	01 d0                	add    %edx,%eax
     f6c:	0f b6 00             	movzbl (%eax),%eax
     f6f:	3c 2e                	cmp    $0x2e,%al
     f71:	0f 85 9b 00 00 00    	jne    1012 <Translation+0x128>
    {
        (*pos)++;
     f77:	8b 45 0c             	mov    0xc(%ebp),%eax
     f7a:	8b 00                	mov    (%eax),%eax
     f7c:	8d 50 01             	lea    0x1(%eax),%edx
     f7f:	8b 45 0c             	mov    0xc(%ebp),%eax
     f82:	89 10                	mov    %edx,(%eax)
        int c = 1;
     f84:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     f8b:	eb 5b                	jmp    fe8 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     f8d:	8b 45 0c             	mov    0xc(%ebp),%eax
     f90:	8b 00                	mov    (%eax),%eax
     f92:	89 c2                	mov    %eax,%edx
     f94:	8b 45 08             	mov    0x8(%ebp),%eax
     f97:	01 d0                	add    %edx,%eax
     f99:	0f b6 00             	movzbl (%eax),%eax
     f9c:	0f be c0             	movsbl %al,%eax
     f9f:	83 e8 30             	sub    $0x30,%eax
     fa2:	89 45 dc             	mov    %eax,-0x24(%ebp)
     fa5:	db 45 dc             	fildl  -0x24(%ebp)
     fa8:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     fab:	83 ec 04             	sub    $0x4,%esp
     fae:	ff 75 ec             	pushl  -0x14(%ebp)
     fb1:	dd 05 28 3a 00 00    	fldl   0x3a28
     fb7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     fbb:	dd 1c 24             	fstpl  (%esp)
     fbe:	e8 f6 fe ff ff       	call   eb9 <pow>
     fc3:	83 c4 10             	add    $0x10,%esp
     fc6:	dd 45 e0             	fldl   -0x20(%ebp)
     fc9:	de c9                	fmulp  %st,%st(1)
     fcb:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     fce:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     fd2:	dd 45 f0             	fldl   -0x10(%ebp)
     fd5:	dc 45 e0             	faddl  -0x20(%ebp)
     fd8:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     fdb:	8b 45 0c             	mov    0xc(%ebp),%eax
     fde:	8b 00                	mov    (%eax),%eax
     fe0:	8d 50 01             	lea    0x1(%eax),%edx
     fe3:	8b 45 0c             	mov    0xc(%ebp),%eax
     fe6:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     fe8:	8b 45 0c             	mov    0xc(%ebp),%eax
     feb:	8b 00                	mov    (%eax),%eax
     fed:	89 c2                	mov    %eax,%edx
     fef:	8b 45 08             	mov    0x8(%ebp),%eax
     ff2:	01 d0                	add    %edx,%eax
     ff4:	0f b6 00             	movzbl (%eax),%eax
     ff7:	3c 2f                	cmp    $0x2f,%al
     ff9:	7e 17                	jle    1012 <Translation+0x128>
     ffb:	8b 45 0c             	mov    0xc(%ebp),%eax
     ffe:	8b 00                	mov    (%eax),%eax
    1000:	89 c2                	mov    %eax,%edx
    1002:	8b 45 08             	mov    0x8(%ebp),%eax
    1005:	01 d0                	add    %edx,%eax
    1007:	0f b6 00             	movzbl (%eax),%eax
    100a:	3c 39                	cmp    $0x39,%al
    100c:	0f 8e 7b ff ff ff    	jle    f8d <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
    1012:	dd 45 f8             	fldl   -0x8(%ebp)
    1015:	dc 45 f0             	faddl  -0x10(%ebp)
    1018:	c9                   	leave  
    1019:	c3                   	ret    

0000101a <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
    101a:	55                   	push   %ebp
    101b:	89 e5                	mov    %esp,%ebp
    101d:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
    1020:	e8 d2 f5 ff ff       	call   5f7 <fork>
    1025:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
    1028:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    102b:	c9                   	leave  
    102c:	c3                   	ret    

0000102d <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
    102d:	55                   	push   %ebp
    102e:	89 e5                	mov    %esp,%ebp
    1030:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1033:	83 ec 0c             	sub    $0xc,%esp
    1036:	6a 54                	push   $0x54
    1038:	e8 70 fb ff ff       	call   bad <malloc>
    103d:	83 c4 10             	add    $0x10,%esp
    1040:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1043:	83 ec 04             	sub    $0x4,%esp
    1046:	6a 54                	push   $0x54
    1048:	6a 00                	push   $0x0
    104a:	ff 75 f4             	pushl  -0xc(%ebp)
    104d:	e8 12 f4 ff ff       	call   464 <memset>
    1052:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
    1055:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1058:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
    105e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1061:	c9                   	leave  
    1062:	c3                   	ret    

00001063 <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    1063:	55                   	push   %ebp
    1064:	89 e5                	mov    %esp,%ebp
    1066:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1069:	83 ec 0c             	sub    $0xc,%esp
    106c:	6a 18                	push   $0x18
    106e:	e8 3a fb ff ff       	call   bad <malloc>
    1073:	83 c4 10             	add    $0x10,%esp
    1076:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1079:	83 ec 04             	sub    $0x4,%esp
    107c:	6a 18                	push   $0x18
    107e:	6a 00                	push   $0x0
    1080:	ff 75 f4             	pushl  -0xc(%ebp)
    1083:	e8 dc f3 ff ff       	call   464 <memset>
    1088:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
    108b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    108e:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
    1094:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1097:	8b 55 08             	mov    0x8(%ebp),%edx
    109a:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
    109d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10a0:	8b 55 0c             	mov    0xc(%ebp),%edx
    10a3:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
    10a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10a9:	8b 55 10             	mov    0x10(%ebp),%edx
    10ac:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
    10af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10b2:	8b 55 14             	mov    0x14(%ebp),%edx
    10b5:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
    10b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10bb:	8b 55 18             	mov    0x18(%ebp),%edx
    10be:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
    10c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    10c4:	c9                   	leave  
    10c5:	c3                   	ret    

000010c6 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
    10c6:	55                   	push   %ebp
    10c7:	89 e5                	mov    %esp,%ebp
    10c9:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    10cc:	83 ec 0c             	sub    $0xc,%esp
    10cf:	6a 0c                	push   $0xc
    10d1:	e8 d7 fa ff ff       	call   bad <malloc>
    10d6:	83 c4 10             	add    $0x10,%esp
    10d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    10dc:	83 ec 04             	sub    $0x4,%esp
    10df:	6a 0c                	push   $0xc
    10e1:	6a 00                	push   $0x0
    10e3:	ff 75 f4             	pushl  -0xc(%ebp)
    10e6:	e8 79 f3 ff ff       	call   464 <memset>
    10eb:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
    10ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10f1:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
    10f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10fa:	8b 55 08             	mov    0x8(%ebp),%edx
    10fd:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    1100:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1103:	8b 55 0c             	mov    0xc(%ebp),%edx
    1106:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    1109:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    110c:	c9                   	leave  
    110d:	c3                   	ret    

0000110e <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
    110e:	55                   	push   %ebp
    110f:	89 e5                	mov    %esp,%ebp
    1111:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1114:	83 ec 0c             	sub    $0xc,%esp
    1117:	6a 0c                	push   $0xc
    1119:	e8 8f fa ff ff       	call   bad <malloc>
    111e:	83 c4 10             	add    $0x10,%esp
    1121:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1124:	83 ec 04             	sub    $0x4,%esp
    1127:	6a 0c                	push   $0xc
    1129:	6a 00                	push   $0x0
    112b:	ff 75 f4             	pushl  -0xc(%ebp)
    112e:	e8 31 f3 ff ff       	call   464 <memset>
    1133:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
    1136:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1139:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
    113f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1142:	8b 55 08             	mov    0x8(%ebp),%edx
    1145:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    1148:	8b 45 f4             	mov    -0xc(%ebp),%eax
    114b:	8b 55 0c             	mov    0xc(%ebp),%edx
    114e:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    1151:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1154:	c9                   	leave  
    1155:	c3                   	ret    

00001156 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
    1156:	55                   	push   %ebp
    1157:	89 e5                	mov    %esp,%ebp
    1159:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    115c:	83 ec 0c             	sub    $0xc,%esp
    115f:	6a 08                	push   $0x8
    1161:	e8 47 fa ff ff       	call   bad <malloc>
    1166:	83 c4 10             	add    $0x10,%esp
    1169:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    116c:	83 ec 04             	sub    $0x4,%esp
    116f:	6a 08                	push   $0x8
    1171:	6a 00                	push   $0x0
    1173:	ff 75 f4             	pushl  -0xc(%ebp)
    1176:	e8 e9 f2 ff ff       	call   464 <memset>
    117b:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
    117e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1181:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
    1187:	8b 45 f4             	mov    -0xc(%ebp),%eax
    118a:	8b 55 08             	mov    0x8(%ebp),%edx
    118d:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    1190:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1193:	c9                   	leave  
    1194:	c3                   	ret    

00001195 <calcmd>:

struct cmd* calcmd(char *_line)
{
    1195:	55                   	push   %ebp
    1196:	89 e5                	mov    %esp,%ebp
    1198:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    119b:	83 ec 0c             	sub    $0xc,%esp
    119e:	6a 08                	push   $0x8
    11a0:	e8 08 fa ff ff       	call   bad <malloc>
    11a5:	83 c4 10             	add    $0x10,%esp
    11a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    11ab:	83 ec 04             	sub    $0x4,%esp
    11ae:	6a 08                	push   $0x8
    11b0:	6a 00                	push   $0x0
    11b2:	ff 75 f4             	pushl  -0xc(%ebp)
    11b5:	e8 aa f2 ff ff       	call   464 <memset>
    11ba:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
    11bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11c0:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
    11c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11c9:	8b 55 08             	mov    0x8(%ebp),%edx
    11cc:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    11cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    11d2:	c9                   	leave  
    11d3:	c3                   	ret    

000011d4 <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
    11d4:	55                   	push   %ebp
    11d5:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
    11d7:	eb 0c                	jmp    11e5 <mystrncmp+0x11>
    n--, p++, q++;
    11d9:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    11dd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    11e1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    11e5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    11e9:	74 1a                	je     1205 <mystrncmp+0x31>
    11eb:	8b 45 08             	mov    0x8(%ebp),%eax
    11ee:	0f b6 00             	movzbl (%eax),%eax
    11f1:	84 c0                	test   %al,%al
    11f3:	74 10                	je     1205 <mystrncmp+0x31>
    11f5:	8b 45 08             	mov    0x8(%ebp),%eax
    11f8:	0f b6 10             	movzbl (%eax),%edx
    11fb:	8b 45 0c             	mov    0xc(%ebp),%eax
    11fe:	0f b6 00             	movzbl (%eax),%eax
    1201:	38 c2                	cmp    %al,%dl
    1203:	74 d4                	je     11d9 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
    1205:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1209:	75 07                	jne    1212 <mystrncmp+0x3e>
    return 0;
    120b:	b8 00 00 00 00       	mov    $0x0,%eax
    1210:	eb 16                	jmp    1228 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
    1212:	8b 45 08             	mov    0x8(%ebp),%eax
    1215:	0f b6 00             	movzbl (%eax),%eax
    1218:	0f b6 d0             	movzbl %al,%edx
    121b:	8b 45 0c             	mov    0xc(%ebp),%eax
    121e:	0f b6 00             	movzbl (%eax),%eax
    1221:	0f b6 c0             	movzbl %al,%eax
    1224:	29 c2                	sub    %eax,%edx
    1226:	89 d0                	mov    %edx,%eax
}
    1228:	5d                   	pop    %ebp
    1229:	c3                   	ret    

0000122a <mystrlen>:

static int mystrlen(const char *s)
{
    122a:	55                   	push   %ebp
    122b:	89 e5                	mov    %esp,%ebp
    122d:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
    1230:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1237:	eb 04                	jmp    123d <mystrlen+0x13>
    1239:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    123d:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1240:	8b 45 08             	mov    0x8(%ebp),%eax
    1243:	01 d0                	add    %edx,%eax
    1245:	0f b6 00             	movzbl (%eax),%eax
    1248:	84 c0                	test   %al,%al
    124a:	75 ed                	jne    1239 <mystrlen+0xf>
    ;
  return n;
    124c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    124f:	c9                   	leave  
    1250:	c3                   	ret    

00001251 <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
    1251:	55                   	push   %ebp
    1252:	89 e5                	mov    %esp,%ebp
    1254:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
    1257:	8b 45 08             	mov    0x8(%ebp),%eax
    125a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
    125d:	90                   	nop
    125e:	8b 45 10             	mov    0x10(%ebp),%eax
    1261:	8d 50 ff             	lea    -0x1(%eax),%edx
    1264:	89 55 10             	mov    %edx,0x10(%ebp)
    1267:	85 c0                	test   %eax,%eax
    1269:	7e 2c                	jle    1297 <mystrncpy+0x46>
    126b:	8b 45 08             	mov    0x8(%ebp),%eax
    126e:	8d 50 01             	lea    0x1(%eax),%edx
    1271:	89 55 08             	mov    %edx,0x8(%ebp)
    1274:	8b 55 0c             	mov    0xc(%ebp),%edx
    1277:	8d 4a 01             	lea    0x1(%edx),%ecx
    127a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    127d:	0f b6 12             	movzbl (%edx),%edx
    1280:	88 10                	mov    %dl,(%eax)
    1282:	0f b6 00             	movzbl (%eax),%eax
    1285:	84 c0                	test   %al,%al
    1287:	75 d5                	jne    125e <mystrncpy+0xd>
    ;
  while(n-- > 0)
    1289:	eb 0c                	jmp    1297 <mystrncpy+0x46>
    *s++ = 0;
    128b:	8b 45 08             	mov    0x8(%ebp),%eax
    128e:	8d 50 01             	lea    0x1(%eax),%edx
    1291:	89 55 08             	mov    %edx,0x8(%ebp)
    1294:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    1297:	8b 45 10             	mov    0x10(%ebp),%eax
    129a:	8d 50 ff             	lea    -0x1(%eax),%edx
    129d:	89 55 10             	mov    %edx,0x10(%ebp)
    12a0:	85 c0                	test   %eax,%eax
    12a2:	7f e7                	jg     128b <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    12a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    12a7:	c9                   	leave  
    12a8:	c3                   	ret    

000012a9 <isEqual>:

int isEqual(double a, double b)
{
    12a9:	55                   	push   %ebp
    12aa:	89 e5                	mov    %esp,%ebp
    12ac:	83 ec 10             	sub    $0x10,%esp
    12af:	8b 45 08             	mov    0x8(%ebp),%eax
    12b2:	89 45 f8             	mov    %eax,-0x8(%ebp)
    12b5:	8b 45 0c             	mov    0xc(%ebp),%eax
    12b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12bb:	8b 45 10             	mov    0x10(%ebp),%eax
    12be:	89 45 f0             	mov    %eax,-0x10(%ebp)
    12c1:	8b 45 14             	mov    0x14(%ebp),%eax
    12c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    12c7:	dd 45 f8             	fldl   -0x8(%ebp)
    12ca:	dc 65 f0             	fsubl  -0x10(%ebp)
    12cd:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    12d3:	df e9                	fucomip %st(1),%st
    12d5:	dd d8                	fstp   %st(0)
    12d7:	76 19                	jbe    12f2 <isEqual+0x49>
    12d9:	dd 45 f0             	fldl   -0x10(%ebp)
    12dc:	dc 65 f8             	fsubl  -0x8(%ebp)
    12df:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    12e5:	df e9                	fucomip %st(1),%st
    12e7:	dd d8                	fstp   %st(0)
    12e9:	76 07                	jbe    12f2 <isEqual+0x49>
    return 1;
    12eb:	b8 01 00 00 00       	mov    $0x1,%eax
    12f0:	eb 05                	jmp    12f7 <isEqual+0x4e>
  return 0;
    12f2:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12f7:	c9                   	leave  
    12f8:	c3                   	ret    

000012f9 <isCmdName>:

int isCmdName(const char* str)
{
    12f9:	55                   	push   %ebp
    12fa:	89 e5                	mov    %esp,%ebp
    12fc:	53                   	push   %ebx
    12fd:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    1300:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1307:	eb 71                	jmp    137a <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1309:	8b 55 f4             	mov    -0xc(%ebp),%edx
    130c:	89 d0                	mov    %edx,%eax
    130e:	c1 e0 02             	shl    $0x2,%eax
    1311:	01 d0                	add    %edx,%eax
    1313:	01 c0                	add    %eax,%eax
    1315:	05 60 46 00 00       	add    $0x4660,%eax
    131a:	83 ec 0c             	sub    $0xc,%esp
    131d:	50                   	push   %eax
    131e:	e8 1a f1 ff ff       	call   43d <strlen>
    1323:	83 c4 10             	add    $0x10,%esp
    1326:	89 c3                	mov    %eax,%ebx
    1328:	83 ec 0c             	sub    $0xc,%esp
    132b:	ff 75 08             	pushl  0x8(%ebp)
    132e:	e8 f7 fe ff ff       	call   122a <mystrlen>
    1333:	83 c4 10             	add    $0x10,%esp
    1336:	39 c3                	cmp    %eax,%ebx
    1338:	75 3c                	jne    1376 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    133a:	83 ec 0c             	sub    $0xc,%esp
    133d:	ff 75 08             	pushl  0x8(%ebp)
    1340:	e8 e5 fe ff ff       	call   122a <mystrlen>
    1345:	83 c4 10             	add    $0x10,%esp
    1348:	89 c1                	mov    %eax,%ecx
    134a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    134d:	89 d0                	mov    %edx,%eax
    134f:	c1 e0 02             	shl    $0x2,%eax
    1352:	01 d0                	add    %edx,%eax
    1354:	01 c0                	add    %eax,%eax
    1356:	05 60 46 00 00       	add    $0x4660,%eax
    135b:	83 ec 04             	sub    $0x4,%esp
    135e:	51                   	push   %ecx
    135f:	ff 75 08             	pushl  0x8(%ebp)
    1362:	50                   	push   %eax
    1363:	e8 6c fe ff ff       	call   11d4 <mystrncmp>
    1368:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    136b:	85 c0                	test   %eax,%eax
    136d:	75 07                	jne    1376 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    136f:	b8 01 00 00 00       	mov    $0x1,%eax
    1374:	eb 0f                	jmp    1385 <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    1376:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    137a:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    137e:	7e 89                	jle    1309 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    1380:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1385:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1388:	c9                   	leave  
    1389:	c3                   	ret    

0000138a <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    138a:	55                   	push   %ebp
    138b:	89 e5                	mov    %esp,%ebp
    138d:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    1393:	83 ec 08             	sub    $0x8,%esp
    1396:	6a 00                	push   $0x0
    1398:	68 28 47 00 00       	push   $0x4728
    139d:	e8 9d f2 ff ff       	call   63f <open>
    13a2:	83 c4 10             	add    $0x10,%esp
    13a5:	89 45 dc             	mov    %eax,-0x24(%ebp)
    13a8:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    13ac:	79 0a                	jns    13b8 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    13ae:	b8 00 00 00 00       	mov    $0x0,%eax
    13b3:	e9 9a 01 00 00       	jmp    1552 <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    13b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    13bf:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    13c6:	e9 ee 00 00 00       	jmp    14b9 <findAlias+0x12f>
  {
      int isSame = 1;
    13cb:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    13d2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    13d9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    13e0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    13e7:	83 ec 0c             	sub    $0xc,%esp
    13ea:	8d 45 9a             	lea    -0x66(%ebp),%eax
    13ed:	50                   	push   %eax
    13ee:	e8 4a f0 ff ff       	call   43d <strlen>
    13f3:	83 c4 10             	add    $0x10,%esp
    13f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    13f9:	83 ec 0c             	sub    $0xc,%esp
    13fc:	ff 75 08             	pushl  0x8(%ebp)
    13ff:	e8 39 f0 ff ff       	call   43d <strlen>
    1404:	83 c4 10             	add    $0x10,%esp
    1407:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    140a:	8d 55 9a             	lea    -0x66(%ebp),%edx
    140d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1410:	01 d0                	add    %edx,%eax
    1412:	0f b6 00             	movzbl (%eax),%eax
    1415:	3c 21                	cmp    $0x21,%al
    1417:	75 38                	jne    1451 <findAlias+0xc7>
      {
          startIndex++;
    1419:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    141d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    1424:	eb 2b                	jmp    1451 <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    1426:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1429:	8b 45 e8             	mov    -0x18(%ebp),%eax
    142c:	01 d0                	add    %edx,%eax
    142e:	0f b6 10             	movzbl (%eax),%edx
    1431:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    1434:	8b 45 08             	mov    0x8(%ebp),%eax
    1437:	01 c8                	add    %ecx,%eax
    1439:	0f b6 00             	movzbl (%eax),%eax
    143c:	38 c2                	cmp    %al,%dl
    143e:	74 09                	je     1449 <findAlias+0xbf>
          {
              isSame = 0;
    1440:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    1447:	eb 1f                	jmp    1468 <findAlias+0xde>
          }
          startIndex++;
    1449:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    144d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    1451:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1454:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1457:	01 d0                	add    %edx,%eax
    1459:	0f b6 00             	movzbl (%eax),%eax
    145c:	3c 3d                	cmp    $0x3d,%al
    145e:	74 08                	je     1468 <findAlias+0xde>
    1460:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1463:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1466:	7c be                	jl     1426 <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    1468:	8d 55 9a             	lea    -0x66(%ebp),%edx
    146b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    146e:	01 d0                	add    %edx,%eax
    1470:	0f b6 00             	movzbl (%eax),%eax
    1473:	3c 3d                	cmp    $0x3d,%al
    1475:	75 08                	jne    147f <findAlias+0xf5>
    1477:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    147a:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    147d:	7d 07                	jge    1486 <findAlias+0xfc>
      {
          isSame = 0;
    147f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    1486:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    148a:	75 0b                	jne    1497 <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    148c:	b8 01 00 00 00       	mov    $0x1,%eax
    1491:	2b 45 f0             	sub    -0x10(%ebp),%eax
    1494:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    1497:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    149b:	75 1c                	jne    14b9 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    149d:	83 ec 08             	sub    $0x8,%esp
    14a0:	8d 45 9a             	lea    -0x66(%ebp),%eax
    14a3:	50                   	push   %eax
    14a4:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    14aa:	50                   	push   %eax
    14ab:	e8 1e ef ff ff       	call   3ce <strcpy>
    14b0:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    14b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    14b9:	83 ec 04             	sub    $0x4,%esp
    14bc:	6a 32                	push   $0x32
    14be:	8d 45 9a             	lea    -0x66(%ebp),%eax
    14c1:	50                   	push   %eax
    14c2:	ff 75 dc             	pushl  -0x24(%ebp)
    14c5:	e8 4d f1 ff ff       	call   617 <read>
    14ca:	83 c4 10             	add    $0x10,%esp
    14cd:	89 45 d8             	mov    %eax,-0x28(%ebp)
    14d0:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    14d4:	0f 8f f1 fe ff ff    	jg     13cb <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    14da:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14de:	75 5f                	jne    153f <findAlias+0x1b5>
  {
    int i = 0;
    14e0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    14e7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    14eb:	eb 20                	jmp    150d <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    14ed:	8b 55 e0             	mov    -0x20(%ebp),%edx
    14f0:	8b 45 0c             	mov    0xc(%ebp),%eax
    14f3:	01 c2                	add    %eax,%edx
    14f5:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    14fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14fe:	01 c8                	add    %ecx,%eax
    1500:	0f b6 00             	movzbl (%eax),%eax
    1503:	88 02                	mov    %al,(%edx)
      i++;
    1505:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    1509:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    150d:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    1513:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1516:	01 d0                	add    %edx,%eax
    1518:	0f b6 00             	movzbl (%eax),%eax
    151b:	84 c0                	test   %al,%al
    151d:	75 ce                	jne    14ed <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    151f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1522:	8b 45 0c             	mov    0xc(%ebp),%eax
    1525:	01 d0                	add    %edx,%eax
    1527:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    152a:	83 ec 0c             	sub    $0xc,%esp
    152d:	ff 75 dc             	pushl  -0x24(%ebp)
    1530:	e8 f2 f0 ff ff       	call   627 <close>
    1535:	83 c4 10             	add    $0x10,%esp
    return 1;
    1538:	b8 01 00 00 00       	mov    $0x1,%eax
    153d:	eb 13                	jmp    1552 <findAlias+0x1c8>
  }
  close(fd);
    153f:	83 ec 0c             	sub    $0xc,%esp
    1542:	ff 75 dc             	pushl  -0x24(%ebp)
    1545:	e8 dd f0 ff ff       	call   627 <close>
    154a:	83 c4 10             	add    $0x10,%esp
  return 0;
    154d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1552:	c9                   	leave  
    1553:	c3                   	ret    

00001554 <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    1554:	55                   	push   %ebp
    1555:	89 e5                	mov    %esp,%ebp
    1557:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    155a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    155e:	75 05                	jne    1565 <runcmd+0x11>
    exit();
    1560:	e8 9a f0 ff ff       	call   5ff <exit>
  
  switch(cmd->type){
    1565:	8b 45 08             	mov    0x8(%ebp),%eax
    1568:	8b 00                	mov    (%eax),%eax
    156a:	83 f8 05             	cmp    $0x5,%eax
    156d:	77 09                	ja     1578 <runcmd+0x24>
    156f:	8b 04 85 5c 3a 00 00 	mov    0x3a5c(,%eax,4),%eax
    1576:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    1578:	83 ec 0c             	sub    $0xc,%esp
    157b:	68 30 3a 00 00       	push   $0x3a30
    1580:	e8 0b f7 ff ff       	call   c90 <panic1>
    1585:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    1588:	8b 45 08             	mov    0x8(%ebp),%eax
    158b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    158e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1591:	8b 40 04             	mov    0x4(%eax),%eax
    1594:	85 c0                	test   %eax,%eax
    1596:	75 05                	jne    159d <runcmd+0x49>
      exit();
    1598:	e8 62 f0 ff ff       	call   5ff <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    159d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a0:	8b 40 04             	mov    0x4(%eax),%eax
    15a3:	83 ec 0c             	sub    $0xc,%esp
    15a6:	50                   	push   %eax
    15a7:	e8 4d fd ff ff       	call   12f9 <isCmdName>
    15ac:	83 c4 10             	add    $0x10,%esp
    15af:	85 c0                	test   %eax,%eax
    15b1:	75 37                	jne    15ea <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    15b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15b6:	8b 40 04             	mov    0x4(%eax),%eax
    15b9:	83 ec 08             	sub    $0x8,%esp
    15bc:	8d 55 ce             	lea    -0x32(%ebp),%edx
    15bf:	52                   	push   %edx
    15c0:	50                   	push   %eax
    15c1:	e8 c4 fd ff ff       	call   138a <findAlias>
    15c6:	83 c4 10             	add    $0x10,%esp
    15c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    15cc:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    15d0:	75 31                	jne    1603 <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    15d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15d5:	83 c0 04             	add    $0x4,%eax
    15d8:	83 ec 08             	sub    $0x8,%esp
    15db:	50                   	push   %eax
    15dc:	8d 45 ce             	lea    -0x32(%ebp),%eax
    15df:	50                   	push   %eax
    15e0:	e8 52 f0 ff ff       	call   637 <exec>
    15e5:	83 c4 10             	add    $0x10,%esp
    15e8:	eb 19                	jmp    1603 <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    15ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15ed:	8d 50 04             	lea    0x4(%eax),%edx
    15f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15f3:	8b 40 04             	mov    0x4(%eax),%eax
    15f6:	83 ec 08             	sub    $0x8,%esp
    15f9:	52                   	push   %edx
    15fa:	50                   	push   %eax
    15fb:	e8 37 f0 ff ff       	call   637 <exec>
    1600:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    1603:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1606:	8b 40 04             	mov    0x4(%eax),%eax
    1609:	83 ec 04             	sub    $0x4,%esp
    160c:	50                   	push   %eax
    160d:	68 37 3a 00 00       	push   $0x3a37
    1612:	6a 02                	push   $0x2
    1614:	e8 92 f2 ff ff       	call   8ab <printf>
    1619:	83 c4 10             	add    $0x10,%esp
    break;
    161c:	e9 c6 01 00 00       	jmp    17e7 <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    1621:	8b 45 08             	mov    0x8(%ebp),%eax
    1624:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    1627:	8b 45 ec             	mov    -0x14(%ebp),%eax
    162a:	8b 40 14             	mov    0x14(%eax),%eax
    162d:	83 ec 0c             	sub    $0xc,%esp
    1630:	50                   	push   %eax
    1631:	e8 f1 ef ff ff       	call   627 <close>
    1636:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    1639:	8b 45 ec             	mov    -0x14(%ebp),%eax
    163c:	8b 50 10             	mov    0x10(%eax),%edx
    163f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1642:	8b 40 08             	mov    0x8(%eax),%eax
    1645:	83 ec 08             	sub    $0x8,%esp
    1648:	52                   	push   %edx
    1649:	50                   	push   %eax
    164a:	e8 f0 ef ff ff       	call   63f <open>
    164f:	83 c4 10             	add    $0x10,%esp
    1652:	85 c0                	test   %eax,%eax
    1654:	79 1e                	jns    1674 <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    1656:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1659:	8b 40 08             	mov    0x8(%eax),%eax
    165c:	83 ec 04             	sub    $0x4,%esp
    165f:	50                   	push   %eax
    1660:	68 47 3a 00 00       	push   $0x3a47
    1665:	6a 02                	push   $0x2
    1667:	e8 3f f2 ff ff       	call   8ab <printf>
    166c:	83 c4 10             	add    $0x10,%esp
      exit();
    166f:	e8 8b ef ff ff       	call   5ff <exit>
    }
    runcmd(rcmd->cmd);
    1674:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1677:	8b 40 04             	mov    0x4(%eax),%eax
    167a:	83 ec 0c             	sub    $0xc,%esp
    167d:	50                   	push   %eax
    167e:	e8 d1 fe ff ff       	call   1554 <runcmd>
    1683:	83 c4 10             	add    $0x10,%esp
    break;
    1686:	e9 5c 01 00 00       	jmp    17e7 <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    168b:	8b 45 08             	mov    0x8(%ebp),%eax
    168e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    1691:	e8 84 f9 ff ff       	call   101a <fork1>
    1696:	85 c0                	test   %eax,%eax
    1698:	75 12                	jne    16ac <runcmd+0x158>
      runcmd(lcmd->left);
    169a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    169d:	8b 40 04             	mov    0x4(%eax),%eax
    16a0:	83 ec 0c             	sub    $0xc,%esp
    16a3:	50                   	push   %eax
    16a4:	e8 ab fe ff ff       	call   1554 <runcmd>
    16a9:	83 c4 10             	add    $0x10,%esp
    wait();
    16ac:	e8 56 ef ff ff       	call   607 <wait>
    runcmd(lcmd->right);
    16b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16b4:	8b 40 08             	mov    0x8(%eax),%eax
    16b7:	83 ec 0c             	sub    $0xc,%esp
    16ba:	50                   	push   %eax
    16bb:	e8 94 fe ff ff       	call   1554 <runcmd>
    16c0:	83 c4 10             	add    $0x10,%esp
    break;
    16c3:	e9 1f 01 00 00       	jmp    17e7 <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    16c8:	8b 45 08             	mov    0x8(%ebp),%eax
    16cb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    16ce:	83 ec 0c             	sub    $0xc,%esp
    16d1:	8d 45 d8             	lea    -0x28(%ebp),%eax
    16d4:	50                   	push   %eax
    16d5:	e8 35 ef ff ff       	call   60f <pipe>
    16da:	83 c4 10             	add    $0x10,%esp
    16dd:	85 c0                	test   %eax,%eax
    16df:	79 10                	jns    16f1 <runcmd+0x19d>
      panic1("pipe");
    16e1:	83 ec 0c             	sub    $0xc,%esp
    16e4:	68 57 3a 00 00       	push   $0x3a57
    16e9:	e8 a2 f5 ff ff       	call   c90 <panic1>
    16ee:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    16f1:	e8 24 f9 ff ff       	call   101a <fork1>
    16f6:	85 c0                	test   %eax,%eax
    16f8:	75 4c                	jne    1746 <runcmd+0x1f2>
      close(1);
    16fa:	83 ec 0c             	sub    $0xc,%esp
    16fd:	6a 01                	push   $0x1
    16ff:	e8 23 ef ff ff       	call   627 <close>
    1704:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    1707:	8b 45 dc             	mov    -0x24(%ebp),%eax
    170a:	83 ec 0c             	sub    $0xc,%esp
    170d:	50                   	push   %eax
    170e:	e8 64 ef ff ff       	call   677 <dup>
    1713:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1716:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1719:	83 ec 0c             	sub    $0xc,%esp
    171c:	50                   	push   %eax
    171d:	e8 05 ef ff ff       	call   627 <close>
    1722:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    1725:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1728:	83 ec 0c             	sub    $0xc,%esp
    172b:	50                   	push   %eax
    172c:	e8 f6 ee ff ff       	call   627 <close>
    1731:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    1734:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1737:	8b 40 04             	mov    0x4(%eax),%eax
    173a:	83 ec 0c             	sub    $0xc,%esp
    173d:	50                   	push   %eax
    173e:	e8 11 fe ff ff       	call   1554 <runcmd>
    1743:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    1746:	e8 cf f8 ff ff       	call   101a <fork1>
    174b:	85 c0                	test   %eax,%eax
    174d:	75 4c                	jne    179b <runcmd+0x247>
      close(0);
    174f:	83 ec 0c             	sub    $0xc,%esp
    1752:	6a 00                	push   $0x0
    1754:	e8 ce ee ff ff       	call   627 <close>
    1759:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    175c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    175f:	83 ec 0c             	sub    $0xc,%esp
    1762:	50                   	push   %eax
    1763:	e8 0f ef ff ff       	call   677 <dup>
    1768:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    176b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    176e:	83 ec 0c             	sub    $0xc,%esp
    1771:	50                   	push   %eax
    1772:	e8 b0 ee ff ff       	call   627 <close>
    1777:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    177a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    177d:	83 ec 0c             	sub    $0xc,%esp
    1780:	50                   	push   %eax
    1781:	e8 a1 ee ff ff       	call   627 <close>
    1786:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    1789:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    178c:	8b 40 08             	mov    0x8(%eax),%eax
    178f:	83 ec 0c             	sub    $0xc,%esp
    1792:	50                   	push   %eax
    1793:	e8 bc fd ff ff       	call   1554 <runcmd>
    1798:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    179b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    179e:	83 ec 0c             	sub    $0xc,%esp
    17a1:	50                   	push   %eax
    17a2:	e8 80 ee ff ff       	call   627 <close>
    17a7:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    17aa:	8b 45 dc             	mov    -0x24(%ebp),%eax
    17ad:	83 ec 0c             	sub    $0xc,%esp
    17b0:	50                   	push   %eax
    17b1:	e8 71 ee ff ff       	call   627 <close>
    17b6:	83 c4 10             	add    $0x10,%esp
    wait();
    17b9:	e8 49 ee ff ff       	call   607 <wait>
    wait();
    17be:	e8 44 ee ff ff       	call   607 <wait>
    break;
    17c3:	eb 22                	jmp    17e7 <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    17c5:	8b 45 08             	mov    0x8(%ebp),%eax
    17c8:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    17cb:	e8 4a f8 ff ff       	call   101a <fork1>
    17d0:	85 c0                	test   %eax,%eax
    17d2:	75 12                	jne    17e6 <runcmd+0x292>
      runcmd(bcmd->cmd);
    17d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    17d7:	8b 40 04             	mov    0x4(%eax),%eax
    17da:	83 ec 0c             	sub    $0xc,%esp
    17dd:	50                   	push   %eax
    17de:	e8 71 fd ff ff       	call   1554 <runcmd>
    17e3:	83 c4 10             	add    $0x10,%esp
    break;
    17e6:	90                   	nop
  }
  exit();
    17e7:	e8 13 ee ff ff       	call   5ff <exit>

000017ec <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    17ec:	55                   	push   %ebp
    17ed:	89 e5                	mov    %esp,%ebp
    17ef:	83 ec 04             	sub    $0x4,%esp
    17f2:	8b 45 08             	mov    0x8(%ebp),%eax
    17f5:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    17f8:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    17fc:	7e 0d                	jle    180b <isNameChar+0x1f>
    17fe:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    1802:	7f 07                	jg     180b <isNameChar+0x1f>
    return 1;
    1804:	b8 01 00 00 00       	mov    $0x1,%eax
    1809:	eb 38                	jmp    1843 <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    180b:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    180f:	7e 0d                	jle    181e <isNameChar+0x32>
    1811:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    1815:	7f 07                	jg     181e <isNameChar+0x32>
    return 1;
    1817:	b8 01 00 00 00       	mov    $0x1,%eax
    181c:	eb 25                	jmp    1843 <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    181e:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    1822:	7e 0d                	jle    1831 <isNameChar+0x45>
    1824:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    1828:	7f 07                	jg     1831 <isNameChar+0x45>
    return 1;
    182a:	b8 01 00 00 00       	mov    $0x1,%eax
    182f:	eb 12                	jmp    1843 <isNameChar+0x57>
  if(ch == '_')
    1831:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    1835:	75 07                	jne    183e <isNameChar+0x52>
    return 1;
    1837:	b8 01 00 00 00       	mov    $0x1,%eax
    183c:	eb 05                	jmp    1843 <isNameChar+0x57>
  return 0;
    183e:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1843:	c9                   	leave  
    1844:	c3                   	ret    

00001845 <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    1845:	55                   	push   %ebp
    1846:	89 e5                	mov    %esp,%ebp
    1848:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    184b:	8b 45 08             	mov    0x8(%ebp),%eax
    184e:	8b 40 04             	mov    0x4(%eax),%eax
    1851:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    1854:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    185b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    1862:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1869:	eb 1d                	jmp    1888 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    186b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    186e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1871:	01 d0                	add    %edx,%eax
    1873:	0f b6 00             	movzbl (%eax),%eax
    1876:	3c 3d                	cmp    $0x3d,%al
    1878:	75 0a                	jne    1884 <runCalcmd+0x3f>
    {
      hasEqu++;
    187a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    187e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1881:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    1884:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1888:	8b 55 ec             	mov    -0x14(%ebp),%edx
    188b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    188e:	01 d0                	add    %edx,%eax
    1890:	0f b6 00             	movzbl (%eax),%eax
    1893:	84 c0                	test   %al,%al
    1895:	75 d4                	jne    186b <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    1897:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    189b:	7e 1d                	jle    18ba <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    189d:	83 ec 0c             	sub    $0xc,%esp
    18a0:	68 74 3a 00 00       	push   $0x3a74
    18a5:	6a 00                	push   $0x0
    18a7:	6a 00                	push   $0x0
    18a9:	6a 01                	push   $0x1
    18ab:	6a 04                	push   $0x4
    18ad:	e8 21 17 00 00       	call   2fd3 <color_printf>
    18b2:	83 c4 20             	add    $0x20,%esp
    18b5:	e9 78 05 00 00       	jmp    1e32 <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    18ba:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    18be:	0f 85 26 05 00 00    	jne    1dea <runCalcmd+0x5a5>
  {
    int i=0;
    18c4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    18cb:	eb 04                	jmp    18d1 <runCalcmd+0x8c>
    {
      i++;
    18cd:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    18d1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    18d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18d7:	01 d0                	add    %edx,%eax
    18d9:	0f b6 00             	movzbl (%eax),%eax
    18dc:	3c 20                	cmp    $0x20,%al
    18de:	74 ed                	je     18cd <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    18e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18e3:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    18e6:	eb 23                	jmp    190b <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    18e8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    18eb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18ee:	01 d0                	add    %edx,%eax
    18f0:	0f b6 00             	movzbl (%eax),%eax
    18f3:	0f be c0             	movsbl %al,%eax
    18f6:	83 ec 0c             	sub    $0xc,%esp
    18f9:	50                   	push   %eax
    18fa:	e8 ed fe ff ff       	call   17ec <isNameChar>
    18ff:	83 c4 10             	add    $0x10,%esp
    1902:	83 f8 01             	cmp    $0x1,%eax
    1905:	75 0e                	jne    1915 <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    1907:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    190b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    190e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1911:	7c d5                	jl     18e8 <runCalcmd+0xa3>
    1913:	eb 01                	jmp    1916 <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    1915:	90                   	nop
    }
    int len = i-startIndex;
    1916:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1919:	2b 45 d0             	sub    -0x30(%ebp),%eax
    191c:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    191f:	eb 04                	jmp    1925 <runCalcmd+0xe0>
    {
      i++;
    1921:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    1925:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1928:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    192b:	01 d0                	add    %edx,%eax
    192d:	0f b6 00             	movzbl (%eax),%eax
    1930:	3c 20                	cmp    $0x20,%al
    1932:	74 ed                	je     1921 <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    1934:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1937:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    193a:	0f 85 90 04 00 00    	jne    1dd0 <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    1940:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1943:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1946:	01 d0                	add    %edx,%eax
    1948:	0f b6 00             	movzbl (%eax),%eax
    194b:	3c 2f                	cmp    $0x2f,%al
    194d:	7e 2c                	jle    197b <runCalcmd+0x136>
    194f:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1952:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1955:	01 d0                	add    %edx,%eax
    1957:	0f b6 00             	movzbl (%eax),%eax
    195a:	3c 39                	cmp    $0x39,%al
    195c:	7f 1d                	jg     197b <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    195e:	83 ec 0c             	sub    $0xc,%esp
    1961:	68 90 3a 00 00       	push   $0x3a90
    1966:	6a 00                	push   $0x0
    1968:	6a 00                	push   $0x0
    196a:	6a 01                	push   $0x1
    196c:	6a 04                	push   $0x4
    196e:	e8 60 16 00 00       	call   2fd3 <color_printf>
    1973:	83 c4 20             	add    $0x20,%esp
    1976:	e9 b7 04 00 00       	jmp    1e32 <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    197b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1982:	eb 20                	jmp    19a4 <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    1984:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1987:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    198a:	01 d0                	add    %edx,%eax
    198c:	89 c2                	mov    %eax,%edx
    198e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1991:	01 d0                	add    %edx,%eax
    1993:	0f b6 00             	movzbl (%eax),%eax
    1996:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1999:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    199c:	01 ca                	add    %ecx,%edx
    199e:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    19a0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    19a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    19a7:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    19aa:	7c d8                	jl     1984 <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    19ac:	8d 55 94             	lea    -0x6c(%ebp),%edx
    19af:	8b 45 cc             	mov    -0x34(%ebp),%eax
    19b2:	01 d0                	add    %edx,%eax
    19b4:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    19b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ba:	83 c0 01             	add    $0x1,%eax
    19bd:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    19c0:	eb 04                	jmp    19c6 <runCalcmd+0x181>
        {
          i++;
    19c2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    19c6:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19cc:	01 d0                	add    %edx,%eax
    19ce:	0f b6 00             	movzbl (%eax),%eax
    19d1:	3c 20                	cmp    $0x20,%al
    19d3:	74 ed                	je     19c2 <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    19d5:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19db:	01 d0                	add    %edx,%eax
    19dd:	0f b6 00             	movzbl (%eax),%eax
    19e0:	3c 60                	cmp    $0x60,%al
    19e2:	0f 85 e6 01 00 00    	jne    1bce <runCalcmd+0x389>
        {
          i++;
    19e8:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    19ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
    19ef:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    19f2:	eb 04                	jmp    19f8 <runCalcmd+0x1b3>
          {
            i++;
    19f4:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    19f8:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19fb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19fe:	01 d0                	add    %edx,%eax
    1a00:	0f b6 00             	movzbl (%eax),%eax
    1a03:	3c 60                	cmp    $0x60,%al
    1a05:	74 0f                	je     1a16 <runCalcmd+0x1d1>
    1a07:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a0a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a0d:	01 d0                	add    %edx,%eax
    1a0f:	0f b6 00             	movzbl (%eax),%eax
    1a12:	84 c0                	test   %al,%al
    1a14:	75 de                	jne    19f4 <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    1a16:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a19:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a1c:	01 d0                	add    %edx,%eax
    1a1e:	0f b6 00             	movzbl (%eax),%eax
    1a21:	3c 60                	cmp    $0x60,%al
    1a23:	0f 85 5c 01 00 00    	jne    1b85 <runCalcmd+0x340>
    1a29:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1a2c:	8d 50 01             	lea    0x1(%eax),%edx
    1a2f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a32:	01 d0                	add    %edx,%eax
    1a34:	0f b6 00             	movzbl (%eax),%eax
    1a37:	84 c0                	test   %al,%al
    1a39:	0f 85 46 01 00 00    	jne    1b85 <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    1a3f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a42:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a45:	01 d0                	add    %edx,%eax
    1a47:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    1a4a:	8b 55 c8             	mov    -0x38(%ebp),%edx
    1a4d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a50:	01 d0                	add    %edx,%eax
    1a52:	83 ec 0c             	sub    $0xc,%esp
    1a55:	50                   	push   %eax
    1a56:	e8 c5 04 00 00       	call   1f20 <Compute>
    1a5b:	83 c4 10             	add    $0x10,%esp
    1a5e:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    1a61:	dd 05 00 3c 00 00    	fldl   0x3c00
    1a67:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1a6b:	dd 1c 24             	fstpl  (%esp)
    1a6e:	ff 75 c4             	pushl  -0x3c(%ebp)
    1a71:	ff 75 c0             	pushl  -0x40(%ebp)
    1a74:	e8 30 f8 ff ff       	call   12a9 <isEqual>
    1a79:	83 c4 10             	add    $0x10,%esp
    1a7c:	85 c0                	test   %eax,%eax
    1a7e:	0f 85 ad 03 00 00    	jne    1e31 <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    1a84:	a1 6c 47 00 00       	mov    0x476c,%eax
    1a89:	85 c0                	test   %eax,%eax
    1a8b:	75 15                	jne    1aa2 <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1a8d:	83 ec 08             	sub    $0x8,%esp
    1a90:	68 6c 47 00 00       	push   $0x476c
    1a95:	68 a0 47 00 00       	push   $0x47a0
    1a9a:	e8 ba 19 00 00       	call   3459 <readVariables>
    1a9f:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    1aa2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1aa9:	eb 26                	jmp    1ad1 <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1aab:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1aae:	c1 e0 05             	shl    $0x5,%eax
    1ab1:	05 a0 47 00 00       	add    $0x47a0,%eax
    1ab6:	8d 50 04             	lea    0x4(%eax),%edx
    1ab9:	83 ec 08             	sub    $0x8,%esp
    1abc:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1abf:	50                   	push   %eax
    1ac0:	52                   	push   %edx
    1ac1:	e8 38 e9 ff ff       	call   3fe <strcmp>
    1ac6:	83 c4 10             	add    $0x10,%esp
    1ac9:	85 c0                	test   %eax,%eax
    1acb:	74 10                	je     1add <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1acd:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    1ad1:	a1 6c 47 00 00       	mov    0x476c,%eax
    1ad6:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1ad9:	7c d0                	jl     1aab <runCalcmd+0x266>
    1adb:	eb 01                	jmp    1ade <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1add:	90                   	nop
              }
              if(index == v_num) //new variable
    1ade:	a1 6c 47 00 00       	mov    0x476c,%eax
    1ae3:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1ae6:	75 3c                	jne    1b24 <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    1ae8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1aeb:	c1 e0 05             	shl    $0x5,%eax
    1aee:	05 a0 47 00 00       	add    $0x47a0,%eax
    1af3:	8d 50 04             	lea    0x4(%eax),%edx
    1af6:	83 ec 08             	sub    $0x8,%esp
    1af9:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1afc:	50                   	push   %eax
    1afd:	52                   	push   %edx
    1afe:	e8 cb e8 ff ff       	call   3ce <strcpy>
    1b03:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    1b06:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b09:	c1 e0 05             	shl    $0x5,%eax
    1b0c:	05 a0 47 00 00       	add    $0x47a0,%eax
    1b11:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    1b17:	a1 6c 47 00 00       	mov    0x476c,%eax
    1b1c:	83 c0 01             	add    $0x1,%eax
    1b1f:	a3 6c 47 00 00       	mov    %eax,0x476c
              }
              variables[index].value.dvalue = result;
    1b24:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b27:	c1 e0 05             	shl    $0x5,%eax
    1b2a:	05 b0 47 00 00       	add    $0x47b0,%eax
    1b2f:	dd 45 c0             	fldl   -0x40(%ebp)
    1b32:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    1b35:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b38:	c1 e0 05             	shl    $0x5,%eax
    1b3b:	05 b0 47 00 00       	add    $0x47b0,%eax
    1b40:	dd 40 08             	fldl   0x8(%eax)
    1b43:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b46:	c1 e0 05             	shl    $0x5,%eax
    1b49:	05 a0 47 00 00       	add    $0x47a0,%eax
    1b4e:	83 c0 04             	add    $0x4,%eax
    1b51:	83 ec 0c             	sub    $0xc,%esp
    1b54:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1b58:	dd 1c 24             	fstpl  (%esp)
    1b5b:	50                   	push   %eax
    1b5c:	68 ba 3a 00 00       	push   $0x3aba
    1b61:	6a 01                	push   $0x1
    1b63:	e8 43 ed ff ff       	call   8ab <printf>
    1b68:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1b6b:	83 ec 08             	sub    $0x8,%esp
    1b6e:	68 6c 47 00 00       	push   $0x476c
    1b73:	68 a0 47 00 00       	push   $0x47a0
    1b78:	e8 90 1b 00 00       	call   370d <writeVariables>
    1b7d:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1b80:	e9 ac 02 00 00       	jmp    1e31 <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    1b85:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b88:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b8b:	01 d0                	add    %edx,%eax
    1b8d:	0f b6 00             	movzbl (%eax),%eax
    1b90:	84 c0                	test   %al,%al
    1b92:	75 1d                	jne    1bb1 <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    1b94:	83 ec 0c             	sub    $0xc,%esp
    1b97:	68 c1 3a 00 00       	push   $0x3ac1
    1b9c:	6a 00                	push   $0x0
    1b9e:	6a 00                	push   $0x0
    1ba0:	6a 01                	push   $0x1
    1ba2:	6a 04                	push   $0x4
    1ba4:	e8 2a 14 00 00       	call   2fd3 <color_printf>
    1ba9:	83 c4 20             	add    $0x20,%esp
    1bac:	e9 81 02 00 00       	jmp    1e32 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    1bb1:	83 ec 0c             	sub    $0xc,%esp
    1bb4:	68 d8 3a 00 00       	push   $0x3ad8
    1bb9:	6a 00                	push   $0x0
    1bbb:	6a 00                	push   $0x0
    1bbd:	6a 01                	push   $0x1
    1bbf:	6a 04                	push   $0x4
    1bc1:	e8 0d 14 00 00       	call   2fd3 <color_printf>
    1bc6:	83 c4 20             	add    $0x20,%esp
    1bc9:	e9 64 02 00 00       	jmp    1e32 <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1bce:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1bd1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1bd4:	01 d0                	add    %edx,%eax
    1bd6:	0f b6 00             	movzbl (%eax),%eax
    1bd9:	3c 22                	cmp    $0x22,%al
    1bdb:	0f 85 d5 01 00 00    	jne    1db6 <runCalcmd+0x571>
        {
          i++;
    1be1:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    1be5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1be8:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1beb:	eb 04                	jmp    1bf1 <runCalcmd+0x3ac>
          {
            i++;
    1bed:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1bf1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1bf4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1bf7:	01 d0                	add    %edx,%eax
    1bf9:	0f b6 00             	movzbl (%eax),%eax
    1bfc:	3c 22                	cmp    $0x22,%al
    1bfe:	74 0f                	je     1c0f <runCalcmd+0x3ca>
    1c00:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1c03:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1c06:	01 d0                	add    %edx,%eax
    1c08:	0f b6 00             	movzbl (%eax),%eax
    1c0b:	84 c0                	test   %al,%al
    1c0d:	75 de                	jne    1bed <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1c0f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1c12:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1c15:	01 d0                	add    %edx,%eax
    1c17:	0f b6 00             	movzbl (%eax),%eax
    1c1a:	3c 22                	cmp    $0x22,%al
    1c1c:	0f 85 4e 01 00 00    	jne    1d70 <runCalcmd+0x52b>
    1c22:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1c25:	8d 50 01             	lea    0x1(%eax),%edx
    1c28:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1c2b:	01 d0                	add    %edx,%eax
    1c2d:	0f b6 00             	movzbl (%eax),%eax
    1c30:	84 c0                	test   %al,%al
    1c32:	0f 85 38 01 00 00    	jne    1d70 <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1c38:	a1 6c 47 00 00       	mov    0x476c,%eax
    1c3d:	85 c0                	test   %eax,%eax
    1c3f:	75 15                	jne    1c56 <runCalcmd+0x411>
              readVariables(variables,&v_num);
    1c41:	83 ec 08             	sub    $0x8,%esp
    1c44:	68 6c 47 00 00       	push   $0x476c
    1c49:	68 a0 47 00 00       	push   $0x47a0
    1c4e:	e8 06 18 00 00       	call   3459 <readVariables>
    1c53:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1c56:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1c5d:	eb 26                	jmp    1c85 <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    1c5f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1c62:	c1 e0 05             	shl    $0x5,%eax
    1c65:	05 a0 47 00 00       	add    $0x47a0,%eax
    1c6a:	8d 50 04             	lea    0x4(%eax),%edx
    1c6d:	83 ec 08             	sub    $0x8,%esp
    1c70:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1c73:	50                   	push   %eax
    1c74:	52                   	push   %edx
    1c75:	e8 84 e7 ff ff       	call   3fe <strcmp>
    1c7a:	83 c4 10             	add    $0x10,%esp
    1c7d:	85 c0                	test   %eax,%eax
    1c7f:	74 10                	je     1c91 <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    1c81:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1c85:	a1 6c 47 00 00       	mov    0x476c,%eax
    1c8a:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1c8d:	7c d0                	jl     1c5f <runCalcmd+0x41a>
    1c8f:	eb 01                	jmp    1c92 <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    1c91:	90                   	nop
            }
            if(index == v_num) //new variable
    1c92:	a1 6c 47 00 00       	mov    0x476c,%eax
    1c97:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1c9a:	75 2b                	jne    1cc7 <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1c9c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1c9f:	c1 e0 05             	shl    $0x5,%eax
    1ca2:	05 a0 47 00 00       	add    $0x47a0,%eax
    1ca7:	8d 50 04             	lea    0x4(%eax),%edx
    1caa:	83 ec 08             	sub    $0x8,%esp
    1cad:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1cb0:	50                   	push   %eax
    1cb1:	52                   	push   %edx
    1cb2:	e8 17 e7 ff ff       	call   3ce <strcpy>
    1cb7:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1cba:	a1 6c 47 00 00       	mov    0x476c,%eax
    1cbf:	83 c0 01             	add    $0x1,%eax
    1cc2:	a3 6c 47 00 00       	mov    %eax,0x476c
            }
            variables[index].type = V_STRING;
    1cc7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1cca:	c1 e0 05             	shl    $0x5,%eax
    1ccd:	05 a0 47 00 00       	add    $0x47a0,%eax
    1cd2:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1cd8:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1cdb:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1cde:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1ce1:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1ce4:	83 c0 01             	add    $0x1,%eax
    1ce7:	83 ec 0c             	sub    $0xc,%esp
    1cea:	50                   	push   %eax
    1ceb:	e8 bd ee ff ff       	call   bad <malloc>
    1cf0:	83 c4 10             	add    $0x10,%esp
    1cf3:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1cf6:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1cf9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1cfc:	01 d0                	add    %edx,%eax
    1cfe:	83 ec 08             	sub    $0x8,%esp
    1d01:	50                   	push   %eax
    1d02:	ff 75 b4             	pushl  -0x4c(%ebp)
    1d05:	e8 c4 e6 ff ff       	call   3ce <strcpy>
    1d0a:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1d0d:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1d10:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1d13:	01 d0                	add    %edx,%eax
    1d15:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1d18:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1d1b:	c1 e0 05             	shl    $0x5,%eax
    1d1e:	8d 90 b8 47 00 00    	lea    0x47b8(%eax),%edx
    1d24:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1d27:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1d29:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1d2c:	c1 e0 05             	shl    $0x5,%eax
    1d2f:	05 b8 47 00 00       	add    $0x47b8,%eax
    1d34:	8b 00                	mov    (%eax),%eax
    1d36:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1d39:	c1 e2 05             	shl    $0x5,%edx
    1d3c:	81 c2 a0 47 00 00    	add    $0x47a0,%edx
    1d42:	83 c2 04             	add    $0x4,%edx
    1d45:	50                   	push   %eax
    1d46:	52                   	push   %edx
    1d47:	68 f9 3a 00 00       	push   $0x3af9
    1d4c:	6a 01                	push   $0x1
    1d4e:	e8 58 eb ff ff       	call   8ab <printf>
    1d53:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1d56:	83 ec 08             	sub    $0x8,%esp
    1d59:	68 6c 47 00 00       	push   $0x476c
    1d5e:	68 a0 47 00 00       	push   $0x47a0
    1d63:	e8 a5 19 00 00       	call   370d <writeVariables>
    1d68:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1d6b:	e9 c2 00 00 00       	jmp    1e32 <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1d70:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1d73:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1d76:	01 d0                	add    %edx,%eax
    1d78:	0f b6 00             	movzbl (%eax),%eax
    1d7b:	84 c0                	test   %al,%al
    1d7d:	75 1d                	jne    1d9c <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1d7f:	83 ec 0c             	sub    $0xc,%esp
    1d82:	68 02 3b 00 00       	push   $0x3b02
    1d87:	6a 00                	push   $0x0
    1d89:	6a 00                	push   $0x0
    1d8b:	6a 01                	push   $0x1
    1d8d:	6a 04                	push   $0x4
    1d8f:	e8 3f 12 00 00       	call   2fd3 <color_printf>
    1d94:	83 c4 20             	add    $0x20,%esp
    1d97:	e9 96 00 00 00       	jmp    1e32 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1d9c:	83 ec 0c             	sub    $0xc,%esp
    1d9f:	68 18 3b 00 00       	push   $0x3b18
    1da4:	6a 00                	push   $0x0
    1da6:	6a 00                	push   $0x0
    1da8:	6a 01                	push   $0x1
    1daa:	6a 04                	push   $0x4
    1dac:	e8 22 12 00 00       	call   2fd3 <color_printf>
    1db1:	83 c4 20             	add    $0x20,%esp
    1db4:	eb 7c                	jmp    1e32 <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1db6:	83 ec 0c             	sub    $0xc,%esp
    1db9:	68 39 3b 00 00       	push   $0x3b39
    1dbe:	6a 00                	push   $0x0
    1dc0:	6a 00                	push   $0x0
    1dc2:	6a 01                	push   $0x1
    1dc4:	6a 04                	push   $0x4
    1dc6:	e8 08 12 00 00       	call   2fd3 <color_printf>
    1dcb:	83 c4 20             	add    $0x20,%esp
    1dce:	eb 62                	jmp    1e32 <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1dd0:	83 ec 0c             	sub    $0xc,%esp
    1dd3:	68 39 3b 00 00       	push   $0x3b39
    1dd8:	6a 00                	push   $0x0
    1dda:	6a 00                	push   $0x0
    1ddc:	6a 01                	push   $0x1
    1dde:	6a 04                	push   $0x4
    1de0:	e8 ee 11 00 00       	call   2fd3 <color_printf>
    1de5:	83 c4 20             	add    $0x20,%esp
    1de8:	eb 48                	jmp    1e32 <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1dea:	83 ec 0c             	sub    $0xc,%esp
    1ded:	ff 75 d4             	pushl  -0x2c(%ebp)
    1df0:	e8 2b 01 00 00       	call   1f20 <Compute>
    1df5:	83 c4 10             	add    $0x10,%esp
    1df8:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1dfb:	dd 05 00 3c 00 00    	fldl   0x3c00
    1e01:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1e05:	dd 1c 24             	fstpl  (%esp)
    1e08:	ff 75 ac             	pushl  -0x54(%ebp)
    1e0b:	ff 75 a8             	pushl  -0x58(%ebp)
    1e0e:	e8 96 f4 ff ff       	call   12a9 <isEqual>
    1e13:	83 c4 10             	add    $0x10,%esp
    1e16:	85 c0                	test   %eax,%eax
    1e18:	75 18                	jne    1e32 <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1e1a:	ff 75 ac             	pushl  -0x54(%ebp)
    1e1d:	ff 75 a8             	pushl  -0x58(%ebp)
    1e20:	68 51 3b 00 00       	push   $0x3b51
    1e25:	6a 01                	push   $0x1
    1e27:	e8 7f ea ff ff       	call   8ab <printf>
    1e2c:	83 c4 10             	add    $0x10,%esp
    1e2f:	eb 01                	jmp    1e32 <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1e31:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1e32:	e8 c8 e7 ff ff       	call   5ff <exit>

00001e37 <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1e37:	55                   	push   %ebp
    1e38:	89 e5                	mov    %esp,%ebp
    1e3a:	83 ec 04             	sub    $0x4,%esp
    1e3d:	8b 45 08             	mov    0x8(%ebp),%eax
    1e40:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1e43:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1e47:	83 e8 23             	sub    $0x23,%eax
    1e4a:	83 f8 0c             	cmp    $0xc,%eax
    1e4d:	77 25                	ja     1e74 <GetLevel+0x3d>
    1e4f:	8b 04 85 58 3b 00 00 	mov    0x3b58(,%eax,4),%eax
    1e56:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1e58:	b8 01 00 00 00       	mov    $0x1,%eax
    1e5d:	eb 1a                	jmp    1e79 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1e5f:	b8 02 00 00 00       	mov    $0x2,%eax
    1e64:	eb 13                	jmp    1e79 <GetLevel+0x42>
    case '(':
        return 0;
    1e66:	b8 00 00 00 00       	mov    $0x0,%eax
    1e6b:	eb 0c                	jmp    1e79 <GetLevel+0x42>
    case '#':
        return -2;
    1e6d:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1e72:	eb 05                	jmp    1e79 <GetLevel+0x42>
    };
    return -1;
    1e74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1e79:	c9                   	leave  
    1e7a:	c3                   	ret    

00001e7b <Operate>:

double Operate(double a1, char op, double a2)
{
    1e7b:	55                   	push   %ebp
    1e7c:	89 e5                	mov    %esp,%ebp
    1e7e:	83 ec 28             	sub    $0x28,%esp
    1e81:	8b 45 10             	mov    0x10(%ebp),%eax
    1e84:	8b 55 08             	mov    0x8(%ebp),%edx
    1e87:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1e8a:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e8d:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1e90:	88 45 ec             	mov    %al,-0x14(%ebp)
    1e93:	8b 45 14             	mov    0x14(%ebp),%eax
    1e96:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1e99:	8b 45 18             	mov    0x18(%ebp),%eax
    1e9c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1e9f:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1ea3:	83 f8 2b             	cmp    $0x2b,%eax
    1ea6:	74 18                	je     1ec0 <Operate+0x45>
    1ea8:	83 f8 2b             	cmp    $0x2b,%eax
    1eab:	7f 07                	jg     1eb4 <Operate+0x39>
    1ead:	83 f8 2a             	cmp    $0x2a,%eax
    1eb0:	74 1e                	je     1ed0 <Operate+0x55>
    1eb2:	eb 68                	jmp    1f1c <Operate+0xa1>
    1eb4:	83 f8 2d             	cmp    $0x2d,%eax
    1eb7:	74 0f                	je     1ec8 <Operate+0x4d>
    1eb9:	83 f8 2f             	cmp    $0x2f,%eax
    1ebc:	74 1a                	je     1ed8 <Operate+0x5d>
    1ebe:	eb 5c                	jmp    1f1c <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1ec0:	dd 45 f0             	fldl   -0x10(%ebp)
    1ec3:	dc 45 e0             	faddl  -0x20(%ebp)
    1ec6:	eb 56                	jmp    1f1e <Operate+0xa3>
    case '-':
        return a1 - a2;
    1ec8:	dd 45 f0             	fldl   -0x10(%ebp)
    1ecb:	dc 65 e0             	fsubl  -0x20(%ebp)
    1ece:	eb 4e                	jmp    1f1e <Operate+0xa3>
    case '*':
        return a1 * a2;
    1ed0:	dd 45 f0             	fldl   -0x10(%ebp)
    1ed3:	dc 4d e0             	fmull  -0x20(%ebp)
    1ed6:	eb 46                	jmp    1f1e <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1ed8:	d9 ee                	fldz   
    1eda:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1ede:	dd 1c 24             	fstpl  (%esp)
    1ee1:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ee4:	ff 75 e0             	pushl  -0x20(%ebp)
    1ee7:	e8 bd f3 ff ff       	call   12a9 <isEqual>
    1eec:	83 c4 10             	add    $0x10,%esp
    1eef:	83 f8 01             	cmp    $0x1,%eax
    1ef2:	75 20                	jne    1f14 <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1ef4:	83 ec 0c             	sub    $0xc,%esp
    1ef7:	68 8c 3b 00 00       	push   $0x3b8c
    1efc:	6a 00                	push   $0x0
    1efe:	6a 00                	push   $0x0
    1f00:	6a 01                	push   $0x1
    1f02:	6a 04                	push   $0x4
    1f04:	e8 ca 10 00 00       	call   2fd3 <color_printf>
    1f09:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1f0c:	dd 05 00 3c 00 00    	fldl   0x3c00
    1f12:	eb 0a                	jmp    1f1e <Operate+0xa3>
        }
        else
          return a1 / a2;
    1f14:	dd 45 f0             	fldl   -0x10(%ebp)
    1f17:	dc 75 e0             	fdivl  -0x20(%ebp)
    1f1a:	eb 02                	jmp    1f1e <Operate+0xa3>
    };
    return 1;
    1f1c:	d9 e8                	fld1   
}
    1f1e:	c9                   	leave  
    1f1f:	c3                   	ret    

00001f20 <Compute>:

double Compute(char *s)
{
    1f20:	55                   	push   %ebp
    1f21:	89 e5                	mov    %esp,%ebp
    1f23:	53                   	push   %ebx
    1f24:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1f2a:	e8 44 14 00 00       	call   3373 <dstack>
    1f2f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1f32:	e8 73 13 00 00       	call   32aa <cstack>
    1f37:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1f3a:	83 ec 08             	sub    $0x8,%esp
    1f3d:	6a 23                	push   $0x23
    1f3f:	ff 75 e0             	pushl  -0x20(%ebp)
    1f42:	e8 91 13 00 00       	call   32d8 <pushc>
    1f47:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1f4a:	83 ec 0c             	sub    $0xc,%esp
    1f4d:	ff 75 08             	pushl  0x8(%ebp)
    1f50:	e8 e8 e4 ff ff       	call   43d <strlen>
    1f55:	83 c4 10             	add    $0x10,%esp
    1f58:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1f5b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1f62:	c7 05 80 47 00 00 00 	movl   $0x0,0x4780
    1f69:	00 00 00 
    1f6c:	e9 58 05 00 00       	jmp    24c9 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1f71:	a1 80 47 00 00       	mov    0x4780,%eax
    1f76:	89 c2                	mov    %eax,%edx
    1f78:	8b 45 08             	mov    0x8(%ebp),%eax
    1f7b:	01 d0                	add    %edx,%eax
    1f7d:	0f b6 00             	movzbl (%eax),%eax
    1f80:	3c 24                	cmp    $0x24,%al
    1f82:	0f 85 f8 01 00 00    	jne    2180 <Compute+0x260>
        {
          is_minus = 0;
    1f88:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1f8f:	a1 80 47 00 00       	mov    0x4780,%eax
    1f94:	83 c0 01             	add    $0x1,%eax
    1f97:	a3 80 47 00 00       	mov    %eax,0x4780
          if(s[g_pos] != '{')
    1f9c:	a1 80 47 00 00       	mov    0x4780,%eax
    1fa1:	89 c2                	mov    %eax,%edx
    1fa3:	8b 45 08             	mov    0x8(%ebp),%eax
    1fa6:	01 d0                	add    %edx,%eax
    1fa8:	0f b6 00             	movzbl (%eax),%eax
    1fab:	3c 7b                	cmp    $0x7b,%al
    1fad:	74 23                	je     1fd2 <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1faf:	83 ec 0c             	sub    $0xc,%esp
    1fb2:	68 a4 3b 00 00       	push   $0x3ba4
    1fb7:	6a 00                	push   $0x0
    1fb9:	6a 00                	push   $0x0
    1fbb:	6a 01                	push   $0x1
    1fbd:	6a 04                	push   $0x4
    1fbf:	e8 0f 10 00 00       	call   2fd3 <color_printf>
    1fc4:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1fc7:	dd 05 00 3c 00 00    	fldl   0x3c00
    1fcd:	e9 24 06 00 00       	jmp    25f6 <Compute+0x6d6>
          }
          int i=g_pos+1;
    1fd2:	a1 80 47 00 00       	mov    0x4780,%eax
    1fd7:	83 c0 01             	add    $0x1,%eax
    1fda:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1fdd:	eb 13                	jmp    1ff2 <Compute+0xd2>
          {
            if(s[i] == '}')
    1fdf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1fe2:	8b 45 08             	mov    0x8(%ebp),%eax
    1fe5:	01 d0                	add    %edx,%eax
    1fe7:	0f b6 00             	movzbl (%eax),%eax
    1fea:	3c 7d                	cmp    $0x7d,%al
    1fec:	74 0e                	je     1ffc <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1fee:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1ff2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ff5:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1ff8:	7c e5                	jl     1fdf <Compute+0xbf>
    1ffa:	eb 01                	jmp    1ffd <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1ffc:	90                   	nop
          }
          if(s[i] != '}')
    1ffd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2000:	8b 45 08             	mov    0x8(%ebp),%eax
    2003:	01 d0                	add    %edx,%eax
    2005:	0f b6 00             	movzbl (%eax),%eax
    2008:	3c 7d                	cmp    $0x7d,%al
    200a:	74 23                	je     202f <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    200c:	83 ec 0c             	sub    $0xc,%esp
    200f:	68 b2 3b 00 00       	push   $0x3bb2
    2014:	6a 00                	push   $0x0
    2016:	6a 00                	push   $0x0
    2018:	6a 01                	push   $0x1
    201a:	6a 04                	push   $0x4
    201c:	e8 b2 0f 00 00       	call   2fd3 <color_printf>
    2021:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    2024:	dd 05 00 3c 00 00    	fldl   0x3c00
    202a:	e9 c7 05 00 00       	jmp    25f6 <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    202f:	a1 80 47 00 00       	mov    0x4780,%eax
    2034:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2037:	29 c2                	sub    %eax,%edx
    2039:	89 d0                	mov    %edx,%eax
    203b:	83 e8 01             	sub    $0x1,%eax
    203e:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    2041:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    2048:	eb 27                	jmp    2071 <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    204a:	8b 15 80 47 00 00    	mov    0x4780,%edx
    2050:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2053:	01 d0                	add    %edx,%eax
    2055:	8d 50 01             	lea    0x1(%eax),%edx
    2058:	8b 45 08             	mov    0x8(%ebp),%eax
    205b:	01 d0                	add    %edx,%eax
    205d:	0f b6 00             	movzbl (%eax),%eax
    2060:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    2066:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2069:	01 ca                	add    %ecx,%edx
    206b:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    206d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    2071:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2074:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    2077:	7c d1                	jl     204a <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    2079:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    207f:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2082:	01 d0                	add    %edx,%eax
    2084:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    2087:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    208e:	a1 6c 47 00 00       	mov    0x476c,%eax
    2093:	85 c0                	test   %eax,%eax
    2095:	75 40                	jne    20d7 <Compute+0x1b7>
            readVariables(variables,&v_num);
    2097:	83 ec 08             	sub    $0x8,%esp
    209a:	68 6c 47 00 00       	push   $0x476c
    209f:	68 a0 47 00 00       	push   $0x47a0
    20a4:	e8 b0 13 00 00       	call   3459 <readVariables>
    20a9:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    20ac:	eb 29                	jmp    20d7 <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    20ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
    20b1:	c1 e0 05             	shl    $0x5,%eax
    20b4:	05 a0 47 00 00       	add    $0x47a0,%eax
    20b9:	8d 50 04             	lea    0x4(%eax),%edx
    20bc:	83 ec 08             	sub    $0x8,%esp
    20bf:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    20c5:	50                   	push   %eax
    20c6:	52                   	push   %edx
    20c7:	e8 32 e3 ff ff       	call   3fe <strcmp>
    20cc:	83 c4 10             	add    $0x10,%esp
    20cf:	85 c0                	test   %eax,%eax
    20d1:	74 10                	je     20e3 <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    20d3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    20d7:	a1 6c 47 00 00       	mov    0x476c,%eax
    20dc:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    20df:	7c cd                	jl     20ae <Compute+0x18e>
    20e1:	eb 01                	jmp    20e4 <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    20e3:	90                   	nop
          }
          if(index == v_num) //no such variable
    20e4:	a1 6c 47 00 00       	mov    0x476c,%eax
    20e9:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    20ec:	75 2a                	jne    2118 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    20ee:	83 ec 08             	sub    $0x8,%esp
    20f1:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    20f7:	50                   	push   %eax
    20f8:	68 c0 3b 00 00       	push   $0x3bc0
    20fd:	6a 00                	push   $0x0
    20ff:	6a 00                	push   $0x0
    2101:	6a 01                	push   $0x1
    2103:	6a 04                	push   $0x4
    2105:	e8 c9 0e 00 00       	call   2fd3 <color_printf>
    210a:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    210d:	dd 05 00 3c 00 00    	fldl   0x3c00
    2113:	e9 de 04 00 00       	jmp    25f6 <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    2118:	8b 45 e8             	mov    -0x18(%ebp),%eax
    211b:	c1 e0 05             	shl    $0x5,%eax
    211e:	05 a0 47 00 00       	add    $0x47a0,%eax
    2123:	8b 00                	mov    (%eax),%eax
    2125:	83 f8 02             	cmp    $0x2,%eax
    2128:	75 23                	jne    214d <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    212a:	83 ec 0c             	sub    $0xc,%esp
    212d:	68 da 3b 00 00       	push   $0x3bda
    2132:	6a 00                	push   $0x0
    2134:	6a 00                	push   $0x0
    2136:	6a 01                	push   $0x1
    2138:	6a 04                	push   $0x4
    213a:	e8 94 0e 00 00       	call   2fd3 <color_printf>
    213f:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    2142:	dd 05 00 3c 00 00    	fldl   0x3c00
    2148:	e9 a9 04 00 00       	jmp    25f6 <Compute+0x6d6>
          }
          g_pos = i+1;
    214d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2150:	83 c0 01             	add    $0x1,%eax
    2153:	a3 80 47 00 00       	mov    %eax,0x4780
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    2158:	8b 45 e8             	mov    -0x18(%ebp),%eax
    215b:	c1 e0 05             	shl    $0x5,%eax
    215e:	05 b0 47 00 00       	add    $0x47b0,%eax
    2163:	dd 40 08             	fldl   0x8(%eax)
    2166:	83 ec 04             	sub    $0x4,%esp
    2169:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    216d:	dd 1c 24             	fstpl  (%esp)
    2170:	ff 75 e4             	pushl  -0x1c(%ebp)
    2173:	e8 2f 12 00 00       	call   33a7 <pushd>
    2178:	83 c4 10             	add    $0x10,%esp
    217b:	e9 49 03 00 00       	jmp    24c9 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    2180:	a1 80 47 00 00       	mov    0x4780,%eax
    2185:	89 c2                	mov    %eax,%edx
    2187:	8b 45 08             	mov    0x8(%ebp),%eax
    218a:	01 d0                	add    %edx,%eax
    218c:	0f b6 00             	movzbl (%eax),%eax
    218f:	3c 2d                	cmp    $0x2d,%al
    2191:	75 3f                	jne    21d2 <Compute+0x2b2>
    2193:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2197:	74 39                	je     21d2 <Compute+0x2b2>
        {
            pushd(opnd,0);
    2199:	83 ec 04             	sub    $0x4,%esp
    219c:	d9 ee                	fldz   
    219e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    21a2:	dd 1c 24             	fstpl  (%esp)
    21a5:	ff 75 e4             	pushl  -0x1c(%ebp)
    21a8:	e8 fa 11 00 00       	call   33a7 <pushd>
    21ad:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    21b0:	83 ec 08             	sub    $0x8,%esp
    21b3:	6a 2d                	push   $0x2d
    21b5:	ff 75 e0             	pushl  -0x20(%ebp)
    21b8:	e8 1b 11 00 00       	call   32d8 <pushc>
    21bd:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    21c0:	a1 80 47 00 00       	mov    0x4780,%eax
    21c5:	83 c0 01             	add    $0x1,%eax
    21c8:	a3 80 47 00 00       	mov    %eax,0x4780
    21cd:	e9 f7 02 00 00       	jmp    24c9 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    21d2:	a1 80 47 00 00       	mov    0x4780,%eax
    21d7:	89 c2                	mov    %eax,%edx
    21d9:	8b 45 08             	mov    0x8(%ebp),%eax
    21dc:	01 d0                	add    %edx,%eax
    21de:	0f b6 00             	movzbl (%eax),%eax
    21e1:	3c 29                	cmp    $0x29,%al
    21e3:	0f 85 01 01 00 00    	jne    22ea <Compute+0x3ca>
        {
            is_minus = 0;
    21e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    21f0:	a1 80 47 00 00       	mov    0x4780,%eax
    21f5:	83 c0 01             	add    $0x1,%eax
    21f8:	a3 80 47 00 00       	mov    %eax,0x4780
            while (topc(optr) != '(')
    21fd:	e9 bf 00 00 00       	jmp    22c1 <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    2202:	83 ec 0c             	sub    $0xc,%esp
    2205:	ff 75 e4             	pushl  -0x1c(%ebp)
    2208:	e8 37 12 00 00       	call   3444 <topd>
    220d:	83 c4 10             	add    $0x10,%esp
    2210:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    2213:	83 ec 0c             	sub    $0xc,%esp
    2216:	ff 75 e4             	pushl  -0x1c(%ebp)
    2219:	e8 dd 11 00 00       	call   33fb <popd>
    221e:	dd d8                	fstp   %st(0)
    2220:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2223:	83 ec 0c             	sub    $0xc,%esp
    2226:	ff 75 e4             	pushl  -0x1c(%ebp)
    2229:	e8 16 12 00 00       	call   3444 <topd>
    222e:	83 c4 10             	add    $0x10,%esp
    2231:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    2234:	83 ec 0c             	sub    $0xc,%esp
    2237:	ff 75 e4             	pushl  -0x1c(%ebp)
    223a:	e8 bc 11 00 00       	call   33fb <popd>
    223f:	dd d8                	fstp   %st(0)
    2241:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    2244:	83 ec 0c             	sub    $0xc,%esp
    2247:	ff 75 e0             	pushl  -0x20(%ebp)
    224a:	e8 11 11 00 00       	call   3360 <topc>
    224f:	83 c4 10             	add    $0x10,%esp
    2252:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    2255:	83 ec 0c             	sub    $0xc,%esp
    2258:	ff 75 e0             	pushl  -0x20(%ebp)
    225b:	e8 be 10 00 00       	call   331e <popc>
    2260:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    2263:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    2267:	83 ec 0c             	sub    $0xc,%esp
    226a:	ff 75 d4             	pushl  -0x2c(%ebp)
    226d:	ff 75 d0             	pushl  -0x30(%ebp)
    2270:	50                   	push   %eax
    2271:	ff 75 cc             	pushl  -0x34(%ebp)
    2274:	ff 75 c8             	pushl  -0x38(%ebp)
    2277:	e8 ff fb ff ff       	call   1e7b <Operate>
    227c:	83 c4 20             	add    $0x20,%esp
    227f:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    2282:	dd 05 00 3c 00 00    	fldl   0x3c00
    2288:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    228c:	dd 1c 24             	fstpl  (%esp)
    228f:	ff 75 bc             	pushl  -0x44(%ebp)
    2292:	ff 75 b8             	pushl  -0x48(%ebp)
    2295:	e8 0f f0 ff ff       	call   12a9 <isEqual>
    229a:	83 c4 10             	add    $0x10,%esp
    229d:	83 f8 01             	cmp    $0x1,%eax
    22a0:	75 0b                	jne    22ad <Compute+0x38d>
                  return WRONG_ANS;
    22a2:	dd 05 00 3c 00 00    	fldl   0x3c00
    22a8:	e9 49 03 00 00       	jmp    25f6 <Compute+0x6d6>
                pushd(opnd,result);
    22ad:	83 ec 04             	sub    $0x4,%esp
    22b0:	ff 75 bc             	pushl  -0x44(%ebp)
    22b3:	ff 75 b8             	pushl  -0x48(%ebp)
    22b6:	ff 75 e4             	pushl  -0x1c(%ebp)
    22b9:	e8 e9 10 00 00       	call   33a7 <pushd>
    22be:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    22c1:	83 ec 0c             	sub    $0xc,%esp
    22c4:	ff 75 e0             	pushl  -0x20(%ebp)
    22c7:	e8 94 10 00 00       	call   3360 <topc>
    22cc:	83 c4 10             	add    $0x10,%esp
    22cf:	3c 28                	cmp    $0x28,%al
    22d1:	0f 85 2b ff ff ff    	jne    2202 <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    22d7:	83 ec 0c             	sub    $0xc,%esp
    22da:	ff 75 e0             	pushl  -0x20(%ebp)
    22dd:	e8 3c 10 00 00       	call   331e <popc>
    22e2:	83 c4 10             	add    $0x10,%esp
    22e5:	e9 df 01 00 00       	jmp    24c9 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    22ea:	a1 80 47 00 00       	mov    0x4780,%eax
    22ef:	89 c2                	mov    %eax,%edx
    22f1:	8b 45 08             	mov    0x8(%ebp),%eax
    22f4:	01 d0                	add    %edx,%eax
    22f6:	0f b6 00             	movzbl (%eax),%eax
    22f9:	3c 2f                	cmp    $0x2f,%al
    22fb:	7e 49                	jle    2346 <Compute+0x426>
    22fd:	a1 80 47 00 00       	mov    0x4780,%eax
    2302:	89 c2                	mov    %eax,%edx
    2304:	8b 45 08             	mov    0x8(%ebp),%eax
    2307:	01 d0                	add    %edx,%eax
    2309:	0f b6 00             	movzbl (%eax),%eax
    230c:	3c 39                	cmp    $0x39,%al
    230e:	7f 36                	jg     2346 <Compute+0x426>
        {
            is_minus = 0;
    2310:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    2317:	83 ec 08             	sub    $0x8,%esp
    231a:	68 80 47 00 00       	push   $0x4780
    231f:	ff 75 08             	pushl  0x8(%ebp)
    2322:	e8 c3 eb ff ff       	call   eea <Translation>
    2327:	83 c4 10             	add    $0x10,%esp
    232a:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    232d:	83 ec 04             	sub    $0x4,%esp
    2330:	ff 75 b4             	pushl  -0x4c(%ebp)
    2333:	ff 75 b0             	pushl  -0x50(%ebp)
    2336:	ff 75 e4             	pushl  -0x1c(%ebp)
    2339:	e8 69 10 00 00       	call   33a7 <pushd>
    233e:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    2341:	e9 83 01 00 00       	jmp    24c9 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    2346:	a1 80 47 00 00       	mov    0x4780,%eax
    234b:	89 c2                	mov    %eax,%edx
    234d:	8b 45 08             	mov    0x8(%ebp),%eax
    2350:	01 d0                	add    %edx,%eax
    2352:	0f b6 00             	movzbl (%eax),%eax
    2355:	3c 28                	cmp    $0x28,%al
    2357:	0f 85 f9 00 00 00    	jne    2456 <Compute+0x536>
        {
            is_minus = 1;
    235d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    2364:	a1 80 47 00 00       	mov    0x4780,%eax
    2369:	89 c2                	mov    %eax,%edx
    236b:	8b 45 08             	mov    0x8(%ebp),%eax
    236e:	01 d0                	add    %edx,%eax
    2370:	0f b6 00             	movzbl (%eax),%eax
    2373:	0f be c0             	movsbl %al,%eax
    2376:	83 ec 08             	sub    $0x8,%esp
    2379:	50                   	push   %eax
    237a:	ff 75 e0             	pushl  -0x20(%ebp)
    237d:	e8 56 0f 00 00       	call   32d8 <pushc>
    2382:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2385:	a1 80 47 00 00       	mov    0x4780,%eax
    238a:	83 c0 01             	add    $0x1,%eax
    238d:	a3 80 47 00 00       	mov    %eax,0x4780
    2392:	e9 32 01 00 00       	jmp    24c9 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    2397:	83 ec 0c             	sub    $0xc,%esp
    239a:	ff 75 e4             	pushl  -0x1c(%ebp)
    239d:	e8 a2 10 00 00       	call   3444 <topd>
    23a2:	83 c4 10             	add    $0x10,%esp
    23a5:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    23a8:	83 ec 0c             	sub    $0xc,%esp
    23ab:	ff 75 e4             	pushl  -0x1c(%ebp)
    23ae:	e8 48 10 00 00       	call   33fb <popd>
    23b3:	dd d8                	fstp   %st(0)
    23b5:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    23b8:	83 ec 0c             	sub    $0xc,%esp
    23bb:	ff 75 e4             	pushl  -0x1c(%ebp)
    23be:	e8 81 10 00 00       	call   3444 <topd>
    23c3:	83 c4 10             	add    $0x10,%esp
    23c6:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    23c9:	83 ec 0c             	sub    $0xc,%esp
    23cc:	ff 75 e4             	pushl  -0x1c(%ebp)
    23cf:	e8 27 10 00 00       	call   33fb <popd>
    23d4:	dd d8                	fstp   %st(0)
    23d6:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    23d9:	83 ec 0c             	sub    $0xc,%esp
    23dc:	ff 75 e0             	pushl  -0x20(%ebp)
    23df:	e8 7c 0f 00 00       	call   3360 <topc>
    23e4:	83 c4 10             	add    $0x10,%esp
    23e7:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    23ea:	83 ec 0c             	sub    $0xc,%esp
    23ed:	ff 75 e0             	pushl  -0x20(%ebp)
    23f0:	e8 29 0f 00 00       	call   331e <popc>
    23f5:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    23f8:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    23fc:	83 ec 0c             	sub    $0xc,%esp
    23ff:	ff 75 ac             	pushl  -0x54(%ebp)
    2402:	ff 75 a8             	pushl  -0x58(%ebp)
    2405:	50                   	push   %eax
    2406:	ff 75 a4             	pushl  -0x5c(%ebp)
    2409:	ff 75 a0             	pushl  -0x60(%ebp)
    240c:	e8 6a fa ff ff       	call   1e7b <Operate>
    2411:	83 c4 20             	add    $0x20,%esp
    2414:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    2417:	dd 05 00 3c 00 00    	fldl   0x3c00
    241d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2421:	dd 1c 24             	fstpl  (%esp)
    2424:	ff 75 94             	pushl  -0x6c(%ebp)
    2427:	ff 75 90             	pushl  -0x70(%ebp)
    242a:	e8 7a ee ff ff       	call   12a9 <isEqual>
    242f:	83 c4 10             	add    $0x10,%esp
    2432:	83 f8 01             	cmp    $0x1,%eax
    2435:	75 0b                	jne    2442 <Compute+0x522>
                  return WRONG_ANS;
    2437:	dd 05 00 3c 00 00    	fldl   0x3c00
    243d:	e9 b4 01 00 00       	jmp    25f6 <Compute+0x6d6>
                pushd(opnd,result);
    2442:	83 ec 04             	sub    $0x4,%esp
    2445:	ff 75 94             	pushl  -0x6c(%ebp)
    2448:	ff 75 90             	pushl  -0x70(%ebp)
    244b:	ff 75 e4             	pushl  -0x1c(%ebp)
    244e:	e8 54 0f 00 00       	call   33a7 <pushd>
    2453:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    2456:	a1 80 47 00 00       	mov    0x4780,%eax
    245b:	89 c2                	mov    %eax,%edx
    245d:	8b 45 08             	mov    0x8(%ebp),%eax
    2460:	01 d0                	add    %edx,%eax
    2462:	0f b6 00             	movzbl (%eax),%eax
    2465:	0f be c0             	movsbl %al,%eax
    2468:	83 ec 0c             	sub    $0xc,%esp
    246b:	50                   	push   %eax
    246c:	e8 c6 f9 ff ff       	call   1e37 <GetLevel>
    2471:	83 c4 10             	add    $0x10,%esp
    2474:	89 c3                	mov    %eax,%ebx
    2476:	83 ec 0c             	sub    $0xc,%esp
    2479:	ff 75 e0             	pushl  -0x20(%ebp)
    247c:	e8 df 0e 00 00       	call   3360 <topc>
    2481:	83 c4 10             	add    $0x10,%esp
    2484:	0f be c0             	movsbl %al,%eax
    2487:	83 ec 0c             	sub    $0xc,%esp
    248a:	50                   	push   %eax
    248b:	e8 a7 f9 ff ff       	call   1e37 <GetLevel>
    2490:	83 c4 10             	add    $0x10,%esp
    2493:	39 c3                	cmp    %eax,%ebx
    2495:	0f 8e fc fe ff ff    	jle    2397 <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    249b:	a1 80 47 00 00       	mov    0x4780,%eax
    24a0:	89 c2                	mov    %eax,%edx
    24a2:	8b 45 08             	mov    0x8(%ebp),%eax
    24a5:	01 d0                	add    %edx,%eax
    24a7:	0f b6 00             	movzbl (%eax),%eax
    24aa:	0f be c0             	movsbl %al,%eax
    24ad:	83 ec 08             	sub    $0x8,%esp
    24b0:	50                   	push   %eax
    24b1:	ff 75 e0             	pushl  -0x20(%ebp)
    24b4:	e8 1f 0e 00 00       	call   32d8 <pushc>
    24b9:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    24bc:	a1 80 47 00 00       	mov    0x4780,%eax
    24c1:	83 c0 01             	add    $0x1,%eax
    24c4:	a3 80 47 00 00       	mov    %eax,0x4780
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    24c9:	a1 80 47 00 00       	mov    0x4780,%eax
    24ce:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    24d1:	0f 8c 9a fa ff ff    	jl     1f71 <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    24d7:	e9 da 00 00 00       	jmp    25b6 <Compute+0x696>
    {
        double a2 = topd(opnd);
    24dc:	83 ec 0c             	sub    $0xc,%esp
    24df:	ff 75 e4             	pushl  -0x1c(%ebp)
    24e2:	e8 5d 0f 00 00       	call   3444 <topd>
    24e7:	83 c4 10             	add    $0x10,%esp
    24ea:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    24ed:	83 ec 0c             	sub    $0xc,%esp
    24f0:	ff 75 e4             	pushl  -0x1c(%ebp)
    24f3:	e8 03 0f 00 00       	call   33fb <popd>
    24f8:	dd d8                	fstp   %st(0)
    24fa:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    24fd:	83 ec 0c             	sub    $0xc,%esp
    2500:	ff 75 e4             	pushl  -0x1c(%ebp)
    2503:	e8 3c 0f 00 00       	call   3444 <topd>
    2508:	83 c4 10             	add    $0x10,%esp
    250b:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    2511:	83 ec 0c             	sub    $0xc,%esp
    2514:	ff 75 e4             	pushl  -0x1c(%ebp)
    2517:	e8 df 0e 00 00       	call   33fb <popd>
    251c:	dd d8                	fstp   %st(0)
    251e:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    2521:	83 ec 0c             	sub    $0xc,%esp
    2524:	ff 75 e0             	pushl  -0x20(%ebp)
    2527:	e8 34 0e 00 00       	call   3360 <topc>
    252c:	83 c4 10             	add    $0x10,%esp
    252f:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    2535:	83 ec 0c             	sub    $0xc,%esp
    2538:	ff 75 e0             	pushl  -0x20(%ebp)
    253b:	e8 de 0d 00 00       	call   331e <popc>
    2540:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    2543:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    254a:	83 ec 0c             	sub    $0xc,%esp
    254d:	ff 75 84             	pushl  -0x7c(%ebp)
    2550:	ff 75 80             	pushl  -0x80(%ebp)
    2553:	50                   	push   %eax
    2554:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    255a:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    2560:	e8 16 f9 ff ff       	call   1e7b <Operate>
    2565:	83 c4 20             	add    $0x20,%esp
    2568:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    256e:	dd 05 00 3c 00 00    	fldl   0x3c00
    2574:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2578:	dd 1c 24             	fstpl  (%esp)
    257b:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2581:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2587:	e8 1d ed ff ff       	call   12a9 <isEqual>
    258c:	83 c4 10             	add    $0x10,%esp
    258f:	83 f8 01             	cmp    $0x1,%eax
    2592:	75 08                	jne    259c <Compute+0x67c>
          return WRONG_ANS;
    2594:	dd 05 00 3c 00 00    	fldl   0x3c00
    259a:	eb 5a                	jmp    25f6 <Compute+0x6d6>
        pushd(opnd,result);
    259c:	83 ec 04             	sub    $0x4,%esp
    259f:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    25a5:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    25ab:	ff 75 e4             	pushl  -0x1c(%ebp)
    25ae:	e8 f4 0d 00 00       	call   33a7 <pushd>
    25b3:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    25b6:	83 ec 0c             	sub    $0xc,%esp
    25b9:	ff 75 e0             	pushl  -0x20(%ebp)
    25bc:	e8 9f 0d 00 00       	call   3360 <topc>
    25c1:	83 c4 10             	add    $0x10,%esp
    25c4:	3c 23                	cmp    $0x23,%al
    25c6:	0f 85 10 ff ff ff    	jne    24dc <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    25cc:	83 ec 0c             	sub    $0xc,%esp
    25cf:	ff 75 e4             	pushl  -0x1c(%ebp)
    25d2:	e8 94 e4 ff ff       	call   a6b <free>
    25d7:	83 c4 10             	add    $0x10,%esp
    free(optr);
    25da:	83 ec 0c             	sub    $0xc,%esp
    25dd:	ff 75 e0             	pushl  -0x20(%ebp)
    25e0:	e8 86 e4 ff ff       	call   a6b <free>
    25e5:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    25e8:	83 ec 0c             	sub    $0xc,%esp
    25eb:	ff 75 e4             	pushl  -0x1c(%ebp)
    25ee:	e8 51 0e 00 00       	call   3444 <topd>
    25f3:	83 c4 10             	add    $0x10,%esp
}
    25f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    25f9:	c9                   	leave  
    25fa:	c3                   	ret    

000025fb <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    25fb:	55                   	push   %ebp
    25fc:	89 e5                	mov    %esp,%ebp
    25fe:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    2601:	8b 45 08             	mov    0x8(%ebp),%eax
    2604:	8b 00                	mov    (%eax),%eax
    2606:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2609:	eb 04                	jmp    260f <gettoken+0x14>
    s++;
    260b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    260f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2612:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2615:	73 1e                	jae    2635 <gettoken+0x3a>
    2617:	8b 45 f4             	mov    -0xc(%ebp),%eax
    261a:	0f b6 00             	movzbl (%eax),%eax
    261d:	0f be c0             	movsbl %al,%eax
    2620:	83 ec 08             	sub    $0x8,%esp
    2623:	50                   	push   %eax
    2624:	68 34 47 00 00       	push   $0x4734
    2629:	e8 50 de ff ff       	call   47e <strchr>
    262e:	83 c4 10             	add    $0x10,%esp
    2631:	85 c0                	test   %eax,%eax
    2633:	75 d6                	jne    260b <gettoken+0x10>
    s++;
  if(q)
    2635:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2639:	74 08                	je     2643 <gettoken+0x48>
    *q = s;
    263b:	8b 45 10             	mov    0x10(%ebp),%eax
    263e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2641:	89 10                	mov    %edx,(%eax)
  ret = *s;
    2643:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2646:	0f b6 00             	movzbl (%eax),%eax
    2649:	0f be c0             	movsbl %al,%eax
    264c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    264f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2652:	0f b6 00             	movzbl (%eax),%eax
    2655:	0f be c0             	movsbl %al,%eax
    2658:	83 f8 29             	cmp    $0x29,%eax
    265b:	7f 14                	jg     2671 <gettoken+0x76>
    265d:	83 f8 28             	cmp    $0x28,%eax
    2660:	7d 28                	jge    268a <gettoken+0x8f>
    2662:	85 c0                	test   %eax,%eax
    2664:	0f 84 94 00 00 00    	je     26fe <gettoken+0x103>
    266a:	83 f8 26             	cmp    $0x26,%eax
    266d:	74 1b                	je     268a <gettoken+0x8f>
    266f:	eb 3a                	jmp    26ab <gettoken+0xb0>
    2671:	83 f8 3e             	cmp    $0x3e,%eax
    2674:	74 1a                	je     2690 <gettoken+0x95>
    2676:	83 f8 3e             	cmp    $0x3e,%eax
    2679:	7f 0a                	jg     2685 <gettoken+0x8a>
    267b:	83 e8 3b             	sub    $0x3b,%eax
    267e:	83 f8 01             	cmp    $0x1,%eax
    2681:	77 28                	ja     26ab <gettoken+0xb0>
    2683:	eb 05                	jmp    268a <gettoken+0x8f>
    2685:	83 f8 7c             	cmp    $0x7c,%eax
    2688:	75 21                	jne    26ab <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    268a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    268e:	eb 75                	jmp    2705 <gettoken+0x10a>
  case '>':
    s++;
    2690:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    2694:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2697:	0f b6 00             	movzbl (%eax),%eax
    269a:	3c 3e                	cmp    $0x3e,%al
    269c:	75 63                	jne    2701 <gettoken+0x106>
      ret = '+';
    269e:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    26a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    26a9:	eb 56                	jmp    2701 <gettoken+0x106>
  default:
    ret = 'a';
    26ab:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    26b2:	eb 04                	jmp    26b8 <gettoken+0xbd>
      s++;
    26b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    26b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26bb:	3b 45 0c             	cmp    0xc(%ebp),%eax
    26be:	73 44                	jae    2704 <gettoken+0x109>
    26c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26c3:	0f b6 00             	movzbl (%eax),%eax
    26c6:	0f be c0             	movsbl %al,%eax
    26c9:	83 ec 08             	sub    $0x8,%esp
    26cc:	50                   	push   %eax
    26cd:	68 34 47 00 00       	push   $0x4734
    26d2:	e8 a7 dd ff ff       	call   47e <strchr>
    26d7:	83 c4 10             	add    $0x10,%esp
    26da:	85 c0                	test   %eax,%eax
    26dc:	75 26                	jne    2704 <gettoken+0x109>
    26de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26e1:	0f b6 00             	movzbl (%eax),%eax
    26e4:	0f be c0             	movsbl %al,%eax
    26e7:	83 ec 08             	sub    $0x8,%esp
    26ea:	50                   	push   %eax
    26eb:	68 3c 47 00 00       	push   $0x473c
    26f0:	e8 89 dd ff ff       	call   47e <strchr>
    26f5:	83 c4 10             	add    $0x10,%esp
    26f8:	85 c0                	test   %eax,%eax
    26fa:	74 b8                	je     26b4 <gettoken+0xb9>
      s++;
    break;
    26fc:	eb 06                	jmp    2704 <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    26fe:	90                   	nop
    26ff:	eb 04                	jmp    2705 <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    2701:	90                   	nop
    2702:	eb 01                	jmp    2705 <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    2704:	90                   	nop
  }
  if(eq)
    2705:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2709:	74 0e                	je     2719 <gettoken+0x11e>
    *eq = s;
    270b:	8b 45 14             	mov    0x14(%ebp),%eax
    270e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2711:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    2713:	eb 04                	jmp    2719 <gettoken+0x11e>
    s++;
    2715:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    2719:	8b 45 f4             	mov    -0xc(%ebp),%eax
    271c:	3b 45 0c             	cmp    0xc(%ebp),%eax
    271f:	73 1e                	jae    273f <gettoken+0x144>
    2721:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2724:	0f b6 00             	movzbl (%eax),%eax
    2727:	0f be c0             	movsbl %al,%eax
    272a:	83 ec 08             	sub    $0x8,%esp
    272d:	50                   	push   %eax
    272e:	68 34 47 00 00       	push   $0x4734
    2733:	e8 46 dd ff ff       	call   47e <strchr>
    2738:	83 c4 10             	add    $0x10,%esp
    273b:	85 c0                	test   %eax,%eax
    273d:	75 d6                	jne    2715 <gettoken+0x11a>
    s++;
  *ps = s;
    273f:	8b 45 08             	mov    0x8(%ebp),%eax
    2742:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2745:	89 10                	mov    %edx,(%eax)
  return ret;
    2747:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    274a:	c9                   	leave  
    274b:	c3                   	ret    

0000274c <peek>:

int peek(char **ps, char *es, char *toks)
{
    274c:	55                   	push   %ebp
    274d:	89 e5                	mov    %esp,%ebp
    274f:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    2752:	8b 45 08             	mov    0x8(%ebp),%eax
    2755:	8b 00                	mov    (%eax),%eax
    2757:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    275a:	eb 04                	jmp    2760 <peek+0x14>
    s++;
    275c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2760:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2763:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2766:	73 1e                	jae    2786 <peek+0x3a>
    2768:	8b 45 f4             	mov    -0xc(%ebp),%eax
    276b:	0f b6 00             	movzbl (%eax),%eax
    276e:	0f be c0             	movsbl %al,%eax
    2771:	83 ec 08             	sub    $0x8,%esp
    2774:	50                   	push   %eax
    2775:	68 34 47 00 00       	push   $0x4734
    277a:	e8 ff dc ff ff       	call   47e <strchr>
    277f:	83 c4 10             	add    $0x10,%esp
    2782:	85 c0                	test   %eax,%eax
    2784:	75 d6                	jne    275c <peek+0x10>
    s++;
  *ps = s;
    2786:	8b 45 08             	mov    0x8(%ebp),%eax
    2789:	8b 55 f4             	mov    -0xc(%ebp),%edx
    278c:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    278e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2791:	0f b6 00             	movzbl (%eax),%eax
    2794:	84 c0                	test   %al,%al
    2796:	74 23                	je     27bb <peek+0x6f>
    2798:	8b 45 f4             	mov    -0xc(%ebp),%eax
    279b:	0f b6 00             	movzbl (%eax),%eax
    279e:	0f be c0             	movsbl %al,%eax
    27a1:	83 ec 08             	sub    $0x8,%esp
    27a4:	50                   	push   %eax
    27a5:	ff 75 10             	pushl  0x10(%ebp)
    27a8:	e8 d1 dc ff ff       	call   47e <strchr>
    27ad:	83 c4 10             	add    $0x10,%esp
    27b0:	85 c0                	test   %eax,%eax
    27b2:	74 07                	je     27bb <peek+0x6f>
    27b4:	b8 01 00 00 00       	mov    $0x1,%eax
    27b9:	eb 05                	jmp    27c0 <peek+0x74>
    27bb:	b8 00 00 00 00       	mov    $0x0,%eax
}
    27c0:	c9                   	leave  
    27c1:	c3                   	ret    

000027c2 <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    27c2:	55                   	push   %ebp
    27c3:	89 e5                	mov    %esp,%ebp
    27c5:	53                   	push   %ebx
    27c6:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    27c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    27cc:	8b 45 08             	mov    0x8(%ebp),%eax
    27cf:	83 ec 0c             	sub    $0xc,%esp
    27d2:	50                   	push   %eax
    27d3:	e8 65 dc ff ff       	call   43d <strlen>
    27d8:	83 c4 10             	add    $0x10,%esp
    27db:	01 d8                	add    %ebx,%eax
    27dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    27e0:	8b 45 08             	mov    0x8(%ebp),%eax
    27e3:	0f b6 00             	movzbl (%eax),%eax
    27e6:	3c 25                	cmp    $0x25,%al
    27e8:	75 5d                	jne    2847 <parsecmd+0x85>
  {
    int len = strlen(s);
    27ea:	8b 45 08             	mov    0x8(%ebp),%eax
    27ed:	83 ec 0c             	sub    $0xc,%esp
    27f0:	50                   	push   %eax
    27f1:	e8 47 dc ff ff       	call   43d <strlen>
    27f6:	83 c4 10             	add    $0x10,%esp
    27f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    27fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27ff:	83 ec 0c             	sub    $0xc,%esp
    2802:	50                   	push   %eax
    2803:	e8 a5 e3 ff ff       	call   bad <malloc>
    2808:	83 c4 10             	add    $0x10,%esp
    280b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    280e:	8b 45 08             	mov    0x8(%ebp),%eax
    2811:	83 c0 01             	add    $0x1,%eax
    2814:	83 ec 08             	sub    $0x8,%esp
    2817:	50                   	push   %eax
    2818:	ff 75 ec             	pushl  -0x14(%ebp)
    281b:	e8 ae db ff ff       	call   3ce <strcpy>
    2820:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    2823:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2826:	8d 50 fe             	lea    -0x2(%eax),%edx
    2829:	8b 45 ec             	mov    -0x14(%ebp),%eax
    282c:	01 d0                	add    %edx,%eax
    282e:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    2831:	83 ec 0c             	sub    $0xc,%esp
    2834:	ff 75 ec             	pushl  -0x14(%ebp)
    2837:	e8 59 e9 ff ff       	call   1195 <calcmd>
    283c:	83 c4 10             	add    $0x10,%esp
    283f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    2842:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2845:	eb 6b                	jmp    28b2 <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    2847:	83 ec 08             	sub    $0x8,%esp
    284a:	ff 75 f4             	pushl  -0xc(%ebp)
    284d:	8d 45 08             	lea    0x8(%ebp),%eax
    2850:	50                   	push   %eax
    2851:	e8 61 00 00 00       	call   28b7 <parseline>
    2856:	83 c4 10             	add    $0x10,%esp
    2859:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    285c:	83 ec 04             	sub    $0x4,%esp
    285f:	68 08 3c 00 00       	push   $0x3c08
    2864:	ff 75 f4             	pushl  -0xc(%ebp)
    2867:	8d 45 08             	lea    0x8(%ebp),%eax
    286a:	50                   	push   %eax
    286b:	e8 dc fe ff ff       	call   274c <peek>
    2870:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    2873:	8b 45 08             	mov    0x8(%ebp),%eax
    2876:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2879:	74 26                	je     28a1 <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    287b:	8b 45 08             	mov    0x8(%ebp),%eax
    287e:	83 ec 04             	sub    $0x4,%esp
    2881:	50                   	push   %eax
    2882:	68 09 3c 00 00       	push   $0x3c09
    2887:	6a 02                	push   $0x2
    2889:	e8 1d e0 ff ff       	call   8ab <printf>
    288e:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    2891:	83 ec 0c             	sub    $0xc,%esp
    2894:	68 18 3c 00 00       	push   $0x3c18
    2899:	e8 f2 e3 ff ff       	call   c90 <panic1>
    289e:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    28a1:	83 ec 0c             	sub    $0xc,%esp
    28a4:	ff 75 e4             	pushl  -0x1c(%ebp)
    28a7:	e8 eb 03 00 00       	call   2c97 <nulterminate>
    28ac:	83 c4 10             	add    $0x10,%esp
  return cmd;
    28af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    28b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    28b5:	c9                   	leave  
    28b6:	c3                   	ret    

000028b7 <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    28b7:	55                   	push   %ebp
    28b8:	89 e5                	mov    %esp,%ebp
    28ba:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    28bd:	83 ec 08             	sub    $0x8,%esp
    28c0:	ff 75 0c             	pushl  0xc(%ebp)
    28c3:	ff 75 08             	pushl  0x8(%ebp)
    28c6:	e8 99 00 00 00       	call   2964 <parsepipe>
    28cb:	83 c4 10             	add    $0x10,%esp
    28ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    28d1:	eb 23                	jmp    28f6 <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    28d3:	6a 00                	push   $0x0
    28d5:	6a 00                	push   $0x0
    28d7:	ff 75 0c             	pushl  0xc(%ebp)
    28da:	ff 75 08             	pushl  0x8(%ebp)
    28dd:	e8 19 fd ff ff       	call   25fb <gettoken>
    28e2:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    28e5:	83 ec 0c             	sub    $0xc,%esp
    28e8:	ff 75 f4             	pushl  -0xc(%ebp)
    28eb:	e8 66 e8 ff ff       	call   1156 <backcmd>
    28f0:	83 c4 10             	add    $0x10,%esp
    28f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    28f6:	83 ec 04             	sub    $0x4,%esp
    28f9:	68 1f 3c 00 00       	push   $0x3c1f
    28fe:	ff 75 0c             	pushl  0xc(%ebp)
    2901:	ff 75 08             	pushl  0x8(%ebp)
    2904:	e8 43 fe ff ff       	call   274c <peek>
    2909:	83 c4 10             	add    $0x10,%esp
    290c:	85 c0                	test   %eax,%eax
    290e:	75 c3                	jne    28d3 <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    2910:	83 ec 04             	sub    $0x4,%esp
    2913:	68 21 3c 00 00       	push   $0x3c21
    2918:	ff 75 0c             	pushl  0xc(%ebp)
    291b:	ff 75 08             	pushl  0x8(%ebp)
    291e:	e8 29 fe ff ff       	call   274c <peek>
    2923:	83 c4 10             	add    $0x10,%esp
    2926:	85 c0                	test   %eax,%eax
    2928:	74 35                	je     295f <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    292a:	6a 00                	push   $0x0
    292c:	6a 00                	push   $0x0
    292e:	ff 75 0c             	pushl  0xc(%ebp)
    2931:	ff 75 08             	pushl  0x8(%ebp)
    2934:	e8 c2 fc ff ff       	call   25fb <gettoken>
    2939:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    293c:	83 ec 08             	sub    $0x8,%esp
    293f:	ff 75 0c             	pushl  0xc(%ebp)
    2942:	ff 75 08             	pushl  0x8(%ebp)
    2945:	e8 6d ff ff ff       	call   28b7 <parseline>
    294a:	83 c4 10             	add    $0x10,%esp
    294d:	83 ec 08             	sub    $0x8,%esp
    2950:	50                   	push   %eax
    2951:	ff 75 f4             	pushl  -0xc(%ebp)
    2954:	e8 b5 e7 ff ff       	call   110e <listcmd>
    2959:	83 c4 10             	add    $0x10,%esp
    295c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    295f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2962:	c9                   	leave  
    2963:	c3                   	ret    

00002964 <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    2964:	55                   	push   %ebp
    2965:	89 e5                	mov    %esp,%ebp
    2967:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    296a:	83 ec 08             	sub    $0x8,%esp
    296d:	ff 75 0c             	pushl  0xc(%ebp)
    2970:	ff 75 08             	pushl  0x8(%ebp)
    2973:	e8 ec 01 00 00       	call   2b64 <parseexec>
    2978:	83 c4 10             	add    $0x10,%esp
    297b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    297e:	83 ec 04             	sub    $0x4,%esp
    2981:	68 23 3c 00 00       	push   $0x3c23
    2986:	ff 75 0c             	pushl  0xc(%ebp)
    2989:	ff 75 08             	pushl  0x8(%ebp)
    298c:	e8 bb fd ff ff       	call   274c <peek>
    2991:	83 c4 10             	add    $0x10,%esp
    2994:	85 c0                	test   %eax,%eax
    2996:	74 35                	je     29cd <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2998:	6a 00                	push   $0x0
    299a:	6a 00                	push   $0x0
    299c:	ff 75 0c             	pushl  0xc(%ebp)
    299f:	ff 75 08             	pushl  0x8(%ebp)
    29a2:	e8 54 fc ff ff       	call   25fb <gettoken>
    29a7:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    29aa:	83 ec 08             	sub    $0x8,%esp
    29ad:	ff 75 0c             	pushl  0xc(%ebp)
    29b0:	ff 75 08             	pushl  0x8(%ebp)
    29b3:	e8 ac ff ff ff       	call   2964 <parsepipe>
    29b8:	83 c4 10             	add    $0x10,%esp
    29bb:	83 ec 08             	sub    $0x8,%esp
    29be:	50                   	push   %eax
    29bf:	ff 75 f4             	pushl  -0xc(%ebp)
    29c2:	e8 ff e6 ff ff       	call   10c6 <pipecmd>
    29c7:	83 c4 10             	add    $0x10,%esp
    29ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    29cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    29d0:	c9                   	leave  
    29d1:	c3                   	ret    

000029d2 <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    29d2:	55                   	push   %ebp
    29d3:	89 e5                	mov    %esp,%ebp
    29d5:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    29d8:	e9 b6 00 00 00       	jmp    2a93 <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    29dd:	6a 00                	push   $0x0
    29df:	6a 00                	push   $0x0
    29e1:	ff 75 10             	pushl  0x10(%ebp)
    29e4:	ff 75 0c             	pushl  0xc(%ebp)
    29e7:	e8 0f fc ff ff       	call   25fb <gettoken>
    29ec:	83 c4 10             	add    $0x10,%esp
    29ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    29f2:	8d 45 ec             	lea    -0x14(%ebp),%eax
    29f5:	50                   	push   %eax
    29f6:	8d 45 f0             	lea    -0x10(%ebp),%eax
    29f9:	50                   	push   %eax
    29fa:	ff 75 10             	pushl  0x10(%ebp)
    29fd:	ff 75 0c             	pushl  0xc(%ebp)
    2a00:	e8 f6 fb ff ff       	call   25fb <gettoken>
    2a05:	83 c4 10             	add    $0x10,%esp
    2a08:	83 f8 61             	cmp    $0x61,%eax
    2a0b:	74 10                	je     2a1d <parseredirs+0x4b>
      panic1("missing file for redirection");
    2a0d:	83 ec 0c             	sub    $0xc,%esp
    2a10:	68 25 3c 00 00       	push   $0x3c25
    2a15:	e8 76 e2 ff ff       	call   c90 <panic1>
    2a1a:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    2a1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a20:	83 f8 3c             	cmp    $0x3c,%eax
    2a23:	74 0c                	je     2a31 <parseredirs+0x5f>
    2a25:	83 f8 3e             	cmp    $0x3e,%eax
    2a28:	74 26                	je     2a50 <parseredirs+0x7e>
    2a2a:	83 f8 2b             	cmp    $0x2b,%eax
    2a2d:	74 43                	je     2a72 <parseredirs+0xa0>
    2a2f:	eb 62                	jmp    2a93 <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    2a31:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2a34:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a37:	83 ec 0c             	sub    $0xc,%esp
    2a3a:	6a 00                	push   $0x0
    2a3c:	6a 00                	push   $0x0
    2a3e:	52                   	push   %edx
    2a3f:	50                   	push   %eax
    2a40:	ff 75 08             	pushl  0x8(%ebp)
    2a43:	e8 1b e6 ff ff       	call   1063 <redircmd>
    2a48:	83 c4 20             	add    $0x20,%esp
    2a4b:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2a4e:	eb 43                	jmp    2a93 <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    2a50:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2a53:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a56:	83 ec 0c             	sub    $0xc,%esp
    2a59:	6a 01                	push   $0x1
    2a5b:	68 01 02 00 00       	push   $0x201
    2a60:	52                   	push   %edx
    2a61:	50                   	push   %eax
    2a62:	ff 75 08             	pushl  0x8(%ebp)
    2a65:	e8 f9 e5 ff ff       	call   1063 <redircmd>
    2a6a:	83 c4 20             	add    $0x20,%esp
    2a6d:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2a70:	eb 21                	jmp    2a93 <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    2a72:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2a75:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a78:	83 ec 0c             	sub    $0xc,%esp
    2a7b:	6a 01                	push   $0x1
    2a7d:	68 01 02 00 00       	push   $0x201
    2a82:	52                   	push   %edx
    2a83:	50                   	push   %eax
    2a84:	ff 75 08             	pushl  0x8(%ebp)
    2a87:	e8 d7 e5 ff ff       	call   1063 <redircmd>
    2a8c:	83 c4 20             	add    $0x20,%esp
    2a8f:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2a92:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2a93:	83 ec 04             	sub    $0x4,%esp
    2a96:	68 42 3c 00 00       	push   $0x3c42
    2a9b:	ff 75 10             	pushl  0x10(%ebp)
    2a9e:	ff 75 0c             	pushl  0xc(%ebp)
    2aa1:	e8 a6 fc ff ff       	call   274c <peek>
    2aa6:	83 c4 10             	add    $0x10,%esp
    2aa9:	85 c0                	test   %eax,%eax
    2aab:	0f 85 2c ff ff ff    	jne    29dd <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    2ab1:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2ab4:	c9                   	leave  
    2ab5:	c3                   	ret    

00002ab6 <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    2ab6:	55                   	push   %ebp
    2ab7:	89 e5                	mov    %esp,%ebp
    2ab9:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2abc:	83 ec 04             	sub    $0x4,%esp
    2abf:	68 45 3c 00 00       	push   $0x3c45
    2ac4:	ff 75 0c             	pushl  0xc(%ebp)
    2ac7:	ff 75 08             	pushl  0x8(%ebp)
    2aca:	e8 7d fc ff ff       	call   274c <peek>
    2acf:	83 c4 10             	add    $0x10,%esp
    2ad2:	85 c0                	test   %eax,%eax
    2ad4:	75 10                	jne    2ae6 <parseblock+0x30>
    panic1("parseblock");
    2ad6:	83 ec 0c             	sub    $0xc,%esp
    2ad9:	68 47 3c 00 00       	push   $0x3c47
    2ade:	e8 ad e1 ff ff       	call   c90 <panic1>
    2ae3:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2ae6:	6a 00                	push   $0x0
    2ae8:	6a 00                	push   $0x0
    2aea:	ff 75 0c             	pushl  0xc(%ebp)
    2aed:	ff 75 08             	pushl  0x8(%ebp)
    2af0:	e8 06 fb ff ff       	call   25fb <gettoken>
    2af5:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    2af8:	83 ec 08             	sub    $0x8,%esp
    2afb:	ff 75 0c             	pushl  0xc(%ebp)
    2afe:	ff 75 08             	pushl  0x8(%ebp)
    2b01:	e8 b1 fd ff ff       	call   28b7 <parseline>
    2b06:	83 c4 10             	add    $0x10,%esp
    2b09:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    2b0c:	83 ec 04             	sub    $0x4,%esp
    2b0f:	68 52 3c 00 00       	push   $0x3c52
    2b14:	ff 75 0c             	pushl  0xc(%ebp)
    2b17:	ff 75 08             	pushl  0x8(%ebp)
    2b1a:	e8 2d fc ff ff       	call   274c <peek>
    2b1f:	83 c4 10             	add    $0x10,%esp
    2b22:	85 c0                	test   %eax,%eax
    2b24:	75 10                	jne    2b36 <parseblock+0x80>
    panic1("syntax - missing )");
    2b26:	83 ec 0c             	sub    $0xc,%esp
    2b29:	68 54 3c 00 00       	push   $0x3c54
    2b2e:	e8 5d e1 ff ff       	call   c90 <panic1>
    2b33:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2b36:	6a 00                	push   $0x0
    2b38:	6a 00                	push   $0x0
    2b3a:	ff 75 0c             	pushl  0xc(%ebp)
    2b3d:	ff 75 08             	pushl  0x8(%ebp)
    2b40:	e8 b6 fa ff ff       	call   25fb <gettoken>
    2b45:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    2b48:	83 ec 04             	sub    $0x4,%esp
    2b4b:	ff 75 0c             	pushl  0xc(%ebp)
    2b4e:	ff 75 08             	pushl  0x8(%ebp)
    2b51:	ff 75 f4             	pushl  -0xc(%ebp)
    2b54:	e8 79 fe ff ff       	call   29d2 <parseredirs>
    2b59:	83 c4 10             	add    $0x10,%esp
    2b5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    2b5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2b62:	c9                   	leave  
    2b63:	c3                   	ret    

00002b64 <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    2b64:	55                   	push   %ebp
    2b65:	89 e5                	mov    %esp,%ebp
    2b67:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    2b6a:	83 ec 04             	sub    $0x4,%esp
    2b6d:	68 45 3c 00 00       	push   $0x3c45
    2b72:	ff 75 0c             	pushl  0xc(%ebp)
    2b75:	ff 75 08             	pushl  0x8(%ebp)
    2b78:	e8 cf fb ff ff       	call   274c <peek>
    2b7d:	83 c4 10             	add    $0x10,%esp
    2b80:	85 c0                	test   %eax,%eax
    2b82:	74 16                	je     2b9a <parseexec+0x36>
    return parseblock(ps, es);
    2b84:	83 ec 08             	sub    $0x8,%esp
    2b87:	ff 75 0c             	pushl  0xc(%ebp)
    2b8a:	ff 75 08             	pushl  0x8(%ebp)
    2b8d:	e8 24 ff ff ff       	call   2ab6 <parseblock>
    2b92:	83 c4 10             	add    $0x10,%esp
    2b95:	e9 fb 00 00 00       	jmp    2c95 <parseexec+0x131>

  ret = execcmd();
    2b9a:	e8 8e e4 ff ff       	call   102d <execcmd>
    2b9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    2ba2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ba5:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2ba8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2baf:	83 ec 04             	sub    $0x4,%esp
    2bb2:	ff 75 0c             	pushl  0xc(%ebp)
    2bb5:	ff 75 08             	pushl  0x8(%ebp)
    2bb8:	ff 75 f0             	pushl  -0x10(%ebp)
    2bbb:	e8 12 fe ff ff       	call   29d2 <parseredirs>
    2bc0:	83 c4 10             	add    $0x10,%esp
    2bc3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    2bc6:	e9 87 00 00 00       	jmp    2c52 <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2bcb:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2bce:	50                   	push   %eax
    2bcf:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2bd2:	50                   	push   %eax
    2bd3:	ff 75 0c             	pushl  0xc(%ebp)
    2bd6:	ff 75 08             	pushl  0x8(%ebp)
    2bd9:	e8 1d fa ff ff       	call   25fb <gettoken>
    2bde:	83 c4 10             	add    $0x10,%esp
    2be1:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2be4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2be8:	0f 84 84 00 00 00    	je     2c72 <parseexec+0x10e>
      break;
    if(tok != 'a')
    2bee:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    2bf2:	74 10                	je     2c04 <parseexec+0xa0>
      panic1("syntax");
    2bf4:	83 ec 0c             	sub    $0xc,%esp
    2bf7:	68 18 3c 00 00       	push   $0x3c18
    2bfc:	e8 8f e0 ff ff       	call   c90 <panic1>
    2c01:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    2c04:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    2c07:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c0a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c0d:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    2c11:	8b 55 e0             	mov    -0x20(%ebp),%edx
    2c14:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c17:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2c1a:	83 c1 08             	add    $0x8,%ecx
    2c1d:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    2c21:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    2c25:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2c29:	7e 10                	jle    2c3b <parseexec+0xd7>
      panic1("too many args");
    2c2b:	83 ec 0c             	sub    $0xc,%esp
    2c2e:	68 67 3c 00 00       	push   $0x3c67
    2c33:	e8 58 e0 ff ff       	call   c90 <panic1>
    2c38:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2c3b:	83 ec 04             	sub    $0x4,%esp
    2c3e:	ff 75 0c             	pushl  0xc(%ebp)
    2c41:	ff 75 08             	pushl  0x8(%ebp)
    2c44:	ff 75 f0             	pushl  -0x10(%ebp)
    2c47:	e8 86 fd ff ff       	call   29d2 <parseredirs>
    2c4c:	83 c4 10             	add    $0x10,%esp
    2c4f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    2c52:	83 ec 04             	sub    $0x4,%esp
    2c55:	68 75 3c 00 00       	push   $0x3c75
    2c5a:	ff 75 0c             	pushl  0xc(%ebp)
    2c5d:	ff 75 08             	pushl  0x8(%ebp)
    2c60:	e8 e7 fa ff ff       	call   274c <peek>
    2c65:	83 c4 10             	add    $0x10,%esp
    2c68:	85 c0                	test   %eax,%eax
    2c6a:	0f 84 5b ff ff ff    	je     2bcb <parseexec+0x67>
    2c70:	eb 01                	jmp    2c73 <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    2c72:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    2c73:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c76:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c79:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    2c80:	00 
  cmd->eargv[argc] = 0;
    2c81:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c84:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c87:	83 c2 08             	add    $0x8,%edx
    2c8a:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    2c91:	00 
  return ret;
    2c92:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2c95:	c9                   	leave  
    2c96:	c3                   	ret    

00002c97 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2c97:	55                   	push   %ebp
    2c98:	89 e5                	mov    %esp,%ebp
    2c9a:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2c9d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2ca1:	75 0a                	jne    2cad <nulterminate+0x16>
    return 0;
    2ca3:	b8 00 00 00 00       	mov    $0x0,%eax
    2ca8:	e9 e4 00 00 00       	jmp    2d91 <nulterminate+0xfa>
  
  switch(cmd->type){
    2cad:	8b 45 08             	mov    0x8(%ebp),%eax
    2cb0:	8b 00                	mov    (%eax),%eax
    2cb2:	83 f8 05             	cmp    $0x5,%eax
    2cb5:	0f 87 d3 00 00 00    	ja     2d8e <nulterminate+0xf7>
    2cbb:	8b 04 85 7c 3c 00 00 	mov    0x3c7c(,%eax,4),%eax
    2cc2:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2cc4:	8b 45 08             	mov    0x8(%ebp),%eax
    2cc7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2cca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2cd1:	eb 14                	jmp    2ce7 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2cd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2cd6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2cd9:	83 c2 08             	add    $0x8,%edx
    2cdc:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2ce0:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2ce3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2ce7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2cea:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2ced:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2cf1:	85 c0                	test   %eax,%eax
    2cf3:	75 de                	jne    2cd3 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2cf5:	e9 94 00 00 00       	jmp    2d8e <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2cfa:	8b 45 08             	mov    0x8(%ebp),%eax
    2cfd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2d00:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d03:	8b 40 04             	mov    0x4(%eax),%eax
    2d06:	83 ec 0c             	sub    $0xc,%esp
    2d09:	50                   	push   %eax
    2d0a:	e8 88 ff ff ff       	call   2c97 <nulterminate>
    2d0f:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2d12:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d15:	8b 40 0c             	mov    0xc(%eax),%eax
    2d18:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2d1b:	eb 71                	jmp    2d8e <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2d1d:	8b 45 08             	mov    0x8(%ebp),%eax
    2d20:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2d23:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d26:	8b 40 04             	mov    0x4(%eax),%eax
    2d29:	83 ec 0c             	sub    $0xc,%esp
    2d2c:	50                   	push   %eax
    2d2d:	e8 65 ff ff ff       	call   2c97 <nulterminate>
    2d32:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2d35:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d38:	8b 40 08             	mov    0x8(%eax),%eax
    2d3b:	83 ec 0c             	sub    $0xc,%esp
    2d3e:	50                   	push   %eax
    2d3f:	e8 53 ff ff ff       	call   2c97 <nulterminate>
    2d44:	83 c4 10             	add    $0x10,%esp
    break;
    2d47:	eb 45                	jmp    2d8e <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2d49:	8b 45 08             	mov    0x8(%ebp),%eax
    2d4c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2d4f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d52:	8b 40 04             	mov    0x4(%eax),%eax
    2d55:	83 ec 0c             	sub    $0xc,%esp
    2d58:	50                   	push   %eax
    2d59:	e8 39 ff ff ff       	call   2c97 <nulterminate>
    2d5e:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2d61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d64:	8b 40 08             	mov    0x8(%eax),%eax
    2d67:	83 ec 0c             	sub    $0xc,%esp
    2d6a:	50                   	push   %eax
    2d6b:	e8 27 ff ff ff       	call   2c97 <nulterminate>
    2d70:	83 c4 10             	add    $0x10,%esp
    break;
    2d73:	eb 19                	jmp    2d8e <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2d75:	8b 45 08             	mov    0x8(%ebp),%eax
    2d78:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2d7b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2d7e:	8b 40 04             	mov    0x4(%eax),%eax
    2d81:	83 ec 0c             	sub    $0xc,%esp
    2d84:	50                   	push   %eax
    2d85:	e8 0d ff ff ff       	call   2c97 <nulterminate>
    2d8a:	83 c4 10             	add    $0x10,%esp
    break;
    2d8d:	90                   	nop
  }
  return cmd;
    2d8e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2d91:	c9                   	leave  
    2d92:	c3                   	ret    

00002d93 <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2d93:	55                   	push   %ebp
    2d94:	89 e5                	mov    %esp,%ebp
    2d96:	83 ec 18             	sub    $0x18,%esp
    2d99:	8b 45 08             	mov    0x8(%ebp),%eax
    2d9c:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2d9f:	83 ec 08             	sub    $0x8,%esp
    2da2:	ff 75 18             	pushl  0x18(%ebp)
    2da5:	ff 75 14             	pushl  0x14(%ebp)
    2da8:	ff 75 10             	pushl  0x10(%ebp)
    2dab:	ff 75 0c             	pushl  0xc(%ebp)
    2dae:	6a 01                	push   $0x1
    2db0:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2db3:	50                   	push   %eax
    2db4:	e8 e6 d8 ff ff       	call   69f <colorwrite>
    2db9:	83 c4 20             	add    $0x20,%esp
}
    2dbc:	90                   	nop
    2dbd:	c9                   	leave  
    2dbe:	c3                   	ret    

00002dbf <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2dbf:	55                   	push   %ebp
    2dc0:	89 e5                	mov    %esp,%ebp
    2dc2:	53                   	push   %ebx
    2dc3:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2dc6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2dcd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2dd1:	74 17                	je     2dea <color_printint+0x2b>
    2dd3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2dd7:	79 11                	jns    2dea <color_printint+0x2b>
    neg = 1;
    2dd9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2de0:	8b 45 08             	mov    0x8(%ebp),%eax
    2de3:	f7 d8                	neg    %eax
    2de5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2de8:	eb 06                	jmp    2df0 <color_printint+0x31>
  } else {
    x = xx;
    2dea:	8b 45 08             	mov    0x8(%ebp),%eax
    2ded:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2df0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2df7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2dfa:	8d 41 01             	lea    0x1(%ecx),%eax
    2dfd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2e00:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2e03:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e06:	ba 00 00 00 00       	mov    $0x0,%edx
    2e0b:	f7 f3                	div    %ebx
    2e0d:	89 d0                	mov    %edx,%eax
    2e0f:	0f b6 80 44 47 00 00 	movzbl 0x4744(%eax),%eax
    2e16:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2e1a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2e1d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e20:	ba 00 00 00 00       	mov    $0x0,%edx
    2e25:	f7 f3                	div    %ebx
    2e27:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2e2a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2e2e:	75 c7                	jne    2df7 <color_printint+0x38>
  if(neg)
    2e30:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2e34:	74 36                	je     2e6c <color_printint+0xad>
    buf[i++] = '-';
    2e36:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e39:	8d 50 01             	lea    0x1(%eax),%edx
    2e3c:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2e3f:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2e44:	eb 26                	jmp    2e6c <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2e46:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2e49:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e4c:	01 d0                	add    %edx,%eax
    2e4e:	0f b6 00             	movzbl (%eax),%eax
    2e51:	0f be c0             	movsbl %al,%eax
    2e54:	83 ec 0c             	sub    $0xc,%esp
    2e57:	ff 75 20             	pushl  0x20(%ebp)
    2e5a:	ff 75 1c             	pushl  0x1c(%ebp)
    2e5d:	ff 75 18             	pushl  0x18(%ebp)
    2e60:	ff 75 14             	pushl  0x14(%ebp)
    2e63:	50                   	push   %eax
    2e64:	e8 2a ff ff ff       	call   2d93 <color_putc>
    2e69:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2e6c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2e70:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e74:	79 d0                	jns    2e46 <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2e76:	90                   	nop
    2e77:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2e7a:	c9                   	leave  
    2e7b:	c3                   	ret    

00002e7c <getInteger>:

static int getInteger(double num)
{
    2e7c:	55                   	push   %ebp
    2e7d:	89 e5                	mov    %esp,%ebp
    2e7f:	83 ec 18             	sub    $0x18,%esp
    2e82:	8b 45 08             	mov    0x8(%ebp),%eax
    2e85:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2e88:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e8b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2e8e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2e95:	eb 0e                	jmp    2ea5 <getInteger+0x29>
  {
    num -= 1;
    2e97:	dd 45 e8             	fldl   -0x18(%ebp)
    2e9a:	d9 e8                	fld1   
    2e9c:	de e9                	fsubrp %st,%st(1)
    2e9e:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2ea1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2ea5:	dd 45 e8             	fldl   -0x18(%ebp)
    2ea8:	d9 e8                	fld1   
    2eaa:	d9 c9                	fxch   %st(1)
    2eac:	df e9                	fucomip %st(1),%st
    2eae:	dd d8                	fstp   %st(0)
    2eb0:	77 e5                	ja     2e97 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2eb2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2eb5:	c9                   	leave  
    2eb6:	c3                   	ret    

00002eb7 <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2eb7:	55                   	push   %ebp
    2eb8:	89 e5                	mov    %esp,%ebp
    2eba:	83 ec 28             	sub    $0x28,%esp
    2ebd:	8b 45 08             	mov    0x8(%ebp),%eax
    2ec0:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2ec3:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ec6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2ec9:	d9 ee                	fldz   
    2ecb:	dd 45 e0             	fldl   -0x20(%ebp)
    2ece:	d9 c9                	fxch   %st(1)
    2ed0:	df e9                	fucomip %st(1),%st
    2ed2:	dd d8                	fstp   %st(0)
    2ed4:	76 21                	jbe    2ef7 <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2ed6:	83 ec 0c             	sub    $0xc,%esp
    2ed9:	ff 75 1c             	pushl  0x1c(%ebp)
    2edc:	ff 75 18             	pushl  0x18(%ebp)
    2edf:	ff 75 14             	pushl  0x14(%ebp)
    2ee2:	ff 75 10             	pushl  0x10(%ebp)
    2ee5:	6a 2d                	push   $0x2d
    2ee7:	e8 a7 fe ff ff       	call   2d93 <color_putc>
    2eec:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2eef:	dd 45 e0             	fldl   -0x20(%ebp)
    2ef2:	d9 e0                	fchs   
    2ef4:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2ef7:	83 ec 08             	sub    $0x8,%esp
    2efa:	ff 75 e4             	pushl  -0x1c(%ebp)
    2efd:	ff 75 e0             	pushl  -0x20(%ebp)
    2f00:	e8 77 ff ff ff       	call   2e7c <getInteger>
    2f05:	83 c4 10             	add    $0x10,%esp
    2f08:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2f0b:	83 ec 04             	sub    $0x4,%esp
    2f0e:	ff 75 1c             	pushl  0x1c(%ebp)
    2f11:	ff 75 18             	pushl  0x18(%ebp)
    2f14:	ff 75 14             	pushl  0x14(%ebp)
    2f17:	ff 75 10             	pushl  0x10(%ebp)
    2f1a:	6a 01                	push   $0x1
    2f1c:	6a 0a                	push   $0xa
    2f1e:	ff 75 f0             	pushl  -0x10(%ebp)
    2f21:	e8 99 fe ff ff       	call   2dbf <color_printint>
    2f26:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2f29:	db 45 f0             	fildl  -0x10(%ebp)
    2f2c:	dd 45 e0             	fldl   -0x20(%ebp)
    2f2f:	de e1                	fsubp  %st,%st(1)
    2f31:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2f34:	dd 45 e0             	fldl   -0x20(%ebp)
    2f37:	dd 05 a0 3c 00 00    	fldl   0x3ca0
    2f3d:	d9 c9                	fxch   %st(1)
    2f3f:	df e9                	fucomip %st(1),%st
    2f41:	dd d8                	fstp   %st(0)
    2f43:	76 19                	jbe    2f5e <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2f45:	83 ec 0c             	sub    $0xc,%esp
    2f48:	ff 75 1c             	pushl  0x1c(%ebp)
    2f4b:	ff 75 18             	pushl  0x18(%ebp)
    2f4e:	ff 75 14             	pushl  0x14(%ebp)
    2f51:	ff 75 10             	pushl  0x10(%ebp)
    2f54:	6a 2e                	push   $0x2e
    2f56:	e8 38 fe ff ff       	call   2d93 <color_putc>
    2f5b:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2f5e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2f65:	eb 55                	jmp    2fbc <color_printdbl+0x105>
  {
    num = num*10;
    2f67:	dd 45 e0             	fldl   -0x20(%ebp)
    2f6a:	dd 05 a8 3c 00 00    	fldl   0x3ca8
    2f70:	de c9                	fmulp  %st,%st(1)
    2f72:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2f75:	83 ec 08             	sub    $0x8,%esp
    2f78:	ff 75 e4             	pushl  -0x1c(%ebp)
    2f7b:	ff 75 e0             	pushl  -0x20(%ebp)
    2f7e:	e8 f9 fe ff ff       	call   2e7c <getInteger>
    2f83:	83 c4 10             	add    $0x10,%esp
    2f86:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2f89:	83 ec 04             	sub    $0x4,%esp
    2f8c:	ff 75 1c             	pushl  0x1c(%ebp)
    2f8f:	ff 75 18             	pushl  0x18(%ebp)
    2f92:	ff 75 14             	pushl  0x14(%ebp)
    2f95:	ff 75 10             	pushl  0x10(%ebp)
    2f98:	6a 01                	push   $0x1
    2f9a:	6a 0a                	push   $0xa
    2f9c:	ff 75 f0             	pushl  -0x10(%ebp)
    2f9f:	e8 1b fe ff ff       	call   2dbf <color_printint>
    2fa4:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2fa7:	db 45 f0             	fildl  -0x10(%ebp)
    2faa:	dd 45 e0             	fldl   -0x20(%ebp)
    2fad:	de e1                	fsubp  %st,%st(1)
    2faf:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2fb2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2fb6:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2fba:	7f 13                	jg     2fcf <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2fbc:	dd 45 e0             	fldl   -0x20(%ebp)
    2fbf:	dd 05 a0 3c 00 00    	fldl   0x3ca0
    2fc5:	d9 c9                	fxch   %st(1)
    2fc7:	df e9                	fucomip %st(1),%st
    2fc9:	dd d8                	fstp   %st(0)
    2fcb:	77 9a                	ja     2f67 <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2fcd:	eb 01                	jmp    2fd0 <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2fcf:	90                   	nop
    }
  }
}
    2fd0:	90                   	nop
    2fd1:	c9                   	leave  
    2fd2:	c3                   	ret    

00002fd3 <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2fd3:	55                   	push   %ebp
    2fd4:	89 e5                	mov    %esp,%ebp
    2fd6:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2fd9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2fe0:	8d 45 18             	lea    0x18(%ebp),%eax
    2fe3:	83 c0 04             	add    $0x4,%eax
    2fe6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2fe9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2ff0:	e9 e2 01 00 00       	jmp    31d7 <color_printf+0x204>
    c = fmt[i] & 0xff;
    2ff5:	8b 55 18             	mov    0x18(%ebp),%edx
    2ff8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ffb:	01 d0                	add    %edx,%eax
    2ffd:	0f b6 00             	movzbl (%eax),%eax
    3000:	0f be c0             	movsbl %al,%eax
    3003:	25 ff 00 00 00       	and    $0xff,%eax
    3008:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    300b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    300f:	75 35                	jne    3046 <color_printf+0x73>
      if(c == '%'){
    3011:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3015:	75 0c                	jne    3023 <color_printf+0x50>
        state = '%';
    3017:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    301e:	e9 b0 01 00 00       	jmp    31d3 <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    3023:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3026:	0f be c0             	movsbl %al,%eax
    3029:	83 ec 0c             	sub    $0xc,%esp
    302c:	ff 75 14             	pushl  0x14(%ebp)
    302f:	ff 75 10             	pushl  0x10(%ebp)
    3032:	ff 75 0c             	pushl  0xc(%ebp)
    3035:	ff 75 08             	pushl  0x8(%ebp)
    3038:	50                   	push   %eax
    3039:	e8 55 fd ff ff       	call   2d93 <color_putc>
    303e:	83 c4 20             	add    $0x20,%esp
    3041:	e9 8d 01 00 00       	jmp    31d3 <color_printf+0x200>
      }
    } else if(state == '%'){
    3046:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    304a:	0f 85 83 01 00 00    	jne    31d3 <color_printf+0x200>
      if(c == 'd'){
    3050:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    3054:	75 2a                	jne    3080 <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    3056:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3059:	8b 00                	mov    (%eax),%eax
    305b:	83 ec 04             	sub    $0x4,%esp
    305e:	ff 75 14             	pushl  0x14(%ebp)
    3061:	ff 75 10             	pushl  0x10(%ebp)
    3064:	ff 75 0c             	pushl  0xc(%ebp)
    3067:	ff 75 08             	pushl  0x8(%ebp)
    306a:	6a 01                	push   $0x1
    306c:	6a 0a                	push   $0xa
    306e:	50                   	push   %eax
    306f:	e8 4b fd ff ff       	call   2dbf <color_printint>
    3074:	83 c4 20             	add    $0x20,%esp
        ap++;
    3077:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    307b:	e9 4c 01 00 00       	jmp    31cc <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    3080:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3084:	74 06                	je     308c <color_printf+0xb9>
    3086:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    308a:	75 2a                	jne    30b6 <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    308c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    308f:	8b 00                	mov    (%eax),%eax
    3091:	83 ec 04             	sub    $0x4,%esp
    3094:	ff 75 14             	pushl  0x14(%ebp)
    3097:	ff 75 10             	pushl  0x10(%ebp)
    309a:	ff 75 0c             	pushl  0xc(%ebp)
    309d:	ff 75 08             	pushl  0x8(%ebp)
    30a0:	6a 00                	push   $0x0
    30a2:	6a 10                	push   $0x10
    30a4:	50                   	push   %eax
    30a5:	e8 15 fd ff ff       	call   2dbf <color_printint>
    30aa:	83 c4 20             	add    $0x20,%esp
        ap++;
    30ad:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    30b1:	e9 16 01 00 00       	jmp    31cc <color_printf+0x1f9>
      } else if(c == 's'){
    30b6:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    30ba:	75 4f                	jne    310b <color_printf+0x138>
        s = (char*)*ap;
    30bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    30bf:	8b 00                	mov    (%eax),%eax
    30c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    30c4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    30c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    30cc:	75 2e                	jne    30fc <color_printf+0x129>
          s = "(null)";
    30ce:	c7 45 f4 98 3c 00 00 	movl   $0x3c98,-0xc(%ebp)
        while(*s != 0){
    30d5:	eb 25                	jmp    30fc <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    30d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30da:	0f b6 00             	movzbl (%eax),%eax
    30dd:	0f be c0             	movsbl %al,%eax
    30e0:	83 ec 0c             	sub    $0xc,%esp
    30e3:	ff 75 14             	pushl  0x14(%ebp)
    30e6:	ff 75 10             	pushl  0x10(%ebp)
    30e9:	ff 75 0c             	pushl  0xc(%ebp)
    30ec:	ff 75 08             	pushl  0x8(%ebp)
    30ef:	50                   	push   %eax
    30f0:	e8 9e fc ff ff       	call   2d93 <color_putc>
    30f5:	83 c4 20             	add    $0x20,%esp
          s++;
    30f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    30fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30ff:	0f b6 00             	movzbl (%eax),%eax
    3102:	84 c0                	test   %al,%al
    3104:	75 d1                	jne    30d7 <color_printf+0x104>
    3106:	e9 c1 00 00 00       	jmp    31cc <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    310b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    310f:	75 29                	jne    313a <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    3111:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3114:	8b 00                	mov    (%eax),%eax
    3116:	0f be c0             	movsbl %al,%eax
    3119:	83 ec 0c             	sub    $0xc,%esp
    311c:	ff 75 14             	pushl  0x14(%ebp)
    311f:	ff 75 10             	pushl  0x10(%ebp)
    3122:	ff 75 0c             	pushl  0xc(%ebp)
    3125:	ff 75 08             	pushl  0x8(%ebp)
    3128:	50                   	push   %eax
    3129:	e8 65 fc ff ff       	call   2d93 <color_putc>
    312e:	83 c4 20             	add    $0x20,%esp
        ap++;
    3131:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3135:	e9 92 00 00 00       	jmp    31cc <color_printf+0x1f9>
      } else if(c == '%'){
    313a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    313e:	75 20                	jne    3160 <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    3140:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3143:	0f be c0             	movsbl %al,%eax
    3146:	83 ec 0c             	sub    $0xc,%esp
    3149:	ff 75 14             	pushl  0x14(%ebp)
    314c:	ff 75 10             	pushl  0x10(%ebp)
    314f:	ff 75 0c             	pushl  0xc(%ebp)
    3152:	ff 75 08             	pushl  0x8(%ebp)
    3155:	50                   	push   %eax
    3156:	e8 38 fc ff ff       	call   2d93 <color_putc>
    315b:	83 c4 20             	add    $0x20,%esp
    315e:	eb 6c                	jmp    31cc <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    3160:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    3164:	75 2f                	jne    3195 <color_printf+0x1c2>
        double *dap = (double*)ap;
    3166:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3169:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    316c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    316f:	dd 00                	fldl   (%eax)
    3171:	83 ec 08             	sub    $0x8,%esp
    3174:	ff 75 14             	pushl  0x14(%ebp)
    3177:	ff 75 10             	pushl  0x10(%ebp)
    317a:	ff 75 0c             	pushl  0xc(%ebp)
    317d:	ff 75 08             	pushl  0x8(%ebp)
    3180:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3184:	dd 1c 24             	fstpl  (%esp)
    3187:	e8 2b fd ff ff       	call   2eb7 <color_printdbl>
    318c:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    318f:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    3193:	eb 37                	jmp    31cc <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    3195:	83 ec 0c             	sub    $0xc,%esp
    3198:	ff 75 14             	pushl  0x14(%ebp)
    319b:	ff 75 10             	pushl  0x10(%ebp)
    319e:	ff 75 0c             	pushl  0xc(%ebp)
    31a1:	ff 75 08             	pushl  0x8(%ebp)
    31a4:	6a 25                	push   $0x25
    31a6:	e8 e8 fb ff ff       	call   2d93 <color_putc>
    31ab:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    31ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    31b1:	0f be c0             	movsbl %al,%eax
    31b4:	83 ec 0c             	sub    $0xc,%esp
    31b7:	ff 75 14             	pushl  0x14(%ebp)
    31ba:	ff 75 10             	pushl  0x10(%ebp)
    31bd:	ff 75 0c             	pushl  0xc(%ebp)
    31c0:	ff 75 08             	pushl  0x8(%ebp)
    31c3:	50                   	push   %eax
    31c4:	e8 ca fb ff ff       	call   2d93 <color_putc>
    31c9:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    31cc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    31d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    31d7:	8b 55 18             	mov    0x18(%ebp),%edx
    31da:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31dd:	01 d0                	add    %edx,%eax
    31df:	0f b6 00             	movzbl (%eax),%eax
    31e2:	84 c0                	test   %al,%al
    31e4:	0f 85 0b fe ff ff    	jne    2ff5 <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    31ea:	90                   	nop
    31eb:	c9                   	leave  
    31ec:	c3                   	ret    

000031ed <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    31ed:	55                   	push   %ebp
    31ee:	89 e5                	mov    %esp,%ebp
    31f0:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    31f3:	83 ec 0c             	sub    $0xc,%esp
    31f6:	6a 58                	push   $0x58
    31f8:	e8 b0 d9 ff ff       	call   bad <malloc>
    31fd:	83 c4 10             	add    $0x10,%esp
    3200:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    3203:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3206:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    320c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    320f:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    3216:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3219:	c9                   	leave  
    321a:	c3                   	ret    

0000321b <pushi>:

void pushi(struct istack *s, int val)
{
    321b:	55                   	push   %ebp
    321c:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    321e:	8b 45 08             	mov    0x8(%ebp),%eax
    3221:	8b 00                	mov    (%eax),%eax
    3223:	83 f8 13             	cmp    $0x13,%eax
    3226:	7f 2c                	jg     3254 <pushi+0x39>
    {
        s->size++;
    3228:	8b 45 08             	mov    0x8(%ebp),%eax
    322b:	8b 00                	mov    (%eax),%eax
    322d:	8d 50 01             	lea    0x1(%eax),%edx
    3230:	8b 45 08             	mov    0x8(%ebp),%eax
    3233:	89 10                	mov    %edx,(%eax)
        s->top++;
    3235:	8b 45 08             	mov    0x8(%ebp),%eax
    3238:	8b 40 54             	mov    0x54(%eax),%eax
    323b:	8d 50 01             	lea    0x1(%eax),%edx
    323e:	8b 45 08             	mov    0x8(%ebp),%eax
    3241:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    3244:	8b 45 08             	mov    0x8(%ebp),%eax
    3247:	8b 50 54             	mov    0x54(%eax),%edx
    324a:	8b 45 08             	mov    0x8(%ebp),%eax
    324d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    3250:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    3254:	90                   	nop
    3255:	5d                   	pop    %ebp
    3256:	c3                   	ret    

00003257 <popi>:

int popi(struct istack *s)
{
    3257:	55                   	push   %ebp
    3258:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    325a:	8b 45 08             	mov    0x8(%ebp),%eax
    325d:	8b 00                	mov    (%eax),%eax
    325f:	85 c0                	test   %eax,%eax
    3261:	75 07                	jne    326a <popi+0x13>
    {
        return -1;
    3263:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3268:	eb 2c                	jmp    3296 <popi+0x3f>
    }
    s->size--;
    326a:	8b 45 08             	mov    0x8(%ebp),%eax
    326d:	8b 00                	mov    (%eax),%eax
    326f:	8d 50 ff             	lea    -0x1(%eax),%edx
    3272:	8b 45 08             	mov    0x8(%ebp),%eax
    3275:	89 10                	mov    %edx,(%eax)
    s->top--;
    3277:	8b 45 08             	mov    0x8(%ebp),%eax
    327a:	8b 40 54             	mov    0x54(%eax),%eax
    327d:	8d 50 ff             	lea    -0x1(%eax),%edx
    3280:	8b 45 08             	mov    0x8(%ebp),%eax
    3283:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    3286:	8b 45 08             	mov    0x8(%ebp),%eax
    3289:	8b 40 54             	mov    0x54(%eax),%eax
    328c:	8d 50 01             	lea    0x1(%eax),%edx
    328f:	8b 45 08             	mov    0x8(%ebp),%eax
    3292:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3296:	5d                   	pop    %ebp
    3297:	c3                   	ret    

00003298 <topi>:

int topi(struct istack* s)
{
    3298:	55                   	push   %ebp
    3299:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    329b:	8b 45 08             	mov    0x8(%ebp),%eax
    329e:	8b 50 54             	mov    0x54(%eax),%edx
    32a1:	8b 45 08             	mov    0x8(%ebp),%eax
    32a4:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    32a8:	5d                   	pop    %ebp
    32a9:	c3                   	ret    

000032aa <cstack>:

//constructor
struct cstack* cstack()
{
    32aa:	55                   	push   %ebp
    32ab:	89 e5                	mov    %esp,%ebp
    32ad:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    32b0:	83 ec 0c             	sub    $0xc,%esp
    32b3:	6a 1c                	push   $0x1c
    32b5:	e8 f3 d8 ff ff       	call   bad <malloc>
    32ba:	83 c4 10             	add    $0x10,%esp
    32bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    32c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32c3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    32c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32cc:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    32d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    32d6:	c9                   	leave  
    32d7:	c3                   	ret    

000032d8 <pushc>:

void pushc(struct cstack *s, char val)
{
    32d8:	55                   	push   %ebp
    32d9:	89 e5                	mov    %esp,%ebp
    32db:	83 ec 04             	sub    $0x4,%esp
    32de:	8b 45 0c             	mov    0xc(%ebp),%eax
    32e1:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    32e4:	8b 45 08             	mov    0x8(%ebp),%eax
    32e7:	8b 00                	mov    (%eax),%eax
    32e9:	83 f8 13             	cmp    $0x13,%eax
    32ec:	7f 2d                	jg     331b <pushc+0x43>
    {
        s->size++;
    32ee:	8b 45 08             	mov    0x8(%ebp),%eax
    32f1:	8b 00                	mov    (%eax),%eax
    32f3:	8d 50 01             	lea    0x1(%eax),%edx
    32f6:	8b 45 08             	mov    0x8(%ebp),%eax
    32f9:	89 10                	mov    %edx,(%eax)
        s->top++;
    32fb:	8b 45 08             	mov    0x8(%ebp),%eax
    32fe:	8b 40 18             	mov    0x18(%eax),%eax
    3301:	8d 50 01             	lea    0x1(%eax),%edx
    3304:	8b 45 08             	mov    0x8(%ebp),%eax
    3307:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    330a:	8b 45 08             	mov    0x8(%ebp),%eax
    330d:	8b 40 18             	mov    0x18(%eax),%eax
    3310:	8b 55 08             	mov    0x8(%ebp),%edx
    3313:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    3317:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    331b:	90                   	nop
    331c:	c9                   	leave  
    331d:	c3                   	ret    

0000331e <popc>:

char popc(struct cstack *s)
{
    331e:	55                   	push   %ebp
    331f:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3321:	8b 45 08             	mov    0x8(%ebp),%eax
    3324:	8b 00                	mov    (%eax),%eax
    3326:	85 c0                	test   %eax,%eax
    3328:	75 07                	jne    3331 <popc+0x13>
    {
        return -1;
    332a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    332f:	eb 2d                	jmp    335e <popc+0x40>
    }
    s->size--;
    3331:	8b 45 08             	mov    0x8(%ebp),%eax
    3334:	8b 00                	mov    (%eax),%eax
    3336:	8d 50 ff             	lea    -0x1(%eax),%edx
    3339:	8b 45 08             	mov    0x8(%ebp),%eax
    333c:	89 10                	mov    %edx,(%eax)
    s->top--;
    333e:	8b 45 08             	mov    0x8(%ebp),%eax
    3341:	8b 40 18             	mov    0x18(%eax),%eax
    3344:	8d 50 ff             	lea    -0x1(%eax),%edx
    3347:	8b 45 08             	mov    0x8(%ebp),%eax
    334a:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    334d:	8b 45 08             	mov    0x8(%ebp),%eax
    3350:	8b 40 18             	mov    0x18(%eax),%eax
    3353:	8d 50 01             	lea    0x1(%eax),%edx
    3356:	8b 45 08             	mov    0x8(%ebp),%eax
    3359:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    335e:	5d                   	pop    %ebp
    335f:	c3                   	ret    

00003360 <topc>:

char topc(struct cstack* s)
{
    3360:	55                   	push   %ebp
    3361:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3363:	8b 45 08             	mov    0x8(%ebp),%eax
    3366:	8b 40 18             	mov    0x18(%eax),%eax
    3369:	8b 55 08             	mov    0x8(%ebp),%edx
    336c:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    3371:	5d                   	pop    %ebp
    3372:	c3                   	ret    

00003373 <dstack>:

//constructor
struct dstack* dstack()
{
    3373:	55                   	push   %ebp
    3374:	89 e5                	mov    %esp,%ebp
    3376:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    3379:	83 ec 0c             	sub    $0xc,%esp
    337c:	68 a8 00 00 00       	push   $0xa8
    3381:	e8 27 d8 ff ff       	call   bad <malloc>
    3386:	83 c4 10             	add    $0x10,%esp
    3389:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    338c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    338f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3395:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3398:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    339f:	ff ff ff 
    return stack;
    33a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    33a5:	c9                   	leave  
    33a6:	c3                   	ret    

000033a7 <pushd>:

void pushd(struct dstack *s, double val)
{
    33a7:	55                   	push   %ebp
    33a8:	89 e5                	mov    %esp,%ebp
    33aa:	83 ec 08             	sub    $0x8,%esp
    33ad:	8b 45 0c             	mov    0xc(%ebp),%eax
    33b0:	89 45 f8             	mov    %eax,-0x8(%ebp)
    33b3:	8b 45 10             	mov    0x10(%ebp),%eax
    33b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    33b9:	8b 45 08             	mov    0x8(%ebp),%eax
    33bc:	8b 00                	mov    (%eax),%eax
    33be:	83 f8 13             	cmp    $0x13,%eax
    33c1:	7f 35                	jg     33f8 <pushd+0x51>
    {
        s->size++;
    33c3:	8b 45 08             	mov    0x8(%ebp),%eax
    33c6:	8b 00                	mov    (%eax),%eax
    33c8:	8d 50 01             	lea    0x1(%eax),%edx
    33cb:	8b 45 08             	mov    0x8(%ebp),%eax
    33ce:	89 10                	mov    %edx,(%eax)
        s->top++;
    33d0:	8b 45 08             	mov    0x8(%ebp),%eax
    33d3:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    33d9:	8d 50 01             	lea    0x1(%eax),%edx
    33dc:	8b 45 08             	mov    0x8(%ebp),%eax
    33df:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    33e5:	8b 45 08             	mov    0x8(%ebp),%eax
    33e8:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    33ee:	8b 45 08             	mov    0x8(%ebp),%eax
    33f1:	dd 45 f8             	fldl   -0x8(%ebp)
    33f4:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    33f8:	90                   	nop
    33f9:	c9                   	leave  
    33fa:	c3                   	ret    

000033fb <popd>:

double popd(struct dstack *s)
{
    33fb:	55                   	push   %ebp
    33fc:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    33fe:	8b 45 08             	mov    0x8(%ebp),%eax
    3401:	8b 00                	mov    (%eax),%eax
    3403:	85 c0                	test   %eax,%eax
    3405:	75 06                	jne    340d <popd+0x12>
    {
        return -1;
    3407:	d9 e8                	fld1   
    3409:	d9 e0                	fchs   
    340b:	eb 35                	jmp    3442 <popd+0x47>
    }
    s->size--;
    340d:	8b 45 08             	mov    0x8(%ebp),%eax
    3410:	8b 00                	mov    (%eax),%eax
    3412:	8d 50 ff             	lea    -0x1(%eax),%edx
    3415:	8b 45 08             	mov    0x8(%ebp),%eax
    3418:	89 10                	mov    %edx,(%eax)
    s->top--;
    341a:	8b 45 08             	mov    0x8(%ebp),%eax
    341d:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3423:	8d 50 ff             	lea    -0x1(%eax),%edx
    3426:	8b 45 08             	mov    0x8(%ebp),%eax
    3429:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    342f:	8b 45 08             	mov    0x8(%ebp),%eax
    3432:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3438:	8d 50 01             	lea    0x1(%eax),%edx
    343b:	8b 45 08             	mov    0x8(%ebp),%eax
    343e:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    3442:	5d                   	pop    %ebp
    3443:	c3                   	ret    

00003444 <topd>:

double topd(struct dstack* s)
{
    3444:	55                   	push   %ebp
    3445:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3447:	8b 45 08             	mov    0x8(%ebp),%eax
    344a:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3450:	8b 45 08             	mov    0x8(%ebp),%eax
    3453:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    3457:	5d                   	pop    %ebp
    3458:	c3                   	ret    

00003459 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3459:	55                   	push   %ebp
    345a:	89 e5                	mov    %esp,%ebp
    345c:	53                   	push   %ebx
    345d:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    3463:	83 ec 08             	sub    $0x8,%esp
    3466:	6a 00                	push   $0x0
    3468:	68 b0 3c 00 00       	push   $0x3cb0
    346d:	e8 cd d1 ff ff       	call   63f <open>
    3472:	83 c4 10             	add    $0x10,%esp
    3475:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3478:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    347c:	79 1d                	jns    349b <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    347e:	83 ec 0c             	sub    $0xc,%esp
    3481:	68 ba 3c 00 00       	push   $0x3cba
    3486:	6a 00                	push   $0x0
    3488:	6a 00                	push   $0x0
    348a:	6a 01                	push   $0x1
    348c:	6a 03                	push   $0x3
    348e:	e8 40 fb ff ff       	call   2fd3 <color_printf>
    3493:	83 c4 20             	add    $0x20,%esp
    3496:	e9 6d 02 00 00       	jmp    3708 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    349b:	8b 45 0c             	mov    0xc(%ebp),%eax
    349e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    34a4:	e9 2a 02 00 00       	jmp    36d3 <readVariables+0x27a>
  {
    int pos = 0;
    34a9:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    34b0:	00 00 00 
    while(pos <= n-1)
    34b3:	e9 07 02 00 00       	jmp    36bf <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    34b8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    34bf:	eb 24                	jmp    34e5 <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    34c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34c4:	8d 50 ff             	lea    -0x1(%eax),%edx
    34c7:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    34cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34d0:	01 c8                	add    %ecx,%eax
    34d2:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    34d9:	ff 
    34da:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    34e1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    34e5:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    34eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34ee:	01 d0                	add    %edx,%eax
    34f0:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    34f7:	ff 
    34f8:	3c 3d                	cmp    $0x3d,%al
    34fa:	75 c5                	jne    34c1 <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    34fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34ff:	83 e8 01             	sub    $0x1,%eax
    3502:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    3509:	00 
      if(buf[pos] == 'd') //double value
    350a:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3510:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3517:	ff 
    3518:	3c 64                	cmp    $0x64,%al
    351a:	0f 85 a0 00 00 00    	jne    35c0 <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    3520:	8b 45 0c             	mov    0xc(%ebp),%eax
    3523:	8b 00                	mov    (%eax),%eax
    3525:	c1 e0 05             	shl    $0x5,%eax
    3528:	89 c2                	mov    %eax,%edx
    352a:	8b 45 08             	mov    0x8(%ebp),%eax
    352d:	01 d0                	add    %edx,%eax
    352f:	8d 50 04             	lea    0x4(%eax),%edx
    3532:	83 ec 08             	sub    $0x8,%esp
    3535:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    353b:	50                   	push   %eax
    353c:	52                   	push   %edx
    353d:	e8 8c ce ff ff       	call   3ce <strcpy>
    3542:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    3545:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3548:	8d 50 01             	lea    0x1(%eax),%edx
    354b:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3551:	01 d0                	add    %edx,%eax
    3553:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    3559:	83 ec 08             	sub    $0x8,%esp
    355c:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    3562:	50                   	push   %eax
    3563:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3569:	50                   	push   %eax
    356a:	e8 7b d9 ff ff       	call   eea <Translation>
    356f:	83 c4 10             	add    $0x10,%esp
    3572:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    3575:	8b 45 0c             	mov    0xc(%ebp),%eax
    3578:	8b 00                	mov    (%eax),%eax
    357a:	c1 e0 05             	shl    $0x5,%eax
    357d:	89 c2                	mov    %eax,%edx
    357f:	8b 45 08             	mov    0x8(%ebp),%eax
    3582:	01 d0                	add    %edx,%eax
    3584:	dd 45 d8             	fldl   -0x28(%ebp)
    3587:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    358a:	8b 45 0c             	mov    0xc(%ebp),%eax
    358d:	8b 00                	mov    (%eax),%eax
    358f:	c1 e0 05             	shl    $0x5,%eax
    3592:	89 c2                	mov    %eax,%edx
    3594:	8b 45 08             	mov    0x8(%ebp),%eax
    3597:	01 d0                	add    %edx,%eax
    3599:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    359f:	8b 45 0c             	mov    0xc(%ebp),%eax
    35a2:	8b 00                	mov    (%eax),%eax
    35a4:	8d 50 01             	lea    0x1(%eax),%edx
    35a7:	8b 45 0c             	mov    0xc(%ebp),%eax
    35aa:	89 10                	mov    %edx,(%eax)
        pos++;
    35ac:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    35b2:	83 c0 01             	add    $0x1,%eax
    35b5:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    35bb:	e9 ff 00 00 00       	jmp    36bf <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    35c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    35c3:	8b 00                	mov    (%eax),%eax
    35c5:	c1 e0 05             	shl    $0x5,%eax
    35c8:	89 c2                	mov    %eax,%edx
    35ca:	8b 45 08             	mov    0x8(%ebp),%eax
    35cd:	01 d0                	add    %edx,%eax
    35cf:	8d 50 04             	lea    0x4(%eax),%edx
    35d2:	83 ec 08             	sub    $0x8,%esp
    35d5:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    35db:	50                   	push   %eax
    35dc:	52                   	push   %edx
    35dd:	e8 ec cd ff ff       	call   3ce <strcpy>
    35e2:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    35e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35e8:	8d 50 01             	lea    0x1(%eax),%edx
    35eb:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    35f1:	01 d0                	add    %edx,%eax
    35f3:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    35f9:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    35ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    3602:	eb 04                	jmp    3608 <readVariables+0x1af>
        {
          strend++;
    3604:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    3608:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    360e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3611:	01 d0                	add    %edx,%eax
    3613:	0f b6 00             	movzbl (%eax),%eax
    3616:	84 c0                	test   %al,%al
    3618:	75 ea                	jne    3604 <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    361a:	8b 45 0c             	mov    0xc(%ebp),%eax
    361d:	8b 00                	mov    (%eax),%eax
    361f:	c1 e0 05             	shl    $0x5,%eax
    3622:	89 c2                	mov    %eax,%edx
    3624:	8b 45 08             	mov    0x8(%ebp),%eax
    3627:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    362a:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3630:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3633:	29 c2                	sub    %eax,%edx
    3635:	89 d0                	mov    %edx,%eax
    3637:	83 c0 01             	add    $0x1,%eax
    363a:	83 ec 0c             	sub    $0xc,%esp
    363d:	50                   	push   %eax
    363e:	e8 6a d5 ff ff       	call   bad <malloc>
    3643:	83 c4 10             	add    $0x10,%esp
    3646:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    3649:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    364f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3652:	eb 35                	jmp    3689 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    3654:	8b 45 0c             	mov    0xc(%ebp),%eax
    3657:	8b 00                	mov    (%eax),%eax
    3659:	c1 e0 05             	shl    $0x5,%eax
    365c:	89 c2                	mov    %eax,%edx
    365e:	8b 45 08             	mov    0x8(%ebp),%eax
    3661:	01 d0                	add    %edx,%eax
    3663:	8b 40 18             	mov    0x18(%eax),%eax
    3666:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    366c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    366f:	29 d1                	sub    %edx,%ecx
    3671:	89 ca                	mov    %ecx,%edx
    3673:	01 c2                	add    %eax,%edx
    3675:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    367b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    367e:	01 c8                	add    %ecx,%eax
    3680:	0f b6 00             	movzbl (%eax),%eax
    3683:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    3685:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    3689:	8b 45 ec             	mov    -0x14(%ebp),%eax
    368c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    368f:	7e c3                	jle    3654 <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    3691:	8b 45 0c             	mov    0xc(%ebp),%eax
    3694:	8b 00                	mov    (%eax),%eax
    3696:	c1 e0 05             	shl    $0x5,%eax
    3699:	89 c2                	mov    %eax,%edx
    369b:	8b 45 08             	mov    0x8(%ebp),%eax
    369e:	01 d0                	add    %edx,%eax
    36a0:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    36a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    36a9:	8b 00                	mov    (%eax),%eax
    36ab:	8d 50 01             	lea    0x1(%eax),%edx
    36ae:	8b 45 0c             	mov    0xc(%ebp),%eax
    36b1:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    36b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    36b6:	83 c0 01             	add    $0x1,%eax
    36b9:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    36bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    36c2:	8d 50 ff             	lea    -0x1(%eax),%edx
    36c5:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    36cb:	39 c2                	cmp    %eax,%edx
    36cd:	0f 8d e5 fd ff ff    	jge    34b8 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    36d3:	83 ec 04             	sub    $0x4,%esp
    36d6:	68 e8 03 00 00       	push   $0x3e8
    36db:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    36e1:	50                   	push   %eax
    36e2:	ff 75 e8             	pushl  -0x18(%ebp)
    36e5:	e8 2d cf ff ff       	call   617 <read>
    36ea:	83 c4 10             	add    $0x10,%esp
    36ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    36f0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    36f4:	0f 8f af fd ff ff    	jg     34a9 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    36fa:	83 ec 0c             	sub    $0xc,%esp
    36fd:	ff 75 e8             	pushl  -0x18(%ebp)
    3700:	e8 22 cf ff ff       	call   627 <close>
    3705:	83 c4 10             	add    $0x10,%esp
}
    3708:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    370b:	c9                   	leave  
    370c:	c3                   	ret    

0000370d <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    370d:	55                   	push   %ebp
    370e:	89 e5                	mov    %esp,%ebp
    3710:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    3716:	83 ec 08             	sub    $0x8,%esp
    3719:	6a 02                	push   $0x2
    371b:	68 b0 3c 00 00       	push   $0x3cb0
    3720:	e8 1a cf ff ff       	call   63f <open>
    3725:	83 c4 10             	add    $0x10,%esp
    3728:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    372b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    372f:	78 1e                	js     374f <writeVariables+0x42>
  {
    close(fd);
    3731:	83 ec 0c             	sub    $0xc,%esp
    3734:	ff 75 e4             	pushl  -0x1c(%ebp)
    3737:	e8 eb ce ff ff       	call   627 <close>
    373c:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    373f:	83 ec 0c             	sub    $0xc,%esp
    3742:	68 b0 3c 00 00       	push   $0x3cb0
    3747:	e8 03 cf ff ff       	call   64f <unlink>
    374c:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    374f:	83 ec 08             	sub    $0x8,%esp
    3752:	68 02 02 00 00       	push   $0x202
    3757:	68 b0 3c 00 00       	push   $0x3cb0
    375c:	e8 de ce ff ff       	call   63f <open>
    3761:	83 c4 10             	add    $0x10,%esp
    3764:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    3767:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    376e:	e9 ff 01 00 00       	jmp    3972 <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    3773:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3776:	c1 e0 05             	shl    $0x5,%eax
    3779:	89 c2                	mov    %eax,%edx
    377b:	8b 45 08             	mov    0x8(%ebp),%eax
    377e:	01 d0                	add    %edx,%eax
    3780:	8b 00                	mov    (%eax),%eax
    3782:	83 f8 01             	cmp    $0x1,%eax
    3785:	0f 85 d3 00 00 00    	jne    385e <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    378b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    3792:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3795:	8d 50 01             	lea    0x1(%eax),%edx
    3798:	89 55 e0             	mov    %edx,-0x20(%ebp)
    379b:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    37a2:	64 
      int k=0;
    37a3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    37aa:	eb 2c                	jmp    37d8 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    37ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
    37af:	8d 50 01             	lea    0x1(%eax),%edx
    37b2:	89 55 e0             	mov    %edx,-0x20(%ebp)
    37b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    37b8:	89 d1                	mov    %edx,%ecx
    37ba:	c1 e1 05             	shl    $0x5,%ecx
    37bd:	8b 55 08             	mov    0x8(%ebp),%edx
    37c0:	01 d1                	add    %edx,%ecx
    37c2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    37c5:	01 ca                	add    %ecx,%edx
    37c7:	83 c2 04             	add    $0x4,%edx
    37ca:	0f b6 12             	movzbl (%edx),%edx
    37cd:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    37d4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    37d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37db:	c1 e0 05             	shl    $0x5,%eax
    37de:	89 c2                	mov    %eax,%edx
    37e0:	8b 45 08             	mov    0x8(%ebp),%eax
    37e3:	01 c2                	add    %eax,%edx
    37e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    37e8:	01 d0                	add    %edx,%eax
    37ea:	83 c0 04             	add    $0x4,%eax
    37ed:	0f b6 00             	movzbl (%eax),%eax
    37f0:	84 c0                	test   %al,%al
    37f2:	75 b8                	jne    37ac <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    37f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    37f7:	8d 50 01             	lea    0x1(%eax),%edx
    37fa:	89 55 e0             	mov    %edx,-0x20(%ebp)
    37fd:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    3804:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    3805:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3808:	c1 e0 05             	shl    $0x5,%eax
    380b:	89 c2                	mov    %eax,%edx
    380d:	8b 45 08             	mov    0x8(%ebp),%eax
    3810:	01 d0                	add    %edx,%eax
    3812:	dd 40 18             	fldl   0x18(%eax)
    3815:	8d 45 e0             	lea    -0x20(%ebp),%eax
    3818:	50                   	push   %eax
    3819:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    381d:	dd 1c 24             	fstpl  (%esp)
    3820:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3826:	50                   	push   %eax
    3827:	e8 7d d5 ff ff       	call   da9 <double2str>
    382c:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    382f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3832:	8d 50 01             	lea    0x1(%eax),%edx
    3835:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3838:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    383f:	00 
      write(fd,buf,pos);
    3840:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3843:	83 ec 04             	sub    $0x4,%esp
    3846:	50                   	push   %eax
    3847:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    384d:	50                   	push   %eax
    384e:	ff 75 e4             	pushl  -0x1c(%ebp)
    3851:	e8 c9 cd ff ff       	call   61f <write>
    3856:	83 c4 10             	add    $0x10,%esp
    3859:	e9 10 01 00 00       	jmp    396e <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    385e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    3865:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3868:	8d 50 01             	lea    0x1(%eax),%edx
    386b:	89 55 ec             	mov    %edx,-0x14(%ebp)
    386e:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    3875:	73 
      int k=0;
    3876:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    387d:	eb 2c                	jmp    38ab <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    387f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3882:	8d 50 01             	lea    0x1(%eax),%edx
    3885:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3888:	8b 55 f4             	mov    -0xc(%ebp),%edx
    388b:	89 d1                	mov    %edx,%ecx
    388d:	c1 e1 05             	shl    $0x5,%ecx
    3890:	8b 55 08             	mov    0x8(%ebp),%edx
    3893:	01 d1                	add    %edx,%ecx
    3895:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3898:	01 ca                	add    %ecx,%edx
    389a:	83 c2 04             	add    $0x4,%edx
    389d:	0f b6 12             	movzbl (%edx),%edx
    38a0:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    38a7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    38ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38ae:	c1 e0 05             	shl    $0x5,%eax
    38b1:	89 c2                	mov    %eax,%edx
    38b3:	8b 45 08             	mov    0x8(%ebp),%eax
    38b6:	01 c2                	add    %eax,%edx
    38b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    38bb:	01 d0                	add    %edx,%eax
    38bd:	83 c0 04             	add    $0x4,%eax
    38c0:	0f b6 00             	movzbl (%eax),%eax
    38c3:	84 c0                	test   %al,%al
    38c5:	75 b8                	jne    387f <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    38c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    38ca:	8d 50 01             	lea    0x1(%eax),%edx
    38cd:	89 55 ec             	mov    %edx,-0x14(%ebp)
    38d0:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    38d7:	3d 
      k=0;
    38d8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    38df:	eb 2c                	jmp    390d <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    38e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    38e4:	8d 50 01             	lea    0x1(%eax),%edx
    38e7:	89 55 ec             	mov    %edx,-0x14(%ebp)
    38ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
    38ed:	89 d1                	mov    %edx,%ecx
    38ef:	c1 e1 05             	shl    $0x5,%ecx
    38f2:	8b 55 08             	mov    0x8(%ebp),%edx
    38f5:	01 ca                	add    %ecx,%edx
    38f7:	8b 4a 18             	mov    0x18(%edx),%ecx
    38fa:	8b 55 e8             	mov    -0x18(%ebp),%edx
    38fd:	01 ca                	add    %ecx,%edx
    38ff:	0f b6 12             	movzbl (%edx),%edx
    3902:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3909:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    390d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3910:	c1 e0 05             	shl    $0x5,%eax
    3913:	89 c2                	mov    %eax,%edx
    3915:	8b 45 08             	mov    0x8(%ebp),%eax
    3918:	01 d0                	add    %edx,%eax
    391a:	8b 50 18             	mov    0x18(%eax),%edx
    391d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3920:	01 d0                	add    %edx,%eax
    3922:	0f b6 00             	movzbl (%eax),%eax
    3925:	84 c0                	test   %al,%al
    3927:	75 b8                	jne    38e1 <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    3929:	8b 45 ec             	mov    -0x14(%ebp),%eax
    392c:	8d 50 01             	lea    0x1(%eax),%edx
    392f:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3932:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    3939:	00 
      write(fd,buf,pos);
    393a:	83 ec 04             	sub    $0x4,%esp
    393d:	ff 75 ec             	pushl  -0x14(%ebp)
    3940:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3946:	50                   	push   %eax
    3947:	ff 75 e4             	pushl  -0x1c(%ebp)
    394a:	e8 d0 cc ff ff       	call   61f <write>
    394f:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    3952:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3955:	c1 e0 05             	shl    $0x5,%eax
    3958:	89 c2                	mov    %eax,%edx
    395a:	8b 45 08             	mov    0x8(%ebp),%eax
    395d:	01 d0                	add    %edx,%eax
    395f:	8b 40 18             	mov    0x18(%eax),%eax
    3962:	83 ec 0c             	sub    $0xc,%esp
    3965:	50                   	push   %eax
    3966:	e8 00 d1 ff ff       	call   a6b <free>
    396b:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    396e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3972:	8b 45 0c             	mov    0xc(%ebp),%eax
    3975:	8b 00                	mov    (%eax),%eax
    3977:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    397a:	0f 8f f3 fd ff ff    	jg     3773 <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    3980:	8b 45 0c             	mov    0xc(%ebp),%eax
    3983:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    3989:	83 ec 0c             	sub    $0xc,%esp
    398c:	ff 75 e4             	pushl  -0x1c(%ebp)
    398f:	e8 93 cc ff ff       	call   627 <close>
    3994:	83 c4 10             	add    $0x10,%esp
  return;
    3997:	90                   	nop
    3998:	c9                   	leave  
    3999:	c3                   	ret    
