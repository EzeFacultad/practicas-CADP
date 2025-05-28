program e09;


procedure leer(var nombre,apellido: String; var numInscripcion: integer);
begin
    write('Nombre: '); readln(nombre);
    write('Apellido: '); readln(apellido);
    write('Numero de inscripcion: '); readln(numInscripcion);
end;

procedure incisosI_II(var a1,a2,n1,n2: String; a,n: String; num: integer; var min1,min2,max1,max2: integer);
begin
    // INCISO I
    if (min1 > num) then
        begin
            min2:= min1;
            a2:= a1;
            min1:= num;
            a1:= a;
        end
    else
        if (min2 > num) then
            begin
                min2:= num;
                a2:= a;
            end;
        
    // INCISO II
    if (max1 < num) then
        begin
            max2:= max1;
            n2:= n1;
            max1:= num;
            n1:= n;
        end
    else
        if (max2 < num) then
            begin
                max2:= num;
                n2:= n;
            end;
end;

procedure incisos(var ape1,ape2,nom1,nom2: String; var cantPar,totalAlum: integer);
var
    min1,min2,max1,max2,num: integer;
    nombre,apellido: String;
begin
    min1:= 9999;
    min2:= 9999;
    max1:= 0;
    max2:= 0;

    repeat
        leer(nombre,apellido,num);
        
        // INCISO I
        incisosI_II(ape1,ape2,nom1,nom2,apellido,nombre,num,min1,min2,max1,max2);
        
        // INCISO III
        if ((num mod 2) = 0) then
            cantPar:= cantPar + 1;

        totalAlum:= totalAlum + 1;
    until num = 1200;
end;

// programa principal
var
    totalAlum, cantPar: integer;
    ape1,ape2,nom1,nom2: String;
begin
    cantPar:= 0;
    totalAlum:= 0;

    incisos(ape1,ape2,nom1,nom2,cantPar,totalAlum);

    writeln('Los apellidos de los 2 alumnos con num. de inscripcion mas chico es: ',ape1,' y ',ape2);
    writeln('Los nombres de los 2 alumnos con num. de inscripcion mas grande es: ',nom1,' y ',nom2);
    writeln('El porcentaje de alumnos con num. de inscripcion pas es: ',((cantPar/totalAlum) * 100):0:2);
end.