FROM openjdk:22-ea-28-slim-bullseye
EXPOSE 8080
ADD target/springboot-github-cicd.jar springboot-github-cicd.jar
ENTRYPOINT ["java", "-jar", "/springboot-github-cicd.jar"]
