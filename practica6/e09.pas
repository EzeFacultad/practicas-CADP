program e09;
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

function estaOrdenada(L: lista): boolean;
var
    aux: lista;
begin
    aux:= L;
    while (L <> nil) and (L^.num <= aux^.num) then
        begin
            aux:= L;
            L:= L^.sig;
        end;
    
    estaOrdenada:= (L = nil);
end;

procedure eliminar(var L: lista; n: integer);
var
    ant,act: lista;
begin
    ant:= L;
    act:= L;
    while (act <> nil) and (act^.num <> n) do
        begin
            ant:= act;
            act:= act^.sig;
        end;
    
    if (act <> nil) then
        begin
            if (ant = act) then
                L:= L^.sig
            else
                ant^.sig:= act^.sig;
            dispose(act);
        end;
end;

procedure sublista(pri: lista; var L: lista; a,b: integer);
begin
    
    // Este while se usa si la lista no está ordenada (INCISO C) 
    while (pri <> nil) do 
    // Este while se usa si la lista está ordenada de manera ascendente (INCISO D)
    while (pri <> nil) and (pri^.num < b) do
    // Este while se usa si la lista está ordenada de manera descendente (INCISO E)
    while (pri <> nil) and (pri^.num > a) do
        begin
            if (pri^.num > a) and (pri^.num < b) then
                armarNodo(L,pri^.num);
            
            pri:= pri^.sig;
        end;
end;

// programa principal
var
    pri,L: lista;
    valor,n,a,b: integer;
begin
    pri := nil;
    L:= nil;

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

    // INCISO A
    if (estaOrdenada(pri)) then
        writeln('Lista ordenada')
    else
        writeln('Lista desordenada');

    // INCISO B
    write('Num: '); readln(n);
    eliminar(pri,n);

    // INCISO C, D y E
    write('Numero A: '); readln(a);
    write('Numero B: '); readln(b);
    sublista(pri,L,a,b);

    //
end.
