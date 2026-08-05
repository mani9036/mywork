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