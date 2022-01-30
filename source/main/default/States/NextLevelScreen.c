#include <gb/gb.h>
#include "Common.h"
#include "Hud.h"

void SetupNextLevelScreen(){

    // Draw which round it is
    DrawText(8,8,"ROUND");
    DrawNumber(9,9,level,2);
    DrawText(8,11,"READY!");
}

uint8_t UpdateNextLevelScreen(){

    // Wait for 2 seconds
    delay(2000);

    // Always return gameplay
    return GAMEPLAYSCREEN;
}