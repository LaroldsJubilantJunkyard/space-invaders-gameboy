#include <gb/gb.h>
//
#include "common.h"
#include "States/GameFirstLoad.h"
#include "States/StartScreen.h"
#include "States/MenuScreen.h"
#include "States/GameplayScreen.h"
#include "States/NextLevelScreen.h"
#include "States/GameOverScreen.h"


void main(void){

    GameFirstLoad();

    UINT8 currentGameState = GAMEFIRSTLOAD;
    UINT8 nextGameState = STARTSCREEN;

    while(1){
        
        joypadPrevious=joypadCurrent;
        joypadCurrent=joypad();

        if(nextGameState!=currentGameState){

            currentGameState=nextGameState;
            
            ClearBackground();
            ClearAllSprites();

            if(currentGameState==STARTSCREEN)SetupStartScreen();
            else if(currentGameState==MENUSCREEN)SetupMenuScreen();
            else if(currentGameState==GAMEPLAYSCREEN)SetupGameplayScreen();
            else if(currentGameState==GAMEOVERSCREEN)SetupGameOverScreen();
            else if(currentGameState==NEXTLEVELSCREEN)SetupNextLevelScreen();
        }

        
        if(currentGameState==STARTSCREEN)nextGameState=UpdateStartScreen();
        else if(currentGameState==MENUSCREEN)nextGameState=UpdateMenuScreen();
        else if(currentGameState==GAMEPLAYSCREEN)nextGameState=UpdateGameplayScreen();
        else if(currentGameState==GAMEOVERSCREEN)nextGameState=UpdateGameOverScreen();
        else if(currentGameState==NEXTLEVELSCREEN)nextGameState=UpdateNextLevelScreen();


        wait_vbl_done();
    }
   
    
}