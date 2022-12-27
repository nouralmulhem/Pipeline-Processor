vlog StackPointer.v
vlog PushPopLogic.v
#vlog PushPopLogic_TB.v

vsim PushPopLogic

add wave *

#force -freeze sim:/StackPointer/clk 1 0, 0 {5 ps} -r 10
#force -freeze sim:/StackPointer/reset 0 0
#force -freeze sim:/StackPointer/addressIn 32'd2000 0
#force -freeze sim:/StackPointer/stackOp 0 0
#force -freeze sim:/StackPointer/stackOp 1 0
#run
#force -freeze sim:/StackPointer/stackOp 0 0
#force -freeze sim:/StackPointer/addressIn 32'd2001 0
#run
#force -freeze sim:/StackPointer/reset 1 0
#run
#force -freeze sim:/StackPointer/stackOp 1 0
#run