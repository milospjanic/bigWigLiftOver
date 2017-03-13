# bigWigLiftOver

This script will convert bigwig files from coordinates hg18 to coordinates hg19 of the human genome.

Script:
- converts the bigwig to bedgraph using bigwigToBedGraph
- lifts over the bed preserving the fourth column using  -bedPlus=4
- converts the bedgraph back to bigwig using bedGraphToBigWig

#Usage

<pre>
chmod 755 ./bigWigLiftOver
./bigWigLiftOver path/to/bigwig/file.bw
</pre>
