### Mapping the other genomes Stirling, Morex, Hocket, Barke, Igri and RGT Planet) to the Clipper genome and filter the mapping results, here using Stirling as an example

~/biosoft/mummer-4.0.0beta2/nucmer -l 100 -c 500 -t 28 -p Clipper_VS_Stirling Clipper_V1_ref.fasta Stirling_V1_ref.fasta
~/biosoft/mummer-4.0.0beta2/delta-filter -m -i 90 -l 100 Clipper_VS_Stirling.delta > Clipper_VS_Stirling.filter.delta
~/biosoft/mummer-4.0.0beta2/show-coords -THrd Clipper_VS_Stirling.filter.delta > Clipper_VS_Stirling.filter.coords

### Running Syri to detect the SV between Clipper and Stirling genome

python3.5 syri -c Clipper_VS_Stirling.filter.coords -d Clipper_VS_Stirling.filter.delta -r Clipper_V1_ref.fasta -q Stirling_V1_ref.fasta--nosnp --prefix Clipper_VS_Stirling.syri --lf Clipper_VS_Stirling_ref.log

#### Repat above steps for all the genomes, merge all the syri vcf files into one population-wide SVs VCF file

ls -1 *_syri.vcf > all.SVs.list
SURVIVOR merge all.SVs.list 1000 2 1 1 0 50 final.merge.vcf

#### Genotyped the SVs identifed in Syri in 56 barley accessions using Paragraph

for i in `cat accession.list`; do 
multigrmpy.py -i Syri_SVs.vcf -m ${i}.sample.txt -r Clipper_V1_ref.fasta -M 284 -o ${i}_genotype -t 24;
done