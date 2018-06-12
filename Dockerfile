FROM docker.io/java:7
MAINTAINER luyong@bossien.com

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' >/etc/timezone

RUN mkdir -p /usr/local/eureka/
ADD eureka /usr/local/eureka/

ADD start.sh /etc/init.d/
RUN chmod 755 /etc/init.d/start.sh

EXPOSE 8080
CMD ["sh","/etc/init.d/start.sh"]