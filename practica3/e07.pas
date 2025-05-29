program e07;

type
    REG_centro = record
        centro,universidad: String;
        cantInves,cantBeca: integer;
    end;

procedure leer(var r: REG_centro);
begin
    writeln('Nombre: '); readln(r.centro);
    write('Cant. investigadores: '); readln(r.cantInves);
    if (r.cantInves <> 0) then
        begin
            write('Cant. becarios: '); readln(r.cantBeca);
            write('Universidad: '); readln(r.universidad);
        end;
end;

procedure incisos(var maxNom,minCen1,minCen2: String);
var
    cant,cantInves,cantBeca,max,min1,min2: integer;
    r: REG_centro;
    universidad: String;
begin
    leer(r);
    max:= 0;
    min1:= 9999;
    min2:= 9999;
    
    while (r.cantInves <> 0) do
        begin
            cant:= 0;
            cantInves:= 0;
            cantBeca:= 0;

            universidad:= r.universidad;
            while (r.cantInves <> 0) and (universidad = r.universidad) do
                begin
                    // INCISO I
                    cant:= cant + 1;

                    // INCISO II
                    cantInves:= cantInves + r.cantInves;

                    // INCISO III
                    cantBeca:= cantBeca + r.cantBeca;
                end;
            
            // INCISO I
            writeln('La universidad ',universidad,' tiene ',cant,' centros');

            // INCISO II
            if (max < cantInves) then
                begin
                    max:= cantInves;
                    maxNom:= universidad;
                end;
            
            // INCISO III
            if (min1 > cantBeca) then
                begin
                    min2:= min1;
                    minCen2:= minCen1;
                    min1:= cantBeca;
                    minCen1:= r.centro;
                end
            else
                if (min2 > cantBeca) then
                    begin
                        min2:= cantBeca;
                        minCen2:= r.centro;
                    end;
        end;
end;

// programa principal
var
    maxNom,minCen1,minCen2: String;
begin

    incisos(maxNom, minCen1,minCen2);

    // INCISO II
    writeln('La universidad con mas investigadores en sus centros es: ',maxNom);

    // INCISO III
    writeln('Los 2 centros con menos becarios son: ',minCen1,' y ',minCen2);
end.