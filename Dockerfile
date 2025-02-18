# Use a lightweight JDK image
FROM openjdk:11-jre-slim

# Environment variables
ENV JMETER_VERSION=5.6.2 \
    JMETER_HOME=/opt/apache-jmeter \
    PATH=$JMETER_HOME/bin:$PATH

# Install JMeter
RUN apt-get update && apt-get install -y wget unzip && \
    wget -q https://downloads.apache.org/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz && \
    tar -xzf apache-jmeter-$JMETER_VERSION.tgz -C /opt && \
    mv /opt/apache-jmeter-$JMETER_VERSION $JMETER_HOME && \
    rm apache-jmeter-$JMETER_VERSION.tgz && \
    apt-get purge -y wget unzip && apt-get clean

# Set working directory
WORKDIR /

# Default JMeter command
ENTRYPOINT ["jmeter"]
