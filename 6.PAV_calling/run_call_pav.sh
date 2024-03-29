### Using mosdepth to detect the coverage of sequencing reads from each accessions

mosdepth -n -t 3 --thresholds 1 -b Clipper.V1.gene.bed Sample1 Sample1.merge.bam

### Detect the gene PAV of each accessions

bedtools intersect -a Sample1.per-base.bed.gz -b Clipper.V1.gene.bed -wao | grep -v '\-1' | awk '{if ($4 >=2) print}' > Sample1.extract.bed 

python makePAV.py Sample1.extract.bed > Sample1_PAV.tsv

### Generate the PAV matrix

head -1 Sample1_PAV.tsv > Header
cat *PAV.tsv | grep -v Ind >> Header 
 mv Header Final_PAV_Table.tsv
