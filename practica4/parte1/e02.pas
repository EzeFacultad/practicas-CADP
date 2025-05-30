program Vectores;

const
    cant_datos = 150;

type
    vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var
    num: real; { completado }
begin
{ completado }
    write('Ingresar numero: '); readln(num);
    while (dimL < cant_datos) and (num <> 0) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= num;

            write('Ingresar numero: '); readln(num);
        end;
end;

procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
    x: integer; { completado }
begin
{ completado }
    for x:=1 to dimL do
        begin
            v[x]:= v[x] + n;
            suma:= suma + v[x];
        end;
end;

{ programa principal }
var
    datos : vdatos;
    dim : integer;
    num, suma : real;
begin
    dim := 0;
    suma := 0;
    cargarVector(datos,dim); { completado }
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(datos,dim,num,suma); {completado}
    writeln('La suma de los valores es: ', suma);
    writeln('Se procesaron: ',dim, ' números');
end.