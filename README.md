# inservices
This application to monitoring who access nagios server or other client computer from remote computer. So you can prevent your server from people attack or unknown user login into your server.

You can use this application to monitoring  ssh connection, ftp connection, postgres, mysql, etc who enter from remote computer. You can write IP address into whitelist if theres allowed user to access your server.



#For Begginer Nagios User

After you was successfuly install nagios, you can try install this application using 

#./install

#[Input your nagios directory]

After that insert newline in your $NAGIOSDIR/main/etc/objects/nagios.conf 


Place 2 lines like the installation output says

[Case if your nagios on /usr/local/nagios/]

cfg_file=/usr/local/nagios/main/etc/objects/cominservices.cfg

cfg_file=/user/local/nagios/main/etc/objects/servinservices.cfg




#For Nagios Advanced users


This application should be copy to $NAGIOSROOT/libexec, change owner to your nagios group/owner.
And you can add the nagios commands, and nagios service as like as  config/* file.


USAGE:  ./inservices ssh              #For monitoring your ssh

USAGE:  ./inservices ftp              #For monitoring your ftp

USAGE:  ./inservices postgres         #For monitoring your postgres


Output 1: WARNING.(10:58:13)# 1connection unknown (192.168.249.230)

Output 2: SAFE.(10:58:13)# 2connection (192.168.249.224, 192.168.249.222) 

Every WARNING output will write inside inservices.log


#
# Donation

If this project help you reduce time to develop, you can give me a cup of coffee.

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MHYNFDY744RBL)
