#include "types.h"
#include "user.h"
#include "fcntl.h"

#include "xv_color.h"
#include "xv_user.h"
#include "xv_variable.h"
#include "xv_lib.h"

void readVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
  int n;
  char buf[1000];
  int fd;
  if((fd = open("variables",O_RDONLY)) < 0)
  {
    color_printf(XV_CYAN,1,XV_BLACK,0,"No variables!\n");
    return;
  }
  *v_num = 0;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
    int pos = 0;
    while(pos <= n-1)
    {
      char name[V_NAME_MAX_LEN];
      int nameEnd = 1;
      while(buf[pos+nameEnd] != '=')
      {
        name[nameEnd-1] = buf[pos+nameEnd];
        nameEnd++;
      }
      name[nameEnd-1] = '\0'; //now at '='
      if(buf[pos] == 'd') //double value
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        double result = Translation(buf,&pos);
        variables[*v_num].value.dvalue = result;
        variables[*v_num].type = V_DOUBLE;
        (*v_num)++;
        pos++;
      }
      else //string
      {
        strcpy(variables[*v_num].name,name);
        pos += (nameEnd + 1);
        int strend = pos;
        while(buf[strend] != '\0')
        {
          strend++;
        }
        variables[*v_num].value.str = (char*)malloc(strend-pos+1);
        for(int k = pos; k <= strend; k++)
        {
          variables[*v_num].value.str[k-pos] = buf[k];
        }
        variables[*v_num].type = V_STRING;
        (*v_num)++;
        pos = strend+1;
      }
    }
  }
  close(fd);
}

void writeVariables(struct variable* variables, int *v_num) //format: dname=value or sname=string
{
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
  {
    close(fd);
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  for(int i=0; i<*v_num; i++)
  {
    if(variables[i].type == V_DOUBLE)
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 'd';
      int k=0;
      while(variables[i].name[k] != '\0')
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      double2str(buf,variables[i].value.dvalue,&pos);
      buf[pos++] = '\0';
      write(fd,buf,pos);
    }
    else //string
    {
      char buf[100];
      int pos = 0;
      buf[pos++] = 's';
      int k=0;
      while(variables[i].name[k] != '\0')
      {
        buf[pos++] = variables[i].name[k];
        k++;
      }
      buf[pos++] = '=';
      k=0;
      while(variables[i].value.str[k] != '\0')
      {
        buf[pos++] = variables[i].value.str[k];
        k++;
      }
      buf[pos++] = '\0';
      write(fd,buf,pos);
      free(variables[i].value.str);
    }
  }
  *v_num = 0;
  close(fd);
  return;
}