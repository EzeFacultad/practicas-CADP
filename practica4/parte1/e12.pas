program e12;

const
    dimF = 53;

type
    REG_galaxia = record
        nombre: String;
        tipo: integer;
        masa,distancia: real;
    end;

    vector = array[1..dimF] of REG_galaxia;
    vectorContador = array[1..4] of integer;

procedure leer(var r: REG_galaxia);
begin
    write('Nombre: '); readln(r.nombre);
    write('Tipo: '); readln(r.tipo);
    write('Masa: '); readln(r.masa);
    write('Distancia: '); readln(r.distancia);
end;

procedure cargarVector(var v: vector);
var
    x: integer;
    r: REG_galaxia;
begin
    for x:=1 to dimF do
        begin
            leer(r);
            v[x]:= r;
        end;
end;

procedure recorrerVector(v: vector);
var
    x,cantIrre: integer;
    vc: vectorContador;
    totalMasa,masa3,max1,max2,min1,min2: real;
    maxNom1,maxNom2,minNom1,minNom2: String;
begin
    for x:=1 to 4 do
        vc[x]:= 0;
    
    totalMasa:= 0;
    masa3:= 0;
    cantIrre:= 0;
    min1:= 9999;
    min2:= 9999;
    max1:= 0;
    max2:= 0;

    for x:=1 to dimF do
        begin
            // INCISO A
            vc[v[x].tipo]:= vc[v[x].tipo] + 1;

            // INCISO B
            if (v[x].nombre = 'Via Láctea') or (v[x].nombre = 'Andrómeda') or (v[x].nombre = 'Triángulo') then
                masa3:= masa3 + v[x].masa;
            totalMasa:= totalMasa + v[x].masa;

            // INCISO C
            if (v[x].tipo = 4) and (v[x].distancia < 1000) then
                cantIrre:= cantIrre + 1;
            
            // INCISO D
            if (max1 < v[x].masa) then
                begin
                    max2:= max1;
                    maxNom2:= maxNom1;
                    max1:= v[x].masa;
                    maxNom1:= v[x].nombre;
                end
            else
                if (max2 < v[x].masa) then
                    begin
                        max2:= v[x].masa;
                        maxNom2:= v[x].nombre;
                    end;
            
            if (min1 > v[x].masa) then
                begin
                    min2:= min1;
                    minNom2:= minNom2;
                    min1:= v[x].masa;
                    minNom1:= v[x].nombre;
                end
            else
                if (min2 > v[x].masa) then
                    begin
                        min2:= v[x].masa;
                        minNom2:= v[x].nombre;
                    end;

        end;
    
    // INCISO A
    for x:=1 to 4 do
        writeln('El tipo ',x,' tuvo: ',vc[x]);
    
    // INCISO B
    writeln('El porcentaje que representan es: ',((masa3/totalMasa) * 100):0:2);

    // INCISO C
    writeln('La cantidad de galaxias de tipo irregular es: ',cantIrre);

    // INCISO D
    writeln('Las 2 galaxias con mas masa son: ',maxNom1,' y ',maxNom2);
    writeln('Las 2 galaxias con menos masa son: ',minNom1,' y ',minNom2);
end;

// programa principal
var
    v: vector;
begin   
    cargarVector(v);
    recorrerVector(v);
end.