#include <gb/gb.h>
#include "common.h"

void DrawNumber(uint8_t x,uint8_t y, uint16_t number,uint8_t digits){

    if(digits>=5)set_bkg_tile_xy(x++,y,(number/10000)%10+SPACEINVADERSFONT_TILES_START+26);
    if(digits>=4)set_bkg_tile_xy(x++,y,(number/1000)%10+SPACEINVADERSFONT_TILES_START+26);
    if(digits>=3)set_bkg_tile_xy(x++,y,(number/100)%10+SPACEINVADERSFONT_TILES_START+26);
    if(digits>=2)set_bkg_tile_xy(x++,y,(number/10)%10+SPACEINVADERSFONT_TILES_START+26);
    set_bkg_tile_xy(x,y,number%10+SPACEINVADERSFONT_TILES_START+26);
}

void DrawText(uint8_t x, uint8_t y, unsigned char *text){

    uint8_t i=0;

    while(text[i]!='\0'){

        // Map our alphabet characters to only use uppercase letters
        // From the SpaceInvadersFont.png/aseprite
        if(text[i]>='A'&&text[i]<='Z')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+(text[i]-'A'));
        else if(text[i]>='a'&&text[i]<='z')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+(text[i]-'a'));
        else if(text[i]>='0'&&text[i]<='9')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+26+(text[i]-'0'));

        // Map our special characters manually
        // From the SpaceInvadersFont.png/aseprite
        else if(text[i]=='.')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+36);
        else if(text[i]=='-')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+37);
        else if(text[i]=='=')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+38);
        else if(text[i]=='*')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+39);
        else if(text[i]=='?')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+40);
        else if(text[i]=='!')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+41);
        else if(text[i]==' ')set_bkg_tile_xy(x+i,y,0);

        i++;
    }
}