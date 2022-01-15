#include "Common.h"
#include "States/Gameplay/player.h"
#include "States/Gameplay/invaders.h"
#include "States/Gameplay/bullets.h"
#include "Graphics/BarricadeMap.h"

unsigned char helper[5]={0x00,0x00,0x00,0x00,0x00};
UINT16 score;

extern UINT8 invadersRemaining;
extern Paddle paddle;


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


void SetupLevel(){
    for(UINT8 i=2;i<40;i++){
        move_sprite(i,160,160);
        set_sprite_tile(i,0);
    }

    fill_bkg_rect(0,0,18,20,0);

    // Draw our barricades
    set_bkg_tiles(2,11,5,4,BarricadeMap);
    set_bkg_tiles(8,11,5,4,BarricadeMap);
    set_bkg_tiles(14,11,5,4,BarricadeMap);
}

void SetupGameplayScreen(){
    

    score=0;
    paddle.lives=3;
   
    SetupLevel();  
    SetupBullets();
    SetupInvaders();
    SetupPlayer();

    UpdateScore();
}

UINT8 UpdateGameplayScreen(){

    UpdateInvaders();     
    UpdateBullets();
    UpdatePlayer();

    if (paddle.dead==1&&invadersRemaining>0){


        if(paddle.lives==0){
            return GAMEOVERSCREEN;
        }
        
        paddle.lives--;

        move_sprite(0,160,160);
        move_sprite(1,160,160);
        delay(1000);

        paddle.dead=0;
        paddle.x=80;

        UpdateScore();

    }else if(invadersRemaining==0){
        return NEXTLEVELSCREEN;
    }

    return GAMEPLAYSCREEN;
}