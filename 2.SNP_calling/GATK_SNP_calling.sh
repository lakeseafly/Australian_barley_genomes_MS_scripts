### Samples were mapped to the Clipper reference genome using BWA

bwa mem -M -R '@RG\tID:igri\tLB:igri\tPL:ILLUMINA\tPM:HISEQ\tSM:igri' -t 24 Clipper.V1.fasta igri_1.fastq igri_2.fastq | samtools view -@ 12 -Sb - |samtools sort -@ 12 -o igri.sort.bam

### Finding and removing the duplicate reads in BAM file

sambamba markdup -r -t 16 igri.sort.bam igri.mark.bam

### HaplotypeCalling using GATK3.8

java -jar GenomeAnalysisTK.jar -T HaplotypeCaller -R Clipper.V1.fasta -I igri.mark.bam -o igri.g.vcf -ERC GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -nct 24 -allowPotentiallyMisencodedQuals

### After all the samples are processed the above steps, merge the generated g.vcf files of all the samples

java -jar GenomeAnalysisTK.jar -T GenotypeGVCFs -R Clipper.V1.fasta -V Barley.gvcf.list -o Barley_variants.raw.vcf -newQual  -nt 28

### Extract the SNP and INDEL variants

java -jar ~/biosoft/GenomeAnalysisTK.jar -T SelectVariants -R Clipper.V1.fasta -V Barley_variants.raw.vcf -selectType SNP -o SNPs.vcf

java -jar ~/biosoft/GenomeAnalysisTK.jar -T SelectVariants -R Clipper.V1.fasta -V Barley_variants.raw.vcf -selectType INDEL  -o INDELs.vcf






