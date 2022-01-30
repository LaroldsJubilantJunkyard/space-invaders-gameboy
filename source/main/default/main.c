#include <gb/gb.h>
#include "common.h"
#include "States/StartScreen.h"
#include "States/MenuScreen.h"
#include "States/GameplayScreen.h"
#include "States/NextLevelScreen.h"
#include "States/GameOverScreen.h"


void FadeScreen(uint8_t start, uint8_t end){
    int8_t dir = 15;
    if(end<start)dir=-15;
            
    // Since we are only using black and white, fading is easy
    for(uint16_t fade=start;fade!=end;fade+=dir){

        const palette_color_t blackAndWhite[4] = { RGB8(255, 255, 255), RGB8(fade, fade, fade),RGB8(fade, fade, fade),RGB8(fade, fade, fade)    };

        // Update color palettes
        set_sprite_palette(0,1,blackAndWhite);
        set_bkg_palette(0,1,blackAndWhite);
        
        wait_vbl_done();
    }

}

void main(void){

    // This enables Sound
    // these registers must be in this specific order!
    NR52_REG = 0x80; // is 1000 0000 in binary and turns on sound
    NR50_REG = 0x77; // sets the volume for both left and right channel just set to max 0x77
    NR51_REG = 0xFF; // is 1111 1111 in binary, select which chanels we want to use in this case all of them. One bit for the L one bit for the R of all four channels

    DISPLAY_ON;
    SHOW_SPRITES;
    SHOW_BKG;
    SPRITES_8x8;

    uint8_t currentGameState = GAMEFIRSTLOAD;
    uint8_t nextGameState = STARTSCREEN;

    while(1){
        
        joypadPrevious=joypadCurrent;
        joypadCurrent=joypad();

        if(nextGameState!=currentGameState){
            currentGameState=nextGameState;

            FadeScreen(0,255);
            
            fill_bkg_rect(0,0,20,18,0);
            ClearAllSprites();

            if(currentGameState==STARTSCREEN)SetupStartScreen();
            else if(currentGameState==MENUSCREEN)SetupMenuScreen();
            else if(currentGameState==GAMEPLAYSCREEN)SetupGameplayScreen();
            else if(currentGameState==GAMEOVERSCREEN)SetupGameOverScreen();
            else if(currentGameState==NEXTLEVELSCREEN)SetupNextLevelScreen();

            FadeScreen(255,0);
        }

        
        if(currentGameState==STARTSCREEN)nextGameState=UpdateStartScreen();
        else if(currentGameState==MENUSCREEN)nextGameState=UpdateMenuScreen();
        else if(currentGameState==GAMEPLAYSCREEN)nextGameState=UpdateGameplayScreen();
        else if(currentGameState==GAMEOVERSCREEN)nextGameState=UpdateGameOverScreen();
        else if(currentGameState==NEXTLEVELSCREEN)nextGameState=UpdateNextLevelScreen();


        wait_vbl_done();
    }
   
    
}