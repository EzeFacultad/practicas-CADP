program e07;

type
    vectorNotas = array[1..24] of real;
    REG_alumno = record
        numAlumno,anioIngreso,anioEgreso: integer;
        nombre,apellido,email: String;
        notas: vectorNotas;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_alumno;
        sig: Lista;
    end;


procedure agregarAdelante(var L: Lista; r: REG_alumno);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
end;

procedure leer(var r: REG_alumno);
var
    x,y,pos: integer;
    nota: real;
begin
    write('Nom. alumno: '); readln(r.numAlumno);
    if (r.numAlumno <> -1) then
        begin
            write('Nombre: '); readln(r.nombre);
            write('Apellido: '); readln(r.apellido);
            write('Anio ingreso: '); readln(r.anioIngreso);
            write('Anio egreso: '); readln(r.anioEgreso);
            write('Email: '); readln(r.email);

            for x:=1 to 24 do
                r.notas[x]:= 0;

            for x:=1 to 24 do
                begin
                    write('Nota ',x,': '); readln(nota); 

                    pos:= 1;
                    while (nota < r.notas[pos]) and (pos < 24) do
                        pos:= pos + 1;

                    if (pos < 24) then
                        for y:=24 downto pos + 1 do
                            r.notas[y]:= r.notas[y - 1];

                    r.notas[pos]:= nota;
                end;
        end;
end;

procedure cargarLista(var L: Lista);
var
    r: REG_alumno;
begin
    leer(r);
    while (r.numAlumno <> -1) do
        agregarAdelante(L,r);
        leer(r);
end;

function cumple(num: integer): Boolean;
var
    dig: integer;
begin
    cumple:= true;
    while (num <> 0) and (cumple) do
        begin
            dig:= num mod 10;
            if (dig mod 2 = 0) then
                cumple:= false
            else
                num:= num div 10;
        end;
end;

procedure recorrerLista(L: Lista);
var
    sumaNotas: real;
    x,cant: integer;
    min,min1,min2: integer;
    nom1,nom2,ape1,ape2,email1,email2: String;
begin
    cant:= 0;
    min1:= 9999;
    min2:= 9999;

    while (L <> nil) do
        begin
            // INCISO 2a
            sumaNotas:= 0;
            for x:=1 to 24 do
                sumaNotas:= sumaNotas + L^.dato.notas[x];
            writeln('El alumno ',L^.dato.apellido,' tiene promedio ',(sumaNotas / 24):0:2);

            // INCISO 2b
            if (L^.dato.anioIngreso = 2012) and (cumple(L^.dato.numAlumno)) then
                cant:= cant + 1;

            // INCISO 2c
            min:= L^.dato.anioEgreso - L^.dato.anioIngreso;
            if (min1 > min) then
                begin
                    min2:= min1;
                    nom2:= nom1;
                    ape2:= ape1;
                    email2:= email1;
                    min1:= min;
                    nom1:= L^.dato.nombre;
                    ape1:= L^.dato.apellido;
                    email1:= L^.dato.email;
                end
            else
                if (min2 > min) then
                    begin
                        min2:= min;
                        nom1:= L^.dato.nombre;
                        ape2:= L^.dato.apellido;
                        email2:= L^.dato.email;
                    end;
            

            L:= L^.sig;
        end;
    
    // INCISO 2b
    writeln('Cantidad alumnos que cumplen la condicion es :',cant);

    // INCISO 2c
    writeln('Los 2 alumos que re recibienron antes fueron ',nom1,ape1,email1,' ',nom2,ape2,email2);
end;

procedure eliminar(var L: Lista; num: integer);
var
    ant,act: Lista;
begin
    act:= L;
    while (act <> nil) and (num <> act^.dato.numAlumno) do
        begin
            ant:= act;
            act:= act^.sig;
        end;
    
    if (act <> nil) then
        begin
            if (act = L) then
                L:= L^.sig
            else
                ant^.sig:= act^.sig;
            dispose(act);
        end;
end;

procedure inciso3(L: Lista);
var
    num: integer;
begin
    writeln('Num. alumno: '); readln(num);
    eliminar(L,num);
end;


// programa principal
var
    L: Lista;
begin
    L:= nil;
    // INCISO 1
    cargarLista(L);
    // INCISO 2
    recorrerLista(L);
    // INCISO 3
    inciso3(L);
end.