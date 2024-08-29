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

ADD pom.xml .
RUN mvn package -DskipTests 

ADD src src
RUN mvn package -DskipTests 
RUN echo "done!"

FROM container-registry.oracle.com/java/openjdk:21
WORKDIR /helidon

COPY --from=build /helidon/target/helidon-mp-tutorial.jar ./ 
COPY --from=build /helidon/target/libs ./libs

CMD ["java", "-jar", "helidon-mp-tutorial.jar"] 
EXPOSE 10080
