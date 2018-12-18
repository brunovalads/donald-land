bank $07
org $C000

code_07C000:
  JMP code_07C638                           ; $07C000 |

  JMP code_07C009                           ; $07C003 |

  JMP code_07C08B                           ; $07C006 |

code_07C009:
  PHA                                       ; $07C009 |
  LDA $2002                                 ; $07C00A |
  LDA $26                                   ; $07C00D |
  BEQ code_07C088                           ; $07C00F |
  LDA #$00                                  ; $07C011 |
  STA $2003                                 ; $07C013 |
  LDA #$07                                  ; $07C016 |
  STA $4014                                 ; $07C018 |
  TXA                                       ; $07C01B |
  PHA                                       ; $07C01C |
  TYA                                       ; $07C01D |
  PHA                                       ; $07C01E |
  LDA $8E                                   ; $07C01F |
  PHA                                       ; $07C021 |
  JSR code_07C5D3                           ; $07C022 |
  LDA #$3F                                  ; $07C025 |
  STA $2006                                 ; $07C027 |
  LDA #$00                                  ; $07C02A |
  STA $2006                                 ; $07C02C |
  STA $2006                                 ; $07C02F |
  STA $2006                                 ; $07C032 |
  JSR code_07C570                           ; $07C035 |
  LDA $EC                                   ; $07C038 |
  CMP #$05                                  ; $07C03A |
  BNE code_07C058                           ; $07C03C |
  JSR code_07C864                           ; $07C03E |
  LDA #$0E                                  ; $07C041 |
  JSR code_07C51B                           ; $07C043 |
  JSR code_07FD19                           ; $07C046 |
code_07C049:
  LDA $2002                                 ; $07C049 |
  AND #$40                                  ; $07C04C |
  BNE code_07C049                           ; $07C04E |
code_07C050:
  BIT $2002                                 ; $07C050 |
  BVC code_07C050                           ; $07C053 |
  JSR code_07C578                           ; $07C055 |
code_07C058:
  LDA $CA                                   ; $07C058 |
  LDX $CC                                   ; $07C05A |
  LDY $CE                                   ; $07C05C |
  STA $2000                                 ; $07C05E |
  STX $2005                                 ; $07C061 |
  STY $2005                                 ; $07C064 |
  JSR code_07C2CD                           ; $07C067 |
  LDA $C7                                   ; $07C06A |
  AND #$10                                  ; $07C06C |
  BEQ code_07C076                           ; $07C06E |
  DEC $22                                   ; $07C070 |
  BNE code_07C07A                           ; $07C072 |
  BEQ code_07C08C                           ; $07C074 |
code_07C076:
  LDA #$04                                  ; $07C076 |
  STA $22                                   ; $07C078 |
code_07C07A:
  JSR code_07C5A0                           ; $07C07A |
  JSR $8006                                 ; $07C07D |
  PLA                                       ; $07C080 |
  JSR code_07C5AA                           ; $07C081 |
  PLA                                       ; $07C084 |
  TAY                                       ; $07C085 |
  PLA                                       ; $07C086 |
  TAX                                       ; $07C087 |
code_07C088:
  PLA                                       ; $07C088 |
  INC $7C                                   ; $07C089 |
code_07C08B:
  RTI                                       ; $07C08B |

code_07C08C:
  LDA $EC                                   ; $07C08C |
  CMP #$04                                  ; $07C08E |
  BCS code_07C095                           ; $07C090 |
  LDX #$FF                                  ; $07C092 |
  TXS                                       ; $07C094 |
code_07C095:
  ASL                                       ; $07C095 |
  TAY                                       ; $07C096 |
  LDA $C0A1,y                               ; $07C097 |
  PHA                                       ; $07C09A |
  LDA $C0A0,y                               ; $07C09B |
  PHA                                       ; $07C09E |
  RTS                                       ; $07C09F |

  dw $C725                                  ; $07C0A0 |
  dw $C735                                  ; $07C0A2 |
  dw $C725                                  ; $07C0A4 |
  dw $C669                                  ; $07C0A6 |
  dw $C079                                  ; $07C0A8 |
  dw $C0AD                                  ; $07C0AA |
  dw $C0AD                                  ; $07C0AC |

  LDA #$01                                  ; $07C0AE |
  EOR $DF                                   ; $07C0B0 |
  STA $DF                                   ; $07C0B2 |
  JMP code_07C07A                           ; $07C0B4 |

code_07C0B7:
  STA $D9                                   ; $07C0B7 |
  LDA $8E                                   ; $07C0B9 |
  PHA                                       ; $07C0BB |
  TXA                                       ; $07C0BC |
  PHA                                       ; $07C0BD |
  TYA                                       ; $07C0BE |
  PHA                                       ; $07C0BF |
  JSR code_07C5A0                           ; $07C0C0 |
  LDA $D9                                   ; $07C0C3 |
  JSR $8003                                 ; $07C0C5 |
  PLA                                       ; $07C0C8 |
  TAY                                       ; $07C0C9 |
  PLA                                       ; $07C0CA |
  TAX                                       ; $07C0CB |
  PLA                                       ; $07C0CC |
  JMP code_07C5AA                           ; $07C0CD |

code_07C0D0:
  STA $DA                                   ; $07C0D0 |
  LDA $8E                                   ; $07C0D2 |
  PHA                                       ; $07C0D4 |
  TXA                                       ; $07C0D5 |
  PHA                                       ; $07C0D6 |
  TYA                                       ; $07C0D7 |
  PHA                                       ; $07C0D8 |
  JSR code_07C5A0                           ; $07C0D9 |
  LDA $DA                                   ; $07C0DC |
  JSR $8003                                 ; $07C0DE |
  PLA                                       ; $07C0E1 |
  TAY                                       ; $07C0E2 |
  PLA                                       ; $07C0E3 |
  TAX                                       ; $07C0E4 |
  PLA                                       ; $07C0E5 |
  JMP code_07C5AA                           ; $07C0E6 |

code_07C0E9:
  LDA #$01                                  ; $07C0E9 |
  JSR code_07C0D0                           ; $07C0EB |
  LDA #$02                                  ; $07C0EE |
  JMP code_07C0B7                           ; $07C0F0 |

code_07C0F3:
  LDA $0631                                 ; $07C0F3 |
  BNE code_07C0F3                           ; $07C0F6 |
  RTS                                       ; $07C0F8 |

code_07C0F9:
  LDA $0632                                 ; $07C0F9 |
  BNE code_07C0F9                           ; $07C0FC |
  RTS                                       ; $07C0FE |

code_07C0FF:
  LDA #$01                                  ; $07C0FF |
  STA $2B                                   ; $07C101 |
  LDA #$FF                                  ; $07C103 |
  STA $062C                                 ; $07C105 |
  LDA #$25                                  ; $07C108 |
  CMP $0100                                 ; $07C10A |
  BEQ code_07C11F                           ; $07C10D |
  STA $0100                                 ; $07C10F |
  LDA #$00                                  ; $07C112 |
  LDY #$80                                  ; $07C114 |
code_07C116:
  STA $0100,y                               ; $07C116 |
  DEY                                       ; $07C119 |
  BNE code_07C116                           ; $07C11A |
  JSR code_07C120                           ; $07C11C |
code_07C11F:
  RTS                                       ; $07C11F |

code_07C120:
  LDX #$50                                  ; $07C120 |
  JSR code_07C844                           ; $07C122 |
  JSR code_07C820                           ; $07C125 |
  LDA #$00                                  ; $07C128 |
  STA $51                                   ; $07C12A |
  JSR code_07C8F5                           ; $07C12C |
  JSR code_07C578                           ; $07C12F |
  LDX #$C1                                  ; $07C132 |
  LDY #$45                                  ; $07C134 |
  STX $0B                                   ; $07C136 |
  STY $0A                                   ; $07C138 |
  JSR code_07C4BF                           ; $07C13A |
  JSR code_07C7F4                           ; $07C13D |
  LDX #$5A                                  ; $07C140 |
  JMP code_07C844                           ; $07C142 |

  db $A6, $21, $0D, $0A, $1D, $0A, $FF, $0E ; $07C145 |
  db $0A, $1C, $1D, $FF, $19, $1B, $0E, $1B ; $07C14D |
  db $1C, $0E, $17, $1D, $1C, $FE, $30, $20 ; $07C155 |
  db $10, $00                               ; $07C15D |

code_07C15F:
  TYA                                       ; $07C15F |
  PHA                                       ; $07C160 |
  LDX #$07                                  ; $07C161 |
code_07C163:
  TXA                                       ; $07C163 |
  PHA                                       ; $07C164 |
  LSR $25                                   ; $07C165 |
  ROR $24                                   ; $07C167 |
  ROR $23                                   ; $07C169 |
  BCC code_07C183                           ; $07C16B |
  LDY #$07                                  ; $07C16D |
  CLC                                       ; $07C16F |
code_07C170:
  LDA $061E,y                               ; $07C170 |
  ADC $C192,x                               ; $07C173 |
  CMP #$0A                                  ; $07C176 |
  BCC code_07C17C                           ; $07C178 |
  SBC #$0A                                  ; $07C17A |
code_07C17C:
  STA $061E,y                               ; $07C17C |
  DEX                                       ; $07C17F |
  DEY                                       ; $07C180 |
  BNE code_07C170                           ; $07C181 |
code_07C183:
  PLA                                       ; $07C183 |
  CLC                                       ; $07C184 |
  ADC #$07                                  ; $07C185 |
  TAX                                       ; $07C187 |
  LDA $23                                   ; $07C188 |
  ORA $24                                   ; $07C18A |
  ORA $25                                   ; $07C18C |
  BNE code_07C163                           ; $07C18E |
  PLA                                       ; $07C190 |
  TAY                                       ; $07C191 |
  RTS                                       ; $07C192 |

  db $00, $00, $00, $00, $00, $00, $01, $00 ; $07C193 |
  db $00, $00, $00, $00, $00, $02, $00, $00 ; $07C19B |
  db $00, $00, $00, $00, $04, $00, $00, $00 ; $07C1A3 |
  db $00, $00, $00, $08, $00, $00, $00, $00 ; $07C1AB |
  db $00, $01, $06, $00, $00, $00, $00, $00 ; $07C1B3 |
  db $03, $02, $00, $00, $00, $00, $00, $06 ; $07C1BB |
  db $04, $00, $00, $00, $00, $01, $02, $08 ; $07C1C3 |
  db $00, $00, $00, $00, $02, $05, $06, $00 ; $07C1CB |
  db $00, $00, $00, $05, $01, $02, $00, $00 ; $07C1D3 |
  db $00, $01, $00, $02, $04, $00, $00, $00 ; $07C1DB |
  db $02, $00, $04, $08, $00, $00, $00, $04 ; $07C1E3 |
  db $00, $09, $06, $00, $00, $00, $08, $01 ; $07C1EB |
  db $09, $02, $00, $00, $01, $06, $03, $08 ; $07C1F3 |
  db $04, $00, $00, $03, $02, $07, $06, $08 ; $07C1FB |
  db $00, $00, $06, $05, $05, $03, $06, $00 ; $07C203 |
  db $01, $03, $01, $00, $07, $02, $00, $02 ; $07C20B |
  db $06, $02, $01, $04, $04, $00, $05, $02 ; $07C213 |
  db $04, $02, $08, $08, $01, $00, $04, $08 ; $07C21B |
  db $05, $07, $06, $02, $00, $09, $07, $01 ; $07C223 |
  db $05, $02, $04, $01, $09, $04, $03, $00 ; $07C22B |
  db $04, $08, $03, $08, $08, $06, $00, $08 ; $07C233 |

code_07C23B:
  LDY #$07                                  ; $07C23B |
  LDA #$00                                  ; $07C23D |
code_07C23F:
  STA $061E,y                               ; $07C23F |
  DEY                                       ; $07C242 |
  BNE code_07C23F                           ; $07C243 |
  RTS                                       ; $07C245 |

code_07C246:
  LDY #$00                                  ; $07C246 |
  LDA #$FF                                  ; $07C248 |
code_07C24A:
  LDX $061F,y                               ; $07C24A |
  BNE code_07C257                           ; $07C24D |
  STA $061F,y                               ; $07C24F |
  INY                                       ; $07C252 |
  CPY #$06                                  ; $07C253 |
  BCC code_07C24A                           ; $07C255 |
code_07C257:
  RTS                                       ; $07C257 |

code_07C258:
  TXA                                       ; $07C258 |
  PHA                                       ; $07C259 |
  LDA #$00                                  ; $07C25A |
  STA $08                                   ; $07C25C |
  LDX #$08                                  ; $07C25E |
code_07C260:
  LSR $0D                                   ; $07C260 |
  BCC code_07C267                           ; $07C262 |
  CLC                                       ; $07C264 |
  ADC $0E                                   ; $07C265 |
code_07C267:
  ROR                                       ; $07C267 |
  ROR $08                                   ; $07C268 |
  DEX                                       ; $07C26A |
  BNE code_07C260                           ; $07C26B |
  STA $09                                   ; $07C26D |
  PLA                                       ; $07C26F |
  TAX                                       ; $07C270 |
  RTS                                       ; $07C271 |

code_07C272:
  TXA                                       ; $07C272 |
  PHA                                       ; $07C273 |
  LDA #$00                                  ; $07C274 |
  STA $10                                   ; $07C276 |
  LDX #$10                                  ; $07C278 |
  ROL $0D                                   ; $07C27A |
  ROL $0E                                   ; $07C27C |
code_07C27E:
  ROL $10                                   ; $07C27E |
  LDA $10                                   ; $07C280 |
  CMP $0F                                   ; $07C282 |
  BCC code_07C28A                           ; $07C284 |
  SBC $0F                                   ; $07C286 |
  STA $10                                   ; $07C288 |
code_07C28A:
  ROL $0D                                   ; $07C28A |
  ROL $0E                                   ; $07C28C |
  DEX                                       ; $07C28E |
  BNE code_07C27E                           ; $07C28F |
  PLA                                       ; $07C291 |
  TAX                                       ; $07C292 |
  RTS                                       ; $07C293 |

code_07C294:
  LDY #$1F                                  ; $07C294 |
  LDA #$0F                                  ; $07C296 |
code_07C298:
  STA $0200,y                               ; $07C298 |
  DEY                                       ; $07C29B |
  BPL code_07C298                           ; $07C29C |
  LDA #$01                                  ; $07C29E |
  STA $28                                   ; $07C2A0 |
  RTS                                       ; $07C2A2 |

code_07C2A3:
  JSR code_07C898                           ; $07C2A3 |
  JMP code_07C837                           ; $07C2A6 |

code_07C2A9:
  LDA $77                                   ; $07C2A9 |
code_07C2AB:
  PHA                                       ; $07C2AB |
  ASL                                       ; $07C2AC |
  ASL                                       ; $07C2AD |
  ASL                                       ; $07C2AE |
  ASL                                       ; $07C2AF |
  CLC                                       ; $07C2B0 |
  ADC $CC                                   ; $07C2B1 |
  STA $36                                   ; $07C2B3 |
  LDA $CD                                   ; $07C2B5 |
  ADC #$00                                  ; $07C2B7 |
  STA $37                                   ; $07C2B9 |
  PLA                                       ; $07C2BB |
  AND #$F0                                  ; $07C2BC |
  CLC                                       ; $07C2BE |
  ADC $CE                                   ; $07C2BF |
  JSR code_07D13A                           ; $07C2C1 |
  STA $38                                   ; $07C2C4 |
  LDA $CF                                   ; $07C2C6 |
  ADC #$00                                  ; $07C2C8 |
  STA $39                                   ; $07C2CA |
  RTS                                       ; $07C2CC |

code_07C2CD:
  LDA $C7                                   ; $07C2CD |
  STA $C8                                   ; $07C2CF |
  LDX #$01                                  ; $07C2D1 |
  STX $4016                                 ; $07C2D3 |
  DEX                                       ; $07C2D6 |
  STX $4016                                 ; $07C2D7 |
  LDY #$08                                  ; $07C2DA |
code_07C2DC:
  LDA $4016                                 ; $07C2DC |
  ROR                                       ; $07C2DF |
  BCS code_07C2E3                           ; $07C2E0 |
  ROR                                       ; $07C2E2 |
code_07C2E3:
  ROL $C7                                   ; $07C2E3 |
  DEY                                       ; $07C2E5 |
  BNE code_07C2DC                           ; $07C2E6 |
  LDA $C7                                   ; $07C2E8 |
  AND #$0F                                  ; $07C2EA |
  TAX                                       ; $07C2EC |
  LDA $C2F8,x                               ; $07C2ED |
  STA $84                                   ; $07C2F0 |
  LDA $C308,x                               ; $07C2F2 |
  STA $87                                   ; $07C2F5 |
  RTS                                       ; $07C2F7 |

  db $00, $04, $03, $00, $02, $00, $00, $00 ; $07C2F8 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $07C300 |
  db $00, $04, $03, $00, $02, $08, $07, $00 ; $07C308 |
  db $01, $06, $05, $00, $00, $00, $00, $00 ; $07C310 |

code_07C318:
  LDA #$00                                  ; $07C318 |
  TAX                                       ; $07C31A |
code_07C31B:
  STA $00,x                                 ; $07C31B |
  STA $0200,x                               ; $07C31D |
  STA $0300,x                               ; $07C320 |
  STA $0400,x                               ; $07C323 |
  STA $0500,x                               ; $07C326 |
  STA $0600,x                               ; $07C329 |
  INX                                       ; $07C32C |
  BNE code_07C31B                           ; $07C32D |
  LDA $2002                                 ; $07C32F |
  LDA #$90                                  ; $07C332 |
  STA $CA                                   ; $07C334 |
  LDA #$1E                                  ; $07C336 |
  STA $CB                                   ; $07C338 |
  JSR code_07C874                           ; $07C33A |
  JSR code_07C294                           ; $07C33D |
  JSR code_07C889                           ; $07C340 |
  LDA #$00                                  ; $07C343 |
  STA $4010                                 ; $07C345 |
  LDA #$80                                  ; $07C348 |
  STA $4017                                 ; $07C34A |
  JSR code_07C5A0                           ; $07C34D |
  JMP $8000                                 ; $07C350 |

code_07C353:
  JSR code_07C359                           ; $07C353 |
  JMP code_07C35D                           ; $07C356 |

code_07C359:
  LDX #$20                                  ; $07C359 |
  BNE code_07C35F                           ; $07C35B |
code_07C35D:
  LDX #$24                                  ; $07C35D |
code_07C35F:
  LDY #$00                                  ; $07C35F |
  JSR code_07C819                           ; $07C361 |
  LDX #$04                                  ; $07C364 |
  LDY #$C0                                  ; $07C366 |
  LDA #$FF                                  ; $07C368 |
code_07C36A:
  STA $2007                                 ; $07C36A |
  DEY                                       ; $07C36D |
  BNE code_07C36A                           ; $07C36E |
  DEX                                       ; $07C370 |
  BNE code_07C36A                           ; $07C371 |
  LDY #$40                                  ; $07C373 |
  LDA #$AA                                  ; $07C375 |
code_07C377:
  STA $2007                                 ; $07C377 |
  DEY                                       ; $07C37A |
  BNE code_07C377                           ; $07C37B |
  RTS                                       ; $07C37D |

code_07C37E:
  LDA #$04                                  ; $07C37E |
  STA $EC                                   ; $07C380 |
  JSR code_07C0E9                           ; $07C382 |
  LDA #$00                                  ; $07C385 |
  STA $DD                                   ; $07C387 |
  STA $E3                                   ; $07C389 |
  STA $D9                                   ; $07C38B |
  STA $DA                                   ; $07C38D |
  LDA $062C                                 ; $07C38F |
  BPL code_07C399                           ; $07C392 |
  LDA #$03                                  ; $07C394 |
  STA $062C                                 ; $07C396 |
code_07C399:
  LDA $062D                                 ; $07C399 |
  BNE code_07C3B1                           ; $07C39C |
  LDA #$03                                  ; $07C39E |
  STA $062D                                 ; $07C3A0 |
  LDA #$00                                  ; $07C3A3 |
  STA $0101                                 ; $07C3A5 |
  STA $0102                                 ; $07C3A8 |
  STA $0103                                 ; $07C3AB |
  STA $061E                                 ; $07C3AE |
code_07C3B1:
  LDA #$01                                  ; $07C3B1 |
  LDX $0627                                 ; $07C3B3 |
  BNE code_07C3BA                           ; $07C3B6 |
  STA $51                                   ; $07C3B8 |
code_07C3BA:
  LDX #$01                                  ; $07C3BA |
  STX $0627                                 ; $07C3BC |
  LDA $51                                   ; $07C3BF |
  ASL                                       ; $07C3C1 |
  TAY                                       ; $07C3C2 |
  LDA $C3D6,y                               ; $07C3C3 |
  STA $EA                                   ; $07C3C6 |
  LDA $C3D7,y                               ; $07C3C8 |
  STA $EB                                   ; $07C3CB |
  JSR code_07C3F0                           ; $07C3CD |
  LDA #$00                                  ; $07C3D0 |
  STA $52                                   ; $07C3D2 |
  JSR code_07D8EA                           ; $07C3D4 |
  RTS                                       ; $07C3D7 |

; Timer for each level (actually start at $07C3D6)
  db $2C, $01, $2C, $01, $90, $01, $90, $01 ; $07C3D8 | 
  db $2C, $01, $90, $01, $90, $01, $2C, $01 ; $07C3E0 |
  db $F4, $01, $2C, $01, $C8, $00, $F4, $01 ; $07C3E8 |

code_07C3F0:
  JSR code_07C8F5                           ; $07C3F0 |
  JSR code_07C419                           ; $07C3F3 |
  LDX #$24                                  ; $07C3F6 |
  JSR code_07F91E                           ; $07C3F8 |
  CLC                                       ; $07C3FB |
  LDA $51                                   ; $07C3FC |
  ADC #$27                                  ; $07C3FE |
  TAX                                       ; $07C400 |
  JSR code_07F91E                           ; $07C401 |
  LDX #$25                                  ; $07C404 |
  JSR code_07F91E                           ; $07C406 |
  LDA $062D                                 ; $07C409 |
  JSR code_07F8FA                           ; $07C40C |
  LDY #$19                                  ; $07C40F |
  JSR code_07FDD1                           ; $07C411 |
  LDX #$78                                  ; $07C414 |
  JMP code_07C844                           ; $07C416 |

code_07C419:
  JSR code_07C889                           ; $07C419 |
  JSR code_07C820                           ; $07C41C |
  JSR code_07FFAA                           ; $07C41F |
  JSR code_07CE42                           ; $07C422 |
  LDY #$0D                                  ; $07C425 |
  JSR code_07C57C                           ; $07C427 |
  LDA #$0E                                  ; $07C42A |
  STA $53                                   ; $07C42C |
  LDA #$00                                  ; $07C42E |
  STA $7C                                   ; $07C430 |
code_07C432:
  JSR code_07FD55                           ; $07C432 |
  JSR code_07C5E9                           ; $07C435 |
  INC $7C                                   ; $07C438 |
  LDA $7C                                   ; $07C43A |
  CMP #$08                                  ; $07C43C |
  BCC code_07C432                           ; $07C43E |
  JMP code_07C82F                           ; $07C440 |

code_07C443:
  LDX #$3C                                  ; $07C443 |
  JSR code_07C844                           ; $07C445 |
  LDA #$04                                  ; $07C448 |
  STA $EC                                   ; $07C44A |
  LDA #$30                                  ; $07C44C |
  JSR code_07C0D0                           ; $07C44E |
  DEC $062D                                 ; $07C451 |
  BEQ code_07C459                           ; $07C454 |
  JMP code_07C66A                           ; $07C456 |

code_07C459:
  JSR code_07C419                           ; $07C459 |
  LDX #$26                                  ; $07C45C |
  JSR code_07F91E                           ; $07C45E |
  INC $0628                                 ; $07C461 |
  LDA $0628                                 ; $07C464 |
  CMP #$04                                  ; $07C467 |
  BCC code_07C476                           ; $07C469 |
  LDX #$F0                                  ; $07C46B |
  JSR code_07C844                           ; $07C46D |
  JSR code_07C0E9                           ; $07C470 |
  JMP code_07C638                           ; $07C473 |

code_07C476:
  LDX #$27                                  ; $07C476 |
  JSR code_07F91E                           ; $07C478 |
  LDA #$01                                  ; $07C47B |
  STA $0627                                 ; $07C47D |
  LDA #$E4                                  ; $07C480 |
  STA $0701                                 ; $07C482 |
  LDA #$00                                  ; $07C485 |
  STA $0702                                 ; $07C487 |
  LDA #$58                                  ; $07C48A |
  STA $0703                                 ; $07C48C |
code_07C48F:
  LDY $0627                                 ; $07C48F |
  LDA $C4BD,y                               ; $07C492 |
  STA $0700                                 ; $07C495 |
  JSR code_07C851                           ; $07C498 |
  BCC code_07C48F                           ; $07C49B |
  AND #$EF                                  ; $07C49D |
  BEQ code_07C4AC                           ; $07C49F |
  LDA $0627                                 ; $07C4A1 |
  EOR #$01                                  ; $07C4A4 |
  STA $0627                                 ; $07C4A6 |
  JMP code_07C48F                           ; $07C4A9 |

code_07C4AC:
  LDA $C7                                   ; $07C4AC |
  AND #$10                                  ; $07C4AE |
  BEQ code_07C48F                           ; $07C4B0 |
  LDA $0627                                 ; $07C4B2 |
  BEQ code_07C4BA                           ; $07C4B5 |
  JMP code_07C66A                           ; $07C4B7 |

code_07C4BA:
  JMP code_07C638                           ; $07C4BA |

  db $80, $70                               ; $07C4BD |

code_07C4BF:
  LDA $2002                                 ; $07C4BF |
  LDY #$00                                  ; $07C4C2 |
code_07C4C4:
  LDA ($0A),y                               ; $07C4C4 |
  TAX                                       ; $07C4C6 |
  JSR code_07C4EC                           ; $07C4C7 |
  LDA ($0A),y                               ; $07C4CA |
  STA $2006                                 ; $07C4CC |
  STX $2006                                 ; $07C4CF |
code_07C4D2:
  JSR code_07C4EC                           ; $07C4D2 |
  LDA ($0A),y                               ; $07C4D5 |
  CMP #$FD                                  ; $07C4D7 |
  BEQ code_07C4E5                           ; $07C4D9 |
  CMP #$FE                                  ; $07C4DB |
  BEQ code_07C4EB                           ; $07C4DD |
  STA $2007                                 ; $07C4DF |
  JMP code_07C4D2                           ; $07C4E2 |

code_07C4E5:
  JSR code_07C4EC                           ; $07C4E5 |
  JMP code_07C4C4                           ; $07C4E8 |

code_07C4EB:
  RTS                                       ; $07C4EB |

code_07C4EC:
  INC $0A                                   ; $07C4EC |
  BNE code_07C4F2                           ; $07C4EE |
  INC $0B                                   ; $07C4F0 |
code_07C4F2:
  RTS                                       ; $07C4F2 |

code_07C4F3:
  STA $9FFF                                 ; $07C4F3 |
  LSR                                       ; $07C4F6 |
  STA $9FFF                                 ; $07C4F7 |
  LSR                                       ; $07C4FA |
  STA $9FFF                                 ; $07C4FB |
  LSR                                       ; $07C4FE |
  STA $9FFF                                 ; $07C4FF |
  LSR                                       ; $07C502 |
  STA $9FFF                                 ; $07C503 |
  RTS                                       ; $07C506 |

code_07C507:
  STA $BFFF                                 ; $07C507 |
  LSR                                       ; $07C50A |
  STA $BFFF                                 ; $07C50B |
  LSR                                       ; $07C50E |
  STA $BFFF                                 ; $07C50F |
  LSR                                       ; $07C512 |
  STA $BFFF                                 ; $07C513 |
  LSR                                       ; $07C516 |
  STA $BFFF                                 ; $07C517 |
  RTS                                       ; $07C51A |

code_07C51B:
  PHA                                       ; $07C51B |
  LDA #$00                                  ; $07C51C |
  STA $26                                   ; $07C51E |
  PLA                                       ; $07C520 |
  STA $DFFF                                 ; $07C521 |
  LSR                                       ; $07C524 |
  STA $DFFF                                 ; $07C525 |
  LSR                                       ; $07C528 |
  STA $DFFF                                 ; $07C529 |
  LSR                                       ; $07C52C |
  STA $DFFF                                 ; $07C52D |
  LSR                                       ; $07C530 |
  STA $DFFF                                 ; $07C531 |
  LDA #$01                                  ; $07C534 |
  STA $26                                   ; $07C536 |
  RTS                                       ; $07C538 |

code_07C539:
  STA $8E                                   ; $07C539 |
  LDA #$00                                  ; $07C53B |
  STA $26                                   ; $07C53D |
  LDA $8E                                   ; $07C53F |
  STA $FFFF                                 ; $07C541 |
  LSR                                       ; $07C544 |
  STA $FFFF                                 ; $07C545 |
  LSR                                       ; $07C548 |
  STA $FFFF                                 ; $07C549 |
  LSR                                       ; $07C54C |
  STA $FFFF                                 ; $07C54D |
  LSR                                       ; $07C550 |
  STA $FFFF                                 ; $07C551 |
  LDA #$01                                  ; $07C554 |
  STA $26                                   ; $07C556 |
  RTS                                       ; $07C558 |

code_07C559:
  INC $FFFF                                 ; $07C559 |
  LDA #$1E                                  ; $07C55C |
  JSR code_07C4F3                           ; $07C55E |
  LDA #$10                                  ; $07C561 |
  JSR code_07C507                           ; $07C563 |
  LDA #$0C                                  ; $07C566 |
  JSR code_07C51B                           ; $07C568 |
  LDA #$06                                  ; $07C56B |
  JSR code_07C539                           ; $07C56D |
code_07C570:
  LDA $53                                   ; $07C570 |
  CLC                                       ; $07C572 |
  ADC #$10                                  ; $07C573 |
  JMP code_07C507                           ; $07C575 |

code_07C578:
  STY $0C                                   ; $07C578 |
  LDY $51                                   ; $07C57A |
code_07C57C:
  LDA $C5C0,y                               ; $07C57C |
  LDY $0C                                   ; $07C57F |
  JMP code_07C51B                           ; $07C581 |

code_07C584:
  STY $0C                                   ; $07C584 |
  LDY $51                                   ; $07C586 |
  LDA $C5AD,y                               ; $07C588 |
  LDY $0C                                   ; $07C58B |
  JMP code_07C539                           ; $07C58D |

code_07C590:
  LDA #$00                                  ; $07C590 |
  BEQ code_07C539                           ; $07C592 |
code_07C594:
  LDA #$01                                  ; $07C594 |
  BNE code_07C539                           ; $07C596 |
  LDA #$02                                  ; $07C598 |
  BNE code_07C539                           ; $07C59A |
code_07C59C:
  LDA #$03                                  ; $07C59C |
  BNE code_07C539                           ; $07C59E |
code_07C5A0:
  LDA #$04                                  ; $07C5A0 |
  BNE code_07C539                           ; $07C5A2 |
code_07C5A4:
  LDA #$05                                  ; $07C5A4 |
  BNE code_07C539                           ; $07C5A6 |
code_07C5A8:
  LDA #$06                                  ; $07C5A8 |
code_07C5AA:
  JMP code_07C539                           ; $07C5AA |

  db $03, $03, $00, $00, $01, $02, $00, $01 ; $07C5AD |
  db $03, $01, $02, $03, $02, $03, $01, $01 ; $07C5B5 |
  db $01, $01, $03, $0D, $0A, $00, $01, $03 ; $07C5BD |
  db $07, $02, $04, $0B, $05, $08, $0C, $09 ; $07C5C5 |
  db $0E, $06, $06, $06, $06, $0E           ; $07C5CD |

code_07C5D3:
  LDA $28                                   ; $07C5D3 |
  BEQ code_07C5DA                           ; $07C5D5 |
  JSR code_07C621                           ; $07C5D7 |
code_07C5DA:
  LDA $2A                                   ; $07C5DA |
  BEQ code_07C5E1                           ; $07C5DC |
  JSR code_07C5E9                           ; $07C5DE |
code_07C5E1:
  LDA $29                                   ; $07C5E1 |
  BEQ code_07C5E8                           ; $07C5E3 |
  JSR code_07C601                           ; $07C5E5 |
code_07C5E8:
  RTS                                       ; $07C5E8 |

code_07C5E9:
  LDX $72                                   ; $07C5E9 |
  LDY $71                                   ; $07C5EB |
  JSR code_07C819                           ; $07C5ED |
  LDY #$00                                  ; $07C5F0 |
code_07C5F2:
  LDA ($73),y                               ; $07C5F2 |
  STA $2007                                 ; $07C5F4 |
  INY                                       ; $07C5F7 |
  CPY $2A                                   ; $07C5F8 |
  BCC code_07C5F2                           ; $07C5FA |
  LDA #$00                                  ; $07C5FC |
  STA $2A                                   ; $07C5FE |
  RTS                                       ; $07C600 |

code_07C601:
  LDY #$00                                  ; $07C601 |
code_07C603:
  LDA $0420,y                               ; $07C603 |
  STA $2006                                 ; $07C606 |
  LDA $0421,y                               ; $07C609 |
  STA $2006                                 ; $07C60C |
  LDA $0422,y                               ; $07C60F |
  STA $2007                                 ; $07C612 |
  INY                                       ; $07C615 |
  INY                                       ; $07C616 |
  INY                                       ; $07C617 |
  CPY $29                                   ; $07C618 |
  BCC code_07C603                           ; $07C61A |
  LDA #$00                                  ; $07C61C |
  STA $29                                   ; $07C61E |
  RTS                                       ; $07C620 |

code_07C621:
  LDX #$3F                                  ; $07C621 |
  LDY #$00                                  ; $07C623 |
  JSR code_07C819                           ; $07C625 |
code_07C628:
  LDA $0200,y                               ; $07C628 |
  STA $2007                                 ; $07C62B |
  INY                                       ; $07C62E |
  CPY #$20                                  ; $07C62F |
  BNE code_07C628                           ; $07C631 |
  LDA #$00                                  ; $07C633 |
  STA $28                                   ; $07C635 |
  RTS                                       ; $07C637 |

code_07C638:
  SEI                                       ; $07C638 |
  CLD                                       ; $07C639 |
  LDA #$00                                  ; $07C63A |
  STA $EC                                   ; $07C63C |
  STA $2000                                 ; $07C63E |
  STA $2001                                 ; $07C641 |
  LDX #$FF                                  ; $07C644 |
  TXS                                       ; $07C646 |
code_07C647:
  LDA $2002                                 ; $07C647 |
  BPL code_07C647                           ; $07C64A |
code_07C64C:
  LDA $2002                                 ; $07C64C |
  BPL code_07C64C                           ; $07C64F |
  LDA #$00                                  ; $07C651 |
  STA $2000                                 ; $07C653 |
  STA $2001                                 ; $07C656 |
  STA $53                                   ; $07C659 |
  JSR code_07C559                           ; $07C65B |
  JSR code_07C5A0                           ; $07C65E |
  JSR code_07C318                           ; $07C661 |
  JSR code_07C0FF                           ; $07C664 |
  JMP code_07C726                           ; $07C667 |

code_07C66A:
  LDX #$FF                                  ; $07C66A |
  TXS                                       ; $07C66C |
  LDA $51                                   ; $07C66D |
  CMP #$0D                                  ; $07C66F |
  BNE code_07C676                           ; $07C671 |
  JMP code_07C72C                           ; $07C673 |

code_07C676:
  JSR code_07C5A8                           ; $07C676 |
  JSR code_07C37E                           ; $07C679 |
  JSR code_07D128                           ; $07C67C |
  LDA #$05                                  ; $07C67F |
  STA $EC                                   ; $07C681 |
code_07C683:
  JSR code_07C837                           ; $07C683 |
  JSR code_07C5A8                           ; $07C686 |
  LDA #$00                                  ; $07C689 |
  STA $75                                   ; $07C68B |
  LDA $DD                                   ; $07C68D |
  BNE code_07C6A0                           ; $07C68F |
  JSR code_07EB6C                           ; $07C691 |
  BCS code_07C6B9                           ; $07C694 |
  LDA $A8                                   ; $07C696 |
  BMI code_07C69D                           ; $07C698 |
  JSR code_07F176                           ; $07C69A |
code_07C69D:
  JSR code_07D89F                           ; $07C69D |
code_07C6A0:
  JSR code_07D15E                           ; $07C6A0 |
  JSR code_07EECE                           ; $07C6A3 |
  LDA $DD                                   ; $07C6A6 |
  BNE code_07C6B0                           ; $07C6A8 |
  JSR code_07E8CD                           ; $07C6AA |
  JSR code_07E9F6                           ; $07C6AD |
code_07C6B0:
  JSR code_07D8CE                           ; $07C6B0 |
  JSR code_07D8B2                           ; $07C6B3 |
  JSR code_07C981                           ; $07C6B6 |
code_07C6B9:
  JSR code_07D128                           ; $07C6B9 |
  LDA $51                                   ; $07C6BC |
  CMP #$0B                                  ; $07C6BE |
  BNE code_07C6F4                           ; $07C6C0 |
  LDY $75                                   ; $07C6C2 |
  BNE code_07C6EF                           ; $07C6C4 |
  INC $0629                                 ; $07C6C6 |
  LDA $0629                                 ; $07C6C9 |
  BNE code_07C6F4                           ; $07C6CC |
  DEC $0629                                 ; $07C6CE |
  LDA $7C                                   ; $07C6D1 |
  LSR                                       ; $07C6D3 |
  LSR                                       ; $07C6D4 |
  LSR                                       ; $07C6D5 |
  AND #$07                                  ; $07C6D6 |
  TAX                                       ; $07C6D8 |
  LDA #$3F                                  ; $07C6D9 |
  STA $0420,y                               ; $07C6DB |
  LDA #$05                                  ; $07C6DE |
  STA $0421,y                               ; $07C6E0 |
  LDA $C71E,x                               ; $07C6E3 |
  STA $0422,y                               ; $07C6E6 |
  CLC                                       ; $07C6E9 |
  TYA                                       ; $07C6EA |
  ADC #$03                                  ; $07C6EB |
  BNE code_07C6F6                           ; $07C6ED |
code_07C6EF:
  LDA #$00                                  ; $07C6EF |
  STA $0629                                 ; $07C6F1 |
code_07C6F4:
  LDA $75                                   ; $07C6F4 |
code_07C6F6:
  STA $29                                   ; $07C6F6 |
  INC $7D                                   ; $07C6F8 |
  LDA $DF                                   ; $07C6FA |
  BEQ code_07C71B                           ; $07C6FC |
  LDA #$19                                  ; $07C6FE |
  JSR code_07C0B7                           ; $07C700 |
  JSR code_07C0F9                           ; $07C703 |
  LDA #$01                                  ; $07C706 |
  STA $DF                                   ; $07C708 |
code_07C70A:
  LDA #$00                                  ; $07C70A |
  STA $061A                                 ; $07C70C |
  LDA $DF                                   ; $07C70F |
  BNE code_07C70A                           ; $07C711 |
  LDA #$1A                                  ; $07C713 |
  JSR code_07C0B7                           ; $07C715 |
  JSR code_07C0F9                           ; $07C718 |
code_07C71B:
  JMP code_07C683                           ; $07C71B |

  db $0C, $1C, $2C, $3C, $2C, $1C, $0C, $0C ; $07C71E |

code_07C726:
  JSR code_07C590                           ; $07C726 |
  JMP $B038                                 ; $07C729 |

code_07C72C:
  LDA #$06                                  ; $07C72C |
  STA $EC                                   ; $07C72E |
  JSR code_07C590                           ; $07C730 |
  JMP $B03B                                 ; $07C733 |

  JSR code_07C590                           ; $07C736 |
  JMP $B03E                                 ; $07C739 |

code_07C73C:
  LDA $8E                                   ; $07C73C |
  PHA                                       ; $07C73E |
  JSR code_07C5A0                           ; $07C73F |
  JSR $B400                                 ; $07C742 |
  PLA                                       ; $07C745 |
  BPL code_07C79E                           ; $07C746 |
code_07C748:
  LDA $8E                                   ; $07C748 |
  PHA                                       ; $07C74A |
  JSR code_07C5A0                           ; $07C74B |
  JSR $B409                                 ; $07C74E |
  PLA                                       ; $07C751 |
  BPL code_07C79E                           ; $07C752 |
code_07C754:
  LDA $8E                                   ; $07C754 |
  PHA                                       ; $07C756 |
  JSR code_07C5A0                           ; $07C757 |
  JSR $B403                                 ; $07C75A |
  PLA                                       ; $07C75D |
  BPL code_07C79E                           ; $07C75E |
code_07C760:
  LDA $8E                                   ; $07C760 |
  PHA                                       ; $07C762 |
  JSR code_07C5A0                           ; $07C763 |
  JSR $B406                                 ; $07C766 |
  PLA                                       ; $07C769 |
  BPL code_07C79E                           ; $07C76A |
code_07C76C:
  LDA $8E                                   ; $07C76C |
  PHA                                       ; $07C76E |
  JSR code_07C590                           ; $07C76F |
  JSR $B041                                 ; $07C772 |
  PLA                                       ; $07C775 |
  BPL code_07C79E                           ; $07C776 |
code_07C778:
  STA $0C                                   ; $07C778 |
  LDA $8E                                   ; $07C77A |
  PHA                                       ; $07C77C |
  JSR code_07C590                           ; $07C77D |
  LDA $0C                                   ; $07C780 |
  JSR $B044                                 ; $07C782 |
  PLA                                       ; $07C785 |
  BPL code_07C79E                           ; $07C786 |
code_07C788:
  LDA $8E                                   ; $07C788 |
  PHA                                       ; $07C78A |
  JSR code_07C590                           ; $07C78B |
  JSR $B047                                 ; $07C78E |
  PLA                                       ; $07C791 |
  BPL code_07C79E                           ; $07C792 |
code_07C794:
  LDA $8E                                   ; $07C794 |
  PHA                                       ; $07C796 |
  JSR code_07C590                           ; $07C797 |
  JSR $B04D                                 ; $07C79A |
  PLA                                       ; $07C79D |
code_07C79E:
  JMP code_07C5AA                           ; $07C79E |

code_07C7A1:
  LDA $8E                                   ; $07C7A1 |
  PHA                                       ; $07C7A3 |
  JSR code_07C590                           ; $07C7A4 |
  JSR $B050                                 ; $07C7A7 |
  PLA                                       ; $07C7AA |
  BPL code_07C79E                           ; $07C7AB |
code_07C7AD:
  LDA $8E                                   ; $07C7AD |
  PHA                                       ; $07C7AF |
  JSR code_07C590                           ; $07C7B0 |
  JSR $B053                                 ; $07C7B3 |
  PLA                                       ; $07C7B6 |
  BPL code_07C79E                           ; $07C7B7 |
code_07C7B9:
  LDA $8E                                   ; $07C7B9 |
  PHA                                       ; $07C7BB |
  JSR code_07C590                           ; $07C7BC |
  JSR $B056                                 ; $07C7BF |
  INC $FFFF                                 ; $07C7C2 |
  PLA                                       ; $07C7C5 |
  BPL code_07C79E                           ; $07C7C6 |
code_07C7C8:
  STA $0C                                   ; $07C7C8 |
  LDA $8E                                   ; $07C7CA |
  PHA                                       ; $07C7CC |
  JSR code_07C590                           ; $07C7CD |
  LDA $0C                                   ; $07C7D0 |
  JSR $B059                                 ; $07C7D2 |
  PLA                                       ; $07C7D5 |
  BPL code_07C79E                           ; $07C7D6 |
code_07C7D8:
  STA $0C                                   ; $07C7D8 |
  LDA $8E                                   ; $07C7DA |
  PHA                                       ; $07C7DC |
  JSR code_07C590                           ; $07C7DD |
  LDA $0C                                   ; $07C7E0 |
  JSR $B05C                                 ; $07C7E2 |
  PLA                                       ; $07C7E5 |
  BPL code_07C79E                           ; $07C7E6 |
code_07C7E8:
  LDA $8E                                   ; $07C7E8 |
  PHA                                       ; $07C7EA |
  JSR code_07C590                           ; $07C7EB |
  JSR $B062                                 ; $07C7EE |
  PLA                                       ; $07C7F1 |
  BPL code_07C79E                           ; $07C7F2 |
code_07C7F4:
  LDA $8E                                   ; $07C7F4 |
  PHA                                       ; $07C7F6 |
  JSR code_07C5A0                           ; $07C7F7 |
  JSR $B40C                                 ; $07C7FA |
  PLA                                       ; $07C7FD |
  BPL code_07C79E                           ; $07C7FE |
code_07C800:
  LDA $8E                                   ; $07C800 |
  PHA                                       ; $07C802 |
  JSR code_07C5A0                           ; $07C803 |
  JSR $B40F                                 ; $07C806 |
  PLA                                       ; $07C809 |
  BPL code_07C79E                           ; $07C80A |
code_07C80C:
  LDA $8E                                   ; $07C80C |
  PHA                                       ; $07C80E |
  JSR code_07C5A0                           ; $07C80F |
  JSR $B412                                 ; $07C812 |
  PLA                                       ; $07C815 |
  JMP code_07C5AA                           ; $07C816 |

code_07C819:
  STX $2006                                 ; $07C819 |
  STY $2006                                 ; $07C81C |
  RTS                                       ; $07C81F |

code_07C820:
  LDA $2002                                 ; $07C820 |
  BPL code_07C820                           ; $07C823 |
  LDA #$00                                  ; $07C825 |
  STA $2000                                 ; $07C827 |
  STA $2001                                 ; $07C82A |
  BEQ code_07C834                           ; $07C82D |
code_07C82F:
  JSR code_07C874                           ; $07C82F |
  LDA #$01                                  ; $07C832 |
code_07C834:
  STA $26                                   ; $07C834 |
  RTS                                       ; $07C836 |

code_07C837:
  LDA $7C                                   ; $07C837 |
  STA $0D                                   ; $07C839 |
code_07C83B:
  INC $8B                                   ; $07C83B |
  LDA $7C                                   ; $07C83D |
  CMP $0D                                   ; $07C83F |
  BEQ code_07C83B                           ; $07C841 |
  RTS                                       ; $07C843 |

code_07C844:
  JSR code_07C837                           ; $07C844 |
  DEX                                       ; $07C847 |
  BNE code_07C844                           ; $07C848 |
  RTS                                       ; $07C84A |

code_07C84B:
  JSR code_07C851                           ; $07C84B |
  BCC code_07C84B                           ; $07C84E |
  RTS                                       ; $07C850 |

code_07C851:
  LDA $C7                                   ; $07C851 |
  STA $C9                                   ; $07C853 |
  JSR code_07C837                           ; $07C855 |
  LDA $C7                                   ; $07C858 |
  EOR $C9                                   ; $07C85A |
  AND $C7                                   ; $07C85C |
  BEQ code_07C862                           ; $07C85E |
  SEC                                       ; $07C860 |
  RTS                                       ; $07C861 |

code_07C862:
  CLC                                       ; $07C862 |
  RTS                                       ; $07C863 |

code_07C864:
  LDA $CA                                   ; $07C864 |
  AND #$FC                                  ; $07C866 |
  STA $2000                                 ; $07C868 |
  LDA #$00                                  ; $07C86B |
  STA $2005                                 ; $07C86D |
  STA $2005                                 ; $07C870 |
  RTS                                       ; $07C873 |

code_07C874:
  LDA $CA                                   ; $07C874 |
  STA $2000                                 ; $07C876 |
  LDA $CB                                   ; $07C879 |
  STA $2001                                 ; $07C87B |
  LDA $CC                                   ; $07C87E |
  STA $2005                                 ; $07C880 |
  LDA $CE                                   ; $07C883 |
  STA $2005                                 ; $07C885 |
  RTS                                       ; $07C888 |

code_07C889:
  JSR code_07C820                           ; $07C889 |
  JSR code_07C353                           ; $07C88C |
  JSR code_07C898                           ; $07C88F |
  JSR code_07C82F                           ; $07C892 |
  JMP code_07C837                           ; $07C895 |

code_07C898:
  LDX #$00                                  ; $07C898 |
  LDY #$40                                  ; $07C89A |
  LDA #$F0                                  ; $07C89C |
code_07C89E:
  STA $0700,x                               ; $07C89E |
  INX                                       ; $07C8A1 |
  INX                                       ; $07C8A2 |
  INX                                       ; $07C8A3 |
  INX                                       ; $07C8A4 |
  DEY                                       ; $07C8A5 |
  BNE code_07C89E                           ; $07C8A6 |
  RTS                                       ; $07C8A8 |

code_07C8A9:
  JSR code_07C8B1                           ; $07C8A9 |
  LDA #$01                                  ; $07C8AC |
  STA $28                                   ; $07C8AE |
  RTS                                       ; $07C8B0 |

code_07C8B1:
  STA $0D                                   ; $07C8B1 |
  TXA                                       ; $07C8B3 |
  PHA                                       ; $07C8B4 |
  TYA                                       ; $07C8B5 |
  PHA                                       ; $07C8B6 |
  LDA #$0C                                  ; $07C8B7 |
  STA $0E                                   ; $07C8B9 |
  LDA $8E                                   ; $07C8BB |
  PHA                                       ; $07C8BD |
  JSR code_07C59C                           ; $07C8BE |
  JSR code_07C258                           ; $07C8C1 |
  CLC                                       ; $07C8C4 |
  LDA $08                                   ; $07C8C5 |
  ADC #$A4                                  ; $07C8C7 |
  STA $00                                   ; $07C8C9 |
  LDA $09                                   ; $07C8CB |
  ADC #$A7                                  ; $07C8CD |
  STA $01                                   ; $07C8CF |
  LDY #$00                                  ; $07C8D1 |
code_07C8D3:
  LDA ($00),y                               ; $07C8D3 |
  LDX $C8E9,y                               ; $07C8D5 |
  STA $0210,x                               ; $07C8D8 |
  INY                                       ; $07C8DB |
  CPY #$0C                                  ; $07C8DC |
  BCC code_07C8D3                           ; $07C8DE |
  PLA                                       ; $07C8E0 |
  JSR code_07C5AA                           ; $07C8E1 |
  PLA                                       ; $07C8E4 |
  TAY                                       ; $07C8E5 |
  PLA                                       ; $07C8E6 |
  TAX                                       ; $07C8E7 |
  RTS                                       ; $07C8E8 |

  db $01, $02, $03, $05, $06, $07, $09, $0A ; $07C8E9 |
  db $0B, $0D, $0E, $0F                     ; $07C8F1 |

code_07C8F5:
  JSR code_07C8FD                           ; $07C8F5 |
  LDA #$01                                  ; $07C8F8 |
  STA $28                                   ; $07C8FA |
  RTS                                       ; $07C8FC |

code_07C8FD:
  LDA $51                                   ; $07C8FD |
  CMP #$06                                  ; $07C8FF |
  BNE code_07C915                           ; $07C901 |
  LDA $52                                   ; $07C903 |
  CMP #$01                                  ; $07C905 |
  BNE code_07C90D                           ; $07C907 |
  LDA #$13                                  ; $07C909 |
  BNE code_07C928                           ; $07C90B |
code_07C90D:
  CMP #$02                                  ; $07C90D |
  BNE code_07C923                           ; $07C90F |
  LDA #$14                                  ; $07C911 |
  BNE code_07C928                           ; $07C913 |
code_07C915:
  CMP #$0C                                  ; $07C915 |
  BNE code_07C923                           ; $07C917 |
  LDA $52                                   ; $07C919 |
  CMP #$0B                                  ; $07C91B |
  BCC code_07C923                           ; $07C91D |
  LDA #$15                                  ; $07C91F |
  BNE code_07C928                           ; $07C921 |
code_07C923:
  LDY $51                                   ; $07C923 |
  LDA $C96E,y                               ; $07C925 |
code_07C928:
  STA $0D                                   ; $07C928 |
  LDA #$0D                                  ; $07C92A |
  STA $0E                                   ; $07C92C |
  LDA $8E                                   ; $07C92E |
  PHA                                       ; $07C930 |
  JSR code_07C59C                           ; $07C931 |
  JSR code_07C258                           ; $07C934 |
  CLC                                       ; $07C937 |
  LDA $08                                   ; $07C938 |
  ADC #$94                                  ; $07C93A |
  STA $00                                   ; $07C93C |
  LDA $09                                   ; $07C93E |
  ADC #$A8                                  ; $07C940 |
  STA $01                                   ; $07C942 |
  LDY #$00                                  ; $07C944 |
  LDA ($00),y                               ; $07C946 |
code_07C948:
  LDX $C966,y                               ; $07C948 |
  STA $0200,x                               ; $07C94B |
  INY                                       ; $07C94E |
  CPY #$08                                  ; $07C94F |
  BCC code_07C948                           ; $07C951 |
  LDY #$01                                  ; $07C953 |
code_07C955:
  LDA ($00),y                               ; $07C955 |
  LDX $C8E8,y                               ; $07C957 |
  STA $0200,x                               ; $07C95A |
  INY                                       ; $07C95D |
  CPY #$0D                                  ; $07C95E |
  BCC code_07C955                           ; $07C960 |
  PLA                                       ; $07C962 |
  JMP code_07C5AA                           ; $07C963 |

  db $00, $04, $08, $0C, $10, $14, $18, $1C ; $07C966 |
  
  db $0D, $0A, $00, $01, $03, $07, $02, $04 ; $07C96E |
  db $0B, $05, $08, $0C, $09, $0E, $06, $0F ; $07C976 |
  db $10, $11, $0E                          ; $07C97E |

code_07C981:
  LDA $AD                                   ; $07C981 |
  BEQ code_07C98E                           ; $07C983 |
  JSR code_07C98F                           ; $07C985 |
  JSR code_07C993                           ; $07C988 |
  JSR code_07C9E1                           ; $07C98B |
code_07C98E:
  RTS                                       ; $07C98E |

code_07C98F:
  JSR code_07CE11                           ; $07C98F |
  RTS                                       ; $07C992 |

code_07C993:
  SEC                                       ; $07C993 |
  LDA $CC                                   ; $07C994 |
  SBC $46                                   ; $07C996 |
  LDA $CD                                   ; $07C998 |
  SBC $47                                   ; $07C99A |
  BCC code_07C9BD                           ; $07C99C |
  LDA $9A                                   ; $07C99E |
  BMI code_07C9E0                           ; $07C9A0 |
  LDA $7E                                   ; $07C9A2 |
  BEQ code_07C9AC                           ; $07C9A4 |
  LDA $85                                   ; $07C9A6 |
  CMP #$04                                  ; $07C9A8 |
  BEQ code_07C9E0                           ; $07C9AA |
code_07C9AC:
  CLC                                       ; $07C9AC |
  LDA $46                                   ; $07C9AD |
  ADC #$10                                  ; $07C9AF |
  STA $46                                   ; $07C9B1 |
  LDA $47                                   ; $07C9B3 |
  ADC #$00                                  ; $07C9B5 |
  STA $47                                   ; $07C9B7 |
  LDA #$04                                  ; $07C9B9 |
  BNE code_07C9DA                           ; $07C9BB |
code_07C9BD:
  LDA $9A                                   ; $07C9BD |
  BPL code_07C9E0                           ; $07C9BF |
  LDA $7E                                   ; $07C9C1 |
  BEQ code_07C9CB                           ; $07C9C3 |
  LDA $85                                   ; $07C9C5 |
  CMP #$03                                  ; $07C9C7 |
  BEQ code_07C9E0                           ; $07C9C9 |
code_07C9CB:
  SEC                                       ; $07C9CB |
  LDA $46                                   ; $07C9CC |
  SBC #$10                                  ; $07C9CE |
  STA $46                                   ; $07C9D0 |
  LDA $47                                   ; $07C9D2 |
  SBC #$00                                  ; $07C9D4 |
  STA $47                                   ; $07C9D6 |
  LDA #$03                                  ; $07C9D8 |
code_07C9DA:
  STA $85                                   ; $07C9DA |
  LDA #$01                                  ; $07C9DC |
  STA $7E                                   ; $07C9DE |
code_07C9E0:
  RTS                                       ; $07C9E0 |

code_07C9E1:
  LDY $7E                                   ; $07C9E1 |
  BEQ code_07CA07                           ; $07C9E3 |
  LDA $CA07,y                               ; $07C9E5 |
  TAY                                       ; $07C9E8 |
  LDA #$C9                                  ; $07C9E9 |
  PHA                                       ; $07C9EB |
  LDA #$F7                                  ; $07C9EC |
  PHA                                       ; $07C9EE |
  LDA $CA10,y                               ; $07C9EF |
  PHA                                       ; $07C9F2 |
  LDA $CA0F,y                               ; $07C9F3 |
  PHA                                       ; $07C9F6 |
  RTS                                       ; $07C9F7 |

  INC $7E                                   ; $07C9F8 |
  LDA $7E                                   ; $07C9FA |
  CMP #$08                                  ; $07C9FC |
  BCC code_07CA07                           ; $07C9FE |
  LDA #$00                                  ; $07CA00 |
  STA $7E                                   ; $07CA02 |
  JSR code_07D128                           ; $07CA04 |
code_07CA07:
  RTS                                       ; $07CA07 |

  db $00, $02, $02, $02, $02, $02, $02      ; $07CA08 |
  dw $CA12                                  ; $07CA0F |
  dw $CA31                                  ; $07CA11 |

  LDA $85                                   ; $07CA13 |
  ASL                                       ; $07CA15 |
  TAY                                       ; $07CA16 |
  CLC                                       ; $07CA17 |
  LDA $46                                   ; $07CA18 |
  ADC $CA5E,y                               ; $07CA1A |
  STA $42                                   ; $07CA1D |
  LDA $47                                   ; $07CA1F |
  ADC $CA5F,y                               ; $07CA21 |
  STA $43                                   ; $07CA24 |
  LDA #$20                                  ; $07CA26 |
  STA $44                                   ; $07CA28 |
  LDA #$00                                  ; $07CA2A |
  STA $45                                   ; $07CA2C |
  LDA #$01                                  ; $07CA2E |
  BNE code_07CA34                           ; $07CA30 |
  LDA #$02                                  ; $07CA32 |
code_07CA34:
  STA $7F                                   ; $07CA34 |
code_07CA36:
  JSR code_07CF43                           ; $07CA36 |
code_07CA39:
  LDX #$03                                  ; $07CA39 |
code_07CA3B:
  LDA $42,x                                 ; $07CA3B |
  STA $36,x                                 ; $07CA3D |
  DEX                                       ; $07CA3F |
  BPL code_07CA3B                           ; $07CA40 |
  JSR code_07CF12                           ; $07CA42 |
  LDX $35                                   ; $07CA45 |
  CLC                                       ; $07CA47 |
  LDA $42,x                                 ; $07CA48 |
  ADC #$10                                  ; $07CA4A |
  LDX $35                                   ; $07CA4C |
  BEQ code_07CA53                           ; $07CA4E |
  JSR code_07D13A                           ; $07CA50 |
code_07CA53:
  STA $42,x                                 ; $07CA53 |
  LDA $43,x                                 ; $07CA55 |
  ADC #$00                                  ; $07CA57 |
  STA $43,x                                 ; $07CA59 |
  DEC $7F                                   ; $07CA5B |
  BNE code_07CA39                           ; $07CA5D |
  RTS                                       ; $07CA5F |

  db $00, $00, $00, $00, $80, $FF, $70, $01 ; $07CA60 |

code_07CA68:
  LDY $86                                   ; $07CA68 |
  LDA $A7                                   ; $07CA6A |
  AND $CAC0,y                               ; $07CA6C |
  BEQ code_07CABC                           ; $07CA6F |
  JSR code_07CAC5                           ; $07CA71 |
  LDY $86                                   ; $07CA74 |
  LDA $A8                                   ; $07CA76 |
  AND $CABD,y                               ; $07CA78 |
  STA $A8                                   ; $07CA7B |
  JSR code_07CBC3                           ; $07CA7D |
  LDA $AB                                   ; $07CA80 |
  STA $0D                                   ; $07CA82 |
  JSR code_07CB65                           ; $07CA84 |
  LDA $9A                                   ; $07CA87 |
  STA $00                                   ; $07CA89 |
  LDA $9B                                   ; $07CA8B |
  STA $01                                   ; $07CA8D |
  LDA $9C                                   ; $07CA8F |
  STA $02                                   ; $07CA91 |
  LDA $9D                                   ; $07CA93 |
  STA $03                                   ; $07CA95 |
  JSR code_07CAD3                           ; $07CA97 |
  BCC code_07CABC                           ; $07CA9A |
  LDY $86                                   ; $07CA9C |
  LDA $A8                                   ; $07CA9E |
  ORA $CAC1,y                               ; $07CAA0 |
  STA $A8                                   ; $07CAA3 |
  LDX $1A                                   ; $07CAA5 |
  CLC                                       ; $07CAA7 |
  LDA $92,x                                 ; $07CAA8 |
  ADC $05                                   ; $07CAAA |
  STA $92,x                                 ; $07CAAC |
  LDA $91,x                                 ; $07CAAE |
  ADC $04                                   ; $07CAB0 |
  STA $91,x                                 ; $07CAB2 |
  LDA $01,x                                 ; $07CAB4 |
  STA $9B,x                                 ; $07CAB6 |
  LDA $00,x                                 ; $07CAB8 |
  STA $9A,x                                 ; $07CABA |
code_07CABC:
  RTS                                       ; $07CABC |

  db $F7, $FE, $FD,                         ; $07CABD |
  db $FD, $08, $01, $02, $02                ; $07CAC0 |

code_07CAC5:
  DEC $86                                   ; $07CAC5 |
  LDA $86                                   ; $07CAC7 |
  AND #$02                                  ; $07CAC9 |
  EOR #$02                                  ; $07CACB |
  STA $1A                                   ; $07CACD |
  LSR                                       ; $07CACF |
  STA $1B                                   ; $07CAD0 |
  RTS                                       ; $07CAD2 |

code_07CAD3:
  JSR code_07CB9D                           ; $07CAD3 |
  BNE code_07CADA                           ; $07CAD6 |
  CLC                                       ; $07CAD8 |
  RTS                                       ; $07CAD9 |

code_07CADA:
  LDX $1A                                   ; $07CADA |
  LDA $36,x                                 ; $07CADC |
  STA $06                                   ; $07CADE |
  LDA $48,x                                 ; $07CAE0 |
  STA $07                                   ; $07CAE2 |
  INC $5A                                   ; $07CAE4 |
  INC $5A                                   ; $07CAE6 |
code_07CAE8:
  LDX $1A                                   ; $07CAE8 |
  LDY $86                                   ; $07CAEA |
  CLC                                       ; $07CAEC |
  LDA $36,x                                 ; $07CAED |
  ADC $CB41,y                               ; $07CAEF |
  STA $36,x                                 ; $07CAF2 |
  LSR                                       ; $07CAF4 |
  LSR                                       ; $07CAF5 |
  LSR                                       ; $07CAF6 |
  LSR                                       ; $07CAF7 |
  LDX $1B                                   ; $07CAF8 |
  CMP $59,x                                 ; $07CAFA |
  BNE code_07CB03                           ; $07CAFC |
  JSR code_07CB9D                           ; $07CAFE |
  BNE code_07CAE8                           ; $07CB01 |
code_07CB03:
  LDX $1A                                   ; $07CB03 |
  LDA $00,x                                 ; $07CB05 |
  BMI code_07CB15                           ; $07CB07 |
  LDA $36,x                                 ; $07CB09 |
  ORA #$03                                  ; $07CB0B |
  STA $36,x                                 ; $07CB0D |
  LDA #$FF                                  ; $07CB0F |
  STA $48,x                                 ; $07CB11 |
  BNE code_07CB1F                           ; $07CB13 |
code_07CB15:
  LDA $36,x                                 ; $07CB15 |
  AND #$FC                                  ; $07CB17 |
  STA $36,x                                 ; $07CB19 |
  LDA #$00                                  ; $07CB1B |
  STA $48,x                                 ; $07CB1D |
code_07CB1F:
  SEC                                       ; $07CB1F |
  LDA $07                                   ; $07CB20 |
  SBC $48,x                                 ; $07CB22 |
  STA $05                                   ; $07CB24 |
  LDA $06                                   ; $07CB26 |
  SBC $36,x                                 ; $07CB28 |
  STA $04                                   ; $07CB2A |
  SEC                                       ; $07CB2C |
  LDA $01,x                                 ; $07CB2D |
  SBC $05                                   ; $07CB2F |
  STA $05                                   ; $07CB31 |
  LDA $00,x                                 ; $07CB33 |
  SBC $04                                   ; $07CB35 |
  STA $04                                   ; $07CB37 |
  LDA #$00                                  ; $07CB39 |
  STA $01,x                                 ; $07CB3B |
  STA $00,x                                 ; $07CB3D |
  SEC                                       ; $07CB3F |
  RTS                                       ; $07CB40 |

  db $04, $FC, $04, $FC, $00, $00, $FF, $FF ; $07CB41 |
  db $00, $FF, $FF, $00, $CC, $CC, $33, $33 ; $07CB49 |
  db $01, $37, $08, $CE, $00, $17, $00, $8E ; $07CB51 |
  db $17, $FF, $8E, $FF, $CC, $00, $00, $00 ; $07CB59 |
  db $FF, $00, $00, $00                     ; $07CB61 |

code_07CB65:
  LDA $8E                                   ; $07CB65 |
  PHA                                       ; $07CB67 |
  JSR code_07C584                           ; $07CB68 |
  LDA $5E                                   ; $07CB6B |
  ASL                                       ; $07CB6D |
  STA $0A                                   ; $07CB6E |
  LDA #$00                                  ; $07CB70 |
  ROL                                       ; $07CB72 |
  STA $0B                                   ; $07CB73 |
  CLC                                       ; $07CB75 |
  LDA $82                                   ; $07CB76 |
  ADC $0A                                   ; $07CB78 |
  STA $0A                                   ; $07CB7A |
  LDA $83                                   ; $07CB7C |
  ADC $0B                                   ; $07CB7E |
  STA $0B                                   ; $07CB80 |
  LDA $0D                                   ; $07CB82 |
  AND #$01                                  ; $07CB84 |
  TAY                                       ; $07CB86 |
  LDA ($0A),y                               ; $07CB87 |
  STA $17                                   ; $07CB89 |
  AND #$0F                                  ; $07CB8B |
  ASL                                       ; $07CB8D |
  TAY                                       ; $07CB8E |
  LDA $CB45,y                               ; $07CB8F |
  STA $0D                                   ; $07CB92 |
  LDA $CB46,y                               ; $07CB94 |
  STA $0E                                   ; $07CB97 |
  PLA                                       ; $07CB99 |
  JMP code_07C5AA                           ; $07CB9A |

code_07CB9D:
  LDA $36                                   ; $07CB9D |
  LSR                                       ; $07CB9F |
  LSR                                       ; $07CBA0 |
  AND #$03                                  ; $07CBA1 |
  STA $10                                   ; $07CBA3 |
  LDA $38                                   ; $07CBA5 |
  LSR                                       ; $07CBA7 |
  AND #$04                                  ; $07CBA8 |
  ORA $10                                   ; $07CBAA |
  TAY                                       ; $07CBAC |
  LDA $38                                   ; $07CBAD |
  AND #$08                                  ; $07CBAF |
  LSR                                       ; $07CBB1 |
  LSR                                       ; $07CBB2 |
  LSR                                       ; $07CBB3 |
  TAX                                       ; $07CBB4 |
  LDA $0D,x                                 ; $07CBB5 |
  AND $CBBB,y                               ; $07CBB7 |
  RTS                                       ; $07CBBA |

  db $80, $40, $20, $10, $08, $04, $02, $01 ; $07CBBB |

code_07CBC3:
  LDA $86                                   ; $07CBC3 |
  ASL                                       ; $07CBC5 |
  ASL                                       ; $07CBC6 |
  TAY                                       ; $07CBC7 |
  CLC                                       ; $07CBC8 |
  LDA $92                                   ; $07CBC9 |
  ADC $9B                                   ; $07CBCB |
  STA $48                                   ; $07CBCD |
  LDA $91                                   ; $07CBCF |
  ADC $9A                                   ; $07CBD1 |
  CLC                                       ; $07CBD3 |
  ADC $CBF7,y                               ; $07CBD4 |
  CLC                                       ; $07CBD7 |
  ADC $CC                                   ; $07CBD8 |
  STA $36                                   ; $07CBDA |
  LDA $CD                                   ; $07CBDC |
  ADC $CBF8,y                               ; $07CBDE |
  STA $37                                   ; $07CBE1 |
  CLC                                       ; $07CBE3 |
  LDA $94                                   ; $07CBE4 |
  ADC $9D                                   ; $07CBE6 |
  STA $4A                                   ; $07CBE8 |
  LDA $93                                   ; $07CBEA |
  ADC $9C                                   ; $07CBEC |
  CLC                                       ; $07CBEE |
  ADC $CBF9,y                               ; $07CBEF |
  STA $38                                   ; $07CBF2 |
  JMP code_07CE95                           ; $07CBF4 |

  db $00, $00, $F0, $00, $00, $00, $10, $00 ; $07CBF7 |
  db $F4, $00, $0F, $00, $0C, $00, $0F, $00 ; $07CBFF |

code_07CC07:
  STX $19                                   ; $07CC07 |
  LDA $0583,x                               ; $07CC09 |
  STA $00                                   ; $07CC0C |
  LDA $058B,x                               ; $07CC0E |
  STA $01                                   ; $07CC11 |
  LDA $0593,x                               ; $07CC13 |
  STA $02                                   ; $07CC16 |
  LDA $059B,x                               ; $07CC18 |
  STA $03                                   ; $07CC1B |
  JSR code_07CAC5                           ; $07CC1D |
  LDX $1A                                   ; $07CC20 |
  LDA $01,x                                 ; $07CC22 |
  ORA $00,x                                 ; $07CC24 |
  BEQ code_07CC97                           ; $07CC26 |
  LDX $19                                   ; $07CC28 |
  LDY $1B                                   ; $07CC2A |
  LDA $0527,x                               ; $07CC2C |
  AND $CCC2,y                               ; $07CC2F |
  STA $0527,x                               ; $07CC32 |
  JSR code_07CCE3                           ; $07CC35 |
  LDA #$00                                  ; $07CC38 |
  STA $0D                                   ; $07CC3A |
  JSR code_07CB65                           ; $07CC3C |
  JSR code_07CAD3                           ; $07CC3F |
  BCC code_07CCBD                           ; $07CC42 |
  LDX $19                                   ; $07CC44 |
  LDA $0527,x                               ; $07CC46 |
  CMP #$0D                                  ; $07CC49 |
  BNE code_07CC57                           ; $07CC4B |
  LDA $0535,x                               ; $07CC4D |
  CMP #$05                                  ; $07CC50 |
  BNE code_07CC57                           ; $07CC52 |
  JSR code_07CCC6                           ; $07CC54 |
code_07CC57:
  LDX $19                                   ; $07CC57 |
  LDY $1B                                   ; $07CC59 |
  LDA $0527,x                               ; $07CC5B |
  ORA $CCC4,y                               ; $07CC5E |
  STA $0527,x                               ; $07CC61 |
  LDA #$00                                  ; $07CC64 |
  LDX $04                                   ; $07CC66 |
  BPL code_07CC6C                           ; $07CC68 |
  LDA #$FF                                  ; $07CC6A |
code_07CC6C:
  STA $0D                                   ; $07CC6C |
  LDY $19                                   ; $07CC6E |
  LDX $1A                                   ; $07CC70 |
  BEQ code_07CC9A                           ; $07CC72 |
  CLC                                       ; $07CC74 |
  LDA $056B,y                               ; $07CC75 |
  ADC $05                                   ; $07CC78 |
  STA $056B,y                               ; $07CC7A |
  LDA $0563,y                               ; $07CC7D |
  ADC $04                                   ; $07CC80 |
  STA $0563,y                               ; $07CC82 |
  LDA $055B,y                               ; $07CC85 |
  ADC $0D                                   ; $07CC88 |
  STA $055B,y                               ; $07CC8A |
  LDA $01,x                                 ; $07CC8D |
  STA $059B,y                               ; $07CC8F |
  LDA $00,x                                 ; $07CC92 |
  STA $0593,y                               ; $07CC94 |
code_07CC97:
  JMP code_07CCBD                           ; $07CC97 |

code_07CC9A:
  CLC                                       ; $07CC9A |
  LDA $0553,y                               ; $07CC9B |
  ADC $05                                   ; $07CC9E |
  STA $0553,y                               ; $07CCA0 |
  LDA $054B,y                               ; $07CCA3 |
  ADC $04                                   ; $07CCA6 |
  STA $054B,y                               ; $07CCA8 |
  LDA $0543,y                               ; $07CCAB |
  ADC $0D                                   ; $07CCAE |
  STA $0543,y                               ; $07CCB0 |
  LDA $01,x                                 ; $07CCB3 |
  STA $058B,y                               ; $07CCB5 |
  LDA $00,x                                 ; $07CCB8 |
  STA $0583,y                               ; $07CCBA |
code_07CCBD:
  INC $86                                   ; $07CCBD |
  LDX $19                                   ; $07CCBF |
  RTS                                       ; $07CCC1 |

  db $EF, $DF, $10, $20                     ; $07CCC2 |

code_07CCC6:
  LDA #$15                                  ; $07CCC6 |
  STA $10                                   ; $07CCC8 |
  LDA #$10                                  ; $07CCCA |
  STA $11                                   ; $07CCCC |
  LDA $36                                   ; $07CCCE |
  STA $0E                                   ; $07CCD0 |
  LDA $37                                   ; $07CCD2 |
  STA $0D                                   ; $07CCD4 |
  LDA $06                                   ; $07CCD6 |
  STA $0F                                   ; $07CCD8 |
  JSR $BEB4                                 ; $07CCDA |
  LDA #$00                                  ; $07CCDD |
  STA $04F3,x                               ; $07CCDF |
  RTS                                       ; $07CCE2 |

code_07CCE3:
  LDA $0553,x                               ; $07CCE3 |
  STA $48                                   ; $07CCE6 |
  LDA $056B,x                               ; $07CCE8 |
  STA $4A                                   ; $07CCEB |
  LDA $0583,x                               ; $07CCED |
  BMI code_07CD03                           ; $07CCF0 |
  CLC                                       ; $07CCF2 |
  LDA $054B,x                               ; $07CCF3 |
  ADC $0573,x                               ; $07CCF6 |
  STA $36                                   ; $07CCF9 |
  LDA $0543,x                               ; $07CCFB |
  ADC #$00                                  ; $07CCFE |
  JMP code_07CD11                           ; $07CD00 |

code_07CD03:
  SEC                                       ; $07CD03 |
  LDA $054B,x                               ; $07CD04 |
  SBC $0573,x                               ; $07CD07 |
  STA $36                                   ; $07CD0A |
  LDA $0543,x                               ; $07CD0C |
  SBC #$00                                  ; $07CD0F |
code_07CD11:
  STA $37                                   ; $07CD11 |
  LDA $0593,x                               ; $07CD13 |
  BPL code_07CD22                           ; $07CD16 |
  SEC                                       ; $07CD18 |
  LDA $0563,x                               ; $07CD19 |
  SBC $057B,x                               ; $07CD1C |
  JMP code_07CD29                           ; $07CD1F |

code_07CD22:
  CLC                                       ; $07CD22 |
  LDA $0563,x                               ; $07CD23 |
  ADC $057B,x                               ; $07CD26 |
code_07CD29:
  STA $38                                   ; $07CD29 |
  JMP code_07CE95                           ; $07CD2B |

  JSR code_07C800                           ; $07CD2E |
code_07CD31:
  JSR code_07C889                           ; $07CD31 |
  JSR code_07D0D1                           ; $07CD34 |
  JSR code_07CD73                           ; $07CD37 |
  JSR code_07C820                           ; $07CD3A |
  LDA $EC                                   ; $07CD3D |
  CMP #$04                                  ; $07CD3F |
  BNE code_07CD46                           ; $07CD41 |
  JSR code_07CE42                           ; $07CD43 |
code_07CD46:
  LDX #$20                                  ; $07CD46 |
  LDY #$60                                  ; $07CD48 |
  JSR code_07C819                           ; $07CD4A |
  LDY #$20                                  ; $07CD4D |
  LDA #$34                                  ; $07CD4F |
code_07CD51:
  STA $2007                                 ; $07CD51 |
  DEY                                       ; $07CD54 |
  BNE code_07CD51                           ; $07CD55 |
  JSR code_07C8FD                           ; $07CD57 |
  LDA $CC                                   ; $07CD5A |
  STA $46                                   ; $07CD5C |
  LDA $CD                                   ; $07CD5E |
  STA $47                                   ; $07CD60 |
  LDA $CD                                   ; $07CD62 |
  JSR code_07D12D                           ; $07CD64 |
  JSR code_07CF53                           ; $07CD67 |
  JSR code_07D128                           ; $07CD6A |
  JSR code_07C82F                           ; $07CD6D |
  JMP code_07C837                           ; $07CD70 |

code_07CD73:
  LDA $51                                   ; $07CD73 |\
  ASL                                       ; $07CD75 | | Use level id*2 as the index to the pointer tables
  TAX                                       ; $07CD76 |/
  LDA $CD9F,x                               ; $07CD77 |\
  STA $54                                   ; $07CD7A | | Store level tile data pointer
  LDA $CDA0,x                               ; $07CD7C | | 
  STA $55                                   ; $07CD7F |/ 
  LDA $CDC5,x                               ; $07CD81 |\ 
  STA $6A                                   ; $07CD84 | | Store level "tile-to-subtile" format pointer
  LDA $CDC6,x                               ; $07CD86 | | 
  STA $6B                                   ; $07CD89 |/ 
  LDA $CDEB,x                               ; $07CD8B |\ 
  STA $82                                   ; $07CD8E | | Store level tile property pointer
  LDA $CDEC,x                               ; $07CD90 | | 
  STA $83                                   ; $07CD93 |/
  JSR code_07C584                           ; $07CD95 |
  JSR code_07C570                           ; $07CD98 |
  JSR code_07C578                           ; $07CD9B |
  RTS                                       ; $07CD9E |

; Level tile data pointers
  dw $9C0A                                  ; $07CD9F |
  dw $800F                                  ; $07CDA1 |
  dw $801B                                  ; $07CDA3 |
  dw $90D2                                  ; $07CDA5 |
  dw $8013                                  ; $07CDA7 |
  dw $8013                                  ; $07CDA9 |
  dw $A0CB                                  ; $07CDAB |
  dw $914E                                  ; $07CDAD |
  dw $8962                                  ; $07CDAF |
  dw $A112                                  ; $07CDB1 |
  dw $90E6                                  ; $07CDB3 |
  dw $931B                                  ; $07CDB5 |
  dw $A22A                                  ; $07CDB7 |
  dw $A1C2                                  ; $07CDB9 |
  dw $B5F1                                  ; $07CDBB |
  dw $B5F1                                  ; $07CDBD |
  dw $B5F1                                  ; $07CDBF |
  dw $B7D1                                  ; $07CDC1 |
  dw $A3A2                                  ; $07CDC3 |

; Level "tile-to-subtile" format pointers 
  dw $9DEA                                  ; $07CDC5 |
  dw $868F                                  ; $07CDC7 |
  dw $8D1B                                  ; $07CDC9 |
  dw $9DD2                                  ; $07CDCB |
  dw $8D13                                  ; $07CDCD |
  dw $8D13                                  ; $07CDCF |
  dw $ADCB                                  ; $07CDD1 |
  dw $9E4E                                  ; $07CDD3 |
  dw $8FE2                                  ; $07CDD5 |
  dw $B152                                  ; $07CDD7 |
  dw $9DE6                                  ; $07CDD9 |
  dw $999B                                  ; $07CDDB |
  dw $BB5A                                  ; $07CDDD |
  dw $A492                                  ; $07CDDF |
  dw $B9B1                                  ; $07CDE1 |
  dw $B9B1                                  ; $07CDE3 |
  dw $B9B1                                  ; $07CDE5 |
  dw $B9B1                                  ; $07CDE7 |
  dw $A492                                  ; $07CDE9 |

; Level tile property pointers
  dw $A076                                  ; $07CDEB |
  dw $8867                                  ; $07CDED |
  dw $8F83                                  ; $07CDEF |
  dw $9FBE                                  ; $07CDF1 |
  dw $8FD3                                  ; $07CDF3 |
  dw $8F93                                  ; $07CDF5 |
  dw $AF67                                  ; $07CDF7 |
  dw $A00E                                  ; $07CDF9 |
  dw $91FE                                  ; $07CDFB |
  dw $B462                                  ; $07CDFD |
  dw $A0A6                                  ; $07CDFF |
  dw $9B37                                  ; $07CE01 |
  dw $BE62                                  ; $07CE03 |
  dw $A69E                                  ; $07CE05 |
  dw $BC0D                                  ; $07CE07 |
  dw $BC0D                                  ; $07CE09 |
  dw $BC0D                                  ; $07CE0B |
  dw $BC0D                                  ; $07CE0D |
  dw $A69E                                  ; $07CE0F |

code_07CE11:
  LDA $9B                                   ; $07CE11 |
  CLC                                       ; $07CE13 |
  ADC $D0                                   ; $07CE14 |
  STA $D0                                   ; $07CE16 |
  LDA $9A                                   ; $07CE18 |
  ADC $CC                                   ; $07CE1A |
  STA $0D                                   ; $07CE1C |
  LDA $9A                                   ; $07CE1E |
  BMI code_07CE29                           ; $07CE20 |
  LDA $CD                                   ; $07CE22 |
  ADC #$00                                  ; $07CE24 |
  JMP code_07CE2D                           ; $07CE26 |

code_07CE29:
  LDA $CD                                   ; $07CE29 |
  ADC #$FF                                  ; $07CE2B |
code_07CE2D:
  STA $0E                                   ; $07CE2D |
  LDX $4C                                   ; $07CE2F |
  INX                                       ; $07CE31 |
  CPX $0E                                   ; $07CE32 |
  BCC code_07CE41                           ; $07CE34 |
  LDA $0D                                   ; $07CE36 |
  STA $CC                                   ; $07CE38 |
  LDA $0E                                   ; $07CE3A |
  STA $CD                                   ; $07CE3C |
  JSR code_07D12D                           ; $07CE3E |
code_07CE41:
  RTS                                       ; $07CE41 |

code_07CE42:
  LDX #$20                                  ; $07CE42 |
  LDY #$42                                  ; $07CE44 |
  STX $72                                   ; $07CE46 |
  STY $71                                   ; $07CE48 |
  LDX #$CE                                  ; $07CE4A |
  LDY #$59                                  ; $07CE4C |
  STX $74                                   ; $07CE4E |
  STY $73                                   ; $07CE50 |
  LDA #$17                                  ; $07CE52 |
  STA $2A                                   ; $07CE54 |
  JMP code_07C5E9                           ; $07CE56 |

  db $1C, $0C, $18, $1B, $0E, $FF, $FF, $FF ; $07CE59 |
  db $FF, $FF, $FF, $FF, $00, $FF, $1A, $23 ; $07CE61 |
  db $FF, $FF, $FF, $1D, $12, $16, $0E      ; $07CE69 |

code_07CE70:
  LDA $37                                   ; $07CE70 |
  STA $56                                   ; $07CE72 |
  LDA $39                                   ; $07CE74 |
  STA $57                                   ; $07CE76 |
  RTS                                       ; $07CE78 |

; Tile checker
code_07CE79:
  LDA $36                                   ; $07CE79 | Tile checker x pos low
  LSR                                       ; $07CE7B |
  LSR                                       ; $07CE7C |
  LSR                                       ; $07CE7D |
  LSR                                       ; $07CE7E |
  STA $59                                   ; $07CE7F |
  SEC                                       ; $07CE81 |
  LDA $38                                   ; $07CE82 | Tile checker y pos low
  SBC #$20                                  ; $07CE84 |
  AND #$F0                                  ; $07CE86 |
  PHA                                       ; $07CE88 |
  LSR                                       ; $07CE89 |
  LSR                                       ; $07CE8A |
  LSR                                       ; $07CE8B |
  LSR                                       ; $07CE8C |
  STA $5A                                   ; $07CE8D |
  PLA                                       ; $07CE8F |
  ORA $59                                   ; $07CE90 |
  STA $5B                                   ; $07CE92 |
  RTS                                       ; $07CE94 |

code_07CE95:
  JSR code_07CE79                           ; $07CE95 |
  LDY $5B                                   ; $07CE98 |
  LDA $37                                   ; $07CE9A |\ Check which nametable the tile indexed by $005B is, based on which screen the tile checker is
  AND #$01                                  ; $07CE9C |/ 
  BNE code_07CEA6                           ; $07CE9E |
  LDA $0240,y                               ; $07CEA0 | Use $005B as an index to nametable 0
  JMP code_07CEA9                           ; $07CEA3 |

code_07CEA6:
  LDA $0330,y                               ; $07CEA6 | Use $005B as an index to nametable 1
code_07CEA9:
  STA $5E                                   ; $07CEA9 | Store indexed tile in $005E
  RTS                                       ; $07CEAB |

code_07CEAC:
  JSR code_07CE70                           ; $07CEAC |
  JSR code_07CE79                           ; $07CEAF |
  LDA $8E                                   ; $07CEB2 |
  PHA                                       ; $07CEB4 |
  JSR code_07C584                           ; $07CEB5 |
  LDA $37                                   ; $07CEB8 |
  CMP $4C                                   ; $07CEBA |
  BEQ code_07CEC0                           ; $07CEBC |
  BCS code_07CEC6                           ; $07CEBE |
code_07CEC0:
  LDA $39                                   ; $07CEC0 |
  CMP $4E                                   ; $07CEC2 |
  BCC code_07CECB                           ; $07CEC4 |
code_07CEC6:
  LDA $58                                   ; $07CEC6 |
  JMP code_07CF08                           ; $07CEC8 |

code_07CECB:
  LDA $56                                   ; $07CECB |
  STA $08                                   ; $07CECD |
  LDA #$00                                  ; $07CECF |
  STA $09                                   ; $07CED1 |
  CLC                                       ; $07CED3 |
  LDA $08                                   ; $07CED4 |
  ADC $4F                                   ; $07CED6 |
  STA $08                                   ; $07CED8 |
  LDA $09                                   ; $07CEDA |
  ADC $50                                   ; $07CEDC |
  STA $09                                   ; $07CEDE |
  LDY #$00                                  ; $07CEE0 |
  STY $5C                                   ; $07CEE2 |
  LDA ($08),y                               ; $07CEE4 |
  STA $0D                                   ; $07CEE6 |
  LDA #$D0                                  ; $07CEE8 |
  STA $0E                                   ; $07CEEA |
  JSR code_07C258                           ; $07CEEC |
  LDA $08                                   ; $07CEEF |
  STA $5C                                   ; $07CEF1 |
  LDA $09                                   ; $07CEF3 |
  STA $5D                                   ; $07CEF5 |
  CLC                                       ; $07CEF7 |
  LDA $5C                                   ; $07CEF8 |
  ADC $54                                   ; $07CEFA |
  STA $5C                                   ; $07CEFC |
  LDA $5D                                   ; $07CEFE |
  ADC $55                                   ; $07CF00 |
  STA $5D                                   ; $07CF02 |
  LDY $5B                                   ; $07CF04 |
  LDA ($5C),y                               ; $07CF06 |
code_07CF08:
  STA $5E                                   ; $07CF08 |
  JSR code_07CFC0                           ; $07CF0A |
  PLA                                       ; $07CF0D |
  JSR code_07C5AA                           ; $07CF0E |
  RTS                                       ; $07CF11 |

code_07CF12:
  JSR code_07CEAC                           ; $07CF12 |
code_07CF15:
  LDY $5B                                   ; $07CF15 |
  LDA $56                                   ; $07CF17 |
  AND #$01                                  ; $07CF19 |
  BNE code_07CF25                           ; $07CF1B |
  LDA $5E                                   ; $07CF1D |
  STA $0240,y                               ; $07CF1F |
  JMP code_07CF2A                           ; $07CF22 |

code_07CF25:
  LDA $5E                                   ; $07CF25 |
  STA $0330,y                               ; $07CF27 |
code_07CF2A:
  JSR code_07CFC0                           ; $07CF2A |
  JSR code_07CFAC                           ; $07CF2D |
  JSR code_07D03C                           ; $07CF30 |
  RTS                                       ; $07CF33 |

code_07CF34:
  LDA #$FF                                  ; $07CF34 |
  STA $33                                   ; $07CF36 |
  LDA $37                                   ; $07CF38 |
  STA $56                                   ; $07CF3A |
  JSR code_07CE79                           ; $07CF3C |
  JSR code_07CF15                           ; $07CF3F |
  RTS                                       ; $07CF42 |

code_07CF43:
  LDX $85                                   ; $07CF43 |
  DEX                                       ; $07CF45 |
  TXA                                       ; $07CF46 |
  AND #$02                                  ; $07CF47 |
  STA $35                                   ; $07CF49 |
  RTS                                       ; $07CF4B |

  LDA $35                                   ; $07CF4C |
  EOR #$02                                  ; $07CF4E |
  STA $35                                   ; $07CF50 |
  RTS                                       ; $07CF52 |

code_07CF53:
  LDA #$01                                  ; $07CF53 |
  STA $85                                   ; $07CF55 |
  LDA $CE                                   ; $07CF57 |
  CLC                                       ; $07CF59 |
  ADC #$20                                  ; $07CF5A |
  STA $44                                   ; $07CF5C |
  STA $40                                   ; $07CF5E |
  LDA $CF                                   ; $07CF60 |
  STA $45                                   ; $07CF62 |
  STA $41                                   ; $07CF64 |
  LDX #$0D                                  ; $07CF66 |
code_07CF68:
  STX $80                                   ; $07CF68 |
  SEC                                       ; $07CF6A |
  LDA $CC                                   ; $07CF6B |
  SBC #$80                                  ; $07CF6D |
  STA $42                                   ; $07CF6F |
  LDA $CD                                   ; $07CF71 |
  SBC #$00                                  ; $07CF73 |
  STA $43                                   ; $07CF75 |
  LDY #$04                                  ; $07CF77 |
code_07CF79:
  STY $1B                                   ; $07CF79 |
  LDA #$08                                  ; $07CF7B |
  STA $7F                                   ; $07CF7D |
  LDA #$00                                  ; $07CF7F |
  STA $75                                   ; $07CF81 |
  JSR code_07CA36                           ; $07CF83 |
  LDA $75                                   ; $07CF86 |
  STA $29                                   ; $07CF88 |
  LDA #$00                                  ; $07CF8A |
  STA $75                                   ; $07CF8C |
  JSR code_07C601                           ; $07CF8E |
  LDY $1B                                   ; $07CF91 |
  DEY                                       ; $07CF93 |
  BNE code_07CF79                           ; $07CF94 |
  CLC                                       ; $07CF96 |
  LDA $44                                   ; $07CF97 |
  ADC #$10                                  ; $07CF99 |
  JSR code_07D13A                           ; $07CF9B |
  STA $44                                   ; $07CF9E |
  LDA $45                                   ; $07CFA0 |
  ADC #$00                                  ; $07CFA2 |
  STA $45                                   ; $07CFA4 |
  LDX $80                                   ; $07CFA6 |
  DEX                                       ; $07CFA8 |
  BNE code_07CF68                           ; $07CFA9 |
  RTS                                       ; $07CFAB |

code_07CFAC:
  LDA $8E                                   ; $07CFAC |
  PHA                                       ; $07CFAE |
  JSR code_07C584                           ; $07CFAF |
  LDY #$00                                  ; $07CFB2 |
code_07CFB4:
  JSR code_07CFDF                           ; $07CFB4 |
  INY                                       ; $07CFB7 |
  CPY #$04                                  ; $07CFB8 |
  BCC code_07CFB4                           ; $07CFBA |
  PLA                                       ; $07CFBC |
  JMP code_07C5AA                           ; $07CFBD |

code_07CFC0:
  JSR code_07D01C                           ; $07CFC0 |
  LDA $5E                                   ; $07CFC3 |
  LDX #$00                                  ; $07CFC5 |
  STX $6D                                   ; $07CFC7 |
  ASL                                       ; $07CFC9 |
  ROL $6D                                   ; $07CFCA |
  ASL                                       ; $07CFCC |
  STA $6C                                   ; $07CFCD |
  ROL $6D                                   ; $07CFCF |
  CLC                                       ; $07CFD1 |
  LDA $6C                                   ; $07CFD2 |
  ADC $6A                                   ; $07CFD4 |
  STA $6C                                   ; $07CFD6 |
  LDA $6D                                   ; $07CFD8 |
  ADC $6B                                   ; $07CFDA |
  STA $6D                                   ; $07CFDC |
  RTS                                       ; $07CFDE |

code_07CFDF:
  CLC                                       ; $07CFDF |
  LDA $66                                   ; $07CFE0 |
  ADC $D018,y                               ; $07CFE2 |
  STA $0A                                   ; $07CFE5 |
  LDA $67                                   ; $07CFE7 |
  ADC #$00                                  ; $07CFE9 |
  STA $0B                                   ; $07CFEB |
  LDA $68                                   ; $07CFED |
  CMP #$FF                                  ; $07CFEF |
  BEQ code_07CFFB                           ; $07CFF1 |
  LDA $5E                                   ; $07CFF3 |
  CMP #$FF                                  ; $07CFF5 |
  BEQ code_07CFFB                           ; $07CFF7 |
  LDA ($6C),y                               ; $07CFF9 |
code_07CFFB:
  STA $68                                   ; $07CFFB |
  LDX $75                                   ; $07CFFD |
  LDA $0B                                   ; $07CFFF |
  STA $0420,x                               ; $07D001 |
  LDA $0A                                   ; $07D004 |
  STA $0421,x                               ; $07D006 |
  LDA $68                                   ; $07D009 |
  STA $0422,x                               ; $07D00B |
  INX                                       ; $07D00E |
  INX                                       ; $07D00F |
  INX                                       ; $07D010 |
  STX $75                                   ; $07D011 |
  LDA #$00                                  ; $07D013 |
  STA $68                                   ; $07D015 |
  RTS                                       ; $07D017 |

  db $00, $01, $20, $21                     ; $07D018 |

code_07D01C:
  LDA $38                                   ; $07D01C |
  AND #$F0                                  ; $07D01E |
  STA $66                                   ; $07D020 |
  LDA $37                                   ; $07D022 |
  AND #$01                                  ; $07D024 |
  ASL $66                                   ; $07D026 |
  ROL                                       ; $07D028 |
  ASL $66                                   ; $07D029 |
  ROL                                       ; $07D02B |
  ORA #$20                                  ; $07D02C |
  STA $67                                   ; $07D02E |
  LDA $36                                   ; $07D030 |
  AND #$F0                                  ; $07D032 |
  LSR                                       ; $07D034 |
  LSR                                       ; $07D035 |
  LSR                                       ; $07D036 |
  ORA $66                                   ; $07D037 |
  STA $66                                   ; $07D039 |
  RTS                                       ; $07D03B |

code_07D03C:
  CLC                                       ; $07D03C |
  LDA $5A                                   ; $07D03D |
  ADC #$02                                  ; $07D03F |
  AND #$0E                                  ; $07D041 |
  ASL                                       ; $07D043 |
  ASL                                       ; $07D044 |
  ORA #$C0                                  ; $07D045 |
  STA $0D                                   ; $07D047 |
  LDA $59                                   ; $07D049 |
  LSR                                       ; $07D04B |
  ORA $0D                                   ; $07D04C |
  STA $6E                                   ; $07D04E |
  LDY #$23                                  ; $07D050 |
  LDA $37                                   ; $07D052 |
  AND #$01                                  ; $07D054 |
  BEQ code_07D05A                           ; $07D056 |
  LDY #$27                                  ; $07D058 |
code_07D05A:
  STY $6F                                   ; $07D05A |
  LDA $8E                                   ; $07D05C |
  PHA                                       ; $07D05E |
  JSR code_07C584                           ; $07D05F |
  LDA $5B                                   ; $07D062 |
  AND #$EE                                  ; $07D064 |
  LDX #$00                                  ; $07D066 |
  STX $70                                   ; $07D068 |
  LDX #$03                                  ; $07D06A |
code_07D06C:
  LSR $70                                   ; $07D06C |
  LSR $70                                   ; $07D06E |
  STA $5B                                   ; $07D070 |
  TAY                                       ; $07D072 |
  LDA $37                                   ; $07D073 |
  AND #$01                                  ; $07D075 |
  BNE code_07D07F                           ; $07D077 |
  LDA $0240,y                               ; $07D079 |
  JMP code_07D082                           ; $07D07C |

code_07D07F:
  LDA $0330,y                               ; $07D07F |
code_07D082:
  JSR code_07D09C                           ; $07D082 |
  ORA $70                                   ; $07D085 |
  STA $70                                   ; $07D087 |
  CLC                                       ; $07D089 |
  LDA $D098,x                               ; $07D08A |
  ADC $5B                                   ; $07D08D |
  DEX                                       ; $07D08F |
  BPL code_07D06C                           ; $07D090 |
  PLA                                       ; $07D092 |
  JSR code_07C5AA                           ; $07D093 |
  JMP code_07D0BA                           ; $07D096 |

  db $01, $0F, $01                          ; $07D099 |

code_07D09C:
  ASL                                       ; $07D09C |
  STA $5E                                   ; $07D09D |
  LDA #$00                                  ; $07D09F |
  ROL                                       ; $07D0A1 |
  STA $01                                   ; $07D0A2 |
  CLC                                       ; $07D0A4 |
  LDA $82                                   ; $07D0A5 |
  ADC $5E                                   ; $07D0A7 |
  STA $00                                   ; $07D0A9 |
  LDA $83                                   ; $07D0AB |
  ADC $01                                   ; $07D0AD |
  STA $01                                   ; $07D0AF |
  LDY #$00                                  ; $07D0B1 |
  LDA ($00),y                               ; $07D0B3 |
  AND #$30                                  ; $07D0B5 |
  ASL                                       ; $07D0B7 |
  ASL                                       ; $07D0B8 |
  RTS                                       ; $07D0B9 |

code_07D0BA:
  LDX $75                                   ; $07D0BA |
  LDA $6F                                   ; $07D0BC |
  STA $0420,x                               ; $07D0BE |
  LDA $6E                                   ; $07D0C1 |
  STA $0421,x                               ; $07D0C3 |
  LDA $70                                   ; $07D0C6 |
  STA $0422,x                               ; $07D0C8 |
  INX                                       ; $07D0CB |
  INX                                       ; $07D0CC |
  INX                                       ; $07D0CD |
  STX $75                                   ; $07D0CE |
  RTS                                       ; $07D0D0 |

code_07D0D1:
  LDA $8E                                   ; $07D0D1 |
  PHA                                       ; $07D0D3 |
  JSR code_07C584                           ; $07D0D4 |
  LDA $51                                   ; $07D0D7 |\
  ASL                                       ; $07D0D9 | | Use level id*2 as the index to the pointer tables
  TAY                                       ; $07D0DA |/
  LDA $D102,y                               ; $07D0DB |
  STA $4F                                   ; $07D0DE |
  LDA $D103,y                               ; $07D0E0 |
  STA $50                                   ; $07D0E3 |
  LDY #$01                                  ; $07D0E5 |
  LDA ($4F),y                               ; $07D0E7 |
  STA $4E                                   ; $07D0E9 |
  INY                                       ; $07D0EB |
  LDA ($4F),y                               ; $07D0EC |
  STA $58                                   ; $07D0EE |
  CLC                                       ; $07D0F0 |
  LDA $4F                                   ; $07D0F1 |
  ADC #$03                                  ; $07D0F3 |
  STA $4F                                   ; $07D0F5 |
  LDA $50                                   ; $07D0F7 |
  ADC #$00                                  ; $07D0F9 |
  STA $50                                   ; $07D0FB |
  PLA                                       ; $07D0FD |
  JSR code_07C5AA                           ; $07D0FE |
  RTS                                       ; $07D101 |

; Screen data pointers
  dw $9C05                                  ; $07D102 |
  dw $8000                                  ; $07D104 |
  dw $8000                                  ; $07D106 |
  dw $90B7                                  ; $07D108 |
  dw $8000                                  ; $07D10A |
  dw $8000                                  ; $07D10C |
  dw $A0B4                                  ; $07D10E |
  dw $9133                                  ; $07D110 |
  dw $8953                                  ; $07D112 |
  dw $A0EE                                  ; $07D114 |
  dw $90D3                                  ; $07D116 |
  dw $930C                                  ; $07D118 |
  dw $A206                                  ; $07D11A |
  dw $A1BC                                  ; $07D11C |
  dw $B5EA                                  ; $07D11E |
  dw $B5EA                                  ; $07D120 |
  dw $B5EA                                  ; $07D122 |
  dw $B5EA                                  ; $07D124 |
  dw $A1C5                                  ; $07D126 |

code_07D128:
  LDA #$01                                  ; $07D128 |
  STA $28                                   ; $07D12A |
  RTS                                       ; $07D12C |

code_07D12D:
  AND #$01                                  ; $07D12D |
  STA $10                                   ; $07D12F |
  LDA $CA                                   ; $07D131 |
  AND #$FE                                  ; $07D133 |
  ORA $10                                   ; $07D135 |
  STA $CA                                   ; $07D137 |
  RTS                                       ; $07D139 |

code_07D13A:
  BCS code_07D140                           ; $07D13A |
  CMP #$F0                                  ; $07D13C |
  BCC code_07D143                           ; $07D13E |
code_07D140:
  ADC #$0F                                  ; $07D140 |
  SEC                                       ; $07D142 |
code_07D143:
  RTS                                       ; $07D143 |

  BCC code_07D14A                           ; $07D144 |
  CMP #$F0                                  ; $07D146 |
  BCC code_07D150                           ; $07D148 |
code_07D14A:
  SEC                                       ; $07D14A |
  SBC #$10                                  ; $07D14B |
  CLC                                       ; $07D14D |
  BCC code_07D151                           ; $07D14E |
code_07D150:
  SEC                                       ; $07D150 |
code_07D151:
  RTS                                       ; $07D151 |

code_07D152:
  LDA $75                                   ; $07D152 |
  STA $29                                   ; $07D154 |
  JSR code_07C837                           ; $07D156 |
  LDA #$00                                  ; $07D159 |
  STA $75                                   ; $07D15B |
  RTS                                       ; $07D15D |

code_07D15E:
  JSR code_07C5A4                           ; $07D15E |
  JSR code_07D171                           ; $07D161 |
  JSR code_07C5A8                           ; $07D164 |
  JSR $8000                                 ; $07D167 |
  JSR code_07D39E                           ; $07D16A |
  JSR code_07D661                           ; $07D16D |
  RTS                                       ; $07D170 |

code_07D171:
  LDX #$05                                  ; $07D171 |
code_07D173:
  LDA $04F3,x                               ; $07D173 |
  BEQ code_07D1DF                           ; $07D176 |
  LDA $04FB,x                               ; $07D178 |
  CMP #$42                                  ; $07D17B |
  BNE code_07D189                           ; $07D17D |
  LDA $CD                                   ; $07D17F |
  CMP #$08                                  ; $07D181 |
  BCC code_07D189                           ; $07D183 |
  CMP #$06                                  ; $07D185 |
  BCC code_07D1CC                           ; $07D187 |
code_07D189:
  LDA $054B,x                               ; $07D189 |
  CLC                                       ; $07D18C |
  ADC #$40                                  ; $07D18D |
  STA $0D                                   ; $07D18F |
  LDA $0543,x                               ; $07D191 |
  ADC #$00                                  ; $07D194 |
  STA $0E                                   ; $07D196 |
  LDA $0D                                   ; $07D198 |
  SEC                                       ; $07D19A |
  SBC $CC                                   ; $07D19B |
  LDA $0E                                   ; $07D19D |
  SBC $CD                                   ; $07D19F |
  BCC code_07D1DA                           ; $07D1A1 |
  LDA $04FB,x                               ; $07D1A3 |
  CMP #$39                                  ; $07D1A6 |
  BEQ code_07D1CC                           ; $07D1A8 |
  CMP #$3A                                  ; $07D1AA |
  BEQ code_07D1CC                           ; $07D1AC |
  CMP #$08                                  ; $07D1AE |
  BEQ code_07D1CC                           ; $07D1B0 |
  LDA $CC                                   ; $07D1B2 |
  CLC                                       ; $07D1B4 |
  ADC #$80                                  ; $07D1B5 |
  STA $0D                                   ; $07D1B7 |
  LDA $CD                                   ; $07D1B9 |
  ADC #$01                                  ; $07D1BB |
  STA $0E                                   ; $07D1BD |
  LDA $0D                                   ; $07D1BF |
  SEC                                       ; $07D1C1 |
  SBC $054B,x                               ; $07D1C2 |
  LDA $0E                                   ; $07D1C5 |
  SBC $0543,x                               ; $07D1C7 |
  BCC code_07D1DA                           ; $07D1CA |
code_07D1CC:
  LDA $04FB,x                               ; $07D1CC |
  CMP #$16                                  ; $07D1CF |
  BEQ code_07D1DF                           ; $07D1D1 |
  LDA $0563,x                               ; $07D1D3 |
  CMP #$F9                                  ; $07D1D6 |
  BCC code_07D1DF                           ; $07D1D8 |
code_07D1DA:
  LDA #$00                                  ; $07D1DA |
  STA $04F3,x                               ; $07D1DC |
code_07D1DF:
  DEX                                       ; $07D1DF |
  BPL code_07D173                           ; $07D1E0 |
  LDA $CD                                   ; $07D1E2 |
  CMP #$20                                  ; $07D1E4 |
  BCC code_07D1EB                           ; $07D1E6 |
  JMP code_07D39D                           ; $07D1E8 |

code_07D1EB:
  ASL                                       ; $07D1EB |
  ASL                                       ; $07D1EC |
  STA $0D                                   ; $07D1ED |
  LDX $CC                                   ; $07D1EF |
  BPL code_07D1F8                           ; $07D1F1 |
  CLC                                       ; $07D1F3 |
  LDA #$02                                  ; $07D1F4 |
  ADC $0D                                   ; $07D1F6 |
code_07D1F8:
  STA $0D                                   ; $07D1F8 |
  CLC                                       ; $07D1FA |
  ADC #$01                                  ; $07D1FB |
  CMP $04ED                                 ; $07D1FD |
  BCC code_07D20B                           ; $07D200 |
  BEQ code_07D20B                           ; $07D202 |
  LDA $04ED                                 ; $07D204 |
  CMP $0D                                   ; $07D207 |
  BCS code_07D229                           ; $07D209 |
code_07D20B:
  LDA $CC                                   ; $07D20B |
  AND #$7F                                  ; $07D20D |
  CMP #$04                                  ; $07D20F |
  BCS code_07D229                           ; $07D211 |
  LDA $0D                                   ; $07D213 |
  STA $04ED                                 ; $07D215 |
  CMP $04EE                                 ; $07D218 |
  BCC code_07D224                           ; $07D21B |
  STA $04EE                                 ; $07D21D |
  LDA #$00                                  ; $07D220 |
  BEQ code_07D226                           ; $07D222 |
code_07D224:
  LDA #$01                                  ; $07D224 |
code_07D226:
  STA $04F0                                 ; $07D226 |
code_07D229:
  LDA #$63                                  ; $07D229 |
  STA $00                                   ; $07D22B |
  LDA #$AF                                  ; $07D22D |
  STA $01                                   ; $07D22F |
  LDA $51                                   ; $07D231 |
  ASL                                       ; $07D233 |
  CLC                                       ; $07D234 |
  ADC $00                                   ; $07D235 |
  STA $00                                   ; $07D237 |
  LDA #$00                                  ; $07D239 |
  ADC $01                                   ; $07D23B |
  STA $01                                   ; $07D23D |
  LDY #$00                                  ; $07D23F |
  LDA ($00),y                               ; $07D241 |
  STA $02                                   ; $07D243 |
  INY                                       ; $07D245 |
  LDA ($00),y                               ; $07D246 |
  STA $03                                   ; $07D248 |
  LDA $04ED                                 ; $07D24A |
  ASL                                       ; $07D24D |
  ASL                                       ; $07D24E |
  PHA                                       ; $07D24F |
  LDA #$00                                  ; $07D250 |
  ADC $03                                   ; $07D252 |
  STA $03                                   ; $07D254 |
  PLA                                       ; $07D256 |
  CLC                                       ; $07D257 |
  ADC $02                                   ; $07D258 |
  STA $02                                   ; $07D25A |
  LDA #$00                                  ; $07D25C |
  ADC $03                                   ; $07D25E |
  STA $03                                   ; $07D260 |
  LDA $04ED                                 ; $07D262 |
  LSR                                       ; $07D265 |
  LSR                                       ; $07D266 |
  STA $0D                                   ; $07D267 |
  INC $0D                                   ; $07D269 |
  LDY #$00                                  ; $07D26B |
  LDA ($02),y                               ; $07D26D |
  STA $0E                                   ; $07D26F |
  LDA $CC                                   ; $07D271 |
  CLC                                       ; $07D273 |
  ADC $91                                   ; $07D274 |
  STA $0F                                   ; $07D276 |
  LDA $CD                                   ; $07D278 |
  ADC #$00                                  ; $07D27A |
  STA $10                                   ; $07D27C |
  LDA $4C                                   ; $07D27E |
  CMP $10                                   ; $07D280 |
  BCS code_07D287                           ; $07D282 |
  JMP code_07D39D                           ; $07D284 |

code_07D287:
  LDA $0F                                   ; $07D287 |
  CLC                                       ; $07D289 |
  ADC #$90                                  ; $07D28A |
  STA $0F                                   ; $07D28C |
  LDA $10                                   ; $07D28E |
  ADC #$00                                  ; $07D290 |
  STA $10                                   ; $07D292 |
  LDA $0D                                   ; $07D294 |
  CMP $10                                   ; $07D296 |
  BEQ code_07D29D                           ; $07D298 |
  JMP code_07D39D                           ; $07D29A |

code_07D29D:
  LDA $0E                                   ; $07D29D |
  CMP $0F                                   ; $07D29F |
  BCS code_07D2A6                           ; $07D2A1 |
  JMP code_07D39D                           ; $07D2A3 |

code_07D2A6:
  LDA $0F                                   ; $07D2A6 |
  CLC                                       ; $07D2A8 |
  ADC #$03                                  ; $07D2A9 |
  STA $0F                                   ; $07D2AB |
  LDA $10                                   ; $07D2AD |
  ADC #$01                                  ; $07D2AF |
  CMP $0D                                   ; $07D2B1 |
  BCS code_07D2B8                           ; $07D2B3 |
  JMP code_07D39D                           ; $07D2B5 |

code_07D2B8:
  BNE code_07D2C3                           ; $07D2B8 |
  LDA $0E                                   ; $07D2BA |
  CMP $0F                                   ; $07D2BC |
  BCC code_07D2C3                           ; $07D2BE |
  JMP code_07D39D                           ; $07D2C0 |

code_07D2C3:
  INY                                       ; $07D2C3 |
  LDA ($02),y                               ; $07D2C4 |
  STA $0F                                   ; $07D2C6 |
  CMP #$10                                  ; $07D2C8 |
  BCC code_07D2E5                           ; $07D2CA |
  INY                                       ; $07D2CC |
  LDA ($02),y                               ; $07D2CD |
  STA $10                                   ; $07D2CF |
  INY                                       ; $07D2D1 |
  LDA ($02),y                               ; $07D2D2 |
  STA $11                                   ; $07D2D4 |
  LDX #$05                                  ; $07D2D6 |
code_07D2D8:
  LDA $04F3,x                               ; $07D2D8 |
  BEQ code_07D2E8                           ; $07D2DB |
  LDA $0509,x                               ; $07D2DD |
  CMP $04ED                                 ; $07D2E0 |
  BNE code_07D2E8                           ; $07D2E3 |
code_07D2E5:
  JMP code_07D39D                           ; $07D2E5 |

code_07D2E8:
  DEX                                       ; $07D2E8 |
  BPL code_07D2D8                           ; $07D2E9 |
  LDX #$05                                  ; $07D2EB |
code_07D2ED:
  LDA $04F3,x                               ; $07D2ED |
  BEQ code_07D2FF                           ; $07D2F0 |
  LDA $0543,x                               ; $07D2F2 |
  CMP $CD                                   ; $07D2F5 |
  BCC code_07D2FF                           ; $07D2F7 |
  DEX                                       ; $07D2F9 |
  BPL code_07D2ED                           ; $07D2FA |
  JMP code_07D39D                           ; $07D2FC |

code_07D2FF:
  LDA $10                                   ; $07D2FF |
  CMP #$08                                  ; $07D301 |
  BNE code_07D307                           ; $07D303 |
  LDX #$00                                  ; $07D305 |
code_07D307:
  LDA $10                                   ; $07D307 |
  STA $04FB,x                               ; $07D309 |
  LDA $11                                   ; $07D30C |
  STA $050F,x                               ; $07D30E |
  LDA $0D                                   ; $07D311 |
  STA $0543,x                               ; $07D313 |
  LDA $0E                                   ; $07D316 |
  STA $054B,x                               ; $07D318 |
  LDA #$00                                  ; $07D31B |
  STA $055B,x                               ; $07D31D |
  LDA $0F                                   ; $07D320 |
  STA $0563,x                               ; $07D322 |
  LDA #$01                                  ; $07D325 |
  STA $04F3,x                               ; $07D327 |
  LDA #$FF                                  ; $07D32A |
  STA $0501,x                               ; $07D32C |
  LDA #$00                                  ; $07D32F |
  STA $0515,x                               ; $07D331 |
  STA $051B,x                               ; $07D334 |
  STA $0521,x                               ; $07D337 |
  STA $0527,x                               ; $07D33A |
  STA $0535,x                               ; $07D33D |
  STA $053D,x                               ; $07D340 |
  STA $0553,x                               ; $07D343 |
  STA $056B,x                               ; $07D346 |
  STA $0583,x                               ; $07D349 |
  STA $058B,x                               ; $07D34C |
  STA $0593,x                               ; $07D34F |
  STA $059B,x                               ; $07D352 |
  STA $0573,x                               ; $07D355 |
  STA $057B,x                               ; $07D358 |
  STA $05B3,x                               ; $07D35B |
  STA $05B9,x                               ; $07D35E |
  LDA #$30                                  ; $07D361 |
  STA $052F,x                               ; $07D363 |
  LDA $04ED                                 ; $07D366 |
  STA $0509,x                               ; $07D369 |
  LDA $10                                   ; $07D36C |
  CMP #$08                                  ; $07D36E |
  BNE code_07D37E                           ; $07D370 |
  LDA $11                                   ; $07D372 |
  BEQ code_07D37C                           ; $07D374 |
  CMP #$20                                  ; $07D376 |
  BEQ code_07D39D                           ; $07D378 |
  BNE code_07D38C                           ; $07D37A |
code_07D37C:
  STX $E6                                   ; $07D37C |
code_07D37E:
  INC $04ED                                 ; $07D37E |
  LDA $04EE                                 ; $07D381 |
  CMP $04ED                                 ; $07D384 |
  BCS code_07D38C                           ; $07D387 |
  INC $04EE                                 ; $07D389 |
code_07D38C:
  LDA $10                                   ; $07D38C |
  CMP #$08                                  ; $07D38E |
  BNE code_07D39D                           ; $07D390 |
  LDA $11                                   ; $07D392 |
  CLC                                       ; $07D394 |
  ADC #$10                                  ; $07D395 |
  STA $11                                   ; $07D397 |
  INX                                       ; $07D399 |
  JMP code_07D307                           ; $07D39A |

code_07D39D:
  RTS                                       ; $07D39D |

code_07D39E:
  LDA $51                                   ; $07D39E |
  CMP #$02                                  ; $07D3A0 |
  BEQ code_07D3A7                           ; $07D3A2 |
  JMP code_07D45B                           ; $07D3A4 |

code_07D3A7:
  LDA $7D                                   ; $07D3A7 |
  AND #$01                                  ; $07D3A9 |
  BEQ code_07D402                           ; $07D3AB |
  LDY #$04                                  ; $07D3AD |
code_07D3AF:
  LDA $0610,y                               ; $07D3AF |
  AND #$0F                                  ; $07D3B2 |
  BEQ code_07D3FF                           ; $07D3B4 |
  STA $0D                                   ; $07D3B6 |
  LDA $0610,y                               ; $07D3B8 |
  AND #$F0                                  ; $07D3BB |
  SEC                                       ; $07D3BD |
  SBC $CC                                   ; $07D3BE |
  LDA $060B,y                               ; $07D3C0 |
  SBC $CD                                   ; $07D3C3 |
  BEQ code_07D3CE                           ; $07D3C5 |
  LDA #$00                                  ; $07D3C7 |
  STA $0610,y                               ; $07D3C9 |
  BEQ code_07D3FF                           ; $07D3CC |
code_07D3CE:
  DEC $0D                                   ; $07D3CE |
  LDA $0610,y                               ; $07D3D0 |
  AND #$F0                                  ; $07D3D3 |
  ORA $0D                                   ; $07D3D5 |
  STA $0610,y                               ; $07D3D7 |
  LDX $0D                                   ; $07D3DA |
  LDA $D45C,x                               ; $07D3DC |
  BEQ code_07D3FF                           ; $07D3DF |
  STA $5E                                   ; $07D3E1 |
  LDA $0610,y                               ; $07D3E3 |
  AND #$F0                                  ; $07D3E6 |
  STA $36                                   ; $07D3E8 |
  LDA $060B,y                               ; $07D3EA |
  STA $37                                   ; $07D3ED |
  LDA $0606,y                               ; $07D3EF |
  STA $38                                   ; $07D3F2 |
  LDA #$00                                  ; $07D3F4 |
  STA $39                                   ; $07D3F6 |
  TYA                                       ; $07D3F8 |
  PHA                                       ; $07D3F9 |
  JSR code_07CF34                           ; $07D3FA |
  PLA                                       ; $07D3FD |
  TAY                                       ; $07D3FE |
code_07D3FF:
  DEY                                       ; $07D3FF |
  BPL code_07D3AF                           ; $07D400 |
code_07D402:
  LDA $0615                                 ; $07D402 |
  CMP #$72                                  ; $07D405 |
  BNE code_07D45B                           ; $07D407 |
  LDA $0619                                 ; $07D409 |
  AND #$F0                                  ; $07D40C |
  STA $0D                                   ; $07D40E |
  LDA $0617                                 ; $07D410 |
  STA $0E                                   ; $07D413 |
  LDA $0618                                 ; $07D415 |
  AND #$F0                                  ; $07D418 |
  STA $0F                                   ; $07D41A |
  LDX #$FF                                  ; $07D41C |
  LDY #$04                                  ; $07D41E |
code_07D420:
  LDA $0610,y                               ; $07D420 |
  AND #$0F                                  ; $07D423 |
  BNE code_07D42C                           ; $07D425 |
  TYA                                       ; $07D427 |
  TAX                                       ; $07D428 |
  JMP code_07D443                           ; $07D429 |

code_07D42C:
  LDA $0610,y                               ; $07D42C |
  AND #$F0                                  ; $07D42F |
  EOR $0F                                   ; $07D431 |
  BNE code_07D443                           ; $07D433 |
  LDA $0606,y                               ; $07D435 |
  EOR $0D                                   ; $07D438 |
  BNE code_07D443                           ; $07D43A |
  LDA $060B,y                               ; $07D43C |
  EOR $0E                                   ; $07D43F |
  BEQ code_07D45B                           ; $07D441 |
code_07D443:
  DEY                                       ; $07D443 |
  BPL code_07D420                           ; $07D444 |
  CPX #$FF                                  ; $07D446 |
  BEQ code_07D45B                           ; $07D448 |
  LDA $0D                                   ; $07D44A |
  STA $0606,x                               ; $07D44C |
  LDA $0E                                   ; $07D44F |
  STA $060B,x                               ; $07D451 |
  LDA $0F                                   ; $07D454 |
  ORA #$08                                  ; $07D456 |
  STA $0610,x                               ; $07D458 |
code_07D45B:
  RTS                                       ; $07D45B |

  db $00, $26, $74, $73, $00, $00, $00, $00 ; $07D45C |
  db $00, $00, $00                          ; $07D464 |

code_07D467:
  LDA $00                                   ; $07D467 |
  PHA                                       ; $07D469 |
  LDA $01                                   ; $07D46A |
  PHA                                       ; $07D46C |
  LDA $0515,x                               ; $07D46D |
  ASL                                       ; $07D470 |
  ASL                                       ; $07D471 |
  CLC                                       ; $07D472 |
  ADC $00                                   ; $07D473 |
  STA $00                                   ; $07D475 |
  LDA $01                                   ; $07D477 |
  ADC #$00                                  ; $07D479 |
  STA $01                                   ; $07D47B |
  LDY #$00                                  ; $07D47D |
  LDA ($00),y                               ; $07D47F |
  CMP #$FF                                  ; $07D481 |
  BNE code_07D488                           ; $07D483 |
  JMP code_07D4FC                           ; $07D485 |

code_07D488:
  CMP #$FE                                  ; $07D488 |
  BNE code_07D49B                           ; $07D48A |
  INY                                       ; $07D48C |
  LDA ($00),y                               ; $07D48D |
  STA $0515,x                               ; $07D48F |
  PLA                                       ; $07D492 |
  STA $01                                   ; $07D493 |
  PLA                                       ; $07D495 |
  STA $00                                   ; $07D496 |
  JMP code_07D467                           ; $07D498 |

code_07D49B:
  STA $051B,x                               ; $07D49B |
  PLA                                       ; $07D49E |
  PLA                                       ; $07D49F |
  INY                                       ; $07D4A0 |
  LDA ($00),y                               ; $07D4A1 |
  AND #$0C                                  ; $07D4A3 |
  BNE code_07D4D5                           ; $07D4A5 |
  LDA ($00),y                               ; $07D4A7 |
  AND #$03                                  ; $07D4A9 |
  BEQ code_07D4BB                           ; $07D4AB |
  AND #$01                                  ; $07D4AD |
  STA $0D                                   ; $07D4AF |
  LDA $0527,x                               ; $07D4B1 |
  AND #$FE                                  ; $07D4B4 |
  ORA $0D                                   ; $07D4B6 |
  STA $0527,x                               ; $07D4B8 |
code_07D4BB:
  LDA ($00),y                               ; $07D4BB |
  AND #$30                                  ; $07D4BD |
  BEQ code_07D4F2                           ; $07D4BF |
  AND #$10                                  ; $07D4C1 |
  LSR                                       ; $07D4C3 |
  LSR                                       ; $07D4C4 |
  LSR                                       ; $07D4C5 |
  STA $0D                                   ; $07D4C6 |
  LDA $0527,x                               ; $07D4C8 |
  AND #$FD                                  ; $07D4CB |
  ORA $0D                                   ; $07D4CD |
  STA $0527,x                               ; $07D4CF |
  JMP code_07D4F2                           ; $07D4D2 |

code_07D4D5:
  LDA ($00),y                               ; $07D4D5 |
  AND #$08                                  ; $07D4D7 |
  BEQ code_07D4E1                           ; $07D4D9 |
  LDA $8B                                   ; $07D4DB |
  AND #$01                                  ; $07D4DD |
  BPL code_07D4E3                           ; $07D4DF |
code_07D4E1:
  LDA $0F                                   ; $07D4E1 |
code_07D4E3:
  STA $0D                                   ; $07D4E3 |
  LDA $0527,x                               ; $07D4E5 |
  AND #$FE                                  ; $07D4E8 |
  ORA $0D                                   ; $07D4EA |
  STA $0527,x                               ; $07D4EC |
  JMP code_07D4BB                           ; $07D4EF |

code_07D4F2:
  INY                                       ; $07D4F2 |
  LDA ($00),y                               ; $07D4F3 |
  STA $053D,x                               ; $07D4F5 |
  LDA #$00                                  ; $07D4F8 |
  BEQ code_07D500                           ; $07D4FA |
code_07D4FC:
  PLA                                       ; $07D4FC |
  PLA                                       ; $07D4FD |
  LDA #$FF                                  ; $07D4FE |
code_07D500:
  RTS                                       ; $07D500 |

code_07D501:
  LDA $8E                                   ; $07D501 |
  PHA                                       ; $07D503 |
  JSR code_07C59C                           ; $07D504 |
  LDA $051B,x                               ; $07D507 |
  ASL                                       ; $07D50A |
  TAY                                       ; $07D50B |
  LDA $A9B2,y                               ; $07D50C |
  STA $00                                   ; $07D50F |
  LDA $A9B3,y                               ; $07D511 |
  STA $01                                   ; $07D514 |
  LDA $0521,x                               ; $07D516 |
  ASL                                       ; $07D519 |
  ASL                                       ; $07D51A |
  CLC                                       ; $07D51B |
  ADC $00                                   ; $07D51C |
  STA $00                                   ; $07D51E |
  LDA $01                                   ; $07D520 |
  ADC #$00                                  ; $07D522 |
  STA $01                                   ; $07D524 |
  LDY #$00                                  ; $07D526 |
  LDA ($00),y                               ; $07D528 |
  STA $0F                                   ; $07D52A |
  INY                                       ; $07D52C |
  LDA ($00),y                               ; $07D52D |
  STA $10                                   ; $07D52F |
  INY                                       ; $07D531 |
  LDA ($00),y                               ; $07D532 |
  STA $11                                   ; $07D534 |
  INY                                       ; $07D536 |
  LDA ($00),y                               ; $07D537 |
  STA $12                                   ; $07D539 |
  INY                                       ; $07D53B |
  LDA ($00),y                               ; $07D53C |
  STA $14                                   ; $07D53E |
  LDA $0527,x                               ; $07D540 |
  AND #$01                                  ; $07D543 |
  BEQ code_07D558                           ; $07D545 |
  LDA $10                                   ; $07D547 |
  EOR #$FF                                  ; $07D549 |
  CLC                                       ; $07D54B |
  ADC #$01                                  ; $07D54C |
  STA $10                                   ; $07D54E |
  LDA $0F                                   ; $07D550 |
  EOR #$FF                                  ; $07D552 |
  ADC #$00                                  ; $07D554 |
  STA $0F                                   ; $07D556 |
code_07D558:
  LDA $0527,x                               ; $07D558 |
  AND #$02                                  ; $07D55B |
  BEQ code_07D570                           ; $07D55D |
  LDA $12                                   ; $07D55F |
  EOR #$FF                                  ; $07D561 |
  CLC                                       ; $07D563 |
  ADC #$01                                  ; $07D564 |
  STA $12                                   ; $07D566 |
  LDA $11                                   ; $07D568 |
  EOR #$FF                                  ; $07D56A |
  ADC #$00                                  ; $07D56C |
  STA $11                                   ; $07D56E |
code_07D570:
  LDA $053D,x                               ; $07D570 |
  AND #$0F                                  ; $07D573 |
  BEQ code_07D59A                           ; $07D575 |
  STA $13                                   ; $07D577 |
  STA $0D                                   ; $07D579 |
  LDA $10                                   ; $07D57B |
  STA $0E                                   ; $07D57D |
  JSR code_07C258                           ; $07D57F |
  LDA $08                                   ; $07D582 |
  STA $10                                   ; $07D584 |
  LDA $09                                   ; $07D586 |
  PHA                                       ; $07D588 |
  LDA $13                                   ; $07D589 |
  STA $0D                                   ; $07D58B |
  LDA $0F                                   ; $07D58D |
  STA $0E                                   ; $07D58F |
  JSR code_07C258                           ; $07D591 |
  PLA                                       ; $07D594 |
  CLC                                       ; $07D595 |
  ADC $08                                   ; $07D596 |
  STA $0F                                   ; $07D598 |
code_07D59A:
  LDA $053D,x                               ; $07D59A |
  AND #$F0                                  ; $07D59D |
  BEQ code_07D5C8                           ; $07D59F |
  LSR                                       ; $07D5A1 |
  LSR                                       ; $07D5A2 |
  LSR                                       ; $07D5A3 |
  LSR                                       ; $07D5A4 |
  STA $13                                   ; $07D5A5 |
  STA $0D                                   ; $07D5A7 |
  LDA $12                                   ; $07D5A9 |
  STA $0E                                   ; $07D5AB |
  JSR code_07C258                           ; $07D5AD |
  LDA $08                                   ; $07D5B0 |
  STA $12                                   ; $07D5B2 |
  LDA $09                                   ; $07D5B4 |
  PHA                                       ; $07D5B6 |
  LDA $13                                   ; $07D5B7 |
  STA $0D                                   ; $07D5B9 |
  LDA $11                                   ; $07D5BB |
  STA $0E                                   ; $07D5BD |
  JSR code_07C258                           ; $07D5BF |
  PLA                                       ; $07D5C2 |
  CLC                                       ; $07D5C3 |
  ADC $08                                   ; $07D5C4 |
  STA $11                                   ; $07D5C6 |
code_07D5C8:
  LDA $0F                                   ; $07D5C8 |
  STA $0583,x                               ; $07D5CA |
  LDA $10                                   ; $07D5CD |
  STA $058B,x                               ; $07D5CF |
  LDA $11                                   ; $07D5D2 |
  STA $0593,x                               ; $07D5D4 |
  LDA $12                                   ; $07D5D7 |
  STA $059B,x                               ; $07D5D9 |
  LDA $14                                   ; $07D5DC |
  CMP #$80                                  ; $07D5DE |
  BNE code_07D5EC                           ; $07D5E0 |
  INC $0515,x                               ; $07D5E2 |
  LDA #$00                                  ; $07D5E5 |
  STA $0521,x                               ; $07D5E7 |
  BEQ code_07D5EF                           ; $07D5EA |
code_07D5EC:
  INC $0521,x                               ; $07D5EC |
code_07D5EF:
  PLA                                       ; $07D5EF |
  JSR code_07C5AA                           ; $07D5F0 |
  RTS                                       ; $07D5F3 |

code_07D5F4:
  LDA $058B,x                               ; $07D5F4 |
  CLC                                       ; $07D5F7 |
  ADC $0553,x                               ; $07D5F8 |
  STA $0553,x                               ; $07D5FB |
  LDA $0583,x                               ; $07D5FE |
  ADC $054B,x                               ; $07D601 |
  STA $054B,x                               ; $07D604 |
  LDA $0583,x                               ; $07D607 |
  BMI code_07D614                           ; $07D60A |
  LDA $0543,x                               ; $07D60C |
  ADC #$00                                  ; $07D60F |
  JMP code_07D619                           ; $07D611 |

code_07D614:
  LDA $0543,x                               ; $07D614 |
  ADC #$FF                                  ; $07D617 |
code_07D619:
  STA $0543,x                               ; $07D619 |
  LDA $059B,x                               ; $07D61C |
  CLC                                       ; $07D61F |
  ADC $056B,x                               ; $07D620 |
  STA $056B,x                               ; $07D623 |
  LDA $0593,x                               ; $07D626 |
  ADC $0563,x                               ; $07D629 |
  STA $0563,x                               ; $07D62C |
  LDA $0593,x                               ; $07D62F |
  BMI code_07D63C                           ; $07D632 |
  LDA $055B,x                               ; $07D634 |
  ADC #$00                                  ; $07D637 |
  JMP code_07D641                           ; $07D639 |

code_07D63C:
  LDA $055B,x                               ; $07D63C |
  ADC #$FF                                  ; $07D63F |
code_07D641:
  STA $055B,x                               ; $07D641 |
  RTS                                       ; $07D644 |

code_07D645:
  LDA $86                                   ; $07D645 |
  PHA                                       ; $07D647 |
  LDA #$02                                  ; $07D648 |
  STA $86                                   ; $07D64A |
  JSR code_07CC07                           ; $07D64C |
  PLA                                       ; $07D64F |
  STA $86                                   ; $07D650 |
  RTS                                       ; $07D652 |

  LDA $86                                   ; $07D653 |
  PHA                                       ; $07D655 |
  LDA #$03                                  ; $07D656 |
  STA $86                                   ; $07D658 |
  JSR code_07CC07                           ; $07D65A |
  PLA                                       ; $07D65D |
  STA $86                                   ; $07D65E |
  RTS                                       ; $07D660 |

code_07D661:
  LDA $8E                                   ; $07D661 |
  PHA                                       ; $07D663 |
  JSR code_07C5A4                           ; $07D664 |
  LDA $7D                                   ; $07D667 |
  AND #$01                                  ; $07D669 |
  TAY                                       ; $07D66B |
  STY $19                                   ; $07D66C |
  LDA $D6BA,y                               ; $07D66E |
  STA $04EF                                 ; $07D671 |
code_07D674:
  TAY                                       ; $07D674 |
  LDA #$01                                  ; $07D675 |
  STA $15                                   ; $07D677 |
  LDA $04F3,y                               ; $07D679 |
  BEQ code_07D68C                           ; $07D67C |
  LDA $0501,y                               ; $07D67E |
  CMP #$FF                                  ; $07D681 |
  BEQ code_07D68C                           ; $07D683 |
  JSR code_07D6C0                           ; $07D685 |
  LDA $8C                                   ; $07D688 |
  BEQ code_07D6B6                           ; $07D68A |
code_07D68C:
  LDY $19                                   ; $07D68C |
  LDX $04EF                                 ; $07D68E |
  LDA $15                                   ; $07D691 |
  BNE code_07D69A                           ; $07D693 |
  LDA #$02                                  ; $07D695 |
  STA $04F3,x                               ; $07D697 |
code_07D69A:
  CLC                                       ; $07D69A |
  TXA                                       ; $07D69B |
  ADC $D6BC,y                               ; $07D69C |
  STA $04EF                                 ; $07D69F |
  CMP $D6BE,y                               ; $07D6A2 |
  BNE code_07D674                           ; $07D6A5 |
  LDY $8C                                   ; $07D6A7 |
  BEQ code_07D6B6                           ; $07D6A9 |
  LDA #$EF                                  ; $07D6AB |
code_07D6AD:
  STA $0700,y                               ; $07D6AD |
  INY                                       ; $07D6B0 |
  INY                                       ; $07D6B1 |
  INY                                       ; $07D6B2 |
  INY                                       ; $07D6B3 |
  BNE code_07D6AD                           ; $07D6B4 |
code_07D6B6:
  PLA                                       ; $07D6B6 |
  JMP code_07C5AA                           ; $07D6B7 |

  db $00, $07, $01, $FF, $08, $FF           ; $07D6BA |

code_07D6C0:
  LDA #$00                                  ; $07D6C0 |
  STA $03                                   ; $07D6C2 |
  LDA $0501,y                               ; $07D6C4 |
  ASL                                       ; $07D6C7 |
  STA $02                                   ; $07D6C8 |
  ROL $03                                   ; $07D6CA |
  LDA $0527,y                               ; $07D6CC |
  AND #$01                                  ; $07D6CF |
  LSR                                       ; $07D6D1 |
  ROR                                       ; $07D6D2 |
  STA $12                                   ; $07D6D3 |
  ROR                                       ; $07D6D5 |
  STA $13                                   ; $07D6D6 |
  CLC                                       ; $07D6D8 |
  LDA $02                                   ; $07D6D9 |
  ADC #$00                                  ; $07D6DB |
  STA $02                                   ; $07D6DD |
  LDA $03                                   ; $07D6DF |
  ADC #$80                                  ; $07D6E1 |
  STA $03                                   ; $07D6E3 |
  LDY #$00                                  ; $07D6E5 |
  LDA ($02),y                               ; $07D6E7 |
  STA $00                                   ; $07D6E9 |
  INY                                       ; $07D6EB |
  LDA ($02),y                               ; $07D6EC |
  STA $01                                   ; $07D6EE |
  LDX $04EF                                 ; $07D6F0 |
  LDY $0535,x                               ; $07D6F3 |
code_07D6F6:
  LDA ($00),y                               ; $07D6F6 |
  CMP #$FF                                  ; $07D6F8 |
  BNE code_07D704                           ; $07D6FA |
  LDA #$00                                  ; $07D6FC |
  STA $0535,x                               ; $07D6FE |
  TAY                                       ; $07D701 |
  BEQ code_07D6F6                           ; $07D702 |
code_07D704:
  PHA                                       ; $07D704 |
  LDA $04FB,x                               ; $07D705 |
  CMP #$14                                  ; $07D708 |
  BEQ code_07D714                           ; $07D70A |
  CMP #$2B                                  ; $07D70C |
  BEQ code_07D714                           ; $07D70E |
  LDA $A8                                   ; $07D710 |
  BMI code_07D717                           ; $07D712 |
code_07D714:
  INC $0535,x                               ; $07D714 |
code_07D717:
  LDY #$00                                  ; $07D717 |
  STY $03                                   ; $07D719 |
  LDA $0501,x                               ; $07D71B |
  CMP #$95                                  ; $07D71E |
  BCC code_07D724                           ; $07D720 |
  LDY #$02                                  ; $07D722 |
code_07D724:
  PLA                                       ; $07D724 |
  ASL                                       ; $07D725 |
  ROL $03                                   ; $07D726 |
  ADC $D89B,y                               ; $07D728 |
  STA $02                                   ; $07D72B |
  LDA $03                                   ; $07D72D |
  ADC $D89C,y                               ; $07D72F |
  STA $03                                   ; $07D732 |
  LDY #$00                                  ; $07D734 |
  LDA ($02),y                               ; $07D736 |
  STA $00                                   ; $07D738 |
  INY                                       ; $07D73A |
  LDA ($02),y                               ; $07D73B |
  STA $01                                   ; $07D73D |
  LDY #$00                                  ; $07D73F |
  LDA $05B3,x                               ; $07D741 |
  CMP #$FF                                  ; $07D744 |
  BNE code_07D74A                           ; $07D746 |
  LDY #$20                                  ; $07D748 |
code_07D74A:
  STY $14                                   ; $07D74A |
  LDY #$00                                  ; $07D74C |
  LDA ($00),y                               ; $07D74E |
  STA $0573,x                               ; $07D750 |
  INY                                       ; $07D753 |
  LDA ($00),y                               ; $07D754 |
  STA $057B,x                               ; $07D756 |
  INY                                       ; $07D759 |
  LDA ($00),y                               ; $07D75A |
  ORA $14                                   ; $07D75C |
  STA $18                                   ; $07D75E |
  SEC                                       ; $07D760 |
  LDA $054B,x                               ; $07D761 |
  SBC $CC                                   ; $07D764 |
  STA $04                                   ; $07D766 |
  LDA $0543,x                               ; $07D768 |
  SBC $CD                                   ; $07D76B |
  STA $05                                   ; $07D76D |
  LDA $12                                   ; $07D76F |
  BEQ code_07D780                           ; $07D771 |
  SEC                                       ; $07D773 |
  LDA $04                                   ; $07D774 |
  SBC #$08                                  ; $07D776 |
  STA $04                                   ; $07D778 |
  LDA $05                                   ; $07D77A |
  SBC #$00                                  ; $07D77C |
  STA $05                                   ; $07D77E |
code_07D780:
  SEC                                       ; $07D780 |
  LDA $0563,x                               ; $07D781 |
  SBC $CE                                   ; $07D784 |
  STA $06                                   ; $07D786 |
  LDA $055B,x                               ; $07D788 |
  SBC $CF                                   ; $07D78B |
  STA $07                                   ; $07D78D |
  LDA #$03                                  ; $07D78F |
  STA $04F3,x                               ; $07D791 |
  LDA #$08                                  ; $07D794 |
  STA $11                                   ; $07D796 |
  LDA $18                                   ; $07D798 |
  CMP #$FF                                  ; $07D79A |
  BEQ code_07D818                           ; $07D79C |
code_07D79E:
  INY                                       ; $07D79E |
  LDA ($00),y                               ; $07D79F |
  INY                                       ; $07D7A1 |
  CMP #$FF                                  ; $07D7A2 |
  BEQ code_07D817                           ; $07D7A4 |
  TAX                                       ; $07D7A6 |
  EOR $12                                   ; $07D7A7 |
  BMI code_07D7BB                           ; $07D7A9 |
  AND #$70                                  ; $07D7AB |
  LSR                                       ; $07D7AD |
  LSR                                       ; $07D7AE |
  ADC $04                                   ; $07D7AF |
  STA $0D                                   ; $07D7B1 |
  LDA #$00                                  ; $07D7B3 |
  ADC $05                                   ; $07D7B5 |
  BEQ code_07D7CC                           ; $07D7B7 |
  BNE code_07D79E                           ; $07D7B9 |
code_07D7BB:
  AND #$70                                  ; $07D7BB |
  EOR #$FF                                  ; $07D7BD |
  SEC                                       ; $07D7BF |
  ROR                                       ; $07D7C0 |
  ROR                                       ; $07D7C1 |
  ADC $04                                   ; $07D7C2 |
  STA $0D                                   ; $07D7C4 |
  LDA #$FF                                  ; $07D7C6 |
  ADC $05                                   ; $07D7C8 |
  BNE code_07D79E                           ; $07D7CA |
code_07D7CC:
  TXA                                       ; $07D7CC |
  AND #$08                                  ; $07D7CD |
  BNE code_07D7E3                           ; $07D7CF |
  TXA                                       ; $07D7D1 |
  AND #$07                                  ; $07D7D2 |
  CLC                                       ; $07D7D4 |
  ROL                                       ; $07D7D5 |
  ROL                                       ; $07D7D6 |
  ADC $06                                   ; $07D7D7 |
  STA $0F                                   ; $07D7D9 |
  LDA #$00                                  ; $07D7DB |
  ADC $07                                   ; $07D7DD |
  BEQ code_07D7F5                           ; $07D7DF |
  BNE code_07D79E                           ; $07D7E1 |
code_07D7E3:
  TXA                                       ; $07D7E3 |
  AND #$07                                  ; $07D7E4 |
  EOR #$FF                                  ; $07D7E6 |
  SEC                                       ; $07D7E8 |
  ROL                                       ; $07D7E9 |
  ROL                                       ; $07D7EA |
  ADC $06                                   ; $07D7EB |
  STA $0F                                   ; $07D7ED |
  LDA #$FF                                  ; $07D7EF |
  ADC $07                                   ; $07D7F1 |
  BNE code_07D79E                           ; $07D7F3 |
code_07D7F5:
  STA $15                                   ; $07D7F5 |
  LDA ($00),y                               ; $07D7F7 |
  LDX $8C                                   ; $07D7F9 |
  STA $0701,x                               ; $07D7FB |
  LDA $0F                                   ; $07D7FE |
  STA $0700,x                               ; $07D800 |
  LDA $18                                   ; $07D803 |
  EOR $13                                   ; $07D805 |
  STA $0702,x                               ; $07D807 |
  LDA $0D                                   ; $07D80A |
  STA $0703,x                               ; $07D80C |
  INX                                       ; $07D80F |
  INX                                       ; $07D810 |
  INX                                       ; $07D811 |
  INX                                       ; $07D812 |
  STX $8C                                   ; $07D813 |
  BNE code_07D79E                           ; $07D815 |
code_07D817:
  RTS                                       ; $07D817 |

code_07D818:
  DEY                                       ; $07D818 |
code_07D819:
  INY                                       ; $07D819 |
code_07D81A:
  INY                                       ; $07D81A |
  LDA ($00),y                               ; $07D81B |
  INY                                       ; $07D81D |
  CMP #$FF                                  ; $07D81E |
  BEQ code_07D89A                           ; $07D820 |
  TAX                                       ; $07D822 |
  EOR $12                                   ; $07D823 |
  BMI code_07D837                           ; $07D825 |
  AND #$70                                  ; $07D827 |
  LSR                                       ; $07D829 |
  LSR                                       ; $07D82A |
  ADC $04                                   ; $07D82B |
  STA $0D                                   ; $07D82D |
  LDA #$00                                  ; $07D82F |
  ADC $05                                   ; $07D831 |
  BEQ code_07D848                           ; $07D833 |
  BNE code_07D819                           ; $07D835 |
code_07D837:
  AND #$70                                  ; $07D837 |
  EOR #$FF                                  ; $07D839 |
  SEC                                       ; $07D83B |
  ROR                                       ; $07D83C |
  ROR                                       ; $07D83D |
  ADC $04                                   ; $07D83E |
  STA $0D                                   ; $07D840 |
  LDA #$FF                                  ; $07D842 |
  ADC $05                                   ; $07D844 |
  BNE code_07D819                           ; $07D846 |
code_07D848:
  TXA                                       ; $07D848 |
  AND #$08                                  ; $07D849 |
  BNE code_07D85F                           ; $07D84B |
  TXA                                       ; $07D84D |
  AND #$07                                  ; $07D84E |
  CLC                                       ; $07D850 |
  ASL                                       ; $07D851 |
  ASL                                       ; $07D852 |
  ADC $06                                   ; $07D853 |
  STA $0F                                   ; $07D855 |
  LDA #$00                                  ; $07D857 |
  ADC $07                                   ; $07D859 |
  BEQ code_07D871                           ; $07D85B |
  BNE code_07D819                           ; $07D85D |
code_07D85F:
  TXA                                       ; $07D85F |
  AND #$07                                  ; $07D860 |
  EOR #$FF                                  ; $07D862 |
  SEC                                       ; $07D864 |
  ROL                                       ; $07D865 |
  ROL                                       ; $07D866 |
  ADC $06                                   ; $07D867 |
  STA $0F                                   ; $07D869 |
  LDA #$FF                                  ; $07D86B |
  ADC $07                                   ; $07D86D |
  BNE code_07D819                           ; $07D86F |
code_07D871:
  STA $15                                   ; $07D871 |
  LDA ($00),y                               ; $07D873 |
  ORA $14                                   ; $07D875 |
  EOR $13                                   ; $07D877 |
  STA $0E                                   ; $07D879 |
  INY                                       ; $07D87B |
  LDA ($00),y                               ; $07D87C |
  LDX $8C                                   ; $07D87E |
  STA $0701,x                               ; $07D880 |
  LDA $0F                                   ; $07D883 |
  STA $0700,x                               ; $07D885 |
  LDA $0E                                   ; $07D888 |
  STA $0702,x                               ; $07D88A |
  LDA $0D                                   ; $07D88D |
  STA $0703,x                               ; $07D88F |
  INX                                       ; $07D892 |
  INX                                       ; $07D893 |
  INX                                       ; $07D894 |
  INX                                       ; $07D895 |
  STX $8C                                   ; $07D896 |
  BNE code_07D81A                           ; $07D898 |
code_07D89A:
  RTS                                       ; $07D89A |

  dw $89F8                                  ; $07D89B |
  dw $A94D                                  ; $07D89D |

code_07D89F:
  JSR code_07DA78                           ; $07D89F |
  JSR code_07C59C                           ; $07D8A2 |
  JSR $BC00                                 ; $07D8A5 |
  JSR code_07EA6A                           ; $07D8A8 |
  JSR $BC03                                 ; $07D8AB |
  JSR code_07C5A8                           ; $07D8AE |
  RTS                                       ; $07D8B1 |

code_07D8B2:
  LDA $8E                                   ; $07D8B2 |
  PHA                                       ; $07D8B4 |
  JSR code_07C594                           ; $07D8B5 |
  JSR $BD40                                 ; $07D8B8 |
  PLA                                       ; $07D8BB |
  JSR code_07C5AA                           ; $07D8BC |
  RTS                                       ; $07D8BF |

code_07D8C0:
  LDA $8E                                   ; $07D8C0 |
  PHA                                       ; $07D8C2 |
  JSR code_07C594                           ; $07D8C3 |
  JSR $BD43                                 ; $07D8C6 |
  PLA                                       ; $07D8C9 |
  JSR code_07C5AA                           ; $07D8CA |
  RTS                                       ; $07D8CD |

code_07D8CE:
  LDA $8E                                   ; $07D8CE |
  PHA                                       ; $07D8D0 |
  JSR code_07C594                           ; $07D8D1 |
  JSR $BD46                                 ; $07D8D4 |
  PLA                                       ; $07D8D7 |
  JSR code_07C5AA                           ; $07D8D8 |
  RTS                                       ; $07D8DB |

code_07D8DC:
  LDA $8E                                   ; $07D8DC |
  PHA                                       ; $07D8DE |
  JSR code_07C594                           ; $07D8DF |
  JSR $BD49                                 ; $07D8E2 |
  PLA                                       ; $07D8E5 |
  JSR code_07C5AA                           ; $07D8E6 |
  RTS                                       ; $07D8E9 |

code_07D8EA:
  LDA $8E                                   ; $07D8EA |
  PHA                                       ; $07D8EC |
  JSR code_07C5A0                           ; $07D8ED |
  LDA $51                                   ; $07D8F0 |
  ASL                                       ; $07D8F2 |
  TAY                                       ; $07D8F3 |
  LDA $BC00,y                               ; $07D8F4 |
  STA $02                                   ; $07D8F7 |
  LDA $BC01,y                               ; $07D8F9 |
  STA $03                                   ; $07D8FC |
  LDA #$00                                  ; $07D8FE |
  STA $0D                                   ; $07D900 |
  LDA $52                                   ; $07D902 |
  ASL                                       ; $07D904 |
  ASL                                       ; $07D905 |
  ASL                                       ; $07D906 |
  ASL                                       ; $07D907 |
  ROL $0D                                   ; $07D908 |
  CLC                                       ; $07D90A |
  ADC $02                                   ; $07D90B |
  STA $02                                   ; $07D90D |
  LDA $03                                   ; $07D90F |
  ADC $0D                                   ; $07D911 |
  STA $03                                   ; $07D913 |
  LDY #$00                                  ; $07D915 |
  LDA ($02),y                               ; $07D917 |
  PHA                                       ; $07D919 |
  CMP #$FF                                  ; $07D91A |
  BEQ code_07D941                           ; $07D91C |
  LDA #$04                                  ; $07D91E |
  STA $EC                                   ; $07D920 |
  JSR code_07C800                           ; $07D922 |
  PLA                                       ; $07D925 |
  PHA                                       ; $07D926 |
  STA $CD                                   ; $07D927 |
  STA $37                                   ; $07D929 |
  INY                                       ; $07D92B |
  LDA ($02),y                               ; $07D92C |
  STA $CC                                   ; $07D92E |
  STA $36                                   ; $07D930 |
  INY                                       ; $07D932 |
  LDA ($02),y                               ; $07D933 |
  STA $CE                                   ; $07D935 |
  STA $38                                   ; $07D937 |
  LDA #$00                                  ; $07D939 |
  STA $CF                                   ; $07D93B |
  STA $39                                   ; $07D93D |
  BEQ code_07D943                           ; $07D93F |
code_07D941:
  INY                                       ; $07D941 |
  INY                                       ; $07D942 |
code_07D943:
  INY                                       ; $07D943 |\
  LDA ($02),y                               ; $07D944 | |
  BEQ code_07D94A                           ; $07D946 | |
  STA $91                                   ; $07D948 |/  Set Donald's x starting position on level
code_07D94A:
  INY                                       ; $07D94A |\
  LDA ($02),y                               ; $07D94B | |
  BEQ code_07D953                           ; $07D94D | |
  STA $93                                   ; $07D94F | | Set Donald's y starting position on level
  STA $95                                   ; $07D951 |/
code_07D953:
  INY                                       ; $07D953 |
  LDA ($02),y                               ; $07D954 |
  STA $4D                                   ; $07D956 |
  INY                                       ; $07D958 |
  LDA ($02),y                               ; $07D959 |
  STA $4C                                   ; $07D95B |
  INY                                       ; $07D95D |
  LDA ($02),y                               ; $07D95E |
  STA $AE                                   ; $07D960 |
  INY                                       ; $07D962 |
  LDA ($02),y                               ; $07D963 |
  STA $AF                                   ; $07D965 |
  INY                                       ; $07D967 |
  LDA ($02),y                               ; $07D968 |
  STA $B0                                   ; $07D96A |
  INY                                       ; $07D96C |
  LDA ($02),y                               ; $07D96D |
  STA $A7                                   ; $07D96F |
  INY                                       ; $07D971 |
  LDA ($02),y                               ; $07D972 |
  STA $53                                   ; $07D974 |
  INY                                       ; $07D976 |
  LDA ($02),y                               ; $07D977 |
  STA $B1                                   ; $07D979 |
  PLA                                       ; $07D97B |
  CMP #$FF                                  ; $07D97C |
  BNE code_07D983                           ; $07D97E |
  JMP code_07DA1B                           ; $07D980 |

code_07D983:
  JSR code_07C0E9                           ; $07D983 |
  LDA #$00                                  ; $07D986 |
  STA $061A                                 ; $07D988 |
  STA $B6                                   ; $07D98B |
  STA $AB                                   ; $07D98D |
  STA $AC                                   ; $07D98F |
  STA $98                                   ; $07D991 |
  STA $99                                   ; $07D993 |
  STA $9A                                   ; $07D995 |
  STA $9B                                   ; $07D997 |
  STA $A3                                   ; $07D999 |
  STA $A4                                   ; $07D99B |
  STA $9C                                   ; $07D99D |
  STA $9D                                   ; $07D99F |
  STA $94                                   ; $07D9A1 |
  STA $A5                                   ; $07D9A3 |
  STA $A6                                   ; $07D9A5 |
  STA $E9                                   ; $07D9A7 |
  STA $DB                                   ; $07D9A9 |
  STA $E3                                   ; $07D9AB |
  STA $E4                                   ; $07D9AD |
  STA $E2                                   ; $07D9AF |
  STA $D8                                   ; $07D9B1 |
  STA $A2                                   ; $07D9B3 |
  STA $A8                                   ; $07D9B5 |
  STA $DD                                   ; $07D9B7 |
  STA $B3                                   ; $07D9B9 |
  STA $BA                                   ; $07D9BB |
  STA $BB                                   ; $07D9BD |
  STA $BC                                   ; $07D9BF |
  STA $E7                                   ; $07D9C1 |
  STA $BD                                   ; $07D9C3 |
  STA $D7                                   ; $07D9C5 |
  STA $04ED                                 ; $07D9C7 |
  STA $04EE                                 ; $07D9CA |
  STA $04EF                                 ; $07D9CD |
  STA $0605                                 ; $07D9D0 |
  JSR code_07F8A8                           ; $07D9D3 |
  LDY #$07                                  ; $07D9D6 |
code_07D9D8:
  STA $04F3,y                               ; $07D9D8 |
  DEY                                       ; $07D9DB |
  BPL code_07D9D8                           ; $07D9DC |
  LDY #$09                                  ; $07D9DE |
code_07D9E0:
  STA $05BF,y                               ; $07D9E0 |
  DEY                                       ; $07D9E3 |
  BPL code_07D9E0                           ; $07D9E4 |
  JSR code_07CD31                           ; $07D9E6 |
  LDA #$05                                  ; $07D9E9 |
  STA $EC                                   ; $07D9EB |
  LDA #$00                                  ; $07D9ED |
  STA $84                                   ; $07D9EF |
  LDA $53                                   ; $07D9F1 |
  JSR code_07C8A9                           ; $07D9F3 |
  LDA #$01                                  ; $07D9F6 |
  STA $90                                   ; $07D9F8 |
  LDA #$02                                  ; $07D9FA |
  STA $D3                                   ; $07D9FC |
  LDA #$01                                  ; $07D9FE |
  STA $88                                   ; $07DA00 |
  JSR code_07DDBA                           ; $07DA02 |
  LDA $51                                   ; $07DA05 |
  CMP #$01                                  ; $07DA07 |
  BNE code_07DA1B                           ; $07DA09 |
  LDA $52                                   ; $07DA0B |
  BNE code_07DA1B                           ; $07DA0D |
  LDA #$01                                  ; $07DA0F |
  STA $D7                                   ; $07DA11 |
  LDA #$00                                  ; $07DA13 |
  STA $D3                                   ; $07DA15 |
  LDA #$02                                  ; $07DA17 |
  STA $88                                   ; $07DA19 |
code_07DA1B:
  LDA $DB                                   ; $07DA1B |
  BEQ code_07DA25                           ; $07DA1D |
  CMP $DA                                   ; $07DA1F |
  BEQ code_07DA31                           ; $07DA21 |
  BNE code_07DA2E                           ; $07DA23 |
code_07DA25:
  LDY $51                                   ; $07DA25 |
  LDA $DA65,y                               ; $07DA27 |
  CMP $DA                                   ; $07DA2A |
  BEQ code_07DA31                           ; $07DA2C |
code_07DA2E:
  JSR code_07C0D0                           ; $07DA2E |
code_07DA31:
  LDA $51                                   ; $07DA31 |
  CMP #$09                                  ; $07DA33 |
  BNE code_07DA60                           ; $07DA35 |
  LDA $91                                   ; $07DA37 |
  STA $0707                                 ; $07DA39 |
  STA $BE                                   ; $07DA3C |
  STA $C2                                   ; $07DA3E |
  LDA $93                                   ; $07DA40 |
  SEC                                       ; $07DA42 |
  SBC #$18                                  ; $07DA43 |
  STA $C5                                   ; $07DA45 |
  STA $0704                                 ; $07DA47 |
  LDA #$01                                  ; $07DA4A |
  STA $C4                                   ; $07DA4C |
  LDA #$00                                  ; $07DA4E |
  STA $C1                                   ; $07DA50 |
  STA $BF                                   ; $07DA52 |
  STA $C0                                   ; $07DA54 |
  STA $C4                                   ; $07DA56 |
  STA $0706                                 ; $07DA58 |
  LDA #$05                                  ; $07DA5B |
  STA $0705                                 ; $07DA5D |
code_07DA60:
  PLA                                       ; $07DA60 |
  JSR code_07C5AA                           ; $07DA61 |
  RTS                                       ; $07DA64 |

; Music ids, per level
  db $20, $22, $22, $22, $25, $22, $24, $23 ; $07DA65 |
  db $22, $26, $23, $24, $27, $2B, $31, $31 ; $07DA6D |
  db $31, $31, $2C                          ; $07DA75 |

code_07DA78:
  JSR code_07DA8C                           ; $07DA78 |
  LDA $8E                                   ; $07DA7B |
  PHA                                       ; $07DA7D |
  JSR code_07C5A0                           ; $07DA7E |
  JSR $B900                                 ; $07DA81 |
  JSR $B903                                 ; $07DA84 |
  PLA                                       ; $07DA87 |
  JSR code_07C5AA                           ; $07DA88 |
  RTS                                       ; $07DA8B |

code_07DA8C:
  LDA #$00                                  ; $07DA8C |
  STA $A3                                   ; $07DA8E |
  STA $A4                                   ; $07DA90 |
  STA $A5                                   ; $07DA92 |
  STA $A6                                   ; $07DA94 |
  STA $B6                                   ; $07DA96 |
  STA $B7                                   ; $07DA98 |
  LDA $B1                                   ; $07DA9A |
  ASL                                       ; $07DA9C |
  TAY                                       ; $07DA9D |
  LDA $DAA8,y                               ; $07DA9E |
  PHA                                       ; $07DAA1 |
  LDA $DAA7,y                               ; $07DAA2 |
  PHA                                       ; $07DAA5 |
  RTS                                       ; $07DAA6 |

  dw $DAAC                                  ; $07DAA7 |
  dw $DC14                                  ; $07DAA9 |
  dw $DD28                                  ; $07DAAB |

  CLC                                       ; $07DAAD |
  LDA $B4                                   ; $07DAAE |
  AND #$7F                                  ; $07DAB0 |
  ROL                                       ; $07DAB2 |
  ROL                                       ; $07DAB3 |
  ROL                                       ; $07DAB4 |
  PHA                                       ; $07DAB5 |
  ROL                                       ; $07DAB6 |
  PHA                                       ; $07DAB7 |
  LDA $C7                                   ; $07DAB8 |
  AND #$40                                  ; $07DABA |
  BEQ code_07DAC4                           ; $07DABC |
  PLA                                       ; $07DABE |
  CLC                                       ; $07DABF |
  ADC #$06                                  ; $07DAC0 |
  BNE code_07DAC5                           ; $07DAC2 |
code_07DAC4:
  PLA                                       ; $07DAC4 |
code_07DAC5:
  TAX                                       ; $07DAC5 |
  LDA $DBF7,x                               ; $07DAC6 |
  STA $9E                                   ; $07DAC9 |
  LDA $DBF8,x                               ; $07DACB |
  STA $9F                                   ; $07DACE |
  LDA $DC03,x                               ; $07DAD0 |
  STA $A0                                   ; $07DAD3 |
  LDA $DC04,x                               ; $07DAD5 |
  STA $A1                                   ; $07DAD8 |
  PLA                                       ; $07DADA |
  TAX                                       ; $07DADB |
  LDA $84                                   ; $07DADC |
  STA $B2                                   ; $07DADE |
  LDA $A8                                   ; $07DAE0 |
  AND #$21                                  ; $07DAE2 |
  BNE code_07DAE9                           ; $07DAE4 |
  JMP code_07DB5F                           ; $07DAE6 |

code_07DAE9:
  LDA #$00                                  ; $07DAE9 |
  STA $AB                                   ; $07DAEB |
  STA $AC                                   ; $07DAED |
  STA $D8                                   ; $07DAEF |
  LDA $51                                   ; $07DAF1 |
  CMP #$06                                  ; $07DAF3 |
  BNE code_07DB05                           ; $07DAF5 |
  LDA $B4                                   ; $07DAF7 |
  BPL code_07DB05                           ; $07DAF9 |
  AND #$7F                                  ; $07DAFB |
  STA $B4                                   ; $07DAFD |
  LDA #$06                                  ; $07DAFF |
  STA $DC                                   ; $07DB01 |
  BNE code_07DB0D                           ; $07DB03 |
code_07DB05:
  LDA #$00                                  ; $07DB05 |
  STA $DC                                   ; $07DB07 |
  LDA $C7                                   ; $07DB09 |
  BPL code_07DB15                           ; $07DB0B |
code_07DB0D:
  LDA #$03                                  ; $07DB0D |
  JSR code_07C0B7                           ; $07DB0F |
  JMP code_07DBB0                           ; $07DB12 |

code_07DB15:
  LDA $C7                                   ; $07DB15 |
  AND #$40                                  ; $07DB17 |
  ORA $B2                                   ; $07DB19 |
  STA $B2                                   ; $07DB1B |
  LDA $A7                                   ; $07DB1D |
  ORA #$21                                  ; $07DB1F |
  STA $A7                                   ; $07DB21 |
  LDA $DC0F,x                               ; $07DB23 |
  STA $B6                                   ; $07DB26 |
  LDA $A8                                   ; $07DB28 |
  AND #$20                                  ; $07DB2A |
  BEQ code_07DB32                           ; $07DB2C |
  LDA #$00                                  ; $07DB2E |
  STA $B6                                   ; $07DB30 |
code_07DB32:
  LDA $DC12,x                               ; $07DB32 |
  STA $B7                                   ; $07DB35 |
  LDA $84                                   ; $07DB37 |
  CMP #$02                                  ; $07DB39 |
  BNE code_07DB42                           ; $07DB3B |
  LDA #$08                                  ; $07DB3D |
  JMP code_07DBD4                           ; $07DB3F |

code_07DB42:
  BCC code_07DB49                           ; $07DB42 |
code_07DB44:
  LDA #$04                                  ; $07DB44 |
  JMP code_07DBD4                           ; $07DB46 |

code_07DB49:
  LDA $A8                                   ; $07DB49 |
  AND #$20                                  ; $07DB4B |
  BNE code_07DB55                           ; $07DB4D |
  LDA $9A                                   ; $07DB4F |
  ORA $9B                                   ; $07DB51 |
  BNE code_07DB44                           ; $07DB53 |
code_07DB55:
  LDA $98                                   ; $07DB55 |
  ORA $99                                   ; $07DB57 |
  BNE code_07DB44                           ; $07DB59 |
  LDA #$0E                                  ; $07DB5B |
  BNE code_07DBD4                           ; $07DB5D |
code_07DB5F:
  LDA $DC                                   ; $07DB5F |
  BNE code_07DB79                           ; $07DB61 |
  LDA $C7                                   ; $07DB63 |
  AND #$03                                  ; $07DB65 |
  BEQ code_07DB79                           ; $07DB67 |
  STA $0D                                   ; $07DB69 |
  LDA $C8                                   ; $07DB6B |
  AND #$03                                  ; $07DB6D |
  EOR $0D                                   ; $07DB6F |
  BEQ code_07DB79                           ; $07DB71 |
  LDA #$01                                  ; $07DB73 |
  STA $B7                                   ; $07DB75 |
  STA $D8                                   ; $07DB77 |
code_07DB79:
  LDA $AC                                   ; $07DB79 |
  BEQ code_07DB8F                           ; $07DB7B |
  CMP #$0E                                  ; $07DB7D |
  BCS code_07DB8F                           ; $07DB7F |
  LDA $AB                                   ; $07DB81 |
  CMP #$01                                  ; $07DB83 |
  BNE code_07DB8F                           ; $07DB85 |
  LDA $C7                                   ; $07DB87 |
  BMI code_07DBB0                           ; $07DB89 |
  LDA $DC                                   ; $07DB8B |
  BNE code_07DBB0                           ; $07DB8D |
code_07DB8F:
  LDA $AB                                   ; $07DB8F |
  CMP #$02                                  ; $07DB91 |
  BEQ code_07DB99                           ; $07DB93 |
  INC $AC                                   ; $07DB95 |
  BNE code_07DB9F                           ; $07DB97 |
code_07DB99:
  LDA $A7                                   ; $07DB99 |
  ORA #$21                                  ; $07DB9B |
  STA $A7                                   ; $07DB9D |
code_07DB9F:
  LDA $DC0F                                 ; $07DB9F |
  STA $B6                                   ; $07DBA2 |
  LDA $AB                                   ; $07DBA4 |
  BNE code_07DBAC                           ; $07DBA6 |
  LDA #$08                                  ; $07DBA8 |
  BNE code_07DBD4                           ; $07DBAA |
code_07DBAC:
  LDA #$06                                  ; $07DBAC |
  BNE code_07DBD4                           ; $07DBAE |
code_07DBB0:
  LDA $DC                                   ; $07DBB0 |
  BEQ code_07DBB6                           ; $07DBB2 |
  DEC $DC                                   ; $07DBB4 |
code_07DBB6:
  LDA #$80                                  ; $07DBB6 |
  ORA $B2                                   ; $07DBB8 |
  STA $B2                                   ; $07DBBA |
  LDA $DC                                   ; $07DBBC |
  BNE code_07DBCC                           ; $07DBBE |
  LDA $A7                                   ; $07DBC0 |
  AND #$DE                                  ; $07DBC2 |
  STA $A7                                   ; $07DBC4 |
  LDA $A8                                   ; $07DBC6 |
  AND #$DE                                  ; $07DBC8 |
  STA $A8                                   ; $07DBCA |
code_07DBCC:
  INC $AC                                   ; $07DBCC |
  LDA #$01                                  ; $07DBCE |
  STA $AB                                   ; $07DBD0 |
  LDA #$06                                  ; $07DBD2 |
code_07DBD4:
  PHA                                       ; $07DBD4 |
  LDA $D4                                   ; $07DBD5 |
  AND #$40                                  ; $07DBD7 |
  BNE code_07DBEA                           ; $07DBD9 |
  LDA $C7                                   ; $07DBDB |
  AND #$40                                  ; $07DBDD |
  BEQ code_07DBEA                           ; $07DBDF |
  LDA #$08                                  ; $07DBE1 |
  STA $7B                                   ; $07DBE3 |
code_07DBE5:
  PLA                                       ; $07DBE5 |
  LDA #$0A                                  ; $07DBE6 |
  BNE code_07DBF4                           ; $07DBE8 |
code_07DBEA:
  LDA $7B                                   ; $07DBEA |
  BEQ code_07DBF3                           ; $07DBEC |
  DEC $7B                                   ; $07DBEE |
  JMP code_07DBE5                           ; $07DBF0 |

code_07DBF3:
  PLA                                       ; $07DBF3 |
code_07DBF4:
  STA $8F                                   ; $07DBF4 |
  RTS                                       ; $07DBF6 |

  db $01, $80, $01, $00, $01, $80, $02, $00 ; $07DBF7 |
  db $01, $80, $02, $00, $04, $00, $04, $00 ; $07DBFF |
  db $04, $00, $04, $00, $04, $00, $04, $00 ; $07DC07 |
  db $40, $40, $40, $20, $03, $50           ; $07DC0F |

  LDA #$00                                  ; $07DC15 |
  STA $AB                                   ; $07DC17 |
  LDA $DD23                                 ; $07DC19 |
  STA $9E                                   ; $07DC1C |
  LDA $DD24                                 ; $07DC1E |
  STA $9F                                   ; $07DC21 |
  LDA $DD25                                 ; $07DC23 |
  STA $A0                                   ; $07DC26 |
  LDA $DD26                                 ; $07DC28 |
  STA $A1                                   ; $07DC2B |
  LDA $DD27                                 ; $07DC2D |
  STA $B6                                   ; $07DC30 |
  LDA $DD28                                 ; $07DC32 |
  STA $B7                                   ; $07DC35 |
  LDA $84                                   ; $07DC37 |
  STA $B2                                   ; $07DC39 |
  LDA $C8                                   ; $07DC3B |
  BMI code_07DC46                           ; $07DC3D |
  LDA $C7                                   ; $07DC3F |
  BPL code_07DC46                           ; $07DC41 |
  JMP code_07DCAB                           ; $07DC43 |

code_07DC46:
  LDA $C8                                   ; $07DC46 |
  ASL                                       ; $07DC48 |
  BPL code_07DC57                           ; $07DC49 |
  LDA $C7                                   ; $07DC4B |
  ASL                                       ; $07DC4D |
  BPL code_07DC57                           ; $07DC4E |
  LDA $7B                                   ; $07DC50 |
  BNE code_07DC57                           ; $07DC52 |
  JMP code_07DCD6                           ; $07DC54 |

code_07DC57:
  LDA $A8                                   ; $07DC57 |
  AND #$21                                  ; $07DC59 |
  BEQ code_07DC95                           ; $07DC5B |
  LDA #$00                                  ; $07DC5D |
  STA $C6                                   ; $07DC5F |
  LDA $A8                                   ; $07DC61 |
  AND #$20                                  ; $07DC63 |
  BEQ code_07DC6F                           ; $07DC65 |
  LDA #$00                                  ; $07DC67 |
  STA $B6                                   ; $07DC69 |
  STA $9C                                   ; $07DC6B |
  STA $9D                                   ; $07DC6D |
code_07DC6F:
  LDA $84                                   ; $07DC6F |
  CMP #$02                                  ; $07DC71 |
  BNE code_07DC79                           ; $07DC73 |
  LDA #$08                                  ; $07DC75 |
  BNE code_07DCF6                           ; $07DC77 |
code_07DC79:
  LDA #$00                                  ; $07DC79 |
  STA $9C                                   ; $07DC7B |
  STA $9D                                   ; $07DC7D |
  STA $98                                   ; $07DC7F |
  STA $99                                   ; $07DC81 |
  LDA $8F                                   ; $07DC83 |
  CMP #$0E                                  ; $07DC85 |
  BEQ code_07DC91                           ; $07DC87 |
  CMP #$0F                                  ; $07DC89 |
  BEQ code_07DC91                           ; $07DC8B |
  LDA #$10                                  ; $07DC8D |
  STA $AC                                   ; $07DC8F |
code_07DC91:
  LDA #$0E                                  ; $07DC91 |
  BNE code_07DCF6                           ; $07DC93 |
code_07DC95:
  LDA $C6                                   ; $07DC95 |
  BNE code_07DCA7                           ; $07DC97 |
  LDA $C7                                   ; $07DC99 |
  BMI code_07DCA3                           ; $07DC9B |
  LDA $98                                   ; $07DC9D |
  ORA $99                                   ; $07DC9F |
  BEQ code_07DCA7                           ; $07DCA1 |
code_07DCA3:
  LDA #$10                                  ; $07DCA3 |
  BNE code_07DCF6                           ; $07DCA5 |
code_07DCA7:
  LDA #$12                                  ; $07DCA7 |
  BNE code_07DCF6                           ; $07DCA9 |
code_07DCAB:
  LDA #$11                                  ; $07DCAB |
  JSR code_07C0B7                           ; $07DCAD |
  LDA #$00                                  ; $07DCB0 |
  STA $C6                                   ; $07DCB2 |
  LDA #$80                                  ; $07DCB4 |
  ORA $B2                                   ; $07DCB6 |
  STA $B2                                   ; $07DCB8 |
  LDA $A8                                   ; $07DCBA |
  AND #$21                                  ; $07DCBC |
  BEQ code_07DCCC                           ; $07DCBE |
  LDA $84                                   ; $07DCC0 |
  CMP #$03                                  ; $07DCC2 |
  BCS code_07DCCC                           ; $07DCC4 |
  LDA #$01                                  ; $07DCC6 |
  STA $C6                                   ; $07DCC8 |
  BNE code_07DC95                           ; $07DCCA |
code_07DCCC:
  LDA #$01                                  ; $07DCCC |
  STA $AB                                   ; $07DCCE |
  LDA #$10                                  ; $07DCD0 |
  STA $AC                                   ; $07DCD2 |
  BNE code_07DCA3                           ; $07DCD4 |
code_07DCD6:
  LDA #$00                                  ; $07DCD6 |
  STA $C6                                   ; $07DCD8 |
  LDA $98                                   ; $07DCDA |
  ORA $99                                   ; $07DCDC |
  BNE code_07DCA3                           ; $07DCDE |
  LDA $0632                                 ; $07DCE0 |
  BNE code_07DCEA                           ; $07DCE3 |
  LDA #$11                                  ; $07DCE5 |
  JSR code_07C0B7                           ; $07DCE7 |
code_07DCEA:
  LDA #$40                                  ; $07DCEA |
  ORA $B2                                   ; $07DCEC |
  STA $B2                                   ; $07DCEE |
  LDA #$10                                  ; $07DCF0 |
  STA $AC                                   ; $07DCF2 |
  BNE code_07DCA3                           ; $07DCF4 |
code_07DCF6:
  PHA                                       ; $07DCF6 |
  LDA $AB                                   ; $07DCF7 |
  BEQ code_07DD01                           ; $07DCF9 |
  DEC $AC                                   ; $07DCFB |
  PLA                                       ; $07DCFD |
  LDA #$12                                  ; $07DCFE |
  PHA                                       ; $07DD00 |
code_07DD01:
  LDA $D4                                   ; $07DD01 |
  AND #$40                                  ; $07DD03 |
  BNE code_07DD16                           ; $07DD05 |
  LDA $C7                                   ; $07DD07 |
  AND #$40                                  ; $07DD09 |
  BEQ code_07DD16                           ; $07DD0B |
  LDA #$08                                  ; $07DD0D |
  STA $7B                                   ; $07DD0F |
code_07DD11:
  PLA                                       ; $07DD11 |
  LDA #$0A                                  ; $07DD12 |
  BNE code_07DD20                           ; $07DD14 |
code_07DD16:
  LDA $7B                                   ; $07DD16 |
  BEQ code_07DD1F                           ; $07DD18 |
  DEC $7B                                   ; $07DD1A |
  JMP code_07DD11                           ; $07DD1C |

code_07DD1F:
  PLA                                       ; $07DD1F |
code_07DD20:
  STA $8F                                   ; $07DD20 |
  RTS                                       ; $07DD22 |

  db $02, $00, $01, $00, $08, $10           ; $07DD23 |

  LDA $C7                                   ; $07DD29 |
  AND #$80                                  ; $07DD2B |
  BEQ code_07DD33                           ; $07DD2D |
  LDX #$02                                  ; $07DD2F |
  BNE code_07DD35                           ; $07DD31 |
code_07DD33:
  LDX #$00                                  ; $07DD33 |
code_07DD35:
  LDA $DDAE,x                               ; $07DD35 |
  STA $9E                                   ; $07DD38 |
  LDA $DDAF,x                               ; $07DD3A |
  STA $9F                                   ; $07DD3D |
  LDA $DDB2,x                               ; $07DD3F |
  STA $A0                                   ; $07DD42 |
  LDA $DDB3,x                               ; $07DD44 |
  STA $A1                                   ; $07DD47 |
  LDA $87                                   ; $07DD49 |
  STA $B2                                   ; $07DD4B |
  LDA #$00                                  ; $07DD4D |
  STA $AB                                   ; $07DD4F |
  STA $AC                                   ; $07DD51 |
  LDA $C7                                   ; $07DD53 |
  AND #$40                                  ; $07DD55 |
  ORA $B2                                   ; $07DD57 |
  STA $B2                                   ; $07DD59 |
  LDA $A7                                   ; $07DD5B |
  ORA #$21                                  ; $07DD5D |
  STA $A7                                   ; $07DD5F |
  LDA $DDB6                                 ; $07DD61 |
  STA $B6                                   ; $07DD64 |
  LDA $A8                                   ; $07DD66 |
  AND #$20                                  ; $07DD68 |
  BEQ code_07DD70                           ; $07DD6A |
  LDA #$00                                  ; $07DD6C |
  STA $B6                                   ; $07DD6E |
code_07DD70:
  LDA $DDB8                                 ; $07DD70 |
  STA $B7                                   ; $07DD73 |
  LDA $84                                   ; $07DD75 |
  CMP #$02                                  ; $07DD77 |
  BNE code_07DD7F                           ; $07DD79 |
  LDA #$18                                  ; $07DD7B |
  BNE code_07DD8B                           ; $07DD7D |
code_07DD7F:
  LDA $A8                                   ; $07DD7F |
  AND #$21                                  ; $07DD81 |
  BEQ code_07DD89                           ; $07DD83 |
  LDA #$1A                                  ; $07DD85 |
  BNE code_07DD8B                           ; $07DD87 |
code_07DD89:
  LDA #$14                                  ; $07DD89 |
code_07DD8B:
  PHA                                       ; $07DD8B |
  LDA $D4                                   ; $07DD8C |
  AND #$40                                  ; $07DD8E |
  BNE code_07DDA1                           ; $07DD90 |
  LDA $C7                                   ; $07DD92 |
  AND #$40                                  ; $07DD94 |
  BEQ code_07DDA1                           ; $07DD96 |
  LDA #$08                                  ; $07DD98 |
  STA $7B                                   ; $07DD9A |
code_07DD9C:
  PLA                                       ; $07DD9C |
  LDA #$16                                  ; $07DD9D |
  BNE code_07DDAB                           ; $07DD9F |
code_07DDA1:
  LDA $7B                                   ; $07DDA1 |
  BEQ code_07DDAA                           ; $07DDA3 |
  DEC $7B                                   ; $07DDA5 |
  JMP code_07DD9C                           ; $07DDA7 |

code_07DDAA:
  PLA                                       ; $07DDAA |
code_07DDAB:
  STA $8F                                   ; $07DDAB |
  RTS                                       ; $07DDAD |

  db $00, $A0, $01, $00, $00, $80, $00, $C0 ; $07DDAE |
  db $10, $10, $05, $05                     ; $07DDB6 |

code_07DDBA:
  LDA #$1D                                  ; $07DDBA |
  STA $0700                                 ; $07DDBC |
  LDA #$10                                  ; $07DDBF |
  STA $0701                                 ; $07DDC1 |
  LDA #$20                                  ; $07DDC4 |
  STA $0702                                 ; $07DDC6 |
  LDA #$00                                  ; $07DDC9 |
  STA $0703                                 ; $07DDCB |
  LDA #$08                                  ; $07DDCE |
  STA $8C                                   ; $07DDD0 |
  LDA $90                                   ; $07DDD2 |
  ASL                                       ; $07DDD4 |
  TAY                                       ; $07DDD5 |
  LDA $E077,y                               ; $07DDD6 |
  STA $00                                   ; $07DDD9 |
  INY                                       ; $07DDDB |
  LDA $E077,y                               ; $07DDDC |
  STA $01                                   ; $07DDDF |
  LDY #$00                                  ; $07DDE1 |
  LDA ($00),y                               ; $07DDE3 |
  STA $96                                   ; $07DDE5 |
  SEC                                       ; $07DDE7 |
  LDA $91                                   ; $07DDE8 |
  SBC $96                                   ; $07DDEA |
  STA $0D                                   ; $07DDEC |
  INY                                       ; $07DDEE |
  LDA ($00),y                               ; $07DDEF |
  STA $97                                   ; $07DDF1 |
  SEC                                       ; $07DDF3 |
  LDA $93                                   ; $07DDF4 |
  SBC $97                                   ; $07DDF6 |
  STA $0E                                   ; $07DDF8 |
  LDA $BC                                   ; $07DDFA |
  BEQ code_07DE06                           ; $07DDFC |
  LDA $7D                                   ; $07DDFE |
  AND #$03                                  ; $07DE00 |
  BNE code_07DE06                           ; $07DE02 |
  DEC $BC                                   ; $07DE04 |
code_07DE06:
  LDA $E7                                   ; $07DE06 |
  BEQ code_07DE0F                           ; $07DE08 |
  DEC $E7                                   ; $07DE0A |
  JMP code_07DE1D                           ; $07DE0C |

code_07DE0F:
  LDA $A8                                   ; $07DE0F |
  AND #$10                                  ; $07DE11 |
  BEQ code_07DE26                           ; $07DE13 |
  LDA $BC                                   ; $07DE15 |
  BEQ code_07DE23                           ; $07DE17 |
  CMP #$20                                  ; $07DE19 |
  BCS code_07DE23                           ; $07DE1B |
code_07DE1D:
  LDA $7D                                   ; $07DE1D |
  AND #$02                                  ; $07DE1F |
code_07DE21:
  BEQ code_07DE33                           ; $07DE21 |
code_07DE23:
  JMP code_07DE75                           ; $07DE23 |

code_07DE26:
  LDA $BC                                   ; $07DE26 |
  BEQ code_07DE33                           ; $07DE28 |
  CMP #$20                                  ; $07DE2A |
  BCS code_07DE1D                           ; $07DE2C |
  AND #$01                                  ; $07DE2E |
  JMP code_07DE21                           ; $07DE30 |

code_07DE33:
  LDA $93                                   ; $07DE33 |
  CMP #$F0                                  ; $07DE35 |
  BCC code_07DE3C                           ; $07DE37 |
  JMP code_07DE75                           ; $07DE39 |

code_07DE3C:
  LDX $8C                                   ; $07DE3C |
  INY                                       ; $07DE3E |
  LDA ($00),y                               ; $07DE3F |
  CMP #$FF                                  ; $07DE41 |
  BEQ code_07DE75                           ; $07DE43 |
  CLC                                       ; $07DE45 |
  ADC $0D                                   ; $07DE46 |
  STA $0703,x                               ; $07DE48 |
  INY                                       ; $07DE4B |
  LDA $93                                   ; $07DE4C |
  CMP #$08                                  ; $07DE4E |
  BNE code_07DE56                           ; $07DE50 |
  LDA #$F0                                  ; $07DE52 |
  BNE code_07DE5B                           ; $07DE54 |
code_07DE56:
  LDA ($00),y                               ; $07DE56 |
  CLC                                       ; $07DE58 |
  ADC $0E                                   ; $07DE59 |
code_07DE5B:
  STA $0700,x                               ; $07DE5B |
  INY                                       ; $07DE5E |
  LDA ($00),y                               ; $07DE5F |
  ORA $BD                                   ; $07DE61 |
  STA $0702,x                               ; $07DE63 |
  INY                                       ; $07DE66 |
  LDA ($00),y                               ; $07DE67 |
  STA $0701,x                               ; $07DE69 |
  LDA $8C                                   ; $07DE6C |
  CLC                                       ; $07DE6E |
  ADC #$04                                  ; $07DE6F |
  STA $8C                                   ; $07DE71 |
  BNE code_07DE3C                           ; $07DE73 |
code_07DE75:
  LDA $B4                                   ; $07DE75 |
  CMP #$80                                  ; $07DE77 |
  BEQ code_07DE81                           ; $07DE79 |
  LDA $B1                                   ; $07DE7B |
  CMP #$01                                  ; $07DE7D |
  BEQ code_07DE84                           ; $07DE7F |
code_07DE81:
  JMP code_07DF1C                           ; $07DE81 |

code_07DE84:
  LDA $C5                                   ; $07DE84 |
  CMP #$40                                  ; $07DE86 |
  BCC code_07DEFA                           ; $07DE88 |
  LDA $7D                                   ; $07DE8A |
  AND #$01                                  ; $07DE8C |
  BNE code_07DE9A                           ; $07DE8E |
  LDA $C5                                   ; $07DE90 |
  SEC                                       ; $07DE92 |
  SBC #$01                                  ; $07DE93 |
  STA $C5                                   ; $07DE95 |
  STA $0704                                 ; $07DE97 |
code_07DE9A:
  LDA $C2                                   ; $07DE9A |
  SEC                                       ; $07DE9C |
  SBC $BF                                   ; $07DE9D |
  LDA $C1                                   ; $07DE9F |
  SBC $BE                                   ; $07DEA1 |
  BCS code_07DEB5                           ; $07DEA3 |
  SEC                                       ; $07DEA5 |
  LDA $C4                                   ; $07DEA6 |
  SBC #$20                                  ; $07DEA8 |
  STA $C4                                   ; $07DEAA |
  LDA $C3                                   ; $07DEAC |
  SBC #$00                                  ; $07DEAE |
  STA $C3                                   ; $07DEB0 |
  JMP code_07DEC2                           ; $07DEB2 |

code_07DEB5:
  CLC                                       ; $07DEB5 |
  LDA $C4                                   ; $07DEB6 |
  ADC #$20                                  ; $07DEB8 |
  STA $C4                                   ; $07DEBA |
  LDA $C3                                   ; $07DEBC |
  ADC #$00                                  ; $07DEBE |
  STA $C3                                   ; $07DEC0 |
code_07DEC2:
  LDA $C0                                   ; $07DEC2 |
  CLC                                       ; $07DEC4 |
  ADC $C4                                   ; $07DEC5 |
  STA $C0                                   ; $07DEC7 |
  LDA $BF                                   ; $07DEC9 |
  ADC $C3                                   ; $07DECB |
  STA $BF                                   ; $07DECD |
  LDA $C3                                   ; $07DECF |
  BMI code_07DEDA                           ; $07DED1 |
  LDA $BE                                   ; $07DED3 |
  ADC #$00                                  ; $07DED5 |
  JMP code_07DEDE                           ; $07DED7 |

code_07DEDA:
  LDA $BE                                   ; $07DEDA |
  ADC #$FF                                  ; $07DEDC |
code_07DEDE:
  STA $BE                                   ; $07DEDE |
  LDA $BF                                   ; $07DEE0 |
  SEC                                       ; $07DEE2 |
  SBC $CC                                   ; $07DEE3 |
  STA $0707                                 ; $07DEE5 |
  LDA $BE                                   ; $07DEE8 |
  SBC $CD                                   ; $07DEEA |
  BNE code_07DEFA                           ; $07DEEC |
  LDA #$81                                  ; $07DEEE |
  STA $0705                                 ; $07DEF0 |
  LDA #$00                                  ; $07DEF3 |
  STA $0706                                 ; $07DEF5 |
  BEQ code_07DF21                           ; $07DEF8 |
code_07DEFA:
  LDA $91                                   ; $07DEFA |
  CLC                                       ; $07DEFC |
  ADC $CC                                   ; $07DEFD |
  STA $BF                                   ; $07DEFF |
  STA $C2                                   ; $07DF01 |
  LDA $CD                                   ; $07DF03 |
  ADC #$00                                  ; $07DF05 |
  STA $BE                                   ; $07DF07 |
  STA $C1                                   ; $07DF09 |
  LDA #$01                                  ; $07DF0B |
  STA $C3                                   ; $07DF0D |
  LDA #$00                                  ; $07DF0F |
  STA $C0                                   ; $07DF11 |
  STA $C4                                   ; $07DF13 |
  LDA $93                                   ; $07DF15 |
  SEC                                       ; $07DF17 |
  SBC #$18                                  ; $07DF18 |
  STA $C5                                   ; $07DF1A |
code_07DF1C:
  LDA #$F0                                  ; $07DF1C |
  STA $0704                                 ; $07DF1E |
code_07DF21:
  RTS                                       ; $07DF21 |

  RTS                                       ; $07DF22 |

  db $DF, $80, $DF, $A0, $DF, $C0, $DF, $E0 ; $07DF23 |
  db $DF, $00, $E0, $20, $E0, $21, $E0, $22 ; $07DF2B |
  db $E0, $23, $E0, $24, $E0, $25, $E0, $26 ; $07DF33 |
  db $E0, $27, $E0, $28, $E0, $29, $E0, $2A ; $07DF3B |
  db $E0, $4A, $E0, $6A, $E0, $6B, $E0, $6C ; $07DF43 |
  db $E0, $6D, $E0, $6E, $E0, $6F, $E0, $70 ; $07DF4B |
  db $E0, $71, $E0, $72, $E0, $73, $E0, $74 ; $07DF53 |
  db $E0, $75, $E0, $76, $E0, $00, $00, $00 ; $07DF5B |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DF63 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DF6B |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DF73 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DF7B |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DF83 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DF8B |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DF93 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DF9B |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DFA3 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DFAB |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DFB3 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DFBB |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DFC3 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DFCB |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07DFD3 |
  db $00, $00, $00, $00, $00, $02, $02, $02 ; $07DFDB |
  db $02, $02, $02, $02, $02, $03, $03, $03 ; $07DFE3 |
  db $03, $03, $03, $03, $03, $04, $04, $04 ; $07DFEB |
  db $04, $04, $04, $04, $04, $05, $05, $05 ; $07DFF3 |
  db $05, $05, $05, $05, $05, $06, $06, $06 ; $07DFFB |
  db $06, $06, $06, $06, $06, $07, $07, $07 ; $07E003 |
  db $07, $07, $07, $07, $07, $08, $08, $08 ; $07E00B |
  db $08, $08, $08, $08, $08, $09, $09, $09 ; $07E013 |
  db $09, $09, $09, $09, $09, $0E, $0F, $0A ; $07E01B |
  db $0B, $0C, $0D, $10, $10, $00, $01, $11 ; $07E023 |
  db $11, $11, $11, $11, $11, $11, $11, $12 ; $07E02B |
  db $12, $12, $12, $12, $12, $12, $12, $13 ; $07E033 |
  db $13, $13, $13, $13, $13, $13, $13, $14 ; $07E03B |
  db $14, $14, $14, $14, $14, $14, $14, $15 ; $07E043 |
  db $15, $15, $15, $15, $15, $15, $15, $16 ; $07E04B |
  db $16, $16, $16, $16, $16, $16, $16, $17 ; $07E053 |
  db $17, $17, $17, $17, $17, $17, $17, $18 ; $07E05B |
  db $18, $18, $18, $18, $18, $18, $18, $19 ; $07E063 |
  db $1A, $1B, $1C, $1D, $1E, $1F, $20, $21 ; $07E06B |
  db $22, $23, $24, $25, $C3, $E0, $F2, $E0 ; $07E073 |
  db $21, $E1, $50, $E1, $7F, $E1, $AE, $E1 ; $07E07B |
  db $DD, $E1, $0C, $E2, $3B, $E2, $6A, $E2 ; $07E083 |
  db $99, $E2, $C0, $E2, $E7, $E2, $16, $E3 ; $07E08B |
  db $45, $E3, $74, $E3, $A3, $E3, $D2, $E3 ; $07E093 |
  db $F9, $E3, $24, $E4, $4F, $E4, $76, $E4 ; $07E09B |
  db $9D, $E4, $C8, $E4, $F3, $E4, $1A, $E5 ; $07E0A3 |
  db $41, $E5, $68, $E5, $C3, $E5, $1E, $E6 ; $07E0AB |
  db $79, $E6, $D4, $E6, $27, $E7, $7A, $E7 ; $07E0B3 |
  db $D5, $E7, $30, $E8, $63, $E8, $9A, $E8 ; $07E0BB |
  db $0C, $10, $04, $00, $00, $01, $00, $08 ; $07E0C3 |
  db $00, $11, $00, $10, $00, $21, $00, $18 ; $07E0CB |
  db $00, $31, $0C, $00, $00, $02, $08, $08 ; $07E0D3 |
  db $00, $12, $08, $10, $00, $22, $08, $18 ; $07E0DB |
  db $00, $32, $10, $08, $00, $13, $10, $10 ; $07E0E3 |
  db $00, $23, $10, $18, $00, $33, $FF, $0C ; $07E0EB |
  db $10, $04, $00, $40, $02, $00, $08, $40 ; $07E0F3 |
  db $13, $00, $10, $40, $23, $00, $18, $40 ; $07E0FB |
  db $33, $0C, $00, $40, $01, $08, $08, $40 ; $07E103 |
  db $12, $08, $10, $40, $22, $08, $18, $40 ; $07E10B |
  db $32, $10, $08, $40, $11, $10, $10, $40 ; $07E113 |
  db $21, $10, $18, $40, $31, $FF, $0C, $10 ; $07E11B |
  db $04, $00, $00, $04, $00, $08, $00, $14 ; $07E123 |
  db $00, $10, $00, $24, $00, $18, $00, $34 ; $07E12B |
  db $0C, $00, $00, $05, $08, $08, $00, $15 ; $07E133 |
  db $08, $10, $00, $25, $08, $18, $00, $35 ; $07E13B |
  db $10, $08, $00, $16, $10, $10, $00, $26 ; $07E143 |
  db $10, $18, $00, $36, $FF, $0C, $10, $04 ; $07E14B |
  db $00, $00, $07, $00, $08, $00, $17, $00 ; $07E153 |
  db $10, $00, $27, $00, $18, $00, $37, $0C ; $07E15B |
  db $00, $00, $08, $08, $08, $00, $18, $08 ; $07E163 |
  db $10, $00, $28, $08, $18, $00, $38, $10 ; $07E16B |
  db $08, $00, $19, $10, $10, $00, $29, $10 ; $07E173 |
  db $18, $00, $39, $FF, $0C, $10, $04, $00 ; $07E17B |
  db $00, $0A, $00, $08, $00, $1A, $00, $10 ; $07E183 |
  db $00, $2A, $00, $18, $00, $3A, $0C, $00 ; $07E18B |
  db $00, $0B, $08, $08, $00, $1B, $08, $10 ; $07E193 |
  db $00, $2B, $08, $18, $00, $3B, $10, $08 ; $07E19B |
  db $00, $1C, $10, $10, $00, $2C, $10, $18 ; $07E1A3 |
  db $00, $3C, $FF, $0C, $10, $04, $00, $00 ; $07E1AB |
  db $0D, $00, $08, $00, $1D, $00, $10, $00 ; $07E1B3 |
  db $2D, $00, $18, $00, $3D, $0C, $00, $00 ; $07E1BB |
  db $0E, $08, $08, $00, $1E, $08, $10, $00 ; $07E1C3 |
  db $2E, $08, $18, $00, $3E, $10, $08, $00 ; $07E1CB |
  db $1F, $10, $10, $00, $2F, $10, $18, $00 ; $07E1D3 |
  db $3F, $FF, $0C, $10, $04, $00, $40, $05 ; $07E1DB |
  db $00, $08, $40, $16, $00, $10, $40, $26 ; $07E1E3 |
  db $00, $18, $40, $36, $0C, $00, $40, $04 ; $07E1EB |
  db $08, $08, $40, $15, $08, $10, $40, $25 ; $07E1F3 |
  db $08, $18, $40, $35, $10, $08, $40, $14 ; $07E1FB |
  db $10, $10, $40, $24, $10, $18, $40, $34 ; $07E203 |
  db $FF, $0C, $10, $04, $00, $40, $08, $00 ; $07E20B |
  db $08, $40, $19, $00, $10, $40, $29, $00 ; $07E213 |
  db $18, $40, $39, $0C, $00, $40, $07, $08 ; $07E21B |
  db $08, $40, $18, $08, $10, $40, $28, $08 ; $07E223 |
  db $18, $40, $38, $10, $08, $40, $17, $10 ; $07E22B |
  db $10, $40, $27, $10, $18, $40, $37, $FF ; $07E233 |
  db $0C, $10, $04, $00, $40, $0B, $00, $08 ; $07E23B |
  db $40, $1C, $00, $10, $40, $2C, $00, $18 ; $07E243 |
  db $40, $3C, $0C, $00, $40, $0A, $08, $08 ; $07E24B |
  db $40, $1B, $08, $10, $40, $2B, $08, $18 ; $07E253 |
  db $40, $3B, $10, $08, $40, $1A, $10, $10 ; $07E25B |
  db $40, $2A, $10, $18, $40, $3A, $FF, $0C ; $07E263 |
  db $10, $04, $00, $40, $0E, $00, $08, $40 ; $07E26B |
  db $1F, $00, $10, $40, $2F, $00, $18, $40 ; $07E273 |
  db $3F, $0C, $00, $40, $0D, $08, $08, $40 ; $07E27B |
  db $1E, $08, $10, $40, $2E, $08, $18, $40 ; $07E283 |
  db $3E, $10, $08, $40, $1D, $10, $10, $40 ; $07E28B |
  db $2D, $10, $18, $40, $3D, $FF, $0C, $10 ; $07E293 |
  db $00, $08, $00, $50, $00, $10, $00, $60 ; $07E29B |
  db $00, $18, $00, $70, $08, $08, $00, $51 ; $07E2A3 |
  db $08, $10, $00, $61, $08, $18, $00, $71 ; $07E2AB |
  db $10, $08, $00, $52, $10, $10, $00, $62 ; $07E2B3 |
  db $10, $18, $00, $72, $FF, $0C, $10, $00 ; $07E2BB |
  db $08, $40, $52, $00, $10, $40, $62, $00 ; $07E2C3 |
  db $18, $40, $72, $08, $08, $40, $51, $08 ; $07E2CB |
  db $10, $40, $61, $08, $18, $40, $71, $10 ; $07E2D3 |
  db $08, $40, $50, $10, $10, $40, $60, $10 ; $07E2DB |
  db $18, $40, $70, $FF, $0C, $10, $04, $00 ; $07E2E3 |
  db $00, $43, $00, $08, $00, $53, $00, $10 ; $07E2EB |
  db $00, $63, $00, $18, $00, $73, $0C, $00 ; $07E2F3 |
  db $00, $44, $08, $08, $00, $54, $08, $10 ; $07E2FB |
  db $00, $64, $08, $18, $00, $74, $10, $08 ; $07E303 |
  db $00, $55, $10, $10, $00, $65, $10, $18 ; $07E30B |
  db $00, $75, $FF, $0C, $10, $04, $00, $40 ; $07E313 |
  db $44, $00, $08, $40, $55, $00, $10, $40 ; $07E31B |
  db $65, $00, $18, $40, $75, $0C, $00, $40 ; $07E323 |
  db $43, $08, $08, $40, $54, $08, $10, $40 ; $07E32B |
  db $64, $08, $18, $40, $74, $10, $08, $40 ; $07E333 |
  db $53, $10, $10, $40, $63, $10, $18, $40 ; $07E33B |
  db $73, $FF, $0C, $10, $04, $00, $00, $4A ; $07E343 |
  db $00, $08, $00, $5A, $00, $10, $00, $6A ; $07E34B |
  db $00, $18, $00, $7A, $0C, $00, $00, $4B ; $07E353 |
  db $08, $08, $00, $5B, $08, $10, $00, $6B ; $07E35B |
  db $08, $18, $00, $7B, $10, $08, $00, $5C ; $07E363 |
  db $10, $10, $00, $6C, $10, $18, $00, $7C ; $07E36B |
  db $FF, $0C, $10, $04, $00, $40, $4B, $00 ; $07E373 |
  db $08, $40, $5C, $00, $10, $40, $6C, $00 ; $07E37B |
  db $18, $40, $7C, $0C, $00, $40, $4A, $08 ; $07E383 |
  db $08, $40, $5B, $08, $10, $40, $6B, $08 ; $07E38B |
  db $18, $40, $7B, $10, $08, $40, $5A, $10 ; $07E393 |
  db $10, $40, $6A, $10, $18, $40, $7A, $FF ; $07E39B |
  db $0C, $10, $04, $00, $00, $4D, $00, $08 ; $07E3A3 |
  db $00, $5D, $00, $10, $00, $6D, $00, $18 ; $07E3AB |
  db $00, $7D, $0C, $00, $00, $4E, $08, $08 ; $07E3B3 |
  db $00, $5E, $08, $10, $00, $6E, $08, $18 ; $07E3BB |
  db $00, $7E, $10, $08, $00, $5F, $10, $10 ; $07E3C3 |
  db $00, $6F, $10, $18, $00, $7F, $FF, $10 ; $07E3CB |
  db $0C, $00, $00, $00, $0A, $00, $08, $00 ; $07E3D3 |
  db $04, $08, $00, $00, $0B, $08, $08, $00 ; $07E3DB |
  db $34, $08, $10, $00, $37, $10, $08, $00 ; $07E3E3 |
  db $35, $10, $10, $00, $38, $18, $08, $00 ; $07E3EB |
  db $36, $18, $10, $00, $39, $FF, $10, $0C ; $07E3F3 |
  db $00, $00, $00, $0A, $00, $08, $00, $14 ; $07E3FB |
  db $00, $10, $00, $24, $08, $00, $00, $0B ; $07E403 |
  db $08, $08, $00, $15, $08, $10, $00, $25 ; $07E40B |
  db $10, $08, $00, $16, $10, $10, $00, $26 ; $07E413 |
  db $18, $08, $00, $17, $18, $10, $00, $27 ; $07E41B |
  db $FF, $10, $0C, $00, $00, $00, $0A, $00 ; $07E423 |
  db $08, $00, $18, $00, $10, $00, $28, $08 ; $07E42B |
  db $00, $00, $0B, $08, $08, $00, $19, $08 ; $07E433 |
  db $10, $00, $29, $10, $08, $00, $1A, $10 ; $07E43B |
  db $10, $00, $2A, $18, $08, $00, $1B, $18 ; $07E443 |
  db $10, $00, $2B, $FF, $10, $0C, $00, $00 ; $07E44B |
  db $00, $0A, $00, $08, $00, $1C, $08, $00 ; $07E453 |
  db $00, $0B, $08, $08, $00, $1D, $08, $10 ; $07E45B |
  db $00, $2D, $10, $08, $00, $1E, $10, $10 ; $07E463 |
  db $00, $2E, $18, $08, $00, $1F, $18, $10 ; $07E46B |
  db $00, $2F, $FF, $10, $0C, $00, $08, $40 ; $07E473 |
  db $36, $00, $10, $40, $39, $08, $08, $40 ; $07E47B |
  db $35, $08, $10, $40, $38, $10, $00, $40 ; $07E483 |
  db $0B, $10, $08, $40, $34, $10, $10, $40 ; $07E48B |
  db $37, $18, $00, $40, $0A, $18, $08, $40 ; $07E493 |
  db $04, $FF, $10, $0C, $00, $08, $40, $17 ; $07E49B |
  db $00, $10, $40, $27, $08, $08, $40, $16 ; $07E4A3 |
  db $08, $10, $40, $26, $10, $00, $40, $0B ; $07E4AB |
  db $10, $08, $40, $15, $10, $10, $40, $25 ; $07E4B3 |
  db $18, $00, $40, $0A, $18, $08, $40, $14 ; $07E4BB |
  db $18, $10, $40, $24, $FF, $10, $0C, $00 ; $07E4C3 |
  db $08, $40, $1B, $00, $10, $40, $2B, $08 ; $07E4CB |
  db $08, $40, $1A, $08, $10, $40, $2A, $10 ; $07E4D3 |
  db $00, $40, $0B, $10, $08, $40, $19, $10 ; $07E4DB |
  db $10, $40, $29, $18, $00, $40, $0A, $18 ; $07E4E3 |
  db $08, $40, $18, $18, $10, $40, $28, $FF ; $07E4EB |
  db $10, $0C, $00, $08, $40, $1F, $00, $10 ; $07E4F3 |
  db $40, $2F, $08, $08, $40, $1E, $08, $10 ; $07E4FB |
  db $40, $2E, $10, $00, $40, $0B, $10, $08 ; $07E503 |
  db $40, $1D, $10, $10, $40, $2D, $18, $00 ; $07E50B |
  db $40, $0A, $18, $08, $40, $1C, $FF, $0C ; $07E513 |
  db $0A, $00, $00, $00, $0D, $00, $08, $00 ; $07E51B |
  db $3A, $00, $10, $00, $4A, $08, $00, $00 ; $07E523 |
  db $0E, $08, $08, $00, $3B, $08, $10, $00 ; $07E52B |
  db $4B, $08, $18, $00, $5B, $10, $10, $00 ; $07E533 |
  db $4C, $10, $18, $00, $5C, $FF, $0C, $10 ; $07E53B |
  db $00, $10, $40, $4C, $00, $18, $40, $5C ; $07E543 |
  db $08, $00, $40, $0E, $08, $08, $40, $3B ; $07E54B |
  db $08, $10, $40, $4B, $08, $18, $40, $5B ; $07E553 |
  db $10, $00, $40, $0D, $10, $08, $40, $3A ; $07E55B |
  db $10, $10, $40, $4A, $FF, $0C, $10, $04 ; $07E563 |
  db $00, $00, $0A, $00, $08, $00, $1A, $00 ; $07E56B |
  db $10, $00, $2A, $00, $18, $00, $3A, $0C ; $07E573 |
  db $00, $00, $0B, $08, $08, $00, $1B, $08 ; $07E57B |
  db $10, $00, $2B, $08, $18, $00, $3B, $10 ; $07E583 |
  db $08, $00, $1C, $10, $10, $00, $2C, $10 ; $07E58B |
  db $18, $00, $3C, $F8, $E8, $00, $D9, $F8 ; $07E593 |
  db $F0, $00, $D3, $F8, $F8, $00, $F9, $00 ; $07E59B |
  db $E8, $00, $DA, $00, $F0, $00, $C6, $00 ; $07E5A3 |
  db $F8, $C0, $DA, $00, $00, $00, $4C, $00 ; $07E5AB |
  db $08, $00, $7F, $08, $E8, $00, $D4, $08 ; $07E5B3 |
  db $F0, $40, $D3, $08, $F8, $40, $F9, $FF ; $07E5BB |
  db $0C, $10, $04, $00, $40, $05, $00, $08 ; $07E5C3 |
  db $40, $16, $00, $10, $40, $26, $00, $18 ; $07E5CB |
  db $40, $36, $0C, $00, $40, $04, $08, $08 ; $07E5D3 |
  db $40, $15, $08, $10, $40, $25, $08, $18 ; $07E5DB |
  db $40, $35, $10, $08, $40, $14, $10, $10 ; $07E5E3 |
  db $40, $24, $10, $18, $40, $34, $08, $E8 ; $07E5EB |
  db $00, $D9, $08, $F0, $00, $D3, $08, $F8 ; $07E5F3 |
  db $00, $F9, $10, $E8, $00, $DA, $10, $F0 ; $07E5FB |
  db $00, $C6, $10, $F8, $C0, $DA, $10, $00 ; $07E603 |
  db $00, $4C, $10, $08, $00, $7F, $18, $E8 ; $07E60B |
  db $00, $D4, $18, $F0, $40, $D3, $18, $F8 ; $07E613 |
  db $40, $F9, $FF, $0C, $10, $04, $00, $00 ; $07E61B |
  db $43, $00, $08, $00, $53, $00, $10, $00 ; $07E623 |
  db $63, $00, $18, $00, $73, $0C, $00, $00 ; $07E62B |
  db $44, $08, $08, $00, $54, $08, $10, $00 ; $07E633 |
  db $64, $08, $18, $00, $74, $10, $08, $00 ; $07E63B |
  db $55, $10, $10, $00, $65, $10, $18, $00 ; $07E643 |
  db $75, $00, $E8, $00, $D9, $00, $F0, $00 ; $07E64B |
  db $D3, $00, $F8, $00, $F9, $08, $E8, $00 ; $07E653 |
  db $DA, $08, $F0, $00, $C6, $08, $F8, $C0 ; $07E65B |
  db $DA, $08, $00, $00, $4C, $08, $08, $00 ; $07E663 |
  db $7F, $10, $E8, $00, $D4, $10, $F0, $40 ; $07E66B |
  db $D3, $10, $F8, $40, $F9, $FF, $0C, $10 ; $07E673 |
  db $04, $00, $40, $44, $00, $08, $40, $55 ; $07E67B |
  db $00, $10, $40, $65, $00, $18, $40, $75 ; $07E683 |
  db $0C, $00, $40, $43, $08, $08, $40, $54 ; $07E68B |
  db $08, $10, $40, $64, $08, $18, $40, $74 ; $07E693 |
  db $10, $08, $40, $53, $10, $10, $40, $63 ; $07E69B |
  db $10, $18, $40, $73, $00, $E8, $00, $D9 ; $07E6A3 |
  db $00, $F0, $00, $D3, $00, $F8, $00, $F9 ; $07E6AB |
  db $08, $E8, $00, $DA, $08, $F0, $00, $C6 ; $07E6B3 |
  db $08, $F8, $C0, $DA, $08, $00, $00, $4C ; $07E6BB |
  db $08, $08, $00, $7F, $10, $E8, $00, $D4 ; $07E6C3 |
  db $10, $F0, $40, $D3, $10, $F8, $40, $F9 ; $07E6CB |
  db $FF, $0C, $10, $00, $08, $00, $50, $00 ; $07E6D3 |
  db $10, $00, $60, $00, $18, $00, $70, $08 ; $07E6DB |
  db $08, $00, $51, $08, $10, $00, $61, $08 ; $07E6E3 |
  db $18, $00, $71, $10, $08, $00, $52, $10 ; $07E6EB |
  db $10, $00, $62, $10, $18, $00, $72, $F8 ; $07E6F3 |
  db $F0, $00, $D9, $F8, $F8, $00, $D3, $F8 ; $07E6FB |
  db $00, $00, $F9, $00, $F0, $00, $DA, $00 ; $07E703 |
  db $F8, $00, $C6, $00, $00, $C0, $DA, $00 ; $07E70B |
  db $08, $00, $4C, $00, $10, $00, $7F, $08 ; $07E713 |
  db $F0, $00, $D4, $08, $F8, $40, $D3, $08 ; $07E71B |
  db $00, $40, $F9, $FF, $0C, $10, $00, $08 ; $07E723 |
  db $40, $52, $00, $10, $40, $62, $00, $18 ; $07E72B |
  db $40, $72, $08, $08, $40, $51, $08, $10 ; $07E733 |
  db $40, $61, $08, $18, $40, $71, $10, $08 ; $07E73B |
  db $40, $50, $10, $10, $40, $60, $10, $18 ; $07E743 |
  db $40, $70, $08, $F0, $00, $D9, $08, $F8 ; $07E74B |
  db $00, $D3, $08, $00, $00, $F9, $10, $F0 ; $07E753 |
  db $00, $DA, $10, $F8, $40, $C6, $10, $00 ; $07E75B |
  db $C0, $DA, $10, $08, $00, $4C, $10, $10 ; $07E763 |
  db $00, $7F, $18, $F0, $00, $D4, $18, $F8 ; $07E76B |
  db $40, $D3, $18, $00, $40, $F9, $FF, $0C ; $07E773 |
  db $10, $04, $00, $00, $01, $00, $08, $00 ; $07E77B |
  db $11, $00, $10, $00, $21, $00, $18, $00 ; $07E783 |
  db $31, $0C, $00, $00, $02, $08, $08, $00 ; $07E78B |
  db $12, $08, $10, $00, $22, $08, $18, $00 ; $07E793 |
  db $32, $10, $08, $00, $13, $10, $10, $00 ; $07E79B |
  db $23, $10, $18, $00, $33, $F8, $E8, $00 ; $07E7A3 |
  db $D9, $F8, $F0, $00, $D3, $F8, $F8, $00 ; $07E7AB |
  db $F9, $00, $E8, $00, $DA, $00, $F0, $40 ; $07E7B3 |
  db $C6, $00, $F8, $80, $DA, $00, $00, $00 ; $07E7BB |
  db $4C, $00, $08, $00, $7F, $08, $E8, $00 ; $07E7C3 |
  db $D4, $08, $F0, $40, $D3, $08, $F8, $40 ; $07E7CB |
  db $F9, $FF, $0C, $10, $04, $00, $40, $02 ; $07E7D3 |
  db $00, $08, $40, $13, $00, $10, $40, $23 ; $07E7DB |
  db $00, $18, $40, $33, $0C, $00, $40, $01 ; $07E7E3 |
  db $08, $08, $40, $12, $08, $10, $40, $22 ; $07E7EB |
  db $08, $18, $40, $32, $10, $08, $40, $11 ; $07E7F3 |
  db $10, $10, $40, $21, $10, $18, $40, $31 ; $07E7FB |
  db $08, $E8, $00, $D9, $08, $F0, $00, $D3 ; $07E803 |
  db $08, $F8, $00, $F9, $10, $E8, $00, $DA ; $07E80B |
  db $10, $F0, $40, $C6, $10, $F8, $80, $DA ; $07E813 |
  db $10, $00, $40, $4C, $10, $08, $40, $7F ; $07E81B |
  db $18, $E8, $00, $D4, $18, $F0, $40, $D3 ; $07E823 |
  db $18, $F8, $40, $F9, $FF, $0C, $10, $00 ; $07E82B |
  db $00, $40, $0D, $00, $08, $40, $1C, $00 ; $07E833 |
  db $10, $40, $2C, $00, $18, $40, $3C, $08 ; $07E83B |
  db $00, $40, $0B, $08, $08, $40, $1B, $08 ; $07E843 |
  db $10, $40, $2B, $08, $18, $40, $3B, $10 ; $07E84B |
  db $00, $40, $0A, $10, $08, $40, $1A, $10 ; $07E853 |
  db $10, $40, $2A, $10, $18, $40, $3A, $FF ; $07E85B |
  db $0C, $10, $00, $00, $40, $38, $00, $08 ; $07E863 |
  db $40, $19, $00, $10, $40, $29, $00, $18 ; $07E86B |
  db $40, $36, $08, $00, $40, $08, $08, $08 ; $07E873 |
  db $40, $18, $08, $10, $40, $28, $08, $18 ; $07E87B |
  db $40, $35, $10, $00, $40, $07, $10, $08 ; $07E883 |
  db $40, $17, $10, $10, $40, $27, $10, $18 ; $07E88B |
  db $40, $37, $18, $08, $40, $39, $FF, $0C ; $07E893 |
  db $10, $00, $00, $40, $38, $00, $08, $40 ; $07E89B |
  db $16, $00, $10, $40, $26, $00, $18, $40 ; $07E8A3 |
  db $36, $08, $00, $40, $05, $08, $08, $40 ; $07E8AB |
  db $15, $08, $10, $40, $25, $08, $18, $40 ; $07E8B3 |
  db $35, $10, $00, $40, $04, $10, $08, $40 ; $07E8BB |
  db $14, $10, $10, $40, $24, $10, $18, $40 ; $07E8C3 |
  db $34, $FF                               ; $07E8CB |

code_07E8CD:
  LDA $A7                                   ; $07E8CD |
  AND #$80                                  ; $07E8CF |
  BEQ code_07E93A                           ; $07E8D1 |
  LDA $A7                                   ; $07E8D3 |
  AND #$20                                  ; $07E8D5 |
  BEQ code_07E93A                           ; $07E8D7 |
  LDA $E7                                   ; $07E8D9 |
  BNE code_07E93A                           ; $07E8DB |
  JSR code_07E93B                           ; $07E8DD |
  LDY #$07                                  ; $07E8E0 |

; Some sprite loop (with y as the slot) that runs every frame, probably to check collision
code_07E8E2:
  LDA $04F3,y                               ; $07E8E2 | Get sprite status
  CMP #$02                                  ; $07E8E5 | Check if active
  BNE code_07E8F5                           ; $07E8E7 |
  LDA $0527,y                               ; $07E8E9 |
  AND #$40                                  ; $07E8EC |
  BNE code_07E8F5                           ; $07E8EE |
  JSR code_07E994                           ; $07E8F0 |
  BCC code_07E8FA                           ; $07E8F3 |
code_07E8F5:
  DEY                                       ; $07E8F5 |\ Loop to the next slot
  BPL code_07E8E2                           ; $07E8F6 |/
  BMI code_07E93A                           ; $07E8F8 |
code_07E8FA:
  LDA $0501,y                               ; $07E8FA |
  CMP #$0D                                  ; $07E8FD |
  BNE code_07E90E                           ; $07E8FF |
  LDA $0535,y                               ; $07E901 |
  CMP #$04                                  ; $07E904 |
  BCC code_07E90E                           ; $07E906 |
  LDA $A8                                   ; $07E908 |
  ORA #$40                                  ; $07E90A |
  BNE code_07E938                           ; $07E90C |
code_07E90E:
  LDA $0527,y                               ; $07E90E |
  AND #$7F                                  ; $07E911 |
  STA $0527,y                               ; $07E913 |
  LDA $06                                   ; $07E916 |
  CMP #$F8                                  ; $07E918 |
  BCC code_07E92A                           ; $07E91A |
  LDA $0527,y                               ; $07E91C |
  AND #$08                                  ; $07E91F |
  BNE code_07E8F5                           ; $07E921 |
  JSR code_07E961                           ; $07E923 |
  STA $A8                                   ; $07E926 |
  BNE code_07E8F5                           ; $07E928 |
code_07E92A:
  CPY #$06                                  ; $07E92A |\ Skip if apple slots
  BCS code_07E93A                           ; $07E92C |/
  LDA $0527,y                               ; $07E92E |
  AND #$04                                  ; $07E931 |
  BNE code_07E8F5                           ; $07E933 |
  JSR code_07E987                           ; $07E935 |
code_07E938:
  STA $A8                                   ; $07E938 |
code_07E93A:
  RTS                                       ; $07E93A | Return

code_07E93B:
  LDA $A8                                   ; $07E93B |
  AND #$1F                                  ; $07E93D |
  STA $A8                                   ; $07E93F |
  LDA #$00                                  ; $07E941 |
  STA $AA                                   ; $07E943 |
  STA $A9                                   ; $07E945 |
  CLC                                       ; $07E947 |
  LDA $91                                   ; $07E948 |
  ADC $CC                                   ; $07E94A |
  STA $00                                   ; $07E94C |
  LDA #$00                                  ; $07E94E |
  ADC $CD                                   ; $07E950 |
  STA $01                                   ; $07E952 |
  LDA $93                                   ; $07E954 |
  STA $02                                   ; $07E956 |
  LDA #$07                                  ; $07E958 |
  STA $0D                                   ; $07E95A |
  LDA #$0F                                  ; $07E95C |
  STA $0E                                   ; $07E95E |
  RTS                                       ; $07E960 | Return

code_07E961:
  LDA $058B,y                               ; $07E961 |
  STA $AA                                   ; $07E964 |
  LDA $0583,y                               ; $07E966 |
  STA $A9                                   ; $07E969 |
  LDX #$00                                  ; $07E96B |
  SEC                                       ; $07E96D |
  LDA $06                                   ; $07E96E |
  SBC #$FC                                  ; $07E970 |
  STA $9C                                   ; $07E972 |
  BPL code_07E978                           ; $07E974 |
  LDX #$FF                                  ; $07E976 |
code_07E978:
  STX $9D                                   ; $07E978 |
  LDA $0527,y                               ; $07E97A |
  ORA #$80                                  ; $07E97D |
  STA $0527,y                               ; $07E97F |
  LDA $A8                                   ; $07E982 |
  ORA #$20                                  ; $07E984 |
  RTS                                       ; $07E986 | Return

code_07E987:
  STY $04F1                                 ; $07E987 | Store the sprite slot the player took damage with
  LDA #$00                                  ; $07E98A |\ Zero the damage timer (?)
  STA $04F2                                 ; $07E98C |/
  LDA $A8                                   ; $07E98F |
  ORA #$80                                  ; $07E991 |
  RTS                                       ; $07E993 | Return

code_07E994:
  CLC                                       ; $07E994 | Clear carry
  LDA $0D                                   ; $07E995 |\  Get scratch ram $000D,
  ADC $0573,y                               ; $07E997 | | add it with sprite hitbox width/2? and
  STA $0F                                   ; $07E99A |/  store it in scratch ram $000F
  CLC                                       ; $07E99C | Clear carry
  LDA $0E                                   ; $07E99D |\  Get scratch ram $000E,
  ADC $057B,y                               ; $07E99F | | add it with sprite hitbox height/2? and
  STA $10                                   ; $07E9A2 |/  store it in scratch ram $0010
  CLC                                       ; $07E9A4 | Clear carry
  LDA $0563,y                               ; $07E9A5 |\  Get sprite Y position (low),
  ADC $10                                   ; $07E9A8 | | subtract with scratch ram $0010 and
  STA $06                                   ; $07E9AA |/  store it in scratch ram $0006
  LDA $02                                   ; $07E9AC |\  Get value in scratch ram $0002, and
  CMP $06                                   ; $07E9AE | | compare it with scratch ram $0006,
  BCS code_07E9F5                           ; $07E9B0 |/  if $0002 >= $0006 (carry set) then return, else...
  SEC                                       ; $07E9B2 | Set carry
  LDA $054B,y                               ; $07E9B3 |\  Get sprite X position (low), 
  SBC $0F                                   ; $07E9B6 | | subtract it with scratch ram $000F
  STA $04                                   ; $07E9B8 |/  and store it in scratch ram $0004
  LDA $0543,y                               ; $07E9BA |\  Get sprite X position (high),
  SBC #$00                                  ; $07E9BD | | subtract 1 if carry clear
  STA $05                                   ; $07E9BF |/  and store it in scratch ram $0005
  SEC                                       ; $07E9C1 | Set carry
  LDA $04                                   ; $07E9C2 |\ Get scratch ram $0004 and
  SBC $00                                   ; $07E9C4 |/ subtract it with player X position (low), stored in scratch ram $0000
  LDA $05                                   ; $07E9C6 |\ Get scratch ram $0005 and
  SBC $01                                   ; $07E9C8 |/ subtract it with player X position (high), stored in scratch ram $0000
  BCS code_07E9F5                           ; $07E9CA | If still positive (carry set) then return, else...
  CLC                                       ; $07E9CC | Clear carry
  LDA $054B,y                               ; $07E9CD |\  Get sprite X position (low), 
  ADC $0F                                   ; $07E9D0 | | add it with scratch ram $000F
  STA $04                                   ; $07E9D2 |/  and store it in scratch ram $0004
  LDA $0543,y                               ; $07E9D4 |\  Get sprite X position (high),
  ADC #$00                                  ; $07E9D7 | | add 1 if carry set
  STA $05                                   ; $07E9D9 |/  and store it in scratch ram $0005
  SEC                                       ; $07E9DB | Set carry
  LDA $00                                   ; $07E9DC |\ Get player X position (low), stored in scratch ram $0000 and
  SBC $04                                   ; $07E9DE |/ subtract it with scratch ram $0004
  LDA $01                                   ; $07E9E0 |\ Get player X position (high), stored in scratch ram $0000 and
  SBC $05                                   ; $07E9E2 |/ subtract it with scratch ram $0005
  BCS code_07E9F5                           ; $07E9E4 | If still positive (carry set) then return, else...
  SEC                                       ; $07E9E6 | Set carry
  LDA $0563,y                               ; $07E9E7 |\  Get sprite Y position (low),
  SBC $10                                   ; $07E9EA | | subtract with scratch ram $0010 and
  STA $06                                   ; $07E9EC |/  store it in scratch ram $0006
  SEC                                       ; $07E9EE | Set carry
  LDA $06                                   ; $07E9EF |\  Get value in scratch ram $0006,
  SBC $02                                   ; $07E9F1 | | subtract with scratch ram $0002 and
  STA $06                                   ; $07E9F3 |/  store it back in scratch ram $0006
code_07E9F5:
  RTS                                       ; $07E9F5 | Return

code_07E9F6:
  LDA $93                                   ; $07E9F6 |
  CMP #$20                                  ; $07E9F8 |
  BCC code_07EA09                           ; $07E9FA |
  CMP #$D8                                  ; $07E9FC |
  BCC code_07EA12                           ; $07E9FE |
  LDA $A8                                   ; $07EA00 |
  AND #$FE                                  ; $07EA02 |
  STA $A8                                   ; $07EA04 |
  JMP code_07EA57                           ; $07EA06 |

code_07EA09:
  LDA $A8                                   ; $07EA09 |
  AND #$D0                                  ; $07EA0B |
  STA $A8                                   ; $07EA0D |
  JMP code_07EA69                           ; $07EA0F |

code_07EA12:
  LDA $A8                                   ; $07EA12 |
  AND #$08                                  ; $07EA14 |
  STA $18                                   ; $07EA16 |
  LDX #$01                                  ; $07EA18 |
  LDA $9C                                   ; $07EA1A |
  ORA $9D                                   ; $07EA1C |
  BEQ code_07EA57                           ; $07EA1E |
  LDA $9C                                   ; $07EA20 |
  BMI code_07EA25                           ; $07EA22 |
  INX                                       ; $07EA24 |
code_07EA25:
  STX $86                                   ; $07EA25 |
  JSR code_07CA68                           ; $07EA27 |
  LDA $18                                   ; $07EA2A |
  BNE code_07EA39                           ; $07EA2C |
  LDA $A8                                   ; $07EA2E |
  AND #$08                                  ; $07EA30 |
  BEQ code_07EA39                           ; $07EA32 |
  LDA #$0B                                  ; $07EA34 |
  JSR code_07C0B7                           ; $07EA36 |
code_07EA39:
  LDA $5E                                   ; $07EA39 |
  STA $0615                                 ; $07EA3B |
  LDA $36                                   ; $07EA3E |
  STA $0618                                 ; $07EA40 |
  LDA $37                                   ; $07EA43 |
  STA $0617                                 ; $07EA45 |
  LDA $06                                   ; $07EA48 |
  STA $0619                                 ; $07EA4A |
  LDA $9C                                   ; $07EA4D |
  BMI code_07EA57                           ; $07EA4F |
  LDA $17                                   ; $07EA51 |
  AND #$C0                                  ; $07EA53 |
  STA $B4                                   ; $07EA55 |
code_07EA57:
  LDX #$03                                  ; $07EA57 |
  LDA $9A                                   ; $07EA59 |
  ORA $9B                                   ; $07EA5B |
  BEQ code_07EA69                           ; $07EA5D |
  LDA $9A                                   ; $07EA5F |
  BMI code_07EA64                           ; $07EA61 |
  INX                                       ; $07EA63 |
code_07EA64:
  STX $86                                   ; $07EA64 |
  JSR code_07CA68                           ; $07EA66 |
code_07EA69:
  RTS                                       ; $07EA69 | Return

code_07EA6A:
  LDX #$01                                  ; $07EA6A |
code_07EA6C:
  LDA $04F9,x                               ; $07EA6C |
  CMP #$02                                  ; $07EA6F |
  BNE code_07EAEE                           ; $07EA71 |
  CLC                                       ; $07EA73 |
  LDA $0551,x                               ; $07EA74 |
  STA $00                                   ; $07EA77 |
  LDA $0549,x                               ; $07EA79 |
  STA $01                                   ; $07EA7C |
  LDA $0569,x                               ; $07EA7E |
  STA $02                                   ; $07EA81 |
  LDY $053B,x                               ; $07EA83 |
  LDA $EAF5,y                               ; $07EA86 |
  STA $0D                                   ; $07EA89 |
  STA $0E                                   ; $07EA8B |
  LDY #$05                                  ; $07EA8D |
code_07EA8F:
  LDA $04F3,y                               ; $07EA8F |
  CMP #$02                                  ; $07EA92 |
  BNE code_07EAAD                           ; $07EA94 |
  LDA $0527,y                               ; $07EA96 |
  AND #$40                                  ; $07EA99 |
  BNE code_07EAAD                           ; $07EA9B |
  LDA $04FB,y                               ; $07EA9D |
  CMP #$3A                                  ; $07EAA0 |
  BEQ code_07EAAD                           ; $07EAA2 |
  CMP #$40                                  ; $07EAA4 |
  BEQ code_07EAAD                           ; $07EAA6 |
  JSR code_07E994                           ; $07EAA8 |
  BCC code_07EAB2                           ; $07EAAB |
code_07EAAD:
  DEY                                       ; $07EAAD |
  BPL code_07EA8F                           ; $07EAAE |
  BMI code_07EAEE                           ; $07EAB0 |
code_07EAB2:
  LDA $0507,x                               ; $07EAB2 |
  CMP #$0D                                  ; $07EAB5 |
  BNE code_07EACD                           ; $07EAB7 |
  LDA $053B,x                               ; $07EAB9 |
  CMP #$04                                  ; $07EABC |
  BCC code_07EACD                           ; $07EABE |
  LDA $0527,y                               ; $07EAC0 |
  AND #$04                                  ; $07EAC3 |
  BNE code_07EACD                           ; $07EAC5 |
  JSR code_07EAFC                           ; $07EAC7 |
  JMP code_07EAAD                           ; $07EACA |

code_07EACD:
  LDA $06                                   ; $07EACD |
  CMP #$FC                                  ; $07EACF |
  BCC code_07EAEE                           ; $07EAD1 |
  LDA $0527,y                               ; $07EAD3 |
  AND #$08                                  ; $07EAD6 |
  BNE code_07EAAD                           ; $07EAD8 |
  TYA                                       ; $07EADA |
  STA $04DB,x                               ; $07EADB |
  LDA $052D,x                               ; $07EADE |
  ORA #$02                                  ; $07EAE1 |
  STA $052D,x                               ; $07EAE3 |
  LDA $0527,y                               ; $07EAE6 |
  ORA #$10                                  ; $07EAE9 |
  STA $0527,y                               ; $07EAEB |
code_07EAEE:
  DEX                                       ; $07EAEE |
  BMI code_07EAF4                           ; $07EAEF |
  JMP code_07EA6C                           ; $07EAF1 |

code_07EAF4:
  RTS                                       ; $07EAF4 | Return

  db $04, $04, $04, $0C, $0C, $04, $04      ; $07EAF5 |

code_07EAFC:
  LDA $04FB,y                               ; $07EAFC |
  BNE code_07EB0B                           ; $07EAFF |
  LDA $050F,y                               ; $07EB01 |
  AND #$F0                                  ; $07EB04 |
  BNE code_07EB27                           ; $07EB06 |
  LDA $04FB,y                               ; $07EB08 |
code_07EB0B:
  CMP #$10                                  ; $07EB0B |
  BEQ code_07EB27                           ; $07EB0D |
  CMP #$39                                  ; $07EB0F |
  BEQ code_07EB27                           ; $07EB11 |
  CMP #$3B                                  ; $07EB13 |
  BEQ code_07EB27                           ; $07EB15 |
  CMP #$3C                                  ; $07EB17 |
  BEQ code_07EB27                           ; $07EB19 |
  CMP #$3F                                  ; $07EB1B |
  BEQ code_07EB27                           ; $07EB1D |
  CMP #$44                                  ; $07EB1F |
  BEQ code_07EB27                           ; $07EB21 |
  CMP #$46                                  ; $07EB23 |
  BNE code_07EB41                           ; $07EB25 |
code_07EB27:
  LDA $04D7,x                               ; $07EB27 |
  CMP #$04                                  ; $07EB2A |
  BNE code_07EB6B                           ; $07EB2C |
  LDA $0527,y                               ; $07EB2E |
  ORA #$40                                  ; $07EB31 |
  STA $0527,y                               ; $07EB33 |
  LDA $050F,y                               ; $07EB36 |
  AND #$F0                                  ; $07EB39 |
  CMP #$50                                  ; $07EB3B |
  BEQ code_07EB60                           ; $07EB3D |
  BNE code_07EB6B                           ; $07EB3F |
code_07EB41:
  LDA $04D7,x                               ; $07EB41 |
  CMP #$04                                  ; $07EB44 |
  BNE code_07EB6B                           ; $07EB46 |
  LDA $050F,y                               ; $07EB48 |
  AND #$F0                                  ; $07EB4B |
  STA $050F,y                               ; $07EB4D |
  LDA $0527,y                               ; $07EB50 |
  ORA #$40                                  ; $07EB53 |
  STA $0527,y                               ; $07EB55 |
  AND #$01                                  ; $07EB58 |
  ORA $050F,y                               ; $07EB5A |
  STA $050F,y                               ; $07EB5D |
code_07EB60:
  LDA #$00                                  ; $07EB60 |
  STA $0521,y                               ; $07EB62 |
  STA $0515,y                               ; $07EB65 |
  STA $051B,y                               ; $07EB68 |
code_07EB6B:
  RTS                                       ; $07EB6B | Return

code_07EB6C:
  LDA $93                                   ; $07EB6C |
  CMP #$F8                                  ; $07EB6E |
  BCC code_07EB7A                           ; $07EB70 |
  LDA #$00                                  ; $07EB72 |
  STA $062B                                 ; $07EB74 |
  JMP code_07ED6B                           ; $07EB77 |

code_07EB7A:
  LDA $BB                                   ; $07EB7A |
  BEQ code_07EB8D                           ; $07EB7C |
  LDA #$00                                  ; $07EB7E |
  STA $BB                                   ; $07EB80 |
  LDA #$80                                  ; $07EB82 |
  STA $A8                                   ; $07EB84 |
  LDA #$01                                  ; $07EB86 |
  STA $BA                                   ; $07EB88 |
  JMP code_07ECD1                           ; $07EB8A |

code_07EB8D:
  LDA $A8                                   ; $07EB8D |
  BMI code_07EB95                           ; $07EB8F |
  CLC                                       ; $07EB91 |
  JMP code_07EE7D                           ; $07EB92 |

code_07EB95:
  LDX $04F1                                 ; $07EB95 |
  LDA $BC                                   ; $07EB98 |
  BEQ code_07EBA4                           ; $07EB9A |
  LDA #$00                                  ; $07EB9C |
  STA $052F,x                               ; $07EB9E |
  JMP code_07EE02                           ; $07EBA1 |

code_07EBA4:
  LDA $BA                                   ; $07EBA4 |
  BEQ code_07EBAB                           ; $07EBA6 |
  JMP code_07ED65                           ; $07EBA8 |

; Check if sprite touched is a damaging projectile
code_07EBAB:
  LDA $04FB,x                               ; $07EBAB |\  Load sprite type/ID, and check if it's:
  CMP #$1C                                  ; $07EBAE | | Arrow/Rock (Indigenous' projectile); Tribe Leader; Axe (Knight's projectile)
  BEQ code_07EBF2                           ; $07EBB0 | |
  CMP #$12                                  ; $07EBB2 | | UNKNOWN/UNUSED
  BEQ code_07EBF2                           ; $07EBB4 | |
  CMP #$0F                                  ; $07EBB6 | | Rolling Face (Clown Plant's projectile); Ice Cube (Ice Man's projectile)
  BEQ code_07EBF2                           ; $07EBB8 | |
  CMP #$30                                  ; $07EBBA | | Electric spark (Charged Ball's projectile)
  BEQ code_07EBF2                           ; $07EBBC | |
  CMP #$34                                  ; $07EBBE | | Arrow (Cupid's projectile)
  BEQ code_07EBF2                           ; $07EBC0 | |
  CMP #$3A                                  ; $07EBC2 | | Skeleton Dragon Boss' vertebra; Magic Hand Boss' segment
  BEQ code_07EBF2                           ; $07EBC4 | | 
  CMP #$3E                                  ; $07EBC6 | | Ink Ball (Octopus Boss' projectile)
  BEQ code_07EBF2                           ; $07EBC8 | | 
  CMP #$41                                  ; $07EBCA | | Venom (Carnivorous Plant Boss' projectile)
  BEQ code_07EBF2                           ; $07EBCC | | 
  CMP #$45                                  ; $07EBCE | | Hat (Evil Hamburglar Boss' projectile)
  BEQ code_07EBF2                           ; $07EBD0 | | 
  CMP #$47                                  ; $07EBD2 | | Magic Ball (Gumon Boss' projectile)
  BEQ code_07EBF2                           ; $07EBD4 | | 
  CMP #$14                                  ; $07EBD6 | | Money Pack (Bandit's, Evil Captain Crook Boss' and Ghost Boss' projectile); Bomb (Nomad's and Bandit's projectile)
  BEQ code_07EBDE                           ; $07EBD8 | | 
  CMP #$2B                                  ; $07EBDA | | Cannon Ball (Sailor's Projectile)
  BNE code_07EC1A                           ; $07EBDC |/  
code_07EBDE:
  LDA $0535,x                               ; $07EBDE |
  CMP #$1F                                  ; $07EBE1 |
  BEQ code_07EBF2                           ; $07EBE3 |
  LDA $050F,x                               ; $07EBE5 |
  AND #$F0                                  ; $07EBE8 |
  ORA #$05                                  ; $07EBEA |
  STA $050F,x                               ; $07EBEC |
code_07EBEF:
  JMP code_07EE5A                           ; $07EBEF |

code_07EBF2:
  LDA #$10                                  ; $07EBF2 |
  STA $E8                                   ; $07EBF4 |
  LDA #$00                                  ; $07EBF6 |
  STA $04F3,x                               ; $07EBF8 |
  LDA #$10                                  ; $07EBFB |
  JSR code_07C0B7                           ; $07EBFD |
  LDA #$00                                  ; $07EC00 |
  STA $062B                                 ; $07EC02 |
  LDA $062C                                 ; $07EC05 |
  BNE code_07EC0D                           ; $07EC08 |
  JMP code_07EC13                           ; $07EC0A |

code_07EC0D:
  DEC $062C                                 ; $07EC0D |
  JMP code_07EE5A                           ; $07EC10 |

code_07EC13:
  LDA #$01                                  ; $07EC13 |
  STA $BA                                   ; $07EC15 |
  JMP code_07ECD1                           ; $07EC17 |

; Check if sprite touched is a non-damaging projectile
code_07EC1A:
  CMP #$24                                  ; $07EC1A |\  Mud (Mud Man's projectile); Locker (Mysterious Man's projectile)
  BEQ code_07EC22                           ; $07EC1C | | 
  CMP #$27                                  ; $07EC1E | | Bubble (Seahorse's projectile)
  BNE code_07EC2E                           ; $07EC20 |/  
code_07EC22:
  LDA #$05                                  ; $07EC22 |
  STA $050F,x                               ; $07EC24 |
  LDA #$C8                                  ; $07EC27 |
  STA $05B3,x                               ; $07EC29 |
  BNE code_07EBEF                           ; $07EC2C |

; Check if sprite touched is one of those that slow you down
code_07EC2E:
  CMP #$22                                  ; $07EC2E |\  Slime
  BEQ code_07EC45                           ; $07EC30 | | 
  CMP #$28                                  ; $07EC32 | | Shark
  BEQ code_07EC45                           ; $07EC34 | | 
  CMP #$32                                  ; $07EC36 | | Angel
  BEQ code_07EC45                           ; $07EC38 | | 
  CMP #$26                                  ; $07EC3A |/  Seahorse
  BNE code_07EC4F                           ; $07EC3C |
  LDA $050F,x                               ; $07EC3E |
  AND #$F0                                  ; $07EC41 |
  BEQ code_07EC4F                           ; $07EC43 |
code_07EC45:
  LDA $050F,x                               ; $07EC45 |
  ORA #$01                                  ; $07EC48 |
  STA $050F,x                               ; $07EC4A |
  BNE code_07EBEF                           ; $07EC4D |


code_07EC4F:
  LDA $04FB,x                               ; $07EC4F |
  CMP #$16                                  ; $07EC52 | Check if sprite touched is Witch
  BNE code_07EC79                           ; $07EC54 |
  LDA $050F,x                               ; $07EC56 |
  CMP #$03                                  ; $07EC59 | Check if it's the Witch's Hat
  BNE code_07EC79                           ; $07EC5B |
  INC $050F,x                               ; $07EC5D |
  INX                                       ; $07EC60 |
  LDA $04FB,x                               ; $07EC61 |
  CMP #$16                                  ; $07EC64 | Check if sprite touched is Witch's Hat
  BNE code_07EBEF                           ; $07EC66 |
  LDA $0527,x                               ; $07EC68 |
  AND #$40                                  ; $07EC6B |
  BNE code_07EBEF                           ; $07EC6D |
  INC $050F,x                               ; $07EC6F |
  LDA #$60                                  ; $07EC72 |
  STA $BC                                   ; $07EC74 |
  JMP code_07EBEF                           ; $07EC76 |

code_07EC79:
  LDA $052F,x                               ; $07EC79 |
  BNE code_07EC81                           ; $07EC7C |
  JMP code_07EE02                           ; $07EC7E |

code_07EC81:
  CMP #$50                                  ; $07EC81 |
  BNE code_07EC8C                           ; $07EC83 |
  LDA #$01                                  ; $07EC85 |
  STA $BA                                   ; $07EC87 |
  JMP code_07ED65                           ; $07EC89 |

code_07EC8C:
  LDA $7D                                   ; $07EC8C |
  AND #$02                                  ; $07EC8E |
  BNE code_07ECE9                           ; $07EC90 |
  CLC                                       ; $07EC92 |
  LDA $052F,x                               ; $07EC93 |
  ADC #$01                                  ; $07EC96 |
  STA $052F,x                               ; $07EC98 |
  CMP #$50                                  ; $07EC9B |
  BNE code_07ECE9                           ; $07EC9D |
  LDA #$00                                  ; $07EC9F |\ 
  STA $062B                                 ; $07ECA1 |/ Disable 2nd apple
  LDA $062C                                 ; $07ECA4 |
  BNE code_07ECAF                           ; $07ECA7 |
  LDA #$01                                  ; $07ECA9 |
  STA $BA                                   ; $07ECAB |
  BNE code_07ECD1                           ; $07ECAD |
code_07ECAF:
  DEC $062C                                 ; $07ECAF | Decrement health
  LDA $E3                                   ; $07ECB2 |
  BNE code_07ECBA                           ; $07ECB4 |
  LDA $E4                                   ; $07ECB6 |
  BEQ code_07ECC9                           ; $07ECB8 |
code_07ECBA:
  STA $18                                   ; $07ECBA |
  DEC $18                                   ; $07ECBC |
  CPX $18                                   ; $07ECBE |
  BNE code_07ECC9                           ; $07ECC0 |
  LDA #$40                                  ; $07ECC2 |
  STA $E7                                   ; $07ECC4 |
  JMP code_07EE4B                           ; $07ECC6 |

code_07ECC9:
  LDA #$00                                  ; $07ECC9 |
  STA $052F,x                               ; $07ECCB |
  JMP code_07EE02                           ; $07ECCE |

code_07ECD1:
  LDA #$00                                  ; $07ECD1 |
  STA $99                                   ; $07ECD3 |
  STA $9D                                   ; $07ECD5 |
  LDA $D3                                   ; $07ECD7 |
  BEQ code_07ECDE                           ; $07ECD9 |
  LDA #$FE                                  ; $07ECDB |
  db $2C                                    ; $07ECDD |

code_07ECDE:
  LDA #$02                                  ; $07ECDE |
  STA $98                                   ; $07ECE0 |
  LDA #$FA                                  ; $07ECE2 |
  STA $9C                                   ; $07ECE4 |
  JMP code_07ED65                           ; $07ECE6 |

code_07ECE9:
  LDA $0535                                 ; $07ECE9 |
  CMP #$02                                  ; $07ECEC |
  BCC code_07ECF5                           ; $07ECEE |
  LDA #$00                                  ; $07ECF0 |
  STA $04F9                                 ; $07ECF2 |
code_07ECF5:
  LDA $0536                                 ; $07ECF5 |
  CMP #$02                                  ; $07ECF8 |
  BCC code_07ED01                           ; $07ECFA |
  LDA #$00                                  ; $07ECFC |
  STA $04FA                                 ; $07ECFE |
code_07ED01:
  LDY #$05                                  ; $07ED01 |
code_07ED03:
  LDA $04FB,y                               ; $07ED03 |
  CMP #$14                                  ; $07ED06 |
  BNE code_07ED0F                           ; $07ED08 |
  LDA #$00                                  ; $07ED0A |
  STA $04F3,y                               ; $07ED0C |
code_07ED0F:
  DEY                                       ; $07ED0F |
  BPL code_07ED03                           ; $07ED10 |
  LDY #$00                                  ; $07ED12 |
  LDA $052F,x                               ; $07ED14 |
  CMP #$10                                  ; $07ED17 |
  BCC code_07ED2B                           ; $07ED19 |
  INY                                       ; $07ED1B |
  CMP #$20                                  ; $07ED1C |
  BCC code_07ED2B                           ; $07ED1E |
  INY                                       ; $07ED20 |
  CMP #$30                                  ; $07ED21 |
  BCC code_07ED2B                           ; $07ED23 |
  INY                                       ; $07ED25 |
  CMP #$40                                  ; $07ED26 |
  BCC code_07ED2B                           ; $07ED28 |
  INY                                       ; $07ED2A |
code_07ED2B:
  TYA                                       ; $07ED2B |
  ASL                                       ; $07ED2C |
  ASL                                       ; $07ED2D |
  ASL                                       ; $07ED2E |
  ASL                                       ; $07ED2F |
  ORA $04F2                                 ; $07ED30 |
  TAY                                       ; $07ED33 |
  LDA $7D                                   ; $07ED34 |
  AND #$02                                  ; $07ED36 |
  BNE code_07ED49                           ; $07ED38 |
  INC $04F2                                 ; $07ED3A |
  LDA $04F2                                 ; $07ED3D |
  AND #$10                                  ; $07ED40 |
  BEQ code_07ED49                           ; $07ED42 |
  LDA #$00                                  ; $07ED44 |
  STA $04F2                                 ; $07ED46 |
code_07ED49:
  LDA $EE7E,y                               ; $07ED49 |
  CMP #$02                                  ; $07ED4C |
  BNE code_07ED5F                           ; $07ED4E |
  LDA #$17                                  ; $07ED50 |
  JSR code_07C0B7                           ; $07ED52 |
  LDA #$10                                  ; $07ED55 |
  STA $90                                   ; $07ED57 |
  JSR code_07DDBA                           ; $07ED59 |
  JMP code_07EDE5                           ; $07ED5C |

code_07ED5F:
  JSR code_07D8DC                           ; $07ED5F |
  JMP code_07EDE5                           ; $07ED62 |

code_07ED65:
  LDA $93                                   ; $07ED65 |
  CMP #$F0                                  ; $07ED67 |
  BCC code_07EDAE                           ; $07ED69 |
code_07ED6B:
  LDA #$F0                                  ; $07ED6B |
  STA $95                                   ; $07ED6D |
  STA $93                                   ; $07ED6F |
  JSR code_07DDBA                           ; $07ED71 |
  JSR code_07D661                           ; $07ED74 |
  LDA #$00                                  ; $07ED77 |
  STA $062B                                 ; $07ED79 |
  LDA #$FF                                  ; $07ED7C |
  STA $062C                                 ; $07ED7E |
  JSR code_07C837                           ; $07ED81 |
  LDA #$2E                                  ; $07ED84 |
  JSR code_07C0D0                           ; $07ED86 |
  JSR code_07C0F3                           ; $07ED89 |
  JMP code_07C443                           ; $07ED8C |

  LDA #$00                                  ; $07ED8F |
  STA $A8                                   ; $07ED91 |
  STA $04F3                                 ; $07ED93 |
  STA $04F4                                 ; $07ED96 |
  STA $04F5                                 ; $07ED99 |
  STA $04F6                                 ; $07ED9C |
  STA $04F7                                 ; $07ED9F |
  STA $04F8                                 ; $07EDA2 |
  STA $04F9                                 ; $07EDA5 |
  STA $04FA                                 ; $07EDA8 |
  JMP code_07C443                           ; $07EDAB |

code_07EDAE:
  LDA $92                                   ; $07EDAE |
  CLC                                       ; $07EDB0 |
  ADC $99                                   ; $07EDB1 |
  STA $92                                   ; $07EDB3 |
  LDA $91                                   ; $07EDB5 |
  ADC $98                                   ; $07EDB7 |
  STA $91                                   ; $07EDB9 |
  LDA $9D                                   ; $07EDBB |
  CLC                                       ; $07EDBD |
  ADC #$50                                  ; $07EDBE |
  STA $9D                                   ; $07EDC0 |
  LDA $9C                                   ; $07EDC2 |
  ADC #$00                                  ; $07EDC4 |
  STA $9C                                   ; $07EDC6 |
  LDA $94                                   ; $07EDC8 |
  CLC                                       ; $07EDCA |
  ADC $9D                                   ; $07EDCB |
  STA $94                                   ; $07EDCD |
  LDA $93                                   ; $07EDCF |
  ADC $9C                                   ; $07EDD1 |
  STA $93                                   ; $07EDD3 |
  STA $95                                   ; $07EDD5 |
  LDA #$10                                  ; $07EDD7 |
  STA $90                                   ; $07EDD9 |
  JSR code_07DDBA                           ; $07EDDB |
  LDX $04F1                                 ; $07EDDE |
  LDA #$02                                  ; $07EDE1 |
  BNE code_07EDEA                           ; $07EDE3 |
code_07EDE5:
  LDX $04F1                                 ; $07EDE5 |
  LDA #$00                                  ; $07EDE8 |
code_07EDEA:
  STA $04F3,x                               ; $07EDEA |
  LDA #$30                                  ; $07EDED |
  STA $8C                                   ; $07EDEF |
  LDA $A8                                   ; $07EDF1 |
  AND #$10                                  ; $07EDF3 |
  BEQ code_07EDFB                           ; $07EDF5 |
  LDA #$04                                  ; $07EDF7 |
  STA $8C                                   ; $07EDF9 |
code_07EDFB:
  JSR code_07D661                           ; $07EDFB |
  SEC                                       ; $07EDFE |
  JMP code_07EE7D                           ; $07EDFF |

code_07EE02:
  LDA $05B9,x                               ; $07EE02 |
  BNE code_07EE14                           ; $07EE05 |
  LDA #$1E                                  ; $07EE07 |
  STA $05B9,x                               ; $07EE09 |
  JSR code_07FE27                           ; $07EE0C |
  LDA #$08                                  ; $07EE0F |
  JSR code_07C0B7                           ; $07EE11 |
code_07EE14:
  LDA #$10                                  ; $07EE14 |
  STA $90                                   ; $07EE16 |
  JSR code_07DDBA                           ; $07EE18 |
  LDX $04F1                                 ; $07EE1B |
  LDA $04FB,x                               ; $07EE1E |
  CMP #$13                                  ; $07EE21 |
  BNE code_07EE3D                           ; $07EE23 |
  LDA $51                                   ; $07EE25 |
  CMP #$0A                                  ; $07EE27 |
  BNE code_07EE3D                           ; $07EE29 |
  LDA #$15                                  ; $07EE2B |
  STA $04FB,x                               ; $07EE2D |
  LDA #$00                                  ; $07EE30 |
  STA $050F,x                               ; $07EE32 |
  TXA                                       ; $07EE35 |
  TAY                                       ; $07EE36 |
  JSR $BEDA                                 ; $07EE37 |
  JMP code_07EE5A                           ; $07EE3A |

code_07EE3D:
  LDA $0563,x                               ; $07EE3D |
  CMP #$F0                                  ; $07EE40 |
  BCC code_07EE64                           ; $07EE42 |
  LDA #$00                                  ; $07EE44 |
  STA $04F3,x                               ; $07EE46 |
  BEQ code_07EE5A                           ; $07EE49 |
code_07EE4B:
  LDA #$00                                  ; $07EE4B |
  STA $98                                   ; $07EE4D |
  STA $99                                   ; $07EE4F |
  STA $9C                                   ; $07EE51 |
  STA $9D                                   ; $07EE53 |
  LDA #$02                                  ; $07EE55 |
  STA $04F3,x                               ; $07EE57 |
code_07EE5A:
  LDA $A8                                   ; $07EE5A |
  AND #$7F                                  ; $07EE5C |
  STA $A8                                   ; $07EE5E |
  CLC                                       ; $07EE60 |
  JMP code_07EE7D                           ; $07EE61 |

code_07EE64:
  LDA #$50                                  ; $07EE64 |
  CLC                                       ; $07EE66 |
  ADC $059B,x                               ; $07EE67 |
  STA $059B,x                               ; $07EE6A |
  LDA $0593,x                               ; $07EE6D |
  ADC #$00                                  ; $07EE70 |
  STA $0593,x                               ; $07EE72 |
  JSR code_07D5F4                           ; $07EE75 |
  LDA #$02                                  ; $07EE78 |
  JMP code_07EDEA                           ; $07EE7A |

code_07EE7D:
  RTS                                       ; $07EE7D |

  db $00, $00, $01, $01, $00, $00, $01, $02 ; $07EE7E |
  db $00, $00, $01, $01, $00, $00, $01, $02 ; $07EE86 |
  db $00, $00, $01, $01, $00, $00, $01, $02 ; $07EE8E |
  db $00, $00, $01, $01, $00, $00, $01, $02 ; $07EE96 |
  db $00, $00, $01, $01, $00, $00, $01, $02 ; $07EE9E |
  db $00, $00, $01, $01, $00, $00, $01, $02 ; $07EEA6 |
  db $00, $00, $01, $01, $00, $00, $01, $02 ; $07EEAE |
  db $00, $00, $01, $01, $00, $00, $01, $02 ; $07EEB6 |
  db $00, $00, $01, $01, $00, $00, $01, $02 ; $07EEBE |
  db $00, $00, $01, $01, $00, $00, $01, $02 ; $07EEC6 |

code_07EECE:
  JSR code_07C59C                           ; $07EECE |
  JSR code_07EEDE                           ; $07EED1 |
  JSR code_07F008                           ; $07EED4 |
  JSR code_07F08B                           ; $07EED7 |
  JSR code_07C5A8                           ; $07EEDA |
  RTS                                       ; $07EEDD |

code_07EEDE:
  LDA #$AA                                  ; $07EEDE |
  STA $02                                   ; $07EEE0 |
  LDA #$B1                                  ; $07EEE2 |
  STA $03                                   ; $07EEE4 |
  LDA $51                                   ; $07EEE6 |
  ASL                                       ; $07EEE8 |
  TAY                                       ; $07EEE9 |
  LDA ($02),y                               ; $07EEEA |
  STA $00                                   ; $07EEEC |
  INY                                       ; $07EEEE |
  LDA ($02),y                               ; $07EEEF |
  STA $01                                   ; $07EEF1 |
  LDA $0605                                 ; $07EEF3 |
  STA $0D                                   ; $07EEF6 |
  LDA #$06                                  ; $07EEF8 |
  STA $0E                                   ; $07EEFA |
  JSR code_07C258                           ; $07EEFC |
  CLC                                       ; $07EEFF |
  LDA $08                                   ; $07EF00 |
  ADC $00                                   ; $07EF02 |
  STA $00                                   ; $07EF04 |
  LDA $09                                   ; $07EF06 |
  ADC $01                                   ; $07EF08 |
  STA $01                                   ; $07EF0A |
  LDY #$00                                  ; $07EF0C |
  LDA ($00),y                               ; $07EF0E |
  STA $15                                   ; $07EF10 |
  CMP $CD                                   ; $07EF12 |
  BCS code_07EF1C                           ; $07EF14 |
  INC $0605                                 ; $07EF16 |
  JMP code_07EEDE                           ; $07EF19 |

code_07EF1C:
  INY                                       ; $07EF1C |
  LDA ($00),y                               ; $07EF1D |
  STA $16                                   ; $07EF1F |
  LDA #$00                                  ; $07EF21 |
  STA $17                                   ; $07EF23 |
  INY                                       ; $07EF25 |
  LDA ($00),y                               ; $07EF26 |
  STA $18                                   ; $07EF28 |
  ORA $17                                   ; $07EF2A |
  BNE code_07EF4C                           ; $07EF2C |
  LDA $CC                                   ; $07EF2E |
  CLC                                       ; $07EF30 |
  ADC #$80                                  ; $07EF31 |
  STA $0D                                   ; $07EF33 |
  LDA $CD                                   ; $07EF35 |
  ADC #$00                                  ; $07EF37 |
  STA $0E                                   ; $07EF39 |
  LDA $15                                   ; $07EF3B |
  CMP $0E                                   ; $07EF3D |
  BCC code_07EF92                           ; $07EF3F |
  BNE code_07EF49                           ; $07EF41 |
  LDA $16                                   ; $07EF43 |
  CMP $0D                                   ; $07EF45 |
  BCC code_07EF92                           ; $07EF47 |
code_07EF49:
  JMP code_07EFD6                           ; $07EF49 |

code_07EF4C:
  LDA $16                                   ; $07EF4C |
  SEC                                       ; $07EF4E |
  SBC $CC                                   ; $07EF4F |
  STA $13                                   ; $07EF51 |
  LDA $15                                   ; $07EF53 |
  SBC $CD                                   ; $07EF55 |
  BEQ code_07EF61                           ; $07EF57 |
  BCS code_07EFD6                           ; $07EF59 |
code_07EF5B:
  INC $0605                                 ; $07EF5B |
  JMP code_07EFD6                           ; $07EF5E |

code_07EF61:
  LDA $13                                   ; $07EF61 |
  CMP #$20                                  ; $07EF63 |
  BCC code_07EF5B                           ; $07EF65 |
  LDA $18                                   ; $07EF67 |
  SEC                                       ; $07EF69 |
  SBC $CE                                   ; $07EF6A |
  STA $14                                   ; $07EF6C |
  LDA $17                                   ; $07EF6E |
  SBC $CF                                   ; $07EF70 |
  BCC code_07EFD6                           ; $07EF72 |
  CLC                                       ; $07EF74 |
  LDA $13                                   ; $07EF75 |
  ADC #$08                                  ; $07EF77 |
  STA $13                                   ; $07EF79 |
  CLC                                       ; $07EF7B |
  LDA $14                                   ; $07EF7C |
  ADC #$08                                  ; $07EF7E |
  STA $14                                   ; $07EF80 |
  LDA #$08                                  ; $07EF82 |
  STA $0F                                   ; $07EF84 |
  LDA #$00                                  ; $07EF86 |
  STA $10                                   ; $07EF88 |
  JSR code_07F039                           ; $07EF8A |
  JSR code_07F04A                           ; $07EF8D |
  BCC code_07EFD6                           ; $07EF90 |
code_07EF92:
  INC $0605                                 ; $07EF92 |
  INY                                       ; $07EF95 |
  LDA ($00),y                               ; $07EF96 |
  PHA                                       ; $07EF98 |
  CLC                                       ; $07EF99 |
  ADC $16                                   ; $07EF9A |
  STA $0E                                   ; $07EF9C |
  PLA                                       ; $07EF9E |
  BMI code_07EFA8                           ; $07EF9F |
  LDA $15                                   ; $07EFA1 |
  ADC #$00                                  ; $07EFA3 |
  JMP code_07EFAC                           ; $07EFA5 |

code_07EFA8:
  LDA $15                                   ; $07EFA8 |
  ADC #$FF                                  ; $07EFAA |
code_07EFAC:
  STA $0D                                   ; $07EFAC |
  INY                                       ; $07EFAE |
  LDA ($00),y                               ; $07EFAF |
  PHA                                       ; $07EFB1 |
  CLC                                       ; $07EFB2 |
  ADC $18                                   ; $07EFB3 |
  STA $10                                   ; $07EFB5 |
  PLA                                       ; $07EFB7 |
  BMI code_07EFC1                           ; $07EFB8 |
  LDA $17                                   ; $07EFBA |
  ADC #$00                                  ; $07EFBC |
  JMP code_07EFC5                           ; $07EFBE |

code_07EFC1:
  LDA $17                                   ; $07EFC1 |
  ADC #$FF                                  ; $07EFC3 |
code_07EFC5:
  STA $0F                                   ; $07EFC5 |
  INY                                       ; $07EFC7 |
  LDA ($00),y                               ; $07EFC8 |
  STA $11                                   ; $07EFCA |
  LDA #$00                                  ; $07EFCC |
  STA $12                                   ; $07EFCE |
  JSR code_07EFD7                           ; $07EFD0 |
  JMP code_07EEDE                           ; $07EFD3 |

code_07EFD6:
  RTS                                       ; $07EFD6 |

code_07EFD7:
  LDY #$09                                  ; $07EFD7 |
code_07EFD9:
  LDA $05BF,y                               ; $07EFD9 |
  BEQ code_07EFE4                           ; $07EFDC |
  DEY                                       ; $07EFDE |
  BPL code_07EFD9                           ; $07EFDF |
  JMP code_07F007                           ; $07EFE1 |

code_07EFE4:
  LDA $0D                                   ; $07EFE4 |
  STA $05C9,y                               ; $07EFE6 |
  LDA $0E                                   ; $07EFE9 |
  STA $05D3,y                               ; $07EFEB |
  LDA $0F                                   ; $07EFEE |
  STA $05DD,y                               ; $07EFF0 |
  LDA $10                                   ; $07EFF3 |
  STA $05E7,y                               ; $07EFF5 |
  LDA #$01                                  ; $07EFF8 |
  STA $05BF,y                               ; $07EFFA |
  LDA $11                                   ; $07EFFD |
  STA $05F1,y                               ; $07EFFF |
  LDA $12                                   ; $07F002 |
  STA $05FB,y                               ; $07F004 |
code_07F007:
  RTS                                       ; $07F007 |

code_07F008:
  LDY #$09                                  ; $07F008 |
code_07F00A:
  LDA $05BF,y                               ; $07F00A |
  CMP #$01                                  ; $07F00D |
  BEQ code_07F017                           ; $07F00F |
  DEY                                       ; $07F011 |
  BPL code_07F00A                           ; $07F012 |
  JMP code_07F038                           ; $07F014 |

code_07F017:
  LDA $05D3,y                               ; $07F017 |
  STA $36                                   ; $07F01A |
  LDA $05C9,y                               ; $07F01C |
  STA $37                                   ; $07F01F |
  LDA $05E7,y                               ; $07F021 |
  STA $38                                   ; $07F024 |
  LDA $05DD,y                               ; $07F026 |
  STA $39                                   ; $07F029 |
  LDA #$00                                  ; $07F02B |
  STA $05BF,y                               ; $07F02D |
  LDA $05F1,y                               ; $07F030 |
  STA $5E                                   ; $07F033 |
  JSR code_07CF34                           ; $07F035 |
code_07F038:
  RTS                                       ; $07F038 |

code_07F039:
  LDA #$08                                  ; $07F039 |
  STA $0D                                   ; $07F03B |
  LDA #$0C                                  ; $07F03D |
  STA $0E                                   ; $07F03F |
  LDA $91                                   ; $07F041 |
  STA $11                                   ; $07F043 |
  LDA $93                                   ; $07F045 |
  STA $12                                   ; $07F047 |
  RTS                                       ; $07F049 |

code_07F04A:
  LDX #$00                                  ; $07F04A |
code_07F04C:
  LDA $13,x                                 ; $07F04C |
  SEC                                       ; $07F04E |
  SBC $0F,x                                 ; $07F04F |
  BCC code_07F05A                           ; $07F051 |
  SEC                                       ; $07F053 |
  SBC $0D,x                                 ; $07F054 |
  BCC code_07F05A                           ; $07F056 |
  BCS code_07F05C                           ; $07F058 |
code_07F05A:
  LDA #$00                                  ; $07F05A |
code_07F05C:
  CMP $11,x                                 ; $07F05C |
  BCS code_07F089                           ; $07F05E |
  CPX #$01                                  ; $07F060 |
  BEQ code_07F067                           ; $07F062 |
  INX                                       ; $07F064 |
  BNE code_07F04C                           ; $07F065 |
code_07F067:
  LDX #$00                                  ; $07F067 |
code_07F069:
  LDA $13,x                                 ; $07F069 |
  CLC                                       ; $07F06B |
  ADC $0F,x                                 ; $07F06C |
  BCS code_07F077                           ; $07F06E |
  CLC                                       ; $07F070 |
  ADC $0D,x                                 ; $07F071 |
  BCS code_07F077                           ; $07F073 |
  BCC code_07F079                           ; $07F075 |
code_07F077:
  LDA #$FF                                  ; $07F077 |
code_07F079:
  CMP $11,x                                 ; $07F079 |
  BCC code_07F089                           ; $07F07B |
  BEQ code_07F089                           ; $07F07D |
  CPX #$01                                  ; $07F07F |
  BEQ code_07F086                           ; $07F081 |
  INX                                       ; $07F083 |
  BNE code_07F069                           ; $07F084 |
code_07F086:
  SEC                                       ; $07F086 |
  BCS code_07F08A                           ; $07F087 |
code_07F089:
  CLC                                       ; $07F089 |
code_07F08A:
  RTS                                       ; $07F08A |

code_07F08B:
  LDA $51                                   ; $07F08B |
  CMP #$0C                                  ; $07F08D |
  BNE code_07F0CC                           ; $07F08F |
  LDA $52                                   ; $07F091 |
  CMP #$11                                  ; $07F093 |
  BNE code_07F0CC                           ; $07F095 |
  LDY #$03                                  ; $07F097 |
code_07F099:
  DEY                                       ; $07F099 |
  BMI code_07F0C3                           ; $07F09A |
  LDA $F16D,y                               ; $07F09C |
  CMP $0616                                 ; $07F09F |
  BEQ code_07F099                           ; $07F0A2 |
  CMP $0615                                 ; $07F0A4 |
  BNE code_07F099                           ; $07F0A7 |
  SEC                                       ; $07F0A9 |
  LDA $061E                                 ; $07F0AA |
  SBC $F170,y                               ; $07F0AD |
  BCC code_07F099                           ; $07F0B0 |
  STA $061E                                 ; $07F0B2 |
  LDA $0615                                 ; $07F0B5 |
  STA $0616                                 ; $07F0B8 |
  LDA $F173,y                               ; $07F0BB |
  STA $E5                                   ; $07F0BE |
  JMP code_07F126                           ; $07F0C0 |

code_07F0C3:
  LDA $0615                                 ; $07F0C3 |
  STA $0616                                 ; $07F0C6 |
  JMP code_07F16C                           ; $07F0C9 |

code_07F0CC:
  LDA $93                                   ; $07F0CC |
  CMP #$20                                  ; $07F0CE |
  BCS code_07F0D5                           ; $07F0D0 |
  JMP code_07F16C                           ; $07F0D2 |

code_07F0D5:
  LDA #$00                                  ; $07F0D5 |
  STA $18                                   ; $07F0D7 |
code_07F0D9:
  LDA $91                                   ; $07F0D9 |
  CLC                                       ; $07F0DB |
  ADC $CC                                   ; $07F0DC |
  STA $36                                   ; $07F0DE |
  LDA $CD                                   ; $07F0E0 |
  ADC #$00                                  ; $07F0E2 |
  STA $37                                   ; $07F0E4 |
  LDA $18                                   ; $07F0E6 |
  BNE code_07F0F2                           ; $07F0E8 |
  LDA $93                                   ; $07F0EA |
  CLC                                       ; $07F0EC |
  ADC #$10                                  ; $07F0ED |
  JMP code_07F0F4                           ; $07F0EF |

code_07F0F2:
  LDA $93                                   ; $07F0F2 |
code_07F0F4:
  STA $38                                   ; $07F0F4 |
  LDA #$00                                  ; $07F0F6 |
  STA $39                                   ; $07F0F8 |
  JSR code_07CE95                           ; $07F0FA |
  LDA $5E                                   ; $07F0FD |
  STA $E5                                   ; $07F0FF |
  LDA $18                                   ; $07F101 |
  BNE code_07F10C                           ; $07F103 |
  LDA $5E                                   ; $07F105 |
  STA $E0                                   ; $07F107 |
  JMP code_07F110                           ; $07F109 |

code_07F10C:
  LDA $5E                                   ; $07F10C |
  STA $E1                                   ; $07F10E |
code_07F110:
  LDA $5E                                   ; $07F110 |
  BEQ code_07F118                           ; $07F112 |
  CMP #$07                                  ; $07F114 |
  BCC code_07F123                           ; $07F116 |
code_07F118:
  INC $18                                   ; $07F118 |
  LDA $18                                   ; $07F11A |
  CMP #$02                                  ; $07F11C |
  BCC code_07F0D9                           ; $07F11E |
  JMP code_07F16C                           ; $07F120 |

code_07F123:
  JSR code_07CF12                           ; $07F123 |
code_07F126:
  LDA #$07                                  ; $07F126 |
  JSR code_07C0B7                           ; $07F128 |
  LDA #$0D                                  ; $07F12B |
  JSR code_07FE27                           ; $07F12D |
  LDA $E5                                   ; $07F130 |
  CMP #$03                                  ; $07F132 |
  BNE code_07F13C                           ; $07F134 |
  JSR code_07FE7F                           ; $07F136 |
  JMP code_07F16C                           ; $07F139 |

code_07F13C:
  CMP #$04                                  ; $07F13C |
  BNE code_07F14C                           ; $07F13E |
  LDA $062C                                 ; $07F140 |
  CMP #$05                                  ; $07F143 |
  BCS code_07F16C                           ; $07F145 |
  INC $062C                                 ; $07F147 |
  BNE code_07F16C                           ; $07F14A |
code_07F14C:
  CMP #$01                                  ; $07F14C |
  BNE code_07F158                           ; $07F14E |
  INC $062D                                 ; $07F150 |
  LDA #$1B                                  ; $07F153 |
  JSR code_07C0B7                           ; $07F155 |
code_07F158:
  CMP #$05                                  ; $07F158 |
  BNE code_07F15F                           ; $07F15A |
  STA $062B                                 ; $07F15C |
code_07F15F:
  CMP #$06                                  ; $07F15F |
  BNE code_07F16C                           ; $07F161 |
  LDA #$80                                  ; $07F163 |
  STA $BC                                   ; $07F165 |
  LDA #$14                                  ; $07F167 |
  JSR code_07C0B7                           ; $07F169 |
code_07F16C:
  RTS                                       ; $07F16C |

  db $A8, $A9, $AA, $0A, $14, $32, $05, $04 ; $07F16D |
  db $01                                    ; $07F175 |

code_07F176:
  LDA $EA                                   ; $07F176 |
  ORA $EB                                   ; $07F178 |
  BNE code_07F180                           ; $07F17A |
  LDA #$01                                  ; $07F17C |
  STA $BB                                   ; $07F17E |
code_07F180:
  LDA $51                                   ; $07F180 |
  ASL                                       ; $07F182 |
  TAY                                       ; $07F183 |
  LDA $F19B,y                               ; $07F184 |
  STA $01                                   ; $07F187 |
  LDA $F19A,y                               ; $07F189 |
  STA $00                                   ; $07F18C |
  LDA $52                                   ; $07F18E |
  ASL                                       ; $07F190 |
  TAY                                       ; $07F191 |
  LDA ($00),y                               ; $07F192 |
  PHA                                       ; $07F194 |
  INY                                       ; $07F195 |
  LDA ($00),y                               ; $07F196 |
  PHA                                       ; $07F198 |
  RTS                                       ; $07F199 |

  dw $F1C0                                  ; $07F19A |
  dw $F1C2                                  ; $07F19C |
  dw $F1C6                                  ; $07F19E |
  dw $F1CA                                  ; $07F1A0 |
  dw $F1D0                                  ; $07F1A2 |
  dw $F1D6                                  ; $07F1A4 |
  dw $F1DA                                  ; $07F1A6 |
  dw $F1E4                                  ; $07F1A8 |
  dw $F1E8                                  ; $07F1AA |
  dw $F1EC                                  ; $07F1AC |
  dw $F1FA                                  ; $07F1AE |
  dw $F200                                  ; $07F1B0 |
  dw $F204                                  ; $07F1B2 |
  dw $F230                                  ; $07F1B4 |
  dw $F232                                  ; $07F1B6 |
  dw $F234                                  ; $07F1B8 |
  dw $F236                                  ; $07F1BA |
  dw $F238                                  ; $07F1BC |
  dw $F23A                                  ; $07F1BE |
  db $F2                                    ; $07F1C0 |
  dw $F23B                                  ; $07F1C1 |
  dw $F242                                  ; $07F1C3 |
  dw $F286                                  ; $07F1C5 |
  dw $F293                                  ; $07F1C7 |
  dw $F2AA                                  ; $07F1C9 |
  dw $F2B7                                  ; $07F1CB |
  dw $F3D6                                  ; $07F1CD |
  dw $F32F                                  ; $07F1CF |
  dw $F336                                  ; $07F1D1 |
  dw $F361                                  ; $07F1D3 |
  dw $F39F                                  ; $07F1D5 |
  dw $F3AB                                  ; $07F1D7 |
  dw $F4DC                                  ; $07F1D9 |
  dw $F409                                  ; $07F1DB |
  dw $F409                                  ; $07F1DD |
  dw $F409                                  ; $07F1DF |
  dw $F431                                  ; $07F1E1 |
  dw $F457                                  ; $07F1E3 |
  dw $F467                                  ; $07F1E5 |
  dw $F4D3                                  ; $07F1E7 |
  dw $F4E0                                  ; $07F1E9 |
  dw $F5F7                                  ; $07F1EB |
  dw $F504                                  ; $07F1ED |
  dw $F504                                  ; $07F1EF |
  dw $F504                                  ; $07F1F1 |
  dw $F504                                  ; $07F1F3 |
  dw $F520                                  ; $07F1F5 |
  dw $F53F                                  ; $07F1F7 |
  dw $F575                                  ; $07F1F9 |
  dw $F58A                                  ; $07F1FB |
  dw $F5B1                                  ; $07F1FD |
  dw $F5E7                                  ; $07F1FF |
  dw $F6F7                                  ; $07F201 |
  dw $F60E                                  ; $07F203 |
  dw $F61B                                  ; $07F205 |
  dw $F61B                                  ; $07F207 |
  dw $F61B                                  ; $07F209 |
  dw $F61B                                  ; $07F20B |
  dw $F61B                                  ; $07F20D |
  dw $F61B                                  ; $07F20F |
  dw $F61B                                  ; $07F211 |
  dw $F61B                                  ; $07F213 |
  dw $F61B                                  ; $07F215 |
  dw $F61B                                  ; $07F217 |
  dw $F61B                                  ; $07F219 |
  dw $F61B                                  ; $07F21B |
  dw $F61B                                  ; $07F21D |
  dw $F61B                                  ; $07F21F |
  dw $F61B                                  ; $07F221 |
  dw $F61B                                  ; $07F223 |
  dw $F61B                                  ; $07F225 |
  dw $F61B                                  ; $07F227 |
  dw $F61B                                  ; $07F229 |
  dw $F71B                                  ; $07F22B |
  dw $F712                                  ; $07F22D |
  dw $F232                                  ; $07F22F |
  dw $F23C                                  ; $07F231 |
  dw $F23D                                  ; $07F233 |
  dw $F23E                                  ; $07F235 |
  dw $F23F                                  ; $07F237 |
  dw $F240                                  ; $07F239 |
  db $41, $60, $60, $60, $60, $60, $60, $60 ; $07F23B |

  LDA $D7                                   ; $07F243 |
  BEQ code_07F25C                           ; $07F245 |
  CMP #$01                                  ; $07F247 |
  BNE code_07F256                           ; $07F249 |
  LDX #$00                                  ; $07F24B |
  LDY #$00                                  ; $07F24D |
  JSR code_07F809                           ; $07F24F |
  LDA #$FF                                  ; $07F252 |
  STA $D7                                   ; $07F254 |
code_07F256:
  JSR code_07F8A8                           ; $07F256 |
  JMP code_07F286                           ; $07F259 |

code_07F25C:
  LDA $CD                                   ; $07F25C |
  CMP #$08                                  ; $07F25E |
  BNE code_07F270                           ; $07F260 |
  LDA $CC                                   ; $07F262 |
  CMP #$08                                  ; $07F264 |
  BCC code_07F26C                           ; $07F266 |
  LDA #$00                                  ; $07F268 |
  BEQ code_07F26E                           ; $07F26A |
code_07F26C:
  LDA #$08                                  ; $07F26C |
code_07F26E:
  STA $53                                   ; $07F26E |
code_07F270:
  LDA $CD                                   ; $07F270 |
  CMP #$0B                                  ; $07F272 |
  BNE code_07F286                           ; $07F274 |
  INC $52                                   ; $07F276 |
  LDA #$2A                                  ; $07F278 |
  STA $DB                                   ; $07F27A |
  JSR code_07D8EA                           ; $07F27C |
  LDX #$01                                  ; $07F27F |
  LDY #$00                                  ; $07F281 |
  JSR code_07F809                           ; $07F283 |
code_07F286:
  RTS                                       ; $07F286 |

  LDA #$01                                  ; $07F287 |
  STA $E3                                   ; $07F289 |
  LDA $04F3                                 ; $07F28B |
  BNE code_07F293                           ; $07F28E |
  JMP code_07F790                           ; $07F290 |

code_07F293:
  RTS                                       ; $07F293 |

  LDA $CD                                   ; $07F294 |
  CMP #$17                                  ; $07F296 |
  BNE code_07F2AA                           ; $07F298 |
  INC $52                                   ; $07F29A |
  LDA #$2A                                  ; $07F29C |
  STA $DB                                   ; $07F29E |
  JSR code_07D8EA                           ; $07F2A0 |
  LDX #$02                                  ; $07F2A3 |
  LDY #$00                                  ; $07F2A5 |
  JSR code_07F809                           ; $07F2A7 |
code_07F2AA:
  RTS                                       ; $07F2AA |

  LDA #$01                                  ; $07F2AB |
  STA $E3                                   ; $07F2AD |
  LDA $04F3                                 ; $07F2AF |
  BNE code_07F2B7                           ; $07F2B2 |
  JMP code_07F790                           ; $07F2B4 |

code_07F2B7:
  RTS                                       ; $07F2B7 |

  LDA $CD                                   ; $07F2B8 |
  CMP #$16                                  ; $07F2BA |
  BNE code_07F2D6                           ; $07F2BC |
  INC $52                                   ; $07F2BE |
  LDA #$28                                  ; $07F2C0 |
  STA $DB                                   ; $07F2C2 |
  JSR code_07D8EA                           ; $07F2C4 |
  LDX #$03                                  ; $07F2C7 |
  LDY #$00                                  ; $07F2C9 |
  JSR code_07F809                           ; $07F2CB |
  LDA #$00                                  ; $07F2CE |
  STA $E2                                   ; $07F2D0 |
  LDA #$01                                  ; $07F2D2 |
  STA $E3                                   ; $07F2D4 |
code_07F2D6:
  RTS                                       ; $07F2D6 |

  LDA $E2                                   ; $07F2D7 |
  CMP #$05                                  ; $07F2D9 |
  BCS code_07F31A                           ; $07F2DB |
  LDA $E0                                   ; $07F2DD |
  CMP #$38                                  ; $07F2DF |
  BEQ code_07F2E9                           ; $07F2E1 |
  LDA $E1                                   ; $07F2E3 |
  CMP #$38                                  ; $07F2E5 |
  BNE code_07F2EF                           ; $07F2E7 |
code_07F2E9:
  LDA #$01                                  ; $07F2E9 |
  STA $BB                                   ; $07F2EB |
  BNE code_07F32F                           ; $07F2ED |
code_07F2EF:
  LDY #$02                                  ; $07F2EF |
code_07F2F1:
  DEY                                       ; $07F2F1 |
  BPL code_07F2F6                           ; $07F2F2 |
  BMI code_07F31A                           ; $07F2F4 |
code_07F2F6:
  LDA $04D7,y                               ; $07F2F6 |
  CMP #$02                                  ; $07F2F9 |
  BNE code_07F2F1                           ; $07F2FB |
  LDA $04E1,y                               ; $07F2FD |
  CMP #$2D                                  ; $07F300 |
  BEQ code_07F310                           ; $07F302 |
  CMP #$2E                                  ; $07F304 |
  BEQ code_07F310                           ; $07F306 |
  CMP #$2F                                  ; $07F308 |
  BEQ code_07F310                           ; $07F30A |
  CMP #$30                                  ; $07F30C |
  BNE code_07F2F1                           ; $07F30E |
code_07F310:
  INC $E2                                   ; $07F310 |
  LDA #$16                                  ; $07F312 |
  JSR code_07C0B7                           ; $07F314 |
  JMP code_07F32F                           ; $07F317 |

code_07F31A:
  LDA $0615                                 ; $07F31A |
  CMP #$7A                                  ; $07F31D |
  BNE code_07F32F                           ; $07F31F |
  LDA #$F7                                  ; $07F321 |
  JSR code_07FE27                           ; $07F323 |
  INC $52                                   ; $07F326 |
  LDA #$00                                  ; $07F328 |
  STA $DB                                   ; $07F32A |
  JSR code_07F7FA                           ; $07F32C |
code_07F32F:
  RTS                                       ; $07F32F |

  JSR code_07C73C                           ; $07F330 |
  JMP code_07F790                           ; $07F333 |

  RTS                                       ; $07F336 |

  LDA $CD                                   ; $07F337 |
  CMP #$0F                                  ; $07F339 |
  BNE code_07F361                           ; $07F33B |
  INC $52                                   ; $07F33D |
  LDA #$28                                  ; $07F33F |
  STA $DB                                   ; $07F341 |
  JSR code_07D8EA                           ; $07F343 |
  LDA #$13                                  ; $07F346 |
  JSR code_07C8A9                           ; $07F348 |
  LDX #$04                                  ; $07F34B |
  LDY #$00                                  ; $07F34D |
  JSR code_07F809                           ; $07F34F |
  LDX #$05                                  ; $07F352 |
  LDY #$01                                  ; $07F354 |
  JSR code_07F809                           ; $07F356 |
  LDA #$00                                  ; $07F359 |
  STA $E2                                   ; $07F35B |
  LDA #$01                                  ; $07F35D |
  STA $E3                                   ; $07F35F |
code_07F361:
  RTS                                       ; $07F361 |

  LDA $E2                                   ; $07F362 |
  CMP #$05                                  ; $07F364 |
  BCS code_07F392                           ; $07F366 |
  LDY #$02                                  ; $07F368 |
code_07F36A:
  DEY                                       ; $07F36A |
  BPL code_07F36F                           ; $07F36B |
  BMI code_07F392                           ; $07F36D |
code_07F36F:
  LDA $04D7,y                               ; $07F36F |
  CMP #$02                                  ; $07F372 |
  BNE code_07F36A                           ; $07F374 |
  LDA $04E1,y                               ; $07F376 |
  CMP #$1A                                  ; $07F379 |
  BEQ code_07F389                           ; $07F37B |
  CMP #$1B                                  ; $07F37D |
  BEQ code_07F389                           ; $07F37F |
  CMP #$20                                  ; $07F381 |
  BEQ code_07F389                           ; $07F383 |
  CMP #$21                                  ; $07F385 |
  BNE code_07F36A                           ; $07F387 |
code_07F389:
  INC $E2                                   ; $07F389 |
  LDA #$12                                  ; $07F38B |
  JSR code_07C0B7                           ; $07F38D |
  BNE code_07F39F                           ; $07F390 |
code_07F392:
  LDA $E2                                   ; $07F392 |
  CMP #$05                                  ; $07F394 |
  BCC code_07F39F                           ; $07F396 |
  LDA #$F7                                  ; $07F398 |
  JSR code_07FE27                           ; $07F39A |
  INC $52                                   ; $07F39D |
code_07F39F:
  RTS                                       ; $07F39F |

  LDA #$FF                                  ; $07F3A0 |
  STA $061A                                 ; $07F3A2 |
  JSR code_07C760                           ; $07F3A5 |
  JMP code_07F790                           ; $07F3A8 |

  RTS                                       ; $07F3AB |

  LDA $0615                                 ; $07F3AC |
  CMP #$79                                  ; $07F3AF |
  BNE code_07F3DC                           ; $07F3B1 |
  INC $52                                   ; $07F3B3 |
  JSR code_07F7FA                           ; $07F3B5 |
  LDX #$06                                  ; $07F3B8 |
  LDY #$01                                  ; $07F3BA |
  JSR code_07F809                           ; $07F3BC |
  LDA #$3A                                  ; $07F3BF |
  STA $10                                   ; $07F3C1 |
  LDY #$02                                  ; $07F3C3 |
  JSR $BEC1                                 ; $07F3C5 |
  LDY #$03                                  ; $07F3C8 |
  JSR $BEC1                                 ; $07F3CA |
  LDY #$04                                  ; $07F3CD |
  JSR $BEC1                                 ; $07F3CF |
  LDY #$05                                  ; $07F3D2 |
  JSR $BEC1                                 ; $07F3D4 |
  LDA #$28                                  ; $07F3D7 |
  JSR code_07C0D0                           ; $07F3D9 |
code_07F3DC:
  RTS                                       ; $07F3DC |

  LDA #$02                                  ; $07F3DD |
  STA $E3                                   ; $07F3DF |
  LDA $04F4                                 ; $07F3E1 |
  BNE code_07F409                           ; $07F3E4 |
  LDA #$FF                                  ; $07F3E6 |
  STA $061A                                 ; $07F3E8 |
  JSR code_07F8B1                           ; $07F3EB |
  LDA $E9                                   ; $07F3EE |
  CMP #$FF                                  ; $07F3F0 |
  BNE code_07F409                           ; $07F3F2 |
  LDA #$30                                  ; $07F3F4 |
  JSR code_07C0D0                           ; $07F3F6 |
  LDA $8E                                   ; $07F3F9 |
  PHA                                       ; $07F3FB |
  JSR code_07C590                           ; $07F3FC |
  JSR $B05F                                 ; $07F3FF |
  PLA                                       ; $07F402 |
  JSR code_07C5AA                           ; $07F403 |
  JMP code_07F790                           ; $07F406 |

code_07F409:
  RTS                                       ; $07F409 |

  LDA $0615                                 ; $07F40A |
  CMP #$38                                  ; $07F40D |
  BNE code_07F416                           ; $07F40F |
  INC $52                                   ; $07F411 |
  JSR code_07F7FA                           ; $07F413 |
code_07F416:
  LDA $CD                                   ; $07F416 |
  CMP #$13                                  ; $07F418 |
  BNE code_07F431                           ; $07F41A |
  INC $52                                   ; $07F41C |
  LDX #$07                                  ; $07F41E |
  LDY #$00                                  ; $07F420 |
  JSR code_07F809                           ; $07F422 |
  LDX #$08                                  ; $07F425 |
  LDY #$01                                  ; $07F427 |
  JSR code_07F809                           ; $07F429 |
  LDA #$28                                  ; $07F42C |
  JSR code_07C0D0                           ; $07F42E |
code_07F431:
  RTS                                       ; $07F431 |

  LDA #$01                                  ; $07F432 |
  STA $E3                                   ; $07F434 |
  LDA $04F3                                 ; $07F436 |
  BNE code_07F457                           ; $07F439 |
  LDA #$FF                                  ; $07F43B |
  STA $061A                                 ; $07F43D |
  JSR code_07F8B1                           ; $07F440 |
  LDA $E9                                   ; $07F443 |
  CMP #$FF                                  ; $07F445 |
  BNE code_07F457                           ; $07F447 |
  LDX #$19                                  ; $07F449 |
  LDY #$00                                  ; $07F44B |
  JSR code_07F809                           ; $07F44D |
  INC $52                                   ; $07F450 |
  LDA #$30                                  ; $07F452 |
  JSR code_07C0D0                           ; $07F454 |
code_07F457:
  RTS                                       ; $07F457 |

  JSR code_07F8A8                           ; $07F458 |
  LDA #$01                                  ; $07F45B |
  STA $88                                   ; $07F45D |
  LDA $04F3                                 ; $07F45F |
  BNE code_07F467                           ; $07F462 |
  JMP code_07F790                           ; $07F464 |

code_07F467:
  RTS                                       ; $07F467 |

  LDA $91                                   ; $07F468 |
  CLC                                       ; $07F46A |
  ADC $CC                                   ; $07F46B |
  STA $0D                                   ; $07F46D |
  LDA $CD                                   ; $07F46F |
  ADC #$00                                  ; $07F471 |
  CMP #$05                                  ; $07F473 |
  BEQ code_07F485                           ; $07F475 |
  CMP #$04                                  ; $07F477 |
  BNE code_07F48F                           ; $07F479 |
  LDA $0D                                   ; $07F47B |
  CMP #$40                                  ; $07F47D |
  BCC code_07F485                           ; $07F47F |
  CMP #$C0                                  ; $07F481 |
  BCC code_07F48F                           ; $07F483 |
code_07F485:
  LDA $0D                                   ; $07F485 |
  AND #$20                                  ; $07F487 |
  BNE code_07F48F                           ; $07F489 |
  LDA #$20                                  ; $07F48B |
  BNE code_07F491                           ; $07F48D |
code_07F48F:
  LDA #$00                                  ; $07F48F |
code_07F491:
  STA $BD                                   ; $07F491 |
  LDA $E0                                   ; $07F493 |
  CMP #$6C                                  ; $07F495 |
  BNE code_07F49D                           ; $07F497 |
  LDA #$20                                  ; $07F499 |
  STA $BD                                   ; $07F49B |
code_07F49D:
  LDA $CD                                   ; $07F49D |
  CMP #$16                                  ; $07F49F |
  BNE code_07F4D3                           ; $07F4A1 |
  INC $52                                   ; $07F4A3 |
  LDA #$28                                  ; $07F4A5 |
  STA $DB                                   ; $07F4A7 |
  JSR code_07D8EA                           ; $07F4A9 |
  LDX #$09                                  ; $07F4AC |
  LDY #$00                                  ; $07F4AE |
  JSR code_07F809                           ; $07F4B0 |
  LDX #$0A                                  ; $07F4B3 |
  LDY #$01                                  ; $07F4B5 |
  JSR code_07F809                           ; $07F4B7 |
  LDA #$02                                  ; $07F4BA |
  STA $11                                   ; $07F4BC |
  LDY #$02                                  ; $07F4BE |
  JSR $BEC1                                 ; $07F4C0 |
  LDA #$04                                  ; $07F4C3 |
  STA $11                                   ; $07F4C5 |
  LDY #$03                                  ; $07F4C7 |
  JSR $BEC1                                 ; $07F4C9 |
  LDX #$0B                                  ; $07F4CC |
  LDY #$04                                  ; $07F4CE |
  JSR code_07F809                           ; $07F4D0 |
code_07F4D3:
  RTS                                       ; $07F4D3 |

  LDA #$01                                  ; $07F4D4 |
  STA $E3                                   ; $07F4D6 |
  LDA $04F3                                 ; $07F4D8 |
  BNE code_07F4E0                           ; $07F4DB |
  JMP code_07F790                           ; $07F4DD |

code_07F4E0:
  RTS                                       ; $07F4E0 |

  LDA $CD                                   ; $07F4E1 |
  CMP #$0B                                  ; $07F4E3 |
  BNE code_07F4F7                           ; $07F4E5 |
  INC $52                                   ; $07F4E7 |
  LDA #$28                                  ; $07F4E9 |
  STA $DB                                   ; $07F4EB |
  JSR code_07D8EA                           ; $07F4ED |
  LDX #$0C                                  ; $07F4F0 |
  LDY #$00                                  ; $07F4F2 |
  JSR code_07F809                           ; $07F4F4 |
code_07F4F7:
  RTS                                       ; $07F4F7 |

  LDA #$01                                  ; $07F4F8 |
  STA $E3                                   ; $07F4FA |
  LDA $04F3                                 ; $07F4FC |
  BNE code_07F504                           ; $07F4FF |
  JMP code_07F790                           ; $07F501 |

code_07F504:
  RTS                                       ; $07F504 |

  LDA $0615                                 ; $07F505 |
  CMP #$30                                  ; $07F508 |
  BEQ code_07F510                           ; $07F50A |
  CMP #$83                                  ; $07F50C |
  BNE code_07F520                           ; $07F50E |
code_07F510:
  INC $52                                   ; $07F510 |
  JSR code_07F7FA                           ; $07F512 |
  LDA $52                                   ; $07F515 |
  CMP #$04                                  ; $07F517 |
  BNE code_07F520                           ; $07F519 |
  LDA #$24                                  ; $07F51B |
  JSR code_07C0D0                           ; $07F51D |
code_07F520:
  RTS                                       ; $07F520 |

  LDA $CD                                   ; $07F521 |
  CMP #$20                                  ; $07F523 |
  BNE code_07F53F                           ; $07F525 |
  INC $52                                   ; $07F527 |
  LDA #$28                                  ; $07F529 |
  STA $DB                                   ; $07F52B |
  JSR code_07D8EA                           ; $07F52D |
  LDX #$0D                                  ; $07F530 |
  LDY #$00                                  ; $07F532 |
  JSR code_07F809                           ; $07F534 |
  LDA #$00                                  ; $07F537 |
  STA $E2                                   ; $07F539 |
  LDA #$01                                  ; $07F53B |
  STA $E3                                   ; $07F53D |
code_07F53F:
  RTS                                       ; $07F53F |

  LDY #$02                                  ; $07F540 |
code_07F542:
  DEY                                       ; $07F542 |
  BPL code_07F547                           ; $07F543 |
  BMI code_07F575                           ; $07F545 |
code_07F547:
  LDA $04D7,y                               ; $07F547 |
  CMP #$02                                  ; $07F54A |
  BNE code_07F542                           ; $07F54C |
  LDA $04E1,y                               ; $07F54E |
  CMP #$4D                                  ; $07F551 |
  BEQ code_07F561                           ; $07F553 |
  CMP #$4E                                  ; $07F555 |
  BEQ code_07F561                           ; $07F557 |
  CMP #$50                                  ; $07F559 |
  BEQ code_07F561                           ; $07F55B |
  CMP #$51                                  ; $07F55D |
  BNE code_07F542                           ; $07F55F |
code_07F561:
  INC $E2                                   ; $07F561 |
  LDA #$12                                  ; $07F563 |
  JSR code_07C0B7                           ; $07F565 |
  LDA $E2                                   ; $07F568 |
  CMP #$05                                  ; $07F56A |
  BCC code_07F575                           ; $07F56C |
  LDA #$F7                                  ; $07F56E |
  JSR code_07FE27                           ; $07F570 |
  INC $52                                   ; $07F573 |
code_07F575:
  RTS                                       ; $07F575 |

  LDA #$FF                                  ; $07F576 |
  STA $061A                                 ; $07F578 |
  JSR code_07F8B1                           ; $07F57B |
  LDA $E9                                   ; $07F57E |
  CMP #$FF                                  ; $07F580 |
  BNE code_07F58A                           ; $07F582 |
  JSR code_07C754                           ; $07F584 |
  JMP code_07F790                           ; $07F587 |

code_07F58A:
  RTS                                       ; $07F58A |

  LDA $CD                                   ; $07F58B |
  CMP #$0F                                  ; $07F58D |
  BNE code_07F5B1                           ; $07F58F |
  INC $52                                   ; $07F591 |
  LDA #$28                                  ; $07F593 |
  STA $DB                                   ; $07F595 |
  JSR code_07C0D0                           ; $07F597 |
  JSR code_07D8EA                           ; $07F59A |
  LDX #$0E                                  ; $07F59D |
  LDY #$00                                  ; $07F59F |
  JSR code_07F809                           ; $07F5A1 |
  LDA #$A0                                  ; $07F5A4 |
  STA $0E                                   ; $07F5A6 |
  LDA #$60                                  ; $07F5A8 |
  STA $0F                                   ; $07F5AA |
  LDY #$01                                  ; $07F5AC |
  JSR $BEC1                                 ; $07F5AE |
code_07F5B1:
  RTS                                       ; $07F5B1 |

  LDA #$01                                  ; $07F5B2 |
  STA $E3                                   ; $07F5B4 |
  LDA #$02                                  ; $07F5B6 |
  STA $E4                                   ; $07F5B8 |
  LDA $04F3                                 ; $07F5BA |
  BNE code_07F5E7                           ; $07F5BD |
  LDA $04F4                                 ; $07F5BF |
  BNE code_07F5E7                           ; $07F5C2 |
  LDA #$FF                                  ; $07F5C4 |
  STA $061A                                 ; $07F5C6 |
  JSR code_07F8B1                           ; $07F5C9 |
  LDA $E9                                   ; $07F5CC |
  CMP #$FF                                  ; $07F5CE |
  BNE code_07F5E7                           ; $07F5D0 |
  LDA #$0E                                  ; $07F5D2 |
  STA $53                                   ; $07F5D4 |
  JSR code_07C8A9                           ; $07F5D6 |
  LDX #$0F                                  ; $07F5D9 |
  LDY #$00                                  ; $07F5DB |
  JSR code_07F809                           ; $07F5DD |
  INC $52                                   ; $07F5E0 |
  LDA #$30                                  ; $07F5E2 |
  JSR code_07C0D0                           ; $07F5E4 |
code_07F5E7:
  RTS                                       ; $07F5E7 |

  JSR code_07F8A8                           ; $07F5E8 |
  LDA #$01                                  ; $07F5EB |
  STA $88                                   ; $07F5ED |
  LDA $04F3                                 ; $07F5EF |
  BNE code_07F5F7                           ; $07F5F2 |
  JMP code_07F790                           ; $07F5F4 |

code_07F5F7:
  RTS                                       ; $07F5F7 |

  LDA $CD                                   ; $07F5F8 |
  CMP #$0B                                  ; $07F5FA |
  BNE code_07F60E                           ; $07F5FC |
  INC $52                                   ; $07F5FE |
  LDA #$28                                  ; $07F600 |
  STA $DB                                   ; $07F602 |
  JSR code_07D8EA                           ; $07F604 |
  LDX #$10                                  ; $07F607 |
  LDY #$00                                  ; $07F609 |
  JSR code_07F809                           ; $07F60B |
code_07F60E:
  RTS                                       ; $07F60E |

  LDA #$01                                  ; $07F60F |
  STA $E3                                   ; $07F611 |
  LDA $04F3                                 ; $07F613 |
  BNE code_07F61B                           ; $07F616 |
  JMP code_07F790                           ; $07F618 |

code_07F61B:
  RTS                                       ; $07F61B |

  LDA $52                                   ; $07F61C |
  CMP #$06                                  ; $07F61E |
  BNE code_07F628                           ; $07F620 |
  LDA #$2A                                  ; $07F622 |
  STA $DB                                   ; $07F624 |
  BNE code_07F630                           ; $07F626 |
code_07F628:
  CMP #$11                                  ; $07F628 |
  BNE code_07F637                           ; $07F62A |
  LDA #$2B                                  ; $07F62C |
  STA $DB                                   ; $07F62E |
code_07F630:
  CMP $DA                                   ; $07F630 |
  BEQ code_07F637                           ; $07F632 |
  JSR code_07C0D0                           ; $07F634 |
code_07F637:
  LDA $0615                                 ; $07F637 |
  STA $0D                                   ; $07F63A |
  LDA $E0                                   ; $07F63C |
  CMP #$87                                  ; $07F63E |
  BEQ code_07F64A                           ; $07F640 |
  CMP #$88                                  ; $07F642 |
  BEQ code_07F64A                           ; $07F644 |
  LDA #$00                                  ; $07F646 |
  BEQ code_07F64C                           ; $07F648 |
code_07F64A:
  LDA #$20                                  ; $07F64A |
code_07F64C:
  STA $BD                                   ; $07F64C |
  LDY #$00                                  ; $07F64E |
code_07F650:
  LDA $F781,y                               ; $07F650 |
  CMP #$FF                                  ; $07F653 |
  BEQ code_07F668                           ; $07F655 |
  CMP $0D                                   ; $07F657 |
  BEQ code_07F65F                           ; $07F659 |
  INY                                       ; $07F65B |
  INY                                       ; $07F65C |
  BNE code_07F650                           ; $07F65D |
code_07F65F:
  INY                                       ; $07F65F |
  LDA $F781,y                               ; $07F660 |
  STA $52                                   ; $07F663 |
  JSR code_07F7FA                           ; $07F665 |
code_07F668:
  LDA $0615                                 ; $07F668 |
  CMP #$B7                                  ; $07F66B |
  BEQ code_07F676                           ; $07F66D |
  CMP #$65                                  ; $07F66F |
  BEQ code_07F676                           ; $07F671 |
code_07F673:
  JMP code_07F6DA                           ; $07F673 |

code_07F676:
  LDA $DD                                   ; $07F676 |
  BNE code_07F673                           ; $07F678 |
  LDA $8F                                   ; $07F67A |
  CMP #$0E                                  ; $07F67C |
  BNE code_07F6DA                           ; $07F67E |
  LDA $91                                   ; $07F680 |
  CLC                                       ; $07F682 |
  ADC $CC                                   ; $07F683 |
  STA $0F                                   ; $07F685 |
  LDA $CD                                   ; $07F687 |
  ADC #$00                                  ; $07F689 |
  STA $0D                                   ; $07F68B |
  LDA $84                                   ; $07F68D |
  AND #$0F                                  ; $07F68F |
  STA $0E                                   ; $07F691 |
  LDY #$00                                  ; $07F693 |
code_07F695:
  LDA $F74C,y                               ; $07F695 |
  CMP #$FF                                  ; $07F698 |
  BEQ code_07F6DA                           ; $07F69A |
  CMP $0D                                   ; $07F69C |
  BEQ code_07F6A6                           ; $07F69E |
  INY                                       ; $07F6A0 |
  INY                                       ; $07F6A1 |
  INY                                       ; $07F6A2 |
  INY                                       ; $07F6A3 |
  BNE code_07F695                           ; $07F6A4 |
code_07F6A6:
  INY                                       ; $07F6A6 |
  LDA $F74C,y                               ; $07F6A7 |
  CMP $0E                                   ; $07F6AA |
  BEQ code_07F6B3                           ; $07F6AC |
  INY                                       ; $07F6AE |
  INY                                       ; $07F6AF |
  INY                                       ; $07F6B0 |
  BNE code_07F695                           ; $07F6B1 |
code_07F6B3:
  INY                                       ; $07F6B3 |
  LDA $F74C,y                               ; $07F6B4 |
  STA $DE                                   ; $07F6B7 |
  LDA #$43                                  ; $07F6B9 |
  STA $10                                   ; $07F6BB |
  LDA $0E                                   ; $07F6BD |
  AND #$01                                  ; $07F6BF |
  ASL                                       ; $07F6C1 |
  ASL                                       ; $07F6C2 |
  STA $11                                   ; $07F6C3 |
  LDA $0F                                   ; $07F6C5 |
  STA $0E                                   ; $07F6C7 |
  LDA #$B2                                  ; $07F6C9 |
  STA $0F                                   ; $07F6CB |
  LDY #$00                                  ; $07F6CD |
  JSR $BEC1                                 ; $07F6CF |
  LDA #$01                                  ; $07F6D2 |
  STA $DD                                   ; $07F6D4 |
  LDA #$20                                  ; $07F6D6 |
  STA $BD                                   ; $07F6D8 |
code_07F6DA:
  LDA $CD                                   ; $07F6DA |
  CMP #$05                                  ; $07F6DC |
  BNE code_07F6F9                           ; $07F6DE |
  LDA $CC                                   ; $07F6E0 |
  CMP #$02                                  ; $07F6E2 |
  BCS code_07F712                           ; $07F6E4 |
  LDX #$11                                  ; $07F6E6 |
  LDY #$01                                  ; $07F6E8 |
  JSR code_07F809                           ; $07F6EA |
  LDA #$A0                                  ; $07F6ED |
  STA $0E                                   ; $07F6EF |
  LDY #$02                                  ; $07F6F1 |
  JSR $BEC1                                 ; $07F6F3 |
  JMP code_07F712                           ; $07F6F6 |

code_07F6F9:
  LDA $CD                                   ; $07F6F9 |
  CMP #$1F                                  ; $07F6FB |
  BNE code_07F712                           ; $07F6FD |
  LDA #$14                                  ; $07F6FF |
  STA $52                                   ; $07F701 |
  JSR code_07D8EA                           ; $07F703 |
  LDA #$10                                  ; $07F706 |
  JSR code_07C8A9                           ; $07F708 |
  LDX #$12                                  ; $07F70B |
  LDY #$00                                  ; $07F70D |
  JSR code_07F809                           ; $07F70F |
code_07F712:
  RTS                                       ; $07F712 |

  LDA $04F3                                 ; $07F713 |
  BNE code_07F732                           ; $07F716 |
  INC $52                                   ; $07F718 |
  JSR code_07F7FA                           ; $07F71A |
  LDA #$29                                  ; $07F71D |
  JSR code_07C0D0                           ; $07F71F |
  LDX #$13                                  ; $07F722 |
  LDY #$00                                  ; $07F724 |
  JSR code_07F809                           ; $07F726 |
  LDA #$FF                                  ; $07F729 |
  STA $051B                                 ; $07F72B |
  LDA #$01                                  ; $07F72E |
  STA $E3                                   ; $07F730 |
code_07F732:
  RTS                                       ; $07F732 |

  LDA $04F3                                 ; $07F733 |
  BNE code_07F74B                           ; $07F736 |
  LDX #$1E                                  ; $07F738 |
  JSR code_07C837                           ; $07F73A |
  JSR code_07C0E9                           ; $07F73D |
  LDA #$2D                                  ; $07F740 |
  JSR code_07C0D0                           ; $07F742 |
  JSR code_07C0F3                           ; $07F745 |
  JMP code_07F79D                           ; $07F748 |

code_07F74B:
  RTS                                       ; $07F74B |

  db $02, $02, $02, $D8, $06, $01, $03, $28 ; $07F74C |
  db $09, $01, $04, $28, $0B, $02, $06, $28 ; $07F754 |
  db $0E, $01, $0C, $D8, $0F, $02, $05, $28 ; $07F75C |
  db $11, $01, $07, $28, $12, $01, $08, $28 ; $07F764 |
  db $13, $01, $09, $28, $15, $02, $0D, $D8 ; $07F76C |
  db $19, $02, $0A, $D8, $1A, $02, $0B, $28 ; $07F774 |
  db $1C, $02, $0E, $28, $FF, $BF, $01, $7A ; $07F77C |
  db $0F, $C0, $00, $C1, $10, $30, $11, $BD ; $07F784 |
  db $12, $BE, $13, $FF                     ; $07F78C |

code_07F790:
  LDA #$FF                                  ; $07F790 |
  STA $061A                                 ; $07F792 |
  JSR code_07C0E9                           ; $07F795 |
  LDA #$32                                  ; $07F798 |
  JSR code_07C0D0                           ; $07F79A |
code_07F79D:
  LDA #$FF                                  ; $07F79D |
  STA $061A                                 ; $07F79F |
  JSR code_07C0F3                           ; $07F7A2 |
  JSR code_07F7BF                           ; $07F7A5 |
  INC $51                                   ; $07F7A8 |
  LDA $51                                   ; $07F7AA |
  CMP #$0D                                  ; $07F7AC |
  BEQ code_07F7BC                           ; $07F7AE |
  LDA $061E                                 ; $07F7B0 |
  BEQ code_07F7BC                           ; $07F7B3 |
  LDA #$04                                  ; $07F7B5 |
  STA $EC                                   ; $07F7B7 |
  JSR code_07C7A1                           ; $07F7B9 |
code_07F7BC:
  JMP code_07C66A                           ; $07F7BC |

code_07F7BF:
  LDA $EA                                   ; $07F7BF |
  ORA $EB                                   ; $07F7C1 |
  BEQ code_07F7EE                           ; $07F7C3 |
  SEC                                       ; $07F7C5 |
  LDA $EA                                   ; $07F7C6 |
  SBC #$01                                  ; $07F7C8 |
  STA $EA                                   ; $07F7CA |
  LDA $EB                                   ; $07F7CC |
  SBC #$00                                  ; $07F7CE |
  STA $EB                                   ; $07F7D0 |
  LDA #$FF                                  ; $07F7D2 |
  STA $061A                                 ; $07F7D4 |
  INC $7D                                   ; $07F7D7 |
  LDA #$0B                                  ; $07F7D9 |
  JSR code_07FE27                           ; $07F7DB |
  JSR code_07C837                           ; $07F7DE |
  LDA $0632                                 ; $07F7E1 |
  BNE code_07F7BF                           ; $07F7E4 |
  LDA #$13                                  ; $07F7E6 |
  JSR code_07C0B7                           ; $07F7E8 |
  JMP code_07F7BF                           ; $07F7EB |

code_07F7EE:
  LDY #$18                                  ; $07F7EE |
code_07F7F0:
  DEY                                       ; $07F7F0 |
  BEQ code_07F7F9                           ; $07F7F1 |
  JSR code_07C837                           ; $07F7F3 |
  JMP code_07F7F0                           ; $07F7F6 |

code_07F7F9:
  RTS                                       ; $07F7F9 |

code_07F7FA:
  LDA #$04                                  ; $07F7FA |
  STA $EC                                   ; $07F7FC |
  JSR code_07D8EA                           ; $07F7FE |
  JSR code_07C837                           ; $07F801 |
  LDA #$05                                  ; $07F804 |
  STA $EC                                   ; $07F806 |
  RTS                                       ; $07F808 |

code_07F809:
  LDA $F826,x                               ; $07F809 |
  STA $10                                   ; $07F80C |
  LDA $F840,x                               ; $07F80E |
  STA $11                                   ; $07F811 |
  LDA $F85A,x                               ; $07F813 |
  STA $0D                                   ; $07F816 |
  LDA $F874,x                               ; $07F818 |
  STA $0E                                   ; $07F81B |
  LDA $F88E,x                               ; $07F81D |
  STA $0F                                   ; $07F820 |
  JSR $BEC1                                 ; $07F822 |
  RTS                                       ; $07F825 |

  db $4E, $05, $00, $49, $37, $4A, $39, $10 ; $07F826 |
  db $4B, $3B, $40, $37, $3C, $3D, $17, $4F ; $07F82E |
  db $3F, $42, $4D, $46, $4C, $17, $17, $39 ; $07F836 |
  db $44, $4F, $00, $00, $10, $00, $00, $00 ; $07F83E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07F846 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07F84E |
  db $00, $00, $00, $10, $00, $0B, $17, $16 ; $07F856 |
  db $0F, $0F, $0F, $14, $13, $16, $16, $16 ; $07F85E |
  db $0B, $20, $0F, $10, $0B, $05, $1F, $20 ; $07F866 |
  db $16, $1A, $1A, $1C, $1F, $14, $01, $A4 ; $07F86E |
  db $00, $80, $C8, $80, $F0, $20, $C0, $CC ; $07F876 |
  db $D8, $DC, $E0, $DC, $10, $10, $E0, $60 ; $07F87E |
  db $78, $D8, $80, $40, $60, $F0, $78, $10 ; $07F886 |
  db $B8, $70, $C3, $80, $48, $80, $B0, $A8 ; $07F88E |
  db $68, $6C, $78, $90, $54, $6C, $40, $B8 ; $07F896 |
  db $80, $58, $68, $30, $60, $40, $80, $B0 ; $07F89E |
  db $60, $A8                               ; $07F8A6 |

code_07F8A8:
  LDA #$00                                  ; $07F8A8 |
  STA $C7                                   ; $07F8AA |
  STA $D5                                   ; $07F8AC |
  STA $84                                   ; $07F8AE |
  RTS                                       ; $07F8B0 |

code_07F8B1:
  LDA $A8                                   ; $07F8B1 |
  LSR                                       ; $07F8B3 |
  BCC code_07F8F6                           ; $07F8B4 |
  LDA $A7                                   ; $07F8B6 |
  AND #$01                                  ; $07F8B8 |
  STA $A7                                   ; $07F8BA |
  LDA $A8                                   ; $07F8BC |
  AND #$01                                  ; $07F8BE |
  STA $A8                                   ; $07F8C0 |
  JSR code_07F8A8                           ; $07F8C2 |
  LDA $E9                                   ; $07F8C5 |
  BNE code_07F8E1                           ; $07F8C7 |
  LDA $91                                   ; $07F8C9 |
  CMP #$58                                  ; $07F8CB |
  BCS code_07F8D5                           ; $07F8CD |
code_07F8CF:
  LDA #$04                                  ; $07F8CF |
code_07F8D1:
  STA $84                                   ; $07F8D1 |
  BNE code_07F8F6                           ; $07F8D3 |
code_07F8D5:
  CMP #$5A                                  ; $07F8D5 |
  BCC code_07F8DD                           ; $07F8D7 |
  LDA #$03                                  ; $07F8D9 |
  BNE code_07F8D1                           ; $07F8DB |
code_07F8DD:
  LDA #$01                                  ; $07F8DD |
  STA $E9                                   ; $07F8DF |
code_07F8E1:
  LDA $91                                   ; $07F8E1 |
  CMP #$60                                  ; $07F8E3 |
  BCC code_07F8CF                           ; $07F8E5 |
  JSR $BE4C                                 ; $07F8E7 |
  LDA #$02                                  ; $07F8EA |
  STA $D3                                   ; $07F8EC |
  LDA #$0E                                  ; $07F8EE |
  STA $8F                                   ; $07F8F0 |
  LDA #$FF                                  ; $07F8F2 |
  STA $E9                                   ; $07F8F4 |
code_07F8F6:
  RTS                                       ; $07F8F6 |

code_07F8F7:
  LDA $061E                                 ; $07F8F7 |
code_07F8FA:
  STA $23                                   ; $07F8FA |
  TXA                                       ; $07F8FC |
  PHA                                       ; $07F8FD |
  TYA                                       ; $07F8FE |
  PHA                                       ; $07F8FF |
  JSR code_07C23B                           ; $07F900 |
  LDA #$00                                  ; $07F903 |
  STA $24                                   ; $07F905 |
  STA $25                                   ; $07F907 |
  JSR code_07C15F                           ; $07F909 |
  JSR code_07C246                           ; $07F90C |
  PLA                                       ; $07F90F |
  TAY                                       ; $07F910 |
  PLA                                       ; $07F911 |
  TAX                                       ; $07F912 |
  RTS                                       ; $07F913 |

code_07F914:
  LDX #$00                                  ; $07F914 |
code_07F916:
  JSR code_07F91E                           ; $07F916 |
  LDX #$40                                  ; $07F919 |
  JMP code_07C844                           ; $07F91B |

code_07F91E:
  LDA #$70                                  ; $07F91E |
  STA $73                                   ; $07F920 |
  LDA #$F9                                  ; $07F922 |
  STA $74                                   ; $07F924 |
code_07F926:
  LDY #$00                                  ; $07F926 |
code_07F928:
  LDA ($73),y                               ; $07F928 |
  CMP #$FE                                  ; $07F92A |
  BEQ code_07F931                           ; $07F92C |
  INY                                       ; $07F92E |
  BNE code_07F928                           ; $07F92F |
code_07F931:
  DEX                                       ; $07F931 |
  BMI code_07F93A                           ; $07F932 |
  JSR code_07FD0C                           ; $07F934 |
  JMP code_07F926                           ; $07F937 |

code_07F93A:
  JSR code_07FD01                           ; $07F93A |
  STA $71                                   ; $07F93D |
  JSR code_07FD01                           ; $07F93F |
  STA $72                                   ; $07F942 |
code_07F944:
  LDY #$00                                  ; $07F944 |
code_07F946:
  LDA ($73),y                               ; $07F946 |
  CMP #$FE                                  ; $07F948 |
  BEQ code_07F96B                           ; $07F94A |
  CMP #$FD                                  ; $07F94C |
  BEQ code_07F953                           ; $07F94E |
  INY                                       ; $07F950 |
  BNE code_07F946                           ; $07F951 |
code_07F953:
  STY $2A                                   ; $07F953 |
  JSR code_07C837                           ; $07F955 |
  JSR code_07FD0C                           ; $07F958 |
  CLC                                       ; $07F95B |
  LDA $71                                   ; $07F95C |
  ADC #$20                                  ; $07F95E |
  STA $71                                   ; $07F960 |
  LDA $72                                   ; $07F962 |
  ADC #$00                                  ; $07F964 |
  STA $72                                   ; $07F966 |
  JMP code_07F944                           ; $07F968 |

code_07F96B:
  STY $2A                                   ; $07F96B |
  JMP code_07C837                           ; $07F96D |

  db $E4, $22, $16, $0A, $22, $FF, $12, $FF ; $07F970 |
  db $11, $0E, $15, $19, $FF, $22, $18, $1E ; $07F978 |
  db $FF, $25, $FF, $FF, $FF, $FF, $FF, $FF ; $07F980 |
  db $FF, $FF, $FE, $E4, $22, $20, $11, $0A ; $07F988 |
  db $1D, $FF, $20, $18, $1E, $15, $0D, $FF ; $07F990 |
  db $22, $18, $1E, $FF, $15, $12, $14, $0E ; $07F998 |
  db $FF, $25, $FF, $FF, $FF, $FE, $E4, $22 ; $07F9A0 |
  db $1C, $18, $1B, $1B, $22, $26, $FF, $12 ; $07F9A8 |
  db $1D, $FF, $12, $1C, $FF, $17, $18, $1D ; $07F9B0 |
  db $FF, $0E, $17, $18, $1E, $10, $11, $26 ; $07F9B8 |
  db $FE, $E4, $22, $20, $18, $1E, $15, $0D ; $07F9C0 |
  db $FF, $22, $18, $1E, $FF, $15, $12, $14 ; $07F9C8 |
  db $0E, $FF, $0F, $1B, $12, $0E, $1C, $FF ; $07F9D0 |
  db $25, $FF, $FF, $FE, $E4, $26, $1D, $1B ; $07F9D8 |
  db $22, $FF, $1D, $18, $FF, $19, $15, $0A ; $07F9E0 |
  db $22, $FF, $1D, $11, $0E, $FF, $10, $0A ; $07F9E8 |
  db $16, $0E, $26, $FE, $E4, $22, $0C, $18 ; $07F9F0 |
  db $16, $0E, $FF, $0B, $0A, $0C, $14, $FF ; $07F9F8 |
  db $1C, $18, $18, $17, $FF, $24, $24, $FF ; $07FA00 |
  db $FF, $FF, $FF, $FF, $FE, $34, $26, $16 ; $07FA08 |
  db $0A, $22, $18, $1B, $FD, $FD, $FF, $16 ; $07FA10 |
  db $0C, $0C, $11, $0E, $0E, $1C, $0E, $FE ; $07FA18 |
  db $54, $26, $0F, $1B, $22, $FF, $10, $1E ; $07FA20 |
  db $22, $1C, $FE, $54, $26, $0C, $0A, $19 ; $07FA28 |
  db $1D, $0A, $12, $17, $FE, $54, $26, $10 ; $07FA30 |
  db $1B, $12, $16, $0A, $0C, $0E, $FE, $34 ; $07FA38 |
  db $26, $0D, $18, $17, $0A, $15, $0D, $FD ; $07FA40 |
  db $FD, $FF, $16, $0C, $0D, $18, $17, $0A ; $07FA48 |
  db $15, $0D, $FE, $54, $26, $19, $1B, $18 ; $07FA50 |
  db $0F, $0E, $1C, $1C, $18, $1B, $FE, $54 ; $07FA58 |
  db $26, $0B, $12, $1B, $0D, $12, $0E, $FE ; $07FA60 |
  db $54, $26, $1E, $17, $0C, $15, $0E, $FE ; $07FA68 |
  db $34, $26, $0B, $12, $10, $FF, $16, $0A ; $07FA70 |
  db $0C, $FD, $FD, $FF, $19, $18, $15, $12 ; $07FA78 |
  db $0C, $0E, $FE, $54, $26, $11, $0A, $16 ; $07FA80 |
  db $0B, $1E, $1B, $10, $15, $0A, $1B, $FE ; $07FA88 |
  db $34, $26, $FF, $FF, $FF, $FF, $FF, $FF ; $07FA90 |
  db $FF, $FF, $FF, $FF, $FD, $FF, $FF, $FF ; $07FA98 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FD ; $07FAA0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FAA8 |
  db $FF, $FF, $FE, $72, $20, $64, $6F, $6E ; $07FAB0 |
  db $61, $6C, $64, $FF, $6C, $61, $6E, $64 ; $07FAB8 |
  db $FD, $FD, $73, $74, $61, $66, $66, $FE ; $07FAC0 |
  db $72, $20, $70, $72, $6F, $67, $72, $61 ; $07FAC8 |
  db $6D, $6D, $65, $72, $FD, $FD, $73, $56 ; $07FAD0 |
  db $69, $73, $68, $69, $69, $FE, $72, $20 ; $07FAD8 |
  db $70, $72, $6F, $67, $72, $61, $6D, $6D ; $07FAE0 |
  db $65, $72, $FD, $FD, $67, $75, $6D, $6F ; $07FAE8 |
  db $6E, $FE, $72, $20, $63, $56, $67, $56 ; $07FAF0 |
  db $64, $65, $73, $69, $67, $6E, $65, $72 ; $07FAF8 |
  db $FD, $FD, $6B, $56, $61, $62, $65, $6D ; $07FB00 |
  db $61, $74, $73, $75, $FE, $72, $20, $63 ; $07FB08 |
  db $56, $67, $56, $64, $65, $73, $69, $67 ; $07FB10 |
  db $6E, $65, $72, $FD, $FD, $74, $61, $6B ; $07FB18 |
  db $61, $79, $75, $6B, $69, $56, $6D, $FE ; $07FB20 |
  db $72, $20, $63, $56, $67, $56, $64, $65 ; $07FB28 |
  db $73, $69, $67, $6E, $65, $72, $FD, $FD ; $07FB30 |
  db $74, $56, $6E, $61, $67, $61, $6F, $6B ; $07FB38 |
  db $61, $FE, $B2, $20, $6D, $56, $68, $61 ; $07FB40 |
  db $73, $68, $69, $6D, $6F, $74, $6F, $FE ; $07FB48 |
  db $B2, $20, $61, $56, $6B, $61, $6E, $64 ; $07FB50 |
  db $61, $FF, $FF, $FF, $FF, $FE, $B2, $20 ; $07FB58 |
  db $6D, $6F, $74, $6F, $6B, $6F, $56, $6E ; $07FB60 |
  db $FE, $71, $20, $73, $6F, $75, $6E, $64 ; $07FB68 |
  db $FF, $63, $72, $65, $61, $74, $6F, $72 ; $07FB70 |
  db $FD, $FD, $73, $56, $6B, $61, $6D, $69 ; $07FB78 |
  db $7A, $6F, $6E, $6F, $FE, $B1, $20, $74 ; $07FB80 |
  db $56, $6D, $69, $75, $72, $61, $FF, $FF ; $07FB88 |
  db $FF, $FE, $B1, $20, $73, $56, $73, $61 ; $07FB90 |
  db $6B, $61, $69, $FE, $72, $20, $64, $69 ; $07FB98 |
  db $72, $65, $63, $74, $6F, $72, $FD, $FD ; $07FBA0 |
  db $68, $56, $6E, $61, $6B, $61, $6D, $6F ; $07FBA8 |
  db $74, $6F, $FE, $72, $20, $70, $72, $6F ; $07FBB0 |
  db $64, $75, $63, $65, $72, $FD, $FD, $74 ; $07FBB8 |
  db $56, $6B, $61, $6E, $65, $79, $61, $73 ; $07FBC0 |
  db $75, $FE, $6D, $20, $73, $70, $65, $63 ; $07FBC8 |
  db $69, $61, $6C, $FF, $74, $68, $61, $6E ; $07FBD0 |
  db $6B, $73, $FF, $74, $6F, $FD, $FD, $FF ; $07FBD8 |
  db $FF, $FF, $FF, $FF, $6D, $56, $6F, $7A ; $07FBE0 |
  db $61, $6B, $69, $FE, $72, $20, $61, $6E ; $07FBE8 |
  db $64, $FD, $FD, $FF, $FF, $FF, $79, $6F ; $07FBF0 |
  db $75, $54, $FE, $CC, $24, $74, $68, $61 ; $07FBF8 |
  db $6E, $6B, $FF, $79, $6F, $75, $54, $FE ; $07FC00 |
  db $F2, $24, $55, $FE, $F3, $24, $55, $FE ; $07FC08 |
  db $11, $21, $20, $18, $1B, $15, $0D, $FE ; $07FC10 |
  db $8B, $21, $FF, $B9, $BA, $27, $28, $FD ; $07FC18 |
  db $FF, $BB, $CB, $29, $2A, $FD, $FD, $FD ; $07FC20 |
  db $FD, $FD, $10, $0E, $1D, $FF, $1B, $0E ; $07FC28 |
  db $0A, $0D, $22, $24, $24, $FE, $4B, $21 ; $07FC30 |
  db $10, $0A, $16, $0E, $FF, $18, $1F, $0E ; $07FC38 |
  db $1B, $24, $24, $FE, $CD, $21, $0C, $18 ; $07FC40 |
  db $17, $1D, $12, $17, $1E, $0E, $FD, $FD ; $07FC48 |
  db $1B, $0E, $1D, $1B, $22, $FE, $07, $21 ; $07FC50 |
  db $11, $18, $16, $0E, $FF, $1D, $18, $20 ; $07FC58 |
  db $17, $FE, $07, $21, $15, $0A, $14, $0E ; $07FC60 |
  db $FF, $1C, $12, $0D, $0E, $FE, $0A, $21 ; $07FC68 |
  db $0F, $18, $1B, $0E, $1C, $1D, $FE, $0B ; $07FC70 |
  db $21, $1C, $14, $22, $FE, $0A, $21, $18 ; $07FC78 |
  db $0A, $1C, $12, $1C, $FE, $0B, $21, $0C ; $07FC80 |
  db $0A, $1F, $0E, $FE, $0B, $21, $19, $18 ; $07FC88 |
  db $17, $0D, $FE, $0A, $21, $11, $0A, $1B ; $07FC90 |
  db $0B, $18, $1B, $FE, $0A, $21, $18, $0C ; $07FC98 |
  db $0E, $0A, $17, $FE, $06, $21, $10, $11 ; $07FCA0 |
  db $18, $1C, $1D, $FF, $1D, $18, $20, $17 ; $07FCA8 |
  db $FE, $05, $21, $0D, $0A, $1B, $14, $FF ; $07FCB0 |
  db $0F, $18, $1B, $0E, $1C, $1D, $FE, $0A ; $07FCB8 |
  db $21, $0C, $0A, $1C, $1D, $15, $0E, $FE ; $07FCC0 |
  db $CE, $21, $1C, $11, $18, $19, $FE, $B2 ; $07FCC8 |
  db $20, $72, $56, $69, $6A, $79, $75, $69 ; $07FCD0 |
  db $6E, $FE, $6D, $20, $FF, $FF, $FF, $FF ; $07FCD8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FCE0 |
  db $FF, $FF, $FF, $FF, $FF, $FD, $FD, $FF ; $07FCE8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FCF0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FCF8 |
  db $FE                                    ; $07FD00 |

code_07FD01:
  LDY #$00                                  ; $07FD01 |
  LDA ($73),y                               ; $07FD03 |
  INC $73                                   ; $07FD05 |
  BNE code_07FD0B                           ; $07FD07 |
  INC $74                                   ; $07FD09 |
code_07FD0B:
  RTS                                       ; $07FD0B |

code_07FD0C:
  SEC                                       ; $07FD0C |
  TYA                                       ; $07FD0D |
  ADC $73                                   ; $07FD0E |
  STA $73                                   ; $07FD10 |
  LDA $74                                   ; $07FD12 |
  ADC #$00                                  ; $07FD14 |
  STA $74                                   ; $07FD16 |
  RTS                                       ; $07FD18 |

code_07FD19:
  LDA $EC                                   ; $07FD19 |
  CMP #$05                                  ; $07FD1B |
  BNE code_07FD55                           ; $07FD1D |
  LDX $061A                                 ; $07FD1F |
  BMI code_07FD55                           ; $07FD22 |
  INX                                       ; $07FD24 |
  CPX #$3C                                  ; $07FD25 |
  BCC code_07FD52                           ; $07FD27 |
  DEC $EA                                   ; $07FD29 |
  LDA $EA                                   ; $07FD2B |
  CMP #$FF                                  ; $07FD2D |
  BNE code_07FD3B                           ; $07FD2F |
  DEC $EB                                   ; $07FD31 |
  BPL code_07FD3B                           ; $07FD33 |
  LDA #$00                                  ; $07FD35 |
  STA $EA                                   ; $07FD37 |
  STA $EB                                   ; $07FD39 |
code_07FD3B:
  LDA $EB                                   ; $07FD3B |
  BNE code_07FD50                           ; $07FD3D |
  LDA $EA                                   ; $07FD3F |
  CMP #$50                                  ; $07FD41 |
  BNE code_07FD50                           ; $07FD43 |
  LDA $E3                                   ; $07FD45 |
  ORA $E4                                   ; $07FD47 |
  BNE code_07FD50                           ; $07FD49 |
  LDA #$2F                                  ; $07FD4B |
  JSR code_07C0D0                           ; $07FD4D |
code_07FD50:
  LDX #$00                                  ; $07FD50 |
code_07FD52:
  STX $061A                                 ; $07FD52 |
code_07FD55:
  LDA $7C                                   ; $07FD55 |
  AND #$07                                  ; $07FD57 |
  ASL                                       ; $07FD59 |
  TAY                                       ; $07FD5A |
  LDA $FD65,y                               ; $07FD5B |
  PHA                                       ; $07FD5E |
  LDA $FD64,y                               ; $07FD5F |
  PHA                                       ; $07FD62 |
  RTS                                       ; $07FD63 |

  dw $FD73                                  ; $07FD64 |
  dw $FD9B                                  ; $07FD66 |
  dw $FDB2                                  ; $07FD68 |
  dw $FDB9                                  ; $07FD6A |
  dw $FE0D                                  ; $07FD6C |
  dw $FD62                                  ; $07FD6E |
  dw $FDB2                                  ; $07FD70 |
  dw $FDB9                                  ; $07FD72 |

  JSR code_07C23B                           ; $07FD74 |
  LDA $0101                                 ; $07FD77 |
  STA $061B                                 ; $07FD7A |
  LDA $0102                                 ; $07FD7D |
  STA $061C                                 ; $07FD80 |
  LDA $0103                                 ; $07FD83 |
  STA $061D                                 ; $07FD86 |
  LDA $061B                                 ; $07FD89 |
  STA $23                                   ; $07FD8C |
  LDA $061C                                 ; $07FD8E |
  AND #$0F                                  ; $07FD91 |
  STA $24                                   ; $07FD93 |
  LDA #$00                                  ; $07FD95 |
  STA $25                                   ; $07FD97 |
  JMP code_07C15F                           ; $07FD99 |

  LDA #$00                                  ; $07FD9C |
  STA $23                                   ; $07FD9E |
  LDA $061C                                 ; $07FDA0 |
  AND #$F0                                  ; $07FDA3 |
  STA $24                                   ; $07FDA5 |
  LDA $061D                                 ; $07FDA7 |
  STA $25                                   ; $07FDAA |
  JSR code_07FED6                           ; $07FDAC |
  LDY #$00                                  ; $07FDAF |
  BEQ code_07FDD1                           ; $07FDB1 |
  JSR code_07F8F7                           ; $07FDB3 |
  LDY #$05                                  ; $07FDB6 |
  BNE code_07FDD1                           ; $07FDB8 |
  JSR code_07C23B                           ; $07FDBA |
  LDA $EA                                   ; $07FDBD |
  STA $23                                   ; $07FDBF |
  LDA $EB                                   ; $07FDC1 |
  STA $24                                   ; $07FDC3 |
  LDA #$00                                  ; $07FDC5 |
  STA $25                                   ; $07FDC7 |
  JSR code_07C15F                           ; $07FDC9 |
  JSR code_07C246                           ; $07FDCC |
  LDY #$0A                                  ; $07FDCF |
code_07FDD1:
  LDA $FDEB,y                               ; $07FDD1 |
  STA $73                                   ; $07FDD4 |
  LDA $FDEC,y                               ; $07FDD6 |
  STA $74                                   ; $07FDD9 |
  LDA $FDED,y                               ; $07FDDB |
  STA $71                                   ; $07FDDE |
  LDA $FDEE,y                               ; $07FDE0 |
  STA $72                                   ; $07FDE3 |
  LDA $FDEF,y                               ; $07FDE5 |
  STA $2A                                   ; $07FDE8 |
  RTS                                       ; $07FDEA |

  db $1F, $06, $47, $20, $07, $24, $06, $52 ; $07FDEB |
  db $20, $02, $23, $06, $5A, $20, $03, $1F ; $07FDF3 |
  db $06, $47, $20, $07, $1F, $06, $55, $20 ; $07FDFB |
  db $07, $24, $06, $B0, $21, $02, $1F, $06 ; $07FE03 |
  db $62, $20, $05                          ; $07FE0B |

  LDX $062C                                 ; $07FE0E |
  LDY #$00                                  ; $07FE11 |
code_07FE13:
  LDA #$34                                  ; $07FE13 |
  DEX                                       ; $07FE15 |
  BMI code_07FE1A                           ; $07FE16 |
  LDA #$37                                  ; $07FE18 |
code_07FE1A:
  STA $061F,y                               ; $07FE1A |
  INY                                       ; $07FE1D |
  CPY #$05                                  ; $07FE1E |
  BCC code_07FE13                           ; $07FE20 |
  LDY #$1E                                  ; $07FE22 |
  JMP code_07FDD1                           ; $07FE24 |

code_07FE27:
  CLC                                       ; $07FE27 |
  ADC $0101                                 ; $07FE28 |
  STA $0101                                 ; $07FE2B |
  LDA #$00                                  ; $07FE2E |
  ADC $0102                                 ; $07FE30 |
  STA $0102                                 ; $07FE33 |
  LDA #$00                                  ; $07FE36 |
  ADC $0103                                 ; $07FE38 |
  STA $0103                                 ; $07FE3B |
  SEC                                       ; $07FE3E |
  LDA $0101                                 ; $07FE3F |
  SBC #$80                                  ; $07FE42 |
  LDA $0102                                 ; $07FE44 |
  SBC #$96                                  ; $07FE47 |
  LDA $0103                                 ; $07FE49 |
  SBC #$98                                  ; $07FE4C |
  BCC code_07FE5F                           ; $07FE4E |
  LDA #$7F                                  ; $07FE50 |
  STA $0101                                 ; $07FE52 |
  LDA #$96                                  ; $07FE55 |
  STA $0102                                 ; $07FE57 |
  LDA #$98                                  ; $07FE5A |
  STA $0103                                 ; $07FE5C |
code_07FE5F:
  LDY #$00                                  ; $07FE5F |
  SEC                                       ; $07FE61 |
  PHP                                       ; $07FE62 |
code_07FE63:
  PLP                                       ; $07FE63 |
  LDA $0104,y                               ; $07FE64 |
  SBC $0101,y                               ; $07FE67 |
  PHP                                       ; $07FE6A |
  INY                                       ; $07FE6B |
  CPY #$03                                  ; $07FE6C |
  BCC code_07FE63                           ; $07FE6E |
  PLP                                       ; $07FE70 |
  BCS code_07FE7E                           ; $07FE71 |
  LDY #$02                                  ; $07FE73 |
code_07FE75:
  LDA $0101,y                               ; $07FE75 |
  STA $0104,y                               ; $07FE78 |
  DEY                                       ; $07FE7B |
  BPL code_07FE75                           ; $07FE7C |
code_07FE7E:
  RTS                                       ; $07FE7E |

code_07FE7F:
  INC $061E                                 ; $07FE7F |
  LDA #$63                                  ; $07FE82 |
  CMP $061E                                 ; $07FE84 |
  BCS code_07FE8C                           ; $07FE87 |
  STA $061E                                 ; $07FE89 |
code_07FE8C:
  RTS                                       ; $07FE8C |

  DEC $061E                                 ; $07FE8D |
  RTS                                       ; $07FE90 |

code_07FE91:
  JSR code_07FE97                           ; $07FE91 |
  JMP code_07C7F4                           ; $07FE94 |

code_07FE97:
  STA $51                                   ; $07FE97 |
  JSR code_07C800                           ; $07FE99 |
  JSR code_07FEE9                           ; $07FE9C |
  JMP code_07C898                           ; $07FE9F |

code_07FEA2:
  LDA $36                                   ; $07FEA2 |
  LSR                                       ; $07FEA4 |
  LSR                                       ; $07FEA5 |
  LSR                                       ; $07FEA6 |
  LSR                                       ; $07FEA7 |
  STA $59                                   ; $07FEA8 |
  LDA $38                                   ; $07FEAA |
  AND #$F0                                  ; $07FEAC |
  ORA $59                                   ; $07FEAE |
  STA $5B                                   ; $07FEB0 |
  LDA $38                                   ; $07FEB2 |
  LSR                                       ; $07FEB4 |
  LSR                                       ; $07FEB5 |
  LSR                                       ; $07FEB6 |
  LSR                                       ; $07FEB7 |
  STA $5A                                   ; $07FEB8 |
  DEC $5A                                   ; $07FEBA |
  DEC $5A                                   ; $07FEBC |
  LDA $37                                   ; $07FEBE |
  AND #$01                                  ; $07FEC0 |
  STA $56                                   ; $07FEC2 |
  TAY                                       ; $07FEC4 |
  CLC                                       ; $07FEC5 |
  LDA $FED4,y                               ; $07FEC6 |
  ADC $54                                   ; $07FEC9 |
  STA $0A                                   ; $07FECB |
  LDA #$00                                  ; $07FECD |
  ADC $55                                   ; $07FECF |
  STA $0B                                   ; $07FED1 |
  RTS                                       ; $07FED3 |

  db $00, $F0                               ; $07FED4 |

code_07FED6:
  JSR code_07C15F                           ; $07FED6 |
  JSR code_07C246                           ; $07FED9 |
  CPY #$06                                  ; $07FEDC |
  BCC code_07FEE8                           ; $07FEDE |
  LDX $0625                                 ; $07FEE0 |
  BNE code_07FEE8                           ; $07FEE3 |
  STA $0625                                 ; $07FEE5 |
code_07FEE8:
  RTS                                       ; $07FEE8 |

code_07FEE9:
  LDA $8E                                   ; $07FEE9 |
  PHA                                       ; $07FEEB |
  LDA #$12                                  ; $07FEEC |
  JSR code_07C8A9                           ; $07FEEE |
  JSR code_07C8F5                           ; $07FEF1 |
  JSR code_07C578                           ; $07FEF4 |
  JSR code_07CD73                           ; $07FEF7 |
  JSR code_07FFAA                           ; $07FEFA |
  LDY #$0F                                  ; $07FEFD |
  STY $80                                   ; $07FEFF |
code_07FF01:
  LDA $CC                                   ; $07FF01 |
  STA $36                                   ; $07FF03 |
  LDA $CD                                   ; $07FF05 |
  STA $37                                   ; $07FF07 |
  LDA #$04                                  ; $07FF09 |
  STA $1B                                   ; $07FF0B |
code_07FF0D:
  LDA #$00                                  ; $07FF0D |
  STA $75                                   ; $07FF0F |
  LDX #$08                                  ; $07FF11 |
  STX $7F                                   ; $07FF13 |
code_07FF15:
  JSR code_07FF43                           ; $07FF15 |
  CLC                                       ; $07FF18 |
  LDA $36                                   ; $07FF19 |
  ADC #$10                                  ; $07FF1B |
  STA $36                                   ; $07FF1D |
  LDA $37                                   ; $07FF1F |
  ADC #$00                                  ; $07FF21 |
  STA $37                                   ; $07FF23 |
  DEC $7F                                   ; $07FF25 |
  BNE code_07FF15                           ; $07FF27 |
  LDA $75                                   ; $07FF29 |
  STA $29                                   ; $07FF2B |
  JSR code_07C601                           ; $07FF2D |
  DEC $1B                                   ; $07FF30 |
  BNE code_07FF0D                           ; $07FF32 |
  CLC                                       ; $07FF34 |
  LDA $38                                   ; $07FF35 |
  ADC #$10                                  ; $07FF37 |
  STA $38                                   ; $07FF39 |
  DEC $80                                   ; $07FF3B |
  BNE code_07FF01                           ; $07FF3D |
  PLA                                       ; $07FF3F |
  JMP code_07C539                           ; $07FF40 |

code_07FF43:
  JSR code_07FEA2                           ; $07FF43 |
  LDY $5B                                   ; $07FF46 |
  LDA ($0A),y                               ; $07FF48 |
  STA $5E                                   ; $07FF4A |
  JMP code_07CF15                           ; $07FF4C |

code_07FF4F:
  STX $0D                                   ; $07FF4F |
  STA $0E                                   ; $07FF51 |
  LDX #$00                                  ; $07FF53 |
  BEQ code_07FF65                           ; $07FF55 |
code_07FF57:
  STX $0D                                   ; $07FF57 |
  STA $0E                                   ; $07FF59 |
code_07FF5B:
  LDX #$01                                  ; $07FF5B |
  BNE code_07FF65                           ; $07FF5D |
code_07FF5F:
  STX $0D                                   ; $07FF5F |
  STA $0E                                   ; $07FF61 |
code_07FF63:
  LDX #$02                                  ; $07FF63 |
code_07FF65:
  CLC                                       ; $07FF65 |
  LDA $0D                                   ; $07FF66 |
  ADC $CC                                   ; $07FF68 |
  STA $054B,x                               ; $07FF6A |
  LDA #$00                                  ; $07FF6D |
  ADC $CD                                   ; $07FF6F |
  STA $0543,x                               ; $07FF71 |
  LDA $0E                                   ; $07FF74 |
  STA $0563,x                               ; $07FF76 |
  LDA #$00                                  ; $07FF79 |
  STA $055B,x                               ; $07FF7B |
  STA $0553,x                               ; $07FF7E |
  STA $056B,x                               ; $07FF81 |
  RTS                                       ; $07FF84 |

code_07FF85:
  STX $0583                                 ; $07FF85 |
  STA $0593                                 ; $07FF88 |
  LDX #$00                                  ; $07FF8B |
  BEQ code_07FFA1                           ; $07FF8D |
code_07FF8F:
  STX $0584                                 ; $07FF8F |
  STA $0594                                 ; $07FF92 |
  LDX #$01                                  ; $07FF95 |
  BNE code_07FFA1                           ; $07FF97 |
code_07FF99:
  STX $0585                                 ; $07FF99 |
  STA $0595                                 ; $07FF9C |
  LDX #$02                                  ; $07FF9F |
code_07FFA1:
  LDA #$00                                  ; $07FFA1 |
  STA $058B,x                               ; $07FFA3 |
  STA $059B,x                               ; $07FFA6 |
  RTS                                       ; $07FFA9 |

code_07FFAA:
  LDA #$00                                  ; $07FFAA |
  STA $CC                                   ; $07FFAC |
  STA $CD                                   ; $07FFAE |
  STA $CE                                   ; $07FFB0 |
  STA $CF                                   ; $07FFB2 |
  STA $38                                   ; $07FFB4 |
  STA $39                                   ; $07FFB6 |
  JMP code_07D12D                           ; $07FFB8 |

  db $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFBB |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFC3 |
  db $FF, $FF, $FF, $FF, $FF                ; $07FFCB |

  SEI                                       ; $07FFD0 |
  INC $FFFF                                 ; $07FFD1 |
  NOP                                       ; $07FFD4 |
  JMP code_07C000                           ; $07FFD5 |

  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFD8 |
  db $44, $4F, $4E, $41, $4C, $44, $20, $4C ; $07FFE0 |
  db $41, $4E, $44, $20, $20, $20, $20, $20 ; $07FFE8 |
  db $1B, $A1, $5A, $20, $33, $04, $01, $10 ; $07FFF0 |
  db $C5, $79                               ; $07FFF8 |

  dw $C003                                  ; $07FFFA | NMI
  dw $FFD0                                  ; $07FFFC | RESET
  dw $C006                                  ; $07FFFE | IRQ
