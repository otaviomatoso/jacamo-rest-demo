# JaCaMo-REST: Integration Demo (Node-RED + MQTT)

# to build:
#    ./gradlew clean copyToLib
#    docker build -t jacamo-rest/demo/nodered .
# to run
#    docker run -it jacamo-rest/demo/nodered

FROM alpine

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:$JAVA_HOME/bin

RUN apk add --update --no-cache openjdk8-jre bash
#graphviz gradle git fontconfig ttf-dejavu

COPY . /app/

#RUN cd /app \
#    && mkdir lib \
#    && ./gradlew -i jar

EXPOSE 3271
EXPOSE 3272
EXPOSE 3273
EXPOSE 8080
EXPOSE 8081

WORKDIR /app

#CMD ["./gradlew --offline run"]
#CMD ["bash"]
CMD ["java", "-cp", "build/classes/java/main:build/libs/*","jacamo.infra.JaCaMoLauncher", "src/jcm/main.jcm"]
