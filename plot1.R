## Read in data and subset data
data_all <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)
data_plot <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
data_plot$Date <- as.Date(data_plot$Date, format = "%d/%m/%Y")
data_plot$DateTime <- strptime(paste(data_plot$Date, data_plot$Time), "%Y-%m-%d %H:%M:%S")

## Plot 1
hist(data_plot$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
