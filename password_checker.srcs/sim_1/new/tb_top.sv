`timescale 1ns / 1ps

module tb_top();

    logic clk;
    logic rst;
    logic en;
    logic [7:0] data_in;
    logic [7:0] data_read;
    logic [7:0] consonants;
    logic [7:0] vowels;
    logic check;

    top dut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .data_in(data_in),
        .data_read(data_read),
        .consonants(consonants),
        .vowels(vowels),
        .check(check)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        en = 0;
        data_in = 8'h00;

        #20 rst = 0;
        #10;

        
        en = 1; data_in = "a"; #10;
        en = 1; data_in = "b"; #10;
        en = 1; data_in = "c"; #10;
        en = 1; data_in = "d"; #10;
        en = 1; data_in = "e"; #10;
        en = 1; data_in = "f"; #10;
        en = 0; #20;

        
        en = 1; data_in = "a"; #10;
        en = 1; data_in = "n"; #10;
        en = 1; data_in = "d"; #10;
        en = 1; data_in = "r"; #10;
        en = 1; data_in = "e"; #10;
        en = 0; 
        
        #4800; 
        
        $finish;
    end

endmodule