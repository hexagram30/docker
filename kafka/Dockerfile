# Kafka and Zookeeper
FROM java:openjdk-8-jre

ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.12
ENV KAFKA_VERSION 1.0.1
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"

ADD scripts /build

# Install Kafka, Zookeeper and other needed things
RUN /build/setup.sh && \
    /build/install.sh && \
    /build/cleanup.sh && \
    rm -rf /build

ADD scripts/start-kafka.sh /usr/bin/start-kafka.sh
ADD supervisor/kafka.conf supervisor/zookeeper.conf /etc/supervisor/conf.d/

# Zookeeper and Kafka ports, respectively
EXPOSE 2181 9092

CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
