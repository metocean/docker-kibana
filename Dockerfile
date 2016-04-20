FROM metocean/aroha:v1.0.0
MAINTAINER Thomas Coats <thomas@metocean.co.nz>

ENV KIBANA_VERSION=4.5.0

ADD . /install/
RUN /install/install.sh
CMD ["/sbin/initsh"]