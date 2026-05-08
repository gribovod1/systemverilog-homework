//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux
(
  input  d0, d1,
  input  sel,
  output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module xor_gate_using_mux
(
    input  a,
    input  b,
    output o
);

  // Task:
  // Implement xor gate using instance(s) of mux,
  // constants 0 and 1, and wire connections

 //  xor == (a || b) && !(a && b)
wire m_or_out;
mux m_or(a, 1'd1, b, m_or_out);
wire m_and_out;
mux m_and(1'd0, a, b, m_and_out);
wire not_and;
mux m_not(1'd1, 1'd0, m_and_out, not_and);
mux m_and_summ(1'd0, not_and, m_or_out, o);

endmodule
