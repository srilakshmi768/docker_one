FROM amazoncorretto:11-alpine3.18
LABEL author="sriveen"
RUN adduser -h /petclinic -s /bin/sh -D petclinic
USER petclinic
WORKDIR /petclinic
ADD --chown=petclinic:petclinic https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar spring-petclinic-2.4.2.jar
EXPOSE 8080
CMD ["java" ,"-jar" ,"/spring-petclinic-2.4.2.jar"]