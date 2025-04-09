FROM centos:6

RUN yum -y update && \
    yum -y install wget tar gcc gcc-c++ make ncurses-devel openssl-devel bison

# Descarga e instala MySQL 5.1.56
RUN wget https://downloads.mysql.com/archives/get/p/23/file/mysql-5.1.56.tar.gz && \
    tar -xvzf mysql-5.1.56.tar.gz && \
    cd mysql-5.1.56 && \
    ./configure --prefix=/usr/local/mysql && \
    make && make install

ENV PATH="/usr/local/mysql/bin:$PATH"

