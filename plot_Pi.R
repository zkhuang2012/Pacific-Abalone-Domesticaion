library(ggplot2)
library(tidyverse)

cns_pi <- read.delim("./CNS.w10k.pi", header = T)
cnn_pi <- read.delim("./CNN.w10k.pi", header = T)
jas_pi <- read.delim("./JAS.w10k.pi", header = T)
jan_pi <- read.delim("./JAN.w10k.pi", header = T)
kor_pi <- read.delim("./KOR.w10k.pi", header = T)

cns_pi$POP <- "CNS"
cnn_pi$POP <- "CNN"
jas_pi$POP <- "JAS"
jan_pi$POP <- "JAN"
kor_pi$POP <- "KOR"

pops_pi <- rbind(cns_pi, cnn_pi) |> rbind(jas_pi) |> rbind(jan_pi) |> rbind(kor_pi)

plot <- pops_pi %>%
  ggplot(aes(x = POP, y = PI, fill = POP, color = POP)) +
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
  labs(y = "PI", x = "Population") +
  theme_light()

ggsave(
  file = "PI_ViolinBox.pdf",
  plot = plot,
  width = 7,
  height = 7,
  dpi = 300
)
