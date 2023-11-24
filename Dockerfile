FROM openjdk:11
LABEL author="sriveen"
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar /spring-petclinic-2.4.2.jar
ARG USER="petclinic"
ARG homedir="/petclinic"
ENV TEST=hello
RUN adduser -h ${homedir} -D ${USER}
USER ${USER}
WORKDIR ${homedir}
EXPOSE 8080
CMD ["java" ,"-jar" ,"/spring-petclinic-2.4.2.jar"]