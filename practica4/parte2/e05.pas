program e05;

const
    dimF = 500;
type
    REG_fecha = record
        dia,mes,anio: integer;
    end;

    REG_cliente = record
        fecha: REG_fecha;
        categoria: char;
        codCiudad: integer;
        monto: real;
    end;

    REG_incisoC = record
        codCiudad,cant: integer;
    end;

    vector = array[1..dimF] of REG_cliente;
    vectorContador = array['A'..'F'] of integer;
    vector10Cont = array[1..2400] of integer;
    vector10 = array[1..10] of REG_incisoC;
    vectorMonto = array[1..12] of real;

procedure leer(var r: REG_cliente);
begin
    write('fecha:'); read(r.fecha.dia); read(r.fecha.mes); readln(r.fecha.anio);
    write('Categoria: '); readln(r.categoria);
    write('Codigo ciudad: '); readln(r.codCiudad);
    write('Monto: '); readln(r.monto);
end;

procedure cargarVector(var v: vector);
var
    x: integer;
    r: REG_cliente;
begin
    for x:=1 to dimF do
        begin
            leer(r);
            v[x]:= r;
        end;
end;

procedure incisoC(vc10: vector10Cont; var v10: vector10);
var
    x,i,j: integer;
begin
    for x:=1 to 10 do
        v10[x].cant:= 0;

    for x:=1 to 2400 do
        begin
            i:= 1;
            while (vc10[x] < v10[i].cant) do
                i:= i + 1;
            if (i <= 10) then
                begin
                    if (i < 10) then
                        for j:=10 downto i do
                            v10[j]:= v10[j - 1];
                    v10[i].cant:= vc10[x];
                    v10[i].codCiudad:= x;
                end;
        end;
end;

procedure incisoD(v: vector; vm: vectorMonto);
var
    x,cant: integer;
begin
    cant:= 0;
    for x:=1 to dimF do
        if (vm[v[x].fecha.mes] > v[x].monto) then
            cant:= cant + 1;
    
    writeln('La cantidad de clientes que superan el promedio es: ',cant);
end;

procedure incisos(v: vector);
var
    x,anio,mes,cantAnio,cantMes,maxCantAnio,maxAnio: integer;
    vc: vectorContador;
    vc10: vector10Cont;
    v10: vector10;
    vm: vectorMonto;
    i: char;
begin
    maxCantAnio:= 0;

    for i:= 'A' to 'F' do
        vc[i]:= 0; 

    for x:=1 to 2400 do
        vc10[x]:= 0;

    for x:=1 to 12 do
        vm[x]:= 0;

    x:= 1;
    while (x < dimF) do
        begin
            anio:= v[x].fecha.anio;
            cantAnio:= 0;
            while (x < dimF) and (anio = v[x].fecha.anio) do
                begin
                    mes:= v[x].fecha.mes;
                    cantMes:= 0;
                    while (x < dimF) and (mes = v[x].fecha.mes) do
                        begin
                            // INCISO A
                            cantMes:= cantMes + 1;

                            // INCISO B
                            vc[v[x].categoria]:= vc[v[x].categoria] + 1;

                            // INCISO C
                            vc10[v[x].codCiudad]:= vc10[v[x].codCiudad] + 1;

                            // INCISO D
                            vm[mes]:= vm[mes] + v[x].monto;
                        end;
                    
                    // INCISO A
                    writeln('El mes ',mes,' tuvo ',cantMes);
                    cantAnio:= cantAnio + cantMes;

                    // INCISO D
                    vm[mes]:= vm[mes] / cantMes;
                end;
            // INCISO A
            writeln('El anio ',anio,' tuvo ',cantAnio);
            if (maxCantAnio < cantAnio) then
                begin
                    maxCantAnio:= cantAnio;
                    maxAnio:= anio;
                end;
        end;
    // INCISO A
    writeln('El anio que mas clientes tuvo fue: ',maxAnio);

    // INCISO B
    for i:='A' to 'F' do
        writeln('Categoria ',i,': ',vc[i]);
    
    // INCISO C
    incisoC(vc10,v10);
    for x:=1 to 10 do
        writeln(v10[x].codCiudad);
    
    // INCISO D
    incisoD(v,vm);

end;

// programa principal
var
    v: vector;
begin
    cargarVector(v); // se dispone
    incisos(v);
end.