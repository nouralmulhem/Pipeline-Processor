module WriteBack (controlSignalsIn, writeDataIn, writeAddressIn, regWrite, writeDataOut, writeAddressOut, outputPort);

    input [2:0] controlSignalsIn;
    input [15:0] writeDataIn;
    input [2:0] writeAddressIn;

    output regWrite;
    output [15:0] writeDataOut;
    output [2:0] writeAddressOut; 
    output [15:0] outputPort;

    assign regWrite = controlSignalsIn[0];
    assign writeDataOut = writeDataIn;
    assign writeAddressOut = writeAddressIn;

    // output port
    assign outputPort = (controlSignalsIn[1] == 1'b1) ? writeDataIn : {16{1'bz}};


endmodule