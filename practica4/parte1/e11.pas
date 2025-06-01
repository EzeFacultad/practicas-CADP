program e11;

const
    dimF = 200;

type
    REG_foto = record
        titulo,autor: String;
        cantGusta,cantClic,cantComentarios: integer;
    end;

    vector = array[1..dimF] of REG_foto;


procedure leer(var r: REG_foto);
begin
    write('Titulo: '); readln(r.titulo);
    write('Autor: '); readln(r.autor);
    write('Cant. me gusta: '); readln(r.cantGusta);
    write('Cant. clic: '); readln(r.cantClic);
    write('Cant. comentarios: '); readln(r.cantComentarios);
end;

procedure cargarVector(var v: vector);
var
    x: integer;
    r: REG_foto;
begin
    for x:=1 to dimF do
        begin
            leer(r);
            v[x]:= r;
        end;
end;

procedure recorrerVector(v: vector);
var
    x,maxTitulo,cantArt,cantComentarios: integer;
    titulo: String;
begin
    maxTitulo:= 0;
    cantArt:= 0;
    cantComentarios:= 0;

    for x:=1 to dimF do
        begin
            // INCISO A
            if (maxTitulo < v[x].cantClic) then
                begin
                    // INCISO A
                    maxTitulo:= v[x].cantClic;
                    titulo:= v[x].titulo;

                    // INCISO B
                    if (v[x].autor = 'Art Vandelay') then
                        cantArt:= cantArt + v[x].cantGusta;
                    
                    // INCISO C
                    cantComentarios:= cantComentarios + v[x].cantComentarios;
                end;
        end;
    
    // INCISO A
    writeln('El titulo de la foto mas vista es: ',titulo);

    // INCISO B
    writeln('La cant. de me gusta del artista Art Vandelay es: ',cantArt);

    // INCISO C
    writeln('La cant. de comentarios es: ',cantComentarios);
end;

// programa principal
var
    v: vector;
begin
    cargarVector(v);
    recorrerVector(v);
end.