#=========================================================================
# Makefile for SL modeling
#=========================================================================
# Simple makefile to compile and run various GL and SL models using both
# iverilog and verilator.

models = \
  NorGL \
  NorSL \
  DFlipFlopGL \

# default

default : all
.PHONY : default

# iverilog

models_iverilog_exes = $(patsubst %, %-iverilog, $(models))
models_iverilog_outs = $(patsubst %, %-iverilog.out, $(models))

$(models_iverilog_exes) : %-iverilog : %.t.v %.v
	iverilog -o $@ $<

$(models_iverilog_outs) : %.out : %
	./$< | tee $@

junk += $(models_iverilog_exes) $(models_iverilog_outs)
outs += $(models_iverilog_outs)

# verilator

models_verilator_exes = $(patsubst %, %-verilator, $(models))
models_verilator_outs = $(patsubst %, %-verilator.out, $(models))

$(models_verilator_exes) : %-verilator : %.t.cc %.v
	verilator -Wall --trace --cc --exe $*.t.cc --Mdir $* $*.v
	make -C $*/ -f V$*.mk V$*

$(models_verilator_outs) : %-verilator.out : %-verilator
	$*/V$* | tee $@

junk += $(models_verilator_exes) $(models_verilator_outs) $(models)
outs += $(models_verilator_outs)

# check

check : $(outs)
	cat $(outs)

.PHONY : check

# clean

clean :
	rm -rf *~ \#* *.vcd $(junk)

.PHONY : clean

# all

all : $(outs)

.PHONY : all

