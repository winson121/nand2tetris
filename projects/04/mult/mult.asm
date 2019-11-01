// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// pseudocode
// R2 = 0
// multiplier = R1
// if R1 == 0:
// go to (end)
// if R0 == 0:
// go to (end)
// if R1 <= 0:
//     while R1 < 0:
//         R2 = R2 - R0
//         multiplier = multiplier-1
// else:
//     while R1 > 0:
//         R2 = R2 + R0
//         multiplier = multiplier -1
// (end)
// R2 = R0 x R1
    @R2
    M=0        // set R2=0

    @R1
    D=M
    @multiplier
    M=D        // set multiplier = R1

    @R1
    D=M
    @end
    D;JEQ      // if R1 == 0: go to end

    @R0
    D=M
    @end
    D;JEQ      // if R1 == 0: go to end

    @loopsub
    D;JLT     // if R1 < 0: go to loopsub

    // else
(loopadd)  // while R1 > 0
    @R0
    D=M
    @R2
    M=M+D      // R2 = R2 + R0
    @multiplier
    MD=M-1      // multiplier = multiplier - 1
    @loopadd
    D;JGT

    @end
    0;JMP
(loopsub)   // while R1 < 0
    @R0
    D=M
    @R2
    M=M-D      // R2 = R2 - R0
    @multiplier
    MD=M+1      // multiplier = multiplier + 1
    @loopsub
    D;JLT

(end)
    @end
    0;JMP