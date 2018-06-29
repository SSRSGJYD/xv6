#include "types.h"
#include "user.h"
#include "stat.h"

#include "xv_user.h"
#include "xv_color.h"
#include "xv_variable.h"

int main(int argc, char *argv[])
{
  struct variable variables[V_MAX];
  int v_num = 0;
  int i = 1;
  int setfore = 0; //mark whether there is optional arg
  int setback = 0; //mark whether there is optional arg
  int forec = XV_WHITE;
  int backc = XV_BLACK;
  char colorname[8] = {'B','b','g','c','r','p','y','w'};
  int hasfault = 0; // mark if there is any fault
  if(argv[1][0] == '-') //foreground color
  {
      for(int j=0; j<8; j++) 
      {
         if(argv[1][1] == colorname[j])
         {
           forec = j;
           setfore = 1;
           break;
         }
      }
      if(setfore == 1)
      { 
         i = 2;
	       if(argv[1][2] == '-') //background color
         {
	          for(int j=0; j<8; j++)
	          {
              if(argv[1][3] == colorname[j] && argv[1][4] == '\0')
              {
		            backc = j;
		            setback = 1;
                break;
              }
	          }
            if(setback == 0) //has forec but no " "
            { 
              hasfault = 1;
            }
         }
         else if(argv[1][2] != '\0')
         {
            hasfault = 1;
	       }
      } 
  }
  if(hasfault == 0) //correct color argument format
  {
     for(; i < argc; i++)
     {
       int j = 0;
        while(argv[i][j] != '\0')
        {
          if(argv[i][j] != '$')
          {
            color_putc(argv[i][j],forec,1,backc,0);
            j++;
          }
          else //judge whether this is a real variable
          {
            int index = 0;
            int isVariable = 0;
            int pos = j; //save the pos
            j++;
            int k=j+1;
            int lenv = strlen(argv[i]);
            if(argv[i][j] == '{')
            {
              for(; k<lenv; k++)
              {
                if(argv[i][k] == '}')
                  break;
              }
              if(argv[i][k] == '}')
              {
                char name[V_NAME_MAX_LEN];
                int len = k-j-1;
                for(int t=0; t<len; t++)
                {
                  name[t] = argv[i][t+j+1];
                }
                name[len] = '\0'; //name of the variable
                if(v_num == 0)
                  readVariables(variables,&v_num);
                
            
                for(; index<v_num; index++)
                {
                  if(strcmp(variables[index].name,name) == 0) //exist var
                    break;
                }
                if(index < v_num) //exist such variable
                {
                  isVariable = 1;
                }
              }
            }
            if(isVariable == 1)
            {
              if(variables[index].type == V_DOUBLE)
              {
                color_printf(forec,1,backc,0,"%f",variables[index].value.dvalue);
              }
              else
              {
                color_printf(forec,1,backc,0,"%s",variables[index].value.str);
              }
            }
            else
            {
              for(int cur = pos; cur<=k; cur++)
              {
                color_putc(argv[i][cur],forec,1,backc,0);
              }
            }
            j = k+1;
          }
        }
        if(i+1 < argc)
          color_putc(' ',forec,1,backc,0);
        else
          color_putc('\n',forec,1,backc,0);
     }
  }
  else
  {
    color_printf(XV_RED,1,XV_BLACK,0,"uncorrect xvecho color argument!\n");
  }
  exit();
}
