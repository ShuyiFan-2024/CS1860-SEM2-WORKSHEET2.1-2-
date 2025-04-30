//Initialize R2 and R3
@R2
M=0      //R2=0, suppose x is negative
@R3
M=0      //R3=0, suppose that the absolute value of x can be calculated

//Read X and check if it is negative
@R0
D=M             //D=R0(x)
@NEGATIVE
D;JLT           //if x<0, jump to NEGATIVE

//Handle the case where X is a positive number
(POSITIVE)
@R0
D=M           //D=R0=x
@R1
M=D           //R1=x
@END
0;JMP         //unconditional jump         

//Handle the case where X is a negative number
(NEGATIVE)
@R2
M=1         //R2=1, it indicates that x is negative
@R0
D=M         //D=R0=x, raad x
@MIN_VALUE
D;JEQ        //if x==-32768, jump to MIN_VALUE

//Calculate the absolute value x (when x is negative)
D=!D
D=D+1
@R1
M=D       //R1=-x
@END
0;JMP

//Handling special cases: x==-32768
(MIN_VALUE)
@R3
M=1        //R3=1, it indicates that the absolute value x is out of range
@R1
M=0        //R1=0, since the absolute value x cannot be expressed

(END)
@END
0;JMP