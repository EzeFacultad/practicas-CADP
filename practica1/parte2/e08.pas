program e08;

// programa principal
var
    x, diaMax, cantVentas, max: integer;
    monto, montoTotal: real;
begin
    max:= 0;
    montoTotal:= 0;

    for x:=1 to 31 do
        begin
            cantVentas:= 0;

            write('Monto del dia ',x,': '); readln(monto);
            while (monto <> 0) do
                begin
                    cantVentas:= cantVentas + 1;
                    montoTotal:= montoTotal + monto;
                    write('Monto del dia ',x,': '); readln(monto);
                end;

                // INCISO A
                if (cantVentas > max) then
                    begin
                        max:= cantVentas;
                        diaMax:= x;
                    end;
            
            // enunciado
            writeln('El total de ventas del dia ',x,' fue de: ',cantVentas);
        end;
    
    // enunciado
    writeln('El monto total es de $',montoTotal);

    // INCISO A
    writeln('El dia en el que hubo mas ventas fue: ',diaMax);
end.