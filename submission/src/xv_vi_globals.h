#ifndef XV_VI_GLOBALS_H
#define XV_VI_GLOBALS_H

#define MAX_LINE_LEN 80
#define MAX_CONSOLE_HEIGHT 24
#define MAX_FILE_LINES 1024
#define NEW_PARAPH '\n'
#define READ_MODE 0
#define EDIT_MODE 1
#define CTRL_MODE 2

#define KEY_UP 0xE2
#define KEY_DOWN 0xE3
#define KEY_LEFT 0xE4
#define KEY_RIGHT 0xE5      
#define KEY_ESC 0x1b        // key mappings
#define KEY_ENTER 13

#define EDIT_APP 1
#define EDIT_EDIT 0

#define READ_SHOW 1
#define READ_CLEAR 2
#define READ_READ 0

#define VI_START 1
#define VI_OVER 0

#define CTRL_EXIT 1
#define CTRL_SAVE 2
#define CTRL_EXEC 1<<16
#define CTRL_CTRL 0

#define VI_GET 0
#define VI_SET 1

#define GET_OR_SET_INVI 0
#define GET_OR_SET_READSTAT 1
#define GET_OR_SET_EDITSTAT 2
#define GET_OR_SET_CTRLSTAT 3
#define GET_OR_SET_VIMODE 4

#define VI_PUSH 0
#define VI_PULL 1

#define BACKSPACE 0x100
#define CRTPORT 0x3d4
#define PARAPH_SIZE 2048
#define CONSOLE_BOTTOM 80*(MAX_CONSOLE_HEIGHT-1) 
#define LINES_OF(x) (((x)/80)+1)
#define NEG(x) -(x)

void            vDebug(char*);
void            vSave(void);
void            vLoad(void);
void            vClear(void);
void            vShow(void);
void            vRead(void);
void            vEdit(void);
void            vInit(void);
int             vOpen(void);
void            vCtrl(void);
void            vStart(void);
void            vExit(void);
void            vSync(void);
struct paraph*  vAppend(struct paraph*);


#endif