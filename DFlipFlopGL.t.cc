//========================================================================
// DFF Gate-Level Test Harness
//========================================================================

#include "VDFlipFlopGL.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main( int argc, char* argv[] )
{
  Verilated::commandArgs(argc,argv);

  // init top verilog instance

  VDFlipFlopGL* top = new VDFlipFlopGL;

  // init trace dump

  Verilated::traceEverOn(true);
  VerilatedVcdC* tfp = new VerilatedVcdC;

  top->trace(tfp, 99);
  tfp->open("VDFlipFlopGL.vcd");

  // initialize simulation inputs

  printf( "DFF GL Verilator Test\n" );

  int main_time = 0;

  top->clk  = 1;
  main_time += 5;
  tfp->dump(main_time);

  top->clk  = 0;
  main_time += 5;
  tfp->dump(main_time);

  top->clk  = 1;
  main_time += 5;
  tfp->dump(main_time);

  top->clk  = 0;
  main_time += 5;
  tfp->dump(main_time);

  // TODO: need to actually tick the clock to have a hope of
  // making this work!

  top->d   = 0;
  top->eval();
  tfp->dump(main_time);
  main_time += 1;
  printf( " %x:   = %x\n", top->d, top->q );
  main_time += 9;

  top->d   = 1;
  top->eval();
  tfp->dump(main_time);
  main_time += 1;
  printf( " %x:   = %x\n", top->d, top->q );
  main_time += 9;

  top->d   = 0;
  top->eval();
  tfp->dump(main_time);
  main_time += 1;
  printf( " %x:   = %x\n", top->d, top->q );
  main_time += 9;

  top->d   = 0;
  top->eval();
  tfp->dump(main_time);
  main_time += 1;
  printf( " %x:   = %x\n", top->d, top->q );
  main_time += 9;

  top->d   = 1;
  top->eval();
  tfp->dump(main_time);
  main_time += 1;
  printf( " %x:   = %x\n", top->d, top->q );
  main_time += 9;

  top->d   = 1;
  top->eval();
  tfp->dump(main_time);
  main_time += 1;
  printf( " %x:   = %x\n", top->d, top->q );
  main_time += 9;

  top->d   = 0;
  top->eval();
  tfp->dump(main_time);
  main_time += 1;
  printf( " %x:   = %x\n", top->d, top->q );
  main_time += 9;

  tfp->close();
  exit(0);
}

