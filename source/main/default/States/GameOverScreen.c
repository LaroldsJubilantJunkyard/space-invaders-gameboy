#include <gb/gb.h>
#include "Hud.h"
#include "Common.h"

void SetupGameOverScreen(void)
{

    // Draw game over on the screen
    DrawText(5, 9, "GAME  OVER");
}

uint8_t UpdateGameOverScreen(void)
{

    // Go to the start screen when a is pressed
    if (joypadCurrent & J_A)
        return STARTSCREEN;

    return GAMEOVERSCREEN;
}