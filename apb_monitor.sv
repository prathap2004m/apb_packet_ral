class apb_monitor extends uvm_monitor;
  `uvm_component_utils(apb_monitor)

  virtual apb_if vif;
  uvm_analysis_port#(apb_seq_item) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ap = new("ap", this);
    if (!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "apb_if not found in config_db")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      apb_seq_item t;
      @(vif.mon_cb);
      if (vif.mon_cb.psel && vif.mon_cb.penable && vif.mon_cb.pready) begin
        t = apb_seq_item::type_id::create("mon_item");
        t.paddr   = vif.mon_cb.paddr;
        t.pwrite  = vif.mon_cb.pwrite;
        t.pwdata  = vif.mon_cb.pwdata;
        t.prdata  = vif.mon_cb.prdata;
        t.pslverr = vif.mon_cb.pslverr;
        ap.write(t);
      end
    end
  endtask
endclass
