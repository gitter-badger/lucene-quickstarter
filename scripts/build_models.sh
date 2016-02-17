#!/bin/bash

readonly DBPEDIA_VERSION=$1
readonly all_languages=(es fr it nl pl pt ru de en ca el)

for lang in ${all_languages[@]}
do
./download_dbpedia.sh ${DBPEDIA_VERSION} ${lang}
./download_wikipedia.sh ${lang}
./index_all.sh ${DBPEDIA_VERSION}
./run_index.sh ${DBPEDIA_VERSION} ${lang}
./package.sh ${DBPEDIA_VERSION} ${lang}
./publish_sf.sh ${DBPEDIA_VERSION} ${lang} &
rm /mnt/dbpedia_data -r
rm /mnt/wikipedia -r
done

