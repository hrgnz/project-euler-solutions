Clear["Global`*"];
RepeatedTiming[
 squareQ[n_] := AllTrue[(FactorInteger@n)[[All, 2]], EvenQ];
 cond[n_] := 
  CompositeQ@n && 
   NoneTrue[Range[2, PrimePi@n], squareQ@Quotient[n - Prime@#, 2] &];
 ans = NestWhile[# + 2 &, 35, ! cond@# &]]