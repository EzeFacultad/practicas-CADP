program e03;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodo(var L,ult: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := nil;

    if (L = nil) then
        L:=aux
    else
        ult^.sig:= aux;
    ult:= aux;
end;

procedure imprimir(pri: lista);
begin
    while(pri <> nil) do
        begin
            write(pri^.num,', ');
            pri:= pri^.sig;
        end;
end;

procedure aumentar(pri: lista; n: integer);
begin
    while (pri <> nil) do
        begin
            pri^.num:= pri^.num + n;
            pri:= pri^.sig;
        end;
end;

// programa principal
var
    pri,ult : lista;
    valor,n : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri,ult,valor);
        writeln('Ingrese un numero');
        read(valor);
    end;

    imprimir(pri);
    write('Num: '); readln(n);
    aumentar(pri,n);
end.