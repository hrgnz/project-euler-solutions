Clear["Global`*"];
RepeatedTiming[
 squareQ[n_] := AllTrue[FactorInteger@n, EvenQ[#[[2]]] &];
 
 (* x=a+bに対応する(a,b)の個数 *)
 f[x_, c_] := Quotient[x, 2] /; x <= c;
 f[x_, c_] := Quotient[x, 2] - (x - c) + 1 /; x > c;
 
 (* 計算本体 *)
 target = 10^6;
 cnt = 0;
 c = 1;
 While[cnt <= target,
  cnt += 
   Total[f[#, c] & /@ Select[Range[2, 2 c], squareQ[#^2 + c^2] &]];
  c++]; ans = c - 1]