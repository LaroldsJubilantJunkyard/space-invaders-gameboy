#include <gb/gb.h>
#include "States/Gameplay/invaders.h"
#include "States/Gameplay/player.h"
#include "States/Gameplay/bullets.h"
#include "States/GameplayScreen.h"
#include "Graphics/Alien.h"
#include "Graphics/SpaceInvadersFont.h"
#include "Common.h"



void SetupBullets(){
    
    // Set all of our bullet sprites to tile 0
    // Tile 0 in our code will mean they are not in use
    // NOTE: tile 0 is intentionally a blank tile
    for(int8_t i=2;i<8;i++)shadow_OAM[i].tile=0;
}


uint8_t GetAvailableBulletSprite(){

    // Check the sprites we have assigned for enemy bullets
    for(int8_t i=3;i<8;i++){

        // Return this sprite if it is set to tile 0
        if(shadow_OAM[i].tile==0)return i;
    }

    // This is an invalid result (note the above list goes from 3->7)
    // Needs to be checked or calling functions.
    return 0;
}




uint8_t InvaderCheckBulletCollision(uint8_t i){

    if(PlayerBulletSprite.tile!=0&&invaders[i].active){

        int8_t xd = (PlayerBulletSprite.x-4)-(invaders[i].column*8+4+invaders[i].slide);
        int8_t yd = (PlayerBulletSprite.y-12)-invaders[i].row*8+4;

        // Get the absolute value
        if(xd<0)xd=-xd;
        if(yd<0)yd=-yd;

        if(xd<5&&yd<8){

            IncreaseScore(invaders[i].score);
            
            invadersRemaining--;

            // Set this enemy as inactive
            invaders[i].active=0;

            // Set the bullet as in active
            PlayerBulletSprite.tile=0;

            // Update the tiles for this invader
            ClearInvaderTiles(i);

            NR10_REG=0x7D;
            NR11_REG=0xC2;
            NR12_REG=0x37;
            NR13_REG=0x2E;
            NR14_REG=0x87;

            return 1;

        }
    }

    return 0;
}

void UpdateBullets(){

    // For each of our bullet sprites
    // Bullet i=2 is the player's bullet
    // Bullet i=3 => i=7 are enemy bullets
    for(uint8_t i=2;i<8;i++){

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
            if(i==2)shadow_OAM[i].y-=2;
            else shadow_OAM[i].y+=2;

            // If the bullet is off screen,reset it
            if(shadow_OAM[i].y>176||shadow_OAM[i].y>250)shadow_OAM[i].tile=0;

            // If the bullet is onscreen
            else {

                uint8_t currentColumn = (shadow_OAM[i].x-4)/8;
                uint8_t currentRow = (shadow_OAM[i].y-12)/8;
                uint8_t currentTile=get_bkg_tile_xy(currentColumn,currentRow);
                
                // If this is a barricade tile
                if(currentTile>=BARRICADE_TILES_START&&currentTile<=BARRICADE_LAST_TILE){

                    // Go to the next tile
                    uint8_t newTile=currentTile+1;
                    uint8_t barricadeRelativeTile = newTile-BARRICADE_TILES_START;

                    // The barricade graphic has 5 rows of 3
                    // When the barricade relative tile is a multiple of 3, that tile has been fully disolved
                    // We then set the tile to 0, otherwise it would loop on to become the next barriacde tile.
                    if(newTile%3==0)newTile=0;
                    set_bkg_tile_xy(currentColumn,currentRow,newTile);

                    // Reset the bullet sprite
                    shadow_OAM[i].tile=0;
                    NR41_REG = 0x30;
                    NR42_REG = 0x61;
                    NR43_REG = 0x80;
                    NR44_REG = 0xC0;

                }else if(currentTile>=INVADER1_TILES_START&&currentTile<=INVADER3_TILES_START+Invader3_TILE_COUNT){

                    for(uint8_t j=0;j<40;j++){

                        if(InvaderCheckBulletCollision(j)){
                            break;
                        }
                    }
                }

                // If it is an enemy bullet, we'll check against the player
                if(i>2){
                    if(shadow_OAM[i].x-4<player.x-8)continue;
                    if(shadow_OAM[i].x-4>player.x+8)continue;
                    if(shadow_OAM[i].y-12<player.y-4)continue;
                    if(shadow_OAM[i].y-12>player.y+4)continue;
                    if(player.damageTimer>0)continue;
                    shadow_OAM[i].tile=0;

                    DamagePlayer(1);
                }
            }


        }
    }
}
