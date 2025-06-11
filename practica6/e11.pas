program e11;

const
    dimF = 10;

type
    REG_alumno = record
        nroAlumno: integer;
        apellido: String;
        promedio: real;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato : REG_alumno;
        sig: Lista;
    end;

    vector = array[1..dimF] of REG_alumno;


procedure crearLista(var L: Lista; r: REG_alumno);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
end;

procedure leer(var r: REG_alumno);
begin
    write('Nro alumno: '); readln(r.nroAlumno);
    if (r.nroAlumno <> 0) then
        begin
            write('Apellido: '); readln(r.apellido);
            write('Promedio: '); readln(r.promedio);
        end;
end;

procedure cargarLista(var L: Lista);
var
    r: REG_alumno;
begin
    leer(r);
    while (r.nroAlumno <> 0) do
        begin
            crearLista(L,r);
            leer(r);
        end;
end;

procedure recorrerLista(L: Lista);
var
    v: vector;
    pos,x: integer;
begin
    for x:=1 to dimF do
        v[x].promedio:= 0;

    while (L <> nil) do
        begin
            pos:= 1;
            while (pos <= dimF) and (L^.dato.promedio < v[pos].promedio) do
                pos:= pos + 1;
            
            if (pos <= dimF) then
                if (pos < dimF) then
                    begin
                        x:= pos;
                        for x:=dimF downto pos do
                            v[x]:= v[x - 1];
                    end;
                v[pos]:= L^.dato;
            
            L:= L^.sig;
        end;
end;


// programa principal
var
    L: Lista;
begin
    L:= nil;
    // INCISO A
    cargarLista(L);
    // INCISO B
    recorrerLista(L);
end.