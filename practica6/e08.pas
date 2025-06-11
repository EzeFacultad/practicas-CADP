program e08;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodo(var L: lista; v: integer);
var
    aux,ant,act : lista;
begin
    new(aux);
    aux^.num := v;
    
    ant:= L;
    act:= L;

    while (act <> nil) and (act^.num < v) do
        begin
            ant:= act;
            act:= act^.sig;
        end;
    
    if (ant = act) then
        L:= aux
    else
        ant^.sig:= aux;
    aux^.sig:= act;
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

    imprimir(pri);
    write('Num: '); readln(n);
    aumentar(pri,n);
end.