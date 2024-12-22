Clear["Global`*"];
RepeatedTiming[
 cond1[lst_] := 
  Divisible[lst[[6]], 5] && EvenQ@lst[[4]] && First@lst != 0;
 cond2[lst_] := 
  AllTrue[{2, 4, 5, 6, 7}, 
   Divisible[FromDigits[Part[lst, # + 1 ;; # + 3]], Prime@#] &];
 lst = Select[Permutations@Range[0, 9], cond1];
 ans = Total[FromDigits /@ Select[lst, cond2]]]