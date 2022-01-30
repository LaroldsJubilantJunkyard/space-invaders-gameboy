#include <gb/gb.h>
#include "common.h"
#include <stdlib.h>
#include <string.h>

void DrawText(uint8_t x, uint8_t y, unsigned char *text){

    uint8_t i=0;

    // The VRAM address of the first character
    // After setting a tile, we'll increase the VRAM address each iteration to move to the next tile
    uint8_t *vramAddr= get_bkg_xy_addr(x,y);

    while(text[i]!='\0'){

        // Map our alphabet characters to only use uppercase letters
        // From the SpaceInvadersFont.png/aseprite
        if(text[i]>='A'&&text[i]<='Z')set_vram_byte(vramAddr++,SPACEINVADERSFONT_TILES_START+(text[i]-'A'));
        else if(text[i]>='a'&&text[i]<='z')set_vram_byte(vramAddr++,SPACEINVADERSFONT_TILES_START+(text[i]-'a'));
        else if(text[i]>='0'&&text[i]<='9')set_vram_byte(vramAddr++,SPACEINVADERSFONT_TILES_START+26+(text[i]-'0'));

        else {

            // Map our special characters manually
            // From the SpaceInvadersFont.png/aseprite
            switch(text[i]){
                case '.': set_vram_byte(vramAddr++,SPACEINVADERSFONT_TILES_START+36); break;
                case '-': set_vram_byte(vramAddr++,SPACEINVADERSFONT_TILES_START+37); break;
                case '=': set_vram_byte(vramAddr++,SPACEINVADERSFONT_TILES_START+38);break;
                case '*': set_vram_byte(vramAddr++,SPACEINVADERSFONT_TILES_START+39);break;
                case '?': set_vram_byte(vramAddr++,SPACEINVADERSFONT_TILES_START+40);break;
                case '!': set_vram_byte(vramAddr++,SPACEINVADERSFONT_TILES_START+41);break;
                case ' ': set_vram_byte(vramAddr++,0); break;
            }
        }

        i++;
    }
}

void DrawNumber(uint8_t x,uint8_t y, uint16_t number,uint8_t digits){

    unsigned char buffer[8]="00000000";

    // Convert the number to a decimal string (stored in the buffer char array)
    uitoa(number, buffer, 10);

    // The background address of the first digit
    uint8_t *vramAddr= get_bkg_xy_addr(x,y);

    // Get the length of the number so we can add leading zeroes
    uint8_t len =strlen(buffer);

    // Add some leading zeroes
    // uitoa will not do this for us
    // Increase the VRAM address each iteration to move to the next tile
    for(uint8_t i=0;i<digits-len;i++)        
        set_vram_byte(vramAddr++,SPACEINVADERSFONT_TILES_START+26);
        
    // Draw our number
    // Increase the VRAM address each iteration to move to the next tile
    for(uint8_t i=0;i<len;i++)        
        set_vram_byte(vramAddr++,(buffer[i]-'0')+SPACEINVADERSFONT_TILES_START+26);
}