FROM hpess/devenv:master
MAINTAINER Karl Stoney <karl.stoney@hp.com>

ENV JRUBY_VERSION 1.7.18

RUN yum -y -q install java-1.7.0-openjdk-headless && \
    yum -y -q clean all

RUN cd /tmp && \  
    wget --quiet https://s3.amazonaws.com/jruby.org/downloads/$JRUBY_VERSION/jruby-bin-$JRUBY_VERSION.tar.gz && \
    tar -xzf jruby-bin-$JRUBY_VERSION.tar.gz && \
    rm -f *.tar.gz && \
    mv jruby-* /opt && \
    ln -s /opt/jruby-$JRUBY_VERSION /opt/jruby

ENV PATH=$PATH:/opt/jruby/bin
RUN jgem install bundler rspec

ENV HPESS_ENV devenv-jruby
