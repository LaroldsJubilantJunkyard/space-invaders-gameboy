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
	.globl _IncreaseScore
	.globl _UpdateScore
	.globl _SetupLevel
	.globl _SetupBullets
	.globl _UpdateInvaders
	.globl _SetupInvaders
	.globl _SetupPlayer
	.globl _UpdatePlayer
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
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
;source/default/main.c:16: void SetupLevel(){
;	---------------------------------
; Function SetupLevel
; ---------------------------------
_SetupLevel::
;source/default/main.c:17: for(UINT8 i=2;i<40;i++){
	ld	c, #0x02
00107$:
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
;source/default/main.c:17: for(UINT8 i=2;i<40;i++){
	inc	c
	jr	00107$
00101$:
;source/default/main.c:24: for(UINT8 j=0;j<18;j++){
	ld	c, #0x00
00113$:
	ld	a, c
	sub	a, #0x12
	jr	NC, 00103$
;source/default/main.c:25: for(UINT8 i=0;i<20;i++){
	ld	b, #0x00
00110$:
	ld	a, b
	sub	a, #0x14
	jr	NC, 00114$
;source/default/main.c:26: helper[0]=0;
	ld	de, #_helper+0
	xor	a, a
	ld	(de), a
;source/default/main.c:27: set_bkg_tiles(i,j,1,1,helper);    
	push	de
	ld	hl, #0x101
	push	hl
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;source/default/main.c:25: for(UINT8 i=0;i<20;i++){
	inc	b
	jr	00110$
00114$:
;source/default/main.c:24: for(UINT8 j=0;j<18;j++){
	inc	c
	jr	00113$
00103$:
;source/default/main.c:32: set_bkg_tiles(2,11,5,4,BarricadeMap);
	ld	bc, #_BarricadeMap+0
	push	bc
	ld	hl, #0x405
	push	hl
	ld	hl, #0xb02
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;source/default/main.c:33: set_bkg_tiles(8,11,5,4,BarricadeMap);
	push	bc
	ld	hl, #0x405
	push	hl
	ld	hl, #0xb08
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;source/default/main.c:34: set_bkg_tiles(14,11,5,4,BarricadeMap);
	push	bc
	ld	hl, #0x405
	push	hl
	ld	hl, #0xb0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;source/default/main.c:35: }
	ret
;source/default/main.c:37: void UpdateScore(){
;	---------------------------------
; Function UpdateScore
; ---------------------------------
_UpdateScore::
;source/default/main.c:39: helper[0]=(score/10000)%10+47;
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
;source/default/main.c:40: helper[1]=(score/1000)%10+47;
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
;source/default/main.c:41: helper[2]=(score/100)%10+47;
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
;source/default/main.c:42: helper[3]=(score/10)%10+47;
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
;source/default/main.c:43: helper[4]=score%10+47;
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
;source/default/main.c:45: set_win_tiles(0,0,5,1,helper);
	ld	de, #_helper
	push	de
	ld	hl, #0x105
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;source/default/main.c:47: helper[0]=1;
	ld	hl, #_helper
	ld	(hl), #0x01
;source/default/main.c:48: helper[1]=2;
	ld	hl, #(_helper + 1)
	ld	(hl), #0x02
;source/default/main.c:49: helper[2]=57;
	ld	hl, #(_helper + 2)
	ld	(hl), #0x39
;source/default/main.c:50: helper[3]=(paddle.lives/10)%10+47;
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
;source/default/main.c:51: helper[4]=paddle.lives%10+47;
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
;source/default/main.c:52: set_win_tiles(14,0,5,1,helper);
	ld	de, #_helper
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_win_tiles
	add	sp, #6
;source/default/main.c:53: }
	ret
;source/default/main.c:55: void IncreaseScore(UINT8 amount){
;	---------------------------------
; Function IncreaseScore
; ---------------------------------
_IncreaseScore::
;source/default/main.c:57: score+=amount;
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
;source/default/main.c:59: UpdateScore();
;source/default/main.c:60: }
	jp	_UpdateScore
;source/default/main.c:63: void main(void){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;source/default/main.c:65: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;source/default/main.c:66: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;source/default/main.c:67: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;source/default/main.c:68: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;source/default/main.c:69: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;C:/gbdk/include/gb/gb.h:1195: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;source/default/main.c:73: set_bkg_data(0,58,SpaceInvadersTiles);
	ld	bc, #_SpaceInvadersTiles+0
	push	bc
	ld	hl, #0x3a00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;source/default/main.c:74: set_sprite_data(0,58,SpaceInvadersTiles);
	push	bc
	ld	hl, #0x3a00
	push	hl
	call	_set_sprite_data
	add	sp, #4
;source/default/main.c:76: GameplayStart:
00101$:
;source/default/main.c:78: score=0;
	xor	a, a
	ld	hl, #_score
	ld	(hl+), a
	ld	(hl), a
;source/default/main.c:79: paddle.lives=3;
	ld	hl, #(_paddle + 3)
	ld	(hl), #0x03
;source/default/main.c:81: SetupLevel();  
	call	_SetupLevel
;source/default/main.c:82: SetupBullets();
	call	_SetupBullets
;source/default/main.c:83: SetupInvaders();
	call	_SetupInvaders
;source/default/main.c:85: LifeStart:
00102$:
;source/default/main.c:87: SetupPlayer();
	call	_SetupPlayer
;source/default/main.c:88: UpdateScore();
	call	_UpdateScore
;source/default/main.c:90: while (paddle.dead==0&&invadersRemaining>0)
00104$:
	ld	a, (#(_paddle + 2) + 0)
	or	a, a
	jr	NZ, 00106$
	ld	a, (#_invadersRemaining)
	or	a, a
	jr	Z, 00106$
;source/default/main.c:93: UpdateInvaders();     
	call	_UpdateInvaders
;source/default/main.c:94: UpdateBullets();
	call	_UpdateBullets
;source/default/main.c:95: UpdatePlayer();
	call	_UpdatePlayer
;source/default/main.c:97: wait_vbl_done();
	call	_wait_vbl_done
	jr	00104$
00106$:
;source/default/main.c:101: if(invadersRemaining==0||paddle.lives==0){
	ld	a, (#_invadersRemaining)
	or	a, a
	jr	Z, 00101$
	ld	a, (#(_paddle + 3) + 0)
	or	a, a
	jr	Z, 00101$
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
;source/default/main.c:107: delay(200);
	ld	de, #0x00c8
	push	de
	call	_delay
	pop	hl
;source/default/main.c:108: paddle.lives--;
	ld	a, (#(_paddle + 3) + 0)
	dec	a
	ld	(#(_paddle + 3)),a
;source/default/main.c:109: goto LifeStart;
;source/default/main.c:112: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
__xinit__helper:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)
