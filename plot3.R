library("readr")

## Bringing in the data as a data frame 
epc_data <- read_csv2("household_power_consumption.txt", col_names = TRUE)

FullTimeDate <- strptime(paste(epc_data$Date, epc_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
epc_data <- cbind(epc_data, FullTimeDate)

epc_data$Date <- as.Date(epc_data$Date, format="%d/%m/%Y")
epc_data$Time <- format(epc_data$Time, format="%H:%M:%S")
epc_data$Global_active_power <- as.numeric(epc_data$Global_active_power)
epc_data$Global_reactive_power <- as.numeric(epc_data$Global_reactive_power)
epc_data$Voltage <- as.numeric(epc_data$Voltage)
epc_data$Global_intensity <- as.numeric(epc_data$Global_intensity)
epc_data$Sub_metering_1 <- as.numeric(epc_data$Sub_metering_1)
epc_data$Sub_metering_2 <- as.numeric(epc_data$Sub_metering_2)
epc_data$Sub_metering_3 <- as.numeric(epc_data$Sub_metering_3)

new_data <- subset(epc_data, Date == "2007-02-01" | Date =="2007-02-02")

png("plot3.png", width=480, height=480)
with(new_data, plot(FullTimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(new_data$FullTimeDate, new_data$Sub_metering_2,type="l", col= "red")
lines(new_data$FullTimeDate, new_data$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()