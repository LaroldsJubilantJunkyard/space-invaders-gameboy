#include "Common.h"
#include "Hud.h"
#include "States/Gameplay/player.h"
#include "States/Gameplay/invaders.h"
#include "States/Gameplay/bullets.h"
#include "States/Gameplay/alien.h"
#include "Graphics/SpaceInvadersFont.h"
#include "Graphics/Barricade.h"
#include "Graphics/Alien.h"


extern uint8_t invadersRemaining;
extern Player player;


void UpdateHUD(){

    // Draw our "score" text and the actual score number
    DrawText(2,0,"SCORE");
    DrawNumber(8,0,score,5);

    // Drawthe player sprite at the bottom next to our lives display
    set_bkg_tile_xy(13,0,PLAYER_TILES_START);
    set_bkg_tile_xy(14,0,PLAYER_TILES_START+1);
    DrawText(15,0,"=");

    // Draw how many lives we have
    DrawNumber(16,0,player.lives,2);

}

void IncreaseScore(uint8_t amount){

    score+=amount;
    if(score>highScore)highScore=score;

    UpdateHUD();
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
   
    SetupLevel();  
    SetupBullets();
    SetupInvaders();
    SetupPlayer();
    SetupAlien();

    // Update the score initially
    UpdateHUD();
}

uint8_t UpdateGameplayScreen(){

    UpdateInvaders();     
    UpdateBullets();
    UpdatePlayer();
    UpdateAlien();

    // Ifthe player is dead
    if (player.dead==1){
        
        // Go to the game over screen
        return GAMEOVERSCREEN;

    // If we have no more invaders remaining
    }else if(invadersRemaining==0){

        // Go to the next level screen
        return NEXTLEVELSCREEN;
    }

    // Continue with gameplay
    return GAMEPLAYSCREEN;
}