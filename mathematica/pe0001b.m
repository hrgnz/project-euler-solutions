Clear["Global`*"];
RepeatedTiming[
 f[d_] := Total@Range[d, 999, d];
 ans = f@3 + f@5 - f@15]