
module BK256 (
	
    input clk,

    input rst_n,

    input start,
 
    input [255:0] A,

    input [255:0] B,
   
    input Ci,

    output reg [255:0] S,

    output reg done,

    output reg Co

);

reg [4:0] counter;

reg [255:0] temp_S;

reg [15:0] Cout;

reg [15:0] Cin;

//reg  [255:0] S;

reg Cout_0, Cout_1, Cout_2,Cout_3,Cout_4,Cout_5,Cout_6,Cout_7,Cout_8,Cout_9,Cout_10,Cout_11,Cout_12,Cout_13,Cout_14, Cout_15;



// 16-bit Brent-Kung adder

BrentKung adder0 (.A(A[15:0]),   .B(B[15:0]),   .Cin(1'b0),   .S(temp_S[15:0]),   .Cout(Cout[0]));
BrentKung adder1 (.A(A[31:16]),  .B(B[31:16]),  .Cin(Cout_0), .S(temp_S[31:16]),  .Cout(Cout[1]));
BrentKung adder2 (.A(A[47:32]),  .B(B[47:32]),  .Cin(Cout_1), .S(temp_S[47:32]),  .Cout(Cout[2]));
BrentKung adder3 (.A(A[63:48]),  .B(B[63:48]),  .Cin(Cout_2), .S(temp_S[63:48]),  .Cout(Cout[3]));
BrentKung adder4 (.A(A[79:64]),  .B(B[79:64]),  .Cin(Cout_3), .S(temp_S[79:64]),  .Cout(Cout[4]));
BrentKung adder5 (.A(A[95:80]),  .B(B[95:80]),  .Cin(Cout_4), .S(temp_S[95:80]),  .Cout(Cout[5]));
BrentKung adder6 (.A(A[111:96]), .B(B[111:96]), .Cin(Cout_5), .S(temp_S[111:96]), .Cout(Cout[6]));
BrentKung adder7 (.A(A[127:112]), .B(B[127:112]), .Cin(Cout_6), .S(temp_S[127:112]), .Cout(Cout[7]));
BrentKung adder8 (.A(A[143:128]), .B(B[143:128]), .Cin(Cout_7), .S(temp_S[143:128]), .Cout(Cout[8]));
BrentKung adder9 (.A(A[159:144]), .B(B[159:144]), .Cin(Cout_8), .S(temp_S[159:144]), .Cout(Cout[9]));
BrentKung adder10 (.A(A[175:160]), .B(B[175:160]), .Cin(Cout_9), .S(temp_S[175:160]), .Cout(Cout[10]));
BrentKung adder11 (.A(A[191:176]), .B(B[191:176]), .Cin(Cout_10), .S(temp_S[191:176]), .Cout(Cout[11]));
BrentKung adder12 (.A(A[207:192]), .B(B[207:192]), .Cin(Cout_11), .S(temp_S[207:192]), .Cout(Cout[12]));
BrentKung adder13 (.A(A[223:208]), .B(B[223:208]), .Cin(Cout_12), .S(temp_S[223:208]), .Cout(Cout[13]));
BrentKung adder14 (.A(A[239:224]), .B(B[239:224]), .Cin(Cout[13]), .S(temp_S[239:224]), .Cout(Cout[14]));
BrentKung adder15 (.A(A[255:240]), .B(B[255:240]), .Cin(Cout[14]), .S(temp_S[255:240]), .Cout(Cout[15]));

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= 0;
        done <= 1'b0;
         S <= 0; // Cập nhật S từ biến tạm
        Co <= 0; // Reset tín hiệu done
    end else if (start) begin
        if (counter < 5'd17) begin
            counter <= counter + 1;
            done <= 1'b0; // Thiết lập done là 0 cho đến khi bộ đếm đạt 18
            S<=0;
            Co<=0;
        end else begin
            done <= 1'b1;
             S <= temp_S; // Cập nhật S từ biến tạm
             Co <= Cout_15; // Thiết lập done là 1 khi bộ đếm đạt 18
            // counter <=0;
        end
    end 
    /*else begin
        done <= 1'b0;
        S<=0;
        Co<=0;
         // Nếu start = 0, thiết lập done = 0
    end*/
end



always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_0 <= 0;
    end else if (start) begin
        Cout_0 <= Cout[0];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_1 <= 0;
    end else if (start) begin
        Cout_1 <= Cout[1];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_2 <= 0;
    end else if (start) begin
        Cout_2 <= Cout[2];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_3 <= 0;
    end else if (start) begin
        Cout_3 <= Cout[3];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_4 <= 0;
    end else if (start) begin
        Cout_4 <= Cout[4];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_5 <= 0;
    end else if (start) begin
        Cout_5 <= Cout[5];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_6 <= 0;
    end else if (start) begin
        Cout_6 <= Cout[6];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_7 <= 0;
    end else if (start) begin
        Cout_7 <= Cout[7];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_8 <= 0;
    end else if (start) begin
        Cout_8 <= Cout[8];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_9 <= 0;
    end else if (start) begin
        Cout_9 <= Cout[9];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_10 <= 0;
    end else if (start) begin
        Cout_10 <= Cout[10];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_11 <= 0;
    end else if (start) begin
        Cout_11 <= Cout[11];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_12 <= 0;
    end else if (start) begin
        Cout_12 <= Cout[12];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_13 <= 0;
    end else if (start) begin
        Cout_13 <= Cout[13];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_14 <= 0;
    end else if (start) begin
        Cout_14 <= Cout[14];
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Cout_15 <= 0;
    end else if (start) begin
        Cout_15 <= Cout[15];
    end
end

// Cập nhật S chỉ khi done là 1
/*always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        S <= 0;
        Co <= 0;
    end else if (done) begin
        S <= temp_S; // Cập nhật S từ biến tạm
        Co <= Cout_15;
    end else begin
        S <= 0; // Đặt S về 0 khi done = 0
        Co <= 0; // Đặt Co về 0 khi done = 0
    end
end
		
*/

endmodule