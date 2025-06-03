:- use_module('TDA_jugador.pl', [jugador/8, jugadorSetDinero/3, jugadorNuevoDinero/3,jugadorSumarPosicion/3]).
:-use_module('TDA_tablero.pl',[tablero/5,tableroGetPropiedades/2,tableroGetCartasSuerte/2,tableroGetCartasComunidad/2,tableroGetCasillasEspeciales/2,tableroActualizarPropiedades/3,tableroSetListaPropiedades/3,tableroActualizarJugadores/3,tableroActualizarCartas/3,tableroSetListaCartasComunidad/3,tableroSetListaCartasSuerte/3]).
:-use_module('TDA_propiedad',[propiedad/9,propiedadGetCasas/2,propiedadSetSumarCasa/2,propiedadSetHotel/2,propiedadSetHipotecada/2]).
%COMENTADA CORRECTAMENTE
/* -----------------------------------------| 
|                                           |
|                                           |
|             COMENTADA CORECTAMENTE        |
|                                           |
|-------------------------------------------|
*/

%Descripcion: Es el constructor del TDA juego, genera una lista que representar el juego
%Dominio:Jugadores(list)XTablero(list)XDineroBanco(int)XNumeroDados(int)XTurnoActual(int)XTasaImpuesto(int)XMaximoCasas(int)XMaximoHoteles(int)
%Recorrido:Juego(list), con los paramentros del dominio
%Tipo de algoritmo:Constructor
juego(Jugadores,Tablero,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaximoCasas,MaximoHoteles,
	[Jugadores,Tablero,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaximoCasas,MaximoHoteles]).

%%GETTTERRSSS
%Descripcion:Esta funcion obtiene la lista de jugadores desde la lista que representa el juego
%Dominio:Juego(list)
%Recorrido:Jugadores(list)
%Tipo de algoritmo:Acceso a un elemento de la lista
juegoGetJugadores([Jugadores|_],Jugadores).

%Descripcion:Esta funcion obtiene la lista que representa al tablero desde la lista que representa al Juego
%Dominio:Juego(list)
%Recorrido:Tablero(list)
%Tipo de algoritmo:Acceso a un elemento de la lista
juegoGetTablero([_,Tablero|_],Tablero).

%Descripcion:Esta funcion entrega el dinero del banco desde la lista que representa el Juego
%Dominio:Juego(list)
%Recorrido:DineroBanco(int)
%Tipo de algoritmo:Acceso a un elemento de la lista
juegoGetDineroBanco([_,_,DineroBanco|_],DineroBanco).

%Descripcion: Esta funcion entrega la cantidad de daddos desde la lista que representa el Juego
%Dominio:Juego(list)
%Recorrido:NumeroDados(int)
%Tipo de algoritmo:Acceso a un elemento de la lista
juegoGetNumeroDados([_,_,_,NumeroDados|_],NumeroDados).

%Descripcion: Esta fucnion entrega el turno actual desde la lista que representa el juego
%Dominio:Juego(list)
%Recorrido:TurnoActual(int)
%Tipo de algoritmo:Acceso a un elemento de la lista
juegoGetTurnoActual([_,_,_,_,TurnoActual|_],TurnoActual).

%Descripcion:Esta funcion entrega la tasa de impuesto desde la lista que representa el juego
%Dominio:Juego(list)
%Recorrido:TasaImpuesto(int)
%Tipo de algoritmo:Acceso a un elemento de la lista
juegoGetTasaImpuesto([_,_,_,_,_,TasaImpuesto|_],TasaImpuesto).

%Descripcion:Esta funcion entrega el maximo de casas permitidos en el juego desde la lista que representa el juego
%Dominio:Juego(list)
%Recorrido:MaximoCasa(int)
%Tipo de algoritmo:Acceso a un elemento de la lista
juegoGetMaxCasas([_,_,_,_,_,_,MaximoCasas|_],MaximoCasas).

