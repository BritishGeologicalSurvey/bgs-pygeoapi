FROM geopython/pygeoapi:latest

#Install git
RUN apt-get update 
RUN apt-get install -y git

## BGS Template

# RUN git clone https://github.com/BritishGeologicalSurvey/pygeoapi-skin-dashboard /pygeoapi/pygeoapi-skin-dashboard/

## BGS Config and Local Files

COPY ./content/local.config.yml /pygeoapi/local.config.yml
COPY ./content/process /pygeoapi/
# COPY ./content/plugin.py /pygeoapi/plugin.py

## BGS Source Data Files

COPY ./content/data/bedrock_geology.geojson /pygeoapi/bgsdata/bedrock_geology.geojson
COPY ./content/data/dykes_geology.geojson /pygeoapi/bgsdata/dykes_geology.geojson
COPY ./content/data/fault_geology.geojson /pygeoapi/bgsdata/fault_geology.geojson
COPY ./content/data/superficial_geology.geojson /pygeoapi/bgsdata/superficial_geology.geojson 
COPY ./content/data/625k_V5_Geology_All.gpkg /pygeoapi/bgsdata/625k_V5_Geology_All.gpkg 

ENV SCRIPT_NAME='/pygeoapi/'

EXPOSE ${CONTAINER_PORT}
