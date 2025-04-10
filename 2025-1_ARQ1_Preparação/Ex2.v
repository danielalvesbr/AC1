// -------------------------
// Preparacao
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

module f (
  output s,
  input x,
  input y);

  wire w1, w2, w3, w4, w5;

  not NOT_1 (w1, x);
  not NOT_2 (w2, y);
  and AND_1 (w3, y, w2);
  or  OR_1  (w4, w1, x);
  not NOT_3 (w5, w4);
  and AND_2 (s, w3, w5);

endmodule

module test_f;
  reg x, y;
  wire s;

  f dut (s, x, y);

  initial begin
    $display(" x y | s");
    $monitor(" %b %b | %b", x, y, s);

    x = 0; y = 0; #1;
    x = 0; y = 1; #1;
    x = 1; y = 0; #1;
    x = 1; y = 1; #1;
  end
endmodule
