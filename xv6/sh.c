// Shell from file

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

}

void reader_loop(void);

void exit_shell(void)
{
  exit();
}

int main(int argc, char* argv[])
{
  //init shell
  init_shell();

  // Read and run input commands.
  if (argc < 2) 
  {
    exit();
  }
  //read command from files and execute
  for (int i = 1; i < argc; i++) 
  {
    int fd = open(argv[i], O_RDONLY);
    if (fd < 0) 
    {
      color_printf(XV_RED,1,XV_BLACK,0, "Cannot open file \"%s\" !",argv[i]);
      printf(1,"\n");
      continue;
    }
    char filebuf[1024];
    char cmdbuf[128];
    int len = read(fd, filebuf, 1024);
    close(fd);
    //decide if this is a sh file
    if(len < 5 || filebuf[0] != '#' || filebuf[1] != '!' || filebuf[2] != 's' || filebuf[3] != 'h'
      || filebuf[4] != '\n')
      {
        color_printf(XV_RED,1,XV_BLACK,0, "Cannot execute by interpreter sh!");
        printf(1,"\n");
      }
    else
    {
      //find commands in turn
      int start = 5;
      int end = 5;
      while (end < len) 
      {
        while (filebuf[end] != '\n' && filebuf[end] != '\0') 
        {
          cmdbuf[end - start] = filebuf[end];
          end++;
        }
        cmdbuf[end - start] = filebuf[end];
        cmdbuf[end - start + 1] = '\0';
        end++;
        if (cmdbuf[0] == '#') //comment line
        {
          start = end;
          continue;
        }
        start = end;
        if (fork1() == 0) 
        {
          runcmd(parsecmd(cmdbuf));
        }
        wait();
      }
    }
  }
  
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
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
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
