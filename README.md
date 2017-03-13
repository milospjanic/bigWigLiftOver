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
--2017-03-13 14:52:34--  http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64.v287/bigWigToBedGraph
Resolving hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1138396 (1.1M) [text/plain]
Saving to: ‘bigWigToBedGraph’

100%[=======================================================================================================================================================>] 1,138,396   --.-K/s   in 0.03s   

2017-03-13 14:52:34 (33.4 MB/s) - ‘bigWigToBedGraph’ saved [1138396/1138396]

--2017-03-13 14:52:50--  http://hgdownload.cse.ucsc.edu/goldenpath/hg18/liftOver/hg18ToHg19.over.chain.gz
Resolving hgdownload.cse.ucsc.edu (hgdownload.cse.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.cse.ucsc.edu (hgdownload.cse.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 140346 (137K) [application/x-gzip]
Saving to: ‘hg18ToHg19.over.chain.gz’

100%[=======================================================================================================================================================>] 140,346     --.-K/s   in 0.009s  

2017-03-13 14:52:50 (15.5 MB/s) - ‘hg18ToHg19.over.chain.gz’ saved [140346/140346]

--2017-03-13 14:52:50--  http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64.v287/liftOver
Resolving hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 8618486 (8.2M) [text/plain]
Saving to: ‘liftOver’

100%[=======================================================================================================================================================>] 8,618,486   47.4MB/s   in 0.2s   

2017-03-13 14:52:51 (47.4 MB/s) - ‘liftOver’ saved [8618486/8618486]

Reading liftover chains
Mapping coordinates
--2017-03-13 14:53:45--  https://genome.ucsc.edu/goldenpath/help/hg19.chrom.sizes
Resolving genome.ucsc.edu (genome.ucsc.edu)... 128.114.119.132, 128.114.119.133, 128.114.119.131, ...
Connecting to genome.ucsc.edu (genome.ucsc.edu)|128.114.119.132|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1971 (1.9K) [text/plain]
Saving to: ‘hg19.chrom.sizes’

100%[=======================================================================================================================================================>] 1,971       --.-K/s   in 0s      

2017-03-13 14:53:45 (45.8 MB/s) - ‘hg19.chrom.sizes’ saved [1971/1971]

--2017-03-13 14:53:45--  http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64.v287/bedGraphToBigWig
Resolving hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1148287 (1.1M) [text/plain]
Saving to: ‘bedGraphToBigWig’

100%[=======================================================================================================================================================>] 1,148,287   --.-K/s   in 0.03s   

2017-03-13 14:53:45 (34.0 MB/s) - ‘bedGraphToBigWig’ saved [1148287/1148287]

</pre>



