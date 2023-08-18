transporte(juan, camina).
transporte(marcela, subte(a)).
transporte(pepe, colectivo(160,d)).
transporte(elena, colectivo(76)).
transporte(maria, auto(500, fiat,2015)).
transporte(ana, auto(fiesta, ford, 2014)).
transporte(roberto, auto(qubo, fiat, 2015)).
manejaLento(manuel).
manejaLento(ana).

tardaMucho(Persona):-transporte(Persona, camina).
tardaMucho(Persona):-transporte(Persona, auto(_, _, _)), manejaLento(Persona).

viajaEnColetivo(Persona):-transporte(Persona, Colectivo), esColectivo(Colectivo).

esColectivo(colectivo(_)).
esColectivo(colectivo(_, _)).

%lugar(nombre,hotel(nombre,cantEstrellas,montoDiario)%
lugar(marDelPlata, hotel(elViajante,4,1500)).
lugar(marDelPlata, hotel(casaNostra,3,1000)).
lugar(lasToninas, hotel(holidays,2,500)).
lugar(tandil,quinta(amanecer,pileta,650)).
lugar(bariloche,carpa(80)).
lugar(laFalda, casa(pileta,600)).
lugar(rosario, casa(garaje,400)).

%puedeGastar(nombre,cantDias,montoTotal)%
puedeGastar(ana,4,10000).
puedeGastar(hernan,5,8000).
puedeGastar(mario,5,4000).


puedeIr(Persona, Lugar, Alojamiento):- puedeGastar(Persona, CantDias, Disponible), lugar(Lugar, Alojamiento),
    cumpleCondiciones(Alojamiento, MontoDiario),  Disponible >= CantDias * MontoDiario.

cumpleCondiciones(hotel(_,Estrellas, MontoDia), MontoDia):- Estrellas > 3.
cumpleCondiciones(casa(garaje, MontoDia), MontoDia).
cumpleCondiciones(quinta(_, pileta, MontoDia), MontoDia).
cumpleCondiciones(carpa(MontoDia), MontoDia).


puedeIrACualquierLugar(Persona):-persona(Persona), forall(lugar(Lugar, _), puedeIr(Persona, Lugar, _)).

persona(Persona):-puedeGastar(Persona, _, _).


genero(titanic,drama).
genero(gilbertGrape,drama).
genero(atrapameSiPuedes,comedia).
genero(ironMan,accion).
genero(rapidoYFurioso,accion).
genero(elProfesional,drama).

gusta(belen,titanic).
gusta(belen,gilbertGrape).
gusta(belen,elProfesional).
gusta(juan, ironMan).
gusta(pedro, atrapameSiPuedes).
gusta(pedro, rapidoYFurioso).

soloLeGustaPeliculasDeGenero(Persona, Genero):- gustaPelicula(Persona), generoPelicula(Genero), 
forall(gusta(Persona, Pelicula), genero(Pelicula, Genero)).

gustaPelicula(Persona):- gusta(Persona, _).

generoPelicula(Genero):- genero(_, Genero).


peliculasQueLeGustaPorGenero(Persona, Genero, Peliculas):- gustaPelicula(Persona), generoPelicula(Genero), 
findall(Pelicula, (gusta(Persona, Pelicula), genero(Pelicula, Genero)), Peliculas).


sublista([],[]).
sublista([Cab|Cola], [Cab|Resto]):- sublista(Cola, Resto).
sublista([_|Cola], Lista):-sublista(Cola, Lista).



