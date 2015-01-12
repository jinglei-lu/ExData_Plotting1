library(data.table)
file = "household_power_consumption.txt"
data <- fread(paste("grep ^[12]/2/2007", file), na.strings = c("?", "", "na"))
setnames(data, colnames(fread(file, nrows=0)))

png(file = "plot1.png",width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
