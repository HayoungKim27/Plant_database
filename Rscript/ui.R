library(shiny)
library(shinydashboard)
library(shinyBS)
library(DT)

ui <- navbarPage(
  title = "Plants Database",
  tabPanel("Which edible fruits or nuts to grow?",
           #titlePanel("Step 1: Select filters"),
           h3(strong("> Step 1: Select filters"), style="color:#0000ff;font-size:200%"),
           sidebarLayout(
             sidebarPanel(id="sidebar",
                          selectInput("hardiness_zone",
                                      label = "LOCATION (hardiness zone)", 
                                      choices =  c("",table_hardiness$location)
                          ),
                          id="sidebar",
                          selectInput("sun_exposure",
                                      label = "SUN EXPOSURE", 
                                      choices = c("", "Full Sun", "Sun to Partial Shade", "Light Shade")
                          ),
                          id = "sidebar",
                          sliderInput("avg_height",
                                      label = "MAX ACCEPTABLE HEIGHT (m)",
                                      min = 0.10, max = 12.50,
                                      value = 12.50)
             )
             ,
             mainPanel(
               h3(strong("> Step 2: Select rows"), style="color:#0000ff;font-size:200%"),
               hr(),
               helpText("Select rows to hide or check details. You can select them by clicking on them.",
                        style="font-size:100%"),
               dataTableOutput("mytable"),
               
             )
             
           ),
           
           box(width=12,
               br(),
               column(6,offset = 6,
                      
                      column(2, 
                             actionButton("delete_row", "Hide", style="text-align:center;color:#cc3300; font-size:120%")),
                      bsTooltip("delete_row", "Hides the selected row(s). To select any row, click on it.",
                                "right", options = list(container = "body")),
                      helpText("You can select rows by clicking on them.",
                               br(),
                              "After you select a couple of rows, you can hide the selected plants by clicking the 'Hide' button",
                               style="font-size:100%"),
                      br(),
                      hr(),
                      hr(),
                      h3(strong("> Step 3: Check detailed information of the selected plants"), style="text-align:center;color:#0000ff;font-size:200%"),
                      hr(),
                      
                      helpText("You can select rows by clicking on them. After you select a couple of rows, you can check the detailed information of the selected plants by clicking the 'Check Details' button",
                               style="text-align:center;font-size:100%"),
                      
                      column(2, 
                             actionButton("compare", "Check Details", style="text-align:center;color: #0000ff; font-size:120%")),
                      bsTooltip("compare", "Shows details of the selected plants.",
                                "right", options = list(container = "body")),
                      column(2, 
                             actionButton("show_all", "Restart from Step 1", style="text-align:center;color:#996600; font-size:120%")),
                      bsTooltip("show_all", "To restart from Step 1, click on it.",
                                "right", options = list(container = "body"))), 
               br(),
               br(),
               br(),
           ),
           br(),
           
           br(),
           
           bsModal("modalExample", strong("> Step 4: Check details of the selected plants and download the data", style="color:#0000ff; font-size:140%"), "compare", size = "large",
                   
                   
                   
                   hr(),
                   
                   DT::dataTableOutput("selected_table"),
                   br(),
                   hr(),
                   div(style="display: inline-block;vertical-align:top; width: 200px;", 
                       downloadButton('downloadData', 'Download Data', style="color:#0000ff; font-size:120%"),
                       bsTooltip("downloadData", "You can click this if you want to download the data for the selected nation(s).",
                                 "right", options = list(container = "body"))
                   )),
           
           br(),
           br()
  ),
  tabPanel("Summary of the dataset",
           h3(strong("> Source of the dataset"), style="color:#0000ff;font-size:200%"),
           helpText("Plantmaps(Hardiness) - Hardiness Zone Maps and Much More. (n.d.-b). Plantmaps. Retrieved April 26, 2021, from https://www.plantmaps.com/index.php",
                    style="font-size:130%;font-style: italic"),
           helpText("Tips and Advice on Outdoor Gardening, Flower Gardens, Plants, & Seeds - Dave’s Garden. (n.d.). Tips and Advice on Plants. Retrieved April 27, 2021, from https://davesgarden.com/",
                    style="font-size:130%;font-style: italic"),
           helpText("-All datasets were produced by Web Crawler.-",
                    style="font-size:150%;font=3"),
           hr(),
           h3(strong("> Distribution of the dataset"), style="color:#0000ff;font-size:200%"),
           helpText("('The number of plants info.' by 'Hardiness zone')",
                    style="font-size:150%"),
           
           mainPanel(
             plotOutput("zoneplot")
           )
  )
)
