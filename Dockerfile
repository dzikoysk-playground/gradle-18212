FROM openjdk:16 AS build
COPY . /home/gradle-build
WORKDIR /home/gradle-build
RUN chmod +x gradlew && ./gradlew build --no-daemon --stacktrace

# Run stage
FROM openjdk:16
WORKDIR /app
COPY --from=build /home/gradle-build/build/libs/*.jar ./application.jar
ENTRYPOINT exec java -jar application.jar
