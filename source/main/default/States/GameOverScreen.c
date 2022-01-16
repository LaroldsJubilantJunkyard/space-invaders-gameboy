#include <gb/gb.h>
#include "Hud.h"
#include "Common.h"

void SetupGameOverScreen(){
    
    DrawText(7,9,"GAME OVER");
}
UINT8 UpdateGameOverScreen(){

    if(joypadCurrent & J_A)return STARTSCREEN;

    return GAMEOVERSCREEN;
}