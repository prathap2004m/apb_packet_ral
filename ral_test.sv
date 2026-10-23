class pkt_ral_test extends pkt_base_test;
  `uvm_component_utils(pkt_ral_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task body();
    uvm_reg_hw_reset_seq  rseq = uvm_reg_hw_reset_seq::type_id::create("rseq");
    uvm_reg_bit_bash_seq  bseq = uvm_reg_bit_bash_seq::type_id::create("bseq");
    uvm_status_e          st;
    uvm_reg               skip[];

    rseq.model = env.regmodel;
    rseq.start(env.agent.sqr);

    skip = new[11];
    skip[0]  = env.regmodel.switch_status;
    skip[1]  = env.regmodel.switch_ctrl;
    skip[2]  = env.regmodel.gen_ctrl;
    skip[3]  = env.regmodel.gen_pkt_cfg;
    skip[4]  = env.regmodel.irq_status;
    skip[5]  = env.regmodel.irq_force;
    skip[6]  = env.regmodel.err_status;
    skip[7]  = env.regmodel.err_inject;
    skip[8]  = env.regmodel.lock;
    skip[9]  = env.regmodel.soft_reset;
    skip[10] = env.regmodel.gen_status;
    foreach (skip[i])
      uvm_resource_db#(bit)::set({"REG::", skip[i].get_full_name()}, "NO_REG_BIT_BASH_TEST", 1, this);

    env.regmodel.lock.write(st, 32'hA5A5C3C3);

    bseq.model = env.regmodel;
    bseq.start(env.agent.sqr);
  endtask
endclass

class pkt_len1_test extends pkt_base_test;
  `uvm_component_utils(pkt_len1_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task body();
    pkt_len1_seq s = pkt_len1_seq::type_id::create("s");
    s.regmodel = env.regmodel;
    s.start(env.agent.sqr);
  endtask
endclass