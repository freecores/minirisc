/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Mini-RISC-1                                                ////
////  Synchrounous Program Memory                                ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          russelmann@hotmail.com                             ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000 Rudolf Usselmann                         ////
////                    russelmann@hotmail.com                   ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
//// THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY        ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT           ////
//// LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND   ////
//// FITNESS FOR A PARTICULAR PURPOSE.                           ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps

// For simulation only
// May be off or on chip

module prog_mem ( clk, address, we, din, dout );

input		clk;
input [10:0]	address;
input		we;
input [11:0]	din;
output [11:0]	dout;

parameter depth = 2048;

reg [10:0]	addr_r;
reg [11:0]	mem[0:depth-1];

always @(posedge clk)
   addr_r <= address;
   
assign dout = mem[addr_r];

always @(posedge clk)
   if (we) mem[address] <= din;

endmodule
