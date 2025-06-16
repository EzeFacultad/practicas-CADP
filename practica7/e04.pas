program e04;

const
    dimF = 42;
type
    REG_peso = record
        semana: integer;
        peso: real;
    end;

    vectorSemanas = array[1..dimF] of REG_peso;

    REG_embarazada = record
        nom,ape: String;
        dimL: integer;
        semanas: vectorSemanas;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_embarazada;
        sig: Lista;
    end;


function semana(v: vectorSemanas; dimL: integer): real;
var
    x: integer;
begin
    semana:= 0;
    for x:=1 to dimL do
        if (v[x].peso > semana) then
            semana:= v[x].peso;
end;

procedure incisos(L: Lista);
begin
    while (L <> nil) do
        begin
            // INCISO A
            writeln('La embarazada ',L^.dato.ape,' tuvo el mayor peso la semana ',semana(L^.dato.semanas,L^.dato.dimL));

            // INCISO B
            writeln('La embarazada ',L^.dato.ape,' aumento ',(L^.dato.semanas[L^.dato.dimL].peso - L^.dato.semanas[1].peso):0:2);

            L:= L^.sig;
        end;
end;


// programa principal
var
    L: Lista;
begin
    L:= nil;
    cargarLista(L); // se dispone
    incisos(L);
end.