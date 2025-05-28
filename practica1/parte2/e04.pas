program e04;

// programa principal
var
    x, num, min1, min2: integer;
begin
    min1:=9999;
    min2:=9999;

    // enunciado
    for x:=1 to 1000 do
        begin
            write('Ingresar numero: '); readln(num);
            if (min1 > num) then
                begin
                    min2:= min1;
                    min1:= num;
                end
            else
                if (min2 > num) then
                    min2:= num;
        end;
    
    writeln('Los 2 numeros mas chico son: ',min1,' y ',min2);

    // INCISO A
    min1:=9999;
    min2:=9999;
    repeat
        write('Ingresar numero: '); readln(num);
        if (min1 > num) then
            begin
                min2:= min1;
                min1:= num;
            end
        else
            if (min2 > num) then
                min2:= num;
    until num = 0;
    writeln('Los 2 numeros mas chico son: ',min1,' y ',min2);


    // INCISO B
    min1:=9999;
    min2:=9999;
    write('Ingresar numero: '); readln(num);
    while (num <> 0) do
        begin
            if (min1 > num) then
                begin
                    min2:= min1;
                    min1:= num;
                end
            else
                if (min2 > num) then
                    min2:= num;
            write('Ingresar numero: '); readln(num);
        end;
    writeln('Los 2 numeros mas chico son: ',min1,' y ',min2);
end.