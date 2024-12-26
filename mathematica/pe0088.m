Clear["Global`*"];
RepeatedTiming[
 kmax = 12*10^3;
 
 (* nを積に分解したリストを作る *)
 tbl[1] = {{}};
 tbl[n_?PrimeQ] := tbl[n] = {{n}};
 tbl[n_] := tbl[n] = Module[{lst},
    lst = Function[{d}, Append[#, d] & /@ tbl[n/d]] /@ Rest@Divisors@n;
    lst = Flatten[lst, 1];
    DeleteCases[lst, Null];
    DeleteDuplicates[Sort /@ lst]];
 
 (* nの分解からkを求める *)
 calc[lst_] := Times @@ lst - Total@lst + Length@lst;
 
 (* 最小積和数 *)
 mps[i_] := mps[i] = 2 i;
 Do[If[i < mps@#, mps@# = i] & /@ (calc /@ tbl@i), {i, 4, 2*kmax}];
 ans = Total@DeleteDuplicates[mps /@ Range[2, kmax]]]
 