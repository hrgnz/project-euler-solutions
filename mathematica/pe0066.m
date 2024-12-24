Clear["Global`*"];
RepeatedTiming[
 calc[d_] := Module[{cf = ContinuedFraction@Sqrt@d, a, b, p, q},
   {a, b} = {Most@cf, Last@cf};
   {p, q} = NumeratorDenominator@FromContinuedFraction@Join[a, Most@b];
   If[EvenQ@Length@b, {d, p}, {d, p^2 + d*q^2}]];
 nmax = 10^3;
 lst = Complement[Range@nmax, Table[k^2, {k, Sqrt@nmax}]];
 ans = First@First@MaximalBy[calc /@ lst, Last]]