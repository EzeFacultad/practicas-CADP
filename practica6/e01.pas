program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;

// INCISO C
procedure imprimir(pri: lista);
begin
    while(pri <> nil) do
        begin
            write(pri^.num,', ');
            pri:= pri^.sig;
        end;
end;

// INCISO D
procedure aumentar(pri: lista; n: integer);
begin
    while (pri <> nil) do
        begin
            pri^.num:= pri^.num + n;
            pri:= pri^.sig;
        end;
end;


var
    pri : lista;
    valor,n : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;

    // INCISO C
    imprimir(pri);

    // INCISO D
    write('Num: '); readln(n);
    aumentar(pri,n);

end.

{
a. Indicar qué hace el programa.
    Rta: Lee números e imprime

b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
Rta: 48 13 21 10

}