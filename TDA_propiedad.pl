/*id (int) X nombre (string) X precio (int) X renta (int) X dueño
(id_jugador/null) X casas (int) X esHotel (boolean) X estaHipotecada (boolean) X propiedad (property)*/
:-module(tdapropiedad, [propiedad/9,propiedadGetCasas/2,propiedadSetSumarCasa/2,propiedadSetHotel/2,propiedadSetHipotecada/2,propiedadGetId/2]).

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
propiedad(Id,Nombre,Precio,Renta,Duenno,Casas,EsHotel,EstaHipotecada,
[Id,Nombre,Precio,Renta,Duenno,Casas,EsHotel,EstaHipotecada]).

%getter de id
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
propiedadGetId([Id|_],Id).


%getter de Nombre
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
propiedadGetNombre([_,Nombre|_],Nombre).

%getter de Precio
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
propiedadGetPrecio([_,_,Precio|_],Precio).

%getter Renta
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
propiedadGetRenta([_,_,_,Renta|_],Renta).
%getter de duenno
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
propiedadGetDuenno([_,_,_,_,Duenno|_],Duenno).


%getter de Casas
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
propiedadGetCasas([_,_,_,_,_,Casas|_],Casas).


%getter de Hotel
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
propiedadGetHotel([_,_,_,_,_,_,Hotel|_],Hotel).


%getter hipotecada
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
propiedadGetHipotecada([_,_,_,_,_,_,_,Hipotecada|_],Hipotecada).

%setter de casas
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
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
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
propiedadSetHotel(PropiedadIn,PropiedadOut):-
    propiedadGetId(PropiedadIn,ResultadoId),
    propiedadGetNombre(PropiedadIn,ResultadoNombre),
    propiedadGetPrecio(PropiedadIn,ResultadoPrecio),
    propiedadGetRenta(PropiedadIn,ResultadoRenta),
    propiedadGetDuenno(PropiedadIn,ResultadoDuenno),
    propiedadGetHipotecada(PropiedadIn,ResultadoHipoteca),
    propiedad(ResultadoId, ResultadoNombre, ResultadoPrecio, ResultadoRenta, ResultadoDuenno, 0, true, ResultadoHipoteca, PropiedadOut).
%setter de hipotecada
%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
propiedadSetHipotecada(PropiedadIn,PropiedadOut):-
    propiedadGetId(PropiedadIn,ResultadoId),
    propiedadGetNombre(PropiedadIn,ResultadoNombre),
    propiedadGetPrecio(PropiedadIn,ResultadoPrecio),
    propiedadGetRenta(PropiedadIn,ResultadoRenta),
    propiedadGetDuenno(PropiedadIn,ResultadoDuenno),
    propiedadGetCasas(PropiedadIn,ResultadoCantCasas),
    propiedadGetHotel(PropiedadIn,ResultadoGetHotel),
    propiedad(ResultadoId,ResultadoNombre,ResultadoPrecio,ResultadoRenta,ResultadoDuenno,ResultadoCantCasas,ResultadoGetHotel,true,PropiedadOut).