:- use_module('TDA_jugador.pl', [jugador/8, jugadorSetDinero/3, jugadorNuevoDinero/3,jugadorSumarPosicion/3]).
:-use_module('TDA_tablero.pl',[tablero/5,tableroGetPropiedades/2,tableroGetCartasSuerte/2,tableroGetCartasComunidad/2,tableroGetCasillasEspeciales/2,tableroActualizarPropiedades/3,tableroSetListaPropiedades/3,tableroActualizarJugadores/3]).
:-use_module('TDA_propiedad',[propiedad/9,propiedadGetCasas/2,propiedadSetSumarCasa/2,propiedadSetHotel/2,propiedadSetHipotecada/2]).





%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:

juego(Jugadores,Tablero,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaximoCasas,MaximoHoteles,
	[Jugadores,Tablero,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaximoCasas,MaximoHoteles]).
%%GETTTERRSSS
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoGetJugadores([Jugadores|_],Jugadores).
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoGetTablero([_,Tablero|_],Tablero).
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoGetDineroBanco([_,_,DineroBanco|_],DineroBanco).
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoGetNumeroDados([_,_,_,NumeroDados|_],NumeroDados).
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoGetTurnoActual([_,_,_,_,TurnoActual|_],TurnoActual).%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoGetTasaImpuesto([_,_,_,_,_,TasaImpuesto|_],TasaImpuesto).
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoGetMaxCasas([_,_,_,_,_,_,MaximoCasas|_],MaximoCasas).
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoGetMaxHoteles([_,_,_,_,_,_,MaximoHoteles|_],MaximoHoteles).
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoSetTablero(JuegoIn, TableroIn, JuegoOut):-
  juegoGetJugadores(JuegoIn,Jugadores),

  juegoGetDineroBanco(JuegoIn,DineroBanco),
  juegoGetNumeroDados(JuegoIn,NumeroDados),
  juegoGetTurnoActual(JuegoIn,TurnoActual),
  juegoGetTasaImpuesto(JuegoIn,TasaImpuesto),
  juegoGetMaxCasas(JuegoIn,MaxCasas),
  juegoGetMaxHoteles(JuegoIn,MaxHoteles), 
  juego(Jugadores,TableroIn,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaxCasas,MaxHoteles,JuegoOut).
  



%Agregar jugadadres
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoAgregarJugador([JugadoresIn, Tablero, DineroBanco, Dados, Turno, TasaImpuesto, MaxCasas, MaxHoteles], 
        JugadorNuevo,
        [JugadoresOut, Tablero, NuevoDineroBanco, Dados, Turno, TasaImpuesto, MaxCasas, MaxHoteles]):-
        jugadorNuevoDinero(JugadorNuevo, 1500, JugadorConDinero),
        append(JugadoresIn, [JugadorConDinero], JugadoresOut),
        NuevoDineroBanco is DineroBanco - 1500.

%%getter de juego TurnoActual
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
%esto se puede hacer de otra forma
juegoObtenerJugadorActual(JuegoIn,JugadorActual):-
        juego(Jugadores, _, _, _, TurnoActual, _, _, _, JuegoIn),
        nth0(TurnoActual, Jugadores, JugadorActual).
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
getJuegoCantidadDados([_Jugadores, _Tablero, _DineroBanco, CantidadDados,_TurnoActual, _TasaImpuesto, _MaxCasas, _MaxHoteles], CantidadDados).
%%Juego set 


%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
% Predicado myRandom
myRandom(Xn, Xn1):-
  Xn1 is (((1103515245 * Xn) + 12345) mod 2147483648).
% Predicado getDadoRandom que recibe la semilla y controla los resultados
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
getDadoRandom( Seed, NvaSeed, R):-
    myRandom( Seed, NvaSeed),
    R is 1 + (NvaSeed mod 6).
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
% Valores de referencia seed para retornar entre 1 a 6
% retorna R=1 y NvoSeed=1187151906
getDadoRandom(112, NvoSeed, R).

% retorna R=2 y NvoSeed=851444701
getDadoRandom(822, NvoSeed,R). 

