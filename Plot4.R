library(data.table)
library(sqldf)
library(lubridate)

##Getting required data using a query

data <- read.csv.sql("/Users/mac/Desktop/household energy usage.txt",
                     sql = "select* from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                     sep = ";")
data1 <- data

## Fixes date an time variables to right format:
f <- paste(data1$Date,data1$Time)
f <- dmy_hms(f, truncated = 3)

length(complete.cases(data))  ## 2880 complete cases equals nrows(data)

plot.new()

par(mfrow = c(2, 2), bg =NA,
    mar = c(4, 5, 3, 2),
    oma = c(1, 0, 1,0)
)

##plot1
plot(f,data$Global_active_power,xlab = "",type = "l",
     ylab = "Global Active Power")

##plot2
plot(f,data$Voltage,xlab = "datetime",type = "l",
     ylab = "Voltage")

##plot3
plot(f,data$Sub_metering_1,xlab = "",type = "l",
     ylab = "Energy sub metering")
lines(f,data$Sub_metering_2,col="red")
lines(f,data$Sub_metering_3, col="blue")
legend("topright", lwd=c(2,2) ,col = c("black", "red", "blue"),
       cex = 0.5,
       # text.width = strwidth("Sub_metering_3"),
       y.intersp = 0.4,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##plot4
plot(f,data$Global_reactive_power,xlab = "datetime",type = "l",
     ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off() 