import os
import sys

os.system(f"minimap2 {sys.argv[1]} {sys.argv[2]} > {sys.argv[1]}.paf")

if os.path.isfile(f"{sys.argv[1]}.muc1.fa"):
	#print("hej")
	os.system(f"rm {sys.argv[1]}.muc1.fa")

for line in open(f"{sys.argv[1]}.paf"):
	content=line.strip().split()
	region=(f"{content[5]}:{content[7]}-{content[8]}")
	orientation=content[4]
	if orientation == "+":
		os.system(f"singularity exec samtools_1.21--h50ea8bc_0.sif samtools faidx -i  {sys.argv[1]} {region} >> {sys.argv[1]}.muc1.fa")
	elif orientation == "-":
		os.system(f"samtools faidx {sys.argv[1]} {region} >> {sys.argv[1]}.muc1.fa")
