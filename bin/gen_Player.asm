;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Player
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Player_metasprites
	.globl _Player_metasprite0
	.globl _Player_tiles
	.globl _Player_palettes
	.globl b___func_Player
	.globl ___func_Player
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\gen\graphics\Player.c:7: BANKREF(Player)
;	---------------------------------
; Function __func_Player
; ---------------------------------
	b___func_Player	= 0
___func_Player::
	.local b___func_Player 
	___bank_Player = b___func_Player 
	.globl ___bank_Player 
	.area _CODE
_Player_palettes:
	.dw #0x7fff
	.dw #0x0000
	.dw #0x1c0a
	.dw #0x001f
_Player_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
_Player_metasprite0:
	.db #0xfc	; -4
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_Player_metasprites:
	.dw _Player_metasprite0
	.area _INITIALIZER
	.area _CABS (ABS)
