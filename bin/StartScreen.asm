;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module StartScreen
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UpdateStartScreen
	.globl _SetupStartScreen
	.globl _DrawNumber
	.globl _DrawText
	.globl _fill_bkg_rect
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _showText
	.globl _blinkCounter
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_blinkCounter::
	.ds 1
_showText::
	.ds 1
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:9: void SetupStartScreen(){
;	---------------------------------
; Function SetupStartScreen
; ---------------------------------
_SetupStartScreen::
	add	sp, #-111
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:11: blinkCounter=0;
	ld	hl, #_blinkCounter
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:12: showText=0;
	ld	hl, #_showText
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:14: spaceInvadersFontCurrentStart=SPACEINVADERSFONT_TILES_START2;
	ld	hl, #_spaceInvadersFontCurrentStart
	ld	(hl), #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:15: set_bkg_data(SPACEINVADERSFONT_TILES_START2,SpaceInvadersFont_TILE_COUNT,SpaceInvadersFont_tiles);
	ld	de, #_SpaceInvadersFont_tiles
	push	de
	ld	hl, #0x2b01
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:16: set_bkg_data(SPACEINVADERSTITLE_TILES_START,SpaceInvadersTitle_TILE_COUNT,SpaceInvadersTitle_tiles);
	ld	de, #_SpaceInvadersTitle_tiles
	push	de
	ld	hl, #0x5727
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:20: for(UINT8 i=0;i<108;i++){
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ldhl	sp,	#110
	ld	(hl), #0x00
00104$:
	ldhl	sp,	#110
	ld	a, (hl)
	sub	a, #0x6c
	jr	NC, 00101$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:21: helper[i]=SpaceInvadersTitle_map[i]+SPACEINVADERSTITLE_TILES_START;
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#110
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#109
	ld	(hl+), a
	ld	de, #_SpaceInvadersTitle_map
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #0x27
	ldhl	sp,	#108
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:20: for(UINT8 i=0;i<108;i++){
	ldhl	sp,	#110
	inc	(hl)
	jr	00104$
00101$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:24: set_bkg_tiles(2,3,18,6,helper);
	push	bc
	ld	hl, #0x612
	push	hl
	ld	hl, #0x302
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;C:/gbdk/include/gb/gb.h:1009: SCX_REG=x, SCY_REG=y;
	ld	a, #0x07
	ldh	(_SCX_REG + 0), a
	ld	a, #0x90
	ldh	(_SCY_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:26: move_bkg(7,144);
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:27: }
	add	sp, #111
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:28: UINT8 UpdateStartScreen(){
;	---------------------------------
; Function UpdateStartScreen
; ---------------------------------
_UpdateStartScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:30: blinkCounter++;
	ld	hl, #_blinkCounter
	inc	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:33: if(SCY_REG>0){
	ld	hl, #_SCY_REG
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
;C:/gbdk/include/gb/gb.h:1023: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCY_REG + 0)
	inc	a
	ldh	(_SCY_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:37: if(SCY_REG==0){
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:39: blinkCounter=30;
	ld	hl, #_blinkCounter
	ld	(hl), #0x1e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:41: DrawText(4,1,"HI-SCORE");
	ld	de, #___str_0
	push	de
	ld	hl, #0x104
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:42: DrawNumber(13,1,highScore,5);
	ld	hl, #_highScore
	ld	c, (hl)
	ld	b, #0x00
	ld	a, #0x05
	push	af
	inc	sp
	push	bc
	ld	hl, #0x10d
	push	hl
	call	_DrawNumber
	add	sp, #5
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:43: DrawText(7,14,"LAROLDS");
	ld	de, #___str_1
	push	de
	ld	hl, #0xe07
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:44: DrawText(2,16,"JUBILANT JUNKYARD");
	ld	de, #___str_2
	push	de
	ld	hl, #0x1002
	push	hl
	call	_DrawText
	add	sp, #4
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:48: if(SCY_REG==0){
	ld	a, (#_SCY_REG)
	or	a, a
	jr	NZ, 00119$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:49: if(blinkCounter==30){
	ld	a, (#_blinkCounter)
	sub	a, #0x1e
	jr	NZ, 00109$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:50: if(showText==1)showText=0;
	ld	a, (#_showText)
	dec	a
	jr	NZ, 00106$
	ld	hl, #_showText
	ld	(hl), #0x00
	jr	00107$
00106$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:51: else showText=1;
	ld	hl, #_showText
	ld	(hl), #0x01
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:52: blinkCounter=0;
	ld	hl, #_blinkCounter
	ld	(hl), #0x00
00109$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:54: if(showText==0){
	ld	a, (#_showText)
	or	a, a
	jr	NZ, 00111$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:55: fill_bkg_rect(3,11,16,1,0);
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	hl, #0x100b
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
	jr	00112$
00111$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:58: DrawText(3,11,"PUSH ANY BUTTON");
	ld	de, #___str_3
	push	de
	ld	hl, #0xb03
	push	hl
	call	_DrawText
	add	sp, #4
00112$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:60: if((joypadCurrent & J_A)||(joypadCurrent & J_B)||(joypadCurrent & J_START)||(joypadCurrent & J_SELECT))return MENUSCREEN;
	ld	a, (#_joypadCurrent)
	bit	4, a
	jr	NZ, 00113$
	bit	5, a
	jr	NZ, 00113$
	bit	7, a
	jr	NZ, 00113$
	bit	6, a
	jr	Z, 00119$
00113$:
	ld	e, #0x02
	ret
00119$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:63: return STARTSCREEN;
	ld	e, #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\StartScreen.c:65: }
	ret
___str_0:
	.ascii "HI-SCORE"
	.db 0x00
___str_1:
	.ascii "LAROLDS"
	.db 0x00
___str_2:
	.ascii "JUBILANT JUNKYARD"
	.db 0x00
___str_3:
	.ascii "PUSH ANY BUTTON"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
