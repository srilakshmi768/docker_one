


FROM openjdk:11
LABEL Name="Naveen"
COPY spring-petclinic-2.4.2.jar /spring-petclinic-2.4.2.jar 
EXPOSE 8080
CMD ["java" , "-jar" ,"/spring-petclinic-2.4.2.jar"]