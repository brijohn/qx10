`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Brian Johnson
//
// Create Date:    23:09:14 04/30/2022
// Design Name:
// Module Name:    MemoryController
// Project Name:   QX-10/16 1MB Memory Expansion Card
// Target Devices: Altera MAX 7160S
// Tool versions:
// Description:
//   This controller handles external memory banking for the QX-10/16 computer.
//     It provides 8 banking registers F0-F7 each of which represents 8k in the
//     64k address space. The 8th bit of each register controlls if that bank is
//     is active or not, while the lowest 7 bits act as a pointer to a 8k page of
//     memory in the 1MB of onboard sram.
//
// Dependencies:
//
// Revision:
// Revision 1.0 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module MemoryController(
    input clk,
    input [15:0] addr,
    input [7:0] data,
    input nbsak,
    input nmemx,
    input niwr,
    input nmwr,
    input nmrd,
    input nrst,
    output [18:0] memaddr,
    output nce1,
    output nce2,
    output nmemwr,
    output nmemrd,
    output nmemrq
    );

  reg [7:0] banks[7:0];

  wire memrq;
  wire iowr;
  wire [2:0] adr_mux;
  wire [7:0] bank;

  assign nmemwr = (!(nbsak && !nmemx) || nmwr);
  assign nmemrd = (!(nbsak && !nmemx) || nmrd);
  assign memrq = !(nmemwr && nmemrd);
  assign nmemrq = !memrq;

  assign iowr = !(!(nbsak && addr[7] && addr[6] && addr[5] && addr[4] && !addr[3]) || niwr);
  assign adr_mux = iowr ? addr[2:0] : addr[15:13];
  assign bank = banks[adr_mux];


  assign memaddr = {bank[5:0], addr[12:0]};
  assign nce1 = !(memrq && bank[7] && !bank[6]);
  assign nce2 = !(memrq && bank[7] && bank[6]);

  //always @(iowr or data or adr_mux or nrst)
  always @(posedge clk or negedge nrst)
  begin
    if (!nrst) begin
      banks[0] = 0;
      banks[1] = 0;
      banks[2] = 0;
      banks[3] = 0;
      banks[4] = 0;
      banks[5] = 0;
      banks[6] = 0;
      banks[7] = 0;
    end else if (iowr) begin
      banks[adr_mux] = data;
    end
  end

endmodule
