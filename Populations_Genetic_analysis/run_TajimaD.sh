## TajimaD

time bcftools view -S sample_CNN.txt pop1.final.vcf.gz -Oz --threads 10 | vcftools --gzvcf - --TajimaD 10000 --out CNN.win10k.TajimaD


time bcftools view -S sample_CNS.txt pop1.final.vcf.gz -Oz --threads 10 | vcftools --gzvcf - --TajimaD 10000 --out CNS.win10k.TajimaD


time bcftools view -S sample_KOR.txt pop1.final.vcf.gz -Oz --threads 10 | vcftools --gzvcf - --TajimaD 10000 --out KOR.win10k.TajimaD


time bcftools view -S sample_JAN.txt pop1.final.vcf.gz -Oz --threads 10 | vcftools --gzvcf - --TajimaD 10000 --out JAN.win10k.TajimaD


time bcftools view -S sample_JAS.txt pop1.final.vcf.gz -Oz --threads 10 | vcftools --gzvcf - --TajimaD 10000 --out JAS.win10k.TajimaD
