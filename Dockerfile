FROM ubuntu:22.04

RUN apt update && apt install -y \
    bash \
    iputils-ping \
    net-tools \
    procps \
    curl \
    git \
    iproute2

WORKDIR /app

COPY script/daily_report.sh /app/daily_report.sh

RUN chmod +x /app/daily_report.sh

CMD ["/bin/bash", "/app/daily_report.sh"]