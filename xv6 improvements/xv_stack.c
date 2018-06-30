#include "user.h"

#include "xv_stack.h"

//constructor
struct istack* istack()
{
    struct istack *stack = (struct istack*)malloc(sizeof(struct istack));
    stack->size = 0;
    stack->top = -1;
    return stack;
}

void pushi(struct istack *s, int val)
{
    if(s->size < STACK_MAX)
    {
        s->size++;
        s->top++;
        s->value[s->top] = val;
    }
}

int popi(struct istack *s)
{
    if(s->size == 0)
    {
        return -1;
    }
    s->size--;
    s->top--;
    return s->value[s->top+1];
}

int topi(struct istack* s)
{
    return s->value[s->top];
}

//constructor
struct cstack* cstack()
{
    struct cstack *stack = (struct cstack*)malloc(sizeof(struct cstack));
    stack->size = 0;
    stack->top = -1;
    return stack;
}

void pushc(struct cstack *s, char val)
{
    if(s->size < STACK_MAX)
    {
        s->size++;
        s->top++;
        s->value[s->top] = val;
    }
}

char popc(struct cstack *s)
{
    if(s->size == 0)
    {
        return -1;
    }
    s->size--;
    s->top--;
    return s->value[s->top+1];
}

char topc(struct cstack* s)
{
    return s->value[s->top];
}

//constructor
struct dstack* dstack()
{
    struct dstack *stack = (struct dstack*)malloc(sizeof(struct dstack));
    stack->size = 0;
    stack->top = -1;
    return stack;
}

void pushd(struct dstack *s, double val)
{
    if(s->size < STACK_MAX)
    {
        s->size++;
        s->top++;
        s->value[s->top] = val;
    }
}

double popd(struct dstack *s)
{
    if(s->size == 0)
    {
        return -1;
    }
    s->size--;
    s->top--;
    return s->value[s->top+1];
}

double topd(struct dstack* s)
{
    return s->value[s->top];
}