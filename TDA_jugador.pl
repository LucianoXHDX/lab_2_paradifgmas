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

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
jugadorGetId([Id|_],Id).

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
jugadorGetNombre([_,Nombre|_],Nombre).

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
jugadorGetDinero([_,_,Dinero|_],Dinero).

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
jugadorGetPropiedades([_,_,_,Propiedades|_],Propiedades).

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
jugadorGetPosicionActual([_,_,_,_,PosicionActual|_],PosicionActual).

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
jugadorGetEstaEnCarcel([_,_,_,_,_,EstaEnCarcel|_],EstaEnCarcel).

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
jugadorGetTotalCartasSalirCarcel([_,_,_,_,_,_,TotalCartasSalirCarcel|_],TotalCartasSalirCarcel).


%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
jugadorSetDinero([Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel],
                 Cambio,
                 [Id, Nombre, NuevoDinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]) :-
    NuevoDinero is Dinero + Cambio.


%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
jugadorNuevoDinero([Id, Nombre, _, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel], NuevaPlata,[Id, Nombre, NuevaPlata, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]).
 

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
jugadorSumarPosicion([Id,Nombre,Dinero,Propiedades,PosicionActual,EstaEnCarcel,TotalCartasSalirCarcel],
                        CantAvanza,
                        [Id,Nombre,Dinero,Propiedades,NuevaPosicion,EstaEnCarcel,TotalCartasSalirCarcel]):-
                        NuevaPosicion is PosicionActual + CantAvanza .






%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
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

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
jugadorEstaEnBancarrota(JugadorIn):-
        jugadorGetDinero(JugadorIn,DineroJugador),
        DineroJugador =< 0.
%verdadero si esta en bancarrota
