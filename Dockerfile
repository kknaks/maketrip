FROM openjdk:21-jdk
ARG JAR_FILE=app/build/libs/tripMaker.jar
COPY ${JAR_FILE} tripMaker
ENTRYPOINT ["java","-Dspring.profiles.active=prod","-jar","tripMaker"]
