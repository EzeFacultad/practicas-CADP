program e03;

type
    REG_viaje = record
        numViaje,codAuto: integer;
        dirOrigen,dirDestino: String;
        km: real;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_viaje;
        sig: Lista;
    end;


procedure crearOrdenado(var L: Lista; r: REG_viaje);
var
    nue,ant,act: Lista;
begin
    new(nue);
    nue^.dato:= r;

    ant:= L;
    act:= L;
    while (act <> nil) and (act^.dato.numViaje < r.numViaje) do
        begin
            ant:= act;
            act:= act^.sig;
        end;
    
    if (ant = act) then
        L:= nue
    else
        ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure incisos(L: Lista; var Ln: Lista);
var
    totalkm,km1,km2: real;
    codAuto,cod1,cod2: integer;
begin
    km1:= 0;
    km2:= 0;

    while (L <> nil) do
        begin
            codAuto:= L^.dato.codAuto;
            totalkm:= 0;
            while (L <> nil) and (codAuto = L^.dato.codAuto) do
                begin
                    // INCISO A
                    totalkm:= totalkm + L^.dato.km;

                    // INCISO B
                    if (L^.dato.km > 5) then
                        crearOrdenado(Ln,L^.dato);

                    L:= L^.sig;
                end;
            
            // INCISO A
            if (km1 < totalkm) then
                begin
                    km2:= km1;
                    cod2:= cod1;
                    km1:= totalkm;
                    cod1:= codAuto;
                end
            else
                if (km2 < totalkm) then
                    begin
                        km2:= totalkm;
                        cod2:= codAuto;
                    end;
        end;
    
    // INCISO A
    writeln('Los 2 autos que mas recorrieron fueron: ',cod1,' y ',cod2);
end;


// programa principal
var
    L,Ln: Lista;
begin
    L:= nil;
    Ln:= nil;
    cargarLista(L); // se dispone
    incisos(L,Ln);
end.