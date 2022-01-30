#include <gb/gb.h>
#include "States/GameplayScreen.h"
#include "States/Gameplay/player.h"
#include "States/Gameplay/bullets.h"
#include "common.h"

Player player;


void SetupPlayer(){

    set_sprite_tile(0,PLAYER_SPRITE_START);
    set_sprite_tile(1,PLAYER_SPRITE_START+1);

    // Put thep layer at the bottom middle ofthescreen
    player.x=80;
    player.y=138;

    // The player is alive, with no recent damage
    player.dead=0;
    player.damageTimer=0;
}

void DamagePlayer(uint8_t amount){

    // Make sure our damage timer has expired
    if(player.damageTimer>0)return;

    // Avoid going below zero
    // Because (lives is  unsignedinteger)
    if(amount>player.lives)player.lives=0;
    else player.lives-=amount;

    //Set our damage timer to 15
    player.damageTimer=15;

    // If we are dead
    player.dead=player.lives==0;

    // Play a sound
    NR41_REG=0x2A;
    NR42_REG=0xA7;
    NR43_REG=0x57;
    NR44_REG=0xC0;
    
    // Update our lives
    UpdateHUD();
}

void UpdatePlayer(){

    // Move left and right with the d-pad
    if(joypad() & J_LEFT)player.x-=2;
    else if(joypad() & J_RIGHT)player.x+=2;

    // Clamp our x position at the screen ends
    if(player.x<8)player.x=8;
    if(player.x>152)player.x=152;

    // if the A button was just pressed
    if((joypadCurrent & J_A) && !(joypadPrevious & J_A)){
        
        // If our player's bullet sprite isn't in use
        if(PlayerBulletSprite.tile==0){

            // Align with the player
            PlayerBulletSprite.x=player.x+4;
            PlayerBulletSprite.y=player.y+12;

            // Set to use the player's bullet
            PlayerBulletSprite.tile=BULLETC_SPRITE_START;

            // Play a sound
            NR10_REG=0x1D;
            NR11_REG=0x4F;
            NR12_REG=0x56;
            NR13_REG=0xF6;
            NR14_REG=0x86;
        }
    }

    // If our damage timer hasn't expired
    if(player.damageTimer>0){

        // Decrease our timer by one
        player.damageTimer--;

        // Every other 3 frames we will hide/show the player
        if(player.damageTimer/3%2==0){

            // Draw in normal position
            move_sprite(0,player.x,player.y+12);
            move_sprite(1,player.x+8,player.y+12);
        }else{
            
            // Hide the player by drawing at 0,0, which would make both sprites offscreen
            move_sprite(0,0,0);
            move_sprite(1,0,0);
        }

    }else{
        
        // Draw in normal position
        move_sprite(0,player.x,player.y+12);
        move_sprite(1,player.x+8,player.y+12);
    }
}
