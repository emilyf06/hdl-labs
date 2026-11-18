onerror {resume}
radix define States {
    "7'b1000000" "0" -color "red",
    "7'b1111001" "1" -color "red",
    "7'b0100100" "2" -color "red",
    "7'b0110000" "3" -color "red",
    "7'b0011001" "4" -color "red",
    "7'b0010010" "5" -color "red",
    "7'b0000010" "6" -color "red",
    "7'b1111000" "7" -color "red",
    "7'b0000000" "8" -color "red",
    "7'b0011000" "9" -color "red",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /adder_sub_tb/uut/clk
add wave -noupdate /adder_sub_tb/uut/reset
add wave -noupdate -radix unsigned /adder_sub_tb/uut/a
add wave -noupdate -radix unsigned /adder_sub_tb/uut/a_sync
add wave -noupdate -radix unsigned /adder_sub_tb/uut/b_sync
add wave -noupdate -radix unsigned /adder_sub_tb/uut/b
add wave -noupdate -radix unsigned /adder_sub_tb/uut/result
add wave -noupdate -radix unsigned /adder_sub_tb/uut/result_sig
add wave -noupdate -color Yellow /adder_sub_tb/uut/add_btn
add wave -noupdate -color Yellow /adder_sub_tb/uut/add_en
add wave -noupdate -color Yellow /adder_sub_tb/uut/sub_btn
add wave -noupdate -color Yellow /adder_sub_tb/uut/sub_en
add wave -noupdate -radix States /adder_sub_tb/uut/a_bcd
add wave -noupdate -radix States /adder_sub_tb/uut/b_bcd
add wave -noupdate -radix States /adder_sub_tb/uut/result_bcd
add wave -noupdate -group a_bcd /adder_sub_tb/uut/a_lcd/binary_input
add wave -noupdate -group a_bcd /adder_sub_tb/uut/a_lcd/HEX0
add wave -noupdate -group b_bcd /adder_sub_tb/uut/b_lcd/binary_input
add wave -noupdate -group b_bcd /adder_sub_tb/uut/b_lcd/HEX0
add wave -noupdate -group result_bcd /adder_sub_tb/uut/result_lcd/binary_input
add wave -noupdate -group result_bcd /adder_sub_tb/uut/result_lcd/HEX0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2897 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 133
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {3055 ns}
