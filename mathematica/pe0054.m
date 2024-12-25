Clear["Global`*"];
dat = Partition[Characters /@ #, 5] & /@ 
   Import["0054_poker.txt", "Table"];
RepeatedTiming[
 rules = Thread[Characters@"23456789TJQKA" -> Range[2, 14]];
 
 (*Royal Flush*)
 f[{10, s_}, {11, s_}, {12, s_}, {13, s_}, {14, s_}] := {9};
 
 (*Straight Flush*)
 f[{a_, s_}, {b_, s_}, {c_, s_}, {d_, s_}, {e_, s_}] :=
  {8, {e, d, c, b, a}} /;
   {a, b, c, d, e} == a + Range[0, 4];
 
 (*Four of a Kind*)
 f[{a_, _}, {b_, _}, {c_, _}, {d_, _}, {e_, _}] :=
  {7, Keys@ReverseSort@Counts[{a, b, c, d, e}]} /;
   Values@Sort@Counts[{a, b, c, d, e}] == {1, 4};
 
 (*Full House*)
 f[{a_, _}, {b_, _}, {c_, _}, {d_, _}, {e_, _}] :=
  {6, Keys@ReverseSort@Counts[{a, b, c, d, e}]} /;
   Values@Sort@Counts[{a, b, c, d, e}] == {2, 3};
 
 (*Flush*)
 f[{a_, s_}, {b_, s_}, {c_, s_}, {d_, s_}, {e_, s_}] :=
  {5, {e, d, c, b, a}};
 
 (*Straight*)
 f[{a_, _}, {b_, _}, {c_, _}, {d_, _}, {e_, _}] :=
  {4, {e, d, c, b, a}} /;
   {a, b, c, d, e} == a + Range[0, 4];
 
 (*Three of a Kind/Two Pairs/One Pair/High Card*)
 f[{a_, _}, {b_, _}, {c_, _}, {d_, _}, {e_, _}] :=
  With[{counts = ReverseSort@Counts[{a, b, c, d, e}]},
   Switch[Values@counts,
      (*Three of a Kind*)
      {3, 1, 1}, {3, First[#], ReverseSort@Rest[#]},
      (*Two Pairs*)
      {2, 2, 1}, {2, ReverseSort@Most[#], Last[#]},
      (*One Pair*)
      {2, 1, 1, 1}, {1, First[#], ReverseSort@Rest[#]},
      (*High Card*)
      {1, 1, 1, 1, 1}, {0, {e, d, c, b, a}}] &@Keys[counts]];
 
 (* 点数化して比較 *)
 g[lst_] := 
  FromDigits[PadRight[Flatten[f @@ Sort[lst /. rules]], 6], 15];
 cond[lst1_, lst2_] := g@lst1 > g@lst2;
 ans = Count[cond @@@ dat, True]]