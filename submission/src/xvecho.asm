
_xvecho：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "xv_user.h"
#include "xv_color.h"
#include "xv_variable.h"

int main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	53                   	push   %ebx
       e:	51                   	push   %ecx
       f:	81 ec f0 02 00 00    	sub    $0x2f0,%esp
      15:	89 cb                	mov    %ecx,%ebx
  struct variable variables[V_MAX];
  int v_num = 0;
      17:	c7 85 30 fd ff ff 00 	movl   $0x0,-0x2d0(%ebp)
      1e:	00 00 00 
  int i = 1;
      21:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  int setfore = 0; //mark whether there is optional arg
      28:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int setback = 0; //mark whether there is optional arg
      2f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int forec = XV_WHITE;
      36:	c7 45 e8 07 00 00 00 	movl   $0x7,-0x18(%ebp)
  int backc = XV_BLACK;
      3d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  char colorname[8] = {'B','b','g','c','r','p','y','w'};
      44:	c6 85 28 fd ff ff 42 	movb   $0x42,-0x2d8(%ebp)
      4b:	c6 85 29 fd ff ff 62 	movb   $0x62,-0x2d7(%ebp)
      52:	c6 85 2a fd ff ff 67 	movb   $0x67,-0x2d6(%ebp)
      59:	c6 85 2b fd ff ff 63 	movb   $0x63,-0x2d5(%ebp)
      60:	c6 85 2c fd ff ff 72 	movb   $0x72,-0x2d4(%ebp)
      67:	c6 85 2d fd ff ff 70 	movb   $0x70,-0x2d3(%ebp)
      6e:	c6 85 2e fd ff ff 79 	movb   $0x79,-0x2d2(%ebp)
      75:	c6 85 2f fd ff ff 77 	movb   $0x77,-0x2d1(%ebp)
  int hasfault = 0; // mark if there is any fault
      7c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  if(argv[1][0] == '-') //foreground color
      83:	8b 43 04             	mov    0x4(%ebx),%eax
      86:	83 c0 04             	add    $0x4,%eax
      89:	8b 00                	mov    (%eax),%eax
      8b:	0f b6 00             	movzbl (%eax),%eax
      8e:	3c 2d                	cmp    $0x2d,%al
      90:	0f 85 e1 00 00 00    	jne    177 <main+0x177>
  {
      for(int j=0; j<8; j++) 
      96:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
      9d:	eb 33                	jmp    d2 <main+0xd2>
      {
         if(argv[1][1] == colorname[j])
      9f:	8b 43 04             	mov    0x4(%ebx),%eax
      a2:	83 c0 04             	add    $0x4,%eax
      a5:	8b 00                	mov    (%eax),%eax
      a7:	83 c0 01             	add    $0x1,%eax
      aa:	0f b6 10             	movzbl (%eax),%edx
      ad:	8d 8d 28 fd ff ff    	lea    -0x2d8(%ebp),%ecx
      b3:	8b 45 dc             	mov    -0x24(%ebp),%eax
      b6:	01 c8                	add    %ecx,%eax
      b8:	0f b6 00             	movzbl (%eax),%eax
      bb:	38 c2                	cmp    %al,%dl
      bd:	75 0f                	jne    ce <main+0xce>
         {
           forec = j;
      bf:	8b 45 dc             	mov    -0x24(%ebp),%eax
      c2:	89 45 e8             	mov    %eax,-0x18(%ebp)
           setfore = 1;
      c5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
           break;
      cc:	eb 0a                	jmp    d8 <main+0xd8>
  int backc = XV_BLACK;
  char colorname[8] = {'B','b','g','c','r','p','y','w'};
  int hasfault = 0; // mark if there is any fault
  if(argv[1][0] == '-') //foreground color
  {
      for(int j=0; j<8; j++) 
      ce:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
      d2:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
      d6:	7e c7                	jle    9f <main+0x9f>
           forec = j;
           setfore = 1;
           break;
         }
      }
      if(setfore == 1)
      d8:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
      dc:	0f 85 95 00 00 00    	jne    177 <main+0x177>
      { 
         i = 2;
      e2:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
	       if(argv[1][2] == '-') //background color
      e9:	8b 43 04             	mov    0x4(%ebx),%eax
      ec:	83 c0 04             	add    $0x4,%eax
      ef:	8b 00                	mov    (%eax),%eax
      f1:	83 c0 02             	add    $0x2,%eax
      f4:	0f b6 00             	movzbl (%eax),%eax
      f7:	3c 2d                	cmp    $0x2d,%al
      f9:	75 63                	jne    15e <main+0x15e>
         {
	          for(int j=0; j<8; j++)
      fb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
     102:	eb 45                	jmp    149 <main+0x149>
	          {
              if(argv[1][3] == colorname[j] && argv[1][4] == '\0')
     104:	8b 43 04             	mov    0x4(%ebx),%eax
     107:	83 c0 04             	add    $0x4,%eax
     10a:	8b 00                	mov    (%eax),%eax
     10c:	83 c0 03             	add    $0x3,%eax
     10f:	0f b6 10             	movzbl (%eax),%edx
     112:	8d 8d 28 fd ff ff    	lea    -0x2d8(%ebp),%ecx
     118:	8b 45 d8             	mov    -0x28(%ebp),%eax
     11b:	01 c8                	add    %ecx,%eax
     11d:	0f b6 00             	movzbl (%eax),%eax
     120:	38 c2                	cmp    %al,%dl
     122:	75 21                	jne    145 <main+0x145>
     124:	8b 43 04             	mov    0x4(%ebx),%eax
     127:	83 c0 04             	add    $0x4,%eax
     12a:	8b 00                	mov    (%eax),%eax
     12c:	83 c0 04             	add    $0x4,%eax
     12f:	0f b6 00             	movzbl (%eax),%eax
     132:	84 c0                	test   %al,%al
     134:	75 0f                	jne    145 <main+0x145>
              {
		            backc = j;
     136:	8b 45 d8             	mov    -0x28(%ebp),%eax
     139:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		            setback = 1;
     13c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
                break;
     143:	eb 0a                	jmp    14f <main+0x14f>
      if(setfore == 1)
      { 
         i = 2;
	       if(argv[1][2] == '-') //background color
         {
	          for(int j=0; j<8; j++)
     145:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
     149:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
     14d:	7e b5                	jle    104 <main+0x104>
		            backc = j;
		            setback = 1;
                break;
              }
	          }
            if(setback == 0) //has forec but no " "
     14f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     153:	75 22                	jne    177 <main+0x177>
            { 
              hasfault = 1;
     155:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
     15c:	eb 19                	jmp    177 <main+0x177>
            }
         }
         else if(argv[1][2] != '\0')
     15e:	8b 43 04             	mov    0x4(%ebx),%eax
     161:	83 c0 04             	add    $0x4,%eax
     164:	8b 00                	mov    (%eax),%eax
     166:	83 c0 02             	add    $0x2,%eax
     169:	0f b6 00             	movzbl (%eax),%eax
     16c:	84 c0                	test   %al,%al
     16e:	74 07                	je     177 <main+0x177>
         {
            hasfault = 1;
     170:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
	       }
      } 
  }
  if(hasfault == 0) //correct color argument format
     177:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     17b:	0f 85 25 03 00 00    	jne    4a6 <main+0x4a6>
  {
     for(; i < argc; i++)
     181:	e9 13 03 00 00       	jmp    499 <main+0x499>
     {
       int j = 0;
     186:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
        while(argv[i][j] != '\0')
     18d:	e9 a8 02 00 00       	jmp    43a <main+0x43a>
        {
          if(argv[i][j] != '$')
     192:	8b 45 f4             	mov    -0xc(%ebp),%eax
     195:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     19c:	8b 43 04             	mov    0x4(%ebx),%eax
     19f:	01 d0                	add    %edx,%eax
     1a1:	8b 10                	mov    (%eax),%edx
     1a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     1a6:	01 d0                	add    %edx,%eax
     1a8:	0f b6 00             	movzbl (%eax),%eax
     1ab:	3c 24                	cmp    $0x24,%al
     1ad:	74 3b                	je     1ea <main+0x1ea>
          {
            color_putc(argv[i][j],forec,1,backc,0);
     1af:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1b2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     1b9:	8b 43 04             	mov    0x4(%ebx),%eax
     1bc:	01 d0                	add    %edx,%eax
     1be:	8b 10                	mov    (%eax),%edx
     1c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     1c3:	01 d0                	add    %edx,%eax
     1c5:	0f b6 00             	movzbl (%eax),%eax
     1c8:	0f be c0             	movsbl %al,%eax
     1cb:	83 ec 0c             	sub    $0xc,%esp
     1ce:	6a 00                	push   $0x0
     1d0:	ff 75 e4             	pushl  -0x1c(%ebp)
     1d3:	6a 01                	push   $0x1
     1d5:	ff 75 e8             	pushl  -0x18(%ebp)
     1d8:	50                   	push   %eax
     1d9:	e8 d0 2c 00 00       	call   2eae <color_putc>
     1de:	83 c4 20             	add    $0x20,%esp
            j++;
     1e1:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
     1e5:	e9 50 02 00 00       	jmp    43a <main+0x43a>
          }
          else //judge whether this is a real variable
          {
            int index = 0;
     1ea:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
            int isVariable = 0;
     1f1:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
            int pos = j; //save the pos
     1f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     1fb:	89 45 bc             	mov    %eax,-0x44(%ebp)
            j++;
     1fe:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
            int k=j+1;
     202:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     205:	83 c0 01             	add    $0x1,%eax
     208:	89 45 c8             	mov    %eax,-0x38(%ebp)
            int lenv = strlen(argv[i]);
     20b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     20e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     215:	8b 43 04             	mov    0x4(%ebx),%eax
     218:	01 d0                	add    %edx,%eax
     21a:	8b 00                	mov    (%eax),%eax
     21c:	83 ec 0c             	sub    $0xc,%esp
     21f:	50                   	push   %eax
     220:	e8 33 03 00 00       	call   558 <strlen>
     225:	83 c4 10             	add    $0x10,%esp
     228:	89 45 b8             	mov    %eax,-0x48(%ebp)
            if(argv[i][j] == '{')
     22b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     22e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     235:	8b 43 04             	mov    0x4(%ebx),%eax
     238:	01 d0                	add    %edx,%eax
     23a:	8b 10                	mov    (%eax),%edx
     23c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     23f:	01 d0                	add    %edx,%eax
     241:	0f b6 00             	movzbl (%eax),%eax
     244:	3c 7b                	cmp    $0x7b,%al
     246:	0f 85 1d 01 00 00    	jne    369 <main+0x369>
            {
              for(; k<lenv; k++)
     24c:	eb 21                	jmp    26f <main+0x26f>
              {
                if(argv[i][k] == '}')
     24e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     251:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     258:	8b 43 04             	mov    0x4(%ebx),%eax
     25b:	01 d0                	add    %edx,%eax
     25d:	8b 10                	mov    (%eax),%edx
     25f:	8b 45 c8             	mov    -0x38(%ebp),%eax
     262:	01 d0                	add    %edx,%eax
     264:	0f b6 00             	movzbl (%eax),%eax
     267:	3c 7d                	cmp    $0x7d,%al
     269:	74 0e                	je     279 <main+0x279>
            j++;
            int k=j+1;
            int lenv = strlen(argv[i]);
            if(argv[i][j] == '{')
            {
              for(; k<lenv; k++)
     26b:	83 45 c8 01          	addl   $0x1,-0x38(%ebp)
     26f:	8b 45 c8             	mov    -0x38(%ebp),%eax
     272:	3b 45 b8             	cmp    -0x48(%ebp),%eax
     275:	7c d7                	jl     24e <main+0x24e>
     277:	eb 01                	jmp    27a <main+0x27a>
              {
                if(argv[i][k] == '}')
                  break;
     279:	90                   	nop
              }
              if(argv[i][k] == '}')
     27a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     27d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     284:	8b 43 04             	mov    0x4(%ebx),%eax
     287:	01 d0                	add    %edx,%eax
     289:	8b 10                	mov    (%eax),%edx
     28b:	8b 45 c8             	mov    -0x38(%ebp),%eax
     28e:	01 d0                	add    %edx,%eax
     290:	0f b6 00             	movzbl (%eax),%eax
     293:	3c 7d                	cmp    $0x7d,%al
     295:	0f 85 ce 00 00 00    	jne    369 <main+0x369>
              {
                char name[V_NAME_MAX_LEN];
                int len = k-j-1;
     29b:	8b 45 c8             	mov    -0x38(%ebp),%eax
     29e:	2b 45 d4             	sub    -0x2c(%ebp),%eax
     2a1:	83 e8 01             	sub    $0x1,%eax
     2a4:	89 45 b4             	mov    %eax,-0x4c(%ebp)
                for(int t=0; t<len; t++)
     2a7:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     2ae:	eb 32                	jmp    2e2 <main+0x2e2>
                {
                  name[t] = argv[i][t+j+1];
     2b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     2b3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     2ba:	8b 43 04             	mov    0x4(%ebx),%eax
     2bd:	01 d0                	add    %edx,%eax
     2bf:	8b 00                	mov    (%eax),%eax
     2c1:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
     2c4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     2c7:	01 ca                	add    %ecx,%edx
     2c9:	83 c2 01             	add    $0x1,%edx
     2cc:	01 d0                	add    %edx,%eax
     2ce:	0f b6 00             	movzbl (%eax),%eax
     2d1:	8d 8d 14 fd ff ff    	lea    -0x2ec(%ebp),%ecx
     2d7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
     2da:	01 ca                	add    %ecx,%edx
     2dc:	88 02                	mov    %al,(%edx)
              }
              if(argv[i][k] == '}')
              {
                char name[V_NAME_MAX_LEN];
                int len = k-j-1;
                for(int t=0; t<len; t++)
     2de:	83 45 c4 01          	addl   $0x1,-0x3c(%ebp)
     2e2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     2e5:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
     2e8:	7c c6                	jl     2b0 <main+0x2b0>
                {
                  name[t] = argv[i][t+j+1];
                }
                name[len] = '\0'; //name of the variable
     2ea:	8d 95 14 fd ff ff    	lea    -0x2ec(%ebp),%edx
     2f0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     2f3:	01 d0                	add    %edx,%eax
     2f5:	c6 00 00             	movb   $0x0,(%eax)
                if(v_num == 0)
     2f8:	8b 85 30 fd ff ff    	mov    -0x2d0(%ebp),%eax
     2fe:	85 c0                	test   %eax,%eax
     300:	75 47                	jne    349 <main+0x349>
                  readVariables(variables,&v_num);
     302:	83 ec 08             	sub    $0x8,%esp
     305:	8d 85 30 fd ff ff    	lea    -0x2d0(%ebp),%eax
     30b:	50                   	push   %eax
     30c:	8d 85 34 fd ff ff    	lea    -0x2cc(%ebp),%eax
     312:	50                   	push   %eax
     313:	e8 5c 32 00 00       	call   3574 <readVariables>
     318:	83 c4 10             	add    $0x10,%esp
                
            
                for(; index<v_num; index++)
     31b:	eb 2c                	jmp    349 <main+0x349>
                {
                  if(strcmp(variables[index].name,name) == 0) //exist var
     31d:	8d 85 34 fd ff ff    	lea    -0x2cc(%ebp),%eax
     323:	8b 55 d0             	mov    -0x30(%ebp),%edx
     326:	c1 e2 05             	shl    $0x5,%edx
     329:	01 d0                	add    %edx,%eax
     32b:	8d 50 04             	lea    0x4(%eax),%edx
     32e:	83 ec 08             	sub    $0x8,%esp
     331:	8d 85 14 fd ff ff    	lea    -0x2ec(%ebp),%eax
     337:	50                   	push   %eax
     338:	52                   	push   %edx
     339:	e8 db 01 00 00       	call   519 <strcmp>
     33e:	83 c4 10             	add    $0x10,%esp
     341:	85 c0                	test   %eax,%eax
     343:	74 11                	je     356 <main+0x356>
                name[len] = '\0'; //name of the variable
                if(v_num == 0)
                  readVariables(variables,&v_num);
                
            
                for(; index<v_num; index++)
     345:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
     349:	8b 85 30 fd ff ff    	mov    -0x2d0(%ebp),%eax
     34f:	39 45 d0             	cmp    %eax,-0x30(%ebp)
     352:	7c c9                	jl     31d <main+0x31d>
     354:	eb 01                	jmp    357 <main+0x357>
                {
                  if(strcmp(variables[index].name,name) == 0) //exist var
                    break;
     356:	90                   	nop
                }
                if(index < v_num) //exist such variable
     357:	8b 85 30 fd ff ff    	mov    -0x2d0(%ebp),%eax
     35d:	39 45 d0             	cmp    %eax,-0x30(%ebp)
     360:	7d 07                	jge    369 <main+0x369>
                {
                  isVariable = 1;
     362:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
                }
              }
            }
            if(isVariable == 1)
     369:	83 7d cc 01          	cmpl   $0x1,-0x34(%ebp)
     36d:	75 7c                	jne    3eb <main+0x3eb>
            {
              if(variables[index].type == V_DOUBLE)
     36f:	8b 45 d0             	mov    -0x30(%ebp),%eax
     372:	c1 e0 05             	shl    $0x5,%eax
     375:	8d 4d f8             	lea    -0x8(%ebp),%ecx
     378:	01 c8                	add    %ecx,%eax
     37a:	2d c4 02 00 00       	sub    $0x2c4,%eax
     37f:	8b 00                	mov    (%eax),%eax
     381:	83 f8 01             	cmp    $0x1,%eax
     384:	75 36                	jne    3bc <main+0x3bc>
              {
                color_printf(forec,1,backc,0,"%f",variables[index].value.dvalue);
     386:	8b 45 d0             	mov    -0x30(%ebp),%eax
     389:	c1 e0 05             	shl    $0x5,%eax
     38c:	8d 4d f8             	lea    -0x8(%ebp),%ecx
     38f:	01 c8                	add    %ecx,%eax
     391:	2d b4 02 00 00       	sub    $0x2b4,%eax
     396:	dd 40 08             	fldl   0x8(%eax)
     399:	83 ec 04             	sub    $0x4,%esp
     39c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     3a0:	dd 1c 24             	fstpl  (%esp)
     3a3:	68 b8 3a 00 00       	push   $0x3ab8
     3a8:	6a 00                	push   $0x0
     3aa:	ff 75 e4             	pushl  -0x1c(%ebp)
     3ad:	6a 01                	push   $0x1
     3af:	ff 75 e8             	pushl  -0x18(%ebp)
     3b2:	e8 37 2d 00 00       	call   30ee <color_printf>
     3b7:	83 c4 20             	add    $0x20,%esp
     3ba:	eb 75                	jmp    431 <main+0x431>
              }
              else
              {
                color_printf(forec,1,backc,0,"%s",variables[index].value.str);
     3bc:	8b 45 d0             	mov    -0x30(%ebp),%eax
     3bf:	c1 e0 05             	shl    $0x5,%eax
     3c2:	8d 4d f8             	lea    -0x8(%ebp),%ecx
     3c5:	01 c8                	add    %ecx,%eax
     3c7:	2d ac 02 00 00       	sub    $0x2ac,%eax
     3cc:	8b 00                	mov    (%eax),%eax
     3ce:	83 ec 08             	sub    $0x8,%esp
     3d1:	50                   	push   %eax
     3d2:	68 bb 3a 00 00       	push   $0x3abb
     3d7:	6a 00                	push   $0x0
     3d9:	ff 75 e4             	pushl  -0x1c(%ebp)
     3dc:	6a 01                	push   $0x1
     3de:	ff 75 e8             	pushl  -0x18(%ebp)
     3e1:	e8 08 2d 00 00       	call   30ee <color_printf>
     3e6:	83 c4 20             	add    $0x20,%esp
     3e9:	eb 46                	jmp    431 <main+0x431>
              }
            }
            else
            {
              for(int cur = pos; cur<=k; cur++)
     3eb:	8b 45 bc             	mov    -0x44(%ebp),%eax
     3ee:	89 45 c0             	mov    %eax,-0x40(%ebp)
     3f1:	eb 36                	jmp    429 <main+0x429>
              {
                color_putc(argv[i][cur],forec,1,backc,0);
     3f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3f6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     3fd:	8b 43 04             	mov    0x4(%ebx),%eax
     400:	01 d0                	add    %edx,%eax
     402:	8b 10                	mov    (%eax),%edx
     404:	8b 45 c0             	mov    -0x40(%ebp),%eax
     407:	01 d0                	add    %edx,%eax
     409:	0f b6 00             	movzbl (%eax),%eax
     40c:	0f be c0             	movsbl %al,%eax
     40f:	83 ec 0c             	sub    $0xc,%esp
     412:	6a 00                	push   $0x0
     414:	ff 75 e4             	pushl  -0x1c(%ebp)
     417:	6a 01                	push   $0x1
     419:	ff 75 e8             	pushl  -0x18(%ebp)
     41c:	50                   	push   %eax
     41d:	e8 8c 2a 00 00       	call   2eae <color_putc>
     422:	83 c4 20             	add    $0x20,%esp
                color_printf(forec,1,backc,0,"%s",variables[index].value.str);
              }
            }
            else
            {
              for(int cur = pos; cur<=k; cur++)
     425:	83 45 c0 01          	addl   $0x1,-0x40(%ebp)
     429:	8b 45 c0             	mov    -0x40(%ebp),%eax
     42c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
     42f:	7e c2                	jle    3f3 <main+0x3f3>
              {
                color_putc(argv[i][cur],forec,1,backc,0);
              }
            }
            j = k+1;
     431:	8b 45 c8             	mov    -0x38(%ebp),%eax
     434:	83 c0 01             	add    $0x1,%eax
     437:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  if(hasfault == 0) //correct color argument format
  {
     for(; i < argc; i++)
     {
       int j = 0;
        while(argv[i][j] != '\0')
     43a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     43d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     444:	8b 43 04             	mov    0x4(%ebx),%eax
     447:	01 d0                	add    %edx,%eax
     449:	8b 10                	mov    (%eax),%edx
     44b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     44e:	01 d0                	add    %edx,%eax
     450:	0f b6 00             	movzbl (%eax),%eax
     453:	84 c0                	test   %al,%al
     455:	0f 85 37 fd ff ff    	jne    192 <main+0x192>
              }
            }
            j = k+1;
          }
        }
        if(i+1 < argc)
     45b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     45e:	83 c0 01             	add    $0x1,%eax
     461:	3b 03                	cmp    (%ebx),%eax
     463:	7d 19                	jge    47e <main+0x47e>
          color_putc(' ',forec,1,backc,0);
     465:	83 ec 0c             	sub    $0xc,%esp
     468:	6a 00                	push   $0x0
     46a:	ff 75 e4             	pushl  -0x1c(%ebp)
     46d:	6a 01                	push   $0x1
     46f:	ff 75 e8             	pushl  -0x18(%ebp)
     472:	6a 20                	push   $0x20
     474:	e8 35 2a 00 00       	call   2eae <color_putc>
     479:	83 c4 20             	add    $0x20,%esp
     47c:	eb 17                	jmp    495 <main+0x495>
        else
          color_putc('\n',forec,1,backc,0);
     47e:	83 ec 0c             	sub    $0xc,%esp
     481:	6a 00                	push   $0x0
     483:	ff 75 e4             	pushl  -0x1c(%ebp)
     486:	6a 01                	push   $0x1
     488:	ff 75 e8             	pushl  -0x18(%ebp)
     48b:	6a 0a                	push   $0xa
     48d:	e8 1c 2a 00 00       	call   2eae <color_putc>
     492:	83 c4 20             	add    $0x20,%esp
	       }
      } 
  }
  if(hasfault == 0) //correct color argument format
  {
     for(; i < argc; i++)
     495:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     499:	8b 45 f4             	mov    -0xc(%ebp),%eax
     49c:	3b 03                	cmp    (%ebx),%eax
     49e:	0f 8c e2 fc ff ff    	jl     186 <main+0x186>
     4a4:	eb 18                	jmp    4be <main+0x4be>
          color_putc('\n',forec,1,backc,0);
     }
  }
  else
  {
    color_printf(XV_RED,1,XV_BLACK,0,"uncorrect xvecho color argument!\n");
     4a6:	83 ec 0c             	sub    $0xc,%esp
     4a9:	68 c0 3a 00 00       	push   $0x3ac0
     4ae:	6a 00                	push   $0x0
     4b0:	6a 00                	push   $0x0
     4b2:	6a 01                	push   $0x1
     4b4:	6a 04                	push   $0x4
     4b6:	e8 33 2c 00 00       	call   30ee <color_printf>
     4bb:	83 c4 20             	add    $0x20,%esp
  }
  exit();
     4be:	e8 57 02 00 00       	call   71a <exit>

000004c3 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     4c3:	55                   	push   %ebp
     4c4:	89 e5                	mov    %esp,%ebp
     4c6:	57                   	push   %edi
     4c7:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     4c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
     4cb:	8b 55 10             	mov    0x10(%ebp),%edx
     4ce:	8b 45 0c             	mov    0xc(%ebp),%eax
     4d1:	89 cb                	mov    %ecx,%ebx
     4d3:	89 df                	mov    %ebx,%edi
     4d5:	89 d1                	mov    %edx,%ecx
     4d7:	fc                   	cld    
     4d8:	f3 aa                	rep stos %al,%es:(%edi)
     4da:	89 ca                	mov    %ecx,%edx
     4dc:	89 fb                	mov    %edi,%ebx
     4de:	89 5d 08             	mov    %ebx,0x8(%ebp)
     4e1:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     4e4:	90                   	nop
     4e5:	5b                   	pop    %ebx
     4e6:	5f                   	pop    %edi
     4e7:	5d                   	pop    %ebp
     4e8:	c3                   	ret    

000004e9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     4e9:	55                   	push   %ebp
     4ea:	89 e5                	mov    %esp,%ebp
     4ec:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     4ef:	8b 45 08             	mov    0x8(%ebp),%eax
     4f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     4f5:	90                   	nop
     4f6:	8b 45 08             	mov    0x8(%ebp),%eax
     4f9:	8d 50 01             	lea    0x1(%eax),%edx
     4fc:	89 55 08             	mov    %edx,0x8(%ebp)
     4ff:	8b 55 0c             	mov    0xc(%ebp),%edx
     502:	8d 4a 01             	lea    0x1(%edx),%ecx
     505:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     508:	0f b6 12             	movzbl (%edx),%edx
     50b:	88 10                	mov    %dl,(%eax)
     50d:	0f b6 00             	movzbl (%eax),%eax
     510:	84 c0                	test   %al,%al
     512:	75 e2                	jne    4f6 <strcpy+0xd>
    ;
  return os;
     514:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     517:	c9                   	leave  
     518:	c3                   	ret    

00000519 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     519:	55                   	push   %ebp
     51a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     51c:	eb 08                	jmp    526 <strcmp+0xd>
    p++, q++;
     51e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     522:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     526:	8b 45 08             	mov    0x8(%ebp),%eax
     529:	0f b6 00             	movzbl (%eax),%eax
     52c:	84 c0                	test   %al,%al
     52e:	74 10                	je     540 <strcmp+0x27>
     530:	8b 45 08             	mov    0x8(%ebp),%eax
     533:	0f b6 10             	movzbl (%eax),%edx
     536:	8b 45 0c             	mov    0xc(%ebp),%eax
     539:	0f b6 00             	movzbl (%eax),%eax
     53c:	38 c2                	cmp    %al,%dl
     53e:	74 de                	je     51e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     540:	8b 45 08             	mov    0x8(%ebp),%eax
     543:	0f b6 00             	movzbl (%eax),%eax
     546:	0f b6 d0             	movzbl %al,%edx
     549:	8b 45 0c             	mov    0xc(%ebp),%eax
     54c:	0f b6 00             	movzbl (%eax),%eax
     54f:	0f b6 c0             	movzbl %al,%eax
     552:	29 c2                	sub    %eax,%edx
     554:	89 d0                	mov    %edx,%eax
}
     556:	5d                   	pop    %ebp
     557:	c3                   	ret    

00000558 <strlen>:

uint
strlen(char *s)
{
     558:	55                   	push   %ebp
     559:	89 e5                	mov    %esp,%ebp
     55b:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     55e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     565:	eb 04                	jmp    56b <strlen+0x13>
     567:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     56b:	8b 55 fc             	mov    -0x4(%ebp),%edx
     56e:	8b 45 08             	mov    0x8(%ebp),%eax
     571:	01 d0                	add    %edx,%eax
     573:	0f b6 00             	movzbl (%eax),%eax
     576:	84 c0                	test   %al,%al
     578:	75 ed                	jne    567 <strlen+0xf>
    ;
  return n;
     57a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     57d:	c9                   	leave  
     57e:	c3                   	ret    

0000057f <memset>:

void*
memset(void *dst, int c, uint n)
{
     57f:	55                   	push   %ebp
     580:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     582:	8b 45 10             	mov    0x10(%ebp),%eax
     585:	50                   	push   %eax
     586:	ff 75 0c             	pushl  0xc(%ebp)
     589:	ff 75 08             	pushl  0x8(%ebp)
     58c:	e8 32 ff ff ff       	call   4c3 <stosb>
     591:	83 c4 0c             	add    $0xc,%esp
  return dst;
     594:	8b 45 08             	mov    0x8(%ebp),%eax
}
     597:	c9                   	leave  
     598:	c3                   	ret    

00000599 <strchr>:

char*
strchr(const char *s, char c)
{
     599:	55                   	push   %ebp
     59a:	89 e5                	mov    %esp,%ebp
     59c:	83 ec 04             	sub    $0x4,%esp
     59f:	8b 45 0c             	mov    0xc(%ebp),%eax
     5a2:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     5a5:	eb 14                	jmp    5bb <strchr+0x22>
    if(*s == c)
     5a7:	8b 45 08             	mov    0x8(%ebp),%eax
     5aa:	0f b6 00             	movzbl (%eax),%eax
     5ad:	3a 45 fc             	cmp    -0x4(%ebp),%al
     5b0:	75 05                	jne    5b7 <strchr+0x1e>
      return (char*)s;
     5b2:	8b 45 08             	mov    0x8(%ebp),%eax
     5b5:	eb 13                	jmp    5ca <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     5b7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     5bb:	8b 45 08             	mov    0x8(%ebp),%eax
     5be:	0f b6 00             	movzbl (%eax),%eax
     5c1:	84 c0                	test   %al,%al
     5c3:	75 e2                	jne    5a7 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     5c5:	b8 00 00 00 00       	mov    $0x0,%eax
}
     5ca:	c9                   	leave  
     5cb:	c3                   	ret    

000005cc <gets>:

char*
gets(char *buf, int max)
{
     5cc:	55                   	push   %ebp
     5cd:	89 e5                	mov    %esp,%ebp
     5cf:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     5d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     5d9:	eb 42                	jmp    61d <gets+0x51>
    cc = read(0, &c, 1);
     5db:	83 ec 04             	sub    $0x4,%esp
     5de:	6a 01                	push   $0x1
     5e0:	8d 45 ef             	lea    -0x11(%ebp),%eax
     5e3:	50                   	push   %eax
     5e4:	6a 00                	push   $0x0
     5e6:	e8 47 01 00 00       	call   732 <read>
     5eb:	83 c4 10             	add    $0x10,%esp
     5ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     5f1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     5f5:	7e 33                	jle    62a <gets+0x5e>
      break;
    buf[i++] = c;
     5f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5fa:	8d 50 01             	lea    0x1(%eax),%edx
     5fd:	89 55 f4             	mov    %edx,-0xc(%ebp)
     600:	89 c2                	mov    %eax,%edx
     602:	8b 45 08             	mov    0x8(%ebp),%eax
     605:	01 c2                	add    %eax,%edx
     607:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     60b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     60d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     611:	3c 0a                	cmp    $0xa,%al
     613:	74 16                	je     62b <gets+0x5f>
     615:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     619:	3c 0d                	cmp    $0xd,%al
     61b:	74 0e                	je     62b <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     61d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     620:	83 c0 01             	add    $0x1,%eax
     623:	3b 45 0c             	cmp    0xc(%ebp),%eax
     626:	7c b3                	jl     5db <gets+0xf>
     628:	eb 01                	jmp    62b <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     62a:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     62b:	8b 55 f4             	mov    -0xc(%ebp),%edx
     62e:	8b 45 08             	mov    0x8(%ebp),%eax
     631:	01 d0                	add    %edx,%eax
     633:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     636:	8b 45 08             	mov    0x8(%ebp),%eax
}
     639:	c9                   	leave  
     63a:	c3                   	ret    

0000063b <stat>:

int
stat(char *n, struct stat *st)
{
     63b:	55                   	push   %ebp
     63c:	89 e5                	mov    %esp,%ebp
     63e:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     641:	83 ec 08             	sub    $0x8,%esp
     644:	6a 00                	push   $0x0
     646:	ff 75 08             	pushl  0x8(%ebp)
     649:	e8 0c 01 00 00       	call   75a <open>
     64e:	83 c4 10             	add    $0x10,%esp
     651:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     654:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     658:	79 07                	jns    661 <stat+0x26>
    return -1;
     65a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     65f:	eb 25                	jmp    686 <stat+0x4b>
  r = fstat(fd, st);
     661:	83 ec 08             	sub    $0x8,%esp
     664:	ff 75 0c             	pushl  0xc(%ebp)
     667:	ff 75 f4             	pushl  -0xc(%ebp)
     66a:	e8 03 01 00 00       	call   772 <fstat>
     66f:	83 c4 10             	add    $0x10,%esp
     672:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     675:	83 ec 0c             	sub    $0xc,%esp
     678:	ff 75 f4             	pushl  -0xc(%ebp)
     67b:	e8 c2 00 00 00       	call   742 <close>
     680:	83 c4 10             	add    $0x10,%esp
  return r;
     683:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     686:	c9                   	leave  
     687:	c3                   	ret    

00000688 <atoi>:

int
atoi(const char *s)
{
     688:	55                   	push   %ebp
     689:	89 e5                	mov    %esp,%ebp
     68b:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     68e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     695:	eb 25                	jmp    6bc <atoi+0x34>
    n = n*10 + *s++ - '0';
     697:	8b 55 fc             	mov    -0x4(%ebp),%edx
     69a:	89 d0                	mov    %edx,%eax
     69c:	c1 e0 02             	shl    $0x2,%eax
     69f:	01 d0                	add    %edx,%eax
     6a1:	01 c0                	add    %eax,%eax
     6a3:	89 c1                	mov    %eax,%ecx
     6a5:	8b 45 08             	mov    0x8(%ebp),%eax
     6a8:	8d 50 01             	lea    0x1(%eax),%edx
     6ab:	89 55 08             	mov    %edx,0x8(%ebp)
     6ae:	0f b6 00             	movzbl (%eax),%eax
     6b1:	0f be c0             	movsbl %al,%eax
     6b4:	01 c8                	add    %ecx,%eax
     6b6:	83 e8 30             	sub    $0x30,%eax
     6b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     6bc:	8b 45 08             	mov    0x8(%ebp),%eax
     6bf:	0f b6 00             	movzbl (%eax),%eax
     6c2:	3c 2f                	cmp    $0x2f,%al
     6c4:	7e 0a                	jle    6d0 <atoi+0x48>
     6c6:	8b 45 08             	mov    0x8(%ebp),%eax
     6c9:	0f b6 00             	movzbl (%eax),%eax
     6cc:	3c 39                	cmp    $0x39,%al
     6ce:	7e c7                	jle    697 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     6d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     6d3:	c9                   	leave  
     6d4:	c3                   	ret    

000006d5 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     6d5:	55                   	push   %ebp
     6d6:	89 e5                	mov    %esp,%ebp
     6d8:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     6db:	8b 45 08             	mov    0x8(%ebp),%eax
     6de:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     6e1:	8b 45 0c             	mov    0xc(%ebp),%eax
     6e4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     6e7:	eb 17                	jmp    700 <memmove+0x2b>
    *dst++ = *src++;
     6e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
     6ec:	8d 50 01             	lea    0x1(%eax),%edx
     6ef:	89 55 fc             	mov    %edx,-0x4(%ebp)
     6f2:	8b 55 f8             	mov    -0x8(%ebp),%edx
     6f5:	8d 4a 01             	lea    0x1(%edx),%ecx
     6f8:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     6fb:	0f b6 12             	movzbl (%edx),%edx
     6fe:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     700:	8b 45 10             	mov    0x10(%ebp),%eax
     703:	8d 50 ff             	lea    -0x1(%eax),%edx
     706:	89 55 10             	mov    %edx,0x10(%ebp)
     709:	85 c0                	test   %eax,%eax
     70b:	7f dc                	jg     6e9 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     70d:	8b 45 08             	mov    0x8(%ebp),%eax
}
     710:	c9                   	leave  
     711:	c3                   	ret    

00000712 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     712:	b8 01 00 00 00       	mov    $0x1,%eax
     717:	cd 40                	int    $0x40
     719:	c3                   	ret    

0000071a <exit>:
SYSCALL(exit)
     71a:	b8 02 00 00 00       	mov    $0x2,%eax
     71f:	cd 40                	int    $0x40
     721:	c3                   	ret    

00000722 <wait>:
SYSCALL(wait)
     722:	b8 03 00 00 00       	mov    $0x3,%eax
     727:	cd 40                	int    $0x40
     729:	c3                   	ret    

0000072a <pipe>:
SYSCALL(pipe)
     72a:	b8 04 00 00 00       	mov    $0x4,%eax
     72f:	cd 40                	int    $0x40
     731:	c3                   	ret    

00000732 <read>:
SYSCALL(read)
     732:	b8 05 00 00 00       	mov    $0x5,%eax
     737:	cd 40                	int    $0x40
     739:	c3                   	ret    

0000073a <write>:
SYSCALL(write)
     73a:	b8 10 00 00 00       	mov    $0x10,%eax
     73f:	cd 40                	int    $0x40
     741:	c3                   	ret    

00000742 <close>:
SYSCALL(close)
     742:	b8 15 00 00 00       	mov    $0x15,%eax
     747:	cd 40                	int    $0x40
     749:	c3                   	ret    

0000074a <kill>:
SYSCALL(kill)
     74a:	b8 06 00 00 00       	mov    $0x6,%eax
     74f:	cd 40                	int    $0x40
     751:	c3                   	ret    

00000752 <exec>:
SYSCALL(exec)
     752:	b8 07 00 00 00       	mov    $0x7,%eax
     757:	cd 40                	int    $0x40
     759:	c3                   	ret    

0000075a <open>:
SYSCALL(open)
     75a:	b8 0f 00 00 00       	mov    $0xf,%eax
     75f:	cd 40                	int    $0x40
     761:	c3                   	ret    

00000762 <mknod>:
SYSCALL(mknod)
     762:	b8 11 00 00 00       	mov    $0x11,%eax
     767:	cd 40                	int    $0x40
     769:	c3                   	ret    

0000076a <unlink>:
SYSCALL(unlink)
     76a:	b8 12 00 00 00       	mov    $0x12,%eax
     76f:	cd 40                	int    $0x40
     771:	c3                   	ret    

00000772 <fstat>:
SYSCALL(fstat)
     772:	b8 08 00 00 00       	mov    $0x8,%eax
     777:	cd 40                	int    $0x40
     779:	c3                   	ret    

0000077a <link>:
SYSCALL(link)
     77a:	b8 13 00 00 00       	mov    $0x13,%eax
     77f:	cd 40                	int    $0x40
     781:	c3                   	ret    

00000782 <mkdir>:
SYSCALL(mkdir)
     782:	b8 14 00 00 00       	mov    $0x14,%eax
     787:	cd 40                	int    $0x40
     789:	c3                   	ret    

0000078a <chdir>:
SYSCALL(chdir)
     78a:	b8 09 00 00 00       	mov    $0x9,%eax
     78f:	cd 40                	int    $0x40
     791:	c3                   	ret    

00000792 <dup>:
SYSCALL(dup)
     792:	b8 0a 00 00 00       	mov    $0xa,%eax
     797:	cd 40                	int    $0x40
     799:	c3                   	ret    

0000079a <getpid>:
SYSCALL(getpid)
     79a:	b8 0b 00 00 00       	mov    $0xb,%eax
     79f:	cd 40                	int    $0x40
     7a1:	c3                   	ret    

000007a2 <sbrk>:
SYSCALL(sbrk)
     7a2:	b8 0c 00 00 00       	mov    $0xc,%eax
     7a7:	cd 40                	int    $0x40
     7a9:	c3                   	ret    

000007aa <sleep>:
SYSCALL(sleep)
     7aa:	b8 0d 00 00 00       	mov    $0xd,%eax
     7af:	cd 40                	int    $0x40
     7b1:	c3                   	ret    

000007b2 <uptime>:
SYSCALL(uptime)
     7b2:	b8 0e 00 00 00       	mov    $0xe,%eax
     7b7:	cd 40                	int    $0x40
     7b9:	c3                   	ret    

000007ba <colorwrite>:

//new here
SYSCALL(colorwrite)
     7ba:	b8 16 00 00 00       	mov    $0x16,%eax
     7bf:	cd 40                	int    $0x40
     7c1:	c3                   	ret    

000007c2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     7c2:	55                   	push   %ebp
     7c3:	89 e5                	mov    %esp,%ebp
     7c5:	83 ec 18             	sub    $0x18,%esp
     7c8:	8b 45 0c             	mov    0xc(%ebp),%eax
     7cb:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     7ce:	83 ec 04             	sub    $0x4,%esp
     7d1:	6a 01                	push   $0x1
     7d3:	8d 45 f4             	lea    -0xc(%ebp),%eax
     7d6:	50                   	push   %eax
     7d7:	ff 75 08             	pushl  0x8(%ebp)
     7da:	e8 5b ff ff ff       	call   73a <write>
     7df:	83 c4 10             	add    $0x10,%esp
}
     7e2:	90                   	nop
     7e3:	c9                   	leave  
     7e4:	c3                   	ret    

000007e5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     7e5:	55                   	push   %ebp
     7e6:	89 e5                	mov    %esp,%ebp
     7e8:	53                   	push   %ebx
     7e9:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     7ec:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     7f3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     7f7:	74 17                	je     810 <printint+0x2b>
     7f9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     7fd:	79 11                	jns    810 <printint+0x2b>
    neg = 1;
     7ff:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     806:	8b 45 0c             	mov    0xc(%ebp),%eax
     809:	f7 d8                	neg    %eax
     80b:	89 45 ec             	mov    %eax,-0x14(%ebp)
     80e:	eb 06                	jmp    816 <printint+0x31>
  } else {
    x = xx;
     810:	8b 45 0c             	mov    0xc(%ebp),%eax
     813:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     816:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     81d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     820:	8d 41 01             	lea    0x1(%ecx),%eax
     823:	89 45 f4             	mov    %eax,-0xc(%ebp)
     826:	8b 5d 10             	mov    0x10(%ebp),%ebx
     829:	8b 45 ec             	mov    -0x14(%ebp),%eax
     82c:	ba 00 00 00 00       	mov    $0x0,%edx
     831:	f7 f3                	div    %ebx
     833:	89 d0                	mov    %edx,%eax
     835:	0f b6 80 00 47 00 00 	movzbl 0x4700(%eax),%eax
     83c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     840:	8b 5d 10             	mov    0x10(%ebp),%ebx
     843:	8b 45 ec             	mov    -0x14(%ebp),%eax
     846:	ba 00 00 00 00       	mov    $0x0,%edx
     84b:	f7 f3                	div    %ebx
     84d:	89 45 ec             	mov    %eax,-0x14(%ebp)
     850:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     854:	75 c7                	jne    81d <printint+0x38>
  if(neg)
     856:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     85a:	74 2d                	je     889 <printint+0xa4>
    buf[i++] = '-';
     85c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     85f:	8d 50 01             	lea    0x1(%eax),%edx
     862:	89 55 f4             	mov    %edx,-0xc(%ebp)
     865:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     86a:	eb 1d                	jmp    889 <printint+0xa4>
    putc(fd, buf[i]);
     86c:	8d 55 dc             	lea    -0x24(%ebp),%edx
     86f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     872:	01 d0                	add    %edx,%eax
     874:	0f b6 00             	movzbl (%eax),%eax
     877:	0f be c0             	movsbl %al,%eax
     87a:	83 ec 08             	sub    $0x8,%esp
     87d:	50                   	push   %eax
     87e:	ff 75 08             	pushl  0x8(%ebp)
     881:	e8 3c ff ff ff       	call   7c2 <putc>
     886:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     889:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     88d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     891:	79 d9                	jns    86c <printint+0x87>
    putc(fd, buf[i]);
}
     893:	90                   	nop
     894:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     897:	c9                   	leave  
     898:	c3                   	ret    

00000899 <getInteger>:

static int getInteger(double num)
{
     899:	55                   	push   %ebp
     89a:	89 e5                	mov    %esp,%ebp
     89c:	83 ec 18             	sub    $0x18,%esp
     89f:	8b 45 08             	mov    0x8(%ebp),%eax
     8a2:	89 45 e8             	mov    %eax,-0x18(%ebp)
     8a5:	8b 45 0c             	mov    0xc(%ebp),%eax
     8a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     8ab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     8b2:	eb 0e                	jmp    8c2 <getInteger+0x29>
  {
    num -= 1;
     8b4:	dd 45 e8             	fldl   -0x18(%ebp)
     8b7:	d9 e8                	fld1   
     8b9:	de e9                	fsubrp %st,%st(1)
     8bb:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     8be:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     8c2:	dd 45 e8             	fldl   -0x18(%ebp)
     8c5:	d9 e8                	fld1   
     8c7:	d9 c9                	fxch   %st(1)
     8c9:	df e9                	fucomip %st(1),%st
     8cb:	dd d8                	fstp   %st(0)
     8cd:	77 e5                	ja     8b4 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     8cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     8d2:	c9                   	leave  
     8d3:	c3                   	ret    

000008d4 <printdbl>:

void printdbl(int fd, double num)
{
     8d4:	55                   	push   %ebp
     8d5:	89 e5                	mov    %esp,%ebp
     8d7:	83 ec 28             	sub    $0x28,%esp
     8da:	8b 45 0c             	mov    0xc(%ebp),%eax
     8dd:	89 45 e0             	mov    %eax,-0x20(%ebp)
     8e0:	8b 45 10             	mov    0x10(%ebp),%eax
     8e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
     8e6:	d9 ee                	fldz   
     8e8:	dd 45 e0             	fldl   -0x20(%ebp)
     8eb:	d9 c9                	fxch   %st(1)
     8ed:	df e9                	fucomip %st(1),%st
     8ef:	dd d8                	fstp   %st(0)
     8f1:	76 18                	jbe    90b <printdbl+0x37>
  {
    putc(fd,'-');
     8f3:	83 ec 08             	sub    $0x8,%esp
     8f6:	6a 2d                	push   $0x2d
     8f8:	ff 75 08             	pushl  0x8(%ebp)
     8fb:	e8 c2 fe ff ff       	call   7c2 <putc>
     900:	83 c4 10             	add    $0x10,%esp
    num = -num;
     903:	dd 45 e0             	fldl   -0x20(%ebp)
     906:	d9 e0                	fchs   
     908:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
     90b:	83 ec 08             	sub    $0x8,%esp
     90e:	ff 75 e4             	pushl  -0x1c(%ebp)
     911:	ff 75 e0             	pushl  -0x20(%ebp)
     914:	e8 80 ff ff ff       	call   899 <getInteger>
     919:	83 c4 10             	add    $0x10,%esp
     91c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
     91f:	6a 01                	push   $0x1
     921:	6a 0a                	push   $0xa
     923:	ff 75 f0             	pushl  -0x10(%ebp)
     926:	ff 75 08             	pushl  0x8(%ebp)
     929:	e8 b7 fe ff ff       	call   7e5 <printint>
     92e:	83 c4 10             	add    $0x10,%esp
  num -= integer;
     931:	db 45 f0             	fildl  -0x10(%ebp)
     934:	dd 45 e0             	fldl   -0x20(%ebp)
     937:	de e1                	fsubp  %st,%st(1)
     939:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
     93c:	dd 45 e0             	fldl   -0x20(%ebp)
     93f:	dd 05 f0 3a 00 00    	fldl   0x3af0
     945:	d9 c9                	fxch   %st(1)
     947:	df e9                	fucomip %st(1),%st
     949:	dd d8                	fstp   %st(0)
     94b:	76 10                	jbe    95d <printdbl+0x89>
    putc(fd,'.');
     94d:	83 ec 08             	sub    $0x8,%esp
     950:	6a 2e                	push   $0x2e
     952:	ff 75 08             	pushl  0x8(%ebp)
     955:	e8 68 fe ff ff       	call   7c2 <putc>
     95a:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
     95d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
     964:	eb 49                	jmp    9af <printdbl+0xdb>
  {
    num = num*10;
     966:	dd 45 e0             	fldl   -0x20(%ebp)
     969:	dd 05 f8 3a 00 00    	fldl   0x3af8
     96f:	de c9                	fmulp  %st,%st(1)
     971:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
     974:	83 ec 08             	sub    $0x8,%esp
     977:	ff 75 e4             	pushl  -0x1c(%ebp)
     97a:	ff 75 e0             	pushl  -0x20(%ebp)
     97d:	e8 17 ff ff ff       	call   899 <getInteger>
     982:	83 c4 10             	add    $0x10,%esp
     985:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
     988:	6a 01                	push   $0x1
     98a:	6a 0a                	push   $0xa
     98c:	ff 75 f0             	pushl  -0x10(%ebp)
     98f:	ff 75 08             	pushl  0x8(%ebp)
     992:	e8 4e fe ff ff       	call   7e5 <printint>
     997:	83 c4 10             	add    $0x10,%esp
    num -= integer;
     99a:	db 45 f0             	fildl  -0x10(%ebp)
     99d:	dd 45 e0             	fldl   -0x20(%ebp)
     9a0:	de e1                	fsubp  %st,%st(1)
     9a2:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
     9a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
     9a9:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     9ad:	7f 13                	jg     9c2 <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
     9af:	dd 45 e0             	fldl   -0x20(%ebp)
     9b2:	dd 05 f0 3a 00 00    	fldl   0x3af0
     9b8:	d9 c9                	fxch   %st(1)
     9ba:	df e9                	fucomip %st(1),%st
     9bc:	dd d8                	fstp   %st(0)
     9be:	77 a6                	ja     966 <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
     9c0:	eb 01                	jmp    9c3 <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     9c2:	90                   	nop
    }
  }
}
     9c3:	90                   	nop
     9c4:	c9                   	leave  
     9c5:	c3                   	ret    

000009c6 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
     9c6:	55                   	push   %ebp
     9c7:	89 e5                	mov    %esp,%ebp
     9c9:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     9cc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     9d3:	8d 45 0c             	lea    0xc(%ebp),%eax
     9d6:	83 c0 04             	add    $0x4,%eax
     9d9:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     9dc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     9e3:	e9 88 01 00 00       	jmp    b70 <printf+0x1aa>
    c = fmt[i] & 0xff;
     9e8:	8b 55 0c             	mov    0xc(%ebp),%edx
     9eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9ee:	01 d0                	add    %edx,%eax
     9f0:	0f b6 00             	movzbl (%eax),%eax
     9f3:	0f be c0             	movsbl %al,%eax
     9f6:	25 ff 00 00 00       	and    $0xff,%eax
     9fb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     9fe:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     a02:	75 2c                	jne    a30 <printf+0x6a>
      if(c == '%'){
     a04:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     a08:	75 0c                	jne    a16 <printf+0x50>
        state = '%';
     a0a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     a11:	e9 56 01 00 00       	jmp    b6c <printf+0x1a6>
      } else {
        putc(fd, c);
     a16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a19:	0f be c0             	movsbl %al,%eax
     a1c:	83 ec 08             	sub    $0x8,%esp
     a1f:	50                   	push   %eax
     a20:	ff 75 08             	pushl  0x8(%ebp)
     a23:	e8 9a fd ff ff       	call   7c2 <putc>
     a28:	83 c4 10             	add    $0x10,%esp
     a2b:	e9 3c 01 00 00       	jmp    b6c <printf+0x1a6>
      }
    } else if(state == '%'){
     a30:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     a34:	0f 85 32 01 00 00    	jne    b6c <printf+0x1a6>
      if(c == 'd'){
     a3a:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     a3e:	75 1e                	jne    a5e <printf+0x98>
        printint(fd, *ap, 10, 1);
     a40:	8b 45 e8             	mov    -0x18(%ebp),%eax
     a43:	8b 00                	mov    (%eax),%eax
     a45:	6a 01                	push   $0x1
     a47:	6a 0a                	push   $0xa
     a49:	50                   	push   %eax
     a4a:	ff 75 08             	pushl  0x8(%ebp)
     a4d:	e8 93 fd ff ff       	call   7e5 <printint>
     a52:	83 c4 10             	add    $0x10,%esp
        ap++;
     a55:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     a59:	e9 07 01 00 00       	jmp    b65 <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
     a5e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     a62:	74 06                	je     a6a <printf+0xa4>
     a64:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     a68:	75 1e                	jne    a88 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     a6a:	8b 45 e8             	mov    -0x18(%ebp),%eax
     a6d:	8b 00                	mov    (%eax),%eax
     a6f:	6a 00                	push   $0x0
     a71:	6a 10                	push   $0x10
     a73:	50                   	push   %eax
     a74:	ff 75 08             	pushl  0x8(%ebp)
     a77:	e8 69 fd ff ff       	call   7e5 <printint>
     a7c:	83 c4 10             	add    $0x10,%esp
        ap++;
     a7f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     a83:	e9 dd 00 00 00       	jmp    b65 <printf+0x19f>
      } else if(c == 's'){
     a88:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     a8c:	75 46                	jne    ad4 <printf+0x10e>
        s = (char*)*ap;
     a8e:	8b 45 e8             	mov    -0x18(%ebp),%eax
     a91:	8b 00                	mov    (%eax),%eax
     a93:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     a96:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     a9a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     a9e:	75 25                	jne    ac5 <printf+0xff>
          s = "(null)";
     aa0:	c7 45 f4 e8 3a 00 00 	movl   $0x3ae8,-0xc(%ebp)
        while(*s != 0){
     aa7:	eb 1c                	jmp    ac5 <printf+0xff>
          putc(fd, *s);
     aa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aac:	0f b6 00             	movzbl (%eax),%eax
     aaf:	0f be c0             	movsbl %al,%eax
     ab2:	83 ec 08             	sub    $0x8,%esp
     ab5:	50                   	push   %eax
     ab6:	ff 75 08             	pushl  0x8(%ebp)
     ab9:	e8 04 fd ff ff       	call   7c2 <putc>
     abe:	83 c4 10             	add    $0x10,%esp
          s++;
     ac1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     ac5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ac8:	0f b6 00             	movzbl (%eax),%eax
     acb:	84 c0                	test   %al,%al
     acd:	75 da                	jne    aa9 <printf+0xe3>
     acf:	e9 91 00 00 00       	jmp    b65 <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     ad4:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     ad8:	75 1d                	jne    af7 <printf+0x131>
        putc(fd, *ap);
     ada:	8b 45 e8             	mov    -0x18(%ebp),%eax
     add:	8b 00                	mov    (%eax),%eax
     adf:	0f be c0             	movsbl %al,%eax
     ae2:	83 ec 08             	sub    $0x8,%esp
     ae5:	50                   	push   %eax
     ae6:	ff 75 08             	pushl  0x8(%ebp)
     ae9:	e8 d4 fc ff ff       	call   7c2 <putc>
     aee:	83 c4 10             	add    $0x10,%esp
        ap++;
     af1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     af5:	eb 6e                	jmp    b65 <printf+0x19f>
      } else if(c == '%'){
     af7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     afb:	75 17                	jne    b14 <printf+0x14e>
        putc(fd, c);
     afd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     b00:	0f be c0             	movsbl %al,%eax
     b03:	83 ec 08             	sub    $0x8,%esp
     b06:	50                   	push   %eax
     b07:	ff 75 08             	pushl  0x8(%ebp)
     b0a:	e8 b3 fc ff ff       	call   7c2 <putc>
     b0f:	83 c4 10             	add    $0x10,%esp
     b12:	eb 51                	jmp    b65 <printf+0x19f>
      } else if(c == 'f'){ //for double
     b14:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
     b18:	75 26                	jne    b40 <printf+0x17a>
        double *dap = (double*)ap;
     b1a:	8b 45 e8             	mov    -0x18(%ebp),%eax
     b1d:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
     b20:	8b 45 e0             	mov    -0x20(%ebp),%eax
     b23:	dd 00                	fldl   (%eax)
     b25:	83 ec 04             	sub    $0x4,%esp
     b28:	8d 64 24 f8          	lea    -0x8(%esp),%esp
     b2c:	dd 1c 24             	fstpl  (%esp)
     b2f:	ff 75 08             	pushl  0x8(%ebp)
     b32:	e8 9d fd ff ff       	call   8d4 <printdbl>
     b37:	83 c4 10             	add    $0x10,%esp
        ap += 2;
     b3a:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
     b3e:	eb 25                	jmp    b65 <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     b40:	83 ec 08             	sub    $0x8,%esp
     b43:	6a 25                	push   $0x25
     b45:	ff 75 08             	pushl  0x8(%ebp)
     b48:	e8 75 fc ff ff       	call   7c2 <putc>
     b4d:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     b50:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     b53:	0f be c0             	movsbl %al,%eax
     b56:	83 ec 08             	sub    $0x8,%esp
     b59:	50                   	push   %eax
     b5a:	ff 75 08             	pushl  0x8(%ebp)
     b5d:	e8 60 fc ff ff       	call   7c2 <putc>
     b62:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     b65:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     b6c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     b70:	8b 55 0c             	mov    0xc(%ebp),%edx
     b73:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b76:	01 d0                	add    %edx,%eax
     b78:	0f b6 00             	movzbl (%eax),%eax
     b7b:	84 c0                	test   %al,%al
     b7d:	0f 85 65 fe ff ff    	jne    9e8 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     b83:	90                   	nop
     b84:	c9                   	leave  
     b85:	c3                   	ret    

00000b86 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     b86:	55                   	push   %ebp
     b87:	89 e5                	mov    %esp,%ebp
     b89:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     b8c:	8b 45 08             	mov    0x8(%ebp),%eax
     b8f:	83 e8 08             	sub    $0x8,%eax
     b92:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b95:	a1 48 48 00 00       	mov    0x4848,%eax
     b9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
     b9d:	eb 24                	jmp    bc3 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     b9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ba2:	8b 00                	mov    (%eax),%eax
     ba4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     ba7:	77 12                	ja     bbb <free+0x35>
     ba9:	8b 45 f8             	mov    -0x8(%ebp),%eax
     bac:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     baf:	77 24                	ja     bd5 <free+0x4f>
     bb1:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bb4:	8b 00                	mov    (%eax),%eax
     bb6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     bb9:	77 1a                	ja     bd5 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     bbb:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bbe:	8b 00                	mov    (%eax),%eax
     bc0:	89 45 fc             	mov    %eax,-0x4(%ebp)
     bc3:	8b 45 f8             	mov    -0x8(%ebp),%eax
     bc6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     bc9:	76 d4                	jbe    b9f <free+0x19>
     bcb:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bce:	8b 00                	mov    (%eax),%eax
     bd0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     bd3:	76 ca                	jbe    b9f <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     bd5:	8b 45 f8             	mov    -0x8(%ebp),%eax
     bd8:	8b 40 04             	mov    0x4(%eax),%eax
     bdb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     be2:	8b 45 f8             	mov    -0x8(%ebp),%eax
     be5:	01 c2                	add    %eax,%edx
     be7:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bea:	8b 00                	mov    (%eax),%eax
     bec:	39 c2                	cmp    %eax,%edx
     bee:	75 24                	jne    c14 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     bf0:	8b 45 f8             	mov    -0x8(%ebp),%eax
     bf3:	8b 50 04             	mov    0x4(%eax),%edx
     bf6:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bf9:	8b 00                	mov    (%eax),%eax
     bfb:	8b 40 04             	mov    0x4(%eax),%eax
     bfe:	01 c2                	add    %eax,%edx
     c00:	8b 45 f8             	mov    -0x8(%ebp),%eax
     c03:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     c06:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c09:	8b 00                	mov    (%eax),%eax
     c0b:	8b 10                	mov    (%eax),%edx
     c0d:	8b 45 f8             	mov    -0x8(%ebp),%eax
     c10:	89 10                	mov    %edx,(%eax)
     c12:	eb 0a                	jmp    c1e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     c14:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c17:	8b 10                	mov    (%eax),%edx
     c19:	8b 45 f8             	mov    -0x8(%ebp),%eax
     c1c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     c1e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c21:	8b 40 04             	mov    0x4(%eax),%eax
     c24:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     c2b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c2e:	01 d0                	add    %edx,%eax
     c30:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     c33:	75 20                	jne    c55 <free+0xcf>
    p->s.size += bp->s.size;
     c35:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c38:	8b 50 04             	mov    0x4(%eax),%edx
     c3b:	8b 45 f8             	mov    -0x8(%ebp),%eax
     c3e:	8b 40 04             	mov    0x4(%eax),%eax
     c41:	01 c2                	add    %eax,%edx
     c43:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c46:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     c49:	8b 45 f8             	mov    -0x8(%ebp),%eax
     c4c:	8b 10                	mov    (%eax),%edx
     c4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c51:	89 10                	mov    %edx,(%eax)
     c53:	eb 08                	jmp    c5d <free+0xd7>
  } else
    p->s.ptr = bp;
     c55:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c58:	8b 55 f8             	mov    -0x8(%ebp),%edx
     c5b:	89 10                	mov    %edx,(%eax)
  freep = p;
     c5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c60:	a3 48 48 00 00       	mov    %eax,0x4848
}
     c65:	90                   	nop
     c66:	c9                   	leave  
     c67:	c3                   	ret    

00000c68 <morecore>:

static Header*
morecore(uint nu)
{
     c68:	55                   	push   %ebp
     c69:	89 e5                	mov    %esp,%ebp
     c6b:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     c6e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     c75:	77 07                	ja     c7e <morecore+0x16>
    nu = 4096;
     c77:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     c7e:	8b 45 08             	mov    0x8(%ebp),%eax
     c81:	c1 e0 03             	shl    $0x3,%eax
     c84:	83 ec 0c             	sub    $0xc,%esp
     c87:	50                   	push   %eax
     c88:	e8 15 fb ff ff       	call   7a2 <sbrk>
     c8d:	83 c4 10             	add    $0x10,%esp
     c90:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     c93:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     c97:	75 07                	jne    ca0 <morecore+0x38>
    return 0;
     c99:	b8 00 00 00 00       	mov    $0x0,%eax
     c9e:	eb 26                	jmp    cc6 <morecore+0x5e>
  hp = (Header*)p;
     ca0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ca3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     ca6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ca9:	8b 55 08             	mov    0x8(%ebp),%edx
     cac:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     caf:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cb2:	83 c0 08             	add    $0x8,%eax
     cb5:	83 ec 0c             	sub    $0xc,%esp
     cb8:	50                   	push   %eax
     cb9:	e8 c8 fe ff ff       	call   b86 <free>
     cbe:	83 c4 10             	add    $0x10,%esp
  return freep;
     cc1:	a1 48 48 00 00       	mov    0x4848,%eax
}
     cc6:	c9                   	leave  
     cc7:	c3                   	ret    

00000cc8 <malloc>:

void*
malloc(uint nbytes)
{
     cc8:	55                   	push   %ebp
     cc9:	89 e5                	mov    %esp,%ebp
     ccb:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     cce:	8b 45 08             	mov    0x8(%ebp),%eax
     cd1:	83 c0 07             	add    $0x7,%eax
     cd4:	c1 e8 03             	shr    $0x3,%eax
     cd7:	83 c0 01             	add    $0x1,%eax
     cda:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     cdd:	a1 48 48 00 00       	mov    0x4848,%eax
     ce2:	89 45 f0             	mov    %eax,-0x10(%ebp)
     ce5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     ce9:	75 23                	jne    d0e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     ceb:	c7 45 f0 40 48 00 00 	movl   $0x4840,-0x10(%ebp)
     cf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cf5:	a3 48 48 00 00       	mov    %eax,0x4848
     cfa:	a1 48 48 00 00       	mov    0x4848,%eax
     cff:	a3 40 48 00 00       	mov    %eax,0x4840
    base.s.size = 0;
     d04:	c7 05 44 48 00 00 00 	movl   $0x0,0x4844
     d0b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d11:	8b 00                	mov    (%eax),%eax
     d13:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     d16:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d19:	8b 40 04             	mov    0x4(%eax),%eax
     d1c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     d1f:	72 4d                	jb     d6e <malloc+0xa6>
      if(p->s.size == nunits)
     d21:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d24:	8b 40 04             	mov    0x4(%eax),%eax
     d27:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     d2a:	75 0c                	jne    d38 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d2f:	8b 10                	mov    (%eax),%edx
     d31:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d34:	89 10                	mov    %edx,(%eax)
     d36:	eb 26                	jmp    d5e <malloc+0x96>
      else {
        p->s.size -= nunits;
     d38:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d3b:	8b 40 04             	mov    0x4(%eax),%eax
     d3e:	2b 45 ec             	sub    -0x14(%ebp),%eax
     d41:	89 c2                	mov    %eax,%edx
     d43:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d46:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     d49:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d4c:	8b 40 04             	mov    0x4(%eax),%eax
     d4f:	c1 e0 03             	shl    $0x3,%eax
     d52:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     d55:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d58:	8b 55 ec             	mov    -0x14(%ebp),%edx
     d5b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     d5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d61:	a3 48 48 00 00       	mov    %eax,0x4848
      return (void*)(p + 1);
     d66:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d69:	83 c0 08             	add    $0x8,%eax
     d6c:	eb 3b                	jmp    da9 <malloc+0xe1>
    }
    if(p == freep)
     d6e:	a1 48 48 00 00       	mov    0x4848,%eax
     d73:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     d76:	75 1e                	jne    d96 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
     d78:	83 ec 0c             	sub    $0xc,%esp
     d7b:	ff 75 ec             	pushl  -0x14(%ebp)
     d7e:	e8 e5 fe ff ff       	call   c68 <morecore>
     d83:	83 c4 10             	add    $0x10,%esp
     d86:	89 45 f4             	mov    %eax,-0xc(%ebp)
     d89:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d8d:	75 07                	jne    d96 <malloc+0xce>
        return 0;
     d8f:	b8 00 00 00 00       	mov    $0x0,%eax
     d94:	eb 13                	jmp    da9 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d96:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d99:	89 45 f0             	mov    %eax,-0x10(%ebp)
     d9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d9f:	8b 00                	mov    (%eax),%eax
     da1:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     da4:	e9 6d ff ff ff       	jmp    d16 <malloc+0x4e>
}
     da9:	c9                   	leave  
     daa:	c3                   	ret    

00000dab <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
     dab:	55                   	push   %ebp
     dac:	89 e5                	mov    %esp,%ebp
     dae:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     db1:	83 ec 04             	sub    $0x4,%esp
     db4:	ff 75 08             	pushl  0x8(%ebp)
     db7:	68 00 3b 00 00       	push   $0x3b00
     dbc:	6a 02                	push   $0x2
     dbe:	e8 03 fc ff ff       	call   9c6 <printf>
     dc3:	83 c4 10             	add    $0x10,%esp
  exit();
     dc6:	e8 4f f9 ff ff       	call   71a <exit>

00000dcb <getInteger>:
}

static int getInteger(double num)
{
     dcb:	55                   	push   %ebp
     dcc:	89 e5                	mov    %esp,%ebp
     dce:	83 ec 18             	sub    $0x18,%esp
     dd1:	8b 45 08             	mov    0x8(%ebp),%eax
     dd4:	89 45 e8             	mov    %eax,-0x18(%ebp)
     dd7:	8b 45 0c             	mov    0xc(%ebp),%eax
     dda:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
     ddd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
     de4:	eb 0e                	jmp    df4 <getInteger+0x29>
  {
    num -= 1;
     de6:	dd 45 e8             	fldl   -0x18(%ebp)
     de9:	d9 e8                	fld1   
     deb:	de e9                	fsubrp %st,%st(1)
     ded:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
     df0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
     df4:	dd 45 e8             	fldl   -0x18(%ebp)
     df7:	d9 e8                	fld1   
     df9:	d9 c9                	fxch   %st(1)
     dfb:	df e9                	fucomip %st(1),%st
     dfd:	dd d8                	fstp   %st(0)
     dff:	77 e5                	ja     de6 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
     e01:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     e04:	c9                   	leave  
     e05:	c3                   	ret    

00000e06 <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
     e06:	55                   	push   %ebp
     e07:	89 e5                	mov    %esp,%ebp
     e09:	53                   	push   %ebx
     e0a:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     e0d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
     e14:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     e18:	74 17                	je     e31 <int2str+0x2b>
     e1a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     e1e:	79 11                	jns    e31 <int2str+0x2b>
    neg = 1;
     e20:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
     e27:	8b 45 0c             	mov    0xc(%ebp),%eax
     e2a:	f7 d8                	neg    %eax
     e2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
     e2f:	eb 06                	jmp    e37 <int2str+0x31>
  } else {
    x = num;
     e31:	8b 45 0c             	mov    0xc(%ebp),%eax
     e34:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
     e37:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
     e3e:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     e41:	8d 41 01             	lea    0x1(%ecx),%eax
     e44:	89 45 f8             	mov    %eax,-0x8(%ebp)
     e47:	8b 5d 14             	mov    0x14(%ebp),%ebx
     e4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e4d:	ba 00 00 00 00       	mov    $0x0,%edx
     e52:	f7 f3                	div    %ebx
     e54:	89 d0                	mov    %edx,%eax
     e56:	0f b6 80 14 47 00 00 	movzbl 0x4714(%eax),%eax
     e5d:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
     e61:	8b 5d 14             	mov    0x14(%ebp),%ebx
     e64:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e67:	ba 00 00 00 00       	mov    $0x0,%edx
     e6c:	f7 f3                	div    %ebx
     e6e:	89 45 f0             	mov    %eax,-0x10(%ebp)
     e71:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     e75:	75 c7                	jne    e3e <int2str+0x38>
  if(neg)
     e77:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e7b:	74 36                	je     eb3 <int2str+0xad>
    buf[i++] = '-';
     e7d:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e80:	8d 50 01             	lea    0x1(%eax),%edx
     e83:	89 55 f8             	mov    %edx,-0x8(%ebp)
     e86:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
     e8b:	eb 26                	jmp    eb3 <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
     e8d:	8b 45 10             	mov    0x10(%ebp),%eax
     e90:	8b 00                	mov    (%eax),%eax
     e92:	89 c2                	mov    %eax,%edx
     e94:	8b 45 08             	mov    0x8(%ebp),%eax
     e97:	01 c2                	add    %eax,%edx
     e99:	8d 4d e0             	lea    -0x20(%ebp),%ecx
     e9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e9f:	01 c8                	add    %ecx,%eax
     ea1:	0f b6 00             	movzbl (%eax),%eax
     ea4:	88 02                	mov    %al,(%edx)
    (*pos)++;
     ea6:	8b 45 10             	mov    0x10(%ebp),%eax
     ea9:	8b 00                	mov    (%eax),%eax
     eab:	8d 50 01             	lea    0x1(%eax),%edx
     eae:	8b 45 10             	mov    0x10(%ebp),%eax
     eb1:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     eb3:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
     eb7:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
     ebb:	79 d0                	jns    e8d <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
     ebd:	90                   	nop
     ebe:	83 c4 20             	add    $0x20,%esp
     ec1:	5b                   	pop    %ebx
     ec2:	5d                   	pop    %ebp
     ec3:	c3                   	ret    

00000ec4 <double2str>:

void double2str(char *buf, double num, int *pos)
{
     ec4:	55                   	push   %ebp
     ec5:	89 e5                	mov    %esp,%ebp
     ec7:	83 ec 18             	sub    $0x18,%esp
     eca:	8b 45 0c             	mov    0xc(%ebp),%eax
     ecd:	89 45 e8             	mov    %eax,-0x18(%ebp)
     ed0:	8b 45 10             	mov    0x10(%ebp),%eax
     ed3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
     ed6:	d9 ee                	fldz   
     ed8:	dd 45 e8             	fldl   -0x18(%ebp)
     edb:	d9 c9                	fxch   %st(1)
     edd:	df e9                	fucomip %st(1),%st
     edf:	dd d8                	fstp   %st(0)
     ee1:	76 24                	jbe    f07 <double2str+0x43>
  {
    buf[*pos] = '-';
     ee3:	8b 45 14             	mov    0x14(%ebp),%eax
     ee6:	8b 00                	mov    (%eax),%eax
     ee8:	89 c2                	mov    %eax,%edx
     eea:	8b 45 08             	mov    0x8(%ebp),%eax
     eed:	01 d0                	add    %edx,%eax
     eef:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
     ef2:	8b 45 14             	mov    0x14(%ebp),%eax
     ef5:	8b 00                	mov    (%eax),%eax
     ef7:	8d 50 01             	lea    0x1(%eax),%edx
     efa:	8b 45 14             	mov    0x14(%ebp),%eax
     efd:	89 10                	mov    %edx,(%eax)
    num = -num;
     eff:	dd 45 e8             	fldl   -0x18(%ebp)
     f02:	d9 e0                	fchs   
     f04:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
     f07:	ff 75 ec             	pushl  -0x14(%ebp)
     f0a:	ff 75 e8             	pushl  -0x18(%ebp)
     f0d:	e8 b9 fe ff ff       	call   dcb <getInteger>
     f12:	83 c4 08             	add    $0x8,%esp
     f15:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
     f18:	83 ec 04             	sub    $0x4,%esp
     f1b:	6a 01                	push   $0x1
     f1d:	6a 0a                	push   $0xa
     f1f:	ff 75 14             	pushl  0x14(%ebp)
     f22:	ff 75 f8             	pushl  -0x8(%ebp)
     f25:	ff 75 08             	pushl  0x8(%ebp)
     f28:	e8 d9 fe ff ff       	call   e06 <int2str>
     f2d:	83 c4 18             	add    $0x18,%esp
  num -= integer;
     f30:	db 45 f8             	fildl  -0x8(%ebp)
     f33:	dd 45 e8             	fldl   -0x18(%ebp)
     f36:	de e1                	fsubp  %st,%st(1)
     f38:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
     f3b:	dd 45 e8             	fldl   -0x18(%ebp)
     f3e:	dd 05 08 3b 00 00    	fldl   0x3b08
     f44:	d9 c9                	fxch   %st(1)
     f46:	df e9                	fucomip %st(1),%st
     f48:	dd d8                	fstp   %st(0)
     f4a:	76 1c                	jbe    f68 <double2str+0xa4>
  {
    buf[*pos] = '.';
     f4c:	8b 45 14             	mov    0x14(%ebp),%eax
     f4f:	8b 00                	mov    (%eax),%eax
     f51:	89 c2                	mov    %eax,%edx
     f53:	8b 45 08             	mov    0x8(%ebp),%eax
     f56:	01 d0                	add    %edx,%eax
     f58:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
     f5b:	8b 45 14             	mov    0x14(%ebp),%eax
     f5e:	8b 00                	mov    (%eax),%eax
     f60:	8d 50 01             	lea    0x1(%eax),%edx
     f63:	8b 45 14             	mov    0x14(%ebp),%eax
     f66:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
     f68:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
     f6f:	eb 4c                	jmp    fbd <double2str+0xf9>
  {
    num = num*10;
     f71:	dd 45 e8             	fldl   -0x18(%ebp)
     f74:	dd 05 10 3b 00 00    	fldl   0x3b10
     f7a:	de c9                	fmulp  %st,%st(1)
     f7c:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
     f7f:	ff 75 ec             	pushl  -0x14(%ebp)
     f82:	ff 75 e8             	pushl  -0x18(%ebp)
     f85:	e8 41 fe ff ff       	call   dcb <getInteger>
     f8a:	83 c4 08             	add    $0x8,%esp
     f8d:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
     f90:	83 ec 04             	sub    $0x4,%esp
     f93:	6a 01                	push   $0x1
     f95:	6a 0a                	push   $0xa
     f97:	ff 75 14             	pushl  0x14(%ebp)
     f9a:	ff 75 f8             	pushl  -0x8(%ebp)
     f9d:	ff 75 08             	pushl  0x8(%ebp)
     fa0:	e8 61 fe ff ff       	call   e06 <int2str>
     fa5:	83 c4 18             	add    $0x18,%esp
    num -= integer;
     fa8:	db 45 f8             	fildl  -0x8(%ebp)
     fab:	dd 45 e8             	fldl   -0x18(%ebp)
     fae:	de e1                	fsubp  %st,%st(1)
     fb0:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
     fb3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
     fb7:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
     fbb:	7f 13                	jg     fd0 <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
     fbd:	dd 45 e8             	fldl   -0x18(%ebp)
     fc0:	dd 05 08 3b 00 00    	fldl   0x3b08
     fc6:	d9 c9                	fxch   %st(1)
     fc8:	df e9                	fucomip %st(1),%st
     fca:	dd d8                	fstp   %st(0)
     fcc:	77 a3                	ja     f71 <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
     fce:	eb 01                	jmp    fd1 <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
     fd0:	90                   	nop
    }
  }
}
     fd1:	90                   	nop
     fd2:	c9                   	leave  
     fd3:	c3                   	ret    

00000fd4 <pow>:

double pow(double opnd, int power)
{
     fd4:	55                   	push   %ebp
     fd5:	89 e5                	mov    %esp,%ebp
     fd7:	83 ec 18             	sub    $0x18,%esp
     fda:	8b 45 08             	mov    0x8(%ebp),%eax
     fdd:	89 45 e8             	mov    %eax,-0x18(%ebp)
     fe0:	8b 45 0c             	mov    0xc(%ebp),%eax
     fe3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
     fe6:	d9 e8                	fld1   
     fe8:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
     feb:	eb 0d                	jmp    ffa <pow+0x26>
  {
    result *= opnd;
     fed:	dd 45 f8             	fldl   -0x8(%ebp)
     ff0:	dc 4d e8             	fmull  -0x18(%ebp)
     ff3:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
     ff6:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
     ffa:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     ffe:	7f ed                	jg     fed <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
    1000:	dd 45 f8             	fldl   -0x8(%ebp)
}
    1003:	c9                   	leave  
    1004:	c3                   	ret    

00001005 <Translation>:

double Translation(char *s, int* pos)
{
    1005:	55                   	push   %ebp
    1006:	89 e5                	mov    %esp,%ebp
    1008:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
    100b:	d9 ee                	fldz   
    100d:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
    1010:	d9 ee                	fldz   
    1012:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
    1015:	eb 3e                	jmp    1055 <Translation+0x50>
    {
        integer *= 10;
    1017:	dd 45 f8             	fldl   -0x8(%ebp)
    101a:	dd 05 10 3b 00 00    	fldl   0x3b10
    1020:	de c9                	fmulp  %st,%st(1)
    1022:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
    1025:	8b 45 0c             	mov    0xc(%ebp),%eax
    1028:	8b 00                	mov    (%eax),%eax
    102a:	89 c2                	mov    %eax,%edx
    102c:	8b 45 08             	mov    0x8(%ebp),%eax
    102f:	01 d0                	add    %edx,%eax
    1031:	0f b6 00             	movzbl (%eax),%eax
    1034:	0f be c0             	movsbl %al,%eax
    1037:	83 e8 30             	sub    $0x30,%eax
    103a:	89 45 dc             	mov    %eax,-0x24(%ebp)
    103d:	db 45 dc             	fildl  -0x24(%ebp)
    1040:	dd 45 f8             	fldl   -0x8(%ebp)
    1043:	de c1                	faddp  %st,%st(1)
    1045:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
    1048:	8b 45 0c             	mov    0xc(%ebp),%eax
    104b:	8b 00                	mov    (%eax),%eax
    104d:	8d 50 01             	lea    0x1(%eax),%edx
    1050:	8b 45 0c             	mov    0xc(%ebp),%eax
    1053:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
    1055:	8b 45 0c             	mov    0xc(%ebp),%eax
    1058:	8b 00                	mov    (%eax),%eax
    105a:	89 c2                	mov    %eax,%edx
    105c:	8b 45 08             	mov    0x8(%ebp),%eax
    105f:	01 d0                	add    %edx,%eax
    1061:	0f b6 00             	movzbl (%eax),%eax
    1064:	3c 2f                	cmp    $0x2f,%al
    1066:	7e 13                	jle    107b <Translation+0x76>
    1068:	8b 45 0c             	mov    0xc(%ebp),%eax
    106b:	8b 00                	mov    (%eax),%eax
    106d:	89 c2                	mov    %eax,%edx
    106f:	8b 45 08             	mov    0x8(%ebp),%eax
    1072:	01 d0                	add    %edx,%eax
    1074:	0f b6 00             	movzbl (%eax),%eax
    1077:	3c 39                	cmp    $0x39,%al
    1079:	7e 9c                	jle    1017 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
    107b:	8b 45 0c             	mov    0xc(%ebp),%eax
    107e:	8b 00                	mov    (%eax),%eax
    1080:	89 c2                	mov    %eax,%edx
    1082:	8b 45 08             	mov    0x8(%ebp),%eax
    1085:	01 d0                	add    %edx,%eax
    1087:	0f b6 00             	movzbl (%eax),%eax
    108a:	3c 2e                	cmp    $0x2e,%al
    108c:	0f 85 9b 00 00 00    	jne    112d <Translation+0x128>
    {
        (*pos)++;
    1092:	8b 45 0c             	mov    0xc(%ebp),%eax
    1095:	8b 00                	mov    (%eax),%eax
    1097:	8d 50 01             	lea    0x1(%eax),%edx
    109a:	8b 45 0c             	mov    0xc(%ebp),%eax
    109d:	89 10                	mov    %edx,(%eax)
        int c = 1;
    109f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
    10a6:	eb 5b                	jmp    1103 <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
    10a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ab:	8b 00                	mov    (%eax),%eax
    10ad:	89 c2                	mov    %eax,%edx
    10af:	8b 45 08             	mov    0x8(%ebp),%eax
    10b2:	01 d0                	add    %edx,%eax
    10b4:	0f b6 00             	movzbl (%eax),%eax
    10b7:	0f be c0             	movsbl %al,%eax
    10ba:	83 e8 30             	sub    $0x30,%eax
    10bd:	89 45 dc             	mov    %eax,-0x24(%ebp)
    10c0:	db 45 dc             	fildl  -0x24(%ebp)
    10c3:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
    10c6:	83 ec 04             	sub    $0x4,%esp
    10c9:	ff 75 ec             	pushl  -0x14(%ebp)
    10cc:	dd 05 18 3b 00 00    	fldl   0x3b18
    10d2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    10d6:	dd 1c 24             	fstpl  (%esp)
    10d9:	e8 f6 fe ff ff       	call   fd4 <pow>
    10de:	83 c4 10             	add    $0x10,%esp
    10e1:	dd 45 e0             	fldl   -0x20(%ebp)
    10e4:	de c9                	fmulp  %st,%st(1)
    10e6:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
    10e9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
    10ed:	dd 45 f0             	fldl   -0x10(%ebp)
    10f0:	dc 45 e0             	faddl  -0x20(%ebp)
    10f3:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
    10f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    10f9:	8b 00                	mov    (%eax),%eax
    10fb:	8d 50 01             	lea    0x1(%eax),%edx
    10fe:	8b 45 0c             	mov    0xc(%ebp),%eax
    1101:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
    1103:	8b 45 0c             	mov    0xc(%ebp),%eax
    1106:	8b 00                	mov    (%eax),%eax
    1108:	89 c2                	mov    %eax,%edx
    110a:	8b 45 08             	mov    0x8(%ebp),%eax
    110d:	01 d0                	add    %edx,%eax
    110f:	0f b6 00             	movzbl (%eax),%eax
    1112:	3c 2f                	cmp    $0x2f,%al
    1114:	7e 17                	jle    112d <Translation+0x128>
    1116:	8b 45 0c             	mov    0xc(%ebp),%eax
    1119:	8b 00                	mov    (%eax),%eax
    111b:	89 c2                	mov    %eax,%edx
    111d:	8b 45 08             	mov    0x8(%ebp),%eax
    1120:	01 d0                	add    %edx,%eax
    1122:	0f b6 00             	movzbl (%eax),%eax
    1125:	3c 39                	cmp    $0x39,%al
    1127:	0f 8e 7b ff ff ff    	jle    10a8 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
    112d:	dd 45 f8             	fldl   -0x8(%ebp)
    1130:	dc 45 f0             	faddl  -0x10(%ebp)
    1133:	c9                   	leave  
    1134:	c3                   	ret    

00001135 <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
    1135:	55                   	push   %ebp
    1136:	89 e5                	mov    %esp,%ebp
    1138:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
    113b:	e8 d2 f5 ff ff       	call   712 <fork>
    1140:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
    1143:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1146:	c9                   	leave  
    1147:	c3                   	ret    

00001148 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
    1148:	55                   	push   %ebp
    1149:	89 e5                	mov    %esp,%ebp
    114b:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    114e:	83 ec 0c             	sub    $0xc,%esp
    1151:	6a 54                	push   $0x54
    1153:	e8 70 fb ff ff       	call   cc8 <malloc>
    1158:	83 c4 10             	add    $0x10,%esp
    115b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    115e:	83 ec 04             	sub    $0x4,%esp
    1161:	6a 54                	push   $0x54
    1163:	6a 00                	push   $0x0
    1165:	ff 75 f4             	pushl  -0xc(%ebp)
    1168:	e8 12 f4 ff ff       	call   57f <memset>
    116d:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
    1170:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1173:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
    1179:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    117c:	c9                   	leave  
    117d:	c3                   	ret    

0000117e <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    117e:	55                   	push   %ebp
    117f:	89 e5                	mov    %esp,%ebp
    1181:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1184:	83 ec 0c             	sub    $0xc,%esp
    1187:	6a 18                	push   $0x18
    1189:	e8 3a fb ff ff       	call   cc8 <malloc>
    118e:	83 c4 10             	add    $0x10,%esp
    1191:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1194:	83 ec 04             	sub    $0x4,%esp
    1197:	6a 18                	push   $0x18
    1199:	6a 00                	push   $0x0
    119b:	ff 75 f4             	pushl  -0xc(%ebp)
    119e:	e8 dc f3 ff ff       	call   57f <memset>
    11a3:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
    11a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11a9:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
    11af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11b2:	8b 55 08             	mov    0x8(%ebp),%edx
    11b5:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
    11b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11bb:	8b 55 0c             	mov    0xc(%ebp),%edx
    11be:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
    11c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11c4:	8b 55 10             	mov    0x10(%ebp),%edx
    11c7:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
    11ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11cd:	8b 55 14             	mov    0x14(%ebp),%edx
    11d0:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
    11d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11d6:	8b 55 18             	mov    0x18(%ebp),%edx
    11d9:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
    11dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    11df:	c9                   	leave  
    11e0:	c3                   	ret    

000011e1 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
    11e1:	55                   	push   %ebp
    11e2:	89 e5                	mov    %esp,%ebp
    11e4:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    11e7:	83 ec 0c             	sub    $0xc,%esp
    11ea:	6a 0c                	push   $0xc
    11ec:	e8 d7 fa ff ff       	call   cc8 <malloc>
    11f1:	83 c4 10             	add    $0x10,%esp
    11f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    11f7:	83 ec 04             	sub    $0x4,%esp
    11fa:	6a 0c                	push   $0xc
    11fc:	6a 00                	push   $0x0
    11fe:	ff 75 f4             	pushl  -0xc(%ebp)
    1201:	e8 79 f3 ff ff       	call   57f <memset>
    1206:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
    1209:	8b 45 f4             	mov    -0xc(%ebp),%eax
    120c:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
    1212:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1215:	8b 55 08             	mov    0x8(%ebp),%edx
    1218:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    121b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    121e:	8b 55 0c             	mov    0xc(%ebp),%edx
    1221:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    1224:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1227:	c9                   	leave  
    1228:	c3                   	ret    

00001229 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
    1229:	55                   	push   %ebp
    122a:	89 e5                	mov    %esp,%ebp
    122c:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    122f:	83 ec 0c             	sub    $0xc,%esp
    1232:	6a 0c                	push   $0xc
    1234:	e8 8f fa ff ff       	call   cc8 <malloc>
    1239:	83 c4 10             	add    $0x10,%esp
    123c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    123f:	83 ec 04             	sub    $0x4,%esp
    1242:	6a 0c                	push   $0xc
    1244:	6a 00                	push   $0x0
    1246:	ff 75 f4             	pushl  -0xc(%ebp)
    1249:	e8 31 f3 ff ff       	call   57f <memset>
    124e:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
    1251:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1254:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
    125a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    125d:	8b 55 08             	mov    0x8(%ebp),%edx
    1260:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    1263:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1266:	8b 55 0c             	mov    0xc(%ebp),%edx
    1269:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    126c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    126f:	c9                   	leave  
    1270:	c3                   	ret    

00001271 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
    1271:	55                   	push   %ebp
    1272:	89 e5                	mov    %esp,%ebp
    1274:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1277:	83 ec 0c             	sub    $0xc,%esp
    127a:	6a 08                	push   $0x8
    127c:	e8 47 fa ff ff       	call   cc8 <malloc>
    1281:	83 c4 10             	add    $0x10,%esp
    1284:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1287:	83 ec 04             	sub    $0x4,%esp
    128a:	6a 08                	push   $0x8
    128c:	6a 00                	push   $0x0
    128e:	ff 75 f4             	pushl  -0xc(%ebp)
    1291:	e8 e9 f2 ff ff       	call   57f <memset>
    1296:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
    1299:	8b 45 f4             	mov    -0xc(%ebp),%eax
    129c:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
    12a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12a5:	8b 55 08             	mov    0x8(%ebp),%edx
    12a8:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    12ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    12ae:	c9                   	leave  
    12af:	c3                   	ret    

000012b0 <calcmd>:

struct cmd* calcmd(char *_line)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    12b6:	83 ec 0c             	sub    $0xc,%esp
    12b9:	6a 08                	push   $0x8
    12bb:	e8 08 fa ff ff       	call   cc8 <malloc>
    12c0:	83 c4 10             	add    $0x10,%esp
    12c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    12c6:	83 ec 04             	sub    $0x4,%esp
    12c9:	6a 08                	push   $0x8
    12cb:	6a 00                	push   $0x0
    12cd:	ff 75 f4             	pushl  -0xc(%ebp)
    12d0:	e8 aa f2 ff ff       	call   57f <memset>
    12d5:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
    12d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12db:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
    12e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12e4:	8b 55 08             	mov    0x8(%ebp),%edx
    12e7:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    12ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    12ed:	c9                   	leave  
    12ee:	c3                   	ret    

000012ef <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
    12ef:	55                   	push   %ebp
    12f0:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
    12f2:	eb 0c                	jmp    1300 <mystrncmp+0x11>
    n--, p++, q++;
    12f4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    12f8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    12fc:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    1300:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1304:	74 1a                	je     1320 <mystrncmp+0x31>
    1306:	8b 45 08             	mov    0x8(%ebp),%eax
    1309:	0f b6 00             	movzbl (%eax),%eax
    130c:	84 c0                	test   %al,%al
    130e:	74 10                	je     1320 <mystrncmp+0x31>
    1310:	8b 45 08             	mov    0x8(%ebp),%eax
    1313:	0f b6 10             	movzbl (%eax),%edx
    1316:	8b 45 0c             	mov    0xc(%ebp),%eax
    1319:	0f b6 00             	movzbl (%eax),%eax
    131c:	38 c2                	cmp    %al,%dl
    131e:	74 d4                	je     12f4 <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
    1320:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1324:	75 07                	jne    132d <mystrncmp+0x3e>
    return 0;
    1326:	b8 00 00 00 00       	mov    $0x0,%eax
    132b:	eb 16                	jmp    1343 <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
    132d:	8b 45 08             	mov    0x8(%ebp),%eax
    1330:	0f b6 00             	movzbl (%eax),%eax
    1333:	0f b6 d0             	movzbl %al,%edx
    1336:	8b 45 0c             	mov    0xc(%ebp),%eax
    1339:	0f b6 00             	movzbl (%eax),%eax
    133c:	0f b6 c0             	movzbl %al,%eax
    133f:	29 c2                	sub    %eax,%edx
    1341:	89 d0                	mov    %edx,%eax
}
    1343:	5d                   	pop    %ebp
    1344:	c3                   	ret    

00001345 <mystrlen>:

static int mystrlen(const char *s)
{
    1345:	55                   	push   %ebp
    1346:	89 e5                	mov    %esp,%ebp
    1348:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
    134b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1352:	eb 04                	jmp    1358 <mystrlen+0x13>
    1354:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1358:	8b 55 fc             	mov    -0x4(%ebp),%edx
    135b:	8b 45 08             	mov    0x8(%ebp),%eax
    135e:	01 d0                	add    %edx,%eax
    1360:	0f b6 00             	movzbl (%eax),%eax
    1363:	84 c0                	test   %al,%al
    1365:	75 ed                	jne    1354 <mystrlen+0xf>
    ;
  return n;
    1367:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    136a:	c9                   	leave  
    136b:	c3                   	ret    

0000136c <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
    136c:	55                   	push   %ebp
    136d:	89 e5                	mov    %esp,%ebp
    136f:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
    1372:	8b 45 08             	mov    0x8(%ebp),%eax
    1375:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
    1378:	90                   	nop
    1379:	8b 45 10             	mov    0x10(%ebp),%eax
    137c:	8d 50 ff             	lea    -0x1(%eax),%edx
    137f:	89 55 10             	mov    %edx,0x10(%ebp)
    1382:	85 c0                	test   %eax,%eax
    1384:	7e 2c                	jle    13b2 <mystrncpy+0x46>
    1386:	8b 45 08             	mov    0x8(%ebp),%eax
    1389:	8d 50 01             	lea    0x1(%eax),%edx
    138c:	89 55 08             	mov    %edx,0x8(%ebp)
    138f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1392:	8d 4a 01             	lea    0x1(%edx),%ecx
    1395:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1398:	0f b6 12             	movzbl (%edx),%edx
    139b:	88 10                	mov    %dl,(%eax)
    139d:	0f b6 00             	movzbl (%eax),%eax
    13a0:	84 c0                	test   %al,%al
    13a2:	75 d5                	jne    1379 <mystrncpy+0xd>
    ;
  while(n-- > 0)
    13a4:	eb 0c                	jmp    13b2 <mystrncpy+0x46>
    *s++ = 0;
    13a6:	8b 45 08             	mov    0x8(%ebp),%eax
    13a9:	8d 50 01             	lea    0x1(%eax),%edx
    13ac:	89 55 08             	mov    %edx,0x8(%ebp)
    13af:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    13b2:	8b 45 10             	mov    0x10(%ebp),%eax
    13b5:	8d 50 ff             	lea    -0x1(%eax),%edx
    13b8:	89 55 10             	mov    %edx,0x10(%ebp)
    13bb:	85 c0                	test   %eax,%eax
    13bd:	7f e7                	jg     13a6 <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    13bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    13c2:	c9                   	leave  
    13c3:	c3                   	ret    

000013c4 <isEqual>:

int isEqual(double a, double b)
{
    13c4:	55                   	push   %ebp
    13c5:	89 e5                	mov    %esp,%ebp
    13c7:	83 ec 10             	sub    $0x10,%esp
    13ca:	8b 45 08             	mov    0x8(%ebp),%eax
    13cd:	89 45 f8             	mov    %eax,-0x8(%ebp)
    13d0:	8b 45 0c             	mov    0xc(%ebp),%eax
    13d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
    13d6:	8b 45 10             	mov    0x10(%ebp),%eax
    13d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    13dc:	8b 45 14             	mov    0x14(%ebp),%eax
    13df:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    13e2:	dd 45 f8             	fldl   -0x8(%ebp)
    13e5:	dc 65 f0             	fsubl  -0x10(%ebp)
    13e8:	dd 05 e8 3c 00 00    	fldl   0x3ce8
    13ee:	df e9                	fucomip %st(1),%st
    13f0:	dd d8                	fstp   %st(0)
    13f2:	76 19                	jbe    140d <isEqual+0x49>
    13f4:	dd 45 f0             	fldl   -0x10(%ebp)
    13f7:	dc 65 f8             	fsubl  -0x8(%ebp)
    13fa:	dd 05 e8 3c 00 00    	fldl   0x3ce8
    1400:	df e9                	fucomip %st(1),%st
    1402:	dd d8                	fstp   %st(0)
    1404:	76 07                	jbe    140d <isEqual+0x49>
    return 1;
    1406:	b8 01 00 00 00       	mov    $0x1,%eax
    140b:	eb 05                	jmp    1412 <isEqual+0x4e>
  return 0;
    140d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1412:	c9                   	leave  
    1413:	c3                   	ret    

00001414 <isCmdName>:

int isCmdName(const char* str)
{
    1414:	55                   	push   %ebp
    1415:	89 e5                	mov    %esp,%ebp
    1417:	53                   	push   %ebx
    1418:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    141b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1422:	eb 71                	jmp    1495 <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1424:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1427:	89 d0                	mov    %edx,%eax
    1429:	c1 e0 02             	shl    $0x2,%eax
    142c:	01 d0                	add    %edx,%eax
    142e:	01 c0                	add    %eax,%eax
    1430:	05 40 47 00 00       	add    $0x4740,%eax
    1435:	83 ec 0c             	sub    $0xc,%esp
    1438:	50                   	push   %eax
    1439:	e8 1a f1 ff ff       	call   558 <strlen>
    143e:	83 c4 10             	add    $0x10,%esp
    1441:	89 c3                	mov    %eax,%ebx
    1443:	83 ec 0c             	sub    $0xc,%esp
    1446:	ff 75 08             	pushl  0x8(%ebp)
    1449:	e8 f7 fe ff ff       	call   1345 <mystrlen>
    144e:	83 c4 10             	add    $0x10,%esp
    1451:	39 c3                	cmp    %eax,%ebx
    1453:	75 3c                	jne    1491 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    1455:	83 ec 0c             	sub    $0xc,%esp
    1458:	ff 75 08             	pushl  0x8(%ebp)
    145b:	e8 e5 fe ff ff       	call   1345 <mystrlen>
    1460:	83 c4 10             	add    $0x10,%esp
    1463:	89 c1                	mov    %eax,%ecx
    1465:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1468:	89 d0                	mov    %edx,%eax
    146a:	c1 e0 02             	shl    $0x2,%eax
    146d:	01 d0                	add    %edx,%eax
    146f:	01 c0                	add    %eax,%eax
    1471:	05 40 47 00 00       	add    $0x4740,%eax
    1476:	83 ec 04             	sub    $0x4,%esp
    1479:	51                   	push   %ecx
    147a:	ff 75 08             	pushl  0x8(%ebp)
    147d:	50                   	push   %eax
    147e:	e8 6c fe ff ff       	call   12ef <mystrncmp>
    1483:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    1486:	85 c0                	test   %eax,%eax
    1488:	75 07                	jne    1491 <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    148a:	b8 01 00 00 00       	mov    $0x1,%eax
    148f:	eb 0f                	jmp    14a0 <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    1491:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1495:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1499:	7e 89                	jle    1424 <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    149b:	b8 00 00 00 00       	mov    $0x0,%eax
}
    14a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    14a3:	c9                   	leave  
    14a4:	c3                   	ret    

000014a5 <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    14a5:	55                   	push   %ebp
    14a6:	89 e5                	mov    %esp,%ebp
    14a8:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    14ae:	83 ec 08             	sub    $0x8,%esp
    14b1:	6a 00                	push   $0x0
    14b3:	68 08 48 00 00       	push   $0x4808
    14b8:	e8 9d f2 ff ff       	call   75a <open>
    14bd:	83 c4 10             	add    $0x10,%esp
    14c0:	89 45 dc             	mov    %eax,-0x24(%ebp)
    14c3:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    14c7:	79 0a                	jns    14d3 <findAlias+0x2e>
  {
      return 0; //no aliasfile
    14c9:	b8 00 00 00 00       	mov    $0x0,%eax
    14ce:	e9 9a 01 00 00       	jmp    166d <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    14d3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    14da:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    14e1:	e9 ee 00 00 00       	jmp    15d4 <findAlias+0x12f>
  {
      int isSame = 1;
    14e6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    14ed:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    14f4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    14fb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    1502:	83 ec 0c             	sub    $0xc,%esp
    1505:	8d 45 9a             	lea    -0x66(%ebp),%eax
    1508:	50                   	push   %eax
    1509:	e8 4a f0 ff ff       	call   558 <strlen>
    150e:	83 c4 10             	add    $0x10,%esp
    1511:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    1514:	83 ec 0c             	sub    $0xc,%esp
    1517:	ff 75 08             	pushl  0x8(%ebp)
    151a:	e8 39 f0 ff ff       	call   558 <strlen>
    151f:	83 c4 10             	add    $0x10,%esp
    1522:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    1525:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1528:	8b 45 e8             	mov    -0x18(%ebp),%eax
    152b:	01 d0                	add    %edx,%eax
    152d:	0f b6 00             	movzbl (%eax),%eax
    1530:	3c 21                	cmp    $0x21,%al
    1532:	75 38                	jne    156c <findAlias+0xc7>
      {
          startIndex++;
    1534:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    1538:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    153f:	eb 2b                	jmp    156c <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    1541:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1544:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1547:	01 d0                	add    %edx,%eax
    1549:	0f b6 10             	movzbl (%eax),%edx
    154c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    154f:	8b 45 08             	mov    0x8(%ebp),%eax
    1552:	01 c8                	add    %ecx,%eax
    1554:	0f b6 00             	movzbl (%eax),%eax
    1557:	38 c2                	cmp    %al,%dl
    1559:	74 09                	je     1564 <findAlias+0xbf>
          {
              isSame = 0;
    155b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    1562:	eb 1f                	jmp    1583 <findAlias+0xde>
          }
          startIndex++;
    1564:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    1568:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    156c:	8d 55 9a             	lea    -0x66(%ebp),%edx
    156f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1572:	01 d0                	add    %edx,%eax
    1574:	0f b6 00             	movzbl (%eax),%eax
    1577:	3c 3d                	cmp    $0x3d,%al
    1579:	74 08                	je     1583 <findAlias+0xde>
    157b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    157e:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1581:	7c be                	jl     1541 <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    1583:	8d 55 9a             	lea    -0x66(%ebp),%edx
    1586:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1589:	01 d0                	add    %edx,%eax
    158b:	0f b6 00             	movzbl (%eax),%eax
    158e:	3c 3d                	cmp    $0x3d,%al
    1590:	75 08                	jne    159a <findAlias+0xf5>
    1592:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1595:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1598:	7d 07                	jge    15a1 <findAlias+0xfc>
      {
          isSame = 0;
    159a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    15a1:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    15a5:	75 0b                	jne    15b2 <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    15a7:	b8 01 00 00 00       	mov    $0x1,%eax
    15ac:	2b 45 f0             	sub    -0x10(%ebp),%eax
    15af:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    15b2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    15b6:	75 1c                	jne    15d4 <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    15b8:	83 ec 08             	sub    $0x8,%esp
    15bb:	8d 45 9a             	lea    -0x66(%ebp),%eax
    15be:	50                   	push   %eax
    15bf:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    15c5:	50                   	push   %eax
    15c6:	e8 1e ef ff ff       	call   4e9 <strcpy>
    15cb:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    15ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    15d4:	83 ec 04             	sub    $0x4,%esp
    15d7:	6a 32                	push   $0x32
    15d9:	8d 45 9a             	lea    -0x66(%ebp),%eax
    15dc:	50                   	push   %eax
    15dd:	ff 75 dc             	pushl  -0x24(%ebp)
    15e0:	e8 4d f1 ff ff       	call   732 <read>
    15e5:	83 c4 10             	add    $0x10,%esp
    15e8:	89 45 d8             	mov    %eax,-0x28(%ebp)
    15eb:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    15ef:	0f 8f f1 fe ff ff    	jg     14e6 <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    15f5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    15f9:	75 5f                	jne    165a <findAlias+0x1b5>
  {
    int i = 0;
    15fb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    1602:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    1606:	eb 20                	jmp    1628 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    1608:	8b 55 e0             	mov    -0x20(%ebp),%edx
    160b:	8b 45 0c             	mov    0xc(%ebp),%eax
    160e:	01 c2                	add    %eax,%edx
    1610:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    1616:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1619:	01 c8                	add    %ecx,%eax
    161b:	0f b6 00             	movzbl (%eax),%eax
    161e:	88 02                	mov    %al,(%edx)
      i++;
    1620:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    1624:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    1628:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    162e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1631:	01 d0                	add    %edx,%eax
    1633:	0f b6 00             	movzbl (%eax),%eax
    1636:	84 c0                	test   %al,%al
    1638:	75 ce                	jne    1608 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    163a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    163d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1640:	01 d0                	add    %edx,%eax
    1642:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    1645:	83 ec 0c             	sub    $0xc,%esp
    1648:	ff 75 dc             	pushl  -0x24(%ebp)
    164b:	e8 f2 f0 ff ff       	call   742 <close>
    1650:	83 c4 10             	add    $0x10,%esp
    return 1;
    1653:	b8 01 00 00 00       	mov    $0x1,%eax
    1658:	eb 13                	jmp    166d <findAlias+0x1c8>
  }
  close(fd);
    165a:	83 ec 0c             	sub    $0xc,%esp
    165d:	ff 75 dc             	pushl  -0x24(%ebp)
    1660:	e8 dd f0 ff ff       	call   742 <close>
    1665:	83 c4 10             	add    $0x10,%esp
  return 0;
    1668:	b8 00 00 00 00       	mov    $0x0,%eax
}
    166d:	c9                   	leave  
    166e:	c3                   	ret    

0000166f <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    166f:	55                   	push   %ebp
    1670:	89 e5                	mov    %esp,%ebp
    1672:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1675:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1679:	75 05                	jne    1680 <runcmd+0x11>
    exit();
    167b:	e8 9a f0 ff ff       	call   71a <exit>
  
  switch(cmd->type){
    1680:	8b 45 08             	mov    0x8(%ebp),%eax
    1683:	8b 00                	mov    (%eax),%eax
    1685:	83 f8 05             	cmp    $0x5,%eax
    1688:	77 09                	ja     1693 <runcmd+0x24>
    168a:	8b 04 85 4c 3b 00 00 	mov    0x3b4c(,%eax,4),%eax
    1691:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    1693:	83 ec 0c             	sub    $0xc,%esp
    1696:	68 20 3b 00 00       	push   $0x3b20
    169b:	e8 0b f7 ff ff       	call   dab <panic1>
    16a0:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    16a3:	8b 45 08             	mov    0x8(%ebp),%eax
    16a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    16a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16ac:	8b 40 04             	mov    0x4(%eax),%eax
    16af:	85 c0                	test   %eax,%eax
    16b1:	75 05                	jne    16b8 <runcmd+0x49>
      exit();
    16b3:	e8 62 f0 ff ff       	call   71a <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    16b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16bb:	8b 40 04             	mov    0x4(%eax),%eax
    16be:	83 ec 0c             	sub    $0xc,%esp
    16c1:	50                   	push   %eax
    16c2:	e8 4d fd ff ff       	call   1414 <isCmdName>
    16c7:	83 c4 10             	add    $0x10,%esp
    16ca:	85 c0                	test   %eax,%eax
    16cc:	75 37                	jne    1705 <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    16ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16d1:	8b 40 04             	mov    0x4(%eax),%eax
    16d4:	83 ec 08             	sub    $0x8,%esp
    16d7:	8d 55 ce             	lea    -0x32(%ebp),%edx
    16da:	52                   	push   %edx
    16db:	50                   	push   %eax
    16dc:	e8 c4 fd ff ff       	call   14a5 <findAlias>
    16e1:	83 c4 10             	add    $0x10,%esp
    16e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    16e7:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    16eb:	75 31                	jne    171e <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    16ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16f0:	83 c0 04             	add    $0x4,%eax
    16f3:	83 ec 08             	sub    $0x8,%esp
    16f6:	50                   	push   %eax
    16f7:	8d 45 ce             	lea    -0x32(%ebp),%eax
    16fa:	50                   	push   %eax
    16fb:	e8 52 f0 ff ff       	call   752 <exec>
    1700:	83 c4 10             	add    $0x10,%esp
    1703:	eb 19                	jmp    171e <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    1705:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1708:	8d 50 04             	lea    0x4(%eax),%edx
    170b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    170e:	8b 40 04             	mov    0x4(%eax),%eax
    1711:	83 ec 08             	sub    $0x8,%esp
    1714:	52                   	push   %edx
    1715:	50                   	push   %eax
    1716:	e8 37 f0 ff ff       	call   752 <exec>
    171b:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    171e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1721:	8b 40 04             	mov    0x4(%eax),%eax
    1724:	83 ec 04             	sub    $0x4,%esp
    1727:	50                   	push   %eax
    1728:	68 27 3b 00 00       	push   $0x3b27
    172d:	6a 02                	push   $0x2
    172f:	e8 92 f2 ff ff       	call   9c6 <printf>
    1734:	83 c4 10             	add    $0x10,%esp
    break;
    1737:	e9 c6 01 00 00       	jmp    1902 <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    173c:	8b 45 08             	mov    0x8(%ebp),%eax
    173f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    1742:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1745:	8b 40 14             	mov    0x14(%eax),%eax
    1748:	83 ec 0c             	sub    $0xc,%esp
    174b:	50                   	push   %eax
    174c:	e8 f1 ef ff ff       	call   742 <close>
    1751:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    1754:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1757:	8b 50 10             	mov    0x10(%eax),%edx
    175a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    175d:	8b 40 08             	mov    0x8(%eax),%eax
    1760:	83 ec 08             	sub    $0x8,%esp
    1763:	52                   	push   %edx
    1764:	50                   	push   %eax
    1765:	e8 f0 ef ff ff       	call   75a <open>
    176a:	83 c4 10             	add    $0x10,%esp
    176d:	85 c0                	test   %eax,%eax
    176f:	79 1e                	jns    178f <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    1771:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1774:	8b 40 08             	mov    0x8(%eax),%eax
    1777:	83 ec 04             	sub    $0x4,%esp
    177a:	50                   	push   %eax
    177b:	68 37 3b 00 00       	push   $0x3b37
    1780:	6a 02                	push   $0x2
    1782:	e8 3f f2 ff ff       	call   9c6 <printf>
    1787:	83 c4 10             	add    $0x10,%esp
      exit();
    178a:	e8 8b ef ff ff       	call   71a <exit>
    }
    runcmd(rcmd->cmd);
    178f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1792:	8b 40 04             	mov    0x4(%eax),%eax
    1795:	83 ec 0c             	sub    $0xc,%esp
    1798:	50                   	push   %eax
    1799:	e8 d1 fe ff ff       	call   166f <runcmd>
    179e:	83 c4 10             	add    $0x10,%esp
    break;
    17a1:	e9 5c 01 00 00       	jmp    1902 <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    17a6:	8b 45 08             	mov    0x8(%ebp),%eax
    17a9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    17ac:	e8 84 f9 ff ff       	call   1135 <fork1>
    17b1:	85 c0                	test   %eax,%eax
    17b3:	75 12                	jne    17c7 <runcmd+0x158>
      runcmd(lcmd->left);
    17b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17b8:	8b 40 04             	mov    0x4(%eax),%eax
    17bb:	83 ec 0c             	sub    $0xc,%esp
    17be:	50                   	push   %eax
    17bf:	e8 ab fe ff ff       	call   166f <runcmd>
    17c4:	83 c4 10             	add    $0x10,%esp
    wait();
    17c7:	e8 56 ef ff ff       	call   722 <wait>
    runcmd(lcmd->right);
    17cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17cf:	8b 40 08             	mov    0x8(%eax),%eax
    17d2:	83 ec 0c             	sub    $0xc,%esp
    17d5:	50                   	push   %eax
    17d6:	e8 94 fe ff ff       	call   166f <runcmd>
    17db:	83 c4 10             	add    $0x10,%esp
    break;
    17de:	e9 1f 01 00 00       	jmp    1902 <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    17e3:	8b 45 08             	mov    0x8(%ebp),%eax
    17e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    17e9:	83 ec 0c             	sub    $0xc,%esp
    17ec:	8d 45 d8             	lea    -0x28(%ebp),%eax
    17ef:	50                   	push   %eax
    17f0:	e8 35 ef ff ff       	call   72a <pipe>
    17f5:	83 c4 10             	add    $0x10,%esp
    17f8:	85 c0                	test   %eax,%eax
    17fa:	79 10                	jns    180c <runcmd+0x19d>
      panic1("pipe");
    17fc:	83 ec 0c             	sub    $0xc,%esp
    17ff:	68 47 3b 00 00       	push   $0x3b47
    1804:	e8 a2 f5 ff ff       	call   dab <panic1>
    1809:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    180c:	e8 24 f9 ff ff       	call   1135 <fork1>
    1811:	85 c0                	test   %eax,%eax
    1813:	75 4c                	jne    1861 <runcmd+0x1f2>
      close(1);
    1815:	83 ec 0c             	sub    $0xc,%esp
    1818:	6a 01                	push   $0x1
    181a:	e8 23 ef ff ff       	call   742 <close>
    181f:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    1822:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1825:	83 ec 0c             	sub    $0xc,%esp
    1828:	50                   	push   %eax
    1829:	e8 64 ef ff ff       	call   792 <dup>
    182e:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1831:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1834:	83 ec 0c             	sub    $0xc,%esp
    1837:	50                   	push   %eax
    1838:	e8 05 ef ff ff       	call   742 <close>
    183d:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    1840:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1843:	83 ec 0c             	sub    $0xc,%esp
    1846:	50                   	push   %eax
    1847:	e8 f6 ee ff ff       	call   742 <close>
    184c:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    184f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1852:	8b 40 04             	mov    0x4(%eax),%eax
    1855:	83 ec 0c             	sub    $0xc,%esp
    1858:	50                   	push   %eax
    1859:	e8 11 fe ff ff       	call   166f <runcmd>
    185e:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    1861:	e8 cf f8 ff ff       	call   1135 <fork1>
    1866:	85 c0                	test   %eax,%eax
    1868:	75 4c                	jne    18b6 <runcmd+0x247>
      close(0);
    186a:	83 ec 0c             	sub    $0xc,%esp
    186d:	6a 00                	push   $0x0
    186f:	e8 ce ee ff ff       	call   742 <close>
    1874:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    1877:	8b 45 d8             	mov    -0x28(%ebp),%eax
    187a:	83 ec 0c             	sub    $0xc,%esp
    187d:	50                   	push   %eax
    187e:	e8 0f ef ff ff       	call   792 <dup>
    1883:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    1886:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1889:	83 ec 0c             	sub    $0xc,%esp
    188c:	50                   	push   %eax
    188d:	e8 b0 ee ff ff       	call   742 <close>
    1892:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    1895:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1898:	83 ec 0c             	sub    $0xc,%esp
    189b:	50                   	push   %eax
    189c:	e8 a1 ee ff ff       	call   742 <close>
    18a1:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    18a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18a7:	8b 40 08             	mov    0x8(%eax),%eax
    18aa:	83 ec 0c             	sub    $0xc,%esp
    18ad:	50                   	push   %eax
    18ae:	e8 bc fd ff ff       	call   166f <runcmd>
    18b3:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    18b6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    18b9:	83 ec 0c             	sub    $0xc,%esp
    18bc:	50                   	push   %eax
    18bd:	e8 80 ee ff ff       	call   742 <close>
    18c2:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    18c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    18c8:	83 ec 0c             	sub    $0xc,%esp
    18cb:	50                   	push   %eax
    18cc:	e8 71 ee ff ff       	call   742 <close>
    18d1:	83 c4 10             	add    $0x10,%esp
    wait();
    18d4:	e8 49 ee ff ff       	call   722 <wait>
    wait();
    18d9:	e8 44 ee ff ff       	call   722 <wait>
    break;
    18de:	eb 22                	jmp    1902 <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    18e0:	8b 45 08             	mov    0x8(%ebp),%eax
    18e3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    18e6:	e8 4a f8 ff ff       	call   1135 <fork1>
    18eb:	85 c0                	test   %eax,%eax
    18ed:	75 12                	jne    1901 <runcmd+0x292>
      runcmd(bcmd->cmd);
    18ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
    18f2:	8b 40 04             	mov    0x4(%eax),%eax
    18f5:	83 ec 0c             	sub    $0xc,%esp
    18f8:	50                   	push   %eax
    18f9:	e8 71 fd ff ff       	call   166f <runcmd>
    18fe:	83 c4 10             	add    $0x10,%esp
    break;
    1901:	90                   	nop
  }
  exit();
    1902:	e8 13 ee ff ff       	call   71a <exit>

00001907 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    1907:	55                   	push   %ebp
    1908:	89 e5                	mov    %esp,%ebp
    190a:	83 ec 04             	sub    $0x4,%esp
    190d:	8b 45 08             	mov    0x8(%ebp),%eax
    1910:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    1913:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    1917:	7e 0d                	jle    1926 <isNameChar+0x1f>
    1919:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    191d:	7f 07                	jg     1926 <isNameChar+0x1f>
    return 1;
    191f:	b8 01 00 00 00       	mov    $0x1,%eax
    1924:	eb 38                	jmp    195e <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    1926:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    192a:	7e 0d                	jle    1939 <isNameChar+0x32>
    192c:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    1930:	7f 07                	jg     1939 <isNameChar+0x32>
    return 1;
    1932:	b8 01 00 00 00       	mov    $0x1,%eax
    1937:	eb 25                	jmp    195e <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    1939:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    193d:	7e 0d                	jle    194c <isNameChar+0x45>
    193f:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    1943:	7f 07                	jg     194c <isNameChar+0x45>
    return 1;
    1945:	b8 01 00 00 00       	mov    $0x1,%eax
    194a:	eb 12                	jmp    195e <isNameChar+0x57>
  if(ch == '_')
    194c:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    1950:	75 07                	jne    1959 <isNameChar+0x52>
    return 1;
    1952:	b8 01 00 00 00       	mov    $0x1,%eax
    1957:	eb 05                	jmp    195e <isNameChar+0x57>
  return 0;
    1959:	b8 00 00 00 00       	mov    $0x0,%eax
}
    195e:	c9                   	leave  
    195f:	c3                   	ret    

00001960 <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    1960:	55                   	push   %ebp
    1961:	89 e5                	mov    %esp,%ebp
    1963:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    1966:	8b 45 08             	mov    0x8(%ebp),%eax
    1969:	8b 40 04             	mov    0x4(%eax),%eax
    196c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    196f:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    1976:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    197d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1984:	eb 1d                	jmp    19a3 <runCalcmd+0x43>
  {
    if(line[i] == '=')
    1986:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1989:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    198c:	01 d0                	add    %edx,%eax
    198e:	0f b6 00             	movzbl (%eax),%eax
    1991:	3c 3d                	cmp    $0x3d,%al
    1993:	75 0a                	jne    199f <runCalcmd+0x3f>
    {
      hasEqu++;
    1995:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    1999:	8b 45 ec             	mov    -0x14(%ebp),%eax
    199c:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    199f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    19a3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    19a6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19a9:	01 d0                	add    %edx,%eax
    19ab:	0f b6 00             	movzbl (%eax),%eax
    19ae:	84 c0                	test   %al,%al
    19b0:	75 d4                	jne    1986 <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    19b2:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    19b6:	7e 1d                	jle    19d5 <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    19b8:	83 ec 0c             	sub    $0xc,%esp
    19bb:	68 64 3b 00 00       	push   $0x3b64
    19c0:	6a 00                	push   $0x0
    19c2:	6a 00                	push   $0x0
    19c4:	6a 01                	push   $0x1
    19c6:	6a 04                	push   $0x4
    19c8:	e8 21 17 00 00       	call   30ee <color_printf>
    19cd:	83 c4 20             	add    $0x20,%esp
    19d0:	e9 78 05 00 00       	jmp    1f4d <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    19d5:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    19d9:	0f 85 26 05 00 00    	jne    1f05 <runCalcmd+0x5a5>
  {
    int i=0;
    19df:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    19e6:	eb 04                	jmp    19ec <runCalcmd+0x8c>
    {
      i++;
    19e8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    19ec:	8b 55 e8             	mov    -0x18(%ebp),%edx
    19ef:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    19f2:	01 d0                	add    %edx,%eax
    19f4:	0f b6 00             	movzbl (%eax),%eax
    19f7:	3c 20                	cmp    $0x20,%al
    19f9:	74 ed                	je     19e8 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    19fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    19fe:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    1a01:	eb 23                	jmp    1a26 <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    1a03:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1a06:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a09:	01 d0                	add    %edx,%eax
    1a0b:	0f b6 00             	movzbl (%eax),%eax
    1a0e:	0f be c0             	movsbl %al,%eax
    1a11:	83 ec 0c             	sub    $0xc,%esp
    1a14:	50                   	push   %eax
    1a15:	e8 ed fe ff ff       	call   1907 <isNameChar>
    1a1a:	83 c4 10             	add    $0x10,%esp
    1a1d:	83 f8 01             	cmp    $0x1,%eax
    1a20:	75 0e                	jne    1a30 <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    1a22:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1a26:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a29:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1a2c:	7c d5                	jl     1a03 <runCalcmd+0xa3>
    1a2e:	eb 01                	jmp    1a31 <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    1a30:	90                   	nop
    }
    int len = i-startIndex;
    1a31:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a34:	2b 45 d0             	sub    -0x30(%ebp),%eax
    1a37:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    1a3a:	eb 04                	jmp    1a40 <runCalcmd+0xe0>
    {
      i++;
    1a3c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    1a40:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1a43:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a46:	01 d0                	add    %edx,%eax
    1a48:	0f b6 00             	movzbl (%eax),%eax
    1a4b:	3c 20                	cmp    $0x20,%al
    1a4d:	74 ed                	je     1a3c <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    1a4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a52:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1a55:	0f 85 90 04 00 00    	jne    1eeb <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    1a5b:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1a5e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a61:	01 d0                	add    %edx,%eax
    1a63:	0f b6 00             	movzbl (%eax),%eax
    1a66:	3c 2f                	cmp    $0x2f,%al
    1a68:	7e 2c                	jle    1a96 <runCalcmd+0x136>
    1a6a:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1a6d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a70:	01 d0                	add    %edx,%eax
    1a72:	0f b6 00             	movzbl (%eax),%eax
    1a75:	3c 39                	cmp    $0x39,%al
    1a77:	7f 1d                	jg     1a96 <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    1a79:	83 ec 0c             	sub    $0xc,%esp
    1a7c:	68 80 3b 00 00       	push   $0x3b80
    1a81:	6a 00                	push   $0x0
    1a83:	6a 00                	push   $0x0
    1a85:	6a 01                	push   $0x1
    1a87:	6a 04                	push   $0x4
    1a89:	e8 60 16 00 00       	call   30ee <color_printf>
    1a8e:	83 c4 20             	add    $0x20,%esp
    1a91:	e9 b7 04 00 00       	jmp    1f4d <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1a96:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1a9d:	eb 20                	jmp    1abf <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    1a9f:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1aa2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1aa5:	01 d0                	add    %edx,%eax
    1aa7:	89 c2                	mov    %eax,%edx
    1aa9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1aac:	01 d0                	add    %edx,%eax
    1aae:	0f b6 00             	movzbl (%eax),%eax
    1ab1:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    1ab4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1ab7:	01 ca                	add    %ecx,%edx
    1ab9:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    1abb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1abf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1ac2:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    1ac5:	7c d8                	jl     1a9f <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    1ac7:	8d 55 94             	lea    -0x6c(%ebp),%edx
    1aca:	8b 45 cc             	mov    -0x34(%ebp),%eax
    1acd:	01 d0                	add    %edx,%eax
    1acf:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    1ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ad5:	83 c0 01             	add    $0x1,%eax
    1ad8:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    1adb:	eb 04                	jmp    1ae1 <runCalcmd+0x181>
        {
          i++;
    1add:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    1ae1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1ae4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1ae7:	01 d0                	add    %edx,%eax
    1ae9:	0f b6 00             	movzbl (%eax),%eax
    1aec:	3c 20                	cmp    $0x20,%al
    1aee:	74 ed                	je     1add <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    1af0:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1af3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1af6:	01 d0                	add    %edx,%eax
    1af8:	0f b6 00             	movzbl (%eax),%eax
    1afb:	3c 60                	cmp    $0x60,%al
    1afd:	0f 85 e6 01 00 00    	jne    1ce9 <runCalcmd+0x389>
        {
          i++;
    1b03:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    1b07:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1b0a:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    1b0d:	eb 04                	jmp    1b13 <runCalcmd+0x1b3>
          {
            i++;
    1b0f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    1b13:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b16:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b19:	01 d0                	add    %edx,%eax
    1b1b:	0f b6 00             	movzbl (%eax),%eax
    1b1e:	3c 60                	cmp    $0x60,%al
    1b20:	74 0f                	je     1b31 <runCalcmd+0x1d1>
    1b22:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b25:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b28:	01 d0                	add    %edx,%eax
    1b2a:	0f b6 00             	movzbl (%eax),%eax
    1b2d:	84 c0                	test   %al,%al
    1b2f:	75 de                	jne    1b0f <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    1b31:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b34:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b37:	01 d0                	add    %edx,%eax
    1b39:	0f b6 00             	movzbl (%eax),%eax
    1b3c:	3c 60                	cmp    $0x60,%al
    1b3e:	0f 85 5c 01 00 00    	jne    1ca0 <runCalcmd+0x340>
    1b44:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1b47:	8d 50 01             	lea    0x1(%eax),%edx
    1b4a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b4d:	01 d0                	add    %edx,%eax
    1b4f:	0f b6 00             	movzbl (%eax),%eax
    1b52:	84 c0                	test   %al,%al
    1b54:	0f 85 46 01 00 00    	jne    1ca0 <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    1b5a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b5d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b60:	01 d0                	add    %edx,%eax
    1b62:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    1b65:	8b 55 c8             	mov    -0x38(%ebp),%edx
    1b68:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1b6b:	01 d0                	add    %edx,%eax
    1b6d:	83 ec 0c             	sub    $0xc,%esp
    1b70:	50                   	push   %eax
    1b71:	e8 c5 04 00 00       	call   203b <Compute>
    1b76:	83 c4 10             	add    $0x10,%esp
    1b79:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    1b7c:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    1b82:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1b86:	dd 1c 24             	fstpl  (%esp)
    1b89:	ff 75 c4             	pushl  -0x3c(%ebp)
    1b8c:	ff 75 c0             	pushl  -0x40(%ebp)
    1b8f:	e8 30 f8 ff ff       	call   13c4 <isEqual>
    1b94:	83 c4 10             	add    $0x10,%esp
    1b97:	85 c0                	test   %eax,%eax
    1b99:	0f 85 ad 03 00 00    	jne    1f4c <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    1b9f:	a1 4c 48 00 00       	mov    0x484c,%eax
    1ba4:	85 c0                	test   %eax,%eax
    1ba6:	75 15                	jne    1bbd <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    1ba8:	83 ec 08             	sub    $0x8,%esp
    1bab:	68 4c 48 00 00       	push   $0x484c
    1bb0:	68 80 48 00 00       	push   $0x4880
    1bb5:	e8 ba 19 00 00       	call   3574 <readVariables>
    1bba:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    1bbd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    1bc4:	eb 26                	jmp    1bec <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    1bc6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bc9:	c1 e0 05             	shl    $0x5,%eax
    1bcc:	05 80 48 00 00       	add    $0x4880,%eax
    1bd1:	8d 50 04             	lea    0x4(%eax),%edx
    1bd4:	83 ec 08             	sub    $0x8,%esp
    1bd7:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1bda:	50                   	push   %eax
    1bdb:	52                   	push   %edx
    1bdc:	e8 38 e9 ff ff       	call   519 <strcmp>
    1be1:	83 c4 10             	add    $0x10,%esp
    1be4:	85 c0                	test   %eax,%eax
    1be6:	74 10                	je     1bf8 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    1be8:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    1bec:	a1 4c 48 00 00       	mov    0x484c,%eax
    1bf1:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1bf4:	7c d0                	jl     1bc6 <runCalcmd+0x266>
    1bf6:	eb 01                	jmp    1bf9 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    1bf8:	90                   	nop
              }
              if(index == v_num) //new variable
    1bf9:	a1 4c 48 00 00       	mov    0x484c,%eax
    1bfe:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    1c01:	75 3c                	jne    1c3f <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    1c03:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c06:	c1 e0 05             	shl    $0x5,%eax
    1c09:	05 80 48 00 00       	add    $0x4880,%eax
    1c0e:	8d 50 04             	lea    0x4(%eax),%edx
    1c11:	83 ec 08             	sub    $0x8,%esp
    1c14:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1c17:	50                   	push   %eax
    1c18:	52                   	push   %edx
    1c19:	e8 cb e8 ff ff       	call   4e9 <strcpy>
    1c1e:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    1c21:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c24:	c1 e0 05             	shl    $0x5,%eax
    1c27:	05 80 48 00 00       	add    $0x4880,%eax
    1c2c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    1c32:	a1 4c 48 00 00       	mov    0x484c,%eax
    1c37:	83 c0 01             	add    $0x1,%eax
    1c3a:	a3 4c 48 00 00       	mov    %eax,0x484c
              }
              variables[index].value.dvalue = result;
    1c3f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c42:	c1 e0 05             	shl    $0x5,%eax
    1c45:	05 90 48 00 00       	add    $0x4890,%eax
    1c4a:	dd 45 c0             	fldl   -0x40(%ebp)
    1c4d:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    1c50:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c53:	c1 e0 05             	shl    $0x5,%eax
    1c56:	05 90 48 00 00       	add    $0x4890,%eax
    1c5b:	dd 40 08             	fldl   0x8(%eax)
    1c5e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c61:	c1 e0 05             	shl    $0x5,%eax
    1c64:	05 80 48 00 00       	add    $0x4880,%eax
    1c69:	83 c0 04             	add    $0x4,%eax
    1c6c:	83 ec 0c             	sub    $0xc,%esp
    1c6f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1c73:	dd 1c 24             	fstpl  (%esp)
    1c76:	50                   	push   %eax
    1c77:	68 aa 3b 00 00       	push   $0x3baa
    1c7c:	6a 01                	push   $0x1
    1c7e:	e8 43 ed ff ff       	call   9c6 <printf>
    1c83:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    1c86:	83 ec 08             	sub    $0x8,%esp
    1c89:	68 4c 48 00 00       	push   $0x484c
    1c8e:	68 80 48 00 00       	push   $0x4880
    1c93:	e8 90 1b 00 00       	call   3828 <writeVariables>
    1c98:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1c9b:	e9 ac 02 00 00       	jmp    1f4c <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    1ca0:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1ca3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1ca6:	01 d0                	add    %edx,%eax
    1ca8:	0f b6 00             	movzbl (%eax),%eax
    1cab:	84 c0                	test   %al,%al
    1cad:	75 1d                	jne    1ccc <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    1caf:	83 ec 0c             	sub    $0xc,%esp
    1cb2:	68 b1 3b 00 00       	push   $0x3bb1
    1cb7:	6a 00                	push   $0x0
    1cb9:	6a 00                	push   $0x0
    1cbb:	6a 01                	push   $0x1
    1cbd:	6a 04                	push   $0x4
    1cbf:	e8 2a 14 00 00       	call   30ee <color_printf>
    1cc4:	83 c4 20             	add    $0x20,%esp
    1cc7:	e9 81 02 00 00       	jmp    1f4d <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    1ccc:	83 ec 0c             	sub    $0xc,%esp
    1ccf:	68 c8 3b 00 00       	push   $0x3bc8
    1cd4:	6a 00                	push   $0x0
    1cd6:	6a 00                	push   $0x0
    1cd8:	6a 01                	push   $0x1
    1cda:	6a 04                	push   $0x4
    1cdc:	e8 0d 14 00 00       	call   30ee <color_printf>
    1ce1:	83 c4 20             	add    $0x20,%esp
    1ce4:	e9 64 02 00 00       	jmp    1f4d <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    1ce9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1cec:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1cef:	01 d0                	add    %edx,%eax
    1cf1:	0f b6 00             	movzbl (%eax),%eax
    1cf4:	3c 22                	cmp    $0x22,%al
    1cf6:	0f 85 d5 01 00 00    	jne    1ed1 <runCalcmd+0x571>
        {
          i++;
    1cfc:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    1d00:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1d03:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1d06:	eb 04                	jmp    1d0c <runCalcmd+0x3ac>
          {
            i++;
    1d08:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    1d0c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1d0f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1d12:	01 d0                	add    %edx,%eax
    1d14:	0f b6 00             	movzbl (%eax),%eax
    1d17:	3c 22                	cmp    $0x22,%al
    1d19:	74 0f                	je     1d2a <runCalcmd+0x3ca>
    1d1b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1d1e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1d21:	01 d0                	add    %edx,%eax
    1d23:	0f b6 00             	movzbl (%eax),%eax
    1d26:	84 c0                	test   %al,%al
    1d28:	75 de                	jne    1d08 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    1d2a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1d2d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1d30:	01 d0                	add    %edx,%eax
    1d32:	0f b6 00             	movzbl (%eax),%eax
    1d35:	3c 22                	cmp    $0x22,%al
    1d37:	0f 85 4e 01 00 00    	jne    1e8b <runCalcmd+0x52b>
    1d3d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1d40:	8d 50 01             	lea    0x1(%eax),%edx
    1d43:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1d46:	01 d0                	add    %edx,%eax
    1d48:	0f b6 00             	movzbl (%eax),%eax
    1d4b:	84 c0                	test   %al,%al
    1d4d:	0f 85 38 01 00 00    	jne    1e8b <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    1d53:	a1 4c 48 00 00       	mov    0x484c,%eax
    1d58:	85 c0                	test   %eax,%eax
    1d5a:	75 15                	jne    1d71 <runCalcmd+0x411>
              readVariables(variables,&v_num);
    1d5c:	83 ec 08             	sub    $0x8,%esp
    1d5f:	68 4c 48 00 00       	push   $0x484c
    1d64:	68 80 48 00 00       	push   $0x4880
    1d69:	e8 06 18 00 00       	call   3574 <readVariables>
    1d6e:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    1d71:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    1d78:	eb 26                	jmp    1da0 <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    1d7a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1d7d:	c1 e0 05             	shl    $0x5,%eax
    1d80:	05 80 48 00 00       	add    $0x4880,%eax
    1d85:	8d 50 04             	lea    0x4(%eax),%edx
    1d88:	83 ec 08             	sub    $0x8,%esp
    1d8b:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1d8e:	50                   	push   %eax
    1d8f:	52                   	push   %edx
    1d90:	e8 84 e7 ff ff       	call   519 <strcmp>
    1d95:	83 c4 10             	add    $0x10,%esp
    1d98:	85 c0                	test   %eax,%eax
    1d9a:	74 10                	je     1dac <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    1d9c:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1da0:	a1 4c 48 00 00       	mov    0x484c,%eax
    1da5:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1da8:	7c d0                	jl     1d7a <runCalcmd+0x41a>
    1daa:	eb 01                	jmp    1dad <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    1dac:	90                   	nop
            }
            if(index == v_num) //new variable
    1dad:	a1 4c 48 00 00       	mov    0x484c,%eax
    1db2:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1db5:	75 2b                	jne    1de2 <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    1db7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1dba:	c1 e0 05             	shl    $0x5,%eax
    1dbd:	05 80 48 00 00       	add    $0x4880,%eax
    1dc2:	8d 50 04             	lea    0x4(%eax),%edx
    1dc5:	83 ec 08             	sub    $0x8,%esp
    1dc8:	8d 45 94             	lea    -0x6c(%ebp),%eax
    1dcb:	50                   	push   %eax
    1dcc:	52                   	push   %edx
    1dcd:	e8 17 e7 ff ff       	call   4e9 <strcpy>
    1dd2:	83 c4 10             	add    $0x10,%esp
              v_num++;
    1dd5:	a1 4c 48 00 00       	mov    0x484c,%eax
    1dda:	83 c0 01             	add    $0x1,%eax
    1ddd:	a3 4c 48 00 00       	mov    %eax,0x484c
            }
            variables[index].type = V_STRING;
    1de2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1de5:	c1 e0 05             	shl    $0x5,%eax
    1de8:	05 80 48 00 00       	add    $0x4880,%eax
    1ded:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    1df3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1df6:	2b 45 bc             	sub    -0x44(%ebp),%eax
    1df9:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    1dfc:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1dff:	83 c0 01             	add    $0x1,%eax
    1e02:	83 ec 0c             	sub    $0xc,%esp
    1e05:	50                   	push   %eax
    1e06:	e8 bd ee ff ff       	call   cc8 <malloc>
    1e0b:	83 c4 10             	add    $0x10,%esp
    1e0e:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    1e11:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1e14:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1e17:	01 d0                	add    %edx,%eax
    1e19:	83 ec 08             	sub    $0x8,%esp
    1e1c:	50                   	push   %eax
    1e1d:	ff 75 b4             	pushl  -0x4c(%ebp)
    1e20:	e8 c4 e6 ff ff       	call   4e9 <strcpy>
    1e25:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    1e28:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1e2b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1e2e:	01 d0                	add    %edx,%eax
    1e30:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    1e33:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1e36:	c1 e0 05             	shl    $0x5,%eax
    1e39:	8d 90 98 48 00 00    	lea    0x4898(%eax),%edx
    1e3f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1e42:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    1e44:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1e47:	c1 e0 05             	shl    $0x5,%eax
    1e4a:	05 98 48 00 00       	add    $0x4898,%eax
    1e4f:	8b 00                	mov    (%eax),%eax
    1e51:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1e54:	c1 e2 05             	shl    $0x5,%edx
    1e57:	81 c2 80 48 00 00    	add    $0x4880,%edx
    1e5d:	83 c2 04             	add    $0x4,%edx
    1e60:	50                   	push   %eax
    1e61:	52                   	push   %edx
    1e62:	68 e9 3b 00 00       	push   $0x3be9
    1e67:	6a 01                	push   $0x1
    1e69:	e8 58 eb ff ff       	call   9c6 <printf>
    1e6e:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    1e71:	83 ec 08             	sub    $0x8,%esp
    1e74:	68 4c 48 00 00       	push   $0x484c
    1e79:	68 80 48 00 00       	push   $0x4880
    1e7e:	e8 a5 19 00 00       	call   3828 <writeVariables>
    1e83:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    1e86:	e9 c2 00 00 00       	jmp    1f4d <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    1e8b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1e8e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1e91:	01 d0                	add    %edx,%eax
    1e93:	0f b6 00             	movzbl (%eax),%eax
    1e96:	84 c0                	test   %al,%al
    1e98:	75 1d                	jne    1eb7 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    1e9a:	83 ec 0c             	sub    $0xc,%esp
    1e9d:	68 f2 3b 00 00       	push   $0x3bf2
    1ea2:	6a 00                	push   $0x0
    1ea4:	6a 00                	push   $0x0
    1ea6:	6a 01                	push   $0x1
    1ea8:	6a 04                	push   $0x4
    1eaa:	e8 3f 12 00 00       	call   30ee <color_printf>
    1eaf:	83 c4 20             	add    $0x20,%esp
    1eb2:	e9 96 00 00 00       	jmp    1f4d <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    1eb7:	83 ec 0c             	sub    $0xc,%esp
    1eba:	68 08 3c 00 00       	push   $0x3c08
    1ebf:	6a 00                	push   $0x0
    1ec1:	6a 00                	push   $0x0
    1ec3:	6a 01                	push   $0x1
    1ec5:	6a 04                	push   $0x4
    1ec7:	e8 22 12 00 00       	call   30ee <color_printf>
    1ecc:	83 c4 20             	add    $0x20,%esp
    1ecf:	eb 7c                	jmp    1f4d <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1ed1:	83 ec 0c             	sub    $0xc,%esp
    1ed4:	68 29 3c 00 00       	push   $0x3c29
    1ed9:	6a 00                	push   $0x0
    1edb:	6a 00                	push   $0x0
    1edd:	6a 01                	push   $0x1
    1edf:	6a 04                	push   $0x4
    1ee1:	e8 08 12 00 00       	call   30ee <color_printf>
    1ee6:	83 c4 20             	add    $0x20,%esp
    1ee9:	eb 62                	jmp    1f4d <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    1eeb:	83 ec 0c             	sub    $0xc,%esp
    1eee:	68 29 3c 00 00       	push   $0x3c29
    1ef3:	6a 00                	push   $0x0
    1ef5:	6a 00                	push   $0x0
    1ef7:	6a 01                	push   $0x1
    1ef9:	6a 04                	push   $0x4
    1efb:	e8 ee 11 00 00       	call   30ee <color_printf>
    1f00:	83 c4 20             	add    $0x20,%esp
    1f03:	eb 48                	jmp    1f4d <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    1f05:	83 ec 0c             	sub    $0xc,%esp
    1f08:	ff 75 d4             	pushl  -0x2c(%ebp)
    1f0b:	e8 2b 01 00 00       	call   203b <Compute>
    1f10:	83 c4 10             	add    $0x10,%esp
    1f13:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    1f16:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    1f1c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1f20:	dd 1c 24             	fstpl  (%esp)
    1f23:	ff 75 ac             	pushl  -0x54(%ebp)
    1f26:	ff 75 a8             	pushl  -0x58(%ebp)
    1f29:	e8 96 f4 ff ff       	call   13c4 <isEqual>
    1f2e:	83 c4 10             	add    $0x10,%esp
    1f31:	85 c0                	test   %eax,%eax
    1f33:	75 18                	jne    1f4d <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    1f35:	ff 75 ac             	pushl  -0x54(%ebp)
    1f38:	ff 75 a8             	pushl  -0x58(%ebp)
    1f3b:	68 41 3c 00 00       	push   $0x3c41
    1f40:	6a 01                	push   $0x1
    1f42:	e8 7f ea ff ff       	call   9c6 <printf>
    1f47:	83 c4 10             	add    $0x10,%esp
    1f4a:	eb 01                	jmp    1f4d <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    1f4c:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    1f4d:	e8 c8 e7 ff ff       	call   71a <exit>

00001f52 <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    1f52:	55                   	push   %ebp
    1f53:	89 e5                	mov    %esp,%ebp
    1f55:	83 ec 04             	sub    $0x4,%esp
    1f58:	8b 45 08             	mov    0x8(%ebp),%eax
    1f5b:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    1f5e:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    1f62:	83 e8 23             	sub    $0x23,%eax
    1f65:	83 f8 0c             	cmp    $0xc,%eax
    1f68:	77 25                	ja     1f8f <GetLevel+0x3d>
    1f6a:	8b 04 85 48 3c 00 00 	mov    0x3c48(,%eax,4),%eax
    1f71:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    1f73:	b8 01 00 00 00       	mov    $0x1,%eax
    1f78:	eb 1a                	jmp    1f94 <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    1f7a:	b8 02 00 00 00       	mov    $0x2,%eax
    1f7f:	eb 13                	jmp    1f94 <GetLevel+0x42>
    case '(':
        return 0;
    1f81:	b8 00 00 00 00       	mov    $0x0,%eax
    1f86:	eb 0c                	jmp    1f94 <GetLevel+0x42>
    case '#':
        return -2;
    1f88:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1f8d:	eb 05                	jmp    1f94 <GetLevel+0x42>
    };
    return -1;
    1f8f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1f94:	c9                   	leave  
    1f95:	c3                   	ret    

00001f96 <Operate>:

double Operate(double a1, char op, double a2)
{
    1f96:	55                   	push   %ebp
    1f97:	89 e5                	mov    %esp,%ebp
    1f99:	83 ec 28             	sub    $0x28,%esp
    1f9c:	8b 45 10             	mov    0x10(%ebp),%eax
    1f9f:	8b 55 08             	mov    0x8(%ebp),%edx
    1fa2:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1fa5:	8b 55 0c             	mov    0xc(%ebp),%edx
    1fa8:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1fab:	88 45 ec             	mov    %al,-0x14(%ebp)
    1fae:	8b 45 14             	mov    0x14(%ebp),%eax
    1fb1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1fb4:	8b 45 18             	mov    0x18(%ebp),%eax
    1fb7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    1fba:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    1fbe:	83 f8 2b             	cmp    $0x2b,%eax
    1fc1:	74 18                	je     1fdb <Operate+0x45>
    1fc3:	83 f8 2b             	cmp    $0x2b,%eax
    1fc6:	7f 07                	jg     1fcf <Operate+0x39>
    1fc8:	83 f8 2a             	cmp    $0x2a,%eax
    1fcb:	74 1e                	je     1feb <Operate+0x55>
    1fcd:	eb 68                	jmp    2037 <Operate+0xa1>
    1fcf:	83 f8 2d             	cmp    $0x2d,%eax
    1fd2:	74 0f                	je     1fe3 <Operate+0x4d>
    1fd4:	83 f8 2f             	cmp    $0x2f,%eax
    1fd7:	74 1a                	je     1ff3 <Operate+0x5d>
    1fd9:	eb 5c                	jmp    2037 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    1fdb:	dd 45 f0             	fldl   -0x10(%ebp)
    1fde:	dc 45 e0             	faddl  -0x20(%ebp)
    1fe1:	eb 56                	jmp    2039 <Operate+0xa3>
    case '-':
        return a1 - a2;
    1fe3:	dd 45 f0             	fldl   -0x10(%ebp)
    1fe6:	dc 65 e0             	fsubl  -0x20(%ebp)
    1fe9:	eb 4e                	jmp    2039 <Operate+0xa3>
    case '*':
        return a1 * a2;
    1feb:	dd 45 f0             	fldl   -0x10(%ebp)
    1fee:	dc 4d e0             	fmull  -0x20(%ebp)
    1ff1:	eb 46                	jmp    2039 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    1ff3:	d9 ee                	fldz   
    1ff5:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    1ff9:	dd 1c 24             	fstpl  (%esp)
    1ffc:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fff:	ff 75 e0             	pushl  -0x20(%ebp)
    2002:	e8 bd f3 ff ff       	call   13c4 <isEqual>
    2007:	83 c4 10             	add    $0x10,%esp
    200a:	83 f8 01             	cmp    $0x1,%eax
    200d:	75 20                	jne    202f <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    200f:	83 ec 0c             	sub    $0xc,%esp
    2012:	68 7c 3c 00 00       	push   $0x3c7c
    2017:	6a 00                	push   $0x0
    2019:	6a 00                	push   $0x0
    201b:	6a 01                	push   $0x1
    201d:	6a 04                	push   $0x4
    201f:	e8 ca 10 00 00       	call   30ee <color_printf>
    2024:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    2027:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    202d:	eb 0a                	jmp    2039 <Operate+0xa3>
        }
        else
          return a1 / a2;
    202f:	dd 45 f0             	fldl   -0x10(%ebp)
    2032:	dc 75 e0             	fdivl  -0x20(%ebp)
    2035:	eb 02                	jmp    2039 <Operate+0xa3>
    };
    return 1;
    2037:	d9 e8                	fld1   
}
    2039:	c9                   	leave  
    203a:	c3                   	ret    

0000203b <Compute>:

double Compute(char *s)
{
    203b:	55                   	push   %ebp
    203c:	89 e5                	mov    %esp,%ebp
    203e:	53                   	push   %ebx
    203f:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    2045:	e8 44 14 00 00       	call   348e <dstack>
    204a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    204d:	e8 73 13 00 00       	call   33c5 <cstack>
    2052:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    2055:	83 ec 08             	sub    $0x8,%esp
    2058:	6a 23                	push   $0x23
    205a:	ff 75 e0             	pushl  -0x20(%ebp)
    205d:	e8 91 13 00 00       	call   33f3 <pushc>
    2062:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    2065:	83 ec 0c             	sub    $0xc,%esp
    2068:	ff 75 08             	pushl  0x8(%ebp)
    206b:	e8 e8 e4 ff ff       	call   558 <strlen>
    2070:	83 c4 10             	add    $0x10,%esp
    2073:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    2076:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    207d:	c7 05 60 48 00 00 00 	movl   $0x0,0x4860
    2084:	00 00 00 
    2087:	e9 58 05 00 00       	jmp    25e4 <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    208c:	a1 60 48 00 00       	mov    0x4860,%eax
    2091:	89 c2                	mov    %eax,%edx
    2093:	8b 45 08             	mov    0x8(%ebp),%eax
    2096:	01 d0                	add    %edx,%eax
    2098:	0f b6 00             	movzbl (%eax),%eax
    209b:	3c 24                	cmp    $0x24,%al
    209d:	0f 85 f8 01 00 00    	jne    229b <Compute+0x260>
        {
          is_minus = 0;
    20a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    20aa:	a1 60 48 00 00       	mov    0x4860,%eax
    20af:	83 c0 01             	add    $0x1,%eax
    20b2:	a3 60 48 00 00       	mov    %eax,0x4860
          if(s[g_pos] != '{')
    20b7:	a1 60 48 00 00       	mov    0x4860,%eax
    20bc:	89 c2                	mov    %eax,%edx
    20be:	8b 45 08             	mov    0x8(%ebp),%eax
    20c1:	01 d0                	add    %edx,%eax
    20c3:	0f b6 00             	movzbl (%eax),%eax
    20c6:	3c 7b                	cmp    $0x7b,%al
    20c8:	74 23                	je     20ed <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    20ca:	83 ec 0c             	sub    $0xc,%esp
    20cd:	68 94 3c 00 00       	push   $0x3c94
    20d2:	6a 00                	push   $0x0
    20d4:	6a 00                	push   $0x0
    20d6:	6a 01                	push   $0x1
    20d8:	6a 04                	push   $0x4
    20da:	e8 0f 10 00 00       	call   30ee <color_printf>
    20df:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    20e2:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    20e8:	e9 24 06 00 00       	jmp    2711 <Compute+0x6d6>
          }
          int i=g_pos+1;
    20ed:	a1 60 48 00 00       	mov    0x4860,%eax
    20f2:	83 c0 01             	add    $0x1,%eax
    20f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    20f8:	eb 13                	jmp    210d <Compute+0xd2>
          {
            if(s[i] == '}')
    20fa:	8b 55 f0             	mov    -0x10(%ebp),%edx
    20fd:	8b 45 08             	mov    0x8(%ebp),%eax
    2100:	01 d0                	add    %edx,%eax
    2102:	0f b6 00             	movzbl (%eax),%eax
    2105:	3c 7d                	cmp    $0x7d,%al
    2107:	74 0e                	je     2117 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    2109:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    210d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2110:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    2113:	7c e5                	jl     20fa <Compute+0xbf>
    2115:	eb 01                	jmp    2118 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    2117:	90                   	nop
          }
          if(s[i] != '}')
    2118:	8b 55 f0             	mov    -0x10(%ebp),%edx
    211b:	8b 45 08             	mov    0x8(%ebp),%eax
    211e:	01 d0                	add    %edx,%eax
    2120:	0f b6 00             	movzbl (%eax),%eax
    2123:	3c 7d                	cmp    $0x7d,%al
    2125:	74 23                	je     214a <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    2127:	83 ec 0c             	sub    $0xc,%esp
    212a:	68 a2 3c 00 00       	push   $0x3ca2
    212f:	6a 00                	push   $0x0
    2131:	6a 00                	push   $0x0
    2133:	6a 01                	push   $0x1
    2135:	6a 04                	push   $0x4
    2137:	e8 b2 0f 00 00       	call   30ee <color_printf>
    213c:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    213f:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    2145:	e9 c7 05 00 00       	jmp    2711 <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    214a:	a1 60 48 00 00       	mov    0x4860,%eax
    214f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2152:	29 c2                	sub    %eax,%edx
    2154:	89 d0                	mov    %edx,%eax
    2156:	83 e8 01             	sub    $0x1,%eax
    2159:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    215c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    2163:	eb 27                	jmp    218c <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    2165:	8b 15 60 48 00 00    	mov    0x4860,%edx
    216b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    216e:	01 d0                	add    %edx,%eax
    2170:	8d 50 01             	lea    0x1(%eax),%edx
    2173:	8b 45 08             	mov    0x8(%ebp),%eax
    2176:	01 d0                	add    %edx,%eax
    2178:	0f b6 00             	movzbl (%eax),%eax
    217b:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    2181:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2184:	01 ca                	add    %ecx,%edx
    2186:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    2188:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    218c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    218f:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    2192:	7c d1                	jl     2165 <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    2194:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    219a:	8b 45 8c             	mov    -0x74(%ebp),%eax
    219d:	01 d0                	add    %edx,%eax
    219f:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    21a2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    21a9:	a1 4c 48 00 00       	mov    0x484c,%eax
    21ae:	85 c0                	test   %eax,%eax
    21b0:	75 40                	jne    21f2 <Compute+0x1b7>
            readVariables(variables,&v_num);
    21b2:	83 ec 08             	sub    $0x8,%esp
    21b5:	68 4c 48 00 00       	push   $0x484c
    21ba:	68 80 48 00 00       	push   $0x4880
    21bf:	e8 b0 13 00 00       	call   3574 <readVariables>
    21c4:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    21c7:	eb 29                	jmp    21f2 <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    21c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    21cc:	c1 e0 05             	shl    $0x5,%eax
    21cf:	05 80 48 00 00       	add    $0x4880,%eax
    21d4:	8d 50 04             	lea    0x4(%eax),%edx
    21d7:	83 ec 08             	sub    $0x8,%esp
    21da:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    21e0:	50                   	push   %eax
    21e1:	52                   	push   %edx
    21e2:	e8 32 e3 ff ff       	call   519 <strcmp>
    21e7:	83 c4 10             	add    $0x10,%esp
    21ea:	85 c0                	test   %eax,%eax
    21ec:	74 10                	je     21fe <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    21ee:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    21f2:	a1 4c 48 00 00       	mov    0x484c,%eax
    21f7:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    21fa:	7c cd                	jl     21c9 <Compute+0x18e>
    21fc:	eb 01                	jmp    21ff <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    21fe:	90                   	nop
          }
          if(index == v_num) //no such variable
    21ff:	a1 4c 48 00 00       	mov    0x484c,%eax
    2204:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    2207:	75 2a                	jne    2233 <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    2209:	83 ec 08             	sub    $0x8,%esp
    220c:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    2212:	50                   	push   %eax
    2213:	68 b0 3c 00 00       	push   $0x3cb0
    2218:	6a 00                	push   $0x0
    221a:	6a 00                	push   $0x0
    221c:	6a 01                	push   $0x1
    221e:	6a 04                	push   $0x4
    2220:	e8 c9 0e 00 00       	call   30ee <color_printf>
    2225:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    2228:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    222e:	e9 de 04 00 00       	jmp    2711 <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    2233:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2236:	c1 e0 05             	shl    $0x5,%eax
    2239:	05 80 48 00 00       	add    $0x4880,%eax
    223e:	8b 00                	mov    (%eax),%eax
    2240:	83 f8 02             	cmp    $0x2,%eax
    2243:	75 23                	jne    2268 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    2245:	83 ec 0c             	sub    $0xc,%esp
    2248:	68 ca 3c 00 00       	push   $0x3cca
    224d:	6a 00                	push   $0x0
    224f:	6a 00                	push   $0x0
    2251:	6a 01                	push   $0x1
    2253:	6a 04                	push   $0x4
    2255:	e8 94 0e 00 00       	call   30ee <color_printf>
    225a:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    225d:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    2263:	e9 a9 04 00 00       	jmp    2711 <Compute+0x6d6>
          }
          g_pos = i+1;
    2268:	8b 45 f0             	mov    -0x10(%ebp),%eax
    226b:	83 c0 01             	add    $0x1,%eax
    226e:	a3 60 48 00 00       	mov    %eax,0x4860
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    2273:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2276:	c1 e0 05             	shl    $0x5,%eax
    2279:	05 90 48 00 00       	add    $0x4890,%eax
    227e:	dd 40 08             	fldl   0x8(%eax)
    2281:	83 ec 04             	sub    $0x4,%esp
    2284:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2288:	dd 1c 24             	fstpl  (%esp)
    228b:	ff 75 e4             	pushl  -0x1c(%ebp)
    228e:	e8 2f 12 00 00       	call   34c2 <pushd>
    2293:	83 c4 10             	add    $0x10,%esp
    2296:	e9 49 03 00 00       	jmp    25e4 <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    229b:	a1 60 48 00 00       	mov    0x4860,%eax
    22a0:	89 c2                	mov    %eax,%edx
    22a2:	8b 45 08             	mov    0x8(%ebp),%eax
    22a5:	01 d0                	add    %edx,%eax
    22a7:	0f b6 00             	movzbl (%eax),%eax
    22aa:	3c 2d                	cmp    $0x2d,%al
    22ac:	75 3f                	jne    22ed <Compute+0x2b2>
    22ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    22b2:	74 39                	je     22ed <Compute+0x2b2>
        {
            pushd(opnd,0);
    22b4:	83 ec 04             	sub    $0x4,%esp
    22b7:	d9 ee                	fldz   
    22b9:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    22bd:	dd 1c 24             	fstpl  (%esp)
    22c0:	ff 75 e4             	pushl  -0x1c(%ebp)
    22c3:	e8 fa 11 00 00       	call   34c2 <pushd>
    22c8:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    22cb:	83 ec 08             	sub    $0x8,%esp
    22ce:	6a 2d                	push   $0x2d
    22d0:	ff 75 e0             	pushl  -0x20(%ebp)
    22d3:	e8 1b 11 00 00       	call   33f3 <pushc>
    22d8:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    22db:	a1 60 48 00 00       	mov    0x4860,%eax
    22e0:	83 c0 01             	add    $0x1,%eax
    22e3:	a3 60 48 00 00       	mov    %eax,0x4860
    22e8:	e9 f7 02 00 00       	jmp    25e4 <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    22ed:	a1 60 48 00 00       	mov    0x4860,%eax
    22f2:	89 c2                	mov    %eax,%edx
    22f4:	8b 45 08             	mov    0x8(%ebp),%eax
    22f7:	01 d0                	add    %edx,%eax
    22f9:	0f b6 00             	movzbl (%eax),%eax
    22fc:	3c 29                	cmp    $0x29,%al
    22fe:	0f 85 01 01 00 00    	jne    2405 <Compute+0x3ca>
        {
            is_minus = 0;
    2304:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    230b:	a1 60 48 00 00       	mov    0x4860,%eax
    2310:	83 c0 01             	add    $0x1,%eax
    2313:	a3 60 48 00 00       	mov    %eax,0x4860
            while (topc(optr) != '(')
    2318:	e9 bf 00 00 00       	jmp    23dc <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    231d:	83 ec 0c             	sub    $0xc,%esp
    2320:	ff 75 e4             	pushl  -0x1c(%ebp)
    2323:	e8 37 12 00 00       	call   355f <topd>
    2328:	83 c4 10             	add    $0x10,%esp
    232b:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    232e:	83 ec 0c             	sub    $0xc,%esp
    2331:	ff 75 e4             	pushl  -0x1c(%ebp)
    2334:	e8 dd 11 00 00       	call   3516 <popd>
    2339:	dd d8                	fstp   %st(0)
    233b:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    233e:	83 ec 0c             	sub    $0xc,%esp
    2341:	ff 75 e4             	pushl  -0x1c(%ebp)
    2344:	e8 16 12 00 00       	call   355f <topd>
    2349:	83 c4 10             	add    $0x10,%esp
    234c:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    234f:	83 ec 0c             	sub    $0xc,%esp
    2352:	ff 75 e4             	pushl  -0x1c(%ebp)
    2355:	e8 bc 11 00 00       	call   3516 <popd>
    235a:	dd d8                	fstp   %st(0)
    235c:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    235f:	83 ec 0c             	sub    $0xc,%esp
    2362:	ff 75 e0             	pushl  -0x20(%ebp)
    2365:	e8 11 11 00 00       	call   347b <topc>
    236a:	83 c4 10             	add    $0x10,%esp
    236d:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    2370:	83 ec 0c             	sub    $0xc,%esp
    2373:	ff 75 e0             	pushl  -0x20(%ebp)
    2376:	e8 be 10 00 00       	call   3439 <popc>
    237b:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    237e:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    2382:	83 ec 0c             	sub    $0xc,%esp
    2385:	ff 75 d4             	pushl  -0x2c(%ebp)
    2388:	ff 75 d0             	pushl  -0x30(%ebp)
    238b:	50                   	push   %eax
    238c:	ff 75 cc             	pushl  -0x34(%ebp)
    238f:	ff 75 c8             	pushl  -0x38(%ebp)
    2392:	e8 ff fb ff ff       	call   1f96 <Operate>
    2397:	83 c4 20             	add    $0x20,%esp
    239a:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    239d:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    23a3:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    23a7:	dd 1c 24             	fstpl  (%esp)
    23aa:	ff 75 bc             	pushl  -0x44(%ebp)
    23ad:	ff 75 b8             	pushl  -0x48(%ebp)
    23b0:	e8 0f f0 ff ff       	call   13c4 <isEqual>
    23b5:	83 c4 10             	add    $0x10,%esp
    23b8:	83 f8 01             	cmp    $0x1,%eax
    23bb:	75 0b                	jne    23c8 <Compute+0x38d>
                  return WRONG_ANS;
    23bd:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    23c3:	e9 49 03 00 00       	jmp    2711 <Compute+0x6d6>
                pushd(opnd,result);
    23c8:	83 ec 04             	sub    $0x4,%esp
    23cb:	ff 75 bc             	pushl  -0x44(%ebp)
    23ce:	ff 75 b8             	pushl  -0x48(%ebp)
    23d1:	ff 75 e4             	pushl  -0x1c(%ebp)
    23d4:	e8 e9 10 00 00       	call   34c2 <pushd>
    23d9:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    23dc:	83 ec 0c             	sub    $0xc,%esp
    23df:	ff 75 e0             	pushl  -0x20(%ebp)
    23e2:	e8 94 10 00 00       	call   347b <topc>
    23e7:	83 c4 10             	add    $0x10,%esp
    23ea:	3c 28                	cmp    $0x28,%al
    23ec:	0f 85 2b ff ff ff    	jne    231d <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    23f2:	83 ec 0c             	sub    $0xc,%esp
    23f5:	ff 75 e0             	pushl  -0x20(%ebp)
    23f8:	e8 3c 10 00 00       	call   3439 <popc>
    23fd:	83 c4 10             	add    $0x10,%esp
    2400:	e9 df 01 00 00       	jmp    25e4 <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    2405:	a1 60 48 00 00       	mov    0x4860,%eax
    240a:	89 c2                	mov    %eax,%edx
    240c:	8b 45 08             	mov    0x8(%ebp),%eax
    240f:	01 d0                	add    %edx,%eax
    2411:	0f b6 00             	movzbl (%eax),%eax
    2414:	3c 2f                	cmp    $0x2f,%al
    2416:	7e 49                	jle    2461 <Compute+0x426>
    2418:	a1 60 48 00 00       	mov    0x4860,%eax
    241d:	89 c2                	mov    %eax,%edx
    241f:	8b 45 08             	mov    0x8(%ebp),%eax
    2422:	01 d0                	add    %edx,%eax
    2424:	0f b6 00             	movzbl (%eax),%eax
    2427:	3c 39                	cmp    $0x39,%al
    2429:	7f 36                	jg     2461 <Compute+0x426>
        {
            is_minus = 0;
    242b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    2432:	83 ec 08             	sub    $0x8,%esp
    2435:	68 60 48 00 00       	push   $0x4860
    243a:	ff 75 08             	pushl  0x8(%ebp)
    243d:	e8 c3 eb ff ff       	call   1005 <Translation>
    2442:	83 c4 10             	add    $0x10,%esp
    2445:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    2448:	83 ec 04             	sub    $0x4,%esp
    244b:	ff 75 b4             	pushl  -0x4c(%ebp)
    244e:	ff 75 b0             	pushl  -0x50(%ebp)
    2451:	ff 75 e4             	pushl  -0x1c(%ebp)
    2454:	e8 69 10 00 00       	call   34c2 <pushd>
    2459:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    245c:	e9 83 01 00 00       	jmp    25e4 <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    2461:	a1 60 48 00 00       	mov    0x4860,%eax
    2466:	89 c2                	mov    %eax,%edx
    2468:	8b 45 08             	mov    0x8(%ebp),%eax
    246b:	01 d0                	add    %edx,%eax
    246d:	0f b6 00             	movzbl (%eax),%eax
    2470:	3c 28                	cmp    $0x28,%al
    2472:	0f 85 f9 00 00 00    	jne    2571 <Compute+0x536>
        {
            is_minus = 1;
    2478:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    247f:	a1 60 48 00 00       	mov    0x4860,%eax
    2484:	89 c2                	mov    %eax,%edx
    2486:	8b 45 08             	mov    0x8(%ebp),%eax
    2489:	01 d0                	add    %edx,%eax
    248b:	0f b6 00             	movzbl (%eax),%eax
    248e:	0f be c0             	movsbl %al,%eax
    2491:	83 ec 08             	sub    $0x8,%esp
    2494:	50                   	push   %eax
    2495:	ff 75 e0             	pushl  -0x20(%ebp)
    2498:	e8 56 0f 00 00       	call   33f3 <pushc>
    249d:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    24a0:	a1 60 48 00 00       	mov    0x4860,%eax
    24a5:	83 c0 01             	add    $0x1,%eax
    24a8:	a3 60 48 00 00       	mov    %eax,0x4860
    24ad:	e9 32 01 00 00       	jmp    25e4 <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    24b2:	83 ec 0c             	sub    $0xc,%esp
    24b5:	ff 75 e4             	pushl  -0x1c(%ebp)
    24b8:	e8 a2 10 00 00       	call   355f <topd>
    24bd:	83 c4 10             	add    $0x10,%esp
    24c0:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    24c3:	83 ec 0c             	sub    $0xc,%esp
    24c6:	ff 75 e4             	pushl  -0x1c(%ebp)
    24c9:	e8 48 10 00 00       	call   3516 <popd>
    24ce:	dd d8                	fstp   %st(0)
    24d0:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    24d3:	83 ec 0c             	sub    $0xc,%esp
    24d6:	ff 75 e4             	pushl  -0x1c(%ebp)
    24d9:	e8 81 10 00 00       	call   355f <topd>
    24de:	83 c4 10             	add    $0x10,%esp
    24e1:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    24e4:	83 ec 0c             	sub    $0xc,%esp
    24e7:	ff 75 e4             	pushl  -0x1c(%ebp)
    24ea:	e8 27 10 00 00       	call   3516 <popd>
    24ef:	dd d8                	fstp   %st(0)
    24f1:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    24f4:	83 ec 0c             	sub    $0xc,%esp
    24f7:	ff 75 e0             	pushl  -0x20(%ebp)
    24fa:	e8 7c 0f 00 00       	call   347b <topc>
    24ff:	83 c4 10             	add    $0x10,%esp
    2502:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    2505:	83 ec 0c             	sub    $0xc,%esp
    2508:	ff 75 e0             	pushl  -0x20(%ebp)
    250b:	e8 29 0f 00 00       	call   3439 <popc>
    2510:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    2513:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    2517:	83 ec 0c             	sub    $0xc,%esp
    251a:	ff 75 ac             	pushl  -0x54(%ebp)
    251d:	ff 75 a8             	pushl  -0x58(%ebp)
    2520:	50                   	push   %eax
    2521:	ff 75 a4             	pushl  -0x5c(%ebp)
    2524:	ff 75 a0             	pushl  -0x60(%ebp)
    2527:	e8 6a fa ff ff       	call   1f96 <Operate>
    252c:	83 c4 20             	add    $0x20,%esp
    252f:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    2532:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    2538:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    253c:	dd 1c 24             	fstpl  (%esp)
    253f:	ff 75 94             	pushl  -0x6c(%ebp)
    2542:	ff 75 90             	pushl  -0x70(%ebp)
    2545:	e8 7a ee ff ff       	call   13c4 <isEqual>
    254a:	83 c4 10             	add    $0x10,%esp
    254d:	83 f8 01             	cmp    $0x1,%eax
    2550:	75 0b                	jne    255d <Compute+0x522>
                  return WRONG_ANS;
    2552:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    2558:	e9 b4 01 00 00       	jmp    2711 <Compute+0x6d6>
                pushd(opnd,result);
    255d:	83 ec 04             	sub    $0x4,%esp
    2560:	ff 75 94             	pushl  -0x6c(%ebp)
    2563:	ff 75 90             	pushl  -0x70(%ebp)
    2566:	ff 75 e4             	pushl  -0x1c(%ebp)
    2569:	e8 54 0f 00 00       	call   34c2 <pushd>
    256e:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    2571:	a1 60 48 00 00       	mov    0x4860,%eax
    2576:	89 c2                	mov    %eax,%edx
    2578:	8b 45 08             	mov    0x8(%ebp),%eax
    257b:	01 d0                	add    %edx,%eax
    257d:	0f b6 00             	movzbl (%eax),%eax
    2580:	0f be c0             	movsbl %al,%eax
    2583:	83 ec 0c             	sub    $0xc,%esp
    2586:	50                   	push   %eax
    2587:	e8 c6 f9 ff ff       	call   1f52 <GetLevel>
    258c:	83 c4 10             	add    $0x10,%esp
    258f:	89 c3                	mov    %eax,%ebx
    2591:	83 ec 0c             	sub    $0xc,%esp
    2594:	ff 75 e0             	pushl  -0x20(%ebp)
    2597:	e8 df 0e 00 00       	call   347b <topc>
    259c:	83 c4 10             	add    $0x10,%esp
    259f:	0f be c0             	movsbl %al,%eax
    25a2:	83 ec 0c             	sub    $0xc,%esp
    25a5:	50                   	push   %eax
    25a6:	e8 a7 f9 ff ff       	call   1f52 <GetLevel>
    25ab:	83 c4 10             	add    $0x10,%esp
    25ae:	39 c3                	cmp    %eax,%ebx
    25b0:	0f 8e fc fe ff ff    	jle    24b2 <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    25b6:	a1 60 48 00 00       	mov    0x4860,%eax
    25bb:	89 c2                	mov    %eax,%edx
    25bd:	8b 45 08             	mov    0x8(%ebp),%eax
    25c0:	01 d0                	add    %edx,%eax
    25c2:	0f b6 00             	movzbl (%eax),%eax
    25c5:	0f be c0             	movsbl %al,%eax
    25c8:	83 ec 08             	sub    $0x8,%esp
    25cb:	50                   	push   %eax
    25cc:	ff 75 e0             	pushl  -0x20(%ebp)
    25cf:	e8 1f 0e 00 00       	call   33f3 <pushc>
    25d4:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    25d7:	a1 60 48 00 00       	mov    0x4860,%eax
    25dc:	83 c0 01             	add    $0x1,%eax
    25df:	a3 60 48 00 00       	mov    %eax,0x4860
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    25e4:	a1 60 48 00 00       	mov    0x4860,%eax
    25e9:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    25ec:	0f 8c 9a fa ff ff    	jl     208c <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    25f2:	e9 da 00 00 00       	jmp    26d1 <Compute+0x696>
    {
        double a2 = topd(opnd);
    25f7:	83 ec 0c             	sub    $0xc,%esp
    25fa:	ff 75 e4             	pushl  -0x1c(%ebp)
    25fd:	e8 5d 0f 00 00       	call   355f <topd>
    2602:	83 c4 10             	add    $0x10,%esp
    2605:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    2608:	83 ec 0c             	sub    $0xc,%esp
    260b:	ff 75 e4             	pushl  -0x1c(%ebp)
    260e:	e8 03 0f 00 00       	call   3516 <popd>
    2613:	dd d8                	fstp   %st(0)
    2615:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    2618:	83 ec 0c             	sub    $0xc,%esp
    261b:	ff 75 e4             	pushl  -0x1c(%ebp)
    261e:	e8 3c 0f 00 00       	call   355f <topd>
    2623:	83 c4 10             	add    $0x10,%esp
    2626:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    262c:	83 ec 0c             	sub    $0xc,%esp
    262f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2632:	e8 df 0e 00 00       	call   3516 <popd>
    2637:	dd d8                	fstp   %st(0)
    2639:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    263c:	83 ec 0c             	sub    $0xc,%esp
    263f:	ff 75 e0             	pushl  -0x20(%ebp)
    2642:	e8 34 0e 00 00       	call   347b <topc>
    2647:	83 c4 10             	add    $0x10,%esp
    264a:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    2650:	83 ec 0c             	sub    $0xc,%esp
    2653:	ff 75 e0             	pushl  -0x20(%ebp)
    2656:	e8 de 0d 00 00       	call   3439 <popc>
    265b:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    265e:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    2665:	83 ec 0c             	sub    $0xc,%esp
    2668:	ff 75 84             	pushl  -0x7c(%ebp)
    266b:	ff 75 80             	pushl  -0x80(%ebp)
    266e:	50                   	push   %eax
    266f:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    2675:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    267b:	e8 16 f9 ff ff       	call   1f96 <Operate>
    2680:	83 c4 20             	add    $0x20,%esp
    2683:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    2689:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    268f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2693:	dd 1c 24             	fstpl  (%esp)
    2696:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    269c:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    26a2:	e8 1d ed ff ff       	call   13c4 <isEqual>
    26a7:	83 c4 10             	add    $0x10,%esp
    26aa:	83 f8 01             	cmp    $0x1,%eax
    26ad:	75 08                	jne    26b7 <Compute+0x67c>
          return WRONG_ANS;
    26af:	dd 05 f0 3c 00 00    	fldl   0x3cf0
    26b5:	eb 5a                	jmp    2711 <Compute+0x6d6>
        pushd(opnd,result);
    26b7:	83 ec 04             	sub    $0x4,%esp
    26ba:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    26c0:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    26c6:	ff 75 e4             	pushl  -0x1c(%ebp)
    26c9:	e8 f4 0d 00 00       	call   34c2 <pushd>
    26ce:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    26d1:	83 ec 0c             	sub    $0xc,%esp
    26d4:	ff 75 e0             	pushl  -0x20(%ebp)
    26d7:	e8 9f 0d 00 00       	call   347b <topc>
    26dc:	83 c4 10             	add    $0x10,%esp
    26df:	3c 23                	cmp    $0x23,%al
    26e1:	0f 85 10 ff ff ff    	jne    25f7 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    26e7:	83 ec 0c             	sub    $0xc,%esp
    26ea:	ff 75 e4             	pushl  -0x1c(%ebp)
    26ed:	e8 94 e4 ff ff       	call   b86 <free>
    26f2:	83 c4 10             	add    $0x10,%esp
    free(optr);
    26f5:	83 ec 0c             	sub    $0xc,%esp
    26f8:	ff 75 e0             	pushl  -0x20(%ebp)
    26fb:	e8 86 e4 ff ff       	call   b86 <free>
    2700:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    2703:	83 ec 0c             	sub    $0xc,%esp
    2706:	ff 75 e4             	pushl  -0x1c(%ebp)
    2709:	e8 51 0e 00 00       	call   355f <topd>
    270e:	83 c4 10             	add    $0x10,%esp
}
    2711:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2714:	c9                   	leave  
    2715:	c3                   	ret    

00002716 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    2716:	55                   	push   %ebp
    2717:	89 e5                	mov    %esp,%ebp
    2719:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    271c:	8b 45 08             	mov    0x8(%ebp),%eax
    271f:	8b 00                	mov    (%eax),%eax
    2721:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2724:	eb 04                	jmp    272a <gettoken+0x14>
    s++;
    2726:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    272a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    272d:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2730:	73 1e                	jae    2750 <gettoken+0x3a>
    2732:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2735:	0f b6 00             	movzbl (%eax),%eax
    2738:	0f be c0             	movsbl %al,%eax
    273b:	83 ec 08             	sub    $0x8,%esp
    273e:	50                   	push   %eax
    273f:	68 14 48 00 00       	push   $0x4814
    2744:	e8 50 de ff ff       	call   599 <strchr>
    2749:	83 c4 10             	add    $0x10,%esp
    274c:	85 c0                	test   %eax,%eax
    274e:	75 d6                	jne    2726 <gettoken+0x10>
    s++;
  if(q)
    2750:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2754:	74 08                	je     275e <gettoken+0x48>
    *q = s;
    2756:	8b 45 10             	mov    0x10(%ebp),%eax
    2759:	8b 55 f4             	mov    -0xc(%ebp),%edx
    275c:	89 10                	mov    %edx,(%eax)
  ret = *s;
    275e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2761:	0f b6 00             	movzbl (%eax),%eax
    2764:	0f be c0             	movsbl %al,%eax
    2767:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    276a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    276d:	0f b6 00             	movzbl (%eax),%eax
    2770:	0f be c0             	movsbl %al,%eax
    2773:	83 f8 29             	cmp    $0x29,%eax
    2776:	7f 14                	jg     278c <gettoken+0x76>
    2778:	83 f8 28             	cmp    $0x28,%eax
    277b:	7d 28                	jge    27a5 <gettoken+0x8f>
    277d:	85 c0                	test   %eax,%eax
    277f:	0f 84 94 00 00 00    	je     2819 <gettoken+0x103>
    2785:	83 f8 26             	cmp    $0x26,%eax
    2788:	74 1b                	je     27a5 <gettoken+0x8f>
    278a:	eb 3a                	jmp    27c6 <gettoken+0xb0>
    278c:	83 f8 3e             	cmp    $0x3e,%eax
    278f:	74 1a                	je     27ab <gettoken+0x95>
    2791:	83 f8 3e             	cmp    $0x3e,%eax
    2794:	7f 0a                	jg     27a0 <gettoken+0x8a>
    2796:	83 e8 3b             	sub    $0x3b,%eax
    2799:	83 f8 01             	cmp    $0x1,%eax
    279c:	77 28                	ja     27c6 <gettoken+0xb0>
    279e:	eb 05                	jmp    27a5 <gettoken+0x8f>
    27a0:	83 f8 7c             	cmp    $0x7c,%eax
    27a3:	75 21                	jne    27c6 <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    27a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    27a9:	eb 75                	jmp    2820 <gettoken+0x10a>
  case '>':
    s++;
    27ab:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    27af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27b2:	0f b6 00             	movzbl (%eax),%eax
    27b5:	3c 3e                	cmp    $0x3e,%al
    27b7:	75 63                	jne    281c <gettoken+0x106>
      ret = '+';
    27b9:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    27c0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    27c4:	eb 56                	jmp    281c <gettoken+0x106>
  default:
    ret = 'a';
    27c6:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    27cd:	eb 04                	jmp    27d3 <gettoken+0xbd>
      s++;
    27cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    27d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
    27d9:	73 44                	jae    281f <gettoken+0x109>
    27db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27de:	0f b6 00             	movzbl (%eax),%eax
    27e1:	0f be c0             	movsbl %al,%eax
    27e4:	83 ec 08             	sub    $0x8,%esp
    27e7:	50                   	push   %eax
    27e8:	68 14 48 00 00       	push   $0x4814
    27ed:	e8 a7 dd ff ff       	call   599 <strchr>
    27f2:	83 c4 10             	add    $0x10,%esp
    27f5:	85 c0                	test   %eax,%eax
    27f7:	75 26                	jne    281f <gettoken+0x109>
    27f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27fc:	0f b6 00             	movzbl (%eax),%eax
    27ff:	0f be c0             	movsbl %al,%eax
    2802:	83 ec 08             	sub    $0x8,%esp
    2805:	50                   	push   %eax
    2806:	68 1c 48 00 00       	push   $0x481c
    280b:	e8 89 dd ff ff       	call   599 <strchr>
    2810:	83 c4 10             	add    $0x10,%esp
    2813:	85 c0                	test   %eax,%eax
    2815:	74 b8                	je     27cf <gettoken+0xb9>
      s++;
    break;
    2817:	eb 06                	jmp    281f <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    2819:	90                   	nop
    281a:	eb 04                	jmp    2820 <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    281c:	90                   	nop
    281d:	eb 01                	jmp    2820 <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    281f:	90                   	nop
  }
  if(eq)
    2820:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2824:	74 0e                	je     2834 <gettoken+0x11e>
    *eq = s;
    2826:	8b 45 14             	mov    0x14(%ebp),%eax
    2829:	8b 55 f4             	mov    -0xc(%ebp),%edx
    282c:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    282e:	eb 04                	jmp    2834 <gettoken+0x11e>
    s++;
    2830:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    2834:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2837:	3b 45 0c             	cmp    0xc(%ebp),%eax
    283a:	73 1e                	jae    285a <gettoken+0x144>
    283c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    283f:	0f b6 00             	movzbl (%eax),%eax
    2842:	0f be c0             	movsbl %al,%eax
    2845:	83 ec 08             	sub    $0x8,%esp
    2848:	50                   	push   %eax
    2849:	68 14 48 00 00       	push   $0x4814
    284e:	e8 46 dd ff ff       	call   599 <strchr>
    2853:	83 c4 10             	add    $0x10,%esp
    2856:	85 c0                	test   %eax,%eax
    2858:	75 d6                	jne    2830 <gettoken+0x11a>
    s++;
  *ps = s;
    285a:	8b 45 08             	mov    0x8(%ebp),%eax
    285d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2860:	89 10                	mov    %edx,(%eax)
  return ret;
    2862:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2865:	c9                   	leave  
    2866:	c3                   	ret    

00002867 <peek>:

int peek(char **ps, char *es, char *toks)
{
    2867:	55                   	push   %ebp
    2868:	89 e5                	mov    %esp,%ebp
    286a:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    286d:	8b 45 08             	mov    0x8(%ebp),%eax
    2870:	8b 00                	mov    (%eax),%eax
    2872:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    2875:	eb 04                	jmp    287b <peek+0x14>
    s++;
    2877:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    287b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    287e:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2881:	73 1e                	jae    28a1 <peek+0x3a>
    2883:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2886:	0f b6 00             	movzbl (%eax),%eax
    2889:	0f be c0             	movsbl %al,%eax
    288c:	83 ec 08             	sub    $0x8,%esp
    288f:	50                   	push   %eax
    2890:	68 14 48 00 00       	push   $0x4814
    2895:	e8 ff dc ff ff       	call   599 <strchr>
    289a:	83 c4 10             	add    $0x10,%esp
    289d:	85 c0                	test   %eax,%eax
    289f:	75 d6                	jne    2877 <peek+0x10>
    s++;
  *ps = s;
    28a1:	8b 45 08             	mov    0x8(%ebp),%eax
    28a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    28a7:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    28a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28ac:	0f b6 00             	movzbl (%eax),%eax
    28af:	84 c0                	test   %al,%al
    28b1:	74 23                	je     28d6 <peek+0x6f>
    28b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28b6:	0f b6 00             	movzbl (%eax),%eax
    28b9:	0f be c0             	movsbl %al,%eax
    28bc:	83 ec 08             	sub    $0x8,%esp
    28bf:	50                   	push   %eax
    28c0:	ff 75 10             	pushl  0x10(%ebp)
    28c3:	e8 d1 dc ff ff       	call   599 <strchr>
    28c8:	83 c4 10             	add    $0x10,%esp
    28cb:	85 c0                	test   %eax,%eax
    28cd:	74 07                	je     28d6 <peek+0x6f>
    28cf:	b8 01 00 00 00       	mov    $0x1,%eax
    28d4:	eb 05                	jmp    28db <peek+0x74>
    28d6:	b8 00 00 00 00       	mov    $0x0,%eax
}
    28db:	c9                   	leave  
    28dc:	c3                   	ret    

000028dd <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    28dd:	55                   	push   %ebp
    28de:	89 e5                	mov    %esp,%ebp
    28e0:	53                   	push   %ebx
    28e1:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    28e4:	8b 5d 08             	mov    0x8(%ebp),%ebx
    28e7:	8b 45 08             	mov    0x8(%ebp),%eax
    28ea:	83 ec 0c             	sub    $0xc,%esp
    28ed:	50                   	push   %eax
    28ee:	e8 65 dc ff ff       	call   558 <strlen>
    28f3:	83 c4 10             	add    $0x10,%esp
    28f6:	01 d8                	add    %ebx,%eax
    28f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    28fb:	8b 45 08             	mov    0x8(%ebp),%eax
    28fe:	0f b6 00             	movzbl (%eax),%eax
    2901:	3c 25                	cmp    $0x25,%al
    2903:	75 5d                	jne    2962 <parsecmd+0x85>
  {
    int len = strlen(s);
    2905:	8b 45 08             	mov    0x8(%ebp),%eax
    2908:	83 ec 0c             	sub    $0xc,%esp
    290b:	50                   	push   %eax
    290c:	e8 47 dc ff ff       	call   558 <strlen>
    2911:	83 c4 10             	add    $0x10,%esp
    2914:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    2917:	8b 45 f0             	mov    -0x10(%ebp),%eax
    291a:	83 ec 0c             	sub    $0xc,%esp
    291d:	50                   	push   %eax
    291e:	e8 a5 e3 ff ff       	call   cc8 <malloc>
    2923:	83 c4 10             	add    $0x10,%esp
    2926:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    2929:	8b 45 08             	mov    0x8(%ebp),%eax
    292c:	83 c0 01             	add    $0x1,%eax
    292f:	83 ec 08             	sub    $0x8,%esp
    2932:	50                   	push   %eax
    2933:	ff 75 ec             	pushl  -0x14(%ebp)
    2936:	e8 ae db ff ff       	call   4e9 <strcpy>
    293b:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    293e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2941:	8d 50 fe             	lea    -0x2(%eax),%edx
    2944:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2947:	01 d0                	add    %edx,%eax
    2949:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    294c:	83 ec 0c             	sub    $0xc,%esp
    294f:	ff 75 ec             	pushl  -0x14(%ebp)
    2952:	e8 59 e9 ff ff       	call   12b0 <calcmd>
    2957:	83 c4 10             	add    $0x10,%esp
    295a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    295d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2960:	eb 6b                	jmp    29cd <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    2962:	83 ec 08             	sub    $0x8,%esp
    2965:	ff 75 f4             	pushl  -0xc(%ebp)
    2968:	8d 45 08             	lea    0x8(%ebp),%eax
    296b:	50                   	push   %eax
    296c:	e8 61 00 00 00       	call   29d2 <parseline>
    2971:	83 c4 10             	add    $0x10,%esp
    2974:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    2977:	83 ec 04             	sub    $0x4,%esp
    297a:	68 f8 3c 00 00       	push   $0x3cf8
    297f:	ff 75 f4             	pushl  -0xc(%ebp)
    2982:	8d 45 08             	lea    0x8(%ebp),%eax
    2985:	50                   	push   %eax
    2986:	e8 dc fe ff ff       	call   2867 <peek>
    298b:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    298e:	8b 45 08             	mov    0x8(%ebp),%eax
    2991:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2994:	74 26                	je     29bc <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    2996:	8b 45 08             	mov    0x8(%ebp),%eax
    2999:	83 ec 04             	sub    $0x4,%esp
    299c:	50                   	push   %eax
    299d:	68 f9 3c 00 00       	push   $0x3cf9
    29a2:	6a 02                	push   $0x2
    29a4:	e8 1d e0 ff ff       	call   9c6 <printf>
    29a9:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    29ac:	83 ec 0c             	sub    $0xc,%esp
    29af:	68 08 3d 00 00       	push   $0x3d08
    29b4:	e8 f2 e3 ff ff       	call   dab <panic1>
    29b9:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    29bc:	83 ec 0c             	sub    $0xc,%esp
    29bf:	ff 75 e4             	pushl  -0x1c(%ebp)
    29c2:	e8 eb 03 00 00       	call   2db2 <nulterminate>
    29c7:	83 c4 10             	add    $0x10,%esp
  return cmd;
    29ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    29cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    29d0:	c9                   	leave  
    29d1:	c3                   	ret    

000029d2 <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    29d2:	55                   	push   %ebp
    29d3:	89 e5                	mov    %esp,%ebp
    29d5:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    29d8:	83 ec 08             	sub    $0x8,%esp
    29db:	ff 75 0c             	pushl  0xc(%ebp)
    29de:	ff 75 08             	pushl  0x8(%ebp)
    29e1:	e8 99 00 00 00       	call   2a7f <parsepipe>
    29e6:	83 c4 10             	add    $0x10,%esp
    29e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    29ec:	eb 23                	jmp    2a11 <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    29ee:	6a 00                	push   $0x0
    29f0:	6a 00                	push   $0x0
    29f2:	ff 75 0c             	pushl  0xc(%ebp)
    29f5:	ff 75 08             	pushl  0x8(%ebp)
    29f8:	e8 19 fd ff ff       	call   2716 <gettoken>
    29fd:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    2a00:	83 ec 0c             	sub    $0xc,%esp
    2a03:	ff 75 f4             	pushl  -0xc(%ebp)
    2a06:	e8 66 e8 ff ff       	call   1271 <backcmd>
    2a0b:	83 c4 10             	add    $0x10,%esp
    2a0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    2a11:	83 ec 04             	sub    $0x4,%esp
    2a14:	68 0f 3d 00 00       	push   $0x3d0f
    2a19:	ff 75 0c             	pushl  0xc(%ebp)
    2a1c:	ff 75 08             	pushl  0x8(%ebp)
    2a1f:	e8 43 fe ff ff       	call   2867 <peek>
    2a24:	83 c4 10             	add    $0x10,%esp
    2a27:	85 c0                	test   %eax,%eax
    2a29:	75 c3                	jne    29ee <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    2a2b:	83 ec 04             	sub    $0x4,%esp
    2a2e:	68 11 3d 00 00       	push   $0x3d11
    2a33:	ff 75 0c             	pushl  0xc(%ebp)
    2a36:	ff 75 08             	pushl  0x8(%ebp)
    2a39:	e8 29 fe ff ff       	call   2867 <peek>
    2a3e:	83 c4 10             	add    $0x10,%esp
    2a41:	85 c0                	test   %eax,%eax
    2a43:	74 35                	je     2a7a <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    2a45:	6a 00                	push   $0x0
    2a47:	6a 00                	push   $0x0
    2a49:	ff 75 0c             	pushl  0xc(%ebp)
    2a4c:	ff 75 08             	pushl  0x8(%ebp)
    2a4f:	e8 c2 fc ff ff       	call   2716 <gettoken>
    2a54:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    2a57:	83 ec 08             	sub    $0x8,%esp
    2a5a:	ff 75 0c             	pushl  0xc(%ebp)
    2a5d:	ff 75 08             	pushl  0x8(%ebp)
    2a60:	e8 6d ff ff ff       	call   29d2 <parseline>
    2a65:	83 c4 10             	add    $0x10,%esp
    2a68:	83 ec 08             	sub    $0x8,%esp
    2a6b:	50                   	push   %eax
    2a6c:	ff 75 f4             	pushl  -0xc(%ebp)
    2a6f:	e8 b5 e7 ff ff       	call   1229 <listcmd>
    2a74:	83 c4 10             	add    $0x10,%esp
    2a77:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2a7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2a7d:	c9                   	leave  
    2a7e:	c3                   	ret    

00002a7f <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    2a7f:	55                   	push   %ebp
    2a80:	89 e5                	mov    %esp,%ebp
    2a82:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    2a85:	83 ec 08             	sub    $0x8,%esp
    2a88:	ff 75 0c             	pushl  0xc(%ebp)
    2a8b:	ff 75 08             	pushl  0x8(%ebp)
    2a8e:	e8 ec 01 00 00       	call   2c7f <parseexec>
    2a93:	83 c4 10             	add    $0x10,%esp
    2a96:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    2a99:	83 ec 04             	sub    $0x4,%esp
    2a9c:	68 13 3d 00 00       	push   $0x3d13
    2aa1:	ff 75 0c             	pushl  0xc(%ebp)
    2aa4:	ff 75 08             	pushl  0x8(%ebp)
    2aa7:	e8 bb fd ff ff       	call   2867 <peek>
    2aac:	83 c4 10             	add    $0x10,%esp
    2aaf:	85 c0                	test   %eax,%eax
    2ab1:	74 35                	je     2ae8 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    2ab3:	6a 00                	push   $0x0
    2ab5:	6a 00                	push   $0x0
    2ab7:	ff 75 0c             	pushl  0xc(%ebp)
    2aba:	ff 75 08             	pushl  0x8(%ebp)
    2abd:	e8 54 fc ff ff       	call   2716 <gettoken>
    2ac2:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    2ac5:	83 ec 08             	sub    $0x8,%esp
    2ac8:	ff 75 0c             	pushl  0xc(%ebp)
    2acb:	ff 75 08             	pushl  0x8(%ebp)
    2ace:	e8 ac ff ff ff       	call   2a7f <parsepipe>
    2ad3:	83 c4 10             	add    $0x10,%esp
    2ad6:	83 ec 08             	sub    $0x8,%esp
    2ad9:	50                   	push   %eax
    2ada:	ff 75 f4             	pushl  -0xc(%ebp)
    2add:	e8 ff e6 ff ff       	call   11e1 <pipecmd>
    2ae2:	83 c4 10             	add    $0x10,%esp
    2ae5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    2ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2aeb:	c9                   	leave  
    2aec:	c3                   	ret    

00002aed <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    2aed:	55                   	push   %ebp
    2aee:	89 e5                	mov    %esp,%ebp
    2af0:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2af3:	e9 b6 00 00 00       	jmp    2bae <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    2af8:	6a 00                	push   $0x0
    2afa:	6a 00                	push   $0x0
    2afc:	ff 75 10             	pushl  0x10(%ebp)
    2aff:	ff 75 0c             	pushl  0xc(%ebp)
    2b02:	e8 0f fc ff ff       	call   2716 <gettoken>
    2b07:	83 c4 10             	add    $0x10,%esp
    2b0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    2b0d:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2b10:	50                   	push   %eax
    2b11:	8d 45 f0             	lea    -0x10(%ebp),%eax
    2b14:	50                   	push   %eax
    2b15:	ff 75 10             	pushl  0x10(%ebp)
    2b18:	ff 75 0c             	pushl  0xc(%ebp)
    2b1b:	e8 f6 fb ff ff       	call   2716 <gettoken>
    2b20:	83 c4 10             	add    $0x10,%esp
    2b23:	83 f8 61             	cmp    $0x61,%eax
    2b26:	74 10                	je     2b38 <parseredirs+0x4b>
      panic1("missing file for redirection");
    2b28:	83 ec 0c             	sub    $0xc,%esp
    2b2b:	68 15 3d 00 00       	push   $0x3d15
    2b30:	e8 76 e2 ff ff       	call   dab <panic1>
    2b35:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    2b38:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b3b:	83 f8 3c             	cmp    $0x3c,%eax
    2b3e:	74 0c                	je     2b4c <parseredirs+0x5f>
    2b40:	83 f8 3e             	cmp    $0x3e,%eax
    2b43:	74 26                	je     2b6b <parseredirs+0x7e>
    2b45:	83 f8 2b             	cmp    $0x2b,%eax
    2b48:	74 43                	je     2b8d <parseredirs+0xa0>
    2b4a:	eb 62                	jmp    2bae <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    2b4c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2b4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b52:	83 ec 0c             	sub    $0xc,%esp
    2b55:	6a 00                	push   $0x0
    2b57:	6a 00                	push   $0x0
    2b59:	52                   	push   %edx
    2b5a:	50                   	push   %eax
    2b5b:	ff 75 08             	pushl  0x8(%ebp)
    2b5e:	e8 1b e6 ff ff       	call   117e <redircmd>
    2b63:	83 c4 20             	add    $0x20,%esp
    2b66:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2b69:	eb 43                	jmp    2bae <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    2b6b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2b6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b71:	83 ec 0c             	sub    $0xc,%esp
    2b74:	6a 01                	push   $0x1
    2b76:	68 01 02 00 00       	push   $0x201
    2b7b:	52                   	push   %edx
    2b7c:	50                   	push   %eax
    2b7d:	ff 75 08             	pushl  0x8(%ebp)
    2b80:	e8 f9 e5 ff ff       	call   117e <redircmd>
    2b85:	83 c4 20             	add    $0x20,%esp
    2b88:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2b8b:	eb 21                	jmp    2bae <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    2b8d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2b90:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b93:	83 ec 0c             	sub    $0xc,%esp
    2b96:	6a 01                	push   $0x1
    2b98:	68 01 02 00 00       	push   $0x201
    2b9d:	52                   	push   %edx
    2b9e:	50                   	push   %eax
    2b9f:	ff 75 08             	pushl  0x8(%ebp)
    2ba2:	e8 d7 e5 ff ff       	call   117e <redircmd>
    2ba7:	83 c4 20             	add    $0x20,%esp
    2baa:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    2bad:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    2bae:	83 ec 04             	sub    $0x4,%esp
    2bb1:	68 32 3d 00 00       	push   $0x3d32
    2bb6:	ff 75 10             	pushl  0x10(%ebp)
    2bb9:	ff 75 0c             	pushl  0xc(%ebp)
    2bbc:	e8 a6 fc ff ff       	call   2867 <peek>
    2bc1:	83 c4 10             	add    $0x10,%esp
    2bc4:	85 c0                	test   %eax,%eax
    2bc6:	0f 85 2c ff ff ff    	jne    2af8 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    2bcc:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2bcf:	c9                   	leave  
    2bd0:	c3                   	ret    

00002bd1 <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    2bd1:	55                   	push   %ebp
    2bd2:	89 e5                	mov    %esp,%ebp
    2bd4:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    2bd7:	83 ec 04             	sub    $0x4,%esp
    2bda:	68 35 3d 00 00       	push   $0x3d35
    2bdf:	ff 75 0c             	pushl  0xc(%ebp)
    2be2:	ff 75 08             	pushl  0x8(%ebp)
    2be5:	e8 7d fc ff ff       	call   2867 <peek>
    2bea:	83 c4 10             	add    $0x10,%esp
    2bed:	85 c0                	test   %eax,%eax
    2bef:	75 10                	jne    2c01 <parseblock+0x30>
    panic1("parseblock");
    2bf1:	83 ec 0c             	sub    $0xc,%esp
    2bf4:	68 37 3d 00 00       	push   $0x3d37
    2bf9:	e8 ad e1 ff ff       	call   dab <panic1>
    2bfe:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2c01:	6a 00                	push   $0x0
    2c03:	6a 00                	push   $0x0
    2c05:	ff 75 0c             	pushl  0xc(%ebp)
    2c08:	ff 75 08             	pushl  0x8(%ebp)
    2c0b:	e8 06 fb ff ff       	call   2716 <gettoken>
    2c10:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    2c13:	83 ec 08             	sub    $0x8,%esp
    2c16:	ff 75 0c             	pushl  0xc(%ebp)
    2c19:	ff 75 08             	pushl  0x8(%ebp)
    2c1c:	e8 b1 fd ff ff       	call   29d2 <parseline>
    2c21:	83 c4 10             	add    $0x10,%esp
    2c24:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    2c27:	83 ec 04             	sub    $0x4,%esp
    2c2a:	68 42 3d 00 00       	push   $0x3d42
    2c2f:	ff 75 0c             	pushl  0xc(%ebp)
    2c32:	ff 75 08             	pushl  0x8(%ebp)
    2c35:	e8 2d fc ff ff       	call   2867 <peek>
    2c3a:	83 c4 10             	add    $0x10,%esp
    2c3d:	85 c0                	test   %eax,%eax
    2c3f:	75 10                	jne    2c51 <parseblock+0x80>
    panic1("syntax - missing )");
    2c41:	83 ec 0c             	sub    $0xc,%esp
    2c44:	68 44 3d 00 00       	push   $0x3d44
    2c49:	e8 5d e1 ff ff       	call   dab <panic1>
    2c4e:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    2c51:	6a 00                	push   $0x0
    2c53:	6a 00                	push   $0x0
    2c55:	ff 75 0c             	pushl  0xc(%ebp)
    2c58:	ff 75 08             	pushl  0x8(%ebp)
    2c5b:	e8 b6 fa ff ff       	call   2716 <gettoken>
    2c60:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    2c63:	83 ec 04             	sub    $0x4,%esp
    2c66:	ff 75 0c             	pushl  0xc(%ebp)
    2c69:	ff 75 08             	pushl  0x8(%ebp)
    2c6c:	ff 75 f4             	pushl  -0xc(%ebp)
    2c6f:	e8 79 fe ff ff       	call   2aed <parseredirs>
    2c74:	83 c4 10             	add    $0x10,%esp
    2c77:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    2c7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2c7d:	c9                   	leave  
    2c7e:	c3                   	ret    

00002c7f <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    2c7f:	55                   	push   %ebp
    2c80:	89 e5                	mov    %esp,%ebp
    2c82:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    2c85:	83 ec 04             	sub    $0x4,%esp
    2c88:	68 35 3d 00 00       	push   $0x3d35
    2c8d:	ff 75 0c             	pushl  0xc(%ebp)
    2c90:	ff 75 08             	pushl  0x8(%ebp)
    2c93:	e8 cf fb ff ff       	call   2867 <peek>
    2c98:	83 c4 10             	add    $0x10,%esp
    2c9b:	85 c0                	test   %eax,%eax
    2c9d:	74 16                	je     2cb5 <parseexec+0x36>
    return parseblock(ps, es);
    2c9f:	83 ec 08             	sub    $0x8,%esp
    2ca2:	ff 75 0c             	pushl  0xc(%ebp)
    2ca5:	ff 75 08             	pushl  0x8(%ebp)
    2ca8:	e8 24 ff ff ff       	call   2bd1 <parseblock>
    2cad:	83 c4 10             	add    $0x10,%esp
    2cb0:	e9 fb 00 00 00       	jmp    2db0 <parseexec+0x131>

  ret = execcmd();
    2cb5:	e8 8e e4 ff ff       	call   1148 <execcmd>
    2cba:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    2cbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2cc0:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    2cc3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    2cca:	83 ec 04             	sub    $0x4,%esp
    2ccd:	ff 75 0c             	pushl  0xc(%ebp)
    2cd0:	ff 75 08             	pushl  0x8(%ebp)
    2cd3:	ff 75 f0             	pushl  -0x10(%ebp)
    2cd6:	e8 12 fe ff ff       	call   2aed <parseredirs>
    2cdb:	83 c4 10             	add    $0x10,%esp
    2cde:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    2ce1:	e9 87 00 00 00       	jmp    2d6d <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    2ce6:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2ce9:	50                   	push   %eax
    2cea:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2ced:	50                   	push   %eax
    2cee:	ff 75 0c             	pushl  0xc(%ebp)
    2cf1:	ff 75 08             	pushl  0x8(%ebp)
    2cf4:	e8 1d fa ff ff       	call   2716 <gettoken>
    2cf9:	83 c4 10             	add    $0x10,%esp
    2cfc:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2cff:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2d03:	0f 84 84 00 00 00    	je     2d8d <parseexec+0x10e>
      break;
    if(tok != 'a')
    2d09:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    2d0d:	74 10                	je     2d1f <parseexec+0xa0>
      panic1("syntax");
    2d0f:	83 ec 0c             	sub    $0xc,%esp
    2d12:	68 08 3d 00 00       	push   $0x3d08
    2d17:	e8 8f e0 ff ff       	call   dab <panic1>
    2d1c:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    2d1f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    2d22:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d25:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2d28:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    2d2c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    2d2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d32:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2d35:	83 c1 08             	add    $0x8,%ecx
    2d38:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    2d3c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    2d40:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2d44:	7e 10                	jle    2d56 <parseexec+0xd7>
      panic1("too many args");
    2d46:	83 ec 0c             	sub    $0xc,%esp
    2d49:	68 57 3d 00 00       	push   $0x3d57
    2d4e:	e8 58 e0 ff ff       	call   dab <panic1>
    2d53:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    2d56:	83 ec 04             	sub    $0x4,%esp
    2d59:	ff 75 0c             	pushl  0xc(%ebp)
    2d5c:	ff 75 08             	pushl  0x8(%ebp)
    2d5f:	ff 75 f0             	pushl  -0x10(%ebp)
    2d62:	e8 86 fd ff ff       	call   2aed <parseredirs>
    2d67:	83 c4 10             	add    $0x10,%esp
    2d6a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    2d6d:	83 ec 04             	sub    $0x4,%esp
    2d70:	68 65 3d 00 00       	push   $0x3d65
    2d75:	ff 75 0c             	pushl  0xc(%ebp)
    2d78:	ff 75 08             	pushl  0x8(%ebp)
    2d7b:	e8 e7 fa ff ff       	call   2867 <peek>
    2d80:	83 c4 10             	add    $0x10,%esp
    2d83:	85 c0                	test   %eax,%eax
    2d85:	0f 84 5b ff ff ff    	je     2ce6 <parseexec+0x67>
    2d8b:	eb 01                	jmp    2d8e <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    2d8d:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    2d8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d91:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2d94:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    2d9b:	00 
  cmd->eargv[argc] = 0;
    2d9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d9f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2da2:	83 c2 08             	add    $0x8,%edx
    2da5:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    2dac:	00 
  return ret;
    2dad:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2db0:	c9                   	leave  
    2db1:	c3                   	ret    

00002db2 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    2db2:	55                   	push   %ebp
    2db3:	89 e5                	mov    %esp,%ebp
    2db5:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    2db8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2dbc:	75 0a                	jne    2dc8 <nulterminate+0x16>
    return 0;
    2dbe:	b8 00 00 00 00       	mov    $0x0,%eax
    2dc3:	e9 e4 00 00 00       	jmp    2eac <nulterminate+0xfa>
  
  switch(cmd->type){
    2dc8:	8b 45 08             	mov    0x8(%ebp),%eax
    2dcb:	8b 00                	mov    (%eax),%eax
    2dcd:	83 f8 05             	cmp    $0x5,%eax
    2dd0:	0f 87 d3 00 00 00    	ja     2ea9 <nulterminate+0xf7>
    2dd6:	8b 04 85 6c 3d 00 00 	mov    0x3d6c(,%eax,4),%eax
    2ddd:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    2ddf:	8b 45 08             	mov    0x8(%ebp),%eax
    2de2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    2de5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2dec:	eb 14                	jmp    2e02 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    2dee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2df1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2df4:	83 c2 08             	add    $0x8,%edx
    2df7:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    2dfb:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    2dfe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2e02:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e05:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2e08:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    2e0c:	85 c0                	test   %eax,%eax
    2e0e:	75 de                	jne    2dee <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    2e10:	e9 94 00 00 00       	jmp    2ea9 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    2e15:	8b 45 08             	mov    0x8(%ebp),%eax
    2e18:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    2e1b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e1e:	8b 40 04             	mov    0x4(%eax),%eax
    2e21:	83 ec 0c             	sub    $0xc,%esp
    2e24:	50                   	push   %eax
    2e25:	e8 88 ff ff ff       	call   2db2 <nulterminate>
    2e2a:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    2e2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e30:	8b 40 0c             	mov    0xc(%eax),%eax
    2e33:	c6 00 00             	movb   $0x0,(%eax)
    break;
    2e36:	eb 71                	jmp    2ea9 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    2e38:	8b 45 08             	mov    0x8(%ebp),%eax
    2e3b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    2e3e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e41:	8b 40 04             	mov    0x4(%eax),%eax
    2e44:	83 ec 0c             	sub    $0xc,%esp
    2e47:	50                   	push   %eax
    2e48:	e8 65 ff ff ff       	call   2db2 <nulterminate>
    2e4d:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    2e50:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e53:	8b 40 08             	mov    0x8(%eax),%eax
    2e56:	83 ec 0c             	sub    $0xc,%esp
    2e59:	50                   	push   %eax
    2e5a:	e8 53 ff ff ff       	call   2db2 <nulterminate>
    2e5f:	83 c4 10             	add    $0x10,%esp
    break;
    2e62:	eb 45                	jmp    2ea9 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    2e64:	8b 45 08             	mov    0x8(%ebp),%eax
    2e67:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    2e6a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e6d:	8b 40 04             	mov    0x4(%eax),%eax
    2e70:	83 ec 0c             	sub    $0xc,%esp
    2e73:	50                   	push   %eax
    2e74:	e8 39 ff ff ff       	call   2db2 <nulterminate>
    2e79:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    2e7c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e7f:	8b 40 08             	mov    0x8(%eax),%eax
    2e82:	83 ec 0c             	sub    $0xc,%esp
    2e85:	50                   	push   %eax
    2e86:	e8 27 ff ff ff       	call   2db2 <nulterminate>
    2e8b:	83 c4 10             	add    $0x10,%esp
    break;
    2e8e:	eb 19                	jmp    2ea9 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    2e90:	8b 45 08             	mov    0x8(%ebp),%eax
    2e93:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    2e96:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2e99:	8b 40 04             	mov    0x4(%eax),%eax
    2e9c:	83 ec 0c             	sub    $0xc,%esp
    2e9f:	50                   	push   %eax
    2ea0:	e8 0d ff ff ff       	call   2db2 <nulterminate>
    2ea5:	83 c4 10             	add    $0x10,%esp
    break;
    2ea8:	90                   	nop
  }
  return cmd;
    2ea9:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2eac:	c9                   	leave  
    2ead:	c3                   	ret    

00002eae <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    2eae:	55                   	push   %ebp
    2eaf:	89 e5                	mov    %esp,%ebp
    2eb1:	83 ec 18             	sub    $0x18,%esp
    2eb4:	8b 45 08             	mov    0x8(%ebp),%eax
    2eb7:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    2eba:	83 ec 08             	sub    $0x8,%esp
    2ebd:	ff 75 18             	pushl  0x18(%ebp)
    2ec0:	ff 75 14             	pushl  0x14(%ebp)
    2ec3:	ff 75 10             	pushl  0x10(%ebp)
    2ec6:	ff 75 0c             	pushl  0xc(%ebp)
    2ec9:	6a 01                	push   $0x1
    2ecb:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2ece:	50                   	push   %eax
    2ecf:	e8 e6 d8 ff ff       	call   7ba <colorwrite>
    2ed4:	83 c4 20             	add    $0x20,%esp
}
    2ed7:	90                   	nop
    2ed8:	c9                   	leave  
    2ed9:	c3                   	ret    

00002eda <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    2eda:	55                   	push   %ebp
    2edb:	89 e5                	mov    %esp,%ebp
    2edd:	53                   	push   %ebx
    2ede:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2ee1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2ee8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    2eec:	74 17                	je     2f05 <color_printint+0x2b>
    2eee:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2ef2:	79 11                	jns    2f05 <color_printint+0x2b>
    neg = 1;
    2ef4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2efb:	8b 45 08             	mov    0x8(%ebp),%eax
    2efe:	f7 d8                	neg    %eax
    2f00:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2f03:	eb 06                	jmp    2f0b <color_printint+0x31>
  } else {
    x = xx;
    2f05:	8b 45 08             	mov    0x8(%ebp),%eax
    2f08:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2f0b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2f12:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2f15:	8d 41 01             	lea    0x1(%ecx),%eax
    2f18:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2f1b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2f1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f21:	ba 00 00 00 00       	mov    $0x0,%edx
    2f26:	f7 f3                	div    %ebx
    2f28:	89 d0                	mov    %edx,%eax
    2f2a:	0f b6 80 24 48 00 00 	movzbl 0x4824(%eax),%eax
    2f31:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2f35:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    2f38:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f3b:	ba 00 00 00 00       	mov    $0x0,%edx
    2f40:	f7 f3                	div    %ebx
    2f42:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2f45:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2f49:	75 c7                	jne    2f12 <color_printint+0x38>
  if(neg)
    2f4b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2f4f:	74 36                	je     2f87 <color_printint+0xad>
    buf[i++] = '-';
    2f51:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f54:	8d 50 01             	lea    0x1(%eax),%edx
    2f57:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2f5a:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2f5f:	eb 26                	jmp    2f87 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    2f61:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2f64:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f67:	01 d0                	add    %edx,%eax
    2f69:	0f b6 00             	movzbl (%eax),%eax
    2f6c:	0f be c0             	movsbl %al,%eax
    2f6f:	83 ec 0c             	sub    $0xc,%esp
    2f72:	ff 75 20             	pushl  0x20(%ebp)
    2f75:	ff 75 1c             	pushl  0x1c(%ebp)
    2f78:	ff 75 18             	pushl  0x18(%ebp)
    2f7b:	ff 75 14             	pushl  0x14(%ebp)
    2f7e:	50                   	push   %eax
    2f7f:	e8 2a ff ff ff       	call   2eae <color_putc>
    2f84:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2f87:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2f8b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2f8f:	79 d0                	jns    2f61 <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    2f91:	90                   	nop
    2f92:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2f95:	c9                   	leave  
    2f96:	c3                   	ret    

00002f97 <getInteger>:

static int getInteger(double num)
{
    2f97:	55                   	push   %ebp
    2f98:	89 e5                	mov    %esp,%ebp
    2f9a:	83 ec 18             	sub    $0x18,%esp
    2f9d:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa0:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2fa3:	8b 45 0c             	mov    0xc(%ebp),%eax
    2fa6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    2fa9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    2fb0:	eb 0e                	jmp    2fc0 <getInteger+0x29>
  {
    num -= 1;
    2fb2:	dd 45 e8             	fldl   -0x18(%ebp)
    2fb5:	d9 e8                	fld1   
    2fb7:	de e9                	fsubrp %st,%st(1)
    2fb9:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    2fbc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    2fc0:	dd 45 e8             	fldl   -0x18(%ebp)
    2fc3:	d9 e8                	fld1   
    2fc5:	d9 c9                	fxch   %st(1)
    2fc7:	df e9                	fucomip %st(1),%st
    2fc9:	dd d8                	fstp   %st(0)
    2fcb:	77 e5                	ja     2fb2 <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    2fcd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2fd0:	c9                   	leave  
    2fd1:	c3                   	ret    

00002fd2 <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    2fd2:	55                   	push   %ebp
    2fd3:	89 e5                	mov    %esp,%ebp
    2fd5:	83 ec 28             	sub    $0x28,%esp
    2fd8:	8b 45 08             	mov    0x8(%ebp),%eax
    2fdb:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2fde:	8b 45 0c             	mov    0xc(%ebp),%eax
    2fe1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    2fe4:	d9 ee                	fldz   
    2fe6:	dd 45 e0             	fldl   -0x20(%ebp)
    2fe9:	d9 c9                	fxch   %st(1)
    2feb:	df e9                	fucomip %st(1),%st
    2fed:	dd d8                	fstp   %st(0)
    2fef:	76 21                	jbe    3012 <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    2ff1:	83 ec 0c             	sub    $0xc,%esp
    2ff4:	ff 75 1c             	pushl  0x1c(%ebp)
    2ff7:	ff 75 18             	pushl  0x18(%ebp)
    2ffa:	ff 75 14             	pushl  0x14(%ebp)
    2ffd:	ff 75 10             	pushl  0x10(%ebp)
    3000:	6a 2d                	push   $0x2d
    3002:	e8 a7 fe ff ff       	call   2eae <color_putc>
    3007:	83 c4 20             	add    $0x20,%esp
    num = -num;
    300a:	dd 45 e0             	fldl   -0x20(%ebp)
    300d:	d9 e0                	fchs   
    300f:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    3012:	83 ec 08             	sub    $0x8,%esp
    3015:	ff 75 e4             	pushl  -0x1c(%ebp)
    3018:	ff 75 e0             	pushl  -0x20(%ebp)
    301b:	e8 77 ff ff ff       	call   2f97 <getInteger>
    3020:	83 c4 10             	add    $0x10,%esp
    3023:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    3026:	83 ec 04             	sub    $0x4,%esp
    3029:	ff 75 1c             	pushl  0x1c(%ebp)
    302c:	ff 75 18             	pushl  0x18(%ebp)
    302f:	ff 75 14             	pushl  0x14(%ebp)
    3032:	ff 75 10             	pushl  0x10(%ebp)
    3035:	6a 01                	push   $0x1
    3037:	6a 0a                	push   $0xa
    3039:	ff 75 f0             	pushl  -0x10(%ebp)
    303c:	e8 99 fe ff ff       	call   2eda <color_printint>
    3041:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    3044:	db 45 f0             	fildl  -0x10(%ebp)
    3047:	dd 45 e0             	fldl   -0x20(%ebp)
    304a:	de e1                	fsubp  %st,%st(1)
    304c:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    304f:	dd 45 e0             	fldl   -0x20(%ebp)
    3052:	dd 05 90 3d 00 00    	fldl   0x3d90
    3058:	d9 c9                	fxch   %st(1)
    305a:	df e9                	fucomip %st(1),%st
    305c:	dd d8                	fstp   %st(0)
    305e:	76 19                	jbe    3079 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    3060:	83 ec 0c             	sub    $0xc,%esp
    3063:	ff 75 1c             	pushl  0x1c(%ebp)
    3066:	ff 75 18             	pushl  0x18(%ebp)
    3069:	ff 75 14             	pushl  0x14(%ebp)
    306c:	ff 75 10             	pushl  0x10(%ebp)
    306f:	6a 2e                	push   $0x2e
    3071:	e8 38 fe ff ff       	call   2eae <color_putc>
    3076:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    3079:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    3080:	eb 55                	jmp    30d7 <color_printdbl+0x105>
  {
    num = num*10;
    3082:	dd 45 e0             	fldl   -0x20(%ebp)
    3085:	dd 05 98 3d 00 00    	fldl   0x3d98
    308b:	de c9                	fmulp  %st,%st(1)
    308d:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    3090:	83 ec 08             	sub    $0x8,%esp
    3093:	ff 75 e4             	pushl  -0x1c(%ebp)
    3096:	ff 75 e0             	pushl  -0x20(%ebp)
    3099:	e8 f9 fe ff ff       	call   2f97 <getInteger>
    309e:	83 c4 10             	add    $0x10,%esp
    30a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    30a4:	83 ec 04             	sub    $0x4,%esp
    30a7:	ff 75 1c             	pushl  0x1c(%ebp)
    30aa:	ff 75 18             	pushl  0x18(%ebp)
    30ad:	ff 75 14             	pushl  0x14(%ebp)
    30b0:	ff 75 10             	pushl  0x10(%ebp)
    30b3:	6a 01                	push   $0x1
    30b5:	6a 0a                	push   $0xa
    30b7:	ff 75 f0             	pushl  -0x10(%ebp)
    30ba:	e8 1b fe ff ff       	call   2eda <color_printint>
    30bf:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    30c2:	db 45 f0             	fildl  -0x10(%ebp)
    30c5:	dd 45 e0             	fldl   -0x20(%ebp)
    30c8:	de e1                	fsubp  %st,%st(1)
    30ca:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    30cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    30d1:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    30d5:	7f 13                	jg     30ea <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    30d7:	dd 45 e0             	fldl   -0x20(%ebp)
    30da:	dd 05 90 3d 00 00    	fldl   0x3d90
    30e0:	d9 c9                	fxch   %st(1)
    30e2:	df e9                	fucomip %st(1),%st
    30e4:	dd d8                	fstp   %st(0)
    30e6:	77 9a                	ja     3082 <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    30e8:	eb 01                	jmp    30eb <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    30ea:	90                   	nop
    }
  }
}
    30eb:	90                   	nop
    30ec:	c9                   	leave  
    30ed:	c3                   	ret    

000030ee <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    30ee:	55                   	push   %ebp
    30ef:	89 e5                	mov    %esp,%ebp
    30f1:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    30f4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    30fb:	8d 45 18             	lea    0x18(%ebp),%eax
    30fe:	83 c0 04             	add    $0x4,%eax
    3101:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    3104:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    310b:	e9 e2 01 00 00       	jmp    32f2 <color_printf+0x204>
    c = fmt[i] & 0xff;
    3110:	8b 55 18             	mov    0x18(%ebp),%edx
    3113:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3116:	01 d0                	add    %edx,%eax
    3118:	0f b6 00             	movzbl (%eax),%eax
    311b:	0f be c0             	movsbl %al,%eax
    311e:	25 ff 00 00 00       	and    $0xff,%eax
    3123:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    3126:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    312a:	75 35                	jne    3161 <color_printf+0x73>
      if(c == '%'){
    312c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3130:	75 0c                	jne    313e <color_printf+0x50>
        state = '%';
    3132:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    3139:	e9 b0 01 00 00       	jmp    32ee <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    313e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3141:	0f be c0             	movsbl %al,%eax
    3144:	83 ec 0c             	sub    $0xc,%esp
    3147:	ff 75 14             	pushl  0x14(%ebp)
    314a:	ff 75 10             	pushl  0x10(%ebp)
    314d:	ff 75 0c             	pushl  0xc(%ebp)
    3150:	ff 75 08             	pushl  0x8(%ebp)
    3153:	50                   	push   %eax
    3154:	e8 55 fd ff ff       	call   2eae <color_putc>
    3159:	83 c4 20             	add    $0x20,%esp
    315c:	e9 8d 01 00 00       	jmp    32ee <color_printf+0x200>
      }
    } else if(state == '%'){
    3161:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    3165:	0f 85 83 01 00 00    	jne    32ee <color_printf+0x200>
      if(c == 'd'){
    316b:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    316f:	75 2a                	jne    319b <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    3171:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3174:	8b 00                	mov    (%eax),%eax
    3176:	83 ec 04             	sub    $0x4,%esp
    3179:	ff 75 14             	pushl  0x14(%ebp)
    317c:	ff 75 10             	pushl  0x10(%ebp)
    317f:	ff 75 0c             	pushl  0xc(%ebp)
    3182:	ff 75 08             	pushl  0x8(%ebp)
    3185:	6a 01                	push   $0x1
    3187:	6a 0a                	push   $0xa
    3189:	50                   	push   %eax
    318a:	e8 4b fd ff ff       	call   2eda <color_printint>
    318f:	83 c4 20             	add    $0x20,%esp
        ap++;
    3192:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3196:	e9 4c 01 00 00       	jmp    32e7 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    319b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    319f:	74 06                	je     31a7 <color_printf+0xb9>
    31a1:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    31a5:	75 2a                	jne    31d1 <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    31a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    31aa:	8b 00                	mov    (%eax),%eax
    31ac:	83 ec 04             	sub    $0x4,%esp
    31af:	ff 75 14             	pushl  0x14(%ebp)
    31b2:	ff 75 10             	pushl  0x10(%ebp)
    31b5:	ff 75 0c             	pushl  0xc(%ebp)
    31b8:	ff 75 08             	pushl  0x8(%ebp)
    31bb:	6a 00                	push   $0x0
    31bd:	6a 10                	push   $0x10
    31bf:	50                   	push   %eax
    31c0:	e8 15 fd ff ff       	call   2eda <color_printint>
    31c5:	83 c4 20             	add    $0x20,%esp
        ap++;
    31c8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    31cc:	e9 16 01 00 00       	jmp    32e7 <color_printf+0x1f9>
      } else if(c == 's'){
    31d1:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    31d5:	75 4f                	jne    3226 <color_printf+0x138>
        s = (char*)*ap;
    31d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    31da:	8b 00                	mov    (%eax),%eax
    31dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    31df:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    31e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    31e7:	75 2e                	jne    3217 <color_printf+0x129>
          s = "(null)";
    31e9:	c7 45 f4 88 3d 00 00 	movl   $0x3d88,-0xc(%ebp)
        while(*s != 0){
    31f0:	eb 25                	jmp    3217 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    31f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31f5:	0f b6 00             	movzbl (%eax),%eax
    31f8:	0f be c0             	movsbl %al,%eax
    31fb:	83 ec 0c             	sub    $0xc,%esp
    31fe:	ff 75 14             	pushl  0x14(%ebp)
    3201:	ff 75 10             	pushl  0x10(%ebp)
    3204:	ff 75 0c             	pushl  0xc(%ebp)
    3207:	ff 75 08             	pushl  0x8(%ebp)
    320a:	50                   	push   %eax
    320b:	e8 9e fc ff ff       	call   2eae <color_putc>
    3210:	83 c4 20             	add    $0x20,%esp
          s++;
    3213:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3217:	8b 45 f4             	mov    -0xc(%ebp),%eax
    321a:	0f b6 00             	movzbl (%eax),%eax
    321d:	84 c0                	test   %al,%al
    321f:	75 d1                	jne    31f2 <color_printf+0x104>
    3221:	e9 c1 00 00 00       	jmp    32e7 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    3226:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    322a:	75 29                	jne    3255 <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    322c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    322f:	8b 00                	mov    (%eax),%eax
    3231:	0f be c0             	movsbl %al,%eax
    3234:	83 ec 0c             	sub    $0xc,%esp
    3237:	ff 75 14             	pushl  0x14(%ebp)
    323a:	ff 75 10             	pushl  0x10(%ebp)
    323d:	ff 75 0c             	pushl  0xc(%ebp)
    3240:	ff 75 08             	pushl  0x8(%ebp)
    3243:	50                   	push   %eax
    3244:	e8 65 fc ff ff       	call   2eae <color_putc>
    3249:	83 c4 20             	add    $0x20,%esp
        ap++;
    324c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3250:	e9 92 00 00 00       	jmp    32e7 <color_printf+0x1f9>
      } else if(c == '%'){
    3255:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3259:	75 20                	jne    327b <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    325b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    325e:	0f be c0             	movsbl %al,%eax
    3261:	83 ec 0c             	sub    $0xc,%esp
    3264:	ff 75 14             	pushl  0x14(%ebp)
    3267:	ff 75 10             	pushl  0x10(%ebp)
    326a:	ff 75 0c             	pushl  0xc(%ebp)
    326d:	ff 75 08             	pushl  0x8(%ebp)
    3270:	50                   	push   %eax
    3271:	e8 38 fc ff ff       	call   2eae <color_putc>
    3276:	83 c4 20             	add    $0x20,%esp
    3279:	eb 6c                	jmp    32e7 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    327b:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    327f:	75 2f                	jne    32b0 <color_printf+0x1c2>
        double *dap = (double*)ap;
    3281:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3284:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    3287:	8b 45 e0             	mov    -0x20(%ebp),%eax
    328a:	dd 00                	fldl   (%eax)
    328c:	83 ec 08             	sub    $0x8,%esp
    328f:	ff 75 14             	pushl  0x14(%ebp)
    3292:	ff 75 10             	pushl  0x10(%ebp)
    3295:	ff 75 0c             	pushl  0xc(%ebp)
    3298:	ff 75 08             	pushl  0x8(%ebp)
    329b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    329f:	dd 1c 24             	fstpl  (%esp)
    32a2:	e8 2b fd ff ff       	call   2fd2 <color_printdbl>
    32a7:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    32aa:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    32ae:	eb 37                	jmp    32e7 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    32b0:	83 ec 0c             	sub    $0xc,%esp
    32b3:	ff 75 14             	pushl  0x14(%ebp)
    32b6:	ff 75 10             	pushl  0x10(%ebp)
    32b9:	ff 75 0c             	pushl  0xc(%ebp)
    32bc:	ff 75 08             	pushl  0x8(%ebp)
    32bf:	6a 25                	push   $0x25
    32c1:	e8 e8 fb ff ff       	call   2eae <color_putc>
    32c6:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    32c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    32cc:	0f be c0             	movsbl %al,%eax
    32cf:	83 ec 0c             	sub    $0xc,%esp
    32d2:	ff 75 14             	pushl  0x14(%ebp)
    32d5:	ff 75 10             	pushl  0x10(%ebp)
    32d8:	ff 75 0c             	pushl  0xc(%ebp)
    32db:	ff 75 08             	pushl  0x8(%ebp)
    32de:	50                   	push   %eax
    32df:	e8 ca fb ff ff       	call   2eae <color_putc>
    32e4:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    32e7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    32ee:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    32f2:	8b 55 18             	mov    0x18(%ebp),%edx
    32f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32f8:	01 d0                	add    %edx,%eax
    32fa:	0f b6 00             	movzbl (%eax),%eax
    32fd:	84 c0                	test   %al,%al
    32ff:	0f 85 0b fe ff ff    	jne    3110 <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    3305:	90                   	nop
    3306:	c9                   	leave  
    3307:	c3                   	ret    

00003308 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    3308:	55                   	push   %ebp
    3309:	89 e5                	mov    %esp,%ebp
    330b:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    330e:	83 ec 0c             	sub    $0xc,%esp
    3311:	6a 58                	push   $0x58
    3313:	e8 b0 d9 ff ff       	call   cc8 <malloc>
    3318:	83 c4 10             	add    $0x10,%esp
    331b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    331e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3321:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    3327:	8b 45 f4             	mov    -0xc(%ebp),%eax
    332a:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    3331:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3334:	c9                   	leave  
    3335:	c3                   	ret    

00003336 <pushi>:

void pushi(struct istack *s, int val)
{
    3336:	55                   	push   %ebp
    3337:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    3339:	8b 45 08             	mov    0x8(%ebp),%eax
    333c:	8b 00                	mov    (%eax),%eax
    333e:	83 f8 13             	cmp    $0x13,%eax
    3341:	7f 2c                	jg     336f <pushi+0x39>
    {
        s->size++;
    3343:	8b 45 08             	mov    0x8(%ebp),%eax
    3346:	8b 00                	mov    (%eax),%eax
    3348:	8d 50 01             	lea    0x1(%eax),%edx
    334b:	8b 45 08             	mov    0x8(%ebp),%eax
    334e:	89 10                	mov    %edx,(%eax)
        s->top++;
    3350:	8b 45 08             	mov    0x8(%ebp),%eax
    3353:	8b 40 54             	mov    0x54(%eax),%eax
    3356:	8d 50 01             	lea    0x1(%eax),%edx
    3359:	8b 45 08             	mov    0x8(%ebp),%eax
    335c:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    335f:	8b 45 08             	mov    0x8(%ebp),%eax
    3362:	8b 50 54             	mov    0x54(%eax),%edx
    3365:	8b 45 08             	mov    0x8(%ebp),%eax
    3368:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    336b:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    336f:	90                   	nop
    3370:	5d                   	pop    %ebp
    3371:	c3                   	ret    

00003372 <popi>:

int popi(struct istack *s)
{
    3372:	55                   	push   %ebp
    3373:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3375:	8b 45 08             	mov    0x8(%ebp),%eax
    3378:	8b 00                	mov    (%eax),%eax
    337a:	85 c0                	test   %eax,%eax
    337c:	75 07                	jne    3385 <popi+0x13>
    {
        return -1;
    337e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3383:	eb 2c                	jmp    33b1 <popi+0x3f>
    }
    s->size--;
    3385:	8b 45 08             	mov    0x8(%ebp),%eax
    3388:	8b 00                	mov    (%eax),%eax
    338a:	8d 50 ff             	lea    -0x1(%eax),%edx
    338d:	8b 45 08             	mov    0x8(%ebp),%eax
    3390:	89 10                	mov    %edx,(%eax)
    s->top--;
    3392:	8b 45 08             	mov    0x8(%ebp),%eax
    3395:	8b 40 54             	mov    0x54(%eax),%eax
    3398:	8d 50 ff             	lea    -0x1(%eax),%edx
    339b:	8b 45 08             	mov    0x8(%ebp),%eax
    339e:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    33a1:	8b 45 08             	mov    0x8(%ebp),%eax
    33a4:	8b 40 54             	mov    0x54(%eax),%eax
    33a7:	8d 50 01             	lea    0x1(%eax),%edx
    33aa:	8b 45 08             	mov    0x8(%ebp),%eax
    33ad:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    33b1:	5d                   	pop    %ebp
    33b2:	c3                   	ret    

000033b3 <topi>:

int topi(struct istack* s)
{
    33b3:	55                   	push   %ebp
    33b4:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    33b6:	8b 45 08             	mov    0x8(%ebp),%eax
    33b9:	8b 50 54             	mov    0x54(%eax),%edx
    33bc:	8b 45 08             	mov    0x8(%ebp),%eax
    33bf:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    33c3:	5d                   	pop    %ebp
    33c4:	c3                   	ret    

000033c5 <cstack>:

//constructor
struct cstack* cstack()
{
    33c5:	55                   	push   %ebp
    33c6:	89 e5                	mov    %esp,%ebp
    33c8:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    33cb:	83 ec 0c             	sub    $0xc,%esp
    33ce:	6a 1c                	push   $0x1c
    33d0:	e8 f3 d8 ff ff       	call   cc8 <malloc>
    33d5:	83 c4 10             	add    $0x10,%esp
    33d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    33db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33de:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    33e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33e7:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    33ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    33f1:	c9                   	leave  
    33f2:	c3                   	ret    

000033f3 <pushc>:

void pushc(struct cstack *s, char val)
{
    33f3:	55                   	push   %ebp
    33f4:	89 e5                	mov    %esp,%ebp
    33f6:	83 ec 04             	sub    $0x4,%esp
    33f9:	8b 45 0c             	mov    0xc(%ebp),%eax
    33fc:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    33ff:	8b 45 08             	mov    0x8(%ebp),%eax
    3402:	8b 00                	mov    (%eax),%eax
    3404:	83 f8 13             	cmp    $0x13,%eax
    3407:	7f 2d                	jg     3436 <pushc+0x43>
    {
        s->size++;
    3409:	8b 45 08             	mov    0x8(%ebp),%eax
    340c:	8b 00                	mov    (%eax),%eax
    340e:	8d 50 01             	lea    0x1(%eax),%edx
    3411:	8b 45 08             	mov    0x8(%ebp),%eax
    3414:	89 10                	mov    %edx,(%eax)
        s->top++;
    3416:	8b 45 08             	mov    0x8(%ebp),%eax
    3419:	8b 40 18             	mov    0x18(%eax),%eax
    341c:	8d 50 01             	lea    0x1(%eax),%edx
    341f:	8b 45 08             	mov    0x8(%ebp),%eax
    3422:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    3425:	8b 45 08             	mov    0x8(%ebp),%eax
    3428:	8b 40 18             	mov    0x18(%eax),%eax
    342b:	8b 55 08             	mov    0x8(%ebp),%edx
    342e:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    3432:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    3436:	90                   	nop
    3437:	c9                   	leave  
    3438:	c3                   	ret    

00003439 <popc>:

char popc(struct cstack *s)
{
    3439:	55                   	push   %ebp
    343a:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    343c:	8b 45 08             	mov    0x8(%ebp),%eax
    343f:	8b 00                	mov    (%eax),%eax
    3441:	85 c0                	test   %eax,%eax
    3443:	75 07                	jne    344c <popc+0x13>
    {
        return -1;
    3445:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    344a:	eb 2d                	jmp    3479 <popc+0x40>
    }
    s->size--;
    344c:	8b 45 08             	mov    0x8(%ebp),%eax
    344f:	8b 00                	mov    (%eax),%eax
    3451:	8d 50 ff             	lea    -0x1(%eax),%edx
    3454:	8b 45 08             	mov    0x8(%ebp),%eax
    3457:	89 10                	mov    %edx,(%eax)
    s->top--;
    3459:	8b 45 08             	mov    0x8(%ebp),%eax
    345c:	8b 40 18             	mov    0x18(%eax),%eax
    345f:	8d 50 ff             	lea    -0x1(%eax),%edx
    3462:	8b 45 08             	mov    0x8(%ebp),%eax
    3465:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    3468:	8b 45 08             	mov    0x8(%ebp),%eax
    346b:	8b 40 18             	mov    0x18(%eax),%eax
    346e:	8d 50 01             	lea    0x1(%eax),%edx
    3471:	8b 45 08             	mov    0x8(%ebp),%eax
    3474:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    3479:	5d                   	pop    %ebp
    347a:	c3                   	ret    

0000347b <topc>:

char topc(struct cstack* s)
{
    347b:	55                   	push   %ebp
    347c:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    347e:	8b 45 08             	mov    0x8(%ebp),%eax
    3481:	8b 40 18             	mov    0x18(%eax),%eax
    3484:	8b 55 08             	mov    0x8(%ebp),%edx
    3487:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    348c:	5d                   	pop    %ebp
    348d:	c3                   	ret    

0000348e <dstack>:

//constructor
struct dstack* dstack()
{
    348e:	55                   	push   %ebp
    348f:	89 e5                	mov    %esp,%ebp
    3491:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    3494:	83 ec 0c             	sub    $0xc,%esp
    3497:	68 a8 00 00 00       	push   $0xa8
    349c:	e8 27 d8 ff ff       	call   cc8 <malloc>
    34a1:	83 c4 10             	add    $0x10,%esp
    34a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    34a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34aa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    34b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34b3:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    34ba:	ff ff ff 
    return stack;
    34bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    34c0:	c9                   	leave  
    34c1:	c3                   	ret    

000034c2 <pushd>:

void pushd(struct dstack *s, double val)
{
    34c2:	55                   	push   %ebp
    34c3:	89 e5                	mov    %esp,%ebp
    34c5:	83 ec 08             	sub    $0x8,%esp
    34c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    34cb:	89 45 f8             	mov    %eax,-0x8(%ebp)
    34ce:	8b 45 10             	mov    0x10(%ebp),%eax
    34d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    34d4:	8b 45 08             	mov    0x8(%ebp),%eax
    34d7:	8b 00                	mov    (%eax),%eax
    34d9:	83 f8 13             	cmp    $0x13,%eax
    34dc:	7f 35                	jg     3513 <pushd+0x51>
    {
        s->size++;
    34de:	8b 45 08             	mov    0x8(%ebp),%eax
    34e1:	8b 00                	mov    (%eax),%eax
    34e3:	8d 50 01             	lea    0x1(%eax),%edx
    34e6:	8b 45 08             	mov    0x8(%ebp),%eax
    34e9:	89 10                	mov    %edx,(%eax)
        s->top++;
    34eb:	8b 45 08             	mov    0x8(%ebp),%eax
    34ee:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    34f4:	8d 50 01             	lea    0x1(%eax),%edx
    34f7:	8b 45 08             	mov    0x8(%ebp),%eax
    34fa:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    3500:	8b 45 08             	mov    0x8(%ebp),%eax
    3503:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    3509:	8b 45 08             	mov    0x8(%ebp),%eax
    350c:	dd 45 f8             	fldl   -0x8(%ebp)
    350f:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    3513:	90                   	nop
    3514:	c9                   	leave  
    3515:	c3                   	ret    

00003516 <popd>:

double popd(struct dstack *s)
{
    3516:	55                   	push   %ebp
    3517:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    3519:	8b 45 08             	mov    0x8(%ebp),%eax
    351c:	8b 00                	mov    (%eax),%eax
    351e:	85 c0                	test   %eax,%eax
    3520:	75 06                	jne    3528 <popd+0x12>
    {
        return -1;
    3522:	d9 e8                	fld1   
    3524:	d9 e0                	fchs   
    3526:	eb 35                	jmp    355d <popd+0x47>
    }
    s->size--;
    3528:	8b 45 08             	mov    0x8(%ebp),%eax
    352b:	8b 00                	mov    (%eax),%eax
    352d:	8d 50 ff             	lea    -0x1(%eax),%edx
    3530:	8b 45 08             	mov    0x8(%ebp),%eax
    3533:	89 10                	mov    %edx,(%eax)
    s->top--;
    3535:	8b 45 08             	mov    0x8(%ebp),%eax
    3538:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    353e:	8d 50 ff             	lea    -0x1(%eax),%edx
    3541:	8b 45 08             	mov    0x8(%ebp),%eax
    3544:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    354a:	8b 45 08             	mov    0x8(%ebp),%eax
    354d:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    3553:	8d 50 01             	lea    0x1(%eax),%edx
    3556:	8b 45 08             	mov    0x8(%ebp),%eax
    3559:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    355d:	5d                   	pop    %ebp
    355e:	c3                   	ret    

0000355f <topd>:

double topd(struct dstack* s)
{
    355f:	55                   	push   %ebp
    3560:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    3562:	8b 45 08             	mov    0x8(%ebp),%eax
    3565:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    356b:	8b 45 08             	mov    0x8(%ebp),%eax
    356e:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    3572:	5d                   	pop    %ebp
    3573:	c3                   	ret    

00003574 <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3574:	55                   	push   %ebp
    3575:	89 e5                	mov    %esp,%ebp
    3577:	53                   	push   %ebx
    3578:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    357e:	83 ec 08             	sub    $0x8,%esp
    3581:	6a 00                	push   $0x0
    3583:	68 a0 3d 00 00       	push   $0x3da0
    3588:	e8 cd d1 ff ff       	call   75a <open>
    358d:	83 c4 10             	add    $0x10,%esp
    3590:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3593:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3597:	79 1d                	jns    35b6 <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    3599:	83 ec 0c             	sub    $0xc,%esp
    359c:	68 aa 3d 00 00       	push   $0x3daa
    35a1:	6a 00                	push   $0x0
    35a3:	6a 00                	push   $0x0
    35a5:	6a 01                	push   $0x1
    35a7:	6a 03                	push   $0x3
    35a9:	e8 40 fb ff ff       	call   30ee <color_printf>
    35ae:	83 c4 20             	add    $0x20,%esp
    35b1:	e9 6d 02 00 00       	jmp    3823 <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    35b6:	8b 45 0c             	mov    0xc(%ebp),%eax
    35b9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    35bf:	e9 2a 02 00 00       	jmp    37ee <readVariables+0x27a>
  {
    int pos = 0;
    35c4:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    35cb:	00 00 00 
    while(pos <= n-1)
    35ce:	e9 07 02 00 00       	jmp    37da <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    35d3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    35da:	eb 24                	jmp    3600 <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    35dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35df:	8d 50 ff             	lea    -0x1(%eax),%edx
    35e2:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    35e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35eb:	01 c8                	add    %ecx,%eax
    35ed:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    35f4:	ff 
    35f5:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    35fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    3600:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3606:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3609:	01 d0                	add    %edx,%eax
    360b:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3612:	ff 
    3613:	3c 3d                	cmp    $0x3d,%al
    3615:	75 c5                	jne    35dc <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    3617:	8b 45 f4             	mov    -0xc(%ebp),%eax
    361a:	83 e8 01             	sub    $0x1,%eax
    361d:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    3624:	00 
      if(buf[pos] == 'd') //double value
    3625:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    362b:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    3632:	ff 
    3633:	3c 64                	cmp    $0x64,%al
    3635:	0f 85 a0 00 00 00    	jne    36db <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    363b:	8b 45 0c             	mov    0xc(%ebp),%eax
    363e:	8b 00                	mov    (%eax),%eax
    3640:	c1 e0 05             	shl    $0x5,%eax
    3643:	89 c2                	mov    %eax,%edx
    3645:	8b 45 08             	mov    0x8(%ebp),%eax
    3648:	01 d0                	add    %edx,%eax
    364a:	8d 50 04             	lea    0x4(%eax),%edx
    364d:	83 ec 08             	sub    $0x8,%esp
    3650:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    3656:	50                   	push   %eax
    3657:	52                   	push   %edx
    3658:	e8 8c ce ff ff       	call   4e9 <strcpy>
    365d:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    3660:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3663:	8d 50 01             	lea    0x1(%eax),%edx
    3666:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    366c:	01 d0                	add    %edx,%eax
    366e:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    3674:	83 ec 08             	sub    $0x8,%esp
    3677:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    367d:	50                   	push   %eax
    367e:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    3684:	50                   	push   %eax
    3685:	e8 7b d9 ff ff       	call   1005 <Translation>
    368a:	83 c4 10             	add    $0x10,%esp
    368d:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    3690:	8b 45 0c             	mov    0xc(%ebp),%eax
    3693:	8b 00                	mov    (%eax),%eax
    3695:	c1 e0 05             	shl    $0x5,%eax
    3698:	89 c2                	mov    %eax,%edx
    369a:	8b 45 08             	mov    0x8(%ebp),%eax
    369d:	01 d0                	add    %edx,%eax
    369f:	dd 45 d8             	fldl   -0x28(%ebp)
    36a2:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    36a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    36a8:	8b 00                	mov    (%eax),%eax
    36aa:	c1 e0 05             	shl    $0x5,%eax
    36ad:	89 c2                	mov    %eax,%edx
    36af:	8b 45 08             	mov    0x8(%ebp),%eax
    36b2:	01 d0                	add    %edx,%eax
    36b4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    36ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    36bd:	8b 00                	mov    (%eax),%eax
    36bf:	8d 50 01             	lea    0x1(%eax),%edx
    36c2:	8b 45 0c             	mov    0xc(%ebp),%eax
    36c5:	89 10                	mov    %edx,(%eax)
        pos++;
    36c7:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    36cd:	83 c0 01             	add    $0x1,%eax
    36d0:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    36d6:	e9 ff 00 00 00       	jmp    37da <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    36db:	8b 45 0c             	mov    0xc(%ebp),%eax
    36de:	8b 00                	mov    (%eax),%eax
    36e0:	c1 e0 05             	shl    $0x5,%eax
    36e3:	89 c2                	mov    %eax,%edx
    36e5:	8b 45 08             	mov    0x8(%ebp),%eax
    36e8:	01 d0                	add    %edx,%eax
    36ea:	8d 50 04             	lea    0x4(%eax),%edx
    36ed:	83 ec 08             	sub    $0x8,%esp
    36f0:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    36f6:	50                   	push   %eax
    36f7:	52                   	push   %edx
    36f8:	e8 ec cd ff ff       	call   4e9 <strcpy>
    36fd:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    3700:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3703:	8d 50 01             	lea    0x1(%eax),%edx
    3706:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    370c:	01 d0                	add    %edx,%eax
    370e:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    3714:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    371a:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    371d:	eb 04                	jmp    3723 <readVariables+0x1af>
        {
          strend++;
    371f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    3723:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    3729:	8b 45 f0             	mov    -0x10(%ebp),%eax
    372c:	01 d0                	add    %edx,%eax
    372e:	0f b6 00             	movzbl (%eax),%eax
    3731:	84 c0                	test   %al,%al
    3733:	75 ea                	jne    371f <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    3735:	8b 45 0c             	mov    0xc(%ebp),%eax
    3738:	8b 00                	mov    (%eax),%eax
    373a:	c1 e0 05             	shl    $0x5,%eax
    373d:	89 c2                	mov    %eax,%edx
    373f:	8b 45 08             	mov    0x8(%ebp),%eax
    3742:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    3745:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    374b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    374e:	29 c2                	sub    %eax,%edx
    3750:	89 d0                	mov    %edx,%eax
    3752:	83 c0 01             	add    $0x1,%eax
    3755:	83 ec 0c             	sub    $0xc,%esp
    3758:	50                   	push   %eax
    3759:	e8 6a d5 ff ff       	call   cc8 <malloc>
    375e:	83 c4 10             	add    $0x10,%esp
    3761:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    3764:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    376a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    376d:	eb 35                	jmp    37a4 <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    376f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3772:	8b 00                	mov    (%eax),%eax
    3774:	c1 e0 05             	shl    $0x5,%eax
    3777:	89 c2                	mov    %eax,%edx
    3779:	8b 45 08             	mov    0x8(%ebp),%eax
    377c:	01 d0                	add    %edx,%eax
    377e:	8b 40 18             	mov    0x18(%eax),%eax
    3781:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    3787:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    378a:	29 d1                	sub    %edx,%ecx
    378c:	89 ca                	mov    %ecx,%edx
    378e:	01 c2                	add    %eax,%edx
    3790:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    3796:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3799:	01 c8                	add    %ecx,%eax
    379b:	0f b6 00             	movzbl (%eax),%eax
    379e:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    37a0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    37a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    37a7:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    37aa:	7e c3                	jle    376f <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    37ac:	8b 45 0c             	mov    0xc(%ebp),%eax
    37af:	8b 00                	mov    (%eax),%eax
    37b1:	c1 e0 05             	shl    $0x5,%eax
    37b4:	89 c2                	mov    %eax,%edx
    37b6:	8b 45 08             	mov    0x8(%ebp),%eax
    37b9:	01 d0                	add    %edx,%eax
    37bb:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    37c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    37c4:	8b 00                	mov    (%eax),%eax
    37c6:	8d 50 01             	lea    0x1(%eax),%edx
    37c9:	8b 45 0c             	mov    0xc(%ebp),%eax
    37cc:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    37ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    37d1:	83 c0 01             	add    $0x1,%eax
    37d4:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    37da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    37dd:	8d 50 ff             	lea    -0x1(%eax),%edx
    37e0:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    37e6:	39 c2                	cmp    %eax,%edx
    37e8:	0f 8d e5 fd ff ff    	jge    35d3 <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    37ee:	83 ec 04             	sub    $0x4,%esp
    37f1:	68 e8 03 00 00       	push   $0x3e8
    37f6:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    37fc:	50                   	push   %eax
    37fd:	ff 75 e8             	pushl  -0x18(%ebp)
    3800:	e8 2d cf ff ff       	call   732 <read>
    3805:	83 c4 10             	add    $0x10,%esp
    3808:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    380b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    380f:	0f 8f af fd ff ff    	jg     35c4 <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    3815:	83 ec 0c             	sub    $0xc,%esp
    3818:	ff 75 e8             	pushl  -0x18(%ebp)
    381b:	e8 22 cf ff ff       	call   742 <close>
    3820:	83 c4 10             	add    $0x10,%esp
}
    3823:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3826:	c9                   	leave  
    3827:	c3                   	ret    

00003828 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    3828:	55                   	push   %ebp
    3829:	89 e5                	mov    %esp,%ebp
    382b:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    3831:	83 ec 08             	sub    $0x8,%esp
    3834:	6a 02                	push   $0x2
    3836:	68 a0 3d 00 00       	push   $0x3da0
    383b:	e8 1a cf ff ff       	call   75a <open>
    3840:	83 c4 10             	add    $0x10,%esp
    3843:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3846:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    384a:	78 1e                	js     386a <writeVariables+0x42>
  {
    close(fd);
    384c:	83 ec 0c             	sub    $0xc,%esp
    384f:	ff 75 e4             	pushl  -0x1c(%ebp)
    3852:	e8 eb ce ff ff       	call   742 <close>
    3857:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    385a:	83 ec 0c             	sub    $0xc,%esp
    385d:	68 a0 3d 00 00       	push   $0x3da0
    3862:	e8 03 cf ff ff       	call   76a <unlink>
    3867:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    386a:	83 ec 08             	sub    $0x8,%esp
    386d:	68 02 02 00 00       	push   $0x202
    3872:	68 a0 3d 00 00       	push   $0x3da0
    3877:	e8 de ce ff ff       	call   75a <open>
    387c:	83 c4 10             	add    $0x10,%esp
    387f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    3882:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3889:	e9 ff 01 00 00       	jmp    3a8d <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    388e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3891:	c1 e0 05             	shl    $0x5,%eax
    3894:	89 c2                	mov    %eax,%edx
    3896:	8b 45 08             	mov    0x8(%ebp),%eax
    3899:	01 d0                	add    %edx,%eax
    389b:	8b 00                	mov    (%eax),%eax
    389d:	83 f8 01             	cmp    $0x1,%eax
    38a0:	0f 85 d3 00 00 00    	jne    3979 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    38a6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    38ad:	8b 45 e0             	mov    -0x20(%ebp),%eax
    38b0:	8d 50 01             	lea    0x1(%eax),%edx
    38b3:	89 55 e0             	mov    %edx,-0x20(%ebp)
    38b6:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    38bd:	64 
      int k=0;
    38be:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    38c5:	eb 2c                	jmp    38f3 <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    38c7:	8b 45 e0             	mov    -0x20(%ebp),%eax
    38ca:	8d 50 01             	lea    0x1(%eax),%edx
    38cd:	89 55 e0             	mov    %edx,-0x20(%ebp)
    38d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    38d3:	89 d1                	mov    %edx,%ecx
    38d5:	c1 e1 05             	shl    $0x5,%ecx
    38d8:	8b 55 08             	mov    0x8(%ebp),%edx
    38db:	01 d1                	add    %edx,%ecx
    38dd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    38e0:	01 ca                	add    %ecx,%edx
    38e2:	83 c2 04             	add    $0x4,%edx
    38e5:	0f b6 12             	movzbl (%edx),%edx
    38e8:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    38ef:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    38f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38f6:	c1 e0 05             	shl    $0x5,%eax
    38f9:	89 c2                	mov    %eax,%edx
    38fb:	8b 45 08             	mov    0x8(%ebp),%eax
    38fe:	01 c2                	add    %eax,%edx
    3900:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3903:	01 d0                	add    %edx,%eax
    3905:	83 c0 04             	add    $0x4,%eax
    3908:	0f b6 00             	movzbl (%eax),%eax
    390b:	84 c0                	test   %al,%al
    390d:	75 b8                	jne    38c7 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    390f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3912:	8d 50 01             	lea    0x1(%eax),%edx
    3915:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3918:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    391f:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    3920:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3923:	c1 e0 05             	shl    $0x5,%eax
    3926:	89 c2                	mov    %eax,%edx
    3928:	8b 45 08             	mov    0x8(%ebp),%eax
    392b:	01 d0                	add    %edx,%eax
    392d:	dd 40 18             	fldl   0x18(%eax)
    3930:	8d 45 e0             	lea    -0x20(%ebp),%eax
    3933:	50                   	push   %eax
    3934:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3938:	dd 1c 24             	fstpl  (%esp)
    393b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3941:	50                   	push   %eax
    3942:	e8 7d d5 ff ff       	call   ec4 <double2str>
    3947:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    394a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    394d:	8d 50 01             	lea    0x1(%eax),%edx
    3950:	89 55 e0             	mov    %edx,-0x20(%ebp)
    3953:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    395a:	00 
      write(fd,buf,pos);
    395b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    395e:	83 ec 04             	sub    $0x4,%esp
    3961:	50                   	push   %eax
    3962:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3968:	50                   	push   %eax
    3969:	ff 75 e4             	pushl  -0x1c(%ebp)
    396c:	e8 c9 cd ff ff       	call   73a <write>
    3971:	83 c4 10             	add    $0x10,%esp
    3974:	e9 10 01 00 00       	jmp    3a89 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    3979:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    3980:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3983:	8d 50 01             	lea    0x1(%eax),%edx
    3986:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3989:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    3990:	73 
      int k=0;
    3991:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    3998:	eb 2c                	jmp    39c6 <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    399a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    399d:	8d 50 01             	lea    0x1(%eax),%edx
    39a0:	89 55 ec             	mov    %edx,-0x14(%ebp)
    39a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    39a6:	89 d1                	mov    %edx,%ecx
    39a8:	c1 e1 05             	shl    $0x5,%ecx
    39ab:	8b 55 08             	mov    0x8(%ebp),%edx
    39ae:	01 d1                	add    %edx,%ecx
    39b0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    39b3:	01 ca                	add    %ecx,%edx
    39b5:	83 c2 04             	add    $0x4,%edx
    39b8:	0f b6 12             	movzbl (%edx),%edx
    39bb:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    39c2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    39c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39c9:	c1 e0 05             	shl    $0x5,%eax
    39cc:	89 c2                	mov    %eax,%edx
    39ce:	8b 45 08             	mov    0x8(%ebp),%eax
    39d1:	01 c2                	add    %eax,%edx
    39d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    39d6:	01 d0                	add    %edx,%eax
    39d8:	83 c0 04             	add    $0x4,%eax
    39db:	0f b6 00             	movzbl (%eax),%eax
    39de:	84 c0                	test   %al,%al
    39e0:	75 b8                	jne    399a <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    39e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    39e5:	8d 50 01             	lea    0x1(%eax),%edx
    39e8:	89 55 ec             	mov    %edx,-0x14(%ebp)
    39eb:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    39f2:	3d 
      k=0;
    39f3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    39fa:	eb 2c                	jmp    3a28 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    39fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    39ff:	8d 50 01             	lea    0x1(%eax),%edx
    3a02:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3a05:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3a08:	89 d1                	mov    %edx,%ecx
    3a0a:	c1 e1 05             	shl    $0x5,%ecx
    3a0d:	8b 55 08             	mov    0x8(%ebp),%edx
    3a10:	01 ca                	add    %ecx,%edx
    3a12:	8b 4a 18             	mov    0x18(%edx),%ecx
    3a15:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3a18:	01 ca                	add    %ecx,%edx
    3a1a:	0f b6 12             	movzbl (%edx),%edx
    3a1d:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    3a24:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    3a28:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a2b:	c1 e0 05             	shl    $0x5,%eax
    3a2e:	89 c2                	mov    %eax,%edx
    3a30:	8b 45 08             	mov    0x8(%ebp),%eax
    3a33:	01 d0                	add    %edx,%eax
    3a35:	8b 50 18             	mov    0x18(%eax),%edx
    3a38:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3a3b:	01 d0                	add    %edx,%eax
    3a3d:	0f b6 00             	movzbl (%eax),%eax
    3a40:	84 c0                	test   %al,%al
    3a42:	75 b8                	jne    39fc <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    3a44:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3a47:	8d 50 01             	lea    0x1(%eax),%edx
    3a4a:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3a4d:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    3a54:	00 
      write(fd,buf,pos);
    3a55:	83 ec 04             	sub    $0x4,%esp
    3a58:	ff 75 ec             	pushl  -0x14(%ebp)
    3a5b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3a61:	50                   	push   %eax
    3a62:	ff 75 e4             	pushl  -0x1c(%ebp)
    3a65:	e8 d0 cc ff ff       	call   73a <write>
    3a6a:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    3a6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a70:	c1 e0 05             	shl    $0x5,%eax
    3a73:	89 c2                	mov    %eax,%edx
    3a75:	8b 45 08             	mov    0x8(%ebp),%eax
    3a78:	01 d0                	add    %edx,%eax
    3a7a:	8b 40 18             	mov    0x18(%eax),%eax
    3a7d:	83 ec 0c             	sub    $0xc,%esp
    3a80:	50                   	push   %eax
    3a81:	e8 00 d1 ff ff       	call   b86 <free>
    3a86:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    3a89:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3a8d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a90:	8b 00                	mov    (%eax),%eax
    3a92:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3a95:	0f 8f f3 fd ff ff    	jg     388e <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    3a9b:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a9e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    3aa4:	83 ec 0c             	sub    $0xc,%esp
    3aa7:	ff 75 e4             	pushl  -0x1c(%ebp)
    3aaa:	e8 93 cc ff ff       	call   742 <close>
    3aaf:	83 c4 10             	add    $0x10,%esp
  return;
    3ab2:	90                   	nop
    3ab3:	c9                   	leave  
    3ab4:	c3                   	ret    
