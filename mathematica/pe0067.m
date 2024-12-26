Clear["Global`*"];
RepeatedTiming[
 a = Import["0067_triangle.txt", "Table"];
 dp[Length@a, j_] := dp[Length@a, j] = a[[Length@a, j]];
 dp[i_, j_] := dp[i, j]
   = a[[i, j]] + Max[dp[i + 1, j], dp[i + 1, j + 1]];
 ans = dp[1, 1]]