%Descripcion:Esta funcion entrega el maximo de hoteles permitidos en el juego desde la lista que representa el juego
%Dominio:Juego(list)
%Recorrido:MaximoHoteles(int)
%Tipo de algoritmo:Acceso a un elemento de la lista
juegoGetMaxHoteles([_,_,_,_,_,_,MaximoHoteles|_],MaximoHoteles).





%Descripcion:Esta funcion permite crear un nuevo juego con un nuevo tablero dentro de este juego
%Dominio:JuegoIn(list)XTableroIn(list)
%Recorrido:JuegoOut(list)
%Tipo de algoritmo:Modifciador
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
%Descripcion:Esta funcion perimite agrear un jugador a la partida, se crea un nuevo juego con todos elemento iguale excepto por el tablero ya que 
%se crea un nuevo tablero en el cual estan todos los elementos iguale excepto la lista de jugadores que ahora esta el nuevo jugador
% Tambien la funcion incia al jugador con 1500 y le resta ese dinero al banco
%
%Dominio:JuegoIN(list)XJugadorIn(list)
%Recorrido:JuegoOut(list)
%Tipo de algoritmo:
juegoAgregarJugador([JugadoresIn, Tablero, DineroBanco, Dados, Turno, TasaImpuesto, MaxCasas, MaxHoteles], 
        JugadorNuevo,
        [JugadoresOut, Tablero, NuevoDineroBanco, Dados, Turno, TasaImpuesto, MaxCasas, MaxHoteles]):-
        jugadorNuevoDinero(JugadorNuevo, 1500, JugadorConDinero),
        append(JugadoresIn, [JugadorConDinero], JugadoresOut),
        NuevoDineroBanco is DineroBanco - 1500.

%%getter de juego TurnoActual
%Descripcion:Esta funcion entrega el jugador actual en la partida
%Dominio:JuegoIn(list)
%Recorrido:JugadorActual(list)
%Tipo de algoritmo:
juegoObtenerJugadorActual(JuegoIn,JugadorActual):-
        juego(Jugadores, _, _, _, TurnoActual, _, _, _, JuegoIn),
        nth0(TurnoActual, Jugadores, JugadorActual).



%Descripcion: Genera una semilla semi aleatoria a partir de una semilla anterior
%Dominio:Xn(int) es la semilla actual
%Recorrido:Xn1 (int) es la nueva semila generada
%Tipo de algoritmo:
% Predicado myRandom
myRandom(Xn, Xn1):-
  Xn1 is (((1103515245 * Xn) + 12345) mod 2147483648).
% Predicado getDadoRandom que recibe la semilla y controla los resultados
%Descripcion:Esta funcion genera un numero aleatorio entre 1 y 6 asi simula el lanzamiento de un dado a partir de una semilla, ademas devuelve una nueva semilla generada para futuros lanzmiento de dados
%Dominio:Seed(int) es la semilla
%Recorrido:NvaSeed(int)X R(int); NvaSeed es la nueva semilla y R es el resultado
%Tipo de algoritmo:
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
%Descripcion: Esta funcion simula el lanzamiento de dados, ultiliza una lista de semillas aleatoria para calcular los resultasos y actualiza la semilla para futuros lanzamientos
%Dominio:JuegoIn(list)XListaSeed(list)
%Recorrido:NuevasSeed(list)XResultado(list)
%Tipo de algoritmo:
juegoLanzarDados(JuegoIn,ListaSeed,NuevasSeed,Resultado):-
  juegoGetNumeroDados(JuegoIn,ResultadoCantidadDados),
  lanzar(ResultadoCantidadDados,ListaSeed,NuevasSeed,Resultado).

%Descripcion: Esta funcion simula el lanzamiento de un dado usando una semilla, luego guara el eresultado y el valor de la nueva semilla en una lista, y continua recursivamente hasta que no queden mas semillas que usar
%Dominio:ResultadoCantidadDados(int)XListaSeed(list)
%Recorrido:ListaNuevasSeed(list)XListaResultado(list)
%Tipo de algoritmo: recursivo

