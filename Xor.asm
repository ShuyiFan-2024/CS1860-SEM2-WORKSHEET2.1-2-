// let R0=x, R1=y, the result is stored in R2
// step1: compute x or y
@R0            //Tell the CPU that it will access RAM[0]
D=M            //D=R0(x)    
@R1            //Access RAM[1]
D=D|M         //D=R0 or R1 (x or y)  
@R3           //the address of the R3 temporary variable,R3=x or y
M=D           //R3=x or y
//step2: compute x and y
@R0           //Access RAM[0]
D=M          //D=R0
@R1           //Access RAM[1]
D=D&M         //R0 and R1(x and y)
@R4           //Access RAM[4]
M=D           //R4=x and y
//step3: compute not(x and y)
@R4          //Access RAM[4]
D=M          //D=R4
D=!D        //D= not(x and y)
@R4          //Access RAM[4]
M=D          //R4= not(x and y)
//step4: compute (x or y) and not(x and y)
@R3         //Access RAM[3]
D=M         //D=R3
@R4         //Access RAM[4]
D=D&M       //D=R3 and R4 (which equal to: (x or y) and not(x and y))
@R2         //Access RAM[2]
M=D         //R2=(x or y) and not(x and y)