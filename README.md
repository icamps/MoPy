# MoPy
Some script to work with MOPAC output files

I had some needs working with MOPAC output, so I tried to fix the issues using Python.

# Issue #1: See how the optimization structure is evolving.
Script: log2xyz.py
Jupiter notebook: log2xyz.ipynb
Solution:
- Add the following keywords to the MOP file: 
AUX(6,COMP, XP, XS, XW)
- Run as mopac fname_root.mop > fname_root.log
- Edit the Jupiter notebook variable "fname_root" accordingly OR add the "fname_root" as an argument to the script.
- Running the script/notebook will create a XYZ file with the structure of each optimization step. This file can be visualized using Jmol (an animation can be done)
- Note: If using AUX(5,COMP, XP, XS, XW) keyword, a file with the optimization steps will be created automatically with the name: fname_opt.aux (this file has the same structure as "fname_root.log"

