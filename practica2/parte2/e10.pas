program e10;

procedure analizar(caracteres: char);
var
    cumple: boolean;
begin
    cumple:= true;
    // analizando la parte A
    while (caracteres <> '$') and (cumple) do
        begin
            // consideramos que solo son letras minúsculas, sino agregar tambien en caso para las vocales mayúsculas
            if (caracteres = 'a') or (caracteres = 'e') or (caracteres = 'i') or (caracteres = 'o') or (caracteres = 'u') then
                read(caracteres)
            else
                begin
                    cumple:= false;
                    writeln('El patron no se cumple en la parta A');
                end;
        end;
    
    // analizando la parte B
    while (caracteres <> '#') and (cumple) do
        begin
            if (caracteres = 'a') or (caracteres = 'e') or (caracteres = 'i') or (caracteres = 'o') or (caracteres = 'u') then
                begin
                    cumple:= false;
                    writeln('El patron no se cumple en la parta B');
                end
            else
                read(caracteres);
        end;
    
    if (cumple) then
        writeln('El patron se cumple');
    
end;

// programa principal
var
    caracteres: char;
begin
    {
    aca se ingresa la secuencia de caracteres entera. Ej:
        Secuencia: aiuiou$kkpfgrt# -> imprime que cumple
        Secuencia: aiuiozu$kkpfgrt# -> imprime que no cumple en la parta A
        Secuencia: aiuiou$kkpfgrta# -> imprime que no cumple en la parte B
    }
    write('Leer una secuencia de caractes: '); read(caracteres);
    analizar(caracteres);
end.