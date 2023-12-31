#Buffer
vlog Buffer.v

# Fetch
vlog HDU.v
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

vlog HosnyCallMachine.v
vlog HosnyRetMachine.v
vlog BlackBox.v

# Memory
vlog MemoryStage.v
vlog Memory.v
vlog MW_Buffer.v
vlog StackPointer.v
vlog PushPopLogic.v

# Write Back
vlog WriteBack.v

# Procedssor
vlog Processor.v
vlog Processor_TB.v

vsim Processor_TB

add wave *
add wave -position end sim:/Processor_TB/ProcessorModule/ExecuteModule/ALUModule/flag
add wave -position end sim:/Processor_TB/ProcessorModule/MemoryModule/PushPopLogicModule/SP
add wave -position end  /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory
add wave -position end  sim:/Processor_TB/ProcessorModule/PC
# add wave -position end sim:/Processor_TB/ProcessorModule/DecodeModule/ControlUnitModule/*
# add wave -position end  /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory
# add wave -position end sim:/Processor_TB/ProcessorModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/FetchModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/FD_BufferModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/DecodeModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/DecodeBufferModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/DE_BufferModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/FUModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/ExecuteModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/EM_BufferModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/MemoryModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/MW_BufferModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/HDUModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/HosnyCallModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/HosnyRetModule/*
# add wave -position end sim:/Processor_TB/ProcessorModule/BlackBoxModule/*



# Clocks
#clk1
force -freeze sim:/Processor_TB/clk1 1 0 -cancel 2
force -freeze sim:/Processor_TB/clk1 0 1, 1 {6 ps} -r 10
#clk2
force -freeze sim:/Processor_TB/clk2 0 0, 1 {5 ps} -r 10

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

#interrupt
force -freeze sim:/Processor_TB/interrupt 0 0

# read initial Code Memory
mem load -i {./TestCases/TestCase1/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase1/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

run 750

# Export Data Memory Results
mem save -o ./TestCases/TestCase1/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase1/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#-------------------------------------------------TestCase2----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase2/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase2/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

run 1000

# Export Data Memory Results
mem save -o ./TestCases/TestCase2/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase2/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#-------------------------------------------------TestCase3----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase3/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase3/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

run 1000

# Export Data Memory Results
mem save -o ./TestCases/TestCase3/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase3/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory


#-------------------------------------------------TestCase4----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase4/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase4/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

run 500

# Export Data Memory Results
mem save -o ./TestCases/TestCase4/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase4/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory



#-------------------------------------------------TestCase5----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase5/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase5/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

run 500

# Export Data Memory Results
mem save -o ./TestCases/TestCase5/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase5/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#-------------------------------------------------TestCase6----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase6/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase6/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

run 500

# Export Data Memory Results
mem save -o ./TestCases/TestCase6/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase6/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#-------------------------------------------------TestCase7----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase7/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase7/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 500

# Export Data Memory Results
mem save -o ./TestCases/TestCase7/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase7/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory


#-------------------------------------------------TestCase8----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase8/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase8/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 750

# Export Data Memory Results
mem save -o ./TestCases/TestCase8/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase8/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory


#-------------------------------------------------TestCase9----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase9/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase9/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 750

# Export Data Memory Results
mem save -o ./TestCases/TestCase9/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase9/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#-------------------------------------------------TestCase10----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase10/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase10/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 500

# Export Data Memory Results
mem save -o ./TestCases/TestCase10/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase10/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#-------------------------------------------------TestCase11----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase11/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase11/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 500

# Export Data Memory Results
mem save -o ./TestCases/TestCase11/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase11/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory


#-------------------------------------------------TestCase12----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase12/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase12/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 500

# Export Data Memory Results
mem save -o ./TestCases/TestCase12/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase12/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory


#-------------------------------------------------TestCase13----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase13/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase13/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 500

# Export Data Memory Results
mem save -o ./TestCases/TestCase13/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase13/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory


#-------------------------------------------------TestCase14----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase14/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase14/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 500

# Export Data Memory Results
mem save -o ./TestCases/TestCase14/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase14/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory



#-------------------------------------------------TestCase15----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase15/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase15/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 500

# Export Data Memory Results
mem save -o ./TestCases/TestCase15/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase15/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory



#-------------------------------------------------TestCase16----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase16/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase16/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 500

# Export Data Memory Results
mem save -o ./TestCases/TestCase16/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase16/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory


#-------------------------------------------------TestCase17----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase17/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase17/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 50

#interrupt
force -freeze sim:/Processor_TB/interrupt 1 0 -cancel 7
force -freeze sim:/Processor_TB/interrupt 0 7
run 100


# Export Data Memory Results
mem save -o ./TestCases/TestCase17/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase17/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#-------------------------------------------------TestCase18--------------------------------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase18/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase18/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory
run 1000

# Export Data Memory Results
mem save -o ./TestCases/TestCase18/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase18/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory


#-------------------------------------------------TestCase19----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase19/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase19/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 1010101010101010 0
run 700

# Export Data Memory Results
mem save -o ./TestCases/TestCase19/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase19/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory


#-------------------------------------------------TestCase20----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase20/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase20/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory


#input port
force -freeze sim:/Processor_TB/inputPort 1111111111110000 0
run 1000

# Export Data Memory Results
mem save -o ./TestCases/TestCase20/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase20/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#-------------------------------------------------TestCase21----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase21/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase21/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory


#input port
force -freeze sim:/Processor_TB/inputPort 1111111111110000 0
run 1000

# Export Data Memory Results
mem save -o ./TestCases/TestCase21/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase21/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#-------------------------------------------------TestCase22--------------------------------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase22/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase22/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

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
mem save -o ./TestCases/TestCase22/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase22/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory


#-------------------------------------------------TestCase23----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase23/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase23/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 0000000000011001 0
run 15

#input port
force -freeze sim:/Processor_TB/inputPort 0000000000001111 0
run 15

#input port
force -freeze sim:/Processor_TB/inputPort 1111001100100000 0
run 700

# Export Data Memory Results
mem save -o ./TestCases/TestCase23/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase23/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory


#-------------------------------------------------TestCase24----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase24/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase24/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 0000000000000101 0
run 700

# Export Data Memory Results
mem save -o ./TestCases/TestCase24/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase24/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory

#-------------------------------------------------TestCase25----------------------------------------------------
# read initial Code Memory

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

mem load -i {./TestCases/TestCase25/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase25/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#input port
force -freeze sim:/Processor_TB/inputPort 0000001100000000 0
run 15


#input port
force -freeze sim:/Processor_TB/inputPort 0000000001000000 0
run 15

#input port
force -freeze sim:/Processor_TB/inputPort 0000010100000000 0
run 15

#input port
force -freeze sim:/Processor_TB/inputPort 0000000100000000 0
run 15

#input port
force -freeze sim:/Processor_TB/inputPort 0000011111111111 0
run 1000

# Export Data Memory Results
mem save -o ./TestCases/TestCase25/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase25/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory
