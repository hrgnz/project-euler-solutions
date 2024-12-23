Clear["Global`*"];
RepeatedTiming[
 calc[m_, n_, k_] := k^3 (m^2 - n^2)*(2*m*n)*(m^2 + n^2);
 cond[m_, n_] := CoprimeQ[m, n] && OddQ[m - n] && m > n;
 ans = Catch[Do[
    n = Quotient[500, k*m] - m;
    If[cond[m, n], Throw@calc[m, n, k]],
    {k, Divisors@500}, {m, Most@Divisors@Quotient[500, k]}]]]