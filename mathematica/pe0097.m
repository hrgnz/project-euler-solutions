Clear["Global`*"];
RepeatedTiming[
 mod = 10^10;
 ans = PowerMod[2, 7830457, mod];
 ans = Mod[ans*28433 + 1,  mod]]