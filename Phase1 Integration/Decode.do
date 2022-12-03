vlog Decode.v
vlog Decode_TB.v
vlog Controle_Signal.v
vlog RegFile.v

vsim Decode_TB

# read initial Register File
mem load -i {./RegFile.mem} -format mti /Decode_TB/DecodeModule/RegFileModule/memory


add wave *
run