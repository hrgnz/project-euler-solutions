Clear["Global`*"];
RepeatedTiming[
 cond[n_] := ! PalindromeQ@NestWhile[
     # + IntegerReverse@# &, n + IntegerReverse@n, ! PalindromeQ@# &, 
     1, 49];
 ans = Length@Select[Range[10^4 - 1], cond]]