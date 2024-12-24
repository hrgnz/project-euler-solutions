Clear["Global`*"];
RepeatedTiming[
 nmax = 5*10^7;
 p2 = (Prime@Range@PrimePi@Power[nmax, 1/2])^2;
 p3 = (Prime@Range@PrimePi@Power[nmax, 1/3])^3;
 p4 = (Prime@Range@PrimePi@Power[nmax, 1/4])^4;
 ans = Length@DeleteDuplicates@
    Select[Total /@ Tuples[{p2, p3, p4}], # < nmax &]]