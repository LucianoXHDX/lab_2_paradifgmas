/*id (int) X nombre (string) X precio (int) X renta (int) X dueño
(id_jugador/null) X casas (int) X esHotel (boolean) X estaHipotecada (boolean) X propiedad (property)*/
:-module(tdapropiedad, [propiedad/9,propiedadGetCasas/2,propiedadSetSumarCasa/2,propiedadSetHotel/2,propiedadSetHipotecada/2]).


propiedad(Id,Nombre,Precio,Renta,Duenno,Casas,EsHotel,EstaHipotecada,
[Id,Nombre,Precio,Renta,Duenno,Casas,EsHotel,EstaHipotecada]).

%getter de id
propiedadGetId([Id|_],Id).


%getter de Nombre
propiedadGetNombre([_,Nombre|_],Nombre).

%getter de Precio
propiedadGetPrecio([_,_,Precio|_],Precio).

%getter Renta
propiedadGetRenta([_,_,_,Renta|_],Renta).
%getter de duenno
propiedadGetDuenno([_,_,_,_,Duenno|_],Duenno).


%getter de Casas
propiedadGetCasas([_,_,_,_,_,Casas|_],Casas).


%getter de Hotel
propiedadGetHotel([_,_,_,_,_,_,Hotel|_],Hotel).


%getter hipotecada
propiedadGetHipotecada([_,_,_,_,_,_,_,Hipotecada|_],Hipotecada).

%setter de casas
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
propiedadSetHotel(PropiedadIn,PropiedadOut):-
    propiedadGetId(PropiedadIn,ResultadoId),
    propiedadGetNombre(PropiedadIn,ResultadoNombre),
    propiedadGetPrecio(PropiedadIn,ResultadoPrecio),
    propiedadGetRenta(PropiedadIn,ResultadoRenta),
    propiedadGetDuenno(PropiedadIn,ResultadoDuenno),
    propiedadGetCasas(PropiedadIn,ResultadoCantCasas),
    propiedadGetHipotecada(PropiedadIn,ResultadoHipoteca),
    propiedad(ResultadoId,ResultadoNombre,ResultadoPrecio,ResultadoRenta,ResultadoDuenno,ResultadoCantCasas,true,ResultadoHipoteca,PropiedadOut).
%setter de hipotecada
propiedadSetHipotecada(PropiedadIn,PropiedadOut):-
    propiedadGetId(PropiedadIn,ResultadoId),
    propiedadGetNombre(PropiedadIn,ResultadoNombre),
    propiedadGetPrecio(PropiedadIn,ResultadoPrecio),
    propiedadGetRenta(PropiedadIn,ResultadoRenta),
    propiedadGetDuenno(PropiedadIn,ResultadoDuenno),
    propiedadGetCasas(PropiedadIn,ResultadoCantCasas),
    propiedadGetHotel(PropiedadIn,ResultadoGetHotel),
    propiedad(ResultadoId,ResultadoNombre,ResultadoPrecio,ResultadoRenta,ResultadoDuenno,ResultadoCantCasas,ResultadoGetHotel,true,PropiedadOut).