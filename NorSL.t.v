//========================================================================
// Nor Switch-Level Test Harness
//========================================================================

`include "NorSL.v"

module top;

  reg  a;
  reg  b;
  wire y;

  NorSL nor_gate
  (
    .a (a),
    .b (b),
    .y (y)
  );

  initial begin

    $display( "Nor SL Verilog Test" );

    #20;

    #1;
    a = 0;
    b = 0;
    #9;
    $display( " %x:%x = %x", a, b, y );

    #1;
    a = 0;
    b = 1;
    #9;
    $display( " %x:%x = %x", a, b, y );

    #1;
    a = 1;
    b = 0;
    #9;
    $display( " %x:%x = %x", a, b, y );

    #1;
    a = 1;
    b = 1;
    #9;
    $display( " %x:%x = %x", a, b, y );

  end

endmodule



