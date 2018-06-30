
_usertests：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <opentest>:

// simple file system tests

void
opentest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(stdout, "open test\n");
       6:	a1 b4 96 00 00       	mov    0x96b4,%eax
       b:	83 ec 08             	sub    $0x8,%esp
       e:	68 b6 6f 00 00       	push   $0x6fb6
      13:	50                   	push   %eax
      14:	e8 96 3e 00 00       	call   3eaf <printf>
      19:	83 c4 10             	add    $0x10,%esp
  fd = open("echo", 0);
      1c:	83 ec 08             	sub    $0x8,%esp
      1f:	6a 00                	push   $0x0
      21:	68 a0 6f 00 00       	push   $0x6fa0
      26:	e8 18 3c 00 00       	call   3c43 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
      31:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      35:	79 1b                	jns    52 <opentest+0x52>
    printf(stdout, "open echo failed!\n");
      37:	a1 b4 96 00 00       	mov    0x96b4,%eax
      3c:	83 ec 08             	sub    $0x8,%esp
      3f:	68 c1 6f 00 00       	push   $0x6fc1
      44:	50                   	push   %eax
      45:	e8 65 3e 00 00       	call   3eaf <printf>
      4a:	83 c4 10             	add    $0x10,%esp
    exit();
      4d:	e8 b1 3b 00 00       	call   3c03 <exit>
  }
  close(fd);
      52:	83 ec 0c             	sub    $0xc,%esp
      55:	ff 75 f4             	pushl  -0xc(%ebp)
      58:	e8 ce 3b 00 00       	call   3c2b <close>
      5d:	83 c4 10             	add    $0x10,%esp
  fd = open("doesnotexist", 0);
      60:	83 ec 08             	sub    $0x8,%esp
      63:	6a 00                	push   $0x0
      65:	68 d4 6f 00 00       	push   $0x6fd4
      6a:	e8 d4 3b 00 00       	call   3c43 <open>
      6f:	83 c4 10             	add    $0x10,%esp
      72:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
      75:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      79:	78 1b                	js     96 <opentest+0x96>
    printf(stdout, "open doesnotexist succeeded!\n");
      7b:	a1 b4 96 00 00       	mov    0x96b4,%eax
      80:	83 ec 08             	sub    $0x8,%esp
      83:	68 e1 6f 00 00       	push   $0x6fe1
      88:	50                   	push   %eax
      89:	e8 21 3e 00 00       	call   3eaf <printf>
      8e:	83 c4 10             	add    $0x10,%esp
    exit();
      91:	e8 6d 3b 00 00       	call   3c03 <exit>
  }
  printf(stdout, "open test ok\n");
      96:	a1 b4 96 00 00       	mov    0x96b4,%eax
      9b:	83 ec 08             	sub    $0x8,%esp
      9e:	68 ff 6f 00 00       	push   $0x6fff
      a3:	50                   	push   %eax
      a4:	e8 06 3e 00 00       	call   3eaf <printf>
      a9:	83 c4 10             	add    $0x10,%esp
}
      ac:	90                   	nop
      ad:	c9                   	leave  
      ae:	c3                   	ret    

000000af <writetest>:

void
writetest(void)
{
      af:	55                   	push   %ebp
      b0:	89 e5                	mov    %esp,%ebp
      b2:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
      b5:	a1 b4 96 00 00       	mov    0x96b4,%eax
      ba:	83 ec 08             	sub    $0x8,%esp
      bd:	68 0d 70 00 00       	push   $0x700d
      c2:	50                   	push   %eax
      c3:	e8 e7 3d 00 00       	call   3eaf <printf>
      c8:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_CREATE|O_RDWR);
      cb:	83 ec 08             	sub    $0x8,%esp
      ce:	68 02 02 00 00       	push   $0x202
      d3:	68 1e 70 00 00       	push   $0x701e
      d8:	e8 66 3b 00 00       	call   3c43 <open>
      dd:	83 c4 10             	add    $0x10,%esp
      e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
      e3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
      e7:	78 22                	js     10b <writetest+0x5c>
    printf(stdout, "creat small succeeded; ok\n");
      e9:	a1 b4 96 00 00       	mov    0x96b4,%eax
      ee:	83 ec 08             	sub    $0x8,%esp
      f1:	68 24 70 00 00       	push   $0x7024
      f6:	50                   	push   %eax
      f7:	e8 b3 3d 00 00       	call   3eaf <printf>
      fc:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
      ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     106:	e9 8f 00 00 00       	jmp    19a <writetest+0xeb>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     10b:	a1 b4 96 00 00       	mov    0x96b4,%eax
     110:	83 ec 08             	sub    $0x8,%esp
     113:	68 3f 70 00 00       	push   $0x703f
     118:	50                   	push   %eax
     119:	e8 91 3d 00 00       	call   3eaf <printf>
     11e:	83 c4 10             	add    $0x10,%esp
    exit();
     121:	e8 dd 3a 00 00       	call   3c03 <exit>
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     126:	83 ec 04             	sub    $0x4,%esp
     129:	6a 0a                	push   $0xa
     12b:	68 5b 70 00 00       	push   $0x705b
     130:	ff 75 f0             	pushl  -0x10(%ebp)
     133:	e8 eb 3a 00 00       	call   3c23 <write>
     138:	83 c4 10             	add    $0x10,%esp
     13b:	83 f8 0a             	cmp    $0xa,%eax
     13e:	74 1e                	je     15e <writetest+0xaf>
      printf(stdout, "error: write aa %d new file failed\n", i);
     140:	a1 b4 96 00 00       	mov    0x96b4,%eax
     145:	83 ec 04             	sub    $0x4,%esp
     148:	ff 75 f4             	pushl  -0xc(%ebp)
     14b:	68 68 70 00 00       	push   $0x7068
     150:	50                   	push   %eax
     151:	e8 59 3d 00 00       	call   3eaf <printf>
     156:	83 c4 10             	add    $0x10,%esp
      exit();
     159:	e8 a5 3a 00 00       	call   3c03 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     15e:	83 ec 04             	sub    $0x4,%esp
     161:	6a 0a                	push   $0xa
     163:	68 8c 70 00 00       	push   $0x708c
     168:	ff 75 f0             	pushl  -0x10(%ebp)
     16b:	e8 b3 3a 00 00       	call   3c23 <write>
     170:	83 c4 10             	add    $0x10,%esp
     173:	83 f8 0a             	cmp    $0xa,%eax
     176:	74 1e                	je     196 <writetest+0xe7>
      printf(stdout, "error: write bb %d new file failed\n", i);
     178:	a1 b4 96 00 00       	mov    0x96b4,%eax
     17d:	83 ec 04             	sub    $0x4,%esp
     180:	ff 75 f4             	pushl  -0xc(%ebp)
     183:	68 98 70 00 00       	push   $0x7098
     188:	50                   	push   %eax
     189:	e8 21 3d 00 00       	call   3eaf <printf>
     18e:	83 c4 10             	add    $0x10,%esp
      exit();
     191:	e8 6d 3a 00 00       	call   3c03 <exit>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     196:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     19a:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     19e:	7e 86                	jle    126 <writetest+0x77>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     1a0:	a1 b4 96 00 00       	mov    0x96b4,%eax
     1a5:	83 ec 08             	sub    $0x8,%esp
     1a8:	68 bc 70 00 00       	push   $0x70bc
     1ad:	50                   	push   %eax
     1ae:	e8 fc 3c 00 00       	call   3eaf <printf>
     1b3:	83 c4 10             	add    $0x10,%esp
  close(fd);
     1b6:	83 ec 0c             	sub    $0xc,%esp
     1b9:	ff 75 f0             	pushl  -0x10(%ebp)
     1bc:	e8 6a 3a 00 00       	call   3c2b <close>
     1c1:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
     1c4:	83 ec 08             	sub    $0x8,%esp
     1c7:	6a 00                	push   $0x0
     1c9:	68 1e 70 00 00       	push   $0x701e
     1ce:	e8 70 3a 00 00       	call   3c43 <open>
     1d3:	83 c4 10             	add    $0x10,%esp
     1d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     1d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     1dd:	78 3c                	js     21b <writetest+0x16c>
    printf(stdout, "open small succeeded ok\n");
     1df:	a1 b4 96 00 00       	mov    0x96b4,%eax
     1e4:	83 ec 08             	sub    $0x8,%esp
     1e7:	68 c7 70 00 00       	push   $0x70c7
     1ec:	50                   	push   %eax
     1ed:	e8 bd 3c 00 00       	call   3eaf <printf>
     1f2:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     1f5:	83 ec 04             	sub    $0x4,%esp
     1f8:	68 d0 07 00 00       	push   $0x7d0
     1fd:	68 c0 bf 00 00       	push   $0xbfc0
     202:	ff 75 f0             	pushl  -0x10(%ebp)
     205:	e8 11 3a 00 00       	call   3c1b <read>
     20a:	83 c4 10             	add    $0x10,%esp
     20d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(i == 2000){
     210:	81 7d f4 d0 07 00 00 	cmpl   $0x7d0,-0xc(%ebp)
     217:	75 57                	jne    270 <writetest+0x1c1>
     219:	eb 1b                	jmp    236 <writetest+0x187>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     21b:	a1 b4 96 00 00       	mov    0x96b4,%eax
     220:	83 ec 08             	sub    $0x8,%esp
     223:	68 e0 70 00 00       	push   $0x70e0
     228:	50                   	push   %eax
     229:	e8 81 3c 00 00       	call   3eaf <printf>
     22e:	83 c4 10             	add    $0x10,%esp
    exit();
     231:	e8 cd 39 00 00       	call   3c03 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
     236:	a1 b4 96 00 00       	mov    0x96b4,%eax
     23b:	83 ec 08             	sub    $0x8,%esp
     23e:	68 fb 70 00 00       	push   $0x70fb
     243:	50                   	push   %eax
     244:	e8 66 3c 00 00       	call   3eaf <printf>
     249:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     24c:	83 ec 0c             	sub    $0xc,%esp
     24f:	ff 75 f0             	pushl  -0x10(%ebp)
     252:	e8 d4 39 00 00       	call   3c2b <close>
     257:	83 c4 10             	add    $0x10,%esp

  if(unlink("small") < 0){
     25a:	83 ec 0c             	sub    $0xc,%esp
     25d:	68 1e 70 00 00       	push   $0x701e
     262:	e8 ec 39 00 00       	call   3c53 <unlink>
     267:	83 c4 10             	add    $0x10,%esp
     26a:	85 c0                	test   %eax,%eax
     26c:	79 38                	jns    2a6 <writetest+0x1f7>
     26e:	eb 1b                	jmp    28b <writetest+0x1dc>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     270:	a1 b4 96 00 00       	mov    0x96b4,%eax
     275:	83 ec 08             	sub    $0x8,%esp
     278:	68 0e 71 00 00       	push   $0x710e
     27d:	50                   	push   %eax
     27e:	e8 2c 3c 00 00       	call   3eaf <printf>
     283:	83 c4 10             	add    $0x10,%esp
    exit();
     286:	e8 78 39 00 00       	call   3c03 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     28b:	a1 b4 96 00 00       	mov    0x96b4,%eax
     290:	83 ec 08             	sub    $0x8,%esp
     293:	68 1b 71 00 00       	push   $0x711b
     298:	50                   	push   %eax
     299:	e8 11 3c 00 00       	call   3eaf <printf>
     29e:	83 c4 10             	add    $0x10,%esp
    exit();
     2a1:	e8 5d 39 00 00       	call   3c03 <exit>
  }
  printf(stdout, "small file test ok\n");
     2a6:	a1 b4 96 00 00       	mov    0x96b4,%eax
     2ab:	83 ec 08             	sub    $0x8,%esp
     2ae:	68 30 71 00 00       	push   $0x7130
     2b3:	50                   	push   %eax
     2b4:	e8 f6 3b 00 00       	call   3eaf <printf>
     2b9:	83 c4 10             	add    $0x10,%esp
}
     2bc:	90                   	nop
     2bd:	c9                   	leave  
     2be:	c3                   	ret    

000002bf <writetest1>:

void
writetest1(void)
{
     2bf:	55                   	push   %ebp
     2c0:	89 e5                	mov    %esp,%ebp
     2c2:	83 ec 18             	sub    $0x18,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
     2c5:	a1 b4 96 00 00       	mov    0x96b4,%eax
     2ca:	83 ec 08             	sub    $0x8,%esp
     2cd:	68 44 71 00 00       	push   $0x7144
     2d2:	50                   	push   %eax
     2d3:	e8 d7 3b 00 00       	call   3eaf <printf>
     2d8:	83 c4 10             	add    $0x10,%esp

  fd = open("big", O_CREATE|O_RDWR);
     2db:	83 ec 08             	sub    $0x8,%esp
     2de:	68 02 02 00 00       	push   $0x202
     2e3:	68 54 71 00 00       	push   $0x7154
     2e8:	e8 56 39 00 00       	call   3c43 <open>
     2ed:	83 c4 10             	add    $0x10,%esp
     2f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     2f3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     2f7:	79 1b                	jns    314 <writetest1+0x55>
    printf(stdout, "error: creat big failed!\n");
     2f9:	a1 b4 96 00 00       	mov    0x96b4,%eax
     2fe:	83 ec 08             	sub    $0x8,%esp
     301:	68 58 71 00 00       	push   $0x7158
     306:	50                   	push   %eax
     307:	e8 a3 3b 00 00       	call   3eaf <printf>
     30c:	83 c4 10             	add    $0x10,%esp
    exit();
     30f:	e8 ef 38 00 00       	call   3c03 <exit>
  }

  for(i = 0; i < MAXFILE; i++){
     314:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     31b:	eb 4b                	jmp    368 <writetest1+0xa9>
    ((int*)buf)[0] = i;
     31d:	ba c0 bf 00 00       	mov    $0xbfc0,%edx
     322:	8b 45 f4             	mov    -0xc(%ebp),%eax
     325:	89 02                	mov    %eax,(%edx)
    if(write(fd, buf, 512) != 512){
     327:	83 ec 04             	sub    $0x4,%esp
     32a:	68 00 02 00 00       	push   $0x200
     32f:	68 c0 bf 00 00       	push   $0xbfc0
     334:	ff 75 ec             	pushl  -0x14(%ebp)
     337:	e8 e7 38 00 00       	call   3c23 <write>
     33c:	83 c4 10             	add    $0x10,%esp
     33f:	3d 00 02 00 00       	cmp    $0x200,%eax
     344:	74 1e                	je     364 <writetest1+0xa5>
      printf(stdout, "error: write big file failed\n", i);
     346:	a1 b4 96 00 00       	mov    0x96b4,%eax
     34b:	83 ec 04             	sub    $0x4,%esp
     34e:	ff 75 f4             	pushl  -0xc(%ebp)
     351:	68 72 71 00 00       	push   $0x7172
     356:	50                   	push   %eax
     357:	e8 53 3b 00 00       	call   3eaf <printf>
     35c:	83 c4 10             	add    $0x10,%esp
      exit();
     35f:	e8 9f 38 00 00       	call   3c03 <exit>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     364:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     368:	8b 45 f4             	mov    -0xc(%ebp),%eax
     36b:	3d 8b 00 00 00       	cmp    $0x8b,%eax
     370:	76 ab                	jbe    31d <writetest1+0x5e>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     372:	83 ec 0c             	sub    $0xc,%esp
     375:	ff 75 ec             	pushl  -0x14(%ebp)
     378:	e8 ae 38 00 00       	call   3c2b <close>
     37d:	83 c4 10             	add    $0x10,%esp

  fd = open("big", O_RDONLY);
     380:	83 ec 08             	sub    $0x8,%esp
     383:	6a 00                	push   $0x0
     385:	68 54 71 00 00       	push   $0x7154
     38a:	e8 b4 38 00 00       	call   3c43 <open>
     38f:	83 c4 10             	add    $0x10,%esp
     392:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     395:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     399:	79 1b                	jns    3b6 <writetest1+0xf7>
    printf(stdout, "error: open big failed!\n");
     39b:	a1 b4 96 00 00       	mov    0x96b4,%eax
     3a0:	83 ec 08             	sub    $0x8,%esp
     3a3:	68 90 71 00 00       	push   $0x7190
     3a8:	50                   	push   %eax
     3a9:	e8 01 3b 00 00       	call   3eaf <printf>
     3ae:	83 c4 10             	add    $0x10,%esp
    exit();
     3b1:	e8 4d 38 00 00       	call   3c03 <exit>
  }

  n = 0;
     3b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(;;){
    i = read(fd, buf, 512);
     3bd:	83 ec 04             	sub    $0x4,%esp
     3c0:	68 00 02 00 00       	push   $0x200
     3c5:	68 c0 bf 00 00       	push   $0xbfc0
     3ca:	ff 75 ec             	pushl  -0x14(%ebp)
     3cd:	e8 49 38 00 00       	call   3c1b <read>
     3d2:	83 c4 10             	add    $0x10,%esp
     3d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(i == 0){
     3d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     3dc:	75 27                	jne    405 <writetest1+0x146>
      if(n == MAXFILE - 1){
     3de:	81 7d f0 8b 00 00 00 	cmpl   $0x8b,-0x10(%ebp)
     3e5:	75 7d                	jne    464 <writetest1+0x1a5>
        printf(stdout, "read only %d blocks from big", n);
     3e7:	a1 b4 96 00 00       	mov    0x96b4,%eax
     3ec:	83 ec 04             	sub    $0x4,%esp
     3ef:	ff 75 f0             	pushl  -0x10(%ebp)
     3f2:	68 a9 71 00 00       	push   $0x71a9
     3f7:	50                   	push   %eax
     3f8:	e8 b2 3a 00 00       	call   3eaf <printf>
     3fd:	83 c4 10             	add    $0x10,%esp
        exit();
     400:	e8 fe 37 00 00       	call   3c03 <exit>
      }
      break;
    } else if(i != 512){
     405:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
     40c:	74 1e                	je     42c <writetest1+0x16d>
      printf(stdout, "read failed %d\n", i);
     40e:	a1 b4 96 00 00       	mov    0x96b4,%eax
     413:	83 ec 04             	sub    $0x4,%esp
     416:	ff 75 f4             	pushl  -0xc(%ebp)
     419:	68 c6 71 00 00       	push   $0x71c6
     41e:	50                   	push   %eax
     41f:	e8 8b 3a 00 00       	call   3eaf <printf>
     424:	83 c4 10             	add    $0x10,%esp
      exit();
     427:	e8 d7 37 00 00       	call   3c03 <exit>
    }
    if(((int*)buf)[0] != n){
     42c:	b8 c0 bf 00 00       	mov    $0xbfc0,%eax
     431:	8b 00                	mov    (%eax),%eax
     433:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     436:	74 23                	je     45b <writetest1+0x19c>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
     438:	b8 c0 bf 00 00       	mov    $0xbfc0,%eax
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     43d:	8b 10                	mov    (%eax),%edx
     43f:	a1 b4 96 00 00       	mov    0x96b4,%eax
     444:	52                   	push   %edx
     445:	ff 75 f0             	pushl  -0x10(%ebp)
     448:	68 d8 71 00 00       	push   $0x71d8
     44d:	50                   	push   %eax
     44e:	e8 5c 3a 00 00       	call   3eaf <printf>
     453:	83 c4 10             	add    $0x10,%esp
             n, ((int*)buf)[0]);
      exit();
     456:	e8 a8 37 00 00       	call   3c03 <exit>
    }
    n++;
     45b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }
     45f:	e9 59 ff ff ff       	jmp    3bd <writetest1+0xfe>
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
     464:	90                   	nop
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     465:	83 ec 0c             	sub    $0xc,%esp
     468:	ff 75 ec             	pushl  -0x14(%ebp)
     46b:	e8 bb 37 00 00       	call   3c2b <close>
     470:	83 c4 10             	add    $0x10,%esp
  if(unlink("big") < 0){
     473:	83 ec 0c             	sub    $0xc,%esp
     476:	68 54 71 00 00       	push   $0x7154
     47b:	e8 d3 37 00 00       	call   3c53 <unlink>
     480:	83 c4 10             	add    $0x10,%esp
     483:	85 c0                	test   %eax,%eax
     485:	79 1b                	jns    4a2 <writetest1+0x1e3>
    printf(stdout, "unlink big failed\n");
     487:	a1 b4 96 00 00       	mov    0x96b4,%eax
     48c:	83 ec 08             	sub    $0x8,%esp
     48f:	68 f8 71 00 00       	push   $0x71f8
     494:	50                   	push   %eax
     495:	e8 15 3a 00 00       	call   3eaf <printf>
     49a:	83 c4 10             	add    $0x10,%esp
    exit();
     49d:	e8 61 37 00 00       	call   3c03 <exit>
  }
  printf(stdout, "big files ok\n");
     4a2:	a1 b4 96 00 00       	mov    0x96b4,%eax
     4a7:	83 ec 08             	sub    $0x8,%esp
     4aa:	68 0b 72 00 00       	push   $0x720b
     4af:	50                   	push   %eax
     4b0:	e8 fa 39 00 00       	call   3eaf <printf>
     4b5:	83 c4 10             	add    $0x10,%esp
}
     4b8:	90                   	nop
     4b9:	c9                   	leave  
     4ba:	c3                   	ret    

000004bb <createtest>:

void
createtest(void)
{
     4bb:	55                   	push   %ebp
     4bc:	89 e5                	mov    %esp,%ebp
     4be:	83 ec 18             	sub    $0x18,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     4c1:	a1 b4 96 00 00       	mov    0x96b4,%eax
     4c6:	83 ec 08             	sub    $0x8,%esp
     4c9:	68 1c 72 00 00       	push   $0x721c
     4ce:	50                   	push   %eax
     4cf:	e8 db 39 00 00       	call   3eaf <printf>
     4d4:	83 c4 10             	add    $0x10,%esp

  name[0] = 'a';
     4d7:	c6 05 c0 df 00 00 61 	movb   $0x61,0xdfc0
  name[2] = '\0';
     4de:	c6 05 c2 df 00 00 00 	movb   $0x0,0xdfc2
  for(i = 0; i < 52; i++){
     4e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     4ec:	eb 35                	jmp    523 <createtest+0x68>
    name[1] = '0' + i;
     4ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4f1:	83 c0 30             	add    $0x30,%eax
     4f4:	a2 c1 df 00 00       	mov    %al,0xdfc1
    fd = open(name, O_CREATE|O_RDWR);
     4f9:	83 ec 08             	sub    $0x8,%esp
     4fc:	68 02 02 00 00       	push   $0x202
     501:	68 c0 df 00 00       	push   $0xdfc0
     506:	e8 38 37 00 00       	call   3c43 <open>
     50b:	83 c4 10             	add    $0x10,%esp
     50e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(fd);
     511:	83 ec 0c             	sub    $0xc,%esp
     514:	ff 75 f0             	pushl  -0x10(%ebp)
     517:	e8 0f 37 00 00       	call   3c2b <close>
     51c:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     51f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     523:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     527:	7e c5                	jle    4ee <createtest+0x33>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     529:	c6 05 c0 df 00 00 61 	movb   $0x61,0xdfc0
  name[2] = '\0';
     530:	c6 05 c2 df 00 00 00 	movb   $0x0,0xdfc2
  for(i = 0; i < 52; i++){
     537:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     53e:	eb 1f                	jmp    55f <createtest+0xa4>
    name[1] = '0' + i;
     540:	8b 45 f4             	mov    -0xc(%ebp),%eax
     543:	83 c0 30             	add    $0x30,%eax
     546:	a2 c1 df 00 00       	mov    %al,0xdfc1
    unlink(name);
     54b:	83 ec 0c             	sub    $0xc,%esp
     54e:	68 c0 df 00 00       	push   $0xdfc0
     553:	e8 fb 36 00 00       	call   3c53 <unlink>
     558:	83 c4 10             	add    $0x10,%esp
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     55b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     55f:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     563:	7e db                	jle    540 <createtest+0x85>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     565:	a1 b4 96 00 00       	mov    0x96b4,%eax
     56a:	83 ec 08             	sub    $0x8,%esp
     56d:	68 44 72 00 00       	push   $0x7244
     572:	50                   	push   %eax
     573:	e8 37 39 00 00       	call   3eaf <printf>
     578:	83 c4 10             	add    $0x10,%esp
}
     57b:	90                   	nop
     57c:	c9                   	leave  
     57d:	c3                   	ret    

0000057e <dirtest>:

void dirtest(void)
{
     57e:	55                   	push   %ebp
     57f:	89 e5                	mov    %esp,%ebp
     581:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "mkdir test\n");
     584:	a1 b4 96 00 00       	mov    0x96b4,%eax
     589:	83 ec 08             	sub    $0x8,%esp
     58c:	68 6a 72 00 00       	push   $0x726a
     591:	50                   	push   %eax
     592:	e8 18 39 00 00       	call   3eaf <printf>
     597:	83 c4 10             	add    $0x10,%esp

  if(mkdir("dir0") < 0){
     59a:	83 ec 0c             	sub    $0xc,%esp
     59d:	68 76 72 00 00       	push   $0x7276
     5a2:	e8 c4 36 00 00       	call   3c6b <mkdir>
     5a7:	83 c4 10             	add    $0x10,%esp
     5aa:	85 c0                	test   %eax,%eax
     5ac:	79 1b                	jns    5c9 <dirtest+0x4b>
    printf(stdout, "mkdir failed\n");
     5ae:	a1 b4 96 00 00       	mov    0x96b4,%eax
     5b3:	83 ec 08             	sub    $0x8,%esp
     5b6:	68 7b 72 00 00       	push   $0x727b
     5bb:	50                   	push   %eax
     5bc:	e8 ee 38 00 00       	call   3eaf <printf>
     5c1:	83 c4 10             	add    $0x10,%esp
    exit();
     5c4:	e8 3a 36 00 00       	call   3c03 <exit>
  }

  if(chdir("dir0") < 0){
     5c9:	83 ec 0c             	sub    $0xc,%esp
     5cc:	68 76 72 00 00       	push   $0x7276
     5d1:	e8 9d 36 00 00       	call   3c73 <chdir>
     5d6:	83 c4 10             	add    $0x10,%esp
     5d9:	85 c0                	test   %eax,%eax
     5db:	79 1b                	jns    5f8 <dirtest+0x7a>
    printf(stdout, "chdir dir0 failed\n");
     5dd:	a1 b4 96 00 00       	mov    0x96b4,%eax
     5e2:	83 ec 08             	sub    $0x8,%esp
     5e5:	68 89 72 00 00       	push   $0x7289
     5ea:	50                   	push   %eax
     5eb:	e8 bf 38 00 00       	call   3eaf <printf>
     5f0:	83 c4 10             	add    $0x10,%esp
    exit();
     5f3:	e8 0b 36 00 00       	call   3c03 <exit>
  }

  if(chdir("..") < 0){
     5f8:	83 ec 0c             	sub    $0xc,%esp
     5fb:	68 9c 72 00 00       	push   $0x729c
     600:	e8 6e 36 00 00       	call   3c73 <chdir>
     605:	83 c4 10             	add    $0x10,%esp
     608:	85 c0                	test   %eax,%eax
     60a:	79 1b                	jns    627 <dirtest+0xa9>
    printf(stdout, "chdir .. failed\n");
     60c:	a1 b4 96 00 00       	mov    0x96b4,%eax
     611:	83 ec 08             	sub    $0x8,%esp
     614:	68 9f 72 00 00       	push   $0x729f
     619:	50                   	push   %eax
     61a:	e8 90 38 00 00       	call   3eaf <printf>
     61f:	83 c4 10             	add    $0x10,%esp
    exit();
     622:	e8 dc 35 00 00       	call   3c03 <exit>
  }

  if(unlink("dir0") < 0){
     627:	83 ec 0c             	sub    $0xc,%esp
     62a:	68 76 72 00 00       	push   $0x7276
     62f:	e8 1f 36 00 00       	call   3c53 <unlink>
     634:	83 c4 10             	add    $0x10,%esp
     637:	85 c0                	test   %eax,%eax
     639:	79 1b                	jns    656 <dirtest+0xd8>
    printf(stdout, "unlink dir0 failed\n");
     63b:	a1 b4 96 00 00       	mov    0x96b4,%eax
     640:	83 ec 08             	sub    $0x8,%esp
     643:	68 b0 72 00 00       	push   $0x72b0
     648:	50                   	push   %eax
     649:	e8 61 38 00 00       	call   3eaf <printf>
     64e:	83 c4 10             	add    $0x10,%esp
    exit();
     651:	e8 ad 35 00 00       	call   3c03 <exit>
  }
  printf(stdout, "mkdir test\n");
     656:	a1 b4 96 00 00       	mov    0x96b4,%eax
     65b:	83 ec 08             	sub    $0x8,%esp
     65e:	68 6a 72 00 00       	push   $0x726a
     663:	50                   	push   %eax
     664:	e8 46 38 00 00       	call   3eaf <printf>
     669:	83 c4 10             	add    $0x10,%esp
}
     66c:	90                   	nop
     66d:	c9                   	leave  
     66e:	c3                   	ret    

0000066f <exectest>:

void
exectest(void)
{
     66f:	55                   	push   %ebp
     670:	89 e5                	mov    %esp,%ebp
     672:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "exec test\n");
     675:	a1 b4 96 00 00       	mov    0x96b4,%eax
     67a:	83 ec 08             	sub    $0x8,%esp
     67d:	68 c4 72 00 00       	push   $0x72c4
     682:	50                   	push   %eax
     683:	e8 27 38 00 00       	call   3eaf <printf>
     688:	83 c4 10             	add    $0x10,%esp
  if(exec("echo", echoargv) < 0){
     68b:	83 ec 08             	sub    $0x8,%esp
     68e:	68 a0 96 00 00       	push   $0x96a0
     693:	68 a0 6f 00 00       	push   $0x6fa0
     698:	e8 9e 35 00 00       	call   3c3b <exec>
     69d:	83 c4 10             	add    $0x10,%esp
     6a0:	85 c0                	test   %eax,%eax
     6a2:	79 1b                	jns    6bf <exectest+0x50>
    printf(stdout, "exec echo failed\n");
     6a4:	a1 b4 96 00 00       	mov    0x96b4,%eax
     6a9:	83 ec 08             	sub    $0x8,%esp
     6ac:	68 cf 72 00 00       	push   $0x72cf
     6b1:	50                   	push   %eax
     6b2:	e8 f8 37 00 00       	call   3eaf <printf>
     6b7:	83 c4 10             	add    $0x10,%esp
    exit();
     6ba:	e8 44 35 00 00       	call   3c03 <exit>
  }
}
     6bf:	90                   	nop
     6c0:	c9                   	leave  
     6c1:	c3                   	ret    

000006c2 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     6c2:	55                   	push   %ebp
     6c3:	89 e5                	mov    %esp,%ebp
     6c5:	83 ec 28             	sub    $0x28,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     6c8:	83 ec 0c             	sub    $0xc,%esp
     6cb:	8d 45 d8             	lea    -0x28(%ebp),%eax
     6ce:	50                   	push   %eax
     6cf:	e8 3f 35 00 00       	call   3c13 <pipe>
     6d4:	83 c4 10             	add    $0x10,%esp
     6d7:	85 c0                	test   %eax,%eax
     6d9:	74 17                	je     6f2 <pipe1+0x30>
    printf(1, "pipe() failed\n");
     6db:	83 ec 08             	sub    $0x8,%esp
     6de:	68 e1 72 00 00       	push   $0x72e1
     6e3:	6a 01                	push   $0x1
     6e5:	e8 c5 37 00 00       	call   3eaf <printf>
     6ea:	83 c4 10             	add    $0x10,%esp
    exit();
     6ed:	e8 11 35 00 00       	call   3c03 <exit>
  }
  pid = fork();
     6f2:	e8 04 35 00 00       	call   3bfb <fork>
     6f7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  seq = 0;
     6fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(pid == 0){
     701:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     705:	0f 85 89 00 00 00    	jne    794 <pipe1+0xd2>
    close(fds[0]);
     70b:	8b 45 d8             	mov    -0x28(%ebp),%eax
     70e:	83 ec 0c             	sub    $0xc,%esp
     711:	50                   	push   %eax
     712:	e8 14 35 00 00       	call   3c2b <close>
     717:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
     71a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     721:	eb 66                	jmp    789 <pipe1+0xc7>
      for(i = 0; i < 1033; i++)
     723:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     72a:	eb 19                	jmp    745 <pipe1+0x83>
        buf[i] = seq++;
     72c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     72f:	8d 50 01             	lea    0x1(%eax),%edx
     732:	89 55 f4             	mov    %edx,-0xc(%ebp)
     735:	89 c2                	mov    %eax,%edx
     737:	8b 45 f0             	mov    -0x10(%ebp),%eax
     73a:	05 c0 bf 00 00       	add    $0xbfc0,%eax
     73f:	88 10                	mov    %dl,(%eax)
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     741:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     745:	81 7d f0 08 04 00 00 	cmpl   $0x408,-0x10(%ebp)
     74c:	7e de                	jle    72c <pipe1+0x6a>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     74e:	8b 45 dc             	mov    -0x24(%ebp),%eax
     751:	83 ec 04             	sub    $0x4,%esp
     754:	68 09 04 00 00       	push   $0x409
     759:	68 c0 bf 00 00       	push   $0xbfc0
     75e:	50                   	push   %eax
     75f:	e8 bf 34 00 00       	call   3c23 <write>
     764:	83 c4 10             	add    $0x10,%esp
     767:	3d 09 04 00 00       	cmp    $0x409,%eax
     76c:	74 17                	je     785 <pipe1+0xc3>
        printf(1, "pipe1 oops 1\n");
     76e:	83 ec 08             	sub    $0x8,%esp
     771:	68 f0 72 00 00       	push   $0x72f0
     776:	6a 01                	push   $0x1
     778:	e8 32 37 00 00       	call   3eaf <printf>
     77d:	83 c4 10             	add    $0x10,%esp
        exit();
     780:	e8 7e 34 00 00       	call   3c03 <exit>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     785:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
     789:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
     78d:	7e 94                	jle    723 <pipe1+0x61>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     78f:	e8 6f 34 00 00       	call   3c03 <exit>
  } else if(pid > 0){
     794:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     798:	0f 8e f4 00 00 00    	jle    892 <pipe1+0x1d0>
    close(fds[1]);
     79e:	8b 45 dc             	mov    -0x24(%ebp),%eax
     7a1:	83 ec 0c             	sub    $0xc,%esp
     7a4:	50                   	push   %eax
     7a5:	e8 81 34 00 00       	call   3c2b <close>
     7aa:	83 c4 10             	add    $0x10,%esp
    total = 0;
     7ad:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    cc = 1;
     7b4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     7bb:	eb 66                	jmp    823 <pipe1+0x161>
      for(i = 0; i < n; i++){
     7bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     7c4:	eb 3b                	jmp    801 <pipe1+0x13f>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     7c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7c9:	05 c0 bf 00 00       	add    $0xbfc0,%eax
     7ce:	0f b6 00             	movzbl (%eax),%eax
     7d1:	0f be c8             	movsbl %al,%ecx
     7d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7d7:	8d 50 01             	lea    0x1(%eax),%edx
     7da:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7dd:	31 c8                	xor    %ecx,%eax
     7df:	0f b6 c0             	movzbl %al,%eax
     7e2:	85 c0                	test   %eax,%eax
     7e4:	74 17                	je     7fd <pipe1+0x13b>
          printf(1, "pipe1 oops 2\n");
     7e6:	83 ec 08             	sub    $0x8,%esp
     7e9:	68 fe 72 00 00       	push   $0x72fe
     7ee:	6a 01                	push   $0x1
     7f0:	e8 ba 36 00 00       	call   3eaf <printf>
     7f5:	83 c4 10             	add    $0x10,%esp
     7f8:	e9 ac 00 00 00       	jmp    8a9 <pipe1+0x1e7>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     7fd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     801:	8b 45 f0             	mov    -0x10(%ebp),%eax
     804:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     807:	7c bd                	jl     7c6 <pipe1+0x104>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     809:	8b 45 ec             	mov    -0x14(%ebp),%eax
     80c:	01 45 e4             	add    %eax,-0x1c(%ebp)
      cc = cc * 2;
     80f:	d1 65 e8             	shll   -0x18(%ebp)
      if(cc > sizeof(buf))
     812:	8b 45 e8             	mov    -0x18(%ebp),%eax
     815:	3d 00 20 00 00       	cmp    $0x2000,%eax
     81a:	76 07                	jbe    823 <pipe1+0x161>
        cc = sizeof(buf);
     81c:	c7 45 e8 00 20 00 00 	movl   $0x2000,-0x18(%ebp)
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     823:	8b 45 d8             	mov    -0x28(%ebp),%eax
     826:	83 ec 04             	sub    $0x4,%esp
     829:	ff 75 e8             	pushl  -0x18(%ebp)
     82c:	68 c0 bf 00 00       	push   $0xbfc0
     831:	50                   	push   %eax
     832:	e8 e4 33 00 00       	call   3c1b <read>
     837:	83 c4 10             	add    $0x10,%esp
     83a:	89 45 ec             	mov    %eax,-0x14(%ebp)
     83d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     841:	0f 8f 76 ff ff ff    	jg     7bd <pipe1+0xfb>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     847:	81 7d e4 2d 14 00 00 	cmpl   $0x142d,-0x1c(%ebp)
     84e:	74 1a                	je     86a <pipe1+0x1a8>
      printf(1, "pipe1 oops 3 total %d\n", total);
     850:	83 ec 04             	sub    $0x4,%esp
     853:	ff 75 e4             	pushl  -0x1c(%ebp)
     856:	68 0c 73 00 00       	push   $0x730c
     85b:	6a 01                	push   $0x1
     85d:	e8 4d 36 00 00       	call   3eaf <printf>
     862:	83 c4 10             	add    $0x10,%esp
      exit();
     865:	e8 99 33 00 00       	call   3c03 <exit>
    }
    close(fds[0]);
     86a:	8b 45 d8             	mov    -0x28(%ebp),%eax
     86d:	83 ec 0c             	sub    $0xc,%esp
     870:	50                   	push   %eax
     871:	e8 b5 33 00 00       	call   3c2b <close>
     876:	83 c4 10             	add    $0x10,%esp
    wait();
     879:	e8 8d 33 00 00       	call   3c0b <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     87e:	83 ec 08             	sub    $0x8,%esp
     881:	68 32 73 00 00       	push   $0x7332
     886:	6a 01                	push   $0x1
     888:	e8 22 36 00 00       	call   3eaf <printf>
     88d:	83 c4 10             	add    $0x10,%esp
     890:	eb 17                	jmp    8a9 <pipe1+0x1e7>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     892:	83 ec 08             	sub    $0x8,%esp
     895:	68 23 73 00 00       	push   $0x7323
     89a:	6a 01                	push   $0x1
     89c:	e8 0e 36 00 00       	call   3eaf <printf>
     8a1:	83 c4 10             	add    $0x10,%esp
    exit();
     8a4:	e8 5a 33 00 00       	call   3c03 <exit>
  }
  printf(1, "pipe1 ok\n");
}
     8a9:	c9                   	leave  
     8aa:	c3                   	ret    

000008ab <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     8ab:	55                   	push   %ebp
     8ac:	89 e5                	mov    %esp,%ebp
     8ae:	83 ec 28             	sub    $0x28,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     8b1:	83 ec 08             	sub    $0x8,%esp
     8b4:	68 3c 73 00 00       	push   $0x733c
     8b9:	6a 01                	push   $0x1
     8bb:	e8 ef 35 00 00       	call   3eaf <printf>
     8c0:	83 c4 10             	add    $0x10,%esp
  pid1 = fork();
     8c3:	e8 33 33 00 00       	call   3bfb <fork>
     8c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid1 == 0)
     8cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     8cf:	75 02                	jne    8d3 <preempt+0x28>
    for(;;)
      ;
     8d1:	eb fe                	jmp    8d1 <preempt+0x26>

  pid2 = fork();
     8d3:	e8 23 33 00 00       	call   3bfb <fork>
     8d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid2 == 0)
     8db:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     8df:	75 02                	jne    8e3 <preempt+0x38>
    for(;;)
      ;
     8e1:	eb fe                	jmp    8e1 <preempt+0x36>

  pipe(pfds);
     8e3:	83 ec 0c             	sub    $0xc,%esp
     8e6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     8e9:	50                   	push   %eax
     8ea:	e8 24 33 00 00       	call   3c13 <pipe>
     8ef:	83 c4 10             	add    $0x10,%esp
  pid3 = fork();
     8f2:	e8 04 33 00 00       	call   3bfb <fork>
     8f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid3 == 0){
     8fa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     8fe:	75 4d                	jne    94d <preempt+0xa2>
    close(pfds[0]);
     900:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     903:	83 ec 0c             	sub    $0xc,%esp
     906:	50                   	push   %eax
     907:	e8 1f 33 00 00       	call   3c2b <close>
     90c:	83 c4 10             	add    $0x10,%esp
    if(write(pfds[1], "x", 1) != 1)
     90f:	8b 45 e8             	mov    -0x18(%ebp),%eax
     912:	83 ec 04             	sub    $0x4,%esp
     915:	6a 01                	push   $0x1
     917:	68 46 73 00 00       	push   $0x7346
     91c:	50                   	push   %eax
     91d:	e8 01 33 00 00       	call   3c23 <write>
     922:	83 c4 10             	add    $0x10,%esp
     925:	83 f8 01             	cmp    $0x1,%eax
     928:	74 12                	je     93c <preempt+0x91>
      printf(1, "preempt write error");
     92a:	83 ec 08             	sub    $0x8,%esp
     92d:	68 48 73 00 00       	push   $0x7348
     932:	6a 01                	push   $0x1
     934:	e8 76 35 00 00       	call   3eaf <printf>
     939:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     93c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     93f:	83 ec 0c             	sub    $0xc,%esp
     942:	50                   	push   %eax
     943:	e8 e3 32 00 00       	call   3c2b <close>
     948:	83 c4 10             	add    $0x10,%esp
    for(;;)
      ;
     94b:	eb fe                	jmp    94b <preempt+0xa0>
  }

  close(pfds[1]);
     94d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     950:	83 ec 0c             	sub    $0xc,%esp
     953:	50                   	push   %eax
     954:	e8 d2 32 00 00       	call   3c2b <close>
     959:	83 c4 10             	add    $0x10,%esp
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     95c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     95f:	83 ec 04             	sub    $0x4,%esp
     962:	68 00 20 00 00       	push   $0x2000
     967:	68 c0 bf 00 00       	push   $0xbfc0
     96c:	50                   	push   %eax
     96d:	e8 a9 32 00 00       	call   3c1b <read>
     972:	83 c4 10             	add    $0x10,%esp
     975:	83 f8 01             	cmp    $0x1,%eax
     978:	74 14                	je     98e <preempt+0xe3>
    printf(1, "preempt read error");
     97a:	83 ec 08             	sub    $0x8,%esp
     97d:	68 5c 73 00 00       	push   $0x735c
     982:	6a 01                	push   $0x1
     984:	e8 26 35 00 00       	call   3eaf <printf>
     989:	83 c4 10             	add    $0x10,%esp
     98c:	eb 7e                	jmp    a0c <preempt+0x161>
    return;
  }
  close(pfds[0]);
     98e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     991:	83 ec 0c             	sub    $0xc,%esp
     994:	50                   	push   %eax
     995:	e8 91 32 00 00       	call   3c2b <close>
     99a:	83 c4 10             	add    $0x10,%esp
  printf(1, "kill... ");
     99d:	83 ec 08             	sub    $0x8,%esp
     9a0:	68 6f 73 00 00       	push   $0x736f
     9a5:	6a 01                	push   $0x1
     9a7:	e8 03 35 00 00       	call   3eaf <printf>
     9ac:	83 c4 10             	add    $0x10,%esp
  kill(pid1);
     9af:	83 ec 0c             	sub    $0xc,%esp
     9b2:	ff 75 f4             	pushl  -0xc(%ebp)
     9b5:	e8 79 32 00 00       	call   3c33 <kill>
     9ba:	83 c4 10             	add    $0x10,%esp
  kill(pid2);
     9bd:	83 ec 0c             	sub    $0xc,%esp
     9c0:	ff 75 f0             	pushl  -0x10(%ebp)
     9c3:	e8 6b 32 00 00       	call   3c33 <kill>
     9c8:	83 c4 10             	add    $0x10,%esp
  kill(pid3);
     9cb:	83 ec 0c             	sub    $0xc,%esp
     9ce:	ff 75 ec             	pushl  -0x14(%ebp)
     9d1:	e8 5d 32 00 00       	call   3c33 <kill>
     9d6:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
     9d9:	83 ec 08             	sub    $0x8,%esp
     9dc:	68 78 73 00 00       	push   $0x7378
     9e1:	6a 01                	push   $0x1
     9e3:	e8 c7 34 00 00       	call   3eaf <printf>
     9e8:	83 c4 10             	add    $0x10,%esp
  wait();
     9eb:	e8 1b 32 00 00       	call   3c0b <wait>
  wait();
     9f0:	e8 16 32 00 00       	call   3c0b <wait>
  wait();
     9f5:	e8 11 32 00 00       	call   3c0b <wait>
  printf(1, "preempt ok\n");
     9fa:	83 ec 08             	sub    $0x8,%esp
     9fd:	68 81 73 00 00       	push   $0x7381
     a02:	6a 01                	push   $0x1
     a04:	e8 a6 34 00 00       	call   3eaf <printf>
     a09:	83 c4 10             	add    $0x10,%esp
}
     a0c:	c9                   	leave  
     a0d:	c3                   	ret    

00000a0e <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     a0e:	55                   	push   %ebp
     a0f:	89 e5                	mov    %esp,%ebp
     a11:	83 ec 18             	sub    $0x18,%esp
  int i, pid;

  for(i = 0; i < 100; i++){
     a14:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     a1b:	eb 4f                	jmp    a6c <exitwait+0x5e>
    pid = fork();
     a1d:	e8 d9 31 00 00       	call   3bfb <fork>
     a22:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0){
     a25:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a29:	79 14                	jns    a3f <exitwait+0x31>
      printf(1, "fork failed\n");
     a2b:	83 ec 08             	sub    $0x8,%esp
     a2e:	68 8d 73 00 00       	push   $0x738d
     a33:	6a 01                	push   $0x1
     a35:	e8 75 34 00 00       	call   3eaf <printf>
     a3a:	83 c4 10             	add    $0x10,%esp
      return;
     a3d:	eb 45                	jmp    a84 <exitwait+0x76>
    }
    if(pid){
     a3f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a43:	74 1e                	je     a63 <exitwait+0x55>
      if(wait() != pid){
     a45:	e8 c1 31 00 00       	call   3c0b <wait>
     a4a:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     a4d:	74 19                	je     a68 <exitwait+0x5a>
        printf(1, "wait wrong pid\n");
     a4f:	83 ec 08             	sub    $0x8,%esp
     a52:	68 9a 73 00 00       	push   $0x739a
     a57:	6a 01                	push   $0x1
     a59:	e8 51 34 00 00       	call   3eaf <printf>
     a5e:	83 c4 10             	add    $0x10,%esp
        return;
     a61:	eb 21                	jmp    a84 <exitwait+0x76>
      }
    } else {
      exit();
     a63:	e8 9b 31 00 00       	call   3c03 <exit>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     a68:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     a6c:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     a70:	7e ab                	jle    a1d <exitwait+0xf>
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     a72:	83 ec 08             	sub    $0x8,%esp
     a75:	68 aa 73 00 00       	push   $0x73aa
     a7a:	6a 01                	push   $0x1
     a7c:	e8 2e 34 00 00       	call   3eaf <printf>
     a81:	83 c4 10             	add    $0x10,%esp
}
     a84:	c9                   	leave  
     a85:	c3                   	ret    

00000a86 <mem>:

void
mem(void)
{
     a86:	55                   	push   %ebp
     a87:	89 e5                	mov    %esp,%ebp
     a89:	83 ec 18             	sub    $0x18,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     a8c:	83 ec 08             	sub    $0x8,%esp
     a8f:	68 b7 73 00 00       	push   $0x73b7
     a94:	6a 01                	push   $0x1
     a96:	e8 14 34 00 00       	call   3eaf <printf>
     a9b:	83 c4 10             	add    $0x10,%esp
  ppid = getpid();
     a9e:	e8 e0 31 00 00       	call   3c83 <getpid>
     aa3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if((pid = fork()) == 0){
     aa6:	e8 50 31 00 00       	call   3bfb <fork>
     aab:	89 45 ec             	mov    %eax,-0x14(%ebp)
     aae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     ab2:	0f 85 b7 00 00 00    	jne    b6f <mem+0xe9>
    m1 = 0;
     ab8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while((m2 = malloc(10001)) != 0){
     abf:	eb 0e                	jmp    acf <mem+0x49>
      *(char**)m2 = m1;
     ac1:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ac4:	8b 55 f4             	mov    -0xc(%ebp),%edx
     ac7:	89 10                	mov    %edx,(%eax)
      m1 = m2;
     ac9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     acc:	89 45 f4             	mov    %eax,-0xc(%ebp)

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     acf:	83 ec 0c             	sub    $0xc,%esp
     ad2:	68 11 27 00 00       	push   $0x2711
     ad7:	e8 d5 36 00 00       	call   41b1 <malloc>
     adc:	83 c4 10             	add    $0x10,%esp
     adf:	89 45 e8             	mov    %eax,-0x18(%ebp)
     ae2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     ae6:	75 d9                	jne    ac1 <mem+0x3b>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     ae8:	eb 1c                	jmp    b06 <mem+0x80>
      m2 = *(char**)m1;
     aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aed:	8b 00                	mov    (%eax),%eax
     aef:	89 45 e8             	mov    %eax,-0x18(%ebp)
      free(m1);
     af2:	83 ec 0c             	sub    $0xc,%esp
     af5:	ff 75 f4             	pushl  -0xc(%ebp)
     af8:	e8 72 35 00 00       	call   406f <free>
     afd:	83 c4 10             	add    $0x10,%esp
      m1 = m2;
     b00:	8b 45 e8             	mov    -0x18(%ebp),%eax
     b03:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     b06:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b0a:	75 de                	jne    aea <mem+0x64>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     b0c:	83 ec 0c             	sub    $0xc,%esp
     b0f:	68 00 50 00 00       	push   $0x5000
     b14:	e8 98 36 00 00       	call   41b1 <malloc>
     b19:	83 c4 10             	add    $0x10,%esp
     b1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(m1 == 0){
     b1f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b23:	75 25                	jne    b4a <mem+0xc4>
      printf(1, "couldn't allocate mem?!!\n");
     b25:	83 ec 08             	sub    $0x8,%esp
     b28:	68 c1 73 00 00       	push   $0x73c1
     b2d:	6a 01                	push   $0x1
     b2f:	e8 7b 33 00 00       	call   3eaf <printf>
     b34:	83 c4 10             	add    $0x10,%esp
      kill(ppid);
     b37:	83 ec 0c             	sub    $0xc,%esp
     b3a:	ff 75 f0             	pushl  -0x10(%ebp)
     b3d:	e8 f1 30 00 00       	call   3c33 <kill>
     b42:	83 c4 10             	add    $0x10,%esp
      exit();
     b45:	e8 b9 30 00 00       	call   3c03 <exit>
    }
    free(m1);
     b4a:	83 ec 0c             	sub    $0xc,%esp
     b4d:	ff 75 f4             	pushl  -0xc(%ebp)
     b50:	e8 1a 35 00 00       	call   406f <free>
     b55:	83 c4 10             	add    $0x10,%esp
    printf(1, "mem ok\n");
     b58:	83 ec 08             	sub    $0x8,%esp
     b5b:	68 db 73 00 00       	push   $0x73db
     b60:	6a 01                	push   $0x1
     b62:	e8 48 33 00 00       	call   3eaf <printf>
     b67:	83 c4 10             	add    $0x10,%esp
    exit();
     b6a:	e8 94 30 00 00       	call   3c03 <exit>
  } else {
    wait();
     b6f:	e8 97 30 00 00       	call   3c0b <wait>
  }
}
     b74:	90                   	nop
     b75:	c9                   	leave  
     b76:	c3                   	ret    

00000b77 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     b77:	55                   	push   %ebp
     b78:	89 e5                	mov    %esp,%ebp
     b7a:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     b7d:	83 ec 08             	sub    $0x8,%esp
     b80:	68 e3 73 00 00       	push   $0x73e3
     b85:	6a 01                	push   $0x1
     b87:	e8 23 33 00 00       	call   3eaf <printf>
     b8c:	83 c4 10             	add    $0x10,%esp

  unlink("sharedfd");
     b8f:	83 ec 0c             	sub    $0xc,%esp
     b92:	68 f2 73 00 00       	push   $0x73f2
     b97:	e8 b7 30 00 00       	call   3c53 <unlink>
     b9c:	83 c4 10             	add    $0x10,%esp
  fd = open("sharedfd", O_CREATE|O_RDWR);
     b9f:	83 ec 08             	sub    $0x8,%esp
     ba2:	68 02 02 00 00       	push   $0x202
     ba7:	68 f2 73 00 00       	push   $0x73f2
     bac:	e8 92 30 00 00       	call   3c43 <open>
     bb1:	83 c4 10             	add    $0x10,%esp
     bb4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     bb7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     bbb:	79 17                	jns    bd4 <sharedfd+0x5d>
    printf(1, "fstests: cannot open sharedfd for writing");
     bbd:	83 ec 08             	sub    $0x8,%esp
     bc0:	68 fc 73 00 00       	push   $0x73fc
     bc5:	6a 01                	push   $0x1
     bc7:	e8 e3 32 00 00       	call   3eaf <printf>
     bcc:	83 c4 10             	add    $0x10,%esp
    return;
     bcf:	e9 84 01 00 00       	jmp    d58 <sharedfd+0x1e1>
  }
  pid = fork();
     bd4:	e8 22 30 00 00       	call   3bfb <fork>
     bd9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     bdc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     be0:	75 07                	jne    be9 <sharedfd+0x72>
     be2:	b8 63 00 00 00       	mov    $0x63,%eax
     be7:	eb 05                	jmp    bee <sharedfd+0x77>
     be9:	b8 70 00 00 00       	mov    $0x70,%eax
     bee:	83 ec 04             	sub    $0x4,%esp
     bf1:	6a 0a                	push   $0xa
     bf3:	50                   	push   %eax
     bf4:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     bf7:	50                   	push   %eax
     bf8:	e8 6b 2e 00 00       	call   3a68 <memset>
     bfd:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 1000; i++){
     c00:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     c07:	eb 31                	jmp    c3a <sharedfd+0xc3>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     c09:	83 ec 04             	sub    $0x4,%esp
     c0c:	6a 0a                	push   $0xa
     c0e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     c11:	50                   	push   %eax
     c12:	ff 75 e8             	pushl  -0x18(%ebp)
     c15:	e8 09 30 00 00       	call   3c23 <write>
     c1a:	83 c4 10             	add    $0x10,%esp
     c1d:	83 f8 0a             	cmp    $0xa,%eax
     c20:	74 14                	je     c36 <sharedfd+0xbf>
      printf(1, "fstests: write sharedfd failed\n");
     c22:	83 ec 08             	sub    $0x8,%esp
     c25:	68 28 74 00 00       	push   $0x7428
     c2a:	6a 01                	push   $0x1
     c2c:	e8 7e 32 00 00       	call   3eaf <printf>
     c31:	83 c4 10             	add    $0x10,%esp
      break;
     c34:	eb 0d                	jmp    c43 <sharedfd+0xcc>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
  for(i = 0; i < 1000; i++){
     c36:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     c3a:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
     c41:	7e c6                	jle    c09 <sharedfd+0x92>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
     c43:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     c47:	75 05                	jne    c4e <sharedfd+0xd7>
    exit();
     c49:	e8 b5 2f 00 00       	call   3c03 <exit>
  else
    wait();
     c4e:	e8 b8 2f 00 00       	call   3c0b <wait>
  close(fd);
     c53:	83 ec 0c             	sub    $0xc,%esp
     c56:	ff 75 e8             	pushl  -0x18(%ebp)
     c59:	e8 cd 2f 00 00       	call   3c2b <close>
     c5e:	83 c4 10             	add    $0x10,%esp
  fd = open("sharedfd", 0);
     c61:	83 ec 08             	sub    $0x8,%esp
     c64:	6a 00                	push   $0x0
     c66:	68 f2 73 00 00       	push   $0x73f2
     c6b:	e8 d3 2f 00 00       	call   3c43 <open>
     c70:	83 c4 10             	add    $0x10,%esp
     c73:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     c76:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     c7a:	79 17                	jns    c93 <sharedfd+0x11c>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     c7c:	83 ec 08             	sub    $0x8,%esp
     c7f:	68 48 74 00 00       	push   $0x7448
     c84:	6a 01                	push   $0x1
     c86:	e8 24 32 00 00       	call   3eaf <printf>
     c8b:	83 c4 10             	add    $0x10,%esp
    return;
     c8e:	e9 c5 00 00 00       	jmp    d58 <sharedfd+0x1e1>
  }
  nc = np = 0;
     c93:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     c9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c9d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
     ca0:	eb 3b                	jmp    cdd <sharedfd+0x166>
    for(i = 0; i < sizeof(buf); i++){
     ca2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     ca9:	eb 2a                	jmp    cd5 <sharedfd+0x15e>
      if(buf[i] == 'c')
     cab:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     cae:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cb1:	01 d0                	add    %edx,%eax
     cb3:	0f b6 00             	movzbl (%eax),%eax
     cb6:	3c 63                	cmp    $0x63,%al
     cb8:	75 04                	jne    cbe <sharedfd+0x147>
        nc++;
     cba:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == 'p')
     cbe:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     cc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cc4:	01 d0                	add    %edx,%eax
     cc6:	0f b6 00             	movzbl (%eax),%eax
     cc9:	3c 70                	cmp    $0x70,%al
     ccb:	75 04                	jne    cd1 <sharedfd+0x15a>
        np++;
     ccd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     cd1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     cd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cd8:	83 f8 09             	cmp    $0x9,%eax
     cdb:	76 ce                	jbe    cab <sharedfd+0x134>
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     cdd:	83 ec 04             	sub    $0x4,%esp
     ce0:	6a 0a                	push   $0xa
     ce2:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     ce5:	50                   	push   %eax
     ce6:	ff 75 e8             	pushl  -0x18(%ebp)
     ce9:	e8 2d 2f 00 00       	call   3c1b <read>
     cee:	83 c4 10             	add    $0x10,%esp
     cf1:	89 45 e0             	mov    %eax,-0x20(%ebp)
     cf4:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     cf8:	7f a8                	jg     ca2 <sharedfd+0x12b>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     cfa:	83 ec 0c             	sub    $0xc,%esp
     cfd:	ff 75 e8             	pushl  -0x18(%ebp)
     d00:	e8 26 2f 00 00       	call   3c2b <close>
     d05:	83 c4 10             	add    $0x10,%esp
  unlink("sharedfd");
     d08:	83 ec 0c             	sub    $0xc,%esp
     d0b:	68 f2 73 00 00       	push   $0x73f2
     d10:	e8 3e 2f 00 00       	call   3c53 <unlink>
     d15:	83 c4 10             	add    $0x10,%esp
  if(nc == 10000 && np == 10000){
     d18:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
     d1f:	75 1d                	jne    d3e <sharedfd+0x1c7>
     d21:	81 7d ec 10 27 00 00 	cmpl   $0x2710,-0x14(%ebp)
     d28:	75 14                	jne    d3e <sharedfd+0x1c7>
    printf(1, "sharedfd ok\n");
     d2a:	83 ec 08             	sub    $0x8,%esp
     d2d:	68 73 74 00 00       	push   $0x7473
     d32:	6a 01                	push   $0x1
     d34:	e8 76 31 00 00       	call   3eaf <printf>
     d39:	83 c4 10             	add    $0x10,%esp
     d3c:	eb 1a                	jmp    d58 <sharedfd+0x1e1>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     d3e:	ff 75 ec             	pushl  -0x14(%ebp)
     d41:	ff 75 f0             	pushl  -0x10(%ebp)
     d44:	68 80 74 00 00       	push   $0x7480
     d49:	6a 01                	push   $0x1
     d4b:	e8 5f 31 00 00       	call   3eaf <printf>
     d50:	83 c4 10             	add    $0x10,%esp
    exit();
     d53:	e8 ab 2e 00 00       	call   3c03 <exit>
  }
}
     d58:	c9                   	leave  
     d59:	c3                   	ret    

00000d5a <twofiles>:

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
     d5a:	55                   	push   %ebp
     d5b:	89 e5                	mov    %esp,%ebp
     d5d:	83 ec 28             	sub    $0x28,%esp
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
     d60:	83 ec 08             	sub    $0x8,%esp
     d63:	68 95 74 00 00       	push   $0x7495
     d68:	6a 01                	push   $0x1
     d6a:	e8 40 31 00 00       	call   3eaf <printf>
     d6f:	83 c4 10             	add    $0x10,%esp

  unlink("f1");
     d72:	83 ec 0c             	sub    $0xc,%esp
     d75:	68 a4 74 00 00       	push   $0x74a4
     d7a:	e8 d4 2e 00 00       	call   3c53 <unlink>
     d7f:	83 c4 10             	add    $0x10,%esp
  unlink("f2");
     d82:	83 ec 0c             	sub    $0xc,%esp
     d85:	68 a7 74 00 00       	push   $0x74a7
     d8a:	e8 c4 2e 00 00       	call   3c53 <unlink>
     d8f:	83 c4 10             	add    $0x10,%esp

  pid = fork();
     d92:	e8 64 2e 00 00       	call   3bfb <fork>
     d97:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(pid < 0){
     d9a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     d9e:	79 17                	jns    db7 <twofiles+0x5d>
    printf(1, "fork failed\n");
     da0:	83 ec 08             	sub    $0x8,%esp
     da3:	68 8d 73 00 00       	push   $0x738d
     da8:	6a 01                	push   $0x1
     daa:	e8 00 31 00 00       	call   3eaf <printf>
     daf:	83 c4 10             	add    $0x10,%esp
    exit();
     db2:	e8 4c 2e 00 00       	call   3c03 <exit>
  }

  fname = pid ? "f1" : "f2";
     db7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     dbb:	74 07                	je     dc4 <twofiles+0x6a>
     dbd:	b8 a4 74 00 00       	mov    $0x74a4,%eax
     dc2:	eb 05                	jmp    dc9 <twofiles+0x6f>
     dc4:	b8 a7 74 00 00       	mov    $0x74a7,%eax
     dc9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  fd = open(fname, O_CREATE | O_RDWR);
     dcc:	83 ec 08             	sub    $0x8,%esp
     dcf:	68 02 02 00 00       	push   $0x202
     dd4:	ff 75 e4             	pushl  -0x1c(%ebp)
     dd7:	e8 67 2e 00 00       	call   3c43 <open>
     ddc:	83 c4 10             	add    $0x10,%esp
     ddf:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(fd < 0){
     de2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     de6:	79 17                	jns    dff <twofiles+0xa5>
    printf(1, "create failed\n");
     de8:	83 ec 08             	sub    $0x8,%esp
     deb:	68 aa 74 00 00       	push   $0x74aa
     df0:	6a 01                	push   $0x1
     df2:	e8 b8 30 00 00       	call   3eaf <printf>
     df7:	83 c4 10             	add    $0x10,%esp
    exit();
     dfa:	e8 04 2e 00 00       	call   3c03 <exit>
  }

  memset(buf, pid?'p':'c', 512);
     dff:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     e03:	74 07                	je     e0c <twofiles+0xb2>
     e05:	b8 70 00 00 00       	mov    $0x70,%eax
     e0a:	eb 05                	jmp    e11 <twofiles+0xb7>
     e0c:	b8 63 00 00 00       	mov    $0x63,%eax
     e11:	83 ec 04             	sub    $0x4,%esp
     e14:	68 00 02 00 00       	push   $0x200
     e19:	50                   	push   %eax
     e1a:	68 c0 bf 00 00       	push   $0xbfc0
     e1f:	e8 44 2c 00 00       	call   3a68 <memset>
     e24:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 12; i++){
     e27:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e2e:	eb 42                	jmp    e72 <twofiles+0x118>
    if((n = write(fd, buf, 500)) != 500){
     e30:	83 ec 04             	sub    $0x4,%esp
     e33:	68 f4 01 00 00       	push   $0x1f4
     e38:	68 c0 bf 00 00       	push   $0xbfc0
     e3d:	ff 75 e0             	pushl  -0x20(%ebp)
     e40:	e8 de 2d 00 00       	call   3c23 <write>
     e45:	83 c4 10             	add    $0x10,%esp
     e48:	89 45 dc             	mov    %eax,-0x24(%ebp)
     e4b:	81 7d dc f4 01 00 00 	cmpl   $0x1f4,-0x24(%ebp)
     e52:	74 1a                	je     e6e <twofiles+0x114>
      printf(1, "write failed %d\n", n);
     e54:	83 ec 04             	sub    $0x4,%esp
     e57:	ff 75 dc             	pushl  -0x24(%ebp)
     e5a:	68 b9 74 00 00       	push   $0x74b9
     e5f:	6a 01                	push   $0x1
     e61:	e8 49 30 00 00       	call   3eaf <printf>
     e66:	83 c4 10             	add    $0x10,%esp
      exit();
     e69:	e8 95 2d 00 00       	call   3c03 <exit>
    printf(1, "create failed\n");
    exit();
  }

  memset(buf, pid?'p':'c', 512);
  for(i = 0; i < 12; i++){
     e6e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     e72:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
     e76:	7e b8                	jle    e30 <twofiles+0xd6>
    if((n = write(fd, buf, 500)) != 500){
      printf(1, "write failed %d\n", n);
      exit();
    }
  }
  close(fd);
     e78:	83 ec 0c             	sub    $0xc,%esp
     e7b:	ff 75 e0             	pushl  -0x20(%ebp)
     e7e:	e8 a8 2d 00 00       	call   3c2b <close>
     e83:	83 c4 10             	add    $0x10,%esp
  if(pid)
     e86:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     e8a:	74 11                	je     e9d <twofiles+0x143>
    wait();
     e8c:	e8 7a 2d 00 00       	call   3c0b <wait>
  else
    exit();

  for(i = 0; i < 2; i++){
     e91:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e98:	e9 dd 00 00 00       	jmp    f7a <twofiles+0x220>
  }
  close(fd);
  if(pid)
    wait();
  else
    exit();
     e9d:	e8 61 2d 00 00       	call   3c03 <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
     ea2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ea6:	74 07                	je     eaf <twofiles+0x155>
     ea8:	b8 a4 74 00 00       	mov    $0x74a4,%eax
     ead:	eb 05                	jmp    eb4 <twofiles+0x15a>
     eaf:	b8 a7 74 00 00       	mov    $0x74a7,%eax
     eb4:	83 ec 08             	sub    $0x8,%esp
     eb7:	6a 00                	push   $0x0
     eb9:	50                   	push   %eax
     eba:	e8 84 2d 00 00       	call   3c43 <open>
     ebf:	83 c4 10             	add    $0x10,%esp
     ec2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    total = 0;
     ec5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     ecc:	eb 56                	jmp    f24 <twofiles+0x1ca>
      for(j = 0; j < n; j++){
     ece:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ed5:	eb 3f                	jmp    f16 <twofiles+0x1bc>
        if(buf[j] != (i?'p':'c')){
     ed7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     eda:	05 c0 bf 00 00       	add    $0xbfc0,%eax
     edf:	0f b6 00             	movzbl (%eax),%eax
     ee2:	0f be c0             	movsbl %al,%eax
     ee5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ee9:	74 07                	je     ef2 <twofiles+0x198>
     eeb:	ba 70 00 00 00       	mov    $0x70,%edx
     ef0:	eb 05                	jmp    ef7 <twofiles+0x19d>
     ef2:	ba 63 00 00 00       	mov    $0x63,%edx
     ef7:	39 d0                	cmp    %edx,%eax
     ef9:	74 17                	je     f12 <twofiles+0x1b8>
          printf(1, "wrong char\n");
     efb:	83 ec 08             	sub    $0x8,%esp
     efe:	68 ca 74 00 00       	push   $0x74ca
     f03:	6a 01                	push   $0x1
     f05:	e8 a5 2f 00 00       	call   3eaf <printf>
     f0a:	83 c4 10             	add    $0x10,%esp
          exit();
     f0d:	e8 f1 2c 00 00       	call   3c03 <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
     f12:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     f16:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f19:	3b 45 dc             	cmp    -0x24(%ebp),%eax
     f1c:	7c b9                	jl     ed7 <twofiles+0x17d>
        if(buf[j] != (i?'p':'c')){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
     f1e:	8b 45 dc             	mov    -0x24(%ebp),%eax
     f21:	01 45 ec             	add    %eax,-0x14(%ebp)
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     f24:	83 ec 04             	sub    $0x4,%esp
     f27:	68 00 20 00 00       	push   $0x2000
     f2c:	68 c0 bf 00 00       	push   $0xbfc0
     f31:	ff 75 e0             	pushl  -0x20(%ebp)
     f34:	e8 e2 2c 00 00       	call   3c1b <read>
     f39:	83 c4 10             	add    $0x10,%esp
     f3c:	89 45 dc             	mov    %eax,-0x24(%ebp)
     f3f:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
     f43:	7f 89                	jg     ece <twofiles+0x174>
          exit();
        }
      }
      total += n;
    }
    close(fd);
     f45:	83 ec 0c             	sub    $0xc,%esp
     f48:	ff 75 e0             	pushl  -0x20(%ebp)
     f4b:	e8 db 2c 00 00       	call   3c2b <close>
     f50:	83 c4 10             	add    $0x10,%esp
    if(total != 12*500){
     f53:	81 7d ec 70 17 00 00 	cmpl   $0x1770,-0x14(%ebp)
     f5a:	74 1a                	je     f76 <twofiles+0x21c>
      printf(1, "wrong length %d\n", total);
     f5c:	83 ec 04             	sub    $0x4,%esp
     f5f:	ff 75 ec             	pushl  -0x14(%ebp)
     f62:	68 d6 74 00 00       	push   $0x74d6
     f67:	6a 01                	push   $0x1
     f69:	e8 41 2f 00 00       	call   3eaf <printf>
     f6e:	83 c4 10             	add    $0x10,%esp
      exit();
     f71:	e8 8d 2c 00 00       	call   3c03 <exit>
  if(pid)
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
     f76:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f7a:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
     f7e:	0f 8e 1e ff ff ff    	jle    ea2 <twofiles+0x148>
      printf(1, "wrong length %d\n", total);
      exit();
    }
  }

  unlink("f1");
     f84:	83 ec 0c             	sub    $0xc,%esp
     f87:	68 a4 74 00 00       	push   $0x74a4
     f8c:	e8 c2 2c 00 00       	call   3c53 <unlink>
     f91:	83 c4 10             	add    $0x10,%esp
  unlink("f2");
     f94:	83 ec 0c             	sub    $0xc,%esp
     f97:	68 a7 74 00 00       	push   $0x74a7
     f9c:	e8 b2 2c 00 00       	call   3c53 <unlink>
     fa1:	83 c4 10             	add    $0x10,%esp

  printf(1, "twofiles ok\n");
     fa4:	83 ec 08             	sub    $0x8,%esp
     fa7:	68 e7 74 00 00       	push   $0x74e7
     fac:	6a 01                	push   $0x1
     fae:	e8 fc 2e 00 00       	call   3eaf <printf>
     fb3:	83 c4 10             	add    $0x10,%esp
}
     fb6:	90                   	nop
     fb7:	c9                   	leave  
     fb8:	c3                   	ret    

00000fb9 <createdelete>:

// two processes create and delete different files in same directory
void
createdelete(void)
{
     fb9:	55                   	push   %ebp
     fba:	89 e5                	mov    %esp,%ebp
     fbc:	83 ec 38             	sub    $0x38,%esp
  enum { N = 20 };
  int pid, i, fd;
  char name[32];

  printf(1, "createdelete test\n");
     fbf:	83 ec 08             	sub    $0x8,%esp
     fc2:	68 f4 74 00 00       	push   $0x74f4
     fc7:	6a 01                	push   $0x1
     fc9:	e8 e1 2e 00 00       	call   3eaf <printf>
     fce:	83 c4 10             	add    $0x10,%esp
  pid = fork();
     fd1:	e8 25 2c 00 00       	call   3bfb <fork>
     fd6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid < 0){
     fd9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     fdd:	79 17                	jns    ff6 <createdelete+0x3d>
    printf(1, "fork failed\n");
     fdf:	83 ec 08             	sub    $0x8,%esp
     fe2:	68 8d 73 00 00       	push   $0x738d
     fe7:	6a 01                	push   $0x1
     fe9:	e8 c1 2e 00 00       	call   3eaf <printf>
     fee:	83 c4 10             	add    $0x10,%esp
    exit();
     ff1:	e8 0d 2c 00 00       	call   3c03 <exit>
  }

  name[0] = pid ? 'p' : 'c';
     ff6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     ffa:	74 07                	je     1003 <createdelete+0x4a>
     ffc:	b8 70 00 00 00       	mov    $0x70,%eax
    1001:	eb 05                	jmp    1008 <createdelete+0x4f>
    1003:	b8 63 00 00 00       	mov    $0x63,%eax
    1008:	88 45 cc             	mov    %al,-0x34(%ebp)
  name[2] = '\0';
    100b:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
  for(i = 0; i < N; i++){
    100f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1016:	e9 9b 00 00 00       	jmp    10b6 <createdelete+0xfd>
    name[1] = '0' + i;
    101b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    101e:	83 c0 30             	add    $0x30,%eax
    1021:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, O_CREATE | O_RDWR);
    1024:	83 ec 08             	sub    $0x8,%esp
    1027:	68 02 02 00 00       	push   $0x202
    102c:	8d 45 cc             	lea    -0x34(%ebp),%eax
    102f:	50                   	push   %eax
    1030:	e8 0e 2c 00 00       	call   3c43 <open>
    1035:	83 c4 10             	add    $0x10,%esp
    1038:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    103b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    103f:	79 17                	jns    1058 <createdelete+0x9f>
      printf(1, "create failed\n");
    1041:	83 ec 08             	sub    $0x8,%esp
    1044:	68 aa 74 00 00       	push   $0x74aa
    1049:	6a 01                	push   $0x1
    104b:	e8 5f 2e 00 00       	call   3eaf <printf>
    1050:	83 c4 10             	add    $0x10,%esp
      exit();
    1053:	e8 ab 2b 00 00       	call   3c03 <exit>
    }
    close(fd);
    1058:	83 ec 0c             	sub    $0xc,%esp
    105b:	ff 75 ec             	pushl  -0x14(%ebp)
    105e:	e8 c8 2b 00 00       	call   3c2b <close>
    1063:	83 c4 10             	add    $0x10,%esp
    if(i > 0 && (i % 2 ) == 0){
    1066:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    106a:	7e 46                	jle    10b2 <createdelete+0xf9>
    106c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    106f:	83 e0 01             	and    $0x1,%eax
    1072:	85 c0                	test   %eax,%eax
    1074:	75 3c                	jne    10b2 <createdelete+0xf9>
      name[1] = '0' + (i / 2);
    1076:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1079:	89 c2                	mov    %eax,%edx
    107b:	c1 ea 1f             	shr    $0x1f,%edx
    107e:	01 d0                	add    %edx,%eax
    1080:	d1 f8                	sar    %eax
    1082:	83 c0 30             	add    $0x30,%eax
    1085:	88 45 cd             	mov    %al,-0x33(%ebp)
      if(unlink(name) < 0){
    1088:	83 ec 0c             	sub    $0xc,%esp
    108b:	8d 45 cc             	lea    -0x34(%ebp),%eax
    108e:	50                   	push   %eax
    108f:	e8 bf 2b 00 00       	call   3c53 <unlink>
    1094:	83 c4 10             	add    $0x10,%esp
    1097:	85 c0                	test   %eax,%eax
    1099:	79 17                	jns    10b2 <createdelete+0xf9>
        printf(1, "unlink failed\n");
    109b:	83 ec 08             	sub    $0x8,%esp
    109e:	68 07 75 00 00       	push   $0x7507
    10a3:	6a 01                	push   $0x1
    10a5:	e8 05 2e 00 00       	call   3eaf <printf>
    10aa:	83 c4 10             	add    $0x10,%esp
        exit();
    10ad:	e8 51 2b 00 00       	call   3c03 <exit>
    exit();
  }

  name[0] = pid ? 'p' : 'c';
  name[2] = '\0';
  for(i = 0; i < N; i++){
    10b2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    10b6:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    10ba:	0f 8e 5b ff ff ff    	jle    101b <createdelete+0x62>
        exit();
      }
    }
  }

  if(pid==0)
    10c0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10c4:	75 05                	jne    10cb <createdelete+0x112>
    exit();
    10c6:	e8 38 2b 00 00       	call   3c03 <exit>
  else
    wait();
    10cb:	e8 3b 2b 00 00       	call   3c0b <wait>

  for(i = 0; i < N; i++){
    10d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    10d7:	e9 22 01 00 00       	jmp    11fe <createdelete+0x245>
    name[0] = 'p';
    10dc:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    10e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10e3:	83 c0 30             	add    $0x30,%eax
    10e6:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    10e9:	83 ec 08             	sub    $0x8,%esp
    10ec:	6a 00                	push   $0x0
    10ee:	8d 45 cc             	lea    -0x34(%ebp),%eax
    10f1:	50                   	push   %eax
    10f2:	e8 4c 2b 00 00       	call   3c43 <open>
    10f7:	83 c4 10             	add    $0x10,%esp
    10fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    10fd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1101:	74 06                	je     1109 <createdelete+0x150>
    1103:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1107:	7e 21                	jle    112a <createdelete+0x171>
    1109:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    110d:	79 1b                	jns    112a <createdelete+0x171>
      printf(1, "oops createdelete %s didn't exist\n", name);
    110f:	83 ec 04             	sub    $0x4,%esp
    1112:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1115:	50                   	push   %eax
    1116:	68 18 75 00 00       	push   $0x7518
    111b:	6a 01                	push   $0x1
    111d:	e8 8d 2d 00 00       	call   3eaf <printf>
    1122:	83 c4 10             	add    $0x10,%esp
      exit();
    1125:	e8 d9 2a 00 00       	call   3c03 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    112a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    112e:	7e 27                	jle    1157 <createdelete+0x19e>
    1130:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1134:	7f 21                	jg     1157 <createdelete+0x19e>
    1136:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    113a:	78 1b                	js     1157 <createdelete+0x19e>
      printf(1, "oops createdelete %s did exist\n", name);
    113c:	83 ec 04             	sub    $0x4,%esp
    113f:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1142:	50                   	push   %eax
    1143:	68 3c 75 00 00       	push   $0x753c
    1148:	6a 01                	push   $0x1
    114a:	e8 60 2d 00 00       	call   3eaf <printf>
    114f:	83 c4 10             	add    $0x10,%esp
      exit();
    1152:	e8 ac 2a 00 00       	call   3c03 <exit>
    }
    if(fd >= 0)
    1157:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    115b:	78 0e                	js     116b <createdelete+0x1b2>
      close(fd);
    115d:	83 ec 0c             	sub    $0xc,%esp
    1160:	ff 75 ec             	pushl  -0x14(%ebp)
    1163:	e8 c3 2a 00 00       	call   3c2b <close>
    1168:	83 c4 10             	add    $0x10,%esp

    name[0] = 'c';
    116b:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    name[1] = '0' + i;
    116f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1172:	83 c0 30             	add    $0x30,%eax
    1175:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    1178:	83 ec 08             	sub    $0x8,%esp
    117b:	6a 00                	push   $0x0
    117d:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1180:	50                   	push   %eax
    1181:	e8 bd 2a 00 00       	call   3c43 <open>
    1186:	83 c4 10             	add    $0x10,%esp
    1189:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    118c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1190:	74 06                	je     1198 <createdelete+0x1df>
    1192:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1196:	7e 21                	jle    11b9 <createdelete+0x200>
    1198:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    119c:	79 1b                	jns    11b9 <createdelete+0x200>
      printf(1, "oops createdelete %s didn't exist\n", name);
    119e:	83 ec 04             	sub    $0x4,%esp
    11a1:	8d 45 cc             	lea    -0x34(%ebp),%eax
    11a4:	50                   	push   %eax
    11a5:	68 18 75 00 00       	push   $0x7518
    11aa:	6a 01                	push   $0x1
    11ac:	e8 fe 2c 00 00       	call   3eaf <printf>
    11b1:	83 c4 10             	add    $0x10,%esp
      exit();
    11b4:	e8 4a 2a 00 00       	call   3c03 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    11b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11bd:	7e 27                	jle    11e6 <createdelete+0x22d>
    11bf:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    11c3:	7f 21                	jg     11e6 <createdelete+0x22d>
    11c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    11c9:	78 1b                	js     11e6 <createdelete+0x22d>
      printf(1, "oops createdelete %s did exist\n", name);
    11cb:	83 ec 04             	sub    $0x4,%esp
    11ce:	8d 45 cc             	lea    -0x34(%ebp),%eax
    11d1:	50                   	push   %eax
    11d2:	68 3c 75 00 00       	push   $0x753c
    11d7:	6a 01                	push   $0x1
    11d9:	e8 d1 2c 00 00       	call   3eaf <printf>
    11de:	83 c4 10             	add    $0x10,%esp
      exit();
    11e1:	e8 1d 2a 00 00       	call   3c03 <exit>
    }
    if(fd >= 0)
    11e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    11ea:	78 0e                	js     11fa <createdelete+0x241>
      close(fd);
    11ec:	83 ec 0c             	sub    $0xc,%esp
    11ef:	ff 75 ec             	pushl  -0x14(%ebp)
    11f2:	e8 34 2a 00 00       	call   3c2b <close>
    11f7:	83 c4 10             	add    $0x10,%esp
  if(pid==0)
    exit();
  else
    wait();

  for(i = 0; i < N; i++){
    11fa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    11fe:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1202:	0f 8e d4 fe ff ff    	jle    10dc <createdelete+0x123>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    1208:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    120f:	eb 33                	jmp    1244 <createdelete+0x28b>
    name[0] = 'p';
    1211:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    1215:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1218:	83 c0 30             	add    $0x30,%eax
    121b:	88 45 cd             	mov    %al,-0x33(%ebp)
    unlink(name);
    121e:	83 ec 0c             	sub    $0xc,%esp
    1221:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1224:	50                   	push   %eax
    1225:	e8 29 2a 00 00       	call   3c53 <unlink>
    122a:	83 c4 10             	add    $0x10,%esp
    name[0] = 'c';
    122d:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    unlink(name);
    1231:	83 ec 0c             	sub    $0xc,%esp
    1234:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1237:	50                   	push   %eax
    1238:	e8 16 2a 00 00       	call   3c53 <unlink>
    123d:	83 c4 10             	add    $0x10,%esp
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    1240:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1244:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1248:	7e c7                	jle    1211 <createdelete+0x258>
    unlink(name);
    name[0] = 'c';
    unlink(name);
  }

  printf(1, "createdelete ok\n");
    124a:	83 ec 08             	sub    $0x8,%esp
    124d:	68 5c 75 00 00       	push   $0x755c
    1252:	6a 01                	push   $0x1
    1254:	e8 56 2c 00 00       	call   3eaf <printf>
    1259:	83 c4 10             	add    $0x10,%esp
}
    125c:	90                   	nop
    125d:	c9                   	leave  
    125e:	c3                   	ret    

0000125f <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    125f:	55                   	push   %ebp
    1260:	89 e5                	mov    %esp,%ebp
    1262:	83 ec 18             	sub    $0x18,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1265:	83 ec 08             	sub    $0x8,%esp
    1268:	68 6d 75 00 00       	push   $0x756d
    126d:	6a 01                	push   $0x1
    126f:	e8 3b 2c 00 00       	call   3eaf <printf>
    1274:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1277:	83 ec 08             	sub    $0x8,%esp
    127a:	68 02 02 00 00       	push   $0x202
    127f:	68 7e 75 00 00       	push   $0x757e
    1284:	e8 ba 29 00 00       	call   3c43 <open>
    1289:	83 c4 10             	add    $0x10,%esp
    128c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    128f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1293:	79 17                	jns    12ac <unlinkread+0x4d>
    printf(1, "create unlinkread failed\n");
    1295:	83 ec 08             	sub    $0x8,%esp
    1298:	68 89 75 00 00       	push   $0x7589
    129d:	6a 01                	push   $0x1
    129f:	e8 0b 2c 00 00       	call   3eaf <printf>
    12a4:	83 c4 10             	add    $0x10,%esp
    exit();
    12a7:	e8 57 29 00 00       	call   3c03 <exit>
  }
  write(fd, "hello", 5);
    12ac:	83 ec 04             	sub    $0x4,%esp
    12af:	6a 05                	push   $0x5
    12b1:	68 a3 75 00 00       	push   $0x75a3
    12b6:	ff 75 f4             	pushl  -0xc(%ebp)
    12b9:	e8 65 29 00 00       	call   3c23 <write>
    12be:	83 c4 10             	add    $0x10,%esp
  close(fd);
    12c1:	83 ec 0c             	sub    $0xc,%esp
    12c4:	ff 75 f4             	pushl  -0xc(%ebp)
    12c7:	e8 5f 29 00 00       	call   3c2b <close>
    12cc:	83 c4 10             	add    $0x10,%esp

  fd = open("unlinkread", O_RDWR);
    12cf:	83 ec 08             	sub    $0x8,%esp
    12d2:	6a 02                	push   $0x2
    12d4:	68 7e 75 00 00       	push   $0x757e
    12d9:	e8 65 29 00 00       	call   3c43 <open>
    12de:	83 c4 10             	add    $0x10,%esp
    12e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    12e4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12e8:	79 17                	jns    1301 <unlinkread+0xa2>
    printf(1, "open unlinkread failed\n");
    12ea:	83 ec 08             	sub    $0x8,%esp
    12ed:	68 a9 75 00 00       	push   $0x75a9
    12f2:	6a 01                	push   $0x1
    12f4:	e8 b6 2b 00 00       	call   3eaf <printf>
    12f9:	83 c4 10             	add    $0x10,%esp
    exit();
    12fc:	e8 02 29 00 00       	call   3c03 <exit>
  }
  if(unlink("unlinkread") != 0){
    1301:	83 ec 0c             	sub    $0xc,%esp
    1304:	68 7e 75 00 00       	push   $0x757e
    1309:	e8 45 29 00 00       	call   3c53 <unlink>
    130e:	83 c4 10             	add    $0x10,%esp
    1311:	85 c0                	test   %eax,%eax
    1313:	74 17                	je     132c <unlinkread+0xcd>
    printf(1, "unlink unlinkread failed\n");
    1315:	83 ec 08             	sub    $0x8,%esp
    1318:	68 c1 75 00 00       	push   $0x75c1
    131d:	6a 01                	push   $0x1
    131f:	e8 8b 2b 00 00       	call   3eaf <printf>
    1324:	83 c4 10             	add    $0x10,%esp
    exit();
    1327:	e8 d7 28 00 00       	call   3c03 <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    132c:	83 ec 08             	sub    $0x8,%esp
    132f:	68 02 02 00 00       	push   $0x202
    1334:	68 7e 75 00 00       	push   $0x757e
    1339:	e8 05 29 00 00       	call   3c43 <open>
    133e:	83 c4 10             	add    $0x10,%esp
    1341:	89 45 f0             	mov    %eax,-0x10(%ebp)
  write(fd1, "yyy", 3);
    1344:	83 ec 04             	sub    $0x4,%esp
    1347:	6a 03                	push   $0x3
    1349:	68 db 75 00 00       	push   $0x75db
    134e:	ff 75 f0             	pushl  -0x10(%ebp)
    1351:	e8 cd 28 00 00       	call   3c23 <write>
    1356:	83 c4 10             	add    $0x10,%esp
  close(fd1);
    1359:	83 ec 0c             	sub    $0xc,%esp
    135c:	ff 75 f0             	pushl  -0x10(%ebp)
    135f:	e8 c7 28 00 00       	call   3c2b <close>
    1364:	83 c4 10             	add    $0x10,%esp

  if(read(fd, buf, sizeof(buf)) != 5){
    1367:	83 ec 04             	sub    $0x4,%esp
    136a:	68 00 20 00 00       	push   $0x2000
    136f:	68 c0 bf 00 00       	push   $0xbfc0
    1374:	ff 75 f4             	pushl  -0xc(%ebp)
    1377:	e8 9f 28 00 00       	call   3c1b <read>
    137c:	83 c4 10             	add    $0x10,%esp
    137f:	83 f8 05             	cmp    $0x5,%eax
    1382:	74 17                	je     139b <unlinkread+0x13c>
    printf(1, "unlinkread read failed");
    1384:	83 ec 08             	sub    $0x8,%esp
    1387:	68 df 75 00 00       	push   $0x75df
    138c:	6a 01                	push   $0x1
    138e:	e8 1c 2b 00 00       	call   3eaf <printf>
    1393:	83 c4 10             	add    $0x10,%esp
    exit();
    1396:	e8 68 28 00 00       	call   3c03 <exit>
  }
  if(buf[0] != 'h'){
    139b:	0f b6 05 c0 bf 00 00 	movzbl 0xbfc0,%eax
    13a2:	3c 68                	cmp    $0x68,%al
    13a4:	74 17                	je     13bd <unlinkread+0x15e>
    printf(1, "unlinkread wrong data\n");
    13a6:	83 ec 08             	sub    $0x8,%esp
    13a9:	68 f6 75 00 00       	push   $0x75f6
    13ae:	6a 01                	push   $0x1
    13b0:	e8 fa 2a 00 00       	call   3eaf <printf>
    13b5:	83 c4 10             	add    $0x10,%esp
    exit();
    13b8:	e8 46 28 00 00       	call   3c03 <exit>
  }
  if(write(fd, buf, 10) != 10){
    13bd:	83 ec 04             	sub    $0x4,%esp
    13c0:	6a 0a                	push   $0xa
    13c2:	68 c0 bf 00 00       	push   $0xbfc0
    13c7:	ff 75 f4             	pushl  -0xc(%ebp)
    13ca:	e8 54 28 00 00       	call   3c23 <write>
    13cf:	83 c4 10             	add    $0x10,%esp
    13d2:	83 f8 0a             	cmp    $0xa,%eax
    13d5:	74 17                	je     13ee <unlinkread+0x18f>
    printf(1, "unlinkread write failed\n");
    13d7:	83 ec 08             	sub    $0x8,%esp
    13da:	68 0d 76 00 00       	push   $0x760d
    13df:	6a 01                	push   $0x1
    13e1:	e8 c9 2a 00 00       	call   3eaf <printf>
    13e6:	83 c4 10             	add    $0x10,%esp
    exit();
    13e9:	e8 15 28 00 00       	call   3c03 <exit>
  }
  close(fd);
    13ee:	83 ec 0c             	sub    $0xc,%esp
    13f1:	ff 75 f4             	pushl  -0xc(%ebp)
    13f4:	e8 32 28 00 00       	call   3c2b <close>
    13f9:	83 c4 10             	add    $0x10,%esp
  unlink("unlinkread");
    13fc:	83 ec 0c             	sub    $0xc,%esp
    13ff:	68 7e 75 00 00       	push   $0x757e
    1404:	e8 4a 28 00 00       	call   3c53 <unlink>
    1409:	83 c4 10             	add    $0x10,%esp
  printf(1, "unlinkread ok\n");
    140c:	83 ec 08             	sub    $0x8,%esp
    140f:	68 26 76 00 00       	push   $0x7626
    1414:	6a 01                	push   $0x1
    1416:	e8 94 2a 00 00       	call   3eaf <printf>
    141b:	83 c4 10             	add    $0x10,%esp
}
    141e:	90                   	nop
    141f:	c9                   	leave  
    1420:	c3                   	ret    

00001421 <linktest>:

void
linktest(void)
{
    1421:	55                   	push   %ebp
    1422:	89 e5                	mov    %esp,%ebp
    1424:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(1, "linktest\n");
    1427:	83 ec 08             	sub    $0x8,%esp
    142a:	68 35 76 00 00       	push   $0x7635
    142f:	6a 01                	push   $0x1
    1431:	e8 79 2a 00 00       	call   3eaf <printf>
    1436:	83 c4 10             	add    $0x10,%esp

  unlink("lf1");
    1439:	83 ec 0c             	sub    $0xc,%esp
    143c:	68 3f 76 00 00       	push   $0x763f
    1441:	e8 0d 28 00 00       	call   3c53 <unlink>
    1446:	83 c4 10             	add    $0x10,%esp
  unlink("lf2");
    1449:	83 ec 0c             	sub    $0xc,%esp
    144c:	68 43 76 00 00       	push   $0x7643
    1451:	e8 fd 27 00 00       	call   3c53 <unlink>
    1456:	83 c4 10             	add    $0x10,%esp

  fd = open("lf1", O_CREATE|O_RDWR);
    1459:	83 ec 08             	sub    $0x8,%esp
    145c:	68 02 02 00 00       	push   $0x202
    1461:	68 3f 76 00 00       	push   $0x763f
    1466:	e8 d8 27 00 00       	call   3c43 <open>
    146b:	83 c4 10             	add    $0x10,%esp
    146e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1471:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1475:	79 17                	jns    148e <linktest+0x6d>
    printf(1, "create lf1 failed\n");
    1477:	83 ec 08             	sub    $0x8,%esp
    147a:	68 47 76 00 00       	push   $0x7647
    147f:	6a 01                	push   $0x1
    1481:	e8 29 2a 00 00       	call   3eaf <printf>
    1486:	83 c4 10             	add    $0x10,%esp
    exit();
    1489:	e8 75 27 00 00       	call   3c03 <exit>
  }
  if(write(fd, "hello", 5) != 5){
    148e:	83 ec 04             	sub    $0x4,%esp
    1491:	6a 05                	push   $0x5
    1493:	68 a3 75 00 00       	push   $0x75a3
    1498:	ff 75 f4             	pushl  -0xc(%ebp)
    149b:	e8 83 27 00 00       	call   3c23 <write>
    14a0:	83 c4 10             	add    $0x10,%esp
    14a3:	83 f8 05             	cmp    $0x5,%eax
    14a6:	74 17                	je     14bf <linktest+0x9e>
    printf(1, "write lf1 failed\n");
    14a8:	83 ec 08             	sub    $0x8,%esp
    14ab:	68 5a 76 00 00       	push   $0x765a
    14b0:	6a 01                	push   $0x1
    14b2:	e8 f8 29 00 00       	call   3eaf <printf>
    14b7:	83 c4 10             	add    $0x10,%esp
    exit();
    14ba:	e8 44 27 00 00       	call   3c03 <exit>
  }
  close(fd);
    14bf:	83 ec 0c             	sub    $0xc,%esp
    14c2:	ff 75 f4             	pushl  -0xc(%ebp)
    14c5:	e8 61 27 00 00       	call   3c2b <close>
    14ca:	83 c4 10             	add    $0x10,%esp

  if(link("lf1", "lf2") < 0){
    14cd:	83 ec 08             	sub    $0x8,%esp
    14d0:	68 43 76 00 00       	push   $0x7643
    14d5:	68 3f 76 00 00       	push   $0x763f
    14da:	e8 84 27 00 00       	call   3c63 <link>
    14df:	83 c4 10             	add    $0x10,%esp
    14e2:	85 c0                	test   %eax,%eax
    14e4:	79 17                	jns    14fd <linktest+0xdc>
    printf(1, "link lf1 lf2 failed\n");
    14e6:	83 ec 08             	sub    $0x8,%esp
    14e9:	68 6c 76 00 00       	push   $0x766c
    14ee:	6a 01                	push   $0x1
    14f0:	e8 ba 29 00 00       	call   3eaf <printf>
    14f5:	83 c4 10             	add    $0x10,%esp
    exit();
    14f8:	e8 06 27 00 00       	call   3c03 <exit>
  }
  unlink("lf1");
    14fd:	83 ec 0c             	sub    $0xc,%esp
    1500:	68 3f 76 00 00       	push   $0x763f
    1505:	e8 49 27 00 00       	call   3c53 <unlink>
    150a:	83 c4 10             	add    $0x10,%esp

  if(open("lf1", 0) >= 0){
    150d:	83 ec 08             	sub    $0x8,%esp
    1510:	6a 00                	push   $0x0
    1512:	68 3f 76 00 00       	push   $0x763f
    1517:	e8 27 27 00 00       	call   3c43 <open>
    151c:	83 c4 10             	add    $0x10,%esp
    151f:	85 c0                	test   %eax,%eax
    1521:	78 17                	js     153a <linktest+0x119>
    printf(1, "unlinked lf1 but it is still there!\n");
    1523:	83 ec 08             	sub    $0x8,%esp
    1526:	68 84 76 00 00       	push   $0x7684
    152b:	6a 01                	push   $0x1
    152d:	e8 7d 29 00 00       	call   3eaf <printf>
    1532:	83 c4 10             	add    $0x10,%esp
    exit();
    1535:	e8 c9 26 00 00       	call   3c03 <exit>
  }

  fd = open("lf2", 0);
    153a:	83 ec 08             	sub    $0x8,%esp
    153d:	6a 00                	push   $0x0
    153f:	68 43 76 00 00       	push   $0x7643
    1544:	e8 fa 26 00 00       	call   3c43 <open>
    1549:	83 c4 10             	add    $0x10,%esp
    154c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    154f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1553:	79 17                	jns    156c <linktest+0x14b>
    printf(1, "open lf2 failed\n");
    1555:	83 ec 08             	sub    $0x8,%esp
    1558:	68 a9 76 00 00       	push   $0x76a9
    155d:	6a 01                	push   $0x1
    155f:	e8 4b 29 00 00       	call   3eaf <printf>
    1564:	83 c4 10             	add    $0x10,%esp
    exit();
    1567:	e8 97 26 00 00       	call   3c03 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    156c:	83 ec 04             	sub    $0x4,%esp
    156f:	68 00 20 00 00       	push   $0x2000
    1574:	68 c0 bf 00 00       	push   $0xbfc0
    1579:	ff 75 f4             	pushl  -0xc(%ebp)
    157c:	e8 9a 26 00 00       	call   3c1b <read>
    1581:	83 c4 10             	add    $0x10,%esp
    1584:	83 f8 05             	cmp    $0x5,%eax
    1587:	74 17                	je     15a0 <linktest+0x17f>
    printf(1, "read lf2 failed\n");
    1589:	83 ec 08             	sub    $0x8,%esp
    158c:	68 ba 76 00 00       	push   $0x76ba
    1591:	6a 01                	push   $0x1
    1593:	e8 17 29 00 00       	call   3eaf <printf>
    1598:	83 c4 10             	add    $0x10,%esp
    exit();
    159b:	e8 63 26 00 00       	call   3c03 <exit>
  }
  close(fd);
    15a0:	83 ec 0c             	sub    $0xc,%esp
    15a3:	ff 75 f4             	pushl  -0xc(%ebp)
    15a6:	e8 80 26 00 00       	call   3c2b <close>
    15ab:	83 c4 10             	add    $0x10,%esp

  if(link("lf2", "lf2") >= 0){
    15ae:	83 ec 08             	sub    $0x8,%esp
    15b1:	68 43 76 00 00       	push   $0x7643
    15b6:	68 43 76 00 00       	push   $0x7643
    15bb:	e8 a3 26 00 00       	call   3c63 <link>
    15c0:	83 c4 10             	add    $0x10,%esp
    15c3:	85 c0                	test   %eax,%eax
    15c5:	78 17                	js     15de <linktest+0x1bd>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    15c7:	83 ec 08             	sub    $0x8,%esp
    15ca:	68 cb 76 00 00       	push   $0x76cb
    15cf:	6a 01                	push   $0x1
    15d1:	e8 d9 28 00 00       	call   3eaf <printf>
    15d6:	83 c4 10             	add    $0x10,%esp
    exit();
    15d9:	e8 25 26 00 00       	call   3c03 <exit>
  }

  unlink("lf2");
    15de:	83 ec 0c             	sub    $0xc,%esp
    15e1:	68 43 76 00 00       	push   $0x7643
    15e6:	e8 68 26 00 00       	call   3c53 <unlink>
    15eb:	83 c4 10             	add    $0x10,%esp
  if(link("lf2", "lf1") >= 0){
    15ee:	83 ec 08             	sub    $0x8,%esp
    15f1:	68 3f 76 00 00       	push   $0x763f
    15f6:	68 43 76 00 00       	push   $0x7643
    15fb:	e8 63 26 00 00       	call   3c63 <link>
    1600:	83 c4 10             	add    $0x10,%esp
    1603:	85 c0                	test   %eax,%eax
    1605:	78 17                	js     161e <linktest+0x1fd>
    printf(1, "link non-existant succeeded! oops\n");
    1607:	83 ec 08             	sub    $0x8,%esp
    160a:	68 ec 76 00 00       	push   $0x76ec
    160f:	6a 01                	push   $0x1
    1611:	e8 99 28 00 00       	call   3eaf <printf>
    1616:	83 c4 10             	add    $0x10,%esp
    exit();
    1619:	e8 e5 25 00 00       	call   3c03 <exit>
  }

  if(link(".", "lf1") >= 0){
    161e:	83 ec 08             	sub    $0x8,%esp
    1621:	68 3f 76 00 00       	push   $0x763f
    1626:	68 0f 77 00 00       	push   $0x770f
    162b:	e8 33 26 00 00       	call   3c63 <link>
    1630:	83 c4 10             	add    $0x10,%esp
    1633:	85 c0                	test   %eax,%eax
    1635:	78 17                	js     164e <linktest+0x22d>
    printf(1, "link . lf1 succeeded! oops\n");
    1637:	83 ec 08             	sub    $0x8,%esp
    163a:	68 11 77 00 00       	push   $0x7711
    163f:	6a 01                	push   $0x1
    1641:	e8 69 28 00 00       	call   3eaf <printf>
    1646:	83 c4 10             	add    $0x10,%esp
    exit();
    1649:	e8 b5 25 00 00       	call   3c03 <exit>
  }

  printf(1, "linktest ok\n");
    164e:	83 ec 08             	sub    $0x8,%esp
    1651:	68 2d 77 00 00       	push   $0x772d
    1656:	6a 01                	push   $0x1
    1658:	e8 52 28 00 00       	call   3eaf <printf>
    165d:	83 c4 10             	add    $0x10,%esp
}
    1660:	90                   	nop
    1661:	c9                   	leave  
    1662:	c3                   	ret    

00001663 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1663:	55                   	push   %ebp
    1664:	89 e5                	mov    %esp,%ebp
    1666:	83 ec 58             	sub    $0x58,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    1669:	83 ec 08             	sub    $0x8,%esp
    166c:	68 3a 77 00 00       	push   $0x773a
    1671:	6a 01                	push   $0x1
    1673:	e8 37 28 00 00       	call   3eaf <printf>
    1678:	83 c4 10             	add    $0x10,%esp
  file[0] = 'C';
    167b:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    167f:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    1683:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    168a:	e9 fc 00 00 00       	jmp    178b <concreate+0x128>
    file[1] = '0' + i;
    168f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1692:	83 c0 30             	add    $0x30,%eax
    1695:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    1698:	83 ec 0c             	sub    $0xc,%esp
    169b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    169e:	50                   	push   %eax
    169f:	e8 af 25 00 00       	call   3c53 <unlink>
    16a4:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    16a7:	e8 4f 25 00 00       	call   3bfb <fork>
    16ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid && (i % 3) == 1){
    16af:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    16b3:	74 3b                	je     16f0 <concreate+0x8d>
    16b5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    16b8:	ba 56 55 55 55       	mov    $0x55555556,%edx
    16bd:	89 c8                	mov    %ecx,%eax
    16bf:	f7 ea                	imul   %edx
    16c1:	89 c8                	mov    %ecx,%eax
    16c3:	c1 f8 1f             	sar    $0x1f,%eax
    16c6:	29 c2                	sub    %eax,%edx
    16c8:	89 d0                	mov    %edx,%eax
    16ca:	01 c0                	add    %eax,%eax
    16cc:	01 d0                	add    %edx,%eax
    16ce:	29 c1                	sub    %eax,%ecx
    16d0:	89 ca                	mov    %ecx,%edx
    16d2:	83 fa 01             	cmp    $0x1,%edx
    16d5:	75 19                	jne    16f0 <concreate+0x8d>
      link("C0", file);
    16d7:	83 ec 08             	sub    $0x8,%esp
    16da:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16dd:	50                   	push   %eax
    16de:	68 4a 77 00 00       	push   $0x774a
    16e3:	e8 7b 25 00 00       	call   3c63 <link>
    16e8:	83 c4 10             	add    $0x10,%esp
    16eb:	e9 87 00 00 00       	jmp    1777 <concreate+0x114>
    } else if(pid == 0 && (i % 5) == 1){
    16f0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    16f4:	75 3b                	jne    1731 <concreate+0xce>
    16f6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    16f9:	ba 67 66 66 66       	mov    $0x66666667,%edx
    16fe:	89 c8                	mov    %ecx,%eax
    1700:	f7 ea                	imul   %edx
    1702:	d1 fa                	sar    %edx
    1704:	89 c8                	mov    %ecx,%eax
    1706:	c1 f8 1f             	sar    $0x1f,%eax
    1709:	29 c2                	sub    %eax,%edx
    170b:	89 d0                	mov    %edx,%eax
    170d:	c1 e0 02             	shl    $0x2,%eax
    1710:	01 d0                	add    %edx,%eax
    1712:	29 c1                	sub    %eax,%ecx
    1714:	89 ca                	mov    %ecx,%edx
    1716:	83 fa 01             	cmp    $0x1,%edx
    1719:	75 16                	jne    1731 <concreate+0xce>
      link("C0", file);
    171b:	83 ec 08             	sub    $0x8,%esp
    171e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1721:	50                   	push   %eax
    1722:	68 4a 77 00 00       	push   $0x774a
    1727:	e8 37 25 00 00       	call   3c63 <link>
    172c:	83 c4 10             	add    $0x10,%esp
    172f:	eb 46                	jmp    1777 <concreate+0x114>
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1731:	83 ec 08             	sub    $0x8,%esp
    1734:	68 02 02 00 00       	push   $0x202
    1739:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    173c:	50                   	push   %eax
    173d:	e8 01 25 00 00       	call   3c43 <open>
    1742:	83 c4 10             	add    $0x10,%esp
    1745:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(fd < 0){
    1748:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    174c:	79 1b                	jns    1769 <concreate+0x106>
        printf(1, "concreate create %s failed\n", file);
    174e:	83 ec 04             	sub    $0x4,%esp
    1751:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1754:	50                   	push   %eax
    1755:	68 4d 77 00 00       	push   $0x774d
    175a:	6a 01                	push   $0x1
    175c:	e8 4e 27 00 00       	call   3eaf <printf>
    1761:	83 c4 10             	add    $0x10,%esp
        exit();
    1764:	e8 9a 24 00 00       	call   3c03 <exit>
      }
      close(fd);
    1769:	83 ec 0c             	sub    $0xc,%esp
    176c:	ff 75 e8             	pushl  -0x18(%ebp)
    176f:	e8 b7 24 00 00       	call   3c2b <close>
    1774:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    1777:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    177b:	75 05                	jne    1782 <concreate+0x11f>
      exit();
    177d:	e8 81 24 00 00       	call   3c03 <exit>
    else
      wait();
    1782:	e8 84 24 00 00       	call   3c0b <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1787:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    178b:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    178f:	0f 8e fa fe ff ff    	jle    168f <concreate+0x2c>
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    1795:	83 ec 04             	sub    $0x4,%esp
    1798:	6a 28                	push   $0x28
    179a:	6a 00                	push   $0x0
    179c:	8d 45 bd             	lea    -0x43(%ebp),%eax
    179f:	50                   	push   %eax
    17a0:	e8 c3 22 00 00       	call   3a68 <memset>
    17a5:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    17a8:	83 ec 08             	sub    $0x8,%esp
    17ab:	6a 00                	push   $0x0
    17ad:	68 0f 77 00 00       	push   $0x770f
    17b2:	e8 8c 24 00 00       	call   3c43 <open>
    17b7:	83 c4 10             	add    $0x10,%esp
    17ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
  n = 0;
    17bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    17c4:	e9 93 00 00 00       	jmp    185c <concreate+0x1f9>
    if(de.inum == 0)
    17c9:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    17cd:	66 85 c0             	test   %ax,%ax
    17d0:	75 05                	jne    17d7 <concreate+0x174>
      continue;
    17d2:	e9 85 00 00 00       	jmp    185c <concreate+0x1f9>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    17d7:	0f b6 45 ae          	movzbl -0x52(%ebp),%eax
    17db:	3c 43                	cmp    $0x43,%al
    17dd:	75 7d                	jne    185c <concreate+0x1f9>
    17df:	0f b6 45 b0          	movzbl -0x50(%ebp),%eax
    17e3:	84 c0                	test   %al,%al
    17e5:	75 75                	jne    185c <concreate+0x1f9>
      i = de.name[1] - '0';
    17e7:	0f b6 45 af          	movzbl -0x51(%ebp),%eax
    17eb:	0f be c0             	movsbl %al,%eax
    17ee:	83 e8 30             	sub    $0x30,%eax
    17f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(i < 0 || i >= sizeof(fa)){
    17f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    17f8:	78 08                	js     1802 <concreate+0x19f>
    17fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17fd:	83 f8 27             	cmp    $0x27,%eax
    1800:	76 1e                	jbe    1820 <concreate+0x1bd>
        printf(1, "concreate weird file %s\n", de.name);
    1802:	83 ec 04             	sub    $0x4,%esp
    1805:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1808:	83 c0 02             	add    $0x2,%eax
    180b:	50                   	push   %eax
    180c:	68 69 77 00 00       	push   $0x7769
    1811:	6a 01                	push   $0x1
    1813:	e8 97 26 00 00       	call   3eaf <printf>
    1818:	83 c4 10             	add    $0x10,%esp
        exit();
    181b:	e8 e3 23 00 00       	call   3c03 <exit>
      }
      if(fa[i]){
    1820:	8d 55 bd             	lea    -0x43(%ebp),%edx
    1823:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1826:	01 d0                	add    %edx,%eax
    1828:	0f b6 00             	movzbl (%eax),%eax
    182b:	84 c0                	test   %al,%al
    182d:	74 1e                	je     184d <concreate+0x1ea>
        printf(1, "concreate duplicate file %s\n", de.name);
    182f:	83 ec 04             	sub    $0x4,%esp
    1832:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1835:	83 c0 02             	add    $0x2,%eax
    1838:	50                   	push   %eax
    1839:	68 82 77 00 00       	push   $0x7782
    183e:	6a 01                	push   $0x1
    1840:	e8 6a 26 00 00       	call   3eaf <printf>
    1845:	83 c4 10             	add    $0x10,%esp
        exit();
    1848:	e8 b6 23 00 00       	call   3c03 <exit>
      }
      fa[i] = 1;
    184d:	8d 55 bd             	lea    -0x43(%ebp),%edx
    1850:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1853:	01 d0                	add    %edx,%eax
    1855:	c6 00 01             	movb   $0x1,(%eax)
      n++;
    1858:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    185c:	83 ec 04             	sub    $0x4,%esp
    185f:	6a 10                	push   $0x10
    1861:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1864:	50                   	push   %eax
    1865:	ff 75 e8             	pushl  -0x18(%ebp)
    1868:	e8 ae 23 00 00       	call   3c1b <read>
    186d:	83 c4 10             	add    $0x10,%esp
    1870:	85 c0                	test   %eax,%eax
    1872:	0f 8f 51 ff ff ff    	jg     17c9 <concreate+0x166>
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    1878:	83 ec 0c             	sub    $0xc,%esp
    187b:	ff 75 e8             	pushl  -0x18(%ebp)
    187e:	e8 a8 23 00 00       	call   3c2b <close>
    1883:	83 c4 10             	add    $0x10,%esp

  if(n != 40){
    1886:	83 7d f0 28          	cmpl   $0x28,-0x10(%ebp)
    188a:	74 17                	je     18a3 <concreate+0x240>
    printf(1, "concreate not enough files in directory listing\n");
    188c:	83 ec 08             	sub    $0x8,%esp
    188f:	68 a0 77 00 00       	push   $0x77a0
    1894:	6a 01                	push   $0x1
    1896:	e8 14 26 00 00       	call   3eaf <printf>
    189b:	83 c4 10             	add    $0x10,%esp
    exit();
    189e:	e8 60 23 00 00       	call   3c03 <exit>
  }

  for(i = 0; i < 40; i++){
    18a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    18aa:	e9 45 01 00 00       	jmp    19f4 <concreate+0x391>
    file[1] = '0' + i;
    18af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18b2:	83 c0 30             	add    $0x30,%eax
    18b5:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    18b8:	e8 3e 23 00 00       	call   3bfb <fork>
    18bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    18c0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18c4:	79 17                	jns    18dd <concreate+0x27a>
      printf(1, "fork failed\n");
    18c6:	83 ec 08             	sub    $0x8,%esp
    18c9:	68 8d 73 00 00       	push   $0x738d
    18ce:	6a 01                	push   $0x1
    18d0:	e8 da 25 00 00       	call   3eaf <printf>
    18d5:	83 c4 10             	add    $0x10,%esp
      exit();
    18d8:	e8 26 23 00 00       	call   3c03 <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    18dd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    18e0:	ba 56 55 55 55       	mov    $0x55555556,%edx
    18e5:	89 c8                	mov    %ecx,%eax
    18e7:	f7 ea                	imul   %edx
    18e9:	89 c8                	mov    %ecx,%eax
    18eb:	c1 f8 1f             	sar    $0x1f,%eax
    18ee:	29 c2                	sub    %eax,%edx
    18f0:	89 d0                	mov    %edx,%eax
    18f2:	89 c2                	mov    %eax,%edx
    18f4:	01 d2                	add    %edx,%edx
    18f6:	01 c2                	add    %eax,%edx
    18f8:	89 c8                	mov    %ecx,%eax
    18fa:	29 d0                	sub    %edx,%eax
    18fc:	85 c0                	test   %eax,%eax
    18fe:	75 06                	jne    1906 <concreate+0x2a3>
    1900:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1904:	74 28                	je     192e <concreate+0x2cb>
       ((i % 3) == 1 && pid != 0)){
    1906:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1909:	ba 56 55 55 55       	mov    $0x55555556,%edx
    190e:	89 c8                	mov    %ecx,%eax
    1910:	f7 ea                	imul   %edx
    1912:	89 c8                	mov    %ecx,%eax
    1914:	c1 f8 1f             	sar    $0x1f,%eax
    1917:	29 c2                	sub    %eax,%edx
    1919:	89 d0                	mov    %edx,%eax
    191b:	01 c0                	add    %eax,%eax
    191d:	01 d0                	add    %edx,%eax
    191f:	29 c1                	sub    %eax,%ecx
    1921:	89 ca                	mov    %ecx,%edx
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    1923:	83 fa 01             	cmp    $0x1,%edx
    1926:	75 7c                	jne    19a4 <concreate+0x341>
       ((i % 3) == 1 && pid != 0)){
    1928:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    192c:	74 76                	je     19a4 <concreate+0x341>
      close(open(file, 0));
    192e:	83 ec 08             	sub    $0x8,%esp
    1931:	6a 00                	push   $0x0
    1933:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1936:	50                   	push   %eax
    1937:	e8 07 23 00 00       	call   3c43 <open>
    193c:	83 c4 10             	add    $0x10,%esp
    193f:	83 ec 0c             	sub    $0xc,%esp
    1942:	50                   	push   %eax
    1943:	e8 e3 22 00 00       	call   3c2b <close>
    1948:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    194b:	83 ec 08             	sub    $0x8,%esp
    194e:	6a 00                	push   $0x0
    1950:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1953:	50                   	push   %eax
    1954:	e8 ea 22 00 00       	call   3c43 <open>
    1959:	83 c4 10             	add    $0x10,%esp
    195c:	83 ec 0c             	sub    $0xc,%esp
    195f:	50                   	push   %eax
    1960:	e8 c6 22 00 00       	call   3c2b <close>
    1965:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1968:	83 ec 08             	sub    $0x8,%esp
    196b:	6a 00                	push   $0x0
    196d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1970:	50                   	push   %eax
    1971:	e8 cd 22 00 00       	call   3c43 <open>
    1976:	83 c4 10             	add    $0x10,%esp
    1979:	83 ec 0c             	sub    $0xc,%esp
    197c:	50                   	push   %eax
    197d:	e8 a9 22 00 00       	call   3c2b <close>
    1982:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1985:	83 ec 08             	sub    $0x8,%esp
    1988:	6a 00                	push   $0x0
    198a:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    198d:	50                   	push   %eax
    198e:	e8 b0 22 00 00       	call   3c43 <open>
    1993:	83 c4 10             	add    $0x10,%esp
    1996:	83 ec 0c             	sub    $0xc,%esp
    1999:	50                   	push   %eax
    199a:	e8 8c 22 00 00       	call   3c2b <close>
    199f:	83 c4 10             	add    $0x10,%esp
    19a2:	eb 3c                	jmp    19e0 <concreate+0x37d>
    } else {
      unlink(file);
    19a4:	83 ec 0c             	sub    $0xc,%esp
    19a7:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19aa:	50                   	push   %eax
    19ab:	e8 a3 22 00 00       	call   3c53 <unlink>
    19b0:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    19b3:	83 ec 0c             	sub    $0xc,%esp
    19b6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19b9:	50                   	push   %eax
    19ba:	e8 94 22 00 00       	call   3c53 <unlink>
    19bf:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    19c2:	83 ec 0c             	sub    $0xc,%esp
    19c5:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19c8:	50                   	push   %eax
    19c9:	e8 85 22 00 00       	call   3c53 <unlink>
    19ce:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    19d1:	83 ec 0c             	sub    $0xc,%esp
    19d4:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19d7:	50                   	push   %eax
    19d8:	e8 76 22 00 00       	call   3c53 <unlink>
    19dd:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    19e0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19e4:	75 05                	jne    19eb <concreate+0x388>
      exit();
    19e6:	e8 18 22 00 00       	call   3c03 <exit>
    else
      wait();
    19eb:	e8 1b 22 00 00       	call   3c0b <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    19f4:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    19f8:	0f 8e b1 fe ff ff    	jle    18af <concreate+0x24c>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    19fe:	83 ec 08             	sub    $0x8,%esp
    1a01:	68 d1 77 00 00       	push   $0x77d1
    1a06:	6a 01                	push   $0x1
    1a08:	e8 a2 24 00 00       	call   3eaf <printf>
    1a0d:	83 c4 10             	add    $0x10,%esp
}
    1a10:	90                   	nop
    1a11:	c9                   	leave  
    1a12:	c3                   	ret    

00001a13 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1a13:	55                   	push   %ebp
    1a14:	89 e5                	mov    %esp,%ebp
    1a16:	83 ec 18             	sub    $0x18,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1a19:	83 ec 08             	sub    $0x8,%esp
    1a1c:	68 df 77 00 00       	push   $0x77df
    1a21:	6a 01                	push   $0x1
    1a23:	e8 87 24 00 00       	call   3eaf <printf>
    1a28:	83 c4 10             	add    $0x10,%esp

  unlink("x");
    1a2b:	83 ec 0c             	sub    $0xc,%esp
    1a2e:	68 46 73 00 00       	push   $0x7346
    1a33:	e8 1b 22 00 00       	call   3c53 <unlink>
    1a38:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    1a3b:	e8 bb 21 00 00       	call   3bfb <fork>
    1a40:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    1a43:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a47:	79 17                	jns    1a60 <linkunlink+0x4d>
    printf(1, "fork failed\n");
    1a49:	83 ec 08             	sub    $0x8,%esp
    1a4c:	68 8d 73 00 00       	push   $0x738d
    1a51:	6a 01                	push   $0x1
    1a53:	e8 57 24 00 00       	call   3eaf <printf>
    1a58:	83 c4 10             	add    $0x10,%esp
    exit();
    1a5b:	e8 a3 21 00 00       	call   3c03 <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    1a60:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a64:	74 07                	je     1a6d <linkunlink+0x5a>
    1a66:	b8 01 00 00 00       	mov    $0x1,%eax
    1a6b:	eb 05                	jmp    1a72 <linkunlink+0x5f>
    1a6d:	b8 61 00 00 00       	mov    $0x61,%eax
    1a72:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 100; i++){
    1a75:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1a7c:	e9 9a 00 00 00       	jmp    1b1b <linkunlink+0x108>
    x = x * 1103515245 + 12345;
    1a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a84:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
    1a8a:	05 39 30 00 00       	add    $0x3039,%eax
    1a8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((x % 3) == 0){
    1a92:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1a95:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1a9a:	89 c8                	mov    %ecx,%eax
    1a9c:	f7 e2                	mul    %edx
    1a9e:	89 d0                	mov    %edx,%eax
    1aa0:	d1 e8                	shr    %eax
    1aa2:	89 c2                	mov    %eax,%edx
    1aa4:	01 d2                	add    %edx,%edx
    1aa6:	01 c2                	add    %eax,%edx
    1aa8:	89 c8                	mov    %ecx,%eax
    1aaa:	29 d0                	sub    %edx,%eax
    1aac:	85 c0                	test   %eax,%eax
    1aae:	75 23                	jne    1ad3 <linkunlink+0xc0>
      close(open("x", O_RDWR | O_CREATE));
    1ab0:	83 ec 08             	sub    $0x8,%esp
    1ab3:	68 02 02 00 00       	push   $0x202
    1ab8:	68 46 73 00 00       	push   $0x7346
    1abd:	e8 81 21 00 00       	call   3c43 <open>
    1ac2:	83 c4 10             	add    $0x10,%esp
    1ac5:	83 ec 0c             	sub    $0xc,%esp
    1ac8:	50                   	push   %eax
    1ac9:	e8 5d 21 00 00       	call   3c2b <close>
    1ace:	83 c4 10             	add    $0x10,%esp
    1ad1:	eb 44                	jmp    1b17 <linkunlink+0x104>
    } else if((x % 3) == 1){
    1ad3:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1ad6:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1adb:	89 c8                	mov    %ecx,%eax
    1add:	f7 e2                	mul    %edx
    1adf:	d1 ea                	shr    %edx
    1ae1:	89 d0                	mov    %edx,%eax
    1ae3:	01 c0                	add    %eax,%eax
    1ae5:	01 d0                	add    %edx,%eax
    1ae7:	29 c1                	sub    %eax,%ecx
    1ae9:	89 ca                	mov    %ecx,%edx
    1aeb:	83 fa 01             	cmp    $0x1,%edx
    1aee:	75 17                	jne    1b07 <linkunlink+0xf4>
      link("cat", "x");
    1af0:	83 ec 08             	sub    $0x8,%esp
    1af3:	68 46 73 00 00       	push   $0x7346
    1af8:	68 f0 77 00 00       	push   $0x77f0
    1afd:	e8 61 21 00 00       	call   3c63 <link>
    1b02:	83 c4 10             	add    $0x10,%esp
    1b05:	eb 10                	jmp    1b17 <linkunlink+0x104>
    } else {
      unlink("x");
    1b07:	83 ec 0c             	sub    $0xc,%esp
    1b0a:	68 46 73 00 00       	push   $0x7346
    1b0f:	e8 3f 21 00 00       	call   3c53 <unlink>
    1b14:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b17:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1b1b:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    1b1f:	0f 8e 5c ff ff ff    	jle    1a81 <linkunlink+0x6e>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1b25:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b29:	74 07                	je     1b32 <linkunlink+0x11f>
    wait();
    1b2b:	e8 db 20 00 00       	call   3c0b <wait>
    1b30:	eb 05                	jmp    1b37 <linkunlink+0x124>
  else 
    exit();
    1b32:	e8 cc 20 00 00       	call   3c03 <exit>

  printf(1, "linkunlink ok\n");
    1b37:	83 ec 08             	sub    $0x8,%esp
    1b3a:	68 f4 77 00 00       	push   $0x77f4
    1b3f:	6a 01                	push   $0x1
    1b41:	e8 69 23 00 00       	call   3eaf <printf>
    1b46:	83 c4 10             	add    $0x10,%esp
}
    1b49:	90                   	nop
    1b4a:	c9                   	leave  
    1b4b:	c3                   	ret    

00001b4c <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    1b4c:	55                   	push   %ebp
    1b4d:	89 e5                	mov    %esp,%ebp
    1b4f:	83 ec 28             	sub    $0x28,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1b52:	83 ec 08             	sub    $0x8,%esp
    1b55:	68 03 78 00 00       	push   $0x7803
    1b5a:	6a 01                	push   $0x1
    1b5c:	e8 4e 23 00 00       	call   3eaf <printf>
    1b61:	83 c4 10             	add    $0x10,%esp
  unlink("bd");
    1b64:	83 ec 0c             	sub    $0xc,%esp
    1b67:	68 10 78 00 00       	push   $0x7810
    1b6c:	e8 e2 20 00 00       	call   3c53 <unlink>
    1b71:	83 c4 10             	add    $0x10,%esp

  fd = open("bd", O_CREATE);
    1b74:	83 ec 08             	sub    $0x8,%esp
    1b77:	68 00 02 00 00       	push   $0x200
    1b7c:	68 10 78 00 00       	push   $0x7810
    1b81:	e8 bd 20 00 00       	call   3c43 <open>
    1b86:	83 c4 10             	add    $0x10,%esp
    1b89:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1b8c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1b90:	79 17                	jns    1ba9 <bigdir+0x5d>
    printf(1, "bigdir create failed\n");
    1b92:	83 ec 08             	sub    $0x8,%esp
    1b95:	68 13 78 00 00       	push   $0x7813
    1b9a:	6a 01                	push   $0x1
    1b9c:	e8 0e 23 00 00       	call   3eaf <printf>
    1ba1:	83 c4 10             	add    $0x10,%esp
    exit();
    1ba4:	e8 5a 20 00 00       	call   3c03 <exit>
  }
  close(fd);
    1ba9:	83 ec 0c             	sub    $0xc,%esp
    1bac:	ff 75 f0             	pushl  -0x10(%ebp)
    1baf:	e8 77 20 00 00       	call   3c2b <close>
    1bb4:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 500; i++){
    1bb7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1bbe:	eb 63                	jmp    1c23 <bigdir+0xd7>
    name[0] = 'x';
    1bc0:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1bc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bc7:	8d 50 3f             	lea    0x3f(%eax),%edx
    1bca:	85 c0                	test   %eax,%eax
    1bcc:	0f 48 c2             	cmovs  %edx,%eax
    1bcf:	c1 f8 06             	sar    $0x6,%eax
    1bd2:	83 c0 30             	add    $0x30,%eax
    1bd5:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1bd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bdb:	99                   	cltd   
    1bdc:	c1 ea 1a             	shr    $0x1a,%edx
    1bdf:	01 d0                	add    %edx,%eax
    1be1:	83 e0 3f             	and    $0x3f,%eax
    1be4:	29 d0                	sub    %edx,%eax
    1be6:	83 c0 30             	add    $0x30,%eax
    1be9:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1bec:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(link("bd", name) != 0){
    1bf0:	83 ec 08             	sub    $0x8,%esp
    1bf3:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1bf6:	50                   	push   %eax
    1bf7:	68 10 78 00 00       	push   $0x7810
    1bfc:	e8 62 20 00 00       	call   3c63 <link>
    1c01:	83 c4 10             	add    $0x10,%esp
    1c04:	85 c0                	test   %eax,%eax
    1c06:	74 17                	je     1c1f <bigdir+0xd3>
      printf(1, "bigdir link failed\n");
    1c08:	83 ec 08             	sub    $0x8,%esp
    1c0b:	68 29 78 00 00       	push   $0x7829
    1c10:	6a 01                	push   $0x1
    1c12:	e8 98 22 00 00       	call   3eaf <printf>
    1c17:	83 c4 10             	add    $0x10,%esp
      exit();
    1c1a:	e8 e4 1f 00 00       	call   3c03 <exit>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1c1f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1c23:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1c2a:	7e 94                	jle    1bc0 <bigdir+0x74>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c2c:	83 ec 0c             	sub    $0xc,%esp
    1c2f:	68 10 78 00 00       	push   $0x7810
    1c34:	e8 1a 20 00 00       	call   3c53 <unlink>
    1c39:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    1c3c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1c43:	eb 5e                	jmp    1ca3 <bigdir+0x157>
    name[0] = 'x';
    1c45:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1c49:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c4c:	8d 50 3f             	lea    0x3f(%eax),%edx
    1c4f:	85 c0                	test   %eax,%eax
    1c51:	0f 48 c2             	cmovs  %edx,%eax
    1c54:	c1 f8 06             	sar    $0x6,%eax
    1c57:	83 c0 30             	add    $0x30,%eax
    1c5a:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1c5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c60:	99                   	cltd   
    1c61:	c1 ea 1a             	shr    $0x1a,%edx
    1c64:	01 d0                	add    %edx,%eax
    1c66:	83 e0 3f             	and    $0x3f,%eax
    1c69:	29 d0                	sub    %edx,%eax
    1c6b:	83 c0 30             	add    $0x30,%eax
    1c6e:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1c71:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(unlink(name) != 0){
    1c75:	83 ec 0c             	sub    $0xc,%esp
    1c78:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1c7b:	50                   	push   %eax
    1c7c:	e8 d2 1f 00 00       	call   3c53 <unlink>
    1c81:	83 c4 10             	add    $0x10,%esp
    1c84:	85 c0                	test   %eax,%eax
    1c86:	74 17                	je     1c9f <bigdir+0x153>
      printf(1, "bigdir unlink failed");
    1c88:	83 ec 08             	sub    $0x8,%esp
    1c8b:	68 3d 78 00 00       	push   $0x783d
    1c90:	6a 01                	push   $0x1
    1c92:	e8 18 22 00 00       	call   3eaf <printf>
    1c97:	83 c4 10             	add    $0x10,%esp
      exit();
    1c9a:	e8 64 1f 00 00       	call   3c03 <exit>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1c9f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1ca3:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1caa:	7e 99                	jle    1c45 <bigdir+0xf9>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1cac:	83 ec 08             	sub    $0x8,%esp
    1caf:	68 52 78 00 00       	push   $0x7852
    1cb4:	6a 01                	push   $0x1
    1cb6:	e8 f4 21 00 00       	call   3eaf <printf>
    1cbb:	83 c4 10             	add    $0x10,%esp
}
    1cbe:	90                   	nop
    1cbf:	c9                   	leave  
    1cc0:	c3                   	ret    

00001cc1 <subdir>:

void
subdir(void)
{
    1cc1:	55                   	push   %ebp
    1cc2:	89 e5                	mov    %esp,%ebp
    1cc4:	83 ec 18             	sub    $0x18,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1cc7:	83 ec 08             	sub    $0x8,%esp
    1cca:	68 5d 78 00 00       	push   $0x785d
    1ccf:	6a 01                	push   $0x1
    1cd1:	e8 d9 21 00 00       	call   3eaf <printf>
    1cd6:	83 c4 10             	add    $0x10,%esp

  unlink("ff");
    1cd9:	83 ec 0c             	sub    $0xc,%esp
    1cdc:	68 6a 78 00 00       	push   $0x786a
    1ce1:	e8 6d 1f 00 00       	call   3c53 <unlink>
    1ce6:	83 c4 10             	add    $0x10,%esp
  if(mkdir("dd") != 0){
    1ce9:	83 ec 0c             	sub    $0xc,%esp
    1cec:	68 6d 78 00 00       	push   $0x786d
    1cf1:	e8 75 1f 00 00       	call   3c6b <mkdir>
    1cf6:	83 c4 10             	add    $0x10,%esp
    1cf9:	85 c0                	test   %eax,%eax
    1cfb:	74 17                	je     1d14 <subdir+0x53>
    printf(1, "subdir mkdir dd failed\n");
    1cfd:	83 ec 08             	sub    $0x8,%esp
    1d00:	68 70 78 00 00       	push   $0x7870
    1d05:	6a 01                	push   $0x1
    1d07:	e8 a3 21 00 00       	call   3eaf <printf>
    1d0c:	83 c4 10             	add    $0x10,%esp
    exit();
    1d0f:	e8 ef 1e 00 00       	call   3c03 <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d14:	83 ec 08             	sub    $0x8,%esp
    1d17:	68 02 02 00 00       	push   $0x202
    1d1c:	68 88 78 00 00       	push   $0x7888
    1d21:	e8 1d 1f 00 00       	call   3c43 <open>
    1d26:	83 c4 10             	add    $0x10,%esp
    1d29:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1d2c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1d30:	79 17                	jns    1d49 <subdir+0x88>
    printf(1, "create dd/ff failed\n");
    1d32:	83 ec 08             	sub    $0x8,%esp
    1d35:	68 8e 78 00 00       	push   $0x788e
    1d3a:	6a 01                	push   $0x1
    1d3c:	e8 6e 21 00 00       	call   3eaf <printf>
    1d41:	83 c4 10             	add    $0x10,%esp
    exit();
    1d44:	e8 ba 1e 00 00       	call   3c03 <exit>
  }
  write(fd, "ff", 2);
    1d49:	83 ec 04             	sub    $0x4,%esp
    1d4c:	6a 02                	push   $0x2
    1d4e:	68 6a 78 00 00       	push   $0x786a
    1d53:	ff 75 f4             	pushl  -0xc(%ebp)
    1d56:	e8 c8 1e 00 00       	call   3c23 <write>
    1d5b:	83 c4 10             	add    $0x10,%esp
  close(fd);
    1d5e:	83 ec 0c             	sub    $0xc,%esp
    1d61:	ff 75 f4             	pushl  -0xc(%ebp)
    1d64:	e8 c2 1e 00 00       	call   3c2b <close>
    1d69:	83 c4 10             	add    $0x10,%esp
  
  if(unlink("dd") >= 0){
    1d6c:	83 ec 0c             	sub    $0xc,%esp
    1d6f:	68 6d 78 00 00       	push   $0x786d
    1d74:	e8 da 1e 00 00       	call   3c53 <unlink>
    1d79:	83 c4 10             	add    $0x10,%esp
    1d7c:	85 c0                	test   %eax,%eax
    1d7e:	78 17                	js     1d97 <subdir+0xd6>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1d80:	83 ec 08             	sub    $0x8,%esp
    1d83:	68 a4 78 00 00       	push   $0x78a4
    1d88:	6a 01                	push   $0x1
    1d8a:	e8 20 21 00 00       	call   3eaf <printf>
    1d8f:	83 c4 10             	add    $0x10,%esp
    exit();
    1d92:	e8 6c 1e 00 00       	call   3c03 <exit>
  }

  if(mkdir("/dd/dd") != 0){
    1d97:	83 ec 0c             	sub    $0xc,%esp
    1d9a:	68 ca 78 00 00       	push   $0x78ca
    1d9f:	e8 c7 1e 00 00       	call   3c6b <mkdir>
    1da4:	83 c4 10             	add    $0x10,%esp
    1da7:	85 c0                	test   %eax,%eax
    1da9:	74 17                	je     1dc2 <subdir+0x101>
    printf(1, "subdir mkdir dd/dd failed\n");
    1dab:	83 ec 08             	sub    $0x8,%esp
    1dae:	68 d1 78 00 00       	push   $0x78d1
    1db3:	6a 01                	push   $0x1
    1db5:	e8 f5 20 00 00       	call   3eaf <printf>
    1dba:	83 c4 10             	add    $0x10,%esp
    exit();
    1dbd:	e8 41 1e 00 00       	call   3c03 <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dc2:	83 ec 08             	sub    $0x8,%esp
    1dc5:	68 02 02 00 00       	push   $0x202
    1dca:	68 ec 78 00 00       	push   $0x78ec
    1dcf:	e8 6f 1e 00 00       	call   3c43 <open>
    1dd4:	83 c4 10             	add    $0x10,%esp
    1dd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1dda:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1dde:	79 17                	jns    1df7 <subdir+0x136>
    printf(1, "create dd/dd/ff failed\n");
    1de0:	83 ec 08             	sub    $0x8,%esp
    1de3:	68 f5 78 00 00       	push   $0x78f5
    1de8:	6a 01                	push   $0x1
    1dea:	e8 c0 20 00 00       	call   3eaf <printf>
    1def:	83 c4 10             	add    $0x10,%esp
    exit();
    1df2:	e8 0c 1e 00 00       	call   3c03 <exit>
  }
  write(fd, "FF", 2);
    1df7:	83 ec 04             	sub    $0x4,%esp
    1dfa:	6a 02                	push   $0x2
    1dfc:	68 0d 79 00 00       	push   $0x790d
    1e01:	ff 75 f4             	pushl  -0xc(%ebp)
    1e04:	e8 1a 1e 00 00       	call   3c23 <write>
    1e09:	83 c4 10             	add    $0x10,%esp
  close(fd);
    1e0c:	83 ec 0c             	sub    $0xc,%esp
    1e0f:	ff 75 f4             	pushl  -0xc(%ebp)
    1e12:	e8 14 1e 00 00       	call   3c2b <close>
    1e17:	83 c4 10             	add    $0x10,%esp

  fd = open("dd/dd/../ff", 0);
    1e1a:	83 ec 08             	sub    $0x8,%esp
    1e1d:	6a 00                	push   $0x0
    1e1f:	68 10 79 00 00       	push   $0x7910
    1e24:	e8 1a 1e 00 00       	call   3c43 <open>
    1e29:	83 c4 10             	add    $0x10,%esp
    1e2c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1e2f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e33:	79 17                	jns    1e4c <subdir+0x18b>
    printf(1, "open dd/dd/../ff failed\n");
    1e35:	83 ec 08             	sub    $0x8,%esp
    1e38:	68 1c 79 00 00       	push   $0x791c
    1e3d:	6a 01                	push   $0x1
    1e3f:	e8 6b 20 00 00       	call   3eaf <printf>
    1e44:	83 c4 10             	add    $0x10,%esp
    exit();
    1e47:	e8 b7 1d 00 00       	call   3c03 <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    1e4c:	83 ec 04             	sub    $0x4,%esp
    1e4f:	68 00 20 00 00       	push   $0x2000
    1e54:	68 c0 bf 00 00       	push   $0xbfc0
    1e59:	ff 75 f4             	pushl  -0xc(%ebp)
    1e5c:	e8 ba 1d 00 00       	call   3c1b <read>
    1e61:	83 c4 10             	add    $0x10,%esp
    1e64:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(cc != 2 || buf[0] != 'f'){
    1e67:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    1e6b:	75 0b                	jne    1e78 <subdir+0x1b7>
    1e6d:	0f b6 05 c0 bf 00 00 	movzbl 0xbfc0,%eax
    1e74:	3c 66                	cmp    $0x66,%al
    1e76:	74 17                	je     1e8f <subdir+0x1ce>
    printf(1, "dd/dd/../ff wrong content\n");
    1e78:	83 ec 08             	sub    $0x8,%esp
    1e7b:	68 35 79 00 00       	push   $0x7935
    1e80:	6a 01                	push   $0x1
    1e82:	e8 28 20 00 00       	call   3eaf <printf>
    1e87:	83 c4 10             	add    $0x10,%esp
    exit();
    1e8a:	e8 74 1d 00 00       	call   3c03 <exit>
  }
  close(fd);
    1e8f:	83 ec 0c             	sub    $0xc,%esp
    1e92:	ff 75 f4             	pushl  -0xc(%ebp)
    1e95:	e8 91 1d 00 00       	call   3c2b <close>
    1e9a:	83 c4 10             	add    $0x10,%esp

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e9d:	83 ec 08             	sub    $0x8,%esp
    1ea0:	68 50 79 00 00       	push   $0x7950
    1ea5:	68 ec 78 00 00       	push   $0x78ec
    1eaa:	e8 b4 1d 00 00       	call   3c63 <link>
    1eaf:	83 c4 10             	add    $0x10,%esp
    1eb2:	85 c0                	test   %eax,%eax
    1eb4:	74 17                	je     1ecd <subdir+0x20c>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1eb6:	83 ec 08             	sub    $0x8,%esp
    1eb9:	68 5c 79 00 00       	push   $0x795c
    1ebe:	6a 01                	push   $0x1
    1ec0:	e8 ea 1f 00 00       	call   3eaf <printf>
    1ec5:	83 c4 10             	add    $0x10,%esp
    exit();
    1ec8:	e8 36 1d 00 00       	call   3c03 <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    1ecd:	83 ec 0c             	sub    $0xc,%esp
    1ed0:	68 ec 78 00 00       	push   $0x78ec
    1ed5:	e8 79 1d 00 00       	call   3c53 <unlink>
    1eda:	83 c4 10             	add    $0x10,%esp
    1edd:	85 c0                	test   %eax,%eax
    1edf:	74 17                	je     1ef8 <subdir+0x237>
    printf(1, "unlink dd/dd/ff failed\n");
    1ee1:	83 ec 08             	sub    $0x8,%esp
    1ee4:	68 7d 79 00 00       	push   $0x797d
    1ee9:	6a 01                	push   $0x1
    1eeb:	e8 bf 1f 00 00       	call   3eaf <printf>
    1ef0:	83 c4 10             	add    $0x10,%esp
    exit();
    1ef3:	e8 0b 1d 00 00       	call   3c03 <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1ef8:	83 ec 08             	sub    $0x8,%esp
    1efb:	6a 00                	push   $0x0
    1efd:	68 ec 78 00 00       	push   $0x78ec
    1f02:	e8 3c 1d 00 00       	call   3c43 <open>
    1f07:	83 c4 10             	add    $0x10,%esp
    1f0a:	85 c0                	test   %eax,%eax
    1f0c:	78 17                	js     1f25 <subdir+0x264>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1f0e:	83 ec 08             	sub    $0x8,%esp
    1f11:	68 98 79 00 00       	push   $0x7998
    1f16:	6a 01                	push   $0x1
    1f18:	e8 92 1f 00 00       	call   3eaf <printf>
    1f1d:	83 c4 10             	add    $0x10,%esp
    exit();
    1f20:	e8 de 1c 00 00       	call   3c03 <exit>
  }

  if(chdir("dd") != 0){
    1f25:	83 ec 0c             	sub    $0xc,%esp
    1f28:	68 6d 78 00 00       	push   $0x786d
    1f2d:	e8 41 1d 00 00       	call   3c73 <chdir>
    1f32:	83 c4 10             	add    $0x10,%esp
    1f35:	85 c0                	test   %eax,%eax
    1f37:	74 17                	je     1f50 <subdir+0x28f>
    printf(1, "chdir dd failed\n");
    1f39:	83 ec 08             	sub    $0x8,%esp
    1f3c:	68 bc 79 00 00       	push   $0x79bc
    1f41:	6a 01                	push   $0x1
    1f43:	e8 67 1f 00 00       	call   3eaf <printf>
    1f48:	83 c4 10             	add    $0x10,%esp
    exit();
    1f4b:	e8 b3 1c 00 00       	call   3c03 <exit>
  }
  if(chdir("dd/../../dd") != 0){
    1f50:	83 ec 0c             	sub    $0xc,%esp
    1f53:	68 cd 79 00 00       	push   $0x79cd
    1f58:	e8 16 1d 00 00       	call   3c73 <chdir>
    1f5d:	83 c4 10             	add    $0x10,%esp
    1f60:	85 c0                	test   %eax,%eax
    1f62:	74 17                	je     1f7b <subdir+0x2ba>
    printf(1, "chdir dd/../../dd failed\n");
    1f64:	83 ec 08             	sub    $0x8,%esp
    1f67:	68 d9 79 00 00       	push   $0x79d9
    1f6c:	6a 01                	push   $0x1
    1f6e:	e8 3c 1f 00 00       	call   3eaf <printf>
    1f73:	83 c4 10             	add    $0x10,%esp
    exit();
    1f76:	e8 88 1c 00 00       	call   3c03 <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    1f7b:	83 ec 0c             	sub    $0xc,%esp
    1f7e:	68 f3 79 00 00       	push   $0x79f3
    1f83:	e8 eb 1c 00 00       	call   3c73 <chdir>
    1f88:	83 c4 10             	add    $0x10,%esp
    1f8b:	85 c0                	test   %eax,%eax
    1f8d:	74 17                	je     1fa6 <subdir+0x2e5>
    printf(1, "chdir dd/../../dd failed\n");
    1f8f:	83 ec 08             	sub    $0x8,%esp
    1f92:	68 d9 79 00 00       	push   $0x79d9
    1f97:	6a 01                	push   $0x1
    1f99:	e8 11 1f 00 00       	call   3eaf <printf>
    1f9e:	83 c4 10             	add    $0x10,%esp
    exit();
    1fa1:	e8 5d 1c 00 00       	call   3c03 <exit>
  }
  if(chdir("./..") != 0){
    1fa6:	83 ec 0c             	sub    $0xc,%esp
    1fa9:	68 02 7a 00 00       	push   $0x7a02
    1fae:	e8 c0 1c 00 00       	call   3c73 <chdir>
    1fb3:	83 c4 10             	add    $0x10,%esp
    1fb6:	85 c0                	test   %eax,%eax
    1fb8:	74 17                	je     1fd1 <subdir+0x310>
    printf(1, "chdir ./.. failed\n");
    1fba:	83 ec 08             	sub    $0x8,%esp
    1fbd:	68 07 7a 00 00       	push   $0x7a07
    1fc2:	6a 01                	push   $0x1
    1fc4:	e8 e6 1e 00 00       	call   3eaf <printf>
    1fc9:	83 c4 10             	add    $0x10,%esp
    exit();
    1fcc:	e8 32 1c 00 00       	call   3c03 <exit>
  }

  fd = open("dd/dd/ffff", 0);
    1fd1:	83 ec 08             	sub    $0x8,%esp
    1fd4:	6a 00                	push   $0x0
    1fd6:	68 50 79 00 00       	push   $0x7950
    1fdb:	e8 63 1c 00 00       	call   3c43 <open>
    1fe0:	83 c4 10             	add    $0x10,%esp
    1fe3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1fe6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1fea:	79 17                	jns    2003 <subdir+0x342>
    printf(1, "open dd/dd/ffff failed\n");
    1fec:	83 ec 08             	sub    $0x8,%esp
    1fef:	68 1a 7a 00 00       	push   $0x7a1a
    1ff4:	6a 01                	push   $0x1
    1ff6:	e8 b4 1e 00 00       	call   3eaf <printf>
    1ffb:	83 c4 10             	add    $0x10,%esp
    exit();
    1ffe:	e8 00 1c 00 00       	call   3c03 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    2003:	83 ec 04             	sub    $0x4,%esp
    2006:	68 00 20 00 00       	push   $0x2000
    200b:	68 c0 bf 00 00       	push   $0xbfc0
    2010:	ff 75 f4             	pushl  -0xc(%ebp)
    2013:	e8 03 1c 00 00       	call   3c1b <read>
    2018:	83 c4 10             	add    $0x10,%esp
    201b:	83 f8 02             	cmp    $0x2,%eax
    201e:	74 17                	je     2037 <subdir+0x376>
    printf(1, "read dd/dd/ffff wrong len\n");
    2020:	83 ec 08             	sub    $0x8,%esp
    2023:	68 32 7a 00 00       	push   $0x7a32
    2028:	6a 01                	push   $0x1
    202a:	e8 80 1e 00 00       	call   3eaf <printf>
    202f:	83 c4 10             	add    $0x10,%esp
    exit();
    2032:	e8 cc 1b 00 00       	call   3c03 <exit>
  }
  close(fd);
    2037:	83 ec 0c             	sub    $0xc,%esp
    203a:	ff 75 f4             	pushl  -0xc(%ebp)
    203d:	e8 e9 1b 00 00       	call   3c2b <close>
    2042:	83 c4 10             	add    $0x10,%esp

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2045:	83 ec 08             	sub    $0x8,%esp
    2048:	6a 00                	push   $0x0
    204a:	68 ec 78 00 00       	push   $0x78ec
    204f:	e8 ef 1b 00 00       	call   3c43 <open>
    2054:	83 c4 10             	add    $0x10,%esp
    2057:	85 c0                	test   %eax,%eax
    2059:	78 17                	js     2072 <subdir+0x3b1>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    205b:	83 ec 08             	sub    $0x8,%esp
    205e:	68 50 7a 00 00       	push   $0x7a50
    2063:	6a 01                	push   $0x1
    2065:	e8 45 1e 00 00       	call   3eaf <printf>
    206a:	83 c4 10             	add    $0x10,%esp
    exit();
    206d:	e8 91 1b 00 00       	call   3c03 <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2072:	83 ec 08             	sub    $0x8,%esp
    2075:	68 02 02 00 00       	push   $0x202
    207a:	68 75 7a 00 00       	push   $0x7a75
    207f:	e8 bf 1b 00 00       	call   3c43 <open>
    2084:	83 c4 10             	add    $0x10,%esp
    2087:	85 c0                	test   %eax,%eax
    2089:	78 17                	js     20a2 <subdir+0x3e1>
    printf(1, "create dd/ff/ff succeeded!\n");
    208b:	83 ec 08             	sub    $0x8,%esp
    208e:	68 7e 7a 00 00       	push   $0x7a7e
    2093:	6a 01                	push   $0x1
    2095:	e8 15 1e 00 00       	call   3eaf <printf>
    209a:	83 c4 10             	add    $0x10,%esp
    exit();
    209d:	e8 61 1b 00 00       	call   3c03 <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    20a2:	83 ec 08             	sub    $0x8,%esp
    20a5:	68 02 02 00 00       	push   $0x202
    20aa:	68 9a 7a 00 00       	push   $0x7a9a
    20af:	e8 8f 1b 00 00       	call   3c43 <open>
    20b4:	83 c4 10             	add    $0x10,%esp
    20b7:	85 c0                	test   %eax,%eax
    20b9:	78 17                	js     20d2 <subdir+0x411>
    printf(1, "create dd/xx/ff succeeded!\n");
    20bb:	83 ec 08             	sub    $0x8,%esp
    20be:	68 a3 7a 00 00       	push   $0x7aa3
    20c3:	6a 01                	push   $0x1
    20c5:	e8 e5 1d 00 00       	call   3eaf <printf>
    20ca:	83 c4 10             	add    $0x10,%esp
    exit();
    20cd:	e8 31 1b 00 00       	call   3c03 <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    20d2:	83 ec 08             	sub    $0x8,%esp
    20d5:	68 00 02 00 00       	push   $0x200
    20da:	68 6d 78 00 00       	push   $0x786d
    20df:	e8 5f 1b 00 00       	call   3c43 <open>
    20e4:	83 c4 10             	add    $0x10,%esp
    20e7:	85 c0                	test   %eax,%eax
    20e9:	78 17                	js     2102 <subdir+0x441>
    printf(1, "create dd succeeded!\n");
    20eb:	83 ec 08             	sub    $0x8,%esp
    20ee:	68 bf 7a 00 00       	push   $0x7abf
    20f3:	6a 01                	push   $0x1
    20f5:	e8 b5 1d 00 00       	call   3eaf <printf>
    20fa:	83 c4 10             	add    $0x10,%esp
    exit();
    20fd:	e8 01 1b 00 00       	call   3c03 <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    2102:	83 ec 08             	sub    $0x8,%esp
    2105:	6a 02                	push   $0x2
    2107:	68 6d 78 00 00       	push   $0x786d
    210c:	e8 32 1b 00 00       	call   3c43 <open>
    2111:	83 c4 10             	add    $0x10,%esp
    2114:	85 c0                	test   %eax,%eax
    2116:	78 17                	js     212f <subdir+0x46e>
    printf(1, "open dd rdwr succeeded!\n");
    2118:	83 ec 08             	sub    $0x8,%esp
    211b:	68 d5 7a 00 00       	push   $0x7ad5
    2120:	6a 01                	push   $0x1
    2122:	e8 88 1d 00 00       	call   3eaf <printf>
    2127:	83 c4 10             	add    $0x10,%esp
    exit();
    212a:	e8 d4 1a 00 00       	call   3c03 <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    212f:	83 ec 08             	sub    $0x8,%esp
    2132:	6a 01                	push   $0x1
    2134:	68 6d 78 00 00       	push   $0x786d
    2139:	e8 05 1b 00 00       	call   3c43 <open>
    213e:	83 c4 10             	add    $0x10,%esp
    2141:	85 c0                	test   %eax,%eax
    2143:	78 17                	js     215c <subdir+0x49b>
    printf(1, "open dd wronly succeeded!\n");
    2145:	83 ec 08             	sub    $0x8,%esp
    2148:	68 ee 7a 00 00       	push   $0x7aee
    214d:	6a 01                	push   $0x1
    214f:	e8 5b 1d 00 00       	call   3eaf <printf>
    2154:	83 c4 10             	add    $0x10,%esp
    exit();
    2157:	e8 a7 1a 00 00       	call   3c03 <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    215c:	83 ec 08             	sub    $0x8,%esp
    215f:	68 09 7b 00 00       	push   $0x7b09
    2164:	68 75 7a 00 00       	push   $0x7a75
    2169:	e8 f5 1a 00 00       	call   3c63 <link>
    216e:	83 c4 10             	add    $0x10,%esp
    2171:	85 c0                	test   %eax,%eax
    2173:	75 17                	jne    218c <subdir+0x4cb>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2175:	83 ec 08             	sub    $0x8,%esp
    2178:	68 14 7b 00 00       	push   $0x7b14
    217d:	6a 01                	push   $0x1
    217f:	e8 2b 1d 00 00       	call   3eaf <printf>
    2184:	83 c4 10             	add    $0x10,%esp
    exit();
    2187:	e8 77 1a 00 00       	call   3c03 <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    218c:	83 ec 08             	sub    $0x8,%esp
    218f:	68 09 7b 00 00       	push   $0x7b09
    2194:	68 9a 7a 00 00       	push   $0x7a9a
    2199:	e8 c5 1a 00 00       	call   3c63 <link>
    219e:	83 c4 10             	add    $0x10,%esp
    21a1:	85 c0                	test   %eax,%eax
    21a3:	75 17                	jne    21bc <subdir+0x4fb>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    21a5:	83 ec 08             	sub    $0x8,%esp
    21a8:	68 38 7b 00 00       	push   $0x7b38
    21ad:	6a 01                	push   $0x1
    21af:	e8 fb 1c 00 00       	call   3eaf <printf>
    21b4:	83 c4 10             	add    $0x10,%esp
    exit();
    21b7:	e8 47 1a 00 00       	call   3c03 <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    21bc:	83 ec 08             	sub    $0x8,%esp
    21bf:	68 50 79 00 00       	push   $0x7950
    21c4:	68 88 78 00 00       	push   $0x7888
    21c9:	e8 95 1a 00 00       	call   3c63 <link>
    21ce:	83 c4 10             	add    $0x10,%esp
    21d1:	85 c0                	test   %eax,%eax
    21d3:	75 17                	jne    21ec <subdir+0x52b>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    21d5:	83 ec 08             	sub    $0x8,%esp
    21d8:	68 5c 7b 00 00       	push   $0x7b5c
    21dd:	6a 01                	push   $0x1
    21df:	e8 cb 1c 00 00       	call   3eaf <printf>
    21e4:	83 c4 10             	add    $0x10,%esp
    exit();
    21e7:	e8 17 1a 00 00       	call   3c03 <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    21ec:	83 ec 0c             	sub    $0xc,%esp
    21ef:	68 75 7a 00 00       	push   $0x7a75
    21f4:	e8 72 1a 00 00       	call   3c6b <mkdir>
    21f9:	83 c4 10             	add    $0x10,%esp
    21fc:	85 c0                	test   %eax,%eax
    21fe:	75 17                	jne    2217 <subdir+0x556>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2200:	83 ec 08             	sub    $0x8,%esp
    2203:	68 7e 7b 00 00       	push   $0x7b7e
    2208:	6a 01                	push   $0x1
    220a:	e8 a0 1c 00 00       	call   3eaf <printf>
    220f:	83 c4 10             	add    $0x10,%esp
    exit();
    2212:	e8 ec 19 00 00       	call   3c03 <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    2217:	83 ec 0c             	sub    $0xc,%esp
    221a:	68 9a 7a 00 00       	push   $0x7a9a
    221f:	e8 47 1a 00 00       	call   3c6b <mkdir>
    2224:	83 c4 10             	add    $0x10,%esp
    2227:	85 c0                	test   %eax,%eax
    2229:	75 17                	jne    2242 <subdir+0x581>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    222b:	83 ec 08             	sub    $0x8,%esp
    222e:	68 99 7b 00 00       	push   $0x7b99
    2233:	6a 01                	push   $0x1
    2235:	e8 75 1c 00 00       	call   3eaf <printf>
    223a:	83 c4 10             	add    $0x10,%esp
    exit();
    223d:	e8 c1 19 00 00       	call   3c03 <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    2242:	83 ec 0c             	sub    $0xc,%esp
    2245:	68 50 79 00 00       	push   $0x7950
    224a:	e8 1c 1a 00 00       	call   3c6b <mkdir>
    224f:	83 c4 10             	add    $0x10,%esp
    2252:	85 c0                	test   %eax,%eax
    2254:	75 17                	jne    226d <subdir+0x5ac>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2256:	83 ec 08             	sub    $0x8,%esp
    2259:	68 b4 7b 00 00       	push   $0x7bb4
    225e:	6a 01                	push   $0x1
    2260:	e8 4a 1c 00 00       	call   3eaf <printf>
    2265:	83 c4 10             	add    $0x10,%esp
    exit();
    2268:	e8 96 19 00 00       	call   3c03 <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    226d:	83 ec 0c             	sub    $0xc,%esp
    2270:	68 9a 7a 00 00       	push   $0x7a9a
    2275:	e8 d9 19 00 00       	call   3c53 <unlink>
    227a:	83 c4 10             	add    $0x10,%esp
    227d:	85 c0                	test   %eax,%eax
    227f:	75 17                	jne    2298 <subdir+0x5d7>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2281:	83 ec 08             	sub    $0x8,%esp
    2284:	68 d1 7b 00 00       	push   $0x7bd1
    2289:	6a 01                	push   $0x1
    228b:	e8 1f 1c 00 00       	call   3eaf <printf>
    2290:	83 c4 10             	add    $0x10,%esp
    exit();
    2293:	e8 6b 19 00 00       	call   3c03 <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    2298:	83 ec 0c             	sub    $0xc,%esp
    229b:	68 75 7a 00 00       	push   $0x7a75
    22a0:	e8 ae 19 00 00       	call   3c53 <unlink>
    22a5:	83 c4 10             	add    $0x10,%esp
    22a8:	85 c0                	test   %eax,%eax
    22aa:	75 17                	jne    22c3 <subdir+0x602>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    22ac:	83 ec 08             	sub    $0x8,%esp
    22af:	68 ed 7b 00 00       	push   $0x7bed
    22b4:	6a 01                	push   $0x1
    22b6:	e8 f4 1b 00 00       	call   3eaf <printf>
    22bb:	83 c4 10             	add    $0x10,%esp
    exit();
    22be:	e8 40 19 00 00       	call   3c03 <exit>
  }
  if(chdir("dd/ff") == 0){
    22c3:	83 ec 0c             	sub    $0xc,%esp
    22c6:	68 88 78 00 00       	push   $0x7888
    22cb:	e8 a3 19 00 00       	call   3c73 <chdir>
    22d0:	83 c4 10             	add    $0x10,%esp
    22d3:	85 c0                	test   %eax,%eax
    22d5:	75 17                	jne    22ee <subdir+0x62d>
    printf(1, "chdir dd/ff succeeded!\n");
    22d7:	83 ec 08             	sub    $0x8,%esp
    22da:	68 09 7c 00 00       	push   $0x7c09
    22df:	6a 01                	push   $0x1
    22e1:	e8 c9 1b 00 00       	call   3eaf <printf>
    22e6:	83 c4 10             	add    $0x10,%esp
    exit();
    22e9:	e8 15 19 00 00       	call   3c03 <exit>
  }
  if(chdir("dd/xx") == 0){
    22ee:	83 ec 0c             	sub    $0xc,%esp
    22f1:	68 21 7c 00 00       	push   $0x7c21
    22f6:	e8 78 19 00 00       	call   3c73 <chdir>
    22fb:	83 c4 10             	add    $0x10,%esp
    22fe:	85 c0                	test   %eax,%eax
    2300:	75 17                	jne    2319 <subdir+0x658>
    printf(1, "chdir dd/xx succeeded!\n");
    2302:	83 ec 08             	sub    $0x8,%esp
    2305:	68 27 7c 00 00       	push   $0x7c27
    230a:	6a 01                	push   $0x1
    230c:	e8 9e 1b 00 00       	call   3eaf <printf>
    2311:	83 c4 10             	add    $0x10,%esp
    exit();
    2314:	e8 ea 18 00 00       	call   3c03 <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    2319:	83 ec 0c             	sub    $0xc,%esp
    231c:	68 50 79 00 00       	push   $0x7950
    2321:	e8 2d 19 00 00       	call   3c53 <unlink>
    2326:	83 c4 10             	add    $0x10,%esp
    2329:	85 c0                	test   %eax,%eax
    232b:	74 17                	je     2344 <subdir+0x683>
    printf(1, "unlink dd/dd/ff failed\n");
    232d:	83 ec 08             	sub    $0x8,%esp
    2330:	68 7d 79 00 00       	push   $0x797d
    2335:	6a 01                	push   $0x1
    2337:	e8 73 1b 00 00       	call   3eaf <printf>
    233c:	83 c4 10             	add    $0x10,%esp
    exit();
    233f:	e8 bf 18 00 00       	call   3c03 <exit>
  }
  if(unlink("dd/ff") != 0){
    2344:	83 ec 0c             	sub    $0xc,%esp
    2347:	68 88 78 00 00       	push   $0x7888
    234c:	e8 02 19 00 00       	call   3c53 <unlink>
    2351:	83 c4 10             	add    $0x10,%esp
    2354:	85 c0                	test   %eax,%eax
    2356:	74 17                	je     236f <subdir+0x6ae>
    printf(1, "unlink dd/ff failed\n");
    2358:	83 ec 08             	sub    $0x8,%esp
    235b:	68 3f 7c 00 00       	push   $0x7c3f
    2360:	6a 01                	push   $0x1
    2362:	e8 48 1b 00 00       	call   3eaf <printf>
    2367:	83 c4 10             	add    $0x10,%esp
    exit();
    236a:	e8 94 18 00 00       	call   3c03 <exit>
  }
  if(unlink("dd") == 0){
    236f:	83 ec 0c             	sub    $0xc,%esp
    2372:	68 6d 78 00 00       	push   $0x786d
    2377:	e8 d7 18 00 00       	call   3c53 <unlink>
    237c:	83 c4 10             	add    $0x10,%esp
    237f:	85 c0                	test   %eax,%eax
    2381:	75 17                	jne    239a <subdir+0x6d9>
    printf(1, "unlink non-empty dd succeeded!\n");
    2383:	83 ec 08             	sub    $0x8,%esp
    2386:	68 54 7c 00 00       	push   $0x7c54
    238b:	6a 01                	push   $0x1
    238d:	e8 1d 1b 00 00       	call   3eaf <printf>
    2392:	83 c4 10             	add    $0x10,%esp
    exit();
    2395:	e8 69 18 00 00       	call   3c03 <exit>
  }
  if(unlink("dd/dd") < 0){
    239a:	83 ec 0c             	sub    $0xc,%esp
    239d:	68 74 7c 00 00       	push   $0x7c74
    23a2:	e8 ac 18 00 00       	call   3c53 <unlink>
    23a7:	83 c4 10             	add    $0x10,%esp
    23aa:	85 c0                	test   %eax,%eax
    23ac:	79 17                	jns    23c5 <subdir+0x704>
    printf(1, "unlink dd/dd failed\n");
    23ae:	83 ec 08             	sub    $0x8,%esp
    23b1:	68 7a 7c 00 00       	push   $0x7c7a
    23b6:	6a 01                	push   $0x1
    23b8:	e8 f2 1a 00 00       	call   3eaf <printf>
    23bd:	83 c4 10             	add    $0x10,%esp
    exit();
    23c0:	e8 3e 18 00 00       	call   3c03 <exit>
  }
  if(unlink("dd") < 0){
    23c5:	83 ec 0c             	sub    $0xc,%esp
    23c8:	68 6d 78 00 00       	push   $0x786d
    23cd:	e8 81 18 00 00       	call   3c53 <unlink>
    23d2:	83 c4 10             	add    $0x10,%esp
    23d5:	85 c0                	test   %eax,%eax
    23d7:	79 17                	jns    23f0 <subdir+0x72f>
    printf(1, "unlink dd failed\n");
    23d9:	83 ec 08             	sub    $0x8,%esp
    23dc:	68 8f 7c 00 00       	push   $0x7c8f
    23e1:	6a 01                	push   $0x1
    23e3:	e8 c7 1a 00 00       	call   3eaf <printf>
    23e8:	83 c4 10             	add    $0x10,%esp
    exit();
    23eb:	e8 13 18 00 00       	call   3c03 <exit>
  }

  printf(1, "subdir ok\n");
    23f0:	83 ec 08             	sub    $0x8,%esp
    23f3:	68 a1 7c 00 00       	push   $0x7ca1
    23f8:	6a 01                	push   $0x1
    23fa:	e8 b0 1a 00 00       	call   3eaf <printf>
    23ff:	83 c4 10             	add    $0x10,%esp
}
    2402:	90                   	nop
    2403:	c9                   	leave  
    2404:	c3                   	ret    

00002405 <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    2405:	55                   	push   %ebp
    2406:	89 e5                	mov    %esp,%ebp
    2408:	83 ec 18             	sub    $0x18,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    240b:	83 ec 08             	sub    $0x8,%esp
    240e:	68 ac 7c 00 00       	push   $0x7cac
    2413:	6a 01                	push   $0x1
    2415:	e8 95 1a 00 00       	call   3eaf <printf>
    241a:	83 c4 10             	add    $0x10,%esp

  unlink("bigwrite");
    241d:	83 ec 0c             	sub    $0xc,%esp
    2420:	68 bb 7c 00 00       	push   $0x7cbb
    2425:	e8 29 18 00 00       	call   3c53 <unlink>
    242a:	83 c4 10             	add    $0x10,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    242d:	c7 45 f4 f3 01 00 00 	movl   $0x1f3,-0xc(%ebp)
    2434:	e9 a8 00 00 00       	jmp    24e1 <bigwrite+0xdc>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2439:	83 ec 08             	sub    $0x8,%esp
    243c:	68 02 02 00 00       	push   $0x202
    2441:	68 bb 7c 00 00       	push   $0x7cbb
    2446:	e8 f8 17 00 00       	call   3c43 <open>
    244b:	83 c4 10             	add    $0x10,%esp
    244e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    2451:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2455:	79 17                	jns    246e <bigwrite+0x69>
      printf(1, "cannot create bigwrite\n");
    2457:	83 ec 08             	sub    $0x8,%esp
    245a:	68 c4 7c 00 00       	push   $0x7cc4
    245f:	6a 01                	push   $0x1
    2461:	e8 49 1a 00 00       	call   3eaf <printf>
    2466:	83 c4 10             	add    $0x10,%esp
      exit();
    2469:	e8 95 17 00 00       	call   3c03 <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    246e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2475:	eb 3f                	jmp    24b6 <bigwrite+0xb1>
      int cc = write(fd, buf, sz);
    2477:	83 ec 04             	sub    $0x4,%esp
    247a:	ff 75 f4             	pushl  -0xc(%ebp)
    247d:	68 c0 bf 00 00       	push   $0xbfc0
    2482:	ff 75 ec             	pushl  -0x14(%ebp)
    2485:	e8 99 17 00 00       	call   3c23 <write>
    248a:	83 c4 10             	add    $0x10,%esp
    248d:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(cc != sz){
    2490:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2493:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2496:	74 1a                	je     24b2 <bigwrite+0xad>
        printf(1, "write(%d) ret %d\n", sz, cc);
    2498:	ff 75 e8             	pushl  -0x18(%ebp)
    249b:	ff 75 f4             	pushl  -0xc(%ebp)
    249e:	68 dc 7c 00 00       	push   $0x7cdc
    24a3:	6a 01                	push   $0x1
    24a5:	e8 05 1a 00 00       	call   3eaf <printf>
    24aa:	83 c4 10             	add    $0x10,%esp
        exit();
    24ad:	e8 51 17 00 00       	call   3c03 <exit>
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
    24b2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    24b6:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    24ba:	7e bb                	jle    2477 <bigwrite+0x72>
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    24bc:	83 ec 0c             	sub    $0xc,%esp
    24bf:	ff 75 ec             	pushl  -0x14(%ebp)
    24c2:	e8 64 17 00 00       	call   3c2b <close>
    24c7:	83 c4 10             	add    $0x10,%esp
    unlink("bigwrite");
    24ca:	83 ec 0c             	sub    $0xc,%esp
    24cd:	68 bb 7c 00 00       	push   $0x7cbb
    24d2:	e8 7c 17 00 00       	call   3c53 <unlink>
    24d7:	83 c4 10             	add    $0x10,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    24da:	81 45 f4 d7 01 00 00 	addl   $0x1d7,-0xc(%ebp)
    24e1:	81 7d f4 ff 17 00 00 	cmpl   $0x17ff,-0xc(%ebp)
    24e8:	0f 8e 4b ff ff ff    	jle    2439 <bigwrite+0x34>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    24ee:	83 ec 08             	sub    $0x8,%esp
    24f1:	68 ee 7c 00 00       	push   $0x7cee
    24f6:	6a 01                	push   $0x1
    24f8:	e8 b2 19 00 00       	call   3eaf <printf>
    24fd:	83 c4 10             	add    $0x10,%esp
}
    2500:	90                   	nop
    2501:	c9                   	leave  
    2502:	c3                   	ret    

00002503 <bigfile>:

void
bigfile(void)
{
    2503:	55                   	push   %ebp
    2504:	89 e5                	mov    %esp,%ebp
    2506:	83 ec 18             	sub    $0x18,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2509:	83 ec 08             	sub    $0x8,%esp
    250c:	68 fb 7c 00 00       	push   $0x7cfb
    2511:	6a 01                	push   $0x1
    2513:	e8 97 19 00 00       	call   3eaf <printf>
    2518:	83 c4 10             	add    $0x10,%esp

  unlink("bigfile");
    251b:	83 ec 0c             	sub    $0xc,%esp
    251e:	68 09 7d 00 00       	push   $0x7d09
    2523:	e8 2b 17 00 00       	call   3c53 <unlink>
    2528:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", O_CREATE | O_RDWR);
    252b:	83 ec 08             	sub    $0x8,%esp
    252e:	68 02 02 00 00       	push   $0x202
    2533:	68 09 7d 00 00       	push   $0x7d09
    2538:	e8 06 17 00 00       	call   3c43 <open>
    253d:	83 c4 10             	add    $0x10,%esp
    2540:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    2543:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2547:	79 17                	jns    2560 <bigfile+0x5d>
    printf(1, "cannot create bigfile");
    2549:	83 ec 08             	sub    $0x8,%esp
    254c:	68 11 7d 00 00       	push   $0x7d11
    2551:	6a 01                	push   $0x1
    2553:	e8 57 19 00 00       	call   3eaf <printf>
    2558:	83 c4 10             	add    $0x10,%esp
    exit();
    255b:	e8 a3 16 00 00       	call   3c03 <exit>
  }
  for(i = 0; i < 20; i++){
    2560:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2567:	eb 52                	jmp    25bb <bigfile+0xb8>
    memset(buf, i, 600);
    2569:	83 ec 04             	sub    $0x4,%esp
    256c:	68 58 02 00 00       	push   $0x258
    2571:	ff 75 f4             	pushl  -0xc(%ebp)
    2574:	68 c0 bf 00 00       	push   $0xbfc0
    2579:	e8 ea 14 00 00       	call   3a68 <memset>
    257e:	83 c4 10             	add    $0x10,%esp
    if(write(fd, buf, 600) != 600){
    2581:	83 ec 04             	sub    $0x4,%esp
    2584:	68 58 02 00 00       	push   $0x258
    2589:	68 c0 bf 00 00       	push   $0xbfc0
    258e:	ff 75 ec             	pushl  -0x14(%ebp)
    2591:	e8 8d 16 00 00       	call   3c23 <write>
    2596:	83 c4 10             	add    $0x10,%esp
    2599:	3d 58 02 00 00       	cmp    $0x258,%eax
    259e:	74 17                	je     25b7 <bigfile+0xb4>
      printf(1, "write bigfile failed\n");
    25a0:	83 ec 08             	sub    $0x8,%esp
    25a3:	68 27 7d 00 00       	push   $0x7d27
    25a8:	6a 01                	push   $0x1
    25aa:	e8 00 19 00 00       	call   3eaf <printf>
    25af:	83 c4 10             	add    $0x10,%esp
      exit();
    25b2:	e8 4c 16 00 00       	call   3c03 <exit>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    25b7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    25bb:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    25bf:	7e a8                	jle    2569 <bigfile+0x66>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    25c1:	83 ec 0c             	sub    $0xc,%esp
    25c4:	ff 75 ec             	pushl  -0x14(%ebp)
    25c7:	e8 5f 16 00 00       	call   3c2b <close>
    25cc:	83 c4 10             	add    $0x10,%esp

  fd = open("bigfile", 0);
    25cf:	83 ec 08             	sub    $0x8,%esp
    25d2:	6a 00                	push   $0x0
    25d4:	68 09 7d 00 00       	push   $0x7d09
    25d9:	e8 65 16 00 00       	call   3c43 <open>
    25de:	83 c4 10             	add    $0x10,%esp
    25e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    25e4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    25e8:	79 17                	jns    2601 <bigfile+0xfe>
    printf(1, "cannot open bigfile\n");
    25ea:	83 ec 08             	sub    $0x8,%esp
    25ed:	68 3d 7d 00 00       	push   $0x7d3d
    25f2:	6a 01                	push   $0x1
    25f4:	e8 b6 18 00 00       	call   3eaf <printf>
    25f9:	83 c4 10             	add    $0x10,%esp
    exit();
    25fc:	e8 02 16 00 00       	call   3c03 <exit>
  }
  total = 0;
    2601:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(i = 0; ; i++){
    2608:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cc = read(fd, buf, 300);
    260f:	83 ec 04             	sub    $0x4,%esp
    2612:	68 2c 01 00 00       	push   $0x12c
    2617:	68 c0 bf 00 00       	push   $0xbfc0
    261c:	ff 75 ec             	pushl  -0x14(%ebp)
    261f:	e8 f7 15 00 00       	call   3c1b <read>
    2624:	83 c4 10             	add    $0x10,%esp
    2627:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(cc < 0){
    262a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    262e:	79 17                	jns    2647 <bigfile+0x144>
      printf(1, "read bigfile failed\n");
    2630:	83 ec 08             	sub    $0x8,%esp
    2633:	68 52 7d 00 00       	push   $0x7d52
    2638:	6a 01                	push   $0x1
    263a:	e8 70 18 00 00       	call   3eaf <printf>
    263f:	83 c4 10             	add    $0x10,%esp
      exit();
    2642:	e8 bc 15 00 00       	call   3c03 <exit>
    }
    if(cc == 0)
    2647:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    264b:	74 7a                	je     26c7 <bigfile+0x1c4>
      break;
    if(cc != 300){
    264d:	81 7d e8 2c 01 00 00 	cmpl   $0x12c,-0x18(%ebp)
    2654:	74 17                	je     266d <bigfile+0x16a>
      printf(1, "short read bigfile\n");
    2656:	83 ec 08             	sub    $0x8,%esp
    2659:	68 67 7d 00 00       	push   $0x7d67
    265e:	6a 01                	push   $0x1
    2660:	e8 4a 18 00 00       	call   3eaf <printf>
    2665:	83 c4 10             	add    $0x10,%esp
      exit();
    2668:	e8 96 15 00 00       	call   3c03 <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    266d:	0f b6 05 c0 bf 00 00 	movzbl 0xbfc0,%eax
    2674:	0f be d0             	movsbl %al,%edx
    2677:	8b 45 f4             	mov    -0xc(%ebp),%eax
    267a:	89 c1                	mov    %eax,%ecx
    267c:	c1 e9 1f             	shr    $0x1f,%ecx
    267f:	01 c8                	add    %ecx,%eax
    2681:	d1 f8                	sar    %eax
    2683:	39 c2                	cmp    %eax,%edx
    2685:	75 1a                	jne    26a1 <bigfile+0x19e>
    2687:	0f b6 05 eb c0 00 00 	movzbl 0xc0eb,%eax
    268e:	0f be d0             	movsbl %al,%edx
    2691:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2694:	89 c1                	mov    %eax,%ecx
    2696:	c1 e9 1f             	shr    $0x1f,%ecx
    2699:	01 c8                	add    %ecx,%eax
    269b:	d1 f8                	sar    %eax
    269d:	39 c2                	cmp    %eax,%edx
    269f:	74 17                	je     26b8 <bigfile+0x1b5>
      printf(1, "read bigfile wrong data\n");
    26a1:	83 ec 08             	sub    $0x8,%esp
    26a4:	68 7b 7d 00 00       	push   $0x7d7b
    26a9:	6a 01                	push   $0x1
    26ab:	e8 ff 17 00 00       	call   3eaf <printf>
    26b0:	83 c4 10             	add    $0x10,%esp
      exit();
    26b3:	e8 4b 15 00 00       	call   3c03 <exit>
    }
    total += cc;
    26b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    26bb:	01 45 f0             	add    %eax,-0x10(%ebp)
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    26be:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
    26c2:	e9 48 ff ff ff       	jmp    260f <bigfile+0x10c>
    if(cc < 0){
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    26c7:	90                   	nop
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    26c8:	83 ec 0c             	sub    $0xc,%esp
    26cb:	ff 75 ec             	pushl  -0x14(%ebp)
    26ce:	e8 58 15 00 00       	call   3c2b <close>
    26d3:	83 c4 10             	add    $0x10,%esp
  if(total != 20*600){
    26d6:	81 7d f0 e0 2e 00 00 	cmpl   $0x2ee0,-0x10(%ebp)
    26dd:	74 17                	je     26f6 <bigfile+0x1f3>
    printf(1, "read bigfile wrong total\n");
    26df:	83 ec 08             	sub    $0x8,%esp
    26e2:	68 94 7d 00 00       	push   $0x7d94
    26e7:	6a 01                	push   $0x1
    26e9:	e8 c1 17 00 00       	call   3eaf <printf>
    26ee:	83 c4 10             	add    $0x10,%esp
    exit();
    26f1:	e8 0d 15 00 00       	call   3c03 <exit>
  }
  unlink("bigfile");
    26f6:	83 ec 0c             	sub    $0xc,%esp
    26f9:	68 09 7d 00 00       	push   $0x7d09
    26fe:	e8 50 15 00 00       	call   3c53 <unlink>
    2703:	83 c4 10             	add    $0x10,%esp

  printf(1, "bigfile test ok\n");
    2706:	83 ec 08             	sub    $0x8,%esp
    2709:	68 ae 7d 00 00       	push   $0x7dae
    270e:	6a 01                	push   $0x1
    2710:	e8 9a 17 00 00       	call   3eaf <printf>
    2715:	83 c4 10             	add    $0x10,%esp
}
    2718:	90                   	nop
    2719:	c9                   	leave  
    271a:	c3                   	ret    

0000271b <fourteen>:

void
fourteen(void)
{
    271b:	55                   	push   %ebp
    271c:	89 e5                	mov    %esp,%ebp
    271e:	83 ec 18             	sub    $0x18,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2721:	83 ec 08             	sub    $0x8,%esp
    2724:	68 bf 7d 00 00       	push   $0x7dbf
    2729:	6a 01                	push   $0x1
    272b:	e8 7f 17 00 00       	call   3eaf <printf>
    2730:	83 c4 10             	add    $0x10,%esp

  if(mkdir("12345678901234") != 0){
    2733:	83 ec 0c             	sub    $0xc,%esp
    2736:	68 ce 7d 00 00       	push   $0x7dce
    273b:	e8 2b 15 00 00       	call   3c6b <mkdir>
    2740:	83 c4 10             	add    $0x10,%esp
    2743:	85 c0                	test   %eax,%eax
    2745:	74 17                	je     275e <fourteen+0x43>
    printf(1, "mkdir 12345678901234 failed\n");
    2747:	83 ec 08             	sub    $0x8,%esp
    274a:	68 dd 7d 00 00       	push   $0x7ddd
    274f:	6a 01                	push   $0x1
    2751:	e8 59 17 00 00       	call   3eaf <printf>
    2756:	83 c4 10             	add    $0x10,%esp
    exit();
    2759:	e8 a5 14 00 00       	call   3c03 <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    275e:	83 ec 0c             	sub    $0xc,%esp
    2761:	68 fc 7d 00 00       	push   $0x7dfc
    2766:	e8 00 15 00 00       	call   3c6b <mkdir>
    276b:	83 c4 10             	add    $0x10,%esp
    276e:	85 c0                	test   %eax,%eax
    2770:	74 17                	je     2789 <fourteen+0x6e>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2772:	83 ec 08             	sub    $0x8,%esp
    2775:	68 1c 7e 00 00       	push   $0x7e1c
    277a:	6a 01                	push   $0x1
    277c:	e8 2e 17 00 00       	call   3eaf <printf>
    2781:	83 c4 10             	add    $0x10,%esp
    exit();
    2784:	e8 7a 14 00 00       	call   3c03 <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2789:	83 ec 08             	sub    $0x8,%esp
    278c:	68 00 02 00 00       	push   $0x200
    2791:	68 4c 7e 00 00       	push   $0x7e4c
    2796:	e8 a8 14 00 00       	call   3c43 <open>
    279b:	83 c4 10             	add    $0x10,%esp
    279e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    27a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    27a5:	79 17                	jns    27be <fourteen+0xa3>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    27a7:	83 ec 08             	sub    $0x8,%esp
    27aa:	68 7c 7e 00 00       	push   $0x7e7c
    27af:	6a 01                	push   $0x1
    27b1:	e8 f9 16 00 00       	call   3eaf <printf>
    27b6:	83 c4 10             	add    $0x10,%esp
    exit();
    27b9:	e8 45 14 00 00       	call   3c03 <exit>
  }
  close(fd);
    27be:	83 ec 0c             	sub    $0xc,%esp
    27c1:	ff 75 f4             	pushl  -0xc(%ebp)
    27c4:	e8 62 14 00 00       	call   3c2b <close>
    27c9:	83 c4 10             	add    $0x10,%esp
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    27cc:	83 ec 08             	sub    $0x8,%esp
    27cf:	6a 00                	push   $0x0
    27d1:	68 bc 7e 00 00       	push   $0x7ebc
    27d6:	e8 68 14 00 00       	call   3c43 <open>
    27db:	83 c4 10             	add    $0x10,%esp
    27de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    27e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    27e5:	79 17                	jns    27fe <fourteen+0xe3>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    27e7:	83 ec 08             	sub    $0x8,%esp
    27ea:	68 ec 7e 00 00       	push   $0x7eec
    27ef:	6a 01                	push   $0x1
    27f1:	e8 b9 16 00 00       	call   3eaf <printf>
    27f6:	83 c4 10             	add    $0x10,%esp
    exit();
    27f9:	e8 05 14 00 00       	call   3c03 <exit>
  }
  close(fd);
    27fe:	83 ec 0c             	sub    $0xc,%esp
    2801:	ff 75 f4             	pushl  -0xc(%ebp)
    2804:	e8 22 14 00 00       	call   3c2b <close>
    2809:	83 c4 10             	add    $0x10,%esp

  if(mkdir("12345678901234/12345678901234") == 0){
    280c:	83 ec 0c             	sub    $0xc,%esp
    280f:	68 26 7f 00 00       	push   $0x7f26
    2814:	e8 52 14 00 00       	call   3c6b <mkdir>
    2819:	83 c4 10             	add    $0x10,%esp
    281c:	85 c0                	test   %eax,%eax
    281e:	75 17                	jne    2837 <fourteen+0x11c>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2820:	83 ec 08             	sub    $0x8,%esp
    2823:	68 44 7f 00 00       	push   $0x7f44
    2828:	6a 01                	push   $0x1
    282a:	e8 80 16 00 00       	call   3eaf <printf>
    282f:	83 c4 10             	add    $0x10,%esp
    exit();
    2832:	e8 cc 13 00 00       	call   3c03 <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2837:	83 ec 0c             	sub    $0xc,%esp
    283a:	68 74 7f 00 00       	push   $0x7f74
    283f:	e8 27 14 00 00       	call   3c6b <mkdir>
    2844:	83 c4 10             	add    $0x10,%esp
    2847:	85 c0                	test   %eax,%eax
    2849:	75 17                	jne    2862 <fourteen+0x147>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    284b:	83 ec 08             	sub    $0x8,%esp
    284e:	68 94 7f 00 00       	push   $0x7f94
    2853:	6a 01                	push   $0x1
    2855:	e8 55 16 00 00       	call   3eaf <printf>
    285a:	83 c4 10             	add    $0x10,%esp
    exit();
    285d:	e8 a1 13 00 00       	call   3c03 <exit>
  }

  printf(1, "fourteen ok\n");
    2862:	83 ec 08             	sub    $0x8,%esp
    2865:	68 c5 7f 00 00       	push   $0x7fc5
    286a:	6a 01                	push   $0x1
    286c:	e8 3e 16 00 00       	call   3eaf <printf>
    2871:	83 c4 10             	add    $0x10,%esp
}
    2874:	90                   	nop
    2875:	c9                   	leave  
    2876:	c3                   	ret    

00002877 <rmdot>:

void
rmdot(void)
{
    2877:	55                   	push   %ebp
    2878:	89 e5                	mov    %esp,%ebp
    287a:	83 ec 08             	sub    $0x8,%esp
  printf(1, "rmdot test\n");
    287d:	83 ec 08             	sub    $0x8,%esp
    2880:	68 d2 7f 00 00       	push   $0x7fd2
    2885:	6a 01                	push   $0x1
    2887:	e8 23 16 00 00       	call   3eaf <printf>
    288c:	83 c4 10             	add    $0x10,%esp
  if(mkdir("dots") != 0){
    288f:	83 ec 0c             	sub    $0xc,%esp
    2892:	68 de 7f 00 00       	push   $0x7fde
    2897:	e8 cf 13 00 00       	call   3c6b <mkdir>
    289c:	83 c4 10             	add    $0x10,%esp
    289f:	85 c0                	test   %eax,%eax
    28a1:	74 17                	je     28ba <rmdot+0x43>
    printf(1, "mkdir dots failed\n");
    28a3:	83 ec 08             	sub    $0x8,%esp
    28a6:	68 e3 7f 00 00       	push   $0x7fe3
    28ab:	6a 01                	push   $0x1
    28ad:	e8 fd 15 00 00       	call   3eaf <printf>
    28b2:	83 c4 10             	add    $0x10,%esp
    exit();
    28b5:	e8 49 13 00 00       	call   3c03 <exit>
  }
  if(chdir("dots") != 0){
    28ba:	83 ec 0c             	sub    $0xc,%esp
    28bd:	68 de 7f 00 00       	push   $0x7fde
    28c2:	e8 ac 13 00 00       	call   3c73 <chdir>
    28c7:	83 c4 10             	add    $0x10,%esp
    28ca:	85 c0                	test   %eax,%eax
    28cc:	74 17                	je     28e5 <rmdot+0x6e>
    printf(1, "chdir dots failed\n");
    28ce:	83 ec 08             	sub    $0x8,%esp
    28d1:	68 f6 7f 00 00       	push   $0x7ff6
    28d6:	6a 01                	push   $0x1
    28d8:	e8 d2 15 00 00       	call   3eaf <printf>
    28dd:	83 c4 10             	add    $0x10,%esp
    exit();
    28e0:	e8 1e 13 00 00       	call   3c03 <exit>
  }
  if(unlink(".") == 0){
    28e5:	83 ec 0c             	sub    $0xc,%esp
    28e8:	68 0f 77 00 00       	push   $0x770f
    28ed:	e8 61 13 00 00       	call   3c53 <unlink>
    28f2:	83 c4 10             	add    $0x10,%esp
    28f5:	85 c0                	test   %eax,%eax
    28f7:	75 17                	jne    2910 <rmdot+0x99>
    printf(1, "rm . worked!\n");
    28f9:	83 ec 08             	sub    $0x8,%esp
    28fc:	68 09 80 00 00       	push   $0x8009
    2901:	6a 01                	push   $0x1
    2903:	e8 a7 15 00 00       	call   3eaf <printf>
    2908:	83 c4 10             	add    $0x10,%esp
    exit();
    290b:	e8 f3 12 00 00       	call   3c03 <exit>
  }
  if(unlink("..") == 0){
    2910:	83 ec 0c             	sub    $0xc,%esp
    2913:	68 9c 72 00 00       	push   $0x729c
    2918:	e8 36 13 00 00       	call   3c53 <unlink>
    291d:	83 c4 10             	add    $0x10,%esp
    2920:	85 c0                	test   %eax,%eax
    2922:	75 17                	jne    293b <rmdot+0xc4>
    printf(1, "rm .. worked!\n");
    2924:	83 ec 08             	sub    $0x8,%esp
    2927:	68 17 80 00 00       	push   $0x8017
    292c:	6a 01                	push   $0x1
    292e:	e8 7c 15 00 00       	call   3eaf <printf>
    2933:	83 c4 10             	add    $0x10,%esp
    exit();
    2936:	e8 c8 12 00 00       	call   3c03 <exit>
  }
  if(chdir("/") != 0){
    293b:	83 ec 0c             	sub    $0xc,%esp
    293e:	68 26 80 00 00       	push   $0x8026
    2943:	e8 2b 13 00 00       	call   3c73 <chdir>
    2948:	83 c4 10             	add    $0x10,%esp
    294b:	85 c0                	test   %eax,%eax
    294d:	74 17                	je     2966 <rmdot+0xef>
    printf(1, "chdir / failed\n");
    294f:	83 ec 08             	sub    $0x8,%esp
    2952:	68 28 80 00 00       	push   $0x8028
    2957:	6a 01                	push   $0x1
    2959:	e8 51 15 00 00       	call   3eaf <printf>
    295e:	83 c4 10             	add    $0x10,%esp
    exit();
    2961:	e8 9d 12 00 00       	call   3c03 <exit>
  }
  if(unlink("dots/.") == 0){
    2966:	83 ec 0c             	sub    $0xc,%esp
    2969:	68 38 80 00 00       	push   $0x8038
    296e:	e8 e0 12 00 00       	call   3c53 <unlink>
    2973:	83 c4 10             	add    $0x10,%esp
    2976:	85 c0                	test   %eax,%eax
    2978:	75 17                	jne    2991 <rmdot+0x11a>
    printf(1, "unlink dots/. worked!\n");
    297a:	83 ec 08             	sub    $0x8,%esp
    297d:	68 3f 80 00 00       	push   $0x803f
    2982:	6a 01                	push   $0x1
    2984:	e8 26 15 00 00       	call   3eaf <printf>
    2989:	83 c4 10             	add    $0x10,%esp
    exit();
    298c:	e8 72 12 00 00       	call   3c03 <exit>
  }
  if(unlink("dots/..") == 0){
    2991:	83 ec 0c             	sub    $0xc,%esp
    2994:	68 56 80 00 00       	push   $0x8056
    2999:	e8 b5 12 00 00       	call   3c53 <unlink>
    299e:	83 c4 10             	add    $0x10,%esp
    29a1:	85 c0                	test   %eax,%eax
    29a3:	75 17                	jne    29bc <rmdot+0x145>
    printf(1, "unlink dots/.. worked!\n");
    29a5:	83 ec 08             	sub    $0x8,%esp
    29a8:	68 5e 80 00 00       	push   $0x805e
    29ad:	6a 01                	push   $0x1
    29af:	e8 fb 14 00 00       	call   3eaf <printf>
    29b4:	83 c4 10             	add    $0x10,%esp
    exit();
    29b7:	e8 47 12 00 00       	call   3c03 <exit>
  }
  if(unlink("dots") != 0){
    29bc:	83 ec 0c             	sub    $0xc,%esp
    29bf:	68 de 7f 00 00       	push   $0x7fde
    29c4:	e8 8a 12 00 00       	call   3c53 <unlink>
    29c9:	83 c4 10             	add    $0x10,%esp
    29cc:	85 c0                	test   %eax,%eax
    29ce:	74 17                	je     29e7 <rmdot+0x170>
    printf(1, "unlink dots failed!\n");
    29d0:	83 ec 08             	sub    $0x8,%esp
    29d3:	68 76 80 00 00       	push   $0x8076
    29d8:	6a 01                	push   $0x1
    29da:	e8 d0 14 00 00       	call   3eaf <printf>
    29df:	83 c4 10             	add    $0x10,%esp
    exit();
    29e2:	e8 1c 12 00 00       	call   3c03 <exit>
  }
  printf(1, "rmdot ok\n");
    29e7:	83 ec 08             	sub    $0x8,%esp
    29ea:	68 8b 80 00 00       	push   $0x808b
    29ef:	6a 01                	push   $0x1
    29f1:	e8 b9 14 00 00       	call   3eaf <printf>
    29f6:	83 c4 10             	add    $0x10,%esp
}
    29f9:	90                   	nop
    29fa:	c9                   	leave  
    29fb:	c3                   	ret    

000029fc <dirfile>:

void
dirfile(void)
{
    29fc:	55                   	push   %ebp
    29fd:	89 e5                	mov    %esp,%ebp
    29ff:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(1, "dir vs file\n");
    2a02:	83 ec 08             	sub    $0x8,%esp
    2a05:	68 95 80 00 00       	push   $0x8095
    2a0a:	6a 01                	push   $0x1
    2a0c:	e8 9e 14 00 00       	call   3eaf <printf>
    2a11:	83 c4 10             	add    $0x10,%esp

  fd = open("dirfile", O_CREATE);
    2a14:	83 ec 08             	sub    $0x8,%esp
    2a17:	68 00 02 00 00       	push   $0x200
    2a1c:	68 a2 80 00 00       	push   $0x80a2
    2a21:	e8 1d 12 00 00       	call   3c43 <open>
    2a26:	83 c4 10             	add    $0x10,%esp
    2a29:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2a2c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2a30:	79 17                	jns    2a49 <dirfile+0x4d>
    printf(1, "create dirfile failed\n");
    2a32:	83 ec 08             	sub    $0x8,%esp
    2a35:	68 aa 80 00 00       	push   $0x80aa
    2a3a:	6a 01                	push   $0x1
    2a3c:	e8 6e 14 00 00       	call   3eaf <printf>
    2a41:	83 c4 10             	add    $0x10,%esp
    exit();
    2a44:	e8 ba 11 00 00       	call   3c03 <exit>
  }
  close(fd);
    2a49:	83 ec 0c             	sub    $0xc,%esp
    2a4c:	ff 75 f4             	pushl  -0xc(%ebp)
    2a4f:	e8 d7 11 00 00       	call   3c2b <close>
    2a54:	83 c4 10             	add    $0x10,%esp
  if(chdir("dirfile") == 0){
    2a57:	83 ec 0c             	sub    $0xc,%esp
    2a5a:	68 a2 80 00 00       	push   $0x80a2
    2a5f:	e8 0f 12 00 00       	call   3c73 <chdir>
    2a64:	83 c4 10             	add    $0x10,%esp
    2a67:	85 c0                	test   %eax,%eax
    2a69:	75 17                	jne    2a82 <dirfile+0x86>
    printf(1, "chdir dirfile succeeded!\n");
    2a6b:	83 ec 08             	sub    $0x8,%esp
    2a6e:	68 c1 80 00 00       	push   $0x80c1
    2a73:	6a 01                	push   $0x1
    2a75:	e8 35 14 00 00       	call   3eaf <printf>
    2a7a:	83 c4 10             	add    $0x10,%esp
    exit();
    2a7d:	e8 81 11 00 00       	call   3c03 <exit>
  }
  fd = open("dirfile/xx", 0);
    2a82:	83 ec 08             	sub    $0x8,%esp
    2a85:	6a 00                	push   $0x0
    2a87:	68 db 80 00 00       	push   $0x80db
    2a8c:	e8 b2 11 00 00       	call   3c43 <open>
    2a91:	83 c4 10             	add    $0x10,%esp
    2a94:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2a97:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2a9b:	78 17                	js     2ab4 <dirfile+0xb8>
    printf(1, "create dirfile/xx succeeded!\n");
    2a9d:	83 ec 08             	sub    $0x8,%esp
    2aa0:	68 e6 80 00 00       	push   $0x80e6
    2aa5:	6a 01                	push   $0x1
    2aa7:	e8 03 14 00 00       	call   3eaf <printf>
    2aac:	83 c4 10             	add    $0x10,%esp
    exit();
    2aaf:	e8 4f 11 00 00       	call   3c03 <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    2ab4:	83 ec 08             	sub    $0x8,%esp
    2ab7:	68 00 02 00 00       	push   $0x200
    2abc:	68 db 80 00 00       	push   $0x80db
    2ac1:	e8 7d 11 00 00       	call   3c43 <open>
    2ac6:	83 c4 10             	add    $0x10,%esp
    2ac9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2acc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2ad0:	78 17                	js     2ae9 <dirfile+0xed>
    printf(1, "create dirfile/xx succeeded!\n");
    2ad2:	83 ec 08             	sub    $0x8,%esp
    2ad5:	68 e6 80 00 00       	push   $0x80e6
    2ada:	6a 01                	push   $0x1
    2adc:	e8 ce 13 00 00       	call   3eaf <printf>
    2ae1:	83 c4 10             	add    $0x10,%esp
    exit();
    2ae4:	e8 1a 11 00 00       	call   3c03 <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    2ae9:	83 ec 0c             	sub    $0xc,%esp
    2aec:	68 db 80 00 00       	push   $0x80db
    2af1:	e8 75 11 00 00       	call   3c6b <mkdir>
    2af6:	83 c4 10             	add    $0x10,%esp
    2af9:	85 c0                	test   %eax,%eax
    2afb:	75 17                	jne    2b14 <dirfile+0x118>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2afd:	83 ec 08             	sub    $0x8,%esp
    2b00:	68 04 81 00 00       	push   $0x8104
    2b05:	6a 01                	push   $0x1
    2b07:	e8 a3 13 00 00       	call   3eaf <printf>
    2b0c:	83 c4 10             	add    $0x10,%esp
    exit();
    2b0f:	e8 ef 10 00 00       	call   3c03 <exit>
  }
  if(unlink("dirfile/xx") == 0){
    2b14:	83 ec 0c             	sub    $0xc,%esp
    2b17:	68 db 80 00 00       	push   $0x80db
    2b1c:	e8 32 11 00 00       	call   3c53 <unlink>
    2b21:	83 c4 10             	add    $0x10,%esp
    2b24:	85 c0                	test   %eax,%eax
    2b26:	75 17                	jne    2b3f <dirfile+0x143>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b28:	83 ec 08             	sub    $0x8,%esp
    2b2b:	68 21 81 00 00       	push   $0x8121
    2b30:	6a 01                	push   $0x1
    2b32:	e8 78 13 00 00       	call   3eaf <printf>
    2b37:	83 c4 10             	add    $0x10,%esp
    exit();
    2b3a:	e8 c4 10 00 00       	call   3c03 <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    2b3f:	83 ec 08             	sub    $0x8,%esp
    2b42:	68 db 80 00 00       	push   $0x80db
    2b47:	68 3f 81 00 00       	push   $0x813f
    2b4c:	e8 12 11 00 00       	call   3c63 <link>
    2b51:	83 c4 10             	add    $0x10,%esp
    2b54:	85 c0                	test   %eax,%eax
    2b56:	75 17                	jne    2b6f <dirfile+0x173>
    printf(1, "link to dirfile/xx succeeded!\n");
    2b58:	83 ec 08             	sub    $0x8,%esp
    2b5b:	68 48 81 00 00       	push   $0x8148
    2b60:	6a 01                	push   $0x1
    2b62:	e8 48 13 00 00       	call   3eaf <printf>
    2b67:	83 c4 10             	add    $0x10,%esp
    exit();
    2b6a:	e8 94 10 00 00       	call   3c03 <exit>
  }
  if(unlink("dirfile") != 0){
    2b6f:	83 ec 0c             	sub    $0xc,%esp
    2b72:	68 a2 80 00 00       	push   $0x80a2
    2b77:	e8 d7 10 00 00       	call   3c53 <unlink>
    2b7c:	83 c4 10             	add    $0x10,%esp
    2b7f:	85 c0                	test   %eax,%eax
    2b81:	74 17                	je     2b9a <dirfile+0x19e>
    printf(1, "unlink dirfile failed!\n");
    2b83:	83 ec 08             	sub    $0x8,%esp
    2b86:	68 67 81 00 00       	push   $0x8167
    2b8b:	6a 01                	push   $0x1
    2b8d:	e8 1d 13 00 00       	call   3eaf <printf>
    2b92:	83 c4 10             	add    $0x10,%esp
    exit();
    2b95:	e8 69 10 00 00       	call   3c03 <exit>
  }

  fd = open(".", O_RDWR);
    2b9a:	83 ec 08             	sub    $0x8,%esp
    2b9d:	6a 02                	push   $0x2
    2b9f:	68 0f 77 00 00       	push   $0x770f
    2ba4:	e8 9a 10 00 00       	call   3c43 <open>
    2ba9:	83 c4 10             	add    $0x10,%esp
    2bac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2baf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2bb3:	78 17                	js     2bcc <dirfile+0x1d0>
    printf(1, "open . for writing succeeded!\n");
    2bb5:	83 ec 08             	sub    $0x8,%esp
    2bb8:	68 80 81 00 00       	push   $0x8180
    2bbd:	6a 01                	push   $0x1
    2bbf:	e8 eb 12 00 00       	call   3eaf <printf>
    2bc4:	83 c4 10             	add    $0x10,%esp
    exit();
    2bc7:	e8 37 10 00 00       	call   3c03 <exit>
  }
  fd = open(".", 0);
    2bcc:	83 ec 08             	sub    $0x8,%esp
    2bcf:	6a 00                	push   $0x0
    2bd1:	68 0f 77 00 00       	push   $0x770f
    2bd6:	e8 68 10 00 00       	call   3c43 <open>
    2bdb:	83 c4 10             	add    $0x10,%esp
    2bde:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(write(fd, "x", 1) > 0){
    2be1:	83 ec 04             	sub    $0x4,%esp
    2be4:	6a 01                	push   $0x1
    2be6:	68 46 73 00 00       	push   $0x7346
    2beb:	ff 75 f4             	pushl  -0xc(%ebp)
    2bee:	e8 30 10 00 00       	call   3c23 <write>
    2bf3:	83 c4 10             	add    $0x10,%esp
    2bf6:	85 c0                	test   %eax,%eax
    2bf8:	7e 17                	jle    2c11 <dirfile+0x215>
    printf(1, "write . succeeded!\n");
    2bfa:	83 ec 08             	sub    $0x8,%esp
    2bfd:	68 9f 81 00 00       	push   $0x819f
    2c02:	6a 01                	push   $0x1
    2c04:	e8 a6 12 00 00       	call   3eaf <printf>
    2c09:	83 c4 10             	add    $0x10,%esp
    exit();
    2c0c:	e8 f2 0f 00 00       	call   3c03 <exit>
  }
  close(fd);
    2c11:	83 ec 0c             	sub    $0xc,%esp
    2c14:	ff 75 f4             	pushl  -0xc(%ebp)
    2c17:	e8 0f 10 00 00       	call   3c2b <close>
    2c1c:	83 c4 10             	add    $0x10,%esp

  printf(1, "dir vs file OK\n");
    2c1f:	83 ec 08             	sub    $0x8,%esp
    2c22:	68 b3 81 00 00       	push   $0x81b3
    2c27:	6a 01                	push   $0x1
    2c29:	e8 81 12 00 00       	call   3eaf <printf>
    2c2e:	83 c4 10             	add    $0x10,%esp
}
    2c31:	90                   	nop
    2c32:	c9                   	leave  
    2c33:	c3                   	ret    

00002c34 <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2c34:	55                   	push   %ebp
    2c35:	89 e5                	mov    %esp,%ebp
    2c37:	83 ec 18             	sub    $0x18,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2c3a:	83 ec 08             	sub    $0x8,%esp
    2c3d:	68 c3 81 00 00       	push   $0x81c3
    2c42:	6a 01                	push   $0x1
    2c44:	e8 66 12 00 00       	call   3eaf <printf>
    2c49:	83 c4 10             	add    $0x10,%esp

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2c4c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2c53:	e9 e7 00 00 00       	jmp    2d3f <iref+0x10b>
    if(mkdir("irefd") != 0){
    2c58:	83 ec 0c             	sub    $0xc,%esp
    2c5b:	68 d4 81 00 00       	push   $0x81d4
    2c60:	e8 06 10 00 00       	call   3c6b <mkdir>
    2c65:	83 c4 10             	add    $0x10,%esp
    2c68:	85 c0                	test   %eax,%eax
    2c6a:	74 17                	je     2c83 <iref+0x4f>
      printf(1, "mkdir irefd failed\n");
    2c6c:	83 ec 08             	sub    $0x8,%esp
    2c6f:	68 da 81 00 00       	push   $0x81da
    2c74:	6a 01                	push   $0x1
    2c76:	e8 34 12 00 00       	call   3eaf <printf>
    2c7b:	83 c4 10             	add    $0x10,%esp
      exit();
    2c7e:	e8 80 0f 00 00       	call   3c03 <exit>
    }
    if(chdir("irefd") != 0){
    2c83:	83 ec 0c             	sub    $0xc,%esp
    2c86:	68 d4 81 00 00       	push   $0x81d4
    2c8b:	e8 e3 0f 00 00       	call   3c73 <chdir>
    2c90:	83 c4 10             	add    $0x10,%esp
    2c93:	85 c0                	test   %eax,%eax
    2c95:	74 17                	je     2cae <iref+0x7a>
      printf(1, "chdir irefd failed\n");
    2c97:	83 ec 08             	sub    $0x8,%esp
    2c9a:	68 ee 81 00 00       	push   $0x81ee
    2c9f:	6a 01                	push   $0x1
    2ca1:	e8 09 12 00 00       	call   3eaf <printf>
    2ca6:	83 c4 10             	add    $0x10,%esp
      exit();
    2ca9:	e8 55 0f 00 00       	call   3c03 <exit>
    }

    mkdir("");
    2cae:	83 ec 0c             	sub    $0xc,%esp
    2cb1:	68 02 82 00 00       	push   $0x8202
    2cb6:	e8 b0 0f 00 00       	call   3c6b <mkdir>
    2cbb:	83 c4 10             	add    $0x10,%esp
    link("README", "");
    2cbe:	83 ec 08             	sub    $0x8,%esp
    2cc1:	68 02 82 00 00       	push   $0x8202
    2cc6:	68 3f 81 00 00       	push   $0x813f
    2ccb:	e8 93 0f 00 00       	call   3c63 <link>
    2cd0:	83 c4 10             	add    $0x10,%esp
    fd = open("", O_CREATE);
    2cd3:	83 ec 08             	sub    $0x8,%esp
    2cd6:	68 00 02 00 00       	push   $0x200
    2cdb:	68 02 82 00 00       	push   $0x8202
    2ce0:	e8 5e 0f 00 00       	call   3c43 <open>
    2ce5:	83 c4 10             	add    $0x10,%esp
    2ce8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2ceb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2cef:	78 0e                	js     2cff <iref+0xcb>
      close(fd);
    2cf1:	83 ec 0c             	sub    $0xc,%esp
    2cf4:	ff 75 f0             	pushl  -0x10(%ebp)
    2cf7:	e8 2f 0f 00 00       	call   3c2b <close>
    2cfc:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2cff:	83 ec 08             	sub    $0x8,%esp
    2d02:	68 00 02 00 00       	push   $0x200
    2d07:	68 03 82 00 00       	push   $0x8203
    2d0c:	e8 32 0f 00 00       	call   3c43 <open>
    2d11:	83 c4 10             	add    $0x10,%esp
    2d14:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2d17:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2d1b:	78 0e                	js     2d2b <iref+0xf7>
      close(fd);
    2d1d:	83 ec 0c             	sub    $0xc,%esp
    2d20:	ff 75 f0             	pushl  -0x10(%ebp)
    2d23:	e8 03 0f 00 00       	call   3c2b <close>
    2d28:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2d2b:	83 ec 0c             	sub    $0xc,%esp
    2d2e:	68 03 82 00 00       	push   $0x8203
    2d33:	e8 1b 0f 00 00       	call   3c53 <unlink>
    2d38:	83 c4 10             	add    $0x10,%esp
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2d3b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2d3f:	83 7d f4 32          	cmpl   $0x32,-0xc(%ebp)
    2d43:	0f 8e 0f ff ff ff    	jle    2c58 <iref+0x24>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2d49:	83 ec 0c             	sub    $0xc,%esp
    2d4c:	68 26 80 00 00       	push   $0x8026
    2d51:	e8 1d 0f 00 00       	call   3c73 <chdir>
    2d56:	83 c4 10             	add    $0x10,%esp
  printf(1, "empty file name OK\n");
    2d59:	83 ec 08             	sub    $0x8,%esp
    2d5c:	68 06 82 00 00       	push   $0x8206
    2d61:	6a 01                	push   $0x1
    2d63:	e8 47 11 00 00       	call   3eaf <printf>
    2d68:	83 c4 10             	add    $0x10,%esp
}
    2d6b:	90                   	nop
    2d6c:	c9                   	leave  
    2d6d:	c3                   	ret    

00002d6e <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2d6e:	55                   	push   %ebp
    2d6f:	89 e5                	mov    %esp,%ebp
    2d71:	83 ec 18             	sub    $0x18,%esp
  int n, pid;

  printf(1, "fork test\n");
    2d74:	83 ec 08             	sub    $0x8,%esp
    2d77:	68 1a 82 00 00       	push   $0x821a
    2d7c:	6a 01                	push   $0x1
    2d7e:	e8 2c 11 00 00       	call   3eaf <printf>
    2d83:	83 c4 10             	add    $0x10,%esp

  for(n=0; n<1000; n++){
    2d86:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2d8d:	eb 1d                	jmp    2dac <forktest+0x3e>
    pid = fork();
    2d8f:	e8 67 0e 00 00       	call   3bfb <fork>
    2d94:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
    2d97:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2d9b:	78 1a                	js     2db7 <forktest+0x49>
      break;
    if(pid == 0)
    2d9d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2da1:	75 05                	jne    2da8 <forktest+0x3a>
      exit();
    2da3:	e8 5b 0e 00 00       	call   3c03 <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2da8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2dac:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    2db3:	7e da                	jle    2d8f <forktest+0x21>
    2db5:	eb 01                	jmp    2db8 <forktest+0x4a>
    pid = fork();
    if(pid < 0)
      break;
    2db7:	90                   	nop
    if(pid == 0)
      exit();
  }
  
  if(n == 1000){
    2db8:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
    2dbf:	75 3b                	jne    2dfc <forktest+0x8e>
    printf(1, "fork claimed to work 1000 times!\n");
    2dc1:	83 ec 08             	sub    $0x8,%esp
    2dc4:	68 28 82 00 00       	push   $0x8228
    2dc9:	6a 01                	push   $0x1
    2dcb:	e8 df 10 00 00       	call   3eaf <printf>
    2dd0:	83 c4 10             	add    $0x10,%esp
    exit();
    2dd3:	e8 2b 0e 00 00       	call   3c03 <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
    2dd8:	e8 2e 0e 00 00       	call   3c0b <wait>
    2ddd:	85 c0                	test   %eax,%eax
    2ddf:	79 17                	jns    2df8 <forktest+0x8a>
      printf(1, "wait stopped early\n");
    2de1:	83 ec 08             	sub    $0x8,%esp
    2de4:	68 4a 82 00 00       	push   $0x824a
    2de9:	6a 01                	push   $0x1
    2deb:	e8 bf 10 00 00       	call   3eaf <printf>
    2df0:	83 c4 10             	add    $0x10,%esp
      exit();
    2df3:	e8 0b 0e 00 00       	call   3c03 <exit>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    2df8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2dfc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e00:	7f d6                	jg     2dd8 <forktest+0x6a>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    2e02:	e8 04 0e 00 00       	call   3c0b <wait>
    2e07:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e0a:	74 17                	je     2e23 <forktest+0xb5>
    printf(1, "wait got too many\n");
    2e0c:	83 ec 08             	sub    $0x8,%esp
    2e0f:	68 5e 82 00 00       	push   $0x825e
    2e14:	6a 01                	push   $0x1
    2e16:	e8 94 10 00 00       	call   3eaf <printf>
    2e1b:	83 c4 10             	add    $0x10,%esp
    exit();
    2e1e:	e8 e0 0d 00 00       	call   3c03 <exit>
  }
  
  printf(1, "fork test OK\n");
    2e23:	83 ec 08             	sub    $0x8,%esp
    2e26:	68 71 82 00 00       	push   $0x8271
    2e2b:	6a 01                	push   $0x1
    2e2d:	e8 7d 10 00 00       	call   3eaf <printf>
    2e32:	83 c4 10             	add    $0x10,%esp
}
    2e35:	90                   	nop
    2e36:	c9                   	leave  
    2e37:	c3                   	ret    

00002e38 <sbrktest>:

void
sbrktest(void)
{
    2e38:	55                   	push   %ebp
    2e39:	89 e5                	mov    %esp,%ebp
    2e3b:	53                   	push   %ebx
    2e3c:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2e3f:	a1 b4 96 00 00       	mov    0x96b4,%eax
    2e44:	83 ec 08             	sub    $0x8,%esp
    2e47:	68 7f 82 00 00       	push   $0x827f
    2e4c:	50                   	push   %eax
    2e4d:	e8 5d 10 00 00       	call   3eaf <printf>
    2e52:	83 c4 10             	add    $0x10,%esp
  oldbrk = sbrk(0);
    2e55:	83 ec 0c             	sub    $0xc,%esp
    2e58:	6a 00                	push   $0x0
    2e5a:	e8 2c 0e 00 00       	call   3c8b <sbrk>
    2e5f:	83 c4 10             	add    $0x10,%esp
    2e62:	89 45 ec             	mov    %eax,-0x14(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    2e65:	83 ec 0c             	sub    $0xc,%esp
    2e68:	6a 00                	push   $0x0
    2e6a:	e8 1c 0e 00 00       	call   3c8b <sbrk>
    2e6f:	83 c4 10             	add    $0x10,%esp
    2e72:	89 45 f4             	mov    %eax,-0xc(%ebp)
  int i;
  for(i = 0; i < 5000; i++){ 
    2e75:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2e7c:	eb 4f                	jmp    2ecd <sbrktest+0x95>
    b = sbrk(1);
    2e7e:	83 ec 0c             	sub    $0xc,%esp
    2e81:	6a 01                	push   $0x1
    2e83:	e8 03 0e 00 00       	call   3c8b <sbrk>
    2e88:	83 c4 10             	add    $0x10,%esp
    2e8b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(b != a){
    2e8e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e91:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2e94:	74 24                	je     2eba <sbrktest+0x82>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2e96:	a1 b4 96 00 00       	mov    0x96b4,%eax
    2e9b:	83 ec 0c             	sub    $0xc,%esp
    2e9e:	ff 75 e8             	pushl  -0x18(%ebp)
    2ea1:	ff 75 f4             	pushl  -0xc(%ebp)
    2ea4:	ff 75 f0             	pushl  -0x10(%ebp)
    2ea7:	68 8a 82 00 00       	push   $0x828a
    2eac:	50                   	push   %eax
    2ead:	e8 fd 0f 00 00       	call   3eaf <printf>
    2eb2:	83 c4 20             	add    $0x20,%esp
      exit();
    2eb5:	e8 49 0d 00 00       	call   3c03 <exit>
    }
    *b = 1;
    2eba:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ebd:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    2ec0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ec3:	83 c0 01             	add    $0x1,%eax
    2ec6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    2ec9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2ecd:	81 7d f0 87 13 00 00 	cmpl   $0x1387,-0x10(%ebp)
    2ed4:	7e a8                	jle    2e7e <sbrktest+0x46>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2ed6:	e8 20 0d 00 00       	call   3bfb <fork>
    2edb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    2ede:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2ee2:	79 1b                	jns    2eff <sbrktest+0xc7>
    printf(stdout, "sbrk test fork failed\n");
    2ee4:	a1 b4 96 00 00       	mov    0x96b4,%eax
    2ee9:	83 ec 08             	sub    $0x8,%esp
    2eec:	68 a5 82 00 00       	push   $0x82a5
    2ef1:	50                   	push   %eax
    2ef2:	e8 b8 0f 00 00       	call   3eaf <printf>
    2ef7:	83 c4 10             	add    $0x10,%esp
    exit();
    2efa:	e8 04 0d 00 00       	call   3c03 <exit>
  }
  c = sbrk(1);
    2eff:	83 ec 0c             	sub    $0xc,%esp
    2f02:	6a 01                	push   $0x1
    2f04:	e8 82 0d 00 00       	call   3c8b <sbrk>
    2f09:	83 c4 10             	add    $0x10,%esp
    2f0c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c = sbrk(1);
    2f0f:	83 ec 0c             	sub    $0xc,%esp
    2f12:	6a 01                	push   $0x1
    2f14:	e8 72 0d 00 00       	call   3c8b <sbrk>
    2f19:	83 c4 10             	add    $0x10,%esp
    2f1c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a + 1){
    2f1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f22:	83 c0 01             	add    $0x1,%eax
    2f25:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    2f28:	74 1b                	je     2f45 <sbrktest+0x10d>
    printf(stdout, "sbrk test failed post-fork\n");
    2f2a:	a1 b4 96 00 00       	mov    0x96b4,%eax
    2f2f:	83 ec 08             	sub    $0x8,%esp
    2f32:	68 bc 82 00 00       	push   $0x82bc
    2f37:	50                   	push   %eax
    2f38:	e8 72 0f 00 00       	call   3eaf <printf>
    2f3d:	83 c4 10             	add    $0x10,%esp
    exit();
    2f40:	e8 be 0c 00 00       	call   3c03 <exit>
  }
  if(pid == 0)
    2f45:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2f49:	75 05                	jne    2f50 <sbrktest+0x118>
    exit();
    2f4b:	e8 b3 0c 00 00       	call   3c03 <exit>
  wait();
    2f50:	e8 b6 0c 00 00       	call   3c0b <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2f55:	83 ec 0c             	sub    $0xc,%esp
    2f58:	6a 00                	push   $0x0
    2f5a:	e8 2c 0d 00 00       	call   3c8b <sbrk>
    2f5f:	83 c4 10             	add    $0x10,%esp
    2f62:	89 45 f4             	mov    %eax,-0xc(%ebp)
  amt = (BIG) - (uint)a;
    2f65:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f68:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2f6d:	29 c2                	sub    %eax,%edx
    2f6f:	89 d0                	mov    %edx,%eax
    2f71:	89 45 dc             	mov    %eax,-0x24(%ebp)
  p = sbrk(amt);
    2f74:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2f77:	83 ec 0c             	sub    $0xc,%esp
    2f7a:	50                   	push   %eax
    2f7b:	e8 0b 0d 00 00       	call   3c8b <sbrk>
    2f80:	83 c4 10             	add    $0x10,%esp
    2f83:	89 45 d8             	mov    %eax,-0x28(%ebp)
  if (p != a) { 
    2f86:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2f89:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2f8c:	74 1b                	je     2fa9 <sbrktest+0x171>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2f8e:	a1 b4 96 00 00       	mov    0x96b4,%eax
    2f93:	83 ec 08             	sub    $0x8,%esp
    2f96:	68 d8 82 00 00       	push   $0x82d8
    2f9b:	50                   	push   %eax
    2f9c:	e8 0e 0f 00 00       	call   3eaf <printf>
    2fa1:	83 c4 10             	add    $0x10,%esp
    exit();
    2fa4:	e8 5a 0c 00 00       	call   3c03 <exit>
  }
  lastaddr = (char*) (BIG-1);
    2fa9:	c7 45 d4 ff ff 3f 06 	movl   $0x63fffff,-0x2c(%ebp)
  *lastaddr = 99;
    2fb0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2fb3:	c6 00 63             	movb   $0x63,(%eax)

  // can one de-allocate?
  a = sbrk(0);
    2fb6:	83 ec 0c             	sub    $0xc,%esp
    2fb9:	6a 00                	push   $0x0
    2fbb:	e8 cb 0c 00 00       	call   3c8b <sbrk>
    2fc0:	83 c4 10             	add    $0x10,%esp
    2fc3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-4096);
    2fc6:	83 ec 0c             	sub    $0xc,%esp
    2fc9:	68 00 f0 ff ff       	push   $0xfffff000
    2fce:	e8 b8 0c 00 00       	call   3c8b <sbrk>
    2fd3:	83 c4 10             	add    $0x10,%esp
    2fd6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c == (char*)0xffffffff){
    2fd9:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    2fdd:	75 1b                	jne    2ffa <sbrktest+0x1c2>
    printf(stdout, "sbrk could not deallocate\n");
    2fdf:	a1 b4 96 00 00       	mov    0x96b4,%eax
    2fe4:	83 ec 08             	sub    $0x8,%esp
    2fe7:	68 16 83 00 00       	push   $0x8316
    2fec:	50                   	push   %eax
    2fed:	e8 bd 0e 00 00       	call   3eaf <printf>
    2ff2:	83 c4 10             	add    $0x10,%esp
    exit();
    2ff5:	e8 09 0c 00 00       	call   3c03 <exit>
  }
  c = sbrk(0);
    2ffa:	83 ec 0c             	sub    $0xc,%esp
    2ffd:	6a 00                	push   $0x0
    2fff:	e8 87 0c 00 00       	call   3c8b <sbrk>
    3004:	83 c4 10             	add    $0x10,%esp
    3007:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a - 4096){
    300a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    300d:	2d 00 10 00 00       	sub    $0x1000,%eax
    3012:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    3015:	74 1e                	je     3035 <sbrktest+0x1fd>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3017:	a1 b4 96 00 00       	mov    0x96b4,%eax
    301c:	ff 75 e0             	pushl  -0x20(%ebp)
    301f:	ff 75 f4             	pushl  -0xc(%ebp)
    3022:	68 34 83 00 00       	push   $0x8334
    3027:	50                   	push   %eax
    3028:	e8 82 0e 00 00       	call   3eaf <printf>
    302d:	83 c4 10             	add    $0x10,%esp
    exit();
    3030:	e8 ce 0b 00 00       	call   3c03 <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    3035:	83 ec 0c             	sub    $0xc,%esp
    3038:	6a 00                	push   $0x0
    303a:	e8 4c 0c 00 00       	call   3c8b <sbrk>
    303f:	83 c4 10             	add    $0x10,%esp
    3042:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(4096);
    3045:	83 ec 0c             	sub    $0xc,%esp
    3048:	68 00 10 00 00       	push   $0x1000
    304d:	e8 39 0c 00 00       	call   3c8b <sbrk>
    3052:	83 c4 10             	add    $0x10,%esp
    3055:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a || sbrk(0) != a + 4096){
    3058:	8b 45 e0             	mov    -0x20(%ebp),%eax
    305b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    305e:	75 1b                	jne    307b <sbrktest+0x243>
    3060:	83 ec 0c             	sub    $0xc,%esp
    3063:	6a 00                	push   $0x0
    3065:	e8 21 0c 00 00       	call   3c8b <sbrk>
    306a:	83 c4 10             	add    $0x10,%esp
    306d:	89 c2                	mov    %eax,%edx
    306f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3072:	05 00 10 00 00       	add    $0x1000,%eax
    3077:	39 c2                	cmp    %eax,%edx
    3079:	74 1e                	je     3099 <sbrktest+0x261>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    307b:	a1 b4 96 00 00       	mov    0x96b4,%eax
    3080:	ff 75 e0             	pushl  -0x20(%ebp)
    3083:	ff 75 f4             	pushl  -0xc(%ebp)
    3086:	68 6c 83 00 00       	push   $0x836c
    308b:	50                   	push   %eax
    308c:	e8 1e 0e 00 00       	call   3eaf <printf>
    3091:	83 c4 10             	add    $0x10,%esp
    exit();
    3094:	e8 6a 0b 00 00       	call   3c03 <exit>
  }
  if(*lastaddr == 99){
    3099:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    309c:	0f b6 00             	movzbl (%eax),%eax
    309f:	3c 63                	cmp    $0x63,%al
    30a1:	75 1b                	jne    30be <sbrktest+0x286>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    30a3:	a1 b4 96 00 00       	mov    0x96b4,%eax
    30a8:	83 ec 08             	sub    $0x8,%esp
    30ab:	68 94 83 00 00       	push   $0x8394
    30b0:	50                   	push   %eax
    30b1:	e8 f9 0d 00 00       	call   3eaf <printf>
    30b6:	83 c4 10             	add    $0x10,%esp
    exit();
    30b9:	e8 45 0b 00 00       	call   3c03 <exit>
  }

  a = sbrk(0);
    30be:	83 ec 0c             	sub    $0xc,%esp
    30c1:	6a 00                	push   $0x0
    30c3:	e8 c3 0b 00 00       	call   3c8b <sbrk>
    30c8:	83 c4 10             	add    $0x10,%esp
    30cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-(sbrk(0) - oldbrk));
    30ce:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    30d1:	83 ec 0c             	sub    $0xc,%esp
    30d4:	6a 00                	push   $0x0
    30d6:	e8 b0 0b 00 00       	call   3c8b <sbrk>
    30db:	83 c4 10             	add    $0x10,%esp
    30de:	29 c3                	sub    %eax,%ebx
    30e0:	89 d8                	mov    %ebx,%eax
    30e2:	83 ec 0c             	sub    $0xc,%esp
    30e5:	50                   	push   %eax
    30e6:	e8 a0 0b 00 00       	call   3c8b <sbrk>
    30eb:	83 c4 10             	add    $0x10,%esp
    30ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a){
    30f1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    30f4:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    30f7:	74 1e                	je     3117 <sbrktest+0x2df>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    30f9:	a1 b4 96 00 00       	mov    0x96b4,%eax
    30fe:	ff 75 e0             	pushl  -0x20(%ebp)
    3101:	ff 75 f4             	pushl  -0xc(%ebp)
    3104:	68 c4 83 00 00       	push   $0x83c4
    3109:	50                   	push   %eax
    310a:	e8 a0 0d 00 00       	call   3eaf <printf>
    310f:	83 c4 10             	add    $0x10,%esp
    exit();
    3112:	e8 ec 0a 00 00       	call   3c03 <exit>
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3117:	c7 45 f4 00 00 00 80 	movl   $0x80000000,-0xc(%ebp)
    311e:	eb 76                	jmp    3196 <sbrktest+0x35e>
    ppid = getpid();
    3120:	e8 5e 0b 00 00       	call   3c83 <getpid>
    3125:	89 45 d0             	mov    %eax,-0x30(%ebp)
    pid = fork();
    3128:	e8 ce 0a 00 00       	call   3bfb <fork>
    312d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pid < 0){
    3130:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3134:	79 1b                	jns    3151 <sbrktest+0x319>
      printf(stdout, "fork failed\n");
    3136:	a1 b4 96 00 00       	mov    0x96b4,%eax
    313b:	83 ec 08             	sub    $0x8,%esp
    313e:	68 8d 73 00 00       	push   $0x738d
    3143:	50                   	push   %eax
    3144:	e8 66 0d 00 00       	call   3eaf <printf>
    3149:	83 c4 10             	add    $0x10,%esp
      exit();
    314c:	e8 b2 0a 00 00       	call   3c03 <exit>
    }
    if(pid == 0){
    3151:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3155:	75 33                	jne    318a <sbrktest+0x352>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3157:	8b 45 f4             	mov    -0xc(%ebp),%eax
    315a:	0f b6 00             	movzbl (%eax),%eax
    315d:	0f be d0             	movsbl %al,%edx
    3160:	a1 b4 96 00 00       	mov    0x96b4,%eax
    3165:	52                   	push   %edx
    3166:	ff 75 f4             	pushl  -0xc(%ebp)
    3169:	68 e5 83 00 00       	push   $0x83e5
    316e:	50                   	push   %eax
    316f:	e8 3b 0d 00 00       	call   3eaf <printf>
    3174:	83 c4 10             	add    $0x10,%esp
      kill(ppid);
    3177:	83 ec 0c             	sub    $0xc,%esp
    317a:	ff 75 d0             	pushl  -0x30(%ebp)
    317d:	e8 b1 0a 00 00       	call   3c33 <kill>
    3182:	83 c4 10             	add    $0x10,%esp
      exit();
    3185:	e8 79 0a 00 00       	call   3c03 <exit>
    }
    wait();
    318a:	e8 7c 0a 00 00       	call   3c0b <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    318f:	81 45 f4 50 c3 00 00 	addl   $0xc350,-0xc(%ebp)
    3196:	81 7d f4 7f 84 1e 80 	cmpl   $0x801e847f,-0xc(%ebp)
    319d:	76 81                	jbe    3120 <sbrktest+0x2e8>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    319f:	83 ec 0c             	sub    $0xc,%esp
    31a2:	8d 45 c8             	lea    -0x38(%ebp),%eax
    31a5:	50                   	push   %eax
    31a6:	e8 68 0a 00 00       	call   3c13 <pipe>
    31ab:	83 c4 10             	add    $0x10,%esp
    31ae:	85 c0                	test   %eax,%eax
    31b0:	74 17                	je     31c9 <sbrktest+0x391>
    printf(1, "pipe() failed\n");
    31b2:	83 ec 08             	sub    $0x8,%esp
    31b5:	68 e1 72 00 00       	push   $0x72e1
    31ba:	6a 01                	push   $0x1
    31bc:	e8 ee 0c 00 00       	call   3eaf <printf>
    31c1:	83 c4 10             	add    $0x10,%esp
    exit();
    31c4:	e8 3a 0a 00 00       	call   3c03 <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    31c9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    31d0:	e9 88 00 00 00       	jmp    325d <sbrktest+0x425>
    if((pids[i] = fork()) == 0){
    31d5:	e8 21 0a 00 00       	call   3bfb <fork>
    31da:	89 c2                	mov    %eax,%edx
    31dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31df:	89 54 85 a0          	mov    %edx,-0x60(%ebp,%eax,4)
    31e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31e6:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    31ea:	85 c0                	test   %eax,%eax
    31ec:	75 4a                	jne    3238 <sbrktest+0x400>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    31ee:	83 ec 0c             	sub    $0xc,%esp
    31f1:	6a 00                	push   $0x0
    31f3:	e8 93 0a 00 00       	call   3c8b <sbrk>
    31f8:	83 c4 10             	add    $0x10,%esp
    31fb:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3200:	29 c2                	sub    %eax,%edx
    3202:	89 d0                	mov    %edx,%eax
    3204:	83 ec 0c             	sub    $0xc,%esp
    3207:	50                   	push   %eax
    3208:	e8 7e 0a 00 00       	call   3c8b <sbrk>
    320d:	83 c4 10             	add    $0x10,%esp
      write(fds[1], "x", 1);
    3210:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3213:	83 ec 04             	sub    $0x4,%esp
    3216:	6a 01                	push   $0x1
    3218:	68 46 73 00 00       	push   $0x7346
    321d:	50                   	push   %eax
    321e:	e8 00 0a 00 00       	call   3c23 <write>
    3223:	83 c4 10             	add    $0x10,%esp
      // sit around until killed
      for(;;) sleep(1000);
    3226:	83 ec 0c             	sub    $0xc,%esp
    3229:	68 e8 03 00 00       	push   $0x3e8
    322e:	e8 60 0a 00 00       	call   3c93 <sleep>
    3233:	83 c4 10             	add    $0x10,%esp
    3236:	eb ee                	jmp    3226 <sbrktest+0x3ee>
    }
    if(pids[i] != -1)
    3238:	8b 45 f0             	mov    -0x10(%ebp),%eax
    323b:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    323f:	83 f8 ff             	cmp    $0xffffffff,%eax
    3242:	74 15                	je     3259 <sbrktest+0x421>
      read(fds[0], &scratch, 1);
    3244:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3247:	83 ec 04             	sub    $0x4,%esp
    324a:	6a 01                	push   $0x1
    324c:	8d 55 9f             	lea    -0x61(%ebp),%edx
    324f:	52                   	push   %edx
    3250:	50                   	push   %eax
    3251:	e8 c5 09 00 00       	call   3c1b <read>
    3256:	83 c4 10             	add    $0x10,%esp
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3259:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    325d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3260:	83 f8 09             	cmp    $0x9,%eax
    3263:	0f 86 6c ff ff ff    	jbe    31d5 <sbrktest+0x39d>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    3269:	83 ec 0c             	sub    $0xc,%esp
    326c:	68 00 10 00 00       	push   $0x1000
    3271:	e8 15 0a 00 00       	call   3c8b <sbrk>
    3276:	83 c4 10             	add    $0x10,%esp
    3279:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    327c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3283:	eb 2b                	jmp    32b0 <sbrktest+0x478>
    if(pids[i] == -1)
    3285:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3288:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    328c:	83 f8 ff             	cmp    $0xffffffff,%eax
    328f:	74 1a                	je     32ab <sbrktest+0x473>
      continue;
    kill(pids[i]);
    3291:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3294:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3298:	83 ec 0c             	sub    $0xc,%esp
    329b:	50                   	push   %eax
    329c:	e8 92 09 00 00       	call   3c33 <kill>
    32a1:	83 c4 10             	add    $0x10,%esp
    wait();
    32a4:	e8 62 09 00 00       	call   3c0b <wait>
    32a9:	eb 01                	jmp    32ac <sbrktest+0x474>
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
      continue;
    32ab:	90                   	nop
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    32ac:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    32b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32b3:	83 f8 09             	cmp    $0x9,%eax
    32b6:	76 cd                	jbe    3285 <sbrktest+0x44d>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    32b8:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    32bc:	75 1b                	jne    32d9 <sbrktest+0x4a1>
    printf(stdout, "failed sbrk leaked memory\n");
    32be:	a1 b4 96 00 00       	mov    0x96b4,%eax
    32c3:	83 ec 08             	sub    $0x8,%esp
    32c6:	68 fe 83 00 00       	push   $0x83fe
    32cb:	50                   	push   %eax
    32cc:	e8 de 0b 00 00       	call   3eaf <printf>
    32d1:	83 c4 10             	add    $0x10,%esp
    exit();
    32d4:	e8 2a 09 00 00       	call   3c03 <exit>
  }

  if(sbrk(0) > oldbrk)
    32d9:	83 ec 0c             	sub    $0xc,%esp
    32dc:	6a 00                	push   $0x0
    32de:	e8 a8 09 00 00       	call   3c8b <sbrk>
    32e3:	83 c4 10             	add    $0x10,%esp
    32e6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    32e9:	76 20                	jbe    330b <sbrktest+0x4d3>
    sbrk(-(sbrk(0) - oldbrk));
    32eb:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    32ee:	83 ec 0c             	sub    $0xc,%esp
    32f1:	6a 00                	push   $0x0
    32f3:	e8 93 09 00 00       	call   3c8b <sbrk>
    32f8:	83 c4 10             	add    $0x10,%esp
    32fb:	29 c3                	sub    %eax,%ebx
    32fd:	89 d8                	mov    %ebx,%eax
    32ff:	83 ec 0c             	sub    $0xc,%esp
    3302:	50                   	push   %eax
    3303:	e8 83 09 00 00       	call   3c8b <sbrk>
    3308:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    330b:	a1 b4 96 00 00       	mov    0x96b4,%eax
    3310:	83 ec 08             	sub    $0x8,%esp
    3313:	68 19 84 00 00       	push   $0x8419
    3318:	50                   	push   %eax
    3319:	e8 91 0b 00 00       	call   3eaf <printf>
    331e:	83 c4 10             	add    $0x10,%esp
}
    3321:	90                   	nop
    3322:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3325:	c9                   	leave  
    3326:	c3                   	ret    

00003327 <validateint>:

void
validateint(int *p)
{
    3327:	55                   	push   %ebp
    3328:	89 e5                	mov    %esp,%ebp
    332a:	53                   	push   %ebx
    332b:	83 ec 10             	sub    $0x10,%esp
  int res;
  asm("mov %%esp, %%ebx\n\t"
    332e:	b8 0d 00 00 00       	mov    $0xd,%eax
    3333:	8b 55 08             	mov    0x8(%ebp),%edx
    3336:	89 d1                	mov    %edx,%ecx
    3338:	89 e3                	mov    %esp,%ebx
    333a:	89 cc                	mov    %ecx,%esp
    333c:	cd 40                	int    $0x40
    333e:	89 dc                	mov    %ebx,%esp
    3340:	89 45 f8             	mov    %eax,-0x8(%ebp)
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3343:	90                   	nop
    3344:	83 c4 10             	add    $0x10,%esp
    3347:	5b                   	pop    %ebx
    3348:	5d                   	pop    %ebp
    3349:	c3                   	ret    

0000334a <validatetest>:

void
validatetest(void)
{
    334a:	55                   	push   %ebp
    334b:	89 e5                	mov    %esp,%ebp
    334d:	83 ec 18             	sub    $0x18,%esp
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3350:	a1 b4 96 00 00       	mov    0x96b4,%eax
    3355:	83 ec 08             	sub    $0x8,%esp
    3358:	68 27 84 00 00       	push   $0x8427
    335d:	50                   	push   %eax
    335e:	e8 4c 0b 00 00       	call   3eaf <printf>
    3363:	83 c4 10             	add    $0x10,%esp
  hi = 1100*1024;
    3366:	c7 45 f0 00 30 11 00 	movl   $0x113000,-0x10(%ebp)

  for(p = 0; p <= (uint)hi; p += 4096){
    336d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3374:	e9 8a 00 00 00       	jmp    3403 <validatetest+0xb9>
    if((pid = fork()) == 0){
    3379:	e8 7d 08 00 00       	call   3bfb <fork>
    337e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3381:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3385:	75 14                	jne    339b <validatetest+0x51>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    3387:	8b 45 f4             	mov    -0xc(%ebp),%eax
    338a:	83 ec 0c             	sub    $0xc,%esp
    338d:	50                   	push   %eax
    338e:	e8 94 ff ff ff       	call   3327 <validateint>
    3393:	83 c4 10             	add    $0x10,%esp
      exit();
    3396:	e8 68 08 00 00       	call   3c03 <exit>
    }
    sleep(0);
    339b:	83 ec 0c             	sub    $0xc,%esp
    339e:	6a 00                	push   $0x0
    33a0:	e8 ee 08 00 00       	call   3c93 <sleep>
    33a5:	83 c4 10             	add    $0x10,%esp
    sleep(0);
    33a8:	83 ec 0c             	sub    $0xc,%esp
    33ab:	6a 00                	push   $0x0
    33ad:	e8 e1 08 00 00       	call   3c93 <sleep>
    33b2:	83 c4 10             	add    $0x10,%esp
    kill(pid);
    33b5:	83 ec 0c             	sub    $0xc,%esp
    33b8:	ff 75 ec             	pushl  -0x14(%ebp)
    33bb:	e8 73 08 00 00       	call   3c33 <kill>
    33c0:	83 c4 10             	add    $0x10,%esp
    wait();
    33c3:	e8 43 08 00 00       	call   3c0b <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    33c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33cb:	83 ec 08             	sub    $0x8,%esp
    33ce:	50                   	push   %eax
    33cf:	68 36 84 00 00       	push   $0x8436
    33d4:	e8 8a 08 00 00       	call   3c63 <link>
    33d9:	83 c4 10             	add    $0x10,%esp
    33dc:	83 f8 ff             	cmp    $0xffffffff,%eax
    33df:	74 1b                	je     33fc <validatetest+0xb2>
      printf(stdout, "link should not succeed\n");
    33e1:	a1 b4 96 00 00       	mov    0x96b4,%eax
    33e6:	83 ec 08             	sub    $0x8,%esp
    33e9:	68 41 84 00 00       	push   $0x8441
    33ee:	50                   	push   %eax
    33ef:	e8 bb 0a 00 00       	call   3eaf <printf>
    33f4:	83 c4 10             	add    $0x10,%esp
      exit();
    33f7:	e8 07 08 00 00       	call   3c03 <exit>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    33fc:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    3403:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3406:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    3409:	0f 86 6a ff ff ff    	jbe    3379 <validatetest+0x2f>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    340f:	a1 b4 96 00 00       	mov    0x96b4,%eax
    3414:	83 ec 08             	sub    $0x8,%esp
    3417:	68 5a 84 00 00       	push   $0x845a
    341c:	50                   	push   %eax
    341d:	e8 8d 0a 00 00       	call   3eaf <printf>
    3422:	83 c4 10             	add    $0x10,%esp
}
    3425:	90                   	nop
    3426:	c9                   	leave  
    3427:	c3                   	ret    

00003428 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3428:	55                   	push   %ebp
    3429:	89 e5                	mov    %esp,%ebp
    342b:	83 ec 18             	sub    $0x18,%esp
  int i;

  printf(stdout, "bss test\n");
    342e:	a1 b4 96 00 00       	mov    0x96b4,%eax
    3433:	83 ec 08             	sub    $0x8,%esp
    3436:	68 67 84 00 00       	push   $0x8467
    343b:	50                   	push   %eax
    343c:	e8 6e 0a 00 00       	call   3eaf <printf>
    3441:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    3444:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    344b:	eb 2e                	jmp    347b <bsstest+0x53>
    if(uninit[i] != '\0'){
    344d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3450:	05 a0 98 00 00       	add    $0x98a0,%eax
    3455:	0f b6 00             	movzbl (%eax),%eax
    3458:	84 c0                	test   %al,%al
    345a:	74 1b                	je     3477 <bsstest+0x4f>
      printf(stdout, "bss test failed\n");
    345c:	a1 b4 96 00 00       	mov    0x96b4,%eax
    3461:	83 ec 08             	sub    $0x8,%esp
    3464:	68 71 84 00 00       	push   $0x8471
    3469:	50                   	push   %eax
    346a:	e8 40 0a 00 00       	call   3eaf <printf>
    346f:	83 c4 10             	add    $0x10,%esp
      exit();
    3472:	e8 8c 07 00 00       	call   3c03 <exit>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3477:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    347b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    347e:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    3483:	76 c8                	jbe    344d <bsstest+0x25>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    3485:	a1 b4 96 00 00       	mov    0x96b4,%eax
    348a:	83 ec 08             	sub    $0x8,%esp
    348d:	68 82 84 00 00       	push   $0x8482
    3492:	50                   	push   %eax
    3493:	e8 17 0a 00 00       	call   3eaf <printf>
    3498:	83 c4 10             	add    $0x10,%esp
}
    349b:	90                   	nop
    349c:	c9                   	leave  
    349d:	c3                   	ret    

0000349e <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    349e:	55                   	push   %ebp
    349f:	89 e5                	mov    %esp,%ebp
    34a1:	83 ec 18             	sub    $0x18,%esp
  int pid, fd;

  unlink("bigarg-ok");
    34a4:	83 ec 0c             	sub    $0xc,%esp
    34a7:	68 8f 84 00 00       	push   $0x848f
    34ac:	e8 a2 07 00 00       	call   3c53 <unlink>
    34b1:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    34b4:	e8 42 07 00 00       	call   3bfb <fork>
    34b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid == 0){
    34bc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    34c0:	0f 85 97 00 00 00    	jne    355d <bigargtest+0xbf>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    34c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    34cd:	eb 12                	jmp    34e1 <bigargtest+0x43>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    34cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34d2:	c7 04 85 00 98 00 00 	movl   $0x849c,0x9800(,%eax,4)
    34d9:	9c 84 00 00 
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    34dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    34e1:	83 7d f4 1e          	cmpl   $0x1e,-0xc(%ebp)
    34e5:	7e e8                	jle    34cf <bigargtest+0x31>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    34e7:	c7 05 7c 98 00 00 00 	movl   $0x0,0x987c
    34ee:	00 00 00 
    printf(stdout, "bigarg test\n");
    34f1:	a1 b4 96 00 00       	mov    0x96b4,%eax
    34f6:	83 ec 08             	sub    $0x8,%esp
    34f9:	68 79 85 00 00       	push   $0x8579
    34fe:	50                   	push   %eax
    34ff:	e8 ab 09 00 00       	call   3eaf <printf>
    3504:	83 c4 10             	add    $0x10,%esp
    exec("echo", args);
    3507:	83 ec 08             	sub    $0x8,%esp
    350a:	68 00 98 00 00       	push   $0x9800
    350f:	68 a0 6f 00 00       	push   $0x6fa0
    3514:	e8 22 07 00 00       	call   3c3b <exec>
    3519:	83 c4 10             	add    $0x10,%esp
    printf(stdout, "bigarg test ok\n");
    351c:	a1 b4 96 00 00       	mov    0x96b4,%eax
    3521:	83 ec 08             	sub    $0x8,%esp
    3524:	68 86 85 00 00       	push   $0x8586
    3529:	50                   	push   %eax
    352a:	e8 80 09 00 00       	call   3eaf <printf>
    352f:	83 c4 10             	add    $0x10,%esp
    fd = open("bigarg-ok", O_CREATE);
    3532:	83 ec 08             	sub    $0x8,%esp
    3535:	68 00 02 00 00       	push   $0x200
    353a:	68 8f 84 00 00       	push   $0x848f
    353f:	e8 ff 06 00 00       	call   3c43 <open>
    3544:	83 c4 10             	add    $0x10,%esp
    3547:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(fd);
    354a:	83 ec 0c             	sub    $0xc,%esp
    354d:	ff 75 ec             	pushl  -0x14(%ebp)
    3550:	e8 d6 06 00 00       	call   3c2b <close>
    3555:	83 c4 10             	add    $0x10,%esp
    exit();
    3558:	e8 a6 06 00 00       	call   3c03 <exit>
  } else if(pid < 0){
    355d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3561:	79 1b                	jns    357e <bigargtest+0xe0>
    printf(stdout, "bigargtest: fork failed\n");
    3563:	a1 b4 96 00 00       	mov    0x96b4,%eax
    3568:	83 ec 08             	sub    $0x8,%esp
    356b:	68 96 85 00 00       	push   $0x8596
    3570:	50                   	push   %eax
    3571:	e8 39 09 00 00       	call   3eaf <printf>
    3576:	83 c4 10             	add    $0x10,%esp
    exit();
    3579:	e8 85 06 00 00       	call   3c03 <exit>
  }
  wait();
    357e:	e8 88 06 00 00       	call   3c0b <wait>
  fd = open("bigarg-ok", 0);
    3583:	83 ec 08             	sub    $0x8,%esp
    3586:	6a 00                	push   $0x0
    3588:	68 8f 84 00 00       	push   $0x848f
    358d:	e8 b1 06 00 00       	call   3c43 <open>
    3592:	83 c4 10             	add    $0x10,%esp
    3595:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    3598:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    359c:	79 1b                	jns    35b9 <bigargtest+0x11b>
    printf(stdout, "bigarg test failed!\n");
    359e:	a1 b4 96 00 00       	mov    0x96b4,%eax
    35a3:	83 ec 08             	sub    $0x8,%esp
    35a6:	68 af 85 00 00       	push   $0x85af
    35ab:	50                   	push   %eax
    35ac:	e8 fe 08 00 00       	call   3eaf <printf>
    35b1:	83 c4 10             	add    $0x10,%esp
    exit();
    35b4:	e8 4a 06 00 00       	call   3c03 <exit>
  }
  close(fd);
    35b9:	83 ec 0c             	sub    $0xc,%esp
    35bc:	ff 75 ec             	pushl  -0x14(%ebp)
    35bf:	e8 67 06 00 00       	call   3c2b <close>
    35c4:	83 c4 10             	add    $0x10,%esp
  unlink("bigarg-ok");
    35c7:	83 ec 0c             	sub    $0xc,%esp
    35ca:	68 8f 84 00 00       	push   $0x848f
    35cf:	e8 7f 06 00 00       	call   3c53 <unlink>
    35d4:	83 c4 10             	add    $0x10,%esp
}
    35d7:	90                   	nop
    35d8:	c9                   	leave  
    35d9:	c3                   	ret    

000035da <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    35da:	55                   	push   %ebp
    35db:	89 e5                	mov    %esp,%ebp
    35dd:	53                   	push   %ebx
    35de:	83 ec 64             	sub    $0x64,%esp
  int nfiles;
  int fsblocks = 0;
    35e1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

  printf(1, "fsfull test\n");
    35e8:	83 ec 08             	sub    $0x8,%esp
    35eb:	68 c4 85 00 00       	push   $0x85c4
    35f0:	6a 01                	push   $0x1
    35f2:	e8 b8 08 00 00       	call   3eaf <printf>
    35f7:	83 c4 10             	add    $0x10,%esp

  for(nfiles = 0; ; nfiles++){
    35fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    char name[64];
    name[0] = 'f';
    3601:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3605:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3608:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    360d:	89 c8                	mov    %ecx,%eax
    360f:	f7 ea                	imul   %edx
    3611:	c1 fa 06             	sar    $0x6,%edx
    3614:	89 c8                	mov    %ecx,%eax
    3616:	c1 f8 1f             	sar    $0x1f,%eax
    3619:	29 c2                	sub    %eax,%edx
    361b:	89 d0                	mov    %edx,%eax
    361d:	83 c0 30             	add    $0x30,%eax
    3620:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3623:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3626:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    362b:	89 d8                	mov    %ebx,%eax
    362d:	f7 ea                	imul   %edx
    362f:	c1 fa 06             	sar    $0x6,%edx
    3632:	89 d8                	mov    %ebx,%eax
    3634:	c1 f8 1f             	sar    $0x1f,%eax
    3637:	89 d1                	mov    %edx,%ecx
    3639:	29 c1                	sub    %eax,%ecx
    363b:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    3641:	29 c3                	sub    %eax,%ebx
    3643:	89 d9                	mov    %ebx,%ecx
    3645:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    364a:	89 c8                	mov    %ecx,%eax
    364c:	f7 ea                	imul   %edx
    364e:	c1 fa 05             	sar    $0x5,%edx
    3651:	89 c8                	mov    %ecx,%eax
    3653:	c1 f8 1f             	sar    $0x1f,%eax
    3656:	29 c2                	sub    %eax,%edx
    3658:	89 d0                	mov    %edx,%eax
    365a:	83 c0 30             	add    $0x30,%eax
    365d:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3660:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3663:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3668:	89 d8                	mov    %ebx,%eax
    366a:	f7 ea                	imul   %edx
    366c:	c1 fa 05             	sar    $0x5,%edx
    366f:	89 d8                	mov    %ebx,%eax
    3671:	c1 f8 1f             	sar    $0x1f,%eax
    3674:	89 d1                	mov    %edx,%ecx
    3676:	29 c1                	sub    %eax,%ecx
    3678:	6b c1 64             	imul   $0x64,%ecx,%eax
    367b:	29 c3                	sub    %eax,%ebx
    367d:	89 d9                	mov    %ebx,%ecx
    367f:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3684:	89 c8                	mov    %ecx,%eax
    3686:	f7 ea                	imul   %edx
    3688:	c1 fa 02             	sar    $0x2,%edx
    368b:	89 c8                	mov    %ecx,%eax
    368d:	c1 f8 1f             	sar    $0x1f,%eax
    3690:	29 c2                	sub    %eax,%edx
    3692:	89 d0                	mov    %edx,%eax
    3694:	83 c0 30             	add    $0x30,%eax
    3697:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    369a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    369d:	ba 67 66 66 66       	mov    $0x66666667,%edx
    36a2:	89 c8                	mov    %ecx,%eax
    36a4:	f7 ea                	imul   %edx
    36a6:	c1 fa 02             	sar    $0x2,%edx
    36a9:	89 c8                	mov    %ecx,%eax
    36ab:	c1 f8 1f             	sar    $0x1f,%eax
    36ae:	29 c2                	sub    %eax,%edx
    36b0:	89 d0                	mov    %edx,%eax
    36b2:	c1 e0 02             	shl    $0x2,%eax
    36b5:	01 d0                	add    %edx,%eax
    36b7:	01 c0                	add    %eax,%eax
    36b9:	29 c1                	sub    %eax,%ecx
    36bb:	89 ca                	mov    %ecx,%edx
    36bd:	89 d0                	mov    %edx,%eax
    36bf:	83 c0 30             	add    $0x30,%eax
    36c2:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    36c5:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    printf(1, "writing %s\n", name);
    36c9:	83 ec 04             	sub    $0x4,%esp
    36cc:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    36cf:	50                   	push   %eax
    36d0:	68 d1 85 00 00       	push   $0x85d1
    36d5:	6a 01                	push   $0x1
    36d7:	e8 d3 07 00 00       	call   3eaf <printf>
    36dc:	83 c4 10             	add    $0x10,%esp
    int fd = open(name, O_CREATE|O_RDWR);
    36df:	83 ec 08             	sub    $0x8,%esp
    36e2:	68 02 02 00 00       	push   $0x202
    36e7:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    36ea:	50                   	push   %eax
    36eb:	e8 53 05 00 00       	call   3c43 <open>
    36f0:	83 c4 10             	add    $0x10,%esp
    36f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fd < 0){
    36f6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    36fa:	79 18                	jns    3714 <fsfull+0x13a>
      printf(1, "open %s failed\n", name);
    36fc:	83 ec 04             	sub    $0x4,%esp
    36ff:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3702:	50                   	push   %eax
    3703:	68 dd 85 00 00       	push   $0x85dd
    3708:	6a 01                	push   $0x1
    370a:	e8 a0 07 00 00       	call   3eaf <printf>
    370f:	83 c4 10             	add    $0x10,%esp
      break;
    3712:	eb 6b                	jmp    377f <fsfull+0x1a5>
    }
    int total = 0;
    3714:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while(1){
      int cc = write(fd, buf, 512);
    371b:	83 ec 04             	sub    $0x4,%esp
    371e:	68 00 02 00 00       	push   $0x200
    3723:	68 c0 bf 00 00       	push   $0xbfc0
    3728:	ff 75 e8             	pushl  -0x18(%ebp)
    372b:	e8 f3 04 00 00       	call   3c23 <write>
    3730:	83 c4 10             	add    $0x10,%esp
    3733:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if(cc < 512)
    3736:	81 7d e4 ff 01 00 00 	cmpl   $0x1ff,-0x1c(%ebp)
    373d:	7e 0c                	jle    374b <fsfull+0x171>
        break;
      total += cc;
    373f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3742:	01 45 ec             	add    %eax,-0x14(%ebp)
      fsblocks++;
    3745:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    }
    3749:	eb d0                	jmp    371b <fsfull+0x141>
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
    374b:	90                   	nop
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    374c:	83 ec 04             	sub    $0x4,%esp
    374f:	ff 75 ec             	pushl  -0x14(%ebp)
    3752:	68 ed 85 00 00       	push   $0x85ed
    3757:	6a 01                	push   $0x1
    3759:	e8 51 07 00 00       	call   3eaf <printf>
    375e:	83 c4 10             	add    $0x10,%esp
    close(fd);
    3761:	83 ec 0c             	sub    $0xc,%esp
    3764:	ff 75 e8             	pushl  -0x18(%ebp)
    3767:	e8 bf 04 00 00       	call   3c2b <close>
    376c:	83 c4 10             	add    $0x10,%esp
    if(total == 0)
    376f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3773:	74 09                	je     377e <fsfull+0x1a4>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3775:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3779:	e9 83 fe ff ff       	jmp    3601 <fsfull+0x27>
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
    377e:	90                   	nop
  }

  while(nfiles >= 0){
    377f:	e9 db 00 00 00       	jmp    385f <fsfull+0x285>
    char name[64];
    name[0] = 'f';
    3784:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3788:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    378b:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3790:	89 c8                	mov    %ecx,%eax
    3792:	f7 ea                	imul   %edx
    3794:	c1 fa 06             	sar    $0x6,%edx
    3797:	89 c8                	mov    %ecx,%eax
    3799:	c1 f8 1f             	sar    $0x1f,%eax
    379c:	29 c2                	sub    %eax,%edx
    379e:	89 d0                	mov    %edx,%eax
    37a0:	83 c0 30             	add    $0x30,%eax
    37a3:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    37a6:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    37a9:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    37ae:	89 d8                	mov    %ebx,%eax
    37b0:	f7 ea                	imul   %edx
    37b2:	c1 fa 06             	sar    $0x6,%edx
    37b5:	89 d8                	mov    %ebx,%eax
    37b7:	c1 f8 1f             	sar    $0x1f,%eax
    37ba:	89 d1                	mov    %edx,%ecx
    37bc:	29 c1                	sub    %eax,%ecx
    37be:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    37c4:	29 c3                	sub    %eax,%ebx
    37c6:	89 d9                	mov    %ebx,%ecx
    37c8:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    37cd:	89 c8                	mov    %ecx,%eax
    37cf:	f7 ea                	imul   %edx
    37d1:	c1 fa 05             	sar    $0x5,%edx
    37d4:	89 c8                	mov    %ecx,%eax
    37d6:	c1 f8 1f             	sar    $0x1f,%eax
    37d9:	29 c2                	sub    %eax,%edx
    37db:	89 d0                	mov    %edx,%eax
    37dd:	83 c0 30             	add    $0x30,%eax
    37e0:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    37e3:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    37e6:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    37eb:	89 d8                	mov    %ebx,%eax
    37ed:	f7 ea                	imul   %edx
    37ef:	c1 fa 05             	sar    $0x5,%edx
    37f2:	89 d8                	mov    %ebx,%eax
    37f4:	c1 f8 1f             	sar    $0x1f,%eax
    37f7:	89 d1                	mov    %edx,%ecx
    37f9:	29 c1                	sub    %eax,%ecx
    37fb:	6b c1 64             	imul   $0x64,%ecx,%eax
    37fe:	29 c3                	sub    %eax,%ebx
    3800:	89 d9                	mov    %ebx,%ecx
    3802:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3807:	89 c8                	mov    %ecx,%eax
    3809:	f7 ea                	imul   %edx
    380b:	c1 fa 02             	sar    $0x2,%edx
    380e:	89 c8                	mov    %ecx,%eax
    3810:	c1 f8 1f             	sar    $0x1f,%eax
    3813:	29 c2                	sub    %eax,%edx
    3815:	89 d0                	mov    %edx,%eax
    3817:	83 c0 30             	add    $0x30,%eax
    381a:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    381d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3820:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3825:	89 c8                	mov    %ecx,%eax
    3827:	f7 ea                	imul   %edx
    3829:	c1 fa 02             	sar    $0x2,%edx
    382c:	89 c8                	mov    %ecx,%eax
    382e:	c1 f8 1f             	sar    $0x1f,%eax
    3831:	29 c2                	sub    %eax,%edx
    3833:	89 d0                	mov    %edx,%eax
    3835:	c1 e0 02             	shl    $0x2,%eax
    3838:	01 d0                	add    %edx,%eax
    383a:	01 c0                	add    %eax,%eax
    383c:	29 c1                	sub    %eax,%ecx
    383e:	89 ca                	mov    %ecx,%edx
    3840:	89 d0                	mov    %edx,%eax
    3842:	83 c0 30             	add    $0x30,%eax
    3845:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3848:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    unlink(name);
    384c:	83 ec 0c             	sub    $0xc,%esp
    384f:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3852:	50                   	push   %eax
    3853:	e8 fb 03 00 00       	call   3c53 <unlink>
    3858:	83 c4 10             	add    $0x10,%esp
    nfiles--;
    385b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    385f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3863:	0f 89 1b ff ff ff    	jns    3784 <fsfull+0x1aa>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3869:	83 ec 08             	sub    $0x8,%esp
    386c:	68 fd 85 00 00       	push   $0x85fd
    3871:	6a 01                	push   $0x1
    3873:	e8 37 06 00 00       	call   3eaf <printf>
    3878:	83 c4 10             	add    $0x10,%esp
}
    387b:	90                   	nop
    387c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    387f:	c9                   	leave  
    3880:	c3                   	ret    

00003881 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    3881:	55                   	push   %ebp
    3882:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
    3884:	a1 b8 96 00 00       	mov    0x96b8,%eax
    3889:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    388f:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3894:	a3 b8 96 00 00       	mov    %eax,0x96b8
  return randstate;
    3899:	a1 b8 96 00 00       	mov    0x96b8,%eax
}
    389e:	5d                   	pop    %ebp
    389f:	c3                   	ret    

000038a0 <main>:

int
main(int argc, char *argv[])
{
    38a0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    38a4:	83 e4 f0             	and    $0xfffffff0,%esp
    38a7:	ff 71 fc             	pushl  -0x4(%ecx)
    38aa:	55                   	push   %ebp
    38ab:	89 e5                	mov    %esp,%ebp
    38ad:	51                   	push   %ecx
    38ae:	83 ec 04             	sub    $0x4,%esp
  printf(1, "usertests starting\n");
    38b1:	83 ec 08             	sub    $0x8,%esp
    38b4:	68 13 86 00 00       	push   $0x8613
    38b9:	6a 01                	push   $0x1
    38bb:	e8 ef 05 00 00       	call   3eaf <printf>
    38c0:	83 c4 10             	add    $0x10,%esp

  if(open("usertests.ran", 0) >= 0){
    38c3:	83 ec 08             	sub    $0x8,%esp
    38c6:	6a 00                	push   $0x0
    38c8:	68 27 86 00 00       	push   $0x8627
    38cd:	e8 71 03 00 00       	call   3c43 <open>
    38d2:	83 c4 10             	add    $0x10,%esp
    38d5:	85 c0                	test   %eax,%eax
    38d7:	78 17                	js     38f0 <main+0x50>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    38d9:	83 ec 08             	sub    $0x8,%esp
    38dc:	68 38 86 00 00       	push   $0x8638
    38e1:	6a 01                	push   $0x1
    38e3:	e8 c7 05 00 00       	call   3eaf <printf>
    38e8:	83 c4 10             	add    $0x10,%esp
    exit();
    38eb:	e8 13 03 00 00       	call   3c03 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    38f0:	83 ec 08             	sub    $0x8,%esp
    38f3:	68 00 02 00 00       	push   $0x200
    38f8:	68 27 86 00 00       	push   $0x8627
    38fd:	e8 41 03 00 00       	call   3c43 <open>
    3902:	83 c4 10             	add    $0x10,%esp
    3905:	83 ec 0c             	sub    $0xc,%esp
    3908:	50                   	push   %eax
    3909:	e8 1d 03 00 00       	call   3c2b <close>
    390e:	83 c4 10             	add    $0x10,%esp

  bigargtest();
    3911:	e8 88 fb ff ff       	call   349e <bigargtest>
  bigwrite();
    3916:	e8 ea ea ff ff       	call   2405 <bigwrite>
  bigargtest();
    391b:	e8 7e fb ff ff       	call   349e <bigargtest>
  bsstest();
    3920:	e8 03 fb ff ff       	call   3428 <bsstest>
  sbrktest();
    3925:	e8 0e f5 ff ff       	call   2e38 <sbrktest>
  validatetest();
    392a:	e8 1b fa ff ff       	call   334a <validatetest>

  opentest();
    392f:	e8 cc c6 ff ff       	call   0 <opentest>
  writetest();
    3934:	e8 76 c7 ff ff       	call   af <writetest>
  writetest1();
    3939:	e8 81 c9 ff ff       	call   2bf <writetest1>
  createtest();
    393e:	e8 78 cb ff ff       	call   4bb <createtest>

  mem();
    3943:	e8 3e d1 ff ff       	call   a86 <mem>
  pipe1();
    3948:	e8 75 cd ff ff       	call   6c2 <pipe1>
  preempt();
    394d:	e8 59 cf ff ff       	call   8ab <preempt>
  exitwait();
    3952:	e8 b7 d0 ff ff       	call   a0e <exitwait>

  rmdot();
    3957:	e8 1b ef ff ff       	call   2877 <rmdot>
  fourteen();
    395c:	e8 ba ed ff ff       	call   271b <fourteen>
  bigfile();
    3961:	e8 9d eb ff ff       	call   2503 <bigfile>
  subdir();
    3966:	e8 56 e3 ff ff       	call   1cc1 <subdir>
  concreate();
    396b:	e8 f3 dc ff ff       	call   1663 <concreate>
  linkunlink();
    3970:	e8 9e e0 ff ff       	call   1a13 <linkunlink>
  linktest();
    3975:	e8 a7 da ff ff       	call   1421 <linktest>
  unlinkread();
    397a:	e8 e0 d8 ff ff       	call   125f <unlinkread>
  createdelete();
    397f:	e8 35 d6 ff ff       	call   fb9 <createdelete>
  twofiles();
    3984:	e8 d1 d3 ff ff       	call   d5a <twofiles>
  sharedfd();
    3989:	e8 e9 d1 ff ff       	call   b77 <sharedfd>
  dirfile();
    398e:	e8 69 f0 ff ff       	call   29fc <dirfile>
  iref();
    3993:	e8 9c f2 ff ff       	call   2c34 <iref>
  forktest();
    3998:	e8 d1 f3 ff ff       	call   2d6e <forktest>
  bigdir(); // slow
    399d:	e8 aa e1 ff ff       	call   1b4c <bigdir>

  exectest();
    39a2:	e8 c8 cc ff ff       	call   66f <exectest>

  exit();
    39a7:	e8 57 02 00 00       	call   3c03 <exit>

000039ac <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    39ac:	55                   	push   %ebp
    39ad:	89 e5                	mov    %esp,%ebp
    39af:	57                   	push   %edi
    39b0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    39b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    39b4:	8b 55 10             	mov    0x10(%ebp),%edx
    39b7:	8b 45 0c             	mov    0xc(%ebp),%eax
    39ba:	89 cb                	mov    %ecx,%ebx
    39bc:	89 df                	mov    %ebx,%edi
    39be:	89 d1                	mov    %edx,%ecx
    39c0:	fc                   	cld    
    39c1:	f3 aa                	rep stos %al,%es:(%edi)
    39c3:	89 ca                	mov    %ecx,%edx
    39c5:	89 fb                	mov    %edi,%ebx
    39c7:	89 5d 08             	mov    %ebx,0x8(%ebp)
    39ca:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    39cd:	90                   	nop
    39ce:	5b                   	pop    %ebx
    39cf:	5f                   	pop    %edi
    39d0:	5d                   	pop    %ebp
    39d1:	c3                   	ret    

000039d2 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    39d2:	55                   	push   %ebp
    39d3:	89 e5                	mov    %esp,%ebp
    39d5:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    39d8:	8b 45 08             	mov    0x8(%ebp),%eax
    39db:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    39de:	90                   	nop
    39df:	8b 45 08             	mov    0x8(%ebp),%eax
    39e2:	8d 50 01             	lea    0x1(%eax),%edx
    39e5:	89 55 08             	mov    %edx,0x8(%ebp)
    39e8:	8b 55 0c             	mov    0xc(%ebp),%edx
    39eb:	8d 4a 01             	lea    0x1(%edx),%ecx
    39ee:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    39f1:	0f b6 12             	movzbl (%edx),%edx
    39f4:	88 10                	mov    %dl,(%eax)
    39f6:	0f b6 00             	movzbl (%eax),%eax
    39f9:	84 c0                	test   %al,%al
    39fb:	75 e2                	jne    39df <strcpy+0xd>
    ;
  return os;
    39fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3a00:	c9                   	leave  
    3a01:	c3                   	ret    

00003a02 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3a02:	55                   	push   %ebp
    3a03:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3a05:	eb 08                	jmp    3a0f <strcmp+0xd>
    p++, q++;
    3a07:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3a0b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3a0f:	8b 45 08             	mov    0x8(%ebp),%eax
    3a12:	0f b6 00             	movzbl (%eax),%eax
    3a15:	84 c0                	test   %al,%al
    3a17:	74 10                	je     3a29 <strcmp+0x27>
    3a19:	8b 45 08             	mov    0x8(%ebp),%eax
    3a1c:	0f b6 10             	movzbl (%eax),%edx
    3a1f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a22:	0f b6 00             	movzbl (%eax),%eax
    3a25:	38 c2                	cmp    %al,%dl
    3a27:	74 de                	je     3a07 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3a29:	8b 45 08             	mov    0x8(%ebp),%eax
    3a2c:	0f b6 00             	movzbl (%eax),%eax
    3a2f:	0f b6 d0             	movzbl %al,%edx
    3a32:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a35:	0f b6 00             	movzbl (%eax),%eax
    3a38:	0f b6 c0             	movzbl %al,%eax
    3a3b:	29 c2                	sub    %eax,%edx
    3a3d:	89 d0                	mov    %edx,%eax
}
    3a3f:	5d                   	pop    %ebp
    3a40:	c3                   	ret    

00003a41 <strlen>:

uint
strlen(char *s)
{
    3a41:	55                   	push   %ebp
    3a42:	89 e5                	mov    %esp,%ebp
    3a44:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3a47:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3a4e:	eb 04                	jmp    3a54 <strlen+0x13>
    3a50:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3a54:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3a57:	8b 45 08             	mov    0x8(%ebp),%eax
    3a5a:	01 d0                	add    %edx,%eax
    3a5c:	0f b6 00             	movzbl (%eax),%eax
    3a5f:	84 c0                	test   %al,%al
    3a61:	75 ed                	jne    3a50 <strlen+0xf>
    ;
  return n;
    3a63:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3a66:	c9                   	leave  
    3a67:	c3                   	ret    

00003a68 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3a68:	55                   	push   %ebp
    3a69:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    3a6b:	8b 45 10             	mov    0x10(%ebp),%eax
    3a6e:	50                   	push   %eax
    3a6f:	ff 75 0c             	pushl  0xc(%ebp)
    3a72:	ff 75 08             	pushl  0x8(%ebp)
    3a75:	e8 32 ff ff ff       	call   39ac <stosb>
    3a7a:	83 c4 0c             	add    $0xc,%esp
  return dst;
    3a7d:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3a80:	c9                   	leave  
    3a81:	c3                   	ret    

00003a82 <strchr>:

char*
strchr(const char *s, char c)
{
    3a82:	55                   	push   %ebp
    3a83:	89 e5                	mov    %esp,%ebp
    3a85:	83 ec 04             	sub    $0x4,%esp
    3a88:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a8b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3a8e:	eb 14                	jmp    3aa4 <strchr+0x22>
    if(*s == c)
    3a90:	8b 45 08             	mov    0x8(%ebp),%eax
    3a93:	0f b6 00             	movzbl (%eax),%eax
    3a96:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3a99:	75 05                	jne    3aa0 <strchr+0x1e>
      return (char*)s;
    3a9b:	8b 45 08             	mov    0x8(%ebp),%eax
    3a9e:	eb 13                	jmp    3ab3 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3aa0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3aa4:	8b 45 08             	mov    0x8(%ebp),%eax
    3aa7:	0f b6 00             	movzbl (%eax),%eax
    3aaa:	84 c0                	test   %al,%al
    3aac:	75 e2                	jne    3a90 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3aae:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3ab3:	c9                   	leave  
    3ab4:	c3                   	ret    

00003ab5 <gets>:

char*
gets(char *buf, int max)
{
    3ab5:	55                   	push   %ebp
    3ab6:	89 e5                	mov    %esp,%ebp
    3ab8:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3abb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3ac2:	eb 42                	jmp    3b06 <gets+0x51>
    cc = read(0, &c, 1);
    3ac4:	83 ec 04             	sub    $0x4,%esp
    3ac7:	6a 01                	push   $0x1
    3ac9:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3acc:	50                   	push   %eax
    3acd:	6a 00                	push   $0x0
    3acf:	e8 47 01 00 00       	call   3c1b <read>
    3ad4:	83 c4 10             	add    $0x10,%esp
    3ad7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3ada:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3ade:	7e 33                	jle    3b13 <gets+0x5e>
      break;
    buf[i++] = c;
    3ae0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ae3:	8d 50 01             	lea    0x1(%eax),%edx
    3ae6:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3ae9:	89 c2                	mov    %eax,%edx
    3aeb:	8b 45 08             	mov    0x8(%ebp),%eax
    3aee:	01 c2                	add    %eax,%edx
    3af0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3af4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    3af6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3afa:	3c 0a                	cmp    $0xa,%al
    3afc:	74 16                	je     3b14 <gets+0x5f>
    3afe:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b02:	3c 0d                	cmp    $0xd,%al
    3b04:	74 0e                	je     3b14 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3b06:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b09:	83 c0 01             	add    $0x1,%eax
    3b0c:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3b0f:	7c b3                	jl     3ac4 <gets+0xf>
    3b11:	eb 01                	jmp    3b14 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    3b13:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3b14:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3b17:	8b 45 08             	mov    0x8(%ebp),%eax
    3b1a:	01 d0                	add    %edx,%eax
    3b1c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3b1f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3b22:	c9                   	leave  
    3b23:	c3                   	ret    

00003b24 <stat>:

int
stat(char *n, struct stat *st)
{
    3b24:	55                   	push   %ebp
    3b25:	89 e5                	mov    %esp,%ebp
    3b27:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3b2a:	83 ec 08             	sub    $0x8,%esp
    3b2d:	6a 00                	push   $0x0
    3b2f:	ff 75 08             	pushl  0x8(%ebp)
    3b32:	e8 0c 01 00 00       	call   3c43 <open>
    3b37:	83 c4 10             	add    $0x10,%esp
    3b3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3b3d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3b41:	79 07                	jns    3b4a <stat+0x26>
    return -1;
    3b43:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3b48:	eb 25                	jmp    3b6f <stat+0x4b>
  r = fstat(fd, st);
    3b4a:	83 ec 08             	sub    $0x8,%esp
    3b4d:	ff 75 0c             	pushl  0xc(%ebp)
    3b50:	ff 75 f4             	pushl  -0xc(%ebp)
    3b53:	e8 03 01 00 00       	call   3c5b <fstat>
    3b58:	83 c4 10             	add    $0x10,%esp
    3b5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3b5e:	83 ec 0c             	sub    $0xc,%esp
    3b61:	ff 75 f4             	pushl  -0xc(%ebp)
    3b64:	e8 c2 00 00 00       	call   3c2b <close>
    3b69:	83 c4 10             	add    $0x10,%esp
  return r;
    3b6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3b6f:	c9                   	leave  
    3b70:	c3                   	ret    

00003b71 <atoi>:

int
atoi(const char *s)
{
    3b71:	55                   	push   %ebp
    3b72:	89 e5                	mov    %esp,%ebp
    3b74:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3b77:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3b7e:	eb 25                	jmp    3ba5 <atoi+0x34>
    n = n*10 + *s++ - '0';
    3b80:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3b83:	89 d0                	mov    %edx,%eax
    3b85:	c1 e0 02             	shl    $0x2,%eax
    3b88:	01 d0                	add    %edx,%eax
    3b8a:	01 c0                	add    %eax,%eax
    3b8c:	89 c1                	mov    %eax,%ecx
    3b8e:	8b 45 08             	mov    0x8(%ebp),%eax
    3b91:	8d 50 01             	lea    0x1(%eax),%edx
    3b94:	89 55 08             	mov    %edx,0x8(%ebp)
    3b97:	0f b6 00             	movzbl (%eax),%eax
    3b9a:	0f be c0             	movsbl %al,%eax
    3b9d:	01 c8                	add    %ecx,%eax
    3b9f:	83 e8 30             	sub    $0x30,%eax
    3ba2:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3ba5:	8b 45 08             	mov    0x8(%ebp),%eax
    3ba8:	0f b6 00             	movzbl (%eax),%eax
    3bab:	3c 2f                	cmp    $0x2f,%al
    3bad:	7e 0a                	jle    3bb9 <atoi+0x48>
    3baf:	8b 45 08             	mov    0x8(%ebp),%eax
    3bb2:	0f b6 00             	movzbl (%eax),%eax
    3bb5:	3c 39                	cmp    $0x39,%al
    3bb7:	7e c7                	jle    3b80 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    3bb9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3bbc:	c9                   	leave  
    3bbd:	c3                   	ret    

00003bbe <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3bbe:	55                   	push   %ebp
    3bbf:	89 e5                	mov    %esp,%ebp
    3bc1:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3bc4:	8b 45 08             	mov    0x8(%ebp),%eax
    3bc7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3bca:	8b 45 0c             	mov    0xc(%ebp),%eax
    3bcd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3bd0:	eb 17                	jmp    3be9 <memmove+0x2b>
    *dst++ = *src++;
    3bd2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3bd5:	8d 50 01             	lea    0x1(%eax),%edx
    3bd8:	89 55 fc             	mov    %edx,-0x4(%ebp)
    3bdb:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3bde:	8d 4a 01             	lea    0x1(%edx),%ecx
    3be1:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3be4:	0f b6 12             	movzbl (%edx),%edx
    3be7:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3be9:	8b 45 10             	mov    0x10(%ebp),%eax
    3bec:	8d 50 ff             	lea    -0x1(%eax),%edx
    3bef:	89 55 10             	mov    %edx,0x10(%ebp)
    3bf2:	85 c0                	test   %eax,%eax
    3bf4:	7f dc                	jg     3bd2 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3bf6:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3bf9:	c9                   	leave  
    3bfa:	c3                   	ret    

00003bfb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3bfb:	b8 01 00 00 00       	mov    $0x1,%eax
    3c00:	cd 40                	int    $0x40
    3c02:	c3                   	ret    

00003c03 <exit>:
SYSCALL(exit)
    3c03:	b8 02 00 00 00       	mov    $0x2,%eax
    3c08:	cd 40                	int    $0x40
    3c0a:	c3                   	ret    

00003c0b <wait>:
SYSCALL(wait)
    3c0b:	b8 03 00 00 00       	mov    $0x3,%eax
    3c10:	cd 40                	int    $0x40
    3c12:	c3                   	ret    

00003c13 <pipe>:
SYSCALL(pipe)
    3c13:	b8 04 00 00 00       	mov    $0x4,%eax
    3c18:	cd 40                	int    $0x40
    3c1a:	c3                   	ret    

00003c1b <read>:
SYSCALL(read)
    3c1b:	b8 05 00 00 00       	mov    $0x5,%eax
    3c20:	cd 40                	int    $0x40
    3c22:	c3                   	ret    

00003c23 <write>:
SYSCALL(write)
    3c23:	b8 10 00 00 00       	mov    $0x10,%eax
    3c28:	cd 40                	int    $0x40
    3c2a:	c3                   	ret    

00003c2b <close>:
SYSCALL(close)
    3c2b:	b8 15 00 00 00       	mov    $0x15,%eax
    3c30:	cd 40                	int    $0x40
    3c32:	c3                   	ret    

00003c33 <kill>:
SYSCALL(kill)
    3c33:	b8 06 00 00 00       	mov    $0x6,%eax
    3c38:	cd 40                	int    $0x40
    3c3a:	c3                   	ret    

00003c3b <exec>:
SYSCALL(exec)
    3c3b:	b8 07 00 00 00       	mov    $0x7,%eax
    3c40:	cd 40                	int    $0x40
    3c42:	c3                   	ret    

00003c43 <open>:
SYSCALL(open)
    3c43:	b8 0f 00 00 00       	mov    $0xf,%eax
    3c48:	cd 40                	int    $0x40
    3c4a:	c3                   	ret    

00003c4b <mknod>:
SYSCALL(mknod)
    3c4b:	b8 11 00 00 00       	mov    $0x11,%eax
    3c50:	cd 40                	int    $0x40
    3c52:	c3                   	ret    

00003c53 <unlink>:
SYSCALL(unlink)
    3c53:	b8 12 00 00 00       	mov    $0x12,%eax
    3c58:	cd 40                	int    $0x40
    3c5a:	c3                   	ret    

00003c5b <fstat>:
SYSCALL(fstat)
    3c5b:	b8 08 00 00 00       	mov    $0x8,%eax
    3c60:	cd 40                	int    $0x40
    3c62:	c3                   	ret    

00003c63 <link>:
SYSCALL(link)
    3c63:	b8 13 00 00 00       	mov    $0x13,%eax
    3c68:	cd 40                	int    $0x40
    3c6a:	c3                   	ret    

00003c6b <mkdir>:
SYSCALL(mkdir)
    3c6b:	b8 14 00 00 00       	mov    $0x14,%eax
    3c70:	cd 40                	int    $0x40
    3c72:	c3                   	ret    

00003c73 <chdir>:
SYSCALL(chdir)
    3c73:	b8 09 00 00 00       	mov    $0x9,%eax
    3c78:	cd 40                	int    $0x40
    3c7a:	c3                   	ret    

00003c7b <dup>:
SYSCALL(dup)
    3c7b:	b8 0a 00 00 00       	mov    $0xa,%eax
    3c80:	cd 40                	int    $0x40
    3c82:	c3                   	ret    

00003c83 <getpid>:
SYSCALL(getpid)
    3c83:	b8 0b 00 00 00       	mov    $0xb,%eax
    3c88:	cd 40                	int    $0x40
    3c8a:	c3                   	ret    

00003c8b <sbrk>:
SYSCALL(sbrk)
    3c8b:	b8 0c 00 00 00       	mov    $0xc,%eax
    3c90:	cd 40                	int    $0x40
    3c92:	c3                   	ret    

00003c93 <sleep>:
SYSCALL(sleep)
    3c93:	b8 0d 00 00 00       	mov    $0xd,%eax
    3c98:	cd 40                	int    $0x40
    3c9a:	c3                   	ret    

00003c9b <uptime>:
SYSCALL(uptime)
    3c9b:	b8 0e 00 00 00       	mov    $0xe,%eax
    3ca0:	cd 40                	int    $0x40
    3ca2:	c3                   	ret    

00003ca3 <colorwrite>:

//new here
SYSCALL(colorwrite)
    3ca3:	b8 16 00 00 00       	mov    $0x16,%eax
    3ca8:	cd 40                	int    $0x40
    3caa:	c3                   	ret    

00003cab <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3cab:	55                   	push   %ebp
    3cac:	89 e5                	mov    %esp,%ebp
    3cae:	83 ec 18             	sub    $0x18,%esp
    3cb1:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cb4:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3cb7:	83 ec 04             	sub    $0x4,%esp
    3cba:	6a 01                	push   $0x1
    3cbc:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3cbf:	50                   	push   %eax
    3cc0:	ff 75 08             	pushl  0x8(%ebp)
    3cc3:	e8 5b ff ff ff       	call   3c23 <write>
    3cc8:	83 c4 10             	add    $0x10,%esp
}
    3ccb:	90                   	nop
    3ccc:	c9                   	leave  
    3ccd:	c3                   	ret    

00003cce <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3cce:	55                   	push   %ebp
    3ccf:	89 e5                	mov    %esp,%ebp
    3cd1:	53                   	push   %ebx
    3cd2:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3cd5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3cdc:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3ce0:	74 17                	je     3cf9 <printint+0x2b>
    3ce2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3ce6:	79 11                	jns    3cf9 <printint+0x2b>
    neg = 1;
    3ce8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3cef:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cf2:	f7 d8                	neg    %eax
    3cf4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3cf7:	eb 06                	jmp    3cff <printint+0x31>
  } else {
    x = xx;
    3cf9:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cfc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    3cff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    3d06:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3d09:	8d 41 01             	lea    0x1(%ecx),%eax
    3d0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3d0f:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3d12:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d15:	ba 00 00 00 00       	mov    $0x0,%edx
    3d1a:	f7 f3                	div    %ebx
    3d1c:	89 d0                	mov    %edx,%eax
    3d1e:	0f b6 80 bc 96 00 00 	movzbl 0x96bc(%eax),%eax
    3d25:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    3d29:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3d2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d2f:	ba 00 00 00 00       	mov    $0x0,%edx
    3d34:	f7 f3                	div    %ebx
    3d36:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3d39:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3d3d:	75 c7                	jne    3d06 <printint+0x38>
  if(neg)
    3d3f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3d43:	74 2d                	je     3d72 <printint+0xa4>
    buf[i++] = '-';
    3d45:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d48:	8d 50 01             	lea    0x1(%eax),%edx
    3d4b:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3d4e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    3d53:	eb 1d                	jmp    3d72 <printint+0xa4>
    putc(fd, buf[i]);
    3d55:	8d 55 dc             	lea    -0x24(%ebp),%edx
    3d58:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d5b:	01 d0                	add    %edx,%eax
    3d5d:	0f b6 00             	movzbl (%eax),%eax
    3d60:	0f be c0             	movsbl %al,%eax
    3d63:	83 ec 08             	sub    $0x8,%esp
    3d66:	50                   	push   %eax
    3d67:	ff 75 08             	pushl  0x8(%ebp)
    3d6a:	e8 3c ff ff ff       	call   3cab <putc>
    3d6f:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3d72:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3d76:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3d7a:	79 d9                	jns    3d55 <printint+0x87>
    putc(fd, buf[i]);
}
    3d7c:	90                   	nop
    3d7d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3d80:	c9                   	leave  
    3d81:	c3                   	ret    

00003d82 <getInteger>:

static int getInteger(double num)
{
    3d82:	55                   	push   %ebp
    3d83:	89 e5                	mov    %esp,%ebp
    3d85:	83 ec 18             	sub    $0x18,%esp
    3d88:	8b 45 08             	mov    0x8(%ebp),%eax
    3d8b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3d8e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d91:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    3d94:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    3d9b:	eb 0e                	jmp    3dab <getInteger+0x29>
  {
    num -= 1;
    3d9d:	dd 45 e8             	fldl   -0x18(%ebp)
    3da0:	d9 e8                	fld1   
    3da2:	de e9                	fsubrp %st,%st(1)
    3da4:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    3da7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    3dab:	dd 45 e8             	fldl   -0x18(%ebp)
    3dae:	d9 e8                	fld1   
    3db0:	d9 c9                	fxch   %st(1)
    3db2:	df e9                	fucomip %st(1),%st
    3db4:	dd d8                	fstp   %st(0)
    3db6:	77 e5                	ja     3d9d <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    3db8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3dbb:	c9                   	leave  
    3dbc:	c3                   	ret    

00003dbd <printdbl>:

void printdbl(int fd, double num)
{
    3dbd:	55                   	push   %ebp
    3dbe:	89 e5                	mov    %esp,%ebp
    3dc0:	83 ec 28             	sub    $0x28,%esp
    3dc3:	8b 45 0c             	mov    0xc(%ebp),%eax
    3dc6:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3dc9:	8b 45 10             	mov    0x10(%ebp),%eax
    3dcc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    3dcf:	d9 ee                	fldz   
    3dd1:	dd 45 e0             	fldl   -0x20(%ebp)
    3dd4:	d9 c9                	fxch   %st(1)
    3dd6:	df e9                	fucomip %st(1),%st
    3dd8:	dd d8                	fstp   %st(0)
    3dda:	76 18                	jbe    3df4 <printdbl+0x37>
  {
    putc(fd,'-');
    3ddc:	83 ec 08             	sub    $0x8,%esp
    3ddf:	6a 2d                	push   $0x2d
    3de1:	ff 75 08             	pushl  0x8(%ebp)
    3de4:	e8 c2 fe ff ff       	call   3cab <putc>
    3de9:	83 c4 10             	add    $0x10,%esp
    num = -num;
    3dec:	dd 45 e0             	fldl   -0x20(%ebp)
    3def:	d9 e0                	fchs   
    3df1:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    3df4:	83 ec 08             	sub    $0x8,%esp
    3df7:	ff 75 e4             	pushl  -0x1c(%ebp)
    3dfa:	ff 75 e0             	pushl  -0x20(%ebp)
    3dfd:	e8 80 ff ff ff       	call   3d82 <getInteger>
    3e02:	83 c4 10             	add    $0x10,%esp
    3e05:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printint(fd,integer,10,1);
    3e08:	6a 01                	push   $0x1
    3e0a:	6a 0a                	push   $0xa
    3e0c:	ff 75 f0             	pushl  -0x10(%ebp)
    3e0f:	ff 75 08             	pushl  0x8(%ebp)
    3e12:	e8 b7 fe ff ff       	call   3cce <printint>
    3e17:	83 c4 10             	add    $0x10,%esp
  num -= integer;
    3e1a:	db 45 f0             	fildl  -0x10(%ebp)
    3e1d:	dd 45 e0             	fldl   -0x20(%ebp)
    3e20:	de e1                	fsubp  %st,%st(1)
    3e22:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    3e25:	dd 45 e0             	fldl   -0x20(%ebp)
    3e28:	dd 05 70 86 00 00    	fldl   0x8670
    3e2e:	d9 c9                	fxch   %st(1)
    3e30:	df e9                	fucomip %st(1),%st
    3e32:	dd d8                	fstp   %st(0)
    3e34:	76 10                	jbe    3e46 <printdbl+0x89>
    putc(fd,'.');
    3e36:	83 ec 08             	sub    $0x8,%esp
    3e39:	6a 2e                	push   $0x2e
    3e3b:	ff 75 08             	pushl  0x8(%ebp)
    3e3e:	e8 68 fe ff ff       	call   3cab <putc>
    3e43:	83 c4 10             	add    $0x10,%esp
  int digits = 0;
    3e46:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    3e4d:	eb 49                	jmp    3e98 <printdbl+0xdb>
  {
    num = num*10;
    3e4f:	dd 45 e0             	fldl   -0x20(%ebp)
    3e52:	dd 05 78 86 00 00    	fldl   0x8678
    3e58:	de c9                	fmulp  %st,%st(1)
    3e5a:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    3e5d:	83 ec 08             	sub    $0x8,%esp
    3e60:	ff 75 e4             	pushl  -0x1c(%ebp)
    3e63:	ff 75 e0             	pushl  -0x20(%ebp)
    3e66:	e8 17 ff ff ff       	call   3d82 <getInteger>
    3e6b:	83 c4 10             	add    $0x10,%esp
    3e6e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printint(fd,integer,10,1);
    3e71:	6a 01                	push   $0x1
    3e73:	6a 0a                	push   $0xa
    3e75:	ff 75 f0             	pushl  -0x10(%ebp)
    3e78:	ff 75 08             	pushl  0x8(%ebp)
    3e7b:	e8 4e fe ff ff       	call   3cce <printint>
    3e80:	83 c4 10             	add    $0x10,%esp
    num -= integer;
    3e83:	db 45 f0             	fildl  -0x10(%ebp)
    3e86:	dd 45 e0             	fldl   -0x20(%ebp)
    3e89:	de e1                	fsubp  %st,%st(1)
    3e8b:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    3e8e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    3e92:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    3e96:	7f 13                	jg     3eab <printdbl+0xee>
  printint(fd,integer,10,1);
  num -= integer;
  if(num > 1e-6)
    putc(fd,'.');
  int digits = 0;
  while(num > 1e-6)
    3e98:	dd 45 e0             	fldl   -0x20(%ebp)
    3e9b:	dd 05 70 86 00 00    	fldl   0x8670
    3ea1:	d9 c9                	fxch   %st(1)
    3ea3:	df e9                	fucomip %st(1),%st
    3ea5:	dd d8                	fstp   %st(0)
    3ea7:	77 a6                	ja     3e4f <printdbl+0x92>
    if(digits > 6)
    {
      break;
    }
  }
}
    3ea9:	eb 01                	jmp    3eac <printdbl+0xef>
    printint(fd,integer,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    3eab:	90                   	nop
    }
  }
}
    3eac:	90                   	nop
    3ead:	c9                   	leave  
    3eae:	c3                   	ret    

00003eaf <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// add %f for double
void
printf(int fd, char *fmt, ...)
{
    3eaf:	55                   	push   %ebp
    3eb0:	89 e5                	mov    %esp,%ebp
    3eb2:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3eb5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    3ebc:	8d 45 0c             	lea    0xc(%ebp),%eax
    3ebf:	83 c0 04             	add    $0x4,%eax
    3ec2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    3ec5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3ecc:	e9 88 01 00 00       	jmp    4059 <printf+0x1aa>
    c = fmt[i] & 0xff;
    3ed1:	8b 55 0c             	mov    0xc(%ebp),%edx
    3ed4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ed7:	01 d0                	add    %edx,%eax
    3ed9:	0f b6 00             	movzbl (%eax),%eax
    3edc:	0f be c0             	movsbl %al,%eax
    3edf:	25 ff 00 00 00       	and    $0xff,%eax
    3ee4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    3ee7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3eeb:	75 2c                	jne    3f19 <printf+0x6a>
      if(c == '%'){
    3eed:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3ef1:	75 0c                	jne    3eff <printf+0x50>
        state = '%';
    3ef3:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    3efa:	e9 56 01 00 00       	jmp    4055 <printf+0x1a6>
      } else {
        putc(fd, c);
    3eff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f02:	0f be c0             	movsbl %al,%eax
    3f05:	83 ec 08             	sub    $0x8,%esp
    3f08:	50                   	push   %eax
    3f09:	ff 75 08             	pushl  0x8(%ebp)
    3f0c:	e8 9a fd ff ff       	call   3cab <putc>
    3f11:	83 c4 10             	add    $0x10,%esp
    3f14:	e9 3c 01 00 00       	jmp    4055 <printf+0x1a6>
      }
    } else if(state == '%'){
    3f19:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    3f1d:	0f 85 32 01 00 00    	jne    4055 <printf+0x1a6>
      if(c == 'd'){
    3f23:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    3f27:	75 1e                	jne    3f47 <printf+0x98>
        printint(fd, *ap, 10, 1);
    3f29:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f2c:	8b 00                	mov    (%eax),%eax
    3f2e:	6a 01                	push   $0x1
    3f30:	6a 0a                	push   $0xa
    3f32:	50                   	push   %eax
    3f33:	ff 75 08             	pushl  0x8(%ebp)
    3f36:	e8 93 fd ff ff       	call   3cce <printint>
    3f3b:	83 c4 10             	add    $0x10,%esp
        ap++;
    3f3e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3f42:	e9 07 01 00 00       	jmp    404e <printf+0x19f>
      } else if(c == 'x' || c == 'p'){
    3f47:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3f4b:	74 06                	je     3f53 <printf+0xa4>
    3f4d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    3f51:	75 1e                	jne    3f71 <printf+0xc2>
        printint(fd, *ap, 16, 0);
    3f53:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f56:	8b 00                	mov    (%eax),%eax
    3f58:	6a 00                	push   $0x0
    3f5a:	6a 10                	push   $0x10
    3f5c:	50                   	push   %eax
    3f5d:	ff 75 08             	pushl  0x8(%ebp)
    3f60:	e8 69 fd ff ff       	call   3cce <printint>
    3f65:	83 c4 10             	add    $0x10,%esp
        ap++;
    3f68:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3f6c:	e9 dd 00 00 00       	jmp    404e <printf+0x19f>
      } else if(c == 's'){
    3f71:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    3f75:	75 46                	jne    3fbd <printf+0x10e>
        s = (char*)*ap;
    3f77:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f7a:	8b 00                	mov    (%eax),%eax
    3f7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    3f7f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    3f83:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3f87:	75 25                	jne    3fae <printf+0xff>
          s = "(null)";
    3f89:	c7 45 f4 68 86 00 00 	movl   $0x8668,-0xc(%ebp)
        while(*s != 0){
    3f90:	eb 1c                	jmp    3fae <printf+0xff>
          putc(fd, *s);
    3f92:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f95:	0f b6 00             	movzbl (%eax),%eax
    3f98:	0f be c0             	movsbl %al,%eax
    3f9b:	83 ec 08             	sub    $0x8,%esp
    3f9e:	50                   	push   %eax
    3f9f:	ff 75 08             	pushl  0x8(%ebp)
    3fa2:	e8 04 fd ff ff       	call   3cab <putc>
    3fa7:	83 c4 10             	add    $0x10,%esp
          s++;
    3faa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3fae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fb1:	0f b6 00             	movzbl (%eax),%eax
    3fb4:	84 c0                	test   %al,%al
    3fb6:	75 da                	jne    3f92 <printf+0xe3>
    3fb8:	e9 91 00 00 00       	jmp    404e <printf+0x19f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3fbd:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    3fc1:	75 1d                	jne    3fe0 <printf+0x131>
        putc(fd, *ap);
    3fc3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3fc6:	8b 00                	mov    (%eax),%eax
    3fc8:	0f be c0             	movsbl %al,%eax
    3fcb:	83 ec 08             	sub    $0x8,%esp
    3fce:	50                   	push   %eax
    3fcf:	ff 75 08             	pushl  0x8(%ebp)
    3fd2:	e8 d4 fc ff ff       	call   3cab <putc>
    3fd7:	83 c4 10             	add    $0x10,%esp
        ap++;
    3fda:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3fde:	eb 6e                	jmp    404e <printf+0x19f>
      } else if(c == '%'){
    3fe0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3fe4:	75 17                	jne    3ffd <printf+0x14e>
        putc(fd, c);
    3fe6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3fe9:	0f be c0             	movsbl %al,%eax
    3fec:	83 ec 08             	sub    $0x8,%esp
    3fef:	50                   	push   %eax
    3ff0:	ff 75 08             	pushl  0x8(%ebp)
    3ff3:	e8 b3 fc ff ff       	call   3cab <putc>
    3ff8:	83 c4 10             	add    $0x10,%esp
    3ffb:	eb 51                	jmp    404e <printf+0x19f>
      } else if(c == 'f'){ //for double
    3ffd:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    4001:	75 26                	jne    4029 <printf+0x17a>
        double *dap = (double*)ap;
    4003:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4006:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printdbl(fd,*dap);
    4009:	8b 45 e0             	mov    -0x20(%ebp),%eax
    400c:	dd 00                	fldl   (%eax)
    400e:	83 ec 04             	sub    $0x4,%esp
    4011:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4015:	dd 1c 24             	fstpl  (%esp)
    4018:	ff 75 08             	pushl  0x8(%ebp)
    401b:	e8 9d fd ff ff       	call   3dbd <printdbl>
    4020:	83 c4 10             	add    $0x10,%esp
        ap += 2;
    4023:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    4027:	eb 25                	jmp    404e <printf+0x19f>
      }
      else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    4029:	83 ec 08             	sub    $0x8,%esp
    402c:	6a 25                	push   $0x25
    402e:	ff 75 08             	pushl  0x8(%ebp)
    4031:	e8 75 fc ff ff       	call   3cab <putc>
    4036:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    4039:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    403c:	0f be c0             	movsbl %al,%eax
    403f:	83 ec 08             	sub    $0x8,%esp
    4042:	50                   	push   %eax
    4043:	ff 75 08             	pushl  0x8(%ebp)
    4046:	e8 60 fc ff ff       	call   3cab <putc>
    404b:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    404e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4055:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4059:	8b 55 0c             	mov    0xc(%ebp),%edx
    405c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    405f:	01 d0                	add    %edx,%eax
    4061:	0f b6 00             	movzbl (%eax),%eax
    4064:	84 c0                	test   %al,%al
    4066:	0f 85 65 fe ff ff    	jne    3ed1 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    406c:	90                   	nop
    406d:	c9                   	leave  
    406e:	c3                   	ret    

0000406f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    406f:	55                   	push   %ebp
    4070:	89 e5                	mov    %esp,%ebp
    4072:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4075:	8b 45 08             	mov    0x8(%ebp),%eax
    4078:	83 e8 08             	sub    $0x8,%eax
    407b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    407e:	a1 88 98 00 00       	mov    0x9888,%eax
    4083:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4086:	eb 24                	jmp    40ac <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4088:	8b 45 fc             	mov    -0x4(%ebp),%eax
    408b:	8b 00                	mov    (%eax),%eax
    408d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4090:	77 12                	ja     40a4 <free+0x35>
    4092:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4095:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4098:	77 24                	ja     40be <free+0x4f>
    409a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    409d:	8b 00                	mov    (%eax),%eax
    409f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    40a2:	77 1a                	ja     40be <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    40a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40a7:	8b 00                	mov    (%eax),%eax
    40a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    40ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40af:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    40b2:	76 d4                	jbe    4088 <free+0x19>
    40b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40b7:	8b 00                	mov    (%eax),%eax
    40b9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    40bc:	76 ca                	jbe    4088 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    40be:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40c1:	8b 40 04             	mov    0x4(%eax),%eax
    40c4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    40cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40ce:	01 c2                	add    %eax,%edx
    40d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40d3:	8b 00                	mov    (%eax),%eax
    40d5:	39 c2                	cmp    %eax,%edx
    40d7:	75 24                	jne    40fd <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    40d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40dc:	8b 50 04             	mov    0x4(%eax),%edx
    40df:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40e2:	8b 00                	mov    (%eax),%eax
    40e4:	8b 40 04             	mov    0x4(%eax),%eax
    40e7:	01 c2                	add    %eax,%edx
    40e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40ec:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    40ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40f2:	8b 00                	mov    (%eax),%eax
    40f4:	8b 10                	mov    (%eax),%edx
    40f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40f9:	89 10                	mov    %edx,(%eax)
    40fb:	eb 0a                	jmp    4107 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    40fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4100:	8b 10                	mov    (%eax),%edx
    4102:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4105:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    4107:	8b 45 fc             	mov    -0x4(%ebp),%eax
    410a:	8b 40 04             	mov    0x4(%eax),%eax
    410d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4114:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4117:	01 d0                	add    %edx,%eax
    4119:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    411c:	75 20                	jne    413e <free+0xcf>
    p->s.size += bp->s.size;
    411e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4121:	8b 50 04             	mov    0x4(%eax),%edx
    4124:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4127:	8b 40 04             	mov    0x4(%eax),%eax
    412a:	01 c2                	add    %eax,%edx
    412c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    412f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4132:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4135:	8b 10                	mov    (%eax),%edx
    4137:	8b 45 fc             	mov    -0x4(%ebp),%eax
    413a:	89 10                	mov    %edx,(%eax)
    413c:	eb 08                	jmp    4146 <free+0xd7>
  } else
    p->s.ptr = bp;
    413e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4141:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4144:	89 10                	mov    %edx,(%eax)
  freep = p;
    4146:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4149:	a3 88 98 00 00       	mov    %eax,0x9888
}
    414e:	90                   	nop
    414f:	c9                   	leave  
    4150:	c3                   	ret    

00004151 <morecore>:

static Header*
morecore(uint nu)
{
    4151:	55                   	push   %ebp
    4152:	89 e5                	mov    %esp,%ebp
    4154:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    4157:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    415e:	77 07                	ja     4167 <morecore+0x16>
    nu = 4096;
    4160:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4167:	8b 45 08             	mov    0x8(%ebp),%eax
    416a:	c1 e0 03             	shl    $0x3,%eax
    416d:	83 ec 0c             	sub    $0xc,%esp
    4170:	50                   	push   %eax
    4171:	e8 15 fb ff ff       	call   3c8b <sbrk>
    4176:	83 c4 10             	add    $0x10,%esp
    4179:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    417c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4180:	75 07                	jne    4189 <morecore+0x38>
    return 0;
    4182:	b8 00 00 00 00       	mov    $0x0,%eax
    4187:	eb 26                	jmp    41af <morecore+0x5e>
  hp = (Header*)p;
    4189:	8b 45 f4             	mov    -0xc(%ebp),%eax
    418c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    418f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4192:	8b 55 08             	mov    0x8(%ebp),%edx
    4195:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    4198:	8b 45 f0             	mov    -0x10(%ebp),%eax
    419b:	83 c0 08             	add    $0x8,%eax
    419e:	83 ec 0c             	sub    $0xc,%esp
    41a1:	50                   	push   %eax
    41a2:	e8 c8 fe ff ff       	call   406f <free>
    41a7:	83 c4 10             	add    $0x10,%esp
  return freep;
    41aa:	a1 88 98 00 00       	mov    0x9888,%eax
}
    41af:	c9                   	leave  
    41b0:	c3                   	ret    

000041b1 <malloc>:

void*
malloc(uint nbytes)
{
    41b1:	55                   	push   %ebp
    41b2:	89 e5                	mov    %esp,%ebp
    41b4:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    41b7:	8b 45 08             	mov    0x8(%ebp),%eax
    41ba:	83 c0 07             	add    $0x7,%eax
    41bd:	c1 e8 03             	shr    $0x3,%eax
    41c0:	83 c0 01             	add    $0x1,%eax
    41c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    41c6:	a1 88 98 00 00       	mov    0x9888,%eax
    41cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    41ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    41d2:	75 23                	jne    41f7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    41d4:	c7 45 f0 80 98 00 00 	movl   $0x9880,-0x10(%ebp)
    41db:	8b 45 f0             	mov    -0x10(%ebp),%eax
    41de:	a3 88 98 00 00       	mov    %eax,0x9888
    41e3:	a1 88 98 00 00       	mov    0x9888,%eax
    41e8:	a3 80 98 00 00       	mov    %eax,0x9880
    base.s.size = 0;
    41ed:	c7 05 84 98 00 00 00 	movl   $0x0,0x9884
    41f4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    41f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    41fa:	8b 00                	mov    (%eax),%eax
    41fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    41ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4202:	8b 40 04             	mov    0x4(%eax),%eax
    4205:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4208:	72 4d                	jb     4257 <malloc+0xa6>
      if(p->s.size == nunits)
    420a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    420d:	8b 40 04             	mov    0x4(%eax),%eax
    4210:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4213:	75 0c                	jne    4221 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    4215:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4218:	8b 10                	mov    (%eax),%edx
    421a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    421d:	89 10                	mov    %edx,(%eax)
    421f:	eb 26                	jmp    4247 <malloc+0x96>
      else {
        p->s.size -= nunits;
    4221:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4224:	8b 40 04             	mov    0x4(%eax),%eax
    4227:	2b 45 ec             	sub    -0x14(%ebp),%eax
    422a:	89 c2                	mov    %eax,%edx
    422c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    422f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    4232:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4235:	8b 40 04             	mov    0x4(%eax),%eax
    4238:	c1 e0 03             	shl    $0x3,%eax
    423b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    423e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4241:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4244:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    4247:	8b 45 f0             	mov    -0x10(%ebp),%eax
    424a:	a3 88 98 00 00       	mov    %eax,0x9888
      return (void*)(p + 1);
    424f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4252:	83 c0 08             	add    $0x8,%eax
    4255:	eb 3b                	jmp    4292 <malloc+0xe1>
    }
    if(p == freep)
    4257:	a1 88 98 00 00       	mov    0x9888,%eax
    425c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    425f:	75 1e                	jne    427f <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    4261:	83 ec 0c             	sub    $0xc,%esp
    4264:	ff 75 ec             	pushl  -0x14(%ebp)
    4267:	e8 e5 fe ff ff       	call   4151 <morecore>
    426c:	83 c4 10             	add    $0x10,%esp
    426f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4272:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4276:	75 07                	jne    427f <malloc+0xce>
        return 0;
    4278:	b8 00 00 00 00       	mov    $0x0,%eax
    427d:	eb 13                	jmp    4292 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    427f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4282:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4285:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4288:	8b 00                	mov    (%eax),%eax
    428a:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    428d:	e9 6d ff ff ff       	jmp    41ff <malloc+0x4e>
}
    4292:	c9                   	leave  
    4293:	c3                   	ret    

00004294 <panic1>:
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
    4294:	55                   	push   %ebp
    4295:	89 e5                	mov    %esp,%ebp
    4297:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
    429a:	83 ec 04             	sub    $0x4,%esp
    429d:	ff 75 08             	pushl  0x8(%ebp)
    42a0:	68 80 86 00 00       	push   $0x8680
    42a5:	6a 02                	push   $0x2
    42a7:	e8 03 fc ff ff       	call   3eaf <printf>
    42ac:	83 c4 10             	add    $0x10,%esp
  exit();
    42af:	e8 4f f9 ff ff       	call   3c03 <exit>

000042b4 <getInteger>:
}

static int getInteger(double num)
{
    42b4:	55                   	push   %ebp
    42b5:	89 e5                	mov    %esp,%ebp
    42b7:	83 ec 18             	sub    $0x18,%esp
    42ba:	8b 45 08             	mov    0x8(%ebp),%eax
    42bd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    42c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    42c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    42c6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    42cd:	eb 0e                	jmp    42dd <getInteger+0x29>
  {
    num -= 1;
    42cf:	dd 45 e8             	fldl   -0x18(%ebp)
    42d2:	d9 e8                	fld1   
    42d4:	de e9                	fsubrp %st,%st(1)
    42d6:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    42d9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    42dd:	dd 45 e8             	fldl   -0x18(%ebp)
    42e0:	d9 e8                	fld1   
    42e2:	d9 c9                	fxch   %st(1)
    42e4:	df e9                	fucomip %st(1),%st
    42e6:	dd d8                	fstp   %st(0)
    42e8:	77 e5                	ja     42cf <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    42ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    42ed:	c9                   	leave  
    42ee:	c3                   	ret    

000042ef <int2str>:

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
    42ef:	55                   	push   %ebp
    42f0:	89 e5                	mov    %esp,%ebp
    42f2:	53                   	push   %ebx
    42f3:	83 ec 20             	sub    $0x20,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    42f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(sgn && num < 0){
    42fd:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
    4301:	74 17                	je     431a <int2str+0x2b>
    4303:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4307:	79 11                	jns    431a <int2str+0x2b>
    neg = 1;
    4309:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    x = -num;
    4310:	8b 45 0c             	mov    0xc(%ebp),%eax
    4313:	f7 d8                	neg    %eax
    4315:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4318:	eb 06                	jmp    4320 <int2str+0x31>
  } else {
    x = num;
    431a:	8b 45 0c             	mov    0xc(%ebp),%eax
    431d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  }

  i = 0;
    4320:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  do{
    buf[i++] = digits[x % base];
    4327:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    432a:	8d 41 01             	lea    0x1(%ecx),%eax
    432d:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4330:	8b 5d 14             	mov    0x14(%ebp),%ebx
    4333:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4336:	ba 00 00 00 00       	mov    $0x0,%edx
    433b:	f7 f3                	div    %ebx
    433d:	89 d0                	mov    %edx,%eax
    433f:	0f b6 80 d0 96 00 00 	movzbl 0x96d0(%eax),%eax
    4346:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
    434a:	8b 5d 14             	mov    0x14(%ebp),%ebx
    434d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4350:	ba 00 00 00 00       	mov    $0x0,%edx
    4355:	f7 f3                	div    %ebx
    4357:	89 45 f0             	mov    %eax,-0x10(%ebp)
    435a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    435e:	75 c7                	jne    4327 <int2str+0x38>
  if(neg)
    4360:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4364:	74 36                	je     439c <int2str+0xad>
    buf[i++] = '-';
    4366:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4369:	8d 50 01             	lea    0x1(%eax),%edx
    436c:	89 55 f8             	mov    %edx,-0x8(%ebp)
    436f:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
    4374:	eb 26                	jmp    439c <int2str+0xad>
  {
    inbuf[*pos] = buf[i];
    4376:	8b 45 10             	mov    0x10(%ebp),%eax
    4379:	8b 00                	mov    (%eax),%eax
    437b:	89 c2                	mov    %eax,%edx
    437d:	8b 45 08             	mov    0x8(%ebp),%eax
    4380:	01 c2                	add    %eax,%edx
    4382:	8d 4d e0             	lea    -0x20(%ebp),%ecx
    4385:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4388:	01 c8                	add    %ecx,%eax
    438a:	0f b6 00             	movzbl (%eax),%eax
    438d:	88 02                	mov    %al,(%edx)
    (*pos)++;
    438f:	8b 45 10             	mov    0x10(%ebp),%eax
    4392:	8b 00                	mov    (%eax),%eax
    4394:	8d 50 01             	lea    0x1(%eax),%edx
    4397:	8b 45 10             	mov    0x10(%ebp),%eax
    439a:	89 10                	mov    %edx,(%eax)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    439c:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
    43a0:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    43a4:	79 d0                	jns    4376 <int2str+0x87>
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}
    43a6:	90                   	nop
    43a7:	83 c4 20             	add    $0x20,%esp
    43aa:	5b                   	pop    %ebx
    43ab:	5d                   	pop    %ebp
    43ac:	c3                   	ret    

000043ad <double2str>:

void double2str(char *buf, double num, int *pos)
{
    43ad:	55                   	push   %ebp
    43ae:	89 e5                	mov    %esp,%ebp
    43b0:	83 ec 18             	sub    $0x18,%esp
    43b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    43b6:	89 45 e8             	mov    %eax,-0x18(%ebp)
    43b9:	8b 45 10             	mov    0x10(%ebp),%eax
    43bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(num < 0)
    43bf:	d9 ee                	fldz   
    43c1:	dd 45 e8             	fldl   -0x18(%ebp)
    43c4:	d9 c9                	fxch   %st(1)
    43c6:	df e9                	fucomip %st(1),%st
    43c8:	dd d8                	fstp   %st(0)
    43ca:	76 24                	jbe    43f0 <double2str+0x43>
  {
    buf[*pos] = '-';
    43cc:	8b 45 14             	mov    0x14(%ebp),%eax
    43cf:	8b 00                	mov    (%eax),%eax
    43d1:	89 c2                	mov    %eax,%edx
    43d3:	8b 45 08             	mov    0x8(%ebp),%eax
    43d6:	01 d0                	add    %edx,%eax
    43d8:	c6 00 2d             	movb   $0x2d,(%eax)
    (*pos)++;
    43db:	8b 45 14             	mov    0x14(%ebp),%eax
    43de:	8b 00                	mov    (%eax),%eax
    43e0:	8d 50 01             	lea    0x1(%eax),%edx
    43e3:	8b 45 14             	mov    0x14(%ebp),%eax
    43e6:	89 10                	mov    %edx,(%eax)
    num = -num;
    43e8:	dd 45 e8             	fldl   -0x18(%ebp)
    43eb:	d9 e0                	fchs   
    43ed:	dd 5d e8             	fstpl  -0x18(%ebp)
  }
  int integer = getInteger(num);
    43f0:	ff 75 ec             	pushl  -0x14(%ebp)
    43f3:	ff 75 e8             	pushl  -0x18(%ebp)
    43f6:	e8 b9 fe ff ff       	call   42b4 <getInteger>
    43fb:	83 c4 08             	add    $0x8,%esp
    43fe:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int2str(buf,integer,pos,10,1);
    4401:	83 ec 04             	sub    $0x4,%esp
    4404:	6a 01                	push   $0x1
    4406:	6a 0a                	push   $0xa
    4408:	ff 75 14             	pushl  0x14(%ebp)
    440b:	ff 75 f8             	pushl  -0x8(%ebp)
    440e:	ff 75 08             	pushl  0x8(%ebp)
    4411:	e8 d9 fe ff ff       	call   42ef <int2str>
    4416:	83 c4 18             	add    $0x18,%esp
  num -= integer;
    4419:	db 45 f8             	fildl  -0x8(%ebp)
    441c:	dd 45 e8             	fldl   -0x18(%ebp)
    441f:	de e1                	fsubp  %st,%st(1)
    4421:	dd 5d e8             	fstpl  -0x18(%ebp)
  if(num > 1e-6)
    4424:	dd 45 e8             	fldl   -0x18(%ebp)
    4427:	dd 05 88 86 00 00    	fldl   0x8688
    442d:	d9 c9                	fxch   %st(1)
    442f:	df e9                	fucomip %st(1),%st
    4431:	dd d8                	fstp   %st(0)
    4433:	76 1c                	jbe    4451 <double2str+0xa4>
  {
    buf[*pos] = '.';
    4435:	8b 45 14             	mov    0x14(%ebp),%eax
    4438:	8b 00                	mov    (%eax),%eax
    443a:	89 c2                	mov    %eax,%edx
    443c:	8b 45 08             	mov    0x8(%ebp),%eax
    443f:	01 d0                	add    %edx,%eax
    4441:	c6 00 2e             	movb   $0x2e,(%eax)
    (*pos)++;
    4444:	8b 45 14             	mov    0x14(%ebp),%eax
    4447:	8b 00                	mov    (%eax),%eax
    4449:	8d 50 01             	lea    0x1(%eax),%edx
    444c:	8b 45 14             	mov    0x14(%ebp),%eax
    444f:	89 10                	mov    %edx,(%eax)
  }
  int digits = 0;
    4451:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1e-6)
    4458:	eb 4c                	jmp    44a6 <double2str+0xf9>
  {
    num = num*10;
    445a:	dd 45 e8             	fldl   -0x18(%ebp)
    445d:	dd 05 90 86 00 00    	fldl   0x8690
    4463:	de c9                	fmulp  %st,%st(1)
    4465:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer = getInteger(num);
    4468:	ff 75 ec             	pushl  -0x14(%ebp)
    446b:	ff 75 e8             	pushl  -0x18(%ebp)
    446e:	e8 41 fe ff ff       	call   42b4 <getInteger>
    4473:	83 c4 08             	add    $0x8,%esp
    4476:	89 45 f8             	mov    %eax,-0x8(%ebp)
    int2str(buf,integer,pos,10,1);
    4479:	83 ec 04             	sub    $0x4,%esp
    447c:	6a 01                	push   $0x1
    447e:	6a 0a                	push   $0xa
    4480:	ff 75 14             	pushl  0x14(%ebp)
    4483:	ff 75 f8             	pushl  -0x8(%ebp)
    4486:	ff 75 08             	pushl  0x8(%ebp)
    4489:	e8 61 fe ff ff       	call   42ef <int2str>
    448e:	83 c4 18             	add    $0x18,%esp
    num -= integer;
    4491:	db 45 f8             	fildl  -0x8(%ebp)
    4494:	dd 45 e8             	fldl   -0x18(%ebp)
    4497:	de e1                	fsubp  %st,%st(1)
    4499:	dd 5d e8             	fstpl  -0x18(%ebp)
    digits++;
    449c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    if(digits > 6)
    44a0:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
    44a4:	7f 13                	jg     44b9 <double2str+0x10c>
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
    44a6:	dd 45 e8             	fldl   -0x18(%ebp)
    44a9:	dd 05 88 86 00 00    	fldl   0x8688
    44af:	d9 c9                	fxch   %st(1)
    44b1:	df e9                	fucomip %st(1),%st
    44b3:	dd d8                	fstp   %st(0)
    44b5:	77 a3                	ja     445a <double2str+0xad>
    if(digits > 6)
    {
      break;
    }
  }
}
    44b7:	eb 01                	jmp    44ba <double2str+0x10d>
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    44b9:	90                   	nop
    }
  }
}
    44ba:	90                   	nop
    44bb:	c9                   	leave  
    44bc:	c3                   	ret    

000044bd <pow>:

double pow(double opnd, int power)
{
    44bd:	55                   	push   %ebp
    44be:	89 e5                	mov    %esp,%ebp
    44c0:	83 ec 18             	sub    $0x18,%esp
    44c3:	8b 45 08             	mov    0x8(%ebp),%eax
    44c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
    44c9:	8b 45 0c             	mov    0xc(%ebp),%eax
    44cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  double result = 1;
    44cf:	d9 e8                	fld1   
    44d1:	dd 5d f8             	fstpl  -0x8(%ebp)
  while(power > 0)
    44d4:	eb 0d                	jmp    44e3 <pow+0x26>
  {
    result *= opnd;
    44d6:	dd 45 f8             	fldl   -0x8(%ebp)
    44d9:	dc 4d e8             	fmull  -0x18(%ebp)
    44dc:	dd 5d f8             	fstpl  -0x8(%ebp)
    power--;
    44df:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
    44e3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    44e7:	7f ed                	jg     44d6 <pow+0x19>
  {
    result *= opnd;
    power--;
  }
  return result;
    44e9:	dd 45 f8             	fldl   -0x8(%ebp)
}
    44ec:	c9                   	leave  
    44ed:	c3                   	ret    

000044ee <Translation>:

double Translation(char *s, int* pos)
{
    44ee:	55                   	push   %ebp
    44ef:	89 e5                	mov    %esp,%ebp
    44f1:	83 ec 28             	sub    $0x28,%esp
    double integer = 0;
    44f4:	d9 ee                	fldz   
    44f6:	dd 5d f8             	fstpl  -0x8(%ebp)
    double remainder = 0;
    44f9:	d9 ee                	fldz   
    44fb:	dd 5d f0             	fstpl  -0x10(%ebp)
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
    44fe:	eb 3e                	jmp    453e <Translation+0x50>
    {
        integer *= 10;
    4500:	dd 45 f8             	fldl   -0x8(%ebp)
    4503:	dd 05 90 86 00 00    	fldl   0x8690
    4509:	de c9                	fmulp  %st,%st(1)
    450b:	dd 5d f8             	fstpl  -0x8(%ebp)
        integer += (s[(*pos)] - '0');
    450e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4511:	8b 00                	mov    (%eax),%eax
    4513:	89 c2                	mov    %eax,%edx
    4515:	8b 45 08             	mov    0x8(%ebp),%eax
    4518:	01 d0                	add    %edx,%eax
    451a:	0f b6 00             	movzbl (%eax),%eax
    451d:	0f be c0             	movsbl %al,%eax
    4520:	83 e8 30             	sub    $0x30,%eax
    4523:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4526:	db 45 dc             	fildl  -0x24(%ebp)
    4529:	dd 45 f8             	fldl   -0x8(%ebp)
    452c:	de c1                	faddp  %st,%st(1)
    452e:	dd 5d f8             	fstpl  -0x8(%ebp)
        (*pos)++;
    4531:	8b 45 0c             	mov    0xc(%ebp),%eax
    4534:	8b 00                	mov    (%eax),%eax
    4536:	8d 50 01             	lea    0x1(%eax),%edx
    4539:	8b 45 0c             	mov    0xc(%ebp),%eax
    453c:	89 10                	mov    %edx,(%eax)

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
    453e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4541:	8b 00                	mov    (%eax),%eax
    4543:	89 c2                	mov    %eax,%edx
    4545:	8b 45 08             	mov    0x8(%ebp),%eax
    4548:	01 d0                	add    %edx,%eax
    454a:	0f b6 00             	movzbl (%eax),%eax
    454d:	3c 2f                	cmp    $0x2f,%al
    454f:	7e 13                	jle    4564 <Translation+0x76>
    4551:	8b 45 0c             	mov    0xc(%ebp),%eax
    4554:	8b 00                	mov    (%eax),%eax
    4556:	89 c2                	mov    %eax,%edx
    4558:	8b 45 08             	mov    0x8(%ebp),%eax
    455b:	01 d0                	add    %edx,%eax
    455d:	0f b6 00             	movzbl (%eax),%eax
    4560:	3c 39                	cmp    $0x39,%al
    4562:	7e 9c                	jle    4500 <Translation+0x12>
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
    4564:	8b 45 0c             	mov    0xc(%ebp),%eax
    4567:	8b 00                	mov    (%eax),%eax
    4569:	89 c2                	mov    %eax,%edx
    456b:	8b 45 08             	mov    0x8(%ebp),%eax
    456e:	01 d0                	add    %edx,%eax
    4570:	0f b6 00             	movzbl (%eax),%eax
    4573:	3c 2e                	cmp    $0x2e,%al
    4575:	0f 85 9b 00 00 00    	jne    4616 <Translation+0x128>
    {
        (*pos)++;
    457b:	8b 45 0c             	mov    0xc(%ebp),%eax
    457e:	8b 00                	mov    (%eax),%eax
    4580:	8d 50 01             	lea    0x1(%eax),%edx
    4583:	8b 45 0c             	mov    0xc(%ebp),%eax
    4586:	89 10                	mov    %edx,(%eax)
        int c = 1;
    4588:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
    458f:	eb 5b                	jmp    45ec <Translation+0xfe>
        {
            double t = s[(*pos)] - '0';
    4591:	8b 45 0c             	mov    0xc(%ebp),%eax
    4594:	8b 00                	mov    (%eax),%eax
    4596:	89 c2                	mov    %eax,%edx
    4598:	8b 45 08             	mov    0x8(%ebp),%eax
    459b:	01 d0                	add    %edx,%eax
    459d:	0f b6 00             	movzbl (%eax),%eax
    45a0:	0f be c0             	movsbl %al,%eax
    45a3:	83 e8 30             	sub    $0x30,%eax
    45a6:	89 45 dc             	mov    %eax,-0x24(%ebp)
    45a9:	db 45 dc             	fildl  -0x24(%ebp)
    45ac:	dd 5d e0             	fstpl  -0x20(%ebp)
            t *= pow(0.1, c);
    45af:	83 ec 04             	sub    $0x4,%esp
    45b2:	ff 75 ec             	pushl  -0x14(%ebp)
    45b5:	dd 05 98 86 00 00    	fldl   0x8698
    45bb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    45bf:	dd 1c 24             	fstpl  (%esp)
    45c2:	e8 f6 fe ff ff       	call   44bd <pow>
    45c7:	83 c4 10             	add    $0x10,%esp
    45ca:	dd 45 e0             	fldl   -0x20(%ebp)
    45cd:	de c9                	fmulp  %st,%st(1)
    45cf:	dd 5d e0             	fstpl  -0x20(%ebp)
            c++;
    45d2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
            remainder += t;
    45d6:	dd 45 f0             	fldl   -0x10(%ebp)
    45d9:	dc 45 e0             	faddl  -0x20(%ebp)
    45dc:	dd 5d f0             	fstpl  -0x10(%ebp)
            (*pos)++;
    45df:	8b 45 0c             	mov    0xc(%ebp),%eax
    45e2:	8b 00                	mov    (%eax),%eax
    45e4:	8d 50 01             	lea    0x1(%eax),%edx
    45e7:	8b 45 0c             	mov    0xc(%ebp),%eax
    45ea:	89 10                	mov    %edx,(%eax)
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
    45ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    45ef:	8b 00                	mov    (%eax),%eax
    45f1:	89 c2                	mov    %eax,%edx
    45f3:	8b 45 08             	mov    0x8(%ebp),%eax
    45f6:	01 d0                	add    %edx,%eax
    45f8:	0f b6 00             	movzbl (%eax),%eax
    45fb:	3c 2f                	cmp    $0x2f,%al
    45fd:	7e 17                	jle    4616 <Translation+0x128>
    45ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    4602:	8b 00                	mov    (%eax),%eax
    4604:	89 c2                	mov    %eax,%edx
    4606:	8b 45 08             	mov    0x8(%ebp),%eax
    4609:	01 d0                	add    %edx,%eax
    460b:	0f b6 00             	movzbl (%eax),%eax
    460e:	3c 39                	cmp    $0x39,%al
    4610:	0f 8e 7b ff ff ff    	jle    4591 <Translation+0xa3>
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
    4616:	dd 45 f8             	fldl   -0x8(%ebp)
    4619:	dc 45 f0             	faddl  -0x10(%ebp)
    461c:	c9                   	leave  
    461d:	c3                   	ret    

0000461e <fork1>:

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
    461e:	55                   	push   %ebp
    461f:	89 e5                	mov    %esp,%ebp
    4621:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
    4624:	e8 d2 f5 ff ff       	call   3bfb <fork>
    4629:	89 45 f4             	mov    %eax,-0xc(%ebp)
  //if(pid == -1)
    //panic1("fork");
  return pid;
    462c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    462f:	c9                   	leave  
    4630:	c3                   	ret    

00004631 <execcmd>:

#include "xv_command.h"

// Constructors
struct cmd* execcmd(void)
{
    4631:	55                   	push   %ebp
    4632:	89 e5                	mov    %esp,%ebp
    4634:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    4637:	83 ec 0c             	sub    $0xc,%esp
    463a:	6a 54                	push   $0x54
    463c:	e8 70 fb ff ff       	call   41b1 <malloc>
    4641:	83 c4 10             	add    $0x10,%esp
    4644:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    4647:	83 ec 04             	sub    $0x4,%esp
    464a:	6a 54                	push   $0x54
    464c:	6a 00                	push   $0x0
    464e:	ff 75 f4             	pushl  -0xc(%ebp)
    4651:	e8 12 f4 ff ff       	call   3a68 <memset>
    4656:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_EXEC;
    4659:	8b 45 f4             	mov    -0xc(%ebp),%eax
    465c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
    4662:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4665:	c9                   	leave  
    4666:	c3                   	ret    

00004667 <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    4667:	55                   	push   %ebp
    4668:	89 e5                	mov    %esp,%ebp
    466a:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    466d:	83 ec 0c             	sub    $0xc,%esp
    4670:	6a 18                	push   $0x18
    4672:	e8 3a fb ff ff       	call   41b1 <malloc>
    4677:	83 c4 10             	add    $0x10,%esp
    467a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    467d:	83 ec 04             	sub    $0x4,%esp
    4680:	6a 18                	push   $0x18
    4682:	6a 00                	push   $0x0
    4684:	ff 75 f4             	pushl  -0xc(%ebp)
    4687:	e8 dc f3 ff ff       	call   3a68 <memset>
    468c:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_REDIR;
    468f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4692:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
    4698:	8b 45 f4             	mov    -0xc(%ebp),%eax
    469b:	8b 55 08             	mov    0x8(%ebp),%edx
    469e:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
    46a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46a4:	8b 55 0c             	mov    0xc(%ebp),%edx
    46a7:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
    46aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46ad:	8b 55 10             	mov    0x10(%ebp),%edx
    46b0:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
    46b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46b6:	8b 55 14             	mov    0x14(%ebp),%edx
    46b9:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
    46bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46bf:	8b 55 18             	mov    0x18(%ebp),%edx
    46c2:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
    46c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    46c8:	c9                   	leave  
    46c9:	c3                   	ret    

000046ca <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
    46ca:	55                   	push   %ebp
    46cb:	89 e5                	mov    %esp,%ebp
    46cd:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    46d0:	83 ec 0c             	sub    $0xc,%esp
    46d3:	6a 0c                	push   $0xc
    46d5:	e8 d7 fa ff ff       	call   41b1 <malloc>
    46da:	83 c4 10             	add    $0x10,%esp
    46dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    46e0:	83 ec 04             	sub    $0x4,%esp
    46e3:	6a 0c                	push   $0xc
    46e5:	6a 00                	push   $0x0
    46e7:	ff 75 f4             	pushl  -0xc(%ebp)
    46ea:	e8 79 f3 ff ff       	call   3a68 <memset>
    46ef:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_PIPE;
    46f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46f5:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
    46fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46fe:	8b 55 08             	mov    0x8(%ebp),%edx
    4701:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    4704:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4707:	8b 55 0c             	mov    0xc(%ebp),%edx
    470a:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    470d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4710:	c9                   	leave  
    4711:	c3                   	ret    

00004712 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
    4712:	55                   	push   %ebp
    4713:	89 e5                	mov    %esp,%ebp
    4715:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    4718:	83 ec 0c             	sub    $0xc,%esp
    471b:	6a 0c                	push   $0xc
    471d:	e8 8f fa ff ff       	call   41b1 <malloc>
    4722:	83 c4 10             	add    $0x10,%esp
    4725:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    4728:	83 ec 04             	sub    $0x4,%esp
    472b:	6a 0c                	push   $0xc
    472d:	6a 00                	push   $0x0
    472f:	ff 75 f4             	pushl  -0xc(%ebp)
    4732:	e8 31 f3 ff ff       	call   3a68 <memset>
    4737:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_LIST;
    473a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    473d:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
    4743:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4746:	8b 55 08             	mov    0x8(%ebp),%edx
    4749:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    474c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    474f:	8b 55 0c             	mov    0xc(%ebp),%edx
    4752:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    4755:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4758:	c9                   	leave  
    4759:	c3                   	ret    

0000475a <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
    475a:	55                   	push   %ebp
    475b:	89 e5                	mov    %esp,%ebp
    475d:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    4760:	83 ec 0c             	sub    $0xc,%esp
    4763:	6a 08                	push   $0x8
    4765:	e8 47 fa ff ff       	call   41b1 <malloc>
    476a:	83 c4 10             	add    $0x10,%esp
    476d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    4770:	83 ec 04             	sub    $0x4,%esp
    4773:	6a 08                	push   $0x8
    4775:	6a 00                	push   $0x0
    4777:	ff 75 f4             	pushl  -0xc(%ebp)
    477a:	e8 e9 f2 ff ff       	call   3a68 <memset>
    477f:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_BACK;
    4782:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4785:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
    478b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    478e:	8b 55 08             	mov    0x8(%ebp),%edx
    4791:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    4794:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4797:	c9                   	leave  
    4798:	c3                   	ret    

00004799 <calcmd>:

struct cmd* calcmd(char *_line)
{
    4799:	55                   	push   %ebp
    479a:	89 e5                	mov    %esp,%ebp
    479c:	83 ec 18             	sub    $0x18,%esp
  struct calcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    479f:	83 ec 0c             	sub    $0xc,%esp
    47a2:	6a 08                	push   $0x8
    47a4:	e8 08 fa ff ff       	call   41b1 <malloc>
    47a9:	83 c4 10             	add    $0x10,%esp
    47ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    47af:	83 ec 04             	sub    $0x4,%esp
    47b2:	6a 08                	push   $0x8
    47b4:	6a 00                	push   $0x0
    47b6:	ff 75 f4             	pushl  -0xc(%ebp)
    47b9:	e8 aa f2 ff ff       	call   3a68 <memset>
    47be:	83 c4 10             	add    $0x10,%esp
  cmd->type = CMD_CAL;
    47c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    47c4:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
  cmd->line = _line;
    47ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    47cd:	8b 55 08             	mov    0x8(%ebp),%edx
    47d0:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    47d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    47d6:	c9                   	leave  
    47d7:	c3                   	ret    

000047d8 <mystrncmp>:

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
    47d8:	55                   	push   %ebp
    47d9:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
    47db:	eb 0c                	jmp    47e9 <mystrncmp+0x11>
    n--, p++, q++;
    47dd:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    47e1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    47e5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    47e9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    47ed:	74 1a                	je     4809 <mystrncmp+0x31>
    47ef:	8b 45 08             	mov    0x8(%ebp),%eax
    47f2:	0f b6 00             	movzbl (%eax),%eax
    47f5:	84 c0                	test   %al,%al
    47f7:	74 10                	je     4809 <mystrncmp+0x31>
    47f9:	8b 45 08             	mov    0x8(%ebp),%eax
    47fc:	0f b6 10             	movzbl (%eax),%edx
    47ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    4802:	0f b6 00             	movzbl (%eax),%eax
    4805:	38 c2                	cmp    %al,%dl
    4807:	74 d4                	je     47dd <mystrncmp+0x5>
    n--, p++, q++;
  if(n == 0)
    4809:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    480d:	75 07                	jne    4816 <mystrncmp+0x3e>
    return 0;
    480f:	b8 00 00 00 00       	mov    $0x0,%eax
    4814:	eb 16                	jmp    482c <mystrncmp+0x54>
  return (uchar)*p - (uchar)*q;
    4816:	8b 45 08             	mov    0x8(%ebp),%eax
    4819:	0f b6 00             	movzbl (%eax),%eax
    481c:	0f b6 d0             	movzbl %al,%edx
    481f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4822:	0f b6 00             	movzbl (%eax),%eax
    4825:	0f b6 c0             	movzbl %al,%eax
    4828:	29 c2                	sub    %eax,%edx
    482a:	89 d0                	mov    %edx,%eax
}
    482c:	5d                   	pop    %ebp
    482d:	c3                   	ret    

0000482e <mystrlen>:

static int mystrlen(const char *s)
{
    482e:	55                   	push   %ebp
    482f:	89 e5                	mov    %esp,%ebp
    4831:	83 ec 10             	sub    $0x10,%esp
  int n;
  for(n = 0; s[n]; n++)
    4834:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    483b:	eb 04                	jmp    4841 <mystrlen+0x13>
    483d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    4841:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4844:	8b 45 08             	mov    0x8(%ebp),%eax
    4847:	01 d0                	add    %edx,%eax
    4849:	0f b6 00             	movzbl (%eax),%eax
    484c:	84 c0                	test   %al,%al
    484e:	75 ed                	jne    483d <mystrlen+0xf>
    ;
  return n;
    4850:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4853:	c9                   	leave  
    4854:	c3                   	ret    

00004855 <mystrncpy>:

static char* mystrncpy(char *s, const char *t, int n)
{
    4855:	55                   	push   %ebp
    4856:	89 e5                	mov    %esp,%ebp
    4858:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
    485b:	8b 45 08             	mov    0x8(%ebp),%eax
    485e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
    4861:	90                   	nop
    4862:	8b 45 10             	mov    0x10(%ebp),%eax
    4865:	8d 50 ff             	lea    -0x1(%eax),%edx
    4868:	89 55 10             	mov    %edx,0x10(%ebp)
    486b:	85 c0                	test   %eax,%eax
    486d:	7e 2c                	jle    489b <mystrncpy+0x46>
    486f:	8b 45 08             	mov    0x8(%ebp),%eax
    4872:	8d 50 01             	lea    0x1(%eax),%edx
    4875:	89 55 08             	mov    %edx,0x8(%ebp)
    4878:	8b 55 0c             	mov    0xc(%ebp),%edx
    487b:	8d 4a 01             	lea    0x1(%edx),%ecx
    487e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    4881:	0f b6 12             	movzbl (%edx),%edx
    4884:	88 10                	mov    %dl,(%eax)
    4886:	0f b6 00             	movzbl (%eax),%eax
    4889:	84 c0                	test   %al,%al
    488b:	75 d5                	jne    4862 <mystrncpy+0xd>
    ;
  while(n-- > 0)
    488d:	eb 0c                	jmp    489b <mystrncpy+0x46>
    *s++ = 0;
    488f:	8b 45 08             	mov    0x8(%ebp),%eax
    4892:	8d 50 01             	lea    0x1(%eax),%edx
    4895:	89 55 08             	mov    %edx,0x8(%ebp)
    4898:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    489b:	8b 45 10             	mov    0x10(%ebp),%eax
    489e:	8d 50 ff             	lea    -0x1(%eax),%edx
    48a1:	89 55 10             	mov    %edx,0x10(%ebp)
    48a4:	85 c0                	test   %eax,%eax
    48a6:	7f e7                	jg     488f <mystrncpy+0x3a>
    *s++ = 0;
  return os;
    48a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    48ab:	c9                   	leave  
    48ac:	c3                   	ret    

000048ad <isEqual>:

int isEqual(double a, double b)
{
    48ad:	55                   	push   %ebp
    48ae:	89 e5                	mov    %esp,%ebp
    48b0:	83 ec 10             	sub    $0x10,%esp
    48b3:	8b 45 08             	mov    0x8(%ebp),%eax
    48b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
    48b9:	8b 45 0c             	mov    0xc(%ebp),%eax
    48bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
    48bf:	8b 45 10             	mov    0x10(%ebp),%eax
    48c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    48c5:	8b 45 14             	mov    0x14(%ebp),%eax
    48c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(a-b < EPS && b-a < EPS)
    48cb:	dd 45 f8             	fldl   -0x8(%ebp)
    48ce:	dc 65 f0             	fsubl  -0x10(%ebp)
    48d1:	dd 05 68 88 00 00    	fldl   0x8868
    48d7:	df e9                	fucomip %st(1),%st
    48d9:	dd d8                	fstp   %st(0)
    48db:	76 19                	jbe    48f6 <isEqual+0x49>
    48dd:	dd 45 f0             	fldl   -0x10(%ebp)
    48e0:	dc 65 f8             	fsubl  -0x8(%ebp)
    48e3:	dd 05 68 88 00 00    	fldl   0x8868
    48e9:	df e9                	fucomip %st(1),%st
    48eb:	dd d8                	fstp   %st(0)
    48ed:	76 07                	jbe    48f6 <isEqual+0x49>
    return 1;
    48ef:	b8 01 00 00 00       	mov    $0x1,%eax
    48f4:	eb 05                	jmp    48fb <isEqual+0x4e>
  return 0;
    48f6:	b8 00 00 00 00       	mov    $0x0,%eax
}
    48fb:	c9                   	leave  
    48fc:	c3                   	ret    

000048fd <isCmdName>:

int isCmdName(const char* str)
{
    48fd:	55                   	push   %ebp
    48fe:	89 e5                	mov    %esp,%ebp
    4900:	53                   	push   %ebx
    4901:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
    4904:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    490b:	eb 71                	jmp    497e <isCmdName+0x81>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    490d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4910:	89 d0                	mov    %edx,%eax
    4912:	c1 e0 02             	shl    $0x2,%eax
    4915:	01 d0                	add    %edx,%eax
    4917:	01 c0                	add    %eax,%eax
    4919:	05 00 97 00 00       	add    $0x9700,%eax
    491e:	83 ec 0c             	sub    $0xc,%esp
    4921:	50                   	push   %eax
    4922:	e8 1a f1 ff ff       	call   3a41 <strlen>
    4927:	83 c4 10             	add    $0x10,%esp
    492a:	89 c3                	mov    %eax,%ebx
    492c:	83 ec 0c             	sub    $0xc,%esp
    492f:	ff 75 08             	pushl  0x8(%ebp)
    4932:	e8 f7 fe ff ff       	call   482e <mystrlen>
    4937:	83 c4 10             	add    $0x10,%esp
    493a:	39 c3                	cmp    %eax,%ebx
    493c:	75 3c                	jne    497a <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
    493e:	83 ec 0c             	sub    $0xc,%esp
    4941:	ff 75 08             	pushl  0x8(%ebp)
    4944:	e8 e5 fe ff ff       	call   482e <mystrlen>
    4949:	83 c4 10             	add    $0x10,%esp
    494c:	89 c1                	mov    %eax,%ecx
    494e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4951:	89 d0                	mov    %edx,%eax
    4953:	c1 e0 02             	shl    $0x2,%eax
    4956:	01 d0                	add    %edx,%eax
    4958:	01 c0                	add    %eax,%eax
    495a:	05 00 97 00 00       	add    $0x9700,%eax
    495f:	83 ec 04             	sub    $0x4,%esp
    4962:	51                   	push   %ecx
    4963:	ff 75 08             	pushl  0x8(%ebp)
    4966:	50                   	push   %eax
    4967:	e8 6c fe ff ff       	call   47d8 <mystrncmp>
    496c:	83 c4 10             	add    $0x10,%esp

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
    496f:	85 c0                	test   %eax,%eax
    4971:	75 07                	jne    497a <isCmdName+0x7d>
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
    4973:	b8 01 00 00 00       	mov    $0x1,%eax
    4978:	eb 0f                	jmp    4989 <isCmdName+0x8c>
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
    497a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    497e:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    4982:	7e 89                	jle    490d <isCmdName+0x10>
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
    4984:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4989:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    498c:	c9                   	leave  
    498d:	c3                   	ret    

0000498e <findAlias>:

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
    498e:	55                   	push   %ebp
    498f:	89 e5                	mov    %esp,%ebp
    4991:	81 ec 98 00 00 00    	sub    $0x98,%esp
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
    4997:	83 ec 08             	sub    $0x8,%esp
    499a:	6a 00                	push   $0x0
    499c:	68 c8 97 00 00       	push   $0x97c8
    49a1:	e8 9d f2 ff ff       	call   3c43 <open>
    49a6:	83 c4 10             	add    $0x10,%esp
    49a9:	89 45 dc             	mov    %eax,-0x24(%ebp)
    49ac:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    49b0:	79 0a                	jns    49bc <findAlias+0x2e>
  {
      return 0; //no aliasfile
    49b2:	b8 00 00 00 00       	mov    $0x0,%eax
    49b7:	e9 9a 01 00 00       	jmp    4b56 <findAlias+0x1c8>
  }
  int lastStartIndex = 0;
    49bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char lastAlias[50];
  int notUsed = 1;
    49c3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    49ca:	e9 ee 00 00 00       	jmp    4abd <findAlias+0x12f>
  {
      int isSame = 1;
    49cf:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
      int isUnalias = 0;
    49d6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
      int startIndex = 0;
    49dd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      int otherIndex = 0;
    49e4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      int len1 = strlen(buf);
    49eb:	83 ec 0c             	sub    $0xc,%esp
    49ee:	8d 45 9a             	lea    -0x66(%ebp),%eax
    49f1:	50                   	push   %eax
    49f2:	e8 4a f0 ff ff       	call   3a41 <strlen>
    49f7:	83 c4 10             	add    $0x10,%esp
    49fa:	89 45 d0             	mov    %eax,-0x30(%ebp)
      int len2 = strlen(aliasname);
    49fd:	83 ec 0c             	sub    $0xc,%esp
    4a00:	ff 75 08             	pushl  0x8(%ebp)
    4a03:	e8 39 f0 ff ff       	call   3a41 <strlen>
    4a08:	83 c4 10             	add    $0x10,%esp
    4a0b:	89 45 cc             	mov    %eax,-0x34(%ebp)
      if(buf[startIndex] == '!') //unalias
    4a0e:	8d 55 9a             	lea    -0x66(%ebp),%edx
    4a11:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4a14:	01 d0                	add    %edx,%eax
    4a16:	0f b6 00             	movzbl (%eax),%eax
    4a19:	3c 21                	cmp    $0x21,%al
    4a1b:	75 38                	jne    4a55 <findAlias+0xc7>
      {
          startIndex++;
    4a1d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          isUnalias = 1;
    4a21:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    4a28:	eb 2b                	jmp    4a55 <findAlias+0xc7>
      {
          if(buf[startIndex] != aliasname[otherIndex])
    4a2a:	8d 55 9a             	lea    -0x66(%ebp),%edx
    4a2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4a30:	01 d0                	add    %edx,%eax
    4a32:	0f b6 10             	movzbl (%eax),%edx
    4a35:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    4a38:	8b 45 08             	mov    0x8(%ebp),%eax
    4a3b:	01 c8                	add    %ecx,%eax
    4a3d:	0f b6 00             	movzbl (%eax),%eax
    4a40:	38 c2                	cmp    %al,%dl
    4a42:	74 09                	je     4a4d <findAlias+0xbf>
          {
              isSame = 0;
    4a44:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
              break;
    4a4b:	eb 1f                	jmp    4a6c <findAlias+0xde>
          }
          startIndex++;
    4a4d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
          otherIndex++;
    4a51:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
    4a55:	8d 55 9a             	lea    -0x66(%ebp),%edx
    4a58:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4a5b:	01 d0                	add    %edx,%eax
    4a5d:	0f b6 00             	movzbl (%eax),%eax
    4a60:	3c 3d                	cmp    $0x3d,%al
    4a62:	74 08                	je     4a6c <findAlias+0xde>
    4a64:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4a67:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    4a6a:	7c be                	jl     4a2a <findAlias+0x9c>
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
    4a6c:	8d 55 9a             	lea    -0x66(%ebp),%edx
    4a6f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4a72:	01 d0                	add    %edx,%eax
    4a74:	0f b6 00             	movzbl (%eax),%eax
    4a77:	3c 3d                	cmp    $0x3d,%al
    4a79:	75 08                	jne    4a83 <findAlias+0xf5>
    4a7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4a7e:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    4a81:	7d 07                	jge    4a8a <findAlias+0xfc>
      {
          isSame = 0;
    4a83:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      }
      if(isSame == 1)
    4a8a:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    4a8e:	75 0b                	jne    4a9b <findAlias+0x10d>
      {
          notUsed = 1-notUsed;
    4a90:	b8 01 00 00 00       	mov    $0x1,%eax
    4a95:	2b 45 f0             	sub    -0x10(%ebp),%eax
    4a98:	89 45 f0             	mov    %eax,-0x10(%ebp)
      }
      if(notUsed == 0) //this is an alias record
    4a9b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4a9f:	75 1c                	jne    4abd <findAlias+0x12f>
      {
          strcpy(lastAlias,buf);
    4aa1:	83 ec 08             	sub    $0x8,%esp
    4aa4:	8d 45 9a             	lea    -0x66(%ebp),%eax
    4aa7:	50                   	push   %eax
    4aa8:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    4aae:	50                   	push   %eax
    4aaf:	e8 1e ef ff ff       	call   39d2 <strcpy>
    4ab4:	83 c4 10             	add    $0x10,%esp
          lastStartIndex = startIndex;
    4ab7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4aba:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    4abd:	83 ec 04             	sub    $0x4,%esp
    4ac0:	6a 32                	push   $0x32
    4ac2:	8d 45 9a             	lea    -0x66(%ebp),%eax
    4ac5:	50                   	push   %eax
    4ac6:	ff 75 dc             	pushl  -0x24(%ebp)
    4ac9:	e8 4d f1 ff ff       	call   3c1b <read>
    4ace:	83 c4 10             	add    $0x10,%esp
    4ad1:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4ad4:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    4ad8:	0f 8f f1 fe ff ff    	jg     49cf <findAlias+0x41>
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
    4ade:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4ae2:	75 5f                	jne    4b43 <findAlias+0x1b5>
  {
    int i = 0;
    4ae4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    lastStartIndex++;
    4aeb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(lastAlias[lastStartIndex] != '\0')
    4aef:	eb 20                	jmp    4b11 <findAlias+0x183>
    {
      cmdname[i] = lastAlias[lastStartIndex];
    4af1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    4af4:	8b 45 0c             	mov    0xc(%ebp),%eax
    4af7:	01 c2                	add    %eax,%edx
    4af9:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
    4aff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b02:	01 c8                	add    %ecx,%eax
    4b04:	0f b6 00             	movzbl (%eax),%eax
    4b07:	88 02                	mov    %al,(%edx)
      i++;
    4b09:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
      lastStartIndex++;
    4b0d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    4b11:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
    4b17:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b1a:	01 d0                	add    %edx,%eax
    4b1c:	0f b6 00             	movzbl (%eax),%eax
    4b1f:	84 c0                	test   %al,%al
    4b21:	75 ce                	jne    4af1 <findAlias+0x163>
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    4b23:	8b 55 e0             	mov    -0x20(%ebp),%edx
    4b26:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b29:	01 d0                	add    %edx,%eax
    4b2b:	c6 00 00             	movb   $0x0,(%eax)
    close(fd);
    4b2e:	83 ec 0c             	sub    $0xc,%esp
    4b31:	ff 75 dc             	pushl  -0x24(%ebp)
    4b34:	e8 f2 f0 ff ff       	call   3c2b <close>
    4b39:	83 c4 10             	add    $0x10,%esp
    return 1;
    4b3c:	b8 01 00 00 00       	mov    $0x1,%eax
    4b41:	eb 13                	jmp    4b56 <findAlias+0x1c8>
  }
  close(fd);
    4b43:	83 ec 0c             	sub    $0xc,%esp
    4b46:	ff 75 dc             	pushl  -0x24(%ebp)
    4b49:	e8 dd f0 ff ff       	call   3c2b <close>
    4b4e:	83 c4 10             	add    $0x10,%esp
  return 0;
    4b51:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4b56:	c9                   	leave  
    4b57:	c3                   	ret    

00004b58 <runcmd>:

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
    4b58:	55                   	push   %ebp
    4b59:	89 e5                	mov    %esp,%ebp
    4b5b:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    4b5e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    4b62:	75 05                	jne    4b69 <runcmd+0x11>
    exit();
    4b64:	e8 9a f0 ff ff       	call   3c03 <exit>
  
  switch(cmd->type){
    4b69:	8b 45 08             	mov    0x8(%ebp),%eax
    4b6c:	8b 00                	mov    (%eax),%eax
    4b6e:	83 f8 05             	cmp    $0x5,%eax
    4b71:	77 09                	ja     4b7c <runcmd+0x24>
    4b73:	8b 04 85 cc 86 00 00 	mov    0x86cc(,%eax,4),%eax
    4b7a:	ff e0                	jmp    *%eax
  default:
    panic1("runcmd");
    4b7c:	83 ec 0c             	sub    $0xc,%esp
    4b7f:	68 a0 86 00 00       	push   $0x86a0
    4b84:	e8 0b f7 ff ff       	call   4294 <panic1>
    4b89:	83 c4 10             	add    $0x10,%esp

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    4b8c:	8b 45 08             	mov    0x8(%ebp),%eax
    4b8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    4b92:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b95:	8b 40 04             	mov    0x4(%eax),%eax
    4b98:	85 c0                	test   %eax,%eax
    4b9a:	75 05                	jne    4ba1 <runcmd+0x49>
      exit();
    4b9c:	e8 62 f0 ff ff       	call   3c03 <exit>
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    4ba1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ba4:	8b 40 04             	mov    0x4(%eax),%eax
    4ba7:	83 ec 0c             	sub    $0xc,%esp
    4baa:	50                   	push   %eax
    4bab:	e8 4d fd ff ff       	call   48fd <isCmdName>
    4bb0:	83 c4 10             	add    $0x10,%esp
    4bb3:	85 c0                	test   %eax,%eax
    4bb5:	75 37                	jne    4bee <runcmd+0x96>
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
    4bb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4bba:	8b 40 04             	mov    0x4(%eax),%eax
    4bbd:	83 ec 08             	sub    $0x8,%esp
    4bc0:	8d 55 ce             	lea    -0x32(%ebp),%edx
    4bc3:	52                   	push   %edx
    4bc4:	50                   	push   %eax
    4bc5:	e8 c4 fd ff ff       	call   498e <findAlias>
    4bca:	83 c4 10             	add    $0x10,%esp
    4bcd:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(flag == 1) //alias name exist
    4bd0:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    4bd4:	75 31                	jne    4c07 <runcmd+0xaf>
          exec(cmdname, ecmd->argv);
    4bd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4bd9:	83 c0 04             	add    $0x4,%eax
    4bdc:	83 ec 08             	sub    $0x8,%esp
    4bdf:	50                   	push   %eax
    4be0:	8d 45 ce             	lea    -0x32(%ebp),%eax
    4be3:	50                   	push   %eax
    4be4:	e8 52 f0 ff ff       	call   3c3b <exec>
    4be9:	83 c4 10             	add    $0x10,%esp
    4bec:	eb 19                	jmp    4c07 <runcmd+0xaf>
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    4bee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4bf1:	8d 50 04             	lea    0x4(%eax),%edx
    4bf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4bf7:	8b 40 04             	mov    0x4(%eax),%eax
    4bfa:	83 ec 08             	sub    $0x8,%esp
    4bfd:	52                   	push   %edx
    4bfe:	50                   	push   %eax
    4bff:	e8 37 f0 ff ff       	call   3c3b <exec>
    4c04:	83 c4 10             	add    $0x10,%esp
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    4c07:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4c0a:	8b 40 04             	mov    0x4(%eax),%eax
    4c0d:	83 ec 04             	sub    $0x4,%esp
    4c10:	50                   	push   %eax
    4c11:	68 a7 86 00 00       	push   $0x86a7
    4c16:	6a 02                	push   $0x2
    4c18:	e8 92 f2 ff ff       	call   3eaf <printf>
    4c1d:	83 c4 10             	add    $0x10,%esp
    break;
    4c20:	e9 c6 01 00 00       	jmp    4deb <runcmd+0x293>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    4c25:	8b 45 08             	mov    0x8(%ebp),%eax
    4c28:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(rcmd->fd);
    4c2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4c2e:	8b 40 14             	mov    0x14(%eax),%eax
    4c31:	83 ec 0c             	sub    $0xc,%esp
    4c34:	50                   	push   %eax
    4c35:	e8 f1 ef ff ff       	call   3c2b <close>
    4c3a:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
    4c3d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4c40:	8b 50 10             	mov    0x10(%eax),%edx
    4c43:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4c46:	8b 40 08             	mov    0x8(%eax),%eax
    4c49:	83 ec 08             	sub    $0x8,%esp
    4c4c:	52                   	push   %edx
    4c4d:	50                   	push   %eax
    4c4e:	e8 f0 ef ff ff       	call   3c43 <open>
    4c53:	83 c4 10             	add    $0x10,%esp
    4c56:	85 c0                	test   %eax,%eax
    4c58:	79 1e                	jns    4c78 <runcmd+0x120>
      printf(2, "open %s failed\n", rcmd->file);
    4c5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4c5d:	8b 40 08             	mov    0x8(%eax),%eax
    4c60:	83 ec 04             	sub    $0x4,%esp
    4c63:	50                   	push   %eax
    4c64:	68 b7 86 00 00       	push   $0x86b7
    4c69:	6a 02                	push   $0x2
    4c6b:	e8 3f f2 ff ff       	call   3eaf <printf>
    4c70:	83 c4 10             	add    $0x10,%esp
      exit();
    4c73:	e8 8b ef ff ff       	call   3c03 <exit>
    }
    runcmd(rcmd->cmd);
    4c78:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4c7b:	8b 40 04             	mov    0x4(%eax),%eax
    4c7e:	83 ec 0c             	sub    $0xc,%esp
    4c81:	50                   	push   %eax
    4c82:	e8 d1 fe ff ff       	call   4b58 <runcmd>
    4c87:	83 c4 10             	add    $0x10,%esp
    break;
    4c8a:	e9 5c 01 00 00       	jmp    4deb <runcmd+0x293>

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    4c8f:	8b 45 08             	mov    0x8(%ebp),%eax
    4c92:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fork1() == 0)
    4c95:	e8 84 f9 ff ff       	call   461e <fork1>
    4c9a:	85 c0                	test   %eax,%eax
    4c9c:	75 12                	jne    4cb0 <runcmd+0x158>
      runcmd(lcmd->left);
    4c9e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4ca1:	8b 40 04             	mov    0x4(%eax),%eax
    4ca4:	83 ec 0c             	sub    $0xc,%esp
    4ca7:	50                   	push   %eax
    4ca8:	e8 ab fe ff ff       	call   4b58 <runcmd>
    4cad:	83 c4 10             	add    $0x10,%esp
    wait();
    4cb0:	e8 56 ef ff ff       	call   3c0b <wait>
    runcmd(lcmd->right);
    4cb5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4cb8:	8b 40 08             	mov    0x8(%eax),%eax
    4cbb:	83 ec 0c             	sub    $0xc,%esp
    4cbe:	50                   	push   %eax
    4cbf:	e8 94 fe ff ff       	call   4b58 <runcmd>
    4cc4:	83 c4 10             	add    $0x10,%esp
    break;
    4cc7:	e9 1f 01 00 00       	jmp    4deb <runcmd+0x293>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    4ccc:	8b 45 08             	mov    0x8(%ebp),%eax
    4ccf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pipe(p) < 0)
    4cd2:	83 ec 0c             	sub    $0xc,%esp
    4cd5:	8d 45 d8             	lea    -0x28(%ebp),%eax
    4cd8:	50                   	push   %eax
    4cd9:	e8 35 ef ff ff       	call   3c13 <pipe>
    4cde:	83 c4 10             	add    $0x10,%esp
    4ce1:	85 c0                	test   %eax,%eax
    4ce3:	79 10                	jns    4cf5 <runcmd+0x19d>
      panic1("pipe");
    4ce5:	83 ec 0c             	sub    $0xc,%esp
    4ce8:	68 c7 86 00 00       	push   $0x86c7
    4ced:	e8 a2 f5 ff ff       	call   4294 <panic1>
    4cf2:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
    4cf5:	e8 24 f9 ff ff       	call   461e <fork1>
    4cfa:	85 c0                	test   %eax,%eax
    4cfc:	75 4c                	jne    4d4a <runcmd+0x1f2>
      close(1);
    4cfe:	83 ec 0c             	sub    $0xc,%esp
    4d01:	6a 01                	push   $0x1
    4d03:	e8 23 ef ff ff       	call   3c2b <close>
    4d08:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
    4d0b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4d0e:	83 ec 0c             	sub    $0xc,%esp
    4d11:	50                   	push   %eax
    4d12:	e8 64 ef ff ff       	call   3c7b <dup>
    4d17:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    4d1a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4d1d:	83 ec 0c             	sub    $0xc,%esp
    4d20:	50                   	push   %eax
    4d21:	e8 05 ef ff ff       	call   3c2b <close>
    4d26:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    4d29:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4d2c:	83 ec 0c             	sub    $0xc,%esp
    4d2f:	50                   	push   %eax
    4d30:	e8 f6 ee ff ff       	call   3c2b <close>
    4d35:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
    4d38:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d3b:	8b 40 04             	mov    0x4(%eax),%eax
    4d3e:	83 ec 0c             	sub    $0xc,%esp
    4d41:	50                   	push   %eax
    4d42:	e8 11 fe ff ff       	call   4b58 <runcmd>
    4d47:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
    4d4a:	e8 cf f8 ff ff       	call   461e <fork1>
    4d4f:	85 c0                	test   %eax,%eax
    4d51:	75 4c                	jne    4d9f <runcmd+0x247>
      close(0);
    4d53:	83 ec 0c             	sub    $0xc,%esp
    4d56:	6a 00                	push   $0x0
    4d58:	e8 ce ee ff ff       	call   3c2b <close>
    4d5d:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
    4d60:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4d63:	83 ec 0c             	sub    $0xc,%esp
    4d66:	50                   	push   %eax
    4d67:	e8 0f ef ff ff       	call   3c7b <dup>
    4d6c:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
    4d6f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4d72:	83 ec 0c             	sub    $0xc,%esp
    4d75:	50                   	push   %eax
    4d76:	e8 b0 ee ff ff       	call   3c2b <close>
    4d7b:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
    4d7e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4d81:	83 ec 0c             	sub    $0xc,%esp
    4d84:	50                   	push   %eax
    4d85:	e8 a1 ee ff ff       	call   3c2b <close>
    4d8a:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
    4d8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d90:	8b 40 08             	mov    0x8(%eax),%eax
    4d93:	83 ec 0c             	sub    $0xc,%esp
    4d96:	50                   	push   %eax
    4d97:	e8 bc fd ff ff       	call   4b58 <runcmd>
    4d9c:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
    4d9f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4da2:	83 ec 0c             	sub    $0xc,%esp
    4da5:	50                   	push   %eax
    4da6:	e8 80 ee ff ff       	call   3c2b <close>
    4dab:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
    4dae:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4db1:	83 ec 0c             	sub    $0xc,%esp
    4db4:	50                   	push   %eax
    4db5:	e8 71 ee ff ff       	call   3c2b <close>
    4dba:	83 c4 10             	add    $0x10,%esp
    wait();
    4dbd:	e8 49 ee ff ff       	call   3c0b <wait>
    wait();
    4dc2:	e8 44 ee ff ff       	call   3c0b <wait>
    break;
    4dc7:	eb 22                	jmp    4deb <runcmd+0x293>
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    4dc9:	8b 45 08             	mov    0x8(%ebp),%eax
    4dcc:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(fork1() == 0)
    4dcf:	e8 4a f8 ff ff       	call   461e <fork1>
    4dd4:	85 c0                	test   %eax,%eax
    4dd6:	75 12                	jne    4dea <runcmd+0x292>
      runcmd(bcmd->cmd);
    4dd8:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4ddb:	8b 40 04             	mov    0x4(%eax),%eax
    4dde:	83 ec 0c             	sub    $0xc,%esp
    4de1:	50                   	push   %eax
    4de2:	e8 71 fd ff ff       	call   4b58 <runcmd>
    4de7:	83 c4 10             	add    $0x10,%esp
    break;
    4dea:	90                   	nop
  }
  exit();
    4deb:	e8 13 ee ff ff       	call   3c03 <exit>

00004df0 <isNameChar>:
}

double Compute(char *s);
int isNameChar(char ch)
{
    4df0:	55                   	push   %ebp
    4df1:	89 e5                	mov    %esp,%ebp
    4df3:	83 ec 04             	sub    $0x4,%esp
    4df6:	8b 45 08             	mov    0x8(%ebp),%eax
    4df9:	88 45 fc             	mov    %al,-0x4(%ebp)
  if(ch >= 'A' && ch <= 'Z')
    4dfc:	80 7d fc 40          	cmpb   $0x40,-0x4(%ebp)
    4e00:	7e 0d                	jle    4e0f <isNameChar+0x1f>
    4e02:	80 7d fc 5a          	cmpb   $0x5a,-0x4(%ebp)
    4e06:	7f 07                	jg     4e0f <isNameChar+0x1f>
    return 1;
    4e08:	b8 01 00 00 00       	mov    $0x1,%eax
    4e0d:	eb 38                	jmp    4e47 <isNameChar+0x57>
  if(ch >= 'a' && ch <= 'z')
    4e0f:	80 7d fc 60          	cmpb   $0x60,-0x4(%ebp)
    4e13:	7e 0d                	jle    4e22 <isNameChar+0x32>
    4e15:	80 7d fc 7a          	cmpb   $0x7a,-0x4(%ebp)
    4e19:	7f 07                	jg     4e22 <isNameChar+0x32>
    return 1;
    4e1b:	b8 01 00 00 00       	mov    $0x1,%eax
    4e20:	eb 25                	jmp    4e47 <isNameChar+0x57>
  if(ch >= '0' && ch <= '9')
    4e22:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%ebp)
    4e26:	7e 0d                	jle    4e35 <isNameChar+0x45>
    4e28:	80 7d fc 39          	cmpb   $0x39,-0x4(%ebp)
    4e2c:	7f 07                	jg     4e35 <isNameChar+0x45>
    return 1;
    4e2e:	b8 01 00 00 00       	mov    $0x1,%eax
    4e33:	eb 12                	jmp    4e47 <isNameChar+0x57>
  if(ch == '_')
    4e35:	80 7d fc 5f          	cmpb   $0x5f,-0x4(%ebp)
    4e39:	75 07                	jne    4e42 <isNameChar+0x52>
    return 1;
    4e3b:	b8 01 00 00 00       	mov    $0x1,%eax
    4e40:	eb 05                	jmp    4e47 <isNameChar+0x57>
  return 0;
    4e42:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4e47:	c9                   	leave  
    4e48:	c3                   	ret    

00004e49 <runCalcmd>:

void runCalcmd(struct calcmd* cmd)
{
    4e49:	55                   	push   %ebp
    4e4a:	89 e5                	mov    %esp,%ebp
    4e4c:	83 ec 78             	sub    $0x78,%esp
  char *line = cmd->line;
    4e4f:	8b 45 08             	mov    0x8(%ebp),%eax
    4e52:	8b 40 04             	mov    0x4(%eax),%eax
    4e55:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int equ = -1;
    4e58:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  int hasEqu = 0;
    4e5f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(int i=0; line[i] != '\0'; i++)
    4e66:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4e6d:	eb 1d                	jmp    4e8c <runCalcmd+0x43>
  {
    if(line[i] == '=')
    4e6f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4e72:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4e75:	01 d0                	add    %edx,%eax
    4e77:	0f b6 00             	movzbl (%eax),%eax
    4e7a:	3c 3d                	cmp    $0x3d,%al
    4e7c:	75 0a                	jne    4e88 <runCalcmd+0x3f>
    {
      hasEqu++;
    4e7e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      equ = i;
    4e82:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4e85:	89 45 f4             	mov    %eax,-0xc(%ebp)
void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
    4e88:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    4e8c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4e8f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4e92:	01 d0                	add    %edx,%eax
    4e94:	0f b6 00             	movzbl (%eax),%eax
    4e97:	84 c0                	test   %al,%al
    4e99:	75 d4                	jne    4e6f <runCalcmd+0x26>
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
    4e9b:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    4e9f:	7e 1d                	jle    4ebe <runCalcmd+0x75>
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
    4ea1:	83 ec 0c             	sub    $0xc,%esp
    4ea4:	68 e4 86 00 00       	push   $0x86e4
    4ea9:	6a 00                	push   $0x0
    4eab:	6a 00                	push   $0x0
    4ead:	6a 01                	push   $0x1
    4eaf:	6a 04                	push   $0x4
    4eb1:	e8 21 17 00 00       	call   65d7 <color_printf>
    4eb6:	83 c4 20             	add    $0x20,%esp
    4eb9:	e9 78 05 00 00       	jmp    5436 <runCalcmd+0x5ed>
  }
  else if(hasEqu == 1)
    4ebe:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    4ec2:	0f 85 26 05 00 00    	jne    53ee <runCalcmd+0x5a5>
  {
    int i=0;
    4ec8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while(line[i] == ' ')
    4ecf:	eb 04                	jmp    4ed5 <runCalcmd+0x8c>
    {
      i++;
    4ed1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    4ed5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4ed8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4edb:	01 d0                	add    %edx,%eax
    4edd:	0f b6 00             	movzbl (%eax),%eax
    4ee0:	3c 20                	cmp    $0x20,%al
    4ee2:	74 ed                	je     4ed1 <runCalcmd+0x88>
    {
      i++;
    }
    int startIndex = i;
    4ee4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4ee7:	89 45 d0             	mov    %eax,-0x30(%ebp)
    for(; i<equ; i++)
    4eea:	eb 23                	jmp    4f0f <runCalcmd+0xc6>
    {
      if(isNameChar(line[i]) != 1)
    4eec:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4eef:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4ef2:	01 d0                	add    %edx,%eax
    4ef4:	0f b6 00             	movzbl (%eax),%eax
    4ef7:	0f be c0             	movsbl %al,%eax
    4efa:	83 ec 0c             	sub    $0xc,%esp
    4efd:	50                   	push   %eax
    4efe:	e8 ed fe ff ff       	call   4df0 <isNameChar>
    4f03:	83 c4 10             	add    $0x10,%esp
    4f06:	83 f8 01             	cmp    $0x1,%eax
    4f09:	75 0e                	jne    4f19 <runCalcmd+0xd0>
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    4f0b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    4f0f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4f12:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4f15:	7c d5                	jl     4eec <runCalcmd+0xa3>
    4f17:	eb 01                	jmp    4f1a <runCalcmd+0xd1>
    {
      if(isNameChar(line[i]) != 1)
        break;
    4f19:	90                   	nop
    }
    int len = i-startIndex;
    4f1a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4f1d:	2b 45 d0             	sub    -0x30(%ebp),%eax
    4f20:	89 45 cc             	mov    %eax,-0x34(%ebp)
    while(line[i] == ' ')
    4f23:	eb 04                	jmp    4f29 <runCalcmd+0xe0>
    {
      i++;
    4f25:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    4f29:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4f2c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4f2f:	01 d0                	add    %edx,%eax
    4f31:	0f b6 00             	movzbl (%eax),%eax
    4f34:	3c 20                	cmp    $0x20,%al
    4f36:	74 ed                	je     4f25 <runCalcmd+0xdc>
    {
      i++;
    }
    if(i == equ) //is a string
    4f38:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4f3b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4f3e:	0f 85 90 04 00 00    	jne    53d4 <runCalcmd+0x58b>
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
    4f44:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4f47:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4f4a:	01 d0                	add    %edx,%eax
    4f4c:	0f b6 00             	movzbl (%eax),%eax
    4f4f:	3c 2f                	cmp    $0x2f,%al
    4f51:	7e 2c                	jle    4f7f <runCalcmd+0x136>
    4f53:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4f56:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4f59:	01 d0                	add    %edx,%eax
    4f5b:	0f b6 00             	movzbl (%eax),%eax
    4f5e:	3c 39                	cmp    $0x39,%al
    4f60:	7f 1d                	jg     4f7f <runCalcmd+0x136>
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
    4f62:	83 ec 0c             	sub    $0xc,%esp
    4f65:	68 00 87 00 00       	push   $0x8700
    4f6a:	6a 00                	push   $0x0
    4f6c:	6a 00                	push   $0x0
    4f6e:	6a 01                	push   $0x1
    4f70:	6a 04                	push   $0x4
    4f72:	e8 60 16 00 00       	call   65d7 <color_printf>
    4f77:	83 c4 20             	add    $0x20,%esp
    4f7a:	e9 b7 04 00 00       	jmp    5436 <runCalcmd+0x5ed>
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    4f7f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    4f86:	eb 20                	jmp    4fa8 <runCalcmd+0x15f>
        {
          name[j] = line[startIndex + j];
    4f88:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4f8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4f8e:	01 d0                	add    %edx,%eax
    4f90:	89 c2                	mov    %eax,%edx
    4f92:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4f95:	01 d0                	add    %edx,%eax
    4f97:	0f b6 00             	movzbl (%eax),%eax
    4f9a:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    4f9d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    4fa0:	01 ca                	add    %ecx,%edx
    4fa2:	88 02                	mov    %al,(%edx)
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
    4fa4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    4fa8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4fab:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    4fae:	7c d8                	jl     4f88 <runCalcmd+0x13f>
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
    4fb0:	8d 55 94             	lea    -0x6c(%ebp),%edx
    4fb3:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4fb6:	01 d0                	add    %edx,%eax
    4fb8:	c6 00 00             	movb   $0x0,(%eax)
        int i=equ+1;
    4fbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4fbe:	83 c0 01             	add    $0x1,%eax
    4fc1:	89 45 e0             	mov    %eax,-0x20(%ebp)
        while(line[i] == ' ')
    4fc4:	eb 04                	jmp    4fca <runCalcmd+0x181>
        {
          i++;
    4fc6:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
    4fca:	8b 55 e0             	mov    -0x20(%ebp),%edx
    4fcd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4fd0:	01 d0                	add    %edx,%eax
    4fd2:	0f b6 00             	movzbl (%eax),%eax
    4fd5:	3c 20                	cmp    $0x20,%al
    4fd7:	74 ed                	je     4fc6 <runCalcmd+0x17d>
        {
          i++;
        }
        if(line[i] == '`') //a math expr
    4fd9:	8b 55 e0             	mov    -0x20(%ebp),%edx
    4fdc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4fdf:	01 d0                	add    %edx,%eax
    4fe1:	0f b6 00             	movzbl (%eax),%eax
    4fe4:	3c 60                	cmp    $0x60,%al
    4fe6:	0f 85 e6 01 00 00    	jne    51d2 <runCalcmd+0x389>
        {
          i++;
    4fec:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int calstart = i;
    4ff0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4ff3:	89 45 c8             	mov    %eax,-0x38(%ebp)
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    4ff6:	eb 04                	jmp    4ffc <runCalcmd+0x1b3>
          {
            i++;
    4ff8:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
    4ffc:	8b 55 e0             	mov    -0x20(%ebp),%edx
    4fff:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5002:	01 d0                	add    %edx,%eax
    5004:	0f b6 00             	movzbl (%eax),%eax
    5007:	3c 60                	cmp    $0x60,%al
    5009:	74 0f                	je     501a <runCalcmd+0x1d1>
    500b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    500e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5011:	01 d0                	add    %edx,%eax
    5013:	0f b6 00             	movzbl (%eax),%eax
    5016:	84 c0                	test   %al,%al
    5018:	75 de                	jne    4ff8 <runCalcmd+0x1af>
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
    501a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    501d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5020:	01 d0                	add    %edx,%eax
    5022:	0f b6 00             	movzbl (%eax),%eax
    5025:	3c 60                	cmp    $0x60,%al
    5027:	0f 85 5c 01 00 00    	jne    5189 <runCalcmd+0x340>
    502d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5030:	8d 50 01             	lea    0x1(%eax),%edx
    5033:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5036:	01 d0                	add    %edx,%eax
    5038:	0f b6 00             	movzbl (%eax),%eax
    503b:	84 c0                	test   %al,%al
    503d:	0f 85 46 01 00 00    	jne    5189 <runCalcmd+0x340>
          {//correct format
            line[i] = '\0';
    5043:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5046:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5049:	01 d0                	add    %edx,%eax
    504b:	c6 00 00             	movb   $0x0,(%eax)
            double result = Compute(line+calstart);
    504e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    5051:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5054:	01 d0                	add    %edx,%eax
    5056:	83 ec 0c             	sub    $0xc,%esp
    5059:	50                   	push   %eax
    505a:	e8 c5 04 00 00       	call   5524 <Compute>
    505f:	83 c4 10             	add    $0x10,%esp
    5062:	dd 5d c0             	fstpl  -0x40(%ebp)
            if(isEqual(result,WRONG_ANS) == 0)
    5065:	dd 05 70 88 00 00    	fldl   0x8870
    506b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    506f:	dd 1c 24             	fstpl  (%esp)
    5072:	ff 75 c4             	pushl  -0x3c(%ebp)
    5075:	ff 75 c0             	pushl  -0x40(%ebp)
    5078:	e8 30 f8 ff ff       	call   48ad <isEqual>
    507d:	83 c4 10             	add    $0x10,%esp
    5080:	85 c0                	test   %eax,%eax
    5082:	0f 85 ad 03 00 00    	jne    5435 <runCalcmd+0x5ec>
            {
              if(v_num == 0)
    5088:	a1 8c 98 00 00       	mov    0x988c,%eax
    508d:	85 c0                	test   %eax,%eax
    508f:	75 15                	jne    50a6 <runCalcmd+0x25d>
                readVariables(variables,&v_num);
    5091:	83 ec 08             	sub    $0x8,%esp
    5094:	68 8c 98 00 00       	push   $0x988c
    5099:	68 00 e0 00 00       	push   $0xe000
    509e:	e8 ba 19 00 00       	call   6a5d <readVariables>
    50a3:	83 c4 10             	add    $0x10,%esp
              int index = 0;
    50a6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
              for(; index<v_num; index++)
    50ad:	eb 26                	jmp    50d5 <runCalcmd+0x28c>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
    50af:	8b 45 dc             	mov    -0x24(%ebp),%eax
    50b2:	c1 e0 05             	shl    $0x5,%eax
    50b5:	05 00 e0 00 00       	add    $0xe000,%eax
    50ba:	8d 50 04             	lea    0x4(%eax),%edx
    50bd:	83 ec 08             	sub    $0x8,%esp
    50c0:	8d 45 94             	lea    -0x6c(%ebp),%eax
    50c3:	50                   	push   %eax
    50c4:	52                   	push   %edx
    50c5:	e8 38 e9 ff ff       	call   3a02 <strcmp>
    50ca:	83 c4 10             	add    $0x10,%esp
    50cd:	85 c0                	test   %eax,%eax
    50cf:	74 10                	je     50e1 <runCalcmd+0x298>
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
    50d1:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    50d5:	a1 8c 98 00 00       	mov    0x988c,%eax
    50da:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    50dd:	7c d0                	jl     50af <runCalcmd+0x266>
    50df:	eb 01                	jmp    50e2 <runCalcmd+0x299>
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
    50e1:	90                   	nop
              }
              if(index == v_num) //new variable
    50e2:	a1 8c 98 00 00       	mov    0x988c,%eax
    50e7:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    50ea:	75 3c                	jne    5128 <runCalcmd+0x2df>
              {
                strcpy(variables[index].name,name);
    50ec:	8b 45 dc             	mov    -0x24(%ebp),%eax
    50ef:	c1 e0 05             	shl    $0x5,%eax
    50f2:	05 00 e0 00 00       	add    $0xe000,%eax
    50f7:	8d 50 04             	lea    0x4(%eax),%edx
    50fa:	83 ec 08             	sub    $0x8,%esp
    50fd:	8d 45 94             	lea    -0x6c(%ebp),%eax
    5100:	50                   	push   %eax
    5101:	52                   	push   %edx
    5102:	e8 cb e8 ff ff       	call   39d2 <strcpy>
    5107:	83 c4 10             	add    $0x10,%esp
                variables[index].type = V_DOUBLE;
    510a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    510d:	c1 e0 05             	shl    $0x5,%eax
    5110:	05 00 e0 00 00       	add    $0xe000,%eax
    5115:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                v_num++;
    511b:	a1 8c 98 00 00       	mov    0x988c,%eax
    5120:	83 c0 01             	add    $0x1,%eax
    5123:	a3 8c 98 00 00       	mov    %eax,0x988c
              }
              variables[index].value.dvalue = result;
    5128:	8b 45 dc             	mov    -0x24(%ebp),%eax
    512b:	c1 e0 05             	shl    $0x5,%eax
    512e:	05 10 e0 00 00       	add    $0xe010,%eax
    5133:	dd 45 c0             	fldl   -0x40(%ebp)
    5136:	dd 58 08             	fstpl  0x8(%eax)
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
    5139:	8b 45 dc             	mov    -0x24(%ebp),%eax
    513c:	c1 e0 05             	shl    $0x5,%eax
    513f:	05 10 e0 00 00       	add    $0xe010,%eax
    5144:	dd 40 08             	fldl   0x8(%eax)
    5147:	8b 45 dc             	mov    -0x24(%ebp),%eax
    514a:	c1 e0 05             	shl    $0x5,%eax
    514d:	05 00 e0 00 00       	add    $0xe000,%eax
    5152:	83 c0 04             	add    $0x4,%eax
    5155:	83 ec 0c             	sub    $0xc,%esp
    5158:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    515c:	dd 1c 24             	fstpl  (%esp)
    515f:	50                   	push   %eax
    5160:	68 2a 87 00 00       	push   $0x872a
    5165:	6a 01                	push   $0x1
    5167:	e8 43 ed ff ff       	call   3eaf <printf>
    516c:	83 c4 20             	add    $0x20,%esp
              writeVariables(variables,&v_num);
    516f:	83 ec 08             	sub    $0x8,%esp
    5172:	68 8c 98 00 00       	push   $0x988c
    5177:	68 00 e0 00 00       	push   $0xe000
    517c:	e8 90 1b 00 00       	call   6d11 <writeVariables>
    5181:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    5184:	e9 ac 02 00 00       	jmp    5435 <runCalcmd+0x5ec>
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
    5189:	8b 55 e0             	mov    -0x20(%ebp),%edx
    518c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    518f:	01 d0                	add    %edx,%eax
    5191:	0f b6 00             	movzbl (%eax),%eax
    5194:	84 c0                	test   %al,%al
    5196:	75 1d                	jne    51b5 <runCalcmd+0x36c>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
    5198:	83 ec 0c             	sub    $0xc,%esp
    519b:	68 31 87 00 00       	push   $0x8731
    51a0:	6a 00                	push   $0x0
    51a2:	6a 00                	push   $0x0
    51a4:	6a 01                	push   $0x1
    51a6:	6a 04                	push   $0x4
    51a8:	e8 2a 14 00 00       	call   65d7 <color_printf>
    51ad:	83 c4 20             	add    $0x20,%esp
    51b0:	e9 81 02 00 00       	jmp    5436 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
    51b5:	83 ec 0c             	sub    $0xc,%esp
    51b8:	68 48 87 00 00       	push   $0x8748
    51bd:	6a 00                	push   $0x0
    51bf:	6a 00                	push   $0x0
    51c1:	6a 01                	push   $0x1
    51c3:	6a 04                	push   $0x4
    51c5:	e8 0d 14 00 00       	call   65d7 <color_printf>
    51ca:	83 c4 20             	add    $0x20,%esp
    51cd:	e9 64 02 00 00       	jmp    5436 <runCalcmd+0x5ed>
          }
        }
        else if(line[i] == '\"') //a string
    51d2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    51d5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    51d8:	01 d0                	add    %edx,%eax
    51da:	0f b6 00             	movzbl (%eax),%eax
    51dd:	3c 22                	cmp    $0x22,%al
    51df:	0f 85 d5 01 00 00    	jne    53ba <runCalcmd+0x571>
        {
          i++;
    51e5:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
          int strstart = i;
    51e9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    51ec:	89 45 bc             	mov    %eax,-0x44(%ebp)
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    51ef:	eb 04                	jmp    51f5 <runCalcmd+0x3ac>
          {
            i++;
    51f1:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
    51f5:	8b 55 e0             	mov    -0x20(%ebp),%edx
    51f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    51fb:	01 d0                	add    %edx,%eax
    51fd:	0f b6 00             	movzbl (%eax),%eax
    5200:	3c 22                	cmp    $0x22,%al
    5202:	74 0f                	je     5213 <runCalcmd+0x3ca>
    5204:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5207:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    520a:	01 d0                	add    %edx,%eax
    520c:	0f b6 00             	movzbl (%eax),%eax
    520f:	84 c0                	test   %al,%al
    5211:	75 de                	jne    51f1 <runCalcmd+0x3a8>
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
    5213:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5216:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5219:	01 d0                	add    %edx,%eax
    521b:	0f b6 00             	movzbl (%eax),%eax
    521e:	3c 22                	cmp    $0x22,%al
    5220:	0f 85 4e 01 00 00    	jne    5374 <runCalcmd+0x52b>
    5226:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5229:	8d 50 01             	lea    0x1(%eax),%edx
    522c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    522f:	01 d0                	add    %edx,%eax
    5231:	0f b6 00             	movzbl (%eax),%eax
    5234:	84 c0                	test   %al,%al
    5236:	0f 85 38 01 00 00    	jne    5374 <runCalcmd+0x52b>
          {//correct format
            if(v_num == 0)
    523c:	a1 8c 98 00 00       	mov    0x988c,%eax
    5241:	85 c0                	test   %eax,%eax
    5243:	75 15                	jne    525a <runCalcmd+0x411>
              readVariables(variables,&v_num);
    5245:	83 ec 08             	sub    $0x8,%esp
    5248:	68 8c 98 00 00       	push   $0x988c
    524d:	68 00 e0 00 00       	push   $0xe000
    5252:	e8 06 18 00 00       	call   6a5d <readVariables>
    5257:	83 c4 10             	add    $0x10,%esp
            //printf(1,"read:%d\n",v_num);
            int index = 0;
    525a:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            for(; index<v_num; index++)
    5261:	eb 26                	jmp    5289 <runCalcmd+0x440>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
    5263:	8b 45 d8             	mov    -0x28(%ebp),%eax
    5266:	c1 e0 05             	shl    $0x5,%eax
    5269:	05 00 e0 00 00       	add    $0xe000,%eax
    526e:	8d 50 04             	lea    0x4(%eax),%edx
    5271:	83 ec 08             	sub    $0x8,%esp
    5274:	8d 45 94             	lea    -0x6c(%ebp),%eax
    5277:	50                   	push   %eax
    5278:	52                   	push   %edx
    5279:	e8 84 e7 ff ff       	call   3a02 <strcmp>
    527e:	83 c4 10             	add    $0x10,%esp
    5281:	85 c0                	test   %eax,%eax
    5283:	74 10                	je     5295 <runCalcmd+0x44c>
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
    5285:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    5289:	a1 8c 98 00 00       	mov    0x988c,%eax
    528e:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    5291:	7c d0                	jl     5263 <runCalcmd+0x41a>
    5293:	eb 01                	jmp    5296 <runCalcmd+0x44d>
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
    5295:	90                   	nop
            }
            if(index == v_num) //new variable
    5296:	a1 8c 98 00 00       	mov    0x988c,%eax
    529b:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    529e:	75 2b                	jne    52cb <runCalcmd+0x482>
            {
              strcpy(variables[index].name,name);
    52a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    52a3:	c1 e0 05             	shl    $0x5,%eax
    52a6:	05 00 e0 00 00       	add    $0xe000,%eax
    52ab:	8d 50 04             	lea    0x4(%eax),%edx
    52ae:	83 ec 08             	sub    $0x8,%esp
    52b1:	8d 45 94             	lea    -0x6c(%ebp),%eax
    52b4:	50                   	push   %eax
    52b5:	52                   	push   %edx
    52b6:	e8 17 e7 ff ff       	call   39d2 <strcpy>
    52bb:	83 c4 10             	add    $0x10,%esp
              v_num++;
    52be:	a1 8c 98 00 00       	mov    0x988c,%eax
    52c3:	83 c0 01             	add    $0x1,%eax
    52c6:	a3 8c 98 00 00       	mov    %eax,0x988c
            }
            variables[index].type = V_STRING;
    52cb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    52ce:	c1 e0 05             	shl    $0x5,%eax
    52d1:	05 00 e0 00 00       	add    $0xe000,%eax
    52d6:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
            int slen = i-strstart;
    52dc:	8b 45 e0             	mov    -0x20(%ebp),%eax
    52df:	2b 45 bc             	sub    -0x44(%ebp),%eax
    52e2:	89 45 b8             	mov    %eax,-0x48(%ebp)
            char *string = (char*)malloc(slen+1);
    52e5:	8b 45 b8             	mov    -0x48(%ebp),%eax
    52e8:	83 c0 01             	add    $0x1,%eax
    52eb:	83 ec 0c             	sub    $0xc,%esp
    52ee:	50                   	push   %eax
    52ef:	e8 bd ee ff ff       	call   41b1 <malloc>
    52f4:	83 c4 10             	add    $0x10,%esp
    52f7:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            strcpy(string,line+strstart);
    52fa:	8b 55 bc             	mov    -0x44(%ebp),%edx
    52fd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5300:	01 d0                	add    %edx,%eax
    5302:	83 ec 08             	sub    $0x8,%esp
    5305:	50                   	push   %eax
    5306:	ff 75 b4             	pushl  -0x4c(%ebp)
    5309:	e8 c4 e6 ff ff       	call   39d2 <strcpy>
    530e:	83 c4 10             	add    $0x10,%esp
            string[slen] = '\0';
    5311:	8b 55 b8             	mov    -0x48(%ebp),%edx
    5314:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    5317:	01 d0                	add    %edx,%eax
    5319:	c6 00 00             	movb   $0x0,(%eax)
            variables[index].value.str = string;
    531c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    531f:	c1 e0 05             	shl    $0x5,%eax
    5322:	8d 90 18 e0 00 00    	lea    0xe018(%eax),%edx
    5328:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    532b:	89 02                	mov    %eax,(%edx)
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
    532d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    5330:	c1 e0 05             	shl    $0x5,%eax
    5333:	05 18 e0 00 00       	add    $0xe018,%eax
    5338:	8b 00                	mov    (%eax),%eax
    533a:	8b 55 d8             	mov    -0x28(%ebp),%edx
    533d:	c1 e2 05             	shl    $0x5,%edx
    5340:	81 c2 00 e0 00 00    	add    $0xe000,%edx
    5346:	83 c2 04             	add    $0x4,%edx
    5349:	50                   	push   %eax
    534a:	52                   	push   %edx
    534b:	68 69 87 00 00       	push   $0x8769
    5350:	6a 01                	push   $0x1
    5352:	e8 58 eb ff ff       	call   3eaf <printf>
    5357:	83 c4 10             	add    $0x10,%esp
            writeVariables(variables,&v_num);
    535a:	83 ec 08             	sub    $0x8,%esp
    535d:	68 8c 98 00 00       	push   $0x988c
    5362:	68 00 e0 00 00       	push   $0xe000
    5367:	e8 a5 19 00 00       	call   6d11 <writeVariables>
    536c:	83 c4 10             	add    $0x10,%esp
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
    536f:	e9 c2 00 00 00       	jmp    5436 <runCalcmd+0x5ed>
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
    5374:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5377:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    537a:	01 d0                	add    %edx,%eax
    537c:	0f b6 00             	movzbl (%eax),%eax
    537f:	84 c0                	test   %al,%al
    5381:	75 1d                	jne    53a0 <runCalcmd+0x557>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
    5383:	83 ec 0c             	sub    $0xc,%esp
    5386:	68 72 87 00 00       	push   $0x8772
    538b:	6a 00                	push   $0x0
    538d:	6a 00                	push   $0x0
    538f:	6a 01                	push   $0x1
    5391:	6a 04                	push   $0x4
    5393:	e8 3f 12 00 00       	call   65d7 <color_printf>
    5398:	83 c4 20             	add    $0x20,%esp
    539b:	e9 96 00 00 00       	jmp    5436 <runCalcmd+0x5ed>
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
    53a0:	83 ec 0c             	sub    $0xc,%esp
    53a3:	68 88 87 00 00       	push   $0x8788
    53a8:	6a 00                	push   $0x0
    53aa:	6a 00                	push   $0x0
    53ac:	6a 01                	push   $0x1
    53ae:	6a 04                	push   $0x4
    53b0:	e8 22 12 00 00       	call   65d7 <color_printf>
    53b5:	83 c4 20             	add    $0x20,%esp
    53b8:	eb 7c                	jmp    5436 <runCalcmd+0x5ed>
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    53ba:	83 ec 0c             	sub    $0xc,%esp
    53bd:	68 a9 87 00 00       	push   $0x87a9
    53c2:	6a 00                	push   $0x0
    53c4:	6a 00                	push   $0x0
    53c6:	6a 01                	push   $0x1
    53c8:	6a 04                	push   $0x4
    53ca:	e8 08 12 00 00       	call   65d7 <color_printf>
    53cf:	83 c4 20             	add    $0x20,%esp
    53d2:	eb 62                	jmp    5436 <runCalcmd+0x5ed>
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    53d4:	83 ec 0c             	sub    $0xc,%esp
    53d7:	68 a9 87 00 00       	push   $0x87a9
    53dc:	6a 00                	push   $0x0
    53de:	6a 00                	push   $0x0
    53e0:	6a 01                	push   $0x1
    53e2:	6a 04                	push   $0x4
    53e4:	e8 ee 11 00 00       	call   65d7 <color_printf>
    53e9:	83 c4 20             	add    $0x20,%esp
    53ec:	eb 48                	jmp    5436 <runCalcmd+0x5ed>
    }
  }
  else
  {
    double result = Compute(line);
    53ee:	83 ec 0c             	sub    $0xc,%esp
    53f1:	ff 75 d4             	pushl  -0x2c(%ebp)
    53f4:	e8 2b 01 00 00       	call   5524 <Compute>
    53f9:	83 c4 10             	add    $0x10,%esp
    53fc:	dd 5d a8             	fstpl  -0x58(%ebp)
    if(isEqual(result,WRONG_ANS) == 0)
    53ff:	dd 05 70 88 00 00    	fldl   0x8870
    5405:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5409:	dd 1c 24             	fstpl  (%esp)
    540c:	ff 75 ac             	pushl  -0x54(%ebp)
    540f:	ff 75 a8             	pushl  -0x58(%ebp)
    5412:	e8 96 f4 ff ff       	call   48ad <isEqual>
    5417:	83 c4 10             	add    $0x10,%esp
    541a:	85 c0                	test   %eax,%eax
    541c:	75 18                	jne    5436 <runCalcmd+0x5ed>
      printf(1,"%f\n",result);
    541e:	ff 75 ac             	pushl  -0x54(%ebp)
    5421:	ff 75 a8             	pushl  -0x58(%ebp)
    5424:	68 c1 87 00 00       	push   $0x87c1
    5429:	6a 01                	push   $0x1
    542b:	e8 7f ea ff ff       	call   3eaf <printf>
    5430:	83 c4 10             	add    $0x10,%esp
    5433:	eb 01                	jmp    5436 <runCalcmd+0x5ed>
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
    5435:	90                   	nop
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
    5436:	e8 c8 e7 ff ff       	call   3c03 <exit>

0000543b <GetLevel>:
}

int g_pos;

int GetLevel(char ch)
{
    543b:	55                   	push   %ebp
    543c:	89 e5                	mov    %esp,%ebp
    543e:	83 ec 04             	sub    $0x4,%esp
    5441:	8b 45 08             	mov    0x8(%ebp),%eax
    5444:	88 45 fc             	mov    %al,-0x4(%ebp)
    switch (ch)
    5447:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
    544b:	83 e8 23             	sub    $0x23,%eax
    544e:	83 f8 0c             	cmp    $0xc,%eax
    5451:	77 25                	ja     5478 <GetLevel+0x3d>
    5453:	8b 04 85 c8 87 00 00 	mov    0x87c8(,%eax,4),%eax
    545a:	ff e0                	jmp    *%eax
    {
    case '+':
    case '-':
        return 1;
    545c:	b8 01 00 00 00       	mov    $0x1,%eax
    5461:	eb 1a                	jmp    547d <GetLevel+0x42>
    case '*':
    case '/':
        return 2;
    5463:	b8 02 00 00 00       	mov    $0x2,%eax
    5468:	eb 13                	jmp    547d <GetLevel+0x42>
    case '(':
        return 0;
    546a:	b8 00 00 00 00       	mov    $0x0,%eax
    546f:	eb 0c                	jmp    547d <GetLevel+0x42>
    case '#':
        return -2;
    5471:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    5476:	eb 05                	jmp    547d <GetLevel+0x42>
    };
    return -1;
    5478:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    547d:	c9                   	leave  
    547e:	c3                   	ret    

0000547f <Operate>:

double Operate(double a1, char op, double a2)
{
    547f:	55                   	push   %ebp
    5480:	89 e5                	mov    %esp,%ebp
    5482:	83 ec 28             	sub    $0x28,%esp
    5485:	8b 45 10             	mov    0x10(%ebp),%eax
    5488:	8b 55 08             	mov    0x8(%ebp),%edx
    548b:	89 55 f0             	mov    %edx,-0x10(%ebp)
    548e:	8b 55 0c             	mov    0xc(%ebp),%edx
    5491:	89 55 f4             	mov    %edx,-0xc(%ebp)
    5494:	88 45 ec             	mov    %al,-0x14(%ebp)
    5497:	8b 45 14             	mov    0x14(%ebp),%eax
    549a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    549d:	8b 45 18             	mov    0x18(%ebp),%eax
    54a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    switch (op)
    54a3:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
    54a7:	83 f8 2b             	cmp    $0x2b,%eax
    54aa:	74 18                	je     54c4 <Operate+0x45>
    54ac:	83 f8 2b             	cmp    $0x2b,%eax
    54af:	7f 07                	jg     54b8 <Operate+0x39>
    54b1:	83 f8 2a             	cmp    $0x2a,%eax
    54b4:	74 1e                	je     54d4 <Operate+0x55>
    54b6:	eb 68                	jmp    5520 <Operate+0xa1>
    54b8:	83 f8 2d             	cmp    $0x2d,%eax
    54bb:	74 0f                	je     54cc <Operate+0x4d>
    54bd:	83 f8 2f             	cmp    $0x2f,%eax
    54c0:	74 1a                	je     54dc <Operate+0x5d>
    54c2:	eb 5c                	jmp    5520 <Operate+0xa1>
    {
    case '+':
        return a1 + a2;
    54c4:	dd 45 f0             	fldl   -0x10(%ebp)
    54c7:	dc 45 e0             	faddl  -0x20(%ebp)
    54ca:	eb 56                	jmp    5522 <Operate+0xa3>
    case '-':
        return a1 - a2;
    54cc:	dd 45 f0             	fldl   -0x10(%ebp)
    54cf:	dc 65 e0             	fsubl  -0x20(%ebp)
    54d2:	eb 4e                	jmp    5522 <Operate+0xa3>
    case '*':
        return a1 * a2;
    54d4:	dd 45 f0             	fldl   -0x10(%ebp)
    54d7:	dc 4d e0             	fmull  -0x20(%ebp)
    54da:	eb 46                	jmp    5522 <Operate+0xa3>
    case '/':
        if(isEqual(a2,0) == 1)
    54dc:	d9 ee                	fldz   
    54de:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    54e2:	dd 1c 24             	fstpl  (%esp)
    54e5:	ff 75 e4             	pushl  -0x1c(%ebp)
    54e8:	ff 75 e0             	pushl  -0x20(%ebp)
    54eb:	e8 bd f3 ff ff       	call   48ad <isEqual>
    54f0:	83 c4 10             	add    $0x10,%esp
    54f3:	83 f8 01             	cmp    $0x1,%eax
    54f6:	75 20                	jne    5518 <Operate+0x99>
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
    54f8:	83 ec 0c             	sub    $0xc,%esp
    54fb:	68 fc 87 00 00       	push   $0x87fc
    5500:	6a 00                	push   $0x0
    5502:	6a 00                	push   $0x0
    5504:	6a 01                	push   $0x1
    5506:	6a 04                	push   $0x4
    5508:	e8 ca 10 00 00       	call   65d7 <color_printf>
    550d:	83 c4 20             	add    $0x20,%esp
          return WRONG_ANS;
    5510:	dd 05 70 88 00 00    	fldl   0x8870
    5516:	eb 0a                	jmp    5522 <Operate+0xa3>
        }
        else
          return a1 / a2;
    5518:	dd 45 f0             	fldl   -0x10(%ebp)
    551b:	dc 75 e0             	fdivl  -0x20(%ebp)
    551e:	eb 02                	jmp    5522 <Operate+0xa3>
    };
    return 1;
    5520:	d9 e8                	fld1   
}
    5522:	c9                   	leave  
    5523:	c3                   	ret    

00005524 <Compute>:

double Compute(char *s)
{
    5524:	55                   	push   %ebp
    5525:	89 e5                	mov    %esp,%ebp
    5527:	53                   	push   %ebx
    5528:	81 ec b4 00 00 00    	sub    $0xb4,%esp
    struct dstack *opnd = dstack();
    552e:	e8 44 14 00 00       	call   6977 <dstack>
    5533:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    struct cstack *optr = cstack();
    5536:	e8 73 13 00 00       	call   68ae <cstack>
    553b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    pushc(optr,'#');
    553e:	83 ec 08             	sub    $0x8,%esp
    5541:	6a 23                	push   $0x23
    5543:	ff 75 e0             	pushl  -0x20(%ebp)
    5546:	e8 91 13 00 00       	call   68dc <pushc>
    554b:	83 c4 10             	add    $0x10,%esp
    int len = strlen(s);
    554e:	83 ec 0c             	sub    $0xc,%esp
    5551:	ff 75 08             	pushl  0x8(%ebp)
    5554:	e8 e8 e4 ff ff       	call   3a41 <strlen>
    5559:	83 c4 10             	add    $0x10,%esp
    555c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int is_minus = 1;
    555f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    for (g_pos = 0; g_pos < len;)
    5566:	c7 05 e0 df 00 00 00 	movl   $0x0,0xdfe0
    556d:	00 00 00 
    5570:	e9 58 05 00 00       	jmp    5acd <Compute+0x5a9>
    {
        if(s[g_pos] == '$') //a variable
    5575:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    557a:	89 c2                	mov    %eax,%edx
    557c:	8b 45 08             	mov    0x8(%ebp),%eax
    557f:	01 d0                	add    %edx,%eax
    5581:	0f b6 00             	movzbl (%eax),%eax
    5584:	3c 24                	cmp    $0x24,%al
    5586:	0f 85 f8 01 00 00    	jne    5784 <Compute+0x260>
        {
          is_minus = 0;
    558c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          g_pos++;
    5593:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    5598:	83 c0 01             	add    $0x1,%eax
    559b:	a3 e0 df 00 00       	mov    %eax,0xdfe0
          if(s[g_pos] != '{')
    55a0:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    55a5:	89 c2                	mov    %eax,%edx
    55a7:	8b 45 08             	mov    0x8(%ebp),%eax
    55aa:	01 d0                	add    %edx,%eax
    55ac:	0f b6 00             	movzbl (%eax),%eax
    55af:	3c 7b                	cmp    $0x7b,%al
    55b1:	74 23                	je     55d6 <Compute+0xb2>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
    55b3:	83 ec 0c             	sub    $0xc,%esp
    55b6:	68 14 88 00 00       	push   $0x8814
    55bb:	6a 00                	push   $0x0
    55bd:	6a 00                	push   $0x0
    55bf:	6a 01                	push   $0x1
    55c1:	6a 04                	push   $0x4
    55c3:	e8 0f 10 00 00       	call   65d7 <color_printf>
    55c8:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    55cb:	dd 05 70 88 00 00    	fldl   0x8870
    55d1:	e9 24 06 00 00       	jmp    5bfa <Compute+0x6d6>
          }
          int i=g_pos+1;
    55d6:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    55db:	83 c0 01             	add    $0x1,%eax
    55de:	89 45 f0             	mov    %eax,-0x10(%ebp)
          for(; i<len; i++)
    55e1:	eb 13                	jmp    55f6 <Compute+0xd2>
          {
            if(s[i] == '}')
    55e3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    55e6:	8b 45 08             	mov    0x8(%ebp),%eax
    55e9:	01 d0                	add    %edx,%eax
    55eb:	0f b6 00             	movzbl (%eax),%eax
    55ee:	3c 7d                	cmp    $0x7d,%al
    55f0:	74 0e                	je     5600 <Compute+0xdc>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
    55f2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    55f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    55f9:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    55fc:	7c e5                	jl     55e3 <Compute+0xbf>
    55fe:	eb 01                	jmp    5601 <Compute+0xdd>
          {
            if(s[i] == '}')
              break;
    5600:	90                   	nop
          }
          if(s[i] != '}')
    5601:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5604:	8b 45 08             	mov    0x8(%ebp),%eax
    5607:	01 d0                	add    %edx,%eax
    5609:	0f b6 00             	movzbl (%eax),%eax
    560c:	3c 7d                	cmp    $0x7d,%al
    560e:	74 23                	je     5633 <Compute+0x10f>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
    5610:	83 ec 0c             	sub    $0xc,%esp
    5613:	68 22 88 00 00       	push   $0x8822
    5618:	6a 00                	push   $0x0
    561a:	6a 00                	push   $0x0
    561c:	6a 01                	push   $0x1
    561e:	6a 04                	push   $0x4
    5620:	e8 b2 0f 00 00       	call   65d7 <color_printf>
    5625:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    5628:	dd 05 70 88 00 00    	fldl   0x8870
    562e:	e9 c7 05 00 00       	jmp    5bfa <Compute+0x6d6>
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
    5633:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    5638:	8b 55 f0             	mov    -0x10(%ebp),%edx
    563b:	29 c2                	sub    %eax,%edx
    563d:	89 d0                	mov    %edx,%eax
    563f:	83 e8 01             	sub    $0x1,%eax
    5642:	89 45 8c             	mov    %eax,-0x74(%ebp)
          for(int j=0; j<len; j++)
    5645:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    564c:	eb 27                	jmp    5675 <Compute+0x151>
          {
            name[j] = s[g_pos+j+1];
    564e:	8b 15 e0 df 00 00    	mov    0xdfe0,%edx
    5654:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5657:	01 d0                	add    %edx,%eax
    5659:	8d 50 01             	lea    0x1(%eax),%edx
    565c:	8b 45 08             	mov    0x8(%ebp),%eax
    565f:	01 d0                	add    %edx,%eax
    5661:	0f b6 00             	movzbl (%eax),%eax
    5664:	8d 8d 54 ff ff ff    	lea    -0xac(%ebp),%ecx
    566a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    566d:	01 ca                	add    %ecx,%edx
    566f:	88 02                	mov    %al,(%edx)
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
    5671:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5675:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5678:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    567b:	7c d1                	jl     564e <Compute+0x12a>
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
    567d:	8d 95 54 ff ff ff    	lea    -0xac(%ebp),%edx
    5683:	8b 45 8c             	mov    -0x74(%ebp),%eax
    5686:	01 d0                	add    %edx,%eax
    5688:	c6 00 00             	movb   $0x0,(%eax)
          int index = 0;
    568b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
          if(v_num == 0)
    5692:	a1 8c 98 00 00       	mov    0x988c,%eax
    5697:	85 c0                	test   %eax,%eax
    5699:	75 40                	jne    56db <Compute+0x1b7>
            readVariables(variables,&v_num);
    569b:	83 ec 08             	sub    $0x8,%esp
    569e:	68 8c 98 00 00       	push   $0x988c
    56a3:	68 00 e0 00 00       	push   $0xe000
    56a8:	e8 b0 13 00 00       	call   6a5d <readVariables>
    56ad:	83 c4 10             	add    $0x10,%esp
          for(; index<v_num; index++)
    56b0:	eb 29                	jmp    56db <Compute+0x1b7>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
    56b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    56b5:	c1 e0 05             	shl    $0x5,%eax
    56b8:	05 00 e0 00 00       	add    $0xe000,%eax
    56bd:	8d 50 04             	lea    0x4(%eax),%edx
    56c0:	83 ec 08             	sub    $0x8,%esp
    56c3:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    56c9:	50                   	push   %eax
    56ca:	52                   	push   %edx
    56cb:	e8 32 e3 ff ff       	call   3a02 <strcmp>
    56d0:	83 c4 10             	add    $0x10,%esp
    56d3:	85 c0                	test   %eax,%eax
    56d5:	74 10                	je     56e7 <Compute+0x1c3>
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
    56d7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    56db:	a1 8c 98 00 00       	mov    0x988c,%eax
    56e0:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    56e3:	7c cd                	jl     56b2 <Compute+0x18e>
    56e5:	eb 01                	jmp    56e8 <Compute+0x1c4>
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
    56e7:	90                   	nop
          }
          if(index == v_num) //no such variable
    56e8:	a1 8c 98 00 00       	mov    0x988c,%eax
    56ed:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    56f0:	75 2a                	jne    571c <Compute+0x1f8>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
    56f2:	83 ec 08             	sub    $0x8,%esp
    56f5:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
    56fb:	50                   	push   %eax
    56fc:	68 30 88 00 00       	push   $0x8830
    5701:	6a 00                	push   $0x0
    5703:	6a 00                	push   $0x0
    5705:	6a 01                	push   $0x1
    5707:	6a 04                	push   $0x4
    5709:	e8 c9 0e 00 00       	call   65d7 <color_printf>
    570e:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    5711:	dd 05 70 88 00 00    	fldl   0x8870
    5717:	e9 de 04 00 00       	jmp    5bfa <Compute+0x6d6>
          }
          if(variables[index].type == V_STRING)
    571c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    571f:	c1 e0 05             	shl    $0x5,%eax
    5722:	05 00 e0 00 00       	add    $0xe000,%eax
    5727:	8b 00                	mov    (%eax),%eax
    5729:	83 f8 02             	cmp    $0x2,%eax
    572c:	75 23                	jne    5751 <Compute+0x22d>
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
    572e:	83 ec 0c             	sub    $0xc,%esp
    5731:	68 4a 88 00 00       	push   $0x884a
    5736:	6a 00                	push   $0x0
    5738:	6a 00                	push   $0x0
    573a:	6a 01                	push   $0x1
    573c:	6a 04                	push   $0x4
    573e:	e8 94 0e 00 00       	call   65d7 <color_printf>
    5743:	83 c4 20             	add    $0x20,%esp
            return WRONG_ANS;
    5746:	dd 05 70 88 00 00    	fldl   0x8870
    574c:	e9 a9 04 00 00       	jmp    5bfa <Compute+0x6d6>
          }
          g_pos = i+1;
    5751:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5754:	83 c0 01             	add    $0x1,%eax
    5757:	a3 e0 df 00 00       	mov    %eax,0xdfe0
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
    575c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    575f:	c1 e0 05             	shl    $0x5,%eax
    5762:	05 10 e0 00 00       	add    $0xe010,%eax
    5767:	dd 40 08             	fldl   0x8(%eax)
    576a:	83 ec 04             	sub    $0x4,%esp
    576d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5771:	dd 1c 24             	fstpl  (%esp)
    5774:	ff 75 e4             	pushl  -0x1c(%ebp)
    5777:	e8 2f 12 00 00       	call   69ab <pushd>
    577c:	83 c4 10             	add    $0x10,%esp
    577f:	e9 49 03 00 00       	jmp    5acd <Compute+0x5a9>
        }
        else if (s[g_pos] == '-' && is_minus)
    5784:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    5789:	89 c2                	mov    %eax,%edx
    578b:	8b 45 08             	mov    0x8(%ebp),%eax
    578e:	01 d0                	add    %edx,%eax
    5790:	0f b6 00             	movzbl (%eax),%eax
    5793:	3c 2d                	cmp    $0x2d,%al
    5795:	75 3f                	jne    57d6 <Compute+0x2b2>
    5797:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    579b:	74 39                	je     57d6 <Compute+0x2b2>
        {
            pushd(opnd,0);
    579d:	83 ec 04             	sub    $0x4,%esp
    57a0:	d9 ee                	fldz   
    57a2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    57a6:	dd 1c 24             	fstpl  (%esp)
    57a9:	ff 75 e4             	pushl  -0x1c(%ebp)
    57ac:	e8 fa 11 00 00       	call   69ab <pushd>
    57b1:	83 c4 10             	add    $0x10,%esp
            pushc(optr,'-');
    57b4:	83 ec 08             	sub    $0x8,%esp
    57b7:	6a 2d                	push   $0x2d
    57b9:	ff 75 e0             	pushl  -0x20(%ebp)
    57bc:	e8 1b 11 00 00       	call   68dc <pushc>
    57c1:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    57c4:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    57c9:	83 c0 01             	add    $0x1,%eax
    57cc:	a3 e0 df 00 00       	mov    %eax,0xdfe0
    57d1:	e9 f7 02 00 00       	jmp    5acd <Compute+0x5a9>
        }
        else if (s[g_pos] == ')')
    57d6:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    57db:	89 c2                	mov    %eax,%edx
    57dd:	8b 45 08             	mov    0x8(%ebp),%eax
    57e0:	01 d0                	add    %edx,%eax
    57e2:	0f b6 00             	movzbl (%eax),%eax
    57e5:	3c 29                	cmp    $0x29,%al
    57e7:	0f 85 01 01 00 00    	jne    58ee <Compute+0x3ca>
        {
            is_minus = 0;
    57ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            g_pos++;
    57f4:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    57f9:	83 c0 01             	add    $0x1,%eax
    57fc:	a3 e0 df 00 00       	mov    %eax,0xdfe0
            while (topc(optr) != '(')
    5801:	e9 bf 00 00 00       	jmp    58c5 <Compute+0x3a1>
            {
                double a2 = topd(opnd);
    5806:	83 ec 0c             	sub    $0xc,%esp
    5809:	ff 75 e4             	pushl  -0x1c(%ebp)
    580c:	e8 37 12 00 00       	call   6a48 <topd>
    5811:	83 c4 10             	add    $0x10,%esp
    5814:	dd 5d d0             	fstpl  -0x30(%ebp)
                popd(opnd);
    5817:	83 ec 0c             	sub    $0xc,%esp
    581a:	ff 75 e4             	pushl  -0x1c(%ebp)
    581d:	e8 dd 11 00 00       	call   69ff <popd>
    5822:	dd d8                	fstp   %st(0)
    5824:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    5827:	83 ec 0c             	sub    $0xc,%esp
    582a:	ff 75 e4             	pushl  -0x1c(%ebp)
    582d:	e8 16 12 00 00       	call   6a48 <topd>
    5832:	83 c4 10             	add    $0x10,%esp
    5835:	dd 5d c8             	fstpl  -0x38(%ebp)
                popd(opnd);
    5838:	83 ec 0c             	sub    $0xc,%esp
    583b:	ff 75 e4             	pushl  -0x1c(%ebp)
    583e:	e8 bc 11 00 00       	call   69ff <popd>
    5843:	dd d8                	fstp   %st(0)
    5845:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    5848:	83 ec 0c             	sub    $0xc,%esp
    584b:	ff 75 e0             	pushl  -0x20(%ebp)
    584e:	e8 11 11 00 00       	call   6964 <topc>
    5853:	83 c4 10             	add    $0x10,%esp
    5856:	88 45 c7             	mov    %al,-0x39(%ebp)
                popc(optr);
    5859:	83 ec 0c             	sub    $0xc,%esp
    585c:	ff 75 e0             	pushl  -0x20(%ebp)
    585f:	e8 be 10 00 00       	call   6922 <popc>
    5864:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    5867:	0f be 45 c7          	movsbl -0x39(%ebp),%eax
    586b:	83 ec 0c             	sub    $0xc,%esp
    586e:	ff 75 d4             	pushl  -0x2c(%ebp)
    5871:	ff 75 d0             	pushl  -0x30(%ebp)
    5874:	50                   	push   %eax
    5875:	ff 75 cc             	pushl  -0x34(%ebp)
    5878:	ff 75 c8             	pushl  -0x38(%ebp)
    587b:	e8 ff fb ff ff       	call   547f <Operate>
    5880:	83 c4 20             	add    $0x20,%esp
    5883:	dd 5d b8             	fstpl  -0x48(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    5886:	dd 05 70 88 00 00    	fldl   0x8870
    588c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5890:	dd 1c 24             	fstpl  (%esp)
    5893:	ff 75 bc             	pushl  -0x44(%ebp)
    5896:	ff 75 b8             	pushl  -0x48(%ebp)
    5899:	e8 0f f0 ff ff       	call   48ad <isEqual>
    589e:	83 c4 10             	add    $0x10,%esp
    58a1:	83 f8 01             	cmp    $0x1,%eax
    58a4:	75 0b                	jne    58b1 <Compute+0x38d>
                  return WRONG_ANS;
    58a6:	dd 05 70 88 00 00    	fldl   0x8870
    58ac:	e9 49 03 00 00       	jmp    5bfa <Compute+0x6d6>
                pushd(opnd,result);
    58b1:	83 ec 04             	sub    $0x4,%esp
    58b4:	ff 75 bc             	pushl  -0x44(%ebp)
    58b7:	ff 75 b8             	pushl  -0x48(%ebp)
    58ba:	ff 75 e4             	pushl  -0x1c(%ebp)
    58bd:	e8 e9 10 00 00       	call   69ab <pushd>
    58c2:	83 c4 10             	add    $0x10,%esp
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
    58c5:	83 ec 0c             	sub    $0xc,%esp
    58c8:	ff 75 e0             	pushl  -0x20(%ebp)
    58cb:	e8 94 10 00 00       	call   6964 <topc>
    58d0:	83 c4 10             	add    $0x10,%esp
    58d3:	3c 28                	cmp    $0x28,%al
    58d5:	0f 85 2b ff ff ff    	jne    5806 <Compute+0x2e2>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
    58db:	83 ec 0c             	sub    $0xc,%esp
    58de:	ff 75 e0             	pushl  -0x20(%ebp)
    58e1:	e8 3c 10 00 00       	call   6922 <popc>
    58e6:	83 c4 10             	add    $0x10,%esp
    58e9:	e9 df 01 00 00       	jmp    5acd <Compute+0x5a9>
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
    58ee:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    58f3:	89 c2                	mov    %eax,%edx
    58f5:	8b 45 08             	mov    0x8(%ebp),%eax
    58f8:	01 d0                	add    %edx,%eax
    58fa:	0f b6 00             	movzbl (%eax),%eax
    58fd:	3c 2f                	cmp    $0x2f,%al
    58ff:	7e 49                	jle    594a <Compute+0x426>
    5901:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    5906:	89 c2                	mov    %eax,%edx
    5908:	8b 45 08             	mov    0x8(%ebp),%eax
    590b:	01 d0                	add    %edx,%eax
    590d:	0f b6 00             	movzbl (%eax),%eax
    5910:	3c 39                	cmp    $0x39,%al
    5912:	7f 36                	jg     594a <Compute+0x426>
        {
            is_minus = 0;
    5914:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            double result = Translation(s,&g_pos);
    591b:	83 ec 08             	sub    $0x8,%esp
    591e:	68 e0 df 00 00       	push   $0xdfe0
    5923:	ff 75 08             	pushl  0x8(%ebp)
    5926:	e8 c3 eb ff ff       	call   44ee <Translation>
    592b:	83 c4 10             	add    $0x10,%esp
    592e:	dd 5d b0             	fstpl  -0x50(%ebp)
            pushd(opnd,result);
    5931:	83 ec 04             	sub    $0x4,%esp
    5934:	ff 75 b4             	pushl  -0x4c(%ebp)
    5937:	ff 75 b0             	pushl  -0x50(%ebp)
    593a:	ff 75 e4             	pushl  -0x1c(%ebp)
    593d:	e8 69 10 00 00       	call   69ab <pushd>
    5942:	83 c4 10             	add    $0x10,%esp
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
    5945:	e9 83 01 00 00       	jmp    5acd <Compute+0x5a9>
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
    594a:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    594f:	89 c2                	mov    %eax,%edx
    5951:	8b 45 08             	mov    0x8(%ebp),%eax
    5954:	01 d0                	add    %edx,%eax
    5956:	0f b6 00             	movzbl (%eax),%eax
    5959:	3c 28                	cmp    $0x28,%al
    595b:	0f 85 f9 00 00 00    	jne    5a5a <Compute+0x536>
        {
            is_minus = 1;
    5961:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
            pushc(optr,s[g_pos]);
    5968:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    596d:	89 c2                	mov    %eax,%edx
    596f:	8b 45 08             	mov    0x8(%ebp),%eax
    5972:	01 d0                	add    %edx,%eax
    5974:	0f b6 00             	movzbl (%eax),%eax
    5977:	0f be c0             	movsbl %al,%eax
    597a:	83 ec 08             	sub    $0x8,%esp
    597d:	50                   	push   %eax
    597e:	ff 75 e0             	pushl  -0x20(%ebp)
    5981:	e8 56 0f 00 00       	call   68dc <pushc>
    5986:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    5989:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    598e:	83 c0 01             	add    $0x1,%eax
    5991:	a3 e0 df 00 00       	mov    %eax,0xdfe0
    5996:	e9 32 01 00 00       	jmp    5acd <Compute+0x5a9>
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
    599b:	83 ec 0c             	sub    $0xc,%esp
    599e:	ff 75 e4             	pushl  -0x1c(%ebp)
    59a1:	e8 a2 10 00 00       	call   6a48 <topd>
    59a6:	83 c4 10             	add    $0x10,%esp
    59a9:	dd 5d a8             	fstpl  -0x58(%ebp)
                popd(opnd);
    59ac:	83 ec 0c             	sub    $0xc,%esp
    59af:	ff 75 e4             	pushl  -0x1c(%ebp)
    59b2:	e8 48 10 00 00       	call   69ff <popd>
    59b7:	dd d8                	fstp   %st(0)
    59b9:	83 c4 10             	add    $0x10,%esp
                double a1 = topd(opnd);
    59bc:	83 ec 0c             	sub    $0xc,%esp
    59bf:	ff 75 e4             	pushl  -0x1c(%ebp)
    59c2:	e8 81 10 00 00       	call   6a48 <topd>
    59c7:	83 c4 10             	add    $0x10,%esp
    59ca:	dd 5d a0             	fstpl  -0x60(%ebp)
                popd(opnd);
    59cd:	83 ec 0c             	sub    $0xc,%esp
    59d0:	ff 75 e4             	pushl  -0x1c(%ebp)
    59d3:	e8 27 10 00 00       	call   69ff <popd>
    59d8:	dd d8                	fstp   %st(0)
    59da:	83 c4 10             	add    $0x10,%esp
                char op = topc(optr);
    59dd:	83 ec 0c             	sub    $0xc,%esp
    59e0:	ff 75 e0             	pushl  -0x20(%ebp)
    59e3:	e8 7c 0f 00 00       	call   6964 <topc>
    59e8:	83 c4 10             	add    $0x10,%esp
    59eb:	88 45 9f             	mov    %al,-0x61(%ebp)
                popc(optr);
    59ee:	83 ec 0c             	sub    $0xc,%esp
    59f1:	ff 75 e0             	pushl  -0x20(%ebp)
    59f4:	e8 29 0f 00 00       	call   6922 <popc>
    59f9:	83 c4 10             	add    $0x10,%esp
                double result = Operate(a1, op, a2);
    59fc:	0f be 45 9f          	movsbl -0x61(%ebp),%eax
    5a00:	83 ec 0c             	sub    $0xc,%esp
    5a03:	ff 75 ac             	pushl  -0x54(%ebp)
    5a06:	ff 75 a8             	pushl  -0x58(%ebp)
    5a09:	50                   	push   %eax
    5a0a:	ff 75 a4             	pushl  -0x5c(%ebp)
    5a0d:	ff 75 a0             	pushl  -0x60(%ebp)
    5a10:	e8 6a fa ff ff       	call   547f <Operate>
    5a15:	83 c4 20             	add    $0x20,%esp
    5a18:	dd 5d 90             	fstpl  -0x70(%ebp)
                if(isEqual(result,WRONG_ANS) == 1)
    5a1b:	dd 05 70 88 00 00    	fldl   0x8870
    5a21:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5a25:	dd 1c 24             	fstpl  (%esp)
    5a28:	ff 75 94             	pushl  -0x6c(%ebp)
    5a2b:	ff 75 90             	pushl  -0x70(%ebp)
    5a2e:	e8 7a ee ff ff       	call   48ad <isEqual>
    5a33:	83 c4 10             	add    $0x10,%esp
    5a36:	83 f8 01             	cmp    $0x1,%eax
    5a39:	75 0b                	jne    5a46 <Compute+0x522>
                  return WRONG_ANS;
    5a3b:	dd 05 70 88 00 00    	fldl   0x8870
    5a41:	e9 b4 01 00 00       	jmp    5bfa <Compute+0x6d6>
                pushd(opnd,result);
    5a46:	83 ec 04             	sub    $0x4,%esp
    5a49:	ff 75 94             	pushl  -0x6c(%ebp)
    5a4c:	ff 75 90             	pushl  -0x70(%ebp)
    5a4f:	ff 75 e4             	pushl  -0x1c(%ebp)
    5a52:	e8 54 0f 00 00       	call   69ab <pushd>
    5a57:	83 c4 10             	add    $0x10,%esp
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
    5a5a:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    5a5f:	89 c2                	mov    %eax,%edx
    5a61:	8b 45 08             	mov    0x8(%ebp),%eax
    5a64:	01 d0                	add    %edx,%eax
    5a66:	0f b6 00             	movzbl (%eax),%eax
    5a69:	0f be c0             	movsbl %al,%eax
    5a6c:	83 ec 0c             	sub    $0xc,%esp
    5a6f:	50                   	push   %eax
    5a70:	e8 c6 f9 ff ff       	call   543b <GetLevel>
    5a75:	83 c4 10             	add    $0x10,%esp
    5a78:	89 c3                	mov    %eax,%ebx
    5a7a:	83 ec 0c             	sub    $0xc,%esp
    5a7d:	ff 75 e0             	pushl  -0x20(%ebp)
    5a80:	e8 df 0e 00 00       	call   6964 <topc>
    5a85:	83 c4 10             	add    $0x10,%esp
    5a88:	0f be c0             	movsbl %al,%eax
    5a8b:	83 ec 0c             	sub    $0xc,%esp
    5a8e:	50                   	push   %eax
    5a8f:	e8 a7 f9 ff ff       	call   543b <GetLevel>
    5a94:	83 c4 10             	add    $0x10,%esp
    5a97:	39 c3                	cmp    %eax,%ebx
    5a99:	0f 8e fc fe ff ff    	jle    599b <Compute+0x477>
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
    5a9f:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    5aa4:	89 c2                	mov    %eax,%edx
    5aa6:	8b 45 08             	mov    0x8(%ebp),%eax
    5aa9:	01 d0                	add    %edx,%eax
    5aab:	0f b6 00             	movzbl (%eax),%eax
    5aae:	0f be c0             	movsbl %al,%eax
    5ab1:	83 ec 08             	sub    $0x8,%esp
    5ab4:	50                   	push   %eax
    5ab5:	ff 75 e0             	pushl  -0x20(%ebp)
    5ab8:	e8 1f 0e 00 00       	call   68dc <pushc>
    5abd:	83 c4 10             	add    $0x10,%esp
            g_pos++;
    5ac0:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    5ac5:	83 c0 01             	add    $0x1,%eax
    5ac8:	a3 e0 df 00 00       	mov    %eax,0xdfe0
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    5acd:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    5ad2:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    5ad5:	0f 8c 9a fa ff ff    	jl     5575 <Compute+0x51>
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    5adb:	e9 da 00 00 00       	jmp    5bba <Compute+0x696>
    {
        double a2 = topd(opnd);
    5ae0:	83 ec 0c             	sub    $0xc,%esp
    5ae3:	ff 75 e4             	pushl  -0x1c(%ebp)
    5ae6:	e8 5d 0f 00 00       	call   6a48 <topd>
    5aeb:	83 c4 10             	add    $0x10,%esp
    5aee:	dd 5d 80             	fstpl  -0x80(%ebp)
        popd(opnd);
    5af1:	83 ec 0c             	sub    $0xc,%esp
    5af4:	ff 75 e4             	pushl  -0x1c(%ebp)
    5af7:	e8 03 0f 00 00       	call   69ff <popd>
    5afc:	dd d8                	fstp   %st(0)
    5afe:	83 c4 10             	add    $0x10,%esp
        double a1 = topd(opnd);
    5b01:	83 ec 0c             	sub    $0xc,%esp
    5b04:	ff 75 e4             	pushl  -0x1c(%ebp)
    5b07:	e8 3c 0f 00 00       	call   6a48 <topd>
    5b0c:	83 c4 10             	add    $0x10,%esp
    5b0f:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
        popd(opnd);
    5b15:	83 ec 0c             	sub    $0xc,%esp
    5b18:	ff 75 e4             	pushl  -0x1c(%ebp)
    5b1b:	e8 df 0e 00 00       	call   69ff <popd>
    5b20:	dd d8                	fstp   %st(0)
    5b22:	83 c4 10             	add    $0x10,%esp
        char op = topc(optr);
    5b25:	83 ec 0c             	sub    $0xc,%esp
    5b28:	ff 75 e0             	pushl  -0x20(%ebp)
    5b2b:	e8 34 0e 00 00       	call   6964 <topc>
    5b30:	83 c4 10             	add    $0x10,%esp
    5b33:	88 85 77 ff ff ff    	mov    %al,-0x89(%ebp)
        popc(optr);
    5b39:	83 ec 0c             	sub    $0xc,%esp
    5b3c:	ff 75 e0             	pushl  -0x20(%ebp)
    5b3f:	e8 de 0d 00 00       	call   6922 <popc>
    5b44:	83 c4 10             	add    $0x10,%esp
        double result = Operate(a1, op, a2);
    5b47:	0f be 85 77 ff ff ff 	movsbl -0x89(%ebp),%eax
    5b4e:	83 ec 0c             	sub    $0xc,%esp
    5b51:	ff 75 84             	pushl  -0x7c(%ebp)
    5b54:	ff 75 80             	pushl  -0x80(%ebp)
    5b57:	50                   	push   %eax
    5b58:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
    5b5e:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
    5b64:	e8 16 f9 ff ff       	call   547f <Operate>
    5b69:	83 c4 20             	add    $0x20,%esp
    5b6c:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
        if(isEqual(result,WRONG_ANS) == 1)
    5b72:	dd 05 70 88 00 00    	fldl   0x8870
    5b78:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5b7c:	dd 1c 24             	fstpl  (%esp)
    5b7f:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    5b85:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    5b8b:	e8 1d ed ff ff       	call   48ad <isEqual>
    5b90:	83 c4 10             	add    $0x10,%esp
    5b93:	83 f8 01             	cmp    $0x1,%eax
    5b96:	75 08                	jne    5ba0 <Compute+0x67c>
          return WRONG_ANS;
    5b98:	dd 05 70 88 00 00    	fldl   0x8870
    5b9e:	eb 5a                	jmp    5bfa <Compute+0x6d6>
        pushd(opnd,result);
    5ba0:	83 ec 04             	sub    $0x4,%esp
    5ba3:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
    5ba9:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
    5baf:	ff 75 e4             	pushl  -0x1c(%ebp)
    5bb2:	e8 f4 0d 00 00       	call   69ab <pushd>
    5bb7:	83 c4 10             	add    $0x10,%esp
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    5bba:	83 ec 0c             	sub    $0xc,%esp
    5bbd:	ff 75 e0             	pushl  -0x20(%ebp)
    5bc0:	e8 9f 0d 00 00       	call   6964 <topc>
    5bc5:	83 c4 10             	add    $0x10,%esp
    5bc8:	3c 23                	cmp    $0x23,%al
    5bca:	0f 85 10 ff ff ff    	jne    5ae0 <Compute+0x5bc>
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    5bd0:	83 ec 0c             	sub    $0xc,%esp
    5bd3:	ff 75 e4             	pushl  -0x1c(%ebp)
    5bd6:	e8 94 e4 ff ff       	call   406f <free>
    5bdb:	83 c4 10             	add    $0x10,%esp
    free(optr);
    5bde:	83 ec 0c             	sub    $0xc,%esp
    5be1:	ff 75 e0             	pushl  -0x20(%ebp)
    5be4:	e8 86 e4 ff ff       	call   406f <free>
    5be9:	83 c4 10             	add    $0x10,%esp
    return topd(opnd);
    5bec:	83 ec 0c             	sub    $0xc,%esp
    5bef:	ff 75 e4             	pushl  -0x1c(%ebp)
    5bf2:	e8 51 0e 00 00       	call   6a48 <topd>
    5bf7:	83 c4 10             	add    $0x10,%esp
}
    5bfa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5bfd:	c9                   	leave  
    5bfe:	c3                   	ret    

00005bff <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
    5bff:	55                   	push   %ebp
    5c00:	89 e5                	mov    %esp,%ebp
    5c02:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
    5c05:	8b 45 08             	mov    0x8(%ebp),%eax
    5c08:	8b 00                	mov    (%eax),%eax
    5c0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    5c0d:	eb 04                	jmp    5c13 <gettoken+0x14>
    s++;
    5c0f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    5c13:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c16:	3b 45 0c             	cmp    0xc(%ebp),%eax
    5c19:	73 1e                	jae    5c39 <gettoken+0x3a>
    5c1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c1e:	0f b6 00             	movzbl (%eax),%eax
    5c21:	0f be c0             	movsbl %al,%eax
    5c24:	83 ec 08             	sub    $0x8,%esp
    5c27:	50                   	push   %eax
    5c28:	68 d4 97 00 00       	push   $0x97d4
    5c2d:	e8 50 de ff ff       	call   3a82 <strchr>
    5c32:	83 c4 10             	add    $0x10,%esp
    5c35:	85 c0                	test   %eax,%eax
    5c37:	75 d6                	jne    5c0f <gettoken+0x10>
    s++;
  if(q)
    5c39:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    5c3d:	74 08                	je     5c47 <gettoken+0x48>
    *q = s;
    5c3f:	8b 45 10             	mov    0x10(%ebp),%eax
    5c42:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5c45:	89 10                	mov    %edx,(%eax)
  ret = *s;
    5c47:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c4a:	0f b6 00             	movzbl (%eax),%eax
    5c4d:	0f be c0             	movsbl %al,%eax
    5c50:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    5c53:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c56:	0f b6 00             	movzbl (%eax),%eax
    5c59:	0f be c0             	movsbl %al,%eax
    5c5c:	83 f8 29             	cmp    $0x29,%eax
    5c5f:	7f 14                	jg     5c75 <gettoken+0x76>
    5c61:	83 f8 28             	cmp    $0x28,%eax
    5c64:	7d 28                	jge    5c8e <gettoken+0x8f>
    5c66:	85 c0                	test   %eax,%eax
    5c68:	0f 84 94 00 00 00    	je     5d02 <gettoken+0x103>
    5c6e:	83 f8 26             	cmp    $0x26,%eax
    5c71:	74 1b                	je     5c8e <gettoken+0x8f>
    5c73:	eb 3a                	jmp    5caf <gettoken+0xb0>
    5c75:	83 f8 3e             	cmp    $0x3e,%eax
    5c78:	74 1a                	je     5c94 <gettoken+0x95>
    5c7a:	83 f8 3e             	cmp    $0x3e,%eax
    5c7d:	7f 0a                	jg     5c89 <gettoken+0x8a>
    5c7f:	83 e8 3b             	sub    $0x3b,%eax
    5c82:	83 f8 01             	cmp    $0x1,%eax
    5c85:	77 28                	ja     5caf <gettoken+0xb0>
    5c87:	eb 05                	jmp    5c8e <gettoken+0x8f>
    5c89:	83 f8 7c             	cmp    $0x7c,%eax
    5c8c:	75 21                	jne    5caf <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    5c8e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    5c92:	eb 75                	jmp    5d09 <gettoken+0x10a>
  case '>':
    s++;
    5c94:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    5c98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c9b:	0f b6 00             	movzbl (%eax),%eax
    5c9e:	3c 3e                	cmp    $0x3e,%al
    5ca0:	75 63                	jne    5d05 <gettoken+0x106>
      ret = '+';
    5ca2:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    5ca9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    5cad:	eb 56                	jmp    5d05 <gettoken+0x106>
  default:
    ret = 'a';
    5caf:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    5cb6:	eb 04                	jmp    5cbc <gettoken+0xbd>
      s++;
    5cb8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    5cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5cbf:	3b 45 0c             	cmp    0xc(%ebp),%eax
    5cc2:	73 44                	jae    5d08 <gettoken+0x109>
    5cc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5cc7:	0f b6 00             	movzbl (%eax),%eax
    5cca:	0f be c0             	movsbl %al,%eax
    5ccd:	83 ec 08             	sub    $0x8,%esp
    5cd0:	50                   	push   %eax
    5cd1:	68 d4 97 00 00       	push   $0x97d4
    5cd6:	e8 a7 dd ff ff       	call   3a82 <strchr>
    5cdb:	83 c4 10             	add    $0x10,%esp
    5cde:	85 c0                	test   %eax,%eax
    5ce0:	75 26                	jne    5d08 <gettoken+0x109>
    5ce2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5ce5:	0f b6 00             	movzbl (%eax),%eax
    5ce8:	0f be c0             	movsbl %al,%eax
    5ceb:	83 ec 08             	sub    $0x8,%esp
    5cee:	50                   	push   %eax
    5cef:	68 dc 97 00 00       	push   $0x97dc
    5cf4:	e8 89 dd ff ff       	call   3a82 <strchr>
    5cf9:	83 c4 10             	add    $0x10,%esp
    5cfc:	85 c0                	test   %eax,%eax
    5cfe:	74 b8                	je     5cb8 <gettoken+0xb9>
      s++;
    break;
    5d00:	eb 06                	jmp    5d08 <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    5d02:	90                   	nop
    5d03:	eb 04                	jmp    5d09 <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    5d05:	90                   	nop
    5d06:	eb 01                	jmp    5d09 <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
    5d08:	90                   	nop
  }
  if(eq)
    5d09:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    5d0d:	74 0e                	je     5d1d <gettoken+0x11e>
    *eq = s;
    5d0f:	8b 45 14             	mov    0x14(%ebp),%eax
    5d12:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5d15:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    5d17:	eb 04                	jmp    5d1d <gettoken+0x11e>
    s++;
    5d19:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    5d1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5d20:	3b 45 0c             	cmp    0xc(%ebp),%eax
    5d23:	73 1e                	jae    5d43 <gettoken+0x144>
    5d25:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5d28:	0f b6 00             	movzbl (%eax),%eax
    5d2b:	0f be c0             	movsbl %al,%eax
    5d2e:	83 ec 08             	sub    $0x8,%esp
    5d31:	50                   	push   %eax
    5d32:	68 d4 97 00 00       	push   $0x97d4
    5d37:	e8 46 dd ff ff       	call   3a82 <strchr>
    5d3c:	83 c4 10             	add    $0x10,%esp
    5d3f:	85 c0                	test   %eax,%eax
    5d41:	75 d6                	jne    5d19 <gettoken+0x11a>
    s++;
  *ps = s;
    5d43:	8b 45 08             	mov    0x8(%ebp),%eax
    5d46:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5d49:	89 10                	mov    %edx,(%eax)
  return ret;
    5d4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    5d4e:	c9                   	leave  
    5d4f:	c3                   	ret    

00005d50 <peek>:

int peek(char **ps, char *es, char *toks)
{
    5d50:	55                   	push   %ebp
    5d51:	89 e5                	mov    %esp,%ebp
    5d53:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
    5d56:	8b 45 08             	mov    0x8(%ebp),%eax
    5d59:	8b 00                	mov    (%eax),%eax
    5d5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    5d5e:	eb 04                	jmp    5d64 <peek+0x14>
    s++;
    5d60:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
int peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    5d64:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5d67:	3b 45 0c             	cmp    0xc(%ebp),%eax
    5d6a:	73 1e                	jae    5d8a <peek+0x3a>
    5d6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5d6f:	0f b6 00             	movzbl (%eax),%eax
    5d72:	0f be c0             	movsbl %al,%eax
    5d75:	83 ec 08             	sub    $0x8,%esp
    5d78:	50                   	push   %eax
    5d79:	68 d4 97 00 00       	push   $0x97d4
    5d7e:	e8 ff dc ff ff       	call   3a82 <strchr>
    5d83:	83 c4 10             	add    $0x10,%esp
    5d86:	85 c0                	test   %eax,%eax
    5d88:	75 d6                	jne    5d60 <peek+0x10>
    s++;
  *ps = s;
    5d8a:	8b 45 08             	mov    0x8(%ebp),%eax
    5d8d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5d90:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    5d92:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5d95:	0f b6 00             	movzbl (%eax),%eax
    5d98:	84 c0                	test   %al,%al
    5d9a:	74 23                	je     5dbf <peek+0x6f>
    5d9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5d9f:	0f b6 00             	movzbl (%eax),%eax
    5da2:	0f be c0             	movsbl %al,%eax
    5da5:	83 ec 08             	sub    $0x8,%esp
    5da8:	50                   	push   %eax
    5da9:	ff 75 10             	pushl  0x10(%ebp)
    5dac:	e8 d1 dc ff ff       	call   3a82 <strchr>
    5db1:	83 c4 10             	add    $0x10,%esp
    5db4:	85 c0                	test   %eax,%eax
    5db6:	74 07                	je     5dbf <peek+0x6f>
    5db8:	b8 01 00 00 00       	mov    $0x1,%eax
    5dbd:	eb 05                	jmp    5dc4 <peek+0x74>
    5dbf:	b8 00 00 00 00       	mov    $0x0,%eax
}
    5dc4:	c9                   	leave  
    5dc5:	c3                   	ret    

00005dc6 <parsecmd>:

struct cmd* parseline(char **ps, char *es);
struct cmd* nulterminate(struct cmd *cmd);

struct cmd* parsecmd(char *s)
{
    5dc6:	55                   	push   %ebp
    5dc7:	89 e5                	mov    %esp,%ebp
    5dc9:	53                   	push   %ebx
    5dca:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);  
    5dcd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    5dd0:	8b 45 08             	mov    0x8(%ebp),%eax
    5dd3:	83 ec 0c             	sub    $0xc,%esp
    5dd6:	50                   	push   %eax
    5dd7:	e8 65 dc ff ff       	call   3a41 <strlen>
    5ddc:	83 c4 10             	add    $0x10,%esp
    5ddf:	01 d8                	add    %ebx,%eax
    5de1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(s[0] == '%') //a calcmd
    5de4:	8b 45 08             	mov    0x8(%ebp),%eax
    5de7:	0f b6 00             	movzbl (%eax),%eax
    5dea:	3c 25                	cmp    $0x25,%al
    5dec:	75 5d                	jne    5e4b <parsecmd+0x85>
  {
    int len = strlen(s);
    5dee:	8b 45 08             	mov    0x8(%ebp),%eax
    5df1:	83 ec 0c             	sub    $0xc,%esp
    5df4:	50                   	push   %eax
    5df5:	e8 47 dc ff ff       	call   3a41 <strlen>
    5dfa:	83 c4 10             	add    $0x10,%esp
    5dfd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    char *line = (char*)malloc(len);
    5e00:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5e03:	83 ec 0c             	sub    $0xc,%esp
    5e06:	50                   	push   %eax
    5e07:	e8 a5 e3 ff ff       	call   41b1 <malloc>
    5e0c:	83 c4 10             	add    $0x10,%esp
    5e0f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    strcpy(line,s+1);
    5e12:	8b 45 08             	mov    0x8(%ebp),%eax
    5e15:	83 c0 01             	add    $0x1,%eax
    5e18:	83 ec 08             	sub    $0x8,%esp
    5e1b:	50                   	push   %eax
    5e1c:	ff 75 ec             	pushl  -0x14(%ebp)
    5e1f:	e8 ae db ff ff       	call   39d2 <strcpy>
    5e24:	83 c4 10             	add    $0x10,%esp
    line[len-2] = '\0';
    5e27:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5e2a:	8d 50 fe             	lea    -0x2(%eax),%edx
    5e2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5e30:	01 d0                	add    %edx,%eax
    5e32:	c6 00 00             	movb   $0x0,(%eax)
    struct calcmd* cmd = calcmd(line);
    5e35:	83 ec 0c             	sub    $0xc,%esp
    5e38:	ff 75 ec             	pushl  -0x14(%ebp)
    5e3b:	e8 59 e9 ff ff       	call   4799 <calcmd>
    5e40:	83 c4 10             	add    $0x10,%esp
    5e43:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return (struct cmd*)cmd;
    5e46:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5e49:	eb 6b                	jmp    5eb6 <parsecmd+0xf0>
  }
  cmd = parseline(&s, es);
    5e4b:	83 ec 08             	sub    $0x8,%esp
    5e4e:	ff 75 f4             	pushl  -0xc(%ebp)
    5e51:	8d 45 08             	lea    0x8(%ebp),%eax
    5e54:	50                   	push   %eax
    5e55:	e8 61 00 00 00       	call   5ebb <parseline>
    5e5a:	83 c4 10             	add    $0x10,%esp
    5e5d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  peek(&s, es, "");
    5e60:	83 ec 04             	sub    $0x4,%esp
    5e63:	68 78 88 00 00       	push   $0x8878
    5e68:	ff 75 f4             	pushl  -0xc(%ebp)
    5e6b:	8d 45 08             	lea    0x8(%ebp),%eax
    5e6e:	50                   	push   %eax
    5e6f:	e8 dc fe ff ff       	call   5d50 <peek>
    5e74:	83 c4 10             	add    $0x10,%esp
  if(s != es)
    5e77:	8b 45 08             	mov    0x8(%ebp),%eax
    5e7a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    5e7d:	74 26                	je     5ea5 <parsecmd+0xdf>
  {
    printf(2, "leftovers: %s\n", s);
    5e7f:	8b 45 08             	mov    0x8(%ebp),%eax
    5e82:	83 ec 04             	sub    $0x4,%esp
    5e85:	50                   	push   %eax
    5e86:	68 79 88 00 00       	push   $0x8879
    5e8b:	6a 02                	push   $0x2
    5e8d:	e8 1d e0 ff ff       	call   3eaf <printf>
    5e92:	83 c4 10             	add    $0x10,%esp
    panic1("syntax");
    5e95:	83 ec 0c             	sub    $0xc,%esp
    5e98:	68 88 88 00 00       	push   $0x8888
    5e9d:	e8 f2 e3 ff ff       	call   4294 <panic1>
    5ea2:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
    5ea5:	83 ec 0c             	sub    $0xc,%esp
    5ea8:	ff 75 e4             	pushl  -0x1c(%ebp)
    5eab:	e8 eb 03 00 00       	call   629b <nulterminate>
    5eb0:	83 c4 10             	add    $0x10,%esp
  return cmd;
    5eb3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    5eb6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5eb9:	c9                   	leave  
    5eba:	c3                   	ret    

00005ebb <parseline>:

struct cmd* parsepipe(char **ps, char *es);

struct cmd* parseline(char **ps, char *es)
{
    5ebb:	55                   	push   %ebp
    5ebc:	89 e5                	mov    %esp,%ebp
    5ebe:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    5ec1:	83 ec 08             	sub    $0x8,%esp
    5ec4:	ff 75 0c             	pushl  0xc(%ebp)
    5ec7:	ff 75 08             	pushl  0x8(%ebp)
    5eca:	e8 99 00 00 00       	call   5f68 <parsepipe>
    5ecf:	83 c4 10             	add    $0x10,%esp
    5ed2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&"))
    5ed5:	eb 23                	jmp    5efa <parseline+0x3f>
  {
    gettoken(ps, es, 0, 0);
    5ed7:	6a 00                	push   $0x0
    5ed9:	6a 00                	push   $0x0
    5edb:	ff 75 0c             	pushl  0xc(%ebp)
    5ede:	ff 75 08             	pushl  0x8(%ebp)
    5ee1:	e8 19 fd ff ff       	call   5bff <gettoken>
    5ee6:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
    5ee9:	83 ec 0c             	sub    $0xc,%esp
    5eec:	ff 75 f4             	pushl  -0xc(%ebp)
    5eef:	e8 66 e8 ff ff       	call   475a <backcmd>
    5ef4:	83 c4 10             	add    $0x10,%esp
    5ef7:	89 45 f4             	mov    %eax,-0xc(%ebp)
struct cmd* parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&"))
    5efa:	83 ec 04             	sub    $0x4,%esp
    5efd:	68 8f 88 00 00       	push   $0x888f
    5f02:	ff 75 0c             	pushl  0xc(%ebp)
    5f05:	ff 75 08             	pushl  0x8(%ebp)
    5f08:	e8 43 fe ff ff       	call   5d50 <peek>
    5f0d:	83 c4 10             	add    $0x10,%esp
    5f10:	85 c0                	test   %eax,%eax
    5f12:	75 c3                	jne    5ed7 <parseline+0x1c>
  {
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";"))
    5f14:	83 ec 04             	sub    $0x4,%esp
    5f17:	68 91 88 00 00       	push   $0x8891
    5f1c:	ff 75 0c             	pushl  0xc(%ebp)
    5f1f:	ff 75 08             	pushl  0x8(%ebp)
    5f22:	e8 29 fe ff ff       	call   5d50 <peek>
    5f27:	83 c4 10             	add    $0x10,%esp
    5f2a:	85 c0                	test   %eax,%eax
    5f2c:	74 35                	je     5f63 <parseline+0xa8>
  {
    gettoken(ps, es, 0, 0);
    5f2e:	6a 00                	push   $0x0
    5f30:	6a 00                	push   $0x0
    5f32:	ff 75 0c             	pushl  0xc(%ebp)
    5f35:	ff 75 08             	pushl  0x8(%ebp)
    5f38:	e8 c2 fc ff ff       	call   5bff <gettoken>
    5f3d:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
    5f40:	83 ec 08             	sub    $0x8,%esp
    5f43:	ff 75 0c             	pushl  0xc(%ebp)
    5f46:	ff 75 08             	pushl  0x8(%ebp)
    5f49:	e8 6d ff ff ff       	call   5ebb <parseline>
    5f4e:	83 c4 10             	add    $0x10,%esp
    5f51:	83 ec 08             	sub    $0x8,%esp
    5f54:	50                   	push   %eax
    5f55:	ff 75 f4             	pushl  -0xc(%ebp)
    5f58:	e8 b5 e7 ff ff       	call   4712 <listcmd>
    5f5d:	83 c4 10             	add    $0x10,%esp
    5f60:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    5f63:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5f66:	c9                   	leave  
    5f67:	c3                   	ret    

00005f68 <parsepipe>:

struct cmd* parseexec(char **ps, char *es);

struct cmd* parsepipe(char **ps, char *es)
{
    5f68:	55                   	push   %ebp
    5f69:	89 e5                	mov    %esp,%ebp
    5f6b:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    5f6e:	83 ec 08             	sub    $0x8,%esp
    5f71:	ff 75 0c             	pushl  0xc(%ebp)
    5f74:	ff 75 08             	pushl  0x8(%ebp)
    5f77:	e8 ec 01 00 00       	call   6168 <parseexec>
    5f7c:	83 c4 10             	add    $0x10,%esp
    5f7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|"))
    5f82:	83 ec 04             	sub    $0x4,%esp
    5f85:	68 93 88 00 00       	push   $0x8893
    5f8a:	ff 75 0c             	pushl  0xc(%ebp)
    5f8d:	ff 75 08             	pushl  0x8(%ebp)
    5f90:	e8 bb fd ff ff       	call   5d50 <peek>
    5f95:	83 c4 10             	add    $0x10,%esp
    5f98:	85 c0                	test   %eax,%eax
    5f9a:	74 35                	je     5fd1 <parsepipe+0x69>
  {
    gettoken(ps, es, 0, 0);
    5f9c:	6a 00                	push   $0x0
    5f9e:	6a 00                	push   $0x0
    5fa0:	ff 75 0c             	pushl  0xc(%ebp)
    5fa3:	ff 75 08             	pushl  0x8(%ebp)
    5fa6:	e8 54 fc ff ff       	call   5bff <gettoken>
    5fab:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    5fae:	83 ec 08             	sub    $0x8,%esp
    5fb1:	ff 75 0c             	pushl  0xc(%ebp)
    5fb4:	ff 75 08             	pushl  0x8(%ebp)
    5fb7:	e8 ac ff ff ff       	call   5f68 <parsepipe>
    5fbc:	83 c4 10             	add    $0x10,%esp
    5fbf:	83 ec 08             	sub    $0x8,%esp
    5fc2:	50                   	push   %eax
    5fc3:	ff 75 f4             	pushl  -0xc(%ebp)
    5fc6:	e8 ff e6 ff ff       	call   46ca <pipecmd>
    5fcb:	83 c4 10             	add    $0x10,%esp
    5fce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    5fd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5fd4:	c9                   	leave  
    5fd5:	c3                   	ret    

00005fd6 <parseredirs>:

struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
    5fd6:	55                   	push   %ebp
    5fd7:	89 e5                	mov    %esp,%ebp
    5fd9:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    5fdc:	e9 b6 00 00 00       	jmp    6097 <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
    5fe1:	6a 00                	push   $0x0
    5fe3:	6a 00                	push   $0x0
    5fe5:	ff 75 10             	pushl  0x10(%ebp)
    5fe8:	ff 75 0c             	pushl  0xc(%ebp)
    5feb:	e8 0f fc ff ff       	call   5bff <gettoken>
    5ff0:	83 c4 10             	add    $0x10,%esp
    5ff3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    5ff6:	8d 45 ec             	lea    -0x14(%ebp),%eax
    5ff9:	50                   	push   %eax
    5ffa:	8d 45 f0             	lea    -0x10(%ebp),%eax
    5ffd:	50                   	push   %eax
    5ffe:	ff 75 10             	pushl  0x10(%ebp)
    6001:	ff 75 0c             	pushl  0xc(%ebp)
    6004:	e8 f6 fb ff ff       	call   5bff <gettoken>
    6009:	83 c4 10             	add    $0x10,%esp
    600c:	83 f8 61             	cmp    $0x61,%eax
    600f:	74 10                	je     6021 <parseredirs+0x4b>
      panic1("missing file for redirection");
    6011:	83 ec 0c             	sub    $0xc,%esp
    6014:	68 95 88 00 00       	push   $0x8895
    6019:	e8 76 e2 ff ff       	call   4294 <panic1>
    601e:	83 c4 10             	add    $0x10,%esp
    switch(tok){
    6021:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6024:	83 f8 3c             	cmp    $0x3c,%eax
    6027:	74 0c                	je     6035 <parseredirs+0x5f>
    6029:	83 f8 3e             	cmp    $0x3e,%eax
    602c:	74 26                	je     6054 <parseredirs+0x7e>
    602e:	83 f8 2b             	cmp    $0x2b,%eax
    6031:	74 43                	je     6076 <parseredirs+0xa0>
    6033:	eb 62                	jmp    6097 <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    6035:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6038:	8b 45 f0             	mov    -0x10(%ebp),%eax
    603b:	83 ec 0c             	sub    $0xc,%esp
    603e:	6a 00                	push   $0x0
    6040:	6a 00                	push   $0x0
    6042:	52                   	push   %edx
    6043:	50                   	push   %eax
    6044:	ff 75 08             	pushl  0x8(%ebp)
    6047:	e8 1b e6 ff ff       	call   4667 <redircmd>
    604c:	83 c4 20             	add    $0x20,%esp
    604f:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    6052:	eb 43                	jmp    6097 <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    6054:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6057:	8b 45 f0             	mov    -0x10(%ebp),%eax
    605a:	83 ec 0c             	sub    $0xc,%esp
    605d:	6a 01                	push   $0x1
    605f:	68 01 02 00 00       	push   $0x201
    6064:	52                   	push   %edx
    6065:	50                   	push   %eax
    6066:	ff 75 08             	pushl  0x8(%ebp)
    6069:	e8 f9 e5 ff ff       	call   4667 <redircmd>
    606e:	83 c4 20             	add    $0x20,%esp
    6071:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    6074:	eb 21                	jmp    6097 <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    6076:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6079:	8b 45 f0             	mov    -0x10(%ebp),%eax
    607c:	83 ec 0c             	sub    $0xc,%esp
    607f:	6a 01                	push   $0x1
    6081:	68 01 02 00 00       	push   $0x201
    6086:	52                   	push   %edx
    6087:	50                   	push   %eax
    6088:	ff 75 08             	pushl  0x8(%ebp)
    608b:	e8 d7 e5 ff ff       	call   4667 <redircmd>
    6090:	83 c4 20             	add    $0x20,%esp
    6093:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    6096:	90                   	nop
struct cmd* parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    6097:	83 ec 04             	sub    $0x4,%esp
    609a:	68 b2 88 00 00       	push   $0x88b2
    609f:	ff 75 10             	pushl  0x10(%ebp)
    60a2:	ff 75 0c             	pushl  0xc(%ebp)
    60a5:	e8 a6 fc ff ff       	call   5d50 <peek>
    60aa:	83 c4 10             	add    $0x10,%esp
    60ad:	85 c0                	test   %eax,%eax
    60af:	0f 85 2c ff ff ff    	jne    5fe1 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    60b5:	8b 45 08             	mov    0x8(%ebp),%eax
}
    60b8:	c9                   	leave  
    60b9:	c3                   	ret    

000060ba <parseblock>:

struct cmd* parseblock(char **ps, char *es)
{
    60ba:	55                   	push   %ebp
    60bb:	89 e5                	mov    %esp,%ebp
    60bd:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    60c0:	83 ec 04             	sub    $0x4,%esp
    60c3:	68 b5 88 00 00       	push   $0x88b5
    60c8:	ff 75 0c             	pushl  0xc(%ebp)
    60cb:	ff 75 08             	pushl  0x8(%ebp)
    60ce:	e8 7d fc ff ff       	call   5d50 <peek>
    60d3:	83 c4 10             	add    $0x10,%esp
    60d6:	85 c0                	test   %eax,%eax
    60d8:	75 10                	jne    60ea <parseblock+0x30>
    panic1("parseblock");
    60da:	83 ec 0c             	sub    $0xc,%esp
    60dd:	68 b7 88 00 00       	push   $0x88b7
    60e2:	e8 ad e1 ff ff       	call   4294 <panic1>
    60e7:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    60ea:	6a 00                	push   $0x0
    60ec:	6a 00                	push   $0x0
    60ee:	ff 75 0c             	pushl  0xc(%ebp)
    60f1:	ff 75 08             	pushl  0x8(%ebp)
    60f4:	e8 06 fb ff ff       	call   5bff <gettoken>
    60f9:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
    60fc:	83 ec 08             	sub    $0x8,%esp
    60ff:	ff 75 0c             	pushl  0xc(%ebp)
    6102:	ff 75 08             	pushl  0x8(%ebp)
    6105:	e8 b1 fd ff ff       	call   5ebb <parseline>
    610a:	83 c4 10             	add    $0x10,%esp
    610d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    6110:	83 ec 04             	sub    $0x4,%esp
    6113:	68 c2 88 00 00       	push   $0x88c2
    6118:	ff 75 0c             	pushl  0xc(%ebp)
    611b:	ff 75 08             	pushl  0x8(%ebp)
    611e:	e8 2d fc ff ff       	call   5d50 <peek>
    6123:	83 c4 10             	add    $0x10,%esp
    6126:	85 c0                	test   %eax,%eax
    6128:	75 10                	jne    613a <parseblock+0x80>
    panic1("syntax - missing )");
    612a:	83 ec 0c             	sub    $0xc,%esp
    612d:	68 c4 88 00 00       	push   $0x88c4
    6132:	e8 5d e1 ff ff       	call   4294 <panic1>
    6137:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
    613a:	6a 00                	push   $0x0
    613c:	6a 00                	push   $0x0
    613e:	ff 75 0c             	pushl  0xc(%ebp)
    6141:	ff 75 08             	pushl  0x8(%ebp)
    6144:	e8 b6 fa ff ff       	call   5bff <gettoken>
    6149:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
    614c:	83 ec 04             	sub    $0x4,%esp
    614f:	ff 75 0c             	pushl  0xc(%ebp)
    6152:	ff 75 08             	pushl  0x8(%ebp)
    6155:	ff 75 f4             	pushl  -0xc(%ebp)
    6158:	e8 79 fe ff ff       	call   5fd6 <parseredirs>
    615d:	83 c4 10             	add    $0x10,%esp
    6160:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    6163:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    6166:	c9                   	leave  
    6167:	c3                   	ret    

00006168 <parseexec>:

struct cmd* parseexec(char **ps, char *es)
{
    6168:	55                   	push   %ebp
    6169:	89 e5                	mov    %esp,%ebp
    616b:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    616e:	83 ec 04             	sub    $0x4,%esp
    6171:	68 b5 88 00 00       	push   $0x88b5
    6176:	ff 75 0c             	pushl  0xc(%ebp)
    6179:	ff 75 08             	pushl  0x8(%ebp)
    617c:	e8 cf fb ff ff       	call   5d50 <peek>
    6181:	83 c4 10             	add    $0x10,%esp
    6184:	85 c0                	test   %eax,%eax
    6186:	74 16                	je     619e <parseexec+0x36>
    return parseblock(ps, es);
    6188:	83 ec 08             	sub    $0x8,%esp
    618b:	ff 75 0c             	pushl  0xc(%ebp)
    618e:	ff 75 08             	pushl  0x8(%ebp)
    6191:	e8 24 ff ff ff       	call   60ba <parseblock>
    6196:	83 c4 10             	add    $0x10,%esp
    6199:	e9 fb 00 00 00       	jmp    6299 <parseexec+0x131>

  ret = execcmd();
    619e:	e8 8e e4 ff ff       	call   4631 <execcmd>
    61a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    61a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    61a9:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    61ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    61b3:	83 ec 04             	sub    $0x4,%esp
    61b6:	ff 75 0c             	pushl  0xc(%ebp)
    61b9:	ff 75 08             	pushl  0x8(%ebp)
    61bc:	ff 75 f0             	pushl  -0x10(%ebp)
    61bf:	e8 12 fe ff ff       	call   5fd6 <parseredirs>
    61c4:	83 c4 10             	add    $0x10,%esp
    61c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    61ca:	e9 87 00 00 00       	jmp    6256 <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    61cf:	8d 45 e0             	lea    -0x20(%ebp),%eax
    61d2:	50                   	push   %eax
    61d3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    61d6:	50                   	push   %eax
    61d7:	ff 75 0c             	pushl  0xc(%ebp)
    61da:	ff 75 08             	pushl  0x8(%ebp)
    61dd:	e8 1d fa ff ff       	call   5bff <gettoken>
    61e2:	83 c4 10             	add    $0x10,%esp
    61e5:	89 45 e8             	mov    %eax,-0x18(%ebp)
    61e8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    61ec:	0f 84 84 00 00 00    	je     6276 <parseexec+0x10e>
      break;
    if(tok != 'a')
    61f2:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    61f6:	74 10                	je     6208 <parseexec+0xa0>
      panic1("syntax");
    61f8:	83 ec 0c             	sub    $0xc,%esp
    61fb:	68 88 88 00 00       	push   $0x8888
    6200:	e8 8f e0 ff ff       	call   4294 <panic1>
    6205:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
    6208:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    620b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    620e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6211:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    6215:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6218:	8b 45 ec             	mov    -0x14(%ebp),%eax
    621b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    621e:	83 c1 08             	add    $0x8,%ecx
    6221:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    6225:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= CMDMAXARGS)
    6229:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    622d:	7e 10                	jle    623f <parseexec+0xd7>
      panic1("too many args");
    622f:	83 ec 0c             	sub    $0xc,%esp
    6232:	68 d7 88 00 00       	push   $0x88d7
    6237:	e8 58 e0 ff ff       	call   4294 <panic1>
    623c:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
    623f:	83 ec 04             	sub    $0x4,%esp
    6242:	ff 75 0c             	pushl  0xc(%ebp)
    6245:	ff 75 08             	pushl  0x8(%ebp)
    6248:	ff 75 f0             	pushl  -0x10(%ebp)
    624b:	e8 86 fd ff ff       	call   5fd6 <parseredirs>
    6250:	83 c4 10             	add    $0x10,%esp
    6253:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    6256:	83 ec 04             	sub    $0x4,%esp
    6259:	68 e5 88 00 00       	push   $0x88e5
    625e:	ff 75 0c             	pushl  0xc(%ebp)
    6261:	ff 75 08             	pushl  0x8(%ebp)
    6264:	e8 e7 fa ff ff       	call   5d50 <peek>
    6269:	83 c4 10             	add    $0x10,%esp
    626c:	85 c0                	test   %eax,%eax
    626e:	0f 84 5b ff ff ff    	je     61cf <parseexec+0x67>
    6274:	eb 01                	jmp    6277 <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    6276:	90                   	nop
    argc++;
    if(argc >= CMDMAXARGS)
      panic1("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    6277:	8b 45 ec             	mov    -0x14(%ebp),%eax
    627a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    627d:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    6284:	00 
  cmd->eargv[argc] = 0;
    6285:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6288:	8b 55 f4             	mov    -0xc(%ebp),%edx
    628b:	83 c2 08             	add    $0x8,%edx
    628e:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    6295:	00 
  return ret;
    6296:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    6299:	c9                   	leave  
    629a:	c3                   	ret    

0000629b <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
    629b:	55                   	push   %ebp
    629c:	89 e5                	mov    %esp,%ebp
    629e:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    62a1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    62a5:	75 0a                	jne    62b1 <nulterminate+0x16>
    return 0;
    62a7:	b8 00 00 00 00       	mov    $0x0,%eax
    62ac:	e9 e4 00 00 00       	jmp    6395 <nulterminate+0xfa>
  
  switch(cmd->type){
    62b1:	8b 45 08             	mov    0x8(%ebp),%eax
    62b4:	8b 00                	mov    (%eax),%eax
    62b6:	83 f8 05             	cmp    $0x5,%eax
    62b9:	0f 87 d3 00 00 00    	ja     6392 <nulterminate+0xf7>
    62bf:	8b 04 85 ec 88 00 00 	mov    0x88ec(,%eax,4),%eax
    62c6:	ff e0                	jmp    *%eax
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    62c8:	8b 45 08             	mov    0x8(%ebp),%eax
    62cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    62ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    62d5:	eb 14                	jmp    62eb <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    62d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    62da:	8b 55 f4             	mov    -0xc(%ebp),%edx
    62dd:	83 c2 08             	add    $0x8,%edx
    62e0:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    62e4:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    62e7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    62eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    62ee:	8b 55 f4             	mov    -0xc(%ebp),%edx
    62f1:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    62f5:	85 c0                	test   %eax,%eax
    62f7:	75 de                	jne    62d7 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    62f9:	e9 94 00 00 00       	jmp    6392 <nulterminate+0xf7>

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    62fe:	8b 45 08             	mov    0x8(%ebp),%eax
    6301:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    6304:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6307:	8b 40 04             	mov    0x4(%eax),%eax
    630a:	83 ec 0c             	sub    $0xc,%esp
    630d:	50                   	push   %eax
    630e:	e8 88 ff ff ff       	call   629b <nulterminate>
    6313:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    6316:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6319:	8b 40 0c             	mov    0xc(%eax),%eax
    631c:	c6 00 00             	movb   $0x0,(%eax)
    break;
    631f:	eb 71                	jmp    6392 <nulterminate+0xf7>

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    6321:	8b 45 08             	mov    0x8(%ebp),%eax
    6324:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    6327:	8b 45 e8             	mov    -0x18(%ebp),%eax
    632a:	8b 40 04             	mov    0x4(%eax),%eax
    632d:	83 ec 0c             	sub    $0xc,%esp
    6330:	50                   	push   %eax
    6331:	e8 65 ff ff ff       	call   629b <nulterminate>
    6336:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
    6339:	8b 45 e8             	mov    -0x18(%ebp),%eax
    633c:	8b 40 08             	mov    0x8(%eax),%eax
    633f:	83 ec 0c             	sub    $0xc,%esp
    6342:	50                   	push   %eax
    6343:	e8 53 ff ff ff       	call   629b <nulterminate>
    6348:	83 c4 10             	add    $0x10,%esp
    break;
    634b:	eb 45                	jmp    6392 <nulterminate+0xf7>
    
  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    634d:	8b 45 08             	mov    0x8(%ebp),%eax
    6350:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    6353:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6356:	8b 40 04             	mov    0x4(%eax),%eax
    6359:	83 ec 0c             	sub    $0xc,%esp
    635c:	50                   	push   %eax
    635d:	e8 39 ff ff ff       	call   629b <nulterminate>
    6362:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
    6365:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6368:	8b 40 08             	mov    0x8(%eax),%eax
    636b:	83 ec 0c             	sub    $0xc,%esp
    636e:	50                   	push   %eax
    636f:	e8 27 ff ff ff       	call   629b <nulterminate>
    6374:	83 c4 10             	add    $0x10,%esp
    break;
    6377:	eb 19                	jmp    6392 <nulterminate+0xf7>

  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    6379:	8b 45 08             	mov    0x8(%ebp),%eax
    637c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    637f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6382:	8b 40 04             	mov    0x4(%eax),%eax
    6385:	83 ec 0c             	sub    $0xc,%esp
    6388:	50                   	push   %eax
    6389:	e8 0d ff ff ff       	call   629b <nulterminate>
    638e:	83 c4 10             	add    $0x10,%esp
    break;
    6391:	90                   	nop
  }
  return cmd;
    6392:	8b 45 08             	mov    0x8(%ebp),%eax
}
    6395:	c9                   	leave  
    6396:	c3                   	ret    

00006397 <color_putc>:

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
    6397:	55                   	push   %ebp
    6398:	89 e5                	mov    %esp,%ebp
    639a:	83 ec 18             	sub    $0x18,%esp
    639d:	8b 45 08             	mov    0x8(%ebp),%eax
    63a0:	88 45 f4             	mov    %al,-0xc(%ebp)
  colorwrite(&c, 1, forec, foreh, backc, backh);
    63a3:	83 ec 08             	sub    $0x8,%esp
    63a6:	ff 75 18             	pushl  0x18(%ebp)
    63a9:	ff 75 14             	pushl  0x14(%ebp)
    63ac:	ff 75 10             	pushl  0x10(%ebp)
    63af:	ff 75 0c             	pushl  0xc(%ebp)
    63b2:	6a 01                	push   $0x1
    63b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
    63b7:	50                   	push   %eax
    63b8:	e8 e6 d8 ff ff       	call   3ca3 <colorwrite>
    63bd:	83 c4 20             	add    $0x20,%esp
}
    63c0:	90                   	nop
    63c1:	c9                   	leave  
    63c2:	c3                   	ret    

000063c3 <color_printint>:

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
    63c3:	55                   	push   %ebp
    63c4:	89 e5                	mov    %esp,%ebp
    63c6:	53                   	push   %ebx
    63c7:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    63ca:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    63d1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    63d5:	74 17                	je     63ee <color_printint+0x2b>
    63d7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    63db:	79 11                	jns    63ee <color_printint+0x2b>
    neg = 1;
    63dd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    63e4:	8b 45 08             	mov    0x8(%ebp),%eax
    63e7:	f7 d8                	neg    %eax
    63e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    63ec:	eb 06                	jmp    63f4 <color_printint+0x31>
  } else {
    x = xx;
    63ee:	8b 45 08             	mov    0x8(%ebp),%eax
    63f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    63f4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    63fb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    63fe:	8d 41 01             	lea    0x1(%ecx),%eax
    6401:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6404:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6407:	8b 45 ec             	mov    -0x14(%ebp),%eax
    640a:	ba 00 00 00 00       	mov    $0x0,%edx
    640f:	f7 f3                	div    %ebx
    6411:	89 d0                	mov    %edx,%eax
    6413:	0f b6 80 e4 97 00 00 	movzbl 0x97e4(%eax),%eax
    641a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    641e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6421:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6424:	ba 00 00 00 00       	mov    $0x0,%edx
    6429:	f7 f3                	div    %ebx
    642b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    642e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6432:	75 c7                	jne    63fb <color_printint+0x38>
  if(neg)
    6434:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    6438:	74 36                	je     6470 <color_printint+0xad>
    buf[i++] = '-';
    643a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    643d:	8d 50 01             	lea    0x1(%eax),%edx
    6440:	89 55 f4             	mov    %edx,-0xc(%ebp)
    6443:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    6448:	eb 26                	jmp    6470 <color_printint+0xad>
    color_putc(buf[i],forec,foreh,backc,backh);
    644a:	8d 55 dc             	lea    -0x24(%ebp),%edx
    644d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6450:	01 d0                	add    %edx,%eax
    6452:	0f b6 00             	movzbl (%eax),%eax
    6455:	0f be c0             	movsbl %al,%eax
    6458:	83 ec 0c             	sub    $0xc,%esp
    645b:	ff 75 20             	pushl  0x20(%ebp)
    645e:	ff 75 1c             	pushl  0x1c(%ebp)
    6461:	ff 75 18             	pushl  0x18(%ebp)
    6464:	ff 75 14             	pushl  0x14(%ebp)
    6467:	50                   	push   %eax
    6468:	e8 2a ff ff ff       	call   6397 <color_putc>
    646d:	83 c4 20             	add    $0x20,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    6470:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    6474:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6478:	79 d0                	jns    644a <color_printint+0x87>
    color_putc(buf[i],forec,foreh,backc,backh);
}
    647a:	90                   	nop
    647b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    647e:	c9                   	leave  
    647f:	c3                   	ret    

00006480 <getInteger>:

static int getInteger(double num)
{
    6480:	55                   	push   %ebp
    6481:	89 e5                	mov    %esp,%ebp
    6483:	83 ec 18             	sub    $0x18,%esp
    6486:	8b 45 08             	mov    0x8(%ebp),%eax
    6489:	89 45 e8             	mov    %eax,-0x18(%ebp)
    648c:	8b 45 0c             	mov    0xc(%ebp),%eax
    648f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int integer = 0;
    6492:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while(num > 1)
    6499:	eb 0e                	jmp    64a9 <getInteger+0x29>
  {
    num -= 1;
    649b:	dd 45 e8             	fldl   -0x18(%ebp)
    649e:	d9 e8                	fld1   
    64a0:	de e9                	fsubrp %st,%st(1)
    64a2:	dd 5d e8             	fstpl  -0x18(%ebp)
    integer++;
    64a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
    64a9:	dd 45 e8             	fldl   -0x18(%ebp)
    64ac:	d9 e8                	fld1   
    64ae:	d9 c9                	fxch   %st(1)
    64b0:	df e9                	fucomip %st(1),%st
    64b2:	dd d8                	fstp   %st(0)
    64b4:	77 e5                	ja     649b <getInteger+0x1b>
  {
    num -= 1;
    integer++;
  }
  return integer;
    64b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    64b9:	c9                   	leave  
    64ba:	c3                   	ret    

000064bb <color_printdbl>:

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
    64bb:	55                   	push   %ebp
    64bc:	89 e5                	mov    %esp,%ebp
    64be:	83 ec 28             	sub    $0x28,%esp
    64c1:	8b 45 08             	mov    0x8(%ebp),%eax
    64c4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    64c7:	8b 45 0c             	mov    0xc(%ebp),%eax
    64ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(num < 0)
    64cd:	d9 ee                	fldz   
    64cf:	dd 45 e0             	fldl   -0x20(%ebp)
    64d2:	d9 c9                	fxch   %st(1)
    64d4:	df e9                	fucomip %st(1),%st
    64d6:	dd d8                	fstp   %st(0)
    64d8:	76 21                	jbe    64fb <color_printdbl+0x40>
  {
    color_putc('-',forec,foreh,backc,backh);
    64da:	83 ec 0c             	sub    $0xc,%esp
    64dd:	ff 75 1c             	pushl  0x1c(%ebp)
    64e0:	ff 75 18             	pushl  0x18(%ebp)
    64e3:	ff 75 14             	pushl  0x14(%ebp)
    64e6:	ff 75 10             	pushl  0x10(%ebp)
    64e9:	6a 2d                	push   $0x2d
    64eb:	e8 a7 fe ff ff       	call   6397 <color_putc>
    64f0:	83 c4 20             	add    $0x20,%esp
    num = -num;
    64f3:	dd 45 e0             	fldl   -0x20(%ebp)
    64f6:	d9 e0                	fchs   
    64f8:	dd 5d e0             	fstpl  -0x20(%ebp)
  }
  int integer = getInteger(num);
    64fb:	83 ec 08             	sub    $0x8,%esp
    64fe:	ff 75 e4             	pushl  -0x1c(%ebp)
    6501:	ff 75 e0             	pushl  -0x20(%ebp)
    6504:	e8 77 ff ff ff       	call   6480 <getInteger>
    6509:	83 c4 10             	add    $0x10,%esp
    650c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  color_printint(integer,10,1,forec,foreh,backc,backh);
    650f:	83 ec 04             	sub    $0x4,%esp
    6512:	ff 75 1c             	pushl  0x1c(%ebp)
    6515:	ff 75 18             	pushl  0x18(%ebp)
    6518:	ff 75 14             	pushl  0x14(%ebp)
    651b:	ff 75 10             	pushl  0x10(%ebp)
    651e:	6a 01                	push   $0x1
    6520:	6a 0a                	push   $0xa
    6522:	ff 75 f0             	pushl  -0x10(%ebp)
    6525:	e8 99 fe ff ff       	call   63c3 <color_printint>
    652a:	83 c4 20             	add    $0x20,%esp
  num -= integer;
    652d:	db 45 f0             	fildl  -0x10(%ebp)
    6530:	dd 45 e0             	fldl   -0x20(%ebp)
    6533:	de e1                	fsubp  %st,%st(1)
    6535:	dd 5d e0             	fstpl  -0x20(%ebp)
  if(num > 1e-6)
    6538:	dd 45 e0             	fldl   -0x20(%ebp)
    653b:	dd 05 10 89 00 00    	fldl   0x8910
    6541:	d9 c9                	fxch   %st(1)
    6543:	df e9                	fucomip %st(1),%st
    6545:	dd d8                	fstp   %st(0)
    6547:	76 19                	jbe    6562 <color_printdbl+0xa7>
    color_putc('.',forec,foreh,backc,backh);
    6549:	83 ec 0c             	sub    $0xc,%esp
    654c:	ff 75 1c             	pushl  0x1c(%ebp)
    654f:	ff 75 18             	pushl  0x18(%ebp)
    6552:	ff 75 14             	pushl  0x14(%ebp)
    6555:	ff 75 10             	pushl  0x10(%ebp)
    6558:	6a 2e                	push   $0x2e
    655a:	e8 38 fe ff ff       	call   6397 <color_putc>
    655f:	83 c4 20             	add    $0x20,%esp
  int digits = 0;
    6562:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while(num > 1e-6)
    6569:	eb 55                	jmp    65c0 <color_printdbl+0x105>
  {
    num = num*10;
    656b:	dd 45 e0             	fldl   -0x20(%ebp)
    656e:	dd 05 18 89 00 00    	fldl   0x8918
    6574:	de c9                	fmulp  %st,%st(1)
    6576:	dd 5d e0             	fstpl  -0x20(%ebp)
    integer = getInteger(num);
    6579:	83 ec 08             	sub    $0x8,%esp
    657c:	ff 75 e4             	pushl  -0x1c(%ebp)
    657f:	ff 75 e0             	pushl  -0x20(%ebp)
    6582:	e8 f9 fe ff ff       	call   6480 <getInteger>
    6587:	83 c4 10             	add    $0x10,%esp
    658a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    color_printint(integer,10,1,forec,foreh,backc,backh);
    658d:	83 ec 04             	sub    $0x4,%esp
    6590:	ff 75 1c             	pushl  0x1c(%ebp)
    6593:	ff 75 18             	pushl  0x18(%ebp)
    6596:	ff 75 14             	pushl  0x14(%ebp)
    6599:	ff 75 10             	pushl  0x10(%ebp)
    659c:	6a 01                	push   $0x1
    659e:	6a 0a                	push   $0xa
    65a0:	ff 75 f0             	pushl  -0x10(%ebp)
    65a3:	e8 1b fe ff ff       	call   63c3 <color_printint>
    65a8:	83 c4 20             	add    $0x20,%esp
    num -= integer;
    65ab:	db 45 f0             	fildl  -0x10(%ebp)
    65ae:	dd 45 e0             	fldl   -0x20(%ebp)
    65b1:	de e1                	fsubp  %st,%st(1)
    65b3:	dd 5d e0             	fstpl  -0x20(%ebp)
    digits++;
    65b6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(digits > 6)
    65ba:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    65be:	7f 13                	jg     65d3 <color_printdbl+0x118>
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
    65c0:	dd 45 e0             	fldl   -0x20(%ebp)
    65c3:	dd 05 10 89 00 00    	fldl   0x8910
    65c9:	d9 c9                	fxch   %st(1)
    65cb:	df e9                	fucomip %st(1),%st
    65cd:	dd d8                	fstp   %st(0)
    65cf:	77 9a                	ja     656b <color_printdbl+0xb0>
    if(digits > 6)
    {
      break;
    }
  }
}
    65d1:	eb 01                	jmp    65d4 <color_printdbl+0x119>
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    65d3:	90                   	nop
    }
  }
}
    65d4:	90                   	nop
    65d5:	c9                   	leave  
    65d6:	c3                   	ret    

000065d7 <color_printf>:

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
    65d7:	55                   	push   %ebp
    65d8:	89 e5                	mov    %esp,%ebp
    65da:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    65dd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    65e4:	8d 45 18             	lea    0x18(%ebp),%eax
    65e7:	83 c0 04             	add    $0x4,%eax
    65ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    65ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    65f4:	e9 e2 01 00 00       	jmp    67db <color_printf+0x204>
    c = fmt[i] & 0xff;
    65f9:	8b 55 18             	mov    0x18(%ebp),%edx
    65fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    65ff:	01 d0                	add    %edx,%eax
    6601:	0f b6 00             	movzbl (%eax),%eax
    6604:	0f be c0             	movsbl %al,%eax
    6607:	25 ff 00 00 00       	and    $0xff,%eax
    660c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    660f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6613:	75 35                	jne    664a <color_printf+0x73>
      if(c == '%'){
    6615:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    6619:	75 0c                	jne    6627 <color_printf+0x50>
        state = '%';
    661b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    6622:	e9 b0 01 00 00       	jmp    67d7 <color_printf+0x200>
      } else {
        color_putc(c,forec,foreh,backc,backh);
    6627:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    662a:	0f be c0             	movsbl %al,%eax
    662d:	83 ec 0c             	sub    $0xc,%esp
    6630:	ff 75 14             	pushl  0x14(%ebp)
    6633:	ff 75 10             	pushl  0x10(%ebp)
    6636:	ff 75 0c             	pushl  0xc(%ebp)
    6639:	ff 75 08             	pushl  0x8(%ebp)
    663c:	50                   	push   %eax
    663d:	e8 55 fd ff ff       	call   6397 <color_putc>
    6642:	83 c4 20             	add    $0x20,%esp
    6645:	e9 8d 01 00 00       	jmp    67d7 <color_printf+0x200>
      }
    } else if(state == '%'){
    664a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    664e:	0f 85 83 01 00 00    	jne    67d7 <color_printf+0x200>
      if(c == 'd'){
    6654:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    6658:	75 2a                	jne    6684 <color_printf+0xad>
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
    665a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    665d:	8b 00                	mov    (%eax),%eax
    665f:	83 ec 04             	sub    $0x4,%esp
    6662:	ff 75 14             	pushl  0x14(%ebp)
    6665:	ff 75 10             	pushl  0x10(%ebp)
    6668:	ff 75 0c             	pushl  0xc(%ebp)
    666b:	ff 75 08             	pushl  0x8(%ebp)
    666e:	6a 01                	push   $0x1
    6670:	6a 0a                	push   $0xa
    6672:	50                   	push   %eax
    6673:	e8 4b fd ff ff       	call   63c3 <color_printint>
    6678:	83 c4 20             	add    $0x20,%esp
        ap++;
    667b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    667f:	e9 4c 01 00 00       	jmp    67d0 <color_printf+0x1f9>
      } else if(c == 'x' || c == 'p'){
    6684:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    6688:	74 06                	je     6690 <color_printf+0xb9>
    668a:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    668e:	75 2a                	jne    66ba <color_printf+0xe3>
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
    6690:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6693:	8b 00                	mov    (%eax),%eax
    6695:	83 ec 04             	sub    $0x4,%esp
    6698:	ff 75 14             	pushl  0x14(%ebp)
    669b:	ff 75 10             	pushl  0x10(%ebp)
    669e:	ff 75 0c             	pushl  0xc(%ebp)
    66a1:	ff 75 08             	pushl  0x8(%ebp)
    66a4:	6a 00                	push   $0x0
    66a6:	6a 10                	push   $0x10
    66a8:	50                   	push   %eax
    66a9:	e8 15 fd ff ff       	call   63c3 <color_printint>
    66ae:	83 c4 20             	add    $0x20,%esp
        ap++;
    66b1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    66b5:	e9 16 01 00 00       	jmp    67d0 <color_printf+0x1f9>
      } else if(c == 's'){
    66ba:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    66be:	75 4f                	jne    670f <color_printf+0x138>
        s = (char*)*ap;
    66c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    66c3:	8b 00                	mov    (%eax),%eax
    66c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    66c8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    66cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    66d0:	75 2e                	jne    6700 <color_printf+0x129>
          s = "(null)";
    66d2:	c7 45 f4 08 89 00 00 	movl   $0x8908,-0xc(%ebp)
        while(*s != 0){
    66d9:	eb 25                	jmp    6700 <color_printf+0x129>
          color_putc(*s,forec,foreh,backc,backh);
    66db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    66de:	0f b6 00             	movzbl (%eax),%eax
    66e1:	0f be c0             	movsbl %al,%eax
    66e4:	83 ec 0c             	sub    $0xc,%esp
    66e7:	ff 75 14             	pushl  0x14(%ebp)
    66ea:	ff 75 10             	pushl  0x10(%ebp)
    66ed:	ff 75 0c             	pushl  0xc(%ebp)
    66f0:	ff 75 08             	pushl  0x8(%ebp)
    66f3:	50                   	push   %eax
    66f4:	e8 9e fc ff ff       	call   6397 <color_putc>
    66f9:	83 c4 20             	add    $0x20,%esp
          s++;
    66fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    6700:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6703:	0f b6 00             	movzbl (%eax),%eax
    6706:	84 c0                	test   %al,%al
    6708:	75 d1                	jne    66db <color_printf+0x104>
    670a:	e9 c1 00 00 00       	jmp    67d0 <color_printf+0x1f9>
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
    670f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    6713:	75 29                	jne    673e <color_printf+0x167>
        color_putc(*ap,forec,foreh,backc,backh);
    6715:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6718:	8b 00                	mov    (%eax),%eax
    671a:	0f be c0             	movsbl %al,%eax
    671d:	83 ec 0c             	sub    $0xc,%esp
    6720:	ff 75 14             	pushl  0x14(%ebp)
    6723:	ff 75 10             	pushl  0x10(%ebp)
    6726:	ff 75 0c             	pushl  0xc(%ebp)
    6729:	ff 75 08             	pushl  0x8(%ebp)
    672c:	50                   	push   %eax
    672d:	e8 65 fc ff ff       	call   6397 <color_putc>
    6732:	83 c4 20             	add    $0x20,%esp
        ap++;
    6735:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    6739:	e9 92 00 00 00       	jmp    67d0 <color_printf+0x1f9>
      } else if(c == '%'){
    673e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    6742:	75 20                	jne    6764 <color_printf+0x18d>
        color_putc(c,forec,foreh,backc,backh);
    6744:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6747:	0f be c0             	movsbl %al,%eax
    674a:	83 ec 0c             	sub    $0xc,%esp
    674d:	ff 75 14             	pushl  0x14(%ebp)
    6750:	ff 75 10             	pushl  0x10(%ebp)
    6753:	ff 75 0c             	pushl  0xc(%ebp)
    6756:	ff 75 08             	pushl  0x8(%ebp)
    6759:	50                   	push   %eax
    675a:	e8 38 fc ff ff       	call   6397 <color_putc>
    675f:	83 c4 20             	add    $0x20,%esp
    6762:	eb 6c                	jmp    67d0 <color_printf+0x1f9>
      } else if(c == 'f'){ //for double
    6764:	83 7d e4 66          	cmpl   $0x66,-0x1c(%ebp)
    6768:	75 2f                	jne    6799 <color_printf+0x1c2>
        double *dap = (double*)ap;
    676a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    676d:	89 45 e0             	mov    %eax,-0x20(%ebp)
        color_printdbl(*dap,forec,foreh,backc,backh);
    6770:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6773:	dd 00                	fldl   (%eax)
    6775:	83 ec 08             	sub    $0x8,%esp
    6778:	ff 75 14             	pushl  0x14(%ebp)
    677b:	ff 75 10             	pushl  0x10(%ebp)
    677e:	ff 75 0c             	pushl  0xc(%ebp)
    6781:	ff 75 08             	pushl  0x8(%ebp)
    6784:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    6788:	dd 1c 24             	fstpl  (%esp)
    678b:	e8 2b fd ff ff       	call   64bb <color_printdbl>
    6790:	83 c4 20             	add    $0x20,%esp
        ap += 2;
    6793:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
    6797:	eb 37                	jmp    67d0 <color_printf+0x1f9>
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
    6799:	83 ec 0c             	sub    $0xc,%esp
    679c:	ff 75 14             	pushl  0x14(%ebp)
    679f:	ff 75 10             	pushl  0x10(%ebp)
    67a2:	ff 75 0c             	pushl  0xc(%ebp)
    67a5:	ff 75 08             	pushl  0x8(%ebp)
    67a8:	6a 25                	push   $0x25
    67aa:	e8 e8 fb ff ff       	call   6397 <color_putc>
    67af:	83 c4 20             	add    $0x20,%esp
        color_putc(c,forec,foreh,backc,backh);
    67b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    67b5:	0f be c0             	movsbl %al,%eax
    67b8:	83 ec 0c             	sub    $0xc,%esp
    67bb:	ff 75 14             	pushl  0x14(%ebp)
    67be:	ff 75 10             	pushl  0x10(%ebp)
    67c1:	ff 75 0c             	pushl  0xc(%ebp)
    67c4:	ff 75 08             	pushl  0x8(%ebp)
    67c7:	50                   	push   %eax
    67c8:	e8 ca fb ff ff       	call   6397 <color_putc>
    67cd:	83 c4 20             	add    $0x20,%esp
      }
      state = 0;
    67d0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    67d7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    67db:	8b 55 18             	mov    0x18(%ebp),%edx
    67de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    67e1:	01 d0                	add    %edx,%eax
    67e3:	0f b6 00             	movzbl (%eax),%eax
    67e6:	84 c0                	test   %al,%al
    67e8:	0f 85 0b fe ff ff    	jne    65f9 <color_printf+0x22>
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
    67ee:	90                   	nop
    67ef:	c9                   	leave  
    67f0:	c3                   	ret    

000067f1 <istack>:

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    67f1:	55                   	push   %ebp
    67f2:	89 e5                	mov    %esp,%ebp
    67f4:	83 ec 18             	sub    $0x18,%esp
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    67f7:	83 ec 0c             	sub    $0xc,%esp
    67fa:	6a 58                	push   $0x58
    67fc:	e8 b0 d9 ff ff       	call   41b1 <malloc>
    6801:	83 c4 10             	add    $0x10,%esp
    6804:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    6807:	8b 45 f4             	mov    -0xc(%ebp),%eax
    680a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    6810:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6813:	c7 40 54 ff ff ff ff 	movl   $0xffffffff,0x54(%eax)
    return stack;
    681a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    681d:	c9                   	leave  
    681e:	c3                   	ret    

0000681f <pushi>:

void pushi(struct istack *s, int val)
{
    681f:	55                   	push   %ebp
    6820:	89 e5                	mov    %esp,%ebp
    if(s->size < STACK_MAX)
    6822:	8b 45 08             	mov    0x8(%ebp),%eax
    6825:	8b 00                	mov    (%eax),%eax
    6827:	83 f8 13             	cmp    $0x13,%eax
    682a:	7f 2c                	jg     6858 <pushi+0x39>
    {
        s->size++;
    682c:	8b 45 08             	mov    0x8(%ebp),%eax
    682f:	8b 00                	mov    (%eax),%eax
    6831:	8d 50 01             	lea    0x1(%eax),%edx
    6834:	8b 45 08             	mov    0x8(%ebp),%eax
    6837:	89 10                	mov    %edx,(%eax)
        s->top++;
    6839:	8b 45 08             	mov    0x8(%ebp),%eax
    683c:	8b 40 54             	mov    0x54(%eax),%eax
    683f:	8d 50 01             	lea    0x1(%eax),%edx
    6842:	8b 45 08             	mov    0x8(%ebp),%eax
    6845:	89 50 54             	mov    %edx,0x54(%eax)
        s->value[s->top] = val;
    6848:	8b 45 08             	mov    0x8(%ebp),%eax
    684b:	8b 50 54             	mov    0x54(%eax),%edx
    684e:	8b 45 08             	mov    0x8(%ebp),%eax
    6851:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    6854:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    }
}
    6858:	90                   	nop
    6859:	5d                   	pop    %ebp
    685a:	c3                   	ret    

0000685b <popi>:

int popi(struct istack *s)
{
    685b:	55                   	push   %ebp
    685c:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    685e:	8b 45 08             	mov    0x8(%ebp),%eax
    6861:	8b 00                	mov    (%eax),%eax
    6863:	85 c0                	test   %eax,%eax
    6865:	75 07                	jne    686e <popi+0x13>
    {
        return -1;
    6867:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    686c:	eb 2c                	jmp    689a <popi+0x3f>
    }
    s->size--;
    686e:	8b 45 08             	mov    0x8(%ebp),%eax
    6871:	8b 00                	mov    (%eax),%eax
    6873:	8d 50 ff             	lea    -0x1(%eax),%edx
    6876:	8b 45 08             	mov    0x8(%ebp),%eax
    6879:	89 10                	mov    %edx,(%eax)
    s->top--;
    687b:	8b 45 08             	mov    0x8(%ebp),%eax
    687e:	8b 40 54             	mov    0x54(%eax),%eax
    6881:	8d 50 ff             	lea    -0x1(%eax),%edx
    6884:	8b 45 08             	mov    0x8(%ebp),%eax
    6887:	89 50 54             	mov    %edx,0x54(%eax)
    return s->value[s->top+1];
    688a:	8b 45 08             	mov    0x8(%ebp),%eax
    688d:	8b 40 54             	mov    0x54(%eax),%eax
    6890:	8d 50 01             	lea    0x1(%eax),%edx
    6893:	8b 45 08             	mov    0x8(%ebp),%eax
    6896:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    689a:	5d                   	pop    %ebp
    689b:	c3                   	ret    

0000689c <topi>:

int topi(struct istack* s)
{
    689c:	55                   	push   %ebp
    689d:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    689f:	8b 45 08             	mov    0x8(%ebp),%eax
    68a2:	8b 50 54             	mov    0x54(%eax),%edx
    68a5:	8b 45 08             	mov    0x8(%ebp),%eax
    68a8:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
}
    68ac:	5d                   	pop    %ebp
    68ad:	c3                   	ret    

000068ae <cstack>:

//constructor
struct cstack* cstack()
{
    68ae:	55                   	push   %ebp
    68af:	89 e5                	mov    %esp,%ebp
    68b1:	83 ec 18             	sub    $0x18,%esp
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    68b4:	83 ec 0c             	sub    $0xc,%esp
    68b7:	6a 1c                	push   $0x1c
    68b9:	e8 f3 d8 ff ff       	call   41b1 <malloc>
    68be:	83 c4 10             	add    $0x10,%esp
    68c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    68c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    68c7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    68cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    68d0:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
    return stack;
    68d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    68da:	c9                   	leave  
    68db:	c3                   	ret    

000068dc <pushc>:

void pushc(struct cstack *s, char val)
{
    68dc:	55                   	push   %ebp
    68dd:	89 e5                	mov    %esp,%ebp
    68df:	83 ec 04             	sub    $0x4,%esp
    68e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    68e5:	88 45 fc             	mov    %al,-0x4(%ebp)
    if(s->size < STACK_MAX)
    68e8:	8b 45 08             	mov    0x8(%ebp),%eax
    68eb:	8b 00                	mov    (%eax),%eax
    68ed:	83 f8 13             	cmp    $0x13,%eax
    68f0:	7f 2d                	jg     691f <pushc+0x43>
    {
        s->size++;
    68f2:	8b 45 08             	mov    0x8(%ebp),%eax
    68f5:	8b 00                	mov    (%eax),%eax
    68f7:	8d 50 01             	lea    0x1(%eax),%edx
    68fa:	8b 45 08             	mov    0x8(%ebp),%eax
    68fd:	89 10                	mov    %edx,(%eax)
        s->top++;
    68ff:	8b 45 08             	mov    0x8(%ebp),%eax
    6902:	8b 40 18             	mov    0x18(%eax),%eax
    6905:	8d 50 01             	lea    0x1(%eax),%edx
    6908:	8b 45 08             	mov    0x8(%ebp),%eax
    690b:	89 50 18             	mov    %edx,0x18(%eax)
        s->value[s->top] = val;
    690e:	8b 45 08             	mov    0x8(%ebp),%eax
    6911:	8b 40 18             	mov    0x18(%eax),%eax
    6914:	8b 55 08             	mov    0x8(%ebp),%edx
    6917:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
    691b:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
    }
}
    691f:	90                   	nop
    6920:	c9                   	leave  
    6921:	c3                   	ret    

00006922 <popc>:

char popc(struct cstack *s)
{
    6922:	55                   	push   %ebp
    6923:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    6925:	8b 45 08             	mov    0x8(%ebp),%eax
    6928:	8b 00                	mov    (%eax),%eax
    692a:	85 c0                	test   %eax,%eax
    692c:	75 07                	jne    6935 <popc+0x13>
    {
        return -1;
    692e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    6933:	eb 2d                	jmp    6962 <popc+0x40>
    }
    s->size--;
    6935:	8b 45 08             	mov    0x8(%ebp),%eax
    6938:	8b 00                	mov    (%eax),%eax
    693a:	8d 50 ff             	lea    -0x1(%eax),%edx
    693d:	8b 45 08             	mov    0x8(%ebp),%eax
    6940:	89 10                	mov    %edx,(%eax)
    s->top--;
    6942:	8b 45 08             	mov    0x8(%ebp),%eax
    6945:	8b 40 18             	mov    0x18(%eax),%eax
    6948:	8d 50 ff             	lea    -0x1(%eax),%edx
    694b:	8b 45 08             	mov    0x8(%ebp),%eax
    694e:	89 50 18             	mov    %edx,0x18(%eax)
    return s->value[s->top+1];
    6951:	8b 45 08             	mov    0x8(%ebp),%eax
    6954:	8b 40 18             	mov    0x18(%eax),%eax
    6957:	8d 50 01             	lea    0x1(%eax),%edx
    695a:	8b 45 08             	mov    0x8(%ebp),%eax
    695d:	0f b6 44 10 04       	movzbl 0x4(%eax,%edx,1),%eax
}
    6962:	5d                   	pop    %ebp
    6963:	c3                   	ret    

00006964 <topc>:

char topc(struct cstack* s)
{
    6964:	55                   	push   %ebp
    6965:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    6967:	8b 45 08             	mov    0x8(%ebp),%eax
    696a:	8b 40 18             	mov    0x18(%eax),%eax
    696d:	8b 55 08             	mov    0x8(%ebp),%edx
    6970:	0f b6 44 02 04       	movzbl 0x4(%edx,%eax,1),%eax
}
    6975:	5d                   	pop    %ebp
    6976:	c3                   	ret    

00006977 <dstack>:

//constructor
struct dstack* dstack()
{
    6977:	55                   	push   %ebp
    6978:	89 e5                	mov    %esp,%ebp
    697a:	83 ec 18             	sub    $0x18,%esp
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    697d:	83 ec 0c             	sub    $0xc,%esp
    6980:	68 a8 00 00 00       	push   $0xa8
    6985:	e8 27 d8 ff ff       	call   41b1 <malloc>
    698a:	83 c4 10             	add    $0x10,%esp
    698d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stack->size = 0;
    6990:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6993:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    stack->top = -1;
    6999:	8b 45 f4             	mov    -0xc(%ebp),%eax
    699c:	c7 80 a4 00 00 00 ff 	movl   $0xffffffff,0xa4(%eax)
    69a3:	ff ff ff 
    return stack;
    69a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    69a9:	c9                   	leave  
    69aa:	c3                   	ret    

000069ab <pushd>:

void pushd(struct dstack *s, double val)
{
    69ab:	55                   	push   %ebp
    69ac:	89 e5                	mov    %esp,%ebp
    69ae:	83 ec 08             	sub    $0x8,%esp
    69b1:	8b 45 0c             	mov    0xc(%ebp),%eax
    69b4:	89 45 f8             	mov    %eax,-0x8(%ebp)
    69b7:	8b 45 10             	mov    0x10(%ebp),%eax
    69ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s->size < STACK_MAX)
    69bd:	8b 45 08             	mov    0x8(%ebp),%eax
    69c0:	8b 00                	mov    (%eax),%eax
    69c2:	83 f8 13             	cmp    $0x13,%eax
    69c5:	7f 35                	jg     69fc <pushd+0x51>
    {
        s->size++;
    69c7:	8b 45 08             	mov    0x8(%ebp),%eax
    69ca:	8b 00                	mov    (%eax),%eax
    69cc:	8d 50 01             	lea    0x1(%eax),%edx
    69cf:	8b 45 08             	mov    0x8(%ebp),%eax
    69d2:	89 10                	mov    %edx,(%eax)
        s->top++;
    69d4:	8b 45 08             	mov    0x8(%ebp),%eax
    69d7:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    69dd:	8d 50 01             	lea    0x1(%eax),%edx
    69e0:	8b 45 08             	mov    0x8(%ebp),%eax
    69e3:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
        s->value[s->top] = val;
    69e9:	8b 45 08             	mov    0x8(%ebp),%eax
    69ec:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    69f2:	8b 45 08             	mov    0x8(%ebp),%eax
    69f5:	dd 45 f8             	fldl   -0x8(%ebp)
    69f8:	dd 5c d0 04          	fstpl  0x4(%eax,%edx,8)
    }
}
    69fc:	90                   	nop
    69fd:	c9                   	leave  
    69fe:	c3                   	ret    

000069ff <popd>:

double popd(struct dstack *s)
{
    69ff:	55                   	push   %ebp
    6a00:	89 e5                	mov    %esp,%ebp
    if(s->size == 0)
    6a02:	8b 45 08             	mov    0x8(%ebp),%eax
    6a05:	8b 00                	mov    (%eax),%eax
    6a07:	85 c0                	test   %eax,%eax
    6a09:	75 06                	jne    6a11 <popd+0x12>
    {
        return -1;
    6a0b:	d9 e8                	fld1   
    6a0d:	d9 e0                	fchs   
    6a0f:	eb 35                	jmp    6a46 <popd+0x47>
    }
    s->size--;
    6a11:	8b 45 08             	mov    0x8(%ebp),%eax
    6a14:	8b 00                	mov    (%eax),%eax
    6a16:	8d 50 ff             	lea    -0x1(%eax),%edx
    6a19:	8b 45 08             	mov    0x8(%ebp),%eax
    6a1c:	89 10                	mov    %edx,(%eax)
    s->top--;
    6a1e:	8b 45 08             	mov    0x8(%ebp),%eax
    6a21:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    6a27:	8d 50 ff             	lea    -0x1(%eax),%edx
    6a2a:	8b 45 08             	mov    0x8(%ebp),%eax
    6a2d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
    return s->value[s->top+1];
    6a33:	8b 45 08             	mov    0x8(%ebp),%eax
    6a36:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
    6a3c:	8d 50 01             	lea    0x1(%eax),%edx
    6a3f:	8b 45 08             	mov    0x8(%ebp),%eax
    6a42:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
}
    6a46:	5d                   	pop    %ebp
    6a47:	c3                   	ret    

00006a48 <topd>:

double topd(struct dstack* s)
{
    6a48:	55                   	push   %ebp
    6a49:	89 e5                	mov    %esp,%ebp
    return s->value[s->top];
    6a4b:	8b 45 08             	mov    0x8(%ebp),%eax
    6a4e:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
    6a54:	8b 45 08             	mov    0x8(%ebp),%eax
    6a57:	dd 44 d0 04          	fldl   0x4(%eax,%edx,8)
    6a5b:	5d                   	pop    %ebp
    6a5c:	c3                   	ret    

00006a5d <readVariables>:
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    6a5d:	55                   	push   %ebp
    6a5e:	89 e5                	mov    %esp,%ebp
    6a60:	53                   	push   %ebx
    6a61:	81 ec 24 04 00 00    	sub    $0x424,%esp
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
    6a67:	83 ec 08             	sub    $0x8,%esp
    6a6a:	6a 00                	push   $0x0
    6a6c:	68 20 89 00 00       	push   $0x8920
    6a71:	e8 cd d1 ff ff       	call   3c43 <open>
    6a76:	83 c4 10             	add    $0x10,%esp
    6a79:	89 45 e8             	mov    %eax,-0x18(%ebp)
    6a7c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    6a80:	79 1d                	jns    6a9f <readVariables+0x42>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    6a82:	83 ec 0c             	sub    $0xc,%esp
    6a85:	68 2a 89 00 00       	push   $0x892a
    6a8a:	6a 00                	push   $0x0
    6a8c:	6a 00                	push   $0x0
    6a8e:	6a 01                	push   $0x1
    6a90:	6a 03                	push   $0x3
    6a92:	e8 40 fb ff ff       	call   65d7 <color_printf>
    6a97:	83 c4 20             	add    $0x20,%esp
    6a9a:	e9 6d 02 00 00       	jmp    6d0c <readVariables+0x2af>
    return;
  }
  *v_num = 0;
    6a9f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6aa2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    6aa8:	e9 2a 02 00 00       	jmp    6cd7 <readVariables+0x27a>
  {
    int pos = 0;
    6aad:	c7 85 ec fb ff ff 00 	movl   $0x0,-0x414(%ebp)
    6ab4:	00 00 00 
    while(pos <= n-1)
    6ab7:	e9 07 02 00 00       	jmp    6cc3 <readVariables+0x266>
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
    6abc:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
      while(buf[pos+nameEnd] != '=')
    6ac3:	eb 24                	jmp    6ae9 <readVariables+0x8c>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
    6ac5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ac8:	8d 50 ff             	lea    -0x1(%eax),%edx
    6acb:	8b 8d ec fb ff ff    	mov    -0x414(%ebp),%ecx
    6ad1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ad4:	01 c8                	add    %ecx,%eax
    6ad6:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    6add:	ff 
    6ade:	88 84 15 d8 fb ff ff 	mov    %al,-0x428(%ebp,%edx,1)
        nameEnd++;
    6ae5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
    6ae9:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    6aef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6af2:	01 d0                	add    %edx,%eax
    6af4:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    6afb:	ff 
    6afc:	3c 3d                	cmp    $0x3d,%al
    6afe:	75 c5                	jne    6ac5 <readVariables+0x68>
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
    6b00:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6b03:	83 e8 01             	sub    $0x1,%eax
    6b06:	c6 84 05 d8 fb ff ff 	movb   $0x0,-0x428(%ebp,%eax,1)
    6b0d:	00 
      if(buf[pos] == 'd') //double value
    6b0e:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    6b14:	0f b6 84 05 f0 fb ff 	movzbl -0x410(%ebp,%eax,1),%eax
    6b1b:	ff 
    6b1c:	3c 64                	cmp    $0x64,%al
    6b1e:	0f 85 a0 00 00 00    	jne    6bc4 <readVariables+0x167>
      {
        strcpy(variables[*v_num].name,name);
    6b24:	8b 45 0c             	mov    0xc(%ebp),%eax
    6b27:	8b 00                	mov    (%eax),%eax
    6b29:	c1 e0 05             	shl    $0x5,%eax
    6b2c:	89 c2                	mov    %eax,%edx
    6b2e:	8b 45 08             	mov    0x8(%ebp),%eax
    6b31:	01 d0                	add    %edx,%eax
    6b33:	8d 50 04             	lea    0x4(%eax),%edx
    6b36:	83 ec 08             	sub    $0x8,%esp
    6b39:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    6b3f:	50                   	push   %eax
    6b40:	52                   	push   %edx
    6b41:	e8 8c ce ff ff       	call   39d2 <strcpy>
    6b46:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    6b49:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6b4c:	8d 50 01             	lea    0x1(%eax),%edx
    6b4f:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    6b55:	01 d0                	add    %edx,%eax
    6b57:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        double result = Translation(buf,&pos);
    6b5d:	83 ec 08             	sub    $0x8,%esp
    6b60:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    6b66:	50                   	push   %eax
    6b67:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    6b6d:	50                   	push   %eax
    6b6e:	e8 7b d9 ff ff       	call   44ee <Translation>
    6b73:	83 c4 10             	add    $0x10,%esp
    6b76:	dd 5d d8             	fstpl  -0x28(%ebp)
        variables[*v_num].value.dvalue = result;
    6b79:	8b 45 0c             	mov    0xc(%ebp),%eax
    6b7c:	8b 00                	mov    (%eax),%eax
    6b7e:	c1 e0 05             	shl    $0x5,%eax
    6b81:	89 c2                	mov    %eax,%edx
    6b83:	8b 45 08             	mov    0x8(%ebp),%eax
    6b86:	01 d0                	add    %edx,%eax
    6b88:	dd 45 d8             	fldl   -0x28(%ebp)
    6b8b:	dd 58 18             	fstpl  0x18(%eax)
        variables[*v_num].type = V_DOUBLE;
    6b8e:	8b 45 0c             	mov    0xc(%ebp),%eax
    6b91:	8b 00                	mov    (%eax),%eax
    6b93:	c1 e0 05             	shl    $0x5,%eax
    6b96:	89 c2                	mov    %eax,%edx
    6b98:	8b 45 08             	mov    0x8(%ebp),%eax
    6b9b:	01 d0                	add    %edx,%eax
    6b9d:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        (*v_num)++;
    6ba3:	8b 45 0c             	mov    0xc(%ebp),%eax
    6ba6:	8b 00                	mov    (%eax),%eax
    6ba8:	8d 50 01             	lea    0x1(%eax),%edx
    6bab:	8b 45 0c             	mov    0xc(%ebp),%eax
    6bae:	89 10                	mov    %edx,(%eax)
        pos++;
    6bb0:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    6bb6:	83 c0 01             	add    $0x1,%eax
    6bb9:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
    6bbf:	e9 ff 00 00 00       	jmp    6cc3 <readVariables+0x266>
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
    6bc4:	8b 45 0c             	mov    0xc(%ebp),%eax
    6bc7:	8b 00                	mov    (%eax),%eax
    6bc9:	c1 e0 05             	shl    $0x5,%eax
    6bcc:	89 c2                	mov    %eax,%edx
    6bce:	8b 45 08             	mov    0x8(%ebp),%eax
    6bd1:	01 d0                	add    %edx,%eax
    6bd3:	8d 50 04             	lea    0x4(%eax),%edx
    6bd6:	83 ec 08             	sub    $0x8,%esp
    6bd9:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
    6bdf:	50                   	push   %eax
    6be0:	52                   	push   %edx
    6be1:	e8 ec cd ff ff       	call   39d2 <strcpy>
    6be6:	83 c4 10             	add    $0x10,%esp
        pos += (nameEnd + 1);
    6be9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6bec:	8d 50 01             	lea    0x1(%eax),%edx
    6bef:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    6bf5:	01 d0                	add    %edx,%eax
    6bf7:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
        int strend = pos;
    6bfd:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    6c03:	89 45 f0             	mov    %eax,-0x10(%ebp)
        while(buf[strend] != '\0')
    6c06:	eb 04                	jmp    6c0c <readVariables+0x1af>
        {
          strend++;
    6c08:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
    6c0c:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
    6c12:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6c15:	01 d0                	add    %edx,%eax
    6c17:	0f b6 00             	movzbl (%eax),%eax
    6c1a:	84 c0                	test   %al,%al
    6c1c:	75 ea                	jne    6c08 <readVariables+0x1ab>
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
    6c1e:	8b 45 0c             	mov    0xc(%ebp),%eax
    6c21:	8b 00                	mov    (%eax),%eax
    6c23:	c1 e0 05             	shl    $0x5,%eax
    6c26:	89 c2                	mov    %eax,%edx
    6c28:	8b 45 08             	mov    0x8(%ebp),%eax
    6c2b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    6c2e:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    6c34:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6c37:	29 c2                	sub    %eax,%edx
    6c39:	89 d0                	mov    %edx,%eax
    6c3b:	83 c0 01             	add    $0x1,%eax
    6c3e:	83 ec 0c             	sub    $0xc,%esp
    6c41:	50                   	push   %eax
    6c42:	e8 6a d5 ff ff       	call   41b1 <malloc>
    6c47:	83 c4 10             	add    $0x10,%esp
    6c4a:	89 43 18             	mov    %eax,0x18(%ebx)
        for(int k = pos; k <= strend; k++)
    6c4d:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    6c53:	89 45 ec             	mov    %eax,-0x14(%ebp)
    6c56:	eb 35                	jmp    6c8d <readVariables+0x230>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
    6c58:	8b 45 0c             	mov    0xc(%ebp),%eax
    6c5b:	8b 00                	mov    (%eax),%eax
    6c5d:	c1 e0 05             	shl    $0x5,%eax
    6c60:	89 c2                	mov    %eax,%edx
    6c62:	8b 45 08             	mov    0x8(%ebp),%eax
    6c65:	01 d0                	add    %edx,%eax
    6c67:	8b 40 18             	mov    0x18(%eax),%eax
    6c6a:	8b 95 ec fb ff ff    	mov    -0x414(%ebp),%edx
    6c70:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    6c73:	29 d1                	sub    %edx,%ecx
    6c75:	89 ca                	mov    %ecx,%edx
    6c77:	01 c2                	add    %eax,%edx
    6c79:	8d 8d f0 fb ff ff    	lea    -0x410(%ebp),%ecx
    6c7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6c82:	01 c8                	add    %ecx,%eax
    6c84:	0f b6 00             	movzbl (%eax),%eax
    6c87:	88 02                	mov    %al,(%edx)
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
    6c89:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6c8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6c90:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    6c93:	7e c3                	jle    6c58 <readVariables+0x1fb>
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
    6c95:	8b 45 0c             	mov    0xc(%ebp),%eax
    6c98:	8b 00                	mov    (%eax),%eax
    6c9a:	c1 e0 05             	shl    $0x5,%eax
    6c9d:	89 c2                	mov    %eax,%edx
    6c9f:	8b 45 08             	mov    0x8(%ebp),%eax
    6ca2:	01 d0                	add    %edx,%eax
    6ca4:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        (*v_num)++;
    6caa:	8b 45 0c             	mov    0xc(%ebp),%eax
    6cad:	8b 00                	mov    (%eax),%eax
    6caf:	8d 50 01             	lea    0x1(%eax),%edx
    6cb2:	8b 45 0c             	mov    0xc(%ebp),%eax
    6cb5:	89 10                	mov    %edx,(%eax)
        pos = strend+1;
    6cb7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6cba:	83 c0 01             	add    $0x1,%eax
    6cbd:	89 85 ec fb ff ff    	mov    %eax,-0x414(%ebp)
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    6cc3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6cc6:	8d 50 ff             	lea    -0x1(%eax),%edx
    6cc9:	8b 85 ec fb ff ff    	mov    -0x414(%ebp),%eax
    6ccf:	39 c2                	cmp    %eax,%edx
    6cd1:	0f 8d e5 fd ff ff    	jge    6abc <readVariables+0x5f>
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
    6cd7:	83 ec 04             	sub    $0x4,%esp
    6cda:	68 e8 03 00 00       	push   $0x3e8
    6cdf:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    6ce5:	50                   	push   %eax
    6ce6:	ff 75 e8             	pushl  -0x18(%ebp)
    6ce9:	e8 2d cf ff ff       	call   3c1b <read>
    6cee:	83 c4 10             	add    $0x10,%esp
    6cf1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    6cf4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    6cf8:	0f 8f af fd ff ff    	jg     6aad <readVariables+0x50>
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
    6cfe:	83 ec 0c             	sub    $0xc,%esp
    6d01:	ff 75 e8             	pushl  -0x18(%ebp)
    6d04:	e8 22 cf ff ff       	call   3c2b <close>
    6d09:	83 c4 10             	add    $0x10,%esp
}
    6d0c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    6d0f:	c9                   	leave  
    6d10:	c3                   	ret    

00006d11 <writeVariables>:

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
    6d11:	55                   	push   %ebp
    6d12:	89 e5                	mov    %esp,%ebp
    6d14:	81 ec 88 00 00 00    	sub    $0x88,%esp
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
    6d1a:	83 ec 08             	sub    $0x8,%esp
    6d1d:	6a 02                	push   $0x2
    6d1f:	68 20 89 00 00       	push   $0x8920
    6d24:	e8 1a cf ff ff       	call   3c43 <open>
    6d29:	83 c4 10             	add    $0x10,%esp
    6d2c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    6d2f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    6d33:	78 1e                	js     6d53 <writeVariables+0x42>
  {
    close(fd);
    6d35:	83 ec 0c             	sub    $0xc,%esp
    6d38:	ff 75 e4             	pushl  -0x1c(%ebp)
    6d3b:	e8 eb ce ff ff       	call   3c2b <close>
    6d40:	83 c4 10             	add    $0x10,%esp
    unlink("variables");
    6d43:	83 ec 0c             	sub    $0xc,%esp
    6d46:	68 20 89 00 00       	push   $0x8920
    6d4b:	e8 03 cf ff ff       	call   3c53 <unlink>
    6d50:	83 c4 10             	add    $0x10,%esp
  }
  fd = open("variables",O_CREATE|O_RDWR);
    6d53:	83 ec 08             	sub    $0x8,%esp
    6d56:	68 02 02 00 00       	push   $0x202
    6d5b:	68 20 89 00 00       	push   $0x8920
    6d60:	e8 de ce ff ff       	call   3c43 <open>
    6d65:	83 c4 10             	add    $0x10,%esp
    6d68:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i=0; i<*v_num; i++)
    6d6b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6d72:	e9 ff 01 00 00       	jmp    6f76 <writeVariables+0x265>
  {
    if(variables[i].type == V_DOUBLE)
    6d77:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d7a:	c1 e0 05             	shl    $0x5,%eax
    6d7d:	89 c2                	mov    %eax,%edx
    6d7f:	8b 45 08             	mov    0x8(%ebp),%eax
    6d82:	01 d0                	add    %edx,%eax
    6d84:	8b 00                	mov    (%eax),%eax
    6d86:	83 f8 01             	cmp    $0x1,%eax
    6d89:	0f 85 d3 00 00 00    	jne    6e62 <writeVariables+0x151>
    {
      char buf[100];
      int pos = 0;
    6d8f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      buf[pos++] = 'd';
    6d96:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6d99:	8d 50 01             	lea    0x1(%eax),%edx
    6d9c:	89 55 e0             	mov    %edx,-0x20(%ebp)
    6d9f:	c6 84 05 7c ff ff ff 	movb   $0x64,-0x84(%ebp,%eax,1)
    6da6:	64 
      int k=0;
    6da7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      while(variables[i].name[k] != '\0')
    6dae:	eb 2c                	jmp    6ddc <writeVariables+0xcb>
      {
        buf[pos++] = variables[i].name[k];
    6db0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6db3:	8d 50 01             	lea    0x1(%eax),%edx
    6db6:	89 55 e0             	mov    %edx,-0x20(%ebp)
    6db9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6dbc:	89 d1                	mov    %edx,%ecx
    6dbe:	c1 e1 05             	shl    $0x5,%ecx
    6dc1:	8b 55 08             	mov    0x8(%ebp),%edx
    6dc4:	01 d1                	add    %edx,%ecx
    6dc6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6dc9:	01 ca                	add    %ecx,%edx
    6dcb:	83 c2 04             	add    $0x4,%edx
    6dce:	0f b6 12             	movzbl (%edx),%edx
    6dd1:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    6dd8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
    6ddc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ddf:	c1 e0 05             	shl    $0x5,%eax
    6de2:	89 c2                	mov    %eax,%edx
    6de4:	8b 45 08             	mov    0x8(%ebp),%eax
    6de7:	01 c2                	add    %eax,%edx
    6de9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6dec:	01 d0                	add    %edx,%eax
    6dee:	83 c0 04             	add    $0x4,%eax
    6df1:	0f b6 00             	movzbl (%eax),%eax
    6df4:	84 c0                	test   %al,%al
    6df6:	75 b8                	jne    6db0 <writeVariables+0x9f>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    6df8:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6dfb:	8d 50 01             	lea    0x1(%eax),%edx
    6dfe:	89 55 e0             	mov    %edx,-0x20(%ebp)
    6e01:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    6e08:	3d 
      double2str(buf,variables[i].value.dvalue,&pos);
    6e09:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6e0c:	c1 e0 05             	shl    $0x5,%eax
    6e0f:	89 c2                	mov    %eax,%edx
    6e11:	8b 45 08             	mov    0x8(%ebp),%eax
    6e14:	01 d0                	add    %edx,%eax
    6e16:	dd 40 18             	fldl   0x18(%eax)
    6e19:	8d 45 e0             	lea    -0x20(%ebp),%eax
    6e1c:	50                   	push   %eax
    6e1d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    6e21:	dd 1c 24             	fstpl  (%esp)
    6e24:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    6e2a:	50                   	push   %eax
    6e2b:	e8 7d d5 ff ff       	call   43ad <double2str>
    6e30:	83 c4 10             	add    $0x10,%esp
      buf[pos++] = '\0';
    6e33:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6e36:	8d 50 01             	lea    0x1(%eax),%edx
    6e39:	89 55 e0             	mov    %edx,-0x20(%ebp)
    6e3c:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    6e43:	00 
      write(fd,buf,pos);
    6e44:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6e47:	83 ec 04             	sub    $0x4,%esp
    6e4a:	50                   	push   %eax
    6e4b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    6e51:	50                   	push   %eax
    6e52:	ff 75 e4             	pushl  -0x1c(%ebp)
    6e55:	e8 c9 cd ff ff       	call   3c23 <write>
    6e5a:	83 c4 10             	add    $0x10,%esp
    6e5d:	e9 10 01 00 00       	jmp    6f72 <writeVariables+0x261>
    }
    else //string
    {
      char buf[100];
      int pos = 0;
    6e62:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      buf[pos++] = 's';
    6e69:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6e6c:	8d 50 01             	lea    0x1(%eax),%edx
    6e6f:	89 55 ec             	mov    %edx,-0x14(%ebp)
    6e72:	c6 84 05 7c ff ff ff 	movb   $0x73,-0x84(%ebp,%eax,1)
    6e79:	73 
      int k=0;
    6e7a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].name[k] != '\0')
    6e81:	eb 2c                	jmp    6eaf <writeVariables+0x19e>
      {
        buf[pos++] = variables[i].name[k];
    6e83:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6e86:	8d 50 01             	lea    0x1(%eax),%edx
    6e89:	89 55 ec             	mov    %edx,-0x14(%ebp)
    6e8c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6e8f:	89 d1                	mov    %edx,%ecx
    6e91:	c1 e1 05             	shl    $0x5,%ecx
    6e94:	8b 55 08             	mov    0x8(%ebp),%edx
    6e97:	01 d1                	add    %edx,%ecx
    6e99:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6e9c:	01 ca                	add    %ecx,%edx
    6e9e:	83 c2 04             	add    $0x4,%edx
    6ea1:	0f b6 12             	movzbl (%edx),%edx
    6ea4:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    6eab:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
    6eaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6eb2:	c1 e0 05             	shl    $0x5,%eax
    6eb5:	89 c2                	mov    %eax,%edx
    6eb7:	8b 45 08             	mov    0x8(%ebp),%eax
    6eba:	01 c2                	add    %eax,%edx
    6ebc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6ebf:	01 d0                	add    %edx,%eax
    6ec1:	83 c0 04             	add    $0x4,%eax
    6ec4:	0f b6 00             	movzbl (%eax),%eax
    6ec7:	84 c0                	test   %al,%al
    6ec9:	75 b8                	jne    6e83 <writeVariables+0x172>
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
    6ecb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6ece:	8d 50 01             	lea    0x1(%eax),%edx
    6ed1:	89 55 ec             	mov    %edx,-0x14(%ebp)
    6ed4:	c6 84 05 7c ff ff ff 	movb   $0x3d,-0x84(%ebp,%eax,1)
    6edb:	3d 
      k=0;
    6edc:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
      while(variables[i].value.str[k] != '\0')
    6ee3:	eb 2c                	jmp    6f11 <writeVariables+0x200>
      {
        buf[pos++] = variables[i].value.str[k];
    6ee5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6ee8:	8d 50 01             	lea    0x1(%eax),%edx
    6eeb:	89 55 ec             	mov    %edx,-0x14(%ebp)
    6eee:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6ef1:	89 d1                	mov    %edx,%ecx
    6ef3:	c1 e1 05             	shl    $0x5,%ecx
    6ef6:	8b 55 08             	mov    0x8(%ebp),%edx
    6ef9:	01 ca                	add    %ecx,%edx
    6efb:	8b 4a 18             	mov    0x18(%edx),%ecx
    6efe:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6f01:	01 ca                	add    %ecx,%edx
    6f03:	0f b6 12             	movzbl (%edx),%edx
    6f06:	88 94 05 7c ff ff ff 	mov    %dl,-0x84(%ebp,%eax,1)
        k++;
    6f0d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
    6f11:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6f14:	c1 e0 05             	shl    $0x5,%eax
    6f17:	89 c2                	mov    %eax,%edx
    6f19:	8b 45 08             	mov    0x8(%ebp),%eax
    6f1c:	01 d0                	add    %edx,%eax
    6f1e:	8b 50 18             	mov    0x18(%eax),%edx
    6f21:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6f24:	01 d0                	add    %edx,%eax
    6f26:	0f b6 00             	movzbl (%eax),%eax
    6f29:	84 c0                	test   %al,%al
    6f2b:	75 b8                	jne    6ee5 <writeVariables+0x1d4>
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
    6f2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6f30:	8d 50 01             	lea    0x1(%eax),%edx
    6f33:	89 55 ec             	mov    %edx,-0x14(%ebp)
    6f36:	c6 84 05 7c ff ff ff 	movb   $0x0,-0x84(%ebp,%eax,1)
    6f3d:	00 
      write(fd,buf,pos);
    6f3e:	83 ec 04             	sub    $0x4,%esp
    6f41:	ff 75 ec             	pushl  -0x14(%ebp)
    6f44:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    6f4a:	50                   	push   %eax
    6f4b:	ff 75 e4             	pushl  -0x1c(%ebp)
    6f4e:	e8 d0 cc ff ff       	call   3c23 <write>
    6f53:	83 c4 10             	add    $0x10,%esp
      free(variables[i].value.str);
    6f56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6f59:	c1 e0 05             	shl    $0x5,%eax
    6f5c:	89 c2                	mov    %eax,%edx
    6f5e:	8b 45 08             	mov    0x8(%ebp),%eax
    6f61:	01 d0                	add    %edx,%eax
    6f63:	8b 40 18             	mov    0x18(%eax),%eax
    6f66:	83 ec 0c             	sub    $0xc,%esp
    6f69:	50                   	push   %eax
    6f6a:	e8 00 d1 ff ff       	call   406f <free>
    6f6f:	83 c4 10             	add    $0x10,%esp
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
    6f72:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6f76:	8b 45 0c             	mov    0xc(%ebp),%eax
    6f79:	8b 00                	mov    (%eax),%eax
    6f7b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    6f7e:	0f 8f f3 fd ff ff    	jg     6d77 <writeVariables+0x66>
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
    6f84:	8b 45 0c             	mov    0xc(%ebp),%eax
    6f87:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  close(fd);
    6f8d:	83 ec 0c             	sub    $0xc,%esp
    6f90:	ff 75 e4             	pushl  -0x1c(%ebp)
    6f93:	e8 93 cc ff ff       	call   3c2b <close>
    6f98:	83 c4 10             	add    $0x10,%esp
  return;
    6f9b:	90                   	nop
    6f9c:	c9                   	leave  
    6f9d:	c3                   	ret    
