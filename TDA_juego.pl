:- use_module('TDA_jugador.pl', [jugador/8, jugadorSetDinero/3, jugadorNuevoDinero/3,jugadorSumarPosicion/3]).
:-use_module('TDA_tablero.pl',[tablero/5,tableroGetPropiedades/2,tableroGetCartasSuerte/2,tableroGetCartasComunidad/2,tableroGetCasillasEspeciales/2,tableroActualizarPropiedades/3,tableroSetListaPropiedades/3,tableroActualizarJugadores/3]).
:-use_module('TDA_propiedad',[propiedad/9,propiedadGetCasas/2,propiedadSetSumarCasa/2,propiedadSetHotel/2,propiedadSetHipotecada/2]).






%TDA juego constructor
juego(Jugadores,Tablero,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaximoCasas,MaximoHoteles,
	[Jugadores,Tablero,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaximoCasas,MaximoHoteles]).
%%GETTTERRSSS
juegoGetJugadores([Jugadores|_],Jugadores).
juegoGetTablero([_,Tablero|_],Tablero).
juegoGetDineroBanco([_,_,DineroBanco|_],DineroBanco).
juegoGetNumeroDados([_,_,_,NumeroDados|_],NumeroDados).
juegoGetTurnoActual([_,_,_,_,TurnoActual|_],TurnoActual).
juegoGetTasaImpuesto([_,_,_,_,_,TasaImpuesto|_],TasaImpuesto).
juegoGetMaxCasas([_,_,_,_,_,_,MaximoCasas|_],MaximoCasas).
juegoGetMaxHoteles([_,_,_,_,_,_,MaximoHoteles|_],MaxHoteles).
%FIN GETTERS









%Agregar jugadadres
juegoAgregarJugador([JugadoresIn, Tablero, DineroBanco, Dados, Turno, TasaImpuesto, MaxCasas, MaxHoteles], 
        JugadorNuevo,
        [JugadoresOut, Tablero, NuevoDineroBanco, Dados, Turno, TasaImpuesto, MaxCasas, MaxHoteles]):-
        jugadorNuevoDinero(JugadorNuevo, 1500, JugadorConDinero),
        append(JugadoresIn, [JugadorConDinero], JugadoresOut),
        NuevoDineroBanco is DineroBanco - 1500.

%%getter de juego TurnoActual
juegoObtenerJugadorActual(JuegoIn,JugadorActual):-
        juego(Jugadores, _, _, _, TurnoActual, _, _, _, JuegoIn),
        nth0(TurnoActual, Jugadores, JugadorActual).
%me lo entrega pero lo entrega al inicio tipo hayq ue pasarle todo el texto de una y no consulta por consulta
%getter de cant de dados, esto no es necesario 
getJuegoCantidadDados([_Jugadores, _Tablero, _DineroBanco, CantidadDados,_TurnoActual, _TasaImpuesto, _MaxCasas, _MaxHoteles], CantidadDados).
%%Juego set tablero

%voy con el lanzar dados
% Predicado myRandom
myRandom(Xn, Xn1):-
  Xn1 is (((1103515245 * Xn) + 12345) mod 2147483648).
% Predicado getDadoRandom que recibe la semilla y controla los resultados
getDadoRandom( Seed, NvaSeed, R):-
    myRandom( Seed, NvaSeed),
    R is 1 + (NvaSeed mod 6).

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
juegoLanzarDados(JuegoIn,ListaSeed,NuevasSeed,Resultado):-
  getJuegoCantidadDados(JuegoIn,ResultadoCantidadDados),
  lanzar(ResultadoCantidadDados,ListaSeed,NuevasSeed,Resultado).
%caso base
lanzar(0,[],[],[]).
%funcionamiento y llamdas recursivas
lanzar(ResultadoCantidadDados,[PrimeraSeed|RestoSeed],[PrimeraNuevaSeed|RestoNuevaSeed],[PrimerResultado|RestoResultados]):-
  ResultadoCantidadDados>0,
  getDadoRandom(PrimeraSeed,PrimeraNuevaSeed,PrimerResultado),
  NewCantidadDados is ResultadoCantidadDados-1,
  lanzar(NewCantidadDados,RestoSeed,RestoNuevaSeed,RestoResultados).

%funciona pero si lo ejecuto todo junto lo del dado, ojo ahi.
sumarDados([],0).
sumarDados([Cabeza|Cola],Resultado):-
  sumarDados(Cola,ResultadoAux),
  Resultado  is ResultadoAux + Cabeza.


%me falta actualizar la lista de jugadores con el nuevo jugador modificado
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

    juego(ListaActualizada, Tablero, DineroBanco, Dados, Turno, TasaImpuesto, MaxCasas, MaxHoteles, JuegoOut).
  %%aqui debo actualizar la lista jugadores que contiene al jugador que debo mover y luego retornar esa lisra dentro del 




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
sumarRentaJugador([],0).
sumarRentaJugador([PrimeraPropiedad|RestoPropiedad],Resultado):-
        sumarRentaJugador(RestoPropiedad,ResultadoAux),
        propiedad(_IdPropiedad,_NombrePropiedad,_Precio,Renta,_Duenno,_Casas,_EsHotel,_EstaHipotecada,PrimeraPropiedad),
        Resultado is ResultadoAux + Renta.

juegoCalcularRentaJugador(JuegoIn,JugadorIn,MontoRenta):-
  juego(Jugadores,Tablero, _DineroBanco, _Dados, _Turno, _TasaImpuesto, _MaxCasas, _MaxHoteles, JuegoIn),
  tablero(Propiedades,_CartasSuerte,_CartaComunidad,_CasillasEspeciales,Tablero),
  jugador(_IdJugador, _NombreJugador, _Dinero, PropiedadesJugador, _PosicionActual, _EstaEnCarcel, _TotalCartasSalirCarcel,JugadorIn),
  sumarRentaJugador(PropiedadesJugador,MontoRenta).
  %writeln("Propiedades del jugador:"),
  %writeln(PropiedadesJugador).
  %aislar la lista de propiedades esta seran las ids
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
  %hasta aqui termino de desarmar los atributos del juego
  %aqui proceso la compra del hotel
  propiedadGetCasas(PropiedadIn,CasasEnPropiedad),
  CasasEnPropiedad==MaxCasas,
  propiedadSetHotel(PropiedadIn,PropiedadOut),
  %aqui ya hice el cambio de la compra del hotel
  %falta ver temas de dinero
  %obtengo los atributos del tda Propiedad
  tableroGetPropiedades(Tablero,ListaPropiedades),
  tableroActualizarPropiedades(ListaPropiedades,PropiedadOut,ListaPropiedadesActualizadas),
  %en teoria ahora solo debo reconstruir la propiedada
  tableroSetListaPropiedades(Tablero,ListaPropiedadesActualizadas,TableroOut),
  %finalmente reconstruyo el juego solamente
   %writeln(PropiedadIn),
  %writeln(PropiedadOut),
  %writeln(ListaPropiedadesActualizadas),
  juego(Jugadores,TableroOut,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaxCasas,MaxHoteles,JuegoOut).
%%me falta actualizar la lista que esta en tablero, para agregar esta porpiedad con la modificacion y quitar el precio al jugador



