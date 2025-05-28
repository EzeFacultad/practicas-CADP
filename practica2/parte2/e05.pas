program e05;

// INCISO A
function parNum(numA, numB: integer): boolean;
begin
    parNum:= (numA * 2) = numB;
end;

procedure leer(var numA, numB: integer);
begin
    write('Numero A: '); readln(numA);
    write('Numero B: '); readln(numB);
end;

// programa principal
var
    numA, numB, total, cantPares: integer;
begin
    cantPares:= 0;
    total:= 0;

    // INCISO B
    leer(numA,numB);
    while (numA <> 0) and (numB <> 0) do
        begin
            if (parNum(numA,numB)) then
                cantPares:= cantPares + 1;

            total:= total + 1;

            leer(numA,numB);
        end;
    
    writeln('La cantidad de pares leidos fue: ',total);
    writeln('La cantidad de pares que cumplen la condicion es: ', cantPares);
end.