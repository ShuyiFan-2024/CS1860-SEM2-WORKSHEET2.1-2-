//Initialize R2 and R3
@R2       //Tell the CPU that it will access RAM[2]
M=0      //R2=0, suppose x is negative
@R3      //Access RAM[3]
M=0      //R3=0, suppose that the absolute value of x can be calculated

//Read X and check if it is negative
@R0            //Access RAM[0]
D=M             //D=R0(x)
@NEGATIVE       //Jump to the destination
D;JLT           //Jump condition, if x<0, jump to NEGATIVE

//Handle the case where X is a positive number
(POSITIVE)     //Label
@R0           //Access RAM[0]
D=M           //D=R0=x
@R1           //Access RAM[1]
M=D           //R1=x
@END          //Jump to the destination
0;JMP         //unconditional jump         

//Handle the case where X is a negative number
(NEGATIVE)    //Label
@R2         //Access RAM[2]
M=1         //R2=1, it indicates that x is negative
@R0         //access RAM[0]
D=M         //D=R0=x, read x
@MIN_VALUE   //Jump to the destination
D;JEQ        //Jump condition, if x==-32768, jump to MIN_VALUE

//Calculate the absolute value x (when x is negative)
D=!D        //Take the opposite
D=D+1       //and then add one
@R1         //Access RAM[1]
M=D       //R1=-x
@END        //Jump to the destination
0;JMP       //Unconditional jump

//Handling special cases: x==-32768
(MIN_VALUE)     //Label
@R3         //Access RAM[3]
M=1        //R3=1, it indicates that the absolute value x is out of range
@R1         //Access RAM[1]
M=0        //R1=0, since the absolute value x cannot be expressed

(END)      //Label
@END       //Jump to the destination
0;JMP      //Unconditional jump