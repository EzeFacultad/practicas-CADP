program e05;

type
    REG_auto = record
        marca,modelo: String;
        precio: real;
    end;

procedure leer(var r: REG_auto);
begin
    write('Marca: '); readln(r.marca);
    if (r.marca <> 'ZZZ') then
        begin
            write('Modelo: '); readln(r.modelo);
            write('Precio: '); readln(r.precio);
        end;
end;

procedure incisos(r: REG_auto);
var
    auto: REG_auto;
    precioProm: real;
    cant: integer;
begin
    leer(r);
    while (r.marca <> 'ZZZ') do
        begin
            auto.marca:= r.marca;
            auto.precio:= 0;
            precioProm:= 0;
            cant:= 0;
            while (r.marca <> 'ZZZ') and (auto.marca = r.marca) do
                begin
                    // INCISO A
                    precioProm:= precioProm + r.precio;
                    cant:= cant + 1;

                    // INCISO B
                    if (auto.precio < r.precio) then
                        begin
                            auto.precio:= r.precio;
                            auto.modelo:= r.modelo;
                        end;

                    leer(r);
                end;

            // INCISO A
            writeln('Precio promedio de la marca ',auto.marca,' es de $',(precioProm/cant):0:2);

            // INCISO B
            writeln('El modelo mas caro de ',auto.marca,' es ',auto.modelo);
        end;
end;

// programa principal
var
    r: REG_auto;
begin
    incisos(r);
end.