#ifndef PLAYER_HEADER
#define PLAYER_HEADER set

#include <gb/gb.h>

typedef struct Player{

    uint8_t x,y,dead,lives,damageTimer;
} Player;


extern Player player;

void DamagePlayer(uint8_t amount);
void UpdatePlayer();
void SetupPlayer();

#endif