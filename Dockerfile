# Stage 1: Build with Maven (renamed to lowercase)
FROM maven AS stage1
COPY ./src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

# Stage 2: Deploy to Tomcat
FROM tomcat
RUN rm -fr /usr/local/tomcat/webapps/ROOT
# Corrected stage reference and filename case
COPY --from=stage1 /usr/src/app/target/*.war /usr/local/tomcat/webapps/ROOT.war
