#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

#include "xv_user.h"
#include "xv_color.h"

//stereotype: unalias ***
int main(int argc, char *argv[])
{
    if(argc != 2)
    {
        color_printf(XV_RED,1,XV_BLACK,0,"Incorrect format!");
		printf(1,"\n");
    }
    else
    {
        char *aliasname = argv[1];
        int n;
        char buf[50];
        int fd;
        if((fd = open("aliasfile", O_RDWR)) < 0)
        {
            color_printf(XV_RED,1,XV_BLACK,0,"Cannot unalias an unused word!");
		    printf(1,"\n");
        }
        else
        {
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
                color_printf(XV_RED,1,XV_BLACK,0,"Cannot unalias an unused word!");
                printf(1,"\n");
            }
            else
            {
                char buf[20];
                buf[0] = '!';
                int i = 0;
                while(aliasname[i] != '\0')
                {
                    buf[i+1] = aliasname[i];
                    i++;
                }
                buf[i++] = '\0';
                write(fd,buf,sizeof(buf));
                color_printf(XV_CYAN,1,XV_BLACK,0,"Unalias %s",aliasname);
                printf(1,"\n");
            }
            close(fd);
        }
    }
    exit();
}