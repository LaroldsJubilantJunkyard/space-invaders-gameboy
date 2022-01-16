#include <gb/gb.h>
#include "Common.h"
#include "Hud.h"
#include "Graphics/SpaceInvadersTitle.h"
#include "Graphics/SpaceInvadersFont.h"

UINT8 blinkCounter,showText;

void SetupStartScreen(){

    blinkCounter=0;
    showText=0;

    spaceInvadersFontCurrentStart=SPACEINVADERSFONT_TILES_START2;
    set_bkg_data(SPACEINVADERSFONT_TILES_START2,SpaceInvadersFont_TILE_COUNT,SpaceInvadersFont_tiles);
    set_bkg_data(SPACEINVADERSTITLE_TILES_START,SpaceInvadersTitle_TILE_COUNT,SpaceInvadersTitle_tiles);

    unsigned char helper[108];

    for(UINT8 i=0;i<108;i++){
        helper[i]=SpaceInvadersTitle_map[i]+SPACEINVADERSTITLE_TILES_START;
    }

    set_bkg_tiles(2,3,18,6,helper);

    move_bkg(7,144);
}
UINT8 UpdateStartScreen(){

    blinkCounter++;
    

    if(SCY_REG>0){

        scroll_bkg(0,1);

        if(SCY_REG==0){

            blinkCounter=30;
            
            DrawText(4,1,"HI-SCORE");
            DrawNumber(13,1,highScore,5);
            DrawText(7,14,"LAROLDS");
            DrawText(2,16,"JUBILANT JUNKYARD");
        }
    }

    if(SCY_REG==0){
        if(blinkCounter==30){
            if(showText==1)showText=0;
            else showText=1;
            blinkCounter=0;
        }
         if(showText==0){
            fill_bkg_rect(3,11,16,1,0);
        }else {
            
            DrawText(3,11,"PUSH ANY BUTTON");
        }
        if((joypadCurrent & J_A)||(joypadCurrent & J_B)||(joypadCurrent & J_START)||(joypadCurrent & J_SELECT))return MENUSCREEN;
    }
    
    return STARTSCREEN;
    
}