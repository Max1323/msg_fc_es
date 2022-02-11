arch nes.cpu

define Bank31Restore			$9CE5
define Bank31Bankswitch			$989F
define LastBankRestore			$F017
define LastBankBankswitch		$F16C
define EntrySelectionEmpty		#$59

define PasswordNextTileId		#$1B
define PasswordEndTileId		#$1E

define CharEllipses1			#$0d
define CharEllipses2			#$0C

define Accent1					#$E0
define Accent2					#$E1

//==============================
//PARENT SECTOR
//==============================
//==============================
//BANK 00
//==============================
banksize $4000
bank 00
//==============================
//Timing screen
//==============================
//Pointer
org $0135 // 0x0135
db $70, $00, $10
//Data
bank 56
org $1010 // 0xE1010
incbin "ASM\Timing_Screen_Data_1.bin"

//==============================
//BANK 16
//==============================
banksize $4000 //Start 0x40000
bank 16

//==============================
//Ch2: Vivace Fullscreen music end wait removal (Script Engine)
//(Childless)
//==============================
org $1FF5 //;0x41FF5
db $ea

//==============================
//Ch7: Final blow music change
//==============================
org $3ab2 // 0x43ab2
db $B8
db $01,$20
db $82
db $02,$7D,$06
db $B6
db $4E,$16,$0A

//==============================
//BANK 18
//==============================
banksize $4000 //Start 0x48000
bank 18
//==============================
//Password text palette fix
//(Childless)
//==============================
//Bank ID 1
org $171A // 0x4971A
db $80
//Bank ID 2
org $171D // 0x4971D
db $80
//==============================
//Ch 2: Yayoi kickout music end wait removal (Script Engine)
//(Childless)
//==============================
org $2DD4 //0x4add4
db $ea //Originally $f7

//==============================
//Azusa double choice fix
//==============================
//0x34D to 4A9D1
org $29D1
db $4D, $03
//"About Azusa" in entry 779
//0x30B to 443A6
banksize $4000
bank 17
org $03A6
db $0B, $03
//==============================
//BANK 19
//==============================
banksize $4000 //Start 0x4C000
bank 19
//==============================
//Game over text (Childless)
//==============================
org $0CC0 // 0x4CCC0
incbin "ASM\Game_Over_Text_Data.bin"
//==============================
//Password white text
//(Childless)
//==============================
org $24FC // 0x4E4FC
db $FE
org $2503 // 0x4E503
incbin "ASM\White_Text_Data_2.bin"
org $2531 // 0x4E531
incbin "ASM\White_Text_Data_3.bin"

//==============================
//Ch 2: Pilot reveal pause removal (Script Engine)
//(Childless)
//==============================
org $12A2 //0x4D2A2
db $ea

//==============================
// Ch 5
// Tower "Knock" => "Check"
// Option change (Script Engine)
//==============================
org $3023 //0x4F023
db $b2
org $33BD //0x4F3BD
db $b2
org $342D //0x4F42D
db $b2
//==============================
//Ch7: Battle Summary C (Script Engine)
//==============================
//If you remove this, remove this
//at line #2772:
//"They're(LINE)coming right for us!(LINE)"
//#$4d134
org $1134; fill $85, $ea //blank out everything
org $1134
db $2B
db $25
db $3C,$80,$00 //skip over the blanked area (always branches)

//==============================
//BANK 20
//==============================
banksize $4000
bank 20
//==============================
// Ch 5
// Tower "Knock" => "Check"
// Option change (Continued)
//==============================
org $00EE //0x500EE
db $b2
org $0140 //0x50140
db $b2
org $0192 //0x50192
db $b2
org $053F //0x5053F
db $b2
org $0C03 //0x50C03
db $b2

//==============================
//Password leftover lines fix
//(Childless)
//==============================
org $12C3 // 0x512C3
db $FD
org $12D4 // 0x512D4s
db $FD

//==============================
//BANK 29
//==============================
banksize $4000
bank 29
//==============================
//Blinking text palettes A
//==============================
org $2D03 // ;0x76D03
JMP BlinkingTextPalettes

