find_exit(Maze, Actions) :-
    start_position(Maze, Start),
    end_position(Maze, End),
    write('starting coords: '), write(Start), nl, write('end coords: '), write(End), nl,
    % now Start and End will hold the coordinates of the starting and ending coordinates
    valid_actions(Actions),
    traverse_maze(Start, Maze, Actions),
    write('Sucess. the path is '), write(Actions).

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

% Traverse the maze using the list of actions
traverse_maze(Position, Maze, []) :-
    end_position(Maze, Position).
traverse_maze(Position, Maze, [Action|Rest]) :-
    move(Action, Position, NewPosition),
    valid_position(NewPosition, Maze),
    % (end_position(Maze, NewPosition) -> true);
    traverse_maze(NewPosition, Maze, Rest).

% Define movements based on actions and defines the NewPosition
move(left, (X, Y), (X1, Y)) :- X1 is X - 1.
move(right, (X, Y), (X1, Y)) :- X1 is X + 1.
move(up, (X, Y), (X, Y1)) :- Y1 is Y - 1.
move(down, (X, Y), (X, Y1)) :- Y1 is Y + 1.

% Check if the new position is valid (not a wall or outside the maze)
valid_position((X, Y), Maze) :-
    nth0(Y, Maze, Row),
    nth0(X, Row, Cell),
    \+ member(Cell, [w]). % 'w' represents a wall
