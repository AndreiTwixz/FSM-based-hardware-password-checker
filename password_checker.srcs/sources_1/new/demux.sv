`timescale 1ns / 1ps

module demux(
    input logic [7:0] in,
    input logic sel,
    output logic [7:0] out0,
    output logic [7:0] out1
);

    assign out0 = (~sel) ? in : 8'b00000000;
    assign out1 = (sel) ? in : 8'b00000000;

endmodule