message('Loading Packages')
library(rvest)
library(tidyverse)
library(mongolite)
library(httr)

message('Scraping Data')


url_liga <-"https://ligaindonesiabaru.com/table/index/BRI_LIGA_1_2022-2023"
page_liga<-read_html(url_liga)

team <- page_liga %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "noborder", " " ))]//a') %>% 
  html_text() %>% 
  gsub("\n", "", .)
team<-as.vector(team)
team

menang <- page_liga %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "text-center", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "noborder", " " )) and (((count(preceding-sibling::*) + 1) = 4) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .)
menang<-(as.vector(as.numeric(menang)))
menang

seri<-page_liga %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "text-center", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "noborder", " " )) and (((count(preceding-sibling::*) + 1) = 5) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .)
seri<-as.vector(as.numeric(seri))
seri

kalah<-page_liga %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "text-center", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "noborder", " " )) and (((count(preceding-sibling::*) + 1) = 6) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .)
kalah<-as.vector(as.numeric(kalah))

GF<-page_liga %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "text-center", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "noborder", " " )) and (((count(preceding-sibling::*) + 1) = 7) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .)
GF<-as.vector(as.numeric(GF))

GA<-page_liga %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "text-center", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "noborder", " " )) and (((count(preceding-sibling::*) + 1) = 8) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .)
GA<-as.vector(as.numeric(GA))

GD<-page_liga %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "text-center", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "noborder", " " )) and (((count(preceding-sibling::*) + 1) = 9) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .)
GD<-as.vector(as.numeric(GD))

poin<-page_liga %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "text-center", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "noborder", " " )) and (((count(preceding-sibling::*) + 1) = 10) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .)
poin<-as.vector(as.numeric(poin))

liga1<-data.frame(
  team,
  menang,
  kalah,
  seri,
  GF,
  GA,
  GD,
  poin
)
liga1

pilih <- sample(1:18, 1, replace=FALSE)
liga1 <- liga1[pilih,]

message('Input Data to MongoDB Atlas')
atlas_conn <- mongo(
  collection = Sys.getenv("ATLAS_COLLECTION"),
  db         = Sys.getenv("ATLAS_DB"),
  url        = Sys.getenv("ATLAS_URL")
)

atlas_conn$insert(liga1)
rm(atlas_conn)