# Create a primary clock on the port named 'clk' with a frequency of 50 MHz
create_clock -name clk -period 20.0 [get_ports clk]
 
derive_pll_clocks

set_clock_uncertainty -setup -from clk 0.5
set_clock_uncertainty -hold -from clk 0.2
derive_clock_uncertainty -add