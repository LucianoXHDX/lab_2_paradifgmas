:- module(tdajugador, [jugador/8, jugadorSetDinero/3, jugadorNuevoDinero/3,jugadorSumarPosicion/3]).
:- use_module('TDA_propiedad.pl',[propiedad/9]).
%:- use_module('TDA_propiedad.pl',[propiedad/9]).
/*id (int) X nombre (string) X dinero (int) X propiedades (list id's)
 X posicionActual (int) X estaEnCarcel (boolean) X totalCartasSalirCarcel (int) X jugador (TDA player)*/


jugador(Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel,
        [Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]).

%setter de dinero, propiedades, posicion actual esta en carcel y total de cartas
%setter dinero

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
jugadorComprarPropiedad(JugadorIn,PropiedadIn,PropiedadOut,JugadorOut):-
        jugador(IdJugador, NombreJugador, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel,JugadorIn),
        propiedad(IdPropiedad,NombrePropiedad,Precio,Renta,_,Casas,EsHotel,EstaHipotecada,PropiedadIn),
        Dinero>=Precio,%puede comprar la propiedad
        write("aca?"),
        jugadorSetDinero(JugadorIn,-Precio,JugadorConDineroActualizado),%aqui caga la wea
        jugador(_, _, NuevoDinero, _, _, _, _, JugadorConDineroActualizado),
        
         write("hola?"),
        propiedad(IdPropiedad,NombrePropiedad,Precio,Renta,IdJugador,Casas,EsHotel,EstaHipotecada,PropiedadOut),
        append(Propiedades,[IdPropiedad],NuevasPropiedades),
        jugador(IdJugador, NombreJugador, NuevoDinero, NuevasPropiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel,JugadorOut). 
