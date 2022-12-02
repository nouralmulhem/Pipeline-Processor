vlog MemoInst.v
vlog MemoInst_tb.v

vsim MemoInst_tb
# read initial Memory
mem load -i {./MemoInit.mem} -format mti /MemoInst_tb/mem/memory

add wave *
run