#ifndef INVADERS_HEADER
#define INVADERS_HEADER set

typedef struct Invader{

    uint8_t column,row,active,originalTile;
    INT8 slide;
} Invader;

extern Invader invaders[];

void SetupInvaders();
void UpdateInvaders();
uint8_t GetInvaderForNode(uint8_t column, uint8_t row);

#endif