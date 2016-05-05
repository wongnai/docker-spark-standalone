FROM java:openjdk-8-jre-alpine
MAINTAINER Suparit Krityakien <suparit@wongnai.com>

ARG __APACHE_MIRROR_SERVER=http://www-us.apache.org
ARG __SPARK_VERSION=1.6.1
ARG __HADOOP_VERSION=2.6 
  
RUN apk add --no-cache wget bash
RUN mkdir /opt \
    && wget -q -O - ${__APACHE_MIRROR_SERVER}/dist/spark/spark-${__SPARK_VERSION}/spark-${__SPARK_VERSION}-bin-hadoop${__HADOOP_VERSION}.tgz | tar -xzf - -C /opt \
    && mv /opt/spark-${__SPARK_VERSION}-bin-hadoop${__HADOOP_VERSION} /opt/spark

COPY scripts /opt/spark/docker-scripts
RUN chmod -R +x /opt/spark/docker-scripts
ENV PATH /opt/spark/bin:/opt/spark/sbin:$PATH

EXPOSE 7077 7078 8080 8081

WORKDIR /opt/spark

VOLUME ["/opt/spark/conf", "/opt/spark/work"]

ENTRYPOINT ["/opt/spark/docker-scripts/entrypoint.sh"]
CMD ["master"]
