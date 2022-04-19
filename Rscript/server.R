library(data.table)
library(shiny)
library(tidyverse)
library(DT)


general = fread("/Users/hayoungkim/Desktop/Masters_SEM2/Biological Databases/Own_Project/Data/Plant_categories/newheight_edible.csv")
detail = fread("/Users/hayoungkim/Desktop/Masters_SEM2/Biological Databases/Own_Project/Data/Detailed_plant_categories/edible_fruits_and_nuts/FINAL_detailededible.csv")

detail = as_data_frame(detail)

shinyServer(function(input, output, session) {
  
  vals = reactiveValues()
  vals$Data = general
  
  output$mytable <- DT::renderDataTable({
    
    DT::datatable(vals$Data, escape = FALSE, rownames = FALSE, options = list(
      pageLength = 10
    )) 
  })
  
  
  
  
  observeEvent(input$hardiness_zone,{
    if (input$hardiness_zone != '') {
    x = isolate(vals$Data)
    selected <- reactive(stringr::str_detect(x$PlantZone, table_hardiness[table_hardiness$location==input$hardiness_zone,]$hardiness_zone))
    x = x[selected(),]
    vals$Data = x }
  })
  
  observeEvent(input$sun_exposure,{
    if (input$sun_exposure != '') {
    x = isolate(vals$Data)
    selected2 <- reactive(stringr::str_detect(x$PlantSunlight, input$sun_exposure))
    x = x[selected2(),]
    vals$Data = x }
  })
  
  observeEvent(input$avg_height,{
    x = isolate(vals$Data)
    selected3 <- reactive(x$`PlantHeight(m)` <= input$avg_height)
    x = x[selected3(),]
    vals$Data = x
  })
  
  observeEvent(input$delete_row,{
    x = isolate(vals$Data)
    x = x[-input$mytable_rows_selected,]
    vals$Data = x
  })
  
  
  observeEvent(input$show_all,{

    updateSelectInput(session, "hardiness_zone",
                      label = "LOCATION (hardiness zone)",
                      choices = c("",table_hardiness$location)
    )
    
    updateSelectInput(session, "sun_exposure",
                label = "SUN EXPOSURE", 
                choices = c("", "Full Sun", "Sun to Partial Shade", "Light Shade")
    )

    updateSliderInput(session, "avg_height",
                label = "MAX ACCEPTABLE HEIGHT (m)",
                min = 0.10, max = 12.50,
                value = 12.50)
    
    vals$Data= general
  })
  
  selected_ids = reactive({
    x = isolate(vals$Data)
    x = x[input$mytable_rows_all,]
    x$generalID
  })
  
  selected_data = reactive({
    detail %>% filter(`generalID` %in% selected_ids())
  })
  
  
  output$downloadData <- downloadHandler(
    filename = paste("Data_for_selected_ids",Sys.Date(), ".csv", sep=""),
    content = function(file) {
      write.csv(selected_data(), file, row.names = FALSE)
    }
  )
  
  local_df = reactive({
    
    mydata = selected_data()
    
  })
  
  output$selected_table = DT::renderDataTable(local_df())
  
  
  
  output$zoneplot <- renderPlot({
    
    #Render a barplot
    xx <- barplot(c(0, 19, 174, 748, 917, 977, 1113, 1129, 513, 334, 207), 
                  names.arg =c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
                  ylim = c(0,1300),
                  ylab="Number of Plants Information",
                  xlab="Hardiness Zone")
    
    
    ## Add text at top of bars
    text(x = xx, y = c(0, 19, 174, 748, 917, 977, 1113, 1129, 513, 334, 207), label = c(0, 19, 174, 748, 917, 977, 1113, 1129, 513, 334, 207), pos = 3, cex = 0.9, col = "red")
    
  })
})