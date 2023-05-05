FROM nvidia/cuda:12.1.1-devel-centos7

LABEL maintainer "Daniel Park <dpark@broadinstitute.org>"
LABEL maintainer_other "Christopher Tomkins-Tinch <tomkinsc@broadinstitute.org>"


RUN pwd

COPY install-apt_packages.sh /opt/docker/
COPY install-beagle.sh /opt/docker/
COPY install-beast.sh /opt/docker/


# System packages, Google Cloud SDK, and locale
# ca-certificates and wget needed for gosu
# bzip2, liblz4-toolk, and pigz are useful for packaging and archival
# google-cloud-sdk needed when using this in GCE
RUN /opt/docker/install-apt_packages.sh

ENV PATH /usr/local/cmake/bin:$PATH

# Set default locale to en_US.UTF-8
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"
ENV LD_LIBRARY_PATH /usr/local/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH /usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs:${LIBRARY_PATH}

RUN /opt/docker/install-beagle.sh

RUN /opt/docker/install-beast.sh

ENV BEAST="/usr/local"

CMD ["/bin/bash"]
