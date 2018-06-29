#ifndef XV_COMMAND_H
#define XV_COMMAND_H

// Parsed command representation
#define CMD_EXEC  1
#define CMD_REDIR 2
#define CMD_PIPE  3
#define CMD_LIST  4
#define CMD_BACK  5
#define CMD_CAL 6

#define CMDMAXARGS 10

struct cmd {
  int type;
};

struct execcmd {
  int type;
  char *argv[CMDMAXARGS];
  char *eargv[CMDMAXARGS];
};

struct redircmd {
  int type;
  struct cmd *cmd;
  char *file;
  char *efile;
  int mode;
  int fd;
};

struct pipecmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct listcmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct backcmd {
  int type;
  struct cmd *cmd;
};

struct calcmd {
  int type;
  char *line;
};

struct cmd* execcmd(void);
struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd);
struct cmd* pipecmd(struct cmd *left, struct cmd *right);
struct cmd* listcmd(struct cmd *left, struct cmd *right);
struct cmd* backcmd(struct cmd *subcmd);
struct cmd* calcmd(char *line);

#endif
