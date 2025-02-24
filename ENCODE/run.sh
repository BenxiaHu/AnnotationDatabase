cd ~/hpc/db/hg19/H3k27ac
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k4me3/wgEncodeBroadHistoneGm12878H3k4me3StdSig.bigWig 
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k4me3/wgEncodeBroadHistoneH1hescH3k4me3StdSig.bigWig  
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k4me3/wgEncodeBroadHistoneHsmmH3k4me3StdSig.bigWig     
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k4me3/wgEncodeBroadHistoneHuvecH3k4me3StdSig.bigWig    
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k4me3/wgEncodeBroadHistoneK562H3k4me3StdSig.bigWig    
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k4me3/wgEncodeBroadHistoneNhekH3k4me3StdSig.bigWig    
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k4me3/wgEncodeBroadHistoneNhlfH3k4me3StdSig.bigWig    
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k4me3/md5sum.txt

wget -r http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k27ac/

wget -r -l 1 -nd -e robots=off --reject jpg,html http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k27ac/
wget -r -l 1 -nd -e robots=off --reject jpg,html http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k4me1/
wget -r -l 1 -nd -e robots=off --reject jpg,html http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegMarkH3k4me3/
wget -r -l 1 -nd -e robots=off --reject jpg,html http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegTfbsClustered/
wget -r -l 1 -nd -e robots=off --reject jpg,html http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegDnaseClustered/


for i in `ls *H3k27ac*.bigWig`
do
bigWigToBedGraph $i $i.hg19.bed
done

for i in `ls *H3k4me1*.bigWig`
do
bigWigToBedGraph $i $i.hg19.bed
done

for i in `ls *H3k4me3*.bigWig`
do
bigWigToBedGraph $i $i.hg19.bed
done

for i in `ls *H3k27ac*.bigWig.hg19.bed`
do
cat $i >> wgEncodeBroadHistone.H3k27ac.hg19.bed
done

for i in `ls *H3k4me1*.bigWig.hg19.bed`
do
cat $i >> wgEncodeBroadHistone.H3k4me1.hg19.bed
done

for i in `ls *H3k4me3*.bigWig.hg19.bed`
do
cat $i >> wgEncodeBroadHistone.H3k4me3.hg19.bed
done

for i in `ls *wgEncodeBroadHistone.*.hg19.bed`
do
echo $i
bedtools sort -i $i > $i.sort.bed
done



for i in `ls *merge.hg19.bed`
do
bedtools intersect -wa -a GPL13534_450K_hg19_V2.bed -b $i > GPL13534.$i.overlap.bed
done




