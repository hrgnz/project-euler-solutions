Clear["Global`*"];
RepeatedTiming[
 lmax = 15*10^5;
 cnt = Table[0, lmax];
 For[m = 2, 2 m^2 < lmax, m++,
  For[n = 1, t = 2 m (m + n); t <= lmax && n < m, n++,
   If[CoprimeQ[m, n] && OddQ[m - n],
    Do[cnt[[k*t]]++, {k, Quotient[lmax, t]}]]]];
 ans = Count[cnt, 1]]