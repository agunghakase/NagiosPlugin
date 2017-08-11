# inservices
This application to monitoring who access nagios server or other client computer from remote computer. 
So you can prevent your server from people attack or unknown user login into your server.
This application should be copy to $NAGIOSROOT/libexec, change owner to your nagios group/owner
You can use this application to monitoring  ssh connection, ftp connection, postgres, mysql, etc who enter from remote computer
You can write IP address into whitelist if theres allowed user to access your server.

# USAGE:  ./inservices ssh              #For monitoring your ssh.
# USAGE:  ./inservices ftp              #For monitoring your ftp.
# USAGE:  ./inservices postgres         #For monitoring your postgres.

Output 1: WARNING.(10:58:13)# 1connection unknown (192.168.249.230) 
Other Output: SAFE.(10:58:13)# 2connection (192.168.249.224, 192.168.249.222) 
Every WARNING output will write inside inservices.log

