vlog Fetch.v
vlog MemoInst.v
vlog Fetch_TB.v

vsim Fetch_TB
# read initial Code Memory
mem load -i {D:/Pipeline-Processor/Phase 1/codeMemory.mem} /Fetch_TB/FetchModule/instMemory/memory

add wave *
#run