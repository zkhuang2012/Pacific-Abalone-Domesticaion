library(ggplot2)
library(tidyverse)
library(ggpubr)

### 1. Northern_Southern1
# 1. Data
file_path = "./02.ABT_Northern_Southern1.txt"
data <- read.table(
	file = file_path,
	header = TRUE,
	sep = "\t",
	stringsAsFactors = F
)

set.seed(123)

data$Population <- factor(data$Population, levels = c("Northern", "Southern1"))

# 2. Parameters
Fill_Northern <- "#005588CC"
Colour_Northern <- "#005588"
Fill_Southern1 <- "#EE0000CC"
Colour_Southern1 <- "#EE0000"

# 3. Plot
p <- ggplot(data,
			aes(
				x = Population,
				y = ABT,
				fill = Population,
				color = Population
			)) +
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
		width = 0.8,
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
		outlier.size = 1.0,
		outlier.stroke = 0,
		outlier.alpha = 0.5,
		notch = FALSE,
		notchwidth = 0.5,
		staplewidth = 0,
		varwidth = FALSE,
		na.rm = TRUE,
		orientation = "x",
		show.legend = FALSE,
		inherit.aes = TRUE,
		width = 0.3,
		fill = "white",
		color = "black",
		alpha = 1.0,
		linewidth = 1
	) +
	geom_jitter(
		position = position_jitterdodge(jitter.width = 0.3, dodge.width = 0.5),
		na.rm = TRUE,
		show.legend = FALSE,
		inherit.aes = TRUE,
		size = 3,
		alpha = 0.8,
		stroke = 0
	) +
	stat_compare_means(
		aes(label = ..p.format..),
		method = "t.test",
		comparisons = list(c("Southern1", "Northern")),
		label.y = max(data$ABT),
		bracket.size = 1,
		na.rm = TRUE,
		show.legend = FALSE,
		inherit.aes = TRUE
	) +
	ylim(26, 34) +
	scale_fill_manual(
		values = c("Northern" = Fill_Northern, "Southern1" = Fill_Southern1),
		guide = guide_legend(),
		aesthetics = c("fill")
	) +
	scale_colour_manual(
		values = c("Northern" = Colour_Northern, "Southern1" = Colour_Southern1),
		guide = guide_legend(),
		aesthetics = c("colour")
	) +
	labs(x = "Population", y = "ABT (°C)") +
	theme_light()

# 4. Save
pdf_name = "02.ABT_Northern_Southern1.pdf"
jpeg_name = "02.ABT_Northern_Southern1.jpeg"
device_pdf = "pdf"
device_jpeg = "jpeg" # "pdf", "jpeg", "tiff", "png", "bmp", "svg"
width = 9.0
height = 7.0
units = "in" # "in", "cm", "mm", "px"
dpi <- 600

ggsave(
	filename = pdf_name,
	plot = p,
	device = device_pdf,
	path = NULL,
	scale = 1,
	width = width,
	height = height,
	units = units,
	dpi = dpi,
	limitsize = TRUE
)
ggsave(
	filename = jpeg_name,
	plot = p,
	device = device_jpeg,
	path = NULL,
	scale = 1,
	width = width,
	height = height,
	units = units,
	dpi = dpi,
	limitsize = TRUE
)
