program e06;

// programa principal
var
    legajo, cantAlumnoTotal, cantAlumnoProm, cantAlumnoPorc: integer;
    promedio: real;
begin
    cantAlumnoTotal:= 0;
    cantAlumnoProm:= 0;
    cantAlumnoPorc:= 0;

    write('Legajo: '); readln(legajo);

    while (legajo <> -1) do
        begin
            write('Promedio: '); readln(promedio);
            // inciso A
            cantAlumnoTotal:= cantAlumnoTotal + 1;

            // inciso B
            if (promedio > 6.5) then
                cantAlumnoProm:= cantAlumnoProm + 1;

            // inciso C
            if (promedio > 8.5) and (legajo < 2500) then
                cantAlumnoPorc:= cantAlumnoPorc + 1;

            write('Legajo: '); readln(legajo);
        end;

    writeln('La cantidad de alumnos es: ',cantAlumnoTotal);
    writeln('La cantidad de alumnos cuyo promedio supera 6.5 es: ',cantAlumnoProm);
    writeln('El porcentaje de alumnos que destacan es: ',((cantAlumnoPorc / cantAlumnoTotal) * 100):0:2);
end;