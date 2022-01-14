#ifndef INVADERS_HEADER
#define INVADERS_HEADER set

typedef struct Invader{

    UINT8 column,row,active;
    INT8 slide;
} Invader;


void SetupInvaders();
void UpdateInvaders();
UINT8 GetInvaderForNode(UINT8 column, UINT8 row);

#endif