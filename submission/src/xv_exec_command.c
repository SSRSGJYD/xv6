#include "types.h"
#include "user.h"
#include "fcntl.h"

#include "xv_cmdtable.h"
#include "xv_exec_command.h"
#include "xv_user.h"
#include "xv_color.h"
#include "xv_stack.h"
#include "xv_lib.h"
#include "xv_variable.h"
#include "xv_fork.h"

#define EPS 1e-6
#define WRONG_ANS 1e30

struct variable variables[V_MAX];
int v_num = 0;

static int mystrncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}

static int mystrlen(const char *s)
{
  int n;
  for(n = 0; s[n]; n++)
    ;
  return n;
}

static char* mystrncpy(char *s, const char *t, int n)
{
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    *s++ = 0;
  return os;
}

int isEqual(double a, double b)
{
  if(a-b < EPS && b-a < EPS)
    return 1;
  return 0;
}

int isCmdName(const char* str)
{
  for(int i=0; i<XV_CMD_NUM; i++)
  {
    if(strlen(cmdtable[i]) == mystrlen(str) && 
        mystrncmp(cmdtable[i],str,mystrlen(str)) == 0)
	    return 1;
  }
  return 0;
}

char aliasfile[] = "aliasfile";

int findAlias(char* aliasname, char* cmdname)
{
  int n;
  char buf[50];
  int fd;
  if((fd = open(aliasfile, O_RDONLY)) < 0)
  {
      return 0; //no aliasfile
  }
  int lastStartIndex = 0;
  char lastAlias[50];
  int notUsed = 1;
  while((n = read(fd,&buf,sizeof(buf))) > 0)
  {
      int isSame = 1;
      int isUnalias = 0;
      int startIndex = 0;
      int otherIndex = 0;
      int len1 = strlen(buf);
      int len2 = strlen(aliasname);
      if(buf[startIndex] == '!') //unalias
      {
          startIndex++;
          isUnalias = 1;
      }
      while(buf[startIndex] != '=' && otherIndex < len2)
      {
          if(buf[startIndex] != aliasname[otherIndex])
          {
              isSame = 0;
              break;
          }
          startIndex++;
          otherIndex++;
      }
      if(buf[startIndex] != '=' || otherIndex < len2) //not finish together
      {
          isSame = 0;
      }
      if(isSame == 1)
      {
          notUsed = 1-notUsed;
      }
      if(notUsed == 0) //this is an alias record
      {
          strcpy(lastAlias,buf);
          lastStartIndex = startIndex;
      }
  }
  if(notUsed == 0) //find the alias name
  {
    int i = 0;
    lastStartIndex++;
    while(lastAlias[lastStartIndex] != '\0')
    {
      cmdname[i] = lastAlias[lastStartIndex];
      i++;
      lastStartIndex++;
    }
    cmdname[i] = '\0';
    close(fd);
    return 1;
  }
  close(fd);
  return 0;
}

