// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// Index = SCREEN
// busWidth = 16
// screenregistry = 8192
// screenlastindex = Index + screenregistry - 1
// (LOOP)
//  if keyboard not pressed:
//      go to (UNFILL)
//      if screen is unfilled: go to (LOOP)
//      remove fill
//      go to (LOOP)
//  else:
//      go to (FILL)
//      if screen is filled: go to (LOOP)
//      fill screen
//      go to (LOOP)

    @SCREEN
    D=A
    @Index
    M=D     // Index=SCREEN

    // @16
    // D=A
    // @busWidth
    // M=D    // busWidth = 16

    @8192
    D=A
    @screenregistry
    M=D  // screenregistry = 8192

    @SCREEN
    D=A
    @screenlastindex
    M=D
    @screenregistry
    D=M-1
    @screenlastindex
    M=M+D   // screenlastindex = Index + screenregistry - 1

(LOOP)
    @KBD
    D=M
    @UNFILL
    D;JEQ   // if keyboard not pressed: go to UNFILL

(FILL)
    @Index
    D=M
    @screenlastindex
    D=M-D
    @LOOP
    D;JLT   // if screen is filled: go to (LOOP)
    // fill screen
    (NEXTINDEX)
    @Index
    A=M
    M=-1

    @Index
    MD=M+1   

    @screenlastindex
    D=M-D
    @NEXTINDEX
    D;JGT   

    @FILL
    0;JMP

(UNFILL)
    @Index
    D=M
    @SCREEN
    D=A-D
    @LOOP
    D;JGT   // if screen is unfilled: go to (LOOP)
    //unfill screen
    (PREVIOUSINDEX)
    @Index
    MD=M-1

    @Index
    A=M
    M=0

    @SCREEN
    D=A-D
    @PREVIOUSINDEX
    D;JLT

    @UNFILL
    0;JMP
