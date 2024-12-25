Clear["Global`*"];
RepeatedTiming[
 (* nのlst桁目をkに変換 *)
 f[n_, lst_, k_] := Module[{digits = IntegerDigits@n},
   If[First@digits == 1 && k == 0, Return@0];
   digits[[lst]] = k;
   FromDigits@digits];
 
 (* nのlst桁目を変換して素数を8個作れるか判定 *)
 g[n_, lst_] := Length@Select[
     f[n, lst, #] & /@ Range[0, 9], PrimeQ] == 8;
 
 (* nのどの桁を変換すればいいか *)
 h[n_] := 
  Select[Subsets[Range[IntegerLength@n - 1], {3}], g[n, #] &];
 
 (* 最小値を求める *)
 nmin = Prime@NestWhile[# + 1 &, PrimePi@100000, h@Prime@# == {} &];
 ans = Min@Select[f[nmin, First@h@nmin, #] & /@ Range[0, 9], PrimeQ]]