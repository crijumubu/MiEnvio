FROM mongo:latest

RUN apt update && \
    apt install nano systemctl -y

COPY [".", "/etc"]

RUN chmod +x /etc/init.sh

EXPOSE 27017