Clear["Global`*"];
RepeatedTiming[
 nmax = 10^6;
 f[n_] := f[n] = DivisorSigma[1, n] - n;
 calc[n_] := Module[{cur = n, visited = {}},
   While[! MemberQ[visited, cur] && n <= cur <= nmax,
    AppendTo[visited, cur]; cur = f@cur];
   If[f@Last@visited == First@visited, {n, Length@visited}, {0, 0}]];
 ans = MaximalBy[ParallelMap[calc, Range[2, nmax]], Last]]