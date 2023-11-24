FROM openjdk:11
LABEL author="sriveen"
ARG username="petclinic"
ARG homedir="/petclinic"
ENV TEST=hello
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar /spring-petclinic-2.4.2.jar
RUN useradd -h ${homedir} -D ${username}
USER ${username}
WORKDIR ${homedir}
EXPOSE 8080
CMD ["java" ,"-jar" ,"/spring-petclinic-2.4.2.jar"]