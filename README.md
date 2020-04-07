# MoPy
A set of scripts/Jupiter notebooks to work with MOPAC output files.
MOPAC is a software to do semi-empirical calculation on molecular systems. Can be downloaded from openmopac.net.

I had some needs working with MOPAC output, so I tried to fix the issues using Python.

# Issue #1: See how the optimization structure is evolving.
>> Files: Script: [log2xyz.py] (log2xyz.py); Jupiter notebook: log2xyz.ipynb

## Solution:
- Add the following keywords to the MOP file: 
AUX(6,COMP, XP, XS, XW)
- Run as "mopac fname_root.mop > fname_root.log" 
- Edit the Jupiter notebook variable "fname_root" accordingly OR add the "fname_root" as an argument to the script.
- Running the script/notebook will create a XYZ file with the structure of each optimization step. This file can be visualized using Jmol (an animation can be done)
- A file "fname_root.dat" is created with two column: optimization_step energy, useful to analyze the energy of the system at each optimization step.

Note: If using AUX(5,COMP, XP, XS, XW) keyword, a file with the optimization steps will be created automatically with the name: fname_opt.aux (this file has the same structure as "fname_root.log"

# Issue #2: Optain the sufaces (electrostatic potential and molecular orbitals) of each time step in a DRC calculation.
>> Files: Script: .py; Jupiter notebook: .ipynb

## Solution:
- Add the keyword GRAPHF to the DRC input file. This will create a file with extension MGF with all the data for each DRC time step.
- Run as "mopac fname_root.mop". A file "fname_root.mgf" will be created.
- Running the script/notebook will create as many files as DRC time steps you define in your input. The output files will be created with names "fname_root_1.mgf, fname_root_2.mgf, ..."

