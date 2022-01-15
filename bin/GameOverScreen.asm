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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameOverScreen.c:4: void SetupGameOverScreen(){}
;	---------------------------------
; Function SetupGameOverScreen
; ---------------------------------
_SetupGameOverScreen::
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameOverScreen.c:5: UINT8 UpdateGameOverScreen(){return 0;}
;	---------------------------------
; Function UpdateGameOverScreen
; ---------------------------------
_UpdateGameOverScreen::
	ld	e, #0x00
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
