#input muc1_contig

mkdir $1.bundle
mkdir $1.bundle/bam
bowtie2-build $1 $1.bundle/bwt
cp $1 $1.bundle/

bowtie2 --very-sensitive -a -x $1.bundle/bwt -f -U repeat_sequence.fa | samtools sort - > $1.bundle/bam/$1.vntr.bam
samtools index $1.bundle/bam/$1.vntr.bam

bowtie2  -D 20 -i S,1,0.50 --score-min L,-1.4,-1.4 -L 3 -a -x $1.bundle/bwt -f -U wt.fa -R 5| samtools sort - > $1.bundle/bam/$1.wt.bam
samtools index $1.bundle/bam/$1.wt.bam

bowtie2  -a -x $1.bundle/bwt -f -U mutant.fa | samtools sort - > $1.bundle/bam/$1.mutant.bam
samtools index $1.bundle/bam/$1.mutant.bam

minimap2 $1 muc1_gene.fa -x splice -a | samtools sort - >  $1.bundle/bam/$1.muc1.bam
samtools index $1.bundle/bam/$1.muc1.bam

python analyse_vntr.py $1.bundle/bam/$1.vntr.bam $1.bundle/bam/$1.wt.bam > $1.bundle/$1.stats.txt
