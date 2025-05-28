program e08;

procedure incisos(num: integer; var sumaPar, cantImpar: integer);
var
    dig: integer;
begin
    while (num <> 0) do
        begin
            dig:= num mod 10;
            if ((dig mod 2) = 0) then
                sumaPar:= sumaPar + dig
            else
                cantImpar:= cantImpar + 1;

            num:= num div 10;
        end;
end;

// programa principal
var
    sumaPar,cantImpar,num: integer;
begin
    write('Numero: '); readln(num);
    while (num <> 123456) do
        begin
            sumaPar:= 0;
            cantImpar:= 0;
            incisos(num,sumaPar,cantImpar);

            writeln('La suma de los digitos pares es: ',sumaPar);
            writeln('La cantidad de digitos impares es: ',cantImpar);
            
            write('Numero: '); readln(num);
        end;
end.