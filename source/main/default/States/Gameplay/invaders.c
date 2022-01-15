#include <gb/gb.h>
#include "States/Gameplay/invaders.h"
#include "States/Gameplay/bullets.h"
#include "States/Gameplay/player.h"
#include "States/GameplayScreen.h"
#include "Common.h"

#define SHOT_TIMER_MAX 50

const unsigned char tiles[9] = {25,18,19,20,21,22,23,24,25};

Invader invaders[40];
UINT8 invaderSpeed,invaderCounter,topRow,invadersRemaining,shotTimer;

void SetupInvaders(){

    UINT8 alienTypes[3]={21,29,37};
    
     for(UINT8 i=0;i<40;i++){
        invaders[i].column=(i%8)*2+2;
        invaders[i].row=(i/8);
        invaders[i].slide=0;
        invaders[i].active=1;
        invaders[i].originalTile=21;
        

        set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile);

    }

    topRow=0;
    shotTimer=SHOT_TIMER_MAX;
    slideDir=-1;
    invaderCounter=0;
    invaderSpeed=3;
    invadersRemaining=40;
}

UINT8 GetInvaderForNode(UINT8 column, UINT8 row){

    // For each of the invaders
    for(UINT8 i=0;i<40;i++){

        // Make sure this enemy is active
        if(invaders[i].active==0)continue;

        // Check the current column for the invaders
        if(column==invaders[i].column&&row==invaders[i].row)return i;

        // If the invader is moving to the right
        if(invaders[i].slide>0){
            
            // Check the column afterwards
            if(column==invaders[i].column+1&&row==invaders[i].row)return i;

        // If the invader is moving to the left
        }else if(invaders[i].slide<0){

            // Check the column before hand
            if(column==invaders[i].column-1&&row==invaders[i].row)return i;
        }
    }

    // 255 = none
    return 255;
}
void UpdateInvaders(){

    UINT8 playerColumn=paddle.x/8;
    UINT8 playerRow=paddle.y/8;
    
    UINT8 anyInvaderHasReachedEndOfScreen=0;

    invadersRemaining=0;
    invaderCounter++;
    if(shotTimer!=0)shotTimer--;

    for(UINT8 i=0;i<40;i++){



        if(invaders[i].active==1){

            invadersRemaining++;

            if(shotTimer==0&&RandomNumber(0,100)<10){

                UINT8 availableBulletSprite=GetAvailableBulletSprite();

                if(availableBulletSprite!=0){

                    set_sprite_tile(availableBulletSprite,42);
                    move_sprite(availableBulletSprite,invaders[i].column*8+4+invaders[i].slide*2,invaders[i].row*8+16);
                    shotTimer=SHOT_TIMER_MAX;
                }
            }

                
            if((playerColumn==invaders[i].column&&playerRow==invaders[i].row)){
                paddle.dead=1;
                paddle.lives=0;
            }

            if(PlayerBulletSprite.tile!=0){

                INT8 xd = (PlayerBulletSprite.x-4)-(invaders[i].column*8+4+(invaders[i].slide*2));
                INT8 yd = (PlayerBulletSprite.y-12)-invaders[i].row*8+4;

                if(xd<0)xd=-xd;
                if(yd<0)yd=-yd;

                if(xd<5&&yd<8){

                    IncreaseScore(10);

                    // Set this enemy as inactive
                    invaders[i].active=0;

                    // Set the bullet as in active
                    PlayerBulletSprite.tile=0;

                }
            }
        }

        if(invaders[i].active==0){

            
            set_bkg_tile_xy(invaders[i].column,invaders[i].row,0);
            set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,0);

        }else if(invaders[i].slide==0){

            
            set_bkg_tile_xy(invaders[i].column,invaders[i].row,tiles[4]);
            set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,0);

        }else if(invaders[i].slide>0){

            
            set_bkg_tile_xy(invaders[i].column,invaders[i].row,tiles[4-invaders[i].slide]);
            set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,tiles[8-invaders[i].slide]);

        }else if(invaders[i].slide<0){

            set_bkg_tile_xy(invaders[i].column-1,invaders[i].row,tiles[-invaders[i].slide]);
            set_bkg_tile_xy(invaders[i].column,invaders[i].row,tiles[4-invaders[i].slide]);

        }
        if(invaderCounter>4-topRow/2||topRow>9){

            invaders[i].slide+=slideDir;

            if(invaders[i].slide>4||invaders[i].slide<-4){
                invaders[i].slide=0;
                invaders[i].column+=slideDir;
                if((invaders[i].column==0)||(invaders[i].column==19)){
                    anyInvaderHasReachedEndOfScreen=1;
                }
            }

        }



    }
    
    if(invaderCounter>4-topRow/2||topRow>9){
        invaderCounter=0;
    }




    if(anyInvaderHasReachedEndOfScreen){

        // Increase the row for all invaders
        for(UINT8 i=0;i<40;i++){invaders[i].row++;}

        // Reverse the direction to slide invaders
        slideDir=-slideDir;

        fill_bkg_rect(0,topRow,20,1,0);
        
        // Increase this, so we know how far down are invaders are
        topRow++;
    }
}
