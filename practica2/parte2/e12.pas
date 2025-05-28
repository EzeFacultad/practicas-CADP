program e12;

function incisoA(ha,zona: integer; precio: real): real;
var
    tonelada: real;
begin
    if (zona = 1) then
        tonelada:= 6
    else
        if (zona = 2) then
            tonelada:= 2.6
        else
            tonelada:= 1.4;
    
    incisoA:= ha * tonelada * precio;
end;

procedure leer(var localidad: String; var cantHa,zona: integer);
begin
    write('Localidad: '); readln(localidad);
    write('Cantidad de hectarias: '); readln(cantHa);
    write('Zona (1, 2 o 3): '); readln(zona);
end;

procedure incisos(var cant3Febrero, cantLocal: integer; var maxLocal, minLocal: String; var suma: real);
var
    localidad: String;
    cantHa,zona: integer;
    precio,rendimiento,max,min: real;
begin
    precio:= 320;
    max:= 0;
    min:= 9999;

    repeat
        leer(localidad,cantHa,zona);
        rendimiento:= incisoA(cantHa,zona,precio);

        // inciso B1
        if (rendimiento > 10000) and (localidad = 'Tres de Febrero') then
            cant3Febrero:= cant3Febrero + 1;

        // inciso B2
        if (max < rendimiento) then
            begin
                max:= rendimiento;
                maxLocal:= localidad;
            end;
        
        // inciso B3
        if (min > rendimiento) then
            begin
                min:= rendimiento;
                minLocal:= localidad;
            end;
        
        // inciso B4
        cantLocal:= cantLocal + 1;
        suma:= suma + rendimiento;

    until (cantHa = 900) or (localidad = 'Saladillo');
end;

// programa principal
var
    cant3Febrero, cantLocal: integer;
    maxLocal, minLocal: String;
    sumaRendimiento: real;
begin
    cant3Febrero:= 0;
    sumaRendimiento:= 0;
    cantLocal:= 0;

    incisos(cant3Febrero,cantLocal,maxLocal,minLocal,sumaRendimiento);

    writeln('La cantidad de campos que superan $10000 en Tres de Feb. es: ',cant3Febrero);
    writeln('La localidad con mayor rendimiento economico es: ',maxLocal);
    writeln('La localidad con menor rendimiento economico es: ',minLocal);
    writeln('El rendimiento economico prmedio es: ',(sumaRendimiento/cantLocal):0:2);
end.