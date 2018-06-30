#ifndef XV_VARIABLE_H
#define XV_VARIABLE_H

#define V_DOUBLE 1
#define V_STRING 2

#define V_MAX 20
#define V_NAME_MAX_LEN 20

struct variable
{
  int type;
  char name[V_NAME_MAX_LEN];
  union
  {
    double dvalue;
    char *str;
  }value;
};

void readVariables(struct variable* variables, int *v_num);
void writeVariables(struct variable* variables, int *v_num);

#endif