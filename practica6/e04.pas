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

// INCISO A
function maximo(l: lista): integer;
begin
    maximo:= 0;
    while (l <> nil) do
        begin
            if (maximo < l^.num) then
                maximo:= l^.num;

            l:= l^.sig;
        end;
end;

// INCISO B
function minimo(l: lista): integer;
begin
    minimo:= 9999;
    while (l <> nil) do
        begin
            if (minimo > l^.num) then
                minimo:= l^.num;
                
            l:= l^.sig;
        end;
end;

// INCISO C
function multiplos(l: lista; n: integer): integer;
begin
    multiplos:= 0;
    while (l <> nil) do
        begin
            if ((l^.num mod n) = 0) then
                multiplos:= multiplos + 1;
                
            l:= l^.sig;
        end;
end;

// programa principal
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

    // INCISO A
    writeln('El valor maximo es: ',maximo(pri));
    // INCISO B
    writeln('El valor minimo es: ',minimo(pri));
    // INCISO C
    write('Num multiplo: '); readln(n);
    writeln('La cantidad de multiplos de ',n,' es: ',multiplos(pri,n));
end.

