#include <gb/gb.h>
#include "Common.h"
#include "Graphics/SpaceInvadersTIles.h"
#include "Graphics/Alien.h"
#include "Graphics/Barricade.h"
#include "Graphics/BulletA.h"
#include "Graphics/BulletB.h"
#include "Graphics/Invader1.h"
#include "Graphics/Invader2.h"
#include "Graphics/Invader3.h"
#include "Graphics/Player.h"
#include "Graphics/SpaceInvadersFont.h"

void GameFirstLoad(){
    
    const palette_color_t blackAndWhite[4] = {
        RGB8(255, 255, 255), RGB8(0, 0, 0),RGB8(0, 0, 0),RGB8(0, 0, 0)
    };


    DISPLAY_ON;
    SHOW_SPRITES;
    SHOW_BKG;
    SPRITES_8x8;
    SHOW_WIN;

    move_win(7,136);

    set_sprite_data(PLAYER_SPRITE_START,Player_TILE_COUNT,Player_tiles);
    set_sprite_data(BULLETA_SPRITE_START,BulletA_TILE_COUNT,BulletA_tiles);
    set_sprite_data(BULLETB_SPRITE_START,BulletB_TILE_COUNT,BulletB_tiles);
    set_sprite_data(ALIEN_SPRITE_START,Alien_TILE_COUNT,Player_tiles);

    set_bkg_data(PLAYER_SPRITE_START,Player_TILE_COUNT,Player_tiles);
    set_bkg_data(ALIEN_SPRITE_START,Alien_TILE_COUNT,Player_tiles);
    set_bkg_data(BARRICADE_TILES_START,Barricade_TILE_COUNT,Barricade_tiles);
    set_bkg_data(INVADER1_TILES_START,Invader1_TILE_COUNT,Invader1_tiles);
    set_bkg_data(INVADER2_TILES_START,Invader2_TILE_COUNT,Invader2_tiles);
    set_bkg_data(INVADER3_TILES_START,Invader3_TILE_COUNT,Invader3_tiles);
    set_bkg_data(SPACEINVADERSFONT_TILES_START,SpaceInvadersFont_TILE_COUNT,SpaceInvadersFont_tiles);

    set_sprite_palette(0,1,blackAndWhite);
    set_bkg_palette(0,1,blackAndWhite);

    // Set our space invaders tileset in VRAM
    // Use the same tileset for both sprites & backgrounds
    //set_bkg_data(0,58,SpaceInvadersTiles);
    //set_sprite_data(0,58,SpaceInvadersTiles);
}