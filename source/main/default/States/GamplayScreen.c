#include "Common.h"
#include "Hud.h"
#include "States/Gameplay/player.h"
#include "States/Gameplay/invaders.h"
#include "States/Gameplay/bullets.h"
#include "Graphics/Barricade.h"

unsigned char helper[5]={0x00,0x00,0x00,0x00,0x00};
UINT16 score;

extern UINT8 invadersRemaining;
extern Paddle paddle;


void UpdateScore(){

    DrawText(2,0,"SCORE");
    DrawNumber(8,0,score,5);

    set_bkg_tile_xy(13,0,PLAYER_SPRITE_START);
    set_bkg_tile_xy(14,0,PLAYER_SPRITE_START+1);
    DrawText(15,0,"=");
    DrawNumber(16,0,paddle.lives,2);

}

void IncreaseScore(UINT8 amount){

    score+=amount;

    UpdateScore();
}

void DrawBarricade(UINT8 topLeftX, UINT8 topLeftY){

    UINT8 tileRowSize=3;
    
    set_bkg_tile_xy(topLeftX,topLeftY,BARRICADE_TILES_START+tileRowSize);
    set_bkg_tile_xy(topLeftX+1,topLeftY,BARRICADE_TILES_START);
    set_bkg_tile_xy(topLeftX+2,topLeftY,BARRICADE_TILES_START);
    set_bkg_tile_xy(topLeftX+3,topLeftY,BARRICADE_TILES_START+tileRowSize*2);

    set_bkg_tile_xy(topLeftX+0,topLeftY+1,BARRICADE_TILES_START);
    set_bkg_tile_xy(topLeftX+1,topLeftY+1,BARRICADE_TILES_START);
    set_bkg_tile_xy(topLeftX+2,topLeftY+1,BARRICADE_TILES_START);
    set_bkg_tile_xy(topLeftX+3,topLeftY+1,BARRICADE_TILES_START);

    
    set_bkg_tile_xy(topLeftX+0,topLeftY+2,BARRICADE_TILES_START);
    set_bkg_tile_xy(topLeftX+1,topLeftY+2,BARRICADE_TILES_START+tileRowSize*3);
    set_bkg_tile_xy(topLeftX+2,topLeftY+2,BARRICADE_TILES_START+tileRowSize*4);
    set_bkg_tile_xy(topLeftX+3,topLeftY+2,BARRICADE_TILES_START);
}

void SetupLevel(){
    for(UINT8 i=2;i<40;i++){
        move_sprite(i,160,160);
        set_sprite_tile(i,0);
    }

    fill_bkg_rect(0,0,18,20,0);

    DrawBarricade(2,11);
    DrawBarricade(8,11);
    DrawBarricade(14,11);

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