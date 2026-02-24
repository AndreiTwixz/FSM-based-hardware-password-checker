`timescale 1ns / 1ps

module vowel_checker_struct(
    input logic [7:0] data_in,
    output logic is_vowel
);

    logic is_a, is_e, is_i, is_o, is_u;

    assign is_a = ~data_in[7] &  data_in[6] &  data_in[5] & ~data_in[4] & ~data_in[3] & ~data_in[2] & ~data_in[1] &  data_in[0];
    assign is_e = ~data_in[7] &  data_in[6] &  data_in[5] & ~data_in[4] & ~data_in[3] &  data_in[2] & ~data_in[1] &  data_in[0];
    assign is_i = ~data_in[7] &  data_in[6] &  data_in[5] & ~data_in[4] &  data_in[3] & ~data_in[2] & ~data_in[1] &  data_in[0];
    assign is_o = ~data_in[7] &  data_in[6] &  data_in[5] & ~data_in[4] &  data_in[3] &  data_in[2] &  data_in[1] &  data_in[0];
    assign is_u = ~data_in[7] &  data_in[6] &  data_in[5] &  data_in[4] & ~data_in[3] &  data_in[2] & ~data_in[1] &  data_in[0];

    assign is_vowel = is_a | is_e | is_i | is_o | is_u;

endmodule