`timescale 1ns / 1ps

//fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog code for 16-bit RISC processor
// ALU_Control Verilog code

module alu_control(
  output reg [4:0] ALU_Cnt,
  input [1:0] ALUOp,
  input [3:0] Opcode
);

  wire [5:0] ALUControlIn;
  assign ALUControlIn = {ALUOp, Opcode};

  always @(ALUControlIn) begin
    case (ALUControlIn)
      6'b10xxxx: ALU_Cnt = 4'b0000;
      6'b01xxxx: ALU_Cnt = 4'b0001;
      6'b000010: ALU_Cnt = 4'b0000;
      6'b000011: ALU_Cnt = 4'b0001;
      6'b000100: ALU_Cnt = 4'b0010;
      6'b000101: ALU_Cnt = 4'b0011;
      6'b000110: ALU_Cnt = 4'b0100;
      6'b000111: ALU_Cnt = 4'b0101;
      6'b001000: ALU_Cnt = 4'b0110;
      6'b001001: ALU_Cnt = 4'b0111;
      6'b001010: ALU_Cnt = 4'b1000; //added instruction
      default: ALU_Cnt = 4'b0000;
    endcase
  end

endmodule