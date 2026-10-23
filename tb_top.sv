`timescale 1ns/1ps
`include "uvm_macros.svh"
`include "apb_if.sv"
import uvm_pkg::*;
`include "apb_seq_item.sv"
`include "apb_sequencer.sv"
`include "apb_driver.sv"
`include "apb_monitor.sv"
`include "apb_agent.sv"
`include "pkt_regs.sv"
`include "pkt_reg_block.sv"
`include "adapter.sv"
`include "env.sv"
`include "pkt_sequence.sv"
`include "base_test.sv"
`include "ral_test.sv"
//`include "len1_test.sv"

module tb;
  logic pclk;
  logic presetn;

  initial pclk = 1'b0;
  always #5 pclk = ~pclk;

  initial begin
    presetn = 1'b0;
    #100;
    presetn = 1'b1;
  end

  apb_if aif(.pclk(pclk), .presetn(presetn));

  apb_pkt_switch dut (
    .pclk    (pclk),
    .presetn (presetn),
    .psel    (aif.psel),
    .penable (aif.penable),
    .pwrite  (aif.pwrite),
    .paddr   (aif.paddr),
    .pwdata  (aif.pwdata),
    .prdata  (aif.prdata),
    .pready  (aif.pready),
    .pslverr (aif.pslverr),
    .irq     (aif.irq)
  );

  initial begin
    uvm_config_db#(virtual apb_if)::set(null, "*", "vif", aif);
    run_test();
  end
endmodule
