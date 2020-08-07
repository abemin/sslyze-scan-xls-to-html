#! /bin/bash

while getopts h:o: flag
	do
	    case "${flag}" in
	        h) host=${OPTARG};;
	        o) output=${OPTARG};;
	    esac
	done

python2 -m sslyze --regular --xml_out=/dev/stdout --quiet $host:443 | xsltproc sslyze.xsl - > $output.html

echo "Scan Done!";
