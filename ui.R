source(here::here("src/global.R"))
source(here::here("src/utils.R"))

ui <- function(request) {
  fluidPage(
    useShinyjs(),
    useShinydashboard(),
    tags$head(includeScript("google-analytics.js")),
    navbarPage(
      id = "menu", 
      title = div(img(src="logo_saezlab.png", width="25", height="25"),
                  "Liver disease app"),
      windowTitle = "Liver disease app",
      collapsible=T,
      footer = column(12, align="center",
                      "Liver disease atlas app (1.0.1)"),
      
      #### Welcome ####
      tabPanel(
        title = "Welcome",
        icon = icon("home"),
        sidebarPanel(
          includeMarkdown("inst/landingpage_sidebar.md")
        ),
        mainPanel(
          includeMarkdown("inst/landingpage.md")
        )
      ),
      
      #### Select genes ####
      tabPanel(
        title = "Query genes",
        icon = icon("search"),
        sidebarPanel(
          # includeMarkdown("inst/query_genes_sidebar.md"),
          pickerInput(
            inputId = "hs_gene", label = "Select gene(s)",
            choices = sort(unique(hs_degs$gene)), multiple = T,
            options = list(
              `live-search` = TRUE,
              size = 10, `max-options` = 5,
              `actions-box` = TRUE,
              `deselect-all-text` = "Deselect all",
              `select-all-text` = "Don't click here",
              `none-selected-text` = "Select gene(s)..."
            )
          ),
          pickerInput(
            inputId = "mouse_model",
            label = "Select an acute mouse model",
            choices = c(
              "APAP", "CCl4", "Bile Duct Ligation", "Partial Hepatectomy",
              "LPS", "Tunicamycin"
            )
          ),
          radioGroupButtons(
            inputId = "gene_level_stat",
            label = "Select gene level statistic",
            choices = list("logFC", "t-statistic"),
            direction = "h"
          )
        ),
        mainPanel(
          fluidRow(
            column(4, infoBoxOutput("celltype", width = NULL) %>%
                     helper(icon = "question",
                            size= "m",
                            colour = "white",
                            type = "markdown",
                            content = "celltype",
                            fade = TRUE)),
            column(4, infoBoxOutput("chronicity", width = NULL) %>%
                     helper(icon = "question",
                            size= "m",
                            colour = "white",
                            type = "markdown",
                            content = "chronicity",
                            fade = TRUE)),
            column(4, infoBoxOutput("consistency", width = NULL) %>%
                     helper(icon = "question",
                            size= "m",
                            colour = "white",
                            type = "markdown",
                            content = "consistency",
                            fade = TRUE))
          ),
          fluidRow(
            column(
              6,
              box(
                title = span("Chronic mouse model"),
                # background = "white",
                status = "primary",
                solidHeader = TRUE,
                plotlyOutput("chronic_mouse_gene_regulation") %>% withSpinner(),
                width = NULL,
                collapsible = TRUE
              )
            ),
            column(
              6,
              box(
                title = "Acute mouse model",
                # background = "white",
                status = "primary",
                solidHeader = TRUE,
                plotlyOutput("acute_mouse_gene_regulation") %>% withSpinner(),
                width = NULL,
                collapsible = TRUE
              )
            )
          ),
          fluidRow(
            column(
              12,
              box(
                title = "Regulation in humans",
                # background = "white",
                status = "primary",
                solidHeader = TRUE,
                plotlyOutput("human_gene_regulation") %>% withSpinner(),
                width = NULL,
                collapsible = TRUE
              )
            )
          ),
          fluidRow(
            column(
              12,
              box(
                title = "Regulation overview",
                # background = "white",
                status = "primary",
                solidHeader = TRUE,
                plotlyOutput("all_studies_gene_regulation", height = "300px") %>%
                  withSpinner(),
                width = NULL,
                collapsible = TRUE
              )
            )
          )
        )
      ),
      tabPanel(
        title = "Data",
        icon = icon("database"),
        sidebarPanel(
          includeMarkdown("inst/data_sidebar.md")
        ),
        mainPanel(
          tabsetPanel(
            type = "tabs",
            tabPanel("Human-mouse-consistent genes", 
                     DT::dataTableOutput("consistent_table")),
            tabPanel("Chronicity", DT::dataTableOutput("chronicity_table"))
          )
        )
      )
    )
  )
}
