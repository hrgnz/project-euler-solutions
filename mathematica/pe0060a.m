Clear["Global`*"];
RepeatedTiming[
 (* 素数のペアを作る *)
 nmax = 10000;
 asc = GroupBy[Prime@Range[4, PrimePi@nmax], Mod[#, 3] &];
 pairs = Flatten[Subsets[#, {2}] & /@
    {Join[asc@1, {3}], Join[asc@2, {3}]}, 1];
 
 (* 条件をみたす素数を辺で結んでグラフを作る *)
 dgt[i_] := dgt[i] = IntegerDigits@i;
 cond[{i_, j_}] := PrimeQ@FromDigits@Join[dgt@i, dgt@j];
 makeEdge[{i_, j_}] := If[AllTrue[{{i, j}, {j, i}}, cond],
   UndirectedEdge[i, j], Nothing];
 gr = Graph[makeEdge /@ pairs, VertexLabels -> Automatic];
 
 (* 5個の頂点からなるクリークを探す *)
 ans = Min[Total /@ FindClique[gr, {5}, All]]]