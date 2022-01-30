#include <gb/gb.h>
#include "Common.h"
#include "Hud.h"
#include "Graphics/Alien.h"
#include "Graphics/Barricade.h"
#include "Graphics/Explosion.h"
#include "Graphics/BulletA.h"
#include "Graphics/BulletB.h"
#include "Graphics/BulletC.h"
#include "Graphics/Invader1.h"
#include "Graphics/Invader2.h"
#include "Graphics/Invader3.h"
#include "Graphics/Player.h"
#include "Graphics/SpaceInvadersFont.h"
#include "States/Gameplay/player.h"

void SetupMenuScreen(){

    // Setup our sprites for gameplay
    set_sprite_data(PLAYER_SPRITE_START,Player_TILE_COUNT,Player_tiles);
    set_sprite_data(BULLETA_SPRITE_START,BulletA_TILE_COUNT,BulletA_tiles);
    set_sprite_data(BULLETB_SPRITE_START,BulletB_TILE_COUNT,BulletB_tiles);
    set_sprite_data(BULLETC_SPRITE_START,BulletC_TILE_COUNT,BulletC_tiles);
    set_sprite_data(ALIEN_SPRITE_START,Alien_TILE_COUNT,Alien_tiles);
    set_sprite_data(EXPLOSION_SPRITE_START,Explosion_TILE_COUNT,Explosion_tiles);

    // Place everything in background VRAM so we can draw it on the menu screen and in gameplay
    set_bkg_data(SPACEINVADERSFONT_TILES_START,SpaceInvadersFont_TILE_COUNT,SpaceInvadersFont_tiles);
    set_bkg_data(PLAYER_TILES_START,Player_TILE_COUNT,Player_tiles);
    set_bkg_data(ALIEN_TILES_START,Alien_TILE_COUNT,Alien_tiles);
    set_bkg_data(INVADER1_TILES_START,Invader1_TILE_COUNT,Invader1_tiles);
    set_bkg_data(INVADER2_TILES_START,Invader2_TILE_COUNT,Invader2_tiles);
    set_bkg_data(INVADER3_TILES_START,Invader3_TILE_COUNT,Invader3_tiles);
    set_bkg_data(BARRICADE_TILES_START,Barricade_TILE_COUNT,Barricade_tiles);

    // Draw some text
    DrawText(8,2,"PLAY");
    DrawText(3,4,"SPACE  INVADERS");
    DrawText(0,7,"*SCORE ADVANCE TABLE");

    // Draw the alien mystery score (100)
    set_bkg_tile_xy(4,9,ALIEN_TILES_START);
    set_bkg_tile_xy(5,9,ALIEN_TILES_START+1);
    DrawText(6,9,"=? MYSTERY");

    // Draw how much each invader earns you in points
    set_bkg_tile_xy(5,11,INVADER1_TILES_START);
    DrawText(6,11,"=30 POINTS");
    set_bkg_tile_xy(5,13,INVADER2_TILES_START);
    DrawText(6,13,"=20 POINS");
    set_bkg_tile_xy(5,15,INVADER3_TILES_START);
    DrawText(6,15,"=10 POINTS");    
    
}

uint8_t UpdateMenuScreen(){
    
    // If the a button was just pressed
    if((joypadCurrent & J_A) && !(joypadPrevious & J_A)){

        // Start us on level 1, 3 lives, with no score
        player.lives=3;
        level=1;
        score=0;
        
        // Go to the next level screen
        return NEXTLEVELSCREEN;
    }
    
    // Continue on the menu screen
    return MENUSCREEN;
    
}