class pkt_base_test extends uvm_test;
  `uvm_component_utils(pkt_base_test)

  pkt_env        env;
  virtual apb_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = pkt_env::type_id::create("env", this);
    if (!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "apb_if not found in config_db")
  endfunction

  virtual task body();
  endtask

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    wait (vif.presetn === 1'b1);
    repeat (5) @(posedge vif.pclk);
    body();
    repeat (10) @(posedge vif.pclk);
    phase.drop_objection(this);
  endtask
endclass
