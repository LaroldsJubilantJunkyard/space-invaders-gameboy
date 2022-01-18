;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module BulletC
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _BulletC_metasprites
	.globl _BulletC_metasprite1
	.globl _BulletC_metasprite0
	.globl _BulletC_tiles
	.globl _BulletC_palettes
	.globl b___func_BulletC
	.globl ___func_BulletC
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\gen\default\graphics\BulletC.c:7: BANKREF(BulletC)
;	---------------------------------
; Function __func_BulletC
; ---------------------------------
	b___func_BulletC	= 0
___func_BulletC::
	.local b___func_BulletC 
	___bank_BulletC = b___func_BulletC 
	.globl ___bank_BulletC 
	.area _CODE
_BulletC_palettes:
	.dw #0x7fff
	.dw #0x0000
	.dw #0x400a
	.dw #0x0018
_BulletC_tiles:
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
_BulletC_metasprite0:
	.db #0xfc	; -4
	.db #0xfc	; -4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_BulletC_metasprite1:
	.db #0xfc	; -4
	.db #0xfc	; -4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_BulletC_metasprites:
	.dw _BulletC_metasprite0
	.dw _BulletC_metasprite1
	.area _INITIALIZER
	.area _CABS (ABS)
