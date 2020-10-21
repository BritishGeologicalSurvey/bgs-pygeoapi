FROM geopython/pygeoapi

COPY ./content/local.config.yml /pygeoapi/local.config.yml
COPY ./content/bedrock_geology.geojson ./tests/data/bedrock_geology.geojson
COPY ./content/dykes_geology.geojson ./tests/data/dykes_geology.geojson
COPY ./content/fault_geology.geojson ./tests/data/fault_geology.geojson
COPY ./content/superficial_geology.geojson ./tests/data/superficial_geology.geojson 
COPY ./content/625k_V5_Geology_All.gpkg ./tests/data/625k_V5_Geology_All.gpkg 
COPY ./content/BGS-Logo-Pos-RGB-01.png ./pygeoapi/static/img/logo.png
COPY ./content/bgs.css /pygeoapi/static/css/default.css

ENV SCRIPT_NAME='/pygeoapi/'

EXPOSE 80
