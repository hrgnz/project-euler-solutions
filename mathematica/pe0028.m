Clear["Global`*"];
RepeatedTiming[
 ans = 1 + Sum[16 k^2 + 4 k + 4, {k, 500}]]