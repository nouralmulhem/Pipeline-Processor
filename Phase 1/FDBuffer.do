#o/p out 0000....    1111......   1010...........    1011............  at only postive edges of the clk
vlog FD_Buffer.v
vlog FD_Buffer_TB.v

vsim FD_Buffer_TB

add wave FD_Buffer_TB/clk FD_Buffer_TB/in FD_Buffer_TB/out

run