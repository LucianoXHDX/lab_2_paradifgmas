

/* -----------------------------------------| 
|                                           |
|                                           |
|             COMENTADA CORECTAMENTE        |
|                                           |
|-------------------------------------------|
*/

:- module(tdapropiedad, [
    propiedad/9,
    propiedadGetId/2,
    propiedadGetNombre/2,
    propiedadGetPrecio/2,
    propiedadGetRenta/2,
    propiedadGetDuenno/2,
    propiedadGetCasas/2,
    propiedadGetHotel/2,
    propiedadGetHipotecada/2,
    propiedadSetSumarCasa/2,
    propiedadSetHotel/2,
    propiedadHipotecar/2
]).

%Descripcion: Esta funcion es el constructor del TDA propiedad, genera una lista  que representa una propiedad en el juego
%Dominio:Id(list)XNombre(string)XPrecio(int)XRenta(int)XDuenno(Id_jugador/null)XCasas(int)XEsHotel(bool)XEstaHipotecada(bool)
%Recorrido:Propiedad(list), con los parametros mencionados en el dominio
%Tipo de algoritmo:Constructor
propiedad(Id,Nombre,Precio,Renta,Duenno,Casas,EsHotel,EstaHipotecada,
[Id,Nombre,Precio,Renta,Duenno,Casas,EsHotel,EstaHipotecada]).

%getter de id
%Descripcion: Esta funcion entrega el identidicado (Id) de la lista que representa la propiedad
%Dominio:Propiedad(list)
%Recorrido:Id(int)
%Tipo de algoritmo:Acceso a un elemento de lta lista
propiedadGetId([Id|_],Id).


%getter de Nombre
%Descripcion: Esta funcion entrega el nombre de la propiedad desde la lista que representa la propiedad
%Dominio:Propiedad(list)
%Recorrido:Nombre(string)
%Tipo de algoritmo:Acceso a un elemento de la lista
propiedadGetNombre([_,Nombre|_],Nombre).

%getter de Precio
%Descripcion: Esta funcion entrega el Precio de la propieda desde la lista que representa la propiedad
%Dominio:Propiedad(list)
%Recorrido:Precio(int)
%Tipo de algoritmo:Acceso a un elemento de la lista
propiedadGetPrecio([_,_,Precio|_],Precio).

%Descripcion: Esta funcion entrega el valor renta de la propiedad desde  la lista que representa la propiedad
%Dominio:Propiedad(list)
%Recorrido:Renta(int)
%Tipo de algoritmo:Acceso a un elemento de la lista
propiedadGetRenta([_,_,_,Renta|_],Renta).

%getter de duenno
%Descripcion: Esta funcion entrega el dueño de la propiead desde la lista que representa la propiedad
%Dominio: Propiedad(list)
%Recorrido:Duenno(int/null)
%Tipo de algoritmo:Acceso a un elemento de la lista
propiedadGetDuenno([_,_,_,_,Duenno|_],Duenno).

%getter de Casas
%Descripcion: Esta funcion entrega la cantidad de casa que tiene la propiedad desde la lista que representa la propiedad
%Dominio:Propiedad(list)
%Recorrido:Cantidad de Casas(int)
%Tipo de algoritmo:Acceso a un elemento de la lista
propiedadGetCasas([_, _, _, _, _, Casas, _, _], Casas).


%getter de Hotel
%Descripcion: Esta funcion entrega el booleano si es un hotel o no, desde la lista que representa la propiedad
%Dominio:Propiedad(list)
%Recorrido:Hotel(bool), true si tiene hotel
%Tipo de algoritmo:Acceso a un elemento de la lista
propiedadGetHotel([_,_,_,_,_,_,Hotel|_],Hotel).


%getter hipotecada
%Descripcion: Esta funcion entrega el booleano si esta hipotecada o no, desde la lista que representa la propiedad
%Dominio:Propiedad(list)
%Recorrido:Hipotecada(bool), verdadero si esta hipotecada
%Tipo de algoritmo:Acceso a un elemento de la lista
propiedadGetHipotecada([_,_,_,_,_,_,_,Hipotecada|_],Hipotecada).

%setter de casas
%Descripcion:Esta funcion permite sumar una casa a una propiedad, para ello crea nueva propiedad con todos los argumentos iguales excepto por la cantidad de casas ya que le suma uno
%Dominio:PropiedadeIn(list)
%Recorrido:PropiedadOut(list)
%Tipo de algoritmo:Modificador
propiedadSetSumarCasa(PropiedadIn,PropiedadOut):-
    propiedadGetId(PropiedadIn,ResultadoId),
    propiedadGetNombre(PropiedadIn,ResultadoNombre),
    propiedadGetPrecio(PropiedadIn,ResultadoPrecio),
    propiedadGetRenta(PropiedadIn,ResultadoRenta),

    propiedadGetDuenno(PropiedadIn,ResultadoDuenno),
    propiedadGetCasas(PropiedadIn,ResultadoCantCasas),
    propiedadGetHotel(PropiedadIn,ResultadoGetHotel),
    propiedadGetHipotecada(PropiedadIn,ResultadoHipoteca),
    NuevaCantCasas is ResultadoCantCasas +1,
propiedad(ResultadoId,ResultadoNombre,ResultadoPrecio,ResultadoRenta,ResultadoDuenno,NuevaCantCasas,ResultadoGetHotel,ResultadoHipoteca,PropiedadOut).


%setter de hotel
%Descripcion:Esta funcion permite construir un hotel, crea una propiedad con todos los parametros iguales excepto la cantidad de casas que las deja en 0 y el booleano asociado 
% a si es hotel o no, cambia por verdadero(true)
%Dominio:PropiedadIn(list)
%Recorrido:PropiedadOut(list)
%Tipo de algoritmo:Modificador
propiedadSetHotel(PropiedadIn,PropiedadOut):-
    propiedadGetId(PropiedadIn,ResultadoId),
    propiedadGetNombre(PropiedadIn,ResultadoNombre),
    propiedadGetPrecio(PropiedadIn,ResultadoPrecio),
    propiedadGetRenta(PropiedadIn,ResultadoRenta),
    propiedadGetDuenno(PropiedadIn,ResultadoDuenno),
    propiedadGetHipotecada(PropiedadIn,ResultadoHipoteca),
    propiedad(ResultadoId, ResultadoNombre, ResultadoPrecio, ResultadoRenta, ResultadoDuenno, 0, true, ResultadoHipoteca, PropiedadOut).
%setter de hipotecada
%Descripcion:Esta funcion permite hipotecar la propiedad, crea una propiedad con todos los parametros iguales excepto por el booleano asociado a si la propiedad esta hipotecada, la cual lo deja con true(verdader)
%Dominio:PropiedadIn(list)
%Recorrido:PropiedadOut(list)
%Tipo de algoritmo:Modificador propiedadHipotecar
propiedadHipotecar(PropiedadIn,PropiedadOut):-
    propiedadGetId(PropiedadIn,ResultadoId),
    propiedadGetNombre(PropiedadIn,ResultadoNombre),
    propiedadGetPrecio(PropiedadIn,ResultadoPrecio),
    propiedadGetRenta(PropiedadIn,ResultadoRenta),
    propiedadGetDuenno(PropiedadIn,ResultadoDuenno),
    propiedadGetCasas(PropiedadIn,ResultadoCantCasas),
    propiedadGetHotel(PropiedadIn,ResultadoGetHotel),
    propiedad(ResultadoId,ResultadoNombre,ResultadoPrecio,ResultadoRenta,ResultadoDuenno,ResultadoCantCasas,ResultadoGetHotel,true,PropiedadOut).