Clear["Global`*"];
RepeatedTiming[
 p = 1000;
 cnt = Table[0, p];
 For[m = 2, 2 m^2 < p, m++,
  For[n = 1, n < m, n++,
   If[CoprimeQ[m, n] && OddQ[m - n],
    t = 2 m*(m + n);
    Do[cnt[[k*t]]++, {k, 1, Quotient[p, t]}]]]];
 ans = First@Position[cnt, Max@cnt]]