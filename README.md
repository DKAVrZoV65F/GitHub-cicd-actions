# 🚀 GitHub CI/CD с DockerHub

## 📌 Обзор
Этот проект демонстрирует настройку **CI/CD-пайплайна** с помощью **GitHub Actions** для автоматической сборки и публикации Docker-образа на **DockerHub**. Приложение представляет собой простой **Spring Boot 3.4.2** сервис, работающий на **Java 21**.

## 🔥 Основные возможности
✅ REST API эндпоинт `/welcome`, возвращающий приветственное сообщение.  
✅ Автоматическая сборка через **Maven**.  
✅ **Dockerfile** для контейнеризации.  
✅ **GitHub Actions** для автоматизированного CI/CD.  
✅ Публикация Docker-образа в **DockerHub**.  

## 📂 Структура проекта
```
📁 src/main/java/com/javatechie/GitHub_cicd_actions/
   ├── 📄 GitHubCicdActionsApplication.java  # Основное приложение Spring Boot
📄 pom.xml                                  # Конфигурация Maven
📄 Dockerfile                               # Инструкции для сборки Docker
📁 .github/workflows/
   ├── 📄 ci-cd-pipeline.yml                 # Конфигурация GitHub Actions
```

## 🛠 Используемые технологии
- 🖥 **Spring Boot 3.4.2**
- ☕ **Java 21**
- 🔨 **Maven**
- 🐳 **Docker**
- ⚙ **GitHub Actions**

## 🚀 Запуск проекта
### 1️⃣ Клонирование репозитория
```sh
git clone https://github.com/DKAVrZoV65F/springboot-github-cicd.git
cd springboot-github-cicd
```

### 2️⃣ Сборка проекта
```sh
mvn clean package
```

### 3️⃣ Локальный запуск
```sh
java -jar target/springboot-github-cicd.jar
```
Приложение будет доступно по адресу: `http://localhost:8080/welcome`

### 4️⃣ Сборка и запуск в Docker
```sh
docker build -t xixajzlelshii76bhcr0zztas1k4ja/springboot-github-cicd .
docker run -p 8080:8080 xixajzlelshii76bhcr0zztas1k4ja/springboot-github-cicd
```

## 🤖 Автоматизация через GitHub Actions
### 🔄 Как работает пайплайн:
1️⃣ **Сборка проекта** с помощью Maven.  
2️⃣ **Создание .jar файла**.  
3️⃣ **Создание Docker-образа**.  
4️⃣ **Публикация образа в DockerHub**.  

### 📜 Файл `.github/workflows/ci-cd-pipeline.yml`
Этот конфигурационный файл **GitHub Actions** выполняет следующие шаги:
```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: 📥 Клонирование репозитория
        uses: actions/checkout@v3
      
      - name: 🔧 Установка JDK 21
        uses: actions/setup-java@v3
        with:
          distribution: 'temurin'
          java-version: '21'
      
      - name: 🔨 Сборка проекта Maven
        run: mvn clean package

      - name: 🔑 Вход в DockerHub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_PASSWORD }}
      
      - name: 🐳 Сборка Docker-образа
        run: docker build -t your-dockerhub-username/springboot-github-cicd .
      
      - name: 🚀 Публикация образа в DockerHub
        run: docker push your-dockerhub-username/springboot-github-cicd
```

## 🔑 Переменные окружения / Секреты
Перед использованием пайплайна добавьте в **GitHub Secrets**:
- `DOCKERHUB_USERNAME` - ваш логин DockerHub
- `DOCKERHUB_PASSWORD` - ваш пароль DockerHub
