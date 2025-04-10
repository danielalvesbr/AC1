// -------------------------
// Preparacao
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

module nand_expr (output s,
                  input a,
                  input b);
  wire xnor_ab, nota, notb, nor_nots;

//NAND (XNOR (a, b), NOR (NOT(a),NOT (b)))

  xnor (xnor_ab, a, b);           
  not  (nota, a);
  not  (notb, b);
  nor  (nor_nots, nota, notb);   
  nand (s, xnor_ab, nor_nots);   
endmodule

module test_nand_expr;
  reg a, b;
  wire s;

  nand_expr dut (s, a, b);

  initial begin
    $display(" a b | s");
    $monitor(" %b %b | %b", a, b, s);

    a = 0; b = 0; #1;
    a = 0; b = 1; #1;
    a = 1; b = 0; #1;
    a = 1; b = 1; #1;
  end
endmodule