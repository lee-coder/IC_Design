module data_shifter #(
  parameter DATA_WIDTH  = 16,
  parameter SHIFT_WIDTH = 4,
  parameter DIR_LR = 1,
  parameter ROTATE = 1
)
(
  input   in,
  output  out
);

generate
if(DIR_LR) begin    // LEFT SHIFT
  if(ROTATE) begin
    assign out = {in[DATA_WIDTH-1-SHIFT_WIDTH :0], in[DATA_WIDTH-1 -:SHIFT_WIDTH]};
  end
  else begin
    assign out = {in[DATA_WIDTH-1-SHIFT_WIDTH :0], {SHIFT_WIDTH{1'b0}} };
  end
end
else begin  // RIGHT SHIFT
  if(ROTATE) begin
    assign out = {in[SHIFT_WIDTH-1 :0], in[DATA_WIDTH-1 :SHIFT_WIDTH] };  
  end
  else begin
    assign out = { {SHIFT_WIDTH{1'b0}}, in[DATA_WIDTH-1 :SHIFT_WIDTH] };    
  end
end
endgenerate
  
endmodule
