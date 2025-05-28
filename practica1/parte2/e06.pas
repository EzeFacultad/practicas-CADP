program e06;

// programa principal
var
    x, cod, cant16, cod1, cod2: integer;
    precio, min1, min2: real;
begin
    min1:= 9999;
    min2:= 9999;
    cant16:= 0;
    
    for x:=1 to 200 do
        begin
            write('Codigo producto: '); readln(cod);
            write('Precio: '); readln(precio);

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
            
            if (precio > 16) and ((cod mod 2) = 0) then
                cant16:= cant16 + 1;
        end;
    
    writeln('Los codigos de los 2 productos mas baratos son: ',cod1,' y ',cod2);
    writeln('La cantidad de productos de mas de 16 pesos con codigo par son: ',cant16);
end.