/*
   CS/ECE 552, Fall '22
   homework #3, Problem #1
  
   This module creates a 1-bit D-flipflop (DFF).

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
module dff (
            // Output
            q,
            // Inputs
            d, clk, rst
            );

    output         q;
    input          d;
    input          clk;
    input          rst;

    reg            state;

    assign #1 q = state;

    always @(posedge clk) begin
      state = rst? 1'b0 : d;
    end

endmodule
