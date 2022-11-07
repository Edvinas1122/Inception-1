FROM debian:buster

RUN apt update
RUN apt-get install lsb-release -y
RUN apt-get install redis -y
#RUN sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis.conf 
#RUN sed -i "s| maxmemory <bytes>|maxmemory 20mb|g" /etc/redis.conf
RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis.conf"] 
