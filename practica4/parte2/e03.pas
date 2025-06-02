program e03;

const
    dimF = 200;

type
    REG_viaje = record
        dia: integer;
        monto,distancia: real;
    end;

    vector = array[1..dimF] of REG_viaje;
    vectorContador = array[1..31] of integer;

procedure leer(var r: REG_viaje);
begin
    write('Dia: '); readln(r.dia);
    write('Monto: '); readln(r.monto);
    write('Distancia: '); readln(r.distancia);
end;

procedure incisoA(var v: vector; var dimL: integer);
var
    r: REG_viaje;
begin
    leer(r);
    while (dimL < dimF) and (r.distancia <> 0) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= r;
            leer(r);
        end;
end;

procedure incisoB(v: vector; dimL: integer);
var
    r: REG_viaje;
    sumaMonto: real;
    vc: vectorContador;
    x: integer;
begin
    sumaMonto:= 0;
    r.monto:= 9999;
    for x:=1 to 31 do
        vc[x]:= 0;
    
    for x:=1 to dimL do
        begin
            // INCISO A
            sumaMonto:= sumaMonto + v[x].monto;

            // INCISO B
            if (r.monto > v[x].monto) then
                r:= v[x];
            
            // INCISO C
            vc[v[x].dia]:= vc[v[x].dia] + 1;
        end;
    
    // INCISO A
    writeln('El monto promedio es: ',(sumaMonto/dimL):0:2);
    // INCISO B
    writeln('La distancia y dia que menos recaudo fue: ',r.distancia,' el dia ',r.dia);
    // INCISO C
    writeln('Cantidad de recaudaciones por dia:');
    for x:=1 to 31 do
        write(vc[x],', ');
end;

procedure incisoC(var v:vector; var dimL: integer);
var
    x,pos: integer;
begin
    pos:= 1;
    while (pos < dimL) do
        begin
            if (v[pos].distancia = 100) then
                begin
                    dimL:= dimL - 1;
                    for x:= pos to dimL do
                        v[x]:= v[x + 1];
                end
            else
                pos:= pos + 1;
        end;
    
    if (v[pos].distancia = 100) then
        dimL:= dimL - 1
end;

// programa principal
var
    v: vector;
    dimL: integer;
begin
    dimL:= 0;
    incisoA(v,dimL);
    incisoB(v,dimL);
end.