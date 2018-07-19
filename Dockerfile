FROM centos/systemd

MAINTAINER "Your Name" <you@example.com>
ENV container docker
EXPOSE 443
# CIS Docker Community Edition Benchmark
# 4.7 Ensure update instructions are not use alone in the Dockerfile
RUN yum install epel-release -y && \
    yum update -y && \
    yum -y install phpldapadmin && \
    yum -y install mod_ssl openssl && \
    yum -y erase httpd-manual && \
    yum clean all

# link htdocs that shipped with phpldapadmin
RUN rm -rf /var/www/htdocs && \
    ln -sf /usr/share/phpldapadmin/htdocs/ /var/www/

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
RUN    sed 's/SSLCertificateFile\ \/etc\/pki\/tls\/certs\/localhost\.crt/SSLCertificateFile\ \/etc\/pki\/tls\/certs\/phpldapadmin\.crt/' -i /etc/httpd/conf.d/ssl.conf && \
    sed 's/SSLCertificateKeyFile\ \/etc\/pki\/tls\/private\/localhost\.key/SSLCertificateKeyFile\ \/etc\/pki\/tls\/private\/phpldapadmin\.key/' -i /etc/httpd/conf.d/ssl.conf && \
    rm /etc/httpd/conf.modules.d/00-dav.conf && \
    sed '/.*status_module.*/d' -i /etc/httpd/conf.modules.d/00-base.conf && \
    sed '/.*autoindex.*/d' -i /etc/httpd/conf.modules.d/00-base.conf && \
    rm /etc/httpd/conf.d/autoindex.conf && \
    sed '/.*proxy.*/d' -i /etc/httpd/conf.modules.d/00-proxy.conf && \
    sed '/.*userdir.*/d' -i /etc/httpd/conf.modules.d/00-base.conf && \
    sed '/.*info_module.*/d' -i /etc/httpd/conf.modules.d/00-base.conf && \
    sed 's/.*SSLProtocol.*/SSLProtocol\ \-all\ TLSv1\.1\ TLSv1\.2/' -i /etc/httpd/conf.d/ssl.conf
# generate the ssl keys
# CIS Apache HTTP Server 2.4 Benchmark 1.5.5
#   rm -rf /var/www/cgi-bin
# CIS Apache HTTP Server 2.4 1.5.4 Remove Default HTML Content
#   rm -rf /var/www/html
#   rm /etc/httpd/conf.d/welcome.conf && \
#   rm /etc/httpd/conf.d/userdir.conf
RUN openssl genrsa -out phpldapadmin.key 2048 && \
    openssl req -new -key phpldapadmin.key -out phpldapadmin.csr -subj "/C=US/ST=California/L=Ridgecrest/O=IT/CN=phldapadmin.atomic.local" && \
    openssl x509 -req -days 365 -in phpldapadmin.csr -signkey phpldapadmin.key -out phpldapadmin.crt && \
    mv phpldapadmin.crt /etc/pki/tls/certs && \
    mv phpldapadmin.key /etc/pki/tls/private/phpldapadmin.key && \
    mv phpldapadmin.csr /etc/pki/tls/private/phpldapadmin.csr && \
    mkdir -p /var/log/httpd/phphldapadmin/ && \
    rm -rf /var/www/html && \
    rm -rf /var/www/cgi-bin && \
    rm /etc/httpd/conf.d/welcome.conf && \
    rm /etc/httpd/conf.d/userdir.conf

COPY phpldapadmin.conf /etc/httpd/conf.d/phpldapadmin.conf
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY config.php /etc/phpldapadmin/config.php

# CIS Docker Community Edition Benchmark
# 4.6 Ensure HEALTHCHECK instructions have been added to the container image
HEALTHCHECK CMD curl --fail --insecure https://localhost/ || exit 1
RUN systemctl enable httpd.service
STOPSIGNAL SIGRTMIN+3
CMD ["/usr/sbin/init"]

