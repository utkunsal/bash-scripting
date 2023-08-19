#!/opt/homebrew/bin/bash

showuptime(){
	local up=$(uptime | cut -d " " -f 5,6)
	local since=$(sysctl -n kern.boottime | cut -d " " -f 9-13)
	cat << EOF
---
Hello $1,
Your machine has been up for ${up%?}
It has been running since ${since}
---
EOF
}
showuptime Utku
