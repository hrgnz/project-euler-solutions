Clear["Global`*"];
RepeatedTiming[
 eqn = {x^2 + y^2 == z^2, x + y + z == 1000, z > y > x > 0};
 sol = First@Values@Solve[eqn, {x, y, z}, Integers];
 ans = {Times @@ sol, sol}]