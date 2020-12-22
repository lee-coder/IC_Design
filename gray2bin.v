module gray2bin #(
  parameter WIDTH = 8
)
(
  input   [WIDTH-1:0]   gray;
  output  [WIDTH-1:0]   bin
);

genvar i;

assign bin[WIDTH-1] = gray[WIDTH-1];

generate
if(WIDTH>=2) begin
  for(i=WIDTH-2; i>=0; i=i-1) begin
    assign bin[i] = gray[i] ^ bin[i+1];
  end
end
endgenerate

endmodul
