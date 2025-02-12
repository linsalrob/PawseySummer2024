#!/bin/bash
while read -r line <&3 && read -r line2 <&4
do
    echo $line
    echo $line2 
    datasets download virus genome taxon $line2 --include genome --filename $line2.zip
done 3<virus_extraction_list.txt 4<virus_taxa_list.txt
