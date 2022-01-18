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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:14: GameFirstLoad();
	call	_GameFirstLoad
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:16: uint8_t currentGameState = GAMEFIRSTLOAD;
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:17: uint8_t nextGameState = STARTSCREEN;
	ld	bc, #0x100
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:19: while(1){
00132$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:21: joypadPrevious=joypadCurrent;
	ld	a, (#_joypadCurrent)
	ld	(#_joypadPrevious),a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:22: joypadCurrent=joypad();
	call	_joypad
	ld	hl, #_joypadCurrent
	ld	(hl), e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:24: if(nextGameState!=currentGameState){
	ld	a, c
	sub	a, b
	jr	Z, 00116$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:26: currentGameState=nextGameState;
	ld	c, b
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:28: ClearBackground();
	push	bc
	call	_ClearBackground
	call	_ClearAllSprites
	pop	bc
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:31: if(currentGameState==STARTSCREEN)SetupStartScreen();
	ld	a, b
	dec	a
	jr	NZ, 00113$
	push	bc
	call	_SetupStartScreen
	pop	bc
	jr	00116$
00113$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:32: else if(currentGameState==MENUSCREEN)SetupMenuScreen();
	ld	a, b
	sub	a, #0x02
	jr	NZ, 00110$
	push	bc
	call	_SetupMenuScreen
	pop	bc
	jr	00116$
00110$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:33: else if(currentGameState==GAMEPLAYSCREEN)SetupGameplayScreen();
	ld	a, b
	sub	a, #0x03
	jr	NZ, 00107$
	push	bc
	call	_SetupGameplayScreen
	pop	bc
	jr	00116$
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:34: else if(currentGameState==GAMEOVERSCREEN)SetupGameOverScreen();
	ld	a, b
	sub	a, #0x05
	jr	NZ, 00104$
	push	bc
	call	_SetupGameOverScreen
	pop	bc
	jr	00116$
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:35: else if(currentGameState==NEXTLEVELSCREEN)SetupNextLevelScreen();
	ld	a, b
	sub	a, #0x04
	jr	NZ, 00116$
	push	bc
	call	_SetupNextLevelScreen
	pop	bc
00116$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:39: if(currentGameState==STARTSCREEN)nextGameState=UpdateStartScreen();
	ld	a, c
	dec	a
	jr	NZ, 00129$
	push	bc
	call	_UpdateStartScreen
	pop	bc
	ld	b, e
	jr	00130$
00129$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:40: else if(currentGameState==MENUSCREEN)nextGameState=UpdateMenuScreen();
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00126$
	push	bc
	call	_UpdateMenuScreen
	pop	bc
	ld	b, e
	jr	00130$
00126$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:41: else if(currentGameState==GAMEPLAYSCREEN)nextGameState=UpdateGameplayScreen();
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00123$
	push	bc
	call	_UpdateGameplayScreen
	pop	bc
	ld	b, e
	jr	00130$
00123$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:42: else if(currentGameState==GAMEOVERSCREEN)nextGameState=UpdateGameOverScreen();
	ld	a, c
	sub	a, #0x05
	jr	NZ, 00120$
	push	bc
	call	_UpdateGameOverScreen
	pop	bc
	ld	b, e
	jr	00130$
00120$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:43: else if(currentGameState==NEXTLEVELSCREEN)nextGameState=UpdateNextLevelScreen();
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00130$
	push	bc
	call	_UpdateNextLevelScreen
	pop	bc
	ld	b, e
00130$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:46: wait_vbl_done();
	call	_wait_vbl_done
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\main.c:50: }
	jp	00132$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
