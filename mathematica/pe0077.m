Clear["Global`*"];
RepeatedTiming[
 cond[n_] := 
  Length@IntegerPartitions[n, All, Prime@Range@PrimePi@n] < 5000;
 ans = NestWhile[# + 1 &, 1, cond]]