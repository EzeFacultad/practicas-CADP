program e01;

type
    REG_persona = record
        dni,edad,codGenero: integer;
        apellido,nombre: String;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_persona;
        sig: Lista;
    end;

    vectorContador = array[1..5] of integer;


procedure crearLista(var L: Lista; r: REG_persona);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
end;

procedure leer(var r: REG_persona);
begin
    write('D.N.I: '); readln(r.dni);
    write('Edad: '); readln(r.edad);
    write('Nombre: '); readln(r.nombre);
    write('Apellido: '); readln(r.apellido);
    write('Cod. genero: '); readln(r.codGenero);
end;

procedure cargarLista(var L: Lista);
var
    r: REG_persona;
begin
    repeat
        leer(r);
        crearLista(L,r);
    until (r.dni = 33555444);
    {
        Al compilar, la línea 44 da error ya que una variable
        de tipo integer solo guarda valores hasta 32767
    }
end;

function digPares(dni: integer): boolean;
var
    par,impar: integer;
begin
    par:= 0;
    impar:= 0;
    while (dni <> 0) do
        begin
            if (((dni mod 10) mod 2) = 0) then
                par:= par + 1
            else
                impar:= impar + 1;
            dni:= dni div 10;
        end;
    
    digPares:= (par > impar);
end;

procedure recorrerVector(vc: vectorContador);
var
    x,max1,max2,cod1,cod2: integer;
begin
    max1:= 0;
    max2:= 0;
    for x:=1 to 5 do
        begin
            if (max1 < vc[x]) then
                begin
                    max2:= max1;
                    cod2:= cod1;
                    max1:= vc[x];
                    cod1:= x;
                end
            else
                if (max2 < vc[x]) then
                    begin
                        max2:= vc[x];
                        cod2:= x;
                    end;
        end;
    
    writeln('Los 2 generos mas elegidos fueron: ',cod1,' y ',cod2);
end;

procedure recorrerLista(L: Lista);
var
    cantPares,x: integer;
    vc: vectorContador;
begin
    cantPares:= 0;
    for x:=1 to 5 do
        vc[x]:= 0;

    while (L <> nil) do
        begin
            // INCISO A
            if (digPares(L^.dato.dni)) then
                cantPares:= cantPares + 1;

            // INCISO B
            vc[L^.dato.codGenero]:= vc[L^.dato.codGenero] + 1;

            L:= L^.sig;
        end;
    
    // INCISO A
    writeln('La cantidad de personas con DNI con mas dig. pares es: ',cantPares);

    // INCISO B
    recorrerVector(vc);
end;

procedure elimiar(var L: Lista; dni: integer);
var
    ant,act: Lista;
begin
    ant:= L;
    act:= L;
    while (act <> nil) and (act^.dato.dni <> dni) do
        begin
            ant:= act;
            act:= act^.sig;
        end;

    if (act <> nil) then
        if (ant = act) then
                L:= L^.sig
        else
            ant^.sig:= act^.sig;
        dispose(act);
end;

procedure incisoC(var L: Lista);
var
    dni: integer;
begin
    write('D.N.I a elimiar: '); readln(dni);
    elimiar(L,dni);
end;


// programa principal
var
    L: Lista;
begin
    L:= nil;
    cargarLista(L);
    recorrerLista(L);
    incisoC(L);
end.