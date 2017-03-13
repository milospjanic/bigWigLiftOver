#bigWigLiftOver

#!/bin/bash

DIR=~/bigWigLiftOver

BIGWIG=$(pwd)/$1
echo Proccesing file:
echo $BIGWIG

#check if working folder exist, if not, create

if [ ! -d $DIR ]
then
mkdir ~/chrStartEnd2rsID
fi

cd ~/chrStartEnd2rsID

#check if dbsnp file exists, if not, download from snp147Common table using mysql

if [ ! -f $FILE ]
then
mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A -N -D hg19 -e 'SELECT chrom, chromStart, chromEnd, name FROM snp147Common' > snp147Common.bed
fi
