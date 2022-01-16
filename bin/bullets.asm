;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module bullets
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UpdateBullets
	.globl _get_bkg_tile_xy
	.globl _set_bkg_tile_xy
	.globl _SetupBullets
	.globl _GetAvailableBulletSprite
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:10: void SetupBullets(){
;	---------------------------------
; Function SetupBullets
; ---------------------------------
_SetupBullets::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:12: for(INT8 i=2;i<8;i++)shadow_OAM[i].tile=0;
	ld	c, #0x02
00103$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x88
	ret	NC
	ld	de, #_shadow_OAM+0
	ld	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x00
	inc	c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:13: }
	jr	00103$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:16: UINT8 GetAvailableBulletSprite(){
;	---------------------------------
; Function GetAvailableBulletSprite
; ---------------------------------
_GetAvailableBulletSprite::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:18: for(INT8 i=3;i<8;i++){
	ld	bc, #0x303
00105$:
	ld	a, b
	xor	a, #0x80
	sub	a, #0x88
	jr	NC, 00103$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:19: if(shadow_OAM[i].tile==0)return i;
	ld	de, #_shadow_OAM+0
	ld	a, b
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00106$
	ld	e, c
	ret
00106$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:18: for(INT8 i=3;i<8;i++){
	inc	b
	ld	c, b
	jr	00105$
00103$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:21: return 0;
	ld	e, #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:22: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:24: void UpdateBullets(){
;	---------------------------------
; Function UpdateBullets
; ---------------------------------
_UpdateBullets::
	add	sp, #-8
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:26: for(UINT8 i=2;i<8;i++){
	ldhl	sp,	#7
	ld	(hl), #0x02
00137$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x08
	jp	NC, 00138$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:30: if(shadow_OAM[i].tile!=0){
	ld	a, (hl-)
	dec	hl
	ld	c, #0x00
	add	a, a
	rl	c
	add	a, a
	rl	c
	ld	(hl+), a
	ld	(hl), c
	ld	de, #_shadow_OAM
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00134$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:32: shadow_OAM[i].tile++;
	ld	bc, #_shadow_OAM+0
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, (bc)
	inc	a
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:33: if(shadow_OAM[i].tile==ALIEN_SPRITE_START)shadow_OAM[i].tile=BULLETB_SPRITE_START;
	ld	bc, #_shadow_OAM+0
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, (bc)
	sub	a, #0x09
	jr	NZ, 00104$
	ld	bc, #_shadow_OAM+0
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x06
	jr	00105$
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:34: else if(shadow_OAM[i].tile==BULLETB_SPRITE_START)shadow_OAM[i].tile=BULLETA_SPRITE_START;
	ld	bc, #_shadow_OAM+0
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, (bc)
	sub	a, #0x06
	jr	NZ, 00105$
	ld	de, #_shadow_OAM
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x03
00105$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:38: if(i==2)shadow_OAM[i].y-=4;
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00107$
	ldhl	sp,	#7
	ld	e, (hl)
	ld	d, #0x00
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	a, (hl)
	add	a, #0xfc
	ld	(bc), a
	jr	00108$
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:39: else shadow_OAM[i].y+=4;
	ldhl	sp,	#7
	ld	e, (hl)
	ld	d, #0x00
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	a, (hl)
	add	a, #0x04
	ld	(bc), a
00108$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:42: if(shadow_OAM[i].y>176||shadow_OAM[i].y>250)shadow_OAM[i].tile=0;
	ldhl	sp,	#7
	ld	a, (hl)
	ld	c, #0x00
	add	a, a
	rl	c
	add	a, a
	rl	c
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), c
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	a, #0xb0
	sub	a, c
	jr	C, 00128$
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	a, #0xfa
	sub	a, c
	jr	NC, 00129$
00128$:
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	jp	00134$
00129$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:47: UINT8 c = (shadow_OAM[i].x-4)/8;
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#5
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00140$
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
00140$:
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#2
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:48: UINT8 r = (shadow_OAM[i].y-12)/8;
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#3
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00141$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xfffb
	add	hl, de
	ld	c, l
	ld	b, h
00141$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#6
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:49: UINT8 crTile=get_bkg_tile_xy(c,r);
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_get_bkg_tile_xy
	pop	hl
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:51: if(crTile>=3&&crTile<=17){
	ld	a, e
	sub	a, #0x03
	jr	C, 00116$
	ld	a, #0x11
	sub	a, e
	jr	C, 00116$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:53: UINT8 newTile=crTile+1;
	ld	a, e
	inc	a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:54: if(newTile==5||newTile==8||newTile==11||newTile==14||newTile==17)newTile=0;
	cp	a, #0x05
	jr	Z, 00109$
	cp	a, #0x08
	jr	Z, 00109$
	cp	a, #0x0b
	jr	Z, 00109$
	cp	a, #0x0e
	jr	Z, 00109$
	cp	a, #0x11
	jr	NZ, 00110$
00109$:
	xor	a, a
00110$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:55: set_bkg_tile_xy(c,r,newTile);
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:56: shadow_OAM[i].tile=0;
	ld	bc, #_shadow_OAM+0
	pop	hl
	push	hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
00116$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:60: if(i>2){
	ld	a, #0x02
	ldhl	sp,	#7
	sub	a, (hl)
	jp	NC, 00134$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:61: if(shadow_OAM[i].x-4<paddle.x-8)continue;
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ld	de, #0x0004
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#4
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_paddle + 0)
	ld	c, a
	ld	b, #0x00
	ld	de, #0x0008
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#3
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00259$
	bit	7, d
	jr	NZ, 00260$
	cp	a, a
	jr	00260$
00259$:
	bit	7, d
	jr	Z, 00260$
	scf
00260$:
	jp	C, 00134$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:62: if(shadow_OAM[i].x-4>paddle.x+8)continue;
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, #0x00
	add	a, #0xfc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	add	a, #0x08
	ld	c, a
	jr	NC, 00261$
	inc	b
00261$:
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00262$
	bit	7, d
	jr	NZ, 00263$
	cp	a, a
	jr	00263$
00262$:
	bit	7, d
	jr	Z, 00263$
	scf
00263$:
	jp	C, 00134$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:63: if(shadow_OAM[i].y-12<paddle.y-4)continue;
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ld	de, #0x000c
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#4
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#(_paddle + 1) + 0)
	ld	c, a
	ld	b, #0x00
	ld	de, #0x0004
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#3
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00264$
	bit	7, d
	jr	NZ, 00265$
	cp	a, a
	jr	00265$
00264$:
	bit	7, d
	jr	Z, 00265$
	scf
00265$:
	jr	C, 00134$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:64: if(shadow_OAM[i].y-12>paddle.y+4)continue;
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, #0x00
	add	a, #0xf4
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00266$
	bit	7, d
	jr	NZ, 00267$
	cp	a, a
	jr	00267$
00266$:
	bit	7, d
	jr	Z, 00267$
	scf
00267$:
	jr	C, 00134$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:65: shadow_OAM[i].tile=0;
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:66: paddle.dead=1;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x01
00134$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:26: for(UINT8 i=2;i<8;i++){
	ldhl	sp,	#7
	inc	(hl)
	jp	00137$
00138$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:73: }
	add	sp, #8
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
