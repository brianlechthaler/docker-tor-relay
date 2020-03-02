FROM ubuntu:bionic
RUN apt-get update
RUN apt-get install -y ca-certificates
RUN apt-get install -y curl gpg
RUN echo "deb https://deb.torproject.org/torproject.org bionic main" > /etc/apt/sources.list.d/tor.list
RUN echo "deb-src https://deb.torproject.org/torproject.org bionic main" >> /etc/apt/sources.list.d/tor.list
RUN curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
RUN apt-get update
RUN apt-get install -y tor deb.torproject.org-keyring
COPY torrc /etc/tor/torrc
EXPOSE 9001
EXPOSE 443
EXPOSE 80
ENTRYPOINT tor

