`timescale 1ns / 1ps

module ram_64x8b(
    input logic clk,
    input logic w_en,
    input logic [5:0] addr,
    input logic [7:0] w_data,
    output logic [7:0] r_data
);

    logic [7:0] mem [0:63];

    always_ff @(posedge clk) begin
        if (w_en) begin
            mem[addr] <= w_data;
        end
    end

    assign r_data = mem[addr];

endmodule