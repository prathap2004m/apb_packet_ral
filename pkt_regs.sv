class DEVICE_ID extends uvm_reg;
`uvm_object_utils(DEVICE_ID)

rand uvm_reg_field REVISION;
rand uvm_reg_field VENDOR_ID;
rand uvm_reg_field PRODUCT_ID;

function new(string name="DEVICE_ID");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	REVISION=uvm_reg_field::type_id::create("REVISION");
	VENDOR_ID=uvm_reg_field::type_id::create("VENDOR_ID");
	PRODUCT_ID=uvm_reg_field::type_id::create("PRODUCT_ID");

	REVISION.configure(this,8,24,"RO",0,8'h2,1,0,0);
	VENDOR_ID.configure(this,8,16,"RO",0,8'hA5,1,0,0);
	PRODUCT_ID.configure(this,16,0,"RO",0,16'h5357,1,0,0);
endfunction

endclass

class VERSION extends uvm_reg;
`uvm_object_utils(VERSION)

rand uvm_reg_field RESERVED;
rand uvm_reg_field MAJOR;
rand uvm_reg_field MINOR;
rand uvm_reg_field PATCH;

function new(string name="VERSION");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	MAJOR=uvm_reg_field::type_id::create("MAJOR");
	MINOR=uvm_reg_field::type_id::create("MINOR");
	PATCH=uvm_reg_field::type_id::create("PATCH");

	RESERVED.configure(this,8,24,"RO",0,8'h0,1,0,0);
	MAJOR.configure(this,8,16,"RO",0,8'h1,1,0,0);
	MINOR.configure(this,8,8,"RO",0,8'h2,1,0,0);
	PATCH.configure(this,8,0,"RO",0,8'h0,1,0,0);
endfunction

endclass

class SWITCH_STATUS extends uvm_reg;
`uvm_object_utils(SWITCH_STATUS)

rand uvm_reg_field RESERVED;
rand uvm_reg_field GEN_FSM;
rand uvm_reg_field RESERVED_1;
rand uvm_reg_field ERR_PENDING;
rand uvm_reg_field GEN_RUNNING;
rand uvm_reg_field PORT_ENABLED;
rand uvm_reg_field LOCKED;
rand uvm_reg_field SWITCH_ENABLED;
rand uvm_reg_field BUSY;
rand uvm_reg_field READY;

function new(string name="SWITCH_STATUS");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	GEN_FSM=uvm_reg_field::type_id::create("GEN_FSM");
	RESERVED_1=uvm_reg_field::type_id::create("RESERVED_1");
	ERR_PENDING=uvm_reg_field::type_id::create("ERR_PENDING");
	GEN_RUNNING=uvm_reg_field::type_id::create("GEN_RUNNING");
	PORT_ENABLED=uvm_reg_field::type_id::create("PORT_ENABLED");
	LOCKED=uvm_reg_field::type_id::create("LOCKED");
	SWITCH_ENABLED=uvm_reg_field::type_id::create("SWITCH_ENABLED");
	BUSY=uvm_reg_field::type_id::create("BUSY");
	READY=uvm_reg_field::type_id::create("READY");

	RESERVED.configure(this,14,18,"RO",0,14'h0,1,0,0);
	GEN_FSM.configure(this,2,16,"RO",1,2'h0,1,0,0);
	RESERVED_1.configure(this,6,10,"RO",0,6'h0,1,0,0);
	ERR_PENDING.configure(this,1,9,"RO",1,1'h0,1,0,0);
	GEN_RUNNING.configure(this,1,8,"RO",1,1'h0,1,0,0);
	PORT_ENABLED.configure(this,4,4,"RO",1,4'hF,1,0,0);
	LOCKED.configure(this,1,3,"RO",1,1'h1,1,0,0);
	SWITCH_ENABLED.configure(this,1,2,"RO",1,1'h0,1,0,0);
	BUSY.configure(this,1,1,"RO",1,1'h0,1,0,0);
	READY.configure(this,1,0,"RO",1,1'h1,1,0,0);
endfunction

endclass

class PORT_STATUS extends uvm_reg;
`uvm_object_utils(PORT_STATUS)

rand uvm_reg_field PORT3_LEVEL;
rand uvm_reg_field PORT2_LEVEL;
rand uvm_reg_field PORT1_LEVEL;
rand uvm_reg_field PORT0_LEVEL;

function new(string name="PORT_STATUS");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	PORT3_LEVEL=uvm_reg_field::type_id::create("PORT3_LEVEL");
	PORT2_LEVEL=uvm_reg_field::type_id::create("PORT2_LEVEL");
	PORT1_LEVEL=uvm_reg_field::type_id::create("PORT1_LEVEL");
	PORT0_LEVEL=uvm_reg_field::type_id::create("PORT0_LEVEL");

	PORT3_LEVEL.configure(this,8,24,"RO",1,8'h0,1,0,0);
	PORT2_LEVEL.configure(this,8,16,"RO",1,8'h0,1,0,0);
	PORT1_LEVEL.configure(this,8,8,"RO",1,8'h0,1,0,0);
	PORT0_LEVEL.configure(this,8,0,"RO",1,8'h0,1,0,0);
endfunction

endclass

class GEN_STATUS extends uvm_reg;
`uvm_object_utils(GEN_STATUS)

rand uvm_reg_field RESERVED;
rand uvm_reg_field REMAINING;
rand uvm_reg_field RESERVED_1;
rand uvm_reg_field FSM;
rand uvm_reg_field DONE;
rand uvm_reg_field RUNNING;

function new(string name="GEN_STATUS");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	REMAINING=uvm_reg_field::type_id::create("REMAINING");
	RESERVED_1=uvm_reg_field::type_id::create("RESERVED_1");
	FSM=uvm_reg_field::type_id::create("FSM");
	DONE=uvm_reg_field::type_id::create("DONE");
	RUNNING=uvm_reg_field::type_id::create("RUNNING");

	RESERVED.configure(this,8,24,"RO",0,8'h0,1,0,0);
	REMAINING.configure(this,16,8,"RO",1,16'h0,1,0,0);
	RESERVED_1.configure(this,4,4,"RO",0,4'h0,1,0,0);
	FSM.configure(this,2,2,"RO",1,2'h0,1,0,0);
	DONE.configure(this,1,1,"RO",1,1'h0,1,0,0);
	RUNNING.configure(this,1,0,"RO",1,1'h0,1,0,0);
endfunction

endclass

class STAT_RX extends uvm_reg;
`uvm_object_utils(STAT_RX)

rand uvm_reg_field RESERVED;
rand uvm_reg_field RX_PACKETS;

function new(string name="STAT_RX");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	RX_PACKETS=uvm_reg_field::type_id::create("RX_PACKETS");

	RESERVED.configure(this,16,16,"RO",0,16'h0,1,0,0);
	RX_PACKETS.configure(this,16,0,"RO",1,16'h0,1,0,0);
endfunction

endclass

class STAT_TX extends uvm_reg;
`uvm_object_utils(STAT_TX)

rand uvm_reg_field RESERVED;
rand uvm_reg_field TX_PACKETS;

function new(string name="STAT_TX");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	TX_PACKETS=uvm_reg_field::type_id::create("TX_PACKETS");

	RESERVED.configure(this,16,16,"RO",0,16'h0,1,0,0);
	TX_PACKETS.configure(this,16,0,"RO",1,16'h0,1,0,0);
endfunction

endclass

class STAT_DROP extends uvm_reg;
`uvm_object_utils(STAT_DROP)

rand uvm_reg_field RESERVED;
rand uvm_reg_field DROPPED_PACKETS;

function new(string name="STAT_DROP");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	DROPPED_PACKETS=uvm_reg_field::type_id::create("DROPPED_PACKETS");

	RESERVED.configure(this,16,16,"RO",0,16'h0,1,0,0);
	DROPPED_PACKETS.configure(this,16,0,"RO",1,16'h0,1,0,0);
endfunction

endclass

class SWITCH_CTRL extends uvm_reg;
`uvm_object_utils(SWITCH_CTRL)

rand uvm_reg_field RESERVED;
rand uvm_reg_field IRQ_GLOBAL_EN;
rand uvm_reg_field RESERVED_1;
rand uvm_reg_field STAT_CLEAR;
rand uvm_reg_field ENABLE;

function new(string name="SWITCH_CTRL");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	IRQ_GLOBAL_EN=uvm_reg_field::type_id::create("IRQ_GLOBAL_EN");
	RESERVED_1=uvm_reg_field::type_id::create("RESERVED_1");
	STAT_CLEAR=uvm_reg_field::type_id::create("STAT_CLEAR");
	ENABLE=uvm_reg_field::type_id::create("ENABLE");

	RESERVED.configure(this,28,4,"RO",0,28'h0,1,0,0);
	IRQ_GLOBAL_EN.configure(this,1,3,"RW",0,1'h0,1,1,0);
	RESERVED_1.configure(this,1,2,"RO",0,1'h0,1,0,0);
	STAT_CLEAR.configure(this,1,1,"WO",0,1'h0,1,0,0);
	ENABLE.configure(this,1,0,"RW",0,1'h0,1,1,0);
endfunction

endclass

class PORT_ENABLE extends uvm_reg;
`uvm_object_utils(PORT_ENABLE)

rand uvm_reg_field RESERVED;
rand uvm_reg_field PORT3_EN;
rand uvm_reg_field PORT2_EN;
rand uvm_reg_field PORT1_EN;
rand uvm_reg_field PORT0_EN;

function new(string name="PORT_ENABLE");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	PORT3_EN=uvm_reg_field::type_id::create("PORT3_EN");
	PORT2_EN=uvm_reg_field::type_id::create("PORT2_EN");
	PORT1_EN=uvm_reg_field::type_id::create("PORT1_EN");
	PORT0_EN=uvm_reg_field::type_id::create("PORT0_EN");

	RESERVED.configure(this,28,4,"RO",0,28'h0,1,0,0);
	PORT3_EN.configure(this,1,3,"RW",0,1'h1,1,1,0);
	PORT2_EN.configure(this,1,2,"RW",0,1'h1,1,1,0);
	PORT1_EN.configure(this,1,1,"RW",0,1'h1,1,1,0);
	PORT0_EN.configure(this,1,0,"RW",0,1'h1,1,1,0);
endfunction

endclass

class FWD_ENABLE extends uvm_reg;
`uvm_object_utils(FWD_ENABLE)

rand uvm_reg_field RESERVED;
rand uvm_reg_field FWD3_EN;
rand uvm_reg_field FWD2_EN;
rand uvm_reg_field FWD1_EN;
rand uvm_reg_field FWD0_EN;

function new(string name="FWD_ENABLE");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	FWD3_EN=uvm_reg_field::type_id::create("FWD3_EN");
	FWD2_EN=uvm_reg_field::type_id::create("FWD2_EN");
	FWD1_EN=uvm_reg_field::type_id::create("FWD1_EN");
	FWD0_EN=uvm_reg_field::type_id::create("FWD0_EN");

	RESERVED.configure(this,28,4,"RO",0,28'h0,1,0,0);
	FWD3_EN.configure(this,1,3,"RW",0,1'h1,1,1,0);
	FWD2_EN.configure(this,1,2,"RW",0,1'h1,1,1,0);
	FWD1_EN.configure(this,1,1,"RW",0,1'h1,1,1,0);
	FWD0_EN.configure(this,1,0,"RW",0,1'h1,1,1,0);
endfunction

endclass

class GEN_CTRL extends uvm_reg;
`uvm_object_utils(GEN_CTRL)

rand uvm_reg_field RESERVED;
rand uvm_reg_field CONTINUOUS;
rand uvm_reg_field STOP;
rand uvm_reg_field START;
rand uvm_reg_field ENABLE;

function new(string name="GEN_CTRL");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	CONTINUOUS=uvm_reg_field::type_id::create("CONTINUOUS");
	STOP=uvm_reg_field::type_id::create("STOP");
	START=uvm_reg_field::type_id::create("START");
	ENABLE=uvm_reg_field::type_id::create("ENABLE");

	RESERVED.configure(this,28,4,"RO",0,28'h0,1,0,0);
	CONTINUOUS.configure(this,1,3,"RW",0,1'h0,1,1,0);
	STOP.configure(this,1,2,"WO",0,1'h0,1,0,0);
	START.configure(this,1,1,"WO",0,1'h0,1,0,0);
	ENABLE.configure(this,1,0,"RW",0,1'h0,1,1,0);
endfunction

endclass

class GEN_PKT_CFG extends uvm_reg;
`uvm_object_utils(GEN_PKT_CFG)

rand uvm_reg_field RESERVED;
rand uvm_reg_field SEED;
rand uvm_reg_field LENGTH;
rand uvm_reg_field RESERVED_1;
rand uvm_reg_field SRC_PORT;
rand uvm_reg_field DST_PORT;

function new(string name="GEN_PKT_CFG");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	SEED=uvm_reg_field::type_id::create("SEED");
	LENGTH=uvm_reg_field::type_id::create("LENGTH");
	RESERVED_1=uvm_reg_field::type_id::create("RESERVED_1");
	SRC_PORT=uvm_reg_field::type_id::create("SRC_PORT");
	DST_PORT=uvm_reg_field::type_id::create("DST_PORT");

	RESERVED.configure(this,8,24,"RO",0,8'h0,1,0,0);
	SEED.configure(this,8,16,"RW",0,8'h0,1,1,0);
	LENGTH.configure(this,8,8,"RW",0,8'h4,1,1,0);
	RESERVED_1.configure(this,4,4,"RO",0,4'h0,1,0,0);
	SRC_PORT.configure(this,2,2,"RW",0,2'h0,1,1,0);
	DST_PORT.configure(this,2,0,"RW",0,2'h1,1,1,0);
endfunction

endclass

class GEN_INTERVAL extends uvm_reg;
`uvm_object_utils(GEN_INTERVAL)

rand uvm_reg_field RESERVED;
rand uvm_reg_field INTERVAL;

function new(string name="GEN_INTERVAL");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	INTERVAL=uvm_reg_field::type_id::create("INTERVAL");

	RESERVED.configure(this,16,16,"RO",0,16'h0,1,0,0);
	INTERVAL.configure(this,16,0,"RW",0,16'h2,1,1,0);
endfunction

endclass

class GEN_COUNT extends uvm_reg;
`uvm_object_utils(GEN_COUNT)

rand uvm_reg_field RESERVED;
rand uvm_reg_field PACKET_COUNT;

function new(string name="GEN_COUNT");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	PACKET_COUNT=uvm_reg_field::type_id::create("PACKET_COUNT");

	RESERVED.configure(this,16,16,"RO",0,16'h0,1,0,0);
	PACKET_COUNT.configure(this,16,0,"RW",0,16'h4,1,1,0);
endfunction

endclass

class IRQ_STATUS extends uvm_reg;
`uvm_object_utils(IRQ_STATUS)

rand uvm_reg_field RESERVED;
rand uvm_reg_field SW_EVENT;
rand uvm_reg_field START_ACK;
rand uvm_reg_field QUEUE_ALMOST_FULL;
rand uvm_reg_field PACKET_FORWARDED;
rand uvm_reg_field PACKET_DROPPED;
rand uvm_reg_field QUEUE_OVERFLOW;
rand uvm_reg_field ERROR;
rand uvm_reg_field GEN_DONE;

function new(string name="IRQ_STATUS");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	SW_EVENT=uvm_reg_field::type_id::create("SW_EVENT");
	START_ACK=uvm_reg_field::type_id::create("START_ACK");
	QUEUE_ALMOST_FULL=uvm_reg_field::type_id::create("QUEUE_ALMOST_FULL");
	PACKET_FORWARDED=uvm_reg_field::type_id::create("PACKET_FORWARDED");
	PACKET_DROPPED=uvm_reg_field::type_id::create("PACKET_DROPPED");
	QUEUE_OVERFLOW=uvm_reg_field::type_id::create("QUEUE_OVERFLOW");
	ERROR=uvm_reg_field::type_id::create("ERROR");
	GEN_DONE=uvm_reg_field::type_id::create("GEN_DONE");

	RESERVED.configure(this,24,8,"RO",0,24'h0,1,0,0);
	SW_EVENT.configure(this,1,7,"W1C",0,1'h0,1,0,0);
	START_ACK.configure(this,1,6,"W1C",0,1'h0,1,0,0);
	QUEUE_ALMOST_FULL.configure(this,1,5,"W1C",0,1'h0,1,0,0);
	PACKET_FORWARDED.configure(this,1,4,"W1C",0,1'h0,1,0,0);
	PACKET_DROPPED.configure(this,1,3,"W1C",0,1'h0,1,0,0);
	QUEUE_OVERFLOW.configure(this,1,2,"W1C",0,1'h0,1,0,0);
	ERROR.configure(this,1,1,"W1C",0,1'h0,1,0,0);
	GEN_DONE.configure(this,1,0,"W1C",0,1'h0,1,0,0);
endfunction

endclass

class IRQ_ENABLE extends uvm_reg;
`uvm_object_utils(IRQ_ENABLE)

rand uvm_reg_field RESERVED;
rand uvm_reg_field SW_EVENT_EN;
rand uvm_reg_field START_ACK_EN;
rand uvm_reg_field QUEUE_AF_EN;
rand uvm_reg_field PACKET_FWD_EN;
rand uvm_reg_field PACKET_DROP_EN;
rand uvm_reg_field OVERFLOW_EN;
rand uvm_reg_field ERROR_EN;
rand uvm_reg_field GEN_DONE_EN;

function new(string name="IRQ_ENABLE");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	SW_EVENT_EN=uvm_reg_field::type_id::create("SW_EVENT_EN");
	START_ACK_EN=uvm_reg_field::type_id::create("START_ACK_EN");
	QUEUE_AF_EN=uvm_reg_field::type_id::create("QUEUE_AF_EN");
	PACKET_FWD_EN=uvm_reg_field::type_id::create("PACKET_FWD_EN");
	PACKET_DROP_EN=uvm_reg_field::type_id::create("PACKET_DROP_EN");
	OVERFLOW_EN=uvm_reg_field::type_id::create("OVERFLOW_EN");
	ERROR_EN=uvm_reg_field::type_id::create("ERROR_EN");
	GEN_DONE_EN=uvm_reg_field::type_id::create("GEN_DONE_EN");

	RESERVED.configure(this,24,8,"RO",0,24'h0,1,0,0);
	SW_EVENT_EN.configure(this,1,7,"RW",0,1'h0,1,1,0);
	START_ACK_EN.configure(this,1,6,"RW",0,1'h0,1,1,0);
	QUEUE_AF_EN.configure(this,1,5,"RW",0,1'h0,1,1,0);
	PACKET_FWD_EN.configure(this,1,4,"RW",0,1'h0,1,1,0);
	PACKET_DROP_EN.configure(this,1,3,"RW",0,1'h0,1,1,0);
	OVERFLOW_EN.configure(this,1,2,"RW",0,1'h0,1,1,0);
	ERROR_EN.configure(this,1,1,"RW",0,1'h0,1,1,0);
	GEN_DONE_EN.configure(this,1,0,"RW",0,1'h0,1,1,0);
endfunction

endclass

class IRQ_FORCE extends uvm_reg;
`uvm_object_utils(IRQ_FORCE)

rand uvm_reg_field RESERVED;
rand uvm_reg_field FORCE;

function new(string name="IRQ_FORCE");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	FORCE=uvm_reg_field::type_id::create("FORCE");

	RESERVED.configure(this,24,8,"RO",0,24'h0,1,0,0);
	FORCE.configure(this,8,0,"WO",0,8'h0,1,0,0);
endfunction

endclass

class ERR_STATUS extends uvm_reg;
`uvm_object_utils(ERR_STATUS)

rand uvm_reg_field RESERVED;
rand uvm_reg_field INJECTED;
rand uvm_reg_field LENGTH_ERROR;
rand uvm_reg_field CRC_ERROR;
rand uvm_reg_field PROTOCOL_ERROR;
rand uvm_reg_field UNDERSIZE;
rand uvm_reg_field QUEUE_OVERFLOW;
rand uvm_reg_field DEST_ERROR;
rand uvm_reg_field BUS_ERROR;

function new(string name="ERR_STATUS");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	INJECTED=uvm_reg_field::type_id::create("INJECTED");
	LENGTH_ERROR=uvm_reg_field::type_id::create("LENGTH_ERROR");
	CRC_ERROR=uvm_reg_field::type_id::create("CRC_ERROR");
	PROTOCOL_ERROR=uvm_reg_field::type_id::create("PROTOCOL_ERROR");
	UNDERSIZE=uvm_reg_field::type_id::create("UNDERSIZE");
	QUEUE_OVERFLOW=uvm_reg_field::type_id::create("QUEUE_OVERFLOW");
	DEST_ERROR=uvm_reg_field::type_id::create("DEST_ERROR");
	BUS_ERROR=uvm_reg_field::type_id::create("BUS_ERROR");

	RESERVED.configure(this,24,8,"RO",0,24'h0,1,0,0);
	INJECTED.configure(this,1,7,"W1C",0,1'h0,1,0,0);
	LENGTH_ERROR.configure(this,1,6,"W1C",0,1'h0,1,0,0);
	CRC_ERROR.configure(this,1,5,"W1C",0,1'h0,1,0,0);
	PROTOCOL_ERROR.configure(this,1,4,"W1C",0,1'h0,1,0,0);
	UNDERSIZE.configure(this,1,3,"W1C",0,1'h0,1,0,0);
	QUEUE_OVERFLOW.configure(this,1,2,"W1C",0,1'h0,1,0,0);
	DEST_ERROR.configure(this,1,1,"W1C",0,1'h0,1,0,0);
	BUS_ERROR.configure(this,1,0,"W1C",0,1'h0,1,0,0);
endfunction

endclass

class ERR_ENABLE extends uvm_reg;
`uvm_object_utils(ERR_ENABLE)

rand uvm_reg_field RESERVED;
rand uvm_reg_field INJECTED_EN;
rand uvm_reg_field LENGTH_EN;
rand uvm_reg_field CRC_EN;
rand uvm_reg_field PROTOCOL_EN;
rand uvm_reg_field UNDERSIZE_EN;
rand uvm_reg_field OVERFLOW_EN;
rand uvm_reg_field DEST_EN;
rand uvm_reg_field BUS_EN;

function new(string name="ERR_ENABLE");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	INJECTED_EN=uvm_reg_field::type_id::create("INJECTED_EN");
	LENGTH_EN=uvm_reg_field::type_id::create("LENGTH_EN");
	CRC_EN=uvm_reg_field::type_id::create("CRC_EN");
	PROTOCOL_EN=uvm_reg_field::type_id::create("PROTOCOL_EN");
	UNDERSIZE_EN=uvm_reg_field::type_id::create("UNDERSIZE_EN");
	OVERFLOW_EN=uvm_reg_field::type_id::create("OVERFLOW_EN");
	DEST_EN=uvm_reg_field::type_id::create("DEST_EN");
	BUS_EN=uvm_reg_field::type_id::create("BUS_EN");

	RESERVED.configure(this,24,8,"RO",0,24'h0,1,0,0);
	INJECTED_EN.configure(this,1,7,"RW",0,1'h0,1,1,0);
	LENGTH_EN.configure(this,1,6,"RW",0,1'h0,1,1,0);
	CRC_EN.configure(this,1,5,"RW",0,1'h0,1,1,0);
	PROTOCOL_EN.configure(this,1,4,"RW",0,1'h0,1,1,0);
	UNDERSIZE_EN.configure(this,1,3,"RW",0,1'h0,1,1,0);
	OVERFLOW_EN.configure(this,1,2,"RW",0,1'h0,1,1,0);
	DEST_EN.configure(this,1,1,"RW",0,1'h0,1,1,0);
	BUS_EN.configure(this,1,0,"RW",0,1'h0,1,1,0);
endfunction

endclass

class ERR_INJECT extends uvm_reg;
`uvm_object_utils(ERR_INJECT)

rand uvm_reg_field CLEAR_COUNT;
rand uvm_reg_field RESERVED;
rand uvm_reg_field INJECT;

function new(string name="ERR_INJECT");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	CLEAR_COUNT=uvm_reg_field::type_id::create("CLEAR_COUNT");
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	INJECT=uvm_reg_field::type_id::create("INJECT");

	CLEAR_COUNT.configure(this,1,31,"WO",0,1'h0,1,0,0);
	RESERVED.configure(this,23,8,"RO",0,23'h0,1,0,0);
	INJECT.configure(this,8,0,"WO",0,8'h0,1,0,0);
endfunction

endclass

class ERR_COUNT extends uvm_reg;
`uvm_object_utils(ERR_COUNT)

rand uvm_reg_field RESERVED;
rand uvm_reg_field ERROR_COUNT;

function new(string name="ERR_COUNT");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	ERROR_COUNT=uvm_reg_field::type_id::create("ERROR_COUNT");

	RESERVED.configure(this,16,16,"RO",0,16'h0,1,0,0);
	ERROR_COUNT.configure(this,16,0,"RO",1,16'h0,1,0,0);
endfunction

endclass

class ERR_INFO extends uvm_reg;
`uvm_object_utils(ERR_INFO)

rand uvm_reg_field TX_SNAPSHOT;
rand uvm_reg_field RESERVED;
rand uvm_reg_field DEST_PORT;
rand uvm_reg_field SOURCE;
rand uvm_reg_field LAST_CODE;

function new(string name="ERR_INFO");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	TX_SNAPSHOT=uvm_reg_field::type_id::create("TX_SNAPSHOT");
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	DEST_PORT=uvm_reg_field::type_id::create("DEST_PORT");
	SOURCE=uvm_reg_field::type_id::create("SOURCE");
	LAST_CODE=uvm_reg_field::type_id::create("LAST_CODE");

	TX_SNAPSHOT.configure(this,12,20,"RO",1,12'h0,1,0,0);
	RESERVED.configure(this,2,18,"RO",0,2'h0,1,0,0);
	DEST_PORT.configure(this,2,16,"RO",1,2'h0,1,0,0);
	SOURCE.configure(this,8,8,"RO",1,8'h0,1,0,0);
	LAST_CODE.configure(this,8,0,"RO",1,8'h0,1,0,0);
endfunction

endclass

class LOCK extends uvm_reg;
`uvm_object_utils(LOCK)

rand uvm_reg_field RESERVED;
rand uvm_reg_field LOCKED;

function new(string name="LOCK");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	LOCKED=uvm_reg_field::type_id::create("LOCKED");

	RESERVED.configure(this,31,1,"RO",0,31'h0,1,0,0);
	LOCKED.configure(this,1,0,"RO",1,1'h1,1,0,0);
endfunction

endclass

class SOFT_RESET extends uvm_reg;
`uvm_object_utils(SOFT_RESET)

rand uvm_reg_field RESERVED;
rand uvm_reg_field PULSE;

function new(string name="SOFT_RESET");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction

function void build();
	RESERVED=uvm_reg_field::type_id::create("RESERVED");
	PULSE=uvm_reg_field::type_id::create("PULSE");

	RESERVED.configure(this,31,1,"RO",0,31'h0,1,0,0);
	PULSE.configure(this,1,0,"WO",0,1'h0,1,0,0);
endfunction

endclass