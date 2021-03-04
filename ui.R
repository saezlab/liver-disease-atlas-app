source(here::here("src/global.R"))
source(here::here("src/utils.R"))

ui <- dashboardPage(
  dashboardHeader(
    title = "Liver disease atlas",
    # Button pointing to the corresponding publication
    tags$li(
      class = "dropdown", id = "publication",
      tags$a(
        href = "xxx",
        target = "_blank", tags$img(icon("file-text"))
      ),
      bsTooltip("publication", "Go to the publication",
        "bottom",
        options = list(container = "body")
      )
    ),

    # Button pointing to the GitHub respository
    tags$li(
      class = "dropdown", id = "github",
      tags$a(
        href = "https://github.com/saezlab/liver-disease-atlas-app",
        target = "_blank", tags$img(icon("github"))
      ),
      bsTooltip("github", "View the code of this webside on GitHub",
        "bottom",
        options = list(container = "body")
      )
    )
  ),
  dashboardSidebar(
    sidebarMenu(
      # Setting id makes input$tabs give the tabName of currently-selected tab
      id = "tabs",
      menuItem("Home", icon = icon("home"), tabName = "home"),
      menuItem("Gene dashboard",
        tabName = "dashboard",
        icon = icon("dashboard")
      ),
      menuItem("Data", icon = icon("database"), tabName = "data"),
      menuItem("Contact", icon = icon("group"), tabName = "contact")
    ),
    helpText("Version 0.0.0.9000 (2021)",
      style = "padding-left:1em; padding-right:1em; position:fixed; bottom:1em"
    )
  ),

  dashboardBody(
    tags$head(includeScript("google-analytics.js")),
    fluidPage(
      useShinyjs(),
      useShinydashboard(),
      tabItems(
        tabItem(
          "home",
          includeMarkdown(here("inst/home.md")),
          tableOutput("table_mouse_models"),
          tableOutput("table_patient_cohorts")
        ),

        tabItem(
          "dashboard",
          fluidRow(
            column(4, pickerInput(
              inputId = "hs_gene", label = "Select gene(s)",
              choices = sort(unique(hs_degs$gene)), multiple = T,
              options = list(
                `live-search` = TRUE,
                size = 10, `max-options` = 5,
                `actions-box` = TRUE,
                `deselect-all-text` = "Deselect all",
                `select-all-text` = "Don't click here",
                `none-selected-text` = "select a gene..."
              )
            )),
            column(4, pickerInput(
              inputId = "mouse_model",
              label = "Select an acute mouse model",
              choices = c(
                "APAP", "CCl4", "Bile Duct Ligation", "Partial Hepatectomy",
                "LPS", "Tunicamycin"
              )
            )),
            column(4, radioGroupButtons(
              inputId = "gene_level_stat",
              label = "Select gene level statistic",
              choices = list("logFC", "t-statistic"),
              direction = "h"
            ))
          ),
          fluidRow(
            column(4, infoBoxOutput("celltype", width = NULL)),
            column(4, infoBoxOutput("chronicity", width = NULL)),
            column(4, infoBoxOutput("consistency", width = NULL))
          ),
          fluidRow(
            column(
              6,
              box(
                title = span("Chronic mouse model"),
                # background = "white",
                status = "primary",
                solidHeader = TRUE,
                plotlyOutput("chronic_mouse_gene_regulation"),
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
                plotlyOutput("acute_mouse_gene_regulation"),
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
                plotlyOutput("human_gene_regulation"),
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
                plotlyOutput("all_studies_gene_regulation", height = "300px"),
                width = NULL,
                collapsible = TRUE
              )
            )
          )
        ),
        tabItem(
          "data",
          tabsetPanel(
            type = "tabs",
            tabPanel("Human-mouse-consistent genes", DT::dataTableOutput("consistent_table")),
            tabPanel("Chronicity", DT::dataTableOutput("chronicity_table"))
          )
        ),
        tabItem("contact", includeMarkdown(here("inst/contact.md")))
      )
    )
  )
)
