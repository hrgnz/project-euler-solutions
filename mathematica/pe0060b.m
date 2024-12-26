Clear["Global`*"];
AbsoluteTiming[
 (* 2つの素数を辺で結ぶ条件 *)
 dgt[i_] := dgt[i] = IntegerDigits@i;
 cond1[{i_, j_}] := PrimeQ@FromDigits@Join[dgt@i, dgt@j];
 cond2[i_, j_] := AllTrue[{{i, j}, {j, i}}, cond1];
 
 (* 頂点数5のクリークができるまでグラフに頂点を追加する *)
 gr1 = Graph[{3 <-> 7}, VertexLabels -> Automatic];
 makeGraph[n_] := Module[{vertices},
   gr1 = VertexAdd[gr1, n];
   vertices = 
    Select[VertexList@gr1, Divisible[n - #, 3] && cond2[n, #] &];
   If[vertices != {}, 
    gr1 = EdgeAdd[gr1, Flatten[{n <-> #} & /@ vertices]]]];
 i = PrimePi@11;
 While[FindClique[gr1, {5}] == {}, makeGraph@ Prime@i; i++];
 
 (* 和の最小値を与えるクリークの候補 *)
 curMin = First@MinimalBy[FindClique[gr1, {5}, All], Total];
 
 (* curMinよりも小さい和をあたえるクリークは存在するか *)
 mx = Total@curMin - 3 - 7 - 11 - 13; (* 素数のインデックスの上限 *)
 asc = GroupBy[Prime@Range[4, PrimePi@mx], Mod[#, 3] &];
 pairs = Flatten[Subsets[#, {2}] & /@
    {Join[asc@1, {3}], Join[asc@2, {3}]}, 1];
 makeEdge[{i_, j_}] := 
  If[cond2[i, j], UndirectedEdge[i, j], Nothing];
 
 (* 検証用のグラフを作って計算 *)
 gr2 = Graph[makeEdge /@ pairs, VertexLabels -> Automatic];
 ans = First@MinimalBy[FindClique[gr2, {5}, All], Total];
 ans = {Total@ans, ans == curMin}]