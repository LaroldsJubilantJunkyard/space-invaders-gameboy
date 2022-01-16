#include <gb/gb.h>
#include "States/Gameplay/invaders.h"
#include "States/Gameplay/player.h"
#include "States/Gameplay/bullets.h"
#include "States/GameplayScreen.h"
#include "Graphics/SpaceInvadersFont.h"
#include "Common.h"



void SetupBullets(){
    
    // Set all of our bullet sprites to tile 0
    // Tile 0 in our code will mean they are not in use
    // NOTE: tile 0 is intentionally a blank tile
    for(INT8 i=2;i<8;i++)shadow_OAM[i].tile=0;
}


UINT8 GetAvailableBulletSprite(){

    // Check the sprites we have assigned for enemy bullets
    for(INT8 i=3;i<8;i++){

        // Return this sprite if it is set to tile 0
        if(shadow_OAM[i].tile==0)return i;
    }

    // This is an invalid result (note the above list goes from 3->7)
    // Needs to be checked or calling functions.
    return 0;
}

void UpdateBullets(){

    // For each of our bullet sprites
    // Bullet i=2 is the player's bullet
    // Bullet i=3 => i=7 are enemy bullets
    for(UINT8 i=2;i<8;i++){

        // If the tile isn't zero
        // If the tile IS zero, this sprite is not in use
        if(shadow_OAM[i].tile!=0){

            shadow_OAM[i].tile++;

            // The order is bullet a, bullet b, bullet c, and then alien
            // If we reach the start of something else, reset back properly
            if(shadow_OAM[i].tile==ALIEN_SPRITE_START)shadow_OAM[i].tile=BULLETC_SPRITE_START;
            if(shadow_OAM[i].tile==BULLETC_SPRITE_START)shadow_OAM[i].tile=BULLETB_SPRITE_START;
            else if(shadow_OAM[i].tile==BULLETB_SPRITE_START)shadow_OAM[i].tile=BULLETA_SPRITE_START;

            // Move the player bullet up
            // Move enemy bullets down
            if(i==2)shadow_OAM[i].y-=4;
            else shadow_OAM[i].y+=4;

            // If the bullet is off screen,reset it
            if(shadow_OAM[i].y>176||shadow_OAM[i].y>250)shadow_OAM[i].tile=0;

            // If the bullet is onscreen
            else {

                UINT8 currentColumn = (shadow_OAM[i].x-4)/8;
                UINT8 currentRow = (shadow_OAM[i].y-12)/8;
                UINT8 currentTile=get_bkg_tile_xy(currentColumn,currentRow);
                
                // If this is a barricade tile
                if(currentTile>=BARRICADE_TILES_START&&currentTile<=BARRICADE_LAST_TILE){

                    // Go to the next tile
                    UINT8 newTile=currentTile+1;
                    UINT8 barricadeRelativeTile = newTile-BARRICADE_TILES_START;

                    // The barricade graphic has 5 rows of 3
                    // When the barricade relative tile is a multiple of 3, that tile has been fully disolved
                    // We then set the tile to 0, otherwise it would loop on to become the next barriacde tile.
                    if(newTile==3||newTile==6||newTile==9||newTile==12||newTile==15)newTile=0;
                    set_bkg_tile_xy(currentColumn,currentRow,newTile);

                    // Reset the bullet sprite
                    shadow_OAM[i].tile=0;
                }

                // If it is an enemy bullet, we'll check against the player
                // We handle enemy collision in the UpdateInvaders function
                // We handle player collision here, to avoid adding an unneccessary loop:
                //      That would require looping against all enemy bullets while updating the player
                //      Which might put strain on the gameboy game's performance
                if(i>2){
                    if(shadow_OAM[i].x-4<paddle.x-8)continue;
                    if(shadow_OAM[i].x-4>paddle.x+8)continue;
                    if(shadow_OAM[i].y-12<paddle.y-4)continue;
                    if(shadow_OAM[i].y-12>paddle.y+4)continue;
                    shadow_OAM[i].tile=0;
                    paddle.dead=1;
                }
            }


        }
    }
}
