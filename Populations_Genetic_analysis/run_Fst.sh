## Fst

time vcftools --gzvcf pop1.final.vcf.gz --weir-fst-pop sample_CNS.txt --weir-fst-pop sample_CNN.txt --fst-window-size 10000 --fst-window-step 5000 --out CNS_vs_CNN.w10k.s5k.windowed.weir.fst

time vcftools --gzvcf pop2.final.vcf.gz --weir-fst-pop sample_HN.txt --weir-fst-pop sample_JJ.txt --fst-window-size 10000 --fst-window-step 5000 --out HN_vs_JJ.w10k.s5k.windowed.weir.fst
