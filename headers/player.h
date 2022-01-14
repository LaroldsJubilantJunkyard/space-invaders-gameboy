#ifndef PLAYER_HEADER
#define PLAYER_HEADER set

typedef struct Paddle{

    UINT8 x,y,dead,lives;
} Paddle;

void UpdatePlayer();
void SetupPlayer();

#endif