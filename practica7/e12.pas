program e12;

type
    REG_cliente = record
        nombre: String;
        dni,edad,tipoSus: integer;
    end;

    REG_lista2 = record
        dni: Integer;
        nombre: String;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_cliente;
        sig: Lista;
    end;

    Lista2 = ^Nodo2;
    Nodo2 = record
        dato: REG_lista2;
        sig: Lista2;
    end;

    vectorSuscripcion = array[1..4] of real;
    vectorContador = array[1..4] of integer;

procedure crearLista(var L: Lista; r: REG_cliente);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
end;

procedure leer(var r: REG_cliente);
begin
    write('D.N.I: '); readln(r.dni);
    if (r.dni <> 0) then
        begin
            write('Nombre: '); readln(r.nombre);
            write('Edad: '); readln(r.edad);
            write('Tipo suscripcion: '); readln(r.tipoSus);
        end;
end;

procedure cargarLista(var L: Lista);
var
    r: REG_cliente;
begin
    leer(r);
    while (r.dni <> 0) do
        begin
            crearLista(L,r);
            leer(r);
        end;
end;

procedure crearListaNueva(var L2: Lista2; dni: integer; nombre: String);
var
    nue: Lista2;
begin
    new(nue);
    nue^.dato.dni:= dni;
    nue^.dato.nombre:= nombre;
    nue^.sig:= L2;
    L2:= nue;
end;

procedure recorrerVector(vc: vectorContador);
var
    x,max1,max2,sus1,sus2: Integer;
begin
    max1:= 0;
    max2:= 0;

    for x:=1 to 4 do
        if (max1 < vc[x]) then
            begin
                max2:= max1;
                sus2:= sus1;
                max1:= vc[x];
                sus1:= x;
            end
        else
            if (max2 < vc[x]) then
                begin
                    max2:= vc[x];
                    sus2:= x;
                end;
    
    writeln('Las 2 suscripciones con mas clientes son: ',sus1,' y ',sus2);
end;

procedure recorrerLista(L: Lista; tabla: vectorSuscripcion; var L2: Lista2);
var
    x: integer;
    totalGanancia: real;
    vc: vectorContador;
begin
    totalGanancia:= 0;
    for x:=1 to 4 do
        vc[x]:= 0;

    while (L <> nil) do
        begin
            // PUNTO 1
            totalGanancia:= totalGanancia + tabla[L^.dato.tipoSus];      

            // PUNTO 2
            vc[L^.dato.tipoSus]:= vc[L^.dato.tipoSus] + 1;

            // PUNTO 3
            if (L^.dato.edad > 40) and (L^.dato.tipoSus >= 3) then
                crearListaNueva(L2,L^.dato.dni,L^.dato.nombre);

            L:= L^.sig;
        end;
    
    // PUNTO 1
    WriteLn('Total ganancias: ',totalGanancia:0:2);

    // PUNTO 2
    recorrerVector(vc);
end;


// programa principal
var
    tabla: vectorSuscripcion;
    L: Lista;
    L2: Lista2;
begin
    L:= nil;
    L2:= nil;
    //cargarVector(tabla); // se dispone
    cargarLista(L);
    recorrerLista(L,tabla,L2);
end.