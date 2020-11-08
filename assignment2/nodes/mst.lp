%%% target
TG-1 { edge(V1, V2, W) : realweight(V1, V2, W) } TG-1 :- target(TG).

%%% the sum of the weights of the selected edges should be below O(threshold).
total(S) :- S = #sum { W, V1, V2 : edge( V1, V2, W) }.
:- total(S), S > TS, threshold(TS).

%%% undirected graph
path(V1, V2) :- edge(V1, V2, W).
path(V1, V2) :- path(V2, V1).

%%% connection
connected(V1, V2) :- path(V1, V2).
connected(V1, V3) :- connected(V1, V2), path(V2,V3).
:- not connected(V1, V4), path(V1, V2), path(V3, V4).

select(V1, V2) :- edge(V1, V2, W).

#show select/2.


