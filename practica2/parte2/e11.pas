program e11;

procedure analizar(caracteres: char);
var
    cumple: boolean;
    cantA,cantB,cantArrobas: integer;
begin
    cumple:= true;
    cantA:= 0;
    cantB:= 0;
    cantArrobas:= 0;

    // analizando la parte A
    while (caracteres <> '%') and (cumple) do
        begin
            if (caracteres = '$') then
                begin
                    cumple:= false;
                    writeln('El patron no se cumple en la parta A');
                end;
            else
                begin
                    cantA:= cantA + 1;
                    read(caracteres);
                end;
        end;
    
    // analizando la parte B
    read(caracteres);
    while (caracteres <> '*') and (cumple) do
        begin
            if (caracteres = '@') then
                cantArrobas:= cantArrobas + 1;
            
            cantB:= cantB + 1;

            if (cantB > cantA) then
                begin
                    cumple:= false;
                    writeln('El patron no se cumple en la parta B');
                end
            else
                read(caracteres);
        end;
    
    if (cumple) and (cantArrobas >= 3) and (cantA = cantB) then
        writeln('El patron se cumple');
end;

// programa principal
var
    caracteres: char;
begin
    write('Leer una secuencia de caractes: '); read(caracteres);
    analizar(caracteres);
end.