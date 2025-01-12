Clear["Global`*"];
passcodes = 
  Flatten@DeleteDuplicates@Import["0079_keylog.txt", "CSV"];
RepeatedTiming[
 makeEdge[n_] := Module[{a, b, c},
   {a, b, c} = IntegerDigits@n;
   {DirectedEdge[a, b], DirectedEdge[b, c]}];
 gr = SimpleGraph[DeleteDuplicates@Flatten[makeEdge /@ passcodes]];
 ans = FromDigits@FindHamiltonianPath@gr]