Clear["Global`*"];
RepeatedTiming[
 nmax = 20161;
 abundant = Select[Range@nmax, DivisorSigma[1, #] > 2 # &];
 st = Select[2*abundant, # <= nmax &];
 st = Union[st, 
   Select[DeleteDuplicates[
     Total /@ Subsets[abundant, {2}]], # <= nmax &]];
 ans = Total@Range@nmax - Total@st]