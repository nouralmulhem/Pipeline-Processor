vlog RegFile.v
vlog RegFile_TB.v

vsim RegFile_TB
# read initial Memory
mem load -i {./RegFileInit.mem} -format mti /RegFile_TB/RegFileModule/memory

add wave *
run

# export Memory result
mem save -o RegFileOut.mem -f mti -data symbolic -addr decimal -wordsperline 1 /RegFile_TB/RegFileModule/memory