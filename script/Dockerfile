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

# Since build context = script/, files are directly available here
COPY daily_report.sh /app/daily_report.sh
COPY health_check.sh /app/health_check.sh

RUN chmod +x /app/daily_report.sh \
    && chmod +x /app/health_check.sh

CMD ["/bin/bash", "/app/daily_report.sh"]