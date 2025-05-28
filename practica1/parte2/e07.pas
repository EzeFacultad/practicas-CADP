program e07;

// programa principal
var
    nombre, codMin1, codMin2, codMax1, codMax2: String;
    tiempo, x, min1, min2, max1, max2: integer;
begin
    min1:= 9999;
    min2:= 9999;
    max1:= 0;
    max2:= 0;

    for x:=1 to 100 do
        begin
            write('Nombre: '); readln(nombre);
            write('Tiempo: '); readln(tiempo);

            if (max1 < tiempo) then
                begin
                    max2:= max1;
                    codMax2:= codMax1;
                    max1:= tiempo;
                    codMax1:= nombre;
                end
            else
                if (max2 < tiempo) then
                begin
                    max2:= tiempo;
                    codMax2:= nombre;
                end;
            
            if (min1 > tiempo) then
                begin
                    min2:= min1;
                    codMin2:= codMin1;
                    min1:= tiempo;
                    codMin1:= nombre;
                end
            else
                if (min2 > tiempo) then
                    begin
                        min2:= tiempo;
                        codMin2:= nombre;
                    end;
        end;
end.