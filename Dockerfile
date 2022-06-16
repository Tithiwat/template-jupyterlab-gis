FROM ubuntu:20.04
WORKDIR /usr/src

RUN apt update -qq
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:ubuntugis/ppa
RUN apt update -qq
RUN apt install -y gdal-bin libgdal-dev python3-pip
RUN pip3 install jupyterlab rasterio geojson seaborn geopandas
RUN pip3 install --upgrade numpy
RUN pip3 install --upgrade geopandas
CMD jupyter-lab --allow-root --ip 0.0.0.0

