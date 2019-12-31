FROM alpine:3.10
MAINTAINER kost - https://github.com/kost

ENV ULX3SBASEDIR=/opt \
 ULX3SURL=https://github.com/alpin3/ulx3s/releases/download/v2019.12.30/ulx3s-2019.12.30-linux-x86_64.tar.gz \
 PATH=/opt/ulx3s/bin:$PATH \
 GHDL_PREFIX=/opt/ulx3s/ghdl/lib/ghdl

RUN apk --update add git bash tar curl ca-certificates python3 py2-pip && \
 rm -f /var/cache/apk/* && \
 mkdir -p /opt/ulx3s && \
 curl -L $ULX3SURL | tar -xvz --strip-components=1 -C /opt/ulx3s -f - && \
 pip2 install esptool && \
 pip2 install pyserial && \
 pip3 install esptool && \
 pip3 install pyserial && \
 pip3 install git+https://github.com/FPGAwars/apio@develop#egg=apio && \
 apio install scons && \
 apio install yosys && \
 apio install ecp5 && \
 echo 'export PATH=/opt/ulx3s/bin:$PATH' > /etc/profile.d/ulx3s.sh && \
 echo 'export GHDL_PREFIX=/opt/ulx3s/ghdl/lib/ghdl' >> /etc/profile.d/ulx3s.sh && \
 echo "Success"

