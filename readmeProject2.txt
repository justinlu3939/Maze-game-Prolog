The files included are the project2.pl, test.pl, example.pl and the write-up.
The project2.pl contains the predicate find_exit/2 that finds a path from start to finish if the second parameter is unbounded or traverses and checks the list of actions in the second parameter (if it is bounded).
The test.pl is similar to the original test.pl but it has a modified module and changed symbols for the boundaries.
The example.pl is similar to the original example.pl but it has changed symbols for the boundaries.

In order to run the code properly, both the test.pl and project2.pl just needs to be consulted in the PrologSWIPL application. Calls to the gen_map and display_map predicate in the test.pl works. Although you may need to write the display predicate as test:display_map() for a better pretty print. Predicates of the example.pl could also be called to generate maps as well. The find_exit predicate in the project2.pl can find the path or check for the path of the mazes created by test.pl and example.pl.

Examples of input:
gen_map(4, 5, 5, M), test:display_map(M), find_exit(M, Actions).
gen_map(4, 5, 5, M), test:display_map(M), find_exit(M, [right, right, down]).
simple_map(M), test:display_map(M), find_exit(M, [right, right]).