//==============================
//BANK 30
//==============================
banksize $4000
bank 30

//==============================
// Accent #5
//==============================

org $2E55 //; 0x7DE55
cmp {Accent1}

org $2E59 //; 0x7DE59
cmp {Accent2}

//==============================

//==============================
//Choice number: 4 options per screen
//==============================

// This is unfinished.
// The game's engine does in fact support pagination for sub options,
// but it get visually messy.

//org $26B7 // 0x7A6B7
//cmp #$04

//org $29D1 // 0x7A9D1
//db $04

//org $2542 // 0x7A542
//cmp #$04

//org $2949 // 0x7A849
//cmp #$05

// Change when to paginate
//org $297A // 0x7A97A
//and #$04

// Change when pagination is enabled
//org $2849 // 0x7A849
//cmp #$05

//org $296E // 0x7A96E
//and #$04

//==============================
//Choice number fix 1 A
//==============================
org $26D0 // 0x7A6D0
JSR ChoiceNumberFix
//==============================
//Password shadow fix A
//==============================
org $2B71 // 0x7AB71
JSR PasswordShadowFix
//==============================
//Remove autolinebreaking
//(Top dialogue box)
//==============================
org $2E26 // 0x7AE26
NOP
NOP
NOP
//==============================
//Scrolling text speed A
//==============================
org $2E36 // 0x7AE36
JMP ScrollingTextSpeed
//==============================
//No indent
//(Top dialogue box)
//(Childless)
//==============================
org $2F78 // 0x7AF78
LDA #$00
org $304F // 0x7B04F
LDA #$00
//==============================
//No auto-linebreak
//(Top dialogue box)
//(Childless)
//==============================
org $2FDA // 0x7AFDA
LDA #$01
//==============================
//Text speed
//(Top dialogue box) A
//==============================
org $3012 // 0x7B012
JMP TextSpeedReport
//==============================
//Emergency countdown fix
//==============================
org $30EC // 0x7B0EC
db $3F
//==============================
//Emergency countdown period fix
//==============================
org $312E // 0x7B12E
db $56
//==============================
//Portrait shadows fix A
//==============================
org $31F4 // 0x7B1F4
JSR PortraitShadowFix
//==============================
//Missing portrait tile fix
//(Childless)
//==============================
//Tadashi
org $368F // 0x7B68F
db $FE
//Elina
org $3762 // 0x7B762
db $FE
//==============================
//Skip voice A
//==============================
org $39BB // 0x7B9BB
JSR SkipVoice
//==============================
//Max B speed A
//==============================
JMP MaxBSpeed
//==============================
//Skip voice (Top dialogue box) A
//==============================
org $3A07 // 0x7BA07
JSR SkipVoiceReport
//==============================
//Characters won't move their
//mouth during ellipsis and long 
//hyphen
//==============================
//>1E:9986: B1 1C     LDA ($1C),Y @ $9BB0 = #$22
//The old mouth values for !,?,etc are there for 
//stuff on the top row, but those
//characters will never be spoken 
//So I'll leave them alone.

//make the ellipsis be stored as 
//mouth moving characters so we can override
//this later. 
//It prevents puncation from registering as a voice
//when coming before ellipses.
//(OVERRIDE #1)
org $3AE3 // 0x7BAE3
db $81,$81

//Long hyphen Part 1
//(Long hyphen part 2 is already silent)
org $3AAD //0x7BAAD
db $03

//Silencing puncation messes up the mouth movments
//of certain lines with one word with the mouth patches
//we've done
// Don't silence sweat emojis, just like the original JP version.

//==============================
//Scrolling text speed C (when linebreaks are used)
//==============================
org $7309D // 0x7B09D-908D
JMP $9F9F

//==============================
//Scrolling text speed D 
//==============================
org $73FAF //0x7BFAF
ScrollingTextSpeedD:
INC $045A
INC $045A
JMP $9090

//==============================
// Menu expansion
//==============================
//Original
//db $42,$28,$82,$28,$C2,$28,$02,$29,$C2,$29,$02,$2A,$42,$2A,$82
//I actually hate having to shift everything to the left;
//It doesn't align with the dialogue.

