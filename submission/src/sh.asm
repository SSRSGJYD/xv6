
_sh：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <init_shell>:
#include "xv_parse_command.h"
#include "xv_exec_command.h"
#include "xv_fork.h"

void init_shell(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp

}
       3:	90                   	nop
       4:	5d                   	pop    %ebp
       5:	c3                   	ret    

00000006 <exit_shell>:

void reader_loop(void);

void exit_shell(void)
{
       6:	55                   	push   %ebp
       7:	89 e5                	mov    %esp,%ebp
       9:	83 ec 08             	sub    $0x8,%esp
  exit();
       c:	e8 df 05 00 00       	call   5f0 <exit>

00000011 <main>:
}

int main(int argc, char* argv[])
{
      11:	8d 4c 24 04          	lea    0x4(%esp),%ecx
      15:	83 e4 f0             	and    $0xfffffff0,%esp
      18:	ff 71 fc             	pushl  -0x4(%ecx)
      1b:	55                   	push   %ebp
      1c:	89 e5                	mov    %esp,%ebp
      1e:	53                   	push   %ebx
      1f:	51                   	push   %ecx
      20:	81 ec a0 04 00 00    	sub    $0x4a0,%esp
      26:	89 cb                	mov    %ecx,%ebx
  //init shell
  init_shell();
      28:	e8 d3 ff ff ff       	call   0 <init_shell>

  // Read and run input commands.
  if (argc < 2) 
      2d:	83 3b 01             	cmpl   $0x1,(%ebx)
      30:	7f 05                	jg     37 <main+0x26>
  {
    exit();
      32:	e8 b9 05 00 00       	call   5f0 <exit>
  }
  //read command from files and execute
  for (int i = 1; i < argc; i++) 
      37:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      3e:	e9 db 01 00 00       	jmp    21e <main+0x20d>
  {
    int fd = open(argv[i], O_RDONLY);
      43:	8b 45 f4             	mov    -0xc(%ebp),%eax
      46:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
      4d:	8b 43 04             	mov    0x4(%ebx),%eax
      50:	01 d0                	add    %edx,%eax
      52:	8b 00                	mov    (%eax),%eax
      54:	83 ec 08             	sub    $0x8,%esp
      57:	6a 00                	push   $0x0
      59:	50                   	push   %eax
      5a:	e8 d1 05 00 00       	call   630 <open>
      5f:	83 c4 10             	add    $0x10,%esp
      62:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if (fd < 0) 
      65:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
      69:	79 41                	jns    ac <main+0x9b>
    {
      color_printf(XV_RED,1,XV_BLACK,0, "Cannot open file \"%s\" !",argv[i]);
      6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
      6e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
      75:	8b 43 04             	mov    0x4(%ebx),%eax
      78:	01 d0                	add    %edx,%eax
      7a:	8b 00                	mov    (%eax),%eax
      7c:	83 ec 08             	sub    $0x8,%esp
      7f:	50                   	push   %eax
      80:	68 90 39 00 00       	push   $0x3990
      85:	6a 00                	push   $0x0
      87:	6a 00                	push   $0x0
      89:	6a 01                	push   $0x1
      8b:	6a 04                	push   $0x4
      8d:	e8 32 2f 00 00       	call   2fc4 <color_printf>
      92:	83 c4 20             	add    $0x20,%esp
      printf(1,"\n");
      95:	83 ec 08             	sub    $0x8,%esp
      98:	68 a8 39 00 00       	push   $0x39a8
      9d:	6a 01                	push   $0x1
      9f:	e8 f8 07 00 00       	call   89c <printf>
      a4:	83 c4 10             	add    $0x10,%esp
      a7:	e9 6e 01 00 00       	jmp    21a <main+0x209>
      continue;
    }
    char filebuf[1024];
    char cmdbuf[128];
    int len = read(fd, filebuf, 1024);
      ac:	83 ec 04             	sub    $0x4,%esp
      af:	68 00 04 00 00       	push   $0x400
      b4:	8d 85 e4 fb ff ff    	lea    -0x41c(%ebp),%eax
      ba:	50                   	push   %eax
      bb:	ff 75 e8             	pushl  -0x18(%ebp)
      be:	e8 45 05 00 00       	call   608 <read>
      c3:	83 c4 10             	add    $0x10,%esp
      c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    close(fd);
      c9:	83 ec 0c             	sub    $0xc,%esp
      cc:	ff 75 e8             	pushl  -0x18(%ebp)
      cf:	e8 44 05 00 00       	call   618 <close>
      d4:	83 c4 10             	add    $0x10,%esp
    //decide if this is a sh file
    if(len < 5 || filebuf[0] != '#' || filebuf[1] != '!' || filebuf[2] != 's' || filebuf[3] != 'h'
      d7:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
      db:	7e 37                	jle    114 <main+0x103>
      dd:	0f b6 85 e4 fb ff ff 	movzbl -0x41c(%ebp),%eax
      e4:	3c 23                	cmp    $0x23,%al
      e6:	75 2c                	jne    114 <main+0x103>
      e8:	0f b6 85 e5 fb ff ff 	movzbl -0x41b(%ebp),%eax
      ef:	3c 21                	cmp    $0x21,%al
      f1:	75 21                	jne    114 <main+0x103>
      f3:	0f b6 85 e6 fb ff ff 	movzbl -0x41a(%ebp),%eax
      fa:	3c 73                	cmp    $0x73,%al
      fc:	75 16                	jne    114 <main+0x103>
      fe:	0f b6 85 e7 fb ff ff 	movzbl -0x419(%ebp),%eax
     105:	3c 68                	cmp    $0x68,%al
     107:	75 0b                	jne    114 <main+0x103>
      || filebuf[4] != '\n')
     109:	0f b6 85 e8 fb ff ff 	movzbl -0x418(%ebp),%eax
     110:	3c 0a                	cmp    $0xa,%al
     112:	74 2f                	je     143 <main+0x132>
      {
        color_printf(XV_RED,1,XV_BLACK,0, "Cannot execute by interpreter sh!");
     114:	83 ec 0c             	sub    $0xc,%esp
     117:	68 ac 39 00 00       	push   $0x39ac
     11c:	6a 00                	push   $0x0
     11e:	6a 00                	push   $0x0
     120:	6a 01                	push   $0x1
     122:	6a 04                	push   $0x4
     124:	e8 9b 2e 00 00       	call   2fc4 <color_printf>
     129:	83 c4 20             	add    $0x20,%esp
        printf(1,"\n");
     12c:	83 ec 08             	sub    $0x8,%esp
     12f:	68 a8 39 00 00       	push   $0x39a8
     134:	6a 01                	push   $0x1
     136:	e8 61 07 00 00       	call   89c <printf>
     13b:	83 c4 10             	add    $0x10,%esp
     13e:	e9 d7 00 00 00       	jmp    21a <main+0x209>
      }
    else
    {
      //find commands in turn
      int start = 5;
     143:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
      int end = 5;
     14a:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%ebp)
      while (end < len) 
     151:	e9 b8 00 00 00       	jmp    20e <main+0x1fd>
      {
        while (filebuf[end] != '\n' && filebuf[end] != '\0') 
        {
          cmdbuf[end - start] = filebuf[end];
     156:	8b 45 ec             	mov    -0x14(%ebp),%eax
     159:	2b 45 f0             	sub    -0x10(%ebp),%eax
     15c:	8d 8d e4 fb ff ff    	lea    -0x41c(%ebp),%ecx
     162:	8b 55 ec             	mov    -0x14(%ebp),%edx
     165:	01 ca                	add    %ecx,%edx
     167:	0f b6 12             	movzbl (%edx),%edx
     16a:	88 94 05 64 fb ff ff 	mov    %dl,-0x49c(%ebp,%eax,1)
          end++;
     171:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
      //find commands in turn
      int start = 5;
      int end = 5;
      while (end < len) 
      {
        while (filebuf[end] != '\n' && filebuf[end] != '\0') 
     175:	8d 95 e4 fb ff ff    	lea    -0x41c(%ebp),%edx
     17b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     17e:	01 d0                	add    %edx,%eax
     180:	0f b6 00             	movzbl (%eax),%eax
     183:	3c 0a                	cmp    $0xa,%al
     185:	74 12                	je     199 <main+0x188>
     187:	8d 95 e4 fb ff ff    	lea    -0x41c(%ebp),%edx
     18d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     190:	01 d0                	add    %edx,%eax
     192:	0f b6 00             	movzbl (%eax),%eax
     195:	84 c0                	test   %al,%al
     197:	75 bd                	jne    156 <main+0x145>
        {
          cmdbuf[end - start] = filebuf[end];
          end++;
        }
        cmdbuf[end - start] = filebuf[end];
     199:	8b 45 ec             	mov    -0x14(%ebp),%eax
     19c:	2b 45 f0             	sub    -0x10(%ebp),%eax
     19f:	8d 8d e4 fb ff ff    	lea    -0x41c(%ebp),%ecx
     1a5:	8b 55 ec             	mov    -0x14(%ebp),%edx
     1a8:	01 ca                	add    %ecx,%edx
     1aa:	0f b6 12             	movzbl (%edx),%edx
     1ad:	88 94 05 64 fb ff ff 	mov    %dl,-0x49c(%ebp,%eax,1)
        cmdbuf[end - start + 1] = '\0';
     1b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
     1b7:	2b 45 f0             	sub    -0x10(%ebp),%eax
     1ba:	83 c0 01             	add    $0x1,%eax
     1bd:	c6 84 05 64 fb ff ff 	movb   $0x0,-0x49c(%ebp,%eax,1)
     1c4:	00 
        end++;
     1c5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        if (cmdbuf[0] == '#') //comment line
     1c9:	0f b6 85 64 fb ff ff 	movzbl -0x49c(%ebp),%eax
     1d0:	3c 23                	cmp    $0x23,%al
     1d2:	75 08                	jne    1dc <main+0x1cb>
        {
          start = end;
     1d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
     1d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
          continue;
     1da:	eb 32                	jmp    20e <main+0x1fd>
        }
        start = end;
     1dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
     1df:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (fork1() == 0) 
     1e2:	e8 24 0e 00 00       	call   100b <fork1>
     1e7:	85 c0                	test   %eax,%eax
     1e9:	75 1e                	jne    209 <main+0x1f8>
        {
          runcmd(parsecmd(cmdbuf));
     1eb:	83 ec 0c             	sub    $0xc,%esp
     1ee:	8d 85 64 fb ff ff    	lea    -0x49c(%ebp),%eax
     1f4:	50                   	push   %eax
     1f5:	e8 b9 25 00 00       	call   27b3 <parsecmd>
     1fa:	83 c4 10             	add    $0x10,%esp
     1fd:	83 ec 0c             	sub    $0xc,%esp
     200:	50                   	push   %eax
     201:	e8 3f 13 00 00       	call   1545 <runcmd>
     206:	83 c4 10             	add    $0x10,%esp
        }
        wait();
     209:	e8 ea 03 00 00       	call   5f8 <wait>
    else
    {
      //find commands in turn
      int start = 5;
      int end = 5;
      while (end < len) 
     20e:	8b 45 ec             	mov    -0x14(%ebp),%eax
     211:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
     214:	0f 8c 5b ff ff ff    	jl     175 <main+0x164>
  if (argc < 2) 
  {
    exit();
  }
  //read command from files and execute
  for (int i = 1; i < argc; i++) 
     21a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     21e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     221:	3b 03                	cmp    (%ebx),%eax
     223:	0f 8c 1a fe ff ff    	jl     43 <main+0x32>
      }
    }
  }
  
  //exit shell
  exit_shell();
     229:	e8 d8 fd ff ff       	call   6 <exit_shell>
     22e:	b8 00 00 00 00       	mov    $0x0,%eax
}
     233:	8d 65 f8             	lea    -0x8(%ebp),%esp
     236:	59                   	pop    %ecx
     237:	5b                   	pop    %ebx
     238:	5d                   	pop    %ebp
     239:	8d 61 fc             	lea    -0x4(%ecx),%esp
     23c:	c3                   	ret    

0000023d <reader_loop>:

int getcmd(char *buf, int nbuf);

//read in input and process
void reader_loop()
{
     23d:	55                   	push   %ebp
     23e:	89 e5                	mov    %esp,%ebp
     240:	83 ec 18             	sub    $0x18,%esp
    static char buf[100];
    int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("xv_console", O_RDWR)) >= 0){
     243:	eb 16                	jmp    25b <reader_loop+0x1e>
    if(fd >= 3){
     245:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
     249:	7e 10                	jle    25b <reader_loop+0x1e>
      close(fd);
     24b:	83 ec 0c             	sub    $0xc,%esp
     24e:	ff 75 f4             	pushl  -0xc(%ebp)
     251:	e8 c2 03 00 00       	call   618 <close>
     256:	83 c4 10             	add    $0x10,%esp
      break;
     259:	eb 1b                	jmp    276 <reader_loop+0x39>
{
    static char buf[100];
    int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("xv_console", O_RDWR)) >= 0){
     25b:	83 ec 08             	sub    $0x8,%esp
     25e:	6a 02                	push   $0x2
     260:	68 ce 39 00 00       	push   $0x39ce
     265:	e8 c6 03 00 00       	call   630 <open>
     26a:	83 c4 10             	add    $0x10,%esp
     26d:	89 45 f4             	mov    %eax,-0xc(%ebp)
     270:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     274:	79 cf                	jns    245 <reader_loop+0x8>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     276:	e9 94 00 00 00       	jmp    30f <reader_loop+0xd2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     27b:	0f b6 05 e0 47 00 00 	movzbl 0x47e0,%eax
     282:	3c 63                	cmp    $0x63,%al
     284:	75 5f                	jne    2e5 <reader_loop+0xa8>
     286:	0f b6 05 e1 47 00 00 	movzbl 0x47e1,%eax
     28d:	3c 64                	cmp    $0x64,%al
     28f:	75 54                	jne    2e5 <reader_loop+0xa8>
     291:	0f b6 05 e2 47 00 00 	movzbl 0x47e2,%eax
     298:	3c 20                	cmp    $0x20,%al
     29a:	75 49                	jne    2e5 <reader_loop+0xa8>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     29c:	83 ec 0c             	sub    $0xc,%esp
     29f:	68 e0 47 00 00       	push   $0x47e0
     2a4:	e8 85 01 00 00       	call   42e <strlen>
     2a9:	83 c4 10             	add    $0x10,%esp
     2ac:	83 e8 01             	sub    $0x1,%eax
     2af:	c6 80 e0 47 00 00 00 	movb   $0x0,0x47e0(%eax)
      if(chdir(buf+3) < 0)
     2b6:	b8 e3 47 00 00       	mov    $0x47e3,%eax
     2bb:	83 ec 0c             	sub    $0xc,%esp
     2be:	50                   	push   %eax
     2bf:	e8 9c 03 00 00       	call   660 <chdir>
     2c4:	83 c4 10             	add    $0x10,%esp
     2c7:	85 c0                	test   %eax,%eax
     2c9:	79 44                	jns    30f <reader_loop+0xd2>
        printf(2, "cannot cd %s\n", buf+3);
     2cb:	b8 e3 47 00 00       	mov    $0x47e3,%eax
     2d0:	83 ec 04             	sub    $0x4,%esp
     2d3:	50                   	push   %eax
     2d4:	68 d9 39 00 00       	push   $0x39d9
     2d9:	6a 02                	push   $0x2
     2db:	e8 bc 05 00 00       	call   89c <printf>
     2e0:	83 c4 10             	add    $0x10,%esp
      continue;
     2e3:	eb 2a                	jmp    30f <reader_loop+0xd2>
    }
    if(fork1() == 0)
     2e5:	e8 21 0d 00 00       	call   100b <fork1>
     2ea:	85 c0                	test   %eax,%eax
     2ec:	75 1c                	jne    30a <reader_loop+0xcd>
      runcmd(parsecmd(buf));
     2ee:	83 ec 0c             	sub    $0xc,%esp
     2f1:	68 e0 47 00 00       	push   $0x47e0
     2f6:	e8 b8 24 00 00       	call   27b3 <parsecmd>
     2fb:	83 c4 10             	add    $0x10,%esp
     2fe:	83 ec 0c             	sub    $0xc,%esp
     301:	50                   	push   %eax
     302:	e8 3e 12 00 00       	call   1545 <runcmd>
     307:	83 c4 10             	add    $0x10,%esp
    wait();
     30a:	e8 e9 02 00 00       	call   5f8 <wait>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     30f:	83 ec 08             	sub    $0x8,%esp
     312:	6a 64                	push   $0x64
     314:	68 e0 47 00 00       	push   $0x47e0
     319:	e8 0e 00 00 00       	call   32c <getcmd>
     31e:	83 c4 10             	add    $0x10,%esp
     321:	85 c0                	test   %eax,%eax
     323:	0f 89 52 ff ff ff    	jns    27b <reader_loop+0x3e>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
}
     329:	90                   	nop
     32a:	c9                   	leave  
     32b:	c3                   	ret    

0000032c <getcmd>:

int getcmd(char *buf, int nbuf)
{
     32c:	55                   	push   %ebp
     32d:	89 e5                	mov    %esp,%ebp
     32f:	83 ec 08             	sub    $0x8,%esp
  color_printf(XV_YELLOW,1,XV_BLACK,0,"$");
     332:	83 ec 0c             	sub    $0xc,%esp
     335:	68 e7 39 00 00       	push   $0x39e7
     33a:	6a 00                	push   $0x0
     33c:	6a 00                	push   $0x0
     33e:	6a 01                	push   $0x1
     340:	6a 06                	push   $0x6
     342:	e8 7d 2c 00 00       	call   2fc4 <color_printf>
     347:	83 c4 20             	add    $0x20,%esp
  printf(2," ");
     34a:	83 ec 08             	sub    $0x8,%esp
     34d:	68 e9 39 00 00       	push   $0x39e9
     352:	6a 02                	push   $0x2
     354:	e8 43 05 00 00       	call   89c <printf>
     359:	83 c4 10             	add    $0x10,%esp
  memset(buf, 0, nbuf);
     35c:	8b 45 0c             	mov    0xc(%ebp),%eax
     35f:	83 ec 04             	sub    $0x4,%esp
     362:	50                   	push   %eax
     363:	6a 00                	push   $0x0
     365:	ff 75 08             	pushl  0x8(%ebp)
     368:	e8 e8 00 00 00       	call   455 <memset>
     36d:	83 c4 10             	add    $0x10,%esp
  gets(buf, nbuf);
     370:	83 ec 08             	sub    $0x8,%esp
     373:	ff 75 0c             	pushl  0xc(%ebp)
     376:	ff 75 08             	pushl  0x8(%ebp)
     379:	e8 24 01 00 00       	call   4a2 <gets>
     37e:	83 c4 10             	add    $0x10,%esp
  if(buf[0] == 0) // EOF
     381:	8b 45 08             	mov    0x8(%ebp),%eax
     384:	0f b6 00             	movzbl (%eax),%eax
     387:	84 c0                	test   %al,%al
     389:	75 07                	jne    392 <getcmd+0x66>
    return -1;
     38b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     390:	eb 05                	jmp    397 <getcmd+0x6b>
  return 0;
     392:	b8 00 00 00 00       	mov    $0x0,%eax
}
     397:	c9                   	leave  
     398:	c3                   	ret    

00000399 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     399:	55                   	push   %ebp
     39a:	89 e5                	mov    %esp,%ebp
     39c:	57                   	push   %edi
     39d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     39e:	8b 4d 08             	mov    0x8(%ebp),%ecx
     3a1:	8b 55 10             	mov    0x10(%ebp),%edx
     3a4:	8b 45 0c             	mov    0xc(%ebp),%eax
     3a7:	89 cb                	mov    %ecx,%ebx
     3a9:	89 df                	mov    %ebx,%edi
     3ab:	89 d1                	mov    %edx,%ecx
     3ad:	fc                   	cld    
     3ae:	f3 aa                	rep stos %al,%es:(%edi)
     3b0:	89 ca                	mov    %ecx,%edx
     3b2:	89 fb                	mov    %edi,%ebx
     3b4:	89 5d 08             	mov    %ebx,0x8(%ebp)
     3b7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     3ba:	90                   	nop
     3bb:	5b                   	pop    %ebx
     3bc:	5f                   	pop    %edi
     3bd:	5d                   	pop    %ebp
     3be:	c3                   	ret    

000003bf <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     3bf:	55                   	push   %ebp
     3c0:	89 e5                	mov    %esp,%ebp
     3c2:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     3c5:	8b 45 08             	mov    0x8(%ebp),%eax
     3c8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     3cb:	90                   	nop
     3cc:	8b 45 08             	mov    0x8(%ebp),%eax
     3cf:	8d 50 01             	lea    0x1(%eax),%edx
     3d2:	89 55 08             	mov    %edx,0x8(%ebp)
     3d5:	8b 55 0c             	mov    0xc(%ebp),%edx
     3d8:	8d 4a 01             	lea    0x1(%edx),%ecx
     3db:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     3de:	0f b6 12             	movzbl (%edx),%edx
     3e1:	88 10                	mov    %dl,(%eax)
     3e3:	0f b6 00             	movzbl (%eax),%eax
     3e6:	84 c0                	test   %al,%al
     3e8:	75 e2                	jne    3cc <strcpy+0xd>
    ;
  return os;
     3ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     3ed:	c9                   	leave  
     3ee:	c3                   	ret    

000003ef <strcmp>:

int
strcmp(const char *p, const char *q)
{
     3ef:	55                   	push   %ebp
     3f0:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     3f2:	eb 08                	jmp    3fc <strcmp+0xd>
    p++, q++;
     3f4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     3f8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     3fc:	8b 45 08             	mov    0x8(%ebp),%eax
     3ff:	0f b6 00             	movzbl (%eax),%eax
     402:	84 c0                	test   %al,%al
     404:	74 10                	je     416 <strcmp+0x27>
     406:	8b 45 08             	mov    0x8(%ebp),%eax
     409:	0f b6 10             	movzbl (%eax),%edx
     40c:	8b 45 0c             	mov    0xc(%ebp),%eax
     40f:	0f b6 00             	movzbl (%eax),%eax
     412:	38 c2                	cmp    %al,%dl
     414:	74 de                	je     3f4 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     416:	8b 45 08             	mov    0x8(%ebp),%eax
     419:	0f b6 00             	movzbl (%eax),%eax
     41c:	0f b6 d0             	movzbl %al,%edx
     41f:	8b 45 0c             	mov    0xc(%ebp),%eax
     422:	0f b6 00             	movzbl (%eax),%eax
     425:	0f b6 c0             	movzbl %al,%eax
     428:	29 c2                	sub    %eax,%edx
     42a:	89 d0                	mov    %edx,%eax
}
     42c:	5d                   	pop    %ebp
     42d:	c3                   	ret    

0000042e <strlen>:

uint
strlen(char *s)
{
     42e:	55                   	push   %ebp
     42f:	89 e5                	mov    %esp,%ebp
     431:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     434:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     43b:	eb 04                	jmp    441 <strlen+0x13>
     43d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     441:	8b 55 fc             	mov    -0x4(%ebp),%edx
     444:	8b 45 08             	mov    0x8(%ebp),%eax
     447:	01 d0                	add    %edx,%eax
     449:	0f b6 00             	movzbl (%eax),%eax
     44c:	84 c0                	test   %al,%al
     44e:	75 ed                	jne    43d <strlen+0xf>
    ;
  return n;
     450:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     453:	c9                   	leave  
     454:	c3                   	ret    

00000455 <memset>:

void*
memset(void *dst, int c, uint n)
{
     455:	55                   	push   %ebp
     456:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     458:	8b 45 10             	mov    0x10(%ebp),%eax
     45b:	50                   	push   %eax
     45c:	ff 75 0c             	pushl  0xc(%ebp)
     45f:	ff 75 08             	pushl  0x8(%ebp)
     462:	e8 32 ff ff ff       	call   399 <stosb>
     467:	83 c4 0c             	add    $0xc,%esp
  return dst;
     46a:	8b 45 08             	mov    0x8(%ebp),%eax
}
     46d:	c9                   	leave  
     46e:	c3                   	ret    

0000046f <strchr>:

char*
strchr(const char *s, char c)
{
     46f:	55                   	push   %ebp
     470:	89 e5                	mov    %esp,%ebp
     472:	83 ec 04             	sub    $0x4,%esp
     475:	8b 45 0c             	mov    0xc(%ebp),%eax
     478:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     47b:	eb 14                	jmp    491 <strchr+0x22>
    if(*s == c)
     47d:	8b 45 08             	mov    0x8(%ebp),%eax
     480:	0f b6 00             	movzbl (%eax),%eax
     483:	3a 45 fc             	cmp    -0x4(%ebp),%al
     486:	75 05                	jne    48d <strchr+0x1e>
      return (char*)s;
     488:	8b 45 08             	mov    0x8(%ebp),%eax
     48b:	eb 13                	jmp    4a0 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     48d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     491:	8b 45 08             	mov    0x8(%ebp),%eax
     494:	0f b6 00             	movzbl (%eax),%eax
     497:	84 c0                	test   %al,%al
     499:	75 e2                	jne    47d <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     49b:	b8 00 00 00 00       	mov    $0x0,%eax
}
     4a0:	c9                   	leave  
     4a1:	c3                   	ret    

000004a2 <gets>:

char*
gets(char *buf, int max)
{
     4a2:	55                   	push   %ebp
     4a3:	89 e5                	mov    %esp,%ebp
     4a5:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     4a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     4af:	eb 42                	jmp    4f3 <gets+0x51>
    cc = read(0, &c, 1);
     4b1:	83 ec 04             	sub    $0x4,%esp
     4b4:	6a 01                	push   $0x1
     4b6:	8d 45 ef             	lea    -0x11(%ebp),%eax
     4b9:	50                   	push   %eax
     4ba:	6a 00                	push   $0x0
     4bc:	e8 47 01 00 00       	call   608 <read>
     4c1:	83 c4 10             	add    $0x10,%esp
     4c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     4c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     4cb:	7e 33                	jle    500 <gets+0x5e>
      break;
    buf[i++] = c;
     4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4d0:	8d 50 01             	lea    0x1(%eax),%edx
     4d3:	89 55 f4             	mov    %edx,-0xc(%ebp)
     4d6:	89 c2                	mov    %eax,%edx
     4d8:	8b 45 08             	mov    0x8(%ebp),%eax
     4db:	01 c2                	add    %eax,%edx
     4dd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     4e1:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     4e3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     4e7:	3c 0a                	cmp    $0xa,%al
     4e9:	74 16                	je     501 <gets+0x5f>
     4eb:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     4ef:	3c 0d                	cmp    $0xd,%al
     4f1:	74 0e                	je     501 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     4f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4f6:	83 c0 01             	add    $0x1,%eax
     4f9:	3b 45 0c             	cmp    0xc(%ebp),%eax
     4fc:	7c b3                	jl     4b1 <gets+0xf>
     4fe:	eb 01                	jmp    501 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     500:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     501:	8b 55 f4             	mov    -0xc(%ebp),%edx
     504:	8b 45 08             	mov    0x8(%ebp),%eax
     507:	01 d0                	add    %edx,%eax
     509:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     50c:	8b 45 08             	mov    0x8(%ebp),%eax
}
     50f:	c9                   	leave  
     510:	c3                   	ret    

00000511 <stat>:

int
stat(char *n, struct stat *st)
{
     511:	55                   	push   %ebp
     512:	89 e5                	mov    %esp,%ebp
     514:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     517:	83 ec 08             	sub    $0x8,%esp
     51a:	6a 00                	push   $0x0
     51c:	ff 75 08             	pushl  0x8(%ebp)
     51f:	e8 0c 01 00 00       	call   630 <open>
     524:	83 c4 10             	add    $0x10,%esp
     527:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     52a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     52e:	79 07                	jns    537 <stat+0x26>
    return -1;
     530:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     535:	eb 25                	jmp    55c <stat+0x4b>
  r = fstat(fd, st);
     537:	83 ec 08             	sub    $0x8,%esp
     53a:	ff 75 0c             	pushl  0xc(%ebp)
     53d:	ff 75 f4             	pushl  -0xc(%ebp)
     540:	e8 03 01 00 00       	call   648 <fstat>
     545:	83 c4 10             	add    $0x10,%esp
     548:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     54b:	83 ec 0c             	sub    $0xc,%esp
     54e:	ff 75 f4             	pushl  -0xc(%ebp)
     551:	e8 c2 00 00 00       	call   618 <close>
     556:	83 c4 10             	add    $0x10,%esp
  return r;
     559:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     55c:	c9                   	leave  
     55d:	c3                   	ret    

0000055e <atoi>:

int
atoi(const char *s)
{
     55e:	55                   	push   %ebp
     55f:	89 e5                	mov    %esp,%ebp
     561:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     564:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     56b:	eb 25                	jmp    592 <atoi+0x34>
    n = n*10 + *s++ - '0';
     56d:	8b 55 fc             	mov    -0x4(%ebp),%edx
     570:	89 d0                	mov    %edx,%eax
     572:	c1 e0 02             	shl    $0x2,%eax
     575:	01 d0                	add    %edx,%eax
     577:	01 c0                	add    %eax,%eax
     579:	89 c1                	mov    %eax,%ecx
     57b:	8b 45 08             	mov    0x8(%ebp),%eax
     57e:	8d 50 01             	lea    0x1(%eax),%edx
     581:	89 55 08             	mov    %edx,0x8(%ebp)
     584:	0f b6 00             	movzbl (%eax),%eax
     587:	0f be c0             	movsbl %al,%eax
     58a:	01 c8                	add    %ecx,%eax
     58c:	83 e8 30             	sub    $0x30,%eax
     58f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     592:	8b 45 08             	mov    0x8(%ebp),%eax
     595:	0f b6 00             	movzbl (%eax),%eax
     598:	3c 2f                	cmp    $0x2f,%al
     59a:	7e 0a                	jle    5a6 <atoi+0x48>
     59c:	8b 45 08             	mov    0x8(%ebp),%eax
     59f:	0f b6 00             	movzbl (%eax),%eax
     5a2:	3c 39                	cmp    $0x39,%al
     5a4:	7e c7                	jle    56d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     5a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     5a9:	c9                   	leave  
     5aa:	c3                   	ret    

000005ab <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     5ab:	55                   	push   %ebp
     5ac:	89 e5                	mov    %esp,%ebp
     5ae:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     5b1:	8b 45 08             	mov    0x8(%ebp),%eax
     5b4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     5b7:	8b 45 0c             	mov    0xc(%ebp),%eax
     5ba:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     5bd:	eb 17                	jmp    5d6 <memmove+0x2b>
    *dst++ = *src++;
     5bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
     5c2:	8d 50 01             	lea    0x1(%eax),%edx
     5c5:	89 55 fc             	mov    %edx,-0x4(%ebp)
     5c8:	8b 55 f8             	mov    -0x8(%ebp),%edx
     5cb:	8d 4a 01             	lea    0x1(%edx),%ecx
     5ce:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     5d1:	0f b6 12             	movzbl (%edx),%edx
     5d4:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     5d6:	8b 45 10             	mov    0x10(%ebp),%eax
     5d9:	8d 50 ff             	lea    -0x1(%eax),%edx
     5dc:	89 55 10             	mov    %edx,0x10(%ebp)
     5df:	85 c0                	test   %eax,%eax
     5e1:	7f dc                	jg     5bf <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     5e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
     5e6:	c9                   	leave  
     5e7:	c3                   	ret    

000005e8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     5e8:	b8 01 00 00 00       	mov    $0x1,%eax
     5ed:	cd 40                	int    $0x40
     5ef:	c3                   	ret    

000005f0 <exit>:
SYSCALL(exit)
     5f0:	b8 02 00 00 00       	mov    $0x2,%eax
     5f5:	cd 40                	int    $0x40
     5f7:	c3                   	ret    

000005f8 <wait>:
SYSCALL(wait)
     5f8:	b8 03 00 00 00       	mov    $0x3,%eax
     5fd:	cd 40                	int    $0x40
     5ff:	c3                   	ret    

00000600 <pipe>:
SYSCALL(pipe)
     600:	b8 04 00 00 00       	mov    $0x4,%eax
     605:	cd 40                	int    $0x40
     607:	c3                   	ret    

00000608 <read>:
SYSCALL(read)
     608:	b8 05 00 00 00       	mov    $0x5,%eax
     60d:	cd 40                	int    $0x40
     60f:	c3                   	ret    

00000610 <write>:
SYSCALL(write)
     610:	b8 10 00 00 00       	mov    $0x10,%eax
     615:	cd 40                	int    $0x40
     617:	c3                   	ret    

00000618 <close>:
SYSCALL(close)
     618:	b8 15 00 00 00       	mov    $0x15,%eax
     61d:	cd 40                	int    $0x40
     61f:	c3                   	ret    

00000620 <kill>:
SYSCALL(kill)
     620:	b8 06 00 00 00       	mov    $0x6,%eax
     625:	cd 40                	int    $0x40
     627:	c3                   	ret    

00000628 <exec>:
SYSCALL(exec)
     628:	b8 07 00 00 00       	mov    $0x7,%eax
     62d:	cd 40                	int    $0x40
     62f:	c3                   	ret    

00000630 <open>:
SYSCALL(open)
     630:	b8 0f 00 00 00       	mov    $0xf,%eax
     635:	cd 40                	int    $0x40
     637:	c3                   	ret    

00000638 <mknod>:
SYSCALL(mknod)
     638:	b8 11 00 00 00       	mov    $0x11,%eax
     63d:	cd 40                	int    $0x40
     63f:	c3                   	ret    

00000640 <unlink>:
SYSCALL(unlink)
     640:	b8 12 00 00 00       	mov    $0x12,%eax
     645:	cd 40                	int    $0x40
     647:	c3                   	ret    

00000648 <fstat>:
SYSCALL(fstat)
     648:	b8 08 00 00 00       	mov    $0x8,%eax
     64d:	cd 40                	int    $0x40
     64f:	c3                   	ret    

00000650 <link>:
SYSCALL(link)
     650:	b8 13 00 00 00       	mov    $0x13,%eax
     655:	cd 40                	int    $0x40
     657:	c3                   	ret    

00000658 <mkdir>:
SYSCALL(mkdir)
     658:	b8 14 00 00 00       	mov    $0x14,%eax
     65d:	cd 40                	int    $0x40
     65f:	c3                   	ret    

00000660 <chdir>:
SYSCALL(chdir)
     660:	b8 09 00 00 00       	mov    $0x9,%eax
     665:	cd 40                	int    $0x40
     667:	c3                   	ret    

00000668 <dup>:
SYSCALL(dup)
     668:	b8 0a 00 00 00       	mov    $0xa,%eax
     66d:	cd 40                	int    $0x40
     66f:	c3                   	ret    

00000670 <getpid>:
SYSCALL(getpid)
     670:	b8 0b 00 00 00       	mov    $0xb,%eax
     675:	cd 40                	int    $0x40
     677:	c3                   	ret    

00000678 <sbrk>:
SYSCALL(sbrk)
     678:	b8 0c 00 00 00       	mov    $0xc,%eax
     67d:	cd 40                	int    $0x40
     67f:	c3                   	ret    

00000680 <sleep>:
SYSCALL(sleep)
     680:	b8 0d 00 00 00       	mov    $0xd,%eax
     685:	cd 40                	int    $0x40
     687:	c3                   	ret    

00000688 <uptime>:
SYSCALL(uptime)
     688:	b8 0e 00 00 00       	mov    $0xe,%eax
     68d:	cd 40                	int    $0x40
     68f:	c3                   	ret    

00000690 <colorwrite>:

//new here
SYSCALL(colorwrite)
     690:	b8 16 00 00 00       	mov    $0x16,%eax
     695:	cd 40                	int    $0x40
     697:	c3                   	ret    

00000698 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     698:	55                   	push   %ebp
     699:	89 e5                	mov    %esp,%ebp
     69b:	83 ec 18             	sub    $0x18,%esp
     69e:	8b 45 0c             	mov    0xc(%ebp),%eax
     6a1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     6a4:	83 ec 04             	sub    $0x4,%esp
     6a7:	6a 01                	push   $0x1
     6a9:	8d 45 f4             	lea    -0xc(%ebp),%eax
     6ac:	50                   	push   %eax
     6ad:	ff 75 08             	pushl  0x8(%ebp)
     6b0:	e8 5b ff ff ff       	call   610 <write>
     6b5:	83 c4 10             	add    $0x10,%esp
}
     6b8:	90                   	nop
     6b9:	c9                   	leave  
     6ba:	c3                   	ret    

000006bb <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     6bb:	55                   	push   %ebp
     6bc:	89 e5                	mov    %esp,%ebp
     6be:	53                   	push   %ebx
     6bf:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     6c2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     6c9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     6cd:	74 17                	je     6e6 <printint+0x2b>
     6cf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     6d3:	79 11                	jns    6e6 <printint+0x2b>
    neg = 1;
     6d5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     6dc:	8b 45 0c             	mov    0xc(%ebp),%eax
     6df:	f7 d8                	neg    %eax
     6e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
     6e4:	eb 06                	jmp    6ec <printint+0x31>
  } else {
    x = xx;
     6e6:	8b 45 0c             	mov    0xc(%ebp),%eax
     6e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     6ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     6f3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     6f6:	8d 41 01             	lea    0x1(%ecx),%eax
     6f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
     6fc:	8b 5d 10             	mov    0x10(%ebp),%ebx
     6ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
     702:	ba 00 00 00 00       	mov    $0x0,%edx
     707:	f7 f3                	div    %ebx
     709:	89 d0                	mov    %edx,%eax
     70b:	0f b6 80 a0 46 00 00 	movzbl 0x46a0(%eax),%eax
     712:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     716:	8b 5d 10             	mov    0x10(%ebp),%ebx
     719:	8b 45 ec             	mov    -0x14(%ebp),%eax
     71c:	ba 00 00 00 00       	mov    $0x0,%edx
     721:	f7 f3                	div    %ebx
     723:	89 45 ec             	mov    %eax,-0x14(%ebp)
     726:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     72a:	75 c7                	jne    6f3 <printint+0x38>
  if(neg)
     72c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     730:	74 2d                	je     75f <printint+0xa4>
    buf[i++] = '-';
     732:	8b 45 f4             	mov    -0xc(%ebp),%eax
     735:	8d 50 01             	lea    0x1(%eax),%edx
     738:	89 55 f4             	mov    %edx,-0xc(%ebp)
     73b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     740:	eb 1d                	jmp    75f <printint+0xa4>
    putc(fd, buf[i]);
     742:	8d 55 dc             	lea    -0x24(%ebp),%edx
     745:	8b 45 f4             	mov    -0xc(%ebp),%eax
     748:	01 d0                	add    %edx,%eax
     74a:	0f b6 00             	movzbl (%eax),%eax
     74d:	0f be c0             	movsbl %al,%eax
     750:	83 ec 08             	sub    $0x8,%esp
     753:	50                   	push   %eax
     754:	ff 75 08             	pushl  0x8(%ebp)
     757:	e8 3c ff ff ff       	call   698 <putc>
     75c:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     75f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     763:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     767:	79 d9                	jns    742 <printint+0x87>
    putc(fd, buf[i]);
}
     769:	90                   	nop
     76a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     76d:	c9                   	leave  
     76e:	c3                   	ret    

0000076f <getInteger>:

static int getInteger(double num)
{
     76f:	55                   	push   %ebp
     770:	89 e5                	mov    %esp,%ebp
     772:	83 ec 18             	sub    $0x18,%esp
     775:	8b 45 08             	mov    0x8(%ebp),%eax
     778:	89 45 e8             	mov    %eax,-0x18(%ebp)
     77b:	8b 45 0c             	mov    0xc(%ebp),%eax
     77e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     781:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     788:	eb 0e                	jmp    798 <getInteger+0x29>
  {
    num -= 1;
     78a:	dd 45 e8             	fldl   -0x18(%ebp)
     78d:	d9 e8                	fld1   
     78f:	de e9                	fsubrp %st,%st(1)
     791:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     794:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     798:	dd 45 e8             	fldl   -0x18(%ebp)
     79b:	d9 e8                	fld1   
     79d:	d9 c9                	fxch   %st(1)
     79f:	df e9                	fucomip %st(1),%st
     7a1:	dd d8                	fstp   %st(0)
     7a3:	77 e5                	ja     78a <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     7a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     7a8:	c9                   	leave  
     7a9:	c3                   	ret    

000007aa <printdbl>:

void printdbl(int fd, double num)
{
     7aa:	55                   	push   %ebp
     7ab:	89 e5                	mov    %esp,%ebp
     7ad:	83 ec 28             	sub    $0x28,%esp
     7b0:	8b 45 0c             	mov    0xc(%ebp),%eax
     7b3:	89 45 e0             	mov    %eax,-0x20(%ebp)
     7b6:	8b 45 10             	mov    0x10(%ebp),%eax
     7b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     7bc:	d9 ee                	fldz   
     7be:	dd 45 e0             	fldl   -0x20(%ebp)
     7c1:	d9 c9                	fxch   %st(1)
     7c3:	df e9                	fucomip %st(1),%st
     7c5:	dd d8                	fstp   %st(0)
     7c7:	76 18                	jbe    7e1 <printdbl+0x37>
  {
    putc(fd,'-');
     7c9:	83 ec 08             	sub    $0x8,%esp
     7cc:	6a 2d                	push   $0x2d
     7ce:	ff 75 08             	pushl  0x8(%ebp)
     7d1:	e8 c2 fe ff ff       	call   698 <putc>
     7d6:	83 c4 10             	add    $0x10,%esp
    num = -num;
     7d9:	dd 45 e0             	fldl   -0x20(%ebp)
     7dc:	d9 e0                	fchs   
     7de:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     7e1:	83 ec 08             	sub    $0x8,%esp
     7e4:	ff 75 e4             	pushl  -0x1c(%ebp)
     7e7:	ff 75 e0             	pushl  -0x20(%ebp)
     7ea:	e8 80 ff ff ff       	call   76f <getInteger>
     7ef:	83 c4 10             	add    $0x10,%esp
     7f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     7f5:	6a 01                	push   $0x1
     7f7:	6a 0a                	push   $0xa
     7f9:	ff 75 f0             	pushl  -0x10(%ebp)
     7fc:	ff 75 08             	pushl  0x8(%ebp)
     7ff:	e8 b7 fe ff ff       	call   6bb <printint>
     804:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     807:	db 45 f0             	fildl  -0x10(%ebp)
     80a:	dd 45 e0             	fldl   -0x20(%ebp)
     80d:	de e1                	fsubp  %st,%st(1)
     80f:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     812:	dd 45 e0             	fldl   -0x20(%ebp)
     815:	dd 05 f8 39 00 00    	fldl   0x39f8
     81b:	d9 c9                	fxch   %st(1)
     81d:	df e9                	fucomip %st(1),%st
     81f:	dd d8                	fstp   %st(0)
     821:	76 10                	jbe    833 <printdbl+0x89>
    putc(fd,'.');
     823:	83 ec 08             	sub    $0x8,%esp
     826:	6a 2e                	push   $0x2e
     828:	ff 75 08             	pushl  0x8(%ebp)
     82b:	e8 68 fe ff ff       	call   698 <putc>
     830:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     833:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     83a:	eb 49                	jmp    885 <printdbl+0xdb>
  {
    num = num*10;
     83c:	dd 45 e0             	fldl   -0x20(%ebp)
     83f:	dd 05 00 3a 00 00    	fldl   0x3a00
     845:	de c9                	fmulp  %st,%st(1)
     847:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     84a:	83 ec 08             	sub    $0x8,%esp
     84d:	ff 75 e4             	pushl  -0x1c(%ebp)
     850:	ff 75 e0             	pushl  -0x20(%ebp)
     853:	e8 17 ff ff ff       	call   76f <getInteger>
     858:	83 c4 10             	add    $0x10,%esp
     85b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     85e:	6a 01                	push   $0x1
     860:	6a 0a                	push   $0xa
     862:	ff 75 f0             	pushl  -0x10(%ebp)
     865:	ff 75 08             	pushl  0x8(%ebp)
     868:	e8 4e fe ff ff       	call   6bb <printint>
     86d:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     870:	db 45 f0             	fildl  -0x10(%ebp)
     873:	dd 45 e0             	fldl   -0x20(%ebp)
     876:	de e1                	fsubp  %st,%st(1)
     878:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     87b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     87f:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     883:	7f 13                	jg     898 <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     885:	dd 45 e0             	fldl   -0x20(%ebp)
     888:	dd 05 f8 39 00 00    	fldl   0x39f8
     88e:	d9 c9                	fxch   %st(1)
     890:	df e9                	fucomip %st(1),%st
     892:	dd d8                	fstp   %st(0)
     894:	77 a6                	ja     83c <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     896:	eb 01                	jmp    899 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     898:	90                   	nop
    }
  }
}
     899:	90                   	nop
     89a:	c9                   	leave  
     89b:	c3                   	ret    

0000089c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     89c:	55                   	push   %ebp
     89d:	89 e5                	mov    %esp,%ebp
     89f:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     8a2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     8a9:	8d 45 0c             	lea    0xc(%ebp),%eax
     8ac:	83 c0 04             	add    $0x4,%eax
     8af:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     8b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     8b9:	e9 88 01 00 00       	jmp    a46 <printf+0x1aa>
    c = fmt[i] & 0xff;
     8be:	8b 55 0c             	mov    0xc(%ebp),%edx
     8c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8c4:	01 d0                	add    %edx,%eax
     8c6:	0f b6 00             	movzbl (%eax),%eax
     8c9:	0f be c0             	movsbl %al,%eax
     8cc:	25 ff 00 00 00       	and    $0xff,%eax
     8d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     8d4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     8d8:	75 2c                	jne    906 <printf+0x6a>
      if(c == '%'){
     8da:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     8de:	75 0c                	jne    8ec <printf+0x50>
        state = '%';
     8e0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     8e7:	e9 56 01 00 00       	jmp    a42 <printf+0x1a6>
      } else {
        putc(fd, c);
     8ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8ef:	0f be c0             	movsbl %al,%eax
     8f2:	83 ec 08             	sub    $0x8,%esp
     8f5:	50                   	push   %eax
     8f6:	ff 75 08             	pushl  0x8(%ebp)
     8f9:	e8 9a fd ff ff       	call   698 <putc>
     8fe:	83 c4 10             	add    $0x10,%esp
     901:	e9 3c 01 00 00       	jmp    a42 <printf+0x1a6>
      }
    } else if(state == '%'){
     906:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     90a:	0f 85 32 01 00 00    	jne    a42 <printf+0x1a6>
      if(c == 'd'){
     910:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     914:	75 1e                	jne    934 <printf+0x98>
        printint(fd, *ap, 10, 1);
     916:	8b 45 e8             	mov    -0x18(%ebp),%eax
     919:	8b 00                	mov    (%eax),%eax
     91b:	6a 01                	push   $0x1
     91d:	6a 0a                	push   $0xa
     91f:	50                   	push   %eax
     920:	ff 75 08             	pushl  0x8(%ebp)
     923:	e8 93 fd ff ff       	call   6bb <printint>
     928:	83 c4 10             	add    $0x10,%esp
        ap++;
     92b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     92f:	e9 07 01 00 00       	jmp    a3b <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     934:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     938:	74 06                	je     940 <printf+0xa4>
     93a:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     93e:	75 1e                	jne    95e <printf+0xc2>
        printint(fd, *ap, 16, 0);
     940:	8b 45 e8             	mov    -0x18(%ebp),%eax
     943:	8b 00                	mov    (%eax),%eax
     945:	6a 00                	push   $0x0
     947:	6a 10                	push   $0x10
     949:	50                   	push   %eax
     94a:	ff 75 08             	pushl  0x8(%ebp)
     94d:	e8 69 fd ff ff       	call   6bb <printint>
     952:	83 c4 10             	add    $0x10,%esp
        ap++;
     955:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     959:	e9 dd 00 00 00       	jmp    a3b <printf+0x19f>
      } else if(c == 's'){
     95e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     962:	75 46                	jne    9aa <printf+0x10e>
        s = (char*)*ap;
     964:	8b 45 e8             	mov    -0x18(%ebp),%eax
     967:	8b 00                	mov    (%eax),%eax
     969:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     96c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     970:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     974:	75 25                	jne    99b <printf+0xff>
          s = "(null)";
     976:	c7 45 f4 f0 39 00 00 	movl   $0x39f0,-0xc(%ebp)
        while(*s != 0){
     97d:	eb 1c                	jmp    99b <printf+0xff>
          putc(fd, *s);
     97f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     982:	0f b6 00             	movzbl (%eax),%eax
     985:	0f be c0             	movsbl %al,%eax
     988:	83 ec 08             	sub    $0x8,%esp
     98b:	50                   	push   %eax
     98c:	ff 75 08             	pushl  0x8(%ebp)
     98f:	e8 04 fd ff ff       	call   698 <putc>
     994:	83 c4 10             	add    $0x10,%esp
          s++;
     997:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     99b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     99e:	0f b6 00             	movzbl (%eax),%eax
     9a1:	84 c0                	test   %al,%al
     9a3:	75 da                	jne    97f <printf+0xe3>
     9a5:	e9 91 00 00 00       	jmp    a3b <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     9aa:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     9ae:	75 1d                	jne    9cd <printf+0x131>
        putc(fd, *ap);
     9b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
     9b3:	8b 00                	mov    (%eax),%eax
     9b5:	0f be c0             	movsbl %al,%eax
     9b8:	83 ec 08             	sub    $0x8,%esp
     9bb:	50                   	push   %eax
     9bc:	ff 75 08             	pushl  0x8(%ebp)
     9bf:	e8 d4 fc ff ff       	call   698 <putc>
     9c4:	83 c4 10             	add    $0x10,%esp
        ap++;
     9c7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     9cb:	eb 6e                	jmp    a3b <printf+0x19f>
      } else if(c == '%'){
     9cd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     9d1:	75 17                	jne    9ea <printf+0x14e>
        putc(fd, c);
     9d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9d6:	0f be c0             	movsbl %al,%eax
     9d9:	83 ec 08             	sub    $0x8,%esp
     9dc:	50                   	push   %eax
     9dd:	ff 75 08             	pushl  0x8(%ebp)
     9e0:	e8 b3 fc ff ff       	call   698 <putc>
     9e5:	83 c4 10             	add    $0x10,%esp
     9e8:	eb 51                	jmp    a3b <printf+0x19f>
      } else if(c == 'f'){ //for double
     9ea:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     9ee:	75 26                	jne    a16 <printf+0x17a>
        double *dap = (double*)ap;
     9f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
     9f3:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     9f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
     9f9:	dd 00                	fldl   (%eax)
     9fb:	83 ec 04             	sub    $0x4,%esp
     9fe:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     a02:	dd 1c 24             	fstpl  (%esp)
     a05:	ff 75 08             	pushl  0x8(%ebp)
     a08:	e8 9d fd ff ff       	call   7aa <printdbl>
     a0d:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     a10:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     a14:	eb 25                	jmp    a3b <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     a16:	83 ec 08             	sub    $0x8,%esp
     a19:	6a 25                	push   $0x25
     a1b:	ff 75 08             	pushl  0x8(%ebp)
     a1e:	e8 75 fc ff ff       	call   698 <putc>
     a23:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     a26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a29:	0f be c0             	movsbl %al,%eax
     a2c:	83 ec 08             	sub    $0x8,%esp
     a2f:	50                   	push   %eax
     a30:	ff 75 08             	pushl  0x8(%ebp)
     a33:	e8 60 fc ff ff       	call   698 <putc>
     a38:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     a3b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     a42:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     a46:	8b 55 0c             	mov    0xc(%ebp),%edx
     a49:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a4c:	01 d0                	add    %edx,%eax
     a4e:	0f b6 00             	movzbl (%eax),%eax
     a51:	84 c0                	test   %al,%al
     a53:	0f 85 65 fe ff ff    	jne    8be <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     a59:	90                   	nop
     a5a:	c9                   	leave  
     a5b:	c3                   	ret    

00000a5c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     a5c:	55                   	push   %ebp
     a5d:	89 e5                	mov    %esp,%ebp
     a5f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     a62:	8b 45 08             	mov    0x8(%ebp),%eax
     a65:	83 e8 08             	sub    $0x8,%eax
     a68:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     a6b:	a1 4c 48 00 00       	mov    0x484c,%eax
     a70:	89 45 fc             	mov    %eax,-0x4(%ebp)
     a73:	eb 24                	jmp    a99 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     a75:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a78:	8b 00                	mov    (%eax),%eax
     a7a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     a7d:	77 12                	ja     a91 <free+0x35>
     a7f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a82:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     a85:	77 24                	ja     aab <free+0x4f>
     a87:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a8a:	8b 00                	mov    (%eax),%eax
     a8c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     a8f:	77 1a                	ja     aab <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     a91:	8b 45 fc             	mov    -0x4(%ebp),%eax
     a94:	8b 00                	mov    (%eax),%eax
     a96:	89 45 fc             	mov    %eax,-0x4(%ebp)
     a99:	8b 45 f8             	mov    -0x8(%ebp),%eax
     a9c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     a9f:	76 d4                	jbe    a75 <free+0x19>
     aa1:	8b 45 fc             	mov    -0x4(%ebp),%eax
     aa4:	8b 00                	mov    (%eax),%eax
     aa6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     aa9:	76 ca                	jbe    a75 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     aab:	8b 45 f8             	mov    -0x8(%ebp),%eax
     aae:	8b 40 04             	mov    0x4(%eax),%eax
     ab1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     ab8:	8b 45 f8             	mov    -0x8(%ebp),%eax
     abb:	01 c2                	add    %eax,%edx
     abd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ac0:	8b 00                	mov    (%eax),%eax
     ac2:	39 c2                	cmp    %eax,%edx
     ac4:	75 24                	jne    aea <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     ac6:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ac9:	8b 50 04             	mov    0x4(%eax),%edx
     acc:	8b 45 fc             	mov    -0x4(%ebp),%eax
     acf:	8b 00                	mov    (%eax),%eax
     ad1:	8b 40 04             	mov    0x4(%eax),%eax
     ad4:	01 c2                	add    %eax,%edx
     ad6:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ad9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     adc:	8b 45 fc             	mov    -0x4(%ebp),%eax
     adf:	8b 00                	mov    (%eax),%eax
     ae1:	8b 10                	mov    (%eax),%edx
     ae3:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ae6:	89 10                	mov    %edx,(%eax)
     ae8:	eb 0a                	jmp    af4 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     aea:	8b 45 fc             	mov    -0x4(%ebp),%eax
     aed:	8b 10                	mov    (%eax),%edx
     aef:	8b 45 f8             	mov    -0x8(%ebp),%eax
     af2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     af4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     af7:	8b 40 04             	mov    0x4(%eax),%eax
     afa:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     b01:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b04:	01 d0                	add    %edx,%eax
     b06:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     b09:	75 20                	jne    b2b <free+0xcf>
    p->s.size += bp->s.size;
     b0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b0e:	8b 50 04             	mov    0x4(%eax),%edx
     b11:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b14:	8b 40 04             	mov    0x4(%eax),%eax
     b17:	01 c2                	add    %eax,%edx
     b19:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b1c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     b1f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b22:	8b 10                	mov    (%eax),%edx
     b24:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b27:	89 10                	mov    %edx,(%eax)
     b29:	eb 08                	jmp    b33 <free+0xd7>
  } else
    p->s.ptr = bp;
     b2b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b2e:	8b 55 f8             	mov    -0x8(%ebp),%edx
     b31:	89 10                	mov    %edx,(%eax)
  freep = p;
     b33:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b36:	a3 4c 48 00 00       	mov    %eax,0x484c
}
     b3b:	90                   	nop
     b3c:	c9                   	leave  
     b3d:	c3                   	ret    

00000b3e <morecore>:

static Header*
morecore(uint nu)
{
     b3e:	55                   	push   %ebp
     b3f:	89 e5                	mov    %esp,%ebp
     b41:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     b44:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     b4b:	77 07                	ja     b54 <morecore+0x16>
    nu = 4096;
     b4d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     b54:	8b 45 08             	mov    0x8(%ebp),%eax
     b57:	c1 e0 03             	shl    $0x3,%eax
     b5a:	83 ec 0c             	sub    $0xc,%esp
     b5d:	50                   	push   %eax
     b5e:	e8 15 fb ff ff       	call   678 <sbrk>
     b63:	83 c4 10             	add    $0x10,%esp
     b66:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     b69:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     b6d:	75 07                	jne    b76 <morecore+0x38>
    return 0;
     b6f:	b8 00 00 00 00       	mov    $0x0,%eax
     b74:	eb 26                	jmp    b9c <morecore+0x5e>
  hp = (Header*)p;
     b76:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b79:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     b7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b7f:	8b 55 08             	mov    0x8(%ebp),%edx
     b82:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     b85:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b88:	83 c0 08             	add    $0x8,%eax
     b8b:	83 ec 0c             	sub    $0xc,%esp
     b8e:	50                   	push   %eax
     b8f:	e8 c8 fe ff ff       	call   a5c <free>
     b94:	83 c4 10             	add    $0x10,%esp
  return freep;
     b97:	a1 4c 48 00 00       	mov    0x484c,%eax
}
     b9c:	c9                   	leave  
     b9d:	c3                   	ret    

00000b9e <malloc>:

void*
malloc(uint nbytes)
{
     b9e:	55                   	push   %ebp
     b9f:	89 e5                	mov    %esp,%ebp
     ba1:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     ba4:	8b 45 08             	mov    0x8(%ebp),%eax
     ba7:	83 c0 07             	add    $0x7,%eax
     baa:	c1 e8 03             	shr    $0x3,%eax
     bad:	83 c0 01             	add    $0x1,%eax
     bb0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     bb3:	a1 4c 48 00 00       	mov    0x484c,%eax
     bb8:	89 45 f0             	mov    %eax,-0x10(%ebp)
     bbb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     bbf:	75 23                	jne    be4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     bc1:	c7 45 f0 44 48 00 00 	movl   $0x4844,-0x10(%ebp)
     bc8:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bcb:	a3 4c 48 00 00       	mov    %eax,0x484c
     bd0:	a1 4c 48 00 00       	mov    0x484c,%eax
     bd5:	a3 44 48 00 00       	mov    %eax,0x4844
    base.s.size = 0;
     bda:	c7 05 48 48 00 00 00 	movl   $0x0,0x4848
     be1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     be4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     be7:	8b 00                	mov    (%eax),%eax
     be9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     bec:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bef:	8b 40 04             	mov    0x4(%eax),%eax
     bf2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     bf5:	72 4d                	jb     c44 <malloc+0xa6>
      if(p->s.size == nunits)
     bf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bfa:	8b 40 04             	mov    0x4(%eax),%eax
     bfd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     c00:	75 0c                	jne    c0e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     c02:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c05:	8b 10                	mov    (%eax),%edx
     c07:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c0a:	89 10                	mov    %edx,(%eax)
     c0c:	eb 26                	jmp    c34 <malloc+0x96>
      else {
        p->s.size -= nunits;
     c0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c11:	8b 40 04             	mov    0x4(%eax),%eax
     c14:	2b 45 ec             	sub    -0x14(%ebp),%eax
     c17:	89 c2                	mov    %eax,%edx
     c19:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c1c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     c1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c22:	8b 40 04             	mov    0x4(%eax),%eax
     c25:	c1 e0 03             	shl    $0x3,%eax
     c28:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     c2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c2e:	8b 55 ec             	mov    -0x14(%ebp),%edx
     c31:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     c34:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c37:	a3 4c 48 00 00       	mov    %eax,0x484c
      return (void*)(p + 1);
     c3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c3f:	83 c0 08             	add    $0x8,%eax
     c42:	eb 3b                	jmp    c7f <malloc+0xe1>
    }
    if(p == freep)
     c44:	a1 4c 48 00 00       	mov    0x484c,%eax
     c49:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     c4c:	75 1e                	jne    c6c <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     c4e:	83 ec 0c             	sub    $0xc,%esp
     c51:	ff 75 ec             	pushl  -0x14(%ebp)
     c54:	e8 e5 fe ff ff       	call   b3e <morecore>
     c59:	83 c4 10             	add    $0x10,%esp
     c5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
     c5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     c63:	75 07                	jne    c6c <malloc+0xce>
        return 0;
     c65:	b8 00 00 00 00       	mov    $0x0,%eax
     c6a:	eb 13                	jmp    c7f <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     c6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
     c72:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c75:	8b 00                	mov    (%eax),%eax
     c77:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     c7a:	e9 6d ff ff ff       	jmp    bec <malloc+0x4e>
}
     c7f:	c9                   	leave  
     c80:	c3                   	ret    

00000c81 <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     c81:	55                   	push   %ebp
     c82:	89 e5                	mov    %esp,%ebp
     c84:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     c87:	83 ec 04             	sub    $0x4,%esp
     c8a:	ff 75 08             	pushl  0x8(%ebp)
     c8d:	68 08 3a 00 00       	push   $0x3a08
     c92:	6a 02                	push   $0x2
     c94:	e8 03 fc ff ff       	call   89c <printf>
     c99:	83 c4 10             	add    $0x10,%esp
  exit();
     c9c:	e8 4f f9 ff ff       	call   5f0 <exit>

00000ca1 <getInteger>:
}

static int getInteger(double num)
{
     ca1:	55                   	push   %ebp
     ca2:	89 e5                	mov    %esp,%ebp
     ca4:	83 ec 18             	sub    $0x18,%esp
     ca7:	8b 45 08             	mov    0x8(%ebp),%eax
     caa:	89 45 e8             	mov    %eax,-0x18(%ebp)
     cad:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     cb3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     cba:	eb 0e                	jmp    cca <getInteger+0x29>
  {
    num -= 1;
     cbc:	dd 45 e8             	fldl   -0x18(%ebp)
     cbf:	d9 e8                	fld1   
     cc1:	de e9                	fsubrp %st,%st(1)
     cc3:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     cc6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     cca:	dd 45 e8             	fldl   -0x18(%ebp)
     ccd:	d9 e8                	fld1   
     ccf:	d9 c9                	fxch   %st(1)
     cd1:	df e9                	fucomip %st(1),%st
     cd3:	dd d8                	fstp   %st(0)
     cd5:	77 e5                	ja     cbc <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     cd7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     cda:	c9                   	leave  
     cdb:	c3                   	ret    

00000cdc <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     cdc:	55                   	push   %ebp
     cdd:	89 e5                	mov    %esp,%ebp
     cdf:	53                   	push   %ebx
     ce0:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     ce3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     cea:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     cee:	74 17                	je     d07 <int2str+0x2b>
     cf0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     cf4:	79 11                	jns    d07 <int2str+0x2b>
    neg = 1;
     cf6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     cfd:	8b 45 0c             	mov    0xc(%ebp),%eax
     d00:	f7 d8                	neg    %eax
     d02:	89 45 f0             	mov    %eax,-0x10(%ebp)
     d05:	eb 06                	jmp    d0d <int2str+0x31>
  } else {
    x = num;
     d07:	8b 45 0c             	mov    0xc(%ebp),%eax
     d0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     d0d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     d14:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     d17:	8d 41 01             	lea    0x1(%ecx),%eax
     d1a:	89 45 f8             	mov    %eax,-0x8(%ebp)
     d1d:	8b 5d 14             	mov    0x14(%ebp),%ebx
     d20:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d23:	ba 00 00 00 00       	mov    $0x0,%edx
     d28:	f7 f3                	div    %ebx
     d2a:	89 d0                	mov    %edx,%eax
     d2c:	0f b6 80 b4 46 00 00 	movzbl 0x46b4(%eax),%eax
     d33:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     d37:	8b 5d 14             	mov    0x14(%ebp),%ebx
     d3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d3d:	ba 00 00 00 00       	mov    $0x0,%edx
     d42:	f7 f3                	div    %ebx
     d44:	89 45 f0             	mov    %eax,-0x10(%ebp)
     d47:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     d4b:	75 c7                	jne    d14 <int2str+0x38>
  if(neg)
     d4d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d51:	74 36                	je     d89 <int2str+0xad>
    buf[i++] = '-';
     d53:	8b 45 f8             	mov    -0x8(%ebp),%eax
     d56:	8d 50 01             	lea    0x1(%eax),%edx
     d59:	89 55 f8             	mov    %edx,-0x8(%ebp)
     d5c:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     d61:	eb 26                	jmp    d89 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     d63:	8b 45 10             	mov    0x10(%ebp),%eax
     d66:	8b 00                	mov    (%eax),%eax
     d68:	89 c2                	mov    %eax,%edx
     d6a:	8b 45 08             	mov    0x8(%ebp),%eax
     d6d:	01 c2                	add    %eax,%edx
     d6f:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     d72:	8b 45 f8             	mov    -0x8(%ebp),%eax
     d75:	01 c8                	add    %ecx,%eax
     d77:	0f b6 00             	movzbl (%eax),%eax
     d7a:	88 02                	mov    %al,(%edx)
    (*pos)++;
     d7c:	8b 45 10             	mov    0x10(%ebp),%eax
     d7f:	8b 00                	mov    (%eax),%eax
     d81:	8d 50 01             	lea    0x1(%eax),%edx
     d84:	8b 45 10             	mov    0x10(%ebp),%eax
     d87:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     d89:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     d8d:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     d91:	79 d0                	jns    d63 <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     d93:	90                   	nop
     d94:	83 c4 20             	add    $0x20,%esp
     d97:	5b                   	pop    %ebx
     d98:	5d                   	pop    %ebp
     d99:	c3                   	ret    

00000d9a <double2str>:

void double2str(char *buf, double num, int *pos)
{
     d9a:	55                   	push   %ebp
     d9b:	89 e5                	mov    %esp,%ebp
     d9d:	83 ec 18             	sub    $0x18,%esp
     da0:	8b 45 0c             	mov    0xc(%ebp),%eax
     da3:	89 45 e8             	mov    %eax,-0x18(%ebp)
     da6:	8b 45 10             	mov    0x10(%ebp),%eax
     da9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     dac:	d9 ee                	fldz   
     dae:	dd 45 e8             	fldl   -0x18(%ebp)
     db1:	d9 c9                	fxch   %st(1)
     db3:	df e9                	fucomip %st(1),%st
     db5:	dd d8                	fstp   %st(0)
     db7:	76 24                	jbe    ddd <double2str+0x43>
  {
    buf[*pos] = '-';
     db9:	8b 45 14             	mov    0x14(%ebp),%eax
     dbc:	8b 00                	mov    (%eax),%eax
     dbe:	89 c2                	mov    %eax,%edx
     dc0:	8b 45 08             	mov    0x8(%ebp),%eax
     dc3:	01 d0                	add    %edx,%eax
     dc5:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     dc8:	8b 45 14             	mov    0x14(%ebp),%eax
     dcb:	8b 00                	mov    (%eax),%eax
     dcd:	8d 50 01             	lea    0x1(%eax),%edx
     dd0:	8b 45 14             	mov    0x14(%ebp),%eax
     dd3:	89 10                	mov    %edx,(%eax)
    num = -num;
     dd5:	dd 45 e8             	fldl   -0x18(%ebp)
     dd8:	d9 e0                	fchs   
     dda:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     ddd:	ff 75 ec             	pushl  -0x14(%ebp)
     de0:	ff 75 e8             	pushl  -0x18(%ebp)
     de3:	e8 b9 fe ff ff       	call   ca1 <getInteger>
     de8:	83 c4 08             	add    $0x8,%esp
     deb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     dee:	83 ec 04             	sub    $0x4,%esp
     df1:	6a 01                	push   $0x1
     df3:	6a 0a                	push   $0xa
     df5:	ff 75 14             	pushl  0x14(%ebp)
     df8:	ff 75 f8             	pushl  -0x8(%ebp)
     dfb:	ff 75 08             	pushl  0x8(%ebp)
     dfe:	e8 d9 fe ff ff       	call   cdc <int2str>
     e03:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     e06:	db 45 f8             	fildl  -0x8(%ebp)
     e09:	dd 45 e8             	fldl   -0x18(%ebp)
     e0c:	de e1                	fsubp  %st,%st(1)
     e0e:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     e11:	dd 45 e8             	fldl   -0x18(%ebp)
     e14:	dd 05 10 3a 00 00    	fldl   0x3a10
     e1a:	d9 c9                	fxch   %st(1)
     e1c:	df e9                	fucomip %st(1),%st
     e1e:	dd d8                	fstp   %st(0)
     e20:	76 1c                	jbe    e3e <double2str+0xa4>
  {
    buf[*pos] = '.';
     e22:	8b 45 14             	mov    0x14(%ebp),%eax
     e25:	8b 00                	mov    (%eax),%eax
     e27:	89 c2                	mov    %eax,%edx
     e29:	8b 45 08             	mov    0x8(%ebp),%eax
     e2c:	01 d0                	add    %edx,%eax
     e2e:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     e31:	8b 45 14             	mov    0x14(%ebp),%eax
     e34:	8b 00                	mov    (%eax),%eax
     e36:	8d 50 01             	lea    0x1(%eax),%edx
     e39:	8b 45 14             	mov    0x14(%ebp),%eax
     e3c:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     e3e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     e45:	eb 4c                	jmp    e93 <double2str+0xf9>
  {
    num = num*10;
     e47:	dd 45 e8             	fldl   -0x18(%ebp)
     e4a:	dd 05 18 3a 00 00    	fldl   0x3a18
     e50:	de c9                	fmulp  %st,%st(1)
     e52:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     e55:	ff 75 ec             	pushl  -0x14(%ebp)
     e58:	ff 75 e8             	pushl  -0x18(%ebp)
     e5b:	e8 41 fe ff ff       	call   ca1 <getInteger>
     e60:	83 c4 08             	add    $0x8,%esp
     e63:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     e66:	83 ec 04             	sub    $0x4,%esp
     e69:	6a 01                	push   $0x1
     e6b:	6a 0a                	push   $0xa
     e6d:	ff 75 14             	pushl  0x14(%ebp)
     e70:	ff 75 f8             	pushl  -0x8(%ebp)
     e73:	ff 75 08             	pushl  0x8(%ebp)
     e76:	e8 61 fe ff ff       	call   cdc <int2str>
     e7b:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     e7e:	db 45 f8             	fildl  -0x8(%ebp)
     e81:	dd 45 e8             	fldl   -0x18(%ebp)
     e84:	de e1                	fsubp  %st,%st(1)
     e86:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     e89:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     e8d:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     e91:	7f 13                	jg     ea6 <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     e93:	dd 45 e8             	fldl   -0x18(%ebp)
     e96:	dd 05 10 3a 00 00    	fldl   0x3a10
     e9c:	d9 c9                	fxch   %st(1)
     e9e:	df e9                	fucomip %st(1),%st
     ea0:	dd d8                	fstp   %st(0)
     ea2:	77 a3                	ja     e47 <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     ea4:	eb 01                	jmp    ea7 <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     ea6:	90                   	nop
    }
  }
}
     ea7:	90                   	nop
     ea8:	c9                   	leave  
     ea9:	c3                   	ret    

00000eaa <pow>:

double pow(double opnd, int power)
{
     eaa:	55                   	push   %ebp
     eab:	89 e5                	mov    %esp,%ebp
     ead:	83 ec 18             	sub    $0x18,%esp
     eb0:	8b 45 08             	mov    0x8(%ebp),%eax
     eb3:	89 45 e8             	mov    %eax,-0x18(%ebp)
     eb6:	8b 45 0c             	mov    0xc(%ebp),%eax
     eb9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     ebc:	d9 e8                	fld1   
     ebe:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     ec1:	eb 0d                	jmp    ed0 <pow+0x26>
  {
    result *= opnd;
     ec3:	dd 45 f8             	fldl   -0x8(%ebp)
     ec6:	dc 4d e8             	fmull  -0x18(%ebp)
     ec9:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     ecc:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     ed0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     ed4:	7f ed                	jg     ec3 <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
     ed6:	dd 45 f8             	fldl   -0x8(%ebp)
}
     ed9:	c9                   	leave  
     eda:	c3                   	ret    

00000edb <Translation>:

double Translation(char *s, int* pos)
{
     edb:	55                   	push   %ebp
     edc:	89 e5                	mov    %esp,%ebp
     ede:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
     ee1:	d9 ee                	fldz   
     ee3:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
     ee6:	d9 ee                	fldz   
     ee8:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     eeb:	eb 3e                	jmp    f2b <Translation+0x50>
    {
        integer *= 10;
     eed:	dd 45 f8             	fldl   -0x8(%ebp)
     ef0:	dd 05 18 3a 00 00    	fldl   0x3a18
     ef6:	de c9                	fmulp  %st,%st(1)
     ef8:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
     efb:	8b 45 0c             	mov    0xc(%ebp),%eax
     efe:	8b 00                	mov    (%eax),%eax
     f00:	89 c2                	mov    %eax,%edx
     f02:	8b 45 08             	mov    0x8(%ebp),%eax
     f05:	01 d0                	add    %edx,%eax
     f07:	0f b6 00             	movzbl (%eax),%eax
     f0a:	0f be c0             	movsbl %al,%eax
     f0d:	83 e8 30             	sub    $0x30,%eax
     f10:	89 45 dc             	mov    %eax,-0x24(%ebp)
     f13:	db 45 dc             	fildl  -0x24(%ebp)
     f16:	dd 45 f8             	fldl   -0x8(%ebp)
     f19:	de c1                	faddp  %st,%st(1)
     f1b:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
     f1e:	8b 45 0c             	mov    0xc(%ebp),%eax
     f21:	8b 00                	mov    (%eax),%eax
     f23:	8d 50 01             	lea    0x1(%eax),%edx
     f26:	8b 45 0c             	mov    0xc(%ebp),%eax
     f29:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     f2b:	8b 45 0c             	mov    0xc(%ebp),%eax
     f2e:	8b 00                	mov    (%eax),%eax
     f30:	89 c2                	mov    %eax,%edx
     f32:	8b 45 08             	mov    0x8(%ebp),%eax
     f35:	01 d0                	add    %edx,%eax
     f37:	0f b6 00             	movzbl (%eax),%eax
     f3a:	3c 2f                	cmp    $0x2f,%al
     f3c:	7e 13                	jle    f51 <Translation+0x76>
     f3e:	8b 45 0c             	mov    0xc(%ebp),%eax
     f41:	8b 00                	mov    (%eax),%eax
     f43:	89 c2                	mov    %eax,%edx
     f45:	8b 45 08             	mov    0x8(%ebp),%eax
     f48:	01 d0                	add    %edx,%eax
     f4a:	0f b6 00             	movzbl (%eax),%eax
     f4d:	3c 39                	cmp    $0x39,%al
     f4f:	7e 9c                	jle    eed <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
     f51:	8b 45 0c             	mov    0xc(%ebp),%eax
     f54:	8b 00                	mov    (%eax),%eax
     f56:	89 c2                	mov    %eax,%edx
     f58:	8b 45 08             	mov    0x8(%ebp),%eax
     f5b:	01 d0                	add    %edx,%eax
     f5d:	0f b6 00             	movzbl (%eax),%eax
     f60:	3c 2e                	cmp    $0x2e,%al
     f62:	0f 85 9b 00 00 00    	jne    1003 <Translation+0x128>
    {
        (*pos)++;
     f68:	8b 45 0c             	mov    0xc(%ebp),%eax
     f6b:	8b 00                	mov    (%eax),%eax
     f6d:	8d 50 01             	lea    0x1(%eax),%edx
     f70:	8b 45 0c             	mov    0xc(%ebp),%eax
     f73:	89 10                	mov    %edx,(%eax)
        int c = 1;
     f75:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     f7c:	eb 5b                	jmp    fd9 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
     f7e:	8b 45 0c             	mov    0xc(%ebp),%eax
     f81:	8b 00                	mov    (%eax),%eax
     f83:	89 c2                	mov    %eax,%edx
     f85:	8b 45 08             	mov    0x8(%ebp),%eax
     f88:	01 d0                	add    %edx,%eax
     f8a:	0f b6 00             	movzbl (%eax),%eax
     f8d:	0f be c0             	movsbl %al,%eax
     f90:	83 e8 30             	sub    $0x30,%eax
     f93:	89 45 dc             	mov    %eax,-0x24(%ebp)
     f96:	db 45 dc             	fildl  -0x24(%ebp)
     f99:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
     f9c:	83 ec 04             	sub    $0x4,%esp
     f9f:	ff 75 ec             	pushl  -0x14(%ebp)
     fa2:	dd 05 20 3a 00 00    	fldl   0x3a20
     fa8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     fac:	dd 1c 24             	fstpl  (%esp)
     faf:	e8 f6 fe ff ff       	call   eaa <pow>
     fb4:	83 c4 10             	add    $0x10,%esp
     fb7:	dd 45 e0             	fldl   -0x20(%ebp)
     fba:	de c9                	fmulp  %st,%st(1)
     fbc:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
     fbf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
     fc3:	dd 45 f0             	fldl   -0x10(%ebp)
     fc6:	dc 45 e0             	faddl  -0x20(%ebp)
     fc9:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
     fcc:	8b 45 0c             	mov    0xc(%ebp),%eax
     fcf:	8b 00                	mov    (%eax),%eax
     fd1:	8d 50 01             	lea    0x1(%eax),%edx
     fd4:	8b 45 0c             	mov    0xc(%ebp),%eax
     fd7:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
     fd9:	8b 45 0c             	mov    0xc(%ebp),%eax
     fdc:	8b 00                	mov    (%eax),%eax
     fde:	89 c2                	mov    %eax,%edx
     fe0:	8b 45 08             	mov    0x8(%ebp),%eax
     fe3:	01 d0                	add    %edx,%eax
     fe5:	0f b6 00             	movzbl (%eax),%eax
     fe8:	3c 2f                	cmp    $0x2f,%al
     fea:	7e 17                	jle    1003 <Translation+0x128>
     fec:	8b 45 0c             	mov    0xc(%ebp),%eax
     fef:	8b 00                	mov    (%eax),%eax
     ff1:	89 c2                	mov    %eax,%edx
     ff3:	8b 45 08             	mov    0x8(%ebp),%eax
     ff6:	01 d0                	add    %edx,%eax
     ff8:	0f b6 00             	movzbl (%eax),%eax
     ffb:	3c 39                	cmp    $0x39,%al
     ffd:	0f 8e 7b ff ff ff    	jle    f7e <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
    1003:	dd 45 f8             	fldl   -0x8(%ebp)
    1006:	dc 45 f0             	faddl  -0x10(%ebp)
    1009:	c9                   	leave  
    100a:	c3                   	ret    

0000100b <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
    100b:	55                   	push   %ebp
    100c:	89 e5                	mov    %esp,%ebp
    100e:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
    1011:	e8 d2 f5 ff ff       	call   5e8 <fork>
    1016:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
    1019:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    101c:	c9                   	leave  
    101d:	c3                   	ret    

0000101e <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
    101e:	55                   	push   %ebp
    101f:	89 e5                	mov    %esp,%ebp
    1021:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1024:	83 ec 0c             	sub    $0xc,%esp
    1027:	6a 54                	push   $0x54
    1029:	e8 70 fb ff ff       	call   b9e <malloc>
    102e:	83 c4 10             	add    $0x10,%esp
    1031:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1034:	83 ec 04             	sub    $0x4,%esp
    1037:	6a 54                	push   $0x54
    1039:	6a 00                	push   $0x0
    103b:	ff 75 f4             	pushl  -0xc(%ebp)
    103e:	e8 12 f4 ff ff       	call   455 <memset>
    1043:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
    1046:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1049:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
    104f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1052:	c9                   	leave  
    1053:	c3                   	ret    

00001054 <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    1054:	55                   	push   %ebp
    1055:	89 e5                	mov    %esp,%ebp
    1057:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    105a:	83 ec 0c             	sub    $0xc,%esp
    105d:	6a 18                	push   $0x18
    105f:	e8 3a fb ff ff       	call   b9e <malloc>
    1064:	83 c4 10             	add    $0x10,%esp
    1067:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    106a:	83 ec 04             	sub    $0x4,%esp
    106d:	6a 18                	push   $0x18
    106f:	6a 00                	push   $0x0
    1071:	ff 75 f4             	pushl  -0xc(%ebp)
    1074:	e8 dc f3 ff ff       	call   455 <memset>
    1079:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
    107c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    107f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
    1085:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1088:	8b 55 08             	mov    0x8(%ebp),%edx
    108b:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
    108e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1091:	8b 55 0c             	mov    0xc(%ebp),%edx
    1094:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
    1097:	8b 45 f4             	mov    -0xc(%ebp),%eax
    109a:	8b 55 10             	mov    0x10(%ebp),%edx
    109d:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
    10a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10a3:	8b 55 14             	mov    0x14(%ebp),%edx
    10a6:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
    10a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10ac:	8b 55 18             	mov    0x18(%ebp),%edx
    10af:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
    10b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    10b5:	c9                   	leave  
    10b6:	c3                   	ret    

000010b7 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
    10b7:	55                   	push   %ebp
    10b8:	89 e5                	mov    %esp,%ebp
    10ba:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    10bd:	83 ec 0c             	sub    $0xc,%esp
    10c0:	6a 0c                	push   $0xc
    10c2:	e8 d7 fa ff ff       	call   b9e <malloc>
    10c7:	83 c4 10             	add    $0x10,%esp
    10ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    10cd:	83 ec 04             	sub    $0x4,%esp
    10d0:	6a 0c                	push   $0xc
    10d2:	6a 00                	push   $0x0
    10d4:	ff 75 f4             	pushl  -0xc(%ebp)
    10d7:	e8 79 f3 ff ff       	call   455 <memset>
    10dc:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
    10df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10e2:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
    10e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10eb:	8b 55 08             	mov    0x8(%ebp),%edx
    10ee:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    10f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10f4:	8b 55 0c             	mov    0xc(%ebp),%edx
    10f7:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    10fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    10fd:	c9                   	leave  
    10fe:	c3                   	ret    

000010ff <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
    10ff:	55                   	push   %ebp
    1100:	89 e5                	mov    %esp,%ebp
    1102:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1105:	83 ec 0c             	sub    $0xc,%esp
    1108:	6a 0c                	push   $0xc
    110a:	e8 8f fa ff ff       	call   b9e <malloc>
    110f:	83 c4 10             	add    $0x10,%esp
    1112:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1115:	83 ec 04             	sub    $0x4,%esp
    1118:	6a 0c                	push   $0xc
    111a:	6a 00                	push   $0x0
    111c:	ff 75 f4             	pushl  -0xc(%ebp)
    111f:	e8 31 f3 ff ff       	call   455 <memset>
    1124:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
    1127:	8b 45 f4             	mov    -0xc(%ebp),%eax
    112a:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
    1130:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1133:	8b 55 08             	mov    0x8(%ebp),%edx
    1136:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    1139:	8b 45 f4             	mov    -0xc(%ebp),%eax
    113c:	8b 55 0c             	mov    0xc(%ebp),%edx
    113f:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    1142:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1145:	c9                   	leave  
    1146:	c3                   	ret    

00001147 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
    1147:	55                   	push   %ebp
    1148:	89 e5                	mov    %esp,%ebp
    114a:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    114d:	83 ec 0c             	sub    $0xc,%esp
    1150:	6a 08                	push   $0x8
    1152:	e8 47 fa ff ff       	call   b9e <malloc>
    1157:	83 c4 10             	add    $0x10,%esp
    115a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    115d:	83 ec 04             	sub    $0x4,%esp
    1160:	6a 08                	push   $0x8
    1162:	6a 00                	push   $0x0
    1164:	ff 75 f4             	pushl  -0xc(%ebp)
    1167:	e8 e9 f2 ff ff       	call   455 <memset>
    116c:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
    116f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1172:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
    1178:	8b 45 f4             	mov    -0xc(%ebp),%eax
    117b:	8b 55 08             	mov    0x8(%ebp),%edx
    117e:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    1181:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1184:	c9                   	leave  
    1185:	c3                   	ret    

00001186 <calcmd>:

struct cmd* calcmd(char *_line)
{
    1186:	55                   	push   %ebp
    1187:	89 e5                	mov    %esp,%ebp
    1189:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    118c:	83 ec 0c             	sub    $0xc,%esp
    118f:	6a 08                	push   $0x8
    1191:	e8 08 fa ff ff       	call   b9e <malloc>
    1196:	83 c4 10             	add    $0x10,%esp
    1199:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    119c:	83 ec 04             	sub    $0x4,%esp
    119f:	6a 08                	push   $0x8
    11a1:	6a 00                	push   $0x0
    11a3:	ff 75 f4             	pushl  -0xc(%ebp)
    11a6:	e8 aa f2 ff ff       	call   455 <memset>
    11ab:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
    11ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11b1:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
    11b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11ba:	8b 55 08             	mov    0x8(%ebp),%edx
    11bd:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    11c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    11c3:	c9                   	leave  
    11c4:	c3                   	ret    

000011c5 <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
    11c5:	55                   	push   %ebp
    11c6:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
    11c8:	eb 0c                	jmp    11d6 <mystrncmp+0x11>
    n--, p++, q++;
    11ca:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    11ce:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    11d2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    11d6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    11da:	74 1a                	je     11f6 <mystrncmp+0x31>
    11dc:	8b 45 08             	mov    0x8(%ebp),%eax
    11df:	0f b6 00             	movzbl (%eax),%eax
    11e2:	84 c0                	test   %al,%al
    11e4:	74 10                	je     11f6 <mystrncmp+0x31>
    11e6:	8b 45 08             	mov    0x8(%ebp),%eax
    11e9:	0f b6 10             	movzbl (%eax),%edx
    11ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ef:	0f b6 00             	movzbl (%eax),%eax
    11f2:	38 c2                	cmp    %al,%dl
    11f4:	74 d4                	je     11ca <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
    11f6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    11fa:	75 07                	jne    1203 <mystrncmp+0x3e>
    return 0;
    11fc:	b8 00 00 00 00       	mov    $0x0,%eax
    1201:	eb 16                	jmp    1219 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
    1203:	8b 45 08             	mov    0x8(%ebp),%eax
    1206:	0f b6 00             	movzbl (%eax),%eax
    1209:	0f b6 d0             	movzbl %al,%edx
    120c:	8b 45 0c             	mov    0xc(%ebp),%eax
    120f:	0f b6 00             	movzbl (%eax),%eax
    1212:	0f b6 c0             	movzbl %al,%eax
    1215:	29 c2                	sub    %eax,%edx
    1217:	89 d0                	mov    %edx,%eax
}
    1219:	5d                   	pop    %ebp
    121a:	c3                   	ret    

0000121b <mystrlen>:

static int mystrlen(const char *s)
{
    121b:	55                   	push   %ebp
    121c:	89 e5                	mov    %esp,%ebp
    121e:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
    1221:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1228:	eb 04                	jmp    122e <mystrlen+0x13>
    122a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    122e:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1231:	8b 45 08             	mov    0x8(%ebp),%eax
    1234:	01 d0                	add    %edx,%eax
    1236:	0f b6 00             	movzbl (%eax),%eax
    1239:	84 c0                	test   %al,%al
    123b:	75 ed                	jne    122a <mystrlen+0xf>
    ;
  return n;
    123d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1240:	c9                   	leave  
    1241:	c3                   	ret    

00001242 <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
    1242:	55                   	push   %ebp
    1243:	89 e5                	mov    %esp,%ebp
    1245:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
    1248:	8b 45 08             	mov    0x8(%ebp),%eax
    124b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
    124e:	90                   	nop
    124f:	8b 45 10             	mov    0x10(%ebp),%eax
    1252:	8d 50 ff             	lea    -0x1(%eax),%edx
    1255:	89 55 10             	mov    %edx,0x10(%ebp)
    1258:	85 c0                	test   %eax,%eax
    125a:	7e 2c                	jle    1288 <mystrncpy+0x46>
    125c:	8b 45 08             	mov    0x8(%ebp),%eax
    125f:	8d 50 01             	lea    0x1(%eax),%edx
    1262:	89 55 08             	mov    %edx,0x8(%ebp)
    1265:	8b 55 0c             	mov    0xc(%ebp),%edx
    1268:	8d 4a 01             	lea    0x1(%edx),%ecx
    126b:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    126e:	0f b6 12             	movzbl (%edx),%edx
    1271:	88 10                	mov    %dl,(%eax)
    1273:	0f b6 00             	movzbl (%eax),%eax
    1276:	84 c0                	test   %al,%al
    1278:	75 d5                	jne    124f <mystrncpy+0xd>
    ;
  while(n-- > 0)
    127a:	eb 0c                	jmp    1288 <mystrncpy+0x46>
    *s++ = 0;
    127c:	8b 45 08             	mov    0x8(%ebp),%eax
    127f:	8d 50 01             	lea    0x1(%eax),%edx
    1282:	89 55 08             	mov    %edx,0x8(%ebp)
    1285:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    1288:	8b 45 10             	mov    0x10(%ebp),%eax
    128b:	8d 50 ff             	lea    -0x1(%eax),%edx
    128e:	89 55 10             	mov    %edx,0x10(%ebp)
    1291:	85 c0                	test   %eax,%eax
    1293:	7f e7                	jg     127c <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    1295:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1298:	c9                   	leave  
    1299:	c3                   	ret    

0000129a <isEqual>:

int isEqual(double a, double b)
{
    129a:	55                   	push   %ebp
    129b:	89 e5                	mov    %esp,%ebp
    129d:	83 ec 10             	sub    $0x10,%esp
    12a0:	8b 45 08             	mov    0x8(%ebp),%eax
    12a3:	89 45 f8             	mov    %eax,-0x8(%ebp)
    12a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    12a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12ac:	8b 45 10             	mov    0x10(%ebp),%eax
    12af:	89 45 f0             	mov    %eax,-0x10(%ebp)
    12b2:	8b 45 14             	mov    0x14(%ebp),%eax
    12b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    12b8:	dd 45 f8             	fldl   -0x8(%ebp)
    12bb:	dc 65 f0             	fsubl  -0x10(%ebp)
    12be:	dd 05 f0 3b 00 00    	fldl   0x3bf0
    12c4:	df e9                	fucomip %st(1),%st
    12c6:	dd d8                	fstp   %st(0)
    12c8:	76 19                	jbe    12e3 <isEqual+0x49>
    12ca:	dd 45 f0             	fldl   -0x10(%ebp)
    12cd:	dc 65 f8             	fsubl  -0x8(%ebp)
    12d0:	dd 05 f0 3b 00 00    	fldl   0x3bf0
    12d6:	df e9                	fucomip %st(1),%st
    12d8:	dd d8                	fstp   %st(0)
    12da:	76 07                	jbe    12e3 <isEqual+0x49>
    return 1;
    12dc:	b8 01 00 00 00       	mov    $0x1,%eax
    12e1:	eb 05                	jmp    12e8 <isEqual+0x4e>
  return 0;
    12e3:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12e8:	c9                   	leave  
    12e9:	c3                   	ret    

000012ea <isCmdName>:

int isCmdName(const char* str)
{
    12ea:	55                   	push   %ebp
    12eb:	89 e5                	mov    %esp,%ebp
    12ed:	53                   	push   %ebx
    12ee:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    12f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    12f8:	eb 71                	jmp    136b <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    12fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
    12fd:	89 d0                	mov    %edx,%eax
    12ff:	c1 e0 02             	shl    $0x2,%eax
    1302:	01 d0                	add    %edx,%eax
    1304:	01 c0                	add    %eax,%eax
    1306:	05 e0 46 00 00       	add    $0x46e0,%eax
    130b:	83 ec 0c             	sub    $0xc,%esp
    130e:	50                   	push   %eax
    130f:	e8 1a f1 ff ff       	call   42e <strlen>
    1314:	83 c4 10             	add    $0x10,%esp
    1317:	89 c3                	mov    %eax,%ebx
    1319:	83 ec 0c             	sub    $0xc,%esp
    131c:	ff 75 08             	pushl  0x8(%ebp)
    131f:	e8 f7 fe ff ff       	call   121b <mystrlen>
    1324:	83 c4 10             	add    $0x10,%esp
    1327:	39 c3                	cmp    %eax,%ebx
    1329:	75 3c                	jne    1367 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    132b:	83 ec 0c             	sub    $0xc,%esp
    132e:	ff 75 08             	pushl  0x8(%ebp)
    1331:	e8 e5 fe ff ff       	call   121b <mystrlen>
    1336:	83 c4 10             	add    $0x10,%esp
    1339:	89 c1                	mov    %eax,%ecx
    133b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    133e:	89 d0                	mov    %edx,%eax
    1340:	c1 e0 02             	shl    $0x2,%eax
    1343:	01 d0                	add    %edx,%eax
    1345:	01 c0                	add    %eax,%eax
    1347:	05 e0 46 00 00       	add    $0x46e0,%eax
    134c:	83 ec 04             	sub    $0x4,%esp
    134f:	51                   	push   %ecx
    1350:	ff 75 08             	pushl  0x8(%ebp)
    1353:	50                   	push   %eax
    1354:	e8 6c fe ff ff       	call   11c5 <mystrncmp>
    1359:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    135c:	85 c0                	test   %eax,%eax
    135e:	75 07                	jne    1367 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    1360:	b8 01 00 00 00       	mov    $0x1,%eax
    1365:	eb 0f                	jmp    1376 <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    1367:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    136b:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    136f:	7e 89                	jle    12fa <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    1371:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1376:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1379:	c9                   	leave  
    137a:	c3                   	ret    

0000137b <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    137b:	55                   	push   %ebp
    137c:	89 e5                	mov    %esp,%ebp
    137e:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    1384:	83 ec 08             	sub    $0x8,%esp
    1387:	6a 00                	push   $0x0
    1389:	68 a8 47 00 00       	push   $0x47a8
    138e:	e8 9d f2 ff ff       	call   630 <open>
    1393:	83 c4 10             	add    $0x10,%esp
    1396:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1399:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    139d:	79 0a                	jns    13a9 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    139f:	b8 00 00 00 00       	mov    $0x0,%eax
    13a4:	e9 9a 01 00 00       	jmp    1543 <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    13a9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    13b0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    13b7:	e9 ee 00 00 00       	jmp    14aa <findAlias+0x12f>
  {
      int isSame = 1;
    13bc:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    13c3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    13ca:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    13d1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    13d8:	83 ec 0c             	sub    $0xc,%esp
    13db:	8d 45 9a             	lea    -0x66(%ebp),%eax
    13de:	50                   	push   %eax
    13df:	e8 4a f0 ff ff       	call   42e <strlen>
    13e4:	83 c4 10             	add    $0x10,%esp
    13e7:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    13ea:	83 ec 0c             	sub    $0xc,%esp
    13ed:	ff 75 08             	pushl  0x8(%ebp)
    13f0:	e8 39 f0 ff ff       	call   42e <strlen>
    13f5:	83 c4 10             	add    $0x10,%esp
    13f8:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    13fb:	8d 55 9a             	lea    -0x66(%ebp),%edx
    13fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1401:	01 d0                	add    %edx,%eax
    1403:	0f b6 00             	movzbl (%eax),%eax
    1406:	3c 21                	cmp    $0x21,%al
    1408:	75 38                	jne    1442 <findAlias+0xc7>
      {
          startIndex++;
    140a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    140e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    1415:	eb 2b                	jmp    1442 <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    1417:	8d 55 9a             	lea    -0x66(%ebp),%edx
    141a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    141d:	01 d0                	add    %edx,%eax
    141f:	0f b6 10             	movzbl (%eax),%edx
    1422:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    1425:	8b 45 08             	mov    0x8(%ebp),%eax
    1428:	01 c8                	add    %ecx,%eax
    142a:	0f b6 00             	movzbl (%eax),%eax
    142d:	38 c2                	cmp    %al,%dl
    142f:	74 09                	je     143a <findAlias+0xbf>
          {
              isSame = 0;
    1431:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    1438:	eb 1f                	jmp    1459 <findAlias+0xde>
          }
          startIndex++;
    143a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    143e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    1442:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1445:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1448:	01 d0                	add    %edx,%eax
    144a:	0f b6 00             	movzbl (%eax),%eax
    144d:	3c 3d                	cmp    $0x3d,%al
    144f:	74 08                	je     1459 <findAlias+0xde>
    1451:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1454:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1457:	7c be                	jl     1417 <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    1459:	8d 55 9a             	lea    -0x66(%ebp),%edx
    145c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    145f:	01 d0                	add    %edx,%eax
    1461:	0f b6 00             	movzbl (%eax),%eax
    1464:	3c 3d                	cmp    $0x3d,%al
    1466:	75 08                	jne    1470 <findAlias+0xf5>
    1468:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    146b:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    146e:	7d 07                	jge    1477 <findAlias+0xfc>
      {
          isSame = 0;
    1470:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    1477:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    147b:	75 0b                	jne    1488 <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    147d:	b8 01 00 00 00       	mov    $0x1,%eax
    1482:	2b 45 f0             	sub    -0x10(%ebp),%eax
    1485:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    1488:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    148c:	75 1c                	jne    14aa <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    148e:	83 ec 08             	sub    $0x8,%esp
    1491:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1494:	50                   	push   %eax
    1495:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    149b:	50                   	push   %eax
    149c:	e8 1e ef ff ff       	call   3bf <strcpy>
    14a1:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    14a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    14aa:	83 ec 04             	sub    $0x4,%esp
    14ad:	6a 32                	push   $0x32
    14af:	8d 45 9a             	lea    -0x66(%ebp),%eax
    14b2:	50                   	push   %eax
    14b3:	ff 75 dc             	pushl  -0x24(%ebp)
    14b6:	e8 4d f1 ff ff       	call   608 <read>
    14bb:	83 c4 10             	add    $0x10,%esp
    14be:	89 45 d8             	mov    %eax,-0x28(%ebp)
    14c1:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    14c5:	0f 8f f1 fe ff ff    	jg     13bc <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    14cb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14cf:	75 5f                	jne    1530 <findAlias+0x1b5>
  {
    int i = 0;
    14d1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    14d8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    14dc:	eb 20                	jmp    14fe <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    14de:	8b 55 e0             	mov    -0x20(%ebp),%edx
    14e1:	8b 45 0c             	mov    0xc(%ebp),%eax
    14e4:	01 c2                	add    %eax,%edx
    14e6:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    14ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14ef:	01 c8                	add    %ecx,%eax
    14f1:	0f b6 00             	movzbl (%eax),%eax
    14f4:	88 02                	mov    %al,(%edx)
      i++;
    14f6:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    14fa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    14fe:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    1504:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1507:	01 d0                	add    %edx,%eax
    1509:	0f b6 00             	movzbl (%eax),%eax
    150c:	84 c0                	test   %al,%al
    150e:	75 ce                	jne    14de <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    1510:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1513:	8b 45 0c             	mov    0xc(%ebp),%eax
    1516:	01 d0                	add    %edx,%eax
    1518:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    151b:	83 ec 0c             	sub    $0xc,%esp
    151e:	ff 75 dc             	pushl  -0x24(%ebp)
    1521:	e8 f2 f0 ff ff       	call   618 <close>
    1526:	83 c4 10             	add    $0x10,%esp
    return 1;
    1529:	b8 01 00 00 00       	mov    $0x1,%eax
    152e:	eb 13                	jmp    1543 <findAlias+0x1c8>
  }
  close(fd);
    1530:	83 ec 0c             	sub    $0xc,%esp
    1533:	ff 75 dc             	pushl  -0x24(%ebp)
    1536:	e8 dd f0 ff ff       	call   618 <close>
    153b:	83 c4 10             	add    $0x10,%esp
  return 0;
    153e:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1543:	c9                   	leave  
    1544:	c3                   	ret    

00001545 <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    1545:	55                   	push   %ebp
    1546:	89 e5                	mov    %esp,%ebp
    1548:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    154b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    154f:	75 05                	jne    1556 <runcmd+0x11>
    exit();
    1551:	e8 9a f0 ff ff       	call   5f0 <exit>
  
  switch(cmd->type){
    1556:	8b 45 08             	mov    0x8(%ebp),%eax
    1559:	8b 00                	mov    (%eax),%eax
    155b:	83 f8 05             	cmp    $0x5,%eax
    155e:	77 09                	ja     1569 <runcmd+0x24>
    1560:	8b 04 85 54 3a 00 00 	mov    0x3a54(,%eax,4),%eax
    1567:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    1569:	83 ec 0c             	sub    $0xc,%esp
    156c:	68 28 3a 00 00       	push   $0x3a28
    1571:	e8 0b f7 ff ff       	call   c81 <panic1>
    1576:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    1579:	8b 45 08             	mov    0x8(%ebp),%eax
    157c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    157f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1582:	8b 40 04             	mov    0x4(%eax),%eax
    1585:	85 c0                	test   %eax,%eax
    1587:	75 05                	jne    158e <runcmd+0x49>
      exit();
    1589:	e8 62 f0 ff ff       	call   5f0 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    158e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1591:	8b 40 04             	mov    0x4(%eax),%eax
    1594:	83 ec 0c             	sub    $0xc,%esp
    1597:	50                   	push   %eax
    1598:	e8 4d fd ff ff       	call   12ea <isCmdName>
    159d:	83 c4 10             	add    $0x10,%esp
    15a0:	85 c0                	test   %eax,%eax
    15a2:	75 37                	jne    15db <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    15a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a7:	8b 40 04             	mov    0x4(%eax),%eax
    15aa:	83 ec 08             	sub    $0x8,%esp
    15ad:	8d 55 ce             	lea    -0x32(%ebp),%edx
    15b0:	52                   	push   %edx
    15b1:	50                   	push   %eax
    15b2:	e8 c4 fd ff ff       	call   137b <findAlias>
    15b7:	83 c4 10             	add    $0x10,%esp
    15ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    15bd:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    15c1:	75 31                	jne    15f4 <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    15c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15c6:	83 c0 04             	add    $0x4,%eax
    15c9:	83 ec 08             	sub    $0x8,%esp
    15cc:	50                   	push   %eax
    15cd:	8d 45 ce             	lea    -0x32(%ebp),%eax
    15d0:	50                   	push   %eax
    15d1:	e8 52 f0 ff ff       	call   628 <exec>
    15d6:	83 c4 10             	add    $0x10,%esp
    15d9:	eb 19                	jmp    15f4 <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    15db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15de:	8d 50 04             	lea    0x4(%eax),%edx
    15e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15e4:	8b 40 04             	mov    0x4(%eax),%eax
    15e7:	83 ec 08             	sub    $0x8,%esp
    15ea:	52                   	push   %edx
    15eb:	50                   	push   %eax
    15ec:	e8 37 f0 ff ff       	call   628 <exec>
    15f1:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    15f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15f7:	8b 40 04             	mov    0x4(%eax),%eax
    15fa:	83 ec 04             	sub    $0x4,%esp
    15fd:	50                   	push   %eax
    15fe:	68 2f 3a 00 00       	push   $0x3a2f
    1603:	6a 02                	push   $0x2
    1605:	e8 92 f2 ff ff       	call   89c <printf>
    160a:	83 c4 10             	add    $0x10,%esp
    break;
    160d:	e9 c6 01 00 00       	jmp    17d8 <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    1612:	8b 45 08             	mov    0x8(%ebp),%eax
    1615:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    1618:	8b 45 ec             	mov    -0x14(%ebp),%eax
    161b:	8b 40 14             	mov    0x14(%eax),%eax
    161e:	83 ec 0c             	sub    $0xc,%esp
    1621:	50                   	push   %eax
    1622:	e8 f1 ef ff ff       	call   618 <close>
    1627:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    162a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    162d:	8b 50 10             	mov    0x10(%eax),%edx
    1630:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1633:	8b 40 08             	mov    0x8(%eax),%eax
    1636:	83 ec 08             	sub    $0x8,%esp
    1639:	52                   	push   %edx
    163a:	50                   	push   %eax
    163b:	e8 f0 ef ff ff       	call   630 <open>
    1640:	83 c4 10             	add    $0x10,%esp
    1643:	85 c0                	test   %eax,%eax
    1645:	79 1e                	jns    1665 <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    1647:	8b 45 ec             	mov    -0x14(%ebp),%eax
    164a:	8b 40 08             	mov    0x8(%eax),%eax
    164d:	83 ec 04             	sub    $0x4,%esp
    1650:	50                   	push   %eax
    1651:	68 3f 3a 00 00       	push   $0x3a3f
    1656:	6a 02                	push   $0x2
    1658:	e8 3f f2 ff ff       	call   89c <printf>
    165d:	83 c4 10             	add    $0x10,%esp
      exit();
    1660:	e8 8b ef ff ff       	call   5f0 <exit>
    }
    runcmd(rcmd->cmd);
    1665:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1668:	8b 40 04             	mov    0x4(%eax),%eax
    166b:	83 ec 0c             	sub    $0xc,%esp
    166e:	50                   	push   %eax
    166f:	e8 d1 fe ff ff       	call   1545 <runcmd>
    1674:	83 c4 10             	add    $0x10,%esp
    break;
    1677:	e9 5c 01 00 00       	jmp    17d8 <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    167c:	8b 45 08             	mov    0x8(%ebp),%eax
    167f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    1682:	e8 84 f9 ff ff       	call   100b <fork1>
    1687:	85 c0                	test   %eax,%eax
    1689:	75 12                	jne    169d <runcmd+0x158>
      runcmd(lcmd->left);
    168b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    168e:	8b 40 04             	mov    0x4(%eax),%eax
    1691:	83 ec 0c             	sub    $0xc,%esp
    1694:	50                   	push   %eax
    1695:	e8 ab fe ff ff       	call   1545 <runcmd>
    169a:	83 c4 10             	add    $0x10,%esp
    wait();
    169d:	e8 56 ef ff ff       	call   5f8 <wait>
    runcmd(lcmd->right);
    16a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16a5:	8b 40 08             	mov    0x8(%eax),%eax
    16a8:	83 ec 0c             	sub    $0xc,%esp
    16ab:	50                   	push   %eax
    16ac:	e8 94 fe ff ff       	call   1545 <runcmd>
    16b1:	83 c4 10             	add    $0x10,%esp
    break;
    16b4:	e9 1f 01 00 00       	jmp    17d8 <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    16b9:	8b 45 08             	mov    0x8(%ebp),%eax
    16bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    16bf:	83 ec 0c             	sub    $0xc,%esp
    16c2:	8d 45 d8             	lea    -0x28(%ebp),%eax
    16c5:	50                   	push   %eax
    16c6:	e8 35 ef ff ff       	call   600 <pipe>
    16cb:	83 c4 10             	add    $0x10,%esp
    16ce:	85 c0                	test   %eax,%eax
    16d0:	79 10                	jns    16e2 <runcmd+0x19d>
      panic1("pipe");
    16d2:	83 ec 0c             	sub    $0xc,%esp
    16d5:	68 4f 3a 00 00       	push   $0x3a4f
    16da:	e8 a2 f5 ff ff       	call   c81 <panic1>
    16df:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    16e2:	e8 24 f9 ff ff       	call   100b <fork1>
    16e7:	85 c0                	test   %eax,%eax
    16e9:	75 4c                	jne    1737 <runcmd+0x1f2>
      close(1);
    16eb:	83 ec 0c             	sub    $0xc,%esp
    16ee:	6a 01                	push   $0x1
    16f0:	e8 23 ef ff ff       	call   618 <close>
    16f5:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    16f8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    16fb:	83 ec 0c             	sub    $0xc,%esp
    16fe:	50                   	push   %eax
    16ff:	e8 64 ef ff ff       	call   668 <dup>
    1704:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1707:	8b 45 d8             	mov    -0x28(%ebp),%eax
    170a:	83 ec 0c             	sub    $0xc,%esp
    170d:	50                   	push   %eax
    170e:	e8 05 ef ff ff       	call   618 <close>
    1713:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    1716:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1719:	83 ec 0c             	sub    $0xc,%esp
    171c:	50                   	push   %eax
    171d:	e8 f6 ee ff ff       	call   618 <close>
    1722:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    1725:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1728:	8b 40 04             	mov    0x4(%eax),%eax
    172b:	83 ec 0c             	sub    $0xc,%esp
    172e:	50                   	push   %eax
    172f:	e8 11 fe ff ff       	call   1545 <runcmd>
    1734:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    1737:	e8 cf f8 ff ff       	call   100b <fork1>
    173c:	85 c0                	test   %eax,%eax
    173e:	75 4c                	jne    178c <runcmd+0x247>
      close(0);
    1740:	83 ec 0c             	sub    $0xc,%esp
    1743:	6a 00                	push   $0x0
    1745:	e8 ce ee ff ff       	call   618 <close>
    174a:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    174d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1750:	83 ec 0c             	sub    $0xc,%esp
    1753:	50                   	push   %eax
    1754:	e8 0f ef ff ff       	call   668 <dup>
    1759:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    175c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    175f:	83 ec 0c             	sub    $0xc,%esp
    1762:	50                   	push   %eax
    1763:	e8 b0 ee ff ff       	call   618 <close>
    1768:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    176b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    176e:	83 ec 0c             	sub    $0xc,%esp
    1771:	50                   	push   %eax
    1772:	e8 a1 ee ff ff       	call   618 <close>
    1777:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    177a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    177d:	8b 40 08             	mov    0x8(%eax),%eax
    1780:	83 ec 0c             	sub    $0xc,%esp
    1783:	50                   	push   %eax
    1784:	e8 bc fd ff ff       	call   1545 <runcmd>
    1789:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    178c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    178f:	83 ec 0c             	sub    $0xc,%esp
    1792:	50                   	push   %eax
    1793:	e8 80 ee ff ff       	call   618 <close>
    1798:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    179b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    179e:	83 ec 0c             	sub    $0xc,%esp
    17a1:	50                   	push   %eax
    17a2:	e8 71 ee ff ff       	call   618 <close>
    17a7:	83 c4 10             	add    $0x10,%esp
    wait();
    17aa:	e8 49 ee ff ff       	call   5f8 <wait>
    wait();
    17af:	e8 44 ee ff ff       	call   5f8 <wait>
    break;
    17b4:	eb 22                	jmp    17d8 <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    17b6:	8b 45 08             	mov    0x8(%ebp),%eax
    17b9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    17bc:	e8 4a f8 ff ff       	call   100b <fork1>
    17c1:	85 c0                	test   %eax,%eax
    17c3:	75 12                	jne    17d7 <runcmd+0x292>
      runcmd(bcmd->cmd);
    17c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    17c8:	8b 40 04             	mov    0x4(%eax),%eax
    17cb:	83 ec 0c             	sub    $0xc,%esp
    17ce:	50                   	push   %eax
    17cf:	e8 71 fd ff ff       	call   1545 <runcmd>
    17d4:	83 c4 10             	add    $0x10,%esp
    break;
    17d7:	90                   	nop
  }
  exit();
    17d8:	e8 13 ee ff ff       	call   5f0 <exit>

000017dd <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    17dd:	55                   	push   %ebp
    17de:	89 e5                	mov    %esp,%ebp
    17e0:	83 ec 04             	sub    $0x4,%esp
    17e3:	8b 45 08             	mov    0x8(%ebp),%eax
    17e6:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    17e9:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    17ed:	7e 0d                	jle    17fc <isNameChar+0x1f>
    17ef:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    17f3:	7f 07                	jg     17fc <isNameChar+0x1f>
    return 1;
    17f5:	b8 01 00 00 00       	mov    $0x1,%eax
    17fa:	eb 38                	jmp    1834 <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    17fc:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    1800:	7e 0d                	jle    180f <isNameChar+0x32>
    1802:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    1806:	7f 07                	jg     180f <isNameChar+0x32>
    return 1;
    1808:	b8 01 00 00 00       	mov    $0x1,%eax
    180d:	eb 25                	jmp    1834 <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    180f:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    1813:	7e 0d                	jle    1822 <isNameChar+0x45>
    1815:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    1819:	7f 07                	jg     1822 <isNameChar+0x45>
    return 1;
    181b:	b8 01 00 00 00       	mov    $0x1,%eax
    1820:	eb 12                	jmp    1834 <isNameChar+0x57>
  if(ch == '_')
    1822:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    1826:	75 07                	jne    182f <isNameChar+0x52>
    return 1;
    1828:	b8 01 00 00 00       	mov    $0x1,%eax
    182d:	eb 05                	jmp    1834 <isNameChar+0x57>
  return 0;
    182f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1834:	c9                   	leave  
    1835:	c3                   	ret    

00001836 <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    1836:	55                   	push   %ebp
    1837:	89 e5                	mov    %esp,%ebp
    1839:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    183c:	8b 45 08             	mov    0x8(%ebp),%eax
    183f:	8b 40 04             	mov    0x4(%eax),%eax
    1842:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    1845:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    184c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    1853:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    185a:	eb 1d                	jmp    1879 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    185c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    185f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1862:	01 d0                	add    %edx,%eax
    1864:	0f b6 00             	movzbl (%eax),%eax
    1867:	3c 3d                	cmp    $0x3d,%al
    1869:	75 0a                	jne    1875 <runCalcmd+0x3f>
    {
      hasEqu++;
    186b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    186f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1872:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    1875:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1879:	8b 55 ec             	mov    -0x14(%ebp),%edx
    187c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    187f:	01 d0                	add    %edx,%eax
    1881:	0f b6 00             	movzbl (%eax),%eax
    1884:	84 c0                	test   %al,%al
    1886:	75 d4                	jne    185c <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    1888:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    188c:	7e 1d                	jle    18ab <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    188e:	83 ec 0c             	sub    $0xc,%esp
    1891:	68 6c 3a 00 00       	push   $0x3a6c
    1896:	6a 00                	push   $0x0
    1898:	6a 00                	push   $0x0
    189a:	6a 01                	push   $0x1
    189c:	6a 04                	push   $0x4
    189e:	e8 21 17 00 00       	call   2fc4 <color_printf>
    18a3:	83 c4 20             	add    $0x20,%esp
    18a6:	e9 78 05 00 00       	jmp    1e23 <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    18ab:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    18af:	0f 85 26 05 00 00    	jne    1ddb <runCalcmd+0x5a5>
  {
    int i=0;
    18b5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    18bc:	eb 04                	jmp    18c2 <runCalcmd+0x8c>
    {
      i++;
    18be:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    18c2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    18c5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18c8:	01 d0                	add    %edx,%eax
    18ca:	0f b6 00             	movzbl (%eax),%eax
    18cd:	3c 20                	cmp    $0x20,%al
    18cf:	74 ed                	je     18be <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    18d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    18d7:	eb 23                	jmp    18fc <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    18d9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    18dc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18df:	01 d0                	add    %edx,%eax
    18e1:	0f b6 00             	movzbl (%eax),%eax
    18e4:	0f be c0             	movsbl %al,%eax
    18e7:	83 ec 0c             	sub    $0xc,%esp
    18ea:	50                   	push   %eax
    18eb:	e8 ed fe ff ff       	call   17dd <isNameChar>
    18f0:	83 c4 10             	add    $0x10,%esp
    18f3:	83 f8 01             	cmp    $0x1,%eax
    18f6:	75 0e                	jne    1906 <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    18f8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    18fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18ff:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1902:	7c d5                	jl     18d9 <runCalcmd+0xa3>
    1904:	eb 01                	jmp    1907 <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    1906:	90                   	nop
    }
    int len = i-startIndex;
    1907:	8b 45 e8             	mov    -0x18(%ebp),%eax
    190a:	2b 45 d0             	sub    -0x30(%ebp),%eax
    190d:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    1910:	eb 04                	jmp    1916 <runCalcmd+0xe0>
    {
      i++;
    1912:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    1916:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1919:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    191c:	01 d0                	add    %edx,%eax
    191e:	0f b6 00             	movzbl (%eax),%eax
    1921:	3c 20                	cmp    $0x20,%al
    1923:	74 ed                	je     1912 <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    1925:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1928:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    192b:	0f 85 90 04 00 00    	jne    1dc1 <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    1931:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1934:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1937:	01 d0                	add    %edx,%eax
    1939:	0f b6 00             	movzbl (%eax),%eax
    193c:	3c 2f                	cmp    $0x2f,%al
    193e:	7e 2c                	jle    196c <runCalcmd+0x136>
    1940:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1943:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1946:	01 d0                	add    %edx,%eax
    1948:	0f b6 00             	movzbl (%eax),%eax
    194b:	3c 39                	cmp    $0x39,%al
    194d:	7f 1d                	jg     196c <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    194f:	83 ec 0c             	sub    $0xc,%esp
    1952:	68 88 3a 00 00       	push   $0x3a88
    1957:	6a 00                	push   $0x0
    1959:	6a 00                	push   $0x0
    195b:	6a 01                	push   $0x1
    195d:	6a 04                	push   $0x4
    195f:	e8 60 16 00 00       	call   2fc4 <color_printf>
    1964:	83 c4 20             	add    $0x20,%esp
    1967:	e9 b7 04 00 00       	jmp    1e23 <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    196c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1973:	eb 20                	jmp    1995 <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    1975:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1978:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    197b:	01 d0                	add    %edx,%eax
    197d:	89 c2                	mov    %eax,%edx
    197f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1982:	01 d0                	add    %edx,%eax
    1984:	0f b6 00             	movzbl (%eax),%eax
    1987:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    198a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    198d:	01 ca                	add    %ecx,%edx
    198f:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1991:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1995:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1998:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    199b:	7c d8                	jl     1975 <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    199d:	8d 55 94             	lea    -0x6c(%ebp),%edx
    19a0:	8b 45 cc             	mov    -0x34(%ebp),%eax
    19a3:	01 d0                	add    %edx,%eax
    19a5:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    19a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ab:	83 c0 01             	add    $0x1,%eax
    19ae:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    19b1:	eb 04                	jmp    19b7 <runCalcmd+0x181>
        {
          i++;
    19b3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    19b7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19ba:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19bd:	01 d0                	add    %edx,%eax
    19bf:	0f b6 00             	movzbl (%eax),%eax
    19c2:	3c 20                	cmp    $0x20,%al
    19c4:	74 ed                	je     19b3 <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    19c6:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19cc:	01 d0                	add    %edx,%eax
    19ce:	0f b6 00             	movzbl (%eax),%eax
    19d1:	3c 60                	cmp    $0x60,%al
    19d3:	0f 85 e6 01 00 00    	jne    1bbf <runCalcmd+0x389>
        {
          i++;
    19d9:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    19dd:	8b 45 e0             	mov    -0x20(%ebp),%eax
    19e0:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    19e3:	eb 04                	jmp    19e9 <runCalcmd+0x1b3>
          {
            i++;
    19e5:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    19e9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19ec:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19ef:	01 d0                	add    %edx,%eax
    19f1:	0f b6 00             	movzbl (%eax),%eax
    19f4:	3c 60                	cmp    $0x60,%al
    19f6:	74 0f                	je     1a07 <runCalcmd+0x1d1>
    19f8:	8b 55 e0             	mov    -0x20(%ebp),%edx
    19fb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19fe:	01 d0                	add    %edx,%eax
    1a00:	0f b6 00             	movzbl (%eax),%eax
    1a03:	84 c0                	test   %al,%al
    1a05:	75 de                	jne    19e5 <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    1a07:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a0a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a0d:	01 d0                	add    %edx,%eax
    1a0f:	0f b6 00             	movzbl (%eax),%eax
    1a12:	3c 60                	cmp    $0x60,%al
    1a14:	0f 85 5c 01 00 00    	jne    1b76 <runCalcmd+0x340>
    1a1a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1a1d:	8d 50 01             	lea    0x1(%eax),%edx
    1a20:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a23:	01 d0                	add    %edx,%eax
    1a25:	0f b6 00             	movzbl (%eax),%eax
    1a28:	84 c0                	test   %al,%al
    1a2a:	0f 85 46 01 00 00    	jne    1b76 <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    1a30:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1a33:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a36:	01 d0                	add    %edx,%eax
    1a38:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    1a3b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    1a3e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a41:	01 d0                	add    %edx,%eax
    1a43:	83 ec 0c             	sub    $0xc,%esp
    1a46:	50                   	push   %eax
    1a47:	e8 c5 04 00 00       	call   1f11 <Compute>
    1a4c:	83 c4 10             	add    $0x10,%esp
    1a4f:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    1a52:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    1a58:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1a5c:	dd 1c 24             	fstpl  (%esp)
    1a5f:	ff 75 c4             	pushl  -0x3c(%ebp)
    1a62:	ff 75 c0             	pushl  -0x40(%ebp)
    1a65:	e8 30 f8 ff ff       	call   129a <isEqual>
    1a6a:	83 c4 10             	add    $0x10,%esp
    1a6d:	85 c0                	test   %eax,%eax
    1a6f:	0f 85 ad 03 00 00    	jne    1e22 <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    1a75:	a1 50 48 00 00       	mov    0x4850,%eax
    1a7a:	85 c0                	test   %eax,%eax
    1a7c:	75 15                	jne    1a93 <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1a7e:	83 ec 08             	sub    $0x8,%esp
    1a81:	68 50 48 00 00       	push   $0x4850
    1a86:	68 80 48 00 00       	push   $0x4880
    1a8b:	e8 ba 19 00 00       	call   344a <readVariables>
    1a90:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    1a93:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1a9a:	eb 26                	jmp    1ac2 <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1a9c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1a9f:	c1 e0 05             	shl    $0x5,%eax
    1aa2:	05 80 48 00 00       	add    $0x4880,%eax
    1aa7:	8d 50 04             	lea    0x4(%eax),%edx
    1aaa:	83 ec 08             	sub    $0x8,%esp
    1aad:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1ab0:	50                   	push   %eax
    1ab1:	52                   	push   %edx
    1ab2:	e8 38 e9 ff ff       	call   3ef <strcmp>
    1ab7:	83 c4 10             	add    $0x10,%esp
    1aba:	85 c0                	test   %eax,%eax
    1abc:	74 10                	je     1ace <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1abe:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    1ac2:	a1 50 48 00 00       	mov    0x4850,%eax
    1ac7:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1aca:	7c d0                	jl     1a9c <runCalcmd+0x266>
    1acc:	eb 01                	jmp    1acf <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1ace:	90                   	nop
              }
              if(index == v_num) //new variable
    1acf:	a1 50 48 00 00       	mov    0x4850,%eax
    1ad4:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1ad7:	75 3c                	jne    1b15 <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    1ad9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1adc:	c1 e0 05             	shl    $0x5,%eax
    1adf:	05 80 48 00 00       	add    $0x4880,%eax
    1ae4:	8d 50 04             	lea    0x4(%eax),%edx
    1ae7:	83 ec 08             	sub    $0x8,%esp
    1aea:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1aed:	50                   	push   %eax
    1aee:	52                   	push   %edx
    1aef:	e8 cb e8 ff ff       	call   3bf <strcpy>
    1af4:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    1af7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1afa:	c1 e0 05             	shl    $0x5,%eax
    1afd:	05 80 48 00 00       	add    $0x4880,%eax
    1b02:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    1b08:	a1 50 48 00 00       	mov    0x4850,%eax
    1b0d:	83 c0 01             	add    $0x1,%eax
    1b10:	a3 50 48 00 00       	mov    %eax,0x4850
              }
              variables[index].value.dvalue = result;
    1b15:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b18:	c1 e0 05             	shl    $0x5,%eax
    1b1b:	05 90 48 00 00       	add    $0x4890,%eax
    1b20:	dd 45 c0             	fldl   -0x40(%ebp)
    1b23:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    1b26:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b29:	c1 e0 05             	shl    $0x5,%eax
    1b2c:	05 90 48 00 00       	add    $0x4890,%eax
    1b31:	dd 40 08             	fldl   0x8(%eax)
    1b34:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b37:	c1 e0 05             	shl    $0x5,%eax
    1b3a:	05 80 48 00 00       	add    $0x4880,%eax
    1b3f:	83 c0 04             	add    $0x4,%eax
    1b42:	83 ec 0c             	sub    $0xc,%esp
    1b45:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1b49:	dd 1c 24             	fstpl  (%esp)
    1b4c:	50                   	push   %eax
    1b4d:	68 b2 3a 00 00       	push   $0x3ab2
    1b52:	6a 01                	push   $0x1
    1b54:	e8 43 ed ff ff       	call   89c <printf>
    1b59:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1b5c:	83 ec 08             	sub    $0x8,%esp
    1b5f:	68 50 48 00 00       	push   $0x4850
    1b64:	68 80 48 00 00       	push   $0x4880
    1b69:	e8 90 1b 00 00       	call   36fe <writeVariables>
    1b6e:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1b71:	e9 ac 02 00 00       	jmp    1e22 <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    1b76:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b79:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b7c:	01 d0                	add    %edx,%eax
    1b7e:	0f b6 00             	movzbl (%eax),%eax
    1b81:	84 c0                	test   %al,%al
    1b83:	75 1d                	jne    1ba2 <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    1b85:	83 ec 0c             	sub    $0xc,%esp
    1b88:	68 b9 3a 00 00       	push   $0x3ab9
    1b8d:	6a 00                	push   $0x0
    1b8f:	6a 00                	push   $0x0
    1b91:	6a 01                	push   $0x1
    1b93:	6a 04                	push   $0x4
    1b95:	e8 2a 14 00 00       	call   2fc4 <color_printf>
    1b9a:	83 c4 20             	add    $0x20,%esp
    1b9d:	e9 81 02 00 00       	jmp    1e23 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    1ba2:	83 ec 0c             	sub    $0xc,%esp
    1ba5:	68 d0 3a 00 00       	push   $0x3ad0
    1baa:	6a 00                	push   $0x0
    1bac:	6a 00                	push   $0x0
    1bae:	6a 01                	push   $0x1
    1bb0:	6a 04                	push   $0x4
    1bb2:	e8 0d 14 00 00       	call   2fc4 <color_printf>
    1bb7:	83 c4 20             	add    $0x20,%esp
    1bba:	e9 64 02 00 00       	jmp    1e23 <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1bbf:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1bc2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1bc5:	01 d0                	add    %edx,%eax
    1bc7:	0f b6 00             	movzbl (%eax),%eax
    1bca:	3c 22                	cmp    $0x22,%al
    1bcc:	0f 85 d5 01 00 00    	jne    1da7 <runCalcmd+0x571>
        {
          i++;
    1bd2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    1bd6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1bd9:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1bdc:	eb 04                	jmp    1be2 <runCalcmd+0x3ac>
          {
            i++;
    1bde:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1be2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1be5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1be8:	01 d0                	add    %edx,%eax
    1bea:	0f b6 00             	movzbl (%eax),%eax
    1bed:	3c 22                	cmp    $0x22,%al
    1bef:	74 0f                	je     1c00 <runCalcmd+0x3ca>
    1bf1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1bf4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1bf7:	01 d0                	add    %edx,%eax
    1bf9:	0f b6 00             	movzbl (%eax),%eax
    1bfc:	84 c0                	test   %al,%al
    1bfe:	75 de                	jne    1bde <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1c00:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1c03:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1c06:	01 d0                	add    %edx,%eax
    1c08:	0f b6 00             	movzbl (%eax),%eax
    1c0b:	3c 22                	cmp    $0x22,%al
    1c0d:	0f 85 4e 01 00 00    	jne    1d61 <runCalcmd+0x52b>
    1c13:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1c16:	8d 50 01             	lea    0x1(%eax),%edx
    1c19:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1c1c:	01 d0                	add    %edx,%eax
    1c1e:	0f b6 00             	movzbl (%eax),%eax
    1c21:	84 c0                	test   %al,%al
    1c23:	0f 85 38 01 00 00    	jne    1d61 <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1c29:	a1 50 48 00 00       	mov    0x4850,%eax
    1c2e:	85 c0                	test   %eax,%eax
    1c30:	75 15                	jne    1c47 <runCalcmd+0x411>
              readVariables(variables,&v_num);
    1c32:	83 ec 08             	sub    $0x8,%esp
    1c35:	68 50 48 00 00       	push   $0x4850
    1c3a:	68 80 48 00 00       	push   $0x4880
    1c3f:	e8 06 18 00 00       	call   344a <readVariables>
    1c44:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1c47:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1c4e:	eb 26                	jmp    1c76 <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    1c50:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1c53:	c1 e0 05             	shl    $0x5,%eax
    1c56:	05 80 48 00 00       	add    $0x4880,%eax
    1c5b:	8d 50 04             	lea    0x4(%eax),%edx
    1c5e:	83 ec 08             	sub    $0x8,%esp
    1c61:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1c64:	50                   	push   %eax
    1c65:	52                   	push   %edx
    1c66:	e8 84 e7 ff ff       	call   3ef <strcmp>
    1c6b:	83 c4 10             	add    $0x10,%esp
    1c6e:	85 c0                	test   %eax,%eax
    1c70:	74 10                	je     1c82 <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    1c72:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1c76:	a1 50 48 00 00       	mov    0x4850,%eax
    1c7b:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1c7e:	7c d0                	jl     1c50 <runCalcmd+0x41a>
    1c80:	eb 01                	jmp    1c83 <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    1c82:	90                   	nop
            }
            if(index == v_num) //new variable
    1c83:	a1 50 48 00 00       	mov    0x4850,%eax
    1c88:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1c8b:	75 2b                	jne    1cb8 <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1c8d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1c90:	c1 e0 05             	shl    $0x5,%eax
    1c93:	05 80 48 00 00       	add    $0x4880,%eax
    1c98:	8d 50 04             	lea    0x4(%eax),%edx
    1c9b:	83 ec 08             	sub    $0x8,%esp
    1c9e:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1ca1:	50                   	push   %eax
    1ca2:	52                   	push   %edx
    1ca3:	e8 17 e7 ff ff       	call   3bf <strcpy>
    1ca8:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1cab:	a1 50 48 00 00       	mov    0x4850,%eax
    1cb0:	83 c0 01             	add    $0x1,%eax
    1cb3:	a3 50 48 00 00       	mov    %eax,0x4850
            }
            variables[index].type = V_STRING;
    1cb8:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1cbb:	c1 e0 05             	shl    $0x5,%eax
    1cbe:	05 80 48 00 00       	add    $0x4880,%eax
    1cc3:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1cc9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1ccc:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1ccf:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1cd2:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1cd5:	83 c0 01             	add    $0x1,%eax
    1cd8:	83 ec 0c             	sub    $0xc,%esp
    1cdb:	50                   	push   %eax
    1cdc:	e8 bd ee ff ff       	call   b9e <malloc>
    1ce1:	83 c4 10             	add    $0x10,%esp
    1ce4:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1ce7:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1cea:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1ced:	01 d0                	add    %edx,%eax
    1cef:	83 ec 08             	sub    $0x8,%esp
    1cf2:	50                   	push   %eax
    1cf3:	ff 75 b4             	pushl  -0x4c(%ebp)
    1cf6:	e8 c4 e6 ff ff       	call   3bf <strcpy>
    1cfb:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1cfe:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1d01:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1d04:	01 d0                	add    %edx,%eax
    1d06:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1d09:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1d0c:	c1 e0 05             	shl    $0x5,%eax
    1d0f:	8d 90 98 48 00 00    	lea    0x4898(%eax),%edx
    1d15:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1d18:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1d1a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1d1d:	c1 e0 05             	shl    $0x5,%eax
    1d20:	05 98 48 00 00       	add    $0x4898,%eax
    1d25:	8b 00                	mov    (%eax),%eax
    1d27:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1d2a:	c1 e2 05             	shl    $0x5,%edx
    1d2d:	81 c2 80 48 00 00    	add    $0x4880,%edx
    1d33:	83 c2 04             	add    $0x4,%edx
    1d36:	50                   	push   %eax
    1d37:	52                   	push   %edx
    1d38:	68 f1 3a 00 00       	push   $0x3af1
    1d3d:	6a 01                	push   $0x1
    1d3f:	e8 58 eb ff ff       	call   89c <printf>
    1d44:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1d47:	83 ec 08             	sub    $0x8,%esp
    1d4a:	68 50 48 00 00       	push   $0x4850
    1d4f:	68 80 48 00 00       	push   $0x4880
    1d54:	e8 a5 19 00 00       	call   36fe <writeVariables>
    1d59:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1d5c:	e9 c2 00 00 00       	jmp    1e23 <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1d61:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1d64:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1d67:	01 d0                	add    %edx,%eax
    1d69:	0f b6 00             	movzbl (%eax),%eax
    1d6c:	84 c0                	test   %al,%al
    1d6e:	75 1d                	jne    1d8d <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1d70:	83 ec 0c             	sub    $0xc,%esp
    1d73:	68 fa 3a 00 00       	push   $0x3afa
    1d78:	6a 00                	push   $0x0
    1d7a:	6a 00                	push   $0x0
    1d7c:	6a 01                	push   $0x1
    1d7e:	6a 04                	push   $0x4
    1d80:	e8 3f 12 00 00       	call   2fc4 <color_printf>
    1d85:	83 c4 20             	add    $0x20,%esp
    1d88:	e9 96 00 00 00       	jmp    1e23 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1d8d:	83 ec 0c             	sub    $0xc,%esp
    1d90:	68 10 3b 00 00       	push   $0x3b10
    1d95:	6a 00                	push   $0x0
    1d97:	6a 00                	push   $0x0
    1d99:	6a 01                	push   $0x1
    1d9b:	6a 04                	push   $0x4
    1d9d:	e8 22 12 00 00       	call   2fc4 <color_printf>
    1da2:	83 c4 20             	add    $0x20,%esp
    1da5:	eb 7c                	jmp    1e23 <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1da7:	83 ec 0c             	sub    $0xc,%esp
    1daa:	68 31 3b 00 00       	push   $0x3b31
    1daf:	6a 00                	push   $0x0
    1db1:	6a 00                	push   $0x0
    1db3:	6a 01                	push   $0x1
    1db5:	6a 04                	push   $0x4
    1db7:	e8 08 12 00 00       	call   2fc4 <color_printf>
    1dbc:	83 c4 20             	add    $0x20,%esp
    1dbf:	eb 62                	jmp    1e23 <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1dc1:	83 ec 0c             	sub    $0xc,%esp
    1dc4:	68 31 3b 00 00       	push   $0x3b31
    1dc9:	6a 00                	push   $0x0
    1dcb:	6a 00                	push   $0x0
    1dcd:	6a 01                	push   $0x1
    1dcf:	6a 04                	push   $0x4
    1dd1:	e8 ee 11 00 00       	call   2fc4 <color_printf>
    1dd6:	83 c4 20             	add    $0x20,%esp
    1dd9:	eb 48                	jmp    1e23 <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1ddb:	83 ec 0c             	sub    $0xc,%esp
    1dde:	ff 75 d4             	pushl  -0x2c(%ebp)
    1de1:	e8 2b 01 00 00       	call   1f11 <Compute>
    1de6:	83 c4 10             	add    $0x10,%esp
    1de9:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1dec:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    1df2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1df6:	dd 1c 24             	fstpl  (%esp)
    1df9:	ff 75 ac             	pushl  -0x54(%ebp)
    1dfc:	ff 75 a8             	pushl  -0x58(%ebp)
    1dff:	e8 96 f4 ff ff       	call   129a <isEqual>
    1e04:	83 c4 10             	add    $0x10,%esp
    1e07:	85 c0                	test   %eax,%eax
    1e09:	75 18                	jne    1e23 <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1e0b:	ff 75 ac             	pushl  -0x54(%ebp)
    1e0e:	ff 75 a8             	pushl  -0x58(%ebp)
    1e11:	68 49 3b 00 00       	push   $0x3b49
    1e16:	6a 01                	push   $0x1
    1e18:	e8 7f ea ff ff       	call   89c <printf>
    1e1d:	83 c4 10             	add    $0x10,%esp
    1e20:	eb 01                	jmp    1e23 <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1e22:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1e23:	e8 c8 e7 ff ff       	call   5f0 <exit>

00001e28 <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1e28:	55                   	push   %ebp
    1e29:	89 e5                	mov    %esp,%ebp
    1e2b:	83 ec 04             	sub    $0x4,%esp
    1e2e:	8b 45 08             	mov    0x8(%ebp),%eax
    1e31:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1e34:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1e38:	83 e8 23             	sub    $0x23,%eax
    1e3b:	83 f8 0c             	cmp    $0xc,%eax
    1e3e:	77 25                	ja     1e65 <GetLevel+0x3d>
    1e40:	8b 04 85 50 3b 00 00 	mov    0x3b50(,%eax,4),%eax
    1e47:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1e49:	b8 01 00 00 00       	mov    $0x1,%eax
    1e4e:	eb 1a                	jmp    1e6a <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1e50:	b8 02 00 00 00       	mov    $0x2,%eax
    1e55:	eb 13                	jmp    1e6a <GetLevel+0x42>
    case '(':
        return 0;
    1e57:	b8 00 00 00 00       	mov    $0x0,%eax
    1e5c:	eb 0c                	jmp    1e6a <GetLevel+0x42>
    case '#':
        return -2;
    1e5e:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1e63:	eb 05                	jmp    1e6a <GetLevel+0x42>
    };
    return -1;
    1e65:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1e6a:	c9                   	leave  
    1e6b:	c3                   	ret    

00001e6c <Operate>:

double Operate(double a1, char op, double a2)
{
    1e6c:	55                   	push   %ebp
    1e6d:	89 e5                	mov    %esp,%ebp
    1e6f:	83 ec 28             	sub    $0x28,%esp
    1e72:	8b 45 10             	mov    0x10(%ebp),%eax
    1e75:	8b 55 08             	mov    0x8(%ebp),%edx
    1e78:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1e7b:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e7e:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1e81:	88 45 ec             	mov    %al,-0x14(%ebp)
    1e84:	8b 45 14             	mov    0x14(%ebp),%eax
    1e87:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1e8a:	8b 45 18             	mov    0x18(%ebp),%eax
    1e8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1e90:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1e94:	83 f8 2b             	cmp    $0x2b,%eax
    1e97:	74 18                	je     1eb1 <Operate+0x45>
    1e99:	83 f8 2b             	cmp    $0x2b,%eax
    1e9c:	7f 07                	jg     1ea5 <Operate+0x39>
    1e9e:	83 f8 2a             	cmp    $0x2a,%eax
    1ea1:	74 1e                	je     1ec1 <Operate+0x55>
    1ea3:	eb 68                	jmp    1f0d <Operate+0xa1>
    1ea5:	83 f8 2d             	cmp    $0x2d,%eax
    1ea8:	74 0f                	je     1eb9 <Operate+0x4d>
    1eaa:	83 f8 2f             	cmp    $0x2f,%eax
    1ead:	74 1a                	je     1ec9 <Operate+0x5d>
    1eaf:	eb 5c                	jmp    1f0d <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1eb1:	dd 45 f0             	fldl   -0x10(%ebp)
    1eb4:	dc 45 e0             	faddl  -0x20(%ebp)
    1eb7:	eb 56                	jmp    1f0f <Operate+0xa3>
    case '-':
        return a1 - a2;
    1eb9:	dd 45 f0             	fldl   -0x10(%ebp)
    1ebc:	dc 65 e0             	fsubl  -0x20(%ebp)
    1ebf:	eb 4e                	jmp    1f0f <Operate+0xa3>
    case '*':
        return a1 * a2;
    1ec1:	dd 45 f0             	fldl   -0x10(%ebp)
    1ec4:	dc 4d e0             	fmull  -0x20(%ebp)
    1ec7:	eb 46                	jmp    1f0f <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1ec9:	d9 ee                	fldz   
    1ecb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1ecf:	dd 1c 24             	fstpl  (%esp)
    1ed2:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ed5:	ff 75 e0             	pushl  -0x20(%ebp)
    1ed8:	e8 bd f3 ff ff       	call   129a <isEqual>
    1edd:	83 c4 10             	add    $0x10,%esp
    1ee0:	83 f8 01             	cmp    $0x1,%eax
    1ee3:	75 20                	jne    1f05 <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    1ee5:	83 ec 0c             	sub    $0xc,%esp
    1ee8:	68 84 3b 00 00       	push   $0x3b84
    1eed:	6a 00                	push   $0x0
    1eef:	6a 00                	push   $0x0
    1ef1:	6a 01                	push   $0x1
    1ef3:	6a 04                	push   $0x4
    1ef5:	e8 ca 10 00 00       	call   2fc4 <color_printf>
    1efa:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    1efd:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    1f03:	eb 0a                	jmp    1f0f <Operate+0xa3>
        }
        else
          return a1 / a2;
    1f05:	dd 45 f0             	fldl   -0x10(%ebp)
    1f08:	dc 75 e0             	fdivl  -0x20(%ebp)
    1f0b:	eb 02                	jmp    1f0f <Operate+0xa3>
    };
    return 1;
    1f0d:	d9 e8                	fld1   
}
    1f0f:	c9                   	leave  
    1f10:	c3                   	ret    

00001f11 <Compute>:

double Compute(char *s)
{
    1f11:	55                   	push   %ebp
    1f12:	89 e5                	mov    %esp,%ebp
    1f14:	53                   	push   %ebx
    1f15:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    1f1b:	e8 44 14 00 00       	call   3364 <dstack>
    1f20:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    1f23:	e8 73 13 00 00       	call   329b <cstack>
    1f28:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    1f2b:	83 ec 08             	sub    $0x8,%esp
    1f2e:	6a 23                	push   $0x23
    1f30:	ff 75 e0             	pushl  -0x20(%ebp)
    1f33:	e8 91 13 00 00       	call   32c9 <pushc>
    1f38:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    1f3b:	83 ec 0c             	sub    $0xc,%esp
    1f3e:	ff 75 08             	pushl  0x8(%ebp)
    1f41:	e8 e8 e4 ff ff       	call   42e <strlen>
    1f46:	83 c4 10             	add    $0x10,%esp
    1f49:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    1f4c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    1f53:	c7 05 60 48 00 00 00 	movl   $0x0,0x4860
    1f5a:	00 00 00 
    1f5d:	e9 58 05 00 00       	jmp    24ba <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    1f62:	a1 60 48 00 00       	mov    0x4860,%eax
    1f67:	89 c2                	mov    %eax,%edx
    1f69:	8b 45 08             	mov    0x8(%ebp),%eax
    1f6c:	01 d0                	add    %edx,%eax
    1f6e:	0f b6 00             	movzbl (%eax),%eax
    1f71:	3c 24                	cmp    $0x24,%al
    1f73:	0f 85 f8 01 00 00    	jne    2171 <Compute+0x260>
        {
          is_minus = 0;
    1f79:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    1f80:	a1 60 48 00 00       	mov    0x4860,%eax
    1f85:	83 c0 01             	add    $0x1,%eax
    1f88:	a3 60 48 00 00       	mov    %eax,0x4860
          if(s[g_pos] != '{')
    1f8d:	a1 60 48 00 00       	mov    0x4860,%eax
    1f92:	89 c2                	mov    %eax,%edx
    1f94:	8b 45 08             	mov    0x8(%ebp),%eax
    1f97:	01 d0                	add    %edx,%eax
    1f99:	0f b6 00             	movzbl (%eax),%eax
    1f9c:	3c 7b                	cmp    $0x7b,%al
    1f9e:	74 23                	je     1fc3 <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    1fa0:	83 ec 0c             	sub    $0xc,%esp
    1fa3:	68 9c 3b 00 00       	push   $0x3b9c
    1fa8:	6a 00                	push   $0x0
    1faa:	6a 00                	push   $0x0
    1fac:	6a 01                	push   $0x1
    1fae:	6a 04                	push   $0x4
    1fb0:	e8 0f 10 00 00       	call   2fc4 <color_printf>
    1fb5:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    1fb8:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    1fbe:	e9 24 06 00 00       	jmp    25e7 <Compute+0x6d6>
          }
          int i=g_pos+1;
    1fc3:	a1 60 48 00 00       	mov    0x4860,%eax
    1fc8:	83 c0 01             	add    $0x1,%eax
    1fcb:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    1fce:	eb 13                	jmp    1fe3 <Compute+0xd2>
          {
            if(s[i] == '}')
    1fd0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1fd3:	8b 45 08             	mov    0x8(%ebp),%eax
    1fd6:	01 d0                	add    %edx,%eax
    1fd8:	0f b6 00             	movzbl (%eax),%eax
    1fdb:	3c 7d                	cmp    $0x7d,%al
    1fdd:	74 0e                	je     1fed <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    1fdf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1fe3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1fe6:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1fe9:	7c e5                	jl     1fd0 <Compute+0xbf>
    1feb:	eb 01                	jmp    1fee <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    1fed:	90                   	nop
          }
          if(s[i] != '}')
    1fee:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1ff1:	8b 45 08             	mov    0x8(%ebp),%eax
    1ff4:	01 d0                	add    %edx,%eax
    1ff6:	0f b6 00             	movzbl (%eax),%eax
    1ff9:	3c 7d                	cmp    $0x7d,%al
    1ffb:	74 23                	je     2020 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    1ffd:	83 ec 0c             	sub    $0xc,%esp
    2000:	68 aa 3b 00 00       	push   $0x3baa
    2005:	6a 00                	push   $0x0
    2007:	6a 00                	push   $0x0
    2009:	6a 01                	push   $0x1
    200b:	6a 04                	push   $0x4
    200d:	e8 b2 0f 00 00       	call   2fc4 <color_printf>
    2012:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    2015:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    201b:	e9 c7 05 00 00       	jmp    25e7 <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    2020:	a1 60 48 00 00       	mov    0x4860,%eax
    2025:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2028:	29 c2                	sub    %eax,%edx
    202a:	89 d0                	mov    %edx,%eax
    202c:	83 e8 01             	sub    $0x1,%eax
    202f:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    2032:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    2039:	eb 27                	jmp    2062 <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    203b:	8b 15 60 48 00 00    	mov    0x4860,%edx
    2041:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2044:	01 d0                	add    %edx,%eax
    2046:	8d 50 01             	lea    0x1(%eax),%edx
    2049:	8b 45 08             	mov    0x8(%ebp),%eax
    204c:	01 d0                	add    %edx,%eax
    204e:	0f b6 00             	movzbl (%eax),%eax
    2051:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    2057:	8b 55 ec             	mov    -0x14(%ebp),%edx
    205a:	01 ca                	add    %ecx,%edx
    205c:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    205e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    2062:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2065:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    2068:	7c d1                	jl     203b <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    206a:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    2070:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2073:	01 d0                	add    %edx,%eax
    2075:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    2078:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    207f:	a1 50 48 00 00       	mov    0x4850,%eax
    2084:	85 c0                	test   %eax,%eax
    2086:	75 40                	jne    20c8 <Compute+0x1b7>
            readVariables(variables,&v_num);
    2088:	83 ec 08             	sub    $0x8,%esp
    208b:	68 50 48 00 00       	push   $0x4850
    2090:	68 80 48 00 00       	push   $0x4880
    2095:	e8 b0 13 00 00       	call   344a <readVariables>
    209a:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    209d:	eb 29                	jmp    20c8 <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    209f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    20a2:	c1 e0 05             	shl    $0x5,%eax
    20a5:	05 80 48 00 00       	add    $0x4880,%eax
    20aa:	8d 50 04             	lea    0x4(%eax),%edx
    20ad:	83 ec 08             	sub    $0x8,%esp
    20b0:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    20b6:	50                   	push   %eax
    20b7:	52                   	push   %edx
    20b8:	e8 32 e3 ff ff       	call   3ef <strcmp>
    20bd:	83 c4 10             	add    $0x10,%esp
    20c0:	85 c0                	test   %eax,%eax
    20c2:	74 10                	je     20d4 <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    20c4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    20c8:	a1 50 48 00 00       	mov    0x4850,%eax
    20cd:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    20d0:	7c cd                	jl     209f <Compute+0x18e>
    20d2:	eb 01                	jmp    20d5 <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    20d4:	90                   	nop
          }
          if(index == v_num) //no such variable
    20d5:	a1 50 48 00 00       	mov    0x4850,%eax
    20da:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    20dd:	75 2a                	jne    2109 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    20df:	83 ec 08             	sub    $0x8,%esp
    20e2:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    20e8:	50                   	push   %eax
    20e9:	68 b8 3b 00 00       	push   $0x3bb8
    20ee:	6a 00                	push   $0x0
    20f0:	6a 00                	push   $0x0
    20f2:	6a 01                	push   $0x1
    20f4:	6a 04                	push   $0x4
    20f6:	e8 c9 0e 00 00       	call   2fc4 <color_printf>
    20fb:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    20fe:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    2104:	e9 de 04 00 00       	jmp    25e7 <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    2109:	8b 45 e8             	mov    -0x18(%ebp),%eax
    210c:	c1 e0 05             	shl    $0x5,%eax
    210f:	05 80 48 00 00       	add    $0x4880,%eax
    2114:	8b 00                	mov    (%eax),%eax
    2116:	83 f8 02             	cmp    $0x2,%eax
    2119:	75 23                	jne    213e <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    211b:	83 ec 0c             	sub    $0xc,%esp
    211e:	68 d2 3b 00 00       	push   $0x3bd2
    2123:	6a 00                	push   $0x0
    2125:	6a 00                	push   $0x0
    2127:	6a 01                	push   $0x1
    2129:	6a 04                	push   $0x4
    212b:	e8 94 0e 00 00       	call   2fc4 <color_printf>
    2130:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    2133:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    2139:	e9 a9 04 00 00       	jmp    25e7 <Compute+0x6d6>
          }
          g_pos = i+1;
    213e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2141:	83 c0 01             	add    $0x1,%eax
    2144:	a3 60 48 00 00       	mov    %eax,0x4860
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    2149:	8b 45 e8             	mov    -0x18(%ebp),%eax
    214c:	c1 e0 05             	shl    $0x5,%eax
    214f:	05 90 48 00 00       	add    $0x4890,%eax
    2154:	dd 40 08             	fldl   0x8(%eax)
    2157:	83 ec 04             	sub    $0x4,%esp
    215a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    215e:	dd 1c 24             	fstpl  (%esp)
    2161:	ff 75 e4             	pushl  -0x1c(%ebp)
    2164:	e8 2f 12 00 00       	call   3398 <pushd>
    2169:	83 c4 10             	add    $0x10,%esp
    216c:	e9 49 03 00 00       	jmp    24ba <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    2171:	a1 60 48 00 00       	mov    0x4860,%eax
    2176:	89 c2                	mov    %eax,%edx
    2178:	8b 45 08             	mov    0x8(%ebp),%eax
    217b:	01 d0                	add    %edx,%eax
    217d:	0f b6 00             	movzbl (%eax),%eax
    2180:	3c 2d                	cmp    $0x2d,%al
    2182:	75 3f                	jne    21c3 <Compute+0x2b2>
    2184:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2188:	74 39                	je     21c3 <Compute+0x2b2>
        {
            pushd(opnd,0);
    218a:	83 ec 04             	sub    $0x4,%esp
    218d:	d9 ee                	fldz   
    218f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2193:	dd 1c 24             	fstpl  (%esp)
    2196:	ff 75 e4             	pushl  -0x1c(%ebp)
    2199:	e8 fa 11 00 00       	call   3398 <pushd>
    219e:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    21a1:	83 ec 08             	sub    $0x8,%esp
    21a4:	6a 2d                	push   $0x2d
    21a6:	ff 75 e0             	pushl  -0x20(%ebp)
    21a9:	e8 1b 11 00 00       	call   32c9 <pushc>
    21ae:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    21b1:	a1 60 48 00 00       	mov    0x4860,%eax
    21b6:	83 c0 01             	add    $0x1,%eax
    21b9:	a3 60 48 00 00       	mov    %eax,0x4860
    21be:	e9 f7 02 00 00       	jmp    24ba <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    21c3:	a1 60 48 00 00       	mov    0x4860,%eax
    21c8:	89 c2                	mov    %eax,%edx
    21ca:	8b 45 08             	mov    0x8(%ebp),%eax
    21cd:	01 d0                	add    %edx,%eax
    21cf:	0f b6 00             	movzbl (%eax),%eax
    21d2:	3c 29                	cmp    $0x29,%al
    21d4:	0f 85 01 01 00 00    	jne    22db <Compute+0x3ca>
        {
            is_minus = 0;
    21da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    21e1:	a1 60 48 00 00       	mov    0x4860,%eax
    21e6:	83 c0 01             	add    $0x1,%eax
    21e9:	a3 60 48 00 00       	mov    %eax,0x4860
            while (topc(optr) != '(')
    21ee:	e9 bf 00 00 00       	jmp    22b2 <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    21f3:	83 ec 0c             	sub    $0xc,%esp
    21f6:	ff 75 e4             	pushl  -0x1c(%ebp)
    21f9:	e8 37 12 00 00       	call   3435 <topd>
    21fe:	83 c4 10             	add    $0x10,%esp
    2201:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    2204:	83 ec 0c             	sub    $0xc,%esp
    2207:	ff 75 e4             	pushl  -0x1c(%ebp)
    220a:	e8 dd 11 00 00       	call   33ec <popd>
    220f:	dd d8                	fstp   %st(0)
    2211:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    2214:	83 ec 0c             	sub    $0xc,%esp
    2217:	ff 75 e4             	pushl  -0x1c(%ebp)
    221a:	e8 16 12 00 00       	call   3435 <topd>
    221f:	83 c4 10             	add    $0x10,%esp
    2222:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    2225:	83 ec 0c             	sub    $0xc,%esp
    2228:	ff 75 e4             	pushl  -0x1c(%ebp)
    222b:	e8 bc 11 00 00       	call   33ec <popd>
    2230:	dd d8                	fstp   %st(0)
    2232:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    2235:	83 ec 0c             	sub    $0xc,%esp
    2238:	ff 75 e0             	pushl  -0x20(%ebp)
    223b:	e8 11 11 00 00       	call   3351 <topc>
    2240:	83 c4 10             	add    $0x10,%esp
    2243:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    2246:	83 ec 0c             	sub    $0xc,%esp
    2249:	ff 75 e0             	pushl  -0x20(%ebp)
    224c:	e8 be 10 00 00       	call   330f <popc>
    2251:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    2254:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    2258:	83 ec 0c             	sub    $0xc,%esp
    225b:	ff 75 d4             	pushl  -0x2c(%ebp)
    225e:	ff 75 d0             	pushl  -0x30(%ebp)
    2261:	50                   	push   %eax
    2262:	ff 75 cc             	pushl  -0x34(%ebp)
    2265:	ff 75 c8             	pushl  -0x38(%ebp)
    2268:	e8 ff fb ff ff       	call   1e6c <Operate>
    226d:	83 c4 20             	add    $0x20,%esp
    2270:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    2273:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    2279:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    227d:	dd 1c 24             	fstpl  (%esp)
    2280:	ff 75 bc             	pushl  -0x44(%ebp)
    2283:	ff 75 b8             	pushl  -0x48(%ebp)
    2286:	e8 0f f0 ff ff       	call   129a <isEqual>
    228b:	83 c4 10             	add    $0x10,%esp
    228e:	83 f8 01             	cmp    $0x1,%eax
    2291:	75 0b                	jne    229e <Compute+0x38d>
                  return WRONG_ANS;
    2293:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    2299:	e9 49 03 00 00       	jmp    25e7 <Compute+0x6d6>
                pushd(opnd,result);
    229e:	83 ec 04             	sub    $0x4,%esp
    22a1:	ff 75 bc             	pushl  -0x44(%ebp)
    22a4:	ff 75 b8             	pushl  -0x48(%ebp)
    22a7:	ff 75 e4             	pushl  -0x1c(%ebp)
    22aa:	e8 e9 10 00 00       	call   3398 <pushd>
    22af:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    22b2:	83 ec 0c             	sub    $0xc,%esp
    22b5:	ff 75 e0             	pushl  -0x20(%ebp)
    22b8:	e8 94 10 00 00       	call   3351 <topc>
    22bd:	83 c4 10             	add    $0x10,%esp
    22c0:	3c 28                	cmp    $0x28,%al
    22c2:	0f 85 2b ff ff ff    	jne    21f3 <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    22c8:	83 ec 0c             	sub    $0xc,%esp
    22cb:	ff 75 e0             	pushl  -0x20(%ebp)
    22ce:	e8 3c 10 00 00       	call   330f <popc>
    22d3:	83 c4 10             	add    $0x10,%esp
    22d6:	e9 df 01 00 00       	jmp    24ba <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    22db:	a1 60 48 00 00       	mov    0x4860,%eax
    22e0:	89 c2                	mov    %eax,%edx
    22e2:	8b 45 08             	mov    0x8(%ebp),%eax
    22e5:	01 d0                	add    %edx,%eax
    22e7:	0f b6 00             	movzbl (%eax),%eax
    22ea:	3c 2f                	cmp    $0x2f,%al
    22ec:	7e 49                	jle    2337 <Compute+0x426>
    22ee:	a1 60 48 00 00       	mov    0x4860,%eax
    22f3:	89 c2                	mov    %eax,%edx
    22f5:	8b 45 08             	mov    0x8(%ebp),%eax
    22f8:	01 d0                	add    %edx,%eax
    22fa:	0f b6 00             	movzbl (%eax),%eax
    22fd:	3c 39                	cmp    $0x39,%al
    22ff:	7f 36                	jg     2337 <Compute+0x426>
        {
            is_minus = 0;
    2301:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    2308:	83 ec 08             	sub    $0x8,%esp
    230b:	68 60 48 00 00       	push   $0x4860
    2310:	ff 75 08             	pushl  0x8(%ebp)
    2313:	e8 c3 eb ff ff       	call   edb <Translation>
    2318:	83 c4 10             	add    $0x10,%esp
    231b:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    231e:	83 ec 04             	sub    $0x4,%esp
    2321:	ff 75 b4             	pushl  -0x4c(%ebp)
    2324:	ff 75 b0             	pushl  -0x50(%ebp)
    2327:	ff 75 e4             	pushl  -0x1c(%ebp)
    232a:	e8 69 10 00 00       	call   3398 <pushd>
    232f:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    2332:	e9 83 01 00 00       	jmp    24ba <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    2337:	a1 60 48 00 00       	mov    0x4860,%eax
    233c:	89 c2                	mov    %eax,%edx
    233e:	8b 45 08             	mov    0x8(%ebp),%eax
    2341:	01 d0                	add    %edx,%eax
    2343:	0f b6 00             	movzbl (%eax),%eax
    2346:	3c 28                	cmp    $0x28,%al
    2348:	0f 85 f9 00 00 00    	jne    2447 <Compute+0x536>
        {
            is_minus = 1;
    234e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    2355:	a1 60 48 00 00       	mov    0x4860,%eax
    235a:	89 c2                	mov    %eax,%edx
    235c:	8b 45 08             	mov    0x8(%ebp),%eax
    235f:	01 d0                	add    %edx,%eax
    2361:	0f b6 00             	movzbl (%eax),%eax
    2364:	0f be c0             	movsbl %al,%eax
    2367:	83 ec 08             	sub    $0x8,%esp
    236a:	50                   	push   %eax
    236b:	ff 75 e0             	pushl  -0x20(%ebp)
    236e:	e8 56 0f 00 00       	call   32c9 <pushc>
    2373:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    2376:	a1 60 48 00 00       	mov    0x4860,%eax
    237b:	83 c0 01             	add    $0x1,%eax
    237e:	a3 60 48 00 00       	mov    %eax,0x4860
    2383:	e9 32 01 00 00       	jmp    24ba <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    2388:	83 ec 0c             	sub    $0xc,%esp
    238b:	ff 75 e4             	pushl  -0x1c(%ebp)
    238e:	e8 a2 10 00 00       	call   3435 <topd>
    2393:	83 c4 10             	add    $0x10,%esp
    2396:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    2399:	83 ec 0c             	sub    $0xc,%esp
    239c:	ff 75 e4             	pushl  -0x1c(%ebp)
    239f:	e8 48 10 00 00       	call   33ec <popd>
    23a4:	dd d8                	fstp   %st(0)
    23a6:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    23a9:	83 ec 0c             	sub    $0xc,%esp
    23ac:	ff 75 e4             	pushl  -0x1c(%ebp)
    23af:	e8 81 10 00 00       	call   3435 <topd>
    23b4:	83 c4 10             	add    $0x10,%esp
    23b7:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    23ba:	83 ec 0c             	sub    $0xc,%esp
    23bd:	ff 75 e4             	pushl  -0x1c(%ebp)
    23c0:	e8 27 10 00 00       	call   33ec <popd>
    23c5:	dd d8                	fstp   %st(0)
    23c7:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    23ca:	83 ec 0c             	sub    $0xc,%esp
    23cd:	ff 75 e0             	pushl  -0x20(%ebp)
    23d0:	e8 7c 0f 00 00       	call   3351 <topc>
    23d5:	83 c4 10             	add    $0x10,%esp
    23d8:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    23db:	83 ec 0c             	sub    $0xc,%esp
    23de:	ff 75 e0             	pushl  -0x20(%ebp)
    23e1:	e8 29 0f 00 00       	call   330f <popc>
    23e6:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    23e9:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    23ed:	83 ec 0c             	sub    $0xc,%esp
    23f0:	ff 75 ac             	pushl  -0x54(%ebp)
    23f3:	ff 75 a8             	pushl  -0x58(%ebp)
    23f6:	50                   	push   %eax
    23f7:	ff 75 a4             	pushl  -0x5c(%ebp)
    23fa:	ff 75 a0             	pushl  -0x60(%ebp)
    23fd:	e8 6a fa ff ff       	call   1e6c <Operate>
    2402:	83 c4 20             	add    $0x20,%esp
    2405:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    2408:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    240e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2412:	dd 1c 24             	fstpl  (%esp)
    2415:	ff 75 94             	pushl  -0x6c(%ebp)
    2418:	ff 75 90             	pushl  -0x70(%ebp)
    241b:	e8 7a ee ff ff       	call   129a <isEqual>
    2420:	83 c4 10             	add    $0x10,%esp
    2423:	83 f8 01             	cmp    $0x1,%eax
    2426:	75 0b                	jne    2433 <Compute+0x522>
                  return WRONG_ANS;
    2428:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    242e:	e9 b4 01 00 00       	jmp    25e7 <Compute+0x6d6>
                pushd(opnd,result);
    2433:	83 ec 04             	sub    $0x4,%esp
    2436:	ff 75 94             	pushl  -0x6c(%ebp)
    2439:	ff 75 90             	pushl  -0x70(%ebp)
    243c:	ff 75 e4             	pushl  -0x1c(%ebp)
    243f:	e8 54 0f 00 00       	call   3398 <pushd>
    2444:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    2447:	a1 60 48 00 00       	mov    0x4860,%eax
    244c:	89 c2                	mov    %eax,%edx
    244e:	8b 45 08             	mov    0x8(%ebp),%eax
    2451:	01 d0                	add    %edx,%eax
    2453:	0f b6 00             	movzbl (%eax),%eax
    2456:	0f be c0             	movsbl %al,%eax
    2459:	83 ec 0c             	sub    $0xc,%esp
    245c:	50                   	push   %eax
    245d:	e8 c6 f9 ff ff       	call   1e28 <GetLevel>
    2462:	83 c4 10             	add    $0x10,%esp
    2465:	89 c3                	mov    %eax,%ebx
    2467:	83 ec 0c             	sub    $0xc,%esp
    246a:	ff 75 e0             	pushl  -0x20(%ebp)
    246d:	e8 df 0e 00 00       	call   3351 <topc>
    2472:	83 c4 10             	add    $0x10,%esp
    2475:	0f be c0             	movsbl %al,%eax
    2478:	83 ec 0c             	sub    $0xc,%esp
    247b:	50                   	push   %eax
    247c:	e8 a7 f9 ff ff       	call   1e28 <GetLevel>
    2481:	83 c4 10             	add    $0x10,%esp
    2484:	39 c3                	cmp    %eax,%ebx
    2486:	0f 8e fc fe ff ff    	jle    2388 <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    248c:	a1 60 48 00 00       	mov    0x4860,%eax
    2491:	89 c2                	mov    %eax,%edx
    2493:	8b 45 08             	mov    0x8(%ebp),%eax
    2496:	01 d0                	add    %edx,%eax
    2498:	0f b6 00             	movzbl (%eax),%eax
    249b:	0f be c0             	movsbl %al,%eax
    249e:	83 ec 08             	sub    $0x8,%esp
    24a1:	50                   	push   %eax
    24a2:	ff 75 e0             	pushl  -0x20(%ebp)
    24a5:	e8 1f 0e 00 00       	call   32c9 <pushc>
    24aa:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    24ad:	a1 60 48 00 00       	mov    0x4860,%eax
    24b2:	83 c0 01             	add    $0x1,%eax
    24b5:	a3 60 48 00 00       	mov    %eax,0x4860
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    24ba:	a1 60 48 00 00       	mov    0x4860,%eax
    24bf:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    24c2:	0f 8c 9a fa ff ff    	jl     1f62 <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    24c8:	e9 da 00 00 00       	jmp    25a7 <Compute+0x696>
    {
        double a2 = topd(opnd);
    24cd:	83 ec 0c             	sub    $0xc,%esp
    24d0:	ff 75 e4             	pushl  -0x1c(%ebp)
    24d3:	e8 5d 0f 00 00       	call   3435 <topd>
    24d8:	83 c4 10             	add    $0x10,%esp
    24db:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    24de:	83 ec 0c             	sub    $0xc,%esp
    24e1:	ff 75 e4             	pushl  -0x1c(%ebp)
    24e4:	e8 03 0f 00 00       	call   33ec <popd>
    24e9:	dd d8                	fstp   %st(0)
    24eb:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    24ee:	83 ec 0c             	sub    $0xc,%esp
    24f1:	ff 75 e4             	pushl  -0x1c(%ebp)
    24f4:	e8 3c 0f 00 00       	call   3435 <topd>
    24f9:	83 c4 10             	add    $0x10,%esp
    24fc:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    2502:	83 ec 0c             	sub    $0xc,%esp
    2505:	ff 75 e4             	pushl  -0x1c(%ebp)
    2508:	e8 df 0e 00 00       	call   33ec <popd>
    250d:	dd d8                	fstp   %st(0)
    250f:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    2512:	83 ec 0c             	sub    $0xc,%esp
    2515:	ff 75 e0             	pushl  -0x20(%ebp)
    2518:	e8 34 0e 00 00       	call   3351 <topc>
    251d:	83 c4 10             	add    $0x10,%esp
    2520:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    2526:	83 ec 0c             	sub    $0xc,%esp
    2529:	ff 75 e0             	pushl  -0x20(%ebp)
    252c:	e8 de 0d 00 00       	call   330f <popc>
    2531:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    2534:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    253b:	83 ec 0c             	sub    $0xc,%esp
    253e:	ff 75 84             	pushl  -0x7c(%ebp)
    2541:	ff 75 80             	pushl  -0x80(%ebp)
    2544:	50                   	push   %eax
    2545:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    254b:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    2551:	e8 16 f9 ff ff       	call   1e6c <Operate>
    2556:	83 c4 20             	add    $0x20,%esp
    2559:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    255f:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    2565:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2569:	dd 1c 24             	fstpl  (%esp)
    256c:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2572:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    2578:	e8 1d ed ff ff       	call   129a <isEqual>
    257d:	83 c4 10             	add    $0x10,%esp
    2580:	83 f8 01             	cmp    $0x1,%eax
    2583:	75 08                	jne    258d <Compute+0x67c>
          return WRONG_ANS;
    2585:	dd 05 f8 3b 00 00    	fldl   0x3bf8
    258b:	eb 5a                	jmp    25e7 <Compute+0x6d6>
        pushd(opnd,result);
    258d:	83 ec 04             	sub    $0x4,%esp
    2590:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    2596:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    259c:	ff 75 e4             	pushl  -0x1c(%ebp)
    259f:	e8 f4 0d 00 00       	call   3398 <pushd>
    25a4:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    25a7:	83 ec 0c             	sub    $0xc,%esp
    25aa:	ff 75 e0             	pushl  -0x20(%ebp)
    25ad:	e8 9f 0d 00 00       	call   3351 <topc>
    25b2:	83 c4 10             	add    $0x10,%esp
    25b5:	3c 23                	cmp    $0x23,%al
    25b7:	0f 85 10 ff ff ff    	jne    24cd <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    25bd:	83 ec 0c             	sub    $0xc,%esp
    25c0:	ff 75 e4             	pushl  -0x1c(%ebp)
    25c3:	e8 94 e4 ff ff       	call   a5c <free>
    25c8:	83 c4 10             	add    $0x10,%esp
    free(optr);
    25cb:	83 ec 0c             	sub    $0xc,%esp
    25ce:	ff 75 e0             	pushl  -0x20(%ebp)
    25d1:	e8 86 e4 ff ff       	call   a5c <free>
    25d6:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    25d9:	83 ec 0c             	sub    $0xc,%esp
    25dc:	ff 75 e4             	pushl  -0x1c(%ebp)
    25df:	e8 51 0e 00 00       	call   3435 <topd>
    25e4:	83 c4 10             	add    $0x10,%esp
}
    25e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    25ea:	c9                   	leave  
    25eb:	c3                   	ret    

000025ec <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    25ec:	55                   	push   %ebp
    25ed:	89 e5                	mov    %esp,%ebp
    25ef:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    25f2:	8b 45 08             	mov    0x8(%ebp),%eax
    25f5:	8b 00                	mov    (%eax),%eax
    25f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    25fa:	eb 04                	jmp    2600 <gettoken+0x14>
    s++;
    25fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2600:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2603:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2606:	73 1e                	jae    2626 <gettoken+0x3a>
    2608:	8b 45 f4             	mov    -0xc(%ebp),%eax
    260b:	0f b6 00             	movzbl (%eax),%eax
    260e:	0f be c0             	movsbl %al,%eax
    2611:	83 ec 08             	sub    $0x8,%esp
    2614:	50                   	push   %eax
    2615:	68 b4 47 00 00       	push   $0x47b4
    261a:	e8 50 de ff ff       	call   46f <strchr>
    261f:	83 c4 10             	add    $0x10,%esp
    2622:	85 c0                	test   %eax,%eax
    2624:	75 d6                	jne    25fc <gettoken+0x10>
    s++;
  if(q)
    2626:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    262a:	74 08                	je     2634 <gettoken+0x48>
    *q = s;
    262c:	8b 45 10             	mov    0x10(%ebp),%eax
    262f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2632:	89 10                	mov    %edx,(%eax)
  ret = *s;
    2634:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2637:	0f b6 00             	movzbl (%eax),%eax
    263a:	0f be c0             	movsbl %al,%eax
    263d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    2640:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2643:	0f b6 00             	movzbl (%eax),%eax
    2646:	0f be c0             	movsbl %al,%eax
    2649:	83 f8 29             	cmp    $0x29,%eax
    264c:	7f 14                	jg     2662 <gettoken+0x76>
    264e:	83 f8 28             	cmp    $0x28,%eax
    2651:	7d 28                	jge    267b <gettoken+0x8f>
    2653:	85 c0                	test   %eax,%eax
    2655:	0f 84 94 00 00 00    	je     26ef <gettoken+0x103>
    265b:	83 f8 26             	cmp    $0x26,%eax
    265e:	74 1b                	je     267b <gettoken+0x8f>
    2660:	eb 3a                	jmp    269c <gettoken+0xb0>
    2662:	83 f8 3e             	cmp    $0x3e,%eax
    2665:	74 1a                	je     2681 <gettoken+0x95>
    2667:	83 f8 3e             	cmp    $0x3e,%eax
    266a:	7f 0a                	jg     2676 <gettoken+0x8a>
    266c:	83 e8 3b             	sub    $0x3b,%eax
    266f:	83 f8 01             	cmp    $0x1,%eax
    2672:	77 28                	ja     269c <gettoken+0xb0>
    2674:	eb 05                	jmp    267b <gettoken+0x8f>
    2676:	83 f8 7c             	cmp    $0x7c,%eax
    2679:	75 21                	jne    269c <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    267b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    267f:	eb 75                	jmp    26f6 <gettoken+0x10a>
  case '>':
    s++;
    2681:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    2685:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2688:	0f b6 00             	movzbl (%eax),%eax
    268b:	3c 3e                	cmp    $0x3e,%al
    268d:	75 63                	jne    26f2 <gettoken+0x106>
      ret = '+';
    268f:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    2696:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    269a:	eb 56                	jmp    26f2 <gettoken+0x106>
  default:
    ret = 'a';
    269c:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    26a3:	eb 04                	jmp    26a9 <gettoken+0xbd>
      s++;
    26a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    26a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26ac:	3b 45 0c             	cmp    0xc(%ebp),%eax
    26af:	73 44                	jae    26f5 <gettoken+0x109>
    26b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26b4:	0f b6 00             	movzbl (%eax),%eax
    26b7:	0f be c0             	movsbl %al,%eax
    26ba:	83 ec 08             	sub    $0x8,%esp
    26bd:	50                   	push   %eax
    26be:	68 b4 47 00 00       	push   $0x47b4
    26c3:	e8 a7 dd ff ff       	call   46f <strchr>
    26c8:	83 c4 10             	add    $0x10,%esp
    26cb:	85 c0                	test   %eax,%eax
    26cd:	75 26                	jne    26f5 <gettoken+0x109>
    26cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26d2:	0f b6 00             	movzbl (%eax),%eax
    26d5:	0f be c0             	movsbl %al,%eax
    26d8:	83 ec 08             	sub    $0x8,%esp
    26db:	50                   	push   %eax
    26dc:	68 bc 47 00 00       	push   $0x47bc
    26e1:	e8 89 dd ff ff       	call   46f <strchr>
    26e6:	83 c4 10             	add    $0x10,%esp
    26e9:	85 c0                	test   %eax,%eax
    26eb:	74 b8                	je     26a5 <gettoken+0xb9>
      s++;
    break;
    26ed:	eb 06                	jmp    26f5 <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    26ef:	90                   	nop
    26f0:	eb 04                	jmp    26f6 <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    26f2:	90                   	nop
    26f3:	eb 01                	jmp    26f6 <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    26f5:	90                   	nop
  }
  if(eq)
    26f6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    26fa:	74 0e                	je     270a <gettoken+0x11e>
    *eq = s;
    26fc:	8b 45 14             	mov    0x14(%ebp),%eax
    26ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2702:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    2704:	eb 04                	jmp    270a <gettoken+0x11e>
    s++;
    2706:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    270a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    270d:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2710:	73 1e                	jae    2730 <gettoken+0x144>
    2712:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2715:	0f b6 00             	movzbl (%eax),%eax
    2718:	0f be c0             	movsbl %al,%eax
    271b:	83 ec 08             	sub    $0x8,%esp
    271e:	50                   	push   %eax
    271f:	68 b4 47 00 00       	push   $0x47b4
    2724:	e8 46 dd ff ff       	call   46f <strchr>
    2729:	83 c4 10             	add    $0x10,%esp
    272c:	85 c0                	test   %eax,%eax
    272e:	75 d6                	jne    2706 <gettoken+0x11a>
    s++;
  *ps = s;
    2730:	8b 45 08             	mov    0x8(%ebp),%eax
    2733:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2736:	89 10                	mov    %edx,(%eax)
  return ret;
    2738:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    273b:	c9                   	leave  
    273c:	c3                   	ret    

0000273d <peek>:

int peek(char **ps, char *es, char *toks)
{
    273d:	55                   	push   %ebp
    273e:	89 e5                	mov    %esp,%ebp
    2740:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    2743:	8b 45 08             	mov    0x8(%ebp),%eax
    2746:	8b 00                	mov    (%eax),%eax
    2748:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    274b:	eb 04                	jmp    2751 <peek+0x14>
    s++;
    274d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    2751:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2754:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2757:	73 1e                	jae    2777 <peek+0x3a>
    2759:	8b 45 f4             	mov    -0xc(%ebp),%eax
    275c:	0f b6 00             	movzbl (%eax),%eax
    275f:	0f be c0             	movsbl %al,%eax
    2762:	83 ec 08             	sub    $0x8,%esp
    2765:	50                   	push   %eax
    2766:	68 b4 47 00 00       	push   $0x47b4
    276b:	e8 ff dc ff ff       	call   46f <strchr>
    2770:	83 c4 10             	add    $0x10,%esp
    2773:	85 c0                	test   %eax,%eax
    2775:	75 d6                	jne    274d <peek+0x10>
    s++;
  *ps = s;
    2777:	8b 45 08             	mov    0x8(%ebp),%eax
    277a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    277d:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    277f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2782:	0f b6 00             	movzbl (%eax),%eax
    2785:	84 c0                	test   %al,%al
    2787:	74 23                	je     27ac <peek+0x6f>
    2789:	8b 45 f4             	mov    -0xc(%ebp),%eax
    278c:	0f b6 00             	movzbl (%eax),%eax
    278f:	0f be c0             	movsbl %al,%eax
    2792:	83 ec 08             	sub    $0x8,%esp
    2795:	50                   	push   %eax
    2796:	ff 75 10             	pushl  0x10(%ebp)
    2799:	e8 d1 dc ff ff       	call   46f <strchr>
    279e:	83 c4 10             	add    $0x10,%esp
    27a1:	85 c0                	test   %eax,%eax
    27a3:	74 07                	je     27ac <peek+0x6f>
    27a5:	b8 01 00 00 00       	mov    $0x1,%eax
    27aa:	eb 05                	jmp    27b1 <peek+0x74>
    27ac:	b8 00 00 00 00       	mov    $0x0,%eax
}
    27b1:	c9                   	leave  
    27b2:	c3                   	ret    

000027b3 <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    27b3:	55                   	push   %ebp
    27b4:	89 e5                	mov    %esp,%ebp
    27b6:	53                   	push   %ebx
    27b7:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    27ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
    27bd:	8b 45 08             	mov    0x8(%ebp),%eax
    27c0:	83 ec 0c             	sub    $0xc,%esp
    27c3:	50                   	push   %eax
    27c4:	e8 65 dc ff ff       	call   42e <strlen>
    27c9:	83 c4 10             	add    $0x10,%esp
    27cc:	01 d8                	add    %ebx,%eax
    27ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    27d1:	8b 45 08             	mov    0x8(%ebp),%eax
    27d4:	0f b6 00             	movzbl (%eax),%eax
    27d7:	3c 25                	cmp    $0x25,%al
    27d9:	75 5d                	jne    2838 <parsecmd+0x85>
  {
    int len = strlen(s);
    27db:	8b 45 08             	mov    0x8(%ebp),%eax
    27de:	83 ec 0c             	sub    $0xc,%esp
    27e1:	50                   	push   %eax
    27e2:	e8 47 dc ff ff       	call   42e <strlen>
    27e7:	83 c4 10             	add    $0x10,%esp
    27ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    27ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27f0:	83 ec 0c             	sub    $0xc,%esp
    27f3:	50                   	push   %eax
    27f4:	e8 a5 e3 ff ff       	call   b9e <malloc>
    27f9:	83 c4 10             	add    $0x10,%esp
    27fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    27ff:	8b 45 08             	mov    0x8(%ebp),%eax
    2802:	83 c0 01             	add    $0x1,%eax
    2805:	83 ec 08             	sub    $0x8,%esp
    2808:	50                   	push   %eax
    2809:	ff 75 ec             	pushl  -0x14(%ebp)
    280c:	e8 ae db ff ff       	call   3bf <strcpy>
    2811:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    2814:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2817:	8d 50 fe             	lea    -0x2(%eax),%edx
    281a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    281d:	01 d0                	add    %edx,%eax
    281f:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    2822:	83 ec 0c             	sub    $0xc,%esp
    2825:	ff 75 ec             	pushl  -0x14(%ebp)
    2828:	e8 59 e9 ff ff       	call   1186 <calcmd>
    282d:	83 c4 10             	add    $0x10,%esp
    2830:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    2833:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2836:	eb 6b                	jmp    28a3 <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    2838:	83 ec 08             	sub    $0x8,%esp
    283b:	ff 75 f4             	pushl  -0xc(%ebp)
    283e:	8d 45 08             	lea    0x8(%ebp),%eax
    2841:	50                   	push   %eax
    2842:	e8 61 00 00 00       	call   28a8 <parseline>
    2847:	83 c4 10             	add    $0x10,%esp
    284a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    284d:	83 ec 04             	sub    $0x4,%esp
    2850:	68 00 3c 00 00       	push   $0x3c00
    2855:	ff 75 f4             	pushl  -0xc(%ebp)
    2858:	8d 45 08             	lea    0x8(%ebp),%eax
    285b:	50                   	push   %eax
    285c:	e8 dc fe ff ff       	call   273d <peek>
    2861:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    2864:	8b 45 08             	mov    0x8(%ebp),%eax
    2867:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    286a:	74 26                	je     2892 <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    286c:	8b 45 08             	mov    0x8(%ebp),%eax
    286f:	83 ec 04             	sub    $0x4,%esp
    2872:	50                   	push   %eax
    2873:	68 01 3c 00 00       	push   $0x3c01
    2878:	6a 02                	push   $0x2
    287a:	e8 1d e0 ff ff       	call   89c <printf>
    287f:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    2882:	83 ec 0c             	sub    $0xc,%esp
    2885:	68 10 3c 00 00       	push   $0x3c10
    288a:	e8 f2 e3 ff ff       	call   c81 <panic1>
    288f:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    2892:	83 ec 0c             	sub    $0xc,%esp
    2895:	ff 75 e4             	pushl  -0x1c(%ebp)
    2898:	e8 eb 03 00 00       	call   2c88 <nulterminate>
    289d:	83 c4 10             	add    $0x10,%esp
  return cmd;
    28a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    28a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    28a6:	c9                   	leave  
    28a7:	c3                   	ret    

000028a8 <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    28a8:	55                   	push   %ebp
    28a9:	89 e5                	mov    %esp,%ebp
    28ab:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    28ae:	83 ec 08             	sub    $0x8,%esp
    28b1:	ff 75 0c             	pushl  0xc(%ebp)
    28b4:	ff 75 08             	pushl  0x8(%ebp)
    28b7:	e8 99 00 00 00       	call   2955 <parsepipe>
    28bc:	83 c4 10             	add    $0x10,%esp
    28bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    28c2:	eb 23                	jmp    28e7 <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    28c4:	6a 00                	push   $0x0
    28c6:	6a 00                	push   $0x0
    28c8:	ff 75 0c             	pushl  0xc(%ebp)
    28cb:	ff 75 08             	pushl  0x8(%ebp)
    28ce:	e8 19 fd ff ff       	call   25ec <gettoken>
    28d3:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    28d6:	83 ec 0c             	sub    $0xc,%esp
    28d9:	ff 75 f4             	pushl  -0xc(%ebp)
    28dc:	e8 66 e8 ff ff       	call   1147 <backcmd>
    28e1:	83 c4 10             	add    $0x10,%esp
    28e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    28e7:	83 ec 04             	sub    $0x4,%esp
    28ea:	68 17 3c 00 00       	push   $0x3c17
    28ef:	ff 75 0c             	pushl  0xc(%ebp)
    28f2:	ff 75 08             	pushl  0x8(%ebp)
    28f5:	e8 43 fe ff ff       	call   273d <peek>
    28fa:	83 c4 10             	add    $0x10,%esp
    28fd:	85 c0                	test   %eax,%eax
    28ff:	75 c3                	jne    28c4 <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    2901:	83 ec 04             	sub    $0x4,%esp
    2904:	68 19 3c 00 00       	push   $0x3c19
    2909:	ff 75 0c             	pushl  0xc(%ebp)
    290c:	ff 75 08             	pushl  0x8(%ebp)
    290f:	e8 29 fe ff ff       	call   273d <peek>
    2914:	83 c4 10             	add    $0x10,%esp
    2917:	85 c0                	test   %eax,%eax
    2919:	74 35                	je     2950 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    291b:	6a 00                	push   $0x0
    291d:	6a 00                	push   $0x0
    291f:	ff 75 0c             	pushl  0xc(%ebp)
    2922:	ff 75 08             	pushl  0x8(%ebp)
    2925:	e8 c2 fc ff ff       	call   25ec <gettoken>
    292a:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    292d:	83 ec 08             	sub    $0x8,%esp
    2930:	ff 75 0c             	pushl  0xc(%ebp)
    2933:	ff 75 08             	pushl  0x8(%ebp)
    2936:	e8 6d ff ff ff       	call   28a8 <parseline>
    293b:	83 c4 10             	add    $0x10,%esp
    293e:	83 ec 08             	sub    $0x8,%esp
    2941:	50                   	push   %eax
    2942:	ff 75 f4             	pushl  -0xc(%ebp)
    2945:	e8 b5 e7 ff ff       	call   10ff <listcmd>
    294a:	83 c4 10             	add    $0x10,%esp
    294d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2950:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2953:	c9                   	leave  
    2954:	c3                   	ret    

00002955 <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    2955:	55                   	push   %ebp
    2956:	89 e5                	mov    %esp,%ebp
    2958:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    295b:	83 ec 08             	sub    $0x8,%esp
    295e:	ff 75 0c             	pushl  0xc(%ebp)
    2961:	ff 75 08             	pushl  0x8(%ebp)
    2964:	e8 ec 01 00 00       	call   2b55 <parseexec>
    2969:	83 c4 10             	add    $0x10,%esp
    296c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    296f:	83 ec 04             	sub    $0x4,%esp
    2972:	68 1b 3c 00 00       	push   $0x3c1b
    2977:	ff 75 0c             	pushl  0xc(%ebp)
    297a:	ff 75 08             	pushl  0x8(%ebp)
    297d:	e8 bb fd ff ff       	call   273d <peek>
    2982:	83 c4 10             	add    $0x10,%esp
    2985:	85 c0                	test   %eax,%eax
    2987:	74 35                	je     29be <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2989:	6a 00                	push   $0x0
    298b:	6a 00                	push   $0x0
    298d:	ff 75 0c             	pushl  0xc(%ebp)
    2990:	ff 75 08             	pushl  0x8(%ebp)
    2993:	e8 54 fc ff ff       	call   25ec <gettoken>
    2998:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    299b:	83 ec 08             	sub    $0x8,%esp
    299e:	ff 75 0c             	pushl  0xc(%ebp)
    29a1:	ff 75 08             	pushl  0x8(%ebp)
    29a4:	e8 ac ff ff ff       	call   2955 <parsepipe>
    29a9:	83 c4 10             	add    $0x10,%esp
    29ac:	83 ec 08             	sub    $0x8,%esp
    29af:	50                   	push   %eax
    29b0:	ff 75 f4             	pushl  -0xc(%ebp)
    29b3:	e8 ff e6 ff ff       	call   10b7 <pipecmd>
    29b8:	83 c4 10             	add    $0x10,%esp
    29bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    29be:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    29c1:	c9                   	leave  
    29c2:	c3                   	ret    

000029c3 <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    29c3:	55                   	push   %ebp
    29c4:	89 e5                	mov    %esp,%ebp
    29c6:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    29c9:	e9 b6 00 00 00       	jmp    2a84 <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    29ce:	6a 00                	push   $0x0
    29d0:	6a 00                	push   $0x0
    29d2:	ff 75 10             	pushl  0x10(%ebp)
    29d5:	ff 75 0c             	pushl  0xc(%ebp)
    29d8:	e8 0f fc ff ff       	call   25ec <gettoken>
    29dd:	83 c4 10             	add    $0x10,%esp
    29e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    29e3:	8d 45 ec             	lea    -0x14(%ebp),%eax
    29e6:	50                   	push   %eax
    29e7:	8d 45 f0             	lea    -0x10(%ebp),%eax
    29ea:	50                   	push   %eax
    29eb:	ff 75 10             	pushl  0x10(%ebp)
    29ee:	ff 75 0c             	pushl  0xc(%ebp)
    29f1:	e8 f6 fb ff ff       	call   25ec <gettoken>
    29f6:	83 c4 10             	add    $0x10,%esp
    29f9:	83 f8 61             	cmp    $0x61,%eax
    29fc:	74 10                	je     2a0e <parseredirs+0x4b>
      panic1("missing file for redirection");
    29fe:	83 ec 0c             	sub    $0xc,%esp
    2a01:	68 1d 3c 00 00       	push   $0x3c1d
    2a06:	e8 76 e2 ff ff       	call   c81 <panic1>
    2a0b:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    2a0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a11:	83 f8 3c             	cmp    $0x3c,%eax
    2a14:	74 0c                	je     2a22 <parseredirs+0x5f>
    2a16:	83 f8 3e             	cmp    $0x3e,%eax
    2a19:	74 26                	je     2a41 <parseredirs+0x7e>
    2a1b:	83 f8 2b             	cmp    $0x2b,%eax
    2a1e:	74 43                	je     2a63 <parseredirs+0xa0>
    2a20:	eb 62                	jmp    2a84 <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    2a22:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2a25:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a28:	83 ec 0c             	sub    $0xc,%esp
    2a2b:	6a 00                	push   $0x0
    2a2d:	6a 00                	push   $0x0
    2a2f:	52                   	push   %edx
    2a30:	50                   	push   %eax
    2a31:	ff 75 08             	pushl  0x8(%ebp)
    2a34:	e8 1b e6 ff ff       	call   1054 <redircmd>
    2a39:	83 c4 20             	add    $0x20,%esp
    2a3c:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2a3f:	eb 43                	jmp    2a84 <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    2a41:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2a44:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a47:	83 ec 0c             	sub    $0xc,%esp
    2a4a:	6a 01                	push   $0x1
    2a4c:	68 01 02 00 00       	push   $0x201
    2a51:	52                   	push   %edx
    2a52:	50                   	push   %eax
    2a53:	ff 75 08             	pushl  0x8(%ebp)
    2a56:	e8 f9 e5 ff ff       	call   1054 <redircmd>
    2a5b:	83 c4 20             	add    $0x20,%esp
    2a5e:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2a61:	eb 21                	jmp    2a84 <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    2a63:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2a66:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a69:	83 ec 0c             	sub    $0xc,%esp
    2a6c:	6a 01                	push   $0x1
    2a6e:	68 01 02 00 00       	push   $0x201
    2a73:	52                   	push   %edx
    2a74:	50                   	push   %eax
    2a75:	ff 75 08             	pushl  0x8(%ebp)
    2a78:	e8 d7 e5 ff ff       	call   1054 <redircmd>
    2a7d:	83 c4 20             	add    $0x20,%esp
    2a80:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2a83:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2a84:	83 ec 04             	sub    $0x4,%esp
    2a87:	68 3a 3c 00 00       	push   $0x3c3a
    2a8c:	ff 75 10             	pushl  0x10(%ebp)
    2a8f:	ff 75 0c             	pushl  0xc(%ebp)
    2a92:	e8 a6 fc ff ff       	call   273d <peek>
    2a97:	83 c4 10             	add    $0x10,%esp
    2a9a:	85 c0                	test   %eax,%eax
    2a9c:	0f 85 2c ff ff ff    	jne    29ce <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    2aa2:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2aa5:	c9                   	leave  
    2aa6:	c3                   	ret    

00002aa7 <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    2aa7:	55                   	push   %ebp
    2aa8:	89 e5                	mov    %esp,%ebp
    2aaa:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2aad:	83 ec 04             	sub    $0x4,%esp
    2ab0:	68 3d 3c 00 00       	push   $0x3c3d
    2ab5:	ff 75 0c             	pushl  0xc(%ebp)
    2ab8:	ff 75 08             	pushl  0x8(%ebp)
    2abb:	e8 7d fc ff ff       	call   273d <peek>
    2ac0:	83 c4 10             	add    $0x10,%esp
    2ac3:	85 c0                	test   %eax,%eax
    2ac5:	75 10                	jne    2ad7 <parseblock+0x30>
    panic1("parseblock");
    2ac7:	83 ec 0c             	sub    $0xc,%esp
    2aca:	68 3f 3c 00 00       	push   $0x3c3f
    2acf:	e8 ad e1 ff ff       	call   c81 <panic1>
    2ad4:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2ad7:	6a 00                	push   $0x0
    2ad9:	6a 00                	push   $0x0
    2adb:	ff 75 0c             	pushl  0xc(%ebp)
    2ade:	ff 75 08             	pushl  0x8(%ebp)
    2ae1:	e8 06 fb ff ff       	call   25ec <gettoken>
    2ae6:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    2ae9:	83 ec 08             	sub    $0x8,%esp
    2aec:	ff 75 0c             	pushl  0xc(%ebp)
    2aef:	ff 75 08             	pushl  0x8(%ebp)
    2af2:	e8 b1 fd ff ff       	call   28a8 <parseline>
    2af7:	83 c4 10             	add    $0x10,%esp
    2afa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    2afd:	83 ec 04             	sub    $0x4,%esp
    2b00:	68 4a 3c 00 00       	push   $0x3c4a
    2b05:	ff 75 0c             	pushl  0xc(%ebp)
    2b08:	ff 75 08             	pushl  0x8(%ebp)
    2b0b:	e8 2d fc ff ff       	call   273d <peek>
    2b10:	83 c4 10             	add    $0x10,%esp
    2b13:	85 c0                	test   %eax,%eax
    2b15:	75 10                	jne    2b27 <parseblock+0x80>
    panic1("syntax - missing )");
    2b17:	83 ec 0c             	sub    $0xc,%esp
    2b1a:	68 4c 3c 00 00       	push   $0x3c4c
    2b1f:	e8 5d e1 ff ff       	call   c81 <panic1>
    2b24:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2b27:	6a 00                	push   $0x0
    2b29:	6a 00                	push   $0x0
    2b2b:	ff 75 0c             	pushl  0xc(%ebp)
    2b2e:	ff 75 08             	pushl  0x8(%ebp)
    2b31:	e8 b6 fa ff ff       	call   25ec <gettoken>
    2b36:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    2b39:	83 ec 04             	sub    $0x4,%esp
    2b3c:	ff 75 0c             	pushl  0xc(%ebp)
    2b3f:	ff 75 08             	pushl  0x8(%ebp)
    2b42:	ff 75 f4             	pushl  -0xc(%ebp)
    2b45:	e8 79 fe ff ff       	call   29c3 <parseredirs>
    2b4a:	83 c4 10             	add    $0x10,%esp
    2b4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    2b50:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2b53:	c9                   	leave  
    2b54:	c3                   	ret    

00002b55 <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    2b55:	55                   	push   %ebp
    2b56:	89 e5                	mov    %esp,%ebp
    2b58:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    2b5b:	83 ec 04             	sub    $0x4,%esp
    2b5e:	68 3d 3c 00 00       	push   $0x3c3d
    2b63:	ff 75 0c             	pushl  0xc(%ebp)
    2b66:	ff 75 08             	pushl  0x8(%ebp)
    2b69:	e8 cf fb ff ff       	call   273d <peek>
    2b6e:	83 c4 10             	add    $0x10,%esp
    2b71:	85 c0                	test   %eax,%eax
    2b73:	74 16                	je     2b8b <parseexec+0x36>
    return parseblock(ps, es);
    2b75:	83 ec 08             	sub    $0x8,%esp
    2b78:	ff 75 0c             	pushl  0xc(%ebp)
    2b7b:	ff 75 08             	pushl  0x8(%ebp)
    2b7e:	e8 24 ff ff ff       	call   2aa7 <parseblock>
    2b83:	83 c4 10             	add    $0x10,%esp
    2b86:	e9 fb 00 00 00       	jmp    2c86 <parseexec+0x131>

  ret = execcmd();
    2b8b:	e8 8e e4 ff ff       	call   101e <execcmd>
    2b90:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    2b93:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b96:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2b99:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2ba0:	83 ec 04             	sub    $0x4,%esp
    2ba3:	ff 75 0c             	pushl  0xc(%ebp)
    2ba6:	ff 75 08             	pushl  0x8(%ebp)
    2ba9:	ff 75 f0             	pushl  -0x10(%ebp)
    2bac:	e8 12 fe ff ff       	call   29c3 <parseredirs>
    2bb1:	83 c4 10             	add    $0x10,%esp
    2bb4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    2bb7:	e9 87 00 00 00       	jmp    2c43 <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2bbc:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2bbf:	50                   	push   %eax
    2bc0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2bc3:	50                   	push   %eax
    2bc4:	ff 75 0c             	pushl  0xc(%ebp)
    2bc7:	ff 75 08             	pushl  0x8(%ebp)
    2bca:	e8 1d fa ff ff       	call   25ec <gettoken>
    2bcf:	83 c4 10             	add    $0x10,%esp
    2bd2:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2bd5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2bd9:	0f 84 84 00 00 00    	je     2c63 <parseexec+0x10e>
      break;
    if(tok != 'a')
    2bdf:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    2be3:	74 10                	je     2bf5 <parseexec+0xa0>
      panic1("syntax");
    2be5:	83 ec 0c             	sub    $0xc,%esp
    2be8:	68 10 3c 00 00       	push   $0x3c10
    2bed:	e8 8f e0 ff ff       	call   c81 <panic1>
    2bf2:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    2bf5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    2bf8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2bfb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2bfe:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    2c02:	8b 55 e0             	mov    -0x20(%ebp),%edx
    2c05:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c08:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2c0b:	83 c1 08             	add    $0x8,%ecx
    2c0e:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    2c12:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    2c16:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2c1a:	7e 10                	jle    2c2c <parseexec+0xd7>
      panic1("too many args");
    2c1c:	83 ec 0c             	sub    $0xc,%esp
    2c1f:	68 5f 3c 00 00       	push   $0x3c5f
    2c24:	e8 58 e0 ff ff       	call   c81 <panic1>
    2c29:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2c2c:	83 ec 04             	sub    $0x4,%esp
    2c2f:	ff 75 0c             	pushl  0xc(%ebp)
    2c32:	ff 75 08             	pushl  0x8(%ebp)
    2c35:	ff 75 f0             	pushl  -0x10(%ebp)
    2c38:	e8 86 fd ff ff       	call   29c3 <parseredirs>
    2c3d:	83 c4 10             	add    $0x10,%esp
    2c40:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    2c43:	83 ec 04             	sub    $0x4,%esp
    2c46:	68 6d 3c 00 00       	push   $0x3c6d
    2c4b:	ff 75 0c             	pushl  0xc(%ebp)
    2c4e:	ff 75 08             	pushl  0x8(%ebp)
    2c51:	e8 e7 fa ff ff       	call   273d <peek>
    2c56:	83 c4 10             	add    $0x10,%esp
    2c59:	85 c0                	test   %eax,%eax
    2c5b:	0f 84 5b ff ff ff    	je     2bbc <parseexec+0x67>
    2c61:	eb 01                	jmp    2c64 <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    2c63:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    2c64:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c67:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c6a:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    2c71:	00 
  cmd->eargv[argc] = 0;
    2c72:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c75:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c78:	83 c2 08             	add    $0x8,%edx
    2c7b:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    2c82:	00 
  return ret;
    2c83:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2c86:	c9                   	leave  
    2c87:	c3                   	ret    

00002c88 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2c88:	55                   	push   %ebp
    2c89:	89 e5                	mov    %esp,%ebp
    2c8b:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2c8e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2c92:	75 0a                	jne    2c9e <nulterminate+0x16>
    return 0;
    2c94:	b8 00 00 00 00       	mov    $0x0,%eax
    2c99:	e9 e4 00 00 00       	jmp    2d82 <nulterminate+0xfa>
  
  switch(cmd->type){
    2c9e:	8b 45 08             	mov    0x8(%ebp),%eax
    2ca1:	8b 00                	mov    (%eax),%eax
    2ca3:	83 f8 05             	cmp    $0x5,%eax
    2ca6:	0f 87 d3 00 00 00    	ja     2d7f <nulterminate+0xf7>
    2cac:	8b 04 85 74 3c 00 00 	mov    0x3c74(,%eax,4),%eax
    2cb3:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2cb5:	8b 45 08             	mov    0x8(%ebp),%eax
    2cb8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2cbb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2cc2:	eb 14                	jmp    2cd8 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2cc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2cc7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2cca:	83 c2 08             	add    $0x8,%edx
    2ccd:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2cd1:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2cd4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2cd8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2cdb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2cde:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2ce2:	85 c0                	test   %eax,%eax
    2ce4:	75 de                	jne    2cc4 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2ce6:	e9 94 00 00 00       	jmp    2d7f <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2ceb:	8b 45 08             	mov    0x8(%ebp),%eax
    2cee:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2cf1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2cf4:	8b 40 04             	mov    0x4(%eax),%eax
    2cf7:	83 ec 0c             	sub    $0xc,%esp
    2cfa:	50                   	push   %eax
    2cfb:	e8 88 ff ff ff       	call   2c88 <nulterminate>
    2d00:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2d03:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d06:	8b 40 0c             	mov    0xc(%eax),%eax
    2d09:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2d0c:	eb 71                	jmp    2d7f <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2d0e:	8b 45 08             	mov    0x8(%ebp),%eax
    2d11:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2d14:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d17:	8b 40 04             	mov    0x4(%eax),%eax
    2d1a:	83 ec 0c             	sub    $0xc,%esp
    2d1d:	50                   	push   %eax
    2d1e:	e8 65 ff ff ff       	call   2c88 <nulterminate>
    2d23:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2d26:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d29:	8b 40 08             	mov    0x8(%eax),%eax
    2d2c:	83 ec 0c             	sub    $0xc,%esp
    2d2f:	50                   	push   %eax
    2d30:	e8 53 ff ff ff       	call   2c88 <nulterminate>
    2d35:	83 c4 10             	add    $0x10,%esp
    break;
    2d38:	eb 45                	jmp    2d7f <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2d3a:	8b 45 08             	mov    0x8(%ebp),%eax
    2d3d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2d40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d43:	8b 40 04             	mov    0x4(%eax),%eax
    2d46:	83 ec 0c             	sub    $0xc,%esp
    2d49:	50                   	push   %eax
    2d4a:	e8 39 ff ff ff       	call   2c88 <nulterminate>
    2d4f:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2d52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d55:	8b 40 08             	mov    0x8(%eax),%eax
    2d58:	83 ec 0c             	sub    $0xc,%esp
    2d5b:	50                   	push   %eax
    2d5c:	e8 27 ff ff ff       	call   2c88 <nulterminate>
    2d61:	83 c4 10             	add    $0x10,%esp
    break;
    2d64:	eb 19                	jmp    2d7f <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2d66:	8b 45 08             	mov    0x8(%ebp),%eax
    2d69:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2d6c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2d6f:	8b 40 04             	mov    0x4(%eax),%eax
    2d72:	83 ec 0c             	sub    $0xc,%esp
    2d75:	50                   	push   %eax
    2d76:	e8 0d ff ff ff       	call   2c88 <nulterminate>
    2d7b:	83 c4 10             	add    $0x10,%esp
    break;
    2d7e:	90                   	nop
  }
  return cmd;
    2d7f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2d82:	c9                   	leave  
    2d83:	c3                   	ret    

00002d84 <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2d84:	55                   	push   %ebp
    2d85:	89 e5                	mov    %esp,%ebp
    2d87:	83 ec 18             	sub    $0x18,%esp
    2d8a:	8b 45 08             	mov    0x8(%ebp),%eax
    2d8d:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2d90:	83 ec 08             	sub    $0x8,%esp
    2d93:	ff 75 18             	pushl  0x18(%ebp)
    2d96:	ff 75 14             	pushl  0x14(%ebp)
    2d99:	ff 75 10             	pushl  0x10(%ebp)
    2d9c:	ff 75 0c             	pushl  0xc(%ebp)
    2d9f:	6a 01                	push   $0x1
    2da1:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2da4:	50                   	push   %eax
    2da5:	e8 e6 d8 ff ff       	call   690 <colorwrite>
    2daa:	83 c4 20             	add    $0x20,%esp
}
    2dad:	90                   	nop
    2dae:	c9                   	leave  
    2daf:	c3                   	ret    

00002db0 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2db0:	55                   	push   %ebp
    2db1:	89 e5                	mov    %esp,%ebp
    2db3:	53                   	push   %ebx
    2db4:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2db7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2dbe:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2dc2:	74 17                	je     2ddb <color_printint+0x2b>
    2dc4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2dc8:	79 11                	jns    2ddb <color_printint+0x2b>
    neg = 1;
    2dca:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2dd1:	8b 45 08             	mov    0x8(%ebp),%eax
    2dd4:	f7 d8                	neg    %eax
    2dd6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2dd9:	eb 06                	jmp    2de1 <color_printint+0x31>
  } else {
    x = xx;
    2ddb:	8b 45 08             	mov    0x8(%ebp),%eax
    2dde:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2de1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2de8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2deb:	8d 41 01             	lea    0x1(%ecx),%eax
    2dee:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2df1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2df4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2df7:	ba 00 00 00 00       	mov    $0x0,%edx
    2dfc:	f7 f3                	div    %ebx
    2dfe:	89 d0                	mov    %edx,%eax
    2e00:	0f b6 80 c4 47 00 00 	movzbl 0x47c4(%eax),%eax
    2e07:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2e0b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2e0e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e11:	ba 00 00 00 00       	mov    $0x0,%edx
    2e16:	f7 f3                	div    %ebx
    2e18:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2e1b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2e1f:	75 c7                	jne    2de8 <color_printint+0x38>
  if(neg)
    2e21:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2e25:	74 36                	je     2e5d <color_printint+0xad>
    buf[i++] = '-';
    2e27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e2a:	8d 50 01             	lea    0x1(%eax),%edx
    2e2d:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2e30:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2e35:	eb 26                	jmp    2e5d <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2e37:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2e3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e3d:	01 d0                	add    %edx,%eax
    2e3f:	0f b6 00             	movzbl (%eax),%eax
    2e42:	0f be c0             	movsbl %al,%eax
    2e45:	83 ec 0c             	sub    $0xc,%esp
    2e48:	ff 75 20             	pushl  0x20(%ebp)
    2e4b:	ff 75 1c             	pushl  0x1c(%ebp)
    2e4e:	ff 75 18             	pushl  0x18(%ebp)
    2e51:	ff 75 14             	pushl  0x14(%ebp)
    2e54:	50                   	push   %eax
    2e55:	e8 2a ff ff ff       	call   2d84 <color_putc>
    2e5a:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2e5d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2e61:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e65:	79 d0                	jns    2e37 <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2e67:	90                   	nop
    2e68:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2e6b:	c9                   	leave  
    2e6c:	c3                   	ret    

00002e6d <getInteger>:

static int getInteger(double num)
{
    2e6d:	55                   	push   %ebp
    2e6e:	89 e5                	mov    %esp,%ebp
    2e70:	83 ec 18             	sub    $0x18,%esp
    2e73:	8b 45 08             	mov    0x8(%ebp),%eax
    2e76:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2e79:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e7c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2e7f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2e86:	eb 0e                	jmp    2e96 <getInteger+0x29>
  {
    num -= 1;
    2e88:	dd 45 e8             	fldl   -0x18(%ebp)
    2e8b:	d9 e8                	fld1   
    2e8d:	de e9                	fsubrp %st,%st(1)
    2e8f:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2e92:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2e96:	dd 45 e8             	fldl   -0x18(%ebp)
    2e99:	d9 e8                	fld1   
    2e9b:	d9 c9                	fxch   %st(1)
    2e9d:	df e9                	fucomip %st(1),%st
    2e9f:	dd d8                	fstp   %st(0)
    2ea1:	77 e5                	ja     2e88 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2ea3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2ea6:	c9                   	leave  
    2ea7:	c3                   	ret    

00002ea8 <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2ea8:	55                   	push   %ebp
    2ea9:	89 e5                	mov    %esp,%ebp
    2eab:	83 ec 28             	sub    $0x28,%esp
    2eae:	8b 45 08             	mov    0x8(%ebp),%eax
    2eb1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2eb4:	8b 45 0c             	mov    0xc(%ebp),%eax
    2eb7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2eba:	d9 ee                	fldz   
    2ebc:	dd 45 e0             	fldl   -0x20(%ebp)
    2ebf:	d9 c9                	fxch   %st(1)
    2ec1:	df e9                	fucomip %st(1),%st
    2ec3:	dd d8                	fstp   %st(0)
    2ec5:	76 21                	jbe    2ee8 <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2ec7:	83 ec 0c             	sub    $0xc,%esp
    2eca:	ff 75 1c             	pushl  0x1c(%ebp)
    2ecd:	ff 75 18             	pushl  0x18(%ebp)
    2ed0:	ff 75 14             	pushl  0x14(%ebp)
    2ed3:	ff 75 10             	pushl  0x10(%ebp)
    2ed6:	6a 2d                	push   $0x2d
    2ed8:	e8 a7 fe ff ff       	call   2d84 <color_putc>
    2edd:	83 c4 20             	add    $0x20,%esp
    num = -num;
    2ee0:	dd 45 e0             	fldl   -0x20(%ebp)
    2ee3:	d9 e0                	fchs   
    2ee5:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    2ee8:	83 ec 08             	sub    $0x8,%esp
    2eeb:	ff 75 e4             	pushl  -0x1c(%ebp)
    2eee:	ff 75 e0             	pushl  -0x20(%ebp)
    2ef1:	e8 77 ff ff ff       	call   2e6d <getInteger>
    2ef6:	83 c4 10             	add    $0x10,%esp
    2ef9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    2efc:	83 ec 04             	sub    $0x4,%esp
    2eff:	ff 75 1c             	pushl  0x1c(%ebp)
    2f02:	ff 75 18             	pushl  0x18(%ebp)
    2f05:	ff 75 14             	pushl  0x14(%ebp)
    2f08:	ff 75 10             	pushl  0x10(%ebp)
    2f0b:	6a 01                	push   $0x1
    2f0d:	6a 0a                	push   $0xa
    2f0f:	ff 75 f0             	pushl  -0x10(%ebp)
    2f12:	e8 99 fe ff ff       	call   2db0 <color_printint>
    2f17:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    2f1a:	db 45 f0             	fildl  -0x10(%ebp)
    2f1d:	dd 45 e0             	fldl   -0x20(%ebp)
    2f20:	de e1                	fsubp  %st,%st(1)
    2f22:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    2f25:	dd 45 e0             	fldl   -0x20(%ebp)
    2f28:	dd 05 98 3c 00 00    	fldl   0x3c98
    2f2e:	d9 c9                	fxch   %st(1)
    2f30:	df e9                	fucomip %st(1),%st
    2f32:	dd d8                	fstp   %st(0)
    2f34:	76 19                	jbe    2f4f <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    2f36:	83 ec 0c             	sub    $0xc,%esp
    2f39:	ff 75 1c             	pushl  0x1c(%ebp)
    2f3c:	ff 75 18             	pushl  0x18(%ebp)
    2f3f:	ff 75 14             	pushl  0x14(%ebp)
    2f42:	ff 75 10             	pushl  0x10(%ebp)
    2f45:	6a 2e                	push   $0x2e
    2f47:	e8 38 fe ff ff       	call   2d84 <color_putc>
    2f4c:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    2f4f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    2f56:	eb 55                	jmp    2fad <color_printdbl+0x105>
  {
    num = num*10;
    2f58:	dd 45 e0             	fldl   -0x20(%ebp)
    2f5b:	dd 05 a0 3c 00 00    	fldl   0x3ca0
    2f61:	de c9                	fmulp  %st,%st(1)
    2f63:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    2f66:	83 ec 08             	sub    $0x8,%esp
    2f69:	ff 75 e4             	pushl  -0x1c(%ebp)
    2f6c:	ff 75 e0             	pushl  -0x20(%ebp)
    2f6f:	e8 f9 fe ff ff       	call   2e6d <getInteger>
    2f74:	83 c4 10             	add    $0x10,%esp
    2f77:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    2f7a:	83 ec 04             	sub    $0x4,%esp
    2f7d:	ff 75 1c             	pushl  0x1c(%ebp)
    2f80:	ff 75 18             	pushl  0x18(%ebp)
    2f83:	ff 75 14             	pushl  0x14(%ebp)
    2f86:	ff 75 10             	pushl  0x10(%ebp)
    2f89:	6a 01                	push   $0x1
    2f8b:	6a 0a                	push   $0xa
    2f8d:	ff 75 f0             	pushl  -0x10(%ebp)
    2f90:	e8 1b fe ff ff       	call   2db0 <color_printint>
    2f95:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    2f98:	db 45 f0             	fildl  -0x10(%ebp)
    2f9b:	dd 45 e0             	fldl   -0x20(%ebp)
    2f9e:	de e1                	fsubp  %st,%st(1)
    2fa0:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    2fa3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    2fa7:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2fab:	7f 13                	jg     2fc0 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    2fad:	dd 45 e0             	fldl   -0x20(%ebp)
    2fb0:	dd 05 98 3c 00 00    	fldl   0x3c98
    2fb6:	d9 c9                	fxch   %st(1)
    2fb8:	df e9                	fucomip %st(1),%st
    2fba:	dd d8                	fstp   %st(0)
    2fbc:	77 9a                	ja     2f58 <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    2fbe:	eb 01                	jmp    2fc1 <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    2fc0:	90                   	nop
    }
  }
}
    2fc1:	90                   	nop
    2fc2:	c9                   	leave  
    2fc3:	c3                   	ret    

00002fc4 <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    2fc4:	55                   	push   %ebp
    2fc5:	89 e5                	mov    %esp,%ebp
    2fc7:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2fca:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2fd1:	8d 45 18             	lea    0x18(%ebp),%eax
    2fd4:	83 c0 04             	add    $0x4,%eax
    2fd7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2fda:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2fe1:	e9 e2 01 00 00       	jmp    31c8 <color_printf+0x204>
    c = fmt[i] & 0xff;
    2fe6:	8b 55 18             	mov    0x18(%ebp),%edx
    2fe9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2fec:	01 d0                	add    %edx,%eax
    2fee:	0f b6 00             	movzbl (%eax),%eax
    2ff1:	0f be c0             	movsbl %al,%eax
    2ff4:	25 ff 00 00 00       	and    $0xff,%eax
    2ff9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2ffc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3000:	75 35                	jne    3037 <color_printf+0x73>
      if(c == '%'){
    3002:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3006:	75 0c                	jne    3014 <color_printf+0x50>
        state = '%';
    3008:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    300f:	e9 b0 01 00 00       	jmp    31c4 <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    3014:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3017:	0f be c0             	movsbl %al,%eax
    301a:	83 ec 0c             	sub    $0xc,%esp
    301d:	ff 75 14             	pushl  0x14(%ebp)
    3020:	ff 75 10             	pushl  0x10(%ebp)
    3023:	ff 75 0c             	pushl  0xc(%ebp)
    3026:	ff 75 08             	pushl  0x8(%ebp)
    3029:	50                   	push   %eax
    302a:	e8 55 fd ff ff       	call   2d84 <color_putc>
    302f:	83 c4 20             	add    $0x20,%esp
    3032:	e9 8d 01 00 00       	jmp    31c4 <color_printf+0x200>
      }
    } else if(state == '%'){
    3037:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    303b:	0f 85 83 01 00 00    	jne    31c4 <color_printf+0x200>
      if(c == 'd'){
    3041:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    3045:	75 2a                	jne    3071 <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    3047:	8b 45 e8             	mov    -0x18(%ebp),%eax
    304a:	8b 00                	mov    (%eax),%eax
    304c:	83 ec 04             	sub    $0x4,%esp
    304f:	ff 75 14             	pushl  0x14(%ebp)
    3052:	ff 75 10             	pushl  0x10(%ebp)
    3055:	ff 75 0c             	pushl  0xc(%ebp)
    3058:	ff 75 08             	pushl  0x8(%ebp)
    305b:	6a 01                	push   $0x1
    305d:	6a 0a                	push   $0xa
    305f:	50                   	push   %eax
    3060:	e8 4b fd ff ff       	call   2db0 <color_printint>
    3065:	83 c4 20             	add    $0x20,%esp
        ap++;
    3068:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    306c:	e9 4c 01 00 00       	jmp    31bd <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    3071:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3075:	74 06                	je     307d <color_printf+0xb9>
    3077:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    307b:	75 2a                	jne    30a7 <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    307d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3080:	8b 00                	mov    (%eax),%eax
    3082:	83 ec 04             	sub    $0x4,%esp
    3085:	ff 75 14             	pushl  0x14(%ebp)
    3088:	ff 75 10             	pushl  0x10(%ebp)
    308b:	ff 75 0c             	pushl  0xc(%ebp)
    308e:	ff 75 08             	pushl  0x8(%ebp)
    3091:	6a 00                	push   $0x0
    3093:	6a 10                	push   $0x10
    3095:	50                   	push   %eax
    3096:	e8 15 fd ff ff       	call   2db0 <color_printint>
    309b:	83 c4 20             	add    $0x20,%esp
        ap++;
    309e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    30a2:	e9 16 01 00 00       	jmp    31bd <color_printf+0x1f9>
      } else if(c == 's'){
    30a7:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    30ab:	75 4f                	jne    30fc <color_printf+0x138>
        s = (char*)*ap;
    30ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
    30b0:	8b 00                	mov    (%eax),%eax
    30b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    30b5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    30b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    30bd:	75 2e                	jne    30ed <color_printf+0x129>
          s = "(null)";
    30bf:	c7 45 f4 90 3c 00 00 	movl   $0x3c90,-0xc(%ebp)
        while(*s != 0){
    30c6:	eb 25                	jmp    30ed <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    30c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30cb:	0f b6 00             	movzbl (%eax),%eax
    30ce:	0f be c0             	movsbl %al,%eax
    30d1:	83 ec 0c             	sub    $0xc,%esp
    30d4:	ff 75 14             	pushl  0x14(%ebp)
    30d7:	ff 75 10             	pushl  0x10(%ebp)
    30da:	ff 75 0c             	pushl  0xc(%ebp)
    30dd:	ff 75 08             	pushl  0x8(%ebp)
    30e0:	50                   	push   %eax
    30e1:	e8 9e fc ff ff       	call   2d84 <color_putc>
    30e6:	83 c4 20             	add    $0x20,%esp
          s++;
    30e9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    30ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30f0:	0f b6 00             	movzbl (%eax),%eax
    30f3:	84 c0                	test   %al,%al
    30f5:	75 d1                	jne    30c8 <color_printf+0x104>
    30f7:	e9 c1 00 00 00       	jmp    31bd <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    30fc:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    3100:	75 29                	jne    312b <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    3102:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3105:	8b 00                	mov    (%eax),%eax
    3107:	0f be c0             	movsbl %al,%eax
    310a:	83 ec 0c             	sub    $0xc,%esp
    310d:	ff 75 14             	pushl  0x14(%ebp)
    3110:	ff 75 10             	pushl  0x10(%ebp)
    3113:	ff 75 0c             	pushl  0xc(%ebp)
    3116:	ff 75 08             	pushl  0x8(%ebp)
    3119:	50                   	push   %eax
    311a:	e8 65 fc ff ff       	call   2d84 <color_putc>
    311f:	83 c4 20             	add    $0x20,%esp
        ap++;
    3122:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3126:	e9 92 00 00 00       	jmp    31bd <color_printf+0x1f9>
      } else if(c == '%'){
    312b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    312f:	75 20                	jne    3151 <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    3131:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3134:	0f be c0             	movsbl %al,%eax
    3137:	83 ec 0c             	sub    $0xc,%esp
    313a:	ff 75 14             	pushl  0x14(%ebp)
    313d:	ff 75 10             	pushl  0x10(%ebp)
    3140:	ff 75 0c             	pushl  0xc(%ebp)
    3143:	ff 75 08             	pushl  0x8(%ebp)
    3146:	50                   	push   %eax
    3147:	e8 38 fc ff ff       	call   2d84 <color_putc>
    314c:	83 c4 20             	add    $0x20,%esp
    314f:	eb 6c                	jmp    31bd <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    3151:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    3155:	75 2f                	jne    3186 <color_printf+0x1c2>
        double *dap = (double*)ap;
    3157:	8b 45 e8             	mov    -0x18(%ebp),%eax
    315a:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    315d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3160:	dd 00                	fldl   (%eax)
    3162:	83 ec 08             	sub    $0x8,%esp
    3165:	ff 75 14             	pushl  0x14(%ebp)
    3168:	ff 75 10             	pushl  0x10(%ebp)
    316b:	ff 75 0c             	pushl  0xc(%ebp)
    316e:	ff 75 08             	pushl  0x8(%ebp)
    3171:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3175:	dd 1c 24             	fstpl  (%esp)
    3178:	e8 2b fd ff ff       	call   2ea8 <color_printdbl>
    317d:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    3180:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    3184:	eb 37                	jmp    31bd <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    3186:	83 ec 0c             	sub    $0xc,%esp
    3189:	ff 75 14             	pushl  0x14(%ebp)
    318c:	ff 75 10             	pushl  0x10(%ebp)
    318f:	ff 75 0c             	pushl  0xc(%ebp)
    3192:	ff 75 08             	pushl  0x8(%ebp)
    3195:	6a 25                	push   $0x25
    3197:	e8 e8 fb ff ff       	call   2d84 <color_putc>
    319c:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    319f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    31a2:	0f be c0             	movsbl %al,%eax
    31a5:	83 ec 0c             	sub    $0xc,%esp
    31a8:	ff 75 14             	pushl  0x14(%ebp)
    31ab:	ff 75 10             	pushl  0x10(%ebp)
    31ae:	ff 75 0c             	pushl  0xc(%ebp)
    31b1:	ff 75 08             	pushl  0x8(%ebp)
    31b4:	50                   	push   %eax
    31b5:	e8 ca fb ff ff       	call   2d84 <color_putc>
    31ba:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    31bd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    31c4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    31c8:	8b 55 18             	mov    0x18(%ebp),%edx
    31cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31ce:	01 d0                	add    %edx,%eax
    31d0:	0f b6 00             	movzbl (%eax),%eax
    31d3:	84 c0                	test   %al,%al
    31d5:	0f 85 0b fe ff ff    	jne    2fe6 <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    31db:	90                   	nop
    31dc:	c9                   	leave  
    31dd:	c3                   	ret    

000031de <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    31de:	55                   	push   %ebp
    31df:	89 e5                	mov    %esp,%ebp
    31e1:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    31e4:	83 ec 0c             	sub    $0xc,%esp
    31e7:	6a 58                	push   $0x58
    31e9:	e8 b0 d9 ff ff       	call   b9e <malloc>
    31ee:	83 c4 10             	add    $0x10,%esp
    31f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    31f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31f7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    31fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3200:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    3207:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    320a:	c9                   	leave  
    320b:	c3                   	ret    

0000320c <pushi>:

void pushi(struct istack *s, int val)
{
    320c:	55                   	push   %ebp
    320d:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    320f:	8b 45 08             	mov    0x8(%ebp),%eax
    3212:	8b 00                	mov    (%eax),%eax
    3214:	83 f8 13             	cmp    $0x13,%eax
    3217:	7f 2c                	jg     3245 <pushi+0x39>
    {
        s->size++;
    3219:	8b 45 08             	mov    0x8(%ebp),%eax
    321c:	8b 00                	mov    (%eax),%eax
    321e:	8d 50 01             	lea    0x1(%eax),%edx
    3221:	8b 45 08             	mov    0x8(%ebp),%eax
    3224:	89 10                	mov    %edx,(%eax)
        s->top++;
    3226:	8b 45 08             	mov    0x8(%ebp),%eax
    3229:	8b 40 54             	mov    0x54(%eax),%eax
    322c:	8d 50 01             	lea    0x1(%eax),%edx
    322f:	8b 45 08             	mov    0x8(%ebp),%eax
    3232:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    3235:	8b 45 08             	mov    0x8(%ebp),%eax
    3238:	8b 50 54             	mov    0x54(%eax),%edx
    323b:	8b 45 08             	mov    0x8(%ebp),%eax
    323e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    3241:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    3245:	90                   	nop
    3246:	5d                   	pop    %ebp
    3247:	c3                   	ret    

00003248 <popi>:

int popi(struct istack *s)
{
    3248:	55                   	push   %ebp
    3249:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    324b:	8b 45 08             	mov    0x8(%ebp),%eax
    324e:	8b 00                	mov    (%eax),%eax
    3250:	85 c0                	test   %eax,%eax
    3252:	75 07                	jne    325b <popi+0x13>
    {
        return -1;
    3254:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3259:	eb 2c                	jmp    3287 <popi+0x3f>
    }
    s->size--;
    325b:	8b 45 08             	mov    0x8(%ebp),%eax
    325e:	8b 00                	mov    (%eax),%eax
    3260:	8d 50 ff             	lea    -0x1(%eax),%edx
    3263:	8b 45 08             	mov    0x8(%ebp),%eax
    3266:	89 10                	mov    %edx,(%eax)
    s->top--;
    3268:	8b 45 08             	mov    0x8(%ebp),%eax
    326b:	8b 40 54             	mov    0x54(%eax),%eax
    326e:	8d 50 ff             	lea    -0x1(%eax),%edx
    3271:	8b 45 08             	mov    0x8(%ebp),%eax
    3274:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    3277:	8b 45 08             	mov    0x8(%ebp),%eax
    327a:	8b 40 54             	mov    0x54(%eax),%eax
    327d:	8d 50 01             	lea    0x1(%eax),%edx
    3280:	8b 45 08             	mov    0x8(%ebp),%eax
    3283:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3287:	5d                   	pop    %ebp
    3288:	c3                   	ret    

00003289 <topi>:

int topi(struct istack* s)
{
    3289:	55                   	push   %ebp
    328a:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    328c:	8b 45 08             	mov    0x8(%ebp),%eax
    328f:	8b 50 54             	mov    0x54(%eax),%edx
    3292:	8b 45 08             	mov    0x8(%ebp),%eax
    3295:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    3299:	5d                   	pop    %ebp
    329a:	c3                   	ret    

0000329b <cstack>:

//constructor
struct cstack* cstack()
{
    329b:	55                   	push   %ebp
    329c:	89 e5                	mov    %esp,%ebp
    329e:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    32a1:	83 ec 0c             	sub    $0xc,%esp
    32a4:	6a 1c                	push   $0x1c
    32a6:	e8 f3 d8 ff ff       	call   b9e <malloc>
    32ab:	83 c4 10             	add    $0x10,%esp
    32ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    32b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32b4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    32ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32bd:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    32c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    32c7:	c9                   	leave  
    32c8:	c3                   	ret    

000032c9 <pushc>:

void pushc(struct cstack *s, char val)
{
    32c9:	55                   	push   %ebp
    32ca:	89 e5                	mov    %esp,%ebp
    32cc:	83 ec 04             	sub    $0x4,%esp
    32cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    32d2:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    32d5:	8b 45 08             	mov    0x8(%ebp),%eax
    32d8:	8b 00                	mov    (%eax),%eax
    32da:	83 f8 13             	cmp    $0x13,%eax
    32dd:	7f 2d                	jg     330c <pushc+0x43>
    {
        s->size++;
    32df:	8b 45 08             	mov    0x8(%ebp),%eax
    32e2:	8b 00                	mov    (%eax),%eax
    32e4:	8d 50 01             	lea    0x1(%eax),%edx
    32e7:	8b 45 08             	mov    0x8(%ebp),%eax
    32ea:	89 10                	mov    %edx,(%eax)
        s->top++;
    32ec:	8b 45 08             	mov    0x8(%ebp),%eax
    32ef:	8b 40 18             	mov    0x18(%eax),%eax
    32f2:	8d 50 01             	lea    0x1(%eax),%edx
    32f5:	8b 45 08             	mov    0x8(%ebp),%eax
    32f8:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    32fb:	8b 45 08             	mov    0x8(%ebp),%eax
    32fe:	8b 40 18             	mov    0x18(%eax),%eax
    3301:	8b 55 08             	mov    0x8(%ebp),%edx
    3304:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    3308:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    330c:	90                   	nop
    330d:	c9                   	leave  
    330e:	c3                   	ret    

0000330f <popc>:

char popc(struct cstack *s)
{
    330f:	55                   	push   %ebp
    3310:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3312:	8b 45 08             	mov    0x8(%ebp),%eax
    3315:	8b 00                	mov    (%eax),%eax
    3317:	85 c0                	test   %eax,%eax
    3319:	75 07                	jne    3322 <popc+0x13>
    {
        return -1;
    331b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3320:	eb 2d                	jmp    334f <popc+0x40>
    }
    s->size--;
    3322:	8b 45 08             	mov    0x8(%ebp),%eax
    3325:	8b 00                	mov    (%eax),%eax
    3327:	8d 50 ff             	lea    -0x1(%eax),%edx
    332a:	8b 45 08             	mov    0x8(%ebp),%eax
    332d:	89 10                	mov    %edx,(%eax)
    s->top--;
    332f:	8b 45 08             	mov    0x8(%ebp),%eax
    3332:	8b 40 18             	mov    0x18(%eax),%eax
    3335:	8d 50 ff             	lea    -0x1(%eax),%edx
    3338:	8b 45 08             	mov    0x8(%ebp),%eax
    333b:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    333e:	8b 45 08             	mov    0x8(%ebp),%eax
    3341:	8b 40 18             	mov    0x18(%eax),%eax
    3344:	8d 50 01             	lea    0x1(%eax),%edx
    3347:	8b 45 08             	mov    0x8(%ebp),%eax
    334a:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    334f:	5d                   	pop    %ebp
    3350:	c3                   	ret    

00003351 <topc>:

char topc(struct cstack* s)
{
    3351:	55                   	push   %ebp
    3352:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3354:	8b 45 08             	mov    0x8(%ebp),%eax
    3357:	8b 40 18             	mov    0x18(%eax),%eax
    335a:	8b 55 08             	mov    0x8(%ebp),%edx
    335d:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    3362:	5d                   	pop    %ebp
    3363:	c3                   	ret    

00003364 <dstack>:

//constructor
struct dstack* dstack()
{
    3364:	55                   	push   %ebp
    3365:	89 e5                	mov    %esp,%ebp
    3367:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    336a:	83 ec 0c             	sub    $0xc,%esp
    336d:	68 a8 00 00 00       	push   $0xa8
    3372:	e8 27 d8 ff ff       	call   b9e <malloc>
    3377:	83 c4 10             	add    $0x10,%esp
    337a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    337d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3380:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3386:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3389:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    3390:	ff ff ff 
    return stack;
    3393:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3396:	c9                   	leave  
    3397:	c3                   	ret    

00003398 <pushd>:

void pushd(struct dstack *s, double val)
{
    3398:	55                   	push   %ebp
    3399:	89 e5                	mov    %esp,%ebp
    339b:	83 ec 08             	sub    $0x8,%esp
    339e:	8b 45 0c             	mov    0xc(%ebp),%eax
    33a1:	89 45 f8             	mov    %eax,-0x8(%ebp)
    33a4:	8b 45 10             	mov    0x10(%ebp),%eax
    33a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    33aa:	8b 45 08             	mov    0x8(%ebp),%eax
    33ad:	8b 00                	mov    (%eax),%eax
    33af:	83 f8 13             	cmp    $0x13,%eax
    33b2:	7f 35                	jg     33e9 <pushd+0x51>
    {
        s->size++;
    33b4:	8b 45 08             	mov    0x8(%ebp),%eax
    33b7:	8b 00                	mov    (%eax),%eax
    33b9:	8d 50 01             	lea    0x1(%eax),%edx
    33bc:	8b 45 08             	mov    0x8(%ebp),%eax
    33bf:	89 10                	mov    %edx,(%eax)
        s->top++;
    33c1:	8b 45 08             	mov    0x8(%ebp),%eax
    33c4:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    33ca:	8d 50 01             	lea    0x1(%eax),%edx
    33cd:	8b 45 08             	mov    0x8(%ebp),%eax
    33d0:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    33d6:	8b 45 08             	mov    0x8(%ebp),%eax
    33d9:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    33df:	8b 45 08             	mov    0x8(%ebp),%eax
    33e2:	dd 45 f8             	fldl   -0x8(%ebp)
    33e5:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    33e9:	90                   	nop
    33ea:	c9                   	leave  
    33eb:	c3                   	ret    

000033ec <popd>:

double popd(struct dstack *s)
{
    33ec:	55                   	push   %ebp
    33ed:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    33ef:	8b 45 08             	mov    0x8(%ebp),%eax
    33f2:	8b 00                	mov    (%eax),%eax
    33f4:	85 c0                	test   %eax,%eax
    33f6:	75 06                	jne    33fe <popd+0x12>
    {
        return -1;
    33f8:	d9 e8                	fld1   
    33fa:	d9 e0                	fchs   
    33fc:	eb 35                	jmp    3433 <popd+0x47>
    }
    s->size--;
    33fe:	8b 45 08             	mov    0x8(%ebp),%eax
    3401:	8b 00                	mov    (%eax),%eax
    3403:	8d 50 ff             	lea    -0x1(%eax),%edx
    3406:	8b 45 08             	mov    0x8(%ebp),%eax
    3409:	89 10                	mov    %edx,(%eax)
    s->top--;
    340b:	8b 45 08             	mov    0x8(%ebp),%eax
    340e:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3414:	8d 50 ff             	lea    -0x1(%eax),%edx
    3417:	8b 45 08             	mov    0x8(%ebp),%eax
    341a:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    3420:	8b 45 08             	mov    0x8(%ebp),%eax
    3423:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3429:	8d 50 01             	lea    0x1(%eax),%edx
    342c:	8b 45 08             	mov    0x8(%ebp),%eax
    342f:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    3433:	5d                   	pop    %ebp
    3434:	c3                   	ret    

00003435 <topd>:

double topd(struct dstack* s)
{
    3435:	55                   	push   %ebp
    3436:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3438:	8b 45 08             	mov    0x8(%ebp),%eax
    343b:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3441:	8b 45 08             	mov    0x8(%ebp),%eax
    3444:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    3448:	5d                   	pop    %ebp
    3449:	c3                   	ret    

0000344a <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    344a:	55                   	push   %ebp
    344b:	89 e5                	mov    %esp,%ebp
    344d:	53                   	push   %ebx
    344e:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    3454:	83 ec 08             	sub    $0x8,%esp
    3457:	6a 00                	push   $0x0
    3459:	68 a8 3c 00 00       	push   $0x3ca8
    345e:	e8 cd d1 ff ff       	call   630 <open>
    3463:	83 c4 10             	add    $0x10,%esp
    3466:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3469:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    346d:	79 1d                	jns    348c <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    346f:	83 ec 0c             	sub    $0xc,%esp
    3472:	68 b2 3c 00 00       	push   $0x3cb2
    3477:	6a 00                	push   $0x0
    3479:	6a 00                	push   $0x0
    347b:	6a 01                	push   $0x1
    347d:	6a 03                	push   $0x3
    347f:	e8 40 fb ff ff       	call   2fc4 <color_printf>
    3484:	83 c4 20             	add    $0x20,%esp
    3487:	e9 6d 02 00 00       	jmp    36f9 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    348c:	8b 45 0c             	mov    0xc(%ebp),%eax
    348f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    3495:	e9 2a 02 00 00       	jmp    36c4 <readVariables+0x27a>
  {
    int pos = 0;
    349a:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    34a1:	00 00 00 
    while(pos <= n-1)
    34a4:	e9 07 02 00 00       	jmp    36b0 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    34a9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    34b0:	eb 24                	jmp    34d6 <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    34b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34b5:	8d 50 ff             	lea    -0x1(%eax),%edx
    34b8:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    34be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34c1:	01 c8                	add    %ecx,%eax
    34c3:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    34ca:	ff 
    34cb:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    34d2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    34d6:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    34dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34df:	01 d0                	add    %edx,%eax
    34e1:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    34e8:	ff 
    34e9:	3c 3d                	cmp    $0x3d,%al
    34eb:	75 c5                	jne    34b2 <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    34ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34f0:	83 e8 01             	sub    $0x1,%eax
    34f3:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    34fa:	00 
      if(buf[pos] == 'd') //double value
    34fb:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3501:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3508:	ff 
    3509:	3c 64                	cmp    $0x64,%al
    350b:	0f 85 a0 00 00 00    	jne    35b1 <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    3511:	8b 45 0c             	mov    0xc(%ebp),%eax
    3514:	8b 00                	mov    (%eax),%eax
    3516:	c1 e0 05             	shl    $0x5,%eax
    3519:	89 c2                	mov    %eax,%edx
    351b:	8b 45 08             	mov    0x8(%ebp),%eax
    351e:	01 d0                	add    %edx,%eax
    3520:	8d 50 04             	lea    0x4(%eax),%edx
    3523:	83 ec 08             	sub    $0x8,%esp
    3526:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    352c:	50                   	push   %eax
    352d:	52                   	push   %edx
    352e:	e8 8c ce ff ff       	call   3bf <strcpy>
    3533:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    3536:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3539:	8d 50 01             	lea    0x1(%eax),%edx
    353c:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3542:	01 d0                	add    %edx,%eax
    3544:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    354a:	83 ec 08             	sub    $0x8,%esp
    354d:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    3553:	50                   	push   %eax
    3554:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    355a:	50                   	push   %eax
    355b:	e8 7b d9 ff ff       	call   edb <Translation>
    3560:	83 c4 10             	add    $0x10,%esp
    3563:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    3566:	8b 45 0c             	mov    0xc(%ebp),%eax
    3569:	8b 00                	mov    (%eax),%eax
    356b:	c1 e0 05             	shl    $0x5,%eax
    356e:	89 c2                	mov    %eax,%edx
    3570:	8b 45 08             	mov    0x8(%ebp),%eax
    3573:	01 d0                	add    %edx,%eax
    3575:	dd 45 d8             	fldl   -0x28(%ebp)
    3578:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    357b:	8b 45 0c             	mov    0xc(%ebp),%eax
    357e:	8b 00                	mov    (%eax),%eax
    3580:	c1 e0 05             	shl    $0x5,%eax
    3583:	89 c2                	mov    %eax,%edx
    3585:	8b 45 08             	mov    0x8(%ebp),%eax
    3588:	01 d0                	add    %edx,%eax
    358a:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    3590:	8b 45 0c             	mov    0xc(%ebp),%eax
    3593:	8b 00                	mov    (%eax),%eax
    3595:	8d 50 01             	lea    0x1(%eax),%edx
    3598:	8b 45 0c             	mov    0xc(%ebp),%eax
    359b:	89 10                	mov    %edx,(%eax)
        pos++;
    359d:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    35a3:	83 c0 01             	add    $0x1,%eax
    35a6:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    35ac:	e9 ff 00 00 00       	jmp    36b0 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    35b1:	8b 45 0c             	mov    0xc(%ebp),%eax
    35b4:	8b 00                	mov    (%eax),%eax
    35b6:	c1 e0 05             	shl    $0x5,%eax
    35b9:	89 c2                	mov    %eax,%edx
    35bb:	8b 45 08             	mov    0x8(%ebp),%eax
    35be:	01 d0                	add    %edx,%eax
    35c0:	8d 50 04             	lea    0x4(%eax),%edx
    35c3:	83 ec 08             	sub    $0x8,%esp
    35c6:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    35cc:	50                   	push   %eax
    35cd:	52                   	push   %edx
    35ce:	e8 ec cd ff ff       	call   3bf <strcpy>
    35d3:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    35d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35d9:	8d 50 01             	lea    0x1(%eax),%edx
    35dc:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    35e2:	01 d0                	add    %edx,%eax
    35e4:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    35ea:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    35f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    35f3:	eb 04                	jmp    35f9 <readVariables+0x1af>
        {
          strend++;
    35f5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    35f9:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    35ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3602:	01 d0                	add    %edx,%eax
    3604:	0f b6 00             	movzbl (%eax),%eax
    3607:	84 c0                	test   %al,%al
    3609:	75 ea                	jne    35f5 <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    360b:	8b 45 0c             	mov    0xc(%ebp),%eax
    360e:	8b 00                	mov    (%eax),%eax
    3610:	c1 e0 05             	shl    $0x5,%eax
    3613:	89 c2                	mov    %eax,%edx
    3615:	8b 45 08             	mov    0x8(%ebp),%eax
    3618:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    361b:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3621:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3624:	29 c2                	sub    %eax,%edx
    3626:	89 d0                	mov    %edx,%eax
    3628:	83 c0 01             	add    $0x1,%eax
    362b:	83 ec 0c             	sub    $0xc,%esp
    362e:	50                   	push   %eax
    362f:	e8 6a d5 ff ff       	call   b9e <malloc>
    3634:	83 c4 10             	add    $0x10,%esp
    3637:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    363a:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    3640:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3643:	eb 35                	jmp    367a <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    3645:	8b 45 0c             	mov    0xc(%ebp),%eax
    3648:	8b 00                	mov    (%eax),%eax
    364a:	c1 e0 05             	shl    $0x5,%eax
    364d:	89 c2                	mov    %eax,%edx
    364f:	8b 45 08             	mov    0x8(%ebp),%eax
    3652:	01 d0                	add    %edx,%eax
    3654:	8b 40 18             	mov    0x18(%eax),%eax
    3657:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    365d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3660:	29 d1                	sub    %edx,%ecx
    3662:	89 ca                	mov    %ecx,%edx
    3664:	01 c2                	add    %eax,%edx
    3666:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    366c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    366f:	01 c8                	add    %ecx,%eax
    3671:	0f b6 00             	movzbl (%eax),%eax
    3674:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    3676:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    367a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    367d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3680:	7e c3                	jle    3645 <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    3682:	8b 45 0c             	mov    0xc(%ebp),%eax
    3685:	8b 00                	mov    (%eax),%eax
    3687:	c1 e0 05             	shl    $0x5,%eax
    368a:	89 c2                	mov    %eax,%edx
    368c:	8b 45 08             	mov    0x8(%ebp),%eax
    368f:	01 d0                	add    %edx,%eax
    3691:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    3697:	8b 45 0c             	mov    0xc(%ebp),%eax
    369a:	8b 00                	mov    (%eax),%eax
    369c:	8d 50 01             	lea    0x1(%eax),%edx
    369f:	8b 45 0c             	mov    0xc(%ebp),%eax
    36a2:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    36a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    36a7:	83 c0 01             	add    $0x1,%eax
    36aa:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    36b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    36b3:	8d 50 ff             	lea    -0x1(%eax),%edx
    36b6:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    36bc:	39 c2                	cmp    %eax,%edx
    36be:	0f 8d e5 fd ff ff    	jge    34a9 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    36c4:	83 ec 04             	sub    $0x4,%esp
    36c7:	68 e8 03 00 00       	push   $0x3e8
    36cc:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    36d2:	50                   	push   %eax
    36d3:	ff 75 e8             	pushl  -0x18(%ebp)
    36d6:	e8 2d cf ff ff       	call   608 <read>
    36db:	83 c4 10             	add    $0x10,%esp
    36de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    36e1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    36e5:	0f 8f af fd ff ff    	jg     349a <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    36eb:	83 ec 0c             	sub    $0xc,%esp
    36ee:	ff 75 e8             	pushl  -0x18(%ebp)
    36f1:	e8 22 cf ff ff       	call   618 <close>
    36f6:	83 c4 10             	add    $0x10,%esp
}
    36f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    36fc:	c9                   	leave  
    36fd:	c3                   	ret    

000036fe <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    36fe:	55                   	push   %ebp
    36ff:	89 e5                	mov    %esp,%ebp
    3701:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    3707:	83 ec 08             	sub    $0x8,%esp
    370a:	6a 02                	push   $0x2
    370c:	68 a8 3c 00 00       	push   $0x3ca8
    3711:	e8 1a cf ff ff       	call   630 <open>
    3716:	83 c4 10             	add    $0x10,%esp
    3719:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    371c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3720:	78 1e                	js     3740 <writeVariables+0x42>
  {
    close(fd);
    3722:	83 ec 0c             	sub    $0xc,%esp
    3725:	ff 75 e4             	pushl  -0x1c(%ebp)
    3728:	e8 eb ce ff ff       	call   618 <close>
    372d:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    3730:	83 ec 0c             	sub    $0xc,%esp
    3733:	68 a8 3c 00 00       	push   $0x3ca8
    3738:	e8 03 cf ff ff       	call   640 <unlink>
    373d:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    3740:	83 ec 08             	sub    $0x8,%esp
    3743:	68 02 02 00 00       	push   $0x202
    3748:	68 a8 3c 00 00       	push   $0x3ca8
    374d:	e8 de ce ff ff       	call   630 <open>
    3752:	83 c4 10             	add    $0x10,%esp
    3755:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    3758:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    375f:	e9 ff 01 00 00       	jmp    3963 <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    3764:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3767:	c1 e0 05             	shl    $0x5,%eax
    376a:	89 c2                	mov    %eax,%edx
    376c:	8b 45 08             	mov    0x8(%ebp),%eax
    376f:	01 d0                	add    %edx,%eax
    3771:	8b 00                	mov    (%eax),%eax
    3773:	83 f8 01             	cmp    $0x1,%eax
    3776:	0f 85 d3 00 00 00    	jne    384f <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    377c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    3783:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3786:	8d 50 01             	lea    0x1(%eax),%edx
    3789:	89 55 e0             	mov    %edx,-0x20(%ebp)
    378c:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    3793:	64 
      int k=0;
    3794:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    379b:	eb 2c                	jmp    37c9 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    379d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    37a0:	8d 50 01             	lea    0x1(%eax),%edx
    37a3:	89 55 e0             	mov    %edx,-0x20(%ebp)
    37a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    37a9:	89 d1                	mov    %edx,%ecx
    37ab:	c1 e1 05             	shl    $0x5,%ecx
    37ae:	8b 55 08             	mov    0x8(%ebp),%edx
    37b1:	01 d1                	add    %edx,%ecx
    37b3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    37b6:	01 ca                	add    %ecx,%edx
    37b8:	83 c2 04             	add    $0x4,%edx
    37bb:	0f b6 12             	movzbl (%edx),%edx
    37be:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    37c5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    37c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37cc:	c1 e0 05             	shl    $0x5,%eax
    37cf:	89 c2                	mov    %eax,%edx
    37d1:	8b 45 08             	mov    0x8(%ebp),%eax
    37d4:	01 c2                	add    %eax,%edx
    37d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    37d9:	01 d0                	add    %edx,%eax
    37db:	83 c0 04             	add    $0x4,%eax
    37de:	0f b6 00             	movzbl (%eax),%eax
    37e1:	84 c0                	test   %al,%al
    37e3:	75 b8                	jne    379d <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    37e5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    37e8:	8d 50 01             	lea    0x1(%eax),%edx
    37eb:	89 55 e0             	mov    %edx,-0x20(%ebp)
    37ee:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    37f5:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    37f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37f9:	c1 e0 05             	shl    $0x5,%eax
    37fc:	89 c2                	mov    %eax,%edx
    37fe:	8b 45 08             	mov    0x8(%ebp),%eax
    3801:	01 d0                	add    %edx,%eax
    3803:	dd 40 18             	fldl   0x18(%eax)
    3806:	8d 45 e0             	lea    -0x20(%ebp),%eax
    3809:	50                   	push   %eax
    380a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    380e:	dd 1c 24             	fstpl  (%esp)
    3811:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3817:	50                   	push   %eax
    3818:	e8 7d d5 ff ff       	call   d9a <double2str>
    381d:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    3820:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3823:	8d 50 01             	lea    0x1(%eax),%edx
    3826:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3829:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    3830:	00 
      write(fd,buf,pos);
    3831:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3834:	83 ec 04             	sub    $0x4,%esp
    3837:	50                   	push   %eax
    3838:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    383e:	50                   	push   %eax
    383f:	ff 75 e4             	pushl  -0x1c(%ebp)
    3842:	e8 c9 cd ff ff       	call   610 <write>
    3847:	83 c4 10             	add    $0x10,%esp
    384a:	e9 10 01 00 00       	jmp    395f <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    384f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    3856:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3859:	8d 50 01             	lea    0x1(%eax),%edx
    385c:	89 55 ec             	mov    %edx,-0x14(%ebp)
    385f:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    3866:	73 
      int k=0;
    3867:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    386e:	eb 2c                	jmp    389c <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    3870:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3873:	8d 50 01             	lea    0x1(%eax),%edx
    3876:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3879:	8b 55 f4             	mov    -0xc(%ebp),%edx
    387c:	89 d1                	mov    %edx,%ecx
    387e:	c1 e1 05             	shl    $0x5,%ecx
    3881:	8b 55 08             	mov    0x8(%ebp),%edx
    3884:	01 d1                	add    %edx,%ecx
    3886:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3889:	01 ca                	add    %ecx,%edx
    388b:	83 c2 04             	add    $0x4,%edx
    388e:	0f b6 12             	movzbl (%edx),%edx
    3891:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3898:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    389c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    389f:	c1 e0 05             	shl    $0x5,%eax
    38a2:	89 c2                	mov    %eax,%edx
    38a4:	8b 45 08             	mov    0x8(%ebp),%eax
    38a7:	01 c2                	add    %eax,%edx
    38a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    38ac:	01 d0                	add    %edx,%eax
    38ae:	83 c0 04             	add    $0x4,%eax
    38b1:	0f b6 00             	movzbl (%eax),%eax
    38b4:	84 c0                	test   %al,%al
    38b6:	75 b8                	jne    3870 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    38b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    38bb:	8d 50 01             	lea    0x1(%eax),%edx
    38be:	89 55 ec             	mov    %edx,-0x14(%ebp)
    38c1:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    38c8:	3d 
      k=0;
    38c9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    38d0:	eb 2c                	jmp    38fe <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    38d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    38d5:	8d 50 01             	lea    0x1(%eax),%edx
    38d8:	89 55 ec             	mov    %edx,-0x14(%ebp)
    38db:	8b 55 f4             	mov    -0xc(%ebp),%edx
    38de:	89 d1                	mov    %edx,%ecx
    38e0:	c1 e1 05             	shl    $0x5,%ecx
    38e3:	8b 55 08             	mov    0x8(%ebp),%edx
    38e6:	01 ca                	add    %ecx,%edx
    38e8:	8b 4a 18             	mov    0x18(%edx),%ecx
    38eb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    38ee:	01 ca                	add    %ecx,%edx
    38f0:	0f b6 12             	movzbl (%edx),%edx
    38f3:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    38fa:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    38fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3901:	c1 e0 05             	shl    $0x5,%eax
    3904:	89 c2                	mov    %eax,%edx
    3906:	8b 45 08             	mov    0x8(%ebp),%eax
    3909:	01 d0                	add    %edx,%eax
    390b:	8b 50 18             	mov    0x18(%eax),%edx
    390e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3911:	01 d0                	add    %edx,%eax
    3913:	0f b6 00             	movzbl (%eax),%eax
    3916:	84 c0                	test   %al,%al
    3918:	75 b8                	jne    38d2 <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    391a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    391d:	8d 50 01             	lea    0x1(%eax),%edx
    3920:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3923:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    392a:	00 
      write(fd,buf,pos);
    392b:	83 ec 04             	sub    $0x4,%esp
    392e:	ff 75 ec             	pushl  -0x14(%ebp)
    3931:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3937:	50                   	push   %eax
    3938:	ff 75 e4             	pushl  -0x1c(%ebp)
    393b:	e8 d0 cc ff ff       	call   610 <write>
    3940:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    3943:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3946:	c1 e0 05             	shl    $0x5,%eax
    3949:	89 c2                	mov    %eax,%edx
    394b:	8b 45 08             	mov    0x8(%ebp),%eax
    394e:	01 d0                	add    %edx,%eax
    3950:	8b 40 18             	mov    0x18(%eax),%eax
    3953:	83 ec 0c             	sub    $0xc,%esp
    3956:	50                   	push   %eax
    3957:	e8 00 d1 ff ff       	call   a5c <free>
    395c:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    395f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3963:	8b 45 0c             	mov    0xc(%ebp),%eax
    3966:	8b 00                	mov    (%eax),%eax
    3968:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    396b:	0f 8f f3 fd ff ff    	jg     3764 <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    3971:	8b 45 0c             	mov    0xc(%ebp),%eax
    3974:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    397a:	83 ec 0c             	sub    $0xc,%esp
    397d:	ff 75 e4             	pushl  -0x1c(%ebp)
    3980:	e8 93 cc ff ff       	call   618 <close>
    3985:	83 c4 10             	add    $0x10,%esp
  return;
    3988:	90                   	nop
    3989:	c9                   	leave  
    398a:	c3                   	ret    
