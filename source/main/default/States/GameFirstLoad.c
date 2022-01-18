#include <gb/gb.h>
#include "Common.h"
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
    
    const palette_color_t blackAndWhite[4] = { RGB8(255, 255, 255), RGB8(0, 0, 0),RGB8(0, 0, 0),RGB8(0, 0, 0)    };


    DISPLAY_ON;
    SHOW_SPRITES;
    SHOW_BKG;
    SPRITES_8x8;

    set_sprite_palette(0,1,blackAndWhite);
    set_bkg_palette(0,1,blackAndWhite);

    

    
}