% retorna R=3 y NvoSeed=187537622
getDadoRandom(231139, NvoSeed, R).
% retorna R=4 y NvoSeed=12345
getDadoRandom(0, NvoSeed, R).

% retorna R=5 y NvoSeed=522335758
getDadoRandom(32511, NvoSeed, R).

% retorna R=6 y NvoSeed=883414115
getDadoRandom(32451, NvoSeed, R).


%listaSeed y NuevasSeed, son listas
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoLanzarDados(JuegoIn,ListaSeed,NuevasSeed,Resultado):-
  getJuegoCantidadDados(JuegoIn,ResultadoCantidadDados),
  lanzar(ResultadoCantidadDados,ListaSeed,NuevasSeed,Resultado).
%caso base
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
lanzar(0,[],[],[]).
%funcionamiento y llamdas recursivas
lanzar(ResultadoCantidadDados,[PrimeraSeed|RestoSeed],[PrimeraNuevaSeed|RestoNuevaSeed],[PrimerResultado|RestoResultados]):-
  ResultadoCantidadDados>0,
  getDadoRandom(PrimeraSeed,PrimeraNuevaSeed,PrimerResultado),
  NewCantidadDados is ResultadoCantidadDados-1,
  lanzar(NewCantidadDados,RestoSeed,RestoNuevaSeed,RestoResultados).

%funciona pero si lo ejecuto todo junto lo del dado, ojo ahi.
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
sumarDados([],0).
sumarDados([Cabeza|Cola],Resultado):-
  sumarDados(Cola,ResultadoAux),
  Resultado  is ResultadoAux + Cabeza.


%me falta actualizar la lista de jugadores con el nuevo jugador modificado
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
  juegoMoverJugador(JuegoIn,IdJugador,ValoresDados,JuegoOut):-
    sumarDados(ValoresDados,ResultadoDados),
    %juego(Jugadores,Tablero, DineroBanco, Dados, Turno, TasaImpuesto, MaxCasas, MaxHoteles, JuegoIn),
    juegoGetJugadores(JuegoIn,Jugadores),
    juegoGetTablero(JuegoIn,Tablero),
    juegoGetDineroBanco(JuegoIn,DineroBanco),
    juegoGetNumeroDados(JuegoIn,NumeroDados),
    juegoGetTurnoActual(JuegoIn,TurnoActual),
    juegoGetTasaImpuesto(JuegoIn,TasaImpuesto),
    juegoGetMaxCasas(JuegoIn,MaxCasas),
    juegoGetMaxHoteles(JuegoIn,MaxHoteles), 
    nth0(IdJugador, Jugadores, JugadorMover),
    jugadorSumarPosicion(JugadorMover,ResultadoDados,JugadorMovido),
    tableroActualizarJugadores(Jugadores,JugadorMovido,ListaActualizada),

    juego(ListaActualizada, Tablero, DineroBanco, NumeroDados, TurnoActual, TasaImpuesto, MaxCasas, MaxHoteles, JuegoOut).
  %%aqui debo actualizar la lista jugadores que contiene al jugador que debo mover y luego retornar esa lisra dentro del 


%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:

juegoCalcularRentaPropiedad(JuegoIn,Propiedad,Monto):-
  propiedad(_Id,_Nombre,_Precio,RentaBase,_Duenno,CantidadCasas,CantidadHotel,EstaHipotecada,Propiedad),
  juego(_Jugadores,_Tablero, _DineroBanco, _Dados, _Turno, _TasaImpuesto, MaxCasas, _MaxHoteles, JuegoIn),
  (EstaHipotecada == true ->
    Monto = 0
  ; CantidadHotel == true ->
     Monto is RentaBase*MaxCasas*2
  ; CantidadCasas>0 ->
    Monto is  RentaBase*1.2
  ; 
  Monto = RentaBase  
  ).


