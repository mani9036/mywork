# in bash script there should not be space across the = this modelo
#Yes. Before this script can successfully run ssh "$server", your machine (or the server where the script runs) 
#must be able to connect to each target server over SSH.

-------------------------------------------------------------------------------
#!/bin/bash

servers=("server1" "server2" "server3" "server4" "server5" "server6")

get_server_info() {
    server=$1
    echo "fetching the $server details"

    ssh $server << EOF 

            echo "Hostname: $(hostname)"
            echo "Uptime : $(uptime -p)"
            echo "Version : $(uname -v)"
EOF
}

for server in "${servers[@]}"
do

get_server_info "$server"

echo "------------------------"  # separator bewteen each server output like below example

done
# example 
-----------------------------------------------------------------------------------------

Fetching details from server1

Hostname: server1
Uptime: up 5 days
Kernel: 5.15.0

--------------------------------

Fetching details from server2

Hostname: server2
Uptime: up 20 days
Kernel: 5.15.0

--------------------------------

Fetching details from server3

Hostname: server3
Uptime: up 10 days
Kernel: 5.15.0

--------------------------------
# each ball name having suffix with number, we want to figure out wheather the ball
# is an odd or even ball.

# question 
# balls = ("balli" "ball2" "balls" "ball4" "halls" "ball6")

# write a bash script to check whether the ball is odd or even ball.

#!/bin/bash
balls = ("balli" "ball2" "balls" "ball4" "halls" "ball6")
for ball in "${balls[@]}"
do

last_char="${ball: -1}"  # get the last character of the ball name

if [[ "$last_char" =~ [0-9] ]]; then  # check if the last character is a digit
    if (( last_char % 2 == 0 )); then
        echo "$ball is an even ball."
    else
        echo "$ball is an odd ball."
    fi
else
    echo "$ball does not have a numeric suffix."
fi

done
