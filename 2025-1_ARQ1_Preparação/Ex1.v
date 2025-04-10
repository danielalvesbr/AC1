// -------------------------
// Preparacao
// Nome: Daniel Alves Goncalves
// Matricula: 874770
// -------------------------

module preparacao (
  output a, 
  output b, 
  output c, 
  output d, 
  output e, 
  output f,
  input A, 
  input B, 
  input C, 
  input D);

  assign a = (~A & ~B & C & ~D) |
             (~A & B & C & ~D)  |
             (~A & B & C & D)   |
             (A & B & ~C & ~D)  |
             (A & B & C & ~D)   |
             (A & B & C & D);

  assign b = (A | B | C | D) &
             (A | B | C | ~D) &
             (A | B | ~C | ~D) &
             (A | ~B | C | D) &
             (A | ~B | C | ~D) &
             (~A | B | C | D) &
             (~A | B | C | ~D) &
             (~A | B | ~C | D) &
             (~A | B | ~C | ~D) &
             (~A | ~B | C | ~D);

  assign c = (B & C) | (~A & C & ~D) | (A & B & ~D);
  assign d = (A | ~C) & (C | ~D) & (~A | B) & (B | ~D);
  assign e = ~((~(B & C)) & ~(~A & C & ~D) & ~(A & B & ~D));
  assign f = ~((~(A | ~C)) | (~(C | ~D)) | (~(~A | B)) | (~(B | ~D)));

endmodule

module test_preparacao;
  reg A, B, C, D;
  wire a, b, c, d, e, f;

  preparacao Teste (a, b, c, d, e, f, A, B, C, D);

  initial begin
    $display("Variavel | Alternativa");
    $display(" A B C D | a b c d e f");
    $display("______________________");
    $monitor(" %b %b %b %b | %b %b %b %b %b %b", A, B, C, D, a, b, c, d, e, f);

    A = 0; B = 0; C = 0; D = 0;
    repeat (16) begin
      #1 {A, B, C, D} = {A, B, C, D} + 1;
    end
  end
endmodule

