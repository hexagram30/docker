FROM redis:4.0.8
MAINTAINER Hexagram30 <https://github.com/hexagram30>

RUN apt-get update -y
RUN apt-get install -y build-essential git netcat
RUN git clone https://github.com/RedisLabsModules/redis-module-graph.git \
    /root/redis-module-graph
RUN cd /root/redis-module-graph && make
RUN echo '#!/bin/bash' > /usr/bin/file-server
RUN echo >> /usr/bin/file-server
RUN chmod 755 /usr/bin/file-server
RUN echo 'nc -q 0 -l -p 50999 < /root/redis-module-graph/src/redisgraph.so' >> \
    /usr/bin/file-server

EXPOSE 50999

CMD ["file-server"]
