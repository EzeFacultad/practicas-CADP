program e01;

var
    a,b: integer;
begin
    write('Ingresar numero A: '); readln(a);
    write('Ingresar numero B: '); readln(b);

    if (a > b) then
        writeln('El mas grande es: ',a)
    else
        if (b > a) then
            writeln('El mas grande es: ',b)
        else
            writeln('Los numeros leidos son iguales');
end.