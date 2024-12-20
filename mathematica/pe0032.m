Clear["Global`*"];
RepeatedTiming[
 lst = Select[Range[1234, 9876], DuplicateFreeQ@IntegerDigits@# &];
 cond[n_] := AnyTrue[Divisors@n,
   Union @@ (IntegerDigits /@ {#, Quotient[n, #], n}) == Range@9 &];
 ans = Total@Select[lst, cond@# &]]