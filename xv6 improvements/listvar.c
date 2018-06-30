#include "types.h"
#include "user.h"
#include "stat.h"

#include "xv_user.h"
#include "xv_color.h"
#include "xv_variable.h"

int main(void)
{
    struct variable variables[V_MAX];
    int v_num = 0;
    readVariables(variables,&v_num);
    for(int i=0; i<v_num; i++)
    {
        if(variables[i].type == V_DOUBLE)
        {
            color_printf(XV_CYAN,1,XV_BLACK,0,"%s=%f\n",variables[i].name,
                variables[i].value.dvalue);
        }
        else
        {
            color_printf(XV_CYAN,1,XV_BLACK,0,"%s=\"%s\"\n",variables[i].name,
                variables[i].value.str);
            free(variables[i].value.str);
        }
    }
    exit();
}