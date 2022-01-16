#include <gb/gb.h>
#include "common.h"

void DrawNumber(UINT8 x,UINT8 y, UINT16 number,UINT8 digits){

    if(digits>=5)set_bkg_tile_xy(x++,y,(number/10000)%10+spaceInvadersFontCurrentStart+26);
    if(digits>=4)set_bkg_tile_xy(x++,y,(number/1000)%10+spaceInvadersFontCurrentStart+26);
    if(digits>=3)set_bkg_tile_xy(x++,y,(number/100)%10+spaceInvadersFontCurrentStart+26);
    if(digits>=2)set_bkg_tile_xy(x++,y,(number/10)%10+spaceInvadersFontCurrentStart+26);
    set_bkg_tile_xy(x,y,number%10+spaceInvadersFontCurrentStart+26);
}

void DrawText(UINT8 x, UINT8 y, unsigned char *text){

    UINT8 i=0;

    while(text[i]!='\0'){

        if(text[i]>='A'&&text[i]<='Z')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+(text[i]-'A'));
        if(text[i]>='a'&&text[i]<='z')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+(text[i]-'a'));
        if(text[i]>='0'&&text[i]<='9')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+26+(text[i]-'0'));
        if(text[i]=='.')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+36);
        if(text[i]=='-')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+37);
        if(text[i]=='=')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+38);
        if(text[i]=='*')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+39);
        if(text[i]=='?')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+40);
        if(text[i]=='!')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+41);
        if(text[i]==' ')set_bkg_tile_xy(x+i,y,0);

        i++;
    }
}