program e13;

const
    dimF = 3600;
type
    REG_usuario = record
        email,revista: String;
        rol,cantDias: integer;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_usuario;
        sig: Lista;
    end;

    vectorContador = array[1..4] of integer;


procedure crearLista(var L: Lista; r: REG_usuario);
var
    ant,act,nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    ant:= L;
    act:= L;
    while (act <> nil) and (act^.dato.cantDias < r.cantDias) do
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

procedure informar(L: Lista);
begin
    while (L <> nil) do
        begin
            writeln('Usuario: ',L^.dato.email,' tiene ',L^.dato.cantDias,' dias inactivo');
            L:= L^.sig;
        end;
end;

procedure leer(var r: REG_usuario);
begin
    write('Email: '); readln(r.email);
    write('Revista: '); readln(r.revista);
    write('Rol: '); readln(r.rol);
    write('Cant dias inactivo: '); readln(r.cantDias);
end;

procedure incisoA(var L: Lista);
var
    r: REG_usuario;
    x,max1,max2: integer;
    vc: vectorContador;
    email1,email2: String;
begin
    for x:=1 to 4 do
        vc[x]:= 0;
    max1:= 0;
    max2:= 0;

    for x:=1 to dimF do
        begin
            leer(r);

            // INCISO A
            if (r.revista = 'Economica') then
                crearLista(L,r);

            // INCISO B
            vc[r.rol]:= vc[r.rol] + 1;

            // INCISO C
            if (max1 < L^.dato.cantDias) then
                begin
                    max2:= max1;
                    email2:= email1;
                    max1:= L^.dato.cantDias;
                    email1:= L^.dato.email;
                end
            else
                if (max2 < L^.dato.cantDias) then
                    begin
                        max2:= L^.dato.cantDias;
                        email2:= L^.dato.email;
                    end;
        end;
    
    // INCISO A
    informar(L);

    // INCISO B
    for x:=1 to 4 do
        writeln('El rol ',x,' tiene ',vc[x],' usuarios');
    
    // INCISO C
    writeln('Los 2 email con mas dias inactivos son: ',email1,' y ',email2);
end;


// programa principal
var
    L: Lista;
begin
    L:= nil;
    incisoA(L);
end.