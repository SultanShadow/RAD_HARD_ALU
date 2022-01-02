set_units -time ns
create_clock [get_ports CLK]  -name CLK  -period 20


set_clock_transition -max  2 [get_clocks {CLK}]
set_clock_transition -min  1 [get_clocks {CLK}]

set_input_delay -clock [get_clocks CLK] 2 A
set_input_delay -clock [get_clocks CLK] 2 B
set_input_delay -clock [get_clocks CLK] 2 RST

set_output_delay -clock [get_clocks CLK] 4 [get_ports Sum ]
set_output_delay -clock [get_clocks CLK] 4 Cout

set_input_transition -max 1 A
set_input_transition -max 1 B
set_input_transition -max 1 RST


