program e09;

type
    REG_pelicula = record
        codPelicula,codGenero: integer;
        titulo: String;
        promedio: real;
    end;

    REG_critico = record
        dni,codPelicula: integer;
        nombre,apellido: String;
        puntaje: real;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_pelicula;
        sig: Lista;
    end;

    vectorContador = array[1..8] of real;


procedure actualizarYCargar(L: Lista; codPelicula: integer; prom: real; var codGenero: integer);
begin
    while (L <> nil) and (L^.dato.codPelicula <> codPelicula) do
        L:= L^.sig;

    L^.dato.promedio:= prom;

    // INCISO B
    codGenero:= L^.dato.codGenero;
end;

procedure recorrerVector(vc: vectorContador);
var
    max: real;
    x,cod: integer;
begin
    max:= 0;
    for x:=1 to 8 do
        if (max < vc[x]) then
            begin
                max:= vc[x];
                cod:= x;
            end;
    writeln('El genero con mas puntaje es: ',cod);
end;

function cumple(dni: integer): Boolean;
var
    par,impar: integer;
begin
    par:= 0;
    impar:= 0;
    while (dni <> 0) do
        begin
            if (((dni mod 10) mod 2) = 0) then
                par:= par + 1
            else
                impar:= impar + 1;
            dni:= dni div 10;
        end;

    cumple:= (par = impar);
end;

procedure leer(var r: REG_critico);
begin
    write('Cod. pelicula: '); readln(r.codPelicula);
    if (r.codPelicula <> -1) then
        begin
            write('D.N.I: '); readln(r.dni);
            write('Nombre: '); readln(r.nombre);
            write('Apellido: '); readln(r.apellido);
            write('Puntaje: '); readln(r.puntaje);
        end;
end;

procedure incisos(L: Lista);
var
    r: REG_critico;
    x,codPelicula,cantCriticos,codGenero: integer;
    sumaPuntaje: real;
    vc: vectorContador;
begin
    for x:=1 to 8 do
        vc[x]:= 0;

    leer(r);
    while (r.codPelicula <> -1) do
        begin
            codPelicula:= r.codPelicula;
            sumaPuntaje:= 0;
            cantCriticos:= 0;
            while (r.codPelicula <> -1) and (r.codPelicula = codPelicula) do
                begin
                    // INCISO A
                    sumaPuntaje:= sumaPuntaje + r.puntaje;
                    cantCriticos:= cantCriticos + 1;

                    // INCISO C
                    if (cumple(r.dni)) then
                        writeln(r.nombre,' ',r.apellido); 

                    leer(r);
                end;
            
            // INCISO A
            actualizarYCargar(L,codPelicula,(sumaPuntaje/cantCriticos),codGenero);
        end;
    
    // INCISO B
    recorrerVector(vc);
end;

procedure eliminar(var L: Lista; codPeli: integer);
var
    ant,act: Lista;
begin
    ant:= L;
    act:= L;
    while (act <> nil) and (act^.dato.codPelicula <> codPeli) do
        begin
            ant:= act;
            act:= act^.sig;
        end;
    
    if (act <> nil) then
        begin
            if (ant = act) then
                L:= L^.sig
            else
                ant^.sig:= act^.sig;
            dispose(act);
        end;
end;

procedure incisoC(L: Lista);
var
    codPeli: integer;
begin
    write('Cod. pelicula a eliminar: '); readln(codPeli);
    eliminar(L,codPeli);
end;


// programa principal
var
    L: Lista;
begin
    L:= nil;
    cargarLista(L); // se dispone
    incisos(L);
    incisoC(L);
end.