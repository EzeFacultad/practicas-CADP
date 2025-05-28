program e01;

// programa principal
var
    x,suma,cant,num: integer;
begin
    suma:= 0;
    cant:= 0;

    for x:=1 to 10 do
        begin
            write('Ingresar un numero: '); readln(num);
            suma:= suma + num;
            if (num > 5) then
                cant:= cant + 1;
        end;
    writeln('La suma de los numeros es: ',suma);
    writeln('La cantidad de numeros mayores a 5 es: ',cant);
end.