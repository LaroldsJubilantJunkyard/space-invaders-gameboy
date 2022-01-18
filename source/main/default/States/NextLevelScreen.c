#include <gb/gb.h>
#include "Common.h"
#include "Hud.h"

void SetupNextLevelScreen(){

    DrawText(8,8,"ROUND");
    DrawNumber(9,9,level,2);
    DrawText(8,11,"READY!");
}

uint8_t UpdateNextLevelScreen(){

    delay(2000);

    return GAMEPLAYSCREEN;
}