// ----------------------------------------------------------------------------
//
// Multi-Dataflow Composer tool - Platform Composer
// Configurator module 
// Date: 2018/11/08 13:25:28
//
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Module Interface
// ----------------------------------------------------------------------------

module configurator(
	ID,
	sel
);


// ----------------------------------------------------------------------------
// Module Signals
// ----------------------------------------------------------------------------

// Input
input [7:0] ID;

// Ouptut(s)
output [5:0] sel;


// ----------------------------------------------------------------------------
// Body
// ----------------------------------------------------------------------------

reg [5:0] sel;

// case ID
always@(ID)
case(ID)
8'd1:	begin	// no_parallel
sel[0]=1'b1;
sel[1]=1'b1;
sel[2]=1'b1;
sel[3]=1'b1;
sel[4]=1'b1;
sel[5]=1'b1;
			end
8'd2:	begin	// d0_parallel
sel[0]=1'b0;
sel[1]=1'b0;
sel[2]=1'b0;
sel[3]=1'b0;
sel[4]=1'b0;
sel[5]=1'b0;
			end
	default:	sel=6'bx;
endcase


endmodule
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
