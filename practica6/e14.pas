program e14;

const
    dimF = 5;
type
    vectorTransporte = array[1..dimF] of integer;

    REG_viaje = record
        codAlumno,dia: integer;
        facultad: String;
        transporte: vectorTransporte;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_viaje;
        sig: Lista;
    end;

    vectorPrecios = array[1..dimF] of real;


procedure crearLista(var L: Lista; r: REG_viaje);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
end;

procedure leer(r: REG_viaje);
var
    x: integer;
begin
    write('Codigo: '); readln(r.codAlumno);
    if (r.codAlumno <> -1) then
        begin
            write('Dia: '); readln(r.dia);
            write('Facultad: '); readln(r.facultad);
            for x:=1 to dimF do
                begin
                    write('Transporte ',x,': '); readln(r.transporte[x]);
                end;
        end;
end;

procedure cargarLista(var L: Lista);
var
    r: REG_viaje;
begin
    leer(r);
    while (r.codAlumno <> -1) do
        begin
            crearLista(L,r);
            leer(r);
        end;
end;

procedure recorrerVector(vt: vectorTransporte);
var
    x,max1,max2,cod1,cod2: integer;
begin
    max1:= 0;
    max2:= 0;

    for x:=1 to 5 do
        begin
            if (max1 < vt[x]) then
                begin
                    max2:= max1;
                    cod2:= cod1;
                    max1:= vt[x];
                    cod1:= x;
                end
            else
                if (max2 < vt[x]) then
                    begin
                        max2:= vt[x];
                        cod2:= x;
                    end;
        end;

    writeln('Los 2 medios de transportes mas usados fueron: ',cod1,' y ',cod2);
end;

procedure incisos(L: Lista; vp: vectorPrecios);
var
    cant6viajes,cantViajes,x,cant80,conBici: integer;
    sumaMonto: real;
    vt: vectorTransporte;
begin
    cant6viajes:= 0;
    cant80:= 0;
    sumaMonto:= 0;
    for x:=1 to dimF do
        vt[x]:= 0;
    conBici:= 0;

    while (L <> nil) do
        begin
            // INCISO A
            cantViajes:= 0;
            for x:=1 to dimF do
                cantViajes:= cantViajes + L^.dato.transporte[x];
            if (cantViajes > 6) then
                cant6viajes:= cant6viajes + 1;
            
            // INCISO B
            x:= 1;
            while (x <= dimF) and (sumaMonto < 80) do
                begin
                    if (L^.dato.transporte[x] > 0) then
                        sumaMonto:= sumaMonto + vp[x];

                    x:= x + 1;
                end;
            if (sumaMonto > 80) then
                cant80:= cant80 + 1;
            
            // INCISO C
            for x:=1 to dimF do
                vt[x]:= vt[x] + L^.dato.transporte[x];

            // INCISO D
            if (L^.dato.transporte[5] > 0) then
                begin
                    x:=1;
                    while (x <= 4) and (L^.dato.transporte[x] <> 0) do
                        x:= x + 1;
                    if (x <= 4) then
                        conBici:= conBici + 1;
                end;
            
            L:= L^.sig;
        end;
    
    // INCISO A
    writeln('La cantidad de alumnos con mas de 6 viajes es: ',cant6viajes);

    // INCISO B
    writeln('La cantidad de alumnos que gastan mas de $80 es: ',cant80);

    // INCISO C
    recorrerVector(vt);

    // INCISIO D
    writeln('La cantidad de alumnos que combinan bici con otro transporte es: ',conBici);
end;


// programa principal
var
    L: Lista;
    vp: vectorPrecios;
begin
    L:= nil;
    cargarLista(L);
    cargarVectorPrecios(vp); // se dispone
    incisos(L,vp);
end.