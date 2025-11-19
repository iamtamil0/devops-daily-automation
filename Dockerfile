FROM ubuntu:22.04

# Install runtime tools (keep minimal)
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash iputils-ping net-tools procps curl git \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY script/daily_report.sh /app/daily_report.sh

RUN chmod +x /app/daily_report.sh

CMD ["/app/daily_report.sh"]git 