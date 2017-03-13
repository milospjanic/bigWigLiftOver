# bigWigLiftOver

This script will convert bigwig files from coordinates hg18 to coordinates hg19 of the human genome.

Script:
- checks if bigwigToBedGraph is present if not downloads it
- converts the bigwig to bedgraph using bigwigToBedGraph
- checks if liftOver is present if not downloads it
- lifts over the bedgraph preserving the fourth column using -bedPlus=4
- sorts the liftover output bedgraph file
- downloads hg19.chrom.sizes for bedGraphToBigWig
- checks if bedGraphToBigWig is present if not downloads it
- converts the bedgraph back to bigwig using bedGraphToBigWig

Script will save new bigwig file with .hg19 extension

#Usage

<pre>
chmod 755 ./bigWigLiftOver
./bigWigLiftOver path/to/bigwig/file.bw
</pre>

#Example

<pre>
mpjanic@valkyr:~$ ./bigWigLiftOver.sh out.bw 
Proccesing file:
/home/mpjanic/out.bw
--2017-03-13 14:22:46--  http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bigWigToBedGraph
Resolving hgdownload.cse.ucsc.edu (hgdownload.cse.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.cse.ucsc.edu (hgdownload.cse.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4342091 (4.1M) [text/plain]
Saving to: ‘bigWigToBedGraph’

100%[=======================================================================================================================================================>] 4,342,091   --.-K/s   in 0.09s   

2017-03-13 14:22:46 (44.1 MB/s) - ‘bigWigToBedGraph’ saved [4342091/4342091]

--2017-03-13 14:23:02--  http://hgdownload.cse.ucsc.edu/goldenpath/hg18/liftOver/hg18ToHg19.over.chain.gz
Resolving hgdownload.cse.ucsc.edu (hgdownload.cse.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.cse.ucsc.edu (hgdownload.cse.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 140346 (137K) [application/x-gzip]
Saving to: ‘hg18ToHg19.over.chain.gz’

100%[=======================================================================================================================================================>] 140,346     --.-K/s   in 0.009s  

2017-03-13 14:23:02 (14.7 MB/s) - ‘hg18ToHg19.over.chain.gz’ saved [140346/140346]

--2017-03-13 14:23:02--  http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/liftOver
Resolving hgdownload.cse.ucsc.edu (hgdownload.cse.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.cse.ucsc.edu (hgdownload.cse.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 16201465 (15M) [text/plain]
Saving to: ‘liftOver’

100%[=======================================================================================================================================================>] 16,201,465  50.1MB/s   in 0.3s   

2017-03-13 14:23:02 (50.1 MB/s) - ‘liftOver’ saved [16201465/16201465]

Reading liftover chains
Mapping coordinates
--2017-03-13 14:24:00--  http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig
Resolving hgdownload.cse.ucsc.edu (hgdownload.cse.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.cse.ucsc.edu (hgdownload.cse.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4351112 (4.1M) [text/plain]
Saving to: ‘bedGraphToBigWig’

100%[=======================================================================================================================================================>] 4,351,112   --.-K/s   in 0.1s    

2017-03-13 14:24:00 (43.0 MB/s) - ‘bedGraphToBigWig’ saved [4351112/4351112]

--2017-03-13 14:24:00--  https://genome.ucsc.edu/goldenpath/help/hg19.chrom.sizes
Resolving genome.ucsc.edu (genome.ucsc.edu)... 128.114.119.134, 128.114.119.133, 128.114.119.132, ...
Connecting to genome.ucsc.edu (genome.ucsc.edu)|128.114.119.134|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1971 (1.9K) [text/plain]
Saving to: ‘hg19.chrom.sizes’

100%[=======================================================================================================================================================>] 1,971       --.-K/s   in 0s      

2017-03-13 14:24:00 (47.0 MB/s) - ‘hg19.chrom.sizes’ saved [1971/1971]

Overlapping regions in bedGraph line 5823 of out.bedGraph.hg19.sort
</pre>



