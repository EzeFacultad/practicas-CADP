program e10;

const
    dimF = 20;
type
    REG_cultivo = record
        tipo: String;
        hectareas,cantMeses: integer;
    end;

    vectorCultivos = array[1..20] of REG_cultivo;

    REG_empresa = record
        cod,dimL: integer;
        nombre,ciudad,tipoEmpresa: String;
        cultivos: vectorCultivos;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_empresa;
        sig: Lista;
    end;


procedure crearLista(var L: Lista; r: REG_empresa);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
end;

procedure leer(var r: REG_empresa);
var
    hectareas: integer;
begin
    write('Cod. empresa: '); readln(r.cod);
    if (r.cod <> -1) then
        begin
            write('Nombre: '); readln(r.nombre);
            write('Ciudad: '); readln(r.ciudad);
            write('Privada o Estatal: '); readln(r.tipoEmpresa);
            
            write('Cant. hectareas: '); readln(hectareas);
            r.dimL:= 0;
            while (hectareas <> 0) and (r.dimL < dimF) do
                begin
                    r.dimL:= r.dimL + 1;
                    r.cultivos[r.dimL].hectareas:= hectareas;
                    write('Tipo de cultivo: '); readln(r.cultivos[r.dimL].tipo);
                    write('Ciclo cultivo en meses: '); readln(r.cultivos[r.dimL].cantMeses);

                    write('Cant. hectareas: '); readln(hectareas);
                end;
        end;
end;

procedure incisoA(var L: Lista);
var
    r: REG_empresa;
begin
    leer(r);
    while (r.cod <> -1) do
        begin
            crearLista(L,r);
            leer(r);
        end;
end;

function cumpleCeros(cod: integer): Boolean;
var
    ceros: integer;
begin
    ceros:= 0;
    while (cod <> 0) and (ceros < 2) do
        begin
            if ((cod mod 10) = 0) then
                ceros:= ceros + 1;
            cod:= cod div 10;
        end;
    
    cumpleCeros:= (ceros = 2);
end;

procedure recorrerVector(vc: vectorCultivos; dimL: integer; var cultivaTrigo: boolean; var cantSoja, max: integer);
var
    x: integer;
begin
    for x:=1 to dimL do
        begin
            // INCISO B
            if (vc[x].tipo = 'trigo') then
                cultivaTrigo:= true;
            
            // INCISO C
            if (vc[x].tipo = 'soja') then
                cantSoja:= cantSoja + vc[x].hectareas;
            
            // INCISO D
            if (vc[x].tipo = 'maiz') then
                max:= vc[x].cantMeses;
        end;
end;

procedure incisos(L: Lista);
var
    cantSoja,cantHectareas,maxMes,max: integer;
    nombre: String;
    cultivaTrigo: Boolean;
begin
    cantSoja:= 0;
    cantHectareas:= 0;
    maxMes:= 0;

    while (L <> nil) do
        begin
            // INCISO B, C, D
            cultivaTrigo:= false;
            recorrerVector(L^.dato.cultivos,L^.dato.dimL,cultivaTrigo,cantSoja,max);

            // INCISO B
            if (L^.dato.ciudad = 'San Miguel del Monte') and (cultivaTrigo) and (cumpleCeros(L^.dato.cod)) then
                writeln(L^.dato.nombre);
            
            // INCISO C
            cantHectareas:= cantHectareas + L^.dato.dimL;

            // INCISO D
            if (max > maxMes) then
                begin
                    maxMes:= max;
                    nombre:= L^.dato.nombre;
                end;
            
            L:= L^.sig;
        end;
    
    // INCISO C
    writeln('La cantidad de HA con soja es: ',cantSoja,'. Y en porcentaje equivale a: ',((cantSoja / cantHectareas) * 100):0:2);

    // INCISO D
    writeln('La empresa que mas tiempo ocupa en maiz es: ',nombre);
end;

procedure incisoD(L: Lista);
var
    x: integer;
begin
    while (L <> nil) do
        begin
            if (L^.dato.tipoEmpresa = 'estatal') then   
                begin
                    x:= 1;
                    while (x <= L^.dato.dimL) and (L^.dato.cultivos[x].tipo <> 'girasol') do
                        x:= x + 1;
                    
                    if (x <= L^.dato.dimL) then
                        if (L^.dato.cultivos[x].hectareas < 5) then
                            L^.dato.cultivos[x].cantMeses:= L^.dato.cultivos[x].cantMeses + 1;
                end;
        end;
        
        L:= L^.sig;
end;


// programa principal
var
    L: Lista;
begin
    L:= nil;
    incisoA(L);
    incisos(L);
    incisoD(L);
end.