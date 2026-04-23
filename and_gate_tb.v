`include "and_gate.v"
`timescale 1ns/1ps

module and_gate_tb;

  reg a, b;
  wire y;
  
  // Reference (expected output)
  wire y_ref;
  
  // Mismatch signal
  wire mismatch;
  
  // Instantiate DUT (Device Under Test)
  and_gate uut 
(
        .a(a),
        .b(b),
        .y(y)
    );
    
    // Hardcoded reference logic (same AND behavior)
  assign y_ref = a & b;
  
  // Mismatch = 1 if output is wrong
  assign mismatch = (y !== y_ref);
  
  initial begin
      $dumpfile("and_gate.vcd");  // waveform file
      $dumpvars(0, and_gate_tb);
  
      // Test all cases
      a = 0; b = 0; #10;
      a = 0; b = 1; #10;
      a = 1; b = 0; #10;
      a = 1; b = 1; #10;
      $monitor("a=%b b=%b y=%b y_ref=%b mismatch=%b", a, b, y, y_ref, mismatch);
      $finish;
  end

endmodule