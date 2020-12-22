module bin2gray #(
  parameter WIDTH = 8
)
(
  input   [WIDTH-1:0]   bin;
  output  [WIDTH-1:0]   gray
);

generate
if(WIDTH==1) begin
  assign gray = bin;
end
else if(WIDTH==2) begin
  assign gray = {1'b0, bin[1]} ^ bin;
end
else begin
  assign gray = {1'b0, bin[WIDTH-1:1]} ^ bin;
end
endgenerate

endmodule
