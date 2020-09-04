module edge_mod(
input clk,
input rstn,
input cin,
output cout
);
parameter IDLE 		= 2'b00;
parameter STATE_1 	= 2'b01;
parameter STATE_2 	= 2'b10;
parameter FINAL 	= 2'b11;

reg [1:0] p_state;
reg [1:0] n_state;

always @(posedge clk or negedge rstn)
if(~rstn) p_state <=IDLE;
else p_state <=n_state;
always @(*)
begin 
	case(p_state)
		IDLE 	: 	begin
						if(cin) n_state <= STATE_1;
						else n_state <= IDLE;
					end
		STATE_1:	begin
						if(cin) n_state <= STATE_2;
						else n_state <= IDLE;
					end
		STATE_2:	begin
						if(cin) n_state <= FINAL;
						else n_state <= IDLE;
					end
		FINAL	:	begin
						if(cin) n_state <= IDLE;
						else n_state <= IDLE;
					end
		default : n_state <= IDLE;
	endcase
assign cout = (P_state == FINAL & cin == 1'b1) ? 1'b1 : 1'b0;
endmodule
