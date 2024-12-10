#!/bin/bash
IFS=$'\n'       # make newlines the only separator
for j in $(cat virus_taxa_list.txt)
do
    echo $j
    datasets download virus genome taxon $j --include genome --filename $j.zip
done
