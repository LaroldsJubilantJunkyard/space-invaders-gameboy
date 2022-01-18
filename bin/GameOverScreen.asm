;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module GameOverScreen
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UpdateGameOverScreen
	.globl _SetupGameOverScreen
	.globl _DrawText
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameOverScreen.c:5: void SetupGameOverScreen(){
;	---------------------------------
; Function SetupGameOverScreen
; ---------------------------------
_SetupGameOverScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameOverScreen.c:7: DrawText(5,9,"GAME  OVER");
	ld	de, #___str_0
	push	de
	ld	hl, #0x905
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameOverScreen.c:8: }
	ret
___str_0:
	.ascii "GAME  OVER"
	.db 0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameOverScreen.c:9: uint8_t UpdateGameOverScreen(){
;	---------------------------------
; Function UpdateGameOverScreen
; ---------------------------------
_UpdateGameOverScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameOverScreen.c:11: if(joypadCurrent & J_A)return STARTSCREEN;
	ld	a, (#_joypadCurrent)
	bit	4, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameOverScreen.c:13: return GAMEOVERSCREEN;
	ld	e, #0x01
	ret	NZ
	ld	e, #0x05
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameOverScreen.c:14: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
