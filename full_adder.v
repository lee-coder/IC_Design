
Full Adder Truth Table
A	B	Cin	Cout	Sum
0	0	  0	  0	   0
1	0	  0	  0	   1
0	1	  0	  0	   1
1	1	  0	  1	   0
0	0	  1	  0	   1
1	0	  1	  1	   0
0	1	  1	  1	   0
1	1	  1	  1	   1

module full_adder 
  (
   input i_bit1,
   input i_bit2,
   input i_carry,
   output wire o_sum,
   output wire o_carry
   );
 
  wire   w_WIRE_1;
  wire   w_WIRE_2;
  wire   w_WIRE_3;
       
  assign w_WIRE_1 = i_bit1 ^ i_bit2;
  assign w_WIRE_2 = w_WIRE_1 & i_carry;
  assign w_WIRE_3 = i_bit1 & i_bit2;
 
  assign o_sum   = w_WIRE_1 ^ i_carry;
  assign o_carry = w_WIRE_2 | w_WIRE_3;
 
 
  // FYI: Code above using wires will produce the same results as:
  // assign o_sum   = i_bit1 ^ i_bit2 ^ i_carry;
  // assign o_carry = (i_bit1 ^ i_bit2) & i_carry) | (i_bit1 & i_bit2);
 
  // Wires are just used to be explicit. 
   
endmodule // full_adder
