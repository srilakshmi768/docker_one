FROM maven:3-amazoncorretto-17 AS builder
COPY . /spring-petclinic-2.4.2.jar
RUN cd /petclinic && mvn package


FROM amazoncorretto:17-alpine3.17
LABEL author="khaja"
LABEL organization="learningthoughts"
ARG USERNAME='petclinic'
ARG HOMEDIR='/petclinic'
ENV TEST=hello
RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
USER ${USERNAME}
WORKDIR ${HOMEDIR}
COPY --from=builder --chown=${USERNAME}:${USERNAME} /spring-petclinic/target/spring-petclinic-2.4.2.jar "${HOMEDIR}/spring-petclinic-2.4.2.jar"
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-2.4.2.jar"]

