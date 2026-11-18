vlib work
vcom -93 -work work ../../src/edge_sync.vhd
vcom -93 -work work ../../src/generic_add_sub.vhd
vcom -93 -work work ../../src/seven_seg_disp.vhd
vcom -93 -work work ../../src/sync_to_three.vhd
vcom -93 -work work ../../src/components.vhd
vcom -93 -work work ../../src/frazier_add_sub.vhd
vcom -93 -work work ../src/adder_sub_tb.vhd
vsim -voptargs=+acc -msgmode both adder_sub_tb
do wave.do
run 3000 ns