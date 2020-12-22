module shifter #(
  parameter DELAY = 8;
)
(
  input clk, rstn,
  input   in,
  output  out
);

  genvar i;
  reg [DELAY :0]  shift_reg;
  always@(*) begin
    shift_reg[0] = in;
  end
  generate
    for(i=1; i<=DELAY; i=i+1) begin
      always@(posedge clk or rstn) begin
        if(~rstn)   shift_reg[i] <= 1'b0;
        else        shift_reg[i] <= shift_reg[i-1];
      end
    end
  endgenerate
  assign out = shift_reg[DELAY];
  
endmodule
