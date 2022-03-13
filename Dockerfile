FROM ubuntu:22.04

LABEL author="FP1212"

ENV TZ="America/New_York"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && apt-get install -y nginx corosync pacemaker pcs iputils-ping systemd

RUN ln -s  /usr/lib/systemd/system/ /sbin/init

CMD service pcsd start && service corosync start && sleep infinity

EXPOSE 2224 3121 5403 5404 5405 21064 9929