org $2A3D //0x7AA3D
db $41 //Option #01 (nothing on right)
db $28
db $81 //Option #02 (nothing on right)
db $28
db $C1 //Option #03 (nothing on right)
db $28
db $01 //Option #04 (nothing on right)
db $29
db $C1 //Option #01/#05
db $29
db $01 //Option #02/#06
db $2A
db $41 //Option #03/#07
db $2A
db $81 //Option #04/#08

//1E:86F1: BD 2D 8A  LDA $8A2D,X @ @8A2D = $42

//==============================
//Slow Mouth A
//==============================
org $73A2b //0x7BA2b
jmp SlowMouth
nop
nop
nop
nop
nop
nop
nop
nop

//==============================
//BANK 31
//==============================
banksize $4000 //0x7C000
bank 31

//==============================
// Numbering fix
// In-Dialogue options
//==============================

org $0F95 //0x7CF95

db $FE,$B1
db $FE,$B2
db $FE,$FE
db $10,$FE
db $10,$FE
db $00

db $FE,$B1
db $FE,$FE
db $FE,$B2
db $FE,$FE
db $10,$FE
db $FE,$FE
db $10,$FE
db $00

db $FE,$B1
db $FE,$B2
db $FE,$FE
db $FE,$FE
db $10,$FE
db $10,$FE
db $FE,$FE
db $00

db $FE,$B1
db $FE,$FE
db $FE,$B2
db $FE,$FE
db $FE,$FE
db $10,$FE
db $FE,$FE
db $10,$FE
db $FE,$FE
db $00

db $FE,$B1
db $FE,$FE
db $FE,$FE
db $FE,$B2
db $FE,$FE
db $10,$FE
db $FE,$FE
db $FE,$FE
db $10,$FE
db $00,$FE
db $B1,$FE
db $B2,$FE
db $FE,$FE
db $FE,$FE
db $FE,$10
db $FE,$10
db $FE,$FE
db $FE,$FE
db $FE
db $00

//==============================
//Password selection codes A
//==============================
org $07CB //0x7C7CB
JMP SelectionCodesSetup
//==============================
// Password selection (Pressing A)
//=============================
// Next option
org $085D // 0x7C85D
CMP {PasswordNextTileId}

// End option
org $0861 // 0x7C861
CMP {PasswordEndTileId}

//==============================
// Cursor tileid
//=============================
org $74B //0x7C74B
lda {EntrySelectionEmpty}

//==============================						
//Password orange text
//(Childless)
//==============================
org $091B // 0x7C91B
incbin "ASM\Orange_Text_Data_1.bin"
org $09B3 // 0x7C9B3
incbin "ASM\Orange_Text_Data_2.bin"
//==============================
//Input code range fix 2
//==============================
org $0B2D // 0x7CB2D
JSR {Bank31Bankswitch}
JSR InputCodeRangeFix2Setup
NOP
//==============================
//Input code range fix 3
//==============================
org $0B53 // 0x7CB53
JSR {Bank31Bankswitch}
JSR InputCodeRangeFix2Setup
NOP
//==============================
//Input code range
//Adjust letter options to support new encoding
//==============================
org $0CCE // 0x7CCCE
db $20, $21, $22, $23, $24, $25
db $26, $27, $28, $29, $2A, $2B
db $2C, $2D, $2E, $2F, $30, $31
db $32, $33, $34, $35, $36, $37
db $38, $39

//==============================
//No auto-linebreak (General)
//(Childless)
//==============================
org $1272; fill $03, $ea // 0x7D272

//==============================
//No auto-linebreak (War Story)
//(Bottom Text) (Childless)
//==============================
org $1294; fill $03, $ea // 0x7D294

//==============================
// Accent mark #1
//==============================
org $1304; base $92F4; fill $2E, $ea
org $1304; base $92F4 // 0x7D2F4

// Due to space constraints in this bank and
// the extended bank, everything on line #$E0
// is registered as an accent mark.
pha
and #$F0
cmp #$E0
bne NotAccentCharacter
pla
pha

and #$0F
asl
asl
asl
asl
sta $05
pla

