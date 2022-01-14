#include <gb/gb.h>
#include "player.h"
#include "bullets.h"

Paddle paddle;
UINT8 joypadCurrent,joypadPrevious;

void SetupPlayer(){

    set_sprite_tile(0,1);
    set_sprite_tile(1,2);

    paddle.x=80;
    paddle.y=128;
    paddle.dead=0;

    joypadCurrent=0;
    joypadPrevious=0; 
}

void UpdatePlayer(){
        
    joypadPrevious=joypadCurrent;
    joypadCurrent=joypad();

    if(joypad() & J_LEFT)paddle.x-=2;
    else if(joypad() & J_RIGHT)paddle.x+=2;

    // Clamp our x position at the screen end
    if(paddle.x<8)paddle.x=8;
    if(paddle.x>152)paddle.x=152;

    // if the A button was just pressed
    if((joypadCurrent & J_A) && !(joypadPrevious & J_A)){
        SpawnBullet(paddle.x,paddle.y-12);
    }

    move_sprite(0,paddle.x,paddle.y+12);
    move_sprite(1,paddle.x+8,paddle.y+12);
}
