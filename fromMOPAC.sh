#!/bin/sh
#script to extract information from the output MOPAC file

for filename in $1/*.out
do

TotalE=$(grep "TOTAL ENERGY            =" $filename | grep '='| awk '{printf "%12.6f \n",$4}')
DispE=$(grep "DISPERSION ENERGY       =" $filename | grep '='| awk '{printf "%12.6f \n",$4}')
HBondE=$(grep "H-BOND ENERGY           =" $filename | grep '='| awk '{printf "%12.6f \n",$4}')
NHBonds=$(grep "No. OF HYDROGEN BONDS   =" $filename | grep '='| awk '{printf "%12.6f \n",$6}')
IonPot=$(grep "IONIZATION POTENTIAL    =" $filename | grep '='| awk '{printf "%12.6f \n",$4}')
AlphaSOMO=$(grep "ALPHA SOMO LUMO (EV)    =" $filename | grep '='| awk '{printf "%12.6f \n",$6}')
AlphaLUMO=$(grep "ALPHA SOMO LUMO (EV)    =" $filename | grep '='| awk '{printf "%12.6f \n",$7}')
BetaSOMO=$(grep "BETA  SOMO LUMO (EV)    =" $filename | grep '='| awk '{printf "%12.6f \n",$6}')
BetaLUMO=$(grep "BETA  SOMO LUMO (EV)    =" $filename | grep '='| awk '{printf "%12.6f \n",$7}')
HOMO=$(grep "HOMO LUMO ENERGIES (EV) =" $filename | grep '='| awk '{printf "%12.6f \n",$6}')
LUMO=$(grep "HOMO LUMO ENERGIES (EV) =" $filename | grep '='| awk '{printf "%12.6f \n",$7}')

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
if [ "$AlphaLUMO" = "" ];
then
   AlphaLUMO="XXXXX"
fi
if [ "$BetaSOMO" = "" ];
then
   BetaSOMO="XXXXX"
fi
if [ "$BetaLUMO" = "" ];
then
   BetaLUMO="XXXXX"
fi
if [ "$HOMO" = "" ];
then
   HOMO="XXXXX"
fi
if [ "$LUMO" = "" ];
then
   LUMO="XXXXX"
fi


echo $filename, $TotalE, $DispE, $HBondE, $NHBonds, $IonPot, $AlphaSOMO, $AlphaLUMO, $BetaSOMO, $BetaLUMO, $HOMO, $LUMO >> $1.t379x24
done

echo 'Filename', 'Total Energy (eV)', 'Dispersion Energy (eV)', 'H-BOND Ebergy (eV)', 'No. HBonds', 'Ionization Potential (eV)', 'AlphaSOMO (eV)', 'AlphaLUMO (eV)', 'BetaSOMO (eV)', 'BetaLUMO (eV)', 'HOMO (eV)', 'LUMO (eV)' >> t379x24
cat t379x24 $1.t379x24 > $1.csv
rm -f t379x24 $1.t379x24
