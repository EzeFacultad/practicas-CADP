program e02;

function sumar(x,y: integer): integer;
var
    i: integer;
begin
    sumar:= 0;
    for i:=x to y do
        sumar:= sumar + i;
end;

function multiplicar(x,y: integer): integer;
var
    i: integer;
begin
    multiplicar:= 1;
    for i:=x to y do
        multiplicar:= multiplicar * i;
end;

// programa principal
var
    i,x,y: integer;
begin
    for i:=1 to 10 do
        begin
            write('Numero X: '); readln(x);
            write('Numero Y: '); readln(y);
            writeln('La suma es: ',sumar(x,y));
            writeln('El producto es: ',multiplicar(x,y));
        end;
end.