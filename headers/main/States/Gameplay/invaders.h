#ifndef INVADERS_HEADER
#define INVADERS_HEADER set

typedef struct Invader{

    uint8_t column,row,active,originalTile,score;
    INT8 slide,slideAmount;
} Invader;

extern Invader invaders[];

void SetupInvaders();
void UpdateInvaders();

void ClearInvaderTiles(uint8_t i);
void UpdateInvaderTiles(uint8_t i);
uint8_t GetInvaderForNode(uint8_t column, uint8_t row);

#endif