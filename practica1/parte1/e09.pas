program e04;

// programa principal
var
    signo: char;
    num, resultado: integer;
begin
    write('Ingresar singo (+) o (-): '); readln(signo);

    if (signo = '+') or (signo = '-') then
        begin
            write('Ingrese un numero: '); readln(num);
            resultado:= num;
            while (num <> 0) do
                begin
                    write('Ingrese un numero: '); readln(num);
                    if (signo = '+') then
                        resultado:= resultado + num
                    else
                        resultado:= resultado - num;
                end;
        end
    else
        writeln('Error al ingresar el signo');
        
    writeln('El resultado es: ',resultado);
end.