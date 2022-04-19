#!/usr/bin/env bash
set -e

ES_VERSION=7.17.2

echo Installing analysis-ik
    /usr/share/elasticsearch/bin/elasticsearch-plugin remove analysis-ik || echo analysis-ik not installed
/usr/share/elasticsearch/bin/elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v$ES_VERSION/elasticsearch-analysis-ik-$ES_VERSION.zip

echo Installing analysis-stconvert
/usr/share/elasticsearch/bin/elasticsearch-plugin remove analysis-stconvert || echo analysis-stconvert not installed
/usr/share/elasticsearch/bin/elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-stconvert/releases/download/v$ES_VERSION/elasticsearch-analysis-stconvert-$ES_VERSION.zip

echo Restarting elasticsearch
sudo systemctl restart elasticsearch
sudo systemctl status elasticsearch --no-pager
