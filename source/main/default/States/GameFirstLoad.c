#include <gb/gb.h>
#include "Graphics/SpaceInvadersTIles.h"

void GameFirstLoad(){
    

    DISPLAY_ON;
    SHOW_SPRITES;
    SHOW_BKG;
    SPRITES_8x8;
    SHOW_WIN;

    move_win(7,136);

    // Set our space invaders tileset in VRAM
    // Use the same tileset for both sprites & backgrounds
    set_bkg_data(0,58,SpaceInvadersTiles);
    set_sprite_data(0,58,SpaceInvadersTiles);
}