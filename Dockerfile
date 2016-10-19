# Builds a clean ubuntu image with nginx
FROM patriknyblad/ubuntu-xenial-supervisord:1.0.0
MAINTAINER Patrik Nyblad <patrik.nyblad@gmail.com>

# Install NGINX
RUN apt-get -q update &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew"  --no-install-recommends nginx &&\
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

# Copy NGINX configuration
COPY nginx /etc/nginx

CMD ["/usr/sbin/nginx"]
