program e05;

// programa principal
var
    num, max, min, suma: integer;
begin
    suma:= 0;
    max:= 0;
    min:= 9999;

    repeat
        write('Ingresar numero: '); readln(num);

        if (max < num) then
            max:= num;
        
        if (min > num) then
            min:= num;

        suma:= suma + num;

    until num = 100;

    writeln('El numero maximo leido fue: ',max);
    writeln('El numero minimo leido fue: ',min);
    writeln('La suma de los numeros es: ', suma);
end.