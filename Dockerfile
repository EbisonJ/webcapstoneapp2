FROM mave AS STAGE1
COPY ./src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM tomcat
RUN rm -fr /usr/local/tomcat/webapps/ROOT
COPY --from=stagel /usr/src/app/target/webappl.war /usr/local/tomcat/webapps/ROOT.war