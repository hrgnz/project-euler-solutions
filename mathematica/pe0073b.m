Clear["Global`*"];
RepeatedTiming[
 dmax = 12000;
 cond[n_, d_] := CoprimeQ[n, d] && 2 n < d < 3 n && d <= dmax;
 f[n_] := Length@Select[Range[2 n + 1, 3 n - 1], cond[n, #] &];
 ans = Total[f /@ Range[Quotient[dmax, 2] - 1]]]