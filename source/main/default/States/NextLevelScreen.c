#include <gb/gb.h>
#include "Common.h"
#include "Hud.h"

void SetupNextLevelScreen(){

    DrawText(9,8,"ROUND");
    DrawNumber(11,9,level,2);
    DrawText(9,11,"READY!");
}

UINT8 UpdateNextLevelScreen(){

    delay(2000);

    return GAMEPLAYSCREEN;
}