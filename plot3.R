library(data.table)
file = "household_power_consumption.txt"
data <- fread(paste("grep ^[12]/2/2007", file), na.strings = c("?", "", "na"))
setnames(data, colnames(fread(file, nrows=0)))
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
formatted_time = strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
data2<- cbind(f_time = formatted_time, data)

png(file = "plot3.png",width = 480, height = 480, units = "px")
plot(data2$f_time, data2$Global_active_power, type = "n",
     xlab = "", ylab = "Energy sub metering", ylim = c(0,38))
lines(data2$f_time, data2$Sub_metering_1, col = 'black')
lines(data2$f_time, data2$Sub_metering_2, col = 'red')
lines(data2$f_time, data2$Sub_metering_3, col = 'blue')

legend(x="topright",pch = c(NA, NA, NA), lwd=2, lty = 1,col = c("black", 'red', "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()




