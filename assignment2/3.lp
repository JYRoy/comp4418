%%% English layout. 
location(1, 1).
location(2, 1..3).
location(3, 1).

%%% location is occupied.
occupied(X, Y) :- location(X, Y).

%%% location is empty.
empty(X, Y) :- location(X, Y).

%%% Timestep.
timestep(1..3).

%%% Declare the initial state of each location. occupied/empty, timestep.
state(occupied(1, 1), 1).
state(occupied(2, 1..3), 1).
state(empty(3, 1), 1).

%%% Direction.
direction(up). direction(down). direction(left). direction(right).
%%% Movement. which location could move to which direction. 
couldmove(up, X, Y, T) :- state(occupied(X, Y), T), state(occupied(X, Y-1), T), state(empty(X, Y-2), T), timestep(T).
couldmove(down, X, Y, T) :- state(occupied(X, Y), T), state(occupied(X, Y+1), T), state(empty(X, Y+2), T), timestep(T).
couldmove(left, X, Y, T) :- state(occupied(X, Y), T), state(occupied(X-1, Y), T), state(empty(X-2, Y), T), timestep(T).
couldmove(right, X, Y, T) :- state(occupied(X, Y), T), state(occupied(X+1, Y), T), state(empty(X+2, Y), T), timestep(T).

%%% move at each timestep.
1 { move(D, X, Y, T) : direction(D), occupied(X, Y) } 1 :- timestep(T).
:- move(D, X, Y, T), not couldmove(D, X, Y, T), timestep(T).

%%% change the state.
state(occupied(X, Y-2), T+1) :- move(up, X, Y, T), timestep(T).
state(empty(X, Y-1), T+1) :- move(up, X, Y, T), timestep(T).
state(empty(X, Y), T+1) :- move(up, X, Y, T), timestep(T).

state(occupied(X, Y+2), T+1) :- move(down, X, Y, T), timestep(T).
state(empty(X, Y+1), T+1) :- move(down, X, Y, T), timestep(T).
state(empty(X, Y), T+1) :- move(down, X, Y, T), timestep(T).

state(occupied(X-2, Y), T+1) :- move(left, X, Y, T), timestep(T).
state(empty(X-1, Y), T+1) :- move(left, X, Y, T), timestep(T).
state(empty(X, Y), T+1) :- move(left, X, Y, T), timestep(T).

state(occupied(X+2, Y), T+1) :- move(right, X, Y, T), timestep(T).
state(empty(X+1, Y), T+1) :- move(right, X, Y, T), timestep(T).
state(empty(X, Y), T+1) :- move(right, X, Y, T), timestep(T).


%%% declare states which are unchanged.
%%% definite changed states.
changed(X, Y-2, T+1) :- move(up, X, Y, T), timestep(T).
changed(X, Y-1, T+1) :- move(up, X, Y, T), timestep(T).
changed(X, Y, T+1) :- move(up, X, Y, T), timestep(T).

changed(X, Y+2, T+1) :- move(down, X, Y, T), timestep(T).
changed(X, Y+1, T+1) :- move(down, X, Y, T), timestep(T).
changed(X, Y, T+1) :- move(down, X, Y, T), timestep(T).

changed(X-2, Y, T+1) :- move(left, X, Y, T), timestep(T).
changed(X-1, Y, T+1) :- move(left, X, Y, T), timestep(T).
changed(X, Y, T+1) :- move(left, X, Y, T), timestep(T).

changed(X+2, Y, T+1) :- move(right, X, Y, T), timestep(T).
changed(X+1, Y, T+1) :- move(right, X, Y, T), timestep(T).
changed(X, Y, T+1) :- move(right, X, Y, T), timestep(T).
%%% definite unchanged state.
state(occupied(X, Y), T+1) :- state(occupied(X, Y), T), not changed(X, Y, T+1), location(X, Y), timestep(T).
state(empty(X, Y), T+1) :- state(empty(X, Y), T), not changed(X, Y, T+1), location(X, Y), timestep(T).

%%% finsh state.
:- not state(empty(2, 1..3), 4).
:- not state(empty(3, 1), 4).
:- not state(occupied(1, 1), 4).

%%% Show.
#show move/4.
#show state/2.

