;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module BulletA
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _BulletA_metasprites
	.globl _BulletA_metasprite4
	.globl _BulletA_metasprite3
	.globl _BulletA_metasprite2
	.globl _BulletA_metasprite1
	.globl _BulletA_metasprite0
	.globl _BulletA_tiles
	.globl _BulletA_palettes
	.globl b___func_BulletA
	.globl ___func_BulletA
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\gen\default\graphics\BulletA.c:7: BANKREF(BulletA)
;	---------------------------------
; Function __func_BulletA
; ---------------------------------
	b___func_BulletA	= 0
___func_BulletA::
	.local b___func_BulletA 
	___bank_BulletA = b___func_BulletA 
	.globl ___bank_BulletA 
	.area _CODE
_BulletA_palettes:
	.dw #0x7fff
	.dw #0x0000
	.dw #0x640a
	.dw #0x000c
_BulletA_tiles:
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
_BulletA_metasprite0:
	.db #0xf8	; -8
	.db #0xfc	; -4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_BulletA_metasprite1:
	.db #0xf8	; -8
	.db #0xfc	; -4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_BulletA_metasprite2:
	.db #0xf8	; -8
	.db #0xfc	; -4
	.db #0x02	; 2
	.db #0x60	; 96
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_BulletA_metasprite3:
	.db #0xf8	; -8
	.db #0xfc	; -4
	.db #0x01	; 1
	.db #0x60	; 96
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_BulletA_metasprite4:
	.db #0xf8	; -8
	.db #0xfc	; -4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_BulletA_metasprites:
	.dw _BulletA_metasprite0
	.dw _BulletA_metasprite1
	.dw _BulletA_metasprite2
	.dw _BulletA_metasprite3
	.dw _BulletA_metasprite4
	.area _INITIALIZER
	.area _CABS (ABS)