// Execute cmd.  Never returns.
void runcmd(struct cmd *cmd)
{
  int p[2];
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    exit();
  
  switch(cmd->type){
  default:
    panic1("runcmd");

  case CMD_EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
      exit();
    if(isCmdName(ecmd->argv[0]) == 0) //not an original cmd name
    {
        //find in aliasnames
        char cmdname[XV_KEYWORD_LENGTH];
        int flag = findAlias(ecmd->argv[0],cmdname);
        if(flag == 1) //alias name exist
          exec(cmdname, ecmd->argv);
    }
    else
    {
      exec(ecmd->argv[0], ecmd->argv);
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case CMD_REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
      exit();
    }
    runcmd(rcmd->cmd);
    break;

  case CMD_LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
      runcmd(lcmd->left);
    wait();
    runcmd(lcmd->right);
    break;

  case CMD_PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic1("pipe");
    if(fork1() == 0){
      close(1);
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
    close(p[1]);
    wait();
    wait();
    break;
    
  case CMD_BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit();
}

double Compute(char *s);
int isNameChar(char ch)
{
  if(ch >= 'A' && ch <= 'Z')
    return 1;
  if(ch >= 'a' && ch <= 'z')
    return 1;
  if(ch >= '0' && ch <= '9')
    return 1;
  if(ch == '_')
    return 1;
  return 0;
}

void runCalcmd(struct calcmd* cmd)
{
  char *line = cmd->line;
  int equ = -1;
  int hasEqu = 0;
  for(int i=0; line[i] != '\0'; i++)
  {
    if(line[i] == '=')
    {
      hasEqu++;
      equ = i;
    }
  }
  if(hasEqu > 1) //more than one '='
  {
    color_printf(XV_RED,1,XV_BLACK,0,"More than one '=' error!\n");
  }
  else if(hasEqu == 1)
  {
    int i=0;
    while(line[i] == ' ')
    {
      i++;
    }
    int startIndex = i;
    for(; i<equ; i++)
    {
      if(isNameChar(line[i]) != 1)
        break;
    }
    int len = i-startIndex;
    while(line[i] == ' ')
    {
      i++;
    }
    if(i == equ) //is a string
    {
      if(line[startIndex] >= '0' && line[startIndex] <= '9')
      {//variable name start with a digit
        color_printf(XV_RED,1,XV_BLACK,0,"Variable name starts with a digit error!\n");
      }
      else
      {
        char name[V_NAME_MAX_LEN];
        for(int j=0; j<len; j++)
        {
          name[j] = line[startIndex + j];
        }
        name[len] = '\0';
        int i=equ+1;
        while(line[i] == ' ')
        {
          i++;
        }
        if(line[i] == '`') //a math expr
        {
          i++;
          int calstart = i;
          //find another `
          while(line[i] != '`' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '`' && line[i+1] == '\0')
          {//correct format
            line[i] = '\0';
            double result = Compute(line+calstart);
            if(isEqual(result,WRONG_ANS) == 0)
            {
              if(v_num == 0)
                readVariables(variables,&v_num);
              int index = 0;
              for(; index<v_num; index++)
              {
                if(strcmp(variables[index].name,name) == 0) //exist var
                  break;
              }
              if(index == v_num) //new variable
              {
                strcpy(variables[index].name,name);
                variables[index].type = V_DOUBLE;
                v_num++;
              }
              variables[index].value.dvalue = result;
              printf(1,"%s=%f\n",variables[index].name,variables[index].value.dvalue);
              writeVariables(variables,&v_num);
            }
          }
          else if(line[i] == '\0')
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '`' error!\n");
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '`'!\n");
          }
        }
        else if(line[i] == '\"') //a string
        {
          i++;
          int strstart = i;
          //find another "
          while(line[i] != '\"' && line[i] != '\0')
          {
            i++;
          }
          if(line[i] == '\"' && line[i+1] == '\0')
          {//correct format
            if(v_num == 0)
              readVariables(variables,&v_num);
            //printf(1,"read:%d\n",v_num);
            int index = 0;
            for(; index<v_num; index++)
            {
              if(strcmp(variables[index].name,name) == 0) //exist var
                break;
            }
            if(index == v_num) //new variable
            {
              strcpy(variables[index].name,name);
              v_num++;
            }
            variables[index].type = V_STRING;
            int slen = i-strstart;
            char *string = (char*)malloc(slen+1);
            strcpy(string,line+strstart);
            string[slen] = '\0';
            variables[index].value.str = string;
            printf(1,"%s=\"%s\"\n",variables[index].name,variables[index].value.str);
            writeVariables(variables,&v_num);
          }
          else if(line[i] == '\0')
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '\"' error!\n");
          }
          else
          {
            color_printf(XV_RED,1,XV_BLACK,0,"No content allowed outside '\"'!\n");
          }
        }
        else
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
        }
      }
    }
    else
    {
      color_printf(XV_RED,1,XV_BLACK,0,"Wrong variable format!\n");
    }
  }
  else
  {
    double result = Compute(line);
    if(isEqual(result,WRONG_ANS) == 0)
      printf(1,"%f\n",result);
  }
  exit();
}

