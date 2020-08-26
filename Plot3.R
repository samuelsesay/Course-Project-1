library(data.table)
library(sqldf)
library(lubridate)
 

##Getting required data using a query

data <- read.csv.sql("/Users/mac/Desktop/household energy usage",
                     sql = "select* from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                     sep = ";")

data1 <- data
## Fixes date an time variables to right format:
f <- paste(data1$Date,data1$Time)
f <- dmy_hms(f, truncated = 3)

length(complete.cases(data))  ## 2880 complete cases equals nrows(data)

## Transparent background:
par(bg=NA)


plot.new()
## Generates the plot with no x axis labels:
plot(f,data$Sub_metering_1,xlab = " ",type = "l",
     ylab = "Energy sub metering")
lines(f,data$Sub_metering_2,col="red")
lines(f,data$Sub_metering_3, col="blue")

legend("topright", lwd=c(2,2) ,col = c("black", "red", "blue"),
       inset=c(0,0),cex = 0.8 ,adj=c(0,0),text.width = strwidth("Sub_metering_3"),
       y.intersp = 0.8,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Creates png file with default size = 480 x 480
dev.copy(png, file = "plot3.png")
dev.off() 