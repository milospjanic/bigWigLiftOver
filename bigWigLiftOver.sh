#bigWigLiftOver

#!/bin/bash

DIR=~/bigWigLiftOver
FILE=~/bigWigToBedGraph
FILE2=~/hg18ToHg19.over.chain.gz
FILE3=~/liftOver
FILE4=~/bedGraphToBigWig 

BIGWIG=$(pwd)/$1
echo Proccesing file:
echo $BIGWIG

#check if working folder exist, if not, create

if [ ! -d $DIR ]
then
mkdir ~/bigWigLiftOver
fi

cd ~/bigWigLiftOver

#check if bigWigToBedGraph file exists, if not, download from http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64.v287/

if [ ! -f $FILE ]
then
wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64.v287/bigWigToBedGraph
fi

chmod 755 ./bigWigToBedGraph

./bigWigToBedGraph $BIGWIG out.bedGraph


#check if hg18ToHg19.over.chain.gz file exists, if not, download from http://hgdownload.cse.ucsc.edu/goldenpath/hg18/liftOver/

if [ ! -f $FILE2 ]
then
wget http://hgdownload.cse.ucsc.edu/goldenpath/hg18/liftOver/hg18ToHg19.over.chain.gz
fi

gunzip hg18ToHg19.over.chain.gz

#check if liftOver file exists, if not, download from http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64.v287/

if [ ! -f $FILE3 ]
then
wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64.v287/liftOver
fi

chmod 755 ./liftOver

./liftOver -bedPlus=4 out.bedGraph hg18ToHg19.over.chain out.bedGraph.hg19 unMapped 

#check if bedGraphToBigWig file exists, if not, download from http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64.v287/

if [ ! -f $FILE4 ]
then
wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64.v287/bedGraphToBigWig
fi

chmod 755 ./bedGraphToBigWig

./bedGraphToBigWig out.bedGraph.hg19 $BIGWIG.hg19

