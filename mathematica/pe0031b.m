Clear["Global`*"];
RepeatedTiming[
 f[x_] := 1/((1 - x) (1 - x^2) (1 - x^5) (1 - x^10) 
     (1 - x^20) (1 - x^50) (1 - x^100) (1 - x^200));
 ans = Coefficient[Series[f@x, {x, 0, 200}], x, 200]]