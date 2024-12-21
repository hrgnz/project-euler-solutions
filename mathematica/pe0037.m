Clear["Global`*"];
RepeatedTiming[
 cond[p_ /; MemberQ[{1, 9}, Mod[p, 10]]] := False;
 cond[p_] := 
  AllTrue[Array[QuotientRemainder[p, 10^#] &, IntegerLength@p - 1], 
   PrimeQ, 2];
 cnt = 0;
 ans = 0;
 idx = 5;
 While[cnt < 11,
  p = Prime@idx;
  idx++;
  If[cond@p, ans += p; cnt++]];
 ans]