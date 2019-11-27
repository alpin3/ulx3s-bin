FROM alpine:3.10
MAINTAINER kost - https://github.com/kost

ENV ULX3SBASEDIR=/opt \
 ULX3SURL=https://github.com/alpin3/ulx3s/releases/download/v2019.11.27/ulx3s-2019.11.27-linux-x86_64.tar.gz \
 ULX3SOPT=https://github.com/alpin3/ulx3s/releases/download/v2019.11.27/ulx3s-ghdl-2019.11.27-linux-x86_64.tar.gz \
 ULX3STMPOPT=/tmp/opt-ghdl.tgz \
 ULX3STMP=/tmp/ulx3s.tgz

RUN apk --update add git bash wget ca-certificates python3 py2-pip && \
 rm -f /var/cache/apk/* && \
 wget $ULX3SURL -O $ULX3STMP && \
 tar -xvz --strip-components=1 -C /usr/local/bin -f $ULX3STMP && \
 rm -f $ULX3STMP && \
 wget $ULX3SOPT -O $ULX3STMPOPT && \
 tar -xvz  -C /opt -f $ULX3STMPOPT && \
 rm -f $ULX3STMPOPT && \
 cd $ULX3SBASEDIR && \
 git clone https://github.com/emard/ulx3s-bin && \
 pip2 install esptool && \
 pip2 install pyserial && \
 pip3 install esptool && \
 pip3 install pyserial && \
 echo "Success"

