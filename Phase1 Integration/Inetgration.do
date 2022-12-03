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

# Memory
vlog MemoryStage.v
vlog Memory.v
vlog MW_Buffer.v

# Write Back
vlog WriteBack.v

# Processor
vlog Processor.v
vlog Processor_TB.v

vsim Processor_TB

add wave *
add wave -position end  /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

# Clocks
#clk1
force -freeze sim:/Processor_TB/clk1 1 0 -cancel 1
force -freeze sim:/Processor_TB/clk1 0 1, 1 {6 ps} -r 10
#clk2
force -freeze sim:/Processor_TB/clk2 0 0, 1 {5 ps} -r 10

# read initial Code Memory
mem load -i {./TestCase1/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCase1/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

# read initial Register File
mem load -i {./TestCase1/RegFile.mem} -format mti /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2
run 1000

# Export Data Memory Results
mem save -o ./TestCase1/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCase1/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#-------------------------------------------------TestCase2----------------------------------------------------
# read initial Code Memory
mem load -i {./TestCase2/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCase2/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

# read initial Register File
mem load -i {./TestCase2/RegFile.mem} -format mti /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2
run 1000

# Export Data Memory Results
mem save -o ./TestCase2/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCase2/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

