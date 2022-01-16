#include <gb/gb.h>
#include "Graphics/Player.h"
#include "Graphics/BulletA.h"
#include "Graphics/BulletB.h"
#include "Graphics/Barricade.h"
#include "Graphics/Invader1.h"
#include "Graphics/Invader2.h"
#include "Graphics/Invader3.h"

#define GAMEFIRSTLOAD 0
#define STARTSCREEN 1
#define MENUSCREEN 2
#define GAMEPLAYSCREEN 3
#define NEXTLEVELSCREEN 4
#define GAMEOVERSCREEN 5

#define PlayerBulletSprite shadow_OAM[2]

#define PLAYER_SPRITE_START 1
#define BULLETA_SPRITE_START PLAYER_SPRITE_START+Player_TILE_COUNT
#define BULLETB_SPRITE_START BULLETA_SPRITE_START+BulletA_TILE_COUNT
#define ALIEN_SPRITE_START BULLETB_SPRITE_START+BulletB_TILE_COUNT


#define BARRICADE_TILES_START PLAYER_SPRITE_START+Player_TILE_COUNT
#define INVADER1_TILES_START BARRICADE_TILES_START+Barricade_TILE_COUNT
#define INVADER2_TILES_START INVADER1_TILES_START+Invader1_TILE_COUNT
#define INVADER3_TILES_START INVADER2_TILES_START+Invader2_TILE_COUNT
#define SPACEINVADERSFONT_TILES_START INVADER3_TILES_START+Invader3_TILE_COUNT

extern UINT8 level,highScore,joypadCurrent,joypadPrevious,slideDir;
UINT8 GetNextAvailableSprite();
void DrawNumber(UINT8 x,UINT8 y, UINT16 number,UINT8 digits);
UINT8 RandomNumber(UINT8 min, UINT8 max);