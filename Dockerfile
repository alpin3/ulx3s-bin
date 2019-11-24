FROM alpine:3.10
MAINTAINER kost - https://github.com/kost

ENV ULX3SBASEDIR=/opt \
 ULX3SURL=https://github.com/alpin3/ulx3s/releases/download/v2019.11.25/ulx3s-2019-11-25-linux-amd64.tar.gz \
 ULX3STMP=/tmp/ulx3s.tgz

RUN apk --update add git bash wget ca-certificates python3 py2-pip && \
 rm -f /var/cache/apk/* && \
 wget $ULX3SURL -O $ULX3STMP && \
 tar -xvz --strip-components=1 -C /usr/local/bin -f $ULX3STMP && \
 rm -f $ULX3STMP && \
 cd $ULX3SBASEDIR && \
 git clone https://github.com/emard/ulx3s-bin && \
 pip2 install esptool && \
 pip2 install pyserial && \
 pip3 install esptool && \
 pip3 install pyserial && \
 pip3 install -U apio && \
 echo "Success"

