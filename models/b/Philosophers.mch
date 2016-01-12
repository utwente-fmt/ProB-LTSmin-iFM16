MACHINE Philosophers
/* an encoding of the Philosphers coloured Petri net from http://mcc.lip6.fr/models.php */
/* written by Michael Leuschel, 15.12.2015 */
DEFINITIONS
  NrPhil == 5;  // for 5 we get 243 states (+root) and 945 transitions (+INITIALISATION)
  Philos == 1..NrPhil;
  xm1 == (x-1) + ((NrPhil+1-x)/NrPhil)*NrPhil // compute x--1 circularly;  for x=0 -> xm1=NrPhil 
VARIABLES Think, Fork, Catch1, Catch2, Eat
INVARIANT
  Think <: Philos &
  Catch1 <: Philos &
  Catch2 <: Philos &
  Fork <: Philos &
  Eat <: Philos
INITIALISATION Think,Fork,Catch1,Catch2,Eat := Philos,Philos,{},{},{}
OPERATIONS
  FF1a = SELECT Think /= {} & Fork /= {} THEN
          ANY x WHERE x:Think & xm1:Fork THEN
            Think := Think \ {x} ||
            Fork := Fork \ {xm1} ||
            Catch1 := Catch1 \/ {x}
          END
         END;
  FF2a = SELECT Fork /= {} & Catch1 /= {} THEN
          ANY x WHERE x:Fork & x:Catch1 THEN
            Catch1 := Catch1 \ {x} ||
            Fork := Fork \ {x} ||
            Eat := Eat \/ {x}
          END
         END;
  FF1b = SELECT Think /= {} & Fork /= {} THEN
          ANY x WHERE x:Think & x:Fork THEN
            Think := Think \ {x} ||
            Fork := Fork \ {x} ||
            Catch2 := Catch2 \/ {x}
          END
         END;
  FF2b = SELECT Fork /= {} & Catch2 /= {} THEN
          ANY x WHERE xm1:Fork & x:Catch2 THEN
            Catch2 := Catch2 \ {x} ||
            Fork := Fork \ {xm1} ||
            Eat := Eat \/ {x}
          END
         END;
  EndEat = SELECT Eat /= {} THEN
           ANY x WHERE x:Eat THEN
            Fork := Fork \/ {x,xm1} ||
            Think := Think \/ {x} ||
            Eat := Eat \ {x}
          END
         END
END

