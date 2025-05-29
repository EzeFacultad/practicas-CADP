program e09;

type
    REG_docente = record
        dni: integer;
        nombre,apellido,email: String;
    end;

    REG_proyecto = record
        cod,cantAlumnos: integer;
        titulo,escuela,localidad: String;
        docente: REG_docente;
    end;

procedure leer(var r: REG_proyecto);
begin
    write('Codigo: '); readln(r.cod);
    if (r.cod <> -1) then
        begin
            write('Titulo: '); readln(r.titulo);
            write('Nom. docente: '); readln(r.docente.nombre);
            write('Ape. docente: '); readln(r.docente.apellido);
            write('D.N.I: '); readln(r.docente.dni);
            write('Email: '); readln(r.docente.email);
            write('Cant. alumnos: '); readln(r.cantAlumnos);
            write('Nombre escuela: '); readln(r.escuela);
            write('Localidad: '); readln(r.localidad);
        end;
end;

function digitos(cod: integer): boolean;
var
    pares,impares: integer;
begin
    pares:= 0;
    impares:= 0;
    while (cod <> 0) do
        begin
            if (((cod mod 10) mod 2) = 0) then
                pares:= pares + 1
            else
                impares:= impares + 1;
        end;
    digitos:= (pares = impares);
end;

procedure incisos(var totalEsc: integer; var maxNom1,maxNom2: String);
var
    r: REG_proyecto;
    cantLocalidad,cant,max1,max2: integer;
    localidad,escuela: String;
begin
    max1:= 0;
    max2:= 0;

    leer(r);
    while (r.cod <> -1) do
        begin
            cantLocalidad:= 0;
            cant:= 0;
            localidad:= r.localidad;
            while (r.cod <> -1) and (localidad = r.localidad) do
                begin
                    escuela:= r.escuela;
                    while (r.cod <> -1) and (escuela = r.escuela) do
                        begin
                            // INCISO I
                            cantLocalidad:= cantLocalidad + 1;

                            // INCISO II
                            cant:= cant + r.cantAlumnos;
                            
                            // INCISO III
                            if (localidad = 'Daireaux') and (digitos(r.cod)) then
                                writeln(r.titulo);
                            leer(r);
                        end;
                    
                    // INCISO I
                    writeln('La cantidad de escuelas en ',localidad,' es: ',cantLocalidad);
                    totalEsc:= totalEsc + cantLocalidad;

                    // INCISO II
                    if (max1 < cant) then
                        begin
                            max2:= max1;
                            maxNom2:= maxNom1;
                            max1:= cant;
                            maxNom1:= escuela;
                        end
                    else
                        if (max2 < cant) then
                            begin
                                max2:= cant;
                                maxNom2:= escuela;
                            end;
                end;
        end;
end;

// programa principal
var
    totalEsc: integer;
    maxNom1,maxNom2: String;
begin
    totalEsc:= 0;

    incisos(totalEsc,maxNom1,maxNom2);

    // INCISO I
    writeln('La cantidad de escuelas que participan es: ',totalEsc);

    // INCISO II
    writeln('Las 2 escuelas con mayor cant. de alumnos que participaron: ',maxNom1,' y ',maxNom2);
end.