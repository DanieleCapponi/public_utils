#!/bin/bash

gway=$(ip -4 route list 0/0 	| cut -d " " -f3)
iface=$(ip -4 route list 0/0 | cut -d " " -f5)
netmsk=$(ifconfig $iface | grep "inet " | sed 's/        /,/g' | sed 's/    /,/g' | sed 's/  /,/g' | sed 's/ /,/g' | cut -d "," -f5)
if=$(ip -4 route list 0/0 | cut -d " " -f5);
ip=$(ifconfig ${if} | grep "inet " | cut -d " " -f10)
network=$(ip -4 route | grep ${ip} | cut -d " " -f1)

netspace=$(echo $network | cut -d "/" -f2)
netip="$(echo $network | cut -d "/" -f1 | cut -d "." -f 1,2,3)."

z=1
if   [[ $netspace == "24" ]]; then z=254
elif [[ $netspace == "31" ]]; then z=2
elif [[ $netspace == "30" ]]; then z=4
elif [[ $netspace == "29" ]]; then z=8
elif [[ $netspace == "28" ]]; then z=16
elif [[ $netspace == "27" ]]; then z=32
elif [[ $netspace == "26" ]]; then z=64
elif [[ $netspace == "25" ]]; then z=128
elif [[ $netspace == "23" ]]; then z=512
elif [[ $netspace == "22" ]]; then z=1024
elif [[ $netspace == "21" ]]; then z=2048
elif [[ $netspace == "20" ]]; then z=4096
elif [[ $netspace == "19" ]]; then z=8192
elif [[ $netspace == "18" ]]; then z=16384
elif [[ $netspace == "17" ]]; then z=32768
elif [[ $netspace == "16" ]]; then z=65536
elif [[ $netspace == "15" ]]; then z=131072
elif [[ $netspace == "14" ]]; then z=262144‬
elif [[ $netspace == "13" ]]; then z=524288
elif [[ $netspace == "12" ]]; then z=‭1048576‬
fi

is_alive_ping() {
  ping -c 4 $1 > /dev/null
  [ $? -eq 0 ] && echo Node IP: $1 UP
}


for i in $(seq 1 $z); do
	is_alive_ping "${netip}${i}" & disown
done

