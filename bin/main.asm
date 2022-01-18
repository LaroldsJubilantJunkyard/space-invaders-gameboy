;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _UpdateGameOverScreen
	.globl _SetupGameOverScreen
	.globl _UpdateNextLevelScreen
	.globl _SetupNextLevelScreen
	.globl _UpdateGameplayScreen
	.globl _SetupGameplayScreen
	.globl _UpdateMenuScreen
	.globl _SetupMenuScreen
	.globl _UpdateStartScreen
	.globl _SetupStartScreen
	.globl _GameFirstLoad
	.globl _ClearBackground
	.globl _ClearAllSprites
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _wait_vbl_done
	.globl _joypad
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:12: void main(void){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-14
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:16: NR52_REG = 0x80; // is 1000 0000 in binary and turns on sound
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:17: NR50_REG = 0x77; // sets the volume for both left and right channel just set to max 0x77
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:18: NR51_REG = 0xFF; // is 1111 1111 in binary, select which chanels we want to use in this case all of them. One bit for the L one bit for the R of all four channels
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:21: GameFirstLoad();
	call	_GameFirstLoad
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:23: uint8_t currentGameState = GAMEFIRSTLOAD;
	ldhl	sp,	#8
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:24: uint8_t nextGameState = STARTSCREEN;
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:26: while(1){
00134$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:28: joypadPrevious=joypadCurrent;
	ld	a, (#_joypadCurrent)
	ld	(#_joypadPrevious),a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:29: joypadCurrent=joypad();
	call	_joypad
	ld	hl, #_joypadCurrent
	ld	(hl), e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:31: if(nextGameState!=currentGameState){
	ldhl	sp,	#8
	ld	a, (hl+)
	sub	a, (hl)
	jp	Z,00118$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:35: for(uint16_t fade=0;fade<255;fade+=15){
	ld	bc, #0x0000
00137$:
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0xff
	ld	a, (hl)
	sbc	a, #0x00
	jp	NC, 00101$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:37: const palette_color_t blackAndWhite[4] = { RGB8(255, 255, 255), RGB8(fade, fade, fade),RGB8(fade, fade, fade),RGB8(fade, fade, fade)    };
	ldhl	sp,	#0
	ld	a, l
	ld	d, h
	ldhl	sp,	#12
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0x7f
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	or	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	or	a, b
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	add	a, a
	add	a, a
	ld	b, a
	xor	a, a
	or	a, l
	ld	c, a
	ld	a, b
	or	a, h
	ld	b, a
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:39: set_sprite_palette(0,1,blackAndWhite);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_palette
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:40: set_bkg_palette(0,1,blackAndWhite);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:42: wait_vbl_done();
	call	_wait_vbl_done
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:35: for(uint16_t fade=0;fade<255;fade+=15){
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	ld	c, l
	ld	b, h
	jp	00137$
00101$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:45: currentGameState=nextGameState;
	ldhl	sp,	#9
	ld	a, (hl-)
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:47: ClearBackground();
	call	_ClearBackground
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:48: ClearAllSprites();
	call	_ClearAllSprites
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:50: if(currentGameState==STARTSCREEN)SetupStartScreen();
	ldhl	sp,	#9
	ld	a, (hl)
	dec	a
	jr	NZ, 00114$
	call	_SetupStartScreen
	jr	00115$
00114$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:51: else if(currentGameState==MENUSCREEN)SetupMenuScreen();
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00111$
	call	_SetupMenuScreen
	jr	00115$
00111$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:52: else if(currentGameState==GAMEPLAYSCREEN)SetupGameplayScreen();
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00108$
	call	_SetupGameplayScreen
	jr	00115$
00108$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:53: else if(currentGameState==GAMEOVERSCREEN)SetupGameOverScreen();
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00105$
	call	_SetupGameOverScreen
	jr	00115$
00105$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:54: else if(currentGameState==NEXTLEVELSCREEN)SetupNextLevelScreen();
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00115$
	call	_SetupNextLevelScreen
00115$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:58: for(int16_t fade=250;fade>=0;fade-=15){
	ld	bc, #0x00fa
00140$:
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	bit	7, (hl)
	jp	NZ, 00118$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:60: const palette_color_t blackAndWhite[4] = { RGB8(255, 255, 255), RGB8(fade, fade, fade),RGB8(fade, fade, fade),RGB8(fade, fade, fade)    };
	ldhl	sp,	#0
	ld	a, l
	ld	d, h
	ldhl	sp,	#12
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0x7f
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	or	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	or	a, b
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	add	a, a
	add	a, a
	ld	b, a
	xor	a, a
	or	a, l
	ld	c, a
	ld	a, b
	or	a, h
	ld	b, a
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:62: set_sprite_palette(0,1,blackAndWhite);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_palette
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:63: set_bkg_palette(0,1,blackAndWhite);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:65: wait_vbl_done();
	call	_wait_vbl_done
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:58: for(int16_t fade=250;fade>=0;fade-=15){
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	c, e
	ld	b, a
	jp	00140$
00118$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:70: if(currentGameState==STARTSCREEN)nextGameState=UpdateStartScreen();
	ldhl	sp,	#8
	ld	a, (hl)
	dec	a
	jr	NZ, 00131$
	call	_UpdateStartScreen
	ldhl	sp,	#9
	ld	(hl), e
	jr	00132$
00131$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:71: else if(currentGameState==MENUSCREEN)nextGameState=UpdateMenuScreen();
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00128$
	call	_UpdateMenuScreen
	ldhl	sp,	#9
	ld	(hl), e
	jr	00132$
00128$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:72: else if(currentGameState==GAMEPLAYSCREEN)nextGameState=UpdateGameplayScreen();
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00125$
	call	_UpdateGameplayScreen
	ldhl	sp,	#9
	ld	(hl), e
	jr	00132$
00125$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:73: else if(currentGameState==GAMEOVERSCREEN)nextGameState=UpdateGameOverScreen();
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00122$
	call	_UpdateGameOverScreen
	ldhl	sp,	#9
	ld	(hl), e
	jr	00132$
00122$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:74: else if(currentGameState==NEXTLEVELSCREEN)nextGameState=UpdateNextLevelScreen();
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00132$
	call	_UpdateNextLevelScreen
	ldhl	sp,	#9
	ld	(hl), e
00132$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:77: wait_vbl_done();
	call	_wait_vbl_done
	jp	00134$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:81: }
	add	sp, #14
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
