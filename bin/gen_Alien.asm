;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Alien
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Alien_metasprites
	.globl _Alien_metasprite0
	.globl _Alien_tiles
	.globl _Alien_palettes
	.globl b___func_Alien
	.globl ___func_Alien
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\gen\graphics\Alien.c:7: BANKREF(Alien)
;	---------------------------------
; Function __func_Alien
; ---------------------------------
	b___func_Alien	= 0
___func_Alien::
	.local b___func_Alien 
	___bank_Alien = b___func_Alien 
	.globl ___bank_Alien 
	.area _CODE
_Alien_palettes:
	.dw #0x7fff
	.dw #0x0000
	.dw #0x0c0a
	.dw #0x0005
_Alien_tiles:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
_Alien_metasprite0:
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
_Alien_metasprites:
	.dw _Alien_metasprite0
	.area _INITIALIZER
	.area _CABS (ABS)
