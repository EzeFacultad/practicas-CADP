program e08;

type
	REG_fecha = record
		dia,mes,anio: integer;
	end;
	
	REG_transferencia = record
		nroOrigen,dniOrigen,nroDestino,dniDestino,hora,codMotivo: integer;
		fecha: REG_fecha;
		monto: real;
	end;

	Lista = ^Nodo;
	Nodo = record
		dato: REG_transferencia;
		sig: Lista;
	end;
	
	vectorContador = array [1..7] of integer;


procedure insertarOrdenado (var L: Lista; r: REG_transferencia);
var
	nue,ant,act: Lista;
begin
	new (nue);
	nue^.dato:= r;

	ant:= L;
	act:= L;
	
	while (act <> nil) and (L^.dato.nroOrigen < r.nroOrigen) do begin
		ant:= act;
		act:= act^.sig;
	end;

	if (ant = act) then
		L:= nue
	else
		ant^.sig := act^.sig;
	nue^.sig:= act;
end;

procedure cargarNuevaLista (var L2: Lista; L1: Lista);
begin
	while (L1 <> nil) do 
		begin
			if (L1^.dato.nroOrigen <> L1^.dato.nroDestino) then
				insertarOrdenado(L2,L1^.dato);
			
			L1:= L1^.sig;
		end;
end;

function menosParesQueImpares(num: integer): boolean;
var
	dig,pares,impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while (num <> 0) do begin
		dig := num mod 10;
		if ((dig mod 2) = 0) then
			pares:= pares + 1
		else
			impares:= impares + 1;
		num:= num div 10;
	end;
	menosParesQueImpares:= (pares < impares);
end;

procedure recorrerVector(vc: vectorContador);
var
	x,max,codMax: integer;
begin
	max:= 0;
	for x:=1 to 7 do
		if (max < vc[x]) then
			begin
				max:= vc[x];
				codMax:= x;
			end;
	
	writeln('El codigo de motivos con mas transeferencias es: ',codMax);
end;

procedure incisos(L: Lista);
var
	totalTerceros: real;
	x,actualOrigen,transferJunio: integer;
	vc: vectorContador;
begin

	for x:=1 to 7 do
		vc[x]:= 0;

	transferJunio := 0;
	while (L <> nil) do begin

		totalTerceros:= 0;
		actualOrigen:= L^.dato.nroOrigen;
		while (L <> nil) and (actualOrigen = L^.dato.nroOrigen) do
			begin
				// INCISO B
				totalTerceros:= totalTerceros + L^.dato.monto;
				
				// INCISO C
				vc[L^.dato.codMotivo] := vc[L^.dato.codMotivo] + 1;
				
				// INCISO D
				if (L^.dato.fecha.mes = 6) and (menosParesQueImpares(L^.dato.nroDestino)) THEN
					transferJunio := transferJunio + 1;

				L:= L^.sig;
			end;

		// INCISO B
		writeln('El monto total transferido a terceros de la cuenta origen ',actualOrigen,' es ',totalTerceros);

	end;

	// INCISO C
	recorrerVector(vc);

	// INCISO D
	write('Cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales el numero ');
	writeln('de cuenta destino posea menos digitos pares que impares: ',transferJunio);
end;

var
	L1,L2: Lista;
begin
	L1 := nil;
	L2 := nil;
	cargarLista(L1); // se dispone
	cargarNuevaLista(L2,L1);
	incisos(L2);
end.