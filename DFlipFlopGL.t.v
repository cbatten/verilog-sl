//========================================================================
// DFF Gate-Level Test Harness
//========================================================================

`include "DFlipFlopGL.v"

module top;

  reg clk = 1;
  always #5 clk = ~clk;

  reg  d;
  wire q;

  DFlipFlopGL dff_gate
  (
    .clk (clk),
    .d   (d),
    .q   (q)
  );

  initial begin

    $display( "DFF GL Verilog Test" );

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



