FROM maven@sha256:30016c86baed4234cff7275a2eee35d7d1241a277d96259aeb7db000faa1e69d AS builder
ADD ./pom.xml pom.xml
ADD ./src src/
RUN mvn clean package

FROM eclipse-temurin@sha256:dd8238c151293ae6a7c22898ef2f0df2af8a05786aef73ccd3248e73765969ed
RUN mkdir /app
COPY --from=builder target/dockerizedApp-1.0-SNAPSHOT.jar /app
WORKDIR /app
ENTRYPOINT ["java","-jar","dockerizedApp-1.0-SNAPSHOT.jar"]
