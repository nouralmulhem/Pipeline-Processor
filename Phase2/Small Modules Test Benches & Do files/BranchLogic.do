#o/p branch 00101011010
vlog BranchLogic.v
vlog BranchLogic_TB.v

vsim BranchLogic_TB

add wave BranchLogic_TB/branch_out BranchLogic_TB/branch BranchLogic_TB/sel BranchLogic_TB/zf BranchLogic_TB/cf BranchLogic_TB/nf

run