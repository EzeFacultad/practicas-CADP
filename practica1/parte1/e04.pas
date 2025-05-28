program e04;

// programa principal
var
    x, num: real;
begin
    write('Ingresar numero X: '); readln(x);
    x:= x * 2;

    write('Ingresar numero: '); readln(num);

    while (x <> num) do
        begin
            write('Ingresar numero: '); readln(num);
        end;
end.