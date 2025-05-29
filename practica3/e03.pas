program e03;

type
    REG_escuela = record
        cue,cantDoc,cantAlu: integer;
        nombre,localidad: String;
    end;


// INCISO A
procedure leer (var r: REG_escuela);
begin
    write('CUE: '); readln(r.cue);
    write('Nom. establecimiento: '); readln(r.nombre);
    write('Cantidad de docentes: '); readln(r.cantDoc);
    write('Cantidad de alumnos: '); readln(r.cantAlu);
    write('Localidad: '); readln(r.localidad);
end;

// INCISO B
function calcularRelacion(alu,doc: integer): real;
begin
    calcularRelacion:= alu/doc;
end;

procedure incisos(var cue1,cue2,cantLaPlata: integer; var nom1,nom2: String);
var
    r: REG_escuela;
    x: integer;
    proporcion,calcular,rela1,rela2: real;
begin
    rela1:= 9999;
    rela2:= 9999;
    for x:=1 to 2400 do
        begin
            leer(r);
            proporcion:= calcularRelacion(r.cantAlu,r.cantDoc);

            if (r.localidad = 'La Plata') and (proporcion > 23.435) then
                cantLaPlata:= cantLaPlata + 1;
            
            
            if (proporcion >= 23.435) then
                begin
                    calcular:= proporcion - 23.435;
                    if (calcular < rela1) then
                        begin
                            rela2:= rela1;
                            cue2:= cue1;
                            nom2:= nom1;
                            rela1:= calcular;
                            cue1:= r.cue;
                            nom1:= r.nombre;
                        end
                    else
                        if (calcular < rela2) then
                            begin
                                rela2:= calcular;
                                cue2:= r.cue;
                                nom2:= r.nombre;
                            end;
                end;
        end;
end;

// programa principal
var
    cantLaPlata,cue1,cue2: integer;
    nom1,nom2: String;
begin
    cantLaPlata:= 0;
    incisos(cue1,cue2,cantLaPlata,nom1,nom2);

    writeln('La cantidad de escuelas en La Plata con mayor proporcion es: ',cantLaPlata);
    writeln(cue1,' de la escuela ',nom1,' y ',cue2,' de la escuela ',nom2);
end.