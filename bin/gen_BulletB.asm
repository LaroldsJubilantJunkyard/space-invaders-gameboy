;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module BulletB
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _BulletB_metasprites
	.globl _BulletB_metasprite3
	.globl _BulletB_metasprite2
	.globl _BulletB_metasprite1
	.globl _BulletB_metasprite0
	.globl _BulletB_tiles
	.globl _BulletB_palettes
	.globl b___func_BulletB
	.globl ___func_BulletB
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\gen\graphics\BulletB.c:7: BANKREF(BulletB)
;	---------------------------------
; Function __func_BulletB
; ---------------------------------
	b___func_BulletB	= 0
___func_BulletB::
	.local b___func_BulletB 
	___bank_BulletB = b___func_BulletB 
	.globl ___bank_BulletB 
	.area _CODE
_BulletB_palettes:
	.dw #0x7fff
	.dw #0x0000
	.dw #0x3c0a
	.dw #0x0005
_BulletB_tiles:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
_BulletB_metasprite0:
	.db #0xf8	; -8
	.db #0xfc	; -4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_BulletB_metasprite1:
	.db #0xf8	; -8
	.db #0xfc	; -4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_BulletB_metasprite2:
	.db #0xf8	; -8
	.db #0xfc	; -4
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_BulletB_metasprite3:
	.db #0xf8	; -8
	.db #0xfc	; -4
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_BulletB_metasprites:
	.dw _BulletB_metasprite0
	.dw _BulletB_metasprite1
	.dw _BulletB_metasprite2
	.dw _BulletB_metasprite3
	.area _INITIALIZER
	.area _CABS (ABS)
