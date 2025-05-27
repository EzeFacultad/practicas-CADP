program e02;

var
    x: integer;
begin
    write('Ingresar un numero:'); readln(x);

    if (x < 0) then
        x:= x * -1;
        
    writeln('El valor absoluto es: ',x);
end.