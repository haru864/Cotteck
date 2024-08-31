FROM container-registry.oracle.com/java/openjdk:21 as build 

# Install maven
WORKDIR /usr/share
RUN set -x && \
    curl -O https://archive.apache.org/dist/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz && \
    tar -xvf apache-maven-*-bin.tar.gz  && \
    rm apache-maven-*-bin.tar.gz && \
    mv apache-maven-* maven && \
    ln -s /usr/share/maven/bin/mvn /bin/

WORKDIR /helidon

ADD ./helidon/pom.xml .
RUN mvn package -DskipTests

ADD ./helidon/src src
RUN mvn package -DskipTests 
RUN echo "done!"



FROM container-registry.oracle.com/java/openjdk:21

# Install maven
WORKDIR /usr/share
RUN set -x && \
    curl -O https://archive.apache.org/dist/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz && \
    tar -xvf apache-maven-*-bin.tar.gz  && \
    rm apache-maven-*-bin.tar.gz && \
    mv apache-maven-* maven && \
    ln -s /usr/share/maven/bin/mvn /bin/

WORKDIR /helidon

COPY --from=build /helidon/target/helidon-mp-tutorial.jar ./
COPY --from=build /helidon/target/libs ./libs

COPY wait-for-it.sh .
COPY ./helidon/migrate.bash .
COPY ./helidon/docker-entrypoint.sh .
RUN chmod +x wait-for-it.sh
RUN chmod +x migrate.bash
RUN chmod +x docker-entrypoint.sh

ADD ./helidon/pom.xml .
COPY ./helidon/config ./config
COPY ./helidon/src/main/resources/db/migration ./src/main/resources/db/migration

EXPOSE 10080

ENTRYPOINT ["./docker-entrypoint.sh"]
