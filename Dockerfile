FROM openjdk:17-oracle

RUN mkdir /app

COPY dockerizedApp-1.0-SNAPSHOT.jar /app

WORKDIR /app

#CMD java -jar dockerizedApp-1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","dockerizedApp-1.0-SNAPSHOT.jar"]
