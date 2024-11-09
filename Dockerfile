FROM openjdk:21-jdk

ARG JAR_FILE=app/build/libs/makeTrip.jar

COPY ${JAR_FILE} makeTrip.jar

ENTRYPOINT [ "java", "-Dspring.profiles.active=prod", "-jar", "makeTrip.jar" ]
