#!/bin/sh
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

if [ "$DispE" = "" ];
then
   DispE="XXXXX"
fi
if [ "$HBondE" = "" ];
then
   HBondE="XXXXX"
fi
if [ "$NHBonds" = "" ];
then
   NHBonds="XXXXX"
fi
if [ "$IonPot" = "" ];
then
   IonPot="XXXXX"
fi
if [ "$AlphaSOMO" = "" ];
then
   AlphaSOMO="XXXXX"
fi
if [ "$BetaSOMO" = "" ];
then
   BetaSOMO="XXXXX"
fi
if [ "$HOMOLUMO" = "" ];
then
   HOMOLUMO="XXXXX"
fi


echo $filename $TotalE $DispE $HBondE $NHBonds $IonPot $AlphaSOMO $BetaSOMO $HOMOLUMO >> $1.dat
done
