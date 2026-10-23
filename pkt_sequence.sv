class pkt_base_seq extends uvm_sequence#(apb_seq_item);
  `uvm_object_utils(pkt_base_seq)

  pkt_reg_block regmodel;

  function new(string name = "pkt_base_seq");
    super.new(name);
  endfunction

  task wr(uvm_reg r, bit [31:0] v);
    uvm_status_e st;
    r.write(st, v);
    if (st != UVM_IS_OK) begin
      `uvm_error("PKT_SEQ", $sformatf("write to %s failed", r.get_name()))
    end
  endtask

  task rd(uvm_reg r, output bit [31:0] v);
    uvm_status_e   st;
    uvm_reg_data_t d;
    r.read(st, d);
    if (st != UVM_IS_OK) begin
      `uvm_error("PKT_SEQ", $sformatf("read from %s failed", r.get_name()))
    end
    v = d[31:0];
  endtask

  function void chk(string what, bit [31:0] got, bit [31:0] exp);
    if (got !== exp) begin
      `uvm_error("PKT_CHK", $sformatf("%s: got 0x%08h expected 0x%08h", what, got, exp))
    end else begin
      `uvm_info("PKT_CHK", $sformatf("%s: ok 0x%08h", what, got), UVM_LOW)
    end
  endfunction

  task unlock();
    wr(regmodel.lock, 32'hA5A5C3C3);
  endtask

  task wait_done();
    bit [31:0] v;
    repeat (500) begin
      rd(regmodel.gen_status, v);
      if (v[1]) return;
    end
    `uvm_error("PKT_SEQ", "generator did not reach DONE")
  endtask
endclass

