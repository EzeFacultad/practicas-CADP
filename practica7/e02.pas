program e02;

type
    REG_cliente = record
        codCliente,dni,codPoliza: integer;
        apellido,nombre: String;
        montoBasico: real;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_cliente;
        sig: Lista;
    end;

    vectorPrecios = array[1..6] of real;


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
    write('Cod. cliente: '); readln(r.codCliente);
    write('D.N.I: '); readln(r.dni);
    write('Apellido: '); readln(r.apellido);
    write('Nombre: '); readln(r.nombre);
    write('Cod. poliza: '); readln(r.codPoliza);
    write('Monto basico: '); readln(r.montoBasico);
end;

procedure cargarLista(var L: Lista);
var
    r: REG_cliente;
begin
    repeat
        leer(r);
        crearLista(L,r);
    until (r.codCliente <> 1122);
end;

function digitos9(dni: integer): boolean;
var
    cant: integer;
begin
    cant:= 0;
    while (dni <> 0) and (cant < 2) do
        begin
            if ((dni mod 10) = 9) then
                cant:= cant + 1;
            dni:= dni div 10;
        end;
    
    digitos9:= cant = 2;
end;

procedure incisos(L: Lista; vp: vectorPrecios);
begin
    while (L <> nil) do
        begin
            // INCISO A
            writeln('D.N.I: ',L^.dato.dni,' | Nombre y Apellido: ',L^.dato.nombre,' ',L^.dato.apellido,' | Monto Total: ',(L^.dato.montoBasico + vp[L^.dato.codPoliza]));

            // INCISO B
            if (digitos9(L^.dato.dni)) then
                writeln('Nombre y apellido: ',L^.dato.nombre,' ',L^.dato.apellido);

            L:= L^.sig;
        end;
end;

procedure eliminar(var L: Lista; cod: integer);
var
    ant,act: Lista;
begin
    ant:= L;
    act:= L;
    while (act^.dato.codCliente <> cod) do
        begin
            ant:= act;
            act:= act^.sig;
        end;
    
    if (ant = act) then
        L:= L^.sig
    else
        ant^.sig:= act^.sig;
    
    dispose(act);
end;

procedure incisoC(L: Lista);
var
    cod: integer;
begin
    write('Cod. cliente a eliminar: '); readln(cod);
    eliminar(L,cod);
end;


// programa principal
var
    L: Lista;
    vp: vectorPrecios;
begin
    L:= nil;
    cargarVector(vp); // se dispone
    cargarLista(L);
    incisos(L,vp);
    incisoC(L);
    
end.