FROM debian:bullseye

RUN apt update \
 && apt upgrade -y \
 && apt install vim -y \
 && apt install curl -y \
 && apt-get -y install wget \
 && apt install vsftpd -y

COPY tools/ftp.sh /

RUN chmod +x /ftp.sh

CMD [ "/ftp.sh" ]
