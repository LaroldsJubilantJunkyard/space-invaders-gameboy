#include <gb/gb.h>
#include "Common.h"
#include "States/GameplayScreen.h"
#include <gb/hardware.h>

uint16_t alienCounter;

void SetupAlien(){

    alienCounter=0;
    
    // When these are 0, it means the alien is not active
    set_sprite_tile(ALIEN_OAM_SPRITE,0);
    set_sprite_tile(ALIEN_OAM_SPRITE+1,0);

    // Default to not visible
    move_sprite(ALIEN_OAM_SPRITE,0,0);
    move_sprite(ALIEN_OAM_SPRITE+1,0,0);
}

void UpdateAlien(){

    if(shadow_OAM[ALIEN_OAM_SPRITE].tile==0){
        alienCounter++;;
    }

    // small chance if the alien is unused
    if(alienCounter>=400&&shadow_OAM[ALIEN_OAM_SPRITE].tile==0){

        if(RandomNumber(0,100)<10){
        
            // Set the sprite tiles
            set_sprite_tile(ALIEN_OAM_SPRITE,ALIEN_SPRITE_START);
            set_sprite_tile(ALIEN_OAM_SPRITE+1,ALIEN_SPRITE_START+1);

            // Set fully offscreen, as it will scrolll on and then off
            move_sprite(ALIEN_OAM_SPRITE,231,24);
            move_sprite(ALIEN_OAM_SPRITE+1,239,24);

        }else{
            alienCounter=0;
        }

    }else if(shadow_OAM[ALIEN_OAM_SPRITE].tile!=0){

        // Move the sprites to the right
        scroll_sprite(ALIEN_OAM_SPRITE,1,0);
        scroll_sprite(ALIEN_OAM_SPRITE+1,1,0);

        // If the player bullet sprite is active
        if(PlayerBulletSprite.tile!=0){
            

            // Get differences
            int8_t xd = PlayerBulletSprite.x-(shadow_OAM[ALIEN_OAM_SPRITE+1].x-8);
            int8_t yd = PlayerBulletSprite.y-shadow_OAM[ALIEN_OAM_SPRITE+1].y;

            if(xd<0)xd=-xd;
            if(yd<0)yd=-yd;

            // If we are close enough
            if(xd<=8&&yd<=8){

                // Move over beyond 168 (and less han 200)
                // So the next if staemen ends the alien
                shadow_OAM[ALIEN_OAM_SPRITE].x=178;

                // End the bullet sprite
                PlayerBulletSprite.tile=0;
                PlayerBulletSprite.x=0;
                PlayerBulletSprite.y=0;

                // Increase score by 100
                IncreaseScore(100);
            }
        }

        // The alien spawns a x=230ish, and only moves to the right
        // If i's x coordinae is less than 200 it's looped around 
        // If it's x coordinate is more than 168 it is offscreen
        if(shadow_OAM[ALIEN_OAM_SPRITE].x>168 &&shadow_OAM[ALIEN_OAM_SPRITE].x<200){       

            alienCounter=0;     

            // Unset it's tiles
            set_sprite_tile(ALIEN_OAM_SPRITE,0);
            set_sprite_tile(ALIEN_OAM_SPRITE+1,0);

            // Move it's sprites back to origin
            move_sprite(ALIEN_OAM_SPRITE,0,0);
            move_sprite(ALIEN_OAM_SPRITE+1,0,0);
        }
    }

}