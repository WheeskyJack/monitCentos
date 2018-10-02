
# monitCentos

This is the project for starting monit as process manager for centos docker container.

The shell script is used to start the monit. Monit itself is not run as PID 1. This helps in the maintenance of monit without restarting the container itself.

You can use it as a base for your own Docker images.
Two services (fooservice and barservice) are started to demonstrate the use of monit for porcess control.
fooservice is made to depend on barservice. Kill of barservice leads to kill of fooservice as well. Both the services are started with "foo" user.

## What's inside the image?

The centos:7 image is used; monit is installed using yum.

Starting from base centos image of 200 MB,
the final image size is found to be approx.

**254 MB** (without yum update of base centos image)

(as of Tue Oct 2,2018)

## How to build Docker Image?

Clone the repository and change to the directory where Dockerfile exists; execute the docker build command.

Sample example of docker build command is:

        docker build --network=host -t centos_monit_github:github .

## Debugging!!

* **yum install failures**

   If you are behind proxy, then yum update and installation may fail for your docker build; please set up environment variable for yum and curl to use the proxy.

   Example of editing yum.conf for proxy :

   Suppose the proxy is 10.144.1.10:8080 then , one can execute

        printf "\nproxy=http://10.144.1.10:8080" >> /etc/yum.conf

   in the beginning of prepare.sh script. This will enable all the subsequent yum commands to use the given proxy for their operations.

   Do not forget to remove this entry from the yum.conf at the end of image build as a part of cleanup.

* **curl failure**

   If curl commands are failing for the same reason then http_proxy needs to be set for the same.
   One can execute, for example , following snippet

        export http_proxy=http://10.144.1.10:8080
        export ftp_proxy=http://10.144.1.10:8080
        export https_proxy=https://10.144.1.10:8080

   to set the environment.

Any Suggestions are welcome!!!