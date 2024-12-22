Clear["Global`*"];
RepeatedTiming[
 dp[0, y_] := dp[0, y] = 1;
 dp[x_, 0] := dp[x, 0] = 1;
 dp[x_, y_] := dp[x, y] = dp[x - 1, y] + dp[x, y - 1];
 ans = dp[20, 20]]