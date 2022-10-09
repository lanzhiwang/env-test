FROM centos:centos7.9.2009 as builder
WORKDIR /src
RUN yum install -y automake libtool wget which make
RUN wget https://github.com/akopytov/sysbench/archive/1.0.20.tar.gz -O sysbench-1.0.20.tar.gz \
&& tar -xvf sysbench-1.0.20.tar.gz
WORKDIR /src/sysbench-1.0.20
RUN sh autogen.sh && ./configure --without-mysql && make -j8 && make install

# Build the manager binary
FROM centos:centos7.9.2009

WORKDIR /workspace

# set aliyun repo
#RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
#RUN curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
#RUN rm -rf /etc/yum.repos.d/CentOS-AppStream.repo

COPY --from=builder /usr/local/bin/sysbench /usr/local/bin/sysbench
# Copy source
COPY endpoint.sh endpoint.sh
COPY sbin ./sbin
COPY tools ./tools

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-* \
    && rpm --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
    && yum install -y epel-release && yum provides '*/applydeltarpm' \
    && yum install -y deltarpm iperf3 fio lshw jq tree pciutils libtool vim telnet net-tools pkgconfig libaio-devel \
    && yum clean all

ENTRYPOINT ["/workspace/endpoint.sh"]