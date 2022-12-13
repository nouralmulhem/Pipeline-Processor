module WriteBack (controlSignalsIn, writeDataIn, writeAddressIn, regWrite, writeDataOut, writeAddressOut);

    input [2:0] controlSignalsIn;
    input [15:0] writeDataIn;
    input [2:0] writeAddressIn;

    output regWrite;
    output [15:0] writeDataOut;
    output [2:0] writeAddressOut; 

    assign regWrite = controlSignalsIn[0];
    assign writeDataOut = writeDataIn;
    assign writeAddressOut = writeAddressIn;


endmodule