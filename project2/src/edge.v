module edge_mod(
input clk,
input rstn,
input cin,
output cout
);

reg cin_f;
reg cin_ff;
reg cin_fff;
reg cin_ffff;
always @(posedge clk or negedge rstn)
begin 
if(~rstn)
begin
cin_f <= 1'b0;
cin_ff <= 1'b0;
cin_fff <= 1'b0;
cin_ffff <= 1'b0;
end
else
begin
cin_f <= cin ;
cin_ff <= cin_f;
cin_fff <=cin_ff;
cin_ffff <=cin_fff;
end
end
assign cout = cin_ffff & ~cin_fff & cin_ff & cin_f;
endmodule
