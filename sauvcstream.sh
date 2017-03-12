#!/bin/bash

version=4

echo ".. script version $version .."

echo ".. registering Pi .."

token="DUCKDNS_TOKEN"
IP=$(hostname -I | cut -d ' ' -f 1)
qURL="https://www.duckdns.org/update?domains=$domain&token=$token&ip=$IP"
echo url=$qURL | curl -s -k -K - >> /var/log/stream.log

echo ".. starting Stream .."

# Previous year videos
videourls=( "https://www.youtube.com/watch?v=Qkp23g6SxSc" "https://www.youtube.com/watch?v=xm1ayLBGGLU" "https://www.youtube.com/watch?v=inWu5T0Ved8" "https://www.youtube.com/watch?v=pZfJ0kNywuA" "https://www.youtube.com/watch?v=0fysBZLbxsM" "https://www.youtube.com/watch?v=UdaorgZQ1jQ" "https://www.youtube.com/watch?v=kwCNxf401x4" "https://www.youtube.com/watch?v=8uX8anL6ZTs" "https://www.youtube.com/watch?v=3v5yRTkU8Yk" "https://www.youtube.com/watch?v=rAqqL6XG_6Q" "https://www.youtube.com/watch?v=cbLnWk_7bbQ" "https://www.youtube.com/watch?v=r6EPuCuPEJ8" )

while true; do
	for i in "${videourls[@]}"
	do
		echo "Trying $i..."
		rawurl=$(youtube-dl -g -f 22 $i)
		if [[ ! -z "$rawurl" ]]
		then
			omxplayer $rawurl &>/var/log/stream.log
		fi
	done
done


# # Live Stream
# while true; do
# 	while ! ping -c1 8.8.8.8 &>/dev/null; do sleep 1; done
# 	omxplayer $(youtube-dl -g 'https://www.youtube.com/watch?v=_WJbekMYxmE')
# done
