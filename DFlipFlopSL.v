
module DFlipFlopSL
(
  input  clk,
  input  d,
  output q
);

  // Setup power and ground

  supply1 vdd;
  supply0 gnd;

  // Clock inverter

  wire clk_bar;
  pmos( clk_bar, vdd, clk );
  nmos( clk_bar, gnd, clk );

  // Input inverter

  wire n0;
  pmos( n0, vdd, d );
  nmos( n0, gnd, d );

  // Master latch fwd Tgate

  wire n1;
  pmos( n1, n0, clk     );
  nmos( n1, n0, clk_bar );

  // Master latch fwd inverter

  wire n2;
  pmos( n2, vdd, n1 );
  nmos( n2, gnd, n1 );

  // Master latch feedback inverter

  wire n3;
  pmos( n3, vdd, n2 );
  nmos( n3, gnd, n2 );

  // Master latch feedback Tgate

  pmos( n1, n3, clk_bar );
  nmos( n1, n3, clk     );

  // Slave latch fwd Tgate

  wire n4;
  pmos( n4, n2, clk_bar );
  nmos( n4, n2, clk     );

  // Slave latch fwd inverter

  wire n5;
  pmos( n5, vdd, n4 );
  nmos( n5, gnd, n4 );

  // Slave latch feedback inverter

  wire n6;
  pmos( n6, vdd, n5 );
  nmos( n6, gnd, n5 );

  // Slave latch feedback Tgate

  pmos( n4, n6, clk     );
  nmos( n4, n6, clk_bar );

  // Output inverter

  pmos( q, vdd, n5 );
  nmos( q, gnd, n5 );

endmodule

