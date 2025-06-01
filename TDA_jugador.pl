:- module(tdajugador, [jugador/8, jugadorSetDinero/3, jugadorNuevoDinero/3,jugadorSumarPosicion/3,jugadorGetId/2]).
:- use_module('TDA_propiedad.pl',[propiedad/9]).
%:- use_module('TDA_propiedad.pl',[propiedad/9]).
/*id (int) X nombre (string) X dinero (int) X propiedades (list id's)
 X posicionActual (int) X estaEnCarcel (boolean) X totalCartasSalirCarcel (int) X jugador (TDA player)*/

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:

jugador(Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel,
        [Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]).

%setter de dinero, propiedades, posicion actual esta en carcel y total de cartas
%setter dinero
jugadorGetId([Id|_],Id).
jugadorGetNombre([_,Nombre|_],Nombre).
jugadorGetDinero([_,_,Dinero|_],Dinero).
jugadorGetPropiedades([_,_,_,Propiedades|_],Propiedades).
jugadorGetPosicionActual([_,_,_,_,PosicionActual|_],PosicionActual).
jugadorGetEstaEnCarcel([_,_,_,_,_,EstaEnCarcel|_],EstaEnCarcel).
jugadorGetTotalCartasSalirCarcel([_,_,_,_,_,_,TotalCartasSalirCarcel|_],TotalCartasSalirCarcel).


%getter



%finGetter

jugadorSetDinero([Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel],
                 Cambio,
                 [Id, Nombre, NuevoDinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]) :-
    NuevoDinero is Dinero + Cambio.


jugadorNuevoDinero([Id, Nombre, _, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel], NuevaPlata,[Id, Nombre, NuevaPlata, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]).
 %setter Mover jugador y que se sume su posicion
jugadorSumarPosicion([Id,Nombre,Dinero,Propiedades,PosicionActual,EstaEnCarcel,TotalCartasSalirCarcel],
                        CantAvanza,
                        [Id,Nombre,Dinero,Propiedades,NuevaPosicion,EstaEnCarcel,TotalCartasSalirCarcel]):-
                        NuevaPosicion is PosicionActual + CantAvanza .

%COMPRARPROPIEDAS


%hacer con setters
jugadorComprarPropiedad(JugadorIn,PropiedadIn,PropiedadOut,JugadorOut):-
        jugador(IdJugador, NombreJugador, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel,JugadorIn),
        propiedad(IdPropiedad,NombrePropiedad,Precio,Renta,_Duenno,Casas,EsHotel,EstaHipotecada,PropiedadIn),
        Dinero>=Precio,%puede comprar la propiedad
        jugadorSetDinero(JugadorIn,-Precio,JugadorConDineroActualizado),%aqui caga la wea
        jugador(_, _, NuevoDinero, _, _, _, _, JugadorConDineroActualizado),
        propiedad(IdPropiedad,NombrePropiedad,Precio,Renta,IdJugador,Casas,EsHotel,EstaHipotecada,PropiedadOut),
        append(Propiedades,[IdPropiedad],NuevasPropiedades),
        jugador(IdJugador, NombreJugador, NuevoDinero, NuevasPropiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel,JugadorOut). 
%verificar bancarrota
jugadorEstaEnBancarrota(JugadorIn):-
        jugadorGetDinero(JugadorIn,DineroJugador),
        DineroJugador =< 0.
%verdadero si esta en bancarrota
%setter para mover al jugador




/*tableroActualizarPropiedades([],_,[]).% caso base

tableroActualizarPropiedades([PrimeraPropiedad|RestoPropiedades],PropiedadIn,[PropiedadIn|RestoPropiedades]):-
  propiedadGetId(PropiedadIn,IdPropiedadIn),
  propiedadGetId(PrimeraPropiedad,IdPrimeraPropiedad),
  IdPrimeraPropiedad =:= IdPropiedadIn, !.

tableroActualizarPropiedades([PrimeraPropiedad|RestoPropiedades],PropiedadIn,[PrimeraPropiedad|ListaPropiedadesActualizadas]):-
  tableroActualizarPropiedades(RestoPropiedades,PropiedadIn,ListaPropiedadesActualizadas).*/