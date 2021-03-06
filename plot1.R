## plot1.R script - Creates the plot1 from "Electric Power Consumption" data file
## Data file location -
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Get data file
## Load into data frame
## Subset to dates - 2007-02-01 and 2007-02-02

## Step 1 - check if data folder already exists to download file
if (!file.exists("data")) {
  dir.create("data")
} else {
  print("Folder data exists!")
}

## Step 2 - Download the Zip file to local "data" folder
fileURL <- c("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
download.file(fileURL, destfile = ".\\data\\household_power_consumption.zip")

## Step 3 - Extract the files present in the Zip file
zipFile <- c(".\\data\\household_power_consumption.zip")
unzip(zipFile, exdir = ".\\data")

## Step 4 - Load the data files into data frames
pwrTab <- read.table(dataFile, header = TRUE, na.strings = "?", stringsAsFactors = FALSE, sep = ";")

## Step 5 - Subset the data from steo 5 above for the required date range
sPwr <- subset(pwrTab, as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

## Step 6 - Set png attributes to required width,height and Plot the histogram 
##          for the "Global_active_power" column and turn off device
png(filename = "data/plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA, restoreConsole = TRUE)
hist(sPwr$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()