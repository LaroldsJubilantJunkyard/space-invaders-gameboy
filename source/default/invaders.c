#include <gb/gb.h>
#include "invaders.h"
#include "bullets.h"
#include "player.h"


#define SHOT_TIMER_MAX 50
extern unsigned char helper[];
extern Paddle paddle;

Invader invaders[40];
UINT8 invaderSpeed;
UINT8 invaderCounter;
INT8 slideDir;
UINT8 topRow;
UINT8 invadersRemaining;
UINT8 shotTimer;

void SetupInvaders(){
    
     for(UINT8 i=0;i<40;i++){
        invaders[i].column=(i%8)*2+2;
        invaders[i].row=i/8;
        invaders[i].slide=0;
        invaders[i].active=1;

        set_bkg_tile_xy(invaders[i].column,invaders[i].row,21);
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

UINT8 RandomNumber(UINT8 min, UINT8 max){

    // The value at this register changes rapidly
    const unsigned char *ptr_div_reg = 0xFF04; 

    // Use the first 5 sprites in getting a random value
    UINT8 v = (*(ptr_div_reg))+shadow_OAM[0].x+shadow_OAM[1].x+shadow_OAM[2].x+shadow_OAM[3].x+shadow_OAM[4].x;
    
    return min+(v % (max-min));    // get value at memory address
}

void UpdateInvaders(){

    UINT8 playerColumn=paddle.x/8;
    UINT8 playerRow=paddle.y/8;
    
    UINT8 anyInvaderHasReachedEndOfScreen=0;

    invadersRemaining=0;
    invaderCounter++;
    if(shotTimer!=0)shotTimer--;

    for(UINT8 i=0;i<40;i++){

        unsigned char tiles[9] = {25,18,19,20,21,22,23,24,25};

        unsigned char leftMiddleRight[2] = {0x0,0x0};

        if(invaders[i].active==1){
            invadersRemaining++;

            if(shotTimer==0){

                INT8 xd = invaders[i].column - paddle.x/8;

                if(xd<0)xd=-xd;

                if(xd<=1){

                    if(RandomNumber(0,100)<10){

                        SpawnEnemyBullet(invaders[i].column*8+4+invaders[i].slide*2,invaders[i].row*8+16);

                        shotTimer=SHOT_TIMER_MAX;
                    }
                }
            }
        }




        if((playerColumn==invaders[i].column&&playerRow==invaders[i].row)&&invaders[i].active){
            paddle.dead=1;
            paddle.lives=0;
        }

        if(invaders[i].slide==0){

            
            if(invaders[i].active==0){
                leftMiddleRight[0]=0;
                leftMiddleRight[1]=0;
            }else {
                leftMiddleRight[0]=tiles[4];
                leftMiddleRight[1]=25;
            }
            set_bkg_tiles(invaders[i].column,invaders[i].row,2,1,leftMiddleRight);

        }else if(invaders[i].slide>0){

            
            if(invaders[i].active==0){
                leftMiddleRight[0]=0;
                leftMiddleRight[1]=0;
            }else {
                leftMiddleRight[0]=tiles[4-invaders[i].slide];
                leftMiddleRight[1]=tiles[8-invaders[i].slide];
            }
            set_bkg_tiles(invaders[i].column,invaders[i].row,2,1,leftMiddleRight);

        }else if(invaders[i].slide<0){

            
            if(invaders[i].active==0){
                leftMiddleRight[0]=0;
                leftMiddleRight[1]=0;
            }else {
                leftMiddleRight[0]=tiles[-invaders[i].slide];
                leftMiddleRight[1]=tiles[4-invaders[i].slide];
            }
            set_bkg_tiles(invaders[i].column-1,invaders[i].row,2,1,leftMiddleRight);

        }



        if(invaderCounter>4-topRow/2||topRow>9){

            invaders[i].slide+=slideDir;

            if(invaders[i].slide>4||invaders[i].slide<-4){
                invaders[i].slide=0;
                invaders[i].column+=slideDir;
                if((invaders[i].column==0&&slideDir<0)||(invaders[i].column==19&&slideDir>0)){
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

        // Set our values to 
        helper[0]=0;

        for(UINT8  i=0;i<20;i++){
            set_bkg_tiles(i,topRow,1,1,helper);
        }
        
        // Increase this, so we know how far down are invaders are
        topRow++;
    }
}
