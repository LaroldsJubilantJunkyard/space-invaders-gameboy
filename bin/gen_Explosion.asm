;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Explosion
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Explosion_metasprites
	.globl _Explosion_metasprite4
	.globl _Explosion_metasprite3
	.globl _Explosion_metasprite2
	.globl _Explosion_metasprite1
	.globl _Explosion_metasprite0
	.globl _Explosion_tiles
	.globl _Explosion_palettes
	.globl b___func_Explosion
	.globl ___func_Explosion
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\gen\default\graphics\Explosion.c:7: BANKREF(Explosion)
;	---------------------------------
; Function __func_Explosion
; ---------------------------------
	b___func_Explosion	= 0
___func_Explosion::
	.local b___func_Explosion 
	___bank_Explosion = b___func_Explosion 
	.globl ___bank_Explosion 
	.area _CODE
_Explosion_palettes:
	.dw #0x7fff
	.dw #0x0000
	.dw #0x600a
	.dw #0x0015
_Explosion_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
_Explosion_metasprite0:
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_Explosion_metasprite1:
	.db #0xfc	; -4
	.db #0xfc	; -4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_Explosion_metasprite2:
	.db #0xfc	; -4
	.db #0xfc	; -4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_Explosion_metasprite3:
	.db #0xfc	; -4
	.db #0xfc	; -4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_Explosion_metasprite4:
	.db #0xfc	; -4
	.db #0xfc	; -4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_Explosion_metasprites:
	.dw _Explosion_metasprite0
	.dw _Explosion_metasprite1
	.dw _Explosion_metasprite2
	.dw _Explosion_metasprite3
	.dw _Explosion_metasprite4
	.area _INITIALIZER
	.area _CABS (ABS)
