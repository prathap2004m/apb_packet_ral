class pkt_reg_block extends uvm_reg_block;
`uvm_object_utils(pkt_reg_block)

rand DEVICE_ID device_id;
rand VERSION version;
rand SWITCH_STATUS switch_status;
rand PORT_STATUS port_status;
rand GEN_STATUS gen_status;
rand STAT_RX stat_rx;
rand STAT_TX stat_tx;
rand STAT_DROP stat_drop;
rand SWITCH_CTRL switch_ctrl;
rand PORT_ENABLE port_enable;
rand FWD_ENABLE fwd_enable;
rand GEN_CTRL gen_ctrl;
rand GEN_PKT_CFG gen_pkt_cfg;
rand GEN_INTERVAL gen_interval;
rand GEN_COUNT gen_count;
rand IRQ_STATUS irq_status;
rand IRQ_ENABLE irq_enable;
rand IRQ_FORCE irq_force;
rand ERR_STATUS err_status;
rand ERR_ENABLE err_enable;
rand ERR_INJECT err_inject;
rand ERR_COUNT err_count;
rand ERR_INFO err_info;
rand LOCK lock;
rand SOFT_RESET soft_reset;
uvm_reg_map apb_map;

function new(string name="pkt_reg_block");
	super.new(name,UVM_NO_COVERAGE);
endfunction

function void build();
	apb_map=create_map("apb_map",'h0,4,UVM_LITTLE_ENDIAN);

	device_id=DEVICE_ID::type_id::create("device_id");
	device_id.configure(this,null,"");
	device_id.build();
	apb_map.add_reg(device_id,'h00,"RO");

	version=VERSION::type_id::create("version");
	version.configure(this,null,"");
	version.build();
	apb_map.add_reg(version,'h04,"RO");

	switch_status=SWITCH_STATUS::type_id::create("switch_status");
	switch_status.configure(this,null,"");
	switch_status.build();
	apb_map.add_reg(switch_status,'h08,"RO");

	port_status=PORT_STATUS::type_id::create("port_status");
	port_status.configure(this,null,"");
	port_status.build();
	apb_map.add_reg(port_status,'h0C,"RO");

	gen_status=GEN_STATUS::type_id::create("gen_status");
	gen_status.configure(this,null,"");
	gen_status.build();
	apb_map.add_reg(gen_status,'h10,"RO");

	stat_rx=STAT_RX::type_id::create("stat_rx");
	stat_rx.configure(this,null,"");
	stat_rx.build();
	apb_map.add_reg(stat_rx,'h14,"RO");

	stat_tx=STAT_TX::type_id::create("stat_tx");
	stat_tx.configure(this,null,"");
	stat_tx.build();
	apb_map.add_reg(stat_tx,'h18,"RO");

	stat_drop=STAT_DROP::type_id::create("stat_drop");
	stat_drop.configure(this,null,"");
	stat_drop.build();
	apb_map.add_reg(stat_drop,'h1C,"RO");

	switch_ctrl=SWITCH_CTRL::type_id::create("switch_ctrl");
	switch_ctrl.configure(this,null,"");
	switch_ctrl.build();
	apb_map.add_reg(switch_ctrl,'h20,"RW");

	port_enable=PORT_ENABLE::type_id::create("port_enable");
	port_enable.configure(this,null,"");
	port_enable.build();
	apb_map.add_reg(port_enable,'h24,"RW");

	fwd_enable=FWD_ENABLE::type_id::create("fwd_enable");
	fwd_enable.configure(this,null,"");
	fwd_enable.build();
	apb_map.add_reg(fwd_enable,'h28,"RW");

	gen_ctrl=GEN_CTRL::type_id::create("gen_ctrl");
	gen_ctrl.configure(this,null,"");
	gen_ctrl.build();
	apb_map.add_reg(gen_ctrl,'h2C,"RW");

	gen_pkt_cfg=GEN_PKT_CFG::type_id::create("gen_pkt_cfg");
	gen_pkt_cfg.configure(this,null,"");
	gen_pkt_cfg.build();
	apb_map.add_reg(gen_pkt_cfg,'h30,"RW");

	gen_interval=GEN_INTERVAL::type_id::create("gen_interval");
	gen_interval.configure(this,null,"");
	gen_interval.build();
	apb_map.add_reg(gen_interval,'h34,"RW");

	gen_count=GEN_COUNT::type_id::create("gen_count");
	gen_count.configure(this,null,"");
	gen_count.build();
	apb_map.add_reg(gen_count,'h38,"RW");

	irq_status=IRQ_STATUS::type_id::create("irq_status");
	irq_status.configure(this,null,"");
	irq_status.build();
	apb_map.add_reg(irq_status,'h3C,"RW");

	irq_enable=IRQ_ENABLE::type_id::create("irq_enable");
	irq_enable.configure(this,null,"");
	irq_enable.build();
	apb_map.add_reg(irq_enable,'h40,"RW");

	irq_force=IRQ_FORCE::type_id::create("irq_force");
	irq_force.configure(this,null,"");
	irq_force.build();
	apb_map.add_reg(irq_force,'h44,"WO");

	err_status=ERR_STATUS::type_id::create("err_status");
	err_status.configure(this,null,"");
	err_status.build();
	apb_map.add_reg(err_status,'h48,"RW");

	err_enable=ERR_ENABLE::type_id::create("err_enable");
	err_enable.configure(this,null,"");
	err_enable.build();
	apb_map.add_reg(err_enable,'h4C,"RW");

	err_inject=ERR_INJECT::type_id::create("err_inject");
	err_inject.configure(this,null,"");
	err_inject.build();
	apb_map.add_reg(err_inject,'h50,"WO");

	err_count=ERR_COUNT::type_id::create("err_count");
	err_count.configure(this,null,"");
	err_count.build();
	apb_map.add_reg(err_count,'h54,"RO");

	err_info=ERR_INFO::type_id::create("err_info");
	err_info.configure(this,null,"");
	err_info.build();
	apb_map.add_reg(err_info,'h58,"RO");

	lock=LOCK::type_id::create("lock");
	lock.configure(this,null,"");
	lock.build();
	apb_map.add_reg(lock,'h5C,"RW");

	soft_reset=SOFT_RESET::type_id::create("soft_reset");
	soft_reset.configure(this,null,"");
	soft_reset.build();
	apb_map.add_reg(soft_reset,'h60,"WO");

	set_hdl_path_root("tb.dut");
	lock_model();
endfunction

endclass
