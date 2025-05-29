program e02;

type
    // INCISO A
    REG_casamiento = record
        dia,mes,anio: integer;
    end;

// INCISO B
procedure incisoB(var c: REG_casamiento);
begin
    write('Dia: '); readln(c.dia);
    write('Mes: '); readln(c.mes);
    write('Anio: '); readln(c.anio);
end;

// programa principal
var
    c: REG_casamiento;
    cant10,cantMes, mes: integer;
begin
    incisoB(c);

    // INCISO C
    while (c.anio <> 2020) do
        begin
            mes:= c.mes;
            cant10:= 0;
            cantMes:= 0;
            while (c.anio <> 2020) and (mes = c.mes) do
                begin
                    if (c.dia <= 10) then
                        cant10:= cant10 + 1;

                    cantMes:= cantMes + 1;
                    
                    incisoB(c);
                end;
            
            writeln('La cantidad de casamientos en los primeros 10 dias es: ',cant10);
            writeln('La cantidad de casamientos en el mes ',mes,' fueron: ',cantMes);
        end;
end.