#include <gb/gb.h>
#include "Hud.h"
#include "Common.h"

void SetupGameOverScreen(){
    
    DrawText(5,9,"GAME  OVER");
}
uint8_t UpdateGameOverScreen(){

    if(joypadCurrent & J_A)return STARTSCREEN;

    return GAMEOVERSCREEN;
}