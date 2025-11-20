FROM ubuntu:22.04

RUN apt update && apt install -y \
    bash \
    iputils-ping \
    net-tools \
    procps \
    curl \
    git

# create directory
RUN mkdir -p /app

# set working directory
WORKDIR /app

# copy script
COPY script/daily_report.sh /app/daily_report.sh

# make it executable
RUN chmod +x /app/daily_report.sh

# correct CMD
CMD ["/bin/bash", "/app/daily_report.sh"]