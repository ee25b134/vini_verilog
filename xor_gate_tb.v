`include "xor_gate.v"

module xor_gate_tb;

  reg a, b, c, d;
  wire y;
  
  // Reference (expected output)
  wire y_ref;
  
  // Mismatch signal
  wire mismatch;
  
  // Instantiate DUT (Device Under Test)
  xor_gate uut 
(
        .a(a),
        .b(b),
        .c(c),
        .d(d),

        .y(y)
    );
    
    // Hardcoded reference logic (same XOR behavior)
  assign y_ref = a^b^c^d;
  
  // Mismatch = 1 if output is wrong
  assign mismatch = (y !== y_ref);
  
  initial begin
      $dumpfile("xor_gate.vcd");  // waveform file
      $dumpvars(0, xor_gate_tb);
  
     for (integer i = 0; i < 16; i = i + 1) begin
            {a, b, c, d} = i;  // assign bits
            #10;
         end

      $monitor("a=%b b=%b c=%b d=%b y=%b y_ref=%b mismatch=%b", a, b, c, d, y, y_ref, mismatch);
      $finish;
  end

endmodule