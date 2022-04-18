ghdl -a ../Fuentes/NCO.vhd ../Fuentes/mem_seno.vhd ../Fuentes/att.vhd ../Fuentes/RCF.vhd ../Fuentes/NCO_tb.vhd
ghdl -s ../Fuentes/NCO.vhd ../Fuentes/mem_seno.vhd ../Fuentes/att.vhd ../Fuentes/RCF.vhd ../Fuentes/NCO_tb.vhd
ghdl -e NCO_tb
ghdl -r NCO_tb --vcd=NCO_tb.vcd --stop-time=40000ns
gtkwave NCO_tb.vcd
