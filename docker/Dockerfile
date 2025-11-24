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

# Your scripts are in /script folder (root)
COPY ../script/daily_report.sh /app/daily_report.sh
COPY ../script/health_check.sh /app/health_check.sh

RUN chmod +x /app/daily_report.sh && chmod +x /app/health_check.sh

CMD ["/app/daily_report.sh"]