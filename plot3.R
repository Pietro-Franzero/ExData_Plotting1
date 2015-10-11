# Assignment 1 - Plot 3

## Read the data
data <- read.table("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")

##Convert date and time to POSIXlt
new_data <- data.frame(DateTime = strptime(paste(data$Date,data$Time, sep = ""), "%d/%m/%Y %T"),Global_active_power = data$Global_active_power, Global_reactive_power = data$Global_reactive_power, Voltage = data$Voltage, Global_intensity = data$Global_intensity, Sub_metering_1 = data$Sub_metering_1,Sub_metering_2 = data$Sub_metering_2, Sub_metering_3 = data$Sub_metering_3)

##Subset data to dates 2007-02-01 and 2007-02-02
actual_data <- new_data[(new_data$DateTime >= "2007-02-01 00:00:00" & new_data$DateTime < "2007-02-03 00:00:00"),]

#Make plot 3
png(file = "plot3.png", width = 480, height = 480)
plot(actual_data$DateTime, actual_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(actual_data$DateTime, actual_data$Sub_metering_1, col = "black")
lines(actual_data$DateTime, actual_data$Sub_metering_2, col = "red")
lines(actual_data$DateTime, actual_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))
dev.off()