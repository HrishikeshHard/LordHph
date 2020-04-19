## Download the zip file and unzip it. 
## Read the txt file as a data frame/tibble in your project. 
## Creating Housedata tibble from given data 

Housedata <- read.table(file = "household_power_consumption.txt", header = TRUE, 
                        sep = ";", stringsAsFactors = FALSE)
## Load tibble package (can be skipped. I am doing it 'cause I like it ;)
library(tibble) 
Housedata <- as_tibble(Housedata)

## Subsetting observations only for the two days 1/2/2007 & 2/2/2007. DO NOT make 
## date as 01/02/2007. Introducing zero will give you table with 0 observations.

SubHousedata <- subset(Housedata, Date == "1/2/2007" | Date == "2/2/2007")

## Reproducing first plot.
## Pull up the top view of tibble by using head command. Note that "Global_active_power"
## is a character variable. We need to convert it to a numeric variable, then only a 
## histogram can be plotted.

## Turn on png device. Always turn off after the work is done. 

png("Plot1.png", width = 480, height = 480)

## This can be done by either calling requisite functions withing one single function, 
## or by getting a numeric vector first. Both ways are included. 

## By creating a vector 

Global_Active_Power <- as.numeric(SubHousedata$Global_active_power)

## Histogram should be red in colour and annotated as shown in sample. 

hist(Global_Active_Power, xlab = "Global Active Power(kilowatts)", 
       main = "Global Active Power",  
       col = "red")

## By calling all functions at once 

hist(as.numeric(SubHousedata$Global_active_power), col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Gobal Active Power")

## Turn of the device.

dev.off()