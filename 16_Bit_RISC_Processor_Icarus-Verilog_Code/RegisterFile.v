`timescale 1ns / 1ps
// fpga4student.com 
// FPGA projects, VHDL projects, Verilog projects 
// Verilog code for RISC Processor 
// Verilog code for register file
module GPRs(
    input    clk,
    input    reset,
    // write port
    input    reg_write_en,
    input  [3:0] reg_write_dest,
    input  [15:0] reg_write_data,
    //read port 1
    input  [3:0] reg_read_addr_1,
    output  [15:0] reg_read_data_1,
    //read port 2
    input  [3:0] reg_read_addr_2,
    output  [15:0] reg_read_data_2
);
    reg [15:0] reg_array [0:7];
    integer i;

    wire[15:0] reg0;
    wire[15:0] reg1;
    wire[15:0] reg2;
    wire[15:0] reg3;
    wire[15:0] reg4;
    wire[15:0] reg5;
    wire[15:0] reg6;
    wire[15:0] reg7;
    assign reg0 = reg_array[0];
    assign reg1 = reg_array[1];
    assign reg2 = reg_array[2];
    assign reg3 = reg_array[3];
    assign reg4 = reg_array[4];
    assign reg5 = reg_array[5];
    assign reg6 = reg_array[6];
    assign reg7 = reg_array[7];

    // write port
    always @ (posedge clk or posedge reset) begin
        if(reset) begin
            for(i=0;i<8;i=i+1) begin
                reg_array[i] <= 16'd0;
            end
        end else if(reg_write_en) begin
            reg_array[reg_write_dest] <= reg_write_data;
        end
    end

    assign reg_read_data_1 = reg_array[reg_read_addr_1];
    assign reg_read_data_2 = reg_array[reg_read_addr_2];
endmodule