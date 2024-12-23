Clear["Global`*"];
RepeatedTiming[
 n = 1000;
 ans = Catch[
   For[a = 1, a < n, a++,
    For[b = a + 1, c = n - a - b; b < c, b++,
     If[a^2 + b^2 == c^2, Throw[a*b*c]]]]]]