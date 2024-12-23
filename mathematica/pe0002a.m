ClearAll["Global`*"];
RepeatedTiming[
 n0 = NestWhile[# + 1 &, 1, Fibonacci[3*#] <= 4*10^6 &] - 1;
 ans = Total@Fibonacci[3*Range@n0];
 {ans, n0}]