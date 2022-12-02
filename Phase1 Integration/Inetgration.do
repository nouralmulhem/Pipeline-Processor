#Buffer
vlog Buffer.v

# Fetch
vlog Fetch.v
vlog MemoInst.v
vlog FD_Buffer.v

# Decode
vlog Decode.v
vlog Controle_Signal.v
vlog DE_Buffer.v

# Execute
vlog Execute.v
vlog ALUControl.v
vlog ALU.v
vlog EM_Buffer.v

# Processor
vlog Processor.v

vsim Processor
# read initial Code Memory
mem load -i {./codeMemory.mem} /Processor/FetchModule/instMemory/memory

# read initial Register File
mem load -i {./RegFile.mem} -format mti /Processor/DecodeModule/RegFileModule/memory

add wave *
run