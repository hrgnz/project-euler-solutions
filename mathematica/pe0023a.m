Clear["Global`*"];
RepeatedTiming[
 nmax = 20161;
 abundant = Select[Range@nmax, DivisorSigma[1, #] > 2*# &];
 st = {};
 Do[
  x = abundant[[i]];
  If[2 x > nmax, Break[]];
  j = ResourceFunction["BinarySearch"][abundant, nmax - x];
  st = Union[st, Take[abundant, {i, j}] + x], {i, Length@abundant}];
 ans = Total@Range@nmax - Total@st]