FROM docker.io/maven:3 as builder
WORKDIR /tmp

# summit-2020-kogito-businessautomation
RUN git clone https://github.com/adamclark/db-rhamt-demo.git && \
    cd /tmp/db-rhamt-demo && \
    mvn clean install -DskipTests -B -Dmaven.repo.local=/tmp/bucketrepo && \
    mvn de.qaware.maven:go-offline-maven-plugin:resolve-dependencies -DdownloadSources -DdownloadJavadoc -B -Dmaven.repo.local=/tmp/bucketrepo && \
    mvn dependency:go-offline -B -Dmaven.repo.local=/tmp/bucketrepo && \
    cd /tmp/bucketrepo && \
    find -iname "*.repositories" -exec rm -f {} \;

FROM gcr.io/jenkinsxio/bucketrepo:0.1.19
COPY --from=builder /tmp/bucketrepo /tmp/bucketrepo
