FROM geopython/pygeoapi:latest

#Install git
RUN apt-get update 
RUN apt-get install -y git

## BGS Template

RUN git clone https://github.com/BritishGeologicalSurvey/pygeoapi-skin-dashboard /pygeoapi/pygeoapi-skin-dashboard/

## BGS Config and Local Files

COPY ./content/local.config.yml /pygeoapi/local.config.yml
COPY ./content/bedrock_geology.geojson /pygeoapi/bgsdata/bedrock_geology.geojson
COPY ./content/dykes_geology.geojson /pygeoapi/bgsdata/dykes_geology.geojson
COPY ./content/fault_geology.geojson /pygeoapi/bgsdata/fault_geology.geojson
ADD ./content/fault_geology /pygeoapi/bgsdata/tiles/fault_geology/
COPY ./content/superficial_geology.geojson /pygeoapi/bgsdata/superficial_geology.geojson 
COPY ./content/625k_V5_Geology_All.gpkg /pygeoapi/bgsdata/625k_V5_Geology_All.gpkg 

ENV SCRIPT_NAME='/pygeoapi/'

EXPOSE 80
