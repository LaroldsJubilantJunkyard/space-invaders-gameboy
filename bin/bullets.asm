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
	.globl _RemoveBullet
	.globl _IncreaseScore
	.globl _GetInvaderForNode
	.globl _set_bkg_tile_xy
	.globl _get_bkg_tiles
	.globl _set_bkg_tiles
	.globl _bulletCounter
	.globl _bulletsOnScreen
	.globl _bullets
	.globl _SetupBullets
	.globl _SpawnEnemyBullet
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
;source/default/bullets.c:20: void SetupBullets(){
;	---------------------------------
; Function SetupBullets
; ---------------------------------
_SetupBullets::
;source/default/bullets.c:22: for(INT8 i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++)bullets[i]=0;
	ld	c, #0x00
00103$:
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
	jr	00103$
00101$:
;source/default/bullets.c:23: bulletCounter=0;
	ld	hl, #_bulletCounter
	ld	(hl), #0x00
;source/default/bullets.c:24: bulletsOnScreen=0;
	ld	hl, #_bulletsOnScreen
	ld	(hl), #0x00
;source/default/bullets.c:25: }
	ret
;source/default/bullets.c:27: void SpawnEnemyBullet(UINT8 x, UINT8 y){
;	---------------------------------
; Function SpawnEnemyBullet
; ---------------------------------
_SpawnEnemyBullet::
	dec	sp
;source/default/bullets.c:28: for(INT8 i=2;i<40;i++){
	ldhl	sp,	#0
	ld	(hl), #0x02
	ld	c, #0x02
00108$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0xa8
	jr	NC, 00110$
;source/default/bullets.c:29: if(get_sprite_tile(i)==0){
	ld	b, c
;C:/gbdk/include/gb/gb.h:1337: return shadow_OAM[nb].tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl)
;source/default/bullets.c:29: if(get_sprite_tile(i)==0){
	or	a, a
	jr	NZ, 00109$
;source/default/bullets.c:30: set_sprite_tile(i,42);
	ldhl	sp,	#0
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x2a
;source/default/bullets.c:31: move_sprite(i,x+4,y+12);
	ldhl	sp,	#4
	ld	a, (hl-)
	add	a, #0x0c
	ld	c, a
	ld	a, (hl)
	add	a, #0x04
	ld	e, a
	ldhl	sp,	#0
	ld	b, (hl)
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;source/default/bullets.c:32: bullets[bulletsOnScreen]=-i;
	ld	a, #<(_bullets)
	ld	hl, #_bulletsOnScreen
	add	a, (hl)
	ld	c, a
	ld	a, #>(_bullets)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ldhl	sp,	#0
	sub	a, (hl)
	ld	e, a
	ld	(bc), a
;source/default/bullets.c:33: bulletsOnScreen++;
	ld	hl, #_bulletsOnScreen
	inc	(hl)
;source/default/bullets.c:35: ReSortBullets();
	inc	sp
	jp	_ReSortBullets
;source/default/bullets.c:36: break;
	jr	00110$
00109$:
;source/default/bullets.c:28: for(INT8 i=2;i<40;i++){
	inc	c
	ldhl	sp,	#0
	ld	(hl), c
	jr	00108$
00110$:
;source/default/bullets.c:39: }
	inc	sp
	ret
;source/default/bullets.c:40: void SpawnBullet(UINT8 x, UINT8 y){
;	---------------------------------
; Function SpawnBullet
; ---------------------------------
_SpawnBullet::
	dec	sp
;source/default/bullets.c:41: for(INT8 i=2;i<40;i++){
	ldhl	sp,	#0
	ld	(hl), #0x02
	ld	c, #0x02
00108$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0xa8
	jr	NC, 00110$
;source/default/bullets.c:42: if(get_sprite_tile(i)==0){
	ld	b, c
;C:/gbdk/include/gb/gb.h:1337: return shadow_OAM[nb].tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl)
;source/default/bullets.c:42: if(get_sprite_tile(i)==0){
	or	a, a
	jr	NZ, 00109$
;source/default/bullets.c:43: set_sprite_tile(i,42);
	ldhl	sp,	#0
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x2a
;source/default/bullets.c:44: move_sprite(i,x+4,y+12);
	ldhl	sp,	#4
	ld	a, (hl-)
	add	a, #0x0c
	ld	c, a
	ld	a, (hl)
	add	a, #0x04
	ld	e, a
	ldhl	sp,	#0
	ld	b, (hl)
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;source/default/bullets.c:45: bullets[bulletsOnScreen]=i;
	ld	a, #<(_bullets)
	ld	hl, #_bulletsOnScreen
	add	a, (hl)
	ld	c, a
	ld	a, #>(_bullets)
	adc	a, #0x00
	ld	b, a
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;source/default/bullets.c:46: bulletsOnScreen++;
	ld	hl, #_bulletsOnScreen
	inc	(hl)
;source/default/bullets.c:48: ReSortBullets();
	inc	sp
	jp	_ReSortBullets
;source/default/bullets.c:49: break;
	jr	00110$
00109$:
;source/default/bullets.c:41: for(INT8 i=2;i<40;i++){
	inc	c
	ldhl	sp,	#0
	ld	(hl), c
	jr	00108$
00110$:
;source/default/bullets.c:52: }
	inc	sp
	ret
;source/default/bullets.c:54: void ReSortBullets(){
;	---------------------------------
; Function ReSortBullets
; ---------------------------------
_ReSortBullets::
	add	sp, #-12
;source/default/bullets.c:61: for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	ldhl	sp,	#0
	ld	a, l
	ld	d, h
	ldhl	sp,	#10
	ld	(hl+), a
	ld	(hl), d
	ld	e, #0x00
00106$:
;source/default/bullets.c:62: sorted[i]=bullets[i];
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
;source/default/bullets.c:61: for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	inc	e
	ld	a, e
	sub	a, #0x0a
	jr	C, 00106$
;source/default/bullets.c:66: for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	ld	bc, #0x0
00108$:
;source/default/bullets.c:67: if(sorted[i]!=0)bullets[count++]=sorted[i];
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
;source/default/bullets.c:66: for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	inc	b
	ld	a, b
	sub	a, #0x0a
	jr	C, 00108$
;source/default/bullets.c:71: for( i=count;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	ld	b, c
	ld	a, #0x0a
	sub	a, b
	ld	e, a
00112$:
;source/default/bullets.c:72: bullets[count++]=0;
	ld	hl, #_bullets
	ld	b, #0x00
	add	hl, bc
	inc	c
	ld	(hl), #0x00
;source/default/bullets.c:71: for( i=count;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
	dec	e
	jr	NZ, 00112$
;source/default/bullets.c:74: }
	add	sp, #12
	ret
;source/default/bullets.c:76: void RemoveBullet(UINT8 j){
;	---------------------------------
; Function RemoveBullet
; ---------------------------------
_RemoveBullet::
	dec	sp
;source/default/bullets.c:77: bulletsOnScreen--;
	ld	hl, #_bulletsOnScreen
	dec	(hl)
;source/default/bullets.c:78: INT8 sprite = bullets[j];
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
;source/default/bullets.c:79: if(sprite<0)sprite=-sprite;
	ld	a, (hl)
	bit	7, a
	jr	Z, 00102$
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00102$:
;source/default/bullets.c:80: move_sprite(sprite,160,160);
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
;source/default/bullets.c:81: set_sprite_tile(sprite,0);
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
;source/default/bullets.c:82: bullets[j]=0;
	xor	a, a
	ld	(bc), a
;source/default/bullets.c:84: ReSortBullets();
	inc	sp
	jp	_ReSortBullets
;source/default/bullets.c:85: }
	inc	sp
	ret
;source/default/bullets.c:87: void UpdateBullets(){
;	---------------------------------
; Function UpdateBullets
; ---------------------------------
_UpdateBullets::
	add	sp, #-16
;source/default/bullets.c:91: for(UINT8 j=0;j<MAX_NUMBER_OF_BULLETS_ON_SCREEN;j++){
	ldhl	sp,	#15
	ld	(hl), #0x00
00150$:
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, #0x0a
	jp	NC, 00151$
;source/default/bullets.c:93: if(bullets[j]==0)continue;
	ld	de, #_bullets
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
;source/default/bullets.c:98: if(bullets[j]<0)scroll_sprite(sprite,0,4);
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl), a
;source/default/bullets.c:93: if(bullets[j]==0)continue;
	ld	a, (hl)
	or	a, a
	jp	Z, 00145$
;source/default/bullets.c:95: INT8 sprite = bullets[j];
	ld	a, (hl+)
	ld	(hl), a
;source/default/bullets.c:96: if(sprite<0)sprite=-sprite;
	bit	7, (hl)
	jr	Z, 00104$
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00104$:
;source/default/bullets.c:98: if(bullets[j]<0)scroll_sprite(sprite,0,4);
	ldhl	sp,	#13
	bit	7, (hl)
	jr	Z, 00106$
	inc	hl
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
;source/default/bullets.c:98: if(bullets[j]<0)scroll_sprite(sprite,0,4);
	jr	00107$
00106$:
;source/default/bullets.c:99: else scroll_sprite(sprite,0,-4);
	ldhl	sp,	#14
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
;source/default/bullets.c:99: else scroll_sprite(sprite,0,-4);
00107$:
;source/default/bullets.c:101: bx = shadow_OAM[sprite].x-4;
	ldhl	sp,	#14
	ld	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	ld	a, (hl)
	add	a, #0xfc
	ldhl	sp,	#12
	ld	(hl), a
;source/default/bullets.c:102: by = shadow_OAM[sprite].y-12;
	ld	hl, #_shadow_OAM
	add	hl, bc
	ld	a, (hl)
	add	a, #0xf4
	ldhl	sp,	#13
	ld	(hl), a
;source/default/bullets.c:106: if(by<8||by>176){
	ld	a, (hl)
	sub	a, #0x08
	jr	C, 00108$
	ld	a, #0xb0
	sub	a, (hl)
	jr	NC, 00109$
00108$:
;source/default/bullets.c:108: RemoveBullet(j);
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	call	_RemoveBullet
	inc	sp
;source/default/bullets.c:110: continue;
	jp	00145$
00109$:
;source/default/bullets.c:113: if(bullets[j]<0){
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#14
;source/default/bullets.c:115: INT16 xd = paddle.x-bx;
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), #0x00
;source/default/bullets.c:116: INT16 yd = paddle.y-by;
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), #0x00
;source/default/bullets.c:113: if(bullets[j]<0){
	ldhl	sp,	#14
	bit	7, (hl)
	jp	Z, 00119$
;source/default/bullets.c:115: INT16 xd = paddle.x-bx;
	ld	a, (#_paddle + 0)
	ldhl	sp,#14
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
;source/default/bullets.c:116: INT16 yd = paddle.y-by;
	ld	a, (#(_paddle + 1) + 0)
	ldhl	sp,#12
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	c, a
;source/default/bullets.c:118: if(xd<0)xd=-xd;
	ld	a, (hl+)
	inc	hl
	ld	b, a
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
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
00112$:
;source/default/bullets.c:119: if(yd<0)yd=-yd;
	bit	7, b
	jr	Z, 00114$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
00114$:
;source/default/bullets.c:121: if(xd<8&&yd<6){
	ldhl	sp,	#13
	ld	a, (hl+)
	sub	a, #0x08
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00337$
	bit	7, d
	jr	NZ, 00338$
	cp	a, a
	jr	00338$
00337$:
	bit	7, d
	jr	Z, 00338$
	scf
00338$:
	jr	NC, 00119$
	ld	a, c
	sub	a, #0x06
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00119$
;source/default/bullets.c:123: RemoveBullet(j);
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	call	_RemoveBullet
	inc	sp
;source/default/bullets.c:125: paddle.dead=1;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x01
;source/default/bullets.c:127: continue;
	jp	00145$
00119$:
;source/default/bullets.c:133: get_bkg_tiles(bx/8,by/8,1,1,helper);
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl+)
	rlca
	and	a,#0x01
	ld	(hl-), a
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
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00153$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
00153$:
	ldhl	sp,	#14
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl-)
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	rlca
	and	a,#0x01
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00154$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
00154$:
	ldhl	sp,#13
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	ld	de, #_helper
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#16
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_tiles
	add	sp, #6
;source/default/bullets.c:135: if(helper[0]>=3&&helper[0]<=17){
	ld	a, (#_helper + 0)
	ldhl	sp,#14
	ld	(hl), a
	ld	a, (hl)
	sub	a, #0x03
	jp	C, 00142$
	ld	a, #0x11
	sub	a, (hl)
	jp	C, 00142$
;source/default/bullets.c:137: helper[0]=helper[0]+1;
	ld	a, (hl)
	inc	a
	ld	(#_helper),a
;source/default/bullets.c:135: if(helper[0]>=3&&helper[0]<=17){
	ld	a, (#_helper + 0)
;source/default/bullets.c:138: if(helper[0]==5)helper[0]=0;
	ldhl	sp,#14
	ld	(hl), a
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00132$
	ld	hl, #_helper
	ld	(hl), #0x00
	jr	00133$
00132$:
;source/default/bullets.c:139: else if(helper[0]==8)helper[0]=0;
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, #0x08
	jr	NZ, 00129$
	ld	hl, #_helper
	ld	(hl), #0x00
	jr	00133$
00129$:
;source/default/bullets.c:140: else if(helper[0]==11)helper[0]=0;
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, #0x0b
	jr	NZ, 00126$
	ld	hl, #_helper
	ld	(hl), #0x00
	jr	00133$
00126$:
;source/default/bullets.c:141: else if(helper[0]==14)helper[0]=0;
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, #0x0e
	jr	NZ, 00123$
	ld	hl, #_helper
	ld	(hl), #0x00
	jr	00133$
00123$:
;source/default/bullets.c:142: else if(helper[0]==17)helper[0]=0;
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, #0x11
	jr	NZ, 00133$
	ld	hl, #_helper
	ld	(hl), #0x00
00133$:
;source/default/bullets.c:145: set_bkg_tiles(bx/8,by/8,1,1,helper);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00155$
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
00155$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#12
	ld	(hl), e
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00156$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
00156$:
	ldhl	sp,	#14
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl+)
	ld	(hl-), a
	dec	hl
	ld	de, #_helper
	push	de
	ld	de, #0x101
	push	de
	ld	a, (hl+)
	inc	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;source/default/bullets.c:147: RemoveBullet(j);
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	call	_RemoveBullet
	inc	sp
	jp	00145$
00142$:
;source/default/bullets.c:150: } else if(helper[0]>=19&&helper[0]<=23&&bullets[j]>0){
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, #0x13
	jp	C, 00145$
	ld	a, #0x17
	sub	a, (hl)
	jp	C, 00145$
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00349$
	bit	7, d
	jr	NZ, 00350$
	cp	a, a
	jr	00350$
00349$:
	bit	7, d
	jr	Z, 00350$
	scf
00350$:
	jp	NC, 00145$
;source/default/bullets.c:153: set_bkg_tile_xy(bx/8,by/8,0);
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00157$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
00157$:
	ldhl	sp,	#14
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl-)
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00158$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
00158$:
	ldhl	sp,	#14
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl+)
	ld	(hl-), a
	dec	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, (hl+)
	inc	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;source/default/bullets.c:154: if(slideDir>0)set_bkg_tile_xy(bx/8-1,by/8,0);
	ld	hl, #_slideDir
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00351$
	bit	7, d
	jr	NZ, 00352$
	cp	a, a
	jr	00352$
00351$:
	bit	7, d
	jr	Z, 00352$
	scf
00352$:
	jr	NC, 00135$
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00159$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
00159$:
	ldhl	sp,	#14
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl-)
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00160$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
00160$:
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl-)
	dec	hl
	ld	c, a
	sra	c
	rr	b
	sra	c
	rr	b
	sra	c
	rr	b
	dec	b
	xor	a, a
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00136$
00135$:
;source/default/bullets.c:155: else set_bkg_tile_xy(bx/8+1,by/8,0);
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00161$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
00161$:
	ldhl	sp,	#14
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl-)
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00162$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
00162$:
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl-)
	dec	hl
	ld	c, a
	sra	c
	rr	b
	sra	c
	rr	b
	sra	c
	rr	b
	inc	b
	xor	a, a
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00136$:
;source/default/bullets.c:157: UINT8 invader= GetInvaderForNode(bx/8,by/8);
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00163$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
00163$:
	ldhl	sp,	#14
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl+)
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00164$
	inc	hl
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
00164$:
	ldhl	sp,	#13
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl+)
	ld	(hl+), a
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_GetInvaderForNode
	pop	hl
;source/default/bullets.c:159: IncreaseScore(10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_IncreaseScore
	inc	sp
;source/default/bullets.c:175: RemoveBullet(j);
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	call	_RemoveBullet
	inc	sp
00145$:
;source/default/bullets.c:91: for(UINT8 j=0;j<MAX_NUMBER_OF_BULLETS_ON_SCREEN;j++){
	ldhl	sp,	#15
	inc	(hl)
	jp	00150$
00151$:
;source/default/bullets.c:180: }
	add	sp, #16
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
