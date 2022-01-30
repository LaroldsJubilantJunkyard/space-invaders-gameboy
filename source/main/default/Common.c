#include <gb/gb.h>

uint16_t highScore=0,score=0;
uint8_t level=1,joypadCurrent,joypadPrevious,invadersRemaining;
int8_t slideDir=-1;


void ClearAllSprites(){
    
    for(uint8_t i=0;i<40;i++){
        set_sprite_tile(i,0);
        move_sprite(i,0,0);
    }
}

uint8_t RandomNumber(uint8_t min, uint8_t max){

    // Use some sprites in getting a random value
    uint8_t v = DIV_REG+shadow_OAM[0].x+shadow_OAM[2].x+shadow_OAM[3].x;
    
    return min+(v % (max-min));    // get value at memory address
}
