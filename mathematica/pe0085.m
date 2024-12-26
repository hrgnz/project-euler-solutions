Clear["Global`*"];
RepeatedTiming[
 (* xの上限 *)
 c = 2*10^6;
 lim = Values@NSolve[{2 (x + 1) x == 4 c, x >= 1}, x];
 lim = Ceiling@lim[[1, 1]] + 10;
 
 (* y<=xとして(x, y)を全部作る *)
 tbl = Flatten[Table[{x, y}, {x, 1, lim}, {y, 1, x}], 1];
 
 (* 計算 *)
 f[x_] := f[x] = (x + 1) x;
 g[{x_, y_}] := Abs[f[x]*f[y] - 4 c];
 ans = Times @@ First@MinimalBy[tbl, g@# &]]