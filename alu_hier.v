/*
    CS/ECE 552 FALL '22
    Homework #2, Problem 3

    A wrapper for a multi-bit ALU module combined with clkrst.
*/
module alu_hier(InA, InB, Cin, Oper, invA, invB, sign, ALUout,BTRout,seq,slt,sle,sco,beqz,bnez,bltz,bgez);

    // declare constant for size of inputs, outputs, and operations
    parameter OPERAND_WIDTH = 16;    
    parameter NUM_OPERATIONS = 3;
       
    input  [OPERAND_WIDTH -1:0] InA ; // Input operand A
    input  [OPERAND_WIDTH -1:0] InB ; // Input operand B
    input                       Cin ; // Carry in
    input  [NUM_OPERATIONS-1:0] Oper; // Operation type
    input                       invA; // Signal to invert A
    input                       invB; // Signal to invert B
    input                       sign; // Signal for signed operation
    output [OPERAND_WIDTH -1:0] ALUout,BTRout; // Result of computation
    //output                      Zero; // Signal if Out is 0
    //output                      Ofl ; // Signal if overflow occured
    output                      seq,slt,sle,sco; // Signal if Out is 0
    output                      beqz,bnez,bltz,bgez; // Signal if Out is 0

    // clkrst signals
    wire clk;
    wire rst;
    wire err;

    assign err = 1'b0;
    alu #(.OPERAND_WIDTH(OPERAND_WIDTH),
          .NUM_OPERATIONS(NUM_OPERATIONS)) 
        DUT (// Outputs
             .ALUout(ALUout),.BTRout(BTRout),.seq(seq),.slt(slt),.sle(sle),.sco(sco),.beqz(beqz),.bnez(bnez),.bltz(bltz),.bgez(bgez),
             //.Ofl(Ofl), 
             //.Zero(Zero),
             // Inputs
             .InA(InA), 
             .InB(InB), 
             .Cin(Cin), 
             .Oper(Oper), 
             .invA(invA), 
             .invB(invB), 
             .sign(sign));
   
    clkrst c0(// Outputs
              .clk                       (clk),
              .rst                       (rst),
              // Inputs
              .err                       (err)
              );

endmodule // alu_hier
