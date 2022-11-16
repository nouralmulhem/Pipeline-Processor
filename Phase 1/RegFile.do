#o/p branch 00101011010
vlog RegFile.v
vlog RegFile_TB.v

vsim RegFile_TB

add wave RegFile_TB/branch_out

run