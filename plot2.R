library(data.table)
file = "household_power_consumption.txt"
data <- fread(paste("grep ^[12]/2/2007", file), na.strings = c("?", "", "na"))
setnames(data, colnames(fread(file, nrows=0)))
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
formatted_time = strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
data2<- cbind(f_time = formatted_time, data)

png(file = "plot2.png",width = 480, height = 480, units = "px")
plot(data2$f_time, data2$Global_active_power, type = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data2$f_time, data2$Global_active_power)
dev.off()




