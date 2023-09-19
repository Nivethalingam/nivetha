library(rvest)
library(dplyr)
library(robotstxt)
library(stringrr)
# SCRAPING WEBSITE
link = "https://play.google.com/store/movies?hl=en_IN&gl=US"
#HTML ELEMENTS FROM WEBSITES
web = read_html(link)
# SGREGATING NAME
name = web %>% html_nodes(".Epkrse") %>% html_text()
View(name)
#SEGREGATING PRICE
price = web %>% html_nodes(".VixbEe") %>% html_text()
View(price)
#SEGREGATE RATING
rating = web %>% html_node(".LrNMN:nth-child(1)") %>% html_text()
View(rating)
#CREATING DATAFRAME
movies = data.frame(name, price, rating, stringsAsFactors = FALSE)
View(movies)
#EXPORT DATAFRAME
write.csv(movies, "movies.csv")
