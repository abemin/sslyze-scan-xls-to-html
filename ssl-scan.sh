#! /bin/bash

while getopts ":h:o:" opt; do
  case ${opt} in
    h ) hostname=$OPTARG
      ;;
    o ) output=$OPTARG
      ;;
    \? ) echo
   	 echo "Syntax: ./ssl-scan.sh [ -i | -o ]"
   	 echo "options:"
   	 echo "i     host name."
   	 echo "o     output filename."
   	 echo "Example Usage: ./ssl-scan.sh -h www.google.com -o google"
      ;;
     : )
         echo "Invalid Option: -$OPTARG requires an argument" 1>&2
	 echo "Example Usage: ./ssl-scan.sh -h www.google.com -o google"
         exit 1
         ;;
  esac
done
shift $((OPTIND -1))

python2 -m sslyze --regular --xml_out=/dev/stdout --quiet $hostname:443 | xsltproc sslyze.xsl - > $output.html

echo "Scan Done!";
