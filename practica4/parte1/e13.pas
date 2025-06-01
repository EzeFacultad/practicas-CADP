program e13;

const
    dimF = 50;

type
    vectorTemperatura = array[1..12] of real;
    vectorAnio = array[1..50] of vectorTemperatura;


procedure cargarTemp(var v: vectorTemperatura);
var
    x: integer;
begin
    for x:=1 to 12 do
        begin
            write('Temperatura: '); readln(v[x]);
        end;
end;
procedure cargarVector(var v: vectorAnio);
var
    x: integer;
begin
    for x:=1 to dimF do
        cargarTemp(v[x]);
end;

procedure recorrerVector(v: vectorAnio);
var
    anio,mes,anioMayorProm,anioMayorTemp: integer;
    sumaTemp,maxTemp,tempProm: real;
begin
    maxTemp:= 0;
    tempProm:= 0;
    for anio:=1 to dimF do
        begin
            sumaTemp:= 0;
            
            for mes:=1 to 12 do
                begin
                    // INCISO A
                    sumaTemp:= sumaTemp + v[anio][mes];

                    // INCISO B
                    if (maxTemp < v[anio][mes]) then
                        begin
                            maxTemp:= v[anio][mes];
                            anioMayorTemp:= anio;
                        end;
                end;
            
            // INCISO A
            if (tempProm < (sumaTemp / 12)) then
                begin
                    tempProm:= sumaTemp/12;
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