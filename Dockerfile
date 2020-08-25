FROM geopython/pygeoapi

COPY ./content/local.config.yml /pygeoapi/local.config.yml
COPY ./content/625k_V5_Geology_All.gpkg ./tests/data/625k_V5_Geology_All.gpkg 

EXPOSE 80
