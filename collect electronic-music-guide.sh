#!/bin/sh


BASE_URL="http://techno.org/electronic-music-guide/"
# download music.swf
  wget "${BASE_URL}music.swf"


# download part of swf
sed -e "s/[^a-zA-Z0-9.\-]/\n/g" music.swf | grep "swf" | sort | uniq | while read line
do
  swf_file="${line}"
  txt_file=`echo "${line}" | sed -e "s/\.swf$/\.txt/g"`
  swf_url="${BASE_URL}${swf_file}"
  txt_url="${BASE_URL}${txt_file}"
  echo "${swf_url}"
  wget "${swf_url}"
  echo "${txt_url}"
  wget "${txt_url}"
done

