library(ggplot2)
library(tidyverse)

cns_tajimad <- read.delim("./CNS.w10k.Tajima.D", header = T)
cnn_tajimad <- read.delim("./CNN.w10k.Tajima.D", header = T)
jas_tajimad <- read.delim("./JAS.w10k.Tajima.D", header = T)
jan_tajimad <- read.delim("./JAN.w10k.Tajima.D", header = T)
kor_tajimad <- read.delim("./KOR.w10k.Tajima.D", header = T)

cns_tajimad$POP <- "CNS"
cnn_tajimad$POP <- "CNN"
jas_tajimad$POP <- "JAS"
jan_tajimad$POP <- "JAN"
kor_tajimad$POP <- "KOR"

pops_tajimad <- rbind(cns_tajimad, cnn_tajimad) |> rbind(jas_tajimad) |> rbind(jan_tajimad) |> rbind(kor_tajimad)

plot <- pops_tajimad %>%
  ggplot(aes(x = POP, y = TajimaD, fill = POP, color = POP)) +
  geom_violin(
    stat = "ydensity",
    position = position_dodge(width = 0.5),
    draw_quantiles = NULL,
    trim = FALSE,
    scale = "width",
    na.rm = TRUE,
    orientation = "x",
    show.legend = TRUE,
    inherit.aes = TRUE,
    width = 0.5,
    alpha = 0.5,
    linewidth = 1
  ) +
  geom_boxplot(
    stat = "boxplot",
    position = position_dodge(width = 0.5),
    outliers = TRUE,
    outlier.colour = NULL,
    outlier.color = "#000000",
    outlier.fill = NULL,
    outlier.shape = 16,
    outlier.size = 1.5,
    outlier.stroke = 0,
    outlier.alpha = 0.1,
    notch = FALSE,
    notchwidth = 0.5,
    staplewidth = 0,
    varwidth = FALSE,
    na.rm = TRUE,
    orientation = "x",
    show.legend = FALSE,
    inherit.aes = TRUE,
    width = 0.2,
    fill = "white",
    color = "black",
    alpha = 1.0,
    linewidth = 1
  ) +
  # geom_point(
  #   position = position_jitter(width = 0.15, height = 0),
  #   size = 2.5,
  #   alpha = 0.8,
  #   show.legend = FALSE
  # ) +
  # stat_summary(
  #   fun = median,
  #   geom = "point",
  #   size = 3,
  #   color = "black"
  # ) +
  labs(y = "Tajima's D", x = "Population") +
  theme_light()

ggsave(
  file = "Tajimad_ViolinBox.pdf",
  plot = plot,
  width = 7,
  height = 7,
  dpi = 300
)