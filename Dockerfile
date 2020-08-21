FROM udacity/project-assistant-base:3.0
LABEL maintainer="fsgeek@gatech.edu"

ARG develop
ARG gpgkeyfile

ENV DEBIAN_FRONTEND=noninteractive

RUN wget -O - https://ppa.bitanical.com/pward8@gatech.edu.gpg.key|apt-key add - && \
    echo "deb https://ppa.bitanical.com/apt/debian bionic main" >> /etc/apt/sources.list.d/ppa.bitanical.list

RUN apt-get update && apt-get install -y \
    libgmp-dev \
    gcc-multilib \
    valgrind \
    portmap \
    rpcbind \
    libcurl4-openssl-dev \
    bzip2 \
    libssl-dev \
    llvm \
    net-tools \
    libtool \
    pkg-config \
    grpc-cs6200 \
    protobuf-cs6200 \ 
#===========================
# Walter's added stuff
#===========================
    cmake \
    vim 


RUN pip install --upgrade \
    future \
    cryptography \
    pyopenssl \
    ndg-httpsclient \
    pyasn1

RUN unset DEBIAN_FRONTEND
# need to add entery point to this

COPY scripts /
RUN chmod 755 /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]


