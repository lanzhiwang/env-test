# Build the manager binary
FROM centos:centos7.9.2009

WORKDIR /workspace

# set aliyun repo
#RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
#RUN curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
#RUN rm -rf /etc/yum.repos.d/CentOS-AppStream.repo

# Copy source
COPY endpoint.sh endpoint.sh
COPY sbin ./sbin
COPY tools ./tools

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-* \
    && rpm --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
    && yum install -y epel-release && yum provides '*/applydeltarpm' && yum install -y deltarpm \
    && yum install -y iperf3 && yum install -y fio && yum install -y lshw && yum install -y jq \
    && yum install -y sysbench && yum install -y tree && yum install -y pciutils && yum install -y libtool \
    && yum install -y pkgconfig && yum install -y libaio-devel && yum clean all

ENTRYPOINT ["/workspace/endpoint.sh"]