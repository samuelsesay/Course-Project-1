library(data.table)
library(sqldf)
library(lubridate)
getwd()

##Getting required data using a query

data <- read.csv.sql("/Users/mac/Desktop/household energy usage.txt",
                     sql = "select* from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                     sep = ";")


## Fixes date an time variables to right format:
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)


length(complete.cases(data))  ## 2880 complete cases equals nrows(data)

par(bg=NA)

## Generates the histogram with color, title and labels:
hist(data$Global_active_power,col="orangered2",
     xlab="Global Active Power (kilowats)",   
     main="Global Active Power", bg = NA
)

## Creates png file with default size = 480 x 480
dev.copy(png, file = "plot1.png")
dev.off()
