library(lubridate)

download_unzip_data <- function() {
  ## Download and unzip the dataset:
  filename <- "dataset.zip"
  if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, filename, method="curl")
  }  
  if (!file.exists("")) { 
    unzip(filename) 
  }
}

get_data <- function(){
  download_unzip_data()
  power_data <- read.table("./household_power_consumption.txt", header = TRUE, 
                           sep = ";", stringsAsFactors = FALSE)
  power_data$datetime <- paste(power_data$Date, power_data$Time)
  power_data$datetime <- dmy_hms(power_data$datetime)
  power_data <- power_data[(power_data$datetime >= ymd("2007-02-01") 
                            & power_data$datetime < ymd("2007-02-03")),]
  power_data[,3:9] <- sapply(power_data[,3:9], as.numeric)
  
  power_data
}