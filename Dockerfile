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

# Copy scripts correctly into /app
COPY script/daily_report.sh /app/daily_report.sh
COPY script/health_check.sh /app/health_check.sh

# Make both executable
RUN chmod +x /app/daily_report.sh \
    && chmod +x /app/health_check.sh

# Default run daily_report.sh
CMD ["/bin/bash", "/app/daily_report.sh"]


COPY script/health_check.sh app/health_check.sh
RUN chmod +x app/health_check.sh