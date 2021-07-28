FROM openjdk:8u131-jre

WORKDIR /assignment_6/

MAINTAINER Richard Chesterwood "richard@inceptiontraining.co.uk"

ADD target/positionsimulator-0.0.1-SNAPSHOT.jar webapp.jar

CMD ["java","-jar","webapp.jar"]
