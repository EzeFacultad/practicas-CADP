{
1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada venta se debe
guardar: código de venta, número de evento (1..100), DNI del comprador y cantidad de entradas
adquiridas. La lectura de las ventas finaliza con código de venta -1.
2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que impares
y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
personas permitidas.
}

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
    vectorContador = array[1..100] of real;


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
            crearLista(L,r);
            leer(r);
        end;
end;

procedure recorrerVector(vc: vectorContador; ve: vectorEvento);
var
    x: integer;
    min1,min2: real;
    nom1,nom2: String;
begin
    min1:= 9999;
    min2:= 9999;
    for x:=1 to 100 do
        if (min1 > vc[x]) then
            begin
                min2:= min1;
                nom2:= nom1;
                min1:= vc[x];
                nom1:= ve[x].nombre;
            end
        else
            if (min2 > vc[x]) then
                begin
                    min2:= vc[x];
                    nom2:= ve[x].nombre;
                end;
    writeln('Los eventos que recaudaron menos fueron: ',nom1,' y ',nom2);
end;

function cumple(dni: integer): Boolean;
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
    
    cumple:= (par > impar);
end;

procedure incisos(L: Lista; ve: vectorEvento);
var
    vc: vectorContador;
    x,cantEntrada,evento50: integer;
begin
    for x:=1 to 100 do
        vc[x]:= 0;

    cantEntrada:= 0;
    evento50:= 0;

    while (L <> nil) do
        begin
            // INCISO 2A
            vc[L^.dato.numEvento]:= vc[L^.dato.numEvento] + L^.dato.cantEntradas * ve[L^.dato.numEvento].costo;

            // INCISO 2B
            if (cumple(L^.dato.dni)) and (ve[L^.dato.numEvento].tipo = 3) then
                cantEntrada:= cantEntrada + 1;

            // INCISO 2C
            if (L^.dato.numEvento = 50) then
                evento50:= evento50 + 1;

            L:= L^.sig;
        end;

    // INCISO 2A
    recorrerVector(vc,ve);

    //INCISO 2B
    writeln('La cantidad de entradas donde el comprador cumple con la condicion es: ',cantEntrada);

    if (evento50 > ve[50].capacidad) then
        WriteLn('El evento 50 supero su capacidad');
end;


// programa principal
var
    L: Lista;
    vEvento: vectorEvento;
begin
    L:= nil;
    cargarVector(vEvento); // se dispone
    // INCISO 1
    cargarLista(L);
    incisos(L,vEvento);
end.