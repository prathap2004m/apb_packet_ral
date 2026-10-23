class apb_reg_adapter extends uvm_reg_adapter;
  `uvm_object_utils(apb_reg_adapter)

  function new(string name = "apb_reg_adapter");
    super.new(name);
    supports_byte_enable = 0;
    provides_responses   = 0;
  endfunction

  virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    apb_seq_item t = apb_seq_item::type_id::create("t");
    t.pwrite = (rw.kind == UVM_WRITE);
    t.paddr  = rw.addr[15:0];
    t.pwdata = rw.data[31:0];
    return t;
  endfunction

  virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    apb_seq_item t;
    if (!$cast(t, bus_item))
      `uvm_fatal("ADAPTER", "bus_item is not apb_seq_item")
    rw.kind   = t.pwrite ? UVM_WRITE : UVM_READ;
    rw.addr   = t.paddr;
    rw.data   = t.pwrite ? t.pwdata : t.prdata;
    rw.status = t.pslverr ? UVM_NOT_OK : UVM_IS_OK;
  endfunction
endclass
