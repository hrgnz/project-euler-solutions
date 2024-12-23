Clear["Global`*"];
RepeatedTiming[
 f[n_] := FromContinuedFraction@ContinuedFraction[Sqrt@2, n + 1];
 cond[x_] := ! OrderedQ[IntegerLength /@ NumeratorDenominator@x];
 ans = Length@Select[f /@ Range@1000, cond]]