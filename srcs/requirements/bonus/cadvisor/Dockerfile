FROM debian:bullseye

RUN apt update \
 && apt upgrade -y \
 && apt install vim -y \
 && apt install curl -y \
 && apt-get -y install wget \
 && wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor \
 && chmod +x cadvisor

CMD [ "/cadvisor" ]
