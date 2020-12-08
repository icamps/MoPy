#!/bin/bash
clear

name_root="test_"
for i in {1..999}
do
   echo $i
   fname_in="$name_root$i.mgf"
   fname_out="$name_root$i.jpg"
   jmol $fname_in --nosplash --silent --nodisplay --script MEP_export -q85 --write JPG:$fname_out
done

convert -limit memory 0 -limit map 0 *.jpg movie.gif
convert -limit memory 0 -limit map 0 *.jpg movie.mpg

