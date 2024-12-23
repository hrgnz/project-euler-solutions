Clear["Global`*"];
RepeatedTiming[
 nmax = NestWhile[# + 1 &, 2, 10^(# - 1) <= 9^# &] - 1;
 ans = Sum[Floor[Power[10^n - 1, 1/n]] -
    Ceiling[Power[10^(n - 1), 1/n]] + 1, {n, 1, nmax}]]