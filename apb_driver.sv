class apb_driver extends uvm_driver#(apb_seq_item);
  `uvm_component_utils(apb_driver)

  virtual apb_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "apb_if not found in config_db")
  endfunction

  task run_phase(uvm_phase phase);
    vif.drv_cb.psel    <= 1'b0;
    vif.drv_cb.penable <= 1'b0;
    vif.drv_cb.pwrite  <= 1'b0;
    vif.drv_cb.paddr   <= 16'h0;
    vif.drv_cb.pwdata  <= 32'h0;
    forever begin
      seq_item_port.get_next_item(req);
      drive(req);
      seq_item_port.item_done();
    end
  endtask

  task drive(apb_seq_item t);
    @(vif.drv_cb);
    vif.drv_cb.psel    <= 1'b1;
    vif.drv_cb.penable <= 1'b0;
    vif.drv_cb.pwrite  <= t.pwrite;
    vif.drv_cb.paddr   <= t.paddr;
    vif.drv_cb.pwdata  <= t.pwdata;
    @(vif.drv_cb);
    vif.drv_cb.penable <= 1'b1;
    @(vif.drv_cb);
    while (!vif.drv_cb.pready) @(vif.drv_cb);
    t.prdata  = vif.drv_cb.prdata;
    t.pslverr = vif.drv_cb.pslverr;
    vif.drv_cb.psel    <= 1'b0;
    vif.drv_cb.penable <= 1'b0;
  endtask
endclass
