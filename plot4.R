createPlot4<-function() {
  source("getDataFrame_household_power_consumption.R")
  xdata<-getDataFrame_household_power_consumption()
  #4. plot4
  png(filename = "plot4.png",width = 480,height = 480)
  par(mfcol = c(2,2))
  
  #plot 4.1
  plot(xdata$Global_active_power, type = "l", xaxt = "n", xlab = '', ylab = "Global Active Power (kilowattes)")
  axis(side = 1, at = c(0,60*24, 60*24*2), labels= c("Thu","Fri","Sat"))
    
  #plot 4.2
  plot(xdata$Sub_metering_1, type = "n", xaxt = "n", xlab = '', ylab = "Energy sub metering")
  axis(side = 1, at = c(0,60*24, 60*24*2), labels= c("Thu","Fri","Sat"))
  points(x = xdata$Sub_metering_1, col = "darkgrey", type = "l")
  points(x = xdata$Sub_metering_2, col = "red", type = "l")
  points(x = xdata$Sub_metering_3, col = "blue", type = "l")  
  legend("topright", legend = c("Sub_metering_1", "sub_metering_2", "Sub_metering_3"),col = c("darkgray", "red", "blue"), lty=c(1,1), bty = "n")  
  
  #plot 4.3
  plot(xdata$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
  axis(side = 1, at = c(0,60*24, 60*24*2), labels= c("Thu","Fri","Sat"))

  #plot 4.4
  plot(xdata$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
  axis(side = 1, at = c(0,60*24, 60*24*2), labels= c("Thu","Fri","Sat"))
    
  dev.off()
}
