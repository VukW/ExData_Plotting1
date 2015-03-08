getDataFrame_household_power_consumption<-function () {
  #1. download files if not exists
  if (!file.exists("household_power_consumption.txt")){
    if (!file.exists("exdata-data-household_power_consumption.zip")) {
      zipURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(url = zipURL,destfile = "exdata-data-household_power_consumption.zip")
    }
    unzip(zipfile = "exdata-data-household_power_consumption.zip", overwrite = T)
  }
  #2. calculate range of lines
  #2.1 read sample (10 rows)
  colCls<- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")  
  xdata<-read.table(file = "household_power_consumption.txt",header = T, sep=";", na.strings = "?",nrows = 10,colClasses =colCls)
  xdataColNames<-colnames(xdata)
  xdata$dateTime<-strptime(x = paste(xdata$Date,xdata$Time,sep = " "), format = "%d/%m/%Y %H:%M:%S")  
  #2.2 find difference between "2007-02-02 00:00:00" and 1st row of sample (in minutes)
  firstLine<-diff(as.numeric(c(xdata$dateTime[1],strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")))) / 60
  nrowsToRead <- 60*24*2
  #3.read table
  xdata<-read.table(file = "household_power_consumption.txt",header = T, sep=";", na.strings = "?",nrows = nrowsToRead,colClasses =colCls, skip = firstLine)
  names(xdata)<-xdataColNames
  xdata$dateTime<-strptime(x = paste(xdata$Date,xdata$Time,sep = " "), format = "%d/%m/%Y %H:%M:%S")
  xdata
}