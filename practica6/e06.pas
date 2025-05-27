program e06;
type
    REG_satelite = record
        nombre: string;
        duracion, espectro: integer;
        costo_const, costo_mante: real;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_satelite;
        sig: Lista;
    end;

    vector_contador = array[1..7] of integer;


procedure crearLista(var L: Lista; r: REG_satelite);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
end;

procedure leer(var r: REG_satelite);
begin
    readln(r.nombre);
    readln(r.duracion);
    readln(r.costo_const);
    readln(r.costo_mante);
    readln(r.espectro);
end;

procedure cargarLista(var L: Lista);
var
    r: REG_satelite;
begin
    repeat
        leer(r);
        crearLista(L,r);
    until r.nombre = 'Gaia';
end;


procedure calcularPromedios(L: Lista; var promDuracion, promCosto: real);
var
    cant: integer;
begin
    cant:= 0;
    while (L <> nil) do
        begin
            cant:= cant + 1;
            promDuracion:= promDuracion + L^.dato.duracion;
            promCosto:= promCosto + L^.dato.costo_const;
        end;
    
    promDuracion:= promDuracion / cant;
    promCosto:= promCosto / cant;
end;

procedure incisos(L:Lista);
var
    x,cantSondas: integer;
    nomCostosa: String;
    vc: vector_contador;
    masCostosa,promDuracion, promCosto: real;
begin
    masCostosa:= 0;
    for x:=1 to 7 do
        vc[x]:= 0;
    promDuracion:= 0;
    promCosto:= 0;
    calcularPromedios(L,promDuracion,promCosto);

    cantSondas:= 0;

    while (L <> nil) do
        begin
            // INCISO A
            if (masCostosa < (L^.dato.costo_const + (L^.dato.costo_mante * L^.dato.duracion))) then
                begin
                    masCostosa:= L^.dato.costo_const;
                    nomCostosa:= L^.dato.nombre;
                end;

            // INCISO B
            vc[L^.dato.espectro]:= vc[L^.dato.espectro] + 1;

            // INCISO C
            if (promDuracion > L^.dato.duracion) then
                cantSondas:= cantSondas + 1;
            
            // INCISO D
            if (promCosto > L^.dato.costo_const) then
                WriteLn(L^.dato.nombre);
            
            L:= L^.sig;
        end;
    
    // inciso A
    writeln('La sonda mas costosa es: ',nomCostosa);

    // inciso B
    for x:=1 to 7 do
        WriteLn(vc[x]);

    // inciso C
    writeln('La cantidad de sondas que supera la duracion promedio es: ',cantSondas);

end;

var
    L: Lista;
begin
    L:= nil;
    cargarLista(L);
    incisos(L);
end.