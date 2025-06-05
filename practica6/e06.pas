program p6eje6;

type
    espec = 1 .. 7;

    sonda = record
        nombre: string;
        duracion: integer;
        costoConstr: real;
        costoMant: real;
        rango: espec;
    end;

    lista = ^nodo;

    nodo = record
        dato: sonda;
        sig: lista;
    end;

    vectorRangos = array [1..7] of integer;


procedure cargarLista(var L:lista; s: sonda);
var
    nue: lista;

begin
    new (nue);
    nue^.dato := s;
    nue^.sig := L;
    L := nue;
end;

procedure leer(var s: sonda);
begin
    readln(s.nombre);
    readln(s.duracion);
    readln(s.costoConstr);
    readln(s.costoMant);
    readln(s.rango);
end;

procedure crearLista(var L: lista);
var
    s: sonda;
begin
    repeat
        leer(s);
        cargarLista(L,s);
    until s.nombre = 'Gaia';
end;


procedure obtenerPromedios(L: lista; var promDuracion, promMontoConst: real);
var
    sumaMonto: real;
    cant,sumaDuracion: integer;
begin
    sumaMonto:= 0;
    sumaDuracion:= 0;
    cant:= 0;
    while (L <> nil) do
        begin
            cant:= cant + 1;
            sumaDuracion:= sumaDuracion + L^.dato.duracion;
            sumaMonto:= sumaMonto + L^.dato.costoConstr;

            L:= L^.sig;
        end;
    
    promDuracion:= sumaDuracion / cant;
    promMontoConst:= sumaMonto / cant;
end;


procedure incisos(L: lista);
var
    maxCostosa,promMontoConst,promDuracion: real;
    maxNom: String;
    x,cantSondaDur,cantSondaCosto: integer;
    vc: vectorRangos;
begin
    maxCostosa:= 0;
    for x:=1 to 7 do
        vc[x]:= 0;
    
    obtenerPromedios(L,promDuracion,promMontoConst);
    cantSondaDur:= 0;
    cantSondaCosto:= 0;

    while (L <> nil) do
        begin
            // INCISO A
            if (((L^.dato.costoMant * L^.dato.duracion) + L^.dato.costoConstr) > maxCostosa) then
                begin
                    maxCostosa:= (L^.dato.costoMant * L^.dato.duracion) + L^.dato.costoConstr;
                    maxNom:= L^.dato.nombre;
                end;
            
            // INCISO B
            vc[L^.dato.rango]:= vc[L^.dato.rango] + 1;

            // INCISO C
            if (L^.dato.duracion > promDuracion) then
                cantSondaDur:= cantSondaDur + 1;

            // INCISO D
            if (L^.dato.costoConstr > promMontoConst) then
                cantSondaCosto:= cantSondaCosto + 1;

            L:= L^.sig;
        end;
    
    // INCISO A
    writeln('Sonda mas costosa: ',maxNom);

    // INCISO B
    for x:=1 to 7 do
        writeln(vc[x]);

    // INCISO C
    writeln(cantSondaDur);

    // INCISO D
    writeln(cantSondaCosto);
end;

var
    L: Lista;
begin
    L:= nil;
    crearLista(L);
    incisos(L);
end.