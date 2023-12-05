:- begin_tests(families).

test(gerou) :-
    gerou(eddard_stark, sansa_stark),
    \+ gerou(rhaenys_targaryen, sansa_stark). % \+ negacao

test(irma) :-
    irma(arya_stark, sansa_stark),
    \+ irma(daenerys_targaryen, sansa_stark).

:- end_tests(families).

run_tests :- run_tests(families). 

:- run_tests.
