## Read in data and subset data
data_all <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)
data_plot <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
data_plot$Date <- as.Date(data_plot$Date, format = "%d/%m/%Y")
data_plot$DateTime <- strptime(paste(data_plot$Date, data_plot$Time), "%Y-%m-%d %H:%M:%S")

## Plot 4
par(mfrow=c(2,2))
plot(data_plot$DateTime,data_plot$Global_active_power,type = "l",
     ylab="Global Active Power",xlab="")
plot(data_plot$DateTime, data_plot$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(data_plot$DateTime, data_plot$Sub_metering_1,type = "l",
     ylab = "Energy sub metering",xlab = "")
lines(data_plot$DateTime, data_plot$Sub_metering_2, col = "red")
lines(data_plot$DateTime, data_plot$Sub_metering_3, col = "blue")
legend("topright",col=c("black", "red", "blue"), lty = 1, bty = "n",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), y.intersp = 0.3,x.intersp = 0.3,text.width = 80000)
plot(data_plot$DateTime, data_plot$Global_reactive_power, type="l", 
     ylab="Global_reactive_power",xlab="datetime")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()