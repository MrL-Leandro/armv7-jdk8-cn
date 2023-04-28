#Docker image of JDK8 in armv7
# VERSION 8

#基础镜像使用的是OpenJDK官方镜像公用的
FROM buildpack-deps:stretch-scm

#定义时区参数
ENV TZ=Asia/Shanghai
#设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
#设置编码
ENV LANG C.UTF-8
#设置环境变量
ENV LC_ALL zh_CN.utf8
#配置java
ENV JAVA_HOME /usr/local/jdk8

ENV PATH $JAVA_HOME/bin:$PATH
#配置jdk8的gz包
ENV JDK_FILE jdk-8u371-linux-arm32-vfp-hflt.tar.gz

COPY $JDK_FILE /usr/local/

RUN mkdir -p "$JAVA_HOME"; \
    tar --extract \
		--file /usr/local/$JDK_FILE \
		--directory "$JAVA_HOME" \
		--strip-components 1 \
		--no-same-owner; \
    rm /usr/local/$JDK_FILE
