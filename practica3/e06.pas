program e06;

type
    REG_procesador = record
        marca,linea: String;
        cantCores,nm: integer;
        ghz: real;
    end;


procedure leer(var r: REG_procesador);
begin
    write('Marca: '); readln(r.marca);
    write('Cores: '); readln(r.cantCores);
    if (r.cantCores <> 0) then
        begin
            write('Linea: '); readln(r.linea);
            write('Nanometros: '); readln(r.nm);
            write('Ghz: '); readln(r.ghz);
        end;
end;

procedure incisos(r: REG_procesador);
var
    marca, m1,m2: String;
    max1,max2,cant,cantPro: integer;
begin
    max1:= 0;
    max2:= 0;
    cantPro:= 0;

    leer(r);
    while (r.cantCores <> 0) do
        begin
            marca:= r.marca;
            cant:= 0;
            while (r.cantCores <> 0) and (marca = r.marca) do
                begin
                    // INCISO I
                    if (r.cantCores > 2) and (r.nm <= 22) then
                        writeln('Linea ',r.linea,' de la marca ',marca);
                    
                    // INCISO II
                    if (r.nm = 14) then
                        cant:= cant + 1;
                    
                    // INCISO III
                    if (r.cantCores > 1) and ((marca = 'Inter') or (marca = 'AMD')) and (r.ghz > 2) then
                        cantPro:= cantPro + 1;

                    leer(r);
                end;

            // INCISO II
            if (max1 < cant) then
                begin
                    max2:= max1;
                    m2:= m1;
                    max1:= cant;
                    m1:= marca;
                end
            else
                if (max2 < cant) then
                    begin
                        max2:= cant;
                        m2:= marca;
                    end;
        end;
    
    // INCISO II
    writeln('Las 2 marcas con mas procesadores de 14nm: ',m1,' y ',m2);

    // INCISO III
    writeln('Cantidad de procesadores que cumplen la condicion: ',cantPro);
end;

// programa principal
var 
    r: REG_procesador;
begin
    incisos(r);
end.