FROM centos:latest
COPY . /bd_build

RUN /bd_build/prepare.sh && \
	/bd_build/install.sh && \
	/bd_build/cleanup.sh

ENTRYPOINT ["/bd_build/startup.sh"]
