program e10;

type
    REG_especie = record
        nombre,tipo,clima,pais: String;
        tiempoVida: integer;
    end;

procedure leer(var r: REG_especie);
begin
    write('Nombre cientifico: '); readln(r.nombre);
    write('Tipo: '); readln(r.tipo);
    write('Pais: '); readln(r.pais);
    if (r.pais <> 'zzz') then
        begin
            write('Clima: '); readln(r.clima);
            write('Tiempo de vida en meses: '); readln(r.tiempoVida);
        end;
end;

procedure incisos(var minTipo,maxNom1,maxNom2,nomMasPaises: String);
var
    r: REG_especie;
    x,cant,min,sumaTiempoVida,max1,max2,masPaises,maxMasPaises: integer;
    tipo,pais,nombre: String;
begin
    min:= 9999;
    max1:= 0;
    max2:= 0;
    maxMasPaises:= 0;

    for x:=1 to 320 do
        begin
            leer(r);
            tipo:= r.tipo;
            cant:= 0;
            sumaTiempoVida:= 0;
            while (tipo = r.tipo) do
                begin
                    nombre:= r.nombre;
                    masPaises:= 0;
                    while (tipo = r.tipo) and (nombre = r.nombre) do
                        begin
                            pais:= r.pais;
                            while (tipo = r.tipo) and (nombre = r.nombre) and (pais = r.pais) do
                                begin
                                    // INCISO I
                                    cant:= cant + 1;

                                    // INCISO II
                                    sumaTiempoVida:= sumaTiempoVida + r.tiempoVida;
                                    
                                    // INCISO III
                                    if (max1 < r.tiempoVida) then
                                        begin
                                            max2:= max1;
                                            maxNom2:= maxNom1;
                                            max1:= r.tiempoVida;
                                            maxNom1:= r.nombre;
                                        end
                                    else
                                        if (max2 < r.tiempoVida) then
                                            begin
                                                max2:= r.tiempoVida;
                                                maxNom2:= r.nombre;
                                            end;
                                    
                                    // INCISO IV
                                    if (pais = 'Argentina') and (r.clima = 'subtropical') then
                                        writeln(r.nombre);

                                    leer(r);
                                end;
                            
                            // INCISO V
                            masPaises:= masPaises + 1;
                        end;
                    
                    // INCISO V
                    if (maxMasPaises < masPaises) then
                        begin
                            maxMasPaises:= masPaises;
                            nomMasPaises:= nombre;
                        end;

                end;
                        // INCISO I
            if (min > cant) then
                begin
                    min:= cant;
                    minTipo:= tipo;
                end;
            
            // INCISO II
            writeln('El tiempo de vida promedio de ',tipo,' es de: ',(sumaTiempoVida/cant):0:2);
        end;
end;

// programa principal
var
    minTipo,maxNom1,maxNom2,nomMasPaises: String;
begin
    incisos(minTipo,maxNom1,maxNom2,nomMasPaises);

    // INCISO I
    writeln('El tipo ',minTipo,' tiene menos plantas');

    // INCISO III
    writeln('Las 2 plantas mas longevas son: ',maxNom1,' y ',maxNom2);

    // INCISO V
    writeln('La planta ',nomMasPaises,' se encuentra en mas paises');
end.