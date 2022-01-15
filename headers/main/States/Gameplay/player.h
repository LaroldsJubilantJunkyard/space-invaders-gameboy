#ifndef PLAYER_HEADER
#define PLAYER_HEADER set

#include <gb/gb.h>

typedef struct Paddle{

    UINT8 x,y,dead,lives;
} Paddle;


extern Paddle paddle;

void UpdatePlayer();
void SetupPlayer();

#endif