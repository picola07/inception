FROM debian:buster
RUN apt-get -y update && apt-get -y upgrade \
 && apt update -y && apt upgrade -y 
RUN apt install php-fpm php-mysql -y && apt install curl -y 

COPY ./conf/script.sh /

RUN chmod +x tools/script.sh

EXPOSE 9000

CMD ["/script.sh"]