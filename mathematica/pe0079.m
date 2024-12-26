Clear["Global`*"];
RepeatedTiming[
 passcodes = Flatten@DeleteDuplicates@Import["0079_keylog.txt", "CSV"];
 makeEdge[n_] := Module[{a, b, c},
   {a, b, c} = IntegerDigits@n;
   {DirectedEdge[a, b], DirectedEdge[b, c]}];
 gr = SimpleGraph[DeleteDuplicates@Flatten[makeEdge /@ passcodes]];
 ans = FromDigits@FindHamiltonianPath@gr]