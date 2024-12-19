Clear["Global`*"];
RepeatedTiming[
 n = 100;
 ans = Sum[k, {k, n}]^2 - Sum[k^2, {k, n}]]