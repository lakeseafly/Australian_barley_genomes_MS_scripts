## PCA analysis

### Transfer the VCF file to plink format

~/biosoft/plink --allow-extra-chr --out myplink --recode --vcf SNPs.id.biallic_maf_0.05_geno_0.1.vcf
~/biosoft/plink --allow-extra-chr --file myplink --noweb --make-bed --out tmp

### Using the GCTA to calculate the PCA 

~/biosoft/gcta_1.91.6beta/gcta64 --bfile tmp --make-grm --autosome --out tmp
~/biosoft/gcta_1.91.6beta/gcta64 --grm tmp --pca --out pcatmp

## ML-based Phylogentic trees construction

###covert VCF file to phylip format

vcf2phylip.py -i SNPs.id.biallic_maf_0.05_geno_0.1.vcf

### Using Iq-tree to build the tree

./iqtree -s SNPs.id.biallic_maf_0.05_geno_0.1.phy -alrt 1000 -bb 1000 -n 10

## Population wide FST 

vcf=SNPs.id.biallic_maf_0.05_geno_0.1.vcf
window=100000
step=10000

vcftools --vcf $vcf --fst-window-size $window --fst-window-step $step --weir-fst-pop AUS.list --weir-fst-pop EUR.list --out AUS_vs_EUR_10kb_fst
vcftools --vcf $vcf --fst-window-size $window --fst-window-step $step --weir-fst-pop AUS.list --weir-fst-pop AME.list --out AUS_vs_AME_10kb_fst
vcftools --vcf $vcf --fst-window-size $window --fst-window-step $step --weir-fst-pop AME.list --weir-fst-pop EUR.list --out AME_vs_EUR_10kb_fst

## Population wide nucleotide diversity

vcf=SNPs.id.biallic_maf_0.05_geno_0.1.vcf
window=100000
step=10000

vcftools --vcf $vcf --window-pi $window --window-pi-step $step --keep AUS.list --out AUS_10kb_pi
vcftools --vcf $vcf --window-pi $window --window-pi-step $step --keep AME.list --out AME_10kb_pi
vcftools --vcf $vcf --window-pi $window --window-pi-step $step --keep EUR.list --out EUR_10kb_pi

## Selected regions detection using the XP-CLR

xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr1_AUS_vs_AME -C 1 -Sa AUS.list -Sb AME.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr2_AUS_vs_AME -C 2 -Sa AUS.list -Sb AME.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr3_AUS_vs_AME -C 3 -Sa AUS.list -Sb AME.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr4_AUS_vs_AME -C 4 -Sa AUS.list -Sb AME.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr5_AUS_vs_AME -C 5 -Sa AUS.list -Sb AME.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr6_AUS_vs_AME -C 6 -Sa AUS.list -Sb AME.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr7_AUS_vs_AME -C 7 -Sa AUS.list -Sb AME.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr1_AUS_vs_EUR -C 1 -Sa AUS.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr2_AUS_vs_EUR -C 2 -Sa AUS.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr3_AUS_vs_EUR -C 3 -Sa AUS.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr4_AUS_vs_EUR -C 4 -Sa AUS.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr5_AUS_vs_EUR -C 5 -Sa AUS.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr6_AUS_vs_EUR -C 6 -Sa AUS.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr7_AUS_vs_EUR -C 7 -Sa AUS.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr1_AME_vs_EUR -C 1 -Sa AME.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr2_AME_vs_EUR -C 2 -Sa AME.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr3_AME_vs_EUR -C 3 -Sa AME.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr4_AME_vs_EUR -C 4 -Sa AME.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr5_AME_vs_EUR -C 5 -Sa AME.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr6_AME_vs_EUR -C 6 -Sa AME.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000
xpclr -I ref_select_SNPs.id.biallic_maf_0.05_geno_0.1.vcf -O xpclr_chr7_AME_vs_EUR -C 7 -Sa AME.list -Sb EUR.list --maxsnps 1000 --size 100000 --step 10000




