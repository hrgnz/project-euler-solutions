Clear["Global`*"];
RepeatedTiming[
 (* 4桁のk角数の集合 *)
 nums[k_] := nums[k] = Module[{lft, rght},
    lft = NestWhile[# + 1 &, 1, PolygonalNumber[k, #] < 10^3 &];
    rght = NestWhile[# + 1 &, lft, PolygonalNumber[k, #] < 10^4 &] - 1;
    PolygonalNumber[k, #] & /@ Range[lft, rght]];
 
 (* i角数とj角数をむすぶグラフ *)
 edge[i_, j_] := edge[i, j] =
   If[Mod[i, 100] == Quotient[j, 100], DirectedEdge[i, j], Nothing];
 gr[{i_, j_}] := gr[{i, j}] =
   Graph@Flatten@Union@Outer[edge, nums@i, nums@j];
 
 (* サイクルを探す *)
 solve[lst_] := Module[{found},
   found = Flatten@FindCycle[GraphUnion @@
       (gr /@ (Partition[Join[{3}, lst, {3}], 2, 1])), {6}];
   If[found == {}, 
    Nothing, {Total[Total /@ VertexList@found], lst}]];
 ans = First@(solve /@ Permutations@Range[4, 8])]