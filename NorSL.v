//========================================================================
// Nor Switch-Level Model
//========================================================================

module NorSL
(
  input  a,
  input  b,
  output y
);

  // Setup power and ground

  supply1 vdd;
  supply0 gnd;

  // Instantiate pmos switches

  wire c;
  pmos( c, vdd, b );
  pmos( y, c,   a );

  // Instantiate nmos switches

  nmos( y, gnd, a );
  nmos( y, gnd, b );

endmodule

