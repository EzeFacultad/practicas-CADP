program e04;

const
    dimF = 1000;

type
    REG_alumno = record
        nroAlumno,cantAsistencia: integer;
        apellido,nombre: String;
    end;

    vector = array[1..dimF] of REG_alumno;


// INCISO A
function posicion(v: vector; num: integer): integer;
begin
    posicion:= 1;
    while (v[posicion].nroAlumno <> num) do
        posicion:= posicion + 1;
end;

// INCISO B
procedure insertar(var v: vector; var dimL: integer; alum: REG_alumno);
begin
    if (dimL < dimF) then
        begin
            dimL:= dimL + 1;
            v[dimL]:= alum;
        end;
end;

// INCISO C
procedure eliminarPos(var v: vector; var dimL: integer; pos: integer);
var
    x: integer;
begin
    if (pos <= dimL) then
        begin
            if (pos < dimL) then
                for x:= pos to dimL do
                    v[x]:= v[x + 1];

            dimL:= dimL - 1;
        end;
end;

// INCISO D
procedure eliminarNro(var v: vector; var dimL: integer; nroAlumno: integer);
var
    x,pos: integer;
begin
    pos:= 1;
    while (pos < dimL) and (v[pos].nroAlumno < nroAlumno) do
        pos:= pos + 1;
    
    if (pos <= dimL) then
        if (v[pos].nroAlumno = nroAlumno) then
            begin
                if (pos < dimL) then
                    for x:=pos to dimL do
                        v[x]:= v[x + 1];

                dimL:= dimL - 1;
            end;
end;

// INCISO E
procedure eliminar0(var v:vector; var dimL: integer);
var
    x,pos: integer;
begin
    pos:= 1;
    while (pos < dimL) do
        begin
            if (v[pos].cantAsistencia = 0) then
                begin
                    dimL:= dimL - 1;
                    for x:= pos to dimL do
                        v[x]:= v[x + 1];
                end
            else
                pos:= pos + 1;
        end;
    
    if (v[pos].cantAsistencia = 0) then
        dimL:= dimL - 1
end;

// programa principal
var
    v: vector;
    dimL,pos,nroAlumno: integer;
    alumno: REG_alumno;
begin
    dimL:= 0;
    cargarVector(v,dimL); // se dispone

    // INCISO A
    pos:= posicion(v,nroAlumno);
    // INCISO B
    insertar(v,dimL,alumno);
    // INCISO C
    eliminarPos(v,dimL,pos);
    // INCISO D
    eliminarNro(v,dimL,nroAlumno);
    // INCISO E
    eliminar0(v,dimL);
end.