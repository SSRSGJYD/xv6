#include "xv_color.h"

int parseFont(char ch, int forec, int foreh, int backc, int backh)
{
  int character = (int)ch;
  character = character | (backh << 15);
  character = character | (backc << 12);
  character = character | (foreh << 11);
  character = character | (forec << 8);
  return character;
}
