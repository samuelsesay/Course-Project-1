library(data.table)
library(sqldf)
library(lubridate)

##Getting required data using a query

data <- read.csv.sql( "/Users/mac/Desktop/household energy usage.txt ",
                     sql = "select* from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                     sep = ";")

data1 <- data
## Fixes date an time variables to right format:
f <- paste(data1$Date,data1$Time)
f <- dmy_hms(f, truncated = 3)

length(complete.cases(data))  ## 2880 complete cases equals nrows(data)

## Transparent background:
par(bg=NA)

## Generates the plot with no x axis labels:
plot(f,data$Global_active_power,xlab = " ",type = "1",
     ylab = "Global Active Power (kilowats)"   )


## Creates png file with default size = 480 x 480
dev.copy(png, file = "plot2.png")
dev.off() 