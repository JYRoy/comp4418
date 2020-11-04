vertex ( v1 ). vertex ( v2 ). vertex ( v3 ).
vertex ( v4 ). vertex ( v5 ). vertex ( v6 ).
vertex ( v7 ). vertex ( v8 ). vertex ( v9 ).
weight ( v1 , v2 ,3). weight ( v1 , v3 ,3).
weight ( v2 , v4 ,1). weight ( v2 , v5 ,5).
weight ( v3 , v4 ,3). weight ( v3 , v6 ,4).
weight ( v4 , v5 ,4). weight ( v4 , v7 ,1).
weight ( v5 , v7 ,7).
weight ( v6 , v7 ,2). weight ( v6 , v8 ,2).
weight ( v7 , v9 ,3).
weight ( v8 , v9 ,2).
target (4).
threshold (4).

realweight(V1, V2, W) :- W = #min { X : weight(V1, V2, X) ; Y : weight(V2, V1, Y) }, weight(V1, V2, _), V1 < V2.

%%% target
TG-1 { edge(V1, V2, W) : realweight(V1, V2, W) } TG-1 :- target(TG).

%%% threshold
total(S) :- S = #sum { W, V1, V2 : edge( V1, V2, W) }.
:- total(S), S > TS, threshold(TS).

path(V1, V2) :- edge(V1, V2, W).
path(V1, V2) :- path(V2, V1).

%%% connection
connected(V1, V2) :- path(V1, V2).
connected(V1, V3) :- connected(V1, V2), path(V2,V3).
:- not connected(V1, V4), path(V1, V2), path(V3, V4).

select(V1, V2) :- edge(V1, V2, W).

#show select/2.
%#show connected/2.

