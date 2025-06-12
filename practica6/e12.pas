program e12;

type
    REG_dispositivo = record
        version,pantalla,memoria: real;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_dispositivo;
        sig: Lista;
    end;


procedure crearLista(var L: Lista; r: REG_dispositivo);
var
    nue,ant,act: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    ant:= L;
    act:= L;
    while (act <> nil) and (act^.dato.version < r.version) do
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

procedure leer(var r: REG_dispositivo);
begin
    write('Version: '); readln(r.version);
    // como no indica condición de corte, se inventa una
    if (r.version <> -1) then
        begin
            write('Pantalla: '); readln(r.pantalla);
            write('Memoria: '); readln(r.memoria);
        end;
end;

procedure cargarLista(var L: Lista);
var
    r: REG_dispositivo;
begin
    leer(r);
    while (r.version <> -1) do
        begin
            crearLista(L,r);
            leer(r);
        end;
end;

procedure incisos(L: Lista);
var
    cantVersion,cant3gb5In,cantDispo: integer;
    version,sumaPulgadas: real;
begin
    cant3gb5In:= 0;
    sumaPulgadas:= 0;
    cantDispo:= 0;

    while (L <> nil) do
        begin
            cantVersion:= 0;
            version:= L^.dato.version;
            while (L <> nil) and (version = L^.dato.version) do
                begin
                    // INCISO A
                    cantVersion:= cantVersion + 1;

                    // INCISO B
                    if (L^.dato.memoria > 3) and (L^.dato.pantalla <= 5) then
                        cant3gb5In:= cant3gb5In + 1;

                    // INCISO C
                    cantDispo:= cantDispo + 1;
                    sumaPulgadas:= sumaPulgadas + L^.dato.pantalla;

                    L:= L^.sig;
                end;
            
            // INCISO A
            writeln('La cantdad de dispositivos con la version ',version,' es: ',cantVersion);
        end;
    
    // INCISO B
    writeln('La cant. de dispositivos con mas de 3gb memoria y a lo sumo pantalla de 5" son: ',cant3gb5In);

    // INCISO C
    writeln('El primedio de pulgadas en pantalla es: ',(sumaPulgadas/cantDispo):0:2);
end;


// programa principal
var
    L: Lista;
begin
    L:= nil;
    cargarLista(L);
    incisos(L);
end.