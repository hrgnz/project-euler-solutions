Clear["Global`*"];
RepeatedTiming[
 nmax = 10^6;
 f[n_] := Module[{m = FromDigits@RotateLeft@IntegerDigits@n},
   If[PrimeQ@m, n -> m, Nothing]];
 g = Graph[f /@ Prime@Range@PrimePi@nmax];
 ans = Length@Union[{2, 3, 5, 7, 11},
    Flatten[VertexList /@ FindCycle[g, Infinity, All]]]]
	