int g_pos;

int GetLevel(char ch)
{
    switch (ch)
    {
    case '+':
    case '-':
        return 1;
    case '*':
    case '/':
        return 2;
    case '(':
        return 0;
    case '#':
        return -2;
    };
    return -1;
}

double Operate(double a1, char op, double a2)
{
    switch (op)
    {
    case '+':
        return a1 + a2;
    case '-':
        return a1 - a2;
    case '*':
        return a1 * a2;
    case '/':
        if(isEqual(a2,0) == 1)
        {
          color_printf(XV_RED,1,XV_BLACK,0,"Divided by zero error!\n");
          return WRONG_ANS;
        }
        else
          return a1 / a2;
    };
    return 1;
}

double Compute(char *s)
{
    struct dstack *opnd = dstack();
    struct cstack *optr = cstack();
    pushc(optr,'#');
    int len = strlen(s);
    int is_minus = 1;
    for (g_pos = 0; g_pos < len;)
    {
        if(s[g_pos] == '$') //a variable
        {
          is_minus = 0;
          g_pos++;
          if(s[g_pos] != '{')
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '{'!\n");
            return WRONG_ANS;
          }
          int i=g_pos+1;
          for(; i<len; i++)
          {
            if(s[i] == '}')
              break;
          }
          if(s[i] != '}')
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Missing '}'!\n");
            return WRONG_ANS;
          }
          char name[V_NAME_MAX_LEN];
          int len = i-g_pos-1;
          for(int j=0; j<len; j++)
          {
            name[j] = s[g_pos+j+1];
          }
          name[len] = '\0'; //name of the variable
          int index = 0;
          if(v_num == 0)
            readVariables(variables,&v_num);
          for(; index<v_num; index++)
          {
            if(strcmp(variables[index].name,name) == 0) //exist var
              break;
          }
          if(index == v_num) //no such variable
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Variable \"%s\" not found!\n",name);
            return WRONG_ANS;
          }
          if(variables[index].type == V_STRING)
          {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot compute a string!\n");
            return WRONG_ANS;
          }
          g_pos = i+1;
          //replace the variable with a value
          pushd(opnd,variables[index].value.dvalue);
        }
        else if (s[g_pos] == '-' && is_minus)
        {
            pushd(opnd,0);
            pushc(optr,'-');
            g_pos++;
        }
        else if (s[g_pos] == ')')
        {
            is_minus = 0;
            g_pos++;
            while (topc(optr) != '(')
            {
                double a2 = topd(opnd);
                popd(opnd);
                double a1 = topd(opnd);
                popd(opnd);
                char op = topc(optr);
                popc(optr);
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            popc(optr);
        }
        else if (s[g_pos] >= '0' && s[g_pos] <= '9')
        {
            is_minus = 0;
            double result = Translation(s,&g_pos);
            pushd(opnd,result);
        }
        else if (s[g_pos] == '(')
        {
            is_minus = 1;
            pushc(optr,s[g_pos]);
            g_pos++;
        }
        else
        {
            while (GetLevel(s[g_pos]) <= GetLevel(topc(optr)))
            {
                double a2 = topd(opnd);
                popd(opnd);
                double a1 = topd(opnd);
                popd(opnd);
                char op = topc(optr);
                popc(optr);
                double result = Operate(a1, op, a2);
                if(isEqual(result,WRONG_ANS) == 1)
                  return WRONG_ANS;
                pushd(opnd,result);
            }
            pushc(optr,s[g_pos]);
            g_pos++;
        }
    }
    while (topc(optr) != '#')
    {
        double a2 = topd(opnd);
        popd(opnd);
        double a1 = topd(opnd);
        popd(opnd);
        char op = topc(optr);
        popc(optr);
        double result = Operate(a1, op, a2);
        if(isEqual(result,WRONG_ANS) == 1)
          return WRONG_ANS;
        pushd(opnd,result);
    }
    free(opnd);
    free(optr);
    return topd(opnd);
}
