createPlot2<-function() {
  source("getDataFrame_household_power_consumption.R")
  xdata<-getDataFrame_household_power_consumption()
  #4. plot2
  png(filename = "plot2.png",width = 480,height = 480)
  plot(xdata$Global_active_power, type = "l", xaxt = "n", xlab = '', ylab = "Global Active Power (kilowattes)")
  axis(side = 1, at = c(0,60*24, 60*24*2), labels= c("Thu","Fri","Sat"))
  dev.off()
}
