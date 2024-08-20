FROM python:3.12.5-slim AS base

RUN apt update
RUN apt install sudo -y

FROM base

USER root

RUN useradd -ms /bin/bash python
RUN usermod -aG sudo python
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER python

ADD entrypoint.sh /home/python/entrypoint.sh

WORKDIR /home/python/workspace
CMD /bin/bash /home/python/entrypoint.sh
