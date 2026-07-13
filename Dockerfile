FROM eclipse-temurin:17-jdk-jammy

ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"

RUN apt-get update \
    && apt-get install -y --no-install-recommends xvfb x11vnc fluxbox \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY lib ./lib
COPY src ./src
COPY pom.xml ./
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh \
    && mkdir -p target/classes \
    && find src/main/java -name "*.java" > sources.txt \
    && javac -encoding UTF-8 -cp "lib/flatlaf-3.6.jar:lib/flatlaf-extras-3.6.jar" -d target/classes @sources.txt \
    && cp -R src/main/resources/. target/classes/

EXPOSE 5900

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
