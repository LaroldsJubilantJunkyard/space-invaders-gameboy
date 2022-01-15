#include <gb/gb.h>


UINT8 level=1,highScore=0,joypadCurrent,joypadPrevious,slideDir;


UINT8 GetNextAvailableSprite(){
    
    for(UINT8 i=2;i<40;i++){
        if(get_sprite_tile(i)==0){
            return i;
        }
    }
    return 39;
}

void DrawNumber(UINT8 x,UINT8 y, UINT16 number,UINT8 digits){

    if(digits>=5)set_win_tiles(x++,y,5,1,(number/10000)%10+47);
    if(digits>=4)set_win_tiles(x++,y,5,1,(number/1000)%10+47);
    if(digits>=3)set_win_tiles(x++,y,5,1,(number/100)%10+47);
    if(digits>=2)set_win_tiles(x++,y,5,1,(number/10)%10+47);
    set_win_tiles(x,y,5,1,number%10+47);
}

UINT8 RandomNumber(UINT8 min, UINT8 max){

    // The value at this register changes rapidly
    const unsigned char *ptr_div_reg = 0xFF04; 

    // Use the first 5 sprites in getting a random value
    UINT8 v = (*(ptr_div_reg))+shadow_OAM[0].x+shadow_OAM[1].x+shadow_OAM[2].x+shadow_OAM[3].x+shadow_OAM[4].x;
    
    return min+(v % (max-min));    // get value at memory address
}
