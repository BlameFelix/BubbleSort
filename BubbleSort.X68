*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
ARRAY:
    DC.L 1,2,3,4,5
    
    ORG    $1100
START:                  ; first instruction of program
    LEA ARRAY,A0
    MOVEA.L A0,A1
    ADDA.L #4,A1
    JMP SORT
    
    ORG    $1200
SORT:
    MOVE #5,D2
    MOVE #4,D3
   
LOOP:
    SUB.L #1,D2
    MOVE.L (A0),D0
    MOVE.L (A1),D1
    CMP.L D0,D1
    BGT CHNG
    CMP #0,D2
    BNE LOOP
BACK:
    MOVE.L D0, -(A7)
    MOVE.L D1, -(A7)
    MOVE.L D0,D1
    MOVE.L #3,D0
    TRAP #15
    MOVE.L (A7)+,D1
    MOVE.L (A7)+,D0
    CMP #0,D3
    BEQ END
    MOVE.L #5,D2
    LEA ARRAY,A0
    MOVEA.L A0,A1
    ADDA.L #4,A1
    SUB.L #1, D3
    JMP LOOP
JMPB:
    ADDA.L #4,A0
    ADDA.L #4,A1
    JMP LOOP
CHNG:
    MOVE.L D0, (A1)
    MOVE.L D1, (A0)
    JMP JMPB
    
END:
    NOP
* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
