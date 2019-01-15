FROM tomcat:7-jre8-alpine

# Openmrs version 2.8.0 insltallation 
MAINTAINER geryepes@gmail.com

# Platform 2.1.4 war link
ENV link1="https://ufpr.dl.sourceforge.net/project/openmrs/releases/OpenMRS_Platform_2.1.4/openmrs.war"
# Reference Application 2.8.0 addons link
ENV link2="https://ufpr.dl.sourceforge.net/project/openmrs/releases/OpenMRS_Reference_Application_2.8.0/referenceapplication-addons-2.8.0.zip"
# Folder where zipfile is decompressed
ENV folder="referenceapplication-package-2.8.0"

RUN rm -rf /usr/local/tomcat/webapps/* && \
    wget ${link1} -qO "/usr/local/tomcat/webapps/openmrs.war" && \
    wget ${link2} -qO "/root/addons.zip" && \
    cd /root/ && \
    unzip addons.zip && \
    mv ${folder}/ .OpenMRS/ && \
    rm -f addons.zip 

COPY --chown=root entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "sh", "/entrypoint.sh" ]

CMD ["catalina.sh", "run"]