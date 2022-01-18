#include <gb/gb.h>
#include "States/Gameplay/invaders.h"
#include "States/Gameplay/bullets.h"
#include "States/Gameplay/player.h"
#include "States/GameplayScreen.h"
#include "Graphics/Alien.h"
#include "Common.h"

#define SHOT_TIMER_MAX 50

const unsigned char tiles[9] = {25,18,19,20,21,22,23,24,25};

Invader invaders[40];
uint8_t invaderSpeed,invaderCounter,topRow,shotTimer,moveRow=0,rowsAtEnd=0;

void SetupInvaders(){

    uint8_t alienTypes[3]={INVADER1_TILES_START,INVADER2_TILES_START,INVADER3_TILES_START};
    
     for(uint8_t i=0;i<40;i++){
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
    moveRow=0;
    rowsAtEnd=0;
    invaderCounter=0;
    invaderSpeed=3;
    invadersRemaining=40;
}

void InvaderCheckPlayerCollision(uint8_t i){

    uint8_t playerColumn=paddle.x/8;
    uint8_t playerRow=paddle.y/8;
                
    if((playerColumn==invaders[i].column&&playerRow==invaders[i].row)){
        paddle.dead=1;
        paddle.lives=0;
    }
}

void UpdateInvaderTiles(uint8_t i){

    // If the invader is already dead
     if(invaders[i].active==0){

        if(invaders[i].slide>=0)set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,0);
        else set_bkg_tile_xy(invaders[i].column-1,invaders[i].row,0);
        
        // Just draw blank
        set_bkg_tile_xy(invaders[i].column,invaders[i].row,0);

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

uint8_t SlideInvader(uint8_t i){

    if(invaders[i].column==0&&slideDir!=1)return 0;
    if(invaders[i].column>=19&&slideDir==1)return 0;

    // Slide in the given direction
    invaders[i].slide+=slideDir*2;

    // When we reach -8 or 8
    // We need to shift over a column
    if(invaders[i].slide>7||invaders[i].slide<-7){

        // Reset our slide
        // Move over one column
        invaders[i].slide=0;
        invaders[i].column+=slideDir;

        // Return if we are on the edge
        return(invaders[i].column==0)||(invaders[i].column>=19);
    }

    return 0;
}

void InvaderTryFireBullet(uint8_t i){

    // Try to get a bullet sprite
    // We can only have approx. 5 enemy bullets on screen at a time
    // This function returns 0 when no enemy bullets are available.
    uint8_t availableBulletSprite=GetAvailableBulletSprite();

    // If we have an enemy bullet availble
    if(availableBulletSprite!=0){

        /// Set the availabble bullet sprite to use our bullet tile
        set_sprite_tile(availableBulletSprite,BULLETA_SPRITE_START);

        // Position below the enemy
        move_sprite(availableBulletSprite,invaders[i].column*8+12+invaders[i].slide,invaders[i].row*8+24);

        // Increase our timer or the next bullet
        shotTimer=SHOT_TIMER_MAX;
    }
}

void ShiftAllInvadersDown(){

    // Increase the row for all invaders
    for(uint8_t i=0;i<40;i++){
        invaders[i].row++;

        // Update the tiles for this invader
        UpdateInvaderTiles(i);
    }

    // Reverse the direction to slide invaders
    slideDir=-slideDir;

    fill_bkg_rect(0,topRow,20,1,0);
    
    // Increase this, so we know how far down are invaders are
    topRow++;
}

uint8_t InvadersShouldMove(){
    return invaderCounter>12-topRow/2||topRow>9;
}

void UpdateInvaders(){

    
    uint8_t anyInvaderHasReachedEndOfScreen=0;
    

    invaderCounter++;
    if(shotTimer!=0)shotTimer--;

    for(uint8_t i=moveRow*8;i<moveRow*8+8;i++){

        // If this invader is active
        if(invaders[i].active==1){

            if(shotTimer==0&&RandomNumber(0,100)<10){
                InvaderTryFireBullet(i);
            }

            InvaderCheckPlayerCollision(i);
        }

        // If the invaders should move
        if(InvadersShouldMove()){

            
                
            // Check if any have reached the end of the screen after sliding
            if(SlideInvader(i)){
                anyInvaderHasReachedEndOfScreen=1;
            }

            // Update the tiles for this invader
            UpdateInvaderTiles(i);

        }

        
            

    }
    // If any invader has reached the end of the screen
    // Shift all invaders down one row.
    if(anyInvaderHasReachedEndOfScreen){
        rowsAtEnd++;
        if(rowsAtEnd==5){
            rowsAtEnd=0;

            

            ShiftAllInvadersDown();
        }
    }

    // If the invaders should move
    if(InvadersShouldMove()){

        if(moveRow==4||moveRow==2){
            NR21_REG=0x43;
            NR22_REG=0x81;
            NR23_REG=0xED;
            NR24_REG=0xC1;
        }else if(moveRow==0){
            NR21_REG=0x83;
            NR22_REG=0x81;
            NR23_REG=0xED;
            NR24_REG=0xC1;
        }

        // Loop around after 5
        moveRow=(moveRow+1)%5;

        // Reset our counter
        invaderCounter=0;
    }


}
