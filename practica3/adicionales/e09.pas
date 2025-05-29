program e09;

type
    REG_candidato = record
        localidad,apellido: String;
        votos,cantVotantes: integer;
    end;


procedure leer(var r: REG_candidato);
begin
    write('Localidad: '); readln(r.localidad);
    write('Apellido: '); readln(r.apellido);
    write('Votos: '); readln(r.votos);
    write('Cant. votantes: '); readln(r.cantVotantes);
end;

procedure incisos(var candidatoMaxVotos, candidatoMaxPor: String);
var
    r: REG_candidato;
    max: integer;
    porcentaje,maxPorcentaje: real;
begin
    max:= 0;
    maxPorcentaje:= 0;

    repeat
        leer(r);
        
        // INCISO I
        if (max < r.votos) then
            begin
                max:= r.votos;
                candidatoMaxVotos:= r.apellido;
            end;
        
        // INCISO II
        porcentaje:= (r.cantVotantes/r.cantVotantes) * 100;
        if (maxPorcentaje < porcentaje) then
            begin
                maxPorcentaje:= porcentaje;
                candidatoMaxPor:= r.apellido;
            end;

    until r.localidad = 'Zárate';
end;

// programa principal
var
    canMaxVotos,canMaxPor: String;
begin
    incisos(canMaxVotos,canMaxPor);

    // INCISO I
    writeln('El canditado con mas votos fue: ',canMaxVotos);

    // INCISO II
    writeln('El candidato con mayor porcentaje fue: ',canMaxPor);
end.