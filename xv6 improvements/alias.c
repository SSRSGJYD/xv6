#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

#include "xv_user.h"
#include "xv_color.h"
#include "xv_cmdtable.h"

//stereotype: alias *** = ***,new name no longer than 20 words, no same name
int main(int argc, char *argv[])
{
    if(argc != 4)
    {
        color_printf(XV_RED,1,XV_BLACK,0,"Incorrect format!");
		printf(1,"\n");
    }
    else
    {
      char *cmdname = argv[1];
      char *ch = argv[2]; //need to be '='
      char *aliasname = argv[3];
      if(ch[0] != '=' || ch[1] != '\0')
	    {
			color_printf(XV_RED,1,XV_BLACK,0,"Incorrect format!");
			printf(1,"\n");	    
		}
	    else
	    {
			int findflag = 0;
			for(int i=0; i<XV_CMD_NUM; i++)
			{
				if(strlen(cmdtable[i]) == strlen(cmdname) && 
					strcmp(cmdtable[i],cmdname) == 0)
				{
					findflag = 1;
					break;
				}
			}
			if(findflag == 0)
			{
				color_printf(XV_RED,1,XV_BLACK,0,"no such command!\n");
			}
			else
			{
				int n;
				char buf[50];
				int fd;
				if((fd = open("aliasfile", O_RDWR)) < 0)
				{
					fd = open("aliasfile",O_CREATE|O_RDWR);
				}
				int notUsed = 1;

				//check if there is already the alias name
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
				}
				if(notUsed == 1)
				{
					//add alias name
					int j = 0;
					for(int i=0; i < strlen(aliasname); i++,j++)
					{
						buf[j] = aliasname[i];

					}
					buf[j++] = '=';
					for(int i=0 ; i < strlen(cmdname); i++,j++)
					{
						buf[j] = cmdname[i];
					}
					buf[j++] = '\0';
					buf[j++] = '\n';
					write(fd,buf,sizeof(buf));
					close(fd);
					color_printf(XV_CYAN,1,XV_BLACK,0,"%s = %s",cmdname,aliasname);
					printf(1,"\n");
				}
				else
				{
					color_printf(XV_RED,1,XV_BLACK,0,"Alias name has been used!");
                	printf(1,"\n");
				}
			}
	    }
    }
    exit();
}
