program e14;

const
    dimF = 1000;

type
    REG_participante = record
        cod: integer;
        pais,proyecto: String;
        rol,cantHoras: integer;
    end;

    vector = array[1..dimF] of REG_participante;
    vectorPrecios = array[1..5] of real;
    vectorContadorMonto = array[1..dimF] of real;
    vectorContadorProyecto = array[1..dimF] of integer;

procedure leer(var r: REG_participante);
begin
    write('Codigo: '); readln(r.cod);
    if (r.cod <> - 1) then
        begin
            write('Pais: '); readln(r.pais);
            write('Titulo proyecto: '); readln(r.proyecto);
            write('Rol: '); readln(r.rol);
            write('Cant. horas: '); readln(r.cantHoras);
        end;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
    r: REG_participante;
begin
    leer(r);
    while (dimL < dimF) and (r.cod <> - 1) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= r;
            leer(r);
        end;
end;

procedure recorrerVector(v:vector; dimL:integer; vp: vectorPrecios);
var
    x,totalHoras,minCod: integer;
    montoArg,minMonto: real;
    vcm: vectorContadorMonto;
    vcp: vectorContadorProyecto;
begin
    montoArg:= 0;
    totalHoras:= 0;
    minMonto:= 9999;

    for x:=1 to dimF do
        begin
            vcm[x]:= 0;
            vcp[x]:= 0;
        end;

    for x:=1 to dimL do
        begin
            // INCISO A
            if (v[x].pais = 'Argentina') then
                montoArg:= montoArg + vp[v[x].rol];
            
            // INCISO B
            if (v[x].rol = 3) then
                totalHoras:= totalHoras + v[x].cantHoras;
            
            // INCISO C
            vcm[v[x].cod]:= vcm[v[x].cod] + vp[v[x].rol];

            // INCISO D
            if (v[x].rol = 4) then
                vcp[v[x].cod]:= vcp[v[x].cod] + 1
        end;

    // INCISO A
    writeln('El monto total es de: ',montoArg);

    // INCISO B
    writeln('El total de horas del rol Administrador es: ',totalHoras);

    // INCISO C
    for x:=1 to dimF do
        begin
            if (minMonto > vcm[x]) then
                begin
                    minMonto:= vcm[x];
                    minCod:= x;
                end;
        end;
    writeln('El codigo de proyecto que gasto menos es: ',minCod);

    // INCISO D
    for x:=1 to dimF do
        writeln('La cantidad de arquitectos del proyecto ',x,' fueron de: ',vcp[x]);

end;

// programa principal
var
    v: vector;
    vp: vectorPrecios;
    dimL: integer;
begin
    dimL:= 0;
    cargarPrecios(vp); // se dispone
    cargarVector(v,dimL);
    recorrerVector(v,dimL,vp);
end.