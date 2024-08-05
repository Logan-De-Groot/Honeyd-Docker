FROM python:2.7

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    libevent-dev \
    libdumbnet-dev \
    libpcap-dev \
    libpcre3-dev \
    libedit-dev \
    bison \
    flex \
    libtool \
    automake \
    zlib1g-dev \
    make && \
    git clone https://github.com/DataSoft/Honeyd.git

# set up process from honeyd github
WORKDIR /app/Honeyd
RUN ./autogen.sh && \
    ./configure && \
    make && \
    make install

ADD honeyd.conf /app/Honeyd/honeyd.conf

RUN ip a

RUN mkdir -p /app/logs && \
    touch /app/logs/honeyd.log
# Expose ports
EXPOSE 3306 80 443 8080 22 25 110 143 587 993 995 3389 5432 6379 8000 9000

# Default command
CMD ["honeyd", "-d", "-i", "eth0", "-l", "/app/logs/honeyd.log", "-s", "/app/logs/honeyd.status", "-f", "honeyd.conf"]

