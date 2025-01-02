BITS 16
ORG 0x7C00

MOV SI, string
CLD
CALL printString
JMP $
printString:
    LODSB
    CMP AL, 0
    JZ .end
    MOV AH, 0x0E
    MOV BH, 0x00
    INT 0x10
    JMP printString
.end:
    RET
string db 'Hello world!', 0
TIMES 510 - ($ - $$) db 0
DW 0xAA55