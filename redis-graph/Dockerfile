FROM redis:4.0.8
MAINTAINER Hexagram30 <https://github.com/hexagram30>

COPY redisgraph.so /usr/local/lib

RUN mkdir -p /etc/redis && \
    echo "appendonly yes" >> /etc/redis/redis.conf && \
    echo "loadmodule /usr/local/lib/redisgraph.so" >> /etc/redis/redis.conf


CMD ["redis-server", "/etc/redis/redis.conf"]
