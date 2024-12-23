Clear["Global`*"];
RepeatedTiming[
 cond[{x_, y_, z_}] := x^2 == y^2 + z^2;
 ans = Times @@@ Select[IntegerPartitions[1000, {3}], cond]]