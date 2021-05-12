library(cowplot)
library(ggplot2)
module_pathways <- read.csv("./data/pathways/module_red_pathways.csv",
                         sep = ",", stringsAsFactors = F)
module_pathways <- module_pathways[,c(1,2)]
colnames(module_pathways) <- c("pathway", "pval")
module_pathways$pval <- -log(module_pathways$pval)

colors <- RColorBrewer::brewer.pal(n = 9, name = "Blues")[c(1,3)]


ggplot(module_pathways, aes(x = pval, y = reorder(pathway, pval))) +
  geom_bar(aes(pval, fill = pval), stat = "identity") +
  geom_text(aes(x = 0, label=pathway),
            hjust = "left",
            size = 7) +
  xlab("-log(pvalue)") + ylab("") +
  scale_fill_gradient2(name = "-log(pvalue)",
                       low = colors[1], 
                       high = colors[2], n.breaks = 4) +
  theme_cowplot() +
  theme(strip.background = element_blank(),
        legend.position = "bottom",
        axis.text = element_blank(),
        axis.line = element_blank(),
        axis.ticks = element_blank(), axis.title = element_blank()
  )
