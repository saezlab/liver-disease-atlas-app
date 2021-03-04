plot_hs_gene_regulation <- function(hs_degs, genes, gene_level_stat = "logFC") {
  geom <- list(
    geom_segment(aes(
      x = fct_reorder(disease, .data[[gene_level_stat]]),
      xend = fct_reorder(disease, .data[[gene_level_stat]]),
      y = 0, yend = .data[[gene_level_stat]]
    ), color = "black"),
    geom_point(size = 3)
  )
  # bar chart
  hs_degs %>%
    filter(gene %in% genes) %>%
    ggplot(aes(
      x = fct_reorder(disease, .data[[gene_level_stat]]),
      y = .data[[gene_level_stat]], color = author2,
      label2 = pval, label3 = fdr
    )) +
    geom_hline(yintercept = 0) +
    geom +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
    labs(x = NULL, y = gene_level_stat) +
    facet_rep_grid(gene ~ author2, scales = "free_x") +
    theme(legend.position = "none") +
    my_theme(grid = "y") +
    scale_color_viridis_d()
}

plot_mm_gene_regulation <- function(mm_degs, genes, treatment, class = "Acute",
                                    gene_level_stat = "logFC",
                                    gene_label = FALSE) {
  # translate genes
  mgi_genes <- gene_anno %>%
    filter(hgnc %in% genes) %>%
    pull(mgi)

  # filter limma table for specified variables
  df <- mm_degs %>%
    filter(gene %in% mgi_genes &
      treatment == {{ treatment }} &
      class == {{ class }}) %>%
    add_row(
      gene = mgi_genes,
      time = rep(as.duration(0), length(mgi_genes)),
      logFC = rep(0, length(mgi_genes)),
      `t-statistic` = rep(0, length(mgi_genes))
    )

  # check whether the chosen study is a time series or a static experiment
  if (any(is.na(df$time))) {
    p <- df %>%
      ggplot(aes(
        x = gene, y = .data[[gene_level_stat]], fill = gene,
        label2 = pval, label3 = fdr
      )) +
      geom_hline(yintercept = 0) +
      geom_col() +
      theme(legend.position = "none") +
      labs(x = "Gene")
  } else {
    p <- df %>%
      mutate(label = if_else(time == max(time), as.character(gene),
        NA_character_
      )) %>%
      ggplot(aes(
        x = time, y = .data[[gene_level_stat]], group = gene,
        color = gene, label2 = pval, label3 = fdr
      )) +
      geom_hline(yintercept = 0) +
      geom_point() +
      geom_line() +
      # geom_line(stat = "smooth", method = loess, alpha = 0.5,
      #           show.legend = FALSE) +
      theme(legend.position = "none") +
      labs(y = gene_level_stat) +
      my_theme(grid = "y") +
      scale_color_viridis_d()

    # check whether gene labels should be plotted
    if (gene_label) {
      p <- p + geom_label(aes(label = label), na.rm = TRUE, show.legend = FALSE)
    }
  }
  # Add title and further grobs
  p <- p +
    ggtitle(treatment)
  # ggtitle(str_c(treatment, " (", class, ")"))
  return(p)
}


plot_all_studies_gene_regulation <- function(all_degs, genes, gene_level_stat) {
  gene_mapping <- gene_anno %>%
    filter(hgnc %in% genes) %>%
    rename(gene = mgi)

  all_degs %>%
    filter(gene %in% c(genes, gene_mapping$gene)) %>%
    left_join(gene_mapping, by = "gene") %>%
    mutate(hgnc = coalesce(hgnc, gene)) %>%
    ggplot(aes(
      y = hgnc, x = fct_rev(fct_inorder(label)),
      fill = .data[[gene_level_stat]],
      label2 = pval, label3 = fdr
    )) +
    geom_tile() +
    scale_fill_gradient2(
      low = aachen_color("blue"), mid = "white",
      high = aachen_color("red")
    ) +
    theme(
      axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
      legend.position = "none"
    ) +
    labs(x = NULL, y = NULL) +
    my_theme(grid = "no")
}

get_celltype <- function(gene, adjp_cutoff = 0.05, logfc_cutoff = 0.025) {
  df <- sc_degs %>%
    filter(adj_p <= adjp_cutoff & abs(logFC) >= logfc_cutoff) %>%
    filter(gene %in% {{ gene }})


  if (nrow(df) > 0 & n_distinct(df$gene) == 1) {
    label <- df %>%
      mutate(
        adj_p = signif(adj_p, digits = 3),
        logFC = round(logFC, 3)
      ) %>%
      # mutate(string = glue("{celltype} ({logFC}/{adj_p})")) %>%
      mutate(string = glue("{celltype}")) %>%
      pull(string) %>%
      str_c(collapse = ", ")
  } else {
    label <- "No significant association"
  }

  return(label)
}

get_chronicity <- function(genes) {
  mgi_genes <- gene_anno %>%
    filter(hgnc %in% genes) %>%
    pull(mgi)

  df <- chronicity %>%
    filter(gene %in% mgi_genes)

  if (nrow(df) > 0) {
    label <- df %>%
      mutate(string = glue("{class} (Rank:{rank})")) %>%
      pull(string)
  } else {
    label <- "No chronicity association"
  }

  return(label)
}

get_consistency <- function(genes) {
  df <- consistent %>%
    filter(gene %in% genes)

  if (nrow(df) > 0) {
    label <- df %>%
      mutate(string = glue("Rank: {rank}")) %>%
      pull(string)
  } else {
    label <- "No consistent association"
  }

  return(label)
}


#' Function that defines my custom theme
#'
#' @param grid character indicating whether grid lines should be plotted. Must
#' be either "x", "y", "no" or NULL.
my_theme <- function(grid = NULL, fsize = 11) {
  if (is.null(grid)) {
    p <- cowplot::background_grid(
      major = "xy", minor = "none",
      size.major = 0.4
    )
  } else if (grid == "y") {
    p <- cowplot::background_grid(
      major = "y", minor = "none",
      size.major = 0.4
    )
  } else if (grid == "x") {
    p <- cowplot::background_grid(
      major = "x", minor = "none",
      size.major = 0.4
    )
  } else if (grid == "no") {
    p <- theme()
  }
  p <- p +
    theme(
      title = element_text(size = fsize + 1),
      axis.text = element_text(size = fsize),
      legend.text = element_text(size = fsize),
      legend.title = element_text(size = fsize),
      plot.subtitle = element_text(size = fsize),
      strip.background = element_rect(colour = "white", fill = "white"),
      strip.text = element_text(size = fsize)
    )
}
