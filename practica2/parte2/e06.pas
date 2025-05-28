program e06;

procedure incisos (var cod1,cod2,codPant: integer; var suma: real);
var
    precio,min1,min2,max: real;
    cod,x: integer;
    tipo: String;
begin
    min1:= 9999;
    min2:= 9999;
    max:= 0;
    for x:=1 to 100 do
        begin
            write('Precio: '); readln(precio);
            write('Codigo: '); readln(cod);
            write('Tipo: '); readln(tipo);

            // INCISO I
            if (min1 > precio) then
                begin
                    min2:= min1;
                    cod2:= cod1;
                    min1:= precio;
                    cod1:= cod;
                end
            else
                if (min2 > precio) then
                    begin
                        min2:= precio;
                        cod2:= cod;
                    end;

            // INCISO II
            if (max < precio) and (tipo = 'pantalon') then
                begin
                    max:= precio;
                    codPant:= cod;
                end;
            
            // INCISO III
            suma:= suma + precio;
        end;
end;

// programa principal
var
    cod1,cod2,codPant: integer;
    suma: real;
begin
    suma:= 0;
    incisos(cod1,cod2,codPant,suma);
    
    writeln('Los 2 productos mas baratos fueron el del codigo ',cod1,' y ',cod2);
    writeln('El codigo de pantalon mas caro es: ',codPant);
    writeln('El precio promedio es: ',(suma/100):0:2);
end.