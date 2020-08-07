#! /bin/bash

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: ./ssl-scan.sh [ -h | i | o ]"
   echo "options:"
   echo "h     Print this Help."
   echo "i     host name."
   echo "o     output filename."
   echo
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################

while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      i) hostname=${OPTARG};;
      o) output=${OPTARG};;
     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done

echo "   __________ __        _____ _________    _   __"
echo "  / ___/ ___// /       / ___// ____/   |  / | / /"
echo "  \__ \\__ \/ /  ______\__ \/ /   / /| | /  |/ / "
echo " ___/ /__/ / /__/_____/__/ / /___/ ___ |/ /|  /  "
echo "/____/____/_____/    /____/\____/_/  |_/_/ |_/   "
                                                 

python2 -m sslyze --regular --xml_out=/dev/stdout --quiet $hostname:443 | xsltproc sslyze.xsl - > $output.html

echo "Scan Done!";
