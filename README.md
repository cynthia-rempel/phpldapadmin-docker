# phpldapadmin-docker
Centos-Based Docker Container

## NOTE: the ports apache listens on are 8080 and 8443, so must be redirected to 80 and 443, as in phpldapadmin.service.  The purpose for changing the ports is to eventually enable there to be a non-root user (not quite there).

To build it run:

sudo docker build . -t phpldapadmin:test

To start it run:

sudo ./ldap.service && sudo ./phpldapadmin.service

To peek inside it run:

sudo docker exec -ti phpldapadmin.service bash

To end it run:

sudo docker kill phpldapadmin.service && sudo docker kill ldap.service

To log into the webpage:

user:

cn=admin,dc=example,dc=org

password:

admin

Note: the LDAP container gotten from following these directions may not persist data across reboots.
For more information about the LDAP container, refer to https://github.com/osixia/docker-openldap

Most configuration modifications are spread between the Dockerfile and the configs included in the project
This project is mostly me trying to learn about application type code: docker, apache, ldap, etc.
