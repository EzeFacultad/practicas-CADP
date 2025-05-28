// ======================= PROGRAMA 1
program alcance4a;

var a,b: integer;

procedure uno;
    begin
        a := 1;
        writeln(a);
    end;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.



// ======================= PROGRAMA 2
program alcance4b;

procedure uno;
    begin
        a := 1;
        writeln(a);
    end;
var 
    a,b: integer;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.

{
Programa 1:
Las variables estan declaradas de manera global, lo que
permite que puedan ser usadas en cualquier lugar del programa.
En el proceso imprime: 1.

En el programa principal imprime: 2, 1.

Programa 2:
Da error ya que las variables están declaradas en el programa principal.
Esto hace que no pueda asignarse un valor ni imprimir en el proceso "uno"
ya que la variable "a" no fue pasada como parámetro.
}