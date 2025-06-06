program e13;

const
    dimF = 2024;

type
    vectorTemperatura = array[1..100] of real;
    vectorAnio = array[1974..dimF] of vectorTemperatura;


procedure cargarTempProm(var v: vectorTemperatura);
var
    x: integer;
begin
    for x:=1 to 100 do
        begin
            write('Temperatura: '); readln(v[x]);
        end;
end;
procedure cargarVector(var v: vectorAnio);
var
    x: integer;
begin
    for x:=1 to dimF do
        cargarTempProm(v[x]);
end;

procedure recorrerVector(v: vectorAnio);
var
    anio,punto,anioMayorProm,anioMayorTemp: integer;
    sumaTemp,maxTemp,tempProm: real;
begin
    maxTemp:= 0;
    tempProm:= 0;
    for anio:=1974 to dimF do
        begin
            sumaTemp:= 0;
            
            for punto:=1 to 100 do
                begin
                    // INCISO A
                    sumaTemp:= sumaTemp + v[anio][punto];

                    // INCISO B
                    if (maxTemp < v[anio][punto]) then
                        begin
                            maxTemp:= v[anio][punto];
                            anioMayorTemp:= anio;
                        end;
                end;
            
            // INCISO A
            if (tempProm < (sumaTemp / 100)) then
                begin
                    tempProm:= sumaTemp / 100;
                    anioMayorProm:= anio;
                end;
        end;
    
    // INCISO A
    writeln('El anio con mayor temperatura promedio fue ',anioMayorProm);

    // INCISO B
    writeln('El anio que detector mayor temperatura en el mes fue: ',anioMayorTemp);
end;

// programa principal
var
    v: vectorAnio;
begin
    cargarVector(v);
    recorrerVector(v);
end.