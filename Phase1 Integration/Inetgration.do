# Fetch
vlog Fetch.v
vlog MemoInst.v
vlog FD_Buffer.v

# Decode
vlog Decode.v
vlog Controle_Signal.v
vlog DE_Buffer.v

# Processor
vlog Processor.v

vsim Processor
# read initial Code Memory
mem load -i {./codeMemory.mem} /Processor/FetchModule/instMemory/memory

add wave *
run