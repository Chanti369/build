FROM couchbase/centos7-systemd as build
RUN yum install -y java-1.8*
RUN yum install -y git
RUN yum install -y systemd
RUN yum install -y wget
WORKDIR /opt
ADD https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.78/bin/apache-tomcat-8.5.78.tar.gz /opt
RUN tar -xvf apache-tomcat-8.5.78.tar.gz
RUN mv apache-tomcat-8.5.78 tomcat
COPY context.xml /opt/tomcat/webapps/manager/META-INF/
COPY tomcatusers.xml /opt/tomcat/conf/
COPY /var/lib/jenkins/workspace/myjob/target/*.war /opt/tomcat/webapps/
RUN touch /etc/systemd/system/tomcat.service
RUN chmod 777 /etc/systemd/system/tomcat.service
COPY tomcat.service /etc/systemd/system/
RUN systemctl enable tomcat.service
CMD ["systemctl","start","tomcat.service"]
