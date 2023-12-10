% Predicate to initiate the search for an exit
find_exit(Maze, Actions) :-
    start_position(Maze, Start),
    end_position(Maze, End),
    write('starting coords: '), write(Start), nl, write('end coords: '), write(End), nl,
    depth_first_search(Start, End, Maze, [Start], [], Actions),
    write('Sucess. the path is '), write(Actions).

% Depth-first search algorithm
depth_first_search(End, End, _, _, Actions, FinalActions) :-
    reverse(Actions, FinalActions).
depth_first_search(Position, End, Maze, Visited, Acc, Actions) :-
    move(Position, Maze, Move, NewPosition),
    \+ member(NewPosition, Visited), % Avoid cycles
    depth_first_search(NewPosition, End, Maze, [NewPosition|Visited], [Move|Acc], Actions).

% Define movements based on actions and defines the NewPosition
move((X, Y), Maze, left, (X1, Y)) :- X1 is X - 1, valid_position((X1, Y), Maze).
move((X, Y), Maze, right, (X1, Y)) :- X1 is X + 1, valid_position((X1, Y), Maze).
move((X, Y), Maze, up, (X, Y1)) :- Y1 is Y - 1, valid_position((X, Y1), Maze).
move((X, Y), Maze, down, (X, Y1)) :- Y1 is Y + 1, valid_position((X, Y1), Maze).

% Check if the new position is valid (not a wall or outside the maze)
valid_position((X, Y), Maze) :-
    nth0(Y, Maze, Row),
    nth0(X, Row, Cell),
    Cell \= w,
    Cell \= '|',
    Cell \= '-',
    \+ (X < 0; Y < 0),
    length(Maze, NumRows),
    length(Row, NumCols),
    X < NumCols,
    Y < NumRows.


% Find the start position within the maze
start_position(Maze, (X, Y)) :-
    nth0(Y, Maze, Row),
    nth0(X, Row, s).

% Find the end position within the maze
end_position(Maze, (X, Y)) :-
    nth0(Y, Maze, Row),
    nth0(X, Row, e).
