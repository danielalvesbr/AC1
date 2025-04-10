// -------------------------
// Preparacao
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

module mux2to1 (output y, 
                input a, 
                input b, 
                input sel);

  assign y = (sel) ? b : a; // If 'sel' = 1, seleciona 'b'; else: seleciona 'a'
endmodule

module mux_expr (output s,
                 input a,
                 input b,
                 input c);
  wire not_a, not_b, not_c;
  wire m1, m2;

  not (not_a, a);
  not (not_b, b);
  not (not_c, c);

  mux2to1 mux1 (m1, a, b, c);          // MUX(a, b, c)
  mux2to1 mux2 (m2, not_b, not_a, c);  // MUX(NOT(b), NOT(a), c)
  mux2to1 mux3 (s, m1, m2, not_c);     // MUX(m1, m2, NOT(c))
endmodule

module test_mux_expr;
  reg a, b, c;
  wire s;

  mux_expr dut (s, a, b, c);

  initial begin
    $display(" a b c | s");
    $monitor(" %b %b %b | %b", a, b, c, s);

    a = 0; b = 0; c = 0; #1;
    a = 0; b = 0; c = 1; #1;
    a = 0; b = 1; c = 0; #1;
    a = 0; b = 1; c = 1; #1;
    a = 1; b = 0; c = 0; #1;
    a = 1; b = 0; c = 1; #1;
    a = 1; b = 1; c = 0; #1;
    a = 1; b = 1; c = 1; #1;
  end
endmodule