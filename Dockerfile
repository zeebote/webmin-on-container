FROM ubuntu:20.04
COPY docker-entrypoint.sh /usr/sbin/docker-entrypoint.sh
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    perl libnet-ssleay-perl openssl libauthen-pam-perl supervisor \
    libpam-runtime libio-pty-perl python wget unzip shared-mime-info \
 && rm /etc/apt/apt.conf.d/docker-gzip-indexes \
 && rm /var/lib/apt/lists/*lz4 \
 && apt-get -o Acquire::GzipIndexes=false update \
 && apt-get install -y apt-show-versions \
 && apt-get clean -y \
 && wget http://prdownloads.sourceforge.net/webadmin/webmin_1.953_all.deb \
 && dpkg --install webmin_1.953_all.deb \
 && update-rc.d -f webmin remove \
 && rm webmin_1.953_all.deb \
 && chmod 755 /usr/sbin/docker-entrypoint.sh \
 && ln -s /usr/sbin/docker-entrypoint.sh /
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 10000/tcp
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["webmin"]
