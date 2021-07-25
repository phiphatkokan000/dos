#!/usr/bin/perl
# Maximboot.

print "Set update Install SSH2 Linux By kshooter\n";
print "Would you like to install the required packages? [Y/n]\n";
chomp($req=<STDIN>);
if(lc ($req) eq "y" || $req eq ""){
	print "Installing required packages...\n";
	sleep(2);
	system("yum -y update");
	system("yum -y install gcc make gcc-c++ screen dstat iptraf");
                system("apt-get -y install libstdc++.so.6");
                system("apt-get -y install libssl.so.6");
                system("apt-get -y install ld-linux.so.2");
                system("apt-get -y install nano");
                system("apt-get -y install mysql-server");
	        system(" service mysqld start");
	system("apt-get -y install php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml");
                system("rpm -ivh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/6/i386/epel-release-6-8.noarch.rpm");
                system("apt-get check-update");
                system("apt-get -y install phpMyAdmin");
                system("sudo /usr/sbin/apachectl restart");
                system("sudo /usr/sbin/httpd start");
	system("sudo /sbin/chkconfig httpd on");
       system("sudo /sbin/chkconfig mysqld on");
	print "\nInstalling required packages completed!\n";
}

print "Would you like to install SSH2? [Y/n]\n";
chomp($ssh=<STDIN>);
if(lc ($ssh) eq "y" || $ssh eq ""){
	print "Installing SSH2...\n";
	sleep(2);
	system("apt-get -y install gcc php-devel php-pear libssh2 libssh2-devel");
	system("pecl install -f ssh2");
	system("touch /etc/php.d/ssh2.ini");
	system("echo extension=ssh2.so > /etc/php.d/ssh2.ini");
	system("setsebool -P httpd_can_network_connect 1");
	system("/etc/init.d/httpd restart");
	print "\nChecking...\n";
	system("php -m | grep ssh2");
	print "If you see \"ssh2\" then it has been successfully installed!\n";
}
