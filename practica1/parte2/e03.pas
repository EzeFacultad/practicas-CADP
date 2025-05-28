program e03;

// programa principal
var
    nombre: String;
    nota: real;
    aprobados, cant7: integer;
begin
    aprobados:= 0;
    cant7:= 0;

    repeat
        write('Nombre: '); readln(nombre);
        write('Nota: '); readln(nota);
        
        if (nota >= 8) then
            aprobados:= aprobados + 1;
        
        if (nota = 7) then
            cant7:= cant7 + 1;

    until nombre = 'Zidane Zinedine';

    writeln('La cantidad de alumnos aprobados es: ',aprobados);
    writeln('La cantidad de alumnos que abtuvieron un 7 es: ',cant7);
end.