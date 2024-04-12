if [ "$#" -ne 3 ]; then
	echo "./start.sh <username> <password> <number>"
	exit 1
fi

re='^[0-9]+$'
if ! [[ $3 =~ $re ]] ; then
	echo "<number> must be a number"
	exit 1
fi

if ! [ ${#2} -ge 6 ]; then
	echo "Length of <password> must be 6 or greater"
	exit 1
fi


echo "noVNC-$3 running on port $((8081 + $3)) with credentials '$1:$2'."

#docker run -it --rm --name noVNC-$3 -p $((8081 + $3)):6080 -e VNC_USER="$1" -e VNC_PASSWD="$2" kaiushartala/vnc:latest bash
docker run -it --rm --name noVNC-$3 -p $((8081 + $3)):6080 -e VNC_USER="$1" -e VNC_PASSWD="$2" kaiushartala/vnc:latest > /dev/null
