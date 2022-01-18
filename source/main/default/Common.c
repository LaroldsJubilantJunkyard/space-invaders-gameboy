#include <gb/gb.h>

uint8_t level=1,highScore=0,joypadCurrent,joypadPrevious,spaceInvadersFontCurrentStart=0,invadersRemaining;
int8_t slideDir=-1;

uint8_t GetNextAvailableSprite(){
    
    for(uint8_t i=2;i<40;i++){
        if(get_sprite_tile(i)==0){
            return i;
        }
    }
    return 39;
}

void ClearAllSprites(){
    
    for(uint8_t i=0;i<40;i++){
        set_sprite_tile(i,0);
        move_sprite(i,0,0);
    }
}
void ClearBackground(){

    fill_bkg_rect(0,0,20,18,0);
}


uint8_t RandomNumber(uint8_t min, uint8_t max){

    // Use some sprites in getting a random value
    uint8_t v = DIV_REG+shadow_OAM[0].x+shadow_OAM[2].x+shadow_OAM[3].x;
    
    return min+(v % (max-min));    // get value at memory address
}
