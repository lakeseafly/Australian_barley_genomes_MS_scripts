library("rMVP")

MVP.Data(fileVCF="myVCF.vcf",
         filePhe="gwas_popfile.txt",
         fileKin=TRUE,
         filePC=TRUE,
         out="mvp"
         )


genotype <- attach.big.matrix("mvp.geno.desc")
phenotype <- read.table("mvp.phe",head=TRUE)
map <- read.table("mvp.geno.map" , head = TRUE)


for(i in 2:ncol(phenotype)){
  imMVP <- MVP(
    phe=phenotype[, c(1, i)],
    geno=genotype,
    map=map,
    #K=Kinship,
    #CV.GLM=Covariates,
    #CV.MLM=Covariates,
    #CV.FarmCPU=Covariates,
    nPC.GLM=5,
    nPC.MLM=3,
    nPC.FarmCPU=3,
    priority="speed",
    #ncpus=10,
    vc.method="BRENT",
    maxLoop=10,
    method.bin="static",
    #permutation.threshold=TRUE,
    #permutation.rep=100,
    threshold=0.05,
    method=c("GLM", "MLM", "FarmCPU")
  )
  gc()
}
