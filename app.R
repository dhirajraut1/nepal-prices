#loading libraries
library(shiny)
library(shinydashboard)
library(rvest)

fuel <- read_html("http://noc.org.np/")

petrol_price <- fuel %>% 
  html_nodes(xpath = '//*[@id="s1"]') %>% 
  html_text()

diesel_price <- fuel %>% 
  html_nodes(xpath = '//*[@id="d1"][position()=1]') %>% 
  html_text()

lpg_price <- read_html('http://noc.org.np/retailprice') %>% 
  html_nodes(xpath = '/html/body/div[2]/div/div[1]/div/table/tbody/tr[1]/td[6]') %>% 
  html_text()

fuel_date <- read_html('http://noc.org.np/retailprice') %>% 
  html_nodes(xpath = '/html/body/div[2]/div/div[1]/div/table/tbody/tr[1]/td[1]') %>% 
  html_text()

#------------veg------------
veg_table <- read_html("https://ramropatro.com/vegetable") %>% 
  html_node(xpath = '//*[@id="commodityDailyPrice"]') %>% 
  html_table()

veg_date <- read_html("https://ramropatro.com/vegetable") %>% 
  html_node(xpath = '//*[@id="vtitle"]') %>% 
  html_text()


#-------------smartphone----------
mobile_prices<-read_html("https://www.gadgetbytenepal.com/category/mobile-price-in-nepal/")

#-----------samsung
samsung_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[1]') %>% 
  html_table()

#-----------iphone
iphone_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[2]') %>% 
  html_table()

#-----------xiaomi
xiaomi_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[3]') %>% 
  html_table()

#-----------poco
poco_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[4]') %>% 
  html_table()

#-----------realme
realme_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[5]') %>% 
  html_table()

#-----------oneplus
oneplus_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[6]') %>% 
  html_table()

#-----------vivo
vivo_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[7]') %>% 
  html_table()

#-----------oppo
oppo_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[8]') %>% 
  html_table()

#-----------nokia
nokia_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[9]') %>% 
  html_table()

#-----------infinix
infinix_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/div[1]/table') %>% 
  html_table()

#-----------motorola
motorola_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[10]') %>% 
  html_table()

#-----------micromax
micromax_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[11]') %>% 
  html_table()

#-----------tecno
tecno_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[12]') %>% 
  html_table()

#-----------symphony
symphony_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[13]') %>% 
  html_table()

#-----------coolpad
coolpad_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[14]') %>% 
  html_table()

#-----------lava
lava_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/table[15]') %>% 
  html_table()

#-----------itel
itel_table <- mobile_prices %>% 
  html_node(xpath = '/html/body/div[8]/div[3]/div/div/div/div[2]/div[3]/table') %>% 
  html_table()


#--------web app part---------

ui <- dashboardPage(
  dashboardHeader(title = "Nepal Prices"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Fuel Price", tabName = "fuel", icon = icon("gas-pump")),
      menuItem("Vegetables", tabName = "vegetables", icon = icon("carrot")),
      menuItem("Smartphones", tabName = "mobiles", icon = icon("mobile"))
    )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "mobiles",
              tabBox(height = "100%", width = "100%",
                tabPanel("Samsung",DT::DTOutput('samsung')),
                tabPanel("iPhone", DT::DTOutput('iphone')),
                tabPanel("Xiaomi", DT::DTOutput('xiaomi')),
                tabPanel("Poco", DT::DTOutput('poco')),
                tabPanel("Realme", DT::DTOutput('realme')),
                tabPanel("OnePlus", DT::DTOutput('oneplus')),
                tabPanel("Vivo", DT::DTOutput('vivo')),
                tabPanel("Oppo", DT::DTOutput('oppo')),
                tabPanel("Nokia", DT::DTOutput('nokia')),
                tabPanel("Infinix", DT::DTOutput('infinix')),
                tabPanel("Motorola", DT::DTOutput('motorola')),
                tabPanel("Micromax", DT::DTOutput('micromax')),
                tabPanel("Tecno", DT::DTOutput('tecno')),
                tabPanel("Symphony", DT::DTOutput('symphony')),
                tabPanel("Coolpad", DT::DTOutput('coolpad')),
                tabPanel("Lava", DT::DTOutput('lava')),
                tabPanel("Itel", DT::DTOutput('itel')),
              )
        ),
      
      # Second tab content
      tabItem(tabName = "vegetables",
              h2("Vegetables Price"),
              paste(veg_date),
              DT::DTOutput('veg')
              ),
      
      # third tab content
      tabItem(tabName = "fuel",
            fluidRow(
                # A static valueBox
                h2("Fuel Prices"),
                h4("Effective from: ", fuel_date),
                valueBox(round(as.numeric(petrol_price)), "Petrol", icon = icon("gas-pump"), color ="purple"),
                valueBox(round(as.numeric(diesel_price)), "Diesel", icon = icon("oil-can")),
                valueBox(round(as.numeric(lpg_price)), "LP Gas", icon = icon("burn"), color ="orange"),
              ),
        )
      )
    )
  )

server <- function(input, output) {
  output$veg <- DT::renderDT({
    veg_table
  })
  
  output$samsung <-DT::renderDT({
    samsung_table
  })
  
  output$iphone <- DT::renderDT({
    iphone_table
  })
  
  output$xiaomi <- DT::renderDT({
    xiaomi_table
  })
  
  output$poco <- DT::renderDT({
    poco_table
  })
  
  output$realme <- DT::renderDT({
    realme_table
  })
  
  output$oneplus <- DT::renderDT({
    oneplus_table
  })
  
  output$vivo <- DT::renderDT({
    vivo_table
  })
  
  output$oppo <- DT::renderDT({
    oppo_table
  })
  
  output$nokia <- DT::renderDT({
    nokia_table
  })
  
  output$infinix <- DT::renderDT({
    infinix_table
  })
  
  output$motorola <- DT::renderDT({
    motorola_table
  })
  
  output$micromax <- DT::renderDT({
    micromax_table
  })
  
  output$tecno <- DT::renderDT({
    tecno_table
  })
  
  output$symphony <- DT::renderDT({
    symphony_table
  })
  
  output$lava<- DT::renderDT({
    lava_table
  })
  
  output$coolpad <- DT::renderDT({
    coolpad_table
  })
  
  output$itel <- DT::renderDT({
    itel_table
  })
}

shinyApp(ui, server)