program e07;

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


procedure cargarLista(var L:lista; s: sonda);
var
    nue: lista;

begin
    new (nue);
    nue^.dato := s;
    nue^.sig := L;
    L := nue;
end;


// INCISO A
function cumple(s: sonda): Boolean;
var
    ok: Boolean;
begin
    // Esto es equivalente a lo de abajo
    //cumple:= (s.rango <> 2) and ((s.costoMant * s.duracion) < s.costoConstr);

    ok:= false;
    if (s.rango <> 2) and ((s.costoMant * s.duracion) < s.costoConstr) then
        ok:= true;
    
    cumple:= ok;
end;


procedure recorrerLista(L: lista; var LCumple, LNoCumple: lista);
begin
    while (L <> nil) do
        begin
            if (cumple(L^.dato)) then
                cargarLista(LCumple,L^.dato)
            else
                cargarLista(LNoCumple,L^.dato);
            
            L:= L^.sig;
        end;
end;

procedure incisoC(L: lista);
var
    cant: integer;
    total: real;
begin
    cant:= 0;
    total:= 0;

    while (L <> nil) do
        begin
            cant:= cant + 1;
            total:= total + (L^.dato.costoConstr + (L^.dato.duracion * L^.dato.costoMant));

            L:= L^.sig;
        end;
    
    writeln(cant,' ',total);
end;


var
    L,LCumple,LNoCumple: Lista;
begin
    Lcumple:= nil;
    LNocumple:= nil;
    cargarLista(L); // se dispone del ejercicio anterior
    // INCISO B
    recorrerLista(L,LCumple,LNoCumple);
    // INCISO C
    incisoC(LNoCumple);
end.