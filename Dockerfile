FROM debian:bullseye-slim

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

# hadolint ignore=DL3008
RUN set -x && \
    apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
        bzip2 \
        ca-certificates \
        git \
        libglib2.0-0 \
        libsm6 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxinerama1 \
        libxrandr2 \
        libxrender1 \
        #mercurial \
        openssh-client \
        procps \
        #subversion \
        wget \
        build-essential \
        gfortran \
        zlib1g-dev \
        postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-4.1.0.tar.gz && tar xzf cfitsio-4.1.0.tar.gz && rm cfitsio-4.1.0.tar.gz && cd /cfitsio-4.1.0 && ./configure --prefix=/usr/local/ && make && make install && ldconfig

RUN git clone https://github.com/neomatrixcode/fits2db.git && cd /fits2db && make && make install && cp fits2db /usr/local/bin/


CMD [ "/bin/bash" ]





