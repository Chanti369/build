FROM couchbase/centos7-systemd as build
COPY context.xml /opt/tomcat/webapps/manager/META-INF/
