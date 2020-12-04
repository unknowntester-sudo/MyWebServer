#!/bin/bash 
FILE=$(pwd)/apache-jmeter-5.3/bin/jmeter.sh

#wget http://www.gtlib.gatech.edu/pub/apache/jmeter/binaries/apache-jmeter-5.3.tgz
#tar xf apache-jmeter-5.3.tgz


#apache-jmeter-5.3/bin/jmeter.sh
if test -f "$FILE"; 
then
    $FILE # start the application if exist.
else
if ! test -f apache-jmeter-5.3.tgz
then
wget http://www.gtlib.gatech.edu/pub/apache/jmeter/binaries/apache-jmeter-5.3.tgz
fi
echo "Downloaded completet"

tar xf apache-jmeter-5.3.tgz
echo "Installation done"
$(pwd)/install_jmeter.sh
fi
