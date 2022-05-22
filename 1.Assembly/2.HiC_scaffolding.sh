### Using 3D-DNA and jucier to anchor the genome assemblies into chromosome level by HiC data

### Index the contiged genome assembly for HiC-data alignment

bwa index Clipper.contigs.fasta

### Generate the protein restriction sites

python ~/juicer-master/misc/generate_site_positions.py DpnII Clipper Clipper.contigs.fasta

### Get the length of each contig

awk 'BEGIN{OFS="\t"}{print $1, $NF}' Clipper_DpnII.txt > Clipper.chrom.sizes

### run the jucier box 

juicer.sh -g Clipper-d ~/biosoft/juicer-master/hic -D ~/biosoft/juicer-master/CPU 
-z ~/biosoft/juicer-master/hic/reference/Clipper.contigs.fasta 
-y ~/biosoft/juicer-master/hic/reference/Clipper_DpnII.txt 
-p ~/biosoft/juicer-master/hic/reference/Clipper.chrom.size -s DpnII -t 36

### run the 3D-DNA

run-asm-pipeline.sh -r 2 /reference/species_name.fa aligned/merged_nodups.txt

### Manual adjust the HiC result using jucierbox and using 3D-DNA to finish the rest clustering

run-asm-pipeline-post-review.sh -r Clipper.review.assembly Clipper.contigs.fasta merged_nodups.txt


