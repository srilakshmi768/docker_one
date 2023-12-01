
FROM maven:3.8.6-openjdk-11 as build
RUN git clone https://github.com/spring-projects/spring-petclinic.git 
 RUN cd spring-petclinic 
 RUN mvn package
# jar location /spring-petclinic/target/spring-petclinic-2.7.3.jar

FROM openjdk:11
LABEL project="petclinic"
LABEL author="devops team"
WORKDIR /spring-petclinic
EXPOSE 8080
COPY --from=build /spring-petclinic/target/spring-petclinic-2.7.3.jar /spring-petclinic-2.7.3.jar
CMD ["java", "-jar", "/spring-petclinic-2.7.3.jar"]