createPlot1<-function() {
  source("getDataFrame_household_power_consumption.R")
  xdata<-getDataFrame_household_power_consumption()
  #4. plot1
  png(filename = "plot1.png",width = 480,height = 480)
  hist(xdata$Global_active_power,col = "red",xlab = "Global active power (kilowattes)", main = "Global Active Power")
  dev.off()
}
