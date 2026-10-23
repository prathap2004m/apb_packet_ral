`timescale 1ns/1ps
interface apb_if(input logic pclk, input logic presetn);
  logic        psel;
  logic        penable;
  logic        pwrite;
  logic [15:0] paddr;
  logic [31:0] pwdata;
  logic [31:0] prdata;
  logic        pready;
  logic        pslverr;
  logic        irq;

  clocking drv_cb @(posedge pclk);
    default input #1step output #1;
    output psel, penable, pwrite, paddr, pwdata;
    input  prdata, pready, pslverr;
  endclocking

  clocking mon_cb @(posedge pclk);
    default input #1step;
    input psel, penable, pwrite, paddr, pwdata, prdata, pready, pslverr;
  endclocking
endinterface