sta $27
jsr $9348
tya
adc $05
tay
lda $05d7,y
ora $935f,x
sta $05d7,y

ldx $10
jmp $92e7
NotAccentCharacter:
pla

//==============================
// Accent mark #2
//==============================
org $13B1; base $93A1; fill $20, $ea // 0x7D3B1
org $13B1; base $93A1
jsr $9471
lda $13
asl
asl
pha
//pha
tax

lda {Accent1}
sta $16
jsr $93c1

pla
clc
adc #$10 
tax
lda {Accent2}
sta $16 
jsr $93c1
jmp AccentMark2


org $1FF0; base $9FE0 // 0x7dff0
AccentMark2:
//pla
//clc
//adc #$10
//tax
//lda #$e2
//sta $16
//jsr $93c1
jsr $93fd
rts

//==============================
// Accent mark #3 (Password screen)
//==============================
org $19FA; base $99EA; fill $09, $ea // 0x0007D9FA
org $19FA; base $99EA
lda $0469,y
cmp {Accent1}
db $f0,$04 //beq $99f5
cmp {Accent2}

//==============================
// Accent mark #4 (Menu options)
//==============================
org $3152; base $F142; fill $0a, $ea // 0x0007F152
org $3152; base $F142
lda $0469,y
iny
cmp {Accent1}
db $F0,$F1     //BEQ $F13B
cmp {Accent2}

org $3176; base $F166; fill $0a, $ea // 0x0007F176
org $3176; base $F166
lda $0469,y
iny
cmp {Accent1}
db $F0,$04     // BEQ $F172
cmp {Accent2}


//==============================
//Bank 31 bankswitch
//==============================
org $18AF // 0x7D8AF
Bank31Bankswitch:
LDA #$F0     
STA $5115
RTS
NOP
NOP
//==============================
//Text speed A
//==============================
org $18DB // 0x7D8DB
JSR {Bank31Bankswitch}
JSR TextSpeedSetup
NOP
//==============================
//Ch7: Battle Summary A
//==============================
//org $2E07; fill $24, $ea
//org $2E07 //0x7EE07
//tay
//LDA #$F0
//STA $5115
//JSR BattleSummary
//tya

//==============================
//Skip indent after linebreak
//(Childless)
//==============================
org $18FB // 0x7D8FB
JMP $98A7
//==============================
//Input code range: hyphen fix 2
//WARNING: THIS COULD
//POTENTIALLY CRASH THE GAME
//7/2020: Actually, I don't
//remember what was this for,
//so I'll comment it
//==============================
//org $192C // 0x7D92C
//db $0C
//==============================
//No auto-linebreak fullscreen
//(Childless)
//==============================
org $19E3 // 0x7D9E3
NOP
NOP
NOP
//==============================
//No indent fullscreen
//(Childless)
//==============================
org $1B15 // 0x7DB15
NOP
NOP
//==============================
//Password text speed A
//==============================
org $1B46 // 0x7DB46
JSR TextSpeedPasswordSetup
NOP
//==============================
//Password screen (and V-MH selection) cursor speed
//==============================
org $2809 // 0x7E809
//db $12
//==============================
//Password screen (and V-MH selection) empty slots
//==============================
org $B89 // 0x7CB89
//lda {EntrySelectionEmpty}

org $192B // 0x0007D92B
lda {EntrySelectionEmpty}

//==============================
// Ch7: Correct quote to AZUSA password
//==============================
org $BE6 //0x7CBE6
ldy #$FE
lda #$AC

//==============================
//Password screen: Empty entry handling
//==============================

org $BDB //0x7CBDB
CMP {EntrySelectionEmpty}

//============================================================
//CHILD SECTOR
//============================================================
//==============================
//BANK 29
//==============================
banksize $4000
bank 29

//==============================
//Blinking text palettes B
//==============================
org $39DC ; base $99CC
BlinkingTextPalettes:
//"Vivace" fix
PHA
LDA #$0F
STA $5D56
PLA

//Forget what this does
STA $0400,x
INX

lda $90
CMP #$78
BEQ ProcessBlinkyShadow
CMP #$2D
BEQ ProcessBlinkyShadow
CMP #$90
BEQ ProcessBlinkyShadow
CMP #$58
BEQ ProcessBlinkyShadow

