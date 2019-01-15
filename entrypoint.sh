#!/bin/bash
set -e


if [[ ! -z $CON_URL ]]; then
    echo "connection.url=$CON_URL" >> /usr/local/tomcat/openmrs-runtime.properties
fi
if [[ ! -z $CON_USERNAME ]]; then
    echo "connection.username=$CON_USERNAME" >> /usr/local/tomcat/openmrs-runtime.properties
fi
if [[ ! -z $CON_PASSWORD ]]; then
    echo "connection.password=$CON_PASSWORD" >> /usr/local/tomcat/openmrs-runtime.properties
fi

if [[ ! -z $AUTO_UPDATE_DATABASE ]]; then
    echo "auto_update_database=$AUTO_UPDATE_DATABASE" >> /usr/local/tomcat/openmrs-runtime.properties
fi

if [[ ! -z $MODULE_ALLOW_WEB_ADMIN ]]; then
    echo "module.allow_web_admin=$MODULE_ALLOW_WEB_ADMIN" >> /usr/local/tomcat/openmrs-runtime.properties
fi
if [[ ! -z $APPLICATION_DATA_DIRECTORY ]]; then
    echo "application_data_directory=$APPLICATION_DATA_DIRECTORY" >> /usr/local/tomcat/openmrs-runtime.properties
fi

if [[ ! -z $ENC_VECTOR ]]; then
    echo "encryption.vector=$ENC_VECTOR" >> /usr/local/tomcat/openmrs-runtime.properties
fi
if [[ ! -z $ENC_KEY ]]; then
    echo "encryption.key=$ENC_KEY" >> /usr/local/tomcat/openmrs-runtime.properties
fi

exec "$@"
