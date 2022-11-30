mkdir /etc/squid
cp squid.conf /etc/squid/

docker run -d --name squid-container -v /etc/squid/:/etc/squid -e TZ=UTC-8 -p 7777:7777 ubuntu/squid:5.2-22.04_beta