class pkt_lock_seq extends pkt_base_seq;
  `uvm_object_utils(pkt_lock_seq)

  function new(string name = "pkt_lock_seq");
    super.new(name);
  endfunction

  task body();
    bit [31:0] v;
    rd(regmodel.lock, v);
    chk("LOCK after reset", v, 32'h1);
    wr(regmodel.port_enable, 32'h5);
    rd(regmodel.port_enable, v);
    chk("PORT_ENABLE write ignored while locked", v, 32'hF);
    unlock();
    rd(regmodel.lock, v);
    chk("LOCK after key", v, 32'h0);
    wr(regmodel.port_enable, 32'h5);
    rd(regmodel.port_enable, v);
    chk("PORT_ENABLE write accepted when unlocked", v, 32'h5);
    wr(regmodel.lock, 32'h00001234);
    rd(regmodel.lock, v);
    chk("LOCK after wrong key", v, 32'h1);
    wr(regmodel.port_enable, 32'h3);
    rd(regmodel.port_enable, v);
    chk("PORT_ENABLE write ignored after relock", v, 32'h5);
    wr(regmodel.soft_reset, 32'h1);
    rd(regmodel.port_enable, v);
    chk("PORT_ENABLE after soft reset", v, 32'hF);
    rd(regmodel.lock, v);
    chk("LOCK after soft reset", v, 32'h1);
  endtask
endclass

class pkt_traffic_seq extends pkt_base_seq;
  `uvm_object_utils(pkt_traffic_seq)

  function new(string name = "pkt_traffic_seq");
    super.new(name);
  endfunction

  task body();
    bit [31:0] v;
    unlock();
    wr(regmodel.port_enable, 32'h0000000F);
    wr(regmodel.fwd_enable,  32'h0000000F);
    wr(regmodel.switch_ctrl, 32'h00000009);
    wr(regmodel.gen_pkt_cfg, 32'h00100401);
    wr(regmodel.gen_interval, 32'h00000002);
    wr(regmodel.gen_count,   32'h00000004);
    wr(regmodel.irq_enable,  32'h00000041);
    wr(regmodel.gen_ctrl,    32'h00000003);
    wait_done();
    rd(regmodel.stat_rx, v);
    chk("STAT_RX", v, 32'h4);
    rd(regmodel.stat_tx, v);
    chk("STAT_TX", v, 32'h4);
    rd(regmodel.stat_drop, v);
    chk("STAT_DROP", v, 32'h0);
    rd(regmodel.irq_status, v);
    chk("IRQ_STATUS GEN_DONE and START_ACK", v & 32'h41, 32'h41);
    rd(regmodel.err_status, v);
    chk("ERR_STATUS", v, 32'h0);
    rd(regmodel.err_count, v);
    chk("ERR_COUNT", v, 32'h0);
    wr(regmodel.irq_status, 32'h00000041);
    rd(regmodel.irq_status, v);
    chk("IRQ_STATUS after W1C", v & 32'h41, 32'h0);
  endtask
endclass

class pkt_drop_seq extends pkt_base_seq;
  `uvm_object_utils(pkt_drop_seq)

  function new(string name = "pkt_drop_seq");
    super.new(name);
  endfunction

  task body();
    bit [31:0] v;
    wr(regmodel.switch_ctrl, 32'h0000000B);
    wr(regmodel.irq_status,  32'h000000FF);
    wr(regmodel.err_status,  32'h000000FF);
    wr(regmodel.fwd_enable,  32'h00000001);
    wr(regmodel.gen_ctrl,    32'h00000003);
    wait_done();
    rd(regmodel.stat_rx, v);
    chk("STAT_RX after drop run", v, 32'h0);
    rd(regmodel.stat_tx, v);
    chk("STAT_TX after drop run", v, 32'h0);
    rd(regmodel.stat_drop, v);
    chk("STAT_DROP after drop run", v, 32'h4);
    rd(regmodel.err_status, v);
    chk("ERR_STATUS DEST_ERROR", v, 32'h2);
    rd(regmodel.err_count, v);
    chk("ERR_COUNT after drop run", v, 32'h4);
    rd(regmodel.irq_status, v);
    chk("IRQ_STATUS PACKET_DROPPED", v & 32'h8, 32'h8);
  endtask
endclass

class pkt_err_seq extends pkt_base_seq;
  `uvm_object_utils(pkt_err_seq)

  function new(string name = "pkt_err_seq");
    super.new(name);
  endfunction

  task body();
    bit [31:0] v;
    wr(regmodel.err_inject, 32'h80000000);
    rd(regmodel.err_count, v);
    chk("ERR_COUNT after clear", v, 32'h0);
    rd(regmodel.err_info, v);
    chk("ERR_INFO after clear", v, 32'h0);
    wr(regmodel.err_status, 32'h000000FF);
    wr(regmodel.err_inject, 32'h00000040);
    rd(regmodel.err_status, v);
    chk("ERR_STATUS LENGTH_ERROR and INJECTED", v, 32'hC0);
    rd(regmodel.err_count, v);
    chk("ERR_COUNT after one injection", v, 32'h1);
    rd(regmodel.err_info, v);
    chk("ERR_INFO source, dest and code", v & 32'h0003FFFF, 32'h00010106);
    wr(regmodel.err_inject, 32'h00000006);
    rd(regmodel.err_count, v);
    chk("ERR_COUNT after two more bits", v, 32'h3);
    wr(regmodel.err_enable, 32'h00000002);
    rd(regmodel.irq_status, v);
    chk("IRQ_STATUS ERROR promoted", v & 32'h2, 32'h2);
    wr(regmodel.err_status, 32'h000000FF);
    wr(regmodel.irq_status, 32'h000000FF);
    rd(regmodel.irq_status, v);
    chk("IRQ_STATUS ERROR cleared", v & 32'h2, 32'h0);
  endtask
endclass

class pkt_bad_addr_seq extends uvm_sequence#(apb_seq_item);
  `uvm_object_utils(pkt_bad_addr_seq)

  function new(string name = "pkt_bad_addr_seq");
    super.new(name);
  endfunction

  task body();
    bit [15:0] addrs [3] = '{16'h0002, 16'h0064, 16'h1000};
    for (int i = 0; i < 3; i++) begin
      for (int w = 0; w < 2; w++) begin
        apb_seq_item t = apb_seq_item::type_id::create("t");
        t.paddr  = addrs[i];
        t.pwrite = w;
        t.pwdata = 32'hFFFFFFFF;
        start_item(t);
        finish_item(t);
        if (t.pslverr !== 1'b1) begin
          `uvm_error("PKT_CHK", $sformatf("no pslverr for addr 0x%04h write=%0d", addrs[i], w))
        end
        if (!w && t.prdata !== 32'h0) begin
          `uvm_error("PKT_CHK", $sformatf("prdata not zero for addr 0x%04h", addrs[i]))
        end
      end
    end
  endtask
endclass

class pkt_len1_seq extends pkt_base_seq;
  `uvm_object_utils(pkt_len1_seq)

  function new(string name = "pkt_len1_seq");
    super.new(name);
  endfunction

  task body();
    bit [31:0] rx, drop, errc;
    wr(regmodel.soft_reset, 32'h1);
    unlock();
    wr(regmodel.port_enable, 32'h0000000F);
    wr(regmodel.fwd_enable,  32'h0000000F);
    wr(regmodel.switch_ctrl, 32'h00000009);
    wr(regmodel.gen_pkt_cfg, 32'h00100101);
    wr(regmodel.gen_interval, 32'h00000000);
    wr(regmodel.gen_count,   32'h00000028);
    wr(regmodel.gen_ctrl,    32'h00000003);
    wait_done();
    rd(regmodel.stat_rx, rx);
    rd(regmodel.stat_drop, drop);
    rd(regmodel.err_count, errc);
    `uvm_info("LEN1", $sformatf("rx=%0d drop=%0d err_count=%0d", rx, drop, errc), UVM_LOW)
    chk("STAT_DROP equals overflow count", drop, errc);
  endtask
endclass