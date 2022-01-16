#include <gb/gb.h>
#include "States/Gameplay/invaders.h"
#include "States/Gameplay/player.h"
#include "States/Gameplay/bullets.h"
#include "States/GameplayScreen.h"
#include "Common.h"



void SetupBullets(){
    
    for(INT8 i=2;i<8;i++)shadow_OAM[i].tile=0;
}


UINT8 GetAvailableBulletSprite(){

    for(INT8 i=3;i<8;i++){
        if(shadow_OAM[i].tile==0)return i;
    }
    return 0;
}

void UpdateBullets(){

    for(UINT8 i=2;i<8;i++){

        // If the tile isn't zero
        // If the tile IS zero, this sprite is not in use
        if(shadow_OAM[i].tile!=0){

            shadow_OAM[i].tile++;
            if(shadow_OAM[i].tile==ALIEN_SPRITE_START)shadow_OAM[i].tile=BULLETB_SPRITE_START;
            else if(shadow_OAM[i].tile==BULLETB_SPRITE_START)shadow_OAM[i].tile=BULLETA_SPRITE_START;

            // Move the player bullet up
            // Move enemy bullets down
            if(i==2)shadow_OAM[i].y-=4;
            else shadow_OAM[i].y+=4;

            // If the bullet is off screen,reset it
            if(shadow_OAM[i].y>176||shadow_OAM[i].y>250)shadow_OAM[i].tile=0;

            // If the bullet is onscreen
            else {

                UINT8 c = (shadow_OAM[i].x-4)/8;
                UINT8 r = (shadow_OAM[i].y-12)/8;
                UINT8 crTile=get_bkg_tile_xy(c,r);
                
                if(crTile>=3&&crTile<=17){

                    UINT8 newTile=crTile+1;
                    if(newTile==5||newTile==8||newTile==11||newTile==14||newTile==17)newTile=0;
                    set_bkg_tile_xy(c,r,newTile);
                    shadow_OAM[i].tile=0;
                }

                // If it is an enemy ullet
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
