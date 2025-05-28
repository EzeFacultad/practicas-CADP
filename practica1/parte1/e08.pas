program e08;

// programa principal
var
    a, b, c: char;
    cont: integer;
begin
    cont:= 0;

    write('Ingresar 1er caracter: '); readln(a);
    write('Ingresar 2do caracter: '); readln(b);
    write('Ingresar 3er caracter: '); readln(c);

    if (a = 'a') or (a = 'e') or (a = 'i') or (a = 'o') or (a = 'u') then
        begin
            cont:= cont + 1;
            if (b = 'a') or (b = 'e') or (b = 'i') or (b = 'o') or (b = 'u') then
                begin
                    cont:= cont + 1;
                    if (c = 'a') or (c = 'e') or (c = 'i') or (c = 'o') or (c = 'u') then
                        cont:= cont + 1;
                end;
        end;
    
    if (cont = 3) then
        writeln('Los tres son vocales')
    else
        writeln('Al menos un caracter no era vocal');

end.