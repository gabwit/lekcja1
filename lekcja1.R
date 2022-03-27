#2. Pobierz dane pogodowe z REST API

install.packages("httr")
install.packages("jsonlite")

library(httr)
library(jsonlite)
#require(httr)

endpoint <- "https://api.openweathermap.org/data/2.5/weather?q=Warszawa&appid=1765994b51ed366c506d5dc0d0b07b77"
getweather <- GET(endpoint)
weatherText <- content(getweather,"text")
View(weatherText)
weatherJSON <- fromJSON(weatherText)

wdf <- as.data.frame(weatherJSON)
View(wdf)

#1. Wczytaj plik autaSmall.csv i wypisz pierwsze 5 wierszy

df <- read.csv("./autaSmall.csv")
View(head(df,5))

#3.Napisz funckję zapisującą porcjami danych plik csv do tabeli  w SQLite
#Mały przykład - autaSmall.csv

#read table
#file connection
#pętla
#instrukcja warunkowa
#polaczenie z baza danych SQLite
#wczytujemy porcjami 100 pierwszych wierszy

df <- read.table('autaSmall.csv', sep=',', header=TRUE, fileEncoding='utf-8')
str(df)

install.packages("DBI")
install.packages("RSQLite")

#instalacja kilku paczek naraz to install.packages(c("DBI","RSQLite"))

library(DBI)
library(RSQLite)

#DBI::dbWriteTable()

dbWriteTable()
?dbWriteTable

db_con <- dbConnect(RSQLite::SQLite(), "SQL_lite")

dbWriteTable(db_con, "table", df)
dbReadTable(db_con, "table")

dbDisconnect(db_con)


#czytanie danych porcjami 

fileConnection <- file(description = "autaSmall.csv", open="r")

View(read.table(fileConnection, nrows = 10, header=TRUE,fill = TRUE, sep=","))

df1 <- read.table(fileConnection, nrows = 10, header=TRUE,fill = TRUE, sep=",", append=TRUE) 

#dbWriteTable(db_con,"table",df)

myColnames  <-  names(df1)

df2 <- read.table(fileConnection, nrows = 10, col.names=myColnames,fill = TRUE, sep=",") 

View(df2)

#zawsze musimy przerwać na końcu funkcję

close(fileConnection)


i  <- 1
repeat{
  print(i)
  if (i==20)
      break
  i <- i+1
}



dbConn <- dbConnect(RSQLite::SQLite(), "auta.sqlite")
filepath <- "./autaSmall.csv"
tablename <- "mojeAuta"



readToBase <-function (filepath,dbConn,tablename,size,sep=",",header=TRUE,delete=TRUE)
{
  
  fileConnection <- file(description=filepath,open="r")
  autadf <- read.table(fileConnection, nrows=10,header=TRUE,fill=TRUE,sep=",",fileEncoding='utf-8')
  colNames <- names(autadf1)
  dbWriteTable(dbConn,tablename,autadf)
  
  repeat{
    rowNumber <- nrow(autadf)
    if(rowNumber==0)
      dbDisconnect(dbConn)
    close(fileConnection)
    break
    autadf <- read.table(fileConnection, nrows=10,col.names=colNames,fill=TRUE,sep=",")
    dbWriteTable(dbConn,tablename,autadf)
  }
}

con <- dbConnect(SQLite(), "auta.sqlite")
readToBase("./autaSmall.csv", con, "auta2", size=1000)

#Swagger UI ,mozna urzyc JASONA do wywolania tych zapytań 

http://54.37.136.190:8000/__docs__/

http://54.37.136.190:8000/__docs__/
  
#hhtps://sqlitebrowser.org/

con <- dbConnect( SQLite(), "auta.sqlite")
res <- dbSendQuery(con,"SELECT * FROM tabela")
zBazy <- dbFetch(res)
dbClearResult(res)
dbDisconnect(con)

fromJSON("http://54.37.136.190:8000/row?id=10000000")

#4.Napisz funkcję znajdującą tydzień obserwacji z największą średnią ceną ofert korzystając z zapytania SQL.

#5. Podobnie jak w poprzednim zadaniu napisz funkcję znajdującą tydzień obserwacji z największą średnią ceną ofert  tym razem wykorzystując REST api.