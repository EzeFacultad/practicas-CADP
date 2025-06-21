program e05;

type
    REG_camion = record
        patente: String;
        anioFabricacion: integer;
        capacidad: real;
    end;

    REG_viaje = record
        codViaje,codCamion,anioViaje,dni: integer;
        distancia: real;
        ciudadDestino: String;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_viaje;
        sig: Lista;
    end;

    vectorCamion = array[1..100] of REG_camion;
    vectorContador = array[1..100] of real;


procedure crearLista(var L: Lista; r: REG_viaje);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
end;

procedure leer(var r: REG_viaje);
    begin
        write('Cod. viaje: '); readln(r.codViaje);
        if (r.codViaje <> -1) then
            begin
                write('Cod. camion: '); readln(r.codCamion);
                write('Anio viaje: '); readln(r.anioViaje);
                write('D.N.I: '); readln(r.dni);
                write('Distancia: '); readln(r.distancia);
                write('Ciudad destino: '); readln(r.ciudadDestino);
            end;
    end;

procedure cargarLista(var L: Lista);
var
    r: REG_viaje;
begin
    leer(r);
    while (r.codViaje <> -1) do
        begin
            crearLista(L,r);
            leer(r);
        end;
end;

procedure recorrerVector(vContador: vectorContador; vc: vectorCamion);
var
    max,min: real;
    x,codMax,codMin: integer;
begin
    codMax:= 0;
    codMin:= 9999;

    for x:=1 to 100 do
        begin
            if (max < vContador[x]) then
                begin
                    max:= vContador[x];
                    codMax:= x;
                end;
            if (min > vContador[x]) then
                begin
                    min:= vContador[x];
                    codMin:= x;
                end;
        end;
    
    writeln('El camion que mas recorrio fue ',vc[codMax].patente,' y el que menos recorrio fue ',vc[codMin].patente);
end;

function digitosImpares(dni: integer): boolean;
begin
    digitosImpares:= true;
    while (dni <> 0) and (digitosImpares) do
        begin
            if (((dni mod 10) mod 2) = 0) then
                digitosImpares:= false
            else
                dni:= dni div 10;
        end;
end;

procedure incisos(L: Lista; vc: vectorCamion);
var
    vContador: vectorContador;
    x,cant,cantImpares: integer;
begin
    for x:=1 to 100 do
        vContador[x]:= 0;

    cant:= 0;
    cantImpares:= 0;

    while (L <> nil) do
        begin
            // INCISO A
            vContador[L^.dato.codCamion]:= vContador[L^.dato.codCamion] + L^.dato.distancia;

            // INCISO B
            if (vc[L^.dato.codCamion].capacidad > 30) and ((L^.dato.anioViaje - vc[L^.dato.codCamion].anioFabricacion) > 5) then
                cant:= cant + 1;

            // INCISO C
            if (digitosImpares(L^.dato.dni)) then
                cantImpares:= cantImpares + 1;

            L:= L^.sig;
        end;
    
    // INCISO A
    recorrerVector(vContador,vc);

    // INCISO B
    writeln('La cantidad de camiones que cumplen la condicion es: ',cant);

    // INCISO C
    writeln('La cantidad de choferes con dni con dig impares es: ',cantImpares);
end;


// programa principal
var
    L: Lista;
    vc: vectorCamion;
begin
    L:= nil;
    cargarVector(vc); // se dispone
    cargarLista(L);
    incisos(L,vc);
end.
