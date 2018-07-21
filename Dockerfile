FROM centos/systemd

MAINTAINER "Your Name" <you@example.com>
ENV container docker
EXPOSE 443

COPY phpldapadmin.conf httpd.conf config.php ./

# CIS Docker Community Edition Benchmark
# 4.7 Ensure update instructions are not use alone in the Dockerfile
# change the document root to point to htdocs and the ssl keys
# CIS Apache HTTP Server 2.4 Benchmark 1.2.3 Disable WebDAV Modules
#    rm /etc/httpd/conf.modules.d/00-dav.conf
# CIS Apache HTTP Server 2.4 Benchmark 1.2.4 Disable Status Module
#    sed '/.*status_module.*/d' -i /etc/httpd/conf.modules.d/00-base.conf
# CIS Apache HTTP Server 2.4 Benchmark 1.2.5 Disable Autoindex Module
#    sed '/.*autoindex.*/d' -i /etc/httpd/conf.modules.d/00-base.conf && \
#    rm /etc/httpd/conf.d/autoindex.conf
# CIS Apache HTTP Server 2.4 Benchmark 1.2.6 Disable Proxy Modules
#    sed '/.*proxy.*/d' -i /etc/httpd/conf.modules.d/00-proxy.conf
# CIS Apache HTTP Server 2.4 Benchmark 1.2.7 Disable User Directories Modules
#    sed '/.*userdir.*/d' -i /etc/httpd/conf.modules.d/00-base.conf
# CIS Apache HTTP Server 2.4 Benchmark 1.2.8 Disable Info Module
#    sed '/.*info_module.*/d' -i /etc/httpd/conf.modules.d/00-base.conf
# generate the ssl keys
# CIS Apache HTTP Server 2.4 Benchmark 1.5.5
#   rm -rf /var/www/
# CIS Apache HTTP Server 2.4 1.5.4 Remove Default HTML Content
#   rm -rf /var/www/
#   rm /etc/httpd/conf.d/welcome.conf && \
#   rm /etc/httpd/conf.d/userdir.conf

RUN yum install epel-release -y && \
    yum update -y && \
    yum -y install phpldapadmin && \
    yum -y install mod_ssl openssl && \
    yum -y erase httpd-manual && \
    yum clean all 
COPY phpldapadmin.conf httpd.conf config.php ssl.conf ./
RUN rm /etc/httpd/conf.modules.d/00-dav.conf && \
    sed '/.*status_module.*/d' -i /etc/httpd/conf.modules.d/00-base.conf && \
    sed '/.*autoindex.*/d' -i /etc/httpd/conf.modules.d/00-base.conf && \
    rm /etc/httpd/conf.d/autoindex.conf && \
    sed '/.*proxy.*/d' -i /etc/httpd/conf.modules.d/00-proxy.conf && \
    sed '/.*userdir.*/d' -i /etc/httpd/conf.modules.d/00-base.conf && \
    sed '/.*info_module.*/d' -i /etc/httpd/conf.modules.d/00-base.conf && \
    rm -rf /var/www/ && \
    openssl genrsa -out /etc/pki/tls/private/localhost.key 2048 && \
    openssl req -new -key /etc/pki/tls/private/localhost.key \
       -out /etc/pki/tls/private/phpldapadmin.csr \
       -subj "/C=US/ST=California/L=Ridgecrest/O=IT/CN=phldapadmin.atomic.local" && \
    openssl x509 -req -days 365 \
       -in /etc/pki/tls/private/phpldapadmin.csr \
       -signkey /etc/pki/tls/private/localhost.key \
       -out /etc/pki/tls/certs/localhost.crt && \
    mkdir -p /var/log/httpd/phphldapadmin/ && \
    rm /etc/httpd/conf.d/welcome.conf && \
    rm /etc/httpd/conf.d/userdir.conf && \
    mv phpldapadmin.conf /etc/httpd/conf.d/phpldapadmin.conf && \
    mv httpd.conf /etc/httpd/conf/httpd.conf && \
    mv config.php /etc/phpldapadmin/config.php && \
    mv ssl.conf /etc/httpd/conf.d/ssl.conf

# CIS Docker Community Edition Benchmark
# 4.6 Ensure HEALTHCHECK instructions have been added to the container image
HEALTHCHECK CMD curl --fail --insecure https://localhost/ || exit 1
RUN systemctl enable httpd.service
STOPSIGNAL SIGRTMIN+3
CMD ["/usr/sbin/init"]

