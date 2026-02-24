`timescale 1ns / 1ps

module reg_6b(
    input logic clk,
    input logic rst,
    input logic [5:0] in,
    output logic [5:0] out
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            out <= 6'b000000;
        else
            out <= in;
    end

endmodule