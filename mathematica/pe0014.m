Clear["Global`*"];
RepeatedTiming[
 nmax = 10^6 - 1;
 dp[1] = 1;
 dp[n_] := dp[n] = If[EvenQ@n, dp@Quotient[n, 2], dp[3 n + 1]] + 1;
 ans = MaximalBy[Range@nmax, dp]]