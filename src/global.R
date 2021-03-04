library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(shinyhelper)
library(shinyjs)
library(shinycssloaders)
library(shinyBS)
library(plotly)
library(DT)
library(AachenColorPalette) # remotes::install_github("christianholland/AachenColorPalette")
library(forcats)
library(scales)
library(dplyr)
library(tibble)
library(purrr)
library(ggplot2)
library(tidyr)
library(readr)
library(stringr)
library(here)
library(lemon)
library(ggrepel)
library(patchwork)
library(glue)
library(lubridate)
library(cowplot)

theme_set(cowplot::theme_cowplot())

# options(repos = BiocManager::repositories())

# load static data
mm_degs <- readRDS(here("data/mm_degs.rds"))
hs_degs <- readRDS(here("data/hs_degs.rds"))
gene_anno <- readRDS(here("data/gene_anno.rds"))

sc_degs <- readRDS(here("data/sc_degs.rds"))

chronicity <- readRDS(here("data/chronicity_genes.rds"))
consistent <- readRDS(here("data/consistent_genes.rds"))

# construct data containing all studies
all_degs <- bind_rows(
  mm_degs %>%
    mutate(label2 = case_when(
      str_detect(treatment, "CCl4") ~ str_c(
        class, " ", treatment, " (", time_label, ")"
      ),
      TRUE ~ as.character(label2)
    )) %>%
    select(gene, logFC, `t-statistic`, pval, fdr, label = label2),
  hs_degs %>%
    select(gene, logFC, `t-statistic`, pval, fdr, label)
) %>%
  mutate(key = case_when(
    str_detect(label, "Acute|Tun|LPS|APAP|PH|BDL") ~ "Mouse (acute)",
    str_detect(label, "Chronic") ~ "Mouse (chronic)",
    TRUE ~ "Human"
  ))
