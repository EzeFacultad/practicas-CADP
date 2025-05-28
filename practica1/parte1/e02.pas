program e02;

// programa principal
var
    : integer;
begin
    write('Ingresar un numero:'); readln(num);

    if (num < 0) then
        num:= num * -1;
        
    writeln('El valor absoluto es: ',num);
end.