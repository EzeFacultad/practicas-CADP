program e07;

procedure incisoA(num: integer; var suma, cantDig: integer);
begin
    while (num <> 0) do
        begin
            cantDig:= cantDig + 1;
            suma:= suma + (num mod 10);
            num:= num div 10;
        end;
end;

// programa principal
var
    num,suma,cantDig: integer;
begin
    cantDig:= 0;
    
    // INCISO B
    repeat
        suma:= 0;
        write('Ingresar un numero: '); readln(num);
        incisoA(num,suma,cantDig);
    until suma = 10;

    writeln('La cantidad de digitos leidos fue: ',cantDig);
end.