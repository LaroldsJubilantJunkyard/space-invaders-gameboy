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

void DamagePlayer(uint8_t amount){
    if(amount>paddle.lives)paddle.lives=0;
    else paddle.lives-=amount;
    paddle.damageTimer=15;

    // If we are dead
    paddle.dead=paddle.lives==0;
    NR41_REG=0x2A;
    NR42_REG=0xA7;
    NR43_REG=0x57;
    NR44_REG=0xC0;
    
    UpdateScore();
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

            NR10_REG=0x1D;
            NR11_REG=0x4F;
            NR12_REG=0x56;
            NR13_REG=0xF6;
            NR14_REG=0x86;
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
