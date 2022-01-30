#include <gb/gb.h>
#include "Graphics/Player.h"
#include "Graphics/BulletA.h"
#include "Graphics/BulletB.h"
#include "Graphics/BulletC.h"
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

#define NUMBER_OF_ENEMY_BULLETS 5
#define PLAYER_BULLET_SPRITE 2
#define ALIEN_OAM_SPRITE PLAYER_BULLET_SPRITE+NUMBER_OF_ENEMY_BULLETS+1


#define PLAYER_SPRITE_START 1

// Sprites
#define BULLETA_SPRITE_START PLAYER_SPRITE_START+Player_TILE_COUNT
#define BULLETB_SPRITE_START BULLETA_SPRITE_START+BulletA_TILE_COUNT
#define BULLETC_SPRITE_START BULLETB_SPRITE_START+BulletB_TILE_COUNT
#define ALIEN_SPRITE_START BULLETC_SPRITE_START+BulletC_TILE_COUNT
#define EXPLOSION_SPRITE_START ALIEN_SPRITE_START+Alien_TILE_COUNT

// Backgrounds
#define SPACEINVADERSFONT_TILES_START 1

#define PLAYER_TILES_START SPACEINVADERSFONT_TILES_START+SpaceInvadersFont_TILE_COUNT
#define ALIEN_TILES_START PLAYER_TILES_START+Player_TILE_COUNT
#define INVADER1_TILES_START ALIEN_TILES_START+Alien_TILE_COUNT
#define INVADER2_TILES_START INVADER1_TILES_START+Invader1_TILE_COUNT
#define INVADER3_TILES_START INVADER2_TILES_START+Invader2_TILE_COUNT
#define BARRICADE_TILES_START INVADER3_TILES_START+Invader3_TILE_COUNT
#define BARRICADE_LAST_TILE BARRICADE_TILES_START+Barricade_TILE_COUNT-1

// Start after the title
#define SPACEINVADERSTITLE_TILES_START SPACEINVADERSFONT_TILES_START+SpaceInvadersFont_TILE_COUNT-5

extern int8_t slideDir;
extern uint16_t highScore,score;
extern uint8_t level,joypadCurrent,joypadPrevious,spaceInvadersFontCurrentStart,invadersRemaining,topRow;


void ClearAllSprites();
void ClearBackground();
void UpdateScore();
uint8_t GetNextAvailableSprite();
void DrawNumber(uint8_t x,uint8_t y, uint16_t number,uint8_t digits);
uint8_t RandomNumber(uint8_t min, uint8_t max);