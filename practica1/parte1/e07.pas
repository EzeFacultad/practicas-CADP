program e07;

// programa principal
var
    cod: integer;
    precioAct, precioNue: real;
begin
    repeat
        write('Codigo: '); readln(cod);
        write('Precio actual: '); readln(precioAct);
        write('Precio nuevo: '); readln(precioNue);

        if (precioNue <= (precioAct * 1.1)) then
            writeln('El aumento de precio del producto ',cod,' no supera el 10%')
        else
            writeln('El aumento de precio del producto ',cod,' es superior al 10%');

    until cod = 32767;
end.