RTS

ProcessBlinkyShadow:
//Pink text
tya
pha
ldy $95

lda $90
CMP #$2D
beq BG_PinkGrey
CMP #$78
beq BG_PinkBlack
CMP #$90
beq BG_GreenBlack
CMP #$58
beq BG_GameOver
rts

BG_PinkGrey:
lda t_PinkShadow_GreyBG,y
jmp done
BG_PinkBlack:
lda t_PinkShadow_BlackBG,y
jmp done
BG_GreenBlack:
lda t_GreenShadow_BlackBG,y
jmp done
BG_GameOver:
lda t_GameOverShadow,y

done:
STA $0400,x
pla
tay

RTS

t_PinkShadow_GreyBG: //$AE2D's shadows
//Original
//db $00,$70,$00,$05,$15,$25,$25,$25,$25,$25,$25,$25,$25,$25,$15,$05,$00
db $00,$70,$00,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$00

t_PinkShadow_BlackBG: //$AB78's shadows
//Original
//db $0F,$72,$0F,$05,$15,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$15,$05
db $0F,$72,$0F,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$15,$05

t_GreenShadow_BlackBG: //$AB90's shadows
//Original
//db $0F,$0F,$0A,$1A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$1A,$0A,$41
db $0F,$0F,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$41

t_GameOverShadow: //$AC58's shadows
//Original
//db $82,$10,$00,$0D,$00,$10,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$41
db $82,$10,$00,$0D,$00,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$41

//==============================
//BANK 30
//==============================
banksize $4000
bank 30
//==============================
//Password shadow fix B
//==============================
org $3E50 ; base $9E40
PasswordShadowFix:
LDA $18
STY $FD
ADC $FD
CMP #$A1
BNE ExitShadowFix
LDA $19
CMP #$AE
BNE ExitShadowFix
//Backups
STY $FE
STX $FF
//???
LDA #$00
STA $A8
LDA #$2F
STA $A7
//Vertical line to buffer
LDA #$04
STA $0300
LDA #$0B
STA $0301
LDA #$20
STA $0302
LDA #$7E
STA $0303
LDX #$00
LDA #$FF
Loop1:
STA $0304,x
INX
CPX #$0B
BNE Loop1
//Horizontal line to buffer
LDA #$00
STA $030F
LDA #$1C
STA $0310
LDA #$21
STA $0311
LDA #$A3
STA $0312
LDX #$00
LDA #$FF
Loop2:
STA $0313,x
INX
CPX #$20
BNE Loop2
//Restore Y, X and A
LDX $FF
LDY $FE
ExitShadowFix:
LDA ($18),y
STA ($1A),y
DEY
RTS

//==============================
//Scrolling text speed B
//==============================
ScrollingTextSpeed:
INC $045A
INC $045A
JMP $8E29
//==============================
//Text speed (Top dialogue box) B
//==============================
TextSpeedReport:
PLA
CMP #$01
BEQ exit
LSR
exit:
STA $4B
JMP $9005
//==============================
//Portrait shadows fix
//==============================
PortraitShadowFix:
CPY #$02
BCS DontWrite1
LDA $0419
BEQ DontWrite2
LDA #$01
STA $04A3,y
RTS
DontWrite2:
LDA ($1A),y
DontWrite1:
STA $04A3,y
RTS
//==============================
//Skip voice B
//==============================
SkipVoice:

txa
pha

//Check if current character to write isn't a space
//if it is, don't increment our counter
ldx $10
lda $04A9,x
cmp #$FE
beq dontIncrement
INC $02
dontIncrement:

pla
tax

LDA $02
AND #$03
BEQ ExitSkipVoice
RTS
ExitSkipVoice:
JMP $9A44
//==============================
//Skip voice (Top dialogue box) B
//==============================
SkipVoiceReport:
INC $05
LDA $05
AND #$03
BEQ ExitSkipVoiceReport
RTS
ExitSkipVoiceReport:
JMP $9A44
//==============================
//Max B speed B
//==============================
MaxBSpeed:
//Skip routine if we're not pressing B
LDA $062D
//This byte determines whether or not you can power
//through the dialogue with B.
AND $5D18
BEQ LoadOriginalSpeed

