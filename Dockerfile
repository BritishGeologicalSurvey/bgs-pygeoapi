FROM geopython/pygeoapi:latest

#Install git
RUN apt-get update 
RUN apt-get install -y git

# Upgrade jinja2
RUN pip3 install Jinja2==3.0.2

## BGS Config 

COPY ./content/local.config.yml /pygeoapi/local.config.yml

## BGS Template

COPY ./content/templates/ /pygeoapi/bgs-skin-dashboard/templates
COPY ./content/static/ /pygeoapi/bgs-skin-dashboard/static

## Data Files 

COPY ./content/bgsgeology625k.gpkg /pygeoapi/bgsdata/bgsgeology625k.gpkg
COPY ./content/gb_50k_bedrock/ /pygeoapi/bgsdata/gb_50k_bedrock/
COPY ./content/625k_bedrock/ /pygeoapi/tests/data/tiles/gb_625k_bedrock/

ENV SCRIPT_NAME='/'

EXPOSE 80
