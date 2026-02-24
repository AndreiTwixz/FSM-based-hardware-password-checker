`timescale 1ns / 1ps

module counter_6b(
    input logic clk,
    input logic rst,
    input logic en,
    output logic [5:0] out
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            out <= 6'b000000;
        else if (en)
            out <= out + 1;
    end

endmodule