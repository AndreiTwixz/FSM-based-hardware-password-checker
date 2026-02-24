`timescale 1ns / 1ps

module pass_check_fsm(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [7:0] data_in,
    output logic pass_ok
);

    typedef enum logic [2:0] {S0, S1, S2, S3, S4} state_t;
    state_t state, next_state;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else if (en)
            state <= next_state;
    end

    always_comb begin
        next_state = state;
        case (state)
            S0: if (data_in == 8'h61) next_state = S1; else next_state = S0; // a
            S1: if (data_in == 8'h6E) next_state = S2; else if (data_in == 8'h61) next_state = S1; else next_state = S0; // n
            S2: if (data_in == 8'h64) next_state = S3; else if (data_in == 8'h61) next_state = S1; else next_state = S0; // d
            S3: if (data_in == 8'h72) next_state = S4; else if (data_in == 8'h61) next_state = S1; else next_state = S0; // r
            S4: if (data_in == 8'h65) next_state = S0; else if (data_in == 8'h61) next_state = S1; else next_state = S0; // e
            default: next_state = S0;
        endcase
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            pass_ok <= 1'b0;
        else if (en && state == S4 && data_in == 8'h65)
            pass_ok <= 1'b1;
        else
            pass_ok <= 1'b0;
    end

endmodule