program e11;

type
    REG_vuelo = record
        cod: integer;
        paisSalida,paisLlegada: String;
        cantKm,porcentajeOcu: real;
    end;

procedure leer(var r: REG_vuelo);
begin
    write('Codigo: '); readln(r.cod);
    if (r.cod <> 44) then
        begin
            write('Pais salida: '); readln(r.paisSalida);
            write('Pais llegada: '); readln(r.paisLlegada);
            write('Km recorridos: '); readln(r.cantKm);
            write('Porcentaje de ocupacion: '); readln(r.porcentajeOcu);
        end;
end;

procedure minYMax(km: real; cod: integer; var kmMax1,kmMax2,kmMin1,kmMin2: real; var cMax1,cMax2,cMin1,cMin2: integer);
begin
    // 2 maximos
    if (kmMax1 < km) then
        begin
            kmMax2:= kmMax1;
            cMax2:= cMax1;
            kmMax1:= km;
            cMax1:= cod;
        end
    else
        if (kmMax2 < km) then
            begin
                kmMax2:= km;
                cMax2:= cod;
            end;
    
    // 2 minimos
    if (kmMin1 > km) then
        begin
            kmMin2:= kmMin1;
            cMin2:= cMin1;
            kmMin1:= km;
            cMin1:= cod;
        end
    else
        if (kmMin2 > km) then
            begin
                kmMin2:= km;
                cMin2:= cod;
            end;
end;

procedure incisos(var cMax1,cMax2,cMin1,cMin2,cMasPaises,cVuelos5k,cVuelos10K: integer);
var
    r: REG_vuelo;
    km,kmMax1,kmMax2,kmMin1,kmMin2: real;
    cod,cantPaises,maxPaises: integer;
    paisSalida: String;
begin
    kmMax1:= 0;
    kmMax2:= 0;
    kmMin1:= 9999;
    kmMin2:= 9999;
    maxPaises:= 0;

    leer(r);
    while (r.cod <> 44) do
        begin
            km:= 0;
            cantPaises:= 0;
            cod:= r.cod;
            while (r.cod <> 44) and (cod = r.cod) do
                begin
                    paisSalida:= r.paisSalida;
                    while (r.cod <> 44) and (paisSalida = r.paisSalida) do
                        begin
                            // INCISO I
                            km:= km + r.cantKm;

                            // INCISO III
                            if (r.cantKm > 5000) and (r.porcentajeOcu < 60) then
                                cVuelos5k:= cVuelos5k + 1;
                            
                            // INCISO IV
                            if (r.cantKm < 10000) and ((r.paisLlegada = 'Australia') or (r.paisLlegada = 'Nueva Zelanda')) then
                                cVuelos10K:= cVuelos10K + 1;

                            leer(r);
                        end;

                    // INCISO II
                    cantPaises:= cantPaises + 1;

                end;
            
            // INCISO I
            minYMax(km,cod,kmMax1,kmMax2,kmMin1,kmMin2,cMax1,cMax2,cMin1,cMin2);

            // INCISO II
            if (maxPaises < cantPaises) then
                begin
                    maxPaises:= cantPaises;
                    cMasPaises:= cod;
                end;
        end;

end;

// programa principal
var
    codMax1,codMax2,codMin1,codMin2,codMasPaises: integer;
    cantVuelos5K,cantVuelos10k: integer;
begin
    cantVuelos5K:= 0;
    cantVuelos10k:= 0;
    
    incisos(codMax1,codMax2,codMin1,codMin2,codMasPaises,cantVuelos5K,cantVuelos10k);

    // INCISO I
    writeln('Los 2 aviones con mas km recorridos fueron: ',codMax1,' y ',codMax2);
    writeln('Los 2 aviones que menos km recorrienron fue: ',codMin1,' y ',codMin2);

    // INCISO II
    writeln('El avion que salio de mas paises diferentes fue: ',codMasPaises);

    // INCISO III
    writeln('La cantidad de vuelos de mas de 5.000km con menos de 60% ocupacion: ',cantVuelos5K);

    // INCISO IV
    writeln('La cantidad de vuelos con menos de 10.000km fue de: ',cantVuelos10k);
end.