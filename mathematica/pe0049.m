Clear["Global`*"];
RepeatedTiming[
 primes = Complement[Prime@Range[PrimePi@1000 + 1, PrimePi@10000],
   {1487, 4817, 8147}];
 grp = Values@Select[GroupBy[primes, Sort@IntegerDigits@# &],
    Length@# >= 3 &];
 calc[lst_] := 
  Select[Subsets[lst, {3}], #[[1]] + #[[3]] == 2*#[[2]] &];
 ans = StringJoin[Map[ToString, #]] & /@ Flatten[calc /@ grp, 1]]