program e10;

type
    REG_cliente = record
        dni,nro: integer;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_cliente;
        sig: Lista;
    end;

procedure recibirCliente(var L,ult: Lista; dni: integer);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato.dni:= dni;

    if (L = nil) then
        begin
            nue^.dato.nro:= 1;
            nue^.sig:= nil;
            L:= nue;
        end
    else
        begin
            nue^.dato.nro:= ult^.dato.nro + 1;
            ult^.sig:= nue;
        end;

    ult:= nue;
end;

procedure atenderCliente(var L:Lista; var c: REG_cliente);
var
    aux: Lista;
begin
    aux:= L;
    if (aux <> nil) then
        begin
            c:= L^.dato;
            L:= L^.sig;
            dispose(aux);
        end;
end;

procedure ingresoClientes(var L: Lista);
var
    dni: integer;
    ult: Lista;
begin
    write('D.N.I: '); readln(dni);
    while (dni <> 0) do
        begin
            recibirCliente(L,ult,dni);
            write('D.N.I: '); readln(dni);
        end;
end;

procedure atendiendoClientes(L: Lista);
var
    c: REG_cliente;
begin
    while (L <> nil) do
        begin
            atenderCliente(L,c);
            writeln('Cliente: ',c.dni,' con numero: ',c.nro);
        end;
end;

// programa principal
var
    L: Lista;
begin
    L:= nil;
    ingresoClientes(L);
    atendiendoClientes(L);
end.