LoadMaxSpeed:
LDA #$00
STA $2E
JMP $99B8

//Speed provided by text speed patches
LoadOriginalSpeed:
LDA $FE
STA $2E
JMP $99B1

//==============================
// Choice numbering fix
// (Menu Numbering)
//==============================
ChoiceNumberFix:
CMP #$10
BEQ ExitNumberFix
CMP #$FE
BEQ ExitNumberFix
CLC
ADC #$90
ExitNumberFix:
STA $04A9,y
RTS

//==============================
//Slow Mouth B
//==============================
SlowMouth:
lda $04A9

cmp {CharEllipses1}		//;[...]	(OVERRIDE #1)
beq OpenMouth_Override
cmp {CharEllipses2}		//;[..]		(OVERRIDE #1)
beq OpenMouth_Override_Reset

LDA $02
AND #$01
BEQ OpenMouth
OpenMouth_Override:
jmp $9A26

OpenMouth_Override_Reset:
lda #$00
sta $02

jmp $9A26

OpenMouth_Override:
OpenMouth:
LDA $07ED,x
AND #$3F
ORA $07B1
STA $07ED,x
jmp $9A26

//==============================
//BANK 31
//==============================
banksize $4000
bank 31
//==============================
//Bank30Bankswitch
//==============================
org $0003 ; base $9FF3 //0x7C003
Bank30Bankswitch:
LDA #$F0
STA $5115
RTS

//==============================
//Password text speed setup
//==============================
org $1FD0 ; base $9FC0
TextSpeedPasswordSetup:
STA $2E
JSR {Bank31Bankswitch}
JSR TextSpeedPassword
RTS
//==============================
//Password selection codes setup
//==============================
SelectionCodesSetup:
JSR {Bank31Bankswitch}
JSR SelectionCodes
RTS
SelectionCodesJumpOut:
JSR {LastBankRestore}
JMP $8779
//==============================
//Text speed setup
//==============================
TextSpeedSetup:
JSR TextSpeed
RTS
//==============================
//Input code range fix 2 setup
//==============================
InputCodeRangeFix2Setup:
JSR InputCodeRangeFix2
LDA $FF
RTS
//==============================
//BANK 38 (Extension of bank 31)
//==============================
bank 56
org $0010 ; base $A000 //0xE0000
//==============================
//8x16 font
//There's a bug present in the
//original version (i.e
//immediate choices) that shows
//the dakuten/handakuten line
//before the bottom line scrolls
//down completely, making that
//line merge incorrectly with
//the bottom one for 2 frames
//per line.
//==============================
Font8x16:
LDA $0469,y
CMP #$C0
BCS Exit
CMP #$20
BCC Exit
SEC
SBC #$10
STA $27
LDA #$00
STA $FF
Exit:
JMP {LastBankRestore}
//==============================
//Password selection codes B
//==============================
SelectionCodes:
LDA $14
AND #$F0
CMP #$10
BNE ExitSelectionCodes
LDA $14
CMP #$FC
BEQ ExitSelectionCodes
INC $12
INY
LDA $12
CMP #$03
BEQ ExitSelectionCodes
JMP SelectionCodesJumpOut
ExitSelectionCodes:
JMP {LastBankRestore}
//==============================
//Text speed  B
//==============================
TextSpeed:
LDA $046D,y
AND #$0F
LSR
LSR
STA $2E
STA $FE
JMP {LastBankRestore}
//==============================
//Unfortunately, 02 is the max
//speed before utter silence
//Text speed password B
//==============================
TextSpeedPassword:
LDA $2E
AND #$0F
LSR
STA $2E
STA $FE
JMP {LastBankRestore}
//==============================
//Input code range fix 2
//==============================
InputCodeRangeFix2:
LDX $16
LDY #$00
LDA $0558,x
CMP {EntrySelectionEmpty}
BNE SkipAddOn
CLC
ADC #$A0
SkipAddOn:
STA $FF
JMP {LastBankRestore}