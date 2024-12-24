Clear["Global`*"];
RepeatedTiming[
 p[0] = 1;
 p[n_] := 
  p[n] = Quotient[Sum[DivisorSigma[1, n - k]*p[k], {k, 0, n - 1}], n];
 ans = p@100 - 1]