FROM openjdk:11
LABEL author="sriveen"
ARG USER="petclinic"
ARG DOWNLOAD_URL=https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar 
ARG homedir="/petclinic"
ENV TEST=hello
RUN adduser -h ${homedir} -s /bin/sh -D ${USER} 
USER ${USER}
WORKDIR ${homedir}
ADD --chown=${USER} ${DOWNLOAD_URL} ${homedir}/spring-petclinic-2.4.2.jar
EXPOSE 8080
CMD ["java" ,"-jar" ,"/spring-petclinic-2.4.2.jar"]