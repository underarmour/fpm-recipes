FROM docker.uacf.io/uacf_amzn/uacf_base:master

RUN yum -y install ruby ruby-devel && yum -y groupinstall 'Development Tools' && yum -y clean all

RUN gem install fpm

COPY . /recipes/

WORKDIR /recipes/
