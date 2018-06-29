#ifndef XV_STACK_H
#define XV_STACK_H

#define STACK_MAX 20

struct istack //integer
{
    int size;
    int value[STACK_MAX];
    int top;
};

//constructor
struct istack* istack();
void pushi(struct istack* s, int val);
int popi(struct istack* s);
int topi(struct istack* s);

struct cstack //integer
{
    int size;
    char value[STACK_MAX];
    int top;
};

//constructor
struct cstack* cstack();
void pushc(struct cstack* s, char val);
char popc(struct cstack* s);
char topc(struct cstack* s);

struct dstack //integer
{
    int size;
    double value[STACK_MAX];
    int top;
};

//constructorc
struct dstack* dstack();
void pushd(struct dstack* s, double val);
double popd(struct dstack* s);
double topd(struct dstack* s);

#endif