FROM debian
RUN apt update
ADD test.txt /
CMD ["echo","Hello"]