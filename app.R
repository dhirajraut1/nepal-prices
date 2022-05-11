#loading libraries
library(shiny)
library(shinydashboard)
library(rvest)
library(tidyverse)
# library(dplyr)
library(stringr)



#---------------------- For  Fuel -----------------------#
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


#---------------------- For  Vegetables -----------------------#
veg_table <- read_html("https://ramropatro.com/vegetable") %>% 
  html_node(xpath = '//*[@id="commodityDailyPrice"]') %>% 
  html_table()

veg_date <- read_html("https://ramropatro.com/vegetable") %>% 
  html_node(xpath = '//*[@id="vtitle"]') %>% 
  html_text()


#---------------------- For  Smartphone -----------------------#
mobile_prices<-read_html("https://www.gadgetbytenepal.com/category/mobile-price-in-nepal/")

#-----------samsung
samsung_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[1]') %>% 
  html_table()

#-----------iphone
iphone_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[2]') %>% 
  html_table()

#-----------xiaomi
xiaomi_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[3]') %>% 
  html_table()

#-----------poco
poco_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[4]') %>% 
  html_table()

#-----------realme
realme_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[5]') %>% 
  html_table()

#-----------oneplus
oneplus_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[6]') %>% 
  html_table()

#-----------vivo
vivo_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[7]') %>% 
  html_table()

#-----------oppo
oppo_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[8]') %>% 
  html_table()

#-----------nokia
nokia_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[9]') %>% 
  html_table()

#-----------infinix
infinix_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/div[1]/table') %>% 
  html_table()

#-----------motorola
motorola_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[10]') %>% 
  html_table()

#-----------micromax
micromax_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[11]') %>% 
  html_table()

#-----------tecno
tecno_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[12]') %>% 
  html_table()

#-----------symphony
symphony_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[13]') %>% 
  html_table()

#-----------coolpad
coolpad_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[14]') %>% 
  html_table()

#-----------lava
lava_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/table[15]') %>% 
  html_table()

#-----------itel
itel_table <- mobile_prices %>% 
  html_node(xpath = '//*[@id="td-outer-wrap"]/div[3]/div/div/div/div[2]/div[3]/table') %>% 
  html_table()

#---------------------- Valley Items -----------------------#

item_price <- read_html("https://www.valleycoldstore.com.np/shop#chicken")%>%
  html_nodes("p.item-price > span > strong") %>%
  html_text()

valley_items <-read_html("https://www.valleycoldstore.com.np/shop#chicken") %>% 
  html_nodes("p.item-title > a") %>% 
  html_text()

valley_list <- as.data.frame(cbind(valley_items,item_price))

#---------------------- Bike Items -----------------------#
#-----------bajaj
bajaj_price <- read_html("https://nepal.globalbajaj.com/en/blog/bajaj-bike-price-list-in-nepal") %>% 
  html_node(xpath = '//*[@id="bajaj"]/div[3]/div/div[2]/div[2]/div[1]/div/div/table') %>% 
  html_table()
bajaj_price <- bajaj_price %>% select("Bike Model", "Price"= "Updated Bike Price")

#-----------Yamaha
yamaha_bikes_name <- read_html("https://www.yamaha.com.np/motorcycle/?orderby=price") %>% 
  html_nodes("div.title-price-wrap > h5 > a") %>% 
  html_text()

yamaha_bikes_price <- read_html("https://www.yamaha.com.np/motorcycle/?orderby=price") %>% 
  html_nodes('bdi') %>% 
  html_text()

yamaha_price <- tibble(yamaha_bikes_name, yamaha_bikes_price)


#-----------TVS
tvs_bikes_name <- read_html("https://tvsnepal.com/shop") %>% 
  html_nodes(".product-title-spreed h4") %>% 
  html_text()

tvs_bikes_price <- read_html("https://tvsnepal.com/shop") %>% 
  html_nodes('.product-title-spreed h6') %>% 
  html_text()

tvs_price <- tibble(tvs_bikes_name,tvs_bikes_price)
tvs_price <- tvs_price %>% 
  mutate(tvs_bikes_price = str_replace(tvs_bikes_price,"Price: ","Rs. "))

#-----------hero
hero_price <- read_html("https://techlekh.com/hero-bikes-price-nepal/") %>% 
  html_node(xpath = '//*[@id="post-12003"]/div[2]/div[5]/table') %>% 
  html_table()


#-----------suzuki
suzuki_price <- read_html("https://techlekh.com/suzuki-bikes-price-nepal/") %>% 
  html_node("#post-12328 > div.entry-content.wrap.clearfix > div:nth-child(12) > table") %>% 
  html_table()


#-----------ktm
ktm_price <- read_html("https://techlekh.com/ktm-bikes-price-nepal/") %>% 
  html_node("#post-12363 > div.entry-content.wrap.clearfix > div:nth-child(10) > table") %>% 
  html_table()

#---------------------- Grocery Items -----------------------#
read_category <- function(category){
  link <- paste0("https://www.himalmart.com/category/",category,"/")
  item<- read_html(link) %>% 
    html_nodes('.product_name') %>% 
    html_text()
  
  price <- read_html(link)%>% 
    html_nodes("span.og-price") %>% 
    html_text()
  
  product <- tibble(item , price)
  product <- product %>% 
    mutate(price = str_replace(price,"à¤°à¥‚ ",""))
  
  product
  
}

