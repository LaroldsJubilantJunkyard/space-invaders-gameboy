;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module bullets
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _OldUpdateBullets
	.globl _UpdateBullets
	.globl _RemoveBullet
	.globl _GetNextAvailableSprite
	.globl _IncreaseScore
	.globl _GetInvaderForNode
	.globl _get_bkg_tile_xy
	.globl _set_bkg_tile_xy
	.globl _get_bkg_tiles
	.globl _set_bkg_tiles
	.globl _bulletCounter
	.globl _bulletsOnScreen
	.globl _bullets
	.globl _SetupBullets
	.globl _GetAvailableBulletSprite
	.globl _SpawnBullet
	.globl _ReSortBullets
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bullets::
	.ds 10
_bulletsOnScreen::
	.ds 1
_bulletCounter::
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:16: void SetupBullets(){
;	---------------------------------
; Function SetupBullets
; ---------------------------------
_SetupBullets::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:18: for(INT8 i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++)bullets[i]=0;
	ld	c, #0x00
00104$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC, 00101$
	ld	a, c
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #_bullets
	add	hl, de
	ld	(hl), #0x00
	inc	c
	jr	00104$
00101$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:19: for(INT8 i=2;i<8;i++)shadow_OAM[i].tile=0;
	ld	c, #0x02
00107$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x88
	jr	NC, 00102$
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
	jr	00107$
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:20: bulletCounter=0;
	ld	hl, #_bulletCounter
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:21: bulletsOnScreen=0;
	ld	hl, #_bulletsOnScreen
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:22: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:25: UINT8 GetAvailableBulletSprite(){
;	---------------------------------
; Function GetAvailableBulletSprite
; ---------------------------------
_GetAvailableBulletSprite::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:27: for(INT8 i=3;i<8;i++){
	ld	bc, #0x303
00105$:
	ld	a, b
	xor	a, #0x80
	sub	a, #0x88
	jr	NC, 00103$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:28: if(shadow_OAM[i].tile==0)return i;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:27: for(INT8 i=3;i<8;i++){
	inc	b
	ld	c, b
	jr	00105$
00103$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:30: return 0;
	ld	e, #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:31: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:33: void SpawnBullet(UINT8 x, UINT8 y,UINT8 isEnemy){
;	---------------------------------
; Function SpawnBullet
; ---------------------------------
_SpawnBullet::
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:35: UINT8 i =GetNextAvailableSprite();
	call	_GetNextAvailableSprite
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	inc	hl
	ld	(hl), #0x2a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:38: move_sprite(i,x+4,y+12);
	ldhl	sp,	#4
	ld	a, (hl-)
	add	a, #0x0c
	ld	d, a
	ld	a, (hl)
	add	a, #0x04
	ldhl	sp,	#0
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:42: if(isEnemy)bullets[bulletsOnScreen]=-i;
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
	ld	bc, #_bullets+0
	ld	a, c
	ld	hl, #_bulletsOnScreen
	add	a, (hl)
	ld	c, a
	jr	NC, 00113$
	inc	b
00113$:
	xor	a, a
	sub	a, e
	ld	(bc), a
	jr	00103$
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:43: else bullets[bulletsOnScreen]=i;
	ld	a, #<(_bullets)
	ld	hl, #_bulletsOnScreen
	add	a, (hl)
	ld	c, a
	ld	a, #>(_bullets)
	adc	a, #0x00
	ld	b, a
	ld	a, e
	ld	(bc), a
00103$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:46: bulletsOnScreen++;
	ld	hl, #_bulletsOnScreen
	inc	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:48: }
	inc	sp
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:50: void ReSortBullets(){ 
;	---------------------------------
; Function ReSortBullets
; ---------------------------------
_ReSortBullets::
	add	sp, #-12
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:56: for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	ldhl	sp,	#0
	ld	a, l
	ld	d, h
	ldhl	sp,	#10
	ld	(hl+), a
	ld	(hl), d
	ld	e, #0x00
00106$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:57: sorted[i]=bullets[i];
	push	de
	ld	d, #0x00
	ldhl	sp,	#12
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	hl, #_bullets
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:56: for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	inc	e
	ld	a, e
	sub	a, #0x0a
	jr	C, 00106$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:61: for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	ld	bc, #0x0
00108$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:62: if(sorted[i]!=0)bullets[count++]=sorted[i];
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	or	a, a
	jr	Z, 00109$
	ld	a, #<(_bullets)
	add	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_bullets)
	adc	a, #0x00
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	c
	ld	(hl), e
00109$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:61: for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	inc	b
	ld	a, b
	sub	a, #0x0a
	jr	C, 00108$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:66: for( i=count;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	ld	b, c
	ld	a, #0x0a
	sub	a, b
	ld	e, a
00112$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:67: bullets[count++]=0;
	ld	hl, #_bullets
	ld	b, #0x00
	add	hl, bc
	inc	c
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:66: for( i=count;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	dec	e
	jr	NZ, 00112$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:69: }
	add	sp, #12
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:71: void RemoveBullet(UINT8 j){
;	---------------------------------
; Function RemoveBullet
; ---------------------------------
_RemoveBullet::
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:72: bulletsOnScreen--;
	ld	hl, #_bulletsOnScreen
	dec	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:73: INT8 sprite = bullets[j];
	ld	bc, #_bullets+0
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:74: if(sprite<0)sprite=-sprite;
	ld	a, (hl)
	bit	7, a
	jr	Z, 00102$
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:75: move_sprite(sprite,160,160);
	ldhl	sp,	#0
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xa0
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:76: set_sprite_tile(sprite,0);
	ldhl	sp,	#0
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:77: bullets[j]=0;
	xor	a, a
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:79: ReSortBullets();
	inc	sp
	jp	_ReSortBullets
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:80: }
	inc	sp
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:82: void UpdateBullets(){
;	---------------------------------
; Function UpdateBullets
; ---------------------------------
_UpdateBullets::
	add	sp, #-8
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:84: for(UINT8 i=2;i<8;i++){
	ldhl	sp,	#7
	ld	(hl), #0x02
00140$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x08
	jp	NC, 00141$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:85: if(shadow_OAM[i].tile!=0){
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
	jp	Z, 00137$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:89: if(i==2)shadow_OAM[i].y-=4;
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00102$
	ld	bc, #_shadow_OAM+0
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	de, #_shadow_OAM
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #0xfc
	ld	(bc), a
	jr	00103$
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:90: else shadow_OAM[i].y+=4;
	ld	bc, #_shadow_OAM+0
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	de, #_shadow_OAM+0
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #0x04
	ld	(bc), a
00103$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:93: if(shadow_OAM[i].y>176||shadow_OAM[i].y>250)shadow_OAM[i].tile=0;
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
	jr	C, 00131$
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
	jr	NC, 00132$
00131$:
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
	jp	00137$
00132$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:98: UINT8 c = (shadow_OAM[i].x-4)/8;
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
	jr	Z, 00143$
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
00143$:
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:99: UINT8 r = (shadow_OAM[i].y-12)/8;
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
	jr	Z, 00144$
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
00144$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#6
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:100: UINT8 crTile=get_bkg_tile_xy(c,r);
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_get_bkg_tile_xy
	pop	hl
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:102: if(crTile>=3&&crTile<=17){
	ld	a, e
	sub	a, #0x03
	jr	C, 00119$
	ld	a, #0x11
	sub	a, e
	jr	C, 00119$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:104: UINT8 newTile=crTile+1;
	ld	a, e
	inc	a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:105: if(newTile==5)newTile=0;
	cp	a, #0x05
	jr	NZ, 00116$
	xor	a, a
	jr	00117$
00116$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:106: else if(newTile==8)newTile=0;
	cp	a, #0x08
	jr	NZ, 00113$
	xor	a, a
	jr	00117$
00113$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:107: else if(newTile==11)newTile=0;
	cp	a, #0x0b
	jr	NZ, 00110$
	xor	a, a
	jr	00117$
00110$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:108: else if(newTile==14)newTile=0;
	cp	a, #0x0e
	jr	NZ, 00107$
	xor	a, a
	jr	00117$
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:109: else if(newTile==17)newTile=0;
	cp	a, #0x11
	jr	NZ, 00117$
	xor	a, a
00117$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:110: set_bkg_tile_xy(c,r,newTile);
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:111: shadow_OAM[i].tile=0;
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
00119$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:115: if(i>2){
	ld	a, #0x02
	ldhl	sp,	#7
	sub	a, (hl)
	jp	NC, 00137$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:116: if(shadow_OAM[i].x-4<paddle.x-8)continue;
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
	jr	Z, 00255$
	bit	7, d
	jr	NZ, 00256$
	cp	a, a
	jr	00256$
00255$:
	bit	7, d
	jr	Z, 00256$
	scf
00256$:
	jp	C, 00137$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:117: if(shadow_OAM[i].x-4>paddle.x+8)continue;
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
	jr	NC, 00257$
	inc	b
00257$:
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00258$
	bit	7, d
	jr	NZ, 00259$
	cp	a, a
	jr	00259$
00258$:
	bit	7, d
	jr	Z, 00259$
	scf
00259$:
	jp	C, 00137$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:118: if(shadow_OAM[i].y-12<paddle.y-4)continue;
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
	jr	Z, 00260$
	bit	7, d
	jr	NZ, 00261$
	cp	a, a
	jr	00261$
00260$:
	bit	7, d
	jr	Z, 00261$
	scf
00261$:
	jr	C, 00137$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:119: if(shadow_OAM[i].y-12>paddle.y+4)continue;
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
	jr	C, 00137$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:120: shadow_OAM[i].tile=0;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:121: paddle.dead=1;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x01
00137$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:84: for(UINT8 i=2;i<8;i++){
	ldhl	sp,	#7
	inc	(hl)
	jp	00140$
00141$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:128: }
	add	sp, #8
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:131: void OldUpdateBullets(){
;	---------------------------------
; Function OldUpdateBullets
; ---------------------------------
_OldUpdateBullets::
	add	sp, #-9
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:135: for(UINT8 j=0;j<MAX_NUMBER_OF_BULLETS_ON_SCREEN;j++){
	ldhl	sp,	#6
	ld	(hl), #0x00
00151$:
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x0a
	jp	NC, 00152$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:137: if(bullets[j]==0)continue;
	ld	de, #_bullets
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:142: if(bullets[j]<0)scroll_sprite(sprite,0,4);
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:137: if(bullets[j]==0)continue;
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:139: INT8 sprite = bullets[j];
	ld	c,a
	or	a,a
	jp	Z,00146$
	ldhl	sp,	#8
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:140: if(sprite<0)sprite=-sprite;
	bit	7, (hl)
	jr	Z, 00104$
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:142: if(bullets[j]<0)scroll_sprite(sprite,0,4);
	bit	7, c
	jr	Z, 00106$
	ldhl	sp,	#8
;C:/gbdk/include/gb/gb.h:1415: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1416: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	add	a, #0x04
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:142: if(bullets[j]<0)scroll_sprite(sprite,0,4);
	jr	00107$
00106$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:143: else scroll_sprite(sprite,0,-4);
	ldhl	sp,	#8
;C:/gbdk/include/gb/gb.h:1415: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1416: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	add	a, #0xfc
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:143: else scroll_sprite(sprite,0,-4);
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:145: bx = shadow_OAM[sprite].x-4;
	ldhl	sp,	#8
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	ld	a, (hl)
	add	a, #0xfc
	ld	b, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:146: by = shadow_OAM[sprite].y-12;
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	a, (hl)
	add	a, #0xf4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:150: if(by<8||by>176){
	ld	c, a
	sub	a, #0x08
	jr	C, 00108$
	ld	a, #0xb0
	sub	a, c
	jr	NC, 00109$
00108$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:152: RemoveBullet(j);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_RemoveBullet
	inc	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:154: continue;
	jp	00146$
00109$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:157: if(bullets[j]<0){
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:159: INT16 xd = paddle.x-bx;
	ldhl	sp,	#2
	ld	a, b
	ld	(hl+), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:160: INT16 yd = paddle.y-by;
	xor	a, a
	ld	(hl+), a
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:157: if(bullets[j]<0){
	ldhl	sp,	#8
	bit	7, (hl)
	jp	Z, 00119$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:159: INT16 xd = paddle.x-bx;
	ld	a, (#_paddle + 0)
	ld	b, #0x00
	ld	e, a
	ld	d, b
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	c, e
	ldhl	sp,	#7
	ld	(hl), c
	inc	hl
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:160: INT16 yd = paddle.y-by;
	ld	a, (#(_paddle + 1) + 0)
	ld	b, #0x00
	ld	e, a
	ld	d, b
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	c, e
	ld	b, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:162: if(xd<0)xd=-xd;
	ldhl	sp,	#8
	bit	7, (hl)
	jr	Z, 00112$
	ld	de, #0x0000
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	(hl), e
00112$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:163: if(yd<0)yd=-yd;
	bit	7, b
	jr	Z, 00114$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
00114$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:165: if(xd<8&&yd<6){
	ldhl	sp,	#7
	ld	a, (hl+)
	sub	a, #0x08
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00283$
	bit	7, d
	jr	NZ, 00284$
	cp	a, a
	jr	00284$
00283$:
	bit	7, d
	jr	Z, 00284$
	scf
00284$:
	jr	NC, 00119$
	ld	a, c
	sub	a, #0x06
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00119$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:167: RemoveBullet(j);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_RemoveBullet
	inc	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:169: paddle.dead=1;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:171: continue;
	jp	00146$
00119$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:175: UINT8 bulletColumn = bx/8;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00154$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
00154$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:176: UINT8 bulletRow=by/8;
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#5
	bit	7, (hl)
	jr	Z, 00155$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
00155$:
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl-)
	ld	e, a
	sra	e
	rr	b
	sra	e
	rr	b
	sra	e
	rr	b
	ld	(hl), b
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:179: get_bkg_tiles(bulletColumn,bulletRow,1,1,helper);
	ld	de, #_helper+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	de
	push	hl
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#13
	ld	b, (hl)
	push	bc
	call	_get_bkg_tiles
	add	sp, #6
	pop	de
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:181: if(helper[0]>=3&&helper[0]<=17){
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00143$
	ld	a, #0x11
	sub	a, (hl)
	jr	C, 00143$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:183: helper[0]=helper[0]+1;
	ld	a, (hl)
	inc	a
	ld	(de), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:181: if(helper[0]>=3&&helper[0]<=17){
	ld	a, (de)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:184: if(helper[0]==5)helper[0]=0;
	cp	a, #0x05
	jr	NZ, 00132$
	xor	a, a
	ld	(de), a
	jr	00133$
00132$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:185: else if(helper[0]==8)helper[0]=0;
	cp	a, #0x08
	jr	NZ, 00129$
	xor	a, a
	ld	(de), a
	jr	00133$
00129$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:186: else if(helper[0]==11)helper[0]=0;
	cp	a, #0x0b
	jr	NZ, 00126$
	xor	a, a
	ld	(de), a
	jr	00133$
00126$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:187: else if(helper[0]==14)helper[0]=0;
	cp	a, #0x0e
	jr	NZ, 00123$
	xor	a, a
	ld	(de), a
	jr	00133$
00123$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:188: else if(helper[0]==17)helper[0]=0;
	sub	a, #0x11
	jr	NZ, 00133$
	xor	a, a
	ld	(de), a
00133$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:191: set_bkg_tiles(bulletColumn,bulletRow,1,1,helper);
	push	de
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#11
	ld	b, (hl)
	push	bc
	call	_set_bkg_tiles
	add	sp, #6
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:193: RemoveBullet(j);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_RemoveBullet
	inc	sp
	jp	00146$
00143$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:196: } else if(helper[0]>=19&&helper[0]<=23&&bullets[j]>0){
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x13
	jp	C, 00146$
	ld	a, #0x17
	sub	a, (hl)
	jp	C, 00146$
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
	ld	e, b
	xor	a, a
	ld	d, a
	sub	a, b
	bit	7, e
	jr	Z, 00295$
	bit	7, d
	jr	NZ, 00296$
	cp	a, a
	jr	00296$
00295$:
	bit	7, d
	jr	Z, 00296$
	scf
00296$:
	jr	NC, 00146$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:198: UINT8 invader= GetInvaderForNode(bulletColumn,bulletRow);
	ldhl	sp,	#7
	ld	b, (hl)
	push	bc
	call	_GetInvaderForNode
	pop	hl
	ldhl	sp,	#8
	ld	(hl), e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:200: if(invader!=255){
	ld	a, (hl)
	inc	a
	jr	Z, 00137$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:202: if(invaders[invader].active==1){
	ldhl	sp,	#8
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_invaders
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	jr	NZ, 00137$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:205: IncreaseScore(10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_IncreaseScore
	inc	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:208: invaders[invader].active=0;
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00137$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:212: RemoveBullet(j);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_RemoveBullet
	inc	sp
00146$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:135: for(UINT8 j=0;j<MAX_NUMBER_OF_BULLETS_ON_SCREEN;j++){
	ldhl	sp,	#6
	inc	(hl)
	jp	00151$
00152$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\bullets.c:217: }
	add	sp, #9
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
