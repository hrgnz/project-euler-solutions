Clear["Global`*"];
RepeatedTiming[
 cond[n_] := PalindromeQ@n && PalindromeQ@IntegerDigits[n, 2];
 ans = Total@Parallelize@Select[Range[ 1, 10^6, 2], cond]]