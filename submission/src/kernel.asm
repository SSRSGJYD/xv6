
kernel：     文件格式 elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 b0 10 00       	mov    $0x10b000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc 80 d7 10 80       	mov    $0x8010d780,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 d6 2e 10 80       	mov    $0x80102ed6,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax

80100034 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100034:	55                   	push   %ebp
80100035:	89 e5                	mov    %esp,%ebp
80100037:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010003a:	83 ec 08             	sub    $0x8,%esp
8010003d:	68 34 98 10 80       	push   $0x80109834
80100042:	68 80 d7 10 80       	push   $0x8010d780
80100047:	e8 9e 45 00 00       	call   801045ea <initlock>
8010004c:	83 c4 10             	add    $0x10,%esp

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010004f:	c7 05 b0 ec 10 80 a4 	movl   $0x8010eca4,0x8010ecb0
80100056:	ec 10 80 
  bcache.head.next = &bcache.head;
80100059:	c7 05 b4 ec 10 80 a4 	movl   $0x8010eca4,0x8010ecb4
80100060:	ec 10 80 
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100063:	c7 45 f4 b4 d7 10 80 	movl   $0x8010d7b4,-0xc(%ebp)
8010006a:	eb 3a                	jmp    801000a6 <binit+0x72>
    b->next = bcache.head.next;
8010006c:	8b 15 b4 ec 10 80    	mov    0x8010ecb4,%edx
80100072:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100075:	89 50 10             	mov    %edx,0x10(%eax)
    b->prev = &bcache.head;
80100078:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010007b:	c7 40 0c a4 ec 10 80 	movl   $0x8010eca4,0xc(%eax)
    b->dev = -1;
80100082:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100085:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    bcache.head.next->prev = b;
8010008c:	a1 b4 ec 10 80       	mov    0x8010ecb4,%eax
80100091:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100094:	89 50 0c             	mov    %edx,0xc(%eax)
    bcache.head.next = b;
80100097:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010009a:	a3 b4 ec 10 80       	mov    %eax,0x8010ecb4

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
8010009f:	81 45 f4 18 02 00 00 	addl   $0x218,-0xc(%ebp)
801000a6:	b8 a4 ec 10 80       	mov    $0x8010eca4,%eax
801000ab:	39 45 f4             	cmp    %eax,-0xc(%ebp)
801000ae:	72 bc                	jb     8010006c <binit+0x38>
    b->prev = &bcache.head;
    b->dev = -1;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000b0:	90                   	nop
801000b1:	c9                   	leave  
801000b2:	c3                   	ret    

801000b3 <bget>:
// Look through buffer cache for sector on device dev.
// If not found, allocate fresh block.
// In either case, return B_BUSY buffer.
static struct buf*
bget(uint dev, uint sector)
{
801000b3:	55                   	push   %ebp
801000b4:	89 e5                	mov    %esp,%ebp
801000b6:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  acquire(&bcache.lock);
801000b9:	83 ec 0c             	sub    $0xc,%esp
801000bc:	68 80 d7 10 80       	push   $0x8010d780
801000c1:	e8 46 45 00 00       	call   8010460c <acquire>
801000c6:	83 c4 10             	add    $0x10,%esp

 loop:
  // Is the sector already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000c9:	a1 b4 ec 10 80       	mov    0x8010ecb4,%eax
801000ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
801000d1:	eb 67                	jmp    8010013a <bget+0x87>
    if(b->dev == dev && b->sector == sector){
801000d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000d6:	8b 40 04             	mov    0x4(%eax),%eax
801000d9:	3b 45 08             	cmp    0x8(%ebp),%eax
801000dc:	75 53                	jne    80100131 <bget+0x7e>
801000de:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000e1:	8b 40 08             	mov    0x8(%eax),%eax
801000e4:	3b 45 0c             	cmp    0xc(%ebp),%eax
801000e7:	75 48                	jne    80100131 <bget+0x7e>
      if(!(b->flags & B_BUSY)){
801000e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000ec:	8b 00                	mov    (%eax),%eax
801000ee:	83 e0 01             	and    $0x1,%eax
801000f1:	85 c0                	test   %eax,%eax
801000f3:	75 27                	jne    8010011c <bget+0x69>
        b->flags |= B_BUSY;
801000f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000f8:	8b 00                	mov    (%eax),%eax
801000fa:	83 c8 01             	or     $0x1,%eax
801000fd:	89 c2                	mov    %eax,%edx
801000ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100102:	89 10                	mov    %edx,(%eax)
        release(&bcache.lock);
80100104:	83 ec 0c             	sub    $0xc,%esp
80100107:	68 80 d7 10 80       	push   $0x8010d780
8010010c:	e8 62 45 00 00       	call   80104673 <release>
80100111:	83 c4 10             	add    $0x10,%esp
        return b;
80100114:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100117:	e9 98 00 00 00       	jmp    801001b4 <bget+0x101>
      }
      sleep(b, &bcache.lock);
8010011c:	83 ec 08             	sub    $0x8,%esp
8010011f:	68 80 d7 10 80       	push   $0x8010d780
80100124:	ff 75 f4             	pushl  -0xc(%ebp)
80100127:	e8 e7 41 00 00       	call   80104313 <sleep>
8010012c:	83 c4 10             	add    $0x10,%esp
      goto loop;
8010012f:	eb 98                	jmp    801000c9 <bget+0x16>

  acquire(&bcache.lock);

 loop:
  // Is the sector already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
80100131:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100134:	8b 40 10             	mov    0x10(%eax),%eax
80100137:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010013a:	81 7d f4 a4 ec 10 80 	cmpl   $0x8010eca4,-0xc(%ebp)
80100141:	75 90                	jne    801000d3 <bget+0x20>
      goto loop;
    }
  }

  // Not cached; recycle some non-busy and clean buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100143:	a1 b0 ec 10 80       	mov    0x8010ecb0,%eax
80100148:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010014b:	eb 51                	jmp    8010019e <bget+0xeb>
    if((b->flags & B_BUSY) == 0 && (b->flags & B_DIRTY) == 0){
8010014d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100150:	8b 00                	mov    (%eax),%eax
80100152:	83 e0 01             	and    $0x1,%eax
80100155:	85 c0                	test   %eax,%eax
80100157:	75 3c                	jne    80100195 <bget+0xe2>
80100159:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010015c:	8b 00                	mov    (%eax),%eax
8010015e:	83 e0 04             	and    $0x4,%eax
80100161:	85 c0                	test   %eax,%eax
80100163:	75 30                	jne    80100195 <bget+0xe2>
      b->dev = dev;
80100165:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100168:	8b 55 08             	mov    0x8(%ebp),%edx
8010016b:	89 50 04             	mov    %edx,0x4(%eax)
      b->sector = sector;
8010016e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100171:	8b 55 0c             	mov    0xc(%ebp),%edx
80100174:	89 50 08             	mov    %edx,0x8(%eax)
      b->flags = B_BUSY;
80100177:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010017a:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
      release(&bcache.lock);
80100180:	83 ec 0c             	sub    $0xc,%esp
80100183:	68 80 d7 10 80       	push   $0x8010d780
80100188:	e8 e6 44 00 00       	call   80104673 <release>
8010018d:	83 c4 10             	add    $0x10,%esp
      return b;
80100190:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100193:	eb 1f                	jmp    801001b4 <bget+0x101>
      goto loop;
    }
  }

  // Not cached; recycle some non-busy and clean buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100195:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100198:	8b 40 0c             	mov    0xc(%eax),%eax
8010019b:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010019e:	81 7d f4 a4 ec 10 80 	cmpl   $0x8010eca4,-0xc(%ebp)
801001a5:	75 a6                	jne    8010014d <bget+0x9a>
      b->flags = B_BUSY;
      release(&bcache.lock);
      return b;
    }
  }
  panic("bget: no buffers");
801001a7:	83 ec 0c             	sub    $0xc,%esp
801001aa:	68 3b 98 10 80       	push   $0x8010983b
801001af:	e8 9b 85 00 00       	call   8010874f <panic>
}
801001b4:	c9                   	leave  
801001b5:	c3                   	ret    

801001b6 <bread>:

// Return a B_BUSY buf with the contents of the indicated disk sector.
struct buf*
bread(uint dev, uint sector)
{
801001b6:	55                   	push   %ebp
801001b7:	89 e5                	mov    %esp,%ebp
801001b9:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  b = bget(dev, sector);
801001bc:	83 ec 08             	sub    $0x8,%esp
801001bf:	ff 75 0c             	pushl  0xc(%ebp)
801001c2:	ff 75 08             	pushl  0x8(%ebp)
801001c5:	e8 e9 fe ff ff       	call   801000b3 <bget>
801001ca:	83 c4 10             	add    $0x10,%esp
801001cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!(b->flags & B_VALID))
801001d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801001d3:	8b 00                	mov    (%eax),%eax
801001d5:	83 e0 02             	and    $0x2,%eax
801001d8:	85 c0                	test   %eax,%eax
801001da:	75 0e                	jne    801001ea <bread+0x34>
    iderw(b);
801001dc:	83 ec 0c             	sub    $0xc,%esp
801001df:	ff 75 f4             	pushl  -0xc(%ebp)
801001e2:	e8 ca 20 00 00       	call   801022b1 <iderw>
801001e7:	83 c4 10             	add    $0x10,%esp
  return b;
801001ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
801001ed:	c9                   	leave  
801001ee:	c3                   	ret    

801001ef <bwrite>:

// Write b's contents to disk.  Must be B_BUSY.
void
bwrite(struct buf *b)
{
801001ef:	55                   	push   %ebp
801001f0:	89 e5                	mov    %esp,%ebp
801001f2:	83 ec 08             	sub    $0x8,%esp
  if((b->flags & B_BUSY) == 0)
801001f5:	8b 45 08             	mov    0x8(%ebp),%eax
801001f8:	8b 00                	mov    (%eax),%eax
801001fa:	83 e0 01             	and    $0x1,%eax
801001fd:	85 c0                	test   %eax,%eax
801001ff:	75 0d                	jne    8010020e <bwrite+0x1f>
    panic("bwrite");
80100201:	83 ec 0c             	sub    $0xc,%esp
80100204:	68 4c 98 10 80       	push   $0x8010984c
80100209:	e8 41 85 00 00       	call   8010874f <panic>
  b->flags |= B_DIRTY;
8010020e:	8b 45 08             	mov    0x8(%ebp),%eax
80100211:	8b 00                	mov    (%eax),%eax
80100213:	83 c8 04             	or     $0x4,%eax
80100216:	89 c2                	mov    %eax,%edx
80100218:	8b 45 08             	mov    0x8(%ebp),%eax
8010021b:	89 10                	mov    %edx,(%eax)
  iderw(b);
8010021d:	83 ec 0c             	sub    $0xc,%esp
80100220:	ff 75 08             	pushl  0x8(%ebp)
80100223:	e8 89 20 00 00       	call   801022b1 <iderw>
80100228:	83 c4 10             	add    $0x10,%esp
}
8010022b:	90                   	nop
8010022c:	c9                   	leave  
8010022d:	c3                   	ret    

8010022e <brelse>:

// Release a B_BUSY buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
8010022e:	55                   	push   %ebp
8010022f:	89 e5                	mov    %esp,%ebp
80100231:	83 ec 08             	sub    $0x8,%esp
  if((b->flags & B_BUSY) == 0)
80100234:	8b 45 08             	mov    0x8(%ebp),%eax
80100237:	8b 00                	mov    (%eax),%eax
80100239:	83 e0 01             	and    $0x1,%eax
8010023c:	85 c0                	test   %eax,%eax
8010023e:	75 0d                	jne    8010024d <brelse+0x1f>
    panic("brelse");
80100240:	83 ec 0c             	sub    $0xc,%esp
80100243:	68 53 98 10 80       	push   $0x80109853
80100248:	e8 02 85 00 00       	call   8010874f <panic>

  acquire(&bcache.lock);
8010024d:	83 ec 0c             	sub    $0xc,%esp
80100250:	68 80 d7 10 80       	push   $0x8010d780
80100255:	e8 b2 43 00 00       	call   8010460c <acquire>
8010025a:	83 c4 10             	add    $0x10,%esp

  b->next->prev = b->prev;
8010025d:	8b 45 08             	mov    0x8(%ebp),%eax
80100260:	8b 40 10             	mov    0x10(%eax),%eax
80100263:	8b 55 08             	mov    0x8(%ebp),%edx
80100266:	8b 52 0c             	mov    0xc(%edx),%edx
80100269:	89 50 0c             	mov    %edx,0xc(%eax)
  b->prev->next = b->next;
8010026c:	8b 45 08             	mov    0x8(%ebp),%eax
8010026f:	8b 40 0c             	mov    0xc(%eax),%eax
80100272:	8b 55 08             	mov    0x8(%ebp),%edx
80100275:	8b 52 10             	mov    0x10(%edx),%edx
80100278:	89 50 10             	mov    %edx,0x10(%eax)
  b->next = bcache.head.next;
8010027b:	8b 15 b4 ec 10 80    	mov    0x8010ecb4,%edx
80100281:	8b 45 08             	mov    0x8(%ebp),%eax
80100284:	89 50 10             	mov    %edx,0x10(%eax)
  b->prev = &bcache.head;
80100287:	8b 45 08             	mov    0x8(%ebp),%eax
8010028a:	c7 40 0c a4 ec 10 80 	movl   $0x8010eca4,0xc(%eax)
  bcache.head.next->prev = b;
80100291:	a1 b4 ec 10 80       	mov    0x8010ecb4,%eax
80100296:	8b 55 08             	mov    0x8(%ebp),%edx
80100299:	89 50 0c             	mov    %edx,0xc(%eax)
  bcache.head.next = b;
8010029c:	8b 45 08             	mov    0x8(%ebp),%eax
8010029f:	a3 b4 ec 10 80       	mov    %eax,0x8010ecb4

  b->flags &= ~B_BUSY;
801002a4:	8b 45 08             	mov    0x8(%ebp),%eax
801002a7:	8b 00                	mov    (%eax),%eax
801002a9:	83 e0 fe             	and    $0xfffffffe,%eax
801002ac:	89 c2                	mov    %eax,%edx
801002ae:	8b 45 08             	mov    0x8(%ebp),%eax
801002b1:	89 10                	mov    %edx,(%eax)
  wakeup(b);
801002b3:	83 ec 0c             	sub    $0xc,%esp
801002b6:	ff 75 08             	pushl  0x8(%ebp)
801002b9:	e8 40 41 00 00       	call   801043fe <wakeup>
801002be:	83 c4 10             	add    $0x10,%esp

  release(&bcache.lock);
801002c1:	83 ec 0c             	sub    $0xc,%esp
801002c4:	68 80 d7 10 80       	push   $0x8010d780
801002c9:	e8 a5 43 00 00       	call   80104673 <release>
801002ce:	83 c4 10             	add    $0x10,%esp
}
801002d1:	90                   	nop
801002d2:	c9                   	leave  
801002d3:	c3                   	ret    

801002d4 <exec>:
#include "defs.h"
#include "x86.h"
#include "elf.h"

int exec(char *path, char **argv)
{
801002d4:	55                   	push   %ebp
801002d5:	89 e5                	mov    %esp,%ebp
801002d7:	81 ec 18 01 00 00    	sub    $0x118,%esp
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;

  if((ip = namei(path)) == 0)
801002dd:	83 ec 0c             	sub    $0xc,%esp
801002e0:	ff 75 08             	pushl  0x8(%ebp)
801002e3:	e8 20 1c 00 00       	call   80101f08 <namei>
801002e8:	83 c4 10             	add    $0x10,%esp
801002eb:	89 45 d8             	mov    %eax,-0x28(%ebp)
801002ee:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
801002f2:	75 0a                	jne    801002fe <exec+0x2a>
    return -1;
801002f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002f9:	e9 c4 03 00 00       	jmp    801006c2 <exec+0x3ee>
  ilock(ip);
801002fe:	83 ec 0c             	sub    $0xc,%esp
80100301:	ff 75 d8             	pushl  -0x28(%ebp)
80100304:	e8 71 0e 00 00       	call   8010117a <ilock>
80100309:	83 c4 10             	add    $0x10,%esp
  pgdir = 0;
8010030c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
80100313:	6a 34                	push   $0x34
80100315:	6a 00                	push   $0x0
80100317:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
8010031d:	50                   	push   %eax
8010031e:	ff 75 d8             	pushl  -0x28(%ebp)
80100321:	e8 bc 13 00 00       	call   801016e2 <readi>
80100326:	83 c4 10             	add    $0x10,%esp
80100329:	83 f8 33             	cmp    $0x33,%eax
8010032c:	0f 86 44 03 00 00    	jbe    80100676 <exec+0x3a2>
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100332:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100338:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
8010033d:	0f 85 36 03 00 00    	jne    80100679 <exec+0x3a5>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100343:	e8 87 70 00 00       	call   801073cf <setupkvm>
80100348:	89 45 d4             	mov    %eax,-0x2c(%ebp)
8010034b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
8010034f:	0f 84 27 03 00 00    	je     8010067c <exec+0x3a8>
    goto bad;

  // Load program into memory.
  sz = 0;
80100355:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
8010035c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80100363:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
80100369:	89 45 e8             	mov    %eax,-0x18(%ebp)
8010036c:	e9 ab 00 00 00       	jmp    8010041c <exec+0x148>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100371:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100374:	6a 20                	push   $0x20
80100376:	50                   	push   %eax
80100377:	8d 85 ec fe ff ff    	lea    -0x114(%ebp),%eax
8010037d:	50                   	push   %eax
8010037e:	ff 75 d8             	pushl  -0x28(%ebp)
80100381:	e8 5c 13 00 00       	call   801016e2 <readi>
80100386:	83 c4 10             	add    $0x10,%esp
80100389:	83 f8 20             	cmp    $0x20,%eax
8010038c:	0f 85 ed 02 00 00    	jne    8010067f <exec+0x3ab>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100392:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100398:	83 f8 01             	cmp    $0x1,%eax
8010039b:	75 71                	jne    8010040e <exec+0x13a>
      continue;
    if(ph.memsz < ph.filesz)
8010039d:	8b 95 00 ff ff ff    	mov    -0x100(%ebp),%edx
801003a3:	8b 85 fc fe ff ff    	mov    -0x104(%ebp),%eax
801003a9:	39 c2                	cmp    %eax,%edx
801003ab:	0f 82 d1 02 00 00    	jb     80100682 <exec+0x3ae>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
801003b1:	8b 95 f4 fe ff ff    	mov    -0x10c(%ebp),%edx
801003b7:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
801003bd:	01 d0                	add    %edx,%eax
801003bf:	83 ec 04             	sub    $0x4,%esp
801003c2:	50                   	push   %eax
801003c3:	ff 75 e0             	pushl  -0x20(%ebp)
801003c6:	ff 75 d4             	pushl  -0x2c(%ebp)
801003c9:	e8 a8 73 00 00       	call   80107776 <allocuvm>
801003ce:	83 c4 10             	add    $0x10,%esp
801003d1:	89 45 e0             	mov    %eax,-0x20(%ebp)
801003d4:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
801003d8:	0f 84 a7 02 00 00    	je     80100685 <exec+0x3b1>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
801003de:	8b 95 fc fe ff ff    	mov    -0x104(%ebp),%edx
801003e4:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
801003ea:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
801003f0:	83 ec 0c             	sub    $0xc,%esp
801003f3:	52                   	push   %edx
801003f4:	50                   	push   %eax
801003f5:	ff 75 d8             	pushl  -0x28(%ebp)
801003f8:	51                   	push   %ecx
801003f9:	ff 75 d4             	pushl  -0x2c(%ebp)
801003fc:	e8 9e 72 00 00       	call   8010769f <loaduvm>
80100401:	83 c4 20             	add    $0x20,%esp
80100404:	85 c0                	test   %eax,%eax
80100406:	0f 88 7c 02 00 00    	js     80100688 <exec+0x3b4>
8010040c:	eb 01                	jmp    8010040f <exec+0x13b>
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
      continue;
8010040e:	90                   	nop
  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
8010040f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
80100413:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100416:	83 c0 20             	add    $0x20,%eax
80100419:	89 45 e8             	mov    %eax,-0x18(%ebp)
8010041c:	0f b7 85 38 ff ff ff 	movzwl -0xc8(%ebp),%eax
80100423:	0f b7 c0             	movzwl %ax,%eax
80100426:	3b 45 ec             	cmp    -0x14(%ebp),%eax
80100429:	0f 8f 42 ff ff ff    	jg     80100371 <exec+0x9d>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
8010042f:	83 ec 0c             	sub    $0xc,%esp
80100432:	ff 75 d8             	pushl  -0x28(%ebp)
80100435:	e8 fa 0f 00 00       	call   80101434 <iunlockput>
8010043a:	83 c4 10             	add    $0x10,%esp
  ip = 0;
8010043d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100444:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100447:	05 ff 0f 00 00       	add    $0xfff,%eax
8010044c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100451:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100454:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100457:	05 00 20 00 00       	add    $0x2000,%eax
8010045c:	83 ec 04             	sub    $0x4,%esp
8010045f:	50                   	push   %eax
80100460:	ff 75 e0             	pushl  -0x20(%ebp)
80100463:	ff 75 d4             	pushl  -0x2c(%ebp)
80100466:	e8 0b 73 00 00       	call   80107776 <allocuvm>
8010046b:	83 c4 10             	add    $0x10,%esp
8010046e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100471:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80100475:	0f 84 10 02 00 00    	je     8010068b <exec+0x3b7>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
8010047b:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010047e:	2d 00 20 00 00       	sub    $0x2000,%eax
80100483:	83 ec 08             	sub    $0x8,%esp
80100486:	50                   	push   %eax
80100487:	ff 75 d4             	pushl  -0x2c(%ebp)
8010048a:	e8 0d 75 00 00       	call   8010799c <clearpteu>
8010048f:	83 c4 10             	add    $0x10,%esp
  sp = sz;
80100492:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100495:	89 45 dc             	mov    %eax,-0x24(%ebp)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100498:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010049f:	e9 96 00 00 00       	jmp    8010053a <exec+0x266>
    if(argc >= MAXARG)
801004a4:	83 7d e4 1f          	cmpl   $0x1f,-0x1c(%ebp)
801004a8:	0f 87 e0 01 00 00    	ja     8010068e <exec+0x3ba>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
801004ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801004b1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
801004b8:	8b 45 0c             	mov    0xc(%ebp),%eax
801004bb:	01 d0                	add    %edx,%eax
801004bd:	8b 00                	mov    (%eax),%eax
801004bf:	83 ec 0c             	sub    $0xc,%esp
801004c2:	50                   	push   %eax
801004c3:	e8 f4 45 00 00       	call   80104abc <strlen>
801004c8:	83 c4 10             	add    $0x10,%esp
801004cb:	89 c2                	mov    %eax,%edx
801004cd:	8b 45 dc             	mov    -0x24(%ebp),%eax
801004d0:	29 d0                	sub    %edx,%eax
801004d2:	83 e8 01             	sub    $0x1,%eax
801004d5:	83 e0 fc             	and    $0xfffffffc,%eax
801004d8:	89 45 dc             	mov    %eax,-0x24(%ebp)
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
801004db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801004de:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
801004e5:	8b 45 0c             	mov    0xc(%ebp),%eax
801004e8:	01 d0                	add    %edx,%eax
801004ea:	8b 00                	mov    (%eax),%eax
801004ec:	83 ec 0c             	sub    $0xc,%esp
801004ef:	50                   	push   %eax
801004f0:	e8 c7 45 00 00       	call   80104abc <strlen>
801004f5:	83 c4 10             	add    $0x10,%esp
801004f8:	83 c0 01             	add    $0x1,%eax
801004fb:	89 c1                	mov    %eax,%ecx
801004fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100500:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
80100507:	8b 45 0c             	mov    0xc(%ebp),%eax
8010050a:	01 d0                	add    %edx,%eax
8010050c:	8b 00                	mov    (%eax),%eax
8010050e:	51                   	push   %ecx
8010050f:	50                   	push   %eax
80100510:	ff 75 dc             	pushl  -0x24(%ebp)
80100513:	ff 75 d4             	pushl  -0x2c(%ebp)
80100516:	e8 25 76 00 00       	call   80107b40 <copyout>
8010051b:	83 c4 10             	add    $0x10,%esp
8010051e:	85 c0                	test   %eax,%eax
80100520:	0f 88 6b 01 00 00    	js     80100691 <exec+0x3bd>
      goto bad;
    ustack[3+argc] = sp;
80100526:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100529:	8d 50 03             	lea    0x3(%eax),%edx
8010052c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010052f:	89 84 95 40 ff ff ff 	mov    %eax,-0xc0(%ebp,%edx,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100536:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010053a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010053d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
80100544:	8b 45 0c             	mov    0xc(%ebp),%eax
80100547:	01 d0                	add    %edx,%eax
80100549:	8b 00                	mov    (%eax),%eax
8010054b:	85 c0                	test   %eax,%eax
8010054d:	0f 85 51 ff ff ff    	jne    801004a4 <exec+0x1d0>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100553:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100556:	83 c0 03             	add    $0x3,%eax
80100559:	c7 84 85 40 ff ff ff 	movl   $0x0,-0xc0(%ebp,%eax,4)
80100560:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100564:	c7 85 40 ff ff ff ff 	movl   $0xffffffff,-0xc0(%ebp)
8010056b:	ff ff ff 
  ustack[1] = argc;
8010056e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100571:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100577:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010057a:	83 c0 01             	add    $0x1,%eax
8010057d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
80100584:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100587:	29 d0                	sub    %edx,%eax
80100589:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)

  sp -= (3+argc+1) * 4;
8010058f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100592:	83 c0 04             	add    $0x4,%eax
80100595:	c1 e0 02             	shl    $0x2,%eax
80100598:	29 45 dc             	sub    %eax,-0x24(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
8010059b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010059e:	83 c0 04             	add    $0x4,%eax
801005a1:	c1 e0 02             	shl    $0x2,%eax
801005a4:	50                   	push   %eax
801005a5:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
801005ab:	50                   	push   %eax
801005ac:	ff 75 dc             	pushl  -0x24(%ebp)
801005af:	ff 75 d4             	pushl  -0x2c(%ebp)
801005b2:	e8 89 75 00 00       	call   80107b40 <copyout>
801005b7:	83 c4 10             	add    $0x10,%esp
801005ba:	85 c0                	test   %eax,%eax
801005bc:	0f 88 d2 00 00 00    	js     80100694 <exec+0x3c0>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
801005c2:	8b 45 08             	mov    0x8(%ebp),%eax
801005c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
801005c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801005cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
801005ce:	eb 17                	jmp    801005e7 <exec+0x313>
    if(*s == '/')
801005d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801005d3:	0f b6 00             	movzbl (%eax),%eax
801005d6:	3c 2f                	cmp    $0x2f,%al
801005d8:	75 09                	jne    801005e3 <exec+0x30f>
      last = s+1;
801005da:	8b 45 f4             	mov    -0xc(%ebp),%eax
801005dd:	83 c0 01             	add    $0x1,%eax
801005e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
801005e3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801005e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801005ea:	0f b6 00             	movzbl (%eax),%eax
801005ed:	84 c0                	test   %al,%al
801005ef:	75 df                	jne    801005d0 <exec+0x2fc>
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));
801005f1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801005f7:	83 c0 6c             	add    $0x6c,%eax
801005fa:	83 ec 04             	sub    $0x4,%esp
801005fd:	6a 10                	push   $0x10
801005ff:	ff 75 f0             	pushl  -0x10(%ebp)
80100602:	50                   	push   %eax
80100603:	e8 6a 44 00 00       	call   80104a72 <safestrcpy>
80100608:	83 c4 10             	add    $0x10,%esp

  // Commit to the user image.
  oldpgdir = proc->pgdir;
8010060b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100611:	8b 40 04             	mov    0x4(%eax),%eax
80100614:	89 45 d0             	mov    %eax,-0x30(%ebp)
  proc->pgdir = pgdir;
80100617:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010061d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
80100620:	89 50 04             	mov    %edx,0x4(%eax)
  proc->sz = sz;
80100623:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100629:	8b 55 e0             	mov    -0x20(%ebp),%edx
8010062c:	89 10                	mov    %edx,(%eax)
  proc->tf->eip = elf.entry;  // main
8010062e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100634:	8b 40 18             	mov    0x18(%eax),%eax
80100637:	8b 95 24 ff ff ff    	mov    -0xdc(%ebp),%edx
8010063d:	89 50 38             	mov    %edx,0x38(%eax)
  proc->tf->esp = sp;
80100640:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100646:	8b 40 18             	mov    0x18(%eax),%eax
80100649:	8b 55 dc             	mov    -0x24(%ebp),%edx
8010064c:	89 50 44             	mov    %edx,0x44(%eax)
  switchuvm(proc);
8010064f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100655:	83 ec 0c             	sub    $0xc,%esp
80100658:	50                   	push   %eax
80100659:	e8 58 6e 00 00       	call   801074b6 <switchuvm>
8010065e:	83 c4 10             	add    $0x10,%esp
  freevm(oldpgdir);
80100661:	83 ec 0c             	sub    $0xc,%esp
80100664:	ff 75 d0             	pushl  -0x30(%ebp)
80100667:	e8 90 72 00 00       	call   801078fc <freevm>
8010066c:	83 c4 10             	add    $0x10,%esp
  return 0;
8010066f:	b8 00 00 00 00       	mov    $0x0,%eax
80100674:	eb 4c                	jmp    801006c2 <exec+0x3ee>
  ilock(ip);
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
    goto bad;
80100676:	90                   	nop
80100677:	eb 1c                	jmp    80100695 <exec+0x3c1>
  if(elf.magic != ELF_MAGIC)
    goto bad;
80100679:	90                   	nop
8010067a:	eb 19                	jmp    80100695 <exec+0x3c1>

  if((pgdir = setupkvm()) == 0)
    goto bad;
8010067c:	90                   	nop
8010067d:	eb 16                	jmp    80100695 <exec+0x3c1>

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto bad;
8010067f:	90                   	nop
80100680:	eb 13                	jmp    80100695 <exec+0x3c1>
    if(ph.type != ELF_PROG_LOAD)
      continue;
    if(ph.memsz < ph.filesz)
      goto bad;
80100682:	90                   	nop
80100683:	eb 10                	jmp    80100695 <exec+0x3c1>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
      goto bad;
80100685:	90                   	nop
80100686:	eb 0d                	jmp    80100695 <exec+0x3c1>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
80100688:	90                   	nop
80100689:	eb 0a                	jmp    80100695 <exec+0x3c1>

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
8010068b:	90                   	nop
8010068c:	eb 07                	jmp    80100695 <exec+0x3c1>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
8010068e:	90                   	nop
8010068f:	eb 04                	jmp    80100695 <exec+0x3c1>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
80100691:	90                   	nop
80100692:	eb 01                	jmp    80100695 <exec+0x3c1>
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;
80100694:	90                   	nop
  switchuvm(proc);
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
80100695:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
80100699:	74 0e                	je     801006a9 <exec+0x3d5>
    freevm(pgdir);
8010069b:	83 ec 0c             	sub    $0xc,%esp
8010069e:	ff 75 d4             	pushl  -0x2c(%ebp)
801006a1:	e8 56 72 00 00       	call   801078fc <freevm>
801006a6:	83 c4 10             	add    $0x10,%esp
  if(ip)
801006a9:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
801006ad:	74 0e                	je     801006bd <exec+0x3e9>
    iunlockput(ip);
801006af:	83 ec 0c             	sub    $0xc,%esp
801006b2:	ff 75 d8             	pushl  -0x28(%ebp)
801006b5:	e8 7a 0d 00 00       	call   80101434 <iunlockput>
801006ba:	83 c4 10             	add    $0x10,%esp
  return -1;
801006bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801006c2:	c9                   	leave  
801006c3:	c3                   	ret    

801006c4 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
801006c4:	55                   	push   %ebp
801006c5:	89 e5                	mov    %esp,%ebp
801006c7:	83 ec 08             	sub    $0x8,%esp
  initlock(&ftable.lock, "ftable");
801006ca:	83 ec 08             	sub    $0x8,%esp
801006cd:	68 5a 98 10 80       	push   $0x8010985a
801006d2:	68 c0 ee 10 80       	push   $0x8010eec0
801006d7:	e8 0e 3f 00 00       	call   801045ea <initlock>
801006dc:	83 c4 10             	add    $0x10,%esp
}
801006df:	90                   	nop
801006e0:	c9                   	leave  
801006e1:	c3                   	ret    

801006e2 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
801006e2:	55                   	push   %ebp
801006e3:	89 e5                	mov    %esp,%ebp
801006e5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;

  acquire(&ftable.lock);
801006e8:	83 ec 0c             	sub    $0xc,%esp
801006eb:	68 c0 ee 10 80       	push   $0x8010eec0
801006f0:	e8 17 3f 00 00       	call   8010460c <acquire>
801006f5:	83 c4 10             	add    $0x10,%esp
  for(f = ftable.file; f < ftable.file + NFILE; f++){
801006f8:	c7 45 f4 f4 ee 10 80 	movl   $0x8010eef4,-0xc(%ebp)
801006ff:	eb 2d                	jmp    8010072e <filealloc+0x4c>
    if(f->ref == 0){
80100701:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100704:	8b 40 04             	mov    0x4(%eax),%eax
80100707:	85 c0                	test   %eax,%eax
80100709:	75 1f                	jne    8010072a <filealloc+0x48>
      f->ref = 1;
8010070b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010070e:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
      release(&ftable.lock);
80100715:	83 ec 0c             	sub    $0xc,%esp
80100718:	68 c0 ee 10 80       	push   $0x8010eec0
8010071d:	e8 51 3f 00 00       	call   80104673 <release>
80100722:	83 c4 10             	add    $0x10,%esp
      return f;
80100725:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100728:	eb 23                	jmp    8010074d <filealloc+0x6b>
filealloc(void)
{
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
8010072a:	83 45 f4 18          	addl   $0x18,-0xc(%ebp)
8010072e:	b8 54 f8 10 80       	mov    $0x8010f854,%eax
80100733:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80100736:	72 c9                	jb     80100701 <filealloc+0x1f>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100738:	83 ec 0c             	sub    $0xc,%esp
8010073b:	68 c0 ee 10 80       	push   $0x8010eec0
80100740:	e8 2e 3f 00 00       	call   80104673 <release>
80100745:	83 c4 10             	add    $0x10,%esp
  return 0;
80100748:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010074d:	c9                   	leave  
8010074e:	c3                   	ret    

8010074f <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
8010074f:	55                   	push   %ebp
80100750:	89 e5                	mov    %esp,%ebp
80100752:	83 ec 08             	sub    $0x8,%esp
  acquire(&ftable.lock);
80100755:	83 ec 0c             	sub    $0xc,%esp
80100758:	68 c0 ee 10 80       	push   $0x8010eec0
8010075d:	e8 aa 3e 00 00       	call   8010460c <acquire>
80100762:	83 c4 10             	add    $0x10,%esp
  if(f->ref < 1)
80100765:	8b 45 08             	mov    0x8(%ebp),%eax
80100768:	8b 40 04             	mov    0x4(%eax),%eax
8010076b:	85 c0                	test   %eax,%eax
8010076d:	7f 0d                	jg     8010077c <filedup+0x2d>
    panic("filedup");
8010076f:	83 ec 0c             	sub    $0xc,%esp
80100772:	68 61 98 10 80       	push   $0x80109861
80100777:	e8 d3 7f 00 00       	call   8010874f <panic>
  f->ref++;
8010077c:	8b 45 08             	mov    0x8(%ebp),%eax
8010077f:	8b 40 04             	mov    0x4(%eax),%eax
80100782:	8d 50 01             	lea    0x1(%eax),%edx
80100785:	8b 45 08             	mov    0x8(%ebp),%eax
80100788:	89 50 04             	mov    %edx,0x4(%eax)
  release(&ftable.lock);
8010078b:	83 ec 0c             	sub    $0xc,%esp
8010078e:	68 c0 ee 10 80       	push   $0x8010eec0
80100793:	e8 db 3e 00 00       	call   80104673 <release>
80100798:	83 c4 10             	add    $0x10,%esp
  return f;
8010079b:	8b 45 08             	mov    0x8(%ebp),%eax
}
8010079e:	c9                   	leave  
8010079f:	c3                   	ret    

801007a0 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
801007a0:	55                   	push   %ebp
801007a1:	89 e5                	mov    %esp,%ebp
801007a3:	83 ec 28             	sub    $0x28,%esp
  struct file ff;

  acquire(&ftable.lock);
801007a6:	83 ec 0c             	sub    $0xc,%esp
801007a9:	68 c0 ee 10 80       	push   $0x8010eec0
801007ae:	e8 59 3e 00 00       	call   8010460c <acquire>
801007b3:	83 c4 10             	add    $0x10,%esp
  if(f->ref < 1)
801007b6:	8b 45 08             	mov    0x8(%ebp),%eax
801007b9:	8b 40 04             	mov    0x4(%eax),%eax
801007bc:	85 c0                	test   %eax,%eax
801007be:	7f 0d                	jg     801007cd <fileclose+0x2d>
    panic("fileclose");
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 69 98 10 80       	push   $0x80109869
801007c8:	e8 82 7f 00 00       	call   8010874f <panic>
  if(--f->ref > 0){
801007cd:	8b 45 08             	mov    0x8(%ebp),%eax
801007d0:	8b 40 04             	mov    0x4(%eax),%eax
801007d3:	8d 50 ff             	lea    -0x1(%eax),%edx
801007d6:	8b 45 08             	mov    0x8(%ebp),%eax
801007d9:	89 50 04             	mov    %edx,0x4(%eax)
801007dc:	8b 45 08             	mov    0x8(%ebp),%eax
801007df:	8b 40 04             	mov    0x4(%eax),%eax
801007e2:	85 c0                	test   %eax,%eax
801007e4:	7e 15                	jle    801007fb <fileclose+0x5b>
    release(&ftable.lock);
801007e6:	83 ec 0c             	sub    $0xc,%esp
801007e9:	68 c0 ee 10 80       	push   $0x8010eec0
801007ee:	e8 80 3e 00 00       	call   80104673 <release>
801007f3:	83 c4 10             	add    $0x10,%esp
801007f6:	e9 8b 00 00 00       	jmp    80100886 <fileclose+0xe6>
    return;
  }
  ff = *f;
801007fb:	8b 45 08             	mov    0x8(%ebp),%eax
801007fe:	8b 10                	mov    (%eax),%edx
80100800:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100803:	8b 50 04             	mov    0x4(%eax),%edx
80100806:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100809:	8b 50 08             	mov    0x8(%eax),%edx
8010080c:	89 55 e8             	mov    %edx,-0x18(%ebp)
8010080f:	8b 50 0c             	mov    0xc(%eax),%edx
80100812:	89 55 ec             	mov    %edx,-0x14(%ebp)
80100815:	8b 50 10             	mov    0x10(%eax),%edx
80100818:	89 55 f0             	mov    %edx,-0x10(%ebp)
8010081b:	8b 40 14             	mov    0x14(%eax),%eax
8010081e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  f->ref = 0;
80100821:	8b 45 08             	mov    0x8(%ebp),%eax
80100824:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  f->type = FD_NONE;
8010082b:	8b 45 08             	mov    0x8(%ebp),%eax
8010082e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  release(&ftable.lock);
80100834:	83 ec 0c             	sub    $0xc,%esp
80100837:	68 c0 ee 10 80       	push   $0x8010eec0
8010083c:	e8 32 3e 00 00       	call   80104673 <release>
80100841:	83 c4 10             	add    $0x10,%esp
  
  if(ff.type == FD_PIPE)
80100844:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100847:	83 f8 01             	cmp    $0x1,%eax
8010084a:	75 19                	jne    80100865 <fileclose+0xc5>
    pipeclose(ff.pipe, ff.writable);
8010084c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
80100850:	0f be d0             	movsbl %al,%edx
80100853:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100856:	83 ec 08             	sub    $0x8,%esp
80100859:	52                   	push   %edx
8010085a:	50                   	push   %eax
8010085b:	e8 80 2f 00 00       	call   801037e0 <pipeclose>
80100860:	83 c4 10             	add    $0x10,%esp
80100863:	eb 21                	jmp    80100886 <fileclose+0xe6>
  else if(ff.type == FD_INODE){
80100865:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100868:	83 f8 02             	cmp    $0x2,%eax
8010086b:	75 19                	jne    80100886 <fileclose+0xe6>
    begin_trans();
8010086d:	e8 62 24 00 00       	call   80102cd4 <begin_trans>
    iput(ff.ip);
80100872:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100875:	83 ec 0c             	sub    $0xc,%esp
80100878:	50                   	push   %eax
80100879:	e8 c6 0a 00 00       	call   80101344 <iput>
8010087e:	83 c4 10             	add    $0x10,%esp
    commit_trans();
80100881:	e8 a1 24 00 00       	call   80102d27 <commit_trans>
  }
}
80100886:	c9                   	leave  
80100887:	c3                   	ret    

80100888 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100888:	55                   	push   %ebp
80100889:	89 e5                	mov    %esp,%ebp
8010088b:	83 ec 08             	sub    $0x8,%esp
  if(f->type == FD_INODE){
8010088e:	8b 45 08             	mov    0x8(%ebp),%eax
80100891:	8b 00                	mov    (%eax),%eax
80100893:	83 f8 02             	cmp    $0x2,%eax
80100896:	75 40                	jne    801008d8 <filestat+0x50>
    ilock(f->ip);
80100898:	8b 45 08             	mov    0x8(%ebp),%eax
8010089b:	8b 40 10             	mov    0x10(%eax),%eax
8010089e:	83 ec 0c             	sub    $0xc,%esp
801008a1:	50                   	push   %eax
801008a2:	e8 d3 08 00 00       	call   8010117a <ilock>
801008a7:	83 c4 10             	add    $0x10,%esp
    stati(f->ip, st);
801008aa:	8b 45 08             	mov    0x8(%ebp),%eax
801008ad:	8b 40 10             	mov    0x10(%eax),%eax
801008b0:	83 ec 08             	sub    $0x8,%esp
801008b3:	ff 75 0c             	pushl  0xc(%ebp)
801008b6:	50                   	push   %eax
801008b7:	e8 e0 0d 00 00       	call   8010169c <stati>
801008bc:	83 c4 10             	add    $0x10,%esp
    iunlock(f->ip);
801008bf:	8b 45 08             	mov    0x8(%ebp),%eax
801008c2:	8b 40 10             	mov    0x10(%eax),%eax
801008c5:	83 ec 0c             	sub    $0xc,%esp
801008c8:	50                   	push   %eax
801008c9:	e8 04 0a 00 00       	call   801012d2 <iunlock>
801008ce:	83 c4 10             	add    $0x10,%esp
    return 0;
801008d1:	b8 00 00 00 00       	mov    $0x0,%eax
801008d6:	eb 05                	jmp    801008dd <filestat+0x55>
  }
  return -1;
801008d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801008dd:	c9                   	leave  
801008de:	c3                   	ret    

801008df <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
801008df:	55                   	push   %ebp
801008e0:	89 e5                	mov    %esp,%ebp
801008e2:	83 ec 18             	sub    $0x18,%esp
  int r;

  if(f->readable == 0)
801008e5:	8b 45 08             	mov    0x8(%ebp),%eax
801008e8:	0f b6 40 08          	movzbl 0x8(%eax),%eax
801008ec:	84 c0                	test   %al,%al
801008ee:	75 0a                	jne    801008fa <fileread+0x1b>
    return -1;
801008f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801008f5:	e9 9b 00 00 00       	jmp    80100995 <fileread+0xb6>
  if(f->type == FD_PIPE)
801008fa:	8b 45 08             	mov    0x8(%ebp),%eax
801008fd:	8b 00                	mov    (%eax),%eax
801008ff:	83 f8 01             	cmp    $0x1,%eax
80100902:	75 1a                	jne    8010091e <fileread+0x3f>
    return piperead(f->pipe, addr, n);
80100904:	8b 45 08             	mov    0x8(%ebp),%eax
80100907:	8b 40 0c             	mov    0xc(%eax),%eax
8010090a:	83 ec 04             	sub    $0x4,%esp
8010090d:	ff 75 10             	pushl  0x10(%ebp)
80100910:	ff 75 0c             	pushl  0xc(%ebp)
80100913:	50                   	push   %eax
80100914:	e8 6f 30 00 00       	call   80103988 <piperead>
80100919:	83 c4 10             	add    $0x10,%esp
8010091c:	eb 77                	jmp    80100995 <fileread+0xb6>
  if(f->type == FD_INODE){
8010091e:	8b 45 08             	mov    0x8(%ebp),%eax
80100921:	8b 00                	mov    (%eax),%eax
80100923:	83 f8 02             	cmp    $0x2,%eax
80100926:	75 60                	jne    80100988 <fileread+0xa9>
    ilock(f->ip);
80100928:	8b 45 08             	mov    0x8(%ebp),%eax
8010092b:	8b 40 10             	mov    0x10(%eax),%eax
8010092e:	83 ec 0c             	sub    $0xc,%esp
80100931:	50                   	push   %eax
80100932:	e8 43 08 00 00       	call   8010117a <ilock>
80100937:	83 c4 10             	add    $0x10,%esp
    if((r = readi(f->ip, addr, f->off, n)) > 0)
8010093a:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010093d:	8b 45 08             	mov    0x8(%ebp),%eax
80100940:	8b 50 14             	mov    0x14(%eax),%edx
80100943:	8b 45 08             	mov    0x8(%ebp),%eax
80100946:	8b 40 10             	mov    0x10(%eax),%eax
80100949:	51                   	push   %ecx
8010094a:	52                   	push   %edx
8010094b:	ff 75 0c             	pushl  0xc(%ebp)
8010094e:	50                   	push   %eax
8010094f:	e8 8e 0d 00 00       	call   801016e2 <readi>
80100954:	83 c4 10             	add    $0x10,%esp
80100957:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010095a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010095e:	7e 11                	jle    80100971 <fileread+0x92>
      f->off += r;
80100960:	8b 45 08             	mov    0x8(%ebp),%eax
80100963:	8b 50 14             	mov    0x14(%eax),%edx
80100966:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100969:	01 c2                	add    %eax,%edx
8010096b:	8b 45 08             	mov    0x8(%ebp),%eax
8010096e:	89 50 14             	mov    %edx,0x14(%eax)
    iunlock(f->ip);
80100971:	8b 45 08             	mov    0x8(%ebp),%eax
80100974:	8b 40 10             	mov    0x10(%eax),%eax
80100977:	83 ec 0c             	sub    $0xc,%esp
8010097a:	50                   	push   %eax
8010097b:	e8 52 09 00 00       	call   801012d2 <iunlock>
80100980:	83 c4 10             	add    $0x10,%esp
    return r;
80100983:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100986:	eb 0d                	jmp    80100995 <fileread+0xb6>
  }
  panic("fileread");
80100988:	83 ec 0c             	sub    $0xc,%esp
8010098b:	68 73 98 10 80       	push   $0x80109873
80100990:	e8 ba 7d 00 00       	call   8010874f <panic>
}
80100995:	c9                   	leave  
80100996:	c3                   	ret    

80100997 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100997:	55                   	push   %ebp
80100998:	89 e5                	mov    %esp,%ebp
8010099a:	53                   	push   %ebx
8010099b:	83 ec 14             	sub    $0x14,%esp
  int r;

  if(f->writable == 0)
8010099e:	8b 45 08             	mov    0x8(%ebp),%eax
801009a1:	0f b6 40 09          	movzbl 0x9(%eax),%eax
801009a5:	84 c0                	test   %al,%al
801009a7:	75 0a                	jne    801009b3 <filewrite+0x1c>
    return -1;
801009a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801009ae:	e9 1b 01 00 00       	jmp    80100ace <filewrite+0x137>
  if(f->type == FD_PIPE)
801009b3:	8b 45 08             	mov    0x8(%ebp),%eax
801009b6:	8b 00                	mov    (%eax),%eax
801009b8:	83 f8 01             	cmp    $0x1,%eax
801009bb:	75 1d                	jne    801009da <filewrite+0x43>
    return pipewrite(f->pipe, addr, n);
801009bd:	8b 45 08             	mov    0x8(%ebp),%eax
801009c0:	8b 40 0c             	mov    0xc(%eax),%eax
801009c3:	83 ec 04             	sub    $0x4,%esp
801009c6:	ff 75 10             	pushl  0x10(%ebp)
801009c9:	ff 75 0c             	pushl  0xc(%ebp)
801009cc:	50                   	push   %eax
801009cd:	e8 b8 2e 00 00       	call   8010388a <pipewrite>
801009d2:	83 c4 10             	add    $0x10,%esp
801009d5:	e9 f4 00 00 00       	jmp    80100ace <filewrite+0x137>
  if(f->type == FD_INODE){
801009da:	8b 45 08             	mov    0x8(%ebp),%eax
801009dd:	8b 00                	mov    (%eax),%eax
801009df:	83 f8 02             	cmp    $0x2,%eax
801009e2:	0f 85 d9 00 00 00    	jne    80100ac1 <filewrite+0x12a>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
801009e8:	c7 45 ec 00 06 00 00 	movl   $0x600,-0x14(%ebp)
    int i = 0;
801009ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while(i < n){
801009f6:	e9 a3 00 00 00       	jmp    80100a9e <filewrite+0x107>
      int n1 = n - i;
801009fb:	8b 45 10             	mov    0x10(%ebp),%eax
801009fe:	2b 45 f4             	sub    -0xc(%ebp),%eax
80100a01:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if(n1 > max)
80100a04:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100a07:	3b 45 ec             	cmp    -0x14(%ebp),%eax
80100a0a:	7e 06                	jle    80100a12 <filewrite+0x7b>
        n1 = max;
80100a0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100a0f:	89 45 f0             	mov    %eax,-0x10(%ebp)

      begin_trans();
80100a12:	e8 bd 22 00 00       	call   80102cd4 <begin_trans>
      ilock(f->ip);
80100a17:	8b 45 08             	mov    0x8(%ebp),%eax
80100a1a:	8b 40 10             	mov    0x10(%eax),%eax
80100a1d:	83 ec 0c             	sub    $0xc,%esp
80100a20:	50                   	push   %eax
80100a21:	e8 54 07 00 00       	call   8010117a <ilock>
80100a26:	83 c4 10             	add    $0x10,%esp
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80100a29:	8b 4d f0             	mov    -0x10(%ebp),%ecx
80100a2c:	8b 45 08             	mov    0x8(%ebp),%eax
80100a2f:	8b 50 14             	mov    0x14(%eax),%edx
80100a32:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100a35:	8b 45 0c             	mov    0xc(%ebp),%eax
80100a38:	01 c3                	add    %eax,%ebx
80100a3a:	8b 45 08             	mov    0x8(%ebp),%eax
80100a3d:	8b 40 10             	mov    0x10(%eax),%eax
80100a40:	51                   	push   %ecx
80100a41:	52                   	push   %edx
80100a42:	53                   	push   %ebx
80100a43:	50                   	push   %eax
80100a44:	e8 06 0e 00 00       	call   8010184f <writei>
80100a49:	83 c4 10             	add    $0x10,%esp
80100a4c:	89 45 e8             	mov    %eax,-0x18(%ebp)
80100a4f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80100a53:	7e 11                	jle    80100a66 <filewrite+0xcf>
        f->off += r;
80100a55:	8b 45 08             	mov    0x8(%ebp),%eax
80100a58:	8b 50 14             	mov    0x14(%eax),%edx
80100a5b:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100a5e:	01 c2                	add    %eax,%edx
80100a60:	8b 45 08             	mov    0x8(%ebp),%eax
80100a63:	89 50 14             	mov    %edx,0x14(%eax)
      iunlock(f->ip);
80100a66:	8b 45 08             	mov    0x8(%ebp),%eax
80100a69:	8b 40 10             	mov    0x10(%eax),%eax
80100a6c:	83 ec 0c             	sub    $0xc,%esp
80100a6f:	50                   	push   %eax
80100a70:	e8 5d 08 00 00       	call   801012d2 <iunlock>
80100a75:	83 c4 10             	add    $0x10,%esp
      commit_trans();
80100a78:	e8 aa 22 00 00       	call   80102d27 <commit_trans>

      if(r < 0)
80100a7d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80100a81:	78 29                	js     80100aac <filewrite+0x115>
        break;
      if(r != n1)
80100a83:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100a86:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80100a89:	74 0d                	je     80100a98 <filewrite+0x101>
        panic("short filewrite");
80100a8b:	83 ec 0c             	sub    $0xc,%esp
80100a8e:	68 7c 98 10 80       	push   $0x8010987c
80100a93:	e8 b7 7c 00 00       	call   8010874f <panic>
      i += r;
80100a98:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100a9b:	01 45 f4             	add    %eax,-0xc(%ebp)
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80100a9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100aa1:	3b 45 10             	cmp    0x10(%ebp),%eax
80100aa4:	0f 8c 51 ff ff ff    	jl     801009fb <filewrite+0x64>
80100aaa:	eb 01                	jmp    80100aad <filewrite+0x116>
        f->off += r;
      iunlock(f->ip);
      commit_trans();

      if(r < 0)
        break;
80100aac:	90                   	nop
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
80100aad:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100ab0:	3b 45 10             	cmp    0x10(%ebp),%eax
80100ab3:	75 05                	jne    80100aba <filewrite+0x123>
80100ab5:	8b 45 10             	mov    0x10(%ebp),%eax
80100ab8:	eb 14                	jmp    80100ace <filewrite+0x137>
80100aba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100abf:	eb 0d                	jmp    80100ace <filewrite+0x137>
  }
  panic("filewrite");
80100ac1:	83 ec 0c             	sub    $0xc,%esp
80100ac4:	68 8c 98 10 80       	push   $0x8010988c
80100ac9:	e8 81 7c 00 00       	call   8010874f <panic>
}
80100ace:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100ad1:	c9                   	leave  
80100ad2:	c3                   	ret    

80100ad3 <filecolorwrite>:

// Write to file f.
//called when system call colorwrite
int
filecolorwrite(struct file *f, char *addr, int n,int forec, int foreh, int backc, int backh)
{
80100ad3:	55                   	push   %ebp
80100ad4:	89 e5                	mov    %esp,%ebp
80100ad6:	53                   	push   %ebx
80100ad7:	83 ec 14             	sub    $0x14,%esp
  int r;

  if(f->writable == 0)
80100ada:	8b 45 08             	mov    0x8(%ebp),%eax
80100add:	0f b6 40 09          	movzbl 0x9(%eax),%eax
80100ae1:	84 c0                	test   %al,%al
80100ae3:	75 0a                	jne    80100aef <filecolorwrite+0x1c>
    return -1;
80100ae5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100aea:	e9 e4 00 00 00       	jmp    80100bd3 <filecolorwrite+0x100>
    //to console
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
80100aef:	c7 45 ec 00 06 00 00 	movl   $0x600,-0x14(%ebp)
    int i = 0;
80100af6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while(i < n){
80100afd:	e9 af 00 00 00       	jmp    80100bb1 <filecolorwrite+0xde>
      int n1 = n - i;
80100b02:	8b 45 10             	mov    0x10(%ebp),%eax
80100b05:	2b 45 f4             	sub    -0xc(%ebp),%eax
80100b08:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if(n1 > max)
80100b0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100b0e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
80100b11:	7e 06                	jle    80100b19 <filecolorwrite+0x46>
        n1 = max;
80100b13:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100b16:	89 45 f0             	mov    %eax,-0x10(%ebp)

      begin_trans();
80100b19:	e8 b6 21 00 00       	call   80102cd4 <begin_trans>
      ilock(f->ip);
80100b1e:	8b 45 08             	mov    0x8(%ebp),%eax
80100b21:	8b 40 10             	mov    0x10(%eax),%eax
80100b24:	83 ec 0c             	sub    $0xc,%esp
80100b27:	50                   	push   %eax
80100b28:	e8 4d 06 00 00       	call   8010117a <ilock>
80100b2d:	83 c4 10             	add    $0x10,%esp
      if ((r = writecolori(f->ip, addr + i, f->off, n1,forec,foreh,backc,backh)) > 0)
80100b30:	8b 4d f0             	mov    -0x10(%ebp),%ecx
80100b33:	8b 45 08             	mov    0x8(%ebp),%eax
80100b36:	8b 50 14             	mov    0x14(%eax),%edx
80100b39:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100b3c:	8b 45 0c             	mov    0xc(%ebp),%eax
80100b3f:	01 c3                	add    %eax,%ebx
80100b41:	8b 45 08             	mov    0x8(%ebp),%eax
80100b44:	8b 40 10             	mov    0x10(%eax),%eax
80100b47:	ff 75 20             	pushl  0x20(%ebp)
80100b4a:	ff 75 1c             	pushl  0x1c(%ebp)
80100b4d:	ff 75 18             	pushl  0x18(%ebp)
80100b50:	ff 75 14             	pushl  0x14(%ebp)
80100b53:	51                   	push   %ecx
80100b54:	52                   	push   %edx
80100b55:	53                   	push   %ebx
80100b56:	50                   	push   %eax
80100b57:	e8 91 0e 00 00       	call   801019ed <writecolori>
80100b5c:	83 c4 20             	add    $0x20,%esp
80100b5f:	89 45 e8             	mov    %eax,-0x18(%ebp)
80100b62:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80100b66:	7e 11                	jle    80100b79 <filecolorwrite+0xa6>
        f->off += r;
80100b68:	8b 45 08             	mov    0x8(%ebp),%eax
80100b6b:	8b 50 14             	mov    0x14(%eax),%edx
80100b6e:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100b71:	01 c2                	add    %eax,%edx
80100b73:	8b 45 08             	mov    0x8(%ebp),%eax
80100b76:	89 50 14             	mov    %edx,0x14(%eax)
      iunlock(f->ip);
80100b79:	8b 45 08             	mov    0x8(%ebp),%eax
80100b7c:	8b 40 10             	mov    0x10(%eax),%eax
80100b7f:	83 ec 0c             	sub    $0xc,%esp
80100b82:	50                   	push   %eax
80100b83:	e8 4a 07 00 00       	call   801012d2 <iunlock>
80100b88:	83 c4 10             	add    $0x10,%esp
      commit_trans();
80100b8b:	e8 97 21 00 00       	call   80102d27 <commit_trans>

      if(r < 0)
80100b90:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80100b94:	78 29                	js     80100bbf <filecolorwrite+0xec>
        break;
      if(r != n1)
80100b96:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100b99:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80100b9c:	74 0d                	je     80100bab <filecolorwrite+0xd8>
        panic("short filecolorwrite");
80100b9e:	83 ec 0c             	sub    $0xc,%esp
80100ba1:	68 96 98 10 80       	push   $0x80109896
80100ba6:	e8 a4 7b 00 00       	call   8010874f <panic>
      i += r;
80100bab:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100bae:	01 45 f4             	add    %eax,-0xc(%ebp)
  if(f->writable == 0)
    return -1;
    //to console
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80100bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100bb4:	3b 45 10             	cmp    0x10(%ebp),%eax
80100bb7:	0f 8c 45 ff ff ff    	jl     80100b02 <filecolorwrite+0x2f>
80100bbd:	eb 01                	jmp    80100bc0 <filecolorwrite+0xed>
        f->off += r;
      iunlock(f->ip);
      commit_trans();

      if(r < 0)
        break;
80100bbf:	90                   	nop
      if(r != n1)
        panic("short filecolorwrite");
      i += r;
    }
    return i == n ? n : -1;
80100bc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100bc3:	3b 45 10             	cmp    0x10(%ebp),%eax
80100bc6:	75 05                	jne    80100bcd <filecolorwrite+0xfa>
80100bc8:	8b 45 10             	mov    0x10(%ebp),%eax
80100bcb:	eb 05                	jmp    80100bd2 <filecolorwrite+0xff>
80100bcd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bd2:	90                   	nop
  
  panic("filecolorwrite");
}
80100bd3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100bd6:	c9                   	leave  
80100bd7:	c3                   	ret    

80100bd8 <readsb>:
static void itrunc(struct inode*);

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
80100bd8:	55                   	push   %ebp
80100bd9:	89 e5                	mov    %esp,%ebp
80100bdb:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  
  bp = bread(dev, 1);
80100bde:	8b 45 08             	mov    0x8(%ebp),%eax
80100be1:	83 ec 08             	sub    $0x8,%esp
80100be4:	6a 01                	push   $0x1
80100be6:	50                   	push   %eax
80100be7:	e8 ca f5 ff ff       	call   801001b6 <bread>
80100bec:	83 c4 10             	add    $0x10,%esp
80100bef:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memmove(sb, bp->data, sizeof(*sb));
80100bf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100bf5:	83 c0 18             	add    $0x18,%eax
80100bf8:	83 ec 04             	sub    $0x4,%esp
80100bfb:	6a 10                	push   $0x10
80100bfd:	50                   	push   %eax
80100bfe:	ff 75 0c             	pushl  0xc(%ebp)
80100c01:	e8 28 3d 00 00       	call   8010492e <memmove>
80100c06:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
80100c09:	83 ec 0c             	sub    $0xc,%esp
80100c0c:	ff 75 f4             	pushl  -0xc(%ebp)
80100c0f:	e8 1a f6 ff ff       	call   8010022e <brelse>
80100c14:	83 c4 10             	add    $0x10,%esp
}
80100c17:	90                   	nop
80100c18:	c9                   	leave  
80100c19:	c3                   	ret    

80100c1a <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
80100c1a:	55                   	push   %ebp
80100c1b:	89 e5                	mov    %esp,%ebp
80100c1d:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  
  bp = bread(dev, bno);
80100c20:	8b 55 0c             	mov    0xc(%ebp),%edx
80100c23:	8b 45 08             	mov    0x8(%ebp),%eax
80100c26:	83 ec 08             	sub    $0x8,%esp
80100c29:	52                   	push   %edx
80100c2a:	50                   	push   %eax
80100c2b:	e8 86 f5 ff ff       	call   801001b6 <bread>
80100c30:	83 c4 10             	add    $0x10,%esp
80100c33:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(bp->data, 0, BSIZE);
80100c36:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100c39:	83 c0 18             	add    $0x18,%eax
80100c3c:	83 ec 04             	sub    $0x4,%esp
80100c3f:	68 00 02 00 00       	push   $0x200
80100c44:	6a 00                	push   $0x0
80100c46:	50                   	push   %eax
80100c47:	e8 23 3c 00 00       	call   8010486f <memset>
80100c4c:	83 c4 10             	add    $0x10,%esp
  log_write(bp);
80100c4f:	83 ec 0c             	sub    $0xc,%esp
80100c52:	ff 75 f4             	pushl  -0xc(%ebp)
80100c55:	e8 32 21 00 00       	call   80102d8c <log_write>
80100c5a:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
80100c5d:	83 ec 0c             	sub    $0xc,%esp
80100c60:	ff 75 f4             	pushl  -0xc(%ebp)
80100c63:	e8 c6 f5 ff ff       	call   8010022e <brelse>
80100c68:	83 c4 10             	add    $0x10,%esp
}
80100c6b:	90                   	nop
80100c6c:	c9                   	leave  
80100c6d:	c3                   	ret    

80100c6e <balloc>:
// Blocks. 

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80100c6e:	55                   	push   %ebp
80100c6f:	89 e5                	mov    %esp,%ebp
80100c71:	83 ec 28             	sub    $0x28,%esp
  int b, bi, m;
  struct buf *bp;
  struct superblock sb;

  bp = 0;
80100c74:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  readsb(dev, &sb);
80100c7b:	8b 45 08             	mov    0x8(%ebp),%eax
80100c7e:	83 ec 08             	sub    $0x8,%esp
80100c81:	8d 55 d8             	lea    -0x28(%ebp),%edx
80100c84:	52                   	push   %edx
80100c85:	50                   	push   %eax
80100c86:	e8 4d ff ff ff       	call   80100bd8 <readsb>
80100c8b:	83 c4 10             	add    $0x10,%esp
  for(b = 0; b < sb.size; b += BPB){
80100c8e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80100c95:	e9 15 01 00 00       	jmp    80100daf <balloc+0x141>
    bp = bread(dev, BBLOCK(b, sb.ninodes));
80100c9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100c9d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
80100ca3:	85 c0                	test   %eax,%eax
80100ca5:	0f 48 c2             	cmovs  %edx,%eax
80100ca8:	c1 f8 0c             	sar    $0xc,%eax
80100cab:	89 c2                	mov    %eax,%edx
80100cad:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100cb0:	c1 e8 03             	shr    $0x3,%eax
80100cb3:	01 d0                	add    %edx,%eax
80100cb5:	83 c0 03             	add    $0x3,%eax
80100cb8:	83 ec 08             	sub    $0x8,%esp
80100cbb:	50                   	push   %eax
80100cbc:	ff 75 08             	pushl  0x8(%ebp)
80100cbf:	e8 f2 f4 ff ff       	call   801001b6 <bread>
80100cc4:	83 c4 10             	add    $0x10,%esp
80100cc7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80100cca:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
80100cd1:	e9 a6 00 00 00       	jmp    80100d7c <balloc+0x10e>
      m = 1 << (bi % 8);
80100cd6:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100cd9:	99                   	cltd   
80100cda:	c1 ea 1d             	shr    $0x1d,%edx
80100cdd:	01 d0                	add    %edx,%eax
80100cdf:	83 e0 07             	and    $0x7,%eax
80100ce2:	29 d0                	sub    %edx,%eax
80100ce4:	ba 01 00 00 00       	mov    $0x1,%edx
80100ce9:	89 c1                	mov    %eax,%ecx
80100ceb:	d3 e2                	shl    %cl,%edx
80100ced:	89 d0                	mov    %edx,%eax
80100cef:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80100cf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100cf5:	8d 50 07             	lea    0x7(%eax),%edx
80100cf8:	85 c0                	test   %eax,%eax
80100cfa:	0f 48 c2             	cmovs  %edx,%eax
80100cfd:	c1 f8 03             	sar    $0x3,%eax
80100d00:	89 c2                	mov    %eax,%edx
80100d02:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100d05:	0f b6 44 10 18       	movzbl 0x18(%eax,%edx,1),%eax
80100d0a:	0f b6 c0             	movzbl %al,%eax
80100d0d:	23 45 e8             	and    -0x18(%ebp),%eax
80100d10:	85 c0                	test   %eax,%eax
80100d12:	75 64                	jne    80100d78 <balloc+0x10a>
        bp->data[bi/8] |= m;  // Mark block in use.
80100d14:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100d17:	8d 50 07             	lea    0x7(%eax),%edx
80100d1a:	85 c0                	test   %eax,%eax
80100d1c:	0f 48 c2             	cmovs  %edx,%eax
80100d1f:	c1 f8 03             	sar    $0x3,%eax
80100d22:	8b 55 ec             	mov    -0x14(%ebp),%edx
80100d25:	0f b6 54 02 18       	movzbl 0x18(%edx,%eax,1),%edx
80100d2a:	89 d1                	mov    %edx,%ecx
80100d2c:	8b 55 e8             	mov    -0x18(%ebp),%edx
80100d2f:	09 ca                	or     %ecx,%edx
80100d31:	89 d1                	mov    %edx,%ecx
80100d33:	8b 55 ec             	mov    -0x14(%ebp),%edx
80100d36:	88 4c 02 18          	mov    %cl,0x18(%edx,%eax,1)
        log_write(bp);
80100d3a:	83 ec 0c             	sub    $0xc,%esp
80100d3d:	ff 75 ec             	pushl  -0x14(%ebp)
80100d40:	e8 47 20 00 00       	call   80102d8c <log_write>
80100d45:	83 c4 10             	add    $0x10,%esp
        brelse(bp);
80100d48:	83 ec 0c             	sub    $0xc,%esp
80100d4b:	ff 75 ec             	pushl  -0x14(%ebp)
80100d4e:	e8 db f4 ff ff       	call   8010022e <brelse>
80100d53:	83 c4 10             	add    $0x10,%esp
        bzero(dev, b + bi);
80100d56:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100d5c:	01 c2                	add    %eax,%edx
80100d5e:	8b 45 08             	mov    0x8(%ebp),%eax
80100d61:	83 ec 08             	sub    $0x8,%esp
80100d64:	52                   	push   %edx
80100d65:	50                   	push   %eax
80100d66:	e8 af fe ff ff       	call   80100c1a <bzero>
80100d6b:	83 c4 10             	add    $0x10,%esp
        return b + bi;
80100d6e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100d71:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100d74:	01 d0                	add    %edx,%eax
80100d76:	eb 52                	jmp    80100dca <balloc+0x15c>

  bp = 0;
  readsb(dev, &sb);
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb.ninodes));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80100d78:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
80100d7c:	81 7d f0 ff 0f 00 00 	cmpl   $0xfff,-0x10(%ebp)
80100d83:	7f 15                	jg     80100d9a <balloc+0x12c>
80100d85:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100d88:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100d8b:	01 d0                	add    %edx,%eax
80100d8d:	89 c2                	mov    %eax,%edx
80100d8f:	8b 45 d8             	mov    -0x28(%ebp),%eax
80100d92:	39 c2                	cmp    %eax,%edx
80100d94:	0f 82 3c ff ff ff    	jb     80100cd6 <balloc+0x68>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
80100d9a:	83 ec 0c             	sub    $0xc,%esp
80100d9d:	ff 75 ec             	pushl  -0x14(%ebp)
80100da0:	e8 89 f4 ff ff       	call   8010022e <brelse>
80100da5:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct superblock sb;

  bp = 0;
  readsb(dev, &sb);
  for(b = 0; b < sb.size; b += BPB){
80100da8:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
80100daf:	8b 55 d8             	mov    -0x28(%ebp),%edx
80100db2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100db5:	39 c2                	cmp    %eax,%edx
80100db7:	0f 87 dd fe ff ff    	ja     80100c9a <balloc+0x2c>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
80100dbd:	83 ec 0c             	sub    $0xc,%esp
80100dc0:	68 ab 98 10 80       	push   $0x801098ab
80100dc5:	e8 85 79 00 00       	call   8010874f <panic>
}
80100dca:	c9                   	leave  
80100dcb:	c3                   	ret    

80100dcc <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
80100dcc:	55                   	push   %ebp
80100dcd:	89 e5                	mov    %esp,%ebp
80100dcf:	83 ec 28             	sub    $0x28,%esp
  struct buf *bp;
  struct superblock sb;
  int bi, m;

  readsb(dev, &sb);
80100dd2:	83 ec 08             	sub    $0x8,%esp
80100dd5:	8d 45 dc             	lea    -0x24(%ebp),%eax
80100dd8:	50                   	push   %eax
80100dd9:	ff 75 08             	pushl  0x8(%ebp)
80100ddc:	e8 f7 fd ff ff       	call   80100bd8 <readsb>
80100de1:	83 c4 10             	add    $0x10,%esp
  bp = bread(dev, BBLOCK(b, sb.ninodes));
80100de4:	8b 45 0c             	mov    0xc(%ebp),%eax
80100de7:	c1 e8 0c             	shr    $0xc,%eax
80100dea:	89 c2                	mov    %eax,%edx
80100dec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100def:	c1 e8 03             	shr    $0x3,%eax
80100df2:	01 d0                	add    %edx,%eax
80100df4:	8d 50 03             	lea    0x3(%eax),%edx
80100df7:	8b 45 08             	mov    0x8(%ebp),%eax
80100dfa:	83 ec 08             	sub    $0x8,%esp
80100dfd:	52                   	push   %edx
80100dfe:	50                   	push   %eax
80100dff:	e8 b2 f3 ff ff       	call   801001b6 <bread>
80100e04:	83 c4 10             	add    $0x10,%esp
80100e07:	89 45 f4             	mov    %eax,-0xc(%ebp)
  bi = b % BPB;
80100e0a:	8b 45 0c             	mov    0xc(%ebp),%eax
80100e0d:	25 ff 0f 00 00       	and    $0xfff,%eax
80100e12:	89 45 f0             	mov    %eax,-0x10(%ebp)
  m = 1 << (bi % 8);
80100e15:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100e18:	99                   	cltd   
80100e19:	c1 ea 1d             	shr    $0x1d,%edx
80100e1c:	01 d0                	add    %edx,%eax
80100e1e:	83 e0 07             	and    $0x7,%eax
80100e21:	29 d0                	sub    %edx,%eax
80100e23:	ba 01 00 00 00       	mov    $0x1,%edx
80100e28:	89 c1                	mov    %eax,%ecx
80100e2a:	d3 e2                	shl    %cl,%edx
80100e2c:	89 d0                	mov    %edx,%eax
80100e2e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((bp->data[bi/8] & m) == 0)
80100e31:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100e34:	8d 50 07             	lea    0x7(%eax),%edx
80100e37:	85 c0                	test   %eax,%eax
80100e39:	0f 48 c2             	cmovs  %edx,%eax
80100e3c:	c1 f8 03             	sar    $0x3,%eax
80100e3f:	89 c2                	mov    %eax,%edx
80100e41:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100e44:	0f b6 44 10 18       	movzbl 0x18(%eax,%edx,1),%eax
80100e49:	0f b6 c0             	movzbl %al,%eax
80100e4c:	23 45 ec             	and    -0x14(%ebp),%eax
80100e4f:	85 c0                	test   %eax,%eax
80100e51:	75 0d                	jne    80100e60 <bfree+0x94>
    panic("freeing free block");
80100e53:	83 ec 0c             	sub    $0xc,%esp
80100e56:	68 c1 98 10 80       	push   $0x801098c1
80100e5b:	e8 ef 78 00 00       	call   8010874f <panic>
  bp->data[bi/8] &= ~m;
80100e60:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100e63:	8d 50 07             	lea    0x7(%eax),%edx
80100e66:	85 c0                	test   %eax,%eax
80100e68:	0f 48 c2             	cmovs  %edx,%eax
80100e6b:	c1 f8 03             	sar    $0x3,%eax
80100e6e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100e71:	0f b6 54 02 18       	movzbl 0x18(%edx,%eax,1),%edx
80100e76:	89 d1                	mov    %edx,%ecx
80100e78:	8b 55 ec             	mov    -0x14(%ebp),%edx
80100e7b:	f7 d2                	not    %edx
80100e7d:	21 ca                	and    %ecx,%edx
80100e7f:	89 d1                	mov    %edx,%ecx
80100e81:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100e84:	88 4c 02 18          	mov    %cl,0x18(%edx,%eax,1)
  log_write(bp);
80100e88:	83 ec 0c             	sub    $0xc,%esp
80100e8b:	ff 75 f4             	pushl  -0xc(%ebp)
80100e8e:	e8 f9 1e 00 00       	call   80102d8c <log_write>
80100e93:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
80100e96:	83 ec 0c             	sub    $0xc,%esp
80100e99:	ff 75 f4             	pushl  -0xc(%ebp)
80100e9c:	e8 8d f3 ff ff       	call   8010022e <brelse>
80100ea1:	83 c4 10             	add    $0x10,%esp
}
80100ea4:	90                   	nop
80100ea5:	c9                   	leave  
80100ea6:	c3                   	ret    

80100ea7 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(void)
{
80100ea7:	55                   	push   %ebp
80100ea8:	89 e5                	mov    %esp,%ebp
80100eaa:	83 ec 08             	sub    $0x8,%esp
  initlock(&icache.lock, "icache");
80100ead:	83 ec 08             	sub    $0x8,%esp
80100eb0:	68 d4 98 10 80       	push   $0x801098d4
80100eb5:	68 e0 f8 10 80       	push   $0x8010f8e0
80100eba:	e8 2b 37 00 00       	call   801045ea <initlock>
80100ebf:	83 c4 10             	add    $0x10,%esp
}
80100ec2:	90                   	nop
80100ec3:	c9                   	leave  
80100ec4:	c3                   	ret    

80100ec5 <ialloc>:
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80100ec5:	55                   	push   %ebp
80100ec6:	89 e5                	mov    %esp,%ebp
80100ec8:	83 ec 38             	sub    $0x38,%esp
80100ecb:	8b 45 0c             	mov    0xc(%ebp),%eax
80100ece:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;
  struct superblock sb;

  readsb(dev, &sb);
80100ed2:	8b 45 08             	mov    0x8(%ebp),%eax
80100ed5:	83 ec 08             	sub    $0x8,%esp
80100ed8:	8d 55 dc             	lea    -0x24(%ebp),%edx
80100edb:	52                   	push   %edx
80100edc:	50                   	push   %eax
80100edd:	e8 f6 fc ff ff       	call   80100bd8 <readsb>
80100ee2:	83 c4 10             	add    $0x10,%esp

  for(inum = 1; inum < sb.ninodes; inum++){
80100ee5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
80100eec:	e9 98 00 00 00       	jmp    80100f89 <ialloc+0xc4>
    bp = bread(dev, IBLOCK(inum));
80100ef1:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100ef4:	c1 e8 03             	shr    $0x3,%eax
80100ef7:	83 c0 02             	add    $0x2,%eax
80100efa:	83 ec 08             	sub    $0x8,%esp
80100efd:	50                   	push   %eax
80100efe:	ff 75 08             	pushl  0x8(%ebp)
80100f01:	e8 b0 f2 ff ff       	call   801001b6 <bread>
80100f06:	83 c4 10             	add    $0x10,%esp
80100f09:	89 45 f0             	mov    %eax,-0x10(%ebp)
    dip = (struct dinode*)bp->data + inum%IPB;
80100f0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100f0f:	8d 50 18             	lea    0x18(%eax),%edx
80100f12:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f15:	83 e0 07             	and    $0x7,%eax
80100f18:	c1 e0 06             	shl    $0x6,%eax
80100f1b:	01 d0                	add    %edx,%eax
80100f1d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(dip->type == 0){  // a free inode
80100f20:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100f23:	0f b7 00             	movzwl (%eax),%eax
80100f26:	66 85 c0             	test   %ax,%ax
80100f29:	75 4c                	jne    80100f77 <ialloc+0xb2>
      memset(dip, 0, sizeof(*dip));
80100f2b:	83 ec 04             	sub    $0x4,%esp
80100f2e:	6a 40                	push   $0x40
80100f30:	6a 00                	push   $0x0
80100f32:	ff 75 ec             	pushl  -0x14(%ebp)
80100f35:	e8 35 39 00 00       	call   8010486f <memset>
80100f3a:	83 c4 10             	add    $0x10,%esp
      dip->type = type;
80100f3d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100f40:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
80100f44:	66 89 10             	mov    %dx,(%eax)
      log_write(bp);   // mark it allocated on the disk
80100f47:	83 ec 0c             	sub    $0xc,%esp
80100f4a:	ff 75 f0             	pushl  -0x10(%ebp)
80100f4d:	e8 3a 1e 00 00       	call   80102d8c <log_write>
80100f52:	83 c4 10             	add    $0x10,%esp
      brelse(bp);
80100f55:	83 ec 0c             	sub    $0xc,%esp
80100f58:	ff 75 f0             	pushl  -0x10(%ebp)
80100f5b:	e8 ce f2 ff ff       	call   8010022e <brelse>
80100f60:	83 c4 10             	add    $0x10,%esp
      return iget(dev, inum);
80100f63:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f66:	83 ec 08             	sub    $0x8,%esp
80100f69:	50                   	push   %eax
80100f6a:	ff 75 08             	pushl  0x8(%ebp)
80100f6d:	e8 ef 00 00 00       	call   80101061 <iget>
80100f72:	83 c4 10             	add    $0x10,%esp
80100f75:	eb 2d                	jmp    80100fa4 <ialloc+0xdf>
    }
    brelse(bp);
80100f77:	83 ec 0c             	sub    $0xc,%esp
80100f7a:	ff 75 f0             	pushl  -0x10(%ebp)
80100f7d:	e8 ac f2 ff ff       	call   8010022e <brelse>
80100f82:	83 c4 10             	add    $0x10,%esp
  struct dinode *dip;
  struct superblock sb;

  readsb(dev, &sb);

  for(inum = 1; inum < sb.ninodes; inum++){
80100f85:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80100f89:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100f8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f8f:	39 c2                	cmp    %eax,%edx
80100f91:	0f 87 5a ff ff ff    	ja     80100ef1 <ialloc+0x2c>
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
80100f97:	83 ec 0c             	sub    $0xc,%esp
80100f9a:	68 db 98 10 80       	push   $0x801098db
80100f9f:	e8 ab 77 00 00       	call   8010874f <panic>
}
80100fa4:	c9                   	leave  
80100fa5:	c3                   	ret    

80100fa6 <iupdate>:

// Copy a modified in-memory inode to disk.
void
iupdate(struct inode *ip)
{
80100fa6:	55                   	push   %ebp
80100fa7:	89 e5                	mov    %esp,%ebp
80100fa9:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum));
80100fac:	8b 45 08             	mov    0x8(%ebp),%eax
80100faf:	8b 40 04             	mov    0x4(%eax),%eax
80100fb2:	c1 e8 03             	shr    $0x3,%eax
80100fb5:	8d 50 02             	lea    0x2(%eax),%edx
80100fb8:	8b 45 08             	mov    0x8(%ebp),%eax
80100fbb:	8b 00                	mov    (%eax),%eax
80100fbd:	83 ec 08             	sub    $0x8,%esp
80100fc0:	52                   	push   %edx
80100fc1:	50                   	push   %eax
80100fc2:	e8 ef f1 ff ff       	call   801001b6 <bread>
80100fc7:	83 c4 10             	add    $0x10,%esp
80100fca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80100fcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100fd0:	8d 50 18             	lea    0x18(%eax),%edx
80100fd3:	8b 45 08             	mov    0x8(%ebp),%eax
80100fd6:	8b 40 04             	mov    0x4(%eax),%eax
80100fd9:	83 e0 07             	and    $0x7,%eax
80100fdc:	c1 e0 06             	shl    $0x6,%eax
80100fdf:	01 d0                	add    %edx,%eax
80100fe1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  dip->type = ip->type;
80100fe4:	8b 45 08             	mov    0x8(%ebp),%eax
80100fe7:	0f b7 50 10          	movzwl 0x10(%eax),%edx
80100feb:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100fee:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
80100ff1:	8b 45 08             	mov    0x8(%ebp),%eax
80100ff4:	0f b7 50 12          	movzwl 0x12(%eax),%edx
80100ff8:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100ffb:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
80100fff:	8b 45 08             	mov    0x8(%ebp),%eax
80101002:	0f b7 50 14          	movzwl 0x14(%eax),%edx
80101006:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101009:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
8010100d:	8b 45 08             	mov    0x8(%ebp),%eax
80101010:	0f b7 50 16          	movzwl 0x16(%eax),%edx
80101014:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101017:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
8010101b:	8b 45 08             	mov    0x8(%ebp),%eax
8010101e:	8b 50 18             	mov    0x18(%eax),%edx
80101021:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101024:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101027:	8b 45 08             	mov    0x8(%ebp),%eax
8010102a:	8d 50 1c             	lea    0x1c(%eax),%edx
8010102d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101030:	83 c0 0c             	add    $0xc,%eax
80101033:	83 ec 04             	sub    $0x4,%esp
80101036:	6a 34                	push   $0x34
80101038:	52                   	push   %edx
80101039:	50                   	push   %eax
8010103a:	e8 ef 38 00 00       	call   8010492e <memmove>
8010103f:	83 c4 10             	add    $0x10,%esp
  log_write(bp);
80101042:	83 ec 0c             	sub    $0xc,%esp
80101045:	ff 75 f4             	pushl  -0xc(%ebp)
80101048:	e8 3f 1d 00 00       	call   80102d8c <log_write>
8010104d:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
80101050:	83 ec 0c             	sub    $0xc,%esp
80101053:	ff 75 f4             	pushl  -0xc(%ebp)
80101056:	e8 d3 f1 ff ff       	call   8010022e <brelse>
8010105b:	83 c4 10             	add    $0x10,%esp
}
8010105e:	90                   	nop
8010105f:	c9                   	leave  
80101060:	c3                   	ret    

80101061 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101061:	55                   	push   %ebp
80101062:	89 e5                	mov    %esp,%ebp
80101064:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101067:	83 ec 0c             	sub    $0xc,%esp
8010106a:	68 e0 f8 10 80       	push   $0x8010f8e0
8010106f:	e8 98 35 00 00       	call   8010460c <acquire>
80101074:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
80101077:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010107e:	c7 45 f4 14 f9 10 80 	movl   $0x8010f914,-0xc(%ebp)
80101085:	eb 5d                	jmp    801010e4 <iget+0x83>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101087:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010108a:	8b 40 08             	mov    0x8(%eax),%eax
8010108d:	85 c0                	test   %eax,%eax
8010108f:	7e 39                	jle    801010ca <iget+0x69>
80101091:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101094:	8b 00                	mov    (%eax),%eax
80101096:	3b 45 08             	cmp    0x8(%ebp),%eax
80101099:	75 2f                	jne    801010ca <iget+0x69>
8010109b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010109e:	8b 40 04             	mov    0x4(%eax),%eax
801010a1:	3b 45 0c             	cmp    0xc(%ebp),%eax
801010a4:	75 24                	jne    801010ca <iget+0x69>
      ip->ref++;
801010a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801010a9:	8b 40 08             	mov    0x8(%eax),%eax
801010ac:	8d 50 01             	lea    0x1(%eax),%edx
801010af:	8b 45 f4             	mov    -0xc(%ebp),%eax
801010b2:	89 50 08             	mov    %edx,0x8(%eax)
      release(&icache.lock);
801010b5:	83 ec 0c             	sub    $0xc,%esp
801010b8:	68 e0 f8 10 80       	push   $0x8010f8e0
801010bd:	e8 b1 35 00 00       	call   80104673 <release>
801010c2:	83 c4 10             	add    $0x10,%esp
      return ip;
801010c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801010c8:	eb 74                	jmp    8010113e <iget+0xdd>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801010ca:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801010ce:	75 10                	jne    801010e0 <iget+0x7f>
801010d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801010d3:	8b 40 08             	mov    0x8(%eax),%eax
801010d6:	85 c0                	test   %eax,%eax
801010d8:	75 06                	jne    801010e0 <iget+0x7f>
      empty = ip;
801010da:	8b 45 f4             	mov    -0xc(%ebp),%eax
801010dd:	89 45 f0             	mov    %eax,-0x10(%ebp)

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801010e0:	83 45 f4 50          	addl   $0x50,-0xc(%ebp)
801010e4:	81 7d f4 b4 08 11 80 	cmpl   $0x801108b4,-0xc(%ebp)
801010eb:	72 9a                	jb     80101087 <iget+0x26>
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801010ed:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801010f1:	75 0d                	jne    80101100 <iget+0x9f>
    panic("iget: no inodes");
801010f3:	83 ec 0c             	sub    $0xc,%esp
801010f6:	68 ed 98 10 80       	push   $0x801098ed
801010fb:	e8 4f 76 00 00       	call   8010874f <panic>

  ip = empty;
80101100:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101103:	89 45 f4             	mov    %eax,-0xc(%ebp)
  ip->dev = dev;
80101106:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101109:	8b 55 08             	mov    0x8(%ebp),%edx
8010110c:	89 10                	mov    %edx,(%eax)
  ip->inum = inum;
8010110e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101111:	8b 55 0c             	mov    0xc(%ebp),%edx
80101114:	89 50 04             	mov    %edx,0x4(%eax)
  ip->ref = 1;
80101117:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010111a:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  ip->flags = 0;
80101121:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101124:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  release(&icache.lock);
8010112b:	83 ec 0c             	sub    $0xc,%esp
8010112e:	68 e0 f8 10 80       	push   $0x8010f8e0
80101133:	e8 3b 35 00 00       	call   80104673 <release>
80101138:	83 c4 10             	add    $0x10,%esp

  return ip;
8010113b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
8010113e:	c9                   	leave  
8010113f:	c3                   	ret    

80101140 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101140:	55                   	push   %ebp
80101141:	89 e5                	mov    %esp,%ebp
80101143:	83 ec 08             	sub    $0x8,%esp
  acquire(&icache.lock);
80101146:	83 ec 0c             	sub    $0xc,%esp
80101149:	68 e0 f8 10 80       	push   $0x8010f8e0
8010114e:	e8 b9 34 00 00       	call   8010460c <acquire>
80101153:	83 c4 10             	add    $0x10,%esp
  ip->ref++;
80101156:	8b 45 08             	mov    0x8(%ebp),%eax
80101159:	8b 40 08             	mov    0x8(%eax),%eax
8010115c:	8d 50 01             	lea    0x1(%eax),%edx
8010115f:	8b 45 08             	mov    0x8(%ebp),%eax
80101162:	89 50 08             	mov    %edx,0x8(%eax)
  release(&icache.lock);
80101165:	83 ec 0c             	sub    $0xc,%esp
80101168:	68 e0 f8 10 80       	push   $0x8010f8e0
8010116d:	e8 01 35 00 00       	call   80104673 <release>
80101172:	83 c4 10             	add    $0x10,%esp
  return ip;
80101175:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101178:	c9                   	leave  
80101179:	c3                   	ret    

8010117a <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
8010117a:	55                   	push   %ebp
8010117b:	89 e5                	mov    %esp,%ebp
8010117d:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101180:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80101184:	74 0a                	je     80101190 <ilock+0x16>
80101186:	8b 45 08             	mov    0x8(%ebp),%eax
80101189:	8b 40 08             	mov    0x8(%eax),%eax
8010118c:	85 c0                	test   %eax,%eax
8010118e:	7f 0d                	jg     8010119d <ilock+0x23>
    panic("ilock");
80101190:	83 ec 0c             	sub    $0xc,%esp
80101193:	68 fd 98 10 80       	push   $0x801098fd
80101198:	e8 b2 75 00 00       	call   8010874f <panic>

  acquire(&icache.lock);
8010119d:	83 ec 0c             	sub    $0xc,%esp
801011a0:	68 e0 f8 10 80       	push   $0x8010f8e0
801011a5:	e8 62 34 00 00       	call   8010460c <acquire>
801011aa:	83 c4 10             	add    $0x10,%esp
  while(ip->flags & I_BUSY)
801011ad:	eb 13                	jmp    801011c2 <ilock+0x48>
    sleep(ip, &icache.lock);
801011af:	83 ec 08             	sub    $0x8,%esp
801011b2:	68 e0 f8 10 80       	push   $0x8010f8e0
801011b7:	ff 75 08             	pushl  0x8(%ebp)
801011ba:	e8 54 31 00 00       	call   80104313 <sleep>
801011bf:	83 c4 10             	add    $0x10,%esp

  if(ip == 0 || ip->ref < 1)
    panic("ilock");

  acquire(&icache.lock);
  while(ip->flags & I_BUSY)
801011c2:	8b 45 08             	mov    0x8(%ebp),%eax
801011c5:	8b 40 0c             	mov    0xc(%eax),%eax
801011c8:	83 e0 01             	and    $0x1,%eax
801011cb:	85 c0                	test   %eax,%eax
801011cd:	75 e0                	jne    801011af <ilock+0x35>
    sleep(ip, &icache.lock);
  ip->flags |= I_BUSY;
801011cf:	8b 45 08             	mov    0x8(%ebp),%eax
801011d2:	8b 40 0c             	mov    0xc(%eax),%eax
801011d5:	83 c8 01             	or     $0x1,%eax
801011d8:	89 c2                	mov    %eax,%edx
801011da:	8b 45 08             	mov    0x8(%ebp),%eax
801011dd:	89 50 0c             	mov    %edx,0xc(%eax)
  release(&icache.lock);
801011e0:	83 ec 0c             	sub    $0xc,%esp
801011e3:	68 e0 f8 10 80       	push   $0x8010f8e0
801011e8:	e8 86 34 00 00       	call   80104673 <release>
801011ed:	83 c4 10             	add    $0x10,%esp

  if(!(ip->flags & I_VALID)){
801011f0:	8b 45 08             	mov    0x8(%ebp),%eax
801011f3:	8b 40 0c             	mov    0xc(%eax),%eax
801011f6:	83 e0 02             	and    $0x2,%eax
801011f9:	85 c0                	test   %eax,%eax
801011fb:	0f 85 ce 00 00 00    	jne    801012cf <ilock+0x155>
    bp = bread(ip->dev, IBLOCK(ip->inum));
80101201:	8b 45 08             	mov    0x8(%ebp),%eax
80101204:	8b 40 04             	mov    0x4(%eax),%eax
80101207:	c1 e8 03             	shr    $0x3,%eax
8010120a:	8d 50 02             	lea    0x2(%eax),%edx
8010120d:	8b 45 08             	mov    0x8(%ebp),%eax
80101210:	8b 00                	mov    (%eax),%eax
80101212:	83 ec 08             	sub    $0x8,%esp
80101215:	52                   	push   %edx
80101216:	50                   	push   %eax
80101217:	e8 9a ef ff ff       	call   801001b6 <bread>
8010121c:	83 c4 10             	add    $0x10,%esp
8010121f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101222:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101225:	8d 50 18             	lea    0x18(%eax),%edx
80101228:	8b 45 08             	mov    0x8(%ebp),%eax
8010122b:	8b 40 04             	mov    0x4(%eax),%eax
8010122e:	83 e0 07             	and    $0x7,%eax
80101231:	c1 e0 06             	shl    $0x6,%eax
80101234:	01 d0                	add    %edx,%eax
80101236:	89 45 f0             	mov    %eax,-0x10(%ebp)
    ip->type = dip->type;
80101239:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010123c:	0f b7 10             	movzwl (%eax),%edx
8010123f:	8b 45 08             	mov    0x8(%ebp),%eax
80101242:	66 89 50 10          	mov    %dx,0x10(%eax)
    ip->major = dip->major;
80101246:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101249:	0f b7 50 02          	movzwl 0x2(%eax),%edx
8010124d:	8b 45 08             	mov    0x8(%ebp),%eax
80101250:	66 89 50 12          	mov    %dx,0x12(%eax)
    ip->minor = dip->minor;
80101254:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101257:	0f b7 50 04          	movzwl 0x4(%eax),%edx
8010125b:	8b 45 08             	mov    0x8(%ebp),%eax
8010125e:	66 89 50 14          	mov    %dx,0x14(%eax)
    ip->nlink = dip->nlink;
80101262:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101265:	0f b7 50 06          	movzwl 0x6(%eax),%edx
80101269:	8b 45 08             	mov    0x8(%ebp),%eax
8010126c:	66 89 50 16          	mov    %dx,0x16(%eax)
    ip->size = dip->size;
80101270:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101273:	8b 50 08             	mov    0x8(%eax),%edx
80101276:	8b 45 08             	mov    0x8(%ebp),%eax
80101279:	89 50 18             	mov    %edx,0x18(%eax)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010127c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010127f:	8d 50 0c             	lea    0xc(%eax),%edx
80101282:	8b 45 08             	mov    0x8(%ebp),%eax
80101285:	83 c0 1c             	add    $0x1c,%eax
80101288:	83 ec 04             	sub    $0x4,%esp
8010128b:	6a 34                	push   $0x34
8010128d:	52                   	push   %edx
8010128e:	50                   	push   %eax
8010128f:	e8 9a 36 00 00       	call   8010492e <memmove>
80101294:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
80101297:	83 ec 0c             	sub    $0xc,%esp
8010129a:	ff 75 f4             	pushl  -0xc(%ebp)
8010129d:	e8 8c ef ff ff       	call   8010022e <brelse>
801012a2:	83 c4 10             	add    $0x10,%esp
    ip->flags |= I_VALID;
801012a5:	8b 45 08             	mov    0x8(%ebp),%eax
801012a8:	8b 40 0c             	mov    0xc(%eax),%eax
801012ab:	83 c8 02             	or     $0x2,%eax
801012ae:	89 c2                	mov    %eax,%edx
801012b0:	8b 45 08             	mov    0x8(%ebp),%eax
801012b3:	89 50 0c             	mov    %edx,0xc(%eax)
    if(ip->type == 0)
801012b6:	8b 45 08             	mov    0x8(%ebp),%eax
801012b9:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801012bd:	66 85 c0             	test   %ax,%ax
801012c0:	75 0d                	jne    801012cf <ilock+0x155>
      panic("ilock: no type");
801012c2:	83 ec 0c             	sub    $0xc,%esp
801012c5:	68 03 99 10 80       	push   $0x80109903
801012ca:	e8 80 74 00 00       	call   8010874f <panic>
  }
}
801012cf:	90                   	nop
801012d0:	c9                   	leave  
801012d1:	c3                   	ret    

801012d2 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
801012d2:	55                   	push   %ebp
801012d3:	89 e5                	mov    %esp,%ebp
801012d5:	83 ec 08             	sub    $0x8,%esp
  if(ip == 0 || !(ip->flags & I_BUSY) || ip->ref < 1)
801012d8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801012dc:	74 17                	je     801012f5 <iunlock+0x23>
801012de:	8b 45 08             	mov    0x8(%ebp),%eax
801012e1:	8b 40 0c             	mov    0xc(%eax),%eax
801012e4:	83 e0 01             	and    $0x1,%eax
801012e7:	85 c0                	test   %eax,%eax
801012e9:	74 0a                	je     801012f5 <iunlock+0x23>
801012eb:	8b 45 08             	mov    0x8(%ebp),%eax
801012ee:	8b 40 08             	mov    0x8(%eax),%eax
801012f1:	85 c0                	test   %eax,%eax
801012f3:	7f 0d                	jg     80101302 <iunlock+0x30>
    panic("iunlock");
801012f5:	83 ec 0c             	sub    $0xc,%esp
801012f8:	68 12 99 10 80       	push   $0x80109912
801012fd:	e8 4d 74 00 00       	call   8010874f <panic>

  acquire(&icache.lock);
80101302:	83 ec 0c             	sub    $0xc,%esp
80101305:	68 e0 f8 10 80       	push   $0x8010f8e0
8010130a:	e8 fd 32 00 00       	call   8010460c <acquire>
8010130f:	83 c4 10             	add    $0x10,%esp
  ip->flags &= ~I_BUSY;
80101312:	8b 45 08             	mov    0x8(%ebp),%eax
80101315:	8b 40 0c             	mov    0xc(%eax),%eax
80101318:	83 e0 fe             	and    $0xfffffffe,%eax
8010131b:	89 c2                	mov    %eax,%edx
8010131d:	8b 45 08             	mov    0x8(%ebp),%eax
80101320:	89 50 0c             	mov    %edx,0xc(%eax)
  wakeup(ip);
80101323:	83 ec 0c             	sub    $0xc,%esp
80101326:	ff 75 08             	pushl  0x8(%ebp)
80101329:	e8 d0 30 00 00       	call   801043fe <wakeup>
8010132e:	83 c4 10             	add    $0x10,%esp
  release(&icache.lock);
80101331:	83 ec 0c             	sub    $0xc,%esp
80101334:	68 e0 f8 10 80       	push   $0x8010f8e0
80101339:	e8 35 33 00 00       	call   80104673 <release>
8010133e:	83 c4 10             	add    $0x10,%esp
}
80101341:	90                   	nop
80101342:	c9                   	leave  
80101343:	c3                   	ret    

80101344 <iput>:
// be recycled.
// If that was the last reference and the inode has no links
// to it, free the inode (and its content) on disk.
void
iput(struct inode *ip)
{
80101344:	55                   	push   %ebp
80101345:	89 e5                	mov    %esp,%ebp
80101347:	83 ec 08             	sub    $0x8,%esp
  acquire(&icache.lock);
8010134a:	83 ec 0c             	sub    $0xc,%esp
8010134d:	68 e0 f8 10 80       	push   $0x8010f8e0
80101352:	e8 b5 32 00 00       	call   8010460c <acquire>
80101357:	83 c4 10             	add    $0x10,%esp
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
8010135a:	8b 45 08             	mov    0x8(%ebp),%eax
8010135d:	8b 40 08             	mov    0x8(%eax),%eax
80101360:	83 f8 01             	cmp    $0x1,%eax
80101363:	0f 85 a9 00 00 00    	jne    80101412 <iput+0xce>
80101369:	8b 45 08             	mov    0x8(%ebp),%eax
8010136c:	8b 40 0c             	mov    0xc(%eax),%eax
8010136f:	83 e0 02             	and    $0x2,%eax
80101372:	85 c0                	test   %eax,%eax
80101374:	0f 84 98 00 00 00    	je     80101412 <iput+0xce>
8010137a:	8b 45 08             	mov    0x8(%ebp),%eax
8010137d:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80101381:	66 85 c0             	test   %ax,%ax
80101384:	0f 85 88 00 00 00    	jne    80101412 <iput+0xce>
    // inode has no links: truncate and free inode.
    if(ip->flags & I_BUSY)
8010138a:	8b 45 08             	mov    0x8(%ebp),%eax
8010138d:	8b 40 0c             	mov    0xc(%eax),%eax
80101390:	83 e0 01             	and    $0x1,%eax
80101393:	85 c0                	test   %eax,%eax
80101395:	74 0d                	je     801013a4 <iput+0x60>
      panic("iput busy");
80101397:	83 ec 0c             	sub    $0xc,%esp
8010139a:	68 1a 99 10 80       	push   $0x8010991a
8010139f:	e8 ab 73 00 00       	call   8010874f <panic>
    ip->flags |= I_BUSY;
801013a4:	8b 45 08             	mov    0x8(%ebp),%eax
801013a7:	8b 40 0c             	mov    0xc(%eax),%eax
801013aa:	83 c8 01             	or     $0x1,%eax
801013ad:	89 c2                	mov    %eax,%edx
801013af:	8b 45 08             	mov    0x8(%ebp),%eax
801013b2:	89 50 0c             	mov    %edx,0xc(%eax)
    release(&icache.lock);
801013b5:	83 ec 0c             	sub    $0xc,%esp
801013b8:	68 e0 f8 10 80       	push   $0x8010f8e0
801013bd:	e8 b1 32 00 00       	call   80104673 <release>
801013c2:	83 c4 10             	add    $0x10,%esp
    itrunc(ip);
801013c5:	83 ec 0c             	sub    $0xc,%esp
801013c8:	ff 75 08             	pushl  0x8(%ebp)
801013cb:	e8 a8 01 00 00       	call   80101578 <itrunc>
801013d0:	83 c4 10             	add    $0x10,%esp
    ip->type = 0;
801013d3:	8b 45 08             	mov    0x8(%ebp),%eax
801013d6:	66 c7 40 10 00 00    	movw   $0x0,0x10(%eax)
    iupdate(ip);
801013dc:	83 ec 0c             	sub    $0xc,%esp
801013df:	ff 75 08             	pushl  0x8(%ebp)
801013e2:	e8 bf fb ff ff       	call   80100fa6 <iupdate>
801013e7:	83 c4 10             	add    $0x10,%esp
    acquire(&icache.lock);
801013ea:	83 ec 0c             	sub    $0xc,%esp
801013ed:	68 e0 f8 10 80       	push   $0x8010f8e0
801013f2:	e8 15 32 00 00       	call   8010460c <acquire>
801013f7:	83 c4 10             	add    $0x10,%esp
    ip->flags = 0;
801013fa:	8b 45 08             	mov    0x8(%ebp),%eax
801013fd:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    wakeup(ip);
80101404:	83 ec 0c             	sub    $0xc,%esp
80101407:	ff 75 08             	pushl  0x8(%ebp)
8010140a:	e8 ef 2f 00 00       	call   801043fe <wakeup>
8010140f:	83 c4 10             	add    $0x10,%esp
  }
  ip->ref--;
80101412:	8b 45 08             	mov    0x8(%ebp),%eax
80101415:	8b 40 08             	mov    0x8(%eax),%eax
80101418:	8d 50 ff             	lea    -0x1(%eax),%edx
8010141b:	8b 45 08             	mov    0x8(%ebp),%eax
8010141e:	89 50 08             	mov    %edx,0x8(%eax)
  release(&icache.lock);
80101421:	83 ec 0c             	sub    $0xc,%esp
80101424:	68 e0 f8 10 80       	push   $0x8010f8e0
80101429:	e8 45 32 00 00       	call   80104673 <release>
8010142e:	83 c4 10             	add    $0x10,%esp
}
80101431:	90                   	nop
80101432:	c9                   	leave  
80101433:	c3                   	ret    

80101434 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101434:	55                   	push   %ebp
80101435:	89 e5                	mov    %esp,%ebp
80101437:	83 ec 08             	sub    $0x8,%esp
  iunlock(ip);
8010143a:	83 ec 0c             	sub    $0xc,%esp
8010143d:	ff 75 08             	pushl  0x8(%ebp)
80101440:	e8 8d fe ff ff       	call   801012d2 <iunlock>
80101445:	83 c4 10             	add    $0x10,%esp
  iput(ip);
80101448:	83 ec 0c             	sub    $0xc,%esp
8010144b:	ff 75 08             	pushl  0x8(%ebp)
8010144e:	e8 f1 fe ff ff       	call   80101344 <iput>
80101453:	83 c4 10             	add    $0x10,%esp
}
80101456:	90                   	nop
80101457:	c9                   	leave  
80101458:	c3                   	ret    

80101459 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101459:	55                   	push   %ebp
8010145a:	89 e5                	mov    %esp,%ebp
8010145c:	53                   	push   %ebx
8010145d:	83 ec 14             	sub    $0x14,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
80101460:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
80101464:	77 42                	ja     801014a8 <bmap+0x4f>
    if((addr = ip->addrs[bn]) == 0)
80101466:	8b 45 08             	mov    0x8(%ebp),%eax
80101469:	8b 55 0c             	mov    0xc(%ebp),%edx
8010146c:	83 c2 04             	add    $0x4,%edx
8010146f:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
80101473:	89 45 f4             	mov    %eax,-0xc(%ebp)
80101476:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010147a:	75 24                	jne    801014a0 <bmap+0x47>
      ip->addrs[bn] = addr = balloc(ip->dev);
8010147c:	8b 45 08             	mov    0x8(%ebp),%eax
8010147f:	8b 00                	mov    (%eax),%eax
80101481:	83 ec 0c             	sub    $0xc,%esp
80101484:	50                   	push   %eax
80101485:	e8 e4 f7 ff ff       	call   80100c6e <balloc>
8010148a:	83 c4 10             	add    $0x10,%esp
8010148d:	89 45 f4             	mov    %eax,-0xc(%ebp)
80101490:	8b 45 08             	mov    0x8(%ebp),%eax
80101493:	8b 55 0c             	mov    0xc(%ebp),%edx
80101496:	8d 4a 04             	lea    0x4(%edx),%ecx
80101499:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010149c:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    return addr;
801014a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801014a3:	e9 cb 00 00 00       	jmp    80101573 <bmap+0x11a>
  }
  bn -= NDIRECT;
801014a8:	83 6d 0c 0c          	subl   $0xc,0xc(%ebp)

  if(bn < NINDIRECT){
801014ac:	83 7d 0c 7f          	cmpl   $0x7f,0xc(%ebp)
801014b0:	0f 87 b0 00 00 00    	ja     80101566 <bmap+0x10d>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
801014b6:	8b 45 08             	mov    0x8(%ebp),%eax
801014b9:	8b 40 4c             	mov    0x4c(%eax),%eax
801014bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
801014bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801014c3:	75 1d                	jne    801014e2 <bmap+0x89>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801014c5:	8b 45 08             	mov    0x8(%ebp),%eax
801014c8:	8b 00                	mov    (%eax),%eax
801014ca:	83 ec 0c             	sub    $0xc,%esp
801014cd:	50                   	push   %eax
801014ce:	e8 9b f7 ff ff       	call   80100c6e <balloc>
801014d3:	83 c4 10             	add    $0x10,%esp
801014d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
801014d9:	8b 45 08             	mov    0x8(%ebp),%eax
801014dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
801014df:	89 50 4c             	mov    %edx,0x4c(%eax)
    bp = bread(ip->dev, addr);
801014e2:	8b 45 08             	mov    0x8(%ebp),%eax
801014e5:	8b 00                	mov    (%eax),%eax
801014e7:	83 ec 08             	sub    $0x8,%esp
801014ea:	ff 75 f4             	pushl  -0xc(%ebp)
801014ed:	50                   	push   %eax
801014ee:	e8 c3 ec ff ff       	call   801001b6 <bread>
801014f3:	83 c4 10             	add    $0x10,%esp
801014f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    a = (uint*)bp->data;
801014f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
801014fc:	83 c0 18             	add    $0x18,%eax
801014ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((addr = a[bn]) == 0){
80101502:	8b 45 0c             	mov    0xc(%ebp),%eax
80101505:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
8010150c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010150f:	01 d0                	add    %edx,%eax
80101511:	8b 00                	mov    (%eax),%eax
80101513:	89 45 f4             	mov    %eax,-0xc(%ebp)
80101516:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010151a:	75 37                	jne    80101553 <bmap+0xfa>
      a[bn] = addr = balloc(ip->dev);
8010151c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010151f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
80101526:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101529:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
8010152c:	8b 45 08             	mov    0x8(%ebp),%eax
8010152f:	8b 00                	mov    (%eax),%eax
80101531:	83 ec 0c             	sub    $0xc,%esp
80101534:	50                   	push   %eax
80101535:	e8 34 f7 ff ff       	call   80100c6e <balloc>
8010153a:	83 c4 10             	add    $0x10,%esp
8010153d:	89 45 f4             	mov    %eax,-0xc(%ebp)
80101540:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101543:	89 03                	mov    %eax,(%ebx)
      log_write(bp);
80101545:	83 ec 0c             	sub    $0xc,%esp
80101548:	ff 75 f0             	pushl  -0x10(%ebp)
8010154b:	e8 3c 18 00 00       	call   80102d8c <log_write>
80101550:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
80101553:	83 ec 0c             	sub    $0xc,%esp
80101556:	ff 75 f0             	pushl  -0x10(%ebp)
80101559:	e8 d0 ec ff ff       	call   8010022e <brelse>
8010155e:	83 c4 10             	add    $0x10,%esp
    return addr;
80101561:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101564:	eb 0d                	jmp    80101573 <bmap+0x11a>
  }

  panic("bmap: out of range");
80101566:	83 ec 0c             	sub    $0xc,%esp
80101569:	68 24 99 10 80       	push   $0x80109924
8010156e:	e8 dc 71 00 00       	call   8010874f <panic>
}
80101573:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101576:	c9                   	leave  
80101577:	c3                   	ret    

80101578 <itrunc>:
// to it (no directory entries referring to it)
// and has no in-memory reference to it (is
// not an open file or current directory).
static void
itrunc(struct inode *ip)
{
80101578:	55                   	push   %ebp
80101579:	89 e5                	mov    %esp,%ebp
8010157b:	83 ec 18             	sub    $0x18,%esp
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
8010157e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80101585:	eb 45                	jmp    801015cc <itrunc+0x54>
    if(ip->addrs[i]){
80101587:	8b 45 08             	mov    0x8(%ebp),%eax
8010158a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010158d:	83 c2 04             	add    $0x4,%edx
80101590:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
80101594:	85 c0                	test   %eax,%eax
80101596:	74 30                	je     801015c8 <itrunc+0x50>
      bfree(ip->dev, ip->addrs[i]);
80101598:	8b 45 08             	mov    0x8(%ebp),%eax
8010159b:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010159e:	83 c2 04             	add    $0x4,%edx
801015a1:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
801015a5:	8b 55 08             	mov    0x8(%ebp),%edx
801015a8:	8b 12                	mov    (%edx),%edx
801015aa:	83 ec 08             	sub    $0x8,%esp
801015ad:	50                   	push   %eax
801015ae:	52                   	push   %edx
801015af:	e8 18 f8 ff ff       	call   80100dcc <bfree>
801015b4:	83 c4 10             	add    $0x10,%esp
      ip->addrs[i] = 0;
801015b7:	8b 45 08             	mov    0x8(%ebp),%eax
801015ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
801015bd:	83 c2 04             	add    $0x4,%edx
801015c0:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
801015c7:	00 
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
801015c8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801015cc:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
801015d0:	7e b5                	jle    80101587 <itrunc+0xf>
      bfree(ip->dev, ip->addrs[i]);
      ip->addrs[i] = 0;
    }
  }
  
  if(ip->addrs[NDIRECT]){
801015d2:	8b 45 08             	mov    0x8(%ebp),%eax
801015d5:	8b 40 4c             	mov    0x4c(%eax),%eax
801015d8:	85 c0                	test   %eax,%eax
801015da:	0f 84 a1 00 00 00    	je     80101681 <itrunc+0x109>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801015e0:	8b 45 08             	mov    0x8(%ebp),%eax
801015e3:	8b 50 4c             	mov    0x4c(%eax),%edx
801015e6:	8b 45 08             	mov    0x8(%ebp),%eax
801015e9:	8b 00                	mov    (%eax),%eax
801015eb:	83 ec 08             	sub    $0x8,%esp
801015ee:	52                   	push   %edx
801015ef:	50                   	push   %eax
801015f0:	e8 c1 eb ff ff       	call   801001b6 <bread>
801015f5:	83 c4 10             	add    $0x10,%esp
801015f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    a = (uint*)bp->data;
801015fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801015fe:	83 c0 18             	add    $0x18,%eax
80101601:	89 45 e8             	mov    %eax,-0x18(%ebp)
    for(j = 0; j < NINDIRECT; j++){
80101604:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
8010160b:	eb 3c                	jmp    80101649 <itrunc+0xd1>
      if(a[j])
8010160d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101610:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
80101617:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010161a:	01 d0                	add    %edx,%eax
8010161c:	8b 00                	mov    (%eax),%eax
8010161e:	85 c0                	test   %eax,%eax
80101620:	74 23                	je     80101645 <itrunc+0xcd>
        bfree(ip->dev, a[j]);
80101622:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101625:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
8010162c:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010162f:	01 d0                	add    %edx,%eax
80101631:	8b 00                	mov    (%eax),%eax
80101633:	8b 55 08             	mov    0x8(%ebp),%edx
80101636:	8b 12                	mov    (%edx),%edx
80101638:	83 ec 08             	sub    $0x8,%esp
8010163b:	50                   	push   %eax
8010163c:	52                   	push   %edx
8010163d:	e8 8a f7 ff ff       	call   80100dcc <bfree>
80101642:	83 c4 10             	add    $0x10,%esp
  }
  
  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    a = (uint*)bp->data;
    for(j = 0; j < NINDIRECT; j++){
80101645:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
80101649:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010164c:	83 f8 7f             	cmp    $0x7f,%eax
8010164f:	76 bc                	jbe    8010160d <itrunc+0x95>
      if(a[j])
        bfree(ip->dev, a[j]);
    }
    brelse(bp);
80101651:	83 ec 0c             	sub    $0xc,%esp
80101654:	ff 75 ec             	pushl  -0x14(%ebp)
80101657:	e8 d2 eb ff ff       	call   8010022e <brelse>
8010165c:	83 c4 10             	add    $0x10,%esp
    bfree(ip->dev, ip->addrs[NDIRECT]);
8010165f:	8b 45 08             	mov    0x8(%ebp),%eax
80101662:	8b 40 4c             	mov    0x4c(%eax),%eax
80101665:	8b 55 08             	mov    0x8(%ebp),%edx
80101668:	8b 12                	mov    (%edx),%edx
8010166a:	83 ec 08             	sub    $0x8,%esp
8010166d:	50                   	push   %eax
8010166e:	52                   	push   %edx
8010166f:	e8 58 f7 ff ff       	call   80100dcc <bfree>
80101674:	83 c4 10             	add    $0x10,%esp
    ip->addrs[NDIRECT] = 0;
80101677:	8b 45 08             	mov    0x8(%ebp),%eax
8010167a:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
  }

  ip->size = 0;
80101681:	8b 45 08             	mov    0x8(%ebp),%eax
80101684:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  iupdate(ip);
8010168b:	83 ec 0c             	sub    $0xc,%esp
8010168e:	ff 75 08             	pushl  0x8(%ebp)
80101691:	e8 10 f9 ff ff       	call   80100fa6 <iupdate>
80101696:	83 c4 10             	add    $0x10,%esp
}
80101699:	90                   	nop
8010169a:	c9                   	leave  
8010169b:	c3                   	ret    

8010169c <stati>:

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
8010169c:	55                   	push   %ebp
8010169d:	89 e5                	mov    %esp,%ebp
  st->dev = ip->dev;
8010169f:	8b 45 08             	mov    0x8(%ebp),%eax
801016a2:	8b 00                	mov    (%eax),%eax
801016a4:	89 c2                	mov    %eax,%edx
801016a6:	8b 45 0c             	mov    0xc(%ebp),%eax
801016a9:	89 50 04             	mov    %edx,0x4(%eax)
  st->ino = ip->inum;
801016ac:	8b 45 08             	mov    0x8(%ebp),%eax
801016af:	8b 50 04             	mov    0x4(%eax),%edx
801016b2:	8b 45 0c             	mov    0xc(%ebp),%eax
801016b5:	89 50 08             	mov    %edx,0x8(%eax)
  st->type = ip->type;
801016b8:	8b 45 08             	mov    0x8(%ebp),%eax
801016bb:	0f b7 50 10          	movzwl 0x10(%eax),%edx
801016bf:	8b 45 0c             	mov    0xc(%ebp),%eax
801016c2:	66 89 10             	mov    %dx,(%eax)
  st->nlink = ip->nlink;
801016c5:	8b 45 08             	mov    0x8(%ebp),%eax
801016c8:	0f b7 50 16          	movzwl 0x16(%eax),%edx
801016cc:	8b 45 0c             	mov    0xc(%ebp),%eax
801016cf:	66 89 50 0c          	mov    %dx,0xc(%eax)
  st->size = ip->size;
801016d3:	8b 45 08             	mov    0x8(%ebp),%eax
801016d6:	8b 50 18             	mov    0x18(%eax),%edx
801016d9:	8b 45 0c             	mov    0xc(%ebp),%eax
801016dc:	89 50 10             	mov    %edx,0x10(%eax)
}
801016df:	90                   	nop
801016e0:	5d                   	pop    %ebp
801016e1:	c3                   	ret    

801016e2 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
801016e2:	55                   	push   %ebp
801016e3:	89 e5                	mov    %esp,%ebp
801016e5:	83 ec 18             	sub    $0x18,%esp
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
801016e8:	8b 45 08             	mov    0x8(%ebp),%eax
801016eb:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801016ef:	66 83 f8 03          	cmp    $0x3,%ax
801016f3:	75 72                	jne    80101767 <readi+0x85>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
801016f5:	8b 45 08             	mov    0x8(%ebp),%eax
801016f8:	0f b7 40 12          	movzwl 0x12(%eax),%eax
801016fc:	66 85 c0             	test   %ax,%ax
801016ff:	78 2b                	js     8010172c <readi+0x4a>
80101701:	8b 45 08             	mov    0x8(%ebp),%eax
80101704:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101708:	66 83 f8 09          	cmp    $0x9,%ax
8010170c:	7f 1e                	jg     8010172c <readi+0x4a>
8010170e:	8b 45 08             	mov    0x8(%ebp),%eax
80101711:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101715:	0f bf d0             	movswl %ax,%edx
80101718:	89 d0                	mov    %edx,%eax
8010171a:	01 c0                	add    %eax,%eax
8010171c:	01 d0                	add    %edx,%eax
8010171e:	c1 e0 02             	shl    $0x2,%eax
80101721:	05 60 f8 10 80       	add    $0x8010f860,%eax
80101726:	8b 00                	mov    (%eax),%eax
80101728:	85 c0                	test   %eax,%eax
8010172a:	75 0a                	jne    80101736 <readi+0x54>
      return -1;
8010172c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101731:	e9 17 01 00 00       	jmp    8010184d <readi+0x16b>
    return devsw[ip->major].read(ip, dst, n);
80101736:	8b 45 08             	mov    0x8(%ebp),%eax
80101739:	0f b7 40 12          	movzwl 0x12(%eax),%eax
8010173d:	0f bf d0             	movswl %ax,%edx
80101740:	89 d0                	mov    %edx,%eax
80101742:	01 c0                	add    %eax,%eax
80101744:	01 d0                	add    %edx,%eax
80101746:	c1 e0 02             	shl    $0x2,%eax
80101749:	05 60 f8 10 80       	add    $0x8010f860,%eax
8010174e:	8b 00                	mov    (%eax),%eax
80101750:	8b 55 14             	mov    0x14(%ebp),%edx
80101753:	83 ec 04             	sub    $0x4,%esp
80101756:	52                   	push   %edx
80101757:	ff 75 0c             	pushl  0xc(%ebp)
8010175a:	ff 75 08             	pushl  0x8(%ebp)
8010175d:	ff d0                	call   *%eax
8010175f:	83 c4 10             	add    $0x10,%esp
80101762:	e9 e6 00 00 00       	jmp    8010184d <readi+0x16b>
  }

  if(off > ip->size || off + n < off)
80101767:	8b 45 08             	mov    0x8(%ebp),%eax
8010176a:	8b 40 18             	mov    0x18(%eax),%eax
8010176d:	3b 45 10             	cmp    0x10(%ebp),%eax
80101770:	72 0d                	jb     8010177f <readi+0x9d>
80101772:	8b 55 10             	mov    0x10(%ebp),%edx
80101775:	8b 45 14             	mov    0x14(%ebp),%eax
80101778:	01 d0                	add    %edx,%eax
8010177a:	3b 45 10             	cmp    0x10(%ebp),%eax
8010177d:	73 0a                	jae    80101789 <readi+0xa7>
    return -1;
8010177f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101784:	e9 c4 00 00 00       	jmp    8010184d <readi+0x16b>
  if(off + n > ip->size)
80101789:	8b 55 10             	mov    0x10(%ebp),%edx
8010178c:	8b 45 14             	mov    0x14(%ebp),%eax
8010178f:	01 c2                	add    %eax,%edx
80101791:	8b 45 08             	mov    0x8(%ebp),%eax
80101794:	8b 40 18             	mov    0x18(%eax),%eax
80101797:	39 c2                	cmp    %eax,%edx
80101799:	76 0c                	jbe    801017a7 <readi+0xc5>
    n = ip->size - off;
8010179b:	8b 45 08             	mov    0x8(%ebp),%eax
8010179e:	8b 40 18             	mov    0x18(%eax),%eax
801017a1:	2b 45 10             	sub    0x10(%ebp),%eax
801017a4:	89 45 14             	mov    %eax,0x14(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801017a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801017ae:	e9 8b 00 00 00       	jmp    8010183e <readi+0x15c>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801017b3:	8b 45 10             	mov    0x10(%ebp),%eax
801017b6:	c1 e8 09             	shr    $0x9,%eax
801017b9:	83 ec 08             	sub    $0x8,%esp
801017bc:	50                   	push   %eax
801017bd:	ff 75 08             	pushl  0x8(%ebp)
801017c0:	e8 94 fc ff ff       	call   80101459 <bmap>
801017c5:	83 c4 10             	add    $0x10,%esp
801017c8:	89 c2                	mov    %eax,%edx
801017ca:	8b 45 08             	mov    0x8(%ebp),%eax
801017cd:	8b 00                	mov    (%eax),%eax
801017cf:	83 ec 08             	sub    $0x8,%esp
801017d2:	52                   	push   %edx
801017d3:	50                   	push   %eax
801017d4:	e8 dd e9 ff ff       	call   801001b6 <bread>
801017d9:	83 c4 10             	add    $0x10,%esp
801017dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
801017df:	8b 45 10             	mov    0x10(%ebp),%eax
801017e2:	25 ff 01 00 00       	and    $0x1ff,%eax
801017e7:	ba 00 02 00 00       	mov    $0x200,%edx
801017ec:	29 c2                	sub    %eax,%edx
801017ee:	8b 45 14             	mov    0x14(%ebp),%eax
801017f1:	2b 45 f4             	sub    -0xc(%ebp),%eax
801017f4:	39 c2                	cmp    %eax,%edx
801017f6:	0f 46 c2             	cmovbe %edx,%eax
801017f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(dst, bp->data + off%BSIZE, m);
801017fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017ff:	8d 50 18             	lea    0x18(%eax),%edx
80101802:	8b 45 10             	mov    0x10(%ebp),%eax
80101805:	25 ff 01 00 00       	and    $0x1ff,%eax
8010180a:	01 d0                	add    %edx,%eax
8010180c:	83 ec 04             	sub    $0x4,%esp
8010180f:	ff 75 ec             	pushl  -0x14(%ebp)
80101812:	50                   	push   %eax
80101813:	ff 75 0c             	pushl  0xc(%ebp)
80101816:	e8 13 31 00 00       	call   8010492e <memmove>
8010181b:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
8010181e:	83 ec 0c             	sub    $0xc,%esp
80101821:	ff 75 f0             	pushl  -0x10(%ebp)
80101824:	e8 05 ea ff ff       	call   8010022e <brelse>
80101829:	83 c4 10             	add    $0x10,%esp
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010182c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010182f:	01 45 f4             	add    %eax,-0xc(%ebp)
80101832:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101835:	01 45 10             	add    %eax,0x10(%ebp)
80101838:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010183b:	01 45 0c             	add    %eax,0xc(%ebp)
8010183e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101841:	3b 45 14             	cmp    0x14(%ebp),%eax
80101844:	0f 82 69 ff ff ff    	jb     801017b3 <readi+0xd1>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
8010184a:	8b 45 14             	mov    0x14(%ebp),%eax
}
8010184d:	c9                   	leave  
8010184e:	c3                   	ret    

8010184f <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
8010184f:	55                   	push   %ebp
80101850:	89 e5                	mov    %esp,%ebp
80101852:	83 ec 18             	sub    $0x18,%esp
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101855:	8b 45 08             	mov    0x8(%ebp),%eax
80101858:	0f b7 40 10          	movzwl 0x10(%eax),%eax
8010185c:	66 83 f8 03          	cmp    $0x3,%ax
80101860:	75 72                	jne    801018d4 <writei+0x85>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101862:	8b 45 08             	mov    0x8(%ebp),%eax
80101865:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101869:	66 85 c0             	test   %ax,%ax
8010186c:	78 2b                	js     80101899 <writei+0x4a>
8010186e:	8b 45 08             	mov    0x8(%ebp),%eax
80101871:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101875:	66 83 f8 09          	cmp    $0x9,%ax
80101879:	7f 1e                	jg     80101899 <writei+0x4a>
8010187b:	8b 45 08             	mov    0x8(%ebp),%eax
8010187e:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101882:	0f bf d0             	movswl %ax,%edx
80101885:	89 d0                	mov    %edx,%eax
80101887:	01 c0                	add    %eax,%eax
80101889:	01 d0                	add    %edx,%eax
8010188b:	c1 e0 02             	shl    $0x2,%eax
8010188e:	05 64 f8 10 80       	add    $0x8010f864,%eax
80101893:	8b 00                	mov    (%eax),%eax
80101895:	85 c0                	test   %eax,%eax
80101897:	75 0a                	jne    801018a3 <writei+0x54>
      return -1;
80101899:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010189e:	e9 48 01 00 00       	jmp    801019eb <writei+0x19c>
    return devsw[ip->major].write(ip, src, n);
801018a3:	8b 45 08             	mov    0x8(%ebp),%eax
801018a6:	0f b7 40 12          	movzwl 0x12(%eax),%eax
801018aa:	0f bf d0             	movswl %ax,%edx
801018ad:	89 d0                	mov    %edx,%eax
801018af:	01 c0                	add    %eax,%eax
801018b1:	01 d0                	add    %edx,%eax
801018b3:	c1 e0 02             	shl    $0x2,%eax
801018b6:	05 64 f8 10 80       	add    $0x8010f864,%eax
801018bb:	8b 00                	mov    (%eax),%eax
801018bd:	8b 55 14             	mov    0x14(%ebp),%edx
801018c0:	83 ec 04             	sub    $0x4,%esp
801018c3:	52                   	push   %edx
801018c4:	ff 75 0c             	pushl  0xc(%ebp)
801018c7:	ff 75 08             	pushl  0x8(%ebp)
801018ca:	ff d0                	call   *%eax
801018cc:	83 c4 10             	add    $0x10,%esp
801018cf:	e9 17 01 00 00       	jmp    801019eb <writei+0x19c>
  }

  if(off > ip->size || off + n < off)
801018d4:	8b 45 08             	mov    0x8(%ebp),%eax
801018d7:	8b 40 18             	mov    0x18(%eax),%eax
801018da:	3b 45 10             	cmp    0x10(%ebp),%eax
801018dd:	72 0d                	jb     801018ec <writei+0x9d>
801018df:	8b 55 10             	mov    0x10(%ebp),%edx
801018e2:	8b 45 14             	mov    0x14(%ebp),%eax
801018e5:	01 d0                	add    %edx,%eax
801018e7:	3b 45 10             	cmp    0x10(%ebp),%eax
801018ea:	73 0a                	jae    801018f6 <writei+0xa7>
    return -1;
801018ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801018f1:	e9 f5 00 00 00       	jmp    801019eb <writei+0x19c>
  if(off + n > MAXFILE*BSIZE)
801018f6:	8b 55 10             	mov    0x10(%ebp),%edx
801018f9:	8b 45 14             	mov    0x14(%ebp),%eax
801018fc:	01 d0                	add    %edx,%eax
801018fe:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101903:	76 0a                	jbe    8010190f <writei+0xc0>
    return -1;
80101905:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010190a:	e9 dc 00 00 00       	jmp    801019eb <writei+0x19c>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
8010190f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80101916:	e9 99 00 00 00       	jmp    801019b4 <writei+0x165>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
8010191b:	8b 45 10             	mov    0x10(%ebp),%eax
8010191e:	c1 e8 09             	shr    $0x9,%eax
80101921:	83 ec 08             	sub    $0x8,%esp
80101924:	50                   	push   %eax
80101925:	ff 75 08             	pushl  0x8(%ebp)
80101928:	e8 2c fb ff ff       	call   80101459 <bmap>
8010192d:	83 c4 10             	add    $0x10,%esp
80101930:	89 c2                	mov    %eax,%edx
80101932:	8b 45 08             	mov    0x8(%ebp),%eax
80101935:	8b 00                	mov    (%eax),%eax
80101937:	83 ec 08             	sub    $0x8,%esp
8010193a:	52                   	push   %edx
8010193b:	50                   	push   %eax
8010193c:	e8 75 e8 ff ff       	call   801001b6 <bread>
80101941:	83 c4 10             	add    $0x10,%esp
80101944:	89 45 f0             	mov    %eax,-0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101947:	8b 45 10             	mov    0x10(%ebp),%eax
8010194a:	25 ff 01 00 00       	and    $0x1ff,%eax
8010194f:	ba 00 02 00 00       	mov    $0x200,%edx
80101954:	29 c2                	sub    %eax,%edx
80101956:	8b 45 14             	mov    0x14(%ebp),%eax
80101959:	2b 45 f4             	sub    -0xc(%ebp),%eax
8010195c:	39 c2                	cmp    %eax,%edx
8010195e:	0f 46 c2             	cmovbe %edx,%eax
80101961:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(bp->data + off%BSIZE, src, m);
80101964:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101967:	8d 50 18             	lea    0x18(%eax),%edx
8010196a:	8b 45 10             	mov    0x10(%ebp),%eax
8010196d:	25 ff 01 00 00       	and    $0x1ff,%eax
80101972:	01 d0                	add    %edx,%eax
80101974:	83 ec 04             	sub    $0x4,%esp
80101977:	ff 75 ec             	pushl  -0x14(%ebp)
8010197a:	ff 75 0c             	pushl  0xc(%ebp)
8010197d:	50                   	push   %eax
8010197e:	e8 ab 2f 00 00       	call   8010492e <memmove>
80101983:	83 c4 10             	add    $0x10,%esp
    log_write(bp);
80101986:	83 ec 0c             	sub    $0xc,%esp
80101989:	ff 75 f0             	pushl  -0x10(%ebp)
8010198c:	e8 fb 13 00 00       	call   80102d8c <log_write>
80101991:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
80101994:	83 ec 0c             	sub    $0xc,%esp
80101997:	ff 75 f0             	pushl  -0x10(%ebp)
8010199a:	e8 8f e8 ff ff       	call   8010022e <brelse>
8010199f:	83 c4 10             	add    $0x10,%esp
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
801019a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
801019a5:	01 45 f4             	add    %eax,-0xc(%ebp)
801019a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
801019ab:	01 45 10             	add    %eax,0x10(%ebp)
801019ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
801019b1:	01 45 0c             	add    %eax,0xc(%ebp)
801019b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
801019b7:	3b 45 14             	cmp    0x14(%ebp),%eax
801019ba:	0f 82 5b ff ff ff    	jb     8010191b <writei+0xcc>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
801019c0:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
801019c4:	74 22                	je     801019e8 <writei+0x199>
801019c6:	8b 45 08             	mov    0x8(%ebp),%eax
801019c9:	8b 40 18             	mov    0x18(%eax),%eax
801019cc:	3b 45 10             	cmp    0x10(%ebp),%eax
801019cf:	73 17                	jae    801019e8 <writei+0x199>
    ip->size = off;
801019d1:	8b 45 08             	mov    0x8(%ebp),%eax
801019d4:	8b 55 10             	mov    0x10(%ebp),%edx
801019d7:	89 50 18             	mov    %edx,0x18(%eax)
    iupdate(ip);
801019da:	83 ec 0c             	sub    $0xc,%esp
801019dd:	ff 75 08             	pushl  0x8(%ebp)
801019e0:	e8 c1 f5 ff ff       	call   80100fa6 <iupdate>
801019e5:	83 c4 10             	add    $0x10,%esp
  }
  return n;
801019e8:	8b 45 14             	mov    0x14(%ebp),%eax
}
801019eb:	c9                   	leave  
801019ec:	c3                   	ret    

801019ed <writecolori>:

// Write data to inode.
//called when system call colorwrite
int
writecolori(struct inode *ip, char *src, uint off, uint n, int forec, int foreh, int backc, int backh)
{
801019ed:	55                   	push   %ebp
801019ee:	89 e5                	mov    %esp,%ebp
801019f0:	83 ec 18             	sub    $0x18,%esp
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
801019f3:	8b 45 08             	mov    0x8(%ebp),%eax
801019f6:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801019fa:	66 83 f8 03          	cmp    $0x3,%ax
801019fe:	75 7e                	jne    80101a7e <writecolori+0x91>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].colorwrite)
80101a00:	8b 45 08             	mov    0x8(%ebp),%eax
80101a03:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101a07:	66 85 c0             	test   %ax,%ax
80101a0a:	78 2b                	js     80101a37 <writecolori+0x4a>
80101a0c:	8b 45 08             	mov    0x8(%ebp),%eax
80101a0f:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101a13:	66 83 f8 09          	cmp    $0x9,%ax
80101a17:	7f 1e                	jg     80101a37 <writecolori+0x4a>
80101a19:	8b 45 08             	mov    0x8(%ebp),%eax
80101a1c:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101a20:	0f bf d0             	movswl %ax,%edx
80101a23:	89 d0                	mov    %edx,%eax
80101a25:	01 c0                	add    %eax,%eax
80101a27:	01 d0                	add    %edx,%eax
80101a29:	c1 e0 02             	shl    $0x2,%eax
80101a2c:	05 68 f8 10 80       	add    $0x8010f868,%eax
80101a31:	8b 00                	mov    (%eax),%eax
80101a33:	85 c0                	test   %eax,%eax
80101a35:	75 0a                	jne    80101a41 <writecolori+0x54>
      return -1;
80101a37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a3c:	e9 54 01 00 00       	jmp    80101b95 <writecolori+0x1a8>
    return devsw[ip->major].colorwrite(ip, src, n, forec,foreh,backc,backh);
80101a41:	8b 45 08             	mov    0x8(%ebp),%eax
80101a44:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101a48:	0f bf d0             	movswl %ax,%edx
80101a4b:	89 d0                	mov    %edx,%eax
80101a4d:	01 c0                	add    %eax,%eax
80101a4f:	01 d0                	add    %edx,%eax
80101a51:	c1 e0 02             	shl    $0x2,%eax
80101a54:	05 68 f8 10 80       	add    $0x8010f868,%eax
80101a59:	8b 00                	mov    (%eax),%eax
80101a5b:	8b 55 14             	mov    0x14(%ebp),%edx
80101a5e:	83 ec 04             	sub    $0x4,%esp
80101a61:	ff 75 24             	pushl  0x24(%ebp)
80101a64:	ff 75 20             	pushl  0x20(%ebp)
80101a67:	ff 75 1c             	pushl  0x1c(%ebp)
80101a6a:	ff 75 18             	pushl  0x18(%ebp)
80101a6d:	52                   	push   %edx
80101a6e:	ff 75 0c             	pushl  0xc(%ebp)
80101a71:	ff 75 08             	pushl  0x8(%ebp)
80101a74:	ff d0                	call   *%eax
80101a76:	83 c4 20             	add    $0x20,%esp
80101a79:	e9 17 01 00 00       	jmp    80101b95 <writecolori+0x1a8>
  }

  if(off > ip->size || off + n < off)
80101a7e:	8b 45 08             	mov    0x8(%ebp),%eax
80101a81:	8b 40 18             	mov    0x18(%eax),%eax
80101a84:	3b 45 10             	cmp    0x10(%ebp),%eax
80101a87:	72 0d                	jb     80101a96 <writecolori+0xa9>
80101a89:	8b 55 10             	mov    0x10(%ebp),%edx
80101a8c:	8b 45 14             	mov    0x14(%ebp),%eax
80101a8f:	01 d0                	add    %edx,%eax
80101a91:	3b 45 10             	cmp    0x10(%ebp),%eax
80101a94:	73 0a                	jae    80101aa0 <writecolori+0xb3>
    return -1;
80101a96:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a9b:	e9 f5 00 00 00       	jmp    80101b95 <writecolori+0x1a8>
  if(off + n > MAXFILE*BSIZE)
80101aa0:	8b 55 10             	mov    0x10(%ebp),%edx
80101aa3:	8b 45 14             	mov    0x14(%ebp),%eax
80101aa6:	01 d0                	add    %edx,%eax
80101aa8:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101aad:	76 0a                	jbe    80101ab9 <writecolori+0xcc>
    return -1;
80101aaf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ab4:	e9 dc 00 00 00       	jmp    80101b95 <writecolori+0x1a8>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ab9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80101ac0:	e9 99 00 00 00       	jmp    80101b5e <writecolori+0x171>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ac5:	8b 45 10             	mov    0x10(%ebp),%eax
80101ac8:	c1 e8 09             	shr    $0x9,%eax
80101acb:	83 ec 08             	sub    $0x8,%esp
80101ace:	50                   	push   %eax
80101acf:	ff 75 08             	pushl  0x8(%ebp)
80101ad2:	e8 82 f9 ff ff       	call   80101459 <bmap>
80101ad7:	83 c4 10             	add    $0x10,%esp
80101ada:	89 c2                	mov    %eax,%edx
80101adc:	8b 45 08             	mov    0x8(%ebp),%eax
80101adf:	8b 00                	mov    (%eax),%eax
80101ae1:	83 ec 08             	sub    $0x8,%esp
80101ae4:	52                   	push   %edx
80101ae5:	50                   	push   %eax
80101ae6:	e8 cb e6 ff ff       	call   801001b6 <bread>
80101aeb:	83 c4 10             	add    $0x10,%esp
80101aee:	89 45 f0             	mov    %eax,-0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101af1:	8b 45 10             	mov    0x10(%ebp),%eax
80101af4:	25 ff 01 00 00       	and    $0x1ff,%eax
80101af9:	ba 00 02 00 00       	mov    $0x200,%edx
80101afe:	29 c2                	sub    %eax,%edx
80101b00:	8b 45 14             	mov    0x14(%ebp),%eax
80101b03:	2b 45 f4             	sub    -0xc(%ebp),%eax
80101b06:	39 c2                	cmp    %eax,%edx
80101b08:	0f 46 c2             	cmovbe %edx,%eax
80101b0b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(bp->data + off%BSIZE, src, m);
80101b0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101b11:	8d 50 18             	lea    0x18(%eax),%edx
80101b14:	8b 45 10             	mov    0x10(%ebp),%eax
80101b17:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b1c:	01 d0                	add    %edx,%eax
80101b1e:	83 ec 04             	sub    $0x4,%esp
80101b21:	ff 75 ec             	pushl  -0x14(%ebp)
80101b24:	ff 75 0c             	pushl  0xc(%ebp)
80101b27:	50                   	push   %eax
80101b28:	e8 01 2e 00 00       	call   8010492e <memmove>
80101b2d:	83 c4 10             	add    $0x10,%esp
    log_write(bp);
80101b30:	83 ec 0c             	sub    $0xc,%esp
80101b33:	ff 75 f0             	pushl  -0x10(%ebp)
80101b36:	e8 51 12 00 00       	call   80102d8c <log_write>
80101b3b:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
80101b3e:	83 ec 0c             	sub    $0xc,%esp
80101b41:	ff 75 f0             	pushl  -0x10(%ebp)
80101b44:	e8 e5 e6 ff ff       	call   8010022e <brelse>
80101b49:	83 c4 10             	add    $0x10,%esp
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101b4f:	01 45 f4             	add    %eax,-0xc(%ebp)
80101b52:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101b55:	01 45 10             	add    %eax,0x10(%ebp)
80101b58:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101b5b:	01 45 0c             	add    %eax,0xc(%ebp)
80101b5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101b61:	3b 45 14             	cmp    0x14(%ebp),%eax
80101b64:	0f 82 5b ff ff ff    	jb     80101ac5 <writecolori+0xd8>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101b6a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
80101b6e:	74 22                	je     80101b92 <writecolori+0x1a5>
80101b70:	8b 45 08             	mov    0x8(%ebp),%eax
80101b73:	8b 40 18             	mov    0x18(%eax),%eax
80101b76:	3b 45 10             	cmp    0x10(%ebp),%eax
80101b79:	73 17                	jae    80101b92 <writecolori+0x1a5>
    ip->size = off;
80101b7b:	8b 45 08             	mov    0x8(%ebp),%eax
80101b7e:	8b 55 10             	mov    0x10(%ebp),%edx
80101b81:	89 50 18             	mov    %edx,0x18(%eax)
    iupdate(ip);
80101b84:	83 ec 0c             	sub    $0xc,%esp
80101b87:	ff 75 08             	pushl  0x8(%ebp)
80101b8a:	e8 17 f4 ff ff       	call   80100fa6 <iupdate>
80101b8f:	83 c4 10             	add    $0x10,%esp
  }
  return n;
80101b92:	8b 45 14             	mov    0x14(%ebp),%eax
}
80101b95:	c9                   	leave  
80101b96:	c3                   	ret    

80101b97 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b97:	55                   	push   %ebp
80101b98:	89 e5                	mov    %esp,%ebp
80101b9a:	83 ec 08             	sub    $0x8,%esp
  return strncmp(s, t, DIRSIZ);
80101b9d:	83 ec 04             	sub    $0x4,%esp
80101ba0:	6a 0e                	push   $0xe
80101ba2:	ff 75 0c             	pushl  0xc(%ebp)
80101ba5:	ff 75 08             	pushl  0x8(%ebp)
80101ba8:	e8 17 2e 00 00       	call   801049c4 <strncmp>
80101bad:	83 c4 10             	add    $0x10,%esp
}
80101bb0:	c9                   	leave  
80101bb1:	c3                   	ret    

80101bb2 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101bb2:	55                   	push   %ebp
80101bb3:	89 e5                	mov    %esp,%ebp
80101bb5:	83 ec 28             	sub    $0x28,%esp
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bb8:	8b 45 08             	mov    0x8(%ebp),%eax
80101bbb:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80101bbf:	66 83 f8 01          	cmp    $0x1,%ax
80101bc3:	74 0d                	je     80101bd2 <dirlookup+0x20>
    panic("dirlookup not DIR");
80101bc5:	83 ec 0c             	sub    $0xc,%esp
80101bc8:	68 37 99 10 80       	push   $0x80109937
80101bcd:	e8 7d 6b 00 00       	call   8010874f <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bd2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80101bd9:	eb 7b                	jmp    80101c56 <dirlookup+0xa4>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101bdb:	6a 10                	push   $0x10
80101bdd:	ff 75 f4             	pushl  -0xc(%ebp)
80101be0:	8d 45 e0             	lea    -0x20(%ebp),%eax
80101be3:	50                   	push   %eax
80101be4:	ff 75 08             	pushl  0x8(%ebp)
80101be7:	e8 f6 fa ff ff       	call   801016e2 <readi>
80101bec:	83 c4 10             	add    $0x10,%esp
80101bef:	83 f8 10             	cmp    $0x10,%eax
80101bf2:	74 0d                	je     80101c01 <dirlookup+0x4f>
      panic("dirlink read");
80101bf4:	83 ec 0c             	sub    $0xc,%esp
80101bf7:	68 49 99 10 80       	push   $0x80109949
80101bfc:	e8 4e 6b 00 00       	call   8010874f <panic>
    if(de.inum == 0)
80101c01:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
80101c05:	66 85 c0             	test   %ax,%ax
80101c08:	74 47                	je     80101c51 <dirlookup+0x9f>
      continue;
    if(namecmp(name, de.name) == 0){
80101c0a:	83 ec 08             	sub    $0x8,%esp
80101c0d:	8d 45 e0             	lea    -0x20(%ebp),%eax
80101c10:	83 c0 02             	add    $0x2,%eax
80101c13:	50                   	push   %eax
80101c14:	ff 75 0c             	pushl  0xc(%ebp)
80101c17:	e8 7b ff ff ff       	call   80101b97 <namecmp>
80101c1c:	83 c4 10             	add    $0x10,%esp
80101c1f:	85 c0                	test   %eax,%eax
80101c21:	75 2f                	jne    80101c52 <dirlookup+0xa0>
      // entry matches path element
      if(poff)
80101c23:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80101c27:	74 08                	je     80101c31 <dirlookup+0x7f>
        *poff = off;
80101c29:	8b 45 10             	mov    0x10(%ebp),%eax
80101c2c:	8b 55 f4             	mov    -0xc(%ebp),%edx
80101c2f:	89 10                	mov    %edx,(%eax)
      inum = de.inum;
80101c31:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
80101c35:	0f b7 c0             	movzwl %ax,%eax
80101c38:	89 45 f0             	mov    %eax,-0x10(%ebp)
      return iget(dp->dev, inum);
80101c3b:	8b 45 08             	mov    0x8(%ebp),%eax
80101c3e:	8b 00                	mov    (%eax),%eax
80101c40:	83 ec 08             	sub    $0x8,%esp
80101c43:	ff 75 f0             	pushl  -0x10(%ebp)
80101c46:	50                   	push   %eax
80101c47:	e8 15 f4 ff ff       	call   80101061 <iget>
80101c4c:	83 c4 10             	add    $0x10,%esp
80101c4f:	eb 19                	jmp    80101c6a <dirlookup+0xb8>

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
80101c51:	90                   	nop
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101c52:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
80101c56:	8b 45 08             	mov    0x8(%ebp),%eax
80101c59:	8b 40 18             	mov    0x18(%eax),%eax
80101c5c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80101c5f:	0f 87 76 ff ff ff    	ja     80101bdb <dirlookup+0x29>
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101c65:	b8 00 00 00 00       	mov    $0x0,%eax
}
80101c6a:	c9                   	leave  
80101c6b:	c3                   	ret    

80101c6c <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101c6c:	55                   	push   %ebp
80101c6d:	89 e5                	mov    %esp,%ebp
80101c6f:	83 ec 28             	sub    $0x28,%esp
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101c72:	83 ec 04             	sub    $0x4,%esp
80101c75:	6a 00                	push   $0x0
80101c77:	ff 75 0c             	pushl  0xc(%ebp)
80101c7a:	ff 75 08             	pushl  0x8(%ebp)
80101c7d:	e8 30 ff ff ff       	call   80101bb2 <dirlookup>
80101c82:	83 c4 10             	add    $0x10,%esp
80101c85:	89 45 f0             	mov    %eax,-0x10(%ebp)
80101c88:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80101c8c:	74 18                	je     80101ca6 <dirlink+0x3a>
    iput(ip);
80101c8e:	83 ec 0c             	sub    $0xc,%esp
80101c91:	ff 75 f0             	pushl  -0x10(%ebp)
80101c94:	e8 ab f6 ff ff       	call   80101344 <iput>
80101c99:	83 c4 10             	add    $0x10,%esp
    return -1;
80101c9c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ca1:	e9 9c 00 00 00       	jmp    80101d42 <dirlink+0xd6>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101ca6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80101cad:	eb 39                	jmp    80101ce8 <dirlink+0x7c>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101caf:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101cb2:	6a 10                	push   $0x10
80101cb4:	50                   	push   %eax
80101cb5:	8d 45 e0             	lea    -0x20(%ebp),%eax
80101cb8:	50                   	push   %eax
80101cb9:	ff 75 08             	pushl  0x8(%ebp)
80101cbc:	e8 21 fa ff ff       	call   801016e2 <readi>
80101cc1:	83 c4 10             	add    $0x10,%esp
80101cc4:	83 f8 10             	cmp    $0x10,%eax
80101cc7:	74 0d                	je     80101cd6 <dirlink+0x6a>
      panic("dirlink read");
80101cc9:	83 ec 0c             	sub    $0xc,%esp
80101ccc:	68 49 99 10 80       	push   $0x80109949
80101cd1:	e8 79 6a 00 00       	call   8010874f <panic>
    if(de.inum == 0)
80101cd6:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
80101cda:	66 85 c0             	test   %ax,%ax
80101cdd:	74 18                	je     80101cf7 <dirlink+0x8b>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101cdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101ce2:	83 c0 10             	add    $0x10,%eax
80101ce5:	89 45 f4             	mov    %eax,-0xc(%ebp)
80101ce8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ceb:	8b 50 18             	mov    0x18(%eax),%edx
80101cee:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101cf1:	39 c2                	cmp    %eax,%edx
80101cf3:	77 ba                	ja     80101caf <dirlink+0x43>
80101cf5:	eb 01                	jmp    80101cf8 <dirlink+0x8c>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      break;
80101cf7:	90                   	nop
  }

  strncpy(de.name, name, DIRSIZ);
80101cf8:	83 ec 04             	sub    $0x4,%esp
80101cfb:	6a 0e                	push   $0xe
80101cfd:	ff 75 0c             	pushl  0xc(%ebp)
80101d00:	8d 45 e0             	lea    -0x20(%ebp),%eax
80101d03:	83 c0 02             	add    $0x2,%eax
80101d06:	50                   	push   %eax
80101d07:	e8 0e 2d 00 00       	call   80104a1a <strncpy>
80101d0c:	83 c4 10             	add    $0x10,%esp
  de.inum = inum;
80101d0f:	8b 45 10             	mov    0x10(%ebp),%eax
80101d12:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101d16:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101d19:	6a 10                	push   $0x10
80101d1b:	50                   	push   %eax
80101d1c:	8d 45 e0             	lea    -0x20(%ebp),%eax
80101d1f:	50                   	push   %eax
80101d20:	ff 75 08             	pushl  0x8(%ebp)
80101d23:	e8 27 fb ff ff       	call   8010184f <writei>
80101d28:	83 c4 10             	add    $0x10,%esp
80101d2b:	83 f8 10             	cmp    $0x10,%eax
80101d2e:	74 0d                	je     80101d3d <dirlink+0xd1>
    panic("dirlink");
80101d30:	83 ec 0c             	sub    $0xc,%esp
80101d33:	68 56 99 10 80       	push   $0x80109956
80101d38:	e8 12 6a 00 00       	call   8010874f <panic>
  
  return 0;
80101d3d:	b8 00 00 00 00       	mov    $0x0,%eax
}
80101d42:	c9                   	leave  
80101d43:	c3                   	ret    

80101d44 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
80101d44:	55                   	push   %ebp
80101d45:	89 e5                	mov    %esp,%ebp
80101d47:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int len;

  while(*path == '/')
80101d4a:	eb 04                	jmp    80101d50 <skipelem+0xc>
    path++;
80101d4c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101d50:	8b 45 08             	mov    0x8(%ebp),%eax
80101d53:	0f b6 00             	movzbl (%eax),%eax
80101d56:	3c 2f                	cmp    $0x2f,%al
80101d58:	74 f2                	je     80101d4c <skipelem+0x8>
    path++;
  if(*path == 0)
80101d5a:	8b 45 08             	mov    0x8(%ebp),%eax
80101d5d:	0f b6 00             	movzbl (%eax),%eax
80101d60:	84 c0                	test   %al,%al
80101d62:	75 07                	jne    80101d6b <skipelem+0x27>
    return 0;
80101d64:	b8 00 00 00 00       	mov    $0x0,%eax
80101d69:	eb 7b                	jmp    80101de6 <skipelem+0xa2>
  s = path;
80101d6b:	8b 45 08             	mov    0x8(%ebp),%eax
80101d6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(*path != '/' && *path != 0)
80101d71:	eb 04                	jmp    80101d77 <skipelem+0x33>
    path++;
80101d73:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d77:	8b 45 08             	mov    0x8(%ebp),%eax
80101d7a:	0f b6 00             	movzbl (%eax),%eax
80101d7d:	3c 2f                	cmp    $0x2f,%al
80101d7f:	74 0a                	je     80101d8b <skipelem+0x47>
80101d81:	8b 45 08             	mov    0x8(%ebp),%eax
80101d84:	0f b6 00             	movzbl (%eax),%eax
80101d87:	84 c0                	test   %al,%al
80101d89:	75 e8                	jne    80101d73 <skipelem+0x2f>
    path++;
  len = path - s;
80101d8b:	8b 55 08             	mov    0x8(%ebp),%edx
80101d8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101d91:	29 c2                	sub    %eax,%edx
80101d93:	89 d0                	mov    %edx,%eax
80101d95:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(len >= DIRSIZ)
80101d98:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
80101d9c:	7e 15                	jle    80101db3 <skipelem+0x6f>
    memmove(name, s, DIRSIZ);
80101d9e:	83 ec 04             	sub    $0x4,%esp
80101da1:	6a 0e                	push   $0xe
80101da3:	ff 75 f4             	pushl  -0xc(%ebp)
80101da6:	ff 75 0c             	pushl  0xc(%ebp)
80101da9:	e8 80 2b 00 00       	call   8010492e <memmove>
80101dae:	83 c4 10             	add    $0x10,%esp
80101db1:	eb 26                	jmp    80101dd9 <skipelem+0x95>
  else {
    memmove(name, s, len);
80101db3:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101db6:	83 ec 04             	sub    $0x4,%esp
80101db9:	50                   	push   %eax
80101dba:	ff 75 f4             	pushl  -0xc(%ebp)
80101dbd:	ff 75 0c             	pushl  0xc(%ebp)
80101dc0:	e8 69 2b 00 00       	call   8010492e <memmove>
80101dc5:	83 c4 10             	add    $0x10,%esp
    name[len] = 0;
80101dc8:	8b 55 f0             	mov    -0x10(%ebp),%edx
80101dcb:	8b 45 0c             	mov    0xc(%ebp),%eax
80101dce:	01 d0                	add    %edx,%eax
80101dd0:	c6 00 00             	movb   $0x0,(%eax)
  }
  while(*path == '/')
80101dd3:	eb 04                	jmp    80101dd9 <skipelem+0x95>
    path++;
80101dd5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101dd9:	8b 45 08             	mov    0x8(%ebp),%eax
80101ddc:	0f b6 00             	movzbl (%eax),%eax
80101ddf:	3c 2f                	cmp    $0x2f,%al
80101de1:	74 f2                	je     80101dd5 <skipelem+0x91>
    path++;
  return path;
80101de3:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101de6:	c9                   	leave  
80101de7:	c3                   	ret    

80101de8 <namex>:
// Look up and return the inode for a path name.
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101de8:	55                   	push   %ebp
80101de9:	89 e5                	mov    %esp,%ebp
80101deb:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101dee:	8b 45 08             	mov    0x8(%ebp),%eax
80101df1:	0f b6 00             	movzbl (%eax),%eax
80101df4:	3c 2f                	cmp    $0x2f,%al
80101df6:	75 17                	jne    80101e0f <namex+0x27>
    ip = iget(ROOTDEV, ROOTINO);
80101df8:	83 ec 08             	sub    $0x8,%esp
80101dfb:	6a 01                	push   $0x1
80101dfd:	6a 01                	push   $0x1
80101dff:	e8 5d f2 ff ff       	call   80101061 <iget>
80101e04:	83 c4 10             	add    $0x10,%esp
80101e07:	89 45 f4             	mov    %eax,-0xc(%ebp)
80101e0a:	e9 bb 00 00 00       	jmp    80101eca <namex+0xe2>
  else
    ip = idup(proc->cwd);
80101e0f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80101e15:	8b 40 68             	mov    0x68(%eax),%eax
80101e18:	83 ec 0c             	sub    $0xc,%esp
80101e1b:	50                   	push   %eax
80101e1c:	e8 1f f3 ff ff       	call   80101140 <idup>
80101e21:	83 c4 10             	add    $0x10,%esp
80101e24:	89 45 f4             	mov    %eax,-0xc(%ebp)

  while((path = skipelem(path, name)) != 0){
80101e27:	e9 9e 00 00 00       	jmp    80101eca <namex+0xe2>
    ilock(ip);
80101e2c:	83 ec 0c             	sub    $0xc,%esp
80101e2f:	ff 75 f4             	pushl  -0xc(%ebp)
80101e32:	e8 43 f3 ff ff       	call   8010117a <ilock>
80101e37:	83 c4 10             	add    $0x10,%esp
    if(ip->type != T_DIR){
80101e3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101e3d:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80101e41:	66 83 f8 01          	cmp    $0x1,%ax
80101e45:	74 18                	je     80101e5f <namex+0x77>
      iunlockput(ip);
80101e47:	83 ec 0c             	sub    $0xc,%esp
80101e4a:	ff 75 f4             	pushl  -0xc(%ebp)
80101e4d:	e8 e2 f5 ff ff       	call   80101434 <iunlockput>
80101e52:	83 c4 10             	add    $0x10,%esp
      return 0;
80101e55:	b8 00 00 00 00       	mov    $0x0,%eax
80101e5a:	e9 a7 00 00 00       	jmp    80101f06 <namex+0x11e>
    }
    if(nameiparent && *path == '\0'){
80101e5f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80101e63:	74 20                	je     80101e85 <namex+0x9d>
80101e65:	8b 45 08             	mov    0x8(%ebp),%eax
80101e68:	0f b6 00             	movzbl (%eax),%eax
80101e6b:	84 c0                	test   %al,%al
80101e6d:	75 16                	jne    80101e85 <namex+0x9d>
      // Stop one level early.
      iunlock(ip);
80101e6f:	83 ec 0c             	sub    $0xc,%esp
80101e72:	ff 75 f4             	pushl  -0xc(%ebp)
80101e75:	e8 58 f4 ff ff       	call   801012d2 <iunlock>
80101e7a:	83 c4 10             	add    $0x10,%esp
      return ip;
80101e7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101e80:	e9 81 00 00 00       	jmp    80101f06 <namex+0x11e>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101e85:	83 ec 04             	sub    $0x4,%esp
80101e88:	6a 00                	push   $0x0
80101e8a:	ff 75 10             	pushl  0x10(%ebp)
80101e8d:	ff 75 f4             	pushl  -0xc(%ebp)
80101e90:	e8 1d fd ff ff       	call   80101bb2 <dirlookup>
80101e95:	83 c4 10             	add    $0x10,%esp
80101e98:	89 45 f0             	mov    %eax,-0x10(%ebp)
80101e9b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80101e9f:	75 15                	jne    80101eb6 <namex+0xce>
      iunlockput(ip);
80101ea1:	83 ec 0c             	sub    $0xc,%esp
80101ea4:	ff 75 f4             	pushl  -0xc(%ebp)
80101ea7:	e8 88 f5 ff ff       	call   80101434 <iunlockput>
80101eac:	83 c4 10             	add    $0x10,%esp
      return 0;
80101eaf:	b8 00 00 00 00       	mov    $0x0,%eax
80101eb4:	eb 50                	jmp    80101f06 <namex+0x11e>
    }
    iunlockput(ip);
80101eb6:	83 ec 0c             	sub    $0xc,%esp
80101eb9:	ff 75 f4             	pushl  -0xc(%ebp)
80101ebc:	e8 73 f5 ff ff       	call   80101434 <iunlockput>
80101ec1:	83 c4 10             	add    $0x10,%esp
    ip = next;
80101ec4:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101ec7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
80101eca:	83 ec 08             	sub    $0x8,%esp
80101ecd:	ff 75 10             	pushl  0x10(%ebp)
80101ed0:	ff 75 08             	pushl  0x8(%ebp)
80101ed3:	e8 6c fe ff ff       	call   80101d44 <skipelem>
80101ed8:	83 c4 10             	add    $0x10,%esp
80101edb:	89 45 08             	mov    %eax,0x8(%ebp)
80101ede:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80101ee2:	0f 85 44 ff ff ff    	jne    80101e2c <namex+0x44>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101ee8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80101eec:	74 15                	je     80101f03 <namex+0x11b>
    iput(ip);
80101eee:	83 ec 0c             	sub    $0xc,%esp
80101ef1:	ff 75 f4             	pushl  -0xc(%ebp)
80101ef4:	e8 4b f4 ff ff       	call   80101344 <iput>
80101ef9:	83 c4 10             	add    $0x10,%esp
    return 0;
80101efc:	b8 00 00 00 00       	mov    $0x0,%eax
80101f01:	eb 03                	jmp    80101f06 <namex+0x11e>
  }
  return ip;
80101f03:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80101f06:	c9                   	leave  
80101f07:	c3                   	ret    

80101f08 <namei>:

struct inode*
namei(char *path)
{
80101f08:	55                   	push   %ebp
80101f09:	89 e5                	mov    %esp,%ebp
80101f0b:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101f0e:	83 ec 04             	sub    $0x4,%esp
80101f11:	8d 45 ea             	lea    -0x16(%ebp),%eax
80101f14:	50                   	push   %eax
80101f15:	6a 00                	push   $0x0
80101f17:	ff 75 08             	pushl  0x8(%ebp)
80101f1a:	e8 c9 fe ff ff       	call   80101de8 <namex>
80101f1f:	83 c4 10             	add    $0x10,%esp
}
80101f22:	c9                   	leave  
80101f23:	c3                   	ret    

80101f24 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f24:	55                   	push   %ebp
80101f25:	89 e5                	mov    %esp,%ebp
80101f27:	83 ec 08             	sub    $0x8,%esp
  return namex(path, 1, name);
80101f2a:	83 ec 04             	sub    $0x4,%esp
80101f2d:	ff 75 0c             	pushl  0xc(%ebp)
80101f30:	6a 01                	push   $0x1
80101f32:	ff 75 08             	pushl  0x8(%ebp)
80101f35:	e8 ae fe ff ff       	call   80101de8 <namex>
80101f3a:	83 c4 10             	add    $0x10,%esp
}
80101f3d:	c9                   	leave  
80101f3e:	c3                   	ret    

80101f3f <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
80101f3f:	55                   	push   %ebp
80101f40:	89 e5                	mov    %esp,%ebp
80101f42:	83 ec 14             	sub    $0x14,%esp
80101f45:	8b 45 08             	mov    0x8(%ebp),%eax
80101f48:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f4c:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
80101f50:	89 c2                	mov    %eax,%edx
80101f52:	ec                   	in     (%dx),%al
80101f53:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
80101f56:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
80101f5a:	c9                   	leave  
80101f5b:	c3                   	ret    

80101f5c <insl>:

static inline void
insl(int port, void *addr, int cnt)
{
80101f5c:	55                   	push   %ebp
80101f5d:	89 e5                	mov    %esp,%ebp
80101f5f:	57                   	push   %edi
80101f60:	53                   	push   %ebx
  asm volatile("cld; rep insl" :
80101f61:	8b 55 08             	mov    0x8(%ebp),%edx
80101f64:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f67:	8b 45 10             	mov    0x10(%ebp),%eax
80101f6a:	89 cb                	mov    %ecx,%ebx
80101f6c:	89 df                	mov    %ebx,%edi
80101f6e:	89 c1                	mov    %eax,%ecx
80101f70:	fc                   	cld    
80101f71:	f3 6d                	rep insl (%dx),%es:(%edi)
80101f73:	89 c8                	mov    %ecx,%eax
80101f75:	89 fb                	mov    %edi,%ebx
80101f77:	89 5d 0c             	mov    %ebx,0xc(%ebp)
80101f7a:	89 45 10             	mov    %eax,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "d" (port), "0" (addr), "1" (cnt) :
               "memory", "cc");
}
80101f7d:	90                   	nop
80101f7e:	5b                   	pop    %ebx
80101f7f:	5f                   	pop    %edi
80101f80:	5d                   	pop    %ebp
80101f81:	c3                   	ret    

80101f82 <outb>:

static inline void
outb(ushort port, uchar data)
{
80101f82:	55                   	push   %ebp
80101f83:	89 e5                	mov    %esp,%ebp
80101f85:	83 ec 08             	sub    $0x8,%esp
80101f88:	8b 55 08             	mov    0x8(%ebp),%edx
80101f8b:	8b 45 0c             	mov    0xc(%ebp),%eax
80101f8e:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80101f92:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f95:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
80101f99:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80101f9d:	ee                   	out    %al,(%dx)
}
80101f9e:	90                   	nop
80101f9f:	c9                   	leave  
80101fa0:	c3                   	ret    

80101fa1 <outsl>:
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
}

static inline void
outsl(int port, const void *addr, int cnt)
{
80101fa1:	55                   	push   %ebp
80101fa2:	89 e5                	mov    %esp,%ebp
80101fa4:	56                   	push   %esi
80101fa5:	53                   	push   %ebx
  asm volatile("cld; rep outsl" :
80101fa6:	8b 55 08             	mov    0x8(%ebp),%edx
80101fa9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101fac:	8b 45 10             	mov    0x10(%ebp),%eax
80101faf:	89 cb                	mov    %ecx,%ebx
80101fb1:	89 de                	mov    %ebx,%esi
80101fb3:	89 c1                	mov    %eax,%ecx
80101fb5:	fc                   	cld    
80101fb6:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101fb8:	89 c8                	mov    %ecx,%eax
80101fba:	89 f3                	mov    %esi,%ebx
80101fbc:	89 5d 0c             	mov    %ebx,0xc(%ebp)
80101fbf:	89 45 10             	mov    %eax,0x10(%ebp)
               "=S" (addr), "=c" (cnt) :
               "d" (port), "0" (addr), "1" (cnt) :
               "cc");
}
80101fc2:	90                   	nop
80101fc3:	5b                   	pop    %ebx
80101fc4:	5e                   	pop    %esi
80101fc5:	5d                   	pop    %ebp
80101fc6:	c3                   	ret    

80101fc7 <idewait>:
static void idestart(struct buf*);

// Wait for IDE disk to become ready.
static int
idewait(int checkerr)
{
80101fc7:	55                   	push   %ebp
80101fc8:	89 e5                	mov    %esp,%ebp
80101fca:	83 ec 10             	sub    $0x10,%esp
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY) 
80101fcd:	90                   	nop
80101fce:	68 f7 01 00 00       	push   $0x1f7
80101fd3:	e8 67 ff ff ff       	call   80101f3f <inb>
80101fd8:	83 c4 04             	add    $0x4,%esp
80101fdb:	0f b6 c0             	movzbl %al,%eax
80101fde:	89 45 fc             	mov    %eax,-0x4(%ebp)
80101fe1:	8b 45 fc             	mov    -0x4(%ebp),%eax
80101fe4:	25 c0 00 00 00       	and    $0xc0,%eax
80101fe9:	83 f8 40             	cmp    $0x40,%eax
80101fec:	75 e0                	jne    80101fce <idewait+0x7>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
80101fee:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80101ff2:	74 11                	je     80102005 <idewait+0x3e>
80101ff4:	8b 45 fc             	mov    -0x4(%ebp),%eax
80101ff7:	83 e0 21             	and    $0x21,%eax
80101ffa:	85 c0                	test   %eax,%eax
80101ffc:	74 07                	je     80102005 <idewait+0x3e>
    return -1;
80101ffe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102003:	eb 05                	jmp    8010200a <idewait+0x43>
  return 0;
80102005:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010200a:	c9                   	leave  
8010200b:	c3                   	ret    

8010200c <ideinit>:

void
ideinit(void)
{
8010200c:	55                   	push   %ebp
8010200d:	89 e5                	mov    %esp,%ebp
8010200f:	83 ec 18             	sub    $0x18,%esp
  int i;

  initlock(&idelock, "ide");
80102012:	83 ec 08             	sub    $0x8,%esp
80102015:	68 5e 99 10 80       	push   $0x8010995e
8010201a:	68 c0 c6 10 80       	push   $0x8010c6c0
8010201f:	e8 c6 25 00 00       	call   801045ea <initlock>
80102024:	83 c4 10             	add    $0x10,%esp
  picenable(IRQ_IDE);
80102027:	83 ec 0c             	sub    $0xc,%esp
8010202a:	6a 0e                	push   $0xe
8010202c:	e8 46 15 00 00       	call   80103577 <picenable>
80102031:	83 c4 10             	add    $0x10,%esp
  ioapicenable(IRQ_IDE, ncpu - 1);
80102034:	a1 80 0f 11 80       	mov    0x80110f80,%eax
80102039:	83 e8 01             	sub    $0x1,%eax
8010203c:	83 ec 08             	sub    $0x8,%esp
8010203f:	50                   	push   %eax
80102040:	6a 0e                	push   $0xe
80102042:	e8 37 04 00 00       	call   8010247e <ioapicenable>
80102047:	83 c4 10             	add    $0x10,%esp
  idewait(0);
8010204a:	83 ec 0c             	sub    $0xc,%esp
8010204d:	6a 00                	push   $0x0
8010204f:	e8 73 ff ff ff       	call   80101fc7 <idewait>
80102054:	83 c4 10             	add    $0x10,%esp
  
  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
80102057:	83 ec 08             	sub    $0x8,%esp
8010205a:	68 f0 00 00 00       	push   $0xf0
8010205f:	68 f6 01 00 00       	push   $0x1f6
80102064:	e8 19 ff ff ff       	call   80101f82 <outb>
80102069:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<1000; i++){
8010206c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80102073:	eb 24                	jmp    80102099 <ideinit+0x8d>
    if(inb(0x1f7) != 0){
80102075:	83 ec 0c             	sub    $0xc,%esp
80102078:	68 f7 01 00 00       	push   $0x1f7
8010207d:	e8 bd fe ff ff       	call   80101f3f <inb>
80102082:	83 c4 10             	add    $0x10,%esp
80102085:	84 c0                	test   %al,%al
80102087:	74 0c                	je     80102095 <ideinit+0x89>
      havedisk1 = 1;
80102089:	c7 05 f8 c6 10 80 01 	movl   $0x1,0x8010c6f8
80102090:	00 00 00 
      break;
80102093:	eb 0d                	jmp    801020a2 <ideinit+0x96>
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);
  
  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102095:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80102099:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
801020a0:	7e d3                	jle    80102075 <ideinit+0x69>
      break;
    }
  }
  
  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
801020a2:	83 ec 08             	sub    $0x8,%esp
801020a5:	68 e0 00 00 00       	push   $0xe0
801020aa:	68 f6 01 00 00       	push   $0x1f6
801020af:	e8 ce fe ff ff       	call   80101f82 <outb>
801020b4:	83 c4 10             	add    $0x10,%esp
}
801020b7:	90                   	nop
801020b8:	c9                   	leave  
801020b9:	c3                   	ret    

801020ba <idestart>:

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
801020ba:	55                   	push   %ebp
801020bb:	89 e5                	mov    %esp,%ebp
801020bd:	83 ec 08             	sub    $0x8,%esp
  if(b == 0)
801020c0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801020c4:	75 0d                	jne    801020d3 <idestart+0x19>
    panic("idestart");
801020c6:	83 ec 0c             	sub    $0xc,%esp
801020c9:	68 62 99 10 80       	push   $0x80109962
801020ce:	e8 7c 66 00 00       	call   8010874f <panic>

  idewait(0);
801020d3:	83 ec 0c             	sub    $0xc,%esp
801020d6:	6a 00                	push   $0x0
801020d8:	e8 ea fe ff ff       	call   80101fc7 <idewait>
801020dd:	83 c4 10             	add    $0x10,%esp
  outb(0x3f6, 0);  // generate interrupt
801020e0:	83 ec 08             	sub    $0x8,%esp
801020e3:	6a 00                	push   $0x0
801020e5:	68 f6 03 00 00       	push   $0x3f6
801020ea:	e8 93 fe ff ff       	call   80101f82 <outb>
801020ef:	83 c4 10             	add    $0x10,%esp
  outb(0x1f2, 1);  // number of sectors
801020f2:	83 ec 08             	sub    $0x8,%esp
801020f5:	6a 01                	push   $0x1
801020f7:	68 f2 01 00 00       	push   $0x1f2
801020fc:	e8 81 fe ff ff       	call   80101f82 <outb>
80102101:	83 c4 10             	add    $0x10,%esp
  outb(0x1f3, b->sector & 0xff);
80102104:	8b 45 08             	mov    0x8(%ebp),%eax
80102107:	8b 40 08             	mov    0x8(%eax),%eax
8010210a:	0f b6 c0             	movzbl %al,%eax
8010210d:	83 ec 08             	sub    $0x8,%esp
80102110:	50                   	push   %eax
80102111:	68 f3 01 00 00       	push   $0x1f3
80102116:	e8 67 fe ff ff       	call   80101f82 <outb>
8010211b:	83 c4 10             	add    $0x10,%esp
  outb(0x1f4, (b->sector >> 8) & 0xff);
8010211e:	8b 45 08             	mov    0x8(%ebp),%eax
80102121:	8b 40 08             	mov    0x8(%eax),%eax
80102124:	c1 e8 08             	shr    $0x8,%eax
80102127:	0f b6 c0             	movzbl %al,%eax
8010212a:	83 ec 08             	sub    $0x8,%esp
8010212d:	50                   	push   %eax
8010212e:	68 f4 01 00 00       	push   $0x1f4
80102133:	e8 4a fe ff ff       	call   80101f82 <outb>
80102138:	83 c4 10             	add    $0x10,%esp
  outb(0x1f5, (b->sector >> 16) & 0xff);
8010213b:	8b 45 08             	mov    0x8(%ebp),%eax
8010213e:	8b 40 08             	mov    0x8(%eax),%eax
80102141:	c1 e8 10             	shr    $0x10,%eax
80102144:	0f b6 c0             	movzbl %al,%eax
80102147:	83 ec 08             	sub    $0x8,%esp
8010214a:	50                   	push   %eax
8010214b:	68 f5 01 00 00       	push   $0x1f5
80102150:	e8 2d fe ff ff       	call   80101f82 <outb>
80102155:	83 c4 10             	add    $0x10,%esp
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((b->sector>>24)&0x0f));
80102158:	8b 45 08             	mov    0x8(%ebp),%eax
8010215b:	8b 40 04             	mov    0x4(%eax),%eax
8010215e:	83 e0 01             	and    $0x1,%eax
80102161:	c1 e0 04             	shl    $0x4,%eax
80102164:	89 c2                	mov    %eax,%edx
80102166:	8b 45 08             	mov    0x8(%ebp),%eax
80102169:	8b 40 08             	mov    0x8(%eax),%eax
8010216c:	c1 e8 18             	shr    $0x18,%eax
8010216f:	83 e0 0f             	and    $0xf,%eax
80102172:	09 d0                	or     %edx,%eax
80102174:	83 c8 e0             	or     $0xffffffe0,%eax
80102177:	0f b6 c0             	movzbl %al,%eax
8010217a:	83 ec 08             	sub    $0x8,%esp
8010217d:	50                   	push   %eax
8010217e:	68 f6 01 00 00       	push   $0x1f6
80102183:	e8 fa fd ff ff       	call   80101f82 <outb>
80102188:	83 c4 10             	add    $0x10,%esp
  if(b->flags & B_DIRTY){
8010218b:	8b 45 08             	mov    0x8(%ebp),%eax
8010218e:	8b 00                	mov    (%eax),%eax
80102190:	83 e0 04             	and    $0x4,%eax
80102193:	85 c0                	test   %eax,%eax
80102195:	74 30                	je     801021c7 <idestart+0x10d>
    outb(0x1f7, IDE_CMD_WRITE);
80102197:	83 ec 08             	sub    $0x8,%esp
8010219a:	6a 30                	push   $0x30
8010219c:	68 f7 01 00 00       	push   $0x1f7
801021a1:	e8 dc fd ff ff       	call   80101f82 <outb>
801021a6:	83 c4 10             	add    $0x10,%esp
    outsl(0x1f0, b->data, 512/4);
801021a9:	8b 45 08             	mov    0x8(%ebp),%eax
801021ac:	83 c0 18             	add    $0x18,%eax
801021af:	83 ec 04             	sub    $0x4,%esp
801021b2:	68 80 00 00 00       	push   $0x80
801021b7:	50                   	push   %eax
801021b8:	68 f0 01 00 00       	push   $0x1f0
801021bd:	e8 df fd ff ff       	call   80101fa1 <outsl>
801021c2:	83 c4 10             	add    $0x10,%esp
  } else {
    outb(0x1f7, IDE_CMD_READ);
  }
}
801021c5:	eb 12                	jmp    801021d9 <idestart+0x11f>
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((b->sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, IDE_CMD_WRITE);
    outsl(0x1f0, b->data, 512/4);
  } else {
    outb(0x1f7, IDE_CMD_READ);
801021c7:	83 ec 08             	sub    $0x8,%esp
801021ca:	6a 20                	push   $0x20
801021cc:	68 f7 01 00 00       	push   $0x1f7
801021d1:	e8 ac fd ff ff       	call   80101f82 <outb>
801021d6:	83 c4 10             	add    $0x10,%esp
  }
}
801021d9:	90                   	nop
801021da:	c9                   	leave  
801021db:	c3                   	ret    

801021dc <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
801021dc:	55                   	push   %ebp
801021dd:	89 e5                	mov    %esp,%ebp
801021df:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
801021e2:	83 ec 0c             	sub    $0xc,%esp
801021e5:	68 c0 c6 10 80       	push   $0x8010c6c0
801021ea:	e8 1d 24 00 00       	call   8010460c <acquire>
801021ef:	83 c4 10             	add    $0x10,%esp
  if((b = idequeue) == 0){
801021f2:	a1 f4 c6 10 80       	mov    0x8010c6f4,%eax
801021f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
801021fa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801021fe:	75 15                	jne    80102215 <ideintr+0x39>
    release(&idelock);
80102200:	83 ec 0c             	sub    $0xc,%esp
80102203:	68 c0 c6 10 80       	push   $0x8010c6c0
80102208:	e8 66 24 00 00       	call   80104673 <release>
8010220d:	83 c4 10             	add    $0x10,%esp
    // cprintf("spurious IDE interrupt\n");
    return;
80102210:	e9 9a 00 00 00       	jmp    801022af <ideintr+0xd3>
  }
  idequeue = b->qnext;
80102215:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102218:	8b 40 14             	mov    0x14(%eax),%eax
8010221b:	a3 f4 c6 10 80       	mov    %eax,0x8010c6f4

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102220:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102223:	8b 00                	mov    (%eax),%eax
80102225:	83 e0 04             	and    $0x4,%eax
80102228:	85 c0                	test   %eax,%eax
8010222a:	75 2d                	jne    80102259 <ideintr+0x7d>
8010222c:	83 ec 0c             	sub    $0xc,%esp
8010222f:	6a 01                	push   $0x1
80102231:	e8 91 fd ff ff       	call   80101fc7 <idewait>
80102236:	83 c4 10             	add    $0x10,%esp
80102239:	85 c0                	test   %eax,%eax
8010223b:	78 1c                	js     80102259 <ideintr+0x7d>
    insl(0x1f0, b->data, 512/4);
8010223d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102240:	83 c0 18             	add    $0x18,%eax
80102243:	83 ec 04             	sub    $0x4,%esp
80102246:	68 80 00 00 00       	push   $0x80
8010224b:	50                   	push   %eax
8010224c:	68 f0 01 00 00       	push   $0x1f0
80102251:	e8 06 fd ff ff       	call   80101f5c <insl>
80102256:	83 c4 10             	add    $0x10,%esp
  
  // Wake process waiting for this buf.
  b->flags |= B_VALID;
80102259:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010225c:	8b 00                	mov    (%eax),%eax
8010225e:	83 c8 02             	or     $0x2,%eax
80102261:	89 c2                	mov    %eax,%edx
80102263:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102266:	89 10                	mov    %edx,(%eax)
  b->flags &= ~B_DIRTY;
80102268:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010226b:	8b 00                	mov    (%eax),%eax
8010226d:	83 e0 fb             	and    $0xfffffffb,%eax
80102270:	89 c2                	mov    %eax,%edx
80102272:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102275:	89 10                	mov    %edx,(%eax)
  wakeup(b);
80102277:	83 ec 0c             	sub    $0xc,%esp
8010227a:	ff 75 f4             	pushl  -0xc(%ebp)
8010227d:	e8 7c 21 00 00       	call   801043fe <wakeup>
80102282:	83 c4 10             	add    $0x10,%esp
  
  // Start disk on next buf in queue.
  if(idequeue != 0)
80102285:	a1 f4 c6 10 80       	mov    0x8010c6f4,%eax
8010228a:	85 c0                	test   %eax,%eax
8010228c:	74 11                	je     8010229f <ideintr+0xc3>
    idestart(idequeue);
8010228e:	a1 f4 c6 10 80       	mov    0x8010c6f4,%eax
80102293:	83 ec 0c             	sub    $0xc,%esp
80102296:	50                   	push   %eax
80102297:	e8 1e fe ff ff       	call   801020ba <idestart>
8010229c:	83 c4 10             	add    $0x10,%esp

  release(&idelock);
8010229f:	83 ec 0c             	sub    $0xc,%esp
801022a2:	68 c0 c6 10 80       	push   $0x8010c6c0
801022a7:	e8 c7 23 00 00       	call   80104673 <release>
801022ac:	83 c4 10             	add    $0x10,%esp
}
801022af:	c9                   	leave  
801022b0:	c3                   	ret    

801022b1 <iderw>:
// Sync buf with disk. 
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801022b1:	55                   	push   %ebp
801022b2:	89 e5                	mov    %esp,%ebp
801022b4:	83 ec 18             	sub    $0x18,%esp
  struct buf **pp;

  if(!(b->flags & B_BUSY))
801022b7:	8b 45 08             	mov    0x8(%ebp),%eax
801022ba:	8b 00                	mov    (%eax),%eax
801022bc:	83 e0 01             	and    $0x1,%eax
801022bf:	85 c0                	test   %eax,%eax
801022c1:	75 0d                	jne    801022d0 <iderw+0x1f>
    panic("iderw: buf not busy");
801022c3:	83 ec 0c             	sub    $0xc,%esp
801022c6:	68 6b 99 10 80       	push   $0x8010996b
801022cb:	e8 7f 64 00 00       	call   8010874f <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801022d0:	8b 45 08             	mov    0x8(%ebp),%eax
801022d3:	8b 00                	mov    (%eax),%eax
801022d5:	83 e0 06             	and    $0x6,%eax
801022d8:	83 f8 02             	cmp    $0x2,%eax
801022db:	75 0d                	jne    801022ea <iderw+0x39>
    panic("iderw: nothing to do");
801022dd:	83 ec 0c             	sub    $0xc,%esp
801022e0:	68 7f 99 10 80       	push   $0x8010997f
801022e5:	e8 65 64 00 00       	call   8010874f <panic>
  if(b->dev != 0 && !havedisk1)
801022ea:	8b 45 08             	mov    0x8(%ebp),%eax
801022ed:	8b 40 04             	mov    0x4(%eax),%eax
801022f0:	85 c0                	test   %eax,%eax
801022f2:	74 16                	je     8010230a <iderw+0x59>
801022f4:	a1 f8 c6 10 80       	mov    0x8010c6f8,%eax
801022f9:	85 c0                	test   %eax,%eax
801022fb:	75 0d                	jne    8010230a <iderw+0x59>
    panic("iderw: ide disk 1 not present");
801022fd:	83 ec 0c             	sub    $0xc,%esp
80102300:	68 94 99 10 80       	push   $0x80109994
80102305:	e8 45 64 00 00       	call   8010874f <panic>

  acquire(&idelock);  //DOC:acquire-lock
8010230a:	83 ec 0c             	sub    $0xc,%esp
8010230d:	68 c0 c6 10 80       	push   $0x8010c6c0
80102312:	e8 f5 22 00 00       	call   8010460c <acquire>
80102317:	83 c4 10             	add    $0x10,%esp

  // Append b to idequeue.
  b->qnext = 0;
8010231a:	8b 45 08             	mov    0x8(%ebp),%eax
8010231d:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102324:	c7 45 f4 f4 c6 10 80 	movl   $0x8010c6f4,-0xc(%ebp)
8010232b:	eb 0b                	jmp    80102338 <iderw+0x87>
8010232d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102330:	8b 00                	mov    (%eax),%eax
80102332:	83 c0 14             	add    $0x14,%eax
80102335:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102338:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010233b:	8b 00                	mov    (%eax),%eax
8010233d:	85 c0                	test   %eax,%eax
8010233f:	75 ec                	jne    8010232d <iderw+0x7c>
    ;
  *pp = b;
80102341:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102344:	8b 55 08             	mov    0x8(%ebp),%edx
80102347:	89 10                	mov    %edx,(%eax)
  
  // Start disk if necessary.
  if(idequeue == b)
80102349:	a1 f4 c6 10 80       	mov    0x8010c6f4,%eax
8010234e:	3b 45 08             	cmp    0x8(%ebp),%eax
80102351:	75 23                	jne    80102376 <iderw+0xc5>
    idestart(b);
80102353:	83 ec 0c             	sub    $0xc,%esp
80102356:	ff 75 08             	pushl  0x8(%ebp)
80102359:	e8 5c fd ff ff       	call   801020ba <idestart>
8010235e:	83 c4 10             	add    $0x10,%esp
  
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80102361:	eb 13                	jmp    80102376 <iderw+0xc5>
    sleep(b, &idelock);
80102363:	83 ec 08             	sub    $0x8,%esp
80102366:	68 c0 c6 10 80       	push   $0x8010c6c0
8010236b:	ff 75 08             	pushl  0x8(%ebp)
8010236e:	e8 a0 1f 00 00       	call   80104313 <sleep>
80102373:	83 c4 10             	add    $0x10,%esp
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
  
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80102376:	8b 45 08             	mov    0x8(%ebp),%eax
80102379:	8b 00                	mov    (%eax),%eax
8010237b:	83 e0 06             	and    $0x6,%eax
8010237e:	83 f8 02             	cmp    $0x2,%eax
80102381:	75 e0                	jne    80102363 <iderw+0xb2>
    sleep(b, &idelock);
  }

  release(&idelock);
80102383:	83 ec 0c             	sub    $0xc,%esp
80102386:	68 c0 c6 10 80       	push   $0x8010c6c0
8010238b:	e8 e3 22 00 00       	call   80104673 <release>
80102390:	83 c4 10             	add    $0x10,%esp
}
80102393:	90                   	nop
80102394:	c9                   	leave  
80102395:	c3                   	ret    

80102396 <ioapicread>:
  uint data;
};

static uint
ioapicread(int reg)
{
80102396:	55                   	push   %ebp
80102397:	89 e5                	mov    %esp,%ebp
  ioapic->reg = reg;
80102399:	a1 b4 08 11 80       	mov    0x801108b4,%eax
8010239e:	8b 55 08             	mov    0x8(%ebp),%edx
801023a1:	89 10                	mov    %edx,(%eax)
  return ioapic->data;
801023a3:	a1 b4 08 11 80       	mov    0x801108b4,%eax
801023a8:	8b 40 10             	mov    0x10(%eax),%eax
}
801023ab:	5d                   	pop    %ebp
801023ac:	c3                   	ret    

801023ad <ioapicwrite>:

static void
ioapicwrite(int reg, uint data)
{
801023ad:	55                   	push   %ebp
801023ae:	89 e5                	mov    %esp,%ebp
  ioapic->reg = reg;
801023b0:	a1 b4 08 11 80       	mov    0x801108b4,%eax
801023b5:	8b 55 08             	mov    0x8(%ebp),%edx
801023b8:	89 10                	mov    %edx,(%eax)
  ioapic->data = data;
801023ba:	a1 b4 08 11 80       	mov    0x801108b4,%eax
801023bf:	8b 55 0c             	mov    0xc(%ebp),%edx
801023c2:	89 50 10             	mov    %edx,0x10(%eax)
}
801023c5:	90                   	nop
801023c6:	5d                   	pop    %ebp
801023c7:	c3                   	ret    

801023c8 <ioapicinit>:

void
ioapicinit(void)
{
801023c8:	55                   	push   %ebp
801023c9:	89 e5                	mov    %esp,%ebp
801023cb:	83 ec 18             	sub    $0x18,%esp
  int i, id, maxintr;

  if(!ismp)
801023ce:	a1 84 09 11 80       	mov    0x80110984,%eax
801023d3:	85 c0                	test   %eax,%eax
801023d5:	0f 84 a0 00 00 00    	je     8010247b <ioapicinit+0xb3>
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
801023db:	c7 05 b4 08 11 80 00 	movl   $0xfec00000,0x801108b4
801023e2:	00 c0 fe 
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
801023e5:	6a 01                	push   $0x1
801023e7:	e8 aa ff ff ff       	call   80102396 <ioapicread>
801023ec:	83 c4 04             	add    $0x4,%esp
801023ef:	c1 e8 10             	shr    $0x10,%eax
801023f2:	25 ff 00 00 00       	and    $0xff,%eax
801023f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  id = ioapicread(REG_ID) >> 24;
801023fa:	6a 00                	push   $0x0
801023fc:	e8 95 ff ff ff       	call   80102396 <ioapicread>
80102401:	83 c4 04             	add    $0x4,%esp
80102404:	c1 e8 18             	shr    $0x18,%eax
80102407:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(id != ioapicid)
8010240a:	0f b6 05 80 09 11 80 	movzbl 0x80110980,%eax
80102411:	0f b6 c0             	movzbl %al,%eax
80102414:	3b 45 ec             	cmp    -0x14(%ebp),%eax
80102417:	74 10                	je     80102429 <ioapicinit+0x61>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102419:	83 ec 0c             	sub    $0xc,%esp
8010241c:	68 b4 99 10 80       	push   $0x801099b4
80102421:	e8 7f 5f 00 00       	call   801083a5 <cprintf>
80102426:	83 c4 10             	add    $0x10,%esp

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
80102429:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80102430:	eb 3f                	jmp    80102471 <ioapicinit+0xa9>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102432:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102435:	83 c0 20             	add    $0x20,%eax
80102438:	0d 00 00 01 00       	or     $0x10000,%eax
8010243d:	89 c2                	mov    %eax,%edx
8010243f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102442:	83 c0 08             	add    $0x8,%eax
80102445:	01 c0                	add    %eax,%eax
80102447:	83 ec 08             	sub    $0x8,%esp
8010244a:	52                   	push   %edx
8010244b:	50                   	push   %eax
8010244c:	e8 5c ff ff ff       	call   801023ad <ioapicwrite>
80102451:	83 c4 10             	add    $0x10,%esp
    ioapicwrite(REG_TABLE+2*i+1, 0);
80102454:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102457:	83 c0 08             	add    $0x8,%eax
8010245a:	01 c0                	add    %eax,%eax
8010245c:	83 c0 01             	add    $0x1,%eax
8010245f:	83 ec 08             	sub    $0x8,%esp
80102462:	6a 00                	push   $0x0
80102464:	50                   	push   %eax
80102465:	e8 43 ff ff ff       	call   801023ad <ioapicwrite>
8010246a:	83 c4 10             	add    $0x10,%esp
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010246d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80102471:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102474:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80102477:	7e b9                	jle    80102432 <ioapicinit+0x6a>
80102479:	eb 01                	jmp    8010247c <ioapicinit+0xb4>
ioapicinit(void)
{
  int i, id, maxintr;

  if(!ismp)
    return;
8010247b:	90                   	nop
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010247c:	c9                   	leave  
8010247d:	c3                   	ret    

8010247e <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
8010247e:	55                   	push   %ebp
8010247f:	89 e5                	mov    %esp,%ebp
  if(!ismp)
80102481:	a1 84 09 11 80       	mov    0x80110984,%eax
80102486:	85 c0                	test   %eax,%eax
80102488:	74 39                	je     801024c3 <ioapicenable+0x45>
    return;

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
8010248a:	8b 45 08             	mov    0x8(%ebp),%eax
8010248d:	83 c0 20             	add    $0x20,%eax
80102490:	89 c2                	mov    %eax,%edx
80102492:	8b 45 08             	mov    0x8(%ebp),%eax
80102495:	83 c0 08             	add    $0x8,%eax
80102498:	01 c0                	add    %eax,%eax
8010249a:	52                   	push   %edx
8010249b:	50                   	push   %eax
8010249c:	e8 0c ff ff ff       	call   801023ad <ioapicwrite>
801024a1:	83 c4 08             	add    $0x8,%esp
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801024a4:	8b 45 0c             	mov    0xc(%ebp),%eax
801024a7:	c1 e0 18             	shl    $0x18,%eax
801024aa:	89 c2                	mov    %eax,%edx
801024ac:	8b 45 08             	mov    0x8(%ebp),%eax
801024af:	83 c0 08             	add    $0x8,%eax
801024b2:	01 c0                	add    %eax,%eax
801024b4:	83 c0 01             	add    $0x1,%eax
801024b7:	52                   	push   %edx
801024b8:	50                   	push   %eax
801024b9:	e8 ef fe ff ff       	call   801023ad <ioapicwrite>
801024be:	83 c4 08             	add    $0x8,%esp
801024c1:	eb 01                	jmp    801024c4 <ioapicenable+0x46>

void
ioapicenable(int irq, int cpunum)
{
  if(!ismp)
    return;
801024c3:	90                   	nop
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
801024c4:	c9                   	leave  
801024c5:	c3                   	ret    

801024c6 <v2p>:
#define KERNBASE 0x80000000         // First kernel virtual address
#define KERNLINK (KERNBASE+EXTMEM)  // Address where kernel is linked

#ifndef __ASSEMBLER__

static inline uint v2p(void *a) { return ((uint) (a))  - KERNBASE; }
801024c6:	55                   	push   %ebp
801024c7:	89 e5                	mov    %esp,%ebp
801024c9:	8b 45 08             	mov    0x8(%ebp),%eax
801024cc:	05 00 00 00 80       	add    $0x80000000,%eax
801024d1:	5d                   	pop    %ebp
801024d2:	c3                   	ret    

801024d3 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
801024d3:	55                   	push   %ebp
801024d4:	89 e5                	mov    %esp,%ebp
801024d6:	83 ec 08             	sub    $0x8,%esp
  initlock(&kmem.lock, "kmem");
801024d9:	83 ec 08             	sub    $0x8,%esp
801024dc:	68 e6 99 10 80       	push   $0x801099e6
801024e1:	68 c0 08 11 80       	push   $0x801108c0
801024e6:	e8 ff 20 00 00       	call   801045ea <initlock>
801024eb:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 0;
801024ee:	c7 05 f4 08 11 80 00 	movl   $0x0,0x801108f4
801024f5:	00 00 00 
  freerange(vstart, vend);
801024f8:	83 ec 08             	sub    $0x8,%esp
801024fb:	ff 75 0c             	pushl  0xc(%ebp)
801024fe:	ff 75 08             	pushl  0x8(%ebp)
80102501:	e8 2a 00 00 00       	call   80102530 <freerange>
80102506:	83 c4 10             	add    $0x10,%esp
}
80102509:	90                   	nop
8010250a:	c9                   	leave  
8010250b:	c3                   	ret    

8010250c <kinit2>:

void
kinit2(void *vstart, void *vend)
{
8010250c:	55                   	push   %ebp
8010250d:	89 e5                	mov    %esp,%ebp
8010250f:	83 ec 08             	sub    $0x8,%esp
  freerange(vstart, vend);
80102512:	83 ec 08             	sub    $0x8,%esp
80102515:	ff 75 0c             	pushl  0xc(%ebp)
80102518:	ff 75 08             	pushl  0x8(%ebp)
8010251b:	e8 10 00 00 00       	call   80102530 <freerange>
80102520:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 1;
80102523:	c7 05 f4 08 11 80 01 	movl   $0x1,0x801108f4
8010252a:	00 00 00 
}
8010252d:	90                   	nop
8010252e:	c9                   	leave  
8010252f:	c3                   	ret    

80102530 <freerange>:

void
freerange(void *vstart, void *vend)
{
80102530:	55                   	push   %ebp
80102531:	89 e5                	mov    %esp,%ebp
80102533:	83 ec 18             	sub    $0x18,%esp
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102536:	8b 45 08             	mov    0x8(%ebp),%eax
80102539:	05 ff 0f 00 00       	add    $0xfff,%eax
8010253e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80102543:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102546:	eb 15                	jmp    8010255d <freerange+0x2d>
    kfree(p);
80102548:	83 ec 0c             	sub    $0xc,%esp
8010254b:	ff 75 f4             	pushl  -0xc(%ebp)
8010254e:	e8 1a 00 00 00       	call   8010256d <kfree>
80102553:	83 c4 10             	add    $0x10,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102556:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
8010255d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102560:	05 00 10 00 00       	add    $0x1000,%eax
80102565:	3b 45 0c             	cmp    0xc(%ebp),%eax
80102568:	76 de                	jbe    80102548 <freerange+0x18>
    kfree(p);
}
8010256a:	90                   	nop
8010256b:	c9                   	leave  
8010256c:	c3                   	ret    

8010256d <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
8010256d:	55                   	push   %ebp
8010256e:	89 e5                	mov    %esp,%ebp
80102570:	83 ec 18             	sub    $0x18,%esp
  struct run *r;

  if((uint)v % PGSIZE || v < end || v2p(v) >= PHYSTOP)
80102573:	8b 45 08             	mov    0x8(%ebp),%eax
80102576:	25 ff 0f 00 00       	and    $0xfff,%eax
8010257b:	85 c0                	test   %eax,%eax
8010257d:	75 1b                	jne    8010259a <kfree+0x2d>
8010257f:	81 7d 08 60 3b 11 80 	cmpl   $0x80113b60,0x8(%ebp)
80102586:	72 12                	jb     8010259a <kfree+0x2d>
80102588:	ff 75 08             	pushl  0x8(%ebp)
8010258b:	e8 36 ff ff ff       	call   801024c6 <v2p>
80102590:	83 c4 04             	add    $0x4,%esp
80102593:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102598:	76 0d                	jbe    801025a7 <kfree+0x3a>
    panic("kfree");
8010259a:	83 ec 0c             	sub    $0xc,%esp
8010259d:	68 eb 99 10 80       	push   $0x801099eb
801025a2:	e8 a8 61 00 00       	call   8010874f <panic>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
801025a7:	83 ec 04             	sub    $0x4,%esp
801025aa:	68 00 10 00 00       	push   $0x1000
801025af:	6a 01                	push   $0x1
801025b1:	ff 75 08             	pushl  0x8(%ebp)
801025b4:	e8 b6 22 00 00       	call   8010486f <memset>
801025b9:	83 c4 10             	add    $0x10,%esp

  if(kmem.use_lock)
801025bc:	a1 f4 08 11 80       	mov    0x801108f4,%eax
801025c1:	85 c0                	test   %eax,%eax
801025c3:	74 10                	je     801025d5 <kfree+0x68>
    acquire(&kmem.lock);
801025c5:	83 ec 0c             	sub    $0xc,%esp
801025c8:	68 c0 08 11 80       	push   $0x801108c0
801025cd:	e8 3a 20 00 00       	call   8010460c <acquire>
801025d2:	83 c4 10             	add    $0x10,%esp
  r = (struct run*)v;
801025d5:	8b 45 08             	mov    0x8(%ebp),%eax
801025d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  r->next = kmem.freelist;
801025db:	8b 15 f8 08 11 80    	mov    0x801108f8,%edx
801025e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801025e4:	89 10                	mov    %edx,(%eax)
  kmem.freelist = r;
801025e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801025e9:	a3 f8 08 11 80       	mov    %eax,0x801108f8
  if(kmem.use_lock)
801025ee:	a1 f4 08 11 80       	mov    0x801108f4,%eax
801025f3:	85 c0                	test   %eax,%eax
801025f5:	74 10                	je     80102607 <kfree+0x9a>
    release(&kmem.lock);
801025f7:	83 ec 0c             	sub    $0xc,%esp
801025fa:	68 c0 08 11 80       	push   $0x801108c0
801025ff:	e8 6f 20 00 00       	call   80104673 <release>
80102604:	83 c4 10             	add    $0x10,%esp
}
80102607:	90                   	nop
80102608:	c9                   	leave  
80102609:	c3                   	ret    

8010260a <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
8010260a:	55                   	push   %ebp
8010260b:	89 e5                	mov    %esp,%ebp
8010260d:	83 ec 18             	sub    $0x18,%esp
  struct run *r;

  if(kmem.use_lock)
80102610:	a1 f4 08 11 80       	mov    0x801108f4,%eax
80102615:	85 c0                	test   %eax,%eax
80102617:	74 10                	je     80102629 <kalloc+0x1f>
    acquire(&kmem.lock);
80102619:	83 ec 0c             	sub    $0xc,%esp
8010261c:	68 c0 08 11 80       	push   $0x801108c0
80102621:	e8 e6 1f 00 00       	call   8010460c <acquire>
80102626:	83 c4 10             	add    $0x10,%esp
  r = kmem.freelist;
80102629:	a1 f8 08 11 80       	mov    0x801108f8,%eax
8010262e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(r)
80102631:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80102635:	74 0a                	je     80102641 <kalloc+0x37>
    kmem.freelist = r->next;
80102637:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010263a:	8b 00                	mov    (%eax),%eax
8010263c:	a3 f8 08 11 80       	mov    %eax,0x801108f8
  if(kmem.use_lock)
80102641:	a1 f4 08 11 80       	mov    0x801108f4,%eax
80102646:	85 c0                	test   %eax,%eax
80102648:	74 10                	je     8010265a <kalloc+0x50>
    release(&kmem.lock);
8010264a:	83 ec 0c             	sub    $0xc,%esp
8010264d:	68 c0 08 11 80       	push   $0x801108c0
80102652:	e8 1c 20 00 00       	call   80104673 <release>
80102657:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
8010265a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
8010265d:	c9                   	leave  
8010265e:	c3                   	ret    

8010265f <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
8010265f:	55                   	push   %ebp
80102660:	89 e5                	mov    %esp,%ebp
80102662:	83 ec 14             	sub    $0x14,%esp
80102665:	8b 45 08             	mov    0x8(%ebp),%eax
80102668:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010266c:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
80102670:	89 c2                	mov    %eax,%edx
80102672:	ec                   	in     (%dx),%al
80102673:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
80102676:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
8010267a:	c9                   	leave  
8010267b:	c3                   	ret    

8010267c <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
8010267c:	55                   	push   %ebp
8010267d:	89 e5                	mov    %esp,%ebp
8010267f:	83 ec 10             	sub    $0x10,%esp
  static uchar *charcode[4] = {
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
80102682:	6a 64                	push   $0x64
80102684:	e8 d6 ff ff ff       	call   8010265f <inb>
80102689:	83 c4 04             	add    $0x4,%esp
8010268c:	0f b6 c0             	movzbl %al,%eax
8010268f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((st & KBS_DIB) == 0)
80102692:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102695:	83 e0 01             	and    $0x1,%eax
80102698:	85 c0                	test   %eax,%eax
8010269a:	75 0a                	jne    801026a6 <kbdgetc+0x2a>
    return -1;
8010269c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801026a1:	e9 23 01 00 00       	jmp    801027c9 <kbdgetc+0x14d>
  data = inb(KBDATAP);
801026a6:	6a 60                	push   $0x60
801026a8:	e8 b2 ff ff ff       	call   8010265f <inb>
801026ad:	83 c4 04             	add    $0x4,%esp
801026b0:	0f b6 c0             	movzbl %al,%eax
801026b3:	89 45 fc             	mov    %eax,-0x4(%ebp)

  if(data == 0xE0){
801026b6:	81 7d fc e0 00 00 00 	cmpl   $0xe0,-0x4(%ebp)
801026bd:	75 17                	jne    801026d6 <kbdgetc+0x5a>
    shift |= E0ESC;
801026bf:	a1 fc c6 10 80       	mov    0x8010c6fc,%eax
801026c4:	83 c8 40             	or     $0x40,%eax
801026c7:	a3 fc c6 10 80       	mov    %eax,0x8010c6fc
    return 0;
801026cc:	b8 00 00 00 00       	mov    $0x0,%eax
801026d1:	e9 f3 00 00 00       	jmp    801027c9 <kbdgetc+0x14d>
  } else if(data & 0x80){
801026d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
801026d9:	25 80 00 00 00       	and    $0x80,%eax
801026de:	85 c0                	test   %eax,%eax
801026e0:	74 45                	je     80102727 <kbdgetc+0xab>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
801026e2:	a1 fc c6 10 80       	mov    0x8010c6fc,%eax
801026e7:	83 e0 40             	and    $0x40,%eax
801026ea:	85 c0                	test   %eax,%eax
801026ec:	75 08                	jne    801026f6 <kbdgetc+0x7a>
801026ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
801026f1:	83 e0 7f             	and    $0x7f,%eax
801026f4:	eb 03                	jmp    801026f9 <kbdgetc+0x7d>
801026f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
801026f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    shift &= ~(shiftcode[data] | E0ESC);
801026fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
801026ff:	05 00 a0 10 80       	add    $0x8010a000,%eax
80102704:	0f b6 00             	movzbl (%eax),%eax
80102707:	83 c8 40             	or     $0x40,%eax
8010270a:	0f b6 c0             	movzbl %al,%eax
8010270d:	f7 d0                	not    %eax
8010270f:	89 c2                	mov    %eax,%edx
80102711:	a1 fc c6 10 80       	mov    0x8010c6fc,%eax
80102716:	21 d0                	and    %edx,%eax
80102718:	a3 fc c6 10 80       	mov    %eax,0x8010c6fc
    return 0;
8010271d:	b8 00 00 00 00       	mov    $0x0,%eax
80102722:	e9 a2 00 00 00       	jmp    801027c9 <kbdgetc+0x14d>
  } else if(shift & E0ESC){
80102727:	a1 fc c6 10 80       	mov    0x8010c6fc,%eax
8010272c:	83 e0 40             	and    $0x40,%eax
8010272f:	85 c0                	test   %eax,%eax
80102731:	74 14                	je     80102747 <kbdgetc+0xcb>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102733:	81 4d fc 80 00 00 00 	orl    $0x80,-0x4(%ebp)
    shift &= ~E0ESC;
8010273a:	a1 fc c6 10 80       	mov    0x8010c6fc,%eax
8010273f:	83 e0 bf             	and    $0xffffffbf,%eax
80102742:	a3 fc c6 10 80       	mov    %eax,0x8010c6fc
  }

  shift |= shiftcode[data];
80102747:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010274a:	05 00 a0 10 80       	add    $0x8010a000,%eax
8010274f:	0f b6 00             	movzbl (%eax),%eax
80102752:	0f b6 d0             	movzbl %al,%edx
80102755:	a1 fc c6 10 80       	mov    0x8010c6fc,%eax
8010275a:	09 d0                	or     %edx,%eax
8010275c:	a3 fc c6 10 80       	mov    %eax,0x8010c6fc
  shift ^= togglecode[data];
80102761:	8b 45 fc             	mov    -0x4(%ebp),%eax
80102764:	05 00 a1 10 80       	add    $0x8010a100,%eax
80102769:	0f b6 00             	movzbl (%eax),%eax
8010276c:	0f b6 d0             	movzbl %al,%edx
8010276f:	a1 fc c6 10 80       	mov    0x8010c6fc,%eax
80102774:	31 d0                	xor    %edx,%eax
80102776:	a3 fc c6 10 80       	mov    %eax,0x8010c6fc
  c = charcode[shift & (CTL | SHIFT)][data];
8010277b:	a1 fc c6 10 80       	mov    0x8010c6fc,%eax
80102780:	83 e0 03             	and    $0x3,%eax
80102783:	8b 14 85 00 a5 10 80 	mov    -0x7fef5b00(,%eax,4),%edx
8010278a:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010278d:	01 d0                	add    %edx,%eax
8010278f:	0f b6 00             	movzbl (%eax),%eax
80102792:	0f b6 c0             	movzbl %al,%eax
80102795:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if(shift & CAPSLOCK){
80102798:	a1 fc c6 10 80       	mov    0x8010c6fc,%eax
8010279d:	83 e0 08             	and    $0x8,%eax
801027a0:	85 c0                	test   %eax,%eax
801027a2:	74 22                	je     801027c6 <kbdgetc+0x14a>
    if('a' <= c && c <= 'z')
801027a4:	83 7d f8 60          	cmpl   $0x60,-0x8(%ebp)
801027a8:	76 0c                	jbe    801027b6 <kbdgetc+0x13a>
801027aa:	83 7d f8 7a          	cmpl   $0x7a,-0x8(%ebp)
801027ae:	77 06                	ja     801027b6 <kbdgetc+0x13a>
      c += 'A' - 'a';
801027b0:	83 6d f8 20          	subl   $0x20,-0x8(%ebp)
801027b4:	eb 10                	jmp    801027c6 <kbdgetc+0x14a>
    else if('A' <= c && c <= 'Z')
801027b6:	83 7d f8 40          	cmpl   $0x40,-0x8(%ebp)
801027ba:	76 0a                	jbe    801027c6 <kbdgetc+0x14a>
801027bc:	83 7d f8 5a          	cmpl   $0x5a,-0x8(%ebp)
801027c0:	77 04                	ja     801027c6 <kbdgetc+0x14a>
      c += 'a' - 'A';
801027c2:	83 45 f8 20          	addl   $0x20,-0x8(%ebp)
  }
  return c;
801027c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
801027c9:	c9                   	leave  
801027ca:	c3                   	ret    

801027cb <kbdintr>:

void
kbdintr(void)
{
801027cb:	55                   	push   %ebp
801027cc:	89 e5                	mov    %esp,%ebp
801027ce:	83 ec 08             	sub    $0x8,%esp
  consoleintr(kbdgetc);
801027d1:	83 ec 0c             	sub    $0xc,%esp
801027d4:	68 7c 26 10 80       	push   $0x8010267c
801027d9:	e8 be 66 00 00       	call   80108e9c <consoleintr>
801027de:	83 c4 10             	add    $0x10,%esp
}
801027e1:	90                   	nop
801027e2:	c9                   	leave  
801027e3:	c3                   	ret    

801027e4 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
801027e4:	55                   	push   %ebp
801027e5:	89 e5                	mov    %esp,%ebp
801027e7:	83 ec 08             	sub    $0x8,%esp
801027ea:	8b 55 08             	mov    0x8(%ebp),%edx
801027ed:	8b 45 0c             	mov    0xc(%ebp),%eax
801027f0:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
801027f4:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027f7:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
801027fb:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
801027ff:	ee                   	out    %al,(%dx)
}
80102800:	90                   	nop
80102801:	c9                   	leave  
80102802:	c3                   	ret    

80102803 <readeflags>:
  asm volatile("ltr %0" : : "r" (sel));
}

static inline uint
readeflags(void)
{
80102803:	55                   	push   %ebp
80102804:	89 e5                	mov    %esp,%ebp
80102806:	83 ec 10             	sub    $0x10,%esp
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80102809:	9c                   	pushf  
8010280a:	58                   	pop    %eax
8010280b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return eflags;
8010280e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80102811:	c9                   	leave  
80102812:	c3                   	ret    

80102813 <lapicw>:

volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
80102813:	55                   	push   %ebp
80102814:	89 e5                	mov    %esp,%ebp
  lapic[index] = value;
80102816:	a1 fc 08 11 80       	mov    0x801108fc,%eax
8010281b:	8b 55 08             	mov    0x8(%ebp),%edx
8010281e:	c1 e2 02             	shl    $0x2,%edx
80102821:	01 c2                	add    %eax,%edx
80102823:	8b 45 0c             	mov    0xc(%ebp),%eax
80102826:	89 02                	mov    %eax,(%edx)
  lapic[ID];  // wait for write to finish, by reading
80102828:	a1 fc 08 11 80       	mov    0x801108fc,%eax
8010282d:	83 c0 20             	add    $0x20,%eax
80102830:	8b 00                	mov    (%eax),%eax
}
80102832:	90                   	nop
80102833:	5d                   	pop    %ebp
80102834:	c3                   	ret    

80102835 <lapicinit>:
//PAGEBREAK!

void
lapicinit(void)
{
80102835:	55                   	push   %ebp
80102836:	89 e5                	mov    %esp,%ebp
  if(!lapic) 
80102838:	a1 fc 08 11 80       	mov    0x801108fc,%eax
8010283d:	85 c0                	test   %eax,%eax
8010283f:	0f 84 0b 01 00 00    	je     80102950 <lapicinit+0x11b>
    return;

  // Enable local APIC; set spurious interrupt vector.
  lapicw(SVR, ENABLE | (T_IRQ0 + IRQ_SPURIOUS));
80102845:	68 3f 01 00 00       	push   $0x13f
8010284a:	6a 3c                	push   $0x3c
8010284c:	e8 c2 ff ff ff       	call   80102813 <lapicw>
80102851:	83 c4 08             	add    $0x8,%esp

  // The timer repeatedly counts down at bus frequency
  // from lapic[TICR] and then issues an interrupt.  
  // If xv6 cared more about precise timekeeping,
  // TICR would be calibrated using an external time source.
  lapicw(TDCR, X1);
80102854:	6a 0b                	push   $0xb
80102856:	68 f8 00 00 00       	push   $0xf8
8010285b:	e8 b3 ff ff ff       	call   80102813 <lapicw>
80102860:	83 c4 08             	add    $0x8,%esp
  lapicw(TIMER, PERIODIC | (T_IRQ0 + IRQ_TIMER));
80102863:	68 20 00 02 00       	push   $0x20020
80102868:	68 c8 00 00 00       	push   $0xc8
8010286d:	e8 a1 ff ff ff       	call   80102813 <lapicw>
80102872:	83 c4 08             	add    $0x8,%esp
  lapicw(TICR, 10000000); 
80102875:	68 80 96 98 00       	push   $0x989680
8010287a:	68 e0 00 00 00       	push   $0xe0
8010287f:	e8 8f ff ff ff       	call   80102813 <lapicw>
80102884:	83 c4 08             	add    $0x8,%esp

  // Disable logical interrupt lines.
  lapicw(LINT0, MASKED);
80102887:	68 00 00 01 00       	push   $0x10000
8010288c:	68 d4 00 00 00       	push   $0xd4
80102891:	e8 7d ff ff ff       	call   80102813 <lapicw>
80102896:	83 c4 08             	add    $0x8,%esp
  lapicw(LINT1, MASKED);
80102899:	68 00 00 01 00       	push   $0x10000
8010289e:	68 d8 00 00 00       	push   $0xd8
801028a3:	e8 6b ff ff ff       	call   80102813 <lapicw>
801028a8:	83 c4 08             	add    $0x8,%esp

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801028ab:	a1 fc 08 11 80       	mov    0x801108fc,%eax
801028b0:	83 c0 30             	add    $0x30,%eax
801028b3:	8b 00                	mov    (%eax),%eax
801028b5:	c1 e8 10             	shr    $0x10,%eax
801028b8:	0f b6 c0             	movzbl %al,%eax
801028bb:	83 f8 03             	cmp    $0x3,%eax
801028be:	76 12                	jbe    801028d2 <lapicinit+0x9d>
    lapicw(PCINT, MASKED);
801028c0:	68 00 00 01 00       	push   $0x10000
801028c5:	68 d0 00 00 00       	push   $0xd0
801028ca:	e8 44 ff ff ff       	call   80102813 <lapicw>
801028cf:	83 c4 08             	add    $0x8,%esp

  // Map error interrupt to IRQ_ERROR.
  lapicw(ERROR, T_IRQ0 + IRQ_ERROR);
801028d2:	6a 33                	push   $0x33
801028d4:	68 dc 00 00 00       	push   $0xdc
801028d9:	e8 35 ff ff ff       	call   80102813 <lapicw>
801028de:	83 c4 08             	add    $0x8,%esp

  // Clear error status register (requires back-to-back writes).
  lapicw(ESR, 0);
801028e1:	6a 00                	push   $0x0
801028e3:	68 a0 00 00 00       	push   $0xa0
801028e8:	e8 26 ff ff ff       	call   80102813 <lapicw>
801028ed:	83 c4 08             	add    $0x8,%esp
  lapicw(ESR, 0);
801028f0:	6a 00                	push   $0x0
801028f2:	68 a0 00 00 00       	push   $0xa0
801028f7:	e8 17 ff ff ff       	call   80102813 <lapicw>
801028fc:	83 c4 08             	add    $0x8,%esp

  // Ack any outstanding interrupts.
  lapicw(EOI, 0);
801028ff:	6a 00                	push   $0x0
80102901:	6a 2c                	push   $0x2c
80102903:	e8 0b ff ff ff       	call   80102813 <lapicw>
80102908:	83 c4 08             	add    $0x8,%esp

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
8010290b:	6a 00                	push   $0x0
8010290d:	68 c4 00 00 00       	push   $0xc4
80102912:	e8 fc fe ff ff       	call   80102813 <lapicw>
80102917:	83 c4 08             	add    $0x8,%esp
  lapicw(ICRLO, BCAST | INIT | LEVEL);
8010291a:	68 00 85 08 00       	push   $0x88500
8010291f:	68 c0 00 00 00       	push   $0xc0
80102924:	e8 ea fe ff ff       	call   80102813 <lapicw>
80102929:	83 c4 08             	add    $0x8,%esp
  while(lapic[ICRLO] & DELIVS)
8010292c:	90                   	nop
8010292d:	a1 fc 08 11 80       	mov    0x801108fc,%eax
80102932:	05 00 03 00 00       	add    $0x300,%eax
80102937:	8b 00                	mov    (%eax),%eax
80102939:	25 00 10 00 00       	and    $0x1000,%eax
8010293e:	85 c0                	test   %eax,%eax
80102940:	75 eb                	jne    8010292d <lapicinit+0xf8>
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
80102942:	6a 00                	push   $0x0
80102944:	6a 20                	push   $0x20
80102946:	e8 c8 fe ff ff       	call   80102813 <lapicw>
8010294b:	83 c4 08             	add    $0x8,%esp
8010294e:	eb 01                	jmp    80102951 <lapicinit+0x11c>

void
lapicinit(void)
{
  if(!lapic) 
    return;
80102950:	90                   	nop
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102951:	c9                   	leave  
80102952:	c3                   	ret    

80102953 <cpunum>:

int
cpunum(void)
{
80102953:	55                   	push   %ebp
80102954:	89 e5                	mov    %esp,%ebp
80102956:	83 ec 08             	sub    $0x8,%esp
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
80102959:	e8 a5 fe ff ff       	call   80102803 <readeflags>
8010295e:	25 00 02 00 00       	and    $0x200,%eax
80102963:	85 c0                	test   %eax,%eax
80102965:	74 26                	je     8010298d <cpunum+0x3a>
    static int n;
    if(n++ == 0)
80102967:	a1 00 c7 10 80       	mov    0x8010c700,%eax
8010296c:	8d 50 01             	lea    0x1(%eax),%edx
8010296f:	89 15 00 c7 10 80    	mov    %edx,0x8010c700
80102975:	85 c0                	test   %eax,%eax
80102977:	75 14                	jne    8010298d <cpunum+0x3a>
      cprintf("cpu called from %x with interrupts enabled\n",
80102979:	8b 45 04             	mov    0x4(%ebp),%eax
8010297c:	83 ec 08             	sub    $0x8,%esp
8010297f:	50                   	push   %eax
80102980:	68 f4 99 10 80       	push   $0x801099f4
80102985:	e8 1b 5a 00 00       	call   801083a5 <cprintf>
8010298a:	83 c4 10             	add    $0x10,%esp
        __builtin_return_address(0));
  }

  if(lapic)
8010298d:	a1 fc 08 11 80       	mov    0x801108fc,%eax
80102992:	85 c0                	test   %eax,%eax
80102994:	74 0f                	je     801029a5 <cpunum+0x52>
    return lapic[ID]>>24;
80102996:	a1 fc 08 11 80       	mov    0x801108fc,%eax
8010299b:	83 c0 20             	add    $0x20,%eax
8010299e:	8b 00                	mov    (%eax),%eax
801029a0:	c1 e8 18             	shr    $0x18,%eax
801029a3:	eb 05                	jmp    801029aa <cpunum+0x57>
  return 0;
801029a5:	b8 00 00 00 00       	mov    $0x0,%eax
}
801029aa:	c9                   	leave  
801029ab:	c3                   	ret    

801029ac <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
801029ac:	55                   	push   %ebp
801029ad:	89 e5                	mov    %esp,%ebp
  if(lapic)
801029af:	a1 fc 08 11 80       	mov    0x801108fc,%eax
801029b4:	85 c0                	test   %eax,%eax
801029b6:	74 0c                	je     801029c4 <lapiceoi+0x18>
    lapicw(EOI, 0);
801029b8:	6a 00                	push   $0x0
801029ba:	6a 2c                	push   $0x2c
801029bc:	e8 52 fe ff ff       	call   80102813 <lapicw>
801029c1:	83 c4 08             	add    $0x8,%esp
}
801029c4:	90                   	nop
801029c5:	c9                   	leave  
801029c6:	c3                   	ret    

801029c7 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
801029c7:	55                   	push   %ebp
801029c8:	89 e5                	mov    %esp,%ebp
}
801029ca:	90                   	nop
801029cb:	5d                   	pop    %ebp
801029cc:	c3                   	ret    

801029cd <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
801029cd:	55                   	push   %ebp
801029ce:	89 e5                	mov    %esp,%ebp
801029d0:	83 ec 14             	sub    $0x14,%esp
801029d3:	8b 45 08             	mov    0x8(%ebp),%eax
801029d6:	88 45 ec             	mov    %al,-0x14(%ebp)
  ushort *wrv;
  
  // "The BSP must initialize CMOS shutdown code to 0AH
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(IO_RTC, 0xF);  // offset 0xF is shutdown code
801029d9:	6a 0f                	push   $0xf
801029db:	6a 70                	push   $0x70
801029dd:	e8 02 fe ff ff       	call   801027e4 <outb>
801029e2:	83 c4 08             	add    $0x8,%esp
  outb(IO_RTC+1, 0x0A);
801029e5:	6a 0a                	push   $0xa
801029e7:	6a 71                	push   $0x71
801029e9:	e8 f6 fd ff ff       	call   801027e4 <outb>
801029ee:	83 c4 08             	add    $0x8,%esp
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
801029f1:	c7 45 f8 67 04 00 80 	movl   $0x80000467,-0x8(%ebp)
  wrv[0] = 0;
801029f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
801029fb:	66 c7 00 00 00       	movw   $0x0,(%eax)
  wrv[1] = addr >> 4;
80102a00:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102a03:	83 c0 02             	add    $0x2,%eax
80102a06:	8b 55 0c             	mov    0xc(%ebp),%edx
80102a09:	c1 ea 04             	shr    $0x4,%edx
80102a0c:	66 89 10             	mov    %dx,(%eax)

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
80102a0f:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
80102a13:	c1 e0 18             	shl    $0x18,%eax
80102a16:	50                   	push   %eax
80102a17:	68 c4 00 00 00       	push   $0xc4
80102a1c:	e8 f2 fd ff ff       	call   80102813 <lapicw>
80102a21:	83 c4 08             	add    $0x8,%esp
  lapicw(ICRLO, INIT | LEVEL | ASSERT);
80102a24:	68 00 c5 00 00       	push   $0xc500
80102a29:	68 c0 00 00 00       	push   $0xc0
80102a2e:	e8 e0 fd ff ff       	call   80102813 <lapicw>
80102a33:	83 c4 08             	add    $0x8,%esp
  microdelay(200);
80102a36:	68 c8 00 00 00       	push   $0xc8
80102a3b:	e8 87 ff ff ff       	call   801029c7 <microdelay>
80102a40:	83 c4 04             	add    $0x4,%esp
  lapicw(ICRLO, INIT | LEVEL);
80102a43:	68 00 85 00 00       	push   $0x8500
80102a48:	68 c0 00 00 00       	push   $0xc0
80102a4d:	e8 c1 fd ff ff       	call   80102813 <lapicw>
80102a52:	83 c4 08             	add    $0x8,%esp
  microdelay(100);    // should be 10ms, but too slow in Bochs!
80102a55:	6a 64                	push   $0x64
80102a57:	e8 6b ff ff ff       	call   801029c7 <microdelay>
80102a5c:	83 c4 04             	add    $0x4,%esp
  // Send startup IPI (twice!) to enter code.
  // Regular hardware is supposed to only accept a STARTUP
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
80102a5f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
80102a66:	eb 3d                	jmp    80102aa5 <lapicstartap+0xd8>
    lapicw(ICRHI, apicid<<24);
80102a68:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
80102a6c:	c1 e0 18             	shl    $0x18,%eax
80102a6f:	50                   	push   %eax
80102a70:	68 c4 00 00 00       	push   $0xc4
80102a75:	e8 99 fd ff ff       	call   80102813 <lapicw>
80102a7a:	83 c4 08             	add    $0x8,%esp
    lapicw(ICRLO, STARTUP | (addr>>12));
80102a7d:	8b 45 0c             	mov    0xc(%ebp),%eax
80102a80:	c1 e8 0c             	shr    $0xc,%eax
80102a83:	80 cc 06             	or     $0x6,%ah
80102a86:	50                   	push   %eax
80102a87:	68 c0 00 00 00       	push   $0xc0
80102a8c:	e8 82 fd ff ff       	call   80102813 <lapicw>
80102a91:	83 c4 08             	add    $0x8,%esp
    microdelay(200);
80102a94:	68 c8 00 00 00       	push   $0xc8
80102a99:	e8 29 ff ff ff       	call   801029c7 <microdelay>
80102a9e:	83 c4 04             	add    $0x4,%esp
  // Send startup IPI (twice!) to enter code.
  // Regular hardware is supposed to only accept a STARTUP
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
80102aa1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80102aa5:	83 7d fc 01          	cmpl   $0x1,-0x4(%ebp)
80102aa9:	7e bd                	jle    80102a68 <lapicstartap+0x9b>
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
80102aab:	90                   	nop
80102aac:	c9                   	leave  
80102aad:	c3                   	ret    

80102aae <initlog>:

static void recover_from_log(void);

void
initlog(void)
{
80102aae:	55                   	push   %ebp
80102aaf:	89 e5                	mov    %esp,%ebp
80102ab1:	83 ec 18             	sub    $0x18,%esp
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102ab4:	83 ec 08             	sub    $0x8,%esp
80102ab7:	68 20 9a 10 80       	push   $0x80109a20
80102abc:	68 00 09 11 80       	push   $0x80110900
80102ac1:	e8 24 1b 00 00       	call   801045ea <initlock>
80102ac6:	83 c4 10             	add    $0x10,%esp
  readsb(ROOTDEV, &sb);
80102ac9:	83 ec 08             	sub    $0x8,%esp
80102acc:	8d 45 e8             	lea    -0x18(%ebp),%eax
80102acf:	50                   	push   %eax
80102ad0:	6a 01                	push   $0x1
80102ad2:	e8 01 e1 ff ff       	call   80100bd8 <readsb>
80102ad7:	83 c4 10             	add    $0x10,%esp
  log.start = sb.size - sb.nlog;
80102ada:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102add:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102ae0:	29 c2                	sub    %eax,%edx
80102ae2:	89 d0                	mov    %edx,%eax
80102ae4:	a3 34 09 11 80       	mov    %eax,0x80110934
  log.size = sb.nlog;
80102ae9:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102aec:	a3 38 09 11 80       	mov    %eax,0x80110938
  log.dev = ROOTDEV;
80102af1:	c7 05 40 09 11 80 01 	movl   $0x1,0x80110940
80102af8:	00 00 00 
  recover_from_log();
80102afb:	e8 b2 01 00 00       	call   80102cb2 <recover_from_log>
}
80102b00:	90                   	nop
80102b01:	c9                   	leave  
80102b02:	c3                   	ret    

80102b03 <install_trans>:

// Copy committed blocks from log to their home location
static void 
install_trans(void)
{
80102b03:	55                   	push   %ebp
80102b04:	89 e5                	mov    %esp,%ebp
80102b06:	83 ec 18             	sub    $0x18,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102b09:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80102b10:	e9 95 00 00 00       	jmp    80102baa <install_trans+0xa7>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102b15:	8b 15 34 09 11 80    	mov    0x80110934,%edx
80102b1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102b1e:	01 d0                	add    %edx,%eax
80102b20:	83 c0 01             	add    $0x1,%eax
80102b23:	89 c2                	mov    %eax,%edx
80102b25:	a1 40 09 11 80       	mov    0x80110940,%eax
80102b2a:	83 ec 08             	sub    $0x8,%esp
80102b2d:	52                   	push   %edx
80102b2e:	50                   	push   %eax
80102b2f:	e8 82 d6 ff ff       	call   801001b6 <bread>
80102b34:	83 c4 10             	add    $0x10,%esp
80102b37:	89 45 f0             	mov    %eax,-0x10(%ebp)
    struct buf *dbuf = bread(log.dev, log.lh.sector[tail]); // read dst
80102b3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102b3d:	83 c0 10             	add    $0x10,%eax
80102b40:	8b 04 85 08 09 11 80 	mov    -0x7feef6f8(,%eax,4),%eax
80102b47:	89 c2                	mov    %eax,%edx
80102b49:	a1 40 09 11 80       	mov    0x80110940,%eax
80102b4e:	83 ec 08             	sub    $0x8,%esp
80102b51:	52                   	push   %edx
80102b52:	50                   	push   %eax
80102b53:	e8 5e d6 ff ff       	call   801001b6 <bread>
80102b58:	83 c4 10             	add    $0x10,%esp
80102b5b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102b5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102b61:	8d 50 18             	lea    0x18(%eax),%edx
80102b64:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102b67:	83 c0 18             	add    $0x18,%eax
80102b6a:	83 ec 04             	sub    $0x4,%esp
80102b6d:	68 00 02 00 00       	push   $0x200
80102b72:	52                   	push   %edx
80102b73:	50                   	push   %eax
80102b74:	e8 b5 1d 00 00       	call   8010492e <memmove>
80102b79:	83 c4 10             	add    $0x10,%esp
    bwrite(dbuf);  // write dst to disk
80102b7c:	83 ec 0c             	sub    $0xc,%esp
80102b7f:	ff 75 ec             	pushl  -0x14(%ebp)
80102b82:	e8 68 d6 ff ff       	call   801001ef <bwrite>
80102b87:	83 c4 10             	add    $0x10,%esp
    brelse(lbuf); 
80102b8a:	83 ec 0c             	sub    $0xc,%esp
80102b8d:	ff 75 f0             	pushl  -0x10(%ebp)
80102b90:	e8 99 d6 ff ff       	call   8010022e <brelse>
80102b95:	83 c4 10             	add    $0x10,%esp
    brelse(dbuf);
80102b98:	83 ec 0c             	sub    $0xc,%esp
80102b9b:	ff 75 ec             	pushl  -0x14(%ebp)
80102b9e:	e8 8b d6 ff ff       	call   8010022e <brelse>
80102ba3:	83 c4 10             	add    $0x10,%esp
static void 
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102ba6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80102baa:	a1 44 09 11 80       	mov    0x80110944,%eax
80102baf:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80102bb2:	0f 8f 5d ff ff ff    	jg     80102b15 <install_trans+0x12>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf); 
    brelse(dbuf);
  }
}
80102bb8:	90                   	nop
80102bb9:	c9                   	leave  
80102bba:	c3                   	ret    

80102bbb <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
80102bbb:	55                   	push   %ebp
80102bbc:	89 e5                	mov    %esp,%ebp
80102bbe:	83 ec 18             	sub    $0x18,%esp
  struct buf *buf = bread(log.dev, log.start);
80102bc1:	a1 34 09 11 80       	mov    0x80110934,%eax
80102bc6:	89 c2                	mov    %eax,%edx
80102bc8:	a1 40 09 11 80       	mov    0x80110940,%eax
80102bcd:	83 ec 08             	sub    $0x8,%esp
80102bd0:	52                   	push   %edx
80102bd1:	50                   	push   %eax
80102bd2:	e8 df d5 ff ff       	call   801001b6 <bread>
80102bd7:	83 c4 10             	add    $0x10,%esp
80102bda:	89 45 f0             	mov    %eax,-0x10(%ebp)
  struct logheader *lh = (struct logheader *) (buf->data);
80102bdd:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102be0:	83 c0 18             	add    $0x18,%eax
80102be3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int i;
  log.lh.n = lh->n;
80102be6:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102be9:	8b 00                	mov    (%eax),%eax
80102beb:	a3 44 09 11 80       	mov    %eax,0x80110944
  for (i = 0; i < log.lh.n; i++) {
80102bf0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80102bf7:	eb 1b                	jmp    80102c14 <read_head+0x59>
    log.lh.sector[i] = lh->sector[i];
80102bf9:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102bfc:	8b 55 f4             	mov    -0xc(%ebp),%edx
80102bff:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
80102c03:	8b 55 f4             	mov    -0xc(%ebp),%edx
80102c06:	83 c2 10             	add    $0x10,%edx
80102c09:	89 04 95 08 09 11 80 	mov    %eax,-0x7feef6f8(,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102c10:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80102c14:	a1 44 09 11 80       	mov    0x80110944,%eax
80102c19:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80102c1c:	7f db                	jg     80102bf9 <read_head+0x3e>
    log.lh.sector[i] = lh->sector[i];
  }
  brelse(buf);
80102c1e:	83 ec 0c             	sub    $0xc,%esp
80102c21:	ff 75 f0             	pushl  -0x10(%ebp)
80102c24:	e8 05 d6 ff ff       	call   8010022e <brelse>
80102c29:	83 c4 10             	add    $0x10,%esp
}
80102c2c:	90                   	nop
80102c2d:	c9                   	leave  
80102c2e:	c3                   	ret    

80102c2f <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102c2f:	55                   	push   %ebp
80102c30:	89 e5                	mov    %esp,%ebp
80102c32:	83 ec 18             	sub    $0x18,%esp
  struct buf *buf = bread(log.dev, log.start);
80102c35:	a1 34 09 11 80       	mov    0x80110934,%eax
80102c3a:	89 c2                	mov    %eax,%edx
80102c3c:	a1 40 09 11 80       	mov    0x80110940,%eax
80102c41:	83 ec 08             	sub    $0x8,%esp
80102c44:	52                   	push   %edx
80102c45:	50                   	push   %eax
80102c46:	e8 6b d5 ff ff       	call   801001b6 <bread>
80102c4b:	83 c4 10             	add    $0x10,%esp
80102c4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  struct logheader *hb = (struct logheader *) (buf->data);
80102c51:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102c54:	83 c0 18             	add    $0x18,%eax
80102c57:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int i;
  hb->n = log.lh.n;
80102c5a:	8b 15 44 09 11 80    	mov    0x80110944,%edx
80102c60:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102c63:	89 10                	mov    %edx,(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102c65:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80102c6c:	eb 1b                	jmp    80102c89 <write_head+0x5a>
    hb->sector[i] = log.lh.sector[i];
80102c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102c71:	83 c0 10             	add    $0x10,%eax
80102c74:	8b 0c 85 08 09 11 80 	mov    -0x7feef6f8(,%eax,4),%ecx
80102c7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102c7e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80102c81:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102c85:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80102c89:	a1 44 09 11 80       	mov    0x80110944,%eax
80102c8e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80102c91:	7f db                	jg     80102c6e <write_head+0x3f>
    hb->sector[i] = log.lh.sector[i];
  }
  bwrite(buf);
80102c93:	83 ec 0c             	sub    $0xc,%esp
80102c96:	ff 75 f0             	pushl  -0x10(%ebp)
80102c99:	e8 51 d5 ff ff       	call   801001ef <bwrite>
80102c9e:	83 c4 10             	add    $0x10,%esp
  brelse(buf);
80102ca1:	83 ec 0c             	sub    $0xc,%esp
80102ca4:	ff 75 f0             	pushl  -0x10(%ebp)
80102ca7:	e8 82 d5 ff ff       	call   8010022e <brelse>
80102cac:	83 c4 10             	add    $0x10,%esp
}
80102caf:	90                   	nop
80102cb0:	c9                   	leave  
80102cb1:	c3                   	ret    

80102cb2 <recover_from_log>:

static void
recover_from_log(void)
{
80102cb2:	55                   	push   %ebp
80102cb3:	89 e5                	mov    %esp,%ebp
80102cb5:	83 ec 08             	sub    $0x8,%esp
  read_head();      
80102cb8:	e8 fe fe ff ff       	call   80102bbb <read_head>
  install_trans(); // if committed, copy from log to disk
80102cbd:	e8 41 fe ff ff       	call   80102b03 <install_trans>
  log.lh.n = 0;
80102cc2:	c7 05 44 09 11 80 00 	movl   $0x0,0x80110944
80102cc9:	00 00 00 
  write_head(); // clear the log
80102ccc:	e8 5e ff ff ff       	call   80102c2f <write_head>
}
80102cd1:	90                   	nop
80102cd2:	c9                   	leave  
80102cd3:	c3                   	ret    

80102cd4 <begin_trans>:

void
begin_trans(void)
{
80102cd4:	55                   	push   %ebp
80102cd5:	89 e5                	mov    %esp,%ebp
80102cd7:	83 ec 08             	sub    $0x8,%esp
  acquire(&log.lock);
80102cda:	83 ec 0c             	sub    $0xc,%esp
80102cdd:	68 00 09 11 80       	push   $0x80110900
80102ce2:	e8 25 19 00 00       	call   8010460c <acquire>
80102ce7:	83 c4 10             	add    $0x10,%esp
  while (log.busy) {
80102cea:	eb 15                	jmp    80102d01 <begin_trans+0x2d>
    sleep(&log, &log.lock);
80102cec:	83 ec 08             	sub    $0x8,%esp
80102cef:	68 00 09 11 80       	push   $0x80110900
80102cf4:	68 00 09 11 80       	push   $0x80110900
80102cf9:	e8 15 16 00 00       	call   80104313 <sleep>
80102cfe:	83 c4 10             	add    $0x10,%esp

void
begin_trans(void)
{
  acquire(&log.lock);
  while (log.busy) {
80102d01:	a1 3c 09 11 80       	mov    0x8011093c,%eax
80102d06:	85 c0                	test   %eax,%eax
80102d08:	75 e2                	jne    80102cec <begin_trans+0x18>
    sleep(&log, &log.lock);
  }
  log.busy = 1;
80102d0a:	c7 05 3c 09 11 80 01 	movl   $0x1,0x8011093c
80102d11:	00 00 00 
  release(&log.lock);
80102d14:	83 ec 0c             	sub    $0xc,%esp
80102d17:	68 00 09 11 80       	push   $0x80110900
80102d1c:	e8 52 19 00 00       	call   80104673 <release>
80102d21:	83 c4 10             	add    $0x10,%esp
}
80102d24:	90                   	nop
80102d25:	c9                   	leave  
80102d26:	c3                   	ret    

80102d27 <commit_trans>:

void
commit_trans(void)
{
80102d27:	55                   	push   %ebp
80102d28:	89 e5                	mov    %esp,%ebp
80102d2a:	83 ec 08             	sub    $0x8,%esp
  if (log.lh.n > 0) {
80102d2d:	a1 44 09 11 80       	mov    0x80110944,%eax
80102d32:	85 c0                	test   %eax,%eax
80102d34:	7e 19                	jle    80102d4f <commit_trans+0x28>
    write_head();    // Write header to disk -- the real commit
80102d36:	e8 f4 fe ff ff       	call   80102c2f <write_head>
    install_trans(); // Now install writes to home locations
80102d3b:	e8 c3 fd ff ff       	call   80102b03 <install_trans>
    log.lh.n = 0; 
80102d40:	c7 05 44 09 11 80 00 	movl   $0x0,0x80110944
80102d47:	00 00 00 
    write_head();    // Erase the transaction from the log
80102d4a:	e8 e0 fe ff ff       	call   80102c2f <write_head>
  }
  
  acquire(&log.lock);
80102d4f:	83 ec 0c             	sub    $0xc,%esp
80102d52:	68 00 09 11 80       	push   $0x80110900
80102d57:	e8 b0 18 00 00       	call   8010460c <acquire>
80102d5c:	83 c4 10             	add    $0x10,%esp
  log.busy = 0;
80102d5f:	c7 05 3c 09 11 80 00 	movl   $0x0,0x8011093c
80102d66:	00 00 00 
  wakeup(&log);
80102d69:	83 ec 0c             	sub    $0xc,%esp
80102d6c:	68 00 09 11 80       	push   $0x80110900
80102d71:	e8 88 16 00 00       	call   801043fe <wakeup>
80102d76:	83 c4 10             	add    $0x10,%esp
  release(&log.lock);
80102d79:	83 ec 0c             	sub    $0xc,%esp
80102d7c:	68 00 09 11 80       	push   $0x80110900
80102d81:	e8 ed 18 00 00       	call   80104673 <release>
80102d86:	83 c4 10             	add    $0x10,%esp
}
80102d89:	90                   	nop
80102d8a:	c9                   	leave  
80102d8b:	c3                   	ret    

80102d8c <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d8c:	55                   	push   %ebp
80102d8d:	89 e5                	mov    %esp,%ebp
80102d8f:	83 ec 18             	sub    $0x18,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d92:	a1 44 09 11 80       	mov    0x80110944,%eax
80102d97:	83 f8 09             	cmp    $0x9,%eax
80102d9a:	7f 12                	jg     80102dae <log_write+0x22>
80102d9c:	a1 44 09 11 80       	mov    0x80110944,%eax
80102da1:	8b 15 38 09 11 80    	mov    0x80110938,%edx
80102da7:	83 ea 01             	sub    $0x1,%edx
80102daa:	39 d0                	cmp    %edx,%eax
80102dac:	7c 0d                	jl     80102dbb <log_write+0x2f>
    panic("too big a transaction");
80102dae:	83 ec 0c             	sub    $0xc,%esp
80102db1:	68 24 9a 10 80       	push   $0x80109a24
80102db6:	e8 94 59 00 00       	call   8010874f <panic>
  if (!log.busy)
80102dbb:	a1 3c 09 11 80       	mov    0x8011093c,%eax
80102dc0:	85 c0                	test   %eax,%eax
80102dc2:	75 0d                	jne    80102dd1 <log_write+0x45>
    panic("write outside of trans");
80102dc4:	83 ec 0c             	sub    $0xc,%esp
80102dc7:	68 3a 9a 10 80       	push   $0x80109a3a
80102dcc:	e8 7e 59 00 00       	call   8010874f <panic>

  for (i = 0; i < log.lh.n; i++) {
80102dd1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80102dd8:	eb 1d                	jmp    80102df7 <log_write+0x6b>
    if (log.lh.sector[i] == b->sector)   // log absorbtion?
80102dda:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102ddd:	83 c0 10             	add    $0x10,%eax
80102de0:	8b 04 85 08 09 11 80 	mov    -0x7feef6f8(,%eax,4),%eax
80102de7:	89 c2                	mov    %eax,%edx
80102de9:	8b 45 08             	mov    0x8(%ebp),%eax
80102dec:	8b 40 08             	mov    0x8(%eax),%eax
80102def:	39 c2                	cmp    %eax,%edx
80102df1:	74 10                	je     80102e03 <log_write+0x77>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
  if (!log.busy)
    panic("write outside of trans");

  for (i = 0; i < log.lh.n; i++) {
80102df3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80102df7:	a1 44 09 11 80       	mov    0x80110944,%eax
80102dfc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80102dff:	7f d9                	jg     80102dda <log_write+0x4e>
80102e01:	eb 01                	jmp    80102e04 <log_write+0x78>
    if (log.lh.sector[i] == b->sector)   // log absorbtion?
      break;
80102e03:	90                   	nop
  }
  log.lh.sector[i] = b->sector;
80102e04:	8b 45 08             	mov    0x8(%ebp),%eax
80102e07:	8b 40 08             	mov    0x8(%eax),%eax
80102e0a:	89 c2                	mov    %eax,%edx
80102e0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102e0f:	83 c0 10             	add    $0x10,%eax
80102e12:	89 14 85 08 09 11 80 	mov    %edx,-0x7feef6f8(,%eax,4)
  struct buf *lbuf = bread(b->dev, log.start+i+1);
80102e19:	8b 15 34 09 11 80    	mov    0x80110934,%edx
80102e1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102e22:	01 d0                	add    %edx,%eax
80102e24:	83 c0 01             	add    $0x1,%eax
80102e27:	89 c2                	mov    %eax,%edx
80102e29:	8b 45 08             	mov    0x8(%ebp),%eax
80102e2c:	8b 40 04             	mov    0x4(%eax),%eax
80102e2f:	83 ec 08             	sub    $0x8,%esp
80102e32:	52                   	push   %edx
80102e33:	50                   	push   %eax
80102e34:	e8 7d d3 ff ff       	call   801001b6 <bread>
80102e39:	83 c4 10             	add    $0x10,%esp
80102e3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  memmove(lbuf->data, b->data, BSIZE);
80102e3f:	8b 45 08             	mov    0x8(%ebp),%eax
80102e42:	8d 50 18             	lea    0x18(%eax),%edx
80102e45:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102e48:	83 c0 18             	add    $0x18,%eax
80102e4b:	83 ec 04             	sub    $0x4,%esp
80102e4e:	68 00 02 00 00       	push   $0x200
80102e53:	52                   	push   %edx
80102e54:	50                   	push   %eax
80102e55:	e8 d4 1a 00 00       	call   8010492e <memmove>
80102e5a:	83 c4 10             	add    $0x10,%esp
  bwrite(lbuf);
80102e5d:	83 ec 0c             	sub    $0xc,%esp
80102e60:	ff 75 f0             	pushl  -0x10(%ebp)
80102e63:	e8 87 d3 ff ff       	call   801001ef <bwrite>
80102e68:	83 c4 10             	add    $0x10,%esp
  brelse(lbuf);
80102e6b:	83 ec 0c             	sub    $0xc,%esp
80102e6e:	ff 75 f0             	pushl  -0x10(%ebp)
80102e71:	e8 b8 d3 ff ff       	call   8010022e <brelse>
80102e76:	83 c4 10             	add    $0x10,%esp
  if (i == log.lh.n)
80102e79:	a1 44 09 11 80       	mov    0x80110944,%eax
80102e7e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80102e81:	75 0d                	jne    80102e90 <log_write+0x104>
    log.lh.n++;
80102e83:	a1 44 09 11 80       	mov    0x80110944,%eax
80102e88:	83 c0 01             	add    $0x1,%eax
80102e8b:	a3 44 09 11 80       	mov    %eax,0x80110944
  b->flags |= B_DIRTY; // XXX prevent eviction
80102e90:	8b 45 08             	mov    0x8(%ebp),%eax
80102e93:	8b 00                	mov    (%eax),%eax
80102e95:	83 c8 04             	or     $0x4,%eax
80102e98:	89 c2                	mov    %eax,%edx
80102e9a:	8b 45 08             	mov    0x8(%ebp),%eax
80102e9d:	89 10                	mov    %edx,(%eax)
}
80102e9f:	90                   	nop
80102ea0:	c9                   	leave  
80102ea1:	c3                   	ret    

80102ea2 <v2p>:
80102ea2:	55                   	push   %ebp
80102ea3:	89 e5                	mov    %esp,%ebp
80102ea5:	8b 45 08             	mov    0x8(%ebp),%eax
80102ea8:	05 00 00 00 80       	add    $0x80000000,%eax
80102ead:	5d                   	pop    %ebp
80102eae:	c3                   	ret    

80102eaf <p2v>:
static inline void *p2v(uint a) { return (void *) ((a) + KERNBASE); }
80102eaf:	55                   	push   %ebp
80102eb0:	89 e5                	mov    %esp,%ebp
80102eb2:	8b 45 08             	mov    0x8(%ebp),%eax
80102eb5:	05 00 00 00 80       	add    $0x80000000,%eax
80102eba:	5d                   	pop    %ebp
80102ebb:	c3                   	ret    

80102ebc <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
80102ebc:	55                   	push   %ebp
80102ebd:	89 e5                	mov    %esp,%ebp
80102ebf:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102ec2:	8b 55 08             	mov    0x8(%ebp),%edx
80102ec5:	8b 45 0c             	mov    0xc(%ebp),%eax
80102ec8:	8b 4d 08             	mov    0x8(%ebp),%ecx
80102ecb:	f0 87 02             	lock xchg %eax,(%edx)
80102ece:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
80102ed1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80102ed4:	c9                   	leave  
80102ed5:	c3                   	ret    

80102ed6 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102ed6:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102eda:	83 e4 f0             	and    $0xfffffff0,%esp
80102edd:	ff 71 fc             	pushl  -0x4(%ecx)
80102ee0:	55                   	push   %ebp
80102ee1:	89 e5                	mov    %esp,%ebp
80102ee3:	51                   	push   %ecx
80102ee4:	83 ec 04             	sub    $0x4,%esp
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102ee7:	83 ec 08             	sub    $0x8,%esp
80102eea:	68 00 00 40 80       	push   $0x80400000
80102eef:	68 60 3b 11 80       	push   $0x80113b60
80102ef4:	e8 da f5 ff ff       	call   801024d3 <kinit1>
80102ef9:	83 c4 10             	add    $0x10,%esp
  kvmalloc();      // kernel page table
80102efc:	e8 80 45 00 00       	call   80107481 <kvmalloc>
  mpinit();        // collect info about this machine
80102f01:	e8 48 04 00 00       	call   8010334e <mpinit>
  lapicinit();
80102f06:	e8 2a f9 ff ff       	call   80102835 <lapicinit>
  seginit();       // set up segments
80102f0b:	e8 1a 3f 00 00       	call   80106e2a <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpu->id);
80102f10:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80102f16:	0f b6 00             	movzbl (%eax),%eax
80102f19:	0f b6 c0             	movzbl %al,%eax
80102f1c:	83 ec 08             	sub    $0x8,%esp
80102f1f:	50                   	push   %eax
80102f20:	68 51 9a 10 80       	push   $0x80109a51
80102f25:	e8 7b 54 00 00       	call   801083a5 <cprintf>
80102f2a:	83 c4 10             	add    $0x10,%esp
  picinit();       // interrupt controller
80102f2d:	e8 72 06 00 00       	call   801035a4 <picinit>
  ioapicinit();    // another interrupt controller
80102f32:	e8 91 f4 ff ff       	call   801023c8 <ioapicinit>
  consoleinit();   // I/O devices & their interrupts
80102f37:	e8 7e 68 00 00       	call   801097ba <consoleinit>
  uartinit();      // serial port
80102f3c:	e8 45 32 00 00       	call   80106186 <uartinit>
  pinit();         // process table
80102f41:	e8 5b 0b 00 00       	call   80103aa1 <pinit>
  tvinit();        // trap vectors
80102f46:	e8 05 2e 00 00       	call   80105d50 <tvinit>
  binit();         // buffer cache
80102f4b:	e8 e4 d0 ff ff       	call   80100034 <binit>
  fileinit();      // file table
80102f50:	e8 6f d7 ff ff       	call   801006c4 <fileinit>
  iinit();         // inode cache
80102f55:	e8 4d df ff ff       	call   80100ea7 <iinit>
  ideinit();       // disk
80102f5a:	e8 ad f0 ff ff       	call   8010200c <ideinit>
  if(!ismp)
80102f5f:	a1 84 09 11 80       	mov    0x80110984,%eax
80102f64:	85 c0                	test   %eax,%eax
80102f66:	75 05                	jne    80102f6d <main+0x97>
    timerinit();   // uniprocessor timer
80102f68:	e8 40 2d 00 00       	call   80105cad <timerinit>
  startothers();   // start other processors
80102f6d:	e8 7f 00 00 00       	call   80102ff1 <startothers>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f72:	83 ec 08             	sub    $0x8,%esp
80102f75:	68 00 00 00 8e       	push   $0x8e000000
80102f7a:	68 00 00 40 80       	push   $0x80400000
80102f7f:	e8 88 f5 ff ff       	call   8010250c <kinit2>
80102f84:	83 c4 10             	add    $0x10,%esp
  userinit();      // first user process
80102f87:	e8 39 0c 00 00       	call   80103bc5 <userinit>
  // Finish setting up this processor in mpmain.
  mpmain();
80102f8c:	e8 1a 00 00 00       	call   80102fab <mpmain>

80102f91 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102f91:	55                   	push   %ebp
80102f92:	89 e5                	mov    %esp,%ebp
80102f94:	83 ec 08             	sub    $0x8,%esp
  switchkvm(); 
80102f97:	e8 fd 44 00 00       	call   80107499 <switchkvm>
  seginit();
80102f9c:	e8 89 3e 00 00       	call   80106e2a <seginit>
  lapicinit();
80102fa1:	e8 8f f8 ff ff       	call   80102835 <lapicinit>
  mpmain();
80102fa6:	e8 00 00 00 00       	call   80102fab <mpmain>

80102fab <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102fab:	55                   	push   %ebp
80102fac:	89 e5                	mov    %esp,%ebp
80102fae:	83 ec 08             	sub    $0x8,%esp
  cprintf("cpu%d: starting\n", cpu->id);
80102fb1:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80102fb7:	0f b6 00             	movzbl (%eax),%eax
80102fba:	0f b6 c0             	movzbl %al,%eax
80102fbd:	83 ec 08             	sub    $0x8,%esp
80102fc0:	50                   	push   %eax
80102fc1:	68 68 9a 10 80       	push   $0x80109a68
80102fc6:	e8 da 53 00 00       	call   801083a5 <cprintf>
80102fcb:	83 c4 10             	add    $0x10,%esp
  idtinit();       // load idt register
80102fce:	e8 f3 2e 00 00       	call   80105ec6 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
80102fd3:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80102fd9:	05 a8 00 00 00       	add    $0xa8,%eax
80102fde:	83 ec 08             	sub    $0x8,%esp
80102fe1:	6a 01                	push   $0x1
80102fe3:	50                   	push   %eax
80102fe4:	e8 d3 fe ff ff       	call   80102ebc <xchg>
80102fe9:	83 c4 10             	add    $0x10,%esp
  scheduler();     // start running processes
80102fec:	e8 55 11 00 00       	call   80104146 <scheduler>

80102ff1 <startothers>:
pde_t entrypgdir[];  // For entry.S

// Start the non-boot (AP) processors.
static void
startothers(void)
{
80102ff1:	55                   	push   %ebp
80102ff2:	89 e5                	mov    %esp,%ebp
80102ff4:	53                   	push   %ebx
80102ff5:	83 ec 14             	sub    $0x14,%esp
  char *stack;

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = p2v(0x7000);
80102ff8:	68 00 70 00 00       	push   $0x7000
80102ffd:	e8 ad fe ff ff       	call   80102eaf <p2v>
80103002:	83 c4 04             	add    $0x4,%esp
80103005:	89 45 f0             	mov    %eax,-0x10(%ebp)
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80103008:	b8 8a 00 00 00       	mov    $0x8a,%eax
8010300d:	83 ec 04             	sub    $0x4,%esp
80103010:	50                   	push   %eax
80103011:	68 1d c6 10 80       	push   $0x8010c61d
80103016:	ff 75 f0             	pushl  -0x10(%ebp)
80103019:	e8 10 19 00 00       	call   8010492e <memmove>
8010301e:	83 c4 10             	add    $0x10,%esp

  for(c = cpus; c < cpus+ncpu; c++){
80103021:	c7 45 f4 a0 09 11 80 	movl   $0x801109a0,-0xc(%ebp)
80103028:	e9 90 00 00 00       	jmp    801030bd <startothers+0xcc>
    if(c == cpus+cpunum())  // We've started already.
8010302d:	e8 21 f9 ff ff       	call   80102953 <cpunum>
80103032:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80103038:	05 a0 09 11 80       	add    $0x801109a0,%eax
8010303d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80103040:	74 73                	je     801030b5 <startothers+0xc4>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what 
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80103042:	e8 c3 f5 ff ff       	call   8010260a <kalloc>
80103047:	89 45 ec             	mov    %eax,-0x14(%ebp)
    *(void**)(code-4) = stack + KSTACKSIZE;
8010304a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010304d:	83 e8 04             	sub    $0x4,%eax
80103050:	8b 55 ec             	mov    -0x14(%ebp),%edx
80103053:	81 c2 00 10 00 00    	add    $0x1000,%edx
80103059:	89 10                	mov    %edx,(%eax)
    *(void**)(code-8) = mpenter;
8010305b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010305e:	83 e8 08             	sub    $0x8,%eax
80103061:	c7 00 91 2f 10 80    	movl   $0x80102f91,(%eax)
    *(int**)(code-12) = (void *) v2p(entrypgdir);
80103067:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010306a:	8d 58 f4             	lea    -0xc(%eax),%ebx
8010306d:	83 ec 0c             	sub    $0xc,%esp
80103070:	68 00 b0 10 80       	push   $0x8010b000
80103075:	e8 28 fe ff ff       	call   80102ea2 <v2p>
8010307a:	83 c4 10             	add    $0x10,%esp
8010307d:	89 03                	mov    %eax,(%ebx)

    lapicstartap(c->id, v2p(code));
8010307f:	83 ec 0c             	sub    $0xc,%esp
80103082:	ff 75 f0             	pushl  -0x10(%ebp)
80103085:	e8 18 fe ff ff       	call   80102ea2 <v2p>
8010308a:	83 c4 10             	add    $0x10,%esp
8010308d:	89 c2                	mov    %eax,%edx
8010308f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103092:	0f b6 00             	movzbl (%eax),%eax
80103095:	0f b6 c0             	movzbl %al,%eax
80103098:	83 ec 08             	sub    $0x8,%esp
8010309b:	52                   	push   %edx
8010309c:	50                   	push   %eax
8010309d:	e8 2b f9 ff ff       	call   801029cd <lapicstartap>
801030a2:	83 c4 10             	add    $0x10,%esp

    // wait for cpu to finish mpmain()
    while(c->started == 0)
801030a5:	90                   	nop
801030a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801030a9:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801030af:	85 c0                	test   %eax,%eax
801030b1:	74 f3                	je     801030a6 <startothers+0xb5>
801030b3:	eb 01                	jmp    801030b6 <startothers+0xc5>
  code = p2v(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
    if(c == cpus+cpunum())  // We've started already.
      continue;
801030b5:	90                   	nop
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = p2v(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
801030b6:	81 45 f4 bc 00 00 00 	addl   $0xbc,-0xc(%ebp)
801030bd:	a1 80 0f 11 80       	mov    0x80110f80,%eax
801030c2:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
801030c8:	05 a0 09 11 80       	add    $0x801109a0,%eax
801030cd:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801030d0:	0f 87 57 ff ff ff    	ja     8010302d <startothers+0x3c>

    // wait for cpu to finish mpmain()
    while(c->started == 0)
      ;
  }
}
801030d6:	90                   	nop
801030d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801030da:	c9                   	leave  
801030db:	c3                   	ret    

801030dc <p2v>:
801030dc:	55                   	push   %ebp
801030dd:	89 e5                	mov    %esp,%ebp
801030df:	8b 45 08             	mov    0x8(%ebp),%eax
801030e2:	05 00 00 00 80       	add    $0x80000000,%eax
801030e7:	5d                   	pop    %ebp
801030e8:	c3                   	ret    

801030e9 <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
801030e9:	55                   	push   %ebp
801030ea:	89 e5                	mov    %esp,%ebp
801030ec:	83 ec 14             	sub    $0x14,%esp
801030ef:	8b 45 08             	mov    0x8(%ebp),%eax
801030f2:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801030f6:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
801030fa:	89 c2                	mov    %eax,%edx
801030fc:	ec                   	in     (%dx),%al
801030fd:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
80103100:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
80103104:	c9                   	leave  
80103105:	c3                   	ret    

80103106 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
80103106:	55                   	push   %ebp
80103107:	89 e5                	mov    %esp,%ebp
80103109:	83 ec 08             	sub    $0x8,%esp
8010310c:	8b 55 08             	mov    0x8(%ebp),%edx
8010310f:	8b 45 0c             	mov    0xc(%ebp),%eax
80103112:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80103116:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103119:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
8010311d:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80103121:	ee                   	out    %al,(%dx)
}
80103122:	90                   	nop
80103123:	c9                   	leave  
80103124:	c3                   	ret    

80103125 <mpbcpu>:
int ncpu;
uchar ioapicid;

int
mpbcpu(void)
{
80103125:	55                   	push   %ebp
80103126:	89 e5                	mov    %esp,%ebp
  return bcpu-cpus;
80103128:	a1 04 c7 10 80       	mov    0x8010c704,%eax
8010312d:	89 c2                	mov    %eax,%edx
8010312f:	b8 a0 09 11 80       	mov    $0x801109a0,%eax
80103134:	29 c2                	sub    %eax,%edx
80103136:	89 d0                	mov    %edx,%eax
80103138:	c1 f8 02             	sar    $0x2,%eax
8010313b:	69 c0 cf 46 7d 67    	imul   $0x677d46cf,%eax,%eax
}
80103141:	5d                   	pop    %ebp
80103142:	c3                   	ret    

80103143 <sum>:

static uchar
sum(uchar *addr, int len)
{
80103143:	55                   	push   %ebp
80103144:	89 e5                	mov    %esp,%ebp
80103146:	83 ec 10             	sub    $0x10,%esp
  int i, sum;
  
  sum = 0;
80103149:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  for(i=0; i<len; i++)
80103150:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
80103157:	eb 15                	jmp    8010316e <sum+0x2b>
    sum += addr[i];
80103159:	8b 55 fc             	mov    -0x4(%ebp),%edx
8010315c:	8b 45 08             	mov    0x8(%ebp),%eax
8010315f:	01 d0                	add    %edx,%eax
80103161:	0f b6 00             	movzbl (%eax),%eax
80103164:	0f b6 c0             	movzbl %al,%eax
80103167:	01 45 f8             	add    %eax,-0x8(%ebp)
sum(uchar *addr, int len)
{
  int i, sum;
  
  sum = 0;
  for(i=0; i<len; i++)
8010316a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
8010316e:	8b 45 fc             	mov    -0x4(%ebp),%eax
80103171:	3b 45 0c             	cmp    0xc(%ebp),%eax
80103174:	7c e3                	jl     80103159 <sum+0x16>
    sum += addr[i];
  return sum;
80103176:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
80103179:	c9                   	leave  
8010317a:	c3                   	ret    

8010317b <mpsearch1>:

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
8010317b:	55                   	push   %ebp
8010317c:	89 e5                	mov    %esp,%ebp
8010317e:	83 ec 18             	sub    $0x18,%esp
  uchar *e, *p, *addr;

  addr = p2v(a);
80103181:	ff 75 08             	pushl  0x8(%ebp)
80103184:	e8 53 ff ff ff       	call   801030dc <p2v>
80103189:	83 c4 04             	add    $0x4,%esp
8010318c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  e = addr+len;
8010318f:	8b 55 0c             	mov    0xc(%ebp),%edx
80103192:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103195:	01 d0                	add    %edx,%eax
80103197:	89 45 ec             	mov    %eax,-0x14(%ebp)
  for(p = addr; p < e; p += sizeof(struct mp))
8010319a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010319d:	89 45 f4             	mov    %eax,-0xc(%ebp)
801031a0:	eb 36                	jmp    801031d8 <mpsearch1+0x5d>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801031a2:	83 ec 04             	sub    $0x4,%esp
801031a5:	6a 04                	push   $0x4
801031a7:	68 7c 9a 10 80       	push   $0x80109a7c
801031ac:	ff 75 f4             	pushl  -0xc(%ebp)
801031af:	e8 22 17 00 00       	call   801048d6 <memcmp>
801031b4:	83 c4 10             	add    $0x10,%esp
801031b7:	85 c0                	test   %eax,%eax
801031b9:	75 19                	jne    801031d4 <mpsearch1+0x59>
801031bb:	83 ec 08             	sub    $0x8,%esp
801031be:	6a 10                	push   $0x10
801031c0:	ff 75 f4             	pushl  -0xc(%ebp)
801031c3:	e8 7b ff ff ff       	call   80103143 <sum>
801031c8:	83 c4 10             	add    $0x10,%esp
801031cb:	84 c0                	test   %al,%al
801031cd:	75 05                	jne    801031d4 <mpsearch1+0x59>
      return (struct mp*)p;
801031cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
801031d2:	eb 11                	jmp    801031e5 <mpsearch1+0x6a>
{
  uchar *e, *p, *addr;

  addr = p2v(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
801031d4:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
801031d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801031db:	3b 45 ec             	cmp    -0x14(%ebp),%eax
801031de:	72 c2                	jb     801031a2 <mpsearch1+0x27>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
801031e0:	b8 00 00 00 00       	mov    $0x0,%eax
}
801031e5:	c9                   	leave  
801031e6:	c3                   	ret    

801031e7 <mpsearch>:
// 1) in the first KB of the EBDA;
// 2) in the last KB of system base memory;
// 3) in the BIOS ROM between 0xE0000 and 0xFFFFF.
static struct mp*
mpsearch(void)
{
801031e7:	55                   	push   %ebp
801031e8:	89 e5                	mov    %esp,%ebp
801031ea:	83 ec 18             	sub    $0x18,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
801031ed:	c7 45 f4 00 04 00 80 	movl   $0x80000400,-0xc(%ebp)
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
801031f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
801031f7:	83 c0 0f             	add    $0xf,%eax
801031fa:	0f b6 00             	movzbl (%eax),%eax
801031fd:	0f b6 c0             	movzbl %al,%eax
80103200:	c1 e0 08             	shl    $0x8,%eax
80103203:	89 c2                	mov    %eax,%edx
80103205:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103208:	83 c0 0e             	add    $0xe,%eax
8010320b:	0f b6 00             	movzbl (%eax),%eax
8010320e:	0f b6 c0             	movzbl %al,%eax
80103211:	09 d0                	or     %edx,%eax
80103213:	c1 e0 04             	shl    $0x4,%eax
80103216:	89 45 f0             	mov    %eax,-0x10(%ebp)
80103219:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010321d:	74 21                	je     80103240 <mpsearch+0x59>
    if((mp = mpsearch1(p, 1024)))
8010321f:	83 ec 08             	sub    $0x8,%esp
80103222:	68 00 04 00 00       	push   $0x400
80103227:	ff 75 f0             	pushl  -0x10(%ebp)
8010322a:	e8 4c ff ff ff       	call   8010317b <mpsearch1>
8010322f:	83 c4 10             	add    $0x10,%esp
80103232:	89 45 ec             	mov    %eax,-0x14(%ebp)
80103235:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80103239:	74 51                	je     8010328c <mpsearch+0xa5>
      return mp;
8010323b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010323e:	eb 61                	jmp    801032a1 <mpsearch+0xba>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103240:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103243:	83 c0 14             	add    $0x14,%eax
80103246:	0f b6 00             	movzbl (%eax),%eax
80103249:	0f b6 c0             	movzbl %al,%eax
8010324c:	c1 e0 08             	shl    $0x8,%eax
8010324f:	89 c2                	mov    %eax,%edx
80103251:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103254:	83 c0 13             	add    $0x13,%eax
80103257:	0f b6 00             	movzbl (%eax),%eax
8010325a:	0f b6 c0             	movzbl %al,%eax
8010325d:	09 d0                	or     %edx,%eax
8010325f:	c1 e0 0a             	shl    $0xa,%eax
80103262:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((mp = mpsearch1(p-1024, 1024)))
80103265:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103268:	2d 00 04 00 00       	sub    $0x400,%eax
8010326d:	83 ec 08             	sub    $0x8,%esp
80103270:	68 00 04 00 00       	push   $0x400
80103275:	50                   	push   %eax
80103276:	e8 00 ff ff ff       	call   8010317b <mpsearch1>
8010327b:	83 c4 10             	add    $0x10,%esp
8010327e:	89 45 ec             	mov    %eax,-0x14(%ebp)
80103281:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80103285:	74 05                	je     8010328c <mpsearch+0xa5>
      return mp;
80103287:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010328a:	eb 15                	jmp    801032a1 <mpsearch+0xba>
  }
  return mpsearch1(0xF0000, 0x10000);
8010328c:	83 ec 08             	sub    $0x8,%esp
8010328f:	68 00 00 01 00       	push   $0x10000
80103294:	68 00 00 0f 00       	push   $0xf0000
80103299:	e8 dd fe ff ff       	call   8010317b <mpsearch1>
8010329e:	83 c4 10             	add    $0x10,%esp
}
801032a1:	c9                   	leave  
801032a2:	c3                   	ret    

801032a3 <mpconfig>:
// Check for correct signature, calculate the checksum and,
// if correct, check the version.
// To do: check extended table checksum.
static struct mpconf*
mpconfig(struct mp **pmp)
{
801032a3:	55                   	push   %ebp
801032a4:	89 e5                	mov    %esp,%ebp
801032a6:	83 ec 18             	sub    $0x18,%esp
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801032a9:	e8 39 ff ff ff       	call   801031e7 <mpsearch>
801032ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
801032b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801032b5:	74 0a                	je     801032c1 <mpconfig+0x1e>
801032b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801032ba:	8b 40 04             	mov    0x4(%eax),%eax
801032bd:	85 c0                	test   %eax,%eax
801032bf:	75 0a                	jne    801032cb <mpconfig+0x28>
    return 0;
801032c1:	b8 00 00 00 00       	mov    $0x0,%eax
801032c6:	e9 81 00 00 00       	jmp    8010334c <mpconfig+0xa9>
  conf = (struct mpconf*) p2v((uint) mp->physaddr);
801032cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
801032ce:	8b 40 04             	mov    0x4(%eax),%eax
801032d1:	83 ec 0c             	sub    $0xc,%esp
801032d4:	50                   	push   %eax
801032d5:	e8 02 fe ff ff       	call   801030dc <p2v>
801032da:	83 c4 10             	add    $0x10,%esp
801032dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
801032e0:	83 ec 04             	sub    $0x4,%esp
801032e3:	6a 04                	push   $0x4
801032e5:	68 81 9a 10 80       	push   $0x80109a81
801032ea:	ff 75 f0             	pushl  -0x10(%ebp)
801032ed:	e8 e4 15 00 00       	call   801048d6 <memcmp>
801032f2:	83 c4 10             	add    $0x10,%esp
801032f5:	85 c0                	test   %eax,%eax
801032f7:	74 07                	je     80103300 <mpconfig+0x5d>
    return 0;
801032f9:	b8 00 00 00 00       	mov    $0x0,%eax
801032fe:	eb 4c                	jmp    8010334c <mpconfig+0xa9>
  if(conf->version != 1 && conf->version != 4)
80103300:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103303:	0f b6 40 06          	movzbl 0x6(%eax),%eax
80103307:	3c 01                	cmp    $0x1,%al
80103309:	74 12                	je     8010331d <mpconfig+0x7a>
8010330b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010330e:	0f b6 40 06          	movzbl 0x6(%eax),%eax
80103312:	3c 04                	cmp    $0x4,%al
80103314:	74 07                	je     8010331d <mpconfig+0x7a>
    return 0;
80103316:	b8 00 00 00 00       	mov    $0x0,%eax
8010331b:	eb 2f                	jmp    8010334c <mpconfig+0xa9>
  if(sum((uchar*)conf, conf->length) != 0)
8010331d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103320:	0f b7 40 04          	movzwl 0x4(%eax),%eax
80103324:	0f b7 c0             	movzwl %ax,%eax
80103327:	83 ec 08             	sub    $0x8,%esp
8010332a:	50                   	push   %eax
8010332b:	ff 75 f0             	pushl  -0x10(%ebp)
8010332e:	e8 10 fe ff ff       	call   80103143 <sum>
80103333:	83 c4 10             	add    $0x10,%esp
80103336:	84 c0                	test   %al,%al
80103338:	74 07                	je     80103341 <mpconfig+0x9e>
    return 0;
8010333a:	b8 00 00 00 00       	mov    $0x0,%eax
8010333f:	eb 0b                	jmp    8010334c <mpconfig+0xa9>
  *pmp = mp;
80103341:	8b 45 08             	mov    0x8(%ebp),%eax
80103344:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103347:	89 10                	mov    %edx,(%eax)
  return conf;
80103349:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
8010334c:	c9                   	leave  
8010334d:	c3                   	ret    

8010334e <mpinit>:

void
mpinit(void)
{
8010334e:	55                   	push   %ebp
8010334f:	89 e5                	mov    %esp,%ebp
80103351:	83 ec 28             	sub    $0x28,%esp
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  bcpu = &cpus[0];
80103354:	c7 05 04 c7 10 80 a0 	movl   $0x801109a0,0x8010c704
8010335b:	09 11 80 
  if((conf = mpconfig(&mp)) == 0)
8010335e:	83 ec 0c             	sub    $0xc,%esp
80103361:	8d 45 e0             	lea    -0x20(%ebp),%eax
80103364:	50                   	push   %eax
80103365:	e8 39 ff ff ff       	call   801032a3 <mpconfig>
8010336a:	83 c4 10             	add    $0x10,%esp
8010336d:	89 45 f0             	mov    %eax,-0x10(%ebp)
80103370:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80103374:	0f 84 96 01 00 00    	je     80103510 <mpinit+0x1c2>
    return;
  ismp = 1;
8010337a:	c7 05 84 09 11 80 01 	movl   $0x1,0x80110984
80103381:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
80103384:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103387:	8b 40 24             	mov    0x24(%eax),%eax
8010338a:	a3 fc 08 11 80       	mov    %eax,0x801108fc
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010338f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103392:	83 c0 2c             	add    $0x2c,%eax
80103395:	89 45 f4             	mov    %eax,-0xc(%ebp)
80103398:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010339b:	0f b7 40 04          	movzwl 0x4(%eax),%eax
8010339f:	0f b7 d0             	movzwl %ax,%edx
801033a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
801033a5:	01 d0                	add    %edx,%eax
801033a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
801033aa:	e9 f2 00 00 00       	jmp    801034a1 <mpinit+0x153>
    switch(*p){
801033af:	8b 45 f4             	mov    -0xc(%ebp),%eax
801033b2:	0f b6 00             	movzbl (%eax),%eax
801033b5:	0f b6 c0             	movzbl %al,%eax
801033b8:	83 f8 04             	cmp    $0x4,%eax
801033bb:	0f 87 bc 00 00 00    	ja     8010347d <mpinit+0x12f>
801033c1:	8b 04 85 c4 9a 10 80 	mov    -0x7fef653c(,%eax,4),%eax
801033c8:	ff e0                	jmp    *%eax
    case MPPROC:
      proc = (struct mpproc*)p;
801033ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
801033cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(ncpu != proc->apicid){
801033d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
801033d3:	0f b6 40 01          	movzbl 0x1(%eax),%eax
801033d7:	0f b6 d0             	movzbl %al,%edx
801033da:	a1 80 0f 11 80       	mov    0x80110f80,%eax
801033df:	39 c2                	cmp    %eax,%edx
801033e1:	74 2b                	je     8010340e <mpinit+0xc0>
        cprintf("mpinit: ncpu=%d apicid=%d\n", ncpu, proc->apicid);
801033e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
801033e6:	0f b6 40 01          	movzbl 0x1(%eax),%eax
801033ea:	0f b6 d0             	movzbl %al,%edx
801033ed:	a1 80 0f 11 80       	mov    0x80110f80,%eax
801033f2:	83 ec 04             	sub    $0x4,%esp
801033f5:	52                   	push   %edx
801033f6:	50                   	push   %eax
801033f7:	68 86 9a 10 80       	push   $0x80109a86
801033fc:	e8 a4 4f 00 00       	call   801083a5 <cprintf>
80103401:	83 c4 10             	add    $0x10,%esp
        ismp = 0;
80103404:	c7 05 84 09 11 80 00 	movl   $0x0,0x80110984
8010340b:	00 00 00 
      }
      if(proc->flags & MPBOOT)
8010340e:	8b 45 e8             	mov    -0x18(%ebp),%eax
80103411:	0f b6 40 03          	movzbl 0x3(%eax),%eax
80103415:	0f b6 c0             	movzbl %al,%eax
80103418:	83 e0 02             	and    $0x2,%eax
8010341b:	85 c0                	test   %eax,%eax
8010341d:	74 15                	je     80103434 <mpinit+0xe6>
        bcpu = &cpus[ncpu];
8010341f:	a1 80 0f 11 80       	mov    0x80110f80,%eax
80103424:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
8010342a:	05 a0 09 11 80       	add    $0x801109a0,%eax
8010342f:	a3 04 c7 10 80       	mov    %eax,0x8010c704
      cpus[ncpu].id = ncpu;
80103434:	a1 80 0f 11 80       	mov    0x80110f80,%eax
80103439:	8b 15 80 0f 11 80    	mov    0x80110f80,%edx
8010343f:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80103445:	05 a0 09 11 80       	add    $0x801109a0,%eax
8010344a:	88 10                	mov    %dl,(%eax)
      ncpu++;
8010344c:	a1 80 0f 11 80       	mov    0x80110f80,%eax
80103451:	83 c0 01             	add    $0x1,%eax
80103454:	a3 80 0f 11 80       	mov    %eax,0x80110f80
      p += sizeof(struct mpproc);
80103459:	83 45 f4 14          	addl   $0x14,-0xc(%ebp)
      continue;
8010345d:	eb 42                	jmp    801034a1 <mpinit+0x153>
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
8010345f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103462:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      ioapicid = ioapic->apicno;
80103465:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103468:	0f b6 40 01          	movzbl 0x1(%eax),%eax
8010346c:	a2 80 09 11 80       	mov    %al,0x80110980
      p += sizeof(struct mpioapic);
80103471:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
      continue;
80103475:	eb 2a                	jmp    801034a1 <mpinit+0x153>
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103477:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
      continue;
8010347b:	eb 24                	jmp    801034a1 <mpinit+0x153>
    default:
      cprintf("mpinit: unknown config type %x\n", *p);
8010347d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103480:	0f b6 00             	movzbl (%eax),%eax
80103483:	0f b6 c0             	movzbl %al,%eax
80103486:	83 ec 08             	sub    $0x8,%esp
80103489:	50                   	push   %eax
8010348a:	68 a4 9a 10 80       	push   $0x80109aa4
8010348f:	e8 11 4f 00 00       	call   801083a5 <cprintf>
80103494:	83 c4 10             	add    $0x10,%esp
      ismp = 0;
80103497:	c7 05 84 09 11 80 00 	movl   $0x0,0x80110984
8010349e:	00 00 00 
  bcpu = &cpus[0];
  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801034a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801034a4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
801034a7:	0f 82 02 ff ff ff    	jb     801033af <mpinit+0x61>
    default:
      cprintf("mpinit: unknown config type %x\n", *p);
      ismp = 0;
    }
  }
  if(!ismp){
801034ad:	a1 84 09 11 80       	mov    0x80110984,%eax
801034b2:	85 c0                	test   %eax,%eax
801034b4:	75 1d                	jne    801034d3 <mpinit+0x185>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
801034b6:	c7 05 80 0f 11 80 01 	movl   $0x1,0x80110f80
801034bd:	00 00 00 
    lapic = 0;
801034c0:	c7 05 fc 08 11 80 00 	movl   $0x0,0x801108fc
801034c7:	00 00 00 
    ioapicid = 0;
801034ca:	c6 05 80 09 11 80 00 	movb   $0x0,0x80110980
    return;
801034d1:	eb 3e                	jmp    80103511 <mpinit+0x1c3>
  }

  if(mp->imcrp){
801034d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801034d6:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
801034da:	84 c0                	test   %al,%al
801034dc:	74 33                	je     80103511 <mpinit+0x1c3>
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
801034de:	83 ec 08             	sub    $0x8,%esp
801034e1:	6a 70                	push   $0x70
801034e3:	6a 22                	push   $0x22
801034e5:	e8 1c fc ff ff       	call   80103106 <outb>
801034ea:	83 c4 10             	add    $0x10,%esp
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
801034ed:	83 ec 0c             	sub    $0xc,%esp
801034f0:	6a 23                	push   $0x23
801034f2:	e8 f2 fb ff ff       	call   801030e9 <inb>
801034f7:	83 c4 10             	add    $0x10,%esp
801034fa:	83 c8 01             	or     $0x1,%eax
801034fd:	0f b6 c0             	movzbl %al,%eax
80103500:	83 ec 08             	sub    $0x8,%esp
80103503:	50                   	push   %eax
80103504:	6a 23                	push   $0x23
80103506:	e8 fb fb ff ff       	call   80103106 <outb>
8010350b:	83 c4 10             	add    $0x10,%esp
8010350e:	eb 01                	jmp    80103511 <mpinit+0x1c3>
  struct mpproc *proc;
  struct mpioapic *ioapic;

  bcpu = &cpus[0];
  if((conf = mpconfig(&mp)) == 0)
    return;
80103510:	90                   	nop
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
80103511:	c9                   	leave  
80103512:	c3                   	ret    

80103513 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
80103513:	55                   	push   %ebp
80103514:	89 e5                	mov    %esp,%ebp
80103516:	83 ec 08             	sub    $0x8,%esp
80103519:	8b 55 08             	mov    0x8(%ebp),%edx
8010351c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010351f:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80103523:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103526:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
8010352a:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
8010352e:	ee                   	out    %al,(%dx)
}
8010352f:	90                   	nop
80103530:	c9                   	leave  
80103531:	c3                   	ret    

80103532 <picsetmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static ushort irqmask = 0xFFFF & ~(1<<IRQ_SLAVE);

static void
picsetmask(ushort mask)
{
80103532:	55                   	push   %ebp
80103533:	89 e5                	mov    %esp,%ebp
80103535:	83 ec 04             	sub    $0x4,%esp
80103538:	8b 45 08             	mov    0x8(%ebp),%eax
8010353b:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  irqmask = mask;
8010353f:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80103543:	66 a3 00 c0 10 80    	mov    %ax,0x8010c000
  outb(IO_PIC1+1, mask);
80103549:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
8010354d:	0f b6 c0             	movzbl %al,%eax
80103550:	50                   	push   %eax
80103551:	6a 21                	push   $0x21
80103553:	e8 bb ff ff ff       	call   80103513 <outb>
80103558:	83 c4 08             	add    $0x8,%esp
  outb(IO_PIC2+1, mask >> 8);
8010355b:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
8010355f:	66 c1 e8 08          	shr    $0x8,%ax
80103563:	0f b6 c0             	movzbl %al,%eax
80103566:	50                   	push   %eax
80103567:	68 a1 00 00 00       	push   $0xa1
8010356c:	e8 a2 ff ff ff       	call   80103513 <outb>
80103571:	83 c4 08             	add    $0x8,%esp
}
80103574:	90                   	nop
80103575:	c9                   	leave  
80103576:	c3                   	ret    

80103577 <picenable>:

void
picenable(int irq)
{
80103577:	55                   	push   %ebp
80103578:	89 e5                	mov    %esp,%ebp
  picsetmask(irqmask & ~(1<<irq));
8010357a:	8b 45 08             	mov    0x8(%ebp),%eax
8010357d:	ba 01 00 00 00       	mov    $0x1,%edx
80103582:	89 c1                	mov    %eax,%ecx
80103584:	d3 e2                	shl    %cl,%edx
80103586:	89 d0                	mov    %edx,%eax
80103588:	f7 d0                	not    %eax
8010358a:	89 c2                	mov    %eax,%edx
8010358c:	0f b7 05 00 c0 10 80 	movzwl 0x8010c000,%eax
80103593:	21 d0                	and    %edx,%eax
80103595:	0f b7 c0             	movzwl %ax,%eax
80103598:	50                   	push   %eax
80103599:	e8 94 ff ff ff       	call   80103532 <picsetmask>
8010359e:	83 c4 04             	add    $0x4,%esp
}
801035a1:	90                   	nop
801035a2:	c9                   	leave  
801035a3:	c3                   	ret    

801035a4 <picinit>:

// Initialize the 8259A interrupt controllers.
void
picinit(void)
{
801035a4:	55                   	push   %ebp
801035a5:	89 e5                	mov    %esp,%ebp
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
801035a7:	68 ff 00 00 00       	push   $0xff
801035ac:	6a 21                	push   $0x21
801035ae:	e8 60 ff ff ff       	call   80103513 <outb>
801035b3:	83 c4 08             	add    $0x8,%esp
  outb(IO_PIC2+1, 0xFF);
801035b6:	68 ff 00 00 00       	push   $0xff
801035bb:	68 a1 00 00 00       	push   $0xa1
801035c0:	e8 4e ff ff ff       	call   80103513 <outb>
801035c5:	83 c4 08             	add    $0x8,%esp

  // ICW1:  0001g0hi
  //    g:  0 = edge triggering, 1 = level triggering
  //    h:  0 = cascaded PICs, 1 = master only
  //    i:  0 = no ICW4, 1 = ICW4 required
  outb(IO_PIC1, 0x11);
801035c8:	6a 11                	push   $0x11
801035ca:	6a 20                	push   $0x20
801035cc:	e8 42 ff ff ff       	call   80103513 <outb>
801035d1:	83 c4 08             	add    $0x8,%esp

  // ICW2:  Vector offset
  outb(IO_PIC1+1, T_IRQ0);
801035d4:	6a 20                	push   $0x20
801035d6:	6a 21                	push   $0x21
801035d8:	e8 36 ff ff ff       	call   80103513 <outb>
801035dd:	83 c4 08             	add    $0x8,%esp

  // ICW3:  (master PIC) bit mask of IR lines connected to slaves
  //        (slave PIC) 3-bit # of slave's connection to master
  outb(IO_PIC1+1, 1<<IRQ_SLAVE);
801035e0:	6a 04                	push   $0x4
801035e2:	6a 21                	push   $0x21
801035e4:	e8 2a ff ff ff       	call   80103513 <outb>
801035e9:	83 c4 08             	add    $0x8,%esp
  //    m:  0 = slave PIC, 1 = master PIC
  //      (ignored when b is 0, as the master/slave role
  //      can be hardwired).
  //    a:  1 = Automatic EOI mode
  //    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
  outb(IO_PIC1+1, 0x3);
801035ec:	6a 03                	push   $0x3
801035ee:	6a 21                	push   $0x21
801035f0:	e8 1e ff ff ff       	call   80103513 <outb>
801035f5:	83 c4 08             	add    $0x8,%esp

  // Set up slave (8259A-2)
  outb(IO_PIC2, 0x11);                  // ICW1
801035f8:	6a 11                	push   $0x11
801035fa:	68 a0 00 00 00       	push   $0xa0
801035ff:	e8 0f ff ff ff       	call   80103513 <outb>
80103604:	83 c4 08             	add    $0x8,%esp
  outb(IO_PIC2+1, T_IRQ0 + 8);      // ICW2
80103607:	6a 28                	push   $0x28
80103609:	68 a1 00 00 00       	push   $0xa1
8010360e:	e8 00 ff ff ff       	call   80103513 <outb>
80103613:	83 c4 08             	add    $0x8,%esp
  outb(IO_PIC2+1, IRQ_SLAVE);           // ICW3
80103616:	6a 02                	push   $0x2
80103618:	68 a1 00 00 00       	push   $0xa1
8010361d:	e8 f1 fe ff ff       	call   80103513 <outb>
80103622:	83 c4 08             	add    $0x8,%esp
  // NB Automatic EOI mode doesn't tend to work on the slave.
  // Linux source code says it's "to be investigated".
  outb(IO_PIC2+1, 0x3);                 // ICW4
80103625:	6a 03                	push   $0x3
80103627:	68 a1 00 00 00       	push   $0xa1
8010362c:	e8 e2 fe ff ff       	call   80103513 <outb>
80103631:	83 c4 08             	add    $0x8,%esp

  // OCW3:  0ef01prs
  //   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
  //    p:  0 = no polling, 1 = polling mode
  //   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
  outb(IO_PIC1, 0x68);             // clear specific mask
80103634:	6a 68                	push   $0x68
80103636:	6a 20                	push   $0x20
80103638:	e8 d6 fe ff ff       	call   80103513 <outb>
8010363d:	83 c4 08             	add    $0x8,%esp
  outb(IO_PIC1, 0x0a);             // read IRR by default
80103640:	6a 0a                	push   $0xa
80103642:	6a 20                	push   $0x20
80103644:	e8 ca fe ff ff       	call   80103513 <outb>
80103649:	83 c4 08             	add    $0x8,%esp

  outb(IO_PIC2, 0x68);             // OCW3
8010364c:	6a 68                	push   $0x68
8010364e:	68 a0 00 00 00       	push   $0xa0
80103653:	e8 bb fe ff ff       	call   80103513 <outb>
80103658:	83 c4 08             	add    $0x8,%esp
  outb(IO_PIC2, 0x0a);             // OCW3
8010365b:	6a 0a                	push   $0xa
8010365d:	68 a0 00 00 00       	push   $0xa0
80103662:	e8 ac fe ff ff       	call   80103513 <outb>
80103667:	83 c4 08             	add    $0x8,%esp

  if(irqmask != 0xFFFF)
8010366a:	0f b7 05 00 c0 10 80 	movzwl 0x8010c000,%eax
80103671:	66 83 f8 ff          	cmp    $0xffff,%ax
80103675:	74 13                	je     8010368a <picinit+0xe6>
    picsetmask(irqmask);
80103677:	0f b7 05 00 c0 10 80 	movzwl 0x8010c000,%eax
8010367e:	0f b7 c0             	movzwl %ax,%eax
80103681:	50                   	push   %eax
80103682:	e8 ab fe ff ff       	call   80103532 <picsetmask>
80103687:	83 c4 04             	add    $0x4,%esp
}
8010368a:	90                   	nop
8010368b:	c9                   	leave  
8010368c:	c3                   	ret    

8010368d <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
8010368d:	55                   	push   %ebp
8010368e:	89 e5                	mov    %esp,%ebp
80103690:	83 ec 18             	sub    $0x18,%esp
  struct pipe *p;

  p = 0;
80103693:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  *f0 = *f1 = 0;
8010369a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010369d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801036a3:	8b 45 0c             	mov    0xc(%ebp),%eax
801036a6:	8b 10                	mov    (%eax),%edx
801036a8:	8b 45 08             	mov    0x8(%ebp),%eax
801036ab:	89 10                	mov    %edx,(%eax)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801036ad:	e8 30 d0 ff ff       	call   801006e2 <filealloc>
801036b2:	89 c2                	mov    %eax,%edx
801036b4:	8b 45 08             	mov    0x8(%ebp),%eax
801036b7:	89 10                	mov    %edx,(%eax)
801036b9:	8b 45 08             	mov    0x8(%ebp),%eax
801036bc:	8b 00                	mov    (%eax),%eax
801036be:	85 c0                	test   %eax,%eax
801036c0:	0f 84 cb 00 00 00    	je     80103791 <pipealloc+0x104>
801036c6:	e8 17 d0 ff ff       	call   801006e2 <filealloc>
801036cb:	89 c2                	mov    %eax,%edx
801036cd:	8b 45 0c             	mov    0xc(%ebp),%eax
801036d0:	89 10                	mov    %edx,(%eax)
801036d2:	8b 45 0c             	mov    0xc(%ebp),%eax
801036d5:	8b 00                	mov    (%eax),%eax
801036d7:	85 c0                	test   %eax,%eax
801036d9:	0f 84 b2 00 00 00    	je     80103791 <pipealloc+0x104>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
801036df:	e8 26 ef ff ff       	call   8010260a <kalloc>
801036e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
801036e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801036eb:	0f 84 9f 00 00 00    	je     80103790 <pipealloc+0x103>
    goto bad;
  p->readopen = 1;
801036f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801036f4:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801036fb:	00 00 00 
  p->writeopen = 1;
801036fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103701:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103708:	00 00 00 
  p->nwrite = 0;
8010370b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010370e:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103715:	00 00 00 
  p->nread = 0;
80103718:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010371b:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103722:	00 00 00 
  initlock(&p->lock, "pipe");
80103725:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103728:	83 ec 08             	sub    $0x8,%esp
8010372b:	68 d8 9a 10 80       	push   $0x80109ad8
80103730:	50                   	push   %eax
80103731:	e8 b4 0e 00 00       	call   801045ea <initlock>
80103736:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
80103739:	8b 45 08             	mov    0x8(%ebp),%eax
8010373c:	8b 00                	mov    (%eax),%eax
8010373e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103744:	8b 45 08             	mov    0x8(%ebp),%eax
80103747:	8b 00                	mov    (%eax),%eax
80103749:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010374d:	8b 45 08             	mov    0x8(%ebp),%eax
80103750:	8b 00                	mov    (%eax),%eax
80103752:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103756:	8b 45 08             	mov    0x8(%ebp),%eax
80103759:	8b 00                	mov    (%eax),%eax
8010375b:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010375e:	89 50 0c             	mov    %edx,0xc(%eax)
  (*f1)->type = FD_PIPE;
80103761:	8b 45 0c             	mov    0xc(%ebp),%eax
80103764:	8b 00                	mov    (%eax),%eax
80103766:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
8010376c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010376f:	8b 00                	mov    (%eax),%eax
80103771:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103775:	8b 45 0c             	mov    0xc(%ebp),%eax
80103778:	8b 00                	mov    (%eax),%eax
8010377a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010377e:	8b 45 0c             	mov    0xc(%ebp),%eax
80103781:	8b 00                	mov    (%eax),%eax
80103783:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103786:	89 50 0c             	mov    %edx,0xc(%eax)
  return 0;
80103789:	b8 00 00 00 00       	mov    $0x0,%eax
8010378e:	eb 4e                	jmp    801037de <pipealloc+0x151>
  p = 0;
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
80103790:	90                   	nop
  (*f1)->pipe = p;
  return 0;

//PAGEBREAK: 20
 bad:
  if(p)
80103791:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80103795:	74 0e                	je     801037a5 <pipealloc+0x118>
    kfree((char*)p);
80103797:	83 ec 0c             	sub    $0xc,%esp
8010379a:	ff 75 f4             	pushl  -0xc(%ebp)
8010379d:	e8 cb ed ff ff       	call   8010256d <kfree>
801037a2:	83 c4 10             	add    $0x10,%esp
  if(*f0)
801037a5:	8b 45 08             	mov    0x8(%ebp),%eax
801037a8:	8b 00                	mov    (%eax),%eax
801037aa:	85 c0                	test   %eax,%eax
801037ac:	74 11                	je     801037bf <pipealloc+0x132>
    fileclose(*f0);
801037ae:	8b 45 08             	mov    0x8(%ebp),%eax
801037b1:	8b 00                	mov    (%eax),%eax
801037b3:	83 ec 0c             	sub    $0xc,%esp
801037b6:	50                   	push   %eax
801037b7:	e8 e4 cf ff ff       	call   801007a0 <fileclose>
801037bc:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801037bf:	8b 45 0c             	mov    0xc(%ebp),%eax
801037c2:	8b 00                	mov    (%eax),%eax
801037c4:	85 c0                	test   %eax,%eax
801037c6:	74 11                	je     801037d9 <pipealloc+0x14c>
    fileclose(*f1);
801037c8:	8b 45 0c             	mov    0xc(%ebp),%eax
801037cb:	8b 00                	mov    (%eax),%eax
801037cd:	83 ec 0c             	sub    $0xc,%esp
801037d0:	50                   	push   %eax
801037d1:	e8 ca cf ff ff       	call   801007a0 <fileclose>
801037d6:	83 c4 10             	add    $0x10,%esp
  return -1;
801037d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801037de:	c9                   	leave  
801037df:	c3                   	ret    

801037e0 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
801037e0:	55                   	push   %ebp
801037e1:	89 e5                	mov    %esp,%ebp
801037e3:	83 ec 08             	sub    $0x8,%esp
  acquire(&p->lock);
801037e6:	8b 45 08             	mov    0x8(%ebp),%eax
801037e9:	83 ec 0c             	sub    $0xc,%esp
801037ec:	50                   	push   %eax
801037ed:	e8 1a 0e 00 00       	call   8010460c <acquire>
801037f2:	83 c4 10             	add    $0x10,%esp
  if(writable){
801037f5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
801037f9:	74 23                	je     8010381e <pipeclose+0x3e>
    p->writeopen = 0;
801037fb:	8b 45 08             	mov    0x8(%ebp),%eax
801037fe:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
80103805:	00 00 00 
    wakeup(&p->nread);
80103808:	8b 45 08             	mov    0x8(%ebp),%eax
8010380b:	05 34 02 00 00       	add    $0x234,%eax
80103810:	83 ec 0c             	sub    $0xc,%esp
80103813:	50                   	push   %eax
80103814:	e8 e5 0b 00 00       	call   801043fe <wakeup>
80103819:	83 c4 10             	add    $0x10,%esp
8010381c:	eb 21                	jmp    8010383f <pipeclose+0x5f>
  } else {
    p->readopen = 0;
8010381e:	8b 45 08             	mov    0x8(%ebp),%eax
80103821:	c7 80 3c 02 00 00 00 	movl   $0x0,0x23c(%eax)
80103828:	00 00 00 
    wakeup(&p->nwrite);
8010382b:	8b 45 08             	mov    0x8(%ebp),%eax
8010382e:	05 38 02 00 00       	add    $0x238,%eax
80103833:	83 ec 0c             	sub    $0xc,%esp
80103836:	50                   	push   %eax
80103837:	e8 c2 0b 00 00       	call   801043fe <wakeup>
8010383c:	83 c4 10             	add    $0x10,%esp
  }
  if(p->readopen == 0 && p->writeopen == 0){
8010383f:	8b 45 08             	mov    0x8(%ebp),%eax
80103842:	8b 80 3c 02 00 00    	mov    0x23c(%eax),%eax
80103848:	85 c0                	test   %eax,%eax
8010384a:	75 2c                	jne    80103878 <pipeclose+0x98>
8010384c:	8b 45 08             	mov    0x8(%ebp),%eax
8010384f:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
80103855:	85 c0                	test   %eax,%eax
80103857:	75 1f                	jne    80103878 <pipeclose+0x98>
    release(&p->lock);
80103859:	8b 45 08             	mov    0x8(%ebp),%eax
8010385c:	83 ec 0c             	sub    $0xc,%esp
8010385f:	50                   	push   %eax
80103860:	e8 0e 0e 00 00       	call   80104673 <release>
80103865:	83 c4 10             	add    $0x10,%esp
    kfree((char*)p);
80103868:	83 ec 0c             	sub    $0xc,%esp
8010386b:	ff 75 08             	pushl  0x8(%ebp)
8010386e:	e8 fa ec ff ff       	call   8010256d <kfree>
80103873:	83 c4 10             	add    $0x10,%esp
80103876:	eb 0f                	jmp    80103887 <pipeclose+0xa7>
  } else
    release(&p->lock);
80103878:	8b 45 08             	mov    0x8(%ebp),%eax
8010387b:	83 ec 0c             	sub    $0xc,%esp
8010387e:	50                   	push   %eax
8010387f:	e8 ef 0d 00 00       	call   80104673 <release>
80103884:	83 c4 10             	add    $0x10,%esp
}
80103887:	90                   	nop
80103888:	c9                   	leave  
80103889:	c3                   	ret    

8010388a <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
8010388a:	55                   	push   %ebp
8010388b:	89 e5                	mov    %esp,%ebp
8010388d:	83 ec 18             	sub    $0x18,%esp
  int i;

  acquire(&p->lock);
80103890:	8b 45 08             	mov    0x8(%ebp),%eax
80103893:	83 ec 0c             	sub    $0xc,%esp
80103896:	50                   	push   %eax
80103897:	e8 70 0d 00 00       	call   8010460c <acquire>
8010389c:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < n; i++){
8010389f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801038a6:	e9 ad 00 00 00       	jmp    80103958 <pipewrite+0xce>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
801038ab:	8b 45 08             	mov    0x8(%ebp),%eax
801038ae:	8b 80 3c 02 00 00    	mov    0x23c(%eax),%eax
801038b4:	85 c0                	test   %eax,%eax
801038b6:	74 0d                	je     801038c5 <pipewrite+0x3b>
801038b8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801038be:	8b 40 24             	mov    0x24(%eax),%eax
801038c1:	85 c0                	test   %eax,%eax
801038c3:	74 19                	je     801038de <pipewrite+0x54>
        release(&p->lock);
801038c5:	8b 45 08             	mov    0x8(%ebp),%eax
801038c8:	83 ec 0c             	sub    $0xc,%esp
801038cb:	50                   	push   %eax
801038cc:	e8 a2 0d 00 00       	call   80104673 <release>
801038d1:	83 c4 10             	add    $0x10,%esp
        return -1;
801038d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801038d9:	e9 a8 00 00 00       	jmp    80103986 <pipewrite+0xfc>
      }
      wakeup(&p->nread);
801038de:	8b 45 08             	mov    0x8(%ebp),%eax
801038e1:	05 34 02 00 00       	add    $0x234,%eax
801038e6:	83 ec 0c             	sub    $0xc,%esp
801038e9:	50                   	push   %eax
801038ea:	e8 0f 0b 00 00       	call   801043fe <wakeup>
801038ef:	83 c4 10             	add    $0x10,%esp
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801038f2:	8b 45 08             	mov    0x8(%ebp),%eax
801038f5:	8b 55 08             	mov    0x8(%ebp),%edx
801038f8:	81 c2 38 02 00 00    	add    $0x238,%edx
801038fe:	83 ec 08             	sub    $0x8,%esp
80103901:	50                   	push   %eax
80103902:	52                   	push   %edx
80103903:	e8 0b 0a 00 00       	call   80104313 <sleep>
80103908:	83 c4 10             	add    $0x10,%esp
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010390b:	8b 45 08             	mov    0x8(%ebp),%eax
8010390e:	8b 90 38 02 00 00    	mov    0x238(%eax),%edx
80103914:	8b 45 08             	mov    0x8(%ebp),%eax
80103917:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
8010391d:	05 00 02 00 00       	add    $0x200,%eax
80103922:	39 c2                	cmp    %eax,%edx
80103924:	74 85                	je     801038ab <pipewrite+0x21>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103926:	8b 45 08             	mov    0x8(%ebp),%eax
80103929:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
8010392f:	8d 48 01             	lea    0x1(%eax),%ecx
80103932:	8b 55 08             	mov    0x8(%ebp),%edx
80103935:	89 8a 38 02 00 00    	mov    %ecx,0x238(%edx)
8010393b:	25 ff 01 00 00       	and    $0x1ff,%eax
80103940:	89 c1                	mov    %eax,%ecx
80103942:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103945:	8b 45 0c             	mov    0xc(%ebp),%eax
80103948:	01 d0                	add    %edx,%eax
8010394a:	0f b6 10             	movzbl (%eax),%edx
8010394d:	8b 45 08             	mov    0x8(%ebp),%eax
80103950:	88 54 08 34          	mov    %dl,0x34(%eax,%ecx,1)
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103954:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80103958:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010395b:	3b 45 10             	cmp    0x10(%ebp),%eax
8010395e:	7c ab                	jl     8010390b <pipewrite+0x81>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103960:	8b 45 08             	mov    0x8(%ebp),%eax
80103963:	05 34 02 00 00       	add    $0x234,%eax
80103968:	83 ec 0c             	sub    $0xc,%esp
8010396b:	50                   	push   %eax
8010396c:	e8 8d 0a 00 00       	call   801043fe <wakeup>
80103971:	83 c4 10             	add    $0x10,%esp
  release(&p->lock);
80103974:	8b 45 08             	mov    0x8(%ebp),%eax
80103977:	83 ec 0c             	sub    $0xc,%esp
8010397a:	50                   	push   %eax
8010397b:	e8 f3 0c 00 00       	call   80104673 <release>
80103980:	83 c4 10             	add    $0x10,%esp
  return n;
80103983:	8b 45 10             	mov    0x10(%ebp),%eax
}
80103986:	c9                   	leave  
80103987:	c3                   	ret    

80103988 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80103988:	55                   	push   %ebp
80103989:	89 e5                	mov    %esp,%ebp
8010398b:	53                   	push   %ebx
8010398c:	83 ec 14             	sub    $0x14,%esp
  int i;

  acquire(&p->lock);
8010398f:	8b 45 08             	mov    0x8(%ebp),%eax
80103992:	83 ec 0c             	sub    $0xc,%esp
80103995:	50                   	push   %eax
80103996:	e8 71 0c 00 00       	call   8010460c <acquire>
8010399b:	83 c4 10             	add    $0x10,%esp
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010399e:	eb 3f                	jmp    801039df <piperead+0x57>
    if(proc->killed){
801039a0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801039a6:	8b 40 24             	mov    0x24(%eax),%eax
801039a9:	85 c0                	test   %eax,%eax
801039ab:	74 19                	je     801039c6 <piperead+0x3e>
      release(&p->lock);
801039ad:	8b 45 08             	mov    0x8(%ebp),%eax
801039b0:	83 ec 0c             	sub    $0xc,%esp
801039b3:	50                   	push   %eax
801039b4:	e8 ba 0c 00 00       	call   80104673 <release>
801039b9:	83 c4 10             	add    $0x10,%esp
      return -1;
801039bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801039c1:	e9 bf 00 00 00       	jmp    80103a85 <piperead+0xfd>
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801039c6:	8b 45 08             	mov    0x8(%ebp),%eax
801039c9:	8b 55 08             	mov    0x8(%ebp),%edx
801039cc:	81 c2 34 02 00 00    	add    $0x234,%edx
801039d2:	83 ec 08             	sub    $0x8,%esp
801039d5:	50                   	push   %eax
801039d6:	52                   	push   %edx
801039d7:	e8 37 09 00 00       	call   80104313 <sleep>
801039dc:	83 c4 10             	add    $0x10,%esp
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801039df:	8b 45 08             	mov    0x8(%ebp),%eax
801039e2:	8b 90 34 02 00 00    	mov    0x234(%eax),%edx
801039e8:	8b 45 08             	mov    0x8(%ebp),%eax
801039eb:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
801039f1:	39 c2                	cmp    %eax,%edx
801039f3:	75 0d                	jne    80103a02 <piperead+0x7a>
801039f5:	8b 45 08             	mov    0x8(%ebp),%eax
801039f8:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
801039fe:	85 c0                	test   %eax,%eax
80103a00:	75 9e                	jne    801039a0 <piperead+0x18>
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103a02:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80103a09:	eb 49                	jmp    80103a54 <piperead+0xcc>
    if(p->nread == p->nwrite)
80103a0b:	8b 45 08             	mov    0x8(%ebp),%eax
80103a0e:	8b 90 34 02 00 00    	mov    0x234(%eax),%edx
80103a14:	8b 45 08             	mov    0x8(%ebp),%eax
80103a17:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
80103a1d:	39 c2                	cmp    %eax,%edx
80103a1f:	74 3d                	je     80103a5e <piperead+0xd6>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103a21:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103a24:	8b 45 0c             	mov    0xc(%ebp),%eax
80103a27:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
80103a2a:	8b 45 08             	mov    0x8(%ebp),%eax
80103a2d:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
80103a33:	8d 48 01             	lea    0x1(%eax),%ecx
80103a36:	8b 55 08             	mov    0x8(%ebp),%edx
80103a39:	89 8a 34 02 00 00    	mov    %ecx,0x234(%edx)
80103a3f:	25 ff 01 00 00       	and    $0x1ff,%eax
80103a44:	89 c2                	mov    %eax,%edx
80103a46:	8b 45 08             	mov    0x8(%ebp),%eax
80103a49:	0f b6 44 10 34       	movzbl 0x34(%eax,%edx,1),%eax
80103a4e:	88 03                	mov    %al,(%ebx)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103a50:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80103a54:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103a57:	3b 45 10             	cmp    0x10(%ebp),%eax
80103a5a:	7c af                	jl     80103a0b <piperead+0x83>
80103a5c:	eb 01                	jmp    80103a5f <piperead+0xd7>
    if(p->nread == p->nwrite)
      break;
80103a5e:	90                   	nop
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103a5f:	8b 45 08             	mov    0x8(%ebp),%eax
80103a62:	05 38 02 00 00       	add    $0x238,%eax
80103a67:	83 ec 0c             	sub    $0xc,%esp
80103a6a:	50                   	push   %eax
80103a6b:	e8 8e 09 00 00       	call   801043fe <wakeup>
80103a70:	83 c4 10             	add    $0x10,%esp
  release(&p->lock);
80103a73:	8b 45 08             	mov    0x8(%ebp),%eax
80103a76:	83 ec 0c             	sub    $0xc,%esp
80103a79:	50                   	push   %eax
80103a7a:	e8 f4 0b 00 00       	call   80104673 <release>
80103a7f:	83 c4 10             	add    $0x10,%esp
  return i;
80103a82:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80103a85:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a88:	c9                   	leave  
80103a89:	c3                   	ret    

80103a8a <readeflags>:
  asm volatile("ltr %0" : : "r" (sel));
}

static inline uint
readeflags(void)
{
80103a8a:	55                   	push   %ebp
80103a8b:	89 e5                	mov    %esp,%ebp
80103a8d:	83 ec 10             	sub    $0x10,%esp
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103a90:	9c                   	pushf  
80103a91:	58                   	pop    %eax
80103a92:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return eflags;
80103a95:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80103a98:	c9                   	leave  
80103a99:	c3                   	ret    

80103a9a <sti>:
  asm volatile("cli");
}

static inline void
sti(void)
{
80103a9a:	55                   	push   %ebp
80103a9b:	89 e5                	mov    %esp,%ebp
  asm volatile("sti");
80103a9d:	fb                   	sti    
}
80103a9e:	90                   	nop
80103a9f:	5d                   	pop    %ebp
80103aa0:	c3                   	ret    

80103aa1 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
80103aa1:	55                   	push   %ebp
80103aa2:	89 e5                	mov    %esp,%ebp
80103aa4:	83 ec 08             	sub    $0x8,%esp
  initlock(&ptable.lock, "ptable");
80103aa7:	83 ec 08             	sub    $0x8,%esp
80103aaa:	68 dd 9a 10 80       	push   $0x80109add
80103aaf:	68 a0 0f 11 80       	push   $0x80110fa0
80103ab4:	e8 31 0b 00 00       	call   801045ea <initlock>
80103ab9:	83 c4 10             	add    $0x10,%esp
}
80103abc:	90                   	nop
80103abd:	c9                   	leave  
80103abe:	c3                   	ret    

80103abf <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103abf:	55                   	push   %ebp
80103ac0:	89 e5                	mov    %esp,%ebp
80103ac2:	83 ec 18             	sub    $0x18,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
80103ac5:	83 ec 0c             	sub    $0xc,%esp
80103ac8:	68 a0 0f 11 80       	push   $0x80110fa0
80103acd:	e8 3a 0b 00 00       	call   8010460c <acquire>
80103ad2:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ad5:	c7 45 f4 d4 0f 11 80 	movl   $0x80110fd4,-0xc(%ebp)
80103adc:	eb 0e                	jmp    80103aec <allocproc+0x2d>
    if(p->state == UNUSED)
80103ade:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103ae1:	8b 40 0c             	mov    0xc(%eax),%eax
80103ae4:	85 c0                	test   %eax,%eax
80103ae6:	74 27                	je     80103b0f <allocproc+0x50>
{
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ae8:	83 45 f4 7c          	addl   $0x7c,-0xc(%ebp)
80103aec:	81 7d f4 d4 2e 11 80 	cmpl   $0x80112ed4,-0xc(%ebp)
80103af3:	72 e9                	jb     80103ade <allocproc+0x1f>
    if(p->state == UNUSED)
      goto found;
  release(&ptable.lock);
80103af5:	83 ec 0c             	sub    $0xc,%esp
80103af8:	68 a0 0f 11 80       	push   $0x80110fa0
80103afd:	e8 71 0b 00 00       	call   80104673 <release>
80103b02:	83 c4 10             	add    $0x10,%esp
  return 0;
80103b05:	b8 00 00 00 00       	mov    $0x0,%eax
80103b0a:	e9 b4 00 00 00       	jmp    80103bc3 <allocproc+0x104>
  char *sp;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;
80103b0f:	90                   	nop
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
80103b10:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103b13:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
  p->pid = nextpid++;
80103b1a:	a1 04 c0 10 80       	mov    0x8010c004,%eax
80103b1f:	8d 50 01             	lea    0x1(%eax),%edx
80103b22:	89 15 04 c0 10 80    	mov    %edx,0x8010c004
80103b28:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103b2b:	89 42 10             	mov    %eax,0x10(%edx)
  release(&ptable.lock);
80103b2e:	83 ec 0c             	sub    $0xc,%esp
80103b31:	68 a0 0f 11 80       	push   $0x80110fa0
80103b36:	e8 38 0b 00 00       	call   80104673 <release>
80103b3b:	83 c4 10             	add    $0x10,%esp

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103b3e:	e8 c7 ea ff ff       	call   8010260a <kalloc>
80103b43:	89 c2                	mov    %eax,%edx
80103b45:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103b48:	89 50 08             	mov    %edx,0x8(%eax)
80103b4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103b4e:	8b 40 08             	mov    0x8(%eax),%eax
80103b51:	85 c0                	test   %eax,%eax
80103b53:	75 11                	jne    80103b66 <allocproc+0xa7>
    p->state = UNUSED;
80103b55:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103b58:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    return 0;
80103b5f:	b8 00 00 00 00       	mov    $0x0,%eax
80103b64:	eb 5d                	jmp    80103bc3 <allocproc+0x104>
  }
  sp = p->kstack + KSTACKSIZE;
80103b66:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103b69:	8b 40 08             	mov    0x8(%eax),%eax
80103b6c:	05 00 10 00 00       	add    $0x1000,%eax
80103b71:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103b74:	83 6d f0 4c          	subl   $0x4c,-0x10(%ebp)
  p->tf = (struct trapframe*)sp;
80103b78:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103b7b:	8b 55 f0             	mov    -0x10(%ebp),%edx
80103b7e:	89 50 18             	mov    %edx,0x18(%eax)
  
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
80103b81:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
  *(uint*)sp = (uint)trapret;
80103b85:	ba 0a 5d 10 80       	mov    $0x80105d0a,%edx
80103b8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103b8d:	89 10                	mov    %edx,(%eax)

  sp -= sizeof *p->context;
80103b8f:	83 6d f0 14          	subl   $0x14,-0x10(%ebp)
  p->context = (struct context*)sp;
80103b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103b96:	8b 55 f0             	mov    -0x10(%ebp),%edx
80103b99:	89 50 1c             	mov    %edx,0x1c(%eax)
  memset(p->context, 0, sizeof *p->context);
80103b9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103b9f:	8b 40 1c             	mov    0x1c(%eax),%eax
80103ba2:	83 ec 04             	sub    $0x4,%esp
80103ba5:	6a 14                	push   $0x14
80103ba7:	6a 00                	push   $0x0
80103ba9:	50                   	push   %eax
80103baa:	e8 c0 0c 00 00       	call   8010486f <memset>
80103baf:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
80103bb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103bb5:	8b 40 1c             	mov    0x1c(%eax),%eax
80103bb8:	ba e2 42 10 80       	mov    $0x801042e2,%edx
80103bbd:	89 50 10             	mov    %edx,0x10(%eax)

  return p;
80103bc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80103bc3:	c9                   	leave  
80103bc4:	c3                   	ret    

80103bc5 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
80103bc5:	55                   	push   %ebp
80103bc6:	89 e5                	mov    %esp,%ebp
80103bc8:	83 ec 18             	sub    $0x18,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];
  
  p = allocproc();
80103bcb:	e8 ef fe ff ff       	call   80103abf <allocproc>
80103bd0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  initproc = p;
80103bd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103bd6:	a3 08 c7 10 80       	mov    %eax,0x8010c708
  if((p->pgdir = setupkvm()) == 0)
80103bdb:	e8 ef 37 00 00       	call   801073cf <setupkvm>
80103be0:	89 c2                	mov    %eax,%edx
80103be2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103be5:	89 50 04             	mov    %edx,0x4(%eax)
80103be8:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103beb:	8b 40 04             	mov    0x4(%eax),%eax
80103bee:	85 c0                	test   %eax,%eax
80103bf0:	75 0d                	jne    80103bff <userinit+0x3a>
    panic("userinit: out of memory?");
80103bf2:	83 ec 0c             	sub    $0xc,%esp
80103bf5:	68 e4 9a 10 80       	push   $0x80109ae4
80103bfa:	e8 50 4b 00 00       	call   8010874f <panic>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103bff:	ba 2c 00 00 00       	mov    $0x2c,%edx
80103c04:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c07:	8b 40 04             	mov    0x4(%eax),%eax
80103c0a:	83 ec 04             	sub    $0x4,%esp
80103c0d:	52                   	push   %edx
80103c0e:	68 f1 c5 10 80       	push   $0x8010c5f1
80103c13:	50                   	push   %eax
80103c14:	e8 10 3a 00 00       	call   80107629 <inituvm>
80103c19:	83 c4 10             	add    $0x10,%esp
  p->sz = PGSIZE;
80103c1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c1f:	c7 00 00 10 00 00    	movl   $0x1000,(%eax)
  memset(p->tf, 0, sizeof(*p->tf));
80103c25:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c28:	8b 40 18             	mov    0x18(%eax),%eax
80103c2b:	83 ec 04             	sub    $0x4,%esp
80103c2e:	6a 4c                	push   $0x4c
80103c30:	6a 00                	push   $0x0
80103c32:	50                   	push   %eax
80103c33:	e8 37 0c 00 00       	call   8010486f <memset>
80103c38:	83 c4 10             	add    $0x10,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103c3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c3e:	8b 40 18             	mov    0x18(%eax),%eax
80103c41:	66 c7 40 3c 23 00    	movw   $0x23,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103c47:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c4a:	8b 40 18             	mov    0x18(%eax),%eax
80103c4d:	66 c7 40 2c 2b 00    	movw   $0x2b,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103c53:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c56:	8b 40 18             	mov    0x18(%eax),%eax
80103c59:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103c5c:	8b 52 18             	mov    0x18(%edx),%edx
80103c5f:	0f b7 52 2c          	movzwl 0x2c(%edx),%edx
80103c63:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103c67:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c6a:	8b 40 18             	mov    0x18(%eax),%eax
80103c6d:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103c70:	8b 52 18             	mov    0x18(%edx),%edx
80103c73:	0f b7 52 2c          	movzwl 0x2c(%edx),%edx
80103c77:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
80103c7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c7e:	8b 40 18             	mov    0x18(%eax),%eax
80103c81:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103c88:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c8b:	8b 40 18             	mov    0x18(%eax),%eax
80103c8e:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103c95:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c98:	8b 40 18             	mov    0x18(%eax),%eax
80103c9b:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103ca2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103ca5:	83 c0 6c             	add    $0x6c,%eax
80103ca8:	83 ec 04             	sub    $0x4,%esp
80103cab:	6a 10                	push   $0x10
80103cad:	68 fd 9a 10 80       	push   $0x80109afd
80103cb2:	50                   	push   %eax
80103cb3:	e8 ba 0d 00 00       	call   80104a72 <safestrcpy>
80103cb8:	83 c4 10             	add    $0x10,%esp
  p->cwd = namei("/");
80103cbb:	83 ec 0c             	sub    $0xc,%esp
80103cbe:	68 06 9b 10 80       	push   $0x80109b06
80103cc3:	e8 40 e2 ff ff       	call   80101f08 <namei>
80103cc8:	83 c4 10             	add    $0x10,%esp
80103ccb:	89 c2                	mov    %eax,%edx
80103ccd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103cd0:	89 50 68             	mov    %edx,0x68(%eax)

  p->state = RUNNABLE;
80103cd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103cd6:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
}
80103cdd:	90                   	nop
80103cde:	c9                   	leave  
80103cdf:	c3                   	ret    

80103ce0 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	83 ec 18             	sub    $0x18,%esp
  uint sz;
  
  sz = proc->sz;
80103ce6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103cec:	8b 00                	mov    (%eax),%eax
80103cee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(n > 0){
80103cf1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80103cf5:	7e 31                	jle    80103d28 <growproc+0x48>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
80103cf7:	8b 55 08             	mov    0x8(%ebp),%edx
80103cfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103cfd:	01 c2                	add    %eax,%edx
80103cff:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d05:	8b 40 04             	mov    0x4(%eax),%eax
80103d08:	83 ec 04             	sub    $0x4,%esp
80103d0b:	52                   	push   %edx
80103d0c:	ff 75 f4             	pushl  -0xc(%ebp)
80103d0f:	50                   	push   %eax
80103d10:	e8 61 3a 00 00       	call   80107776 <allocuvm>
80103d15:	83 c4 10             	add    $0x10,%esp
80103d18:	89 45 f4             	mov    %eax,-0xc(%ebp)
80103d1b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80103d1f:	75 3e                	jne    80103d5f <growproc+0x7f>
      return -1;
80103d21:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103d26:	eb 59                	jmp    80103d81 <growproc+0xa1>
  } else if(n < 0){
80103d28:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80103d2c:	79 31                	jns    80103d5f <growproc+0x7f>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
80103d2e:	8b 55 08             	mov    0x8(%ebp),%edx
80103d31:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103d34:	01 c2                	add    %eax,%edx
80103d36:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d3c:	8b 40 04             	mov    0x4(%eax),%eax
80103d3f:	83 ec 04             	sub    $0x4,%esp
80103d42:	52                   	push   %edx
80103d43:	ff 75 f4             	pushl  -0xc(%ebp)
80103d46:	50                   	push   %eax
80103d47:	e8 f3 3a 00 00       	call   8010783f <deallocuvm>
80103d4c:	83 c4 10             	add    $0x10,%esp
80103d4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
80103d52:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80103d56:	75 07                	jne    80103d5f <growproc+0x7f>
      return -1;
80103d58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103d5d:	eb 22                	jmp    80103d81 <growproc+0xa1>
  }
  proc->sz = sz;
80103d5f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d65:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103d68:	89 10                	mov    %edx,(%eax)
  switchuvm(proc);
80103d6a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d70:	83 ec 0c             	sub    $0xc,%esp
80103d73:	50                   	push   %eax
80103d74:	e8 3d 37 00 00       	call   801074b6 <switchuvm>
80103d79:	83 c4 10             	add    $0x10,%esp
  return 0;
80103d7c:	b8 00 00 00 00       	mov    $0x0,%eax
}
80103d81:	c9                   	leave  
80103d82:	c3                   	ret    

80103d83 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103d83:	55                   	push   %ebp
80103d84:	89 e5                	mov    %esp,%ebp
80103d86:	57                   	push   %edi
80103d87:	56                   	push   %esi
80103d88:	53                   	push   %ebx
80103d89:	83 ec 1c             	sub    $0x1c,%esp
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0)
80103d8c:	e8 2e fd ff ff       	call   80103abf <allocproc>
80103d91:	89 45 e0             	mov    %eax,-0x20(%ebp)
80103d94:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80103d98:	75 0a                	jne    80103da4 <fork+0x21>
    return -1;
80103d9a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103d9f:	e9 48 01 00 00       	jmp    80103eec <fork+0x169>

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
80103da4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103daa:	8b 10                	mov    (%eax),%edx
80103dac:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103db2:	8b 40 04             	mov    0x4(%eax),%eax
80103db5:	83 ec 08             	sub    $0x8,%esp
80103db8:	52                   	push   %edx
80103db9:	50                   	push   %eax
80103dba:	e8 1e 3c 00 00       	call   801079dd <copyuvm>
80103dbf:	83 c4 10             	add    $0x10,%esp
80103dc2:	89 c2                	mov    %eax,%edx
80103dc4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103dc7:	89 50 04             	mov    %edx,0x4(%eax)
80103dca:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103dcd:	8b 40 04             	mov    0x4(%eax),%eax
80103dd0:	85 c0                	test   %eax,%eax
80103dd2:	75 30                	jne    80103e04 <fork+0x81>
    kfree(np->kstack);
80103dd4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103dd7:	8b 40 08             	mov    0x8(%eax),%eax
80103dda:	83 ec 0c             	sub    $0xc,%esp
80103ddd:	50                   	push   %eax
80103dde:	e8 8a e7 ff ff       	call   8010256d <kfree>
80103de3:	83 c4 10             	add    $0x10,%esp
    np->kstack = 0;
80103de6:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103de9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    np->state = UNUSED;
80103df0:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103df3:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    return -1;
80103dfa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103dff:	e9 e8 00 00 00       	jmp    80103eec <fork+0x169>
  }
  np->sz = proc->sz;
80103e04:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e0a:	8b 10                	mov    (%eax),%edx
80103e0c:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103e0f:	89 10                	mov    %edx,(%eax)
  np->parent = proc;
80103e11:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103e18:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103e1b:	89 50 14             	mov    %edx,0x14(%eax)
  *np->tf = *proc->tf;
80103e1e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103e21:	8b 50 18             	mov    0x18(%eax),%edx
80103e24:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e2a:	8b 40 18             	mov    0x18(%eax),%eax
80103e2d:	89 c3                	mov    %eax,%ebx
80103e2f:	b8 13 00 00 00       	mov    $0x13,%eax
80103e34:	89 d7                	mov    %edx,%edi
80103e36:	89 de                	mov    %ebx,%esi
80103e38:	89 c1                	mov    %eax,%ecx
80103e3a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103e3c:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103e3f:	8b 40 18             	mov    0x18(%eax),%eax
80103e42:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)

  for(i = 0; i < NOFILE; i++)
80103e49:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80103e50:	eb 43                	jmp    80103e95 <fork+0x112>
    if(proc->ofile[i])
80103e52:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e58:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103e5b:	83 c2 08             	add    $0x8,%edx
80103e5e:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80103e62:	85 c0                	test   %eax,%eax
80103e64:	74 2b                	je     80103e91 <fork+0x10e>
      np->ofile[i] = filedup(proc->ofile[i]);
80103e66:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e6c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103e6f:	83 c2 08             	add    $0x8,%edx
80103e72:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80103e76:	83 ec 0c             	sub    $0xc,%esp
80103e79:	50                   	push   %eax
80103e7a:	e8 d0 c8 ff ff       	call   8010074f <filedup>
80103e7f:	83 c4 10             	add    $0x10,%esp
80103e82:	89 c1                	mov    %eax,%ecx
80103e84:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103e87:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103e8a:	83 c2 08             	add    $0x8,%edx
80103e8d:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103e91:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80103e95:	83 7d e4 0f          	cmpl   $0xf,-0x1c(%ebp)
80103e99:	7e b7                	jle    80103e52 <fork+0xcf>
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
80103e9b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ea1:	8b 40 68             	mov    0x68(%eax),%eax
80103ea4:	83 ec 0c             	sub    $0xc,%esp
80103ea7:	50                   	push   %eax
80103ea8:	e8 93 d2 ff ff       	call   80101140 <idup>
80103ead:	83 c4 10             	add    $0x10,%esp
80103eb0:	89 c2                	mov    %eax,%edx
80103eb2:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103eb5:	89 50 68             	mov    %edx,0x68(%eax)
 
  pid = np->pid;
80103eb8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103ebb:	8b 40 10             	mov    0x10(%eax),%eax
80103ebe:	89 45 dc             	mov    %eax,-0x24(%ebp)
  np->state = RUNNABLE;
80103ec1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103ec4:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103ecb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ed1:	8d 50 6c             	lea    0x6c(%eax),%edx
80103ed4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103ed7:	83 c0 6c             	add    $0x6c,%eax
80103eda:	83 ec 04             	sub    $0x4,%esp
80103edd:	6a 10                	push   $0x10
80103edf:	52                   	push   %edx
80103ee0:	50                   	push   %eax
80103ee1:	e8 8c 0b 00 00       	call   80104a72 <safestrcpy>
80103ee6:	83 c4 10             	add    $0x10,%esp
  return pid;
80103ee9:	8b 45 dc             	mov    -0x24(%ebp),%eax
}
80103eec:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103eef:	5b                   	pop    %ebx
80103ef0:	5e                   	pop    %esi
80103ef1:	5f                   	pop    %edi
80103ef2:	5d                   	pop    %ebp
80103ef3:	c3                   	ret    

80103ef4 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103ef4:	55                   	push   %ebp
80103ef5:	89 e5                	mov    %esp,%ebp
80103ef7:	83 ec 18             	sub    $0x18,%esp
  struct proc *p;
  int fd;

  if(proc == initproc)
80103efa:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103f01:	a1 08 c7 10 80       	mov    0x8010c708,%eax
80103f06:	39 c2                	cmp    %eax,%edx
80103f08:	75 0d                	jne    80103f17 <exit+0x23>
    panic("init exiting");
80103f0a:	83 ec 0c             	sub    $0xc,%esp
80103f0d:	68 08 9b 10 80       	push   $0x80109b08
80103f12:	e8 38 48 00 00       	call   8010874f <panic>

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103f17:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
80103f1e:	eb 48                	jmp    80103f68 <exit+0x74>
    if(proc->ofile[fd]){
80103f20:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f26:	8b 55 f0             	mov    -0x10(%ebp),%edx
80103f29:	83 c2 08             	add    $0x8,%edx
80103f2c:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80103f30:	85 c0                	test   %eax,%eax
80103f32:	74 30                	je     80103f64 <exit+0x70>
      fileclose(proc->ofile[fd]);
80103f34:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f3a:	8b 55 f0             	mov    -0x10(%ebp),%edx
80103f3d:	83 c2 08             	add    $0x8,%edx
80103f40:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80103f44:	83 ec 0c             	sub    $0xc,%esp
80103f47:	50                   	push   %eax
80103f48:	e8 53 c8 ff ff       	call   801007a0 <fileclose>
80103f4d:	83 c4 10             	add    $0x10,%esp
      proc->ofile[fd] = 0;
80103f50:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f56:	8b 55 f0             	mov    -0x10(%ebp),%edx
80103f59:	83 c2 08             	add    $0x8,%edx
80103f5c:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
80103f63:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103f64:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
80103f68:	83 7d f0 0f          	cmpl   $0xf,-0x10(%ebp)
80103f6c:	7e b2                	jle    80103f20 <exit+0x2c>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  iput(proc->cwd);
80103f6e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f74:	8b 40 68             	mov    0x68(%eax),%eax
80103f77:	83 ec 0c             	sub    $0xc,%esp
80103f7a:	50                   	push   %eax
80103f7b:	e8 c4 d3 ff ff       	call   80101344 <iput>
80103f80:	83 c4 10             	add    $0x10,%esp
  proc->cwd = 0;
80103f83:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f89:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
80103f90:	83 ec 0c             	sub    $0xc,%esp
80103f93:	68 a0 0f 11 80       	push   $0x80110fa0
80103f98:	e8 6f 06 00 00       	call   8010460c <acquire>
80103f9d:	83 c4 10             	add    $0x10,%esp

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103fa0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103fa6:	8b 40 14             	mov    0x14(%eax),%eax
80103fa9:	83 ec 0c             	sub    $0xc,%esp
80103fac:	50                   	push   %eax
80103fad:	e8 0d 04 00 00       	call   801043bf <wakeup1>
80103fb2:	83 c4 10             	add    $0x10,%esp

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fb5:	c7 45 f4 d4 0f 11 80 	movl   $0x80110fd4,-0xc(%ebp)
80103fbc:	eb 3c                	jmp    80103ffa <exit+0x106>
    if(p->parent == proc){
80103fbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103fc1:	8b 50 14             	mov    0x14(%eax),%edx
80103fc4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103fca:	39 c2                	cmp    %eax,%edx
80103fcc:	75 28                	jne    80103ff6 <exit+0x102>
      p->parent = initproc;
80103fce:	8b 15 08 c7 10 80    	mov    0x8010c708,%edx
80103fd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103fd7:	89 50 14             	mov    %edx,0x14(%eax)
      if(p->state == ZOMBIE)
80103fda:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103fdd:	8b 40 0c             	mov    0xc(%eax),%eax
80103fe0:	83 f8 05             	cmp    $0x5,%eax
80103fe3:	75 11                	jne    80103ff6 <exit+0x102>
        wakeup1(initproc);
80103fe5:	a1 08 c7 10 80       	mov    0x8010c708,%eax
80103fea:	83 ec 0c             	sub    $0xc,%esp
80103fed:	50                   	push   %eax
80103fee:	e8 cc 03 00 00       	call   801043bf <wakeup1>
80103ff3:	83 c4 10             	add    $0x10,%esp

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ff6:	83 45 f4 7c          	addl   $0x7c,-0xc(%ebp)
80103ffa:	81 7d f4 d4 2e 11 80 	cmpl   $0x80112ed4,-0xc(%ebp)
80104001:	72 bb                	jb     80103fbe <exit+0xca>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80104003:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104009:	c7 40 0c 05 00 00 00 	movl   $0x5,0xc(%eax)
  sched();
80104010:	e8 d6 01 00 00       	call   801041eb <sched>
  panic("zombie exit");
80104015:	83 ec 0c             	sub    $0xc,%esp
80104018:	68 15 9b 10 80       	push   $0x80109b15
8010401d:	e8 2d 47 00 00       	call   8010874f <panic>

80104022 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80104022:	55                   	push   %ebp
80104023:	89 e5                	mov    %esp,%ebp
80104025:	83 ec 18             	sub    $0x18,%esp
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80104028:	83 ec 0c             	sub    $0xc,%esp
8010402b:	68 a0 0f 11 80       	push   $0x80110fa0
80104030:	e8 d7 05 00 00       	call   8010460c <acquire>
80104035:	83 c4 10             	add    $0x10,%esp
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
80104038:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010403f:	c7 45 f4 d4 0f 11 80 	movl   $0x80110fd4,-0xc(%ebp)
80104046:	e9 a6 00 00 00       	jmp    801040f1 <wait+0xcf>
      if(p->parent != proc)
8010404b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010404e:	8b 50 14             	mov    0x14(%eax),%edx
80104051:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104057:	39 c2                	cmp    %eax,%edx
80104059:	0f 85 8d 00 00 00    	jne    801040ec <wait+0xca>
        continue;
      havekids = 1;
8010405f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
      if(p->state == ZOMBIE){
80104066:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104069:	8b 40 0c             	mov    0xc(%eax),%eax
8010406c:	83 f8 05             	cmp    $0x5,%eax
8010406f:	75 7c                	jne    801040ed <wait+0xcb>
        // Found one.
        pid = p->pid;
80104071:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104074:	8b 40 10             	mov    0x10(%eax),%eax
80104077:	89 45 ec             	mov    %eax,-0x14(%ebp)
        kfree(p->kstack);
8010407a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010407d:	8b 40 08             	mov    0x8(%eax),%eax
80104080:	83 ec 0c             	sub    $0xc,%esp
80104083:	50                   	push   %eax
80104084:	e8 e4 e4 ff ff       	call   8010256d <kfree>
80104089:	83 c4 10             	add    $0x10,%esp
        p->kstack = 0;
8010408c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010408f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
        freevm(p->pgdir);
80104096:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104099:	8b 40 04             	mov    0x4(%eax),%eax
8010409c:	83 ec 0c             	sub    $0xc,%esp
8010409f:	50                   	push   %eax
801040a0:	e8 57 38 00 00       	call   801078fc <freevm>
801040a5:	83 c4 10             	add    $0x10,%esp
        p->state = UNUSED;
801040a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801040ab:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
        p->pid = 0;
801040b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801040b5:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
        p->parent = 0;
801040bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801040bf:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
        p->name[0] = 0;
801040c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801040c9:	c6 40 6c 00          	movb   $0x0,0x6c(%eax)
        p->killed = 0;
801040cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
801040d0:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
        release(&ptable.lock);
801040d7:	83 ec 0c             	sub    $0xc,%esp
801040da:	68 a0 0f 11 80       	push   $0x80110fa0
801040df:	e8 8f 05 00 00       	call   80104673 <release>
801040e4:	83 c4 10             	add    $0x10,%esp
        return pid;
801040e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
801040ea:	eb 58                	jmp    80104144 <wait+0x122>
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != proc)
        continue;
801040ec:	90                   	nop

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040ed:	83 45 f4 7c          	addl   $0x7c,-0xc(%ebp)
801040f1:	81 7d f4 d4 2e 11 80 	cmpl   $0x80112ed4,-0xc(%ebp)
801040f8:	0f 82 4d ff ff ff    	jb     8010404b <wait+0x29>
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
801040fe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80104102:	74 0d                	je     80104111 <wait+0xef>
80104104:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010410a:	8b 40 24             	mov    0x24(%eax),%eax
8010410d:	85 c0                	test   %eax,%eax
8010410f:	74 17                	je     80104128 <wait+0x106>
      release(&ptable.lock);
80104111:	83 ec 0c             	sub    $0xc,%esp
80104114:	68 a0 0f 11 80       	push   $0x80110fa0
80104119:	e8 55 05 00 00       	call   80104673 <release>
8010411e:	83 c4 10             	add    $0x10,%esp
      return -1;
80104121:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104126:	eb 1c                	jmp    80104144 <wait+0x122>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80104128:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010412e:	83 ec 08             	sub    $0x8,%esp
80104131:	68 a0 0f 11 80       	push   $0x80110fa0
80104136:	50                   	push   %eax
80104137:	e8 d7 01 00 00       	call   80104313 <sleep>
8010413c:	83 c4 10             	add    $0x10,%esp
  }
8010413f:	e9 f4 fe ff ff       	jmp    80104038 <wait+0x16>
}
80104144:	c9                   	leave  
80104145:	c3                   	ret    

80104146 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80104146:	55                   	push   %ebp
80104147:	89 e5                	mov    %esp,%ebp
80104149:	83 ec 18             	sub    $0x18,%esp
  struct proc *p;

  for(;;){
    // Enable interrupts on this processor.
    sti();
8010414c:	e8 49 f9 ff ff       	call   80103a9a <sti>

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80104151:	83 ec 0c             	sub    $0xc,%esp
80104154:	68 a0 0f 11 80       	push   $0x80110fa0
80104159:	e8 ae 04 00 00       	call   8010460c <acquire>
8010415e:	83 c4 10             	add    $0x10,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104161:	c7 45 f4 d4 0f 11 80 	movl   $0x80110fd4,-0xc(%ebp)
80104168:	eb 63                	jmp    801041cd <scheduler+0x87>
      if(p->state != RUNNABLE)
8010416a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010416d:	8b 40 0c             	mov    0xc(%eax),%eax
80104170:	83 f8 03             	cmp    $0x3,%eax
80104173:	75 53                	jne    801041c8 <scheduler+0x82>
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
80104175:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104178:	65 a3 04 00 00 00    	mov    %eax,%gs:0x4
      switchuvm(p);
8010417e:	83 ec 0c             	sub    $0xc,%esp
80104181:	ff 75 f4             	pushl  -0xc(%ebp)
80104184:	e8 2d 33 00 00       	call   801074b6 <switchuvm>
80104189:	83 c4 10             	add    $0x10,%esp
      p->state = RUNNING;
8010418c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010418f:	c7 40 0c 04 00 00 00 	movl   $0x4,0xc(%eax)
      swtch(&cpu->scheduler, proc->context);
80104196:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010419c:	8b 40 1c             	mov    0x1c(%eax),%eax
8010419f:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801041a6:	83 c2 04             	add    $0x4,%edx
801041a9:	83 ec 08             	sub    $0x8,%esp
801041ac:	50                   	push   %eax
801041ad:	52                   	push   %edx
801041ae:	e8 30 09 00 00       	call   80104ae3 <swtch>
801041b3:	83 c4 10             	add    $0x10,%esp
      switchkvm();
801041b6:	e8 de 32 00 00       	call   80107499 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
801041bb:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
801041c2:	00 00 00 00 
801041c6:	eb 01                	jmp    801041c9 <scheduler+0x83>

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != RUNNABLE)
        continue;
801041c8:	90                   	nop
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801041c9:	83 45 f4 7c          	addl   $0x7c,-0xc(%ebp)
801041cd:	81 7d f4 d4 2e 11 80 	cmpl   $0x80112ed4,-0xc(%ebp)
801041d4:	72 94                	jb     8010416a <scheduler+0x24>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
    }
    release(&ptable.lock);
801041d6:	83 ec 0c             	sub    $0xc,%esp
801041d9:	68 a0 0f 11 80       	push   $0x80110fa0
801041de:	e8 90 04 00 00       	call   80104673 <release>
801041e3:	83 c4 10             	add    $0x10,%esp

  }
801041e6:	e9 61 ff ff ff       	jmp    8010414c <scheduler+0x6>

801041eb <sched>:

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state.
void
sched(void)
{
801041eb:	55                   	push   %ebp
801041ec:	89 e5                	mov    %esp,%ebp
801041ee:	83 ec 18             	sub    $0x18,%esp
  int intena;

  if(!holding(&ptable.lock))
801041f1:	83 ec 0c             	sub    $0xc,%esp
801041f4:	68 a0 0f 11 80       	push   $0x80110fa0
801041f9:	e8 41 05 00 00       	call   8010473f <holding>
801041fe:	83 c4 10             	add    $0x10,%esp
80104201:	85 c0                	test   %eax,%eax
80104203:	75 0d                	jne    80104212 <sched+0x27>
    panic("sched ptable.lock");
80104205:	83 ec 0c             	sub    $0xc,%esp
80104208:	68 21 9b 10 80       	push   $0x80109b21
8010420d:	e8 3d 45 00 00       	call   8010874f <panic>
  if(cpu->ncli != 1)
80104212:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104218:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
8010421e:	83 f8 01             	cmp    $0x1,%eax
80104221:	74 0d                	je     80104230 <sched+0x45>
    panic("sched locks");
80104223:	83 ec 0c             	sub    $0xc,%esp
80104226:	68 33 9b 10 80       	push   $0x80109b33
8010422b:	e8 1f 45 00 00       	call   8010874f <panic>
  if(proc->state == RUNNING)
80104230:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104236:	8b 40 0c             	mov    0xc(%eax),%eax
80104239:	83 f8 04             	cmp    $0x4,%eax
8010423c:	75 0d                	jne    8010424b <sched+0x60>
    panic("sched running");
8010423e:	83 ec 0c             	sub    $0xc,%esp
80104241:	68 3f 9b 10 80       	push   $0x80109b3f
80104246:	e8 04 45 00 00       	call   8010874f <panic>
  if(readeflags()&FL_IF)
8010424b:	e8 3a f8 ff ff       	call   80103a8a <readeflags>
80104250:	25 00 02 00 00       	and    $0x200,%eax
80104255:	85 c0                	test   %eax,%eax
80104257:	74 0d                	je     80104266 <sched+0x7b>
    panic("sched interruptible");
80104259:	83 ec 0c             	sub    $0xc,%esp
8010425c:	68 4d 9b 10 80       	push   $0x80109b4d
80104261:	e8 e9 44 00 00       	call   8010874f <panic>
  intena = cpu->intena;
80104266:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010426c:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
80104272:	89 45 f4             	mov    %eax,-0xc(%ebp)
  swtch(&proc->context, cpu->scheduler);
80104275:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010427b:	8b 40 04             	mov    0x4(%eax),%eax
8010427e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104285:	83 c2 1c             	add    $0x1c,%edx
80104288:	83 ec 08             	sub    $0x8,%esp
8010428b:	50                   	push   %eax
8010428c:	52                   	push   %edx
8010428d:	e8 51 08 00 00       	call   80104ae3 <swtch>
80104292:	83 c4 10             	add    $0x10,%esp
  cpu->intena = intena;
80104295:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010429b:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010429e:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
}
801042a4:	90                   	nop
801042a5:	c9                   	leave  
801042a6:	c3                   	ret    

801042a7 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
801042a7:	55                   	push   %ebp
801042a8:	89 e5                	mov    %esp,%ebp
801042aa:	83 ec 08             	sub    $0x8,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
801042ad:	83 ec 0c             	sub    $0xc,%esp
801042b0:	68 a0 0f 11 80       	push   $0x80110fa0
801042b5:	e8 52 03 00 00       	call   8010460c <acquire>
801042ba:	83 c4 10             	add    $0x10,%esp
  proc->state = RUNNABLE;
801042bd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042c3:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
801042ca:	e8 1c ff ff ff       	call   801041eb <sched>
  release(&ptable.lock);
801042cf:	83 ec 0c             	sub    $0xc,%esp
801042d2:	68 a0 0f 11 80       	push   $0x80110fa0
801042d7:	e8 97 03 00 00       	call   80104673 <release>
801042dc:	83 c4 10             	add    $0x10,%esp
}
801042df:	90                   	nop
801042e0:	c9                   	leave  
801042e1:	c3                   	ret    

801042e2 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
801042e2:	55                   	push   %ebp
801042e3:	89 e5                	mov    %esp,%ebp
801042e5:	83 ec 08             	sub    $0x8,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801042e8:	83 ec 0c             	sub    $0xc,%esp
801042eb:	68 a0 0f 11 80       	push   $0x80110fa0
801042f0:	e8 7e 03 00 00       	call   80104673 <release>
801042f5:	83 c4 10             	add    $0x10,%esp

  if (first) {
801042f8:	a1 08 c0 10 80       	mov    0x8010c008,%eax
801042fd:	85 c0                	test   %eax,%eax
801042ff:	74 0f                	je     80104310 <forkret+0x2e>
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot 
    // be run from main().
    first = 0;
80104301:	c7 05 08 c0 10 80 00 	movl   $0x0,0x8010c008
80104308:	00 00 00 
    initlog();
8010430b:	e8 9e e7 ff ff       	call   80102aae <initlog>
  }
  
  // Return to "caller", actually trapret (see allocproc).
}
80104310:	90                   	nop
80104311:	c9                   	leave  
80104312:	c3                   	ret    

80104313 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80104313:	55                   	push   %ebp
80104314:	89 e5                	mov    %esp,%ebp
80104316:	83 ec 08             	sub    $0x8,%esp
  if(proc == 0)
80104319:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010431f:	85 c0                	test   %eax,%eax
80104321:	75 0d                	jne    80104330 <sleep+0x1d>
    panic("sleep");
80104323:	83 ec 0c             	sub    $0xc,%esp
80104326:	68 61 9b 10 80       	push   $0x80109b61
8010432b:	e8 1f 44 00 00       	call   8010874f <panic>

  if(lk == 0)
80104330:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80104334:	75 0d                	jne    80104343 <sleep+0x30>
    panic("sleep without lk");
80104336:	83 ec 0c             	sub    $0xc,%esp
80104339:	68 67 9b 10 80       	push   $0x80109b67
8010433e:	e8 0c 44 00 00       	call   8010874f <panic>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80104343:	81 7d 0c a0 0f 11 80 	cmpl   $0x80110fa0,0xc(%ebp)
8010434a:	74 1e                	je     8010436a <sleep+0x57>
    acquire(&ptable.lock);  //DOC: sleeplock1
8010434c:	83 ec 0c             	sub    $0xc,%esp
8010434f:	68 a0 0f 11 80       	push   $0x80110fa0
80104354:	e8 b3 02 00 00       	call   8010460c <acquire>
80104359:	83 c4 10             	add    $0x10,%esp
    release(lk);
8010435c:	83 ec 0c             	sub    $0xc,%esp
8010435f:	ff 75 0c             	pushl  0xc(%ebp)
80104362:	e8 0c 03 00 00       	call   80104673 <release>
80104367:	83 c4 10             	add    $0x10,%esp
  }

  // Go to sleep.
  proc->chan = chan;
8010436a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104370:	8b 55 08             	mov    0x8(%ebp),%edx
80104373:	89 50 20             	mov    %edx,0x20(%eax)
  proc->state = SLEEPING;
80104376:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010437c:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80104383:	e8 63 fe ff ff       	call   801041eb <sched>

  // Tidy up.
  proc->chan = 0;
80104388:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010438e:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
80104395:	81 7d 0c a0 0f 11 80 	cmpl   $0x80110fa0,0xc(%ebp)
8010439c:	74 1e                	je     801043bc <sleep+0xa9>
    release(&ptable.lock);
8010439e:	83 ec 0c             	sub    $0xc,%esp
801043a1:	68 a0 0f 11 80       	push   $0x80110fa0
801043a6:	e8 c8 02 00 00       	call   80104673 <release>
801043ab:	83 c4 10             	add    $0x10,%esp
    acquire(lk);
801043ae:	83 ec 0c             	sub    $0xc,%esp
801043b1:	ff 75 0c             	pushl  0xc(%ebp)
801043b4:	e8 53 02 00 00       	call   8010460c <acquire>
801043b9:	83 c4 10             	add    $0x10,%esp
  }
}
801043bc:	90                   	nop
801043bd:	c9                   	leave  
801043be:	c3                   	ret    

801043bf <wakeup1>:
//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
801043bf:	55                   	push   %ebp
801043c0:	89 e5                	mov    %esp,%ebp
801043c2:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801043c5:	c7 45 fc d4 0f 11 80 	movl   $0x80110fd4,-0x4(%ebp)
801043cc:	eb 24                	jmp    801043f2 <wakeup1+0x33>
    if(p->state == SLEEPING && p->chan == chan)
801043ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
801043d1:	8b 40 0c             	mov    0xc(%eax),%eax
801043d4:	83 f8 02             	cmp    $0x2,%eax
801043d7:	75 15                	jne    801043ee <wakeup1+0x2f>
801043d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
801043dc:	8b 40 20             	mov    0x20(%eax),%eax
801043df:	3b 45 08             	cmp    0x8(%ebp),%eax
801043e2:	75 0a                	jne    801043ee <wakeup1+0x2f>
      p->state = RUNNABLE;
801043e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
801043e7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801043ee:	83 45 fc 7c          	addl   $0x7c,-0x4(%ebp)
801043f2:	81 7d fc d4 2e 11 80 	cmpl   $0x80112ed4,-0x4(%ebp)
801043f9:	72 d3                	jb     801043ce <wakeup1+0xf>
    if(p->state == SLEEPING && p->chan == chan)
      p->state = RUNNABLE;
}
801043fb:	90                   	nop
801043fc:	c9                   	leave  
801043fd:	c3                   	ret    

801043fe <wakeup>:

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
801043fe:	55                   	push   %ebp
801043ff:	89 e5                	mov    %esp,%ebp
80104401:	83 ec 08             	sub    $0x8,%esp
  acquire(&ptable.lock);
80104404:	83 ec 0c             	sub    $0xc,%esp
80104407:	68 a0 0f 11 80       	push   $0x80110fa0
8010440c:	e8 fb 01 00 00       	call   8010460c <acquire>
80104411:	83 c4 10             	add    $0x10,%esp
  wakeup1(chan);
80104414:	83 ec 0c             	sub    $0xc,%esp
80104417:	ff 75 08             	pushl  0x8(%ebp)
8010441a:	e8 a0 ff ff ff       	call   801043bf <wakeup1>
8010441f:	83 c4 10             	add    $0x10,%esp
  release(&ptable.lock);
80104422:	83 ec 0c             	sub    $0xc,%esp
80104425:	68 a0 0f 11 80       	push   $0x80110fa0
8010442a:	e8 44 02 00 00       	call   80104673 <release>
8010442f:	83 c4 10             	add    $0x10,%esp
}
80104432:	90                   	nop
80104433:	c9                   	leave  
80104434:	c3                   	ret    

80104435 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104435:	55                   	push   %ebp
80104436:	89 e5                	mov    %esp,%ebp
80104438:	83 ec 18             	sub    $0x18,%esp
  struct proc *p;

  acquire(&ptable.lock);
8010443b:	83 ec 0c             	sub    $0xc,%esp
8010443e:	68 a0 0f 11 80       	push   $0x80110fa0
80104443:	e8 c4 01 00 00       	call   8010460c <acquire>
80104448:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010444b:	c7 45 f4 d4 0f 11 80 	movl   $0x80110fd4,-0xc(%ebp)
80104452:	eb 45                	jmp    80104499 <kill+0x64>
    if(p->pid == pid){
80104454:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104457:	8b 40 10             	mov    0x10(%eax),%eax
8010445a:	3b 45 08             	cmp    0x8(%ebp),%eax
8010445d:	75 36                	jne    80104495 <kill+0x60>
      p->killed = 1;
8010445f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104462:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104469:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010446c:	8b 40 0c             	mov    0xc(%eax),%eax
8010446f:	83 f8 02             	cmp    $0x2,%eax
80104472:	75 0a                	jne    8010447e <kill+0x49>
        p->state = RUNNABLE;
80104474:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104477:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
8010447e:	83 ec 0c             	sub    $0xc,%esp
80104481:	68 a0 0f 11 80       	push   $0x80110fa0
80104486:	e8 e8 01 00 00       	call   80104673 <release>
8010448b:	83 c4 10             	add    $0x10,%esp
      return 0;
8010448e:	b8 00 00 00 00       	mov    $0x0,%eax
80104493:	eb 22                	jmp    801044b7 <kill+0x82>
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104495:	83 45 f4 7c          	addl   $0x7c,-0xc(%ebp)
80104499:	81 7d f4 d4 2e 11 80 	cmpl   $0x80112ed4,-0xc(%ebp)
801044a0:	72 b2                	jb     80104454 <kill+0x1f>
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
801044a2:	83 ec 0c             	sub    $0xc,%esp
801044a5:	68 a0 0f 11 80       	push   $0x80110fa0
801044aa:	e8 c4 01 00 00       	call   80104673 <release>
801044af:	83 c4 10             	add    $0x10,%esp
  return -1;
801044b2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801044b7:	c9                   	leave  
801044b8:	c3                   	ret    

801044b9 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
801044b9:	55                   	push   %ebp
801044ba:	89 e5                	mov    %esp,%ebp
801044bc:	83 ec 48             	sub    $0x48,%esp
  int i;
  struct proc *p;
  char *state;
  uint pc[10];
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801044bf:	c7 45 f0 d4 0f 11 80 	movl   $0x80110fd4,-0x10(%ebp)
801044c6:	e9 d7 00 00 00       	jmp    801045a2 <procdump+0xe9>
    if(p->state == UNUSED)
801044cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
801044ce:	8b 40 0c             	mov    0xc(%eax),%eax
801044d1:	85 c0                	test   %eax,%eax
801044d3:	0f 84 c4 00 00 00    	je     8010459d <procdump+0xe4>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801044d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
801044dc:	8b 40 0c             	mov    0xc(%eax),%eax
801044df:	83 f8 05             	cmp    $0x5,%eax
801044e2:	77 23                	ja     80104507 <procdump+0x4e>
801044e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
801044e7:	8b 40 0c             	mov    0xc(%eax),%eax
801044ea:	8b 04 85 0c c0 10 80 	mov    -0x7fef3ff4(,%eax,4),%eax
801044f1:	85 c0                	test   %eax,%eax
801044f3:	74 12                	je     80104507 <procdump+0x4e>
      state = states[p->state];
801044f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
801044f8:	8b 40 0c             	mov    0xc(%eax),%eax
801044fb:	8b 04 85 0c c0 10 80 	mov    -0x7fef3ff4(,%eax,4),%eax
80104502:	89 45 ec             	mov    %eax,-0x14(%ebp)
80104505:	eb 07                	jmp    8010450e <procdump+0x55>
    else
      state = "???";
80104507:	c7 45 ec 78 9b 10 80 	movl   $0x80109b78,-0x14(%ebp)
    cprintf("%d %s %s", p->pid, state, p->name);
8010450e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104511:	8d 50 6c             	lea    0x6c(%eax),%edx
80104514:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104517:	8b 40 10             	mov    0x10(%eax),%eax
8010451a:	52                   	push   %edx
8010451b:	ff 75 ec             	pushl  -0x14(%ebp)
8010451e:	50                   	push   %eax
8010451f:	68 7c 9b 10 80       	push   $0x80109b7c
80104524:	e8 7c 3e 00 00       	call   801083a5 <cprintf>
80104529:	83 c4 10             	add    $0x10,%esp
    if(p->state == SLEEPING){
8010452c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010452f:	8b 40 0c             	mov    0xc(%eax),%eax
80104532:	83 f8 02             	cmp    $0x2,%eax
80104535:	75 54                	jne    8010458b <procdump+0xd2>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104537:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010453a:	8b 40 1c             	mov    0x1c(%eax),%eax
8010453d:	8b 40 0c             	mov    0xc(%eax),%eax
80104540:	83 c0 08             	add    $0x8,%eax
80104543:	89 c2                	mov    %eax,%edx
80104545:	83 ec 08             	sub    $0x8,%esp
80104548:	8d 45 c4             	lea    -0x3c(%ebp),%eax
8010454b:	50                   	push   %eax
8010454c:	52                   	push   %edx
8010454d:	e8 73 01 00 00       	call   801046c5 <getcallerpcs>
80104552:	83 c4 10             	add    $0x10,%esp
      for(i=0; i<10 && pc[i] != 0; i++)
80104555:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
8010455c:	eb 1c                	jmp    8010457a <procdump+0xc1>
        cprintf(" %p", pc[i]);
8010455e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104561:	8b 44 85 c4          	mov    -0x3c(%ebp,%eax,4),%eax
80104565:	83 ec 08             	sub    $0x8,%esp
80104568:	50                   	push   %eax
80104569:	68 85 9b 10 80       	push   $0x80109b85
8010456e:	e8 32 3e 00 00       	call   801083a5 <cprintf>
80104573:	83 c4 10             	add    $0x10,%esp
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104576:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
8010457a:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
8010457e:	7f 0b                	jg     8010458b <procdump+0xd2>
80104580:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104583:	8b 44 85 c4          	mov    -0x3c(%ebp,%eax,4),%eax
80104587:	85 c0                	test   %eax,%eax
80104589:	75 d3                	jne    8010455e <procdump+0xa5>
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
8010458b:	83 ec 0c             	sub    $0xc,%esp
8010458e:	68 89 9b 10 80       	push   $0x80109b89
80104593:	e8 0d 3e 00 00       	call   801083a5 <cprintf>
80104598:	83 c4 10             	add    $0x10,%esp
8010459b:	eb 01                	jmp    8010459e <procdump+0xe5>
  char *state;
  uint pc[10];
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
8010459d:	90                   	nop
  int i;
  struct proc *p;
  char *state;
  uint pc[10];
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010459e:	83 45 f0 7c          	addl   $0x7c,-0x10(%ebp)
801045a2:	81 7d f0 d4 2e 11 80 	cmpl   $0x80112ed4,-0x10(%ebp)
801045a9:	0f 82 1c ff ff ff    	jb     801044cb <procdump+0x12>
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
801045af:	90                   	nop
801045b0:	c9                   	leave  
801045b1:	c3                   	ret    

801045b2 <readeflags>:
  asm volatile("ltr %0" : : "r" (sel));
}

static inline uint
readeflags(void)
{
801045b2:	55                   	push   %ebp
801045b3:	89 e5                	mov    %esp,%ebp
801045b5:	83 ec 10             	sub    $0x10,%esp
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801045b8:	9c                   	pushf  
801045b9:	58                   	pop    %eax
801045ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return eflags;
801045bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
801045c0:	c9                   	leave  
801045c1:	c3                   	ret    

801045c2 <cli>:
  asm volatile("movw %0, %%gs" : : "r" (v));
}

static inline void
cli(void)
{
801045c2:	55                   	push   %ebp
801045c3:	89 e5                	mov    %esp,%ebp
  asm volatile("cli");
801045c5:	fa                   	cli    
}
801045c6:	90                   	nop
801045c7:	5d                   	pop    %ebp
801045c8:	c3                   	ret    

801045c9 <sti>:

static inline void
sti(void)
{
801045c9:	55                   	push   %ebp
801045ca:	89 e5                	mov    %esp,%ebp
  asm volatile("sti");
801045cc:	fb                   	sti    
}
801045cd:	90                   	nop
801045ce:	5d                   	pop    %ebp
801045cf:	c3                   	ret    

801045d0 <xchg>:

static inline uint
xchg(volatile uint *addr, uint newval)
{
801045d0:	55                   	push   %ebp
801045d1:	89 e5                	mov    %esp,%ebp
801045d3:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801045d6:	8b 55 08             	mov    0x8(%ebp),%edx
801045d9:	8b 45 0c             	mov    0xc(%ebp),%eax
801045dc:	8b 4d 08             	mov    0x8(%ebp),%ecx
801045df:	f0 87 02             	lock xchg %eax,(%edx)
801045e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
801045e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
801045e8:	c9                   	leave  
801045e9:	c3                   	ret    

801045ea <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801045ea:	55                   	push   %ebp
801045eb:	89 e5                	mov    %esp,%ebp
  lk->name = name;
801045ed:	8b 45 08             	mov    0x8(%ebp),%eax
801045f0:	8b 55 0c             	mov    0xc(%ebp),%edx
801045f3:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
801045f6:	8b 45 08             	mov    0x8(%ebp),%eax
801045f9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->cpu = 0;
801045ff:	8b 45 08             	mov    0x8(%ebp),%eax
80104602:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104609:	90                   	nop
8010460a:	5d                   	pop    %ebp
8010460b:	c3                   	ret    

8010460c <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
8010460c:	55                   	push   %ebp
8010460d:	89 e5                	mov    %esp,%ebp
8010460f:	83 ec 08             	sub    $0x8,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104612:	e8 52 01 00 00       	call   80104769 <pushcli>
  if(holding(lk))
80104617:	8b 45 08             	mov    0x8(%ebp),%eax
8010461a:	83 ec 0c             	sub    $0xc,%esp
8010461d:	50                   	push   %eax
8010461e:	e8 1c 01 00 00       	call   8010473f <holding>
80104623:	83 c4 10             	add    $0x10,%esp
80104626:	85 c0                	test   %eax,%eax
80104628:	74 0d                	je     80104637 <acquire+0x2b>
    panic("acquire");
8010462a:	83 ec 0c             	sub    $0xc,%esp
8010462d:	68 b5 9b 10 80       	push   $0x80109bb5
80104632:	e8 18 41 00 00       	call   8010874f <panic>

  // The xchg is atomic.
  // It also serializes, so that reads after acquire are not
  // reordered before it. 
  while(xchg(&lk->locked, 1) != 0)
80104637:	90                   	nop
80104638:	8b 45 08             	mov    0x8(%ebp),%eax
8010463b:	83 ec 08             	sub    $0x8,%esp
8010463e:	6a 01                	push   $0x1
80104640:	50                   	push   %eax
80104641:	e8 8a ff ff ff       	call   801045d0 <xchg>
80104646:	83 c4 10             	add    $0x10,%esp
80104649:	85 c0                	test   %eax,%eax
8010464b:	75 eb                	jne    80104638 <acquire+0x2c>
    ;

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
8010464d:	8b 45 08             	mov    0x8(%ebp),%eax
80104650:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104657:	89 50 08             	mov    %edx,0x8(%eax)
  getcallerpcs(&lk, lk->pcs);
8010465a:	8b 45 08             	mov    0x8(%ebp),%eax
8010465d:	83 c0 0c             	add    $0xc,%eax
80104660:	83 ec 08             	sub    $0x8,%esp
80104663:	50                   	push   %eax
80104664:	8d 45 08             	lea    0x8(%ebp),%eax
80104667:	50                   	push   %eax
80104668:	e8 58 00 00 00       	call   801046c5 <getcallerpcs>
8010466d:	83 c4 10             	add    $0x10,%esp
}
80104670:	90                   	nop
80104671:	c9                   	leave  
80104672:	c3                   	ret    

80104673 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
80104673:	55                   	push   %ebp
80104674:	89 e5                	mov    %esp,%ebp
80104676:	83 ec 08             	sub    $0x8,%esp
  if(!holding(lk))
80104679:	83 ec 0c             	sub    $0xc,%esp
8010467c:	ff 75 08             	pushl  0x8(%ebp)
8010467f:	e8 bb 00 00 00       	call   8010473f <holding>
80104684:	83 c4 10             	add    $0x10,%esp
80104687:	85 c0                	test   %eax,%eax
80104689:	75 0d                	jne    80104698 <release+0x25>
    panic("release");
8010468b:	83 ec 0c             	sub    $0xc,%esp
8010468e:	68 bd 9b 10 80       	push   $0x80109bbd
80104693:	e8 b7 40 00 00       	call   8010874f <panic>

  lk->pcs[0] = 0;
80104698:	8b 45 08             	mov    0x8(%ebp),%eax
8010469b:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
801046a2:	8b 45 08             	mov    0x8(%ebp),%eax
801046a5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // But the 2007 Intel 64 Architecture Memory Ordering White
  // Paper says that Intel 64 and IA-32 will not move a load
  // after a store. So lock->locked = 0 would work here.
  // The xchg being asm volatile ensures gcc emits it after
  // the above assignments (and after the critical section).
  xchg(&lk->locked, 0);
801046ac:	8b 45 08             	mov    0x8(%ebp),%eax
801046af:	83 ec 08             	sub    $0x8,%esp
801046b2:	6a 00                	push   $0x0
801046b4:	50                   	push   %eax
801046b5:	e8 16 ff ff ff       	call   801045d0 <xchg>
801046ba:	83 c4 10             	add    $0x10,%esp

  popcli();
801046bd:	e8 ec 00 00 00       	call   801047ae <popcli>
}
801046c2:	90                   	nop
801046c3:	c9                   	leave  
801046c4:	c3                   	ret    

801046c5 <getcallerpcs>:

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801046c5:	55                   	push   %ebp
801046c6:	89 e5                	mov    %esp,%ebp
801046c8:	83 ec 10             	sub    $0x10,%esp
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
801046cb:	8b 45 08             	mov    0x8(%ebp),%eax
801046ce:	83 e8 08             	sub    $0x8,%eax
801046d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  for(i = 0; i < 10; i++){
801046d4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
801046db:	eb 38                	jmp    80104715 <getcallerpcs+0x50>
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801046dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
801046e1:	74 53                	je     80104736 <getcallerpcs+0x71>
801046e3:	81 7d fc ff ff ff 7f 	cmpl   $0x7fffffff,-0x4(%ebp)
801046ea:	76 4a                	jbe    80104736 <getcallerpcs+0x71>
801046ec:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
801046f0:	74 44                	je     80104736 <getcallerpcs+0x71>
      break;
    pcs[i] = ebp[1];     // saved %eip
801046f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
801046f5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
801046fc:	8b 45 0c             	mov    0xc(%ebp),%eax
801046ff:	01 c2                	add    %eax,%edx
80104701:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104704:	8b 40 04             	mov    0x4(%eax),%eax
80104707:	89 02                	mov    %eax,(%edx)
    ebp = (uint*)ebp[0]; // saved %ebp
80104709:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010470c:	8b 00                	mov    (%eax),%eax
8010470e:	89 45 fc             	mov    %eax,-0x4(%ebp)
{
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104711:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
80104715:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
80104719:	7e c2                	jle    801046dd <getcallerpcs+0x18>
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010471b:	eb 19                	jmp    80104736 <getcallerpcs+0x71>
    pcs[i] = 0;
8010471d:	8b 45 f8             	mov    -0x8(%ebp),%eax
80104720:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
80104727:	8b 45 0c             	mov    0xc(%ebp),%eax
8010472a:	01 d0                	add    %edx,%eax
8010472c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104732:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
80104736:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
8010473a:	7e e1                	jle    8010471d <getcallerpcs+0x58>
    pcs[i] = 0;
}
8010473c:	90                   	nop
8010473d:	c9                   	leave  
8010473e:	c3                   	ret    

8010473f <holding>:

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
8010473f:	55                   	push   %ebp
80104740:	89 e5                	mov    %esp,%ebp
  return lock->locked && lock->cpu == cpu;
80104742:	8b 45 08             	mov    0x8(%ebp),%eax
80104745:	8b 00                	mov    (%eax),%eax
80104747:	85 c0                	test   %eax,%eax
80104749:	74 17                	je     80104762 <holding+0x23>
8010474b:	8b 45 08             	mov    0x8(%ebp),%eax
8010474e:	8b 50 08             	mov    0x8(%eax),%edx
80104751:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104757:	39 c2                	cmp    %eax,%edx
80104759:	75 07                	jne    80104762 <holding+0x23>
8010475b:	b8 01 00 00 00       	mov    $0x1,%eax
80104760:	eb 05                	jmp    80104767 <holding+0x28>
80104762:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104767:	5d                   	pop    %ebp
80104768:	c3                   	ret    

80104769 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104769:	55                   	push   %ebp
8010476a:	89 e5                	mov    %esp,%ebp
8010476c:	83 ec 10             	sub    $0x10,%esp
  int eflags;
  
  eflags = readeflags();
8010476f:	e8 3e fe ff ff       	call   801045b2 <readeflags>
80104774:	89 45 fc             	mov    %eax,-0x4(%ebp)
  cli();
80104777:	e8 46 fe ff ff       	call   801045c2 <cli>
  if(cpu->ncli++ == 0)
8010477c:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104783:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
80104789:	8d 48 01             	lea    0x1(%eax),%ecx
8010478c:	89 8a ac 00 00 00    	mov    %ecx,0xac(%edx)
80104792:	85 c0                	test   %eax,%eax
80104794:	75 15                	jne    801047ab <pushcli+0x42>
    cpu->intena = eflags & FL_IF;
80104796:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010479c:	8b 55 fc             	mov    -0x4(%ebp),%edx
8010479f:	81 e2 00 02 00 00    	and    $0x200,%edx
801047a5:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
}
801047ab:	90                   	nop
801047ac:	c9                   	leave  
801047ad:	c3                   	ret    

801047ae <popcli>:

void
popcli(void)
{
801047ae:	55                   	push   %ebp
801047af:	89 e5                	mov    %esp,%ebp
801047b1:	83 ec 08             	sub    $0x8,%esp
  if(readeflags()&FL_IF)
801047b4:	e8 f9 fd ff ff       	call   801045b2 <readeflags>
801047b9:	25 00 02 00 00       	and    $0x200,%eax
801047be:	85 c0                	test   %eax,%eax
801047c0:	74 0d                	je     801047cf <popcli+0x21>
    panic("popcli - interruptible");
801047c2:	83 ec 0c             	sub    $0xc,%esp
801047c5:	68 c5 9b 10 80       	push   $0x80109bc5
801047ca:	e8 80 3f 00 00       	call   8010874f <panic>
  if(--cpu->ncli < 0)
801047cf:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801047d5:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
801047db:	83 ea 01             	sub    $0x1,%edx
801047de:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
801047e4:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
801047ea:	85 c0                	test   %eax,%eax
801047ec:	79 0d                	jns    801047fb <popcli+0x4d>
    panic("popcli");
801047ee:	83 ec 0c             	sub    $0xc,%esp
801047f1:	68 dc 9b 10 80       	push   $0x80109bdc
801047f6:	e8 54 3f 00 00       	call   8010874f <panic>
  if(cpu->ncli == 0 && cpu->intena)
801047fb:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104801:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
80104807:	85 c0                	test   %eax,%eax
80104809:	75 15                	jne    80104820 <popcli+0x72>
8010480b:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104811:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
80104817:	85 c0                	test   %eax,%eax
80104819:	74 05                	je     80104820 <popcli+0x72>
    sti();
8010481b:	e8 a9 fd ff ff       	call   801045c9 <sti>
}
80104820:	90                   	nop
80104821:	c9                   	leave  
80104822:	c3                   	ret    

80104823 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
80104823:	55                   	push   %ebp
80104824:	89 e5                	mov    %esp,%ebp
80104826:	57                   	push   %edi
80104827:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
80104828:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010482b:	8b 55 10             	mov    0x10(%ebp),%edx
8010482e:	8b 45 0c             	mov    0xc(%ebp),%eax
80104831:	89 cb                	mov    %ecx,%ebx
80104833:	89 df                	mov    %ebx,%edi
80104835:	89 d1                	mov    %edx,%ecx
80104837:	fc                   	cld    
80104838:	f3 aa                	rep stos %al,%es:(%edi)
8010483a:	89 ca                	mov    %ecx,%edx
8010483c:	89 fb                	mov    %edi,%ebx
8010483e:	89 5d 08             	mov    %ebx,0x8(%ebp)
80104841:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
80104844:	90                   	nop
80104845:	5b                   	pop    %ebx
80104846:	5f                   	pop    %edi
80104847:	5d                   	pop    %ebp
80104848:	c3                   	ret    

80104849 <stosl>:

static inline void
stosl(void *addr, int data, int cnt)
{
80104849:	55                   	push   %ebp
8010484a:	89 e5                	mov    %esp,%ebp
8010484c:	57                   	push   %edi
8010484d:	53                   	push   %ebx
  asm volatile("cld; rep stosl" :
8010484e:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104851:	8b 55 10             	mov    0x10(%ebp),%edx
80104854:	8b 45 0c             	mov    0xc(%ebp),%eax
80104857:	89 cb                	mov    %ecx,%ebx
80104859:	89 df                	mov    %ebx,%edi
8010485b:	89 d1                	mov    %edx,%ecx
8010485d:	fc                   	cld    
8010485e:	f3 ab                	rep stos %eax,%es:(%edi)
80104860:	89 ca                	mov    %ecx,%edx
80104862:	89 fb                	mov    %edi,%ebx
80104864:	89 5d 08             	mov    %ebx,0x8(%ebp)
80104867:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
8010486a:	90                   	nop
8010486b:	5b                   	pop    %ebx
8010486c:	5f                   	pop    %edi
8010486d:	5d                   	pop    %ebp
8010486e:	c3                   	ret    

8010486f <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
8010486f:	55                   	push   %ebp
80104870:	89 e5                	mov    %esp,%ebp
  if ((int)dst%4 == 0 && n%4 == 0){
80104872:	8b 45 08             	mov    0x8(%ebp),%eax
80104875:	83 e0 03             	and    $0x3,%eax
80104878:	85 c0                	test   %eax,%eax
8010487a:	75 43                	jne    801048bf <memset+0x50>
8010487c:	8b 45 10             	mov    0x10(%ebp),%eax
8010487f:	83 e0 03             	and    $0x3,%eax
80104882:	85 c0                	test   %eax,%eax
80104884:	75 39                	jne    801048bf <memset+0x50>
    c &= 0xFF;
80104886:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
8010488d:	8b 45 10             	mov    0x10(%ebp),%eax
80104890:	c1 e8 02             	shr    $0x2,%eax
80104893:	89 c1                	mov    %eax,%ecx
80104895:	8b 45 0c             	mov    0xc(%ebp),%eax
80104898:	c1 e0 18             	shl    $0x18,%eax
8010489b:	89 c2                	mov    %eax,%edx
8010489d:	8b 45 0c             	mov    0xc(%ebp),%eax
801048a0:	c1 e0 10             	shl    $0x10,%eax
801048a3:	09 c2                	or     %eax,%edx
801048a5:	8b 45 0c             	mov    0xc(%ebp),%eax
801048a8:	c1 e0 08             	shl    $0x8,%eax
801048ab:	09 d0                	or     %edx,%eax
801048ad:	0b 45 0c             	or     0xc(%ebp),%eax
801048b0:	51                   	push   %ecx
801048b1:	50                   	push   %eax
801048b2:	ff 75 08             	pushl  0x8(%ebp)
801048b5:	e8 8f ff ff ff       	call   80104849 <stosl>
801048ba:	83 c4 0c             	add    $0xc,%esp
801048bd:	eb 12                	jmp    801048d1 <memset+0x62>
  } else
    stosb(dst, c, n);
801048bf:	8b 45 10             	mov    0x10(%ebp),%eax
801048c2:	50                   	push   %eax
801048c3:	ff 75 0c             	pushl  0xc(%ebp)
801048c6:	ff 75 08             	pushl  0x8(%ebp)
801048c9:	e8 55 ff ff ff       	call   80104823 <stosb>
801048ce:	83 c4 0c             	add    $0xc,%esp
  return dst;
801048d1:	8b 45 08             	mov    0x8(%ebp),%eax
}
801048d4:	c9                   	leave  
801048d5:	c3                   	ret    

801048d6 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
801048d6:	55                   	push   %ebp
801048d7:	89 e5                	mov    %esp,%ebp
801048d9:	83 ec 10             	sub    $0x10,%esp
  const uchar *s1, *s2;
  
  s1 = v1;
801048dc:	8b 45 08             	mov    0x8(%ebp),%eax
801048df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  s2 = v2;
801048e2:	8b 45 0c             	mov    0xc(%ebp),%eax
801048e5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0){
801048e8:	eb 30                	jmp    8010491a <memcmp+0x44>
    if(*s1 != *s2)
801048ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
801048ed:	0f b6 10             	movzbl (%eax),%edx
801048f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
801048f3:	0f b6 00             	movzbl (%eax),%eax
801048f6:	38 c2                	cmp    %al,%dl
801048f8:	74 18                	je     80104912 <memcmp+0x3c>
      return *s1 - *s2;
801048fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
801048fd:	0f b6 00             	movzbl (%eax),%eax
80104900:	0f b6 d0             	movzbl %al,%edx
80104903:	8b 45 f8             	mov    -0x8(%ebp),%eax
80104906:	0f b6 00             	movzbl (%eax),%eax
80104909:	0f b6 c0             	movzbl %al,%eax
8010490c:	29 c2                	sub    %eax,%edx
8010490e:	89 d0                	mov    %edx,%eax
80104910:	eb 1a                	jmp    8010492c <memcmp+0x56>
    s1++, s2++;
80104912:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80104916:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  const uchar *s1, *s2;
  
  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010491a:	8b 45 10             	mov    0x10(%ebp),%eax
8010491d:	8d 50 ff             	lea    -0x1(%eax),%edx
80104920:	89 55 10             	mov    %edx,0x10(%ebp)
80104923:	85 c0                	test   %eax,%eax
80104925:	75 c3                	jne    801048ea <memcmp+0x14>
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
80104927:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010492c:	c9                   	leave  
8010492d:	c3                   	ret    

8010492e <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
8010492e:	55                   	push   %ebp
8010492f:	89 e5                	mov    %esp,%ebp
80104931:	83 ec 10             	sub    $0x10,%esp
  const char *s;
  char *d;

  s = src;
80104934:	8b 45 0c             	mov    0xc(%ebp),%eax
80104937:	89 45 fc             	mov    %eax,-0x4(%ebp)
  d = dst;
8010493a:	8b 45 08             	mov    0x8(%ebp),%eax
8010493d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if(s < d && s + n > d){
80104940:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104943:	3b 45 f8             	cmp    -0x8(%ebp),%eax
80104946:	73 54                	jae    8010499c <memmove+0x6e>
80104948:	8b 55 fc             	mov    -0x4(%ebp),%edx
8010494b:	8b 45 10             	mov    0x10(%ebp),%eax
8010494e:	01 d0                	add    %edx,%eax
80104950:	3b 45 f8             	cmp    -0x8(%ebp),%eax
80104953:	76 47                	jbe    8010499c <memmove+0x6e>
    s += n;
80104955:	8b 45 10             	mov    0x10(%ebp),%eax
80104958:	01 45 fc             	add    %eax,-0x4(%ebp)
    d += n;
8010495b:	8b 45 10             	mov    0x10(%ebp),%eax
8010495e:	01 45 f8             	add    %eax,-0x8(%ebp)
    while(n-- > 0)
80104961:	eb 13                	jmp    80104976 <memmove+0x48>
      *--d = *--s;
80104963:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
80104967:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
8010496b:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010496e:	0f b6 10             	movzbl (%eax),%edx
80104971:	8b 45 f8             	mov    -0x8(%ebp),%eax
80104974:	88 10                	mov    %dl,(%eax)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
80104976:	8b 45 10             	mov    0x10(%ebp),%eax
80104979:	8d 50 ff             	lea    -0x1(%eax),%edx
8010497c:	89 55 10             	mov    %edx,0x10(%ebp)
8010497f:	85 c0                	test   %eax,%eax
80104981:	75 e0                	jne    80104963 <memmove+0x35>
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
80104983:	eb 24                	jmp    801049a9 <memmove+0x7b>
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
      *d++ = *s++;
80104985:	8b 45 f8             	mov    -0x8(%ebp),%eax
80104988:	8d 50 01             	lea    0x1(%eax),%edx
8010498b:	89 55 f8             	mov    %edx,-0x8(%ebp)
8010498e:	8b 55 fc             	mov    -0x4(%ebp),%edx
80104991:	8d 4a 01             	lea    0x1(%edx),%ecx
80104994:	89 4d fc             	mov    %ecx,-0x4(%ebp)
80104997:	0f b6 12             	movzbl (%edx),%edx
8010499a:	88 10                	mov    %dl,(%eax)
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
8010499c:	8b 45 10             	mov    0x10(%ebp),%eax
8010499f:	8d 50 ff             	lea    -0x1(%eax),%edx
801049a2:	89 55 10             	mov    %edx,0x10(%ebp)
801049a5:	85 c0                	test   %eax,%eax
801049a7:	75 dc                	jne    80104985 <memmove+0x57>
      *d++ = *s++;

  return dst;
801049a9:	8b 45 08             	mov    0x8(%ebp),%eax
}
801049ac:	c9                   	leave  
801049ad:	c3                   	ret    

801049ae <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
801049ae:	55                   	push   %ebp
801049af:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
801049b1:	ff 75 10             	pushl  0x10(%ebp)
801049b4:	ff 75 0c             	pushl  0xc(%ebp)
801049b7:	ff 75 08             	pushl  0x8(%ebp)
801049ba:	e8 6f ff ff ff       	call   8010492e <memmove>
801049bf:	83 c4 0c             	add    $0xc,%esp
}
801049c2:	c9                   	leave  
801049c3:	c3                   	ret    

801049c4 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
801049c4:	55                   	push   %ebp
801049c5:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
801049c7:	eb 0c                	jmp    801049d5 <strncmp+0x11>
    n--, p++, q++;
801049c9:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
801049cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
801049d1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
801049d5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801049d9:	74 1a                	je     801049f5 <strncmp+0x31>
801049db:	8b 45 08             	mov    0x8(%ebp),%eax
801049de:	0f b6 00             	movzbl (%eax),%eax
801049e1:	84 c0                	test   %al,%al
801049e3:	74 10                	je     801049f5 <strncmp+0x31>
801049e5:	8b 45 08             	mov    0x8(%ebp),%eax
801049e8:	0f b6 10             	movzbl (%eax),%edx
801049eb:	8b 45 0c             	mov    0xc(%ebp),%eax
801049ee:	0f b6 00             	movzbl (%eax),%eax
801049f1:	38 c2                	cmp    %al,%dl
801049f3:	74 d4                	je     801049c9 <strncmp+0x5>
    n--, p++, q++;
  if(n == 0)
801049f5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801049f9:	75 07                	jne    80104a02 <strncmp+0x3e>
    return 0;
801049fb:	b8 00 00 00 00       	mov    $0x0,%eax
80104a00:	eb 16                	jmp    80104a18 <strncmp+0x54>
  return (uchar)*p - (uchar)*q;
80104a02:	8b 45 08             	mov    0x8(%ebp),%eax
80104a05:	0f b6 00             	movzbl (%eax),%eax
80104a08:	0f b6 d0             	movzbl %al,%edx
80104a0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80104a0e:	0f b6 00             	movzbl (%eax),%eax
80104a11:	0f b6 c0             	movzbl %al,%eax
80104a14:	29 c2                	sub    %eax,%edx
80104a16:	89 d0                	mov    %edx,%eax
}
80104a18:	5d                   	pop    %ebp
80104a19:	c3                   	ret    

80104a1a <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104a1a:	55                   	push   %ebp
80104a1b:	89 e5                	mov    %esp,%ebp
80104a1d:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
80104a20:	8b 45 08             	mov    0x8(%ebp),%eax
80104a23:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
80104a26:	90                   	nop
80104a27:	8b 45 10             	mov    0x10(%ebp),%eax
80104a2a:	8d 50 ff             	lea    -0x1(%eax),%edx
80104a2d:	89 55 10             	mov    %edx,0x10(%ebp)
80104a30:	85 c0                	test   %eax,%eax
80104a32:	7e 2c                	jle    80104a60 <strncpy+0x46>
80104a34:	8b 45 08             	mov    0x8(%ebp),%eax
80104a37:	8d 50 01             	lea    0x1(%eax),%edx
80104a3a:	89 55 08             	mov    %edx,0x8(%ebp)
80104a3d:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a40:	8d 4a 01             	lea    0x1(%edx),%ecx
80104a43:	89 4d 0c             	mov    %ecx,0xc(%ebp)
80104a46:	0f b6 12             	movzbl (%edx),%edx
80104a49:	88 10                	mov    %dl,(%eax)
80104a4b:	0f b6 00             	movzbl (%eax),%eax
80104a4e:	84 c0                	test   %al,%al
80104a50:	75 d5                	jne    80104a27 <strncpy+0xd>
    ;
  while(n-- > 0)
80104a52:	eb 0c                	jmp    80104a60 <strncpy+0x46>
    *s++ = 0;
80104a54:	8b 45 08             	mov    0x8(%ebp),%eax
80104a57:	8d 50 01             	lea    0x1(%eax),%edx
80104a5a:	89 55 08             	mov    %edx,0x8(%ebp)
80104a5d:	c6 00 00             	movb   $0x0,(%eax)
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
80104a60:	8b 45 10             	mov    0x10(%ebp),%eax
80104a63:	8d 50 ff             	lea    -0x1(%eax),%edx
80104a66:	89 55 10             	mov    %edx,0x10(%ebp)
80104a69:	85 c0                	test   %eax,%eax
80104a6b:	7f e7                	jg     80104a54 <strncpy+0x3a>
    *s++ = 0;
  return os;
80104a6d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80104a70:	c9                   	leave  
80104a71:	c3                   	ret    

80104a72 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104a72:	55                   	push   %ebp
80104a73:	89 e5                	mov    %esp,%ebp
80104a75:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
80104a78:	8b 45 08             	mov    0x8(%ebp),%eax
80104a7b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  if(n <= 0)
80104a7e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80104a82:	7f 05                	jg     80104a89 <safestrcpy+0x17>
    return os;
80104a84:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104a87:	eb 31                	jmp    80104aba <safestrcpy+0x48>
  while(--n > 0 && (*s++ = *t++) != 0)
80104a89:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
80104a8d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80104a91:	7e 1e                	jle    80104ab1 <safestrcpy+0x3f>
80104a93:	8b 45 08             	mov    0x8(%ebp),%eax
80104a96:	8d 50 01             	lea    0x1(%eax),%edx
80104a99:	89 55 08             	mov    %edx,0x8(%ebp)
80104a9c:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a9f:	8d 4a 01             	lea    0x1(%edx),%ecx
80104aa2:	89 4d 0c             	mov    %ecx,0xc(%ebp)
80104aa5:	0f b6 12             	movzbl (%edx),%edx
80104aa8:	88 10                	mov    %dl,(%eax)
80104aaa:	0f b6 00             	movzbl (%eax),%eax
80104aad:	84 c0                	test   %al,%al
80104aaf:	75 d8                	jne    80104a89 <safestrcpy+0x17>
    ;
  *s = 0;
80104ab1:	8b 45 08             	mov    0x8(%ebp),%eax
80104ab4:	c6 00 00             	movb   $0x0,(%eax)
  return os;
80104ab7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80104aba:	c9                   	leave  
80104abb:	c3                   	ret    

80104abc <strlen>:

int
strlen(const char *s)
{
80104abc:	55                   	push   %ebp
80104abd:	89 e5                	mov    %esp,%ebp
80104abf:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
80104ac2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
80104ac9:	eb 04                	jmp    80104acf <strlen+0x13>
80104acb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80104acf:	8b 55 fc             	mov    -0x4(%ebp),%edx
80104ad2:	8b 45 08             	mov    0x8(%ebp),%eax
80104ad5:	01 d0                	add    %edx,%eax
80104ad7:	0f b6 00             	movzbl (%eax),%eax
80104ada:	84 c0                	test   %al,%al
80104adc:	75 ed                	jne    80104acb <strlen+0xf>
    ;
  return n;
80104ade:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80104ae1:	c9                   	leave  
80104ae2:	c3                   	ret    

80104ae3 <swtch>:
# Save current register context in old
# and then load register context from new.

.globl swtch
swtch:
  movl 4(%esp), %eax
80104ae3:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80104ae7:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
80104aeb:	55                   	push   %ebp
  pushl %ebx
80104aec:	53                   	push   %ebx
  pushl %esi
80104aed:	56                   	push   %esi
  pushl %edi
80104aee:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104aef:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104af1:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
80104af3:	5f                   	pop    %edi
  popl %esi
80104af4:	5e                   	pop    %esi
  popl %ebx
80104af5:	5b                   	pop    %ebx
  popl %ebp
80104af6:	5d                   	pop    %ebp
  ret
80104af7:	c3                   	ret    

80104af8 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104af8:	55                   	push   %ebp
80104af9:	89 e5                	mov    %esp,%ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
80104afb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b01:	8b 00                	mov    (%eax),%eax
80104b03:	3b 45 08             	cmp    0x8(%ebp),%eax
80104b06:	76 12                	jbe    80104b1a <fetchint+0x22>
80104b08:	8b 45 08             	mov    0x8(%ebp),%eax
80104b0b:	8d 50 04             	lea    0x4(%eax),%edx
80104b0e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b14:	8b 00                	mov    (%eax),%eax
80104b16:	39 c2                	cmp    %eax,%edx
80104b18:	76 07                	jbe    80104b21 <fetchint+0x29>
    return -1;
80104b1a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b1f:	eb 0f                	jmp    80104b30 <fetchint+0x38>
  *ip = *(int*)(addr);
80104b21:	8b 45 08             	mov    0x8(%ebp),%eax
80104b24:	8b 10                	mov    (%eax),%edx
80104b26:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b29:	89 10                	mov    %edx,(%eax)
  return 0;
80104b2b:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104b30:	5d                   	pop    %ebp
80104b31:	c3                   	ret    

80104b32 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104b32:	55                   	push   %ebp
80104b33:	89 e5                	mov    %esp,%ebp
80104b35:	83 ec 10             	sub    $0x10,%esp
  char *s, *ep;

  if(addr >= proc->sz)
80104b38:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b3e:	8b 00                	mov    (%eax),%eax
80104b40:	3b 45 08             	cmp    0x8(%ebp),%eax
80104b43:	77 07                	ja     80104b4c <fetchstr+0x1a>
    return -1;
80104b45:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b4a:	eb 46                	jmp    80104b92 <fetchstr+0x60>
  *pp = (char*)addr;
80104b4c:	8b 55 08             	mov    0x8(%ebp),%edx
80104b4f:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b52:	89 10                	mov    %edx,(%eax)
  ep = (char*)proc->sz;
80104b54:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b5a:	8b 00                	mov    (%eax),%eax
80104b5c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(s = *pp; s < ep; s++)
80104b5f:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b62:	8b 00                	mov    (%eax),%eax
80104b64:	89 45 fc             	mov    %eax,-0x4(%ebp)
80104b67:	eb 1c                	jmp    80104b85 <fetchstr+0x53>
    if(*s == 0)
80104b69:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104b6c:	0f b6 00             	movzbl (%eax),%eax
80104b6f:	84 c0                	test   %al,%al
80104b71:	75 0e                	jne    80104b81 <fetchstr+0x4f>
      return s - *pp;
80104b73:	8b 55 fc             	mov    -0x4(%ebp),%edx
80104b76:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b79:	8b 00                	mov    (%eax),%eax
80104b7b:	29 c2                	sub    %eax,%edx
80104b7d:	89 d0                	mov    %edx,%eax
80104b7f:	eb 11                	jmp    80104b92 <fetchstr+0x60>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104b81:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80104b85:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104b88:	3b 45 f8             	cmp    -0x8(%ebp),%eax
80104b8b:	72 dc                	jb     80104b69 <fetchstr+0x37>
    if(*s == 0)
      return s - *pp;
  return -1;
80104b8d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104b92:	c9                   	leave  
80104b93:	c3                   	ret    

80104b94 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104b94:	55                   	push   %ebp
80104b95:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104b97:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b9d:	8b 40 18             	mov    0x18(%eax),%eax
80104ba0:	8b 40 44             	mov    0x44(%eax),%eax
80104ba3:	8b 55 08             	mov    0x8(%ebp),%edx
80104ba6:	c1 e2 02             	shl    $0x2,%edx
80104ba9:	01 d0                	add    %edx,%eax
80104bab:	83 c0 04             	add    $0x4,%eax
80104bae:	ff 75 0c             	pushl  0xc(%ebp)
80104bb1:	50                   	push   %eax
80104bb2:	e8 41 ff ff ff       	call   80104af8 <fetchint>
80104bb7:	83 c4 08             	add    $0x8,%esp
}
80104bba:	c9                   	leave  
80104bbb:	c3                   	ret    

80104bbc <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size n bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104bbc:	55                   	push   %ebp
80104bbd:	89 e5                	mov    %esp,%ebp
80104bbf:	83 ec 10             	sub    $0x10,%esp
  int i;
  
  if(argint(n, &i) < 0)
80104bc2:	8d 45 fc             	lea    -0x4(%ebp),%eax
80104bc5:	50                   	push   %eax
80104bc6:	ff 75 08             	pushl  0x8(%ebp)
80104bc9:	e8 c6 ff ff ff       	call   80104b94 <argint>
80104bce:	83 c4 08             	add    $0x8,%esp
80104bd1:	85 c0                	test   %eax,%eax
80104bd3:	79 07                	jns    80104bdc <argptr+0x20>
    return -1;
80104bd5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bda:	eb 3b                	jmp    80104c17 <argptr+0x5b>
  if((uint)i >= proc->sz || (uint)i+size > proc->sz)
80104bdc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104be2:	8b 00                	mov    (%eax),%eax
80104be4:	8b 55 fc             	mov    -0x4(%ebp),%edx
80104be7:	39 d0                	cmp    %edx,%eax
80104be9:	76 16                	jbe    80104c01 <argptr+0x45>
80104beb:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104bee:	89 c2                	mov    %eax,%edx
80104bf0:	8b 45 10             	mov    0x10(%ebp),%eax
80104bf3:	01 c2                	add    %eax,%edx
80104bf5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104bfb:	8b 00                	mov    (%eax),%eax
80104bfd:	39 c2                	cmp    %eax,%edx
80104bff:	76 07                	jbe    80104c08 <argptr+0x4c>
    return -1;
80104c01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c06:	eb 0f                	jmp    80104c17 <argptr+0x5b>
  *pp = (char*)i;
80104c08:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104c0b:	89 c2                	mov    %eax,%edx
80104c0d:	8b 45 0c             	mov    0xc(%ebp),%eax
80104c10:	89 10                	mov    %edx,(%eax)
  return 0;
80104c12:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104c17:	c9                   	leave  
80104c18:	c3                   	ret    

80104c19 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104c19:	55                   	push   %ebp
80104c1a:	89 e5                	mov    %esp,%ebp
80104c1c:	83 ec 10             	sub    $0x10,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104c1f:	8d 45 fc             	lea    -0x4(%ebp),%eax
80104c22:	50                   	push   %eax
80104c23:	ff 75 08             	pushl  0x8(%ebp)
80104c26:	e8 69 ff ff ff       	call   80104b94 <argint>
80104c2b:	83 c4 08             	add    $0x8,%esp
80104c2e:	85 c0                	test   %eax,%eax
80104c30:	79 07                	jns    80104c39 <argstr+0x20>
    return -1;
80104c32:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c37:	eb 0f                	jmp    80104c48 <argstr+0x2f>
  return fetchstr(addr, pp);
80104c39:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104c3c:	ff 75 0c             	pushl  0xc(%ebp)
80104c3f:	50                   	push   %eax
80104c40:	e8 ed fe ff ff       	call   80104b32 <fetchstr>
80104c45:	83 c4 08             	add    $0x8,%esp
}
80104c48:	c9                   	leave  
80104c49:	c3                   	ret    

80104c4a <syscall>:
[SYS_colorwrite] sys_colorwrite,
};

void
syscall(void)
{
80104c4a:	55                   	push   %ebp
80104c4b:	89 e5                	mov    %esp,%ebp
80104c4d:	53                   	push   %ebx
80104c4e:	83 ec 14             	sub    $0x14,%esp
  int num;

  num = proc->tf->eax;
80104c51:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104c57:	8b 40 18             	mov    0x18(%eax),%eax
80104c5a:	8b 40 1c             	mov    0x1c(%eax),%eax
80104c5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104c60:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80104c64:	7e 30                	jle    80104c96 <syscall+0x4c>
80104c66:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104c69:	83 f8 16             	cmp    $0x16,%eax
80104c6c:	77 28                	ja     80104c96 <syscall+0x4c>
80104c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104c71:	8b 04 85 40 c0 10 80 	mov    -0x7fef3fc0(,%eax,4),%eax
80104c78:	85 c0                	test   %eax,%eax
80104c7a:	74 1a                	je     80104c96 <syscall+0x4c>
    proc->tf->eax = syscalls[num]();
80104c7c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104c82:	8b 58 18             	mov    0x18(%eax),%ebx
80104c85:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104c88:	8b 04 85 40 c0 10 80 	mov    -0x7fef3fc0(,%eax,4),%eax
80104c8f:	ff d0                	call   *%eax
80104c91:	89 43 1c             	mov    %eax,0x1c(%ebx)
80104c94:	eb 34                	jmp    80104cca <syscall+0x80>
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
80104c96:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104c9c:	8d 50 6c             	lea    0x6c(%eax),%edx
80104c9f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104ca5:	8b 40 10             	mov    0x10(%eax),%eax
80104ca8:	ff 75 f4             	pushl  -0xc(%ebp)
80104cab:	52                   	push   %edx
80104cac:	50                   	push   %eax
80104cad:	68 e3 9b 10 80       	push   $0x80109be3
80104cb2:	e8 ee 36 00 00       	call   801083a5 <cprintf>
80104cb7:	83 c4 10             	add    $0x10,%esp
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
80104cba:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104cc0:	8b 40 18             	mov    0x18(%eax),%eax
80104cc3:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104cca:	90                   	nop
80104ccb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104cce:	c9                   	leave  
80104ccf:	c3                   	ret    

80104cd0 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
80104cd0:	55                   	push   %ebp
80104cd1:	89 e5                	mov    %esp,%ebp
80104cd3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104cd6:	83 ec 08             	sub    $0x8,%esp
80104cd9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104cdc:	50                   	push   %eax
80104cdd:	ff 75 08             	pushl  0x8(%ebp)
80104ce0:	e8 af fe ff ff       	call   80104b94 <argint>
80104ce5:	83 c4 10             	add    $0x10,%esp
80104ce8:	85 c0                	test   %eax,%eax
80104cea:	79 07                	jns    80104cf3 <argfd+0x23>
    return -1;
80104cec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cf1:	eb 50                	jmp    80104d43 <argfd+0x73>
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104cf3:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104cf6:	85 c0                	test   %eax,%eax
80104cf8:	78 21                	js     80104d1b <argfd+0x4b>
80104cfa:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104cfd:	83 f8 0f             	cmp    $0xf,%eax
80104d00:	7f 19                	jg     80104d1b <argfd+0x4b>
80104d02:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104d08:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104d0b:	83 c2 08             	add    $0x8,%edx
80104d0e:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104d12:	89 45 f4             	mov    %eax,-0xc(%ebp)
80104d15:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80104d19:	75 07                	jne    80104d22 <argfd+0x52>
    return -1;
80104d1b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d20:	eb 21                	jmp    80104d43 <argfd+0x73>
  if(pfd)
80104d22:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80104d26:	74 08                	je     80104d30 <argfd+0x60>
    *pfd = fd;
80104d28:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104d2b:	8b 45 0c             	mov    0xc(%ebp),%eax
80104d2e:	89 10                	mov    %edx,(%eax)
  if(pf)
80104d30:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80104d34:	74 08                	je     80104d3e <argfd+0x6e>
    *pf = f;
80104d36:	8b 45 10             	mov    0x10(%ebp),%eax
80104d39:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104d3c:	89 10                	mov    %edx,(%eax)
  return 0;
80104d3e:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104d43:	c9                   	leave  
80104d44:	c3                   	ret    

80104d45 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
80104d45:	55                   	push   %ebp
80104d46:	89 e5                	mov    %esp,%ebp
80104d48:	83 ec 10             	sub    $0x10,%esp
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104d4b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
80104d52:	eb 30                	jmp    80104d84 <fdalloc+0x3f>
    if(proc->ofile[fd] == 0){
80104d54:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104d5a:	8b 55 fc             	mov    -0x4(%ebp),%edx
80104d5d:	83 c2 08             	add    $0x8,%edx
80104d60:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104d64:	85 c0                	test   %eax,%eax
80104d66:	75 18                	jne    80104d80 <fdalloc+0x3b>
      proc->ofile[fd] = f;
80104d68:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104d6e:	8b 55 fc             	mov    -0x4(%ebp),%edx
80104d71:	8d 4a 08             	lea    0x8(%edx),%ecx
80104d74:	8b 55 08             	mov    0x8(%ebp),%edx
80104d77:	89 54 88 08          	mov    %edx,0x8(%eax,%ecx,4)
      return fd;
80104d7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104d7e:	eb 0f                	jmp    80104d8f <fdalloc+0x4a>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104d80:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80104d84:	83 7d fc 0f          	cmpl   $0xf,-0x4(%ebp)
80104d88:	7e ca                	jle    80104d54 <fdalloc+0xf>
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
80104d8a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d8f:	c9                   	leave  
80104d90:	c3                   	ret    

80104d91 <sys_dup>:

int
sys_dup(void)
{
80104d91:	55                   	push   %ebp
80104d92:	89 e5                	mov    %esp,%ebp
80104d94:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int fd;
  
  if(argfd(0, 0, &f) < 0)
80104d97:	83 ec 04             	sub    $0x4,%esp
80104d9a:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d9d:	50                   	push   %eax
80104d9e:	6a 00                	push   $0x0
80104da0:	6a 00                	push   $0x0
80104da2:	e8 29 ff ff ff       	call   80104cd0 <argfd>
80104da7:	83 c4 10             	add    $0x10,%esp
80104daa:	85 c0                	test   %eax,%eax
80104dac:	79 07                	jns    80104db5 <sys_dup+0x24>
    return -1;
80104dae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104db3:	eb 31                	jmp    80104de6 <sys_dup+0x55>
  if((fd=fdalloc(f)) < 0)
80104db5:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104db8:	83 ec 0c             	sub    $0xc,%esp
80104dbb:	50                   	push   %eax
80104dbc:	e8 84 ff ff ff       	call   80104d45 <fdalloc>
80104dc1:	83 c4 10             	add    $0x10,%esp
80104dc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
80104dc7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80104dcb:	79 07                	jns    80104dd4 <sys_dup+0x43>
    return -1;
80104dcd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dd2:	eb 12                	jmp    80104de6 <sys_dup+0x55>
  filedup(f);
80104dd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104dd7:	83 ec 0c             	sub    $0xc,%esp
80104dda:	50                   	push   %eax
80104ddb:	e8 6f b9 ff ff       	call   8010074f <filedup>
80104de0:	83 c4 10             	add    $0x10,%esp
  return fd;
80104de3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80104de6:	c9                   	leave  
80104de7:	c3                   	ret    

80104de8 <sys_read>:

int
sys_read(void)
{
80104de8:	55                   	push   %ebp
80104de9:	89 e5                	mov    %esp,%ebp
80104deb:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104dee:	83 ec 04             	sub    $0x4,%esp
80104df1:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104df4:	50                   	push   %eax
80104df5:	6a 00                	push   $0x0
80104df7:	6a 00                	push   $0x0
80104df9:	e8 d2 fe ff ff       	call   80104cd0 <argfd>
80104dfe:	83 c4 10             	add    $0x10,%esp
80104e01:	85 c0                	test   %eax,%eax
80104e03:	78 2e                	js     80104e33 <sys_read+0x4b>
80104e05:	83 ec 08             	sub    $0x8,%esp
80104e08:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e0b:	50                   	push   %eax
80104e0c:	6a 02                	push   $0x2
80104e0e:	e8 81 fd ff ff       	call   80104b94 <argint>
80104e13:	83 c4 10             	add    $0x10,%esp
80104e16:	85 c0                	test   %eax,%eax
80104e18:	78 19                	js     80104e33 <sys_read+0x4b>
80104e1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104e1d:	83 ec 04             	sub    $0x4,%esp
80104e20:	50                   	push   %eax
80104e21:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104e24:	50                   	push   %eax
80104e25:	6a 01                	push   $0x1
80104e27:	e8 90 fd ff ff       	call   80104bbc <argptr>
80104e2c:	83 c4 10             	add    $0x10,%esp
80104e2f:	85 c0                	test   %eax,%eax
80104e31:	79 07                	jns    80104e3a <sys_read+0x52>
    return -1;
80104e33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e38:	eb 17                	jmp    80104e51 <sys_read+0x69>
  return fileread(f, p, n);
80104e3a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
80104e3d:	8b 55 ec             	mov    -0x14(%ebp),%edx
80104e40:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104e43:	83 ec 04             	sub    $0x4,%esp
80104e46:	51                   	push   %ecx
80104e47:	52                   	push   %edx
80104e48:	50                   	push   %eax
80104e49:	e8 91 ba ff ff       	call   801008df <fileread>
80104e4e:	83 c4 10             	add    $0x10,%esp
}
80104e51:	c9                   	leave  
80104e52:	c3                   	ret    

80104e53 <sys_write>:

int
sys_write(void)
{
80104e53:	55                   	push   %ebp
80104e54:	89 e5                	mov    %esp,%ebp
80104e56:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104e59:	83 ec 04             	sub    $0x4,%esp
80104e5c:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e5f:	50                   	push   %eax
80104e60:	6a 00                	push   $0x0
80104e62:	6a 00                	push   $0x0
80104e64:	e8 67 fe ff ff       	call   80104cd0 <argfd>
80104e69:	83 c4 10             	add    $0x10,%esp
80104e6c:	85 c0                	test   %eax,%eax
80104e6e:	78 2e                	js     80104e9e <sys_write+0x4b>
80104e70:	83 ec 08             	sub    $0x8,%esp
80104e73:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e76:	50                   	push   %eax
80104e77:	6a 02                	push   $0x2
80104e79:	e8 16 fd ff ff       	call   80104b94 <argint>
80104e7e:	83 c4 10             	add    $0x10,%esp
80104e81:	85 c0                	test   %eax,%eax
80104e83:	78 19                	js     80104e9e <sys_write+0x4b>
80104e85:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104e88:	83 ec 04             	sub    $0x4,%esp
80104e8b:	50                   	push   %eax
80104e8c:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104e8f:	50                   	push   %eax
80104e90:	6a 01                	push   $0x1
80104e92:	e8 25 fd ff ff       	call   80104bbc <argptr>
80104e97:	83 c4 10             	add    $0x10,%esp
80104e9a:	85 c0                	test   %eax,%eax
80104e9c:	79 07                	jns    80104ea5 <sys_write+0x52>
    return -1;
80104e9e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ea3:	eb 17                	jmp    80104ebc <sys_write+0x69>
  return filewrite(f, p, n);
80104ea5:	8b 4d f0             	mov    -0x10(%ebp),%ecx
80104ea8:	8b 55 ec             	mov    -0x14(%ebp),%edx
80104eab:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104eae:	83 ec 04             	sub    $0x4,%esp
80104eb1:	51                   	push   %ecx
80104eb2:	52                   	push   %edx
80104eb3:	50                   	push   %eax
80104eb4:	e8 de ba ff ff       	call   80100997 <filewrite>
80104eb9:	83 c4 10             	add    $0x10,%esp
}
80104ebc:	c9                   	leave  
80104ebd:	c3                   	ret    

80104ebe <sys_colorwrite>:

//new
int sys_colorwrite(void)
{
80104ebe:	55                   	push   %ebp
80104ebf:	89 e5                	mov    %esp,%ebp
80104ec1:	57                   	push   %edi
80104ec2:	56                   	push   %esi
80104ec3:	53                   	push   %ebx
80104ec4:	83 ec 2c             	sub    $0x2c,%esp
  int forec;
  int foreh;
  int backc;
  int backh;

  if(argint(1, &n) < 0 || argptr(0, &p, n) || argint(2,&forec)< 0 || argint(3,&foreh) < 0 || argint(4,&backc) < 0 || argint(5,&backh) < 0)
80104ec7:	83 ec 08             	sub    $0x8,%esp
80104eca:	8d 45 dc             	lea    -0x24(%ebp),%eax
80104ecd:	50                   	push   %eax
80104ece:	6a 01                	push   $0x1
80104ed0:	e8 bf fc ff ff       	call   80104b94 <argint>
80104ed5:	83 c4 10             	add    $0x10,%esp
80104ed8:	85 c0                	test   %eax,%eax
80104eda:	78 6d                	js     80104f49 <sys_colorwrite+0x8b>
80104edc:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104edf:	83 ec 04             	sub    $0x4,%esp
80104ee2:	50                   	push   %eax
80104ee3:	8d 45 d8             	lea    -0x28(%ebp),%eax
80104ee6:	50                   	push   %eax
80104ee7:	6a 00                	push   $0x0
80104ee9:	e8 ce fc ff ff       	call   80104bbc <argptr>
80104eee:	83 c4 10             	add    $0x10,%esp
80104ef1:	85 c0                	test   %eax,%eax
80104ef3:	75 54                	jne    80104f49 <sys_colorwrite+0x8b>
80104ef5:	83 ec 08             	sub    $0x8,%esp
80104ef8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104efb:	50                   	push   %eax
80104efc:	6a 02                	push   $0x2
80104efe:	e8 91 fc ff ff       	call   80104b94 <argint>
80104f03:	83 c4 10             	add    $0x10,%esp
80104f06:	85 c0                	test   %eax,%eax
80104f08:	78 3f                	js     80104f49 <sys_colorwrite+0x8b>
80104f0a:	83 ec 08             	sub    $0x8,%esp
80104f0d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104f10:	50                   	push   %eax
80104f11:	6a 03                	push   $0x3
80104f13:	e8 7c fc ff ff       	call   80104b94 <argint>
80104f18:	83 c4 10             	add    $0x10,%esp
80104f1b:	85 c0                	test   %eax,%eax
80104f1d:	78 2a                	js     80104f49 <sys_colorwrite+0x8b>
80104f1f:	83 ec 08             	sub    $0x8,%esp
80104f22:	8d 45 cc             	lea    -0x34(%ebp),%eax
80104f25:	50                   	push   %eax
80104f26:	6a 04                	push   $0x4
80104f28:	e8 67 fc ff ff       	call   80104b94 <argint>
80104f2d:	83 c4 10             	add    $0x10,%esp
80104f30:	85 c0                	test   %eax,%eax
80104f32:	78 15                	js     80104f49 <sys_colorwrite+0x8b>
80104f34:	83 ec 08             	sub    $0x8,%esp
80104f37:	8d 45 c8             	lea    -0x38(%ebp),%eax
80104f3a:	50                   	push   %eax
80104f3b:	6a 05                	push   $0x5
80104f3d:	e8 52 fc ff ff       	call   80104b94 <argint>
80104f42:	83 c4 10             	add    $0x10,%esp
80104f45:	85 c0                	test   %eax,%eax
80104f47:	79 07                	jns    80104f50 <sys_colorwrite+0x92>
    return -1;
80104f49:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f4e:	eb 59                	jmp    80104fa9 <sys_colorwrite+0xeb>
  
  int fd = 2; //to console
80104f50:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)

  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104f57:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80104f5b:	78 1f                	js     80104f7c <sys_colorwrite+0xbe>
80104f5d:	83 7d e4 0f          	cmpl   $0xf,-0x1c(%ebp)
80104f61:	7f 19                	jg     80104f7c <sys_colorwrite+0xbe>
80104f63:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104f69:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104f6c:	83 c2 08             	add    $0x8,%edx
80104f6f:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104f73:	89 45 e0             	mov    %eax,-0x20(%ebp)
80104f76:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80104f7a:	75 07                	jne    80104f83 <sys_colorwrite+0xc5>
    return -1;
80104f7c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f81:	eb 26                	jmp    80104fa9 <sys_colorwrite+0xeb>
  
  return filecolorwrite(f, p, n, forec, foreh, backc, backh);
80104f83:	8b 7d c8             	mov    -0x38(%ebp),%edi
80104f86:	8b 75 cc             	mov    -0x34(%ebp),%esi
80104f89:	8b 5d d0             	mov    -0x30(%ebp),%ebx
80104f8c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
80104f8f:	8b 55 dc             	mov    -0x24(%ebp),%edx
80104f92:	8b 45 d8             	mov    -0x28(%ebp),%eax
80104f95:	83 ec 04             	sub    $0x4,%esp
80104f98:	57                   	push   %edi
80104f99:	56                   	push   %esi
80104f9a:	53                   	push   %ebx
80104f9b:	51                   	push   %ecx
80104f9c:	52                   	push   %edx
80104f9d:	50                   	push   %eax
80104f9e:	ff 75 e0             	pushl  -0x20(%ebp)
80104fa1:	e8 2d bb ff ff       	call   80100ad3 <filecolorwrite>
80104fa6:	83 c4 20             	add    $0x20,%esp
}
80104fa9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fac:	5b                   	pop    %ebx
80104fad:	5e                   	pop    %esi
80104fae:	5f                   	pop    %edi
80104faf:	5d                   	pop    %ebp
80104fb0:	c3                   	ret    

80104fb1 <sys_close>:

int
sys_close(void)
{
80104fb1:	55                   	push   %ebp
80104fb2:	89 e5                	mov    %esp,%ebp
80104fb4:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;
  
  if(argfd(0, &fd, &f) < 0)
80104fb7:	83 ec 04             	sub    $0x4,%esp
80104fba:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104fbd:	50                   	push   %eax
80104fbe:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104fc1:	50                   	push   %eax
80104fc2:	6a 00                	push   $0x0
80104fc4:	e8 07 fd ff ff       	call   80104cd0 <argfd>
80104fc9:	83 c4 10             	add    $0x10,%esp
80104fcc:	85 c0                	test   %eax,%eax
80104fce:	79 07                	jns    80104fd7 <sys_close+0x26>
    return -1;
80104fd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fd5:	eb 28                	jmp    80104fff <sys_close+0x4e>
  proc->ofile[fd] = 0;
80104fd7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104fdd:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104fe0:	83 c2 08             	add    $0x8,%edx
80104fe3:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
80104fea:	00 
  fileclose(f);
80104feb:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104fee:	83 ec 0c             	sub    $0xc,%esp
80104ff1:	50                   	push   %eax
80104ff2:	e8 a9 b7 ff ff       	call   801007a0 <fileclose>
80104ff7:	83 c4 10             	add    $0x10,%esp
  return 0;
80104ffa:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104fff:	c9                   	leave  
80105000:	c3                   	ret    

80105001 <sys_fstat>:

int
sys_fstat(void)
{
80105001:	55                   	push   %ebp
80105002:	89 e5                	mov    %esp,%ebp
80105004:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;
  
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80105007:	83 ec 04             	sub    $0x4,%esp
8010500a:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010500d:	50                   	push   %eax
8010500e:	6a 00                	push   $0x0
80105010:	6a 00                	push   $0x0
80105012:	e8 b9 fc ff ff       	call   80104cd0 <argfd>
80105017:	83 c4 10             	add    $0x10,%esp
8010501a:	85 c0                	test   %eax,%eax
8010501c:	78 17                	js     80105035 <sys_fstat+0x34>
8010501e:	83 ec 04             	sub    $0x4,%esp
80105021:	6a 14                	push   $0x14
80105023:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105026:	50                   	push   %eax
80105027:	6a 01                	push   $0x1
80105029:	e8 8e fb ff ff       	call   80104bbc <argptr>
8010502e:	83 c4 10             	add    $0x10,%esp
80105031:	85 c0                	test   %eax,%eax
80105033:	79 07                	jns    8010503c <sys_fstat+0x3b>
    return -1;
80105035:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010503a:	eb 13                	jmp    8010504f <sys_fstat+0x4e>
  return filestat(f, st);
8010503c:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010503f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105042:	83 ec 08             	sub    $0x8,%esp
80105045:	52                   	push   %edx
80105046:	50                   	push   %eax
80105047:	e8 3c b8 ff ff       	call   80100888 <filestat>
8010504c:	83 c4 10             	add    $0x10,%esp
}
8010504f:	c9                   	leave  
80105050:	c3                   	ret    

80105051 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80105051:	55                   	push   %ebp
80105052:	89 e5                	mov    %esp,%ebp
80105054:	83 ec 28             	sub    $0x28,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80105057:	83 ec 08             	sub    $0x8,%esp
8010505a:	8d 45 d8             	lea    -0x28(%ebp),%eax
8010505d:	50                   	push   %eax
8010505e:	6a 00                	push   $0x0
80105060:	e8 b4 fb ff ff       	call   80104c19 <argstr>
80105065:	83 c4 10             	add    $0x10,%esp
80105068:	85 c0                	test   %eax,%eax
8010506a:	78 15                	js     80105081 <sys_link+0x30>
8010506c:	83 ec 08             	sub    $0x8,%esp
8010506f:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105072:	50                   	push   %eax
80105073:	6a 01                	push   $0x1
80105075:	e8 9f fb ff ff       	call   80104c19 <argstr>
8010507a:	83 c4 10             	add    $0x10,%esp
8010507d:	85 c0                	test   %eax,%eax
8010507f:	79 0a                	jns    8010508b <sys_link+0x3a>
    return -1;
80105081:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105086:	e9 63 01 00 00       	jmp    801051ee <sys_link+0x19d>
  if((ip = namei(old)) == 0)
8010508b:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010508e:	83 ec 0c             	sub    $0xc,%esp
80105091:	50                   	push   %eax
80105092:	e8 71 ce ff ff       	call   80101f08 <namei>
80105097:	83 c4 10             	add    $0x10,%esp
8010509a:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010509d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801050a1:	75 0a                	jne    801050ad <sys_link+0x5c>
    return -1;
801050a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050a8:	e9 41 01 00 00       	jmp    801051ee <sys_link+0x19d>

  begin_trans();
801050ad:	e8 22 dc ff ff       	call   80102cd4 <begin_trans>

  ilock(ip);
801050b2:	83 ec 0c             	sub    $0xc,%esp
801050b5:	ff 75 f4             	pushl  -0xc(%ebp)
801050b8:	e8 bd c0 ff ff       	call   8010117a <ilock>
801050bd:	83 c4 10             	add    $0x10,%esp
  if(ip->type == T_DIR){
801050c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801050c3:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801050c7:	66 83 f8 01          	cmp    $0x1,%ax
801050cb:	75 1d                	jne    801050ea <sys_link+0x99>
    iunlockput(ip);
801050cd:	83 ec 0c             	sub    $0xc,%esp
801050d0:	ff 75 f4             	pushl  -0xc(%ebp)
801050d3:	e8 5c c3 ff ff       	call   80101434 <iunlockput>
801050d8:	83 c4 10             	add    $0x10,%esp
    commit_trans();
801050db:	e8 47 dc ff ff       	call   80102d27 <commit_trans>
    return -1;
801050e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050e5:	e9 04 01 00 00       	jmp    801051ee <sys_link+0x19d>
  }

  ip->nlink++;
801050ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
801050ed:	0f b7 40 16          	movzwl 0x16(%eax),%eax
801050f1:	83 c0 01             	add    $0x1,%eax
801050f4:	89 c2                	mov    %eax,%edx
801050f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801050f9:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
801050fd:	83 ec 0c             	sub    $0xc,%esp
80105100:	ff 75 f4             	pushl  -0xc(%ebp)
80105103:	e8 9e be ff ff       	call   80100fa6 <iupdate>
80105108:	83 c4 10             	add    $0x10,%esp
  iunlock(ip);
8010510b:	83 ec 0c             	sub    $0xc,%esp
8010510e:	ff 75 f4             	pushl  -0xc(%ebp)
80105111:	e8 bc c1 ff ff       	call   801012d2 <iunlock>
80105116:	83 c4 10             	add    $0x10,%esp

  if((dp = nameiparent(new, name)) == 0)
80105119:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010511c:	83 ec 08             	sub    $0x8,%esp
8010511f:	8d 55 e2             	lea    -0x1e(%ebp),%edx
80105122:	52                   	push   %edx
80105123:	50                   	push   %eax
80105124:	e8 fb cd ff ff       	call   80101f24 <nameiparent>
80105129:	83 c4 10             	add    $0x10,%esp
8010512c:	89 45 f0             	mov    %eax,-0x10(%ebp)
8010512f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105133:	74 71                	je     801051a6 <sys_link+0x155>
    goto bad;
  ilock(dp);
80105135:	83 ec 0c             	sub    $0xc,%esp
80105138:	ff 75 f0             	pushl  -0x10(%ebp)
8010513b:	e8 3a c0 ff ff       	call   8010117a <ilock>
80105140:	83 c4 10             	add    $0x10,%esp
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80105143:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105146:	8b 10                	mov    (%eax),%edx
80105148:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010514b:	8b 00                	mov    (%eax),%eax
8010514d:	39 c2                	cmp    %eax,%edx
8010514f:	75 1d                	jne    8010516e <sys_link+0x11d>
80105151:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105154:	8b 40 04             	mov    0x4(%eax),%eax
80105157:	83 ec 04             	sub    $0x4,%esp
8010515a:	50                   	push   %eax
8010515b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
8010515e:	50                   	push   %eax
8010515f:	ff 75 f0             	pushl  -0x10(%ebp)
80105162:	e8 05 cb ff ff       	call   80101c6c <dirlink>
80105167:	83 c4 10             	add    $0x10,%esp
8010516a:	85 c0                	test   %eax,%eax
8010516c:	79 10                	jns    8010517e <sys_link+0x12d>
    iunlockput(dp);
8010516e:	83 ec 0c             	sub    $0xc,%esp
80105171:	ff 75 f0             	pushl  -0x10(%ebp)
80105174:	e8 bb c2 ff ff       	call   80101434 <iunlockput>
80105179:	83 c4 10             	add    $0x10,%esp
    goto bad;
8010517c:	eb 29                	jmp    801051a7 <sys_link+0x156>
  }
  iunlockput(dp);
8010517e:	83 ec 0c             	sub    $0xc,%esp
80105181:	ff 75 f0             	pushl  -0x10(%ebp)
80105184:	e8 ab c2 ff ff       	call   80101434 <iunlockput>
80105189:	83 c4 10             	add    $0x10,%esp
  iput(ip);
8010518c:	83 ec 0c             	sub    $0xc,%esp
8010518f:	ff 75 f4             	pushl  -0xc(%ebp)
80105192:	e8 ad c1 ff ff       	call   80101344 <iput>
80105197:	83 c4 10             	add    $0x10,%esp

  commit_trans();
8010519a:	e8 88 db ff ff       	call   80102d27 <commit_trans>

  return 0;
8010519f:	b8 00 00 00 00       	mov    $0x0,%eax
801051a4:	eb 48                	jmp    801051ee <sys_link+0x19d>
  ip->nlink++;
  iupdate(ip);
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
801051a6:	90                   	nop
  commit_trans();

  return 0;

bad:
  ilock(ip);
801051a7:	83 ec 0c             	sub    $0xc,%esp
801051aa:	ff 75 f4             	pushl  -0xc(%ebp)
801051ad:	e8 c8 bf ff ff       	call   8010117a <ilock>
801051b2:	83 c4 10             	add    $0x10,%esp
  ip->nlink--;
801051b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051b8:	0f b7 40 16          	movzwl 0x16(%eax),%eax
801051bc:	83 e8 01             	sub    $0x1,%eax
801051bf:	89 c2                	mov    %eax,%edx
801051c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051c4:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
801051c8:	83 ec 0c             	sub    $0xc,%esp
801051cb:	ff 75 f4             	pushl  -0xc(%ebp)
801051ce:	e8 d3 bd ff ff       	call   80100fa6 <iupdate>
801051d3:	83 c4 10             	add    $0x10,%esp
  iunlockput(ip);
801051d6:	83 ec 0c             	sub    $0xc,%esp
801051d9:	ff 75 f4             	pushl  -0xc(%ebp)
801051dc:	e8 53 c2 ff ff       	call   80101434 <iunlockput>
801051e1:	83 c4 10             	add    $0x10,%esp
  commit_trans();
801051e4:	e8 3e db ff ff       	call   80102d27 <commit_trans>
  return -1;
801051e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801051ee:	c9                   	leave  
801051ef:	c3                   	ret    

801051f0 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
801051f0:	55                   	push   %ebp
801051f1:	89 e5                	mov    %esp,%ebp
801051f3:	83 ec 28             	sub    $0x28,%esp
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
801051f6:	c7 45 f4 20 00 00 00 	movl   $0x20,-0xc(%ebp)
801051fd:	eb 40                	jmp    8010523f <isdirempty+0x4f>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801051ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105202:	6a 10                	push   $0x10
80105204:	50                   	push   %eax
80105205:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105208:	50                   	push   %eax
80105209:	ff 75 08             	pushl  0x8(%ebp)
8010520c:	e8 d1 c4 ff ff       	call   801016e2 <readi>
80105211:	83 c4 10             	add    $0x10,%esp
80105214:	83 f8 10             	cmp    $0x10,%eax
80105217:	74 0d                	je     80105226 <isdirempty+0x36>
      panic("isdirempty: readi");
80105219:	83 ec 0c             	sub    $0xc,%esp
8010521c:	68 ff 9b 10 80       	push   $0x80109bff
80105221:	e8 29 35 00 00       	call   8010874f <panic>
    if(de.inum != 0)
80105226:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
8010522a:	66 85 c0             	test   %ax,%ax
8010522d:	74 07                	je     80105236 <isdirempty+0x46>
      return 0;
8010522f:	b8 00 00 00 00       	mov    $0x0,%eax
80105234:	eb 1b                	jmp    80105251 <isdirempty+0x61>
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105236:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105239:	83 c0 10             	add    $0x10,%eax
8010523c:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010523f:	8b 45 08             	mov    0x8(%ebp),%eax
80105242:	8b 50 18             	mov    0x18(%eax),%edx
80105245:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105248:	39 c2                	cmp    %eax,%edx
8010524a:	77 b3                	ja     801051ff <isdirempty+0xf>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
    if(de.inum != 0)
      return 0;
  }
  return 1;
8010524c:	b8 01 00 00 00       	mov    $0x1,%eax
}
80105251:	c9                   	leave  
80105252:	c3                   	ret    

80105253 <sys_unlink>:

//PAGEBREAK!
int
sys_unlink(void)
{
80105253:	55                   	push   %ebp
80105254:	89 e5                	mov    %esp,%ebp
80105256:	83 ec 38             	sub    $0x38,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80105259:	83 ec 08             	sub    $0x8,%esp
8010525c:	8d 45 cc             	lea    -0x34(%ebp),%eax
8010525f:	50                   	push   %eax
80105260:	6a 00                	push   $0x0
80105262:	e8 b2 f9 ff ff       	call   80104c19 <argstr>
80105267:	83 c4 10             	add    $0x10,%esp
8010526a:	85 c0                	test   %eax,%eax
8010526c:	79 0a                	jns    80105278 <sys_unlink+0x25>
    return -1;
8010526e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105273:	e9 b7 01 00 00       	jmp    8010542f <sys_unlink+0x1dc>
  if((dp = nameiparent(path, name)) == 0)
80105278:	8b 45 cc             	mov    -0x34(%ebp),%eax
8010527b:	83 ec 08             	sub    $0x8,%esp
8010527e:	8d 55 d2             	lea    -0x2e(%ebp),%edx
80105281:	52                   	push   %edx
80105282:	50                   	push   %eax
80105283:	e8 9c cc ff ff       	call   80101f24 <nameiparent>
80105288:	83 c4 10             	add    $0x10,%esp
8010528b:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010528e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105292:	75 0a                	jne    8010529e <sys_unlink+0x4b>
    return -1;
80105294:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105299:	e9 91 01 00 00       	jmp    8010542f <sys_unlink+0x1dc>

  begin_trans();
8010529e:	e8 31 da ff ff       	call   80102cd4 <begin_trans>

  ilock(dp);
801052a3:	83 ec 0c             	sub    $0xc,%esp
801052a6:	ff 75 f4             	pushl  -0xc(%ebp)
801052a9:	e8 cc be ff ff       	call   8010117a <ilock>
801052ae:	83 c4 10             	add    $0x10,%esp

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
801052b1:	83 ec 08             	sub    $0x8,%esp
801052b4:	68 11 9c 10 80       	push   $0x80109c11
801052b9:	8d 45 d2             	lea    -0x2e(%ebp),%eax
801052bc:	50                   	push   %eax
801052bd:	e8 d5 c8 ff ff       	call   80101b97 <namecmp>
801052c2:	83 c4 10             	add    $0x10,%esp
801052c5:	85 c0                	test   %eax,%eax
801052c7:	0f 84 4a 01 00 00    	je     80105417 <sys_unlink+0x1c4>
801052cd:	83 ec 08             	sub    $0x8,%esp
801052d0:	68 13 9c 10 80       	push   $0x80109c13
801052d5:	8d 45 d2             	lea    -0x2e(%ebp),%eax
801052d8:	50                   	push   %eax
801052d9:	e8 b9 c8 ff ff       	call   80101b97 <namecmp>
801052de:	83 c4 10             	add    $0x10,%esp
801052e1:	85 c0                	test   %eax,%eax
801052e3:	0f 84 2e 01 00 00    	je     80105417 <sys_unlink+0x1c4>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
801052e9:	83 ec 04             	sub    $0x4,%esp
801052ec:	8d 45 c8             	lea    -0x38(%ebp),%eax
801052ef:	50                   	push   %eax
801052f0:	8d 45 d2             	lea    -0x2e(%ebp),%eax
801052f3:	50                   	push   %eax
801052f4:	ff 75 f4             	pushl  -0xc(%ebp)
801052f7:	e8 b6 c8 ff ff       	call   80101bb2 <dirlookup>
801052fc:	83 c4 10             	add    $0x10,%esp
801052ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105302:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105306:	0f 84 0a 01 00 00    	je     80105416 <sys_unlink+0x1c3>
    goto bad;
  ilock(ip);
8010530c:	83 ec 0c             	sub    $0xc,%esp
8010530f:	ff 75 f0             	pushl  -0x10(%ebp)
80105312:	e8 63 be ff ff       	call   8010117a <ilock>
80105317:	83 c4 10             	add    $0x10,%esp

  if(ip->nlink < 1)
8010531a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010531d:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105321:	66 85 c0             	test   %ax,%ax
80105324:	7f 0d                	jg     80105333 <sys_unlink+0xe0>
    panic("unlink: nlink < 1");
80105326:	83 ec 0c             	sub    $0xc,%esp
80105329:	68 16 9c 10 80       	push   $0x80109c16
8010532e:	e8 1c 34 00 00       	call   8010874f <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
80105333:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105336:	0f b7 40 10          	movzwl 0x10(%eax),%eax
8010533a:	66 83 f8 01          	cmp    $0x1,%ax
8010533e:	75 25                	jne    80105365 <sys_unlink+0x112>
80105340:	83 ec 0c             	sub    $0xc,%esp
80105343:	ff 75 f0             	pushl  -0x10(%ebp)
80105346:	e8 a5 fe ff ff       	call   801051f0 <isdirempty>
8010534b:	83 c4 10             	add    $0x10,%esp
8010534e:	85 c0                	test   %eax,%eax
80105350:	75 13                	jne    80105365 <sys_unlink+0x112>
    iunlockput(ip);
80105352:	83 ec 0c             	sub    $0xc,%esp
80105355:	ff 75 f0             	pushl  -0x10(%ebp)
80105358:	e8 d7 c0 ff ff       	call   80101434 <iunlockput>
8010535d:	83 c4 10             	add    $0x10,%esp
    goto bad;
80105360:	e9 b2 00 00 00       	jmp    80105417 <sys_unlink+0x1c4>
  }

  memset(&de, 0, sizeof(de));
80105365:	83 ec 04             	sub    $0x4,%esp
80105368:	6a 10                	push   $0x10
8010536a:	6a 00                	push   $0x0
8010536c:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010536f:	50                   	push   %eax
80105370:	e8 fa f4 ff ff       	call   8010486f <memset>
80105375:	83 c4 10             	add    $0x10,%esp
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105378:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010537b:	6a 10                	push   $0x10
8010537d:	50                   	push   %eax
8010537e:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105381:	50                   	push   %eax
80105382:	ff 75 f4             	pushl  -0xc(%ebp)
80105385:	e8 c5 c4 ff ff       	call   8010184f <writei>
8010538a:	83 c4 10             	add    $0x10,%esp
8010538d:	83 f8 10             	cmp    $0x10,%eax
80105390:	74 0d                	je     8010539f <sys_unlink+0x14c>
    panic("unlink: writei");
80105392:	83 ec 0c             	sub    $0xc,%esp
80105395:	68 28 9c 10 80       	push   $0x80109c28
8010539a:	e8 b0 33 00 00       	call   8010874f <panic>
  if(ip->type == T_DIR){
8010539f:	8b 45 f0             	mov    -0x10(%ebp),%eax
801053a2:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801053a6:	66 83 f8 01          	cmp    $0x1,%ax
801053aa:	75 21                	jne    801053cd <sys_unlink+0x17a>
    dp->nlink--;
801053ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
801053af:	0f b7 40 16          	movzwl 0x16(%eax),%eax
801053b3:	83 e8 01             	sub    $0x1,%eax
801053b6:	89 c2                	mov    %eax,%edx
801053b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801053bb:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
801053bf:	83 ec 0c             	sub    $0xc,%esp
801053c2:	ff 75 f4             	pushl  -0xc(%ebp)
801053c5:	e8 dc bb ff ff       	call   80100fa6 <iupdate>
801053ca:	83 c4 10             	add    $0x10,%esp
  }
  iunlockput(dp);
801053cd:	83 ec 0c             	sub    $0xc,%esp
801053d0:	ff 75 f4             	pushl  -0xc(%ebp)
801053d3:	e8 5c c0 ff ff       	call   80101434 <iunlockput>
801053d8:	83 c4 10             	add    $0x10,%esp

  ip->nlink--;
801053db:	8b 45 f0             	mov    -0x10(%ebp),%eax
801053de:	0f b7 40 16          	movzwl 0x16(%eax),%eax
801053e2:	83 e8 01             	sub    $0x1,%eax
801053e5:	89 c2                	mov    %eax,%edx
801053e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
801053ea:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
801053ee:	83 ec 0c             	sub    $0xc,%esp
801053f1:	ff 75 f0             	pushl  -0x10(%ebp)
801053f4:	e8 ad bb ff ff       	call   80100fa6 <iupdate>
801053f9:	83 c4 10             	add    $0x10,%esp
  iunlockput(ip);
801053fc:	83 ec 0c             	sub    $0xc,%esp
801053ff:	ff 75 f0             	pushl  -0x10(%ebp)
80105402:	e8 2d c0 ff ff       	call   80101434 <iunlockput>
80105407:	83 c4 10             	add    $0x10,%esp

  commit_trans();
8010540a:	e8 18 d9 ff ff       	call   80102d27 <commit_trans>

  return 0;
8010540f:	b8 00 00 00 00       	mov    $0x0,%eax
80105414:	eb 19                	jmp    8010542f <sys_unlink+0x1dc>
  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
80105416:	90                   	nop
  commit_trans();

  return 0;

bad:
  iunlockput(dp);
80105417:	83 ec 0c             	sub    $0xc,%esp
8010541a:	ff 75 f4             	pushl  -0xc(%ebp)
8010541d:	e8 12 c0 ff ff       	call   80101434 <iunlockput>
80105422:	83 c4 10             	add    $0x10,%esp
  commit_trans();
80105425:	e8 fd d8 ff ff       	call   80102d27 <commit_trans>
  return -1;
8010542a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010542f:	c9                   	leave  
80105430:	c3                   	ret    

80105431 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
80105431:	55                   	push   %ebp
80105432:	89 e5                	mov    %esp,%ebp
80105434:	83 ec 38             	sub    $0x38,%esp
80105437:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010543a:	8b 55 10             	mov    0x10(%ebp),%edx
8010543d:	8b 45 14             	mov    0x14(%ebp),%eax
80105440:	66 89 4d d4          	mov    %cx,-0x2c(%ebp)
80105444:	66 89 55 d0          	mov    %dx,-0x30(%ebp)
80105448:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
8010544c:	83 ec 08             	sub    $0x8,%esp
8010544f:	8d 45 de             	lea    -0x22(%ebp),%eax
80105452:	50                   	push   %eax
80105453:	ff 75 08             	pushl  0x8(%ebp)
80105456:	e8 c9 ca ff ff       	call   80101f24 <nameiparent>
8010545b:	83 c4 10             	add    $0x10,%esp
8010545e:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105461:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105465:	75 0a                	jne    80105471 <create+0x40>
    return 0;
80105467:	b8 00 00 00 00       	mov    $0x0,%eax
8010546c:	e9 90 01 00 00       	jmp    80105601 <create+0x1d0>
  ilock(dp);
80105471:	83 ec 0c             	sub    $0xc,%esp
80105474:	ff 75 f4             	pushl  -0xc(%ebp)
80105477:	e8 fe bc ff ff       	call   8010117a <ilock>
8010547c:	83 c4 10             	add    $0x10,%esp

  if((ip = dirlookup(dp, name, &off)) != 0){
8010547f:	83 ec 04             	sub    $0x4,%esp
80105482:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105485:	50                   	push   %eax
80105486:	8d 45 de             	lea    -0x22(%ebp),%eax
80105489:	50                   	push   %eax
8010548a:	ff 75 f4             	pushl  -0xc(%ebp)
8010548d:	e8 20 c7 ff ff       	call   80101bb2 <dirlookup>
80105492:	83 c4 10             	add    $0x10,%esp
80105495:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105498:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010549c:	74 50                	je     801054ee <create+0xbd>
    iunlockput(dp);
8010549e:	83 ec 0c             	sub    $0xc,%esp
801054a1:	ff 75 f4             	pushl  -0xc(%ebp)
801054a4:	e8 8b bf ff ff       	call   80101434 <iunlockput>
801054a9:	83 c4 10             	add    $0x10,%esp
    ilock(ip);
801054ac:	83 ec 0c             	sub    $0xc,%esp
801054af:	ff 75 f0             	pushl  -0x10(%ebp)
801054b2:	e8 c3 bc ff ff       	call   8010117a <ilock>
801054b7:	83 c4 10             	add    $0x10,%esp
    if(type == T_FILE && ip->type == T_FILE)
801054ba:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
801054bf:	75 15                	jne    801054d6 <create+0xa5>
801054c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801054c4:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801054c8:	66 83 f8 02          	cmp    $0x2,%ax
801054cc:	75 08                	jne    801054d6 <create+0xa5>
      return ip;
801054ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
801054d1:	e9 2b 01 00 00       	jmp    80105601 <create+0x1d0>
    iunlockput(ip);
801054d6:	83 ec 0c             	sub    $0xc,%esp
801054d9:	ff 75 f0             	pushl  -0x10(%ebp)
801054dc:	e8 53 bf ff ff       	call   80101434 <iunlockput>
801054e1:	83 c4 10             	add    $0x10,%esp
    return 0;
801054e4:	b8 00 00 00 00       	mov    $0x0,%eax
801054e9:	e9 13 01 00 00       	jmp    80105601 <create+0x1d0>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
801054ee:	0f bf 55 d4          	movswl -0x2c(%ebp),%edx
801054f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801054f5:	8b 00                	mov    (%eax),%eax
801054f7:	83 ec 08             	sub    $0x8,%esp
801054fa:	52                   	push   %edx
801054fb:	50                   	push   %eax
801054fc:	e8 c4 b9 ff ff       	call   80100ec5 <ialloc>
80105501:	83 c4 10             	add    $0x10,%esp
80105504:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105507:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010550b:	75 0d                	jne    8010551a <create+0xe9>
    panic("create: ialloc");
8010550d:	83 ec 0c             	sub    $0xc,%esp
80105510:	68 37 9c 10 80       	push   $0x80109c37
80105515:	e8 35 32 00 00       	call   8010874f <panic>

  ilock(ip);
8010551a:	83 ec 0c             	sub    $0xc,%esp
8010551d:	ff 75 f0             	pushl  -0x10(%ebp)
80105520:	e8 55 bc ff ff       	call   8010117a <ilock>
80105525:	83 c4 10             	add    $0x10,%esp
  ip->major = major;
80105528:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010552b:	0f b7 55 d0          	movzwl -0x30(%ebp),%edx
8010552f:	66 89 50 12          	mov    %dx,0x12(%eax)
  ip->minor = minor;
80105533:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105536:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
8010553a:	66 89 50 14          	mov    %dx,0x14(%eax)
  ip->nlink = 1;
8010553e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105541:	66 c7 40 16 01 00    	movw   $0x1,0x16(%eax)
  iupdate(ip);
80105547:	83 ec 0c             	sub    $0xc,%esp
8010554a:	ff 75 f0             	pushl  -0x10(%ebp)
8010554d:	e8 54 ba ff ff       	call   80100fa6 <iupdate>
80105552:	83 c4 10             	add    $0x10,%esp

  if(type == T_DIR){  // Create . and .. entries.
80105555:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
8010555a:	75 6a                	jne    801055c6 <create+0x195>
    dp->nlink++;  // for ".."
8010555c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010555f:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105563:	83 c0 01             	add    $0x1,%eax
80105566:	89 c2                	mov    %eax,%edx
80105568:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010556b:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
8010556f:	83 ec 0c             	sub    $0xc,%esp
80105572:	ff 75 f4             	pushl  -0xc(%ebp)
80105575:	e8 2c ba ff ff       	call   80100fa6 <iupdate>
8010557a:	83 c4 10             	add    $0x10,%esp
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
8010557d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105580:	8b 40 04             	mov    0x4(%eax),%eax
80105583:	83 ec 04             	sub    $0x4,%esp
80105586:	50                   	push   %eax
80105587:	68 11 9c 10 80       	push   $0x80109c11
8010558c:	ff 75 f0             	pushl  -0x10(%ebp)
8010558f:	e8 d8 c6 ff ff       	call   80101c6c <dirlink>
80105594:	83 c4 10             	add    $0x10,%esp
80105597:	85 c0                	test   %eax,%eax
80105599:	78 1e                	js     801055b9 <create+0x188>
8010559b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010559e:	8b 40 04             	mov    0x4(%eax),%eax
801055a1:	83 ec 04             	sub    $0x4,%esp
801055a4:	50                   	push   %eax
801055a5:	68 13 9c 10 80       	push   $0x80109c13
801055aa:	ff 75 f0             	pushl  -0x10(%ebp)
801055ad:	e8 ba c6 ff ff       	call   80101c6c <dirlink>
801055b2:	83 c4 10             	add    $0x10,%esp
801055b5:	85 c0                	test   %eax,%eax
801055b7:	79 0d                	jns    801055c6 <create+0x195>
      panic("create dots");
801055b9:	83 ec 0c             	sub    $0xc,%esp
801055bc:	68 46 9c 10 80       	push   $0x80109c46
801055c1:	e8 89 31 00 00       	call   8010874f <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
801055c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
801055c9:	8b 40 04             	mov    0x4(%eax),%eax
801055cc:	83 ec 04             	sub    $0x4,%esp
801055cf:	50                   	push   %eax
801055d0:	8d 45 de             	lea    -0x22(%ebp),%eax
801055d3:	50                   	push   %eax
801055d4:	ff 75 f4             	pushl  -0xc(%ebp)
801055d7:	e8 90 c6 ff ff       	call   80101c6c <dirlink>
801055dc:	83 c4 10             	add    $0x10,%esp
801055df:	85 c0                	test   %eax,%eax
801055e1:	79 0d                	jns    801055f0 <create+0x1bf>
    panic("create: dirlink");
801055e3:	83 ec 0c             	sub    $0xc,%esp
801055e6:	68 52 9c 10 80       	push   $0x80109c52
801055eb:	e8 5f 31 00 00       	call   8010874f <panic>

  iunlockput(dp);
801055f0:	83 ec 0c             	sub    $0xc,%esp
801055f3:	ff 75 f4             	pushl  -0xc(%ebp)
801055f6:	e8 39 be ff ff       	call   80101434 <iunlockput>
801055fb:	83 c4 10             	add    $0x10,%esp

  return ip;
801055fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80105601:	c9                   	leave  
80105602:	c3                   	ret    

80105603 <sys_open>:

int
sys_open(void)
{
80105603:	55                   	push   %ebp
80105604:	89 e5                	mov    %esp,%ebp
80105606:	83 ec 28             	sub    $0x28,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105609:	83 ec 08             	sub    $0x8,%esp
8010560c:	8d 45 e8             	lea    -0x18(%ebp),%eax
8010560f:	50                   	push   %eax
80105610:	6a 00                	push   $0x0
80105612:	e8 02 f6 ff ff       	call   80104c19 <argstr>
80105617:	83 c4 10             	add    $0x10,%esp
8010561a:	85 c0                	test   %eax,%eax
8010561c:	78 15                	js     80105633 <sys_open+0x30>
8010561e:	83 ec 08             	sub    $0x8,%esp
80105621:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105624:	50                   	push   %eax
80105625:	6a 01                	push   $0x1
80105627:	e8 68 f5 ff ff       	call   80104b94 <argint>
8010562c:	83 c4 10             	add    $0x10,%esp
8010562f:	85 c0                	test   %eax,%eax
80105631:	79 0a                	jns    8010563d <sys_open+0x3a>
    return -1;
80105633:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105638:	e9 4d 01 00 00       	jmp    8010578a <sys_open+0x187>
  if(omode & O_CREATE){
8010563d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105640:	25 00 02 00 00       	and    $0x200,%eax
80105645:	85 c0                	test   %eax,%eax
80105647:	74 2f                	je     80105678 <sys_open+0x75>
    begin_trans();
80105649:	e8 86 d6 ff ff       	call   80102cd4 <begin_trans>
    ip = create(path, T_FILE, 0, 0);
8010564e:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105651:	6a 00                	push   $0x0
80105653:	6a 00                	push   $0x0
80105655:	6a 02                	push   $0x2
80105657:	50                   	push   %eax
80105658:	e8 d4 fd ff ff       	call   80105431 <create>
8010565d:	83 c4 10             	add    $0x10,%esp
80105660:	89 45 f4             	mov    %eax,-0xc(%ebp)
    commit_trans();
80105663:	e8 bf d6 ff ff       	call   80102d27 <commit_trans>
    if(ip == 0)
80105668:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010566c:	75 66                	jne    801056d4 <sys_open+0xd1>
      return -1;
8010566e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105673:	e9 12 01 00 00       	jmp    8010578a <sys_open+0x187>
  } else {
    if((ip = namei(path)) == 0)
80105678:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010567b:	83 ec 0c             	sub    $0xc,%esp
8010567e:	50                   	push   %eax
8010567f:	e8 84 c8 ff ff       	call   80101f08 <namei>
80105684:	83 c4 10             	add    $0x10,%esp
80105687:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010568a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010568e:	75 0a                	jne    8010569a <sys_open+0x97>
      return -1;
80105690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105695:	e9 f0 00 00 00       	jmp    8010578a <sys_open+0x187>
    ilock(ip);
8010569a:	83 ec 0c             	sub    $0xc,%esp
8010569d:	ff 75 f4             	pushl  -0xc(%ebp)
801056a0:	e8 d5 ba ff ff       	call   8010117a <ilock>
801056a5:	83 c4 10             	add    $0x10,%esp
    if(ip->type == T_DIR && omode != O_RDONLY){
801056a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801056ab:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801056af:	66 83 f8 01          	cmp    $0x1,%ax
801056b3:	75 1f                	jne    801056d4 <sys_open+0xd1>
801056b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801056b8:	85 c0                	test   %eax,%eax
801056ba:	74 18                	je     801056d4 <sys_open+0xd1>
      iunlockput(ip);
801056bc:	83 ec 0c             	sub    $0xc,%esp
801056bf:	ff 75 f4             	pushl  -0xc(%ebp)
801056c2:	e8 6d bd ff ff       	call   80101434 <iunlockput>
801056c7:	83 c4 10             	add    $0x10,%esp
      return -1;
801056ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056cf:	e9 b6 00 00 00       	jmp    8010578a <sys_open+0x187>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801056d4:	e8 09 b0 ff ff       	call   801006e2 <filealloc>
801056d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
801056dc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801056e0:	74 17                	je     801056f9 <sys_open+0xf6>
801056e2:	83 ec 0c             	sub    $0xc,%esp
801056e5:	ff 75 f0             	pushl  -0x10(%ebp)
801056e8:	e8 58 f6 ff ff       	call   80104d45 <fdalloc>
801056ed:	83 c4 10             	add    $0x10,%esp
801056f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
801056f3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
801056f7:	79 29                	jns    80105722 <sys_open+0x11f>
    if(f)
801056f9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801056fd:	74 0e                	je     8010570d <sys_open+0x10a>
      fileclose(f);
801056ff:	83 ec 0c             	sub    $0xc,%esp
80105702:	ff 75 f0             	pushl  -0x10(%ebp)
80105705:	e8 96 b0 ff ff       	call   801007a0 <fileclose>
8010570a:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
8010570d:	83 ec 0c             	sub    $0xc,%esp
80105710:	ff 75 f4             	pushl  -0xc(%ebp)
80105713:	e8 1c bd ff ff       	call   80101434 <iunlockput>
80105718:	83 c4 10             	add    $0x10,%esp
    return -1;
8010571b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105720:	eb 68                	jmp    8010578a <sys_open+0x187>
  }
  iunlock(ip);
80105722:	83 ec 0c             	sub    $0xc,%esp
80105725:	ff 75 f4             	pushl  -0xc(%ebp)
80105728:	e8 a5 bb ff ff       	call   801012d2 <iunlock>
8010572d:	83 c4 10             	add    $0x10,%esp

  f->type = FD_INODE;
80105730:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105733:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  f->ip = ip;
80105739:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010573c:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010573f:	89 50 10             	mov    %edx,0x10(%eax)
  f->off = 0;
80105742:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105745:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  f->readable = !(omode & O_WRONLY);
8010574c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010574f:	83 e0 01             	and    $0x1,%eax
80105752:	85 c0                	test   %eax,%eax
80105754:	0f 94 c0             	sete   %al
80105757:	89 c2                	mov    %eax,%edx
80105759:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010575c:	88 50 08             	mov    %dl,0x8(%eax)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010575f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105762:	83 e0 01             	and    $0x1,%eax
80105765:	85 c0                	test   %eax,%eax
80105767:	75 0a                	jne    80105773 <sys_open+0x170>
80105769:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010576c:	83 e0 02             	and    $0x2,%eax
8010576f:	85 c0                	test   %eax,%eax
80105771:	74 07                	je     8010577a <sys_open+0x177>
80105773:	b8 01 00 00 00       	mov    $0x1,%eax
80105778:	eb 05                	jmp    8010577f <sys_open+0x17c>
8010577a:	b8 00 00 00 00       	mov    $0x0,%eax
8010577f:	89 c2                	mov    %eax,%edx
80105781:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105784:	88 50 09             	mov    %dl,0x9(%eax)
  return fd;
80105787:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
8010578a:	c9                   	leave  
8010578b:	c3                   	ret    

8010578c <sys_mkdir>:

int
sys_mkdir(void)
{
8010578c:	55                   	push   %ebp
8010578d:	89 e5                	mov    %esp,%ebp
8010578f:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_trans();
80105792:	e8 3d d5 ff ff       	call   80102cd4 <begin_trans>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
80105797:	83 ec 08             	sub    $0x8,%esp
8010579a:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010579d:	50                   	push   %eax
8010579e:	6a 00                	push   $0x0
801057a0:	e8 74 f4 ff ff       	call   80104c19 <argstr>
801057a5:	83 c4 10             	add    $0x10,%esp
801057a8:	85 c0                	test   %eax,%eax
801057aa:	78 1b                	js     801057c7 <sys_mkdir+0x3b>
801057ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
801057af:	6a 00                	push   $0x0
801057b1:	6a 00                	push   $0x0
801057b3:	6a 01                	push   $0x1
801057b5:	50                   	push   %eax
801057b6:	e8 76 fc ff ff       	call   80105431 <create>
801057bb:	83 c4 10             	add    $0x10,%esp
801057be:	89 45 f4             	mov    %eax,-0xc(%ebp)
801057c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801057c5:	75 0c                	jne    801057d3 <sys_mkdir+0x47>
    commit_trans();
801057c7:	e8 5b d5 ff ff       	call   80102d27 <commit_trans>
    return -1;
801057cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057d1:	eb 18                	jmp    801057eb <sys_mkdir+0x5f>
  }
  iunlockput(ip);
801057d3:	83 ec 0c             	sub    $0xc,%esp
801057d6:	ff 75 f4             	pushl  -0xc(%ebp)
801057d9:	e8 56 bc ff ff       	call   80101434 <iunlockput>
801057de:	83 c4 10             	add    $0x10,%esp
  commit_trans();
801057e1:	e8 41 d5 ff ff       	call   80102d27 <commit_trans>
  return 0;
801057e6:	b8 00 00 00 00       	mov    $0x0,%eax
}
801057eb:	c9                   	leave  
801057ec:	c3                   	ret    

801057ed <sys_mknod>:

int
sys_mknod(void)
{
801057ed:	55                   	push   %ebp
801057ee:	89 e5                	mov    %esp,%ebp
801057f0:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip;
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
801057f3:	e8 dc d4 ff ff       	call   80102cd4 <begin_trans>
  if((len=argstr(0, &path)) < 0 ||
801057f8:	83 ec 08             	sub    $0x8,%esp
801057fb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801057fe:	50                   	push   %eax
801057ff:	6a 00                	push   $0x0
80105801:	e8 13 f4 ff ff       	call   80104c19 <argstr>
80105806:	83 c4 10             	add    $0x10,%esp
80105809:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010580c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105810:	78 4f                	js     80105861 <sys_mknod+0x74>
     argint(1, &major) < 0 ||
80105812:	83 ec 08             	sub    $0x8,%esp
80105815:	8d 45 e8             	lea    -0x18(%ebp),%eax
80105818:	50                   	push   %eax
80105819:	6a 01                	push   $0x1
8010581b:	e8 74 f3 ff ff       	call   80104b94 <argint>
80105820:	83 c4 10             	add    $0x10,%esp
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
80105823:	85 c0                	test   %eax,%eax
80105825:	78 3a                	js     80105861 <sys_mknod+0x74>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105827:	83 ec 08             	sub    $0x8,%esp
8010582a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010582d:	50                   	push   %eax
8010582e:	6a 02                	push   $0x2
80105830:	e8 5f f3 ff ff       	call   80104b94 <argint>
80105835:	83 c4 10             	add    $0x10,%esp
  int len;
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
80105838:	85 c0                	test   %eax,%eax
8010583a:	78 25                	js     80105861 <sys_mknod+0x74>
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
8010583c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010583f:	0f bf c8             	movswl %ax,%ecx
80105842:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105845:	0f bf d0             	movswl %ax,%edx
80105848:	8b 45 ec             	mov    -0x14(%ebp),%eax
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
8010584b:	51                   	push   %ecx
8010584c:	52                   	push   %edx
8010584d:	6a 03                	push   $0x3
8010584f:	50                   	push   %eax
80105850:	e8 dc fb ff ff       	call   80105431 <create>
80105855:	83 c4 10             	add    $0x10,%esp
80105858:	89 45 f0             	mov    %eax,-0x10(%ebp)
8010585b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010585f:	75 0c                	jne    8010586d <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    commit_trans();
80105861:	e8 c1 d4 ff ff       	call   80102d27 <commit_trans>
    return -1;
80105866:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010586b:	eb 18                	jmp    80105885 <sys_mknod+0x98>
  }
  iunlockput(ip);
8010586d:	83 ec 0c             	sub    $0xc,%esp
80105870:	ff 75 f0             	pushl  -0x10(%ebp)
80105873:	e8 bc bb ff ff       	call   80101434 <iunlockput>
80105878:	83 c4 10             	add    $0x10,%esp
  commit_trans();
8010587b:	e8 a7 d4 ff ff       	call   80102d27 <commit_trans>
  return 0;
80105880:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105885:	c9                   	leave  
80105886:	c3                   	ret    

80105887 <sys_chdir>:

int
sys_chdir(void)
{
80105887:	55                   	push   %ebp
80105888:	89 e5                	mov    %esp,%ebp
8010588a:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0)
8010588d:	83 ec 08             	sub    $0x8,%esp
80105890:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105893:	50                   	push   %eax
80105894:	6a 00                	push   $0x0
80105896:	e8 7e f3 ff ff       	call   80104c19 <argstr>
8010589b:	83 c4 10             	add    $0x10,%esp
8010589e:	85 c0                	test   %eax,%eax
801058a0:	78 18                	js     801058ba <sys_chdir+0x33>
801058a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
801058a5:	83 ec 0c             	sub    $0xc,%esp
801058a8:	50                   	push   %eax
801058a9:	e8 5a c6 ff ff       	call   80101f08 <namei>
801058ae:	83 c4 10             	add    $0x10,%esp
801058b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
801058b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801058b8:	75 07                	jne    801058c1 <sys_chdir+0x3a>
    return -1;
801058ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058bf:	eb 64                	jmp    80105925 <sys_chdir+0x9e>
  ilock(ip);
801058c1:	83 ec 0c             	sub    $0xc,%esp
801058c4:	ff 75 f4             	pushl  -0xc(%ebp)
801058c7:	e8 ae b8 ff ff       	call   8010117a <ilock>
801058cc:	83 c4 10             	add    $0x10,%esp
  if(ip->type != T_DIR){
801058cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
801058d2:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801058d6:	66 83 f8 01          	cmp    $0x1,%ax
801058da:	74 15                	je     801058f1 <sys_chdir+0x6a>
    iunlockput(ip);
801058dc:	83 ec 0c             	sub    $0xc,%esp
801058df:	ff 75 f4             	pushl  -0xc(%ebp)
801058e2:	e8 4d bb ff ff       	call   80101434 <iunlockput>
801058e7:	83 c4 10             	add    $0x10,%esp
    return -1;
801058ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058ef:	eb 34                	jmp    80105925 <sys_chdir+0x9e>
  }
  iunlock(ip);
801058f1:	83 ec 0c             	sub    $0xc,%esp
801058f4:	ff 75 f4             	pushl  -0xc(%ebp)
801058f7:	e8 d6 b9 ff ff       	call   801012d2 <iunlock>
801058fc:	83 c4 10             	add    $0x10,%esp
  iput(proc->cwd);
801058ff:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105905:	8b 40 68             	mov    0x68(%eax),%eax
80105908:	83 ec 0c             	sub    $0xc,%esp
8010590b:	50                   	push   %eax
8010590c:	e8 33 ba ff ff       	call   80101344 <iput>
80105911:	83 c4 10             	add    $0x10,%esp
  proc->cwd = ip;
80105914:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010591a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010591d:	89 50 68             	mov    %edx,0x68(%eax)
  return 0;
80105920:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105925:	c9                   	leave  
80105926:	c3                   	ret    

80105927 <sys_exec>:

int
sys_exec(void)
{
80105927:	55                   	push   %ebp
80105928:	89 e5                	mov    %esp,%ebp
8010592a:	81 ec 98 00 00 00    	sub    $0x98,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105930:	83 ec 08             	sub    $0x8,%esp
80105933:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105936:	50                   	push   %eax
80105937:	6a 00                	push   $0x0
80105939:	e8 db f2 ff ff       	call   80104c19 <argstr>
8010593e:	83 c4 10             	add    $0x10,%esp
80105941:	85 c0                	test   %eax,%eax
80105943:	78 18                	js     8010595d <sys_exec+0x36>
80105945:	83 ec 08             	sub    $0x8,%esp
80105948:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
8010594e:	50                   	push   %eax
8010594f:	6a 01                	push   $0x1
80105951:	e8 3e f2 ff ff       	call   80104b94 <argint>
80105956:	83 c4 10             	add    $0x10,%esp
80105959:	85 c0                	test   %eax,%eax
8010595b:	79 0a                	jns    80105967 <sys_exec+0x40>
    return -1;
8010595d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105962:	e9 c6 00 00 00       	jmp    80105a2d <sys_exec+0x106>
  }
  memset(argv, 0, sizeof(argv));
80105967:	83 ec 04             	sub    $0x4,%esp
8010596a:	68 80 00 00 00       	push   $0x80
8010596f:	6a 00                	push   $0x0
80105971:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
80105977:	50                   	push   %eax
80105978:	e8 f2 ee ff ff       	call   8010486f <memset>
8010597d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
80105980:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(i >= NELEM(argv))
80105987:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010598a:	83 f8 1f             	cmp    $0x1f,%eax
8010598d:	76 0a                	jbe    80105999 <sys_exec+0x72>
      return -1;
8010598f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105994:	e9 94 00 00 00       	jmp    80105a2d <sys_exec+0x106>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105999:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010599c:	c1 e0 02             	shl    $0x2,%eax
8010599f:	89 c2                	mov    %eax,%edx
801059a1:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
801059a7:	01 c2                	add    %eax,%edx
801059a9:	83 ec 08             	sub    $0x8,%esp
801059ac:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801059b2:	50                   	push   %eax
801059b3:	52                   	push   %edx
801059b4:	e8 3f f1 ff ff       	call   80104af8 <fetchint>
801059b9:	83 c4 10             	add    $0x10,%esp
801059bc:	85 c0                	test   %eax,%eax
801059be:	79 07                	jns    801059c7 <sys_exec+0xa0>
      return -1;
801059c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801059c5:	eb 66                	jmp    80105a2d <sys_exec+0x106>
    if(uarg == 0){
801059c7:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
801059cd:	85 c0                	test   %eax,%eax
801059cf:	75 27                	jne    801059f8 <sys_exec+0xd1>
      argv[i] = 0;
801059d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801059d4:	c7 84 85 70 ff ff ff 	movl   $0x0,-0x90(%ebp,%eax,4)
801059db:	00 00 00 00 
      break;
801059df:	90                   	nop
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801059e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
801059e3:	83 ec 08             	sub    $0x8,%esp
801059e6:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
801059ec:	52                   	push   %edx
801059ed:	50                   	push   %eax
801059ee:	e8 e1 a8 ff ff       	call   801002d4 <exec>
801059f3:	83 c4 10             	add    $0x10,%esp
801059f6:	eb 35                	jmp    80105a2d <sys_exec+0x106>
      return -1;
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801059f8:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
801059fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105a01:	c1 e2 02             	shl    $0x2,%edx
80105a04:	01 c2                	add    %eax,%edx
80105a06:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
80105a0c:	83 ec 08             	sub    $0x8,%esp
80105a0f:	52                   	push   %edx
80105a10:	50                   	push   %eax
80105a11:	e8 1c f1 ff ff       	call   80104b32 <fetchstr>
80105a16:	83 c4 10             	add    $0x10,%esp
80105a19:	85 c0                	test   %eax,%eax
80105a1b:	79 07                	jns    80105a24 <sys_exec+0xfd>
      return -1;
80105a1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a22:	eb 09                	jmp    80105a2d <sys_exec+0x106>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
80105a24:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
80105a28:	e9 5a ff ff ff       	jmp    80105987 <sys_exec+0x60>
  return exec(path, argv);
}
80105a2d:	c9                   	leave  
80105a2e:	c3                   	ret    

80105a2f <sys_pipe>:

int
sys_pipe(void)
{
80105a2f:	55                   	push   %ebp
80105a30:	89 e5                	mov    %esp,%ebp
80105a32:	83 ec 28             	sub    $0x28,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105a35:	83 ec 04             	sub    $0x4,%esp
80105a38:	6a 08                	push   $0x8
80105a3a:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105a3d:	50                   	push   %eax
80105a3e:	6a 00                	push   $0x0
80105a40:	e8 77 f1 ff ff       	call   80104bbc <argptr>
80105a45:	83 c4 10             	add    $0x10,%esp
80105a48:	85 c0                	test   %eax,%eax
80105a4a:	79 0a                	jns    80105a56 <sys_pipe+0x27>
    return -1;
80105a4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a51:	e9 af 00 00 00       	jmp    80105b05 <sys_pipe+0xd6>
  if(pipealloc(&rf, &wf) < 0)
80105a56:	83 ec 08             	sub    $0x8,%esp
80105a59:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105a5c:	50                   	push   %eax
80105a5d:	8d 45 e8             	lea    -0x18(%ebp),%eax
80105a60:	50                   	push   %eax
80105a61:	e8 27 dc ff ff       	call   8010368d <pipealloc>
80105a66:	83 c4 10             	add    $0x10,%esp
80105a69:	85 c0                	test   %eax,%eax
80105a6b:	79 0a                	jns    80105a77 <sys_pipe+0x48>
    return -1;
80105a6d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a72:	e9 8e 00 00 00       	jmp    80105b05 <sys_pipe+0xd6>
  fd0 = -1;
80105a77:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105a7e:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105a81:	83 ec 0c             	sub    $0xc,%esp
80105a84:	50                   	push   %eax
80105a85:	e8 bb f2 ff ff       	call   80104d45 <fdalloc>
80105a8a:	83 c4 10             	add    $0x10,%esp
80105a8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105a90:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105a94:	78 18                	js     80105aae <sys_pipe+0x7f>
80105a96:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105a99:	83 ec 0c             	sub    $0xc,%esp
80105a9c:	50                   	push   %eax
80105a9d:	e8 a3 f2 ff ff       	call   80104d45 <fdalloc>
80105aa2:	83 c4 10             	add    $0x10,%esp
80105aa5:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105aa8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105aac:	79 3f                	jns    80105aed <sys_pipe+0xbe>
    if(fd0 >= 0)
80105aae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105ab2:	78 14                	js     80105ac8 <sys_pipe+0x99>
      proc->ofile[fd0] = 0;
80105ab4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105aba:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105abd:	83 c2 08             	add    $0x8,%edx
80105ac0:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
80105ac7:	00 
    fileclose(rf);
80105ac8:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105acb:	83 ec 0c             	sub    $0xc,%esp
80105ace:	50                   	push   %eax
80105acf:	e8 cc ac ff ff       	call   801007a0 <fileclose>
80105ad4:	83 c4 10             	add    $0x10,%esp
    fileclose(wf);
80105ad7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105ada:	83 ec 0c             	sub    $0xc,%esp
80105add:	50                   	push   %eax
80105ade:	e8 bd ac ff ff       	call   801007a0 <fileclose>
80105ae3:	83 c4 10             	add    $0x10,%esp
    return -1;
80105ae6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105aeb:	eb 18                	jmp    80105b05 <sys_pipe+0xd6>
  }
  fd[0] = fd0;
80105aed:	8b 45 ec             	mov    -0x14(%ebp),%eax
80105af0:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105af3:	89 10                	mov    %edx,(%eax)
  fd[1] = fd1;
80105af5:	8b 45 ec             	mov    -0x14(%ebp),%eax
80105af8:	8d 50 04             	lea    0x4(%eax),%edx
80105afb:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105afe:	89 02                	mov    %eax,(%edx)
  return 0;
80105b00:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105b05:	c9                   	leave  
80105b06:	c3                   	ret    

80105b07 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105b07:	55                   	push   %ebp
80105b08:	89 e5                	mov    %esp,%ebp
80105b0a:	83 ec 08             	sub    $0x8,%esp
  return fork();
80105b0d:	e8 71 e2 ff ff       	call   80103d83 <fork>
}
80105b12:	c9                   	leave  
80105b13:	c3                   	ret    

80105b14 <sys_exit>:

int
sys_exit(void)
{
80105b14:	55                   	push   %ebp
80105b15:	89 e5                	mov    %esp,%ebp
80105b17:	83 ec 08             	sub    $0x8,%esp
  exit();
80105b1a:	e8 d5 e3 ff ff       	call   80103ef4 <exit>
  return 0;  // not reached
80105b1f:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105b24:	c9                   	leave  
80105b25:	c3                   	ret    

80105b26 <sys_wait>:

int
sys_wait(void)
{
80105b26:	55                   	push   %ebp
80105b27:	89 e5                	mov    %esp,%ebp
80105b29:	83 ec 08             	sub    $0x8,%esp
  return wait();
80105b2c:	e8 f1 e4 ff ff       	call   80104022 <wait>
}
80105b31:	c9                   	leave  
80105b32:	c3                   	ret    

80105b33 <sys_kill>:

int
sys_kill(void)
{
80105b33:	55                   	push   %ebp
80105b34:	89 e5                	mov    %esp,%ebp
80105b36:	83 ec 18             	sub    $0x18,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105b39:	83 ec 08             	sub    $0x8,%esp
80105b3c:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b3f:	50                   	push   %eax
80105b40:	6a 00                	push   $0x0
80105b42:	e8 4d f0 ff ff       	call   80104b94 <argint>
80105b47:	83 c4 10             	add    $0x10,%esp
80105b4a:	85 c0                	test   %eax,%eax
80105b4c:	79 07                	jns    80105b55 <sys_kill+0x22>
    return -1;
80105b4e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105b53:	eb 0f                	jmp    80105b64 <sys_kill+0x31>
  return kill(pid);
80105b55:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105b58:	83 ec 0c             	sub    $0xc,%esp
80105b5b:	50                   	push   %eax
80105b5c:	e8 d4 e8 ff ff       	call   80104435 <kill>
80105b61:	83 c4 10             	add    $0x10,%esp
}
80105b64:	c9                   	leave  
80105b65:	c3                   	ret    

80105b66 <sys_getpid>:

int
sys_getpid(void)
{
80105b66:	55                   	push   %ebp
80105b67:	89 e5                	mov    %esp,%ebp
  return proc->pid;
80105b69:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b6f:	8b 40 10             	mov    0x10(%eax),%eax
}
80105b72:	5d                   	pop    %ebp
80105b73:	c3                   	ret    

80105b74 <sys_sbrk>:

int
sys_sbrk(void)
{
80105b74:	55                   	push   %ebp
80105b75:	89 e5                	mov    %esp,%ebp
80105b77:	83 ec 18             	sub    $0x18,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105b7a:	83 ec 08             	sub    $0x8,%esp
80105b7d:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105b80:	50                   	push   %eax
80105b81:	6a 00                	push   $0x0
80105b83:	e8 0c f0 ff ff       	call   80104b94 <argint>
80105b88:	83 c4 10             	add    $0x10,%esp
80105b8b:	85 c0                	test   %eax,%eax
80105b8d:	79 07                	jns    80105b96 <sys_sbrk+0x22>
    return -1;
80105b8f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105b94:	eb 28                	jmp    80105bbe <sys_sbrk+0x4a>
  addr = proc->sz;
80105b96:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b9c:	8b 00                	mov    (%eax),%eax
80105b9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(growproc(n) < 0)
80105ba1:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ba4:	83 ec 0c             	sub    $0xc,%esp
80105ba7:	50                   	push   %eax
80105ba8:	e8 33 e1 ff ff       	call   80103ce0 <growproc>
80105bad:	83 c4 10             	add    $0x10,%esp
80105bb0:	85 c0                	test   %eax,%eax
80105bb2:	79 07                	jns    80105bbb <sys_sbrk+0x47>
    return -1;
80105bb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105bb9:	eb 03                	jmp    80105bbe <sys_sbrk+0x4a>
  return addr;
80105bbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80105bbe:	c9                   	leave  
80105bbf:	c3                   	ret    

80105bc0 <sys_sleep>:

int
sys_sleep(void)
{
80105bc0:	55                   	push   %ebp
80105bc1:	89 e5                	mov    %esp,%ebp
80105bc3:	83 ec 18             	sub    $0x18,%esp
  int n;
  uint ticks0;
  
  if(argint(0, &n) < 0)
80105bc6:	83 ec 08             	sub    $0x8,%esp
80105bc9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105bcc:	50                   	push   %eax
80105bcd:	6a 00                	push   $0x0
80105bcf:	e8 c0 ef ff ff       	call   80104b94 <argint>
80105bd4:	83 c4 10             	add    $0x10,%esp
80105bd7:	85 c0                	test   %eax,%eax
80105bd9:	79 07                	jns    80105be2 <sys_sleep+0x22>
    return -1;
80105bdb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105be0:	eb 77                	jmp    80105c59 <sys_sleep+0x99>
  acquire(&tickslock);
80105be2:	83 ec 0c             	sub    $0xc,%esp
80105be5:	68 e0 2e 11 80       	push   $0x80112ee0
80105bea:	e8 1d ea ff ff       	call   8010460c <acquire>
80105bef:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
80105bf2:	a1 20 37 11 80       	mov    0x80113720,%eax
80105bf7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(ticks - ticks0 < n){
80105bfa:	eb 39                	jmp    80105c35 <sys_sleep+0x75>
    if(proc->killed){
80105bfc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105c02:	8b 40 24             	mov    0x24(%eax),%eax
80105c05:	85 c0                	test   %eax,%eax
80105c07:	74 17                	je     80105c20 <sys_sleep+0x60>
      release(&tickslock);
80105c09:	83 ec 0c             	sub    $0xc,%esp
80105c0c:	68 e0 2e 11 80       	push   $0x80112ee0
80105c11:	e8 5d ea ff ff       	call   80104673 <release>
80105c16:	83 c4 10             	add    $0x10,%esp
      return -1;
80105c19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105c1e:	eb 39                	jmp    80105c59 <sys_sleep+0x99>
    }
    sleep(&ticks, &tickslock);
80105c20:	83 ec 08             	sub    $0x8,%esp
80105c23:	68 e0 2e 11 80       	push   $0x80112ee0
80105c28:	68 20 37 11 80       	push   $0x80113720
80105c2d:	e8 e1 e6 ff ff       	call   80104313 <sleep>
80105c32:	83 c4 10             	add    $0x10,%esp
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105c35:	a1 20 37 11 80       	mov    0x80113720,%eax
80105c3a:	2b 45 f4             	sub    -0xc(%ebp),%eax
80105c3d:	8b 55 f0             	mov    -0x10(%ebp),%edx
80105c40:	39 d0                	cmp    %edx,%eax
80105c42:	72 b8                	jb     80105bfc <sys_sleep+0x3c>
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105c44:	83 ec 0c             	sub    $0xc,%esp
80105c47:	68 e0 2e 11 80       	push   $0x80112ee0
80105c4c:	e8 22 ea ff ff       	call   80104673 <release>
80105c51:	83 c4 10             	add    $0x10,%esp
  return 0;
80105c54:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105c59:	c9                   	leave  
80105c5a:	c3                   	ret    

80105c5b <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105c5b:	55                   	push   %ebp
80105c5c:	89 e5                	mov    %esp,%ebp
80105c5e:	83 ec 18             	sub    $0x18,%esp
  uint xticks;
  
  acquire(&tickslock);
80105c61:	83 ec 0c             	sub    $0xc,%esp
80105c64:	68 e0 2e 11 80       	push   $0x80112ee0
80105c69:	e8 9e e9 ff ff       	call   8010460c <acquire>
80105c6e:	83 c4 10             	add    $0x10,%esp
  xticks = ticks;
80105c71:	a1 20 37 11 80       	mov    0x80113720,%eax
80105c76:	89 45 f4             	mov    %eax,-0xc(%ebp)
  release(&tickslock);
80105c79:	83 ec 0c             	sub    $0xc,%esp
80105c7c:	68 e0 2e 11 80       	push   $0x80112ee0
80105c81:	e8 ed e9 ff ff       	call   80104673 <release>
80105c86:	83 c4 10             	add    $0x10,%esp
  return xticks;
80105c89:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80105c8c:	c9                   	leave  
80105c8d:	c3                   	ret    

80105c8e <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
80105c8e:	55                   	push   %ebp
80105c8f:	89 e5                	mov    %esp,%ebp
80105c91:	83 ec 08             	sub    $0x8,%esp
80105c94:	8b 55 08             	mov    0x8(%ebp),%edx
80105c97:	8b 45 0c             	mov    0xc(%ebp),%eax
80105c9a:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80105c9e:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105ca1:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
80105ca5:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80105ca9:	ee                   	out    %al,(%dx)
}
80105caa:	90                   	nop
80105cab:	c9                   	leave  
80105cac:	c3                   	ret    

80105cad <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
80105cad:	55                   	push   %ebp
80105cae:	89 e5                	mov    %esp,%ebp
80105cb0:	83 ec 08             	sub    $0x8,%esp
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
80105cb3:	6a 34                	push   $0x34
80105cb5:	6a 43                	push   $0x43
80105cb7:	e8 d2 ff ff ff       	call   80105c8e <outb>
80105cbc:	83 c4 08             	add    $0x8,%esp
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
80105cbf:	68 9c 00 00 00       	push   $0x9c
80105cc4:	6a 40                	push   $0x40
80105cc6:	e8 c3 ff ff ff       	call   80105c8e <outb>
80105ccb:	83 c4 08             	add    $0x8,%esp
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
80105cce:	6a 2e                	push   $0x2e
80105cd0:	6a 40                	push   $0x40
80105cd2:	e8 b7 ff ff ff       	call   80105c8e <outb>
80105cd7:	83 c4 08             	add    $0x8,%esp
  picenable(IRQ_TIMER);
80105cda:	83 ec 0c             	sub    $0xc,%esp
80105cdd:	6a 00                	push   $0x0
80105cdf:	e8 93 d8 ff ff       	call   80103577 <picenable>
80105ce4:	83 c4 10             	add    $0x10,%esp
}
80105ce7:	90                   	nop
80105ce8:	c9                   	leave  
80105ce9:	c3                   	ret    

80105cea <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80105cea:	1e                   	push   %ds
  pushl %es
80105ceb:	06                   	push   %es
  pushl %fs
80105cec:	0f a0                	push   %fs
  pushl %gs
80105cee:	0f a8                	push   %gs
  pushal
80105cf0:	60                   	pusha  
  
  # Set up data and per-cpu segments.
  movw $(SEG_KDATA<<3), %ax
80105cf1:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105cf5:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80105cf7:	8e c0                	mov    %eax,%es
  movw $(SEG_KCPU<<3), %ax
80105cf9:	66 b8 18 00          	mov    $0x18,%ax
  movw %ax, %fs
80105cfd:	8e e0                	mov    %eax,%fs
  movw %ax, %gs
80105cff:	8e e8                	mov    %eax,%gs

  # Call trap(tf), where tf=%esp
  pushl %esp
80105d01:	54                   	push   %esp
  call trap
80105d02:	e8 d7 01 00 00       	call   80105ede <trap>
  addl $4, %esp
80105d07:	83 c4 04             	add    $0x4,%esp

80105d0a <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105d0a:	61                   	popa   
  popl %gs
80105d0b:	0f a9                	pop    %gs
  popl %fs
80105d0d:	0f a1                	pop    %fs
  popl %es
80105d0f:	07                   	pop    %es
  popl %ds
80105d10:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105d11:	83 c4 08             	add    $0x8,%esp
  iret
80105d14:	cf                   	iret   

80105d15 <lidt>:

struct gatedesc;

static inline void
lidt(struct gatedesc *p, int size)
{
80105d15:	55                   	push   %ebp
80105d16:	89 e5                	mov    %esp,%ebp
80105d18:	83 ec 10             	sub    $0x10,%esp
  volatile ushort pd[3];

  pd[0] = size-1;
80105d1b:	8b 45 0c             	mov    0xc(%ebp),%eax
80105d1e:	83 e8 01             	sub    $0x1,%eax
80105d21:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105d25:	8b 45 08             	mov    0x8(%ebp),%eax
80105d28:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105d2c:	8b 45 08             	mov    0x8(%ebp),%eax
80105d2f:	c1 e8 10             	shr    $0x10,%eax
80105d32:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
80105d36:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105d39:	0f 01 18             	lidtl  (%eax)
}
80105d3c:	90                   	nop
80105d3d:	c9                   	leave  
80105d3e:	c3                   	ret    

80105d3f <rcr2>:
  return result;
}

static inline uint
rcr2(void)
{
80105d3f:	55                   	push   %ebp
80105d40:	89 e5                	mov    %esp,%ebp
80105d42:	83 ec 10             	sub    $0x10,%esp
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105d45:	0f 20 d0             	mov    %cr2,%eax
80105d48:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return val;
80105d4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80105d4e:	c9                   	leave  
80105d4f:	c3                   	ret    

80105d50 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105d50:	55                   	push   %ebp
80105d51:	89 e5                	mov    %esp,%ebp
80105d53:	83 ec 18             	sub    $0x18,%esp
  int i;

  for(i = 0; i < 256; i++)
80105d56:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80105d5d:	e9 c3 00 00 00       	jmp    80105e25 <tvinit+0xd5>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105d62:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d65:	8b 04 85 9c c0 10 80 	mov    -0x7fef3f64(,%eax,4),%eax
80105d6c:	89 c2                	mov    %eax,%edx
80105d6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d71:	66 89 14 c5 20 2f 11 	mov    %dx,-0x7feed0e0(,%eax,8)
80105d78:	80 
80105d79:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d7c:	66 c7 04 c5 22 2f 11 	movw   $0x8,-0x7feed0de(,%eax,8)
80105d83:	80 08 00 
80105d86:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d89:	0f b6 14 c5 24 2f 11 	movzbl -0x7feed0dc(,%eax,8),%edx
80105d90:	80 
80105d91:	83 e2 e0             	and    $0xffffffe0,%edx
80105d94:	88 14 c5 24 2f 11 80 	mov    %dl,-0x7feed0dc(,%eax,8)
80105d9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d9e:	0f b6 14 c5 24 2f 11 	movzbl -0x7feed0dc(,%eax,8),%edx
80105da5:	80 
80105da6:	83 e2 1f             	and    $0x1f,%edx
80105da9:	88 14 c5 24 2f 11 80 	mov    %dl,-0x7feed0dc(,%eax,8)
80105db0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105db3:	0f b6 14 c5 25 2f 11 	movzbl -0x7feed0db(,%eax,8),%edx
80105dba:	80 
80105dbb:	83 e2 f0             	and    $0xfffffff0,%edx
80105dbe:	83 ca 0e             	or     $0xe,%edx
80105dc1:	88 14 c5 25 2f 11 80 	mov    %dl,-0x7feed0db(,%eax,8)
80105dc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105dcb:	0f b6 14 c5 25 2f 11 	movzbl -0x7feed0db(,%eax,8),%edx
80105dd2:	80 
80105dd3:	83 e2 ef             	and    $0xffffffef,%edx
80105dd6:	88 14 c5 25 2f 11 80 	mov    %dl,-0x7feed0db(,%eax,8)
80105ddd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105de0:	0f b6 14 c5 25 2f 11 	movzbl -0x7feed0db(,%eax,8),%edx
80105de7:	80 
80105de8:	83 e2 9f             	and    $0xffffff9f,%edx
80105deb:	88 14 c5 25 2f 11 80 	mov    %dl,-0x7feed0db(,%eax,8)
80105df2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105df5:	0f b6 14 c5 25 2f 11 	movzbl -0x7feed0db(,%eax,8),%edx
80105dfc:	80 
80105dfd:	83 ca 80             	or     $0xffffff80,%edx
80105e00:	88 14 c5 25 2f 11 80 	mov    %dl,-0x7feed0db(,%eax,8)
80105e07:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105e0a:	8b 04 85 9c c0 10 80 	mov    -0x7fef3f64(,%eax,4),%eax
80105e11:	c1 e8 10             	shr    $0x10,%eax
80105e14:	89 c2                	mov    %eax,%edx
80105e16:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105e19:	66 89 14 c5 26 2f 11 	mov    %dx,-0x7feed0da(,%eax,8)
80105e20:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105e21:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80105e25:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
80105e2c:	0f 8e 30 ff ff ff    	jle    80105d62 <tvinit+0x12>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105e32:	a1 9c c1 10 80       	mov    0x8010c19c,%eax
80105e37:	66 a3 20 31 11 80    	mov    %ax,0x80113120
80105e3d:	66 c7 05 22 31 11 80 	movw   $0x8,0x80113122
80105e44:	08 00 
80105e46:	0f b6 05 24 31 11 80 	movzbl 0x80113124,%eax
80105e4d:	83 e0 e0             	and    $0xffffffe0,%eax
80105e50:	a2 24 31 11 80       	mov    %al,0x80113124
80105e55:	0f b6 05 24 31 11 80 	movzbl 0x80113124,%eax
80105e5c:	83 e0 1f             	and    $0x1f,%eax
80105e5f:	a2 24 31 11 80       	mov    %al,0x80113124
80105e64:	0f b6 05 25 31 11 80 	movzbl 0x80113125,%eax
80105e6b:	83 c8 0f             	or     $0xf,%eax
80105e6e:	a2 25 31 11 80       	mov    %al,0x80113125
80105e73:	0f b6 05 25 31 11 80 	movzbl 0x80113125,%eax
80105e7a:	83 e0 ef             	and    $0xffffffef,%eax
80105e7d:	a2 25 31 11 80       	mov    %al,0x80113125
80105e82:	0f b6 05 25 31 11 80 	movzbl 0x80113125,%eax
80105e89:	83 c8 60             	or     $0x60,%eax
80105e8c:	a2 25 31 11 80       	mov    %al,0x80113125
80105e91:	0f b6 05 25 31 11 80 	movzbl 0x80113125,%eax
80105e98:	83 c8 80             	or     $0xffffff80,%eax
80105e9b:	a2 25 31 11 80       	mov    %al,0x80113125
80105ea0:	a1 9c c1 10 80       	mov    0x8010c19c,%eax
80105ea5:	c1 e8 10             	shr    $0x10,%eax
80105ea8:	66 a3 26 31 11 80    	mov    %ax,0x80113126
  
  initlock(&tickslock, "time");
80105eae:	83 ec 08             	sub    $0x8,%esp
80105eb1:	68 64 9c 10 80       	push   $0x80109c64
80105eb6:	68 e0 2e 11 80       	push   $0x80112ee0
80105ebb:	e8 2a e7 ff ff       	call   801045ea <initlock>
80105ec0:	83 c4 10             	add    $0x10,%esp
}
80105ec3:	90                   	nop
80105ec4:	c9                   	leave  
80105ec5:	c3                   	ret    

80105ec6 <idtinit>:

void
idtinit(void)
{
80105ec6:	55                   	push   %ebp
80105ec7:	89 e5                	mov    %esp,%ebp
  lidt(idt, sizeof(idt));
80105ec9:	68 00 08 00 00       	push   $0x800
80105ece:	68 20 2f 11 80       	push   $0x80112f20
80105ed3:	e8 3d fe ff ff       	call   80105d15 <lidt>
80105ed8:	83 c4 08             	add    $0x8,%esp
}
80105edb:	90                   	nop
80105edc:	c9                   	leave  
80105edd:	c3                   	ret    

80105ede <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105ede:	55                   	push   %ebp
80105edf:	89 e5                	mov    %esp,%ebp
80105ee1:	57                   	push   %edi
80105ee2:	56                   	push   %esi
80105ee3:	53                   	push   %ebx
80105ee4:	83 ec 1c             	sub    $0x1c,%esp
  if(tf->trapno == T_SYSCALL){
80105ee7:	8b 45 08             	mov    0x8(%ebp),%eax
80105eea:	8b 40 30             	mov    0x30(%eax),%eax
80105eed:	83 f8 40             	cmp    $0x40,%eax
80105ef0:	75 3e                	jne    80105f30 <trap+0x52>
    if(proc->killed)
80105ef2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105ef8:	8b 40 24             	mov    0x24(%eax),%eax
80105efb:	85 c0                	test   %eax,%eax
80105efd:	74 05                	je     80105f04 <trap+0x26>
      exit();
80105eff:	e8 f0 df ff ff       	call   80103ef4 <exit>
    proc->tf = tf;
80105f04:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105f0a:	8b 55 08             	mov    0x8(%ebp),%edx
80105f0d:	89 50 18             	mov    %edx,0x18(%eax)
    syscall();
80105f10:	e8 35 ed ff ff       	call   80104c4a <syscall>
    if(proc->killed)
80105f15:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105f1b:	8b 40 24             	mov    0x24(%eax),%eax
80105f1e:	85 c0                	test   %eax,%eax
80105f20:	0f 84 1b 02 00 00    	je     80106141 <trap+0x263>
      exit();
80105f26:	e8 c9 df ff ff       	call   80103ef4 <exit>
    return;
80105f2b:	e9 11 02 00 00       	jmp    80106141 <trap+0x263>
  }

  switch(tf->trapno){
80105f30:	8b 45 08             	mov    0x8(%ebp),%eax
80105f33:	8b 40 30             	mov    0x30(%eax),%eax
80105f36:	83 e8 20             	sub    $0x20,%eax
80105f39:	83 f8 1f             	cmp    $0x1f,%eax
80105f3c:	0f 87 c0 00 00 00    	ja     80106002 <trap+0x124>
80105f42:	8b 04 85 0c 9d 10 80 	mov    -0x7fef62f4(,%eax,4),%eax
80105f49:	ff e0                	jmp    *%eax
  case T_IRQ0 + IRQ_TIMER:
    if(cpu->id == 0){
80105f4b:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80105f51:	0f b6 00             	movzbl (%eax),%eax
80105f54:	84 c0                	test   %al,%al
80105f56:	75 3d                	jne    80105f95 <trap+0xb7>
      acquire(&tickslock);
80105f58:	83 ec 0c             	sub    $0xc,%esp
80105f5b:	68 e0 2e 11 80       	push   $0x80112ee0
80105f60:	e8 a7 e6 ff ff       	call   8010460c <acquire>
80105f65:	83 c4 10             	add    $0x10,%esp
      ticks++;
80105f68:	a1 20 37 11 80       	mov    0x80113720,%eax
80105f6d:	83 c0 01             	add    $0x1,%eax
80105f70:	a3 20 37 11 80       	mov    %eax,0x80113720
      wakeup(&ticks);
80105f75:	83 ec 0c             	sub    $0xc,%esp
80105f78:	68 20 37 11 80       	push   $0x80113720
80105f7d:	e8 7c e4 ff ff       	call   801043fe <wakeup>
80105f82:	83 c4 10             	add    $0x10,%esp
      release(&tickslock);
80105f85:	83 ec 0c             	sub    $0xc,%esp
80105f88:	68 e0 2e 11 80       	push   $0x80112ee0
80105f8d:	e8 e1 e6 ff ff       	call   80104673 <release>
80105f92:	83 c4 10             	add    $0x10,%esp
    }
    lapiceoi();
80105f95:	e8 12 ca ff ff       	call   801029ac <lapiceoi>
    break;
80105f9a:	e9 1c 01 00 00       	jmp    801060bb <trap+0x1dd>
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105f9f:	e8 38 c2 ff ff       	call   801021dc <ideintr>
    lapiceoi();
80105fa4:	e8 03 ca ff ff       	call   801029ac <lapiceoi>
    break;
80105fa9:	e9 0d 01 00 00       	jmp    801060bb <trap+0x1dd>
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105fae:	e8 18 c8 ff ff       	call   801027cb <kbdintr>
    lapiceoi();
80105fb3:	e8 f4 c9 ff ff       	call   801029ac <lapiceoi>
    break;
80105fb8:	e9 fe 00 00 00       	jmp    801060bb <trap+0x1dd>
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105fbd:	e8 60 03 00 00       	call   80106322 <uartintr>
    lapiceoi();
80105fc2:	e8 e5 c9 ff ff       	call   801029ac <lapiceoi>
    break;
80105fc7:	e9 ef 00 00 00       	jmp    801060bb <trap+0x1dd>
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105fcc:	8b 45 08             	mov    0x8(%ebp),%eax
80105fcf:	8b 48 38             	mov    0x38(%eax),%ecx
            cpu->id, tf->cs, tf->eip);
80105fd2:	8b 45 08             	mov    0x8(%ebp),%eax
80105fd5:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105fd9:	0f b7 d0             	movzwl %ax,%edx
            cpu->id, tf->cs, tf->eip);
80105fdc:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80105fe2:	0f b6 00             	movzbl (%eax),%eax
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105fe5:	0f b6 c0             	movzbl %al,%eax
80105fe8:	51                   	push   %ecx
80105fe9:	52                   	push   %edx
80105fea:	50                   	push   %eax
80105feb:	68 6c 9c 10 80       	push   $0x80109c6c
80105ff0:	e8 b0 23 00 00       	call   801083a5 <cprintf>
80105ff5:	83 c4 10             	add    $0x10,%esp
            cpu->id, tf->cs, tf->eip);
    lapiceoi();
80105ff8:	e8 af c9 ff ff       	call   801029ac <lapiceoi>
    break;
80105ffd:	e9 b9 00 00 00       	jmp    801060bb <trap+0x1dd>
   
  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
80106002:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106008:	85 c0                	test   %eax,%eax
8010600a:	74 11                	je     8010601d <trap+0x13f>
8010600c:	8b 45 08             	mov    0x8(%ebp),%eax
8010600f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
80106013:	0f b7 c0             	movzwl %ax,%eax
80106016:	83 e0 03             	and    $0x3,%eax
80106019:	85 c0                	test   %eax,%eax
8010601b:	75 40                	jne    8010605d <trap+0x17f>
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
8010601d:	e8 1d fd ff ff       	call   80105d3f <rcr2>
80106022:	89 c3                	mov    %eax,%ebx
80106024:	8b 45 08             	mov    0x8(%ebp),%eax
80106027:	8b 48 38             	mov    0x38(%eax),%ecx
              tf->trapno, cpu->id, tf->eip, rcr2());
8010602a:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106030:	0f b6 00             	movzbl (%eax),%eax
   
  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80106033:	0f b6 d0             	movzbl %al,%edx
80106036:	8b 45 08             	mov    0x8(%ebp),%eax
80106039:	8b 40 30             	mov    0x30(%eax),%eax
8010603c:	83 ec 0c             	sub    $0xc,%esp
8010603f:	53                   	push   %ebx
80106040:	51                   	push   %ecx
80106041:	52                   	push   %edx
80106042:	50                   	push   %eax
80106043:	68 90 9c 10 80       	push   $0x80109c90
80106048:	e8 58 23 00 00       	call   801083a5 <cprintf>
8010604d:	83 c4 20             	add    $0x20,%esp
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
80106050:	83 ec 0c             	sub    $0xc,%esp
80106053:	68 c2 9c 10 80       	push   $0x80109cc2
80106058:	e8 f2 26 00 00       	call   8010874f <panic>
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010605d:	e8 dd fc ff ff       	call   80105d3f <rcr2>
80106062:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106065:	8b 45 08             	mov    0x8(%ebp),%eax
80106068:	8b 70 38             	mov    0x38(%eax),%esi
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
8010606b:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106071:	0f b6 00             	movzbl (%eax),%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80106074:	0f b6 d8             	movzbl %al,%ebx
80106077:	8b 45 08             	mov    0x8(%ebp),%eax
8010607a:	8b 48 34             	mov    0x34(%eax),%ecx
8010607d:	8b 45 08             	mov    0x8(%ebp),%eax
80106080:	8b 50 30             	mov    0x30(%eax),%edx
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
80106083:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106089:	8d 78 6c             	lea    0x6c(%eax),%edi
8010608c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80106092:	8b 40 10             	mov    0x10(%eax),%eax
80106095:	ff 75 e4             	pushl  -0x1c(%ebp)
80106098:	56                   	push   %esi
80106099:	53                   	push   %ebx
8010609a:	51                   	push   %ecx
8010609b:	52                   	push   %edx
8010609c:	57                   	push   %edi
8010609d:	50                   	push   %eax
8010609e:	68 c8 9c 10 80       	push   $0x80109cc8
801060a3:	e8 fd 22 00 00       	call   801083a5 <cprintf>
801060a8:	83 c4 20             	add    $0x20,%esp
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
            rcr2());
    proc->killed = 1;
801060ab:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801060b1:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
801060b8:	eb 01                	jmp    801060bb <trap+0x1dd>
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
801060ba:	90                   	nop
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running 
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801060bb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801060c1:	85 c0                	test   %eax,%eax
801060c3:	74 24                	je     801060e9 <trap+0x20b>
801060c5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801060cb:	8b 40 24             	mov    0x24(%eax),%eax
801060ce:	85 c0                	test   %eax,%eax
801060d0:	74 17                	je     801060e9 <trap+0x20b>
801060d2:	8b 45 08             	mov    0x8(%ebp),%eax
801060d5:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
801060d9:	0f b7 c0             	movzwl %ax,%eax
801060dc:	83 e0 03             	and    $0x3,%eax
801060df:	83 f8 03             	cmp    $0x3,%eax
801060e2:	75 05                	jne    801060e9 <trap+0x20b>
    exit();
801060e4:	e8 0b de ff ff       	call   80103ef4 <exit>

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
801060e9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801060ef:	85 c0                	test   %eax,%eax
801060f1:	74 1e                	je     80106111 <trap+0x233>
801060f3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801060f9:	8b 40 0c             	mov    0xc(%eax),%eax
801060fc:	83 f8 04             	cmp    $0x4,%eax
801060ff:	75 10                	jne    80106111 <trap+0x233>
80106101:	8b 45 08             	mov    0x8(%ebp),%eax
80106104:	8b 40 30             	mov    0x30(%eax),%eax
80106107:	83 f8 20             	cmp    $0x20,%eax
8010610a:	75 05                	jne    80106111 <trap+0x233>
    yield();
8010610c:	e8 96 e1 ff ff       	call   801042a7 <yield>

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80106111:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106117:	85 c0                	test   %eax,%eax
80106119:	74 27                	je     80106142 <trap+0x264>
8010611b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106121:	8b 40 24             	mov    0x24(%eax),%eax
80106124:	85 c0                	test   %eax,%eax
80106126:	74 1a                	je     80106142 <trap+0x264>
80106128:	8b 45 08             	mov    0x8(%ebp),%eax
8010612b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
8010612f:	0f b7 c0             	movzwl %ax,%eax
80106132:	83 e0 03             	and    $0x3,%eax
80106135:	83 f8 03             	cmp    $0x3,%eax
80106138:	75 08                	jne    80106142 <trap+0x264>
    exit();
8010613a:	e8 b5 dd ff ff       	call   80103ef4 <exit>
8010613f:	eb 01                	jmp    80106142 <trap+0x264>
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
    return;
80106141:	90                   	nop
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80106142:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106145:	5b                   	pop    %ebx
80106146:	5e                   	pop    %esi
80106147:	5f                   	pop    %edi
80106148:	5d                   	pop    %ebp
80106149:	c3                   	ret    

8010614a <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
8010614a:	55                   	push   %ebp
8010614b:	89 e5                	mov    %esp,%ebp
8010614d:	83 ec 14             	sub    $0x14,%esp
80106150:	8b 45 08             	mov    0x8(%ebp),%eax
80106153:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80106157:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
8010615b:	89 c2                	mov    %eax,%edx
8010615d:	ec                   	in     (%dx),%al
8010615e:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
80106161:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
80106165:	c9                   	leave  
80106166:	c3                   	ret    

80106167 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
80106167:	55                   	push   %ebp
80106168:	89 e5                	mov    %esp,%ebp
8010616a:	83 ec 08             	sub    $0x8,%esp
8010616d:	8b 55 08             	mov    0x8(%ebp),%edx
80106170:	8b 45 0c             	mov    0xc(%ebp),%eax
80106173:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80106177:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010617a:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
8010617e:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80106182:	ee                   	out    %al,(%dx)
}
80106183:	90                   	nop
80106184:	c9                   	leave  
80106185:	c3                   	ret    

80106186 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80106186:	55                   	push   %ebp
80106187:	89 e5                	mov    %esp,%ebp
80106189:	83 ec 18             	sub    $0x18,%esp
  char *p;

  // Turn off the FIFO
  outb(COM1+2, 0);
8010618c:	6a 00                	push   $0x0
8010618e:	68 fa 03 00 00       	push   $0x3fa
80106193:	e8 cf ff ff ff       	call   80106167 <outb>
80106198:	83 c4 08             	add    $0x8,%esp
  
  // 9600 baud, 8 data bits, 1 stop bit, parity off.
  outb(COM1+3, 0x80);    // Unlock divisor
8010619b:	68 80 00 00 00       	push   $0x80
801061a0:	68 fb 03 00 00       	push   $0x3fb
801061a5:	e8 bd ff ff ff       	call   80106167 <outb>
801061aa:	83 c4 08             	add    $0x8,%esp
  outb(COM1+0, 115200/9600);
801061ad:	6a 0c                	push   $0xc
801061af:	68 f8 03 00 00       	push   $0x3f8
801061b4:	e8 ae ff ff ff       	call   80106167 <outb>
801061b9:	83 c4 08             	add    $0x8,%esp
  outb(COM1+1, 0);
801061bc:	6a 00                	push   $0x0
801061be:	68 f9 03 00 00       	push   $0x3f9
801061c3:	e8 9f ff ff ff       	call   80106167 <outb>
801061c8:	83 c4 08             	add    $0x8,%esp
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
801061cb:	6a 03                	push   $0x3
801061cd:	68 fb 03 00 00       	push   $0x3fb
801061d2:	e8 90 ff ff ff       	call   80106167 <outb>
801061d7:	83 c4 08             	add    $0x8,%esp
  outb(COM1+4, 0);
801061da:	6a 00                	push   $0x0
801061dc:	68 fc 03 00 00       	push   $0x3fc
801061e1:	e8 81 ff ff ff       	call   80106167 <outb>
801061e6:	83 c4 08             	add    $0x8,%esp
  outb(COM1+1, 0x01);    // Enable receive interrupts.
801061e9:	6a 01                	push   $0x1
801061eb:	68 f9 03 00 00       	push   $0x3f9
801061f0:	e8 72 ff ff ff       	call   80106167 <outb>
801061f5:	83 c4 08             	add    $0x8,%esp

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
801061f8:	68 fd 03 00 00       	push   $0x3fd
801061fd:	e8 48 ff ff ff       	call   8010614a <inb>
80106202:	83 c4 04             	add    $0x4,%esp
80106205:	3c ff                	cmp    $0xff,%al
80106207:	74 6e                	je     80106277 <uartinit+0xf1>
    return;
  uart = 1;
80106209:	c7 05 0c c7 10 80 01 	movl   $0x1,0x8010c70c
80106210:	00 00 00 

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
80106213:	68 fa 03 00 00       	push   $0x3fa
80106218:	e8 2d ff ff ff       	call   8010614a <inb>
8010621d:	83 c4 04             	add    $0x4,%esp
  inb(COM1+0);
80106220:	68 f8 03 00 00       	push   $0x3f8
80106225:	e8 20 ff ff ff       	call   8010614a <inb>
8010622a:	83 c4 04             	add    $0x4,%esp
  picenable(IRQ_COM1);
8010622d:	83 ec 0c             	sub    $0xc,%esp
80106230:	6a 04                	push   $0x4
80106232:	e8 40 d3 ff ff       	call   80103577 <picenable>
80106237:	83 c4 10             	add    $0x10,%esp
  ioapicenable(IRQ_COM1, 0);
8010623a:	83 ec 08             	sub    $0x8,%esp
8010623d:	6a 00                	push   $0x0
8010623f:	6a 04                	push   $0x4
80106241:	e8 38 c2 ff ff       	call   8010247e <ioapicenable>
80106246:	83 c4 10             	add    $0x10,%esp
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80106249:	c7 45 f4 8c 9d 10 80 	movl   $0x80109d8c,-0xc(%ebp)
80106250:	eb 19                	jmp    8010626b <uartinit+0xe5>
    uartputc(*p);
80106252:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106255:	0f b6 00             	movzbl (%eax),%eax
80106258:	0f be c0             	movsbl %al,%eax
8010625b:	83 ec 0c             	sub    $0xc,%esp
8010625e:	50                   	push   %eax
8010625f:	e8 16 00 00 00       	call   8010627a <uartputc>
80106264:	83 c4 10             	add    $0x10,%esp
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80106267:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
8010626b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010626e:	0f b6 00             	movzbl (%eax),%eax
80106271:	84 c0                	test   %al,%al
80106273:	75 dd                	jne    80106252 <uartinit+0xcc>
80106275:	eb 01                	jmp    80106278 <uartinit+0xf2>
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
    return;
80106277:	90                   	nop
  ioapicenable(IRQ_COM1, 0);
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}
80106278:	c9                   	leave  
80106279:	c3                   	ret    

8010627a <uartputc>:

void
uartputc(int c)
{
8010627a:	55                   	push   %ebp
8010627b:	89 e5                	mov    %esp,%ebp
8010627d:	83 ec 18             	sub    $0x18,%esp
  int i;

  if(!uart)
80106280:	a1 0c c7 10 80       	mov    0x8010c70c,%eax
80106285:	85 c0                	test   %eax,%eax
80106287:	74 53                	je     801062dc <uartputc+0x62>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80106289:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80106290:	eb 11                	jmp    801062a3 <uartputc+0x29>
    microdelay(10);
80106292:	83 ec 0c             	sub    $0xc,%esp
80106295:	6a 0a                	push   $0xa
80106297:	e8 2b c7 ff ff       	call   801029c7 <microdelay>
8010629c:	83 c4 10             	add    $0x10,%esp
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
8010629f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801062a3:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%ebp)
801062a7:	7f 1a                	jg     801062c3 <uartputc+0x49>
801062a9:	83 ec 0c             	sub    $0xc,%esp
801062ac:	68 fd 03 00 00       	push   $0x3fd
801062b1:	e8 94 fe ff ff       	call   8010614a <inb>
801062b6:	83 c4 10             	add    $0x10,%esp
801062b9:	0f b6 c0             	movzbl %al,%eax
801062bc:	83 e0 20             	and    $0x20,%eax
801062bf:	85 c0                	test   %eax,%eax
801062c1:	74 cf                	je     80106292 <uartputc+0x18>
    microdelay(10);
  outb(COM1+0, c);
801062c3:	8b 45 08             	mov    0x8(%ebp),%eax
801062c6:	0f b6 c0             	movzbl %al,%eax
801062c9:	83 ec 08             	sub    $0x8,%esp
801062cc:	50                   	push   %eax
801062cd:	68 f8 03 00 00       	push   $0x3f8
801062d2:	e8 90 fe ff ff       	call   80106167 <outb>
801062d7:	83 c4 10             	add    $0x10,%esp
801062da:	eb 01                	jmp    801062dd <uartputc+0x63>
uartputc(int c)
{
  int i;

  if(!uart)
    return;
801062dc:	90                   	nop
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
801062dd:	c9                   	leave  
801062de:	c3                   	ret    

801062df <uartgetc>:

static int
uartgetc(void)
{
801062df:	55                   	push   %ebp
801062e0:	89 e5                	mov    %esp,%ebp
  if(!uart)
801062e2:	a1 0c c7 10 80       	mov    0x8010c70c,%eax
801062e7:	85 c0                	test   %eax,%eax
801062e9:	75 07                	jne    801062f2 <uartgetc+0x13>
    return -1;
801062eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801062f0:	eb 2e                	jmp    80106320 <uartgetc+0x41>
  if(!(inb(COM1+5) & 0x01))
801062f2:	68 fd 03 00 00       	push   $0x3fd
801062f7:	e8 4e fe ff ff       	call   8010614a <inb>
801062fc:	83 c4 04             	add    $0x4,%esp
801062ff:	0f b6 c0             	movzbl %al,%eax
80106302:	83 e0 01             	and    $0x1,%eax
80106305:	85 c0                	test   %eax,%eax
80106307:	75 07                	jne    80106310 <uartgetc+0x31>
    return -1;
80106309:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010630e:	eb 10                	jmp    80106320 <uartgetc+0x41>
  return inb(COM1+0);
80106310:	68 f8 03 00 00       	push   $0x3f8
80106315:	e8 30 fe ff ff       	call   8010614a <inb>
8010631a:	83 c4 04             	add    $0x4,%esp
8010631d:	0f b6 c0             	movzbl %al,%eax
}
80106320:	c9                   	leave  
80106321:	c3                   	ret    

80106322 <uartintr>:

void
uartintr(void)
{
80106322:	55                   	push   %ebp
80106323:	89 e5                	mov    %esp,%ebp
80106325:	83 ec 08             	sub    $0x8,%esp
  consoleintr(uartgetc);
80106328:	83 ec 0c             	sub    $0xc,%esp
8010632b:	68 df 62 10 80       	push   $0x801062df
80106330:	e8 67 2b 00 00       	call   80108e9c <consoleintr>
80106335:	83 c4 10             	add    $0x10,%esp
}
80106338:	90                   	nop
80106339:	c9                   	leave  
8010633a:	c3                   	ret    

8010633b <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
8010633b:	6a 00                	push   $0x0
  pushl $0
8010633d:	6a 00                	push   $0x0
  jmp alltraps
8010633f:	e9 a6 f9 ff ff       	jmp    80105cea <alltraps>

80106344 <vector1>:
.globl vector1
vector1:
  pushl $0
80106344:	6a 00                	push   $0x0
  pushl $1
80106346:	6a 01                	push   $0x1
  jmp alltraps
80106348:	e9 9d f9 ff ff       	jmp    80105cea <alltraps>

8010634d <vector2>:
.globl vector2
vector2:
  pushl $0
8010634d:	6a 00                	push   $0x0
  pushl $2
8010634f:	6a 02                	push   $0x2
  jmp alltraps
80106351:	e9 94 f9 ff ff       	jmp    80105cea <alltraps>

80106356 <vector3>:
.globl vector3
vector3:
  pushl $0
80106356:	6a 00                	push   $0x0
  pushl $3
80106358:	6a 03                	push   $0x3
  jmp alltraps
8010635a:	e9 8b f9 ff ff       	jmp    80105cea <alltraps>

8010635f <vector4>:
.globl vector4
vector4:
  pushl $0
8010635f:	6a 00                	push   $0x0
  pushl $4
80106361:	6a 04                	push   $0x4
  jmp alltraps
80106363:	e9 82 f9 ff ff       	jmp    80105cea <alltraps>

80106368 <vector5>:
.globl vector5
vector5:
  pushl $0
80106368:	6a 00                	push   $0x0
  pushl $5
8010636a:	6a 05                	push   $0x5
  jmp alltraps
8010636c:	e9 79 f9 ff ff       	jmp    80105cea <alltraps>

80106371 <vector6>:
.globl vector6
vector6:
  pushl $0
80106371:	6a 00                	push   $0x0
  pushl $6
80106373:	6a 06                	push   $0x6
  jmp alltraps
80106375:	e9 70 f9 ff ff       	jmp    80105cea <alltraps>

8010637a <vector7>:
.globl vector7
vector7:
  pushl $0
8010637a:	6a 00                	push   $0x0
  pushl $7
8010637c:	6a 07                	push   $0x7
  jmp alltraps
8010637e:	e9 67 f9 ff ff       	jmp    80105cea <alltraps>

80106383 <vector8>:
.globl vector8
vector8:
  pushl $8
80106383:	6a 08                	push   $0x8
  jmp alltraps
80106385:	e9 60 f9 ff ff       	jmp    80105cea <alltraps>

8010638a <vector9>:
.globl vector9
vector9:
  pushl $0
8010638a:	6a 00                	push   $0x0
  pushl $9
8010638c:	6a 09                	push   $0x9
  jmp alltraps
8010638e:	e9 57 f9 ff ff       	jmp    80105cea <alltraps>

80106393 <vector10>:
.globl vector10
vector10:
  pushl $10
80106393:	6a 0a                	push   $0xa
  jmp alltraps
80106395:	e9 50 f9 ff ff       	jmp    80105cea <alltraps>

8010639a <vector11>:
.globl vector11
vector11:
  pushl $11
8010639a:	6a 0b                	push   $0xb
  jmp alltraps
8010639c:	e9 49 f9 ff ff       	jmp    80105cea <alltraps>

801063a1 <vector12>:
.globl vector12
vector12:
  pushl $12
801063a1:	6a 0c                	push   $0xc
  jmp alltraps
801063a3:	e9 42 f9 ff ff       	jmp    80105cea <alltraps>

801063a8 <vector13>:
.globl vector13
vector13:
  pushl $13
801063a8:	6a 0d                	push   $0xd
  jmp alltraps
801063aa:	e9 3b f9 ff ff       	jmp    80105cea <alltraps>

801063af <vector14>:
.globl vector14
vector14:
  pushl $14
801063af:	6a 0e                	push   $0xe
  jmp alltraps
801063b1:	e9 34 f9 ff ff       	jmp    80105cea <alltraps>

801063b6 <vector15>:
.globl vector15
vector15:
  pushl $0
801063b6:	6a 00                	push   $0x0
  pushl $15
801063b8:	6a 0f                	push   $0xf
  jmp alltraps
801063ba:	e9 2b f9 ff ff       	jmp    80105cea <alltraps>

801063bf <vector16>:
.globl vector16
vector16:
  pushl $0
801063bf:	6a 00                	push   $0x0
  pushl $16
801063c1:	6a 10                	push   $0x10
  jmp alltraps
801063c3:	e9 22 f9 ff ff       	jmp    80105cea <alltraps>

801063c8 <vector17>:
.globl vector17
vector17:
  pushl $17
801063c8:	6a 11                	push   $0x11
  jmp alltraps
801063ca:	e9 1b f9 ff ff       	jmp    80105cea <alltraps>

801063cf <vector18>:
.globl vector18
vector18:
  pushl $0
801063cf:	6a 00                	push   $0x0
  pushl $18
801063d1:	6a 12                	push   $0x12
  jmp alltraps
801063d3:	e9 12 f9 ff ff       	jmp    80105cea <alltraps>

801063d8 <vector19>:
.globl vector19
vector19:
  pushl $0
801063d8:	6a 00                	push   $0x0
  pushl $19
801063da:	6a 13                	push   $0x13
  jmp alltraps
801063dc:	e9 09 f9 ff ff       	jmp    80105cea <alltraps>

801063e1 <vector20>:
.globl vector20
vector20:
  pushl $0
801063e1:	6a 00                	push   $0x0
  pushl $20
801063e3:	6a 14                	push   $0x14
  jmp alltraps
801063e5:	e9 00 f9 ff ff       	jmp    80105cea <alltraps>

801063ea <vector21>:
.globl vector21
vector21:
  pushl $0
801063ea:	6a 00                	push   $0x0
  pushl $21
801063ec:	6a 15                	push   $0x15
  jmp alltraps
801063ee:	e9 f7 f8 ff ff       	jmp    80105cea <alltraps>

801063f3 <vector22>:
.globl vector22
vector22:
  pushl $0
801063f3:	6a 00                	push   $0x0
  pushl $22
801063f5:	6a 16                	push   $0x16
  jmp alltraps
801063f7:	e9 ee f8 ff ff       	jmp    80105cea <alltraps>

801063fc <vector23>:
.globl vector23
vector23:
  pushl $0
801063fc:	6a 00                	push   $0x0
  pushl $23
801063fe:	6a 17                	push   $0x17
  jmp alltraps
80106400:	e9 e5 f8 ff ff       	jmp    80105cea <alltraps>

80106405 <vector24>:
.globl vector24
vector24:
  pushl $0
80106405:	6a 00                	push   $0x0
  pushl $24
80106407:	6a 18                	push   $0x18
  jmp alltraps
80106409:	e9 dc f8 ff ff       	jmp    80105cea <alltraps>

8010640e <vector25>:
.globl vector25
vector25:
  pushl $0
8010640e:	6a 00                	push   $0x0
  pushl $25
80106410:	6a 19                	push   $0x19
  jmp alltraps
80106412:	e9 d3 f8 ff ff       	jmp    80105cea <alltraps>

80106417 <vector26>:
.globl vector26
vector26:
  pushl $0
80106417:	6a 00                	push   $0x0
  pushl $26
80106419:	6a 1a                	push   $0x1a
  jmp alltraps
8010641b:	e9 ca f8 ff ff       	jmp    80105cea <alltraps>

80106420 <vector27>:
.globl vector27
vector27:
  pushl $0
80106420:	6a 00                	push   $0x0
  pushl $27
80106422:	6a 1b                	push   $0x1b
  jmp alltraps
80106424:	e9 c1 f8 ff ff       	jmp    80105cea <alltraps>

80106429 <vector28>:
.globl vector28
vector28:
  pushl $0
80106429:	6a 00                	push   $0x0
  pushl $28
8010642b:	6a 1c                	push   $0x1c
  jmp alltraps
8010642d:	e9 b8 f8 ff ff       	jmp    80105cea <alltraps>

80106432 <vector29>:
.globl vector29
vector29:
  pushl $0
80106432:	6a 00                	push   $0x0
  pushl $29
80106434:	6a 1d                	push   $0x1d
  jmp alltraps
80106436:	e9 af f8 ff ff       	jmp    80105cea <alltraps>

8010643b <vector30>:
.globl vector30
vector30:
  pushl $0
8010643b:	6a 00                	push   $0x0
  pushl $30
8010643d:	6a 1e                	push   $0x1e
  jmp alltraps
8010643f:	e9 a6 f8 ff ff       	jmp    80105cea <alltraps>

80106444 <vector31>:
.globl vector31
vector31:
  pushl $0
80106444:	6a 00                	push   $0x0
  pushl $31
80106446:	6a 1f                	push   $0x1f
  jmp alltraps
80106448:	e9 9d f8 ff ff       	jmp    80105cea <alltraps>

8010644d <vector32>:
.globl vector32
vector32:
  pushl $0
8010644d:	6a 00                	push   $0x0
  pushl $32
8010644f:	6a 20                	push   $0x20
  jmp alltraps
80106451:	e9 94 f8 ff ff       	jmp    80105cea <alltraps>

80106456 <vector33>:
.globl vector33
vector33:
  pushl $0
80106456:	6a 00                	push   $0x0
  pushl $33
80106458:	6a 21                	push   $0x21
  jmp alltraps
8010645a:	e9 8b f8 ff ff       	jmp    80105cea <alltraps>

8010645f <vector34>:
.globl vector34
vector34:
  pushl $0
8010645f:	6a 00                	push   $0x0
  pushl $34
80106461:	6a 22                	push   $0x22
  jmp alltraps
80106463:	e9 82 f8 ff ff       	jmp    80105cea <alltraps>

80106468 <vector35>:
.globl vector35
vector35:
  pushl $0
80106468:	6a 00                	push   $0x0
  pushl $35
8010646a:	6a 23                	push   $0x23
  jmp alltraps
8010646c:	e9 79 f8 ff ff       	jmp    80105cea <alltraps>

80106471 <vector36>:
.globl vector36
vector36:
  pushl $0
80106471:	6a 00                	push   $0x0
  pushl $36
80106473:	6a 24                	push   $0x24
  jmp alltraps
80106475:	e9 70 f8 ff ff       	jmp    80105cea <alltraps>

8010647a <vector37>:
.globl vector37
vector37:
  pushl $0
8010647a:	6a 00                	push   $0x0
  pushl $37
8010647c:	6a 25                	push   $0x25
  jmp alltraps
8010647e:	e9 67 f8 ff ff       	jmp    80105cea <alltraps>

80106483 <vector38>:
.globl vector38
vector38:
  pushl $0
80106483:	6a 00                	push   $0x0
  pushl $38
80106485:	6a 26                	push   $0x26
  jmp alltraps
80106487:	e9 5e f8 ff ff       	jmp    80105cea <alltraps>

8010648c <vector39>:
.globl vector39
vector39:
  pushl $0
8010648c:	6a 00                	push   $0x0
  pushl $39
8010648e:	6a 27                	push   $0x27
  jmp alltraps
80106490:	e9 55 f8 ff ff       	jmp    80105cea <alltraps>

80106495 <vector40>:
.globl vector40
vector40:
  pushl $0
80106495:	6a 00                	push   $0x0
  pushl $40
80106497:	6a 28                	push   $0x28
  jmp alltraps
80106499:	e9 4c f8 ff ff       	jmp    80105cea <alltraps>

8010649e <vector41>:
.globl vector41
vector41:
  pushl $0
8010649e:	6a 00                	push   $0x0
  pushl $41
801064a0:	6a 29                	push   $0x29
  jmp alltraps
801064a2:	e9 43 f8 ff ff       	jmp    80105cea <alltraps>

801064a7 <vector42>:
.globl vector42
vector42:
  pushl $0
801064a7:	6a 00                	push   $0x0
  pushl $42
801064a9:	6a 2a                	push   $0x2a
  jmp alltraps
801064ab:	e9 3a f8 ff ff       	jmp    80105cea <alltraps>

801064b0 <vector43>:
.globl vector43
vector43:
  pushl $0
801064b0:	6a 00                	push   $0x0
  pushl $43
801064b2:	6a 2b                	push   $0x2b
  jmp alltraps
801064b4:	e9 31 f8 ff ff       	jmp    80105cea <alltraps>

801064b9 <vector44>:
.globl vector44
vector44:
  pushl $0
801064b9:	6a 00                	push   $0x0
  pushl $44
801064bb:	6a 2c                	push   $0x2c
  jmp alltraps
801064bd:	e9 28 f8 ff ff       	jmp    80105cea <alltraps>

801064c2 <vector45>:
.globl vector45
vector45:
  pushl $0
801064c2:	6a 00                	push   $0x0
  pushl $45
801064c4:	6a 2d                	push   $0x2d
  jmp alltraps
801064c6:	e9 1f f8 ff ff       	jmp    80105cea <alltraps>

801064cb <vector46>:
.globl vector46
vector46:
  pushl $0
801064cb:	6a 00                	push   $0x0
  pushl $46
801064cd:	6a 2e                	push   $0x2e
  jmp alltraps
801064cf:	e9 16 f8 ff ff       	jmp    80105cea <alltraps>

801064d4 <vector47>:
.globl vector47
vector47:
  pushl $0
801064d4:	6a 00                	push   $0x0
  pushl $47
801064d6:	6a 2f                	push   $0x2f
  jmp alltraps
801064d8:	e9 0d f8 ff ff       	jmp    80105cea <alltraps>

801064dd <vector48>:
.globl vector48
vector48:
  pushl $0
801064dd:	6a 00                	push   $0x0
  pushl $48
801064df:	6a 30                	push   $0x30
  jmp alltraps
801064e1:	e9 04 f8 ff ff       	jmp    80105cea <alltraps>

801064e6 <vector49>:
.globl vector49
vector49:
  pushl $0
801064e6:	6a 00                	push   $0x0
  pushl $49
801064e8:	6a 31                	push   $0x31
  jmp alltraps
801064ea:	e9 fb f7 ff ff       	jmp    80105cea <alltraps>

801064ef <vector50>:
.globl vector50
vector50:
  pushl $0
801064ef:	6a 00                	push   $0x0
  pushl $50
801064f1:	6a 32                	push   $0x32
  jmp alltraps
801064f3:	e9 f2 f7 ff ff       	jmp    80105cea <alltraps>

801064f8 <vector51>:
.globl vector51
vector51:
  pushl $0
801064f8:	6a 00                	push   $0x0
  pushl $51
801064fa:	6a 33                	push   $0x33
  jmp alltraps
801064fc:	e9 e9 f7 ff ff       	jmp    80105cea <alltraps>

80106501 <vector52>:
.globl vector52
vector52:
  pushl $0
80106501:	6a 00                	push   $0x0
  pushl $52
80106503:	6a 34                	push   $0x34
  jmp alltraps
80106505:	e9 e0 f7 ff ff       	jmp    80105cea <alltraps>

8010650a <vector53>:
.globl vector53
vector53:
  pushl $0
8010650a:	6a 00                	push   $0x0
  pushl $53
8010650c:	6a 35                	push   $0x35
  jmp alltraps
8010650e:	e9 d7 f7 ff ff       	jmp    80105cea <alltraps>

80106513 <vector54>:
.globl vector54
vector54:
  pushl $0
80106513:	6a 00                	push   $0x0
  pushl $54
80106515:	6a 36                	push   $0x36
  jmp alltraps
80106517:	e9 ce f7 ff ff       	jmp    80105cea <alltraps>

8010651c <vector55>:
.globl vector55
vector55:
  pushl $0
8010651c:	6a 00                	push   $0x0
  pushl $55
8010651e:	6a 37                	push   $0x37
  jmp alltraps
80106520:	e9 c5 f7 ff ff       	jmp    80105cea <alltraps>

80106525 <vector56>:
.globl vector56
vector56:
  pushl $0
80106525:	6a 00                	push   $0x0
  pushl $56
80106527:	6a 38                	push   $0x38
  jmp alltraps
80106529:	e9 bc f7 ff ff       	jmp    80105cea <alltraps>

8010652e <vector57>:
.globl vector57
vector57:
  pushl $0
8010652e:	6a 00                	push   $0x0
  pushl $57
80106530:	6a 39                	push   $0x39
  jmp alltraps
80106532:	e9 b3 f7 ff ff       	jmp    80105cea <alltraps>

80106537 <vector58>:
.globl vector58
vector58:
  pushl $0
80106537:	6a 00                	push   $0x0
  pushl $58
80106539:	6a 3a                	push   $0x3a
  jmp alltraps
8010653b:	e9 aa f7 ff ff       	jmp    80105cea <alltraps>

80106540 <vector59>:
.globl vector59
vector59:
  pushl $0
80106540:	6a 00                	push   $0x0
  pushl $59
80106542:	6a 3b                	push   $0x3b
  jmp alltraps
80106544:	e9 a1 f7 ff ff       	jmp    80105cea <alltraps>

80106549 <vector60>:
.globl vector60
vector60:
  pushl $0
80106549:	6a 00                	push   $0x0
  pushl $60
8010654b:	6a 3c                	push   $0x3c
  jmp alltraps
8010654d:	e9 98 f7 ff ff       	jmp    80105cea <alltraps>

80106552 <vector61>:
.globl vector61
vector61:
  pushl $0
80106552:	6a 00                	push   $0x0
  pushl $61
80106554:	6a 3d                	push   $0x3d
  jmp alltraps
80106556:	e9 8f f7 ff ff       	jmp    80105cea <alltraps>

8010655b <vector62>:
.globl vector62
vector62:
  pushl $0
8010655b:	6a 00                	push   $0x0
  pushl $62
8010655d:	6a 3e                	push   $0x3e
  jmp alltraps
8010655f:	e9 86 f7 ff ff       	jmp    80105cea <alltraps>

80106564 <vector63>:
.globl vector63
vector63:
  pushl $0
80106564:	6a 00                	push   $0x0
  pushl $63
80106566:	6a 3f                	push   $0x3f
  jmp alltraps
80106568:	e9 7d f7 ff ff       	jmp    80105cea <alltraps>

8010656d <vector64>:
.globl vector64
vector64:
  pushl $0
8010656d:	6a 00                	push   $0x0
  pushl $64
8010656f:	6a 40                	push   $0x40
  jmp alltraps
80106571:	e9 74 f7 ff ff       	jmp    80105cea <alltraps>

80106576 <vector65>:
.globl vector65
vector65:
  pushl $0
80106576:	6a 00                	push   $0x0
  pushl $65
80106578:	6a 41                	push   $0x41
  jmp alltraps
8010657a:	e9 6b f7 ff ff       	jmp    80105cea <alltraps>

8010657f <vector66>:
.globl vector66
vector66:
  pushl $0
8010657f:	6a 00                	push   $0x0
  pushl $66
80106581:	6a 42                	push   $0x42
  jmp alltraps
80106583:	e9 62 f7 ff ff       	jmp    80105cea <alltraps>

80106588 <vector67>:
.globl vector67
vector67:
  pushl $0
80106588:	6a 00                	push   $0x0
  pushl $67
8010658a:	6a 43                	push   $0x43
  jmp alltraps
8010658c:	e9 59 f7 ff ff       	jmp    80105cea <alltraps>

80106591 <vector68>:
.globl vector68
vector68:
  pushl $0
80106591:	6a 00                	push   $0x0
  pushl $68
80106593:	6a 44                	push   $0x44
  jmp alltraps
80106595:	e9 50 f7 ff ff       	jmp    80105cea <alltraps>

8010659a <vector69>:
.globl vector69
vector69:
  pushl $0
8010659a:	6a 00                	push   $0x0
  pushl $69
8010659c:	6a 45                	push   $0x45
  jmp alltraps
8010659e:	e9 47 f7 ff ff       	jmp    80105cea <alltraps>

801065a3 <vector70>:
.globl vector70
vector70:
  pushl $0
801065a3:	6a 00                	push   $0x0
  pushl $70
801065a5:	6a 46                	push   $0x46
  jmp alltraps
801065a7:	e9 3e f7 ff ff       	jmp    80105cea <alltraps>

801065ac <vector71>:
.globl vector71
vector71:
  pushl $0
801065ac:	6a 00                	push   $0x0
  pushl $71
801065ae:	6a 47                	push   $0x47
  jmp alltraps
801065b0:	e9 35 f7 ff ff       	jmp    80105cea <alltraps>

801065b5 <vector72>:
.globl vector72
vector72:
  pushl $0
801065b5:	6a 00                	push   $0x0
  pushl $72
801065b7:	6a 48                	push   $0x48
  jmp alltraps
801065b9:	e9 2c f7 ff ff       	jmp    80105cea <alltraps>

801065be <vector73>:
.globl vector73
vector73:
  pushl $0
801065be:	6a 00                	push   $0x0
  pushl $73
801065c0:	6a 49                	push   $0x49
  jmp alltraps
801065c2:	e9 23 f7 ff ff       	jmp    80105cea <alltraps>

801065c7 <vector74>:
.globl vector74
vector74:
  pushl $0
801065c7:	6a 00                	push   $0x0
  pushl $74
801065c9:	6a 4a                	push   $0x4a
  jmp alltraps
801065cb:	e9 1a f7 ff ff       	jmp    80105cea <alltraps>

801065d0 <vector75>:
.globl vector75
vector75:
  pushl $0
801065d0:	6a 00                	push   $0x0
  pushl $75
801065d2:	6a 4b                	push   $0x4b
  jmp alltraps
801065d4:	e9 11 f7 ff ff       	jmp    80105cea <alltraps>

801065d9 <vector76>:
.globl vector76
vector76:
  pushl $0
801065d9:	6a 00                	push   $0x0
  pushl $76
801065db:	6a 4c                	push   $0x4c
  jmp alltraps
801065dd:	e9 08 f7 ff ff       	jmp    80105cea <alltraps>

801065e2 <vector77>:
.globl vector77
vector77:
  pushl $0
801065e2:	6a 00                	push   $0x0
  pushl $77
801065e4:	6a 4d                	push   $0x4d
  jmp alltraps
801065e6:	e9 ff f6 ff ff       	jmp    80105cea <alltraps>

801065eb <vector78>:
.globl vector78
vector78:
  pushl $0
801065eb:	6a 00                	push   $0x0
  pushl $78
801065ed:	6a 4e                	push   $0x4e
  jmp alltraps
801065ef:	e9 f6 f6 ff ff       	jmp    80105cea <alltraps>

801065f4 <vector79>:
.globl vector79
vector79:
  pushl $0
801065f4:	6a 00                	push   $0x0
  pushl $79
801065f6:	6a 4f                	push   $0x4f
  jmp alltraps
801065f8:	e9 ed f6 ff ff       	jmp    80105cea <alltraps>

801065fd <vector80>:
.globl vector80
vector80:
  pushl $0
801065fd:	6a 00                	push   $0x0
  pushl $80
801065ff:	6a 50                	push   $0x50
  jmp alltraps
80106601:	e9 e4 f6 ff ff       	jmp    80105cea <alltraps>

80106606 <vector81>:
.globl vector81
vector81:
  pushl $0
80106606:	6a 00                	push   $0x0
  pushl $81
80106608:	6a 51                	push   $0x51
  jmp alltraps
8010660a:	e9 db f6 ff ff       	jmp    80105cea <alltraps>

8010660f <vector82>:
.globl vector82
vector82:
  pushl $0
8010660f:	6a 00                	push   $0x0
  pushl $82
80106611:	6a 52                	push   $0x52
  jmp alltraps
80106613:	e9 d2 f6 ff ff       	jmp    80105cea <alltraps>

80106618 <vector83>:
.globl vector83
vector83:
  pushl $0
80106618:	6a 00                	push   $0x0
  pushl $83
8010661a:	6a 53                	push   $0x53
  jmp alltraps
8010661c:	e9 c9 f6 ff ff       	jmp    80105cea <alltraps>

80106621 <vector84>:
.globl vector84
vector84:
  pushl $0
80106621:	6a 00                	push   $0x0
  pushl $84
80106623:	6a 54                	push   $0x54
  jmp alltraps
80106625:	e9 c0 f6 ff ff       	jmp    80105cea <alltraps>

8010662a <vector85>:
.globl vector85
vector85:
  pushl $0
8010662a:	6a 00                	push   $0x0
  pushl $85
8010662c:	6a 55                	push   $0x55
  jmp alltraps
8010662e:	e9 b7 f6 ff ff       	jmp    80105cea <alltraps>

80106633 <vector86>:
.globl vector86
vector86:
  pushl $0
80106633:	6a 00                	push   $0x0
  pushl $86
80106635:	6a 56                	push   $0x56
  jmp alltraps
80106637:	e9 ae f6 ff ff       	jmp    80105cea <alltraps>

8010663c <vector87>:
.globl vector87
vector87:
  pushl $0
8010663c:	6a 00                	push   $0x0
  pushl $87
8010663e:	6a 57                	push   $0x57
  jmp alltraps
80106640:	e9 a5 f6 ff ff       	jmp    80105cea <alltraps>

80106645 <vector88>:
.globl vector88
vector88:
  pushl $0
80106645:	6a 00                	push   $0x0
  pushl $88
80106647:	6a 58                	push   $0x58
  jmp alltraps
80106649:	e9 9c f6 ff ff       	jmp    80105cea <alltraps>

8010664e <vector89>:
.globl vector89
vector89:
  pushl $0
8010664e:	6a 00                	push   $0x0
  pushl $89
80106650:	6a 59                	push   $0x59
  jmp alltraps
80106652:	e9 93 f6 ff ff       	jmp    80105cea <alltraps>

80106657 <vector90>:
.globl vector90
vector90:
  pushl $0
80106657:	6a 00                	push   $0x0
  pushl $90
80106659:	6a 5a                	push   $0x5a
  jmp alltraps
8010665b:	e9 8a f6 ff ff       	jmp    80105cea <alltraps>

80106660 <vector91>:
.globl vector91
vector91:
  pushl $0
80106660:	6a 00                	push   $0x0
  pushl $91
80106662:	6a 5b                	push   $0x5b
  jmp alltraps
80106664:	e9 81 f6 ff ff       	jmp    80105cea <alltraps>

80106669 <vector92>:
.globl vector92
vector92:
  pushl $0
80106669:	6a 00                	push   $0x0
  pushl $92
8010666b:	6a 5c                	push   $0x5c
  jmp alltraps
8010666d:	e9 78 f6 ff ff       	jmp    80105cea <alltraps>

80106672 <vector93>:
.globl vector93
vector93:
  pushl $0
80106672:	6a 00                	push   $0x0
  pushl $93
80106674:	6a 5d                	push   $0x5d
  jmp alltraps
80106676:	e9 6f f6 ff ff       	jmp    80105cea <alltraps>

8010667b <vector94>:
.globl vector94
vector94:
  pushl $0
8010667b:	6a 00                	push   $0x0
  pushl $94
8010667d:	6a 5e                	push   $0x5e
  jmp alltraps
8010667f:	e9 66 f6 ff ff       	jmp    80105cea <alltraps>

80106684 <vector95>:
.globl vector95
vector95:
  pushl $0
80106684:	6a 00                	push   $0x0
  pushl $95
80106686:	6a 5f                	push   $0x5f
  jmp alltraps
80106688:	e9 5d f6 ff ff       	jmp    80105cea <alltraps>

8010668d <vector96>:
.globl vector96
vector96:
  pushl $0
8010668d:	6a 00                	push   $0x0
  pushl $96
8010668f:	6a 60                	push   $0x60
  jmp alltraps
80106691:	e9 54 f6 ff ff       	jmp    80105cea <alltraps>

80106696 <vector97>:
.globl vector97
vector97:
  pushl $0
80106696:	6a 00                	push   $0x0
  pushl $97
80106698:	6a 61                	push   $0x61
  jmp alltraps
8010669a:	e9 4b f6 ff ff       	jmp    80105cea <alltraps>

8010669f <vector98>:
.globl vector98
vector98:
  pushl $0
8010669f:	6a 00                	push   $0x0
  pushl $98
801066a1:	6a 62                	push   $0x62
  jmp alltraps
801066a3:	e9 42 f6 ff ff       	jmp    80105cea <alltraps>

801066a8 <vector99>:
.globl vector99
vector99:
  pushl $0
801066a8:	6a 00                	push   $0x0
  pushl $99
801066aa:	6a 63                	push   $0x63
  jmp alltraps
801066ac:	e9 39 f6 ff ff       	jmp    80105cea <alltraps>

801066b1 <vector100>:
.globl vector100
vector100:
  pushl $0
801066b1:	6a 00                	push   $0x0
  pushl $100
801066b3:	6a 64                	push   $0x64
  jmp alltraps
801066b5:	e9 30 f6 ff ff       	jmp    80105cea <alltraps>

801066ba <vector101>:
.globl vector101
vector101:
  pushl $0
801066ba:	6a 00                	push   $0x0
  pushl $101
801066bc:	6a 65                	push   $0x65
  jmp alltraps
801066be:	e9 27 f6 ff ff       	jmp    80105cea <alltraps>

801066c3 <vector102>:
.globl vector102
vector102:
  pushl $0
801066c3:	6a 00                	push   $0x0
  pushl $102
801066c5:	6a 66                	push   $0x66
  jmp alltraps
801066c7:	e9 1e f6 ff ff       	jmp    80105cea <alltraps>

801066cc <vector103>:
.globl vector103
vector103:
  pushl $0
801066cc:	6a 00                	push   $0x0
  pushl $103
801066ce:	6a 67                	push   $0x67
  jmp alltraps
801066d0:	e9 15 f6 ff ff       	jmp    80105cea <alltraps>

801066d5 <vector104>:
.globl vector104
vector104:
  pushl $0
801066d5:	6a 00                	push   $0x0
  pushl $104
801066d7:	6a 68                	push   $0x68
  jmp alltraps
801066d9:	e9 0c f6 ff ff       	jmp    80105cea <alltraps>

801066de <vector105>:
.globl vector105
vector105:
  pushl $0
801066de:	6a 00                	push   $0x0
  pushl $105
801066e0:	6a 69                	push   $0x69
  jmp alltraps
801066e2:	e9 03 f6 ff ff       	jmp    80105cea <alltraps>

801066e7 <vector106>:
.globl vector106
vector106:
  pushl $0
801066e7:	6a 00                	push   $0x0
  pushl $106
801066e9:	6a 6a                	push   $0x6a
  jmp alltraps
801066eb:	e9 fa f5 ff ff       	jmp    80105cea <alltraps>

801066f0 <vector107>:
.globl vector107
vector107:
  pushl $0
801066f0:	6a 00                	push   $0x0
  pushl $107
801066f2:	6a 6b                	push   $0x6b
  jmp alltraps
801066f4:	e9 f1 f5 ff ff       	jmp    80105cea <alltraps>

801066f9 <vector108>:
.globl vector108
vector108:
  pushl $0
801066f9:	6a 00                	push   $0x0
  pushl $108
801066fb:	6a 6c                	push   $0x6c
  jmp alltraps
801066fd:	e9 e8 f5 ff ff       	jmp    80105cea <alltraps>

80106702 <vector109>:
.globl vector109
vector109:
  pushl $0
80106702:	6a 00                	push   $0x0
  pushl $109
80106704:	6a 6d                	push   $0x6d
  jmp alltraps
80106706:	e9 df f5 ff ff       	jmp    80105cea <alltraps>

8010670b <vector110>:
.globl vector110
vector110:
  pushl $0
8010670b:	6a 00                	push   $0x0
  pushl $110
8010670d:	6a 6e                	push   $0x6e
  jmp alltraps
8010670f:	e9 d6 f5 ff ff       	jmp    80105cea <alltraps>

80106714 <vector111>:
.globl vector111
vector111:
  pushl $0
80106714:	6a 00                	push   $0x0
  pushl $111
80106716:	6a 6f                	push   $0x6f
  jmp alltraps
80106718:	e9 cd f5 ff ff       	jmp    80105cea <alltraps>

8010671d <vector112>:
.globl vector112
vector112:
  pushl $0
8010671d:	6a 00                	push   $0x0
  pushl $112
8010671f:	6a 70                	push   $0x70
  jmp alltraps
80106721:	e9 c4 f5 ff ff       	jmp    80105cea <alltraps>

80106726 <vector113>:
.globl vector113
vector113:
  pushl $0
80106726:	6a 00                	push   $0x0
  pushl $113
80106728:	6a 71                	push   $0x71
  jmp alltraps
8010672a:	e9 bb f5 ff ff       	jmp    80105cea <alltraps>

8010672f <vector114>:
.globl vector114
vector114:
  pushl $0
8010672f:	6a 00                	push   $0x0
  pushl $114
80106731:	6a 72                	push   $0x72
  jmp alltraps
80106733:	e9 b2 f5 ff ff       	jmp    80105cea <alltraps>

80106738 <vector115>:
.globl vector115
vector115:
  pushl $0
80106738:	6a 00                	push   $0x0
  pushl $115
8010673a:	6a 73                	push   $0x73
  jmp alltraps
8010673c:	e9 a9 f5 ff ff       	jmp    80105cea <alltraps>

80106741 <vector116>:
.globl vector116
vector116:
  pushl $0
80106741:	6a 00                	push   $0x0
  pushl $116
80106743:	6a 74                	push   $0x74
  jmp alltraps
80106745:	e9 a0 f5 ff ff       	jmp    80105cea <alltraps>

8010674a <vector117>:
.globl vector117
vector117:
  pushl $0
8010674a:	6a 00                	push   $0x0
  pushl $117
8010674c:	6a 75                	push   $0x75
  jmp alltraps
8010674e:	e9 97 f5 ff ff       	jmp    80105cea <alltraps>

80106753 <vector118>:
.globl vector118
vector118:
  pushl $0
80106753:	6a 00                	push   $0x0
  pushl $118
80106755:	6a 76                	push   $0x76
  jmp alltraps
80106757:	e9 8e f5 ff ff       	jmp    80105cea <alltraps>

8010675c <vector119>:
.globl vector119
vector119:
  pushl $0
8010675c:	6a 00                	push   $0x0
  pushl $119
8010675e:	6a 77                	push   $0x77
  jmp alltraps
80106760:	e9 85 f5 ff ff       	jmp    80105cea <alltraps>

80106765 <vector120>:
.globl vector120
vector120:
  pushl $0
80106765:	6a 00                	push   $0x0
  pushl $120
80106767:	6a 78                	push   $0x78
  jmp alltraps
80106769:	e9 7c f5 ff ff       	jmp    80105cea <alltraps>

8010676e <vector121>:
.globl vector121
vector121:
  pushl $0
8010676e:	6a 00                	push   $0x0
  pushl $121
80106770:	6a 79                	push   $0x79
  jmp alltraps
80106772:	e9 73 f5 ff ff       	jmp    80105cea <alltraps>

80106777 <vector122>:
.globl vector122
vector122:
  pushl $0
80106777:	6a 00                	push   $0x0
  pushl $122
80106779:	6a 7a                	push   $0x7a
  jmp alltraps
8010677b:	e9 6a f5 ff ff       	jmp    80105cea <alltraps>

80106780 <vector123>:
.globl vector123
vector123:
  pushl $0
80106780:	6a 00                	push   $0x0
  pushl $123
80106782:	6a 7b                	push   $0x7b
  jmp alltraps
80106784:	e9 61 f5 ff ff       	jmp    80105cea <alltraps>

80106789 <vector124>:
.globl vector124
vector124:
  pushl $0
80106789:	6a 00                	push   $0x0
  pushl $124
8010678b:	6a 7c                	push   $0x7c
  jmp alltraps
8010678d:	e9 58 f5 ff ff       	jmp    80105cea <alltraps>

80106792 <vector125>:
.globl vector125
vector125:
  pushl $0
80106792:	6a 00                	push   $0x0
  pushl $125
80106794:	6a 7d                	push   $0x7d
  jmp alltraps
80106796:	e9 4f f5 ff ff       	jmp    80105cea <alltraps>

8010679b <vector126>:
.globl vector126
vector126:
  pushl $0
8010679b:	6a 00                	push   $0x0
  pushl $126
8010679d:	6a 7e                	push   $0x7e
  jmp alltraps
8010679f:	e9 46 f5 ff ff       	jmp    80105cea <alltraps>

801067a4 <vector127>:
.globl vector127
vector127:
  pushl $0
801067a4:	6a 00                	push   $0x0
  pushl $127
801067a6:	6a 7f                	push   $0x7f
  jmp alltraps
801067a8:	e9 3d f5 ff ff       	jmp    80105cea <alltraps>

801067ad <vector128>:
.globl vector128
vector128:
  pushl $0
801067ad:	6a 00                	push   $0x0
  pushl $128
801067af:	68 80 00 00 00       	push   $0x80
  jmp alltraps
801067b4:	e9 31 f5 ff ff       	jmp    80105cea <alltraps>

801067b9 <vector129>:
.globl vector129
vector129:
  pushl $0
801067b9:	6a 00                	push   $0x0
  pushl $129
801067bb:	68 81 00 00 00       	push   $0x81
  jmp alltraps
801067c0:	e9 25 f5 ff ff       	jmp    80105cea <alltraps>

801067c5 <vector130>:
.globl vector130
vector130:
  pushl $0
801067c5:	6a 00                	push   $0x0
  pushl $130
801067c7:	68 82 00 00 00       	push   $0x82
  jmp alltraps
801067cc:	e9 19 f5 ff ff       	jmp    80105cea <alltraps>

801067d1 <vector131>:
.globl vector131
vector131:
  pushl $0
801067d1:	6a 00                	push   $0x0
  pushl $131
801067d3:	68 83 00 00 00       	push   $0x83
  jmp alltraps
801067d8:	e9 0d f5 ff ff       	jmp    80105cea <alltraps>

801067dd <vector132>:
.globl vector132
vector132:
  pushl $0
801067dd:	6a 00                	push   $0x0
  pushl $132
801067df:	68 84 00 00 00       	push   $0x84
  jmp alltraps
801067e4:	e9 01 f5 ff ff       	jmp    80105cea <alltraps>

801067e9 <vector133>:
.globl vector133
vector133:
  pushl $0
801067e9:	6a 00                	push   $0x0
  pushl $133
801067eb:	68 85 00 00 00       	push   $0x85
  jmp alltraps
801067f0:	e9 f5 f4 ff ff       	jmp    80105cea <alltraps>

801067f5 <vector134>:
.globl vector134
vector134:
  pushl $0
801067f5:	6a 00                	push   $0x0
  pushl $134
801067f7:	68 86 00 00 00       	push   $0x86
  jmp alltraps
801067fc:	e9 e9 f4 ff ff       	jmp    80105cea <alltraps>

80106801 <vector135>:
.globl vector135
vector135:
  pushl $0
80106801:	6a 00                	push   $0x0
  pushl $135
80106803:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80106808:	e9 dd f4 ff ff       	jmp    80105cea <alltraps>

8010680d <vector136>:
.globl vector136
vector136:
  pushl $0
8010680d:	6a 00                	push   $0x0
  pushl $136
8010680f:	68 88 00 00 00       	push   $0x88
  jmp alltraps
80106814:	e9 d1 f4 ff ff       	jmp    80105cea <alltraps>

80106819 <vector137>:
.globl vector137
vector137:
  pushl $0
80106819:	6a 00                	push   $0x0
  pushl $137
8010681b:	68 89 00 00 00       	push   $0x89
  jmp alltraps
80106820:	e9 c5 f4 ff ff       	jmp    80105cea <alltraps>

80106825 <vector138>:
.globl vector138
vector138:
  pushl $0
80106825:	6a 00                	push   $0x0
  pushl $138
80106827:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
8010682c:	e9 b9 f4 ff ff       	jmp    80105cea <alltraps>

80106831 <vector139>:
.globl vector139
vector139:
  pushl $0
80106831:	6a 00                	push   $0x0
  pushl $139
80106833:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80106838:	e9 ad f4 ff ff       	jmp    80105cea <alltraps>

8010683d <vector140>:
.globl vector140
vector140:
  pushl $0
8010683d:	6a 00                	push   $0x0
  pushl $140
8010683f:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
80106844:	e9 a1 f4 ff ff       	jmp    80105cea <alltraps>

80106849 <vector141>:
.globl vector141
vector141:
  pushl $0
80106849:	6a 00                	push   $0x0
  pushl $141
8010684b:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
80106850:	e9 95 f4 ff ff       	jmp    80105cea <alltraps>

80106855 <vector142>:
.globl vector142
vector142:
  pushl $0
80106855:	6a 00                	push   $0x0
  pushl $142
80106857:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
8010685c:	e9 89 f4 ff ff       	jmp    80105cea <alltraps>

80106861 <vector143>:
.globl vector143
vector143:
  pushl $0
80106861:	6a 00                	push   $0x0
  pushl $143
80106863:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106868:	e9 7d f4 ff ff       	jmp    80105cea <alltraps>

8010686d <vector144>:
.globl vector144
vector144:
  pushl $0
8010686d:	6a 00                	push   $0x0
  pushl $144
8010686f:	68 90 00 00 00       	push   $0x90
  jmp alltraps
80106874:	e9 71 f4 ff ff       	jmp    80105cea <alltraps>

80106879 <vector145>:
.globl vector145
vector145:
  pushl $0
80106879:	6a 00                	push   $0x0
  pushl $145
8010687b:	68 91 00 00 00       	push   $0x91
  jmp alltraps
80106880:	e9 65 f4 ff ff       	jmp    80105cea <alltraps>

80106885 <vector146>:
.globl vector146
vector146:
  pushl $0
80106885:	6a 00                	push   $0x0
  pushl $146
80106887:	68 92 00 00 00       	push   $0x92
  jmp alltraps
8010688c:	e9 59 f4 ff ff       	jmp    80105cea <alltraps>

80106891 <vector147>:
.globl vector147
vector147:
  pushl $0
80106891:	6a 00                	push   $0x0
  pushl $147
80106893:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106898:	e9 4d f4 ff ff       	jmp    80105cea <alltraps>

8010689d <vector148>:
.globl vector148
vector148:
  pushl $0
8010689d:	6a 00                	push   $0x0
  pushl $148
8010689f:	68 94 00 00 00       	push   $0x94
  jmp alltraps
801068a4:	e9 41 f4 ff ff       	jmp    80105cea <alltraps>

801068a9 <vector149>:
.globl vector149
vector149:
  pushl $0
801068a9:	6a 00                	push   $0x0
  pushl $149
801068ab:	68 95 00 00 00       	push   $0x95
  jmp alltraps
801068b0:	e9 35 f4 ff ff       	jmp    80105cea <alltraps>

801068b5 <vector150>:
.globl vector150
vector150:
  pushl $0
801068b5:	6a 00                	push   $0x0
  pushl $150
801068b7:	68 96 00 00 00       	push   $0x96
  jmp alltraps
801068bc:	e9 29 f4 ff ff       	jmp    80105cea <alltraps>

801068c1 <vector151>:
.globl vector151
vector151:
  pushl $0
801068c1:	6a 00                	push   $0x0
  pushl $151
801068c3:	68 97 00 00 00       	push   $0x97
  jmp alltraps
801068c8:	e9 1d f4 ff ff       	jmp    80105cea <alltraps>

801068cd <vector152>:
.globl vector152
vector152:
  pushl $0
801068cd:	6a 00                	push   $0x0
  pushl $152
801068cf:	68 98 00 00 00       	push   $0x98
  jmp alltraps
801068d4:	e9 11 f4 ff ff       	jmp    80105cea <alltraps>

801068d9 <vector153>:
.globl vector153
vector153:
  pushl $0
801068d9:	6a 00                	push   $0x0
  pushl $153
801068db:	68 99 00 00 00       	push   $0x99
  jmp alltraps
801068e0:	e9 05 f4 ff ff       	jmp    80105cea <alltraps>

801068e5 <vector154>:
.globl vector154
vector154:
  pushl $0
801068e5:	6a 00                	push   $0x0
  pushl $154
801068e7:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
801068ec:	e9 f9 f3 ff ff       	jmp    80105cea <alltraps>

801068f1 <vector155>:
.globl vector155
vector155:
  pushl $0
801068f1:	6a 00                	push   $0x0
  pushl $155
801068f3:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
801068f8:	e9 ed f3 ff ff       	jmp    80105cea <alltraps>

801068fd <vector156>:
.globl vector156
vector156:
  pushl $0
801068fd:	6a 00                	push   $0x0
  pushl $156
801068ff:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
80106904:	e9 e1 f3 ff ff       	jmp    80105cea <alltraps>

80106909 <vector157>:
.globl vector157
vector157:
  pushl $0
80106909:	6a 00                	push   $0x0
  pushl $157
8010690b:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
80106910:	e9 d5 f3 ff ff       	jmp    80105cea <alltraps>

80106915 <vector158>:
.globl vector158
vector158:
  pushl $0
80106915:	6a 00                	push   $0x0
  pushl $158
80106917:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
8010691c:	e9 c9 f3 ff ff       	jmp    80105cea <alltraps>

80106921 <vector159>:
.globl vector159
vector159:
  pushl $0
80106921:	6a 00                	push   $0x0
  pushl $159
80106923:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80106928:	e9 bd f3 ff ff       	jmp    80105cea <alltraps>

8010692d <vector160>:
.globl vector160
vector160:
  pushl $0
8010692d:	6a 00                	push   $0x0
  pushl $160
8010692f:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
80106934:	e9 b1 f3 ff ff       	jmp    80105cea <alltraps>

80106939 <vector161>:
.globl vector161
vector161:
  pushl $0
80106939:	6a 00                	push   $0x0
  pushl $161
8010693b:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
80106940:	e9 a5 f3 ff ff       	jmp    80105cea <alltraps>

80106945 <vector162>:
.globl vector162
vector162:
  pushl $0
80106945:	6a 00                	push   $0x0
  pushl $162
80106947:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
8010694c:	e9 99 f3 ff ff       	jmp    80105cea <alltraps>

80106951 <vector163>:
.globl vector163
vector163:
  pushl $0
80106951:	6a 00                	push   $0x0
  pushl $163
80106953:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106958:	e9 8d f3 ff ff       	jmp    80105cea <alltraps>

8010695d <vector164>:
.globl vector164
vector164:
  pushl $0
8010695d:	6a 00                	push   $0x0
  pushl $164
8010695f:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
80106964:	e9 81 f3 ff ff       	jmp    80105cea <alltraps>

80106969 <vector165>:
.globl vector165
vector165:
  pushl $0
80106969:	6a 00                	push   $0x0
  pushl $165
8010696b:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
80106970:	e9 75 f3 ff ff       	jmp    80105cea <alltraps>

80106975 <vector166>:
.globl vector166
vector166:
  pushl $0
80106975:	6a 00                	push   $0x0
  pushl $166
80106977:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
8010697c:	e9 69 f3 ff ff       	jmp    80105cea <alltraps>

80106981 <vector167>:
.globl vector167
vector167:
  pushl $0
80106981:	6a 00                	push   $0x0
  pushl $167
80106983:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106988:	e9 5d f3 ff ff       	jmp    80105cea <alltraps>

8010698d <vector168>:
.globl vector168
vector168:
  pushl $0
8010698d:	6a 00                	push   $0x0
  pushl $168
8010698f:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
80106994:	e9 51 f3 ff ff       	jmp    80105cea <alltraps>

80106999 <vector169>:
.globl vector169
vector169:
  pushl $0
80106999:	6a 00                	push   $0x0
  pushl $169
8010699b:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
801069a0:	e9 45 f3 ff ff       	jmp    80105cea <alltraps>

801069a5 <vector170>:
.globl vector170
vector170:
  pushl $0
801069a5:	6a 00                	push   $0x0
  pushl $170
801069a7:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
801069ac:	e9 39 f3 ff ff       	jmp    80105cea <alltraps>

801069b1 <vector171>:
.globl vector171
vector171:
  pushl $0
801069b1:	6a 00                	push   $0x0
  pushl $171
801069b3:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
801069b8:	e9 2d f3 ff ff       	jmp    80105cea <alltraps>

801069bd <vector172>:
.globl vector172
vector172:
  pushl $0
801069bd:	6a 00                	push   $0x0
  pushl $172
801069bf:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
801069c4:	e9 21 f3 ff ff       	jmp    80105cea <alltraps>

801069c9 <vector173>:
.globl vector173
vector173:
  pushl $0
801069c9:	6a 00                	push   $0x0
  pushl $173
801069cb:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
801069d0:	e9 15 f3 ff ff       	jmp    80105cea <alltraps>

801069d5 <vector174>:
.globl vector174
vector174:
  pushl $0
801069d5:	6a 00                	push   $0x0
  pushl $174
801069d7:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
801069dc:	e9 09 f3 ff ff       	jmp    80105cea <alltraps>

801069e1 <vector175>:
.globl vector175
vector175:
  pushl $0
801069e1:	6a 00                	push   $0x0
  pushl $175
801069e3:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
801069e8:	e9 fd f2 ff ff       	jmp    80105cea <alltraps>

801069ed <vector176>:
.globl vector176
vector176:
  pushl $0
801069ed:	6a 00                	push   $0x0
  pushl $176
801069ef:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
801069f4:	e9 f1 f2 ff ff       	jmp    80105cea <alltraps>

801069f9 <vector177>:
.globl vector177
vector177:
  pushl $0
801069f9:	6a 00                	push   $0x0
  pushl $177
801069fb:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
80106a00:	e9 e5 f2 ff ff       	jmp    80105cea <alltraps>

80106a05 <vector178>:
.globl vector178
vector178:
  pushl $0
80106a05:	6a 00                	push   $0x0
  pushl $178
80106a07:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106a0c:	e9 d9 f2 ff ff       	jmp    80105cea <alltraps>

80106a11 <vector179>:
.globl vector179
vector179:
  pushl $0
80106a11:	6a 00                	push   $0x0
  pushl $179
80106a13:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106a18:	e9 cd f2 ff ff       	jmp    80105cea <alltraps>

80106a1d <vector180>:
.globl vector180
vector180:
  pushl $0
80106a1d:	6a 00                	push   $0x0
  pushl $180
80106a1f:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
80106a24:	e9 c1 f2 ff ff       	jmp    80105cea <alltraps>

80106a29 <vector181>:
.globl vector181
vector181:
  pushl $0
80106a29:	6a 00                	push   $0x0
  pushl $181
80106a2b:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
80106a30:	e9 b5 f2 ff ff       	jmp    80105cea <alltraps>

80106a35 <vector182>:
.globl vector182
vector182:
  pushl $0
80106a35:	6a 00                	push   $0x0
  pushl $182
80106a37:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106a3c:	e9 a9 f2 ff ff       	jmp    80105cea <alltraps>

80106a41 <vector183>:
.globl vector183
vector183:
  pushl $0
80106a41:	6a 00                	push   $0x0
  pushl $183
80106a43:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106a48:	e9 9d f2 ff ff       	jmp    80105cea <alltraps>

80106a4d <vector184>:
.globl vector184
vector184:
  pushl $0
80106a4d:	6a 00                	push   $0x0
  pushl $184
80106a4f:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
80106a54:	e9 91 f2 ff ff       	jmp    80105cea <alltraps>

80106a59 <vector185>:
.globl vector185
vector185:
  pushl $0
80106a59:	6a 00                	push   $0x0
  pushl $185
80106a5b:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
80106a60:	e9 85 f2 ff ff       	jmp    80105cea <alltraps>

80106a65 <vector186>:
.globl vector186
vector186:
  pushl $0
80106a65:	6a 00                	push   $0x0
  pushl $186
80106a67:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106a6c:	e9 79 f2 ff ff       	jmp    80105cea <alltraps>

80106a71 <vector187>:
.globl vector187
vector187:
  pushl $0
80106a71:	6a 00                	push   $0x0
  pushl $187
80106a73:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106a78:	e9 6d f2 ff ff       	jmp    80105cea <alltraps>

80106a7d <vector188>:
.globl vector188
vector188:
  pushl $0
80106a7d:	6a 00                	push   $0x0
  pushl $188
80106a7f:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
80106a84:	e9 61 f2 ff ff       	jmp    80105cea <alltraps>

80106a89 <vector189>:
.globl vector189
vector189:
  pushl $0
80106a89:	6a 00                	push   $0x0
  pushl $189
80106a8b:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
80106a90:	e9 55 f2 ff ff       	jmp    80105cea <alltraps>

80106a95 <vector190>:
.globl vector190
vector190:
  pushl $0
80106a95:	6a 00                	push   $0x0
  pushl $190
80106a97:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106a9c:	e9 49 f2 ff ff       	jmp    80105cea <alltraps>

80106aa1 <vector191>:
.globl vector191
vector191:
  pushl $0
80106aa1:	6a 00                	push   $0x0
  pushl $191
80106aa3:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106aa8:	e9 3d f2 ff ff       	jmp    80105cea <alltraps>

80106aad <vector192>:
.globl vector192
vector192:
  pushl $0
80106aad:	6a 00                	push   $0x0
  pushl $192
80106aaf:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
80106ab4:	e9 31 f2 ff ff       	jmp    80105cea <alltraps>

80106ab9 <vector193>:
.globl vector193
vector193:
  pushl $0
80106ab9:	6a 00                	push   $0x0
  pushl $193
80106abb:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
80106ac0:	e9 25 f2 ff ff       	jmp    80105cea <alltraps>

80106ac5 <vector194>:
.globl vector194
vector194:
  pushl $0
80106ac5:	6a 00                	push   $0x0
  pushl $194
80106ac7:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106acc:	e9 19 f2 ff ff       	jmp    80105cea <alltraps>

80106ad1 <vector195>:
.globl vector195
vector195:
  pushl $0
80106ad1:	6a 00                	push   $0x0
  pushl $195
80106ad3:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106ad8:	e9 0d f2 ff ff       	jmp    80105cea <alltraps>

80106add <vector196>:
.globl vector196
vector196:
  pushl $0
80106add:	6a 00                	push   $0x0
  pushl $196
80106adf:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
80106ae4:	e9 01 f2 ff ff       	jmp    80105cea <alltraps>

80106ae9 <vector197>:
.globl vector197
vector197:
  pushl $0
80106ae9:	6a 00                	push   $0x0
  pushl $197
80106aeb:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
80106af0:	e9 f5 f1 ff ff       	jmp    80105cea <alltraps>

80106af5 <vector198>:
.globl vector198
vector198:
  pushl $0
80106af5:	6a 00                	push   $0x0
  pushl $198
80106af7:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106afc:	e9 e9 f1 ff ff       	jmp    80105cea <alltraps>

80106b01 <vector199>:
.globl vector199
vector199:
  pushl $0
80106b01:	6a 00                	push   $0x0
  pushl $199
80106b03:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106b08:	e9 dd f1 ff ff       	jmp    80105cea <alltraps>

80106b0d <vector200>:
.globl vector200
vector200:
  pushl $0
80106b0d:	6a 00                	push   $0x0
  pushl $200
80106b0f:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
80106b14:	e9 d1 f1 ff ff       	jmp    80105cea <alltraps>

80106b19 <vector201>:
.globl vector201
vector201:
  pushl $0
80106b19:	6a 00                	push   $0x0
  pushl $201
80106b1b:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
80106b20:	e9 c5 f1 ff ff       	jmp    80105cea <alltraps>

80106b25 <vector202>:
.globl vector202
vector202:
  pushl $0
80106b25:	6a 00                	push   $0x0
  pushl $202
80106b27:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106b2c:	e9 b9 f1 ff ff       	jmp    80105cea <alltraps>

80106b31 <vector203>:
.globl vector203
vector203:
  pushl $0
80106b31:	6a 00                	push   $0x0
  pushl $203
80106b33:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106b38:	e9 ad f1 ff ff       	jmp    80105cea <alltraps>

80106b3d <vector204>:
.globl vector204
vector204:
  pushl $0
80106b3d:	6a 00                	push   $0x0
  pushl $204
80106b3f:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
80106b44:	e9 a1 f1 ff ff       	jmp    80105cea <alltraps>

80106b49 <vector205>:
.globl vector205
vector205:
  pushl $0
80106b49:	6a 00                	push   $0x0
  pushl $205
80106b4b:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
80106b50:	e9 95 f1 ff ff       	jmp    80105cea <alltraps>

80106b55 <vector206>:
.globl vector206
vector206:
  pushl $0
80106b55:	6a 00                	push   $0x0
  pushl $206
80106b57:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106b5c:	e9 89 f1 ff ff       	jmp    80105cea <alltraps>

80106b61 <vector207>:
.globl vector207
vector207:
  pushl $0
80106b61:	6a 00                	push   $0x0
  pushl $207
80106b63:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106b68:	e9 7d f1 ff ff       	jmp    80105cea <alltraps>

80106b6d <vector208>:
.globl vector208
vector208:
  pushl $0
80106b6d:	6a 00                	push   $0x0
  pushl $208
80106b6f:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
80106b74:	e9 71 f1 ff ff       	jmp    80105cea <alltraps>

80106b79 <vector209>:
.globl vector209
vector209:
  pushl $0
80106b79:	6a 00                	push   $0x0
  pushl $209
80106b7b:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
80106b80:	e9 65 f1 ff ff       	jmp    80105cea <alltraps>

80106b85 <vector210>:
.globl vector210
vector210:
  pushl $0
80106b85:	6a 00                	push   $0x0
  pushl $210
80106b87:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106b8c:	e9 59 f1 ff ff       	jmp    80105cea <alltraps>

80106b91 <vector211>:
.globl vector211
vector211:
  pushl $0
80106b91:	6a 00                	push   $0x0
  pushl $211
80106b93:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106b98:	e9 4d f1 ff ff       	jmp    80105cea <alltraps>

80106b9d <vector212>:
.globl vector212
vector212:
  pushl $0
80106b9d:	6a 00                	push   $0x0
  pushl $212
80106b9f:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
80106ba4:	e9 41 f1 ff ff       	jmp    80105cea <alltraps>

80106ba9 <vector213>:
.globl vector213
vector213:
  pushl $0
80106ba9:	6a 00                	push   $0x0
  pushl $213
80106bab:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80106bb0:	e9 35 f1 ff ff       	jmp    80105cea <alltraps>

80106bb5 <vector214>:
.globl vector214
vector214:
  pushl $0
80106bb5:	6a 00                	push   $0x0
  pushl $214
80106bb7:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106bbc:	e9 29 f1 ff ff       	jmp    80105cea <alltraps>

80106bc1 <vector215>:
.globl vector215
vector215:
  pushl $0
80106bc1:	6a 00                	push   $0x0
  pushl $215
80106bc3:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106bc8:	e9 1d f1 ff ff       	jmp    80105cea <alltraps>

80106bcd <vector216>:
.globl vector216
vector216:
  pushl $0
80106bcd:	6a 00                	push   $0x0
  pushl $216
80106bcf:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80106bd4:	e9 11 f1 ff ff       	jmp    80105cea <alltraps>

80106bd9 <vector217>:
.globl vector217
vector217:
  pushl $0
80106bd9:	6a 00                	push   $0x0
  pushl $217
80106bdb:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80106be0:	e9 05 f1 ff ff       	jmp    80105cea <alltraps>

80106be5 <vector218>:
.globl vector218
vector218:
  pushl $0
80106be5:	6a 00                	push   $0x0
  pushl $218
80106be7:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106bec:	e9 f9 f0 ff ff       	jmp    80105cea <alltraps>

80106bf1 <vector219>:
.globl vector219
vector219:
  pushl $0
80106bf1:	6a 00                	push   $0x0
  pushl $219
80106bf3:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106bf8:	e9 ed f0 ff ff       	jmp    80105cea <alltraps>

80106bfd <vector220>:
.globl vector220
vector220:
  pushl $0
80106bfd:	6a 00                	push   $0x0
  pushl $220
80106bff:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80106c04:	e9 e1 f0 ff ff       	jmp    80105cea <alltraps>

80106c09 <vector221>:
.globl vector221
vector221:
  pushl $0
80106c09:	6a 00                	push   $0x0
  pushl $221
80106c0b:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80106c10:	e9 d5 f0 ff ff       	jmp    80105cea <alltraps>

80106c15 <vector222>:
.globl vector222
vector222:
  pushl $0
80106c15:	6a 00                	push   $0x0
  pushl $222
80106c17:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106c1c:	e9 c9 f0 ff ff       	jmp    80105cea <alltraps>

80106c21 <vector223>:
.globl vector223
vector223:
  pushl $0
80106c21:	6a 00                	push   $0x0
  pushl $223
80106c23:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106c28:	e9 bd f0 ff ff       	jmp    80105cea <alltraps>

80106c2d <vector224>:
.globl vector224
vector224:
  pushl $0
80106c2d:	6a 00                	push   $0x0
  pushl $224
80106c2f:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80106c34:	e9 b1 f0 ff ff       	jmp    80105cea <alltraps>

80106c39 <vector225>:
.globl vector225
vector225:
  pushl $0
80106c39:	6a 00                	push   $0x0
  pushl $225
80106c3b:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80106c40:	e9 a5 f0 ff ff       	jmp    80105cea <alltraps>

80106c45 <vector226>:
.globl vector226
vector226:
  pushl $0
80106c45:	6a 00                	push   $0x0
  pushl $226
80106c47:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106c4c:	e9 99 f0 ff ff       	jmp    80105cea <alltraps>

80106c51 <vector227>:
.globl vector227
vector227:
  pushl $0
80106c51:	6a 00                	push   $0x0
  pushl $227
80106c53:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106c58:	e9 8d f0 ff ff       	jmp    80105cea <alltraps>

80106c5d <vector228>:
.globl vector228
vector228:
  pushl $0
80106c5d:	6a 00                	push   $0x0
  pushl $228
80106c5f:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80106c64:	e9 81 f0 ff ff       	jmp    80105cea <alltraps>

80106c69 <vector229>:
.globl vector229
vector229:
  pushl $0
80106c69:	6a 00                	push   $0x0
  pushl $229
80106c6b:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80106c70:	e9 75 f0 ff ff       	jmp    80105cea <alltraps>

80106c75 <vector230>:
.globl vector230
vector230:
  pushl $0
80106c75:	6a 00                	push   $0x0
  pushl $230
80106c77:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106c7c:	e9 69 f0 ff ff       	jmp    80105cea <alltraps>

80106c81 <vector231>:
.globl vector231
vector231:
  pushl $0
80106c81:	6a 00                	push   $0x0
  pushl $231
80106c83:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106c88:	e9 5d f0 ff ff       	jmp    80105cea <alltraps>

80106c8d <vector232>:
.globl vector232
vector232:
  pushl $0
80106c8d:	6a 00                	push   $0x0
  pushl $232
80106c8f:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80106c94:	e9 51 f0 ff ff       	jmp    80105cea <alltraps>

80106c99 <vector233>:
.globl vector233
vector233:
  pushl $0
80106c99:	6a 00                	push   $0x0
  pushl $233
80106c9b:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80106ca0:	e9 45 f0 ff ff       	jmp    80105cea <alltraps>

80106ca5 <vector234>:
.globl vector234
vector234:
  pushl $0
80106ca5:	6a 00                	push   $0x0
  pushl $234
80106ca7:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106cac:	e9 39 f0 ff ff       	jmp    80105cea <alltraps>

80106cb1 <vector235>:
.globl vector235
vector235:
  pushl $0
80106cb1:	6a 00                	push   $0x0
  pushl $235
80106cb3:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106cb8:	e9 2d f0 ff ff       	jmp    80105cea <alltraps>

80106cbd <vector236>:
.globl vector236
vector236:
  pushl $0
80106cbd:	6a 00                	push   $0x0
  pushl $236
80106cbf:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80106cc4:	e9 21 f0 ff ff       	jmp    80105cea <alltraps>

80106cc9 <vector237>:
.globl vector237
vector237:
  pushl $0
80106cc9:	6a 00                	push   $0x0
  pushl $237
80106ccb:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80106cd0:	e9 15 f0 ff ff       	jmp    80105cea <alltraps>

80106cd5 <vector238>:
.globl vector238
vector238:
  pushl $0
80106cd5:	6a 00                	push   $0x0
  pushl $238
80106cd7:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106cdc:	e9 09 f0 ff ff       	jmp    80105cea <alltraps>

80106ce1 <vector239>:
.globl vector239
vector239:
  pushl $0
80106ce1:	6a 00                	push   $0x0
  pushl $239
80106ce3:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106ce8:	e9 fd ef ff ff       	jmp    80105cea <alltraps>

80106ced <vector240>:
.globl vector240
vector240:
  pushl $0
80106ced:	6a 00                	push   $0x0
  pushl $240
80106cef:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80106cf4:	e9 f1 ef ff ff       	jmp    80105cea <alltraps>

80106cf9 <vector241>:
.globl vector241
vector241:
  pushl $0
80106cf9:	6a 00                	push   $0x0
  pushl $241
80106cfb:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80106d00:	e9 e5 ef ff ff       	jmp    80105cea <alltraps>

80106d05 <vector242>:
.globl vector242
vector242:
  pushl $0
80106d05:	6a 00                	push   $0x0
  pushl $242
80106d07:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106d0c:	e9 d9 ef ff ff       	jmp    80105cea <alltraps>

80106d11 <vector243>:
.globl vector243
vector243:
  pushl $0
80106d11:	6a 00                	push   $0x0
  pushl $243
80106d13:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106d18:	e9 cd ef ff ff       	jmp    80105cea <alltraps>

80106d1d <vector244>:
.globl vector244
vector244:
  pushl $0
80106d1d:	6a 00                	push   $0x0
  pushl $244
80106d1f:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80106d24:	e9 c1 ef ff ff       	jmp    80105cea <alltraps>

80106d29 <vector245>:
.globl vector245
vector245:
  pushl $0
80106d29:	6a 00                	push   $0x0
  pushl $245
80106d2b:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106d30:	e9 b5 ef ff ff       	jmp    80105cea <alltraps>

80106d35 <vector246>:
.globl vector246
vector246:
  pushl $0
80106d35:	6a 00                	push   $0x0
  pushl $246
80106d37:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106d3c:	e9 a9 ef ff ff       	jmp    80105cea <alltraps>

80106d41 <vector247>:
.globl vector247
vector247:
  pushl $0
80106d41:	6a 00                	push   $0x0
  pushl $247
80106d43:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106d48:	e9 9d ef ff ff       	jmp    80105cea <alltraps>

80106d4d <vector248>:
.globl vector248
vector248:
  pushl $0
80106d4d:	6a 00                	push   $0x0
  pushl $248
80106d4f:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80106d54:	e9 91 ef ff ff       	jmp    80105cea <alltraps>

80106d59 <vector249>:
.globl vector249
vector249:
  pushl $0
80106d59:	6a 00                	push   $0x0
  pushl $249
80106d5b:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80106d60:	e9 85 ef ff ff       	jmp    80105cea <alltraps>

80106d65 <vector250>:
.globl vector250
vector250:
  pushl $0
80106d65:	6a 00                	push   $0x0
  pushl $250
80106d67:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106d6c:	e9 79 ef ff ff       	jmp    80105cea <alltraps>

80106d71 <vector251>:
.globl vector251
vector251:
  pushl $0
80106d71:	6a 00                	push   $0x0
  pushl $251
80106d73:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106d78:	e9 6d ef ff ff       	jmp    80105cea <alltraps>

80106d7d <vector252>:
.globl vector252
vector252:
  pushl $0
80106d7d:	6a 00                	push   $0x0
  pushl $252
80106d7f:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80106d84:	e9 61 ef ff ff       	jmp    80105cea <alltraps>

80106d89 <vector253>:
.globl vector253
vector253:
  pushl $0
80106d89:	6a 00                	push   $0x0
  pushl $253
80106d8b:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80106d90:	e9 55 ef ff ff       	jmp    80105cea <alltraps>

80106d95 <vector254>:
.globl vector254
vector254:
  pushl $0
80106d95:	6a 00                	push   $0x0
  pushl $254
80106d97:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106d9c:	e9 49 ef ff ff       	jmp    80105cea <alltraps>

80106da1 <vector255>:
.globl vector255
vector255:
  pushl $0
80106da1:	6a 00                	push   $0x0
  pushl $255
80106da3:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106da8:	e9 3d ef ff ff       	jmp    80105cea <alltraps>

80106dad <lgdt>:

struct segdesc;

static inline void
lgdt(struct segdesc *p, int size)
{
80106dad:	55                   	push   %ebp
80106dae:	89 e5                	mov    %esp,%ebp
80106db0:	83 ec 10             	sub    $0x10,%esp
  volatile ushort pd[3];

  pd[0] = size-1;
80106db3:	8b 45 0c             	mov    0xc(%ebp),%eax
80106db6:	83 e8 01             	sub    $0x1,%eax
80106db9:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80106dbd:	8b 45 08             	mov    0x8(%ebp),%eax
80106dc0:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80106dc4:	8b 45 08             	mov    0x8(%ebp),%eax
80106dc7:	c1 e8 10             	shr    $0x10,%eax
80106dca:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106dce:	8d 45 fa             	lea    -0x6(%ebp),%eax
80106dd1:	0f 01 10             	lgdtl  (%eax)
}
80106dd4:	90                   	nop
80106dd5:	c9                   	leave  
80106dd6:	c3                   	ret    

80106dd7 <ltr>:
  asm volatile("lidt (%0)" : : "r" (pd));
}

static inline void
ltr(ushort sel)
{
80106dd7:	55                   	push   %ebp
80106dd8:	89 e5                	mov    %esp,%ebp
80106dda:	83 ec 04             	sub    $0x4,%esp
80106ddd:	8b 45 08             	mov    0x8(%ebp),%eax
80106de0:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  asm volatile("ltr %0" : : "r" (sel));
80106de4:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80106de8:	0f 00 d8             	ltr    %ax
}
80106deb:	90                   	nop
80106dec:	c9                   	leave  
80106ded:	c3                   	ret    

80106dee <loadgs>:
  return eflags;
}

static inline void
loadgs(ushort v)
{
80106dee:	55                   	push   %ebp
80106def:	89 e5                	mov    %esp,%ebp
80106df1:	83 ec 04             	sub    $0x4,%esp
80106df4:	8b 45 08             	mov    0x8(%ebp),%eax
80106df7:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  asm volatile("movw %0, %%gs" : : "r" (v));
80106dfb:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80106dff:	8e e8                	mov    %eax,%gs
}
80106e01:	90                   	nop
80106e02:	c9                   	leave  
80106e03:	c3                   	ret    

80106e04 <lcr3>:
  return val;
}

static inline void
lcr3(uint val) 
{
80106e04:	55                   	push   %ebp
80106e05:	89 e5                	mov    %esp,%ebp
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106e07:	8b 45 08             	mov    0x8(%ebp),%eax
80106e0a:	0f 22 d8             	mov    %eax,%cr3
}
80106e0d:	90                   	nop
80106e0e:	5d                   	pop    %ebp
80106e0f:	c3                   	ret    

80106e10 <v2p>:
#define KERNBASE 0x80000000         // First kernel virtual address
#define KERNLINK (KERNBASE+EXTMEM)  // Address where kernel is linked

#ifndef __ASSEMBLER__

static inline uint v2p(void *a) { return ((uint) (a))  - KERNBASE; }
80106e10:	55                   	push   %ebp
80106e11:	89 e5                	mov    %esp,%ebp
80106e13:	8b 45 08             	mov    0x8(%ebp),%eax
80106e16:	05 00 00 00 80       	add    $0x80000000,%eax
80106e1b:	5d                   	pop    %ebp
80106e1c:	c3                   	ret    

80106e1d <p2v>:
static inline void *p2v(uint a) { return (void *) ((a) + KERNBASE); }
80106e1d:	55                   	push   %ebp
80106e1e:	89 e5                	mov    %esp,%ebp
80106e20:	8b 45 08             	mov    0x8(%ebp),%eax
80106e23:	05 00 00 00 80       	add    $0x80000000,%eax
80106e28:	5d                   	pop    %ebp
80106e29:	c3                   	ret    

80106e2a <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106e2a:	55                   	push   %ebp
80106e2b:	89 e5                	mov    %esp,%ebp
80106e2d:	53                   	push   %ebx
80106e2e:	83 ec 14             	sub    $0x14,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106e31:	e8 1d bb ff ff       	call   80102953 <cpunum>
80106e36:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106e3c:	05 a0 09 11 80       	add    $0x801109a0,%eax
80106e41:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106e44:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106e47:	66 c7 40 78 ff ff    	movw   $0xffff,0x78(%eax)
80106e4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106e50:	66 c7 40 7a 00 00    	movw   $0x0,0x7a(%eax)
80106e56:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106e59:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
80106e5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106e60:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
80106e64:	83 e2 f0             	and    $0xfffffff0,%edx
80106e67:	83 ca 0a             	or     $0xa,%edx
80106e6a:	88 50 7d             	mov    %dl,0x7d(%eax)
80106e6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106e70:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
80106e74:	83 ca 10             	or     $0x10,%edx
80106e77:	88 50 7d             	mov    %dl,0x7d(%eax)
80106e7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106e7d:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
80106e81:	83 e2 9f             	and    $0xffffff9f,%edx
80106e84:	88 50 7d             	mov    %dl,0x7d(%eax)
80106e87:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106e8a:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
80106e8e:	83 ca 80             	or     $0xffffff80,%edx
80106e91:	88 50 7d             	mov    %dl,0x7d(%eax)
80106e94:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106e97:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80106e9b:	83 ca 0f             	or     $0xf,%edx
80106e9e:	88 50 7e             	mov    %dl,0x7e(%eax)
80106ea1:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106ea4:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80106ea8:	83 e2 ef             	and    $0xffffffef,%edx
80106eab:	88 50 7e             	mov    %dl,0x7e(%eax)
80106eae:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106eb1:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80106eb5:	83 e2 df             	and    $0xffffffdf,%edx
80106eb8:	88 50 7e             	mov    %dl,0x7e(%eax)
80106ebb:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106ebe:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80106ec2:	83 ca 40             	or     $0x40,%edx
80106ec5:	88 50 7e             	mov    %dl,0x7e(%eax)
80106ec8:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106ecb:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80106ecf:	83 ca 80             	or     $0xffffff80,%edx
80106ed2:	88 50 7e             	mov    %dl,0x7e(%eax)
80106ed5:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106ed8:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106edc:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106edf:	66 c7 80 80 00 00 00 	movw   $0xffff,0x80(%eax)
80106ee6:	ff ff 
80106ee8:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106eeb:	66 c7 80 82 00 00 00 	movw   $0x0,0x82(%eax)
80106ef2:	00 00 
80106ef4:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106ef7:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
80106efe:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106f01:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
80106f08:	83 e2 f0             	and    $0xfffffff0,%edx
80106f0b:	83 ca 02             	or     $0x2,%edx
80106f0e:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
80106f14:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106f17:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
80106f1e:	83 ca 10             	or     $0x10,%edx
80106f21:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
80106f27:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106f2a:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
80106f31:	83 e2 9f             	and    $0xffffff9f,%edx
80106f34:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
80106f3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106f3d:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
80106f44:	83 ca 80             	or     $0xffffff80,%edx
80106f47:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
80106f4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106f50:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
80106f57:	83 ca 0f             	or     $0xf,%edx
80106f5a:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
80106f60:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106f63:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
80106f6a:	83 e2 ef             	and    $0xffffffef,%edx
80106f6d:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
80106f73:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106f76:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
80106f7d:	83 e2 df             	and    $0xffffffdf,%edx
80106f80:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
80106f86:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106f89:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
80106f90:	83 ca 40             	or     $0x40,%edx
80106f93:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
80106f99:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106f9c:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
80106fa3:	83 ca 80             	or     $0xffffff80,%edx
80106fa6:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
80106fac:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106faf:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106fb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106fb9:	66 c7 80 90 00 00 00 	movw   $0xffff,0x90(%eax)
80106fc0:	ff ff 
80106fc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106fc5:	66 c7 80 92 00 00 00 	movw   $0x0,0x92(%eax)
80106fcc:	00 00 
80106fce:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106fd1:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
80106fd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106fdb:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
80106fe2:	83 e2 f0             	and    $0xfffffff0,%edx
80106fe5:	83 ca 0a             	or     $0xa,%edx
80106fe8:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
80106fee:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106ff1:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
80106ff8:	83 ca 10             	or     $0x10,%edx
80106ffb:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
80107001:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107004:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
8010700b:	83 ca 60             	or     $0x60,%edx
8010700e:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
80107014:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107017:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
8010701e:	83 ca 80             	or     $0xffffff80,%edx
80107021:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
80107027:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010702a:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
80107031:	83 ca 0f             	or     $0xf,%edx
80107034:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
8010703a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010703d:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
80107044:	83 e2 ef             	and    $0xffffffef,%edx
80107047:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
8010704d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107050:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
80107057:	83 e2 df             	and    $0xffffffdf,%edx
8010705a:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
80107060:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107063:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
8010706a:	83 ca 40             	or     $0x40,%edx
8010706d:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
80107073:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107076:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
8010707d:	83 ca 80             	or     $0xffffff80,%edx
80107080:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
80107086:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107089:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80107090:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107093:	66 c7 80 98 00 00 00 	movw   $0xffff,0x98(%eax)
8010709a:	ff ff 
8010709c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010709f:	66 c7 80 9a 00 00 00 	movw   $0x0,0x9a(%eax)
801070a6:	00 00 
801070a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801070ab:	c6 80 9c 00 00 00 00 	movb   $0x0,0x9c(%eax)
801070b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801070b5:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
801070bc:	83 e2 f0             	and    $0xfffffff0,%edx
801070bf:	83 ca 02             	or     $0x2,%edx
801070c2:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
801070c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801070cb:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
801070d2:	83 ca 10             	or     $0x10,%edx
801070d5:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
801070db:	8b 45 f4             	mov    -0xc(%ebp),%eax
801070de:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
801070e5:	83 ca 60             	or     $0x60,%edx
801070e8:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
801070ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
801070f1:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
801070f8:	83 ca 80             	or     $0xffffff80,%edx
801070fb:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
80107101:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107104:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
8010710b:	83 ca 0f             	or     $0xf,%edx
8010710e:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
80107114:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107117:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
8010711e:	83 e2 ef             	and    $0xffffffef,%edx
80107121:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
80107127:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010712a:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
80107131:	83 e2 df             	and    $0xffffffdf,%edx
80107134:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
8010713a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010713d:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
80107144:	83 ca 40             	or     $0x40,%edx
80107147:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
8010714d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107150:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
80107157:	83 ca 80             	or     $0xffffff80,%edx
8010715a:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
80107160:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107163:	c6 80 9f 00 00 00 00 	movb   $0x0,0x9f(%eax)

  // Map cpu, and curproc
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
8010716a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010716d:	05 b4 00 00 00       	add    $0xb4,%eax
80107172:	89 c3                	mov    %eax,%ebx
80107174:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107177:	05 b4 00 00 00       	add    $0xb4,%eax
8010717c:	c1 e8 10             	shr    $0x10,%eax
8010717f:	89 c2                	mov    %eax,%edx
80107181:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107184:	05 b4 00 00 00       	add    $0xb4,%eax
80107189:	c1 e8 18             	shr    $0x18,%eax
8010718c:	89 c1                	mov    %eax,%ecx
8010718e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107191:	66 c7 80 88 00 00 00 	movw   $0x0,0x88(%eax)
80107198:	00 00 
8010719a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010719d:	66 89 98 8a 00 00 00 	mov    %bx,0x8a(%eax)
801071a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
801071a7:	88 90 8c 00 00 00    	mov    %dl,0x8c(%eax)
801071ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
801071b0:	0f b6 90 8d 00 00 00 	movzbl 0x8d(%eax),%edx
801071b7:	83 e2 f0             	and    $0xfffffff0,%edx
801071ba:	83 ca 02             	or     $0x2,%edx
801071bd:	88 90 8d 00 00 00    	mov    %dl,0x8d(%eax)
801071c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801071c6:	0f b6 90 8d 00 00 00 	movzbl 0x8d(%eax),%edx
801071cd:	83 ca 10             	or     $0x10,%edx
801071d0:	88 90 8d 00 00 00    	mov    %dl,0x8d(%eax)
801071d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801071d9:	0f b6 90 8d 00 00 00 	movzbl 0x8d(%eax),%edx
801071e0:	83 e2 9f             	and    $0xffffff9f,%edx
801071e3:	88 90 8d 00 00 00    	mov    %dl,0x8d(%eax)
801071e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801071ec:	0f b6 90 8d 00 00 00 	movzbl 0x8d(%eax),%edx
801071f3:	83 ca 80             	or     $0xffffff80,%edx
801071f6:	88 90 8d 00 00 00    	mov    %dl,0x8d(%eax)
801071fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801071ff:	0f b6 90 8e 00 00 00 	movzbl 0x8e(%eax),%edx
80107206:	83 e2 f0             	and    $0xfffffff0,%edx
80107209:	88 90 8e 00 00 00    	mov    %dl,0x8e(%eax)
8010720f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107212:	0f b6 90 8e 00 00 00 	movzbl 0x8e(%eax),%edx
80107219:	83 e2 ef             	and    $0xffffffef,%edx
8010721c:	88 90 8e 00 00 00    	mov    %dl,0x8e(%eax)
80107222:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107225:	0f b6 90 8e 00 00 00 	movzbl 0x8e(%eax),%edx
8010722c:	83 e2 df             	and    $0xffffffdf,%edx
8010722f:	88 90 8e 00 00 00    	mov    %dl,0x8e(%eax)
80107235:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107238:	0f b6 90 8e 00 00 00 	movzbl 0x8e(%eax),%edx
8010723f:	83 ca 40             	or     $0x40,%edx
80107242:	88 90 8e 00 00 00    	mov    %dl,0x8e(%eax)
80107248:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010724b:	0f b6 90 8e 00 00 00 	movzbl 0x8e(%eax),%edx
80107252:	83 ca 80             	or     $0xffffff80,%edx
80107255:	88 90 8e 00 00 00    	mov    %dl,0x8e(%eax)
8010725b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010725e:	88 88 8f 00 00 00    	mov    %cl,0x8f(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
80107264:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107267:	83 c0 70             	add    $0x70,%eax
8010726a:	83 ec 08             	sub    $0x8,%esp
8010726d:	6a 38                	push   $0x38
8010726f:	50                   	push   %eax
80107270:	e8 38 fb ff ff       	call   80106dad <lgdt>
80107275:	83 c4 10             	add    $0x10,%esp
  loadgs(SEG_KCPU << 3);
80107278:	83 ec 0c             	sub    $0xc,%esp
8010727b:	6a 18                	push   $0x18
8010727d:	e8 6c fb ff ff       	call   80106dee <loadgs>
80107282:	83 c4 10             	add    $0x10,%esp
  
  // Initialize cpu-local storage.
  cpu = c;
80107285:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107288:	65 a3 00 00 00 00    	mov    %eax,%gs:0x0
  proc = 0;
8010728e:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80107295:	00 00 00 00 
}
80107299:	90                   	nop
8010729a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010729d:	c9                   	leave  
8010729e:	c3                   	ret    

8010729f <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010729f:	55                   	push   %ebp
801072a0:	89 e5                	mov    %esp,%ebp
801072a2:	83 ec 18             	sub    $0x18,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801072a5:	8b 45 0c             	mov    0xc(%ebp),%eax
801072a8:	c1 e8 16             	shr    $0x16,%eax
801072ab:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
801072b2:	8b 45 08             	mov    0x8(%ebp),%eax
801072b5:	01 d0                	add    %edx,%eax
801072b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(*pde & PTE_P){
801072ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
801072bd:	8b 00                	mov    (%eax),%eax
801072bf:	83 e0 01             	and    $0x1,%eax
801072c2:	85 c0                	test   %eax,%eax
801072c4:	74 18                	je     801072de <walkpgdir+0x3f>
    pgtab = (pte_t*)p2v(PTE_ADDR(*pde));
801072c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
801072c9:	8b 00                	mov    (%eax),%eax
801072cb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801072d0:	50                   	push   %eax
801072d1:	e8 47 fb ff ff       	call   80106e1d <p2v>
801072d6:	83 c4 04             	add    $0x4,%esp
801072d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
801072dc:	eb 48                	jmp    80107326 <walkpgdir+0x87>
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
801072de:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801072e2:	74 0e                	je     801072f2 <walkpgdir+0x53>
801072e4:	e8 21 b3 ff ff       	call   8010260a <kalloc>
801072e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
801072ec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801072f0:	75 07                	jne    801072f9 <walkpgdir+0x5a>
      return 0;
801072f2:	b8 00 00 00 00       	mov    $0x0,%eax
801072f7:	eb 44                	jmp    8010733d <walkpgdir+0x9e>
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
801072f9:	83 ec 04             	sub    $0x4,%esp
801072fc:	68 00 10 00 00       	push   $0x1000
80107301:	6a 00                	push   $0x0
80107303:	ff 75 f4             	pushl  -0xc(%ebp)
80107306:	e8 64 d5 ff ff       	call   8010486f <memset>
8010730b:	83 c4 10             	add    $0x10,%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table 
    // entries, if necessary.
    *pde = v2p(pgtab) | PTE_P | PTE_W | PTE_U;
8010730e:	83 ec 0c             	sub    $0xc,%esp
80107311:	ff 75 f4             	pushl  -0xc(%ebp)
80107314:	e8 f7 fa ff ff       	call   80106e10 <v2p>
80107319:	83 c4 10             	add    $0x10,%esp
8010731c:	83 c8 07             	or     $0x7,%eax
8010731f:	89 c2                	mov    %eax,%edx
80107321:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107324:	89 10                	mov    %edx,(%eax)
  }
  return &pgtab[PTX(va)];
80107326:	8b 45 0c             	mov    0xc(%ebp),%eax
80107329:	c1 e8 0c             	shr    $0xc,%eax
8010732c:	25 ff 03 00 00       	and    $0x3ff,%eax
80107331:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
80107338:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010733b:	01 d0                	add    %edx,%eax
}
8010733d:	c9                   	leave  
8010733e:	c3                   	ret    

8010733f <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
8010733f:	55                   	push   %ebp
80107340:	89 e5                	mov    %esp,%ebp
80107342:	83 ec 18             	sub    $0x18,%esp
  char *a, *last;
  pte_t *pte;
  
  a = (char*)PGROUNDDOWN((uint)va);
80107345:	8b 45 0c             	mov    0xc(%ebp),%eax
80107348:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010734d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80107350:	8b 55 0c             	mov    0xc(%ebp),%edx
80107353:	8b 45 10             	mov    0x10(%ebp),%eax
80107356:	01 d0                	add    %edx,%eax
80107358:	83 e8 01             	sub    $0x1,%eax
8010735b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107360:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80107363:	83 ec 04             	sub    $0x4,%esp
80107366:	6a 01                	push   $0x1
80107368:	ff 75 f4             	pushl  -0xc(%ebp)
8010736b:	ff 75 08             	pushl  0x8(%ebp)
8010736e:	e8 2c ff ff ff       	call   8010729f <walkpgdir>
80107373:	83 c4 10             	add    $0x10,%esp
80107376:	89 45 ec             	mov    %eax,-0x14(%ebp)
80107379:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
8010737d:	75 07                	jne    80107386 <mappages+0x47>
      return -1;
8010737f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107384:	eb 47                	jmp    801073cd <mappages+0x8e>
    if(*pte & PTE_P)
80107386:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107389:	8b 00                	mov    (%eax),%eax
8010738b:	83 e0 01             	and    $0x1,%eax
8010738e:	85 c0                	test   %eax,%eax
80107390:	74 0d                	je     8010739f <mappages+0x60>
      panic("remap");
80107392:	83 ec 0c             	sub    $0xc,%esp
80107395:	68 94 9d 10 80       	push   $0x80109d94
8010739a:	e8 b0 13 00 00       	call   8010874f <panic>
    *pte = pa | perm | PTE_P;
8010739f:	8b 45 18             	mov    0x18(%ebp),%eax
801073a2:	0b 45 14             	or     0x14(%ebp),%eax
801073a5:	83 c8 01             	or     $0x1,%eax
801073a8:	89 c2                	mov    %eax,%edx
801073aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
801073ad:	89 10                	mov    %edx,(%eax)
    if(a == last)
801073af:	8b 45 f4             	mov    -0xc(%ebp),%eax
801073b2:	3b 45 f0             	cmp    -0x10(%ebp),%eax
801073b5:	74 10                	je     801073c7 <mappages+0x88>
      break;
    a += PGSIZE;
801073b7:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    pa += PGSIZE;
801073be:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
  }
801073c5:	eb 9c                	jmp    80107363 <mappages+0x24>
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
    if(a == last)
      break;
801073c7:	90                   	nop
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
801073c8:	b8 00 00 00 00       	mov    $0x0,%eax
}
801073cd:	c9                   	leave  
801073ce:	c3                   	ret    

801073cf <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
801073cf:	55                   	push   %ebp
801073d0:	89 e5                	mov    %esp,%ebp
801073d2:	53                   	push   %ebx
801073d3:	83 ec 14             	sub    $0x14,%esp
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
801073d6:	e8 2f b2 ff ff       	call   8010260a <kalloc>
801073db:	89 45 f0             	mov    %eax,-0x10(%ebp)
801073de:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801073e2:	75 0a                	jne    801073ee <setupkvm+0x1f>
    return 0;
801073e4:	b8 00 00 00 00       	mov    $0x0,%eax
801073e9:	e9 8e 00 00 00       	jmp    8010747c <setupkvm+0xad>
  memset(pgdir, 0, PGSIZE);
801073ee:	83 ec 04             	sub    $0x4,%esp
801073f1:	68 00 10 00 00       	push   $0x1000
801073f6:	6a 00                	push   $0x0
801073f8:	ff 75 f0             	pushl  -0x10(%ebp)
801073fb:	e8 6f d4 ff ff       	call   8010486f <memset>
80107400:	83 c4 10             	add    $0x10,%esp
  if (p2v(PHYSTOP) > (void*)DEVSPACE)
80107403:	83 ec 0c             	sub    $0xc,%esp
80107406:	68 00 00 00 0e       	push   $0xe000000
8010740b:	e8 0d fa ff ff       	call   80106e1d <p2v>
80107410:	83 c4 10             	add    $0x10,%esp
80107413:	3d 00 00 00 fe       	cmp    $0xfe000000,%eax
80107418:	76 0d                	jbe    80107427 <setupkvm+0x58>
    panic("PHYSTOP too high");
8010741a:	83 ec 0c             	sub    $0xc,%esp
8010741d:	68 9a 9d 10 80       	push   $0x80109d9a
80107422:	e8 28 13 00 00       	call   8010874f <panic>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107427:	c7 45 f4 a0 c4 10 80 	movl   $0x8010c4a0,-0xc(%ebp)
8010742e:	eb 40                	jmp    80107470 <setupkvm+0xa1>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start, 
80107430:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107433:	8b 48 0c             	mov    0xc(%eax),%ecx
                (uint)k->phys_start, k->perm) < 0)
80107436:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107439:	8b 50 04             	mov    0x4(%eax),%edx
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (p2v(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start, 
8010743c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010743f:	8b 58 08             	mov    0x8(%eax),%ebx
80107442:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107445:	8b 40 04             	mov    0x4(%eax),%eax
80107448:	29 c3                	sub    %eax,%ebx
8010744a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010744d:	8b 00                	mov    (%eax),%eax
8010744f:	83 ec 0c             	sub    $0xc,%esp
80107452:	51                   	push   %ecx
80107453:	52                   	push   %edx
80107454:	53                   	push   %ebx
80107455:	50                   	push   %eax
80107456:	ff 75 f0             	pushl  -0x10(%ebp)
80107459:	e8 e1 fe ff ff       	call   8010733f <mappages>
8010745e:	83 c4 20             	add    $0x20,%esp
80107461:	85 c0                	test   %eax,%eax
80107463:	79 07                	jns    8010746c <setupkvm+0x9d>
                (uint)k->phys_start, k->perm) < 0)
      return 0;
80107465:	b8 00 00 00 00       	mov    $0x0,%eax
8010746a:	eb 10                	jmp    8010747c <setupkvm+0xad>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (p2v(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
8010746c:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
80107470:	81 7d f4 e0 c4 10 80 	cmpl   $0x8010c4e0,-0xc(%ebp)
80107477:	72 b7                	jb     80107430 <setupkvm+0x61>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start, 
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
80107479:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
8010747c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010747f:	c9                   	leave  
80107480:	c3                   	ret    

80107481 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80107481:	55                   	push   %ebp
80107482:	89 e5                	mov    %esp,%ebp
80107484:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107487:	e8 43 ff ff ff       	call   801073cf <setupkvm>
8010748c:	a3 78 37 11 80       	mov    %eax,0x80113778
  switchkvm();
80107491:	e8 03 00 00 00       	call   80107499 <switchkvm>
}
80107496:	90                   	nop
80107497:	c9                   	leave  
80107498:	c3                   	ret    

80107499 <switchkvm>:

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80107499:	55                   	push   %ebp
8010749a:	89 e5                	mov    %esp,%ebp
  lcr3(v2p(kpgdir));   // switch to the kernel page table
8010749c:	a1 78 37 11 80       	mov    0x80113778,%eax
801074a1:	50                   	push   %eax
801074a2:	e8 69 f9 ff ff       	call   80106e10 <v2p>
801074a7:	83 c4 04             	add    $0x4,%esp
801074aa:	50                   	push   %eax
801074ab:	e8 54 f9 ff ff       	call   80106e04 <lcr3>
801074b0:	83 c4 04             	add    $0x4,%esp
}
801074b3:	90                   	nop
801074b4:	c9                   	leave  
801074b5:	c3                   	ret    

801074b6 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
801074b6:	55                   	push   %ebp
801074b7:	89 e5                	mov    %esp,%ebp
801074b9:	56                   	push   %esi
801074ba:	53                   	push   %ebx
  pushcli();
801074bb:	e8 a9 d2 ff ff       	call   80104769 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
801074c0:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801074c6:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801074cd:	83 c2 08             	add    $0x8,%edx
801074d0:	89 d6                	mov    %edx,%esi
801074d2:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801074d9:	83 c2 08             	add    $0x8,%edx
801074dc:	c1 ea 10             	shr    $0x10,%edx
801074df:	89 d3                	mov    %edx,%ebx
801074e1:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801074e8:	83 c2 08             	add    $0x8,%edx
801074eb:	c1 ea 18             	shr    $0x18,%edx
801074ee:	89 d1                	mov    %edx,%ecx
801074f0:	66 c7 80 a0 00 00 00 	movw   $0x67,0xa0(%eax)
801074f7:	67 00 
801074f9:	66 89 b0 a2 00 00 00 	mov    %si,0xa2(%eax)
80107500:	88 98 a4 00 00 00    	mov    %bl,0xa4(%eax)
80107506:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
8010750d:	83 e2 f0             	and    $0xfffffff0,%edx
80107510:	83 ca 09             	or     $0x9,%edx
80107513:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
80107519:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
80107520:	83 ca 10             	or     $0x10,%edx
80107523:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
80107529:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
80107530:	83 e2 9f             	and    $0xffffff9f,%edx
80107533:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
80107539:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
80107540:	83 ca 80             	or     $0xffffff80,%edx
80107543:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
80107549:	0f b6 90 a6 00 00 00 	movzbl 0xa6(%eax),%edx
80107550:	83 e2 f0             	and    $0xfffffff0,%edx
80107553:	88 90 a6 00 00 00    	mov    %dl,0xa6(%eax)
80107559:	0f b6 90 a6 00 00 00 	movzbl 0xa6(%eax),%edx
80107560:	83 e2 ef             	and    $0xffffffef,%edx
80107563:	88 90 a6 00 00 00    	mov    %dl,0xa6(%eax)
80107569:	0f b6 90 a6 00 00 00 	movzbl 0xa6(%eax),%edx
80107570:	83 e2 df             	and    $0xffffffdf,%edx
80107573:	88 90 a6 00 00 00    	mov    %dl,0xa6(%eax)
80107579:	0f b6 90 a6 00 00 00 	movzbl 0xa6(%eax),%edx
80107580:	83 ca 40             	or     $0x40,%edx
80107583:	88 90 a6 00 00 00    	mov    %dl,0xa6(%eax)
80107589:	0f b6 90 a6 00 00 00 	movzbl 0xa6(%eax),%edx
80107590:	83 e2 7f             	and    $0x7f,%edx
80107593:	88 90 a6 00 00 00    	mov    %dl,0xa6(%eax)
80107599:	88 88 a7 00 00 00    	mov    %cl,0xa7(%eax)
  cpu->gdt[SEG_TSS].s = 0;
8010759f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801075a5:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
801075ac:	83 e2 ef             	and    $0xffffffef,%edx
801075af:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
  cpu->ts.ss0 = SEG_KDATA << 3;
801075b5:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801075bb:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
801075c1:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801075c7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801075ce:	8b 52 08             	mov    0x8(%edx),%edx
801075d1:	81 c2 00 10 00 00    	add    $0x1000,%edx
801075d7:	89 50 0c             	mov    %edx,0xc(%eax)
  ltr(SEG_TSS << 3);
801075da:	83 ec 0c             	sub    $0xc,%esp
801075dd:	6a 30                	push   $0x30
801075df:	e8 f3 f7 ff ff       	call   80106dd7 <ltr>
801075e4:	83 c4 10             	add    $0x10,%esp
  if(p->pgdir == 0)
801075e7:	8b 45 08             	mov    0x8(%ebp),%eax
801075ea:	8b 40 04             	mov    0x4(%eax),%eax
801075ed:	85 c0                	test   %eax,%eax
801075ef:	75 0d                	jne    801075fe <switchuvm+0x148>
    panic("switchuvm: no pgdir");
801075f1:	83 ec 0c             	sub    $0xc,%esp
801075f4:	68 ab 9d 10 80       	push   $0x80109dab
801075f9:	e8 51 11 00 00       	call   8010874f <panic>
  lcr3(v2p(p->pgdir));  // switch to new address space
801075fe:	8b 45 08             	mov    0x8(%ebp),%eax
80107601:	8b 40 04             	mov    0x4(%eax),%eax
80107604:	83 ec 0c             	sub    $0xc,%esp
80107607:	50                   	push   %eax
80107608:	e8 03 f8 ff ff       	call   80106e10 <v2p>
8010760d:	83 c4 10             	add    $0x10,%esp
80107610:	83 ec 0c             	sub    $0xc,%esp
80107613:	50                   	push   %eax
80107614:	e8 eb f7 ff ff       	call   80106e04 <lcr3>
80107619:	83 c4 10             	add    $0x10,%esp
  popcli();
8010761c:	e8 8d d1 ff ff       	call   801047ae <popcli>
}
80107621:	90                   	nop
80107622:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107625:	5b                   	pop    %ebx
80107626:	5e                   	pop    %esi
80107627:	5d                   	pop    %ebp
80107628:	c3                   	ret    

80107629 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80107629:	55                   	push   %ebp
8010762a:	89 e5                	mov    %esp,%ebp
8010762c:	83 ec 18             	sub    $0x18,%esp
  char *mem;
  
  if(sz >= PGSIZE)
8010762f:	81 7d 10 ff 0f 00 00 	cmpl   $0xfff,0x10(%ebp)
80107636:	76 0d                	jbe    80107645 <inituvm+0x1c>
    panic("inituvm: more than a page");
80107638:	83 ec 0c             	sub    $0xc,%esp
8010763b:	68 bf 9d 10 80       	push   $0x80109dbf
80107640:	e8 0a 11 00 00       	call   8010874f <panic>
  mem = kalloc();
80107645:	e8 c0 af ff ff       	call   8010260a <kalloc>
8010764a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(mem, 0, PGSIZE);
8010764d:	83 ec 04             	sub    $0x4,%esp
80107650:	68 00 10 00 00       	push   $0x1000
80107655:	6a 00                	push   $0x0
80107657:	ff 75 f4             	pushl  -0xc(%ebp)
8010765a:	e8 10 d2 ff ff       	call   8010486f <memset>
8010765f:	83 c4 10             	add    $0x10,%esp
  mappages(pgdir, 0, PGSIZE, v2p(mem), PTE_W|PTE_U);
80107662:	83 ec 0c             	sub    $0xc,%esp
80107665:	ff 75 f4             	pushl  -0xc(%ebp)
80107668:	e8 a3 f7 ff ff       	call   80106e10 <v2p>
8010766d:	83 c4 10             	add    $0x10,%esp
80107670:	83 ec 0c             	sub    $0xc,%esp
80107673:	6a 06                	push   $0x6
80107675:	50                   	push   %eax
80107676:	68 00 10 00 00       	push   $0x1000
8010767b:	6a 00                	push   $0x0
8010767d:	ff 75 08             	pushl  0x8(%ebp)
80107680:	e8 ba fc ff ff       	call   8010733f <mappages>
80107685:	83 c4 20             	add    $0x20,%esp
  memmove(mem, init, sz);
80107688:	83 ec 04             	sub    $0x4,%esp
8010768b:	ff 75 10             	pushl  0x10(%ebp)
8010768e:	ff 75 0c             	pushl  0xc(%ebp)
80107691:	ff 75 f4             	pushl  -0xc(%ebp)
80107694:	e8 95 d2 ff ff       	call   8010492e <memmove>
80107699:	83 c4 10             	add    $0x10,%esp
}
8010769c:	90                   	nop
8010769d:	c9                   	leave  
8010769e:	c3                   	ret    

8010769f <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
8010769f:	55                   	push   %ebp
801076a0:	89 e5                	mov    %esp,%ebp
801076a2:	53                   	push   %ebx
801076a3:	83 ec 14             	sub    $0x14,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
801076a6:	8b 45 0c             	mov    0xc(%ebp),%eax
801076a9:	25 ff 0f 00 00       	and    $0xfff,%eax
801076ae:	85 c0                	test   %eax,%eax
801076b0:	74 0d                	je     801076bf <loaduvm+0x20>
    panic("loaduvm: addr must be page aligned");
801076b2:	83 ec 0c             	sub    $0xc,%esp
801076b5:	68 dc 9d 10 80       	push   $0x80109ddc
801076ba:	e8 90 10 00 00       	call   8010874f <panic>
  for(i = 0; i < sz; i += PGSIZE){
801076bf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801076c6:	e9 95 00 00 00       	jmp    80107760 <loaduvm+0xc1>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
801076cb:	8b 55 0c             	mov    0xc(%ebp),%edx
801076ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076d1:	01 d0                	add    %edx,%eax
801076d3:	83 ec 04             	sub    $0x4,%esp
801076d6:	6a 00                	push   $0x0
801076d8:	50                   	push   %eax
801076d9:	ff 75 08             	pushl  0x8(%ebp)
801076dc:	e8 be fb ff ff       	call   8010729f <walkpgdir>
801076e1:	83 c4 10             	add    $0x10,%esp
801076e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
801076e7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
801076eb:	75 0d                	jne    801076fa <loaduvm+0x5b>
      panic("loaduvm: address should exist");
801076ed:	83 ec 0c             	sub    $0xc,%esp
801076f0:	68 ff 9d 10 80       	push   $0x80109dff
801076f5:	e8 55 10 00 00       	call   8010874f <panic>
    pa = PTE_ADDR(*pte);
801076fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
801076fd:	8b 00                	mov    (%eax),%eax
801076ff:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107704:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(sz - i < PGSIZE)
80107707:	8b 45 18             	mov    0x18(%ebp),%eax
8010770a:	2b 45 f4             	sub    -0xc(%ebp),%eax
8010770d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
80107712:	77 0b                	ja     8010771f <loaduvm+0x80>
      n = sz - i;
80107714:	8b 45 18             	mov    0x18(%ebp),%eax
80107717:	2b 45 f4             	sub    -0xc(%ebp),%eax
8010771a:	89 45 f0             	mov    %eax,-0x10(%ebp)
8010771d:	eb 07                	jmp    80107726 <loaduvm+0x87>
    else
      n = PGSIZE;
8010771f:	c7 45 f0 00 10 00 00 	movl   $0x1000,-0x10(%ebp)
    if(readi(ip, p2v(pa), offset+i, n) != n)
80107726:	8b 55 14             	mov    0x14(%ebp),%edx
80107729:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010772c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
8010772f:	83 ec 0c             	sub    $0xc,%esp
80107732:	ff 75 e8             	pushl  -0x18(%ebp)
80107735:	e8 e3 f6 ff ff       	call   80106e1d <p2v>
8010773a:	83 c4 10             	add    $0x10,%esp
8010773d:	ff 75 f0             	pushl  -0x10(%ebp)
80107740:	53                   	push   %ebx
80107741:	50                   	push   %eax
80107742:	ff 75 10             	pushl  0x10(%ebp)
80107745:	e8 98 9f ff ff       	call   801016e2 <readi>
8010774a:	83 c4 10             	add    $0x10,%esp
8010774d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80107750:	74 07                	je     80107759 <loaduvm+0xba>
      return -1;
80107752:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107757:	eb 18                	jmp    80107771 <loaduvm+0xd2>
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80107759:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
80107760:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107763:	3b 45 18             	cmp    0x18(%ebp),%eax
80107766:	0f 82 5f ff ff ff    	jb     801076cb <loaduvm+0x2c>
    else
      n = PGSIZE;
    if(readi(ip, p2v(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
8010776c:	b8 00 00 00 00       	mov    $0x0,%eax
}
80107771:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107774:	c9                   	leave  
80107775:	c3                   	ret    

80107776 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80107776:	55                   	push   %ebp
80107777:	89 e5                	mov    %esp,%ebp
80107779:	83 ec 18             	sub    $0x18,%esp
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
8010777c:	8b 45 10             	mov    0x10(%ebp),%eax
8010777f:	85 c0                	test   %eax,%eax
80107781:	79 0a                	jns    8010778d <allocuvm+0x17>
    return 0;
80107783:	b8 00 00 00 00       	mov    $0x0,%eax
80107788:	e9 b0 00 00 00       	jmp    8010783d <allocuvm+0xc7>
  if(newsz < oldsz)
8010778d:	8b 45 10             	mov    0x10(%ebp),%eax
80107790:	3b 45 0c             	cmp    0xc(%ebp),%eax
80107793:	73 08                	jae    8010779d <allocuvm+0x27>
    return oldsz;
80107795:	8b 45 0c             	mov    0xc(%ebp),%eax
80107798:	e9 a0 00 00 00       	jmp    8010783d <allocuvm+0xc7>

  a = PGROUNDUP(oldsz);
8010779d:	8b 45 0c             	mov    0xc(%ebp),%eax
801077a0:	05 ff 0f 00 00       	add    $0xfff,%eax
801077a5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801077aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(; a < newsz; a += PGSIZE){
801077ad:	eb 7f                	jmp    8010782e <allocuvm+0xb8>
    mem = kalloc();
801077af:	e8 56 ae ff ff       	call   8010260a <kalloc>
801077b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(mem == 0){
801077b7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801077bb:	75 2b                	jne    801077e8 <allocuvm+0x72>
      cprintf("allocuvm out of memory\n");
801077bd:	83 ec 0c             	sub    $0xc,%esp
801077c0:	68 1d 9e 10 80       	push   $0x80109e1d
801077c5:	e8 db 0b 00 00       	call   801083a5 <cprintf>
801077ca:	83 c4 10             	add    $0x10,%esp
      deallocuvm(pgdir, newsz, oldsz);
801077cd:	83 ec 04             	sub    $0x4,%esp
801077d0:	ff 75 0c             	pushl  0xc(%ebp)
801077d3:	ff 75 10             	pushl  0x10(%ebp)
801077d6:	ff 75 08             	pushl  0x8(%ebp)
801077d9:	e8 61 00 00 00       	call   8010783f <deallocuvm>
801077de:	83 c4 10             	add    $0x10,%esp
      return 0;
801077e1:	b8 00 00 00 00       	mov    $0x0,%eax
801077e6:	eb 55                	jmp    8010783d <allocuvm+0xc7>
    }
    memset(mem, 0, PGSIZE);
801077e8:	83 ec 04             	sub    $0x4,%esp
801077eb:	68 00 10 00 00       	push   $0x1000
801077f0:	6a 00                	push   $0x0
801077f2:	ff 75 f0             	pushl  -0x10(%ebp)
801077f5:	e8 75 d0 ff ff       	call   8010486f <memset>
801077fa:	83 c4 10             	add    $0x10,%esp
    mappages(pgdir, (char*)a, PGSIZE, v2p(mem), PTE_W|PTE_U);
801077fd:	83 ec 0c             	sub    $0xc,%esp
80107800:	ff 75 f0             	pushl  -0x10(%ebp)
80107803:	e8 08 f6 ff ff       	call   80106e10 <v2p>
80107808:	83 c4 10             	add    $0x10,%esp
8010780b:	89 c2                	mov    %eax,%edx
8010780d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107810:	83 ec 0c             	sub    $0xc,%esp
80107813:	6a 06                	push   $0x6
80107815:	52                   	push   %edx
80107816:	68 00 10 00 00       	push   $0x1000
8010781b:	50                   	push   %eax
8010781c:	ff 75 08             	pushl  0x8(%ebp)
8010781f:	e8 1b fb ff ff       	call   8010733f <mappages>
80107824:	83 c4 20             	add    $0x20,%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80107827:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
8010782e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107831:	3b 45 10             	cmp    0x10(%ebp),%eax
80107834:	0f 82 75 ff ff ff    	jb     801077af <allocuvm+0x39>
      return 0;
    }
    memset(mem, 0, PGSIZE);
    mappages(pgdir, (char*)a, PGSIZE, v2p(mem), PTE_W|PTE_U);
  }
  return newsz;
8010783a:	8b 45 10             	mov    0x10(%ebp),%eax
}
8010783d:	c9                   	leave  
8010783e:	c3                   	ret    

8010783f <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
8010783f:	55                   	push   %ebp
80107840:	89 e5                	mov    %esp,%ebp
80107842:	83 ec 18             	sub    $0x18,%esp
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80107845:	8b 45 10             	mov    0x10(%ebp),%eax
80107848:	3b 45 0c             	cmp    0xc(%ebp),%eax
8010784b:	72 08                	jb     80107855 <deallocuvm+0x16>
    return oldsz;
8010784d:	8b 45 0c             	mov    0xc(%ebp),%eax
80107850:	e9 a5 00 00 00       	jmp    801078fa <deallocuvm+0xbb>

  a = PGROUNDUP(newsz);
80107855:	8b 45 10             	mov    0x10(%ebp),%eax
80107858:	05 ff 0f 00 00       	add    $0xfff,%eax
8010785d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107862:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80107865:	e9 81 00 00 00       	jmp    801078eb <deallocuvm+0xac>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010786a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010786d:	83 ec 04             	sub    $0x4,%esp
80107870:	6a 00                	push   $0x0
80107872:	50                   	push   %eax
80107873:	ff 75 08             	pushl  0x8(%ebp)
80107876:	e8 24 fa ff ff       	call   8010729f <walkpgdir>
8010787b:	83 c4 10             	add    $0x10,%esp
8010787e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(!pte)
80107881:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80107885:	75 09                	jne    80107890 <deallocuvm+0x51>
      a += (NPTENTRIES - 1) * PGSIZE;
80107887:	81 45 f4 00 f0 3f 00 	addl   $0x3ff000,-0xc(%ebp)
8010788e:	eb 54                	jmp    801078e4 <deallocuvm+0xa5>
    else if((*pte & PTE_P) != 0){
80107890:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107893:	8b 00                	mov    (%eax),%eax
80107895:	83 e0 01             	and    $0x1,%eax
80107898:	85 c0                	test   %eax,%eax
8010789a:	74 48                	je     801078e4 <deallocuvm+0xa5>
      pa = PTE_ADDR(*pte);
8010789c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010789f:	8b 00                	mov    (%eax),%eax
801078a1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801078a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
      if(pa == 0)
801078a9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
801078ad:	75 0d                	jne    801078bc <deallocuvm+0x7d>
        panic("kfree");
801078af:	83 ec 0c             	sub    $0xc,%esp
801078b2:	68 35 9e 10 80       	push   $0x80109e35
801078b7:	e8 93 0e 00 00       	call   8010874f <panic>
      char *v = p2v(pa);
801078bc:	83 ec 0c             	sub    $0xc,%esp
801078bf:	ff 75 ec             	pushl  -0x14(%ebp)
801078c2:	e8 56 f5 ff ff       	call   80106e1d <p2v>
801078c7:	83 c4 10             	add    $0x10,%esp
801078ca:	89 45 e8             	mov    %eax,-0x18(%ebp)
      kfree(v);
801078cd:	83 ec 0c             	sub    $0xc,%esp
801078d0:	ff 75 e8             	pushl  -0x18(%ebp)
801078d3:	e8 95 ac ff ff       	call   8010256d <kfree>
801078d8:	83 c4 10             	add    $0x10,%esp
      *pte = 0;
801078db:	8b 45 f0             	mov    -0x10(%ebp),%eax
801078de:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801078e4:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
801078eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078ee:	3b 45 0c             	cmp    0xc(%ebp),%eax
801078f1:	0f 82 73 ff ff ff    	jb     8010786a <deallocuvm+0x2b>
      char *v = p2v(pa);
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
801078f7:	8b 45 10             	mov    0x10(%ebp),%eax
}
801078fa:	c9                   	leave  
801078fb:	c3                   	ret    

801078fc <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
801078fc:	55                   	push   %ebp
801078fd:	89 e5                	mov    %esp,%ebp
801078ff:	83 ec 18             	sub    $0x18,%esp
  uint i;

  if(pgdir == 0)
80107902:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80107906:	75 0d                	jne    80107915 <freevm+0x19>
    panic("freevm: no pgdir");
80107908:	83 ec 0c             	sub    $0xc,%esp
8010790b:	68 3b 9e 10 80       	push   $0x80109e3b
80107910:	e8 3a 0e 00 00       	call   8010874f <panic>
  deallocuvm(pgdir, KERNBASE, 0);
80107915:	83 ec 04             	sub    $0x4,%esp
80107918:	6a 00                	push   $0x0
8010791a:	68 00 00 00 80       	push   $0x80000000
8010791f:	ff 75 08             	pushl  0x8(%ebp)
80107922:	e8 18 ff ff ff       	call   8010783f <deallocuvm>
80107927:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
8010792a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80107931:	eb 4f                	jmp    80107982 <freevm+0x86>
    if(pgdir[i] & PTE_P){
80107933:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107936:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
8010793d:	8b 45 08             	mov    0x8(%ebp),%eax
80107940:	01 d0                	add    %edx,%eax
80107942:	8b 00                	mov    (%eax),%eax
80107944:	83 e0 01             	and    $0x1,%eax
80107947:	85 c0                	test   %eax,%eax
80107949:	74 33                	je     8010797e <freevm+0x82>
      char * v = p2v(PTE_ADDR(pgdir[i]));
8010794b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010794e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
80107955:	8b 45 08             	mov    0x8(%ebp),%eax
80107958:	01 d0                	add    %edx,%eax
8010795a:	8b 00                	mov    (%eax),%eax
8010795c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107961:	83 ec 0c             	sub    $0xc,%esp
80107964:	50                   	push   %eax
80107965:	e8 b3 f4 ff ff       	call   80106e1d <p2v>
8010796a:	83 c4 10             	add    $0x10,%esp
8010796d:	89 45 f0             	mov    %eax,-0x10(%ebp)
      kfree(v);
80107970:	83 ec 0c             	sub    $0xc,%esp
80107973:	ff 75 f0             	pushl  -0x10(%ebp)
80107976:	e8 f2 ab ff ff       	call   8010256d <kfree>
8010797b:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
8010797e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80107982:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
80107989:	76 a8                	jbe    80107933 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = p2v(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
8010798b:	83 ec 0c             	sub    $0xc,%esp
8010798e:	ff 75 08             	pushl  0x8(%ebp)
80107991:	e8 d7 ab ff ff       	call   8010256d <kfree>
80107996:	83 c4 10             	add    $0x10,%esp
}
80107999:	90                   	nop
8010799a:	c9                   	leave  
8010799b:	c3                   	ret    

8010799c <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
8010799c:	55                   	push   %ebp
8010799d:	89 e5                	mov    %esp,%ebp
8010799f:	83 ec 18             	sub    $0x18,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801079a2:	83 ec 04             	sub    $0x4,%esp
801079a5:	6a 00                	push   $0x0
801079a7:	ff 75 0c             	pushl  0xc(%ebp)
801079aa:	ff 75 08             	pushl  0x8(%ebp)
801079ad:	e8 ed f8 ff ff       	call   8010729f <walkpgdir>
801079b2:	83 c4 10             	add    $0x10,%esp
801079b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pte == 0)
801079b8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801079bc:	75 0d                	jne    801079cb <clearpteu+0x2f>
    panic("clearpteu");
801079be:	83 ec 0c             	sub    $0xc,%esp
801079c1:	68 4c 9e 10 80       	push   $0x80109e4c
801079c6:	e8 84 0d 00 00       	call   8010874f <panic>
  *pte &= ~PTE_U;
801079cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079ce:	8b 00                	mov    (%eax),%eax
801079d0:	83 e0 fb             	and    $0xfffffffb,%eax
801079d3:	89 c2                	mov    %eax,%edx
801079d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079d8:	89 10                	mov    %edx,(%eax)
}
801079da:	90                   	nop
801079db:	c9                   	leave  
801079dc:	c3                   	ret    

801079dd <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801079dd:	55                   	push   %ebp
801079de:	89 e5                	mov    %esp,%ebp
801079e0:	83 ec 28             	sub    $0x28,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i;
  char *mem;

  if((d = setupkvm()) == 0)
801079e3:	e8 e7 f9 ff ff       	call   801073cf <setupkvm>
801079e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
801079eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801079ef:	75 0a                	jne    801079fb <copyuvm+0x1e>
    return 0;
801079f1:	b8 00 00 00 00       	mov    $0x0,%eax
801079f6:	e9 e9 00 00 00       	jmp    80107ae4 <copyuvm+0x107>
  for(i = 0; i < sz; i += PGSIZE){
801079fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80107a02:	e9 b5 00 00 00       	jmp    80107abc <copyuvm+0xdf>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107a07:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a0a:	83 ec 04             	sub    $0x4,%esp
80107a0d:	6a 00                	push   $0x0
80107a0f:	50                   	push   %eax
80107a10:	ff 75 08             	pushl  0x8(%ebp)
80107a13:	e8 87 f8 ff ff       	call   8010729f <walkpgdir>
80107a18:	83 c4 10             	add    $0x10,%esp
80107a1b:	89 45 ec             	mov    %eax,-0x14(%ebp)
80107a1e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80107a22:	75 0d                	jne    80107a31 <copyuvm+0x54>
      panic("copyuvm: pte should exist");
80107a24:	83 ec 0c             	sub    $0xc,%esp
80107a27:	68 56 9e 10 80       	push   $0x80109e56
80107a2c:	e8 1e 0d 00 00       	call   8010874f <panic>
    if(!(*pte & PTE_P))
80107a31:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107a34:	8b 00                	mov    (%eax),%eax
80107a36:	83 e0 01             	and    $0x1,%eax
80107a39:	85 c0                	test   %eax,%eax
80107a3b:	75 0d                	jne    80107a4a <copyuvm+0x6d>
      panic("copyuvm: page not present");
80107a3d:	83 ec 0c             	sub    $0xc,%esp
80107a40:	68 70 9e 10 80       	push   $0x80109e70
80107a45:	e8 05 0d 00 00       	call   8010874f <panic>
    pa = PTE_ADDR(*pte);
80107a4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107a4d:	8b 00                	mov    (%eax),%eax
80107a4f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107a54:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if((mem = kalloc()) == 0)
80107a57:	e8 ae ab ff ff       	call   8010260a <kalloc>
80107a5c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80107a5f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80107a63:	74 68                	je     80107acd <copyuvm+0xf0>
      goto bad;
    memmove(mem, (char*)p2v(pa), PGSIZE);
80107a65:	83 ec 0c             	sub    $0xc,%esp
80107a68:	ff 75 e8             	pushl  -0x18(%ebp)
80107a6b:	e8 ad f3 ff ff       	call   80106e1d <p2v>
80107a70:	83 c4 10             	add    $0x10,%esp
80107a73:	83 ec 04             	sub    $0x4,%esp
80107a76:	68 00 10 00 00       	push   $0x1000
80107a7b:	50                   	push   %eax
80107a7c:	ff 75 e4             	pushl  -0x1c(%ebp)
80107a7f:	e8 aa ce ff ff       	call   8010492e <memmove>
80107a84:	83 c4 10             	add    $0x10,%esp
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), PTE_W|PTE_U) < 0)
80107a87:	83 ec 0c             	sub    $0xc,%esp
80107a8a:	ff 75 e4             	pushl  -0x1c(%ebp)
80107a8d:	e8 7e f3 ff ff       	call   80106e10 <v2p>
80107a92:	83 c4 10             	add    $0x10,%esp
80107a95:	89 c2                	mov    %eax,%edx
80107a97:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a9a:	83 ec 0c             	sub    $0xc,%esp
80107a9d:	6a 06                	push   $0x6
80107a9f:	52                   	push   %edx
80107aa0:	68 00 10 00 00       	push   $0x1000
80107aa5:	50                   	push   %eax
80107aa6:	ff 75 f0             	pushl  -0x10(%ebp)
80107aa9:	e8 91 f8 ff ff       	call   8010733f <mappages>
80107aae:	83 c4 20             	add    $0x20,%esp
80107ab1:	85 c0                	test   %eax,%eax
80107ab3:	78 1b                	js     80107ad0 <copyuvm+0xf3>
  uint pa, i;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107ab5:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
80107abc:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107abf:	3b 45 0c             	cmp    0xc(%ebp),%eax
80107ac2:	0f 82 3f ff ff ff    	jb     80107a07 <copyuvm+0x2a>
      goto bad;
    memmove(mem, (char*)p2v(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), PTE_W|PTE_U) < 0)
      goto bad;
  }
  return d;
80107ac8:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107acb:	eb 17                	jmp    80107ae4 <copyuvm+0x107>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
80107acd:	90                   	nop
80107ace:	eb 01                	jmp    80107ad1 <copyuvm+0xf4>
    memmove(mem, (char*)p2v(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), PTE_W|PTE_U) < 0)
      goto bad;
80107ad0:	90                   	nop
  }
  return d;

bad:
  freevm(d);
80107ad1:	83 ec 0c             	sub    $0xc,%esp
80107ad4:	ff 75 f0             	pushl  -0x10(%ebp)
80107ad7:	e8 20 fe ff ff       	call   801078fc <freevm>
80107adc:	83 c4 10             	add    $0x10,%esp
  return 0;
80107adf:	b8 00 00 00 00       	mov    $0x0,%eax
}
80107ae4:	c9                   	leave  
80107ae5:	c3                   	ret    

80107ae6 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107ae6:	55                   	push   %ebp
80107ae7:	89 e5                	mov    %esp,%ebp
80107ae9:	83 ec 18             	sub    $0x18,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107aec:	83 ec 04             	sub    $0x4,%esp
80107aef:	6a 00                	push   $0x0
80107af1:	ff 75 0c             	pushl  0xc(%ebp)
80107af4:	ff 75 08             	pushl  0x8(%ebp)
80107af7:	e8 a3 f7 ff ff       	call   8010729f <walkpgdir>
80107afc:	83 c4 10             	add    $0x10,%esp
80107aff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((*pte & PTE_P) == 0)
80107b02:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b05:	8b 00                	mov    (%eax),%eax
80107b07:	83 e0 01             	and    $0x1,%eax
80107b0a:	85 c0                	test   %eax,%eax
80107b0c:	75 07                	jne    80107b15 <uva2ka+0x2f>
    return 0;
80107b0e:	b8 00 00 00 00       	mov    $0x0,%eax
80107b13:	eb 29                	jmp    80107b3e <uva2ka+0x58>
  if((*pte & PTE_U) == 0)
80107b15:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b18:	8b 00                	mov    (%eax),%eax
80107b1a:	83 e0 04             	and    $0x4,%eax
80107b1d:	85 c0                	test   %eax,%eax
80107b1f:	75 07                	jne    80107b28 <uva2ka+0x42>
    return 0;
80107b21:	b8 00 00 00 00       	mov    $0x0,%eax
80107b26:	eb 16                	jmp    80107b3e <uva2ka+0x58>
  return (char*)p2v(PTE_ADDR(*pte));
80107b28:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b2b:	8b 00                	mov    (%eax),%eax
80107b2d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107b32:	83 ec 0c             	sub    $0xc,%esp
80107b35:	50                   	push   %eax
80107b36:	e8 e2 f2 ff ff       	call   80106e1d <p2v>
80107b3b:	83 c4 10             	add    $0x10,%esp
}
80107b3e:	c9                   	leave  
80107b3f:	c3                   	ret    

80107b40 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107b40:	55                   	push   %ebp
80107b41:	89 e5                	mov    %esp,%ebp
80107b43:	83 ec 18             	sub    $0x18,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
80107b46:	8b 45 10             	mov    0x10(%ebp),%eax
80107b49:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(len > 0){
80107b4c:	eb 7f                	jmp    80107bcd <copyout+0x8d>
    va0 = (uint)PGROUNDDOWN(va);
80107b4e:	8b 45 0c             	mov    0xc(%ebp),%eax
80107b51:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107b56:	89 45 ec             	mov    %eax,-0x14(%ebp)
    pa0 = uva2ka(pgdir, (char*)va0);
80107b59:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107b5c:	83 ec 08             	sub    $0x8,%esp
80107b5f:	50                   	push   %eax
80107b60:	ff 75 08             	pushl  0x8(%ebp)
80107b63:	e8 7e ff ff ff       	call   80107ae6 <uva2ka>
80107b68:	83 c4 10             	add    $0x10,%esp
80107b6b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pa0 == 0)
80107b6e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80107b72:	75 07                	jne    80107b7b <copyout+0x3b>
      return -1;
80107b74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107b79:	eb 61                	jmp    80107bdc <copyout+0x9c>
    n = PGSIZE - (va - va0);
80107b7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107b7e:	2b 45 0c             	sub    0xc(%ebp),%eax
80107b81:	05 00 10 00 00       	add    $0x1000,%eax
80107b86:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(n > len)
80107b89:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107b8c:	3b 45 14             	cmp    0x14(%ebp),%eax
80107b8f:	76 06                	jbe    80107b97 <copyout+0x57>
      n = len;
80107b91:	8b 45 14             	mov    0x14(%ebp),%eax
80107b94:	89 45 f0             	mov    %eax,-0x10(%ebp)
    memmove(pa0 + (va - va0), buf, n);
80107b97:	8b 45 0c             	mov    0xc(%ebp),%eax
80107b9a:	2b 45 ec             	sub    -0x14(%ebp),%eax
80107b9d:	89 c2                	mov    %eax,%edx
80107b9f:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107ba2:	01 d0                	add    %edx,%eax
80107ba4:	83 ec 04             	sub    $0x4,%esp
80107ba7:	ff 75 f0             	pushl  -0x10(%ebp)
80107baa:	ff 75 f4             	pushl  -0xc(%ebp)
80107bad:	50                   	push   %eax
80107bae:	e8 7b cd ff ff       	call   8010492e <memmove>
80107bb3:	83 c4 10             	add    $0x10,%esp
    len -= n;
80107bb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107bb9:	29 45 14             	sub    %eax,0x14(%ebp)
    buf += n;
80107bbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107bbf:	01 45 f4             	add    %eax,-0xc(%ebp)
    va = va0 + PGSIZE;
80107bc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107bc5:	05 00 10 00 00       	add    $0x1000,%eax
80107bca:	89 45 0c             	mov    %eax,0xc(%ebp)
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107bcd:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
80107bd1:	0f 85 77 ff ff ff    	jne    80107b4e <copyout+0xe>
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
80107bd7:	b8 00 00 00 00       	mov    $0x0,%eax
}
80107bdc:	c9                   	leave  
80107bdd:	c3                   	ret    

80107bde <parseFont>:
#include "xv_color.h"

int parseFont(char ch, int forec, int foreh, int backc, int backh)
{
80107bde:	55                   	push   %ebp
80107bdf:	89 e5                	mov    %esp,%ebp
80107be1:	83 ec 14             	sub    $0x14,%esp
80107be4:	8b 45 08             	mov    0x8(%ebp),%eax
80107be7:	88 45 ec             	mov    %al,-0x14(%ebp)
  int character = (int)ch;
80107bea:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
80107bee:	89 45 fc             	mov    %eax,-0x4(%ebp)
  character = character | (backh << 15);
80107bf1:	8b 45 18             	mov    0x18(%ebp),%eax
80107bf4:	c1 e0 0f             	shl    $0xf,%eax
80107bf7:	09 45 fc             	or     %eax,-0x4(%ebp)
  character = character | (backc << 12);
80107bfa:	8b 45 14             	mov    0x14(%ebp),%eax
80107bfd:	c1 e0 0c             	shl    $0xc,%eax
80107c00:	09 45 fc             	or     %eax,-0x4(%ebp)
  character = character | (foreh << 11);
80107c03:	8b 45 10             	mov    0x10(%ebp),%eax
80107c06:	c1 e0 0b             	shl    $0xb,%eax
80107c09:	09 45 fc             	or     %eax,-0x4(%ebp)
  character = character | (forec << 8);
80107c0c:	8b 45 0c             	mov    0xc(%ebp),%eax
80107c0f:	c1 e0 08             	shl    $0x8,%eax
80107c12:	09 45 fc             	or     %eax,-0x4(%ebp)
  return character;
80107c15:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80107c18:	c9                   	leave  
80107c19:	c3                   	ret    

80107c1a <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
80107c1a:	55                   	push   %ebp
80107c1b:	89 e5                	mov    %esp,%ebp
80107c1d:	83 ec 14             	sub    $0x14,%esp
80107c20:	8b 45 08             	mov    0x8(%ebp),%eax
80107c23:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80107c27:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
80107c2b:	89 c2                	mov    %eax,%edx
80107c2d:	ec                   	in     (%dx),%al
80107c2e:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
80107c31:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
80107c35:	c9                   	leave  
80107c36:	c3                   	ret    

80107c37 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
80107c37:	55                   	push   %ebp
80107c38:	89 e5                	mov    %esp,%ebp
80107c3a:	83 ec 08             	sub    $0x8,%esp
80107c3d:	8b 55 08             	mov    0x8(%ebp),%edx
80107c40:	8b 45 0c             	mov    0xc(%ebp),%eax
80107c43:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80107c47:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80107c4a:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
80107c4e:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80107c52:	ee                   	out    %al,(%dx)
}
80107c53:	90                   	nop
80107c54:	c9                   	leave  
80107c55:	c3                   	ret    

80107c56 <cli>:
  asm volatile("movw %0, %%gs" : : "r" (v));
}

static inline void
cli(void)
{
80107c56:	55                   	push   %ebp
80107c57:	89 e5                	mov    %esp,%ebp
  asm volatile("cli");
80107c59:	fa                   	cli    
}
80107c5a:	90                   	nop
80107c5b:	5d                   	pop    %ebp
80107c5c:	c3                   	ret    

80107c5d <isKeyWord>:

struct Highlight highlightlist[100]; //highlight information
int tohighlight = 0; //next highlight information index

int isKeyWord(const char* str)
{
80107c5d:	55                   	push   %ebp
80107c5e:	89 e5                	mov    %esp,%ebp
80107c60:	53                   	push   %ebx
80107c61:	83 ec 14             	sub    $0x14,%esp
  for(int i=0; i<XV_CMD_NUM; i++)
80107c64:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80107c6b:	eb 71                	jmp    80107cde <isKeyWord+0x81>
  {
    if(strlen(cmdtable[i]) == strlen(str) && 
80107c6d:	8b 55 f4             	mov    -0xc(%ebp),%edx
80107c70:	89 d0                	mov    %edx,%eax
80107c72:	c1 e0 02             	shl    $0x2,%eax
80107c75:	01 d0                	add    %edx,%eax
80107c77:	01 c0                	add    %eax,%eax
80107c79:	05 00 c5 10 80       	add    $0x8010c500,%eax
80107c7e:	83 ec 0c             	sub    $0xc,%esp
80107c81:	50                   	push   %eax
80107c82:	e8 35 ce ff ff       	call   80104abc <strlen>
80107c87:	83 c4 10             	add    $0x10,%esp
80107c8a:	89 c3                	mov    %eax,%ebx
80107c8c:	83 ec 0c             	sub    $0xc,%esp
80107c8f:	ff 75 08             	pushl  0x8(%ebp)
80107c92:	e8 25 ce ff ff       	call   80104abc <strlen>
80107c97:	83 c4 10             	add    $0x10,%esp
80107c9a:	39 c3                	cmp    %eax,%ebx
80107c9c:	75 3c                	jne    80107cda <isKeyWord+0x7d>
        strncmp(cmdtable[i],str,strlen(str)) == 0)
80107c9e:	83 ec 0c             	sub    $0xc,%esp
80107ca1:	ff 75 08             	pushl  0x8(%ebp)
80107ca4:	e8 13 ce ff ff       	call   80104abc <strlen>
80107ca9:	83 c4 10             	add    $0x10,%esp
80107cac:	89 c1                	mov    %eax,%ecx
80107cae:	8b 55 f4             	mov    -0xc(%ebp),%edx
80107cb1:	89 d0                	mov    %edx,%eax
80107cb3:	c1 e0 02             	shl    $0x2,%eax
80107cb6:	01 d0                	add    %edx,%eax
80107cb8:	01 c0                	add    %eax,%eax
80107cba:	05 00 c5 10 80       	add    $0x8010c500,%eax
80107cbf:	83 ec 04             	sub    $0x4,%esp
80107cc2:	51                   	push   %ecx
80107cc3:	ff 75 08             	pushl  0x8(%ebp)
80107cc6:	50                   	push   %eax
80107cc7:	e8 f8 cc ff ff       	call   801049c4 <strncmp>
80107ccc:	83 c4 10             	add    $0x10,%esp

int isKeyWord(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == strlen(str) && 
80107ccf:	85 c0                	test   %eax,%eax
80107cd1:	75 07                	jne    80107cda <isKeyWord+0x7d>
        strncmp(cmdtable[i],str,strlen(str)) == 0)
	    return 1;
80107cd3:	b8 01 00 00 00       	mov    $0x1,%eax
80107cd8:	eb 0f                	jmp    80107ce9 <isKeyWord+0x8c>
struct Highlight highlightlist[100]; //highlight information
int tohighlight = 0; //next highlight information index

int isKeyWord(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
80107cda:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80107cde:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
80107ce2:	7e 89                	jle    80107c6d <isKeyWord+0x10>
  {
    if(strlen(cmdtable[i]) == strlen(str) && 
        strncmp(cmdtable[i],str,strlen(str)) == 0)
	    return 1;
  }
  return 0;
80107ce4:	b8 00 00 00 00       	mov    $0x0,%eax
}
80107ce9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107cec:	c9                   	leave  
80107ced:	c3                   	ret    

80107cee <autocomplete>:

float difference(char* x, char* z);

int autocomplete(char* input)
{
80107cee:	55                   	push   %ebp
80107cef:	89 e5                	mov    %esp,%ebp
80107cf1:	83 ec 28             	sub    $0x28,%esp
  if(input[0] == '\0') //no input
80107cf4:	8b 45 08             	mov    0x8(%ebp),%eax
80107cf7:	0f b6 00             	movzbl (%eax),%eax
80107cfa:	84 c0                	test   %al,%al
80107cfc:	75 0a                	jne    80107d08 <autocomplete+0x1a>
    return -1;
80107cfe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107d03:	e9 c4 00 00 00       	jmp    80107dcc <autocomplete+0xde>
  int index = 0;
80107d08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  int minIndex = -1;
80107d0f:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
  float minDiff = MAX_COST;
80107d16:	d9 05 c4 9e 10 80    	flds   0x80109ec4
80107d1c:	d9 5d ec             	fstps  -0x14(%ebp)
  for (; index < XV_CMD_NUM; ++index) 
80107d1f:	eb 68                	jmp    80107d89 <autocomplete+0x9b>
  {
    if(input[0] != cmdtable[index][0]) //different first letter!
80107d21:	8b 45 08             	mov    0x8(%ebp),%eax
80107d24:	0f b6 08             	movzbl (%eax),%ecx
80107d27:	8b 55 f4             	mov    -0xc(%ebp),%edx
80107d2a:	89 d0                	mov    %edx,%eax
80107d2c:	c1 e0 02             	shl    $0x2,%eax
80107d2f:	01 d0                	add    %edx,%eax
80107d31:	01 c0                	add    %eax,%eax
80107d33:	05 00 c5 10 80       	add    $0x8010c500,%eax
80107d38:	0f b6 00             	movzbl (%eax),%eax
80107d3b:	38 c1                	cmp    %al,%cl
80107d3d:	75 45                	jne    80107d84 <autocomplete+0x96>
      continue;
    float d = difference(input, cmdtable[index]);
80107d3f:	8b 55 f4             	mov    -0xc(%ebp),%edx
80107d42:	89 d0                	mov    %edx,%eax
80107d44:	c1 e0 02             	shl    $0x2,%eax
80107d47:	01 d0                	add    %edx,%eax
80107d49:	01 c0                	add    %eax,%eax
80107d4b:	05 00 c5 10 80       	add    $0x8010c500,%eax
80107d50:	83 ec 08             	sub    $0x8,%esp
80107d53:	50                   	push   %eax
80107d54:	ff 75 08             	pushl  0x8(%ebp)
80107d57:	e8 72 00 00 00       	call   80107dce <difference>
80107d5c:	83 c4 10             	add    $0x10,%esp
80107d5f:	d9 5d e4             	fstps  -0x1c(%ebp)
80107d62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107d65:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if (d < minDiff) 
80107d68:	d9 45 ec             	flds   -0x14(%ebp)
80107d6b:	d9 45 e8             	flds   -0x18(%ebp)
80107d6e:	d9 c9                	fxch   %st(1)
80107d70:	df e9                	fucomip %st(1),%st
80107d72:	dd d8                	fstp   %st(0)
80107d74:	76 0f                	jbe    80107d85 <autocomplete+0x97>
    {
      minDiff = d;
80107d76:	d9 45 e8             	flds   -0x18(%ebp)
80107d79:	d9 5d ec             	fstps  -0x14(%ebp)
      minIndex = index;
80107d7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107d7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
80107d82:	eb 01                	jmp    80107d85 <autocomplete+0x97>
  int minIndex = -1;
  float minDiff = MAX_COST;
  for (; index < XV_CMD_NUM; ++index) 
  {
    if(input[0] != cmdtable[index][0]) //different first letter!
      continue;
80107d84:	90                   	nop
  if(input[0] == '\0') //no input
    return -1;
  int index = 0;
  int minIndex = -1;
  float minDiff = MAX_COST;
  for (; index < XV_CMD_NUM; ++index) 
80107d85:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80107d89:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
80107d8d:	7e 92                	jle    80107d21 <autocomplete+0x33>
    {
      minDiff = d;
      minIndex = index;
    }
  }
  if (minDiff > TOLERANCE)
80107d8f:	d9 45 ec             	flds   -0x14(%ebp)
80107d92:	d9 05 c8 9e 10 80    	flds   0x80109ec8
80107d98:	d9 c9                	fxch   %st(1)
80107d9a:	df e9                	fucomip %st(1),%st
80107d9c:	dd d8                	fstp   %st(0)
80107d9e:	76 07                	jbe    80107da7 <autocomplete+0xb9>
    return -1;
80107da0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107da5:	eb 25                	jmp    80107dcc <autocomplete+0xde>
  strncpy(input,cmdtable[minIndex],20);
80107da7:	8b 55 f0             	mov    -0x10(%ebp),%edx
80107daa:	89 d0                	mov    %edx,%eax
80107dac:	c1 e0 02             	shl    $0x2,%eax
80107daf:	01 d0                	add    %edx,%eax
80107db1:	01 c0                	add    %eax,%eax
80107db3:	05 00 c5 10 80       	add    $0x8010c500,%eax
80107db8:	83 ec 04             	sub    $0x4,%esp
80107dbb:	6a 14                	push   $0x14
80107dbd:	50                   	push   %eax
80107dbe:	ff 75 08             	pushl  0x8(%ebp)
80107dc1:	e8 54 cc ff ff       	call   80104a1a <strncpy>
80107dc6:	83 c4 10             	add    $0x10,%esp
  return minIndex;
80107dc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80107dcc:	c9                   	leave  
80107dcd:	c3                   	ret    

80107dce <difference>:

float difference(char* x, char* z)
{
80107dce:	55                   	push   %ebp
80107dcf:	89 e5                	mov    %esp,%ebp
80107dd1:	57                   	push   %edi
80107dd2:	81 ec 54 03 00 00    	sub    $0x354,%esp
	//init
	int dp[2*XV_KEYWORD_LENGTH][XV_KEYWORD_LENGTH] = {0};
80107dd8:	8d 95 b8 fc ff ff    	lea    -0x348(%ebp),%edx
80107dde:	b8 00 00 00 00       	mov    $0x0,%eax
80107de3:	b9 c8 00 00 00       	mov    $0xc8,%ecx
80107de8:	89 d7                	mov    %edx,%edi
80107dea:	f3 ab                	rep stos %eax,%es:(%edi)
	int m = strlen(x);
80107dec:	83 ec 0c             	sub    $0xc,%esp
80107def:	ff 75 08             	pushl  0x8(%ebp)
80107df2:	e8 c5 cc ff ff       	call   80104abc <strlen>
80107df7:	83 c4 10             	add    $0x10,%esp
80107dfa:	89 45 e0             	mov    %eax,-0x20(%ebp)
	int n = strlen(z);
80107dfd:	83 ec 0c             	sub    $0xc,%esp
80107e00:	ff 75 0c             	pushl  0xc(%ebp)
80107e03:	e8 b4 cc ff ff       	call   80104abc <strlen>
80107e08:	83 c4 10             	add    $0x10,%esp
80107e0b:	89 45 dc             	mov    %eax,-0x24(%ebp)
	dp[0][0] = 0;
80107e0e:	c7 85 b8 fc ff ff 00 	movl   $0x0,-0x348(%ebp)
80107e15:	00 00 00 
	for (int i = 1; i <= m; i++)
80107e18:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
80107e1f:	eb 28                	jmp    80107e49 <difference+0x7b>
	{
		dp[i][0] = i*cost[DELETE];
80107e21:	a1 e8 c4 10 80       	mov    0x8010c4e8,%eax
80107e26:	0f af 45 f4          	imul   -0xc(%ebp),%eax
80107e2a:	89 c1                	mov    %eax,%ecx
80107e2c:	8b 55 f4             	mov    -0xc(%ebp),%edx
80107e2f:	89 d0                	mov    %edx,%eax
80107e31:	c1 e0 02             	shl    $0x2,%eax
80107e34:	01 d0                	add    %edx,%eax
80107e36:	c1 e0 03             	shl    $0x3,%eax
80107e39:	8d 7d f8             	lea    -0x8(%ebp),%edi
80107e3c:	01 f8                	add    %edi,%eax
80107e3e:	2d 40 03 00 00       	sub    $0x340,%eax
80107e43:	89 08                	mov    %ecx,(%eax)
	//init
	int dp[2*XV_KEYWORD_LENGTH][XV_KEYWORD_LENGTH] = {0};
	int m = strlen(x);
	int n = strlen(z);
	dp[0][0] = 0;
	for (int i = 1; i <= m; i++)
80107e45:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80107e49:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107e4c:	3b 45 e0             	cmp    -0x20(%ebp),%eax
80107e4f:	7e d0                	jle    80107e21 <difference+0x53>
	{
		dp[i][0] = i*cost[DELETE];
	}
	for (int j = 1; j <= n; j++)
80107e51:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
80107e58:	eb 19                	jmp    80107e73 <difference+0xa5>
	{
		dp[0][j] = j*cost[INSERT];
80107e5a:	a1 ec c4 10 80       	mov    0x8010c4ec,%eax
80107e5f:	0f af 45 f0          	imul   -0x10(%ebp),%eax
80107e63:	89 c2                	mov    %eax,%edx
80107e65:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107e68:	89 94 85 b8 fc ff ff 	mov    %edx,-0x348(%ebp,%eax,4)
	dp[0][0] = 0;
	for (int i = 1; i <= m; i++)
	{
		dp[i][0] = i*cost[DELETE];
	}
	for (int j = 1; j <= n; j++)
80107e6f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
80107e73:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107e76:	3b 45 dc             	cmp    -0x24(%ebp),%eax
80107e79:	7e df                	jle    80107e5a <difference+0x8c>
	{
		dp[0][j] = j*cost[INSERT];
	}

	//bottom up dp
	for (int i = 0; i < m; i++)
80107e7b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80107e82:	e9 d7 02 00 00       	jmp    8010815e <difference+0x390>
	{
		for (int j = 0; j < n; j++)
80107e87:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
80107e8e:	e9 bb 02 00 00       	jmp    8010814e <difference+0x380>
		{
			dp[i + 1][j + 1] = MAX_COST;
80107e93:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107e96:	8d 50 01             	lea    0x1(%eax),%edx
80107e99:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107e9c:	8d 48 01             	lea    0x1(%eax),%ecx
80107e9f:	89 d0                	mov    %edx,%eax
80107ea1:	c1 e0 02             	shl    $0x2,%eax
80107ea4:	01 d0                	add    %edx,%eax
80107ea6:	01 c0                	add    %eax,%eax
80107ea8:	01 c8                	add    %ecx,%eax
80107eaa:	c7 84 85 b8 fc ff ff 	movl   $0x7fffffff,-0x348(%ebp,%eax,4)
80107eb1:	ff ff ff 7f 
			int temp;
			//copy  
			if (x[i] == z[j])
80107eb5:	8b 55 ec             	mov    -0x14(%ebp),%edx
80107eb8:	8b 45 08             	mov    0x8(%ebp),%eax
80107ebb:	01 d0                	add    %edx,%eax
80107ebd:	0f b6 10             	movzbl (%eax),%edx
80107ec0:	8b 4d e8             	mov    -0x18(%ebp),%ecx
80107ec3:	8b 45 0c             	mov    0xc(%ebp),%eax
80107ec6:	01 c8                	add    %ecx,%eax
80107ec8:	0f b6 00             	movzbl (%eax),%eax
80107ecb:	38 c2                	cmp    %al,%dl
80107ecd:	75 67                	jne    80107f36 <difference+0x168>
			{
				temp = dp[i][j] + cost[COPY];
80107ecf:	8b 55 ec             	mov    -0x14(%ebp),%edx
80107ed2:	89 d0                	mov    %edx,%eax
80107ed4:	c1 e0 02             	shl    $0x2,%eax
80107ed7:	01 d0                	add    %edx,%eax
80107ed9:	01 c0                	add    %eax,%eax
80107edb:	8b 55 e8             	mov    -0x18(%ebp),%edx
80107ede:	01 d0                	add    %edx,%eax
80107ee0:	8b 94 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%edx
80107ee7:	a1 e0 c4 10 80       	mov    0x8010c4e0,%eax
80107eec:	01 d0                	add    %edx,%eax
80107eee:	89 45 d8             	mov    %eax,-0x28(%ebp)
				if (temp < dp[i + 1][j + 1])
80107ef1:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107ef4:	8d 50 01             	lea    0x1(%eax),%edx
80107ef7:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107efa:	8d 48 01             	lea    0x1(%eax),%ecx
80107efd:	89 d0                	mov    %edx,%eax
80107eff:	c1 e0 02             	shl    $0x2,%eax
80107f02:	01 d0                	add    %edx,%eax
80107f04:	01 c0                	add    %eax,%eax
80107f06:	01 c8                	add    %ecx,%eax
80107f08:	8b 84 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%eax
80107f0f:	3b 45 d8             	cmp    -0x28(%ebp),%eax
80107f12:	7e 22                	jle    80107f36 <difference+0x168>
				{
					dp[i + 1][j + 1] = temp;
80107f14:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107f17:	8d 50 01             	lea    0x1(%eax),%edx
80107f1a:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107f1d:	8d 48 01             	lea    0x1(%eax),%ecx
80107f20:	89 d0                	mov    %edx,%eax
80107f22:	c1 e0 02             	shl    $0x2,%eax
80107f25:	01 d0                	add    %edx,%eax
80107f27:	01 c0                	add    %eax,%eax
80107f29:	8d 14 08             	lea    (%eax,%ecx,1),%edx
80107f2c:	8b 45 d8             	mov    -0x28(%ebp),%eax
80107f2f:	89 84 95 b8 fc ff ff 	mov    %eax,-0x348(%ebp,%edx,4)
				}
			}
			//replace  
			if (x[i] != z[j])
80107f36:	8b 55 ec             	mov    -0x14(%ebp),%edx
80107f39:	8b 45 08             	mov    0x8(%ebp),%eax
80107f3c:	01 d0                	add    %edx,%eax
80107f3e:	0f b6 10             	movzbl (%eax),%edx
80107f41:	8b 4d e8             	mov    -0x18(%ebp),%ecx
80107f44:	8b 45 0c             	mov    0xc(%ebp),%eax
80107f47:	01 c8                	add    %ecx,%eax
80107f49:	0f b6 00             	movzbl (%eax),%eax
80107f4c:	38 c2                	cmp    %al,%dl
80107f4e:	74 67                	je     80107fb7 <difference+0x1e9>
			{
				temp = dp[i][j] + cost[REPLACE];
80107f50:	8b 55 ec             	mov    -0x14(%ebp),%edx
80107f53:	89 d0                	mov    %edx,%eax
80107f55:	c1 e0 02             	shl    $0x2,%eax
80107f58:	01 d0                	add    %edx,%eax
80107f5a:	01 c0                	add    %eax,%eax
80107f5c:	8b 55 e8             	mov    -0x18(%ebp),%edx
80107f5f:	01 d0                	add    %edx,%eax
80107f61:	8b 94 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%edx
80107f68:	a1 e4 c4 10 80       	mov    0x8010c4e4,%eax
80107f6d:	01 d0                	add    %edx,%eax
80107f6f:	89 45 d8             	mov    %eax,-0x28(%ebp)
				if (temp < dp[i + 1][j + 1])
80107f72:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107f75:	8d 50 01             	lea    0x1(%eax),%edx
80107f78:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107f7b:	8d 48 01             	lea    0x1(%eax),%ecx
80107f7e:	89 d0                	mov    %edx,%eax
80107f80:	c1 e0 02             	shl    $0x2,%eax
80107f83:	01 d0                	add    %edx,%eax
80107f85:	01 c0                	add    %eax,%eax
80107f87:	01 c8                	add    %ecx,%eax
80107f89:	8b 84 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%eax
80107f90:	3b 45 d8             	cmp    -0x28(%ebp),%eax
80107f93:	7e 22                	jle    80107fb7 <difference+0x1e9>
				{
					dp[i + 1][j + 1] = temp;
80107f95:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107f98:	8d 50 01             	lea    0x1(%eax),%edx
80107f9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107f9e:	8d 48 01             	lea    0x1(%eax),%ecx
80107fa1:	89 d0                	mov    %edx,%eax
80107fa3:	c1 e0 02             	shl    $0x2,%eax
80107fa6:	01 d0                	add    %edx,%eax
80107fa8:	01 c0                	add    %eax,%eax
80107faa:	8d 14 08             	lea    (%eax,%ecx,1),%edx
80107fad:	8b 45 d8             	mov    -0x28(%ebp),%eax
80107fb0:	89 84 95 b8 fc ff ff 	mov    %eax,-0x348(%ebp,%edx,4)
				}
			}
			//delete  
			temp = dp[i][j + 1] + cost[DELETE];
80107fb7:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107fba:	8d 48 01             	lea    0x1(%eax),%ecx
80107fbd:	8b 55 ec             	mov    -0x14(%ebp),%edx
80107fc0:	89 d0                	mov    %edx,%eax
80107fc2:	c1 e0 02             	shl    $0x2,%eax
80107fc5:	01 d0                	add    %edx,%eax
80107fc7:	01 c0                	add    %eax,%eax
80107fc9:	01 c8                	add    %ecx,%eax
80107fcb:	8b 94 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%edx
80107fd2:	a1 e8 c4 10 80       	mov    0x8010c4e8,%eax
80107fd7:	01 d0                	add    %edx,%eax
80107fd9:	89 45 d8             	mov    %eax,-0x28(%ebp)
			if (temp < dp[i + 1][j + 1])
80107fdc:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107fdf:	8d 50 01             	lea    0x1(%eax),%edx
80107fe2:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107fe5:	8d 48 01             	lea    0x1(%eax),%ecx
80107fe8:	89 d0                	mov    %edx,%eax
80107fea:	c1 e0 02             	shl    $0x2,%eax
80107fed:	01 d0                	add    %edx,%eax
80107fef:	01 c0                	add    %eax,%eax
80107ff1:	01 c8                	add    %ecx,%eax
80107ff3:	8b 84 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%eax
80107ffa:	3b 45 d8             	cmp    -0x28(%ebp),%eax
80107ffd:	7e 22                	jle    80108021 <difference+0x253>
			{
				dp[i + 1][j + 1] = temp;
80107fff:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108002:	8d 50 01             	lea    0x1(%eax),%edx
80108005:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108008:	8d 48 01             	lea    0x1(%eax),%ecx
8010800b:	89 d0                	mov    %edx,%eax
8010800d:	c1 e0 02             	shl    $0x2,%eax
80108010:	01 d0                	add    %edx,%eax
80108012:	01 c0                	add    %eax,%eax
80108014:	8d 14 08             	lea    (%eax,%ecx,1),%edx
80108017:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010801a:	89 84 95 b8 fc ff ff 	mov    %eax,-0x348(%ebp,%edx,4)
			}
			//insert  
			temp = dp[i + 1][j] + cost[INSERT];
80108021:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108024:	8d 50 01             	lea    0x1(%eax),%edx
80108027:	89 d0                	mov    %edx,%eax
80108029:	c1 e0 02             	shl    $0x2,%eax
8010802c:	01 d0                	add    %edx,%eax
8010802e:	01 c0                	add    %eax,%eax
80108030:	8b 55 e8             	mov    -0x18(%ebp),%edx
80108033:	01 d0                	add    %edx,%eax
80108035:	8b 94 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%edx
8010803c:	a1 ec c4 10 80       	mov    0x8010c4ec,%eax
80108041:	01 d0                	add    %edx,%eax
80108043:	89 45 d8             	mov    %eax,-0x28(%ebp)
			if (temp < dp[i + 1][j + 1])
80108046:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108049:	8d 50 01             	lea    0x1(%eax),%edx
8010804c:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010804f:	8d 48 01             	lea    0x1(%eax),%ecx
80108052:	89 d0                	mov    %edx,%eax
80108054:	c1 e0 02             	shl    $0x2,%eax
80108057:	01 d0                	add    %edx,%eax
80108059:	01 c0                	add    %eax,%eax
8010805b:	01 c8                	add    %ecx,%eax
8010805d:	8b 84 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%eax
80108064:	3b 45 d8             	cmp    -0x28(%ebp),%eax
80108067:	7e 22                	jle    8010808b <difference+0x2bd>
			{
				dp[i + 1][j + 1] = temp;
80108069:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010806c:	8d 50 01             	lea    0x1(%eax),%edx
8010806f:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108072:	8d 48 01             	lea    0x1(%eax),%ecx
80108075:	89 d0                	mov    %edx,%eax
80108077:	c1 e0 02             	shl    $0x2,%eax
8010807a:	01 d0                	add    %edx,%eax
8010807c:	01 c0                	add    %eax,%eax
8010807e:	8d 14 08             	lea    (%eax,%ecx,1),%edx
80108081:	8b 45 d8             	mov    -0x28(%ebp),%eax
80108084:	89 84 95 b8 fc ff ff 	mov    %eax,-0x348(%ebp,%edx,4)
			}
			//twidle  
			if (i != 0 && j != 0 && x[i] == z[j - 1] && x[i - 1] == z[j])
8010808b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
8010808f:	0f 84 b5 00 00 00    	je     8010814a <difference+0x37c>
80108095:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80108099:	0f 84 ab 00 00 00    	je     8010814a <difference+0x37c>
8010809f:	8b 55 ec             	mov    -0x14(%ebp),%edx
801080a2:	8b 45 08             	mov    0x8(%ebp),%eax
801080a5:	01 d0                	add    %edx,%eax
801080a7:	0f b6 10             	movzbl (%eax),%edx
801080aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
801080ad:	8d 48 ff             	lea    -0x1(%eax),%ecx
801080b0:	8b 45 0c             	mov    0xc(%ebp),%eax
801080b3:	01 c8                	add    %ecx,%eax
801080b5:	0f b6 00             	movzbl (%eax),%eax
801080b8:	38 c2                	cmp    %al,%dl
801080ba:	0f 85 8a 00 00 00    	jne    8010814a <difference+0x37c>
801080c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
801080c3:	8d 50 ff             	lea    -0x1(%eax),%edx
801080c6:	8b 45 08             	mov    0x8(%ebp),%eax
801080c9:	01 d0                	add    %edx,%eax
801080cb:	0f b6 10             	movzbl (%eax),%edx
801080ce:	8b 4d e8             	mov    -0x18(%ebp),%ecx
801080d1:	8b 45 0c             	mov    0xc(%ebp),%eax
801080d4:	01 c8                	add    %ecx,%eax
801080d6:	0f b6 00             	movzbl (%eax),%eax
801080d9:	38 c2                	cmp    %al,%dl
801080db:	75 6d                	jne    8010814a <difference+0x37c>
			{
				temp = dp[i - 1][j - 1] + cost[TWIDDLE];
801080dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
801080e0:	8d 50 ff             	lea    -0x1(%eax),%edx
801080e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
801080e6:	8d 48 ff             	lea    -0x1(%eax),%ecx
801080e9:	89 d0                	mov    %edx,%eax
801080eb:	c1 e0 02             	shl    $0x2,%eax
801080ee:	01 d0                	add    %edx,%eax
801080f0:	01 c0                	add    %eax,%eax
801080f2:	01 c8                	add    %ecx,%eax
801080f4:	8b 94 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%edx
801080fb:	a1 f0 c4 10 80       	mov    0x8010c4f0,%eax
80108100:	01 d0                	add    %edx,%eax
80108102:	89 45 d8             	mov    %eax,-0x28(%ebp)
				if (temp < dp[i + 1][j + 1])
80108105:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108108:	8d 50 01             	lea    0x1(%eax),%edx
8010810b:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010810e:	8d 48 01             	lea    0x1(%eax),%ecx
80108111:	89 d0                	mov    %edx,%eax
80108113:	c1 e0 02             	shl    $0x2,%eax
80108116:	01 d0                	add    %edx,%eax
80108118:	01 c0                	add    %eax,%eax
8010811a:	01 c8                	add    %ecx,%eax
8010811c:	8b 84 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%eax
80108123:	3b 45 d8             	cmp    -0x28(%ebp),%eax
80108126:	7e 22                	jle    8010814a <difference+0x37c>
				{
					dp[i + 1][j + 1] = temp;
80108128:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010812b:	8d 50 01             	lea    0x1(%eax),%edx
8010812e:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108131:	8d 48 01             	lea    0x1(%eax),%ecx
80108134:	89 d0                	mov    %edx,%eax
80108136:	c1 e0 02             	shl    $0x2,%eax
80108139:	01 d0                	add    %edx,%eax
8010813b:	01 c0                	add    %eax,%eax
8010813d:	8d 14 08             	lea    (%eax,%ecx,1),%edx
80108140:	8b 45 d8             	mov    -0x28(%ebp),%eax
80108143:	89 84 95 b8 fc ff ff 	mov    %eax,-0x348(%ebp,%edx,4)
	}

	//bottom up dp
	for (int i = 0; i < m; i++)
	{
		for (int j = 0; j < n; j++)
8010814a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
8010814e:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108151:	3b 45 dc             	cmp    -0x24(%ebp),%eax
80108154:	0f 8c 39 fd ff ff    	jl     80107e93 <difference+0xc5>
	{
		dp[0][j] = j*cost[INSERT];
	}

	//bottom up dp
	for (int i = 0; i < m; i++)
8010815a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
8010815e:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108161:	3b 45 e0             	cmp    -0x20(%ebp),%eax
80108164:	0f 8c 1d fd ff ff    	jl     80107e87 <difference+0xb9>
				}
			}
		}
	}
	//kill
	for (int i = 1; i < m; i++)
8010816a:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
80108171:	eb 78                	jmp    801081eb <difference+0x41d>
	{
		if (dp[i][n] + cost[KILL] < dp[m][n])
80108173:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80108176:	89 d0                	mov    %edx,%eax
80108178:	c1 e0 02             	shl    $0x2,%eax
8010817b:	01 d0                	add    %edx,%eax
8010817d:	01 c0                	add    %eax,%eax
8010817f:	8b 55 dc             	mov    -0x24(%ebp),%edx
80108182:	01 d0                	add    %edx,%eax
80108184:	8b 94 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%edx
8010818b:	a1 f4 c4 10 80       	mov    0x8010c4f4,%eax
80108190:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
80108193:	8b 55 e0             	mov    -0x20(%ebp),%edx
80108196:	89 d0                	mov    %edx,%eax
80108198:	c1 e0 02             	shl    $0x2,%eax
8010819b:	01 d0                	add    %edx,%eax
8010819d:	01 c0                	add    %eax,%eax
8010819f:	8b 55 dc             	mov    -0x24(%ebp),%edx
801081a2:	01 d0                	add    %edx,%eax
801081a4:	8b 84 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%eax
801081ab:	39 c1                	cmp    %eax,%ecx
801081ad:	7d 38                	jge    801081e7 <difference+0x419>
		{
			dp[m][n] = dp[i][n] + cost[KILL];
801081af:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801081b2:	89 d0                	mov    %edx,%eax
801081b4:	c1 e0 02             	shl    $0x2,%eax
801081b7:	01 d0                	add    %edx,%eax
801081b9:	01 c0                	add    %eax,%eax
801081bb:	8b 55 dc             	mov    -0x24(%ebp),%edx
801081be:	01 d0                	add    %edx,%eax
801081c0:	8b 94 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%edx
801081c7:	a1 f4 c4 10 80       	mov    0x8010c4f4,%eax
801081cc:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
801081cf:	8b 55 e0             	mov    -0x20(%ebp),%edx
801081d2:	89 d0                	mov    %edx,%eax
801081d4:	c1 e0 02             	shl    $0x2,%eax
801081d7:	01 d0                	add    %edx,%eax
801081d9:	01 c0                	add    %eax,%eax
801081db:	8b 55 dc             	mov    -0x24(%ebp),%edx
801081de:	01 d0                	add    %edx,%eax
801081e0:	89 8c 85 b8 fc ff ff 	mov    %ecx,-0x348(%ebp,%eax,4)
				}
			}
		}
	}
	//kill
	for (int i = 1; i < m; i++)
801081e7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801081eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801081ee:	3b 45 e0             	cmp    -0x20(%ebp),%eax
801081f1:	7c 80                	jl     80108173 <difference+0x3a5>
		if (dp[i][n] + cost[KILL] < dp[m][n])
		{
			dp[m][n] = dp[i][n] + cost[KILL];
		}
  }
	return 1.0*dp[m][n] / n;
801081f3:	8b 55 e0             	mov    -0x20(%ebp),%edx
801081f6:	89 d0                	mov    %edx,%eax
801081f8:	c1 e0 02             	shl    $0x2,%eax
801081fb:	01 d0                	add    %edx,%eax
801081fd:	01 c0                	add    %eax,%eax
801081ff:	8b 55 dc             	mov    -0x24(%ebp),%edx
80108202:	01 d0                	add    %edx,%eax
80108204:	8b 84 85 b8 fc ff ff 	mov    -0x348(%ebp,%eax,4),%eax
8010820b:	89 85 b0 fc ff ff    	mov    %eax,-0x350(%ebp)
80108211:	db 85 b0 fc ff ff    	fildl  -0x350(%ebp)
80108217:	db 45 dc             	fildl  -0x24(%ebp)
8010821a:	de f9                	fdivrp %st,%st(1)
8010821c:	d9 9d b4 fc ff ff    	fstps  -0x34c(%ebp)
80108222:	d9 85 b4 fc ff ff    	flds   -0x34c(%ebp)
}
80108228:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010822b:	c9                   	leave  
8010822c:	c3                   	ret    

8010822d <printint>:

static void
printint(int xx, int base, int sign)
{
8010822d:	55                   	push   %ebp
8010822e:	89 e5                	mov    %esp,%ebp
80108230:	53                   	push   %ebx
80108231:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80108234:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80108238:	74 1c                	je     80108256 <printint+0x29>
8010823a:	8b 45 08             	mov    0x8(%ebp),%eax
8010823d:	c1 e8 1f             	shr    $0x1f,%eax
80108240:	0f b6 c0             	movzbl %al,%eax
80108243:	89 45 10             	mov    %eax,0x10(%ebp)
80108246:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
8010824a:	74 0a                	je     80108256 <printint+0x29>
    x = -xx;
8010824c:	8b 45 08             	mov    0x8(%ebp),%eax
8010824f:	f7 d8                	neg    %eax
80108251:	89 45 f0             	mov    %eax,-0x10(%ebp)
80108254:	eb 06                	jmp    8010825c <printint+0x2f>
  else
    x = xx;
80108256:	8b 45 08             	mov    0x8(%ebp),%eax
80108259:	89 45 f0             	mov    %eax,-0x10(%ebp)

  i = 0;
8010825c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
80108263:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108266:	8d 41 01             	lea    0x1(%ecx),%eax
80108269:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010826c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010826f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80108272:	ba 00 00 00 00       	mov    $0x0,%edx
80108277:	f7 f3                	div    %ebx
80108279:	89 d0                	mov    %edx,%eax
8010827b:	0f b6 80 cc c5 10 80 	movzbl -0x7fef3a34(%eax),%eax
80108282:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
  }while((x /= base) != 0);
80108286:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80108289:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010828c:	ba 00 00 00 00       	mov    $0x0,%edx
80108291:	f7 f3                	div    %ebx
80108293:	89 45 f0             	mov    %eax,-0x10(%ebp)
80108296:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010829a:	75 c7                	jne    80108263 <printint+0x36>

  if(sign)
8010829c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801082a0:	74 2a                	je     801082cc <printint+0x9f>
    buf[i++] = '-';
801082a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801082a5:	8d 50 01             	lea    0x1(%eax),%edx
801082a8:	89 55 f4             	mov    %edx,-0xc(%ebp)
801082ab:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
801082b0:	eb 1a                	jmp    801082cc <printint+0x9f>
    consputc(buf[i]);
801082b2:	8d 55 e0             	lea    -0x20(%ebp),%edx
801082b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801082b8:	01 d0                	add    %edx,%eax
801082ba:	0f b6 00             	movzbl (%eax),%eax
801082bd:	0f be c0             	movsbl %al,%eax
801082c0:	83 ec 0c             	sub    $0xc,%esp
801082c3:	50                   	push   %eax
801082c4:	e8 01 0b 00 00       	call   80108dca <consputc>
801082c9:	83 c4 10             	add    $0x10,%esp
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801082cc:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
801082d0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801082d4:	79 dc                	jns    801082b2 <printint+0x85>
    consputc(buf[i]);
}
801082d6:	90                   	nop
801082d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801082da:	c9                   	leave  
801082db:	c3                   	ret    

801082dc <color_printint>:
//PAGEBREAK: 50

static void
color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
801082dc:	55                   	push   %ebp
801082dd:	89 e5                	mov    %esp,%ebp
801082df:	53                   	push   %ebx
801082e0:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
801082e3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
801082ea:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801082ee:	74 17                	je     80108307 <color_printint+0x2b>
801082f0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801082f4:	79 11                	jns    80108307 <color_printint+0x2b>
    neg = 1;
801082f6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
801082fd:	8b 45 08             	mov    0x8(%ebp),%eax
80108300:	f7 d8                	neg    %eax
80108302:	89 45 ec             	mov    %eax,-0x14(%ebp)
80108305:	eb 06                	jmp    8010830d <color_printint+0x31>
  } else {
    x = xx;
80108307:	8b 45 08             	mov    0x8(%ebp),%eax
8010830a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
8010830d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
80108314:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108317:	8d 41 01             	lea    0x1(%ecx),%eax
8010831a:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010831d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80108320:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108323:	ba 00 00 00 00       	mov    $0x0,%edx
80108328:	f7 f3                	div    %ebx
8010832a:	89 d0                	mov    %edx,%eax
8010832c:	0f b6 80 e0 c5 10 80 	movzbl -0x7fef3a20(%eax),%eax
80108333:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
80108337:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010833a:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010833d:	ba 00 00 00 00       	mov    $0x0,%edx
80108342:	f7 f3                	div    %ebx
80108344:	89 45 ec             	mov    %eax,-0x14(%ebp)
80108347:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
8010834b:	75 c7                	jne    80108314 <color_printint+0x38>
  if(neg)
8010834d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80108351:	74 42                	je     80108395 <color_printint+0xb9>
    buf[i++] = '-';
80108353:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108356:	8d 50 01             	lea    0x1(%eax),%edx
80108359:	89 55 f4             	mov    %edx,-0xc(%ebp)
8010835c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
80108361:	eb 32                	jmp    80108395 <color_printint+0xb9>
    color_consputc(parseFont(buf[i], forec,foreh,backc,backh));
80108363:	8d 55 dc             	lea    -0x24(%ebp),%edx
80108366:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108369:	01 d0                	add    %edx,%eax
8010836b:	0f b6 00             	movzbl (%eax),%eax
8010836e:	0f be c0             	movsbl %al,%eax
80108371:	83 ec 0c             	sub    $0xc,%esp
80108374:	ff 75 20             	pushl  0x20(%ebp)
80108377:	ff 75 1c             	pushl  0x1c(%ebp)
8010837a:	ff 75 18             	pushl  0x18(%ebp)
8010837d:	ff 75 14             	pushl  0x14(%ebp)
80108380:	50                   	push   %eax
80108381:	e8 58 f8 ff ff       	call   80107bde <parseFont>
80108386:	83 c4 20             	add    $0x20,%esp
80108389:	83 ec 0c             	sub    $0xc,%esp
8010838c:	50                   	push   %eax
8010838d:	e8 9f 0a 00 00       	call   80108e31 <color_consputc>
80108392:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
80108395:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
80108399:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010839d:	79 c4                	jns    80108363 <color_printint+0x87>
    color_consputc(parseFont(buf[i], forec,foreh,backc,backh));
}
8010839f:	90                   	nop
801083a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801083a3:	c9                   	leave  
801083a4:	c3                   	ret    

801083a5 <cprintf>:

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
801083a5:	55                   	push   %ebp
801083a6:	89 e5                	mov    %esp,%ebp
801083a8:	83 ec 28             	sub    $0x28,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = xv_cons.locking;
801083ab:	a1 74 c7 10 80       	mov    0x8010c774,%eax
801083b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(locking)
801083b3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
801083b7:	74 10                	je     801083c9 <cprintf+0x24>
    acquire(&xv_cons.lock);
801083b9:	83 ec 0c             	sub    $0xc,%esp
801083bc:	68 40 c7 10 80       	push   $0x8010c740
801083c1:	e8 46 c2 ff ff       	call   8010460c <acquire>
801083c6:	83 c4 10             	add    $0x10,%esp

  if (fmt == 0)
801083c9:	8b 45 08             	mov    0x8(%ebp),%eax
801083cc:	85 c0                	test   %eax,%eax
801083ce:	75 0d                	jne    801083dd <cprintf+0x38>
    panic("null fmt");
801083d0:	83 ec 0c             	sub    $0xc,%esp
801083d3:	68 8c 9e 10 80       	push   $0x80109e8c
801083d8:	e8 72 03 00 00       	call   8010874f <panic>

  argp = (uint*)(void*)(&fmt + 1);
801083dd:	8d 45 0c             	lea    0xc(%ebp),%eax
801083e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801083e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801083ea:	e9 1a 01 00 00       	jmp    80108509 <cprintf+0x164>
    if(c != '%'){
801083ef:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
801083f3:	74 13                	je     80108408 <cprintf+0x63>
      consputc(c);
801083f5:	83 ec 0c             	sub    $0xc,%esp
801083f8:	ff 75 e4             	pushl  -0x1c(%ebp)
801083fb:	e8 ca 09 00 00       	call   80108dca <consputc>
80108400:	83 c4 10             	add    $0x10,%esp
      continue;
80108403:	e9 fd 00 00 00       	jmp    80108505 <cprintf+0x160>
    }
    c = fmt[++i] & 0xff;
80108408:	8b 55 08             	mov    0x8(%ebp),%edx
8010840b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
8010840f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108412:	01 d0                	add    %edx,%eax
80108414:	0f b6 00             	movzbl (%eax),%eax
80108417:	0f be c0             	movsbl %al,%eax
8010841a:	25 ff 00 00 00       	and    $0xff,%eax
8010841f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(c == 0)
80108422:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80108426:	0f 84 ff 00 00 00    	je     8010852b <cprintf+0x186>
      break;
    switch(c){
8010842c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010842f:	83 f8 70             	cmp    $0x70,%eax
80108432:	74 47                	je     8010847b <cprintf+0xd6>
80108434:	83 f8 70             	cmp    $0x70,%eax
80108437:	7f 13                	jg     8010844c <cprintf+0xa7>
80108439:	83 f8 25             	cmp    $0x25,%eax
8010843c:	0f 84 98 00 00 00    	je     801084da <cprintf+0x135>
80108442:	83 f8 64             	cmp    $0x64,%eax
80108445:	74 14                	je     8010845b <cprintf+0xb6>
80108447:	e9 9d 00 00 00       	jmp    801084e9 <cprintf+0x144>
8010844c:	83 f8 73             	cmp    $0x73,%eax
8010844f:	74 47                	je     80108498 <cprintf+0xf3>
80108451:	83 f8 78             	cmp    $0x78,%eax
80108454:	74 25                	je     8010847b <cprintf+0xd6>
80108456:	e9 8e 00 00 00       	jmp    801084e9 <cprintf+0x144>
    case 'd':
      printint(*argp++, 10, 1);
8010845b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010845e:	8d 50 04             	lea    0x4(%eax),%edx
80108461:	89 55 f0             	mov    %edx,-0x10(%ebp)
80108464:	8b 00                	mov    (%eax),%eax
80108466:	83 ec 04             	sub    $0x4,%esp
80108469:	6a 01                	push   $0x1
8010846b:	6a 0a                	push   $0xa
8010846d:	50                   	push   %eax
8010846e:	e8 ba fd ff ff       	call   8010822d <printint>
80108473:	83 c4 10             	add    $0x10,%esp
      break;
80108476:	e9 8a 00 00 00       	jmp    80108505 <cprintf+0x160>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010847b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010847e:	8d 50 04             	lea    0x4(%eax),%edx
80108481:	89 55 f0             	mov    %edx,-0x10(%ebp)
80108484:	8b 00                	mov    (%eax),%eax
80108486:	83 ec 04             	sub    $0x4,%esp
80108489:	6a 00                	push   $0x0
8010848b:	6a 10                	push   $0x10
8010848d:	50                   	push   %eax
8010848e:	e8 9a fd ff ff       	call   8010822d <printint>
80108493:	83 c4 10             	add    $0x10,%esp
      break;
80108496:	eb 6d                	jmp    80108505 <cprintf+0x160>
    case 's':
      if((s = (char*)*argp++) == 0)
80108498:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010849b:	8d 50 04             	lea    0x4(%eax),%edx
8010849e:	89 55 f0             	mov    %edx,-0x10(%ebp)
801084a1:	8b 00                	mov    (%eax),%eax
801084a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
801084a6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
801084aa:	75 22                	jne    801084ce <cprintf+0x129>
        s = "(null)";
801084ac:	c7 45 ec 95 9e 10 80 	movl   $0x80109e95,-0x14(%ebp)
      for(; *s; s++)
801084b3:	eb 19                	jmp    801084ce <cprintf+0x129>
        consputc(*s);
801084b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
801084b8:	0f b6 00             	movzbl (%eax),%eax
801084bb:	0f be c0             	movsbl %al,%eax
801084be:	83 ec 0c             	sub    $0xc,%esp
801084c1:	50                   	push   %eax
801084c2:	e8 03 09 00 00       	call   80108dca <consputc>
801084c7:	83 c4 10             	add    $0x10,%esp
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801084ca:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
801084ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
801084d1:	0f b6 00             	movzbl (%eax),%eax
801084d4:	84 c0                	test   %al,%al
801084d6:	75 dd                	jne    801084b5 <cprintf+0x110>
        consputc(*s);
      break;
801084d8:	eb 2b                	jmp    80108505 <cprintf+0x160>
    case '%':
      consputc('%');
801084da:	83 ec 0c             	sub    $0xc,%esp
801084dd:	6a 25                	push   $0x25
801084df:	e8 e6 08 00 00       	call   80108dca <consputc>
801084e4:	83 c4 10             	add    $0x10,%esp
      break;
801084e7:	eb 1c                	jmp    80108505 <cprintf+0x160>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
801084e9:	83 ec 0c             	sub    $0xc,%esp
801084ec:	6a 25                	push   $0x25
801084ee:	e8 d7 08 00 00       	call   80108dca <consputc>
801084f3:	83 c4 10             	add    $0x10,%esp
      consputc(c);
801084f6:	83 ec 0c             	sub    $0xc,%esp
801084f9:	ff 75 e4             	pushl  -0x1c(%ebp)
801084fc:	e8 c9 08 00 00       	call   80108dca <consputc>
80108501:	83 c4 10             	add    $0x10,%esp
      break;
80108504:	90                   	nop

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80108505:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80108509:	8b 55 08             	mov    0x8(%ebp),%edx
8010850c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010850f:	01 d0                	add    %edx,%eax
80108511:	0f b6 00             	movzbl (%eax),%eax
80108514:	0f be c0             	movsbl %al,%eax
80108517:	25 ff 00 00 00       	and    $0xff,%eax
8010851c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010851f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80108523:	0f 85 c6 fe ff ff    	jne    801083ef <cprintf+0x4a>
80108529:	eb 01                	jmp    8010852c <cprintf+0x187>
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
8010852b:	90                   	nop
      consputc(c);
      break;
    }
  }

  if(locking)
8010852c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80108530:	74 10                	je     80108542 <cprintf+0x19d>
    release(&xv_cons.lock);
80108532:	83 ec 0c             	sub    $0xc,%esp
80108535:	68 40 c7 10 80       	push   $0x8010c740
8010853a:	e8 34 c1 ff ff       	call   80104673 <release>
8010853f:	83 c4 10             	add    $0x10,%esp
}
80108542:	90                   	nop
80108543:	c9                   	leave  
80108544:	c3                   	ret    

80108545 <color_cprintf>:

// Print to the console. only understands %d, %x, %p, %s.
void
color_cprintf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
80108545:	55                   	push   %ebp
80108546:	89 e5                	mov    %esp,%ebp
80108548:	83 ec 28             	sub    $0x28,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = xv_cons.locking;
8010854b:	a1 74 c7 10 80       	mov    0x8010c774,%eax
80108550:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(locking)
80108553:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80108557:	74 10                	je     80108569 <color_cprintf+0x24>
    acquire(&xv_cons.lock);
80108559:	83 ec 0c             	sub    $0xc,%esp
8010855c:	68 40 c7 10 80       	push   $0x8010c740
80108561:	e8 a6 c0 ff ff       	call   8010460c <acquire>
80108566:	83 c4 10             	add    $0x10,%esp

  if (fmt == 0)
80108569:	8b 45 18             	mov    0x18(%ebp),%eax
8010856c:	85 c0                	test   %eax,%eax
8010856e:	75 0d                	jne    8010857d <color_cprintf+0x38>
    panic("null fmt");
80108570:	83 ec 0c             	sub    $0xc,%esp
80108573:	68 8c 9e 10 80       	push   $0x80109e8c
80108578:	e8 d2 01 00 00       	call   8010874f <panic>

  argp = (uint*)(void*)(&fmt + 1);
8010857d:	8d 45 18             	lea    0x18(%ebp),%eax
80108580:	83 c0 04             	add    $0x4,%eax
80108583:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80108586:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
8010858d:	e9 81 01 00 00       	jmp    80108713 <color_cprintf+0x1ce>
    if(c != '%'){
80108592:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
80108596:	74 2f                	je     801085c7 <color_cprintf+0x82>
      color_consputc(parseFont(c,forec,foreh,backc,backh));
80108598:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010859b:	0f be c0             	movsbl %al,%eax
8010859e:	83 ec 0c             	sub    $0xc,%esp
801085a1:	ff 75 14             	pushl  0x14(%ebp)
801085a4:	ff 75 10             	pushl  0x10(%ebp)
801085a7:	ff 75 0c             	pushl  0xc(%ebp)
801085aa:	ff 75 08             	pushl  0x8(%ebp)
801085ad:	50                   	push   %eax
801085ae:	e8 2b f6 ff ff       	call   80107bde <parseFont>
801085b3:	83 c4 20             	add    $0x20,%esp
801085b6:	83 ec 0c             	sub    $0xc,%esp
801085b9:	50                   	push   %eax
801085ba:	e8 72 08 00 00       	call   80108e31 <color_consputc>
801085bf:	83 c4 10             	add    $0x10,%esp
      continue;
801085c2:	e9 48 01 00 00       	jmp    8010870f <color_cprintf+0x1ca>
    }
    c = fmt[++i] & 0xff;
801085c7:	8b 55 18             	mov    0x18(%ebp),%edx
801085ca:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801085ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
801085d1:	01 d0                	add    %edx,%eax
801085d3:	0f b6 00             	movzbl (%eax),%eax
801085d6:	0f be c0             	movsbl %al,%eax
801085d9:	25 ff 00 00 00       	and    $0xff,%eax
801085de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(c == 0)
801085e1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
801085e5:	0f 84 4a 01 00 00    	je     80108735 <color_cprintf+0x1f0>
      break;
    switch(c){
801085eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801085ee:	83 f8 70             	cmp    $0x70,%eax
801085f1:	74 53                	je     80108646 <color_cprintf+0x101>
801085f3:	83 f8 70             	cmp    $0x70,%eax
801085f6:	7f 13                	jg     8010860b <color_cprintf+0xc6>
801085f8:	83 f8 25             	cmp    $0x25,%eax
801085fb:	0f 84 cb 00 00 00    	je     801086cc <color_cprintf+0x187>
80108601:	83 f8 64             	cmp    $0x64,%eax
80108604:	74 14                	je     8010861a <color_cprintf+0xd5>
80108606:	e9 e8 00 00 00       	jmp    801086f3 <color_cprintf+0x1ae>
8010860b:	83 f8 73             	cmp    $0x73,%eax
8010860e:	74 62                	je     80108672 <color_cprintf+0x12d>
80108610:	83 f8 78             	cmp    $0x78,%eax
80108613:	74 31                	je     80108646 <color_cprintf+0x101>
80108615:	e9 d9 00 00 00       	jmp    801086f3 <color_cprintf+0x1ae>
    case 'd':
      color_printint(*argp++, 10, 1, forec, foreh, backc, backh);
8010861a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010861d:	8d 50 04             	lea    0x4(%eax),%edx
80108620:	89 55 f0             	mov    %edx,-0x10(%ebp)
80108623:	8b 00                	mov    (%eax),%eax
80108625:	83 ec 04             	sub    $0x4,%esp
80108628:	ff 75 14             	pushl  0x14(%ebp)
8010862b:	ff 75 10             	pushl  0x10(%ebp)
8010862e:	ff 75 0c             	pushl  0xc(%ebp)
80108631:	ff 75 08             	pushl  0x8(%ebp)
80108634:	6a 01                	push   $0x1
80108636:	6a 0a                	push   $0xa
80108638:	50                   	push   %eax
80108639:	e8 9e fc ff ff       	call   801082dc <color_printint>
8010863e:	83 c4 20             	add    $0x20,%esp
      break;
80108641:	e9 c9 00 00 00       	jmp    8010870f <color_cprintf+0x1ca>
    case 'x':
    case 'p':
      color_printint(*argp++, 16, 0,forec, foreh, backc, backh);
80108646:	8b 45 f0             	mov    -0x10(%ebp),%eax
80108649:	8d 50 04             	lea    0x4(%eax),%edx
8010864c:	89 55 f0             	mov    %edx,-0x10(%ebp)
8010864f:	8b 00                	mov    (%eax),%eax
80108651:	83 ec 04             	sub    $0x4,%esp
80108654:	ff 75 14             	pushl  0x14(%ebp)
80108657:	ff 75 10             	pushl  0x10(%ebp)
8010865a:	ff 75 0c             	pushl  0xc(%ebp)
8010865d:	ff 75 08             	pushl  0x8(%ebp)
80108660:	6a 00                	push   $0x0
80108662:	6a 10                	push   $0x10
80108664:	50                   	push   %eax
80108665:	e8 72 fc ff ff       	call   801082dc <color_printint>
8010866a:	83 c4 20             	add    $0x20,%esp
      break;
8010866d:	e9 9d 00 00 00       	jmp    8010870f <color_cprintf+0x1ca>
    case 's':
      if((s = (char*)*argp++) == 0)
80108672:	8b 45 f0             	mov    -0x10(%ebp),%eax
80108675:	8d 50 04             	lea    0x4(%eax),%edx
80108678:	89 55 f0             	mov    %edx,-0x10(%ebp)
8010867b:	8b 00                	mov    (%eax),%eax
8010867d:	89 45 ec             	mov    %eax,-0x14(%ebp)
80108680:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80108684:	75 3a                	jne    801086c0 <color_cprintf+0x17b>
        s = "(null)";
80108686:	c7 45 ec 95 9e 10 80 	movl   $0x80109e95,-0x14(%ebp)
      for(; *s; s++)
8010868d:	eb 31                	jmp    801086c0 <color_cprintf+0x17b>
        color_consputc(parseFont(*s,forec,foreh,backc,backh));
8010868f:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108692:	0f b6 00             	movzbl (%eax),%eax
80108695:	0f be c0             	movsbl %al,%eax
80108698:	83 ec 0c             	sub    $0xc,%esp
8010869b:	ff 75 14             	pushl  0x14(%ebp)
8010869e:	ff 75 10             	pushl  0x10(%ebp)
801086a1:	ff 75 0c             	pushl  0xc(%ebp)
801086a4:	ff 75 08             	pushl  0x8(%ebp)
801086a7:	50                   	push   %eax
801086a8:	e8 31 f5 ff ff       	call   80107bde <parseFont>
801086ad:	83 c4 20             	add    $0x20,%esp
801086b0:	83 ec 0c             	sub    $0xc,%esp
801086b3:	50                   	push   %eax
801086b4:	e8 78 07 00 00       	call   80108e31 <color_consputc>
801086b9:	83 c4 10             	add    $0x10,%esp
      color_printint(*argp++, 16, 0,forec, foreh, backc, backh);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801086bc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
801086c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
801086c3:	0f b6 00             	movzbl (%eax),%eax
801086c6:	84 c0                	test   %al,%al
801086c8:	75 c5                	jne    8010868f <color_cprintf+0x14a>
        color_consputc(parseFont(*s,forec,foreh,backc,backh));
      break;
801086ca:	eb 43                	jmp    8010870f <color_cprintf+0x1ca>
    case '%':
      color_consputc(parseFont('%',forec,foreh,backc,backh));
801086cc:	83 ec 0c             	sub    $0xc,%esp
801086cf:	ff 75 14             	pushl  0x14(%ebp)
801086d2:	ff 75 10             	pushl  0x10(%ebp)
801086d5:	ff 75 0c             	pushl  0xc(%ebp)
801086d8:	ff 75 08             	pushl  0x8(%ebp)
801086db:	6a 25                	push   $0x25
801086dd:	e8 fc f4 ff ff       	call   80107bde <parseFont>
801086e2:	83 c4 20             	add    $0x20,%esp
801086e5:	83 ec 0c             	sub    $0xc,%esp
801086e8:	50                   	push   %eax
801086e9:	e8 43 07 00 00       	call   80108e31 <color_consputc>
801086ee:	83 c4 10             	add    $0x10,%esp
      break;
801086f1:	eb 1c                	jmp    8010870f <color_cprintf+0x1ca>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
801086f3:	83 ec 0c             	sub    $0xc,%esp
801086f6:	6a 25                	push   $0x25
801086f8:	e8 cd 06 00 00       	call   80108dca <consputc>
801086fd:	83 c4 10             	add    $0x10,%esp
      consputc(c);
80108700:	83 ec 0c             	sub    $0xc,%esp
80108703:	ff 75 e4             	pushl  -0x1c(%ebp)
80108706:	e8 bf 06 00 00       	call   80108dca <consputc>
8010870b:	83 c4 10             	add    $0x10,%esp
      break;
8010870e:	90                   	nop

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
8010870f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80108713:	8b 55 18             	mov    0x18(%ebp),%edx
80108716:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108719:	01 d0                	add    %edx,%eax
8010871b:	0f b6 00             	movzbl (%eax),%eax
8010871e:	0f be c0             	movsbl %al,%eax
80108721:	25 ff 00 00 00       	and    $0xff,%eax
80108726:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80108729:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
8010872d:	0f 85 5f fe ff ff    	jne    80108592 <color_cprintf+0x4d>
80108733:	eb 01                	jmp    80108736 <color_cprintf+0x1f1>
      color_consputc(parseFont(c,forec,foreh,backc,backh));
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
80108735:	90                   	nop
      consputc(c);
      break;
    }
  }

  if(locking)
80108736:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
8010873a:	74 10                	je     8010874c <color_cprintf+0x207>
    release(&xv_cons.lock);
8010873c:	83 ec 0c             	sub    $0xc,%esp
8010873f:	68 40 c7 10 80       	push   $0x8010c740
80108744:	e8 2a bf ff ff       	call   80104673 <release>
80108749:	83 c4 10             	add    $0x10,%esp
}
8010874c:	90                   	nop
8010874d:	c9                   	leave  
8010874e:	c3                   	ret    

8010874f <panic>:

void
panic(char *s)
{
8010874f:	55                   	push   %ebp
80108750:	89 e5                	mov    %esp,%ebp
80108752:	83 ec 38             	sub    $0x38,%esp
  int i;
  uint pcs[10];
  
  cli();
80108755:	e8 fc f4 ff ff       	call   80107c56 <cli>
  xv_cons.locking = 0;
8010875a:	c7 05 74 c7 10 80 00 	movl   $0x0,0x8010c774
80108761:	00 00 00 
  cprintf("cpu%d: panic: ", cpu->id);
80108764:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010876a:	0f b6 00             	movzbl (%eax),%eax
8010876d:	0f b6 c0             	movzbl %al,%eax
80108770:	83 ec 08             	sub    $0x8,%esp
80108773:	50                   	push   %eax
80108774:	68 9c 9e 10 80       	push   $0x80109e9c
80108779:	e8 27 fc ff ff       	call   801083a5 <cprintf>
8010877e:	83 c4 10             	add    $0x10,%esp
  cprintf(s);
80108781:	8b 45 08             	mov    0x8(%ebp),%eax
80108784:	83 ec 0c             	sub    $0xc,%esp
80108787:	50                   	push   %eax
80108788:	e8 18 fc ff ff       	call   801083a5 <cprintf>
8010878d:	83 c4 10             	add    $0x10,%esp
  cprintf("\n");
80108790:	83 ec 0c             	sub    $0xc,%esp
80108793:	68 ab 9e 10 80       	push   $0x80109eab
80108798:	e8 08 fc ff ff       	call   801083a5 <cprintf>
8010879d:	83 c4 10             	add    $0x10,%esp
  getcallerpcs(&s, pcs);
801087a0:	83 ec 08             	sub    $0x8,%esp
801087a3:	8d 45 cc             	lea    -0x34(%ebp),%eax
801087a6:	50                   	push   %eax
801087a7:	8d 45 08             	lea    0x8(%ebp),%eax
801087aa:	50                   	push   %eax
801087ab:	e8 15 bf ff ff       	call   801046c5 <getcallerpcs>
801087b0:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
801087b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801087ba:	eb 1c                	jmp    801087d8 <panic+0x89>
    cprintf(" %p", pcs[i]);
801087bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801087bf:	8b 44 85 cc          	mov    -0x34(%ebp,%eax,4),%eax
801087c3:	83 ec 08             	sub    $0x8,%esp
801087c6:	50                   	push   %eax
801087c7:	68 ad 9e 10 80       	push   $0x80109ead
801087cc:	e8 d4 fb ff ff       	call   801083a5 <cprintf>
801087d1:	83 c4 10             	add    $0x10,%esp
  xv_cons.locking = 0;
  cprintf("cpu%d: panic: ", cpu->id);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801087d4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801087d8:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
801087dc:	7e de                	jle    801087bc <panic+0x6d>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801087de:	c7 05 24 c7 10 80 01 	movl   $0x1,0x8010c724
801087e5:	00 00 00 
  for(;;)
    ;
801087e8:	eb fe                	jmp    801087e8 <panic+0x99>

801087ea <color_panic>:
}

void
color_panic(char *s, int forec, int foreh, int backc, int backh)
{
801087ea:	55                   	push   %ebp
801087eb:	89 e5                	mov    %esp,%ebp
801087ed:	83 ec 38             	sub    $0x38,%esp
  int i;
  uint pcs[10];
  
  cli();
801087f0:	e8 61 f4 ff ff       	call   80107c56 <cli>
  xv_cons.locking = 0;
801087f5:	c7 05 74 c7 10 80 00 	movl   $0x0,0x8010c774
801087fc:	00 00 00 
  cprintf("cpu%d: panic: ", cpu->id);
801087ff:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80108805:	0f b6 00             	movzbl (%eax),%eax
80108808:	0f b6 c0             	movzbl %al,%eax
8010880b:	83 ec 08             	sub    $0x8,%esp
8010880e:	50                   	push   %eax
8010880f:	68 9c 9e 10 80       	push   $0x80109e9c
80108814:	e8 8c fb ff ff       	call   801083a5 <cprintf>
80108819:	83 c4 10             	add    $0x10,%esp
  color_cprintf(forec,foreh,backc,backh, s);
8010881c:	8b 45 08             	mov    0x8(%ebp),%eax
8010881f:	83 ec 0c             	sub    $0xc,%esp
80108822:	50                   	push   %eax
80108823:	ff 75 18             	pushl  0x18(%ebp)
80108826:	ff 75 14             	pushl  0x14(%ebp)
80108829:	ff 75 10             	pushl  0x10(%ebp)
8010882c:	ff 75 0c             	pushl  0xc(%ebp)
8010882f:	e8 11 fd ff ff       	call   80108545 <color_cprintf>
80108834:	83 c4 20             	add    $0x20,%esp
  cprintf("\n");
80108837:	83 ec 0c             	sub    $0xc,%esp
8010883a:	68 ab 9e 10 80       	push   $0x80109eab
8010883f:	e8 61 fb ff ff       	call   801083a5 <cprintf>
80108844:	83 c4 10             	add    $0x10,%esp
  getcallerpcs(&s, pcs);
80108847:	83 ec 08             	sub    $0x8,%esp
8010884a:	8d 45 cc             	lea    -0x34(%ebp),%eax
8010884d:	50                   	push   %eax
8010884e:	8d 45 08             	lea    0x8(%ebp),%eax
80108851:	50                   	push   %eax
80108852:	e8 6e be ff ff       	call   801046c5 <getcallerpcs>
80108857:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
8010885a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80108861:	eb 1c                	jmp    8010887f <color_panic+0x95>
    cprintf(" %p", pcs[i]);
80108863:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108866:	8b 44 85 cc          	mov    -0x34(%ebp,%eax,4),%eax
8010886a:	83 ec 08             	sub    $0x8,%esp
8010886d:	50                   	push   %eax
8010886e:	68 ad 9e 10 80       	push   $0x80109ead
80108873:	e8 2d fb ff ff       	call   801083a5 <cprintf>
80108878:	83 c4 10             	add    $0x10,%esp
  xv_cons.locking = 0;
  cprintf("cpu%d: panic: ", cpu->id);
  color_cprintf(forec,foreh,backc,backh, s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
8010887b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
8010887f:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
80108883:	7e de                	jle    80108863 <color_panic+0x79>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
80108885:	c7 05 24 c7 10 80 01 	movl   $0x1,0x8010c724
8010888c:	00 00 00 
  for(;;)
    ;
8010888f:	eb fe                	jmp    8010888f <color_panic+0xa5>

80108891 <cgaputc>:
#define CRTPORT 0x3d4
static ushort *crt = (ushort*)P2V(0xb8000);  // CGA memory

static void
cgaputc(int c)
{
80108891:	55                   	push   %ebp
80108892:	89 e5                	mov    %esp,%ebp
80108894:	83 ec 18             	sub    $0x18,%esp
  int pos;
  
  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
80108897:	6a 0e                	push   $0xe
80108899:	68 d4 03 00 00       	push   $0x3d4
8010889e:	e8 94 f3 ff ff       	call   80107c37 <outb>
801088a3:	83 c4 08             	add    $0x8,%esp
  pos = inb(CRTPORT+1) << 8;
801088a6:	68 d5 03 00 00       	push   $0x3d5
801088ab:	e8 6a f3 ff ff       	call   80107c1a <inb>
801088b0:	83 c4 04             	add    $0x4,%esp
801088b3:	0f b6 c0             	movzbl %al,%eax
801088b6:	c1 e0 08             	shl    $0x8,%eax
801088b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  outb(CRTPORT, 15);
801088bc:	6a 0f                	push   $0xf
801088be:	68 d4 03 00 00       	push   $0x3d4
801088c3:	e8 6f f3 ff ff       	call   80107c37 <outb>
801088c8:	83 c4 08             	add    $0x8,%esp
  pos |= inb(CRTPORT+1);
801088cb:	68 d5 03 00 00       	push   $0x3d5
801088d0:	e8 45 f3 ff ff       	call   80107c1a <inb>
801088d5:	83 c4 04             	add    $0x4,%esp
801088d8:	0f b6 c0             	movzbl %al,%eax
801088db:	09 45 f4             	or     %eax,-0xc(%ebp)

  if(c == '\n')
801088de:	83 7d 08 0a          	cmpl   $0xa,0x8(%ebp)
801088e2:	75 44                	jne    80108928 <cgaputc+0x97>
  {
    crt[pos] = ' ' | 0x0700;
801088e4:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
801088e9:	8b 55 f4             	mov    -0xc(%ebp),%edx
801088ec:	01 d2                	add    %edx,%edx
801088ee:	01 d0                	add    %edx,%eax
801088f0:	66 c7 00 20 07       	movw   $0x720,(%eax)
    pos += 80 - pos%80;
801088f5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
801088f8:	ba 67 66 66 66       	mov    $0x66666667,%edx
801088fd:	89 c8                	mov    %ecx,%eax
801088ff:	f7 ea                	imul   %edx
80108901:	c1 fa 05             	sar    $0x5,%edx
80108904:	89 c8                	mov    %ecx,%eax
80108906:	c1 f8 1f             	sar    $0x1f,%eax
80108909:	29 c2                	sub    %eax,%edx
8010890b:	89 d0                	mov    %edx,%eax
8010890d:	c1 e0 02             	shl    $0x2,%eax
80108910:	01 d0                	add    %edx,%eax
80108912:	c1 e0 04             	shl    $0x4,%eax
80108915:	29 c1                	sub    %eax,%ecx
80108917:	89 ca                	mov    %ecx,%edx
80108919:	b8 50 00 00 00       	mov    $0x50,%eax
8010891e:	29 d0                	sub    %edx,%eax
80108920:	01 45 f4             	add    %eax,-0xc(%ebp)
80108923:	e9 38 01 00 00       	jmp    80108a60 <cgaputc+0x1cf>
  }
  else if(c == BACKSPACE)
80108928:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
8010892f:	75 24                	jne    80108955 <cgaputc+0xc4>
  {
    if(pos > 0) 
80108931:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80108935:	0f 8e 25 01 00 00    	jle    80108a60 <cgaputc+0x1cf>
    {
      crt[pos] = ' ' | 0x0700;
8010893b:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108940:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108943:	01 d2                	add    %edx,%edx
80108945:	01 d0                	add    %edx,%eax
80108947:	66 c7 00 20 07       	movw   $0x720,(%eax)
      --pos;
8010894c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
80108950:	e9 0b 01 00 00       	jmp    80108a60 <cgaputc+0x1cf>
    }
  }
  else if(c == KEY_UP)
80108955:	81 7d 08 e2 00 00 00 	cmpl   $0xe2,0x8(%ebp)
8010895c:	75 37                	jne    80108995 <cgaputc+0x104>
  {
    if(pos >= 80)
8010895e:	83 7d f4 4f          	cmpl   $0x4f,-0xc(%ebp)
80108962:	0f 8e f8 00 00 00    	jle    80108a60 <cgaputc+0x1cf>
    {
      crt[pos] &= CUR_MASK;
80108968:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
8010896d:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108970:	01 d2                	add    %edx,%edx
80108972:	01 d0                	add    %edx,%eax
80108974:	8b 15 c8 c5 10 80    	mov    0x8010c5c8,%edx
8010897a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
8010897d:	01 c9                	add    %ecx,%ecx
8010897f:	01 ca                	add    %ecx,%edx
80108981:	0f b7 12             	movzwl (%edx),%edx
80108984:	66 81 e2 ff 6f       	and    $0x6fff,%dx
80108989:	66 89 10             	mov    %dx,(%eax)
      pos -= 80;
8010898c:	83 6d f4 50          	subl   $0x50,-0xc(%ebp)
80108990:	e9 cb 00 00 00       	jmp    80108a60 <cgaputc+0x1cf>
    }
  } 
  else if(c == KEY_DOWN)
80108995:	81 7d 08 e3 00 00 00 	cmpl   $0xe3,0x8(%ebp)
8010899c:	75 2d                	jne    801089cb <cgaputc+0x13a>
  {
      crt[pos] &= CUR_MASK;
8010899e:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
801089a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
801089a6:	01 d2                	add    %edx,%edx
801089a8:	01 d0                	add    %edx,%eax
801089aa:	8b 15 c8 c5 10 80    	mov    0x8010c5c8,%edx
801089b0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
801089b3:	01 c9                	add    %ecx,%ecx
801089b5:	01 ca                	add    %ecx,%edx
801089b7:	0f b7 12             	movzwl (%edx),%edx
801089ba:	66 81 e2 ff 6f       	and    $0x6fff,%dx
801089bf:	66 89 10             	mov    %dx,(%eax)
      pos += 80;
801089c2:	83 45 f4 50          	addl   $0x50,-0xc(%ebp)
801089c6:	e9 95 00 00 00       	jmp    80108a60 <cgaputc+0x1cf>
  } 
  else if(c == KEY_LEFT)
801089cb:	81 7d 08 e4 00 00 00 	cmpl   $0xe4,0x8(%ebp)
801089d2:	75 34                	jne    80108a08 <cgaputc+0x177>
  {
    if(pos > 0)
801089d4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801089d8:	0f 8e 82 00 00 00    	jle    80108a60 <cgaputc+0x1cf>
    {
      crt[pos] &= CUR_MASK;
801089de:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
801089e3:	8b 55 f4             	mov    -0xc(%ebp),%edx
801089e6:	01 d2                	add    %edx,%edx
801089e8:	01 d0                	add    %edx,%eax
801089ea:	8b 15 c8 c5 10 80    	mov    0x8010c5c8,%edx
801089f0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
801089f3:	01 c9                	add    %ecx,%ecx
801089f5:	01 ca                	add    %ecx,%edx
801089f7:	0f b7 12             	movzwl (%edx),%edx
801089fa:	66 81 e2 ff 6f       	and    $0x6fff,%dx
801089ff:	66 89 10             	mov    %dx,(%eax)
      pos--;
80108a02:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
80108a06:	eb 58                	jmp    80108a60 <cgaputc+0x1cf>
    }
  } 
  else if(c == KEY_RIGHT)
80108a08:	81 7d 08 e5 00 00 00 	cmpl   $0xe5,0x8(%ebp)
80108a0f:	75 33                	jne    80108a44 <cgaputc+0x1b3>
  {
    if(pos < 24*80)
80108a11:	81 7d f4 7f 07 00 00 	cmpl   $0x77f,-0xc(%ebp)
80108a18:	7f 46                	jg     80108a60 <cgaputc+0x1cf>
    {
      crt[pos] &= CUR_MASK;
80108a1a:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108a1f:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108a22:	01 d2                	add    %edx,%edx
80108a24:	01 d0                	add    %edx,%eax
80108a26:	8b 15 c8 c5 10 80    	mov    0x8010c5c8,%edx
80108a2c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108a2f:	01 c9                	add    %ecx,%ecx
80108a31:	01 ca                	add    %ecx,%edx
80108a33:	0f b7 12             	movzwl (%edx),%edx
80108a36:	66 81 e2 ff 6f       	and    $0x6fff,%dx
80108a3b:	66 89 10             	mov    %dx,(%eax)
      pos++;
80108a3e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80108a42:	eb 1c                	jmp    80108a60 <cgaputc+0x1cf>
    }
  } 
  else
    crt[pos++] = c | 0x0700;
80108a44:	8b 0d c8 c5 10 80    	mov    0x8010c5c8,%ecx
80108a4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108a4d:	8d 50 01             	lea    0x1(%eax),%edx
80108a50:	89 55 f4             	mov    %edx,-0xc(%ebp)
80108a53:	01 c0                	add    %eax,%eax
80108a55:	01 c8                	add    %ecx,%eax
80108a57:	8b 55 08             	mov    0x8(%ebp),%edx
80108a5a:	80 ce 07             	or     $0x7,%dh
80108a5d:	66 89 10             	mov    %dx,(%eax)
  
  if((pos/80) >= 24){  // Scroll up.
80108a60:	81 7d f4 7f 07 00 00 	cmpl   $0x77f,-0xc(%ebp)
80108a67:	7e 4c                	jle    80108ab5 <cgaputc+0x224>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80108a69:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108a6e:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
80108a74:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108a79:	83 ec 04             	sub    $0x4,%esp
80108a7c:	68 60 0e 00 00       	push   $0xe60
80108a81:	52                   	push   %edx
80108a82:	50                   	push   %eax
80108a83:	e8 a6 be ff ff       	call   8010492e <memmove>
80108a88:	83 c4 10             	add    $0x10,%esp
    pos -= 80;
80108a8b:	83 6d f4 50          	subl   $0x50,-0xc(%ebp)
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80108a8f:	b8 80 07 00 00       	mov    $0x780,%eax
80108a94:	2b 45 f4             	sub    -0xc(%ebp),%eax
80108a97:	8d 14 00             	lea    (%eax,%eax,1),%edx
80108a9a:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108a9f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108aa2:	01 c9                	add    %ecx,%ecx
80108aa4:	01 c8                	add    %ecx,%eax
80108aa6:	83 ec 04             	sub    $0x4,%esp
80108aa9:	52                   	push   %edx
80108aaa:	6a 00                	push   $0x0
80108aac:	50                   	push   %eax
80108aad:	e8 bd bd ff ff       	call   8010486f <memset>
80108ab2:	83 c4 10             	add    $0x10,%esp
  }
  
  outb(CRTPORT, 14);
80108ab5:	83 ec 08             	sub    $0x8,%esp
80108ab8:	6a 0e                	push   $0xe
80108aba:	68 d4 03 00 00       	push   $0x3d4
80108abf:	e8 73 f1 ff ff       	call   80107c37 <outb>
80108ac4:	83 c4 10             	add    $0x10,%esp
  outb(CRTPORT+1, pos>>8);
80108ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108aca:	c1 f8 08             	sar    $0x8,%eax
80108acd:	0f b6 c0             	movzbl %al,%eax
80108ad0:	83 ec 08             	sub    $0x8,%esp
80108ad3:	50                   	push   %eax
80108ad4:	68 d5 03 00 00       	push   $0x3d5
80108ad9:	e8 59 f1 ff ff       	call   80107c37 <outb>
80108ade:	83 c4 10             	add    $0x10,%esp
  outb(CRTPORT, 15);
80108ae1:	83 ec 08             	sub    $0x8,%esp
80108ae4:	6a 0f                	push   $0xf
80108ae6:	68 d4 03 00 00       	push   $0x3d4
80108aeb:	e8 47 f1 ff ff       	call   80107c37 <outb>
80108af0:	83 c4 10             	add    $0x10,%esp
  outb(CRTPORT+1, pos);
80108af3:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108af6:	0f b6 c0             	movzbl %al,%eax
80108af9:	83 ec 08             	sub    $0x8,%esp
80108afc:	50                   	push   %eax
80108afd:	68 d5 03 00 00       	push   $0x3d5
80108b02:	e8 30 f1 ff ff       	call   80107c37 <outb>
80108b07:	83 c4 10             	add    $0x10,%esp
  crt[pos] |= CUR_BACKGROUND;
80108b0a:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108b0f:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108b12:	01 d2                	add    %edx,%edx
80108b14:	01 d0                	add    %edx,%eax
80108b16:	8b 15 c8 c5 10 80    	mov    0x8010c5c8,%edx
80108b1c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108b1f:	01 c9                	add    %ecx,%ecx
80108b21:	01 ca                	add    %ecx,%edx
80108b23:	0f b7 12             	movzwl (%edx),%edx
80108b26:	66 81 ca 00 90       	or     $0x9000,%dx
80108b2b:	66 89 10             	mov    %dx,(%eax)
}
80108b2e:	90                   	nop
80108b2f:	c9                   	leave  
80108b30:	c3                   	ret    

80108b31 <color_cgaputc>:

static void
color_cgaputc(int c)
{
80108b31:	55                   	push   %ebp
80108b32:	89 e5                	mov    %esp,%ebp
80108b34:	83 ec 18             	sub    $0x18,%esp
  int pos;
  
  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
80108b37:	6a 0e                	push   $0xe
80108b39:	68 d4 03 00 00       	push   $0x3d4
80108b3e:	e8 f4 f0 ff ff       	call   80107c37 <outb>
80108b43:	83 c4 08             	add    $0x8,%esp
  pos = inb(CRTPORT+1) << 8;
80108b46:	68 d5 03 00 00       	push   $0x3d5
80108b4b:	e8 ca f0 ff ff       	call   80107c1a <inb>
80108b50:	83 c4 04             	add    $0x4,%esp
80108b53:	0f b6 c0             	movzbl %al,%eax
80108b56:	c1 e0 08             	shl    $0x8,%eax
80108b59:	89 45 f4             	mov    %eax,-0xc(%ebp)
  outb(CRTPORT, 15);
80108b5c:	6a 0f                	push   $0xf
80108b5e:	68 d4 03 00 00       	push   $0x3d4
80108b63:	e8 cf f0 ff ff       	call   80107c37 <outb>
80108b68:	83 c4 08             	add    $0x8,%esp
  pos |= inb(CRTPORT+1);
80108b6b:	68 d5 03 00 00       	push   $0x3d5
80108b70:	e8 a5 f0 ff ff       	call   80107c1a <inb>
80108b75:	83 c4 04             	add    $0x4,%esp
80108b78:	0f b6 c0             	movzbl %al,%eax
80108b7b:	09 45 f4             	or     %eax,-0xc(%ebp)

  if(c == '\n')
80108b7e:	83 7d 08 0a          	cmpl   $0xa,0x8(%ebp)
80108b82:	75 44                	jne    80108bc8 <color_cgaputc+0x97>
  {
    crt[pos] = ' ' | 0x0700;
80108b84:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108b89:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108b8c:	01 d2                	add    %edx,%edx
80108b8e:	01 d0                	add    %edx,%eax
80108b90:	66 c7 00 20 07       	movw   $0x720,(%eax)
    pos += 80 - pos%80;
80108b95:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108b98:	ba 67 66 66 66       	mov    $0x66666667,%edx
80108b9d:	89 c8                	mov    %ecx,%eax
80108b9f:	f7 ea                	imul   %edx
80108ba1:	c1 fa 05             	sar    $0x5,%edx
80108ba4:	89 c8                	mov    %ecx,%eax
80108ba6:	c1 f8 1f             	sar    $0x1f,%eax
80108ba9:	29 c2                	sub    %eax,%edx
80108bab:	89 d0                	mov    %edx,%eax
80108bad:	c1 e0 02             	shl    $0x2,%eax
80108bb0:	01 d0                	add    %edx,%eax
80108bb2:	c1 e0 04             	shl    $0x4,%eax
80108bb5:	29 c1                	sub    %eax,%ecx
80108bb7:	89 ca                	mov    %ecx,%edx
80108bb9:	b8 50 00 00 00       	mov    $0x50,%eax
80108bbe:	29 d0                	sub    %edx,%eax
80108bc0:	01 45 f4             	add    %eax,-0xc(%ebp)
80108bc3:	e9 31 01 00 00       	jmp    80108cf9 <color_cgaputc+0x1c8>
  }
  else if(c == BACKSPACE)
80108bc8:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
80108bcf:	75 24                	jne    80108bf5 <color_cgaputc+0xc4>
  {
    if(pos > 0)
80108bd1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80108bd5:	0f 8e 1e 01 00 00    	jle    80108cf9 <color_cgaputc+0x1c8>
    {
      crt[pos] = ' ' | 0x0700;
80108bdb:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108be0:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108be3:	01 d2                	add    %edx,%edx
80108be5:	01 d0                	add    %edx,%eax
80108be7:	66 c7 00 20 07       	movw   $0x720,(%eax)
      --pos;
80108bec:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
80108bf0:	e9 04 01 00 00       	jmp    80108cf9 <color_cgaputc+0x1c8>
    }
  }
  else if(c == KEY_UP)
80108bf5:	81 7d 08 e2 00 00 00 	cmpl   $0xe2,0x8(%ebp)
80108bfc:	75 37                	jne    80108c35 <color_cgaputc+0x104>
  {
    if(pos >= 80)
80108bfe:	83 7d f4 4f          	cmpl   $0x4f,-0xc(%ebp)
80108c02:	0f 8e f1 00 00 00    	jle    80108cf9 <color_cgaputc+0x1c8>
    {
      crt[pos] &= CUR_MASK;
80108c08:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108c0d:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108c10:	01 d2                	add    %edx,%edx
80108c12:	01 d0                	add    %edx,%eax
80108c14:	8b 15 c8 c5 10 80    	mov    0x8010c5c8,%edx
80108c1a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108c1d:	01 c9                	add    %ecx,%ecx
80108c1f:	01 ca                	add    %ecx,%edx
80108c21:	0f b7 12             	movzwl (%edx),%edx
80108c24:	66 81 e2 ff 6f       	and    $0x6fff,%dx
80108c29:	66 89 10             	mov    %dx,(%eax)
      pos -= 80;
80108c2c:	83 6d f4 50          	subl   $0x50,-0xc(%ebp)
80108c30:	e9 c4 00 00 00       	jmp    80108cf9 <color_cgaputc+0x1c8>
    }
  } 
  else if(c == KEY_DOWN)
80108c35:	81 7d 08 e3 00 00 00 	cmpl   $0xe3,0x8(%ebp)
80108c3c:	75 2d                	jne    80108c6b <color_cgaputc+0x13a>
  {
      crt[pos] &= CUR_MASK;
80108c3e:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108c43:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108c46:	01 d2                	add    %edx,%edx
80108c48:	01 d0                	add    %edx,%eax
80108c4a:	8b 15 c8 c5 10 80    	mov    0x8010c5c8,%edx
80108c50:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108c53:	01 c9                	add    %ecx,%ecx
80108c55:	01 ca                	add    %ecx,%edx
80108c57:	0f b7 12             	movzwl (%edx),%edx
80108c5a:	66 81 e2 ff 6f       	and    $0x6fff,%dx
80108c5f:	66 89 10             	mov    %dx,(%eax)
      pos += 80;
80108c62:	83 45 f4 50          	addl   $0x50,-0xc(%ebp)
80108c66:	e9 8e 00 00 00       	jmp    80108cf9 <color_cgaputc+0x1c8>
  } 
  else if(c == KEY_LEFT)
80108c6b:	81 7d 08 e4 00 00 00 	cmpl   $0xe4,0x8(%ebp)
80108c72:	75 30                	jne    80108ca4 <color_cgaputc+0x173>
  {
    if(pos > 0)
80108c74:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80108c78:	7e 7f                	jle    80108cf9 <color_cgaputc+0x1c8>
    {
      crt[pos] &= CUR_MASK;
80108c7a:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108c7f:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108c82:	01 d2                	add    %edx,%edx
80108c84:	01 d0                	add    %edx,%eax
80108c86:	8b 15 c8 c5 10 80    	mov    0x8010c5c8,%edx
80108c8c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108c8f:	01 c9                	add    %ecx,%ecx
80108c91:	01 ca                	add    %ecx,%edx
80108c93:	0f b7 12             	movzwl (%edx),%edx
80108c96:	66 81 e2 ff 6f       	and    $0x6fff,%dx
80108c9b:	66 89 10             	mov    %dx,(%eax)
      pos--;
80108c9e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
80108ca2:	eb 55                	jmp    80108cf9 <color_cgaputc+0x1c8>
    }
  } 
  else if(c == KEY_RIGHT)
80108ca4:	81 7d 08 e5 00 00 00 	cmpl   $0xe5,0x8(%ebp)
80108cab:	75 33                	jne    80108ce0 <color_cgaputc+0x1af>
  {
    if(pos < 24*80)
80108cad:	81 7d f4 7f 07 00 00 	cmpl   $0x77f,-0xc(%ebp)
80108cb4:	7f 43                	jg     80108cf9 <color_cgaputc+0x1c8>
    {
      crt[pos] &= CUR_MASK;
80108cb6:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108cbb:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108cbe:	01 d2                	add    %edx,%edx
80108cc0:	01 d0                	add    %edx,%eax
80108cc2:	8b 15 c8 c5 10 80    	mov    0x8010c5c8,%edx
80108cc8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108ccb:	01 c9                	add    %ecx,%ecx
80108ccd:	01 ca                	add    %ecx,%edx
80108ccf:	0f b7 12             	movzwl (%edx),%edx
80108cd2:	66 81 e2 ff 6f       	and    $0x6fff,%dx
80108cd7:	66 89 10             	mov    %dx,(%eax)
      pos++;
80108cda:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80108cde:	eb 19                	jmp    80108cf9 <color_cgaputc+0x1c8>
    }
  } 
  else
    crt[pos++] = c; //output font with color
80108ce0:	8b 0d c8 c5 10 80    	mov    0x8010c5c8,%ecx
80108ce6:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108ce9:	8d 50 01             	lea    0x1(%eax),%edx
80108cec:	89 55 f4             	mov    %edx,-0xc(%ebp)
80108cef:	01 c0                	add    %eax,%eax
80108cf1:	01 c8                	add    %ecx,%eax
80108cf3:	8b 55 08             	mov    0x8(%ebp),%edx
80108cf6:	66 89 10             	mov    %dx,(%eax)
  
  if((pos/80) >= 24){  // Scroll up.
80108cf9:	81 7d f4 7f 07 00 00 	cmpl   $0x77f,-0xc(%ebp)
80108d00:	7e 4c                	jle    80108d4e <color_cgaputc+0x21d>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80108d02:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108d07:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
80108d0d:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108d12:	83 ec 04             	sub    $0x4,%esp
80108d15:	68 60 0e 00 00       	push   $0xe60
80108d1a:	52                   	push   %edx
80108d1b:	50                   	push   %eax
80108d1c:	e8 0d bc ff ff       	call   8010492e <memmove>
80108d21:	83 c4 10             	add    $0x10,%esp
    pos -= 80;
80108d24:	83 6d f4 50          	subl   $0x50,-0xc(%ebp)
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80108d28:	b8 80 07 00 00       	mov    $0x780,%eax
80108d2d:	2b 45 f4             	sub    -0xc(%ebp),%eax
80108d30:	8d 14 00             	lea    (%eax,%eax,1),%edx
80108d33:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108d38:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108d3b:	01 c9                	add    %ecx,%ecx
80108d3d:	01 c8                	add    %ecx,%eax
80108d3f:	83 ec 04             	sub    $0x4,%esp
80108d42:	52                   	push   %edx
80108d43:	6a 00                	push   $0x0
80108d45:	50                   	push   %eax
80108d46:	e8 24 bb ff ff       	call   8010486f <memset>
80108d4b:	83 c4 10             	add    $0x10,%esp
  }
  
  outb(CRTPORT, 14);
80108d4e:	83 ec 08             	sub    $0x8,%esp
80108d51:	6a 0e                	push   $0xe
80108d53:	68 d4 03 00 00       	push   $0x3d4
80108d58:	e8 da ee ff ff       	call   80107c37 <outb>
80108d5d:	83 c4 10             	add    $0x10,%esp
  outb(CRTPORT+1, pos>>8);
80108d60:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108d63:	c1 f8 08             	sar    $0x8,%eax
80108d66:	0f b6 c0             	movzbl %al,%eax
80108d69:	83 ec 08             	sub    $0x8,%esp
80108d6c:	50                   	push   %eax
80108d6d:	68 d5 03 00 00       	push   $0x3d5
80108d72:	e8 c0 ee ff ff       	call   80107c37 <outb>
80108d77:	83 c4 10             	add    $0x10,%esp
  outb(CRTPORT, 15);
80108d7a:	83 ec 08             	sub    $0x8,%esp
80108d7d:	6a 0f                	push   $0xf
80108d7f:	68 d4 03 00 00       	push   $0x3d4
80108d84:	e8 ae ee ff ff       	call   80107c37 <outb>
80108d89:	83 c4 10             	add    $0x10,%esp
  outb(CRTPORT+1, pos);
80108d8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108d8f:	0f b6 c0             	movzbl %al,%eax
80108d92:	83 ec 08             	sub    $0x8,%esp
80108d95:	50                   	push   %eax
80108d96:	68 d5 03 00 00       	push   $0x3d5
80108d9b:	e8 97 ee ff ff       	call   80107c37 <outb>
80108da0:	83 c4 10             	add    $0x10,%esp
  crt[pos] |= CUR_BACKGROUND;
80108da3:	a1 c8 c5 10 80       	mov    0x8010c5c8,%eax
80108da8:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108dab:	01 d2                	add    %edx,%edx
80108dad:	01 d0                	add    %edx,%eax
80108daf:	8b 15 c8 c5 10 80    	mov    0x8010c5c8,%edx
80108db5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80108db8:	01 c9                	add    %ecx,%ecx
80108dba:	01 ca                	add    %ecx,%edx
80108dbc:	0f b7 12             	movzwl (%edx),%edx
80108dbf:	66 81 ca 00 90       	or     $0x9000,%dx
80108dc4:	66 89 10             	mov    %dx,(%eax)
}
80108dc7:	90                   	nop
80108dc8:	c9                   	leave  
80108dc9:	c3                   	ret    

80108dca <consputc>:

void
consputc(int c)
{
80108dca:	55                   	push   %ebp
80108dcb:	89 e5                	mov    %esp,%ebp
80108dcd:	83 ec 08             	sub    $0x8,%esp
  if(panicked){
80108dd0:	a1 24 c7 10 80       	mov    0x8010c724,%eax
80108dd5:	85 c0                	test   %eax,%eax
80108dd7:	74 07                	je     80108de0 <consputc+0x16>
    cli();
80108dd9:	e8 78 ee ff ff       	call   80107c56 <cli>
    for(;;)
      ;
80108dde:	eb fe                	jmp    80108dde <consputc+0x14>
  }

  if(c == BACKSPACE){
80108de0:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
80108de7:	75 29                	jne    80108e12 <consputc+0x48>
    uartputc('\b'); uartputc(' '); uartputc('\b');
80108de9:	83 ec 0c             	sub    $0xc,%esp
80108dec:	6a 08                	push   $0x8
80108dee:	e8 87 d4 ff ff       	call   8010627a <uartputc>
80108df3:	83 c4 10             	add    $0x10,%esp
80108df6:	83 ec 0c             	sub    $0xc,%esp
80108df9:	6a 20                	push   $0x20
80108dfb:	e8 7a d4 ff ff       	call   8010627a <uartputc>
80108e00:	83 c4 10             	add    $0x10,%esp
80108e03:	83 ec 0c             	sub    $0xc,%esp
80108e06:	6a 08                	push   $0x8
80108e08:	e8 6d d4 ff ff       	call   8010627a <uartputc>
80108e0d:	83 c4 10             	add    $0x10,%esp
80108e10:	eb 0e                	jmp    80108e20 <consputc+0x56>
  } else
    uartputc(c);
80108e12:	83 ec 0c             	sub    $0xc,%esp
80108e15:	ff 75 08             	pushl  0x8(%ebp)
80108e18:	e8 5d d4 ff ff       	call   8010627a <uartputc>
80108e1d:	83 c4 10             	add    $0x10,%esp
  cgaputc(c);
80108e20:	83 ec 0c             	sub    $0xc,%esp
80108e23:	ff 75 08             	pushl  0x8(%ebp)
80108e26:	e8 66 fa ff ff       	call   80108891 <cgaputc>
80108e2b:	83 c4 10             	add    $0x10,%esp
}
80108e2e:	90                   	nop
80108e2f:	c9                   	leave  
80108e30:	c3                   	ret    

80108e31 <color_consputc>:

//new
void
color_consputc(int c)
{
80108e31:	55                   	push   %ebp
80108e32:	89 e5                	mov    %esp,%ebp
80108e34:	83 ec 08             	sub    $0x8,%esp
  if(panicked){
80108e37:	a1 24 c7 10 80       	mov    0x8010c724,%eax
80108e3c:	85 c0                	test   %eax,%eax
80108e3e:	74 07                	je     80108e47 <color_consputc+0x16>
    cli();
80108e40:	e8 11 ee ff ff       	call   80107c56 <cli>
    for(;;)
      ;
80108e45:	eb fe                	jmp    80108e45 <color_consputc+0x14>
  }

  if(c == BACKSPACE){
80108e47:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
80108e4e:	75 29                	jne    80108e79 <color_consputc+0x48>
    uartputc('\b'); uartputc(' '); uartputc('\b');
80108e50:	83 ec 0c             	sub    $0xc,%esp
80108e53:	6a 08                	push   $0x8
80108e55:	e8 20 d4 ff ff       	call   8010627a <uartputc>
80108e5a:	83 c4 10             	add    $0x10,%esp
80108e5d:	83 ec 0c             	sub    $0xc,%esp
80108e60:	6a 20                	push   $0x20
80108e62:	e8 13 d4 ff ff       	call   8010627a <uartputc>
80108e67:	83 c4 10             	add    $0x10,%esp
80108e6a:	83 ec 0c             	sub    $0xc,%esp
80108e6d:	6a 08                	push   $0x8
80108e6f:	e8 06 d4 ff ff       	call   8010627a <uartputc>
80108e74:	83 c4 10             	add    $0x10,%esp
80108e77:	eb 12                	jmp    80108e8b <color_consputc+0x5a>
  } 
  else
    uartputc(c & 0xff);
80108e79:	8b 45 08             	mov    0x8(%ebp),%eax
80108e7c:	0f b6 c0             	movzbl %al,%eax
80108e7f:	83 ec 0c             	sub    $0xc,%esp
80108e82:	50                   	push   %eax
80108e83:	e8 f2 d3 ff ff       	call   8010627a <uartputc>
80108e88:	83 c4 10             	add    $0x10,%esp
  color_cgaputc(c);
80108e8b:	83 ec 0c             	sub    $0xc,%esp
80108e8e:	ff 75 08             	pushl  0x8(%ebp)
80108e91:	e8 9b fc ff ff       	call   80108b31 <color_cgaputc>
80108e96:	83 c4 10             	add    $0x10,%esp
}
80108e99:	90                   	nop
80108e9a:	c9                   	leave  
80108e9b:	c3                   	ret    

80108e9c <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
80108e9c:	55                   	push   %ebp
80108e9d:	89 e5                	mov    %esp,%ebp
80108e9f:	81 ec c8 00 00 00    	sub    $0xc8,%esp
  int c;

  acquire(&input.lock);
80108ea5:	83 ec 0c             	sub    $0xc,%esp
80108ea8:	68 a0 3a 11 80       	push   $0x80113aa0
80108ead:	e8 5a b7 ff ff       	call   8010460c <acquire>
80108eb2:	83 c4 10             	add    $0x10,%esp
  while((c = getc()) >= 0)
80108eb5:	e9 95 06 00 00       	jmp    8010954f <consoleintr+0x6b3>
  {
    switch(c)
80108eba:	8b 45 d8             	mov    -0x28(%ebp),%eax
80108ebd:	83 f8 7f             	cmp    $0x7f,%eax
80108ec0:	0f 84 c2 00 00 00    	je     80108f88 <consoleintr+0xec>
80108ec6:	83 f8 7f             	cmp    $0x7f,%eax
80108ec9:	7f 2b                	jg     80108ef6 <consoleintr+0x5a>
80108ecb:	83 f8 08             	cmp    $0x8,%eax
80108ece:	0f 84 b4 00 00 00    	je     80108f88 <consoleintr+0xec>
80108ed4:	83 f8 08             	cmp    $0x8,%eax
80108ed7:	7f 0e                	jg     80108ee7 <consoleintr+0x4b>
80108ed9:	83 f8 06             	cmp    $0x6,%eax
80108edc:	0f 84 01 02 00 00    	je     801090e3 <consoleintr+0x247>
80108ee2:	e9 35 04 00 00       	jmp    8010931c <consoleintr+0x480>
80108ee7:	83 f8 10             	cmp    $0x10,%eax
80108eea:	74 47                	je     80108f33 <consoleintr+0x97>
80108eec:	83 f8 15             	cmp    $0x15,%eax
80108eef:	74 69                	je     80108f5a <consoleintr+0xbe>
80108ef1:	e9 26 04 00 00       	jmp    8010931c <consoleintr+0x480>
80108ef6:	3d e3 00 00 00       	cmp    $0xe3,%eax
80108efb:	0f 84 f9 03 00 00    	je     801092fa <consoleintr+0x45e>
80108f01:	3d e3 00 00 00       	cmp    $0xe3,%eax
80108f06:	7f 10                	jg     80108f18 <consoleintr+0x7c>
80108f08:	3d e2 00 00 00       	cmp    $0xe2,%eax
80108f0d:	0f 84 c5 03 00 00    	je     801092d8 <consoleintr+0x43c>
80108f13:	e9 04 04 00 00       	jmp    8010931c <consoleintr+0x480>
80108f18:	3d e4 00 00 00       	cmp    $0xe4,%eax
80108f1d:	0f 84 71 03 00 00    	je     80109294 <consoleintr+0x3f8>
80108f23:	3d e5 00 00 00       	cmp    $0xe5,%eax
80108f28:	0f 84 88 03 00 00    	je     801092b6 <consoleintr+0x41a>
80108f2e:	e9 e9 03 00 00       	jmp    8010931c <consoleintr+0x480>
    {
    case C('P'):  // Process listing.
      procdump();
80108f33:	e8 81 b5 ff ff       	call   801044b9 <procdump>
      break;
80108f38:	e9 12 06 00 00       	jmp    8010954f <consoleintr+0x6b3>
    case C('U'):  // Kill line.
      while(input.e != input.w &&
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80108f3d:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
80108f42:	83 e8 01             	sub    $0x1,%eax
80108f45:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
        consputc(BACKSPACE);
80108f4a:	83 ec 0c             	sub    $0xc,%esp
80108f4d:	68 00 01 00 00       	push   $0x100
80108f52:	e8 73 fe ff ff       	call   80108dca <consputc>
80108f57:	83 c4 10             	add    $0x10,%esp
    {
    case C('P'):  // Process listing.
      procdump();
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80108f5a:	8b 15 5c 3b 11 80    	mov    0x80113b5c,%edx
80108f60:	a1 58 3b 11 80       	mov    0x80113b58,%eax
80108f65:	39 c2                	cmp    %eax,%edx
80108f67:	0f 84 d5 05 00 00    	je     80109542 <consoleintr+0x6a6>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80108f6d:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
80108f72:	83 e8 01             	sub    $0x1,%eax
80108f75:	83 e0 7f             	and    $0x7f,%eax
80108f78:	0f b6 80 d4 3a 11 80 	movzbl -0x7feec52c(%eax),%eax
    {
    case C('P'):  // Process listing.
      procdump();
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80108f7f:	3c 0a                	cmp    $0xa,%al
80108f81:	75 ba                	jne    80108f3d <consoleintr+0xa1>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
        consputc(BACKSPACE);
      }
      break;
80108f83:	e9 ba 05 00 00       	jmp    80109542 <consoleintr+0x6a6>
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w)
80108f88:	8b 15 5c 3b 11 80    	mov    0x80113b5c,%edx
80108f8e:	a1 58 3b 11 80       	mov    0x80113b58,%eax
80108f93:	39 c2                	cmp    %eax,%edx
80108f95:	0f 84 aa 05 00 00    	je     80109545 <consoleintr+0x6a9>
      {
        if(tohighlight > 0 && highlightlist[tohighlight-1].end == input.e-1)
80108f9b:	a1 20 c7 10 80       	mov    0x8010c720,%eax
80108fa0:	85 c0                	test   %eax,%eax
80108fa2:	0f 8e 19 01 00 00    	jle    801090c1 <consoleintr+0x225>
80108fa8:	a1 20 c7 10 80       	mov    0x8010c720,%eax
80108fad:	83 e8 01             	sub    $0x1,%eax
80108fb0:	8b 04 c5 84 37 11 80 	mov    -0x7feec87c(,%eax,8),%eax
80108fb7:	89 c2                	mov    %eax,%edx
80108fb9:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
80108fbe:	83 e8 01             	sub    $0x1,%eax
80108fc1:	39 c2                	cmp    %eax,%edx
80108fc3:	0f 85 f8 00 00 00    	jne    801090c1 <consoleintr+0x225>
        {
          int startIndex = highlightlist[tohighlight-1].start;
80108fc9:	a1 20 c7 10 80       	mov    0x8010c720,%eax
80108fce:	83 e8 01             	sub    $0x1,%eax
80108fd1:	8b 04 c5 80 37 11 80 	mov    -0x7feec880(,%eax,8),%eax
80108fd8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
          int wordlength = highlightlist[tohighlight-1].end - startIndex + 1;
80108fdb:	a1 20 c7 10 80       	mov    0x8010c720,%eax
80108fe0:	83 e8 01             	sub    $0x1,%eax
80108fe3:	8b 04 c5 84 37 11 80 	mov    -0x7feec87c(,%eax,8),%eax
80108fea:	2b 45 d4             	sub    -0x2c(%ebp),%eax
80108fed:	83 c0 01             	add    $0x1,%eax
80108ff0:	89 45 d0             	mov    %eax,-0x30(%ebp)
          int word[20];
          int j = 0;
80108ff3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
          for(; j<wordlength; j++)
80108ffa:	eb 20                	jmp    8010901c <consoleintr+0x180>
          {
            word[j] = input.buf[startIndex+j];
80108ffc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
80108fff:	8b 45 f4             	mov    -0xc(%ebp),%eax
80109002:	01 d0                	add    %edx,%eax
80109004:	0f b6 80 d4 3a 11 80 	movzbl -0x7feec52c(%eax),%eax
8010900b:	0f be d0             	movsbl %al,%edx
8010900e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80109011:	89 94 85 44 ff ff ff 	mov    %edx,-0xbc(%ebp,%eax,4)
        {
          int startIndex = highlightlist[tohighlight-1].start;
          int wordlength = highlightlist[tohighlight-1].end - startIndex + 1;
          int word[20];
          int j = 0;
          for(; j<wordlength; j++)
80109018:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
8010901c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010901f:	3b 45 d0             	cmp    -0x30(%ebp),%eax
80109022:	7c d8                	jl     80108ffc <consoleintr+0x160>
          {
            word[j] = input.buf[startIndex+j];
          }
          word[j] = '\0';
80109024:	8b 45 f4             	mov    -0xc(%ebp),%eax
80109027:	c7 84 85 44 ff ff ff 	movl   $0x0,-0xbc(%ebp,%eax,4)
8010902e:	00 00 00 00 
          for(int k=0; k<wordlength; k++)
80109032:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
80109039:	eb 21                	jmp    8010905c <consoleintr+0x1c0>
          {
            consputc(BACKSPACE);
8010903b:	83 ec 0c             	sub    $0xc,%esp
8010903e:	68 00 01 00 00       	push   $0x100
80109043:	e8 82 fd ff ff       	call   80108dca <consputc>
80109048:	83 c4 10             	add    $0x10,%esp
            input.e--;
8010904b:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
80109050:	83 e8 01             	sub    $0x1,%eax
80109053:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
          for(; j<wordlength; j++)
          {
            word[j] = input.buf[startIndex+j];
          }
          word[j] = '\0';
          for(int k=0; k<wordlength; k++)
80109058:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
8010905c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010905f:	3b 45 d0             	cmp    -0x30(%ebp),%eax
80109062:	7c d7                	jl     8010903b <consoleintr+0x19f>
          {
            consputc(BACKSPACE);
            input.e--;
          }
          for(j=0; j<wordlength; j++)
80109064:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
8010906b:	eb 3f                	jmp    801090ac <consoleintr+0x210>
          {
            input.buf[startIndex+j] = word[j];
8010906d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
80109070:	8b 45 f4             	mov    -0xc(%ebp),%eax
80109073:	01 c2                	add    %eax,%edx
80109075:	8b 45 f4             	mov    -0xc(%ebp),%eax
80109078:	8b 84 85 44 ff ff ff 	mov    -0xbc(%ebp,%eax,4),%eax
8010907f:	88 82 d4 3a 11 80    	mov    %al,-0x7feec52c(%edx)
            consputc(word[j]);
80109085:	8b 45 f4             	mov    -0xc(%ebp),%eax
80109088:	8b 84 85 44 ff ff ff 	mov    -0xbc(%ebp,%eax,4),%eax
8010908f:	83 ec 0c             	sub    $0xc,%esp
80109092:	50                   	push   %eax
80109093:	e8 32 fd ff ff       	call   80108dca <consputc>
80109098:	83 c4 10             	add    $0x10,%esp
            input.e++;
8010909b:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
801090a0:	83 c0 01             	add    $0x1,%eax
801090a3:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
          for(int k=0; k<wordlength; k++)
          {
            consputc(BACKSPACE);
            input.e--;
          }
          for(j=0; j<wordlength; j++)
801090a8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801090ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
801090af:	3b 45 d0             	cmp    -0x30(%ebp),%eax
801090b2:	7c b9                	jl     8010906d <consoleintr+0x1d1>
          {
            input.buf[startIndex+j] = word[j];
            consputc(word[j]);
            input.e++;
          }
          tohighlight--; 
801090b4:	a1 20 c7 10 80       	mov    0x8010c720,%eax
801090b9:	83 e8 01             	sub    $0x1,%eax
801090bc:	a3 20 c7 10 80       	mov    %eax,0x8010c720
        }
        input.e--;
801090c1:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
801090c6:	83 e8 01             	sub    $0x1,%eax
801090c9:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
        consputc(BACKSPACE);
801090ce:	83 ec 0c             	sub    $0xc,%esp
801090d1:	68 00 01 00 00       	push   $0x100
801090d6:	e8 ef fc ff ff       	call   80108dca <consputc>
801090db:	83 c4 10             	add    $0x10,%esp
      }
      break;
801090de:	e9 62 04 00 00       	jmp    80109545 <consoleintr+0x6a9>
    case C('F'): //auto complete
        if(input.e == input.w)
801090e3:	8b 15 5c 3b 11 80    	mov    0x80113b5c,%edx
801090e9:	a1 58 3b 11 80       	mov    0x80113b58,%eax
801090ee:	39 c2                	cmp    %eax,%edx
801090f0:	0f 84 52 04 00 00    	je     80109548 <consoleintr+0x6ac>
          break;
        int startIndex;
        for(startIndex = input.e-1; startIndex != input.w && input.buf[startIndex] != ' '; 
801090f6:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
801090fb:	83 e8 01             	sub    $0x1,%eax
801090fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
80109101:	eb 04                	jmp    80109107 <consoleintr+0x26b>
          startIndex--);
80109103:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
      break;
    case C('F'): //auto complete
        if(input.e == input.w)
          break;
        int startIndex;
        for(startIndex = input.e-1; startIndex != input.w && input.buf[startIndex] != ' '; 
80109107:	8b 15 58 3b 11 80    	mov    0x80113b58,%edx
8010910d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80109110:	39 c2                	cmp    %eax,%edx
80109112:	74 0f                	je     80109123 <consoleintr+0x287>
80109114:	8b 45 ec             	mov    -0x14(%ebp),%eax
80109117:	05 d4 3a 11 80       	add    $0x80113ad4,%eax
8010911c:	0f b6 00             	movzbl (%eax),%eax
8010911f:	3c 20                	cmp    $0x20,%al
80109121:	75 e0                	jne    80109103 <consoleintr+0x267>
          startIndex--);
        if(input.buf[startIndex] == ' ')
80109123:	8b 45 ec             	mov    -0x14(%ebp),%eax
80109126:	05 d4 3a 11 80       	add    $0x80113ad4,%eax
8010912b:	0f b6 00             	movzbl (%eax),%eax
8010912e:	3c 20                	cmp    $0x20,%al
80109130:	75 1a                	jne    8010914c <consoleintr+0x2b0>
          startIndex=(startIndex+1)%INPUT_BUF;
80109132:	8b 45 ec             	mov    -0x14(%ebp),%eax
80109135:	8d 50 01             	lea    0x1(%eax),%edx
80109138:	89 d0                	mov    %edx,%eax
8010913a:	c1 f8 1f             	sar    $0x1f,%eax
8010913d:	c1 e8 19             	shr    $0x19,%eax
80109140:	01 c2                	add    %eax,%edx
80109142:	83 e2 7f             	and    $0x7f,%edx
80109145:	29 c2                	sub    %eax,%edx
80109147:	89 d0                	mov    %edx,%eax
80109149:	89 45 ec             	mov    %eax,-0x14(%ebp)
        int wordlength = input.e-startIndex;
8010914c:	8b 15 5c 3b 11 80    	mov    0x80113b5c,%edx
80109152:	8b 45 ec             	mov    -0x14(%ebp),%eax
80109155:	29 c2                	sub    %eax,%edx
80109157:	89 d0                	mov    %edx,%eax
80109159:	89 45 cc             	mov    %eax,-0x34(%ebp)
        char word[20];
        int j = 0;
8010915c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
        for(; j<wordlength; j++)
80109163:	eb 1d                	jmp    80109182 <consoleintr+0x2e6>
        {
          word[j] = input.buf[startIndex+j];
80109165:	8b 55 ec             	mov    -0x14(%ebp),%edx
80109168:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010916b:	01 d0                	add    %edx,%eax
8010916d:	0f b6 80 d4 3a 11 80 	movzbl -0x7feec52c(%eax),%eax
80109174:	8d 4d a8             	lea    -0x58(%ebp),%ecx
80109177:	8b 55 e8             	mov    -0x18(%ebp),%edx
8010917a:	01 ca                	add    %ecx,%edx
8010917c:	88 02                	mov    %al,(%edx)
        if(input.buf[startIndex] == ' ')
          startIndex=(startIndex+1)%INPUT_BUF;
        int wordlength = input.e-startIndex;
        char word[20];
        int j = 0;
        for(; j<wordlength; j++)
8010917e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
80109182:	8b 45 e8             	mov    -0x18(%ebp),%eax
80109185:	3b 45 cc             	cmp    -0x34(%ebp),%eax
80109188:	7c db                	jl     80109165 <consoleintr+0x2c9>
        {
          word[j] = input.buf[startIndex+j];
        }
        word[j] = '\0';
8010918a:	8d 55 a8             	lea    -0x58(%ebp),%edx
8010918d:	8b 45 e8             	mov    -0x18(%ebp),%eax
80109190:	01 d0                	add    %edx,%eax
80109192:	c6 00 00             	movb   $0x0,(%eax)
        int findflag = autocomplete(word);
80109195:	83 ec 0c             	sub    $0xc,%esp
80109198:	8d 45 a8             	lea    -0x58(%ebp),%eax
8010919b:	50                   	push   %eax
8010919c:	e8 4d eb ff ff       	call   80107cee <autocomplete>
801091a1:	83 c4 10             	add    $0x10,%esp
801091a4:	89 45 c8             	mov    %eax,-0x38(%ebp)
        if(findflag != -1)
801091a7:	83 7d c8 ff          	cmpl   $0xffffffff,-0x38(%ebp)
801091ab:	0f 84 9a 03 00 00    	je     8010954b <consoleintr+0x6af>
        {
          int newwordlength = strlen(word);
801091b1:	83 ec 0c             	sub    $0xc,%esp
801091b4:	8d 45 a8             	lea    -0x58(%ebp),%eax
801091b7:	50                   	push   %eax
801091b8:	e8 ff b8 ff ff       	call   80104abc <strlen>
801091bd:	83 c4 10             	add    $0x10,%esp
801091c0:	89 45 c4             	mov    %eax,-0x3c(%ebp)
          //correct, auto complete and highlight
          for(int k=0; k<wordlength; k++)
801091c3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
801091ca:	eb 21                	jmp    801091ed <consoleintr+0x351>
          {
            consputc(BACKSPACE);
801091cc:	83 ec 0c             	sub    $0xc,%esp
801091cf:	68 00 01 00 00       	push   $0x100
801091d4:	e8 f1 fb ff ff       	call   80108dca <consputc>
801091d9:	83 c4 10             	add    $0x10,%esp
            input.e--;
801091dc:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
801091e1:	83 e8 01             	sub    $0x1,%eax
801091e4:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
        int findflag = autocomplete(word);
        if(findflag != -1)
        {
          int newwordlength = strlen(word);
          //correct, auto complete and highlight
          for(int k=0; k<wordlength; k++)
801091e9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801091ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801091f0:	3b 45 cc             	cmp    -0x34(%ebp),%eax
801091f3:	7c d7                	jl     801091cc <consoleintr+0x330>
          {
            consputc(BACKSPACE);
            input.e--;
          }
          for(j=0; j<newwordlength; j++)
801091f5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
801091fc:	eb 58                	jmp    80109256 <consoleintr+0x3ba>
          {
            input.buf[startIndex+j] = word[j];
801091fe:	8b 55 ec             	mov    -0x14(%ebp),%edx
80109201:	8b 45 e8             	mov    -0x18(%ebp),%eax
80109204:	01 c2                	add    %eax,%edx
80109206:	8d 4d a8             	lea    -0x58(%ebp),%ecx
80109209:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010920c:	01 c8                	add    %ecx,%eax
8010920e:	0f b6 00             	movzbl (%eax),%eax
80109211:	88 82 d4 3a 11 80    	mov    %al,-0x7feec52c(%edx)
            color_consputc(parseFont(word[j],XV_YELLOW,1,XV_BLACK,0));
80109217:	8d 55 a8             	lea    -0x58(%ebp),%edx
8010921a:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010921d:	01 d0                	add    %edx,%eax
8010921f:	0f b6 00             	movzbl (%eax),%eax
80109222:	0f be c0             	movsbl %al,%eax
80109225:	83 ec 0c             	sub    $0xc,%esp
80109228:	6a 00                	push   $0x0
8010922a:	6a 00                	push   $0x0
8010922c:	6a 01                	push   $0x1
8010922e:	6a 06                	push   $0x6
80109230:	50                   	push   %eax
80109231:	e8 a8 e9 ff ff       	call   80107bde <parseFont>
80109236:	83 c4 20             	add    $0x20,%esp
80109239:	83 ec 0c             	sub    $0xc,%esp
8010923c:	50                   	push   %eax
8010923d:	e8 ef fb ff ff       	call   80108e31 <color_consputc>
80109242:	83 c4 10             	add    $0x10,%esp
            input.e++;
80109245:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
8010924a:	83 c0 01             	add    $0x1,%eax
8010924d:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
          for(int k=0; k<wordlength; k++)
          {
            consputc(BACKSPACE);
            input.e--;
          }
          for(j=0; j<newwordlength; j++)
80109252:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
80109256:	8b 45 e8             	mov    -0x18(%ebp),%eax
80109259:	3b 45 c4             	cmp    -0x3c(%ebp),%eax
8010925c:	7c a0                	jl     801091fe <consoleintr+0x362>
          {
            input.buf[startIndex+j] = word[j];
            color_consputc(parseFont(word[j],XV_YELLOW,1,XV_BLACK,0));
            input.e++;
          }
          highlightlist[tohighlight].start = startIndex;
8010925e:	a1 20 c7 10 80       	mov    0x8010c720,%eax
80109263:	8b 55 ec             	mov    -0x14(%ebp),%edx
80109266:	89 14 c5 80 37 11 80 	mov    %edx,-0x7feec880(,%eax,8)
          highlightlist[tohighlight].end = input.e-1;
8010926d:	a1 20 c7 10 80       	mov    0x8010c720,%eax
80109272:	8b 15 5c 3b 11 80    	mov    0x80113b5c,%edx
80109278:	83 ea 01             	sub    $0x1,%edx
8010927b:	89 14 c5 84 37 11 80 	mov    %edx,-0x7feec87c(,%eax,8)
          tohighlight++;
80109282:	a1 20 c7 10 80       	mov    0x8010c720,%eax
80109287:	83 c0 01             	add    $0x1,%eax
8010928a:	a3 20 c7 10 80       	mov    %eax,0x8010c720
        }
    	  break;
8010928f:	e9 b7 02 00 00       	jmp    8010954b <consoleintr+0x6af>
    case KEY_LEFT:
      input.e--;
80109294:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
80109299:	83 e8 01             	sub    $0x1,%eax
8010929c:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
      consputc(KEY_LEFT);
801092a1:	83 ec 0c             	sub    $0xc,%esp
801092a4:	68 e4 00 00 00       	push   $0xe4
801092a9:	e8 1c fb ff ff       	call   80108dca <consputc>
801092ae:	83 c4 10             	add    $0x10,%esp
      break;
801092b1:	e9 99 02 00 00       	jmp    8010954f <consoleintr+0x6b3>
    case KEY_RIGHT:
      input.e++;
801092b6:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
801092bb:	83 c0 01             	add    $0x1,%eax
801092be:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
      consputc(KEY_RIGHT);
801092c3:	83 ec 0c             	sub    $0xc,%esp
801092c6:	68 e5 00 00 00       	push   $0xe5
801092cb:	e8 fa fa ff ff       	call   80108dca <consputc>
801092d0:	83 c4 10             	add    $0x10,%esp
      break;
801092d3:	e9 77 02 00 00       	jmp    8010954f <consoleintr+0x6b3>
    case KEY_UP:
      input.e -= 80;
801092d8:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
801092dd:	83 e8 50             	sub    $0x50,%eax
801092e0:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
      consputc(KEY_UP);
801092e5:	83 ec 0c             	sub    $0xc,%esp
801092e8:	68 e2 00 00 00       	push   $0xe2
801092ed:	e8 d8 fa ff ff       	call   80108dca <consputc>
801092f2:	83 c4 10             	add    $0x10,%esp
      break;
801092f5:	e9 55 02 00 00       	jmp    8010954f <consoleintr+0x6b3>
    case KEY_DOWN:
      input.e += 80;
801092fa:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
801092ff:	83 c0 50             	add    $0x50,%eax
80109302:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
      consputc(KEY_DOWN);
80109307:	83 ec 0c             	sub    $0xc,%esp
8010930a:	68 e3 00 00 00       	push   $0xe3
8010930f:	e8 b6 fa ff ff       	call   80108dca <consputc>
80109314:	83 c4 10             	add    $0x10,%esp
      break;
80109317:	e9 33 02 00 00       	jmp    8010954f <consoleintr+0x6b3>
    default:
	        if(c != 0 && input.e-input.r < INPUT_BUF)
8010931c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
80109320:	0f 84 28 02 00 00    	je     8010954e <consoleintr+0x6b2>
80109326:	8b 15 5c 3b 11 80    	mov    0x80113b5c,%edx
8010932c:	a1 54 3b 11 80       	mov    0x80113b54,%eax
80109331:	29 c2                	sub    %eax,%edx
80109333:	89 d0                	mov    %edx,%eax
80109335:	83 f8 7f             	cmp    $0x7f,%eax
80109338:	0f 87 10 02 00 00    	ja     8010954e <consoleintr+0x6b2>
      	  {
            c = (c == '\r') ? '\n' : c;
8010933e:	83 7d d8 0d          	cmpl   $0xd,-0x28(%ebp)
80109342:	74 05                	je     80109349 <consoleintr+0x4ad>
80109344:	8b 45 d8             	mov    -0x28(%ebp),%eax
80109347:	eb 05                	jmp    8010934e <consoleintr+0x4b2>
80109349:	b8 0a 00 00 00       	mov    $0xa,%eax
8010934e:	89 45 d8             	mov    %eax,-0x28(%ebp)
            input.buf[input.e++ % INPUT_BUF] = c;
80109351:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
80109356:	8d 50 01             	lea    0x1(%eax),%edx
80109359:	89 15 5c 3b 11 80    	mov    %edx,0x80113b5c
8010935f:	83 e0 7f             	and    $0x7f,%eax
80109362:	8b 55 d8             	mov    -0x28(%ebp),%edx
80109365:	88 90 d4 3a 11 80    	mov    %dl,-0x7feec52c(%eax)
            consputc(c);
8010936b:	83 ec 0c             	sub    $0xc,%esp
8010936e:	ff 75 d8             	pushl  -0x28(%ebp)
80109371:	e8 54 fa ff ff       	call   80108dca <consputc>
80109376:	83 c4 10             	add    $0x10,%esp
            //decide if this is a key word to be highlighted
            int startIndex;
            for(startIndex = input.e-1; startIndex != input.w && input.buf[startIndex] != ' '; 
80109379:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
8010937e:	83 e8 01             	sub    $0x1,%eax
80109381:	89 45 e0             	mov    %eax,-0x20(%ebp)
80109384:	eb 04                	jmp    8010938a <consoleintr+0x4ee>
              startIndex--);
80109386:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
            c = (c == '\r') ? '\n' : c;
            input.buf[input.e++ % INPUT_BUF] = c;
            consputc(c);
            //decide if this is a key word to be highlighted
            int startIndex;
            for(startIndex = input.e-1; startIndex != input.w && input.buf[startIndex] != ' '; 
8010938a:	8b 15 58 3b 11 80    	mov    0x80113b58,%edx
80109390:	8b 45 e0             	mov    -0x20(%ebp),%eax
80109393:	39 c2                	cmp    %eax,%edx
80109395:	74 0f                	je     801093a6 <consoleintr+0x50a>
80109397:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010939a:	05 d4 3a 11 80       	add    $0x80113ad4,%eax
8010939f:	0f b6 00             	movzbl (%eax),%eax
801093a2:	3c 20                	cmp    $0x20,%al
801093a4:	75 e0                	jne    80109386 <consoleintr+0x4ea>
              startIndex--);
            if(input.buf[startIndex] == ' ')
801093a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801093a9:	05 d4 3a 11 80       	add    $0x80113ad4,%eax
801093ae:	0f b6 00             	movzbl (%eax),%eax
801093b1:	3c 20                	cmp    $0x20,%al
801093b3:	75 1a                	jne    801093cf <consoleintr+0x533>
              startIndex=(startIndex+1)%INPUT_BUF;
801093b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
801093b8:	8d 50 01             	lea    0x1(%eax),%edx
801093bb:	89 d0                	mov    %edx,%eax
801093bd:	c1 f8 1f             	sar    $0x1f,%eax
801093c0:	c1 e8 19             	shr    $0x19,%eax
801093c3:	01 c2                	add    %eax,%edx
801093c5:	83 e2 7f             	and    $0x7f,%edx
801093c8:	29 c2                	sub    %eax,%edx
801093ca:	89 d0                	mov    %edx,%eax
801093cc:	89 45 e0             	mov    %eax,-0x20(%ebp)
            int wordlength = input.e-startIndex;
801093cf:	8b 15 5c 3b 11 80    	mov    0x80113b5c,%edx
801093d5:	8b 45 e0             	mov    -0x20(%ebp),%eax
801093d8:	29 c2                	sub    %eax,%edx
801093da:	89 d0                	mov    %edx,%eax
801093dc:	89 45 c0             	mov    %eax,-0x40(%ebp)
            char word[20];
            int j = 0;
801093df:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
            for(; j<wordlength; j++)
801093e6:	eb 1d                	jmp    80109405 <consoleintr+0x569>
            {
              word[j] = input.buf[startIndex+j];
801093e8:	8b 55 e0             	mov    -0x20(%ebp),%edx
801093eb:	8b 45 dc             	mov    -0x24(%ebp),%eax
801093ee:	01 d0                	add    %edx,%eax
801093f0:	0f b6 80 d4 3a 11 80 	movzbl -0x7feec52c(%eax),%eax
801093f7:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
801093fa:	8b 55 dc             	mov    -0x24(%ebp),%edx
801093fd:	01 ca                	add    %ecx,%edx
801093ff:	88 02                	mov    %al,(%edx)
            if(input.buf[startIndex] == ' ')
              startIndex=(startIndex+1)%INPUT_BUF;
            int wordlength = input.e-startIndex;
            char word[20];
            int j = 0;
            for(; j<wordlength; j++)
80109401:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
80109405:	8b 45 dc             	mov    -0x24(%ebp),%eax
80109408:	3b 45 c0             	cmp    -0x40(%ebp),%eax
8010940b:	7c db                	jl     801093e8 <consoleintr+0x54c>
            {
              word[j] = input.buf[startIndex+j];
            }
            word[j] = '\0';
8010940d:	8d 55 94             	lea    -0x6c(%ebp),%edx
80109410:	8b 45 dc             	mov    -0x24(%ebp),%eax
80109413:	01 d0                	add    %edx,%eax
80109415:	c6 00 00             	movb   $0x0,(%eax)
            if(isKeyWord(word) == 1)
80109418:	83 ec 0c             	sub    $0xc,%esp
8010941b:	8d 45 94             	lea    -0x6c(%ebp),%eax
8010941e:	50                   	push   %eax
8010941f:	e8 39 e8 ff ff       	call   80107c5d <isKeyWord>
80109424:	83 c4 10             	add    $0x10,%esp
80109427:	83 f8 01             	cmp    $0x1,%eax
8010942a:	0f 85 d8 00 00 00    	jne    80109508 <consoleintr+0x66c>
            {
              int newwordlength = strlen(word);
80109430:	83 ec 0c             	sub    $0xc,%esp
80109433:	8d 45 94             	lea    -0x6c(%ebp),%eax
80109436:	50                   	push   %eax
80109437:	e8 80 b6 ff ff       	call   80104abc <strlen>
8010943c:	83 c4 10             	add    $0x10,%esp
8010943f:	89 45 bc             	mov    %eax,-0x44(%ebp)
              //highlight
              while(input.e > startIndex)
80109442:	eb 1d                	jmp    80109461 <consoleintr+0x5c5>
              {
                input.e--;
80109444:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
80109449:	83 e8 01             	sub    $0x1,%eax
8010944c:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
                consputc(BACKSPACE);
80109451:	83 ec 0c             	sub    $0xc,%esp
80109454:	68 00 01 00 00       	push   $0x100
80109459:	e8 6c f9 ff ff       	call   80108dca <consputc>
8010945e:	83 c4 10             	add    $0x10,%esp
            word[j] = '\0';
            if(isKeyWord(word) == 1)
            {
              int newwordlength = strlen(word);
              //highlight
              while(input.e > startIndex)
80109461:	8b 15 5c 3b 11 80    	mov    0x80113b5c,%edx
80109467:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010946a:	39 c2                	cmp    %eax,%edx
8010946c:	77 d6                	ja     80109444 <consoleintr+0x5a8>
              {
                input.e--;
                consputc(BACKSPACE);
              }
              for(j=0; j<newwordlength; j++)
8010946e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80109475:	eb 58                	jmp    801094cf <consoleintr+0x633>
              {
                input.buf[startIndex+j] = word[j];
80109477:	8b 55 e0             	mov    -0x20(%ebp),%edx
8010947a:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010947d:	01 c2                	add    %eax,%edx
8010947f:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
80109482:	8b 45 dc             	mov    -0x24(%ebp),%eax
80109485:	01 c8                	add    %ecx,%eax
80109487:	0f b6 00             	movzbl (%eax),%eax
8010948a:	88 82 d4 3a 11 80    	mov    %al,-0x7feec52c(%edx)
                color_consputc(parseFont(word[j],XV_YELLOW,1,XV_BLACK,0));
80109490:	8d 55 94             	lea    -0x6c(%ebp),%edx
80109493:	8b 45 dc             	mov    -0x24(%ebp),%eax
80109496:	01 d0                	add    %edx,%eax
80109498:	0f b6 00             	movzbl (%eax),%eax
8010949b:	0f be c0             	movsbl %al,%eax
8010949e:	83 ec 0c             	sub    $0xc,%esp
801094a1:	6a 00                	push   $0x0
801094a3:	6a 00                	push   $0x0
801094a5:	6a 01                	push   $0x1
801094a7:	6a 06                	push   $0x6
801094a9:	50                   	push   %eax
801094aa:	e8 2f e7 ff ff       	call   80107bde <parseFont>
801094af:	83 c4 20             	add    $0x20,%esp
801094b2:	83 ec 0c             	sub    $0xc,%esp
801094b5:	50                   	push   %eax
801094b6:	e8 76 f9 ff ff       	call   80108e31 <color_consputc>
801094bb:	83 c4 10             	add    $0x10,%esp
                input.e++;
801094be:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
801094c3:	83 c0 01             	add    $0x1,%eax
801094c6:	a3 5c 3b 11 80       	mov    %eax,0x80113b5c
              while(input.e > startIndex)
              {
                input.e--;
                consputc(BACKSPACE);
              }
              for(j=0; j<newwordlength; j++)
801094cb:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
801094cf:	8b 45 dc             	mov    -0x24(%ebp),%eax
801094d2:	3b 45 bc             	cmp    -0x44(%ebp),%eax
801094d5:	7c a0                	jl     80109477 <consoleintr+0x5db>
              {
                input.buf[startIndex+j] = word[j];
                color_consputc(parseFont(word[j],XV_YELLOW,1,XV_BLACK,0));
                input.e++;
              }
              highlightlist[tohighlight].start = startIndex;
801094d7:	a1 20 c7 10 80       	mov    0x8010c720,%eax
801094dc:	8b 55 e0             	mov    -0x20(%ebp),%edx
801094df:	89 14 c5 80 37 11 80 	mov    %edx,-0x7feec880(,%eax,8)
              highlightlist[tohighlight].end = input.e-1;
801094e6:	a1 20 c7 10 80       	mov    0x8010c720,%eax
801094eb:	8b 15 5c 3b 11 80    	mov    0x80113b5c,%edx
801094f1:	83 ea 01             	sub    $0x1,%edx
801094f4:	89 14 c5 84 37 11 80 	mov    %edx,-0x7feec87c(,%eax,8)
              tohighlight++;
801094fb:	a1 20 c7 10 80       	mov    0x8010c720,%eax
80109500:	83 c0 01             	add    $0x1,%eax
80109503:	a3 20 c7 10 80       	mov    %eax,0x8010c720
            }
            if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF) 
80109508:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
8010950c:	74 18                	je     80109526 <consoleintr+0x68a>
8010950e:	83 7d d8 04          	cmpl   $0x4,-0x28(%ebp)
80109512:	74 12                	je     80109526 <consoleintr+0x68a>
80109514:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
80109519:	8b 15 54 3b 11 80    	mov    0x80113b54,%edx
8010951f:	83 ea 80             	sub    $0xffffff80,%edx
80109522:	39 d0                	cmp    %edx,%eax
80109524:	75 28                	jne    8010954e <consoleintr+0x6b2>
            {
              input.w = input.e;
80109526:	a1 5c 3b 11 80       	mov    0x80113b5c,%eax
8010952b:	a3 58 3b 11 80       	mov    %eax,0x80113b58
              wakeup(&input.r);
80109530:	83 ec 0c             	sub    $0xc,%esp
80109533:	68 54 3b 11 80       	push   $0x80113b54
80109538:	e8 c1 ae ff ff       	call   801043fe <wakeup>
8010953d:	83 c4 10             	add    $0x10,%esp
            }
          }
          break;
80109540:	eb 0c                	jmp    8010954e <consoleintr+0x6b2>
      while(input.e != input.w &&
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
        consputc(BACKSPACE);
      }
      break;
80109542:	90                   	nop
80109543:	eb 0a                	jmp    8010954f <consoleintr+0x6b3>
          tohighlight--; 
        }
        input.e--;
        consputc(BACKSPACE);
      }
      break;
80109545:	90                   	nop
80109546:	eb 07                	jmp    8010954f <consoleintr+0x6b3>
    case C('F'): //auto complete
        if(input.e == input.w)
          break;
80109548:	90                   	nop
80109549:	eb 04                	jmp    8010954f <consoleintr+0x6b3>
          }
          highlightlist[tohighlight].start = startIndex;
          highlightlist[tohighlight].end = input.e-1;
          tohighlight++;
        }
    	  break;
8010954b:	90                   	nop
8010954c:	eb 01                	jmp    8010954f <consoleintr+0x6b3>
            {
              input.w = input.e;
              wakeup(&input.r);
            }
          }
          break;
8010954e:	90                   	nop
consoleintr(int (*getc)(void))
{
  int c;

  acquire(&input.lock);
  while((c = getc()) >= 0)
8010954f:	8b 45 08             	mov    0x8(%ebp),%eax
80109552:	ff d0                	call   *%eax
80109554:	89 45 d8             	mov    %eax,-0x28(%ebp)
80109557:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
8010955b:	0f 89 59 f9 ff ff    	jns    80108eba <consoleintr+0x1e>
            }
          }
          break;
	  }
  }
  release(&input.lock);
80109561:	83 ec 0c             	sub    $0xc,%esp
80109564:	68 a0 3a 11 80       	push   $0x80113aa0
80109569:	e8 05 b1 ff ff       	call   80104673 <release>
8010956e:	83 c4 10             	add    $0x10,%esp
}
80109571:	90                   	nop
80109572:	c9                   	leave  
80109573:	c3                   	ret    

80109574 <consoleread>:

int
consoleread(struct inode *ip, char *dst, int n)
{
80109574:	55                   	push   %ebp
80109575:	89 e5                	mov    %esp,%ebp
80109577:	83 ec 18             	sub    $0x18,%esp
  uint target;
  int c;

  iunlock(ip);
8010957a:	83 ec 0c             	sub    $0xc,%esp
8010957d:	ff 75 08             	pushl  0x8(%ebp)
80109580:	e8 4d 7d ff ff       	call   801012d2 <iunlock>
80109585:	83 c4 10             	add    $0x10,%esp
  target = n;
80109588:	8b 45 10             	mov    0x10(%ebp),%eax
8010958b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  acquire(&input.lock);
8010958e:	83 ec 0c             	sub    $0xc,%esp
80109591:	68 a0 3a 11 80       	push   $0x80113aa0
80109596:	e8 71 b0 ff ff       	call   8010460c <acquire>
8010959b:	83 c4 10             	add    $0x10,%esp
  while(n > 0){
8010959e:	e9 ac 00 00 00       	jmp    8010964f <consoleread+0xdb>
    while(input.r == input.w){
      if(proc->killed){
801095a3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801095a9:	8b 40 24             	mov    0x24(%eax),%eax
801095ac:	85 c0                	test   %eax,%eax
801095ae:	74 28                	je     801095d8 <consoleread+0x64>
        release(&input.lock);
801095b0:	83 ec 0c             	sub    $0xc,%esp
801095b3:	68 a0 3a 11 80       	push   $0x80113aa0
801095b8:	e8 b6 b0 ff ff       	call   80104673 <release>
801095bd:	83 c4 10             	add    $0x10,%esp
        ilock(ip);
801095c0:	83 ec 0c             	sub    $0xc,%esp
801095c3:	ff 75 08             	pushl  0x8(%ebp)
801095c6:	e8 af 7b ff ff       	call   8010117a <ilock>
801095cb:	83 c4 10             	add    $0x10,%esp
        return -1;
801095ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801095d3:	e9 ab 00 00 00       	jmp    80109683 <consoleread+0x10f>
      }
      sleep(&input.r, &input.lock);
801095d8:	83 ec 08             	sub    $0x8,%esp
801095db:	68 a0 3a 11 80       	push   $0x80113aa0
801095e0:	68 54 3b 11 80       	push   $0x80113b54
801095e5:	e8 29 ad ff ff       	call   80104313 <sleep>
801095ea:	83 c4 10             	add    $0x10,%esp

  iunlock(ip);
  target = n;
  acquire(&input.lock);
  while(n > 0){
    while(input.r == input.w){
801095ed:	8b 15 54 3b 11 80    	mov    0x80113b54,%edx
801095f3:	a1 58 3b 11 80       	mov    0x80113b58,%eax
801095f8:	39 c2                	cmp    %eax,%edx
801095fa:	74 a7                	je     801095a3 <consoleread+0x2f>
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &input.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
801095fc:	a1 54 3b 11 80       	mov    0x80113b54,%eax
80109601:	8d 50 01             	lea    0x1(%eax),%edx
80109604:	89 15 54 3b 11 80    	mov    %edx,0x80113b54
8010960a:	83 e0 7f             	and    $0x7f,%eax
8010960d:	0f b6 80 d4 3a 11 80 	movzbl -0x7feec52c(%eax),%eax
80109614:	0f be c0             	movsbl %al,%eax
80109617:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(c == C('D')){  // EOF
8010961a:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
8010961e:	75 17                	jne    80109637 <consoleread+0xc3>
      if(n < target){
80109620:	8b 45 10             	mov    0x10(%ebp),%eax
80109623:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80109626:	73 2f                	jae    80109657 <consoleread+0xe3>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80109628:	a1 54 3b 11 80       	mov    0x80113b54,%eax
8010962d:	83 e8 01             	sub    $0x1,%eax
80109630:	a3 54 3b 11 80       	mov    %eax,0x80113b54
      }
      break;
80109635:	eb 20                	jmp    80109657 <consoleread+0xe3>
    }
    *dst++ = c;
80109637:	8b 45 0c             	mov    0xc(%ebp),%eax
8010963a:	8d 50 01             	lea    0x1(%eax),%edx
8010963d:	89 55 0c             	mov    %edx,0xc(%ebp)
80109640:	8b 55 f0             	mov    -0x10(%ebp),%edx
80109643:	88 10                	mov    %dl,(%eax)
    --n;
80109645:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    if(c == '\n')
80109649:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
8010964d:	74 0b                	je     8010965a <consoleread+0xe6>
  int c;

  iunlock(ip);
  target = n;
  acquire(&input.lock);
  while(n > 0){
8010964f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80109653:	7f 98                	jg     801095ed <consoleread+0x79>
80109655:	eb 04                	jmp    8010965b <consoleread+0xe7>
      if(n < target){
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
80109657:	90                   	nop
80109658:	eb 01                	jmp    8010965b <consoleread+0xe7>
    }
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
8010965a:	90                   	nop
  }
  release(&input.lock);
8010965b:	83 ec 0c             	sub    $0xc,%esp
8010965e:	68 a0 3a 11 80       	push   $0x80113aa0
80109663:	e8 0b b0 ff ff       	call   80104673 <release>
80109668:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
8010966b:	83 ec 0c             	sub    $0xc,%esp
8010966e:	ff 75 08             	pushl  0x8(%ebp)
80109671:	e8 04 7b ff ff       	call   8010117a <ilock>
80109676:	83 c4 10             	add    $0x10,%esp

  return target - n;
80109679:	8b 45 10             	mov    0x10(%ebp),%eax
8010967c:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010967f:	29 c2                	sub    %eax,%edx
80109681:	89 d0                	mov    %edx,%eax
}
80109683:	c9                   	leave  
80109684:	c3                   	ret    

80109685 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80109685:	55                   	push   %ebp
80109686:	89 e5                	mov    %esp,%ebp
80109688:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
8010968b:	83 ec 0c             	sub    $0xc,%esp
8010968e:	ff 75 08             	pushl  0x8(%ebp)
80109691:	e8 3c 7c ff ff       	call   801012d2 <iunlock>
80109696:	83 c4 10             	add    $0x10,%esp
  acquire(&xv_cons.lock);
80109699:	83 ec 0c             	sub    $0xc,%esp
8010969c:	68 40 c7 10 80       	push   $0x8010c740
801096a1:	e8 66 af ff ff       	call   8010460c <acquire>
801096a6:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < n; i++)
801096a9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801096b0:	eb 21                	jmp    801096d3 <consolewrite+0x4e>
    consputc(buf[i] & 0xff);
801096b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
801096b5:	8b 45 0c             	mov    0xc(%ebp),%eax
801096b8:	01 d0                	add    %edx,%eax
801096ba:	0f b6 00             	movzbl (%eax),%eax
801096bd:	0f be c0             	movsbl %al,%eax
801096c0:	0f b6 c0             	movzbl %al,%eax
801096c3:	83 ec 0c             	sub    $0xc,%esp
801096c6:	50                   	push   %eax
801096c7:	e8 fe f6 ff ff       	call   80108dca <consputc>
801096cc:	83 c4 10             	add    $0x10,%esp
{
  int i;

  iunlock(ip);
  acquire(&xv_cons.lock);
  for(i = 0; i < n; i++)
801096cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801096d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801096d6:	3b 45 10             	cmp    0x10(%ebp),%eax
801096d9:	7c d7                	jl     801096b2 <consolewrite+0x2d>
    consputc(buf[i] & 0xff);
  release(&xv_cons.lock);
801096db:	83 ec 0c             	sub    $0xc,%esp
801096de:	68 40 c7 10 80       	push   $0x8010c740
801096e3:	e8 8b af ff ff       	call   80104673 <release>
801096e8:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
801096eb:	83 ec 0c             	sub    $0xc,%esp
801096ee:	ff 75 08             	pushl  0x8(%ebp)
801096f1:	e8 84 7a ff ff       	call   8010117a <ilock>
801096f6:	83 c4 10             	add    $0x10,%esp

  return n;
801096f9:	8b 45 10             	mov    0x10(%ebp),%eax
}
801096fc:	c9                   	leave  
801096fd:	c3                   	ret    

801096fe <consolecolorwrite>:

int
consolecolorwrite(struct inode *ip, char *buf, int n, int forec, int foreh, int backc, int backh)
{
801096fe:	55                   	push   %ebp
801096ff:	89 e5                	mov    %esp,%ebp
80109701:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80109704:	83 ec 0c             	sub    $0xc,%esp
80109707:	ff 75 08             	pushl  0x8(%ebp)
8010970a:	e8 c3 7b ff ff       	call   801012d2 <iunlock>
8010970f:	83 c4 10             	add    $0x10,%esp
  acquire(&xv_cons.lock);
80109712:	83 ec 0c             	sub    $0xc,%esp
80109715:	68 40 c7 10 80       	push   $0x8010c740
8010971a:	e8 ed ae ff ff       	call   8010460c <acquire>
8010971f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < n; i++)
80109722:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80109729:	eb 64                	jmp    8010978f <consolecolorwrite+0x91>
  {
    if(buf[i] != '\n' && buf[i] != BACKSPACE)
8010972b:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010972e:	8b 45 0c             	mov    0xc(%ebp),%eax
80109731:	01 d0                	add    %edx,%eax
80109733:	0f b6 00             	movzbl (%eax),%eax
80109736:	3c 0a                	cmp    $0xa,%al
80109738:	74 34                	je     8010976e <consolecolorwrite+0x70>
    {
     color_consputc(parseFont(buf[i],forec,foreh,backc,backh));
8010973a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010973d:	8b 45 0c             	mov    0xc(%ebp),%eax
80109740:	01 d0                	add    %edx,%eax
80109742:	0f b6 00             	movzbl (%eax),%eax
80109745:	0f be c0             	movsbl %al,%eax
80109748:	83 ec 0c             	sub    $0xc,%esp
8010974b:	ff 75 20             	pushl  0x20(%ebp)
8010974e:	ff 75 1c             	pushl  0x1c(%ebp)
80109751:	ff 75 18             	pushl  0x18(%ebp)
80109754:	ff 75 14             	pushl  0x14(%ebp)
80109757:	50                   	push   %eax
80109758:	e8 81 e4 ff ff       	call   80107bde <parseFont>
8010975d:	83 c4 20             	add    $0x20,%esp
80109760:	83 ec 0c             	sub    $0xc,%esp
80109763:	50                   	push   %eax
80109764:	e8 c8 f6 ff ff       	call   80108e31 <color_consputc>
80109769:	83 c4 10             	add    $0x10,%esp
8010976c:	eb 1d                	jmp    8010978b <consolecolorwrite+0x8d>
     } 
    else
       consputc(buf[i] & 0xff);
8010976e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80109771:	8b 45 0c             	mov    0xc(%ebp),%eax
80109774:	01 d0                	add    %edx,%eax
80109776:	0f b6 00             	movzbl (%eax),%eax
80109779:	0f be c0             	movsbl %al,%eax
8010977c:	0f b6 c0             	movzbl %al,%eax
8010977f:	83 ec 0c             	sub    $0xc,%esp
80109782:	50                   	push   %eax
80109783:	e8 42 f6 ff ff       	call   80108dca <consputc>
80109788:	83 c4 10             	add    $0x10,%esp
{
  int i;

  iunlock(ip);
  acquire(&xv_cons.lock);
  for(i = 0; i < n; i++)
8010978b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
8010978f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80109792:	3b 45 10             	cmp    0x10(%ebp),%eax
80109795:	7c 94                	jl     8010972b <consolecolorwrite+0x2d>
     color_consputc(parseFont(buf[i],forec,foreh,backc,backh));
     } 
    else
       consputc(buf[i] & 0xff);
  }
  release(&xv_cons.lock);
80109797:	83 ec 0c             	sub    $0xc,%esp
8010979a:	68 40 c7 10 80       	push   $0x8010c740
8010979f:	e8 cf ae ff ff       	call   80104673 <release>
801097a4:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
801097a7:	83 ec 0c             	sub    $0xc,%esp
801097aa:	ff 75 08             	pushl  0x8(%ebp)
801097ad:	e8 c8 79 ff ff       	call   8010117a <ilock>
801097b2:	83 c4 10             	add    $0x10,%esp

  return n;
801097b5:	8b 45 10             	mov    0x10(%ebp),%eax
}
801097b8:	c9                   	leave  
801097b9:	c3                   	ret    

801097ba <consoleinit>:

void
consoleinit(void)
{
801097ba:	55                   	push   %ebp
801097bb:	89 e5                	mov    %esp,%ebp
801097bd:	83 ec 08             	sub    $0x8,%esp
  initlock(&xv_cons.lock, "xv_console");
801097c0:	83 ec 08             	sub    $0x8,%esp
801097c3:	68 b1 9e 10 80       	push   $0x80109eb1
801097c8:	68 40 c7 10 80       	push   $0x8010c740
801097cd:	e8 18 ae ff ff       	call   801045ea <initlock>
801097d2:	83 c4 10             	add    $0x10,%esp
  initlock(&input.lock, "input");
801097d5:	83 ec 08             	sub    $0x8,%esp
801097d8:	68 bc 9e 10 80       	push   $0x80109ebc
801097dd:	68 a0 3a 11 80       	push   $0x80113aa0
801097e2:	e8 03 ae ff ff       	call   801045ea <initlock>
801097e7:	83 c4 10             	add    $0x10,%esp

  devsw[CONSOLE].write = consolewrite;
801097ea:	c7 05 70 f8 10 80 85 	movl   $0x80109685,0x8010f870
801097f1:	96 10 80 
  devsw[CONSOLE].read = consoleread;
801097f4:	c7 05 6c f8 10 80 74 	movl   $0x80109574,0x8010f86c
801097fb:	95 10 80 
  devsw[CONSOLE].colorwrite = consolecolorwrite;
801097fe:	c7 05 74 f8 10 80 fe 	movl   $0x801096fe,0x8010f874
80109805:	96 10 80 
  xv_cons.locking = 1;
80109808:	c7 05 74 c7 10 80 01 	movl   $0x1,0x8010c774
8010980f:	00 00 00 

  picenable(IRQ_KBD);
80109812:	83 ec 0c             	sub    $0xc,%esp
80109815:	6a 01                	push   $0x1
80109817:	e8 5b 9d ff ff       	call   80103577 <picenable>
8010981c:	83 c4 10             	add    $0x10,%esp
  ioapicenable(IRQ_KBD, 0);
8010981f:	83 ec 08             	sub    $0x8,%esp
80109822:	6a 00                	push   $0x0
80109824:	6a 01                	push   $0x1
80109826:	e8 53 8c ff ff       	call   8010247e <ioapicenable>
8010982b:	83 c4 10             	add    $0x10,%esp
}
8010982e:	90                   	nop
8010982f:	c9                   	leave  
80109830:	c3                   	ret    
