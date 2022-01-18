#include "Common.h"
#include "Hud.h"
#include "States/Gameplay/player.h"
#include "States/Gameplay/invaders.h"
#include "States/Gameplay/bullets.h"
#include "States/Gameplay/alien.h"
#include "Graphics/SpaceInvadersFont.h"
#include "Graphics/Barricade.h"
#include "Graphics/Alien.h"

unsigned char helper[5]={0x00,0x00,0x00,0x00,0x00};
uint16_t score;

extern uint8_t invadersRemaining;
extern Paddle paddle;


void UpdateScore(){

    DrawText(2,0,"SCORE");
    DrawNumber(8,0,score,5);

    set_bkg_tile_xy(13,0,PLAYER_SPRITE_START);
    set_bkg_tile_xy(14,0,PLAYER_SPRITE_START+1);
    DrawText(15,0,"=");
    DrawNumber(16,0,paddle.lives,2);

}

void IncreaseScore(uint8_t amount){

    score+=amount;
    if(score>highScore)highScore=score;

    UpdateScore();
}

void DrawBarricade(uint8_t topLeftX, uint8_t topLeftY){

    uint8_t tileRowSize=3;
    
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

    DrawBarricade(2,13);
    DrawBarricade(8,13);
    DrawBarricade(14,13);

}

void SetupGameplayScreen(){
    

    score=0;
    level=1;
    paddle.lives=3;
   
    SetupLevel();  
    SetupBullets();
    SetupInvaders();
    SetupPlayer();
    SetupAlien();

    UpdateScore();
}

uint8_t UpdateGameplayScreen(){

    UpdateInvaders();     
    UpdateBullets();
    UpdatePlayer();
    UpdateAlien();

    if (paddle.dead==1){
        
        return GAMEOVERSCREEN;

    }else if(invadersRemaining==0){
        return NEXTLEVELSCREEN;
    }

    return GAMEPLAYSCREEN;
}