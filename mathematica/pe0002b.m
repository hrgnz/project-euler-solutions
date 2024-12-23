ClearAll["Global`*"];
RepeatedTiming[
 n0 = NestWhile[# + 1 &, 1, Fibonacci[3*#] <= 4*10^6 &] - 1;
 s[1] = Fibonacci@3;
 s[2] = Fibonacci@3 + Fibonacci@6;
 s[3] = Fibonacci@3 + Fibonacci@6 + Fibonacci@9;
 s[n_] := s[n] = 5*s[n - 1] - 3 s[n - 2] - s[n - 3];
 ans = s@n0]