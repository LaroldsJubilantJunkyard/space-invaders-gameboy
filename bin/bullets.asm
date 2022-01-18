;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module bullets
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _InvaderCheckBulletCollision
	.globl _UpdateInvaderTiles
	.globl _IncreaseScore
	.globl _get_bkg_tile_xy
	.globl _set_bkg_tile_xy
	.globl _SetupBullets
	.globl _GetAvailableBulletSprite
	.globl _UpdateBullets
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:12: void SetupBullets(){
;	---------------------------------
; Function SetupBullets
; ---------------------------------
_SetupBullets::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:17: for(INT8 i=2;i<8;i++)shadow_OAM[i].tile=0;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:18: }
	jr	00103$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:21: uint8_t GetAvailableBulletSprite(){
;	---------------------------------
; Function GetAvailableBulletSprite
; ---------------------------------
_GetAvailableBulletSprite::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:24: for(INT8 i=3;i<8;i++){
	ld	bc, #0x303
00105$:
	ld	a, b
	xor	a, #0x80
	sub	a, #0x88
	jr	NC, 00103$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:27: if(shadow_OAM[i].tile==0)return i;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:24: for(INT8 i=3;i<8;i++){
	inc	b
	ld	c, b
	jr	00105$
00103$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:32: return 0;
	ld	e, #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:33: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:39: uint8_t InvaderCheckBulletCollision(uint8_t i){
;	---------------------------------
; Function InvaderCheckBulletCollision
; ---------------------------------
_InvaderCheckBulletCollision::
	add	sp, #-4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:41: if(PlayerBulletSprite.tile!=0&&invaders[i].active){
	ld	a, (#(_shadow_OAM + 10) + 0)
	or	a, a
	jp	Z, 00109$
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_invaders
	add	hl,bc
	inc	sp
	inc	sp
	ld	c, l
	ld	b, h
	push	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	or	a, a
	jr	Z, 00109$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:43: INT8 xd = (PlayerBulletSprite.x-4)-(invaders[i].column*8+4+invaders[i].slide);
	ld	a, (#(_shadow_OAM + 9) + 0)
	add	a, #0xfc
	ldhl	sp,	#2
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x04
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#3
	add	a, (hl)
	dec	hl
	ld	e, a
	ld	a, (hl)
	sub	a, e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:44: INT8 yd = (PlayerBulletSprite.y-12)-invaders[i].row*8+4;
	ld	(hl+), a
	pop	de
	push	de
	inc	de
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	ld	e, a
	ld	a, #0xf8
	sub	a, e
	ld	(hl), a
	ld	a, (#(_shadow_OAM + 8) + 0)
	add	a, (hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:47: if(xd<0)xd=-xd;
	ld	(hl-), a
	bit	7, (hl)
	jr	Z, 00102$
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:48: if(yd<0)yd=-yd;
	ldhl	sp,	#3
	bit	7, (hl)
	jr	Z, 00104$
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:50: if(xd<5&&yd<8){
	ldhl	sp,	#2
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x85
	jr	NC, 00109$
	inc	hl
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x88
	jr	NC, 00109$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:52: IncreaseScore(10);
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	call	_IncreaseScore
	inc	sp
	pop	bc
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:54: invadersRemaining--;
	ld	hl, #_invadersRemaining
	dec	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:57: invaders[i].active=0;
	xor	a, a
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:60: PlayerBulletSprite.tile=0;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:63: UpdateInvaderTiles(i);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_UpdateInvaderTiles
	inc	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:65: return 1;
	ld	e, #0x01
	jr	00111$
00109$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:70: return 0;
	ld	e, #0x00
00111$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:71: }
	add	sp, #4
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:73: void UpdateBullets(){
;	---------------------------------
; Function UpdateBullets
; ---------------------------------
_UpdateBullets::
	add	sp, #-8
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:78: for(uint8_t i=2;i<8;i++){
	ldhl	sp,	#7
	ld	(hl), #0x02
00147$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x08
	jp	NC, 00148$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:82: if(shadow_OAM[i].tile!=0){
	ld	a, (hl)
	ld	c, #0x00
	add	a, a
	rl	c
	add	a, a
	rl	c
	ldhl	sp,	#1
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
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00141$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:84: shadow_OAM[i].tile++;
	ld	de, #_shadow_OAM
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:88: if(shadow_OAM[i].tile==ALIEN_SPRITE_START)shadow_OAM[i].tile=BULLETC_SPRITE_START;
	ld	de, #_shadow_OAM
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x0a
	jr	NZ, 00102$
	ld	de, #_shadow_OAM
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	a, #0x09
	ld	(bc), a
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:89: if(shadow_OAM[i].tile==BULLETC_SPRITE_START)shadow_OAM[i].tile=BULLETB_SPRITE_START;
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, #0x02
00277$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00277$
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	a, (bc)
	sub	a, #0x09
	jr	NZ, 00106$
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	a, #0x08
	ld	(bc), a
	jr	00107$
00106$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:90: else if(shadow_OAM[i].tile==BULLETB_SPRITE_START)shadow_OAM[i].tile=BULLETA_SPRITE_START;
	pop	de
	push	de
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, (bc)
	sub	a, #0x08
	jr	NZ, 00107$
	ld	bc, #_shadow_OAM+0
	pop	hl
	push	hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x03
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:94: if(i==2)shadow_OAM[i].y-=2;
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00109$
	ld	bc, #_shadow_OAM+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	dec	a
	dec	a
	ld	(bc), a
	jr	00110$
00109$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:95: else shadow_OAM[i].y+=2;
	ld	bc, #_shadow_OAM+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	de, #_shadow_OAM+0
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #0x02
	ld	(bc), a
00110$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:98: if(shadow_OAM[i].y>176||shadow_OAM[i].y>250)shadow_OAM[i].tile=0;
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
	jr	C, 00135$
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
	jr	NC, 00136$
00135$:
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
	jp	00141$
00136$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:103: uint8_t currentColumn = (shadow_OAM[i].x-4)/8;
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
	jr	Z, 00150$
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
00150$:
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:104: uint8_t currentRow = (shadow_OAM[i].y-12)/8;
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
	jr	Z, 00151$
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
00151$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#3
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:105: uint8_t currentTile=get_bkg_tile_xy(currentColumn,currentRow);
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_get_bkg_tile_xy
	pop	hl
	ldhl	sp,	#6
	ld	(hl), e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:110: if(currentTile>=BARRICADE_TILES_START&&currentTile<=BARRICADE_LAST_TILE){
	ld	a, (hl)
	sub	a, #0x60
	jr	C, 00120$
	ld	a, #0x6e
	sub	a, (hl)
	jr	C, 00120$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:113: uint8_t newTile=currentTile+1;
	ld	a, (hl-)
	dec	hl
	inc	a
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:119: if(newTile%3==0)newTile=0;
	ld	a, (hl+)
	ld	(hl+), a
	ld	de, #0x0003
	ld	a, d
	ld	(hl-), a
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__modsint
	add	sp, #4
	ldhl	sp,	#5
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#6
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00112$
	dec	hl
	ld	(hl), #0x00
00112$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:120: set_bkg_tile_xy(currentColumn,currentRow,newTile);
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:123: shadow_OAM[i].tile=0;
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
	jr	00121$
00120$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:124: }else if(currentTile>=INVADER1_TILES_START&&currentTile<=INVADER3_TILES_START+Invader3_TILE_COUNT){
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00121$
	ld	a, #0x35
	sub	a, (hl)
	jr	C, 00121$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:127: for(uint8_t j=0;j<40;j++){
	ld	b, #0x00
00144$:
	ld	a, b
	sub	a, #0x28
	jr	NC, 00121$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:129: if(InvaderCheckBulletCollision(j)){
	push	bc
	push	bc
	inc	sp
	call	_InvaderCheckBulletCollision
	inc	sp
	ld	a, e
	pop	bc
	or	a, a
	jr	NZ, 00121$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:127: for(uint8_t j=0;j<40;j++){
	inc	b
	jr	00144$
00121$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:140: if(i>2){
	ld	a, #0x02
	ldhl	sp,	#7
	sub	a, (hl)
	jp	NC, 00141$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:141: if(shadow_OAM[i].x-4<paddle.x-8)continue;
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
	jr	Z, 00284$
	bit	7, d
	jr	NZ, 00285$
	cp	a, a
	jr	00285$
00284$:
	bit	7, d
	jr	Z, 00285$
	scf
00285$:
	jp	C, 00141$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:142: if(shadow_OAM[i].x-4>paddle.x+8)continue;
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
	jr	NC, 00286$
	inc	b
00286$:
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00287$
	bit	7, d
	jr	NZ, 00288$
	cp	a, a
	jr	00288$
00287$:
	bit	7, d
	jr	Z, 00288$
	scf
00288$:
	jp	C, 00141$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:143: if(shadow_OAM[i].y-12<paddle.y-4)continue;
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
	jr	Z, 00289$
	bit	7, d
	jr	NZ, 00290$
	cp	a, a
	jr	00290$
00289$:
	bit	7, d
	jr	Z, 00290$
	scf
00290$:
	jr	C, 00141$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:144: if(shadow_OAM[i].y-12>paddle.y+4)continue;
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
	jr	Z, 00291$
	bit	7, d
	jr	NZ, 00292$
	cp	a, a
	jr	00292$
00291$:
	bit	7, d
	jr	Z, 00292$
	scf
00292$:
	jr	C, 00141$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:145: if(paddle.damageTimer>0)continue;
	ld	a, (#(_paddle + 4) + 0)
	or	a, a
	jr	NZ, 00141$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:146: shadow_OAM[i].tile=0;
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:147: paddle.dead=1;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x01
00141$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:78: for(uint8_t i=2;i<8;i++){
	ldhl	sp,	#7
	inc	(hl)
	jp	00147$
00148$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:154: }
	add	sp, #8
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
