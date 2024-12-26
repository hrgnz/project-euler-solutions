Clear["Global`*"];
RepeatedTiming[
 (* magic 5-gonを全部作る *)
 cond[{a_, b_, c_, d_, e_, f_, g_, h_, i_}] :=
  (10 + a + b) == (b + c + f) == (c + d + g) == (d + e + h)
   == (e + a + i);
 found = Select[Permutations@Range@9, cond];
 
 (* f,g,h,iのうち一番小さいものが先頭に来るように連結する *)
 solve[{a_, b_, c_, d_, e_, f_, g_, h_, i_}] := Module[{org},
   org = {{1, 0, a, b}, {f, b, c}, {g, c, d}, {h, d, e}, {i, e, a}};
   FromDigits@(Join @@ 
      RotateLeft[org, PositionSmallest[{f, g, h, i}]])];
 
 (* 連結で得られた数の最大値が答え *)
 ans = Max[solve /@ found]]