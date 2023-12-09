% find_exit(Maze) :-
% this predicate is found in the find_exit.pl, solved by adding find_value/6 in the module of test.pl
% find the coordinate of the starting position:: total success, it returns the starting coordinate
% find_value(Maze, s, 0, 0, [], Start),
% find_value(Maze, e, 0, 0, [], End),
% write('starting coords: '), write(Start), nl, write('end coords: '), write(End).
% Summary of this code: it works well, just the code at the bottom gets the start and end coordinates better

find_exit(Maze, Actions) :-
    start_position(Maze, Start),
    end_position(Maze, End),
    write('starting coords: '), write(Start), nl, write('end coords: '), write(End),
    % now Start and End will hold the coordinates of the starting and ending coordinates
    valid_actions(Actions).

% Find the start position within the maze
start_position(Maze, (X, Y)) :-
    nth0(Y, Maze, Row),
    nth0(X, Row, s).

% find the end position within the maze
end_position(Maze, (X, Y)) :-
    nth0(Y, Maze, Row),
    nth0(X, Row, e).

% check the validity of the moves made by the user
% Check if the list of actions is valid
valid_actions([]).
valid_actions([Action|Rest]) :-
    member(Action, [left, right, up, down]),
    valid_actions(Rest).