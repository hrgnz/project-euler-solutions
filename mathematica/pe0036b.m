Clear["Global`*"];
RepeatedTiming[
 nmax = 10^6;
 cond[x_] := x <= nmax && PalindromeQ@x;
 calc[n_] := Module[{lft, rght, r, nums},
   lft = IntegerDigits[n, 2];
   rght = Reverse@lft;
   nums = FromDigits[#, 2] & /@
     {Join[lft, rght], Join[lft, {0}, rght], Join[lft, {1}, rght]};
   Total@Select[nums, cond]];
 ans = 1 + Total[calc /@ Range@Floor@Sqrt@nmax]]