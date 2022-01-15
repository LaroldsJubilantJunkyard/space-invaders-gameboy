#include <gb/gb.h>

#define GAMEFIRSTLOAD 0
#define STARTSCREEN 1
#define MENUSCREEN 2
#define GAMEPLAYSCREEN 3
#define NEXTLEVELSCREEN 4
#define GAMEOVERSCREEN 5

#define PlayerBulletSprite shadow_OAM[2]


extern UINT8 level,highScore,joypadCurrent,joypadPrevious,slideDir;
UINT8 GetNextAvailableSprite();
void DrawNumber(UINT8 x,UINT8 y, UINT16 number,UINT8 digits);

UINT8 RandomNumber(UINT8 min, UINT8 max);