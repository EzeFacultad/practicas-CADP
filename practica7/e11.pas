program e11;

type
    REG_evento = record
        nombre,lugar: String;
        tipo,capacidad: integer;
        costo: real;
    end;

    REG_venta = record
        codVenta,numEvento,dni,cantEntradas: integer;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_venta;
        sig: Lista;
    end;

    vectorEvento = array[1..100] of REG_evento;


procedure crearLista(var L: Lista; r: REG_venta);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
end;

procedure leer(var r: REG_venta);
begin
    write('Cod. venta: '); readln(r.codVenta);
    if (r.codVenta <> -1) then
        begin
            write('Num. evento: '); readln(r.numEvento);
            write('D.N.I: '); readln(r.dni);
            write('Cant. de entradas: '); readln(r.cantEntradas);
        end;
end;

procedure cargarLista(var L: Lista);
var
    r: REG_venta;
begin
    leer(r);
    while (r.codVenta <> -1) do
        begin

            leer(r);
        end;
end;


// programa principal
var
    L: Lista;
    vEvento: vectorEvento;
begin
    L:= nil;
    //cargarVector(vEvento); // se dispone
    // INCISO 1
    cargarLista(L);
end.