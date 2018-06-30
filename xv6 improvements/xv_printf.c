//print to console with color

#include "types.h"
#include "stat.h"
#include "user.h"

#include "xv_user.h"
#include "xv_color.h"

void color_putc(char c, int forec, int foreh, int backc, int backh)
{
  colorwrite(&c, 1, forec, foreh, backc, backh);
}

void color_printint(int xx, int base, int sgn, int forec, int foreh, int backc, int backh)
{
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    color_putc(buf[i],forec,foreh,backc,backh);
}

static int getInteger(double num)
{
  int integer = 0;
  while(num > 1)
  {
    num -= 1;
    integer++;
  }
  return integer;
}

void color_printdbl(double num,int forec,int foreh,int backc,int backh)
{
  if(num < 0)
  {
    color_putc('-',forec,foreh,backc,backh);
    num = -num;
  }
  int integer = getInteger(num);
  color_printint(integer,10,1,forec,foreh,backc,backh);
  num -= integer;
  if(num > 1e-6)
    color_putc('.',forec,foreh,backc,backh);
  int digits = 0;
  while(num > 1e-6)
  {
    num = num*10;
    integer = getInteger(num);
    color_printint(integer,10,1,forec,foreh,backc,backh);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    }
  }
}

// Print to console. Only understands %d, %x, %p, %s. 
// add %f for double
void
color_printf(int forec, int foreh, int backc, int backh, char *fmt, ...)
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        color_putc(c,forec,foreh,backc,backh);
      }
    } else if(state == '%'){
      if(c == 'd'){
        color_printint(*ap, 10, 1,forec,foreh,backc,backh);
        ap++;
      } else if(c == 'x' || c == 'p'){
        color_printint(*ap, 16, 0,forec,foreh,backc,backh);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          color_putc(*s,forec,foreh,backc,backh);
          s++;
        }
      } else if(c == 'c'){
        color_putc(*ap,forec,foreh,backc,backh);
        ap++;
      } else if(c == '%'){
        color_putc(c,forec,foreh,backc,backh);
      } else if(c == 'f'){ //for double
        double *dap = (double*)ap;
        color_printdbl(*dap,forec,foreh,backc,backh);
        ap += 2;
      } 
      else {
        // Unknown % sequence.  Print it to draw attention.
        color_putc('%',forec,foreh,backc,backh);
        color_putc(c,forec,foreh,backc,backh);
      }
      state = 0;
    }
  }
}
