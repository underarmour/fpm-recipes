FROM docker.uacf.io/uacf_amzn/uacf_base:master

RUN yum -q -y install ruby ruby-devel && \
    yum -q -y groupinstall 'Development Tools' && \
    gem install --no-rdoc --no-ri fpm && \
    yum -q -y clean all && \
    mkdir /usr/local/fpm-recipes

WORKDIR /usr/local/fpm-recipes

COPY . /usr/local/fpm-recipes