%caso base
lanzar(0,[],[],[]).

%caso recursivo
lanzar(ResultadoCantidadDados,[PrimeraSeed|RestoSeed],[PrimeraNuevaSeed|RestoNuevaSeed],[PrimerResultado|RestoResultados]):-
  ResultadoCantidadDados>0,
  getDadoRandom(PrimeraSeed,PrimeraNuevaSeed,PrimerResultado),
  NewCantidadDados is ResultadoCantidadDados-1,
  lanzar(NewCantidadDados,RestoSeed,RestoNuevaSeed,RestoResultados).


%Descripcion: Esta funcion se encarga de sumar la lista de los valores dados al lanzar los dados, entrega como resultado la suma de los elementos
%Dominio:ListaLanzarDados(list)
%Recorrido:Resultado(int)
%Tipo de algoritmo: recursion
sumarDados([],0).
sumarDados([Cabeza|Cola],Resultado):-
  sumarDados(Cola,ResultadoAux),
  Resultado  is ResultadoAux + Cabeza.


%me falta actualizar la lista de jugadores con el nuevo jugador modificado
%Descripcion:Esta funcion sirve para modificar la posicion actual del jugador, simulando el movimiento del jugador en el tablero
%            Crea un nuevo jugador y le suma en las posiciones la suma de los valores de los dados, dejando el resto de parametros iguales.
%            Luego crea una nueva lista de jugadores dejando a todos los jugadores igual excepto el jugador que fue modificado.
%            Finalemnte crea un nuevo juego con todos los parametros iguales excepto el tablero que fue modificado.
%Dominio:JugadorInt(list)XIdJugador(list)XValoresDados(list)
%Recorrido:JuegoOut(list)
%Tipo de algoritmo:Modificador
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


%Descripcion:Esta funcion calcula la renta que se debe pagar por una propiedad especifica, se evalua si tiene hotel, casas o si esta hipotecada
%Dominio:JuegoIn(list)XPropiedadIn(list)
%Recorrido:Monto(int)
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
%Descripcion:Esta funcion suma el monto de todas las rentas que sean propiedad del jugador
%Dominio:Lista de propiedades(list)
%Recorrido:Monto Resultante(int)
%Tipo de algoritmo:Recursivo
sumarRentaJugador([],0).
sumarRentaJugador([PrimeraPropiedad|RestoPropiedad],Resultado):-
        sumarRentaJugador(RestoPropiedad,ResultadoAux),
        propiedad(_IdPropiedad,_NombrePropiedad,_Precio,Renta,_Duenno,_Casas,_EsHotel,_EstaHipotecada,PrimeraPropiedad),
        Resultado is ResultadoAux + Renta.
%Descripcion:Esta funcion se encarga de calgular el monto total de renta de todas las propiedades que posee un jugador
%Dominio:JuegoIn(list)XJugadorIn(list)
%Recorrido:MontoRenta(int)
%Tipo de algoritmo:
juegoCalcularRentaJugador(JuegoIn,JugadorIn,MontoRenta):-
  juego(_Jugadores,Tablero, _DineroBanco, _Dados, _Turno, _TasaImpuesto, _MaxCasas, _MaxHoteles, JuegoIn),
  tablero(_Propiedades,_CartasSuerte,_CartaComunidad,_CasillasEspeciales,Tablero),
  jugador(_IdJugador, _NombreJugador, _Dinero, PropiedadesJugador, _PosicionActual, _EstaEnCarcel, _TotalCartasSalirCarcel,JugadorIn),
  sumarRentaJugador(PropiedadesJugador,MontoRenta).
