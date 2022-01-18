#ifndef PLAYER_HEADER
#define PLAYER_HEADER set

#include <gb/gb.h>

typedef struct Paddle{

    uint8_t x,y,dead,lives,damageTimer;
} Paddle;


extern Paddle paddle;

void DamagePlayer(uint8_t amount);
void UpdatePlayer();
void SetupPlayer();

#endif