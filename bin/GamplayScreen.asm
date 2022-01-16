;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module GamplayScreen
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UpdateGameplayScreen
	.globl _SetupGameplayScreen
	.globl _SetupLevel
	.globl _DrawBarricade
	.globl _IncreaseScore
	.globl _UpdateScore
	.globl _SetupBullets
	.globl _UpdateInvaders
	.globl _SetupInvaders
	.globl _SetupPlayer
	.globl _UpdatePlayer
	.globl _DrawNumber
	.globl _DrawText
	.globl _fill_bkg_rect
	.globl _set_bkg_tile_xy
	.globl _delay
	.globl _helper
	.globl _score
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_score::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_helper::
	.ds 5
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:15: void UpdateScore(){
;	---------------------------------
; Function UpdateScore
; ---------------------------------
_UpdateScore::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:17: DrawText(2,0,"SCORE");
	ld	de, #___str_0
	push	de
	ld	hl, #0x02
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:18: DrawNumber(8,0,score,5);
	ld	a, #0x05
	push	af
	inc	sp
	ld	hl, #_score
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #0x08
	push	hl
	call	_DrawNumber
	add	sp, #5
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:20: set_bkg_tile_xy(13,0,PLAYER_SPRITE_START);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:21: set_bkg_tile_xy(14,0,PLAYER_SPRITE_START+1);
	ld	a, #0x02
	push	af
	inc	sp
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:22: DrawText(15,0,"=");
	ld	de, #___str_1
	push	de
	ld	hl, #0x0f
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:23: DrawNumber(16,0,paddle.lives,2);
	ld	a, (#(_paddle + 3) + 0)
	ld	b, #0x00
	ld	h, #0x02
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	c, a
	push	bc
	ld	hl, #0x10
	push	hl
	call	_DrawNumber
	add	sp, #5
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:25: }
	ret
___str_0:
	.ascii "SCORE"
	.db 0x00
___str_1:
	.ascii "="
	.db 0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:27: void IncreaseScore(UINT8 amount){
;	---------------------------------
; Function IncreaseScore
; ---------------------------------
_IncreaseScore::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:29: score+=amount;
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_score
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:31: UpdateScore();
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:32: }
	jp	_UpdateScore
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:34: void DrawBarricade(UINT8 topLeftX, UINT8 topLeftY){
;	---------------------------------
; Function DrawBarricade
; ---------------------------------
_DrawBarricade::
	dec	sp
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:38: set_bkg_tile_xy(topLeftX,topLeftY,BARRICADE_TILES_START+tileRowSize);
	ld	a, #0x06
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:39: set_bkg_tile_xy(topLeftX+1,topLeftY,BARRICADE_TILES_START);
	ldhl	sp,	#4
	ld	b, (hl)
	ld	a, b
	inc	a
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, #0x03
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:40: set_bkg_tile_xy(topLeftX+2,topLeftY,BARRICADE_TILES_START);
	ld	c, b
	inc	c
	inc	c
	ld	a, #0x03
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:41: set_bkg_tile_xy(topLeftX+3,topLeftY,BARRICADE_TILES_START+tileRowSize*2);
	ld	a, #0x03
	add	a, a
	add	a, #0x03
	ld	e, a
	ld	a, b
	add	a, #0x03
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, e
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:43: set_bkg_tile_xy(topLeftX+0,topLeftY+1,BARRICADE_TILES_START);
	ldhl	sp,	#5
	ld	a, (hl-)
	ld	b, a
	ld	d, b
	inc	d
	push	de
	ld	a, #0x03
	push	af
	inc	sp
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	pop	de
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:44: set_bkg_tile_xy(topLeftX+1,topLeftY+1,BARRICADE_TILES_START);
	push	de
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	pop	de
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:45: set_bkg_tile_xy(topLeftX+2,topLeftY+1,BARRICADE_TILES_START);
	push	de
	ld	a, #0x03
	push	af
	inc	sp
	ld	e, c
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	pop	de
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:46: set_bkg_tile_xy(topLeftX+3,topLeftY+1,BARRICADE_TILES_START);
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:49: set_bkg_tile_xy(topLeftX+0,topLeftY+2,BARRICADE_TILES_START);
	inc	b
	inc	b
	ld	a, #0x03
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:50: set_bkg_tile_xy(topLeftX+1,topLeftY+2,BARRICADE_TILES_START+tileRowSize*3);
	ld	a, #0x03
	ld	e, a
	add	a, a
	add	a, e
	add	a, #0x03
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:51: set_bkg_tile_xy(topLeftX+2,topLeftY+2,BARRICADE_TILES_START+tileRowSize*4);
	ld	a, #0x03
	add	a, a
	add	a, a
	add	a, #0x03
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, c
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:52: set_bkg_tile_xy(topLeftX+3,topLeftY+2,BARRICADE_TILES_START);
	ld	a, #0x03
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:53: }
	add	sp, #5
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:55: void SetupLevel(){
;	---------------------------------
; Function SetupLevel
; ---------------------------------
_SetupLevel::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:56: for(UINT8 i=2;i<40;i++){
	ld	c, #0x02
00105$:
	ld	a, c
	sub	a, #0x28
	jr	NC, 00101$
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xa0
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:56: for(UINT8 i=2;i<40;i++){
	inc	c
	jr	00105$
00101$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:61: fill_bkg_rect(0,0,18,20,0);
	xor	a, a
	ld	h, a
	ld	l, #0x14
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:63: DrawBarricade(2,11);
	ld	hl, #0xb02
	push	hl
	call	_DrawBarricade
	pop	hl
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:64: DrawBarricade(8,11);
	ld	hl, #0xb08
	push	hl
	call	_DrawBarricade
	pop	hl
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:65: DrawBarricade(14,11);
	ld	hl, #0xb0e
	push	hl
	call	_DrawBarricade
	pop	hl
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:67: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:69: void SetupGameplayScreen(){
;	---------------------------------
; Function SetupGameplayScreen
; ---------------------------------
_SetupGameplayScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:72: score=0;
	xor	a, a
	ld	hl, #_score
	ld	(hl+), a
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:73: paddle.lives=3;
	ld	hl, #(_paddle + 3)
	ld	(hl), #0x03
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:75: SetupLevel();  
	call	_SetupLevel
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:76: SetupBullets();
	call	_SetupBullets
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:77: SetupInvaders();
	call	_SetupInvaders
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:78: SetupPlayer();
	call	_SetupPlayer
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:80: UpdateScore();
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:81: }
	jp	_UpdateScore
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:83: UINT8 UpdateGameplayScreen(){
;	---------------------------------
; Function UpdateGameplayScreen
; ---------------------------------
_UpdateGameplayScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:85: UpdateInvaders();     
	call	_UpdateInvaders
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:86: UpdateBullets();
	call	_UpdateBullets
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:87: UpdatePlayer();
	call	_UpdatePlayer
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:89: if (paddle.dead==1&&invadersRemaining>0){
	ld	a, (#(_paddle + 2) + 0)
	dec	a
	jr	NZ, 00106$
	ld	a, (#_invadersRemaining)
	or	a, a
	jr	Z, 00106$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:92: if(paddle.lives==0){
	ld	bc, #_paddle + 3
	ld	a, (bc)
	or	a, a
	jr	NZ, 00102$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:93: return GAMEOVERSCREEN;
	ld	e, #0x05
	ret
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:96: paddle.lives--;
	dec	a
	ld	(bc), a
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xa0
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xa0
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:100: delay(1000);
	ld	de, #0x03e8
	push	de
	call	_delay
	pop	hl
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:102: paddle.dead=0;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:103: paddle.x=80;
	ld	hl, #_paddle
	ld	(hl), #0x50
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:105: UpdateScore();
	call	_UpdateScore
	jr	00107$
00106$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:107: }else if(invadersRemaining==0){
	ld	a, (#_invadersRemaining)
	or	a, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:108: return NEXTLEVELSCREEN;
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:111: return GAMEPLAYSCREEN;
	ld	e, #0x04
	ret	Z
00107$:
	ld	e, #0x03
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:112: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__helper:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)
