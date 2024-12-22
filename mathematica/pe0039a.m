Clear["Global`*"];
RepeatedTiming[
 cnt = Table[0, 1000];
 For[p = 12, p <= 1000, p += 2,
  For[a = 1, 3 a < p, a++,
   For[b = a + 1, c = p - a - b; b < c, b++,
    If[a^2 + b^2 == c^2, cnt[[p]]++]]]];
 ans = First@Position[cnt, Max@cnt]]