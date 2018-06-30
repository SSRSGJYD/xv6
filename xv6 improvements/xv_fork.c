//fork
#include "user.h"

#include "xv_defs.h"
#include "xv_user.h"

int fork1(void)
{
  int pid;
  
  pid = fork();
  //if(pid == -1)
    //panic1("fork");
  return pid;
}
