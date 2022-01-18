;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module NextLevelScreen
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UpdateNextLevelScreen
	.globl _SetupNextLevelScreen
	.globl _DrawNumber
	.globl _DrawText
	.globl _delay
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\NextLevelScreen.c:5: void SetupNextLevelScreen(){
;	---------------------------------
; Function SetupNextLevelScreen
; ---------------------------------
_SetupNextLevelScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\NextLevelScreen.c:7: DrawText(8,8,"ROUND");
	ld	de, #___str_0
	push	de
	ld	hl, #0x808
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\NextLevelScreen.c:8: DrawNumber(9,9,level,2);
	ld	hl, #_level
	ld	c, (hl)
	ld	b, #0x00
	ld	a, #0x02
	push	af
	inc	sp
	push	bc
	ld	hl, #0x909
	push	hl
	call	_DrawNumber
	add	sp, #5
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\NextLevelScreen.c:9: DrawText(8,11,"READY!");
	ld	de, #___str_1
	push	de
	ld	hl, #0xb08
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\NextLevelScreen.c:10: }
	ret
___str_0:
	.ascii "ROUND"
	.db 0x00
___str_1:
	.ascii "READY!"
	.db 0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\NextLevelScreen.c:12: uint8_t UpdateNextLevelScreen(){
;	---------------------------------
; Function UpdateNextLevelScreen
; ---------------------------------
_UpdateNextLevelScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\NextLevelScreen.c:14: delay(2000);
	ld	de, #0x07d0
	push	de
	call	_delay
	pop	hl
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\NextLevelScreen.c:16: return GAMEPLAYSCREEN;
	ld	e, #0x03
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\NextLevelScreen.c:17: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
