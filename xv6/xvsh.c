// Shell.

#include "user.h"
#include "fcntl.h"

#include "xv_color.h"
#include "xv_user.h"
#include "xv_command.h"
#include "xv_parse_command.h"
#include "xv_exec_command.h"
#include "xv_fork.h"

void init_shell(void)
{
  //initialize file "variables"
  int fd;
  if((fd = open("variables", O_RDWR)) >= 0)
  {
    unlink("variables");
  }
  fd = open("variables",O_CREATE|O_RDWR);
  close(fd);
}

void reader_loop(void);

void exit_shell(void)
{
  exit();
}

int main()
{
  //init shell
  init_shell();

  // Read and run input commands.
  reader_loop();
  
  //exit shell
  exit_shell();
}

int getcmd(char *buf, int nbuf);

//read in input and process
void reader_loop()
{
    static char buf[100];
    int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("xv_console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    struct cmd* cmd = parsecmd(buf);
    if(cmd->type == CMD_CAL)
    {
      struct calcmd *calcmd = (struct calcmd*)cmd;
      if(fork1() == 0)
        runCalcmd(calcmd);
      wait();
    }
    else
    {
      if(fork1() == 0)
        runcmd(cmd);
      wait();
    }
  }
}

int getcmd(char *buf, int nbuf)
{
  color_printf(XV_YELLOW,1,XV_BLACK,0,"$");
  printf(2," ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
