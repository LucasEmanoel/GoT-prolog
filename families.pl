gerou(rickard_stark, brandon_stark).
gerou(rickard_stark, eddard_stark).
gerou(rickard_stark, benjen_stark).
gerou(rickard_stark, lyanna_stark).
gerou(stark_desconhecida, brandon_stark).
gerou(stark_desconhecida, eddard_stark).
gerou(stark_desconhecida, benjen_stark).
gerou(stark_desconhecida, lyanna_stark).
gerou(eddard_stark, robb_stark).
gerou(eddard_stark, sansa_stark).
gerou(eddard_stark, arya_stark).
gerou(eddard_stark, bran_stark).
gerou(eddard_stark, rickon_stark).
gerou(catelyn_stark, robb_stark).
gerou(catelyn_stark, sansa_stark).
gerou(catelyn_stark, arya_stark).
gerou(catelyn_stark, bran_stark).
gerou(catelyn_stark, rickon_stark).
gerou(lyanna_stark, jon_snow).

gerou(aerys_targaryen, rhaegar_targaryen).
gerou(aerys_targaryen, viserys_targaryen).
gerou(aerys_targaryen, daenerys_targaryen).
gerou(rhaella_targaryen, rhaegar_targaryen).
gerou(rhaella_targaryen, viserys_targaryen).
gerou(rhaella_targaryen, daenerys_targaryen).
gerou(rhaegar_targaryen, rhaenys_targaryen).
gerou(rhaegar_targaryen, jon_snow).

gerou(tywin_lannister, cersei_lannister).
gerou(tywin_lannister, jaime_lannister).
gerou(tywin_lannister, tyrion_lannister).
gerou(joanna_lannister, cersei_lannister).
gerou(joanna_lannister, jaime_lannister).
gerou(joanna_lannister, tyrion_lannister).
gerou(cersei_lannister, joffery_lannister).
gerou(cersei_lannister, myrcella_lannister).
gerou(cersei_lannister, tommen_lannister).
gerou(jaime_lannister, joffery_lannister).
gerou(jaime_lannister, myrcella_lannister).
gerou(jaime_lannister, tommen_lannister).
gerou(kevan_lannister, lancel_lannister).

homem(aerys_targaryen).
homem(benjen_stark).
homem(bran_stark).
homem(brandon_stark).
homem(eddard_stark).
homem(jaime_lannister).
homem(joffery_lannister).
homem(jon_snow).
homem(kevan_lannister).
homem(lancel_lannister).
homem(rhaegar_targaryen).
homem(rickard_stark).
homem(rickon_stark).
homem(robb_stark).
homem(tommen_lannister).
homem(tyrion_lannister).
homem(tywin_lannister).
homem(viserys_targaryen).
mulher(arya_stark).
mulher(catelyn_stark).
mulher(cersei_lannister).
mulher(daenerys_targaryen).
mulher(joanna_lannister).
mulher(lyanna_stark).
mulher(myrcella_lannister).
mulher(rhaella_targaryen).
mulher(rhaenys_targaryen).
mulher(sansa_stark).
mulher(stark_desconhecida).

child(X, Y) :-
	gerou(Y, X).

filha(X, Y) :-
	gerou(Y, X),
	mulher(X).

filho(X, Y) :-
	gerou(Y, X),
	homem(X).

%lista de filhos

filhos(X, Filhos) :-
	setof(Y, gerou(X,Y), Filhos),
	!.

filhos(X, Filhos) :-
	not(setof(Y, gerou(X,Y), Filhos)),		
	Filhos = none.							

mae(X, Y) :-
	gerou(X, Y),
	mulher(X).

pai(X, Y) :-
	gerou(X, Y),
	homem(X).

%quem sao os pais

pais(X, Pais) :-
	setof(Y, gerou(Y, X), Pais),
	!.

pais(X, Pais) :-
	not(setof(Y, gerou(Y, X), Pais)),		
	Pais = unknown.								

familia(X, Y) :-
	gerou(Z, X),
	gerou(Z, Y),
	dif(X, Y).									

list_irmaos(X, Irmaos) :-
	setof(Y, familia(X,Y), Irmaos);
	Irmaos = none.							

irmaos(X, Y) :-
	list_irmaos(X, Irmaos),
	member(Y, Irmaos).						
												
irma(X, Y) :-
	irmaos(X, Y),
	mulher(X).

irmao(X, Y) :-
	irmaos(X, Y),
	homem(X).



