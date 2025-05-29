program Registros;
type
    str20 = string[20];

    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
    end;

procedure leer(var alu : alumno);
begin
    writeln('Ingrese el código del alumno');
    read(alu.codigo);

    if (alu.codigo <> 0) then begin
        writeln('Ingrese el nombre del alumno'); read(alu.nombre);
        writeln('Ingrese el promedio del alumno'); read(alu.promedio);
    end;
end;

procedure incisoAB(a: alumno);
var
    cant: integer;
    nom: String;
    prom: real;
begin
    cant:= 0;
    prom:= 0;
  
    leer(a);
    while (a.codigo <> 0) do
        begin
            // INCISO A
            cant:= cant + 1;

            // INCISO B
            if (prom < a.promedio) then
                begin
                    prom:= a.promedio;
                    nom:= a.nombre;
                end;

            leer(a);
        end;
    
    writeln('La cantidad de alumnos leidos fue: ',cant);
    writeln('El alumno con mejor promedio es: ',nom);
end;

{ declaración de variables del programa principal }
var
    a : alumno;
{ cuerpo del programa principal }
begin
    incisoAB(a);
    
end.