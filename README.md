# Pacific Abalone Domesticaion

---

## 📊 Pheno_Comparison
| File | Purpose | Run command |
|------|---------|-------------|
| `plot_ABT.R` | Boxplot of ABT (Adductor Muscle Total weight) by population | `Rscript plot_ABT.R` |

---

## 🧬 Populations_Genetic_analysis
Scripts for estimating **Fst**, **π (nucleotide diversity)** and **Tajima’s D**.

| File | Purpose | Run command |
|------|---------|-------------|
| `run_Fst.sh`       | Pairwise F<sub>ST</sub> between populations | `bash run_Fst.sh` |
| `run_Pi.sh`        | Nucleotide diversity (π) per population     | `bash run_Pi.sh` |
| `run_TajimaD.sh`   | Tajima’s D per population                   | `bash run_TajimaD.sh` |

---

| File | Purpose | Run command |
|------|---------|-------------|
| `plot_Fst.R`       | Manhattan-style plot for F<sub>ST</sub>     | `Rscript plot_Fst.R` |
| `plot_Pi.R`        | Boxplot of π across populations             | `Rscript plot_Pi.R` |
| `plot_TajimaD.R`   | Boxplot of Tajima’s D across populations    | `Rscript plot_TajimaD.R` |
