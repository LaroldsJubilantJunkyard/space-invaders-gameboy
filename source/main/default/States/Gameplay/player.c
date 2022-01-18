#include <gb/gb.h>
#include "States/Gameplay/player.h"
#include "States/Gameplay/bullets.h"
#include "common.h"

Paddle paddle;


void SetupPlayer(){

    set_sprite_tile(0,1);
    set_sprite_tile(1,2);

    paddle.x=80;
    paddle.y=138;
    paddle.dead=0;
    paddle.lives=3;
    paddle.damageTimer=0;
}

void UpdatePlayer(){

    if(joypad() & J_LEFT)paddle.x-=2;
    else if(joypad() & J_RIGHT)paddle.x+=2;

    // Clamp our x position at the screen end
    if(paddle.x<8)paddle.x=8;
    if(paddle.x>152)paddle.x=152;

    // if the A button was just pressed
    if((joypadCurrent & J_A) && !(joypadPrevious & J_A)){
        
        if(shadow_OAM[2].tile==0){
            shadow_OAM[2].x=paddle.x+4;
            shadow_OAM[2].y=paddle.y+12;
            shadow_OAM[2].tile=BULLETC_SPRITE_START;
        }
    }

    if(paddle.damageTimer>0){

        paddle.damageTimer--;

        if(paddle.damageTimer/3%2==0){

            move_sprite(0,paddle.x,paddle.y+12);
            move_sprite(1,paddle.x+8,paddle.y+12);
        }else{
            
            move_sprite(0,0,0);
            move_sprite(1,0,0);
        }

    }else{
        
        move_sprite(0,paddle.x,paddle.y+12);
        move_sprite(1,paddle.x+8,paddle.y+12);
    }
}
