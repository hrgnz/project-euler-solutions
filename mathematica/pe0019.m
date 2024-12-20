Clear["Global`*"];
RepeatedTiming[
 lst = Tuples[{Range[1901, 2000], Range@12}];
 cond[{y_, m_}] := DayName[{y, m, 1}] == Sunday;
 ans = Length@Select[lst, cond]]