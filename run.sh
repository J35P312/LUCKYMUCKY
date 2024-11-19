fasta=2024-15569-05.asm.bp.hap1.p_ctg.fa
python extract_muc1.py $fasta muc1.fa
bash run_bowtie.sh $fasta.muc1.fa

fasta=2024-15569-05.asm.bp.hap2.p_ctg.fa
python extract_muc1.py $fasta muc1.fa
bash run_bowtie.sh $fasta.muc1.fa

fasta=2023-40845-07.asm.bp.hap1.p_ctg.fa
python extract_muc1.py $fasta muc1.fa
bash run_bowtie.sh $fasta.muc1.fa

fasta=2023-40845-07.asm.bp.hap2.p_ctg.fa
python extract_muc1.py $fasta muc1.fa
bash run_bowtie.sh $fasta.muc1.fa

