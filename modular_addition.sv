module modular_addition(
	input logic i_start,
	input logic i_clk,
	input logic i_rst_n,
	output reg [255:0] result,
	output logic done
);

wire [255:0] p, A, B;
assign A = 256'h456789abcdef0123456789abcdef0123456789abcdef0;
assign B= 256'h888888888888888888888888888888888888888888888;
assign p = 256'hdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadb;
////////--------DATAPATH--------/////////
//-------datapath variables--------//
//----Define temporary values-------//
wire cout_1, cout_2, sel_R;
//------BKA1 related--------//
wire BKA1_done;
wire [255:0] BKA1_result;
//------BKA2 related--------//
wire BKA2_start, BKA2_done;
wire [255:0] BKA2_result;
wire [255:0] p_2s;
//------ 2-1 mux result related--------//
reg [255:0] i_result;
//-----Define BKA1 S = A+B -------Ci=0 because this is an adder//
BK256 BKA1(
	.start(i_start),
	.clk(i_clk),
	.rst_n(i_rst_n), 
   .A(A),
	.B(B),
	.Ci(1'b0), // Ci = 0 because this is an adder 
	.S(BKA1_result),
	.Co(cout_1),
	.done(BKA1_done)
	);
//------Define BKA2 s_m = A+B-p-------//
assign p_2s = ~p+256'b1;
BK256 BKA2(
	.start(BKA1_done),
	.clk(i_clk),
	.rst_n(i_rst_n), 
   .A(BKA1_result),
	.B(p_2s), // p 2's complement
	.Ci(1'b0), // Ci = 0 because this is an subtractor 
	.S(BKA2_result),
	.Co(cout_2),
	.done(BKA2_done)
	);
//-----Define Mux 2-1 to choose between s_m and s_m - p-------//
assign sel_R = cout_2 | cout_1;
always_comb 
	begin 
		if (sel_R)
			i_result = BKA2_result;
		else
			i_result = BKA1_result;
	end
always_ff @(posedge i_clk or negedge i_rst_n) 
begin 
	if (!i_rst_n) 
		result <= 256'b0;
	else if (BKA2_done)
		result <= i_result;
	else 
		result <= result;
end 
assign done = BKA2_done;
endmodule 