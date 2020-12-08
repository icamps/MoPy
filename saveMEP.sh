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

# https://askubuntu.com/a/610945/918686
# ffmpeg -framerate 25 -i test_%00d.jpg -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p output.mp4
# convert MP4 to GIF: 
# ffmpeg -i output.mp4 -r 15 -vf scale=512:-1 -ss 00:00:03 -to 00:00:06 output.gif
