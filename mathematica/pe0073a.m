Clear["Global`*"];
RepeatedTiming[
 dmax = 12000;
 f[d_] := Length@Select[
    Range[Floor[d/3] + 1, Ceiling[d/2] - 1], CoprimeQ[d, #] &];
 ans = Total[f /@ Range[4, dmax]]]