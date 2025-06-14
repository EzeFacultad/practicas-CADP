program e15;

type
    REG_alumno = record
        dni: integer;
        apellido,nombre: String;
        nota: real;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato : REG_alumno;
        sig: Lista;
    end;


procedure cargarLista(var L: Lista; r: REG_alumno);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
end;

procedure inciso(L: Lista; var L1,L2,L3,L4,L5: Lista);
var
    asig14,asig2,asig3: boolean;
begin
    asig14:= true;
    asig2:= true;
    asig3:= true;

    while (L <> nil) do
        begin
            if (L^.dato.nota >= 8) then
                begin
                    if (asig14) then
                        cargarLista(L1,L^.dato)
                    else
                        cargarLista(L4,L^.dato);
                    
                    asig14:= not(asig14);
                end;
            
            if (L^.dato.nota > 5) and (L^.dato.nota < 8) then
                begin
                    if (asig2) then
                        begin
                            cargarLista(L2,L^.dato);
                            asig2:= false;
                        end
                    else
                        if (asig3) then
                            begin
                                cargarLista(L3,L^.dato);
                                asig3:= false;
                            end
                        else
                            begin
                                cargarLista(L5,L^.dato);
                                asig2:= true;
                                asig3:= true;
                            end;
                end;

            L:= L^.sig;
        end;
end;

procedure imprimir(L1,L2,L3,L4,L5: Lista);
begin
    while (L1 <> nil) do
        begin
            writeln('D.N.I: ',L1^.dato.dni,' | Nombre: ',L1^.dato.nombre,' | Apellido: ',L1^.dato.apellido,' | Nota: ',L1^.dato.nota);
            L1:= L1^.sig;
        end;

    while (L2 <> nil) do
        begin
            writeln('D.N.I: ',L2^.dato.dni,' | Nombre: ',L2^.dato.nombre,' | Apellido: ',L2^.dato.apellido,' | Nota: ',L2^.dato.nota);
            L2:= L2^.sig;
        end;
    
    while (L3 <> nil) do
        begin
            writeln('D.N.I: ',L3^.dato.dni,' | Nombre: ',L3^.dato.nombre,' | Apellido: ',L3^.dato.apellido,' | Nota: ',L3^.dato.nota);
            L3:= L3^.sig;
        end;
    
    while (L4 <> nil) do
        begin
            writeln('D.N.I: ',L4^.dato.dni,' | Nombre: ',L4^.dato.nombre,' | Apellido: ',L4^.dato.apellido,' | Nota: ',L4^.dato.nota);
            L4:= L4^.sig;
        end;
    
    while (L5 <> nil) do
        begin
            writeln('D.N.I: ',L5^.dato.dni,' | Nombre: ',L5^.dato.nombre,' | Apellido: ',L5^.dato.apellido,' | Nota: ',L5^.dato.nota);
            L5:= L5^.sig;
        end;
end;

// programa principal
var
    L,L1,L2,L3,L4,L5: Lista;
begin
    L:= nil;
    L1:= nil;
    L2:= nil;
    L3:= nil;
    L4:= nil;
    L5:= nil;

    cargarListaInicial(L); // se dispone
    inciso(L,L1,L2,L3,L4,L5);
    imprimir(L1,L2,L3,L4,L5);
end.