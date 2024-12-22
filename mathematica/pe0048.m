Clear["Global`*"];
RepeatedTiming[
 m = 10^10;
 ans = Mod[Sum[PowerMod[k, k, m], {k, 1000}], m]]