%caso base de suma de monto de las propiedades
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
sumarRentaJugador([],0).
sumarRentaJugador([PrimeraPropiedad|RestoPropiedad],Resultado):-
        sumarRentaJugador(RestoPropiedad,ResultadoAux),
        propiedad(_IdPropiedad,_NombrePropiedad,_Precio,Renta,_Duenno,_Casas,_EsHotel,_EstaHipotecada,PrimeraPropiedad),
        Resultado is ResultadoAux + Renta.
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoCalcularRentaJugador(JuegoIn,JugadorIn,MontoRenta):-
  juego(_Jugadores,Tablero, _DineroBanco, _Dados, _Turno, _TasaImpuesto, _MaxCasas, _MaxHoteles, JuegoIn),
  tablero(_Propiedades,_CartasSuerte,_CartaComunidad,_CasillasEspeciales,Tablero),
  jugador(_IdJugador, _NombreJugador, _Dinero, PropiedadesJugador, _PosicionActual, _EstaEnCarcel, _TotalCartasSalirCarcel,JugadorIn),
  sumarRentaJugador(PropiedadesJugador,MontoRenta).
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoConstruirCasas(JuegoIn,PropiedadIn,JuegoOut):-
  %juego(Jugadores,Tablero, DineroBanco, Dados,Turno, TasaImpuesto, MaxCasas, MaxHoteles, JuegoIn),
  juegoGetJugadores(JuegoIn,Jugadores),
  juegoGetTablero(JuegoIn,Tablero),
  juegoGetDineroBanco(JuegoIn,DineroBanco),
  juegoGetNumeroDados(JuegoIn,NumeroDados),
  juegoGetTurnoActual(JuegoIn,TurnoActual),
  juegoGetTasaImpuesto(JuegoIn,TasaImpuesto),
  juegoGetMaxCasas(JuegoIn,MaxCasas),
  juegoGetMaxHoteles(JuegoIn,MaxHoteles), 
  propiedadGetCasas(PropiedadIn,CasasEnPropiedad),
  CasasEnPropiedad<MaxCasas,
  propiedadSetSumarCasa(PropiedadIn,PropiedadOut),
  tableroGetPropiedades(Tablero,ListaPropiedades),
  tableroActualizarPropiedades(ListaPropiedades,PropiedadOut,ListaPropiedadesActualizadas),
  tableroSetListaPropiedades(Tablero,ListaPropiedadesActualizadas,TableroOut),
  juego(Jugadores,TableroOut,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaxCasas,MaxHoteles,JuegoOut).
  



%entreoria esta funcionando pero no entrega una salida como tal, se simplifica
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
juegoConstruirHotel(JuegoIn,PropiedadIn,JuegoOut):-
  %juego(Jugadores,Tablero, DineroBanco, Dados,Turno, TasaImpuesto, MaxCasas, MaxHoteles, JuegoIn),
  %desarmo los atributos del juego(TODO ESTO SE PUEDE HACER CON SETTER OJOO)
  juegoGetJugadores(JuegoIn,Jugadores),
  juegoGetTablero(JuegoIn,Tablero),
  juegoGetDineroBanco(JuegoIn,DineroBanco),
  juegoGetNumeroDados(JuegoIn,NumeroDados),
  juegoGetTurnoActual(JuegoIn,TurnoActual),
  juegoGetTasaImpuesto(JuegoIn,TasaImpuesto),
  juegoGetMaxCasas(JuegoIn,MaxCasas),
  juegoGetMaxHoteles(JuegoIn,MaxHoteles), 
  propiedadGetCasas(PropiedadIn,CasasEnPropiedad),
  CasasEnPropiedad==MaxCasas,
  propiedadSetHotel(PropiedadIn,PropiedadOut),
  tableroGetPropiedades(Tablero,ListaPropiedades),
  tableroActualizarPropiedades(ListaPropiedades,PropiedadOut,ListaPropiedadesActualizadas),
  tableroSetListaPropiedades(Tablero,ListaPropiedadesActualizadas,TableroOut),
  juego(Jugadores,TableroOut,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaxCasas,MaxHoteles,JuegoOut).
%%me falta actualizar la lista que esta en tablero, para agregar esta porpiedad con la modificacion y quitar el precio al jugador



