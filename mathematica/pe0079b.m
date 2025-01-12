Clear["Global`*"];
passcodes = 
  Flatten@DeleteDuplicates@Import["0079_keylog.txt", "CSV"];
RepeatedTiming[
 (* n中の連続する2文字の間に辺をはる *)
 makeEdge[n_] := Rule @@@ Partition[IntegerDigits@n, 2, 1];
 gr = Graph[DeleteDuplicates@Flatten[makeEdge /@ passcodes]];
 (* トポロジカルソートして連結 *)
 ans = FromDigits@TopologicalSort@gr]