#-----------Cooking Oil and Ghee
# oil_table <- read_category("cooking-oil-and-ghee")

#-----------Pulses
# dal_table <- read_category("dals-and-pulses")

#-----------Salt and Sugar
# salt_table <- read_category("salt-and-sugar")

#-----------Rice and Rice Products
rice_table <- read_category("rice-and-rice-products")

#-----------Snacks
snacks_table <- read_category("snacks")

#-----------Baking and Cooking
# baking_table <- read_category("baking-and-cooking")

#-----------Dairy
dairy_table <- read_category("dairy-products")

#-----------Beverage
beverage_table <- read_category("beverage")


#---------------------- Web App Start -----------------------#

ui <- dashboardPage(skin = "green",
  dashboardHeader(title = "Nepal Prices"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Fuel Price", tabName = "fuel", icon = icon("gas-pump")),
      menuItem("Vegetables", tabName = "vegetables", icon = icon("carrot")),
      menuItem("Smartphones", tabName = "mobiles", icon = icon("mobile")),
      menuItem("Non-Veg", tabName = "non_veg", icon = icon("drumstick-bite")),
      menuItem("Grocery", tabName = "grocery", icon = icon("shopping-basket")),
      menuItem("Bikes", tabName = "bikes", icon = icon("motorcycle"))
      
    )
  ),
  ## Body content
  dashboardBody(
tags$style("@import url(https://use.fontawesome.com/releases/v5.7.2/css/all.css);"),
    tabItems(
      # Fuel tab content
      tabItem(tabName = "fuel",
              h2("Fuel Prices"),
              h4("Effective from: ", fuel_date),
              fluidRow(
                valueBox(round(as.numeric(petrol_price)), "Petrol", icon = icon("gas-pump"), color ="purple"),
                valueBox(round(as.numeric(diesel_price)), "Diesel", icon = icon("oil-can")),
                valueBox(round(as.numeric(lpg_price)), "LP Gas", icon = icon("burn"), color ="orange"),
              )
      ),
      # vegetable tab content
      tabItem(tabName = "vegetables",
              h2("Vegetables Price"),
              paste(veg_date),
              DT::DTOutput('veg')
              ),
      
      # mobile tab content
      tabItem(tabName = "mobiles",
              h2("Smartphone Prices"),
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
      
      # non-veg tab content
      tabItem(tabName = "non_veg",
              h2("Meat Price"),
              DT::DTOutput('valley')
      ),
      
      # grocery tab content
      tabItem(tabName = "grocery",
              tabBox(height = "100%", width = "100%",
                     # tabPanel("Cooking Oil and Ghee",DT::DTOutput('oil')),
                     # tabPanel("Dal and Pulses", DT::DTOutput('dal')),
                     # tabPanel("Salt and Sugar", DT::DTOutput('salt')),
                     tabPanel("Rice", DT::DTOutput('rice')),
                     tabPanel("Snacks", DT::DTOutput('snacks')),
                     # tabPanel("Baking and Cooking ", DT::DTOutput('baking')),
                     tabPanel("Dairy", DT::DTOutput('dairy')),
                     tabPanel("Beverage", DT::DTOutput('beverage'))
              )
      ),
      # mobiles tab content
      tabItem(tabName = "bikes",
              h2("Bike Prices"),
              tabBox(height = "100%", width = "100%",
                     tabPanel("Bajaj",DT::DTOutput('bajaj')),
                     tabPanel("Yamaha", DT::DTOutput('yamaha')),
                     tabPanel("TVS", DT::DTOutput('tvs')),
                     tabPanel("Suzuki", DT::DTOutput('suzuki')),
                     tabPanel("KTM", DT::DTOutput('ktm'))
              )
         )
      )
    )
  )

server <- function(input, output) {

  #vegetable render
    output$veg <- DT::renderDT({
    veg_table
  })
  
    #mobiles table render
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
  
  #----------valley item-------
  output$valley <- DT::renderDT({
    valley_list
  })
  
  #----------bikes render------
  output$bajaj <- DT::renderDT({
    bajaj_price
  })
  
  output$yamaha <- DT::renderDT({
    yamaha_price
  })
  
  output$tvs <- DT::renderDT({
    tvs_price
  })
  
  output$hero <- DT::renderDT({
    hero_price
  })
  
  output$suzuki <- DT::renderDT({
    suzuki_price
  })
  
  output$ktm <- DT::renderDT({
    ktm_price
  })
  
  #------------grocery
  
  # output$oil <- DT::renderDT({
  #   oil_table
  # })
  
  # output$dal <- DT::renderDT({
  #   dal_table
  # })
  
  # output$salt <- DT::renderDT({
  #   salt_table
  # })
  # 
  output$rice <- DT::renderDT({
    rice_table
  })
  
  output$snacks <- DT::renderDT({
    snacks_table
  })
  
  # output$baking <- DT::renderDT({
  #   baking_table
  # })
  
  output$dairy <- DT::renderDT({
    dairy_table
  })
  
  output$beverage <- DT::renderDT({
    beverage_table
  })
  
}

shinyApp(ui, server)
