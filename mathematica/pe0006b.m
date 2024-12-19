Clear["Global`*"];
RepeatedTiming[
 n = 100;
 calc[n_] := Quotient[ (n - 1) n (n + 1) (3 n + 2), 12];
 ans = calc@n]