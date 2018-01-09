## BUILDING
##   (from project root directory)
##   $ docker build -t tomcat-for-ervin210-buba .
##
## RUNNING
##   $ docker run -p 8080:8080 tomcat-for-ervin210-buba
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:8080
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/bitnami-containers/minideb-extras:jessie-r14

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="5xgqxj6" \
    STACKSMITH_STACK_NAME="Tomcat for ervin210/buba" \
    STACKSMITH_STACK_PRIVATE="1"

# Install required system packages
RUN install_packages libc6 libx11-6 libxcb1 libxau6 libxdmcp6 libgcc1 libglib2.0-0 libffi6 libpcre3 libxext6 libstdc++6 zlib1g libselinux1 libxml2 liblzma5

RUN bitnami-pkg install java-1.8.144-0 --checksum 8b4315727f65780d8223df0aeaf5e3beca10a14aa4e2cdd1f3541ab50b346433
RUN bitnami-pkg install tomcat-9.0.0-M22-0 --checksum 537fd7fe47aa591e1032c66654dfead95d2f881ff1c318f64770741caf270a00 -- --username manager --password bitnami

ENV JAVA_HOME=/opt/bitnami/java \
    CATALINA_HOME=/opt/bitnami/tomcat
ENV PATH=$CATALINA_HOME/bin:/opt/bitnami/java/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Node base template
COPY . /app
WORKDIR /app

RUN npm install

CMD ["node"]
