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

# Procedssor
vlog Processor.v
vlog Processor_TB.v

vsim Processor_TB

add wave *
add wave -position end sim:/Processor_TB/ProcessorModule/ExecuteModule/ALUModule/flag
add wave -position end sim:/Processor_TB/ProcessorModule/MemoryModule/PushPopLogicModule/SP

# Clocks
#clk1
force -freeze sim:/Processor_TB/clk1 1 0 -cancel 2
force -freeze sim:/Processor_TB/clk1 0 1, 1 {6 ps} -r 10
#clk2
force -freeze sim:/Processor_TB/clk2 0 0, 1 {5 ps} -r 10

#fetch Reset
force -freeze sim:/Processor_TB/fetchReset 1 0 -cancel 2
force -freeze sim:/Processor_TB/fetchReset 0 2

# read initial Code Memory
mem load -i {./TestCases/TestCase1/codeMemory.mem} /Processor_TB/ProcessorModule/FetchModule/instMemory/memory

# read initial Data Memory
mem load -i {./TestCases/TestCase1/dataMemory.mem} /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

run 1000

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

run 1000

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

run 1000

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

run 1000

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
run 1000

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
run 1000

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
run 1000

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
run 1000

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
run 1000

# Export Data Memory Results
mem save -o ./TestCases/TestCase11/dataMemoryOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/MemoryModule/memory_inst/memory

#Export RegFile
mem save -o ./TestCases/TestCase11/RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /Processor_TB/ProcessorModule/DecodeModule/RegFileModule/memory