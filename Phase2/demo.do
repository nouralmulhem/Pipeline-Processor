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
#vlog ALUControl.v
vlog ALU.v
vlog EM_Buffer.v
vlog BranchLogic.v
vlog FU.v
vlog FU_integration.v

# Memory
vlog MemoryStage.v
vlog Memory.v
vlog MW_Buffer.v
vlog StackPointer.v
vlog PushPopLogic.v

# Write Back
vlog WriteBack.v

# Processor
vlog Processor.v
vlog Processor_TB.v

vsim Processor_TB

add wave *
add wave -position end sim:/Processor_TB/ProcessorModule/*
add wave -position 35 sim:/Processor_TB/ProcessorModule/DecodeModule/*
add wave -position end sim:/Processor_TB/ProcessorModule/MemoryModule/PushPopLogicModule/SP
add wave -position 3 sim:/Processor_TB/ProcessorModule/FetchModule/*
add wave -position end sim:/Processor_TB/ProcessorModule/ExecuteModule/*

#add wave -position end sim:/Processor_TB/ProcessorModule/DecodeModule/ControlUnitModule/*
#add wave -position end  /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory
#add wave -position 0 sim:/Processor_TB/ProcessorModule/FetchModule/*
add wave -position end sim:/Processor_TB/ProcessorModule/WriteBackModul/*
add wave -position 54 sim:/Processor_TB/ProcessorModule/MemoryModule/*

# Clocks
#clk1
force -freeze sim:/Processor_TB/clk1 1 0 -cancel 1
force -freeze sim:/Processor_TB/clk1 0 1, 1 {6 ps} -r 10
#clk2
force -freeze sim:/Processor_TB/clk2 0 0, 1 {5 ps} -r 10

#-------------------------------------------------TestCase15--------------------------------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase15/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase15/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 0000000000000101 0
run 15

#input port
force -freeze sim:/Processor_TB/inputPort 0000000000011001 0
run 15

#input port
force -freeze sim:/Processor_TB/inputPort 1111111111111111 0
run 10

#input port
force -freeze sim:/Processor_TB/inputPort 1111001100100000 0
run 1000

# Export Data Memory Results
mem save -o ./TestCases/TestCase15/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase15/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory
