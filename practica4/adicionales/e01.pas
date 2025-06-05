program e01;

const
    dimF = 10000;

type
    REG_computadora = record
        cod,paquetes,cuentas: integer;
        version: real;
    end;    

    vector = array[1..dimF] of REG_computadora;


procedure leer(var r: REG_computadora);
begin
    write('Codigo: '); readln(r.cod);
    if (r.cod <> -1) then
        begin
            write('Version: '); readln(r.version);
            write('Paquetes instalados: '); readln(r.paquetes);
            write('Cuentas: '); readln(r.cuentas);
        end;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
    pos,x: integer;
    r: REG_computadora;
begin
    for x:=1 to dimF do
        v[x].cod:= 0;

    leer(r);
    while (dimL < dimF) and (r.cod <> -1) do
        begin
            dimL:= dimL + 1;

            pos:= 1;
            while (v[pos].cod < r.cod) and (v[pos].cod <> 0) do
                pos:= pos + 1;
            if (pos < dimL) then
                for x:= dimL downto pos do
                    v[x]:= v[x - 1];
            v[pos]:= r;

            leer(r);
        end;
end;

procedure eliminar(var v: vector; var dimL: integer);
var
    x,pos: integer;
begin
    x:= 1;
    while(x <= dimL) do
        begin
            if (v[x].cod > 0) and (v[x].cod < 500) then
                begin
                    dimL:= dimL - 1;
                    for pos:=x to dimL do
                        v[pos]:= v[pos + 1];
                end
            else
                x:= x + 1;
        end;
end;

procedure incisos(v: vector; dimL: integer);
var
    x,cantVersion,cantCuentas,max: integer;
    maxVersion: real;
begin
    cantVersion:= 0;
    cantCuentas:= 0;
    max:= 0;
    for x:=1 to dimL do
        begin
            // INCISO A
            if (v[x].version = 18.04) or (v[x].version = 16.04) then
                cantVersion:= cantVersion + 1;
            
            // INCISO B
            cantCuentas:= cantCuentas + v[x].cuentas;
            
            // INCISO C
            if (max < v[x].paquetes) then
                begin
                    max:= v[x].paquetes;
                    maxVersion:= v[x].version;
                end;
        end;
    
    // INCISO A
    writeln('Las computadoras con esas versiones es: ',cantVersion);

    // INCISO B
    writeln('La cantidad prom. de cuentas es: ',(cantCuentas / dimL):0:2);

    // INCISO C
    writeln('La version con mas paquetes es: ',maxVersion);

    // INCISO D
    eliminar(v,dimL);
end;


// programa principal
var
    v: vector;
    dimL: integer;
begin
    dimL:= 0;
    cargarVector(v,dimL);

    incisos(v,dimL);
end.