program e16;

type
    REG_corredor = record
        nombre,apellido,pais,ciudadIni,ciudadFin: String;
        distancia: real;
        tiempo: integer;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_corredor;
        sig: Lista;
    end;


procedure crearLista(var L: Lista; r: REG_corredor);
var
    nue,ant,act: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    ant:= L;
    act:= L;
    while (act <> nil) and (act^.dato.ciudadIni < r.ciudadIni) do
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

procedure leer(r: REG_corredor);
begin
    write('Distancia: '); readln(r.distancia);
    if (r.distancia <> -1) then
        begin
            write('Nombre: '); readln(r.nombre);
            write('Apellido: '); readln(r.apellido);
            write('Pais: '); readln(r.pais);
            write('Ciudad inicio: '); readln(r.ciudadIni);
            write('Ciudad fin: '); readln(r.ciudadFin);
            write('Tiempo: '); readln(r.tiempo);
        end;
end;

procedure cargarLista(var L: Lista);
var
    r: REG_corredor;
begin
    leer(r);
    while (r.distancia <> - 1) do
        begin
            crearLista(L,r);
            leer(r);
        end;
end;

procedure recorrerLista(L: Lista);
var
    totalCorredor,totalTiempo,max,sumaCorredores,sumaTiempo,ciudadDif: integer;
    totalDistancia,maxDistancia,sumaDistancia,promBrasil,promBoston: real;
    ciudad,maxCiudad,pais: String;
begin
    totalCorredor:= 0;
    totalDistancia:= 0;
    totalTiempo:= 0;
    max:= 0;
    ciudadDif:= 0;

    while (L <> nil) do
        begin
            ciudad:= L^.dato.ciudadIni;
            sumaCorredores:= 0;
            sumaDistancia:= 0;
            sumaTiempo:= 0;
            pais:= L^.dato.pais;

            while (L <> nil) and (ciudad = L^.dato.ciudadIni) do
                begin

                    // PUNTO 2 y 1
                    sumaCorredores:= sumaCorredores + 1;
                    sumaDistancia:= sumaDistancia + L^.dato.distancia;

                    // PUNTO 4
                    if (ciudad <> L^.dato.ciudadFin) then
                        ciudadDif:= ciudadDif + 1;

                    // PUNTO 5 y 1
                    sumaTiempo:= sumaTiempo + L^.dato.tiempo;

                    L:= L^.sig;
                end;

            // PUNTO 1
            totalCorredor:= totalCorredor + sumaCorredores;
            totalDistancia:= totalDistancia + sumaDistancia;
            totalTiempo:= totalTiempo + sumaTiempo;

            // PUNTO 2
            if (max < sumaCorredores) then
                begin
                    max:= sumaCorredores;
                    maxCiudad:= ciudad;
                    maxDistancia:= sumaDistancia;
                end;

            // PUNTO 3
            if (pais = 'Brasil') then
                promBrasil:= (sumaDistancia / sumaCorredores);

            // PUNTO 5
            if (ciudad = 'Boston') then
                promBoston:= (sumaDistancia / sumaTiempo);

        end;

    // PUNTO 1
    writeln('Tiempo total: ',totalTiempo,' | Distancia total: ',totalDistancia,' | Cant. corredores: ',totalCorredor);
    
    // PUNTO 2
    writeln('La ciudad y suma de distancias donde hubo mas corredores es: ',maxCiudad,' y ',maxDistancia);

    // PUNTO 3
    writeln('La distancia promedio en Brasil fue: ',promBrasil:0:2);

    // PUNTO 4
    writeln('La cantidad de corredores que llegaron a ciudades diferentes es: ',ciudadDif);

    // PUNTO 5
    writeln('El tiempo promedio de los corredores de Boston es: ',promBoston);
end;


// programa principal
var
    L: Lista;
begin
    L:= nil;
    cargarLista(L);
    recorrerLista(L);
end.