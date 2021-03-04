server <- function(input, output, session) {
  
  # load tables of  mouse models and patient cohorts
  output$table_mouse_models <- renderTable({     
    readr::read_csv2(here("data/mouse_models.csv")) %>%
      mutate(N = as.integer(N))
  })
  
  output$table_patient_cohorts <- renderTable({     
    readr::read_csv2(here("data/patient_cohorts.csv")) %>%
      mutate(N = as.integer(N))
  })
  
  output$consistent_table = renderDT({
    consistent %>%
      select(rank, gene) %>%
      mutate(gene = as_factor(gene)) %>%
      DT::datatable(filter = "top",
                  extensions = "Buttons", rownames = F)
  })
  
  output$chronicity_table = renderDT({
    chronicity %>%
      select(rank, gene, class) %>%
      mutate(class = as_factor(class),
             gene = as_factor(gene)) %>%
      DT::datatable(filter = "top",
                    extensions = "Buttons", rownames = F)
  })
  
  

  # get min max value
  min_max <- reactive({
    mgi_genes <- gene_anno %>%
      filter(hgnc %in% input$hs_gene) %>%
      pull(mgi)

    ranges <- all_degs %>%
      filter(gene %in% c(mgi_genes, input$hs_gene)) %>%
      select(gene, input$gene_level_stat) %>%
      pull(input$gene_level_stat) %>%
      range()

    return(ranges)
  })

  # gene regulation of chronic mouse model
  output$chronic_mouse_gene_regulation <- renderPlotly({
    if (!is.null(input$hs_gene)) {
      plot_mm_gene_regulation(mm_degs,
        genes = input$hs_gene,
        treatment = "CCl4",
        gene_level_stat = input$gene_level_stat,
        class = "Chronic", gene_label = TRUE
      ) +
        scale_x_time(
          breaks = c(0, 5259600, 15778800, 31557600),
          labels = c(0, 2, 6, 12), name = "Time in Months"
        ) +
        ylim(min_max()[1], min_max()[2])
    }
  })

  # gene regulation of selected acute mouse model
  output$acute_mouse_gene_regulation <- renderPlotly({
    if (!is.null(input$hs_gene)) {
      if (input$mouse_model %in% c("LPS", "Tunicamycin")) {
        xlabels <- NULL
      } else {
        xlabels <- scale_x_time(
          breaks = seq(0, 365 * 24 * 3600, 120 * 3600),
          labels = seq(0, 365, 5), name = "Time in Days"
        )
      }

      p <- plot_mm_gene_regulation(mm_degs,
        genes = input$hs_gene,
        treatment = input$mouse_model,
        gene_level_stat = input$gene_level_stat,
        class = "Acute", gene_label = TRUE
      ) +
        xlabels +
        ylim(min_max()[1], min_max()[2])
    }
  })

  # gene regulation of all patient cohorts
  output$human_gene_regulation <- renderPlotly({
    if (!is.null(input$hs_gene)) {
      plot_hs_gene_regulation(hs_degs,
        genes = input$hs_gene,
        gene_level_stat = input$gene_level_stat
      ) +
        ylim(min_max()[1], min_max()[2])
    }
  })

  # gene regulation of all study summarized in a single plot
  output$all_studies_gene_regulation <- renderPlotly({
    if (!is.null(input$hs_gene)) {
      plot_all_studies_gene_regulation(
        all_degs,
        genes = input$hs_gene,
        gene_level_stat = input$gene_level_stat
      ) +
        coord_fixed()
    }
  })


  output$celltype <- renderInfoBox({
    if (!is.null(input$hs_gene)) {
      if (n_distinct(input$hs_gene) == 1) {
        c <- get_celltype(input$hs_gene)
      } else if (n_distinct(input$hs_gene) > 1) {
        c <- "Please select only a single gene"
      }
    } else {
      c <- "Please select a gene..."
    }
    infoBox(
      "Celltype", str_wrap(c, 20),
      color = "purple", icon = icon("sun"), fill = TRUE
    )
  })

  output$chronicity <- renderInfoBox({
    if (!is.null(input$hs_gene)) {
      if (n_distinct(input$hs_gene) == 1) {
        c <- get_chronicity(input$hs_gene)
      } else if (n_distinct(input$hs_gene) > 1) {
        c <- "Please select only a single gene"
      }
    } else {
      c <- "Please select a gene..."
    }
    infoBox(
      "Chronicity", str_wrap(c, 20),
      color = "orange", icon = icon("hourglass-end"), fill = TRUE
    )
  })

  output$consistency <- renderInfoBox({
    if (!is.null(input$hs_gene)) {
      if (n_distinct(input$hs_gene) == 1) {
        c <- get_consistency(input$hs_gene)
      } else if (n_distinct(input$hs_gene) > 1) {
        c <- "Please select only a single gene"
      }
    } else {
      c <- "Please select a gene..."
    }
    infoBox(
      "Consistency", str_wrap(c, 20),
      color = "maroon", icon = icon("user-md"), fill = TRUE
    )
  })

  addClass(selector = "body", class = "sidebar-collapse")
  hide("loading-content", TRUE, "fade")
}
