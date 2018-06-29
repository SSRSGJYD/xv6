#ifndef XV_USER_H
#define XV_USER_H

//new system calls
int colorwrite(char*,int,int,int,int,int);


//print to console with color
void color_putc(char, int, int, int, int);
void color_printint(int xx, int base, int sgn, int, int, int, int);
void color_printf(int, int, int, int, char *, ...);
void color_printdbl(double,int,int,int,int);
void panic1(char *s);

#endif
