FROM alpine
ENV my_name=naveen 
ARG Greeting=Docker
RUN echo $Greeting && echo my_name              
CMD set