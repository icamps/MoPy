#!/bin/bash
#script to extract information from the output MOPAC file
for filename in $1/*.out
do
TotalE=$(grep "TOTAL ENERGY            =" $filename | grep '='| awk '{printf "%12.6f \n",$4}')
DispE=$(grep "DISPERSION ENERGY       =" $filename | grep '='| awk '{printf "%12.6f \n",$4}')
HBondE=$(grep "H-BOND ENERGY           =" $filename | grep '='| awk '{printf "%12.6f \n",$4}')
NHBonds=$(grep "No. OF HYDROGEN BONDS   =" $filename | grep '='| awk '{printf "%12.6f \n",$6}')
IonPot=$(grep "IONIZATION POTENTIAL    =" $filename | grep '='| awk '{printf "%12.6f \n",$4}')
AlphaSOMO=$(grep "ALPHA SOMO LUMO (EV)    =" $filename | grep '='| awk '{printf "%12.6f %12.6f \n",$6,$7}')
BetaSOMO=$(grep "BETA  SOMO LUMO (EV)    =" $filename | grep '='| awk '{printf "%12.6f %12.6f \n",$6,$7}')
HOMOLUMO=$(grep "HOMO LUMO ENERGIES (EV) =" $filename | grep '='| awk '{printf "%12.6f %12.6f \n",$6,$7}')

echo $filename $TotalE $DispE $HBondE $NHBonds $IonPot $AlphaSOMO $BetaSOMO $HOMOLUMO >> $1.dat
done
