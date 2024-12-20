Clear["Global`*"];
RepeatedTiming[
 nmax = 10^4;
 d[n_] := DivisorSigma[1, n] - n;
 cond[n_] := d[d[n]] == n && d[n] != n && d[n] < nmax;
 ans = Total[Select[Range[nmax - 1], cond]]]