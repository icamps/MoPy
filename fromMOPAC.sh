#!/bin/sh
#script to extract information from the output MOPAC file
#Use:
# ./fromMOPAC.sh folder_name
#
#The folder_name is a folder where all the MOPAC output files (.out) are located. A file with the name of the folder will be created with the data.
#
#

for filename in $1/*.out
do

HeatF=$(grep "FINAL HEAT OF FORMATION =      " $filename | grep '='| awk '{printf "%12.6f \n",$6}')
TotalEnergy=$(grep "TOTAL ENERGY            =" $filename | grep '='| awk '{printf "%12.6f \n",$4}')
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
CosmoArea=$(grep "COSMO AREA              =" $filename | grep '='| awk '{printf "%12.6f \n",$4}')
CosmoVolume=$(grep "COSMO VOLUME            =" $filename | grep '='| awk '{printf "%12.6f \n",$4}')

var1=$(echo $TotalEnergy | cut -f1 -d' ')
var2=$(echo $TotalEnergy | cut -f2 -d' ')
TotalEkcal="$var1"
TotalEeV="$var2"

if [ "$DispE" = "" ];
then
   DispE="-----"
fi
if [ "$HBondE" = "" ];
then
   HBondE="-----"
fi
if [ "$NHBonds" = "" ];
then
   NHBonds="-----"
fi
if [ "$IonPot" = "" ];
then
   IonPot="-----"
fi
if [ "$AlphaSOMO" = "" ];
then
   AlphaSOMO="-----"
fi
if [ "$AlphaLUMO" = "" ];
then
   AlphaLUMO="-----"
fi
if [ "$BetaSOMO" = "" ];
then
   BetaSOMO="-----"
fi
if [ "$BetaLUMO" = "" ];
then
   BetaLUMO="-----"
fi
if [ "$HOMO" = "" ];
then
   HOMO="-----"
fi
if [ "$LUMO" = "" ];
then
   LUMO="-----"
fi


echo $filename, $HeatF, $TotalEkcal, $TotalEeV, $DispE, $HBondE, $NHBonds, $IonPot, $AlphaSOMO, $AlphaLUMO, $BetaSOMO, $BetaLUMO, $HOMO, $LUMO, $CosmoArea, $CosmoVolume >> $1.t379x24
done
echo 'Filename', 'Heat of formation (kcal/mol)', 'Total Energy (kcal/mol)', 'Total Energy (eV)', 'Dispersion Energy (eV)', 'H-BOND Ebergy (eV)', 'No. HBonds', 'Ionization Potential (eV)', 'AlphaSOMO (eV)', 'AlphaLUMO (eV)', 'BetaSOMO (eV)', 'BetaLUMO (eV)', 'HOMO (eV)', 'LUMO (eV)', 'COSMO AREA (square angstroms)', 'COSMO VOLUME (cubic angstroms)' >> t379x24
cat t379x24 $1.t379x24 > $1.csv
rm -f t379x24 $1.t379x24
