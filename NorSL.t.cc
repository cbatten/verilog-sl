//========================================================================
// Nor Switch-Level Test Harness
//========================================================================

#include "VNorSL.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main( int argc, char* argv[] )
{
  Verilated::commandArgs(argc,argv);

  // init top verilog instance

  VNorSL* top = new VNorSL;

  // init trace dump

  Verilated::traceEverOn(true);
  VerilatedVcdC* tfp = new VerilatedVcdC;

  top->trace(tfp, 99);
  tfp->open("NorSL.vcd");

  // initialize simulation inputs

  printf( "Nor SL Verilator Test\n" );

  int main_time = 20;

  main_time += 1;
  top->a   = 0;
  top->b   = 0;

  top->eval();
  tfp->dump(main_time);
  main_time += 9;
  printf( " %x:%x = %x\n", top->a, top->b, top->y );

  main_time += 1;
  top->a   = 0;
  top->b   = 1;

  top->eval();
  tfp->dump(main_time);
  main_time += 9;
  printf( " %x:%x = %x\n", top->a, top->b, top->y );

  main_time += 1;
  top->a   = 1;
  top->b   = 0;

  top->eval();
  tfp->dump(main_time);
  main_time += 9;
  printf( " %x:%x = %x\n", top->a, top->b, top->y );

  main_time += 1;
  top->a   = 1;
  top->b   = 1;

  top->eval();
  tfp->dump(main_time);
  main_time += 9;
  printf( " %x:%x = %x\n", top->a, top->b, top->y );

  tfp->close();
  exit(0);
}

