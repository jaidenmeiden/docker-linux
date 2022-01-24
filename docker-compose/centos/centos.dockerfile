# Download base image centOS 8
FROM centos:8

# LABEL about the custom image
LABEL maintainer="jaidenmeiden@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for Centos 8, Apache, and PHP services, using systemd."

ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]

# Install Apache
RUN yum -y install httpd httpd-tools

# Install PHP
RUN yum -y install php php-bcmath php-cli php-common php-gd php-intl php-json php-ldap php-mbstring \
    php-mysqlnd php-pdo php-pear php-soap php-xml php-xmlrpc php-pecl-zip

RUN yum clean all

# Update Apache Configuration
RUN sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
RUN sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php \1/g' /etc/httpd/conf/httpd.conf

# Update php-fpm Configuration
RUN sed -E -i -e 's/;listen.owner = nobody/listen.owner = apache/g' /etc/php-fpm.d/www.conf
RUN sed -E -i -e 's/;listen.group = nobody/listen.group = apache/g' /etc/php-fpm.d/www.conf
RUN sed -E -i -e 's/listen.acl_users = (.*)$/;listen.acl_users = \1/g' /etc/php-fpm.d/www.conf

RUN systemctl enable httpd.service

EXPOSE 80 443

CMD ["/usr/sbin/init"]