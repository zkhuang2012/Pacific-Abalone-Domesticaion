library(dplyr)
library(CMplot)

cnn_cns_fst <- read.table(
  "./CNN_vs_CNS_FST.txt",
  header = TRUE,
  sep = "\t",
  stringsAsFactors = F
)
cnn_cns_fst2 <- cnn_cns_fst %>%
  mutate(chr = factor(chr, levels = c(paste0("chr", 1:18)))) %>%
  mutate(id = paste0(chr, "_", start))

cnn_cns_fst_perc95 <- cnn_cns_fst2[cnn_cns_fst2$fst_perc >= 0.95, ]

threshold_99 <- min(cnn_cns_fst_perc95[cnn_cns_fst_perc95$fst_perc >= 0.99, ]$WEIGHTED_FST)
threshold_95 <- min(cnn_cns_fst_perc95[cnn_cns_fst_perc95$fst_perc >= 0.95, ]$WEIGHTED_FST)

cnn_cns_fst_perc95_sort <- cnn_cns_fst_perc95[order(cnn_cns_fst_perc95$WEIGHTED_FST, decreasing = TRUE), ]
cnn_cns_fst_perc95_sort_top100 <- head(cnn_cns_fst_perc95_sort, 100)

gene_symbol <- read.table("CNN_vs_CNS_FST_geneid.txt", header = T, sep = "\t")
gene_symbol <- as.vector(gene_symbol[,2])

cnn_cns_fst2 %>%
  dplyr::select(id, chr, start, WEIGHTED_FST) %>%
  na.omit() %>%
  CMplot(
    LOG10 = FALSE,
    col = c("#888888CC", "#333333CC"),
    pch = 16,
    type = "p",
    plot.type = "m",
    cex = c(1, 0.7, 1),
    multracks = FALSE,
    threshold = c(threshold_99, threshold_95),
    threshold.lty = c(2, 2),
    threshold.lwd = c(2, 2),
    threshold.col = c("red", "black"),
    amplify = FALSE,
    highlight = cnn_cns_fst_perc95_sort_top100$id,
    highlight.text = gene_symbol,
    highlight.cex = 0.9,
    highlight.pch = 16,
    highlight.type = "p",
    highlight.col = "red",
    highlight.text.col = "black",
    highlight.text.cex = 1,
    highlight.text.font = 2,
    ylab = "Northern vs Southern 1 FST",
    file.output = TRUE,
    file.name = "CNN_vs_CNS_FST",
    file = "pdf",
    dpi = 300,
    width = 15,
    height = 5,
    verbose = TRUE,
    chr.labels.angle = 0
  )