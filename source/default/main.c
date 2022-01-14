#include <gb/gb.h>
#include "PlaceholderBlackBlock.h"
#include "BarricadeMap.h"
#include "SpaceInvadersTiles.h"
//
#include "player.h"
#include "invaders.h"
#include "bullets.h"

unsigned char helper[5]={0x00,0x00,0x00,0x00,0x00};
UINT16 score;

extern UINT8 invadersRemaining;
extern Paddle paddle;

void SetupLevel(){
    for(UINT8 i=2;i<40;i++){
        move_sprite(i,160,160);
        set_sprite_tile(i,0);
    }


    // Clear the screen
    for(UINT8 j=0;j<18;j++){
        for(UINT8 i=0;i<20;i++){
            helper[0]=0;
            set_bkg_tiles(i,j,1,1,helper);    
        }
    }

    // Draw our barricades
    set_bkg_tiles(2,11,5,4,BarricadeMap);
    set_bkg_tiles(8,11,5,4,BarricadeMap);
    set_bkg_tiles(14,11,5,4,BarricadeMap);
}

void UpdateScore(){

    helper[0]=(score/10000)%10+47;
    helper[1]=(score/1000)%10+47;
    helper[2]=(score/100)%10+47;
    helper[3]=(score/10)%10+47;
    helper[4]=score%10+47;

    set_win_tiles(0,0,5,1,helper);

    helper[0]=1;
    helper[1]=2;
    helper[2]=57;
    helper[3]=(paddle.lives/10)%10+47;
    helper[4]=paddle.lives%10+47;
    set_win_tiles(14,0,5,1,helper);
}

void IncreaseScore(UINT8 amount){

    score+=amount;

    UpdateScore();
}


void main(void){

    DISPLAY_ON;
    SHOW_SPRITES;
    SHOW_BKG;
    SPRITES_8x8;
    SHOW_WIN;

    move_win(7,136);

    set_bkg_data(0,58,SpaceInvadersTiles);
    set_sprite_data(0,58,SpaceInvadersTiles);

    GameplayStart:

    score=0;
    paddle.lives=3;
   
    SetupLevel();  
    SetupBullets();
    SetupInvaders();

    LifeStart:

    SetupPlayer();
    UpdateScore();

    while (paddle.dead==0&&invadersRemaining>0)
    {

        UpdateInvaders();     
        UpdateBullets();
        UpdatePlayer();

        wait_vbl_done();

    }

    if(invadersRemaining==0||paddle.lives==0){
        goto GameplayStart;
    }
    else {
        move_sprite(0,160,160);
        move_sprite(1,160,160);
        delay(200);
        paddle.lives--;
        goto LifeStart;
    }
    
}