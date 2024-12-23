Clear["Global`*"];
RepeatedTiming[
 coins = {1, 2, 5, 10, 20, 50, 100, 200};
 dp[i_, 0] := dp[i, 0] = 1;
 dp[i_ /; i <= 0, j_] := dp[i, j] = 0;
 dp[i_, j_ /; j < 0] := dp[i, j] = 0;
 dp[i_, j_] := dp[i, j] = dp[i - 1, j] + dp[i, j - coins[[i]]];
 ans = dp[8, 200]]