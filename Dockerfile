FROM tomcat:10.0.0-M7-jdk11-openjdk-slim-buster

RUN apt-get update && apt-get -y install unzip
RUN wget -q https://sourceforge.net/projects/geoserver/files/GeoServer/2.17.2/geoserver-2.17.2-war.zip -O /tmp/geoserver.zip
RUN unzip -q /tmp/geoserver.zip -d /tmp
RUN mv /tmp/geoserver.war /opt/tomcat/webapps/geoserver.war

CMD /opt/tomcat/bin/deploy-and-run.sh