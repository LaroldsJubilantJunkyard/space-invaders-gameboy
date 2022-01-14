#include <gb/gb.h>
#include "invaders.h"
#include "player.h"
#include "bullets.h"


#define MAX_NUMBER_OF_BULLETS_ON_SCREEN 10

extern Invader invaders[];
extern unsigned char helper[];

INT8 bullets[MAX_NUMBER_OF_BULLETS_ON_SCREEN];
UINT8 bulletsOnScreen,bulletCounter;

extern INT8 slideDir;

extern void IncreaseScore(UINT8 amount);
extern Paddle paddle;

void SetupBullets(){
    
    for(INT8 i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++)bullets[i]=0;
    bulletCounter=0;
    bulletsOnScreen=0;
}

void SpawnEnemyBullet(UINT8 x, UINT8 y){
    for(INT8 i=2;i<40;i++){
        if(get_sprite_tile(i)==0){
            set_sprite_tile(i,42);
            move_sprite(i,x+4,y+12);
            bullets[bulletsOnScreen]=-i;
            bulletsOnScreen++;

            ReSortBullets();
            break;
        }
    }
}
void SpawnBullet(UINT8 x, UINT8 y){
    for(INT8 i=2;i<40;i++){
        if(get_sprite_tile(i)==0){
            set_sprite_tile(i,42);
            move_sprite(i,x+4,y+12);
            bullets[bulletsOnScreen]=i;
            bulletsOnScreen++;

            ReSortBullets();
            break;
        }
    }
}

void ReSortBullets(){
    
    UINT8 count=0;
    INT8 sorted[MAX_NUMBER_OF_BULLETS_ON_SCREEN];
    UINT8 i=0;

    // Create a copy of the bullet array
    for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
        sorted[i]=bullets[i];
    }

    // Put each non-zero value in array again
    for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
        if(sorted[i]!=0)bullets[count++]=sorted[i];
    }

    // Set the remaining items as 0
    for( i=count;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
        bullets[count++]=0;
    }
}

void RemoveBullet(UINT8 j){
    bulletsOnScreen--;
    INT8 sprite = bullets[j];
    if(sprite<0)sprite=-sprite;
    move_sprite(sprite,160,160);
    set_sprite_tile(sprite,0);
    bullets[j]=0;

    ReSortBullets();
}

void UpdateBullets(){

    UINT8 bx,by;

    for(UINT8 j=0;j<MAX_NUMBER_OF_BULLETS_ON_SCREEN;j++){

        if(bullets[j]==0)continue;

        INT8 sprite = bullets[j];
        if(sprite<0)sprite=-sprite;

        if(bullets[j]<0)scroll_sprite(sprite,0,4);
        else scroll_sprite(sprite,0,-4);

        bx = shadow_OAM[sprite].x-4;
        by = shadow_OAM[sprite].y-12;

        // if the bullet is high enough
        // Consider it offscreen
        if(by<8||by>176){

            RemoveBullet(j);

            continue;
        }

        if(bullets[j]<0){

            INT16 xd = paddle.x-bx;
            INT16 yd = paddle.y-by;

            if(xd<0)xd=-xd;
            if(yd<0)yd=-yd;

            if(xd<8&&yd<6){

                RemoveBullet(j);

                paddle.dead=1;

                continue;
            }
        }

            

        get_bkg_tiles(bx/8,by/8,1,1,helper);

        if(helper[0]>=3&&helper[0]<=17){

            helper[0]=helper[0]+1;
            if(helper[0]==5)helper[0]=0;
            else if(helper[0]==8)helper[0]=0;
            else if(helper[0]==11)helper[0]=0;
            else if(helper[0]==14)helper[0]=0;
            else if(helper[0]==17)helper[0]=0;


            set_bkg_tiles(bx/8,by/8,1,1,helper);

            RemoveBullet(j);


        } else if(helper[0]>=19&&helper[0]<=23&&bullets[j]>0){


            set_bkg_tile_xy(bx/8,by/8,0);
            if(slideDir>0)set_bkg_tile_xy(bx/8-1,by/8,0);
            else set_bkg_tile_xy(bx/8+1,by/8,0);

            UINT8 invader= GetInvaderForNode(bx/8,by/8);

            IncreaseScore(10);

/*

            if(invader!=255){

                if(invaders[invader].active==1){


                    IncreaseScore(10);

                    // Set this enemy as inactive
                    invaders[invader].active=0;
                }

            }*/
            RemoveBullet(j);

        }

    }
}
