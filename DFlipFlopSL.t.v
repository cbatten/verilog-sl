//========================================================================
// DFF Switch-Level Test Harness
//========================================================================

`include "DFlipFlopSL.v"

module top;

  reg clk = 1;
  always #5 clk = ~clk;

  reg  d;
  wire q;

  DFlipFlopSL dff_gate
  (
    .clk (clk),
    .d   (d),
    .q   (q)
  );

  initial begin

    $display( "DFF SL Verilog Test" );
    $dumpfile("DFlipFlopSL.vcd");
    $dumpvars;

    #21;

    d = 0;
    #1;
    $display( " %x    = %x", d, q );
    #9;

    d = 1;
    #1;
    $display( " %x    = %x", d, q );
    #9;

    d = 0;
    #1;
    $display( " %x    = %x", d, q );
    #9;

    d = 0;
    #1;
    $display( " %x    = %x", d, q );
    #9;

    d = 1;
    #1;
    $display( " %x    = %x", d, q );
    #9;

    d = 1;
    #1;
    $display( " %x    = %x", d, q );
    #9;

    d = 0;
    #1;
    $display( " %x    = %x", d, q );
    #9;

    $finish(1);

  end

endmodule



