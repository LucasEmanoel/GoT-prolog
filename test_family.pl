:- begin_tests(families).

test(gerou) :-
    gerou(eddard_stark, sansa_stark),
    \+ gerou(rhaenys_targaryen, sansa_stark). % \+ negacao

test(irma) :-
    irma(arya_stark, sansa_stark),
    \+ irma(daenerys_targaryen, sansa_stark).

test(irmao) :-
    irmao(robb_stark, sansa_stark),
    \+ irmao(eddard_stark, aerys_targaryen),
    \+ irmao(jon_snow, daenerys_targaryen).

test(filhos) :-
    filhos( eddard_stark, [arya_stark, bran_stark, rickon_stark, robb_stark, sansa_stark]).
    \+filhos( eddard_stark, [arya_stark, bran_stark, rickon_stark, robb_stark, jon_snow]).

:- end_tests(families).

run_tests :- run_tests(families). 

:- run_tests.
