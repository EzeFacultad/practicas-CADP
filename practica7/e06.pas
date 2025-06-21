program e06;

type
    REG_objeto = record
        codObjeto,categoria,anioDes: integer;
        nombreObj,nombreDes: String;
        distancia: real;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_objeto;
        sig: Lista;
    end;

    vectorContador = array[1..7] of integer;


procedure agregarAtras(var L, ult: Lista; r: REG_objeto);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;

    if (L = nil) then
        begin
            nue^.sig:= L;
            L:= nue;
        end
    else
        begin
            ult^.sig:= nue;
            ult:= nue;
        end;
end;

procedure leer(var r: REG_objeto);
begin
    write('Cod. objeto: '); readln(r.codObjeto);
    if (r.codObjeto <> -1) then
        begin
            write('Categoria: '); readln(r.categoria);
            write('Anio descubrimiento: '); readln(r.anioDes);
            write('Nombre objeto: '); readln(r.nombreObj);
            write('Nombre descubridor: '); readln(r.nombreDes);
            write('Distancia: '); readln(r.distancia);
        end;
end;

procedure cargarLista(var L: Lista);
var
    r: REG_objeto;
    ult: Lista;
begin
    leer(r);
    while (r.codObjeto <> -1) do
        begin
            agregarAtras(L,ult,r);
            leer(r);
        end;
end;

function masPares(cod: integer): boolean;
var
    par,impar: integer;
begin
    par:= 0;
    impar:= 0;
    while (cod <> 0) do
        begin
            if (((cod mod 10) mod 2) = 0) then
                par:= par + 1
            else
                impar:= impar + 1;
            cod:= cod div 10;
        end;
    masPares:= (par > impar);
end;

procedure recorrerLista(L: Lista);
var
    lejos1,lejos2: real;
    codLejos1,codLejos2,cantPlanetas,x: integer;
    vc: vectorContador;
begin
    lejos1:= 0;
    lejos2:= 0;
    cantPlanetas:= 0;
    for x:=1 to 7 do
        vc[x]:= 0;

    while (L <> nil) do
        begin
            // INCISO B1
            if (lejos1 < L^.dato.distancia) then
                begin
                    lejos2:= lejos1;
                    codLejos2:= codLejos1;
                    lejos1:= L^.dato.distancia;
                    codLejos1:= L^.dato.codObjeto;
                end
            else
                if (lejos2 < L^.dato.distancia) then
                    begin
                        lejos2:= L^.dato.distancia;
                        codLejos2:= L^.dato.codObjeto;
                    end;
            
            // INCISO B2
            if (L^.dato.nombreDes = 'Galileo Galilei') and (L^.dato.anioDes < 1600) and (L^.dato.categoria = 2) then
                cantPlanetas:= cantPlanetas + 1;

            // INCISO B3
            vc[L^.dato.categoria]:= vc[L^.dato.categoria] + 1;

            // INCISO B4
            if (masPares(L^.dato.codObjeto)) and (L^.dato.categoria = 1) then
                writeln(L^.dato.nombreObj);

            L:= L^.sig;
        end;
    
    // INCISO B1
    writeln('Los 2 objetos mas lejos son el del codigo: ',codLejos1,' y ',codLejos2);

    // INCISO B2
    writeln('La cantidad de planetas que cumplen la condicion es: ',cantPlanetas);

    // INCISO B3
    for x:=1 to 7 do
        writeln('La categoria ',x,' tuvo: ',vc[x],' objetos observados');
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