FROM ubuntu:20.04
WORKDIR /usr/src

RUN apt update -qq
RUN apt install -y software-properties-common
# RUN add-apt-repository -y ppa:ubuntugis/ppa
RUN add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
RUN apt update -qq
RUN apt install -y git gdal-bin libgdal-dev python3-gdal python3-pip python3-virtualenv
RUN pip3 install jupyterlab geojson seaborn geopandas
RUN pip3 install --upgrade numpy
RUN pip3 install --upgrade geopandas
RUN pip3 install rasterio==1.2.10  # GDAL 3.0.4 compatibility

RUN	RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN	RUN unzip awscliv2.zip
RUN	RUN ./aws/install

CMD jupyter-lab --allow-root --ip 0.0.0.0
