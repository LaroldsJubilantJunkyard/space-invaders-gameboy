#include <gb/gb.h>
#include "common.h"

void DrawNumber(UINT8 x,UINT8 y, UINT16 number,UINT8 digits){

    if(digits>=5)set_bkg_tile_xy(x++,y,(number/10000)%10+SPACEINVADERSFONT_TILES_START+26);
    if(digits>=4)set_bkg_tile_xy(x++,y,(number/1000)%10+SPACEINVADERSFONT_TILES_START+26);
    if(digits>=3)set_bkg_tile_xy(x++,y,(number/100)%10+SPACEINVADERSFONT_TILES_START+26);
    if(digits>=2)set_bkg_tile_xy(x++,y,(number/10)%10+SPACEINVADERSFONT_TILES_START+26);
    set_bkg_tile_xy(x,y,number%10+SPACEINVADERSFONT_TILES_START+26);
}

void DrawText(UINT8 x, UINT8 y, unsigned char *text){

    UINT8 i=0;

    while(text[i]!='\0'){

        if(text[i]>='A'&&text[i]<='Z')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+(text[i]-'A'));
        if(text[i]>='a'&&text[i]<='z')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+(text[i]-'a'));
        if(text[i]>='0'&&text[i]<='9')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+26+(text[i]-'0'));
        if(text[i]=='.')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+36);
        if(text[i]=='-')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+37);
        if(text[i]=='=')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+38);
        if(text[i]=='*')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+39);
        if(text[i]=='?')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+40);
        if(text[i]=='!')set_bkg_tile_xy(x+i,y,SPACEINVADERSFONT_TILES_START+41);
        if(text[i]==' ')set_bkg_tile_xy(x+i,y,0);

        i++;
    }
}