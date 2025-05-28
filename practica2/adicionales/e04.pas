program e04;

procedure incisoA(radio: real; var diametro,perimetro:real);
begin
    diametro:= radio * 2;
    perimetro:= 2 * radio * 3.14;
end;

procedure leer(var radio: real; var distancia: integer; var nombre: String);
begin
    write('Radio: '); readln(radio);
    if (radio <> 0) then
        begin
            write('Nombre: '); readln(nombre);
            write('Distancia: '); readln(distancia);
        end;
end;

procedure incisoB;
var
    radio,diametro,perimetro: real;
    distancia,cant: integer;
    nombre: String;
begin
    cant:= 0;
    
    leer(radio,distancia,nombre);
    while (radio <> 0) do
        begin
            incisoA(radio,diametro,perimetro);
            // INCISO BI
            if (diametro >= 6780) and (diametro <= 12700) then
                writeln('El planeta ',nombre,' esta a ',distancia,'años luz');
            // INCISO BII
            if (perimetro > 439264) then
                cant:= cant + 1;

            leer(radio,distancia,nombre);
        end;

    writeln('La cantidad de planetas con el perimetro sup. a Jupiter es: ',cant);
end;

// programa principal
begin
    incisoB;
end.