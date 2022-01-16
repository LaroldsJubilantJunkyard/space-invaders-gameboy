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

    UINT8 alienTypes[3]={INVADER1_TILES_START,INVADER2_TILES_START,INVADER3_TILES_START};
    
     for(UINT8 i=0;i<40;i++){
        invaders[i].column=(i%8)*2+2;
        invaders[i].row=(i/8)+2;
        invaders[i].slide=0;
        invaders[i].active=1;
        invaders[i].originalTile=alienTypes[i/16];
        
        // Put their initial tiles on the background
        set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile);

    }

    topRow=2;
    shotTimer=SHOT_TIMER_MAX;
    slideDir=-1;
    invaderCounter=0;
    invaderSpeed=3;
    invadersRemaining=40;
}

void InvaderCheckPlayerCollision(UINT8 i){

    UINT8 playerColumn=paddle.x/8;
    UINT8 playerRow=paddle.y/8;
                
    if((playerColumn==invaders[i].column&&playerRow==invaders[i].row)){
        paddle.dead=1;
        paddle.lives=0;
    }
}

void InvaderCheckBulletCollision(UINT8 i){

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

void UpdateInvaderTiles(UINT8 i){

    // If the invader is already dead
     if(invaders[i].active==0){
        
        // Just draw blank
        set_bkg_tile_xy(invaders[i].column,invaders[i].row,0);
        set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,0);

    // If the invader has not slid anywhere yet
    }else if(invaders[i].slide==0){
        
        set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile);
        set_bkg_tile_xy(invaders[i].column-slideDir,invaders[i].row,0);

    // If the invader is sliding to the right
    } else if(invaders[i].slide>0){


        set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile+16-invaders[i].slide);
        set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,invaders[i].originalTile+8-invaders[i].slide);
        

    // If the invader is sliding to the left.
    }else if(invaders[i].slide<0){

        set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile-invaders[i].slide);
        set_bkg_tile_xy(invaders[i].column-1,invaders[i].row,invaders[i].originalTile+8-invaders[i].slide);


    }
}

UINT8 SlideInvader(UINT8 i){

    // Slide in the given direction
    invaders[i].slide+=slideDir;

    // When we reach -8 or 8
    // We need to shift over a column
    if(invaders[i].slide>7||invaders[i].slide<-7){

        // Reset our slide
        // Move over one column
        invaders[i].slide=0;
        invaders[i].column+=slideDir;

        // Return if we are on the edge
        return(invaders[i].column==0)||(invaders[i].column==19);
    }

    return 0;
}

UINT8 InvaderTryFireBullet(UINT8 i){

    // Try to get a bullet sprite
    // We can only have approx. 5 enemy bullets on screen at a time
    // This function returns 0 when no enemy bullets are available.
    UINT8 availableBulletSprite=GetAvailableBulletSprite();

    // If we have an enemy bullet availble
    if(availableBulletSprite!=0){

        /// Set the availabble bullet sprite to use our bullet tile
        set_sprite_tile(availableBulletSprite,BULLETA_SPRITE_START);

        // Position below the enemy
        move_sprite(availableBulletSprite,invaders[i].column*8+12+invaders[i].slide*2,invaders[i].row*8+24);

        // Increase our timer or the next bullet
        shotTimer=SHOT_TIMER_MAX;
    }
}

void ShiftAllInvadersDown(){

    // Increase the row for all invaders
    for(UINT8 i=0;i<40;i++){invaders[i].row++;}

    // Reverse the direction to slide invaders
    slideDir=-slideDir;

    fill_bkg_rect(0,topRow,20,1,0);
    
    // Increase this, so we know how far down are invaders are
    topRow++;
}

UINT8 InvadersShouldMove(){
    return invaderCounter>4-topRow/2||topRow>9;
}

void UpdateInvaders(){
    
    UINT8 anyInvaderHasReachedEndOfScreen=0;

    invadersRemaining=0;
    invaderCounter++;
    if(shotTimer!=0)shotTimer--;

    for(UINT8 i=0;i<40;i++){

        // If this invader is active
        if(invaders[i].active==1){

            // increase our count 
            invadersRemaining++;

            if(shotTimer==0&&RandomNumber(0,100)<10){
                InvaderTryFireBullet(i);
            }

            InvaderCheckPlayerCollision(i);
            InvaderCheckBulletCollision(i);
        }

        
        // If the invaders should move
        if(InvadersShouldMove()){

            // Check if any have reached the end of the screen after sliding
            anyInvaderHasReachedEndOfScreen=anyInvaderHasReachedEndOfScreen||SlideInvader(i);

        }

        // Update the tiles for this invader
        UpdateInvaderTiles(i);

    }
    
    if(InvadersShouldMove()){
        invaderCounter=0;
    }



    // If any invader has reached the end of the screen
    // Shift all invaders down one row.
    if(anyInvaderHasReachedEndOfScreen){
        ShiftAllInvadersDown();
    }
}
