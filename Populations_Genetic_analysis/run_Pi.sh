## Pi

for i in CNN CNS JAN JAS KOR; 

do
	time bcftools view -S sample_${pop}.txt pop1.final.vcf.gz -Oz --threads 10 | vcftools --gzvcf - --window-pi 10000 --out ${pop}.w10k.pi

done

for i in HN JJ; 

do
	time bcftools view -S sample_${pop}.txt pop2.final.vcf.gz -Oz --threads 10 | vcftools --gzvcf - --window-pi 10000 --out ${pop}.w10k.pi

done
