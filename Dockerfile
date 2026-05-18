FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openjdk-21-jdk maven git

WORKDIR /app

# Copy project files into container
COPY . /app

RUN mvn clean package -DskipTests

CMD ["java", "-jar", "target/quanatitymeasurementapp-0.0.1-SNAPSHOT.jar"]