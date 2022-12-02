vlog Fetch.v
vlog MemoInst.v

vsim Fetch
# read initial Code Memory
mem load -i {D:/Pipeline-Processor/Phase 1/codeMemory.mem} /Fetch_TB/FetchModule/instMemory/memory

add wave *

force -freeze sim:/Fetch/clk 1 0, 0 {5 ps} -r 10
force -freeze sim:/Fetch/branch 0 0
force -freeze sim:/Fetch/reset 1 0
run

