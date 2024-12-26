Clear["Global`*"];
mat = Import["0081_matrix.txt", "CSV"];
RepeatedTiming[
 dp[1, 1] = mat[[1, 1]];
 dp[1, j_ /; j >= 2] := mat[[1, j]] + dp[1, j - 1];
 dp[i_ /; i >= 2, 1] := mat[[i, 1]] + dp[i - 1, 1];
 dp[i_, j_] := 
  dp[i, j] = mat[[i, j]] + Min[dp[i, j - 1], dp[i - 1, j]];
 ans = dp[80, 80]]