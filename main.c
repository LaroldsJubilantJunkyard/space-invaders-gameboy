#include <gb/gb.h>
#include "PlaceholderBlackBlock.h"
#include "BarricadeMap.h"
#include "SpaceInvadersTiles.h"

#define BULLET 0x04
#define TOP_ONLY 0x02
#define BOTTOM_ONLY 0x01
#define DEAD 0x00

#define FULL 0
#define RIGHT_HALF_ON_LEFT_EDGE 1
#define LEFT_HALF_ON_RIGHT_EDGE 2
#define RIGHT_QUARTER_ON_LEFT_EDGE 3
#define LEFT_3QUARTERS_ON_RIGHT_EDGE 4
#define LEFT_QUARTER_ON_RIGHT_EDGE 5
#define RIGHT_3QUARTERS_ON_LEFT_EDGE 6
#define EMPTY 7

const unsigned char Player[] ={0x01,0x02};

const UINT8 baseMap[3][3] = {
    {18,25,21},
    {26,33,29},
    {34,31,37},
};

typedef struct Bullet{

    UINT8 active;
    UINT8 x;
    UINT8 y;
} Bullet;


typedef struct SpaceInvader{

    UINT8 frame,state;
    UINT8 x,y;
} SpaceInvader;


SpaceInvader spaceInvaders[40];
Bullet bullets[3];

UINT8 slideDir;
UINT16 slideTile=0;

INT8 xd,yd;
UINT8 currentRow=0;
UINT8 slideSpeed=1;
UINT8 most=0;
UINT8 slideX;
UINT8 enemiesUpdated;
UINT8 slideY;
UINT8 playerX;
UINT8 joypadCurrent,joypadPrevious;


unsigned char twentyRow[] = {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};


UINT8 invaders[5][8] = {
    {1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1}
};

UINT8 rowSlide[5]={

    0,0,0,0,0
};

