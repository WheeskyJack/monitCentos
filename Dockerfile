FROM centos:7
COPY . /bd_build

RUN /bd_build/prepare.sh && \
	/bd_build/install.sh && \
	/bd_build/cleanup.sh

ENTRYPOINT ["/etc/monit.d/monitStartup.sh"]
