`timescale 1ns / 1ps

module top(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [7:0] data_in,
    output logic [7:0] data_read,
    output logic [7:0] consonants,
    output logic [7:0] vowels,
    output logic check
);

    logic [5:0] count_val;
    logic [5:0] addr_val;
    logic is_vowel;
    logic w_en_cons;
    logic w_en_vowels;

    counter_6b inst_counter (
        .clk(clk),
        .rst(rst),
        .en(en),
        .out(count_val)
    );

    reg_6b inst_reg (
        .clk(clk),
        .rst(rst),
        .in(count_val),
        .out(addr_val)
    );

    vowel_checker_struct inst_vowel_check (
        .data_in(data_in),
        .is_vowel(is_vowel)
    );

    assign w_en_cons = en & ~is_vowel;
    assign w_en_vowels = en & is_vowel;

    ram_64x8b ram_consonants (
        .clk(clk),
        .w_en(w_en_cons),
        .addr(addr_val),
        .w_data(data_in),
        .r_data(data_read)
    );

    ram_64x8b ram_vowels (
        .clk(clk),
        .w_en(w_en_vowels),
        .addr(addr_val),
        .w_data(data_in),
        .r_data()
    );

    demux inst_demux (
        .in(data_in),
        .sel(is_vowel),
        .out0(consonants),
        .out1(vowels)
    );

    pass_check_fsm inst_fsm (
        .clk(clk),
        .rst(rst),
        .en(en),
        .data_in(data_in),
        .pass_ok(check)
    );

endmodule