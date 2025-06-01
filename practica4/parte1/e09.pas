program e09;

const
    dimF = 400;
type
    REG_alumno = record
        nroInscripcion,dni,anioNacimiento: integer;
        apellido,nombre: String;
    end;

    vector = array[1..dimF] of REG_alumno;


procedure leer(var r: REG_alumno);
begin
    write('Nro de inscripcion: '); readln(r.nroInscripcion);
    write('D.N.I: '); readln(r.dni);
    write('Apellido: '); readln(r.apellido);
    write('Nombre: '); readln(r.nombre);
    write('Anio de nacimiento: '); readln(r.anioNacimiento);
end;

function soloPar(dni: integer): Boolean;

begin
    soloPar:= true;
    while (dni <> 0) and (soloPar) do
        if (((dni mod 10) mod 2) <> 0) then
            soloPar:= false
        else
            dni:= dni div 10;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
    r: REG_alumno;
begin
    leer(r);
    while (dimL < dimF) and (r.dni <> -1) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= r;
            leer(r);
        end;
end;

procedure incisos(v: vector; dimL: integer);
var
    x,cantPar,max1,max2: integer;
    nom1,nom2,ape1,ape2: String;
begin
    cantPar:= 0;
    max1:= 9999;
    max2:= 9999;
    for x:=1 to dimL do
        begin
            // INCISO A
            if (soloPar(v[x].dni)) then
                cantPar:= cantPar + 1;

            // INCISO B
            if (max1 > v[x].anioNacimiento) then
                begin
                    max2:= max1;
                    nom2:= nom1;
                    ape2:= ape1;
                    max1:= v[x].anioNacimiento;
                    nom1:= v[x].nombre;
                    nom2:= v[x].apellido;
                end
            else
                if (max2 > v[x].anioNacimiento) then
                    begin
                        max2:= v[x].anioNacimiento;
                        nom2:= v[x].nombre;
                        ape2:= v[x].apellido;
                    end;
        end; 
    
    // INCISO A
    writeln('El porcentaje de alumnos con DNI con dig. pares es: ',((cantPar / dimF) * 100):0:2);

    // INCISO B
    writeln('Los 2 alumnos mas grandes son: ',ape1,' ',nom1,' y ',ape2,' ',nom2);
end;

// programa principal
var
    v: vector;
    dimL: integer;
begin
    dimL:= 0;
    cargarVector(v,dimL);
    incisos(v,dimL);
end.