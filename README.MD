# Space Invaders Clone for Gameboy

In this repository you'll find a space invaders clone. All assets are included, even the used aseprite files (although those are not directly used). A tutorial will be published at LaroldsJubilantJunkyard.com soon.

## Game Elements

### The Invaders
In a modern game engine, managing the invaders would be easy. However with the nintendo gameboy, the difficulty with the invaders was their number. There are 40 invaders on the screen initially. The gameboy can only have 40 sprites total. Thus invader's must be managed using background tiles. If we used all 40 sprites, there would be none left for bullets, the alien, or the player. 

Each invader (invader1, invader2, invader3) has 17 tiles. These tiles make up an animation of the invader sliding to the left and right. For each invader, we draw on it's current tile, and the tile next to it. One tile will show the invader sliding off, the other tile will show the invader sliding on. When he invader slides 8 pixels in a given direction, we'll reset it's slide amoun to 0 and jump to that column.

### Bullets
The player can only have one bullet at a time. For enemies, there can only be a maximum of 5 bullets on screen at a time. These are manually set limiations. With these limitations, we assign the player bullet sprite 2, and enemy bullets the next after. When updating bullets, we can move up or down based on their sprite number. Also based on their sprite number we check if they hit the player or an enemy. Bullets are considered "in use" if their tile is not 0.

### Barricades
Barricades are a part of the background. Bullets will check what background tile they are over. If that tile is a barricade tile, it will increase it's number by one. The barricade tiles come from Barricade.png. Each row deines a different tile, and has 3 columns. Each column defines a different destructive state. Column 0 is untouched, column 1 is barely damaged, and column 2 is heavily damaged. Whenver we increment a tile and it goes to the next tile type or object in VRAM, we instead set it to 0. Which means it is destroyed.

Maybe in the future, the ability for more player bullets will be added.

## The Graphics & Build System
Different from my Flappy Bird clone, this game uses png2asset to dynamically generate .c and .h files for the graphics. The 'generate-graphics.bat' script handles that, and is called by the make.bat. This allows for a more seamless integration. Direct conversion of .aseprite files to .png files may be added.

Png2asset generates constants which are used to populate VRAM. These constants are used in macros defined in common.h. These macros are then plugged into the setup functions for the menuscreen and startscreen game states. The purpose of this is to allow dynamic editing, like extending or trimming, without having to adjust values. With this system, a 8 frame animation can become a 4 or 16 frame animation without having to change a thing.