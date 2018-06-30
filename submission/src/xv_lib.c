#include "user.h"

#include "xv_lib.h"
#include "xv_color.h"
#include "xv_user.h"
#include "xv_defs.h"

void panic1(char *s)
{
  printf(2, "%s\n", s);
  exit();
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

void int2str(char *inbuf, int num, int *pos, int base, int sgn)
{
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && num < 0){
    neg = 1;
    x = -num;
  } else {
    x = num;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
  {
    inbuf[*pos] = buf[i];
    (*pos)++;
  }
}

void double2str(char *buf, double num, int *pos)
{
  if(num < 0)
  {
    buf[*pos] = '-';
    (*pos)++;
    num = -num;
  }
  int integer = getInteger(num);
  int2str(buf,integer,pos,10,1);
  num -= integer;
  if(num > 1e-6)
  {
    buf[*pos] = '.';
    (*pos)++;
  }
  int digits = 0;
  while(num > 1e-6)
  {
    num = num*10;
    integer = getInteger(num);
    int2str(buf,integer,pos,10,1);
    num -= integer;
    digits++;
    if(digits > 6)
    {
      break;
    }
  }
}

double pow(double opnd, int power)
{
  double result = 1;
  while(power > 0)
  {
    result *= opnd;
    power--;
  }
  return result;
}

double Translation(char *s, int* pos)
{
    double integer = 0;
    double remainder = 0;
    while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
    {
        integer *= 10;
        integer += (s[(*pos)] - '0');
        (*pos)++;
    }
    if (s[(*pos)] == '.')
    {
        (*pos)++;
        int c = 1;
        while (s[(*pos)] >= '0' && s[(*pos)] <= '9')
        {
            double t = s[(*pos)] - '0';
            t *= pow(0.1, c);
            c++;
            remainder += t;
            (*pos)++;
        }
    }
    return integer + remainder;
}