GHDL=ghdl
WAVE=gtkwave
FLAGS=--std=08

all:
	$(GHDL) -a $(FLAGS) sevenseg_test.vhd sevenseg.vhd
	$(GHDL) -e $(FLAGS) sevenseg_test

wave:
	$(GHDL) -r $(FLAGS) sevenseg_test --wave=sevenseg_test.ghw --stop-time=1us
	$(WAVE) sevenseg_test.gtkw
