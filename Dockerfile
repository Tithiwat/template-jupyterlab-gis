FROM ubuntu:20.04
WORKDIR /usr/src
ARG TARGETPLATFORM


RUN apt update -qq
RUN apt install -y software-properties-common
# RUN add-apt-repository -y ppa:ubuntugis/ppa
RUN add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
RUN apt update -qq
RUN apt install -y git gdal-bin libgdal-dev python3-gdal python3-pip python3-virtualenv curl unzip zip
RUN pip3 install jupyterlab geojson seaborn
# RUN pip3 install --upgrade numpy
# RUN pip3 install --upgrade geopandas
RUN pip3 install pygeos==0.13
RUN pip3 install Shapely==2.0a1
RUN pip3 install rasterio==1.2.10  # GDAL 3.0.4 compatibility
RUN pip3 install Shapely==2.0a1
RUN pip3 install geopandas
RUN pip install geoparquet


# install platform specfic openJDK
RUN echo ${TARGETPLATFORM}}
RUN case ${TARGETPLATFORM} in \
         "linux/amd64")  AWS_ARCH=x86_64  ;; \
         "linux/arm64")  AWS_ARCH=aarch64  ;; \
    esac && \
    for iter in {1..3}; do curl -L -s -S "https://awscli.amazonaws.com/awscli-exe-linux-${AWS_ARCH}.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install && \
    exit_code=0 && break || exit_code=\$? && echo "download error: retry $iter in 10s" && sleep 10; done; \
    (exit $exit_code)


CMD jupyter-lab --allow-root --ip 0.0.0.0
