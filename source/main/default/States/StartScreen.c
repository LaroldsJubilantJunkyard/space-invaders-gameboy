#include <gb/gb.h>
#include "Common.h"
#include "Hud.h"
#include "Graphics/SpaceInvadersTitle.h"
#include "Graphics/SpaceInvadersFont.h"

uint8_t blinkCounter,showText;

void SetupStartScreen(){

    blinkCounter=0;
    showText=0;

    set_bkg_data(SPACEINVADERSFONT_TILES_START,SpaceInvadersFont_TILE_COUNT,SpaceInvadersFont_tiles);
    set_bkg_data(SPACEINVADERSTITLE_TILES_START,SpaceInvadersTitle_TILE_COUNT,SpaceInvadersTitle_tiles);

    // Draw the Space Invaders Title
    set_bkg_based_tiles(1,3,18,6,SpaceInvadersTitle_map,SPACEINVADERSTITLE_TILES_START);

    // Move the background down 144px
    // The gameboy screen is 144px tall
    move_bkg(0,144);
}
uint8_t UpdateStartScreen(){

    blinkCounter++;

    // If the background's y position is larger than zero
    if(SCY_REG>0){

        // Move the background back to 0
        scroll_bkg(0,1);

        // If the background has just reached 0
        if(SCY_REG==0){

            // Reset our counter
            blinkCounter=30;
            
            // Draw our high score and name
            DrawText(3,1,"HI-SCORE");
            DrawNumber(13,1,highScore,5);
            DrawText(7,14,"LAROLDS");
            DrawText(1,16,"JUBILANT  JUNKYARD");
        }
    }

    // If the background's y position is at 0
    if(SCY_REG==0){

        // When our linkCounter reaches 30
        if(blinkCounter==30){

            blinkCounter=0;

            // If there is anything at this tile
            if(get_bkg_tile_xy(3,11)!=0){

                // Fill the background with tiles on that row
                // This will effectively replace the drawn tiles o the"push any button "text with blank tiles
                fill_bkg_rect(3,11,16,1,0);
            }else {
                
                // Draw the "push any button" text
                DrawText(3,11,"PUSH ANY BUTTON");
            }
        }

        // If any (non d-pad) button is pressed, return that we should go to the menu screen first.
        if((joypadCurrent & J_A)||(joypadCurrent & J_B)||(joypadCurrent & J_START)||(joypadCurrent & J_SELECT))return MENUSCREEN;
    }
    
    return STARTSCREEN;
    
}