%Descripcion:Esta funcion permite construir un hotel en la propiedad si no se ha alcanzado el maximo de casas. 
%            La funcion crea una nueva propiedad con todos los parametros iguales exceptuando la cantidad de casas a la cual se le sumo una casa, esto lo hace con una funcion axuliar
%            Tambien se crea un nuevo tablero en el cual se encuentra la lista de las propiedades, se crea otra lista con todas las propiedades igaules excepto por la propiedad que fue modifcida
%            Finalmente se crea un nuevo tablero con todo los argumentos iguales excepto por el tablero que fue modificado
%Dominio:JuegoIn(list)XPropiedadIn(List)
%Recorrido:JuegoOut(list)
%Tipo de algoritmo:Modificador
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
  




%Descripcion:Esta funcion permite construir un hotel en una propiedad, si la propiedad ya tiene el maximo de casas necesaria
%            la funcion crea una una propiedad con nueva propiedad con la cantidad de casas igual a 0 y el atributo de hotel lo vuelve verdadero, esto gracias a una funcion auxiliar
%            Tambien crea un nuevo tablero donde se encuentran las propiedades, con todas las propiedades iguales excepto por la modificada.
%            Finalmente crea un juego con todos los argumentos iguales excepto por el tablero que ha sido modificado con la nueva propiedad
%Dominio:JuegoIn(list)XPropiedadIn(list)
%Recorrido:JuegoOut(list)
%Tipo de algoritmo: Modificador
juegoConstruirHotel(JuegoIn,PropiedadIn,JuegoOut):-
  juegoGetJugadores(JuegoIn,Jugadores),
  juegoGetTablero(JuegoIn,Tablero),
  juegoGetDineroBanco(JuegoIn,DineroBanco),
  juegoGetNumeroDados(JuegoIn,NumeroDados),
  juegoGetTurnoActual(JuegoIn,TurnoActual),
  juegoGetTasaImpuesto(JuegoIn,TasaImpuesto),
  juegoGetMaxCasas(JuegoIn,MaxCasas),
  juegoGetMaxHoteles(JuegoIn,MaxHoteles), 
  propiedadGetCasas(PropiedadIn,CasasEnPropiedad),
  CasasEnPropiedad=:=MaxCasas,
  propiedadSetHotel(PropiedadIn,PropiedadOut),
  tableroGetPropiedades(Tablero,ListaPropiedades),
  tableroActualizarPropiedades(ListaPropiedades,PropiedadOut,ListaPropiedadesActualizadas),
  tableroSetListaPropiedades(Tablero,ListaPropiedadesActualizadas,TableroOut),
  juego(Jugadores,TableroOut,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaxCasas,MaxHoteles,JuegoOut).




% extraer carta
%no esta probadooo debo probarlos
juegoExtraerCarta(JuegoIn,TipoMazo,Seed,NuevaSeed,JuegoOut,CartaOut):-
  juegoGetTablero(JuegoIn,Tablero),
  tableroGetCartasComunidad(Tablero,CartasComunidad),
  tableroGetCartasSuerte(Tablero,CartasSuerte),
  getDadoRandom([Seed|_],NuevaSeed,ResultadoRandom),%esto solo me entrega del uno al 6 ojo
  (TipoMazo=="carta comunidad"->     %debe estar escrito igual si no se cae
    nth0(ResultadoRandom,CartasComunidad,CartaOut),
     tableroActualizarCartas(CartasComunidad, CartaOut, NuevasCartasComunidad),
     tableroSetListaCartasComunidad(Tablero, NuevasCartasComunidad, TableroActualizado),
     writeln("tu carta es: "),
     writeln(CartaOut)
    

   ;TipoMazo=="carta suerte"->
    nth0(ResultadoRandom,CartasSuerte,CartaOut),
    tableroActualizarCartas(CartasSuerte, CartaOut, NuevasCartasSuerte),
    tableroSetListaCartasSuerte(Tablero, NuevasCartasSuerte, TableroActualizado),
     writeln("tu carta es: "),
     writeln(CartaOut)
  ),
  juegoSetTablero(JuegoIn,TableroActualizado,JuegoOut).


% juego(Jugadores,TableroIn,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaxCasas,MaxHoteles,JuegoOut).