void main(void){

    DISPLAY_ON;
    SHOW_SPRITES;
    SHOW_BKG;
    SPRITES_8x16;

    slideX=16;
    slideY=0;
    slideDir=1;
    slideSpeed=1;

    set_bkg_data(0,47,SpaceInvadersTiles);
    set_sprite_data(0,47,SpaceInvadersTiles);


    for(UINT8 i=0;i<3;i++){

        bullets[i].x=0;
        bullets[i].y=0;
        bullets[i].active=0;
        set_sprite_tile(25+i,1);
    }

    set_sprite_tile(0,1);
    set_sprite_tile(1,2);

    playerX=80;
    currentRow=0;

    MainLoop:

    // Clear all tiles above the slide y
    for(UINT8 i=0;i<20;i++){
        for(UINT8 j=0;j<slideY;j++){
            const unsigned char zero[] = {0x00};
            set_bkg_tiles(i,j,1,1,zero);            
        }
    }

    // Set the empty state for each of the actual rows
    for(UINT8 i=0;i<20;i++){
        for(UINT8 j=0;j<5;j++){
            set_bkg_tiles(i,slideY+j,1,1,&baseMap[0][1]);            
        }
    }

    // Place the invaders
    // TODO handle removed invaders
    for(UINT8 j=0;j<5;j++){
        for(UINT8 i=0;i<8;i++){
            set_bkg_tiles(slideX/8+i*2,slideY+j,1,1,&baseMap[0][2]);    
        }
    }

    while(1){

        slideX+=slideDir;

        if(slideX==33)break;
        if(slideX==0)break;

        if(slideX%8<=2){

            for(UINT8 i=0;i<8;i++){
                set_bkg_tiles(slideX/8+i*2,slideY+currentRow,1,1,&baseMap[0][2]);    
                set_bkg_tiles(slideX/8+i*2+1,slideY+currentRow,1,1,&baseMap[0][1]);  
            }

        }else if(slideX%8<=4){

            for(UINT8 i=0;i<8;i++){
                unsigned char threeQurters[]={baseMap[0][2]-slideDir};
                unsigned char oneQuarter[]={baseMap[0][2]+slideDir*3};
                set_bkg_tiles(slideX/8+i*2,slideY+currentRow,1,1,threeQurters);    
                set_bkg_tiles(slideX/8+i*2+1,slideY+currentRow,1,1,oneQuarter);  
            }

        }else if(slideX%8<=6){

            for(UINT8 i=0;i<8;i++){
                unsigned char half1[]={baseMap[0][2]-slideDir*2};
                unsigned char half2[]={baseMap[0][2]+slideDir*2};
                set_bkg_tiles(slideX/8+i*2,slideY+currentRow,1,1,half1);    
                set_bkg_tiles(slideX/8+i*2+1,slideY+currentRow,1,1,half2);  
            }

        }else if(slideX%8<=8){

            for(UINT8 i=0;i<8;i++){
                unsigned char threeQurters[]={baseMap[0][2]-slideDir};
                unsigned char oneQuarter[]={baseMap[0][2]+slideDir*3};
                set_bkg_tiles(slideX/8+i*2,slideY+currentRow,1,1,oneQuarter);    
                set_bkg_tiles(slideX/8+i*2+1,slideY+currentRow,1,1,threeQurters);  
            }


        }


        delay(40);
        

    }

    slideDir=slideDir==1?255:1;
    slideY++;

    goto MainLoop;

    while(1){

        enemiesUpdated=0;

        joypadPrevious=joypadCurrent;
        joypadCurrent=joypad();

        // The slideY increase by 8 each row
        // Every 3 rows we move faster
        for(UINT8 i=0;i<slideY/24+1;i++){
            slideX+=slideDir;
        }

        if(slideX>=96||slideX<=8){
            slideDir=-slideDir;
            slideY+=8;
        }

        
        for(UINT8 i=0;i<3;i++){

            if(bullets[i].active==0)continue;


            bullets[i].y-=4;

            if(bullets[i].y>160){

                bullets[i].active=0;
                move_sprite(25+i,0,0);
            }else{
                move_sprite(25+i,bullets[i].x+4,bullets[i].y+8);


                for(UINT8 j=0;j<24;j++){

                    if(spaceInvaders[j].state & BOTTOM_ONLY){

                        xd=(spaceInvaders[j].x+slideX)-(bullets[i].x);
                        yd=(spaceInvaders[j].y+slideY-4)-(bullets[i].y+4);

                        if(xd<=2&&xd>=-2 &&yd<=2&&yd>=-2){
                            
                            move_sprite(25+i,0,0);
                            move_sprite(j,0,0);

                            bullets[i].active=0;
                            spaceInvaders[j].state=spaceInvaders[j].state & TOP_ONLY;

                            break;

                        }else if(enemiesUpdated==0){

                            
                            move_sprite(j,spaceInvaders[j].x+slideX+4,spaceInvaders[j].y+slideY+8);

                        }
                        
                    }
                    

                    if(spaceInvaders[j].state & TOP_ONLY){

                        xd=(spaceInvaders[j].x+slideX)-(bullets[i].x);
                        yd=(spaceInvaders[j].y+slideY+4)-(bullets[i].y);

                        if(xd<=2&&xd>=-2 &&yd<=2&&yd>=-2){
                            
                            move_sprite(25+i,0,0);
                            move_sprite(j,0,0);

                            bullets[i].active=0;
                            spaceInvaders[j].state=spaceInvaders[j].state & BOTTOM_ONLY;

                        }else if(enemiesUpdated==0){

                            
                            move_sprite(j,spaceInvaders[j].x+slideX+4,spaceInvaders[j].y+slideY+8);

                        }
                        
                    }

                }

                enemiesUpdated=1;

            }

        }


        if(enemiesUpdated==0){
            for(UINT8 i=0;i<24;i++){

                if((spaceInvaders[i].state & BOTTOM_ONLY ) || (spaceInvaders[i].state & TOP_ONLY)){
                    move_sprite(i,spaceInvaders[i].x+slideX+4,spaceInvaders[i].y+slideY+8);
                }
                else move_sprite(i,0,0);
            }
        }
        if(joypadCurrent & J_LEFT){
            playerX-=3;
        }else if(joypadCurrent & J_RIGHT){
            playerX+=3;
        } 

        if((joypadCurrent & J_A)&&!(joypadPrevious & J_A)){
            
            for(UINT8 i=0;i<40;i++){

                if(bullets[i].active==1)continue;

                bullets[i].active=1;
                bullets[i].x=playerX;
                bullets[i].y=136;
                break;


            }
        } 
        move_win(playerX+11,144);

        for(UINT8 i=0;i<2;i++){
            wait_vbl_done();
        }

    }
}