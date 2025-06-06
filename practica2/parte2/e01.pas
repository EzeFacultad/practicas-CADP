program Ejercicio1;

procedure suma(num1: integer; var num2:integer);
    begin
        num2 := num1 + num2;
        num1 := 0;
    end;

var
    i, x : integer;
begin
    read(x); { leo la variable x }
    for i:= 1 to 5 do
        suma(i,x);
    write(x); { imprimo las variable x }
end.

{
a. ¿Qué imprime si se lee el valor 10 en la variable x ?
    Rta: 25

b. Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por:
procedure suma(num1: integer; num2:integer);
    Rta: 10
    
c. Qué sucede si se cambia el encabezado del procedure por:
procedure suma(var num1: integer; var num2:integer);
    Rta: da error ya que la variable i es utilizada por el FOR
}