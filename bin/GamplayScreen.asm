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
	.globl _IncreaseScore
	.globl _UpdateScore
	.globl _SetupBullets
	.globl _UpdateInvaders
	.globl _SetupInvaders
	.globl _SetupPlayer
	.globl _UpdatePlayer
	.globl _fill_bkg_rect
	.globl _set_win_tiles
	.globl _set_bkg_tiles
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:14: void UpdateScore(){
;	---------------------------------
; Function UpdateScore
; ---------------------------------
_UpdateScore::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:16: helper[0]=(score/10000)%10+47;
	ld	de, #0x2710
	push	de
	ld	hl, #_score
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	add	a, #0x2f
	ld	(#_helper),a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:17: helper[1]=(score/1000)%10+47;
	ld	de, #0x03e8
	push	de
	ld	hl, #_score
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	add	a, #0x2f
	ld	(#(_helper + 1)),a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:18: helper[2]=(score/100)%10+47;
	ld	de, #0x0064
	push	de
	ld	hl, #_score
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	add	a, #0x2f
	ld	(#(_helper + 2)),a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:19: helper[3]=(score/10)%10+47;
	ld	de, #0x000a
	push	de
	ld	hl, #_score
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	add	a, #0x2f
	ld	(#(_helper + 3)),a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:20: helper[4]=score%10+47;
	ld	de, #0x000a
	push	de
	ld	hl, #_score
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	add	a, #0x2f
	ld	(#(_helper + 4)),a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:22: set_win_tiles(0,0,5,1,helper);
	ld	de, #_helper
	push	de
	ld	hl, #0x105
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:24: helper[0]=1;
	ld	hl, #_helper
	ld	(hl), #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:25: helper[1]=2;
	ld	hl, #(_helper + 1)
	ld	(hl), #0x02
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:26: helper[2]=57;
	ld	hl, #(_helper + 2)
	ld	(hl), #0x39
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:27: helper[3]=(paddle.lives/10)%10+47;
	ld	a, (#(_paddle + 3) + 0)
	ld	b, #0x00
	ld	de, #0x000a
	push	de
	ld	c, a
	push	bc
	call	__divsint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__modsint
	add	sp, #4
	ld	a, e
	add	a, #0x2f
	ld	(#(_helper + 3)),a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:28: helper[4]=paddle.lives%10+47;
	ld	a, (#(_paddle + 3) + 0)
	ld	b, #0x00
	ld	de, #0x000a
	push	de
	ld	c, a
	push	bc
	call	__modsint
	add	sp, #4
	ld	a, e
	add	a, #0x2f
	ld	(#(_helper + 4)),a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:29: set_win_tiles(14,0,5,1,helper);
	ld	de, #_helper
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_win_tiles
	add	sp, #6
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:30: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:32: void IncreaseScore(UINT8 amount){
;	---------------------------------
; Function IncreaseScore
; ---------------------------------
_IncreaseScore::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:34: score+=amount;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:36: UpdateScore();
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:37: }
	jp	_UpdateScore
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:40: void SetupLevel(){
;	---------------------------------
; Function SetupLevel
; ---------------------------------
_SetupLevel::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:41: for(UINT8 i=2;i<40;i++){
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:41: for(UINT8 i=2;i<40;i++){
	inc	c
	jr	00105$
00101$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:46: fill_bkg_rect(0,0,18,20,0);
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:49: set_bkg_tiles(2,11,5,4,BarricadeMap);
	ld	bc, #_BarricadeMap+0
	push	bc
	ld	hl, #0x405
	push	hl
	ld	hl, #0xb02
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:50: set_bkg_tiles(8,11,5,4,BarricadeMap);
	push	bc
	ld	hl, #0x405
	push	hl
	ld	hl, #0xb08
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:51: set_bkg_tiles(14,11,5,4,BarricadeMap);
	push	bc
	ld	hl, #0x405
	push	hl
	ld	hl, #0xb0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:52: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:54: void SetupGameplayScreen(){
;	---------------------------------
; Function SetupGameplayScreen
; ---------------------------------
_SetupGameplayScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:57: score=0;
	xor	a, a
	ld	hl, #_score
	ld	(hl+), a
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:58: paddle.lives=3;
	ld	hl, #(_paddle + 3)
	ld	(hl), #0x03
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:60: SetupLevel();  
	call	_SetupLevel
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:61: SetupBullets();
	call	_SetupBullets
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:62: SetupInvaders();
	call	_SetupInvaders
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:63: SetupPlayer();
	call	_SetupPlayer
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:65: UpdateScore();
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:66: }
	jp	_UpdateScore
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:68: UINT8 UpdateGameplayScreen(){
;	---------------------------------
; Function UpdateGameplayScreen
; ---------------------------------
_UpdateGameplayScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:70: UpdateInvaders();     
	call	_UpdateInvaders
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:71: UpdateBullets();
	call	_UpdateBullets
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:72: UpdatePlayer();
	call	_UpdatePlayer
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:74: if (paddle.dead==1&&invadersRemaining>0){
	ld	a, (#(_paddle + 2) + 0)
	dec	a
	jr	NZ, 00106$
	ld	a, (#_invadersRemaining)
	or	a, a
	jr	Z, 00106$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:77: if(paddle.lives==0){
	ld	bc, #_paddle + 3
	ld	a, (bc)
	or	a, a
	jr	NZ, 00102$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:78: return GAMEOVERSCREEN;
	ld	e, #0x05
	ret
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:81: paddle.lives--;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:85: delay(1000);
	ld	de, #0x03e8
	push	de
	call	_delay
	pop	hl
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:87: paddle.dead=0;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:88: paddle.x=80;
	ld	hl, #_paddle
	ld	(hl), #0x50
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:90: UpdateScore();
	call	_UpdateScore
	jr	00107$
00106$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:92: }else if(invadersRemaining==0){
	ld	a, (#_invadersRemaining)
	or	a, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:93: return NEXTLEVELSCREEN;
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:96: return GAMEPLAYSCREEN;
	ld	e, #0x04
	ret	Z
00107$:
	ld	e, #0x03
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GamplayScreen.c:97: }
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
