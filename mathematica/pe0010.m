Clear["Global`*"];
RepeatedTiming[
 nmax = 2*10^6;
 ans = Total@Prime@Range@PrimePi@nmax]