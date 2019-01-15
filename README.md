## Openmrs docker image generation

#### Usage
ENVIRONMENT config mapping
The config file needed when openmrs is running and the DB was initialized is **/usr/local/tomcat/openmrs-runtime.properties** 

Configure these settings sending the following environment varibles to the container
CON_URL -> connection.url
CON_USERNAME -> connection.username
CON_PASSWORD -> connection.password
AUTO_UPDATE_DATABASE -> auto_update_database
MODULE_ALLOW_WEB_ADMIN -> module.allow_web_admin
APPLICATION_DATA_DIRECTORY -> application_data_directory
ENC_VECTOR -> encryption.vector
ENC_KEY -> encryption.key

###### Example of usage:
```
**First need to run the mysql database container**
docker run --name openmrs-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=openmrs -d mysql:5.5

docker run -it \
 -e "CON_URL=jdbc\:mysql\://openmrs-mysql\:3306/openmrs?autoReconnect\=true&sessionVariables\=default_storage_engine\=InnoDB&useUnicode\=true&characterEncoding\=UTF-8" \
 -e "CON_USERNAME=openmrs" \
 -e "CON_PASSWORD=openmrs" \
 -e "MODULE_ALLOW_WEB_ADMIN=true" \
 -e "APPLICATION_DATA_DIRECTORY=/root/.OpenMRS/" \
 --link  openmrs-mysql \
 -p8080:8080 \
 geryepes/openmrs:2.8.0
``