FROM ubuntu:22.04

# Install required tools
RUN apt update && apt install -y \
    bash \
    iputils-ping \
    net-tools \
    procps \
    curl \
    git \
    && apt clean

# Copy scripts into container
WORKDIR /app
COPY script/daily_report.sh /app/daily_report.sh

RUN chmod +x /app/daily_report.sh

CMD ["/app/daily_report.sh"]
