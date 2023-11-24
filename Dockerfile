
FROM amazoncorretto:8-alpine3.18
LABEL author="khaja" organization="qt" project="learning"
ARG user=spring-petclinic
ARG DOWNLOAD_URL=https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar
ARG HOME_DIR=/petclinic
RUN apt update && apt install unzip -y
RUN useradd -d "$HOME_DIR" -m -s /bin/sh ${user}
USER ${user}
WORKDIR ${HOME_DIR}
ADD --chown=${user} ${DOWNLOAD_URL} ${HOME_DIR}/spring-petclinic-2.4.2.jar
RUN mkdir ${HOME_DIR}/bin && mkdir ${HOME_DIR}/logs
EXPOSE 8080
ENV ASPNETCORE_URLS="http://0.0.0.0:8080"
CMD [ "java" "-jar" ,"/petclinic/spring-petclinic-2.4.2.jar"]