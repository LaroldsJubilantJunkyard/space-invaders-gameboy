#ifndef INVADERS_HEADER
#define INVADERS_HEADER set

typedef struct Invader{

    UINT8 column,row,active,originalTile;
    INT8 slide;
} Invader;

extern Invader invaders[];

void SetupInvaders();
void UpdateInvaders();
UINT8 GetInvaderForNode(UINT8 column, UINT8 row);

#endif