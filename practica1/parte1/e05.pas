program e05;

// programa principal
var
    x, num: real;
    dim: integer;
begin
    write('Ingresar numero X: '); readln(x);
    x:= x * 2;

    write('Ingresar numero: '); readln(num);
    dim:= 1;
    while (x <> num) and (dim < 10) do
        begin
            dim:= dim + 1;
            write('Ingresar numero: '); readln(num);
        end;
    
    if (dim = 10) then
        writeln('No se ingreso un numero doble que X');
end.